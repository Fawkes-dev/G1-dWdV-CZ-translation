instance SFB_1000_Senyan(Npc_Default)
{
	name[0] = "Senyan";
	npcType = npctype_main;
	guild = GIL_SFB;
	level = 3;
	voice = 1;
	id = 1000;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 106;
	attribute[ATR_HITPOINTS] = 106;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",7,1,"Hum_Head_Psionic",42,1,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItFoRice,4);
	CreateInvItems(self,ItMiNugget,7);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	EquipItem(self,ItMw_1H_Nailmace_01);
	daily_routine = Rtn_start_1000;
};

func void Rtn_start_1000()
{
	TA_StandAround(10,5,22,0,"NC_TAVERN_ROOM06");
	TA_SitAround(22,0,8,0,"NC_TAVERN_SIT");
	TA_WashSelf(8,0,8,30,"NC_WASH_02");
	TA_StandAround(8,30,10,5,"NC_TAVERN_ROOM06");
};

