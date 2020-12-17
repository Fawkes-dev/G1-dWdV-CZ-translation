instance Info_Mine_Vlk_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Vlk_3_EXIT_Condition;
	information = Info_Mine_Vlk_3_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Mine_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Mine_Vlk_3_Mine(C_Info)
{
	nr = 4;
	condition = Info_Mine_Vlk_3_Mine_Condition;
	information = Info_Mine_Vlk_3_Mine_Info;
	permanent = 1;
	description = "Řekni mi něco o dole.";
};

func int Info_Mine_Vlk_3_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00");	//Řekni mi něco o dole.
	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01");	//Celý týden musíme tvrdě pracovat a nikdy se nedočkáme denního světla. Není úniku. Jediná cesta odtud je smrt.
};

instance Info_Mine_Vlk_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Vlk_3_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_Mine_Vlk_3_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01");	//Ian je můj šéf. Asghan je velitel stráže.
};

instance Info_Mine_Vlk_3_Minecrawler(C_Info)
{
	nr = 2;
	condition = Info_Mine_Vlk_3_Minecrawler_Condition;
	information = Info_Mine_Vlk_3_Minecrawler_Info;
	permanent = 1;
	description = "Co víš o červech?";
};

func int Info_Mine_Vlk_3_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00");	//Co víš o důlních červech?
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01");	//Jak se nejlíp vypořádat s červy? Útěkem. Utíkat, co ti síly stačí.
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02");	//Když se netrefíš, je konec. Takže nesmíš nikdy minout.
};

instance Info_Mine_Vlk_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Vlk_3_DieLage_Condition;
	information = Info_Mine_Vlk_3_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Mine_Vlk_3_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01");	//Skvěle, bolí mě záda, ruce jako by mi upadly, jazyk suchý jako troud a k tomu jsem na smrt unavený.
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02");	//A neustálé údery krumpáče mě pomalu tvarují do oblouku.
};

func void B_AssignAmbientInfos_Mine_Vlk_3(var C_Npc slf)
{
	Info_Mine_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

