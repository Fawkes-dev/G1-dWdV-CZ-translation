instance Info_Nefarius_EXIT(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 999;
	condition = Info_Nefarius_EXIT_Condition;
	information = Info_Nefarius_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Nefarius_EXIT_Condition()
{
	return 1;
};

func void Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Nefarius_Hallo(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_Hallo_Condition;
	information = Info_Nefarius_Hallo_Info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int Info_Nefarius_Hallo_Condition()
{
	return 1;
};

func void Info_Nefarius_Hallo_Info()
{
	AI_Output(other,self,"Info_Nefarius_Hallo_15_00");	//Kdo jsi?
	AI_Output(self,other,"Info_Nefarius_Hallo_04_01");	//Jsem Nefarius. Mág Kruhu vody.
};

instance Info_Nefarius_WoSaturas(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 2;
	condition = Info_Nefarius_WoSaturas_Condition;
	information = Info_Nefarius_WoSaturas_Info;
	permanent = 0;
	description = "Kde najdu Saturase?";
};

func int Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

func void Info_Nefarius_WoSaturas_Info()
{
	AI_Output(other,self,"Info_Nefarius_WoSaturas_15_00");	//Kde najdu Saturase?
	AI_Output(self,other,"Info_Nefarius_WoSaturas_04_01");	//Projdi tou velkou kulatou branou. Tam ho najdeš.
};

instance Info_Nefarius_WannaMage(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_WannaMage_Condition;
	information = Info_Nefarius_WannaMage_Info;
	permanent = 0;
	description = "Chtěl bych se stát mágem Kruhu vody.";
};

func int Info_Nefarius_WannaMage_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

func void Info_Nefarius_WannaMage_Info()
{
	AI_Output(other,self,"Info_Nefarius_WannaMage_15_00");	//Chtěl bych se stát mágem Kruhu vody.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_01");	//(smích) Ne tak rychle, chlapče!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_02");	//Než mezi sebe vezmeme nějakého mladíka, musí vykonat něco velkého.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_03");	//A nějaký čas nám musí sloužit.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_04");	//Pokud to myslíš vážně, měl by ses přidat k žoldákům. U nich nám můžeš sloužit.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_05");	//A jednoho dne možná dostaneš možnost vykonat něco velkého.
};

instance Info_Nefarius_NowReady(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_NowReady_Condition;
	information = Info_Nefarius_NowReady_Info;
	permanent = 1;
	description = "Jsem připraven na vstup do Kruhu vody?";
};

func int Info_Nefarius_NowReady_Condition()
{
	if(!FMTaken && Npc_KnowsInfo(hero,Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero) != GIL_KDW))
	{
		return 1;
	};
};

func void Info_Nefarius_NowReady_Info()
{
	AI_Output(other,self,"Info_Nefarius_NowReady_15_00");	//Jsem připraven na vstup do Kruhu vody?
	if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_01");	//Staň se jedním z našich žoldáků, pak se uvidí...
	}
	else
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_02");	//Vím, stal ses jedním z našich žoldáků. Velmi dobře, velmi dobře...
		AI_Output(self,other,"Info_Nefarius_NowReady_04_03");	//Čas dokoná zbytek...
	};
};

var int nefarius_kdw;

instance Info_Nefarius_OCNews(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_OCNews_Condition;
	information = Info_Nefarius_OCNews_Info;
	permanent = 0;
	important = 1;
};

func int Info_Nefarius_OCNews_Condition()
{
	if(FMTaken && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Nefarius_OCNews_Info()
{
	AI_Output(self,other,"Info_Nefarius_OCNews_04_00");	//Jsou nějaké noviny u našich přátel ze Starého tábora?
	AI_Output(other,self,"Info_Nefarius_OCNews_15_01");	//Gomez zabil všechny mágy Ohně!
	AI_Output(self,other,"Info_Nefarius_OCNews_04_02");	//Ne! Ten grázl! Varoval jsem Corrista - nikdy se mu nedalo věřit! Musíš o tom říci Saturasovi!
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_OCNews_04_03");	//Počkej!
		AI_Output(self,other,"Info_Nefarius_OCNews_04_04");	//Čelil jsi za nás velkému nebezpečí.
		AI_Output(self,other,"Info_Nefarius_OCNews_04_05");	//Myslím, že jsi už hoden obléknout roucho mága Vody.
		AI_Output(self,other,"Info_Nefarius_OCNews_04_06");	//Teď ale promluv se Saturasem. Pospěš si!
		NEFARIUS_KDW = TRUE;
	};
	AI_StopProcessInfos(self);
};

instance DIA_KDW_NEFARIUS_HERODMB(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 3;
	condition = dia_kdw_nefarius_herodmb_condition;
	information = dia_kdw_nefarius_herodmb_info;
	permanent = 0;
	important = 1;
};

func int dia_kdw_nefarius_herodmb_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_DMB)
	{
		return 1;
	};
};

func void dia_kdw_nefarius_herodmb_info()
{
	AI_Output(self,other,"DIA_KDW_Nefarius_HeroDMB_15_00");	//Co se stalo? Proč jsi se dal na cestu temné magie?
	AI_StopProcessInfos(self);
};

