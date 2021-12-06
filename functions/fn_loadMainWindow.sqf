#include "..\script_component.hpp"
#include "..\gui\guiMacros.hpp"

disableSerialization;

params ["_player", "_args"];
_args params ["_control"];

systemChat _fnc_scriptName;

_headerColor = ["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet;
_headerTextColor = ["GUI", "TITLETEXT_RGB"] call BIS_fnc_displayColorGet;
_colorBlufor = ["Map", "BLUFOR"] call BIS_fnc_displayColorGet;
_colorRedfor = ["Map", "OPFOR"] call BIS_fnc_displayColorGet;
_colorIndfor = ["Map", "Independent"] call BIS_fnc_displayColorGet;
_colorCivfor = ["Map", "Civilian"] call BIS_fnc_displayColorGet;

{
    (_control displayCtrl _x) ctrlSetBackgroundColor _headerColor;
    (_control displayCtrl _x) ctrlSetTextColor _headerTextColor;
} forEach [
  IDC_NBW_GM_TITLE,
  IDC_NBW_GM_PLAYERS_TITLE,
  IDC_NBW_GM_MAPPROPERTIES_TITLE,
  IDC_NBW_GM_PLAYERS_TITLE,
  IDC_NBW_GM_ACTIONS_TITLE,
  IDC_NBW_GM_GEAR_TITLE,
  IDC_NBW_GM_FUNCTIONS_TITLE
];

{
    (_control displayCtrl _x) ctrlSetBackgroundColor [0,0,0,0.4];
} forEach [
  IDC_NBW_GM_BACK,
  IDC_NBW_GM_BG_MAPINFO,
  IDC_NBW_GM_BG_PLAYERS,
  IDC_NBW_GM_BG_ACTIONS,
  IDC_NBW_GM_BG_GEAR,
  IDC_NBW_GM_BG_FUNCTIONS
];

if (GETVAR(_player, MapStatus, 0) == 0) then {
  (_control displayCtrl IDC_NBW_GM_MAP) ctrlShow false;
} else {
  (_control displayCtrl IDC_NBW_GM_MAP_NOTEXTURE) ctrlShow false;
};

if (GETVAR(player, MapMonitor, false)) then {
  [IDC_NBW_GM_MAP_NOTEXTURE, 21092701] call FUNC(ShowIconOnMap);
  [IDC_NBW_GM_MAP, 21092701] call FUNC(ShowIconOnMap);
};

[_control, IDC_NBW_GM_PLAYERS_FILTER_BLUFOR, _colorBlufor] call FUNC(SetButtonColor);
[_control, IDC_NBW_GM_PLAYERS_FILTER_OPFOR, _colorRedfor] call FUNC(SetButtonColor);
[_control, IDC_NBW_GM_PLAYERS_FILTER_INDFOR, _colorIndfor] call FUNC(SetButtonColor);
[_control, IDC_NBW_GM_PLAYERS_FILTER_CIVFOR, _colorCivfor] call FUNC(SetButtonColor);
[_control, IDC_NBW_GM_PLAYERS_FILTER_INCLUDEAI, [0,0,0,0.6]] call FUNC(SetButtonColor);

(_control displayCtrl IDC_NBW_GM_PLAYERS_LIST_SORTER) lnbAddRow ["Side", "Rank", "Name"];

_playerList = (_control displayCtrl IDC_NBW_GM_PLAYERS_LIST);
_whiteList = player getVariable QGVAR(PlayerListGroupWhitelist);
_includeAI = player getVariable QGVAR(PlayerListIncludeAI);
[_playerList, _whiteList, _includeAI] call FUNC(populatePlayerList);

// {
//   _color = [_x] call IFunc_GetUnitColor;
//   _rankImage = [_x,"texture"] call BIS_fnc_rankParams;
//   (_control displayCtrl IDC_NBW_GM_PLAYERS_LIST) lnbAddRow ["", "", name _x];
//   (_control displayCtrl IDC_NBW_GM_PLAYERS_LIST) lnbSetPicture [[_forEachIndex,0],_color];
//   (_control displayCtrl IDC_NBW_GM_PLAYERS_LIST) lnbSetPicture [[_forEachIndex,1],_rankImage];
// } forEach allUnits;


[
  (_control displayCtrl IDC_NBW_GM_PLAYERS_LIST_SORTER),
  (_control displayCtrl IDC_NBW_GM_PLAYERS_LIST)
] call BIS_fnc_initListNBoxSorting;
