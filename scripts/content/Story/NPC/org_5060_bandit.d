instance ORG_5060_BANDIT(Npc_Default)
{
	name[0] = "Bandita";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 11;
	voice = 13;
	id = 5060;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 202;
	attribute[ATR_HITPOINTS] = 202;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",5,1,org_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoBooze,5);
	CreateInvItems(self,ItLsTorch,1);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Teeth_01);
	EquipItem(self,ItMw_1H_Mace_War_01);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = rtn_start_5060;
};

func void rtn_start_5060()
{
	TA_SitAround(20,0,6,0,"SPAWN_SIT_OW");
	TA_SitAround(6,0,20,0,"SPAWN_SIT_OW");
};

func void rtn_guide_5060()
{
	TA_GuidePC(20,0,6,0,"HELPPOINT10");
	TA_GuidePC(6,0,20,0,"HELPPOINT10");
};

func void rtn_trapped_5061()
{
	TA_Boss(20,0,6,0,"HELPPOINT9901");
	TA_Boss(6,0,20,0,"HELPPOINT9901");
};

