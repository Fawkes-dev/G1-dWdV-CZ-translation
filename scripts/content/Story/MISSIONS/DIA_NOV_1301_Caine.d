instance DIA_Caine_Exit(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 999;
	condition = DIA_Caine_Exit_Condition;
	information = DIA_Caine_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Caine_Exit_Condition()
{
	return 1;
};

func void DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Caine_Hallo(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Hallo_Condition;
	information = DIA_Caine_Hallo_Info;
	permanent = 0;
	description = "Zdar! Jsem tu nový!";
};

func int DIA_Caine_Hallo_Condition()
{
	return 1;
};

func void DIA_Caine_Hallo_Info()
{
	AI_Output(other,self,"DIA_Caine_Hallo_15_00");	//Zdar! Jsem tu nový!
	AI_Output(self,other,"DIA_Caine_Hallo_13_01");	//Já... Já... Já jsem Caine, žák Cora Kaloma. Určitě jsi o něm slyšel, že jo?
	Info_ClearChoices(DIA_Caine_Hallo);
	Info_AddChoice(DIA_Caine_Hallo,"Ne.",DIA_Caine_Hallo_Nein);
	Info_AddChoice(DIA_Caine_Hallo,"Ano.",DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00");	//Tak.
	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01");	//Pak musíš vědět, že je to druhý muž tohohle tábora... p-po Y´Berionovi.
	Info_ClearChoices(DIA_Caine_Hallo);
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00");	//Ne.
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01");	//Ne?! Ty tady asi nebudeš dlouho, viď?
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02");	//Cor Kalom je druhý nejdůležitější muž po Y´Berionovi. Rozhoduje, kdo se k nám může přidat jako novic.
	Info_ClearChoices(DIA_Caine_Hallo);
};

instance DIA_CAINE_WAYSTOKALOM(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_waystokalom_condition;
	information = dia_caine_waystokalom_info;
	permanent = 0;
	description = "Rád bych mluvil s Cor Kalomem - můžeš mi pomoct se k němu dostat?";
};

func int dia_caine_waystokalom_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (KALOMS_GUARD == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_waystokalom_info()
{
	AI_Output(other,self,"DIA_Caine_WaysToKalom_15_00");	//Rád bych mluvil s Cor Kalomem - můžeš mi pomoct se k němu dostat?
	AI_Output(self,other,"DIA_Caine_WaysToKalom_13_01");	//Jestli chceš jít za Cor Kalomem, tak potřebuješ mít dobrý důvod.
	AI_Output(self,other,"DIA_Caine_WaysToKalom_13_02");	//Strážce má pokyn pouštět dnu jenom ty z nás, kteří nesou alchymistické přísady. Anebo ty, kteří byly poslání někým z Guru.
	if(KALOMS_GUARD == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Pokud chci mluvit s Corem Kalomem, potřebuji buďto alchymistické substance, anebo povolení od Guru.");
	};
};

instance DIA_CAINE_ALCHEMIES(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_alchemies_condition;
	information = dia_caine_alchemies_info;
	permanent = 0;
	description = "Jaký druh alchymistických substancí můžu přinést Cor Kalomovi?";
};

func int dia_caine_alchemies_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_waystokalom) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (KALOMS_GUARD == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_alchemies_info()
{
	AI_Output(other,self,"DIA_Caine_Alchemies_15_00");	//Jaký druh alchymistických přísad můžu přinést Cor Kalomovi?
	AI_Output(self,other,"DIA_Caine_Alchemies_13_01");	//Cor Kalom potřebuje sekrét z čelistí Důlních červů. Pokud doneseš dost čelistí, tak tě stráž určitě vpustí do jeho laboratoře.
	AI_Output(self,other,"DIA_Caine_Alchemies_13_02");	//Mimo čelistí potřebuje také rostliny a bobule co rostou mezi tábory, ty ale stačí dát Fortunovi.
	if(KALOMS_GUARD == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Stráž mě vpustí ke Cor Kalomovi, pokud mu přinesu čelisti Důlních červů.");
	};
};

instance DIA_Caine_Job(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Job_Condition;
	information = DIA_Caine_Job_Info;
	permanent = 0;
	description = "Co je tvá práce?";
};

func int DIA_Caine_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return 1;
	};
};

func void DIA_Caine_Job_Info()
{
	AI_Output(other,self,"DIA_Caine_Job_15_00");	//A co máš na starosti ty?
	AI_Output(self,other,"DIA_Caine_Job_13_01");	//Já... Já... Já pomáhám svému mistrovi připravovat alchymistické lektvary.
	AI_Output(self,other,"DIA_Caine_Job_13_02");	//Většinou z d-drogy z b-bažin a z výměšků důlních červů. T.. ten výměšek je nesmírně žádaný.
};

instance DIA_Caine_WoSekret(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WoSekret_Condition;
	information = DIA_Caine_WoSekret_Info;
	permanent = 0;
	description = "Kde dostanu ten výměšek důlních červů?";
};

func int DIA_Caine_WoSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_WoSekret_Info()
{
	AI_Output(other,self,"DIA_Caine_WoSekret_15_00");	//Kde dostanu ten výměšek důlních červů?
	AI_Output(self,other,"DIA_Caine_WoSekret_13_01");	//Červy najdeš ve Starém dole. Musíš ale vědět, jak ten výměšek získat.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_02");	//Jestli chceš s těmi bestiemi opravdu bojovat, měl by sis promluvit s některým z templářů, kteří s tím mají zkušenosti. Jako třeba Gor Na Drak.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_03");	//Cestuje mezi naším táborem a Starým dolem každý den. R-ráno ho najdeš v dílně.
};

instance DIA_Caine_AddInfoKalom(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_AddInfoKalom_Condition;
	information = DIA_Caine_AddInfoKalom_Info;
	permanent = 0;
	description = "Co mi ještě můžeš říci o svém mistrovi?";
};

func int DIA_Caine_AddInfoKalom_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_AddInfoKalom_Info()
{
	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00");	//Co mi ještě můžeš říci o svém mistrovi?
	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01");	//On... on není jako... ostatní Guru. Každý se na něj může obrátit, ale... ale NIKDO nesmí plýtvat jeho vzácným časem.
};

instance DIA_CAINE_WIEGURUSEND(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_wiegurusend_condition;
	information = dia_caine_wiegurusend_info;
	permanent = 0;
	description = "Jak docílím toho aby mě někdo z Guru poslal za Cor Kalomem?";
};

func int dia_caine_wiegurusend_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_waystokalom) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (KALOMS_GUARD == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_wiegurusend_info()
{
	AI_Output(other,self,"DIA_Caine_WieGuruSend_15_00");	//Jak docílím toho aby mě někdo z Guru poslal za Cor Kalomem?
	AI_Output(self,other,"DIA_Caine_WieGuruSend_13_01");	//Promluv si s Lesterem, možná ti pomůže.
	AI_Output(self,other,"DIA_Caine_WieGuruSend_13_02");	//Donedávna pracoval pro Cor Kaloma, teď se stará o nováčky společně s ostaními Guru.
	if(KALOMS_GUARD == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Pokud chci aby mě za Cor Kalomem poslal něktrý z Guru, tak bych si měl popovídat s Lesterem.");
	};
};

instance Nov_1301_Caine_CHEST(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 3;
	condition = Nov_1301_Caine_CHEST_Condition;
	information = Nov_1301_Caine_CHEST_Info;
	important = 0;
	permanent = 0;
	description = "Jak dostanu Kalomův recept?";
};

func int Nov_1301_Caine_CHEST_Condition()
{
	if((Dexter_GetKalomsRecipe == LOG_RUNNING) && Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return TRUE;
	};
};

func void Nov_1301_Caine_CHEST_Info()
{
	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01");	//Jak dostanu Kalomův recept?
	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02");	//Nedostaneš ho. Má ho zamčený ve své truhle a nikomu ho nedá.
};

var int lernen_darf_psi;

instance NOV_1301_CAINE_LERNEN(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 4;
	condition = nov_1301_caine_lernen_condition;
	information = nov_1301_caine_lernen_info;
	important = 0;
	permanent = 1;
	description = "Můžeš mě učit o alchymii?";
};

func int nov_1301_caine_lernen_condition()
{
	if((LERNEN_DARF_PSI == FALSE) && Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return TRUE;
	};
};

func void nov_1301_caine_lernen_info()
{
	AI_Output(other,self,"Nov_1301_Caine_LERNEN_Info_14_01");	//Můžeš mě učit alchymii?
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Caine, alchymista z Tábora v bažinách, mě může učit alchymii.");
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_02");	//Cor Kalom mě hodně naučil. Ještě jsem neskončil se svým tréninkem, ale můžu ti ukázat pár triků.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_03");	//Umím přípravu léčivých a manových lektvarů. Umím vyrobit i pár speciálních lektvarů, do jejichž tajemství jsou zasvěceni jenom Guru z našeho Bratrství.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_04");	//Můžu učit recepty léčivých a manových lektvarů novice a templáře.
		LERNEN_DARF_PSI = TRUE;
	}
	else
	{
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_05");	//Můžu tě učit, ale jen pokud patříš mezi nás.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_06");	//Cor Kalom by mě zabil, kdybych učil naše recepty cizince.
	};
};

instance NOV_1301_CAINE_TRAENKE(C_Info)
{
	npc = NOV_1301_Caine;
	condition = nov_1301_caine_traenke_condition;
	information = nov_1301_caine_traenke_info;
	important = 0;
	permanent = 1;
	description = "Jaké recepty znáš?";
};

func int nov_1301_caine_traenke_condition()
{
	if(((LERNEN_DARF_PSI == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void nov_1301_caine_traenke_info()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Info_14_01");	//Jaké recepty znáš?
	AI_Output(self,other,"Nov_1301_Caine_Traenke_Info_14_02");	//Znám recepty na léčivé a manové lektvary.
	Info_ClearChoices(nov_1301_caine_traenke);
	Info_AddChoice(nov_1301_caine_traenke,DIALOG_BACK,nov_1301_caine_traenke_back);
	if(KNOWS_HEILESSENZ == FALSE)
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esence léčivé síly (cena: 1 VB)",nov_1301_caine_traenke_health1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt léčivé síly (cena: 2 VB)",nov_1301_caine_traenke_health2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír léčivé síly (cena: 3 VB)",nov_1301_caine_traenke_health3);
	};
	if(KNOWS_MANAESSENZ == FALSE)
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esence magické energie (cena: 1 VB)",nov_1301_caine_traenke_mana1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt magické energie (cena: 2 VB)",nov_1301_caine_traenke_mana2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír magické energie (cena: 3 VB)",nov_1301_caine_traenke_mana3);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esence života (cena: 5 VB)",nov_1301_caine_traenke_healthperma1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt života (cena: 8 VB)",nov_1301_caine_traenke_healthperma2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE) && (KNOWS_HEILPERMAELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír života (cena: 10 VB)",nov_1301_caine_traenke_healthperma3);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esence ducha (cena: 5 VB)",nov_1301_caine_traenke_manaperma1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt ducha (cena: 8 VB)",nov_1301_caine_traenke_manaperma2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE) && (KNOWS_MANAPERMAELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír ducha (cena: 10 VB)",nov_1301_caine_traenke_manaperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Essence síly (cena: 5 VB)",nov_1301_caine_traenke_strengthperma1);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt síly (cena: 8 VB)",nov_1301_caine_traenke_strengthperma2);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír síly (cena: 10 VB)",nov_1301_caine_traenke_strengthperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esence obratnosti (cena: 5 VB)",nov_1301_caine_traenke_dexperma1);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt obratnosti (cena: 8 VB)",nov_1301_caine_traenke_dexperma2);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír obratnosti (cena: 10 VB)",nov_1301_caine_traenke_dexperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír obratnosti (cena: 10 VB)",nov_1301_caine_traenke_dexperma3);
	};
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_PSIELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír (cena: 10 VB)",nov_1301_caine_traenke_elixier);
	};
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_PSICRAWLER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixír z Důlních červů (cena: 10 VB)",nov_1301_caine_traenke_crawlerelixier);
	};
};

func void nov_1301_caine_traenke_back()
{
	Info_ClearChoices(nov_1301_caine_traenke);
};

func void nov_1301_caine_traenke_health1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health1_15_00");	//Co musím udělat?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health1_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health1_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_HEILESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence léčivé síly - 1 voda, 1 léčivá rostlina");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt léčivé síly (cena: 2 VB)",nov_1301_caine_traenke_health2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_health2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health2_15_00");	//Co musím udělat?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Naučil ses: Extrakt léčivé síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health2_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health2_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_HEILEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt léčivé síly - 1 voda, 2 léčivé rostliny, 1 léčivá bylina");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixír léčivé síly (cena: 3 VB)",nov_1301_caine_traenke_health3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_health3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health3_15_00");	//Co musím udělat?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Naučil ses: Elixír léčivé síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health3_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health3_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_HEILELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír léčivé síly - 1x Voda, 2x Léčivá bylina, 1x Léčivý kořen");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esence života (cena: 5 VB)",nov_1301_caine_traenke_healthperma1);
		};
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Essence síly (cena: 5 VB)",nov_1301_caine_traenke_strengthperma1);
		};
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esence obratnosti (cena: 5 VB)",nov_1301_caine_traenke_dexperma1);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana1_15_00");	//Co musím udělat?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana1_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana1_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_MANAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence magické energie - 1x Alkohol, 1x Havraní bylina");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt magické energie (cena: 2 VB)",nov_1301_caine_traenke_mana2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana2_15_00");	//Co musím udělat?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Naučil ses: Extrakt magické energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana2_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana2_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_MANAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt magické energie - 1x Alkohol, 2x Havraní bylina, 1 Tmavá bylina");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixír magické energie (cena: 3 VB)",nov_1301_caine_traenke_mana3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana3_15_00");	//Co musím udělat?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Naučil ses: Elixír magické energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana3_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana3_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_MANAELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír magické energie - 1x Alkohol, 2x Tmavá bylina");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esence ducha (cena: 5 VB)",nov_1301_caine_traenke_manaperma1);
		};
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Essence síly (cena: 5 VB)",nov_1301_caine_traenke_strengthperma1);
		};
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esence obratnosti (cena: 5 VB)",nov_1301_caine_traenke_dexperma1);
		};
		if((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_PSIELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixír (cena: 10 VB)",nov_1301_caine_traenke_elixier);
		};
		if((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_PSICRAWLER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixír z Důlních červů (cena: 10 VB)",nov_1301_caine_traenke_crawlerelixier);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma1_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma1_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_MANAPERMAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence ducha - 1x Alkohol, 2x Tmavá bylinka, 1x Noční lilek");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt ducha (cena: 8 VB)",nov_1301_caine_traenke_manaperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma2_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma2_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_MANAPERMAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt ducha - 1 alkohol, 2 tmavé byliny, 2 noční lilky");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE) && (KNOWS_MANAPERMAELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixír ducha (cena: 10 VB)",nov_1301_caine_traenke_manaperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma3_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma3_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_MANAPERMAELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír ducha - 1 alkohol, 3 tmavé byliny, 2 měsíční lilky");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_HealthPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma1_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma1_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_HEILPERMAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence života - 1 voda, 2 léčivé kořeny");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt života (cena: 8 VB)",nov_1301_caine_traenke_healthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_HealthPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma2_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma2_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_HEILPERMAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt života - 1x Voda, 2x Léčivý kořen, 1x Skřetí list");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE) && (KNOWS_HEILPERMAELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixír života (cena: 10 VB)",nov_1301_caine_traenke_healthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma3_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma3_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_HEILPERMAELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír života - 1 voda, 3 léčivé kořeny, 2 dubové listy");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma1_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma1_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_STRENGTHESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence síly - 1x Voda, 2x Skřetí list, 1x Trolí třešeň");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt síly (cena: 8 VB)",nov_1301_caine_traenke_strengthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma2_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma2_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_STRENGTHEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt síly - 1x Voda, 3x Skřetí list, 1x Trolí třešeň");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixír síly (cena: 10 VB)",nov_1301_caine_traenke_strengthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma3_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma3_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_STRENGTHELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír síly - 1x Voda, 4x Skřetí list, 1x Trolí třešeň, 1x Dračí kořen");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence obratnosti",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma1_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma1_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_DEXESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence obratnosti - 1x Alkohol, 2x Seraphis, 1x Ohnivý trn");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt obratnosti (cena: 8 VB)",nov_1301_caine_traenke_dexperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt obratnosti",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma2_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma2_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_DEXEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Vyrobil jsi: Extrakt obratnosti!");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixír obratnosti (cena: 10 VB)",nov_1301_caine_traenke_dexperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír obratnosti",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma3_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma3_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_DEXELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Vyrobil jsi: Elixír obratnosti!");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_elixier()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Elixier_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Elixier_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Elixier_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		KNOWS_PSIELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír - 1x Voda, 2x Tráva z bažin, 1x Žihadlo Krvavé mouchy");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_crawlerelixier()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_CrawlerElixier_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír Důlního červa",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_CrawlerElixier_06_01");	//Všechny potřebné rostliny a přísady vlož do laboratorní baňky.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_CrawlerElixier_06_02");	//Pokud uděláš všechno správně, určitě dosáhneš požadovaného výsledku.
		
		//BUG [Fawkes]: hrac by sa mal naucit KNOWS_PSICRAWLER ale v skriptoch bolo KNOWS_DEXELIXIER
		//KNOWS_DEXELIXIER = TRUE;
		KNOWS_PSICRAWLER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír z Důlních červů - 1x Voda, 4x Tráva z bažin, 4x Kusadla důlních červů");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

instance NOV_1301_CAINE_WELCOME(C_Info)
{
	npc = Nov_1330_BaalParvez;
	condition = nov_1301_caine_welcome_condition;
	information = nov_1301_caine_welcome_info;
	important = 1;
	permanent = 0;
};

func int nov_1301_caine_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1301_caine_welcome_info()
{
	AI_Output(self,other,"Nov_1301_Caine_WELCOME_Info_08_01");	//Za krátkou dobu jsi ušel dlouhou cestu, příteli. Od této chvíle jsi jedním z našich duchovních vůdců.
	AI_StopProcessInfos(self);
};

instance DIA_CAINE_POTIONHELP(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = dia_caine_potionhelp_condition;
	information = dia_caine_potionhelp_info;
	permanent = 0;
	description = "Potřebuju tvoji pomoc.";
};

func int dia_caine_potionhelp_condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) >= 5))
	{
		return 1;
	};
};

func void dia_caine_potionhelp_info()
{
	AI_Output(other,self,"DIA_Caine_PotionHelp_15_00");	//Potřebuju tvoji pomoc.
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_01");	//Co se děje?
	AI_Output(other,self,"DIA_Caine_PotionHelp_13_02");	//Y´berion umírá a potřebuju léčivý lektvar abychom ho mohli zachránit.
	AI_Output(other,self,"DIA_Caine_PotionHelp_13_03");	//Sesbíral jsem tyhle léčivé rostliny, můžeš z nich připravit léčivý lektvar?
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_04");	//Ano, dej mi chvilku.
	B_GiveInvItems(other,self,ItFo_Plants_Herb_03,5);
	Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,5);
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_05");	//Tady je lektvar. Pospěš si !
	CreateInvItem(self,HealthWater);
	B_GiveInvItems(self,other,HealthWater,1);
};

