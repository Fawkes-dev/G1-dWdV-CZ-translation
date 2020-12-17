func void B_Story_JackalFight()
{
	var C_Npc jackal;
	var C_Npc gorn;
	B_ExchangeRoutine(Grd_283_Gardist,"FMTaken2");
	B_ExchangeRoutine(Grd_285_Gardist,"FMTaken2");
	jackal = Hlp_GetNpc(Grd_201_Jackal);
	Npc_ExchangeRoutine(jackal,"FMTaken2");
	B_SetPermAttitude(Grd_283_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(Grd_285_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(Grd_201_Jackal,ATT_HOSTILE);
	gorn = Hlp_GetNpc(PC_Fighter);
	AI_SetWalkMode(gorn,NPC_RUN);
	Npc_ExchangeRoutine(gorn,"WaitFM");
	AI_ContinueRoutine(gorn);
};

