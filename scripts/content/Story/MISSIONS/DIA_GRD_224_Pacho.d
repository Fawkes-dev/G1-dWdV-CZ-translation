instance Info_Pacho_EXIT(C_Info)
{
	npc = GRD_224_Pacho;
	nr = 999;
	condition = Info_Pacho_EXIT_Condition;
	information = Info_Pacho_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Pacho_EXIT_Condition()
{
	return TRUE;
};

func void Info_Pacho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Pacho_STOP(C_Info)
{
	npc = GRD_224_Pacho;
	condition = Info_Pacho_STOP_Condition;
	information = Info_Pacho_STOP_Info;
	important = 1;
	permanent = 0;
};

func int Info_Pacho_STOP_Condition()
{
	return TRUE;
};

func void Info_Pacho_STOP_Info()
{
	AI_Output(self,hero,"Info_Pacho_STOP_13_01");	//Hej, ty!
	AI_Output(hero,self,"Info_Pacho_STOP_15_02");	//Kdo? Já?
	AI_Output(self,hero,"Info_Pacho_STOP_13_03");	//Ne, tvoje bába... Kdo jiný asi?!
	AI_Output(self,hero,"Info_Pacho_STOP_13_04");	//Být tebou, tak bych tudy nechodil!
	AI_Output(hero,self,"Info_Pacho_STOP_15_05");	//Proč ne?
	AI_Output(self,hero,"Info_Pacho_STOP_13_06");	//Ty tady asi nejsi ještě dlouho!
	AI_Output(self,hero,"Info_Pacho_STOP_13_07");	//Člověče, to je cesta do země skřetů...
	AI_Output(self,hero,"Info_Pacho_STOP_13_08");	//Udělají z tebe sekanou!
	AI_Output(hero,self,"Info_Pacho_STOP_15_09");	//Och.
	AI_Output(self,hero,"Info_Pacho_STOP_13_10");	//Vítej!
	AI_StopProcessInfos(self);
};

instance INFO_PACHO_MESSAGE(C_Info)
{
	npc = GRD_224_Pacho;
	condition = info_pacho_message_condition;
	information = info_pacho_message_info;
	important = 0;
	permanent = 0;
	description = "Mám pro tebe vzkaz.";
};

func int info_pacho_message_condition()
{
	return TRUE;
};

func void info_pacho_message_info()
{
	AI_Output(hero,self,"Info_Pacho_Message_15_02");	//Mám pro tebe vzkaz.
	AI_Output(self,hero,"Info_Pacho_Message_13_01");	//Opravdu?
	AI_Output(hero,self,"Info_Pacho_Message_15_03");	//Tvůj kámoš Orry vzkazuje, že další kolo je na něj.
	AI_Output(self,hero,"Info_Pacho_Message_15_04");	//Vím o tom, hehe.
	ORRY_MESSAGE = LOG_SUCCESS;
	B_LogEntry(CH1_MESSAGEPACHO,"Zprávu jsem sdělil Pachovi, ale nic víc se od něj nedozvěděl. Přinejmenším Pacho vypadal, že mi je vděčný.");
	Log_SetTopicStatus(CH1_MESSAGEPACHO,LOG_SUCCESS);
	B_GiveXP(XP_PACHOMESSAGE);
	AI_StopProcessInfos(self);
};

