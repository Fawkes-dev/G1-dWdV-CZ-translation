instance Info_Kirgo_Exit(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 999;
	condition = Info_Kirgo_Exit_Condition;
	information = Info_Kirgo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Kirgo_Exit_Condition()
{
	return 1;
};

func void Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Kirgo_What(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_What_Condition;
	information = Info_Kirgo_What_Info;
	permanent = 0;
	description = "Zdar! Jsem tady nový.";
};

func int Info_Kirgo_What_Condition()
{
	if(Kapitel <= 2)
	{
		return 1;
	};
};

func void Info_Kirgo_What_Info()
{
	AI_Output(other,self,"Info_Kirgo_What_15_00");	//Zdar! Jsem tady nový.
	AI_Output(self,other,"Info_Kirgo_What_05_01");	//Neříkej! Řekni mi něco o vnějším světě! Už jsem o tom, co se děje venku, neslyšel přes měsíc.
	AI_Output(self,other,"Info_Kirgo_What_05_02");	//Jsem Kirgo. Bojuju v aréně.
};

instance Info_Kirgo_Good(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Good_Condition;
	information = Info_Kirgo_Good_Info;
	permanent = 0;
	description = "A jsi dobrý? Myslím v boji, chápeš?";
};

func int Info_Kirgo_Good_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func void Info_Kirgo_Good_Info()
{
	AI_Output(other,self,"Info_Kirgo_Good_15_00");	//A jsi dobrý?
	AI_Output(self,other,"Info_Kirgo_Good_05_01");	//V boji? Už jsem dlouho nebojoval, ale zatím jsem v souboji vždycky zvítězil!
};

instance Info_Kirgo_Charge(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Charge_Condition;
	information = Info_Kirgo_Charge_Info;
	permanent = 0;
	description = "Chtěl bych tě vyzvat na souboj v aréně!";
};

func int Info_Kirgo_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kirgo_What) && (Kapitel <= 1))
	{
		return 1;
	};
};

func void Info_Kirgo_Charge_Info()
{
	AI_Output(other,self,"Info_Kirgo_Charge_15_00");	//Chtěl bych tě vyzvat na souboj v aréně!
	AI_Output(self,other,"Info_Kirgo_Charge_05_01");	//Cože? Ale já bojovat nechci. Proč si raději nedáme pivo a nepopovídáme o vnějším světě?
	Info_ClearChoices(Info_Kirgo_Charge);
	Info_AddChoice(Info_Kirgo_Charge,"Ne! Chci bojovat. Teď!",Info_Kirgo_Charge_NOW);
	Info_AddChoice(Info_Kirgo_Charge,"Dobře, pak mám u tebe pivo!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00");	//Ne! Chci bojovat. Teď!
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01");	//V tom případě... Jestli jsi připraven, já taky.
	Info_ClearChoices(Info_Kirgo_Charge);
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00");	//Dobře, pak mám u tebe pivo!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01");	//Tady je!
	AI_UseItem(hero,ItFoBeer);
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02");	//Díky! Obávám se, že ti toho o vnějším světě nebudu moci tolik říci - drželi mě skoro dva měsíce zamknutého v tmavé díře, než mě uvrhli sem.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03");	//To je ostuda... No, nezlob se... Hej, na někoho, kdo byl dva měsíce pod zámkem, ale vypadáš docela dobře.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04");	//Jsem rád, že to takhle dopadlo.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05");	//Proč potom trváš na tom, abysme se spolu utkali?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06");	//Chci, aby se o mně v táboře vědělo!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07");	//Myslíš Scattyho? Hm, to je jeden z nejvýznamnějších mužů z Vnějšího okruhu... Když mě porazíš, určitě si toho všimne...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08");	//Ale jestli ho doopravdy chceš zaujmout, pak potřebuješ porazit Kharima. Akorát mám obavu, že na tebe bude příliš silný!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09");	//Jestli chceš ještě pořád bojovat se mnou, dej mi vědět. Nebudu mít ale radost z toho, až tě skolím.
	CreateInvItem(self,ItFoBeer);
	B_GiveInvItems(self,hero,ItFoBeer,1);
	self.npcType = npctype_friend;
	Info_ClearChoices(Info_Kirgo_Charge);
};

var int Kirgo_Charged;

instance Info_Kirgo_ChargeREAL(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_ChargeREAL_Condition;
	information = Info_Kirgo_ChargeREAL_Info;
	permanent = 0;
	description = "Tak pojďme bojovat - jsi připraven?";
};

func int Info_Kirgo_ChargeREAL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_Charge) && (Kapitel >= 1))
	{
		return 1;
	};
};

func void Info_Kirgo_ChargeREAL_Info()
{
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00");	//Tak pojďme bojovat - jsi připraven?
	AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01");	//Pojď za mnou!
	AI_StopProcessInfos(self);
	Kirgo_Charged = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
};

instance Info_Kirgo_InArena(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_InArena_Condition;
	information = Info_Kirgo_InArena_Info;
	permanent = 0;
	important = 1;
};

func int Info_Kirgo_InArena_Condition()
{
	if((Kirgo_Charged == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void Info_Kirgo_InArena_Info()
{
	if(Kapitel >= 1)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_5_LetsForgetOurLittleFight");	//Dobrá, zapomeňme na tuhle hádku, dobrý?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};

instance INFO_KIRGO_ARENAFIGHT(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 0;
	condition = info_kirgo_arenafight_condition;
	information = info_kirgo_arenafight_info;
	important = 1;
	permanent = 1;
};

func int info_kirgo_arenafight_condition()
{
	if((KIRGO_FIGHT == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500) && ((GRD_251_Kirgo.aivar[AIV_HASDEFEATEDSC] == FALSE) || (GRD_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == FALSE)))
	{
		return 1;
	};
};

func void info_kirgo_arenafight_info()
{
	AI_Output(self,other,"Info_Kirgo_InArena_05_00");	//Dobře, pojďme do toho. Ať vyhraje ten nejlepší!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

