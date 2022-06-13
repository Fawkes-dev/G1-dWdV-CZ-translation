instance GRD_210_Scatty(Npc_Default)
{
	name[0] = "Scatty";
	npcType = npctype_main;
	guild = GIL_STT;
	level = 15;
	voice = 1;
	id = 210;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",5,2,stt_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_04);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,14);
	CreateInvItem(self,ItFoCheese);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_210;
};

func void Rtn_start_210()
{
	TA_Sleep(0,0,8,0,"OCR_HUT_19");
	TA_SitAround(8,0,10,0,"OCR_ARENABATTLE_BENCH");
	TA_Smalltalk(10,0,16,0,"OCR_SMALLTALK_A_OC_ARENA");
	TA_Stand(16,0,20,0,"OCR_STAND_WETT");
	TA_SitAround(20,0,0,0,"OCR_ARENABATTLE_BENCH");
};

func void rtn_ocescape_210()
{
	TA_SitAround(13,0,14,0,"LOCATION_11_13");
	TA_SitAround(14,0,13,0,"LOCATION_11_13");
};

