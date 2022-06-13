instance Info_Sld_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Sld_8_EXIT_Condition;
	information = Info_Sld_8_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Sld_8_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Sld_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Sld_8_EinerVonEuchWerden_Condition;
	information = Info_Sld_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Potřebujete spolehlivého muže?";
};

func int Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00");	//Potřebujete spolehlivého muže?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01");	//Lee nechce, aby se někdo dával k žoldákům, dokud tu nějaký čas nepobude a nezíská dost zkušeností.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02");	//Jestli chceš zůstat v táboře, musíš si získat respekt u banditů.
};

instance Info_Sld_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Sld_8_WichtigePersonen_Condition;
	information = Info_Sld_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_8_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00");	//Kdo to tady vede?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01");	//My žoldáci jdeme všichni s Leem. Uzavřeli jsme s mágy dohodu, budeme je chránit a oni nás odtud dostanou ven.
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02");	//Takže tu ve skutečnosti velí mágové?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03");	//Ani náhodou. V táboře nevelí nikdo. Většina lidí jsou chlapíci, kteří nemohli nebo nechtěli být ve Starém táboře.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04");	//Všichni si tady hledíme svého. Ale v jednom jsme zajedno: Je lepší dát všechnu rudu na hromadu a vyhodit ji do vzduchu, než ji cpát do chřtánu tomu zpropadenému králi!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Sld_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Sld_8_DasLager_Condition;
	information = Info_Sld_8_DasLager_Info;
	permanent = 1;
	description = "Co mi můžeš říci o táboře?";
};

func int Info_Sld_8_DasLager_Condition()
{
	if(!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};

func void Info_Sld_8_DasLager_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00");	//Co mi můžeš říci o táboru?
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01");	//Dávej si tu pozor. V táboře je spousta hrdlořezů.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02");	//Máme tu několik nepsaných zákonů. Zaprvé: jen žoldáci smějí vstoupit na území mágů.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03");	//Zadruhé: pokusíš se přiblížit k haldě rudy a jsi mrtvý muž. Zatřetí: nezkoušej se dostat do baru na jezeře.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04");	//Abys věděl, je to bar banditů a ti nemají rádi, když se tam ukazují nováčci.
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Sld_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Sld_8_DieLage_Condition;
	information = Info_Sld_8_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Sld_8_DieLage_Condition()
{
	return 1;
};

func void Info_Sld_8_DieLage_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00");	//Jak to jde?
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_02");	//Co ode mě chceš, bandito?
		AI_Output(self,other,"Info_Sld_8_DieLage_08_03");	//Hlavně se drž dál od mých věcí, jasný?
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_04");	//Špatně. Dokud mi tu budeš zaclánět.
		AI_Output(self,other,"Info_Sld_8_DieLage_08_05");	//Takže koukej odsud vypadnout.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_06");	//Jsi z Tábora z bažin, že?
		AI_Output(self,other,"Info_Sld_8_DieLage_08_07");	//Dávej si pozor, aby ti ji banditi neukradli.
	}
	else if(Npc_GetTrueGuild(other) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_08");	//Přišel jsi mně vystřídat na stráži?
		AI_Output(other,self,"Info_Sld_8_DieLage_08_09");	//Ne nepřišel.
		AI_Output(self,other,"Info_Sld_8_DieLage_08_10");	//Sakra, doufal jsem, že bych si mohl u ohně dát doušek piva.
		AI_Output(self,other,"Info_Sld_8_DieLage_08_11");	//Pak mi tam alespoň něco nech, ano? Hehe.
	}
	else
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_01");	//Jako vždycky. Staráme se, aby se nikdo nepřibližoval k mágům a k rudě.
		Cronos = Hlp_GetNpc(KDW_604_Cronos);
		Cronos.aivar[AIV_FINDABLE] = TRUE;
	};
};

instance Info_Sld_8_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Sld_8_Krautprobe_Condition;
	information = Info_Sld_8_Krautprobe_Info;
	permanent = 1;
	description = "Mám tu trochu drogy z bažin. Dáš si?";
};

func int Info_Sld_8_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Sld_8_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00");	//Mám tu trochu drogy z bažin. Dáš si?
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
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01");	//Proč ne. Dám ti 10 nugetů.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02");	//Jdi a řekni i ostatním chlapům, určitě budou chtít taky.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00");	//Nejdřív mi ukaž drogu. Žádnou nemáš, viď?
	};
};

func void B_AssignAmbientInfos_Sld_8(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Sld_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

