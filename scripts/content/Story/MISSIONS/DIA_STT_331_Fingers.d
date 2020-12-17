instance DIA_STT_331_Fingers_Exit(C_Info)
{
	npc = STT_331_Fingers;
	nr = 999;
	condition = DIA_STT_331_Fingers_Exit_Condition;
	information = DIA_STT_331_Fingers_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

func void DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos(self);
};

var int Fingers_CanTeach;

instance DIA_Fingers_BecomeShadow(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_BecomeShadow_Condition;
	information = DIA_Fingers_BecomeShadow_Info;
	permanent = 1;
	description = "Chci se stát Stínem!";
};

func int DIA_Fingers_BecomeShadow_Condition()
{
	if((Fingers_CanTeach == FALSE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_BecomeShadow_Info()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00");	//Chci se stát Stínem!
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01");	//No a?
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
	Info_AddChoice(DIA_Fingers_BecomeShadow,DIALOG_BACK,DIA_Fingers_BecomeShadow_BACK);
	if(Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice(DIA_Fingers_BecomeShadow,"Hledám někoho, kdo mě něco naučí.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice(DIA_Fingers_BecomeShadow,"Můžeš mi pomoci?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00");	//Můžeš mi pomoci?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01");	//Nevím jak...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00");	//Hledám někoho, kdo mě něco naučí.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01");	//Proč jsi ke mně přišel?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02");	//Poslal mě Diego.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03");	//To jsi měl říci rovnou.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04");	//Jestli se chceš přidat k táboru, pak je výhodné být dobrý bojovník nebo zloděj.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05");	//Jestli tě budou tady v táboře zkoušet nezávislé Stíny, dají ti takové úkoly, které nebudeš nejspíš schopný splnit.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06");	//Proto by ses pro začátek mohl stát zlodějem.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07");	//Mimochodem, já jsem nejlepší zloděj z celého Starého tábora.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Fingers mě může naučit VYBÍRÁNÍ KAPES. Žije nedaleko arény, poněkud stranou u hradních zdí.");
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

var int Fingers_Wherecavalorn;

instance DIA_Fingers_Lehrer(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Lehrer_Condition;
	information = DIA_Fingers_Lehrer_Info;
	permanent = 1;
	description = "Co mě můžeš naučit?";
};

func int DIA_Fingers_Lehrer_Condition()
{
	if(Fingers_CanTeach == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_Lehrer_Info()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00");	//Co mě můžeš naučit?
	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02");	//To záleží na tom, co chceš umět.
	Info_ClearChoices(DIA_Fingers_Lehrer);
	Info_AddChoice(DIA_Fingers_Lehrer,DIALOG_BACK,DIA_Fingers_Lehrer_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Fingers_Lehrer_Pickpocket2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Fingers_Lehrer_Pickpocket);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),DIA_Fingers_Lehrer_Lockpick2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),DIA_Fingers_Lehrer_Lockpick);
	};
	Info_AddChoice(DIA_Fingers_Lehrer,"Chci se naučit plížit.",DIA_Fingers_Lehrer_Schleichen);
};

func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00");	//Chci se naučit plížit.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01");	//Věřím, a to bez nadsázky, že jsem jeden z nejlepších zlodějů, jaké kdy tahle kolonie spatřila.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02");	//Jestli se chceš ale naučit plížit, Cavalorn bude lepší učitel než já!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00");	//Jak můžu vylepšit své umění v otevírání zámků?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01");	//To bys rád věděl, co? Není těžké s tím začít.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02");	//Především se musíš ujistit, že se tvůj paklíč nezlomí.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03");	//Když budeš v budoucnu trochu trpělivější, uvidíš, že nebudeš potřebovat tolik paklíčů!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00");	//Jak se ze mě stane odborník na vylamování zámků?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01");	//Jedině když získáš nějaké zkušenosti, budeš moci říci, jestli se paklíč zlomí. Vydává jiný zvuk!
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02");	//Myslím, že to máš. Nauč se poslouchat to jemné cvaknutí zámku a pak už nebudeš přicházet o tolik paklíčů.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03");	//Odborník v tomto směru má velkou šanci, že otevře zámek, aniž by zlomil svůj paklíč.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00");	//Chci se stát zběhlým kapsářem.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01");	//Takže chceš pár lidem odlehčit o jejich majetek? Dobrá teda.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02");	//Naučím tě, jak zlepšit své umění, ale přesto bude dost pravděpodobné, že tě přitom chytnou.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03");	//Měl bys to zkoušet pouze tehdy, až nebude kolem nikdo, než ty a tvoje oběť.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04");	//Jedině odborník dokáže vzít lidem věci z kapes, aniž by si toho všimli!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05");	//Zapomeň na to! Nikdy z tebe nebude zkušený zloděj, dokud se nebudeš umět plížit.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00");	//Chci se stát kapsářským odborníkem!
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01");	//Myslím, že jsi pokročil tak daleko, že tě můžu naučit poslední triky tohohle řemesla.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02");	//Měl bys ale vědět, že i ten nejlepší může být někdy přistižen.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//Opatruj se.
	};
};

func void DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Fingers_Lehrer);
};

instance DIA_Fingers_WhereCavalorn(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_WhereCavalorn_Condition;
	information = DIA_Fingers_WhereCavalorn_Info;
	permanent = 1;
	description = "Kde najdu Cavalorna?";
};

func int DIA_Fingers_WhereCavalorn_Condition()
{
	if(Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00");	//Kde najdu Cavalorna?
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01");	//Právě je na lovu v divočině. Najdeš ho po cestě do Nového tábora. Západně od Starého tábora je široký kaňon.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02");	//V tom kaňonu je stará dřevorubecká chata. Najdeš ho v ní.
	B_LogEntry(GE_TeacherOW,"Cavalorn mě může naučit PLÍŽENÍ. Jeho chatrč stojí na západ od Starého tábora, směrem k Novému táboru.");
};

var int Fingers_Learnt;

instance DIA_Fingers_Learnt(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Learnt_Condition;
	information = DIA_Fingers_Learnt_Info;
	permanent = 1;
	description = "Nepřimluvil by ses za mě u Diega?";
};

func int DIA_Fingers_Learnt_Condition()
{
	if((Fingers_Learnt != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_Learnt_Info()
{
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00");	//Nepřimluvil by ses za mě u Diega?
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) + Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) + Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) > 0)
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01");	//Ano. Naučil ses něco, díky čemu budeš pro nás docela užitečný.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02");	//Potřebujeme tady v táboře zkušené zloděje. Dostaneš můj hlas.
		Fingers_Learnt = LOG_SUCCESS;
		B_GiveXP(XP_Fingerstrain);
		B_LogEntry(CH1_JoinOC,"Fingers je velmi spokojen s mým pokrokem.");
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03");	//Zaleží to na...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04");	//Jestli dokážeš, že ses naučil něco ze zlodějského řemesla, mohl bys být pro nás užitečný!
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05");	//Co bych měl udělat?
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06");	//Nauč se zlodějskému řemeslu! Potřebuješ se vypracovat v plížení, kapsářství nebo otevírání zámků. Pak dostaneš můj hlas.
		Fingers_Learnt = LOG_RUNNING;
		B_LogEntry(CH1_JoinOC,"Jakmile získám zlodějskou dovednost, Fingers se za mě přimluví.");
	};
};

instance DIA_FINGERS_HUNOSSCHWERT(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = dia_fingers_hunosschwert_condition;
	information = dia_fingers_hunosschwert_info;
	permanent = 0;
	description = "Co víš o Hunově meči?";
};

func int dia_fingers_hunosschwert_condition()
{
	if(HUNO_SWORDSOLD == TRUE)
	{
		return 1;
	};
};

func void dia_fingers_hunosschwert_info()
{
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_15_00");	//Co víš o Hunově meči?
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_01");	//Proč bych já o něm měl něco vědět?
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_05_02");	//Fisk naznačil, že něco víš.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_03");	//Ah tak ...
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_04");	//Nedávno jsem učil jednoho kopáče otevírání zámků.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_05");	//Myslím, že to co hledáš najdeš u něj.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_06");	//Jmenuje se Jesse.
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_05_07");	//Díky, měj se.
	B_LogEntry(CH1_HUNOLOSTSWORD,"Fingers mi řekl, ať si promluvím s kopáčem jménem Jesse. Vypadá to, že ví něco o ztraceném meči.");
};

instance DIA_FINGERS_QUEST(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = dia_fingers_quest_condition;
	information = dia_fingers_quest_info;
	permanent = 0;
	important = 1;
};

func int dia_fingers_quest_condition()
{
	if((Fingers_Learnt == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return 1;
	};
};

func void dia_fingers_quest_info()
{
	AI_Output(self,other,"DIA_Fingers_Quest_15_00");	//Zvládl jsi to a přidal se mezi stíny? Výborně. Nemýlil jsem se v tobě.
	AI_Output(self,other,"DIA_Fingers_Quest_15_01");	//Teď, když jsi jedním z nás, měl bych uplatnění pro dobrého zloděje.
	AI_Output(other,self,"DIA_Fingers_Quest_15_02");	//Máš pro mě nějakou práci? O co jde?
	AI_Output(self,other,"DIA_Fingers_Quest_15_03");	//Chci, abys šel do Nového tábora. Je tam jeden muž jménem Lares. Je vůdcem banditů.
	AI_Output(self,other,"DIA_Fingers_Quest_15_04");	//Vím, že nosí magický prsten, který posiluje jeho schopnosti.
	AI_Output(self,other,"DIA_Fingers_Quest_15_05");	//Chci abys mu ten prsten ukradl. Mám pro něj mnohem lepší využití.
	AI_Output(self,other,"DIA_Fingers_Quest_15_06");	//Ale za žádných okolností se nenech chytit. Pokud tě Lares nachytá při krádeži, pošle na tebe polovinu tábora.
	AI_Output(self,other,"DIA_Fingers_Quest_15_07");	//Takže buď opatrný. Ale jsem si jistý, že jsem tvoje schopnosti dobře odhadl. Až to zvládneš, promluvíme si o další prácičce.
	AI_Output(self,other,"DIA_Fingers_Quest_15_08");	//Jdi tedy do Nového tábora. Čeká tam na tebe úkol.
	FINGERS_RING = LOG_RUNNING;
	Log_CreateTopic(CH1_FINGERSTHIEF,LOG_MISSION);
	Log_SetTopicStatus(CH1_FINGERSTHIEF,LOG_RUNNING);
	B_LogEntry(CH1_FINGERSTHIEF,"Fingers mě požádal, abych navštívil Larese, vůdce banditů z Nového tábora. Má magický prsten, který zvyšuje jeho schopnosti. Fingers by ho rád měl ve svém vlastnictví.");
};

instance DIA_FINGERS_SUCCESS(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_success_condition;
	information = dia_fingers_success_info;
	permanent = 0;
	important = 0;
	description = "Mám tu Laresův prsten.";
};

func int dia_fingers_success_condition()
{
	if((FINGERS_RING == LOG_RUNNING) && (Npc_HasItems(other,Lares_Ring) >= 1))
	{
		return 1;
	};
};

func void dia_fingers_success_info()
{
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_00");	//Mám tu Laresův prsten.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_10");	//Opravdu? Věděl jsem, že jsem najal tu správnou osobu ...
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_20");	//A co teď?
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_30");	//Je tu jeden bandita, z Nového tábora.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_40");	//Jmenuje se Wedge, je to mistr zlodějů tábora.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_50");	//Alespoň si tak říká.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_60");	//Mám tu v Kolonii určitou reputaci, kterou bych mohl ztratit, chci proto zařídit, že Wedge ztratí tu svoji.
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_70");	//A to je kde do hry vstupuju já.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_80");	//Správně. V Novém táboře je chlap jménem Butch. Povídá se, že je jedním z nejhorších banditů.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_90");	//Vím, že má amulet s vyrytým jménem.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_11");	//Chci abys ten amulet ukradl a propašoval ho Wedgeovy do kapsy.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_12");	//Až bude Wedge mít amulet u sebe, řekni o tom Butchovi.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_13");	//Zbytek už se pak zařídí sám.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_14");	//Zloděj, který krade svým vlastním, nebude mít v budoucnu dobrou pověst.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_15");	//Vrať se, až dokončíš tenhle úkol.
	AI_StopProcessInfos(self);
	FINGERS_RING = LOG_SUCCESS;
	B_GiveXP(XP_FINGERSQUESTONE);
	Log_SetTopicStatus(CH1_FINGERSTHIEF,LOG_SUCCESS);
	B_LogEntry(CH1_FINGERSTHIEF,"Přinesl jsem Fingersovi prsten, který chtěl. Vypadal spokojeně a odměnil mě trochou rudy.");
	CreateInvItems(self,ItMiNugget,30);
	B_GiveInvItems(self,other,ItMiNugget,30);
	FINGERS_THIEF = LOG_RUNNING;
	Log_CreateTopic(CH1_THIEFS,LOG_MISSION);
	Log_SetTopicStatus(CH1_THIEFS,LOG_RUNNING);
	B_LogEntry(CH1_THIEFS,"Fingers mě požádal, abych šel do Nového tábora a poohlédl se banditovi jménem Wedge. Mám zajistit aby se amulet od nějakého Butche dostal do jeho kapsy. Pak o tom mám říct ... Butchovi, tak dostane Wedge malou lekci a Fingers si udrží svou reputaci mistra zlodějů.");
};

instance DIA_FINGERS_BUTCH(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_butch_condition;
	information = dia_fingers_butch_info;
	permanent = 0;
	important = 0;
	description = "Wedge už se nebude nazývat mistr zlodějů.";
};

func int dia_fingers_butch_condition()
{
	if(Npc_KnowsInfo(hero,dia_butch_hey))
	{
		return 1;
	};
};

func void dia_fingers_butch_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Fingers_Butch_15_01");	//Wedge už se nebude nazývat mistrem zlodějů.
	AI_Output(self,other,"DIA_Fingers_Butch_15_02");	//Takže to zabralo? Dobrá práce. Myslím, že si tentokrát zasloužíš trochu větší odměnu.
	AI_Output(self,other,"DIA_Fingers_Butch_15_03");	//Měli bychom zatím ukončit naši spolupráci, než si Nový tábor uvědomí odkud vítr věje.
	AI_Output(self,other,"DIA_Fingers_Butch_15_04");	//Možná v budoucnu budu potřebovat tvoji pomoc. Do té doby, měj se.
	AI_Output(other,self,"DIA_Fingers_Butch_15_05");	//Děkuji.
	AI_Output(self,other,"DIA_Fingers_Butch_15_06");	//A nezapomeň, že nejlepší Stíny vykonávají svou práci, aniž by o nich někdo tušil. Tajně, tiše a skrytě ... ze stínů.
	AI_StopProcessInfos(self);
	B_GiveXP(XP_FINGERSQUESTTWO);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,Schutzring_Waffen1,1);
		B_GiveInvItems(self,other,Schutzring_Waffen1,1);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,Schutzring_Geschosse2,1);
		B_GiveInvItems(self,other,Schutzring_Geschosse2,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItem(self,ItMi_Alchemy_Syrianoil_01);
		B_GiveInvItems(self,hero,ItMi_Alchemy_Syrianoil_01,1);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItRw_Bow_Small_05,1);
		B_GiveInvItems(self,other,ItRw_Bow_Small_05,1);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItMw_1H_Sword_04,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_04,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,150);
	}
	else
	//BUG [Fawkes]: ak padne hodnota zufallsbelohnung medzi 0 - 10 tak hrac nedostane ziadnu odmenu
	//if(zufallsbelohnung >= 10)
	{
		CreateInvItem(self,ItFo_Potion_Dex_01);
		B_GiveInvItems(self,hero,ItFo_Potion_Dex_01,1);
	};
	FINGERS_THIEF = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_THIEFS,LOG_SUCCESS);
	B_LogEntry(CH1_THIEFS,"Fingers můj úspěch potěšil a dal mi slušnou odměnu. Poté mi řekl, že naše spolupráce končí, aby někdo z Nového tábora nepojal podezření.");
};

