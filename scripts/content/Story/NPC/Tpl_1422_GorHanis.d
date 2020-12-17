instance Tpl_1422_GorHanis(Npc_Default)
{
	name[0] = "Gor Hanis";
	npcType = npctype_main;
	guild = GIL_None;
	level = 12;
	voice = 8;
	id = 1422;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 214;
	attribute[ATR_HITPOINTS] = 214;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",66,1,tpl_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_1H_Sword_01);
	CreateInvItem(self,ItMiJoint_1);
	CreateInvItem(self,ItMi_Stuff_OldCoin_02);
	daily_routine = Rtn_start_1422;
};

func void Rtn_start_1422()
{
	TA_Sleep(23,45,4,0,"OCR_HUT_32");
	TA_SitAround(4,0,4,45,"OCR_ARENABATTLE");
	TA_Sleep(4,45,7,45,"OCR_HUT_32");
	TA_SitCampfire(7,45,10,5,"OCR_CAMPFIRE_I_1");
	TA_Smalltalk(10,5,16,0,"OCR_SMALLTALK_A_OC_ARENA");
	TA_PracticeSword(16,0,18,45,"OCR_ARENABATTLE");
	TA_Smith_Sharp(18,45,20,15,"OCR_CAMPFIRE_I_1");
	TA_SitCampfire(20,15,23,45,"OCR_CAMPFIRE_I_1");
};

func void rtn_guide_1422()
{
	TA_GuidePC(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

func void rtn_fight_1422()
{
	TA_Stand(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	TA_Stand(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

func void rtn_flee_1422()
{
	TA_Stay(0,0,12,0,"");
	TA_Stay(12,0,24,0,"");
};

instance TPL_5055_GORHANIS(Npc_Default)
{
	name[0] = "Gor Hanis";
	npcType = npctype_main;
	guild = GIL_BAU;
	level = 100;
	voice = 8;
	id = 5055;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_EDGE] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 70;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 322;
	attribute[ATR_HITPOINTS] = 322;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",66,1,tpl_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	EquipItem(self,ItMw_2H_Sword_Light_02);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	CreateInvItem(self,ItMi_Stuff_OldCoin_02);
	daily_routine = rtn_start_5055;
};

func void rtn_start_5055()
{
	TA_Stand(23,45,7,45,"TPL_318");
	TA_Stand(7,45,23,45,"TPL_318");
};

