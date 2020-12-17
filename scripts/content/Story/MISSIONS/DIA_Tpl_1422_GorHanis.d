instance Info_GorHanis_Exit(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_GorHanis_What(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	permanent = 0;
	description = "Co tady děláš?";
};

func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//Co tady děláš?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//Já?! Bojuju za slávu Spáče!
};

instance Info_GorHanis_Arena(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	permanent = 1;
	description = "Bojuješ v aréně?";
};

func int Info_GorHanis_Arena_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Arena_Info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//Bojuješ v aréně?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//Byl jsem vyslaný svými mistry z bažin, abych bojoval za Spáče.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//Budu tu bojovat za jeho větší slávu - tak můžou všichni nevěrci poznat, jakou silou mě obdařila jeho moc!
};

instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "Co je to Spáč?";
};

func int Info_GorHanis_Sleeper_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Sleeper_Info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Co je to Spáč?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//V našem táboře najdeš kněze, kteří ti tuhle otázku budou schopni zodpovědět lépe než já.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//Můžu ti říci akorát tohle: Spáč je náš spasitel, který nás přivedl na tohle místo a který nás odtud zase vyvede.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//Tím chceš říci, že čekáte, až vás váš bůh osvobodí?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//Ano! A to čekání brzy skončí. Právě se připravuje velké vzývání!
};

instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "Jaký druh vzývání připravujete?";
};

func int Info_GorHanis_Summoning_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func void Info_GorHanis_Summoning_Info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//Jaký druh vzývání připravujete?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//Naši proroci říkají, že společné vzývání Spáče je naším klíčem ke svobodě!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//Jestli se chceš o tom dozvědět víc, jdi do našeho tábora.
};

instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 1;
	description = "Můžeš mi popsat cestu do vašeho tábora?";
};

func int Info_GorHanis_WayToST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning))
	{
		return 1;
	};
};

func void Info_GorHanis_WayToST_Info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//Můžeš mi popsat cestu do vašeho tábora?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//Ve Starém táboře je několik noviců, kteří jsou ochotní doprovázet nové příchozí jako jsi ty do našeho tábora. Musíš si jim jenom říci.
};

var int hanis_herausforderung;

instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 10;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "Vyzývám tě na souboj v aréně!";
};

func int Info_GorHanis_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_gottofight))
	{
		return 1;
	};
};

func void Info_GorHanis_Charge_Info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//Vyzývám tě na souboj v aréně!
	if(hero.level < 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//Neposloužilo by příliš Spáčově slávě, kdybych před obecenstvem zabil nějakého břídila.
		AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//Budu proti tobě bojovat jedině v případě, že mi budeš důstojným protivníkem.
		AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//Jsem si jistý, že bojovníci ze Starého nebo Nového tábora nejsou všichni zásadoví muži...
		PrintScreen("Podmínka: Úroveň 10",-1,-1,"font_old_20_white.tga",1);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_04");	//Jsi dostatečně silný, aby jsi se mohl postavit Spáčovu vyvolenému.
		AI_Output(self,other,"Info_GorHanis_Charge_08_05");	//Až budeš připraven, najdeš mě v aréně.
		HANIS_HERAUSFORDERUNG = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		AI_StopProcessInfos(self);
	};
};

instance Info_GorHanis_ChargeGood(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 10;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	permanent = 1;
	description = "Jsem už dost silný, abych se s tebou mohl utkat?";
};

func int Info_GorHanis_ChargeGood_Condition()
{
	if((HANIS_HERAUSFORDERUNG == FALSE) && Npc_KnowsInfo(hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func void Info_GorHanis_ChargeGood_Info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//Jsem už dost silný, abych se s tebou mohl utkat?
	if(hero.level < 10)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//Ne! Nemáš dost síly - nejsi pro mě protivník!
		PrintScreen("Podmínka: Úroveň 10",-1,-1,"font_old_20_white.tga",1);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_04");	//Jsi dostatečně silný, aby jsi se mohl postavit Spáčovu vyvolenému.
		AI_Output(self,other,"Info_GorHanis_Charge_08_05");	//Až budeš připraven, najdeš mě v aréně.
		HANIS_HERAUSFORDERUNG = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		AI_StopProcessInfos(self);
	};
};

instance INFO_GORHANIS_FIGHT(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = info_gorhanis_fight_condition;
	information = info_gorhanis_fight_info;
	important = 1;
};

func int info_gorhanis_fight_condition()
{
	if((HANIS_HERAUSFORDERUNG == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void info_gorhanis_fight_info()
{
	if(HANIS_HERAUSFORDERUNG == TRUE)
	{
		AI_Output(self,other,"Info_GorHanis_Fight_15_01");	//Spáč ochrání mé tělo a mou mysl před všemi nepřáteli.
		AI_Output(self,other,"Info_GorHanis_Fight_08_01");	//Připrav se, že skončíš v prachu!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_8_LetsForgetOurLittleFight");	//Dobrá, zapomeneme na tohle malé nedorozumění.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};

instance INFO_GORHANIS_ARENAFIGHT(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = info_gorhanis_arenafight_condition;
	information = info_gorhanis_arenafight_info;
	important = 1;
	permanent = 1;
};

func int info_gorhanis_arenafight_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((HANIS_FIGHT == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500) && ((hanis.aivar[AIV_HASDEFEATEDSC] == FALSE) || (hanis.aivar[AIV_WASDEFEATEDBYSC] == FALSE)))
	{
		return 1;
	};
};

func void info_gorhanis_arenafight_info()
{
	AI_Output(self,other,"Info_GorHanis_Fight_15_01");	//Spáč ochrání mé tělo a mou mysl před všemi nepřáteli.
	AI_Output(self,other,"Info_GorHanis_Fight_08_01");	//Připrav se, že skončíš v prachu!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

instance INFO_TPL_1422_GORHANIS(C_Info)
{
	npc = tpl_5055_gorhanis;
	condition = info_tpl_1422_gorhanis_condition;
	information = info_tpl_1422_gorhanis_info;
	important = 1;
	permanent = 0;
};

func int info_tpl_1422_gorhanis_condition()
{
	if(Kapitel >= 5)
	{
		return 1;
	};
};

func void info_tpl_1422_gorhanis_info()
{
	AI_Output(self,other,"Info_TPL_1422_GorHanis_08_01");	//Co tady děláš?
	Info_ClearChoices(info_tpl_1422_gorhanis);
	Info_AddChoice(info_tpl_1422_gorhanis,"Chci pomoct probudit Spáče.",info_tpl_1422_gorhanis1);
	Info_AddChoice(info_tpl_1422_gorhanis,"To není tvoje věc!",info_tpl_1422_gorhanis2);
	Info_AddChoice(info_tpl_1422_gorhanis,"Jak ses dostal přes kněze?",info_tpl_1422_gorhanis3);
};

func void info_tpl_1422_gorhanis1()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis1_15_01");	//Chci pomoct probudit Spáče.
	AI_Output(self,other,"Info_TPL_1422_GorHanis1_08_02");	//Hmm, nevypadá to, že opravdu chceš pomoct. Ale pokračuj, nebudu ti stát v cestě, pokud lžeš nejvyšší kněz tě naučí lekci.
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

func void info_tpl_1422_gorhanis2()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis2_15_01");	//To není tvoje věc!
	AI_Output(self,other,"Info_TPL_1422_GorHanis2_08_02");	//Takže, raději tě nechám projít, než mi ublížíš (smích). Stejně se nedostaneš přes velekněze, alespoň si nemusím špinit meč tvojí krví.
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

func void info_tpl_1422_gorhanis3()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis3_15_01");	//Jak ses dostal přes kněze?
	AI_Output(self,other,"Info_TPL_1422_GorHanis3_08_02");	//Klidně ti to řeknu, stejně ti to nepomůže. Kněz nás nechal projít, protože mistr Kalom s ním promluvil, ty nebudeš mít takové štěstí. Jen jdi (smích).
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

instance INFO_GORHANIS_MEDITATE(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = info_gorhanis_meditate_condition;
	information = info_gorhanis_meditate_info;
	permanent = 0;
	important = 1;
};

func int info_gorhanis_meditate_condition()
{
	if(Wld_IsTime(4,0,4,45))
	{
		return 1;
	};
};

func void info_gorhanis_meditate_info()
{
	AI_OutputSVM(self,other,"$Om");
	AI_Output(self,other,"Info_GorHanis_Meditate_08_01");	//
	AI_Output(self,other,"Info_GorHanis_Meditate_08_02");	//Když už jsi tady, můžu tě naučit něco o meditaci Templářů.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_03");	//V boji nezáleží na fyzické síle. To duchovní síla je to na čem záleží.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_04");	//Pokud je tvoje mysl vyrovnaná, žádný soupeř pro tebe nebude nebezpečný.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_05");	//Proto věz, že ten kdo švihá mečem sílou své vůle má v bitvě převahu.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_06");	//Jdi a použij své znalosti, ukaž svým nepřátelům skutečnou duchovní sílu.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_07");	//Nechť tě Spáč chráni na tvé cestě!
	if(other.attribute[ATR_MANA_MAX] <= (1000 - 5))
	{
		other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 5;
		PrintScreen("Mana +5",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

