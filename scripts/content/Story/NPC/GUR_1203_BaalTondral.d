instance GUR_1203_BaalTondral(Npc_Default)
{
	name[0] = "Baal Tondral";
	npcType = npctype_main;
	guild = GIL_GUR;
	level = 28;
	flags = NPC_FLAG_IMMORTAL;
	voice = 13;
	id = 1203;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
	attribute[ATR_HITPOINTS_MAX] = 418;
	attribute[ATR_HITPOINTS] = 418;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",24,2,gur_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,ItArRuneWindfist);
	fight_tactic = FAI_HUMAN_MAGE;
	daily_routine = Rtn_start_1203;
};

func void Rtn_start_1203()
{
	TA_Sleep(23,0,7,15,"PSI_28_HUT_IN");
	TA_Teaching(7,15,23,0,"PSI_PLATFORM_TEACHER");
};

func void rtn_ritual_1203()
{
	TA_Stay(5,0,1,0,"GURU_RITUAL_01");
	TA_Stay(1,0,5,0,"GURU_RITUAL_01");
};

func void rtn_afterritual_1203()
{
	TA_Sleep(23,0,7,45,"PSI_28_HUT_IN");
	TA_Boss(7,45,23,0,"PSI_27_HUT_EX");
};

