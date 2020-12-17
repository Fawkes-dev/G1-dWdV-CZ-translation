prototype Mst_Default_OrcBiter(C_Npc)
{
	name[0] = "Kousavec";
	guild = GIL_ORCDOG;
	aivar[AIV_IMPORTANT] = ID_ORCBITER;
	level = 12;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 110;
	attribute[ATR_HITPOINTS] = 110;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_OrcBiter_Visuals()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_ApplyOverlayMds(self,"Orcbiter.mds");
	Mdl_SetVisualBody(self,"Sc2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance OrcBiter(Mst_Default_OrcBiter)
{
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
};

