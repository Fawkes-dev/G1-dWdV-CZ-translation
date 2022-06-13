instance DIA_BAALLUKOR_EXIT(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 999;
	condition = dia_baallukor_exit_condition;
	information = dia_baallukor_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_baallukor_exit_condition()
{
	return 1;
};

func void dia_baallukor_exit_info()
{
	AI_StopProcessInfos(self);
};

var int baallukor_sakrileg;

instance DIA_BAALLUKOR_NOTALK(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 1;
	condition = dia_baallukor_notalk_condition;
	information = dia_baallukor_notalk_info;
	permanent = 1;
	important = 1;
};

func int dia_baallukor_notalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BAALLUKOR_ANSPRECHBAR == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_baallukor_notalk_info()
{
	Info_ClearChoices(dia_baallukor_notalk);
	Info_AddChoice(dia_baallukor_notalk,DIALOG_ENDE,dia_baallukor_notalk_ende);
	Info_AddChoice(dia_baallukor_notalk,"Je všechno v pořádku, příteli?",dia_baallukor_notalk_imp);
	Info_AddChoice(dia_baallukor_notalk,"Spáč buď s tebou!",dia_baallukor_notalk_sleeper);
	Info_AddChoice(dia_baallukor_notalk,"Zdar! Jsem tu nový!",dia_baallukor_notalk_hi);
};

func void dia_baallukor_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Zdar! Jsem tu nový!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//(vzdech)
	BAALLUKOR_SAKRILEG = TRUE;
};

func void dia_baallukor_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Spáč buď s tebou!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//(vzdech)
	BAALLUKOR_SAKRILEG = TRUE;
};

func void dia_baallukor_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Je všechno v pořádku, příteli?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//(vzdech)
	BAALLUKOR_SAKRILEG = TRUE;
};

func void dia_baallukor_notalk_ende()
{
	AI_StopProcessInfos(self);
};

instance DIA_BAALLUKOR_HYPNOTICTEACHER(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 1;
	condition = dia_baallukor_hypnoticteacher_condition;
	information = dia_baallukor_hypnoticteacher_info;
	permanent = 0;
	important = 1;
};

func int dia_baallukor_hypnoticteacher_condition()
{
	if(BAALLUKOR_ANSPRECHBAR == TRUE)
	{
		return 1;
	};
};

func void dia_baallukor_hypnoticteacher_info()
{
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_01");	//Svoji cestu si zvol moudře a po pečlivém zvážení.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_02");	//Přemýšlej a rozhodni se. Ostatní tábory ti nabídnou přístřeší a jídlo. Je to ale to co opravdu chceš?
	AI_Output(other,self,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_15_03");	//Co můžu očekávat zde? Co z toho budu mít, když se přidám k Vám?
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_04");	//Mohl bych ti vyprávět o nezdolné síle mysli našich Templářů. Nebo o magii nás Guru, která převyšuje představivost Mágů Ohně a Vody.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_05");	//Naše práce nás naplňuje. Ale to není to jediné, co naše komunita nabízí.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_06");	//U nás najdeš jeho dar. Vydáš se na nelehkou cestu!
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_07");	//To čeho se zde dočkáš, je nepředstavitelná síla. Síla, která tě dovede k osvícení. Síla, která nás osvobodí.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_08");	//Není právě ... svoboda to co chceš?
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_09");	//Neměl by ses ptát zdali se přidat, otázka je proč se nepřidat?
	Info_ClearChoices(dia_baallukor_hypnoticteacher);
	Info_AddChoice(dia_baallukor_hypnoticteacher,"(nic neříkej)",dia_baallukor_hypnoticteacher_muteende);
	Info_AddChoice(dia_baallukor_hypnoticteacher,"Ano, chci následovat Spáče.",dia_baallukor_hypnoticteacher_where);
};

func void dia_baallukor_hypnoticteacher_where()
{
	AI_Output(other,self,"DIA_BaalLukor_HypnoticTeacher_Where_15_00");	//Ano, chci následovat Spáče.
	AI_Output(self,other,"DIA_BaalLukor_HypnoticTeacher_Where_12_01");	//Tak jdi za Cor Kalomem. Udělá z tebe pravého služebníka Spáče.
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Lukor chce, abych se stal skutečným služebníkem Spáče.");
	B_GiveXP(XP_ImpressBaalCadar);
};

func void dia_baallukor_hypnoticteacher_muteende()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

