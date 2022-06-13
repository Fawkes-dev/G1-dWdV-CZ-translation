instance Sld_729_Kharim(Npc_Default)
{
	name[0] = "Kharim";
	npcType = npctype_main;
	guild = GIL_None;
	level = 11;
	voice = 9;
	id = 729;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 202;
	attribute[ATR_HITPOINTS] = 202;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",9,1,sld_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,ItMw_1H_Mace_02);
	CreateInvItems(self,ItMiNugget,19);
	CreateInvItems(self,ItLsTorch,5);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Amphore_01);
	CreateInvItem(self,ItMi_Stuff_OldCoin_02);
	daily_routine = Rtn_start_729;
};

func void Rtn_start_729()
{
	TA_Sleep(0,0,7,30,"OCR_HUT_31");
	TA_SitCampfire(7,30,11,0,"OCR_CAMPFIRE_I_2");
	TA_Smith_Sharp(11,0,13,0,"OCR_OUTSIDE_HUT_31");
	TA_RepairHut(13,0,14,0,"OCR_OUTSIDE_HUT_32");
	TA_PracticeSword(14,0,15,0,"OCR_ARENABATTLE");
	TA_SitCampfire(15,0,17,0,"OCR_CAMPFIRE_I_2");
	TA_SitCampfire(17,0,0,0,"OCR_CAMPFIRE_I_2");
};

func void rtn_fight_729()
{
	TA_Stand(8,0,20,0,"OCR_ARENABATTLE_TRAIN2");
	TA_Stand(20,0,8,0,"OCR_ARENABATTLE_TRAIN2");
};

func void Rtn_Guide_729()
{
	TA_GuidePC(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

