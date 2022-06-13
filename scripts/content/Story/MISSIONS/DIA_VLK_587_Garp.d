instance Vlk_587_Garp_Exit(C_Info)
{
	npc = VLK_587_Garp;
	nr = 999;
	condition = Vlk_587_Garp_Exit_Condition;
	information = Vlk_587_Garp_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

func void Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Vlk_587_Garp_ORK(C_Info)
{
	npc = VLK_587_Garp;
	nr = 1;
	condition = Vlk_587_Garp_ORK_Condition;
	information = Vlk_587_Garp_ORK_Info;
	important = 0;
	permanent = 0;
	description = "Co tady dělá skřet?";
};

func int Vlk_587_Garp_ORK_Condition()
{
	return 1;
};

func void Vlk_587_Garp_ORK_Info()
{
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_01");	//Co tady dělá skřet?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02");	//Zadržela ho stráž. Od té doby tady musí pracovat.
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03");	//Není ani v železech. Jak to, že neuteče?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04");	//Jednou se o to pokusil. Stráž mu dala co proto, takže nemohl pár týdnů chodit. Od té doby se o to už nikdy nepokusil.
};

instance VLK_587_GARP_SCHULDEN(C_Info)
{
	npc = VLK_587_Garp;
	nr = 2;
	condition = vlk_587_garp_schulden_condition;
	information = vlk_587_garp_schulden_info;
	important = 0;
	permanent = 0;
	description = "Posílá mně tvůj kámoš.";
};

func int vlk_587_garp_schulden_condition()
{
	if(ERZ_SCHULDEN == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_587_garp_schulden_info()
{
	AI_Output(other,self,"Vlk_587_Garp_Schulden_Info_15_01");	//Posílá mne tvůj přítel.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_02");	//A?
	AI_Output(other,self,"Vlk_587_Garp_Schulden_Info_15_03");	//Říká že mu dlužíš rudu. Chce ji zpátky.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_04");	//Vrátil bych mu jeho rudu. Ale žádnou nemám! Jeden strážce mi všechnu sebral.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_05");	//Řekl, že pokud chci jít do dolu, musím zaplatit  poplatek. Pak mi sebral všechnu rudu.
	B_LogEntry(CH1_SCHULDEN,"Garp už rudu nemá. Musel ji zaplatit za vstup do dolu.");
};

instance VLK_587_GARP_TYP(C_Info)
{
	npc = VLK_587_Garp;
	nr = 2;
	condition = vlk_587_garp_typ_condition;
	information = vlk_587_garp_typ_info;
	important = 0;
	permanent = 0;
	description = "Kdo byl ten chlap, co ti vzal rudu?";
};

func int vlk_587_garp_typ_condition()
{
	if((ERZ_SCHULDEN == LOG_RUNNING) && Npc_KnowsInfo(hero,vlk_587_garp_schulden))
	{
		return 1;
	};
};

func void vlk_587_garp_typ_info()
{
	AI_Output(other,self,"Vlk_587_Garp_Typ_Info_15_01");	//Kdo ti tu rudu sebral?
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_01_02");	//Ten chlap se jmenuje Garaz. Je jedním z Gomezových stráží.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_03");	//Celé dny nedělá nic jiného, než že sedí na prdeli a obírá nás o rudu.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_04");	//Pokud s ním chceš bojovat, zapomeň na to! Je to zkušený bojovník. Vyrazil by ti zuby jak nic!
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_05");	//Raději mu vyber jeho truhlu. Pokud vím má ji blízko ohniště.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_17_06");	//Ale nenech se chytit, jinak ti utrhne hlavu.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_16_06");	//Zkus si promluvit s Miguelem. Patří ke stínům a prodává různé rostliny. Je celkem v pohodě.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_07");	//Hodně štěstí. Budeš ho potřebovat!
	AI_StopProcessInfos(self);
	B_LogEntry(CH1_SCHULDEN,"Garaz, jeden z Gomezových strážců, si rudu vzal. Vypadá to, že pokud rudu chci, budu si muset promluvit s ním. Garp mi poradil, že Garazovy si rudu ukrýva v truhle, kdybych se dostal k jeho klíči ...");
};

instance VLK_587_GARP_GARRET(C_Info)
{
	npc = VLK_587_Garp;
	condition = vlk_587_garp_garret_condition;
	information = vlk_587_garp_garret_info;
	important = 0;
	permanent = 0;
	description = "Víš něco o Garretovi?";
};

func int vlk_587_garp_garret_condition()
{
	if(LOST_DIGGER == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_587_garp_garret_info()
{
	AI_Output(other,self,"Vlk_587_Garp_GARRET_Info_15_01");	//Víš něco o Garretovi?
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_02");	//Ano, pracoval s námi tady v šachtě.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_03");	//Neviděl jsem ho už hodně dlouho.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_04");	//Naposledy před velkým útokem Důlních červů.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_05");	//Děsil se těch bestií. Je docela možné, že ho nějaká z těch potvor sežrala.
	AI_Output(other,self,"Vlk_587_Garp_GARRET_Info_15_06");	//Děkuji, to mi docela pomohlo.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_07");	//Promiň, nemám tušení, kde ten chlap může být.
	B_LogEntry(CH1_LOSTDIGGER,"Garp neví jak by mi pomohl. Netuší, co se mohlo Garretovi stát.");
};

