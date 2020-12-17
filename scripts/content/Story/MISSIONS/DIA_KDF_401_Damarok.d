instance KDF_401_Damarok_WELCOME(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_WELCOME_Condition;
	information = KDF_401_Damarok_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int KDF_401_Damarok_WELCOME_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE) && Npc_KnowsInfo(hero,KDF_403_Drago_RUNE) && Npc_KnowsInfo(hero,KDF_405_Torrez_BOOK) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_WELCOME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01");	//Kéž tě Oheň ochrání!
	Corristo_KDFAufnahme = 6;
	B_Story_Feueraufnahme();
	AI_StopProcessInfos(self);
};

instance KDF_401_Damarok_Exit(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 999;
	condition = KDF_401_Damarok_Exit_Condition;
	information = KDF_401_Damarok_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int KDF_401_Damarok_Exit_Condition()
{
	return TRUE;
};

func void KDF_401_Damarok_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance KDF_401_Damarok_HEAL(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_HEAL_Condition;
	information = KDF_401_Damarok_HEAL_Info;
	important = 1;
	permanent = 0;
};

func int KDF_401_Damarok_HEAL_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDF) && Npc_IsInRoutine(self,Rtn_start_401))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEAL_Info()
{
	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01");	//Jestliže budeš zraněn, já tě vyhojím.
	AI_StopProcessInfos(self);
};

instance KDF_401_Damarok_HEALINFO(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 100;
	condition = KDF_401_Damarok_HEALINFO_Condition;
	information = KDF_401_Damarok_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Jsem zraněn. Dokážeš mě vyhojit?";
};

func int KDF_401_Damarok_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEALINFO_Info()
{
	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01");	//Jsem zraněn. Dokážeš mě vyhojit?
	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02");	//Tělo se hojí, duše vyjasňuje.
	Snd_Play("MFX_Heal_Cast");
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
};

var int lernen_darf;

instance KDF_401_DAMAROK_LERNEN(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_lernen_condition;
	information = kdf_401_damarok_lernen_info;
	important = 0;
	permanent = 1;
	description = "Můžeš mě něco naučit?";
};

func int kdf_401_damarok_lernen_condition()
{
	if(LERNEN_DARF == FALSE)
	{
		return TRUE;
	};
};

func void kdf_401_damarok_lernen_info()
{
	AI_Output(other,self,"KDF_401_Damarok_LERNEN_Info_14_01");	//Můžeš mě něco naučit?
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Damarok, alchymista Ohnivých Mágů mě může učit alchymii.");
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_02");	//Můžu tě učit umění alchymie.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_03");	//Existuje celá řada alchymistických látek, ovplyvňujících tělo i mysl.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_04");	//Jestli chceš, ukážu ti to.
		LERNEN_DARF = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_05");	//Učím jen mágy z kruhu Ohně.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_06");	//Nemůžu tě učit pokud nesloužíš Innosovi.
	};
};

instance KDF_401_DAMAROK_TRAENKE(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_traenke_condition;
	information = kdf_401_damarok_traenke_info;
	important = 0;
	permanent = 1;
	description = "Jaké lektvary mě můžeš učit?";
};

func int kdf_401_damarok_traenke_condition()
{
	if((LERNEN_DARF == TRUE) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_traenke_info()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Info_14_01");	//Jaké lektvary mě můžeš učit?
	AI_Output(self,other,"KDF_401_Damarok_Traenke_Info_14_02");	//Znám recepty na léčivé a manové lektvary.
	Info_ClearChoices(kdf_401_damarok_traenke);
	Info_AddChoice(kdf_401_damarok_traenke,DIALOG_BACK,kdf_401_damarok_traenke_back);
	if(KNOWS_HEILESSENZ == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esence léčivé síly (cena: 1 VB)",kdf_401_damarok_traenke_health1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Extrakt léčivé síly (cena: 2 VB)",kdf_401_damarok_traenke_health2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Elixír léčivé síly (cena: 3 VB)",kdf_401_damarok_traenke_health3);
	};
	if(KNOWS_MANAESSENZ == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esence magické energie (cena: 1 VB)",kdf_401_damarok_traenke_mana1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Extrakt magické energie (cena: 2 VB)",kdf_401_damarok_traenke_mana2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Elixír magické energie (cena: 3 VB)",kdf_401_damarok_traenke_mana3);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esence života (cena: 5 VB)",kdf_401_damarok_traenke_healthperma1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Extrakt života (cena: 8 VB)",kdf_401_damarok_traenke_healthperma2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE) && (KNOWS_HEILPERMAELIXIER == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Elixír života (cena: 10 VB)",kdf_401_damarok_traenke_healthperma3);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esence ducha (cena: 5 VB)",kdf_401_damarok_traenke_manaperma1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Extrakt ducha (cena: 8 VB)",kdf_401_damarok_traenke_manaperma2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE) && (KNOWS_MANAPERMAELIXIER == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Elixír ducha (cena: 10 VB)",kdf_401_damarok_traenke_manaperma3);
	};
};

func void kdf_401_damarok_traenke_back()
{
	Info_ClearChoices(kdf_401_damarok_traenke);
};

func void kdf_401_damarok_traenke_health1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health1_15_00");	//Co musím udělat?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_health2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health2_15_00");	//Co musím udělat?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Naučil ses: Extrakt léčivé síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_health3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health3_15_00");	//Co musím udělat?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Naučil ses: Elixír léčivé síly",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_mana1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana1_15_00");	//Co musím udělat?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_mana2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana2_15_00");	//Co musím udělat?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Naučil ses: Extrakt magické energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_mana3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana3_15_00");	//Co musím udělat?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Naučil ses: Elixír magické energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_manaperma1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_manaperma2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_manaperma3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_healthperma1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_HealthPerma1_15_00");	//Co musím udělat?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Naučil ses: Esence života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma1_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma1_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_healthperma2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_HealthPerma2_15_00");	//Co musím udělat?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Naučil ses: Extrakt života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma2_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma2_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

func void kdf_401_damarok_traenke_healthperma3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health3_15_00");	//Co musím udělat?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Naučil ses: Elixír života",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma3_06_01");	//Nejdříve vlož ingredience do laboratorní baňky. Pak přidej vodu.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma3_06_02");	//Dodržuj tenhle postup a alchýmie bude tvým věrným přítelem.
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

