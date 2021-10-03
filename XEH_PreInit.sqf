#include "script_component.hpp"

// CBA Settings
// Map Monitor
// Man icon size.
[
	QGVAR(MapMonitor_ManIconSize),	"List",
	[LSTRING(ManIconTitle), LSTRING(ManIconToolTip)],	[COMPONENT_NAME, LSTRING(MapMonitor)],
	[[2, 3, 4, 5, -1], ["Small", "Normal", "Large", "Extra Large", "Static"], 1], 0,
	{diag_log str this; player setVariable [QGVAR(MapMonitor_ManIconSize), (this select 0)];},
	false
] call CBA_fnc_addSetting;

// Vehicle icon size.
[
	QGVAR(MapMonitor_VehicleIconSize),	"List",
	[LSTRING(VehicleIconTitle), LSTRING(VehicleIconToolTip)],	[COMPONENT_NAME, LSTRING(MapMonitor)],
	[[6, 7, 8, 9, -1], ["Small", "Normal", "Large", "Extra Large", "Static"], 1], 0,
	{player setVariable [QGVAR(MapMonitor_VehicleIconSize), (this select 0)];},
	false
] call CBA_fnc_addSetting;

// Text size
[
	QGVAR(MapMonitor_TextSize), "List",
	[LSTRING(TextSizeTitle), LSTRING(TextSizeTooltip)], [COMPONENT_NAME, LSTRING(MapMonitor)],
	[[0.015, 0.02, 0.025, 0.03, 1], ["Small", "Normal", "Large", "Extra Large", "Static"], 1], 0,
	{player setVariable [QGVAR(MapMonitor_TextSize), (this select 0)];},
	false
] call CBA_fnc_addSetting;

// unconscious state color
[
	QGVAR(MapMonitor_Unconscious), "Color",
	[LSTRING(InjuredColorTitle), LSTRING(InjuredColorTooltip)], [COMPONENT_NAME, LSTRING(MapMonitor)],
	[0.85,0.5,0.1], 0,
	{player setVariable [QGVAR(MapMonitor_Unconscious), (this select 0)];},
	false
] call CBA_fnc_addSetting;

["CBA_SettingChanged", {
    params ["_setting", "_value"];
	if ((_setting find "gmc_main") == -1) exitWith {};
	SETPVAR(_setting, _value);
    systemChat format ["%1 = %2", _setting, _value];
	copyToClipboard str _setting;
}] call CBA_fnc_addEventHandler;
