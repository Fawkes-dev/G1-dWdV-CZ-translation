instance VLK_565_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_VLK;
	level = 4;
	voice = 1;
	id = 565;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 118;
	attribute[ATR_HITPOINTS] = 118;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",7,1,"Hum_Head_Psionic",69,3,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItFoApple);
	daily_routine = Rtn_start_565;
};

func void Rtn_start_565()
{
	TA_Sleep(23,0,7,30,"OCR_HUT_52");
	TA_StandAround(7,30,9,20,"OCR_OUTSIDE_HUT_52");
	TA_Smalltalk(9,20,15,0,"OCR_TO_HUT_42");
	TA_StandAround(15,0,23,0,"OCR_OUTSIDE_HUT_52");
};

