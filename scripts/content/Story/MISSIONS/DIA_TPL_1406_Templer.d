instance DIA_KalomsGuard_Exit(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 999;
	condition = DIA_KalomsGuard_Exit_Condition;
	information = DIA_KalomsGuard_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_KalomsGuard_Exit_Condition()
{
	return 1;
};

func void DIA_KalomsGuard_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KalomsGuard_PERM(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = DIA_KalomsGuard_PERM_Condition;
	information = DIA_KalomsGuard_PERM_Info;
	permanent = 1;
	description = "Jistě nemáš nic proti tomu, abych šel dál...?";
};

func int DIA_KalomsGuard_PERM_Condition()
{
	if((TPL_1406_Templer.aivar[AIV_PASSGATE] == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_KalomsGuard_PERM_Info()
{
	AI_Output(other,self,"DIA_KalomsGuard_PERM_15_00");	//Jistě nemáš nic proti tomu, abych šel dál...?
	AI_Output(self,other,"DIA_KalomsGuard_PERM_13_01");	//Jestli budeš k mému mistrovi neuctivý, zabiju tě!
	AI_StopProcessInfos(self);
};

instance DIA_KALOMSGUARD_HOUSE(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = dia_kalomsguard_house_condition;
	information = dia_kalomsguard_house_info;
	permanent = 0;
	description = "Co tady děláš?";
};

func int dia_kalomsguard_house_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_kalomsguard_house_info()
{
	AI_Output(other,self,"DIA_KalomsGuard_HOUSE_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_KalomsGuard_HOUSE_13_01");	//Než můj pán odešel, dal mi rozkaz dohlížet na jeho chatrč.
	AI_Output(self,other,"DIA_KalomsGuard_HOUSE_13_02");	//Chtěl abych dohlížel na jeho truhlice. Nikdo se do nich nedostane, protože já jsem jediný, kdo má klíč.
	CreateInvItem(self,itkey_kalom_gur_01);
};

instance DIA_KALOMSGUARD_TRUHE(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = dia_kalomsguard_truhe_condition;
	information = dia_kalomsguard_truhe_info;
	permanent = 0;
	description = "Co je tak zvláštního na jeho truhle?";
};

func int dia_kalomsguard_truhe_condition()
{
	if(Npc_KnowsInfo(hero,dia_kalomsguard_house))
	{
		return TRUE;
	};
};

func void dia_kalomsguard_truhe_info()
{
	AI_Output(other,self,"DIA_KalomsGuard_TRUHE_15_00");	//Co je tak zvláštního na jeho truhle?
	AI_Output(self,other,"DIA_KalomsGuard_TRUHE_13_01");	//Jsou v ní osobní věci mého mistra, Cor Kaloma.
	AI_Output(self,other,"DIA_KalomsGuard_TRUHE_13_02");	//To je vše co potřebuješ vědět.
	AI_StopProcessInfos(self);
};

const string TPL_1406_CHECKPOINT = "PSI_LABOR_IN";

instance INFO_TPL_1406_FIRSTWARN(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_firstwarn_condition;
	information = info_tpl_1406_firstwarn_info;
	permanent = 1;
	important = 1;
};

var int guard_psi;

func int info_tpl_1406_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_tpl_1406_firstwarn_info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_13_01");	//STŮJ! Nikdo nemá dovoleno rušit mého pána při jeho experimentech!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	KALOMS_GUARD = LOG_RUNNING;
	if(GUARD_PSI == FALSE)
	{
		Log_CreateTopic(CH1_KALOMSGUARD,LOG_MISSION);
		B_LogEntry(CH1_KALOMSGUARD,"Cor Kalomův osobní strážce mě zastavil u vchodu do jeho laboratoře. Budu muset najít způsob, jak se přes něj dostat ke Cor Kalomovi.");
		Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_RUNNING);
		GUARD_PSI = TRUE;
	};
	if(Npc_HasItems(hero,ItAt_Crawler_01))
	{
		Info_ClearChoices(info_tpl_1406_firstwarn);
		Info_AddChoice(info_tpl_1406_firstwarn,"Mám pro Cor Kaloma čelisti důlních červů.",info_tpl_1406_firstwarn_condition_crawler);
	}
	else if(NAMIB_GOTOCALOM == TRUE)
	{
		Info_AddChoice(info_tpl_1406_firstwarn,"Baal Namib mi dal svolení navštívit Cor Kaloma.",info_tpl_1406_firstwarn_condition_namib);
	}
	else if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		Info_AddChoice(info_tpl_1406_firstwarn,"Přinesl jsem Cor Kalomovi sklizěn Trávy z bažin.",info_tpl_1406_firstwarn_condition_weed);
	}
	else if(!Npc_HasItems(hero,ItAt_Crawler_01) || (NAMIB_GOTOCALOM != TRUE) || (BaalOrun_FetchWeed != LOG_RUNNING))
	{
		AI_StopProcessInfos(self);
	};
};

func void info_tpl_1406_firstwarn_condition_crawler()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_CRAWLER_15_01");	//Mám pro Cor Kaloma čelisti důlních červů.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_CRAWLER_13_02");	//Dobře, čelisti mu můžeš zanést.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	KALOMS_GUARD = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Pŕinesl jsem Cor Kalomovi pár čelistí důlních červů. Strážný mě vpustil do laboratoře.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void info_tpl_1406_firstwarn_condition_namib()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_NAMIB_15_01");	//Baal Namib mi dal svolení navštívit Cor Kaloma.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_NAMIB_13_02");	//Pokud ti to svolení dal Baal Namib, tak můžeš naštívit Cor Kaloma.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	KALOMS_GUARD = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Díky svolení Baala Namiba mě osobní strážce Cor Kaloma nechal projít.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void info_tpl_1406_firstwarn_condition_weed()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_WEED_15_01");	//Přinesl jsem Cor Kalomovi sklizěn Trávy z bažin.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_WEED_13_02");	//Dobře, můžeš jít dovnitř.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	KALOMS_GUARD = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Poté, co mi Baal Orun dal za úkol přinést sklizeň Trávy z bažin Cor Kalomovi, nechal mně jeho osobní strážce vstoupit do laboratoře.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};

instance INFO_TPL_1406_LASTWARN(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_lastwarn_condition;
	information = info_tpl_1406_lastwarn_info;
	permanent = 1;
	important = 1;
};

func int info_tpl_1406_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 75)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_tpl_1406_lastwarn_info()
{
	AI_Output(self,hero,"Info_Tpl_1406_LastWarn_13_01");	//Ještě jeden krok, a bude tvůj poslední.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};

instance INFO_TPL_1406_ATTACK(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_attack_condition;
	information = info_tpl_1406_attack_info;
	permanent = 1;
	important = 1;
};

func int info_tpl_1406_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 75)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_tpl_1406_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

