instance GRD_5016_CONVOIWACHE(Npc_Default)
{
	name[0] = NAME_ConvoiWache;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 5016;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",8,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,ItMw_1H_Sword_03);
	CreateInvItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	daily_routine = rtn_start_5016;
};

func void rtn_start_5016()
{
	TA_Sleep(23,0,6,0,"OCC_GUARD_ROOM_FRONT2");
	TA_Smalltalk(6,0,23,0,"OCC_CONVOY_01");
};

func void rtn_alternative_5016()
{
	TA_Sleep(23,0,6,0,"OCC_GUARD_ROOM_FRONT2");
	TA_Smalltalk(6,0,8,0,"OCC_CONVOY_01");
	TA_Smalltalk(8,0,13,0,"OW_OM_ENTRANCE02");
	TA_Smalltalk(13,0,23,0,"OCC_CONVOY_01");
};

func void rtn_convoy_5016()
{
	TA_SitAround(23,0,16,0,"SPAWN_OW_SCAVENGER_OCWOODEND2");
	TA_SitAround(16,0,23,0,"SPAWN_OW_SCAVENGER_OCWOODEND2");
};

