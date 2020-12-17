instance DIA_Joru_Exit(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 999;
	condition = DIA_Joru_Exit_Condition;
	information = DIA_Joru_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Joru_Exit_Condition()
{
	return 1;
};

func void DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_JORU_SMOKINGTEACHER(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 1;
	condition = dia_joru_smokingteacher_condition;
	information = dia_joru_smokingteacher_info;
	permanent = 0;
	important = 1;
	description = "Neu hier? [important - no description required]";
};

func int dia_joru_smokingteacher_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void dia_joru_smokingteacher_info()
{
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_15_00");	//Jsi tu nový, že? Už jsi vyzkoušel naši rostlinu?
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_07_01");	//Určitě bys to měl udělat. Je docela dobrá, a třeba otevře tvoji mysl Spáčovým slovům.
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_07_02");	//Pojď, přidej se k nám a uvolni svou mysl. Připrav se na výlet.
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_07_03");	//Duchovní cesta. Nauč se používat sílu své mysli. Nauč se ji ovládat.
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_07_04");	//Osvoboď se od hledání a začneš objevovat. Objev pravdu. To všechno můžeš dosáhnout, když se k nám přidáš.
};

instance DIA_Joru_Greet(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 1;
	condition = DIA_Joru_Greet_Condition;
	information = DIA_Joru_Greet_Info;
	permanent = 0;
	description = "Co tady děláš?";
};

func int DIA_Joru_Greet_Condition()
{
	return 1;
};

func void DIA_Joru_Greet_Info()
{
	AI_Output(other,self,"DIA_Joru_Greet_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Joru_Greet_07_01");	//Učím novice Spáčovu poselství.
	AI_Output(self,other,"DIA_Joru_Greet_07_02");	//Jsem ještě novic, ale brzy budu Baal - jeden z Guru.
	AI_Output(self,other,"DIA_Joru_Greet_07_03");	//Už jsem mluvil s Y´Berionem. Je tím vyvoleným. Říkal mi, že jestli budu tvrdě pracovat, můžu se zanedlouho sám stát mistrem.
	AI_Output(self,other,"DIA_Joru_Greet_07_04");	//Pořád to ale odkládám. Žádný spěch - rozumíš? Můžu se stát mistrem kdykoliv.
	AI_Output(self,other,"DIA_Joru_Greet_07_05");	//V tuhle chvíli jsem docela spokojený se svým současným posláním.
};

instance DIA_Joru_Tester(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 1;
	condition = DIA_Joru_Tester_Condition;
	information = DIA_Joru_Tester_Info;
	permanent = 0;
	description = "Jaké je teď tvoje poslání?";
};

func int DIA_Joru_Tester_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

func void DIA_Joru_Tester_Info()
{
	AI_Output(other,self,"DIA_Joru_Tester_15_00");	//Jaké je teď tvoje poslání?
	AI_Output(self,other,"DIA_Joru_Tester_07_01");	//Zkouším tu se svými kamarády nové substance, které ve své dílně vyrobil Cor Kalom.
	AI_Output(self,other,"DIA_Joru_Tester_07_02");	//Jeho úsilí nám každých pár dní přináší něco nového. A my to testujeme.
	AI_Output(self,other,"DIA_Joru_Tester_07_03");	//Tahle droga otevírá duši. Když vezmeš správné množství, můžeš vejít do spojení se Spáčem.
};

instance DIA_Joru_SleeperContact(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 1;
	condition = DIA_Joru_SleeperContact_Condition;
	information = DIA_Joru_SleeperContact_Info;
	permanent = 0;
	description = "Už jsi byl někdy ve spojení se Spáčem?";
};

func int DIA_Joru_SleeperContact_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

func void DIA_Joru_SleeperContact_Info()
{
	AI_Output(other,self,"DIA_Joru_SleeperContact_15_00");	//Už jsi byl někdy ve spojení se Spáčem?
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_01");	//Ne. Ještě ne. Ale jen protože jsem nikdy neměl dost té látky.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_02");	//Kalom chce vždycky vědět o vyvolaných účincích, ale mám dojem, že ho můj názor vlastně doopravdy nezajímá.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_03");	//Jestliže zjistím, že ta látka stimuluje, předá ji přímo Guru...
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_04");	//Brzy ale budu sám Guru, a pak budu moci zajít až na hranici svých možností a naslouchat Spáčovu hlasu sám.
};

var int Joru_BringJoints;

instance DIA_Joru_JoinPsi(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 5;
	condition = DIA_Joru_JoinPsi_Condition;
	information = DIA_Joru_JoinPsi_Info;
	permanent = 0;
	description = "Rád bych se přidal k vašemu táboru - pomůžeš mi?";
};

func int DIA_Joru_JoinPsi_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Joru_Greet) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Joru_JoinPsi_Info()
{
	AI_Output(other,self,"DIA_Joru_JoinPsi_15_00");	//Rád bych se přidal k vašemu táboru - pomůžeš mi?
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_01");	//Chceš se k nám přidat? To je dobře! Počkej chvíli... ano, myslím, že ti můžu pomoci.
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_02");	//Nejsem ještě Guru, mám ale určitý vliv na Bratrstvo.
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_03");	//Musíš mi prokázat malou laskavost. Už jsi viděl Fortuna?
	Info_ClearChoices(DIA_Joru_JoinPsi);
	Info_AddChoice(DIA_Joru_JoinPsi,"Ne.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice(DIA_Joru_JoinPsi,"Ano.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//Ano.
	AI_Output(self,other,"DIA_Joru_JoinPsi_Ja_07_00");	//Pak už máš svůj denní příděl? Když mi ho dáš, jsme domluveni.
	AI_Output(other,self,"DIA_Joru_JoinPsi_Ja_15_01");	//Rozmyslím si to.
	Joru_BringJoints = LOG_RUNNING;
	Info_ClearChoices(DIA_Joru_JoinPsi);
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//Ne.
	AI_Output(self,other,"DIA_Joru_JoinPsi_Nein_07_00");	//Pak jdi za ním a  vyzvedni si svůj denní příděl. Když mi přenecháš všechnu drogu z bažin, kterou ti dá, budeme domluveni.
	AI_Output(other,self,"DIA_Joru_JoinPsi_Nein_15_01");	//Rozmyslím si to.
	Joru_BringJoints = LOG_RUNNING;
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	B_LogEntry(CH1_JoinPsi,"Joru by chtěl můj denní příděl drogy z bažin, kterou jsem dostal od Fortuna.");
	Info_ClearChoices(DIA_Joru_JoinPsi);
};

instance DIA_Joru_JointsRunning(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 5;
	condition = DIA_Joru_JointsRunning_Condition;
	information = DIA_Joru_JointsRunning_Info;
	permanent = 1;
	description = "Mám svoji drogu z bažin. Můžeš ji mít.";
};

func int DIA_Joru_JointsRunning_Condition()
{
	if(Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Joru_JointsRunning_Info()
{
	AI_Output(other,self,"DIA_Joru_JointsRunning_15_00");	//Mám svoji drogu z bažin. Můžeš ji mít.
	if(Npc_HasItems(other,ItMiJoint_2) >= 3)
	{
		AI_Output(self,other,"DIA_Joru_JointsRunning_07_01");	//Dobře! Jistě sis všimnul, že s tebou nikdo z Guru nechce mluvit.
		AI_Output(self,other,"DIA_Joru_JointsRunning_07_02");	//Můžeš to změnit tím, že na ně uděláš dojem. Můžu ti říci, jak to udělat.
		B_GiveInvItems(other,self,ItMiJoint_2,3);
		Joru_BringJoints = LOG_SUCCESS;
		B_GiveXP(XP_WeedForJoru);
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00");	//Domluvili jsme si tři Severní soumraky a nic jiného! Dej mi je a POTOM se můžeme bavit!
	};
};

var int Joru_Tips;

instance DIA_Joru_ImpressGurus(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 5;
	condition = DIA_Joru_ImpressGurus_Condition;
	information = DIA_Joru_ImpressGurus_Info;
	permanent = 1;
	description = "Jak můžu udělat dojem na Guru?";
};

func int DIA_Joru_ImpressGurus_Condition()
{
	if((Joru_BringJoints == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Joru_ImpressGurus_Info()
{
	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_00");	//Jak můžu udělat dojem na Guru?
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_01");	//Baal Cadar cvičí novice ve Spáčově magii.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_02");	//Jestliže chceš upoutat jeho pozornost, použij kouzlo.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_03");	//Nepoužívej však na něj Větrnou pěst! Uspi jeho posluchače nebo něco takového.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_04");	//Baal Namib, za hlavní branou, je jeden z nejtvrdších. Myslím, že by ti s ním mohl pomoci Lester. Promluv s ním, jakmile bude jeho pán pryč.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_05");	//Ostatní Guru jsou vcelku v pohodě - snaž se být užitečný.
	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_06");	//Díky za radu.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_07");	//Hej - dohoda je dohoda.
	if(Joru_JoinPsi == FALSE)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		B_LogEntry(CH1_JoinPsi,"Abych udělal dojem na Baala Cadara, měl bych seslat na jednoho z jeho žáků kouzlo Spánku.");
		B_LogEntry(CH1_JoinPsi,"Zeptám se novice Lestera, jak udělat dojem na Baala Namiba přebývajícího u hlavní brány. Měl bych se ujistit, že není v blízkosti žádný guru!");
		Joru_JoinPsi = TRUE;
	};
	Joru_Tips = TRUE;
};

instance DIA_Joru_GetMagic(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 5;
	condition = DIA_Joru_GetMagic_Condition;
	information = DIA_Joru_GetMagic_Info;
	permanent = 1;
	description = "Jak se dostanu ke Spáčově magii?";
};

func int DIA_Joru_GetMagic_Condition()
{
	if((Joru_Tips == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Joru_GetMagic_Info()
{
	if(Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
		B_LogEntry(GE_TraderPSI,"Baal Cadar prodává RUNY a SVITKY.");
		Joru_Tips_Mage = TRUE;
	};
	AI_Output(other,self,"DIA_Joru_GetMagic_15_00");	//Jak se dostanu ke Spáčově magii?
	AI_Output(self,other,"DIA_Joru_GetMagic_07_01");	//Baal Cadar prodává runy a zaříkávací svitky. Ale to je ti vlastně k ničemu, dokud si s ním nepromluvíš, že?
	AI_Output(self,other,"DIA_Joru_GetMagic_07_02");	//Možná ti pomůže jiný Guru.
};

instance NOV_1305_JORU_WELCOME(C_Info)
{
	npc = NOV_1305_Joru;
	condition = nov_1305_joru_welcome_condition;
	information = nov_1305_joru_welcome_info;
	important = 1;
	permanent = 0;
};

func int nov_1305_joru_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1305_joru_welcome_info()
{
	AI_Output(self,other,"Nov_1305_Joru_WELCOME_Info_08_11");	//Jak vidím, byli jsi rychlejší než já a už je z tebe dokonce Guru. Výborně, příteli.
	AI_StopProcessInfos(self);
};

