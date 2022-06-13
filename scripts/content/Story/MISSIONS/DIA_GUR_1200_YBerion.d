instance Info_Yberion_EXIT(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 999;
	condition = Info_Yberion_EXIT_Condition;
	information = Info_Yberion_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Yberion_EXIT_Condition()
{
	return 1;
};

func void Info_Yberion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_YBerion_Wache(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Wache_Condition;
	information = DIA_YBerion_Wache_Info;
	permanent = 0;
	important = 1;
};

func int DIA_YBerion_Wache_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void DIA_YBerion_Wache_Info()
{
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//Co tady děláš? Kdo tě sem pustil? Stráže!
	B_IntruderAlert(self,other);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

instance DIA_YBerion_Kennen(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Kennen_Condition;
	information = DIA_YBerion_Kennen_Info;
	permanent = 0;
	description = "Buď pozdraven, mistře Y´Berione.";
};

func int DIA_YBerion_Kennen_Condition()
{
	if(Kapitel == 2)
	{
		return 1;
	};
};

func void DIA_YBerion_Kennen_Info()
{
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00");	//Buď pozdraven, mistře Y´Berione.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//Ach! Tuhle tvář znám!
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//Vyloučeno. Nikdy jsme se neviděli.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//Ale přece... Dobře - co chceš?
};

instance Info_YBerion_BringFocus(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = Info_YBerion_BringFocus_Condition;
	information = Info_YBerion_BringFocus_Info;
	permanent = 1;
	description = "Slyšel jsem, že něco hledáš.";
};

func int Info_YBerion_BringFocus_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_YBerion_Kennen) && (Npc_GetTrueGuild(hero) != GIL_None) && (YBerion_BringFocus != LOG_RUNNING) && (YBerion_BringFocus != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//Slyšel jsem, že něco hledáš.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//To je pravda. Potřebujeme kouzelné ohnisko.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//Poslali jsme novice Nyrase, aby ho přinesl. Ještě se ale nevrátil.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//Mohl bys pro mě vypátrat, co se stalo.
	Info_ClearChoices(Info_YBerion_BringFocus);
	Info_AddChoice(Info_YBerion_BringFocus,DIALOG_BACK,Info_YBerion_BringFocus_BACK);
	Info_AddChoice(Info_YBerion_BringFocus,"Přinesu to ohnisko zpátky!",Info_YBerion_BringFocus_OK);
	Info_AddChoice(Info_YBerion_BringFocus,"Kde mám začít pátrat?",Info_YBerion_BringFocus_WO);
	Info_AddChoice(Info_YBerion_BringFocus,"Proč je to ohnisko tak důležité?",Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK()
{
	Info_ClearChoices(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//Přinesu to ohnisko zpátky!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//Vem si tuhle mapu! Je na ní vyznačena poloha ohniska.
	B_Story_BringFirstFocus();
	B_LogEntry(CH2_Focus,"Y´Berion vyslal novice Nyrase, aby přinesl magické ohnisko, ten se však ještě nevrátil. Guru mi dal mapu s vyznačenou cestou k ohnisku.");
};

func void Info_YBerion_BringFocus_WO()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//Kde mám začít pátrat?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//Vyjdi z tábora, dej se doprava a pak nahoru na vysoký útes. Pak pokračuj lesem, dokud neuvidíš moře. Tam to ohnisko najdeš.
};

func void Info_YBerion_BringFocus_FOKUS()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//Proč je to ohnisko tak důležité?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//Je to magický předmět, který soustřeďuje naši duchovní sílu.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//Je to jeden z pěti ohniskových kamenů, které použili mágové ke vztyčení Bariéry.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//V jedné vidině jsem viděl, jak využíváme sílu toho ohniska.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//To byla docela zajímavá vidina.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//Moje vidina byla znamením od Spáče. Můžeme k němu dojít pomocí toho ohniska!
};

instance Info_YBerion_BringFocus_RUNNING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_RUNNING_Condition;
	information = Info_YBerion_BringFocus_RUNNING_Info;
	permanent = 0;
	description = "Pořád to ohnisko nemůžu najít.";
};

func int Info_YBerion_BringFocus_RUNNING_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && !Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_YBerion_BringFocus_RUNNING_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//Pořád to ohnisko nemůžu najít.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//Tak hledej. Spáč tě povede.
};

instance Info_YBerion_BringFocus_Success(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_Success_Condition;
	information = Info_YBerion_BringFocus_Success_Info;
	permanent = 0;
	description = "Našel jsem to ohnisko.";
};

func int Info_YBerion_BringFocus_Success_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Success_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//Našel jsem to ohnisko.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//Výborně. Nesmírně jsi nám pomohl.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//Teď dej to ohnisko zpátky Corovi Kalomovi. Ten ví, co je třeba udělat.
	if(Kalom_TalkedTo == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//Kde najdu toho Cora Kaloma?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//Většinu času tráví ve své alchymistické dílně v horní sekci můstků.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//Zeptej se u vchodu do tábora Lestera... ten často provádí nováčky po táboru.
		B_LogEntry(CH2_Focus,"Y'Berion mě najal, abych se získal Ohnisko pro guru jménem 'Cor Kalom'. Tento guru tráví celé dny ve své alchymistické laboratoř.i");
	}
	else
	{
		B_LogEntry(CH2_Focus,"Y'Berion mě najal, abych získal Ohnisko pro Cor Kaloma. Jaké potěšení znovu potkat tuto velmi přívětivou osobu.");
	};
	TPL_1406_Templer.aivar[AIV_PASSGATE] = TRUE;
	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP(XP_BringFocusToYBerion);
};

instance Info_YBerion_NYRAS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_NYRAS_Condition;
	information = Info_YBerion_NYRAS_Info;
	permanent = 0;
	description = "Novic Nyras zešílel!";
};

func int Info_YBerion_NYRAS_Condition()
{
	if(Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_NYRAS_Info()
{
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//Novic Nyras zešílel!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//Říkal, že mluvil se Spáčem, který si ho zvolil za svého pomocníka!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//Pak mě napadl a pokusil se mě zabít!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//Spáčova moc je tak nesmírná, že nepřipravené duše přivede k zoufalství!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//Jenom my, Guru, jsme léty strávenými v meditacích dosáhli takové duchovní síly, která dokáže unést sílu hlasu všemohoucího Spáče!
};

instance GUR_1200_Yberion_EARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = GUR_1200_Yberion_EARN_Condition;
	information = GUR_1200_Yberion_EARN_Info;
	important = 0;
	permanent = 0;
	description = "A co takhle nějaká odměna?";
};

func int GUR_1200_Yberion_EARN_Condition()
{
	if(((YBerion_BringFocus == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_NOV) && C_IsChapter(2)) || ((YBerion_BringFocus == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_GUR) && C_IsChapter(2)) || ((YBerion_BringFocus == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_TPL) && C_IsChapter(2)))
	{
		return 1;
	};
};

func void GUR_1200_Yberion_EARN_Info()
{
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//A co takhle nějakou odměnu?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//Protože nejsi členem našeho Bratrstva, odměním tě.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//Vezmi si tento amulet na znamení mé vděčnosti.
	CreateInvItem(self,Schutzamulett_Feuer);
	B_GiveInvItems(self,hero,Schutzamulett_Feuer,1);
};

instance GUR_1200_YBERION_WANNBEGURU(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_wannbeguru_condition;
	information = gur_1200_yberion_wannbeguru_info;
	important = 0;
	permanent = 1;
	description = "Chtěl jste se mnou mluvit?";
};

func int gur_1200_yberion_wannbeguru_condition()
{
	if(Npc_KnowsInfo(hero,gur_1204_baalnamib_guraufnahme) && (YBERION_GURAUFNAHME != 1) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void gur_1200_yberion_wannbeguru_info()
{
	AI_Output(other,self,"GUR_1200_YBerion_WANNBEGURU_Info_20_01");	//Chtěl jste se mnou mluvit?
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_02");	//Slyšel jsem, co se stalo ve Starém dole.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_03");	//Dokázal jsi, že jsi hoden Spáčovi cti.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_04");	//Spolu s ostatními Baaly jsme toho názoru, že jsi připraven dostat šanci stát se jedním z našich Guru.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_13");	//Obvykle to trvá roky tréninku, ale tvoje činy ukázali, že je Spáč s tebou.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_21_05");	//Jako jeden z nás musíš opustit svůj starý život. Jakmile jsi Guru, tak sloužíš jenom Spáčovi.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_06");	//Budeš kázat bezvěrcům, ukážeš jim, že existuje pouze jediný pravý Bůh. Že Spáč je vykupitelem všech naších duší!
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_07");	//Není to snadná cesta, ale je to cesta za svobodou. Jakmile uslyšíš Spáčův hlas, budeš vědět, že tvoje pouť stála za to.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_08");	//Než se k nám připojíš, budeš muset projít závěrečnou zkouškou.
	if(hero.level < 15)
	{
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_05");	//Ale ještě nejsi připraven. Vrať se, až bude tvoje víra upevněna.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(15);
	}
	else
	{
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_10");	//Tvoje víra v Spáče je upevněna a dokázal jsi, že jsi hoden.
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_20");	//Jsi připraven podstoupit zkoušku?
		YBERION_GURAUFNAHME = 1;
		gur_1200_yberion_wannbeguru.permanent = 0;
		Info_ClearChoices(gur_1200_yberion_wannbeguru);
		Log_CreateTopic(GE_BECOMEGURU,LOG_NOTE);
		B_LogEntry(GE_BECOMEGURU,"Předtím než mě Y'Berion přijme mezi Guru tak mě podrobí zkoušce.");
	};
};

instance GUR_1200_YBERION_GURUTEST(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_gurutest_condition;
	information = gur_1200_yberion_gurutest_info;
	important = 0;
	permanent = 0;
	description = "Jsem připraven složit závěrečnou zkoušku.";
};

func int gur_1200_yberion_gurutest_condition()
{
	if(YBERION_GURAUFNAHME == 1)
	{
		return TRUE;
	};
};

func void gur_1200_yberion_gurutest_info()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_Info_15_01");	//Jsem připraven složit závěrečnou zkoušku.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_Info_14_02");	//Budiž.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_Info_14_03");	//Proč jsi si vybral Spáčovo Bratrstvo?
	BECOME_GURU = LOG_RUNNING;
	Log_CreateTopic(CH2_GURU,LOG_MISSION);
	Log_SetTopicStatus(CH2_GURU,LOG_RUNNING);
	B_LogEntry(CH2_GURU,"Přijal jsem Y'Berionovu závěrečnou zkoušku. Pokud to dokážu, budu přijat mezi Guru.");
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Prostě se to stalo.",gur_1200_yberion_gurutest_nurso);
	Info_AddChoice(gur_1200_yberion_gurutest,"Protože jsem hledal vykoupení.",gur_1200_yberion_gurutest_erlÖsung);
	Info_AddChoice(gur_1200_yberion_gurutest,"Kvůli Trávě z bažin.",gur_1200_yberion_gurutest_kraut);
};

func void gur_1200_yberion_gurutest_nurso()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_NURSO_Info_15_01");	//Prostě se to stalo.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_03");	//No, myslím, že jsem se v tobě zmýlil. Myslel jsem, že jsi se k nám připojil jako pravý věřící následovník Spáče.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_04");	//Za těchto okolností tě nemůžu přijmout mezi naše Guru.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_05");	//Jdi. Hned. Už ti nemám co říct.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zlyhal jsem a Y'Berion mě už mezi Guru nepřijme.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_erlÖsung()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_15_01");	//Protože jsem hledal vykoupení.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_03");	//Jako My všichni jsi měl už dost tohoto místa a přišel jsi do našeho tábora jako skutečný věřící následovník Spáče.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_04");	//To je dobře. Společně najdeme spasení. Spáč je náš zachránce a ukáže nám cestu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_05");	//Přejděme k další otázce. Pokud jsi poslouchal slova Baala Cadara, nebude to pro tebe problém.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_06");	//Kdy se mi Spáč poprvé zjevil ?
	YBERION_GURAUFNAHME = 2;
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Před 3 lety.",gur_1200_yberion_gurutest_three);
	Info_AddChoice(gur_1200_yberion_gurutest,"Před 5 lety.",gur_1200_yberion_gurutest_five);
	Info_AddChoice(gur_1200_yberion_gurutest,"Před 4 lety.",gur_1200_yberion_gurutest_four);
	Info_AddChoice(gur_1200_yberion_gurutest,"Nevím.",gur_1200_yberion_gurutest_dontknow);
};

func void gur_1200_yberion_gurutest_kraut()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_15_01");	//Kvůli Trávě z bažin.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_03");	//Trávu z bažin používáme aby jsme se přiblížili k Spáčovi. Poskytuje nám vize a mimo jiné je velice oblíbená v ostatních táborech.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_04");	//Je tak oblíbená, že se k nám mnoho lidí přidalo jenom kvůli ní. Uchazeč o místo mezi Guru musí mít čistou duši a pevnou víru.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_05");	//Protože to není tvůj případ, cesta k Baalům není pro tebe. Za těchto okolností tě již nemůžeme přijmout.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zlyhal jsem a Y'Berion mě už mezi Guru nepřijme.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_three()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_THREE_Info_15_01");	//Před 3 lety.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_03");	//To není správně. Vidím, že jsi své studie opomněl. Nemůžeme přijat nikoho, kdo nezná historii Bratrství.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_04");	//Je mi to líto, ale nemůžeme tě přijmout mezi nás.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zlyhal jsem a Y'Berion mě už mezi Guru nepřijme.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_five()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FIVE_Info_15_01");	//Před 5 lety.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_03");	//Správně. Pro Novice je důležité znát historii Bratrstva.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_04");	//Jedním z úkolů Guru je šířít víru Spáče mezi nevěřící. To zahrnuje i příběh Spáčova Bratrstva.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_05");	//Znáš ten příběh. Zavede tě daleko na tvé cestě za osvícením.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_06");	//A teď poslední otázka, kolik máme mužů v kruhu Baalů?
	YBERION_GURAUFNAHME = 3;
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Je jich 8.",gur_1200_yberion_gurutest_acht);
	Info_AddChoice(gur_1200_yberion_gurutest,"Je jich 7.",gur_1200_yberion_gurutest_sieben);
	Info_AddChoice(gur_1200_yberion_gurutest,"Je jich 6.",gur_1200_yberion_gurutest_sechs);
	Info_AddChoice(gur_1200_yberion_gurutest,"Je jich 5.",gur_1200_yberion_gurutest_fuenf);
};

func void gur_1200_yberion_gurutest_four()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FOUR_Info_15_01");	//Před 4 lety.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_03");	//To není správně. Zmýlil jsem se. Ještě nejsi připraven přidat se k Baalům.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_04");	//Jdi a věnuj se studiu.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zlyhal jsem a Y'Berion mě už mezi Guru nepřijme.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_dontknow()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_15_01");	//Nevím.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_03");	//Nemohu přijmout takovou odpověď od někoho, kdo se chce připojit k Baalům.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_04");	//Bude lepší, když se vrátiš ke svým každodenním úkolům.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_05");	//Cesta Guru ti nebyla předurčena.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zlyhal jsem a Y'Berion mě už mezi Guru nepřijme.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_acht()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_ACHT_Info_15_01");	//Je jich 8.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_03");	//Správně.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_04");	//Na všechny mé otázky jsi odpověděl správně a složil jsi tak závěrečnou zkoušku.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_05");	//Následuj mě do velké síně. Provedeme tam rituál, pomocí kterého můžeš navázat kontakt se Spáčem a rozšířit své vědomí.
	YBERION_GURAUFNAHME = 4;
	b_story_guruaufnahme();
	BECOME_GURU = LOG_SUCCESS;
	B_GiveXP(XP_GETBAAL);
	Log_SetTopicStatus(CH2_GURU,LOG_SUCCESS);
	B_LogEntry(CH2_GURU,"Splnil jsem Y'Berionovu zkoušku. Nyní budu přijat mezi Baaly Spáčova Bratrstva.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_sieben()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_15_01");	//Je jich 7.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_03");	//To není pravda. Během svého pobytu v táboře by jsi měl potkat všechny naše Baaly.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_04");	//Zřejmě jsem se s v tobě mýlil ...
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zlyhal jsem a Y'Berion mě už mezi Guru nepřijme.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_sechs()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_SECHS_Info_15_01");	//Je jich 6.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_03");	//Kandidát na Baala, který neví kolik je v táboře Baalů ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_04");	//Možná by jsi se měl vrátit ke svým každodenním úkolům.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zlyhal jsem a Y'Berion mě už mezi Guru nepřijme.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_fuenf()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FUENF_Info_15_01");	//Je jich 5.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_02");	//Takže ...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_03");	//To je špatně. Zdá se, že jsi zapomněl na některé vysoce postavené členy našeho Bratrstva.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_04");	//To je smutné. Myslím, že bude lepší, když zůstaneš Novicem.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zlyhal jsem a Y'Berion mě už mezi Guru nepřijme.");
	AI_StopProcessInfos(self);
};

instance GUR_1200_YBERION_RITUAL(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_ritual_condition;
	information = gur_1200_yberion_ritual_info;
	important = 1;
	permanent = 0;
};

func int gur_1200_yberion_ritual_condition()
{
	if((YBERION_GURAUFNAHME == 4) && (Npc_GetDistToWP(hero,"PSI_TEMPLE_IN_05") < 1000))
	{
		return 1;
	};
};

func void gur_1200_yberion_ritual_info()
{
	YBERION_GURAUFNAHME = 5;
	AI_UnequipWeapons(hero);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoNpc(hero,self);
	b_story_guruaufnahme();
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_01");	//Pod ostražitýma očima Spáče jsme se sešli, abychom přijali do našeho kruhu nového bratra.
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_02");	//Tento muž vykonal ve jménu Spáče velké věci. Ukázal cestu mnoha nevěřícím. Ukázal jim, jak velkou mocí Spáč disponuje.
	Snd_Play("howling_01");
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_03");	//Spáči! Přijmi tohoto muže za svého služebníka!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_04");	//Chraň ho na jeho budoucích cestách a staňte se jedním!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_05");	//Dej mu sílu VIDĚT!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_06");	//Dovol mu vidět cestu ke svobodě, kterou jsi ukázal i nám!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_07");	//Osviť jeho mysl a veď ho na cestě za světlem!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_08");	//Spáči vyslyš mě!
	AI_StopProcessInfos(self);
};

instance GUR_1200_YBERION_ROBE(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_robe_condition;
	information = gur_1200_yberion_robe_info;
	important = 1;
	permanent = 0;
};

func int gur_1200_yberion_robe_condition()
{
	if(YBERION_GURAUFNAHME == 5)
	{
		return 1;
	};
};

func void gur_1200_yberion_robe_info()
{
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_07");	//Nyní jsi hoden nosit roucho Baala.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_08");	//Vezmi si tohle roucho a nos jej, aby jsi všem ukázal svůj závazek sloužit Spáčovi.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_09");	//Jako Baal se nyní můžeš učit Spáčovu magii.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_10");	//Promluv s Baal Cadarem. Naučí tě vše potřebné.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_11");	//Teď je čas.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_12");	//Zvěstuj pravdu nevzdělaným.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_13");	//Řekni jim o Spáčově cestě. Vysvětli jim, že je to jediná možná cesta.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_14");	//Veď naše bratry ke svobodě a ukaž jim, že každá oběť, kterou vykonají je obětí pro Spáče.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_15");	//Protože tvá síla spočívá ve víře v Spáče.
	YBERION_GURAUFNAHME = 6;
	b_story_guruaufnahme();
	Snd_Play("MFX_Heal_Cast");
	CreateInvItem(hero,gur_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	Npc_SetTrueGuild(hero,GIL_GUR);
	hero.guild = GIL_GUR;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_EquipBestArmor(hero);
	AI_UnequipWeapons(hero);
	Wld_AssignRoomToGuild("hütte26",GIL_VLK);
	Wld_AssignRoomToGuild("NLHU25",GIL_SLD);
	B_LogEntry(GE_BECOMEGURU,"Splnil jse závěrečnou zkoušku potřebnou pro přijetí mezi guru. Dosáhl jsem nejvyššího možného postu v Bratrstvu a od nynějška se můžu učit Spáčovu magii. Baal Cadar bude mým učitelem.");
	B_LogEntry(GE_BecomeTemplar,"Teď, když jsem si vybral cestu Guru, už se nemůžu připojit k Templářům.");
	AI_StopProcessInfos(self);
};

instance GUR_1200_YBERION_LASTWORDS(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_lastwords_condition;
	information = gur_1200_yberion_lastwords_info;
	important = 1;
	permanent = 0;
};

func int gur_1200_yberion_lastwords_condition()
{
	if(Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};
};

func void gur_1200_yberion_lastwords_info()
{
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_01");	//Konec ... Spáč ... viděl jsem ... HO!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_02");	//Kdo ...? ... jsi to ty, dobře. Poslouchej mě ....
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_03");	//Spáč se nesmí probudit ... Mágové Vody ...
	AI_Output(other,self,"GUR_1200_Yberion_LASTWORDS_Info_15_04");	//Co je s Mágy Vody?
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_05");	//Musíte jít za Mágy Vody. Jedině tak se odsud dostanete.
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_06");	//Spáč ... viděl jsem ho. Je to ... démon!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_07");	//Pokud chtějí Bariéru zničit ... Jdi do Nového tábora. Řekni jim o Ohnisku. Řekni jim ...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_08");	//... řekni jim, že jsme zjistili, jak nabít Ohnisko, měli by ... měli zničit Bariéru ...... musíš ...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_09");	//... zlo ... Se nesmí probudit ....
	AI_StopProcessInfos(self);
};

