instance VLK_522_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 522;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 94;
	attribute[ATR_HITPOINTS] = 94;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",7,1,"Hum_Head_Psionic",67,2,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItFoApple);
	daily_routine = Rtn_start_522;
};

func void Rtn_start_522()
{
	TA_Sleep(23,0,8,0,"OCR_HUT_47");
	TA_SitAround(8,0,11,0,"OCR_MARKETPLACE_HANGAROUND");
	TA_RoastScavenger(11,0,17,0,"OCR_OUTSIDE_MARKETPLACE_SCAVENGER");
	TA_SitAround(17,0,23,0,"OCR_MARKETPLACE_HANGAROUND");
};

