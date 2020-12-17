instance Info_Myxir_EXIT(C_Info)
{
	npc = Kdw_601_Myxir;
	nr = 999;
	condition = Info_Myxir_EXIT_Condition;
	information = Info_Myxir_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void Info_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDW_MYXIR_HERODMB(C_Info)
{
	npc = Kdw_601_Myxir;
	nr = 3;
	condition = dia_kdw_myxir_herodmb_condition;
	information = dia_kdw_myxir_herodmb_info;
	permanent = 0;
	important = 1;
};

func int dia_kdw_myxir_herodmb_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_DMB)
	{
		return 1;
	};
};

func void dia_kdw_myxir_herodmb_info()
{
	AI_Output(self,other,"DIA_KDW_Myxir_HeroDMB_15_00");	//Co? Ty ... obrátil ses k temné magii?
	AI_Output(self,other,"DIA_KDW_Myxir_HeroDMB_15_01");	//Saturas z toho nebude mít radost!
	AI_StopProcessInfos(self);
};

