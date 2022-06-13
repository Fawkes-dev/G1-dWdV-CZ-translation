instance DIA_SLD_760_Soeldner_INTRO(C_Info)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_INTRO_CONDITION;
	information = DIA_SLD_760_Soeldner_INTRO_INFO;
	important = 1;
	permanent = 0;
};

func int DIA_SLD_760_Soeldner_INTRO_CONDITION()
{
	if(Npc_GetDistToNpc(self,hero) < 200)
	{
		return 1;
	};
};

func void DIA_SLD_760_Soeldner_INTRO_INFO()
{
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01");	//Co se tu potloukáš? Řeknu ti jedno: kliď se od mých dveří!
};

instance DIA_SLD_760_Soeldner_EXIT_1(C_Info)
{
	nr = 999;
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_EXIT_1_CONDITION;
	information = DIA_SLD_760_Soeldner_EXIT_1_INFO;
	important = 0;
	permanent = 0;
	description = "Raději půjdu!";
};

func int DIA_SLD_760_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_EXIT_1_INFO()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01");	//Raději půjdu!
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");	//To doufám.
	AI_StopProcessInfos(self);
};

instance DIA_SLD_760_Soeldner_EXIT_2(C_Info)
{
	nr = 999;
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_EXIT_2_CONDITION;
	information = DIA_SLD_760_Soeldner_EXIT_2_INFO;
	important = 0;
	permanent = 1;
	description = "Musím jít dál.";
};

func int DIA_SLD_760_Soeldner_EXIT_2_CONDITION()
{
	if(Npc_KnowsInfo(hero,DIA_SLD_760_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_760_Soeldner_EXIT_2_INFO()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01");	//Potřebuju jít dál.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");	//Tak běž.
	AI_StopProcessInfos(self);
};

instance DIA_SLD_760_Soeldner_UMSEHEN(C_Info)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_UMSEHEN_CONDITION;
	information = DIA_SLD_760_Soeldner_UMSEHEN_INFO;
	important = 0;
	permanent = 0;
	description = "Chtěl bych se tady porozhlédnout.";
};

func int DIA_SLD_760_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_UMSEHEN_INFO()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01");	//Chtěl bych se tady porozhlédnout.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");	//Vyndej si ruce z kapes nebo ti je urazím!
	AI_StopProcessInfos(self);
};

instance DIA_SLD_760_Soeldner_INMINE(C_Info)
{
	npc = SLD_760_Soeldner;
	condition = DIA_SLD_760_Soeldner_INMINE_CONDITION;
	information = DIA_SLD_760_Soeldner_INMINE_INFO;
	important = 0;
	permanent = 0;
	description = "Chci jít do dolu.";
};

func int DIA_SLD_760_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_INMINE_INFO()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01");	//Chci jít do dolu.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");	//Do dolu? Bez Okylova povolení nikoho dovnitř nepustím.
	if(!Npc_KnowsInfo(hero,dia_sld_752_okyl_werbistdu))
	{
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");	//Kdo je Okyl?
	}
	else
	{
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");	//Okyl, není to ten chlapík s velkou sekyrou a těžkou zbrojí?
	};
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");	//Dávej pozor na to, co říkáš a jak mluvíš o našem šéfovi.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");	//Řeknu ti něco o Okylovi, je to nejtvrdší chlap z celého tábora. Jednou se dokonce vplížil na hrad ve Starém táboře a ukradl tam Rudobaronům hromadu rudy.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");	//Tak zachovej trochu úcty, prosím.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");	//Nevím kde je, ale jestli ho potkáš, měl bys mít tuhle věc stále na paměti.
};

