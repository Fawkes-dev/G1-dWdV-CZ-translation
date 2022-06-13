instance NOV_1337_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1337;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 106;
	attribute[ATR_HITPOINTS] = 106;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",31,2,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Hatchet_01);
	CreateInvItem(self,ItFoSoup);
	daily_routine = Rtn_start_1337;
};

func void Rtn_start_1337()
{
	TA_Meditate(8,0,10,0,"PSI_TEMPLE_COURT_2_MOVEMENT");
	TA_Meditate(10,0,8,0,"PSI_TEMPLE_COURT_2_MOVEMENT");
};

func void Rtn_Ritual_1337()
{
	TA_Stay(8,0,10,0,"PSI_TEMPLE_NOVIZE_PR2");
	TA_Stay(10,0,8,0,"PSI_TEMPLE_NOVIZE_PR2");
};

func void rtn_graveyard_1337()
{
	TA_Stay(8,0,10,0,"");
	TA_Stay(10,0,8,0,"");
};

