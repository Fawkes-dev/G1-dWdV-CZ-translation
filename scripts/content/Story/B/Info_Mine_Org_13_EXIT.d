instance Info_Mine_Org_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_13_EXIT_Condition;
	information = Info_Mine_Org_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Mine_Org_13_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Mine_Org_13_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_13_Mine_Condition;
	information = Info_Mine_Org_13_Mine_Info;
	permanent = 1;
	description = "Řekni mi něco o táboře.";
};

func int Info_Mine_Org_13_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00");	//Řekni mi něco o táboře.
	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01");	//Ta díra ve skále nás odsud dostane. Jakmile budeme mít dost rudy, může nám být Starý tábor ukradený.
};

instance Info_Mine_Org_13_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_13_WichtigePersonen_Condition;
	information = Info_Mine_Org_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo tady dává rozkazy?";
};

func int Info_Mine_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00");	//Kdo tady dává rozkazy?
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01");	//Okyl to tady vede.
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02");	//Nás bandity ale obvykle nechává na pokoji.
};

instance Info_Mine_Org_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_13_DieLage_Condition;
	information = Info_Mine_Org_13_DieLage_Info;
	permanent = 1;
	description = "Jsi v pořádku?";
};

func int Info_Mine_Org_13_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00");	//Všechno v pořádku?
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD))
	{
		AI_Output(self,other,"Info_Mine_Sld_11_DieLage_15_01");	//Není to vůbec dobré.
		AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_02");	//Alespoň ne, když se tu plíží Gomezovi lidé.
	}
	else
	{
		AI_Output(self,other,"Info_Mine_Org_13_DieLage_17_01");	//Člověče vypadni, co mě otravuješ?
	};
};

instance INFO_MINE_ORG_13_KAMPF(C_Info)
{
	nr = 90;
	condition = info_mine_org_13_kampf_condition;
	information = info_mine_org_13_kampf_info;
	permanent = 1;
	description = "(vyprovokovat souboj)";
};

func int info_mine_org_13_kampf_condition()
{
	return 1;
};

func void info_mine_org_13_kampf_info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Kampf_15_00");	//Asi ti budu muset napravit úsměv.
	AI_Output(self,other,"Info_Mine_Org_13_Kampf_07_01");	//Chceš se se mnou zahrávat? Pojď sem. Hehe.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Mine_Org_13(var C_Npc slf)
{
	Info_Mine_Org_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_DieLage.npc = Hlp_GetInstanceID(slf);
	info_mine_org_13_kampf.npc = Hlp_GetInstanceID(slf);
};

