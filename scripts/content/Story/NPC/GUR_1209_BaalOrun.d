instance GUR_1209_BaalOrun(Npc_Default)
{
	name[0] = "Baal Orun";
	npcType = npctype_main;
	guild = GIL_GUR;
	level = 28;
	flags = NPC_FLAG_IMMORTAL;
	voice = 12;
	id = 1209;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
	attribute[ATR_HITPOINTS_MAX] = 418;
	attribute[ATR_HITPOINTS] = 418;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,Oruns_Keule);
	daily_routine = Rtn_start_1209;
	fight_tactic = FAI_HUMAN_MAGE;
};

func void Rtn_start_1209()
{
	TA_Boss(7,0,0,0,"PSI_PATH_2_6");
	TA_Sleep(0,0,7,0,"PSI_TREE_IN");
};

func void rtn_ritual_1209()
{
	TA_Stay(5,0,1,0,"GURU_RITUAL_04");
	TA_Stay(1,0,5,0,"GURU_RITUAL_04");
};

