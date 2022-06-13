instance TPL_1406_Templer(Npc_Default)
{
	name[0] = "Kalomův osobní strážce";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 25;
	voice = 13;
	id = 1406;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 322;
	attribute[ATR_HITPOINTS] = 322;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",63,2,tpl_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	EquipItem(self,ItMw_2H_Sword_Light_02);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = Rtn_start_1406;
};

func void Rtn_start_1406()
{
	TA_GuardPassage(9,0,21,0,"PSI_LABOR_GUARD_1");
	TA_GuardPassage(21,0,9,0,"PSI_LABOR_GUARD_1");
};

func void rtn_kalomsaway_1406()
{
	TA_GuardPassage(9,0,21,0,"PSI_22_HUT_EX");
	TA_GuardPassage(21,0,9,0,"PSI_22_HUT_EX");
};

