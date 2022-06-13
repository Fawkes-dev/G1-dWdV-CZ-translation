instance GUR_1204_BaalNamib(Npc_Default)
{
	name[0] = "Baal Namib";
	npcType = npctype_main;
	guild = GIL_GUR;
	level = 29;
	flags = NPC_FLAG_IMMORTAL;
	voice = 2;
	id = 1204;
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
	CreateInvItem(self,ItArRuneSleep);
	EquipItem(self,Namibs_Keule);
	daily_routine = Rtn_Start_1204;
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	aivar[AIV_IMPORTANT] = TRUE;
};

func void Rtn_Start_1204()
{
	TA_Smalltalk(8,0,23,0,"PSI_PATH_1");
	TA_Sleep(23,0,8,0,"PSI_GUARD_TREE_IN");
};

func void rtn_tattooritual_1204()
{
	TA_Stand(8,0,23,0,"WP_PSI_RITUAL_SWAMP_02");
	TA_Stand(23,0,8,0,"WP_PSI_RITUAL_SWAMP_02");
};

func void rtn_ritual_1204()
{
	TA_Stay(5,0,1,0,"GURU_RITUAL_02");
	TA_Stay(1,0,5,0,"GURU_RITUAL_02");
};

