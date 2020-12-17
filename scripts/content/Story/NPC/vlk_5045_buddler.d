instance VLK_5045_BUDDLER(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = npctype_ambient;
	guild = GIL_VLK;
	level = 3;
	voice = 2;
	id = 5045;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 118;
	attribute[ATR_HITPOINTS] = 118;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,2,"Hum_Head_FatBald",2,1,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMwPickaxe);
	CreateInvItems(self,ItMiNugget,2);
	CreateInvItem(self,ItFoBeer);
	daily_routine = rtn_start_5045;
};

func void rtn_start_5045()
{
	TA_Smalltalk(0,0,23,0,"WP_INTRO_SMALLTALK_01");
	TA_Smalltalk(23,0,24,0,"WP_INTRO_SMALLTALK_01");
};

