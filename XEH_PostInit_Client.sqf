#include "script_component.hpp"

//players only
if (true) then {
  waitUntil {!isNull player}; //&& !isNil QGVAR(AdminList)

  SETVAR(player, MapStatus, 0);
  SETVAR(player, MapMonitor, false);

  // Settings

  // Keybinds
  [
    COMPONENT_NAME,
    QGVAR(OpenMenu),
    CSTRING(OpenConsole),
    {call FUNC(OpenConsole)},
    {},
    [DIK_APPS, [false, false, false]]
  ] call CBA_fnc_addKeybind;

  // ACE Actions
  // GM Console
  // TODO: Impliment GM Access showing category
  _actionCategory = [QGVAR(GMCategory), localize LSTRING(GameModerator), "", {}, {true}] call ace_interact_menu_fnc_createAction;
  _openMenu = [QGVAR(GMOpenConsole), localize LSTRING(OpenConsole), "", {call FUNC(OpenConsole);}, {true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions"], _actionCategory] call ace_interact_menu_fnc_addActionToObject;
  [player, 1, ["ACE_SelfActions", QGVAR(GMCategory)], _openMenu] call ace_interact_menu_fnc_addActionToObject;
    
};

["CBA_SettingChanged", {
    params ["_setting", "_value"];
	  if ((_setting find "gmc_main") == -1) exitWith {};
	  player setVariable [_setting, _value];
    systemChat format ["%1 = %2", _setting, _value];
	copyToClipboard str _setting;
}] call CBA_fnc_addEventHandler;
