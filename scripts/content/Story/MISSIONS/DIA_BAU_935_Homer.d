instance DIA_Homer_EXIT(C_Info)
{
	npc = BAU_935_Homer;
	nr = 999;
	condition = DIA_Homer_EXIT_Condition;
	information = DIA_Homer_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Homer_EXIT_Condition()
{
	return 1;
};

func void DIA_Homer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Homer_Hello(C_Info)
{
	npc = BAU_935_Homer;
	nr = 1;
	condition = DIA_Homer_Hello_Condition;
	information = DIA_Homer_Hello_Info;
	permanent = 0;
	description = "Hledáš něco?";
};

func int DIA_Homer_Hello_Condition()
{
	return 1;
};

func void DIA_Homer_Hello_Info()
{
	AI_Output(other,self,"DIA_Homer_Hello_15_00");	//Hledáš něco?
	AI_Output(self,other,"DIA_Homer_Hello_02_01");	//Hledám praskliny v hrázi. Řekl bych, že budou někde u základů.
	AI_Output(self,other,"DIA_Homer_Hello_02_02");	//Ta bestie narušuje svými zuby a drápy kameny a dřevěné trámy pod vodou.
	AI_Output(self,other,"DIA_Homer_Hello_02_03");	//Jestli to bude pokračovat, celá hráz bude co nevidět podhrabaná.
};

instance DIA_Homer_BuiltDam(C_Info)
{
	npc = BAU_935_Homer;
	nr = 2;
	condition = DIA_Homer_BuiltDam_Condition;
	information = DIA_Homer_BuiltDam_Info;
	permanent = 0;
	description = "TY jsi tu hráz stavěl?";
};

func int DIA_Homer_BuiltDam_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Homer_Hello))
	{
		return 1;
	};
};

func void DIA_Homer_BuiltDam_Info()
{
	AI_Output(other,self,"DIA_Homer_BuiltDam_15_00");	//TY jsi tu hráz stavěl?
	AI_Output(self,other,"DIA_Homer_BuiltDam_02_01");	//Ano. Stavěl jsem ji tehdy, když jsme zakládali Nový tábor.
	AI_Output(self,other,"DIA_Homer_BuiltDam_02_02");	//Všichni samozřejmě pomáhali, ale já byl stavební mistr.
};

var int Homer_DamLurker;

instance DIA_Homer_WannaHelp(C_Info)
{
	npc = BAU_935_Homer;
	nr = 1;
	condition = DIA_Homer_WannaHelp_Condition;
	information = DIA_Homer_WannaHelp_Info;
	permanent = 0;
	description = "Je tu něco, s čím bych mohl pomoci?";
};

func int DIA_Homer_WannaHelp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Homer_Hello))
	{
		return 1;
	};
};

func void DIA_Homer_WannaHelp_Info()
{
	AI_Output(other,self,"DIA_Homer_WannaHelp_15_00");	//Je tu něco, s čím bych mohl pomoci?
	AI_Output(self,other,"DIA_Homer_WannaHelp_02_01");	//Jistě, zařiď, aby ta bestie přestala podhlodávat moji hráz.
	Homer_DamLurker = LOG_RUNNING;
	Log_CreateTopic(CH1_DamLurker,LOG_MISSION);
	Log_SetTopicStatus(CH1_DamLurker,LOG_RUNNING);
	B_LogEntry(CH1_DamLurker,"Homer mi řekl, že číhavec rozhlodává hráz. Pokud se mi ho podaří zastavit, budou hráz moci opravit.");
};

instance DIA_Homer_Running(C_Info)
{
	npc = BAU_935_Homer;
	nr = 1;
	condition = DIA_Homer_Running_Condition;
	information = DIA_Homer_Running_Info;
	permanent = 0;
	description = "Kde tu bestii najdu?";
};

func int DIA_Homer_Running_Condition()
{
	if(Homer_DamLurker == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Homer_Running_Info()
{
	AI_Output(other,self,"DIA_Homer_Running_15_00");	//Kde tu bestii najdu?
	AI_Output(self,other,"DIA_Homer_Running_02_01");	//Já bych na ní šel na druhou stranu jezera. Tam nikdo nechodí. Tam budou mít nejspíš doupě.
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry(CH1_DamLurker,"Ten číhavec musí mít své hnízdo někde na druhé straně hráze. ");
};

instance DIA_Homer_Success(C_Info)
{
	npc = BAU_935_Homer;
	nr = 2;
	condition = DIA_Homer_Success_Condition;
	information = DIA_Homer_Success_Info;
	permanent = 0;
	description = "Zabil jsem tu bestii!";
};

func int DIA_Homer_Success_Condition()
{
	var C_Npc Lurker;
	Lurker = Hlp_GetNpc(DamLurker);
	PrintDebugString(PD_MISSION,"name: ",Lurker.name);
	PrintDebugInt(PD_MISSION,"hp: ",Lurker.attribute);
	if((Homer_DamLurker == LOG_RUNNING) && Npc_HasItems(hero,ItAt_DamLurker_01))
	{
		return 1;
	};
};

func void DIA_Homer_Success_Info()
{
	AI_Output(other,self,"DIA_Homer_Success_15_00");	//Zabil jsem tu bestii!
	AI_Output(self,other,"DIA_Homer_Success_02_01");	//Skvělé! Vezmu někoho z mužů Rýžového Lorda, aby mi pomohl opravit něco z toho, co poničila.
	AI_Output(self,other,"DIA_Homer_Success_02_02");	//A teď můžu jít konečně spát.
	B_GiveInvItems(other,self,ItAt_DamLurker_01,1);
	Homer_DamLurker = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_DamLurker,LOG_SUCCESS);
	B_LogEntry(CH1_DamLurker,"Číhavec je pryč a Homer může zase klidně spát.");
	B_GiveXP(XP_ReportDeadDamLurker);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Homer_PERM(C_Info)
{
	npc = BAU_935_Homer;
	nr = 2;
	condition = DIA_Homer_PERM_Condition;
	information = DIA_Homer_PERM_Info;
	permanent = 1;
	description = "Je s hrází všechno v pořádku?";
};

func int DIA_Homer_PERM_Condition()
{
	if(Homer_DamLurker == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Homer_PERM_Info()
{
	AI_Output(other,self,"DIA_Homer_PERM_15_00");	//Je s hrází všechno v pořádku?
	AI_Output(self,other,"DIA_Homer_PERM_02_01");	//Je pevná jako hrad, nic ji nerozboří.
};

