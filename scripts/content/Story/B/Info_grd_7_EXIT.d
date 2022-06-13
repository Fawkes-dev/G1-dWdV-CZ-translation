instance Info_grd_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_grd_7_EXIT_Condition;
	information = Info_grd_7_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_grd_7_EXIT_Condition()
{
	return 1;
};

func void Info_grd_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_grd_7_EinerVonEuchWerden(C_Info)
{
	nr = 1;
	condition = Info_grd_7_EinerVonEuchWerden_Condition;
	information = Info_grd_7_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co mám udělat proto, abych byl přijat mezi Gomezovy stráže?";
};

func int Info_grd_7_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && (Npc_GetTrueGuild(other) != GIL_EBR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00");	//Co mám udělat proto, abych byl přijat mezi Gomezovy stráže?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01");	//Ty?! Jsi blázen. Myslíš, že si sem přijdeš jen tak a budeš hned nahoře, nebo co?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02");	//Gomez má mezi stráží jen ty nejlepší.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03");	//Musíš tu pracovat jako každý jiný a prokázat svou oddanost jako Stín.
};

instance Info_grd_7_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_grd_7_WichtigePersonen_Condition;
	information = Info_grd_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_grd_7_WichtigePersonen_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_grd_7_WichtigePersonen_Info()
{
	var C_Npc diego;
	var C_Npc Thorus;
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00");	//Kdo to tady vede?
	if(Npc_GetTrueGuild(other) == GIL_EBR)
	{
		AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_03");	//Jako jeden z Rudobaronů to budete Vy.
		AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_04");	//Ale buďte bez obav, o všechno se tady ve Vnějším kruhu postaráme.
		AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_05");	//Můžete jít zpátky do hradu, máme všechno pod kontrolou.
	}
	else
	{
		AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01");	//Thorus kontroluje všechno, co se děje v táboře. Diego je jeho pravá ruka.
		AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02");	//Pokud chceš kamkoliv jít, musíš to těm hochům říci.
		diego = Hlp_GetNpc(PC_Thief);
		diego.aivar[AIV_FINDABLE] = TRUE;
		Thorus = Hlp_GetNpc(GRD_200_Thorus);
		Thorus.aivar[AIV_FINDABLE] = TRUE;
	};
};

instance Info_grd_7_DasLager(C_Info)
{
	nr = 1;
	condition = Info_grd_7_DasLager_Condition;
	information = Info_grd_7_DasLager_Info;
	permanent = 1;
	description = "Pracují tady všichni pro Gomeze?";
};

func int Info_grd_7_DasLager_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00");	//Pracují tady všichni pro Gomeze?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01");	//Ne. Většinou jsou to obyčejní kopáči.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02");	//Jenom my, stráže a Stínové jsou s Gomezem.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"ZPĚT.",Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"Co dělají stráže?",Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Jaká je role stínů?",Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Co dělají kopáči?",Info_grd_7_DasLager_Buddler);
};

func void Info_grd_7_DasLager_Zurueck()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

func void Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00");	//Co stráže dělají?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01");	//Střežíme tábor a chráníme kopáče.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02");	//Od Gomeze dostáváme žold a kopáči nám platí za ochranu. Je to dobrej džob.
};

func void Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00");	//Co dělají Stínové?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01");	//Stínové dohlížejí na plnění Gomezových příkazů.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02");	//Většinou jsou to patolízalové, kteří se pokoušejí propracovat nahoru. Pokud tu něco chceš dokázat, je to jediná cesta.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03");	//Děláš už svou práci dost dlouho tak dobře, aby ses stal jedním z nás.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04");	//Jakmile budeš s Gomezem, mladej, už si tu na tebe nikdo nedovolí.
};

func void Info_grd_7_DasLager_Buddler()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00");	//Co dělají kopáči?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01");	//Dobrá otázka! Neměli bysme ty umouněnce vůbec pouštět z dolů ven!
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02");	//Když budou chvilku v dolech, přijdou ven utratit svůj výdělek.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03");	//Když všechno promrhají, vrátí se do dolů. Tak to tu dělá většina lidí.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04");	//Vypadá to, že máš na víc, než se ohánět s krumpáčem. Měl bys prohodit slovo s Thorusem, jestli se na to cítíš...
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_grd_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_grd_7_DieLage_Condition;
	information = Info_grd_7_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_grd_7_DieLage_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01");	//Tak jak to vidíš? Dokud se nerozhodneš, do kterého tábora se dáš, nikdo tě nebude brát vážně, mladej!
};

func void B_AssignAmbientInfos_grd_7(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_grd_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc = Hlp_GetInstanceID(slf);
};

