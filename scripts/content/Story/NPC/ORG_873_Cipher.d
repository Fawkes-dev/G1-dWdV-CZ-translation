instance ORG_873_Cipher(Npc_Default)
{
	name[0] = "Cipher";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 8;
	voice = 12;
	id = 873;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 166;
	attribute[ATR_HITPOINTS] = 166;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",50,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItMiNugget,140);
	CreateInvItems(self,ItMiJoint_1,5);
	CreateInvItems(self,ItMiJoint_2,10);
	CreateInvItems(self,ItMi_Plants_Swampherb_01,40);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,40);
	daily_routine = Rtn_start_873;
};

func void Rtn_start_873()
{
	TA_Sleep(3,5,8,0,"NC_HUT24_IN");
	TA_WashSelf(8,0,8,30,"NC_WASH_04");
	TA_StandAround(8,30,3,5,"NC_TAVERN_BAR");
};

