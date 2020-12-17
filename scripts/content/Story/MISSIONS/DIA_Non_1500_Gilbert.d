instance DIA_Gilbert_EXIT(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 999;
	condition = DIA_Gilbert_EXIT_Condition;
	information = DIA_Gilbert_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

func void DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gilbert_First(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_First_Condition;
	information = DIA_Gilbert_First_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Gilbert_First_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Gilbert_First_Info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//Co tady děláš? Moc často sem návštěvníky nepouštím, hehe!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//To byl šikovný kousek, najít tohle ukryté místo.
	B_GiveXP(XP_GilbertFound);
};

instance DIA_Gilbert_Hallo(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_Hallo_Condition;
	information = DIA_Gilbert_Hallo_Info;
	permanent = 0;
	description = "Co tady děláš?";
};

func int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

func void DIA_Gilbert_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//Už mám dost Starého tábora. Měl jsem problém s Gomezovými lidmi. Už je to delší dobu.
};

instance DIA_GILBERT_HELP(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 2;
	condition = dia_gilbert_help_condition;
	information = dia_gilbert_help_info;
	permanent = 0;
	important = 0;
	description = "Můžu ti pomoct?";
};

func int dia_gilbert_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gilbert_Hallo))
	{
		return 1;
	};
};

func void dia_gilbert_help_info()
{
	AI_Output(other,self,"DIA_Gilbert_Help_04_00");	//Můžu ti pomoci?
	AI_Output(self,other,"DIA_Gilbert_Help_04_01");	//Když se ptáš ... tak vlastně ano.
	AI_Output(self,other,"DIA_Gilbert_Help_04_02");	//Mohl by jsi zajít do Starého tábora a zeptat se Gomezových lidí, jestli si mně ještě pamatují.
	AI_Output(other,self,"DIA_Gilbert_Help_04_03");	//A co když si tě někdo pamatuje?
	AI_Output(self,other,"DIA_Gilbert_Help_04_04");	//Chci vědět, jestli se můžu vrátit do tábora, aniž bych narazil na Gomezovy naštvané chlápky.
	AI_Output(self,other,"DIA_Gilbert_Help_04_05");	//Až se trochu poptáš, tak se ke mně vrať a všechno mi řekni.
	Info_ClearChoices(dia_gilbert_help);
	Info_AddChoice(dia_gilbert_help,"Postarám se o to.",dia_gilbert_help_back);
	Info_AddChoice(dia_gilbert_help,"Co jsi vlastně udělal špatně?",dia_gilbert_help_done);
	Info_AddChoice(dia_gilbert_help,"Co jsi vlastně udělal?",dia_gilbert_help_where);
	OC_BACK = LOG_RUNNING;
	Log_CreateTopic(CH1_GILBERT,LOG_MISSION);
	B_LogEntry(CH1_GILBERT,"Gilbert, poustevník, který měl už dost života ve Starém táboře, mě požádal, abych se zpátky v táboře poptal, zdali si ho tam někdo ještě pamatuje.");
	Log_SetTopicStatus(CH1_GILBERT,LOG_RUNNING);
};

func void dia_gilbert_help_back()
{
	AI_Output(other,self,"DIA_Gilbert_Help_BACK_15_00");	//Postarám se o to.
	Info_ClearChoices(dia_gilbert_help);
};

func void dia_gilbert_help_done()
{
	AI_Output(other,self,"DIA_Gilbert_Help_Done_15_00");	//Co jsi vlastně udělal?
	AI_Output(self,other,"DIA_Gilbert_Help_Done_09_01");	//Oh, to není tak důležité. Můj návrat do tábora je důležitější.
};

func void dia_gilbert_help_where()
{
	AI_Output(other,self,"DIA_Gilbert_Help_Where_15_00");	//Kde mám začít?
	AI_Output(self,other,"DIA_Gilbert_Help_Where_09_01");	//Moje chýše byla ve vnějším kruhu tábora na tržišti. Tam jsem se dostal do potíží. Takže tam bys měl začít.
	B_LogEntry(CH1_GILBERT,"Měl bych se poptat v okolí tržiště.");
};

instance DIA_GILBERT_UND(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_und_condition;
	information = dia_gilbert_und_info;
	permanent = 0;
	description = "Promluvil jsem si s pár lidmi.";
};

func int dia_gilbert_und_condition()
{
	if(Npc_KnowsInfo(hero,info_jackal_gilbert) && Npc_KnowsInfo(hero,info_fisk_gilbert) && Npc_KnowsInfo(hero,info_dexter_gilbert))
	{
		return 1;
	};
};

func void dia_gilbert_und_info()
{
	AI_Output(other,self,"DIA_Gilbert_Und_15_00");	//Promluvil jsem si s pár lidmi.
	AI_Output(self,other,"DIA_Gilbert_Und_04_01");	//A?
	AI_Output(other,self,"DIA_Gilbert_Und_04_02");	//Jackal si na tebe a na tu situaci stále dobře pamatuje.
	AI_Output(other,self,"DIA_Gilbert_Und_04_03");	//Fisk tě stále zná, ale neví nic o žádných potížích.
	AI_Output(other,self,"DIA_Gilbert_Und_04_04");	//Dexter tě nezná.
	AI_Output(self,other,"DIA_Gilbert_Und_04_05");	//To není špatné. Ale musím si být jistý, že se tam nedostanu do problémů.
	AI_Output(self,other,"DIA_Gilbert_Und_04_06");	//Zajdi za Gravem. Je to sice jenom kopáč, ale má kontakty mezi Rudobarony.
	AI_Output(self,other,"DIA_Gilbert_Und_04_07");	//Pokud mi někdo může pomoci, tak on.
	AI_Output(self,other,"DIA_Gilbert_Und_04_08");	//Najdeš ho u vodní výpustě, kousek od hradní brány.
	B_LogEntry(CH1_GILBERT,"Gilbert mě požádal, abych si promluvil s Gravem. Pokud někdo Gilbertovi může pomoci, pak je to on. Grava najdu u vodní díry vedle hradní brány.");
};

instance DIA_GILBERT_ORE(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_ore_condition;
	information = dia_gilbert_ore_info;
	permanent = 0;
	description = "Mluvil jsem s Gravem.";
};

func int dia_gilbert_ore_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_helpgilbert))
	{
		return 1;
	};
};

func void dia_gilbert_ore_info()
{
	AI_Output(other,self,"DIA_Gilbert_Ore_15_00");	//Mluvil jsem s Gravem.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_01");	//No a?
	AI_Output(other,self,"DIA_Gilbert_Ore_04_02");	//Požaduje 500 kusů rudy za pomoc.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_03");	//500 ? Čekal jsem, že to nebude levné.
	AI_Output(other,self,"DIA_Gilbert_Ore_04_04");	//Teď mi neříkej, že nemáš rudu.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_05");	//Mám, ale ne tu.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_06");	//Mám ji ve své staré chatrči na tržišti.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_07");	//Problém je, že jsem od ní dávno ztratil klíč.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_08");	//Pokud to umíš se zámky, možná se ti povede zámek vypáčit.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_09");	//Mezičasem si ale mou chatrč určitě už někdo zabral.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_10");	//Takže se budeš muset k truhle proplížit.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_11");	//Moje chatrč bývala napravo od kopáče jménem Dusty.
	B_LogEntry(CH1_GILBERT,"Gilbert mi prozradil, kde má ukrytou rudu. Měla by být v truhle v chatrči napravo od té Dustyho.");
};

instance DIA_GILBERT_FINISHED(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_finished_condition;
	information = dia_gilbert_finished_info;
	permanent = 0;
	description = "Můžeš považovat tuhle práci za hotovou.";
};

func int dia_gilbert_finished_condition()
{
	if(ERZ_GEGEBEN == TRUE)
	{
		return 1;
	};
};

func void dia_gilbert_finished_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Gilbert_Finished_15_00");	//Je to vyřízeno.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_01");	//To znamená, že se můžu vrátit do tábora?
	AI_Output(other,self,"DIA_Gilbert_Finished_04_02");	//Přesně tak.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_03");	//Velmi dobře. Díky chlapče. Něco ti dlužím.
	AI_Output(other,self,"DIA_Gilbert_Finished_04_04");	//Myslíš tím nějakou hmatatelnou odměnu?
	AI_Output(self,other,"DIA_Gilbert_Finished_04_05");	//Tady, vem si tohle. Zasloužíš si to.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_06");	//Brzy se vrátím zpátky do tábora. Dám si ještě trochu načas.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_07");	//Rozhodně jsme se neviděli naposledy. Hehe.
	AI_StopProcessInfos(self);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,ItAt_Wolf_01,2);
		B_GiveInvItems(self,other,ItAt_Wolf_01,2);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,ItFo_Potion_Health_Perma_01,1);
		B_GiveInvItems(self,other,ItFo_Potion_Health_Perma_01,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,5);
		B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,5);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItFoBeer,2);
		B_GiveInvItems(self,other,ItFoBeer,2);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,Schutzring_Feuer2,1);
		B_GiveInvItems(self,other,Schutzring_Feuer2,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMw_1H_Axe_Old_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Axe_Old_01,1);
	}
	else
	//BUG [Fawkes]: ak padne hodnota zufallsbelohnung medzi 0 - 10 tak hrac nedostane ziadnu odmenu
	//if(zufallsbelohnung >= 10)
	{
		CreateInvItems(self,ItMw_1H_Sword_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_01,1);
	};
	OC_BACK = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_GILBERT,LOG_SUCCESS);
	B_LogEntry(CH1_GILBERT,"Gilbert byl s spokojený mou prací a jako odměnu mi dal užitečný předmět. Brzy se vrátí zpátky do Starého tábora.");
	B_GiveXP(XP_GILBERT);
};

