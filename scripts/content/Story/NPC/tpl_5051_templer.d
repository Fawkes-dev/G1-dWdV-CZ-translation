instance TPL_5051_TEMPLER(Npc_Default)
{
	name[0] = NAME_Templer;
	npcType = npctype_guard;
	guild = GIL_TPL;
	level = 17;
	voice = 13;
	id = 5051;
	attribute[ATR_STRENGTH] = 95;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 274;
	attribute[ATR_HITPOINTS] = 274;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",65,1,tpl_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_02);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = rtn_start_5051;
};

func void rtn_start_5051()
{
	TA_Smalltalk(8,0,20,0,"PSI_MEETINGPOINT_2");
	TA_Smalltalk(20,0,8,0,"PSI_MEETINGPOINT_2");
};

func void rtn_tattooritual_5051()
{
	TA_Stand(8,0,23,0,"WP_PSI_RITUAL_SWAMP_03");
	TA_Stand(23,0,8,0,"WP_PSI_RITUAL_SWAMP_03");
};

