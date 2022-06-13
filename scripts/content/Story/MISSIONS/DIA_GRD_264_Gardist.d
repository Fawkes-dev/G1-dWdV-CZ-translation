instance DIA_Grd_264_Exit(C_Info)
{
	npc = GRD_264_Gardist;
	nr = 999;
	condition = DIA_Grd_264_Exit_Condition;
	information = DIA_Grd_264_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Grd_264_Exit_Condition()
{
	return TRUE;
};

func void DIA_Grd_264_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Grd_264_Gardist_GARDEAUFNAHME(C_Info)
{
	npc = GRD_264_Gardist;
	condition = Grd_264_Gardist_GARDEAUFNAHME_Condition;
	information = Grd_264_Gardist_GARDEAUFNAHME_Info;
	important = 1;
	permanent = 0;
};

func int Grd_264_Gardist_GARDEAUFNAHME_Condition()
{
	if((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,Grd_260_Drake_GARDEAUFNAHME))
	{
		return TRUE;
	};
};

func void Grd_264_Gardist_GARDEAUFNAHME_Info()
{
	AI_Output(self,other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_01");	//Poslyš, to byla dobrá práce, cos provedl s těmi červy! Zasloužíš si své místo mezi strážemi!
	AI_Output(self,other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_02");	//Jdi do Starého tábora a promluv si o tom s Thorusem!
	Log_CreateTopic(GE_BecomeGuard,LOG_NOTE);
	B_LogEntry(GE_BecomeGuard,"Jakmile přinesu ta vajíčka, musím si promluvit s Thorusem. Možná mě přijme ke strážím.");
};

