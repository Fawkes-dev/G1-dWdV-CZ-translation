instance GRD_221_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 10;
	voice = 13;
	id = 221;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,2,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_LightGuardsSword_03);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_221;
};

func void Rtn_start_221()
{
	TA_PracticeSword(7,40,20,10,"OCC_RUIN_PRACTICE_03");
	TA_RoastScavenger(20,10,22,10,"OCC_SHADOWS_CORNER_MOVEMENT2");
	TA_StandAround(22,10,0,10,"OCC_SHADOWS_CORNER_MOVEMENT");
	TA_Sleep(0,10,7,40,"OCC_MERCS_UPPER_RIGHT_ROOM_BED3");
};

func void Rtn_OT_221()
{
	TA_Guard(7,0,20,0,"OCC_CHAPEL_UPSTAIRS_RIGHT");
	TA_Guard(20,0,7,0,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

