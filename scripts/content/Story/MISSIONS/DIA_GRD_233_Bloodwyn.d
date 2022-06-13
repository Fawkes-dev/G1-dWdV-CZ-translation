instance Info_Bloodwyn_EXIT_Schutzgeld(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 999;
	condition = Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information = Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

func void Info_Bloodwyn_EXIT_Schutzgeld_Info()
{
	AI_Output(other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00");	//Ještě se uvidíme.
	if(Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01");	//Dej na sebe pozor, chlapče.
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02");	//Tady v táboře se ničím neznepokojuj. Dohlédneme na tebe.
	};
	AI_StopProcessInfos(self);
};

instance Info_Bloodwyn_Hello(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_Hello_Condition;
	information = Info_Bloodwyn_Hello_Info;
	permanent = 0;
	important = 1;
};

func int Info_Bloodwyn_Hello_Condition()
{
	if((Kapitel <= 2) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Bloodwyn_Hello_Info()
{
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_00");	//Hej, ty!
	AI_Output(other,self,"Info_Bloodwyn_Hello_15_01");	//To mluvíš se mnou?
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_02");	//Varuju tě! Lidi jako ty se tady dostanou do problémů razdva!
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_03");	//A většina chlapů, se kterými se tu setkáš, jsou bastardi!
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_04");	//Myslí si, že si s tebou můžou dělat, co je napadne. Ale my jim to nedovolíme.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_05");	//Gomez chce, aby byl v táboře klid, a tak ho my, stráže, zajišťujeme. Je to ale práce, která není nijak laciná.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_06");	//To je důvod, proč ti říkám o pár nugetů. Ber to jako jakýsi projev přátelství. Ty pomůžeš nám, my pomůžeme tobě. Když se dostaneš do maléru, my tě z něj vytáhneme.
	Info_ClearChoices(Info_Bloodwyn_Hello);
	Info_AddChoice(Info_Bloodwyn_Hello,"Proč ne? Kolik nugetů máš na mysli?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice(Info_Bloodwyn_Hello,"Chceš, abych zaplatil peníze za ochranu? Postarám se o sebe sám!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice(Info_Bloodwyn_Hello,"To má být pohrůžka?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output(other,self,"Info_Bloodwyn_ForgetIt_15_00");	//Myslíš, že ti mám zaplatit za ochranu? Ne, díky, postarám se o sebe sám!
	AI_Output(self,other,"Info_Bloodwyn_ForgetIt_08_01");	//Dělej, jak myslíš, hochu. Brzy budeš litovat, že jsi tuhle přátelskou nabídku odmítl!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
	AI_StopProcessInfos(self);
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output(other,self,"Info_Bloodwyn_SollDrohungSein_15_00");	//To má být pohrůžka?
	AI_Output(self,other,"Info_Bloodwyn_SollDrohungSein_08_01");	//Naopak! Přátelská nabídka!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_HowMuch_15_01");	//Proč ne? Kolik nugetů máš na mysli?
	AI_Output(self,other,"Info_Bloodwyn_Hello_HowMuch_08_02");	//Ne moc. 10 nugetů, víc nepotřebuju.
	Info_ClearChoices(Info_Bloodwyn_Hello);
	Info_AddChoice(Info_Bloodwyn_Hello,"Nemám 10 nugetů.",Info_Bloodwyn_Hello_NotNow);
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		Info_AddChoice(Info_Bloodwyn_Hello,"Tady je tvoje ruda. Jeden či dva přátelé se vždycky můžou hodit.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};

func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_OkTakeIt_15_00");	//Tady jsou. Přítele nebo dva můžu vždycky potřebovat.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_01");	//Vypadá to, že jsi rozumný mladík. Od teďka tě budeme ochraňovat.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_02");	//Tím jsem ale neřekl, že si tu můžeš dělat, co se ti zlíbí, jasný?
	B_GiveInvItems(other,self,ItMiNugget,10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00");	//Nemám 10 nugetů.
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_01");	//Pak dej, co máš - to bude stačit. Zbytek mi můžeš dát, až se uvidíme příště.
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_02");	//Ještě se uvidíme...
	if(Npc_HasItems(other,ItMiNugget) > 0)
	{
		if(Npc_HasItems(other,ItMiNugget) > 9)
		{
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00");	//Podívej se na to. Vypadá snad jako někdo, kdo nemůže zaplatit 10 nugetů, co?
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01");	//Vezmu si všechno, co máš. To mi pomůže zapomenout, žes mi lhal.
		}
		else
		{
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00");	//Vezmu si také malý dárek. Dobrá vůle se počítá. Díky za ty nugety, hochu!
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01");	//Od teďka budu na tebe dávat pozor po celou dobu, co budeš v táboře.
		};
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00");	//Hm, opravdu nic nemáš. Dobrá, tak řekněme, že příště...
	};

	//BUG [Fawkes]: pridana kontrola pre pocet ItMiNugget - presun rudy sa uskutocni iba ak hrac ma min. 1 ks rudy
	//B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
	if(Npc_HasItems(other,ItMiNugget) > 0) {
		B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
	};

	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
};

instance Info_Bloodwyn_PayDay(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_PayDay_Condition;
	information = Info_Bloodwyn_PayDay_Info;
	permanent = 1;
	important = 1;
};

func int Info_Bloodwyn_PayDay_Condition()
{
	if((Kapitel <= 2) && (Bloodwyn_PayDay <= (Wld_GetDay() - 1)) && (Npc_HasItems(other,ItMiNugget) >= 10) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Bloodwyn_PayDay_Info()
{
	if(Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_00");	//Á, dobře, že tě vidím, příteli!
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_01");	//Co tvůj denní příspěvek? Dlužíš 10 nugetů, však víš.
		Info_ClearChoices(Info_Bloodwyn_PayDay);
		Info_AddChoice(Info_Bloodwyn_PayDay,"Tady jsou. 10 nugetů není mezi přáteli mnoho.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice(Info_Bloodwyn_PayDay,"Nezaplatím - už jste ze mě vytáhli dost.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if(Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_00");	//Hej, ty!
		AI_Output(other,self,"Info_Bloodwyn_PayDay_Den_15_01");	//No, co?
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_02");	//Máš novou příležitost dokázat, že jsi opravdový přítel.
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_03");	//Jen 10 nugetů a můžeš dovnitř - co ty na to?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayAgain_15_00");	//Tady jsou. 10 nugetů není mezi přáteli mnoho.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayAgain_08_01");	//Moje slova!
	B_GiveInvItems(other,self,ItMiNugget,10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Info_ClearChoices(Info_Bloodwyn_PayDay);
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_00");	//Nezaplatím - už jste ze mě vytáhli dost.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_01");	//Zklamal jsem se v tobě! Takže už nejsme přátelé. Uvidíš, že jsi udělal chybu a okradl sám sebe!
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_02");	//Neměj obavy, postarám se o sebe docela dobře sám.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_03");	//Dobrá, uvidíme...
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(Info_Bloodwyn_PayDay);
	AI_StopProcessInfos(self);
};

instance Info_Bloodwyn_Doch(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_Doch_Condition;
	information = Info_Bloodwyn_Doch_Info;
	permanent = 1;
	description = "Rozmyslel jsem se. Přece jen ti těch 10 nugetů dám.";
};

func int Info_Bloodwyn_Doch_Condition()
{
	if((Bloodwyn_ProtectionPaid == FALSE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Bloodwyn_Doch_Info()
{
	AI_Output(other,self,"Info_Bloodwyn_Doch_15_00");	//Rozmyslel jsem se. Přece jen ti těch 10 nugetů dám.
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_01");	//Konečně! Vidíš, že se UMÍŠ dobře rozhodnout!
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_02");	//A od teďka mi budeš platit denní příspěvek, jasný?
		B_GiveInvItems(other,self,ItMiNugget,10);
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_Doch_NoOre_08_00");	//Tak přijď, až budeš mít.
		AI_StopProcessInfos(self);
	};
};

instance Info_Bloodwyn_PayForJesse(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 5;
	condition = Info_Bloodwyn_PayForJesse_Condition;
	information = Info_Bloodwyn_PayForJesse_Info;
	permanent = 1;
	description = "Jesse mě poslal, abych za něj zaplatil 10 nugetů.";
};

func int Info_Bloodwyn_PayForJesse_Condition()
{
	if(Jesse_PayForMe == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Bloodwyn_PayForJesse_Info()
{
	AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_00");	//Jesse mě poslal, abych za něj zaplatil 10 nugetů.
	if(Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_01");	//Měl bys raději zaplatit SVÝCH 10 nugetů.
	};
	AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_02");	//O Jesseho se nestarej. Je to ztroskotanec a stejně tu už dlouho nezůstane.
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_03");	//Ne - platím za něj. Tak vem si těch 10 nugetů a nech ho na pokoji!
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_04");	//Dobrá, člověče, když tedy myslíš.
		Jesse_PayForMe = LOG_SUCCESS;
		B_GiveInvItems(other,self,ItMiNugget,10);
		B_LogEntry(CH1_JESSE,"Zaplatil jsem Bloodwynovi 10 nugetů za Jesseho. Řekl mi ať si hledím placení SVÝCH závazků.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_05");	//Och! Vypadá to, že u sebe tolik nemám.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_06");	//To je znamení, příteli! Ještě se rozmysli! Platit za toho pobudu je vyhazování peněz!
	};
};

instance GRD_233_Bloodwyn_WELCOME(C_Info)
{
	npc = GRD_233_Bloodwyn;
	condition = GRD_233_Bloodwyn_WELCOME_Condition;
	information = GRD_233_Bloodwyn_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int GRD_233_Bloodwyn_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output(self,other,"GRD_233_Bloodwyn_WELCOME_Info_08_01");	//Jsi jedním z nás. Dobrá práce. Stráže potřebují muže jako jsi ty!
	AI_StopProcessInfos(self);
};

instance GRD_233_BLOODWYN_GETOUT(C_Info)
{
	npc = GRD_233_Bloodwyn;
	condition = grd_233_bloodwyn_getout_condition;
	information = grd_233_bloodwyn_getout_info;
	important = 1;
	permanent = 0;
};

func int grd_233_bloodwyn_getout_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void grd_233_bloodwyn_getout_info()
{
	AI_Output(self,other,"GRD_233_Bloodwyn_GETOUT_Info_08_01");	//Někdo jako ty mohl dojít daleko ... místo toho jsi se přidal k rýžožroutům z Nového tábora. Vypadni!
	AI_StopProcessInfos(self);
};

instance Info_Bloodwyn_DIE(C_Info)
{
	npc = GRD_233_Bloodwyn;
	condition = Info_Bloodwyn_DIE_Condition;
	information = Info_Bloodwyn_DIE_Info;
	permanent = 0;
	important = 1;
};

func int Info_Bloodwyn_DIE_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc(self,hero);
	if((oldHeroGuild == GIL_STT) || (oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		if(oldHeroGuild == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01");	//Mezi námi je zrádce! PCHÁ! A my jsme tě nazvali strážcem!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02");	//Vypadá to, jako bysme přehlídli jednoho z těch vzbouřených mágů Ohně!
		}
		else if(oldHeroGuild == GIL_EBR)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_09_03");	//A ty jsi se kdysi nazýval Rudobaronem. HA!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03");	//To Stín nás zradil!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_04");	//Počkej. O čem jsi to mluvil, Bloodwyne?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05");	//Tak ty jsi ve spolčení s Novým táborem, jo?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06");	//Ne, počkej, pořád jsem...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07");	//Asi sis myslel, že ti to bude procházet věčně.
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08");	//Přestaň s tím nesmyslem...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09");	//Zrádce jako ty musí zemřít.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10");	//SMRT ZRÁDCI!!!
		if(Npc_KnowsInfo(hero,Info_Fletcher_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"Fletcher, který teď střeží hlavní bránu, se zachoval stejně jako Bloodwyn u zadní brány. Nevím sice jak, ale musí to nějak souviset s mým hledáním ohniska pro Nový tábor.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Bloodwyn, který se skupinou vojáků střeží zadní bránu Starého tábora, mě nazval zrádcem a odpadlíkem. Ani mě nevyslechl a zaútočil na mě!");
			B_LogEntry(CH4_BannedFromOC,"Vypadá to, že jsem vyhoštěn ze Starého tábora.");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11");	//Tak ty ses odvážil opustit Nový tábor? To byl hodně stupidní nápad!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12");	//Och, tak ty ses odvážil opustit tábor u bažin? To byl hodně stupidní nápad!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13");	//Co? Co máš na mysli?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14");	//Neslyšel jsi o napadení vašeho dolu?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15");	//Co...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16");	//Je nám líto, ale nemůžeme tě nechat pouštět si takhle hubu na špacír!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17");	//Hej, nechci žádné problémy...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18");	//Na to's měl myslet dřív!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19");	//Poslyš, už toho mám dost...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20");	//I já! ZABIJTE HO!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	B_ExchangeRoutine(GRD_232_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_229_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_216_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_217_Torwache,"FMTaken2");
	B_SetPermAttitude(GRD_233_Bloodwyn,ATT_HOSTILE);
	B_SetPermAttitude(GRD_232_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_229_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_216_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_217_Torwache,ATT_HOSTILE);
	if(!Npc_KnowsInfo(hero,Info_Fletcher_DIE))
	{
		B_LogEntry(CH4_Firemages,"Brány Starého tábora jsou nyní uzavřeny a hlídány strážemi. Napadají každého, kdo se přiblíží k táboru.");
	};
	AI_StopProcessInfos(self);
};

