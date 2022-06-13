func void smithweapon_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SMITHWEAPON;
		AI_ProcessInfos(her);
	};
};

instance PC_NOSMITH(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nosmith_condition;
	information = pc_nosmith_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int pc_nosmith_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	{
		return TRUE;
	};
};

func void pc_nosmith_info()
{
	CreateInvItems(self,ItMiSwordblade,1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_SWORD_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_01_condition;
	information = pc_smith_itmw_1h_sword_01_info;
	important = 0;
	permanent = 1;
	description = "Primitivní meč (Potřebná síla: 25, Zranění: 25)";
};

func int pc_smith_itmw_1h_sword_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_GROBESSCHWERT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_01_info()
{
	CreateInvItem(hero,itmw_1h_sword_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_LIGHTGUARDSSWORD_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_lightguardssword_03_condition;
	information = pc_smith_itmw_1h_lightguardssword_03_info;
	important = 0;
	permanent = 1;
	description = "Lehký meč stráže (Potřebná síla: 30, Zranění: 30)";
};

func int pc_smith_itmw_1h_lightguardssword_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_LEICHTESGARDESCHWERT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_lightguardssword_03_info()
{
	CreateInvItem(hero,itmw_1h_lightguardssword_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_SWORD_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_03_condition;
	information = pc_smith_itmw_1h_sword_03_info;
	important = 0;
	permanent = 1;
	description = "Meč stráže (Potřebná síla: 40, Zranění: 40)";
};

func int pc_smith_itmw_1h_sword_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_GARDESCHWERT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_03_info()
{
	CreateInvItem(hero,itmw_1h_sword_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_SWORD_BROAD_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_broad_04_condition;
	information = pc_smith_itmw_1h_sword_broad_04_info;
	important = 0;
	permanent = 1;
	description = "Strážcova ruka (Potřebná síla: 75, Zranění: 80)";
};

func int pc_smith_itmw_1h_sword_broad_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_GARDISTENHAND == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_broad_04_info()
{
	CreateInvItem(hero,itmw_1h_sword_broad_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_MACE_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_01_condition;
	information = pc_smith_itmw_1h_mace_01_info;
	important = 0;
	permanent = 1;
	description = "Palcát (Potřebná síla: 25, Zranění: 30)";
};

func int pc_smith_itmw_1h_mace_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_STREITKOLBEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_01_info()
{
	CreateInvItem(hero,itmw_1h_mace_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_MACE_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_04_condition;
	information = pc_smith_itmw_1h_mace_04_info;
	important = 0;
	permanent = 1;
	description = "Ocelový hrot (Potřebná síla: 32, Zranění: 38)";
};

func int pc_smith_itmw_1h_mace_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_STAHLZUNGE == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_04_info()
{
	CreateInvItem(hero,itmw_1h_mace_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_SWORD_05(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_05_condition;
	information = pc_smith_itmw_1h_sword_05_info;
	important = 0;
	permanent = 1;
	description = "Válečný meč (Potřebná síla: 42, Zranění: 42)";
};

func int pc_smith_itmw_1h_sword_05_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_KRIEGSSCHWERT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_05_info()
{
	CreateInvItem(hero,itmw_1h_sword_05_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_2H_SWORD_LIGHT_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_01_condition;
	information = pc_smith_itmw_2h_sword_light_01_info;
	important = 0;
	permanent = 1;
	description = "Lehký obouruční meč (Potřebná síla: 65, Zranění: 65)";
};

func int pc_smith_itmw_2h_sword_light_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_LEICHTER2H == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_01_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_2H_SWORD_LIGHT_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_02_condition;
	information = pc_smith_itmw_2h_sword_light_02_info;
	important = 0;
	permanent = 1;
	description = "Šavle správce (Potřebná síla: 70, Zranění: 70)";
};

func int pc_smith_itmw_2h_sword_light_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_HüTERKLINGE == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_02_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_2H_SWORD_LIGHT_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_04_condition;
	information = pc_smith_itmw_2h_sword_light_04_info;
	important = 0;
	permanent = 1;
	description = "Šavle krále (Potřebná síla: 75, Zranění: 75)";
};

func int pc_smith_itmw_2h_sword_light_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_KöNIGSKLINGE == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_04_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ROTER_WIND(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_roter_wind_condition;
	information = pc_smith_roter_wind_info;
	important = 0;
	permanent = 1;
	description = "Rudý vítr (Potřebná síla: 100, Zranění: 105)";
};

func int pc_smith_roter_wind_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_ROTER_WIND == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_roter_wind_info()
{
	CreateInvItem(hero,roter_wind_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_MACE_WAR_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_war_01_condition;
	information = pc_smith_itmw_1h_mace_war_01_info;
	important = 0;
	permanent = 1;
	description = "Morning Star (Potřebná síla: 35, Zranění: 40)";
};

func int pc_smith_itmw_1h_mace_war_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_AXT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_war_01_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_WAR_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_war_02_condition;
	information = pc_smith_itmw_1h_war_02_info;
	important = 0;
	permanent = 1;
	description = "Ocelový palcát (Potřebná síla: 36, Zranění: 41)";
};

func int pc_smith_itmw_1h_war_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_STAHLGEFLECHT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_war_02_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_1H_WAR_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_war_03_condition;
	information = pc_smith_itmw_1h_war_03_info;
	important = 0;
	permanent = 1;
	description = "Drtič kamene (Potřebná síla: 37, Zranění: 42)";
};

func int pc_smith_itmw_1h_war_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_STEINBRECHER == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_war_03_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_2H_SWORD_LIGHT_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_03_condition;
	information = pc_smith_itmw_2h_sword_light_03_info;
	important = 0;
	permanent = 1;
	description = "Lehká bojová sekyra (Potřebná síla: 70, Zranění: 80)";
};

func int pc_smith_itmw_2h_sword_light_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_SöLDNERKLINGE == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_03_info()
{
	CreateInvItem(hero,itmw_2h_axe_light_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_2H_SWORD_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_01_condition;
	information = pc_smith_itmw_2h_sword_01_info;
	important = 0;
	permanent = 1;
	description = "Válečná sekyra (Potřebná síla: 80, Zranění: 90)";
};

func int pc_smith_itmw_2h_sword_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_ZWEIHĺNDER == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_01_info()
{
	CreateInvItem(hero,itmw_2h_axe_heavy_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_SMITH_ITMW_2H_SWORD_HEAVY_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_heavy_02_condition;
	information = pc_smith_itmw_2h_sword_heavy_02_info;
	important = 0;
	permanent = 1;
	description = "Hlas válečníka (Potřebná síla: 90, Zranění: 100)";
};

func int pc_smith_itmw_2h_sword_heavy_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_ZORNSTAHL == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_heavy_02_info()
{
	CreateInvItem(hero,itmw_2h_axe_heavy_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Zbraň vyrobena!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

