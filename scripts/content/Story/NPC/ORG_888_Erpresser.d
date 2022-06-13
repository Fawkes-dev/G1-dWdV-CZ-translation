instance ORG_888_Erpresser(Npc_Default)
{
	name[0] = "Vyděrač";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 15;
	voice = 13;
	id = 888;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fatbald",35,2,org_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	CreateInvItems(self,ItKeLockpick,3);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItems(self,ItFoRice,8);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItFoMutton);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Claws_01);
	EquipItem(self,ItMw_1H_Mace_War_02);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	start_aistate = ZS_Erpresser;
	daily_routine = rtn_start_888;
};

func void rtn_start_888()
{
	TA_Smalltalk(20,0,6,0,"OW_PATH_056");
	TA_Boss(6,0,20,0,"OW_PATH_056");
};

