instance VLK_519_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_VLK;
	level = 2;
	voice = 2;
	id = 519;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 94;
	attribute[ATR_HITPOINTS] = 94;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",69,2,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItFoApple);
	daily_routine = Rtn_start_519;
};

func void Rtn_start_519()
{
	TA_Sleep(22,0,8,0,"OCR_HUT_43");
	TA_SitAround(8,0,12,0,"OCR_HUT_43");
	TA_WashSelf(12,0,12,15,"OCR_WASH_8");
	TA_StandAround(12,15,16,35,"OCR_MARKETPLACE_HANGAROUND");
	TA_SitAround(16,35,22,0,"OCR_HUT_43");
};

