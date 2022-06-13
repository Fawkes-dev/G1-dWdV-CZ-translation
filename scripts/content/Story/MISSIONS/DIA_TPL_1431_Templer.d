instance Tpl_1431_Templer_CALLSLEEPER(C_Info)
{
	npc = TPL_1431_Templer;
	condition = Tpl_1431_Templer_CALLSLEEPER_Condition;
	information = Tpl_1431_Templer_CALLSLEEPER_Info;
	important = 1;
	permanent = 0;
};

func int Tpl_1431_Templer_CALLSLEEPER_Condition()
{
	var C_Npc Templer;
	var C_Npc Kalom;
	Templer = Hlp_GetNpc(TPL_1431_Templer);
	Kalom = Hlp_GetNpc(GUR_1201_CorKalom);
	if((CorKalom_BringBook == LOG_SUCCESS) && (Npc_GetDistToWP(Templer,"PSI_TEMPLE_STAIRS_1") < 1000) && C_TimeForGreatPrayer() && !Npc_KnowsInfo(hero,NOV_1319_Novize_CALLSLEEPER) && !Npc_KnowsInfo(hero,NOV_1320_Novize_CALLSLEEPER) && !Npc_KnowsInfo(hero,Tpl_1430_Templer_CALLSLEEPER) && (Npc_GetDistToWP(Kalom,"PSI_TEMPLE_STAIRS_RIGHT") < 300))
	{
		return TRUE;
	};
};

func void Tpl_1431_Templer_CALLSLEEPER_Info()
{
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(3);
};

