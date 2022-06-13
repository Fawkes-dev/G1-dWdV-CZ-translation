instance INFO_SHAMAN(C_Info)
{
	npc = orc_5047_shaman;
	nr = 1;
	condition = info_shaman_condition;
	information = info_shaman_info;
	permanent = 0;
	important = 1;
};

func int info_shaman_condition()
{
	return TRUE;
};

func void info_shaman_info()
{
	B_SelectWeapon(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Shaman_17_01");	//Já jsem Kar-Nakh.
	AI_Output(self,other,"Info_Shaman_17_02");	//Co děláš na tomto posvatém místě? Znesvětili jsi naši svatyni!
	AI_Output(self,other,"Info_Shaman_17_03");	//KRUSHAK tě za to potrestá!
	AI_Output(self,other,"Info_Shaman_17_04");	//Připrav se na svou smrt člověče!
	B_LogEntry(ARTEFACTS,"Kar-Nakh, skřetí šaman, se mi postavil do cesty a pokusil se mě zastavit. Řekl, že jsem znesvětil jejich posvátné místo.");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

