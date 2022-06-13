instance GUR_1211_BaalLukor(Npc_Default)
{
	name[0] = "Baal Lukor";
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GUR;
	level = 50;
	voice = 13;
	id = 1211;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
	attribute[ATR_HITPOINTS_MAX] = 418;
	attribute[ATR_HITPOINTS] = 418;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,lukors_keule);
	daily_routine = Rtn_start_1211;
	fight_tactic = FAI_HUMAN_Strong;
};

func void Rtn_start_1211()
{
	TA_Guard(23,0,16,0,"GRYD_025");
	TA_Guard(16,0,23,0,"GRYD_025");
};

func void Rtn_Follow_1211()
{
	TA_FollowPC(23,0,16,0,"GRYD_025");
	TA_FollowPC(16,0,23,0,"GRYD_025");
};

func void Rtn_WaitInSideTunnelOne_1211()
{
	TA_Stay(23,0,16,0,"GRYD_040");
	TA_Stay(16,0,23,0,"GRYD_040");
};

func void Rtn_WaitInSideTunnelTwo_1211()
{
	TA_Stay(23,0,16,0,"GRYD_047");
	TA_Stay(16,0,23,0,"GRYD_047");
};

func void Rtn_Door_1211()
{
	TA_Stay(23,0,16,0,"GRYD_060");
	TA_Stay(16,0,23,0,"GRYD_060");
};

func void Rtn_Teleport_1211()
{
	TA_FollowPC(23,0,16,0,"GRYD_060");
	TA_FollowPC(16,0,23,0,"GRYD_060");
};

func void Rtn_Meditate_1211()
{
	TA_Meditate(23,0,16,0,"GRYD_082");
	TA_Meditate(16,0,23,0,"GRYD_082");
};

instance GUR_5021_BAALLUKOR(Npc_Default)
{
	name[0] = "Baal Lukor";
	npcType = npctype_main;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GUR;
	level = 50;
	voice = 13;
	id = 5021;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
	attribute[ATR_HITPOINTS_MAX] = 418;
	attribute[ATR_HITPOINTS] = 418;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,lukors_keule);
	daily_routine = rtn_start_5021;
	fight_tactic = FAI_HUMAN_Strong;
};

func void rtn_start_5021()
{
	TA_Boss(8,0,22,0,"PSI_TEMPLE_GURU_01");
	TA_Sleep(22,0,8,0,"PSI_26_HUT_IN");
};

func void rtn_ritual_5021()
{
	TA_Stay(5,0,1,0,"GURU_RITUAL_06");
	TA_Stay(1,0,5,0,"GURU_RITUAL_06");
};

func void rtn_ot_5021()
{
	TA_Stay(0,0,12,0,"");
	TA_Stay(12,0,24,0,"");
};

