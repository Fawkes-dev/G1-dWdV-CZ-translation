prototype Mst_Default_BlackGobbo(C_Npc)
{
	name[0] = "Černý Goblin";
	guild = GIL_GOBBO;
	aivar[AIV_IMPORTANT] = ID_BLACKGOBBO;
	level = 10;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 105;
	attribute[ATR_HITPOINTS] = 105;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 4;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
	
	var int Inventar_3;
	Inventar_3 = Hlp_Random(100);
	if(Inventar_3 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(Inventar_3 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(Inventar_3 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(Inventar_3 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(Inventar_3 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,7);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(Inventar_3 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFoMutton,2);
	}
	else if(Inventar_3 <= 70)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(Inventar_3 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(Inventar_3 <= 90)
	{
		CreateInvItems(self,ItAt_Meatbug_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,1);
	}
	else if(Inventar_3 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};

func void Set_BlackGobbo_Visuals()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance BlackGobboMace(Mst_Default_BlackGobbo)
{
	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Nailmace_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 35;
};

instance BlackGobboWarrior(Mst_Default_BlackGobbo)
{
	name[0] = "Gobliní válečník";
	level = 12;
	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Mace_01);
	attribute[ATR_STRENGTH] = 60 + 30;
	attribute[ATR_HITPOINTS_MAX] = 115;
	attribute[ATR_HITPOINTS] = 115;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	
	var int inventar_4;
	inventar_4 = Hlp_Random(100);
	if(inventar_4 <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if(inventar_4 <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if(inventar_4 <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_4 <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if(inventar_4 <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,7);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if(inventar_4 <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFoMutton,2);
	}
	else if(inventar_4 <= 70)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_4 <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if(inventar_4 <= 90)
	{
		CreateInvItems(self,ItAt_Meatbug_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,1);
	}
	else if(inventar_4 <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
};
