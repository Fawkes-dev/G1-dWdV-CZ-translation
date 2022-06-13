instance VLK_541_Buddler(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = Npctype_MINE_Ambient;
	guild = GIL_VLK;
	level = 3;
	voice = 1;
	id = 541;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 94;
	attribute[ATR_HITPOINTS] = 94;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",12,1,"Hum_Head_Fighter",107,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItFoApple);
	daily_routine = Rtn_start_541;
};

func void Rtn_start_541()
{
	TA_PickOre(0,0,23,0,"OM_020");
	TA_PickOre(23,0,24,0,"OM_020");
};

