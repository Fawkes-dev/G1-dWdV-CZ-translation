instance DIA_Melvin_Exit(C_Info)
{
	npc = VLK_582_Melvin;
	nr = 999;
	condition = DIA_Melvin_Exit_Condition;
	information = DIA_Melvin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Melvin_Exit_Condition()
{
	return 1;
};

func void DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Melvin_Hello(C_Info)
{
	npc = VLK_582_Melvin;
	nr = 1;
	condition = DIA_Melvin_Hello_Condition;
	information = DIA_Melvin_Hello_Info;
	permanent = 0;
	description = "Zdar! Ty nejsi z tohoto tábora, že ne?";
};

func int DIA_Melvin_Hello_Condition()
{
	return 1;
};

func void DIA_Melvin_Hello_Info()
{
	AI_Output(other,self,"DIA_Melvin_Hello_15_00");	//Zdar! Ty nejsi z tohoto tábora, že ne?
	AI_Output(self,other,"DIA_Melvin_Hello_03_01");	//Ano, jsem! Před týdnem jsem opustil Starý tábor. Řekl jsem svému kamarádovi Dustymu, aby šel se mnou, ale chtěl počkat.
	Log_CreateTopic(CH1_RecruitDusty,LOG_MISSION);
	Log_SetTopicStatus(CH1_RecruitDusty,LOG_RUNNING);
	B_LogEntry(CH1_RecruitDusty,"Kopáč Melvin se přidal k Bratrstvu. Jeho kamarád Dusty stále zůstává ve Starém táboře, ale také pomýšlí na odchod.");
};

instance DIA_Melvin_MetDusty(C_Info)
{
	npc = VLK_582_Melvin;
	nr = 1;
	condition = DIA_Melvin_MetDusty_Condition;
	information = DIA_Melvin_MetDusty_Info;
	permanent = 0;
	description = "Znám Dustyho - před nedávnem jsem s ním mluvil.";
};

func int DIA_Melvin_MetDusty_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Melvin_Hello) && Npc_KnowsInfo(hero,DIA_Dusty_Hello) && (BaalTondral_GetNewGuy != LOG_SUCCESS))
	{
		return 1;
	};
};

func void DIA_Melvin_MetDusty_Info()
{
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_00");	//Znám Dustyho - před nedávnem jsem s ním mluvil.
	AI_Output(self,other,"DIA_Melvin_MetDusty_03_01");	//Kdybys ho potkal zase, řekni mu, že byl tupý, když tam zůstal. Je to desetkrát lepší, než se nechat otravovat od stráží ve Starém táboře.
	AI_Output(other,self,"DIA_Melvin_MetDusty_15_02");	//Řeknu mu to, až ho zase uvidím.
};

