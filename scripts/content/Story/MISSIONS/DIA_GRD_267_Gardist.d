instance DIA_GRD_267_EXIT(C_Info)
{
	npc = GRD_267_Gardist;
	nr = 999;
	condition = dia_grd_267_exit_condition;
	information = dia_grd_267_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_grd_267_exit_condition()
{
	return 1;
};

func void dia_grd_267_exit_info()
{
	AI_StopProcessInfos(self);
};

instance GRD_267_GARDIST_SITTINGORK(C_Info)
{
	npc = GRD_267_Gardist;
	condition = grd_267_gardist_sittingork_condition;
	information = grd_267_gardist_sittingork_info;
	important = 1;
	permanent = 0;
};

func int grd_267_gardist_sittingork_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void grd_267_gardist_sittingork_info()
{
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_15_01");	//Ah, podívejme. Máme návštěvu.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_02");	//Nová tvář. Vidím ti to na očích, chlapče
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_03");	//Nuže, My stráže musíme Vás kopáče poučit o tom jak to tu chodí.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_04");	//My stráže se ujišťujeme, že ty a další kopáči těžíte v Gomezově dole rudu.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_05");	//Děláte to abychom tu všichni měli o něco příjemnější život.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_06");	//Za možnost výdělku v dolu, nám musíte samozřejmě zaplatit menší poplatek. Menší rudnou daň.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_07");	//Ujistím se, že se ruda dostane do dobrých rukou, a Vy kopáči máte ve Starém táboře na oplátku dobrý život.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_08");	//Koneckonců, My stráže se staráme o Vás kopáče a to je ... no není to lacná záležitost, jsem si jistý, že to chápeš. (usmívá se)
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_09");	//Myslím, že to je to nejdůležitější, co potřebuješ vědět.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_10");	//Tady je krumpáč. Odteď bude tvým věrným společníkem.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_11");	//Protože jsi mi ještě nezaplatil svou rudnou daň, tak se pusť do práce a natěž nějakou rudu.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_12");	//Nemusíš se o nic bát, dáváme na Vás kopáče pořád pozor. Můžeš v klidu těžit, bez obav z Důlních červů.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_13");	//Užij si to budu na tebe dohlížet, chlapče.
	CreateInvItems(self,ItMwPickaxe,1);
	B_GiveInvItems(self,other,ItMwPickaxe,1);
	ORE_VLK = LOG_RUNNING;
	Log_CreateTopic(CH1_HEROVLK,LOG_MISSION);
	Log_SetTopicStatus(CH1_HEROVLK,LOG_RUNNING);
	B_LogEntry(CH1_HEROVLK,"Jeden ze strážců ve Starém dole mě upozornil, že budu muset pracovat jako všichni ostatní. Dal mi krumpáč a poslal mě kopat. Pokud mu do zítřka nepřinesu 150 kusů rudy, dá mi lekci.");
};

instance GRD_267_GARDIST_WORKINGORK(C_Info)
{
	npc = GRD_267_Gardist;
	condition = grd_267_gardist_workingork_condition;
	information = grd_267_gardist_workingork_info;
	important = 1;
	permanent = 0;
};

func int grd_267_gardist_workingork_condition()
{
	if(Npc_KnowsInfo(hero,grd_267_gardist_sittingork) && (ORE_VLK == LOG_RUNNING) && (Npc_HasItems(other,ItMiNugget) >= 150))
	{
		return 1;
	};
};

func void grd_267_gardist_workingork_info()
{
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_15_01");	//Podívejme, kdo se zase ukázal. Dobře, že jsi tu, akorát vybírám rudnou daň od kopáčů.
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_15_02");	//Ukaž co jsi natěžil.
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_06_03");	//Ahh. Tolik rudy, to je nádherný pohled, že? Neboj se, u mně je ta ruda v dobrých rukách.

	//BUG [Fawkes]:
	/*
		//Blok dialogu dostupny len ak ma hrac <= 150 ks rudy (spolu s condition funkciou tu moze zapis == 150)
		if(Npc_HasItems(other,ItMiNugget) <= 150){
			//Presuva sa 150 ks rudy
			B_GiveInvItems(other,self,ItMiNugget,150);

		//Blok dialogu dostupny len ak ma hrac > 150 a <= 200 ks rudy
		}else if(Npc_HasItems(other,ItMiNugget) <= 200){
			//Problem: Presuva sa 200 kusov rudy, aj ked ma hrac napriklad iba 151 ks rudy, to nedava uplne zmysel
			B_GiveInvItems(other,self,ItMiNugget,200);

		//Blok dialogu dostupny len ak ma hrac >= 250 ks rudy
		}else if(Npc_HasItems(other,ItMiNugget) >= 250){
			//Presuva sa vsetko
			B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
		};
	*/
	
	/*
	if(Npc_HasItems(other,ItMiNugget) <= 150)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_02");	//150 kusů? Jsem rád, že se držíš naší dohody a platíš, co jsme si dohodli.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_04");	//Ale víš co, tu máš zpátky nějakou rudu. Musíte přece taky z něčeho žít, že?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_05");	//Měj se chlapče, pravděpodobně se ještě uvidíme.
		B_GiveInvItems(other,self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,10);
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Přinesl jsem Strážcovi jeho 150 kusů rudy. Dal mi 10 kusů zpátky jako můj podíl a řekl mi, že se uvidíme později.");
		B_GiveXP(XP_VLKHERO);
	}
	else if(Npc_HasItems(other,ItMiNugget) <= 200)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_02");	//200 kusů? Určitě ti nebude vadit, když si vezmu malou zálohu.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_03");	//Je to z dobrého důvodu. (usmívá se)
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_04");	//Ale víš co, tu máš zpátky nějakou rudu. Musíte přece taky z něčeho žít, že?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_05");	//Měj se chlapče, pravděpodobně se ještě uvidíme.
		B_GiveInvItems(other,self,ItMiNugget,200);
		B_GiveInvItems(self,other,ItMiNugget,15);
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Když si strážce všiml, že mám u sebe 200 kusů rudy, tak si ji jednoduše vzal s tím, že si bere rudu navíc jako 'zálohu'. 15 kusů mi dal nazpátek.");
		B_GiveXP(XP_VLKHERO);
	}
	else if(Npc_HasItems(other,ItMiNugget) >= 250)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_02");	//Zdá se, že jsi odvedl docela dobrou práci. To je hodně rudy, co jsi natěžil.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_03");	//Nechám si ji raději všehnu tady, neboj u mně je v dobrých rukách.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_04");	//Ber to jako investici do budoucnosti. Já tu rudu investuju určitě dobře, tím si můžeš být jistý.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_05");	//Měj se chlapče, pravděpodobně se ještě uvidíme.
		B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Když jsem zase potkal strážce, měl jsem sebou hodně rudy. Všechnu si vzal a popsal to jako budoucí 'investice'. Nenechal mi vůbec nic ...");
		B_GiveXP(XP_VLKHERO_TIRED);
	};
	*/

	if(Npc_HasItems(other,ItMiNugget) >= 250)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_02");	//Zdá se, že jsi odvedl docela dobrou práci. To je hodně rudy, co jsi natěžil.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_03");	//Nechám si ji raději všehnu tady, neboj u mně je v dobrých rukách.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_04");	//Ber to jako investici do budoucnosti. Já tu rudu investuju určitě dobře, tím si můžeš být jistý.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_05");	//Měj se chlapče, pravděpodobně se ještě uvidíme.
		B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Když jsem zase potkal strážce, měl jsem sebou hodně rudy. Všechnu si vzal a popsal to jako budoucí 'investice'. Nenechal mi vůbec nic ...");
		B_GiveXP(XP_VLKHERO_TIRED);
	}
	else if(Npc_HasItems(other,ItMiNugget) >= 200)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_02");	//200 kusů? Určitě ti nebude vadit, když si vezmu malou zálohu.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_03");	//Je to z dobrého důvodu. (usmívá se)
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_04");	//Ale víš co, tu máš zpátky nějakou rudu. Musíte přece taky z něčeho žít, že?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_05");	//Měj se chlapče, pravděpodobně se ještě uvidíme.
		B_GiveInvItems(other,self,ItMiNugget,200);
		B_GiveInvItems(self,other,ItMiNugget,15);
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Když si strážce všiml, že mám u sebe 200 kusů rudy, tak si ji jednoduše vzal s tím, že si bere rudu navíc jako 'zálohu'. 15 kusů mi dal nazpátek.");
		B_GiveXP(XP_VLKHERO);
	} else
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_02");	//150 kusů? Jsem rád, že se držíš naší dohody a platíš, co jsme si dohodli.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_04");	//Ale víš co, tu máš zpátky nějakou rudu. Musíte přece taky z něčeho žít, že?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_05");	//Měj se chlapče, pravděpodobně se ještě uvidíme.
		B_GiveInvItems(other,self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,10);
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Přinesl jsem Strážcovi jeho 150 kusů rudy. Dal mi 10 kusů zpátky jako můj podíl a řekl mi, že se uvidíme později.");
		B_GiveXP(XP_VLKHERO);
	};
};

