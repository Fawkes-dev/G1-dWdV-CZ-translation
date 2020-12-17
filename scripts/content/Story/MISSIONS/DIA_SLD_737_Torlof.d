instance DIA_Torlof_EXIT(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Torlof_Hallo(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 1;
	condition = DIA_Torlof_Hallo_Condition;
	information = DIA_Torlof_Hallo_Info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

func void DIA_Torlof_Hallo_Info()
{
	AI_Output(other,self,"DIA_Torlof_Hallo_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Torlof_Hallo_04_01");	//Jsem Torlof.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_02");	//Zapletl jsem se do vzpoury jako důstojník královské flotily.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_03");	//Nebyl to dobrý nápad. Velká část posádky stála na straně kapitána.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_04");	//Proto jsem tady.
};

instance DIA_Torlof_Mitmachen(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 2;
	condition = DIA_Torlof_Mitmachen_Condition;
	information = DIA_Torlof_Mitmachen_Info;
	permanent = 1;
	description = "Rád bych se k vám přidal.";
};

func int DIA_Torlof_Mitmachen_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) || (Npc_GetTrueGuild(hero) == GIL_ORG))
	{
		return 1;
	};
};

func void DIA_Torlof_Mitmachen_Info()
{
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00");	//Rád bych se k vám přidal.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01");	//Lee tě nepřijme, dokud nebude mít opravdový důvod, to ti říkám rovnou.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02");	//A do té doby bys měl být s Laresem a jeho lidmi zadobře.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03");	//Jestli chceš dobrou radu, chlapče: ukradni něco cenného ze Starého tábora nebo ze Starého dolu.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04");	//Jakmile chlapi zjistí, že jsi proti Gomezovi, nebudeš tu mít žádné problémy.
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05");	//A jak to mám udělat?
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06");	//Potřebuješ si získat jejich DŮVĚRU - a pak se jich zbavíš!
};

