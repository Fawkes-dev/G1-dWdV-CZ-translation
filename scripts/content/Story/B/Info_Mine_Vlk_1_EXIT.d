instance Info_Mine_Vlk_1_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Vlk_1_EXIT_Condition;
	information = Info_Mine_Vlk_1_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Mine_Vlk_1_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Mine_Vlk_1_Mine(C_Info)
{
	nr = 4;
	condition = Info_Mine_Vlk_1_Mine_Condition;
	information = Info_Mine_Vlk_1_Mine_Info;
	permanent = 1;
	description = "Řekni mi něco o dole.";
};

func int Info_Mine_Vlk_1_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00");	//Řekni mi něco o dole.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01");	//V jeskyních rostou houby a byliny. Snadno se tráví, ale nikdy se tím nenacpeš tak krásně jako pořádnou flákotou masa!
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02");	//Červi tak dobře nechutnají. Taková havěť.
};

instance Info_Mine_Vlk_1_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Vlk_1_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_1_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady má na starosti?";
};

func int Info_Mine_Vlk_1_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01");	//Ian je můj šéf. Organizuje pracovní síly a vyměňuje zboží s táborem. Pokud něco chceš, měl bys mu to říci.
};

instance Info_Mine_Vlk_1_Minecrawler(C_Info)
{
	nr = 2;
	condition = Info_Mine_Vlk_1_Minecrawler_Condition;
	information = Info_Mine_Vlk_1_Minecrawler_Info;
	permanent = 1;
	description = "Co víš o červech?";
};

func int Info_Mine_Vlk_1_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00");	//Co víš o důlních červech?
	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01");	//Templáři udělali s Gomezem smlouvu. Zabijí červy a pak si budou moci nechat jejich čelisti.
};

instance Info_Mine_Vlk_1_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Vlk_1_DieLage_Condition;
	information = Info_Mine_Vlk_1_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Mine_Vlk_1_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01");	//Spousta práce, žádný odpočinek. Tak se rychle ptej. Mám moc práce.
};

func void B_AssignAmbientInfos_Mine_Vlk_1(var C_Npc slf)
{
	Info_Mine_Vlk_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_DieLage.npc = Hlp_GetInstanceID(slf);
};

