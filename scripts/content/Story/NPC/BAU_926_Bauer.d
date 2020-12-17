instance BAU_926_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	npcType = npctype_ambient;
	guild = GIL_BAU;
	level = 2;
	voice = 2;
	id = 926;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 94;
	attribute[ATR_HITPOINTS] = 94;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_Thief",2,2,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,ItFoRice,3);
	CreateInvItem(self,ItFoBooze);
	EquipItem(self,ItMw_1H_Sickle_01);
	daily_routine = Rtn_start_926;
};

func void Rtn_start_926()
{
	TA_PickRice(8,0,20,0,"NC_PATH_080");
	TA_Sleep(20,0,8,0,"NC_PATH_PEASANT2");
};

