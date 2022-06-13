instance NON_5054_PAUL(Npc_Default)
{
	name[0] = "Paul";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 1;
	voice = 2;
	id = 5054;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 108;
	attribute[ATR_HITPOINTS] = 108;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Bald",39,2,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_start_5054;
};

func void rtn_start_5054()
{
	TA_SitAround(6,0,20,0,"WP_INTRO_NEWGUY");
	TA_SitAround(20,0,6,0,"WP_INTRO_NEWGUY");
};

func void rtn_oldcamp_5054()
{
	TA_SitAround(6,0,20,0,"OCR_HUT_34_PAUL");
	TA_SitAround(20,0,6,0,"OCR_HUT_34_PAUL");
};

func void rtn_ocescape_5054()
{
	TA_SitAround(0,0,23,0,"LOCATION_11_12_06");
	TA_SitAround(23,0,24,0,"LOCATION_11_12_06");
};

