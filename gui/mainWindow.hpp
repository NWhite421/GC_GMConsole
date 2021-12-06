class GVAR(MainConsole) {
  idd = 21092701;
  enableSimulation = 1;
	MovingEnabled = 0;
	name = QGVAR(MainConsole);
	onLoad = QUOTE([ARR_2(player,_this)] call FUNC(LoadMainWindow));
	onUnload = "true;";
  class controls {
    ////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Nathan, v1.063, #Nihiwe)
////////////////////////////////////////////////////////

    class nbw_gm_back: IGUIBack
    {
    	idc = IDC_NBW_GM_BACK;
    	x = 0.0565625 * safezoneW + safezoneX;
    	y = 0.06 * safezoneH + safezoneY;
    	w = 0.892031 * safezoneW;
    	h = 0.869 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class nbw_gm_Title: RscText
    {
    	idc = IDC_NBW_GM_TITLE;
    	text = CSTRING(Title);
    	x = 0.0565625 * safezoneW + safezoneX;
    	y = 0.06 * safezoneH + safezoneY;
    	w = 0.876562 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {1,1,1,1};
    };
    class nbw_gm_close: RscButton
    {
    	idc = IDC_NBW_GM_CLOSE;
    	text = CSTRING(close);
    	x = 0.933125 * safezoneW + safezoneX;
    	y = 0.06 * safezoneH + safezoneY;
    	w = 0.0154688 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorText[] = {1,1,1,1};
    	colorBackground[] = {1,0,0,1};
    	colorBackgroundActive[] = {1,0,0,1};
    	colorFocused[] = {1,0,0,1};
      onButtonClick = "closeDialog 0; true;";
    };
    class nbw_gm_map: RscMapControl
    {
    	idc = IDC_NBW_GM_MAP;
    	x = 0.0617187 * safezoneW + safezoneX;
    	y = 0.093 * safezoneH + safezoneY;
    	w = 0.366094 * safezoneW;
    	h = 0.660 * safezoneH;
    };
    class nbw_gm_map_noTexture: RscMapControl_NoTexture
    {
    	idc = IDC_NBW_GM_MAP_NOTEXTURE;
    	x = 0.0617187 * safezoneW + safezoneX;
    	y = 0.093 * safezoneH + safezoneY;
    	w = 0.366094 * safezoneW;
    	h = 0.660 * safezoneH;
    };
    class nbw_gm_map_mapMonitor: RscButton
    {
    	idc = IDC_NBW_GM_MAP_MAPMONITOR;
    	text = CSTRING(MapMonitor);
    	x = 0.309219 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.0567187 * safezoneW;
    	h = 0.022 * safezoneH;
		onButtonClick = QUOTE([] call FUNC(mapMonitor); false;);
    };
    class nbw_gm_map_toggleTexture: RscButton
    {
    	idc = IDC_NBW_GM_MAP_TOGGLE;
    	text = CSTRING(map_toggleTexture);
    	x = 0.371094 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.0567187 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = QUOTE([ARR_2(player,_this)] call FUNC(ToggleMap); false;);
    };
    class nbw_gm_bg_mapInfo: IGUIBack
    {
    	idc = IDC_NBW_GM_BG_MAPINFO;
    	x = 0.0617187 * safezoneW + safezoneX;
    	y = 0.786 * safezoneH + safezoneY;
    	w = 0.366094 * safezoneW;
    	h = 0.132 * safezoneH;
    };
    class nbw_gm_MapProperties_Title: RscText
    {
    	idc = IDC_NBW_GM_MAPPROPERTIES_TITLE;
    	text = CSTRING(MapProperties_Title);
    	x = 0.0617187 * safezoneW + safezoneX;
    	y = 0.786 * safezoneH + safezoneY;
    	w = 0.366094 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {1,1,1,1};
    };
    class nbw_gm_bg_players: IGUIBack
    {
    	idc = IDC_NBW_GM_BG_PLAYERS;
    	x = 0.432969 * safezoneW + safezoneX;
    	y = 0.093 * safezoneH + safezoneY;
    	w = 0.252656 * safezoneW;
    	h = 0.407 * safezoneH;
    };
    class nbw_gm_bg_actions: IGUIBack
    {
    	idc = IDC_NBW_GM_BG_ACTIONS;
    	x = 0.432969 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.252656 * safezoneW;
    	h = 0.407 * safezoneH;
    };
    class nbw_gm_Players_Title: RscText
    {
    	idc = IDC_NBW_GM_PLAYERS_TITLE;
    	text = CSTRING(Players_Title);
    	x = 0.432969 * safezoneW + safezoneX;
    	y = 0.093 * safezoneH + safezoneY;
    	w = 0.252656 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {1,1,1,1};
    };
    class nbw_gm_players_search: RscEdit
    {
    	idc = IDC_NBW_GM_PLAYERS_SEARCH;
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.126 * safezoneH + safezoneY;
    	w = 0.221719 * safezoneW;
    	h = 0.022 * safezoneH;
    	tooltip = CSTRING(players_search_tooltip);
    };
    class nbw_gm_player_search_submit: RscButton
    {
    	idc = IDC_NBW_GM_PLAYER_SEARCH_SUBMIT;
    	text = CSTRING(player_search_submit);
    	x = 0.659844 * safezoneW + safezoneX;
    	y = 0.126 * safezoneH + safezoneY;
    	w = 0.0103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_player_search_clear: RscButton
    {
    	idc = IDC_NBW_GM_PLAYER_SEARCH_CLEAR;
    	text = CSTRING(player_search_clear);
    	x = 0.670156 * safezoneW + safezoneX;
    	y = 0.126 * safezoneH + safezoneY;
    	w = 0.0103125 * safezoneW;
    	h = 0.022 * safezoneH;
    	tooltip = CSTRING(player_search_clear_tooltip);
    };
    class nbw_gm_players_list_sorter: RscListNBox
    {
    	idc = IDC_NBW_GM_PLAYERS_LIST_SORTER;
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.159 * safezoneH + safezoneY;
    	w = 0.242344 * safezoneW;
    	h = 0.022 * safezoneH;
      columns[] = {0,0.2,0.4};
    };
    class nbw_gm_players_list: RscListNBox
    {
    	idc = IDC_NBW_GM_PLAYERS_LIST;
      	style = LB_MULTI;
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.181 * safezoneH + safezoneY;
    	w = 0.242344 * safezoneW;
    	h = 0.275 * safezoneH;
      	drawSideArrows = 0;
      	columns[] = {0,0.2,0.4};
    };
    class nbw_gm_players_filter_blufor: RscButton
    {
    	idc = IDC_NBW_GM_PLAYERS_FILTER_BLUFOR;
    	text = CSTRING(players_filter_blufor);
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	tooltip = CSTRING(players_filter_blufor_tooltip);
		onButtonClick = QUOTE([ARR_2(player,_this)] call FUNC(updatePlayerFilter); false;);
    };
    class nbw_gm_players_filter_opfor: RscButton
    {
    	idc = IDC_NBW_GM_PLAYERS_FILTER_OPFOR;
    	text = CSTRING(players_filter_opfor);
    	x = 0.484531 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	tooltip = CSTRING(players_filter_opfor_tooltip);
		onButtonClick = QUOTE([ARR_2(player,_this)] call FUNC(updatePlayerFilter); false;);
    };
    class nbw_gm_players_filter_indfor: RscButton
    {
    	idc = IDC_NBW_GM_PLAYERS_FILTER_INDFOR;
    	text = CSTRING(players_filter_indfor);
    	x = 0.530937 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	tooltip = CSTRING(players_filter_indfor_tooltip);
		onButtonClick = QUOTE([ARR_2(player,_this)] call FUNC(updatePlayerFilter); false;);
    };
    class nbw_gm_players_filter_civfor: RscButton
    {
    	idc = IDC_NBW_GM_PLAYERS_FILTER_CIVFOR;
    	text = CSTRING(players_filter_civfor);
    	x = 0.577344 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	tooltip = CSTRING(players_filter_civfor_tooltip);
		onButtonClick = QUOTE([ARR_2(player,_this)] call FUNC(updatePlayerFilter); false;);
    };
    class nbw_gm_players_filter_includeAI: RscButton
    {
    	idc = IDC_NBW_GM_PLAYERS_FILTER_INCLUDEAI;
    	text = CSTRING(players_filter_includeAI);
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.0567187 * safezoneW;
    	h = 0.022 * safezoneH;
    	tooltip = CSTRING(players_filter_includeAI_tooltip);
		onButtonClick = QUOTE([ARR_2(player,_this)] call FUNC(updatePlayerFilter); false;);
    };
    class nbw_gm_actions_title: RscText
    {
    	idc = IDC_NBW_GM_ACTIONS_TITLE;
    	text = CSTRING(actions_title);
    	x = 0.432969 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.252656 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {1,1,1,1};
    };
    class nbw_gm_actions_ph1: RscButton
    {
    	idc = IDC_NBW_GM_ACTIONS_PH1;
    	text = CSTRING(placeholder);
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.544 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_actions_ph2: RscButton
    {
    	idc = IDC_NBW_GM_ACTIONS_PH2;
    	text = CSTRING(placeholder);
    	x = 0.520625 * safezoneW + safezoneX;
    	y = 0.544 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_actions_ph3: RscButton
    {
    	idc = IDC_NBW_GM_ACTIONS_PH3;
    	text = CSTRING(placeholder);
    	x = 0.603125 * safezoneW + safezoneX;
    	y = 0.544 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_actions_ph4: RscButton
    {
    	idc = IDC_NBW_GM_ACTIONS_PH4;
    	text = CSTRING(placeholder);
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_actions_ph5: RscButton
    {
    	idc = IDC_NBW_GM_ACTIONS_PH5;
    	text = CSTRING(placeholder);
    	x = 0.520625 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_actions_ph6: RscButton
    {
    	idc = IDC_NBW_GM_ACTIONS_PH6;
    	text = CSTRING(placeholder);
    	x = 0.603125 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_bg_gear: IGUIBack
    {
    	idc = IDC_NBW_GM_BG_GEAR;
    	x = 0.690781 * safezoneW + safezoneX;
    	y = 0.093 * safezoneH + safezoneY;
    	w = 0.252656 * safezoneW;
    	h = 0.407 * safezoneH;
    };
    class nbw_gm_gear_title: RscText
    {
    	idc = IDC_NBW_GM_GEAR_TITLE;
    	text = CSTRING(gear_title);
    	x = 0.690781 * safezoneW + safezoneX;
    	y = 0.093 * safezoneH + safezoneY;
    	w = 0.252656 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {1,1,1,1};
    };
    class nbw_gm_gear_presetList: RscCombo
    {
    	idc = IDC_NBW_GM_GEAR_PRESETLIST;
    	x = 0.695937 * safezoneW + safezoneX;
    	y = 0.126 * safezoneH + safezoneY;
    	w = 0.242344 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_gear_gearDynamic: RscEdit
    {
    	idc = IDC_NBW_GM_GEAR_GEARDYNAMIC;
    	x = 0.695937 * safezoneW + safezoneX;
    	y = 0.148 * safezoneH + safezoneY;
    	w = 0.216563 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_gear_count: RscEdit
    {
    	idc = IDC_NBW_GM_GEAR_COUNT;
    	text = CSTRING(gear_count);
    	x = 0.912501 * safezoneW + safezoneX;
    	y = 0.148 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.022 * safezoneH;
    	tooltip = CSTRING(gear_count_tooltip);
    };
    class nbw_gm_gear_add: RscButton
    {
    	idc = IDC_NBW_GM_GEAR_ADD;
    	text = CSTRING(gear_add);
    	x = 0.695937 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.0567187 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_gear_list: RscListbox
    {
    	idc = IDC_NBW_GM_GEAR_LIST;
    	x = 0.695937 * safezoneW + safezoneX;
    	y = 0.203 * safezoneH + safezoneY;
    	w = 0.242344 * safezoneW;
    	h = 0.253 * safezoneH;
    };
    class nbw_gm_gear_removeOne: RscButton
    {
    	idc = IDC_NBW_GM_GEAR_REMOVEONE;
    	text = CSTRING(gear_removeOne);
    	x = 0.757813 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.0567187 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_gear_RemoveLine: RscButton
    {
    	idc = IDC_NBW_GM_GEAR_REMOVELINE;
    	text = CSTRING(gear_RemoveLine);
    	x = 0.819688 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.0567187 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_gear_clearLine: RscButton
    {
    	idc = IDC_NBW_GM_GEAR_CLEARLINE;
    	text = CSTRING(gear_clearLine);
    	x = 0.881562 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.0567187 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_gear_spawnSelected: RscButton
    {
    	idc = IDC_NBW_GM_GEAR_SPAWNSELECTED;
    	text = CSTRING(gear_spawnSelected);
    	x = 0.695937 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_gear_SpawnAll: RscButton
    {
    	idc = IDC_NBW_GM_GEAR_SPAWNALL;
    	text = CSTRING(gear_SpawnAll);
    	x = 0.778437 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_gear_SpawnBox: RscButton
    {
    	idc = IDC_NBW_GM_GEAR_SPAWNBOX;
    	text = CSTRING(gear_SpawnBox);
    	x = 0.860937 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class nbw_gm_bg_functions: IGUIBack
    {
    	idc = IDC_NBW_GM_BG_FUNCTIONS;
    	x = 0.690781 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.252656 * safezoneW;
    	h = 0.407 * safezoneH;
    };
    class nbw_gm_functions_title: RscText
    {
    	idc = IDC_NBW_GM_FUNCTIONS_TITLE;
    	text = CSTRING(functions_title);
    	x = 0.690781 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.252656 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {1,1,1,1};
    };
    class nbw_gm_functions_list: RscControlsGroup
    {
    	idc = IDC_NBW_GM_FUNCTIONS_LIST;
    	x = 0.695937 * safezoneW + safezoneX;
    	y = 0.544 * safezoneH + safezoneY;
    	w = 0.242344 * safezoneW;
    	h = 0.363 * safezoneH;
    	class Controls
    	{
    	};
    };
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT END
    ////////////////////////////////////////////////////////

  };
};
