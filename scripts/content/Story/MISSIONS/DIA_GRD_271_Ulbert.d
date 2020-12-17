instance GRD_271_ULBERT_Exit(C_Info)
{
	npc = GRD_271_Ulbert;
	nr = 999;
	condition = GRD_271_ULBERT_Exit_Condition;
	information = GRD_271_ULBERT_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int GRD_271_ULBERT_Exit_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance GRD_271_ULBERT_KEY(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_KEY_Condition;
	information = GRD_271_ULBERT_KEY_Info;
	important = 0;
	permanent = 0;
	description = "Co je v tom skladišti?";
};

func int GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_KEY_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_KEY_Info_15_01");	//Co je v tom skladišti?
	AI_Output(self,other,"GRD_271_ULBERT_KEY_Info_07_02");	//Do toho ti nic není.
};

instance GRD_271_ULBERT_TRICK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_TRICK_Condition;
	information = GRD_271_ULBERT_TRICK_Info;
	important = 0;
	permanent = 0;
	description = "Když tady jsi tak dlouho, musíš mít z toho žízeň.";
};

func int GRD_271_ULBERT_TRICK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_key))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_TRICK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_TRICK_Info_15_01");	//Když tady jsi tak dlouho, musíš mít z toho žízeň.
	AI_Output(self,other,"GRD_271_ULBERT_TRICK_Info_07_02");	//To si piš! Člověče, mohl bych to do sebe lejt! A co ty?
	Log_CreateTopic(CH2_StorageShed,LOG_MISSION);
	Log_SetTopicStatus(CH2_StorageShed,LOG_RUNNING);
	B_LogEntry(CH2_StorageShed,"Strážce Ulbert hlídá skladiště ve Starém dole. Měl bych mu dát něco k pití!");
};

instance GRD_271_ULBERT_DRINK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_DRINK_Condition;
	information = GRD_271_ULBERT_DRINK_Info;
	important = 0;
	permanent = 0;
	description = "(podej nápoj)";
};

func int GRD_271_ULBERT_DRINK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && (Npc_HasItems(hero,ItFoBeer) || Npc_HasItems(hero,ItFoWine) || Npc_HasItems(hero,ItFoBooze)))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_DRINK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRINK_Info_15_01");	//Tady máš, dej si pořádně na mě!
	AI_Output(self,other,"GRD_271_ULBERT_DRINK_Info_07_02");	//Díky.
	if(Npc_HasItems(hero,ItFoBeer))
	{
		B_GiveInvItems(hero,self,ItFoBeer,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBeer);
	}
	else if(Npc_HasItems(hero,ItFoWine))
	{
		B_GiveInvItems(hero,self,ItFoWine,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoWine);
	}
	else if(Npc_HasItems(hero,ItFoBooze))
	{
		B_GiveInvItems(hero,self,ItFoBooze,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBooze);
	};
};

instance GRD_271_ULBERT_DRUNK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_DRUNK_Condition;
	information = GRD_271_ULBERT_DRUNK_Info;
	important = 0;
	permanent = 0;
	description = "Je TEĎ v tom skladišti něco mimořádného?";
};

func int GRD_271_ULBERT_DRUNK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drink))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_DRUNK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_01");	//Je TEĎ v tom skladišti něco mimořádného?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_02");	//Nějaké truhly, ve kterých skladujeme zásoby. Ztratil se ale klíč.
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_03");	//Ztratil?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_04");	//Vsadím se, že v tom má prsty Aleph. Tomu klukovi se nedá věřit.
	B_LogEntry(CH2_StorageShed,"Když jsem dal Ulbertovi napít, řekl mi, že ztratil klíč od truhlic. Údajně v tom má prsty kopáč Aleph!");
};

instance GRD_271_ULBERT_LOCK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_LOCK_Condition;
	information = GRD_271_ULBERT_LOCK_Info;
	important = 0;
	permanent = 0;
	description = "(odlákej Ulberta)";
};

func int GRD_271_ULBERT_LOCK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_LOCK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_LOCK_Info_15_01");	//Poslyš, Ian sedí s ostatními dole a opékají si tam maso.
	AI_Output(self,other,"GRD_271_ULBERT_LOCK_Info_07_02");	//Cože? Beze mě? Dobře, vezmu si svůj díl.
	B_LogEntry(CH2_StorageShed,"Dostat Ulberta ze skladiště bylo snadné. Nepůsobí příliš bystrým dojmem!");
	Npc_ExchangeRoutine(self,"away");
	AI_StopProcessInfos(self);
};

instance GRD_271_ULBERT_ANGRY(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_ANGRY_Condition;
	information = GRD_271_ULBERT_ANGRY_Info;
	important = 1;
	permanent = 0;
};

func int GRD_271_ULBERT_ANGRY_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_lock) && (Npc_GetDistToWP(hero,"OM_CAVE1_49") < 600))
	{
		return TRUE;
	};
};

func void GRD_271_ULBERT_ANGRY_Info()
{
	AI_Output(self,other,"GRD_271_ULBERT_ANGRY_Info_07_01");	//Hej, ty, tam se vůbec žádné maso neopéká!
	AI_Output(other,self,"GRD_271_ULBERT_ANGRY_Info_15_02");	//Och... ech... To jsem se musel splést! Pěknej den!
	B_GiveXP(XP_LureUlbertAway);
	B_LogEntry(CH2_StorageShed,"Znovu jsem potkal Ulberta. Člověče, ten vůbec nepochopil, že jsem ho zatáhl do té hry. Tak naivní je ten chlapík!");
	Log_SetTopicStatus(CH2_StorageShed,LOG_SUCCESS);
	Npc_ExchangeRoutine(self,"start");
	AI_StopProcessInfos(self);
};

