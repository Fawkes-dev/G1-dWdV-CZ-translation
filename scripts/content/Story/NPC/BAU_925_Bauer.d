instance BAU_925_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	npcType = npctype_ambient;
	guild = GIL_BAU;
	level = 2;
	voice = 4;
	id = 925;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 94;
	attribute[ATR_HITPOINTS] = 94;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_Bald",45,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Sickle_01);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	CreateInvItems(self,ItFoRice,4);
	daily_routine = Rtn_start_925;
};

func void Rtn_start_925()
{
	TA_PickRice(8,0,20,0,"NC_PATH_068");
	TA_Sleep(20,0,8,0,"NC_PATH_PEASANT2");
};

