#include "script_component.hpp"

//players only
if (true) then {
  waitUntil {!isNull player}; //&& !isNil QGVAR(AdminList)

  player setVariable [QGVAR(MapMonitorEnabled), false];

  player setVariable [QGVAR(PlayerListGroupWhitelist), [west,east,resistance,civilian]];
  player setVariable [QGVAR(PlayerListIncludeAI), true];
  

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
