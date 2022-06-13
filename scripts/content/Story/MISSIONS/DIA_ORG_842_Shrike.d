instance DIA_Shrike_Exit(C_Info)
{
	npc = ORG_842_Shrike;
	nr = 999;
	condition = DIA_Shrike_Exit_Condition;
	information = DIA_Shrike_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Shrike_Exit_Condition()
{
	return 1;
};

func void DIA_Shrike_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Shrike_Hello(C_Info)
{
	npc = ORG_842_Shrike;
	nr = 1;
	condition = DIA_Shrike_Hello_Condition;
	information = DIA_Shrike_Hello_Info;
	important = 0;
	description = "Jak to jde?";
};

func int DIA_Shrike_Hello_Condition()
{
	return 1;
};

func void DIA_Shrike_Hello_Info()
{
	AI_Output(other,self,"DIA_Shrike_Hello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Shrike_Hello_07_01");	//Ztrať se!
	AI_StopProcessInfos(self);
};

instance DIA_Shrike_GetLost(C_Info)
{
	npc = ORG_842_Shrike;
	nr = 1;
	condition = DIA_Shrike_GetLost_Condition;
	information = DIA_Shrike_GetLost_Info;
	important = 0;
	description = "Ztrať se.";
};

func int DIA_Shrike_GetLost_Condition()
{
	if(self.aivar[AIV_WASDEFEATEDBYSC])
	{
		return 1;
	};
};

func void DIA_Shrike_GetLost_Info()
{
	AI_Output(other,self,"DIA_Shrike_GetLost_15_00");	//Ztrať se.
	AI_Output(self,other,"DIA_Shrike_GetLost_07_01");	//Ještě si popovídáme!
	Log_CreateTopic(CH1_ShrikesHut,LOG_MISSION);
	Log_SetTopicStatus(CH1_ShrikesHut,LOG_RUNNING);
	B_LogEntry(CH1_ShrikesHut,"Podařilo se přesvědčit Shrika, aby si našel jinou chatrč. Jsem zvědav, co na to řekne Gorn.");
	B_GiveXP(XP_KickedShrike);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"start");
};

