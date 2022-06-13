instance ItWr_GolemBook1(C_Item)
{
	name = "Arcanum Golum - Svazek I.";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseGolemBook1;
};

func void UseGolemBook1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"ARCANUM GOLUM - Svazek I.");
	Doc_PrintLine(nDocID,0,"=====================");
	Doc_PrintLines(nDocID,0,"(Magie golemů)");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jedině ten, kdo se setkal s těmito bytostmi, které povstaly z živlů, si dokáže plně uvědomit, jak velký respekt si dokážou tato magická stvoření získat u odvážných poutníků. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Kamenný golem");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Tito kolosové jsou v boji prakticky nezranitelní. Zdá se, že meče, sekyry ani luky těm obrům neublíží.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jediná zdánlivě ověřená zpráva z boje s jedním takovým leviatanem pochází od jakéhosi žoldáka. Trhliny, které mu způsobil svým válečným kladivem, nakonec zapříčinily, že se golem rozpadl na malé kousky.");
	Doc_Show(nDocID);
};

instance ItWr_GolemBook2(C_Item)
{
	name = "arcanum Golum - Svazek II.";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseGolemBook2;
};

func void UseGolemBook2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"ARCANUM GOLUM - Svazek II.");
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ledový Golem");
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID,0,"Ledoví golemové jsou svým způsobem příbuzní kamenných golemů, jejich fyzikální podstata se však zdá být vodní povahy. Veškeré známé zbraně sklouzávají po povrchu těchto ledových bytostí.");
	Doc_PrintLines(nDocID,0,"Odvážní poutníci, mějte se na pozoru před dechem těchto  bytostí, který vás v mžiku obklopí ledovými sloupy.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Kterýsi mág Ohně popsal střetnutí s touto příšerou, ale zřejmě mnoho nevěděl o nebezpečí, které představovala.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ohnivý golem");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Podle zpráv dokážou tyto ohnivé bytosti jediným dotykem proměnit své oběti v moře plamenů.");
	Doc_PrintLines(nDocID,1,"Bylo to sotva před rokem, kdy skupina lovců potkala jednoho z nich, jak si vykračuje po řeřavém uhlí. O výsledku střetnutí nebyla podána zpráva, ale blesky a led na tuto pekelnou stvůru zřejmě trochu účinkovaly.");
	Doc_Show(nDocID);
};

instance ItWrWorldmap_Orc(C_Item)
{
	name = "Mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseWorldmap_Orc;
	description = "Mapa kolonie (doplněná)";
	text[0] = "Ur-Shak, skřetí šaman, do ní zakreslil";
	text[1] = "skřetí území!";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseWorldmap_Orc()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_Orc.tga",1);
	Doc_Show(nDocID);
};

instance ItKe_Freemine(C_Item)
{
	name = "Klíč od Svobodného dolu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Klíč od Svobodného dolu";
	text[5] = NAME_Value;
	count[5] = value;
};

instance OrcMedicine(C_Item)
{
	name = "Skřetí lék";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ITFO_POTION_STRENGTH_01.3DS";
	material = MAT_GLAS;
	on_state[0] = UseOrcMedicine;
	scemeName = "POTION";
	description = name;
	text[0] = "Účinek: neznámý";
};

func void UseOrcMedicine()
{
	if(C_NpcIsOrc(self))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	};

};

instance UluMulu(C_Item)
{
	name = "Ulu-Mulu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	value = 1000;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_Amulet_Ulumulu_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = "Ulu-Mulu je znamení velké síly a";
	text[1] = "vážnosti. Ten, kdo je nosí, nebude";
	text[2] = "skřety napaden!";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_CORRISTO(C_Item)
{
	name = "Corristův klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Corristův klíč";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITWR_CORRISTO_01(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usecorristo_01;
	description = "Poznámka";
	text[0] = "";
	text[1] = "Tuhle poznámku";
	text[2] = "jsem našel v truhle";
	text[3] = "Ohnivého Mága";
};

func void usecorristo_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Poté, co Xardas opustil náš řád a odešel se věnovat svým temným studiím, jsem ukryl jeho věci sem do truhly. Magická runa je příliš nebezpečná na to, aby se tu jenom tak válela. Klíč budu mít vždy u sebe, aby nikoho bez mého vědomí nenapadlo truhlu otevřít.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Corristo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITKEY_KALOM_GUR_01(C_Item)
{
	name = "Kalomův klíč";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Od Kalomovy truhly";
};

instance ITKEY_RAVEN_EBR_01(C_Item)
{
	name = "Ravenův klíč";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Od Ravenovy truhly";
	text[1] = "";
};

