instance DIA_SLD_751_Soeldner_INTRO(C_Info)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_751_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};

func int DIA_SLD_751_Soeldner_INTRO_CONDITION()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return 1;
	};
};

func void DIA_SLD_751_Soeldner_INTRO_INFO()
{
	AI_Output(self,other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01");	//Á, návštěvník! Nedělej tady žádné rozbroje, jinak to schytáš!
};

instance DIA_SLD_751_Soeldner_EXIT_1(C_Info)
{
	nr = 999;
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_751_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
	description = "Raději půjdu!";
};

func int DIA_SLD_751_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_EXIT_1_INFO()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01");	//Raději půjdu!
	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");	//To doufám.
	AI_StopProcessInfos(self);
};

instance DIA_SLD_751_Soeldner_EXIT_2(C_Info)
{
	nr = 999;
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_751_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
	description = "Musím jít dál.";
};

func int DIA_SLD_751_Soeldner_EXIT_2_CONDITION()
{
	if(Npc_KnowsInfo(hero,DIA_SLD_751_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_751_Soeldner_EXIT_2_INFO()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01");	//Musím jít dál.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");	//Tak běž.
	AI_StopProcessInfos(self);
};

instance DIA_SLD_751_Soeldner_UMSEHEN(C_Info)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_751_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
	description = "Chci se tu porozhlédnout.";
};

func int DIA_SLD_751_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_UMSEHEN_INFO()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01");	//Chci se tu porozhlédnout.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");	//Pak dávej pozor, abys nikomu nešlápl na nohu.
	AI_StopProcessInfos(self);
};

instance DIA_SLD_751_Soeldner_INMINE(C_Info)
{
	npc = SLD_751_Soeldner;
	condition = DIA_SLD_751_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_751_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
	description = "Chci jít do dolu.";
};

func int DIA_SLD_751_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_INMINE_INFO()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01");	//Chci jít do dolu.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");	//Nevěřím, že se ti to povede. Promluv si ale s Okylem.
	AI_StopProcessInfos(self);
};

