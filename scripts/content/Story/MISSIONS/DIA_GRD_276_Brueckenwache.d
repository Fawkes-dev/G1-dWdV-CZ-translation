instance Info_GRD_276_Exit(C_Info)
{
	npc = GRD_276_Brueckenwache;
	nr = 999;
	condition = Info_GRD_276_Exit_Condition;
	information = Info_GRD_276_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_GRD_276_Exit_Condition()
{
	return 1;
};

func void Info_GRD_276_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_GRD_276_Tips(C_Info)
{
	npc = GRD_276_Brueckenwache;
	nr = 1;
	condition = Info_GRD_276_Tips_Condition;
	information = Info_GRD_276_Tips_Info;
	permanent = 0;
	description = "Zdar! Jsem tady nový.";
};

func int Info_GRD_276_Tips_Condition()
{
	if(Kapitel <= 2)
	{
		return 1;
	};
};

func void Info_GRD_276_Tips_Info()
{
	AI_Output(other,self,"Info_GRD_276_Tips_15_00");	//Zdar! Jsem tady nový.
	AI_Output(self,other,"Info_GRD_276_Tips_07_01");	//To se teda máš!
};

instance Info_GRD_276_Bla(C_Info)
{
	npc = GRD_276_Brueckenwache;
	nr = 2;
	condition = Info_GRD_276_Bla_Condition;
	information = Info_GRD_276_Bla_Info;
	permanent = 1;
	description = "Je támhleto Starý tábor?";
};

func int Info_GRD_276_Bla_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GRD_276_Tips))
	{
		return 1;
	};
};

func void Info_GRD_276_Bla_Info()
{
	AI_Output(other,self,"Info_GRD_276_Bla_15_00");	//Je támhleto Starý tábor?
	AI_Output(self,other,"Info_GRD_276_Bla_07_01");	//Ne, to je Nový tábor. Starý tábor je za mostem.
	AI_StopProcessInfos(self);
};

