func void B_Story_GornJoins()
{
	var C_Npc gorn;
	CreateInvItem(hero,ItKe_Freemine);
	Wld_InsertNpc(Razor,"OW_PATH_3001_MOVE");
	Wld_InsertNpc(Razor,"OW_PATH_3001_MOVE2");
	Wld_InsertNpc(Razor,"OW_PATH_3001_MOVE3");
	Wld_InsertNpc(Razor,"OW_PATH_3001_MOVE4");
	gorn = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine(gorn,"FollowToFMC");
	B_GiveXP(XP_GornJoins);
	B_LogEntry(CH4_UluMulu,"Předpokládá se, že tajnou operací s Gornem získáme Svobodný důl zpět. Skutečnost, že je zde skřetí Ur-Shakův přítel, je předzvěst toho, že se karta obrací.");
	gorn.aivar[AIV_PARTYMEMBER] = TRUE;
	Gorn_JoinedForFM = TRUE;
};

