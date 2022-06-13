instance NOV_1302_Viran(Npc_Default)
{
	name[0] = "Viran";
	npcType = npctype_main;
	guild = GIL_NOV;
	level = 15;
	voice = 7;
	id = 1302;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 130;
	attribute[ATR_HITPOINTS] = 130;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",26,3,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	EquipItem(self,ItMw_2H_Staff_02);
	CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
	CreateInvItems(self,ItMiNugget,5);
	CreateInvItems(self,ItFoRice,2);
	CreateInvItems(self,ItFoBooze,6);
	daily_routine = Rtn_start_1302;
};

func void Rtn_start_1302()
{
	TA_Boss(7,0,19,0,"PATH_TAKE_HERB_2_1");
	TA_Boss(19,0,7,0,"PATH_TAKE_HERB_2_1");
};

