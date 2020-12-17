instance DIA_FRANCO_EXIT(C_Info)
{
	npc = org_866_franco;
	nr = 999;
	condition = dia_franco_exit_condition;
	information = dia_franco_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_franco_exit_condition()
{
	return 1;
};

func void dia_franco_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_FRANCO_HELLO(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_hello_condition;
	information = dia_franco_hello_info;
	permanent = 0;
	description = "Zdar!";
};

func int dia_franco_hello_condition()
{
	return 1;
};

func void dia_franco_hello_info()
{
	AI_Output(other,self,"DIA_Franco_Hello_15_00");	//Zdar!
	AI_Output(self,other,"DIA_Franco_Hello_15_01");	//Co chceš? Nevidíš, že mám práci?
	AI_StopProcessInfos(self);
};

instance DIA_FRANCO_HOWRU(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_howru_condition;
	information = dia_franco_howru_info;
	permanent = 0;
	description = "Jak to jde?";
};

func int dia_franco_howru_condition()
{
	if(Npc_KnowsInfo(hero,dia_franco_hello))
	{
		return 1;
	};
};

func void dia_franco_howru_info()
{
	AI_Output(other,self,"DIA_Franco_HowRU_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Franco_HowRU_15_01");	//Zase ty? Neřekl jsem ti snad už předtím, abys vypadnul?
	AI_StopProcessInfos(self);
};

instance DIA_FRANCO_ESTEBAN(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_esteban_condition;
	information = dia_franco_esteban_info;
	permanent = 0;
	description = "Co si myslíš o Estebanovi?";
};

func int dia_franco_esteban_condition()
{
	if(ESTEBAN_LEADER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_franco_esteban_info()
{
	AI_Output(other,self,"DIA_Franco_Esteban_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Franco_Esteban_15_01");	//Co je tobě do toho?
	AI_Output(self,other,"DIA_Franco_Esteban_15_02");	//Nevím, proč bych měl cokoliv řešit s cizincem.
	AI_Output(self,other,"DIA_Franco_Esteban_15_03");	//Tak odsud vysmahni!
	AI_StopProcessInfos(self);
};

instance DIA_FRANCO_AMULETT(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_amulett_condition;
	information = dia_franco_amulett_info;
	permanent = 0;
	description = "Je velmi důležité, abych něco zjistil ...";
};

func int dia_franco_amulett_condition()
{
	if((ESTEBAN_LEADER == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_franco_esteban))
	{
		return 1;
	};
};

func void dia_franco_amulett_info()
{
	AI_Output(other,self,"DIA_Franco_Amulett_15_00");	//Je velmi důležité, abych něco zjistil ...
	AI_Output(self,other,"DIA_Franco_Amulett_15_01");	//Opravdu je to pro tebe tak důležité?
	AI_Output(self,other,"DIA_Franco_Amulett_15_02");	//Dobře, mám pro tebe úkol.
	AI_Output(self,other,"DIA_Franco_Amulett_15_03");	//Chlapík z Nového tábora mi ukradl něco velmi cenného.
	AI_Output(self,other,"DIA_Franco_Amulett_15_04");	//Do tábora už ale nemůžu jít, před časem jsem se dostal do menších potíží ...
	AI_Output(self,other,"DIA_Franco_Amulett_15_05");	//Takže potřebuju aby tam někdo šel, o kom se neví, že mě zná.
	AI_Output(self,other,"DIA_Franco_Amulett_15_06");	//Ten někdo budeš ty.
	AI_Output(self,other,"DIA_Franco_Amulett_15_07");	//Chlap co mě okradl se jmenuje Bruce a je jedním z banditů.
	AI_Output(self,other,"DIA_Franco_Amulett_15_08");	//Bruce byl kdysi můj lovecký společník. Neudržel však prsty od mých věcí a ukradl mi amulet.
	AI_Output(self,other,"DIA_Franco_Amulett_15_09");	//Chci ho zpátky.
	AI_Output(self,other,"DIA_Franco_Amulett_15_10");	//Vsadím se, že ho ten parchant nosí kolem krku a prochází se s ním přes celý tábor.
	AI_Output(self,other,"DIA_Franco_Amulett_15_11");	//Pokud mi pomůžeš dostat ho zpět, tak si můžeme promluvit o čem chceš.
	AI_Output(self,other,"DIA_Franco_Amulett_15_12");	//Takže mi nejdřív dones to co chci.
	FRANCO_AMULETT = LOG_RUNNING;
	Log_CreateTopic(CH1_AMULETT,LOG_MISSION);
	Log_SetTopicStatus(CH1_AMULETT,LOG_RUNNING);
	B_LogEntry(CH1_AMULETT,"Pokud mi má Franco pomoci, první věc, kterou musím udělat, je získat zpět jeho amulet. Bruce, bandita z Nového tábora, mu ho prý ukradl. Byl Francovým loveckým společníkem a měl by stále být někde v táboře.");
	AI_StopProcessInfos(self);
};

var int franco_esteban;

instance DIA_FRANCO_SUCCESS(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_success_condition;
	information = dia_franco_success_info;
	permanent = 0;
	important = 0;
	description = "Tady je tvůj amulet.";
};

func int dia_franco_success_condition()
{
	if((FRANCO_AMULETT == LOG_RUNNING) && Npc_HasItems(hero,francos_amulett))
	{
		return 1;
	};
};

func void dia_franco_success_info()
{
	AI_Output(other,self,"DIA_Org_5033_Franco_SUCCESS_15_00");	//Tady je tvůj amulet.
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_01");	//Velmi dobře. Hehe.
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_02");	//Nevěřil bych, že to dokážeš.
	AI_Output(other,self,"DIA_Org_5033_Franco_SUCCESS_13_03");	//Chtěl jsi si se mnou promluvit ...
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_04");	//Ach ano. Quentin už jako šéf tohohle tábora nemá šanci. Myslím, že jeho místo zaujme Esteban.
	B_GiveInvItems(other,self,francos_amulett,1);
	FRANCO_AMULETT = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_AMULETT,LOG_SUCCESS);
	B_LogEntry(CH1_AMULETT,"Franco byl nepříjemný jako vždy, ale byl rád, že dostal svůj amulet zpátky.");
	B_GiveXP(XP_FRANCO);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Franco není z Quentinova vedení nadšený. Patří mezi chlapi, co stojí za Estebanem.");
	FRANCO_ESTEBAN = TRUE;
	AI_StopProcessInfos(self);
};

