instance DIA_GRD_5032_EXIT(C_Info)
{
	npc = grd_5032_carlos;
	nr = 999;
	condition = dia_grd_5032_exit_condition;
	information = dia_grd_5032_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_grd_5032_exit_condition()
{
	return 1;
};

func void dia_grd_5032_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GRD_5032_KLEINER(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_kleiner_condition;
	information = dia_grd_5032_kleiner_info;
	permanent = 0;
	important = 1;
	description = "Hey kleiner! [important - no description required]";
};

func int dia_grd_5032_kleiner_condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void dia_grd_5032_kleiner_info()
{
	AI_Output(self,other,"DIA_Grd_5032_kleiner_15_00");	//Hej ty! Pojď sem!
};

instance DIA_GRD_5032_WILLST(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_willst_condition;
	information = dia_grd_5032_willst_info;
	permanent = 0;
	important = 0;
	description = "Co ode mě chceš?";
};

func int dia_grd_5032_willst_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_5032_kleiner))
	{
		return 1;
	};
};

func void dia_grd_5032_willst_info()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_15_00");	//Co ode mě chceš?
	AI_Output(self,other,"DIA_Grd_5032_willst_01_01");	//Právě tě sem vhodili, co? Můžeš hned přiložit ruku k dílu.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_02");	//Než tě sem vhodili, dostali jsme donášku zboží z Vnějšího světa.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_03");	//Bohužel, pár věcí spadlo do vody.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_04");	//Seskoč tam a posbírej je.
	Info_ClearChoices(dia_grd_5032_willst);
	Info_AddChoice(dia_grd_5032_willst,"Co z toho budu mít?",dia_grd_5032_willst_okay);
	Info_AddChoice(dia_grd_5032_willst,"Proč si své sračky nevyřešíš sám?",dia_grd_5032_willst_selbst);
};

func void dia_grd_5032_willst_okay()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Okay_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Grd_5032_willst_okay_01_00");	//O tom si promluvíme až budeš mít hotovo.
	AI_Output(self,other,"DIA_Grd_5032_willst_okay_01_01");	//Teď koukej skočit zpátky do vody.
	Info_ClearChoices(dia_grd_5032_willst);
	Info_AddChoice(dia_grd_5032_willst,"Nejdříve si promluvíme o odměně.",dia_grd_5032_willst_belohnung);
	Info_AddChoice(dia_grd_5032_willst,"Dám se tedy do práce.",dia_grd_5032_willst_jetzt);
};

func void dia_grd_5032_willst_selbst()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_selbst_15_00");	//Proč si své sračky nevyřešíš sám?
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_00");	//Dej si pozor jak se mnou mluvíš!
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_01");	//Neboj brzo se naučíš, jak se mnou a ostaními máš mluvit, nováčku.
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_02");	//Máš štěstí, že mám dobrou náladu, dám ti lekci zdarma.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void dia_grd_5032_willst_belohnung()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Belohnung_15_00");	//Nejdříve si promluvíme o odměně.
	AI_Output(self,other,"DIA_Grd_5032_willst_Belohnung_01_00");	//Víš co tady děláme s drzými nováčky? Ne? Ukážu ti to.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void dia_grd_5032_willst_jetzt()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Jetzt_15_00");	//Dám se tedy do práce.
	AI_Output(self,other,"DIA_Grd_5032_willst_Jetzt_01_00");	//Pospěš si. Donáška zboží měla být už dávno ve Starém táboře.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	CARLOS_THINGS = LOG_RUNNING;
	Log_CreateTopic(CH1_CARLOSTHINGS,LOG_MISSION);
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_RUNNING);
	B_LogEntry(CH1_CARLOSTHINGS,"Carlos mi řekl, že některé věci spadly do jezera v místě výměny během poslední dodávky. Chce abych je vylovil.");
};

instance DIA_GRD_5032_NUNHELFEN(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_nunhelfen_condition;
	information = dia_grd_5032_nunhelfen_info;
	permanent = 0;
	important = 1;
	description = "Jetzt weißt du was mit Neuen passiert [important - no description required]";
};

func int dia_grd_5032_nunhelfen_condition()
{
	var C_Npc carlos;
	carlos = Hlp_GetNpc(grd_5032_carlos);
	if((carlos.aivar[AIV_HASDEFEATEDSC] == TRUE) && (CARLOS_THINGS == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5032_nunhelfen_info()
{
	AI_Output(self,other,"DIA_Grd_5032_nunhelfen_15_00");	//To se tady děje s drzými nováčky, co nevědí, jak se chovat.
	AI_Output(self,other,"DIA_Grd_5032_nunhelfen_01_01");	//Teď jdi zpátky do té vody, nebo tě tam shodím!
	CARLOS_THINGS = LOG_RUNNING;
	Log_CreateTopic(CH1_CARLOSTHINGS,LOG_MISSION);
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_RUNNING);
	B_LogEntry(CH1_CARLOSTHINGS,"Carlos mi nepříjemně ukázal, jaký je život tady v Kolonii. Mám pro něj vylovit vězci z jezera.");
};

instance DIA_GRD_5032_HABALLES(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_haballes_condition;
	information = dia_grd_5032_haballes_info;
	permanent = 0;
	important = 0;
	description = "Mám ty věci co jsi chtěl.";
};

func int dia_grd_5032_haballes_condition()
{
	if((Npc_HasItems(other,ItMiNugget) >= 3) && (Npc_HasItems(other,ItFo_Potion_Health_01) >= 2) && (Npc_HasItems(other,ItMiHammer) >= 1) && (Npc_HasItems(other,ItMi_Stuff_Cup_02) >= 1) && (Npc_HasItems(other,ItMiLute) >= 1) && (CARLOS_THINGS == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5032_haballes_info()
{
	AI_Output(other,self,"DIA_Grd_5032_HabAlles_15_00");	//Mám ty věci co jsi chtěl.
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_01_01");	//Dobře. Pošlu to se do tábora s dalším konvojem.
	AI_Output(other,self,"DIA_Grd_5032_HabAlles_01_02");	//A co moje odměna?
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_02_03");	//Tady máš kus magické rudy. To je víc než dost.
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_02_04");	//Teď rychle zmiz!
	B_GiveInvItems(other,self,ItMiNugget,3);
	B_GiveInvItems(other,self,ItFo_Potion_Health_01,2);
	B_GiveInvItems(other,self,ItMiHammer,1);
	B_GiveInvItems(other,self,ItMi_Stuff_Cup_02,1);
	B_GiveInvItems(other,self,ItMiLute,1);
	B_GiveInvItems(self,other,ItMiNugget,1);
	CARLOS_THINGS = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_SUCCESS);
	B_LogEntry(CH1_CARLOSTHINGS,"Poté, co jsem Carlosovi vylovil věci z jezera, moje odměna byla jen jediná hrudka rudy.");
	B_GiveXP(XP_CARLOSTHINGS);
};

instance DIA_GRD_5032_SUCHEN(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_suchen_condition;
	information = dia_grd_5032_suchen_info;
	permanent = 1;
	important = 0;
	description = "Kde přesně bych měl hledat?";
};

func int dia_grd_5032_suchen_condition()
{
	var C_Npc carlos;
	carlos = Hlp_GetNpc(grd_5032_carlos);
	if(CARLOS_THINGS == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_grd_5032_suchen_info()
{
	AI_Output(other,self,"DIA_Grd_5032_suchen_15_00");	//Kde přesně bych měl hledat?
	AI_Output(self,other,"DIA_Grd_5032_suchen_01_01");	//Děláš si ze mě srandu? Skoč tam a hledej na dně.
};

instance DIA_GRD_5032_DUELL(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_duell_condition;
	information = dia_grd_5032_duell_info;
	permanent = 0;
	important = 0;
	description = "Takhle snadno se nenechám odbít.";
};

func int dia_grd_5032_duell_condition()
{
	if(CARLOS_THINGS == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_grd_5032_duell_info()
{
	AI_Output(other,self,"DIA_Grd_5032_DUELL_15_00");	//Takhle snadno se nenechám odbít.
	AI_Output(self,other,"DIA_Grd_5032_DUELL_01_01");	//Oh? A co chceš dělat, chceš mě praštit?
	AI_Output(other,self,"DIA_Grd_5032_DUELL_01_02");	//Vypadá to tak.
	AI_Output(self,other,"DIA_Grd_5032_DUELL_01_03");	//Mám lepší nápad, já praštím TEBE!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

