prototype Mst_Default_Swampshark(C_Npc)
{
	name[0] = "Bažinný žralok";
	guild = GIL_SWAMPSHARK;
	aivar[AIV_IMPORTANT] = ID_SWAMPSHARK;
	level = 24;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 358;
	attribute[ATR_HITPOINTS] = 358;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SWAMPSHARK;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[AIV_HIGHWAYMEN] = 1000;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_Trigger3] = OnlyRoutine;
};

func void Set_Swampshark_Visuals()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Swampshark(Mst_Default_Swampshark)
{
	Set_Swampshark_Visuals();
	Npc_SetToFistMode(self);
};

instance HurtSwampshark(Mst_Default_Swampshark)
{
	name[0] = "Zraněný Bažinný žralok";
	attribute[ATR_HITPOINTS_MAX] = 2200;
	attribute[ATR_HITPOINTS] = 500;
	Set_Swampshark_Visuals();
	Npc_SetToFistMode(self);
};

