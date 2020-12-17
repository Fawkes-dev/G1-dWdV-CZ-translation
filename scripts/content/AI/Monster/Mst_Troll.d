prototype Mst_Default_Troll(C_Npc)
{
	name[0] = "Trol";
	guild = GIL_TROLL;
	aivar[AIV_IMPORTANT] = ID_TROLL;
	level = 50;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 430;
	attribute[ATR_HITPOINTS] = 430;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_Troll_Visuals()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Troll(Mst_Default_Troll)
{
	Set_Troll_Visuals();
	Npc_SetToFistMode(self);
};

instance YoungTroll(Mst_Default_Troll)
{
	name[0] = "Malý Trol";
	guild = GIL_TROLL;
	aivar[AIV_IMPORTANT] = ID_TROLL;
	level = 50;
	id = mid_youngtroll;
	Set_Troll_Visuals();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 430;
	attribute[ATR_HITPOINTS] = 430;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 60;
	Npc_SetToFistMode(self);
	fight_tactic = FAI_TROLL;
	damagetype = DAM_FLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 4000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 3000;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[AIV_HIGHWAYMEN] = 2000;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

