instance GRD_236_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = NpcType_MINE_Guard;
	guild = GIL_GRD;
	level = 10;
	voice = 6;
	id = 236;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",3,1,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_LightGuardsSword_03);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_236;
};

func void Rtn_start_236()
{
	TA_Guard(21,0,6,0,"OM_CAVE3_01");
	TA_Guard(6,0,21,0,"OM_CAVE3_01");
};

