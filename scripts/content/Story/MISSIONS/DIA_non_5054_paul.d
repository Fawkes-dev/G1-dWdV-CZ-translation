instance DIA_PAUL_EXIT(C_Info)
{
	npc = non_5054_paul;
	nr = 999;
	condition = dia_paul_exit_condition;
	information = dia_paul_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_paul_exit_condition()
{
	return 1;
};

func void dia_paul_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_PAUL_WHO(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_who_condition;
	information = dia_paul_who_info;
	permanent = 0;
	important = 0;
	description = "Jak to vypadá?";
};

func int dia_paul_who_condition()
{
	if(PAUL_OC == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_paul_who_info()
{
	AI_Output(other,self,"DIA_PAUL_WHO_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_PAUL_WHO_02_01");	//Co ode mě chceš? Přišel jsi mi taky dát pěstí?
};

instance DIA_PAUL_OC(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_oc_condition;
	information = dia_paul_oc_info;
	permanent = 0;
	important = 0;
	description = "Jsem tu abych ti udělal návrh.";
};

func int dia_paul_oc_condition()
{
	if((PAUL_OC == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_paul_who))
	{
		return 1;
	};
};

func void dia_paul_oc_info()
{
	AI_Output(other,self,"DIA_PAUL_OC_15_00");	//Jsem tu abych ti udělal návrh.
	AI_Output(self,other,"DIA_PAUL_OC_02_01");	//Jaký návrh?
	AI_Output(other,self,"DIA_PAUL_OC_02_02");	//Chci ti dát šanci připojit se ke Starému táboru.
	AI_Output(self,other,"DIA_PAUL_OC_02_03");	//Ah, jsi jeden z nich? Poslední z Vás mi uštědřil několik pěstí.
	AI_Output(self,other,"DIA_PAUL_OC_02_04");	//Proč bych se k Vám měl přidat?
	Info_ClearChoices(dia_paul_oc);
	Info_AddChoice(dia_paul_oc,"Protože ve Starém táboře je mnoho příležitostí.",dia_paul_oc_chances);
	Info_AddChoice(dia_paul_oc,"Život ve Starém táboře je svobodný život.",dia_paul_oc_free);
	Info_AddChoice(dia_paul_oc,"Jestli ne, tak dostaneš zase do zubů, Paule.",dia_paul_oc_maul);
};

func void dia_paul_oc_chances()
{
	AI_Output(other,self,"DIA_PAUL_OC_CHANCES_Info_15_01");	//Protože ve Starém táboře je mnoho příležitostí.
	AI_Output(self,other,"DIA_PAUL_OC_CHANCES_Info_14_02");	//Takže? Jaké příležitosti tam jsou?
	Info_ClearChoices(dia_paul_oc);
	Info_AddChoice(dia_paul_oc,"Můžeš se vypracovat až na vrchol.",dia_paul_oc_workhard);
	Info_AddChoice(dia_paul_oc,"V dolech můžeš vydělat hodně rudy.",dia_paul_oc_earnore);
};

func void dia_paul_oc_free()
{
	AI_Output(other,self,"DIA_PAUL_OC_FREE_Info_15_01");	//Život ve Starém táboře je svobodný život.
	AI_Output(self,other,"DIA_PAUL_OC_FREE_Info_14_02");	//Tomu nevěřím. V táboře, kde mě uvítají pěstí do tváře, nemůže být žádný svobodný život.
	AI_Output(self,other,"DIA_PAUL_OC_FREE_Info_14_03");	//Dělej si srandu z někoho jiného. Nikdy bych se nepřidal ke Starému táboru.
	PAUL_OC = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nepřesvědčil jsem aby se připojil ke Starému táboru. Cutterovi se to nebude líbit.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

func void dia_paul_oc_maul()
{
	AI_Output(other,self,"DIA_PAUL_OC_MAUL_Info_15_01");	//Jestli ne, tak dostaneš zase do zubů, Paule.
	AI_Output(self,other,"DIA_PAUL_OC_MAUL_Info_14_02");	//Věděl jsem, že jsi stejný mizera jako ten před tebou.
	AI_Output(self,other,"DIA_PAUL_OC_MAUL_Info_14_03");	//Odcházím!
	PAUL_OC = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nepřesvědčil jsem aby se připojil ke Starému táboru. Cutterovi se to nebude líbit.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

func void dia_paul_oc_workhard()
{
	AI_Output(other,self,"DIA_PAUL_OC_WORKHARD_Info_15_01");	//Můžeš se vypracovat až na vrchol.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_02");	//Udělal jsi to i ty?
	AI_Output(other,self,"DIA_PAUL_OC_WORKHARD_Info_14_03");	//Přesně tak.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_04");	//Zdá se, že se ti nevede špatně.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_05");	//Myslím, že si ten tábor můžu prohlédnout.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_06");	//Díky za pomoc!
	PAUL_OC = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_PAULOC,LOG_SUCCESS);
	B_LogEntry(CH1_PAULOC,"Dokázal jsem Paula přesvědčit, že pro něj bude nejlepší připojit se ke Starému táboru. Myslím, že Cutter bude spokojený.");
	B_GiveXP(XP_PAUL);
	Info_ClearChoices(dia_paul_oc);
	Npc_ExchangeRoutine(self,"OLDCAMP");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"OLDCAMP");
};

func void dia_paul_oc_earnore()
{
	AI_Output(other,self,"DIA_PAUL_OC_EARNORE_Info_15_01");	//V dolech můžeš vydělat hodně rudy.
	AI_Output(self,other,"DIA_PAUL_OC_EARNORE_Info_14_02");	//Měl bych dobrovolně pracovat v dolech?
	AI_Output(self,other,"DIA_PAUL_OC_EARNORE_Info_14_03");	//Ne, raději zkusím jiný tábor, než abych se dřel pro Rudobarony.
	PAUL_OC = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nepřesvědčil jsem aby se připojil ke Starému táboru. Cutterovi se to nebude líbit.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

instance DIA_PAUL_NOW(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_now_condition;
	information = dia_paul_now_info;
	permanent = 1;
	important = 0;
	description = "Jak se máš?";
};

func int dia_paul_now_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_success))
	{
		return 1;
	};
};

func void dia_paul_now_info()
{
	AI_Output(other,self,"DIA_PAUL_NOW_15_00");	//Jak se máš?
	AI_Output(self,other,"DIA_PAUL_NOW_02_01");	//Dobře. Starý tábor není zase tak špatné místo pro život.
	AI_Output(self,other,"DIA_PAUL_NOW_02_02");	//Alespoň je to lepší, než kdybych se toulal po divočině venku.
	AI_Output(self,other,"DIA_PAUL_NOW_02_03");	//Budu prozatím pracovat pro Huna. Slíbil, že mě vezme za učedníka a ukáže mi pár triků.
};

