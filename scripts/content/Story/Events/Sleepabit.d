func void PC_Sleep(var int t)
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if(Wld_IsTime(0,0,t,0))
	{
		Wld_SetTime(t,0);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t,0);
	};
	PrintScreen("Dobře ses vyspal a výborně sis odpočinul!",-1,-1,"font_old_20_white.tga",3);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	PrintGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
	B_SayOverlay(hero,NULL,"$Awake");
};

func void sleepabit_s1()
{
	var C_Npc her;
	var C_Npc rock;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SLEEPABIT;
		AI_ProcessInfos(her);
	};
};

instance PC_NoSleep(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_NoSleep_Condition;
	information = PC_NoSleep_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int PC_NoSleep_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_NoSleep_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};

instance PC_SleepTime_Morning(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Morning_Condition;
	information = PC_SleepTime_Morning_Info;
	important = 0;
	permanent = 1;
//	description = "Bis zum nächsten Morgen schlafen";
	description = "Spi až do rána";
};

func int PC_SleepTime_Morning_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_SleepTime_Morning_Info()
{
	PC_Sleep(7);
	if(Kapitel < 3)
	{
		B_ExchangeRoutine(PC_Psionic,"START");
	};
};

instance PC_SleepTime_Noon(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Noon_Condition;
	information = PC_SleepTime_Noon_Info;
	important = 0;
	permanent = 1;
//	description = "Bis Mittags schlafen";
	description = "Spi až do odpoledne";
};

func int PC_SleepTime_Noon_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_SleepTime_Noon_Info()
{
	PC_Sleep(12);
	if(Kapitel < 3)
	{
		B_ExchangeRoutine(PC_Psionic,"START");
	};
};

instance PC_SleepTime_Evening(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Evening_Condition;
	information = PC_SleepTime_Evening_Info;
	important = 0;
	permanent = 1;
//	description = "Bis zum nächsten Abend schlafen";
	description = "Spi až do večera";
};

func int PC_SleepTime_Evening_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_SleepTime_Evening_Info()
{
	PC_Sleep(20);
	if(Kapitel < 3)
	{
		B_ExchangeRoutine(PC_Psionic,"START");
	};
};

instance PC_SleepTime_Midnight(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Midnight_Condition;
	information = PC_SleepTime_Midnight_Info;
	important = 0;
	permanent = 1;
//	description = "Bis Mitternacht schlafen";
	description = "Spi až do půlnoci";
};

func int PC_SleepTime_Midnight_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_SleepTime_Midnight_Info()
{
	PC_Sleep(0);
	if(Kapitel < 3)
	{
		B_ExchangeRoutine(PC_Psionic,"START");
	};
};

