instance NON_5042_WEGELAGERER(Npc_Default)
{
	name[0] = "Povaleč";
	npcType = Npctype_ROGUE;
	guild = GIL_None;
	level = 9;
	voice = 6;
	id = 5042;
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
	EquipItem(self,ItMw_1H_Axe_Old_01);
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItem(self,ItFoBeer);
	CreateInvItem(self,ItMiLute);
	CreateInvItem(self,ore_bandits_message3);
	daily_routine = rtn_start_5042;
};

func void rtn_start_5042()
{
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	TA_PlayTune(22,0,6,0,"OW_PATH_PLATEU_BDT_05");
	TA_PlayTune(6,0,22,0,"OW_PATH_PLATEU_BDT_05");
};

