instance Tpl_1438_Templer_Exit(C_Info)
{
	npc = TPL_1438_Templer;
	nr = 999;
	condition = Tpl_1438_Templer_Exit_Condition;
	information = Tpl_1438_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

func void Tpl_1438_Templer_Exit_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_Exit_Info_15_01");	//Ještě se uvidíme!
	AI_Output(self,other,"Tpl_1438_Templer_Exit_Info_13_02");	//Kéž Spáč procitne!
	AI_StopProcessInfos(self);
};

instance Tpl_1438_Templer_INFO(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_INFO_Condition;
	information = Tpl_1438_Templer_INFO_Info;
	important = 0;
	permanent = 0;
	description = "Co dělají templáři v dolu?";
};

func int Tpl_1438_Templer_INFO_Condition()
{
	if(CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Tpl_1438_Templer_INFO_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_INFO_Info_15_01");	//Co dělají templáři v dolu?
	AI_Output(self,other,"Tpl_1438_Templer_INFO_Info_13_02");	//Lovíme tady důlní červy. Jdi zpátky do tábora, tam budeš v bezpečí.
};

instance Tpl_1438_Templer_WHY(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_WHY_Condition;
	information = Tpl_1438_Templer_WHY_Info;
	important = 0;
	permanent = 0;
	description = "Proč lovíte červy?";
};

func int Tpl_1438_Templer_WHY_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_INFO))
	{
		return 1;
	};
};

func void Tpl_1438_Templer_WHY_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_01");	//Proč lovíte červy?
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_02");	//Pro jejich čelisti. Obsahují cenný výměšek.
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_03");	//Jaký druh výměšku?
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_04");	//Jed. Jedině náš Guru Cor Kalom ví, jak z něj připravit lektvar.
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_05");	//A kromě něj jedině Baal Orun ví, jak připravit polévku z čelistí důlních červů.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Orun mě může naučit, jak zpracovat Trávu z bažin. Musím ale být nejdřív přijat do Tábora v bažinách, jedině tak mě zasvětí do tajemství zpracováníbylin.");
};

instance Tpl_1438_Templer_KALOM(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_KALOM_Condition;
	information = Tpl_1438_Templer_KALOM_Info;
	important = 0;
	permanent = 0;
	description = "Kdo je Cor Kalom?";
};

func int Tpl_1438_Templer_KALOM_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY))
	{
		return 1;
	};
};

func void Tpl_1438_Templer_KALOM_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_01");	//Kdo je Cor Kalom?
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_02");	//Jeden z nejmocnějších mužů celého Bratrstva. Zná mnohá tajemství a dokáže ovládat mysl jiných lidí!
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_03");	//Kromě toho je alchymista. Připravuje lektvary, díky kterým můžeme navazovat duchovní kontakt se Spáčem. Jdi do tábora. Pořád hledáme nějaké lidi!
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_04");	//Budu o tom přemýšlet.
};

instance Tpl_1438_Templer_EGGSEARCH(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_EGGSEARCH_Condition;
	information = Tpl_1438_Templer_EGGSEARCH_Info;
	important = 0;
	permanent = 0;
	description = "Hledám hnízdo důlních červů.";
};

func int Tpl_1438_Templer_EGGSEARCH_Condition()
{
	if(CorKalom_BringMCQBalls == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01");	//Hledám hnízdo důlních červů.
	AI_Output(self,other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02");	//Jdi za Gorem Na Videm, Gorem Na Koshem nebo Gorem Na Barem. Ti vědí o červech mnohem více než já.
	B_LogEntry(CH2_MCEggs,"U vchodu do Starého dolu jsem se zeptal jednoho templáře na hnízdo důlních červů. Odkázal mě na tři další templáře - Gora Na Vida, Gora Na Koshe a Gora Na Bara. Tahle jména, která používají v Bratrstvu, mě přivádějí k šílenství.");
};

instance Tpl_1438_Templer_ZANGEN(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_ZANGEN_Condition;
	information = Tpl_1438_Templer_ZANGEN_Info;
	important = 0;
	permanent = 0;
	description = "Jak oddělím důlnímu červovi čelisti?";
};

func int Tpl_1438_Templer_ZANGEN_Condition()
{
	if((Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING)) && (Knows_GetMCMandibles == FALSE))
	{
		return TRUE;
	};
};

func void Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_ZANGEN_Info_15_01");	//Jak oddělím důlnímu červovi čelisti?
	AI_Output(self,other,"Tpl_1438_Templer_ZANGEN_Info_13_02");	//Není to tak snadné. Naučím tě to.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Jeden z templářů, který je na nejvyšší úrovni Starého dolu, mě může naučit, odebírání čelistí Důlních červů.");
};

instance Tpl_1438_Templer_TEACHZANGEN(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_TEACHZANGEN_Condition;
	information = Tpl_1438_Templer_TEACHZANGEN_Info;
	important = 0;
	permanent = 1;
	description = "Naučit se oddělit červovi čelisti (1 dovednostní bod)";
};

func int Tpl_1438_Templer_TEACHZANGEN_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_ZANGEN) && (Knows_GetMCMandibles == FALSE))
	{
		return TRUE;
	};
};

func void Tpl_1438_Templer_TEACHZANGEN_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01");	//Můžeš mě naučit, jak se odstraňují čelisti?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01");	//Nejdřív musíš udělat hluboký zářez do masa. Dávej pozor, abys neporušil čelistní žlázu. Pokud to uděláš, výměšek vystříkne pryč.
		AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02");	//To musí být docela mrzuté.
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03");	//To si piš! Už jsi navštívil Korgura Tříprsťáka, lovce červů? Ale ne, to bylo, než jsi přišel. Dobrá, pokračujme...
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04");	//Řezej kolem žlázy, dělej hluboký zářez a potom odstraň maso společně s čelistma. Když je uchopíš takhle, nebudeš mít potíže s odstraněním čelistí.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Odebírání čelistí - Důlní červy");
		Tpl_1438_Templer_TEACHZANGEN.permanent = 0;
		PrintScreen("Naučil ses: Odebírání kusadel důlních červů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

