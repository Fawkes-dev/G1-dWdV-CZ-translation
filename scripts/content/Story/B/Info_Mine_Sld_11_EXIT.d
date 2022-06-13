instance Info_Mine_Sld_11_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Sld_11_EXIT_Condition;
	information = Info_Mine_Sld_11_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Mine_Sld_11_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Mine_Sld_11_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Mine_Sld_11_EinerVonEuchWerden_Condition;
	information = Info_Mine_Sld_11_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Jak se můžu dát k vám?";
};

func int Info_Mine_Sld_11_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00");	//Jak se můžu dát k vám?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01");	//Když chceš být jedním z nás, musíš si vysloužit uznání.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02");	//Běž a dělej, jak nejlíp umíš, a pak ti dovolí sloužit v Kotlině.
};

instance Info_Mine_Sld_11_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Sld_11_WichtigePersonen_Condition;
	information = Info_Mine_Sld_11_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo tady dává rozkazy?";
};

func int Info_Mine_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00");	//Kdo tady dává rozkazy?
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01");	//Tady dělá každý to, co řekne Okyl. Zná tady v táboře všechny.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02");	//Takže jestli provedeš něco hloupého, mágové Vody v Novém táboře se o tom dovědí.
};

instance Info_Mine_Sld_11_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Mine_Sld_11_DasLager_Condition;
	information = Info_Mine_Sld_11_DasLager_Info;
	permanent = 1;
	description = "Děje se tu něco zvláštního?";
};

func int Info_Mine_Sld_11_DasLager_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00");	//A nic zvláštního se tu neděje?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01");	//Nic než pekelné problémy, pokud něco hloupého provedeš.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02");	//Jo, další problémy, pokud se pokusíš dostat do dolu nebo přes bránu bez povolení.
};

instance Info_Mine_Sld_11_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Sld_11_DieLage_Condition;
	information = Info_Mine_Sld_11_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Mine_Sld_11_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00");	//Jak to jde?
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD))
	{
		AI_Output(self,other,"Info_Mine_Sld_11_DieLage_15_01");	//Není to vůbec dobré.
		AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_02");	//Alespoň ne, když se tu plíží Gomezovi lidé.
		AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_03");	//Tak vypadni z pole.
	}
	else
	{
		AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01");	//Je klid. Až moc klid na můj vkus.
	};
};

func void B_AssignAmbientInfos_Mine_Sld_11(var C_Npc slf)
{
	Info_Mine_Sld_11_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DieLage.npc = Hlp_GetInstanceID(slf);
};

