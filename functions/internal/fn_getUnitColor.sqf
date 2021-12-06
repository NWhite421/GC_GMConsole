// File: fn_getUnitColor.sqf
// Project: functions
// Created date: 2021 10 03 - 11:39:79AM 
// Author: Nathan (ThatFloridaMan)
// ----
// Last Modified:
// Modified By:
// ----
// Description
//   Returns the GUI color of the specific side.
// 
// Parameters
//   0 - Unit - Unit to get the side color for.
//   1 - Format - 0=Array with alpha; 1=string format for texture.
// 
// Function is public: 



params [
	["_unit", objNull, [objNull]],
	["_format", 0]
];

systemChat _fnc_scriptName;

if (isNull _unit || (_format > 1 && _format < 0)) exitWith {
	["The params passed were not valid."] call BIS_fnc_error;
};

_color = switch (side _unit) do {
	case west: {["Map", "BLUFOR"] call BIS_fnc_displayColorGet};
	case east: {["Map", "OPFOR"] call BIS_fnc_displayColorGet};
	case independent: {["Map", "Independent"] call BIS_fnc_displayColorGet};
	case civilian: {["Map", "Civilian"] call BIS_fnc_displayColorGet};
	default {["Map", "Unknown"] call BIS_fnc_displayColorGet};
};

switch (_format) do {
	case 1: {
		_color call BIS_fnc_colorRGBAtoTexture;
	 };
	default {
		_color;
	 };
};