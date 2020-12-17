prototype Mst_Default_Harpie(C_Npc)
{
	name[0] = "Harpie";
	guild = GIL_DEMON;
	aivar[AIV_IMPORTANT] = ID_HARPIE;
	level = 18;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 210;
	attribute[ATR_HITPOINTS] = 210;
	attribute[ATR_MANA_MAX] = 110;
	attribute[ATR_MANA] = 110;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Demon;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 2500;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[AIV_HIGHWAYMEN] = 2000;
	aivar[AIV_HAS_ERPRESSED] = 3;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_Harpie_Visuals()
{
	Mdl_SetVisual(self,"Harpie.mds");
	Mdl_SetVisualBody(self,"Har_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Harpie(Mst_Default_Harpie)
{
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
};

