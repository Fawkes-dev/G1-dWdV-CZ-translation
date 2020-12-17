instance GUR_1201_CorKalom(Npc_Default)
{
	name[0] = "Cor Kalom";
	npcType = npctype_friend;
	guild = GIL_GUR;
	level = 30;
	voice = 10;
	id = 1201;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
	attribute[ATR_HITPOINTS_MAX] = 430;
	attribute[ATR_HITPOINTS] = 430;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Psionic",19,0,gur_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	EquipItem(self,Kaloms_Schwert);
	CreateInvItem(self,ItArRuneSleep);
	daily_routine = Rtn_start_1201;
	fight_tactic = FAI_HUMAN_MAGE;
};

func void Rtn_start_1201()
{
	TA_PotionAlchemy(9,0,21,0,"PSI_LABOR_IN");
	TA_PotionAlchemy(21,0,9,0,"PSI_LABOR_IN");
};

func void rtn_startagain_1201()
{
	TA_PotionAlchemy(9,0,21,0,"PSI_LABOR_IN");
	TA_Sleep(21,0,9,0,"PSI_22_HUT_IN");
};

func void Rtn_CallSleeper_1201()
{
	TA_Stay(0,0,12,0,"PSI_TEMPLE_STAIRS_RIGHT");
	TA_Stay(12,0,24,0,"PSI_TEMPLE_STAIRS_RIGHT");
};

func void Rtn_Flee_1201()
{
	TA_Stay(0,0,12,0,"");
	TA_Stay(12,0,24,0,"");
};

