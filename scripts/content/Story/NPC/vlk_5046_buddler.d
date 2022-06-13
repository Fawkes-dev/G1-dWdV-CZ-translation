instance VLK_5046_BUDDLER(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_VLK;
	level = 3;
	voice = 4;
	id = 5046;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 118;
	attribute[ATR_HITPOINTS] = 118;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,3,"Hum_Head_Bald",7,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,7);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItFo_Potion_Water_01);
	daily_routine = rtn_start_5046;
};

func void rtn_start_5046()
{
	TA_Smalltalk(0,0,23,0,"WP_INTRO_SMALLTALK_01");
	TA_Smalltalk(23,0,24,0,"WP_INTRO_SMALLTALK_01");
};

