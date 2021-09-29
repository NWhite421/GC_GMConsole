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
    "$STR_A3_nbw_keybind_OpenConsole",
    {call FUNC(OpenConsole)},
    {},
    [DIK_APPS, [false, false, false]]
  ] call CBA_fnc_addKeybind;

  // ACE Actions
  // GM Console
  // TODO: Impliment GM Access showing category
  _actionCategory = [QGVAR(GMCategory), (localize "STR_A3_nbw_ace_GMConsole"), "", {}, {true}] call ace_interact_menu_fnc_createAction;
  _openMenu = [QGVAR(GMOpenConsole), (localize "STR_A3_nbw_ace_OpenConsole"), "", {call FUNC(OpenConsole);}, {true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions"], _actionCategory] call ace_interact_menu_fnc_addActionToObject;
    [player, 1, ["ACE_SelfActions", QGVAR(GMCategory)], _openMenu] call ace_interact_menu_fnc_addActionToObject;
};
