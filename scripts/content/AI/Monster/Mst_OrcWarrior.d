prototype Mst_Default_OrcWarrior(C_Npc)
{
	name[0] = "Skřetí válečník";
	guild = GIL_ORCWARRIOR;
	npcType = npctype_guard;
	voice = 17;
	level = 25;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 70;
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
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_Guard;
};

func void Set_OrcWarrior_Visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};

instance OrcWarrior1(Mst_Default_OrcWarrior)
{
	name[0] = "Skřetí bojovník";
	level = 25;
	Set_OrcWarrior_Visuals();
	EquipItem(self,ItMw2hOrcAxe01);
	var int inventar_9;
	inventar_9 = Hlp_Random(100);
	if(inventar_9 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_9 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_9 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_9 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_9 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,14);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_9 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_9 <= 70)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
	}
	else if(inventar_9 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_9 <= 90)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_9 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};

instance OrcWarrior2(Mst_Default_OrcWarrior)
{
	name[0] = "Skřetí válečník";
	level = 25;
	Set_OrcWarrior_Visuals();
	EquipItem(self,ItMw2hOrcAxe02);

	var int inventar_10;
	inventar_10 = Hlp_Random(100);
	if(inventar_10 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_10 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_10 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_10 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_10 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,14);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_10 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_10 <= 70)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
	}
	else if(inventar_10 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_10 <= 90)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_10 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};

instance OrcWarrior3(Mst_Default_OrcWarrior)
{
	name[0] = "Skřetí klanový válečník";
	level = 35;
	Set_OrcWarrior_Visuals();
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_HITPOINTS_MAX] = 330;
	attribute[ATR_HITPOINTS] = 330;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 50;
	EquipItem(self,ItMw2hOrcAxe03);

	var int inventar_11;
	inventar_11 = Hlp_Random(100);
	if(inventar_11 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_11 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_11 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_11 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_11 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,14);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_11 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_11 <= 70)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
	}
	else if(inventar_11 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_11 <= 90)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_11 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};

instance OrcWarrior4(Mst_Default_OrcWarrior)
{
	name[0] = "Skřetí chrámový válečník";
	level = 35;
	Set_OrcWarrior_Visuals();
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_HITPOINTS_MAX] = 330;
	attribute[ATR_HITPOINTS] = 330;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 50;
	EquipItem(self,ItMw2hOrcAxe04);
	
	var int inventar_12;
	inventar_12 = Hlp_Random(100);
	if(inventar_12 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_12 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_12 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_12 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_12 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,14);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_12 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_12 <= 70)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
	}
	else if(inventar_12 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_12 <= 90)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_12 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};
