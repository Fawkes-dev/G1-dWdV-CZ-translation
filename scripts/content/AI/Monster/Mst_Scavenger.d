prototype Mst_Default_Scavenger(C_Npc)
{
	name[0] = "Mrchožrout";
	guild = GIL_SCAVENGER;
	aivar[AIV_IMPORTANT] = ID_SCAVENGER;
	level = 6;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_WARNTARGET] = 22;
	aivar[AIV_LASTHITBYRANGEDWEAPON] = 6;
	aivar[AIV_GUARDITERATOR] = 6;
	aivar[AIV_FIGHTSPEACHFLAG] = 22;
};

func void Set_Scavenger_Visuals()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Sca_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Scavenger(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance YScavenger(Mst_Default_Scavenger)
{
	name[0] = "Malý Mrchožrout";
	level = 3;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	fight_tactic = FAI_MONSTER_COWARD;
	Set_Scavenger_Visuals();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance MSCAVENGER(Mst_Default_Scavenger)
{
	name[0] = "Horský Mrchožrout";
	level = 8;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_MONSTER_COWARD;
	Set_Scavenger_Visuals();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	Mdl_SetVisualBody(self,"Sca_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

