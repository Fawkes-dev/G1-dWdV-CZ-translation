const int Value_1H_Sword_01 = 100;

instance ItMw_1H_Club_01(C_Item)
{
	name = "Kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 2;
	damageTotal = 5;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Club_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Poker_01(C_Item)
{
	name = "Pohrabáč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 3;
	damageTotal = 6;
	damagetype = DAM_BLUNT;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Poker_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sickle_01(C_Item)
{
	name = "Srp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 4;
	damageTotal = 7;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sickle_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMwPickaxe(C_Item)
{
	name = "Krumpáč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 4;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_2H_Pickaxe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sledgehammer_01(C_Item)
{
	name = "Kovářské kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 5;
	damageTotal = 10;
	damagetype = DAM_BLUNT;
	range = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sledgehammer_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_Light_01(C_Item)
{
	name = "Kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 5;
	damageTotal = 8;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Mace_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Hatchet_01(C_Item)
{
	name = "Sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 6;
	damageTotal = 9;
	damagetype = DAM_EDGE;
	range = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Hatchet_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Old_01(C_Item)
{
	name = "Rezavý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 10;
	damageTotal = 5;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sword_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Nailmace_01(C_Item)
{
	name = "Ostnatý kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 13;
	damageTotal = 11;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Nailmace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_01(C_Item)
{
	name = "Krátký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 15;
	damageTotal = 12;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 12;
	visual = "ItMw_1H_Sword_Short_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_02(C_Item)
{
	name = "Farmářova obrana ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 22;
	damageTotal = 14;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 14;
	visual = "ItMw_1H_Sword_Short_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_03(C_Item)
{
	name = "Číhavčí kousnutí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 16;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 16;
	visual = "ItMw_1H_Sword_Short_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_04(C_Item)
{
	name = "Zraňující trny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 35;
	damageTotal = 18;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 18;
	visual = "ItMw_1H_Sword_Short_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_05(C_Item)
{
	name = "Kopáčova poslušnost";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_Short_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_Old_01(C_Item)
{
	name = "Rozpadlá sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 25;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ItMw_1H_Axe_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Scythe_01(C_Item)
{
	name = "Kudla";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 25;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItMw_1H_Scythe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Staff_01(C_Item)
{
	name = "Bojová hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 60;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_2H_Staff_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Staff_02(C_Item)
{
	name = "Hůl rozsouzení";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 100;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
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

instance ItMw_2H_Staff_03(C_Item)
{
	name = "Kněžská hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 200;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
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

instance ItMw_1H_LightGuardsSword_03(C_Item)
{
	name = "Lehký meč stráže";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 60;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_LIGHTGUARDSSWORD_03_SMITH(C_Item)
{
	name = "Lehký meč stráže";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 70;
	damageTotal = 30;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_01(C_Item)
{
	name = "Palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 55;
	damageTotal = 25;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
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

instance ITMW_1H_MACE_01_SMITH(C_Item)
{
	name = "Palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 65;
	damageTotal = 30;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
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

instance ItMw_1H_Mace_02(C_Item)
{
	name = "Ostnatý palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 65;
	damageTotal = 27;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 22;
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

instance ItMw_1H_Mace_03(C_Item)
{
	name = "Žihadlo krvavé mouchy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 75;
	damageTotal = 30;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
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

instance ItMw_1H_Mace_04(C_Item)
{
	name = "Ocelový hrot";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 85;
	damageTotal = 33;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 27;
	visual = "ItMw_1H_Mace_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_MACE_04_SMITH(C_Item)
{
	name = "Ocelový hrot";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 95;
	damageTotal = 38;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 32;
	visual = "ItMw_1H_Mace_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_01(C_Item)
{
	name = "Primitivní meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = Value_1H_Sword_01;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_01_SMITH(C_Item)
{
	name = "Primitivní meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 110;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_02(C_Item)
{
	name = "Meč rozsudku";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 95;
	damageTotal = 33;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 33;
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

instance ItMw_1H_Sword_03(C_Item)
{
	name = "Meč stráže";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 100;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_03_SMITH(C_Item)
{
	name = "Meč stráže";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 120;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_04(C_Item)
{
	name = "Bojový meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 130;
	damageTotal = 36;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 36;
	visual = "ItMw_1H_Sword_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_05(C_Item)
{
	name = "Válečný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 150;
	damageTotal = 37;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 37;
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

instance ITMW_1H_SWORD_05_SMITH(C_Item)
{
	name = "Válečný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 160;
	damageTotal = 42;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 42;
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

instance ItMw_1H_Mace_War_01(C_Item)
{
	name = "Morning Star";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 125;
	damageTotal = 35;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_1H_Mace_War_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_MACE_WAR_01_SMITH(C_Item)
{
	name = "Morning Star";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 125;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Mace_War_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_02(C_Item)
{
	name = "Ocelový palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 130;
	damageTotal = 36;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 31;
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

instance ITMW_1H_MACE_WAR_02_SMITH(C_Item)
{
	name = "Ocelový palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 140;
	damageTotal = 41;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 36;
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

instance ItMw_1H_Mace_War_03(C_Item)
{
	name = "Drtič kamene";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 37;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 32;
	visual = "ItMw_1H_Mace_War_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_MACE_WAR_03_SMITH(C_Item)
{
	name = "Drtič kamene";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 160;
	damageTotal = 42;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 37;
	visual = "ItMw_1H_Mace_War_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_04(C_Item)
{
	name = "Lamač srdcí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 600;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
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

instance ItMw_1H_Sword_Long_01(C_Item)
{
	name = "Dlouhý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 640;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Sword_Long_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_02(C_Item)
{
	name = "Meč strachu ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 680;
	damageTotal = 42;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 42;
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

instance ItMw_1H_Sword_Long_03(C_Item)
{
	name = "Meč nenávisti";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 800;
	damageTotal = 44;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 44;
	visual = "ItMw_1H_Sword_Long_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_04(C_Item)
{
	name = "Meč vítězství";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 860;
	damageTotal = 46;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 46;
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

instance ItMw_1H_Sword_Long_05(C_Item)
{
	name = "Meč smrti";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 920;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_1H_Sword_Long_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_01(C_Item)
{
	name = "Skřetí kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_02(C_Item)
{
	name = "Válečné kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_03(C_Item)
{
	name = "Boží kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_01(C_Item)
{
	name = "Sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_AXE_01_SMITH(C_Item)
{
	name = "Sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 160;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_02(C_Item)
{
	name = "Lebkolam";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 1200;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
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

instance ItMw_1H_Axe_03(C_Item)
{
	name = "Kostilam";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
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

instance ItMw_1H_Sword_Broad_01(C_Item)
{
	name = "Široký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_1H_Sword_Broad_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_02(C_Item)
{
	name = "Válečníkův rozsudek";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_1H_Sword_Broad_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_03(C_Item)
{
	name = "Šepot bouře";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_1H_Sword_Broad_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_04(C_Item)
{
	name = "Strážcova ruka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1600;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
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

instance ITMW_1H_SWORD_BROAD_04_SMITH(C_Item)
{
	name = "Strážcova ruka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1650;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
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

instance ItMw_2H_Sword_Old_01(C_Item)
{
	name = "Rezavý obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	visual = "ItMw_2H_Sword_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_01(C_Item)
{
	name = "Rezavý meč bastard";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1250;
	damageTotal = 48;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 48;
	visual = "ItMw_1H_Sword_Bastard_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_02(C_Item)
{
	name = "Řezník";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_1H_Sword_Bastard_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_03(C_Item)
{
	name = "Popravčí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_1H_Sword_Bastard_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_04(C_Item)
{
	name = "Slovo násilníka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_1H_Sword_Bastard_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_01(C_Item)
{
	name = "Stará bojová sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	visual = "ItMw_2H_Axe_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_02(C_Item)
{
	name = "Sběrač krve";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_2H_Axe_Old_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_03(C_Item)
{
	name = "Starý soudce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_Old_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_01(C_Item)
{
	name = "Lehký obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_2H_Sword_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_01_SMITH(C_Item)
{
	name = "Lehký obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1600;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_02(C_Item)
{
	name = "Šavle správce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_02_SMITH(C_Item)
{
	name = "Šavle správce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1750;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_03(C_Item)
{
	name = "Šavle žoldáka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_03_SMITH(C_Item)
{
	name = "Šavle žoldáka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1850;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_04(C_Item)
{
	name = "Šavle krále";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
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

instance ITMW_2H_SWORD_LIGHT_04_SMITH(C_Item)
{
	name = "Šavle krále";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1850;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
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

instance ItMw_2H_Sword_Light_05(C_Item)
{
	name = "Šavle ďábla";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_2H_Sword_Light_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_01(C_Item)
{
	name = "Lehká bojová sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_AXE_LIGHT_01_SMITH(C_Item)
{
	name = "Lehká bojová sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Axe_light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_02(C_Item)
{
	name = "Úder blesku";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_03(C_Item)
{
	name = "Třesk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2520;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Axe_light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_01(C_Item)
{
	name = "Obouruční zbraň";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
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

instance ITMW_2H_SWORD_01_SMITH(C_Item)
{
	name = "Obouruční zbraň";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2050;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
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

instance ItMw_2H_Sword_02(C_Item)
{
	name = "Hrdinova šavle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
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

instance ItMw_2H_Sword_03(C_Item)
{
	name = "Krvavá šavle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_01(C_Item)
{
	name = "Těžká obouruční zbraň";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_Heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_02(C_Item)
{
	name = "Meč běsnění";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_HEAVY_02_SMITH(C_Item)
{
	name = "Meč běsnění";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2250;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Sword_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_03(C_Item)
{
	name = "Meč hněvu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
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

instance ItMw_2H_Sword_Heavy_04(C_Item)
{
	name = "Meč pomsty";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Sword_Heavy_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_01(C_Item)
{
	name = "Válečná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
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

instance ITMW_2H_AXE_HEAVY_01_SMITH(C_Item)
{
	name = "Válečná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
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

instance ItMw_2H_Axe_Heavy_02(C_Item)
{
	name = "Hlas válečníka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
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

instance ITMW_2H_AXE_HEAVY_02_SMITH(C_Item)
{
	name = "Hlas válečníka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
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

instance ItMw_2H_Axe_Heavy_03(C_Item)
{
	name = "Pěst barbara";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
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

instance ItMw_2H_Axe_Heavy_04(C_Item)
{
	name = "Pěst trola";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Axe_Heavy_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcSword01(C_Item)
{
	name = "Krush Varrok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe01(C_Item)
{
	name = "Krush Pach";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 35;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe02(C_Item)
{
	name = "Krush UrRok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 38;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe03(C_Item)
{
	name = "Krush Agash";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe04(C_Item)
{
	name = "Krush BrokDar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 43;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcMace01(C_Item)
{
	name = "Krush Karrok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 50;
	damageTotal = 75;
	damagetype = DAM_BLUNT;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_2H_OrcMace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRwOrcstaff(C_Item)
{
	name = "Grachtnakk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRwUdOrcstaff(C_Item)
{
	name = "ShaBaNakk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_SHORT_06(C_Item)
{
	name = "Rezavý Chňapavčí dráp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 50;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "DB_ItMw_1H_Sword_Short_Rep_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_04(C_Item)
{
	name = "Rozdělovač stínů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 105;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "DB_ItMw_2H_Sword_Smith_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_BASTARD_06(C_Item)
{
	name = "Šepot smrti";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "DB_Itmw_1H_Sword_Bastard_Smith_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance SCORPIO_CROSSBOW(C_Item)
{
	name = "Lehká kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 60;
	damagetype = DAM_POINT;
	munition = ItAmBolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItRwCrossbow1.mms";
	owner = GRD_205_Scorpio;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance FLETCHER_SWORD(C_Item)
{
	name = "Lehký meč stráže";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	owner = GRD_255_Fletcher;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLYS_SWORD(C_Item)
{
	name = "Kopáčova poslušnost";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_Short_05.3DS";
	owner = STT_315_Sly;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance RODRIGUEZ_STAFF(C_Item)
{
	name = "Bojová hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 50;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_2H_Staff_01.3DS";
	owner = KDF_400_Rodriguez;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

