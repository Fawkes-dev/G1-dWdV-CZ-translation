instance MordragsRing(C_Item)
{
	name = "Mordragův prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 250;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_MordragsRing;
	on_unequip = UnEquip_MordragsRing;
	description = "Mordragův prsten";
	text[2] = NAME_Bonus_Dex;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};

func void Equip_MordragsRing()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
};

func void UnEquip_MordragsRing()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
};

instance SpecialJoint(C_Item)
{
	name = "Upravený přivolávač snů";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint3 * 10;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseSpecialJoint;
	text[0] = "Droga z bažin se silnějším";
	text[1] = "účinkem než obyčejná droga.";
	text[3] = "To je pro Guru Baala Tyona!";
	text[5] = NAME_Value;
	count[4] = Value_Joint3 * 10;
};

func void UseSpecialJoint()
{
	AI_StartState(self,ZS_MagicSleep,1,"");
};

instance ItAt_DamLurker_01(C_Item)
{
	name = "Drápy hrázového číhavce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Lurkerklaue;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Lurkerklaue * 2;
};

instance ItWrOMMap(C_Item)
{
	name = "Mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseOMmap;
	description = "Mapa Starého dolu";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseOMmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_OldMine.tga",1);
	Doc_Show(nDocID);
};

instance AltesSchwertVM(C_Item)
{
	name = "Starý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	damageTotal = 10;
	damagetype = DAM_EDGE;
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

instance AltesSchwert(C_Item)
{
	name = "Starý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	visual = "ItMw_1H_Sword_Old_01.3DS";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance JackalsSword(C_Item)
{
	name = "Jackalův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	owner = Grd_201_Jackal;
	value = 27;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	damageTotal = 3;
	damagetype = DAM_EDGE;
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

instance KdW_Amulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Odznak kurýrů mágů Vody";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Cronos_Brief(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseCronosBrief;
	scemeName = "MAP";
	description = "Kronosův dopis mágům Ohně";
};

func void UseCronosBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Slovutný mistře Corristo,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Saturas, velevážený mistr mágů Kruhu vody, vás snažně žádá o podporu, která by zajistila, aby napětí mezi Starým a Novým táborem zůstalo v takových mezích, které by byly ku prospěchu obou stran. Protože jste zodpovědný za měsíční zásilky magické rudy králi, je zřejmé, že zastavení aktivit banditů z Nového tábora je i ve vašem zájmu. Naším přáním pak je, aby Starý tábor již nepodnikal žádné kroky, které by ohrožovaly naše úsilí o znovuotevření Bariéry, která nás všechny drží ve vězení.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"S očekáváním brzké odpovědi,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Cronos, držitel rudy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance Neks_Amulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Nek;
	on_unequip = UnEquip_Schutzamulett_Nek;
	description = "Amulet mrtvého strážce";
	text[1] = "Na rubu je vyryto jméno NEK.";
	text[2] = NAME_Prot_Edge;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};

func void Equip_Schutzamulett_Nek()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
};

func void UnEquip_Schutzamulett_Nek()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
};

//TODO: item DEXTERJOINT nieje pouzity?
instance DEXTERJOINT(C_Item)
{
	name = "Osvícení mysli";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	hp = 10;
	hp_max = 10;
	weight = 1;
	value = 1;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = usedexterjoint;
	description = name;
	text[0] = "Tato Tráva z bažin";
	text[1] = "má speciální efekt na vědomí";
//	text[2] = "své oběti";
	text[5] = NAME_Value;
	count[5] = value;
};

func void usedexterjoint()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",Time_Haste3);
};

instance HealthWater(C_Item)
{
	name = "Hojivý lektvar pro Y´Beriona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItFo_Potion_Health_03.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance TheList(C_Item)
{
	name = "Seznam požadavků";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTheList;
	description = name;
	text[0] = "Ian, vůdce Starého tábora,";
	text[1] = "vypracoval seznam požadavků.";
};

func void UseTheList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Seznam požadavků");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"20 bochníků chleba - tentokrát žádnou shnilotinu!");
	Doc_PrintLine(nDocID,0,"25 - 30 jablek");
	Doc_PrintLine(nDocID,0,"10 kousků sýra");
	Doc_PrintLine(nDocID,0,"1 naběračku polévky");
	Doc_PrintLine(nDocID,0,"1 kartáč");
	Doc_PrintLine(nDocID,0,"5 krumpáčů + 3 kladiva");
	Doc_PrintLines(nDocID,0,"A pořádnou dávku drogy z bažin - to víš, první dodávka v měsíci!");
	Doc_PrintLine(nDocID,0,"Pozítří očekáváme dodávku.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"IAN");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance TheListNC(C_Item)
{
	name = "Seznam požadavků (upravený)";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTheListNC;
	description = name;
	text[0] = "Ian, vůdce Starého tábora,";
	text[1] = "vypracoval seznam požadavků.";
	text[2] = "(Lares přidal pár bodů. Opravdu";
	text[3] = "zdařilý padělek!)";
};

func void UseTheListNC()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Seznam požadavků");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"20 bochníků chleba - tentokrát žádnou shnilotinu!");
	Doc_PrintLine(nDocID,0,"25 - 30 jablek");
	Doc_PrintLine(nDocID,0,"10 kousků sýra");
	Doc_PrintLine(nDocID,0,"1 naběračku polévky");
	Doc_PrintLine(nDocID,0,"1 kartáč");
	Doc_PrintLine(nDocID,0,"5 krumpáčů + 3 kladiva");
	Doc_PrintLines(nDocID,0,"A pořádnou dávku drogy z bažin - to víš, první dodávka v měsíci!");
	Doc_PrintLine(nDocID,0,"Pozítří očekáváme dodávku.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"IAN");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ještě mě napadlo:");
	Doc_PrintLine(nDocID,0,"30 lahví piva");
	Doc_PrintLine(nDocID,0,"5 lahví vína");
	Doc_PrintLine(nDocID,0,"25 pečených mrchožroutích kýt");
	Doc_PrintLine(nDocID,0,"půltucet náhradních zbraní");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance Lares_Ring(C_Item)
{
	name = "Laresův prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING || ITEM_MISSION;
	value = 50;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Lares_Ring;
	on_unequip = UnEquip_Lares_Ring;
	description = "Laresův prsten";
	text[2] = NAME_Bonus_Str;
	count[2] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};

func void Equip_Lares_Ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,3);
};

func void UnEquip_Lares_Ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-3);
};

instance Heiltrank(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI || ITEM_MISSION;
	value = 100;
	visual = "ItFo_Potion_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseHeiltrank;
	scemeName = "POTION";
	description = "Lektvar pro rychlé vyhojení";
	text[2] = NAME_Bonus_HP;
	count[2] = 30;
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseHeiltrank()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseHealthPotion");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,30);
	PrintDebugNpc(PD_ITEM_MOBSI,"Ich trinke meinen Heiltrank");
};

instance SpecialWater(C_Item)
{
	name = "Magická voda";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItFoFlaskHealth.3ds";
	material = MAT_GLAS;
	scemeName = "POTION";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance KalomsRecipe(C_Item)
{
	name = "Kalomův recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Recept na hojivý lektvar";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_KalomsRecipe;
};

func void Use_KalomsRecipe()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Lifrun ak Gharak");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Gharak Or Nach bin thu. Lifrun mar Orag chtah. Shrunk esp Horinth.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Vypadá, že to dává smysl, když se to čte pozpátku.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"          - Kalom");
	Doc_Show(nDocID);
};

instance ItWrWorldmap(C_Item)
{
	name = "Mapa kolonie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseWorldmap;
	description = name;
	text[0] = "Bohužel, schází velké";
	text[1] = "území na jihozápadě.";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseWorldmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World.tga",1);
	Doc_Show(nDocID);
};

instance ItWrOCmap(C_Item)
{
	name = "Mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseOCmap;
	description = "Přehled Starého tábora";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseOCmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_OldCamp.tga",1);
	Doc_Show(nDocID);
};

instance ItWrNCmap(C_Item)
{
	name = "Mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseNCmap;
	description = "Přehled Nového tábora";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseNCmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewCamp.tga",1);
	Doc_Show(nDocID);
};

instance ItWrPSImap(C_Item)
{
	name = "Mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UsePSImap;
	description = "Přehled Tábora v bažinách";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UsePSImap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_PSICamp.tga",1);
	Doc_Show(nDocID);
};

instance ItWrPinup(C_Item)
{
	name = "Náčrt";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 60;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UsePinUp;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

func void UsePinUp()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_PinUp.tga",1);
	Doc_Show(nDocID);
};

instance ItWrDieVerurteilten(C_Item)
{
	name = "Trestanci";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWrBook.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Fire_Letter_01(C_Item)
{
	name = "Zapečetěný dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseFireletter;
	scemeName = "MAPSEALED";
	description = "Dopis mágům Ohně";
	text[1] = "Ta pečeť nesmí být rozlomena!";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseFireletter()
{
	var int nDocID;
	CreateInvItem(hero,ItWr_Fire_Letter_02);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Slovutný mistře Xardasi,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Váš poslední dopis v nás vyvolal velké starosti. Celou záležitost jsme probrali a v tomto dopise vám posíláme naši odpověď. Bratrstvo představuje hrozbu. Ohrožuje prosperitu naší obchodní smlouvy, která pak potažmo ohrožuje krále, tedy i celé království a vaše vlastní životy. Proto byste měli vyslat zvědy, kteří by zjistili, z jakého božstva vycházejí jejich znalosti a magická moc. Je naší povinností tu sektu rozprášit a jejich vědomosti si přivlastnit, aby jich nikdo jiný nemohl zneužít. V tomto okamžiku již naši učenci studují ve starých knihách. O našich poznatcích vás budeme informovat, a to obvyklými způsoby komunikace.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Nechť nás Innos všechny ochrání");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Fire_Letter_02(C_Item)
{
	name = "Otevřený dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseFireletter2;
	scemeName = "MAP";
	description = "Dopis mágům Ohně";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseFireletter2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Slovutný mistře Xardasi,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Váš poslední dopis v nás vyvolal velké starosti. Celou záležitost jsme probrali a v tomto dopise vám posíláme naši odpověď. Bratrstvo představuje hrozbu. Ohrožuje prosperitu naší obchodní smlouvy, která pak potažmo ohrožuje krále, tedy i celé království a vaše vlastní životy. Proto byste měli vyslat zvědy, kteří by zjistili, z jakého božstva vycházejí jejich znalosti a magická moc. Je naší povinností tu sektu rozprášit a jejich vědomosti si přivlastnit, aby jich nikdo jiný nemohl zneužít. V tomto okamžiku již naši učenci studují ve starých knihách. O našich poznatcích vás budeme informovat, a to obvyklými způsoby komunikace.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Nechť nás Innos všechny ochrání");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItKe_Gomez_01(C_Item)
{
	name = "Gomezův klíč";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevře Gomezovy truhlice.";
	text[1] = "Otevře sklad ve sklepě Rudobaronů.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKey_RB_01(C_Item)
{
	name = "Klíč Rýžového lorda";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevře truhlice Rýžového lorda.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKEY_OB_SMITH_01(C_Item)
{
	name = "Železný klíč";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevře dveře od kovářova skladu";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Storage_01(C_Item)
{
	name = "Klíč do skladu";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevře hlavní vstup do skladu";
	text[1] = "ve sklepě Rudobaronů";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_OM_01(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Santinův sklad.";
	text[1] = "Horní směnárna.";
	text[2] = "Starý důl";
};

instance ItKe_OM_02(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevře Aaronovu truhlici";
	text[1] = "ve Starém dole";
};

instance ItKe_OM_03(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevře truhlice";
	text[1] = "ve skladu Starého dolu";
};

instance ItKe_OM_04(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Albertův sklad";
	text[1] = "Dolní směnárna.";
};

instance ITKE_OMCAMP_01(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Otevírá Garazovou truhlu";
	text[1] = "před Starým dolem.";
};

instance ItFo_OM_Beer_01(C_Item)
{
	name = "Silné pivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItFo_Beer_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseStarkBeer;
	scemeName = "POTION";
	description = name;
	text[0] = NAME_Bonus_HP;
	count[0] = 6;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseStarkBeer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,6);
	if(Npc_IsPlayer(self))
	{
		GET_DRUNK = GET_DRUNK + 1;
		self.voicePitch = 0;
		if(GET_DRUNK == 4)
		{
			Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",Time_Haste1);
			GET_DRUNK = 0;
		};
	};
};

var int riddle1;
var int riddle2;
var int riddle3;
var int riddle4;
var int riddle5;
var int riddle6;

instance theriddle1(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle1;
};

func void Usetheriddle1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ten, kdo se touží vzdát vší mravní špíny a kráčí po cestě poctivosti, zví, kde se nachází skrytý zdroj mé moci. Proto, aby ji mohl použít k zlomení pout tohoto světa a stal se hodným pochopit Chromanin.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Moudrý člověk si o věci udělá nejdříve přehled, než se rozhodne");
	Doc_Show(nDocID);
	if(riddle1 == FALSE)
	{
		Log_CreateTopic(theriddle_log,LOG_MISSION);
		Log_SetTopicStatus(theriddle_log,LOG_RUNNING);
		B_LogEntry(theriddle_log,"V Zamlžené věži jsem dostal od Kostlivého mága prazvláštní rukopis. Chromanin! Jakoby do vezdejšího světa vstoupila opravdová záhada! Moudrý člověk si o věci udělá nejdříve přehled, než se rozhodne pro další misi... Hmmm! Moc tomu nerozumím, ale snad jednou prohlédnu.");
		Wld_InsertItem(theriddle2,"CASTLE_TOWER_TOP");
		riddle1 = TRUE;
	};

};

instance theriddle2(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle2;
};

func void Usetheriddle2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vize z Chromaninu, které vyplavil příliv dávných časů, mi otevřely oči. Není na světě nic, co by mě přimělo vzdát se mé víry v ony vize, které se tak hluboko dotkly mého nitra.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Vše, co bylo rozděleno, se po krátkém, avšak krutém roztržení, znovu sjednotí.");
	Doc_Show(nDocID);
	if(riddle2 == FALSE)
	{
		B_GiveXP(300);
		B_LogEntry(theriddle_log,"Našel jsem druhou knihu jména Chromanin. A znovu ve mně vzklíčilo sémě záhad... Vše, co bylo rozděleno, se po krátkém, avšak krutém roztržení, znovu sjednotí.");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertItem(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
		riddle2 = TRUE;
	};

};

instance theriddle3(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle3;
};

func void Usetheriddle3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Och, prastaré Božstvo. Jak to přijde, že takový prostý a nehodný muž, jako jsem já, dostane takové velké dědictví. Mám velký strach, že kvůli sebemenšímu škobrtnutí učiněnému slovem či skutkem, zas o všechno přijdu.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Moudrý rybář občas zkouší štěstí na druhé straně jezera.");
	Doc_Show(nDocID);
	if(riddle3 == FALSE)
	{
		B_GiveXP(500);
		B_LogEntry(theriddle_log,"Našel jsem třetí rukopis. Mám pocit, že jsem začal rozumět smyslu toho díla! ...Moudrý rybář občas zkouší štěstí na druhé straně jezera.");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertItem(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
		riddle3 = TRUE;
	};

};

instance theriddle4(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 4";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle4;
};

func void Usetheriddle4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nechovám v sobě naději, že bych se jednoho dne ztotožnil s Chromaninem. Pryč jsou dny běd a nářků. Tak snadné je dosáhnout absolutní dokonalosti. A nemám k ní již daleko!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dlouho již je tomu, co činy těch, kteří kdysi stáli na palubě, upadly v zapomnění.");
	Doc_Show(nDocID);
	if(riddle4 == FALSE)
	{
		B_GiveXP(700);
		B_LogEntry(theriddle_log,"Číslo čtyři. Začínám se sám sebe ptát, jestli jsem se tím nenechal poněkud tahat za nos! ...Dlouho již je tomu, co činy těch, kteří kdysi stáli na palubě, upadly v zapomnění.");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertItem(theriddle5,"LOCATION_25_01");
		riddle4 = TRUE;
	};

};

instance theriddle5(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 5";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle5;
};

func void Usetheriddle5()
{
	var int nDocID;
	var C_Npc riddler;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nebudu tou cestou však kráčet sám. Ta čest patří mně. Musím se smířit s tím, že svoji moc budu sdílet s někým, kdo toho bude hoden, s někým, kdo přijde a vyhledá mě. Doufám jen, že přijdou brzy...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Najdeš mě tam, kde to všechno začalo.");
	Doc_Show(nDocID);
	if(riddle5 == FALSE)
	{
		B_GiveXP(850);
		B_LogEntry(theriddle_log,"Tento se zdá být poslední. Dychtím najít někoho nebo něco, s čím se mám utkat... Najdeš mě tam, kde to všechno začalo.");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertNpc(Bau_940_Riddler,"");
		riddler = Hlp_GetNpc(Bau_940_Riddler);
		Npc_ChangeAttribute(riddler,ATR_HITPOINTS,-riddler.attribute[ATR_HITPOINTS_MAX]);
		riddle5 = TRUE;
	};

};

instance theriddle6(C_Item)
{
	name = "Stará kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 6";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle6;
};

func void Usetheriddle6()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if(riddle6 == FALSE)
	{
		B_GiveXP(1000);
		B_LogEntry(theriddle_log,"Záhadný cizinec je mrtev. Zabili jej tihle démoni. Zdá se, že mezi ním a těmi pekelnými stvůrami bylo nějaké pouto, jinak by se na toto místo nevrátil zpět. Znal tajemství, které si sebou zřejmě chtěl vzít do hrobu.");
		Log_SetTopicStatus(theriddle_log,LOG_SUCCESS);
		Snd_Play("FoundRiddler");
		Wld_InsertNpc(SkeletonMage,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(Skeleton,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(SkeletonWarrior,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(Skeleton,"OW_FOGDUNGEON_36_MOVEMENT2");
		Wld_InsertNpc(SkeletonScout,"OW_FOGDUNGEON_36_MOVEMENT2");
		Wld_InsertNpc(SkeletonWarrior,"OW_FOGDUNGEON_37");
		Wld_InsertNpc(SkeletonMage,"OW_FOGDUNGEON_37");
		riddle6 = TRUE;
	};
};

instance ITKEY_ARENA_ORC_01(C_Item)
{
	name = "Šamanův klíč";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Kar-Nakhův klíč.";
};

instance ITFO_POTION_ELIXIER_CRAWLER(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ElixierEgg;
	visual = "ItFo_Potion_Elixier_Egg.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	description = "Elixír Důlního červa";
	text[0] = "Umožní spojení se Spáčem.";
	text[5] = NAME_Value;
	count[5] = Value_ElixierEgg;
};

instance ITWRWORLDMAP_MISSION(C_Item)
{
	name = "Grahamova Mapa Kolonie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 60;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useworldmap_mission;
	description = name;
	text[0] = "Grahamova osobní mapa";
//	text[1] = "od Grahama.";
	text[5] = NAME_Value;
	count[5] = value;
};

func void useworldmap_mission()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World.tga",1);
	Doc_SetFont(nDocID,0,"font_15_book.TGA");
	Doc_SetMargins(nDocID,0,300,160,10,10,1);
	Doc_PrintLine(nDocID,0,"Mapa");
	Doc_PrintLine(nDocID,0,"Kolonie");
	Doc_Show(nDocID);
};

instance RICELORDS_RING(C_Item)
{
	name = "Prsten Rýžového Lorda";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING || ITEM_MISSION;
	value = 50;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ricelords_ring;
	on_unequip = unequip_ricelords_ring;
	description = "Prsten Rýžového Lorda";
	text[2] = NAME_Bonus_Str;
	count[2] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};

func void equip_ricelords_ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,3);
};

func void unequip_ricelords_ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-3);
};

instance BLOODWYNS_SCHWERT(C_Item)
{
	name = "Bloodwynův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 100;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
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

instance BUTCHS_AMULETT(C_Item)
{
	name = "Butchův amulet";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_butch;
	on_unequip = unequip_schutzamulett_butch;
	description = "Butchův amulet";
	text[2] = NAME_Prot_Edge;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};

func void equip_schutzamulett_butch()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
};

func void unequip_schutzamulett_butch()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
};

instance ITAT_CLAWS_SNAPPER(C_Item)
{
	name = "Drápy z chňapavce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krallen;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = "Drápy z Loganova chňapavce";
	text[4] = NAME_Value;
	count[4] = Value_Krallen;
};

instance FRANCOS_AMULETT(C_Item)
{
	name = "Francův amulet";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 320;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_francosamulett;
	on_unequip = unequip_francosamulett;
	description = "Francův amulet";
	text[2] = NAME_Bonus_Dex;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};

func void equip_francosamulett()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void unequip_francosamulett()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};

instance SCARSRING(C_Item)
{
	name = "Starý prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 250;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_MordragsRing;
	on_unequip = UnEquip_MordragsRing;
	description = "Starý prsten";
	text[2] = "Tenhle šperk zažil lepší časy.";
	text[5] = NAME_Value;
	count[5] = value;
};

func void equip_scarsring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,5);
};

func void unequip_scarsring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
};

instance GARRETS_PICKAXE(C_Item)
{
	name = "Garretův krumpáč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI | ITEM_MISSION;
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

var int huntblackwolf;

instance ITWR_HUNTER_01(C_Item)
{
	name = "Stránka z denníku";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usetagebuch;
	description = "Stránka z denníku";
	text[0] = "skupiny lovců";
	text[1] = "pronásledujících smečku vlků";
	text[2] = "na východě Kolonie.";
	text[3] = "";
};

func void usetagebuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"71. Den");
	Doc_PrintLines(nDocID,0,"Zamířili jsme na východ. Doslechli jsme se o smečce vlků vedené Černým vlkem.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"75. Den");
	Doc_PrintLines(nDocID,0,"Postavili jsme tábor v lese poblíž mořských útesů. Jsme čtyři zkušení lovci. Neměl by být problém smečku ulovit. Aidan, nám za černou vlčí kůži slušně zaplatí.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"81. Den");
	Doc_PrintLines(nDocID,0,"Je půlnoc, uvízli jsme v táboře. Nic není vidět, ale slyšíme je plížit se kolem našeho tábora. Zdá se, že nás obklíčili. Doufejme, že Černý ...");
	Doc_Show(nDocID);
	if((HUNTBLACKWOLF == FALSE) && Npc_IsPlayer(self))
	{
		Wld_InsertNpc(blackwolf,"SPAWN_OW_WOLF_04_PSI5");
		Wld_InsertNpc(Wolf,"SPAWN_OW_WOLF_04_PSI5");
		Wld_InsertNpc(Wolf,"SPAWN_OW_WOLF_04_PSI5");
		HUNTBLACKWOLF = TRUE;
		HUNT_WOLF = LOG_RUNNING;
		Log_CreateTopic(CH1_BLACKWOLF,LOG_MISSION);
		Log_SetTopicStatus(CH1_BLACKWOLF,LOG_RUNNING);
		B_LogEntry(CH1_BLACKWOLF,"Na východ od kolonie jsem našel pozůstatky loveckého tábora. Zřejmě byli na lovu černého vlka, vůdce smečky. Vlk bude někde v lese.");
	};
};

instance ITFOFLEISCHEINTOPF(C_Item)
{
	name = "Dušené maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Ragout;
	visual = "ItFo_Meatbugragout_01.3ds";
	material = MAT_LEATHER;
	scemeName = "RICE";
	on_state[0] = usefleischeintopf;
	description = name;
	text[1] = NAME_Bonus_Str;
	count[1] = 1;
	text[5] = NAME_Value;
	count[5] = Value_Ragout;
};

func void usefleischeintopf()
{
	B_RaiseAttribute(ATR_STRENGTH,1);
	Snd_Play("LevelUp");
};

