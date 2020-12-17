func void b_story_guruaufnahme()
{
	var C_Npc guru_1;
	var C_Npc guru_2;
	var C_Npc guru_3;
	var C_Npc guru_4;
	var C_Npc guru_5;
	var C_Npc guru_6;
	if(YBERION_GURAUFNAHME == 4)
	{
		Npc_ExchangeRoutine(self,"RITUAL");
		guru_1 = Hlp_GetNpc(GUR_1203_BaalTondral);
		AI_Teleport(guru_1,"GURU_RITUAL_01");
		Npc_ExchangeRoutine(guru_1,"RITUAL");
		AI_ContinueRoutine(guru_1);
		guru_2 = Hlp_GetNpc(GUR_1204_BaalNamib);
		AI_Teleport(guru_2,"GURU_RITUAL_02");
		Npc_ExchangeRoutine(guru_2,"RITUAL");
		AI_ContinueRoutine(guru_2);
		guru_3 = Hlp_GetNpc(GUR_1209_BaalOrun);
		AI_Teleport(guru_3,"GURU_RITUAL_03");
		Npc_ExchangeRoutine(guru_3,"RITUAL");
		AI_ContinueRoutine(guru_3);
		guru_4 = Hlp_GetNpc(GUR_1208_BaalCadar);
		AI_Teleport(guru_4,"GURU_RITUAL_04");
		Npc_ExchangeRoutine(guru_4,"RITUAL");
		AI_ContinueRoutine(guru_4);
		guru_5 = Hlp_GetNpc(GUR_1210_BaalTyon);
		AI_Teleport(guru_5,"GURU_RITUAL_05");
		Npc_ExchangeRoutine(guru_5,"RITUAL");
		AI_ContinueRoutine(guru_5);
		guru_6 = Hlp_GetNpc(gur_5021_baallukor);
		AI_Teleport(guru_6,"GURU_RITUAL_06");
		Npc_ExchangeRoutine(guru_6,"RITUAL");
		AI_ContinueRoutine(guru_6);
	}
	else if(YBERION_GURAUFNAHME == 5)
	{
		guru_1 = Hlp_GetNpc(GUR_1203_BaalTondral);
		AI_AlignToWP(guru_1);
		AI_PlayAniBS(guru_1,"T_STAND_2_PRAY",BS_SIT);
		guru_2 = Hlp_GetNpc(GUR_1204_BaalNamib);
		AI_AlignToWP(guru_2);
		AI_PlayAniBS(guru_2,"T_STAND_2_PRAY",BS_SIT);
		guru_3 = Hlp_GetNpc(GUR_1209_BaalOrun);
		AI_AlignToWP(guru_3);
		AI_PlayAniBS(guru_3,"T_STAND_2_PRAY",BS_SIT);
		guru_4 = Hlp_GetNpc(GUR_1208_BaalCadar);
		AI_AlignToWP(guru_4);
		AI_PlayAniBS(guru_4,"T_STAND_2_PRAY",BS_SIT);
		guru_5 = Hlp_GetNpc(GUR_1210_BaalTyon);
		AI_AlignToWP(guru_5);
		AI_PlayAniBS(guru_5,"T_STAND_2_PRAY",BS_SIT);
		guru_6 = Hlp_GetNpc(gur_5021_baallukor);
		AI_AlignToWP(guru_6);
		AI_PlayAniBS(guru_6,"T_STAND_2_PRAY",BS_SIT);
	}
	else if(YBERION_GURAUFNAHME == 6)
	{
		Npc_ExchangeRoutine(self,"START");
		guru_1 = Hlp_GetNpc(GUR_1203_BaalTondral);
		AI_PlayAniBS(guru_1,"T_PRAY_2_STAND",BS_STAND);
		Npc_ExchangeRoutine(guru_1,"START");
		guru_2 = Hlp_GetNpc(GUR_1204_BaalNamib);
		AI_PlayAniBS(guru_2,"T_PRAY_2_STAND",BS_STAND);
		Npc_ExchangeRoutine(guru_2,"START");
		guru_3 = Hlp_GetNpc(GUR_1209_BaalOrun);
		AI_PlayAniBS(guru_3,"T_PRAY_2_STAND",BS_STAND);
		Npc_ExchangeRoutine(guru_3,"START");
		guru_4 = Hlp_GetNpc(GUR_1208_BaalCadar);
		AI_PlayAniBS(guru_4,"T_PRAY_2_STAND",BS_STAND);
		Npc_ExchangeRoutine(guru_4,"START");
		guru_5 = Hlp_GetNpc(GUR_1210_BaalTyon);
		AI_PlayAniBS(guru_5,"T_PRAY_2_STAND",BS_STAND);
		Npc_ExchangeRoutine(guru_5,"START");
		guru_6 = Hlp_GetNpc(gur_5021_baallukor);
		AI_PlayAniBS(guru_6,"T_PRAY_2_STAND",BS_STAND);
		Npc_ExchangeRoutine(guru_6,"START");
	};
};

