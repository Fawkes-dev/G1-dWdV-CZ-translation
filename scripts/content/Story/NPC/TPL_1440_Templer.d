instance TPL_1440_Templer(Npc_Default)
{
	name[0] = NAME_Templer;
	npcType = npctype_guard;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 1440;
	attribute[ATR_STRENGTH] = 95;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 274;
	attribute[ATR_HITPOINTS] = 274;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",64,1,tpl_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_02);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = Rtn_start_1440;
};

func void Rtn_start_1440()
{
	TA_Smalltalk(6,0,14,0,"PSI_SWAMP_MOVEMENT");
	TA_StandAround(14,0,23,0,"OW_MINECAMP_02");
	TA_Sleep(23,0,6,0,"PSI_5_HUT_IN");
};

func void Rtn_FMTaken_1440()
{
	TA_Smalltalk(6,0,14,0,"PSI_SWAMP_MOVEMENT");
	TA_Smalltalk(14,0,23,0,"PSI_SWAMP_MOVEMENT");
	TA_Sleep(23,0,6,0,"PSI_5_HUT_IN");
};

