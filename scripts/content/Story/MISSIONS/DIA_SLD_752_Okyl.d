instance DIA_SLD_752_OKYL_INTRO(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_intro_condition;
	information = dia_sld_752_okyl_intro_info;
	important = 1;
	permanent = 0;
};

func int dia_sld_752_okyl_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 250)
	{
		return 1;
	};
};

func void dia_sld_752_okyl_intro_info()
{
	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01");	//Hej, ty! Ty nepatříš k mým mužům. Co tady děláš?
};

instance DIA_SLD_752_OKYL_EXIT(C_Info)
{
	nr = 999;
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_exit_condition;
	information = dia_sld_752_okyl_exit_info;
	important = 0;
	permanent = 1;
	description = "Musím jít dál.";
};

func int dia_sld_752_okyl_exit_condition()
{
	return 1;
};

func void dia_sld_752_okyl_exit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01");	//Musím jít dál.
	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");	//Nech mě být.
	AI_StopProcessInfos(self);
};

instance DIA_SLD_752_OKYL_UMSEHEN(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_umsehen_condition;
	information = dia_sld_752_okyl_umsehen_info;
	important = 0;
	permanent = 0;
	description = "Jen se tu porozhlédnu.";
};

func int dia_sld_752_okyl_umsehen_condition()
{
	return 1;
};

func void dia_sld_752_okyl_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01");	//Jen se tu porozhlédnu.
	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");	//Dávej pozor, aby ses tady v Kotlině nedostal do žádného maléru, jinak se dostaneš do hrobu rychleji, než by ses nadál.
};

instance DIA_SLD_752_OKYL_WERBISTDU(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_werbistdu_condition;
	information = dia_sld_752_okyl_werbistdu_info;
	important = 0;
	permanent = 0;
	description = "Kdo jsi?";
};

func int dia_sld_752_okyl_werbistdu_condition()
{
	return 1;
};

func void dia_sld_752_okyl_werbistdu_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");	//Jsem Okyl. Jsem šéf Kotliny.
};

instance DIA_SLD_752_OKYL_INMINE(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_inmine_condition;
	information = dia_sld_752_okyl_inmine_info;
	important = 0;
	permanent = 0;
	description = "Chtěl jsem se jednom podívat do dolu.";
};

func int dia_sld_752_okyl_inmine_condition()
{
	return 1;
};

func void dia_sld_752_okyl_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01");	//Chtěl jsem se jednom podívat do dolu.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");	//Och, jen se tak procházet po dolu.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");	//Vidím, že nemáš představu, jak to tady chodí. Bez mojeho svolení do dolu nevkročí ani noha.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");	//Provždy si zapamatuj: kdokoliv vstoupí do dolu nebo do strážnice bez mého svolení, je mrtvý muž!
};

instance DIA_SLD_752_OKYL_PERMIT(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_permit_condition;
	information = dia_sld_752_okyl_permit_info;
	important = 0;
	permanent = 0;
	description = "Dostanu povolení jít dovnitř?";
};

func int dia_sld_752_okyl_permit_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_752_okyl_inmine))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_permit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");	//Dostanu povolení jít dovnitř?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");	//Ještě nevím. Proč bych tě měl pouštět do dolu?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");	//Teď zmiz, mám důležitější věci na práci.
	AI_StopProcessInfos(self);
};

instance DIA_SLD_752_OKYL_QUEST(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_quest_condition;
	information = dia_sld_752_okyl_quest_info;
	important = 0;
	permanent = 0;
	description = "Můžu tu s něčím pomoct?";
};

func int dia_sld_752_okyl_quest_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_752_okyl_intro))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_quest_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_QUEST_INFO_15_01");	//Můžu tu s něčím pomoct?
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_02");	//Hmm, nevím, jako by nám někdo jako ty mohl pomoct.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_03");	//I když, vlastně můžeš něco udělat.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_04");	//Náš poslední kovář se nechal sežrat důlními červy. Kovárna je už nějakou dobu prázdná.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_05");	//Pokud vím, kdysi jsme měli v Novém táboře kováře, ale nepamatuji si jeho jméno.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_06");	//Možná už je mrtvý, nevím.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_07");	//Rozhlédni se kolem. Pokud ho najdeš, pošli ho k nám do Kotliny.
	FMC_SMITH = LOG_RUNNING;
	Log_CreateTopic(CH1_FMCSMITH,LOG_MISSION);
	Log_SetTopicStatus(CH1_FMCSMITH,LOG_RUNNING);
	B_LogEntry(CH1_FMCSMITH,"Okyl, šéf Svobodného dolu, mi řekl, že kovárna v Kotlině už nějakou zeje prázdnotou. Mám pro ni najít nového kováře. V Novém táboře by se někdo určitě našel.");
	AI_StopProcessInfos(self);
};

instance DIA_SLD_752_OKYL_FOUND(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_found_condition;
	information = dia_sld_752_okyl_found_info;
	important = 0;
	permanent = 0;
	description = "Někoho jsem našel.";
};

func int dia_sld_752_okyl_found_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_smith))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_found_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_Found_INFO_15_01");	//Někoho jsem našel.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_02");	//Ano, už jsem si toho všiml. Blade je dobrý chlap.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_03");	//Už je v kovárně a začal pracovat.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_04");	//Tady, vemi si něco málo za odměnu.
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	AI_Teleport(SLD_704_Blade,"FMC_HUT08_IN");
	Npc_ExchangeRoutine(SLD_704_Blade,"SMITH");
	AI_ContinueRoutine(SLD_704_Blade);
	FMC_SMITH = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_FMCSMITH,LOG_SUCCESS);
	B_LogEntry(CH1_FMCSMITH,"Poté, co jsem dokázal přesvědčit Bladea, aby se nechal najmout jako kovář ve Svobodném dole, byl se mnou Okyl spokojený. Za odměnu jsem dostal trochu rudy.");
	B_GiveXP(XP_SMITH);
	AI_StopProcessInfos(self);
};

