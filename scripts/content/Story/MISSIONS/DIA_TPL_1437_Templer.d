instance Tpl_1437_Templer_Exit(C_Info)
{
	npc = TPL_1437_Templer;
	nr = 999;
	condition = Tpl_1437_Templer_Exit_Condition;
	information = Tpl_1437_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1437_Templer_Exit_Condition()
{
	return TRUE;
};

func void Tpl_1437_Templer_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Tpl_1437_Templer_NERV(C_Info)
{
	npc = TPL_1437_Templer;
	condition = Tpl_1437_Templer_NERV_Condition;
	information = Tpl_1437_Templer_NERV_Info;
	important = 0;
	permanent = 0;
	description = "Co se děje?";
};

func int Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};

func void Tpl_1437_Templer_NERV_Info()
{
	AI_Output(other,self,"Tpl_1437_Templer_NERV_Info_15_01");	//Co se děje?
	AI_Output(self,other,"Tpl_1437_Templer_NERV_Info_13_02");	//Poslouchej, opravdu tady musíš každého otravovat?
	AI_StopProcessInfos(self);
};

instance Tpl_1437_Templer_LEAVE(C_Info)
{
	npc = TPL_1437_Templer;
	condition = Tpl_1437_Templer_LEAVE_Condition;
	information = Tpl_1437_Templer_LEAVE_Info;
	important = 0;
	permanent = 0;
	description = "Všechno v pořádku?";
};

func int Tpl_1437_Templer_LEAVE_Condition()
{
	if(Npc_KnowsInfo(other,Tpl_1437_Templer_NERV))
	{
		return TRUE;
	};
};

func void Tpl_1437_Templer_LEAVE_Info()
{
	AI_Output(other,self,"Tpl_1437_Templer_LEAVE_Info_15_01");	//Všechno v pořádku?
	AI_Output(self,other,"Tpl_1437_Templer_LEAVE_Info_13_02");	//Chci svůj klid, jasný? Tak se kliď a dělej něco - jiného!
	AI_StopProcessInfos(self);
};

instance Tpl_1437_Templer_LEAVENOW(C_Info)
{
	npc = TPL_1437_Templer;
	condition = Tpl_1437_Templer_LEAVENOW_Condition;
	information = Tpl_1437_Templer_LEAVENOW_Info;
	important = 0;
	permanent = 0;
	description = "Ne, nerozumím ti!";
};

func int Tpl_1437_Templer_LEAVENOW_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1437_Templer_LEAVE))
	{
		return TRUE;
	};
};

func void Tpl_1437_Templer_LEAVENOW_Info()
{
	AI_Output(other,self,"Tpl_1437_Templer_LEAVENOW_Info_15_01");	//Ne, nerozumím ti!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_02");	//Dobrá, pokusím se ti to teda vysvětlit.
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_03");	//Vypadni!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_04");	//Odejdi z dolu!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_05");	//NIKDY mě už neoslovuj!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_06");	//Vypadni! Nech mě o samotě!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_07");	//ZTRAŤ SE!!
	AI_StopProcessInfos(self);
};

instance TPL_1437_TEMPLER_HI(C_Info)
{
	npc = TPL_1437_Templer;
	condition = tpl_1437_templer_hi_condition;
	information = tpl_1437_templer_hi_info;
	important = 0;
	permanent = 0;
	description = "Hej, ty!";
};

func int tpl_1437_templer_hi_condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1437_Templer_LEAVENOW))
	{
		return TRUE;
	};
};

func void tpl_1437_templer_hi_info()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00");	//Hej, ty!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

