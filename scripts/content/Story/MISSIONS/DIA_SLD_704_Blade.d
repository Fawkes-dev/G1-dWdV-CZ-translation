instance SLD_704_BLADE_EXIT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 999;
	condition = sld_704_blade_exit_condition;
	information = sld_704_blade_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int sld_704_blade_exit_condition()
{
	return 1;
};

func void sld_704_blade_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BLADE_HELLO(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_hello_condition;
	information = dia_blade_hello_info;
	permanent = 0;
	description = "Ahoj, kdo jsi?";
};

func int dia_blade_hello_condition()
{
	return 1;
};

func void dia_blade_hello_info()
{
	AI_Output(other,self,"DIA_Blade_Hello_13_00");	//Ahoj, kdo jsi?
	AI_Output(self,other,"DIA_Blade_Hello_15_01");	//Říkají mi Blade. Starám se o to aby byli naši chlapi po zuby ozbrojení.
	AI_Output(self,other,"DIA_Blade_Hello_11_01");	//Před svým časem v Kolonii jsem byl zbrojař v armádě. Pro tuhle práci jsem jako dělaný.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Blade mi může prodat kovářské potřeby.");
};

instance DIA_BLADE_TRADE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 800;
	condition = dia_blade_trade_condition;
	information = dia_blade_trade_info;
	permanent = 1;
	description = "Máš něco na prodej?";
	trade = 1;
};

func int dia_blade_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_hello))
	{
		return TRUE;
	};
};

func void dia_blade_trade_info()
{
	AI_Output(other,self,"DIA_Blade_Trade_15_00");	//Máš něco na prodej?
	AI_Output(self,other,"DIA_Blade_Trade_11_01");	//Můžu ti prodat pár věcí ke kování.
};

instance DIA_BLADE_LEARNNOT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_learnnot_condition;
	information = dia_blade_learnnot_info;
	permanent = 0;
	description = "Můžeš mě něco naučit?";
};

func int dia_blade_learnnot_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_hello))
	{
		return TRUE;
	};
};

func void dia_blade_learnnot_info()
{
	AI_Output(other,self,"DIA_Blade_LearnNOT_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Blade_LearnNOT_11_01");	//Pokud jsi jedním z nás, tak ano.
	AI_Output(self,other,"DIA_Blade_LearnNOT_11_02");	//Protože jsi jedním z banditů, ukážu ti základy. Kdybys byl jedním z nás žoldnéřů tak ti toho ukážu víc.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Žoldák Blade mě může učit kovářství.");
};

instance DIA_BLADE_LEARNYES(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_learnyes_condition;
	information = dia_blade_learnyes_info;
	permanent = 1;
	description = "Co mě můžeš naučit?";
};

func int dia_blade_learnyes_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_ORG) && Npc_KnowsInfo(hero,dia_blade_learnnot)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && Npc_KnowsInfo(hero,dia_blade_learnnot)))
	{
		return TRUE;
	};
};

func void dia_blade_learnyes_info()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_00");	//Co mě můžeš naučit?
	AI_Output(self,other,"DIA_Blade_LearnYES_11_01");	//Můžu ti ukázat pár triků z kovářství.
	AI_Output(self,other,"DIA_Blade_LearnYES_11_02");	//Řekni mi co bys rád věděl.
	Info_ClearChoices(dia_blade_learnyes);
	Info_AddChoice(dia_blade_learnyes,DIALOG_BACK,dia_blade_learnyes_back);
	if(((KNOWS_AXT == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (KNOWS_AXT == FALSE)))
	{
		Info_AddChoice(dia_blade_learnyes,"Morning Star (cena: 1 VB)",dia_blade_learnyes_axt);
	};
	if(((KNOWS_AXT == TRUE) && (KNOWS_STAHLGEFLECHT == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (KNOWS_STAHLGEFLECHT == FALSE) && (KNOWS_AXT == TRUE)))
	{
		Info_AddChoice(dia_blade_learnyes,"Ocelový palcát (cena: 2 VB)",dia_blade_learnyes_stahlgeflecht);
	};
	if(((KNOWS_AXT == TRUE) && (KNOWS_STAHLGEFLECHT == TRUE) && (KNOWS_STEINBRECHER == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (KNOWS_STEINBRECHER == FALSE) && (KNOWS_STAHLGEFLECHT == TRUE) && (KNOWS_AXT == TRUE)))
	{
		Info_AddChoice(dia_blade_learnyes,"Drtič kamene (cena: 3 VB)",dia_blade_learnyes_steinbrecher);
	};
	if((KNOWS_SöLDNERKLINGE == FALSE) && (KNOWS_AXT == TRUE) && (KNOWS_STEINBRECHER == TRUE) && (KNOWS_STAHLGEFLECHT == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Lehká bojová sekyra (cena: 4 VB)",dia_blade_learnyes_söldnerklinge);
	};
	if((KNOWS_ZWEIHĺNDER == FALSE) && (KNOWS_SöLDNERKLINGE == TRUE) && (KNOWS_AXT == TRUE) && (KNOWS_STEINBRECHER == TRUE) && (KNOWS_STAHLGEFLECHT == TRUE) && (Kapitel > 3) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Válečná sekyra (cena: 5 VB)",dia_blade_learnyes_zweihĺnder);
	};
	if((KNOWS_ZORNSTAHL == FALSE) && (KNOWS_ZWEIHĺNDER == TRUE) && (KNOWS_SöLDNERKLINGE == TRUE) && (KNOWS_AXT == TRUE) && (KNOWS_STEINBRECHER == TRUE) && (KNOWS_STAHLGEFLECHT == TRUE) && (Kapitel > 4) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Hlas válečníka (cena: 6 VB)",dia_blade_learnyes_zornstahl);
	};
};

func void dia_blade_learnyes_back()
{
	Info_ClearChoices(dia_blade_learnyes);
};

func void dia_blade_learnyes_axt()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Vem si surovou ocel a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Pak vem kovářské kladivo a opracuj ocel na kovadlině. Snaž se z ní vytvarovat meč, chvíli ti potrvá než z kusu ocele vytvaruješ čepel.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Když čepel nabere správný tvar, tak ji můžeš schladit v kbelíku s vodou.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Správným zakalením ocel pěkně vytvrdne. Nakonec čepel musíš vybrousit.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Morning Star.");
		KNOWS_AXT = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
		//BUG [Fawkes]: Chybal printscreen pre Morning Star
		PrintScreen("Naučil ses vykovat: Morning Star",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_stahlgeflecht()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Vem si surovou ocel a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Pak vem kovářské kladivo a opracuj ocel na kovadlině. Snaž se z ní vytvarovat meč, chvíli ti potrvá než z kusu ocele vytvaruješ čepel.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Když čepel nabere správný tvar, tak ji můžeš schladit v kbelíku s vodou.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Správným zakalením ocel pěkně vytvrdne. Nakonec čepel musíš vybrousit.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ocelový palcát.");
		KNOWS_STAHLGEFLECHT = TRUE;
		PrintScreen("Naučil ses vykovat: Ocelový palcát",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_steinbrecher()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Vem si surovou ocel a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Pak vem kovářské kladivo a opracuj ocel na kovadlině. Snaž se z ní vytvarovat meč, chvíli ti potrvá než z kusu ocele vytvaruješ čepel.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Když čepel nabere správný tvar, tak ji můžeš schladit v kbelíku s vodou.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Správným zakalením ocel pěkně vytvrdne. Nakonec čepel musíš vybrousit.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Drtič kamene.");
		KNOWS_STEINBRECHER = TRUE;
		PrintScreen("Naučil ses vykovat: Drtič kamene",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_söldnerklinge()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Vem si surovou ocel a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Pak vem kovářské kladivo a opracuj ocel na kovadlině. Snaž se z ní vytvarovat meč, chvíli ti potrvá než z kusu ocele vytvaruješ čepel.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Když čepel nabere správný tvar, tak ji můžeš schladit v kbelíku s vodou.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Správným zakalením ocel pěkně vytvrdne. Nakonec čepel musíš vybrousit.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Lehká bojová sekyra.");
		KNOWS_SöLDNERKLINGE = TRUE;
		PrintScreen("Naučil ses vykovat: Lehká bojová sekyra",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_zweihĺnder()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Vem si surovou ocel a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Pak vem kovářské kladivo a opracuj ocel na kovadlině. Snaž se z ní vytvarovat meč, chvíli ti potrvá než z kusu ocele vytvaruješ čepel.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Když čepel nabere správný tvar, tak ji můžeš schladit v kbelíku s vodou.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Správným zakalením ocel pěkně vytvrdne. Nakonec čepel musíš vybrousit.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Válečná sekyra.");
		KNOWS_ZWEIHĺNDER = TRUE;
		PrintScreen("Naučil ses vykovat: Válečná sekyra",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_zornstahl()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co musím udělat?
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Vem si surovou ocel a nažhav ji ve výhni.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Pak vem kovářské kladivo a opracuj ocel na kovadlině. Snaž se z ní vytvarovat meč, chvíli ti potrvá než z kusu ocele vytvaruješ čepel.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Když čepel nabere správný tvar, tak ji můžeš schladit v kbelíku s vodou.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Správným zakalením ocel pěkně vytvrdne. Nakonec čepel musíš vybrousit.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Hlas válečníka.");
		KNOWS_ZORNSTAHL = TRUE;
		PrintScreen("Naučil ses vykovat: Hlas válečníka",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

instance DIA_BLADE_SMITH(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_smith_condition;
	information = dia_blade_smith_info;
	permanent = 0;
	description = "Mám pro tebe novou práci.";
};

func int dia_blade_smith_condition()
{
	if(FMC_SMITH == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_blade_smith_info()
{
	AI_Output(other,self,"DIA_Blade_SMITH_13_00");	//Mám pro tebe novou práci.
	AI_Output(self,other,"DIA_Blade_SMITH_15_01");	//Oh? A jakou pak?
	AI_Output(other,self,"DIA_Blade_SMITH_11_02");	//Žoldnéři ze Svobodného dolu potřebují nového kováře.
	AI_Output(other,self,"DIA_Blade_SMITH_11_03");	//Z Kovárny v Kotlině se už celou věčnost nezakouřilo.
	AI_Output(self,other,"DIA_Blade_SMITH_11_04");	//A proč bych tam měl jít pracovat?
	AI_Output(other,self,"DIA_Blade_SMITH_11_05");	//Inu, myslím, že je lepší pracovat tam, než postávat celé dny tady v táboře a nic nedělat.
	AI_Output(self,other,"DIA_Blade_SMITH_11_06");	//Hmmm. Za tu dobu co jsem tu jsem docela zrezivěl. Asi máš pravdu, pohnu svým zadkem a zkusím to.
	AI_Output(self,other,"DIA_Blade_SMITH_11_07");	//Uvidíme se později.
	Npc_ExchangeRoutine(self,"FREEMINECAMP");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREEMINECAMP");
	B_LogEntry(CH1_FMCSMITH,"Blade souhlasil s prací ve Svobodném dole. Odešel na své nové pracoviště.");
};

instance DIA_BLADE_WHY(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_why_condition;
	information = dia_blade_why_info;
	permanent = 0;
	description = "Proč jsi tady a ne v Kotlině?";
};

func int dia_blade_why_condition()
{
	if((FMTaken == TRUE) && (FMC_SMITH == LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_blade_why_info()
{
	AI_Output(other,self,"DIA_Blade_WHY_13_00");	//Proč jsi tady a ne v Kotlině?
	AI_Output(self,other,"DIA_Blade_WHY_15_01");	//Neslyšel jsi to? Gomezovi lidé napadli Svobodný důl!
	AI_Output(self,other,"DIA_Blade_WHY_11_02");	//Okyl a všichni jeho lidé byli pobiti.
	AI_Output(self,other,"DIA_Blade_WHY_11_03");	//Měl jsem štěstí, že jsem byl v táboře pro zásoby když přepadli Kotlinu.
	AI_Output(self,other,"DIA_Blade_WHY_11_04");	//Zachránilo mi to život.
};

