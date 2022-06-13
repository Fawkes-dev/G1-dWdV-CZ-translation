instance ORG_801_Lares_Exit(C_Info)
{
	npc = Org_801_Lares;
	nr = 999;
	condition = ORG_801_Lares_Exit_Condition;
	information = ORG_801_Lares_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int ORG_801_Lares_Exit_Condition()
{
	return 1;
};

func void ORG_801_Lares_Exit_Info()
{
	AI_StopProcessInfos(self);
};

var int Lares_vorbeigemogelt;

instance ORG_801_Lares_YouHere(C_Info)
{
	npc = Org_801_Lares;
	nr = 1;
	condition = ORG_801_Lares_YouHere_Condition;
	information = ORG_801_Lares_YouHere_Info;
	permanent = 1;
	important = 1;
};

func int ORG_801_Lares_YouHere_Condition()
{
	var C_Npc Roscoe;
	Roscoe = Hlp_GetNpc(ORG_840_Roscoe);
	if(Roscoe.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void ORG_801_Lares_YouHere_Info()
{
	var C_Npc Roscoe;
	Roscoe = Hlp_GetNpc(ORG_840_Roscoe);
	if(Npc_IsInState(Roscoe,ZS_MagicSleep) || (Npc_GetTempAttitude(Roscoe,other) == ATT_FRIENDLY))
	{
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00");	//Jak ses sem dostal? Co se stalo s Roscoem?
		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01");	//Neměl chuť mě zastavit.
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02");	//Co chceš?
		Roscoe.aivar[AIV_PASSGATE] = TRUE;
		Lares_vorbeigemogelt = TRUE;
		B_GiveXP(XP_CheatedIntoLaresHut);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	};
};

instance ORG_801_Lares_WannaJoin(C_Info)
{
	npc = Org_801_Lares;
	nr = 1;
	condition = ORG_801_Lares_WannaJoin_Condition;
	information = ORG_801_Lares_WannaJoin_Info;
	permanent = 0;
	description = "Chci se přidat k tvojí tlupě!";
};

func int ORG_801_Lares_WannaJoin_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_WannaJoin_Info()
{
	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00");	//Chci se přidat k tvojí tlupě!
	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01");	//Cože? Proto ses tady ukázal?
};

var int Lares_BringListBack;

instance ORG_801_Lares_BringList(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringList_Condition;
	information = ORG_801_Lares_BringList_Info;
	permanent = 0;
	description = "Mám s sebou seznam požadavků ze Starého dolu.";
};

func int ORG_801_Lares_BringList_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && Npc_HasItems(hero,TheList))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringList_Info()
{
	AI_Output(other,self,"ORG_801_Lares_BringList_15_00");	//Mám s sebou seznam požadavků ze Starého dolu.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_01");	//Ne! Tomu nevěřím! Musím ale říci, že máš pevné nervy!
	AI_Output(self,other,"ORG_801_Lares_BringList_11_02");	//Ukaž mi to!
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//Tady je...
	B_UseFakeScroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_04");	//Opravdu! Víš, co s tím uděláme? Ještě tam něco připíšeme a pošleme ten seznam zpátky do Starého tábora!
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05");	//Potom, až ty věci přinesou do dolu, přepadneme je a všechno si nacpeme do pytlů! Nebude to trvat ani minutku... Ha! Tady je ten seznam. Víš, co máš dělat.
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem(hero,TheList);
	CreateInvItem(hero,TheListNC);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinNC,"Lares, vůdce banditů, byl velmi překvapen, když uviděl seznam požadavků. Připsal další položky a já jej teď nesu Diegovi.");
	B_GiveXP(XP_GiveListToLares);
};

instance ORG_801_Lares_BringListBack(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringListBack_Condition;
	information = ORG_801_Lares_BringListBack_Info;
	permanent = 0;
	description = "Přinesl jsem Diegovi seznam.";
};

func int ORG_801_Lares_BringListBack_Condition()
{
	if((Lares_BringListBack == LOG_RUNNING) && (Diego_BringList == LOG_SUCCESS))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringListBack_Info()
{
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00");	//Přinesl jsem Diegovi seznam.
	AI_Output(self,other,"ORG_801_Lares_BringListBack_15_01");	//Dobře! Teď jdi za Gornem. Poví ti o přepadení všechno co potřebuješ vědět.
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_02");	//Co s tím má Gorn společného?
	AI_Output(self,other,"ORG_801_Lares_BringListBack_15_03");	//Není dobré když toho budeš vědět příliš mnoho. Jdi za ním a promluv si s ním.
	if(Npc_GetTrueGuild(hero) != GIL_ORG)
	{
		AI_Output(self,other,"ORG_801_Lares_BringListBack_15_04");	//Ach ano, cizince nebereme na přepadení, musíš se k nám nejdřív přidat.
	};
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;
	B_LogEntry(CH1_JoinNC,"Lares byl s odvedenou prací spokojený. Řekl mi, abych si promluvil s Gornem, když se mnou zahájil útok na konvoj. Než se přidám k banditům, nebudu moci na nájezd.");
	B_GiveXP(XP_ReportListDeliveryToLares);
};

instance ORG_801_Lares_MordragSentMe(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_MordragSentMe_Condition;
	information = ORG_801_Lares_MordragSentMe_Info;
	permanent = 0;
	description = "Poslal mě Mordrag. Dal mi pro tebe prsten.";
};

func int ORG_801_Lares_MordragSentMe_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && Npc_HasItems(hero,MordragsRing) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_MordragSentMe_Info()
{
	B_GiveInvItems(other,self,MordragsRing,1);
	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00");	//Poslal mě Mordrag. Dal mi pro tebe prsten.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01");	//Nádherný kousek! To je část zdejšího obvyklého postupu, že díl kořisti připadne vůdci tlupy.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02");	//Ale to, že on dal prsten TOBĚ, svědčí o tom, že má o tobě dobré mínění.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03");	//Chci, abys za ním zašel a něco mu vyřídil.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04");	//Řekni mu, že chci mít někoho v Sektovním táboře. Bratrstvo plánuje něco velkého - a já chci vědět přesně, co to bude.
	Lares_InformMordrag = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinNC,"Lares mě vyslal za Mordragem. Chce, abych mu řekl, že do Sektářského tábora bude vyslán zvěd, aby zjistil, co chystá Bratrstvo.");
	B_GiveXP(XP_GiveRingToLares);
	Points_NC = Points_NC + 10;
};

instance ORG_801_Lares_Vorbeigemogelt(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_Vorbeigemogelt_Condition;
	information = ORG_801_Lares_Vorbeigemogelt_Info;
	permanent = 0;
	description = "Podařilo se mi dostat přes tvoje stráže.";
};

func int ORG_801_Lares_Vorbeigemogelt_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && (Lares_vorbeigemogelt == TRUE))
	{
		return 1;
	};
};

func void ORG_801_Lares_Vorbeigemogelt_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00");	//Podařilo se mi dostat přes tvoje stráže.
	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01");	//To je v pořádku. To ale samo o sobě nestačí.
	Points_NC = Points_NC + 10;
};

var int Lares_Get400Ore;

instance ORG_801_Lares_GetKraut(C_Info)
{
	npc = Org_801_Lares;
	nr = 10;
	condition = ORG_801_Lares_GetKraut_Condition;
	information = ORG_801_Lares_GetKraut_Info;
	permanent = 0;
	description = "Co mám ještě udělat?";
};

func int ORG_801_Lares_GetKraut_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_BringList) || Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_Vorbeigemogelt))
	{
		return 1;
	};
};

func void ORG_801_Lares_GetKraut_Info()
{
	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00");	//Co mám ještě udělat?
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01");	//Baal Isidro ze Sektovního tábora má u sebe drogu v ceně aspoň 400 nugetů. Chci ji od něj mít. Je mi jedno, jak to provedeš.
	if((BaalIsidro_DealerJob == LOG_RUNNING) || (BaalIsidro_DealerJob == LOG_SUCCESS))
	{
		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02");	//Jestli myslíš tu velkou hromadu drogy, tak tu už mám.
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03");	//Vypadá to, že jsi skutečně čiperný!
	};
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04");	//Jestli tu drogu máš, prodej ji. Přines mi 400 nugetů.
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05");	//Pak si znovu promluvíme o tvém přijetí do tlupy.
	Lares_Get400Ore = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinNC,"Mám převzít drogu Baala Isidra a prodat ji za 400 nugetů.Výtěžek dostane Lares.");
};

instance ORG_801_Lares_400Ore(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_400Ore_Condition;
	information = ORG_801_Lares_400Ore_Info;
	permanent = 1;
	description = "Mám těch 400 nugetů.";
};

func int ORG_801_Lares_400Ore_Condition()
{
	if((Lares_Get400Ore == LOG_RUNNING) && ((BaalIsidro_DealerJob == LOG_RUNNING) || (BaalIsidro_DealerJob == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void ORG_801_Lares_400Ore_Info()
{
	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00");	//Mám těch 400 nugetů.
	if(Npc_HasItems(other,ItMiNugget) >= 400)
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01");	//Výborně! Velmi dobře! Myslím, že to by mělo stačit.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		B_GiveInvItems(other,self,ItMiNugget,400);
		B_LogEntry(CH1_JoinNC,"Lares byl zjevně spokojený, když jsem mu předal těch 400 nugetů, které jsem utržil prodejem drogy Baala Isidra.");
		B_GiveXP(XP_BaalIsidroPayLares);
	}
	else
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00");	//Počítej znovu. Doufám, že jsi neutratil polovinu za chlast.
	};
};

instance ORG_801_Lares_Reicht(C_Info)
{
	npc = Org_801_Lares;
	nr = 5;
	condition = ORG_801_Lares_Reicht_Condition;
	information = ORG_801_Lares_Reicht_Info;
	permanent = 1;
	description = "Stačí to, abych se mohl přidat?";
};

func int ORG_801_Lares_Reicht_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && (Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_BringList)) && (Npc_GetTrueGuild(other) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_Reicht_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00");	//Stačí to, abych se mohl přidat?
	if((Points_NC >= 30) && (hero.level >= 5))
	{
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00");	//To bych řekl!
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01");	//A mám pro tebe dárek. Lepší zbroj. Není to moc, ale vydělal sis na ni.
		Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,2,-1);
		Mdl_ApplyOverlayMds(hero,"Humans_Relaxed.mds");
		hero.guild = GIL_ORG;
		Npc_SetTrueGuild(hero,GIL_ORG);
		CreateInvItem(hero,org_armor_l);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		B_GiveXP(XP_BecomeBandit);
		Wld_AssignRoomToGuild("psih22",GIL_NOV);
		Wld_AssignRoomToGuild("hütte26",GIL_VLK);
		GRD_215_Torwache.aivar[AIV_PASSGATE] = FALSE;
		B_LogEntry(CH1_JoinNC,"Lares mě přijal za člena své tlupy. Teď je Nový tábor mým domovem!");
		Log_SetTopicStatus(CH1_JoinNC,LOG_SUCCESS);
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_FAILED);
		B_LogEntry(CH1_JoinOC,"Člen Laresovy tlupy se nemůže přidat ke Starému táboru. To je nemožné.");
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_FAILED);
		B_LogEntry(CH1_JoinPsi,"Bratrstvo se bude muset beze mě obejít, protože jsem nyní doma v Novém táboře.");
	}
	else
	{
		if(Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02");	//Mordrag se za tebe přimluvil.
		};
		if(Npc_KnowsInfo(hero,ORG_801_Lares_BringList))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03");	//Stal jsi se oblíbeným od okamžiku, kdy jsi sem donesl ten seznam.
		};
		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04");	//Nejsi ale ještě připravený. Proveď své úkoly.
		B_PrintGuildCondition(5);
	};
};

instance ORG_801_Lares_GotoKalom(C_Info)
{
	npc = Org_801_Lares;
	nr = 10;
	condition = ORG_801_Lares_GotoKalom_Condition;
	information = ORG_801_Lares_GotoKalom_Info;
	permanent = 0;
	description = "A co se očekává, že mám udělat?";
};

func int ORG_801_Lares_GotoKalom_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		return 1;
	};
};

func void ORG_801_Lares_GotoKalom_Info()
{
	var C_Npc Mordrag;
	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00");	//A co se očekává, že mám udělat?
	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01");	//Jsi teď členem naší tlupy. Můžeš si dělat, co chceš.
	Log_CreateTopic(CH1_GotoPsiCamp,LOG_MISSION);
	Log_SetTopicStatus(CH1_GotoPsiCamp,LOG_RUNNING);
	B_LogEntry(CH1_GotoPsiCamp,"Bratrstvo z tábora v bažinách plánuje něco velkého. Lares, vůdce banditů, chce vědět, co to je.");
	if(Lares_InformMordrag == LOG_RUNNING)
	{
		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02");	//Jestli chceš být užitečný, jdi za Mordragem a pomoz mu s tou akcí se sektáři.
		B_LogEntry(CH1_GotoPsiCamp,"Pomůžu Mordragovi zjistit, o co tam jde.");
	}
	else
	{
		Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
		if(Npc_IsDead(Mordrag))
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03");	//Mordrag, jeden z našich lidí, byl ve Starém táboře zabit. Než zemřel, poslal nám zprávu. Říká, že se v Sektovním táboře chystá něco obrovského.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04");	//Jdi tábora Bratrstva a zjisti, co se tam děje.
			B_LogEntry(CH1_GotoPsiCamp,"Poslal mě přímo do tábora Bratrstva.");
		}
		else
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05");	//Mordrag, jeden z našich lidí, se vrátil zpátky ze Starého tábora.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06");	//Běž za ním. Řekni mu, že chci mít někoho v Sektovním táboře. Bratrstvo plánuje něco velkého - a já chci přesně vědět co.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07");	//Pomoz mu.
			B_LogEntry(CH1_GotoPsiCamp,"Bandita jménem Mordrag má tu věc na starosti a já ho najdu v baru na jezeře Nového tábora.");
			B_ExchangeRoutine(ORG_826_Mordrag,"START");
			Lares_InformMordrag = LOG_RUNNING;
		};
	};
};

instance ORG_801_Lares_WhereLearn(C_Info)
{
	npc = Org_801_Lares;
	nr = 20;
	condition = ORG_801_Lares_WhereLearn_Condition;
	information = ORG_801_Lares_WhereLearn_Info;
	permanent = 0;
	description = "Kde se můžu něco naučit?";
};

func int ORG_801_Lares_WhereLearn_Condition()
{
	return TRUE;
};

func void ORG_801_Lares_WhereLearn_Info()
{
	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01");	//Kde se můžu něco naučit?
	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02");	//U mě. Můžu ti pomoci procvičit tvou obratnost a sílu.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Lares mě může naučit, jak zlepšit svou OBRATNOST a SÍLU.");
};

instance ORG_801_Lares_Teach(C_Info)
{
	npc = Org_801_Lares;
	nr = 20;
	condition = ORG_801_Lares_Teach_Condition;
	information = ORG_801_Lares_Teach_Info;
	permanent = 1;
	description = "Chci se zlepšit.";
};

func int ORG_801_Lares_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WhereLearn))
	{
		return TRUE;
	};
};

func void ORG_801_Lares_Teach_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Chci se zlepšit.
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_BACK()
{
	Info_ClearChoices(ORG_801_Lares_Teach);
};

func void ORG_801_Lares_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

