instance NON_5053_WEGELAGERER(Npc_Default)
{
	name[0] = "Povaleč";
	npcType = npctype_main;
	guild = GIL_None;
	level = 9;
	voice = 9;
	id = 5053;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 205;
	attribute[ATR_HITPOINTS] = 205;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,3,"Hum_Head_FatBald",6,3,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItem(self,ItAt_Teeth_01);
	CreateInvItem(self,ItFoBeer);
	daily_routine = rtn_start_5053;
};

func void rtn_start_5053()
{
	TA_Boss(22,0,6,0,"LOCATION_15_IN");
	TA_Boss(6,0,22,0,"LOCATION_15_IN");
};

