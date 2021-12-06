#include "..\script_component.hpp"

if (dialog) then {
  closeDialog 0;
}
else {
  createDialog QGVAR(MainConsole);
}
