instance NON_5058_WEGELAGERER(Npc_Default)
{
	name[0] = "Povaleč";
	npcType = Npctype_ROGUE;
	guild = GIL_None;
	level = 9;
	voice = 9;
	id = 5058;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 205;
	attribute[ATR_HITPOINTS] = 205;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",8,0,"Hum_Head_Thief",20,3,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_Short_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItem(self,ItFoMutton);
	CreateInvItem(self,ItFoBeer);
	daily_routine = rtn_start_5058;
};

func void rtn_start_5058()
{
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	TA_SitAround(8,0,20,0,"LOCATION_02_04_01");
	TA_Sleep(20,0,8,0,"LOCATION_02_07");
};

