instance DIA_Darrion_Exit(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 999;
	condition = DIA_Darrion_Exit_Condition;
	information = DIA_Darrion_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Darrion_Exit_Condition()
{
	return 1;
};

func void DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Darrion_Hello(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = DIA_Darrion_Hello_Condition;
	information = DIA_Darrion_Hello_Info;
	permanent = 0;
	description = "Zdar - jsem tady nový a chtěl bych se něco dovědět o táboře.";
};

func int DIA_Darrion_Hello_Condition()
{
	return 1;
};

func void DIA_Darrion_Hello_Info()
{
	AI_Output(other,self,"DIA_Darrion_Hello_15_00");	//Zdar - jsem tady nový a chtěl bych se něco dovědět o táboru.
	AI_Output(self,other,"DIA_Darrion_Hello_11_01");	//Pak jsi přišel na špatné místo. Od té doby, co se templáři začali připravovat k boji, tu máme ve dne v noci napilno.
	AI_Output(self,other,"DIA_Darrion_Hello_11_02");	//Nemám moc času na otázky. Tak mě nevyrušuj - pokud si nechceš něco koupit.
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Novic Darrion obchoduje se ZBRANĚMI. Tráví většinu času v kovárně.");
};

instance DIA_Darrion_Trade(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 800;
	condition = DIA_Darrion_Trade_Condition;
	information = DIA_Darrion_Trade_Info;
	permanent = 1;
	description = "Chtěl bych s tebou obchodovat!";
	trade = 1;
};

func int DIA_Darrion_Trade_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Darrion_Hello))
	{
		return TRUE;
	};
};

func void DIA_Darrion_Trade_Info()
{
	AI_Output(other,self,"DIA_Darrion_Trade_15_00");	//Chtěl bych s tebou obchodovat!
	AI_Output(self,other,"DIA_Darrion_Trade_11_01");	//Dobře! Tady - to jsou zbraně, které mám zrovna k dispozici.
};

instance DIA_DARRION_LEARNNOT(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = dia_darrion_learnnot_condition;
	information = dia_darrion_learnnot_info;
	permanent = 0;
	description = "Můžeš mě něco naučit?";
};

func int dia_darrion_learnnot_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Darrion_Hello) && (Npc_GetTrueGuild(hero) != GIL_NOV)) || (Npc_GetTrueGuild(hero) != GIL_TPL) || (Npc_GetTrueGuild(hero) != GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_darrion_learnnot_info()
{
	AI_Output(other,self,"DIA_Darrion_LearnNOT_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Darrion_LearnNOT_11_01");	//Učím jenom členy našeho tábora.
	AI_Output(self,other,"DIA_Darrion_LearnNOT_11_02");	//Jestli se ode mně chceš něco naučit, tak se k nám přidej.
};

var int darrion_smithasking;

instance DIA_DARRION_LEARNYES(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = dia_darrion_learnyes_condition;
	information = dia_darrion_learnyes_info;
	permanent = 1;
	description = "Můžeš mě naučit něco z kovářství?";
};

func int dia_darrion_learnyes_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_darrion_learnyes_info()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_00");	//Můžeš mě naučit něco z kovářství?
	AI_Output(self,other,"DIA_Darrion_LearnYES_11_01");	//Můžu tě naučit jak si vykovat decentní meč.
	AI_Output(self,other,"DIA_Darrion_LearnYES_11_02");	//Ale budeš potřebovat trochu zkušeností.
	if(DARRION_SMITHASKING == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Novic Darrion mě může naučit kovářství. Přes den ho najud jak jinak - v kovárně.");
		DARRION_SMITHASKING = TRUE;
	};
	Info_ClearChoices(dia_darrion_learnyes);
	Info_AddChoice(dia_darrion_learnyes,DIALOG_BACK,dia_darrion_learnyes_back);
	if(((KNOWS_STREITKOLBEN == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (KNOWS_STREITKOLBEN == FALSE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_STREITKOLBEN == FALSE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Palcát (cena: 1 VB)",dia_darrion_learnyes_streitkolben);
	};
	if(((KNOWS_STAHLZUNGE == FALSE) && (KNOWS_STREITKOLBEN == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (KNOWS_STAHLZUNGE == FALSE) && (KNOWS_STREITKOLBEN == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_STAHLZUNGE == FALSE) && (KNOWS_STREITKOLBEN == TRUE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Ocelový hrot (cena: 2 VB)",dia_darrion_learnyes_stahlzunge);
	};
	if(((KNOWS_KRIEGSSCHWERT == FALSE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (KNOWS_KRIEGSSCHWERT == FALSE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_KRIEGSSCHWERT == FALSE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Válečný meč (cena: 3 VB)",dia_darrion_learnyes_kriegsschwert);
	};
	if(((KNOWS_LEICHTER2H == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_LEICHTER2H == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (Kapitel > 2)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Lehký obouruční meč (cena: 4 VB)",dia_darrion_learnyes_leichter2h);
	};
	if(((KNOWS_HüTERKLINGE == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (KNOWS_LEICHTER2H == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_HüTERKLINGE == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (KNOWS_LEICHTER2H == TRUE) && (Kapitel > 2)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Šavle správce (cena: 5 VB)",dia_darrion_learnyes_hüterklinge);
	};
	if((KNOWS_KöNIGSKLINGE == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_HüTERKLINGE == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (KNOWS_LEICHTER2H == TRUE) && (Kapitel > 3) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		Info_AddChoice(dia_darrion_learnyes,"Šavle krále (cena: 6 VB)",dia_darrion_learnyes_königsklinge);
	};
	if((KNOWS_ROTER_WIND == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_HüTERKLINGE == TRUE) && (KNOWS_KöNIGSKLINGE == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (KNOWS_LEICHTER2H == TRUE) && (Kapitel > 4) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		Info_AddChoice(dia_darrion_learnyes,"Rudý vítr (cena: 7 VB)",dia_darrion_learnyes_roter_wind);
	};
};

func void dia_darrion_learnyes_back()
{
	Info_ClearChoices(dia_darrion_learnyes);
};

func void dia_darrion_learnyes_streitkolben()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Nejdřív si vem kus surové ocele a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Až bude pěkně rozpálená můžeš jí opracovat na kovadlině.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Okovanou čepel pak schlaď ve vodě aby se ocel pořádně vytvrdila.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Nakonec meč musíš vybrousit a očistit od nečistot.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Palcát.");
		KNOWS_STREITKOLBEN = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_stahlzunge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Nejdřív si vem kus surové ocele a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Až bude pěkně rozpálená můžeš jí opracovat na kovadlině.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Okovanou čepel pak schlaď ve vodě aby se ocel pořádně vytvrdila.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Nakonec meč musíš vybrousit a očistit od nečistot.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Ocelový hrot.");
		KNOWS_STAHLZUNGE = TRUE;
		PrintScreen("Naučil ses vykovat: Ocelový hrot",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_kriegsschwert()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Nejdřív si vem kus surové ocele a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Až bude pěkně rozpálená můžeš jí opracovat na kovadlině.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Okovanou čepel pak schlaď ve vodě aby se ocel pořádně vytvrdila.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Nakonec meč musíš vybrousit a očistit od nečistot.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Válečný meč.");
		KNOWS_KRIEGSSCHWERT = TRUE;
		PrintScreen("Naučil ses vykovat: Válečný meč",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_leichter2h()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Nejdřív si vem kus surové ocele a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Až bude pěkně rozpálená můžeš jí opracovat na kovadlině.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Okovanou čepel pak schlaď ve vodě aby se ocel pořádně vytvrdila.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Nakonec meč musíš vybrousit a očistit od nečistot.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Lehký obouruční meč.");
		KNOWS_LEICHTER2H = TRUE;
		PrintScreen("Naučil ses vykovat: Lehký obouruční meč",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_hüterklinge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Nejdřív si vem kus surové ocele a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Až bude pěkně rozpálená můžeš jí opracovat na kovadlině.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Okovanou čepel pak schlaď ve vodě aby se ocel pořádně vytvrdila.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Nakonec meč musíš vybrousit a očistit od nečistot.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Šavle správce.");
		KNOWS_HüTERKLINGE = TRUE;
		PrintScreen("Naučil ses vykovat: Šavle správce",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_königsklinge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Nejdřív si vem kus surové ocele a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Až bude pěkně rozpálená můžeš jí opracovat na kovadlině.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Okovanou čepel pak schlaď ve vodě aby se ocel pořádně vytvrdila.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Nakonec meč musíš vybrousit a očistit od nečistot.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Šavle krále.");
		KNOWS_KöNIGSKLINGE = TRUE;
		PrintScreen("Naučil ses vykovat: Šavle krále",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_roter_wind()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 7)
	{
		hero.lp = hero.lp - 7;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Nejdřív si vem kus surové ocele a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Až bude pěkně rozpálená můžeš jí opracovat na kovadlině.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Okovanou čepel pak schlaď ve vodě aby se ocel pořádně vytvrdila.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Nakonec meč musíš vybrousit a očistit od nečistot.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Rudý vítr.");
		KNOWS_ROTER_WIND = TRUE;
		PrintScreen("Naučil ses vykovat: Rudý vítr",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

instance INFO_DARRION_ARMORFINISHED(C_Info)
{
	npc = NOV_1312_Darrion;
	condition = info_darrion_armorfinished_condition;
	information = info_darrion_armorfinished_info;
	important = 0;
	permanent = 0;
	description = "Chtěl jsi se mnou mluvit?";
};

func int info_darrion_armorfinished_condition()
{
	if(((FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_TPL)))
	{
		return TRUE;
	};
};

func void info_darrion_armorfinished_info()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(hero,self,"Info_Darrion_DIE_06_01");	//Chtěl jsi se mnou mluvit?
		AI_Output(self,hero,"Info_Darrion_DIE_06_02");	//Tady jsi. Ano, chtěl jsem s tebou mluvit
		AI_Output(self,hero,"Info_Darrion_DIE_06_03");	//Už jsem slyšel, co se stalo a mám pro tebe dárek.
		AI_Output(self,hero,"Info_Darrion_DIE_14_04");	//Je pro mně ctí ti, jako jednomu z našich nejlepších templářů dát toto brnění.
		AI_Output(self,hero,"Info_Darrion_DIE_06_04");	//Tuto zbroj jsme našli v chrámu krátce potom, co jsme založili náš tábor.
		AI_Output(self,hero,"Info_Darrion_DIE_06_05");	//Nevíme, odkud je. Pravděpodobně patřila předchozím obyvatelům chrámů.
		AI_Output(self,hero,"Info_Darrion_DIE_06_06");	//Ta kultura byla rozhodně velmi odlišná od té naší.
		AI_Output(self,hero,"Info_Darrion_DIE_06_07");	//Doufám, že ti ta zbroj dobře poslouží.
		B_GiveXP(XP_GorMCPlateArmor);
		CreateInvItem(self,non_armor_h);
		B_GiveInvItems(self,hero,non_armor_h,1);
	}
	else
	{
		AI_Output(hero,self,"Info_Darrion_DIE_06_01");	//Chtěl jsi se mnou mluvit?
		AI_Output(self,hero,"Info_Darrion_DIE_06_02");	//Tady jsi. Ano, chtěl jsem s tebou mluvit
		AI_Output(self,hero,"Info_Darrion_DIE_06_03");	//Už jsem slyšel, co se stalo a mám pro tebe dárek.
		AI_Output(self,hero,"Info_Darrion_DIE_15_04");	//Jako Novic jsi ušel dlouhou cestu. Proto jsi si to zasloužil.
		AI_Output(self,hero,"Info_Darrion_DIE_06_04");	//Tuto zbroj jsme našli v chrámu krátce potom, co jsme založili náš tábor.
		AI_Output(self,hero,"Info_Darrion_DIE_06_05");	//Nevíme, odkud je. Pravděpodobně patřila předchozím obyvatelům chrámů.
		AI_Output(self,hero,"Info_Darrion_DIE_06_06");	//Ta kultura byla rozhodně velmi odlišná od té naší.
		AI_Output(self,hero,"Info_Darrion_DIE_06_07");	//Doufám, že ti ta zbroj dobře poslouží.
		B_GiveXP(XP_GorMCPlateArmor);
		CreateInvItem(self,non_armor_h);
		B_GiveInvItems(self,hero,non_armor_h,1);
	};
};

instance INFO_DARRION_CRAFT_WHICH(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 9;
	condition = info_darrion_craft_which_condition;
	information = info_darrion_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Můžeš vylepšit moji zbroj?";
};

func int info_darrion_craft_which_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void info_darrion_craft_which_info()
{
	AI_Output(hero,self,"Info_Darrion_CRAFT_WHICH_15_01");	//Můžeš vylepšit moji zbroj?
	AI_Output(self,hero,"Info_Darrion_CRAFT_WHICH_09_02");	//Ukaž mi svoji zbroj a já ti řeknu jestli ji můžu vylepšit.
	Info_ClearChoices(info_darrion_craft_which);
	Info_AddChoice(info_darrion_craft_which,DIALOG_BACK,info_darrion_craft_which_back);
	if(Npc_HasItems(other,nov_armor_l) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Vylepšit Bederní roušku novice (375 ks rudy) ",info_darrion_craft_which_novl);
	};
	if(Npc_HasItems(other,nov_armor_m) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Vylepšit Lehkou zbroj novice (525 ks rudy)",info_darrion_craft_which_novm);
	};
	if(Npc_HasItems(other,nov_armor_h) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Vylepšit Zbroj novice (600 ks rudy)",info_darrion_craft_which_novh);
	};
	if(Npc_HasItems(other,tpl_armor_l) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Vylepšeit Lehkou zbroj templáře (675 ks rudy)",info_darrion_craft_which_tpll);
	};
	if(Npc_HasItems(other,tpl_armor_m) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Vylepšit Zbroj templáře (825 ks rudy)",info_darrion_craft_which_tplm);
	};
	if(Npc_HasItems(other,tpl_armor_h) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Vylepšit Těžkou zbroj templáře (1050 ks rudy)",info_darrion_craft_which_tplh);
	};
};

func void info_darrion_craft_which_back()
{
	Info_ClearChoices(info_darrion_craft_which);
};

func void info_darrion_craft_which_novl()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,nov_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobře, můžu ji trochu vylepšit.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Ještě moment, za chvíli to bude.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,nov_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,nov_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,nov_armor_l_upgrade);
		B_GiveInvItems(self,hero,nov_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Tady je tvoje zbroj, měla by tě ochránit lépe než předtím.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_novm()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,nov_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 525))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobře, můžu ji trochu vylepšit.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Ještě moment, za chvíli to bude.
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		B_GiveInvItems(hero,self,ItMiNugget,525);
		Npc_RemoveInvItem(hero,nov_armor_m);
		CreateInvItem(hero,nov_armor_m_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Tady je tvoje zbroj, měla by tě ochránit lépe než předtím.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_novh()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,nov_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobře, můžu ji trochu vylepšit.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Ještě moment, za chvíli to bude.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,nov_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(self,nov_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,nov_armor_h_upgrade);
		B_GiveInvItems(self,hero,nov_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Tady je tvoje zbroj, měla by tě ochránit lépe než předtím.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tpll()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,tpl_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobře, můžu ji trochu vylepšit.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Ještě moment, za chvíli to bude.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,tpl_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_l_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Tady je tvoje zbroj, měla by tě ochránit lépe než předtím.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tplm()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,tpl_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobře, můžu ji trochu vylepšit.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Ještě moment, za chvíli to bude.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,tpl_armor_m);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_m_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Tady je tvoje zbroj, měla by tě ochránit lépe než předtím.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tplh()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,tpl_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobře, můžu ji trochu vylepšit.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Ještě moment, za chvíli to bude.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,tpl_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_h_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Tady je tvoje zbroj, měla by tě ochránit lépe než předtím.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

