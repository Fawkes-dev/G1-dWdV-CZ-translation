prototype Mst_Default_Demon(C_Npc)
{
	name[0] = "Ohnivý Démon";
	guild = GIL_DEMON;
	aivar[AIV_IMPORTANT] = ID_DEMON;
	level = 60;
	attribute[ATR_STRENGTH] = 210;
	attribute[ATR_DEXTERITY] = 210;
	attribute[ATR_HITPOINTS_MAX] = 430;
	attribute[ATR_HITPOINTS] = 430;
	attribute[ATR_MANA_MAX] = 110;
	attribute[ATR_MANA] = 110;
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 115;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_FIRE;
	fight_tactic = FAI_Demon;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 2800;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[AIV_HIGHWAYMEN] = 2000;
	aivar[AIV_HAS_ERPRESSED] = 3;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
};

func void Set_Demon_Visuals()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Demon(Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
};

instance SummonedByPC_Demon(Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[AIV_HASDEFEATEDSC] = 400;
	aivar[AIV_ISLOOKING] = 1;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance SummonedByNPC_Demon(Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Summoned;
};

instance XardasDemon(Mst_Default_Demon)
{
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_friend;
	guild = GIL_DEMON;
	aivar[AIV_IMPORTANT] = ID_DEMON;
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
	start_aistate = ZS_XardasDemon;
};

instance OTDemon(Mst_Default_Demon)
{
	name[0] = "Nižší Démon";
	guild = GIL_DEMON;
	level = 60;
	damagetype = DAM_EDGE;
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
};

