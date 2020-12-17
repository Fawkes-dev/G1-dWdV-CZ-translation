instance GRD_5039_GARDIST(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = NpcType_MINE_Guard;
	guild = GIL_GRD;
	level = 15;
	voice = 7;
	id = 5039;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",47,2,grd_armor_m);
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
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_5039;
};

func void rtn_start_5039()
{
	TA_Boss(22,0,8,0,"OW_MINECAMP_TOWER_02");
	TA_Boss(8,0,22,0,"OW_MINECAMP_TOWER_02");
};

