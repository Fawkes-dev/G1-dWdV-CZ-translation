func void stompherb_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_STOMPHERB;
		AI_ProcessInfos(her);
	};
};

instance PC_NOSTOMP(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nostomp_condition;
	information = pc_nostomp_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int pc_nostomp_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_STOMPHERB)
	{
		return TRUE;
	};
};

func void pc_nostomp_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

instance PC_JOINT1(C_Info)
{
	npc = PC_Hero;
	condition = pc_joint1_condition;
	information = pc_joint1_info;
	permanent = 1;
	description = "Grüner Novize";
};

func int pc_joint1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_STOMPHERB) && (KNOWS_STOMPHERB == TRUE))
	{
		return TRUE;
	};
};

func void pc_joint1_info()
{
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 1)
	{
		Npc_RemoveInvItems(hero,ItMi_Plants_Swampherb_01,1);
		CreateInvItems(hero,ItMiJoint_1,1);
		PrintScreen("Vyrobil jsi: Zeleného novice!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

instance PC_JOINT2(C_Info)
{
	npc = PC_Hero;
	condition = pc_joint2_condition;
	information = pc_joint2_info;
	permanent = 1;
	description = "Schwarzer Weiser";
};

func int pc_joint2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_STOMPHERB) && (KNOWS_STOMPHERB == TRUE))
	{
		return TRUE;
	};
};

func void pc_joint2_info()
{
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 2)
	{
		Npc_RemoveInvItems(hero,ItMi_Plants_Swampherb_01,2);
		CreateInvItems(hero,ItMiJoint_2,1);
		PrintScreen("Vyrobil jsi: Severní soumrak!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

instance PC_JOINT3(C_Info)
{
	npc = PC_Hero;
	condition = pc_joint3_condition;
	information = pc_joint3_info;
	permanent = 1;
	description = "Traumruf";
};

func int pc_joint3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_STOMPHERB) && (KNOWS_STOMPHERB == TRUE))
	{
		return TRUE;
	};
};

func void pc_joint3_info()
{
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 3)
	{
		Npc_RemoveInvItems(hero,ItMi_Plants_Swampherb_01,3);
		CreateInvItems(hero,ItMiJoint_3,1);
		PrintScreen("Vyrobil jsi: Přivolání snu!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nedostatek ingrediencí!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

