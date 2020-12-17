instance GRD_227_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 10;
	voice = 6;
	id = 227;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",17,2,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_LightGuardsSword_03);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_227;
};

func void Rtn_start_227()
{
	TA_StandAround(8,0,11,45,"OCC_WELL_RIGHT_MOVEMENT2");
	TA_StandAround(11,45,15,0,"OCC_WELL_RIGHT_MOVEMENT2");
	TA_RoastScavenger(15,0,20,0,"OCC_WELL_RIGHT_MOVEMENT2");
	TA_Smalltalk(20,0,8,0,"OCR_AT_HUT_3");
};

