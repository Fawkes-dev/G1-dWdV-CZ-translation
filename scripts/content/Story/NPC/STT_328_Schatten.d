instance STT_328_Schatten(Npc_Default)
{
	name[0] = NAME_Schatten;
	npcType = npctype_ambient;
	guild = GIL_STT;
	level = 5;
	voice = 12;
	id = 328;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 154;
	attribute[ATR_HITPOINTS] = 154;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",14,2,stt_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_Short_02);
	EquipItem(self,ItRw_Bow_Small_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_328;
};

func void Rtn_start_328()
{
	TA_Sleep(23,5,7,0,"OCR_HUT_22");
	TA_SitAround(7,0,11,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_CookForMe(11,0,17,30,"OCR_OUTSIDE_HUT_24_COOK");
	TA_SitAround(17,30,19,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_ArenaSpectator(19,0,23,5,"OCR_ARENA_05");
};

func void rtn_arenafightbefore_328()
{
	TA_ArenaSpectator(23,0,7,0,"OCR_ARENA_05");
	TA_ArenaSpectator(7,0,23,0,"OCR_ARENA_05");
};

func void rtn_arenafight_328()
{
	ta_arenafight(23,0,7,0,"OCR_ARENA_05");
	ta_arenafight(7,0,23,0,"OCR_ARENA_05");
};

