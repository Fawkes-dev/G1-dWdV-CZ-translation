instance VLK_513_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 513;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 94;
	attribute[ATR_HITPOINTS] = 94;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",72,2,vlk_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_513;
};

func void Rtn_start_513()
{
	TA_Sleep(23,0,8,0,"OCR_HUT_24");
	TA_Smalltalk(8,0,17,0,"OCR_OUTSIDE_HUT_24");
	TA_SitAround(17,0,19,0,"OCR_OUTSIDE_ARENA_BENCH1");
	TA_ArenaSpectator(19,0,23,0,"OCR_ARENA_05");
};

func void rtn_arenafightbefore_513()
{
	TA_ArenaSpectator(23,0,7,0,"OCR_ARENA_05");
	TA_ArenaSpectator(7,0,23,0,"OCR_ARENA_05");
};

func void rtn_arenafight_513()
{
	ta_arenafight(23,0,7,0,"OCR_ARENA_05");
	ta_arenafight(7,0,23,0,"OCR_ARENA_05");
};

