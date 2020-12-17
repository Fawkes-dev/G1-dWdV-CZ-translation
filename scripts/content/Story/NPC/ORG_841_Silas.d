instance ORG_841_Silas(Npc_Default)
{
	name[0] = "Silas";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 15;
	voice = 6;
	id = 841;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",5,1,org_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	CreateInvItems(self,ItMiNugget,60);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoApple,5);
	CreateInvItems(self,ItFoBooze,15);
	CreateInvItems(self,ItMi_Alchemy_Alcohol_01,10);
	CreateInvItems(self,ItFo_Potion_Health_01,5);
	CreateInvItems(self,ItFo_Potion_Health_02,2);
	CreateInvItems(self,ItFo_Potion_Mana_01,5);
	CreateInvItems(self,ItFo_Potion_Mana_02,2);
	CreateInvItems(self,ItFo_Potion_Water_01,5);
	CreateInvItems(self,ItMiJoint_1,5);
	CreateInvItems(self,ItMiJoint_2,3);
	CreateInvItems(self,ItMiJoint_3,1);
	EquipItem(self,Silas_Axt);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,100);
	daily_routine = Rtn_start_841;
};

func void Rtn_start_841()
{
	TA_Boss(10,0,3,0,"NC_TAVERN_ROOM04");
	TA_Sleep(3,0,10,0,"NC_TAVERN_BACKROOM09");
};

