instance CS_Eskorte6(Npc_Default)
{
	name[0] = "Stráž";
	slot = "Strážce";
	guild = GIL_GRD;
	level = 5;
	flags = 0;
	voice = 11;
	id = 3028;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 9;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 26;
	attribute[ATR_HITPOINTS] = 26;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_bald",12,2,grd_armor_i);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,ItMw_1H_LightGuardsSword_03);
	daily_routine = Rtn_start_3030;
};

func void Rtn_start_3030()
{
	TA_Stand(0,0,24,0,"WP_INTRO06");
	TA_Stand(24,0,0,0,"WP_INTRO06");
};

