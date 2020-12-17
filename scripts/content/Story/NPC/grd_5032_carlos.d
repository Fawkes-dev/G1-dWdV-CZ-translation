instance GRD_5032_CARLOS(Npc_Default)
{
	name[0] = "Carlos";
	npcType = npctype_main;
	guild = GIL_GRD;
	level = 15;
	voice = 6;
	id = 5032;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",14,1,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0.5);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_03);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoCheese);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_5032;
};

func void rtn_start_5032()
{
	TA_Boss(6,0,7,0,"WP_INTRO_NEW_07");
	TA_Boss(7,0,6,0,"WP_INTRO_NEW_07");
};

func void rtn_ocescape_5032()
{
	TA_Smalltalk(13,0,14,0,"LOCATION_11_12_EXTRA");
	TA_Smalltalk(14,0,13,0,"LOCATION_11_12_EXTRA");
};

