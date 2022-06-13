func void B_Story_FoundUrShak()
{
	var C_Npc riordian;
	B_LogEntry(CH4_FindOrcShaman,"Zachránil jsem skřetího šamana Ur-Shaka před jeho vlastními lidmi. Byl mi tak vděčný, že mi dopověděl zbytek Spáčova příběhu. Nyní se můžu vrátit ke Xardasovi a dokončit svůj úkol.");
	Log_CreateTopic(CH4_UluMulu,LOG_MISSION);
	Log_SetTopicStatus(CH4_UluMulu,LOG_RUNNING);
	B_LogEntry(CH4_UluMulu,"Ur-Shak, vyhoštěný šaman, mi řekl, jak se dostanu do Spáčova podzemního chrámu pod skřetím městem, aniž bych musel bojovat se všemi skřety. Musím mít ULU-MULU, odznak, který všichni skřeti respektují. Jeden Ur-Shakův přítel, který je vězněn v dole lidí, mi takový odznak může zhotovit.");
	B_GiveXP(XP_FoundOrcShaman);
	riordian = Hlp_GetNpc(KDW_605_Riordian);
	Npc_ExchangeRoutine(riordian,"FoundUrShak");
	UrShak_SpokeOfUluMulu = TRUE;
};

