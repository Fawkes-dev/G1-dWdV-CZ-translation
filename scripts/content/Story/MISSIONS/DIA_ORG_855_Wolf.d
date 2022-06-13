instance DIA_ORG_855_Wolf_Exit(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 999;
	condition = DIA_ORG_855_Wolf_Exit_Condition;
	information = DIA_ORG_855_Wolf_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_ORG_855_Wolf_Exit_Condition()
{
	return TRUE;
};

func void DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Wolf_Hello(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_Hello_Condition;
	information = DIA_Wolf_Hello_Info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int DIA_Wolf_Hello_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hello_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hello_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Wolf_Hello_09_01");	//Jsem Wolf. Vyrábím zbroj.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wolf dodává banditům ZBROJ. Obvykle bývá ve své chatrči v přední části velké obytné jeskyně.");
};

instance DIA_Wolf_GreetORG(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_GreetORG_Condition;
	information = DIA_Wolf_GreetORG_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Wolf_GreetORG_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void DIA_Wolf_GreetORG_Info()
{
	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00");	//Hej! Teď jsi jedním z nás, chlapče.
};

instance Org_855_Wolf_TRADE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 2;
	condition = Org_855_Wolf_TRADE_Condition;
	information = Org_855_Wolf_TRADE_Info;
	permanent = 0;
	description = DIALOG_TRADE;
};

func int Org_855_Wolf_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_TRADE_Info()
{
	AI_Output(other,self,"Org_855_Wolf_TRADE_15_00");	//Obchoduješ ještě s něčím jiným?
	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01");	//Nakupuju od lovců kožešiny a kůže. Jestli něco takového máš, koupím to.
};

instance ORG_855_WOLF_TRADENOW(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = org_855_wolf_tradenow_condition;
	information = org_855_wolf_tradenow_info;
	permanent = 1;
	description = "Ukaž mi svoje zboží.";
	trade = 1;
};

func int org_855_wolf_tradenow_condition()
{
	if(Npc_KnowsInfo(hero,Org_855_Wolf_TRADE))
	{
		return TRUE;
	};
};

func void org_855_wolf_tradenow_info()
{
	AI_Output(other,self,"STT_336_cavalorn_TRADE_Info_15_01");	//Ukaž mi svoje zboží.
};

instance Org_855_Wolf_WhereHunter(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 3;
	condition = Org_855_Wolf_WhereHunter_Condition;
	information = Org_855_Wolf_WhereHunter_Info;
	permanent = 1;
	description = "Jak stáhnu kožešiny a kůže?";
};

func int Org_855_Wolf_WhereHunter_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_WhereHunter_Info()
{
	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00");	//Jak stáhnu kožešiny a kůže?
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_01");	//Pokud se vydáš cestou do Starého tábora, projdeš kolem staré chatrče. Patří Aidanovi.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_02");	//Ale nezdržuje se tam často. Pokud vím, tráví dost času na východě Kolonie.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_03");	//Může tě naučit, jak odebrat kožešinu ze zvířat.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_04");	//Drax a Ratford by také měli být někde v Kolonii. Drax je zkušený lovec a jsem si jistý, že tě něco naučí.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_05");	//Naposledy co jsem viděl Gestatha tak si to špacíroval ke Svobodnému dolu. Má tam své tábořiště.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_06");	//Ach ano, a myslím že bandité z hor mají také svého lovce. Nevím ale, jestli je to pravda, jenom jsem o tom slyšel.
};

instance DIA_Wolf_SellArmor(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 4;
	condition = DIA_Wolf_SellArmor_Condition;
	information = DIA_Wolf_SellArmor_Info;
	permanent = 1;
	description = "Sháním lepší zbroj.";
};

func int DIA_Wolf_SellArmor_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello) && !Npc_KnowsInfo(hero,Info_Wolf_ARMORFINISHED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00");	//Sháním lepší zbroj.
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01");	//Teď když jsi jedním z nás, můžu ti jednu prodat.
		Info_ClearChoices(DIA_Wolf_SellArmor);
		Info_AddChoice(DIA_Wolf_SellArmor,DIALOG_BACK,DIA_Wolf_SellArmor_BACK);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H),DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00");	//Nemůžu ti nic prodat. Lares by mě zabil, kdybych prodal zbroj cizincům.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01");	//Chci střední zbroj.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_ORG_ARMOR_M)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Žádná ruda, žádná zbroj.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03");	//To je dobrá zbroj. Ne sice tak dobrá jako ta, co nosím já, ale ochrání tě také dobře.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_ORG_ARMOR_M);
		CreateInvItem(hero,org_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01");	//Můžeš mi prodat těžkou zbroj?
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_ORG_ARMOR_H)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02");	//Žádná ruda, žádná zbroj.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03");	//Tahle zbroj tě ochrání před každým nebezpečím! Nosím ji sám a přežívám už dost dlouho. V neposledním díky téhle zbroji.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_ORG_ARMOR_H);
		CreateInvItem(hero,org_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

instance ORG_855_Wolf_TRAINOFFER(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAINOFFER_Condition;
	information = ORG_855_Wolf_TRAINOFFER_Info;
	important = 0;
	permanent = 0;
	description = "Rád bych se naučil zacházet s lukem.";
};

func int ORG_855_Wolf_TRAINOFFER_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOW) != 2) && Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01");	//Rád bych se naučil zacházet s lukem.
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02");	//Můžu tě to naučit. Ale nemůžu to dělat jenom pro radost. Především musím také něco jíst.
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03");	//Kolik?
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04");	//Všechno, co tě naučím, bude stát 50 nugetů. A bez smlouvání.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Bandita Wolf mě může naučit používat LUK.");
};

instance ORG_855_Wolf_TRAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAIN_Condition;
	information = ORG_855_Wolf_TRAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50);
};

func int ORG_855_Wolf_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAIN_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01");	//Nauč mě zacházet s lukem.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02");	//Tvůj zásah záleží na tvé zručnosti. Čím pohotovější budeš, tím přesněji zasáhne tvůj šíp cíl.
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03");	//Tvoje obratnost určuje vzdálenost, ze které dokážeš zasáhnout cíl. Aby se z tebe stal dobrý střelec, měl bys vylepšovat obojí rovnoměrně.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};

instance ORG_855_Wolf_TRAINAGAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAINAGAIN_Condition;
	information = ORG_855_Wolf_TRAINAGAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,50);
};

func int ORG_855_Wolf_TRAINAGAIN_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINAGAIN_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01");	//Chci se zlepšit v umění lukostřelby.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02");	//Už je z tebe dobrý lovec. Teď si osvojíš zbývající znalosti.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03");	//Aby ses stal dobrým střelcem, musíš se o to přestat snažit.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04");	//Objev zákony zraku, napětí, dráhy a cíle. Vždy buď ve střehu a buď připravený.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05");	//Teď už jsi velmi dobře zvládl techniku. Tak pojď a vyzkoušej své znalosti a umění.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};

instance ORG_855_Wolf_Teach(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 6;
	condition = ORG_855_Wolf_Teach_Condition;
	information = ORG_855_Wolf_Teach_Info;
	permanent = 1;
	description = "Můžeš mě něco naučit?";
};

func int ORG_855_Wolf_Teach_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01");	//Tvá zručnost předurčuje úspěch při lovu.
	if(log_wolftrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Bandita Wolf mi může ukázat, jak si zlepšit OBRATNOST.");
		log_wolftrain = TRUE;
	};
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	Info_ClearChoices(ORG_855_Wolf_Teach);
};

func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

instance Org_855_Wolf_SELLBOW(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = Org_855_Wolf_SELLBOW_Condition;
	information = Org_855_Wolf_SELLBOW_Info;
	important = 0;
	permanent = 0;
	description = "Kde tady dostanu luk?";
};

func int Org_855_Wolf_SELLBOW_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_SELLBOW_Info()
{
	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01");	//Kde tady dostanu luk?
	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02");	//To jsi na správné adrese. Za dobrou rudu nabízím kvalitu.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Bandita Wolf obchoduje s LUKY.");
};

instance Info_Wolf_GOOD(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_GOOD_Condition;
	information = Info_Wolf_GOOD_Info;
	important = 0;
	permanent = 0;
	description = "Gorn říkal, že mi potřebuješ něco naléhavého sdělit?";
};

func int Info_Wolf_GOOD_Condition()
{
	if(Gorn_GotoWolf == TRUE)
	{
		return TRUE;
	};
};

func void Info_Wolf_GOOD_Info()
{
	AI_Output(hero,self,"Info_Wolf_GOOD_15_01");	//Gorn říkal, že mi potřebuješ něco naléhavého sdělit?
	AI_Output(self,hero,"Info_Wolf_GOOD_09_02");	//Jsem rád, že ses před odchodem ještě zastavil!
	if(!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output(hero,self,"Info_Wolf_GOOD_15_03");	//Před čím?
		AI_Output(self,hero,"Info_Wolf_GOOD_09_04");	//Před tím, než odejdeš navštívit ten 'Nepříliš Svobodný důl'.
	};
};

instance Info_Wolf_SPEAK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SPEAK_Condition;
	information = Info_Wolf_SPEAK_Info;
	important = 0;
	permanent = 0;
	description = "Co se děje?";
};

func int Info_Wolf_SPEAK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_GOOD))
	{
		return TRUE;
	};
};

func void Info_Wolf_SPEAK_Info()
{
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01");	//Co se děje?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02");	//Dostal jsem nápad jak vyrobit úplně novou zbroj.
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03");	//Och, a jak?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04");	//Pancéřové krunýře důlních červů jsou z nejpevnějšího materiálu, který znám.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05");	//Nemyslím ty malé nepoškozené vzorky, které se našly v Gomezově zakopaném dole...
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06");	//...NEEE. Ty ne. V našem dole je daleko nebezpečnější typ.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07");	//Brnění těch bestií je téměř neprorazitelné.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08");	//Když mi přineseš pár těch ochranných plátů, pokusím se z nich vyrobit zbroj...
};

instance Info_Wolf_SKIN(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SKIN_Condition;
	information = Info_Wolf_SKIN_Info;
	important = 0;
	permanent = 0;
	description = "Jak dostanu krunýř z těch bestií?";
};

func int Info_Wolf_SKIN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_SKIN_Info()
{
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01");	//Jak ty pláty z těch bestií dostanu?
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02");	//To je celkem snadné. Zadní pláty jsou připevněné k tělu jenom podél okrajů.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03");	//Vezmi břitvu a odřízni je podél tečkované čáry.
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04");	//Dobře, mám to! Podívám se, jestli takové ochranné pláty nenajdu.
	Knows_GetMCPlates = TRUE;
	PrintScreen("Naučil ses: Odebírání pancéřů důlních červů",-1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Log_CreateTopic(CH4_MCPlateArmor,LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_RUNNING);
	B_LogEntry(CH4_MCPlateArmor,"Bandita Wolf z Nového tábora mi nabídl, že mi zhotoví brnění z ochranných krunýřů důlních červů. Ukázal mi, jak se z mrtvého důlního červa odřezávají.");
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Odebírání plátů pancíře - Důlní červy - válečníci");
	AI_StopProcessInfos(self);
};

instance Info_Wolf_PROFIT(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_PROFIT_Condition;
	information = Info_Wolf_PROFIT_Info;
	important = 0;
	permanent = 0;
	description = "A říkáš mi to jen tak, aniž bys za to něco chtěl?";
};

func int Info_Wolf_PROFIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_PROFIT_Info()
{
	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01");	//A říkáš mi to jen tak, aniž bys za to něco chtěl?
	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02");	//Ne tak docela...Pokud se mi z těch plátů podaří vyrobit dobrou zbroj, budu.. hodně brzy... hodně moc... och, zapomeň na to!
};

instance Info_Wolf_MCPLATESFEW(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESFEW_Condition;
	information = Info_Wolf_MCPLATESFEW_Info;
	important = 0;
	permanent = 0;
	description = "Nasbíral jsem nějaké ty krunýře důlních červů!";
};

func int Info_Wolf_MCPLATESFEW_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) > 0) && (Npc_HasItems(hero,ItAt_Crawler_02) < 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01");	//Nasbíral jsem nějaké ty ochranné pláty z důlních červů!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02");	//To nestačí! To nestačí na celou zbroj.
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03");	//Přines ještě další pláty!
};

instance Info_Wolf_MCPLATESENOUGH(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESENOUGH_Condition;
	information = Info_Wolf_MCPLATESENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "Už jsem nasbíral dost krunýřů důlních červů!";
};

func int Info_Wolf_MCPLATESENOUGH_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) >= 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESENOUGH_Info()
{
	var int zufallsbelohnung;
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01");	//Už jsem nasbíral dost ochranných plátů z důlních červů!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02");	//Vynikající!!! Můžu se ihned pustit do práce!
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03");	//Jak dlouho to bude trvat?
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04");	//Nemám nejmenší představu. Je to úplně nový postup, člověče!
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05");	//Prostě se tu občas zastav, když budeš někde blízko!
		MCPlatesDelivered = TRUE;
		B_LogEntry(CH4_MCPlateArmor,"Wolf ode mě dostal patnáct takovýchto krunýřů důlních červů. Mám se vrátit později.");
		B_GiveXP(XP_DeliveredMCPlates);
		B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
		AI_StopProcessInfos(self);
	}
	else if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_01");	//Je škoda, že k nám nepatříš. Vyrobil bych pro tebe zbroj.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_02");	//Jako cizinec v našem táboře máš bohužel smůlu.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_03");	//Mám v táboře zákazníka, který by měl zájem o takovou zbroj.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_04");	//Ale pořád pro tebe něco mám. Tvoje práce nebyla zbytečná. Vem si to!
		Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
		B_LogEntry(CH4_MCPlateArmor,"Když jsem Wolfovi přinesl 15 plátů pancéřů z Důlních červů, vysvětlil mi, že zbroj vyrobí jen pro členy tábora. Takže mám smůlu. Místo toho jsem dostal drahocenný lektvar.");
		B_GiveXP(XP_GORPSIPLATEARMOR);
		Mdl_SetVisualBody(org_5033_gestath,"hum_body_Naked0",0,3,"Hum_Head_Psionic",12,0,crw_armor_h);
		Npc_RemoveInvItem(org_5033_gestath,ItRw_Bow_Long_01);
		Npc_RemoveInvItem(org_5033_gestath,ItMw_1H_Mace_War_02);
		CreateInvItems(org_5033_gestath,ItMw_2H_Sword_Heavy_02,1);
		AI_EquipBestMeleeWeapon(org_5033_gestath);
		AI_EquipBestArmor(org_5033_gestath);
		B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
		MCPlatesDelivered = TRUE;
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItem(self,ItFo_Potion_Dex_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Dex_03,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItem(self,ItFo_Potion_Strength_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Strength_03,1);
		}
		else
		//BUG [Fawkes]: ak padne hodnota zufallsbelohnung medzi 0 - 10 tak hrac nedostane ziadnu odmenu
		//if(zufallsbelohnung >= 25)
		{
			CreateInvItem(self,ItFo_Potion_Health_Perma_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Health_Perma_03,1);
		};
		AI_StopProcessInfos(self);
	};
};

instance Info_Wolf_ARMORINWORK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORINWORK_Condition;
	information = Info_Wolf_ARMORINWORK_Info;
	important = 0;
	permanent = 1;
	description = "Jak jsi daleko s tou zbrojí?";
};

func int Info_Wolf_ARMORINWORK_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORINWORK_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01");	//Jak jsi daleko s tou zbrojí?
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02");	//Bude to asi chvilku trvat, člověče! Tyhle pláty jsou opravdu těžký materiál. Ještě jsem pořád nepřišel na způsob, jak je spojit dohromady!
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03");	//Dej mi ještě čas, přijdu na to!
	AI_StopProcessInfos(self);
};

instance Info_Wolf_ARMORFINISHED(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORFINISHED_Condition;
	information = Info_Wolf_ARMORFINISHED_Info;
	important = 0;
	permanent = 0;
	description = "Jak jsi daleko s tou zbrojí?";
};

func int Info_Wolf_ARMORFINISHED_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01");	//Jak daleko ses dostal s tou zbrojí?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02");	//Nakonec jsem přišel na to, jak ty ochranné pláty spojit dohromady!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03");	//Znamená to, že je zbroj hotova?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04");	//Ano, člověče. Tady je. Vypadá doopravdy silnější než jakákoliv jiná zbroj tady v táboře.
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05");	//Díky, něco ti dlužím!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06");	//To je v pořádku! Už jsem přišel na to, jak pokrýt svoje výdaje!
	B_LogEntry(CH4_MCPlateArmor,"Brnění je hotovo.  Skvěle odvedená práce a vlastně nejlepší ochranné brnění, jakou jsem tu zatím viděl.");
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
	B_GiveXP(XP_GorMCPlateArmor);
	CreateInvItem(self,crw_armor_h);
	B_GiveInvItems(self,hero,crw_armor_h,1);
};

instance INFO_WOLF_CRAFT(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_condition;
	information = info_wolf_craft_info;
	important = 0;
	permanent = 0;
	description = "Můžeš mi vyrobit zbroj?";
};

func int info_wolf_craft_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_armor))
	{
		return TRUE;
	};
};

func void info_wolf_craft_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_15_01");	//Můžeš mi vyrobit zbroj?
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_02");	//Mohl bych, ale nemám dost materiálu na výrobu.
	AI_Output(hero,self,"Info_Wolf_CRAFT_09_03");	//Co když ti ho seženu, co potřebuješ?
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_04");	//Doufal jsem, že to řekneš, měl bys mít nějaké zkušenosti s lovem a odebíraním trofejí, potřebuju kožešiny, kůže a pár dalších věcí.
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_05");	//Samozřejmě nic z toho není zadarmo a mysli na to, že si při tom taky něco musím vydělat.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Když přinesu Wolfovy potřebné materiály, může mi z nich vyrobit zbroj.");
};

instance INFO_WOLF_CRAFT_WHICH(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_which_condition;
	information = info_wolf_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Jakou zbroj mi můžeš vyrobit?";
};

func int info_wolf_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,info_wolf_craft))
	{
		return TRUE;
	};
};

func void info_wolf_craft_which_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_WHICH_15_01");	//Jakou zbroj mi můžeš vyrobit?
	AI_Output(self,hero,"Info_Wolf_CRAFT_WHICH_09_02");	//Vyber si.
	Info_ClearChoices(info_wolf_craft_which);
	Info_AddChoice(info_wolf_craft_which,DIALOG_BACK,info_wolf_craft_which_back);
	Info_AddChoice(info_wolf_craft_which,"Zbroj z vlčí kůže (4 vlčí kůže, 3 zuby, 2 drápy, 600 ks rudy)",info_wolf_craft_which_wolf);
	Info_AddChoice(info_wolf_craft_which,"Zbroj z číhavčí kůže (5 číhavčích kůží, 2 zuby, 2 drápy, 800 ks rudy)",info_wolf_craft_which_lurker);
	if(Kapitel > 1)
	{
		Info_AddChoice(info_wolf_craft_which,"Zbroj z kůže skřetího psa (7 kůží skřetího psa, 6 zubů, 4 drápy, 1250 ks rudy)",info_wolf_craft_which_orc);
	};
	if(Kapitel > 2)
	{
		Info_AddChoice(info_wolf_craft_which,"Zbroj z kůže Močálového žraloka (6 kůží močálového žraloka, 5 zubů močálového žraloka, 2 drápy, 1700 ks rudy)",info_wolf_craft_which_shark);
	};
	if(Kapitel > 3)
	{
		Info_AddChoice(info_wolf_craft_which,"Zbroj z kůže Trollů  (2 kůže Trollů, 4 Trollí zuby, 4 drápy, 2050 ks rudy)",info_wolf_craft_which_troll);
	};
};

func void info_wolf_craft_which_back()
{
	Info_ClearChoices(info_wolf_craft_which);
};

func void info_wolf_craft_which_wolf()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Wolf_13_01");	//Chci zbroj z vlčí kůže.
	if((Npc_HasItems(other,ItAt_Wolf_01) >= 4) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Teeth_01) >= 3) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_K))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_16_02");	//Výborně. S tou mi to docela jde.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mám tu jednu navíc, kterou můžu rovnou směnit za materiál.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Užij si ji!
		B_GiveInvItems(other,self,ItAt_Wolf_01,4);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Teeth_01,3);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_K);
		CreateInvItem(hero,non_armor_l);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Nemáš dost materiálu. Vrať se až všechno seženeš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_orc()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Orc_12_01");	//Chci zbroj z kůže skřetího psa.
	if((Npc_HasItems(other,ItAt_Wolf_02) >= 7) && (Npc_HasItems(other,ItAt_Claws_01) >= 6) && (Npc_HasItems(other,ItAt_Teeth_01) >= 4) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_N))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_16_02");	//Výborně. S tou mi to docela jde.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mám tu jednu navíc, kterou můžu rovnou směnit za materiál.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Užij si ji!
		B_GiveInvItems(other,self,ItAt_Wolf_02,7);
		B_GiveInvItems(other,self,ItAt_Claws_01,6);
		B_GiveInvItems(other,self,ItAt_Teeth_01,4);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_N);
		CreateInvItem(hero,non_armor_n);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Nemáš dost materiálu. Vrať se až všechno seženeš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_shark()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Wolf_34_01");	//Chci zbroj z kůže močálového žraloka.

	//BUG [Fawkes]: Potrebujeme 6 kozi Bazinnych zralokov a 5 zubov
	//if((Npc_HasItems(other,ItAt_Swampshark_01) >= 4) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Swampshark_02) >= 3) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_L))
	if((Npc_HasItems(other,ItAt_Swampshark_01) >= 6) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Swampshark_02) >= 5) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_L))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Shark_16_02");	//Výborně. S tou mi to docela jde.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mám tu jednu navíc, kterou můžu rovnou směnit za materiál.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Užij si ji!
		//BUG [Fawkes]: Potrebujeme 6 kozi Bazinnych zralokov a 5 zubov
		//B_GiveInvItems(other,self,ItAt_Swampshark_01,5);
		B_GiveInvItems(other,self,ItAt_Swampshark_01,6);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Swampshark_02,5);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_L);
		CreateInvItem(hero,non_armor_k);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Nemáš dost materiálu. Vrať se až všechno seženeš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_lurker()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Lurker_34_01");	//Chci zbroj z kůže číhavce.
	if((Npc_HasItems(other,ItAt_Lurker_02) >= 5) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Teeth_01) >= 2) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_U))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_16_02");	//Výborně. S tou mi to docela jde.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_04");	//Mám tu jednu navíc, kterou můžu rovnou směnit za materiál.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_05");	//Užij si ji!
		B_GiveInvItems(other,self,ItAt_Lurker_02,5);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Teeth_01,2);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_U);
		CreateInvItem(hero,non_armor_u);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_02");	//Nemáš dost materiálu. Vrať se až všechno seženeš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_troll()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Troll_34_01");	//Chci zbroj z trollí kůže.
	if((Npc_HasItems(other,ItAt_Troll_01) >= 2) && (Npc_HasItems(other,ItAt_Claws_01) >= 4) && (Npc_HasItems(other,ItAt_Troll_02) >= 4) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_W))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_16_02");	//Výborně. S tou mi to docela jde.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_04");	//Mám tu jednu navíc, kterou můžu rovnou směnit za materiál.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_05");	//Užij si ji!
		B_GiveInvItems(other,self,ItAt_Troll_01,2);
		B_GiveInvItems(other,self,ItAt_Claws_01,4);
		B_GiveInvItems(other,self,ItAt_Troll_02,4);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_W);
		CreateInvItem(hero,non_armor_p);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_02");	//Nemáš dost materiálu. Vrať se až všechno seženeš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

instance INFO_WOLF_CRAFT_WHICH_IMPROVE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_which_improve_condition;
	information = info_wolf_craft_which_improve_info;
	important = 0;
	permanent = 1;
	description = "Vylepšuješ také zbroje?";
};

func int info_wolf_craft_which_improve_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_ORG) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)))
	{
		return TRUE;
	};
};

func void info_wolf_craft_which_improve_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_WHICH_IMPROVE_15_01");	//Vylepšuješ také zbroje?
	AI_Output(self,hero,"Info_Wolf_CRAFT_WHICH_IMPROVE_09_02");	//Jistě. Stačí když mi přinseš zbroj, a když máš dost rudy.
	Info_ClearChoices(info_wolf_craft_which_improve);
	Info_AddChoice(info_wolf_craft_which_improve,DIALOG_BACK,info_wolf_craft_which_improve_back);
	if(Npc_HasItems(other,org_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Vylepšit Lehkou zbroj Banditů (375 ks rudy)",info_wolf_craft_which_improve_orgl);
	};
	if(Npc_HasItems(other,org_armor_m) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Vylepšit Zbroj banditů (525 ks rudy)",info_wolf_craft_which_improve_orgm);
	};
	if(Npc_HasItems(other,org_armor_h) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Vylepšit Těžkou zbroj banditů (600 ks rudy)",info_wolf_craft_which_improve_orgh);
	};
	if(Npc_HasItems(other,sld_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Vylepšit Lehkou zbroj žoldnéřů (675 ks rudy)",info_wolf_craft_which_improve_sldl);
	};
	if(Npc_HasItems(other,sld_armor_m) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Vylepšit Zbroj žoldnéřů (825 ks rudy)",info_wolf_craft_which_improve_sldm);
	};
	if(Npc_HasItems(other,sld_armor_h) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Vylepšit Těžká zbroj žoldnéřů (1050 ks rudy)",info_wolf_craft_which_improve_sldh);
	};
	if(Npc_HasItems(other,kdw_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Vylepšit Roucho vody (975 ks rudy)",info_wolf_craft_which_improve_kdwl);
	};
};

func void info_wolf_craft_which_improve_back()
{
	Info_ClearChoices(info_wolf_craft_which_improve);
};

func void info_wolf_craft_which_improve_orgl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,org_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Dobře, myslím, že  tím můžu něco udělat.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Malý moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,org_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,org_armor_l);
		CreateInvItem(self,org_armor_l_upgrade);
		B_GiveInvItems(self,hero,org_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//Tady je tvé brnění, věřím, že ti bude dobře sloužit !
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_orgm()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,org_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 525))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Dobře, myslím, že  tím můžu něco udělat.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Malý moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,org_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,525);
		Npc_RemoveInvItem(self,org_armor_m);
		CreateInvItem(self,org_armor_m_upgrade);
		B_GiveInvItems(self,hero,org_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//Tady je tvé brnění, věřím, že ti bude dobře sloužit !
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_orgh()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVEWolf_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,org_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Dobře, myslím, že  tím můžu něco udělat.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Malý moment.
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(hero,org_armor_h);
		CreateInvItem(hero,org_armor_h_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//Tady je tvé brnění, věřím, že ti bude dobře sloužit !
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_IMPROVE_Wolf_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,sld_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Dobře, myslím, že  tím můžu něco udělat.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Malý moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,sld_armor_l);
		CreateInvItem(self,sld_armor_l_upgrade);
		B_GiveInvItems(self,hero,sld_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//Tady je tvé brnění, věřím, že ti bude dobře sloužit !
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldm()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,sld_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Dobře, myslím, že  tím můžu něco udělat.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Malý moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,sld_armor_m);
		CreateInvItem(self,sld_armor_m_upgrade);
		B_GiveInvItems(self,hero,sld_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//Tady je tvé brnění, věřím, že ti bude dobře sloužit !
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_IMPROVE_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldh()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,sld_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Dobře, myslím, že  tím můžu něco udělat.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Malý moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,sld_armor_h);
		CreateInvItem(self,sld_armor_h_upgrade);
		B_GiveInvItems(self,hero,sld_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//Tady je tvé brnění, věřím, že ti bude dobře sloužit !
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_kdwl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Tady je ta zbroj.
	if((Npc_HasItems(other,kdw_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 975))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Dobře, myslím, že  tím můžu něco udělat.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Malý moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdw_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,975);
		Npc_RemoveInvItem(self,kdw_armor_l);
		CreateInvItem(self,kdw_armor_l_upgrade);
		B_GiveInvItems(self,hero,kdw_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//Tady je tvé brnění, věřím, že ti bude dobře sloužit !
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nemáš dost rudy, přijď až něco našetříš.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

instance DIA_WOLF_GREETSLD(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = dia_wolf_greetsld_condition;
	information = dia_wolf_greetsld_info;
	permanent = 1;
	important = 0;
	description = "Přidal ses k Leeovým chlapům?";
};

func int dia_wolf_greetsld_condition()
{
	if(Npc_GetTrueGuild(self) == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_wolf_greetsld_info()
{
	AI_Output(other,self,"DIA_Wolf_GreetSLD_09_00");	//Přidal ses k Leeovým chlapům?
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_01");	//Lee se doslechl o tom, že opravuju zbroj pro jeho chlapy.
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_02");	//Ohromilo ho, jaké materiály dokážu použít na výrobu zbrojí.
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_03");	//Pak mi řekl, že se můžu přidat mezi Žoldnáky.
};

instance DIA_WOLF_SELLFUR(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 600;
	condition = dia_wolf_sellfur_condition;
	information = dia_wolf_sellfur_info;
	permanent = 1;
	description = "Mám pro tebe nějaké kožešiny ...";
};

func int dia_wolf_sellfur_condition()
{
	if(Npc_KnowsInfo(hero,Org_855_Wolf_TRADE))
	{
		return TRUE;
	};
};

func void dia_wolf_sellfur_info()
{
	AI_Output(other,self,"DIA_wolf_SellFur_15_00");	//Mám pro tebe nějaké kožešiny ...
	if((Npc_HasItems(other,ItAt_Wolf_01) > 0) || (Npc_HasItems(other,ItAt_Wolf_02) > 0) || (Npc_HasItems(other,ItAt_Shadow_01) > 0) || (Npc_HasItems(other,ItAt_Troll_01) > 0) || (Npc_HasItems(other,ItAt_Swampshark_01) > 0) || (Npc_HasItems(other,ItAt_Lurker_02) > 0))
	{
		if(Npc_HasItems(other,ItAt_Wolf_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_01");	//Vlčí kůže? Ty určitě využiju.
			//BUG [Fawkes]: chybalo vytvorenie rudy
			CreateInvItems (self, ItMiNugget,Npc_HasItems(other,ItAt_Wolf_01) * Value_Wolfsfell);
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_01) * Value_Wolfsfell);
			B_GiveInvItems(other,self,ItAt_Wolf_01,Npc_HasItems(other,ItAt_Wolf_01));
		};
		if(Npc_HasItems(other,ItAt_Wolf_02) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_02");	//Kůže skřetího psa? To není špatné, ty potvory jsou pěkně nebezpečné.
			//BUG [Fawkes]: chybalo vytvorenie rudy
			CreateInvItems (self, ItMiNugget,Npc_HasItems(other,ItAt_Wolf_02) * Value_Orkhundfell);
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_02) * Value_Orkhundfell);
			B_GiveInvItems(other,self,ItAt_Wolf_02,Npc_HasItems(other,ItAt_Wolf_02));
		};
		if(Npc_HasItems(other,ItAt_Shadow_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_03");	//Zabil jsi Stínovou šelmu? Na ty bestie tu narazíš jenom zřídkakdy.
			//BUG [Fawkes]: chybalo vytvorenie rudy
			CreateInvItems (self, ItMiNugget,Npc_HasItems(other,ItAt_Shadow_01) * Value_Shadowbeastfell);
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Shadow_01) * Value_Shadowbeastfell);
			B_GiveInvItems(other,self,ItAt_Shadow_01,Npc_HasItems(other,ItAt_Shadow_01));
		};
		if(Npc_HasItems(other,ItAt_Lurker_02) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_04");	//Číhavčí kůže, s ní se lehce pracuje.
			//BUG [Fawkes]: chybalo vytvorenie rudy
			CreateInvItems (self, ItMiNugget,Npc_HasItems(other,ItAt_Lurker_02) * Value_Lurkerhaut);
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Lurker_02) * Value_Lurkerhaut);
			B_GiveInvItems(other,self,ItAt_Lurker_02,Npc_HasItems(other,ItAt_Lurker_02));
		};
		if(Npc_HasItems(other,ItAt_Swampshark_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_05");	//Kůže Močálového žraloka? Toulal ses po bažinách sektářského tábora.
			//BUG [Fawkes]: chybalo vytvorenie rudy
			CreateInvItems (self, ItMiNugget,Npc_HasItems(other,ItAt_Swampshark_01) * Value_Sumpfhaihaut);
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Swampshark_01) * Value_Sumpfhaihaut);
			B_GiveInvItems(other,self,ItAt_Swampshark_01,Npc_HasItems(other,ItAt_Swampshark_01));
		};
		if(Npc_HasItems(other,ItAt_Troll_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_06");	//Co je tohle za kožešinu?
			AI_Output(other,self,"DIA_wolf_SellFur_11_07");	//To je kůže z Trolla.
			AI_Output(self,other,"DIA_wolf_SellFur_11_08");	//Troll? Zatím jsem slyšel o těch stvůrach jen příběhy.
			//BUG [Fawkes]: chybalo vytvorenie rudy
			CreateInvItems (self, ItMiNugget,Npc_HasItems(other,ItAt_Troll_01) * Value_Trollfell);
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Troll_01) * Value_Trollfell);
			B_GiveInvItems(other,self,ItAt_Troll_01,Npc_HasItems(other,ItAt_Troll_01));
		};
		AI_Output(self,other,"DIA_wolf_SellFur_11_09");	//Sežeň víc trofejí. Až budeš mít víc, víš na koho se obrátit.
	}
	else
	{
		AI_Output(self,other,"DIA_wolf_SellFur_11_10");	//Nevidím kožešiny ani kůže. Vraťte se, až pro mě budeš něco mít.
	};
};

