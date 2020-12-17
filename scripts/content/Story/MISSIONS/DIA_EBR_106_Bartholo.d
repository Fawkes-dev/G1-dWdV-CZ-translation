instance DIA_Bartholo_Exit(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 999;
	condition = DIA_Bartholo_Exit_Condition;
	information = DIA_Bartholo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

func void DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Bartholo_HAllo(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_HAllo_Condition;
	information = Info_Bartholo_HAllo_Info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int Info_Bartholo_HAllo_Condition()
{
	return 1;
};

func void Info_Bartholo_HAllo_Info()
{
	AI_Output(other,self,"Info_Bartholo_HAllo_15_00");	//Kdo jsi?
	AI_Output(self,other,"Info_Bartholo_HAllo_12_01");	//Jmenuji se Bartholo. Starám se o to, aby Rudobaroni dostávali své dodávky.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_02");	//Mám toho na starosti spoustu - od drogy z bažin až po potravinové zásoby pro ženy.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_03");	//A taky mám na starosti dohlížet, aby ti pitomí kuchaři odváděli dobrou práci.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_04");	//Měli by být excelentní. Gomez se nespokojí s žádným šlendriánem. Posledními dvěma kuchaři nakrmil ryby v řece.
};

var int bartholo_trade;

instance Info_Bartholo_PERM(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_PERM_Condition;
	information = Info_Bartholo_PERM_Info;
	permanent = 1;
	description = "Chtěl bych s tebou obchodovat.";
	trade = 1;
};

func int Info_Bartholo_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Bartholo_HAllo))
	{
		return 1;
	};
};

func void Info_Bartholo_PERM_Info()
{
	AI_Output(other,self,"Info_Bartholo_PERM_15_00");	//Chtěl bych s tebou obchodovat.
	AI_Output(self,other,"Info_Bartholo_PERM_12_01");	//Můžu toho nabídnout hodně - pokud máš dost rudy.
	if(BARTHOLO_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Bartholo, jeden z Rudobaronů nabízí různé zboží na prodej.");
		BARTHOLO_TRADE = TRUE;
	};
};

instance Info_Bartholo_Krautbote(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_Krautbote_Condition;
	information = Info_Bartholo_Krautbote_Info;
	permanent = 1;
	description = "Mám pro Gomeze trochu drogy z bažin. Posílá ji Cor Kalom.";
};

func int Info_Bartholo_Krautbote_Condition()
{
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Bartholo_Krautbote_Info()
{
	AI_Output(other,self,"Info_Bartholo_Krautbote_15_00");	//Mám pro Gomeze trochu drogy z bažin. Posílá ji Cor Kalom.
	AI_Output(self,other,"Info_Bartholo_Krautbote_12_01");	//Ukaž mi to!
	if(Npc_HasItems(other,ItMiJoint_3) >= 30)
	{
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_02");	//Hmmmm...
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_03");	//Dobrá! Gomez už začíná být netrpělivý. Máš štěstí, žes to přinesl už dneska!
		AI_Output(other,self,"Info_Bartholo_Krautbote_15_04");	//A co takhle platit?
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_05");	//Ne tak zhurta... Ták, tady. 500 nugetů, jak to bylo domluveno.
		B_GiveInvItems(other,self,ItMiJoint_3,30);
		CreateInvItems(self,ItMiNugget,500);
		B_GiveInvItems(self,other,ItMiNugget,500);
		Kalom_DeliveredWeed = TRUE;
		B_LogEntry(CH1_KrautBote,"Bartholo mi dal za zásilku drogy 500 nugetů. ");
		B_GiveXP(XP_WeedShipmentDelivered);
		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output(self,other,"Info_Bartholo_Krautbote_NoKraut_12_00");	//Na poslíčka té drogy moc nemáš! Doufám, žes tu zásilku už nerozprodal někde jinde! Vrať se, až budeš mít to správné množství!
	};
};

instance DIA_EBR_106_Bartholo_Wait4SC(C_Info)
{
	npc = EBR_106_Bartholo;
	condition = DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information = DIA_EBR_106_Bartholo_Wait4SC_Info;
	important = 1;
	permanent = 0;
};

func int DIA_EBR_106_Bartholo_Wait4SC_Condition()
{
	if(ExploreSunkenTower == TRUE)
	{
		return TRUE;
	};
};

func void DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bartholo_12_01");	//Věděl jsem, že se k nám někdo pokouší dostat přes pentagram!
	AI_Output(self,other,"Info_Bartholo_12_02");	//Ale na rozdíl od toho zrádného kováře Stonea tebe už nebudeme potřebovat!
	AI_Output(other,self,"Info_Bartholo_15_03");	//Kde je Stone?
	AI_Output(self,other,"Info_Bartholo_12_04");	//Za katrem! Ale ty budeš v okamžiku pod drnem!
	AI_Output(self,other,"Info_Bartholo_12_05");	//Dejte mu, chlapi, roztrhejte ho na kusy!
	CreateInvItem(self,ItKe_Storage_01);
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
};

instance DIA_BARTHOLO_SCBARON(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 3;
	condition = dia_bartholo_scbaron_condition;
	information = dia_bartholo_scbaron_info;
	permanent = 0;
	important = 1;
};

func int dia_bartholo_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_bartholo_scbaron_info()
{
	AI_Output(self,other,"DIA_Bartholo_SCBARON_15_00");	//Přidal jsi se ke Gomezově osobní stráži?
	AI_Output(self,other,"DIA_Bartholo_SCBARON_15_01");	//Nebudeš toho litovat.
	AI_StopProcessInfos(self);
};

