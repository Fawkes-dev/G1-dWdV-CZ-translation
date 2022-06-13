instance DIA_ORG_833_Buster(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster_Condition;
	information = DIA_ORG_833_Buster_Info;
	important = 1;
	permanent = 0;
};

func int DIA_ORG_833_Buster_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01");	//Nevypadáš moc hbitě. Mohl bych ti pomoci.
};

instance DIA_ORG_833_Buster_Exit(C_Info)
{
	npc = ORG_833_Buster;
	nr = 999;
	condition = DIA_ORG_833_Buster_Exit_Condition;
	information = DIA_ORG_833_Buster_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORG_833_Buster3(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster3_Condition;
	information = DIA_ORG_833_Buster3_Info;
	important = 0;
	permanent = 0;
	description = "Jak mi můžeš pomoci?";
};

func int DIA_ORG_833_Buster3_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster3_Info()
{
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//A jak?
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Můžu ti ukázat, jak ovládat své tělo. To je umění AKROBACIE.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Bandita Buster mě naučí umění AKROBACIE.");
};

var int buster_learned;

instance DIA_ORG_833_BUSTER_FIX(C_Info)
{
	npc = ORG_833_Buster;
	condition = dia_org_833_buster_fix_condition;
	information = dia_org_833_buster_fix_info;
	important = 0;
	permanent = 1;
	description = "Akrobace (cena: 10 VB)";
};

func int dia_org_833_buster_fix_condition()
{
	if(Npc_KnowsInfo(hero,DIA_ORG_833_Buster3) && (BUSTER_LEARNED == FALSE))
	{
		return 1;
	};
};

func void dia_org_833_buster_fix_info()
{
	if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
	{
		AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Chci se zlepšit.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Brzy získáš kontrolu nad svým tělem a budeš schopen skákat mnohem dál.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Naučil ses, jak se stočit a jak nejlépe při pádu dopadnout na zem. Ale nezapomeň - nejsi nesmrtelný!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Akrobacie může být také velmi užitečná v boji. Můžeš velmi rychle měnit vzdálenost mezi tebou a tvým nepřítelem. Hodně štěstí!
		BUSTER_LEARNED = TRUE;
	};
};

