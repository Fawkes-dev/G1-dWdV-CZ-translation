instance ItWrTemplemap(C_Item)
{
	name = "Mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTemplemap;
	description = "Náčrt chrámu";
	text[4] = NAME_Value;
	count[4] = value;
};

func void UseTemplemap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Temple.tga",1);
	Doc_Show(nDocID);
};

instance ItMiAlarmhorn(C_Item)
{
	name = "Roh";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 9;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_WOOD;
	scemeName = "HORN";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Idol_Sleeper_01(C_Item)
{
	name = "Figurka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "Toto je figurka znetvořené";
	text[1] = "bytosti s maskou.";
	text[2] = "Maska je zakončena šesti velkými ostny.";
};

instance Weltenspalter(C_Item)
{
	name = "Rozkol světů";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "To byl meč nemrtvého";
	text[1] = "skřetího kněze Varrag-Hashora.";
	text[2] = "Během času se tato zbraň";
	text[3] = "stala nepoužitelnou.";
	text[4] = "Možná by ten meč bylo";
	text[5] = "možné použít jinak.";
};

instance Lichtbringer(C_Item)
{
	name = "Ostří blesku";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "To byl meč nemrtvého";
	text[1] = "skřetího kněze Varrag-Kasorga.";
	text[2] = "Během času se tato zbraň";
	text[3] = "stala nepoužitelnou.";
	text[4] = "Možná by ten meč bylo";
	text[5] = "možné použít jinak.";
};

instance Zeitenklinge(C_Item)
{
	name = "Ostří času";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "To byl meč nemrtvého";
	text[1] = "skřetího kněze Varrag-Unhilqta.";
	text[2] = "Během času se tato zbraň";
	text[3] = "stala nepoužitelnou.";
	text[4] = "Možná by ten meč bylo";
	text[5] = "možné použít jinak.";
};

instance Daemonenstreich(C_Item)
{
	name = "Úder démona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "To byl meč nemrtvého";
	text[1] = "skřetího kněze Varrag-Ruuushka.";
	text[2] = "Během času se tato zbraň";
	text[3] = "stala nepoužitelnou.";
	text[4] = "Možná by ten meč bylo";
	text[5] = "možné použít jinak.";
};

instance Bannklinge(C_Item)
{
	name = "Ostří vyhnanství";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "To byl meč nemrtvého";
	text[1] = "To byl meč nemrtvého mocného";
	text[2] = "Během času se tato zbraň";
	text[3] = "stala nepoužitelnou.";
	text[4] = "Možná by ten meč bylo";
	text[5] = "možné použít jinak.";
};

instance Mythrilklinge(C_Item)
{
	name = "Podivný meč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Krásně provedený meč.";
	text[1] = "Jsou do něj vyryty starodávné runy";
	text[2] = "Možná by ty runy dokázal rozluštit Xardas!";
	text[3] = "Dokud je nerozluští,";
	text[4] = " nebudu meč raději používat!";
};

instance Mythrilklinge01(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Xardas řekl, že se ten meč jmenuje URIZIEL a";
	text[1] = "předpokládá, že je velmi starý. Před dávnými časy";
	text[2] = "měl velkou moc, ale už své kouzlo ztratil.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge02(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_FIRE] = 30;
	damage[DAM_INDEX_MAGIC] = 120;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_02.3DS";
	description = name;
	text[0] = "To je meč URIZIEL.";
	text[1] = "Uriziel je obdařen kouzlem.";
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dam_Fire;
	count[3] = damage[DAM_INDEX_FIRE];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge03(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Z jeho čepele byl odstraněn magický";
	text[1] = "klenot. Je to stále vynikající zbraň, ale své";
	text[2] = "kouzlo již ztratila.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Scroll4Milten(C_Item)
{
	name = "Přenos síly";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWrScroll.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Kouzlo přenosu magické";
	text[1] = "síly do Urizielu.";
	text[2] = "Nemůžu jej použít.";
};

instance ItKe_SunkenTower(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevře dveře do";
	text[1] = "zatopené věže.";
};

instance DungeonKey(C_Item)
{
	name = "Klíč od vězení";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevře vězení";
	text[0] = "Starého tábora.";
};

instance UrizielRune(C_Item)
{
	name = "Smrtelná vlna URIZIELU";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItAr_Rune_14.3ds";
	material = MAT_STONE;
	spell = SPL_MASSDEATH;
	mag_circle = 6;
	description = name;
	text[0] = "Tato mocná kouzelná runa obsahuje";
	text[1] = "prastarou sílu meče URIZIEL.";
	text[2] = NAME_Mag_Circle;
	count[2] = mag_circle;
	text[3] = NAME_Manakosten;
	count[3] = SPL_SENDCAST_MASSDEATH;
	text[4] = NAME_Dam_Magic;
	count[4] = SPL_DAMAGE_MASSDEATH;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_DEMONS(C_Item)
{
	name = "Rezavý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Rezavý klíč";
	text[1] = "Zrezivělý klíč";
	text[5] = NAME_Value;
	count[5] = value;
};

