instance STT_335_Santino_Exit(C_Info)
{
	npc = STT_335_Santino;
	nr = 999;
	condition = STT_335_Santino_Exit_Condition;
	information = STT_335_Santino_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int STT_335_Santino_Exit_Condition()
{
	return 1;
};

func void STT_335_Santino_Exit_Info()
{
	AI_StopProcessInfos(self);
};

var int santino_trade;

instance STT_335_Santino_BUY(C_Info)
{
	npc = STT_335_Santino;
	condition = STT_335_Santino_BUY_Condition;
	information = STT_335_Santino_BUY_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};

func int STT_335_Santino_BUY_Condition()
{
	return 1;
};

func void STT_335_Santino_BUY_Info()
{
	AI_Output(other,self,"STT_335_Santino_BUY_Info_15_01");	//Můžu s tebou obchodovat?
	AI_Output(self,other,"STT_335_Santino_BUY_Info_07_02");	//Mám všechno, co potřebuješ. A to, co nemám, taky nechceš.
	if(SANTINO_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Santino, Stín ve Starém dole, obchoduje s různým zbožím. Je vždy na nejvyšší úrovni dolu.");
		SANTINO_TRADE = TRUE;
	};
};

