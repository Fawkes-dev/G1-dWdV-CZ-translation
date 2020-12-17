instance GRD_231_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 10;
	voice = 13;
	id = 231;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",4,1,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,ItMw_1H_LightGuardsSword_03);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_231;
};

func void Rtn_start_231()
{
	TA_StandAround(22,30,7,30,"OCC_MERCS_UPPER_LEFT_ROOM_BED7");
	TA_StandAround(7,30,22,30,"OCC_WELL_RIGHT_MOVEMENT3");
};

