instance DIA_ARTO_EXIT(C_Info)
{
	npc = EBR_102_Arto;
	nr = 999;
	condition = DIA_ARTO_EXIT_Condition;
	information = DIA_ARTO_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_ARTO_EXIT_Condition()
{
	return 1;
};

func void DIA_ARTO_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ARTO_Hello(C_Info)
{
	npc = EBR_102_Arto;
	nr = 3;
	condition = DIA_ARTO_Hello_Condition;
	information = DIA_ARTO_Hello_Info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int DIA_ARTO_Hello_Condition()
{
	return 1;
};

func void DIA_ARTO_Hello_Info()
{
	AI_Output(other,self,"DIA_ARTO_Hello_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_ARTO_Hello_13_01");	//Jsem Arto.
};

instance DIA_ARTO_What(C_Info)
{
	npc = EBR_102_Arto;
	nr = 3;
	condition = DIA_ARTO_What_Condition;
	information = DIA_ARTO_What_Info;
	permanent = 0;
	description = "Co tady máš na práci?";
};

func int DIA_ARTO_What_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_ARTO_Hello))
	{
		return 1;
	};
};

func void DIA_ARTO_What_Info()
{
	AI_Output(other,self,"DIA_ARTO_What_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_ARTO_What_13_01");	//Jsem Gomezův osobní strážce.
};

instance DIA_ARTO_PERM(C_Info)
{
	npc = EBR_102_Arto;
	nr = 3;
	condition = DIA_ARTO_PERM_Condition;
	information = DIA_ARTO_PERM_Info;
	permanent = 1;
	description = "Ty toho moc nenamluvíš, co?";
};

func int DIA_ARTO_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_ARTO_What))
	{
		return 1;
	};
};

func void DIA_ARTO_PERM_Info()
{
	AI_Output(other,self,"DIA_ARTO_PERM_15_00");	//Ty toho moc nenamluvíš, co?
	AI_Output(self,other,"DIA_ARTO_PERM_13_01");	//Ne.
};

instance DIA_ARTO_SCBARON(C_Info)
{
	npc = EBR_102_Arto;
	nr = 3;
	condition = dia_arto_scbaron_condition;
	information = dia_arto_scbaron_info;
	permanent = 0;
	important = 1;
};

func int dia_arto_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_arto_scbaron_info()
{
	AI_Output(self,other,"DIA_ARTO_SCBARON_15_00");	//Vítej v Gomezově Stráži.
	AI_StopProcessInfos(self);
};

