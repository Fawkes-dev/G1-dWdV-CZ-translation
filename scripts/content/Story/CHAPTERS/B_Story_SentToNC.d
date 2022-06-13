func void B_Story_SentToNC()
{
	var C_Npc angar;
	var C_Npc YBerion;
	var C_Npc gorn;
	angar = Hlp_GetNpc(GUR_1202_CorAngar);
	Npc_ExchangeRoutine(angar,"start");
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	Npc_ExchangeRoutine(YBerion,"dead");
	gorn = Hlp_GetNpc(PC_Fighter);
	PrintDebugNpc(PD_MISSION,gorn.name);
	Npc_ExchangeRoutine(gorn,"NCWAIT");
	AI_ContinueRoutine(gorn);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	B_LogEntry(CH3_EscapePlanNC,"Y´Berion, duchovní vůdce Bratrstva, je mrtev! Snad jeho duše odpočívá v pokoji. Podle jeho posledních slov vkládá veškeré naděje na vysvobození do rukou mágů Kruhu vody.");
	B_LogEntry(CH3_EscapePlanNC,"Udělal jsem pevné rozhodnutí. Půjdu do Nového tábora, abych mágům Vody pomohl provést plán úniku. Cor Angar mi předal klíče od truhlice, která je v Cor Kalomově alchymistické dílně. Měl by v ní být ohniskový kámen a rukopis, které jsem získal při mém posledním úkolu. Cor Angar je přesvědčen, že mágové z Nového tábora budou tyto dva artefakty potřebovat pro dokončení svého plánu.");
	CreateInvItem(self,ItArRuneTeleport5);
	B_GiveInvItems(self,hero,ItArRuneTeleport5,1);
	CorAngar_SendToNC = TRUE;
};

