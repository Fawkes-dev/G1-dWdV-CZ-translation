instance DIA_BaalOrun_Exit(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 999;
	condition = DIA_BaalOrun_Exit_Condition;
	information = DIA_BaalOrun_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_BaalOrun_Exit_Condition()
{
	return 1;
};

func void DIA_BaalOrun_Exit_Info()
{
	AI_StopProcessInfos(self);
};

var int BaalOrun_Ansprechbar;
var int BaalOrun_Sakrileg;

instance DIA_BaalOrun_NoTalk(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_NoTalk_Condition;
	information = DIA_BaalOrun_NoTalk_Info;
	permanent = 1;
	important = 1;
};

func int DIA_BaalOrun_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalOrun_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalOrun_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalOrun_NoTalk);
	Info_AddChoice(DIA_BaalOrun_NoTalk,DIALOG_ENDE,DIA_BaalOrun_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Je všechno v pořádku, příteli?",DIA_BaalOrun_NoTalk_Imp);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Spáč buď s tebou!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Zdar! Jsem tu nový!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00");	//Zdar! Jsem tu nový!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01");	//(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00");	//Spáč buď s tebou!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01");	//(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00");	//Je všechno v pořádku, příteli?
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_12_01");	//(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};

instance DIA_BaalOrun_FirstTalk(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_FirstTalk_Condition;
	information = DIA_BaalOrun_FirstTalk_Info;
	permanent = 0;
	important = 1;
};

func int DIA_BaalOrun_FirstTalk_Condition()
{
	if(Ghorim_KickHarlok == LOG_SUCCESS)
	{
		BaalOrun_Ansprechbar = TRUE;
		return 1;
	};
};

func void DIA_BaalOrun_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00");	//Mluvil jsem s Ghorimem. Prokázal jsi jednomu z našich bratrů velkou službu - a to je od tebe správné.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01");	//Proto jsem si tě vybral pro zvláštní úkol.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02");	//Col Kalom naléhavě potřebuje novou drogu z bažin pro své experimenty.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03");	//Naši sběrači pracují ve dne v noci. Jdi za nimi a celou jejich sklizeň předej do Kalomovy alchymistické dílny.
	B_GiveXP(XP_BaalOrunTalks);
	B_LogEntry(CH1_GhorimsRelief,"Harlok právě nahradil Ghorima. Zázraky se dějí.");
	Log_SetTopicStatus(CH1_GhorimsRelief,LOG_SUCCESS);
	Log_CreateTopic(CH1_DeliverWeed,LOG_MISSION);
	Log_SetTopicStatus(CH1_DeliverWeed,LOG_RUNNING);
	B_LogEntry(CH1_DeliverWeed,"Dovednost přemlouvání v té věci s Harlokem udělala dojem na guru Baala Oruna. Nyní mám tu čest přebírat všechnu drogu od noviců v bažinách pro Cora Kaloma.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Nic neříkej.",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Kde přesně najdu ty sběrače?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00");	//Kde přesně najdu ty sběrače?
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01");	//Nedal jsem ti povolení mě oslovovat!
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02");	//Modli se ke Spáčovi, aby ti odpustil tvůj hřích! A teď odejdi. Tvé poslání je nesmírně důležité.
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

func void DIA_BaalOrun_FirstTalk_MuteEnde()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

instance DIA_BaalOrun_GotWeed(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_GotWeed_Condition;
	information = DIA_BaalOrun_GotWeed_Info;
	permanent = 0;
	important = 1;
};

func int DIA_BaalOrun_GotWeed_Condition()
{
	if(Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_GotWeed_Info()
{
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00");	//Ochránil jsi naše sběrače...
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01");	//Nejen že jsi prokázal, že jsi na naší straně - dokázal jsi také, že jsi věrný služebník Spáče.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02");	//Věřím, že už brzy oblékneš roucho novice.
	BaalOrun_Ansprechbar = TRUE;
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Orun mě nazval věrným služebníkem Spáče, protože jsem kvůli novicům z bažin vymýtil krvavé mouchy.");
	B_GiveXP(XP_ImpressedBaalOrun);
};

instance DIA_BaalOrun_WeedAtKaloms(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_WeedAtKaloms_Condition;
	information = DIA_BaalOrun_WeedAtKaloms_Info;
	permanent = 0;
	description = "Předal jsem drogu z bažin Corovi Kalomovi.";
};

func int DIA_BaalOrun_WeedAtKaloms_Condition()
{
	if(BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_WeedAtKaloms_Info()
{
	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00");	//Předal jsem drogu z bažin Corovi Kalomovi.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01");	//Dobře jsi to provedl. Za tvé úsilí ti dám malou odměnu. Tady je, vem si ji.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02");	//To je magické zaříkávání ke spánku. Můžeš je použít jen jedenkrát, ale věřím, že ti prokáže dobrou službu.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_09");	//Když se k nám přidáš, tak tě naučím jak zpracovávat Trávu z bažin.
	BaalOrun_Ansprechbar = TRUE;
	B_GiveXP(XP_ReportToBaalOrun);
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Orun mě může naučit zpracování Trávy z bažin. Aby mě ale zasvětil do tajemství produkce trávy z bažin musím být členem tábora.");
	CreateInvItem(self,ItArScrollSleep);
	B_GiveInvItems(self,other,ItArScrollSleep,1);
};

instance DIA_BaalOrun_Perm(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_Perm_Condition;
	information = DIA_BaalOrun_Perm_Info;
	permanent = 1;
	description = "Jak jde produkce drogy z bažin?";
};

func int DIA_BaalOrun_Perm_Condition()
{
	if(BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_Perm_Info()
{
	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00");	//Jak jde produkce drogy z bažin?
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01");	//Naléháme, jak nejvíce dokážeme, na každého muže, aby vyprodukoval dostatek pro nás samotné a obchodování s ostatními tábory.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02");	//To je ale oběť pro Spáče, kterou naši novicové ochotně přinášejí.
};

instance DIA_BAALORUN_LEARN(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 3;
	condition = dia_baalorun_learn_condition;
	information = dia_baalorun_learn_info;
	permanent = 1;
	description = "Zpracování Trávy z bažin (cena: 5 VB)";
};

func int dia_baalorun_learn_condition()
{
	if((BaalOrun_FetchWeed == LOG_SUCCESS) && Npc_KnowsInfo(hero,DIA_BaalOrun_WeedAtKaloms) && (KNOWS_STOMPHERB == FALSE) && C_NpcBelongsToPsiCamp(hero))
	{
		return 1;
	};
};

func void dia_baalorun_learn_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Learn_15_00");	//Chtěl bych se naučit správně zpracovávat Trávu z bažin.
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_01");	//Dobře. Až nasbíráš dost trávy vlož ji do drtiče.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_02");	//Začni s drcením, snaž se ji tlačit rovnoměrně.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_03");	//Nakonec vyber rozdrcenou trávu a očisť jí od stonku.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_04");	//Čím více Trávy z bažin nadrtíš, tím větší účinek bude mít.
		Log_CreateTopic(GE_HERB,LOG_NOTE);
		B_LogEntry(GE_HERB,"Nyní znám tajemství zpracování trávy z bažin a můžu s ní pracovat.");
		B_LogEntry(GE_HERB,"Na výrobu 'Mladého novice' potřebuju jednu Trávu z bažin.");
		B_LogEntry(GE_HERB,"Na výrobu 'Severního soumraku' potřebuju dvě rostliny.");
		B_LogEntry(GE_HERB,"A na výrobu 'Přivolání snu' potřebuju tři rostliny.");
		KNOWS_STOMPHERB = TRUE;
		PrintScreen("Naučil ses: Zpracování trávy",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

instance DIA_BAALORUN_COOKING(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 4;
	condition = dia_baalorun_cooking_condition;
	information = dia_baalorun_cooking_info;
	permanent = 0;
	description = "Slyšel jsem, že by jsi mě mohl naučit něco o vaření.";
};

func int dia_baalorun_cooking_condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY) && (BaalOrun_Ansprechbar == TRUE))
	{
		return 1;
	};
};

func void dia_baalorun_cooking_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Cooking_15_00");	//Slyšel jsem, že by jsi mě mohl naučit něco o vaření.
	AI_Output(self,other,"DIA_BaalOrun_Cooking_12_01");	//Ano, můžu.
	AI_Output(self,other,"DIA_BaalOrun_Cooking_12_02");	//Můžu ti ukázat jak připravit Vývar z Důlních červů. Naučím tě to, jestli máš zájem.
};

instance DIA_BAALORUN_SOUP(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 5;
	condition = dia_baalorun_soup_condition;
	information = dia_baalorun_soup_info;
	permanent = 1;
	description = "Vývar z Důlního červa (cena: 1 VB)";
};

func int dia_baalorun_soup_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalorun_cooking) && (KNOWS_CRAWLERSOUP == FALSE))
	{
		return 1;
	};
};

func void dia_baalorun_soup_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Soup_15_00");	//Ukaž mi jak připravit Vývar z Důlních červů.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_01");	//Dobrá. Nejdříve dej vařit vodu.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_02");	//Až začne bublat, vlož čelisti Důlních červů.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_03");	//Musí se pořádně provařit, aby jed z čelistí ztratil účinek.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_04");	//Nakonec přidej Skřetí listy a směs promíchej.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Díky Baal Orunovi umím uvařit: Polévku z Důlních červů.");
		B_LogEntry(GE_COOK,"Ingredience jsou: 2 Skřetí listy, 1 čelisti důlního červa.");
		KNOWS_CRAWLERSOUP = TRUE;
		PrintScreen("Naučil ses: Polévka z Důlního červa",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

