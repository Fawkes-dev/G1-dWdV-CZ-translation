instance Info_Tpl_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_13_EXIT_Condition;
	information = Info_Tpl_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Tpl_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_13_EinerVonEuchWerden_Condition;
	information = Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chci se stát templářem jako ty.";
};

func int Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && (Npc_GetTrueGuild(other) != GIL_GUR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00");	//Chci se stát templářem jako ty.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01");	//Máš ponětí, co všechno jsem musel vytrpět, abych směl sloužit mezi Spáčovými vyvolenými jako templářská stráž?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02");	//Nemysli si, že se tu budeš jen tak poflakovat a  požívat té největší pocty.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03");	//Ještě než se rozhodneš, měl by ses trochu seznámit se Spáčovým učením.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04");	//To zabere nějaký čas a mělo by to do tebe načerpat nějaké vědomosti.
};

instance Info_Tpl_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_13_WichtigePersonen_Condition;
	information = Info_Tpl_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00");	//Kdo to tady vede?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01");	//Naši Guru jsou Spáčovi vyvolení! Spáč předurčuje náš osud a Guru jej věští.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_02");	//Cor Angar má nyní tábor pod kontrolou. Po Y'Berionovi a Corovi Kalomovi je tím jediným, kdo to dokáže.
	};
};

instance Info_Tpl_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_13_DasLager_Condition;
	information = Info_Tpl_13_DasLager_Info;
	permanent = 1;
	description = "Chtěl bych se podívat do Spáčova chrámu...";
};

func int Info_Tpl_13_DasLager_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00");	//Chtěl bych se podívat do Spáčova chrámu...
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01");	//To je nemyslitelné! Nevěrec v Chrámu! Dokud se nezavážeš Spáčovi sloužit, nebudeš smět do Chrámu vstoupit!
};

instance Info_Tpl_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_13_DieLage_Condition;
	information = Info_Tpl_13_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Tpl_13_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01");	//Od té doby, co jsem se stal jedním z vyvolených ochránců víry, cítím se lépe než kdykoliv předtím.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02");	//To zní honosně...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03");	//Jsi nevěrec. Nerozumíš tomu.
};

func void B_AssignAmbientInfos_Tpl_13(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

