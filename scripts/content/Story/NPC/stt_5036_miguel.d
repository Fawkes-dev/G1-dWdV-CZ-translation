instance STT_5036_MIGUEL(Npc_Default)
{
	name[0] = "Miguel";
	npcType = npctype_main;
	guild = GIL_STT;
	level = 9;
	voice = 10;
	id = 5036;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 154;
	attribute[ATR_HITPOINTS] = 154;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",0,1,stt_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,ItMw_1H_Sword_Short_03);
	EquipItem(self,ItRw_Bow_Small_05);
	CreateInvItems(self,ItAmArrow,16);
	CreateInvItems(self,ItKeLockpick,2);
	CreateInvItems(self,ItMiNugget,30);
	CreateInvItems(self,ItFo_Plants_Berrys_01,3);
	CreateInvItems(self,ItFo_Plants_mushroom_01,5);
	CreateInvItems(self,ItFo_Plants_mushroom_02,2);
	CreateInvItems(self,ItFo_Plants_Herb_02,3);
	CreateInvItems(self,ItFo_Plants_Towerwood_01,2);
	CreateInvItems(self,ItFo_Plants_Herb_01,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_01,2);
	daily_routine = rtn_start_5036;
};

func void rtn_start_5036()
{
	TA_Stand(0,0,23,0,"OW_MINECAMP_04");
	TA_Stand(23,0,24,0,"OW_MINECAMP_04");
};

func void rtn_ocescape_5036()
{
	TA_Smalltalk(0,0,23,0,"LOCATION_11_12_EXTRA");
	TA_Smalltalk(23,0,24,0,"LOCATION_11_12_EXTRA");
};

