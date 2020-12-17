prototype Mst_Default_Bloodfly(C_Npc)
{
	name[0] = "Krvavá moucha";
	guild = GIL_BLOODFLY;
	aivar[AIV_IMPORTANT] = ID_BLOODFLY;
	level = 6;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1500;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_ITEMSTATUS] = OnlyRoutine;
};

func void Set_Bloodfly_Visuals()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Bloodfly(Mst_Default_Bloodfly)
{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
};

instance HelpBrothers_Bloodfly(Mst_Default_Bloodfly)
{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Bloodfly_01,2);
	name[0] = "Agresivní Krvavá moucha";
};

