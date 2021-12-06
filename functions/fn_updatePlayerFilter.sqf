// File: fn_updatePlayerFilter.sqf
// Project: functions
// Created date: 2021 10 03 - 13:49:60PM 
// Author: Nathan (ThatFloridaMan)
// ----
// Last Modified:
// Modified By:
// ----
// Description
//   
// 
// Parameters
//   
// 
// Function is public: 

#include "..\script_component.hpp"
#include "..\gui\guiMacros.hpp"

_fnc_sendUpdateCall = {
	params [
		["_unit", objNull, [objNull]],
		["_control", controlNull, [controlNull]]
	];
	_parent = ctrlParent _control;
	_list = _parent displayCtrl IDC_NBW_GM_PLAYERS_LIST;
	_whitelist = _unit getVariable QGVAR(PlayerListGroupWhitelist);
	_includeAI = _unit getVariable QGVAR(PlayerListIncludeAI);
	[_list, _whitelist, _includeAI] call FUNC(PopulatePlayerList);
};

_fnc_updateWhitelist = {
	params [
		["_unit", objNull, [objNull]],
		["_side", nil],
		["_control", controlNull, [controlNull]]
	];

	_whitelist = _unit getVariable QGVAR(PlayerListGroupWhitelist);
	if (_side in _whitelist) then [{
		systemChat format ["Removing %1, remaining: %2", _side, _whitelist];
		_whitelist deleteAt (_whitelist find _side);
	},{
		systemChat format ["Adding %1, remaining: %2", _side, _whitelist];
		_whitelist pushBack _side;
	}];
	_unit setVariable [QGVAR(PlayerListGroupWhitelist), _whitelist];
	[_unit, _control] call _fnc_sendUpdateCall;
};

_fnc_updateAIList = {
	params [
		["_unit", objNull, [objNull]],
		["_control", controlNull, [controlNull]]
	];
	_currentSetting = _unit getVariable QGVAR(PlayerListIncludeAI);
	systemchat format ["Current status: %1", _currentSetting];
	_unit setVariable [QGVAR(PlayerListIncludeAI), !_currentSetting];

	[_unit, _control] call _fnc_sendUpdateCall;
};

params [
	["_unit", objNull, [objNull]],
	["_controlList", [controlNull], [[]]]
];

private "_control";
_control = _controlList select 0;

systemChat _fnc_scriptName;

if (isNull _unit || isNull _control) exitWith {
	["The player or control was not defined."] call BIS_fnc_error;
};

_ctrlText = ctrlText _control;

switch (_ctrlText) do {
	case LLSTRING(players_filter_blufor): {[_unit, west, _control] call _fnc_updateWhitelist};
	case LLSTRING(players_filter_opfor): {[_unit, east, _control] call _fnc_updateWhitelist};
	case LLSTRING(players_filter_indfor): {[_unit, independent, _control] call _fnc_updateWhitelist};
	case LLSTRING(players_filter_civfor): {[_unit, civilian, _control] call _fnc_updateWhitelist};
	case LLSTRING(players_filter_includeAI): {[_unit, _control] call _fnc_updateAIList};
};

false;