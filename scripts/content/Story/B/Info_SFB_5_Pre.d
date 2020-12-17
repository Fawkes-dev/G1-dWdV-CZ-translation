instance Info_SFB_5_Pre(C_Info)
{
	nr = 1;
	condition = Info_SFB_5_Pre_Condition;
	information = Info_SFB_5_Pre_Info;
	permanent = 0;
	important = 1;
};

func int Info_SFB_5_Pre_Condition()
{
	return 1;
};

func void Info_SFB_5_Pre_Info()
{
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00");	//Nazdar!
};

instance Info_SFB_5_EXIT(C_Info)
{
	nr = 999;
	condition = Info_SFB_5_EXIT_Condition;
	information = Info_SFB_5_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_SFB_5_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_SFB_5_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_SFB_5_EinerVonEuchWerden_Condition;
	information = Info_SFB_5_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co kdybych se dal k vám?";
};

func int Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00");	//Co kdybych se dal k vám?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01");	//Přidat se k nám? Jako co? Jako nosič vody?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02");	//Ne, jako rudař.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03");	//Podívej, něco ti řeknu: nikdo se DOBROVOLNĚ nestane rudařem.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04");	//Dobrá, když na tom trváš... Jdi a promluv si se Swineym, vsadím se, že má krumpáč nazbyt a že ti ho rád přenechá.
};

instance Info_SFB_5_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_SFB_5_WichtigePersonen_Condition;
	information = Info_SFB_5_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo je tu nejdůležitější?";
};

func int Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00");	//Kdo je tu nejdůležitější?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01");	//Nejdůležitější? Samozřejmě já.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02");	//Myslím, že víš, kdo tady velí.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03");	//Dobře, asi by sis měl promluvit se žoldáky nebo s bandity. K Vodním mágům se nedostaneš.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04");	//Ten velkohubý Swiney se dělá důležitější než je. Přitom akorát rozděluje krumpáče a dělá, co mu nařídí Okyl.
};

instance Info_SFB_5_DasLager(C_Info)
{
	nr = 2;
	condition = Info_SFB_5_DasLager_Condition;
	information = Info_SFB_5_DasLager_Info;
	permanent = 1;
	description = "Co může tábor nabídnout?";
};

func int Info_SFB_5_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00");	//Co může tábor nabídnout?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01");	//Cokoliv, co si zasloužíš. Pro některé tu není nic než práce a pro jiné spousta užívání.
};

instance Info_SFB_5_DieLage(C_Info)
{
	nr = 1;
	condition = Info_SFB_5_DieLage_Condition;
	information = Info_SFB_5_DieLage_Info;
	permanent = 1;
	description = "Jak se tady žije?";
};

func int Info_SFB_5_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00");	//Jak se tady žije?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01");	//Paráda!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02");	//A protože jsme tu tak šťastní, uděláme nejlépe, když odsud vypadneme.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03");	//Co si myslíš, že tohle místo je? Je to vězení a ve vězení nikdo žít nechce.
};

func void B_AssignAmbientInfos_SFB_5(var C_Npc slf)
{
	Info_SFB_5_Pre.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc = Hlp_GetInstanceID(slf);
};

