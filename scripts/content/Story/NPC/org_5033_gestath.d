instance ORG_5033_GESTATH(Npc_Default)
{
	name[0] = "Gestath";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 18;
	voice = 9;
	id = 5033;
	attribute[ATR_STRENGTH] = 95;
	attribute[ATR_DEXTERITY] = 85;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 360;
	attribute[ATR_HITPOINTS] = 360;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Psionic",12,0,non_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Mace_War_02);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,30);
	CreateInvItems(self,ItFoMutton,2);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItAt_Wolf_02,1);
	CreateInvItems(self,ItAt_Teeth_01,2);
	CreateInvItems(self,ItAt_Claws_01,3);
	CreateInvItems(self,ItFo_Potion_Health_02,1);
	daily_routine = rtn_start_5033;
};

func void rtn_start_5033()
{
	TA_SitAround(8,0,23,0,"OW_PATH_3002_MOVE9");
	TA_SitAround(23,0,8,0,"OW_PATH_3002_MOVE9");
};

func void rtn_alternative_5033()
{
	TA_SitAround(22,0,6,0,"OW_PATH_PLATEU_BDT_05");
	TA_SitAround(6,0,22,0,"OW_PATH_PLATEU_BDT_05");
};

