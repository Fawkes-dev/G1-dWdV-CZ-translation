instance Org_858_Quentin(Npc_Default)
{
	name[0] = "Quentin";
	npcType = npctype_main;
	guild = GIL_None;
	level = 12;
	voice = 7;
	id = 858;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Pony",8,1,org_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,65);
	CreateInvItems(self,ItFoRice,8);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItFoLoaf);
	EquipItem(self,ItMw_1H_Mace_War_01);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems(self,ItMiScoop,1);
	CreateInvItems(self,ItMiJoint_2,9);
	CreateInvItems(self,ItMi_Alchemy_Alcohol_01,2);
	CreateInvItems(self,ItMi_Alchemy_Salt_01,1);
	daily_routine = Rtn_start_858;
};

func void Rtn_start_858()
{
	TA_Boss(13,0,14,0,"LOCATION_11_11");
	TA_Boss(14,0,13,0,"LOCATION_11_11");
};

func void Rtn_OMFull_858()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_13");
	TA_StandAround(14,0,13,0,"LOCATION_11_13");
};

func void rtn_fight_858()
{
	TA_Boss(13,0,14,0,"OW_PATH_261");
	TA_Boss(14,0,13,0,"OW_PATH_261");
};

func void rtn_convoy_858()
{
	TA_Boss(13,0,14,0,"OW_PATH_266");
	TA_Boss(14,0,13,0,"OW_PATH_266");
};

