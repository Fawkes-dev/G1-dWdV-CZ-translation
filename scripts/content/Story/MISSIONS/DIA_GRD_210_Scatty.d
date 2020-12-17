instance DIA_Scatty_Exit(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 999;
	condition = DIA_Scatty_Exit_Condition;
	information = DIA_Scatty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Scatty_Exit_Condition()
{
	return 1;
};

func void DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Scatty_WhatDoYouDo(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WhatDoYouDo_Condition;
	information = DIA_Scatty_WhatDoYouDo_Info;
	permanent = 0;
	description = "Co je tvá práce?";
};

func int DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

func void DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01");	//Střežím arénu. Organizuju vsázení, najímám nové bojovníky... Však víš.
};

var int Scatty_ChargeKirgo;
var int Scatty_ChargeKharim;
var int Scatty_ChargeGorHanis;

instance DIA_Scatty_JoinOC(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 4;
	condition = DIA_Scatty_JoinOC_Condition;
	information = DIA_Scatty_JoinOC_Info;
	permanent = 0;
	description = "Chci se přidat k táboru. Pomůžeš mi?";
};

func int DIA_Scatty_JoinOC_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_JoinOC_Info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00");	//Chci se přidat k táboru. Pomůžeš mi?
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01");	//Možná bych mohl, musel bys mě ale nějak přesvědčit.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02");	//Několik nejlepších bojovníků ze všech tří táborů sem chodí, aby si zde navzájem poměřilo síly.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03");	//Vyzvi někoho z nich na souboj. Budu tě sledovat a když budeš dobrý, zamyslím se nad tím.
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	B_LogEntry(CH1_JoinOC,"Scatty, mistr arény, ocení, když vyzvu jednoho z bojovníků.");
};

instance DIA_Scatty_KirgoSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KirgoSuccess_Condition;
	information = DIA_Scatty_KirgoSuccess_Info;
	permanent = 0;
	description = "Bojoval jsem s Kirgem!";
};

func int DIA_Scatty_KirgoSuccess_Condition()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	if((Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KirgoSuccess_Info()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00");	//Bojoval jsem s Kirgem!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//Jistě, a prohrál jsi.
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02");	//Určitě si nemyslíš, že mě tímhle přesvědčíš...
		Scatty_ChargeKirgo = LOG_FAILED;
		B_LogEntry(CH1_JoinOC,"Skutečnost, že mě Kirgo porazil, už na Scattyho takový dojem neudělala.");
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03");	//A porazil jsi ho! To není na začátečníka, jako jsi ty, špatné! Přesvědčil jsi mě!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Scatty byl zaujat mým bojem proti Kirgovi.");
		B_GiveXP(XP_kirgovictory);
	};
};

instance DIA_Scatty_KHARIMSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KHARIMSuccess_Condition;
	information = DIA_Scatty_KHARIMSuccess_Info;
	permanent = 0;
	description = "Vyzval jsem  Kharima!";
};

func int DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	if((Scatty_ChargeKharim == LOG_RUNNING) && (Kharim_Charged == TRUE) && ((Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KHARIMSuccess_Info()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00");	//Vyzval jsem  Kharima!
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01");	//A ten tě zmlátil, hochu!
		if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02");	//Vybral sis vhodného protivníka! Ty bastardy z Nového tábora nemůžu vystát.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03");	//Vypadá to, že to vidíš podobně - jsi přesně ten typ chlapa, jaký potřebujeme!
		};
		Scatty_ChargeKharim = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry(CH1_JoinOC,"Kharim mě zbil! Scattymu se líbila moje odvaha, ne však můj boj.");
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//A srazil jsi ho! Musím uznat, že to nebylo špatné. Vždycky byl jedním z nejpovažovanějších bojovníků.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05");	//Tohle na mě opravdu udělalo dojem!
		Scatty_ChargeKharim = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Nandal jsem to Kharimovi! Scatty byl dojatý.");
		B_GiveXP(XP_kharimvictory);
	};
};

instance DIA_Scatty_OtherCamps(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 3;
	condition = DIA_Scatty_OtherCamps_Condition;
	information = DIA_Scatty_OtherCamps_Info;
	permanent = 0;
	description = "Proč necháváš lidi z jiných táborů, aby se tady bili?";
};

func int DIA_Scatty_OtherCamps_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_OtherCamps_Info()
{
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00");	//Myslel jsem, že Starý a Nový tábor spolu nevycházejí dobře - tak proč tady necháváš jejich lidi bojovat?
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01");	//To je jednoduché - odehrávají se tady jednou týdně souboje a kopáči pokaždé rádi vidí, když je některý z hrdlořezů z Nového tábora rozdrcen.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02");	//Pokud bojuje jeden z nich, pak se uzavře více sázek - a to je skvělé pro obchod!
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03");	//Mezi námi, já ty grázly z Nového tábora nemůžu vystát - ale obchod je obchod.
};

var int scatty_betday;

instance DIA_Scatty_WannaBet(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaBet_Condition;
	information = DIA_Scatty_WannaBet_Info;
	permanent = 1;
	description = "Chci uzavřít sázku.";
};

func int DIA_Scatty_WannaBet_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaBet_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00");	//Chci uzavřít sázku.
	if((SCATTY_BETDAY <= (Wld_GetDay() - 7)) && Wld_IsTime(18,0,23,0))
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_11");	//Tak dobrá. Všichni bojovníci dnes nastupují do arény. Můžeš si vybrat, na koho vsadíš.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_12");	//Tak jako všichni ostatní, můžeš si vadit 75 kusů rudy. Žádné výjimky, sázky jsou stejné pro všechny.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		Info_AddChoice(DIA_Scatty_WannaBet,"Vsadím si na Kirga.",dia_scatty_wannabet_kirgo);
		Info_AddChoice(DIA_Scatty_WannaBet,"Vsadím si na Kharima.",dia_scatty_wannabet_kharim);
		if(Kapitel <= 2)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"Vsadím si na Gor Hanise.",dia_scatty_wannabet_hanis);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_01");	//Teď ale není žádný souboj.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_02");	//Příští boje budou za několik dní. Bude to vyhlášeno.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_03");	//Svůj tip na vítěze mi můžeš dát mezi 18-tou a 23-tí hodinou.
	};
};

func void dia_scatty_wannabet_kirgo()
{
	AI_Output(other,self,"DIA_Scatty_Kirgo_WannaBet_15_00");	//Vsadím si na Kirga.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_01");	//Dobře. Kirgo není v aréně dlouho, ale dělá veliké pokroky.
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_02");	//Pokud Kirgo vyhraje, dostaneš 150 kusů rudy, pokud ne, ruda je moje.
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_04");	//Jdi na tribůnu k ostatním divákům a užij si boj.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		KIRGO_BET = TRUE;
		ARENA_FIGHT = TRUE;
		SCATTY_BETDAY = Wld_GetDay();
		Npc_ExchangeRoutine(GRD_251_Kirgo,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(GRD_251_Kirgo);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_05");	//Nemáš dost rudy, žádná ruda, žádná stávka.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_wannabet_kharim()
{
	AI_Output(other,self,"DIA_Scatty_Kharim_WannaBet_15_00");	//Vsadím si na Kharima.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_01");	//Kharima? No, je to dobrý bojovník, i navzdory tomu, že je z Nového tábora.
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_02");	//Pokud Kharim vyhraje, dostaneš 150 kusů rudy. Pokud ne, nechám si tvoji sázku a nic nedostaneš.
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_04");	//Jdi na tribůnu k ostatním divákům a užij si boj.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		KHARIM_BET = TRUE;
		ARENA_FIGHT = TRUE;
		SCATTY_BETDAY = Wld_GetDay();
		Npc_ExchangeRoutine(GRD_251_Kirgo,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(GRD_251_Kirgo);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_05");	//Nemáš dost rudy, žádná ruda, žádná stávka.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_wannabet_hanis()
{
	AI_Output(other,self,"DIA_Scatty_Hanis_WannaBet_15_00");	//Vsadím si na Gor Hanise.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_01");	//Na sektáře? Je to dobrý bojovník a vyhrál spoustu zápasů.
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_02");	//Pokud Kharim vyhraje, dostaneš 150 kusů rudy. Pokud ne, nechám si tvoji sázku a nic nedostaneš.
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_04");	//Jdi na tribůnu k ostatním divákům a užij si boj.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		HANIS_BET = TRUE;
		ARENA_FIGHT = TRUE;
		SCATTY_BETDAY = Wld_GetDay();
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(Tpl_1422_GorHanis);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_05");	//Nemáš dost rudy, žádná ruda, žádná stávka.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};

instance DIA_Scatty_WannaFight(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaFight_Condition;
	information = DIA_Scatty_WannaFight_Info;
	permanent = 1;
	description = "Chci bojovat v aréně!";
};

func int DIA_Scatty_WannaFight_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (Npc_GetTrueGuild(hero) == GIL_None) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00");	//Chci bojovat v aréně!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01");	//Nemůžu tě nechat bojovat, dokud se nepřipojíš k jednomu z táborů!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02");	//Nikoho nezajímají nezávislí bojovníci!
};

instance DIA_Scatty_TRAIN(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 10;
	condition = DIA_Scatty_TRAIN_Condition;
	information = DIA_Scatty_TRAIN_Info;
	permanent = 1;
	description = "Cvičíš vůbec bojovníky?";
};

func int DIA_Scatty_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_TRAIN_Info()
{
	if(log_scattytrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Scatty, mistr arény, mě může naučit bojovat s JEDNORUČNÍMI ZBRANĚMI.");
		log_scattytrain = TRUE;
	};
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00");	//Cvičíš vůbec bojovníky?
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01");	//Jistě, ale ne pro zábavu. Jestli chceš, abych tě cvičil, musíš mi za to zaplatit.
	Info_ClearChoices(DIA_Scatty_TRAIN);
	Info_AddChoice(DIA_Scatty_TRAIN,DIALOG_BACK,DIA_Scatty_TRAIN_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,150),DIA_Scatty_TRAIN_2h);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,50),DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Scatty_TRAIN);
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00");	//Chci se zlepšit v ovládání jednoručního meče.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01");	//To je dobré rozhodnutí! Ještě než se začneš učit techniku, musíš se naučit správně držet zbraň.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02");	//Začátečníci obyčejně mívají snahu držet jednoruční meč oběma rukama. Tímto způsobem rozhodně nezačínej, to není dobré.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03");	//Drž zbraň v jedné ruce, čepelí vzhůru a šermuj s ní.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04");	//Musíš se naučit sladit pohyb zbraně s pohybem svého těla. Tak budeš při útoku rychlejší.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05");	//Když si zapamatuješ, co jsem tě naučil, tak bude tvůj boj v budoucnu elegantnější a rychlejší.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06");	//Ovšem, ještě jednu věc: Některé údery způsobí větší škodu než ostatní. Jako začátečníkovi se ti nebude často dostávat šance rozhodujících úderů.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07");	//Ale časem budeš dělat pokroky a zlepšíš se.
			B_GiveInvItems(other,self,ItMiNugget,50);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00");	//Nemáš dost rudy!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01");	//Nauč mě ještě lépe ovládat jednoruční meč.
	if(Npc_HasItems(other,ItMiNugget) >= 150)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02");	//Dobrá, základy znáš. Když podržíš zbraň níž, umožní ti to mnohem silněji vést první švih.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03");	//Musíš se hýbat, pamatuješ? Dobře, teď musíš ještě víc pracovat tělem. Po druhém úderu se otoč. To protivníka zmate a tobě to umožní zaujmout optimální pozici.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04");	//Ještě jednou veď čepel zprava doleva.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05");	//A znovu kupředu. Nezapomeň: cvičením k dokonalosti. Takže vzhůru do toho, aby ses stal mistrem jednoručního meče.
			B_GiveInvItems(other,self,ItMiNugget,150);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00");	//Vrať se, až budeš mít dost rudy!
	};
};

var int scatty_maybefight;
var int scatty_idoit;

instance DIA_SCATTY_FLETCHER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_fletcher_condition;
	information = dia_scatty_fletcher_info;
	permanent = 0;
	description = "Fletcher má u tebe dlh, že?";
};

func int dia_scatty_fletcher_condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_reden) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_fletcher_info()
{
	AI_Output(other,self,"DIA_Scatty_Fletcher_15_00");	//Fletcher má u tebe dlh, že?
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_01");	//Řekl ti o tom? Ano má a není to zrovna málo.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_02");	//Proč tě to zajímá?
	AI_Output(other,self,"DIA_Scatty_Fletcher_01_03");	//Chtěl bych mu pomoct.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_04");	//Ah, opravdu?
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_05");	//No, myslím, že vím jak by jsi mohl pomoct.
	Info_ClearChoices(dia_scatty_fletcher);
	Info_AddChoice(dia_scatty_fletcher,"Jak?",dia_scatty_fletcher_idea);
};

func void dia_scatty_fletcher_idea()
{
	AI_Output(other,self,"DIA_Scatty_Idea_15_00");	//Jak?
	AI_Output(self,other,"DIA_Scatty_Idea_01_01");	//Bojuj za Fletchera v Aréně.
	AI_Output(self,other,"DIA_Scatty_Idea_01_02");	//Když vyhraješ, smažu Fletcherův dluh.
	AI_Output(self,other,"DIA_Scatty_Idea_01_03");	//Ale jestli prohraješ, Fletcher bude muset zaplatit dvojnásob.
	AI_Output(self,other,"DIA_Scatty_Idea_01_04");	//Co myslíš?
	Info_ClearChoices(dia_scatty_fletcher);
	Info_AddChoice(dia_scatty_fletcher,"Dobře, nemám jinou možnost.",dia_scatty_fletcher_okay);
	Info_AddChoice(dia_scatty_fletcher,"Budu o tom přemýšlet.",dia_scatty_fletcher_maybe);
};

func void dia_scatty_fletcher_okay()
{
	AI_Output(other,self,"DIA_Scatty_Okay_15_00");	//Zdá se, že nemám na výběr.
	AI_Output(self,other,"DIA_Scatty_Okay_01_01");	//Dobře, pustím se do příprav souboje.
	AI_Output(self,other,"DIA_Scatty_Okay_01_02");	//Promluv si s Gor Hanisem. Bude tvým protivníkem v Aréně.
	AI_Output(self,other,"DIA_Scatty_Okay_01_03");	//Měl by jsi si ještě jednou promluvit s Fletcherem. Nejspíš by měl vědět o naší dohodě.
	Info_ClearChoices(dia_scatty_fletcher);
	SCATTY_IDOIT = TRUE;
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Scatty mi dal šanci bojovat s Gorem Hanisem, aby mohl zrušit Fletcherovi dluhy. Když vyhraju, Scatty zruší jeho dluh. Pokud prohraju, bude mu Fletcher dlužit dvojnásob. Měl bych si o tom promluvit s Fletcherem.");
};

func void dia_scatty_fletcher_maybe()
{
	AI_Output(other,self,"DIA_Scatty_Maybe_15_00");	//Promyslím to.
	AI_Output(self,other,"DIA_Scatty_Maybe_01_01");	//Dobrá, ale ať to netrvá, nebudu na svou rudu čekat věčnost.
	Info_ClearChoices(dia_scatty_fletcher);
	SCATTY_MAYBEFIGHT = TRUE;
};

instance DIA_SCATTY_REMEMBER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_remember_condition;
	information = dia_scatty_remember_info;
	permanent = 0;
	description = "Ještě jednou jsem si promyslel tu záležitost s Fletcherem.";
};

func int dia_scatty_remember_condition()
{
	if((SCATTY_MAYBEFIGHT == TRUE) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_remember_info()
{
	AI_Output(other,self,"DIA_Scatty_Remember_15_00");	//Ještě jednou jsem si promyslel tu záležitost s Fletcherem.
	AI_Output(self,other,"DIA_Scatty_Remember_01_01");	//No a?
	AI_Output(other,self,"DIA_Scatty_Remember_01_02");	//Přijímám tvou nabídku.
	AI_Output(self,other,"DIA_Scatty_Remember_01_03");	//Dobře. Já se postarám o přípravy. Ty si promluv s Gor Hanisem, bude tvým protivníkem.
	AI_Output(self,other,"DIA_Scatty_Remember_01_04");	//Nejlepší bude když si ještě jednou promluvíš i s Fletcherem, aby věděl všechny detaily.
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Scatty mi dal šanci bojovat s Gorem Hanisem, aby mohl zrušit Fletcherovi dluhy. Když vyhraju, Scatty zruší jeho dluh. Pokud prohraju, bude mu Fletcher dlužit dvojnásob. Měl bych si o tom promluvit s Fletcherem.");
};

instance DIA_SCATTY_HANISSUCCESS(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_hanissuccess_condition;
	information = dia_scatty_hanissuccess_info;
	permanent = 0;
	description = "Bojoval jsem s Gor Hanisem!";
};

func int dia_scatty_hanissuccess_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((HANIS_HERAUSFORDERUNG == TRUE) && ((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_hanissuccess_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Scatty_HanisSuccess_15_00");	//Bojoval jsem s Gor Hanisem!
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_01");	//A vyprášil s tebou zem.
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_02");	//Odkaž Fletcherovi, že mi teď dluží dvakrát tolik rudy co předtím.
		FLETCHER_SCHULDEN = LOG_FAILED;
		Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_FAILED);
		B_LogEntry(CH1_FLETCHER_SCHULDEN,"Po mé prohře s Gorem Hanisem bude muset Fletcher zaplatit Scattymu dvakrát tolik rudy. Z toho nebude mít velkou radost.");
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_03");	//A porazil jsi ho. To není zlé na někoho, kdo je v Kolonii tak krátce. Vzkaž Fletcherovi, že jeho dluh je ... smazán.
		FLETCHER_SCHULDEN = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_SUCCESS);
		B_LogEntry(CH1_FLETCHER_SCHULDEN,"Vyhrál jsem v boji proti Gor Hanisovi a zbavil tak Fletchera jeho dluhů.");
		B_GiveXP(XP_HANISVICTORY);
	};
};

var int scatty_fightday;

instance DIA_SCATTY_FIGHTNOW(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_fightnow_condition;
	information = dia_scatty_fightnow_info;
	permanent = 0;
	description = "Patřím do tábora, nech mě bojovat.";
};

func int dia_scatty_fightnow_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_NOV) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_ORG) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GRD) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_STT) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_fightnow_info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_FightNow_15_00");	//Patřím do tábora, nech mě bojovat.
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowPSI_01_01");	//A, takže jsi se přidal k sektářům? Velmi dobře, Gor Hanis je jeden z našich nejlepších bojovníků.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Vysvětlím ti pravidla, která by jsi jako bojovník v aréně měl znát a dodržovat.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Za prvé bys měl vědět, že tu nebojujeme na život a na smrt.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Jakmile padne jeden z bojovníků tak je po boji.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Až porazíš svého soupeře, tak ať tě ani nenapadne ho dorazit, protože pak dorazíme tebe. Bojovníky tu potřebujeme jako sůl.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Měl bys vědět, že jako bojovník si zasloužíš podíl za každý souboj. Ale nečekej tuny rudy, dostaneš malý podíl z výdělku.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale neboj, dostaneš všechnu slávu, když vyhraješ. (úsměv)
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Pokud si chceš zabojovat, přijď za mnou a promluvíme si o tvém protivníkovi.
	}
	else if((Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowOC_01_01");	//Velmi dobře. Další bojovník za náš tábor. Je na čase, aby někdo nakopal těm zmetkům z Nového tábora.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Vysvětlím ti pravidla, která by jsi jako bojovník v aréně měl znát a dodržovat.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Za prvé bys měl vědět, že tu nebojujeme na život a na smrt.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Jakmile padne jeden z bojovníků tak je po boji.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Až porazíš svého soupeře, tak ať tě ani nenapadne ho dorazit, protože pak dorazíme tebe. Bojovníky tu potřebujeme jako sůl.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Měl bys vědět, že jako bojovník si zasloužíš podíl za každý souboj. Ale nečekej tuny rudy, dostaneš malý podíl z výdělku.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale neboj, dostaneš všechnu slávu, když vyhraješ. (úsměv)
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Pokud si chceš zabojovat, přijď za mnou a promluvíme si o tvém protivníkovi.
	}
	else if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowNC_01_01");	//Další z Nového tábora? Jsem zvědavý, co ukážeš.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Vysvětlím ti pravidla, která by jsi jako bojovník v aréně měl znát a dodržovat.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Za prvé bys měl vědět, že tu nebojujeme na život a na smrt.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Jakmile padne jeden z bojovníků tak je po boji.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Až porazíš svého soupeře, tak ať tě ani nenapadne ho dorazit, protože pak dorazíme tebe. Bojovníky tu potřebujeme jako sůl.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Měl bys vědět, že jako bojovník si zasloužíš podíl za každý souboj. Ale nečekej tuny rudy, dostaneš malý podíl z výdělku.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale neboj, dostaneš všechnu slávu, když vyhraješ. (úsměv)
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Pokud si chceš zabojovat, přijď za mnou a promluvíme si o tvém protivníkovi.
	};
};

var int kirgo_fight;
var int kharim_fight;
var int hanis_fight;

instance DIA_SCATTY_FIGHTER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_fighter_condition;
	information = dia_scatty_fighter_info;
	permanent = 1;
	description = "Nech mě bojovat v aréně.";
};

func int dia_scatty_fighter_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_fightnow) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_fighter_info()
{
	AI_Output(other,self,"DIA_Scatty_Fighter_15_00");	//Nech mě bojovat v aréně.
	if(SCATTY_FIGHTDAY <= (Wld_GetDay() - 4))
	{
		AI_Output(self,other,"DIA_Scatty_Fighter_01_01");	//Dobře. Nejdříve si promluvíme o tvém soupeři, pak o platbě.
		AI_Output(self,other,"DIA_Scatty_Fighter_01_02");	//Velikost odměny závisí od toho, koho si vybereš na souboj.
		Info_ClearChoices(dia_scatty_fighter);
		Info_AddChoice(dia_scatty_fighter,"Chci bojovat s Kirgem.",dia_scatty_fighter_kirgo);
		Info_AddChoice(dia_scatty_fighter,"Chci bojovat s Kharimem.",dia_scatty_fighter_kharim);
		if(Kapitel <= 2)
		{
			Info_AddChoice(dia_scatty_fighter,"Chci bojovat s Gorem Hanisem.",dia_scatty_fighter_hanis);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Fighter_15_01");	//Teď ale žádný souboj naplánovaný není. Vrať se za pár dní, určitě pro tebe něco budu mít.
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_fighter_kirgo()
{
	AI_Output(other,self,"DIA_Scatty_Kirgo_15_00");	//Chci bojovat s Kirgem.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_01");	//Dobrá, teď přejdeme k sázce.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_02");	//Pokud vyhraješ, dostaneš 25 kusů rudy.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_03");	//Ale pokud prohraješ nedostaneš nic. Tedy kromě nakládačky.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_04");	//Kirgo tě bude čekat v aréně. Hodně štěstí!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE");
	Npc_SetTarget(GRD_251_Kirgo,other);
	AI_StartState(GRD_251_Kirgo,ZS_Attack,1,"");
	Npc_ExchangeRoutine(GRD_251_Kirgo,"GUIDE");
	b_story_npcs_watchfight();
	KIRGO_FIGHT = TRUE;
	SCATTY_FIGHTDAY = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
		AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
		CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
		AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
	};
	AI_StopProcessInfos(self);
};

func void dia_scatty_fighter_kharim()
{
	AI_Output(other,self,"DIA_Scatty_Kharim_15_00");	//Chci bojovat s Kharimem.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_01");	//Dobrá, teď přejdeme k sázce.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_02");	//Když vyhraješ, dostaneš 50 kusů rudy.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_03");	//Ale pokud prohraješ nedostaneš nic. Tedy kromě nakládačky.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_04");	//Kharim tě bude čekat v aréně. Hodně štěstí!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE");
	Npc_SetTarget(Sld_729_Kharim,other);
	AI_StartState(Sld_729_Kharim,ZS_Attack,1,"");
	Npc_ExchangeRoutine(Sld_729_Kharim,"GUIDE");
	b_story_npcs_watchfight();
	KHARIM_FIGHT = TRUE;
	SCATTY_FIGHTDAY = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
		AI_EquipBestMeleeWeapon(Sld_729_Kharim);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
		CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
		AI_EquipBestMeleeWeapon(Sld_729_Kharim);
	};
	AI_StopProcessInfos(self);
};

func void dia_scatty_fighter_hanis()
{
	AI_Output(other,self,"DIA_Scatty_Hanis_15_00");	//Chci bojovat s Gor Hanisem.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_01");	//Dobrá, teď přejdeme k sázce.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_02");	//Když vyhraješ, dostaneš 100 kusů rudy.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_03");	//Ale pokud prohraješ nedostaneš nic. Tedy kromě nakládačky.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_04");	//Gor Hanis tě bude čekat v aréně. Hodně štěstí!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE");
	Npc_SetTarget(Tpl_1422_GorHanis,other);
	AI_StartState(Tpl_1422_GorHanis,ZS_Attack,1,"");
	Npc_ExchangeRoutine(Tpl_1422_GorHanis,"GUIDE");
	b_story_npcs_watchfight();
	HANIS_FIGHT = TRUE;
	SCATTY_FIGHTDAY = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
		CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
		AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
	};
	AI_StopProcessInfos(self);
};

instance DIA_SCATTY_KIRGOFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_kirgofight_condition;
	information = dia_scatty_kirgofight_info;
	permanent = 1;
	description = "Bojoval jsem s Kirgem";
};

func int dia_scatty_kirgofight_condition()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	if(((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (KIRGO_FIGHT == TRUE)) || ((Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) && (KIRGO_FIGHT == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_kirgofight_info()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoFight_15_00");	//Bojoval jsem s Kirgem
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoFight_01_01");	//A prohrál jsi.
		AI_Output(self,other,"DIA_Scatty_KirgoFight_01_02");	//Nemám pro tebe žádnou rudu, ta je jenom pro vítěze.
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
		KIRGO_FIGHT = FALSE;
		AI_Teleport(Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kirgo,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess1_01_03");	//A napráskal jsi mu pořádně.
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess1_01_04");	//Byl to dobrý boj, tady je tvůj podíl.
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
		KIRGO_FIGHT = FALSE;
		AI_Teleport(Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kirgo,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,25);
		B_GiveInvItems(self,hero,ItMiNugget,25);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};

instance DIA_SCATTY_KHARIMFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_kharimfight_condition;
	information = dia_scatty_kharimfight_info;
	permanent = 1;
	description = "Bojoval jsem s Kharimem.";
};

func int dia_scatty_kharimfight_condition()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	if(((Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (KHARIM_FIGHT == TRUE)) || ((Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE) && (KHARIM_FIGHT == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_kharimfight_info()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	AI_Output(other,self,"DIA_Scatty_KharimFight_15_00");	//Bojoval jsem s Kharimem.
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KharimFight_01_01");	//Pěkně ti namlátil.
		AI_Output(self,other,"DIA_Scatty_KharimFight_01_02");	//Ruda je teď v žoldnéřově kapse.
		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
		KHARIM_FIGHT = FALSE;
		AI_Teleport(Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kharim,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KharimSuccess_01_03");	//Vypadá to, že to vidíš podobně - jsi přesně ten typ chlapa, jaký potřebujeme!
		AI_Output(self,other,"DIA_Scatty_KharimSuccess_01_04");	//A srazil jsi ho! Musím uznat, že to nebylo špatné. Vždycky byl jedním z nejpovažovanějších bojovníků.
		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
		KHARIM_FIGHT = FALSE;
		AI_Teleport(Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kharim,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,50);
		B_GiveInvItems(self,hero,ItMiNugget,50);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};

instance DIA_SCATTY_HANISFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_hanisfight_condition;
	information = dia_scatty_hanisfight_info;
	permanent = 1;
	description = "Bojoval jsem s Gor Hanisem.";
};

func int dia_scatty_hanisfight_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if(((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (HANIS_FIGHT == TRUE)) || ((hanis.aivar[AIV_HASDEFEATEDSC] == TRUE) && (HANIS_FIGHT == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_hanisfight_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Scatty_HanisFight_15_00");	//Bojoval jsem s Gor Hanisem.
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisFight_01_01");	//Už dlouho jsem neviděl někoho kdo dostal takovou nakládačku.
		AI_Output(self,other,"DIA_Scatty_HanisFight_01_02");	//Vybral jsi si těžkého protivníka. Ruda je jeho.
		hanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		hanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
		HANIS_FIGHT = FALSE;
		AI_Teleport(hanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(hanis,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_03");	//A porazil jsi ho. To není zlé na někoho, kdo je v Kolonii tak krátce. Vzkaž Fletcherovi, že jeho dluh je ... smazán.
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_04");	//Tady je tvůj podíl, zasloužíš si ho.
		hanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		hanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
		HANIS_FIGHT = FALSE;
		AI_Teleport(hanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(hanis,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,100);
		B_GiveInvItems(self,hero,ItMiNugget,100);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};

instance DIA_SCATTY_FIGHTSOVER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_fightsover_condition;
	information = dia_scatty_fightsover_info;
	permanent = 1;
	description = "Chci si vybrat svoji sázku.";
};

func int dia_scatty_fightsover_condition()
{
	if(((HANIS_BET == TRUE) && (ARENA_FIGHT == FALSE)) || ((KIRGO_BET == TRUE) && (ARENA_FIGHT == FALSE)) || ((KHARIM_BET == TRUE) && (ARENA_FIGHT == FALSE)))
	{
		return 1;
	};
};

func void dia_scatty_fightsover_info()
{
	AI_Output(other,self,"DIA_Scatty_FightsOver_15_00");	//Chci si vybrat svoji sázku.
	if((HANIS_BET == TRUE) && (Tpl_1422_GorHanis.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_02_11");	//Gor Hanis prohrál, takže máš smůlu.
		AI_Output(self,other,"DIA_Scatty_FightsOver_02_02");	//Další souboj bude za pár dní. Můžeš skusit své štěstí zase příště.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((HANIS_BET == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_22");	//Gor Hanis vyhrál, takže tady je 150 kusů rudy.
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_04");	//Ale neprochlastej to všechno najednou, dobře? Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_05");	//Další souboj bude za pár dní. Můžeš si zase vsadit.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((KHARIM_BET == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_04_33");	//Kharim prohrál, takže jsi nic nevyhrál.
		AI_Output(self,other,"DIA_Scatty_FightsOver_04_02");	//Další souboj bude za pár dní. Můžeš skusit své štěstí zase příště.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((KHARIM_BET == TRUE) && (GRD_251_Kirgo.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_44");	//Kharim vyhrál, vydělal ti 150 kusů rudy.
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_04");	//Ale neprochlastej to všechno najednou, dobře? Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_05");	//Další souboj bude za pár dní. Můžeš si zase vsadit.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((KIRGO_BET == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_55");	//Kirgo vyhrál, tady je tvých 150 kusů rudy.
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_04");	//Ale neprochlastej to všechno najednou, dobře? Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_05");	//Další souboj bude za pár dní. Můžeš si zase vsadit.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((KIRGO_BET == TRUE) && (GRD_251_Kirgo.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_07_66");	//Kirgo prohrál, nic jsi tedy nevydělal.
		AI_Output(self,other,"DIA_Scatty_FightsOver_07_02");	//Další souboj bude za pár dní. Můžeš skusit své štěstí zase příště.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	};
};

