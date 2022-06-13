instance Info_Vlk_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_3_EXIT_Condition;
	information = Info_Vlk_3_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Vlk_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_3_EinerVonEuchWerden_Condition;
	information = Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Jak se můžu přidat k táboru?";
};

func int Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00");	//Jak se můžu přidat k táboru?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01");	//Já jsem akorát kopáč, takže ti k tomu nemám co říct. Měl by sis promluvit se strážemi nebo se Stíny.
};

instance Info_Vlk_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_3_WichtigePersonen_Condition;
	information = Info_Vlk_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo je tady šéf?";
};

func int Info_Vlk_3_WichtigePersonen_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00");	//Kdo je tady šéf?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01");	//Gomez. Žije na hradě. Ale my kopáči se máme pořádně na pozoru před strážemi.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02");	//Nejlepší je, jít jim z cesty. Pokud tak neuděláš, máš malér.
};

instance Info_Vlk_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_3_DasLager_Condition;
	information = Info_Vlk_3_DasLager_Info;
	permanent = 1;
	description = "Jaký jsou tady nejdůležitější místa?";
};

func int Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00");	//Jaký jsou tady nejdůležitější místa?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01");	//Jestli rád sázíš, musíš zajít večer do arény. Jestli si chceš něco koupit, zajdi na tržiště.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02");	//Prodávají tam prakticky všechno. Jestli chceš mapy, zajdi ke Grahamovi. Jeho chatrč je přímo naproti hradní bráně.
};

instance Info_Vlk_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_3_DieLage_Condition;
	information = Info_Vlk_3_DieLage_Info;
	permanent = 1;
	description = "Co se děje?";
};

func int Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00");	//Co se děje?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_3_DieLage_03_04");	//Nezpůsobil jsem žádné potíže, že? Zaplatím Strážím rudu za ochranu, nebojte se.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_3_DieLage_03_01");	//Brzy se dozvíš víc. Měj se pořád na pozoru. Hlavně v noci.
		AI_Output(self,other,"Info_Vlk_3_DieLage_03_02");	//Už jsem se celé dny pořádně nevyspal. Jestli nemůžeš spát v kolonii, pak budeš mít dvakrát víc času!
	};
};

func void B_AssignAmbientInfos_Vlk_3(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

