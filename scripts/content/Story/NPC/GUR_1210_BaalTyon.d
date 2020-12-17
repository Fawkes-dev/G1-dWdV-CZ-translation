instance GUR_1210_BaalTyon(Npc_Default)
{
	name[0] = "Baal Tyon";
	npcType = npctype_friend;
	guild = GIL_GUR;
	level = 28;
	flags = NPC_FLAG_IMMORTAL;
	voice = 11;
	id = 1210;
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
	daily_routine = Rtn_start_1210;
	fight_tactic = FAI_HUMAN_MAGE;
};

func void Rtn_start_1210()
{
	TA_Teaching(16,0,23,0,"PSI_TEMPLE_COURT_GURU");
	TA_Teaching(23,0,16,0,"PSI_TEMPLE_COURT_GURU");
};

func void rtn_ritual_1210()
{
	TA_Stay(5,0,1,0,"GURU_RITUAL_05");
	TA_Stay(1,0,5,0,"GURU_RITUAL_05");
};

func void Rtn_PrepareRitual_1210()
{
	TA_SitAround(16,0,23,0,"PSI_TEMPLE_IN_05");
	TA_SitAround(23,0,16,0,"PSI_TEMPLE_IN_05");
};

func void Rtn_OMFull_1210()
{
	TA_SitAround(16,0,23,0,"PSI_TEMPLE_SITTING_PRIEST");
	TA_SitAround(23,0,16,0,"PSI_TEMPLE_SITTING_PRIEST");
};

func void Rtn_FMTaken_1210()
{
	TA_SitAround(16,0,23,0,"PSI_TEMPLE_SITTING_PRIEST");
	TA_SitAround(23,0,16,0,"PSI_TEMPLE_SITTING_PRIEST");
};

func void Rtn_OrcAssault_1210()
{
	TA_SitAround(16,0,23,0,"PSI_TEMPLE_SITTING_PRIEST");
	TA_SitAround(23,0,16,0,"PSI_TEMPLE_SITTING_PRIEST");
};

