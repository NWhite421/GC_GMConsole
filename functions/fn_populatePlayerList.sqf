// File: fn_populatePlayerList.sqf
// Project: functions
// Created date: 2021 10 03 - 11:04:25AM 
// Author: Nathan (ThatFloridaMan)
// ----
// Last Modified:
// Modified By:
// ----
// Parameters
// 0 - ListNBox control - Control to update.
// 1 - Sides whitelist - An array of side that should be shown in the list.
// 2 - Include AI - True to show A.I. units in the list (and in subsequent actions); false to not include. 
//
// Function is public: no

#include "..\script_component.hpp"

params [
	["_control", controlNull, [controlNull]],
	["_sideWhitelist", [], [[]]],
	["_includeAI", false, [true]]
];

systemChat _fnc_scriptName;

if (isNull _control) exitWith {
	["No control was passed to the function."] call BIS_fnc_error;
};

lnbClear _control;

{

	if ((side _x) in _sideWhitelist) then {
		if (isPlayer _x) then [{
			_color = [_x, 1] call FUNC(getUnitColor);
  			_rankImage = [_x,"texture"] call BIS_fnc_rankParams;
			_rowId = _control lnbAddRow ["","", name _x];
			_control lnbSetPicture [[_rowId,0], _color];
			_control lnbSetPicture [[_rowId,1], _rankImage];
			_control lnbSetData [[_rowId, 0], str (side _x)];
			_control lnbSetData [[_rowId, 1], [_x,"displayName"] call BIS_fnc_rankParams];
			_control lnbSetData [[_rowId, 2], str (_x)];
		},
		{
			if (_includeAI) then {
				_color = [_x, 1] call FUNC(getUnitColor);
				_rankImage = [_x,"texture"] call BIS_fnc_rankParams;
				_rowId = _control lnbAddRow ["","", name _x + " [AI]"];
				_control lnbSetPicture [[_rowId,0], _color];
				_control lnbSetPicture [[_rowId,1], _rankImage];
				_control lnbSetData [[_rowId, 0], str (side _x)];
				_control lnbSetData [[_rowId, 1], [_x,"displayName"] call BIS_fnc_rankParams];
				_control lnbSetData [[_rowId, 2], str (_x)];
			};
		}];
	};

} foreach allUnits;