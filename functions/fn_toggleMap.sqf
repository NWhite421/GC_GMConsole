#include "..\script_component.hpp"
#include "..\gui\guiMacros.hpp"

disableSerialization;

params ["_player", "_args"];
_args params ["_sender"];

systemChat "fn_toggleMap";

_control = ctrlParent _sender;

_mapNT = (_control displayCtrl IDC_NBW_GM_MAP_NOTEXTURE);
_map = (_control displayCtrl IDC_NBW_GM_MAP);

_mapNT ctrlShow (!ctrlShown _mapNT);
_map ctrlShow (!ctrlShown _map);

_x = 0.0617187 * safezoneW + safezoneX;
_y = 0.093 * safezoneH + safezoneY;
_w = 0.366094 * safezoneW;
_h = 0.660 * safezoneH;
_centerX = (_x + (_w /2));
_centerY = (_y + (_h /2));

if (ctrlShown _mapNT) then {
  _mapCenter = _map ctrlMapScreenToWorld [_centerX, _centerY];
  _mapNT ctrlMapAnimAdd [0, ctrlMapScale _map, _mapCenter];
  ctrlMapAnimCommit _mapNT;
  SETVAR(_player, MapStatus, 0);
} else {
  _mapCenter = _mapNT ctrlMapScreenToWorld [_centerX, _centerY];
  _map ctrlMapAnimAdd [0, ctrlMapScale _mapNT, _mapCenter];
  ctrlMapAnimCommit _map;
  SETVAR(_player, MapStatus, 1);
};
