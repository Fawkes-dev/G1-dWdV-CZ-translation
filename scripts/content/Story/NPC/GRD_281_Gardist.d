instance GRD_281_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_main;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 281;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",3,3,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_LightGuardsSword_03);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	daily_routine = Rtn_start_281;
};

func void Rtn_start_281()
{
	TA_GuardWheelOpen(6,0,22,0,"OW_PATH_1_16_C");
	TA_SitAround(22,0,6,0,"OW_PATH_1_16_B");
};

