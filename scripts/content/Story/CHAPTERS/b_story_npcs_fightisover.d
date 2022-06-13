func void b_story_npcs_fightisover()
{
	var C_Npc buddler1;
	var C_Npc buddler2;
	var C_Npc buddler3;
	var C_Npc schatten1;
	var C_Npc schatten2;
	var C_Npc schatten3;
	var C_Npc buddler4;
	buddler1 = Hlp_GetNpc(VLK_515_Buddler);
	buddler2 = Hlp_GetNpc(VLK_513_Buddler);
	buddler3 = Hlp_GetNpc(VLK_514_Buddler);
	schatten1 = Hlp_GetNpc(STT_306_Schatten);
	schatten2 = Hlp_GetNpc(STT_328_Schatten);
	schatten3 = Hlp_GetNpc(STT_316_Schatten);
	buddler4 = Hlp_GetNpc(VLK_530_Guy);
	Npc_ExchangeRoutine(buddler1,"START");
	Npc_ExchangeRoutine(buddler2,"START");
	Npc_ExchangeRoutine(buddler3,"START");
	Npc_ExchangeRoutine(schatten1,"START");
	Npc_ExchangeRoutine(schatten2,"START");
	Npc_ExchangeRoutine(schatten3,"START");
	Npc_ExchangeRoutine(buddler4,"START");
	AI_ContinueRoutine(buddler1);
	AI_ContinueRoutine(buddler2);
	AI_ContinueRoutine(buddler3);
	AI_ContinueRoutine(schatten1);
	AI_ContinueRoutine(schatten2);
	AI_ContinueRoutine(schatten3);
	AI_ContinueRoutine(buddler4);
};

