instance Org_829_Organisator(Npc_Default)
{
	name[0] = NAME_Torwache;
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 4;
	voice = 6;
	id = 829;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 166;
	attribute[ATR_HITPOINTS] = 166;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",8,1,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	EquipItem(self,ItMw_1H_Mace_01);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,9);
	CreateInvItems(self,ItFoRice,8);
	CreateInvItems(self,ItFoBooze,2);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItAt_Teeth_01);
	daily_routine = Rtn_start_829;
};

func void Rtn_start_829()
{
	TA_GuardPassage(7,50,19,50,"OW_PATH_07_21_GUARD_RIGHT");
	TA_Smalltalk(19,50,7,50,"OW_PATH_069");
};

