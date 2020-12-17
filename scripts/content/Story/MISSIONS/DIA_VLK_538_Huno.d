instance DIA_Huno_Exit(C_Info)
{
	npc = VLK_538_Huno;
	nr = 999;
	condition = DIA_Huno_Exit_Condition;
	information = DIA_Huno_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Huno_Exit_Condition()
{
	return 1;
};

func void DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Huno_YouKnowYourJob(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_YouKnowYourJob_Condition;
	information = DIA_Huno_YouKnowYourJob_Info;
	permanent = 0;
	important = 0;
	description = "Zdá se, že své práci rozumíš.";
};

func int DIA_Huno_YouKnowYourJob_Condition()
{
	return TRUE;
};

func void DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//Zdá se, že své práci rozumíš.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//Zatím si nikdo nestěžoval.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//Rozhodně to nebyl špatný nápad. Každý idiot tu potřebuje meč a to je věc, kterou dostane ode mě.
};

instance DIA_Huno_HowLong(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowLong_Condition;
	information = DIA_Huno_HowLong_Info;
	permanent = 0;
	important = 0;
	description = "Jak dlouho ti trvá výroba jedné čepele?";
};

func int DIA_Huno_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowLong_Info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//Jak dlouho ti trvá výroba jedné čepele?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//Záleží na typu. Jednoruční meče dělám rychle jako hurikán.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//Samozřejmě v případě, kdy mě motivuje cena.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//Podivín jako Whistler obvykle musí čekat na svou hračku déle než ostatní lidi.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//Proč? Neplatí dost?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//Ne, naopak. Za poslední meč dal 150 nugetů.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//Ten chlapík má zálibu v ozdobách a lákadlech na holky, proto to není levné.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//Hele, nejsi trochu moc zvědavý, příteli?
};

instance DIA_Huno_HowsYourBusiness(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowsYourBusiness_Condition;
	information = DIA_Huno_HowsYourBusiness_Info;
	permanent = 1;
	important = 0;
	description = "Tak co, kováři, jak jdou obchody?";
};

func int DIA_Huno_HowsYourBusiness_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//Tak co, kováři, jak jdou obchody?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//Proč to chceš vědět?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//Měl bych pro tebe zakázku.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03");	//Opravdu? A jakou?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//Přijď, až budeš něco opravdu potřebovat a přestaň mi lézt na nervy.
};

var int Huno_LearnSmith;
var int huno_smithasking;

instance DIA_Huno_LEARNSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_LEARNSMITH_Condition;
	information = DIA_Huno_LEARNSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Chtěl bych tu zkusit pracovat.";
};

func int DIA_Huno_LEARNSMITH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_LEARNSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//Chtěl bych tu zkusit pracovat.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//Och, ale nemysli si, že tě nechám dělat výstřední čepele!
	if(HUNO_SMITHASKING == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Huno, kovář ze Starého tábora, mě může naučit kovářství.");
		HUNO_SMITHASKING = TRUE;
	};
	Info_ClearChoices(DIA_Huno_LEARNSMITH);
	Info_AddChoice(DIA_Huno_LEARNSMITH,DIALOG_BACK,dia_huno_learnsmith_back);
	if(KNOWS_GROBESSCHWERT == FALSE)
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Primitivní meč (cena: 1 VB)",dia_huno_learnsmith_grobesschwert);
	};
	if(((KNOWS_LEICHTESGARDESCHWERT == FALSE) && (KNOWS_GROBESSCHWERT == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((KNOWS_LEICHTESGARDESCHWERT == FALSE) && (KNOWS_GROBESSCHWERT == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Lehký meč stráže (cena: 2 VB)",dia_huno_learnsmith_leichtesgardeschwert);
	};
	if(((KNOWS_GARDESCHWERT == FALSE) && (KNOWS_GROBESSCHWERT == TRUE) && (KNOWS_LEICHTESGARDESCHWERT == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((KNOWS_GARDESCHWERT == FALSE) && (KNOWS_GROBESSCHWERT == TRUE) && (KNOWS_LEICHTESGARDESCHWERT == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Meč stráže (cena: 3 VB)",dia_huno_learnsmith_gardeschwert);
	};
	if(((KNOWS_GARDISTENHAND == FALSE) && (KNOWS_GARDESCHWERT == TRUE) && (KNOWS_GROBESSCHWERT == TRUE) && (KNOWS_LEICHTESGARDESCHWERT == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((KNOWS_GARDISTENHAND == FALSE) && (KNOWS_GARDESCHWERT == TRUE) && (KNOWS_GROBESSCHWERT == TRUE) && (KNOWS_LEICHTESGARDESCHWERT == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Strážcova ruka (cena: 4 VB)",dia_huno_learnsmith_gardistenhand);
	};
};

func void dia_huno_learnsmith_back()
{
	Info_ClearChoices(DIA_Huno_LEARNSMITH);
};

func void dia_huno_learnsmith_grobesschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co musím dělat?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobře, vezmi ocel a vlož ji do výhně.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potom musíš do ruda rozžhavenou ocel položit na kovadlinu.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Když budeš hotový, vložíš horkou ocel do támhletoho kbelíku s vodou, aby se ochladila.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Vychladlá čepel se musí nakonec nabrousit na brusu.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Primitivní meč.");
		Huno_LearnSmith = TRUE;
		KNOWS_GROBESSCHWERT = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_leichtesgardeschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co musím dělat?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobře, vezmi ocel a vlož ji do výhně.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potom musíš do ruda rozžhavenou ocel položit na kovadlinu.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Když budeš hotový, vložíš horkou ocel do támhletoho kbelíku s vodou, aby se ochladila.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Vychladlá čepel se musí nakonec nabrousit na brusu.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Lehký meč stráže.");
		KNOWS_LEICHTESGARDESCHWERT = TRUE;
		PrintScreen("Naučil ses vykovat: Lehký meč stráže",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_gardeschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co musím dělat?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobře, vezmi ocel a vlož ji do výhně.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potom musíš do ruda rozžhavenou ocel položit na kovadlinu.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Když budeš hotový, vložíš horkou ocel do támhletoho kbelíku s vodou, aby se ochladila.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Vychladlá čepel se musí nakonec nabrousit na brusu.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Meč stráže.");
		KNOWS_GARDESCHWERT = TRUE;
		PrintScreen("Naučil ses vykovat: Lehký meč stráže",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_gardistenhand()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co musím dělat?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobře, vezmi ocel a vlož ji do výhně.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potom musíš do ruda rozžhavenou ocel položit na kovadlinu.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Když budeš hotový, vložíš horkou ocel do támhletoho kbelíku s vodou, aby se ochladila.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Vychladlá čepel se musí nakonec nabrousit na brusu.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Umím vykovat: Strážcova ruka.");
		KNOWS_GARDISTENHAND = TRUE;
		PrintScreen("Naučil ses vykovat: Strážcova ruka",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

var int huno_trader;

instance DIA_Huno_BUYSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_BUYSMITH_Condition;
	information = DIA_Huno_BUYSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Chtěl bych koupit kovářskou výbavu.";
	trade = 1;
};

func int DIA_Huno_BUYSMITH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_BUYSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//Chtěl bych koupit kovářskou výbavu.
	if(HUNO_TRADER == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Huno, kovář Starého tábora, mi může prodat různé kovářské potřeby");
		HUNO_TRADER = TRUE;
	};
};

instance DIA_HUNO_WAIT(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = dia_huno_wait_condition;
	information = dia_huno_wait_info;
	permanent = 0;
	important = 1;
};

func int dia_huno_wait_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void dia_huno_wait_info()
{
	AI_Output(self,other,"DIA_Huno_Wait_15_00");	//Hej, počkej chvilku!
	AI_Output(other,self,"DIA_Huno_Wait_09_01");	//Copak?
	AI_Output(self,other,"DIA_Huno_Wait_15_02");	//Jsi tu nový, že? Mám pro tebe nějakou práci.
	AI_Output(other,self,"DIA_Huno_Wait_09_03");	//A jakou?
	AI_Output(self,other,"DIA_Huno_Wait_15_04");	//Před několika dny jsem vykoval meč pro Bloodwyna, jednoho z Gomezových strážců.
	AI_Output(self,other,"DIA_Huno_Wait_09_05");	//Uložil jsem si ten meč do truhly, aby si ho Bloodwyn mohl vyzvednout.
	AI_Output(self,other,"DIA_Huno_Wait_09_06");	//Na druhý den byl ale pryč. To znamená, že někdo měl dlouhé prsty a hrabal se v mé truhle.
	AI_Output(self,other,"DIA_Huno_Wait_09_07");	//Zkus se poptat okolo. Možná zjistíš, kdo neudržel ruce mimo mé věci.
	AI_Output(self,other,"DIA_Huno_Wait_09_08");	//Nejlepší by bylo, kdybys začal na tržišti, je možné, že ten parchant meč prodal nějakému obchodníkovi.
	HUNO_LOSTSWORD = LOG_RUNNING;
	Log_CreateTopic(CH1_HUNOLOSTSWORD,LOG_MISSION);
	Log_SetTopicStatus(CH1_HUNOLOSTSWORD,LOG_RUNNING);
	B_LogEntry(CH1_HUNOLOSTSWORD,"Huno, kovář ze Starého tábora, mi dal za úlohu hledat meč, který původně vyrobil pro Bloodwyna. Někdo mu ho ukradl z truhly. Měl bych se poptat lidí na tržišti.");
};

instance DIA_HUNO_SUCCESS(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = dia_huno_success_condition;
	information = dia_huno_success_info;
	permanent = 0;
	important = 0;
	description = "Mám tvůj meč.";
};

func int dia_huno_success_condition()
{
	if(Npc_HasItems(other,bloodwyns_schwert) >= 1)
	{
		return TRUE;
	};
};

func void dia_huno_success_info()
{
	AI_Output(other,self,"DIA_Huno_Success_15_00");	//Mám tvůj meč.
	AI_Output(self,other,"DIA_Huno_Success_15_01");	//Dobrá práce. Konečně ho můžu dát Bloodwynovi.
	AI_Output(other,self,"DIA_Huno_Success_15_02");	//Nechceš vědět, kdo ho ukradl?
	AI_Output(self,other,"DIA_Huno_Success_15_03");	//Ne, zajímal mě jenom ten meč. Každý den tu něco zmizí, může v tom mít prsty polovina tábora.
	AI_Output(self,other,"DIA_Huno_Success_15_04");	//Než zapomenu. Tu je tvoje odměna.
	AI_Output(other,self,"DIA_Huno_Success_15_05");	//Díky, měj se!
	B_GiveInvItems(other,self,bloodwyns_schwert,1);
	Npc_RemoveInvItems(self,bloodwyns_schwert,1);
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	HUNO_LOSTSWORD = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_HUNOLOSTSWORD,LOG_SUCCESS);
	B_LogEntry(CH1_HUNOLOSTSWORD,"Huno byl s mnou odvedenou prací spokojený a za odměnu mi dal trochu rudy.");
	B_GiveXP(XP_HUNOLOSTSWORD);
};

instance INFO_HUNO_CRAFT_WHICH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 9;
	condition = info_huno_craft_which_condition;
	information = info_huno_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Vylepšuješ také brnění?";
};

func int info_huno_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void info_huno_craft_which_info()
{
	AI_Output(hero,self,"Info_Huno_CRAFT_WHICH_15_01");	//Vylepšuješ také brnění?
	AI_Output(self,hero,"Info_Huno_CRAFT_WHICH_09_02");	//Jistě, ale potřebuješ k tomu vhodné brnění a rudu.
	Info_ClearChoices(info_huno_craft_which);
	Info_AddChoice(info_huno_craft_which,DIALOG_BACK,info_huno_craft_which_back);
	if(Npc_HasItems(other,vlk_armor_l) >= 1)
	{
		Info_AddChoice(info_huno_craft_which,"Vylepšit Lehké kalhoty kopáče (125 ks rudy)",info_huno_craft_which_vlk);
	};
	if(Npc_HasItems(other,sfb_armor_l) >= 1)
	{
		Info_AddChoice(info_huno_craft_which,"Vylepšit Kalhoty kopáče (125 ks rudy)",info_huno_craft_which_sfb);
	};
};

func void info_huno_craft_which_back()
{
	Info_ClearChoices(info_huno_craft_which);
};

func void info_huno_craft_which_vlk()
{
	AI_Output(other,self,",	Info_Huno_CRAFT_WHICH_Huno_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,vlk_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 125))
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_16_02");	//Vypadá to dobře.
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_04");	//Jsem si jistý, že s tím můžu něco udělat. Počkej, hned se vrátím.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,ItMiNugget,125);
		Npc_RemoveInvItem(hero,vlk_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(hero,vlk_armor_l_upgrade);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_05");	//Takže tady je tvoje vylepšená zbroj. Opatruj se!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_02");	//Chybí ti ruda, chlapče. Vrať se, až budeš mít dost.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_huno_craft_which);
	};
};

func void info_huno_craft_which_sfb()
{
	AI_Output(other,self,",	Info_Huno_CRAFT_WHICH_Huno_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,sfb_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 125))
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_16_02");	//Vypadá to dobře.
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_04");	//Jsem si jistý, že s tím můžu něco udělat. Počkej, hned se vrátím.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sfb_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,125);
		Npc_RemoveInvItem(self,sfb_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,sfb_armor_l_upgrade);
		B_GiveInvItems(self,hero,sfb_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_05");	//Takže tady je tvoje vylepšená zbroj. Opatruj se!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_02");	//Chybí ti ruda, chlapče. Vrať se, až budeš mít dost.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_huno_craft_which);
	};
};

