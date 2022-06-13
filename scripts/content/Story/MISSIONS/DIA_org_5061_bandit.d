instance ORG_5061_BANDIT_EXIT(C_Info)
{
	npc = org_5061_bandit;
	nr = 999;
	condition = org_5061_bandit_exit_condition;
	information = org_5061_bandit_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int org_5061_bandit_exit_condition()
{
	return TRUE;
};

func void org_5061_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};

instance ORG_5061_BANDIT_GETLOST(C_Info)
{
	npc = org_5061_bandit;
	nr = 1;
	condition = org_5061_bandit_getlost_condition;
	information = org_5061_bandit_getlost_info;
	permanent = 1;
	important = 0;
	description = "Jak to jde?";
};

func int org_5061_bandit_getlost_condition()
{
	return TRUE;
};

func void org_5061_bandit_getlost_info()
{
	AI_Output(other,self,"DIA_Shrike_Hello_15_00");	//Jak to jde?
	AI_OutputSVM(self,other,"$NotNow");
};

