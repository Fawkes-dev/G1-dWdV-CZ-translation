instance ORG_871_LOGAN(Npc_Default)
{
	name[0] = "Logan";
	npcType = npctype_main;
	guild = GIL_None;
	level = 12;
	voice = 7;
	id = 871;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 214;
	attribute[ATR_HITPOINTS] = 214;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Thief",51,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,2);
	CreateInvItems(self,ItMiNugget,91);
	CreateInvItems(self,ItFoRice,6);
	CreateInvItems(self,ItFoBooze,1);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Claws_01);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,100);
	daily_routine = Rtn_start_871;
};

func void Rtn_start_871()
{
	TA_SitCampfire(13,0,14,0,"LOCATION_11_12_LOGAN");
	TA_SitCampfire(14,0,13,0,"LOCATION_11_12_LOGAN");
};

func void Rtn_FMTaken_871()
{
	TA_FollowPC(0,0,12,0,"LOCATION_11_12_LOGAN");
	TA_FollowPC(12,0,0,0,"LOCATION_11_12_LOGAN");
};

func void Rtn_OMFull_871()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_13");
	TA_StandAround(14,0,13,0,"LOCATION_11_13");
};

func void Rtn_OrcAssault_871()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_13");
	TA_StandAround(14,0,13,0,"LOCATION_11_13");
};

