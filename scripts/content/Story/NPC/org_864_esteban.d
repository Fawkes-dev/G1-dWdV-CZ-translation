instance ORG_864_ESTEBAN(Npc_Default)
{
	name[0] = "Esteban";
	npcType = npctype_main;
	guild = GIL_None;
	level = 12;
	voice = 13;
	id = 864;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 202;
	attribute[ATR_HITPOINTS] = 202;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",8,1,org_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,9);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoBooze,5);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Teeth_01);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_864;
};

func void Rtn_start_864()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_14");
	TA_StandAround(14,0,13,0,"LOCATION_11_14");
};

func void rtn_ocescape_864()
{
	TA_Smalltalk(13,0,14,0,"LOCATION_11_12");
	TA_Smalltalk(14,0,13,0,"LOCATION_11_12");
};

func void Rtn_OMFull_864()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_14");
	TA_StandAround(14,0,13,0,"LOCATION_11_14");
};

func void Rtn_FMTaken_864()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_14");
	TA_StandAround(14,0,13,0,"LOCATION_11_14");
};

func void Rtn_OrcAssault_864()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_14");
	TA_StandAround(14,0,13,0,"LOCATION_11_14");
};

