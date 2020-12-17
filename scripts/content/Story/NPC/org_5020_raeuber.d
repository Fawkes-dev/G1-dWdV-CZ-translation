instance ORG_5020_RAEUBER(Npc_Default)
{
	name[0] = NAME_Raeuber;
	npcType = npctype_main;
	guild = GIL_None;
	level = 11;
	voice = 13;
	id = 5020;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 214;
	attribute[ATR_HITPOINTS] = 214;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Bald",10,3,org_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItem(self,ItAt_Claws_01);
	EquipItem(self,ItMw_1H_Mace_03);
	daily_routine = rtn_start_5020;
};

func void rtn_start_5020()
{
	TA_Boss(13,0,14,0,"OW_PATH_1_12");
	TA_Boss(14,0,13,0,"OW_PATH_1_12");
};

