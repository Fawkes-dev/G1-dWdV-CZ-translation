instance OverlayHuman(C_Npc)
{
	name[0] = "OverlayHuman";
	guild = GIL_BAU;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Acrobatic.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_ApplyOverlayMds(self,"Humans_drunken.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Swim.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Sprint.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Torch.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Flee.mds");
};

instance OverlayOrc(C_Npc)
{
	name[0] = "Orc Rockefeller";
	guild = GIL_ORCWARRIOR;
	level = 4;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 0;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Drunken.mds");
	Mdl_ApplyOverlayMds(self,"Orc_Torch.mds");
};

instance Babe_Rockefeller(Npc_Default)
{
	name[0] = "babe rockefeller";
	guild = GIL_BAB;
	level = 1;
	flags = 0;
	voice = 19;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,1,"Bab_Head_Hair1",0,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,bab_armor_nude);
	CreateInvItem(self,bab_armor_bikini);
	CreateInvItem(self,ItMiBrush);
	CreateInvItem(self,ItMiWedel);
	CreateInvItems(self,ItFo_mutton_01,20);
	CreateInvItems(self,ItFoApple,5);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,20);
	CreateInvItems(self,ItFoCheese,5);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoSoup,5);
	CreateInvItems(self,ItFoMeatbugragout,5);
	CreateInvItems(self,ItFoCrawlersoup,5);
	CreateInvItems(self,ItFoBooze,10);
	CreateInvItems(self,ItFoWine,5);
	CreateInvItems(self,ItFo_wineberrys_01,5);
	CreateInvItems(self,ItFoBeer,5);
	CreateInvItem(self,ItMiLute);
};

instance L5(Npc_Default)
{
	name[0] = "l5";
	npcType = npctype_main;
	guild = GIL_None;
	level = 5;
	voice = 15;
	id = 0;
	exp = 7500;
	exp_next = 10500;
	lp = 90;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,sfb_armor_l);
	start_aistate = ZS_Firespit;
	CreateInvItem(self,vlk_armor_l);
	CreateInvItem(self,vlk_armor_m);
	CreateInvItem(self,sfb_armor_l);
	CreateInvItem(self,nov_armor_l);
	EquipItem(self,ItMw_1H_Sword_Short_05);
	EquipItem(self,ItRw_Bow_Small_01);
	CreateInvItem(self,ItMw_1H_Club_01);
	CreateInvItem(self,ItMw_1H_Poker_01);
	CreateInvItem(self,ItMw_1H_Sickle_01);
	CreateInvItem(self,ItMw_1H_Mace_Light_01);
	CreateInvItem(self,ItMw_1H_Hatchet_01);
	CreateInvItem(self,ItMw_1H_Sword_Old_01);
	CreateInvItem(self,ItMw_1H_Nailmace_01);
	CreateInvItem(self,ItMw_1H_Sword_Short_01);
	CreateInvItem(self,ItMw_1H_Sword_Short_02);
	CreateInvItem(self,ItMw_1H_Sword_Short_03);
	CreateInvItem(self,ItMw_1H_Sword_Short_04);
	CreateInvItem(self,ItMw_1H_Axe_Old_01);
	CreateInvItem(self,ItMw_1H_Scythe_01);
	CreateInvItem(self,ItMw_2H_Staff_01);
	CreateInvItem(self,ItMw_2H_Staff_02);
	CreateInvItem(self,ItMw_2H_Staff_03);
	CreateInvItem(self,ItMw_1H_Mace_01);
	CreateInvItem(self,ItMw_1H_Mace_02);
	CreateInvItem(self,ItRw_Bow_Small_02);
	CreateInvItem(self,ItRw_Bow_Small_03);
	CreateInvItem(self,ItRw_Bow_Small_04);
	CreateInvItems(self,ItAmArrow,50);
	CreateInvItems(self,ItMiNugget,200);
	CreateInvItems(self,ItKeLockpick,10);
	CreateInvItems(self,ItLsTorch,20);
};

instance L10(Npc_Default)
{
	name[0] = "L10 ";
	npcType = npctype_main;
	guild = GIL_None;
	level = 10;
	voice = 15;
	id = 0;
	exp = 27500;
	exp_next = 33000;
	lp = 165;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,stt_armor_m);
	CreateInvItem(self,stt_armor_h);
	CreateInvItem(self,org_armor_l);
	CreateInvItem(self,org_armor_m);
	CreateInvItem(self,nov_armor_m);
	CreateInvItem(self,nov_armor_h);
	CreateInvItem(self,ItMw_1H_Mace_03);
	CreateInvItem(self,ItMw_1H_Mace_04);
	CreateInvItem(self,ItMw_1H_Sword_01);
	CreateInvItem(self,ItMw_1H_Sword_02);
	CreateInvItem(self,ItMw_1H_Sword_03);
	CreateInvItem(self,ItMw_1H_Sword_04);
	CreateInvItem(self,ItMw_1H_Sword_05);
	CreateInvItem(self,ItMw_1H_Mace_War_01);
	CreateInvItem(self,ItMw_1H_Mace_War_02);
	CreateInvItem(self,ItMw_1H_Mace_War_03);
	CreateInvItem(self,ItMw_1H_Mace_War_04);
	CreateInvItem(self,ItMw_1H_Sword_Long_01);
	CreateInvItem(self,ItRw_Bow_Small_05);
	CreateInvItem(self,ItRw_Bow_Long_01);
	CreateInvItem(self,ItRw_Bow_Long_02);
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItMiNugget,400);
	CreateInvItems(self,ItKeLockpick,20);
	CreateInvItems(self,ItLsTorch,20);
};

instance L15(Npc_Default)
{
	name[0] = "L15 ";
	npcType = npctype_main;
	guild = GIL_None;
	level = 15;
	voice = 15;
	id = 0;
	exp = 60000;
	exp_next = 68000;
	lp = 240;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,grd_armor_l);
	CreateInvItem(self,grd_armor_m);
	CreateInvItem(self,org_armor_h);
	CreateInvItem(self,tpl_armor_l);
	CreateInvItem(self,tpl_armor_m);
	CreateInvItem(self,kdf_armor_l);
	CreateInvItem(self,kdf_armor_h);
	CreateInvItem(self,ItMw_1H_Sword_Long_02);
	CreateInvItem(self,ItMw_1H_Sword_Long_03);
	CreateInvItem(self,ItMw_1H_Sword_Long_04);
	CreateInvItem(self,ItMw_1H_Sword_Long_05);
	CreateInvItem(self,ItMw_1H_Warhammer_01);
	CreateInvItem(self,ItMw_1H_Warhammer_02);
	CreateInvItem(self,ItMw_1H_Warhammer_03);
	CreateInvItem(self,ItMw_1H_Axe_02);
	CreateInvItem(self,ItMw_1H_Axe_03);
	CreateInvItem(self,ItMw_1H_Sword_Broad_01);
	CreateInvItem(self,ItRw_Bow_Long_03);
	CreateInvItem(self,ItRw_Bow_Long_04);
	CreateInvItem(self,ItRw_Bow_Long_05);
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItMiNugget,400);
	CreateInvItems(self,ItKeLockpick,20);
	CreateInvItems(self,ItLsTorch,20);
};

instance L20(Npc_Default)
{
	name[0] = "L20 ";
	npcType = npctype_main;
	guild = GIL_None;
	level = 20;
	voice = 15;
	id = 0;
	exp = 105000;
	exp_next = 115500;
	lp = 315;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,grd_armor_h);
	CreateInvItem(self,sld_armor_m);
	CreateInvItem(self,sld_armor_h);
	CreateInvItem(self,tpl_armor_h);
	CreateInvItem(self,kdw_armor_l);
	CreateInvItem(self,ItMw_1H_Sword_Broad_02);
	CreateInvItem(self,ItMw_1H_Sword_Broad_03);
	CreateInvItem(self,ItMw_1H_Sword_Broad_04);
	CreateInvItem(self,ItMw_2H_Sword_Old_01);
	CreateInvItem(self,ItMw_1H_Sword_Bastard_01);
	CreateInvItem(self,ItMw_1H_Sword_Bastard_02);
	CreateInvItem(self,ItMw_1H_Sword_Bastard_03);
	CreateInvItem(self,ItMw_1H_Sword_Bastard_04);
	CreateInvItem(self,ItMw_2H_Axe_Old_01);
	CreateInvItem(self,ItMw_2H_Axe_Old_02);
	CreateInvItem(self,ItMw_2H_Axe_Old_03);
	CreateInvItem(self,ItMw_2H_Sword_Light_01);
	CreateInvItem(self,ItRw_Bow_Long_06);
	CreateInvItem(self,ItRw_Bow_Long_07);
	CreateInvItem(self,ItRw_Bow_Long_08);
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItMiNugget,400);
	CreateInvItems(self,ItKeLockpick,20);
	CreateInvItems(self,ItLsTorch,20);
};

instance L25(Npc_Default)
{
	name[0] = "L25 ";
	npcType = npctype_main;
	guild = GIL_None;
	level = 25;
	voice = 15;
	id = 0;
	exp = 162500;
	exp_next = 175500;
	lp = 390;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,crw_armor_h);
	CreateInvItem(self,kdw_armor_h);
	CreateInvItem(self,dmb_armor_m);
	CreateInvItem(self,ore_armor_m);
	CreateInvItem(self,ItMw_2H_Sword_Light_02);
	CreateInvItem(self,ItMw_2H_Sword_Light_03);
	CreateInvItem(self,ItMw_2H_Sword_Light_04);
	CreateInvItem(self,ItMw_2H_Sword_Light_05);
	CreateInvItem(self,ItMw_2H_Axe_light_01);
	CreateInvItem(self,ItMw_2H_Axe_light_02);
	CreateInvItem(self,ItMw_2H_Axe_light_03);
	CreateInvItem(self,ItMw_2H_Sword_01);
	CreateInvItem(self,ItMw_2H_Sword_02);
	CreateInvItem(self,ItMw_2H_Sword_03);
	CreateInvItem(self,ItRw_Bow_Long_09);
	CreateInvItem(self,ItRw_Bow_War_01);
	CreateInvItem(self,ItRw_Bow_War_02);
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItMiNugget,400);
	CreateInvItems(self,ItKeLockpick,20);
	CreateInvItems(self,ItLsTorch,20);
};

instance Testratte(Mst_Default_Molerat)
{
	name[0] = "junge Molerat";
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	fight_tactic = FAI_MONSTER_MASTER;
	Set_Molerat_Visuals();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};

