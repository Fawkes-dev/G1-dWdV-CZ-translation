instance TPL_1455_GorBoba(Npc_Default)
{
	name[0] = "Gor Boba";
	npcType = npctype_main;
	guild = GIL_BAU;
	level = 50;
	voice = 8;
	id = 1455;
	attribute[ATR_STRENGTH] = 95;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 274;
	attribute[ATR_HITPOINTS] = 274;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 75;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",117,2,tpl_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,ItMw_2H_Sword_Light_02);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	CreateInvItem(self,ItFo_Potion_Health_02);
	daily_routine = Rtn_OT_1455;
};

func void Rtn_start_1455()
{
	TA_Guard(9,0,21,0,"TPL_408");
	TA_Guard(21,0,9,0,"TPL_408");
};

func void Rtn_OT_1455()
{
	TA_AlignGuard(9,0,21,0,"TPL_110");
	TA_AlignGuard(21,0,9,0,"TPL_110");
};

instance TPL_5026_GORBOBA(Npc_Default)
{
	name[0] = "Gor Boba";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 50;
	voice = 8;
	id = 5026;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 95;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 274;
	attribute[ATR_HITPOINTS] = 274;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 75;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",65,2,tpl_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,ItMw_2H_Sword_Light_02);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	CreateInvItem(self,ItFo_Potion_Health_02);
	daily_routine = rtn_start_5026;
};

func void rtn_start_5026()
{
	TA_Stand(9,0,21,0,"PSI_GATE_GUARD_TOP_01");
	TA_Stand(21,0,9,0,"PSI_GATE_GUARD_TOP_01");
};

func void rtn_psi_5026()
{
	TA_Stay(9,0,21,0," ");
	TA_Stay(21,0,9,0," ");
};

