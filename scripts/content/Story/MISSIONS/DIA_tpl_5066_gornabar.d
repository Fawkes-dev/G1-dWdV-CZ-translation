instance TPL_5066_GORNABAR_EXIT(C_Info)
{
	npc = tpl_5066_gornabar;
	nr = 999;
	condition = tpl_5066_gornabar_exit_condition;
	information = tpl_5066_gornabar_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int tpl_5066_gornabar_exit_condition()
{
	return TRUE;
};

func void tpl_5066_gornabar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance TPL_5066_GORNABAR_GETLOST(C_Info)
{
	npc = tpl_5066_gornabar;
	nr = 1;
	condition = tpl_5066_gornabar_getlost_condition;
	information = tpl_5066_gornabar_getlost_info;
	permanent = 1;
	important = 0;
	description = "Jste zpátky v táboře?";
};

func int tpl_5066_gornabar_getlost_condition()
{
	return TRUE;
};

func void tpl_5066_gornabar_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5066_GorNaBar_15_00");	//Jste zpátky v táboře?
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_01");	//Ach, muž z dolu. Ano, vrátili jsme se do tábora.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_02");	//Poté, co jsi přinesl vejce do tábora, jsem se vrátili s Gor Na Koshem a Gor Na Videm.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_03");	//Vrátil jsem se zpátky ke své práci, kterou jsem měl než mě poslali do dolu.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_04");	//Navzdory všemu, co se stalo, Bratrstvo se stále drží pohromadě.
	AI_StopProcessInfos(self);
};

