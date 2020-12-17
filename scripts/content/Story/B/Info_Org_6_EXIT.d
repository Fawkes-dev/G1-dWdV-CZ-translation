instance Info_Org_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_6_EXIT_Condition;
	information = Info_Org_6_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Org_6_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_6_EinerVonEuchWerden_Condition;
	information = Info_Org_6_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chci se k vám přidat!";
};

func int Info_Org_6_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_6_EinerVonEuchWerden_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00");	//Chci se k vám přidat!
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01");	//Lares rozhoduje, kdo se k tlupě přidá.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02");	//To ale budeš potřebovat sakra dobrý důvod, jestli se k němu chceš dostat.
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03");	//Například?
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04");	//Například někoho, kdo tě k němu posílá.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Org_6_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_6_WichtigePersonen_Condition;
	information = Info_Org_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo je šéf?";
};

func int Info_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_6_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00");	//Kdo je šéf?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01");	//Tys právě přišel ze Starého tábora, co?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02");	//Tady není žádný šéf! Ten prokletý Lee se nás snaží držet na uzdě, ale my si děláme, co chceme.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03");	//Jestli máme něco jako šéfa, pak je to Lares. A ten má dost rozumu na to, aby nikomu do jeho věcí nemluvil!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Org_6_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_6_DasLager_Condition;
	information = Info_Org_6_DasLager_Info;
	permanent = 1;
	description = "Je něco, co bych měl vědět o tomhle místě?";
};

func int Info_Org_6_DasLager_Condition()
{
	return 1;
};

func void Info_Org_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_6_DasLager_15_00");	//Je něco, co bych měl o tomhle místě vědět?
	AI_Output(self,other,"Info_Org_6_DasLager_06_01");	//Uprostřed téhle jeskyně je velká kaverna plná rudy. Ale jestli přemýšlíš, jak se k ní dostat, tak na to zapomeň!
	AI_Output(self,other,"Info_Org_6_DasLager_06_02");	//Sám jsem se o to jednou pokoušel, ale žoldáci to tu ve dne v noci střeží.
};

instance Info_Org_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_6_DieLage_Condition;
	information = Info_Org_6_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_6_DieLage_15_00");	//Jak se máš?
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_03");	//Čekám až oznámíš plány k dalšímu přepadení.
		AI_Output(self,other,"Info_Org_6_DieLage_06_04");	//Na tvém místě bych to udělal, kolego.
		AI_Output(self,other,"Info_Org_6_DieLage_06_05");	//Prochlastáme rudu společně na jezeře, hehe.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_06");	//Co se staráš ty šmejde!
		AI_Output(self,other,"Info_Org_6_DieLage_06_07");	//Jestli si chceš s někým promluvit, proč se nevrátíš ke svým přátelům ve Starém táboře?
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_08");	//Ty jsi jeden z těch sektářských špiónu, že?
		AI_Output(self,other,"Info_Org_6_DieLage_06_09");	//Máš u sebe nějakou trávu, dal bych si kdybys měl.
	}
	else if(Npc_GetTrueGuild(other) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_10");	//Proč se mé ptáš žoldnéři, neboj držím se dál od rudné haldy.
		AI_Output(self,other,"Info_Org_6_DieLage_06_11");	//Raději dávej pozor aby se neobohatilo na náš úkor některé z těch prasat ze Starého tábora.
	}
	else
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_01");	//Člověče! Co si myslíš? Celý den se cpát rýží a celou dobu čekat na příležitost, jak se dostat k nějaké rudě.
		AI_Output(self,other,"Info_Org_6_DieLage_06_02");	//Pak hurá do baru a naleju se až po okraj rýžovou pálenkou!
	};
};

instance Info_Org_6_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_6_Krautprobe_Condition;
	information = Info_Org_6_Krautprobe_Info;
	permanent = 1;
	description = "Mám tu trochu drogy z bažin. Dáš si?";
};

func int Info_Org_6_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_6_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//Mám tu trochu drogy z bažin. Dáš si?
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
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01");	//Jasně. Tady je 10 nugetů.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02");	//Až budeš mít další, přijď zase, jo?
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_6_Krautprobe_No_Joint_06_00");	//Kde? Žádnou drogu tu nevidím.
	};
};

instance INFO_ORG_6_KAMPF(C_Info)
{
	nr = 90;
	condition = info_org_6_kampf_condition;
	information = info_org_6_kampf_info;
	permanent = 1;
	description = "(vyprovokovat souboj)";
};

func int info_org_6_kampf_condition()
{
	return 1;
};

func void info_org_6_kampf_info()
{
	AI_Output(other,self,"Info_Org_6_Kampf_15_00");	//Zasloužil bys dostat do zubů.
	AI_Output(self,other,"Info_Org_6_Kampf_07_01");	//Stáhnu tě z kůže, chlapečku.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Org_6(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);
	info_org_6_kampf.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

