instance ORG_5060_BANDIT_EXIT(C_Info)
{
	npc = org_5060_bandit;
	nr = 999;
	condition = org_5060_bandit_exit_condition;
	information = org_5060_bandit_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int org_5060_bandit_exit_condition()
{
	return TRUE;
};

func void org_5060_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};

instance ORG_5060_BANDIT_FAKEHELP(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_fakehelp_condition;
	information = org_5060_bandit_fakehelp_info;
	permanent = 0;
	important = 1;
	description = "Kannst du mir helfen? [important - no description required]";
};

func int org_5060_bandit_fakehelp_condition()
{
	return TRUE;
};

func void org_5060_bandit_fakehelp_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Help_15_00");	//Hej ty! Počkej na moment!
	AI_Output(other,self,"DIA_ORG_5060_Help_15_01");	//Co ode mě chceš?
	AI_Output(self,other,"DIA_ORG_5060_Help_15_02");	//S mým parťákem potřebujeme malou pomoc. Lovíme mrchožrouty po okolí a potřebujeme někoho, kdo nám pomůže ty potvory ulovit.
	AI_Output(self,other,"DIA_ORG_5060_Help_15_03");	//Přišel jsi přesně vhod. Pokud nám pomůžeš s lovem, dáme ti podíl z kořisti.
	AI_Output(self,other,"DIA_ORG_5060_Help_15_04");	//Tak co můžu se na tebe spolehnout?
	Info_ClearChoices(org_5060_bandit_fakehelp);
	Info_AddChoice(org_5060_bandit_fakehelp,"Nemám zájem - najděte si někoho jiného.",org_5060_bandit_fakehelp_deny);
	Info_AddChoice(org_5060_bandit_fakehelp,"Počítej se mnou.",org_5060_bandit_fakehelp_accepr);
};

func void org_5060_bandit_fakehelp_deny()
{
	AI_Output(other,self,"DIA_ORG_5060_Help_Deny_15_00");	//Nemám zájem - najděte si někoho jiného.
	AI_Output(self,other,"DIA_ORG_5060_Help_Deny_06_01");	//Takže mi nechceš pomoci? Pak vypadni, nemám ti co říct, parchante.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(org_5060_bandit_fakehelp);
};

func void org_5060_bandit_fakehelp_accepr()
{
	AI_Output(other,self,"DIA_ORG_5060_Help_Accepr_15_00");	//Počítej se mnou.
	AI_Output(self,other,"DIA_ORG_5060_Help_Accepr_06_01");	//Dobře, pojďme, můj parťák na nás čeká dole v údolí.
	AI_Output(self,other,"DIA_ORG_5060_Help_Accepr_06_02");	//Půjdu napřed, poď za mnou.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
	Info_ClearChoices(org_5060_bandit_fakehelp);
};

instance ORG_5060_BANDIT_TRAPPED(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_trapped_condition;
	information = org_5060_bandit_trapped_info;
	permanent = 0;
	important = 1;
};

func int org_5060_bandit_trapped_condition()
{
	if(Npc_KnowsInfo(hero,org_5060_bandit_fakehelp) && (Npc_GetDistToWP(self,"HELPPOINT10") < 500))
	{
		return TRUE;
	};
};

func void org_5060_bandit_trapped_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_00");	//Takže jsme tady. Tohle je můj parťák.
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_01");	//Nyní se můžeme pustit do práce.
	AI_Output(other,self,"DIA_ORG_5060_Trapped_15_02");	//Kde jsou mrchožrouti?
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_03");	//Přemýšleli jsme nad tím a už nebudeme muset lovit mrchožrouty.
	AI_Output(other,self,"DIA_ORG_5060_Trapped_15_04");	//Co?
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_05");	//No, teď, když jsi tady, našli jsme jiný způsob, jak se získat kořist.
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_06");	//Tak se podívejme, copak máš u sebe.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,0,"");
	Npc_SetTarget(org_5061_bandit,hero);
	AI_StartState(org_5061_bandit,ZS_Attack,0,"");
};

instance ORG_5060_BANDIT_BEATED(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_beated_condition;
	information = org_5060_bandit_beated_info;
	permanent = 0;
	important = 1;
};

func int org_5060_bandit_beated_condition()
{
	if((Npc_KnowsInfo(hero,org_5060_bandit_trapped) && Npc_HasItems(hero,ItWr_Fire_Letter_01)) || (Npc_HasItems(hero,ItWr_Fire_Letter_02) && (self.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return TRUE;
	};
};

func void org_5060_bandit_beated_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_00");	//Co je tohle za dopis?
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_01");	//Zajímavé, vypadá hodnotně. Jsem si jistý, že odměna bude stát zato. Hehe.
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_02");	//Teď vysmahni.
	CreateInvItem(self,ItWr_Fire_Letter_02);
	//BUGFIX [Fawkes]: Necheckovalo sa tu, ci ma hrac item pred odstranenim
	//Npc_RemoveInvItem(hero,ItWr_Fire_Letter_01);
	//Npc_RemoveInvItem(hero,ItWr_Fire_Letter_02);
	if (Npc_HasItems(hero,ItWr_Fire_Letter_01)){
		Npc_RemoveInvItem(hero,ItWr_Fire_Letter_01);
	};
	
	if (Npc_HasItems(hero,ItWr_Fire_Letter_02)){
		Npc_RemoveInvItem(hero,ItWr_Fire_Letter_02);
	};

	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

instance ORG_5060_BANDIT_DEFEATED(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_defeated_condition;
	information = org_5060_bandit_defeated_info;
	permanent = 0;
	important = 1;
};

func int org_5060_bandit_defeated_condition()
{
	if(Npc_KnowsInfo(hero,org_5060_bandit_trapped) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE))
	{
		return TRUE;
	};
};

func void org_5060_bandit_defeated_info()
{
	AI_OutputSVM(self,other,"$LETSFORGETOURLITTLEFIGHT");
	Npc_ExchangeRoutine(self,"START");
};

