instance DIA_Raven_Exit(C_Info)
{
	npc = EBR_105_Raven;
	nr = 999;
	condition = DIA_Raven_Exit_Condition;
	information = DIA_Raven_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Raven_Exit_Condition()
{
	return 1;
};

func void DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Raven_FirstIn(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_FirstIn_Condition;
	information = DIA_Raven_FirstIn_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Raven_FirstIn_Condition()
{
	var C_Npc wache218;
	wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if(wache218.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void DIA_Raven_FirstIn_Info()
{
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00");	//Co pro tebe můžu udělat?
};

instance DIA_Raven_Who(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Who_Condition;
	information = DIA_Raven_Who_Info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int DIA_Raven_Who_Condition()
{
	return 1;
};

func void DIA_Raven_Who_Info()
{
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Raven_Who_10_01");	//Jsem Raven. Gomezova pravá ruka. Každý, kdo chce navštívit Gomeze, to musí říci nejdřív MNĚ.
};

instance DIA_Raven_Krautbote(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Krautbote_Condition;
	information = DIA_Raven_Krautbote_Info;
	permanent = 0;
	description = "Mám pro Gomeze trochu drogy z bažin od Cora Kaloma.";
};

func int DIA_Raven_Krautbote_Condition()
{
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Krautbote_Info()
{
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00");	//Mám pro Gomeze trochu drogy z bažin od Cora Kaloma.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01");	//Tyhle věci domlouvá Bartholo. Gomez se s poslíčky nebaví.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02");	//Najdeš ho v místnosti hned vpravo za vchodem. Nebo v kuchyni ve velké věži.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03");	//V noci samozřejmě spí. Být tebou, tak bych ho nevyrušoval.
	B_LogEntry(CH1_KrautBote,"Dodávka drogy pro Gomeze se musí odevzdat u Barthola. Najdu ho v domě Rudobaronů.");
};

instance DIA_Raven_Aufnahme(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Aufnahme_Condition;
	information = DIA_Raven_Aufnahme_Info;
	permanent = 0;
	description = "Chci vidět Gomeze. Thorus říká, že patřím ke Stínům.";
};

func int DIA_Raven_Aufnahme_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Raven_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00");	//Chci vidět Gomeze. Thorus říká, že patřím ke Stínům.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01");	//Vždycky rozpoznáme poctivé muže. Vypadáš, že takový jseš. Jsi v pohodě.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02");	//Zavedu tě ke Gomezovi. A na nic nesahej!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};

instance DIA_Raven_There(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_There_Condition;
	information = DIA_Raven_There_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Raven_There_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT"))
	{
		return 1;
	};
};

func void DIA_Raven_There_Info()
{
	AI_Output(self,other,"DIA_Raven_There_10_01");	//Gomez tě očekává. Jestli k němu se k němu nebudeš chovat uctivě, bude mi potěšením tě to naučit, je ti to jasné?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Raven_PERM(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_PERM_Condition;
	information = DIA_Raven_PERM_Info;
	permanent = 1;
	description = "Jak jde obchod s rudou?";
};

func int DIA_Raven_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

func void DIA_Raven_PERM_Info()
{
	AI_Output(other,self,"DIA_Raven_PERM_15_00");	//Jak jde obchod s rudou?
	AI_Output(self,other,"DIA_Raven_PERM_10_01");	//Ve Starém dolu to jde dobře. Poslední dodávka zásob z vnějšího světa byla obrovská.
};

instance DIA_Raven_BinDabei(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_BinDabei_Condition;
	information = DIA_Raven_BinDabei_Info;
	permanent = 0;
	description = "Gomez říká, že jsem v pořádku.";
};

func int DIA_Raven_BinDabei_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

func void DIA_Raven_BinDabei_Info()
{
	CreateInvItem(hero,stt_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00");	//Gomez říká, že jsem v pořádku.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01");	//Výborně! V tom případě to můžeš dokázat svým prvním úkolem.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02");	//Když říkáš, že jsou tvé kontakty tak dobré, nemělo by to pro tebe být těžké.
	AI_EquipBestArmor(hero);
};

var int Raven_SpySect;

instance DIA_Raven_SpySect(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpySect_Condition;
	information = DIA_Raven_SpySect_Info;
	permanent = 0;
	description = "Co mám pro tebe udělat?";
};

func int DIA_Raven_SpySect_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

func void DIA_Raven_SpySect_Info()
{
	AI_Output(other,self,"DIA_Raven_SpySect_15_00");	//Co mám pro tebe udělat?
	AI_Output(self,other,"DIA_Raven_SpySect_10_01");	//Děláme hodně obchodů s Bratrstvem. To ale neznamená, že jsme s nimi ve svazku.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02");	//Jdi do močálů.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03");	//Až dorazíš do tábora, měj uši nastražené. Vše, co se dozvíš, se nám může hodit.
	AI_Output(self,other,"DIA_Raven_SpySect_10_04");	//Čím víc toho zjistíš, tím líp. Měl bys být opatrný, jestli chápeš, co tím myslím.
	AI_Output(other,self,"DIA_Raven_SpySect_15_05");	//Buď v klidu, nemám v úmyslu je naštvat.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06");	//Věděl jsem, že mi budeš rozumět.
	Raven_SpySect = LOG_RUNNING;
	Log_CreateTopic(CH1_GoToPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_GoToPsi,LOG_RUNNING);
	B_LogEntry(CH1_GoToPsi,"Raven mě vyslal jako zástupce Starého tábora k Bratrstvu do bažin. Musím se tam porozhlédnout a mít nastražené uši. Možná se mi tu podaří získat nějaké užitečné informace pro Rudobarony.");
};

instance DIA_Raven_Equipment(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Equipment_Condition;
	information = DIA_Raven_Equipment_Info;
	permanent = 0;
	description = "Kde dostanu lepší výbavu?";
};

func int DIA_Raven_Equipment_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Equipment_Info()
{
	AI_Output(other,self,"DIA_Raven_Equipment_15_00");	//Kde dostanu lepší výbavu?
	AI_Output(self,other,"DIA_Raven_Equipment_10_01");	//Jdi za Diegem, dá ti nějakou výzbroj. S ní nebudeš tak rychle mrtvý a zároveň ti poslouží jako průkaz.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02");	//Tvoje výzbroj ti umožní přístup do všech míst, kam se budeš potřebovat dostat.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03");	//Jestli budeš potřebovat jakékoliv zbraně, zajdi za Skipem. Najdeš ho v té velké dílně přímo vzadu, nalevo od hradního nádvoří.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Diego má lepší ZBROJ pro Gomezovy Stíny. Je u hradní brány.");
	if(!Npc_KnowsInfo(hero,DIA_Skip_First))
	{
		B_LogEntry(GE_TraderOC,"Strážce Skip prodává v zadní části nádvoří ZBRANĚ. Avšak jen Gomezovým mužům.");
	};
};

instance DIA_Raven_SpyBericht(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpyBericht_Condition;
	information = DIA_Raven_SpyBericht_Info;
	permanent = 1;
	description = "Chci ti podat hlášení.";
};

func int DIA_Raven_SpyBericht_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_SpyBericht_Info()
{
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00");	//Chci podat hlášení.
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01");	//Dobře. Rád dostávám ty nejnovější informace.
	if((Npc_HasItems(other,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS))
	{
		if(Kapitel >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//Nadešlo velké vzývání.
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Dobrá práce.
			Raven_SpySect = LOG_SUCCESS;
			B_GiveXP(XP_ReportToRaven);
			Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
			B_LogEntry(CH1_GoToPsi,"Raven mě nakrmil lacinými řečičkami. Takovéhle způsoby jsem neočekával. Od teďka si půjdu svojí vlastní cestou.");
		}
		else
		{
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02");	//Chtějí vajíčka královny důlních červů. Vaří z nich lektvar, kterým jim umožní spojit se se Spáčem. Mám ta vajíčka sebou.
			if(CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_03");	//Zajímavé. Jsem zvědavý, jestli to bude fungovat. Dones ta vajíčka do chrámu.
			}
			else
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Dobrá práce.
				Raven_SpySect = LOG_SUCCESS;
				B_GiveXP(XP_ReportToRaven);
				Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
				B_LogEntry(CH1_GoToPsi,"Raven mě nakrmil lacinými řečičkami. Takovéhle způsoby jsem neočekával. Od teďka si půjdu svojí vlastní cestou.");
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05");	//Vlastně ve skutečnosti nevím, co plánují.
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06");	//Tak proč mě obtěžuješ?
	};
};

var int ore_baron;

instance DIA_RAVEN_OREBARON(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = dia_raven_orebaron_condition;
	information = dia_raven_orebaron_info;
	permanent = 0;
	important = 1;
};

func int dia_raven_orebaron_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_GRD) && (hero.level >= 20) && (Kapitel == 3) && (FLETCHER_SCHULDEN == LOG_SUCCESS) && (Fisk_GetNewHehler == LOG_SUCCESS) && (LOST_DIGGER == LOG_SUCCESS) && (MESSAGEKDF == LOG_SUCCESS) && (SCAR_QUEST == LOG_SUCCESS) && (PAUL_OC == LOG_SUCCESS) && (CONVOY_OC == LOG_SUCCESS) && (Thorus_MordragKo == LOG_SUCCESS) && (CARLOS_THINGS == LOG_SUCCESS) && (MAGIC_ARTEFACTS == LOG_SUCCESS) && (HUNO_LOSTSWORD == LOG_SUCCESS) && (ORRY_MESSAGE == LOG_SUCCESS) && (BRANDICK_BEER == LOG_SUCCESS) && (OMID_RECEPT == LOG_SUCCESS) && (MordragKO_StayAtNC != TRUE))
	{
		return 1;
	};
};

func void dia_raven_orebaron_info()
{
	AI_Output(self,other,"DIA_Raven_OreBaron_15_00");	//Hej ty!
	AI_Output(other,self,"DIA_Raven_OreBaron_10_01");	//Co se děje?
	AI_Output(self,other,"DIA_Raven_OreBaron_10_02");	//Docela dost jsem toho o tobě slyšel. Máš mezi našimi lidmi dobrou pověst a prokázal jsi nám velikou službu.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_03");	//Sledoval jsem jak si v táboře vedeš a jak rosteš.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_04");	//Přišel jsi do Kolonie jako nikdo.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_05");	//A propracoval jsi se až na vrchol rychleji, než kdokoli jiný.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_06");	//Po chvíli v Kolonii si se přidal k nám jako Stín. A už tehdy jsi ukázal, že nejsi jako většina našich lidí v táboře.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_07");	//Osvobodils nás od té havěti ve Starém dole. Zničil jsi hnízdo důlních červů a ještě k tomu úplně sám.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_08");	//Jako strážce jsi poskytl cenné služby a působivě splnil mnoho úkolů. Nikdo z našich Strážců nedokázal tolik jako ty.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_09");	//Tím si působivě prokázal svou loajalitu Starému táboru.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_11");	//Spolu se zbytkem Rudobaronů jsme se poradili a rozhodli.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_12");	//Jsme připravení nabídnout ti místo v našich řadách.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_13");	//Místo v Gomezově osobní stráži, místo Rudobarona Starého tábora.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_14");	//Kdokoli, kdo obětuje svůj život Gomezovi a táboru, tak jako si to udělal ty, si zaslouží nazývat se Rudobaronem!
	AI_Output(self,other,"DIA_Raven_OreBaron_10_15");	//Dávám ti možnost. Buďto se můžeš přidat k nám, k mocnářům, anebo můžeš tuhle šanci nechat tak a zůstat mezi Strážemi.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_16");	//Jak se tedy rozhodneš? Jsi připravený zaujmout místo v Gomezově osobní stráži a říkat si Rudobaron?
	ORE_BARON = LOG_RUNNING;
	Log_CreateTopic(GE_BECOMEOREBARON,LOG_MISSION);
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_RUNNING);
	B_LogEntry(GE_BECOMEOREBARON,"Raven, rudobaron ze Starého tábora mi řekl, že sledoval mé činy od přijetí do tábora. Věří, že mám na to přidat se k velikánům tábora. Nabídnul mi šanci připojit se ke Gomezově osobní stráži,");
	Info_ClearChoices(dia_raven_orebaron);
	Info_AddChoice(dia_raven_orebaron,"Počítej se mnou.",dia_raven_orebaron_yes);
	Info_AddChoice(dia_raven_orebaron,"Ne, nejsem nato připraven.",dia_raven_orebaron_no);
};

func void dia_raven_orebaron_yes()
{
	AI_Output(other,self,"DIA_Raven_OreBaron_YES_10_16");	//Počítej se mnou.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_17");	//Tak tě tedy vítám v Gomezově osobní stráži.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_18");	//Odteď už nemusíš plnit úkoly, teď jsi to ty, kdo úkoly rozdáva.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_19");	//Odteď patříš mezi Rudobarony.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_20");	//Odteď si nedotknutelný.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_22");	//Dobře, že jsi se k nám přidal.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_23");	//Teď jdi a věnuj se svému novému poslání.
	Info_ClearChoices(dia_raven_orebaron);
	ORE_BARON = LOG_SUCCESS;
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_SUCCESS);
	B_LogEntry(GE_BECOMEOREBARON,"Přijal jsem Ravenovu nabídku a nyní se mohu považovat za jednoho z RUDOBARONŮ! Dosáhl jsem nejvyšší možnou hodnost v táboře.");
	B_GiveXP(XP_OREBARON);
	CreateInvItem(hero,ebr_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	AI_EquipBestArmor(hero);
	Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,1,-1);
	Mdl_ApplyOverlayMds(hero,"Humans_Arrogance.mds");
	Npc_SetTrueGuild(hero,GIL_EBR);
	hero.guild = GIL_EBR;
};

func void dia_raven_orebaron_no()
{
	AI_Output(other,self,"DIA_Raven_OreBaron_NO_15_00");	//Ne, nejsem nato ještě připravený.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_01");	//COŽE?! Nabídnu ti takovou možnost, a ty ji odmítneš?
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_02");	//Jsem zklamán, opravdu zklamán.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_03");	//Teď jdi, propásnul si svou šanci přidat se k velkým hráčům.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_04");	//Už NIKDY takovou šanci nedostaneš ...
	Info_ClearChoices(dia_raven_orebaron);
	ORE_BARON = LOG_FAILED;
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_FAILED);
	B_LogEntry(GE_BECOMEOREBARON,"Raven byl zklamaný, když jsem jeho nabídku odmítl. Řekl mi, že už nikdy nedostanu takovou šanci. Myslím, že bych mezi Rudobarony stejně nezapadl.");
};

