instance Info_Nov_5_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_5_EXIT_Condition;
	information = Info_Nov_5_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Nov_5_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Nov_5_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_5_EinerVonEuchWerden_Condition;
	information = Info_Nov_5_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Jak se můžu přidat k táboru?";
};

func int Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00");	//Jak se můžu přidat k táboru?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01");	//Není nic jednoduššího. Prostě řekneš pár mladým Guru. Pomůžou ti.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02");	//Bude se ti tu líbit, uvidíš.
};

instance INFO_NOV_5_GURUWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_5_guruwerden_condition;
	information = info_nov_5_guruwerden_info;
	permanent = 1;
	description = "Jak se můžu přidat ke Guru?";
};

func int info_nov_5_guruwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_nov_5_guruwerden_info()
{
	AI_Output(other,self,"Info_Nov_5_GuruWerden_15_00");	//Jak se můžu přidat ke Guru?
	AI_Output(self,other,"Info_Nov_5_GuruWerden_05_01");	//To není tak snadné. Nejdříve musíš obhájit své místo mezi novici, snaž se být co nejvíc užitečný.
	AI_Output(self,other,"Info_Nov_5_GuruWerden_05_02");	//Pak si tě Y'berion možná vybere.
};

instance Info_Nov_5_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_5_WichtigePersonen_Condition;
	information = Info_Nov_5_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00");	//Kdo to tady vede?
	if(Kapitel <= 2)
	{
		if(Npc_GetTrueGuild(other) != GIL_GUR)
		{
			AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01");	//Guru mají všechno pod kontrolou. Pokud ale na sebe nebudeš přitahovat pozornost, nechají tě na pokoji.
		}
		else if(Npc_GetTrueGuild(other) == GIL_GUR)
		{
			AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_03");	//Mistře. Vy tomu tady velíte.
			AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_04");	//Doufám, že splním své úkoly uspokojivě a naplním Vás hrdostí.
		};
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_02");	//Cor Angar je jediný kdo nám zůstal. Y'berion zemřel a Cor Kalom odešel.
	};
};

instance Info_Nov_5_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_5_DasLager_Condition;
	information = Info_Nov_5_DasLager_Info;
	permanent = 1;
	description = "Co mi můžeš říci o táboře?";
};

func int Info_Nov_5_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_5_DasLager_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00");	//Co mi můžeš říci o táboru?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01");	//Je to nejlepší místo v celé téhle proklaté kolonii.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02");	//Dokonce i když nebudeš věřit Spáčovu učení, dostaneš svůj denní příděl drogy z bažin. Všechno, co musíš udělat, je říci si Fortunovi.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03");	//Kde ho najdu?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04");	//Dole pod dílnou Cora Kaloma, kousek od velkého templářského dvora.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Nov_5_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_5_DieLage_Condition;
	information = Info_Nov_5_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Nov_5_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01");	//Nemůžu si stěžovat. Ty jsi tady nový?
	if(Kapitel == 1)
	{
		AI_Output(other,self,"Info_Nov_5_DieLage_15_02");	//Jen jsem právě přišel.
	}
	else
	{
		AI_Output(other,self,"Info_Nov_5_DieLage_15_03");	//Ne, už tu nějakou tu dobu jsem.
	};
};

func void B_AssignAmbientInfos_Nov_5(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	info_nov_5_guruwerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc = Hlp_GetInstanceID(slf);
};

