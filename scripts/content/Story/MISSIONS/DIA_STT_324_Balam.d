instance STT_324_BALAM_EXIT(C_Info)
{
	npc = STT_324_Balam;
	condition = stt_324_balam_exit_condition;
	information = stt_324_balam_exit_info;
	important = 0;
	permanent = 1;
	nr = 999;
	description = DIALOG_ENDE;
};

func int stt_324_balam_exit_condition()
{
	return 1;
};

func void stt_324_balam_exit_info()
{
	AI_StopProcessInfos(self);
};

instance STT_324_BALAM_DOING(C_Info)
{
	npc = STT_324_Balam;
	condition = stt_324_balam_doing_condition;
	information = stt_324_balam_doing_info;
	important = 0;
	permanent = 0;
	description = "Co tady děláš?";
};

func int stt_324_balam_doing_condition()
{
	return 1;
};

func void stt_324_balam_doing_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Co tady děláš?
	AI_Output(self,other,"Stt_324_Balam_DOING_02_73");	//Spolu s Omidem připravujeme jídlo pro Gomeze a rudobarony. Je to zatraceně nebezpečná práce!
	AI_Output(other,self,"Stt_324_Balam_DOING_03_72");	//Proč?
	AI_Output(self,other,"Stt_324_Balam_DOING_04_71");	//Řeknu ti to takhle, pokud naše jídlo nebude Gomezovi chutnat. Bude to poslední jídlo, které uvaříme.
	AI_Output(other,self,"Stt_324_Balam_DOING_05_70");	//Aha ...
};

instance DIA_BALAM_CAN(C_Info)
{
	npc = STT_324_Balam;
	nr = 3;
	condition = dia_balam_can_condition;
	information = dia_balam_can_info;
	permanent = 0;
	description = "Můžeš mě něco naučit?";
};

func int dia_balam_can_condition()
{
	if(Npc_KnowsInfo(hero,stt_324_balam_doing))
	{
		return 1;
	};
};

func void dia_balam_can_info()
{
	AI_Output(other,self,"DIA_Balam_Can_12_01");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Balam_Can_12_02");	//Můžu ti ukázat jak připravit Polévku z kořínků.
	AI_Output(self,other,"DIA_Balam_Can_12_03");	//Než jsem skončilv Kolonii, trávil jsem hodně času v divočině. Sbíral jsem bylinky a vymýšlel nové recepty.
	AI_Output(self,other,"DIA_Balam_Can_12_04");	//Jestli chceš, můžu tě ten recept naučit.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Balam, kuchař ze Starého tábora, mi může ukázat, jak uvařit Polévku z kořínků.");
};

instance DIA_BALAM_LEARN(C_Info)
{
	npc = STT_324_Balam;
	nr = 4;
	condition = dia_balam_learn_condition;
	information = dia_balam_learn_info;
	permanent = 1;
	description = "Vývar z kořinků (cena: 1 VB)";
};

func int dia_balam_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_can) && (KNOWS_SOUP == FALSE))
	{
		return 1;
	};
};

func void dia_balam_learn_info()
{
	AI_Output(other,self,"DIA_Balam_Learn_15_00");	//Ukaž mi jak připravit Vývar z kořinků.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Balam_Learn_12_01");	//Nejdříve si ohřej vodu, přiveď ji do varu.
		AI_Output(self,other,"DIA_Balam_Learn_12_02");	//Až bude vřít, vlož do kotle kořínky.
		AI_Output(self,other,"DIA_Balam_Learn_12_03");	//Pořádně směs míchej.
		AI_Output(self,other,"DIA_Balam_Learn_12_04");	//A nakonec tajemství šéfkuchaře, přidej Skřetí list.
		AI_Output(self,other,"DIA_Balam_Learn_12_05");	//Ten dá polívce úplně jinou chuť a aroma.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Umím uvařit: Polévku z kořínků.");
		B_LogEntry(GE_COOK,"Ingredience jsou: 2x Kamenný kořen, 1x Skřetí list");
		KNOWS_SOUP = TRUE;
		PrintScreen("Naučil ses uvařit: Polévku z kořínků",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

