instance NOV_5048_NOVIZE(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 5048;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 238;
	attribute[ATR_HITPOINTS] = 238;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",29,3,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Axe_Old_01);
	daily_routine = rtn_start_5048;
};

func void rtn_start_5048()
{
	TA_StandAround(23,10,7,30,"PSI_TEMPLE_SIT_01");
	TA_RepairHut(7,30,23,10,"PSI_TEMPLE_PATH_REPAIR_01");
};

