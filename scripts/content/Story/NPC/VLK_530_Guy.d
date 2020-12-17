instance VLK_530_Guy(Npc_Default)
{
	name[0] = "Guy";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 530;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 94;
	attribute[ATR_HITPOINTS] = 94;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",17,1,"Hum_Head_Psionic",72,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	EquipItem(self,ItMwPickaxe);
	CreateInvItems(self,ItMiNugget,2);
	CreateInvItem(self,ItFo_Potion_Water_01);
	daily_routine = Rtn_start_530;
};

func void Rtn_start_530()
{
	TA_Sleep(23,0,7,1,"OCR_HUT_25");
	TA_SitAround(7,1,7,30,"OCR_HUT_25");
	TA_Smalltalk(7,30,17,0,"OCR_OUTSIDE_HUT_27");
	TA_SitAround(17,0,19,5,"OCR_OUTSIDE_ARENA_BENCH_2");
	TA_ArenaSpectator(19,5,23,0,"OCR_ARENA_07");
};

func void rtn_arenafight_530()
{
	TA_Stand(23,0,7,0,"OCR_OUTSIDE_ARENA");
	TA_Stand(7,0,23,0,"OCR_OUTSIDE_ARENA");
};

