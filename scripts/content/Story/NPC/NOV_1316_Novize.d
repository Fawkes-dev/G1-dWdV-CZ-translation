instance NOV_1316_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1316;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 106;
	attribute[ATR_HITPOINTS] = 106;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",32,1,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Hatchet_01);
	daily_routine = Rtn_start_1316;
};

func void Rtn_start_1316()
{
	TA_Smith_Fire(8,0,8,10,"PSI_SMITH_01");
	TA_Smith_Anvil(8,10,8,20,"PSI_SMITH_01");
	TA_Smith_Fire(8,20,8,30,"PSI_SMITH_01");
	TA_Smith_Anvil(8,30,8,40,"PSI_SMITH_01");
	TA_Smith_Cool(8,40,8,50,"PSI_SMITH_01");
	TA_Smith_Sharp(8,50,8,55,"PSI_SMITH_01");
	TA_SitAround(8,55,9,0,"PSI_SMITH_01");
	TA_Smith_Fire(9,0,9,10,"PSI_SMITH_01");
	TA_Smith_Anvil(9,10,9,20,"PSI_SMITH_01");
	TA_Smith_Fire(9,20,9,30,"PSI_SMITH_01");
	TA_Smith_Anvil(9,30,9,40,"PSI_SMITH_01");
	TA_Smith_Cool(9,40,9,50,"PSI_SMITH_01");
	TA_Smith_Sharp(9,50,9,55,"PSI_SMITH_01");
	TA_SitAround(9,55,10,0,"PSI_SMITH_01");
	TA_Smith_Fire(10,0,10,10,"PSI_SMITH_01");
	TA_Smith_Anvil(10,10,10,20,"PSI_SMITH_01");
	TA_Smith_Fire(10,20,10,30,"PSI_SMITH_01");
	TA_Smith_Anvil(10,30,10,40,"PSI_SMITH_01");
	TA_Smith_Cool(10,40,10,50,"PSI_SMITH_01");
	TA_Smith_Sharp(10,50,10,55,"PSI_SMITH_01");
	TA_SitAround(10,55,11,0,"PSI_SMITH_01");
	TA_Smith_Fire(11,0,11,10,"PSI_SMITH_01");
	TA_Smith_Anvil(11,10,11,20,"PSI_SMITH_01");
	TA_Smith_Fire(11,20,11,30,"PSI_SMITH_01");
	TA_Smith_Anvil(11,30,11,40,"PSI_SMITH_01");
	TA_Smith_Cool(11,40,11,50,"PSI_SMITH_01");
	TA_Smith_Sharp(11,50,11,55,"PSI_SMITH_01");
	TA_SitAround(11,55,12,0,"PSI_SMITH_01");
	TA_Smith_Fire(12,0,12,10,"PSI_SMITH_01");
	TA_Smith_Anvil(12,10,12,20,"PSI_SMITH_01");
	TA_Smith_Fire(12,20,12,30,"PSI_SMITH_01");
	TA_Smith_Anvil(12,30,12,40,"PSI_SMITH_01");
	TA_Smith_Cool(12,40,12,50,"PSI_SMITH_01");
	TA_Smith_Sharp(12,50,12,55,"PSI_SMITH_01");
	TA_SitAround(12,55,13,0,"PSI_SMITH_01");
	TA_Smith_Fire(13,0,13,10,"PSI_SMITH_01");
	TA_Smith_Anvil(13,10,13,20,"PSI_SMITH_01");
	TA_Smith_Fire(13,20,13,30,"PSI_SMITH_01");
	TA_Smith_Anvil(13,30,13,40,"PSI_SMITH_01");
	TA_Smith_Cool(13,40,13,50,"PSI_SMITH_01");
	TA_Smith_Sharp(13,50,13,55,"PSI_SMITH_01");
	TA_SitAround(13,55,14,0,"PSI_SMITH_01");
	TA_Smith_Fire(14,0,14,10,"PSI_SMITH_01");
	TA_Smith_Anvil(14,10,14,20,"PSI_SMITH_01");
	TA_Smith_Fire(14,20,14,30,"PSI_SMITH_01");
	TA_Smith_Anvil(14,30,14,40,"PSI_SMITH_01");
	TA_Smith_Cool(14,40,14,50,"PSI_SMITH_01");
	TA_Smith_Sharp(14,50,14,55,"PSI_SMITH_01");
	TA_SitAround(14,55,15,0,"PSI_SMITH_01");
	TA_Smith_Fire(15,0,15,10,"PSI_SMITH_01");
	TA_Smith_Anvil(15,10,15,20,"PSI_SMITH_01");
	TA_Smith_Fire(15,20,15,30,"PSI_SMITH_01");
	TA_Smith_Anvil(15,30,15,40,"PSI_SMITH_01");
	TA_Smith_Cool(15,40,15,50,"PSI_SMITH_01");
	TA_Smith_Sharp(15,50,15,55,"PSI_SMITH_01");
	TA_SitAround(15,55,16,0,"PSI_SMITH_01");
	TA_Smith_Fire(16,0,16,10,"PSI_SMITH_01");
	TA_Smith_Anvil(16,10,16,20,"PSI_SMITH_01");
	TA_Smith_Fire(16,20,16,30,"PSI_SMITH_01");
	TA_Smith_Anvil(16,30,16,40,"PSI_SMITH_01");
	TA_Smith_Cool(16,40,16,50,"PSI_SMITH_01");
	TA_Smith_Sharp(16,50,16,55,"PSI_SMITH_01");
	TA_SitAround(16,55,17,0,"PSI_SMITH_01");
	TA_Smith_Fire(17,0,17,10,"PSI_SMITH_01");
	TA_Smith_Anvil(17,10,17,20,"PSI_SMITH_01");
	TA_Smith_Fire(17,20,17,30,"PSI_SMITH_01");
	TA_Smith_Anvil(17,30,17,40,"PSI_SMITH_01");
	TA_Smith_Cool(17,40,17,50,"PSI_SMITH_01");
	TA_Smith_Sharp(17,50,17,55,"PSI_SMITH_01");
	TA_SitAround(17,55,18,0,"PSI_SMITH_01");
	TA_Smith_Fire(18,0,18,10,"PSI_SMITH_01");
	TA_Smith_Anvil(18,10,18,20,"PSI_SMITH_01");
	TA_Smith_Fire(18,20,18,30,"PSI_SMITH_01");
	TA_Smith_Anvil(18,30,18,40,"PSI_SMITH_01");
	TA_Smith_Cool(18,40,18,50,"PSI_SMITH_01");
	TA_Smith_Sharp(18,50,18,55,"PSI_SMITH_01");
	TA_SitAround(18,55,19,0,"PSI_SMITH_01");
	TA_Smith_Fire(19,0,19,10,"PSI_SMITH_01");
	TA_Smith_Anvil(19,10,19,20,"PSI_SMITH_01");
	TA_Smith_Fire(19,20,19,30,"PSI_SMITH_01");
	TA_Smith_Anvil(19,30,19,40,"PSI_SMITH_01");
	TA_Smith_Cool(19,40,19,50,"PSI_SMITH_01");
	TA_Smith_Sharp(19,50,19,55,"PSI_SMITH_01");
	TA_SitAround(19,55,20,0,"PSI_SMITH_01");
	TA_Smith_Fire(20,0,20,10,"PSI_SMITH_01");
	TA_Smith_Anvil(20,10,20,20,"PSI_SMITH_01");
	TA_Smith_Fire(20,20,20,30,"PSI_SMITH_01");
	TA_Smith_Anvil(20,30,20,40,"PSI_SMITH_01");
	TA_Smith_Cool(20,40,20,50,"PSI_SMITH_01");
	TA_Smith_Sharp(20,50,20,55,"PSI_SMITH_01");
	TA_SitAround(20,55,21,0,"PSI_SMITH_01");
	TA_Smith_Fire(21,0,21,10,"PSI_SMITH_01");
	TA_Smith_Anvil(21,10,21,20,"PSI_SMITH_01");
	TA_Smith_Fire(21,20,21,30,"PSI_SMITH_01");
	TA_Smith_Anvil(21,30,21,40,"PSI_SMITH_01");
	TA_Smith_Cool(21,40,21,50,"PSI_SMITH_01");
	TA_Smith_Sharp(21,50,21,55,"PSI_SMITH_01");
	TA_SitAround(21,55,22,0,"PSI_SMITH_01");
	TA_Sleep(22,0,7,0,"PSI_7_HUT_IN");
	TA_Smith_Fire(7,0,7,10,"PSI_SMITH_01");
	TA_Smith_Anvil(7,10,7,20,"PSI_SMITH_01");
	TA_Smith_Fire(7,20,7,30,"PSI_SMITH_01");
	TA_Smith_Anvil(7,30,7,40,"PSI_SMITH_01");
	TA_Smith_Cool(7,40,7,50,"PSI_SMITH_01");
	TA_Smith_Sharp(7,50,7,55,"PSI_SMITH_01");
	TA_SitAround(7,55,8,0,"PSI_SMITH_01");
};

func void Rtn_PrepareRitual_1316()
{
};

func void Rtn_OMFull_1316()
{
};

func void Rtn_FMTaken_1316()
{
};

func void Rtn_OrcAssault_1316()
{
};

