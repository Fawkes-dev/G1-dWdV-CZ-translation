instance BAU_914_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	npcType = npctype_ambient;
	guild = GIL_BAU;
	level = 2;
	voice = 9;
	id = 914;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 106;
	attribute[ATR_HITPOINTS] = 106;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",9,2,"Hum_Head_Bald",1,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,ItFoRice,6);
	EquipItem(self,ItMw_1H_Scythe_01);
	daily_routine = Rtn_start_914;
};

func void Rtn_start_914()
{
	TA_Sleep(20,20,7,20,"NC_PATH_PEASANT2");
	TA_PickRice(7,20,20,20,"NC_PATH81");
};

