instance VLK_5059_GARRET(Npc_Default)
{
	name[0] = "Garret";
	npcType = npctype_main;
	guild = GIL_VLK;
	level = 10;
	voice = 7;
	id = 5059;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 0;
	attribute[ATR_HITPOINTS] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",14,1,"Hum_Head_Psionic",67,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,garrets_pickaxe);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = rtn_start_5059;
};

func void rtn_start_5059()
{
	TA_Stand(8,0,20,0,"OM_133");
	TA_Stand(20,0,8,0,"OM_133");
};

