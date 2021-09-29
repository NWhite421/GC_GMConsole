// class Extended_PreInit_EventHandlers {
//   class ADDON {
//     init = "call compile preProcessFileLineNumbers 'XEH_PreInit.sqf';";
//   };
// };


class Extended_Init_EventHandlers {
  class CAManBase {
    class ADDON {
      init = "call compile preProcessFileLineNumbers 'XEH_Init.sqf';";
    };
  };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = "call compile preProcessFileLineNumbers 'XEH_PostInit_Client.sqf';";
    };
};
