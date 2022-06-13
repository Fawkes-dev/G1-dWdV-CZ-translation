instance Info_Tpl_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_8_EXIT_Condition;
	information = Info_Tpl_8_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Tpl_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_8_EinerVonEuchWerden_Condition;
	information = Info_Tpl_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Potřebujete spolehlivého muže?";
};

func int Info_Tpl_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && (Npc_GetTrueGuild(other) != GIL_GUR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00");	//Potřebujete spolehlivého muže?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01");	//Pořád hledáme spolehlivé muže. Musíš ale tvrdě pracovat, aby ses zdokonalil. Jen zkušení novicové se mohou stát templáři.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02");	//To je ta největší pocta pro všechny následovníky Spáčova Bratrstva.
};

instance Info_Tpl_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_8_WichtigePersonen_Condition;
	information = Info_Tpl_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_8_WichtigePersonen_Info()
{
	var C_Npc YBerion;
	var C_Npc CorKalom;
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//Kdo to tady vede?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01");	//Děláme to, co řeknou Guru. Sloužit jim je naše povinnost.
		AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02");	//Kdo jsou ti Guru?
		if(Npc_GetTrueGuild(other) == GIL_GUR)
		{
			AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_13");	//Vy mistře, jste jedním z našich Guru.
			AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_14");	//Doufám, že splním své povinnosti, jak požadujete.
		};
		if(Npc_GetTrueGuild(other) != GIL_GUR)
		{
			AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03");	//Y´Berion Osvícený je hlavou Guru. Pod ním jsou Cor Kalom a další.
			YBerion = Hlp_GetNpc(GUR_1200_YBerion);
			CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
			CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
			YBerion.aivar[AIV_FINDABLE] = TRUE;
			CorKalom.aivar[AIV_FINDABLE] = TRUE;
			CorAngar.aivar[AIV_FINDABLE] = TRUE;
		};
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_02");	//Cor Angar je jediný, kdo nám zbyl.
		AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_03");	//Navzdory tomu, co se stalo, mu nadále sloužíme.
	};
};

instance Info_Tpl_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_8_DasLager_Condition;
	information = Info_Tpl_8_DasLager_Info;
	permanent = 1;
	description = "Co mi můžeš říci o táboře?";
};

func int Info_Tpl_8_DasLager_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00");	//Co mi můžeš říci o táboru?
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01");	//Jako nový příchozí můžeš jít v podstatě kam chceš. Nevěrcům však není povolen vstup do Spáčova chrámu.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02");	//Takže choď jen tam, kam smíš. A také nevyrušuj naše pány při meditacích.
};

instance Info_Tpl_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_8_DieLage_Condition;
	information = Info_Tpl_8_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Tpl_8_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//Jak se máš?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01");	//Varuji tě. Nebuď nezdvořilý. Mluvíš s jedním z vyvolených prorokových strážců.
};

func void B_AssignAmbientInfos_Tpl_8(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc = Hlp_GetInstanceID(slf);
};

