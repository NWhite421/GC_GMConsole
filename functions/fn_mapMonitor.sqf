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

  _map = (findDisplay _display) displayCtrl _control;

  if (isNull _map) exitWith {
    ["The display %1 with idd %2 did not return a control.", _display, _control] call BIS_fnc_error;
  };

  _handle = _map ctrlAddEventHandler ["Draw", 
  {  
    //hintSilent format ["%1 - %2\n%3 - %4", QGVAR(MapMonitor_ManIconSize), _textSize, QGVAR(MapMonitor_TextSize), _textSize];
    _manSize = player getVariable QGVAR(MapMonitor_ManIconSize);
    _vehSize = player getVariable QGVAR(MapMonitor_VehicleIconSize);
    _textSize = player getVariable QGVAR(MapMonitor_TextSize);
    _colorUnconscious = player getVariable QGVAR(MapMonitor_Unconscious);
    _colorUnconscious pushBack 1;
    {
      if (isNull objectParent _x) then
      // Man
      {
        if (vehicle _x isKindOf "CAManBase" && (isNull objectParent _x)) then [
        { 
          if (_x getVariable ["ACE_isUnconscious", false]) then [{
            (_this select 0) drawIcon [  
              (gettext(configFile >> "CfgVehicles" >> (typeof _x) >> "icon")),  
              _colorUnconscious,  
              getPos _x,  
              if (_manSize != -1) then [{(_mansize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {24}],  
              if (_manSize != -1) then [{(_mansize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {24}],  
              getDir _x,  
              name _x,  
              0,
              if (_textSize != 1) then [{(_textSize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {.1}] 
            ];
          },{
            (_this select 0) drawIcon [  
              (gettext(configFile >> "CfgVehicles" >> (typeof _x) >> "icon")),  
              [_x] call FUNC(GetObjectSideColor),  
              getPos _x,  
              if (_manSize != -1) then [{(_mansize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {24}],  
              if (_manSize != -1) then [{(_mansize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {24}],  
              getDir _x,  
              name _x,  
              0,
              if (_textSize != 1) then [{(_textSize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {.1}] 
            ]; 
          }]
          
        },
        {
          // Vehicles
          if (!((vehicle _x) isKindOf "Thing") && (vehicle _x) isKindOf ("AllVehicles")) then { 
            if (count (crew _x) == 0) then [{
              (_this select 0) drawIcon [  
                (gettext(configFile >> "CfgVehicles" >> (typeof _x) >> "icon")),  
                ["Map", "Unknown"] call BIS_fnc_displayColorGet,
                getPos _x,  
                if (_vehSize != -1) then [{(_vehSize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {50}],  
                if (_vehSize != -1) then [{(_vehSize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {50}], 
                getDir _x,  
                "", //TODO: Add dynamic name.
                0,
                (.02 * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))   
              ]; 
            },
            {
              (_this select 0) drawIcon [  
                (gettext(configFile >> "CfgVehicles" >> (typeof _x) >> "icon")),  
                [_x] call FUNC(GetObjectSideColor),
                getPos _x,  
                if (_vehSize != -1) then [{(_vehSize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {50}],  
                if (_vehSize != -1) then [{(_vehSize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {50}], 
                getDir _x,  
                format ["%1 +%2", name (crew _x select 0), count (crew _x) -1], //TODO: Add dynamic name.
                0,
                if (_textSize != 1) then [{(_textSize * 0.15) * 10^(abs log (ctrlMapScale (_this select 0)))}, {.1}] 
              ]; 
            }];            
          };
        }]; 
      };
    } foreach allUnits + vehicles; 
  }];
  _handles pushBack [_display, _control, _handle];
  SETVAR(player, MapMonitorHandle, _handles);
};

_handles = GETVAR(player, MapMonitorHandle, []);
_mainMap = (findDisplay 12) displayCtrl 51;
_mapNTMap = (findDisplay 21092701) displayCtrl IDC_NBW_GM_MAP_NOTEXTURE;
_gmMap = (findDisplay 21092701) displayCtrl IDC_NBW_GM_MAP;

if (count _handles == 0) then [{
  hint "Player tacker starting...";
  [51, 12] call FUNC(ShowIconOnMap);
  // [IDC_NBW_GM_MAP_NOTEXTURE, 21092701] call FUNC(ShowIconOnMap);
  // [IDC_NBW_GM_MAP, 21092701] call FUNC(ShowIconOnMap);
  //[13301, 311] call FUNC(ShowIconOnMap); //Minimap - fuck this.
  player setVariable [QGVAR(MapMonitorEnabled), true];
  hint "Player tacker started";
},
{
  hint "Player tacker ending...";
  systemChat str _handles;
  {
    // Current result is saved in variable _x
    _x params ["_display", "_control", "_handle"];
    ((findDisplay _display) displayCtrl _control) ctrlRemoveEventHandler ["Draw", _handle];
  } forEach _handles;
  SETVAR(player, MapMonitorHandle, []);
  hint "Player tacker ended";
  player setVariable [QGVAR(MapMonitorEnabled), false];
}];
