instance DIA_Herek_Exit(C_Info)
{
	npc = VLK_511_Herek;
	nr = 999;
	condition = DIA_Herek_Exit_Condition;
	information = DIA_Herek_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Herek_Exit_Condition()
{
	return 1;
};

func void DIA_Herek_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Herek_Bully(C_Info)
{
	npc = VLK_511_Herek;
	nr = 2;
	condition = DIA_Herek_Bully_Condition;
	information = DIA_Herek_Bully_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Herek_Bully_Condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Herek_ProtectionBully == TRUE))
	{
		return 1;
	};
};

func void DIA_Herek_Bully_Info()
{
	AI_Output(self,other,"DIA_Herek_Bully_01_00");	//Zadrž! Slyšel jsem, že jsi mluvil s Bloodwynem?
	AI_Output(other,self,"DIA_Herek_Bully_15_01");	//Proč? Co chceš?
	AI_Output(self,other,"DIA_Herek_Bully_01_02");	//To bylo vážně moudré, odmítnout mu zaplatit peníze za ochranu!
	AI_Output(self,other,"DIA_Herek_Bully_01_03");	//To znamená, že my ostatní musíme platit tvůj podíl!
	AI_Output(self,other,"DIA_Herek_Bully_01_04");	//Postarám se, aby sis na to příště vzpomněl, až s ním budeš zase mluvit...
	Npc_SetPermAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

instance DIA_Herek_Motz(C_Info)
{
	npc = VLK_511_Herek;
	nr = 2;
	condition = DIA_Herek_Motz_Condition;
	information = DIA_Herek_Motz_Info;
	permanent = 0;
	description = "A jak to jde?";
};

func int DIA_Herek_Motz_Condition()
{
	if(Herek_ProtectionBully == FALSE)
	{
		return 1;
	};
};

func void DIA_Herek_Motz_Info()
{
	AI_Output(other,self,"DIA_Herek_Motz_15_00");	//A jak to jde?
	AI_Output(self,other,"DIA_Herek_Motz_01_01");	//V tomhle táboře není pro nás dva dost místa!
	AI_Output(other,self,"DIA_Herek_Motz_15_02");	//Prosím?
	AI_Output(self,other,"DIA_Herek_Motz_01_03");	//Kdyby bylo po mém, už bys tu pěkně dlouho nebyl!
	AI_Output(self,other,"DIA_Herek_Motz_01_04");	//Víš, proč tady jsem? Během jedné noci, jako je tahle, jsem zabil tucet lidí... hehehe!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};

instance DIA_Herek_Anlegen(C_Info)
{
	npc = VLK_511_Herek;
	nr = 2;
	condition = DIA_Herek_Anlegen_Condition;
	information = DIA_Herek_Anlegen_Info;
	permanent = 1;
	description = "Takže si myslíš, že jsi jeden z těch divokejch chlapíků, ne? Proč to teda nezkusíš se mnou...";
};

func int DIA_Herek_Anlegen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Herek_Motz) || Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

func void DIA_Herek_Anlegen_Info()
{
	AI_Output(other,self,"DIA_Herek_Anlegen_15_00");	//Takže si myslíš, že jsi jeden z těch divokejch chlapíků, ne? Proč to teda nezkusíš na mně...
	AI_Output(self,other,"DIA_Herek_Anlegen_01_01");	//Chceš dostat nakládačku? Dobře, jestli to opravdu chceš!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

instance DIA_HEREK_KYLE(C_Info)
{
	npc = VLK_511_Herek;
	nr = 2;
	condition = dia_herek_kyle_condition;
	information = dia_herek_kyle_info;
	permanent = 0;
	description = "Odteď se budeš držet mimo Kyleovu chýži!";
};

func int dia_herek_kyle_condition()
{
	if((HEREK_KICKASS == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE))
	{
		return 1;
	};
};

func void dia_herek_kyle_info()
{
	AI_Output(other,self,"DIA_Herek_Kyle_15_00");	//Odteď se budeš držet mimo Kyleovu chýži!
	AI_Output(self,other,"DIA_Herek_Kyle_15_01");	//Člověče, dobrá a teď mě nech na pokoji ...
	B_LogEntry(CH1_KYLE,"Herekovi je už jasný, že v Kyleově chatrči nemá co dělat a v budoucnu ho nechá na pokoji. Můžu o tom říct Kylovi.");
	AI_StopProcessInfos(self);
};

