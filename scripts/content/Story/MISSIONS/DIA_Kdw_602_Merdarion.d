instance Info_Merdarion_EXIT(C_Info)
{
	npc = Kdw_602_Merdarion;
	nr = 999;
	condition = Info_Merdarion_EXIT_Condition;
	information = Info_Merdarion_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Merdarion_EXIT_Condition()
{
	return TRUE;
};

func void Info_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDW_MERDARION_HERODMB(C_Info)
{
	npc = Kdw_602_Merdarion;
	nr = 3;
	condition = dia_kdw_merdarion_herodmb_condition;
	information = dia_kdw_merdarion_herodmb_info;
	permanent = 0;
	important = 1;
};

func int dia_kdw_merdarion_herodmb_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_DMB)
	{
		return 1;
	};
};

func void dia_kdw_merdarion_herodmb_info()
{
	AI_Output(self,other,"DIA_KDW_Merdarion_HeroDMB_15_00");	//Změnil jsi se od doby, co jsem tě viděl naposledy ...
	AI_Output(self,other,"DIA_KDW_Merdarion_HeroDMB_15_01");	//Nemůžu přesně říci co, ale něco je jiného ...
	AI_StopProcessInfos(self);
};

