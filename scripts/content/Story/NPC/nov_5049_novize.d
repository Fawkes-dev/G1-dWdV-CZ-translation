instance NOV_5049_NOVIZE(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 3;
	voice = 5;
	id = 5049;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 238;
	attribute[ATR_HITPOINTS] = 238;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_Fatbald",6,2,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Axe_Old_01);
	daily_routine = rtn_start_5049;
};

func void rtn_start_5049()
{
	TA_StandAround(23,10,7,30,"PSI_TEMPLE_SIT_01");
	TA_SitCampfire(7,30,23,10,"PSI_TEMPLE_SIT_01");
};

