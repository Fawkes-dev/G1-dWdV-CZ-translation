instance DIA_Kyle_Exit(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 999;
	condition = DIA_Kyle_Exit_Condition;
	information = DIA_Kyle_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Kyle_Exit_Condition()
{
	return 1;
};

func void DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);
	AI_StopProcessInfos(self);
};

instance DIA_Kyle_HutRage(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_HutRage_Condition;
	information = DIA_Kyle_HutRage_Info;
	permanent = 1;
	important = 1;
};

func int DIA_Kyle_HutRage_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (HEREK_KICKASS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void DIA_Kyle_HutRage_Info()
{
	AI_Output(self,other,"DIA_Kyle_HutRage_10_00");	//Kolikrát vám budu, vy bastardi, muset opakovat, abyste neprocházeli mojí chatrčí?
};

instance DIA_Kyle_Problem(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_Problem_Condition;
	information = DIA_Kyle_Problem_Info;
	permanent = 0;
	description = "Co máš za problém?";
};

func int DIA_Kyle_Problem_Condition()
{
	return 1;
};

func void DIA_Kyle_Problem_Info()
{
	AI_Output(other,self,"DIA_Kyle_Problem_15_00");	//Co máš za problém?
	AI_Output(self,other,"DIA_Kyle_Problem_10_01");	//Nech mě na pokoji, člověče! Každý má tady problémy se MNOU!
	AI_Output(self,other,"DIA_Kyle_Problem_10_02");	//Všechno začalo v okamžiku, když jsem stavěl tuhle chatrč.
	AI_Output(self,other,"DIA_Kyle_Problem_10_03");	//Říkali: nestav tu chatrč tak blízko strouhy.
	AI_Output(self,other,"DIA_Kyle_Problem_10_04");	//Nikdo z těch bastardů mi ale neřekl, co se stane, když to udělám.
	AI_Output(self,other,"DIA_Kyle_Problem_10_05");	//Když jsem se za pár dní vrátil z dolu, byly tam druhé dveře.
	AI_Output(self,other,"DIA_Kyle_Problem_10_06");	//Ty hajzlové! Nenávidím je! Ani nedokážu říci, jak strašně je nenávidím!
	AI_Output(self,other,"DIA_Kyle_Problem_10_07");	//Teď  každý prochází mojí chatrčí. Každý idiot.
	AI_Output(self,other,"DIA_Kyle_Problem_10_08");	//Nejhorší z nich je Herek.
	AI_Output(self,other,"DIA_Kyle_Problem_10_09");	//Ten zmetek si myslí, že je jedním z největších drsňáků tady v Kolonii.
	AI_Output(self,other,"DIA_Kyle_Problem_10_10");	//Není nic víc než jenom kopáč, tak jako všichni ostatní tady.
};

var int herek_kickass;

instance DIA_KYLE_HEREK(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = dia_kyle_herek_condition;
	information = dia_kyle_herek_info;
	permanent = 0;
	description = "Co je s tím Herekem?";
};

func int dia_kyle_herek_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Kyle_Problem))
	{
		return 1;
	};
};

func void dia_kyle_herek_info()
{
	AI_Output(other,self,"DIA_Kyle_Herek_15_00");	//Co je s tím Herekem?
	AI_Output(self,other,"DIA_Kyle_Herek_10_01");	//Ten chlap prochází mou chatrčí už několik dní, jako každý druhý zmetek tady.
	AI_Output(self,other,"DIA_Kyle_Herek_10_02");	//Nicméné, Herek si myslí, že se může do mně k tomu ještě pořád navážet.
	AI_Output(self,other,"DIA_Kyle_Herek_10_03");	//Stále mi povídá o tom, co udělal, než ho poslali sem. Jak je drsný.
	AI_Output(self,other,"DIA_Kyle_Herek_10_04");	//Byl bych šťastný kdyby ten zmetek dostal přes držku.
	AI_Output(other,self,"DIA_Kyle_Herek_10_05");	//Mohl bych se o Hereka postarat.
	AI_Output(self,other,"DIA_Kyle_Herek_10_06");	//Ty? To bych chtěl vidět.
	AI_Output(self,other,"DIA_Kyle_Herek_10_07");	//Víš ty co. Pokud nakopeš prdel tomu parchantovi, můžeš procházet mojí chatrčí kdykoliv se ti zamane.
	AI_Output(other,self,"DIA_Kyle_Herek_10_08");	//Nemáš nějakou hmatatelnější odměnu?
	AI_Output(self,other,"DIA_Kyle_Herek_10_09");	//Můžu ti k tomu dát navrh ještě 10 nugetů.
	AI_Output(other,self,"DIA_Kyle_Herek_10_10");	//To zní lépe.
	AI_Output(self,other,"DIA_Kyle_Herek_10_11");	//Postarej se o něj.
	HEREK_KICKASS = LOG_RUNNING;
	Log_CreateTopic(CH1_KYLE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KYLE,LOG_RUNNING);
	B_LogEntry(CH1_KYLE,"Kyle, jeden z kopáčů Starého tábora, má problémy s chlápkem jménem Herek. Herek používá Kyleovu chatu jako průchod a přeje si, abych mu v tom zabránil.");
	VLK_511_Herek.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};

instance DIA_KYLE_SUCCESS(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = dia_kyle_success_condition;
	information = dia_kyle_success_info;
	permanent = 0;
	description = "Postaral jsem se o Hereka.";
};

func int dia_kyle_success_condition()
{
	if((HEREK_KICKASS == LOG_RUNNING) && (VLK_511_Herek.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_KnowsInfo(hero,dia_herek_kyle))
	{
		return 1;
	};
};

func void dia_kyle_success_info()
{
	AI_Output(other,self,"DIA_Kyle_SUCCESS_15_00");	//Postaral jsem se o Hereka.
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_01");	//Opravdu? Doufám, že jsi to tomu zmetkovi pořádně nandal.
	AI_Output(other,self,"DIA_Kyle_SUCCESS_10_02");	//A co moje odměna?
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_03");	//Ach ano, tady máš 10 nugetů.
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_04");	//Odteď můžeš kdykoli použít moji chatu jako průchod.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	HEREK_KICKASS = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_KYLE,LOG_SUCCESS);
	B_LogEntry(CH1_KYLE,"Kyle byl spokojen s tím, jak jsem Herekovi uštědřil lekci. Za odměnu mi dal 10 kusů rudy a povolení používat jeho chatu.");
	B_GiveXP(XP_KYLEPROBLEM);
};

