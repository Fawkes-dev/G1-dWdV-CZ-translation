instance NOV_1334_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 9;
	voice = 3;
	id = 1334;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 178;
	attribute[ATR_HITPOINTS] = 178;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",29,2,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Hatchet_01);
	daily_routine = Rtn_start_1334;
};

func void Rtn_start_1334()
{
	TA_PickRice(7,0,12,0,"PATH_TAKE_HERB_06");
	TA_PickRice(12,0,19,0,"PSI_TAKE_HERB_SECONDARY_01");
	TA_PickRice(19,0,7,0,"PATH_TAKE_HERB_02");
};

