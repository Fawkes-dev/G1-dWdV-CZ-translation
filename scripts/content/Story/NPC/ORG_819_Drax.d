instance ORG_819_Drax(Npc_Default)
{
	name[0] = "Drax";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 14;
	voice = 6;
	id = 819;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 166;
	attribute[ATR_HITPOINTS] = 166;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",39,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,2);
	CreateInvItems(self,ItMiNugget,14);
	CreateInvItems(self,ItFoRice,6);
	CreateInvItems(self,ItFoBooze,2);
	CreateInvItems(self,ItLsTorch,3);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Claws_01);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_Start_819;
};

func void Rtn_Start_819()
{
	TA_Smalltalk(6,0,23,0,"OW_PATH_1_5_A");
	TA_Smalltalk(23,0,6,0,"OW_PATH_1_5_A");
};

func void rtn_hunt_819()
{
	TA_Smalltalk(6,0,9,0,"OW_PATH_1_5_A");
	TA_Smalltalk(9,0,13,0,"OW_PATH_SMALLTALK_NC_01");
	TA_SitAround(13,0,17,0,"HELPPOINT10");
	TA_Boss(17,0,21,0,"PATH_OC_TO_LAKE_02");
	TA_Smalltalk(21,0,23,0,"OW_PATH_298");
	TA_SitAround(23,0,3,0,"OW_PATH_167_HUNTERS");
	TA_SitCampfire(3,0,6,0,"OW_WOODRUIN_WOLF_SPAWN");
};

