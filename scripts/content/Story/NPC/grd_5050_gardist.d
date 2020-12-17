instance GRD_5050_GARDIST(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 10;
	voice = 13;
	id = 5050;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",47,0,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_02);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = rtn_start_5050;
};

func void rtn_start_5050()
{
	TA_Boss(6,25,20,25,"OCC_GRAETTOWER_GUARD_01");
	TA_StandAround(20,25,6,25,"OCC_SHADOWS_CORNER_MOVEMENT");
};

