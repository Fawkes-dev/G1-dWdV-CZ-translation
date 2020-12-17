func void schuerfen_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SCHUERFEN;
		AI_ProcessInfos(her);
	};
};

instance PC_NOSCHUERFEN(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_noschuerfen_condition;
	information = pc_noschuerfen_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int pc_noschuerfen_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SCHUERFEN)
	{
		return TRUE;
	};
};

func void pc_noschuerfen_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SCHUERFEN_N(C_Info)
{
	npc = PC_Hero;
	condition = pc_schuerfen_n_condition;
	information = pc_schuerfen_n_info;
	important = 0;
	permanent = 1;
	description = "Začít kopat rudu.";
};

func int pc_schuerfen_n_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SCHUERFEN)
	{
		return TRUE;
	};
};

func void pc_schuerfen_n_info()
{
	var int zufallsmenge;
	var int anzahl;
	var C_Npc he;
	zufallsmenge = Hlp_Random(180);
	if(zufallsmenge <= 145)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 170)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 155)
	{
		anzahl = 1;
	};
	if(zufallsmenge >= 160)
	{
		anzahl = 3;
	};
	if(zufallsmenge >= 165)
	{
		anzahl = 2;
	};
	he = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(he))
	{
		CreateInvItems(self,ItMiNugget,anzahl);
		if(anzahl == 0)
		{
			PrintScreen("Kousky rudy prolétají kolem!",-1,10,"font_old_20_white.tga",1);
		};
		if(anzahl == 1)
		{
			PrintScreen("Získal jsi hrudku rudy!",-1,30,"font_old_20_white.tga",1);
		};
		if(anzahl == 2)
		{
			PrintScreen("Získal jsi 2 hrudky rudy!",-1,30,"font_old_20_white.tga",1);
		};
		if(anzahl == 3)
		{
			PrintScreen("Získal jsi 3 hrudky rudy!",-1,30,"font_old_20_white.tga",1);
		};
	};
};

