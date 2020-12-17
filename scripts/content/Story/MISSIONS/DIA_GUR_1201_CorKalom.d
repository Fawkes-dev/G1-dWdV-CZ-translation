instance GUR_1201_CorKalom_FIRST(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_FIRST_Condition;
	information = GUR_1201_CorKalom_FIRST_Info;
	permanent = 1;
	important = 1;
};

func int GUR_1201_CorKalom_FIRST_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Npc_GetTrueGuild(hero) != GIL_NOV) || (Npc_GetTrueGuild(hero) != GIL_GUR) || (Npc_GetTrueGuild(hero) != GIL_TPL)))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_FIRST_Info()
{
	AI_Output(self,other,"GUR_1201_CorKalom_FIRST_10_00");	//Co chceš?
	Kalom_TalkedTo = TRUE;
};

instance GUR_1201_CorKalom_WannaJoin(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_WannaJoin_Condition;
	information = GUR_1201_CorKalom_WannaJoin_Info;
	permanent = 0;
	description = "Chci se přidat k Bratrstvu.";
};

func int GUR_1201_CorKalom_WannaJoin_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_WannaJoin_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_00");	//Chci se přidat k Bratrstvu.
	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_01");	//Slyšel jsem, že jsi vedoucí noviců a že rozhoduješ o tom, kdo se může přidat.
	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_02");	//Nemám čas! Mé experimenty jsou příliš důležité, než abych ztrácel čas s novými novici.
	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_03");	//Budu spoléhat na názor Baalů. Až řeknou, že jsi hoden nosit roucho novice, přijď znovu.
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	B_LogEntry(CH1_JoinPsi,"Cor Kalom mě nechá přidat se k Bratrstvu, pokud se mi podaří přesvědčit čtyři z Baalů, aby se za mě přimluvili.");
};

instance GUR_1201_CorKalom_Recipe(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 20;
	condition = GUR_1201_CorKalom_Recipe_Condition;
	information = GUR_1201_CorKalom_Recipe_Info;
	permanent = 0;
	description = "Jeden z obchodníků ze Starého tábora by chtěl recept na hojivý lektvar.";
};

func int GUR_1201_CorKalom_Recipe_Condition()
{
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_Recipe_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Recipe_15_00");	//Jeden z obchodníků ze Starého tábora by chtěl recept na hojivý lektvar.
	AI_Output(self,other,"GUR_1201_CorKalom_Recipe_10_01");	//Mé recepty nejsou na prodej!
	B_LogEntry(CH1_KalomsRecipe,"Cor Kalom mi nedá ten recept. V jeho dílně jsou však truhlice... a vypadá, že bude mít docela rušno...");
};

instance GUR_1201_CorKalom_Experimente(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 2;
	condition = GUR_1201_CorKalom_Experimente_Condition;
	information = GUR_1201_CorKalom_Experimente_Info;
	permanent = 1;
	description = "Jaký druh experimentů provádíš?";
};

func int GUR_1201_CorKalom_Experimente_Condition()
{
	if(Kapitel <= 2)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_Experimente_Info()
{
	if((Npc_GetTrueGuild(hero) != GIL_GUR) || (Npc_GetTrueGuild(hero) != GIL_TPL))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_Experimente_15_00");	//Jaký druh experimentů provádíš?
		AI_Output(self,other,"GUR_1201_CorKalom_Experimente_10_01");	//Mé výzkumy jsou na takové úrovni, že bys jim sotva porozuměl, chlapče. Tak mě přestaň zdržovat!
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Experimente_10_01");	//Mé výzkumy jsou na takové úrovni, že bys jim sotva porozuměl, chlapče. Tak mě přestaň zdržovat!
		AI_Output(self,other,"GUR_1201_CorKalom_Experimente_10_02");	//Také zkoumám všechny účinky Trávy smíchané s různými přísadami.
	};
};

instance GUR_1201_CorKalom_BRINGWEED(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 2;
	condition = GUR_1201_CorKalom_BRINGWEED_Condition;
	information = GUR_1201_CorKalom_BRINGWEED_Info;
	permanent = 1;
	description = "Nesu denní sklizeň drogy z bažin!";
};

func int GUR_1201_CorKalom_BRINGWEED_Condition()
{
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void GUR_1201_CorKalom_BRINGWEED_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_BRINGWEED_15_00");	//Nesu denní sklizeň drogy z bažin!
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_01");	//A TOMUHLE ty říkáš nějaké množství??? Očekávám CELOU sklizeň, což znamená aspoň 100 lodyh!!!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_02");	//Ach jo, dej mi to. A teď se mi ztrať z očí!
		B_GiveInvItems(hero,self,ItMi_Plants_Swampherb_01,100);
		Npc_RemoveInvItems(self,ItMi_Plants_Swampherb_01,100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry(CH1_DeliverWeed,"Cor Kalom byl jako obvykle nesnesitelný, když jsem mu předával sklizeň drogy z bažin.");
		Log_SetTopicStatus(CH1_DeliverWeed,LOG_SUCCESS);
		B_GiveXP(XP_DeliveredWeedHarvest);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		AI_StopProcessInfos(self);
	};
};

instance GUR_1201_CorKalom_Crawlerzangen(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 800;
	condition = GUR_1201_CorKalom_Crawlerzangen_Condition;
	information = GUR_1201_CorKalom_Crawlerzangen_Info;
	permanent = 1;
	description = "Mám pro tebe čelisti červů...";
};

func int GUR_1201_CorKalom_Crawlerzangen_Condition()
{
	if(Npc_HasItems(other,ItAt_Crawler_01) > 0)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_Crawlerzangen_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Crawlerzangen_15_00");	//Mám pro tebe čelisti červů...
	if(Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01");	//Výborně. Dám ti za ně pár svých nejlepších lektvarů.
		CreateInvItems(self,ItFo_Potion_Mana_03,3);
		B_GiveInvItems(self,hero,ItFo_Potion_Mana_03,3);
	}
	else if(Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_02");	//Dobře. Dám ti za to pár lektvarů.
		CreateInvItems(self,ItFo_Potion_Mana_02,2);
		B_GiveInvItems(self,hero,ItFo_Potion_Mana_02,2);
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_03");	//Hmm. To je všechno? Tady je lektvar many a zmiz.
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		B_GiveInvItems(self,hero,ItFo_Potion_Mana_01,1);
		AI_StopProcessInfos(self);
	};
	B_GiveInvItems(other,self,ItAt_Crawler_01,Npc_HasItems(other,ItAt_Crawler_01));
};

instance GUR_1201_CorKalom_JoinPSI(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_JoinPSI_Condition;
	information = GUR_1201_CorKalom_JoinPSI_Info;
	permanent = 1;
	description = "Myslím, že jsem přesvědčil Baaly!";
};

func int GUR_1201_CorKalom_JoinPSI_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && Npc_KnowsInfo(hero,GUR_1201_CorKalom_WannaJoin))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_JoinPSI_Info()
{
	var int counter;
	counter = 0;
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_00");	//Myslím, že jsem přesvědčil Baaly!
	if(Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_01");	//Baal Orun říká, že jsem uspěl jako dobrý služebník Spáče.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,DIA_BaalCadar_SleepSpell))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_02");	//Pokračuj...
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_03");	//Baal Cadar mě považuje za vnímavého žáka.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,DIA_BaalNamib_FirstTalk))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_04");	//Baal Namib mě považuje za pravověrce.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baallukor_hypnoticteacher))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_16_04");	//Baal Lukor chce, abych byl přijat mezi Spáčovi služebníky.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,DIA_BaalTyon_Vision))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_05");	//Díky mně měl Baal Tyon vidinu.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_SendToKalom))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_06");	//No a?
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_07");	//Baal Tondral říká, že bych měl obdržet roucho. Přivedl jsem mu nového žáka.
		counter = counter + 1;
	};
	if(hero.level >= 5)
	{
		if(counter >= 4)
		{
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_08");	//Dobře. Jestli máš podporu Baalů, tak mi to stačí.
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_09");	//Tady, vem si to. A teď běž a snaž se být užitečný.
			Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
			CreateInvItem(self,nov_armor_l);
			B_GiveInvItems(self,hero,nov_armor_l,1);
			AI_EquipBestArmor(other);
			Npc_SetTrueGuild(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			B_LogEntry(CH1_JoinPsi,"Dnes mě Cor Kalom přijal jako novice. Byl jako obvykle nesnesitelný, ale konečně patřím mezi Bratrstvo Spáče z Tábora v bažinách.");
			B_LogEntry(GE_TraderPSI,"Dostanu od Baala Namiba lepší NOVICKOU ZBROJ.");
			Log_SetTopicStatus(CH1_JoinPsi,LOG_SUCCESS);
			B_GiveXP(XP_BecomeNovice);
			Wld_AssignRoomToGuild("hütte26",GIL_VLK);
			Wld_AssignRoomToGuild("NLHU25",GIL_SLD);
			GUR_1201_CorKalom_FIRST.permanent = 0;
			Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JoinOC,LOG_FAILED);
			B_LogEntry(CH1_JoinOC,"Teď když jsem se rozhodl přidat k Spáčovu Bratrstvu v táboře v bažinách, tak už se nemůžu přidat ke Gomezovým Stínům.");
			Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JoinNC,LOG_FAILED);
			B_LogEntry(CH1_JoinNC,"Nemohu se už přidat k tlupě Nového tábora, protože moje nové místo je teď v Bratrstvu Spáče.");
		}
		else
		{
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00");	//No a?
			AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01");	//To bylo všechno.
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02");	//Okrádáš mě o drahocenný čas! Vrať se, až čtyři z Baalů rozhodnou, že jsi způsobilý.
		};
	}
	else
	{
		B_PrintGuildCondition(5);
	};
};

instance GUR_1201_CorKalom_JoinPSI2(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = GUR_1201_CorKalom_JoinPSI2_Condition;
	information = GUR_1201_CorKalom_JoinPSI2_Info;
	permanent = 0;
	description = "To bylo všechno? Žádné přivítání, nic?";
};

func int GUR_1201_CorKalom_JoinPSI2_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_JoinPSI2_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_10");	//To bylo všechno? Žádné přivítání, nic?
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_11");	//Vítej.
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_12");	//To zní líp.
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_13");	//Nemotej se tady! Dělej něco! Vezmi tuhle drogu a dones ji Gomezovi do Starého tábora.
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_14");	//Když tě jeho posluhovači nebudou chtít pustit, řekni, že tě posílá Cor Kalom.
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_11_15");	//Vem si tento amulet. Když ho budeš mít u sebe, Gomezovi poskoci spoznají, že jsi jeden z nás.
	CreateInvItems(self,ItMiJoint_3,30);
	B_GiveInvItems(self,hero,ItMiJoint_3,30);
	CreateInvItems(self,ItMi_Amulet_Psi_01,1);
	B_GiveInvItems(self,hero,ItMi_Amulet_Psi_01,1);
	Kalom_Krautbote = LOG_RUNNING;
	Log_CreateTopic(CH1_KrautBote,LOG_MISSION);
	Log_SetTopicStatus(CH1_KrautBote,LOG_RUNNING);
	B_LogEntry(CH1_KrautBote,"Cor Kalom mě vyslal s dodávkou drogy z bažin za Gomezem do Starého tábora.");
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_15");	//Cože, ty jsi ještě tady?
	AI_StopProcessInfos(self);
};

instance Info_Kalom_DrugMonopol(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_Kalom_DrugMonopol_Condition;
	information = Info_Kalom_DrugMonopol_Info;
	permanent = 0;
	description = "Máš pro mě ještě jiný úkol?";
};

func int Info_Kalom_DrugMonopol_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NOV)
	{
		return 1;
	};
};

func void Info_Kalom_DrugMonopol_Info()
{
	var C_Npc Renyu;
	var C_Npc Killian;
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//Máš pro mě ještě jiný úkol?
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_01");	//V Novém táboře je malá skupinka lidí, kteří začali vyrábět svoji vlastní drogu z bažin.
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_02");	//Chtějí nám odlákat naše zákazníky, to nedovolíme.
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_03");	//Dohlédni na to, aby tu produkci ukončili.
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_04");	//Jak...
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_05");	//Neobtěžuj mě s podrobnostmi!
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_06");	//Tábor míchačů drogy musí být někde mimo Nový tábor. Víš, co máš dělat.
	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic(CH1_DrugMonopol,LOG_MISSION);
	Log_SetTopicStatus(CH1_DrugMonopol,LOG_RUNNING);
	B_LogEntry(CH1_DrugMonopol,"Cor Kalom chce, abych zastavil konkurenční produkci drogy v Novém táboře. Nevím přesně kde mám hledat, ale snad bych mohl začít PŘED Novým táborem.");
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Killian = Hlp_GetNpc(Org_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};

instance Info_Kalom_Success(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_Kalom_Success_Condition;
	information = Info_Kalom_Success_Info;
	permanent = 1;
	description = "Co se týká produkce drogy v Novém táboře...";
};

func int Info_Kalom_Success_Condition()
{
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Kalom_Success_Info()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	var C_Npc Jacko;
	Killian = Hlp_GetNpc(Org_861_Killian);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Jacko = Hlp_GetNpc(Org_862_Jacko);
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_00");	//Co se týká produkce drogy v Novém táboře...
	AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_01");	//Ano?
	if(Stooges_Fled != TRUE)
	{
		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_02");	//Nemůžu ty muže najít.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_03");	//Nic jiného jsem od tebe neočekával.
	}
	else if((Stooges_Fled == TRUE) || (Npc_IsDead(Jacko) && Npc_IsDead(Renyu) && Npc_IsDead(Killian)))
	{
		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//Jsou pryč.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_05");	//Překvapuješ mě. Podcenil jsem tvoje kvality. Možná bys přece jen mohl být užitečný.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_06");	//Promluv si s Baaly.
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry(CH1_DrugMonopol,"Informoval jsem Cora Kaloma, že konkurenční produkce drogy v Novém táboře je zastavena. Jeho odezva byla 'přátelská' jako vždy.");
		Log_SetTopicStatus(CH1_DrugMonopol,LOG_SUCCESS);
		B_GiveXP(XP_DrugMonopol);
	};
};

instance Info_Kalom_KrautboteBACK(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = Info_Kalom_KrautboteBACK_Condition;
	information = Info_Kalom_KrautboteBACK_Info;
	permanent = 1;
	description = "Doručil jsem tu drogu.";
};

func int Info_Kalom_KrautboteBACK_Condition()
{
	if((Kalom_Krautbote == LOG_RUNNING) && (Kalom_DeliveredWeed == TRUE))
	{
		return TRUE;
	};
};

func void Info_Kalom_KrautboteBACK_Info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00");	//Doručil jsem tu drogu.
	if(Npc_HasItems(hero,ItMiNugget) >= 500)
	{
		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01");	//Dobře. Dostaneš další úkol někde jinde.
		Kalom_Krautbote = LOG_SUCCESS;
		B_LogEntry(CH1_KrautBote,"Cor Kalom přijal peníze za dodávku drogy Rudobaronům.");
		Log_SetTopicStatus(CH1_KrautBote,LOG_SUCCESS);
		B_GiveInvItems(hero,self,ItMiNugget,500);
		B_GiveXP(XP_WeedShipmentReported);
		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02");	//Kde je těch 500 nugetů, chlapče? Zajisti, abych je hodně rychle dostal!
	};
};

instance Info_CorKalom_BringFocus(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringFocus_Condition;
	information = Info_CorKalom_BringFocus_Info;
	permanent = 0;
	important = 0;
	description = "Poslal mě Y´Berion. Mám to ohnisko.";
};

func int Info_CorKalom_BringFocus_Condition()
{
	if((YBerion_BringFocus == LOG_SUCCESS) && Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_CorKalom_BringFocus_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01");	//Poslal mě Y´Berion. Mám to ohnisko.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02");	//Aaahh - to ohnisko... Konečně. Teď můžu studovat kouzlo těchto artefaktů.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03");	//Kdybych jen měl dostatek výměšku... sakra!
	B_LogEntry(CH2_Focus,"Nechal jsem u Cora Kaloma zlověstné ohnisko!");
	Log_SetTopicStatus(CH2_Focus,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_1,1);
	Npc_RemoveInvItem(self,Focus_1);
	B_GiveXP(XP_BringFocusToCorKalom);
};

instance Info_CorKalom_BLUFF(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 10;
	condition = Info_CorKalom_BLUFF_Condition;
	information = Info_CorKalom_BLUFF_Info;
	permanent = 0;
	description = "Y´Berion řekl, že mi máš zaplatit, až ti to ohnisko donesu!";
};

func int Info_CorKalom_BLUFF_Condition()
{
	if(Npc_KnowsInfo(hero,Info_CorKalom_BringFocus) && (CorKalom_BringMCQBalls != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_CorKalom_BLUFF_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01");	//Y´Berion řekl, že mi máš zaplatit, až ti to ohnisko donesu!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02");	//Opravdu? To, že řekl? Dobrá tedy. Předpokládám, že 50 nugetů by mělo stačit!
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
};

instance GUR_1201_CorKalom_SACHE(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_SACHE_Condition;
	information = GUR_1201_CorKalom_SACHE_Info;
	important = 0;
	permanent = 0;
	description = "Výměšek?";
};

func int GUR_1201_CorKalom_SACHE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_CorKalom_BringFocus))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_SACHE_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_Info_15_01");	//Výměšek?
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_02");	//Ano... Jak jistě víš, vyrábím magický lektvar pro vzývání Spáče. Pro tento účel potřebuji výměšek z čelistí důlních červů.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_03");	//Víš přece, co jsou důlní červi, ne?
	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
	Info_AddChoice(GUR_1201_CorKalom_SACHE,"Ne.",GUR_1201_CorKalom_SACHE_NEIN);
	Info_AddChoice(GUR_1201_CorKalom_SACHE,"Ano.",GUR_1201_CorKalom_SACHE_JA);
};

func void GUR_1201_CorKalom_SACHE_NEIN()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//Ne.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_02");	//Jsou to nebezpečné bestie, které se plíží temnými doly a sežerou všechno lidské maso, na které přijdou.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03");	//Jejich čelisti obsahují zvláštní výměšek.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04");	//Používám ho k výrobě lektvaru, který provádí po duchovní cestě ke Spáčovi.
	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
};

func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//Ano.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_JA_10_02");	//Výborně!
	Info_ClearChoices(GUR_1201_CorKalom_SACHE);
};

instance GUR_1201_CorKalom_VISION(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_VISION_Condition;
	information = GUR_1201_CorKalom_VISION_Info;
	important = 0;
	permanent = 0;
	description = "Mluv!";
};

func int GUR_1201_CorKalom_VISION_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_SACHE))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_VISION_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_01");	//Mluv dál!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_02");	//Dobrá, před nedávnem jsem měl sám vidinu Spáče. Dal mi znamení.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_03");	//Sdělil mi, že existuje ještě jiný prostředek, než ten výměšek z čelistí.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_04");	//A vybral mě, abych předal toto poselství. Toto poselství není ode mě. Toto poselství je od Spáče!
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_05");	//To není možné!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_06");	//Ticho, hlupáku!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_07");	//Srozuměl mě, že cesta, na kterou jsem se dal, je ta pravá, ale ten prostředek v lektvaru není dostatečně silný.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_08");	//Správný prostředek můžeme najít v červech, ale čelisti na to nestačí.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_09");	//Musí tu být ještě něco jiného.
};

instance GUR_1201_CorKalom_NEST(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_NEST_Condition;
	information = GUR_1201_CorKalom_NEST_Info;
	important = 0;
	permanent = 0;
	description = "Vy jste důlní červy nikdy nezkoumali?";
};

func int GUR_1201_CorKalom_NEST_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_VISION))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_NEST_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_NEST_Info_15_01");	//Vy jste důlní červy nikdy nezkoumali? Myslím, že ještě nějaká jiná část jejich těla obsahuje více toho výměšku.
	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_02");	//Samozřejmě jsme několik důlních červů pitvali, ale zdá se, že jedině čelisti obsahují ten výměšek.
	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_03");	//Musí tu být ještě něco jiného. Najdi jejich hnízdo a tam najdeš odpověď!
	CorKalom_BringMCQBalls = LOG_RUNNING;
};

func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic(CH2_MCEggs,LOG_MISSION);
	Log_SetTopicStatus(CH2_MCEggs,LOG_RUNNING);
	B_LogEntry(CH2_MCEggs,"Guru Cor Kalom mě požádal, abych nalezl zdroj výměšku důlních červů ve Starém dole. Doposud se používaly čelisti těch oblud a já mám objevit jiný zdroj, který obsahuje silnější výměšek.");
	if(PresseTourJanuar2001)
	{
		CreateInvItems(hero,ItAt_Crawlerqueen,3);
	};
};

instance GUR_1201_CorKalom_WEG(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_WEG_Condition;
	information = GUR_1201_CorKalom_WEG_Info;
	nr = 21;
	important = 0;
	permanent = 0;
	description = "To vypadá na temné a zlověstné pátrání!";
};

func int GUR_1201_CorKalom_WEG_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_NEST) && !Npc_KnowsInfo(hero,GUR_1201_CorKalom_RAT))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_WEG_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_WEG_Info_15_01");	//To vypadá na temné a zlověstné pátrání!
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_02");	//Vezmi si tyhle kouzelné světelné svitky - v temných šachtách ti můžou být velmi užitečné.
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_03");	//Templáři v dolech ti pomůžou.
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_04");	//Ať ti Spáč dodá sílu, ať ti svítí na cestu a osvítí ducha a nechť posílí tvoji mysl!
	CreateInvItems(self,ItArScrollLight,5);
	B_GiveInvItems(self,other,ItArScrollLight,5);
	GUR_1201_CorKalom_WEG_ACCEPT();
};

instance GUR_1201_CorKalom_RAT(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_RAT_Condition;
	information = GUR_1201_CorKalom_RAT_Info;
	nr = 20;
	important = 0;
	permanent = 0;
	description = "Uvědom si, že by to mohlo být docela krvavé dobrodružství!";
};

func int GUR_1201_CorKalom_RAT_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_NEST) && !Npc_KnowsInfo(hero,GUR_1201_CorKalom_WEG))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_RAT_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_RAT_Info_15_01");	//Uvědom si, že by to mohlo být docela krvavé dobrodružství!
	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_02");	//Vezmi si sebou tyhle lektvary.
	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_03");	//Nedávám ti je, protože bych chtěl, abys zůstal naživu, ale protože se tento úkol musí splnit.
	CreateInvItems(self,ItFo_Potion_Health_02,5);
	B_GiveInvItems(self,other,ItFo_Potion_Health_02,5);
	GUR_1201_CorKalom_WEG_ACCEPT();
};

instance GUR_1201_CorKalom_RUN(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_RUN_Condition;
	information = GUR_1201_CorKalom_RUN_Info;
	important = 0;
	permanent = 0;
	description = "Kde najdu důlní červy?";
};

func int GUR_1201_CorKalom_RUN_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_RUNNING) && (Npc_HasItems(hero,ItAt_Crawlerqueen) < 1))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_RUN_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_01");	//Kde najdu důlní červy?
	AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_02");	//Ve Starém dole.
	if(!EnteredOldMine)
	{
		AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_03");	//Kde je Starý důl?
		AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_04");	//Vem si tuhle mapu! Jsou na ní vyznačena všechna důležitá místa uvnitř Bariéry.
		CreateInvItem(self,ItWrWorldmap);
		B_GiveInvItems(self,other,ItWrWorldmap,1);
	};
};

instance GUR_1201_CorKalom_CRAWLER(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_CRAWLER_Condition;
	information = GUR_1201_CorKalom_CRAWLER_Info;
	important = 0;
	permanent = 0;
	description = "Jaký je nejlepší způsob boje s důlními červy?";
};

func int GUR_1201_CorKalom_CRAWLER_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_RUN) && (CorKalom_BringMCQBalls != LOG_SUCCESS))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_CRAWLER_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01");	//Jaký je nejlepší způsob boje s důlními červy?
	AI_Output(self,other,"GUR_1201_CorKalom_CRAWLER_Info_10_02");	//V dole jsou templáři. Loví červy kvůli čelistem. Zeptej se Gora Na Vida. Pomůže ti.
};

instance GUR_1201_CorKalom_FIND(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = GUR_1201_CorKalom_FIND_Condition;
	information = GUR_1201_CorKalom_FIND_Info;
	important = 0;
	permanent = 0;
	description = "Jak najdu v dole hnízdo?";
};

func int GUR_1201_CorKalom_FIND_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1201_CorKalom_CRAWLER))
	{
		return 1;
	};
};

func void GUR_1201_CorKalom_FIND_Info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_01");	//Jak najdu v dole hnízdo?
	AI_Output(self,other,"GUR_1201_CorKalom_FIND_Info_10_02");	//To je nejobtížnější bod tvého poslání. Neřeknu ti, kde je hledat, ani co v nich hledat. Spáč však bude při tobě.
	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_03");	//Dobrá, to je útěcha.
};

instance Info_CorKalom_BringMCQBalls_Success(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringMCQBalls_Success_Condition;
	information = Info_CorKalom_BringMCQBalls_Success_Info;
	permanent = 0;
	description = "Našel jsem vajíčka červí královny.";
};

func int Info_CorKalom_BringMCQBalls_Success_Condition()
{
	if(Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};

func void Info_CorKalom_BringMCQBalls_Success_Info()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01");	//Našel jsem vajíčka červí královny.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02");	//Znám je. Má vidina byla znamení. Královnina vajíčka musí obsahovat ten výměšek.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03");	//Výborně, s tím vytvořím ten lektvar pro spojení se Spáčem.
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04");	//A co má odměna?
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05");	//Správně... Děkuju ti.
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06");	//Myslel jsem HMATATELNOU odměnu.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07");	//Dobře, dobře. Co bys chtěl?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems(hero,self,ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self,ItAt_Crawlerqueen,3);
	B_GiveXP(XP_BringMCEggs);
	B_LogEntry(CH2_MCEggs,"Dal jsem Cor Kalomovi tři vajíčka důlních červů. Tvářil se velmi nepřátelsky a já ho musel požádat o svoji hubenou odměnu.");
	Log_SetTopicStatus(CH2_MCEggs,LOG_SUCCESS);
	B_LogEntry(CH1_GotoPsiCamp,"Myslím, že toho o záměrech sekty vím již dost, a tak o tom můžu podat zprávu Mordragovi. ");
	B_LogEntry(CH1_GoToPsi,"Myslím, že o záležitostech sekty toho už vím dost. Jakmile se vrátím do Starého tábora, měl bych o tom všem říct Ravenovi.");
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Runu.",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Nějakou zbraň.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Hojivý lektvar.",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Rudu.",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_AddChoice(Info_CorKalom_BringMCQBalls_Success,"Manu.",Info_CorKalom_BringMCQBalls_Success_MANA);
};

func void Info_CorKalom_BringMCQBalls_Success_RUNE()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01");	//Runu.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02");	//Ať ti tato runa osvítí cestu!
	CreateInvItem(self,ItArRuneLight);
	B_GiveInvItems(self,hero,ItArRuneLight,1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_WAFFE()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01");	//Nějakou zbraň.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02");	//Kéž tato zbraň zničí tvé nepřátele!
	CreateInvItem(self,ItMw_1H_Mace_War_02);
	B_GiveInvItems(self,hero,ItMw_1H_Mace_War_02,1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01");	//Hojivý lektvar.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02");	//Kéž ti tento lektvar prodlouží život!
	CreateInvItem(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_Perma_01,1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_ORE()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01");	//Ruda.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02");	//Vem si tuhle rudu jako znamení vděčnosti celého Bratrstva!
	CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,hero,ItMiNugget,100);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01");	//Manu.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02");	//Kéž tento lektvar probudí kouzlo, které v tobě dřímá!
	CreateInvItem(self,ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems(self,hero,ItFo_Potion_Mana_Perma_01,1);
	Info_ClearChoices(Info_CorKalom_BringMCQBalls_Success);
};

instance Info_CorKalom_BringBook(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringBook_Condition;
	information = Info_CorKalom_BringBook_Info;
	permanent = 0;
	description = "Můžeme začít vzývat Spáče?";
};

func int Info_CorKalom_BringBook_Condition()
{
	if(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		return 1;
	};
};

func void Info_CorKalom_BringBook_Info()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_01");	//Můžeme začít vzývat Spáče?
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_02");	//Ne! Nenašel jsem ještě způsob, jak používat to ohnisko.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_03");	//Pozbyli jsme prastaré znalosti o těchto artefaktech.
	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_04");	//Chceš říci, že jsem sbíral ta vajíčka nadarmo?
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_05");	//Ne, poslouchej mě. Existuje jeden almanach, ve kterém je vše, co potřebujeme vědět.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_06");	//Koupili jsme tu knihu od mága Corrista ze Starého tábora.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_07");	//Byla však ukradena, když se jí sem pokoušeli ze Starého tábor přinést.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_08");	//Pověřil jsem novice Talase, aby ji pro mě vyzvedl, ale on byl přepaden.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_09");	//Zklamal mě, ale já mu dal ještě jednu šanci. Musí přinést ukradený almanach zpátky.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_10");	//Promluv si s ním. Bude potřebovat každou pomocnou ruku.
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic(CH2_Book,LOG_MISSION);
	Log_SetTopicStatus(CH2_Book,LOG_RUNNING);
	B_LogEntry(CH2_Book,"Cor Kalom potřebuje pro vzývání Spáče poslední předmět. Je to kniha o použití ohniskových kamenů. Novic Talas byl tak neopatrný, že si ten rukopis nechal ukrást gobliny. Nyní hledá v chrámovém dvoře někoho, kdo by mu pomohl získat knihu zpět.");
	Info_ClearChoices(Info_CorKalom_BringBook);
	Info_AddChoice(Info_CorKalom_BringBook,DIALOG_BACK,Info_CorKalom_BringBook_BACK);
	Info_AddChoice(Info_CorKalom_BringBook,"Co za to dostanu?",Info_CorKalom_BringBook_EARN);
	Info_AddChoice(Info_CorKalom_BringBook,"Kdo ukradl ten almanach?",Info_CorKalom_BringBook_WHO);
	Info_AddChoice(Info_CorKalom_BringBook,"Kde najdu Talase?",Info_CorKalom_BringBook_WHERE);
};

func void Info_CorKalom_BringBook_BACK()
{
	Info_ClearChoices(Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Where_15_01");	//Kde najdu Talase?
	AI_Output(self,other,"Info_CorKalom_BringBook_Where_10_02");	//Je na nádvoří u chrámového vršku, kde se snaží získat lidi, aby mu pomohli.
};

func void Info_CorKalom_BringBook_WHO()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Who_15_01");	//Kdo ukradl ten almanach?
	AI_Output(self,other,"Info_CorKalom_BringBook_Who_10_02");	//Talas říkal, že mu ho ukradl černý goblin. Zní to podivně, ale není to nemožné.
};

func void Info_CorKalom_BringBook_EARN()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Earn_15_01");	//Co za to dostanu?
	AI_Output(self,other,"Info_CorKalom_BringBook_Earn_10_02");	//To jsem ti ještě neprokázal dost velkomyslnosti? Dostaneš odměnu.
};

instance Info_CorKalom_BringBook_Success(C_Info)
{
	npc = GUR_1201_CorKalom;
	condition = Info_CorKalom_BringBook_Success_Condition;
	information = Info_CorKalom_BringBook_Success_Info;
	permanent = 0;
	description = "Našel jsem tu knihu.";
};

func int Info_CorKalom_BringBook_Success_Condition()
{
	if(Npc_HasItems(hero,ItWrFokusbuch) && (CorKalom_BringBook == LOG_RUNNING))
	{
		return 1;
	};
};

func void Info_CorKalom_BringBook_Success_Info()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_01");	//Našel jsem tu knihu.
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_02");	//Výborná práce. Máme vše, co potřebujeme.
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_03");	//Teď dokončím přípravy.
	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_04");	//Kdy bude probíhat vzývání?
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_05");	//Přijď v noci na chrámové nádvoří. Budeme se soustředit na vyvolání všemohoucího Spáče.
	B_GiveInvItems(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem(self,ItWrFokusbuch);
	B_GiveXP(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;
	B_LogEntry(CH2_Book,"Předal jsem rukopis Coru Kalomovi, který teď Bratrstvo připravuje na velké vzývání Spáče. To se bude se odehrávat na nádvoří chrámu.");
	Log_SetTopicStatus(CH2_Book,LOG_SUCCESS);
	AI_StopProcessInfos(self);
	B_Story_PrepareRitual();
};

instance Info_CorKalom_Belohnung(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 1;
	condition = Info_CorKalom_Belohnung_Condition;
	information = Info_CorKalom_Belohnung_Info;
	permanent = 0;
	description = "A co moje odměna?";
};

func int Info_CorKalom_Belohnung_Condition()
{
	if(Npc_KnowsInfo(hero,Info_CorKalom_BringBook_Success))
	{
		return 1;
	};
};

func void Info_CorKalom_Belohnung_Info()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_15_00");	//A co moje odměna?
	AI_Output(self,other,"Info_CorKalom_Belohnung_10_01");	//Co bys chtěl?
	Info_ClearChoices(Info_CorKalom_Belohnung);
	Info_AddChoice(Info_CorKalom_Belohnung,"Kouzelný svitek.",Info_CorKalom_Belohnung_SCROLL);
	Info_AddChoice(Info_CorKalom_Belohnung,"Ruda.",Info_CorKalom_Belohnung_ORE);
	Info_AddChoice(Info_CorKalom_Belohnung,"Lektvar many.",Info_CorKalom_Belohnung_MANA);
};

func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_SCROLL_15_00");	//Dej mi tyhle čarovné svitky.
	AI_Output(self,other,"Info_CorKalom_Belohnung_SCROLL_10_01");	//Užívej tyto svitky moudře.
	CreateInvItems(self,ItArScrollSleep,1);
	B_GiveInvItems(self,hero,ItArScrollSleep,1);
	CreateInvItems(self,ItArScrollTelekinesis,1);
	B_GiveInvItems(self,hero,ItArScrollTelekinesis,1);
	CreateInvItems(self,ItArScrollBerzerk,1);
	B_GiveInvItems(self,hero,ItArScrollBerzerk,1);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};

func void Info_CorKalom_Belohnung_ORE()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_ORE_15_00");	//Dej mi rudu.
	AI_Output(self,other,"Info_CorKalom_Belohnung_ORE_10_01");	//To by mělo nasytit tvůj hlad po rudě.
	CreateInvItems(self,ItMiNugget,300);
	B_GiveInvItems(self,hero,ItMiNugget,300);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};

func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_MANA_15_00");	//Lektvar many.
	AI_Output(self,other,"Info_CorKalom_Belohnung_MANA_10_01");	//Kéž ti tento lektvar dá sílu!
	CreateInvItems(self,ItFo_Potion_Mana_02,5);
	B_GiveInvItems(self,hero,ItFo_Potion_Mana_02,5);
	Info_ClearChoices(Info_CorKalom_Belohnung);
};

instance GUR_1201_CorKalom_Exit(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 999;
	condition = GUR_1201_CorKalom_Exit_Condition;
	information = GUR_1201_CorKalom_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int GUR_1201_CorKalom_Exit_Condition()
{
	return 1;
};

func void GUR_1201_CorKalom_Exit_Info()
{
	if(Npc_GetTrueGuild(other) == GIL_GUR)
	{
		AI_Output(other,self,"DIA_BaalTyon_NoTalk_Sleeper_15_00");	//Spáč buď s tebou!
		AI_Output(self,other,"GUR_1201_CorKalom_Exit_10_02");	//Kéž tě Spáč osvítí.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"GUR_1201_CorKalom_Exit_15_01");	//Ještě se uvidíme.
		AI_Output(self,other,"GUR_1201_CorKalom_Exit_10_02");	//Kéž tě Spáč osvítí.
		AI_StopProcessInfos(self);
	};
};

instance GUR_1201_CORKALOM_TATTOOS(C_Info)
{
	npc = GUR_1201_CorKalom;
	nr = 2;
	condition = gur_1201_corkalom_tattoos_condition;
	information = gur_1201_corkalom_tattoos_info;
	permanent = 0;
	important = 1;
};

func int gur_1201_corkalom_tattoos_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void gur_1201_corkalom_tattoos_info()
{
	AI_Output(self,other,"GUR_1201_CorKalom_Tattoos_10_01");	//Předtím než zapomenu, Baal Namib na tebe čeká v bažině.
	AI_Output(other,self,"GUR_1201_CorKalom_Tattoos_10_02");	//Co chce?
	AI_Output(self,other,"GUR_1201_CorKalom_Tattoos_10_03");	//Řekne ti to sám. Jdi chlapče, ztrácíš můj drahocenný čas!
	NAMIB_RITUAL = LOG_RUNNING;
	Log_CreateTopic(CH1_RITUAL,LOG_MISSION);
	Log_SetTopicStatus(CH1_RITUAL,LOG_RUNNING);
	B_LogEntry(CH1_RITUAL,"Cor Kalom zmínil, že na mě v bažinách čeká Baal Namib. Jako vždy neměl zájem se mnou moc mluvit, a nevím proč se mnou chce Baal Namib mluvit.");
	AI_Teleport(GUR_1204_BaalNamib,"WP_PSI_RITUAL_SWAMP_02");
	Npc_ExchangeRoutine(GUR_1204_BaalNamib,"TATTOORITUAL");
	AI_ContinueRoutine(GUR_1204_BaalNamib);
	AI_Teleport(tpl_5051_templer,"WP_PSI_RITUAL_SWAMP_01");
	Npc_ExchangeRoutine(tpl_5051_templer,"TATTOORITUAL");
	AI_ContinueRoutine(tpl_5051_templer);
	AI_Teleport(tpl_5052_templer,"WP_PSI_RITUAL_SWAMP_03");
	Npc_ExchangeRoutine(tpl_5052_templer,"TATTOORITUAL");
	AI_ContinueRoutine(tpl_5052_templer);
	AI_StopProcessInfos(self);
};

