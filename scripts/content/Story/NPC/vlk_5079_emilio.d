instance VLK_5079_EMILIO(Npc_Default)
{
	name[0] = "Emilio";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 5;
	voice = 4;
	id = 5079;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 118;
	attribute[ATR_HITPOINTS] = 118;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,0,"Hum_Head_Thief",11,3,vlk_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_5079;
};

func void rtn_start_5079()
{
	TA_StandAround(21,0,4,0,"OW_MINECAMP_15");
	TA_StandAround(4,0,21,0,"OW_MINECAMP_15");
};

func void rtn_ocescape_5079()
{
	TA_SitAround(0,0,23,0,"LOCATION_11_12_06");
	TA_SitAround(23,0,24,0,"LOCATION_11_12_06");
};

