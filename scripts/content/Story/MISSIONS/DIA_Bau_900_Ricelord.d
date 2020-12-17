instance DIA_Ricelord_EXIT(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 999;
	condition = DIA_Ricelord_EXIT_Condition;
	information = DIA_Ricelord_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Ricelord_EXIT_Condition()
{
	return 1;
};

func void DIA_Ricelord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ricelord_Hello(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Hello_Condition;
	information = DIA_Ricelord_Hello_Info;
	permanent = 0;
	description = "Staráš se o rýžová pole, že jo?";
};

func int DIA_Ricelord_Hello_Condition()
{
	return 1;
};

func void DIA_Ricelord_Hello_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Hello_15_00");	//Staráš se o rýžová pole, že jo?
	AI_Output(self,other,"DIA_Ricelord_Hello_12_01");	//Proč? Sháníš práci?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Rýžový lord nabízí širokou škálu zboží.");
};

instance DIA_RICELORD_TEACHME(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_teachme_condition;
	information = dia_ricelord_teachme_info;
	permanent = 0;
	description = "Můžeš mě něco naučit?";
};

func int dia_ricelord_teachme_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello))
	{
		return 1;
	};
};

func void dia_ricelord_teachme_info()
{
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_01");	//Jistěže, vím jak zpracovat rostliny rýže i jak s ní vařit.
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_02");	//Ale ještě předtím, než ti něco ukážu, budeš muset strávit, tak jako ostatní, trochu času na polích.
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_03");	//Přines mi 15 rostlin rýže a budu tě učit.
	LEARN_RICELORD = LOG_RUNNING;
	Log_CreateTopic(CH1_FARMER,LOG_MISSION);
	Log_SetTopicStatus(CH1_FARMER,LOG_RUNNING);
	B_LogEntry(CH1_FARMER,"Pokud mě Rýžový Lord má něco naučit, tak musím přiložit ruku k dílu. Mám jít za farmáři na pole posbírat a přinést 15 rýžových rostlin. Teprve potom mě naučí vařit.");
};

instance DIA_RICELORD_DELIEVER(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_deliever_condition;
	information = dia_ricelord_deliever_info;
	permanent = 0;
	description = "Tady jsou ty rostliny.";
};

func int dia_ricelord_deliever_condition()
{
	if((LEARN_RICELORD == LOG_RUNNING) && (Npc_HasItems(other,itmi_plants_rice_01) >= 15))
	{
		return 1;
	};
};

func void dia_ricelord_deliever_info()
{
	AI_Output(other,self,"DIA_Ricelord_Deliever_15_00");	//Tady jsou ty rostliny.
	AI_Output(self,other,"DIA_Ricelord_Deliever_12_01");	//Aha, tak přeci jen jsi užitečný. Pokud chceš, ukážu ti jak uvařit rýži.
	AI_Output(self,other,"DIA_Ricelord_Deliever_12_02");	//Ale jenom pokud máš dost zkušeností.
	B_GiveInvItems(other,self,itmi_plants_rice_01,15);
	LEARN_RICELORD = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_FARMER,LOG_SUCCESS);
	B_LogEntry(CH1_FARMER,"Dal jsem Rýžovému Lordu jeho rostliny a souhlasil, že mi ukáže jak správně uvařit rýži.");
	B_GiveXP(XP_RICELORDTRAIN);
};

instance DIA_RICELORD_RICE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 3;
	condition = dia_ricelord_rice_condition;
	information = dia_ricelord_rice_info;
	permanent = 1;
	description = "Rýže (cena: 1 VB)";
};

func int dia_ricelord_rice_condition()
{
	if((LEARN_RICELORD == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_ricelord_deliever) && (KNOWS_RICE == FALSE))
	{
		return 1;
	};
};

func void dia_ricelord_rice_info()
{
	AI_Output(other,self,"DIA_Ricelord_Rice_15_00");	//Nauč mě jak uvařit rýži.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Ricelord_Rice_12_01");	//Začni tím, že dáš vařit vodu.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_02");	//Až začne vřít, přidej rostliny rýže do kotle.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_03");	//Musíš dát pozor abys ji nevařil moc dlouho. Jinak se převaří a můžeš ji rovnou vyhodit.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_04");	//Když ji dovaříš, dej ji do misky a můžeš jíst. Nemělo by to být nic těžkého.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Odteď umím vařit rýži.");
		B_LogEntry(GE_COOK,"Ingredience jsou: 2 rostliny rýže a 1 voda.");
		KNOWS_RICE = TRUE;
		PrintScreen("Naučil ses uvařit: Rýži",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

instance DIA_Ricelord_Arbeit(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Arbeit_Condition;
	information = DIA_Ricelord_Arbeit_Info;
	permanent = 0;
	description = "Máš pro mě nějakou práci?";
};

func int DIA_Ricelord_Arbeit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && !Npc_KnowsInfo(hero,DIA_Lefty_First) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01");	//Běž za Leem. Obvykle bývá napravo od haly.
};

instance DIA_Ricelord_TRADE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 800;
	condition = DIA_Ricelord_TRADE_Condition;
	information = DIA_Ricelord_TRADE_Info;
	permanent = 1;
	description = "Můžeme uzavřít smlouvu.";
	trade = 1;
};

func int DIA_Ricelord_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello))
	{
		return 1;
	};
};

func void DIA_Ricelord_TRADE_Info()
{
	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00");	//Můžeme uzavřít smlouvu.
	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01");	//Co mi můžeš nabídnout?
};

var int ricelord_onceaday;

instance DIA_Ricelord_LeftySentMe(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_LeftySentMe_Condition;
	information = DIA_Ricelord_LeftySentMe_Info;
	permanent = 1;
	description = "Poslal mě Lefty.";
};

func int DIA_Ricelord_LeftySentMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && (Lefty_Mission == LOG_RUNNING) && (Ricelord_AskedForWater == FALSE) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_LeftySentMe_Info()
{
	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00");	//Poslal mě Lefty.
	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01");	//Aha. Co říkal?
	Ricelord_AskedForWater = TRUE;
};

instance DIA_Ricelord_GetWater(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_GetWater_Condition;
	information = DIA_Ricelord_GetWater_Info;
	permanent = 1;
	description = "Mám přinést rolníkům vodu.";
};

func int DIA_Ricelord_GetWater_Condition()
{
	if((Ricelord_AskedForWater == TRUE) && (Lefty_Mission == LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Ricelord_GetWater_Info()
{
	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00");	//Mám přinést rolníkům vodu.
	if(Lefty_WorkDay == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01");	//Dobře. Tady je tucet láhví vody.
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02");	//Je toho asi dvakrát víc než potřebují, tak dávej pozor, aby se rozdělila rovnoměrně.
		CreateInvItems(self,ItFo_Potion_Water_01,12);
		B_GiveInvItems(self,other,ItFo_Potion_Water_01,12);
		RICELORD_ONCEADAY = Wld_GetDay();
		Ricelord_AskedForWater = FALSE;
		B_LogEntry(CH1_CarryWater,"Rýžový lord mi dal tucet lahví vody.");
		AI_StopProcessInfos(self);
	}
	else if(Lefty_WorkDay == (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00");	//To bylo včera, hochu! Bude lepší, když za ním zajdeš. Musí ti něco říci.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01");	//To bylo před pár dny, hochu! Měl bys za ním jít. Musí ti něco říci.
		AI_StopProcessInfos(self);
	};
};

instance DIA_RICELORD_LEFTY(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_lefty_condition;
	information = dia_ricelord_lefty_info;
	permanent = 0;
	description = "Vyplatí se patřit mezi tvé strážne psy?";
};

func int dia_ricelord_lefty_condition()
{
	if(Npc_KnowsInfo(hero,dia_lefty_ring) && (RIOT_RICELORD == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_ricelord_lefty_info()
{
	AI_Output(other,self,"DIA_Ricelord_Lefty_15_00");	//Vyplatí se patřit mezi tvé strážne psy?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_01");	//Platím své lidi dobře. Proč se ptáš, hledáš práci?
	AI_Output(other,self,"DIA_Ricelord_Lefty_15_02");	//Viděl jsem Leftymu na prstě pěkný prsten. Nevypadal levně.
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_03");	//Aha, má pěkný prsten?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_04");	//Vtipné, můj prsten někdo ukradnul. A říkáš, že má nový prsten?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_05");	//Dej mi minutku, musím si s ním promluvit.
	CreateInvItems(self,ricelords_ring,1);
	EquipItem(self,ricelords_ring);
	Npc_RemoveInvItems(Org_844_Lefty,ricelords_ring,1);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,Org_844_Lefty);
	AI_StartState(self,ZS_Attack,1,"");
};

