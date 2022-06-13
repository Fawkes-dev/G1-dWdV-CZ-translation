instance DIA_Silas_EXIT(C_Info)
{
	npc = ORG_841_Silas;
	nr = 999;
	condition = DIA_Silas_EXIT_Condition;
	information = DIA_Silas_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Silas_EXIT_Condition()
{
	return 1;
};

func void DIA_Silas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Silas_Hehler(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Hehler_Condition;
	information = DIA_Silas_Hehler_Info;
	permanent = 0;
	description = "Jak to jde?";
};

func int DIA_Silas_Hehler_Condition()
{
	return 1;
};

func void DIA_Silas_Hehler_Info()
{
	AI_Output(other,self,"DIA_Silas_Hehler_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Silas_Hehler_06_01");	//Dobře! Obchodujeme pálenkou z naší domácí rýže a měníme ji za rudu.
	AI_Output(self,other,"DIA_Silas_Hehler_06_02");	//Dobrá, ti hoši přinesli dost rudy. Kde je utratí, když ne tady?
};

instance DIA_Silas_Trade(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Trade_Condition;
	information = DIA_Silas_Trade_Info;
	permanent = 1;
	description = "Chci se napít.";
	trade = 1;
};

func int DIA_Silas_Trade_Condition()
{
	return 1;
};

func void DIA_Silas_Trade_Info()
{
	AI_Output(other,self,"DIA_Silas_Trade_15_00");	//Chci se napít.
	AI_Output(self,other,"DIA_Silas_Trade_06_01");	//Budeš za to muset zaplatit.
};

instance DIA_SILAS_QUEST(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_quest_condition;
	information = dia_silas_quest_info;
	permanent = 0;
	description = "Potřebuješ pomoc?";
};

func int dia_silas_quest_condition()
{
	return 1;
};

func void dia_silas_quest_info()
{
	AI_Output(other,self,"DIA_Silas_Quest_15_00");	//Potřebuješ pomoc?
	AI_Output(self,other,"DIA_Silas_Quest_06_01");	//Slyšel jsem, že Gomezovi lidi mají opravdu dobré pivo.
	AI_Output(self,other,"DIA_Silas_Quest_06_02");	//Silné pivo, co jsem slyšel.
	AI_Output(self,other,"DIA_Silas_Quest_06_03");	//Rýžová pálenka vydělá hodně rudy, ale kdybych měl v ponuce i pořádné pivo, mohl bych ho prodat za dvojnásobnou cenu.
	AI_Output(self,other,"DIA_Silas_Quest_06_04");	//Pokud vím, máš dobré kontakty ve Starém táboře, tak měj uši i oči otevřené, třeba se ti podaří pár láhví sehnat.
	AI_Output(self,other,"DIA_Silas_Quest_06_05");	//Samozřejmě ti za ně zaplatím.
	SILAS_BEER = LOG_RUNNING;
	Log_CreateTopic(CH1_SILAS,LOG_MISSION);
	Log_SetTopicStatus(CH1_SILAS,LOG_RUNNING);
	B_LogEntry(CH1_SILAS,"Silas, hostinský v baru na jezeře Nového tábora, by rád získal pár láhví silného piva. Řekl, že slyšel, že se dá sehnat takové ve Starém táboře. Mám mít uši i oči nastražené.");
};

instance DIA_SILAS_BEER(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_beer_condition;
	information = dia_silas_beer_info;
	permanent = 1;
	description = "Tady je to silné pivo.";
};

func int dia_silas_beer_condition()
{
	if(Npc_KnowsInfo(hero,dia_silas_quest) && (SILAS_BEER == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_silas_beer_info()
{
	AI_Output(other,self,"DIA_Silas_Beer_15_00");	//Tady je to silné pivo.
	AI_Output(self,other,"DIA_Silas_Beer_15_01");	//Jsem na to zvědavý.
	if(Npc_HasItems(other,ItFo_OM_Beer_01) >= 6)
	{
		AI_Output(self,other,"DIA_Silas_Beer_15_02");	//Dobrá práce. Nyní mohou chlapi vyzkoušet pořádné pivo.
		B_GiveInvItems(hero,self,ItFo_OM_Beer_01,6);
		SILAS_BEER = LOG_SUCCESS;
		Log_CreateTopic(CH1_SILAS,LOG_MISSION);
		Log_SetTopicStatus(CH1_SILAS,LOG_SUCCESS);
		B_LogEntry(CH1_SILAS,"Donesl jsem Silasovi basu silného piva, byl nadmíru spokojený. Svou spokojenost vyjádřil i formou rudy.");
		B_GiveXP(XP_SILAS);
	}
	else
	{
		AI_Output(self,other,"DIA_Silas_Beer_15_04");	//Mělo by to být víc lahví.
		AI_Output(self,other,"DIA_Silas_Beer_15_05");	//Sežeň mi alespoň 6 lahví.
	};
};

