instance DIA_ESTEBAN_EXIT(C_Info)
{
	npc = org_864_esteban;
	nr = 999;
	condition = dia_esteban_exit_condition;
	information = dia_esteban_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_esteban_exit_condition()
{
	return 1;
};

func void dia_esteban_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ESTEBAN_HELLO(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_hello_condition;
	information = dia_esteban_hello_info;
	permanent = 0;
	important = 0;
	description = "Ahoj, kdo jsi?";
};

func int dia_esteban_hello_condition()
{
	return 1;
};

func void dia_esteban_hello_info()
{
	AI_Output(other,self,"DIA_Esteban_Hello_15_00");	//Ahoj, kdo jsi?
	AI_Output(self,other,"DIA_Esteban_Hello_12_01");	//Jsem Esteban.
	AI_Output(self,other,"DIA_Esteban_Hello_12_02");	//Něco ti řeknu, pokud se tu brzy nic nezmění, tak koukáš na budoucího šéfa tábora.
};

instance DIA_ESTEBAN_IN(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_in_condition;
	information = dia_esteban_in_info;
	permanent = 0;
	important = 0;
	description = "Co je v táboře za problém?";
};

func int dia_esteban_in_condition()
{
	if(Npc_KnowsInfo(hero,dia_esteban_hello))
	{
		return 1;
	};
};

func void dia_esteban_in_info()
{
	if(!Npc_IsDead(Org_858_Quentin))
	{
		AI_Output(other,self,"DIA_Esteban_In_15_00");	//Co je v táboře za problém?
		AI_Output(self,other,"DIA_Esteban_In_12_01");	//Quentin a jeho styl vedení tábora, to je problém.
		AI_Output(self,other,"DIA_Esteban_In_12_02");	//Věří, že nejlepší pro nás je podpora Nového tábora a nájezdy na konvoje.
		AI_Output(self,other,"DIA_Esteban_In_12_03");	//Já to vidím jinak.
		AI_Output(other,self,"DIA_Esteban_In_12_04");	//A jak?
		AI_Output(self,other,"DIA_Esteban_In_12_05");	//Kdybychom se dlouhodobě spojili se Starým táborem, bylo by to pro nás prospěšnější.
		AI_Output(self,other,"DIA_Esteban_In_12_06");	//Rudobaroni získají všechno své zboží z Vnějšího světa a pokud dostaneme jenom svůj podíl, můžeme z toho vyjít lépe, než doteď.
		AI_Output(self,other,"DIA_Esteban_In_12_07");	//I když zboží získaváme z loupeží, polovinu musíme odvést do Nového tábora.
	}
	else
	{
		AI_Output(other,self,"DIA_Esteban_In_12_00");	//Vůbec nic. Teď, když je Quentin mrtvý, tak je všechno v pořádku. (úsmívá se)
	};
};

instance DIA_ESTEBAN_WHY(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_why_condition;
	information = dia_esteban_why_info;
	permanent = 0;
	important = 0;
	description = "Můžu ti nějak pomoct?";
};

func int dia_esteban_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_esteban_in) && !Npc_IsDead(Org_858_Quentin))
	{
		return 1;
	};
};

func void dia_esteban_why_info()
{
	AI_Output(other,self,"DIA_Esteban_Why_15_00");	//Můžu ti nějak pomoct?
	AI_Output(self,other,"DIA_Esteban_How_12_01");	//Hmm ... Myslím, že ano.
	AI_Output(self,other,"DIA_Esteban_How_12_02");	//Chci aby jsi si promluvil s lidmi v táboře.
	AI_Output(self,other,"DIA_Esteban_How_12_03");	//Musím vědět, kdo tady stojí na čí straně.
	AI_Output(self,other,"DIA_Esteban_How_12_04");	//Promluv s lidmi a zjisti kdo stojí za mnou a kdo je na Quentinově straně.
	AI_Output(self,other,"DIA_Esteban_How_12_05");	//Až si se všemi promluvíš vrať se ke mně.
	AI_Output(self,other,"DIA_Esteban_How_12_06");	//Je tu ale jeden problém.
	AI_Output(self,other,"DIA_Esteban_How_12_07");	//Lidi tady vidí, že spolu mluvíme.
	AI_Output(self,other,"DIA_Esteban_How_12_08");	//A vědí, že mám ambice stát se vůdcem tábora. Proto k tobě nemusí být úpřímní.
	AI_Output(self,other,"DIA_Esteban_How_12_09");	//Aby jsme rozptýlili jakékoliv podezření, tak ti dám jednu do nosu.
	AI_Output(self,other,"DIA_Esteban_How_12_10");	//Pak tě málokdo bude podezřívat z toho, že pracuješ pro mě.
	AI_Output(self,other,"DIA_Esteban_How_12_11");	//Připrav se.
	ESTEBAN_LEADER = LOG_RUNNING;
	Log_CreateTopic(CH1_ESTEBANQUENTIN,LOG_MISSION);
	Log_SetTopicStatus(CH1_ESTEBANQUENTIN,LOG_RUNNING);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Esteban, jeden z banditů tábora v horách, je přesvědčen, že Quentin nemá nato být jejich vůdcem. Quentin se spojil s Novým táborem, ale Esteban by se raději spojil se Starým táborem. Požádal mě abych se po táboře poptal a zjistil, kdo je na jeho straně a kdo na Quentinově. Jakmile budu mít pořádné informace, měl bych se k němu vrátit a všechno mu sdělit.");
};

instance DIA_ESTEBAN_MAUL(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_maul_condition;
	information = dia_esteban_maul_info;
	permanent = 0;
	important = 1;
};

func int dia_esteban_maul_condition()
{
	if((ESTEBAN_LEADER == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_esteban_why))
	{
		return 1;
	};
};

func void dia_esteban_maul_info()
{
	AI_Output(self,other,"DIA_Esteban_Skinner_15_00");	//NEŘEKL JSEM TI SNAD ABYS VYPADL!
	AI_Output(self,other,"DIA_Esteban_Skinner_12_01");	//TEĎ DOSTANEŠ PŘES DRŽKU!
	AI_StopProcessInfos(self);
	Npc_SetTarget(org_864_esteban,other);
	AI_StartState(org_864_esteban,ZS_Attack,1,"");
};

instance DIA_ESTEBAN_SUCCESS(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_success_condition;
	information = dia_esteban_success_info;
	permanent = 0;
	important = 0;
	description = "Promluvil jsem si s pár lidmi.";
};

func int dia_esteban_success_condition()
{
	if((ESTEBAN_LEADER == LOG_RUNNING) && (FRANCO_ESTEBAN == TRUE) && (SENYAN_ESTEBAN == TRUE) && (LOGAN_ESTEBAN == TRUE) && (SANCHO_ESTEBAN == TRUE))
	{
		return 1;
	};
};

func void dia_esteban_success_info()
{
	AI_Output(other,self,"DIA_Esteban_SUCCESS_15_00");	//Promluvil jsem si s pár lidmi.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_01");	//No a?
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_02");	//Franco stojí na tvé straně. Myslí si, že máš nato být vůdcem tábora.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_03");	//Logan si myslí, že Quentinův čas už skončil.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_04");	//Sanchovi je jedno, kdo je vůdce. Tráví většinu času hlídáním tábora a moc se nezajímá o to co se děje v táboře.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_05");	//Senyan je na tvé straně. Myslí si, že jsi pravý vůdce.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_06");	//To byly všichni.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_08");	//To zní dobře. Vypadá to, že nadešel můj čas.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_09");	//Připravil jsi půdu pro mé vedení. Hehe.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_10");	//Tady, vem si tenhle luk za odměnu.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_11");	//A teď jdi. Už pro tebe nemám využití.
	//BUG [Fawkes]: Item sa presuva ale nevytvara
	//B_GiveInvItems(self,other,estebans_bogen,1);
	CreateInvItem(self,estebans_bogen);
	B_GiveInvItems(self,other,estebans_bogen,1);
	ESTEBAN_LEADER = LOG_SUCCESS;
	B_GiveXP(XP_ESTEBAN);
	Log_SetTopicStatus(CH1_ESTEBANQUENTIN,LOG_SUCCESS);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Esteban byl s mojí prací spokojený a je si jist, že bude lepším vůdcem. Poté mi řekl, že už nemá pro mě využití a že se teď musí připravit. Díky mně si je jistý, že mu nic nestojí na cestě převzít vedení tábora.");
};

