instance Info_Mine_Org_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_6_EXIT_Condition;
	information = Info_Mine_Org_6_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Mine_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Mine_Org_6_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_Mine_Condition;
	information = Info_Mine_Org_6_Mine_Info;
	permanent = 1;
	description = "Co se v tom dole děje?";
};

func int Info_Mine_Org_6_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00");	//Co se v tom dole děje?
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01");	//V tom dole? Chlapi tam zůstávají. Nikdo nechodí dovnitř, nikdo ven.
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02");	//Měl bys být rád, že jsi venku.
};

instance Info_Mine_Org_6_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_WichtigePersonen_Condition;
	information = Info_Mine_Org_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo tady dává rozkazy?";
};

func int Info_Mine_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00");	//Kdo tady dává rozkazy?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01");	//Nikdo mi nedává rozkazy, ale musíš vědět, jak si to zařídit.
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01");	//A jak se to zařídí?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02");	//To je staré tajemství! Ale mezi náma, pro banditu to není nic těžkého.
};

instance Info_Mine_Org_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_DieLage_Condition;
	information = Info_Mine_Org_6_DieLage_Info;
	permanent = 1;
	description = "Nevypadáš, že bys byl právě přepracovaný.";
};

func int Info_Mine_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00");	//Nevypadáš, že bys byl právě přepracovaný.
	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01");	//Já a práce?! Pokud já jsem pracoval, pak to nebylo v Paláci, jestli mi rozumíš.
};

instance INFO_MINE_ORG_6_KAMPF(C_Info)
{
	nr = 90;
	condition = info_mine_org_6_kampf_condition;
	information = info_mine_org_6_kampf_info;
	permanent = 1;
	description = "(vyprovokovat souboj)";
};

func int info_mine_org_6_kampf_condition()
{
	return 1;
};

func void info_mine_org_6_kampf_info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Kampf_15_00");	//Myslím, že ti dám trochu do zubů.
	AI_Output(self,other,"Info_Mine_Org_6_Kampf_07_01");	//Pochybuju, že na to máš, ale můžeš to zkusit.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Mine_Org_6(var C_Npc slf)
{
	Info_Mine_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);
	info_mine_org_6_kampf.npc = Hlp_GetInstanceID(slf);
};

