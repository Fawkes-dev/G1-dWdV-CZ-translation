var int Diego_After_Gamestart;

instance Info_Diego_Gamestart(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_Gamestart_Condition;
	information = Info_Diego_Gamestart_Info;
	permanent = 0;
	important = 1;
};

func int Info_Diego_Gamestart_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00");	//Jsem Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01");	//Já jsem...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02");	//Nezajímá mě, kdo jsi. Právě jsi přišel. Dohlížím na nové příchozí. To je zatím všechno.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03");	//Jestli se tu chystáš nějakou chvíli zůstat, možná bychom si mohli trochu důvěřovat. Samozřejmě ti ale nebudu bránit, když se budeš chtít zničit. Tak co si myslíš?
	B_Kapitelwechsel(1);
};

instance Info_Diego_EXIT_Gamestart(C_Info)
{
	npc = PC_Thief;
	nr = 999;
	condition = Info_Diego_EXIT_Gamestart_Condition;
	information = Info_Diego_EXIT_Gamestart_Info;
	permanent = 0;
	description = DIALOG_ENDE;
};

func int Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

func void Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00");	//Díky za tvou pomoc.
	if(!Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01");	//Je to tvoje rozhodnutí. Rád jsem tě poznal.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02");	//Sejdeme se ve Starém táboře.
	};
	AI_StopProcessInfos(self);
	if(Kapitel < 2)
	{
		Npc_ExchangeRoutine(self,"Start");
		Diego_After_Gamestart = TRUE;
	};
};

instance Info_Diego_EXIT_Later(C_Info)
{
	npc = PC_Thief;
	nr = 999;
	condition = Info_Diego_EXIT_Later_Condition;
	information = Info_Diego_EXIT_Later_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Diego_EXIT_Later_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_EXIT_Gamestart))
	{
		return 1;
	};
};

func void Info_Diego_EXIT_Later_Info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"Info_Diego_EXIT_11_01");	//Tak pojďme.
	}
	else
	{
		AI_Output(hero,self,"Info_Diego_EXIT_15_00");	//Opatruj se.
	};
	AI_StopProcessInfos(self);
};

instance Info_Diego_Brief(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Brief_Condition;
	information = Info_Diego_Brief_Info;
	permanent = 0;
	description = "Mám dopis pro Velkého mága Kruhu ohně.";
};

func int Info_Diego_Brief_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00");	//Mám dopis pro Velkého mága Kruhu ohně.
	AI_Output(self,hero,"Info_Diego_Brief_11_01");	//Opravdu...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02");	//Dal mi ho jeden mág krátce předtím, než mě sem vyslal.
	AI_Output(self,hero,"Info_Diego_Brief_11_03");	//Máš štěstí, že už se před mágy nesmím nikdy ukázat. Kdokoliv jiný by tě kvůli tomu dopisu s chutí podřezal.
	AI_Output(self,hero,"Info_Diego_Brief_11_04");	//To protože mágové své kurýry dobře platí a většina lidí tu nemá nic.
	AI_Output(self,hero,"Info_Diego_Brief_11_05");	//Být tebou, byl bych zticha, dokud bych nepotkal některého z mágů. I když to se ti hned tak nepodaří.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Proč ne?
	AI_Output(self,hero,"Info_Diego_Brief_11_07");	//Mágové jsou na hradě ve Starém táboře. Na hrad smí pouze Gomezovi lidé.
	B_LogEntry(CH1_MESSAGEKDF,"Mágové Ohně žijí uvnitř hradu. Do hradu však můžou vstoupit jenom Gomezovi lidé.");
};

instance Info_Diego_WarumGeholfen(C_Info)
{
	npc = PC_Thief;
	nr = 5;
	condition = Info_Diego_WarumGeholfen_Condition;
	information = Info_Diego_WarumGeholfen_Info;
	permanent = 0;
	description = "Proč jsi mi pomohl?";
};

func int Info_Diego_WarumGeholfen_Condition()
{
	if(!Diego_After_Gamestart && (Kapitel < 2))
	{
		return 1;
	};
};

func void Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00");	//Proč jsi mi pomohl?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01");	//Protože jsi potřeboval pomoc, jinak by tě Bullit a jeho chlapi mohli zabít.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02");	//A já bych nemohl stát a přihlížet. Takhle ti mohu udělat nabídku.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03");	//Nabídku?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04");	//Ano. Po tom malém incidentu s Bullitem a jeho chlapy by ti mělo být jasné, že potřebuješ ochranu.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05");	//Každý, kdo sem přijde, má možnost volby. V kolonii jsou tři tábory a ty se budeš muset přidat k jednomu z nich.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06");	//Jsem tu proto, abych přesvědčil nováčky, že Starý tábor je pro ně to nejlepší místo.
};

instance Info_Diego_Bullit(C_Info)
{
	npc = PC_Thief;
	nr = 5;
	condition = Info_Diego_Bullit_Condition;
	information = Info_Diego_Bullit_Info;
	permanent = 0;
	description = "Kde je teď Bullit?";
};

func int Info_Diego_Bullit_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_WarumGeholfen) && !Diego_After_Gamestart)
	{
		return 1;
	};
};

func void Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02");	//Kde je teď Bullit?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03");	//Přenesl se svými druhy zboží z vnějšího světa do Starého tábora. Tam ho najdeš.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04");	//Jestli s ním ale chceš bojovat, buď opatrný. Je to zkušený bojovník.
};

instance Info_Diego_Kolonie(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_Kolonie_Condition;
	information = Info_Diego_Kolonie_Info;
	permanent = 0;
	description = "Dobrá, co bych měl vědět o tomhle místě?";
};

func int Info_Diego_Kolonie_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00");	//Dobrá, co bych měl vědět vědět o tomhle místě?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01");	//Říkáme mu kolonie. Určitě už jsi slyšel, že tu těžíme rudu pro krále.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02");	//Dobře, to děláme my - ve Starém táboře.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03");	//Uvnitř Bariéry jsou tři tábory. Starý tábor je největší a nejstarší.
};

instance Info_Diego_Barriere(C_Info)
{
	npc = PC_Thief;
	nr = 70;
	condition = Info_Diego_Barriere_Condition;
	information = Info_Diego_Barriere_Info;
	permanent = 0;
	description = "Řekni mi něco o Bariéře.";
};

func int Info_Diego_Barriere_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && !Diego_After_Gamestart)
	{
		return 1;
	};
};

func void Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00");	//Řekni mi něco o Bariéře.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01");	//Není toho moc. Je neproniknutelná.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02");	//Co by se stalo, kdybych šel odtud pryč?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03");	//Poslední, kdo se pokusil projít na druhou stranu, je mrtvý. Ta proklatá Bariéra tě nechá vstoupit dovnitř, ale nikdy už tě nepustí ven.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04");	//Jestli existuje nějaká cesta ven, najdu ji.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05");	//Jsi opravdu rozhodnutý jít odtud pryč? Ale právě jsi přišel!
};

instance Info_Diego_OtherCamps(C_Info)
{
	npc = PC_Thief;
	nr = 2;
	condition = Info_Diego_OtherCamps_Condition;
	information = Info_Diego_OtherCamps_Info;
	permanent = 0;
	description = "A co ty dva ostatní tábory?";
};

func int Info_Diego_OtherCamps_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Barriere) && !Diego_After_Gamestart && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00");	//A co ty dva ostatní tábory?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01");	//Ostatní dva tábory jsou rozdělené kvůli svým šíleným plánům na únik.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02");	//Nový tábor je na západě kolonie a jeho mágové si myslí, že můžou prolomit Bariéru, jakmile se jim podaří nashromáždit dostatečné množství magické rudy.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03");	//A potom jsou tu na východě sektářští blázni. Jejich tábor leží uprostřed bažin, kde se modlí ke svému idolu, aby je osvobodil.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04");	//Nejsou už dlouho svéprávní.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05");	//Být tebou, tak bych se těmi vyšinutými mozky nezabýval.
};

instance Info_Diego_OldCamp(C_Info)
{
	npc = PC_Thief;
	nr = 71;
	condition = Info_Diego_OldCamp_Condition;
	information = Info_Diego_OldCamp_Info;
	permanent = 0;
	description = "Řekni mi něco o Starém táboře.";
};

func int Info_Diego_OldCamp_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && !Diego_After_Gamestart)
	{
		return 1;
	};
};

func void Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00");	//Řekni mi něco o Starém táboře.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01");	//Je to největší a nejstarší ze všech tří táborů. Gomez a jeho chlapi mají tábor pod kontrolou, a proto tedy i celý obchod s rudou.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02");	//Jednou za měsíc nám král pošle všechno, co potřebujeme. Máme toho starého páprdu na háku, chápeš?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03");	//Posílá nám víno, chleba, maso, zbraně... prostě všechno.
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,hero,"Info_Diego_OldCamp_11_04");	//Také z toho můžeš něco dostat. Akorát se musíš přidat ke Gomezovi.
	};
};

instance Info_Diego_WhosGomez(C_Info)
{
	npc = PC_Thief;
	nr = 3;
	condition = Info_Diego_WhosGomez_Condition;
	information = Info_Diego_WhosGomez_Info;
	permanent = 0;
	description = "Kdo je Gomez?";
};

func int Info_Diego_WhosGomez_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OldCamp) || Npc_KnowsInfo(hero,Info_Diego_Brief))
	{
		return 1;
	};
};

func void Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00");	//Kdo je Gomez?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01");	//Gomez je nejmocnější Rudobaron. Je to šéf Starého tábora - nejmocnější muž v kolonii.
};

instance Info_Diego_JoinOldcamp(C_Info)
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_JoinOldcamp_Condition;
	information = Info_Diego_JoinOldcamp_Info;
	permanent = 0;
	description = "Předpokládejme, že bych se chtěl přidat k jeho lidem, co pro to musím udělat?";
};

func int Info_Diego_JoinOldcamp_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_WhosGomez) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return TRUE;
	};
};

func void Info_Diego_JoinOldcamp_Info()
{
	var C_Npc Thorus;
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00");	//Předpokládejme, že bych se chtěl přidat k jeho lidem, co pro to musím udělat?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01");	//U hradní brány najdeš člověka jménem Thorus. Řekni mu, že tě posílá Diego.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
	Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
	B_LogEntry(CH1_JoinOC,"Pokud se chci přidat ke Gomezovým lidem ve Starém táboře, musím promluvit s Thorusem.");
};

instance Info_Diego_WayToOldcamp(C_Info)
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_WayToOldcamp_Condition;
	information = Info_Diego_WayToOldcamp_Info;
	permanent = 0;
	description = "Jak se dostanu do Starého tábora?";
};

func int Info_Diego_WayToOldcamp_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OldCamp) && !Diego_After_Gamestart)
	{
		return 1;
	};
};

func void Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00");	//Jak se dostanu do Starého tábora?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01");	//Musíš jít po téhle cestě. Starý tábor je nejbližší bezpečně vyhlížející místo, na které můžeš narazit.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02");	//Mezi tábory se potuluje spousta nebezpečných zvířat. Byl bys blázen, kdyby ses tudy vydal beze zbraně.
};

instance Info_Diego_WoWaffe(C_Info)
{
	npc = PC_Thief;
	nr = 4;
	condition = Info_Diego_WoWaffe_Condition;
	information = Info_Diego_WoWaffe_Info;
	permanent = 0;
	description = "Kde bych mohl sehnat nějakou zbraň?";
};

func int Info_Diego_WoWaffe_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && !Diego_After_Gamestart)
	{
		return 1;
	};
};

func void Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00");	//Kde bych mohl sehnat nějakou zbraň?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01");	//Až dorazíš k zavalenému dolu, porozhlédni se kolem. Určitě najdeš něco užitečného.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02");	//Ten důl najdeš snadno, je to jenom pár metrů od kaňonu.
};

instance Info_Diego_ThorusSays(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_ThorusSays_Condition;
	information = Info_Diego_ThorusSays_Info;
	permanent = 0;
	description = "Mluvil jsem s Thorusem.";
};

func int Info_Diego_ThorusSays_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe))
	{
		return 1;
	};
};

func void Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00");	//Mluvil jsem s Thorusem.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01");	//A co říkal?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02");	//Říká, že se můžu přidat ke Starému táboru, pokud TY uznáš, že na to mám.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03");	//Vypadá to, že mám novou funkci.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04");	//Můžeme už začít?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05");	//Nejdříve by ses měl dovědět pár věcí.
};

instance Info_Diego_Rules(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Rules_Condition;
	information = Info_Diego_Rules_Info;
	permanent = 0;
	description = "Co musím znát, abych byl přijat do Starého tábora?";
};

func int Info_Diego_Rules_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_ThorusSays))
	{
		return 1;
	};
};

func void Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00");	//Co musím znát, abych byl přijat do Starého tábora?
	AI_Output(self,hero,"Info_Diego_Rules_11_01");	//Jestli se chceš přidat do tábora, budeš muset získat pár kladných bodů.
	AI_Output(self,hero,"Info_Diego_Rules_11_02");	//Ve Vnějším kruhu je několik vlivných lidí. Většina z nich jsou Stíny. Pokud se ti podaří udělat na ně dojem, získáš pár kladných bodů.
	AI_Output(self,hero,"Info_Diego_Rules_11_03");	//Pak budeš moci složit zkoušku oddanosti.
	AI_Output(self,hero,"Info_Diego_Rules_11_04");	//Pak je tu ještě řada dovedností, které se každý nováček musí naučit. Je toho k učení spousta, spousta. Čím víc se toho naučíš, tím větší cenu pro nás budeš mít.
	B_LogEntry(CH1_JoinOC,"Abych se mohl přidat, musím udělat dojem na lidi z Vnějšího okruhu a podstoupit Diegovu zkoušku poctivosti.");
};

instance Info_Diego_Celebs(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Celebs_Condition;
	information = Info_Diego_Celebs_Info;
	permanent = 0;
	description = "Kde najdu ty důležité lidi?";
};

func int Info_Diego_Celebs_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

func void Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00");	//Kde najdu ty důležité lidi?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01");	//Dobrá, právě se díváš na jednoho z nich. Pak je tu Thorus... toho už znáš.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02");	//Co se týče ostatních... budeš si je muset najít sám. Jestli se ti to nepodaří, nebudeš tady moci zůstat.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03");	//Běž přes Vnější okruh a mluv s lidmi. Tak zjistíš, kdo je důležitý.
};

instance Info_Diego_Teachers(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_Teachers_Condition;
	information = Info_Diego_Teachers_Info;
	permanent = 0;
	description = "Kdo mě může učit?";
};

func int Info_Diego_Teachers_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

func void Info_Diego_Teachers_Info()
{
	AI_Output(hero,self,"Info_Diego_Teachers_15_00");	//Kdo mě může učit?
	AI_Output(self,hero,"Info_Diego_Teachers_11_01");	//Začni s Fingersem. Ten je z nás nejzručnější.
	AI_Output(self,hero,"Info_Diego_Teachers_11_02");	//Když budeš mít oči na stopkách. najdeš další lidi, kteří tě budou moci učit.
	AI_Output(hero,self,"Info_Diego_Teachers_15_03");	//Kde najdu Fingerse?
	AI_Output(self,hero,"Info_Diego_Teachers_11_04");	//Jeho chatrč je trochu zpátky. Stojí přímo proti hradní zdi, když půjdeš odsud směrem k aréně.
	AI_Output(self,hero,"Info_Diego_Teachers_11_05");	//Když budeš u hradní brány, pokračuj doleva, až dojdeš k aréně.
	if(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Fingers mě může naučit dovednost VYBÍRÁNÍ KAPES a OTEVÍRÁNÍ ZÁMKŮ.");
	};
};

var int Diego_Merke_STR;
var int Diego_Merke_DEX;

instance Info_Diego_Teach(C_Info)
{
	npc = PC_Thief;
	nr = 100;
	condition = Info_Diego_Teach_Condition;
	information = Info_Diego_Teach_Info;
	permanent = 1;
	description = "Můžeš mě něco naučit?";
};

func int Info_Diego_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		return 1;
	};
};

func void Info_Diego_Teach_Info()
{
	if(log_diegotrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Diego mi může pomoci stát se SILNĚJŠÍM a OBRATNĚJŠÍM.");
		log_diegotrain = TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,hero,"Info_Diego_Teach_11_01");	//Ano. Můžu tě naučit, jak zlepšit obratnost nebo sílu.
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	Info_ClearChoices(Info_Diego_Teach);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK,Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_BACK()
{
	if(Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00");	//Tvoje síla se dost zlepšila.
	};
	if(Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01");	//Tvoje dovednost zacházení s lukem a samostřílem se zlepšila.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02");	//Vrať se brzy - ještě se toho musíš hodně naučit!
	Info_ClearChoices(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints(hero,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Info_Diego_Teach);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK,Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints(hero,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Info_Diego_Teach);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK,Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints(hero,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Info_Diego_Teach);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK,Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints(hero,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Info_Diego_Teach);
	Info_AddChoice(Info_Diego_Teach,DIALOG_BACK,Info_Diego_Teach_BACK);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Info_Diego_Teach_STR_1);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

var int Diego_BringList;

instance Info_Diego_BringList_Offer(C_Info)
{
	npc = PC_Thief;
	nr = 10;
	condition = Info_Diego_BringList_Offer_Condition;
	information = Info_Diego_BringList_Offer_Info;
	permanent = 0;
	description = "Co je to test oddanosti?";
};

func int Info_Diego_BringList_Offer_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

func void Info_Diego_BringList_Offer_Info()
{
	var C_Npc Ian;
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_00");	//Co je to test oddanosti?
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_01");	//Musíš jít do Starého dolu. Tam najdeš chlapíka jménem Ian. Ten ti dá seznam.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_02");	//Ten seznam je důležitý. Obsahuje všechny věci, které od nás potřebují chlapi tam v dole.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_03");	//Dostanou zásoby z příštího konvoje.
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_04");	//To není problém!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_05");	//Jeden problém by tady byl! Ten seznam se nesmí dostat do Nového tábora!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_06");	//Jak jsem řekl: ten seznam je důležitý. Když to provedeš dobře, pokročíš dál.
	Diego_BringList = LOG_RUNNING;
	Log_CreateTopic(CH1_BringList,LOG_MISSION);
	Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
	B_LogEntry(CH1_BringList,"Diego mě poslal do Starého dolu. Mám získat od chlapíka jménem Ian seznam. Tento seznam se nesmí dostat do rukou nikomu z Nového tábora.");
	Ian = Hlp_GetNpc(STT_301_Ian);
	CreateInvItem(STT_301_Ian,TheList);
};

instance Info_Diego_IanPassword(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_IanPassword_Condition;
	information = Info_Diego_IanPassword_Info;
	permanent = 0;
	description = "Když je ten seznam tak důležitý, tak proč by ho měl Ian dávat právě MNĚ?";
};

func int Info_Diego_IanPassword_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

func void Info_Diego_IanPassword_Info()
{
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_01");	//Když je ten seznam tak důležitý, tak proč by ho měl Ian dávat právě MNĚ?
	AI_Output(self,hero,"Info_Diego_IanPassword_Info_11_02");	//Protože mu řekneš, že tě poslal Diego.
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_03");	//Řeknu mu to.
	B_LogEntry(CH1_BringList,"Ian mi předá seznam, když mu řeknu, že mě posílá Diego.");
};

instance Info_Diego_MapToOldMine(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_MapToOldMine_Condition;
	information = Info_Diego_MapToOldMine_Info;
	permanent = 0;
	description = "Kde najdu Starý důl?";
};

func int Info_Diego_MapToOldMine_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

func void Info_Diego_MapToOldMine_Info()
{
	AI_Output(hero,self,"Info_Diego_MapToOldMine_Info_15_00");	//Kde najdu Starý důl?
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_01");	//Jdi za Grahamem. To je kartograf. Řekni mu, že jsem tě poslal a že potřebuješ mapu. Z té se dozvíš cestu do dolu.
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_02");	//Bydlí vlevo od severní brány.
	B_LogEntry(CH1_BringList,"Graham mi dá mapu. Najdu ho nalevo od severní brány.");
};

instance Info_Diego_BringList_Success(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_BringList_Success_Condition;
	information = Info_Diego_BringList_Success_Info;
	permanent = 0;
	description = "Mám seznam od Iana.";
};

func int Info_Diego_BringList_Success_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

func void Info_Diego_BringList_Success_Info()
{
	AI_Output(hero,self,"Info_Diego_BringList_Success_15_00");	//Mám seznam od Iana.
	if(Npc_HasItems(hero,TheList))
	{
		B_GiveInvItems(hero,self,TheList,1);
		B_LogEntry(CH1_BringList,"Diego měl velkou radost, když jsem mu předal seznam, který jsem dostal od Iana.");
	}
	else if(Npc_HasItems(hero,TheListNC))
	{
		B_GiveInvItems(hero,self,TheListNC,1);
		B_LogEntry(CH1_BringList,"Diego byl spokojen, když jsem mu donesl Ianův seznam.");
	};
	B_UseFakeScroll();
	AI_Output(self,hero,"Info_Diego_BringList_Success_11_01");	//Dobrá práce! Tak dostaneš pár kladných bodů!
	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	Log_SetTopicStatus(CH1_BringList,LOG_SUCCESS);
	Points_OC = Points_OC + 5;
};

var int Diego_GomezAudience;

instance Info_Diego_JoinAnalyze(C_Info)
{
	npc = PC_Thief;
	nr = 800;
	condition = Info_Diego_JoinAnalyze_Condition;
	information = Info_Diego_JoinAnalyze_Info;
	permanent = 1;
	description = "A co má vážnost v táboře?";
};

func int Info_Diego_JoinAnalyze_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_Rules) && (Npc_GetTrueGuild(hero) == GIL_None) && (oldHeroGuild == 0))
	{
		return 1;
	};
};

func void Info_Diego_JoinAnalyze_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_00");	//A co má vážnost v táboře?
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_11_01");	//Mluvil jsem s několika lidmi.
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_02");	//No a?
	Points_OC = 0;
	if(Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01");	//Scatty mi řekl, že jsi porazil Kirga.
		Points_OC = Points_OC + 2;
	}
	else if(Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02");	//Scatty mi řekl, že tě porazil Kirgo. Nevypadal moc nadšeně.
		Points_OC = Points_OC - 1;
	}
	else if(Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03");	//Scatty mi řekl, že už se nemůže dočkat, až tě uvidí nastoupit proti Kirgovi.
	};
	if(Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04");	//Ale udělalo na něj dojem, že jsi se postavil Kharimovi - ikdyž tě porazil.
		Points_OC = Points_OC + 2;
	}
	else if(Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05");	//Udělalo na něj ale velký dojem to, že jsi porazil Kharima - nepřestával o tobě vůbec mluvit.
		Points_OC = Points_OC + 5;
	}
	else if(Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06");	//Nemůže se dočkat, jestli vyzveš Kharima.
	};
	if(Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01");	//Whistler mi vyprávěl příběh o Fiskovi... Dobrá, být tebou, vzal bych tu rudu a zmizel - myslí si, že s tebou udělal velký obchod.
		Points_OC = Points_OC + 3;
	}
	else if((Whistler_BuyMySword == LOG_FAILED) || ((Whistler_BuyMySword == LOG_RUNNING) && (Whistler_BuyMySword_Day <= (Wld_GetDay() - 2))))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02");	//Mluvil jsem s Whistlerem. Sebral jsi jeho rudu, ty prohnanej bastarde! Musím uznat, že máš odvahu!
		Points_OC = Points_OC + 2;
	}
	else if(Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03");	//Whistler čeká na svůj meč. Měl by sis rozmyslet, jestli mu ho přineseš nebo ne. Jestli ne, bude si myslet, že jsi mu sebral jeho rudu!
	};
	if(Sly_LostNek == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01");	//Sly mi řekl, že jsi našel Neka. Myslím, že byl opravdu spokojený.
		Points_OC = Points_OC + 4;
	}
	else if(Sly_LostNek == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02");	//Mám pocit že se Sly v Nekovi spletl. Byl to opravdu otrapa, to je pravda, ale nemyslím si, že šel do Nového tábora.
	};
	if(Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01");	//Už jsem tě poslal k Fingersovi - mohl by tě doopravdy něco naučit!
	}
	else if(Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02");	//Fingers mi řekl, že ses už něco naučil, ale myslí si, že se máš pořád ještě v čem zlepšovat.
		Points_OC = Points_OC + 3;
	};
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01");	//Musím si promluvit s Dexterem. Využívá tě ve svůj vlastní prospěch.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02");	//Pro zkoušku ale neexistují žádná pravidla. Pokud se ti TO podaří, bude to velký krok kupředu.
	}
	else if(Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03");	//Opravdu se ti podařilo získat recept od Kaloma. Na Dextera to udělalo velký dojem a na mě taky.
		Points_OC = Points_OC + 5;
	};
	if(Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01");	//Úkol s Mordragem je docela dobrá práce. Jako bojovník není špatný. Jestli ho chceš porazit, měl bys hodně cvičit.
	}
	else if(Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02");	//Thorus říká, že bysme mohli potřebovat někoho, jako jsi ty - to je pro tebe velmi dobré.
		Points_OC = Points_OC + 5;
	}
	else
	{
		if(Thorus_MordragKo == LOG_FAILED)
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03");	//Thorusovi nejspíš praskne hlava vzteky - jak ses mohl opovážit pokazit TAKOVÝ úkol?
			Points_OC = Points_OC - 5;
		};
		if(Fisk_GetNewHehler == LOG_SUCCESS)
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01");	//Fisk mi řekl, že jsi ho překvapil. V každém případě bude na tvojí straně.
			Points_OC = Points_OC + 5;
		}
		else if((MordragKO_HauAb == TRUE) || (MordragKO_StayAtNC == TRUE))
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02");	//Fisk je na tebe opravdu naštvaný. Být tebou, hledal bych někoho namísto Mordraga.
		};
	};
	if(Points_OC > 15)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_00");	//Našel jsi dost lidí, kteří budou mluvit v tvůj prospěch.
		if(hero.level >= 5)
		{
			if(Diego_BringList == LOG_SUCCESS)
			{
				AI_Output(self,hero,"Info_Diego_Points_11_01");	//Také jsi složil zkoušku poctivosti. Jdi za Thorusem. Už jsem mu všechno řekl. Nechá tě navštívit Gomeze.
				Diego_GomezAudience = TRUE;
				Log_SetTopicStatus(CH1_JoinOC,LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego mi udělil slyšení u Gomeze. Teď se můžu stát jedním z Gomezových lidí, mám přístup na hrad, jen musím nejdříve navštívit Thoruse.");
			}
			else
			{
				AI_Output(self,hero,"Info_Diego_Points_11_02");	//Ještě ale musíš složit zkoušku poctivosti.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if(Points_OC > 10)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_10");	//Všechno nasvědčuje, že to na nováčka nebylo tak zlé.
	}
	else if(Points_OC >= 1)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_20");	//Počkej s tím! Zbývá ještě udělat spousta věcí, jestli se chceš někam v táboře dostat.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_Points_11_30");	//Děláš si srandu, chlapče? Vůbec nikdo tě tady nezná!
	};
};

instance Info_Diego_WhatToSayToGomez(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = Info_Diego_WhatToSayToGomez_Condition;
	information = Info_Diego_WhatToSayToGomez_Info;
	permanent = 0;
	description = "Co musím udělat, abych se dostal ke Gomezovi?";
};

func int Info_Diego_WhatToSayToGomez_Condition()
{
	if(Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

func void Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhatToSayToGomez_Info_15_00");	//Co musím udělat, abych se dostal ke Gomezovi?
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_01");	//Gomez se rozhoduje pomocí vnitřního instinktu. Podívá se ti na kukuč, a pak se rozhodne, jestli se můžeš přidat, nebo ne.
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_02");	//Od teďka si budeš muset jít po svých - dělej, jak nejlíp umíš. Bůh s tebou.
};

instance PC_Thief_ARMOR(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_ARMOR_Condition;
	information = PC_Thief_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H);
};

func int PC_Thief_ARMOR_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_HasItems(hero,stt_armor_h))
	{
		return TRUE;
	};
};

func void PC_Thief_ARMOR_Info()
{
	if(Npc_HasItems(hero,ItMiNugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output(hero,self,"PC_Thief_ARMOR_Info_15_01");	//Můžu mít takovou zbroj jako ty?
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_02");	//Máš dost rudy?
		CreateInvItem(hero,stt_armor_h);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_STT_ARMOR_H);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	}
	else
	{
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_03");	//Dej rudu, pak dostaneš výzbroj.
	};
};

instance PC_Thief_MEETAGAIN(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_MEETAGAIN_Condition;
	information = PC_Thief_MEETAGAIN_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_MEETAGAIN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"OW_PATH_190") < 700))
	{
		return TRUE;
	};
};

func void PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_00");	//Hej, myslel jsem, že jsi mrtvý!
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_01");	//Občas mám taky ten pocit.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_02");	//Od našeho posledního setkání se stalo hodně věcí. Slyšel jsem, že ses hodně podílel na posledním vzývání.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_03");	//Jako obvykle jsi dobře informován.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_04");	//Líp, než si myslíš... Hledáš teď ohnisko?
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_05");	//Ano. Musí tady někde být.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_06");	//Vím, kde ho najdeš. Je tu ale jeden problém.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_07");	//Rozumím. Co chceš dělat?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_08");	//Hodně ses toho naučil, ale to není to, co mám na mysli.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_09");	//Ne? A v čem je ten problém?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_10");	//Je tady hromada problémů.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_11");	//Tak dobře. Pochopíš to hned.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GuideTroll");
	Log_CreateTopic(CH3_TrollCanyon,LOG_MISSION);
	Log_SetTopicStatus(CH3_TrollCanyon,LOG_RUNNING);
	B_LogEntry(CH3_TrollCanyon,"Když jsem se přiblížil k ohniskovému místu na severu, ke svému překvapení jsem narazil na Diega. Varoval mě před čímsi 'velikým', co mě čeká na konci kaňonu.");
	B_LogEntry(CH3_TrollCanyon,"Nějak se dozvěděl o mé činnosti v Táboře v bažinách, stejně jako o tom, že hledám ohnisko. Budeme pokračovat společně.");
	AI_StopProcessInfos(self);
};

instance PC_Thief_SHOWFOCUS(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_SHOWFOCUS_Condition;
	information = PC_Thief_SHOWFOCUS_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_SHOWFOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,PC_Thief_MEETAGAIN) && (Npc_GetDistToWP(self,"LOCATION_12_01") < 1000))
	{
		return TRUE;
	};
};

func void PC_Thief_SHOWFOCUS_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_01");	//Na levé straně kaňonu je vchod  do jeskyně, odkud vede cesta k ohnisku.
	AI_Output(hero,self,"PC_Thief_SHOWFOCUS_Info_15_02");	//Dobře. Nejdřív se ale musíme zbavit těch příšer, které se tam kolem potulují.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_03");	//Zkus najít slabé místo trola. Nebo nějaký jiný způsob, jak ho porazit.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_04");	//Upoutám jeho pozornost.
	B_LogEntry(CH3_TrollCanyon,"Narazili jsme na obrovského Trola, který nám stojí v cestě. Diego ho rozptýlí a já musím najít způsob, jak porazit trola.");
	Npc_ExchangeRoutine(self,"WaitAtWheel");
	AI_DrawWeapon(self);
	AI_StopProcessInfos(self);
};

instance PC_Thief_AFTERTROLL(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_AFTERTROLL_Condition;
	information = PC_Thief_AFTERTROLL_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_AFTERTROLL_Condition()
{
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self,Troll,NOFUNC,-1);
	if(Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS) && ((trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink))) || (Npc_GetDistToWP(hero,"LOCATION_12_14_WHEEL") < 1000)))
	{
		return TRUE;
	};
};

func void PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_01");	//To bylo fantastické. Jsi opravdu dobrý. A teď si pojď vzít to ohnisko.
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_02");	//Ujistím se, že nás tu nečeká žádné nepříjemné překvapení.
	B_LogEntry(CH3_TrollCanyon,"Trol byl poražen. Teď vidím naviják, který spouští mříž na ohniskovou plošinu.");
	AI_StopProcessInfos(self);
};

instance PC_Thief_WHEEL(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_WHEEL_Condition;
	information = PC_Thief_WHEEL_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_WHEEL_Condition()
{
	if(Npc_KnowsInfo(hero,PC_Thief_AFTERTROLL) && (Troll_Wheel == 1))
	{
		return TRUE;
	};
};

func void PC_Thief_WHEEL_Info()
{
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_01");	//Ten naviják se asi zasekl.
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_02");	//Já se na to podívám, třeba se mi ho podaří opravit!
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"LOCATION_12_14_WHEEL");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
};

instance PC_Thief_FIXWHEEL(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_FIXWHEEL_Condition;
	information = PC_Thief_FIXWHEEL_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_FIXWHEEL_Condition()
{
	if(Npc_KnowsInfo(hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};

func void PC_Thief_FIXWHEEL_Info()
{
	AI_Output(self,hero,"PC_Thief_FIXWHEEL_Info_11_01");	//Dobrý, teď by měl pracovat.
	Troll_Wheel = 2;
	B_LogEntry(CH3_TrollCanyon,"Diego opravil porouchaný naviják. Teď už nám nic nestojí v cestě.");
	Npc_ExchangeRoutine(self,"WaitAtFocus");
	AI_StopProcessInfos(self);
};

instance PC_Thief_WAITATFOCUS(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_WAITATFOCUS_Condition;
	information = PC_Thief_WAITATFOCUS_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_WAITATFOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL) && (Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000))
	{
		return TRUE;
	};
};

func void PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_WAITATFOCUS_Info_11_01");	//Vezmi to ohnisko a já na tebe počkám tady!
	AI_StopProcessInfos(self);
};

instance PC_Thief_GOTIT(C_Info)
{
	npc = PC_Thief;
	condition = PC_Thief_GOTIT_Condition;
	information = PC_Thief_GOTIT_Info;
	important = 1;
	permanent = 0;
};

func int PC_Thief_GOTIT_Condition()
{
	if(Npc_HasItems(hero,Focus_2))
	{
		return TRUE;
	};
};

func void PC_Thief_GOTIT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_01");	//Našel jsi to ohnisko. Výborně.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_02");	//Myslím, že je čas zastavit se zase ve Starém táboře. Hodně štěstí.
	AI_Output(hero,self,"PC_Thief_GOTIT_Info_15_03");	//Koukej, abys zůstal naživu!
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_04");	//Ještě se uvidíme.
	B_LogEntry(CH3_TrollCanyon,"Ohnisko je mé. Musím však ještě domluvit několika harpyjím, aby mě jej nechaly sebrat.");
	B_LogEntry(CH3_TrollCanyon,"Diego se vrací do Starého tábora. Jsem si jistý, že se s ním opět shledám.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
};

instance Info_Diego_OCWARN(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCWARN_Condition;
	information = Info_Diego_OCWARN_Info;
	important = 1;
	permanent = 0;
};

func int Info_Diego_OCWARN_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Diego_OCWARN_11_01");	//Hej... Psss... Buď tiše!
	if(Npc_KnowsInfo(hero,Info_Milten_OCWARN))
	{
		AI_Output(hero,self,"Info_Diego_OCWARN_15_02");	//Nazdar, Diego, už jsem mluvil s Miltenem na druhém konci tábora!
		AI_Output(self,hero,"Info_Diego_OCWARN_11_03");	//Dobře, tak už víš, co se stalo.
		AI_Output(self,hero,"Info_Diego_OCWARN_11_04");	//Ale slyšel jsi také o plánovaném útoku na Svobodný důl?
	}
	else
	{
		AI_Output(hero,self,"Info_Diego_OCWARN_15_05");	//Nazdar, Diego, co má znamenat ta hra na schovávanou?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_06");	//Tys to ještě neslyšel?
		AI_Output(hero,self,"Info_Diego_OCWARN_15_07");	//Neslyšel co?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_08");	//Starý důl je zatopený, mágové Ohně byli zavražděni a očekává se útok na Svobodný důl.
		AI_Output(hero,self,"Info_Diego_OCWARN_15_09");	//COOŽŽEE???? Co to říkáš?
	};
};

instance Info_Diego_OCMINE(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCMINE_Condition;
	information = Info_Diego_OCMINE_Info;
	important = 0;
	permanent = 0;
	description = "Jak mohl být Starý důl zaplaven?";
};

func int Info_Diego_OCMINE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCWARN))
	{
		return TRUE;
	};
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output(hero,self,"Info_Diego_OCMINE_15_01");	//Jak mohl být Starý důl zaplaven?
	AI_Output(self,hero,"Info_Diego_OCMINE_11_02");	//Jeden z kopáčů, který přežil, nám řekl, že když kopali, narazili na dně na podzemní řeku.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_03");	//Když se voda navalila do dolu, jeden z jeho pilířů se zlomil a celá horní sekce se zhroutila.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_04");	//Jen hrstce lidí se podařilo z dolu uniknout.
};

instance Info_Diego_OCKDF(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCKDF_Condition;
	information = Info_Diego_OCKDF_Info;
	important = 0;
	permanent = 0;
	description = "Proč zemřeli mágové?";
};

func int Info_Diego_OCKDF_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCFM))
	{
		return TRUE;
	};
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output(hero,self,"Info_Diego_OCKDF_15_01");	//Proč zemřeli mágové?
	AI_Output(self,hero,"Info_Diego_OCKDF_11_02");	//To je dlouhý příběh.
};

instance Info_Diego_OCFM(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCFM_Condition;
	information = Info_Diego_OCFM_Info;
	important = 0;
	permanent = 0;
	description = "Útok na Svobodný důl?";
};

func int Info_Diego_OCFM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCWARN) && !Npc_KnowsInfo(hero,Info_Diego_OCKDF))
	{
		return TRUE;
	};
};

func void Info_Diego_OCFM_Info()
{
	AI_Output(hero,self,"Info_Diego_OCFM_15_01");	//Útok na Svobodný důl?
	AI_Output(self,hero,"Info_Diego_OCFM_11_02");	//To je dlouhý příběh.
};

instance Info_Diego_OCSTORY(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCSTORY_Condition;
	information = Info_Diego_OCSTORY_Info;
	important = 0;
	permanent = 0;
	description = "Jen mi o tom řekni! ";
};

func int Info_Diego_OCSTORY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCFM) || Npc_KnowsInfo(hero,Info_Diego_OCKDF))
	{
		return TRUE;
	};
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_01");	//Jen mi o tom řekni! Nebude to první dlouhý příběh, který vyslechnu!
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_02");	//Dobrá. Když jsme dostali zprávu o zatopení dolu, byl jsem naštěstí doma u Rudobaronů.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_03");	//Gomez vyskakoval jako šílený, když se doslechl o tom neštěstí a začal se obávat, že bude jeho postavení ohroženo.
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_04");	//Samozřejmě. Kdo řídí obchod s rudou, ovládá kolonii!
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_05");	//To je pravda. Protože už neměl žádný zdroj příjmů, zboží z vnějšího světa už nebylo za co nakupovat.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_06");	//Nikdo už pro něj nebude pracovat, pokud brzy nenajde jiný zdroj příjmů.
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_07");	//A to je ten důvod útoku na Svobodný důl?
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_08");	//Popravdě řečeno - je to jediná  Gomezova šance, jak si zachovat svou moc.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_09");	//Před dvěma hodinami obsadily dva tucty strážců Svobodný důl.
	B_Story_FMTaken();
};

instance Info_Diego_OCWARNNC(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCWARNNC_Condition;
	information = Info_Diego_OCWARNNC_Info;
	important = 0;
	permanent = 0;
	description = "To je šílené! Musím varovat Nový tábor.";
};

func int Info_Diego_OCWARNNC_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return TRUE;
	};
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_01");	//To je šílené! Musím varovat Nový tábor.
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_02");	//Pak si musíš pospíšit! Už téměř dorazili ke Svobodnému dolu!
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_03");	//Nikdy se ale nedostanou přes opevnění Nového tábora.
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_04");	//Nepotřebují se přes něj dostat. Před pár měsíci našli průchod horami přímo ke Svobodnému dolu, který nikdo jiný neznal.
};

instance Info_Diego_OCGUARDS(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCGUARDS_Condition;
	information = Info_Diego_OCGUARDS_Info;
	important = 0;
	permanent = 0;
	description = "Viděl jsem stráže před zamčenou bránou.";
};

func int Info_Diego_OCGUARDS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return TRUE;
	};
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output(hero,self,"Info_Diego_OCGUARDS_15_01");	//Viděl jsem stráže před zamčenou bránou.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_02");	//Drž se odtamtud dál. Napadnou každého, kdo se přiblíží k táboru.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_03");	//Mají strach, že se jim někdo pomstí za útok na Svobodný důl.
};

instance Info_Diego_OCMURDER(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCMURDER_Condition;
	information = Info_Diego_OCMURDER_Info;
	important = 0;
	permanent = 0;
	description = "Co se ale stalo mágům Ohně?";
};

func int Info_Diego_OCMURDER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCSTORY))
	{
		return TRUE;
	};
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_01");	//Co se ale stalo mágům Ohně?
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_02");	//Corristo a ostatní mágové byli jediní lidé v táboře, kteří zůstali při smyslech.
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_03");	//Zakázali útok a požadovali vyrovnání mezi oběma tábory.
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_04");	//Oni ZAKÁZALI Gomezovi zaútočit na Svobodný důl?
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_05");	//Přesně tak. Corristo a ostatní si neměli být tak sebejistí. Gomez jim přestal důvěřovat, a tak je nechal sprostě zavraždit.
};

instance Info_Diego_OCRETREAT(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCRETREAT_Condition;
	information = Info_Diego_OCRETREAT_Info;
	important = 0;
	permanent = 0;
	description = "Co teď budete s Miltenem dělat?";
};

func int Info_Diego_OCRETREAT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCMURDER))
	{
		return TRUE;
	};
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output(hero,self,"Info_Diego_OCRETREAT_15_01");	//Co teď budete s Miltenem dělat?
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_02");	//Nějaký čas tady zůstaneme a budeme varovat další přátele, aby nevběhli přímo do náručí strážím.
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_03");	//Mohl bys nám ale prokázat laskavost.
};

instance Info_Diego_OCFAVOR(C_Info)
{
	npc = PC_Thief;
	condition = Info_Diego_OCFAVOR_Condition;
	information = Info_Diego_OCFAVOR_Info;
	important = 0;
	permanent = 0;
	description = "Rozhodně ano. Řekni, co ode mě chceš!";
};

func int Info_Diego_OCFAVOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCRETREAT))
	{
		return TRUE;
	};
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_01");	//Rozhodně ano. Řekni, co ode mě chceš!
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_02");	//Zajdi za Lesterem a Gornem. Musí se dozvědět, co se tu stalo.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_03");	//Řekni jim, že se všichni čtyři sejdeme na obvyklém místě.
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_04");	//Jestli je uvidím dřív než vy, budu je varovat a pošlu je na to místo.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_05");	//Díky, příteli. Jsi opravdu správnej chlap. Teď běž, sejdeme se později.
	Log_CreateTopic(CH4_4Friends,LOG_MISSION);
	Log_SetTopicStatus(CH4_4Friends,LOG_RUNNING);
	B_LogEntry(CH4_4Friends,"Všichni mágové Ohně jsou mrtví a situace se vymkla z rukou. Diego chtěl, abych se s Lesterem a Gornem domluvil na nějakém bezpečném místě setkání s ním a Miltenem. Zdá se, že to nedělají poprvé!");
};

instance INFO_DIEGO_MüNZEN(C_Info)
{
	npc = PC_Thief;
	nr = 4;
	condition = info_diego_münzen_condition;
	information = info_diego_münzen_info;
	permanent = 0;
	description = "Slyšel jsem, že sbíráš staré mince?";
};

func int info_diego_münzen_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_Waffe))
	{
		return TRUE;
	};
};

func void info_diego_münzen_info()
{
	AI_Output(hero,self,"Info_Diego_Münzen_15_00");	//Slyšel jsem, že sbíráš staré mince?
	AI_Output(self,hero,"Info_Diego_Münzen_11_01");	//Ano. Od koho jsi to slyšel?
	AI_Output(self,hero,"Info_Diego_Münzen_11_02");	//Ale, na tom nezáleží. Pokud nějaké najdeš, klidně mi je přines.
	AI_Output(self,hero,"Info_Diego_Münzen_11_03");	//Nebude to zadarmo, za každou ti dám 1 kus magické rudy.
	AI_Output(self,hero,"Info_Diego_Münzen_11_04");	//Dohoda?
	Info_ClearChoices(info_diego_münzen);
	Info_AddChoice(info_diego_münzen,"Dohoda.",info_diego_münzen_okay);
	Info_AddChoice(info_diego_münzen,"Chci víc.",info_diego_münzen_mehr);
};

func void info_diego_münzen_okay()
{
	AI_Output(hero,self,"Info_Diego_OKAY_15_00");	//Dohoda.
	AI_Output(self,hero,"Info_Diego_OKAY_11_01");	//Dobře. Přines mi všechny staré mince, které najdeš.
	AI_Output(self,hero,"Info_Diego_OKAY_11_02");	//Pamatuj za každou minci ti dám 1 kus rudy.
	Info_ClearChoices(info_diego_münzen);
};

func void info_diego_münzen_mehr()
{
	AI_Output(hero,self,"Info_Diego_MEHR_15_00");	//Chci víc.
	AI_Output(self,hero,"Info_Diego_MEHR_11_00");	//Nemůžu ti dát víc.
	AI_Output(self,hero,"Info_Diego_MEHR_11_01");	//Mince tady v Kolonii nemají žádnou hodnotu.
	AI_Output(hero,self,"Info_Diego_MEHR_11_02");	//Dobře, tak tedy platí.
	AI_Output(self,hero,"Info_Diego_MEHR_11_03");	//Dobře. Přines mi všechny staré mince, které najdeš.
	AI_Output(self,hero,"Info_Diego_MEHR_11_04");	//Pamatuj za každou minci ti dám 1 kus rudy.
	Info_ClearChoices(info_diego_münzen);
};

var int player_muenzen;
var int player_muenzen_2;
var int xp_playermuenzen;
var int xp_standart;

instance INFO_DIEGO_MüNZENABGEBEN(C_Info)
{
	npc = PC_Thief;
	condition = info_diego_münzenabgeben_condition;
	information = info_diego_münzenabgeben_info;
	important = 0;
	permanent = 1;
	description = "Tady jsem posbíral několik mincí.";
};

func int info_diego_münzenabgeben_condition()
{
	if(((Npc_HasItems(hero,ItMi_Stuff_OldCoin_01) >= 1) || (Npc_HasItems(hero,ItMi_Stuff_OldCoin_02) >= 1)) && Npc_KnowsInfo(hero,info_diego_münzen))
	{
		return TRUE;
	};
};

func void info_diego_münzenabgeben_info()
{
	AI_Output(hero,self,"Info_Diego_MünzenAbgeben_16_01");	//Tady jsem posbíral několik mincí.
	AI_Output(self,hero,"Info_Diego_MünzenAbgeben_12_02");	//Dobrá práce. Dej mi je.
	XP_STANDART = 1;
	PLAYER_MUENZEN = Npc_HasItems(hero,ItMi_Stuff_OldCoin_01);
	PLAYER_MUENZEN_2 = Npc_HasItems(hero,ItMi_Stuff_OldCoin_02);
	XP_PLAYERMUENZEN = (PLAYER_MUENZEN + PLAYER_MUENZEN_2) * XP_STANDART;

	//BUG [Fawkes]: pridane podmienky na presuny/odstranenie a vytvorenie itemov
	/*
	B_GiveInvItems(other,self,ItMi_Stuff_OldCoin_01,Npc_HasItems(other,ItMi_Stuff_OldCoin_01));
	B_GiveInvItems(other,self,ItMi_Stuff_OldCoin_02,Npc_HasItems(other,ItMi_Stuff_OldCoin_02));
	Npc_RemoveInvItem(self,ItMi_Stuff_OldCoin_01);
	Npc_RemoveInvItem(self,ItMi_Stuff_OldCoin_02);
	AI_Output(self,hero,"Info_Diego_MünzenAbgeben_12_03");	//Takže, jak bylo dohodnuto, za každou minci 1 kus rudy.
	CreateInvItems(self,ItMiNugget,PLAYER_MUENZEN);
	B_GiveInvItems(self,other,ItMiNugget,PLAYER_MUENZEN);
	CreateInvItems(self,ItMiNugget,PLAYER_MUENZEN_2);
	B_GiveInvItems(self,other,ItMiNugget,PLAYER_MUENZEN_2);
	*/
	if (PLAYER_MUENZEN) {
		B_GiveInvItems(other,self,ItMi_Stuff_OldCoin_01,PLAYER_MUENZEN);
		Npc_RemoveInvItems(self,ItMi_Stuff_OldCoin_01,PLAYER_MUENZEN);
	};

	if (PLAYER_MUENZEN_2) {
		B_GiveInvItems(other,self,ItMi_Stuff_OldCoin_02,PLAYER_MUENZEN_2);
		Npc_RemoveInvItems(self,ItMi_Stuff_OldCoin_02,PLAYER_MUENZEN_2);
	};

	AI_Output(self,hero,"Info_Diego_MünzenAbgeben_12_03");	//Takže, jak bylo dohodnuto, za každou minci 1 kus rudy.

	CreateInvItems(self,ItMiNugget,PLAYER_MUENZEN + PLAYER_MUENZEN_2);
	B_GiveInvItems(self,other,ItMiNugget,PLAYER_MUENZEN + PLAYER_MUENZEN_2);

	B_GiveXP(XP_PLAYERMUENZEN);
	AI_Output(self,hero,"Info_Diego_MünzenAbgeben_12_04");	//Pokud najdeš další, víš kde je můžeš zpeněžit.
};

instance DIA_THIEF_SCBARON(C_Info)
{
	npc = PC_Thief;
	nr = 3;
	condition = dia_thief_scbaron_condition;
	information = dia_thief_scbaron_info;
	permanent = 0;
	important = 1;
};

func int dia_thief_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_thief_scbaron_info()
{
	AI_Output(self,other,"DIA_Thief_SCBARON_15_00");	//Neříkej, že teď patříš mezi Rudobarony?
	AI_Output(self,other,"DIA_Thief_SCBARON_15_01");	//Hehe. Vypadáš jako jeden z nich.
	AI_StopProcessInfos(self);
};

