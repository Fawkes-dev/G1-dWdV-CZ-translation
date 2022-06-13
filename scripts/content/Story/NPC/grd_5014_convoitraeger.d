instance GRD_5014_CONVOITRAEGER(Npc_Default)
{
	name[0] = NAME_ConvoiTraeger;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 15;
	voice = 6;
	id = 5014;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",95,2,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,ItMw_1H_LightGuardsSword_03);
	CreateInvItems(self,ItFoApple,10);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFo_mutton_01,3);
	CreateInvItems(self,ItFoBeer,5);
	CreateInvItems(self,ItFoCheese,5);
	CreateInvItems(self,ItFoWine,2);
	daily_routine = rtn_start_5014;
};

func void rtn_start_5014()
{
	TA_Sleep(23,0,6,0,"OCC_GUARD_ROOM_BACK2");
	TA_SitAround(6,0,23,0,"OCC_CONVOY_01");
};

func void rtn_alternativ_5014()
{
	TA_Sleep(23,0,6,0,"OCC_GUARD_ROOM_BACK2");
	TA_SitAround(6,0,8,0,"OCC_CONVOY_01");
	TA_SitAround(8,0,13,0,"OW_OM_ENTRANCE02");
	TA_SitAround(13,0,23,0,"OCC_CONVOY_01");
};

func void rtn_convoy_5014()
{
	TA_SitAround(23,0,16,0,"SPAWN_OW_SCAVENGER_OCWOODEND2");
	TA_SitAround(16,0,23,0,"SPAWN_OW_SCAVENGER_OCWOODEND2");
};

