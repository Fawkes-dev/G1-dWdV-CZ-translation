instance DIA_Gomez_Exit(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 999;
	condition = DIA_Gomez_Exit_Condition;
	information = DIA_Gomez_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Gomez_Exit_Condition()
{
	return 1;
};

func void DIA_Gomez_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gomez_Fault(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Fault_Condition;
	information = DIA_Gomez_Fault_Info;
	permanent = 0;
	description = "Přišel jsem nabídnout své služby.";
};

func int DIA_Gomez_Fault_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Raven_There))
	{
		return 1;
	};
};

func void DIA_Gomez_Fault_Info()
{
	AI_Output(other,self,"DIA_Gomez_Fault_15_00");	//Přišel jsem nabídnout své služby.
	AI_Output(self,other,"DIA_Gomez_Fault_11_01");	//Tak ty jsi sem přišel a myslíš si, že se o tebe budu zajímat, ty červe? STRÁŽE!
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
};

var int gomez_kontakte;

instance DIA_Gomez_Hello(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Hello_Condition;
	information = DIA_Gomez_Hello_Info;
	permanent = 1;
	description = "Přišel jsem nabídnout své služby.";
};

func int DIA_Gomez_Hello_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_There) && (gomez_kontakte < 4))
	{
		return 1;
	};
};

func void DIA_Gomez_Hello_Info()
{
	AI_Output(other,self,"DIA_Gomez_Hello_15_00");	//Přišel jsem nabídnout své služby.
	AI_Output(self,other,"DIA_Gomez_Hello_11_01");	//Proč si myslíš, že bysme měli mít o tvoje služby zájem?
	Info_ClearChoices(DIA_Gomez_Hello);
	Info_AddChoice(DIA_Gomez_Hello,"Doufám, že ti nebudu muset useknout hlavu, abych ti ukázal, že se umím...",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice(DIA_Gomez_Hello,"Tady jsou jenom hňupové.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice(DIA_Gomez_Hello,"Chodil jsem po všech táborech a ve všech mám známé.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice(DIA_Gomez_Hello,"Složil jsem zkoušku poctivosti.",DIA_Gomez_Hello_ThorusSays);
};

func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output(other,self,"DIA_Gomez_Hello_ThorusSays_15_00");	//Složil jsem zkoušku poctivosti a Thorus říkal, že právem.
	AI_Output(self,other,"DIA_Gomez_Hello_ThorusSays_11_01");	//Kdyby to tak opravdu nebylo, nebyl by ses sem dostal živý. Doufám ale, že to nebylo všechno, co umíš.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_15_00");	//Chodil jsem po všech táborech a ve všech mám známé.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_11_01");	//Tak to by bylo užitečné. S kým jsi ve spojení?
	Info_ClearChoices(DIA_Gomez_Hello);
	Info_AddChoice(DIA_Gomez_Hello,"To byly ty důležité.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	if(Npc_KnowsInfo(hero,Org_843_Sharky_GREET) && Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		Info_AddChoice(DIA_Gomez_Hello,"Pár přechovávačů v Novém táboře.",DIA_Gomez_Hello_Kontakte_NLHehler);
	};
	if(Org_801_Lares.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(DIA_Gomez_Hello,"Lares.",DIA_Gomez_Hello_Kontakte_Lares);
	};
	if(Sld_700_Lee.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(DIA_Gomez_Hello,"Lee.",dia_gomez_hello_kontakte_lee);
	};
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_FanaticTeacher) && Npc_KnowsInfo(hero,DIA_BaalNamib_FirstTalk) && Npc_KnowsInfo(hero,DIA_BaalOrun_FirstTalk))
	{
		Info_AddChoice(DIA_Gomez_Hello,"Pár Baalů v táboře Bratrstva.",DIA_Gomez_Hello_Kontakte_Baals);
	};
	if(GUR_1201_CorKalom.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(DIA_Gomez_Hello,"Cor Kalom.",DIA_Gomez_Hello_Kontakte_Kalom);
	};
	if(gomez_kontakte < 3)
	{
		Info_AddChoice(DIA_Gomez_Hello,"Y'Berion.",DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Spinner_15_00");	//Jsou tu jenom hňupové, kteří všechnu práci jenom přehazují na nováčky, místo aby ji dělali sami.
	AI_Output(self,other,"DIA_Gomez_Hello_Spinner_11_01");	//To je, až na pár výjimek, pravda. Není to ale vůbec důvod najímat další hňupy.
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output(other,self,"DIA_Gomez_Hello_KopfAb_15_00");	//Doufám, že ti nebudu muset useknout hlavu, abych ti ukázal, že se umím ohánět se zbraní.
	AI_Output(self,other,"DIA_Gomez_Hello_KopfAb_11_01");	//Mezi hrdinstvím a pitomostí je jen velmi malý rozdíl.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00");	//Y'Berion.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01");	//Y'Berion neztrácí čas s chlapíky jako jsi ty.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02");	//Lžeš mi, jako bych byl nějaký idiot.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03");	//Mrzí mě, když vidím, že mě máš za HLUPÁKA.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04");	//Nerad se cítím zklamaný.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00");	//Cor Kalom.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01");	//No a?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Baals_15_00");	//Pár Baalů v táboře Bratrstva.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Baals_11_01");	//No a?
	gomez_kontakte = gomez_kontakte + 1;
};

func void dia_gomez_hello_kontakte_lee()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Lee_15_00");	//Lee.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lee_11_01");	//Takže Lee je tvůj dobrý přítel, že?
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lee_11_02");	//Tak to je jiná, tos měl říci hned!
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Lares()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Lares_15_00");	//Lares.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lares_11_01");	//No a?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00");	//Několik překupníků v Novém táboře.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01");	//No a?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00");	//To byly ty důležité.
	if(gomez_kontakte >= 4)
	{
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01");	//To není špatné - na začátečníka.
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02");	//Měl bys dostat šanci.
		Info_ClearChoices(DIA_Gomez_Hello);
	}
	else
	{
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00");	//Myslíš si, že mě TOHLE dojme? To máme KOPÁČE s lepšími kontakty!
		Info_ClearChoices(DIA_Gomez_Hello);
	};
};

instance DIA_Gomez_Dabei(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Dabei_Condition;
	information = DIA_Gomez_Dabei_Info;
	permanent = 0;
	description = "Znamená to, že jsem přijat?";
};

func int DIA_Gomez_Dabei_Condition()
{
	if((gomez_kontakte >= 4) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Gomez_Dabei_Info()
{
	AI_Output(other,self,"DIA_Gomez_Dabei_15_00");	//Znamená to, že jsem přijat?
	AI_Output(self,other,"DIA_Gomez_Dabei_11_01");	//Přesně tak. Jsi jedním z nás, hochu.
	AI_Output(self,other,"DIA_Gomez_Dabei_11_02");	//Raven tě do všeho zasvětí.
	Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,2,-1);
	Mdl_ApplyOverlayMds(hero,"Humans_Relaxed.mds");
	Npc_SetTrueGuild(hero,GIL_STT);
	hero.guild = GIL_STT;
	B_GiveXP(XP_BecomeShadow);
	B_LogEntry(CH1_JoinOC,"Ode dneška pracuji pro Gomeze a Starý tábor. Raven mi řekne vše potřebné!");
	Log_SetTopicStatus(CH1_JoinOC,LOG_SUCCESS);
	Wld_AssignRoomToGuild("NLHU25",GIL_SLD);
	Wld_AssignRoomToGuild("psih22",GIL_NOV);
	Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinNC,LOG_FAILED);
	B_LogEntry(CH1_JoinNC,"Od doby, co patřím ke Gomezovým lidem, nemůžu být přijat do Laresovy tlupy.");
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_FAILED);
	B_LogEntry(CH1_JoinPsi,"Nyní je Starý tábor mým novým domovem. Bratrstvo Spáče si bude muset poradit beze mě.");
	AI_StopProcessInfos(self);
};

instance DIA_Gomez_NurSo(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_NurSo_Condition;
	information = DIA_Gomez_NurSo_Info;
	permanent = 1;
	description = "Chci ti podat hlášení.";
};

func int DIA_Gomez_NurSo_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Gomez_NurSo_Info()
{
	AI_Output(other,self,"DIA_Gomez_NurSo_15_00");	//Chci ti podat hlášení.
	AI_Output(self,other,"DIA_Gomez_NurSo_11_00");	//Tak jdi a navštiv Ravena. A nikdy už na mě nemluv, dokud tě nevybídnu!
};

instance DIA_EBR_100_Gomez_Wait4SC(C_Info)
{
	npc = EBR_100_Gomez;
	condition = DIA_EBR_100_Gomez_Wait4SC_Condition;
	information = DIA_EBR_100_Gomez_Wait4SC_Info;
	important = 1;
	permanent = 0;
};

func int DIA_EBR_100_Gomez_Wait4SC_Condition()
{
	if((Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (ExploreSunkenTower == TRUE))
	{
		return TRUE;
	};
};

func void DIA_EBR_100_Gomez_Wait4SC_Info()
{
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_01");	//Jak ses sem dostal?
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_02");	//Stůj! Nejsi ty ten, co bojoval s našimi muži v Svobodném dole?
	AI_Output(other,self,"DIA_EBR_100_Gomez_Wait4SC_15_03");	//Tví muži neměli právo je napadnout! Jen jsem ztrestal jejich megalomanský útok!
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_04");	//Máš odvahu, takhle se mnou - GOMEZEM - mluvit. Ale bylo od tebe dost hloupé, takhle sem vpadnout.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_05");	//Osobně dohlédnu, abys mi už nikdy nezkřížil cestu.
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
};

