instance Info_Riordian_EXIT(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 999;
	condition = Info_Riordian_EXIT_Condition;
	information = Info_Riordian_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasItems(self,ItArRuneThunderball))
	{
		CreateInvItem(self,ItArRuneThunderball);
	};
};

instance Info_Riordian_NEWS(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_NEWS_Condition;
	information = Info_Riordian_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "Saturas mě poslal.";
};

func int Info_Riordian_NEWS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_OFFER) && Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};
};

func void Info_Riordian_NEWS_Info()
{
	AI_Output(other,self,"Info_Riordian_NEWS_15_01");	//Saturas mě poslal.
	AI_Output(self,other,"Info_Riordian_NEWS_14_02");	//Á, tak pojď. Už mi říkali.
	AI_Output(self,other,"Info_Riordian_NEWS_14_03");	//Tady si vezmi lektvar, ten vyléčí všechny neduhy.
	AI_Output(self,other,"Info_Riordian_NEWS_14_04");	//Teď jdi a přines nám ohniskové kameny. Ty jsou naší jedinou nadějí.
	CreateInvItems(self,ItFo_Potion_Health_01,20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_01,20);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_01,15);
	CreateInvItems(hero,ItFo_Potion_Mana_01,5);
	CreateInvItems(hero,ItFo_Potion_Health_02,2);
	CreateInvItems(hero,ItFo_Potion_Mana_02,2);
	CreateInvItems(hero,ItFo_Potion_Health_03,1);
	CreateInvItems(hero,ItFo_Potion_Mana_03,1);
	CreateInvItems(hero,ItFo_Potion_Haste_02,2);
	CreateInvItems(hero,ItFo_Potion_Strength_01,1);
	CreateInvItems(hero,ItFo_Potion_Dex_01,1);
};

instance Info_Riordian_REWARD(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_REWARD_Condition;
	information = Info_Riordian_REWARD_Info;
	permanent = 0;
	important = 0;
	description = "Saturas řekl, že mě máš odměnit.";
};

func int Info_Riordian_REWARD_Condition()
{
	if(Saturas_BringFoci == 5)
	{
		return TRUE;
	};
};

func void Info_Riordian_REWARD_Info()
{
	AI_Output(other,self,"Info_Riordian_REWARD_15_01");	//Saturas řekl, že mě máš odměnit.
	AI_Output(self,other,"Info_Riordian_REWARD_14_02");	//Á, pojď dál, pojď dál.
	AI_Output(self,other,"Info_Riordian_REWARD_14_03");	//Náš duchovní vůdce mi vyprávěl o tvých hrdinských činech.
	AI_Output(self,other,"Info_Riordian_REWARD_14_04");	//Všichni lidé v táboře - ne, v celé kolonii - jsou ti hluboce zavázaní.
	AI_Output(self,other,"Info_Riordian_REWARD_14_05");	//Přijmi tuhle malou odměnu za všechno tvoje úsilí.
	CreateInvItems(self,ItFo_Potion_Health_02,20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_02,20);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_02,15);
	CreateInvItems(hero,ItFo_Potion_Mana_02,5);
	CreateInvItems(hero,ItFo_Potion_Health_03,2);
	CreateInvItems(hero,ItFo_Potion_Mana_03,2);
	CreateInvItems(hero,ItFo_Potion_Haste_02,3);
	CreateInvItems(hero,ItFo_Potion_Master_01,1);
	CreateInvItems(hero,ItFo_Potion_Health_Perma_02,1);
	CreateInvItems(hero,ItFo_Potion_Mana_Perma_02,1);
	B_LogEntry(CH3_BringFoci,"Riordian byl  jako vždy hlava otevřená. Dal mi spoustu lektvarů. Myslím, že mi jich bude zapotřebí.");
	if(Npc_KnowsInfo(hero,Info_Cronos_REWARD))
	{
		Log_SetTopicStatus(CH3_BringFoci,LOG_SUCCESS);
	};
};

instance Info_Riordian_MESSAGE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGE_Condition;
	information = Info_Riordian_MESSAGE_Info;
	permanent = 0;
	important = 1;
};

func int Info_Riordian_MESSAGE_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredFreeMine)
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGE_Info()
{
	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01");	//Jsem rád, že jsi přišel! Očekával jsem tě!
};

instance Info_Riordian_MESSAGEWHY(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGEWHY_Condition;
	information = Info_Riordian_MESSAGEWHY_Info;
	permanent = 0;
	important = 0;
	description = "Očekával jsi mě? Jak to?";
};

func int Info_Riordian_MESSAGEWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01");	//Očekával jsi mě? Jak to?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02");	//Gorn mi říkal, abych tě k němu poslal ihned, jak přijdeš!
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03");	//Co se děje?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04");	//Má plán na osvobození obsazeného dolu.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05");	//Střeží pořád vchod toho dolu?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06");	//Ano! Zajdi za ním, prosím, co nejdříve!
};

instance KDW_605_Riordian_WELCOME(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_WELCOME_Condition;
	information = KDW_605_Riordian_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int KDW_605_Riordian_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_WELCOME_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01");	//Jsem rád, že ses dal k nám.
};

instance KDW_605_Riordian_HEAL(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_HEAL_Condition;
	information = KDW_605_Riordian_HEAL_Info;
	important = 1;
	permanent = 0;
};

func int KDW_605_Riordian_HEAL_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEAL_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01");	//Jestliže budeš zraněn, já tě vyhojím.
};

instance KDW_605_Riordian_HEALINFO(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 100;
	condition = KDW_605_Riordian_HEALINFO_Condition;
	information = KDW_605_Riordian_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Jsem zraněn. Dokážeš mě vyhojit?";
};

func int KDW_605_Riordian_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01");	//Jsem zraněn. Dokážeš mě vyhojit?
	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02");	//Těmito slovy vyvolávám léčivé síly a tvoje tělo i duše budou uzdraveny!
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("MFX_Heal_Cast");
};

instance KDW_605_Riordian_GREET(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_GREET_Condition;
	information = KDW_605_Riordian_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Buď pozdraven, mágu.";
};

func int KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};

func void KDW_605_Riordian_GREET_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01");	//Buď pozdraven, mágu.
	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02");	//Jsem Riordian, alchymista. Ty určitě chceš nějaký lektvar?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Riordian, mág Vody, obchoduje s LEKTVARY. Bývá v alchymistické dílně v horní rovině.");
};

instance KDW_605_Riordian_TRADE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_TRADE_Condition;
	information = KDW_605_Riordian_TRADE_Info;
	important = 0;
	permanent = 1;
	description = "Ukaž mi svoje zboží.";
	trade = 1;
};

func int KDW_605_Riordian_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_TRADE_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01");	//Ukaž mi svoje zboží.
};

var int lernen_darf_kdw;

instance KDW_605_RIORDIAN_LERNEN(C_Info)
{
	npc = KDW_605_Riordian;
	condition = kdw_605_riordian_lernen_condition;
	information = kdw_605_riordian_lernen_info;
	important = 0;
	permanent = 1;
	description = "Můžeš mě něco naučit?";
};

func int kdw_605_riordian_lernen_condition()
{
	if(LERNEN_DARF_KDW == FALSE)
	{
		return TRUE;
	};
};

func void kdw_605_riordian_lernen_info()
{
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Můžeš mě něco naučit?
	if((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Riordian, alchymista Vodních Mágů, mě může naučit alchymii.");
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_02");	//Můžu tě učit umění alchymie.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_03");	//Existuje celá řada alchymistických látek, ovplyvňujících tělo i mysl.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_04");	//Jestli chceš, ukážu ti to.
		LERNEN_DARF_KDW = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_05");	//Učím jenom mágy z kruhu Vody.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_06");	//Nebudu tě učit pokud nesloužíš Adanovi.
	};
};

instance KDW_605_RIORDIAN_TRAENKE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = kdw_605_riordian_traenke_condition;
	information = kdw_605_riordian_traenke_info;
	important = 0;
	permanent = 1;
	description = "Jaké lektvary mě můžeš učit?";
};

func int kdw_605_riordian_traenke_condition()
{
	if(((LERNEN_DARF_KDW == TRUE) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((LERNEN_DARF_KDW == TRUE) && (Npc_GetTrueGuild(hero) == GIL_SLD)))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_traenke_info()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Info_14_01");	//Jaké lektvary mě můžeš učit?
	AI_Output(self,other,"KDW_605_Riordian_Traenke_Info_14_02");	//Znám recepty na lektvary léčení, lektvary na manu a posilující lektvary.
	Info_ClearChoices(kdw_605_riordian_traenke);
	Info_AddChoice(kdw_605_riordian_traenke,DIALOG_BACK,kdw_605_riordian_traenke_back);
	if(KNOWS_HEILESSENZ == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esence léčivé síly (cena: 1 VB)",kdw_605_riordian_traenke_health1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt léčivé síly (cena: 2 VB)",kdw_605_riordian_traenke_health2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixír léčivé síly (cena: 3 VB)",kdw_605_riordian_traenke_health3);
	};
	if(KNOWS_MANAESSENZ == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esence magické energie (cena: 1 VB)",kdw_605_riordian_traenke_mana1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt magické energie (cena: 2 VB)",kdw_605_riordian_traenke_mana2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixír magické energie (cena: 3 VB)",kdw_605_riordian_traenke_mana3);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esence života (cena: 5 VB)",kdw_605_riordian_traenke_healthperma1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt života (cena: 8 VB)",kdw_605_riordian_traenke_healthperma2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE) && (KNOWS_HEILPERMAELIXIER == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixír života (cena: 10 VB)",kdw_605_riordian_traenke_healthperma3);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esence ducha (cena: 5 VB)",kdw_605_riordian_traenke_manaperma1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt ducha (cena: 8 VB)",kdw_605_riordian_traenke_manaperma2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE) && (KNOWS_MANAPERMAELIXIER == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixír ducha (cena: 10 VB)",kdw_605_riordian_traenke_manaperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Essence síly (cena: 5 VB)",kdw_605_riordian_traenke_strengthperma1);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt síly (cena: 8 VB)",kdw_605_riordian_traenke_strengthperma2);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel >= 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixír síly (cena: 10 VB)",kdw_605_riordian_traenke_strengthperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esence obratnosti (cena: 5 VB)",kdw_605_riordian_traenke_dexperma1);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt obratnosti (cena: 8 VB)",kdw_605_riordian_traenke_dexperma2);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixír obratnosti (cena: 10 VB)",kdw_605_riordian_traenke_dexperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixír obratnosti (cena: 10 VB)",kdw_605_riordian_traenke_dexperma3);
	};
	if(((KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == TRUE) && (KNOWS_MASTERMACHT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (KNOWS_MASTERMACHT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Lektvar moci (cena: 10 VB)",kdw_605_riordian_traenke_force1);
	};
	if(((KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == TRUE) && (KNOWS_MASTERMACHT == TRUE) && (KNOWS_MASTERHERRSCHAFT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == TRUE) && (KNOWS_MASTERMACHT == TRUE) && (KNOWS_MASTERHERRSCHAFT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Lektvar dominance (cena: 10 VB)",kdw_605_riordian_traenke_force2);
	};
};

func void kdw_605_riordian_traenke_back()
{
	Info_ClearChoices(kdw_605_riordian_traenke);
};

func void kdw_605_riordian_traenke_health1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health1_15_00");	//Co musím udělat?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_HEILESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence léčivé síly - 1 voda, 1 léčivá rostlina");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_health2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health2_15_00");	//Co musím udělat?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Naučil ses: Extrakt léčivé síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_HEILEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt léčivé síly - 1 voda, 2 léčivé rostliny, 1 léčivá bylina");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_health3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health3_15_00");	//Co musím udělat?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Naučil ses: Elixír léčivé síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_HEILELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír léčivé síly - 1x Voda, 2x Léčivá bylina, 1x Léčivý kořen");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_mana1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana1_15_00");	//Co musím udělat?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_MANAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence magické energie - 1x Alkohol, 1x Havraní bylina");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_mana2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana2_15_00");	//Co musím udělat?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Naučil ses: Extrakt magické energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_MANAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt magické energie - 1x Alkohol, 2x Havraní bylina, 1 Tmavá bylina");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_mana3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana3_15_00");	//Co musím udělat?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Naučil ses: Elixír magické energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_MANAELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixír magické energie - 1x Alkohol, 2x Tmavá bylina");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_manaperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_MANAPERMAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence ducha - 1x Alkohol, 2x Tmavá bylinka, 1x Noční lilek");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_manaperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_MANAPERMAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt ducha - 1 alkohol, 2 tmavé byliny, 2 noční lilky");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_manaperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdw_605_riordian_traenke_healthperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_HealthPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_HEILPERMAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence života - 1 voda, 2 léčivé kořeny");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_healthperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_HealthPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_HEILPERMAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt života - 1x Voda, 2x Léčivý kořen, 1x Skřetí list");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_healthperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdw_605_riordian_traenke_strengthperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_STRENGTHESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence síly - 1x Voda, 2x Skřetí list, 1x Trolí třešeň");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Extrakt síly (cena: 8 VB)",kdw_605_riordian_traenke_strengthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_strengthperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_STRENGTHEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt síly - 1x Voda, 3x Skřetí list, 1x Trolí třešeň");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Elixír síly (cena: 10 VB)",kdw_605_riordian_traenke_strengthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_strengthperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdw_605_riordian_traenke_dexperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence obratnosti",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_DEXESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esence obratnosti - 1x Alkohol, 2x Seraphis, 1x Ohnivý trn");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Extrakt obratnosti (cena: 8 VB)",kdw_605_riordian_traenke_dexperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_dexperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt obratnosti",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_DEXEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Vyrobil jsi: Extrakt obratnosti!");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Elixír obratnosti (cena: 10 VB)",kdw_605_riordian_traenke_dexperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_dexperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír obratnosti",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdw_605_riordian_traenke_force1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Force1_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Letkvar moci",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_MASTERMACHT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Lektvar síly - 1x Syrský olej, 2x Seraphis, 1x Ohnivý trn, 2x Skřetí list, 1x Trolí třešeň");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_force2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Force2_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Letkvar dominance",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
		KNOWS_MASTERHERRSCHAFT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Lektvar dominance - 1x Syrský olej, 3x Velayis, 1x Ohnivý trn, 3x Dubový list, 1x Trolí třešeň");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

