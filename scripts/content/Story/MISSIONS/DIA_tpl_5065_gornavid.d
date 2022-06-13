instance TPL_5065_GORNAVID_EXIT(C_Info)
{
	npc = tpl_5065_gornavid;
	nr = 999;
	condition = tpl_5065_gornavid_exit_condition;
	information = tpl_5065_gornavid_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int tpl_5065_gornavid_exit_condition()
{
	return TRUE;
};

func void tpl_5065_gornavid_exit_info()
{
	AI_StopProcessInfos(self);
};

instance TPL_5065_GORNAVID_GETLOST(C_Info)
{
	npc = tpl_5065_gornavid;
	nr = 1;
	condition = tpl_5065_gornavid_getlost_condition;
	information = tpl_5065_gornavid_getlost_info;
	permanent = 1;
	important = 0;
	description = "Co tady děláš?";
};

func int tpl_5065_gornavid_getlost_condition()
{
	return TRUE;
};

func void tpl_5065_gornavid_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5065_GorNaVid_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_01");	//Neobtěžuj mě, musím dělat svou práci.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_02");	//Ach, jsi to ty! Muž, který nám přinesl vejce Královny důlních červů.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_03");	//Vrátili jsme se do tábora v bažinách krátce poté, co jsi z dolu vynesl vajíčka.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_04");	//Naše poslání bylo sbírání výměšku. Poté co jsi vyčistil hnízdo, nebyl důvod zůstavat v dole.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_05");	//Teď jsme zpět v táboře a vrátíme se k úkolům, jenž jsme měli, před službou v dolu.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_06");	//Gor Na Bar a Gor Na Kosh jsou také zpátky v táboře, když se porozhlédneš, určitě je tu najdeš.
	AI_StopProcessInfos(self);
};

