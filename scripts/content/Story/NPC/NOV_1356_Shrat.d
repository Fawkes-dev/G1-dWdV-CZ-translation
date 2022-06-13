instance NOV_1356_Shrat(Npc_Default)
{
	name[0] = "Shrat";
	npcType = npctype_main;
	guild = GIL_NOV;
	level = 5;
	voice = 2;
	id = 1356;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 106;
	attribute[ATR_HITPOINTS] = 106;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",28,1,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Hatchet_01);
	daily_routine = Rtn_start_1356;
};

func void Rtn_start_1356()
{
	TA_SitCampfire(8,0,20,0,"PATH_SWAMP_HUT");
	TA_SitCampfire(20,0,8,0,"PATH_SWAMP_HUT");
};

func void rtn_newcamp_1356()
{
	TA_SitAround(8,0,20,0,"NC_TAVERN_MORDRAG_SHRIKE");
	TA_SitAround(20,0,8,0,"NC_TAVERN_MORDRAG_SHRIKE");
};

func void Rtn_Follow_1356()
{
	TA_FollowPC(23,0,16,0,"PATH_SWAMP_HUT");
	TA_FollowPC(16,0,23,0,"PATH_SWAMP_HUT");
};

