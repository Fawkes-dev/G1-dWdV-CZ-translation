instance DIA_Aidan_Exit(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 999;
	condition = DIA_Aidan_Exit_Condition;
	information = DIA_Aidan_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Aidan_Exit_Condition()
{
	return 1;
};

func void DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Aidan_Hello(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = DIA_Aidan_Hello_Condition;
	information = DIA_Aidan_Hello_Info;
	permanent = 0;
	description = "Co tady děláš?";
};

func int DIA_Aidan_Hello_Condition()
{
	return 1;
};

func void DIA_Aidan_Hello_Info()
{
	AI_Output(other,self,"DIA_Aidan_Hello_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Aidan_Hello_13_01");	//Jsem lovec. Žiju z prodeje kůží a zubů.
	AI_Output(other,self,"DIA_Aidan_Hello_15_02");	//Platí se za to?
	AI_Output(self,other,"DIA_Aidan_Hello_13_03");	//Když víš, jak správně ty bestie rozřezat, tak jo.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Adan, lovec žijící na cestě mezi Starým a Novým táborem, mě může naučit kuchat zvěř.");
};

instance Org_859_Aidan_Creatures(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = Org_859_Aidan_Creatures_Condition;
	information = Org_859_Aidan_Creatures_Info;
	permanent = 1;
	description = "Chci se naučit rozřezávat zvěř.";
};

func int Org_859_Aidan_Creatures_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Aidan_Hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void Org_859_Aidan_Creatures_Info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//Chci se naučit rozřezávat zvěř.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01");	//Co chceš vědět?
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice(Org_859_Aidan_Creatures,DIALOG_BACK,Org_859_Aidan_Creatures_BACK);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Vyjmout zuby (cena: 1 VB, 50 nugetů)",Org_859_Aidan_Creatures_Zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Stáhnout kožešinu (cena:1 VB, 100 nugetů)",Org_859_Aidan_Creatures_Fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Vyjmout drápy (cena: 1 VB, 50 nugetů)",Org_859_Aidan_Creatures_Kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Stáhnout plaza (cena: 1 VB, 100 nugetů)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Naučil jsem tě všechno, co vím.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00");	//Jak dostanu zuby?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Naučil ses: Odebírání zubů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01");	//Nejdůležitější je zajistit, aby se zuby netříštily. Tomu se vyhneš tak, že vložíš nůž blízko středu zubu a opatrně ho vypáčíš.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02");	//Tak si můžeš vzít zuby vlků, stínových příšer a kousavců.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Odebírání zubů - Vlk, Skřetí pes, Chňapavec, Kousavec, Lovecký pes, Stínová šelma");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00");	//Jak dostanu kůži těch příšer?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Naučil ses: Stahování kožešiny",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01");	//Důležité je kůži stahovat zezadu dopředu. Jakmile se ti napne, už je to snadné. Kožešiny se velmi cení!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02");	//Kůže vlků a stínových příšer se můžou použít na oděv. Když prohlídneš kožešinu zabitého zvířete, hned poznáš, jestli ji půjde použít nebo ne.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Stahování kožešiny - Vlk, Skřetí pes, Stínová šelma, Troll");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Naučil ses: Odebírání drápů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00");	//Ukaž mi, jak dostanu drápy!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01");	//Je to v podstatě velmi jednoduché, pokud víš jak na to. Ohneš drápy dopředu - nikdy ne dozadu - ale NESMÍŠ je vytahovat!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02");	//Drápy můžeš dostat hlavně z ještěrek. Teď už víš, jak vzít z příšer drápy.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Odebírání drápů - Ještěrka, Chňapavec, Číhavec, Kousavec, Břitva");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Naučil ses: Stahování plazí kůže",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00");	//Na co musím dávat pozor, když stahuji plazí kůži?
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01");	//Jediní plazi, kteří jsou k tomuhle účelu vhodní, jsou číhavci a močáloví žraloci.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02");	//Když nařízneš kůži po stranách, sloupne se sama. Teď už bys měl umět stahovat plazy.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Stahování plazů - Číhavec, Močálový žralok");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};

instance DIA_AIDAN_BLACKWOLF(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = dia_aidan_blackwolf_condition;
	information = dia_aidan_blackwolf_info;
	permanent = 0;
	description = "Podívej co tady mám.";
};

func int dia_aidan_blackwolf_condition()
{
	if((HUNT_WOLF == LOG_RUNNING) && Npc_HasItems(hero,itat_blackwolf_01))
	{
		return TRUE;
	};
};

func void dia_aidan_blackwolf_info()
{
	AI_Output(other,self,"DIA_Aidan_BlackWolf_15_00");	//Hele co pro tebe mám.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_01");	//Co ... Copak je to za kožešinu?
	AI_Output(other,self,"DIA_Aidan_BlackWolf_13_02");	//Stáhnul jsem ji z Černého vlka.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_03");	//Z Černého vlka? Člověče, jsem opravdu ohromen.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_04");	//Je to už věčnost co jsem naposledy viděl toho parchanta!
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_05");	//Před lety, když byl založen Nový Tábor, zde byla skupina lovců.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_06");	//Správní chlapi, zkušení lovci kteří  věděli, jak přežít v divočině. 
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_07");	//Tehdy se objevila pověst o černém vlku, který se objevoval v lese na východní straně Kolonie. 
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_08");	//Když to lovci uslyšeli, okamžitě vyrazili na lov. Byl jsem také lovec ale nebyl jsem tehdy dost zkušený abych šel s nimy.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_09");	//... jak se později ukázalo, bylo to moje štěstí.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_10");	//Týdny plynuly a lovci se občas vraceli aby doplnili zásoby. Až jednou … se už nikdy nevrátili!
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_11");	//Pravděpodobně vystopovali vlka, ale nedokázali jej zabít. 
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_12");	//Tehdy, bych za ni zaplatil spoustu rudy …
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_13");	//Nicméně teď ti nemůžu dát rudu. Mám sotva dost pro sebe.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_14");	//Ale mohu ti nabídnout jinou odměnu.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_15");	//Tento luk patřil vůdci lovecké skupiny. Našel jsem ho na východních útesech.  
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_16");	//jsem si jist, že ty jej dobře využiješ. Marus by byl určitě rád že luk obdrží zkušený lovec, jako ty.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_17");	//Ještě jednou, děkuji za to cos udělal!
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_18");	//Uvidíme se na lovu!
	HUNT_WOLF = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_BLACKWOLF,LOG_SUCCESS);
	B_LogEntry(CH1_BLACKWOLF,"Na Aidana udělalo velký dojem, že jsem zabil černého vlka, kterého se snažil tak dlouho ulovit. Vyprávěl mi o tom, jak skupina lovců přede mnou stopovala toho samého vlka po Kolonii. Ale nikdy se nevrátili. Pravděpodobně ten opuštěný lovecký tábor na východě Kolonie patřil jim. Za odměnu jsem dostal speciální luk s několika šípy.");
	B_GiveXP(XP_BLACKWOLF);
	CreateInvItem(self,loner_bogen);
	B_GiveInvItems(self,hero,loner_bogen,1);
	CreateInvItems(self,ItAmArrow,30);
	B_GiveInvItems(self,hero,ItAmArrow,30);
	B_GiveInvItems(hero,self,itat_blackwolf_01,1);
	Npc_RemoveInvItem(self,itat_blackwolf_01);
};

