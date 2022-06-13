instance DIA_SCAR_EXIT(C_Info)
{
	npc = EBR_101_Scar;
	nr = 999;
	condition = DIA_SCAR_EXIT_Condition;
	information = DIA_SCAR_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_SCAR_EXIT_Condition()
{
	return 1;
};

func void DIA_SCAR_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SCAR_Hello(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Hello_Condition;
	information = DIA_SCAR_Hello_Info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int DIA_SCAR_Hello_Condition()
{
	return 1;
};

func void DIA_SCAR_Hello_Info()
{
	AI_Output(other,self,"DIA_SCAR_Hello_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_SCAR_Hello_08_01");	//Říkají mi Scar.
};

instance DIA_SCAR_What(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_What_Condition;
	information = DIA_SCAR_What_Info;
	permanent = 0;
	description = "Co je tvá práce?";
};

func int DIA_SCAR_What_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

func void DIA_SCAR_What_Info()
{
	AI_Output(other,self,"DIA_SCAR_What_15_00");	//Co je tvá práce?
	AI_Output(self,other,"DIA_SCAR_What_08_01");	//Spolu s Artem dáváme pozor, aby se nikdo nedostal ke Gomezovi bez pozvání.
	AI_Output(self,other,"DIA_SCAR_What_08_02");	//A já dávám pozor na ženy, aby je nikdo nerušil.
};

instance DIA_SCAR_Frau(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Frau_Condition;
	information = DIA_SCAR_Frau_Info;
	permanent = 0;
	description = "Když mě sem uvrhli, viděl jsem jednu ženu, jak ji posílají dolů se zbožím.";
};

func int DIA_SCAR_Frau_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_What))
	{
		return 1;
	};
};

func void DIA_SCAR_Frau_Info()
{
	AI_Output(other,self,"DIA_SCAR_Frau_15_00");	//Když mě sem uvrhli, viděl jsem jednu ženu, jak ji posílají dolů se zbožím.
	AI_Output(self,other,"DIA_SCAR_Frau_08_01");	//No a?
	AI_Output(other,self,"DIA_SCAR_Frau_15_02");	//Je tady?
	AI_Output(self,other,"DIA_SCAR_Frau_08_03");	//Poslyš, jestli se ti líbí, dám ti jednu radu. Zapomeň na ni.
	AI_Output(self,other,"DIA_SCAR_Frau_08_04");	//Jenom sem přišla a Gomez ji zamkl v místnosti.
	AI_Output(self,other,"DIA_SCAR_Frau_08_05");	//Až s ní bude hotový, mohl by ji poslat dolu. Ale teď je JEHO - takže bude lepší, když na ni zapomeneš.
};

instance DIA_SCAR_PERM(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_PERM_Condition;
	information = DIA_SCAR_PERM_Info;
	permanent = 1;
	description = "Můžeš mi něco říci o Gomezovi?";
};

func int DIA_SCAR_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

func void DIA_SCAR_PERM_Info()
{
	AI_Output(other,self,"DIA_SCAR_PERM_15_00");	//Můžeš mi něco říci o Gomezovi?
	AI_Output(self,other,"DIA_SCAR_PERM_08_01");	//Všechno, co potřebuješ vědět je to, že je to nejmocnější muž v kolonii.
	AI_Output(self,other,"DIA_SCAR_PERM_08_02");	//Dostane, co chce, ale to, co chce nejvíc, je moc.
};

instance DIA_SCAR_RING(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_ring_condition;
	information = dia_scar_ring_info;
	permanent = 0;
	important = 1;
};

func int dia_scar_ring_condition()
{
	if(Npc_HasItems(other,scarsring) >= 1)
	{
		return 1;
	};
};

func void dia_scar_ring_info()
{
	AI_Output(self,other,"DIA_SCAR_Ring_15_00");	//Hej ty!
	AI_Output(self,other,"DIA_SCAR_Ring_08_01");	//Kde jsi vzal ten prsten?
	AI_Output(other,self,"DIA_SCAR_Ring_08_02");	//Já ...
	AI_Output(self,other,"DIA_SCAR_Ring_08_03");	//Tys mi ho ukrad, že?
	AI_Output(self,other,"DIA_SCAR_Ring_08_04");	//Jen počkej ty zmetku, teď je po tobě!
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
};

instance DIA_SCAR_SCBARON(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_scbaron_condition;
	information = dia_scar_scbaron_info;
	permanent = 0;
	important = 1;
};

func int dia_scar_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_scar_scbaron_info()
{
	AI_Output(self,other,"DIA_SCAR_SCBARON_15_00");	//Zvolil jsi správně. Hehe.
	AI_Output(self,other,"DIA_SCAR_SCBARON_08_01");	//Život Rudobarona se ti bude líbit, věř mi.
	AI_Output(self,other,"DIA_SCAR_SCBARON_08_02");	//My Rudobaroni jsme vládci Kolonie, a ty jsi teď jedním z nás.
	AI_StopProcessInfos(self);
};

instance DIA_SCAR_RAEUBER(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_raeuber_condition;
	information = dia_scar_raeuber_info;
	permanent = 0;
	important = 1;
};

func int dia_scar_raeuber_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};
};

func void dia_scar_raeuber_info()
{
	AI_Output(self,other,"DIA_SCAR_RAEUBER_15_01");	//Dobře, že jsi přišel. Mám pro tebe práci.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_02");	//Před nějakou dobou uteklo několik kopáčů z tábora, odnesli sebou celou hromadu rudy.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_03");	//Když se to doneslo ke Gomezovi byl vteky bez sebe. Ruda ho nezajímá, spíš ho štve jeho reputace, která je teď ... pošramocená.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_04");	//Představ si, že by podobný nápad dostalo víc kopáčů a utekli by z tábora i s naším sbožím. Něco takového nemůžeme dovolit.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_05");	//Je na čase, aby někdo těm uprchlým kopáčům zatnul tipec.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_06");	//Ten někdo jsi TY.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_07");	//Hodně běháš po Kolonii, určitě na ty uprchlíky narazíš. Až se s nimi potkáš, dej jim lekci, na kterou nezapomenou.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_08");	//Nemůžu ti přesně říci, kde hledat. Pravděpodobně se rozprchli po Kolonii, jsou z nich jenom lapkové, pochybuju, že by se přidali k některému z táborů.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_09");	//Jestli je najdeš, vyřiď je. Jestli najdeš rudu, kterou ukradli, tak si ji můžeš nechat. Gomeze zajímají jenom kopáči.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_10");	//Až je vyřídíš, tak vem nějaký důkaz jejich smrti a vrať se za mnou. Snaž se s nimi vypořádat co nejrychleji, Gomez není znám svou trpělivostí.
	SCAR_QUEST = LOG_RUNNING;
	Log_CreateTopic(CH2_SCARQUEST,LOG_MISSION);
	Log_SetTopicStatus(CH2_SCARQUEST,LOG_RUNNING);
	B_LogEntry(CH2_SCARQUEST,"Rudobaron Scar mi dal za úkol vypátrat skupinku kopáčů, kteří uprchli ze Starého tábora a okradli Gomeze. Netuší kde mohou být, musím je vypátrat sám.");
	AI_StopProcessInfos(self);
};

instance DIA_SCAR_FIN(C_Info)
{
	npc = EBR_101_Scar;
	nr = 1;
	condition = dia_scar_fin_condition;
	information = dia_scar_fin_info;
	permanent = 0;
	important = 0;
	description = "Ti lapkové jsou vyřízeni.";
};

func int dia_scar_fin_condition()
{
	if((SCAR_QUEST == LOG_RUNNING) && (Npc_HasItems(other,ore_bandits_message) >= 1) && (Npc_HasItems(other,ore_bandits_message2) >= 1) && (Npc_HasItems(other,ore_bandits_message3) >= 1) && (Npc_HasItems(other,ore_bandits_message4) >= 1))
	{
		return 1;
	};
};

func void dia_scar_fin_info()
{
	AI_Output(other,self,"DIA_SCAR_FIN_15_01");	//Ti lapkové jsou vyřízeni.
	AI_Output(self,other,"DIA_SCAR_FIN_08_02");	//Dobře, hehe. Věděl jsem, že pro tuhle prácičku jsi byl ten správny člověk. Máš sebou nějaké důkazy?
	AI_Output(other,self,"DIA_SCAR_FIN_08_03");	//Našel jsem tyto deníky. Zmiňují se v nich jak uprchli ze Starého tábora a co plánovali udělat s rudou.
	AI_Output(self,other,"DIA_SCAR_FIN_08_04");	//Podívejme se.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_SCAR_FIN_08_05");	//Dobrá práce. Gomez bude velice potěšen.
	AI_Output(self,other,"DIA_SCAR_FIN_08_06");	//Řeknu Stoneovi, aby ti prodal Těžkou zbroj Stráží. Myslím, že se můžeš odteď přidat mezi naši elitní stráž.
	AI_Output(self,other,"DIA_SCAR_FIN_08_07");	//Teď jdi, žádnou další práci pro tebe nemám.
	SCAR_QUEST = LOG_SUCCESS;
	Log_SetTopicStatus(CH2_SCARQUEST,LOG_SUCCESS);
	B_LogEntry(CH2_SCARQUEST,"Donesl jsem Scarovi deníky uprchlíků jako důkaz mého úspěchu. Byl potěšen, a říkal, že Gomez bude určitě taky až o tom uslyší. Nedostal jsem žádnou hmatatelnou odměnu, ale slíbil, že si promluví se Stone-em o Těžké zbroji Strážců. Měl bych se za ním zastavit.");
	B_GiveXP(XP_SCARRAEUBER);
	AI_StopProcessInfos(self);
};

