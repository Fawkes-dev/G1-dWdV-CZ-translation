instance NON_5044_WEGELAGERER(Npc_Default)
{
	name[0] = "Povaleč";
	npcType = Npctype_ROGUE;
	guild = GIL_None;
	level = 9;
	voice = 9;
	id = 5044;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 205;
	attribute[ATR_HITPOINTS] = 205;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,2,"Hum_Head_Psionic",12,2,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItAt_Meatbug_01);
	CreateInvItem(self,ItAt_Teeth_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	daily_routine = rtn_start_5044;
};

func void rtn_start_5044()
{
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	TA_SitAround(22,0,6,0,"OW_PATH_PLATEU_BDT_06");
	TA_SitAround(6,0,22,0,"OW_PATH_PLATEU_BDT_06");
};

