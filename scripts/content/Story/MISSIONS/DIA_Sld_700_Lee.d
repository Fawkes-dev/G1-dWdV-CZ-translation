instance Sld_700_Lee_Exit(C_Info)
{
	npc = Sld_700_Lee;
	nr = 999;
	condition = Sld_700_Lee_Exit_Condition;
	information = Sld_700_Lee_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

func void Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Sld_700_Lee_Greet(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Greet_Condition;
	information = Sld_700_Lee_Greet_Info;
	permanent = 0;
	description = "Ty jsi velitel žoldáků, viď?";
};

func int Sld_700_Lee_Greet_Condition()
{
	return 1;
};

func void Sld_700_Lee_Greet_Info()
{
	AI_Output(other,self,"DIA_Lee_Greet_15_00");	//Ty jsi velitel žoldáků, viď?
	AI_Output(self,other,"DIA_Lee_Greet_08_01");	//Přesně tak, hochu!
};

instance Sld_700_Lee_Define(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Define_Condition;
	information = Sld_700_Lee_Define_Info;
	permanent = 0;
	description = "Jaké úkoly dávají mágové žoldákům?";
};

func int Sld_700_Lee_Define_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

func void Sld_700_Lee_Define_Info()
{
	AI_Output(other,self,"DIA_Lee_Define_15_00");	//Jaké úkoly dávají mágové žoldákům?
	AI_Output(self,other,"DIA_Lee_Define_08_01");	//Velmi jednoduché: chránit rudu - chránit mágy.
	AI_Output(self,other,"DIA_Lee_Define_08_02");	//Občas pro nás mají mágové zvláštní úkoly.
};

instance Sld_700_Lee_Mitmachen(C_Info)
{
	npc = Sld_700_Lee;
	nr = 2;
	condition = Sld_700_Lee_Mitmachen_Condition;
	information = Sld_700_Lee_Mitmachen_Info;
	permanent = 0;
	description = "Chtěl bych se k vám přidat!";
};

func int Sld_700_Lee_Mitmachen_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_Greet) && (Npc_GetTrueGuild(hero) == GIL_None) && (oldHeroGuild == 0))
	{
		return 1;
	};
};

func void Sld_700_Lee_Mitmachen_Info()
{
	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00");	//Chtěl bych se k vám přidat!
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01");	//Ty máš ale nervy! Ty si vážně myslíš, že přijmu každého, kdo sem přijde?
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02");	//Můžeš se stát jedním z nás až potom, co strávíš určitý čas v táboře. Budu tě pozorovat!
};

var int Lee_SldPossible;

instance Sld_700_Lee_NowReady(C_Info)
{
	npc = Sld_700_Lee;
	nr = 700;
	condition = Sld_700_Lee_NowReady_Condition;
	information = Sld_700_Lee_NowReady_Info;
	permanent = 1;
	description = "Chtěl bych se stát žoldákem mágů - jsem na to už připravený?";
};

func int Sld_700_Lee_NowReady_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10)))
	{
		return 1;
	};
};

func void Sld_700_Lee_NowReady_Info()
{
	AI_Output(other,self,"DIA_Lee_NowReady_15_00");	//Chtěl bych se stát žoldákem mágů - jsem na to už připravený?
	if(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01");	//Tvoje skutky vykonané pro lidi ve Starém dolu ukázaly, že jsi docela správný chlap.
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02");	//Byl bych ochotný přijmout tě k žoldákům.
		if(hero.level < 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03");	//Ale ještě nejsi připravený stát se žoldákem. Musíš ještě získat nějaké zkušenosti, potom budeš patřit k nám.
			AI_StopProcessInfos(self);
			B_PrintGuildCondition(10);
		}
		else if(hero.level >= 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//Dám ti příležitost. Co ty na to?
			Lee_SldPossible = TRUE;
		};
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"DIA_Lee_NowReady_08_01");	//Ještě nemáš dost zkušeností. Potřebuješ ještě zlepšit své schopnosti.
		B_PrintGuildCondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//Dám ti příležitost. Co ty na to?
		Lee_SldPossible = TRUE;
	};
};

instance Sld_700_Lee_BECOMESLDNOW(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_BECOMESLDNOW_Condition;
	information = Sld_700_Lee_BECOMESLDNOW_Info;
	important = 0;
	permanent = 0;
	description = "Chci se stát žoldákem.";
};

func int Sld_700_Lee_BECOMESLDNOW_Condition()
{
	if((Lee_SldPossible == TRUE) && (hero.level >= 10))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01");	//Chci se stát žoldákem.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02");	//Dobré rozhodnutí. Nebudeš litovat.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03");	//Řekni mi něco: Proč? Proč jsi se přidal k nám a ne ke Starému táboru nebo k Bratrstvu?
	Log_CreateTopic(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry(GE_BecomeMercenary,"Lee mě přidal k žoldákům.");
	Info_ClearChoices(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Ostatní tábory nejsou tak dobré.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Chtěl jsem svobodu od samého začátku.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Něco mě k tomu táhlo.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};

func void Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01");	//Ostatní tábory nejsou tak dobré.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02");	//Jedna věc je tady nade všechno důležitá, totiž naděje na svobodu. Vítej, ŽOLDÁKU!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_05");	//Odteď si můžeš každý den vyzvednout svůj plat. 10 kusů rudy, tolik, kolik tu dostáva každý žoldnéř. Zítra dostaneš první výplatu.
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01");	//Chtěl jsem svobodu od samého začátku.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02");	//Dostaneme naší svobodu nazpět. Vítej, ŽOLDÁKU!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_05");	//Odteď si můžeš každý den vyzvednout svůj plat. 10 kusů rudy, tolik, kolik tu dostáva každý žoldnéř. Zítra dostaneš první výplatu.
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01");	//Něco mě k tomu táhlo.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02");	//Hlavní věc, nevzdat se, aby nás ta Bariéra nepolapila navždycky. Vítej, ŽOLDÁKU!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_05");	//Odteď si můžeš každý den vyzvednout svůj plat. 10 kusů rudy, tolik, kolik tu dostáva každý žoldnéř. Zítra dostaneš první výplatu.
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	AI_StopProcessInfos(self);
};

instance Sld_700_Lee_DAMNPAST(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_DAMNPAST_Condition;
	information = Sld_700_Lee_DAMNPAST_Info;
	important = 1;
	permanent = 0;
};

func int Sld_700_Lee_DAMNPAST_Condition()
{
	if((Saturas_BringFoci == 5) && (Npc_GetDistToNpc(hero,self) < 1000) && (Npc_GetDistToWP(self,"NC_DAM") < 1000))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_DAMNPAST_Info()
{
	var C_Npc Homer;
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01");	//Bývaly časy, kdy jsem vedl úplně jiný život.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02");	//Byl jsem jedním z nejlepších generálů téhle země.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03");	//Celý život jsem strávil v boji za svou vlast.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04");	//Šlechta mě ale neměla v oblibě, protože král naslouchal mým radám. A také věděla, že představuju hrozbu pro jejich špinavé obchody.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05");	//Nepočítal jsem s jejich zákeřností. Použili proti mně královu ženu.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06");	//Byl jsem obviněn z její nesmyslné vraždy. Král Rhobar neměl jinou volbu.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07");	//Služby, které jsem vlasti prokázal, mě zachránily před šibenicí. Ale byl jsem zbaven svobody.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08");	//Jednoho dne budu zase svobodný. Pak se vrátím a pomstím se.
	AI_AlignToWP(self);
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09");	//Provedu svoji pomstu.
	Npc_ExchangeRoutine(self,"START");
	Homer = Hlp_GetNpc(BAU_935_Homer);
	Npc_ExchangeRoutine(Homer,"START");
	AI_ContinueRoutine(Homer);
};

instance Sld_700_Lee_FMTaken(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_FMTaken_Condition;
	information = Sld_700_Lee_FMTaken_Info;
	permanent = 1;
	description = "Co si myslíš o dolu?";
};

func int Sld_700_Lee_FMTaken_Condition()
{
	if(FMTaken)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_FMTaken_Info()
{
	AI_Output(other,self,"DIA_Lee_FMTaken_15_00");	//Co si myslíš o dolu?
	if(Lee_freeminereport == 0)
	{
		AI_Output(self,other,"DIA_Lee_FMTaken_08_01");	//Zašli příliš daleko a budou toho litovat.
	}
	else
	{
		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01");	//Už by neměli nikdy představovat hrozbu!
		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//Udělal jsi toho pro náš tábor mnoho. Pro muže, jako jsi ty, budu mít vždycky dobré místo.
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Děkuju. Půjdu si svou cestou.
		AI_Output(hero,self,"Info_Exit_Info_15_01");	//Ještě se uvidíme.
		B_LogEntry(CH4_BannedFromOC,"Informoval jsem Leeho o čistce, kterou jsme s Gornem provedli ve Svobodném dole. Byl velmi potěšen.");
		B_GiveXP(500);
		Lee_freeminereport = 0;
	};
};

instance Sld_700_Lee_CHANGESIDE(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_CHANGESIDE_Condition;
	information = Sld_700_Lee_CHANGESIDE_Info;
	important = 0;
	permanent = 0;
	description = "Vypověděli mě ze Starého tábora, chtěl bych se přidat k vám!";
};

func int Sld_700_Lee_CHANGESIDE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01");	//Vypověděli mě ze Starého tábora, chtěl bych se přidat k vám!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//Udělal jsi toho pro náš tábor mnoho. Pro muže, jako jsi ty, budu mít vždycky dobré místo.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03");	//Zkrátíme to. Vítej do Nového tábora, ŽOLDÁKU!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04");	//Tady je zbroj. Dobře, že jsi tu s náma.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_05");	//Odteď si můžeš každý den vyzvednout svůj plat. 10 kusů rudy, tolik, kolik tu dostáva každý žoldnéř. Zítra dostaneš první výplatu.
	CreateInvItem(self,sld_armor_m);
	B_GiveInvItems(self,hero,sld_armor_m,1);
	Npc_GetInvItemBySlot(hero,INV_ARMOR,2);
	if(Hlp_GetInstanceID(item) == sld_armor_m)
	{
		AI_EquipArmor(hero,item);
	};
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	B_LogEntry(CH4_BannedFromOC,"Převlékl jsem kabát. Poté, co mě vyhostili ze Starého tábora, přidal jsem se k žoldákům. A teď zpátky za Saturasem!");
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Lee mě může naučit bojovat s OBOURUČNÍMI ZBRANĚMI. Kromě toho mi může pomoci zdokonalit moji SÍLU a OBRATNOST. ");
};

instance Sld_700_Lee_ARMOR(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ARMOR_Condition;
	information = Sld_700_Lee_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Potřebuju lepší zbroj.";
};

func int Sld_700_Lee_ARMOR_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ARMOR_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01");	//Potřebuju lepší zbroj.
	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02");	//Na svoji zbroj si musíš nejdříve vydělat. Nehledě na to, že tě přijde draho.
	Info_ClearChoices(Sld_700_Lee_ARMOR);
	Info_AddChoice(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeMercs,VALUE_SLD_ARMOR_M),Sld_700_Lee_ARMOR_M);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeHeavyMercs,VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};

func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices(Sld_700_Lee_ARMOR);
};

func void Sld_700_Lee_ARMOR_M()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01");	//Chci střední zbroj.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02");	//Ještě nejsi dost zkušený, abys nosil lepší zbroj. Přijď, až budeš mít víc zkušeností.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_SLD_ARMOR_M)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03");	//Bez rudy nedostaneš žádnou zbroj.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04");	//Tahle zbroj je pěkná práce. Ochrání tvé tělo velmi dobře.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_SLD_ARMOR_M);
		CreateInvItem(hero,sld_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void Sld_700_Lee_ARMOR_H()
{
	AI_Output(other,self,"DIA_LEE_BUYARMORH_15_00");	//Dej mi těžkou zbroj.
	if(Kapitel < 4)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02");	//Ještě nejsi dost zkušený, abys nosil těžkou zbroj. Přijď, až budeš mít víc zkušeností.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_SLD_ARMOR_H)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03");	//Bez rudy nedostaneš žádnou zbroj.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04");	//Tahle zbroj je nejlepší kousek, jaký kdy byl uvnitř Bariéry. A věř mi, má cenu rudy.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_SLD_ARMOR_H);
		CreateInvItem(hero,sld_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

instance Sld_700_Lee_Teach(C_Info)
{
	npc = Sld_700_Lee;
	nr = 10;
	condition = Sld_700_Lee_Teach_Condition;
	information = Sld_700_Lee_Teach_Info;
	permanent = 1;
	description = "Můžeš mě něco naučit?";
};

func int Sld_700_Lee_Teach_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01");	//Můžu ti pomoci stát se silnější a obratnější.
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	Info_ClearChoices(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

instance Sld_700_Lee_ZWEIHAND1(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND1_Condition;
	information = Sld_700_Lee_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};

func int Sld_700_Lee_ZWEIHAND1_Condition()
{
	if(((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTrueGuild(hero) == GIL_SLD)) || ((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01");	//Chci se naučit zacházet s obouručním mečem.
	if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02");	//Dobře, ale nejdřív musíme pobrat základy.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03");	//Meč musíš držet vodorovně. Potřebuješ silnější rozmach, abys mohl na nepřítele zaútočit takovou těžkou zbraní.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04");	//Zvedni ruku a rozmáchni se rovnou dolu. To obvykle stačí na to, abys nepřítele srazil k zemi.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05");	//Toho momentu pak využiješ k novému rozmáchnutí.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06");	//Obouruční meče jsou ideální k zasazování bočních úderů, kterými si nepřítele udržíš od těla.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07");	//To by mohlo pro začátek stačit. Trénuj.
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
};

instance Sld_700_Lee_ZWEIHAND2(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND2_Condition;
	information = Sld_700_Lee_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0);
};

func int Sld_700_Lee_ZWEIHAND2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01");	//Chci se dozvědět víc o boji s obouručním mečem.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02");	//Ze všeho nejdříve musíš zaujmout základní postoj. Meč musíš držet svisle, stranou od těla a údery vést silně oběma rukama.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03");	//Švihnout rychle dolu a ostří vést přes rameno. Pak máš šanci provést rychlý švih napravo.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04");	//Tvůj protivník nebude mít šanci se k tobě dostat.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05");	//Nebo mečem švihni z levé horní strany směrem dopředu, abys odrazil protivníka dozadu.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06");	//Pořád se otáčej, abys následnému švihu vždy dodával potřebnou sílu, která protivníka srazí.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07");	//Pokud to nebude stačit, zbylý švih využij k novému napřáhnutí meče.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08");	//Až útok dokončíš, zneškodni protivníka a vyčkej na další souboj.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09");	//Klíčem k úspěchu je měnit postoje a polohy.
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
};

var int lee_soldday;

instance DIA_LEE_DAILYSOLD(C_Info)
{
	npc = Sld_700_Lee;
	nr = 3;
	condition = dia_lee_dailysold_condition;
	information = dia_lee_dailysold_info;
	permanent = 1;
	description = "Chci svůj dnešní plat.";
};

func int dia_lee_dailysold_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return 1;
	};
};

func void dia_lee_dailysold_info()
{
	AI_Output(other,self,"DIA_Lee_DailySold_15_00");	//Chci svůj dnešní plat.
	if(LEE_SOLDDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Lee_DailySold_05_01");	//Dobře. Tady je 10 kusů rudy, které dostáva každý žoldák.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		LEE_SOLDDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_DailySold_05_02");	//Dnes už jsi dostal zaplaceno. Přijď zase zítra.
	};
};

