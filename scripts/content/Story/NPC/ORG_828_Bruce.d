instance ORG_828_Bruce(Npc_Default)
{
	name[0] = "Bruce";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 11;
	voice = 6;
	id = 828;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 202;
	attribute[ATR_HITPOINTS] = 202;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",35,2,org_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItems(self,ItFoRice,8);
	CreateInvItems(self,ItFoBooze,4);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItAt_Teeth_01);
	CreateInvItem(self,francos_amulett);
	EquipItem(self,ItMw_1H_Mace_War_01);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_828;
};

func void Rtn_start_828()
{
	TA_Sleep(1,30,7,0,"NC_HUT27_IN");
	TA_SitCampfire(7,0,10,30,"NC_PLACE07");
	TA_SitAround(10,30,19,30,"NC_TAVERN_SIDE01");
	TA_Smalltalk(19,30,1,30,"NC_PATH67");
};

