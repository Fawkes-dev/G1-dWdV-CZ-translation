instance ItArRuneLight(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 300;
	visual = "ItAr_Rune_42.3ds";
	material = MAT_STONE;
	spell = SPL_LIGHT;
	mag_circle = 1;
	description = "Světlo";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollLight(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "ItAr_Scroll_32.3DS";
	material = MAT_STONE;
	spell = SPL_LIGHT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_LIGHT;
	description = "Světlo";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneFirebolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 300;
	visual = "ItAr_Rune_23.3ds";
	material = MAT_STONE;
	spell = SPL_FIREBOLT;
	mag_circle = 1;
	description = "Ohnivý šíp";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIREBOLT;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFirebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItAr_Scroll_35.3DS";
	material = MAT_STONE;
	spell = SPL_FIREBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIREBOLT;
	description = "Ohnivý šíp";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIREBOLT;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneFireball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_26.3ds";
	material = MAT_STONE;
	spell = SPL_FIREBALL;
	mag_circle = 3;
	description = "Ohnivá koule";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIREBALL;
	text[2] = ConcatStrings(NAME_Dam_Fire,NAME_PerMana);
	count[2] = SPL_DAMAGE_FIREBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFireball(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_27.3DS";
	material = MAT_STONE;
	spell = SPL_FIREBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIREBALL;
	description = "Ohnivá koule";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIREBALL;
	text[2] = ConcatStrings(NAME_Dam_Fire,NAME_PerMana);
	count[2] = SPL_DAMAGE_FIREBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneFirestorm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_24.3ds";
	material = MAT_STONE;
	spell = SPL_FIRESTORM;
	mag_circle = 4;
	description = "Ohnivá bouře";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIRESTORM;
	text[2] = ConcatStrings(NAME_Dam_Fire,NAME_PerMana);
	count[2] = SPL_DAMAGE_FIRESTORM;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFirestorm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_28.3DS";
	material = MAT_STONE;
	spell = SPL_FIRESTORM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIRESTORM;
	description = "Ohnivá bouře";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIRESTORM;
	text[2] = ConcatStrings(NAME_Dam_Fire,NAME_PerMana);
	count[2] = SPL_DAMAGE_FIRESTORM;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneFireRain(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1300;
	visual = "ItAr_Rune_25.3ds";
	material = MAT_STONE;
	spell = SPL_FIRERAIN;
	mag_circle = 5;
	description = "Ohnivý déšť";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFirerain(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 130;
	visual = "ItAr_Scroll_36.3DS";
	material = MAT_STONE;
	spell = SPL_FIRERAIN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIRERAIN;
	description = "Ohnivý déšť";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneTeleport1(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_38.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport1;
	description = "Teleport k mágům Ohně";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport1(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_38.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport1;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Teleport k mágům Ohně";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArRuneTeleport2(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_40.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport2;
	description = "Teleport k mágům Vody";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport2(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_37.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Teleport k mágům Vody";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArRuneTeleport3(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_41.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport3;
	description = "Teleport k nekromantovi";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport3(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_40.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport3;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Teleport k nekromantovi";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport4(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_39.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport4;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Skřetí teleportační kouzlo";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArRuneTeleport5(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_39.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport5;
	description = "Teleport do tábora v bažinách";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport5(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_39.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport5;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Teleport do tábora v bažinách";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArRuneHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_27.3ds";
	material = MAT_STONE;
	spell = SPL_HEAL;
	mag_circle = 2;
	description = "Uzdravení";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_HealingPerMana;
	count[1] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_STONE;
	spell = SPL_HEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_HEALING_HP_PER_MP;
	description = "Uzdravení";
	text[1] = NAME_HealingPerMana;
	count[1] = SPL_HEALING_HP_PER_MP;
	text[2] = NAME_Mana_needed;
	count[2] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfBloodfly(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_37.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_BLOODFLY;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_BLOODFLY;
	description = "Proměna v krvavou mouchu";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_BLOODFLY;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFBLOODFLY(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Rune_27.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_BLOODFLY;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_BLOODFLY;
	description = "Proměna v krvavou mouchu";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_BLOODFLY;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfCrawler(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_04.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_CRAWLER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_CRAWLER;
	description = "Proměna v důlního červa";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_CRAWLER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFCRAWLER(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Rune_31.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_CRAWLER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_CRAWLER;
	description = "Proměna v důlního červa";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_CRAWLER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfLurker(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_02.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_LURKER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_LURKER;
	description = "Proměna v číhavce";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_LURKER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFLURKER(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Rune_32.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_LURKER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_LURKER;
	description = "Proměna v číhavce";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_LURKER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfMeatbug(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_03.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_MEATBUG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MEATBUG;
	description = "Proměna ve žravou štěnici";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_MEATBUG;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFMEATBUG(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Rune_36.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_MEATBUG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MEATBUG;
	description = "Proměna ve žravou štěnici";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_MEATBUG;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfMolerat(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_05.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_MOLERAT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MOLERAT;
	description = "Proměna v krysokrta";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_MOLERAT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFMOLERAT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Rune_35.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_MOLERAT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MOLERAT;
	description = "Proměna v krysokrta";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_MOLERAT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfOrcdog(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_11.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_ORCDOG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_ORCDOG;
	description = "Proměna v skřetího psa";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_ORCDOG;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFORCDOG(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItAr_Rune_30.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_ORCDOG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_ORCDOG;
	description = "Proměna v skřetího psa";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_ORCDOG;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfScavenger(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_07.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SCAVENGER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SCAVENGER;
	description = "Proměna v mrchožrouta";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SCAVENGER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFSCAVENGER(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 350;
	visual = "ItAr_Rune_33.3ds";
	material = MAT_STONE;
	spell = SPL_TRF_SCAVENGER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SCAVENGER;
	mag_circle = 3;
	description = "Proměna v mrchožrouta";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SCAVENGER;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfShadowbeast(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_06.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SHADOWBEAST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SHADOWBEAST;
	description = "Proměna v stínovou šelmu";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SHADOWBEAST;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFSHADOWBEAST(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItAr_Rune_32.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SHADOWBEAST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SHADOWBEAST;
	description = "Proměna v stínovou šelmu";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SHADOWBEAST;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfSnapper(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItAr_Scroll_38.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SNAPPER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SNAPPER;
	description = "Proměna v chňapavce";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SNAPPER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFSNAPPER(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItAr_Rune_27.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SNAPPER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SNAPPER;
	description = "Proměna v chňapavce";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SNAPPER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfWaran(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_10.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_WARAN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WARAN;
	description = "Proměna v ještěrku";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_WARAN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFWARAN(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Rune_37.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_WARAN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WARAN;
	description = "Proměna v ještěrku";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_WARAN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfWolf(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_09.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_WOLF;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WOLF;
	description = "Proměna ve vlka";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_WOLF;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNETRFWOLF(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Rune_29.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_WOLF;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WOLF;
	description = "Proměna ve vlka";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_WOLF;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneChainLightning(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_18.3ds";
	material = MAT_STONE;
	spell = SPL_CHAINLIGHTNING;
	mag_circle = 4;
	description = "Blesk";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollChainLightning(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_20.3DS";
	material = MAT_STONE;
	spell = SPL_CHAINLIGHTNING;
	description = "Blesk";
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneThunderbolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_19.3ds";
	material = MAT_STONE;
	spell = SPL_THUNDERBOLT;
	mag_circle = 1;
	description = "Ledový šíp";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollThunderbolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_41.3DS";
	material = MAT_STONE;
	spell = SPL_THUNDERBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_THUNDERBOLT;
	description = "Ledový šíp";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneThunderball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_20.3ds";
	material = MAT_STONE;
	spell = SPL_THUNDERBALL;
	mag_circle = 3;
	description = "Kulový blesk";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2] = ConcatStrings(NAME_Dam_Magic,NAME_PerMana);
	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollThunderball(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_STONE;
	spell = SPL_THUNDERBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_THUNDERBALL;
	description = "Kulový blesk";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2] = ConcatStrings(NAME_Dam_Magic,NAME_PerMana);
	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneIceCube(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_21.3ds";
	material = MAT_STONE;
	spell = SPL_ICECUBE;
	mag_circle = 3;
	description = "Ledový blok";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICECUBE;
	text[2] = NAME_Damage;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollIcecube(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_25.3DS";
	material = MAT_STONE;
	spell = SPL_ICECUBE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ICECUBE;
	description = "Ledový blok";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICECUBE;
	text[2] = NAME_Damage;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneIceWave(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_22.3ds";
	material = MAT_STONE;
	spell = SPL_ICEWAVE;
	mag_circle = 5;
	description = "Ledová vlna";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICEWAVE;
	text[2] = NAME_Damage;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollIceWave(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_30.3DS";
	material = MAT_STONE;
	spell = SPL_ICEWAVE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ICEWAVE;
	description = "Ledová vlna";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICEWAVE;
	text[2] = NAME_Damage;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNESUMMONDEMON(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 5500;
	visual = "ItAr_Rune_13.3ds";
	material = MAT_STONE;
	spell = SPL_SUMMONDEMON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONDEMON;
	mag_circle = 6;
	description = "Vyvolání démona";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONDEMON;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollSummonDemon(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 550;
	visual = "ItAr_Scroll_18.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONDEMON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONDEMON;
	description = "Vyvolání démona";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONDEMON;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNESUMMONSKELETONS(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 3500;
	visual = "ItAr_Rune_16.3ds";
	material = MAT_STONE;
	spell = SPL_SUMMONSKELETON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONSKELETON;
	mag_circle = 6;
	description = "Vyvolání kostlivce";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONSKELETON;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollSummonSkeletons(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Scroll_23.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONSKELETON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONSKELETON;
	description = "Vyvolání kostlivce";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONSKELETON;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNESUMMONGOLEM(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 4500;
	visual = "ItAr_Rune_16.3ds";
	material = MAT_STONE;
	spell = SPL_SUMMONGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONGOLEM;
	mag_circle = 6;
	description = "Vyvolání golema";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONGOLEM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollSummonGolem(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 450;
	visual = "ItAr_Scroll_23.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONGOLEM;
	description = "Vyvolání golema";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONGOLEM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNEARMYOFDARKNESS(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 6660;
	visual = "ItAr_Rune_12.3ds";
	material = MAT_STONE;
	spell = SPL_ARMYOFDARKNESS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ARMYOFDARKNESS;
	mag_circle = 6;
	description = "Armáda Temnot";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ARMYOFDARKNESS;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollArmyOfDarkness(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 666;
	visual = "ItAr_Scroll_29.3DS";
	material = MAT_STONE;
	spell = SPL_ARMYOFDARKNESS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ARMYOFDARKNESS;
	description = "Armáda Temnot";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ARMYOFDARKNESS;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneDestroyUndead(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_15.3ds";
	material = MAT_STONE;
	spell = SPL_DESTROYUNDEAD;
	mag_circle = 5;
	description = "Smrt nemrtvému";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollDestroyUndead(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_26.3DS";
	material = MAT_STONE;
	spell = SPL_DESTROYUNDEAD;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_DESTROYUNDEAD;
	description = "Smrt nemrtvému";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneWindfist(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_06.3ds";
	material = MAT_STONE;
	spell = SPL_WINDFIST;
	mag_circle = 2;
	description = "Úder větru";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_WINDFIST;
	text[2] = ConcatStrings(NAME_Dam_Fly,NAME_PerMana);
	count[2] = SPL_DAMAGE_WINDFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollWindfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_12.3DS";
	material = MAT_STONE;
	spell = SPL_WINDFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_WINDFIST;
	description = "Úder větru";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_WINDFIST;
	text[2] = ConcatStrings(NAME_Dam_Fly,NAME_PerMana);
	count[2] = SPL_DAMAGE_WINDFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneStormfist(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_07.3ds";
	material = MAT_STONE;
	spell = SPL_STORMFIST;
	mag_circle = 3;
	description = "Větrná pěst";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_STORMFIST;
	text[2] = ConcatStrings(NAME_Dam_Fly,NAME_PerMana);
	count[2] = SPL_DAMAGE_STORMFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollStormfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_17.3DS";
	material = MAT_STONE;
	spell = SPL_STORMFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_STORMFIST;
	description = "Větrná pěst";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_STORMFIST;
	text[2] = ConcatStrings(NAME_Dam_Fly,NAME_PerMana);
	count[2] = SPL_DAMAGE_STORMFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneTelekinesis(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_05.3ds";
	material = MAT_STONE;
	spell = SPL_TELEKINESIS;
	mag_circle = 2;
	description = "Telekineze";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManaPerSec;
	count[1] = 1;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTelekinesis(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_13.3DS";
	material = MAT_STONE;
	spell = SPL_TELEKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 10;
	description = "Telekineze";
	text[1] = NAME_ManaPerSec;
	count[1] = 1;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneCharm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_10.3ds";
	material = MAT_STONE;
	spell = SPL_CHARM;
	mag_circle = 3;
	description = "Šarm";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_CHARM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollCharm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_19.3DS";
	material = MAT_STONE;
	spell = SPL_CHARM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_CHARM;
	description = "Šarm";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_CHARM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneSleep(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_09.3ds";
	material = MAT_STONE;
	spell = SPL_SLEEP;
	mag_circle = 2;
	description = "Spánek";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollSleep(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_STONE;
	spell = SPL_SLEEP;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SLEEP;
	description = "Spánek";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRunePyrokinesis(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_04.3ds";
	material = MAT_STONE;
	spell = SPL_PYROKINESIS;
	mag_circle = 4;
	description = "Pyrokineze";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollPyrokinesis(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_33.3DS";
	material = MAT_STONE;
	spell = SPL_PYROKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 10;
	description = "Pyrokineze";
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneControl(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_02.3ds";
	material = MAT_STONE;
	spell = SPL_CONTROL;
	mag_circle = 4;
	description = "Ovládnutí";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollControl(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_08.3DS";
	material = MAT_STONE;
	spell = SPL_CONTROL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 30;
	description = "Ovládnutí";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNEFEAR(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 2500;
	visual = "ItAr_Rune_11.3ds";
	material = MAT_STONE;
	spell = SPL_FEAR;
	mag_circle = 3;
	description = "Strach";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FEAR;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFear(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 250;
	visual = "ItAr_Scroll_34.3DS";
	material = MAT_STONE;
	spell = SPL_FEAR;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FEAR;
	description = "Strach";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FEAR;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNEBERZERK(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 2000;
	visual = "ItAr_Rune_03.3ds";
	material = MAT_STONE;
	spell = SPL_BERZERK;
	mag_circle = 4;
	description = "Berserker";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_BERZERK;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollBerzerk(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_22.3DS";
	material = MAT_STONE;
	spell = SPL_BERZERK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_BERZERK;
	description = "Berserker";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_BERZERK;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArRuneBreathOfDeath(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1500;
	visual = "ItAr_Rune_14.3ds";
	material = MAT_STONE;
	spell = SPL_BREATHOFDEATH;
	mag_circle = 6;
	description = "Dech smrti";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_BREATHOFDEATH;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_BREATHOFDEATH;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNESHRINK(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 10000;
	visual = "ItAr_Rune_08.3ds";
	material = MAT_STONE;
	spell = SPL_SHRINK;
	mag_circle = 4;
	description = "Zmenši nestvůru";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SHRINK;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollShrink(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 1000;
	visual = "ItAr_Scroll_15.3DS";
	material = MAT_STONE;
	spell = SPL_SHRINK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SHRINK;
	description = "Zmenši nestvůru";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SHRINK;
	text[5] = NAME_Value;
	count[5] = value;
};

