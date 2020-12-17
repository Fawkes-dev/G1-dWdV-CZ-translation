instance DIA_Jesse_Exit(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 999;
	condition = DIA_Jesse_Exit_Condition;
	information = DIA_Jesse_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Jesse_Exit_Condition()
{
	return 1;
};

func void DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Jesse_Hallo(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Hallo_Condition;
	information = DIA_Jesse_Hallo_Info;
	permanent = 0;
	description = "Jak to jde?";
};

func int DIA_Jesse_Hallo_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

func void DIA_Jesse_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Jesse_Hallo_03_01");	//Jsi tu nový, viď? Měl bys vědět, že se strážemi není dobré mít problémy.
	AI_Output(self,other,"DIA_Jesse_Hallo_03_02");	//Když budou chtít peníze za ochranu, raději zaplať, jinak bude polovina tábora proti tobě.
};

instance DIA_Jesse_Warn(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Warn_Condition;
	information = DIA_Jesse_Warn_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Jesse_Warn_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Herek_Bully) && (Herek_ProtectionBully == TRUE))
	{
		return 1;
	};
};

func void DIA_Jesse_Warn_Info()
{
	AI_Output(self,other,"DIA_Jesse_Warn_03_00");	//Hej, ty! Slyšel jsem, že jsi nezaplatil Bloodwynovi peníze za ochranu?
	AI_Output(other,self,"DIA_Jesse_Warn_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Jesse_Warn_03_02");	//Varovat tě! Bloodwyn zaplatil pár lidem: ti po tobě půjdou.
	AI_Output(self,other,"DIA_Jesse_Warn_03_03");	//Viděl jsem, jak mluví s lidmi jako Herek, a bůhví, koho si ještě najal!
	AI_Output(other,self,"DIA_Jesse_Warn_15_04");	//Co se týká Hereka, je tvé varování trochu opožděné.
	AI_Output(self,other,"DIA_Jesse_Warn_03_05");	//Musel mluvit ještě s někým dalším, tolik toho vím. Tak buď opatrný.
};

instance DIA_Jesse_Mission(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Mission_Condition;
	information = DIA_Jesse_Mission_Info;
	permanent = 0;
	description = "Proč jsi mi vyprávěl celou tu historku o Bloodwynovi?";
};

func int DIA_Jesse_Mission_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jesse_Warn))
	{
		return 1;
	};
};

func void DIA_Jesse_Mission_Info()
{
	AI_Output(other,self,"DIA_Jesse_Mission_15_00");	//Proč jsi mi vyprávěl celou tu historku o Bloodwynovi?
	AI_Output(self,other,"DIA_Jesse_Mission_03_01");	//Protože službička by se měla oplatit. A ty nevypadáš jako někdo, kdo by to nepochopil.
	AI_Output(self,other,"DIA_Jesse_Mission_03_02");	//A protože já jsem prokázal laskavost TOBĚ, rád bych ti dal příležitost mi to oplatit.
	Info_ClearChoices(DIA_Jesse_Mission);
	Info_AddChoice(DIA_Jesse_Mission,"Zapomeň na to! Nic ti nedlužím!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice(DIA_Jesse_Mission,"Co máš přesně na mysli?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output(other,self,"DIA_Jesse_Mission_ForgetIt_15_00");	//Nic ti nedlužím!
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01");	//Asi jsem se v tobě mýlil. Příště už se mnou nepočítej.
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(DIA_Jesse_Mission);
	AI_StopProcessInfos(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output(other,self,"DIA_Jesse_Mission_What_15_00");	//Co máš přesně na mysli?
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_01");	//Už mi nezbyla žádná ruda a Bloodwyn už mě taky obral.
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_02");	//Když jsem ti teď pomohl, měl bys mu dát 10 nugetů, které mu dlužím, jo? Řekni mu, že je to ode mě.
	Npc_SetTrueGuild(self,GIL_None);
	Info_AddChoice(DIA_Jesse_Mission,"Já, platit za tebe? Na to zapomeň!",DIA_Jesse_Mission_NO);
	Info_AddChoice(DIA_Jesse_Mission,"Uvidím, co budu moci udělat.",DIA_Jesse_Mission_YES);
};

func void DIA_Jesse_Mission_YES()
{
	AI_Output(other,self,"DIA_Jesse_Mission_YES_15_00");	//Uvidím, co budu moci udělat.
	AI_Output(self,other,"DIA_Jesse_Mission_YES_03_01");	//Díky, člověče! Zachránil jsi mě! Řekneš mi, až se věci urovnají, viď?
	Jesse_PayForMe = LOG_RUNNING;
	Log_CreateTopic(CH1_JESSE,LOG_MISSION);
	B_LogEntry(CH1_JESSE,"Kopáč Jesse mě požádal, abych za něj zaplatil Bloodwynovi peníze na ochranu - 10 nugetů.");
	Log_SetTopicStatus(CH1_JESSE,LOG_RUNNING);
	Info_ClearChoices(DIA_Jesse_Mission);
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output(other,self,"DIA_Jesse_Mission_NO_15_00");	//Já, platit za tebe? Na to zapomeň!
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01");	//Asi jsem se v tobě mýlil. Příště už se mnou nepočítej.
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(DIA_Jesse_Mission);
};

instance DIA_Jesse_MisSuccess(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_MisSuccess_Condition;
	information = DIA_Jesse_MisSuccess_Info;
	permanent = 0;
	description = "Zaplatil jsem Bloodwynovi!";
};

func int DIA_Jesse_MisSuccess_Condition()
{
	if(Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Jesse_MisSuccess_Info()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_15_00");	//Zaplatil jsem Bloodwynovi!
	AI_Output(self,other,"DIA_Jesse_MisSuccess_03_01");	//Tak? Výborně! Tak jsme si kvit.
	Npc_SetTrueGuild(self,GIL_VLK);
	Jesse_PayForMe = LOG_SUCCESS;
	B_LogEntry(CH1_JESSE,"Řekl jsem Jessemu, že jsem Bloodwynovi zaplatil za ochranu. Měl z toho radost.");
	Log_SetTopicStatus(CH1_JESSE,LOG_SUCCESS);
	B_GiveXP(XP_JESSEPAYFORME);
	Info_ClearChoices(DIA_Jesse_MisSuccess);
	Info_AddChoice(DIA_Jesse_MisSuccess,"COŽEEE? Utratil jsem 10 nugetů za otrapu, kterého jsem ani neznal?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice(DIA_Jesse_MisSuccess,"Tak. Ruka ruku myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Waaas_15_00");	//COŽEEE? Utratil jsem 10 nugetů za otrapu, kterého jsem ani neznal?
	AI_Output(self,other,"DIA_Jesse_MisSuccess_Waaas_03_01");	//Vypadá to tak.
	AI_StopProcessInfos(self);
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Ok_15_00");	//Tak. Ruka ruku myje.
	AI_StopProcessInfos(self);
};

instance DIA_JESSE_SWORD(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = dia_jesse_sword_condition;
	information = dia_jesse_sword_info;
	permanent = 0;
	description = "Kde je Hunův meč?";
};

func int dia_jesse_sword_condition()
{
	if(Npc_KnowsInfo(hero,dia_fingers_hunosschwert))
	{
		return 1;
	};
};

func void dia_jesse_sword_info()
{
	AI_Output(other,self,"DIA_Jesse_Sword_15_00");	//Kde je Hunův meč?
	AI_Output(self,other,"DIA_Jesse_Sword_03_01");	//Co? O tom nic nevím.
	AI_Output(other,self,"DIA_Jesse_Sword_03_02");	//No tak už mi to řekni, vím, že s tím máš něco společného.
	AI_Output(self,other,"DIA_Jesse_Sword_03_03");	//Dobrá, přiznávám, že jsem ten meč ukradl.
	AI_Output(self,other,"DIA_Jesse_Sword_03_04");	//Potřebuju rudu, jinak nemůžu strážcům zaplatit peníze na ochranu.
	AI_Output(self,other,"DIA_Jesse_Sword_03_05");	//Prodal jsem meč obchodníkovi z Nového tábora.
	AI_Output(self,other,"DIA_Jesse_Sword_03_06");	//Myslím, že se ten chlap jmenoval Mordrag, zrdžuje se poblíž jižní brány.
	AI_Output(self,other,"DIA_Jesse_Sword_03_07");	//Pokud chceš ten meč, promluv si o tom s ním.
	B_LogEntry(CH1_HUNOLOSTSWORD,"Meč ukradl kopáč Jesse. Prodal to Mordragovi, přechovávačovi z Nového tábora.");
};

