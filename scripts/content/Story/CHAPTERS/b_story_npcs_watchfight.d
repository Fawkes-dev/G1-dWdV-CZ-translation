func void b_story_npcs_watchfight()
{
	var C_Npc buddler1;
	var C_Npc buddler2;
	var C_Npc buddler3;
	var C_Npc buddler4;
	var C_Npc schatten1;
	var C_Npc schatten2;
	var C_Npc schatten3;
	buddler1 = Hlp_GetNpc(VLK_515_Buddler);
	buddler2 = Hlp_GetNpc(VLK_513_Buddler);
	buddler3 = Hlp_GetNpc(VLK_514_Buddler);
	buddler4 = Hlp_GetNpc(VLK_530_Guy);
	schatten1 = Hlp_GetNpc(STT_306_Schatten);
	schatten2 = Hlp_GetNpc(STT_328_Schatten);
	schatten3 = Hlp_GetNpc(STT_316_Schatten);
	Npc_ExchangeRoutine(buddler1,"ARENAFIGHT");
	Npc_ExchangeRoutine(buddler2,"ARENAFIGHT");
	Npc_ExchangeRoutine(buddler3,"ARENAFIGHT");
	Npc_ExchangeRoutine(buddler4,"ARENAFIGHT");
	Npc_ExchangeRoutine(schatten1,"ARENAFIGHT");
	Npc_ExchangeRoutine(schatten2,"ARENAFIGHT");
	Npc_ExchangeRoutine(schatten3,"ARENAFIGHT");
	AI_ContinueRoutine(buddler1);
	AI_ContinueRoutine(buddler2);
	AI_ContinueRoutine(buddler3);
	AI_ContinueRoutine(buddler4);
	AI_ContinueRoutine(schatten1);
	AI_ContinueRoutine(schatten2);
	AI_ContinueRoutine(schatten3);
};

