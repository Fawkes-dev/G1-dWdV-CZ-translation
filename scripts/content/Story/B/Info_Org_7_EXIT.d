instance Info_Org_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_7_EXIT_Condition;
	information = Info_Org_7_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Org_7_EXIT_Condition()
{
	return 1;
};

func void Info_Org_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Org_7_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_7_EinerVonEuchWerden_Condition;
	information = Info_Org_7_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co musím udělat, abych se mohl přidat k táboru?";
};

func int Info_Org_7_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_7_EinerVonEuchWerden_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00");	//Co musím udělat, abych se mohl přidat k táboru?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01");	//Můžeš se dát k naší tlupě. Ale nejdřív se musíš postavit Gomezovi.
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02");	//Jak to mám udělat?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03");	//Být tebou, vzal bych něco důležitého z Starého tábora nebo ze Starého dolu a dal to Laresovi.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Org_7_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_7_WichtigePersonen_Condition;
	information = Info_Org_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo je váš vůdce?";
};

func int Info_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_7_WichtigePersonen_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00");	//Kdo je váš vůdce?
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01");	//Lares je hlava tlupy. Většina lidí ho uznává.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02");	//Ten nám ale neříká, co dělat.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Org_7_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_7_DasLager_Condition;
	information = Info_Org_7_DasLager_Info;
	permanent = 1;
	description = "Co mi můžeš říci o táboře?";
};

func int Info_Org_7_DasLager_Condition()
{
	return 1;
};

func void Info_Org_7_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_7_DasLager_15_00");	//Co mi můžeš říci o táboru?
	AI_Output(self,other,"Info_Org_7_DasLager_07_01");	//Je to jakási komunita pro komunitu, jestli mi rozumíš. Všichni si děláme, co chceme, ale je nás tu tolik, že nás Gomez jentak nevyhladí.
	if(Kapitel <= 4)
	{
		AI_Output(self,other,"Info_Org_7_DasLager_07_02");	//Ačkoli je to přesně to, co by nejraději udělal.
		AI_Output(other,self,"Info_Org_7_DasLager_15_03");	//Co vlastně máte s Gomezem?
		AI_Output(self,other,"Info_Org_7_DasLager_07_04");	//Okrademe ho!
	}
	else if(Kapitel >= 5)
	{
		AI_Output(self,other,"Info_Org_7_DasLager_07_05");	//Alespoň si to myslela většina z nás, než nám zabrali Svobodný důl.
	};
};

instance Info_Org_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_7_DieLage_Condition;
	information = Info_Org_7_DieLage_Info;
	permanent = 1;
	description = "Co se tu děje?";
};

func int Info_Org_7_DieLage_Condition()
{
	return 1;
};

func void Info_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_7_DieLage_15_00");	//Co se tu děje?
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"Info_Org_7_DieLage_06_04");	//Jsi v naší tlupě nový, že?
		AI_Output(self,other,"Info_Org_7_DieLage_06_05");	//Hehe. Možná, že my dva spolu budeme bojovat proti Gomezovým lidem.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Org_7_DieLage_07_06");	//Jdi do prdele!
		AI_Output(self,other,"Info_Org_7_DieLage_07_07");	//Nemluvím s Gomezovými lidmi.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Org_7_DieLage_06_08");	//Vypadáš jako někdo ze sektovního tábora.
		AI_Output(self,other,"Info_Org_7_DieLage_06_09");	//Ani nezačínej s těmi kravinami o Spáčovi, ale pokud máš nějaké kuřivo, tak jsem jedno ucho.
	}
	else if(Npc_GetTrueGuild(other) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Org_7_DieLage_06_10");	//Oh, jeden z Leeových chlapů.
		AI_Output(self,other,"Info_Org_7_DieLage_06_11");	//Co se děje? Chceš zkontrolovat, jestli jsem ukradl nějakou rudu?
		AI_Output(self,other,"Info_Org_7_DieLage_06_12");	//Nedělej si starosti, já vím, jak si obstarat rudu.
	}
	else
	{
		AI_Output(self,other,"Info_Org_7_DieLage_07_01");	//Tys tady asi ještě nebyl, viď?
		AI_Output(self,other,"Info_Org_7_DieLage_07_02");	//Mágové se už léta chystají k odstřelení rudné haldy. Říkají, že už to nebude dlouho trvat.
		AI_Output(self,other,"Info_Org_7_DieLage_07_03");	//Tak se aspoň ukáže cesta. Když se vezme v úvahu to množství rudonosné horniny, kterou rudaři tak dlouho shromažďovali.
	};
};

instance Info_Org_7_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_7_Krautprobe_Condition;
	information = Info_Org_7_Krautprobe_Info;
	permanent = 1;
	description = "Chceš trochu drogy z bažin?";
};

func int Info_Org_7_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_7_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00");	//Chceš trochu drogy z bažin?
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01");	//Dám ti za ní 10 nugetů, tady jsou.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02");	//Až se jí zase budeš potřebovat zbavit, přijď za mnou.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_7_Krautprobe_No_Joint_07_00");	//Kde? Žádnou drogu tu nevidím.
	};
};

instance INFO_ORG_7_KAMPF(C_Info)
{
	nr = 90;
	condition = info_org_7_kampf_condition;
	information = info_org_7_kampf_info;
	permanent = 1;
	description = "(vyprovokovat souboj)";
};

func int info_org_7_kampf_condition()
{
	return 1;
};

func void info_org_7_kampf_info()
{
	AI_Output(other,self,"Info_Org_7_Kampf_15_00");	//Myslím, že už ti dlouho někdo jednu vrazil.
	AI_Output(self,other,"Info_Org_7_Kampf_07_01");	//Co? Pojď sem, zmetku. Ukážu ti, kdo komu vrazí.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Org_7(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_DieLage.npc = Hlp_GetInstanceID(slf);
	info_org_7_kampf.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

