#include "..\script_component.hpp"
#include "..\gui\guiMacros.hpp"

params [
  ["_interval", 1, [1]],
  ["_constantUpdate", false, [true]]
];
private [
  "_handle"
];

FUNC(GetObjectSideColor) = {
  params [
    ["_object", objNull, [objNull]]
  ];
  if (_object getVariable ["ACE_isUnconscious", false]) exitWith {[0.7,0.1,0.2,1]}; //TODO: Establish setting to set unconscious color.
  switch (side _object) do {
    case west: {["Map", "BLUFOR"] call BIS_fnc_displayColorGet};
    case east: {["Map", "OPFOR"] call BIS_fnc_displayColorGet};
    case independent: {["Map", "Independent"] call BIS_fnc_displayColorGet};
    case civilian: {["Map", "Civilian"] call BIS_fnc_displayColorGet};
    default {["Map", "Unknown"] call BIS_fnc_displayColorGet};
  };
};

FUNC(GetObjectMarker) = {
  getText (configFile >> "CfgVehicles" >> (typeof _object) >> "Icon")
};

FUNC(ShowIconOnMap) = {
  params ["_control", "_display"];

  _handle = (findDisplay _display) displayCtrl _control ctrlAddEventHandler ["Draw", {  
    {if (vehicle _x isKindOf "CAManBase") then { 
      (_this select 0) drawIcon [  
        (gettext(configFile >> "CfgVehicles" >> (typeof _x) >> "icon")),  
        [_x] call FUNC(GetObjectSideColor),  
        getPos _x,  
        24,  
        24,  
        getDir _x,  
        name _x,  
        0   
      ]; 
      } else {  
        if ((vehicle _x) isKindOf (typeOf _x)) then { 
          (_this select 0) drawIcon [  
            (gettext(configFile >> "CfgVehicles" >> (typeof _x) >> "icon")),  
            [_x] call FUNC(GetObjectSideColor),
            getPos _x,  
            24,  
            24,  
            getDir _x,  
            "Player Vehicle",  
            0   
          ]; 
        }; 
      }; 
    } foreach allUnits + vehicles; 
  }];
  _handle;
};

_handles = GETVAR(player, MapMonitorHandle, []);
_mainMap = (findDisplay 12) displayCtrl 51;
_mapNTMap = (findDisplay 21092701) displayCtrl IDC_NBW_GM_MAP_NOTEXTURE;
_gmMap = (findDisplay 21092701) displayCtrl IDC_NBW_GM_MAP;

if (count _handles == 0) then {
  hint "Player tacker starting...";
  {
    _mainMapHandle = [51, 12] call FUNC(ShowIconOnMap);
    _mapNTHandle = [IDC_NBW_GM_MAP_NOTEXTURE, 21092701] call FUNC(ShowIconOnMap);
    _mapHandle = [IDC_NBW_GM_MAP, 21092701] call FUNC(ShowIconOnMap);
    _handles pushBack [[_mainMap, _mainMapHandle], [_mapNTMap, _mapNTHandle], [_gmMap, _mapHandle]]
  } foreach [allUnits + vehicles];
  hint "Player tacker started";
  
} 
else 
{
  hint "Player tacker ending...";
  {
    (_x select 0) removeEventHandler ["Draw", (_this select 1)];
  } foreach _handles;
  hint "Player tacker ended";
};
