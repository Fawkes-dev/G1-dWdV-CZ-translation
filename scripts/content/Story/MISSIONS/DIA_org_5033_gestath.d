instance DIA_GESTATH_EXIT(C_Info)
{
	npc = org_5033_gestath;
	nr = 999;
	condition = dia_gestath_exit_condition;
	information = dia_gestath_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_gestath_exit_condition()
{
	return 1;
};

func void dia_gestath_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GESTATH_HELLO(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = dia_gestath_hello_condition;
	information = dia_gestath_hello_info;
	permanent = 0;
	description = "Co tady děláš?";
};

func int dia_gestath_hello_condition()
{
	return 1;
};

func void dia_gestath_hello_info()
{
	AI_Output(other,self,"DIA_Org_5033_Gestath_Hello_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Org_5033_Gestath_Hello_13_01");	//Jsem lovec. Procházím Kolonií a lovím.
	AI_Output(other,self,"DIA_Org_5033_Gestath_Hello_13_02");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Org_5033_Gestath_Hello_13_03");	//Ano, ale ne zadarmo.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Gestath, lovec, který žije mezi Svobodným dolem a Novým táborem, mě může učit odebíraní trofejí.");
};

instance DIA_GESTATH_ARMOR(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = dia_gestath_armor_condition;
	information = dia_gestath_armor_info;
	permanent = 0;
	description = "Máš na sobě zajímavé brnění.";
};

func int dia_gestath_armor_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_hello))
	{
		return 1;
	};
};

func void dia_gestath_armor_info()
{
	AI_Output(other,self,"DIA_Org_5033_Gestath_Armor_15_00");	//Máš na sobě zajímavé brnění.
	AI_Output(self,other,"DIA_Org_5033_Gestath_Armor_13_01");	//Jo? Vyrobil mi ho chlápek jménem Wolf.
	AI_Output(self,other,"DIA_Org_5033_Gestath_Armor_13_02");	//Přinesl mu potřebné materiály a na druhý byla zbroj hotová.
};

instance ORG_859_GESTATH_CREATURES(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = org_859_gestath_creatures_condition;
	information = org_859_gestath_creatures_info;
	permanent = 1;
	description = "Chci se naučit zpracovat zvěř.";
};

func int org_859_gestath_creatures_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void org_859_gestath_creatures_info()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_15_00");	//Chci se naučit zpracovat zvěř.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_13_01");	//Co chceš vědět?
		Info_ClearChoices(org_859_gestath_creatures);
		Info_AddChoice(org_859_gestath_creatures,DIALOG_BACK,org_859_gestath_creatures_back);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Vyjmout zuby (cena: 1 VB, 50 nugetů)",org_859_gestath_creatures_zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Stáhnout kožešinu (cena:1 VB, 100 nugetů)",org_859_gestath_creatures_fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Vyjmout drápy (cena: 1 VB, 50 nugetů)",org_859_gestath_creatures_kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Stáhnout plaza (cena: 1 VB, 100 nugetů)",org_859_gestath_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_TaughtAll_13_00");	//Naučil jsem tě všechno, co vím.
	};
};

func void org_859_gestath_creatures_back()
{
	Info_ClearChoices(org_859_gestath_creatures);
};

func void org_859_gestath_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_Zahn_15_00");	//Jak získám zuby?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Naučil ses: Odebírání zubů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Gestath_Creatures_Zahn_13_01");	//Především si musíš dávat pozor aby se zuby neroztříštili. Abys tomu zabránil, musíš dát nůž pod zub a jemně ho vypáčit.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Zahn_13_02");	//Zuby můžeš odebrat vlkům, stínovým šelmám anebo chňapavcům.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Odebírání zubů - Vlk, Skřetí pes, Chňapavec, Kousavec, Lovecký pes, Stínová šelma");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_gestath_creatures_fell()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_Fell_15_00");	//Jak můžu stáhnout kožešinu?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Naučil ses: Stahování kožešiny",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Gestath_Creatures_Fell_13_01");	//To nejdůležitější: vždy stahuj zepředu dozadu. Jakmile se to naučíš, tak to nebude žádný problém. Kožešiny jsou velmi cenné!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Fell_13_02");	//Kožešina stažená z vlků a stínových šelem je vhodná pro výrobu oděvů. Zo jestli kožešinu má cenu stahovat spoznáš až zvěř prozkoumáš.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Stahování kožešiny - Vlk, Skřetí pes, Stínová šelma, Troll");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_gestath_creatures_kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Naučil ses: Odebírání drápů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Gestath_Creatures_Kralle_15_00");	//Nauč mě stahovat drápy!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Kralle_13_01");	//Když už víš jak na to, tak je to v podstatě velice snadné. Musíš drápy ohnout dopředu, v ne dozazu a v žádném případě je nevytahuj !
			AI_Output(self,other,"Org_859_Gestath_Creatures_Kralle_13_02");	//Drápy můžeš odebrát hlavně z ještěrky. Spoznáš i sám od jaké zvěři je můžeš nebo nemůžeš odebrat.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Odebírání drápů - Ještěrka, Chňapavec, Číhavec, Kousavec, Břitva");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_gestath_creatures_haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Naučil ses: Stahování plazí kůže",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Gestath_Creatures_Haut_15_00");	//Na co si mám dát pozor při stahování kůže z plazů?
			AI_Output(self,other,"Org_859_Gestath_Creatures_Haut_13_01");	//Jediní plazi, kteří jsou k tomu vhodní, jsou číhavci a bažinní žraloci.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Haut_13_02");	//Když kůži nařízneš po stranách jde dole téměř sama. Odteď bys neměl mít problém se stahováním plazů.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Stahování plazů - Číhavec, Močálový žralok");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

