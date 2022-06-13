instance NOV_1336_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1336;
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
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Hatchet_01);
	daily_routine = Rtn_start_1336;
};

func void Rtn_start_1336()
{
	TA_Sleep(2,0,7,2,"PSI_24_HUT_IN_BED");
	ta_listen_cadar(7,2,2,0,"PSI_TEACH_CADAR");
};

func void rtn_afterritual_1336()
{
	TA_Sleep(2,0,8,0,"PSI_24_HUT_IN_BED");
	TA_Smalltalk(8,0,2,0,"PSI_TEACH_CADAR");
};

