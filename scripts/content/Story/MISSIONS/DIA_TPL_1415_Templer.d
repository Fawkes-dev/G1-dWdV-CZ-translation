instance DIA_Tpl_1415_Torwache_Exit(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 999;
	condition = DIA_Tpl_1415_Torwache_Exit_Condition;
	information = DIA_Tpl_1415_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Tpl_1415_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Tpl_1415_Torwache_First(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 2;
	condition = DIA_Tpl_1415_Torwache_First_Condition;
	information = DIA_Tpl_1415_Torwache_First_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Tpl_1415_Torwache_First_Condition()
{
	if(Kapitel >= 2)
	{
		return FALSE;
	};
	if(Npc_GetDistToWP(other,"PSI_START") > 800)
	{
		Npc_SetRefuseTalk(self,30);
	};
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Tpl_1415_Torwache_First_Info()
{
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_00");	//Buď zdráv, cizinče!
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_01");	//Šlapeš po svaté půdě. Tohle je Bratrstvo Spáče.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_02");	//Co nám přinášíš?
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
	Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Jsem tady nový. Chci si prohlédnout váš tábor.",DIA_Tpl_1415_Torwache_First_JustLooking);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Chci s k vám přidat.",DIA_Tpl_1415_Torwache_First_Join);
	};
};

func void DIA_Tpl_1415_Torwache_First_Join()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_Join_15_00");	//Slyšel jsem, že hledáte nové lidi. Chci se k vám přidat.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_01");	//Pak buď vítán. Bratrstvo Spáče má místo pro každého, kdo se chce nechat vést duchem Spáče.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_02");	//Jestli to myslíš vážně, měl by ses pokusit upoutat pozornost Baala Namiba. Přebývá na dvoře, hned za branou.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_04");	//Nesmíš na něj ale mluvit. Počkej, až tě sám vyzve.
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
};

func void DIA_Tpl_1415_Torwache_First_JustLooking()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00");	//Jsem tady nový. Chci si prohlédnout váš tábor.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01");	//Cizinci jsou tu vítáni.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02");	//Je ale důležité dodržovat pravidla. Jsou určité oblasti, do kterých cizinci nesmějí.
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
};

instance DIA_Tpl_1415_Torwache_Sit(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 2;
	condition = DIA_Tpl_1415_Torwache_Sit_Condition;
	information = DIA_Tpl_1415_Torwache_Sit_Info;
	permanent = 1;
	description = "Jak to v táboře jde?";
};

func int DIA_Tpl_1415_Torwache_Sit_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_Sit_Info()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_Sit_15_00");	//Jak to v táboře jde?
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_Sit_13_01");	//Všude klid. Tak pojď.
};

instance Tpl_1415_Torwache_TEMPLERAUFNAHME(C_Info)
{
	npc = TPL_1415_Templer;
	condition = Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition;
	information = Tpl_1415_Torwache_TEMPLERAUFNAHME_Info;
	important = 1;
	permanent = 0;
};

func int Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition()
{
	if(((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void Tpl_1415_Torwache_TEMPLERAUFNAHME_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01");	//Hej, slyšel jsem, co se stalo v dole. Boží dílo. Zasloužíš si být jmenován templářem!
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02");	//Promluv si s Corem Angarem!
	Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry(GE_BecomeTemplar,"Měl bych si promluvit s Corem Angarem. Možná mi dovolí přidat se k templářům.");
};

instance Tpl_1415_Templer_ROCK(C_Info)
{
	npc = TPL_1415_Templer;
	condition = Tpl_1415_Templer_ROCK_Condition;
	information = Tpl_1415_Templer_ROCK_Info;
	important = 0;
	permanent = 1;
	description = "Potřebuji nějakou zbroj.";
};

func int Tpl_1415_Templer_ROCK_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void Tpl_1415_Templer_ROCK_Info()
{
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_10_01");	//Potřebuji zbroj.
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_10_02");	//Pak se musíš připojit k našemu Bratrstvu. Nemůžeme jen tak prodávat zbroje cizincům.
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_10_03");	//Každý nováček dostane bederní roušku, není to nic moc, ale jednou ti může zachránit život.
};

