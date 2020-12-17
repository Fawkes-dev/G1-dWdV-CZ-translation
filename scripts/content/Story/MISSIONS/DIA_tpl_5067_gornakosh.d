instance TPL_5067_GORNAKOSH_EXIT(C_Info)
{
	npc = tpl_5067_gornakosh;
	nr = 999;
	condition = tpl_5067_gornakosh_exit_condition;
	information = tpl_5067_gornakosh_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int tpl_5067_gornakosh_exit_condition()
{
	return TRUE;
};

func void tpl_5067_gornakosh_exit_info()
{
	AI_StopProcessInfos(self);
};

instance TPL_5067_GORNAKOSH_GETLOST(C_Info)
{
	npc = tpl_5067_gornakosh;
	nr = 1;
	condition = tpl_5067_gornakosh_getlost_condition;
	information = tpl_5067_gornakosh_getlost_info;
	permanent = 1;
	important = 0;
	description = "Co tady děláš?";
};

func int tpl_5067_gornakosh_getlost_condition()
{
	return TRUE;
};

func void tpl_5067_gornakosh_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5067_GorNaKosh_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_01");	//Neznáme se navzájem? Ze Starého dolu?
	AI_Output(other,self,"DIA_TPL_5067_GorNaKosh_13_02");	//Může být.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_03");	//Poté, co jsme dokončili náš úkol ve Starém dole, jsme se vrátili do tábora spolu s Gor Na Barem a Gor Na Videm.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_04");	//Od té doby dohlížíme na tábor stejně jako předtím, než jsme byli posláni do Starého dolu.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_05");	//Ostatní tu také někde budou. Rozhlédni se kolem.
	AI_StopProcessInfos(self);
};

