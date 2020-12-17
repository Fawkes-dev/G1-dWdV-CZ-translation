instance STT_5027_BRAGO(Npc_Default)
{
	name[0] = "Brago";
	npcType = npctype_main;
	guild = GIL_STT;
	level = 7;
	voice = 12;
	id = 5027;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 154;
	attribute[ATR_HITPOINTS] = 154;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",109,3,stt_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_Short_05);
	EquipItem(self,ItRw_Bow_Small_02);
	CreateInvItems(self,ItAmArrow,10);
	CreateInvItem(self,ItFo_Potion_Water_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItem(self,ItKeLockpick);
	daily_routine = rtn_start_5027;
};

func void rtn_start_5027()
{
	TA_Stand(23,0,9,5,"OCR_OUTSIDE_HUT_52");
	TA_WashSelf(9,5,9,20,"OCR_WASH_8");
	TA_Smalltalk(9,20,15,0,"OCR_TO_HUT_42");
};

func void rtn_guide_5027()
{
	TA_GuidePC(8,0,20,0,"OW_PATH_297");
	TA_GuidePC(20,0,8,0,"OW_PATH_297");
};

