instance Org_818_Ratford_Exit(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 999;
	condition = Org_818_Ratford_Exit_Condition;
	information = Org_818_Ratford_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Org_818_Ratford_Exit_Condition()
{
	return 1;
};

func void Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Org_818_Ratford_WrongWay(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WrongWay_Condition;
	information = Org_818_Ratford_WrongWay_Info;
	permanent = 0;
	important = 1;
};

func int Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

func void Org_818_Ratford_WrongWay_Info()
{
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00");	//Hej, ty!
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01");	//Co chceš?
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//Chci tě varovat. Jestli půjdeš dál touhle cestou, vstoupíš na naši loveckou půdu.
	Npc_ExchangeRoutine(self,"HUNT");
};

instance Org_818_Ratford_WhatGame(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhatGame_Condition;
	information = Org_818_Ratford_WhatGame_Info;
	permanent = 0;
	description = "Co tady lovíte?";
};

func int Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhatGame_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00");	//Co tady lovíte?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//Většinou mrchožrouty. Je z nich spousta masa. Kromě toho, není tak těžké je dostat... Když víš, jak na to.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//Opravdu? A jak?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//Zeptej se tady mého přítele Draxe - ví o tom víc než kdokoliv jiný.
};

instance Org_818_Ratford_WhyDangerous(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhyDangerous_Condition;
	information = Org_818_Ratford_WhyDangerous_Info;
	permanent = 0;
	description = "Proč je ta oblast tak nebezpečná?";
};

func int Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00");	//Proč je ta oblast tak nebezpečná?
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//Právě jsi sem přišel, viď? V kolonii jsou různé oblasti, které jsou více nebo méně nebezpečné.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//Cesty mezi tábory jsou docela bezpečné. Ale i na nich ti můžou zkřížit cestu nějací vlci, kteří na tebe budou hledět jako na snadnou kořist.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//A to právě do té doby, dokud nebudeš mít pořádnou zbraň a zbroj.
};

instance Org_818_Ratford_WoEquipment(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoEquipment_Condition;
	information = Org_818_Ratford_WoEquipment_Info;
	permanent = 0;
	description = "Kde dostanu lepší výbavu?";
};

func int Org_818_Ratford_WoEquipment_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoEquipment_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//Kde dostanu lepší vybavení?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//Nejblíže to bude ve Starém táboře. Přímo tahle cesta tě tam dovede.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//Ale v našem táboře to dostaneš levněji. Nový tábor - tam potkáš ty správné lidi.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//Jestli půjdeš do Starého tábora, ptej se po Mordragovi. Je jedním z nás. Za trochu rudy ti prodá to správné zboží.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Bandita Mordrag prodává ve Starém táboře za přijatelné ceny veškeré zboží.");
};

instance Org_818_Ratford_MoreLocations(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_MoreLocations_Condition;
	information = Org_818_Ratford_MoreLocations_Info;
	permanent = 0;
	description = "Pověz mi víc o oblastech v kolonii.";
};

func int Org_818_Ratford_MoreLocations_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_MoreLocations_Info()
{
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00");	//Pověz mi víc o oblastech v kolonii.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//Když cestuješ mezi tábory, musíš mít mapu, abys rozpoznal cesty a slepé stezky.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//Slepé stezky tě často dovedou do nebezpečných kaňonů, kde potkáš příšery, kterým je lepší se vyhnout.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//Nevcházej do starých zřícenin. Je jich tu v okolí spousta. Většina z nich se datuje do časů první skřetí války. Některé jsou opuštěná skřetí sídla.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//V těchto zříceninách bývají často skřeti - nebo ještě horší příšery. Těmhle místům bych se vyhýbal, obzvlášť v noci.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//A ještě jedna rada - nechoď do lesa!
};

instance Org_818_Ratford_WoKarte(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoKarte_Condition;
	information = Org_818_Ratford_WoKarte_Info;
	permanent = 0;
	description = "Kde dostanu mapu?";
};

func int Org_818_Ratford_WoKarte_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoKarte_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//Kde dostanu mapu?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//Zeptej se lidí ve Starém táboře, žije tam jeden kartograf.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//Možná se ti podaří nějakou z jeho map ukrást! Jestli se ti to podaří, vezmi také jednu pro mě!
	RATFORD_MAP = LOG_RUNNING;
	Log_CreateTopic(CH1_RATFORDMAP,LOG_MISSION);
	Log_SetTopicStatus(CH1_RATFORDMAP,LOG_RUNNING);
	B_LogEntry(CH1_RATFORDMAP,"Ratford, jeden z banditů z Nového tábora, mi dal za úkol získat mapu ze Starého tábora. Měl by tam žít kartograf jménem Graham.");
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Jestli se mi je podaří vzít bez placení, vezmu jich tolik, kolik unesu!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Proč? On neprodává mapy?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	var C_Npc Lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//Jestli se mi je podaří vzít bez placení, vezmu jich tolik, kolik unesu!
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//Líbíš se mi. Měl by ses rozhodnout pro Nový tábor! Jestli tam půjdeš, ptej se na Larese. Stará se o nové příchozí. Myslím, že pro tebe bude mít práci!
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//Proč? On neprodává mapy?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//Jestli máš dost rudy, abys je zaplatil...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

instance Org_818_Ratford_Thanks(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 888;
	condition = Org_818_Ratford_Thanks_Condition;
	information = Org_818_Ratford_Thanks_Info;
	permanent = 0;
	description = "Díky za pomoc.";
};

func int Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

func void Org_818_Ratford_Thanks_Info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//Díky za pomoc.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//Nemysli si, že se bude každý chovat tak přátelsky, mladej!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//Nový příchozí ani nemusí mít zrovna narvané kapsy, ale někteří tě zabijou třeba jenom pro krumpáč.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//Budu si to pamatovat.
};

instance DIA_RATFORD_NOWORG(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = dia_ratford_noworg_condition;
	information = dia_ratford_noworg_info;
	permanent = 0;
	important = 1;
};

func int dia_ratford_noworg_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void dia_ratford_noworg_info()
{
	AI_Output(self,other,"DIA_Ratford_NowORG_09_00");	//Takže tě Lares přidal do tlupy. Výborně, chlape.
};

instance DIA_RATFORD_MAP(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = dia_ratford_map_condition;
	information = dia_ratford_map_info;
	permanent = 0;
	important = 0;
	description = "Mám pro tebe mapu.";
};

func int dia_ratford_map_condition()
{
	if(((Npc_HasItems(other,ItWrWorldmap) > 0) && (RATFORD_MAP == LOG_RUNNING)) || ((Npc_HasItems(other,itwrworldmap_mission) > 0) && (RATFORD_MAP == LOG_RUNNING)))
	{
		return TRUE;
	};
};

func void dia_ratford_map_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Ratford_Map_09_00");	//Mám pro tebe mapu.
	AI_Output(self,other,"DIA_Ratford_Map_09_01");	//Velmi dobře. A? Jak jsi ji získal?

	//BUG [Fawkes]: Ak ma hrac obidve mapy - itwrworldmap_mission + ItWrWorldmap tak kvoli poradiu podmienok sa quest 'vyfailuje'
	/*
	if(Npc_HasItems(other,ItWrWorldmap) > 0)
	{
		B_GiveInvItems(other,self,ItWrWorldmap,1);
		AI_Output(other,self,"DIA_Ratford_MapBuy_09_00");	//Koupil jsem ji od Grahama.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ratford_MapBuy_09_01");	//Opravdu? Myslel jsem, že máš koule na svém místě.
		AI_Output(self,other,"DIA_Ratford_MapBuy_09_02");	//Dobře, tady je něco málo za námahu.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		RATFORD_MAP = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_RATFORDMAP,LOG_SUCCESS);
		B_LogEntry(CH1_RATFORDMAP,"Přinesl jsem Ratfordovi mapu Kolonie. Nebyl nadšený, že jsem ji od Grahama koupil, místo abych ji ukradl.");
		B_GiveXP(XP_RATFORDMAP);
	}
	else if(Npc_HasItems(other,itwrworldmap_mission) > 0)
	{
		AI_Output(other,self,"DIA_Ratford_MapStolen_09_00");	//Ukradl jsem ji z Grahamovy truhly.
		B_GiveInvItems(other,self,itwrworldmap_mission,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_01");	//To není špatné, chlape. Hehe.
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_02");	//Pro někoho jako ty by jsme v Novém táboře hned našli využití.
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_03");	//Tady vem si tohle, bude se ti to určitě hodit.
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItems(self,ItAt_Lurker_02,2);
			B_GiveInvItems(self,other,ItAt_Lurker_02,2);
		}
		else if(zufallsbelohnung >= 60)
		{
			CreateInvItems(self,ItFo_Potion_Dex_01,1);
			B_GiveInvItems(self,other,ItFo_Potion_Dex_01,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
			B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,3);
		}
		else if(zufallsbelohnung >= 40)
		{
			CreateInvItems(self,ItAt_Crawler_01,2);
			B_GiveInvItems(self,other,ItAt_Crawler_01,2);
		}
		else if(zufallsbelohnung >= 30)
		{
			CreateInvItems(self,ItFoMutton,3);
			B_GiveInvItems(self,other,ItFoMutton,3);
		}
		else if(zufallsbelohnung >= 20)
		{
			CreateInvItems(self,ItRw_Bow_Small_04,1);
			B_GiveInvItems(self,other,ItRw_Bow_Small_04,1);
		}
		else
		//BUG [Fawkes]: ak padne hodnota zufallsbelohnung medzi 0 - 10 tak hrac nedostane ziadnu odmenu
		//if(zufallsbelohnung >= 10)
		{
			CreateInvItems(self,ItMw_1H_Mace_01,1);
			B_GiveInvItems(self,other,ItMw_1H_Mace_01,1);
		};
		RATFORD_MAP = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_RATFORDMAP,LOG_SUCCESS);
		B_LogEntry(CH1_RATFORDMAP,"Přinesl jsem Ratfordovi mapu Kolonie. Byl ohromený, že se mi ji podařilo od Grahama ukrást. Říkal, že bych dobře zapadl do Nového tábora.");
		B_GiveXP(XP_RATFORDMAP);
	};
	*/

	if(Npc_HasItems(other,itwrworldmap_mission) > 0)
	{
		AI_Output(other,self,"DIA_Ratford_MapStolen_09_00");	//Ukradl jsem ji z Grahamovy truhly.
		B_GiveInvItems(other,self,itwrworldmap_mission,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_01");	//To není špatné, chlape. Hehe.
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_02");	//Pro někoho jako ty by jsme v Novém táboře hned našli využití.
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_03");	//Tady vem si tohle, bude se ti to určitě hodit.
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItems(self,ItAt_Lurker_02,2);
			B_GiveInvItems(self,other,ItAt_Lurker_02,2);
		}
		else if(zufallsbelohnung >= 60)
		{
			CreateInvItems(self,ItFo_Potion_Dex_01,1);
			B_GiveInvItems(self,other,ItFo_Potion_Dex_01,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
			B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,3);
		}
		else if(zufallsbelohnung >= 40)
		{
			CreateInvItems(self,ItAt_Crawler_01,2);
			B_GiveInvItems(self,other,ItAt_Crawler_01,2);
		}
		else if(zufallsbelohnung >= 30)
		{
			CreateInvItems(self,ItFoMutton,3);
			B_GiveInvItems(self,other,ItFoMutton,3);
		}
		else if(zufallsbelohnung >= 20)
		{
			CreateInvItems(self,ItRw_Bow_Small_04,1);
			B_GiveInvItems(self,other,ItRw_Bow_Small_04,1);
		}
		else
		//BUG [Fawkes]: ak padne hodnota zufallsbelohnung medzi 0 - 10 tak hrac nedostane ziadnu odmenu
		//if(zufallsbelohnung >= 10)
		{
			CreateInvItems(self,ItMw_1H_Mace_01,1);
			B_GiveInvItems(self,other,ItMw_1H_Mace_01,1);
		};
		RATFORD_MAP = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_RATFORDMAP,LOG_SUCCESS);
		B_LogEntry(CH1_RATFORDMAP,"Přinesl jsem Ratfordovi mapu Kolonie. Byl ohromený, že se mi ji podařilo od Grahama ukrást. Říkal, že bych dobře zapadl do Nového tábora.");
		B_GiveXP(XP_RATFORDMAP);
	} else
	if(Npc_HasItems(other,ItWrWorldmap) > 0)
	{
		B_GiveInvItems(other,self,ItWrWorldmap,1);
		AI_Output(other,self,"DIA_Ratford_MapBuy_09_00");	//Koupil jsem ji od Grahama.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ratford_MapBuy_09_01");	//Opravdu? Myslel jsem, že máš koule na svém místě.
		AI_Output(self,other,"DIA_Ratford_MapBuy_09_02");	//Dobře, tady je něco málo za námahu.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		RATFORD_MAP = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_RATFORDMAP,LOG_SUCCESS);
		B_LogEntry(CH1_RATFORDMAP,"Přinesl jsem Ratfordovi mapu Kolonie. Nebyl nadšený, že jsem ji od Grahama koupil, místo abych ji ukradl.");
		B_GiveXP(XP_RATFORDMAP);
	};
};

