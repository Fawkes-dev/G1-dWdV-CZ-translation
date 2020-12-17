instance GRD_5018_RAMON(Npc_Default)
{
	name[0] = "Ramon";
	npcType = npctype_main;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 5018;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Bald",3,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,ItMw_1H_Sword_04);
	CreateInvItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItems(self,ItMiNugget,23);
	daily_routine = rtn_start_5018;
};

func void rtn_start_5018()
{
	TA_SitAround(23,0,6,0,"OCC_GUARD_ROOM_BACK");
	TA_Boss(6,0,23,0,"OCC_CONVOY_01");
};

func void rtn_alternative_5018()
{
	TA_SitAround(23,0,6,0,"OCC_GUARD_ROOM_BACK");
	TA_Boss(6,0,8,0,"OCC_CONVOY_01");
	TA_Boss(8,0,13,0,"OW_OM_ENTRANCE02_WHEEL");
	TA_Boss(13,0,23,0,"OCC_CONVOY_01");
};

func void rtn_follow_5018()
{
	TA_FollowPC(23,0,16,0,"OCC_CONVOY_01");
	TA_FollowPC(16,0,23,0,"OCC_CONVOY_01");
};

func void rtn_convoy_5018()
{
	TA_Boss(23,0,16,0,"SPAWN_OW_SCAVENGER_OCWOODEND2");
	TA_Boss(16,0,23,0,"SPAWN_OW_SCAVENGER_OCWOODEND2");
};

func void rtn_ocescape_5018()
{
	TA_SitAround(13,0,14,0,"LOCATION_11_08");
	TA_SitAround(14,0,13,0,"LOCATION_11_08");
};

