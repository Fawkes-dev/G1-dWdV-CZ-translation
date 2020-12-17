instance Info_Saturas_EXIT(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 999;
	condition = Info_Saturas_EXIT_Condition;
	information = Info_Saturas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Saturas_EXIT_Condition()
{
	return 1;
};

func void Info_Saturas_EXIT_Info()
{
	AI_Output(self,other,"Info_Saturas_EXIT_14_01");	//Kéž by ses vrátil celý!
	AI_StopProcessInfos(self);
};

instance Info_Saturas_Intruder(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 1;
	condition = Info_Saturas_Intruder_Condition;
	information = Info_Saturas_Intruder_Info;
	permanent = 1;
	important = 1;
};

func int Info_Saturas_Intruder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Info_Saturas_Intruder_Info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//Co tady děláš? Tady nemáš co pohledávat! Zmiz!
	AI_StopProcessInfos(self);
};

instance Info_Saturas_NEWS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_NEWS_Condition;
	information = Info_Saturas_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "Mám důležité zprávy z tábora Bratrstva!";
};

func int Info_Saturas_NEWS_Condition()
{
	if((CorAngar_SendToNC == TRUE) && Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	};
};

func void Info_Saturas_NEWS_Info()
{
	AI_Output(other,self,"Info_Saturas_NEWS_15_01");	//Mám důležité zprávy z tábora Bratrstva!
	AI_Output(self,other,"Info_Saturas_NEWS_14_02");	//Musí být opravdu důležitá zpráva, jestliže ti Cronos povolil mě navštívit!
};

instance Info_Saturas_YBERION(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_YBERION_Condition;
	information = Info_Saturas_YBERION_Info;
	permanent = 0;
	important = 0;
	description = "Y´Berion je mrtev!";
};

func int Info_Saturas_YBERION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_NEWS))
	{
		return TRUE;
	};
};

func void Info_Saturas_YBERION_Info()
{
	AI_Output(other,self,"Info_Saturas_YBERION_15_01");	//Y´Berion je mrtev! Zemřel během rituálního vzývání Spáče.
	AI_Output(self,other,"Info_Saturas_YBERION_14_02");	//Y´Berion je mrtev´? To je špatná zpráva, vskutku špatná!
	AI_Output(self,other,"Info_Saturas_YBERION_14_03");	//Kdo teď vede Bratrstvo? Ten mocichtivý a zabedněný Cor Kalom?
	AI_Output(other,self,"Info_Saturas_YBERION_15_04");	//Ne! Kalom se od Bratrstva odvrátil. Vzal sebou pár templářů. Nikdo neví, kam odešli.
	AI_Output(self,other,"Info_Saturas_YBERION_14_05");	//Proč to všechno? Byl na druhém místě za Y´Berionem!
	AI_Output(other,self,"Info_Saturas_YBERION_15_06");	//Jisté události přesvědčily Guru, že jsou na špatné cestě. Z jejich boha se vyklubal zlý arcidémon.
	AI_Output(other,self,"Info_Saturas_YBERION_15_07");	//Jeden z Guru mě pod vlivem Spáče málem zabil, přestože jsem mu krátce předtím zachránil život.
	AI_Output(other,self,"Info_Saturas_YBERION_15_08");	//Cor Kalom je jediný Guru, který nechce uznat pravou podstatu té pekelné stvůry, a proto opustil tábor v bažinách.
	AI_Output(self,other,"Info_Saturas_YBERION_14_09");	//Aha! Dobře, aspoň v tomto směru máme štěstí. Cor Angar je dobrý muž. Je drsný, ale přesto poctivý.
	AI_Output(self,other,"Info_Saturas_YBERION_14_10");	//Jestliže někdo může Bratrstvo ochránit od úpadku po té duchovní katastrofě, pak je to právě on.
	B_LogEntry(CH3_EscapePlanNC,"Řekl jsem Saturasovi o incidentech v táboře v bažinách. Byl rád, že Cor Angar převzal v Bratrstvu velení.");
};

instance Info_Saturas_BOOK(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BOOK_Condition;
	information = Info_Saturas_BOOK_Info;
	permanent = 0;
	important = 0;
	description = "Mám tento almanach...";
};

func int Info_Saturas_BOOK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_YBERION) && Npc_HasItems(hero,ItWrFokusbuch))
	{
		return TRUE;
	};
};

func void Info_Saturas_BOOK_Info()
{
	AI_Output(other,self,"Info_Saturas_BOOK_15_01");	//Mám tento almanach...
	AI_Output(other,self,"Info_Saturas_BOOK_15_02");	//Y´Berion ho používal k práci s tím ohniskem.
	AI_Output(self,other,"Info_Saturas_BOOK_14_03");	//Velmi dobře. Potřebujeme vědomosti uložené v té knize, abysme uměli zacházet s pěti původními ohniskovými kameny.
	AI_Output(self,other,"Info_Saturas_BOOK_14_04");	//Vezmu si ten almanach!
	B_GiveInvItems(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem(self,ItWrFokusbuch);
	B_GiveXP(XP_DeliverBookToSaturas);
};

instance Info_Saturas_FOCUS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_FOCUS_Condition;
	information = Info_Saturas_FOCUS_Info;
	permanent = 0;
	important = 0;
	description = "Mám toto ohnisko...";
};

func int Info_Saturas_FOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_YBERION) && Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_Saturas_FOCUS_Info()
{
	AI_Output(other,self,"Info_Saturas_FOCUS_15_01");	//Mám toto ohnisko...
	AI_Output(self,other,"Info_Saturas_FOCUS_14_02");	//Držíš klíč, který uvolní všechna pouta.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_03");	//To je jeden z těch kamenů, které byly použity k vytvoření magické Bariéry.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_04");	//A pomocí ohniskové síly těchto kamenů strhneme tu obrovskou energetickou stěnu.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_05");	//Nespotřebuje to ale obrovské množství síly?
	AI_Output(self,other,"Info_Saturas_FOCUS_14_06");	//To jistě, ale po celé ty roky jsme neúnavně shromažďovali rudu, namísto toho, abychom ji vyměňovali za luxusní zboží s našimi vězniteli.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_07");	//Jak jistě víš, každý nuget obsahuje určité množství magické síly. S pomocí energie, která je nahromaděná v rudné haldě, budeme schopni zničit magickou Bariéru.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_08");	//Vypadá to nebezpečně.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_09");	//Exploze bude spíše magické povahy a zničí pouze to, co bylo pomocí kouzel upraveno uvnitř Bariéry. Lidským bytostem nehrozí žádné nebezpečí.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_10");	//Tady je to ohnisko. Doufejme, že vám doopravdy pomůže ve vašich plánech s rudnou hromadou.
	B_GiveInvItems(hero,self,Focus_1,1);
	Npc_RemoveInvItem(self,Focus_1);
	B_GiveXP(XP_DeliverFocusToSaturas);
};

instance Info_Saturas_WHATNOW(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_WHATNOW_Condition;
	information = Info_Saturas_WHATNOW_Info;
	permanent = 0;
	important = 0;
	description = "Co teď budeš dělat s tím ohniskem a almanachem?";
};

func int Info_Saturas_WHATNOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_FOCUS) && Npc_KnowsInfo(hero,Info_Saturas_BOOK))
	{
		return TRUE;
	};
};

func void Info_Saturas_WHATNOW_Info()
{
	AI_Output(other,self,"Info_Saturas_WHATNOW_15_01");	//Co teď budeš dělat s tím ohniskem a almanachem?
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_03");	//Nic. Nejprve potřebujeme zbývající čtyři ohniskové kameny!
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_04");	//Bohužel ale nemáme ani jeden z těch čtyř magických kamenů.
};

instance Info_Saturas_OFFER(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_OFFER_Condition;
	information = Info_Saturas_OFFER_Info;
	permanent = 0;
	important = 0;
	description = "Jsem ochoten pro vás ty zbývající čtyři ohniskové kameny najít!";
};

func int Info_Saturas_OFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_WHATNOW))
	{
		return TRUE;
	};
};

func void Info_Saturas_OFFER_Info()
{
	AI_Output(other,self,"Info_Saturas_OFFER_15_01");	//Jsem ochoten pro vás ty zbývající čtyři ohniskové kameny najít!
	AI_Output(other,self,"Info_Saturas_OFFER_15_02");	//Především mám sám docela zájem se odtud dostat.
	AI_Output(self,other,"Info_Saturas_OFFER_14_03");	//Musím tě varovat. Jejich hledání bude stejně obtížné, jako nebezpečné.
	AI_Output(self,other,"Info_Saturas_OFFER_14_04");	//Protože se konflikt se Starým táborem den ze dne horší, nemůžu ti sebou dát žádné žoldáky.
	AI_Output(self,other,"Info_Saturas_OFFER_14_05");	//Budeš si muset vystačit úplně sám.
	AI_Output(other,self,"Info_Saturas_OFFER_15_06");	//Dobrá... To pro mě není nic nezvyklého! Najdu způsob, jak ty věci zařídit.
	AI_Output(self,other,"Info_Saturas_OFFER_14_07");	//Tvá víra je ti ke cti, budeš ale potřebovat pár věcí, které ti pomůžou!
	AI_Output(self,other,"Info_Saturas_OFFER_14_08");	//Vezmi si tuhle mapu. Je stará, ale jsou na ní vyznačeny všechny původní pozice ohniskových kamenů z doby, kdy se vytvářela Bariéra.
	AI_Output(self,other,"Info_Saturas_OFFER_14_09");	//Tyhle kouzelné svitky ti umožní rychlejší návrat do tábora.
	AI_Output(self,other,"Info_Saturas_OFFER_14_10");	//A konečně si budeš také muset promluvit s Riordianem. Vaří pro tábor lektvary.
	AI_Output(self,other,"Info_Saturas_OFFER_14_11");	//Najdeš ho v jeho chatrči, tady v horní vrstvě.
	B_Story_BringFoci();
};

func void B_DeliverFocus()
{
	if(Saturas_BringFoci == 1)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_01");	//Hm, tak to je začátek. Děláš to dobře.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_02");	//K uskutečnění našeho plánu ještě chybí tři ohniskové kameny.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_03");	//Teď jdi a porozhlédni se po zbývajících ohniskových kamenech.
		Saturas_BringFoci = 2;
		B_GiveXP(XP_DeliverSecondFocus);
	}
	else if(Saturas_BringFoci == 2)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_04");	//Výborně, to je druhý ohniskový kámen, který jsi nám donesl.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_05");	//Blížíme se krok po kroku k našemu cíli.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_06");	//Seber odvahu a přines ty dva zbývající ohniskové kameny.
		Saturas_BringFoci = 3;
		B_GiveXP(XP_DeliverThirdFocus);
	}
	else if(Saturas_BringFoci == 3)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_07");	//Neuvěřitelné, už mám pohromadě čtyři ohniskové kameny.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_08");	//Už nám chybí jen jediný, pak je budeme mít všechny.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_09");	//Udělal jsi pro naší komunitu opět obrovskou službu. Najdi nám poslední ohniskový kámen a brzy budeme všichni volní.
		Saturas_BringFoci = 4;
		B_GiveXP(XP_DeliverFourthFocus);
	}
	else if(Saturas_BringFoci == 4)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_10");	//Výborně, teď máme všech pět ohniskových kamenů.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_11");	//Tvé činy jsou pro náš tábor nedocenitelné. Máš mou věčnou úctu.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_12");	//Jdi teď k Riordianovi. Dá ti odměnu za tvé nesmírné úsilí.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_13");	//Řekni si také Cronosovi, strážci rudy. Dá ti od naší komunity další dar.
		Saturas_BringFoci = 5;
		B_GiveXP(XP_DeliverFifthFocus);
		B_LogEntry(CH3_BringFoci,"Podařilo se mi najít všechny čtyři ohniskové kameny. Doufám, že mi to v Novém táboře zajistí uznání.");
		B_LogEntry(CH3_BringFoci,"Mágové Vody, Cronos a Riordian, mi slíbili za ohniskové kameny odměnu. Měl bych se po nich jít podívat.");
		Log_SetTopicStatus(CH3_MonasteryRuin,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_Stonehenge,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_Fortress,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_TrollCanyon,LOG_SUCCESS);
	};
	if(!Npc_HasItems(hero,ItArScrollTeleport2) && (Saturas_BringFoci < 5))
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_14");	//Vidím, že už jsi vyčerpal teleportační svitek. Tady máš nový.
		CreateInvItem(self,ItArScrollTeleport2);
		B_GiveInvItems(self,other,ItArScrollTeleport2,1);
	};
};

instance Info_Saturas_BRINGFOCUS2(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS2_Condition;
	information = Info_Saturas_BRINGFOCUS2_Info;
	permanent = 0;
	important = 0;
	description = "Našel jsem ohnisko v Kaňonu trolů!";
};

func int Info_Saturas_BRINGFOCUS2_Condition()
{
	if(Npc_HasItems(hero,Focus_2) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS2_15_01");	//Našel jsem ohnisko v Trolím kaňonu!
	B_LogEntry(CH3_TrollCanyon,"Ohnisko z Trolího kaňonu je teď v bezpečí u Saturase.");
	Log_SetTopicStatus(CH3_TrollCanyon,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_2,1);
	Npc_RemoveInvItem(self,Focus_2);
	B_DeliverFocus();
};

instance Info_Saturas_BRINGFOCUS3(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS3_Condition;
	information = Info_Saturas_BRINGFOCUS3_Info;
	permanent = 0;
	important = 0;
	description = "Našel jsem ohnisko v horské pevnosti!";
};

func int Info_Saturas_BRINGFOCUS3_Condition()
{
	if(Npc_HasItems(hero,Focus_3) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS3_15_01");	//Našel jsem ohnisko v horské pevnosti!
	B_LogEntry(CH3_Fortress,"Saturas ode mě dostal ohnisko z horské pevnosti.");
	Log_SetTopicStatus(CH3_Fortress,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_3,1);
	Npc_RemoveInvItem(hero,Focus_3);
	B_DeliverFocus();
};

instance Info_Saturas_BRINGFOCUS4(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS4_Condition;
	information = Info_Saturas_BRINGFOCUS4_Info;
	permanent = 0;
	important = 0;
	description = "Našel jsem ohnisko ve zbořeném klášteře!";
};

func int Info_Saturas_BRINGFOCUS4_Condition()
{
	if(Npc_HasItems(hero,Focus_4) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_01");	//Našel jsem ohnisko ve zbořeném klášteře!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_02");	//Byl tam žoldák Gorn a pomohl mi s hledáním.
	B_LogEntry(CH3_MonasteryRuin,"Konečně jsem mohl Saturasovi dát ohnisko ze zbořeného kláštera.");
	Log_SetTopicStatus(CH3_MonasteryRuin,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_4,1);
	Npc_RemoveInvItem(hero,Focus_4);
	B_DeliverFocus();
};

instance Info_Saturas_BRINGFOCUS5(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS5_Condition;
	information = Info_Saturas_BRINGFOCUS5_Info;
	permanent = 0;
	important = 0;
	description = "Našel jsem ohnisko pod kamenným kruhem!";
};

func int Info_Saturas_BRINGFOCUS5_Condition()
{
	if(Npc_HasItems(hero,Focus_5) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS5_15_01");	//Našel jsem ohnisko pod kamenným kruhem!
	B_LogEntry(CH3_Stonehenge,"Dal jsem Saturasovi ohnisko z krypty pod kamenným kruhem.");
	Log_SetTopicStatus(CH3_Stonehenge,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_5,1);
	Npc_RemoveInvItem(hero,Focus_5);
	B_DeliverFocus();
};

instance Info_Saturas_ALLFOCI(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_ALLFOCI_Condition;
	information = Info_Saturas_ALLFOCI_Info;
	permanent = 0;
	important = 0;
	description = "Můžeš už tu rudnou haldu odpálit?";
};

func int Info_Saturas_ALLFOCI_Condition()
{
	if((Saturas_BringFoci == 5) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void Info_Saturas_ALLFOCI_Info()
{
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_01");	//Můžeš už tu rudnou haldu odpálit?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_02");	//Teď už máme všechny artefakty, které potřebujeme k provedení našeho plánu.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_03");	//Bariéru ale vytvořilo dvanáct mágů.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_04");	//V Kruhu vody není dost mágů, kteří by řídili silovou energii a vedli ji správným směrem.
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_05");	//Co můžeme udělat?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_06");	//Oceňuji, že jsi toho pro naši komunitu už tolik udělal, jsme ti nesmírně zavázaní...
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_07");	//...ale v zájmu všech obyvatel kolonie tě musím požádat ještě o jednu službu.
};

instance Info_Saturas_FAVOR(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_FAVOR_Condition;
	information = Info_Saturas_FAVOR_Info;
	permanent = 0;
	important = 0;
	description = "Ještě jednu službu?";
};

func int Info_Saturas_FAVOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};
};

func void Info_Saturas_FAVOR_Info()
{
	AI_Output(other,self,"Info_Saturas_FAVOR_15_01");	//Ještě jednu službu?
	AI_Output(self,other,"Info_Saturas_FAVOR_14_02");	//Ano. Jdi do Starého tábora a pokus se získat nějaké mágy Kruhu ohně pro naši věc.
	AI_Output(other,self,"Info_Saturas_FAVOR_15_03");	//MÁGY OHNĚ??? Proč by se měli vzdát svého pohodlného života?
	AI_Output(other,self,"Info_Saturas_FAVOR_15_04");	//Zničení Bariéry ukončí jejich mocenské postavení!
	AI_Output(self,other,"Info_Saturas_FAVOR_14_05");	//To je ten důvod, proč se musíš o tento úkol pokusit PRÁVĚ TY. Znáš lidi ze všech táborů kolonie.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_06");	//Připomeň mágům Ohně staré časy, kdy jsme společně studovali umění magie.
};

instance Info_Saturas_ACCEPT(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_ACCEPT_Condition;
	information = Info_Saturas_ACCEPT_Info;
	permanent = 0;
	important = 0;
	description = "Dobrá tedy, pokusím se přesvědčit mágy Ohně!";
};

func int Info_Saturas_ACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};
};

func void Info_Saturas_ACCEPT_Info()
{
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_01");	//Dobrá tedy, pokusím se přesvědčit mágy Ohně!
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_02");	//Nemůžu ale slíbit nic! Zdá se mi to bezmála nemožné!
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_03");	//Musíš to zkusit. Když se ti to nepodaří, pak už zbude jen jeden...
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_04");	//Právě jeden...
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_05");	//... jeden CO?
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_06");	//Zapomeň na to! MUSÍ se ti to povést!
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_07");	//Tady je kouzelná runa. Dej ji Corristovi, Velkému mágovi Kruhu ohně jako důkaz naší důvěry.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_08");	//S ní se může kdykoliv teleportovat do této místnosti, aniž by se setkal se strážemi.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_09");	//Doufám, že to naše staré přátele přesvědčí o našem dobrém záměru.
	B_Kapitelwechsel(4);
};

instance Info_Saturas_AMBUSH(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_AMBUSH_Condition;
	information = Info_Saturas_AMBUSH_Info;
	permanent = 0;
	important = 1;
};

func int Info_Saturas_AMBUSH_Condition()
{
	if(FMTaken && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Saturas_AMBUSH_Info()
{
	var C_Npc gorn;
	gorn = Hlp_GetNpc(PC_Fighter);
	AI_TurnToNPC(gorn,hero);
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_01");	//Jsem rád, že ses vrátil. Stalo se něco špatného!
	AI_Output(hero,self,"Info_Saturas_AMBUSH_15_02");	//Nech mě hádat, Svobodný důl byl napaden strážemi Starého tábora. Nikdo je neviděl přicházet...?
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_03");	//Pokračuj... jak... ale samozřejmě... Ty víš o tom, co se stalo ve Starém táboře!
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_04");	//Chvilku před tebou přišel Gorn.
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_05");	//Co přimělo Gomeze, že si troufl k tak agresivnímu činu?
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_06");	//Musí mu být jasné, že takový hanebný čin jenom vyprovokuje válku.
};

instance Info_Saturas_COLLAPSE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_COLLAPSE_Condition;
	information = Info_Saturas_COLLAPSE_Info;
	permanent = 0;
	important = 0;
	description = "Starý důl se zhroutil potom, co ho zatopila voda!";
};

func int Info_Saturas_COLLAPSE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return TRUE;
	};
};

func void Info_Saturas_COLLAPSE_Info()
{
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01");	//Starý důl se zhroutil potom, co ho zatopila voda!
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_02");	//...Zhroutil... jistě... pak celá ta věc dává smysl.
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_03");	//Gomez stojí zády ke zdi. Je nebezpečnější než kdy jindy. Nemá už co ztratit, je schopný čehokoliv!
};

instance Info_Saturas_MURDER(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_MURDER_Condition;
	information = Info_Saturas_MURDER_Info;
	permanent = 0;
	important = 0;
	description = "Gomez zabil všechny mágy Ohně!";
};

func int Info_Saturas_MURDER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return TRUE;
	};
};

func void Info_Saturas_MURDER_Info()
{
	AI_Output(hero,self,"Info_Saturas_MURDER_15_01");	//Gomez zabil všechny mágy Ohně!
	AI_Output(self,hero,"Info_Saturas_MURDER_14_02");	//ZABIL JE??? Jak mohl, při jménu Beliarovu, tohle udělat?
	AI_Output(hero,self,"Info_Saturas_MURDER_15_03");	//Postavili se proti útoku na Svobodný důl a protivili se Gomezovi.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_04");	//Pak jsme všichni ztraceni. Bez ostatních šesti mágů nebudeme nikdy schopni usměrnit sílu masivu rudné haldy.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_05");	//Ale přesto ti děkuju za to, že jsi mi tu hroznou zprávu sdělil.
	B_GiveXP(XP_ReportToSaturas);
	B_LogEntry(CH4_Firemages,"Saturas neměl příliš radost, když jsem mu pověděl o incidentech ve Starém táboře. To, co se přihodilo znamená, že svůj plán na únik... budou muset provést BEZ mágů Ohně.");
	Log_SetTopicStatus(CH4_Firemages,LOG_SUCCESS);
};

instance KDW_600_Saturas_NOMOREOC(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_NOMOREOC_Condition;
	information = KDW_600_Saturas_NOMOREOC_Info;
	important = 0;
	permanent = 0;
	description = "Byl jsem vyhoštěn ze Starého tábora, protože jsem vám pomáhal!";
};

func int KDW_600_Saturas_NOMOREOC_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_MURDER) && ((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_NOMOREOC_Info_15_01");	//Byl jsem vyhoštěn ze Starého tábora, protože jsem vám pomáhal!
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_02");	//Už teda nepatříš ke Starému táboru?
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//Pak vítej do naší komunity!
	Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
	B_LogEntry(CH4_BannedFromOC,"Když jsem byl vykázán ze Starého tábora, Saturas mě přivítal v Novém táboře.");
};

instance KDW_600_Saturas_GOTOLEE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_GOTOLEE_Condition;
	information = KDW_600_Saturas_GOTOLEE_Info;
	important = 0;
	permanent = 0;
	description = "Znamená to, že mě přijmou žoldáci?";
};

func int KDW_600_Saturas_GOTOLEE_Condition()
{
	if((oldHeroGuild == GIL_GRD) && Npc_KnowsInfo(hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_GOTOLEE_Info_15_01");	//Znamená to, že mě přijmou žoldáci?
	AI_Output(self,other,"KDW_600_Saturas_GOTOLEE_Info_14_02");	//Řekni Leeovi, dohlédne na to. Pak se ke mně vrať.
	B_LogEntry(CH4_BannedFromOC,"Lee, velitel žoldáků, se mnou chce mluvit. Mám se k němu dostavit a pak se vrátit k Saturasovi.");
};

instance KDW_600_Saturas_OATH(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_OATH_Condition;
	information = KDW_600_Saturas_OATH_Info;
	important = 0;
	permanent = 0;
	description = "Znamená to, že teď patřím do spolku mágů Vody?";
};

func int KDW_600_Saturas_OATH_Condition()
{
	if((oldHeroGuild == GIL_KDF) && Npc_KnowsInfo(hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_OATH_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//Znamená to, že teď patřím do spolku mágů Vody?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//Ještě ne. Nejdříve musíš složit přísahu Vody.
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_03");	//Já už jsem ale složil přísahu Ohně!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_04");	//Hmmm...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_05");	//To neznamená, že tím svůj slib porušíš!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_06");	//Uch... Nerozumím...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_07");	//Rozšíříš svoji přísahu. Tak se staneš mágem obou živlů!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_08");	//Pak budeš mít sílu Ohně, zrovna tak jako moudrost Vody!
	B_LogEntry(CH4_BannedFromOC,"Saturas mě nechá přidat se ke Kruhu vody, aniž bych musel zrušit přísahu Ohni.");
};

instance KDW_600_Saturas_KDWAUFNAHME(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_KDWAUFNAHME_Condition;
	information = KDW_600_Saturas_KDWAUFNAHME_Info;
	important = 0;
	permanent = 0;
	description = "Jsem připraven složit přísahu.";
};

func int KDW_600_Saturas_KDWAUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KDWAUFNAHME_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//Jsem připraven složit přísahu.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02");	//Služebníku Ohně, teď dostaneš požehnání Vody!
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//Nyní prones slova přísahy:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//Přísahám při boží moci...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//Přísahám při boží moci...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//...a na sílu svaté Vody...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//...a na sílu svaté Vody...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//...že mé vědění a skutky budu od tohoto okamžiku a provždy v jednotě s Vodou...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//...že mé vědění a skutky budu od tohoto okamžiku a provždy v jednotě s Vodou...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//...dokud mé tělo nebude navráceno říši Beliarově a voda mého života nevyschne.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//...dokud mé tělo nebude navráceno říši Beliarově a voda mého života nevyschne.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12");	//Touto přísahou jsi v sobě sjednotil sílu Ohně a požehnání Vody.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13");	//Máš nyní ve svazku to, co dříve bylo rozděleno. Kéž jde tvůj život ve znamení jednoty těchto živlů.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//Oblékni si toto roucho na znamení svazku se svatou Vodou a Adanosem.
	CreateInvItem(self,kdw_armor_l);
	B_GiveInvItems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	B_LogEntry(CH4_BannedFromOC,"Teď jsem spojencem Kruhu vody. Nyní mám přístup k oběma školám magie.");
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

instance KDW_600_Saturas_LESSON(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_LESSON_Condition;
	information = KDW_600_Saturas_LESSON_Info;
	important = 0;
	permanent = 0;
	description = "Můžeš mě cvičit?";
};

func int KDW_600_Saturas_LESSON_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_LESSON_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_LESSON_Info_15_01");	//Můžeš mě učit?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 3)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_02");	//Je toho hodně, co se musíš naučit. Budu tě cvičit, až na to budeš připraven.
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_03");	//Existuje ještě jeden Kruh, který neznáš. Budu tě o něm učit, jakmile budeš na to připraven.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_04");	//Už jsi zvládl Pátý kouzelný kruh! Víš už to, co já.
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_05");	//Už tě víc učit nedokážu!
	};
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Saturas, představený mágů Vody, mě požádal o poslední laskavost. K odpálení rudné haldy potřebuje pomoc mágů Ohně ze Starého tábora. Nevím sice, jak přesvědčím Gomezovy mágy, aby se účastnili plánu, který je připraví o jejich moc, ale něco už vymyslím.");
};

instance KDW_600_Saturas_KREIS1(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS1_Condition;
	information = KDW_600_Saturas_KREIS1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0);
};

func int KDW_600_Saturas_KREIS1_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS1_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS1_Info_15_01");	//Jsem připraven vstoupit do Pátého kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_02");	//Vstoupit do prvního z kouzelných kruhů znamená naučit se používat kouzelné runy.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_03");	//Každá runa obsahuje strukturu zvláštního kouzelného zaříkávadla.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_04");	//Spolu se svými vlastními kouzelnými silami budeš schopen využívat kouzlo run.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_05");	//Ale narozdíl od kouzelných svitků, které jsou také kouzelnými formulemi, magická síla run zajišťuje, že struktura zaříkávadla přetrvává.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_06");	//Každá runa je zdrojem magické síly, kterou můžeš kdykoliv zase zrušit.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_07");	//Svoji vlastní kouzelnou moc využiješ tehdy, když použiješ runu, podobně jako je tomu s kouzelným svitkem.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_08");	//Se vstupem do každého dalšího Kruhu se naučíš využívat také další kouzelné runy.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_09");	//Využij moc run k poznání sebe sama.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};

instance KDW_600_Saturas_KREIS2(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS2_Condition;
	information = KDW_600_Saturas_KREIS2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0);
};

func int KDW_600_Saturas_KREIS2_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS2_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS2_Info_15_01");	//Jsem připraven vstoupit do Druhého kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_02");	//Naučil ses rozumět kouzelným znakům. Nadešel čas prohloubit toto porozumění.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_03");	//Jakmile se přidáš ke Druhému kruhu, naučíš se základům mocnějších bojových zaříkávadel a všem tajům ranhojičství.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_04");	//Budeš se ale muset naučit ještě víc, jestli chceš poznat opravdová tajemství magie.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_05");	//Víš, že každou runu můžeš používat jak často chceš, dokud nevyčerpáš své vlastní síly.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_06");	//Než budeš jednat, rozmysli si cíl svého jednání. Nabyl jsi síly, která tě snadno může dovést k záhubě a zničení.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_07");	//Opravdový mág ale užívá kouzla jen tehdy, když je to nezbytné.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_08");	//Pokud porozumíš situaci, pak poznáš moc run.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};
};

instance KDW_600_Saturas_KREIS3(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS3_Condition;
	information = KDW_600_Saturas_KREIS3_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0);
};

func int KDW_600_Saturas_KREIS3_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS3_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS3_Info_15_01");	//Můžeš mě připravit do Třetího kruhu?
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_02");	//Třetí kouzelný kruh je jedním z nejdůležitějších kroků v životě mága. Jakmile ho dosáhneš, přestáváš být hledačem.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_03");	//Došel jsi už po cestě magie opravdu daleko. Naučil ses používat kouzelné runy.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_04");	//Tato znalost je východisko pro tvojí další cestu. Používej tyto runy s uvážením.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_05");	//Runy můžeš nebo nemusíš používat. Ale musíš se rozhodnout pro jednu z těchto možností.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_06");	//Jakmile se rozhodneš, neostýchej se využít svých sil.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_07");	//Jakmile porozumíš své cestě, pak poznáš sílu rozhodnutí.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};
};

instance KDW_600_Saturas_KREIS4(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS4_Condition;
	information = KDW_600_Saturas_KREIS4_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0);
};

func int KDW_600_Saturas_KREIS4_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS4_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS4_Info_15_01");	//Jsem připraven vstoupit do Pátého kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_02");	//Dokončil jsi první tři Kruhy. Nyní nadešel čas naučit se tajemství magie.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_03");	//Kouzlo run je založeno na kamenech. Existují kouzelné kameny, vytvořené z kouzelné rudy.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_04");	//Z té samé rudy, která se těží tady v dolech. Tato ruda je obdařena magickými formulemi templářů. Tyto runy jsou upraveny jako nástroje naší moci.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_05");	//S těmito runami, které už ovládáš, máš celé vědění chrámové sféry v malíčku.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_07");	//Jakmile porozumíš magii, objevíš tajemství moci.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};

instance KDW_600_Saturas_KREIS5(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS5_Condition;
	information = KDW_600_Saturas_KREIS5_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_5,LPCOST_TALENT_MAGE_5,0);
};

func int KDW_600_Saturas_KREIS5_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS5_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS5_Info_15_01");	//Jsem připraven vstoupit do Pátého kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_02");	//Správně. Budu tě učit o síle Pátého kruhu.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_03");	//Bouře Ohně a Vody a Síla, která ničí nemrtvé, jsou kouzla, která můžeš těmito runami vyvolávat.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_04");	//Nejmocnější zaříkávadlo Pátého kruhu je ale Smrtelné vlnění. Pokud vlastníš jeho runu, pak máš nebezpečnou moc.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_05");	//Tento druh kouzla ale používej co nejméně. Je to dar boha temnot.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06");	//Teď znáš všechno, co jsem tě mohl naučit.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_06");	//Poznej své možnosti, pak budeš znát svoji opravdovou moc.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};

instance KDW_600_Saturas_HEAVYARMOR(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_HEAVYARMOR_Condition;
	information = KDW_600_Saturas_HEAVYARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H);
};

func int KDW_600_Saturas_HEAVYARMOR_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01");	//Chtěl bych nosit vznešené roucho Vody.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 4) && (Kapitel < 5))
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02");	//Ještě nenadešel čas, abys nosil vznešené roucho.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03");	//S tímhle množstvím rudy nezaplatíš ani výrobní náklady.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04");	//Nadešel tvůj čas. Jsi hoden nosit vznešené roucho Vody.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_KDW_ARMOR_H);
		CreateInvItem(hero,kdw_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
	};
};

instance Info_Saturas_NOWSLD(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_NOWSLD_Condition;
	information = Info_Saturas_NOWSLD_Info;
	permanent = 0;
	important = 0;
	description = "Lee mě přijmul k žoldákům.";
};

func int Info_Saturas_NOWSLD_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_CHANGESIDE))
	{
		return TRUE;
	};
};

func void Info_Saturas_NOWSLD_Info()
{
	AI_Output(hero,self,"Info_Saturas_NOWSLD_15_01");	//Lee mě přijmul k žoldákům.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_02");	//Dobře. Výborně. Teď patříš oficiálně k naší komunitě.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_03");	//Buď vítán!
	B_LogEntry(CH4_BannedFromOC,"Saturas mě oficiálně uvedl jako žoldáka. ");
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_SUCCESS);
};

instance Info_Saturas_XARDAS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDAS_Condition;
	information = Info_Saturas_XARDAS_Info;
	permanent = 0;
	important = 0;
	description = "Když jsi mě posílal k mágům Ohně, říkal jsi, že byl... NĚKDO.";
};

func int Info_Saturas_XARDAS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_COLLAPSE) && Npc_KnowsInfo(hero,Info_Saturas_MURDER))
	{
		if((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_KDF))
		{
			return TRUE;
		};
	};
};

func void Info_Saturas_XARDAS_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_01");	//Když jsi mě posílal k mágům Ohně, říkal jsi, že byl... NĚKDO.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_02");	//Dobrá, doufal jsem, že to dokážu bez tvojí pomoci, věci se mění...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_03");	//Kdo je ten ON?
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_04");	//Dobře, dobře!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_05");	//Před mnoha mnoha lety...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_06");	//Zkrať to, prosím!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_07");	//Buď trpělivý! Dobrá, když jsme - nás dvanáct mágů - tvořili tehdy Bariéru, naše magické síly byly směrovány a řízeny třináctým mágem.
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_08");	//Třináctým mágem? Myslel jsem, že jich bylo jen dvanáct!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_09");	//Většina lidí, která nezažila nejstarší období kolonie, tomu věří.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_10");	//Ten třináctý mág byl náš vůdce. To všechno se stalo předtím, než jsme byli rozděleni do Kruhů Ohně a Vody.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_11");	//Opustil ale Starý tábor, který byl tehdy jediným v kolonii.
};

instance Info_Saturas_XARDASWHO(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHO_Condition;
	information = Info_Saturas_XARDASWHO_Info;
	permanent = 0;
	important = 0;
	description = "Jak se ten třináctý mág jmenoval?";
};

func int Info_Saturas_XARDASWHO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHO_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHO_15_01");	//Jak se ten třináctý mág jmenoval?
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_02");	//Jmenoval se Xardas. Sotva si někdo vzpomene na tu starou historii!
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_03");	//Ti kteří si vzpomenou, ho teď nazývají NEKROMANT!
};

instance Info_Saturas_XARDASWHY(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHY_Condition;
	information = Info_Saturas_XARDASWHY_Info;
	permanent = 0;
	important = 0;
	description = "Proč opustil Starý tábor?";
};

func int Info_Saturas_XARDASWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHY_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01");	//Proč opustil Starý tábor?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_02");	//Začal zkoumat vyvolávání mrtvých a magických stvůr.
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_03");	//Gomez nebyl jediný, kdo ho varoval. Většina mágů se postavila proti němu i proti jeho bezbožným praktikám.
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_04");	//Co se stalo pak?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_05");	//Narozdíl od Gomeze to nebyl vrahoun, a tak se mu podařilo vyhnout konfliktu a odejít.
};

instance Info_Saturas_XARDASWHERE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHERE_Condition;
	information = Info_Saturas_XARDASWHERE_Info;
	permanent = 0;
	important = 0;
	description = "Kde je ten mág dneska?";
};

func int Info_Saturas_XARDASWHERE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHERE_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHERE_15_01");	//Kde je ten mág dneska?
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_02");	//Žije v odloučení ve věži uprostřed země skřetů.
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_03");	//To je přibližně u nejjižnějšího cípu kolonie.
};

instance Info_Saturas_XARDASHELP(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASHELP_Condition;
	information = Info_Saturas_XARDASHELP_Info;
	permanent = 0;
	important = 0;
	description = "Půjdu za Xardasem a požádám ho o pomoc!";
};

func int Info_Saturas_XARDASHELP_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASWHO) && Npc_KnowsInfo(hero,Info_Saturas_XARDASWHY) && Npc_KnowsInfo(hero,Info_Saturas_XARDASWHERE))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASHELP_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_01");	//Půjdu za Xardasem a požádám ho o pomoc!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_02");	//Je jediný, kdo nám může pomoci.
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_03");	//Pokud si ale nebude vědět rady nebo nám nepomůže...
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_04");	//BUDE!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_05");	//Je tu ještě jeden problém...
	B_Story_FindXardas();
};

instance Info_Saturas_XARDASPROBLEM(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASPROBLEM_Condition;
	information = Info_Saturas_XARDASPROBLEM_Info;
	permanent = 0;
	important = 0;
	description = "Problém?";
};

func int Info_Saturas_XARDASPROBLEM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASHELP))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_01");	//Problém?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_02");	//Ano. Během let jsme se několikrát pokoušeli s Xardasem spojit.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_03");	//Zřejmě však nechtěl být vyrušován.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_04");	//Co to znamená?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_05");	//Žádný z kurýrů se od něj z věže nevrátil.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_06");	//Budeš muset vymyslet způsob, jak projít přes ty stvůry.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_07");	//Začíná to být zajímavé!
	B_LogEntry(CH4_FindXardas,"Saturas mě varoval před stvůrami nekromanta Xardase. V knihovně mágů Vody jsou spisy o síle i slabinách těchto netvorů. Měl bych si udělat čas a pročíst si je.");
};

instance Info_Saturas_XARDASGO(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASGO_Condition;
	information = Info_Saturas_XARDASGO_Info;
	permanent = 0;
	important = 0;
	description = "Jak se dostanu přes ty stvůry?";
};

func int Info_Saturas_XARDASGO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASPROBLEM))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASGO_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_01");	//Jak se dostanu přes ty stvůry?
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_02");	//Kdybych věděl, řekl bych ti to!
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_03");	//Poradil bych ti, aby ses porozhlédl v naší knihovně.
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_04");	//Možná ve starých knihách najdeš něco o síle i slabinách magií vytvořených stvůr.
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_05");	//Prohledám knihovnu. A neměj obavy...
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_06");	//Vrátím se!
	B_LogEntry(CH4_FindXardas,"V knihovně mágů Vody jsou spisy o síle i slabinách těchto netvorů. Měl bych si udělat čas a pročíst si je.");
};

instance KDW_600_Saturas_TIMESUP(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_TIMESUP_Condition;
	information = KDW_600_Saturas_TIMESUP_Info;
	important = 1;
	permanent = 0;
};

func int KDW_600_Saturas_TIMESUP_Condition()
{
	if((FindOrcShaman == LOG_RUNNING) || (FindOrcShaman == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_00");	//Mluvil jsi s Xardasem?
	Info_ClearChoices(KDW_600_Saturas_TIMESUP);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Tedy...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Ne...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Celá ta záležitost není taková, jak si myslíš...",KDW_600_Saturas_TIMESUP_JA3);
};

func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//Tedy...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_02");	//Tedy...? Co, teda?
};

func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05");	//Ne...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_06");	//Proč ne?
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_07");	//Nedokázal jsem se dostat do té oblasti...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_08");	//Musíš ho najít a požádat ho o radu!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos(self);
};

func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_09");	//Celá ta záležitost není taková, jak si myslíš...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_10");	//Co to má znamenat? Musí najít způsob, jak odpálit tu rudnou haldu!
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11");	//Ta rudná halda... uch... ehm... Vyrostla pořádně vysoko!
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_12");	//Najdi Xardase, musí pomoci!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos(self);
};

instance KDW_600_Saturas_HogeAUFNAHME(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 10;
	condition = KDW_600_Saturas_HogeAUFNAHME_Condition;
	information = KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent = 0;
	description = "Nefarius řekl, že už jsem hoden nosit roucho mága Vody.";
};

func int KDW_600_Saturas_HogeAUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero) == GIL_SLD) && (NEFARIUS_KDW == TRUE))
	{
		return 1;
	};
};

func void KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_HogeAUFNAHME_15_00");	//Nefarius řekl, že už jsem hoden nosit roucho mága Vody.
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//Pak vítej do naší komunity!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//Znamená to, že teď patřím do spolku mágů Vody?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//Ještě ne. Nejdříve musíš složit přísahu Vody.
};

instance KDW_600_Saturas_HogeAUFNAHMETeil2(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 10;
	condition = KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information = KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent = 0;
	description = "Jsem připraven složit přísahu.";
};

func int KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//Jsem připraven složit přísahu.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//Nyní prones slova přísahy:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//Přísahám při boží moci...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//Přísahám při boží moci...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//...a na sílu svaté Vody...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//...a na sílu svaté Vody...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//...že mé vědění a skutky budu od tohoto okamžiku a provždy v jednotě s Vodou...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//...že mé vědění a skutky budu od tohoto okamžiku a provždy v jednotě s Vodou...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//...dokud mé tělo nebude navráceno říši Beliarově a voda mého života nevyschne.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//...dokud mé tělo nebude navráceno říši Beliarově a voda mého života nevyschne.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//Oblékni si toto roucho na znamení svazku se svatou Vodou a Adanosem.
	CreateInvItem(self,kdw_armor_l);
	B_GiveInvItems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	Log_CreateTopic(CH4_SldToKdW,LOG_NOTE);
	B_LogEntry(CH4_SldToKdW,"Saturas mě přijal do Kruhu vody.");
	AI_StopProcessInfos(self);
};

instance DIA_KDW_SATURAS_HERODMB(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 3;
	condition = dia_kdw_saturas_herodmb_condition;
	information = dia_kdw_saturas_herodmb_info;
	permanent = 0;
	important = 1;
};

func int dia_kdw_saturas_herodmb_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_DMB)
	{
		return 1;
	};
};

func void dia_kdw_saturas_herodmb_info()
{
	AI_Output(self,other,"DIA_KDW_Saturas_HeroDMB_15_00");	//TY?! Kde ses naučil Beliarovu magii?
	AI_Output(self,other,"DIA_KDW_Saturas_HeroDMB_15_01");	//Víš ty co, ani to nechci vědět, vlastně tě tu už nikdy nechci ani vidět.
	AI_Output(self,other,"DIA_KDW_Saturas_HeroDMB_15_02");	//Co nejdříve odejdi.
	AI_StopProcessInfos(self);
};

