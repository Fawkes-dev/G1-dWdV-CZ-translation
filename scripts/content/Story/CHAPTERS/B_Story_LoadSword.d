func void B_Story_LoadSword()
{
	var C_Npc milten;
	B_LogEntry(CH5_Uriziel,"Xardas dokončil kouzelnou formuli. Nyní potřebuji opravdu silný zdroj magické energie a ochotného mága, který by mi pomohl provést proceduru. Shodou okolností je v kolonii komunita, která takovým zdrojem energie disponuje a která mi je hluboce zavázána...");
	B_GiveXP(XP_ReturnedFromSunkenTower);
	CreateInvItem(hero,Scroll4Milten);
	milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine(milten,"LSWait");
	LoadSword = TRUE;
};

