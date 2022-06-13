instance VLK_5073_BUDDLER(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = Npctype_MINE_Ambient;
	guild = GIL_VLK;
	level = 5;
	voice = 2;
	id = 5073;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 118;
	attribute[ATR_HITPOINTS] = 118;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,2,"Hum_Head_FatBald",1,1,vlk_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_5073;
};

func void rtn_start_5073()
{
	TA_SitAround(21,0,4,0,"OW_MINECAMP_05");
	TA_SitAround(4,0,21,0,"OW_MINECAMP_05");
};

