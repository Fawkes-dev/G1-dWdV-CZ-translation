prototype Mst_Default_GreenGobbo(C_Npc)
{
	name[0] = "Goblin";
	guild = GIL_GOBBO;
	aivar[AIV_IMPORTANT] = ID_GOBBO;
	level = 5;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 4;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_GreenGobbo_Visuals()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance GreenGobboClub(Mst_Default_GreenGobbo)
{
	Set_GreenGobbo_Visuals();
	fight_tactic = FAI_MONSTER_COWARD;
	Npc_SetToFightMode(self,ItMw_1H_Club_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 5;
	name[0] = "Malý Goblin";
	level = 3;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	var int inventar;

	inventar = Hlp_Random(100);
	if(inventar <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,7);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFoMutton,2);
	}
	else if(inventar <= 70)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar <= 90)
	{
		CreateInvItems(self,ItAt_Meatbug_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,1);
	}
	else if(inventar <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};

instance GreenGobboSword(Mst_Default_GreenGobbo)
{
	Set_GreenGobbo_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 0;
	var int inventar_2;
	inventar_2 = Hlp_Random(100);
	if(inventar_2 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_2 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_2 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_2 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_2 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,7);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_2 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFoMutton,2);
	}
	else if(inventar_2 <= 70)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_2 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_2 <= 90)
	{
		CreateInvItems(self,ItAt_Meatbug_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,1);
	}
	else if(inventar_2 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};
