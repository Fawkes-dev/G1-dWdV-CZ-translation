instance TPL_1400_GorNaBar(Npc_Default)
{
	name[0] = "Gor Na Bar";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 9;
	id = 1400;
	attribute[ATR_STRENGTH] = 95;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 274;
	attribute[ATR_HITPOINTS] = 274;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_FatBald",16,1,tpl_armor_m_latinobody);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_03);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_3);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_1400;
};

func void Rtn_start_1400()
{
	TA_Smalltalk(0,0,12,0,"OM_CAVE1_56");
	TA_Smalltalk(12,0,24,0,"OM_CAVE1_56");
};

func void Rtn_Gate_1400()
{
	TA_Guard(0,0,12,0,"OM_CAVE3_26");
	TA_Guard(12,0,24,0,"OM_CAVE3_26");
};

func void rtn_omfull_1400()
{
	TA_Guard(0,0,12,0,"");
	TA_Guard(12,0,24,0,"");
};

instance TPL_5066_GORNABAR(Npc_Default)
{
	name[0] = "Gor Na Bar";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 9;
	id = 5066;
	attribute[ATR_STRENGTH] = 95;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 274;
	attribute[ATR_HITPOINTS] = 274;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_FatBald",16,1,tpl_armor_m_latinobody);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_03);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_3);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_5066;
};

func void rtn_start_5066()
{
	TA_GuardPalisade(6,0,12,0,"PSI_PLATFORM_WAIT");
	TA_GuardPalisade(12,0,18,0,"PSI_PATH_9_2");
	TA_GuardPalisade(18,0,6,0,"PSI_MEETINGPOINT");
};

