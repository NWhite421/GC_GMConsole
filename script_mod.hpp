#define MAINPREFIX z
#define PREFIX gmc

#define MAJOR 3
#define MINOR 0
#define PATCHLVL PRE
#define BUILD 1

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCHLVL,BUILD

#define REQUIRED_VERSION 2.04
#define REQUIRED_CBA_VERSION {3,15,5}

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(Game Moderator Console - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(Game Moderator Console - COMPONENT)
#endif

#include "\x\cba\addons\main\script_macros_common.hpp"
