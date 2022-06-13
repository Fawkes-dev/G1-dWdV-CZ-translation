instance STT_300_Alberto_Exit(C_Info)
{
	npc = STT_300_Alberto;
	nr = 999;
	condition = STT_300_Alberto_Exit_Condition;
	information = STT_300_Alberto_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int STT_300_Alberto_Exit_Condition()
{
	return 1;
};

func void STT_300_Alberto_Exit_Info()
{
	AI_StopProcessInfos(self);
};

var int alberto_trade;

instance STT_300_Alberto_BUY(C_Info)
{
	npc = STT_300_Alberto;
	condition = STT_300_Alberto_BUY_Condition;
	information = STT_300_Alberto_BUY_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};

func int STT_300_Alberto_BUY_Condition()
{
	return 1;
};

func void STT_300_Alberto_BUY_Info()
{
	AI_Output(other,self,"STT_300_Alberto_BUY_Info_15_01");	//Můžu s tebou něco vyměnit?
	AI_Output(self,other,"STT_300_Alberto_BUY_Info_12_02");	//Jistě, cokoliv. Jestli máš rudu.
	if(ALBERTO_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Alberto, jeden ze Stínů Starého dolu, obchoduje s různým zbožím. Nachází se na hlavní úrovni dolu.");
		ALBERTO_TRADE = TRUE;
	};
};

