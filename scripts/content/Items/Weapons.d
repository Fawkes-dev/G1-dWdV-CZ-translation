instance Thorus_Schwert(C_Item)
{
	name = "Thorusův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 500;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	owner = GRD_200_Thorus;
	visual = "ItMw_2H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Innos_Zorn(C_Item)
{
	name = "Innosův hněv";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 570;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	owner = EBR_100_Gomez;
	visual = "ItMw_2H_Sword_Heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Scars_Schwert(C_Item)
{
	name = "Scarův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 460;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	owner = EBR_101_Scar;
	visual = "ItMw_1H_Sword_Bastard_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
	count[5] = value;
};

instance Artos_Schwert(C_Item)
{
	name = "Artův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 360;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	owner = EBR_102_Arto;
	visual = "ItMw_1H_Sword_Long_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Rabenrecht(C_Item)
{
	name = "Ravenovo právo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 400;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	owner = EBR_105_Raven;
	visual = "ItMw_1H_Sword_Broad_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Prankenhieb(C_Item)
{
	name = "Úder tlapy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 300;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	owner = EBR_106_Bartholo;
	visual = "ItMw_1H_Sword_Long_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Diegos_Bogen(C_Item)
{
	name = "Diegův luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 390;
	damageTotal = 80;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 60;
	owner = PC_Thief;
	visual = "ItRwLongbow.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Whistlers_Schwert(C_Item)
{
	name = "Whistlerův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 110;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItMw_1H_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Stab_des_Lichts(C_Item)
{
	name = "Hůl světla";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 350;
	damageTotal = 65;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	owner = GUR_1200_YBerion;
	visual = "ItMw_2H_Staff_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Kaloms_Schwert(C_Item)
{
	name = "Kalomův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 400;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	owner = GUR_1201_CorKalom;
	visual = "ItMw_1H_Sword_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Streitschlichter(C_Item)
{
	name = "Lesterův uklidňovač";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 340;
	damageTotal = 75;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	owner = PC_Psionic;
	visual = "ItMw_1H_Mace_War_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Roter_Wind(C_Item)
{
	name = "Rudý vítr";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2400;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	owner = GUR_1202_CorAngar;
	visual = "ItMw_2H_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ROTER_WIND_SMITH(C_Item)
{
	name = "Rudý vítr";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2450;
	damageTotal = 105;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMw_2H_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Namibs_Keule(C_Item)
{
	name = "Namibův kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 300;
	damageTotal = 60;
	damagetype = DAM_BLUNT;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	owner = GUR_1204_BaalNamib;
	visual = "ItMw_1H_Mace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Oruns_Keule(C_Item)
{
	name = "Orunův kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 330;
	damageTotal = 80;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	owner = GUR_1209_BaalOrun;
	visual = "ItMw_1H_Mace_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance LUKORS_KEULE(C_Item)
{
	name = "Lukorův kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 600;
	damageTotal = 35;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	owner = gur_5021_baallukor;
	visual = "ItMw_1H_Mace_War_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Fortunos_Keule(C_Item)
{
	name = "Fortunův kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 110;
	damageTotal = 20;
	damagetype = DAM_BLUNT;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	owner = NOV_1357_Fortuno;
	visual = "ItMw_1H_Mace_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Lees_Axt(C_Item)
{
	name = "Leeova sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 560;
	damageTotal = 105;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	owner = Sld_700_Lee;
	visual = "ItMw_2H_Axe_Heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Oriks_Axt(C_Item)
{
	name = "Orikova sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 540;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	owner = SLD_701_Orik;
	visual = "ItMw_2H_Axe_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Torlofs_Axt(C_Item)
{
	name = "Torlofova sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 550;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	owner = SLD_737_Torlof;
	visual = "ItMw_2H_Axe_Heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Cords_Spalter(C_Item)
{
	name = "Cordův rozkol";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 310;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	owner = Sld_709_Cord;
	visual = "ItMw_1H_Axe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Gorns_Rache(C_Item)
{
	name = "Gornova pomsta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 2400;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	owner = PC_Fighter;
	visual = "ItMw_2H_Axe_Heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Lares_Axt(C_Item)
{
	name = "Laresova sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 340;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	owner = Org_801_Lares;
	visual = "ItMw_1H_Axe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Wolfs_Bogen(C_Item)
{
	name = "Wolfův luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 200;
	damageTotal = 50;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 45;
	owner = ORG_855_Wolf;
	visual = "ItRwLongbow.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Silas_Axt(C_Item)
{
	name = "Silasova sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 290;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	owner = ORG_841_Silas;
	visual = "ItMw_1H_Axe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Heerscherstab(C_Item)
{
	name = "Žezlo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	owner = Bau_900_Ricelord;
	visual = "ItMw_2H_Staff_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance BETTY(C_Item)
{
	name = "Betty";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 75;
	visual = "ItMw_1H_Sword_Bastard_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ESTEBANS_BOGEN(C_Item)
{
	name = "Estebanův luk";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = 360;
	damageTotal = 60;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 40;
	visual = "ItRw_Bow_Long_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TOTH_SWORD(C_Item)
{
	name = "Gor Na Tothův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 550;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_Light_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance LONER_BOGEN(C_Item)
{
	name = "Luk toulavého lovce"; //Bogen des umherziehenden Jägers
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 600;
	damageTotal = 45;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 35;
	visual = "ItRw_Bow_Small_05.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

