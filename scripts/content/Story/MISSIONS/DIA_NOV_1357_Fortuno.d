instance DIA_Fortuno_EXIT(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 999;
	condition = DIA_Fortuno_EXIT_Condition;
	information = DIA_Fortuno_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

func void DIA_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Fortuno_Greet(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = DIA_Fortuno_Greet_Condition;
	information = DIA_Fortuno_Greet_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Fortuno_Greet_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Fortuno_Greet_Info()
{
	AI_Output(self,other,"DIA_Fortuno_Greet_05_00");	//Pojď blíž! Každý nový příchozí dostane na přivítanou dárek!
};

var int Fortuno_RationDay;

instance DIA_Fortuno_GetGeschenk(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = DIA_Fortuno_GetGeschenk_Condition;
	information = DIA_Fortuno_GetGeschenk_Info;
	permanent = 0;
	description = "Co pro mě máš?";
};

func int DIA_Fortuno_GetGeschenk_Condition()
{
	return 1;
};

func void DIA_Fortuno_GetGeschenk_Info()
{
	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00");	//Co pro mě máš?
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01");	//Tady jsou tři roličky drogy z bažin. Je to Severní soumrak. Dobrý materiál.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02");	//Každý den můžeš dostat další, ale pokud budeš chtít víc než denní příděl, musíš zaplatit.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_06_02");	//Pokud si vybereš jiný tábor, nedostaneš denní příděl trávy.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03");	//Když najdeš na cestě mezi tábory bobule a byliny, můžeš mi je přinést a já je od tebe koupím.
	CreateInvItems(self,ItMiJoint_2,3);
	B_GiveInvItems(self,other,ItMiJoint_2,3);
	Fortuno_RationDay = Wld_GetDay();
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Fortuno obchoduje s bylinami pod alchymistickou dílnou.");
};

instance DIA_Fortuno_DailyRation(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 3;
	condition = DIA_Fortuno_DailyRation_Condition;
	information = DIA_Fortuno_DailyRation_Info;
	permanent = 1;
	description = "Přišel jsem si vyzvednout svůj denní příděl.";
};

func int DIA_Fortuno_DailyRation_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk) && (Npc_GetTrueGuild(hero) == GIL_None)) || ((Npc_GetTrueGuild(hero) == GIL_NOV) && Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk)))
	{
		return 1;
	};
};

func void DIA_Fortuno_DailyRation_Info()
{
	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00");	//Přišel jsem si vyzvednout svůj denní příděl.
	if(Fortuno_RationDay != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01");	//Tady je. Třikrát Severní soumrak - nevykuř ale všechno najednou.
		CreateInvItems(self,ItMiJoint_2,3);
		B_GiveInvItems(self,other,ItMiJoint_2,3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02");	//Už jsi svůj denní příděl dostal. Jestli chceš další, musíš přijít zítra nebo si něco koupit.
	};
};

instance DIA_Fortuno_BuyJoints(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 4;
	condition = DIA_Fortuno_BuyJoints_Condition;
	information = DIA_Fortuno_BuyJoints_Info;
	permanent = 1;
	description = "Chci obchodovat.";
	trade = 1;
};

func int DIA_Fortuno_BuyJoints_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

func void DIA_Fortuno_BuyJoints_Info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//Chci obchodovat.
	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01");	//Co ode mě chceš? Nebo chceš něco prodat?
};

