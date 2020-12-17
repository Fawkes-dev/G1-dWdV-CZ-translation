instance NOV_1301_Caine(Npc_Default)
{
	name[0] = "Caine";
	npcType = npctype_main;
	guild = GIL_NOV;
	level = 9;
	voice = 13;
	id = 1301;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 35;
	attribute[ATR_MANA] = 35;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",21,1,nov_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Mace_01);
	CreateInvItems(self,ItMiNugget,5);
	CreateInvItems(self,ItFoRice,2);
	CreateInvItems(self,ItFoBooze,6);
	daily_routine = Rtn_start_1301;
};

func void Rtn_start_1301()
{
	TA_Sleep(23,0,8,0,"PSI_20_HUT_IN");
	TA_PotionAlchemy(8,0,9,0,"PSI_LABOR_BASEMENT_1");
	TA_Smoke(9,0,9,15,"PSI_PATH_7_14");
	TA_HerbAlchemy(9,15,10,0,"PSI_LABOR_BASEMENT_1");
	TA_PotionAlchemy(10,0,11,0,"PSI_LABOR_BASEMENT_1");
	TA_Smoke(11,0,11,15,"PSI_PATH_7_14");
	TA_HerbAlchemy(11,15,12,0,"PSI_LABOR_BASEMENT_1");
	TA_PotionAlchemy(12,0,13,0,"PSI_LABOR_BASEMENT_1");
	TA_Smoke(13,0,13,15,"PSI_PATH_7_14");
	TA_HerbAlchemy(13,15,14,0,"PSI_LABOR_BASEMENT_1");
	TA_PotionAlchemy(14,0,15,0,"PSI_LABOR_BASEMENT_1");
	TA_Smoke(15,0,15,15,"PSI_PATH_7_14");
	TA_HerbAlchemy(15,15,16,0,"PSI_LABOR_BASEMENT_1");
	TA_PotionAlchemy(16,0,17,0,"PSI_LABOR_BASEMENT_1");
	TA_Smoke(17,0,17,15,"PSI_PATH_7_14");
	TA_HerbAlchemy(17,15,18,0,"PSI_LABOR_BASEMENT_1");
	TA_PotionAlchemy(18,0,19,0,"PSI_LABOR_BASEMENT_1");
	TA_Smoke(19,0,19,15,"PSI_PATH_7_14");
	TA_HerbAlchemy(19,15,20,0,"PSI_LABOR_BASEMENT_1");
	TA_PotionAlchemy(20,0,21,0,"PSI_LABOR_BASEMENT_1");
	TA_Smoke(21,0,21,15,"PSI_PATH_7_14");
	TA_HerbAlchemy(21,15,22,0,"PSI_LABOR_BASEMENT_1");
	TA_PotionAlchemy(22,0,23,0,"PSI_LABOR_BASEMENT_1");
};

func void rtn_herbs_1301()
{
	TA_PotionAlchemy(8,0,22,0,"PSI_LABOR_BASEMENT_1");
	TA_PotionAlchemy(22,0,8,0,"PSI_LABOR_BASEMENT_1");
};

