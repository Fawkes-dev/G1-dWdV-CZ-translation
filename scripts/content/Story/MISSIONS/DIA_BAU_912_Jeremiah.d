instance DIA_Jeremiah_EXIT(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 999;
	condition = DIA_Jeremiah_EXIT_Condition;
	information = DIA_Jeremiah_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

func void DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Jeremiah_Hallo(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_Hallo_Condition;
	information = DIA_Jeremiah_Hallo_Info;
	permanent = 0;
	description = "Co děláš?";
};

func int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

func void DIA_Jeremiah_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//Vyrábím rýžovou pálenku, hochu.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//Tady - vezmi láhev. Ale neříkej to Silasovi.
	CreateInvItems(self,ItFoBooze,1);
	B_GiveInvItems(self,other,ItFoBooze,1);
};

var int Jeremiah_Bauer;

instance DIA_Jeremiah_PERM(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_PERM_Condition;
	information = DIA_Jeremiah_PERM_Info;
	permanent = 1;
	description = "Jak to chodí v palírně?";
};

func int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

func void DIA_Jeremiah_PERM_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00");	//Jak to chodí v palírně?
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//Jen stěží dokážu ty chlapy udržet na uzdě. Člověče, jen by pili!
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//Je to vážně dobré. Dokud mám co dělat, poskoci Rýžového Lorda mě nechávají na pokoji.
	Jeremiah_Bauer = TRUE;
};

instance DIA_Jeremiah_Horatio(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = DIA_Jeremiah_Horatio_Condition;
	information = DIA_Jeremiah_Horatio_Info;
	permanent = 0;
	description = "Co mi můžeš říci o Rýžovém Lordovi?";
};

func int DIA_Jeremiah_Horatio_Condition()
{
	if(Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

func void DIA_Jeremiah_Horatio_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//Co mi můžeš říci o Rýžovém Lordovi?
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//Je to zpropadenej gauner! Jeho lidi vyhledávají slabé, které pak nutí pracovat na polích.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//Jediný, kdo by se mu mohl postavit, je Horatio. Ten ale nechce násilí.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//Jednou jsem ho slyšel říkat, že by Rýžového Lorda nejraději praštil po hlavě, ale nikdy by to doopravdy neudělal.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//Bylo by to proti jeho přesvědčení.
};

instance DIA_JEREMIAH_LEARN(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = dia_jeremiah_learn_condition;
	information = dia_jeremiah_learn_info;
	permanent = 0;
	description = "Můžeš mi ukázat jak se pálí Rýžová pálenka?";
};

func int dia_jeremiah_learn_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jeremiah_Hallo))
	{
		return 1;
	};
};

func void dia_jeremiah_learn_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Learn_15_00");	//Můžeš mi ukázat, jak se pálí Rýžová pálenka?
	AI_Output(self,other,"DIA_Jeremiah_Learn_04_01");	//Určitě ti můžu ukázat jak na to. Jen potřebuješ mít dost zkušeností, chlapče.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Jeremiáš mi může ukázat jak připravím Rýžovou pálenku.");
};

instance DIA_JEREMIAH_BOOZE(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = dia_jeremiah_booze_condition;
	information = dia_jeremiah_booze_info;
	permanent = 1;
	description = "Rýžová pálenka (cena: 1 VB)";
};

func int dia_jeremiah_booze_condition()
{
	if(Npc_KnowsInfo(hero,dia_jeremiah_learn) && (KNOWS_BOOZE == FALSE))
	{
		return 1;
	};
};

func void dia_jeremiah_booze_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Booze_15_00");	//Chci se naučit výrobu Rýžové pálenky.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_01");	//Dobrá. Přimíchej do čisté vody trochu alkoholu.
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_02");	//Pak do směsy přihoď rostliny rýže.
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_03");	//Buď ale opatrný, aby jsi směs nepřehřál. Pokazilo by to celou chuť. 
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Rýžová pálenka - 1x voda, 1x alkohol, 1x rostlina rýže.");
		KNOWS_BOOZE = TRUE;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

