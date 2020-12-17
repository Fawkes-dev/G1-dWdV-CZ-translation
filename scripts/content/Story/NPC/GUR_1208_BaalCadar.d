instance GUR_1208_BaalCadar(Npc_Default)
{
	name[0] = "Baal Cadar";
	npcType = npctype_main;
	guild = GIL_GUR;
	level = 28;
	flags = NPC_FLAG_IMMORTAL;
	voice = 2;
	id = 1208;
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
	CreateInvItem(self,ItArRuneWindfist);
	B_Give_BaalCadarChapter1Runes();
	fight_tactic = FAI_HUMAN_MAGE;
	daily_routine = Rtn_start_1208;
};

func void Rtn_start_1208()
{
	TA_Sleep(2,0,7,1,"PSI_23_HUT_IN");
	ta_teaching_cadar(7,1,2,0,"PSI_TEACH_CADAR");
};

func void rtn_ritual_1208()
{
	TA_Stay(5,0,1,0,"GURU_RITUAL_03");
	TA_Stay(1,0,5,0,"GURU_RITUAL_03");
};

func void rtn_afterritual_1208()
{
	TA_Sleep(2,0,8,0,"PSI_23_HUT_IN");
	TA_Smoke(8,0,2,0,"PSI_23_HUT_EX");
};

