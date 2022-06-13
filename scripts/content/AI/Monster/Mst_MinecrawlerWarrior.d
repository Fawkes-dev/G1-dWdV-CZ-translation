prototype Mst_Default_MinecrawlerWarrior(C_Npc)
{
	name[0] = "Válečník Důlních červů";
	guild = GIL_MINECRAWLER;
	aivar[AIV_IMPORTANT] = ID_MINECRAWLERWARRIOR;
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 230;
	attribute[ATR_HITPOINTS] = 230;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 2;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_ITEMSTATUS] = OnlyRoutine;
};

func void Set_MinecrawlerWarrior_Visuals()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Cr2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance MinecrawlerWarrior(Mst_Default_MinecrawlerWarrior)
{
	Set_MinecrawlerWarrior_Visuals();
	Npc_SetToFistMode(self);
};

instance OTMinecrawler(Mst_Default_MinecrawlerWarrior)
{
	name[0] = "Chrámový Důlní červ";
	level = 30;
	Set_MinecrawlerWarrior_Visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_HITPOINTS_MAX] = 260;
	attribute[ATR_HITPOINTS] = 260;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
};

