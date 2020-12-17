instance INFO_GRD_5037_GARAZ_EXIT(C_Info)
{
	npc = grd_5037_garaz;
	nr = 999;
	condition = info_grd_5037_garaz_exit_condition;
	information = info_grd_5037_garaz_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int info_grd_5037_garaz_exit_condition()
{
	return 1;
};

func void info_grd_5037_garaz_exit_info()
{
	AI_StopProcessInfos(self);
};

instance INFO_GRD_5037_GARAZ_SIEHTSAUS(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_siehtsaus_condition;
	information = info_grd_5037_garaz_siehtsaus_info;
	permanent = 0;
	description = "Jak to vypadá?";
};

func int info_grd_5037_garaz_siehtsaus_condition()
{
	return 1;
};

func void info_grd_5037_garaz_siehtsaus_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_SiehtsAus_15_00");	//Jak to vypadá?
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_06_01");	//Jak by to mělo vypadat? Celý den tady stojím a koukám do země, zatímco všichni ostatní si užívají na hradě.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_05_02");	//Říkali: 'Potřebujeme někoho, kdo se postará o zásoby starého dolu'. 'Garazi, ty jsi náš muž.'.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_07_02");	//Pokaždé dělám já špinavou práci.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_06_03");	//TAKHLE to tedy vypadá.
};

instance INFO_GRD_5037_GARAZ_TRUHE(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_truhe_condition;
	information = info_grd_5037_garaz_truhe_info;
	permanent = 0;
	description = "A co truhly za vámi?";
};

func int info_grd_5037_garaz_truhe_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_siehtsaus))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_truhe_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_Truhe_15_00");	//A co ty truhly za tebou?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Truhe_06_01");	//Co by s nimi mělo být?
	AI_Output(other,self,"Info_Grd_5037_Garaz_Truhe_06_02");	//Co v nich je?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Truhe_06_03");	//Nemyslím si, že je to tvoje věc.
};

var int garaz_bier;

instance INFO_GRD_5037_GARAZ_AUSGEBEN(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_ausgeben_condition;
	information = info_grd_5037_garaz_ausgeben_info;
	permanent = 1;
	description = "Tady, pivo je na mě.";
};

func int info_grd_5037_garaz_ausgeben_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_truhe) && (GARAZ_BIER == FALSE))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_ausgeben_info()
{
	if(Npc_HasItems(other,ItFoBeer) > 0)
	{
		B_GiveInvItems(other,self,ItFoBeer,1);
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_15_00");	//Tady, pivo je na mě.
		AI_UseItem(self,ItFoBeer);
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_01");	//To jsem přesně potřeboval. Z toho postávání tady mám zatracenou žízeň, to ti řeknu.
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_06_02");	//Chtěl jsi mi také říct, co je v těch truhlách.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_03");	//Ach ano, v bednách jsou zásoby, které přišly s konvojem a jsou pro stráže v táboře a v dole.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_04");	//To je vše, co se o nich dá říct.
		GARAZ_BIER = TRUE;
	}
	else
	{
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_KEIN_BIER_15_00");	//Tady, pivo je na mě.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_BIER_06_01");	//Kde? Žádné pivo nevidím.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_BIER_06_02");	//Přines mi jedno, a pak si promluvíme.
	};
};

instance INFO_GRD_5037_GARAZ_TAX(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_tax_condition;
	information = info_grd_5037_garaz_tax_info;
	permanent = 0;
	description = "Slyšel jsem, že sbíráš poplatky od kopáčů.";
};

func int info_grd_5037_garaz_tax_condition()
{
	if((ERZ_SCHULDEN == LOG_RUNNING) && Npc_KnowsInfo(hero,vlk_587_garp_typ))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_tax_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_Tax_15_00");	//Slyšel jsem, že sbíráš poplatky od kopáčů.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_06_01");	//Ano je to tak, ale nevím co je tebe do toho.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_07_02");	//Nedávej si naději, nemám u sebe žádnou rudu. Je zamčená v truhle.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_06_03");	//A klíč mám pořád u sebe.
	B_LogEntry(CH1_SCHULDEN,"Vypadá to, že musím přijít na to, jak získat Garazův klíč, poku se chci dostat do jeho truhly. Možná bych si měl promluvit s Miguelem, tak jak mi radil Garp.");
};

var int garaz_wein;

instance INFO_GRD_5037_GARAZ_WEINAUSGEBEN(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_weinausgeben_condition;
	information = info_grd_5037_garaz_weinausgeben_info;
	permanent = 1;
	description = "Nechceš trochu vína?";
};

func int info_grd_5037_garaz_weinausgeben_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_garaz) && (GARAZ_WEIN == FALSE))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_weinausgeben_info()
{
	if(Npc_HasItems(other,ItFoWine) > 0)
	{
		B_GiveInvItems(other,self,ItFoWine,1);
		AI_Output(other,self,"Grd_5037_Garaz_WeinAusgeben_15_00");	//Nechceš trochu vína?
		AI_UseItem(self,ItFoWine);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",Time_Haste3);
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_01");	//Jo trochu bych si dal příteli.
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_02");	//Hádám, že ti něco dlužím.
		AI_Output(other,self,"Grd_5037_Garaz_WeinAusgeben_06_03");	//Třeba bys mi mohl půjčit na chvilku tvůj klíč.
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_04");	//Ale jistě, tady je, já ho ani nepotřebuju.
		B_GiveInvItems(self,other,itke_omcamp_01,1);
		B_LogEntry(CH1_SCHULDEN,"Zabralo to, Garaz mi dal svůj klíč od truhly. Teď můžu získat rudu kopáčů.");
		GARAZ_WEIN = TRUE;
	}
	else
	{
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_KEIN_WeinAusgeben_15_00");	//Co třeba víno?
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_WeinAusgeben_06_01");	//Nesnaž se mě balamutit a nějaké sežeň.
	};
};

