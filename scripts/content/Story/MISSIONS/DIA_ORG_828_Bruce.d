instance DIA_BRUCE_EXIT(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 999;
	condition = dia_bruce_exit_condition;
	information = dia_bruce_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_bruce_exit_condition()
{
	return 1;
};

func void dia_bruce_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BRUCE_HELLO(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_hello_condition;
	information = dia_bruce_hello_info;
	permanent = 1;
	important = 0;
	description = "Jak to vypadá?";
};

func int dia_bruce_hello_condition()
{
	return 1;
};

func void dia_bruce_hello_info()
{
	AI_Output(other,self,"DIA_Bruce_Hello_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Bruce_Hello_12_01");	//Kdo jsi? Ještě jsem tě tu neviděl.
	AI_Output(other,self,"DIA_Bruce_Hello_12_02");	//Není divu, jsem tu nový.
	AI_Output(self,other,"DIA_Bruce_Hello_12_03");	//Aha. Přišel jsi se podívat na to jak to tu vypadá?
	AI_Output(self,other,"DIA_Bruce_Hello_12_04");	//Jestli hledáš nějakou práci, promluv si s Laresem. Ten ti hned nějakou najde.
	AI_StopProcessInfos(self);
};

instance DIA_BRUCE_AMULETT(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_amulett_condition;
	information = dia_bruce_amulett_info;
	permanent = 0;
	important = 0;
	description = "To je zajímavý amulet, co nosíš.";
};

func int dia_bruce_amulett_condition()
{
	if(FRANCO_AMULETT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_bruce_amulett_info()
{
	AI_Output(other,self,"DIA_Bruce_Amulett_15_00");	//To je zajímavý amulet, co nosíš.
	AI_Output(self,other,"DIA_Bruce_Amulett_12_01");	//To je. Hehe.
	AI_Output(self,other,"DIA_Bruce_Amulett_12_02");	//Jeden z našich banditů mi ho nedávno daroval.
};

instance DIA_BRUCE_FRANCO(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_franco_condition;
	information = dia_bruce_franco_info;
	permanent = 0;
	important = 0;
	description = "To je Frankův amulet. Myslím, že jsi mu ho ukradl.";
};

func int dia_bruce_franco_condition()
{
	if((FRANCO_AMULETT == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_bruce_amulett))
	{
		return 1;
	};
};

func void dia_bruce_franco_info()
{
	AI_Output(other,self,"DIA_Bruce_Franco_15_00");	//To je Frankův amulet. Myslím, že jsi mu ho ukradl.
	AI_Output(self,other,"DIA_Bruce_Franco_12_01");	//A? A co když ano?
	AI_Output(self,other,"DIA_Bruce_Franco_12_02");	//Jestli chceš, můžeš mi ho zkusit vzít.
	AI_StopProcessInfos(self);
};

