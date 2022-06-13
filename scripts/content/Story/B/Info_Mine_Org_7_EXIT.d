instance Info_Mine_Org_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_7_EXIT_Condition;
	information = Info_Mine_Org_7_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Mine_Org_7_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Mine_Org_7_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_Mine_Condition;
	information = Info_Mine_Org_7_Mine_Info;
	permanent = 1;
	description = "Řekni mi něco o táboře.";
};

func int Info_Mine_Org_7_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00");	//Řekni mi něco o táboře.
	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01");	//Tábor? Myslíš tu Kotlinu. Ale není to tak zlé, vážně. rudaři shromažďují rudu, žoldáci drží stráž a my, bandité, je máme pod kontrolou.
};

instance Info_Mine_Org_7_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_WichtigePersonen_Condition;
	information = Info_Mine_Org_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady má na starosti?";
};

func int Info_Mine_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00");	//Kdo to má pak na starosti?
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01");	//To záleží na tom, od koho přijímáš rozkazy.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02");	//Ať je to jak chce, pokud Okyl něco chce, neměl bys nic namítat. Dokáže být pěkně nepříjemný, když se naštve.
};

instance Info_Mine_Org_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_DieLage_Condition;
	information = Info_Mine_Org_7_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Mine_Org_7_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00");	//Jak se máš?
	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01");	//Chlape, hraješ mi na nervy!
};

instance INFO_MINE_ORG_7_KAMPF(C_Info)
{
	nr = 90;
	condition = info_mine_org_7_kampf_condition;
	information = info_mine_org_7_kampf_info;
	permanent = 1;
	description = "(vyprovokovat souboj)";
};

func int info_mine_org_7_kampf_condition()
{
	return 1;
};

func void info_mine_org_7_kampf_info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Kampf_15_00");	//Co kdybych ti nakopal prdel?
	AI_Output(self,other,"Info_Mine_Org_7_Kampf_07_01");	//Co kdybych ti já vrazil pěstí, příteli?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Mine_Org_7(var C_Npc slf)
{
	Info_Mine_Org_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_DieLage.npc = Hlp_GetInstanceID(slf);
	info_mine_org_7_kampf.npc = Hlp_GetInstanceID(slf);
};

