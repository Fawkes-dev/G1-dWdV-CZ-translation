instance DIA_SANCHO_EXIT(C_Info)
{
	npc = org_867_sancho;
	nr = 999;
	condition = dia_sancho_exit_condition;
	information = dia_sancho_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_sancho_exit_condition()
{
	return 1;
};

func void dia_sancho_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SANCHO_HELLO(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_hello_condition;
	information = dia_sancho_hello_info;
	permanent = 0;
	important = 1;
};

func int dia_sancho_hello_condition()
{
	return 1;
};

func void dia_sancho_hello_info()
{
	AI_Output(self,other,"DIA_Sancho_Hello_15_00");	//Hej ty! Kampak, kampak?
	AI_Output(other,self,"DIA_Sancho_Hello_12_01");	//Kampak vede tahle cesta?
	AI_Output(self,other,"DIA_Sancho_Hello_12_02");	//Vede do našeho tábora. Patří banditům a náš vůdce se jmenuje Quentin.
	AI_Output(self,other,"DIA_Sancho_Hello_12_03");	//Dohlíží na to aby v táboře vše běželo hladce.
};

instance DIA_SANCHO_IN(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_in_condition;
	information = dia_sancho_in_info;
	permanent = 0;
	important = 0;
	description = "Můžu jít dovnitř?";
};

func int dia_sancho_in_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_hello))
	{
		return 1;
	};
};

func void dia_sancho_in_info()
{
	AI_Output(other,self,"DIA_Sancho_In_15_00");	//Můžu jít dovnitř?
	AI_Output(self,other,"DIA_Sancho_In_12_01");	//Samozřejmě, že můžeš jít dovnitř, někdo jako ty tu moc škody nenadělá.
	AI_Output(self,other,"DIA_Sancho_In_12_02");	//Ale dávej si pozor, co děláš, dobře? Pár lidí co tu je jsou skuteční bastardi, kterým neudělá větší radost než ti dát několik pěstí.
};

instance DIA_SANCHO_HOW(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_how_condition;
	information = dia_sancho_how_info;
	permanent = 1;
	important = 0;
	description = "Jak se máš?";
};

func int dia_sancho_how_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_in))
	{
		return 1;
	};
};

func void dia_sancho_how_info()
{
	AI_Output(other,self,"DIA_Sancho_How_15_00");	//Jak se máš?
	AI_Output(self,other,"DIA_Sancho_How_12_01");	//Všechno je velmi klidné. Chňapavec dole si udržuje odstup a všechno v táboře je pořádku.
};

instance DIA_SANCHO_SKINNER(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_skinner_condition;
	information = dia_sancho_skinner_info;
	permanent = 0;
	important = 1;
};

func int dia_sancho_skinner_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_hello))
	{
		return 1;
	};
};

func void dia_sancho_skinner_info()
{
	AI_Output(self,other,"DIA_Sancho_Skinner_15_00");	//Než zapomenu!
	AI_Output(self,other,"DIA_Sancho_Skinner_12_01");	//Když půjdeš do tábora, nalevo u vchodu je chata.
	AI_Output(self,other,"DIA_Sancho_Skinner_12_02");	//Patří Skinnerovi. Poradím ti, nech toho chlápka na pokoji.
	AI_Output(self,other,"DIA_Sancho_Skinner_12_03");	//Je to pro tebe lepší, věř mi.
};

var int sancho_esteban;

instance DIA_SANCHO_ABOUT(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_about_condition;
	information = dia_sancho_about_info;
	permanent = 0;
	important = 0;
	description = "Co si myslíš o Estebanovi?";
};

func int dia_sancho_about_condition()
{
	if(ESTEBAN_LEADER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_sancho_about_info()
{
	AI_Output(other,self,"DIA_Sancho_About_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Sancho_About_12_01");	//Slyšel jsi také ty zvěsti, co?
	AI_Output(self,other,"DIA_Sancho_About_12_02");	//No, je mi jedno, kdo je tady šéf a kdo ne. Tady u brány se pro mě nic nemění.
	AI_Output(self,other,"DIA_Sancho_About_12_03");	//Dříve nebo později Esteban dostane Quentina z cesty, to je pravda.
	B_LogEntry(CH1_ESTEBANQUENTIN,"Sanchovi je jedno, kdo je šéfem tábora. Jeho pozice se v táboře nezmění. Myslí si však, že kormidlo už brzy převezme Esteban.");
	SANCHO_ESTEBAN = TRUE;
};

instance DIA_SANCHO_RAVEN(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_raven_condition;
	information = dia_sancho_raven_info;
	permanent = 0;
	important = 1;
};

func int dia_sancho_raven_condition()
{
	if(Kapitel >= 4)
	{
		return 1;
	};
};

func void dia_sancho_raven_info()
{
	AI_Output(self,other,"DIA_Sancho_Raven_15_00");	//Hej ty! Na tvém místě bych se hned otočil!
	AI_Output(other,self,"DIA_Sancho_Raven_12_01");	//Proč?
	if(Npc_IsDead(Org_858_Quentin))
	{
		AI_Output(self,other,"DIA_Sancho_Raven_12_12");	//Protože jsi zabil Quentina, Esteban se stal vůdcem tábora.
		AI_Output(other,self,"DIA_Sancho_Raven_12_03");	//Co??
		AI_Output(self,other,"DIA_Sancho_Raven_12_04");	//To není všechno.
		AI_Output(self,other,"DIA_Sancho_Raven_12_05");	//Poté, co Starý tábor zaútočil na Svobodný důl, přišel do našeho tábora vyjednávat s Estebanem jeden Rudobaron s několika stráži.
		AI_Output(self,other,"DIA_Sancho_Raven_12_08");	//Teď spolu s Rudobaronem sedí v údolí a plánují co dál.
		AI_Output(self,other,"DIA_Sancho_Raven_12_09");	//Kdybych byl tebou do Kotliny bych nešel, stáhnou tě tam z kůže.
	}
	else
	{
		AI_Output(self,other,"DIA_Sancho_Raven_12_02");	//Esteban se ujal vedení. Zabil Quentina.
		AI_Output(other,self,"DIA_Sancho_Raven_12_03");	//Co??
		AI_Output(self,other,"DIA_Sancho_Raven_12_04");	//To není všechno.
		AI_Output(self,other,"DIA_Sancho_Raven_12_05");	//Poté, co Starý tábor zaútočil na Svobodný důl, přišel do našeho tábora vyjednávat s Estebanem jeden Rudobaron s několika stráži.
		AI_Output(self,other,"DIA_Sancho_Raven_12_15");	//Chtěl, aby jim Quentin a jeho chlapi pomohli zaútočit na Svobodný důl.
		AI_Output(self,other,"DIA_Sancho_Raven_12_06");	//Quentin odmítl pomoc Starému táborem, protože nechtěl zradit Nový tábor.
		AI_Output(self,other,"DIA_Sancho_Raven_12_07");	//Esteban byl jiného názoru a tak dostal Quentina z cesty.
		AI_Output(self,other,"DIA_Sancho_Raven_12_08");	//Teď spolu s Rudobaronem sedí v údolí a plánují co dál.
		AI_Output(self,other,"DIA_Sancho_Raven_12_09");	//Kdybych byl tebou do Kotliny bych nešel, stáhnou tě tam z kůže.
	};
};

