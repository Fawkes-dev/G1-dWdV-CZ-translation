instance DIA_Cutter_Exit(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 999;
	condition = DIA_Cutter_Exit_Condition;
	information = DIA_Cutter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Cutter_Exit_Condition()
{
	return 1;
};

func void DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Cutter_Hello(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Hello_Condition;
	information = DIA_Cutter_Hello_Info;
	permanent = 0;
	description = "Tenhle hrad je pořádně velký.";
};

func int DIA_Cutter_Hello_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void DIA_Cutter_Hello_Info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//Tenhle hrad je pořádně velký.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//Nemyslím, že bych tě už někdy viděl. Kdo jsi?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//Jsem tady nový. Akorát se tu trochu porozhlížím.
};

instance DIA_Cutter_Burg(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Burg_Condition;
	information = DIA_Cutter_Burg_Info;
	permanent = 0;
	description = "Co mi můžeš říci o hradu?";
};

func int DIA_Cutter_Burg_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

func void DIA_Cutter_Burg_Info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//Co mi můžeš říci o hradu?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//Gomez a jeho banda ho zabrali po velkém povstání.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//Hned jsem věděl, že bude lepší dát se k němu.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//Už když jsme se mačkali ve vězení a museli otročit v dolech, vždycky jsme dělali, co on řekl.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//Pod hradem je vězení?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//Ano, ale je prázdné. Po velkém povstání už tam nikdo nebyl uvězněný.
};

instance DIA_Cutter_PERM(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_PERM_Condition;
	information = DIA_Cutter_PERM_Info;
	permanent = 1;
	description = "Jaké to je být strážcem?";
};

func int DIA_Cutter_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

func void DIA_Cutter_PERM_Info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//Jaký je to život být strážcem?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//Klidný. Jsme největší a nejsilnější tábor v kolonii. Nikdo se na nás nedovoluje.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//Aha ...
};

instance GRD_208_Cutter_WELCOME(C_Info)
{
	npc = GRD_208_Cutter;
	condition = GRD_208_Cutter_WELCOME_Condition;
	information = GRD_208_Cutter_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int GRD_208_Cutter_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_208_Cutter_WELCOME_Info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//Dobře sis zvolil. Jako strážce budeš mít dobrý život!
	AI_StopProcessInfos(self);
};

instance DIA_CUTTER_GUY(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_guy_condition;
	information = dia_cutter_guy_info;
	permanent = 0;
	important = 1;
};

func int dia_cutter_guy_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return 1;
	};
};

func void dia_cutter_guy_info()
{
	AI_Output(self,other,"DIA_Cutter_GUY_15_00");	//Hej ty! Pojď sem.
	AI_Output(other,self,"DIA_Cutter_GUY_08_01");	//Co chceš?
	AI_Output(self,other,"DIA_Cutter_GUY_15_02");	//Takže Gomez tě přijal do tábora? Dobrá práce.
	AI_Output(self,other,"DIA_Cutter_GUY_08_02");	//Jestli máš zájem, mám pro tebe nějakou práci.
	AI_Output(self,other,"DIA_Cutter_GUY_08_03");	//Nedávno dorazila z Vnějšího světa donáška zboží. A s ní i nová tvář.
	AI_Output(self,other,"DIA_Cutter_GUY_08_04");	//Neboj, Bullit a jeho parta už ho pokřtili. Hehe.
	AI_Output(self,other,"DIA_Cutter_GUY_08_05");	//Vypadá to ale, že se ještě nedorazil do tábora. Tedy, zatím se tu neukázal.
	AI_Output(self,other,"DIA_Cutter_GUY_08_06");	//Jdi na místo výměny a přesvědč toho chlápka, že Starý tábor je pro něj ta správna volba.
	AI_Output(self,other,"DIA_Cutter_GUY_08_07");	//Jak ho přesvědčíš, to už nechám na tobě.
	AI_Output(self,other,"DIA_Cutter_GUY_08_08");	//Pak ho pošli do tábora, kopáč navíc do dolu není nikdy na škodu, hehe.
	Wld_InsertNpc(non_5054_paul,"OC_1");
	PAUL_OC = LOG_RUNNING;
	Log_CreateTopic(CH1_PAULOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_PAULOC,LOG_RUNNING);
	B_LogEntry(CH1_PAULOC,"Cutter, jeden z Gomezových strážců, mi řekl, abych se vypravil na místo výměny. Z vnějšího světa dorazila nová zásilka, zdá se že do Kolonie vsadili nového vězně. Zatím však do Starého tábora nedorazil. Mám zjistit proč.");
};

instance DIA_CUTTER_SUCCESS(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_success_condition;
	information = dia_cutter_success_info;
	permanent = 0;
	important = 0;
	description = "Paul už je v táboře.";
};

func int dia_cutter_success_condition()
{
	if(PAUL_OC == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_cutter_success_info()
{
	AI_Output(other,self,"DIA_Cutter_SUCCESS_15_00");	//Paul už je v táboře.
	AI_Output(self,other,"DIA_Cutter_SUCCESS_08_01");	//To je ten nováček? Dobrá práce. Gomez bude potěšen.
	AI_Output(self,other,"DIA_Cutter_SUCCESS_15_02");	//Tady máš trochu rudy.
	CreateInvItems(self,ItMiNugget,75);
	B_GiveInvItems(self,other,ItMiNugget,75);
	AI_StopProcessInfos(self);
};

instance DIA_CUTTER_FAIL(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_fail_condition;
	information = dia_cutter_fail_info;
	permanent = 0;
	important = 0;
	description = "Paul do tábora nepřijde.";
};

func int dia_cutter_fail_condition()
{
	if(PAUL_OC == LOG_FAILED)
	{
		return 1;
	};
};

func void dia_cutter_fail_info()
{
	AI_Output(other,self,"DIA_Cutter_FAIL_15_00");	//Paul do tábora nepřijde.
	AI_Output(self,other,"DIA_Cutter_FAIL_08_01");	//Ty idiote, pokašlal jsi to? To snad není možný.
	AI_Output(self,other,"DIA_Cutter_FAIL_15_02");	//Zmizni mi z očí.
	AI_StopProcessInfos(self);
};

