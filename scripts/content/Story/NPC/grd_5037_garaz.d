instance GRD_5037_GARAZ(Npc_Default)
{
	name[0] = "Garaz";
	npcType = npctype_main;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 5037;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",8,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,ItMw_1H_Sword_03);
	CreateInvItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoCheese);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItem(self,itke_omcamp_01);
	daily_routine = rtn_start_5037;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};

func void rtn_start_5037()
{
	TA_Boss(22,0,8,0,"OW_MINECAMP_08");
	TA_Boss(8,0,22,0,"OW_MINECAMP_08");
};

func void rtn_ocescape_5037()
{
	TA_SitAround(13,0,14,0,"LOCATION_11_12_06");
	TA_SitAround(14,0,13,0,"LOCATION_11_12_06");
};

