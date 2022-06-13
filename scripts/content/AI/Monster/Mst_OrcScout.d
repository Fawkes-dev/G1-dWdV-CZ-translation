prototype Mst_Default_OrcScout(C_Npc)
{
	name[0] = "Skřetí lovec";
	guild = GIL_ORCSCOUT;
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
	fight_tactic = FAI_HUMAN_Strong;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2500;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	
	var int inventar_5;
	inventar_5 = Hlp_Random(100);
	if(inventar_5 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_5 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_5 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_5 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_5 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,14);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_5 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_5 <= 70)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
	}
	else if(inventar_5 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_5 <= 90)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_5 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
	start_aistate = ZS_GuardPatrol;
};

func void Set_OrcScout_Visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyScout",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};

instance OrcScout(Mst_Default_OrcScout)
{
	Set_OrcScout_Visuals();
	EquipItem(self,ItMw2hOrcSword01);
};

instance OrcPeasantEatAndDrink(Mst_Default_OrcScout)
{
	guild = GIL_ORCSCOUT;
	name[0] = "Skřet";
	Set_OrcScout_Visuals();
	EquipItem(self,ItMw2hOrcSword01);
	var int inventar_6;
	inventar_6 = Hlp_Random(100);
	if(inventar_6 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_6 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_6 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_6 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_6 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,14);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_6 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_6 <= 70)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
	}
	else if(inventar_6 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_6 <= 90)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_6 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
	start_aistate = ZS_Orc_EatAndDrink;
};

instance OrcScoutGYD(Mst_Default_OrcScout)
{
	name[0] = "Skřetí zvěd";
	level = 20;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[AIV_HIGHWAYMEN] = 1000;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 10;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_Trigger3] = OnlyRoutine;
	Set_OrcScout_Visuals();
	EquipItem(self,ItMw2hOrcSword01);
	var int inventar_7;
	inventar_7 = Hlp_Random(100);
	if(inventar_7 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_7 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_7 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_7 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_7 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,14);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_7 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_7 <= 70)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
	}
	else if(inventar_7 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_7 <= 90)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if(inventar_7 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};

