instance Tpl_1400_GorNaBar_Exit(C_Info)
{
	npc = TPL_1400_GorNaBar;
	nr = 999;
	condition = Tpl_1400_GorNaBar_Exit_Condition;
	information = Tpl_1400_GorNaBar_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1400_GorNaBar_Exit_Condition()
{
	return 1;
};

func void Tpl_1400_GorNaBar_Exit_Info()
{
	AI_Output(self,other,"Tpl_1400_GorNaBar_Exit_Info_09_02");	//Kéž tě Spáč ochrání!
	AI_StopProcessInfos(self);
};

instance Tpl_1400_GorNaBar_SUGGEST(C_Info)
{
	npc = TPL_1400_GorNaBar;
	condition = Tpl_1400_GorNaBar_SUGGEST_Condition;
	information = Tpl_1400_GorNaBar_SUGGEST_Info;
	important = 0;
	permanent = 0;
	description = "Potřebuju tvoji pomoc.";
};

func int Tpl_1400_GorNaBar_SUGGEST_Condition()
{
	if(Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN) && !Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW))
	{
		return TRUE;
	};
};

func void Tpl_1400_GorNaBar_SUGGEST_Info()
{
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01");	//Potřebuju tvoji pomoc.
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02");	//Hledám pro Kaloma výměšek a asi vím, kde je červí hnízdo.
	AI_Output(other,self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03");	//Jestli otevřeme chodbu, budeš tam taky?
	AI_Output(self,other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04");	//Hnízdo důlních červů. Konečně! Můj meč je ti k službám!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GATE");
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	B_GiveXP(XP_HireGorNaBar);
	B_LogEntry(CH2_MCEggs,"Když jsem se zmínil o hnízdě důlních červů, templář Gor Na Bar přislíbil posilu posádce u Asghanových vrat. Tam ho také najdu.");
};

instance Tpl_1400_GorNaBar_INFO(C_Info)
{
	npc = TPL_1400_GorNaBar;
	condition = Tpl_1400_GorNaBar_INFO_Condition;
	information = Tpl_1400_GorNaBar_INFO_Info;
	important = 0;
	permanent = 1;
	description = "Co víš o důlních červech?";
};

func int Tpl_1400_GorNaBar_INFO_Condition()
{
	if(!Npc_KnowsInfo(hero,Grd_263_Asghan_NEST))
	{
		return 1;
	};
};

func void Tpl_1400_GorNaBar_INFO_Info()
{
	AI_Output(other,self,"Tpl_1400_GorNaBar_INFO_Info_15_01");	//Co víš o důlních červech?
	AI_Output(self,other,"Tpl_1400_GorNaBar_INFO_Info_09_02");	//Červi tu musí mít někde hnízdo. Kdybysme jenom věděli kde, mohli bysme zničit všechna mláďata.
};

instance Tpl_1400_GorNaBar_VICTORY(C_Info)
{
	npc = TPL_1400_GorNaBar;
	condition = Tpl_1400_GorNaBar_VICTORY_Condition;
	information = Tpl_1400_GorNaBar_VICTORY_Info;
	important = 0;
	permanent = 0;
	description = "Našel jsem hnízdo královny!";
};

func int Tpl_1400_GorNaBar_VICTORY_Condition()
{
	if(Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1)
	{
		return TRUE;
	};
};

func void Tpl_1400_GorNaBar_VICTORY_Info()
{
	AI_Output(other,self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01");	//Našel jsem hnízdo královny!
	AI_Output(self,other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02");	//Ukázal jsi odvahu a důvtip! Potřebujeme lidi, jako jsi ty!
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
		B_LogEntry(GE_BecomeTemplar,"Na Gor Na Bara zapůsobilo, že jsem porazil Královnu Důlních červů. Řekl mi, že někdo jako já by byl v Táboře v bažinách opravdu užitečný.");
	};
};

