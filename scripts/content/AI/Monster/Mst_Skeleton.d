prototype Mst_Default_Skeleton(C_Npc)
{
	name[0] = "Kostlivec";
	guild = GIL_SKELETON;
	level = 12;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SKELETON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 2000;
	aivar[AIV_BEENATTACKED] = 1500;
	aivar[AIV_HIGHWAYMEN] = 1500;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
};

func void Set_Skeleton_Visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_SkeletonWarrior_Visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body3",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_SkeletonScout_Visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_SkeletonMage_Visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Ske_Fly_Body",1,DEFAULT,"",1,DEFAULT,-1);
};

instance Skeleton(Mst_Default_Skeleton)
{
	aivar[AIV_IMPORTANT] = id_skeleton;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SkeletonSH(Mst_Default_Skeleton)
{
	aivar[AIV_IMPORTANT] = ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	protection[PROT_FIRE] = 40;
	senses_range = 1000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1000;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 1000;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
};

instance SkeletonScout(Mst_Default_Skeleton)
{
	name[0] = "Kostlivý zvěd";
	aivar[AIV_IMPORTANT] = id_skeletonscout;
	Set_SkeletonScout_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Scythe_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SkeletonWarrior(Mst_Default_Skeleton)
{
	name[0] = "Kostlivý válečník";
	Set_SkeletonWarrior_Visuals();
	level = 22;
	attribute[ATR_STRENGTH] = 120;
	aivar[AIV_IMPORTANT] = id_skeletonwarrior;
	Npc_SetToFightMode(self,ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SkeletonMage(Mst_Default_Skeleton)
{
	aivar[AIV_IMPORTANT] = id_skeletonmage;
	Set_SkeletonMage_Visuals();
	name[0] = "Kostlivý Mág";
	guild = GIL_DEMON;
	level = 24;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	fight_tactic = FAI_HUMAN_MAGE;
	CreateInvItem(self,ItArRuneThunderbolt);
	CreateInvItems(self,ItArScrollSummonSkeletons,5);
};

instance SkeletonMage_fogtower(Mst_Default_Skeleton)
{
	aivar[AIV_IMPORTANT] = ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name[0] = "Kostlivý Mág z Mlžné věže";
	guild = GIL_DEMON;
	level = 30;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 70;
	fight_tactic = FAI_HUMAN_MAGE;
	CreateInvItem(self,ItArRuneThunderbolt);
	CreateInvItems(self,ItArScrollSummonSkeletons,5);
	CreateInvItem(self,theriddle1);
};

instance SKELETONMAGE_DEMONTOWER(Mst_Default_Skeleton)
{
	aivar[AIV_IMPORTANT] = ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name[0] = "Kostlivý Mág z věže démonů";
	guild = GIL_DEMON;
	level = 35;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 70;
	fight_tactic = FAI_HUMAN_MAGE;
	CreateInvItem(self,ItArRuneThunderbolt);
	CreateInvItems(self,ItArScrollSummonSkeletons,5);
	CreateInvItem(self,itke_demons);
};

instance SummonedByPC_Skeleton(Mst_Default_Skeleton)
{
	aivar[AIV_IMPORTANT] = ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Sword_Old_01);
	level = 0;
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[AIV_HASDEFEATEDSC] = 300;
	aivar[AIV_ISLOOKING] = 5;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance SummonedByNPC_Skeleton(Mst_Default_Skeleton)
{
	aivar[AIV_IMPORTANT] = ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = ZS_MM_Summoned;
};

instance SummonedByPC_SkeletonWarrior(Mst_Default_Skeleton)
{
	name[0] = "Můj Vyvolaný Kostlivý válečník";
	level = 0;
	attribute[ATR_STRENGTH] = 120;
	senses = SENSE_HEAR | SENSE_SEE;
	aivar[AIV_IMPORTANT] = ID_SKELETONWARRIOR;
	Set_SkeletonWarrior_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[AIV_HASDEFEATEDSC] = 300;
	aivar[AIV_ISLOOKING] = 5;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance SummonedByNPC_SkeletonWarrior(Mst_Default_Skeleton)
{
	name[0] = "Vyvolaný Kostlivý válečník";
	level = 0;
	attribute[ATR_STRENGTH] = 120;
	aivar[AIV_IMPORTANT] = ID_SKELETONWARRIOR;
	Set_SkeletonWarrior_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = ZS_MM_Summoned;
};

