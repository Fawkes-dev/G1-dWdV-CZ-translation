instance VLK_5071_BUDDLER(Npc_Default)
{
	name[0] = NAME_Buddler;
	npcType = Npctype_MINE_Ambient;
	guild = GIL_VLK;
	level = 3;
	voice = 3;
	id = 5071;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 118;
	attribute[ATR_HITPOINTS] = 118;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Pony",74,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItMwPickaxe);
	CreateInvItems(self,ItMiNugget,5);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_5071;
};

func void rtn_start_5071()
{
	TA_SitAround(0,0,23,0,"OW_MINE_VLK_01");
	TA_SitAround(23,0,24,0,"OW_MINE_VLK_01");
};

