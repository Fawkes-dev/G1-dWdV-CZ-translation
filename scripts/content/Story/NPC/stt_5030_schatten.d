instance STT_5030_SCHATTEN(Npc_Default)
{
	name[0] = NAME_Schatten;
	npcType = npctype_ambient;
	guild = GIL_STT;
	level = 5;
	voice = 12;
	id = 304;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 154;
	attribute[ATR_HITPOINTS] = 154;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",4,2,stt_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_Short_02);
	EquipItem(self,ItRw_Bow_Small_01);
	CreateInvItems(self,ItAmArrow,14);
	CreateInvItem(self,ItFo_Potion_Water_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItKeLockpick,2);
	daily_routine = rtn_start_5030;
};

func void rtn_start_5030()
{
	TA_SitAround(14,0,6,0,"WP_INTRO_NEW_06");
	TA_WashSelf(6,0,6,25,"WP_INTRO_SHORE");
	TA_RepairHut(6,25,14,0,"WP_INTRO_NEW_05");
};

