instance DIA_LOGAN_EXIT(C_Info)
{
	npc = org_871_logan;
	nr = 999;
	condition = dia_logan_exit_condition;
	information = dia_logan_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_logan_exit_condition()
{
	return 1;
};

func void dia_logan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_LOGAN_HELLO(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_hello_condition;
	information = dia_logan_hello_info;
	permanent = 0;
	description = "Co tady děláš?";
};

func int dia_logan_hello_condition()
{
	return 1;
};

func void dia_logan_hello_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_Hello_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_01");	//Jsem lovec.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_02");	//Zajišťuju, aby nikdo z tábora nepošel hladem.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_03");	//Chňapavčí maso není nejlepší, ale je lepší než nic.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Logan, lovec, který žije v Táboře banditů v horách, mě může učit o lovu.");
};

instance ORG_859_LOGAN_CREATURES(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = org_859_logan_creatures_condition;
	information = org_859_logan_creatures_info;
	permanent = 1;
	description = "Chci se naučit zpracovat zvěř.";
};

func int org_859_logan_creatures_condition()
{
	if(Npc_KnowsInfo(hero,dia_logan_hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void org_859_logan_creatures_info()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_15_00");	//Chci se naučit zpracovat zvěř.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_13_01");	//Co chceš vědět?
		Info_ClearChoices(org_859_logan_creatures);
		Info_AddChoice(org_859_logan_creatures,DIALOG_BACK,org_859_logan_creatures_back);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Vyjmout zuby (cena: 1 VB, 50 nugetů)",org_859_logan_creatures_zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Stáhnout kožešinu (cena:1 VB, 100 nugetů)",org_859_logan_creatures_fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Vyjmout drápy (cena: 1 VB, 50 nugetů)",org_859_logan_creatures_kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Stáhnout plaza (cena: 1 VB, 100 nugetů)",org_859_logan_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_TaughtAll_13_00");	//Naučil jsem tě všechno, co vím.
	};
};

func void org_859_logan_creatures_back()
{
	Info_ClearChoices(org_859_logan_creatures);
};

func void org_859_logan_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_Zahn_15_00");	//Jak získám zuby?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Naučil ses: Odebírání zubů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Logan_Creatures_Zahn_13_01");	//Především si musíš dávat pozor aby se zuby neroztříštili. Abys tomu zabránil, musíš dát nůž pod zub a jemně ho vypáčit.
			AI_Output(self,other,"Org_859_Logan_Creatures_Zahn_13_02");	//Zuby můžeš odebrat vlkům, stínovým šelmám anebo chňapavcům.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Odebírání zubů - Vlk, Skřetí pes, Chňapavec, Kousavec, Lovecký pes, Stínová šelma");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_logan_creatures_fell()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_Fell_15_00");	//Jak můžu stáhnout kožešinu?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Naučil ses: Stahování kožešiny",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Logan_Creatures_Fell_13_01");	//To nejdůležitější: vždy stahuj zepředu dozadu. Jakmile se to naučíš, tak to nebude žádný problém. Kožešiny jsou velmi cenné!
			AI_Output(self,other,"Org_859_Logan_Creatures_Fell_13_02");	//Kožešina stažená z vlků a stínových šelem je vhodná pro výrobu oděvů. Zo jestli kožešinu má cenu stahovat spoznáš až zvěř prozkoumáš.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Stahování kožešiny - Vlk, Skřetí pes, Stínová šelma, Troll");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_logan_creatures_kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Naučil ses: Odebírání drápů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Logan_Creatures_Kralle_15_00");	//Nauč mě stahovat drápy!
			AI_Output(self,other,"Org_859_Logan_Creatures_Kralle_13_01");	//Když už víš jak na to, tak je to v podstatě velice snadné. Musíš drápy ohnout dopředu, v ne dozazu a v žádném případě je nevytahuj !
			AI_Output(self,other,"Org_859_Logan_Creatures_Kralle_13_02");	//Drápy můžeš odebrát hlavně z ještěrky. Spoznáš i sám od jaké zvěři je můžeš nebo nemůžeš odebrat.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Odebírání drápů - Ještěrka, Chňapavec, Číhavec, Kousavec, Břitva");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_logan_creatures_haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Naučil ses: Stahování plazí kůže",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Logan_Creatures_Haut_15_00");	//Na co si mám dát pozor při stahování kůže z plazů?
			AI_Output(self,other,"Org_859_Logan_Creatures_Haut_13_01");	//Jediní plazi, kteří jsou k tomu vhodní, jsou číhavci a bažinní žraloci.
			AI_Output(self,other,"Org_859_Logan_Creatures_Haut_13_02");	//Když kůži nařízneš po stranách jde dole téměř sama. Odteď bys neměl mít problém se stahováním plazů.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Stahování plazů - Číhavec, Močálový žralok");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};

var int logan_trade;

instance DIA_LOGAN_TRADE(C_Info)
{
	npc = org_871_logan;
	nr = 800;
	condition = dia_logan_trade_condition;
	information = dia_logan_trade_info;
	permanent = 1;
	description = "Můžeme obchodovat?";
	trade = 1;
};

func int dia_logan_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_logan_hello))
	{
		return 1;
	};
};

func void dia_logan_trade_info()
{
	AI_Output(other,self,"DIA_Logan_TRADE_15_00");	//Můžeme obchodovat?
	AI_Output(self,other,"DIA_Logan_TRADE_12_01");	//Záleží na tom, co nabízíš.
	if(LOGAN_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Logan z Tábora banditů v horách kupuje kůže, zuby i jiné zvířecí trofeje.");
		LOGAN_TRADE = TRUE;
	};
};

instance DIA_LOGAN_WHAT(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_what_condition;
	information = dia_logan_what_info;
	permanent = 0;
	description = "Co si myslíš o Estebanovi?";
};

func int dia_logan_what_condition()
{
	if(ESTEBAN_LEADER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_logan_what_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_What_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_01");	//Proč bych ti měl něco říct o Estebanovi?
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_02");	//Nejsi jeden z nás, takže nevím jestli ti věřit.
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_03");	//Ale mám pro tebe návrh.
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_04");	//Pojď se mnou na lov, a jestli mi dokážeš, že ti můžu věřit, promluvíme si.
};

instance DIA_LOGAN_HUNT(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_hunt_condition;
	information = dia_logan_hunt_info;
	permanent = 0;
	description = "Pojďme lovit.";
};

func int dia_logan_hunt_condition()
{
	if((ESTEBAN_LEADER == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_logan_what))
	{
		return 1;
	};
};

func void dia_logan_hunt_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_Hunt_15_00");	//Pojďme lovit.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_01");	//Dobře. Než vyrazíme měl bys něco vědět.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_02");	//Když jsem byl na lovu naposledy, narazil jsem na chňapavce. Viděl jsem spoustu bestií, ale ...
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_03");	//Tahleta potvora měla ledový pohled. Ani na okamih by neváhala roztrhat tě na tisíc kousků.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_04");	//Pokud mi ji pomůžeš zabít, budu ti dlužný.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	SNAPPER_HUNT = LOG_RUNNING;
	Log_CreateTopic(CH1_SNAPPER,LOG_MISSION);
	Log_SetTopicStatus(CH1_SNAPPER,LOG_RUNNING);
	B_LogEntry(CH1_SNAPPER,"Pokud mi má Logan pomoci, měl bych s ním nejdřív jít na lov. Řekl mi, že nedávno narazil na chladnokrevného chňapavce. Pokud mu s ním pomůžu, řekne mi, cokoliv budu potřebovat.");
	Wld_InsertNpc(badsnapper,"FP_ROAM_OW_SCA_01_BADITS2");
	Npc_ExchangeRoutine(self,"FMTAKEN");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FMTAKEN");
};

var int logan_esteban;

instance DIA_LOGAN_SUCCESS(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_success_condition;
	information = dia_logan_success_info;
	permanent = 0;
	important = 1;
};

func int dia_logan_success_condition()
{
	if((SNAPPER_HUNT == LOG_RUNNING) && Npc_HasItems(hero,itat_claws_snapper))
	{
		return 1;
	};
};

func void dia_logan_success_info()
{
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_15_00");	//Ta potvora je mrtvá.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_01");	//Dobrá práce, jsi pro něco užitečný.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_02");	//Jak jsem říkal, teď ti něco dlužím.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_03");	//Jsem toho názoru, že Esteban bude brzy naším novým vůdcem.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_04");	//Zakrátko se postaví Quentinovi.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_05");	//I když se Quentin o nás vždy dobře staral, časy se podle mě mění.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_06");	//To je to, co tě zajímalo, že? Uvidíme se v táboře.
	B_GiveInvItems(other,self,itat_claws_snapper,1);
	Npc_RemoveInvItems(self,itat_claws_snapper,1);
	SNAPPER_HUNT = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SNAPPER,LOG_SUCCESS);
	B_LogEntry(CH1_SNAPPER,"Logan byl spokojen. Odtaď mi důvěřuje a pomůže mi kdyby bylo potřeba.");
	B_GiveXP(XP_SNAPPER);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Logan je toho názoru, že Quentin už dlouho vůdcem nezůstane. Má ho rád, ale říká, že je čas na změnu.");
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	LOGAN_ESTEBAN = TRUE;
	AI_StopProcessInfos(self);
};

