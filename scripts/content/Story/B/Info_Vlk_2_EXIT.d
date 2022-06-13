instance Info_Vlk_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_2_EXIT_Condition;
	information = Info_Vlk_2_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Vlk_2_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_2_EinerVonEuchWerden_Condition;
	information = Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chci s k vám přidat.";
};

func int Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00");	//Chci se k vám přidat.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01");	//Nechápu, proč bys chtěl dobrovolně pracovat v dolech. Někdo jako ty může brzy žít na hradě.
};

instance Info_Vlk_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_2_WichtigePersonen_Condition;
	information = Info_Vlk_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00");	//Kdo to tady vede?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_03");	//Hádám, že to tu máte na starosti Vy. Jste jedním z Rudobaronů, že?
		AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_04");	//Nedělám žádné potíže, nebojte se.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01");	//Tady na vnějším kruhu vybírají Fletcher, Bloodwyn a Jackal peníze za ochranu. Každý má svůj obvod.
		AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02");	//Když s nimi budeš zadobře, nic se ti nestane.
	};
};

instance Info_Vlk_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_2_DasLager_Condition;
	information = Info_Vlk_2_DasLager_Info;
	permanent = 1;
	description = "Chci vědět o táboře víc.";
};

func int Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00");	//Chci vědět o táboře víc.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01");	//Měl by sis promluvit se Stíny. Řeknou ti, co potřebuješ vědět. Buď ale opatrný, většině z nich nelze důvěřovat.
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		AI_Output(self,other,"Info_Vlk_2_DasLager_02_02");	//Ale jako jeden z nich byste to měl vědět nejlépe.
	};
};

instance Info_Vlk_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_2_DieLage_Condition;
	information = Info_Vlk_2_DieLage_Info;
	permanent = 1;
	description = "Jak se tady žije?";
};

func int Info_Vlk_2_DieLage_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00");	//Jak se tady žije?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_05");	//Rudobaron?! Nechci žádné potíže!
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_06");	//Strážci vždy dostanou své peníze za ochranu a já pracuji v dolu, jak nejlépe umím.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_01");	//Pokud tě posílají Rudobaroni, vzkaž jim, že nechci žádné problémy. Ode mě nic neuslyšíš.
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_02");	//S tím, co nám dávají, jsem spokojený.
		AI_Output(other,self,"Info_Vlk_2_DieLage_15_03");	//Nikdo mě neposlal. Jsem tu nový.
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_04");	//Nováček, co? Nováčci se vždycky hned dostanou do problémů. Nechci s tím mít nic společného, jasný?
	};
};

func void B_AssignAmbientInfos_Vlk_2(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

