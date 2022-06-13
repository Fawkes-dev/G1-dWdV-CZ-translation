instance NOV_1326_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 3;
	flags = 0;
	voice = 3;
	id = 1326;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 106;
	attribute[ATR_HITPOINTS] = 106;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",34,1,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Hatchet_01);
	daily_routine = Rtn_start_1326;
};

func void Rtn_start_1326()
{
	TA_Sleep(23,5,7,30,"PSI_27_HUT_IN");
	TA_Listen(7,30,23,5,"PSI_PLATFORM_1");
};

func void rtn_afterritual_1326()
{
	TA_Sleep(23,5,7,30,"PSI_27_HUT_IN");
	TA_Smoke(7,30,23,5,"PSI_PLATFORM_1");
};

