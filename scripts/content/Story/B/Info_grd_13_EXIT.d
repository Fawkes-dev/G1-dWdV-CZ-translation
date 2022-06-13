instance Info_grd_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_grd_13_EXIT_Condition;
	information = Info_grd_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_grd_13_EXIT_Condition()
{
	return 1;
};

func void Info_grd_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_grd_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_grd_13_EinerVonEuchWerden_Condition;
	information = Info_grd_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chci se stát strážcem.";
};

func int Info_grd_13_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && (Npc_GetTrueGuild(other) != GIL_EBR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00");	//Chci se stát strážcem.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01");	//Pak před sebou budeš mít dlouhou cestu, chlapče.
};

instance Info_grd_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_grd_13_WichtigePersonen_Condition;
	information = Info_grd_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00");	//Kdo to tady vede?
	if(Npc_GetTrueGuild(other) == GIL_EBR)
	{
		AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_02");	//Protože jste jediný Rudobaron ve Vnějším okruhu, tak Vy.
		AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_03");	//Má pro nás Gomez nějaké nové pokyny?
	}
	else
	{
		AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01");	//Já tu dohlížím. A říkám ti: měl bys dávat, hochu, pozor na to, co říkáš!
	};
};

instance Info_grd_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_grd_13_DasLager_Condition;
	information = Info_grd_13_DasLager_Info;
	permanent = 1;
	description = "Jak se dostanu na hrad?";
};

func int Info_grd_13_DasLager_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void Info_grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00");	//Jak se dostanu na hrad?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01");	//Nedostaneš. Tam smí jen Gomezovi lidé.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Aha ...",Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"Co když podplatím stráže?",Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"Co když chci mluvit s Gomezem?",Info_grd_13_DasLager_GomezSprechen);
};

func void Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00");	//Aha ...
	Info_ClearChoices(Info_grd_13_DasLager);
};

func void Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00");	//Co kdybych podplatil stráže?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01");	//Máš ale nervy, mladej. Jediné, jak bys je mohl přesvědčit, aby se na minutku dívali jinam, je přinést jim něco rudy.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02");	//Jak se ale Gomez dozví, že nechali takové čerstvé maso napochodovat do jeho zámku, uvrhne je do vězení.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03");	//Jistě, takovýhle risk je ale nutný.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04");	//Ale i když se dostaneš dovnitř, co tam budeš dělat? Všechny budovy jsou přísně střežené.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05");	//Byl jsem zvědavý, to je vše.
};

func void Info_grd_13_DasLager_GomezSprechen()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00");	//Jak bych si mohl promluvit s Gomezem?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01");	//Gomeze nezajímají nováčci, kteří neprokázali své schopnosti.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02");	//Jestli to myslíš vážně, promluv si s Thorusem.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_grd_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_grd_13_DieLage_Condition;
	information = Info_grd_13_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_grd_13_DieLage_Condition()
{
	if(!C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01");	//Je klid. Občas nějaký problém s Novým táborem nebo pár sektářskými blázny.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02");	//Pokud jsi nový, všechno je jedno. Jakmile se ale rozhodneš, ke kterému táboru se dáš, pak jsi v tom jako my všichni.
};

func void B_AssignAmbientInfos_grd_13(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_grd_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

