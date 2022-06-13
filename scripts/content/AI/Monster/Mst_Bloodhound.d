prototype Mst_Default_Bloodhound(C_Npc)
{
	name[0] = "Lovecký pes";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_IMPORTANT] = ID_BLOODHOUND;
	level = 22;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 190;
	attribute[ATR_HITPOINTS] = 190;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 65;
	protection[PROT_EDGE] = 65;
	protection[PROT_POINT] = 66;
	protection[PROT_FIRE] = 65;
	protection[PROT_FLY] = 65;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 2500;
	aivar[AIV_BEENATTACKED] = 2000;
	aivar[AIV_HIGHWAYMEN] = 1800;
	aivar[AIV_HAS_ERPRESSED] = 2;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_Trigger3] = OnlyRoutine;
};

func void Set_Bloodhound_Visuals()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Bhd_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Bloodhound(Mst_Default_Bloodhound)
{
	Set_Bloodhound_Visuals();
	Npc_SetToFistMode(self);
};

