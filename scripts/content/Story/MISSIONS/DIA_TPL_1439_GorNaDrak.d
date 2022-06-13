instance DIA_GorNaDrak_EXIT(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 999;
	condition = DIA_GorNaDrak_EXIT_Condition;
	information = DIA_GorNaDrak_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

func void DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GorNaDrak_Greet(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_Greet_Condition;
	information = DIA_GorNaDrak_Greet_Info;
	permanent = 0;
	description = "Zdar! Kam odcházíš?";
};

func int DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

func void DIA_GorNaDrak_Greet_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Greet_15_00");	//Zdar! Kam odcházíš?
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_01");	//Neseme výměšek důlního červa od našich bratrů ze Starého dolu ke Cor Kalomovi.
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_02");	//Chodíme pro něj do Starého dolu každý den.
};

instance DIA_GorNaDrak_WasSekret(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_WasSekret_Condition;
	information = DIA_GorNaDrak_WasSekret_Info;
	permanent = 0;
	description = "Jaký druh výměšku to je?";
};

func int DIA_GorNaDrak_WasSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WasSekret_15_00");	//Jaký druh výměšku to je?
	AI_Output(self,other,"DIA_GorNaDrak_WasSekret_09_01");	//Je obsažený v čelistech důlních červů. Když víš jak na to, můžeš je odnést, aniž bys ztratil výměšek.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Gor Na drak, Templář, který pendluje mezi Táborem v bažinách a Starým dolem, mě může naučit, jak odebrat čelisti Důlních červů.");
};

instance DIA_GorNaDrak_TeachMandibles(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_TeachMandibles_Condition;
	information = DIA_GorNaDrak_TeachMandibles_Info;
	permanent = 1;
	description = "Můžeš mi něco říci o tom, jak získáváš výměšek důlních červů?";
};

func int DIA_GorNaDrak_TeachMandibles_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01");	//Můžeš mě naučit, jak se odstraňují čelisti?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_GorNaDrak_TeachMandibles_09_01");	//Jistě. Když tu bestii zabiješ, vezmeš její čelisti a odneseš je. Tak získáš žlázu s výměškem, aniž bys ji poškodil.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Odebírání čelistí - Důlní červy");
		DIA_GorNaDrak_TeachMandibles.permanent = 0;
		PrintScreen("Naučil ses: Odebírání kusadel důlních červů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

instance DIA_GorNaDrak_WhatFor(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_WhatFor_Condition;
	information = DIA_GorNaDrak_WhatFor_Info;
	permanent = 0;
	description = "Na co Cor Kalom ten výměšek potřebuje?";
};

func int DIA_GorNaDrak_WhatFor_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WhatFor_15_00");	//Na co Cor Kalom ten výměšek potřebuje?
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_01");	//Co já vím, připravuje z něj nějaký lektvar, který umocňuje magické síly noviců.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_02");	//Od té doby, co připravujeme velké vzývání, nemá té látky stále dost.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_03");	//S pomocí toho lektvaru připravuje novice na ten velký den.
};

instance DIA_GorNaDrak_Permanent(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_Permanent_Condition;
	information = DIA_GorNaDrak_Permanent_Info;
	permanent = 1;
	description = "Máte dost lektvaru na to velké vzývání Spáče?";
};

func int DIA_GorNaDrak_Permanent_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WhatFor) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_Permanent_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Permanent_15_00");	//Máte dost lektvaru na to velké vzývání Spáče?
	AI_Output(self,other,"DIA_GorNaDrak_Permanent_09_01");	//Ne - Pořád sbíráme další - jednotky našich lovců důlních červů jsou ve dne v noci v akci.
};

instance TPL_1439_GORNADRAK_WELCOME(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	condition = tpl_1439_gornadrak_welcome_condition;
	information = tpl_1439_gornadrak_welcome_info;
	important = 1;
	permanent = 0;
};

func int tpl_1439_gornadrak_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};
};

func void tpl_1439_gornadrak_welcome_info()
{
	AI_Output(self,other,"Tpl_1439_GorNaDrak_WELCOME_Info_08_01");	//Podařilo se ti stát Templářem? Můžeš být na sebe hrdý!
	AI_StopProcessInfos(self);
};

