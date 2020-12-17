instance TPL_1405_GorNaRan(Npc_Default)
{
	name[0] = "Gor Na Ran";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 1405;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 322;
	attribute[ATR_HITPOINTS] = 322;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,3,"Hum_Head_FatBald",0,1,tpl_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_02);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = Rtn_start_1405;
};

func void Rtn_start_1405()
{
	TA_GuardPalisade(0,0,12,0,"PSI_GUARD3");
	TA_GuardPalisade(12,0,24,0,"PSI_GUARD3");
};

func void Rtn_PrepareRitual_1405()
{
	TA_GuardPalisade(0,0,12,0,"PSI_GUARD3");
	TA_GuardPalisade(12,0,24,0,"PSI_GUARD3");
};

func void Rtn_OMFull_1405()
{
	TA_GuardPalisade(0,0,12,0,"PSI_GUARD3");
	TA_GuardPalisade(12,0,24,0,"PSI_GUARD3");
};

func void Rtn_FMTaken_1405()
{
	TA_GuardPalisade(0,0,12,0,"PSI_GUARD3");
	TA_GuardPalisade(12,0,24,0,"PSI_GUARD3");
};

func void Rtn_OrcAssault_1405()
{
	TA_GuardPalisade(0,0,12,0,"PSI_GUARD3");
	TA_GuardPalisade(12,0,24,0,"PSI_GUARD3");
};

func void rtn_flee_1405()
{
	TA_Stay(0,0,12,0,"");
	TA_Stay(12,0,24,0,"");
};

instance TPL_5056_GORNARAN(Npc_Default)
{
	name[0] = "Gor Na Ran";
	npcType = npctype_main;
	guild = GIL_BAU;
	level = 100;
	flags = 0;
	voice = 13;
	id = 5056;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_EDGE] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 70;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 322;
	attribute[ATR_HITPOINTS] = 322;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,3,"Hum_Head_FatBald",0,1,tpl_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_02);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = rtn_start_5056;
};

func void rtn_start_5056()
{
	TA_Stand(0,0,12,0,"TPL_329");
	TA_Stand(12,0,24,0,"TPL_329");
};

