instance GRD_261_Brandick_Exit(C_Info)
{
	npc = GRD_261_Brandick;
	nr = 999;
	condition = GRD_261_Brandick_Exit_Condition;
	information = GRD_261_Brandick_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

func void GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance GRD_261_Brandick_ALEPH(C_Info)
{
	npc = GRD_261_Brandick;
	condition = GRD_261_Brandick_ALEPH_Condition;
	information = GRD_261_Brandick_ALEPH_Info;
	important = 0;
	permanent = 0;
	description = "(stěžuj si na Alepha)";
};

func int GRD_261_Brandick_ALEPH_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void GRD_261_Brandick_ALEPH_Info()
{
	AI_Output(other,self,"GRD_261_Brandick_ALEPH_Info_15_01");	//Poslyš, když tady nejsi, Aleph tu akorát celý den posedává a ani nepohne prstem.
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_02");	//Je to pravda?
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_03");	//Víš, kým opovrhuju ještě víc než línou kůží? Zrádcema! Ztrať se!
	AI_StopProcessInfos(self);
};

instance GRD_261_BRANDICK_WANNA(C_Info)
{
	npc = GRD_261_Brandick;
	condition = grd_261_brandick_wanna_condition;
	information = grd_261_brandick_wanna_info;
	important = 1;
	permanent = 0;
};

func int grd_261_brandick_wanna_condition()
{
	return 1;
};

func void grd_261_brandick_wanna_info()
{
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_15_01");	//Hej chlapče, mohl bys mi udělat laskavost místo toho pobíhání kolem?
	AI_Output(other,self,"GRD_261_Brandick_WANNA_Info_06_02");	//Copak?
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_06_03");	//Dones mi pivo. Stál jsem tu celý den a dal bych si něco dobrého.
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_06_04");	//V hlavní šachtě určitě nějaké bude.
	BRANDICK_BEER = LOG_RUNNING;
	Log_CreateTopic(CH1_BRANDICKBEER,LOG_MISSION);
	Log_SetTopicStatus(CH1_BRANDICKBEER,LOG_RUNNING);
	B_LogEntry(CH1_BRANDICKBEER,"Brandick, jeden ze strážců ve Starém dole, mě požádal o pivo. Měl bych se podívat do hlavní šachty, určitě tam něco najdu.");
};

instance GRD_261_BRANDICK_BEER(C_Info)
{
	npc = GRD_261_Brandick;
	condition = grd_261_brandick_beer_condition;
	information = grd_261_brandick_beer_info;
	important = 0;
	permanent = 0;
	description = "Tady máš pivo.";
};

func int grd_261_brandick_beer_condition()
{
	if(Npc_HasItems(other,ItFoBeer) > 0)
	{
		return 1;
	};
};

func void grd_261_brandick_beer_info()
{
	AI_Output(other,self,"GRD_261_Brandick_BEER_Info_15_01");	//Tady máš pivo.
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_02");	//Díky, už jsem to potřeboval.
	B_GiveInvItems(other,self,ItFoBeer,1);
	AI_UseItem(self,ItFoBeer);
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_03");	//Tad máš 10 kusů rudy.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_04");	//Vrať se zase do práce.
	BRANDICK_BEER = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_BRANDICKBEER,LOG_SUCCESS);
	B_LogEntry(CH1_BRANDICKBEER,"Brandick dokázal uhasit žízeň a za odměnu mi dal 10 nugetů.");
	B_GiveXP(XP_BRANDICKBEER);
};

