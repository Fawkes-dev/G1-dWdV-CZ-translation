instance ORG_861_Killian_Exit(C_Info)
{
	npc = Org_861_Killian;
	nr = 999;
	condition = ORG_861_Killian_Exit_Condition;
	information = ORG_861_Killian_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int ORG_861_Killian_Exit_Condition()
{
	return TRUE;
};

func void ORG_861_Killian_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance ORG_861_Killian_GetLost(C_Info)
{
	npc = Org_861_Killian;
	nr = 1;
	condition = ORG_861_Killian_GetLost_Condition;
	information = ORG_861_Killian_GetLost_Info;
	permanent = 1;
	important = 1;
};

func int ORG_861_Killian_GetLost_Condition()
{
};

func void ORG_861_Killian_GetLost_Info()
{
	AI_Output(self,other,"Org_861_Killian_GetLost_Info_13_00");	//Ztrať se!
	AI_StopProcessInfos(self);
};

instance ORG_861_KILLIAN_WORK(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_work_condition;
	information = org_861_killian_work_info;
	important = 0;
	permanent = 0;
	description = "Jak to jde?";
};

func int org_861_killian_work_condition()
{
	return TRUE;
};

func void org_861_killian_work_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Jak to jde?
	AI_Output(self,other,"Org_861_Killian_WORK_Info_13_02");	//Nech mě na pokoji. Mám práci.
};

instance ORG_861_KILLIAN_DEAL(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_deal_condition;
	information = org_861_killian_deal_info;
	important = 0;
	permanent = 0;
	description = "Jak se daří příteli?";
};

func int org_861_killian_deal_condition()
{
	if(idiots_deal == TRUE)
	{
		return TRUE;
	};
};

func void org_861_killian_deal_info()
{
	AI_Output(other,self,"Org_861_Killian_DEAL_Info_15_01");	//Jak to jde, kamaráde?
	AI_Output(self,other,"Org_861_Killian_DEAL_Info_13_02");	//Dohodli jsme se. Ale to neznamená, že jsem tvůj přítel.
};

instance ORG_861_KILLIAN_LOST(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_lost_condition;
	information = org_861_killian_lost_info;
	important = 0;
	permanent = 0;
	description = "A co ty parchante? Držíte se pěkně při zemi?";
};

func int org_861_killian_lost_condition()
{
	var C_Npc Killian;
	Killian = Hlp_GetNpc(Org_861_Killian);

	if (Killian.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (Kalom_DrugMonopol == LOG_RUNNING) && Npc_KnowsInfo(hero,org_860_renyu_deal)
	{
		return TRUE;
	};
};

func void org_861_killian_lost_info()
{
	AI_Output(other,self,"Org_861_Killian_LOST_Info_15_01");	//A co ty parchante? Držíte se pěkně při zemi?
	AI_Output(self,other,"Org_861_Killian_LOST_Info_13_02");	//Hej KÁMO, nevěděl jsem, že na to bratrstvo klade tak velký důraz!
	AI_Output(other,self,"Org_861_Killian_LOST_Info_15_03");	//Nejsem tvůj kámoš, parchante!
	Kalom_DrugMonopol = LOG_SUCCESS;
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
};

