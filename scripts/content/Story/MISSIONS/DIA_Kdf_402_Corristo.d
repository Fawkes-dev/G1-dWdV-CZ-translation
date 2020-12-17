instance KDF_402_Corristo_Exit(C_Info)
{
	npc = Kdf_402_Corristo;
	nr = 999;
	condition = KDF_402_Corristo_Exit_Condition;
	information = KDF_402_Corristo_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int KDF_402_Corristo_Exit_Condition()
{
	return TRUE;
};

func void KDF_402_Corristo_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Corristo_Intruder(C_Info)
{
	npc = Kdf_402_Corristo;
	nr = 1;
	condition = Info_Corristo_Intruder_Condition;
	information = Info_Corristo_Intruder_Info;
	permanent = 1;
	important = 1;
};

func int Info_Corristo_Intruder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) && (CorKalom_BringMCQBalls != LOG_SUCCESS)))
	{
		return 1;
	};
};

func void Info_Corristo_Intruder_Info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//Co tady děláš? Tady nemáš co pohledávat! Zmiz!
	AI_StopProcessInfos(self);
};

instance KDF_402_Corristo_EXPLAINMAGE(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_EXPLAINMAGE_Condition;
	information = KDF_402_Corristo_EXPLAINMAGE_Info;
	important = 0;
	permanent = 0;
	description = "Řekni mi - jaké to je být mágem.";
};

func int KDF_402_Corristo_EXPLAINMAGE_Condition()
{
	if(!Npc_KnowsInfo(hero,KDF_402_Corristo_WANNBEKDF) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_EXPLAINMAGE_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01");	//Řekni mi - jaké to je, být mágem.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02");	//Jsme mágové Ohně. Jsme služebníci Innose, nejvyššího ze všech bohů.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03");	//Naše kouzla jsou dar boží. Byli jsme zvoleni, abychom působili jako kněží, učitelé a soudci.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04");	//Je to dar, který je naším trvalým břemenem. Úkolem, který určuje naše životy.
};

instance KDF_402_Corristo_WANNBEKDF(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_WANNBEKDF_Condition;
	information = KDF_402_Corristo_WANNBEKDF_Info;
	important = 0;
	permanent = 1;
	description = "Chtěl bych vstoupit do magického Kruhu.";
};

func int KDF_402_Corristo_WANNBEKDF_Condition()
{
	if(((CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_WANNBEKDF_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_WANNBEKDF_Info_15_01");	//Chtěl bych vstoupit do magického Kruhu.
	AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_02");	//Tak ty se chceš stát mágem Kruhu ohně? Hm...
	if(hero.level < 10)
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04");	//Ještě nemáš dostatečné vědomosti. Vrať se, až budeš znát víc.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_03");	//Mnozí se k nám chtěli přidat, ale za ta léta jsem přijal jen jediného za svého učedníka. Všichni ostatní neuspěli.
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_05");	//Tvoje duše je vyzrálá a připravená se k nám přidat. Jestli se chceš stát mágem, musím tě nejdříve vyzkoušet. Řekni mi, až budeš připraven na zkoušku.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices(KDF_402_Corristo_WANNBEKDF);
		Log_CreateTopic(GE_BecomeFiremage,LOG_NOTE);
		B_LogEntry(GE_BecomeFiremage,"Corristo mi řekl, že mi dovolí přidat se ke Kruhu mágů Ohně. Nejdřív však musím složit zkoušku.");
	};
};

instance KDF_402_Corristo_KDFTEST(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_KDFTEST_Condition;
	information = KDF_402_Corristo_KDFTEST_Info;
	important = 0;
	permanent = 0;
	description = "Jsem připraven. Vyzkoušej mě.";
};

func int KDF_402_Corristo_KDFTEST_Condition()
{
	if((Corristo_KDFAufnahme == 1) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_KDFTEST_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_Info_15_01");	//Jsem připraven. Vyzkoušej mě.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_Info_14_02");	//Dobře. Sloužil jsi Bratrstvu u bažin, že ano?
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Ano.",KDF_402_Corristo_KDFTEST_JA);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Ne.",KDF_402_Corristo_KDFTEST_NO);
};

func void KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01");	//Ano.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02");	//Hmm...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03");	//Jak se jmenuje náš bůh?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Adanos.",KDF_402_Corristo_KDFTEST_ADANOS);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Spáč.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Innos.",KDF_402_Corristo_KDFTEST_INNOS);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Gomez.",KDF_402_Corristo_KDFTEST_GOMEZ);
};

func void KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01");	//Ne.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03");	//Nepotřebujeme muže, který zapírá své činy.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04");	//Buď raději užitečný jako bojovník nebo kopáč. Cesta k magii pro tebe zůstane provždy uzavřená.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01");	//Adanos.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03");	//To není správně. Možná by tě mohly využít stráže.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01");	//Spáč.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03");	//Vypadáš jako někdo, kdo strávil příliš času mezi bratry z bažin. Možná bys měl raději zůstat tam.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01");	//Innos.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03");	//Jaká je nejvyšší ctnost?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices(KDF_402_Corristo_KDFTEST);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Čest bojovníka.",KDF_402_Corristo_KDFTEST_FIGHT);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Pokora před tváří magie.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Ukázněnost muže.",KDF_402_Corristo_KDFTEST_DISZIPLIN);
	Info_AddChoice(KDF_402_Corristo_KDFTEST,"Bohabojnost.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};

func void KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01");	//Gomez.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03");	//Myslím, že tvé místo bude u stráží! Promluv s Thorusem!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void KDF_402_Corristo_KDFTEST_FIGHT()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01");	//Čest bojovníka.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03");	//Myslím, že tvé místo bude u stráží! Promluv s Thorusem!
	AI_StopProcessInfos(self);
};

func void KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01");	//Pokora před tváři magie.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03");	//Odpovídal jsi dobře a správně. Budu tě učit umění magie.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04");	//Následuj mě do Sálu magie, kde složíš prastarý slib.
	AI_StopProcessInfos(self);
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};

func void KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01");	//Ukázněnost muže.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03");	//Odpovídal jsi dobře a správně. Budu tě učit umění magie.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04");	//Následuj mě do Sálu magie, kde složíš prastarý slib.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos(self);
	B_Story_Feueraufnahme();
};

func void KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output(other,self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01");	//Bohabojnost.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02");	//Hmmm ...
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03");	//Odpovídal jsi dobře a správně. Budu tě učit umění magie.
	AI_Output(self,other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04");	//Následuj mě do Sálu magie, kde složíš prastarý slib.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos(self);
	B_Story_Feueraufnahme();
};

instance KDF_402_Corristo_AUFNAHME(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_AUFNAHME_Condition;
	information = KDF_402_Corristo_AUFNAHME_Info;
	important = 1;
	permanent = 0;
};

func int KDF_402_Corristo_AUFNAHME_Condition()
{
	if((Npc_GetDistToWP(hero,"OCC_CHAPEL_UPSTAIRS") < 500) && (Corristo_KDFAufnahme == 4))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_AUFNAHME_Info()
{
	Corristo_KDFAufnahme = 5;
	B_Story_Feueraufnahme();
	AI_UnequipWeapons(hero);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_01");	//Dnes jsme se tu shromáždili, abysme vysvětili služebníka Ohně.
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_02");	//Teď prones přísahu ohně.
	Snd_Play("howling_01");
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_03");	//Přísahám při moci boží...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_04");	//Přísahám při moci boží...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_05");	//...přísahám při moci svatého Ohně...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_06");	//...přísahám při moci svatého Ohně...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_07");	//...že mé vědomosti a mé skutky vejdou od tohoto okamžiku a navždy v jednotu s ohněm...
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_08");	//...že mé vědomosti a mé skutky vejdou od tohoto okamžiku a navždy v jednotu s ohněm...
	AI_Output(self,other,"KDF_402_Corristo_AUFNAHME_Info_14_09");	//...dokud mé tělo nebude navráceno říši Beliarově a oheň mého života nepohasne.
	AI_Output(other,self,"KDF_402_Corristo_AUFNAHME_Info_15_10");	//...dokud mé tělo nebude navráceno říši Beliarově a oheň mého života nepohasne.
	AI_StopProcessInfos(self);
};

instance KDF_402_Corristo_ROBE(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_ROBE_Condition;
	information = KDF_402_Corristo_ROBE_Info;
	important = 1;
	permanent = 0;
};

func int KDF_402_Corristo_ROBE_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_AUFNAHME))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_ROBE_Info()
{
	Snd_Play("MFX_Heal_Cast");
	CreateInvItem(hero,kdf_armor_l);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_01");	//Pronesením slov této přísahy jsi nyní vstoupil ve spojení s Ohněm.
	AI_Output(self,other,"KDF_402_Corristo_ROBE_Info_14_02");	//Nos toto roucho na znamení věčného svazku.
	AI_StopProcessInfos(self);
	AI_EquipBestArmor(hero);
	AI_UnequipWeapons(hero);
	Npc_SetTrueGuild(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_LogEntry(GE_BecomeFiremage,"Složil jsem zkoušku a pronesl přísahu Ohně. Nyní smím nosit roucho Kruhu ohně! ");
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Corristo mě může naučit magické KRUHY a zvýšit moji magickou energii. Obývá dům mágů Ohně.");
};

instance KDF_402_Corristo_MANA(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_MANA_Condition;
	information = KDF_402_Corristo_MANA_Info;
	important = 0;
	permanent = 1;
	description = "Potřebuji více magické moci.";
};

func int KDF_402_Corristo_MANA_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_MANA_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_MANA_Info_15_01");	//Potřebuji více magické moci.
	AI_Output(self,other,"KDF_402_Corristo_MANA_Info_14_02");	//Můžu ti pomoci zvětšit tvoji sílu. Jak ji použiješ, je už tvoje věc.
	Info_ClearChoices(KDF_402_Corristo_MANA);
	Info_AddChoice(KDF_402_Corristo_MANA,DIALOG_BACK,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_1);
};

func void KDF_402_Corristo_MANA_BACK()
{
	Info_ClearChoices(KDF_402_Corristo_MANA);
};

func void KDF_402_Corristo_MANA_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(KDF_402_Corristo_MANA);
	Info_AddChoice(KDF_402_Corristo_MANA,DIALOG_BACK,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_1);
};

func void KDF_402_Corristo_MANA_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(KDF_402_Corristo_MANA);
	Info_AddChoice(KDF_402_Corristo_MANA,DIALOG_BACK,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDF_402_Corristo_MANA_MAN_1);
};

instance KDF_402_Corristo_EXPLAINCIRCLES(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_EXPLAINCIRCLES_Condition;
	information = KDF_402_Corristo_EXPLAINCIRCLES_Info;
	important = 0;
	permanent = 0;
	description = "Vysvětli mi význam kouzelných Kruhů.";
};

func int KDF_402_Corristo_EXPLAINCIRCLES_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_EXPLAINCIRCLES_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01");	//Vysvětli mi význam kouzelných Kruhů.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02");	//Jistě. Tyhle Kruhy znázorňují, že sdílíš kouzlo.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03");	//Jsou tady pro vědění, dovednost a učení nových kouzelných zaříkávadel.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04");	//Aby ses mohl přidat k dalšímu Kruhu, musíš projít předchozím.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05");	//Vyžaduje to dlouhé učení a také budeš potřebovat získat spoustu zkušeností, než dosáhneš vyšších kruhů.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06");	//Ale tvoje úsilí o jejich dosažení bude pokaždé odměněno novými a mocnějšími kouzly. Kouzelné Kruhy jsou však ještě něčím více.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07");	//Jsou součástí života. Budou vždy s tebou. Ber je jako součást sebe sama.
	AI_Output(self,other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08");	//Abys porozuměl jejich moci, musíš poznat sám sebe.
};

instance KDF_402_Corristo_KREIS1(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_KREIS1_Condition;
	information = KDF_402_Corristo_KREIS1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0);
};

func int KDF_402_Corristo_KREIS1_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && Npc_KnowsInfo(hero,KDF_402_Corristo_EXPLAINCIRCLES) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_KREIS1_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS1_Info_15_01");	//Jsem připraven vstoupit do Prvního Kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_02");	//Vstoupit do prvního z kouzelných Kruhů znamená naučit se používat kouzelné runy.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_03");	//Každá runa obsahuje strukturu zvláštního kouzelného zaříkávadla.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_04");	//Spolu se svými vlastními kouzelnými silami budeš schopen využívat kouzlo run.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_05");	//Ale narozdíl od kouzelných svitků, které jsou také kouzelnými formulemi, magická síla run zajišťuje, že struktura zaříkávadla přetrvává.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_06");	//Každá runa je zdrojem magické síly, kterou můžeš kdykoliv zase zrušit.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_07");	//Svoji vlastní kouzelnou moc využiješ tehdy, když použiješ runu, podobně jako je tomu s kouzelným svitkem.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_08");	//Se vstupem do každého dalšího Kruhu se naučíš využívat také další kouzelné runy.
		AI_Output(self,other,"KDF_402_Corristo_KREIS1_Info_14_09");	//Využij moc run k poznání sebe sama.
		KDF_402_Corristo_KREIS1.permanent = 0;
	};
};

instance KDF_402_Corristo_KREIS2(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_KREIS2_Condition;
	information = KDF_402_Corristo_KREIS2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0);
};

func int KDF_402_Corristo_KREIS2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_KREIS2_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS2_Info_15_01");	//Jsem připraven vstoupit do Druhého kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_02");	//Naučil ses rozumět kouzelným znakům. Nadešel čas prohloubit toto porozumění.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_03");	//Jakmile se přidáš ke Druhému kruhu, naučíš se základům mocnějších bojových zaříkávadel a všem tajům ranhojičství.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_04");	//Budeš se ale muset naučit ještě víc, jestli chceš poznat opravdová tajemství magie.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_05");	//Víš, že každou runu můžeš používat jak často chceš, dokud nevyčerpáš své vlastní síly.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_06");	//Než budeš jednat, rozmysli si cíl svého jednání. Nabyl jsi síly, která tě snadno může dovést k záhubě a zničení.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_07");	//Opravdový kouzelník ale užívá kouzla jen tehdy, když je to nezbytné.
		AI_Output(self,other,"KDF_402_Corristo_KREIS2_Info_14_08");	//Pokud porozumíš situaci, pak poznáš moc run.
		KDF_402_Corristo_KREIS2.permanent = 0;
	};
};

instance KDF_402_Corristo_KREIS3(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_KREIS3_Condition;
	information = KDF_402_Corristo_KREIS3_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0);
};

func int KDF_402_Corristo_KREIS3_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_KREIS3_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS3_Info_15_01");	//Můžeš mě připravit do Třetího kruhu?
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_02");	//Třetí kouzelný kruh je jedním z nejdůležitějších kroků v životě mága. Jakmile ho dosáhneš, přestáváš být hledačem.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_03");	//Došel jsi už po cestě magie opravdu daleko. Naučil ses používat kouzelné runy.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_04");	//Tato znalost je východisko pro tvojí další cestu. Používej tyto runy s uvážením.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_05");	//Runy můžeš nebo nemusíš používat. Ale musíš se rozhodnout pro jednu z těchto možností.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_06");	//Jakmile se rozhodneš, neostýchej se využít svých sil.
		AI_Output(self,other,"KDF_402_Corristo_KREIS3_Info_14_07");	//Jakmile porozumíš své cestě, pak poznáš sílu rozhodnutí.
		KDF_402_Corristo_KREIS3.permanent = 0;
	};
};

instance KDF_402_Corristo_KREIS4(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_KREIS4_Condition;
	information = KDF_402_Corristo_KREIS4_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0);
};

func int KDF_402_Corristo_KREIS4_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_KREIS4_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_KREIS4_Info_15_01");	//Jsem připraven vstoupit do Pátého kruhu.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_02");	//Dokončil jsi první tři Kruhy. Nyní nadešel čas naučit se tajemství magie.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_03");	//Kouzlo run je založeno na kamenech. Existují kouzelné kameny, vytvořené z kouzelné rudy.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_04");	//Z té samé rudy, která se těží tady v dolech. Tato ruda je obdařena magickými formulemi templářů. Tyto runy jsou upraveny jako nástroje naší moci.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_05");	//S těmito runami, které už ovládáš, máš celé vědění chrámové sféry v malíčku.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_06");	//Teď už víš všechno, co jsem tě mohl naučit.
		AI_Output(self,other,"KDF_402_Corristo_KREIS4_Info_14_07");	//Jakmile porozumíš magii, objevíš tajemství moci.
		KDF_402_Corristo_KREIS4.permanent = 0;
	};
};

instance KDF_402_Corristo_HEAVYARMOR(C_Info)
{
	npc = Kdf_402_Corristo;
	condition = KDF_402_Corristo_HEAVYARMOR_Condition;
	information = KDF_402_Corristo_HEAVYARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString(NAME_CorristoHighRobe,VALUE_KDF_ARMOR_H);
};

func int KDF_402_Corristo_HEAVYARMOR_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void KDF_402_Corristo_HEAVYARMOR_Info()
{
	AI_Output(other,self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01");	//Mistře, chtěl bych nosit vznešené roucho Ohně.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"KDF_402_Corristo_WANNBEKDF_Info_14_04");	//Ještě nemáš dostatečné vědomosti. Vrať se, až budeš znát víc.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_KDF_ARMOR_H)
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//Nemáš dost rudy.
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04");	//Nadešel čas. Jsi hoden nosit vznešené roucho Ohně.
		CreateInvItem(hero,kdf_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor(hero);
		KDF_402_Corristo_HEAVYARMOR.permanent = 0;
	};
};

