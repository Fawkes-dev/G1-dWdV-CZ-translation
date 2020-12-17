instance NOV_5022_NOVIZE(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 7;
	voice = 3;
	id = 5022;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 238;
	attribute[ATR_HITPOINTS] = 238;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",75,1,nov_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Mace_01);
	CreateInvItem(self,ItFoSoup);
	daily_routine = rtn_start_5022;
};

func void rtn_start_5022()
{
	TA_Meditate(0,0,23,0,"PSI_TEMPLE_PRAY_01");
	TA_Meditate(23,0,24,0,"PSI_TEMPLE_PRAY_01");
};

func void rtn_psi_5022()
{
	TA_Stay(9,0,21,0," ");
	TA_Stay(21,0,9,0," ");
};

