instance TPL_1439_GorNaDrak(Npc_Default)
{
	name[0] = "Gor Na Drak";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 21;
	voice = 9;
	id = 1439;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 322;
	attribute[ATR_HITPOINTS] = 322;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",63,2,tpl_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	EquipItem(self,ItMw_2H_Sword_Light_04);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = Rtn_start_1439;
};

func void Rtn_start_1439()
{
	TA_Smalltalk(6,0,14,0,"PSI_SWAMP_MOVEMENT");
	TA_StandAround(14,0,23,0,"OW_MINECAMP_02");
	TA_Sleep(23,0,6,0,"PSI_5_HUT_IN");
};

func void Rtn_FMTaken_1439()
{
	TA_Smalltalk(6,0,14,0,"PSI_SWAMP_MOVEMENT");
	TA_Smalltalk(14,0,23,0,"PSI_SWAMP_MOVEMENT");
	TA_Sleep(23,0,6,0,"PSI_5_HUT_IN");
};

