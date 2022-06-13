instance Info_Stt_12_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Stt_12_EXIT_Condition;
	information = Info_Stt_12_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Stt_12_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Stt_12_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Stt_12_EinerVonEuchWerden_Condition;
	information = Info_Stt_12_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chtěl bych se dát ke Stínům.";
};

func int Info_Stt_12_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Stt_12_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00");	//Chtěl bych se dát ke Stínům.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01");	//Oh. Pak bys měl vědět, že Gomez neodpouští chyby. Jestli chceš být jedním z nás, musíš být připravený jít za ním do ohně!
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02");	//Přijal jen polovinu těch, co to zkoušeli.
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03");	//Co se stalo s těmi, kteří neuspěli?
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04");	//Nejspíš sedí v Novém táboře a přežvykují rýži. Hahaha.
};

instance Info_Stt_12_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Stt_12_WichtigePersonen_Condition;
	information = Info_Stt_12_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo je tady šéf?";
};

func int Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_12_WichtigePersonen_Info()
{
	var C_Npc diego;
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00");	//Kdo je tady šéf?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_02");	//Vy jste šéf. Pokud máte něco na práci, tak sem s tím.
	}
	else
	{
		AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01");	//Za hlavu Stínů se dá považovat Diego. Ale o tom, kdo se může setkat s Gomezem, rozhoduje Thorus.
		diego = Hlp_GetNpc(PC_Thief);
		diego.aivar[AIV_FINDABLE] = TRUE;
		Thorus = Hlp_GetNpc(GRD_200_Thorus);
		Thorus.aivar[AIV_FINDABLE] = TRUE;
	};
};

instance Info_Stt_12_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Stt_12_DasLager_Condition;
	information = Info_Stt_12_DasLager_Info;
	permanent = 1;
	description = "Chci vědět, co tenhle tábor může nabídnout.";
};

func int Info_Stt_12_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_12_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_12_DasLager_15_00");	//Chci vědět, co tenhle tábor může nabídnout.
	AI_Output(self,other,"Info_Stt_12_DasLager_12_01");	//Pak se raději zeptej kopáčů. Stejně nemají celý den co na práci.
};

instance Info_Stt_12_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Stt_12_DieLage_Condition;
	information = Info_Stt_12_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Stt_12_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_12_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_12_DieLage_15_00");	//Jak to jde?
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_15_01");	//Nemluvím s bastardy z Nového tábora.
		AI_Output(self,other,"Info_Stt_10_DieLage_15_02");	//Vrať se tam, odkud jsi přišel.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Stt_12_DieLage_14_01");	//Všechno je v pořádku. Není nad to být tady v Kolonii jedním z Gomezových mužů. Nemám pravdu? Hehe.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_77_03");	//Kdo jsi, jeden z těch bláznivejch sektářů?
		AI_Output(self,other,"Info_Stt_10_DieLage_85_04");	//Chceš se mnou mluvit o Spáčově učení? Člověče, nesnaž se mě naštvat.
	}
	else
	{
		AI_Output(self,other,"Info_Stt_12_DieLage_12_01");	//Co chceš?
	};
};

func void B_AssignAmbientInfos_Stt_12(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Stt_12_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DieLage.npc = Hlp_GetInstanceID(slf);
};

