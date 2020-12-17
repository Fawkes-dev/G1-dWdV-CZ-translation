instance Info_Nov_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_3_EXIT_Condition;
	information = Info_Nov_3_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Nov_3_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Nov_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_3_EinerVonEuchWerden_Condition;
	information = Info_Nov_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Jak se můžu přidat k táboru?";
};

func int Info_Nov_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00");	//Jak se můžu přidat k táboru?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01");	//Jednoduchá věc. Prostě tam jdi, příteli.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02");	//Řekni Guru, oni tě provedou.
};

instance INFO_NOV_3_GURUWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_3_guruwerden_condition;
	information = info_nov_3_guruwerden_info;
	permanent = 1;
	description = "Jak se můžu stát Guru?";
};

func int info_nov_3_guruwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_nov_3_guruwerden_info()
{
	AI_Output(other,self,"Info_Nov_3_GuruWerden_15_00");	//Jak se můžu stát Guru?
	AI_Output(self,other,"Info_Nov_3_GuruWerden_03_01");	//O tom rozhoduje jedině Spáč.
	AI_Output(self,other,"Info_Nov_3_GuruWerden_03_02");	//Naslouchej tomu co ti říká, člověče.
};

instance Info_Nov_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_3_WichtigePersonen_Condition;
	information = Info_Nov_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo je tady šéf?";
};

func int Info_Nov_3_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00");	//Kdo je tady šéf?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01");	//Y'Berion! Buď pochválen, Spáči! Dovedl nás na toto slavné místo.
		AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02");	//Toto vše bylo stvořeno skrze jeho vize.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_03");	//Y'berion byl osvícen Spáčem, a teď je s ním !
		AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_04");	//Teď jsme svobodná komunita, bez vůdců. Dokud máme dostatek Trávy z bažin, tak je všechno v pořádku.
	};
};

instance Info_Nov_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_3_DasLager_Condition;
	information = Info_Nov_3_DasLager_Info;
	permanent = 1;
	description = "Je zde něco důležitého, kam bych měl jít?";
};

func int Info_Nov_3_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_3_DasLager_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00");	//Je zde něco důležitého, kam bych měl jít?
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01");	//Je tu Fortuno. Rozdává drogu z bažin všem následovníkům.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02");	//Najdeš ho pod alchymistickou dílnou Cor Kaloma.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Nov_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_3_DieLage_Condition;
	information = Info_Nov_3_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Nov_3_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00");	//Jak se máš?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01");	//Docela dobře, příteli!
};

func void B_AssignAmbientInfos_Nov_3(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	info_nov_3_guruwerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

