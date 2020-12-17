instance Info_Grd_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Grd_6_EXIT_Condition;
	information = Info_Grd_6_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Grd_6_EXIT_Condition()
{
	return 1;
};

func void Info_Grd_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Grd_6_EinerVonEuchWerden(C_Info)
{
	nr = 1;
	condition = Info_Grd_6_EinerVonEuchWerden_Condition;
	information = Info_Grd_6_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Nepotřebujete jednoho dobrého chlapa?";
};

func int Info_Grd_6_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && (Npc_GetTrueGuild(other) != GIL_EBR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Grd_6_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00");	//Nepotřebujete jednoho dobrého chlapa?
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01");	//Ty musíš být jedním z těch nových, co? Jestli se rozmýšlíš, ke kterému táboru se dát, zkus ty sektářské blázny, těm je fuk, koho zaměstnávají.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02");	//Nikoho nebereme, ale ty bys mohl jít kopat do Starého dolu!
};

instance Info_Grd_6_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Grd_6_WichtigePersonen_Condition;
	information = Info_Grd_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_Grd_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Grd_6_WichtigePersonen_Info()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00");	//Kdo to tady vede?
	if(Npc_GetTrueGuild(other) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_02");	//Jediný kdo tu má větší slovo než Vy, je Gomez.
		AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_03");	//Vypracoval jste se až docela na vrchol.
	}
	else
	{
		AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01");	//Thorus je jedním z těch, kteří hlídají, aby se nic neztratilo. Je dvojka hned po Gomezovi.
		Thorus = Hlp_GetNpc(GRD_200_Thorus);
		Thorus.aivar[AIV_FINDABLE] = TRUE;
	};
};

instance Info_Grd_6_DasLager(C_Info)
{
	nr = 1;
	condition = Info_Grd_6_DasLager_Condition;
	information = Info_Grd_6_DasLager_Info;
	permanent = 1;
	description = "Jsem tady nový.";
};

func int Info_Grd_6_DasLager_Condition()
{
	if(!C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Grd_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00");	//Jsem tady nový.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01");	//Tak uvidíme.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02");	//Jak to jde?
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03");	//Jestli tu budeš dělat problémy, budeš potrestán.
	Info_ClearChoices(Info_Grd_6_DasLager);
	Info_AddChoice(Info_Grd_6_DasLager,"Aha ...",Info_Grd_6_DasLager_Verstehe);
	Info_AddChoice(Info_Grd_6_DasLager,"Co myslíš tím hněvem?",Info_Grd_6_DasLager_WasIstAerger);
};

func void Info_Grd_6_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00");	//Aha ...
	Info_ClearChoices(Info_Grd_6_DasLager);
};

func void Info_Grd_6_DasLager_WasIstAerger()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00");	//Čemu říkáš problémy?
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01");	//Většina kopáčů nám platí za ochranu.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02");	//Pokud se někoho z nich dotkneš, vyřídíme si to s tebou.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03");	//Jestli tě nachytám šmejdit kolem cizích chatrčí..
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04");	//Dobře, dobře. Dám si pozor.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

instance Info_Grd_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Grd_6_DieLage_Condition;
	information = Info_Grd_6_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Grd_6_DieLage_Condition()
{
	return 1;
};

func void Info_Grd_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00");	//Jak to jde?
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"Info_Grd_6_DieLage_06_02");	//Vypadni!
		AI_Output(self,other,"Info_Grd_6_DieLage_06_03");	//Buď rád ty špíno z Nového tábora, že tě na místě nezabiju.
		AI_Output(self,other,"Info_Grd_6_DieLage_06_04");	//Rychle odsud vypadni, než si to rozmyslím.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Grd_6_DieLage_06_05");	//Žádný bandita z Nového tábora nadohled.
		AI_Output(self,other,"Info_Grd_6_DieLage_06_06");	//Nemůže to jít lépe příteli, že ne? Hehe.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Grd_6_DieLage_06_07");	//Co chceš?
		AI_Output(self,other,"Info_Grd_6_DieLage_06_08");	//Jestli chceš někoho ohlupovat, tak zkus kopáče, sektáři.
	}
	else
	{
		AI_Output(self,other,"Info_Grd_6_DieLage_06_01");	//Říkáš si o malér?
	};
};

func void B_AssignAmbientInfos_GRD_6(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Grd_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_DieLage.npc = Hlp_GetInstanceID(slf);
};

