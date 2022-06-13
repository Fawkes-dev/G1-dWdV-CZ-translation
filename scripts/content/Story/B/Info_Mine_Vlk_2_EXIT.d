instance Info_Mine_Vlk_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Vlk_2_EXIT_Condition;
	information = Info_Mine_Vlk_2_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Mine_Vlk_2_Mine(C_Info)
{
	nr = 4;
	condition = Info_Mine_Vlk_2_Mine_Condition;
	information = Info_Mine_Vlk_2_Mine_Info;
	permanent = 1;
	description = "Řekni mi něco o dole.";
};

func int Info_Mine_Vlk_2_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00");	//Řekni mi něco o dole.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01");	//Je tu spousta jeskyní, kde ještě zůstala nějaká ruda. Ale kvůli červům není možné se k ní dostat.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02");	//Příliš útoků, příliš ztrát.
};

instance Info_Mine_Vlk_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo tady má velení?";
};

func int Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01");	//Viper je tavič. Ví o pecích všechno a tělo má jak z železa. Vůbec neví, co je horko. Celý den stráví tavením rudy.
};

instance Info_Mine_Vlk_2_Minecrawler(C_Info)
{
	nr = 2;
	condition = Info_Mine_Vlk_2_Minecrawler_Condition;
	information = Info_Mine_Vlk_2_Minecrawler_Info;
	permanent = 1;
	description = "Co víš o červech?";
};

func int Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00");	//Co víš o důlních červech?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01");	//Musíme se dostat blíž k té velké jámě u dna. Je to tam samý červ.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02");	//Důlní červi jsou tady všude. Ty je neslyšíš? Já tedy jo!
};

instance Info_Mine_Vlk_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Vlk_2_DieLage_Condition;
	information = Info_Mine_Vlk_2_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Mine_Vlk_2_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00");	//Jak se máš?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01");	//Mám moc práce. Jestli mě stráže nachytají, jak tady zahálím, zarazí mi příděly.
};

func void B_AssignAmbientInfos_Mine_Vlk_2(var C_Npc slf)
{
	Info_Mine_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

