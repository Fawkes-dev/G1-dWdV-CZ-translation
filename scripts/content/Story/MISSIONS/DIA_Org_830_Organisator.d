instance Info_ORG_830_EXIT(C_Info)
{
	npc = Org_830_Organisator;
	nr = 999;
	condition = Info_ORG_830_EXIT_Condition;
	information = Info_ORG_830_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_ORG_830_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_830_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_ORG_830_Hello(C_Info)
{
	npc = Org_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_Hello_Condition;
	information = Info_ORG_830_Hello_Info;
	permanent = 0;
	description = "Zdar! Jsem tady nový.";
};

func int Info_ORG_830_Hello_Condition()
{
	return 1;
};

func void Info_ORG_830_Hello_Info()
{
	AI_Output(other,self,"Info_ORG_830_Hello_15_00");	//Zdar! Jsem tady nový.
	AI_Output(self,other,"Info_ORG_830_Hello_13_01");	//A co?
};

instance Info_ORG_830_What(C_Info)
{
	npc = Org_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_What_Condition;
	information = Info_ORG_830_What_Info;
	permanent = 0;
	description = "Co děláš?";
};

func int Info_ORG_830_What_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_What_Info()
{
	AI_Output(other,self,"Info_ORG_830_What_15_00");	//Co tady děláš?
	AI_Output(self,other,"Info_ORG_830_What_13_01");	//Jak to vypadá? Kouřím.
	AI_Output(self,other,"Info_ORG_830_What_13_02");	//Jestli si myslíš, že tě nechám potáhnout... Zapomeň na to!
};

instance Info_ORG_830_Aufhalten(C_Info)
{
	npc = Org_830_Organisator;
	nr = 2;
	condition = Info_ORG_830_Aufhalten_Condition;
	information = Info_ORG_830_Aufhalten_Info;
	permanent = 0;
	description = "Nechceš se mě pokusit zastavit? Zeptat se mě, co tu chci nebo tak?";
};

func int Info_ORG_830_Aufhalten_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_Aufhalten_Info()
{
	AI_Output(other,self,"Info_ORG_830_Aufhalten_15_00");	//Nechceš se mě pokusit zastavit? Zeptat se mě, co tu chci nebo tak?
	AI_Output(self,other,"Info_ORG_830_Aufhalten_13_01");	//Ne. Ještě by mě to znervóznilo. Kromě toho, někdo jako ty tady moc škody nenadělá.
};

instance Info_ORG_830_Perm(C_Info)
{
	npc = Org_830_Organisator;
	nr = 3;
	condition = Info_ORG_830_Perm_Condition;
	information = Info_ORG_830_Perm_Info;
	permanent = 1;
	description = "Jaké je to uvnitř?";
};

func int Info_ORG_830_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_Perm_Info()
{
	AI_Output(other,self,"Info_ORG_830_Perm_15_00");	//Jaké je to uvnitř?
	AI_Output(self,other,"Info_ORG_830_Perm_13_01");	//Jako vždy - klid, až na pár hádek.
};

instance ORG_830_TORWACHE_MUD(C_Info)
{
	npc = Org_830_Organisator;
	condition = org_830_torwache_mud_condition;
	information = org_830_torwache_mud_info;
	important = 1;
	permanent = 0;
};

func int org_830_torwache_mud_condition()
{
	var C_Npc mud;
	mud = Hlp_GetNpc(VLK_574_Mud);
	if(Npc_GetDistToNpc(self,mud) < 500)
	{
		return TRUE;
	};
};

func void org_830_torwache_mud_info()
{
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_01");	//Podívejme se kdo je to tady. Náš dobrý přítel. Čas trochu se pobavit. Vyrazit pár zubů.
	AI_Output(other,self,"ORG_830_Torwache_MUD_Info_15_02");	//Co?
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_03");	//S tebou se nebavím. Mluvím k tvému společníkovy. Co Mude? Hehe.
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_04");	//Poslední dobou jsme se neviděli. Čas to dohnat! Hehe.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,VLK_574_Mud);
	AI_StartState(self,ZS_Attack,1,"");
	B_GiveXP(100);
};

