instance VLK_534_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 3;
	voice = 2;
	id = 534;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 94;
	attribute[ATR_HITPOINTS] = 94;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Bald",74,1,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_534;
};

func void Rtn_start_534()
{
	TA_SitCampfire(10,0,22,0,"OC_ROUND_22_CF_2");
	TA_SitCampfire(10,0,22,0,"OC_ROUND_22_CF_2");
};

func void rtn_alternative_534()
{
	TA_PlayTune(10,0,22,0,"OCR_COOK_AT_HUT_10");
	TA_PlayTune(10,0,22,0,"OCR_COOK_AT_HUT_10");
};

