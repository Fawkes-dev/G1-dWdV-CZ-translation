instance ORG_826_Mordrag(Npc_Default)
{
	name[0] = "Mordrag";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 10;
	voice = 11;
	id = 826;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 202;
	attribute[ATR_HITPOINTS] = 202;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,Das_magische_Erz,1);
	CreateInvItems(self,ItMiNugget,90);
	CreateInvItems(self,ItArScrollFireball,4);
	CreateInvItems(self,ItArScrollFirerain,2);
	CreateInvItems(self,ItMi_Stuff_Cup_02,2);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItems(self,ItFo_Potion_Mana_01,2);
	CreateInvItems(self,ItMw_1H_Mace_01,1);
	CreateInvItems(self,ItArScrollHeal,6);
	CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,3);
	CreateInvItems(self,ItFoApple,4);
	CreateInvItems(self,ItMi_Alchemy_Sulphur_01,2);
	CreateInvItems(self,ItFo_mutton_01,2);
	CreateInvItems(self,ItFoCheese,3);
	CreateInvItems(self,Jagd_und_Beute,1);
	CreateInvItems(self,ItArScrollTrfBloodfly,2);
	CreateInvItems(self,fletcher_sword,1);
	CreateInvItems(self,scorpio_crossbow,1);
	CreateInvItems(self,slys_sword,1);
	CreateInvItems(self,scarsring,1);
	EquipItem(self,ItMw_1H_Mace_02);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,100);
	daily_routine = Rtn_PreStart_826;
};

func void Rtn_PreStart_826()
{
	TA_Smalltalk(10,0,22,0,"OCR_OUTSIDE_HUT_44");
	TA_Stand(22,0,10,0,"OCR_OUTSIDE_HUT_44");
};

func void Rtn_Guide_826()
{
	TA_GuidePC(8,0,20,0,"OW_PATH_07_21");
	TA_GuidePC(20,0,8,0,"OW_PATH_07_21");
};

func void Rtn_Start_826()
{
	TA_Stand(8,0,21,0,"NC_TAVERN_BAR");
	TA_StandAround(21,0,1,0,"NC_TAVERN_MORDRAG_SHRIKE");
	TA_Sleep(1,0,8,0,"NC_HUT23_IN");
};

func void rtn_sect_826()
{
	TA_Boss(6,0,1,0,"PSI_PATH_7_10");
	TA_SitCampfire(1,0,6,0,"PSI_PATH_4_CAMPFIRE_B");
};

