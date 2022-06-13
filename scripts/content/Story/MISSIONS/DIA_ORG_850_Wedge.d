instance DIA_Wedge_Exit(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 999;
	condition = DIA_Wedge_Exit_Condition;
	information = DIA_Wedge_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

func void DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Wedge_Psst(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 1;
	condition = DIA_Wedge_Psst_Condition;
	information = DIA_Wedge_Psst_Info;
	important = 1;
	permanent = 0;
};

func int DIA_Wedge_Psst_Condition()
{
	if((Npc_GetDistToNpc(hero,self) < 900) && Wld_IsTime(8,0,23,30))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Psst_Info()
{
	AI_Output(self,other,"DIA_Wedge_Psst_05_00");	//Pssss... hej, ty!
	AI_Output(other,self,"DIA_Wedge_Psst_15_01");	//Kdo?... Já?
	AI_Output(self,other,"DIA_Wedge_Psst_05_02");	//Přesně tak... Pojď sem!
	AI_StopProcessInfos(self);
};

instance DIA_Wedge_Hello(C_Info)
{
	npc = ORG_850_Wedge;
	condition = DIA_Wedge_Hello_Condition;
	information = DIA_Wedge_Hello_Info;
	important = 0;
	permanent = 0;
	description = "Co chceš?";
};

func int DIA_Wedge_Hello_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Hello_Info()
{
	AI_Output(other,self,"DIA_Wedge_Hello_15_00");	//Co ode mě chceš?
	AI_Output(self,other,"DIA_Wedge_Hello_05_01");	//Právě jsi sem přišel, viď? Hned jsem si toho všiml.
	AI_Output(self,other,"DIA_Wedge_Hello_05_02");	//Je spousta věcí, které potřebuješ vědět. Můžu tě pár věcí naučit.
	AI_Output(self,other,"DIA_Wedge_Hello_05_03");	//Mimo jiné musíš dávat pozor na to, s kým mluvíš. Tak například Butch - to je ten chlapík támhle, vedle táborového ohně... Dávej si na něj pozor!
};

instance DIA_Wedge_WarnsOfButch(C_Info)
{
	npc = ORG_850_Wedge;
	condition = DIA_Wedge_WarnsOfButch_Condition;
	information = DIA_Wedge_WarnsOfButch_Info;
	important = 0;
	permanent = 0;
	description = "Co je s Butchem?";
};

func int DIA_Wedge_WarnsOfButch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};
};

func void DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00");	//Co je s Butchem?
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01");	//Má ve zvyku mlátit nováčky. Raději se mu vyhýbej.
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_05_04");	//Možná bych se mohl o Butche postarat já.
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_05");	//Co? TY? Pak ale neříkej, že jsem tě nevaroval.
	BUTCH_RESPECT = LOG_RUNNING;
	Log_CreateTopic(CH1_ORGRESPECT,LOG_MISSION);
	Log_SetTopicStatus(CH1_ORGRESPECT,LOG_RUNNING);
	B_LogEntry(CH1_ORGRESPECT,"Wedge, jeden z banditů z Nového tábora, mi řekl o banditovi jménem Butch, který má ve zvyku stahovat z kůže nováčky. Možná bych mu mohl dát lekci a získat tak v táboře trochu respektu.");
};

instance DIA_Wedge_Lehrer(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 700;
	condition = DIA_Wedge_Lehrer_Condition;
	information = DIA_Wedge_Lehrer_Info;
	permanent = 1;
	description = "Co mě můžeš naučit?";
};

func int DIA_Wedge_Lehrer_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Lehrer_Info()
{
	if(log_wedgelearn == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Bandita Wedge mě může učit dovednostem PLÍŽENÍ, VYBÍRÁNÍ KAPES a PÁČENÍ ZÁMKŮ.");
		log_wedgelearn = TRUE;
	};
	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00");	//Co mě můžeš naučit?
	AI_Output(self,other,"DIA_Wedge_Lehrer_05_01");	//To záleží... Co chceš umět?
	Info_ClearChoices(DIA_Wedge_Lehrer);
	Info_AddChoice(DIA_Wedge_Lehrer,DIALOG_BACK,DIA_Wedge_Lehrer_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Wedge_Lehrer_Pickpocket2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Wedge_Lehrer_Pickpocket);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),DIA_Wedge_Lehrer_Lockpick2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),DIA_Wedge_Lehrer_Lockpick);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,0),DIA_Wedge_Lehrer_Schleichen);
	};
};

func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00");	//Chci se naučit plížit.
	if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//To je záležitost udržení rovnováhy. Také se musíš naučit ovládat svůj dech.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//Dávej pozor na držení těla a nikdo tvůj pohyb neuslyší...
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00");	//Jak můžu vylepšit své umění v otevírání zámků?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//To bys rád věděl, co? Není těžké s tím začít.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//Především se musíš ujistit, že se tvůj paklíč nezlomí.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//Když budeš v budoucnu trochu trpělivější, uvidíš, že nebudeš potřebovat tolik paklíčů!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00");	//Jak se ze mě stane odborník na vylamování zámků?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//Jedině když získáš nějaké zkušenosti, budeš moci říci, jestli se paklíč zlomí. Vydává jiný zvuk!
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//Myslím, že to máš. Nauč se poslouchat to jemné cvaknutí zámku a pak už nebudeš přicházet o tolik paklíčů.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//Odborník v tomhle oboru má velkou šanci, že otevře zámek, aniž by zlomil svůj paklíč.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00");	//Chci se stát zběhlým kapsářem.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//Takže chceš pár lidem odlehčit o jejich majetek? Dobrá teda.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//Naučím tě, jak zlepšit své umění, ale přesto bude dost pravděpodobné, že tě přitom chytnou.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//Měl bys to zkoušet pouze tehdy, až nebude kolem nikdo, než ty a tvoje oběť.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//Jedině odborník dokáže vzít lidem věci z kapes, aniž by si toho všimli!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05");	//Zapomeň na to! Nikdy z tebe nebude zkušený zloděj, dokud se nebudeš umět plížit.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00");	//Chci se stát kapsářským odborníkem!
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//Myslím, že jsi pokročil tak daleko, že tě můžu naučit poslední triky tohohle řemesla.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//Měl bys ale vědět, že i ten nejlepší může být někdy přistižen.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//Opatruj se.
	};
};

func void DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Wedge_Lehrer);
};

instance DIA_WEDGE_NOWORG(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 1;
	condition = dia_wedge_noworg_condition;
	information = dia_wedge_noworg_info;
	permanent = 0;
	important = 1;
};

func int dia_wedge_noworg_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void dia_wedge_noworg_info()
{
	AI_Output(self,other,"DIA_Wedge_NowORG_09_00");	//Přidal jsi se k nám ? Určitě se nám někdo jako ty bude hodit.
};

instance DIA_WEDGE_SUCCESS(C_Info)
{
	npc = ORG_850_Wedge;
	condition = dia_wedge_success_condition;
	information = dia_wedge_success_info;
	important = 0;
	permanent = 0;
	description = "Butch nebude dělat problémy.";
};

func int dia_wedge_success_condition()
{
	if((BUTCH_RESPECT == LOG_RUNNING) && ORG_851_Butch.aivar[AIV_WASDEFEATEDBYSC])
	{
		return TRUE;
	};
};

func void dia_wedge_success_info()
{
	AI_Output(other,self,"DIA_Wedge_SUCCESS_15_00");	//Butch nebude dělat problémy.
	AI_Output(self,other,"DIA_Wedge_SUCCESS_15_01");	//Už jsem si toho všiml. To není špatné chlapče, to není špatné.
	AI_Output(self,other,"DIA_Wedge_SUCCESS_15_02");	//Snažíš se udělat si tu jméno, že?
	AI_Output(self,other,"DIA_Wedge_SUCCESS_15_03");	//Jen tak dál a určitě tě mezi nás vemou.
	AI_StopProcessInfos(self);
	BUTCH_RESPECT = LOG_SUCCESS;
	B_GiveXP(XP_BUTCHRESPECT);
	Log_SetTopicStatus(CH1_ORGRESPECT,LOG_SUCCESS);
	B_LogEntry(CH1_ORGRESPECT,"Wedge, byl velmi ohromen, že jsem vyřídil Butche. Řekl mi, že mi to v táboře přineslo mezi několik lidmi respekt.");
};

