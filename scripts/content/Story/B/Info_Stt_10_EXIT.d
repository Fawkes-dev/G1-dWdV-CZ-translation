instance Info_Stt_10_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Stt_10_EXIT_Condition;
	information = Info_Stt_10_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Stt_10_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_10_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Stt_10_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Stt_10_EinerVonEuchWerden_Condition;
	information = Info_Stt_10_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chci být Stínem.";
};

func int Info_Stt_10_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Stt_10_EinerVonEuchWerden_Info()
{
	var C_Npc diego;
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00");	//Chci být Stínem.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01");	//He? Už jsi to říkal Diegovi?
	diego = Hlp_GetNpc(PC_Thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Ne.",Info_Stt_10_EinerVonEuchWerden_Nein);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Ano.",Info_Stt_10_EinerVonEuchWerden_Ja);
};

func void Info_Stt_10_EinerVonEuchWerden_Nein()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00");	//Ještě ne.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01");	//Tak to udělej, najdeš ho u vstupu do hradu.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

func void Info_Stt_10_EinerVonEuchWerden_Ja()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00");	//Jo, udělám.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01");	//Dobře. Jednoduše udělej, co ti řekne. Mně se nic nestane. Tedy, doopravdy ne.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

instance Info_Stt_10_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Stt_10_WichtigePersonen_Condition;
	information = Info_Stt_10_WichtigePersonen_Info;
	permanent = 1;
	description = "Jaké lidi bych tu měl znát?";
};

func int Info_Stt_10_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_10_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00");	//Jaké lidi bych tu měl znát?
	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01");	//Jestli se dostaneš do problémů se stráží, jdi za Gravem. Najdeš ho u koupaliště nedaleko hradní brány. Ten to urovná s tím, s kým bys měl problémy. Nováčkům se to stane rychleji, než by je to napadlo.
};

instance Info_Stt_10_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Stt_10_DasLager_Condition;
	information = Info_Stt_10_DasLager_Info;
	permanent = 1;
	description = "Můžeš mi říci něco o táboře?";
};

func int Info_Stt_10_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_10_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00");	//Co mi můžeš říci o táboru?
	AI_Output(self,other,"Info_Stt_10_DasLager_10_01");	//Myslím, že nejzajímavější místo je tržiště. Když budeš shánět něco speciálního, tam to určitě najdeš.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_02");	//To je to místo pod velkou jižní střechou Vnějšího okruhu.
};

instance Info_Stt_10_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Stt_10_DieLage_Condition;
	information = Info_Stt_10_DieLage_Info;
	permanent = 1;
	description = "Zdar!";
};

func int Info_Stt_10_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_10_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00");	//Zdar!
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_15_01");	//Nemluvím s bastardy z Nového tábora.
		AI_Output(self,other,"Info_Stt_10_DieLage_15_02");	//Vrať se tam, odkud jsi přišel.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_10_02");	//Všechno v pořádku, kolego?
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_15_03");	//Co ode mě chceš?
		AI_Output(self,other,"Info_Stt_10_DieLage_15_04");	//Pokud bys mě chtěl přesvědčit o Spáčovi, přišel jsi na špatné místo, sektáři.
	}
	else
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_10_01");	//Co chceš?
	};
};

func void B_AssignAmbientInfos_Stt_10(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Stt_10_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_DieLage.npc = Hlp_GetInstanceID(slf);
};

