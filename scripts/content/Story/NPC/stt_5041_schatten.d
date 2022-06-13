instance STT_5041_SCHATTEN(Npc_Default)
{
	name[0] = NAME_Schatten;
	npcType = npctype_ambient;
	guild = GIL_STT;
	level = 9;
	voice = 12;
	id = 5041;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 154;
	attribute[ATR_HITPOINTS] = 154;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",4,1,stt_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,ItMw_1H_Sword_Short_04);
	EquipItem(self,ItRw_Bow_Small_03);
	CreateInvItems(self,ItAmArrow,16);
	CreateInvItems(self,ItKeLockpick,2);
	daily_routine = rtn_start_5041;
};

func void rtn_start_5041()
{
	TA_Smalltalk(0,0,23,0,"OW_MINE_TALK_01");
	TA_Smalltalk(23,0,24,0,"OW_MINE_TALK_01");
};

