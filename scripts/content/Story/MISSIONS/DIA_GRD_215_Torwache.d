instance DIA_Grd_215_Torwache_Exit(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 999;
	condition = DIA_Grd_215_Torwache_Exit_Condition;
	information = DIA_Grd_215_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Grd_215_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_215_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Grd_215_Torwache_PERM(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = DIA_Grd_215_Torwache_PERM_Condition;
	information = DIA_Grd_215_Torwache_PERM_Info;
	permanent = 1;
	description = "Něco nového?";
};

func int DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

func void DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_PERM_15_00");	//Něco nového?
	AI_Output(self,other,"DIA_Grd_215_Torwache_PERM_06_01");	//Ne. Všechno při starém.
};

const string GRD_215_CHECKPOINT = "OCR_MAINGATE_OUTSIDE";

instance DIA_Grd_215_Torwache_First(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 2;
	condition = DIA_Grd_215_Torwache_First_Condition;
	information = DIA_Grd_215_Torwache_First_Info;
	permanent = 1;
	important = 1;
};

func int DIA_Grd_215_Torwache_First_Condition()
{
	if(((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)) || ((other.guild == GIL_STT) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) || ((other.guild == GIL_GRD) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))))
	{
		return TRUE;
	};
};

func void DIA_Grd_215_Torwache_First_Info()
{
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_00");	//Kam máš namířeno?
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_15_01");	//Do tábora.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_02");	//Nechceš se dostat do problémů, viď?
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Jistě, mám v úmyslu zabrat celý tábor.",DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Chci se tu jenom porozhlédnout.",DIA_Grd_215_Torwache_First_JustLooking);
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Diego řekl, že ho mám v táboře navštívit.",DIA_Grd_215_Torwache_First_Diego);
	};
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Cronos_Messenger == LOG_RUNNING))
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Jsem kurýr Vodních Mágů.",dia_grd_215_torwache_first_bandit);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Trouble_15_00");	//Jistě, mám v úmyslu zabrat celý tábor.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Trouble_06_01");	//No, to je pěknej šprýmař... A já nemám šprýmaře rád .
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_JustLooking_15_00");	//Chci se tu jenom porozhlédnout.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_JustLooking_06_01");	//To tě bude stát 10 nugetů.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Na to zapomeň.",DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Dobrá, tady je tvých 10 nugetů.",DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Diego_15_00");	//Diego řekl, že ho mám v táboře navštívit.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Diego_06_01");	//Dobrá, pak tedy pojď dál.
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_NoPay_15_00");	//Na to zapomeň.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_NoPay_06_01");	//Pak vypadni.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_215_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_15_00");	//Dobrá, tady je tvých 10 nugetů.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_06_01");	//Pak pojď dál.
		B_GiveInvItems(other,self,ItMiNugget,10);
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//Tolik u sebe nemám.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01");	//Pro tentokrát udělám výjimku, protože jsi tu nový.
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void dia_grd_215_torwache_first_bandit()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Bandit_15_00");	//Jsem kurýr Vodních Mágů.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_01");	//Dobrá, můžeš dovnitř.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_02");	//Ale nedělej žádné problémy.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_03");	//Nejsme k banditům zrovna přátelský, když se neumí chovat.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_04");	//A teď jdi.
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

instance INFO_GRD_215_LASTWARN(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = info_grd_215_lastwarn_condition;
	information = info_grd_215_lastwarn_info;
	permanent = 1;
	important = 1;
};

func int info_grd_215_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,GRD_215_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_grd_215_lastwarn_info()
{
	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00");	//Jsi hluchej, nebo co, příteli?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_215_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};

instance INFO_GRD_215_ATTACK(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = info_grd_215_attack_condition;
	information = info_grd_215_attack_info;
	permanent = 1;
	important = 1;
};

func int info_grd_215_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_215_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_grd_215_attack_info()
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

