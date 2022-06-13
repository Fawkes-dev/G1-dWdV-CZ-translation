instance Info_Renyu_EXIT(C_Info)
{
	npc = Org_860_Renyu;
	nr = 999;
	condition = Info_Renyu_EXIT_Condition;
	information = Info_Renyu_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Renyu_EXIT_Condition()
{
	return 1;
};

func void Info_Renyu_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance ORG_860_Renyu_GetLost(C_Info)
{
	npc = Org_860_Renyu;
	nr = 1;
	condition = ORG_860_Renyu_GetLost_Condition;
	information = ORG_860_Renyu_GetLost_Info;
	permanent = 1;
	important = 1;
};

func int ORG_860_Renyu_GetLost_Condition()
{
};

func void ORG_860_Renyu_GetLost_Info()
{
	AI_Output(self,other,"Org_860_Renyu_GetLost_Info_06_00");	//Ztrať se!
	AI_StopProcessInfos(self);
};

instance ORG_860_RENYU_DEAL(C_Info)
{
	npc = Org_860_Renyu;
	condition = org_860_renyu_deal_condition;
	information = org_860_renyu_deal_info;
	important = 0;
	permanent = 0;
	description = "Jsem tu, abych ti udělal nabídku.";
};

func int org_860_renyu_deal_condition()
{
	if(Npc_KnowsInfo(hero,org_862_jacko_angebot) && (Kalom_DrugMonopol == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void org_860_renyu_deal_info()
{
	AI_Output(other,self,"ORG_860_Renyu_DEAL_Info_15_01");	//Jsem tu abych ti učinil nabídku.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_Info_06_02");	//Jsem zvědav o co jde.
	AI_Output(other,self,"ORG_860_Renyu_DEAL_Info_15_03");	//Bratrstvo ví co tom, co zde děláte. 
	AI_Output(self,other,"ORG_860_Renyu_DEAL_Info_06_04");	//Přejdi k věci!
	Info_ClearChoices(org_860_renyu_deal);
	Info_AddChoice(org_860_renyu_deal,"Dej mi 500 kusů rudy.",org_860_renyu_deal_500);
	Info_AddChoice(org_860_renyu_deal,"Dej mi 200 kusů rudy.",org_860_renyu_deal_250);
};

func void org_860_renyu_deal_500()
{
	var C_Npc Killian;
	var C_Npc Jacko;
	AI_Output(other,self,"ORG_860_Renyu_DEAL_500_Info_15_01");	//Dej mi 500 kousků rudy a Bratrstvo Vás nechá na pokoji.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_500_Info_06_02");	//Co když nezaplatím? Co uděláš?
	AI_Output(other,self,"ORG_860_Renyu_DEAL_500_Info_15_03");	//Pošlu sem několik templářů. Nadělají z Vás sekanou.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_500_Info_06_04");	//Asi bychom měli také Bratstvu poslat varování. Tvojí rozsekanou mrtvolu!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,1,"");
	Jacko = Hlp_GetNpc(Org_862_Jacko);
	Npc_SetTarget(Jacko,hero);
	AI_StartState(Jacko,ZS_Attack,1,"");
};

func void org_860_renyu_deal_250()
{
	AI_Output(other,self,"ORG_860_Renyu_DEAL_250_Info_15_01");	//Dej mi 250 kousků rudy a Bratrstvo Vás nechá být.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_250_Info_06_02");	//Dobře. Souhlasím. Ale pokud nás podrazíš budeš litovat, že jsme se kdy potkali.
	AI_Output(other,self,"ORG_860_Renyu_DEAL_250_Info_15_03");	//Jasně. Dej mi rudu!
	Info_ClearChoices(org_860_renyu_deal);
	CreateInvItems(self,ItMiNugget,250);
	B_GiveInvItems(self,other,ItMiNugget,250);
	idiots_deal = TRUE;
	B_LogEntry(CH1_DrugMonopol,"Renyu mi zaplatil 250 kusů rudy, na oplátku může pokračovat ve své 'práci'.");
	Kalom_DrugMonopol = LOG_FAILED;
	Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	Info_Kalom_Success.permanent = 0;
};

instance ORG_860_RENYU_LOST(C_Info)
{
	npc = Org_860_Renyu;
	condition = org_860_renyu_lost_condition;
	information = org_860_renyu_lost_info;
	important = 0;
	permanent = 0;
	description = "Co říkáš teď? Mizerný slabochu!";
};

func int org_860_renyu_lost_condition()
{
	var C_Npc Renyu;
	Renyu = Hlp_GetNpc(Org_860_Renyu);

	if(Renyu.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_KnowsInfo(hero,org_860_renyu_deal) && (Kalom_DrugMonopol == LOG_RUNNING) && (idiots_deal == FALSE)
	{
		return TRUE;
	};
};

func void org_860_renyu_lost_info()
{
	AI_Output(other,self,"Org_861_Killian_WORK_Info_15_01");	//Co řekneš teď, slabochu?
	AI_Output(self,other,"ORG_860_Renyu_LOST_Info_06_02");	//Dobře, člověče, vyhrál jsi! Přestaneme! Produkce trávy je Vaše!
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_862_Jacko,"ARBEITSLOS");
	B_LogEntry(CH1_DrugMonopol,"Dokázal jsem přesvědčit Renyua, aby ukončil svůj malý biznis.");
	B_GiveXP(XP_JackoRetired);
};

