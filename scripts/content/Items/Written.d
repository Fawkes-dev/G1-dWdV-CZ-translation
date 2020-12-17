instance ItWr_Book_Circle_01(C_Item)
{
	name = "První kruh";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "První kruh magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_01;
};

func void UseItWr_Book_Circle_01()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_LIGHT));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBOLT));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBOLT));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"První kruh");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Když dali bohové lidstvu schopnost kouzlit, naučili jej také zhotovovat kouzelné runy. Boží služebníci tak převzali čestnou úlohu vytvářet artefakty boží moci a používat je. Magický kruh určuje, jaký druh kouzla je kdo schopen pochopit a užívat.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Světlo");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"První Innosův dar lidstvu. Nad mágem se objeví zářící koule.");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ledový šíp");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Střela magické energie");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ohnivý šíp");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Střela magického ohně");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_01 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_01 = TRUE;
	};
};

instance ItWr_Book_Circle_02(C_Item)
{
	name = "Druhý kruh";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Druhý kruh magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_02;
};

func void UseItWr_Book_Circle_02()
{
	var int nDocID;
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_HEALING_HP_PER_MP));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Druhý kruh");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Každé kouzlo pochází z magické moci uživatele. Tento uživatel se nazývá mág.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Každé vyvolání kouzla odebere mágovi část jeho sil. Tyto síly se nazývají duchovní síly, neboli mana.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Uzdravení");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Adanos viděl, že lidé umírají a že je to vůle Beliarova, který si přeje, aby tomu tak bylo. Pravil: nebudu se vůli Beliarově  protivit, dám však lidstvu moc léčení.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Kouzlo dá mágovi schopnost uzdravování.");
	Doc_PrintLine(nDocID,1,"Jednorázová kouzla");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_02 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_02 = TRUE;
	};
};

instance ItWr_Book_Circle_03(C_Item)
{
	name = "Třetí kruh";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Třetí kruh magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_03;
};

func void UseItWr_Book_Circle_03()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBALL));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICECUBE));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBALL));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Třetí kruh");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Některá kouzla lze pomocí jistého množství magické moci obnovovat. Jsou známa jako obnovitelná kouzla.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ostatní kouzla si zachovávají účinnost jen po dobu, kdy do nich proudí duchovní síla mága. Jsou známa jako jednorázová kouzla.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ohnivá koule");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Druhý dar, který dal Innos dětem ohně. Ohnivou kouli, která zapálí své oběti.");
	Doc_PrintLine(nDocID,1,"Obnovitelné kouzlo");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ledový blok");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Oběť je uvězněna v ledovém bloku. Kouzlo chrámu mágů Vody.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Kulový blesk");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Koule magické síly.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_03 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_03 = TRUE;
	};
};

instance ItWr_Book_Circle_04(C_Item)
{
	name = "Čtvrtý kruh";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Čtvrtý kruh magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_04;
};

func void UseItWr_Book_Circle_04()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRESTORM));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_ZAPPED_DAMAGE_PER_SEC));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_DESTROYUNDEAD));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Čtvrtý kruh");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kouzlo");
	Doc_PrintLine(nDocID,0,"teleportace.");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zvláštní vlastnost těchto kouzelných zaříkávadel spočívá v tom, že ačkoliv jsou vázána v runách, může je použít kdokoliv, kdo je obdařen kouzelnou mocí. Kouzlo těchto zaříkávadel lze použít jen jednou. Kouzlo teleportace nemá žádná omezení.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Ohnivá bouře");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Stejně jako ohnivá koule toto kouzlo může udeřit jen na jednoho protivníka, pak však může přejít na další.");
	Doc_PrintLine(nDocID,1,"Obnovitelné kouzlo");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"Blesk");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Toto kouzlo zasahuje více cílů a déle působí. Sílu blesků lze obtížně ovládat. Proto se i sám uživatel může stát jejím terčem.");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Smrt nemrtvému");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Toto kouzlo likviduje nemrtvé nestvůry temnot.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_04 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_04 = TRUE;
	};
};

instance ItWr_Book_Circle_05(C_Item)
{
	name = "Pátý kruh";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Pátý kruh magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_05;
};

func void UseItWr_Book_Circle_05()
{
	var int nDocID;
	var string Text_1;
	var string Text_2;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRERAIN));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICEWAVE));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Pátý kruh");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ohnivý déšť");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Síla božího ohně zasáhne všechny stvůry v okolí mága.");
	Doc_PrintLine(nDocID,0,Text_1);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ledová vlna");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Kouzlo ledové vlny zasáhne všechny nepřátele a nakrátko je zmrazí. Během zmrazení jsou oběti znehybněny a nezpůsobují žádné škody.");
	Doc_PrintLines(nDocID,1,"Kouzlo chrámu mágů Vody.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_05 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_05 = TRUE;
	};
};

instance ItWr_Book_Circle_06(C_Item)
{
	name = "Šestý kruh";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Šestý kruh magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_06;
};

func void UseItWr_Book_Circle_06()
{
	var int nDocID;
	var string text;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_BREATHOFDEATH));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Šestý kruh");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Dech smrti");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Beliarův dech. Oblak ničivého vzduchu, který okamžitě usmrtí vše živé.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,text);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Kruh smrti");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Těžko je dohledat jakýkoliv záznam o runě, která obsahuje kouzlo URIZIELU.");
	Doc_PrintLines(nDocID,1,"Známo je jen to, že patřila k moci Beliarově.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_06 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_06 = TRUE;
	};
};

instance Goettergabe(C_Item)
{
	name = "Dar bohů";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Dar bohů";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGoettergabe;
};

func void UseGoettergabe()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"Magie");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"Dar bohů");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Člověk se pokouší odhalit podstatu a původ magie už po staletí. Kde však jen začít? Jak magii popsat? Jedná se o nejrozporuplnější sílu, která kdy byla známa. Dokáže zabíjet i léčit, dokáže tvořit i ničit.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jak vlastně taková síla vypadá? Kde může člověk najít tu neviditelnou, neskutečně obrovskou sílu? Magie je tím, čím je. Je to ten nejkrásnější a nejmocnější dar, jaký kdy božstvo lidstvu dalo. Je to boží dar určený uživatelům a šiřitelům magie. Léčivá moc je svěřena jen několika nečetným vyvolencům, kteří ji dokážou ovládat.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Barthos z Laranu");
	Doc_Show(nDocID);
	if((BOOK_GOETTERGABE == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_GOETTERGABE = TRUE;
	};
};

instance Geheimnisse_der_Zauberei(C_Item)
{
	name = "Tajemství magie";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Tajemství magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGeheimnisse_der_Zauberei;
};

func void UseGeheimnisse_der_Zauberei()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tajemství magie");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Magie není mágovi vrozena, je ji jen více způsobilý používat. Jediný um, který vlastní, je schopnost ovlivňovat a vést. Učňové umění magie musí být schopni používat svoji mysl jako nástroj.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jeho duch je jakousi lodí obklopenou tajemnými silami... která je tvaruje, usměrňuje a nakonec vypouští do světa, který známe. Během okamžiků této absolutní koncentrace vstupuje mágův duch mimo naši sféru a putuje po Odvrácené straně, která je domovem sil. Sám mág není ničím jiným než vodičem a usměrňovatelem těchto sil.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Barthos z Laranu");
	Doc_Show(nDocID);
	if((BOOK_GEHEIMNISSE_DER_ZAUBEREI == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_GEHEIMNISSE_DER_ZAUBEREI = TRUE;
	};
};

instance Machtvolle_Kunst(C_Item)
{
	name = "Mocné umění";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Mocné umění";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseMachtvolle_Kunst;
};

func void UseMachtvolle_Kunst()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mocné umění");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Práce pro ty, kteří byli vzděláni v tajemném umění");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Schopnost mága ovládat boží sílu vzrůstá. Nejprve je podobná semínku zasetému v poli. Musí se o něj pečovat, jinak přijde vniveč. Jakmile však začne růst, jeho krása se rozvine.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Každým dnem pokračuje v růstu. Je to stejné jako s vnímavým mágem. Zpočátku jsou jeho síly možná chabé, ale jak v průběhu času roste a vyzrává, vzrůstají jeho síly, jejichž hranice jsou nepředvídatelné. Svatou povinností každého mága je dovést své síly až k tomuto bodu dokonalosti, pro semínko zasetého bohy je to ten největší dar, jaký může smrtelník přijmout.");
	Doc_Show(nDocID);
	if((BOOK_MACHTVOLLE_KUNST == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_MACHTVOLLE_KUNST = TRUE;
	};
};

instance Elementare_Arcanei(C_Item)
{
	name = "Základní tajemné umění";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Základní tajemné umění";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseElementare_Arcanei;
};

func void UseElementare_Arcanei()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Zákl. tajemné umění");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Místo magie v pozemském společenství");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vztahu magie a živlů bylo věnováno mnoho výzkumného úsilí. Lze prohlásit, že magie představuje dokonalý živel. Je to síla, která veškeré živly dokáže transformovat a tvarovat, což znamená, že je jim nadřízená. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Každý živel, je-li viděn ve své nejryzejší formě, v sobě nese spojení s magií. Přirozená spojení tohoto druhu lze nalézt jen na nemnohých místech,  která jsou také náruživě vyhledávána. Schopnost mága tyto síly zdánlivě z ničeho vyvolávat dokazuje, že moc magie je to nejčistší a největší dobro vůbec.");
	Doc_Show(nDocID);
	if((BOOK_ELEMENTARE_ARCANEI == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_ELEMENTARE_ARCANEI = TRUE;
	};
};

instance Wahre_Macht(C_Item)
{
	name = "Ryzí síla";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Ryzí síla";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseWahre_Macht;
};

func void UseWahre_Macht()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ryzí síla");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Svatá povinnost dovednosti");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Existuje síla, kterou se mág odlišuje od svých bližních. Protože je vybaven schopností ovlivňovat božskou moc, je narozdíl od smrtelníků nezávislý na přírodních zákonech.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jakmile mág dosáhne úrovně, která mu umožní povznést se nad svoji existenci, vystoupí do vyšších sfér, než v jakých žijí prostí smrtelníci. Může prolomit hranice času a prostoru, a dokonce ani smrt, soumrak žití, jej nedokáže zastavit.");
	Doc_Show(nDocID);
	if((BOOK_WAHRE_MACHT == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_WAHRE_MACHT = TRUE;
	};
};

instance Das_magische_Erz(C_Item)
{
	name = "Magická ruda";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Magická ruda";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseDas_magische_Erz;
};

func void UseDas_magische_Erz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Magická ruda");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nejlepší ruda používaná k výrobě zbraní se bez pochyb nachází v dolech Khorinisu. Ocel z ní je naprosto čistá a prostoupená magií. Její pevnost nesnese srovnání a přitom je hladká, nelze ji zlomit. Zbraně ukované z této oceli, která se s nepopsatelným úsilím těží z hlubin země, nelze  s žádnou jinou čepelí vůbec srovnávat, byť by byla zhotovena z té nejpevnější oceli.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Prolomí každý štít a projde skrz každé brnění. Králové a bohatýři nosili zbraně ukované z té nejlepší  oceli z Khorinisu a v Myrtaně se za takovéto zbraně doposud platí vysoké částky. Jen sama ruda představuje velkou hodnotu. Vylámat ji ze skály stojí obrovské úsilí.");
	Doc_Show(nDocID);
	if((BOOK_DAS_MAGISCHE_ERZ == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_DAS_MAGISCHE_ERZ = TRUE;
	};
};

instance Schlacht_um_Varant1(C_Item)
{
	name = "Bitva o Varant";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Bitva o Varant";
	text[0] = "Svazek 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchlacht_um_Varant1;
};

func void UseSchlacht_um_Varant1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...avšak Rhobar, stratég, volí útok. Sešikoval svá vojska a velel jim zaútočit na slabé pravé křídlo nepřítele. Neztrácel čas v dlouhých šarvátkách, ale pronikl armádou nepřítele jako meč a jeho obranu rozdrtil, jako by byla domečkem z karet. Hnal svoji armádu a postupoval k hranicím Varantu. Věděl, že zvítězit v tomto boji znamená rozprášit protivníkovu armádu a zabránit, aby se Gellon a Lukkor");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"sjednotili a zasadili mu drtivý úder. Aby zajistil své vítězství, musel přerušit své zásobovací kanály...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...Gellon padl, jeho armáda byla poražena a vojáci bez velitele se dali na útěk. Rhobar však nehodlal nepříteli dát šanci, aby se znovu dal dohromady, a proto dal svým vojskům rozkaz, aby zničila zbytky nepřátelských sil. Lukkor mezitím využil okamžiku překvapení a zasadil vyčerpaným vojákům krále Rhobara rozhodující ránu...");
	Doc_Show(nDocID);
	if((BOOK_SCHLACHT_UM_VARANT1 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_SCHLACHT_UM_VARANT1 = TRUE;
	};
};

instance Schlacht_um_Varant2(C_Item)
{
	name = "Bitva o Varant";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Bitva o Varant";
	text[0] = "Svazek 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchlacht_um_Varant2;
};

func void UseSchlacht_um_Varant2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Válka byla rozhodnuta. Varant ztratil zámořské přístavy, životně důležité pro vlastní armádu. Král Rhobar na válečném poli příliš dlouho neotálel, ale opustil své generály, aby uzavřel smlouvu s nepočetnými nepřátelskými vojáky. Varantu zbyla jen jedna velká divize, jíž velel Lukkor, který již nejednou zvrátil jistou porážku ve vítězství. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Nyní však byla jeho armáda v obklíčení. Situace byla beznadějná, třebaže početně mnohokrát převyšoval nepřítele. Do této pasti jej vlákal Lee, válečný hrdina z Myrtany. Těžká jízda nebyla schopna bojovat na nepevné bažinaté půdě úzkého údolí. Leeovi vojáci obsadili úbočí kopců sousedících s bažinami a opakovanými výpady decimovali Lukkorovu armádu. Zoufalé pokusy jeho jednotek končily zakrátko v tratolišti krve. Byl poražen.");
	Doc_Show(nDocID);
	if((BOOK_SCHLACHT_UM_VARANT2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_SCHLACHT_UM_VARANT2 = TRUE;
	};
};

instance Myrtanas_Lyrik(C_Item)
{
	name = "Myrtanská poezie";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Myrtanská poezie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseMyrtanas_Lyrik;
};

func void UseMyrtanas_Lyrik()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"       Píseň");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"               pokání");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Na počátku byla síla, ryzí a neposkvrněná,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"teď se nocí ozývají jen ozvěny slibů.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Říkají, že dny jednoty jsou již dávno tytam");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"a vzaly sebou to, po čem teď prahneme.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Veškerá jednota byla odvržena a pošlapána.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Proklet byl duch, kterého nám vzala. ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Touha je teď naší písní.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Za jednotu, která je navždy pryč.");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
	if((BOOK_MYRTANAS_LYRIK == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_MYRTANAS_LYRIK = TRUE;
	};
};

instance Lehren_der_Goetter1(C_Item)
{
	name = "Slovo boží Svazek 1";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Slovo boží";
	text[0] = "Svazek 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter1;
};

func void UseLehren_der_Goetter1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Slyš slovo boží, neboť je jeho vůlí, abys je slyšel. Dbej učení božího, neboť je jeho vůlí, abys na ně dbal. Cti božských kněží, neboť jsou oni vyvolenými.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Slovo Innosovo: Pokud ti nebude dáno pochopit, nezoufej nad řečí kněží, neboť oni jsou spravedliví a moudří. Protože já jsem vycházející slunce, vše, co se slunci protiví, protiví se též mně a bude zatraceno do věčných temnot.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Slovo Adanovo: Pracuj a žij, neboť den byl stvořen k tomu, aby člověk mohl pracovat. Uč se a poznávej, abys vše mohl předávat dále, neboť toto byl důvod, pro který jsi byl stvořen. Ten, jenž bude netečný a zahálčivý, bude zatracen do věčných temnot.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Slovo Beliarovo: Kdokolivěk se dopustí něčeho zlého a postaví se proti vůli boží, toho ztrestám. Na jeho tělo pošlu útrapy, jež jej usouží k smrti, jeho duše však zůstane se mnou ve věčných temnotách.");
	Doc_Show(nDocID);
	if((BOOK_LEHREN_DER_GOETTER1 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_LEHREN_DER_GOETTER1 = TRUE;
	};
};

instance Lehren_der_Goetter2(C_Item)
{
	name = "Slovo boží Svazek 2";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Slovo boží";
	text[0] = "Svazek 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter2;
};

func void UseLehren_der_Goetter2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Na úsvitu dějin: Nebylo noci ani dne, žádné živé bytosti, jenž by se pohybovala po zemi. Tu se zjevil Innos a jeho Světlo zazářilo v ústrety světa. A Innos dal světu dar života. Žádná bytost však nemohla v záři Innosově žít, a tak stvořil Slunce. Avšak i toto světlo bylo stále příliš prudké. Proto se Innos rozdělil ve dví a stvořil Beliara. Beliar stvořil noc. Od té doby může člověk žít. A pak se Innos znovu rozdělil a stvořil Adanose. Adanos přinesl člověku přizpůsobivost, učenost, zvídavost a odvahu. Innos byl se svým dílem spokojen.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Proto se rozhodl, že ponechá lidstvo na starosti Adanosovi a jal se odpočívat. Beliar byl však sžírán závistí, že lidé v noci spí a nemodlí se k němu. Jeho zlost vzrůstala, až stvořil nakonec muže. Muže, který  by se modlil jen k němu. Tento stvořený muž byl však stejný jako ostatní lidé. Beliar byl natolik bez sebe zlostí, že toho muže zahubil a pravil: Když už mě nebudou uctívat, nech ať mě aspoň nenávidí. A stvořil smrt, která končí lidské životy.");
	Doc_Show(nDocID);
	if((BOOK_LEHREN_DER_GOETTER2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_LEHREN_DER_GOETTER2 = TRUE;
	};
};

instance Lehren_der_Goetter3(C_Item)
{
	name = "Slovo boží Svazek 3";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Slovo boží";
	text[0] = "Svazek 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter3;
};

func void UseLehren_der_Goetter3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Innos dal lidstvu moc, skrze níž jej může slyšet a hovořit s ním. Dal lidstvu moc dělat zázraky a nazval je mágy. S touto silou pak lidé mohli utvářet svět ku svému obrazu. Innos je v tom nijak neomezil. A tak člověk dostal část boží moci tvořit. Ne všichni lidé si však byli rovni a to je znepokojovalo. Tak Innos sloučil moc z toho, co bylo rozděleno. Vyvolil několik z těch, kteří mu prokazovali více úcty než ostatní a ty ustanovil nade všemi.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Těch několik se stalo uctívanými a váženými a lidé jim říkali kněží. Ale i mezi nimi byli mnozí, kteří byli nespokojení. A tak se stalo, že se začali modlit k Adanosovi a zapomněli na svůj původ. Kněžská jednota se tak rozdělila. Následovaly války a víra v lidskou všemohoucnost se stala mýtem. A tehdy se kněží začali dělit. Ti, kteří následovali Adanose, se nazývali mágy Kruhu vody, zatímco kněží věrní Innosovi vešli do podvědomí jako mágové Kruhu ohně.");
	Doc_Show(nDocID);
	if((BOOK_LEHREN_DER_GOETTER3 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_LEHREN_DER_GOETTER3 = TRUE;
	};
};

instance Jagd_und_Beute(C_Item)
{
	name = "Lov a kořist";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lov a kořist";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseJagd_und_Beute;
};

func void UseJagd_und_Beute()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jeho dílo přečkalo věky a jeho rady jsou považovány za knihou nauky o umění lovu. Po krutých bojích na severu dokáže každý venkovan zacházet s lukem a šípy. Jsou zde však pravidla, která je třeba dodržovat, protože lov je mnohem víc, než pouhá znalost používání zbraně! Zvěř je plachá a nevypočitatelná. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Umění lovu lukem není jen stará tradice, ale nejrozšířenější způsob lovu. Vývoj techniky této tradiční metody se v průběhu tisíciletí výrazně změnil, není však pravděpodobné, že by se v budoucnosti ještě vyvíjel. Jaké okolnosti tedy doopravdy rozhodují o lovu lukem a šípy? Rozpoznat tato pravidla je skutečným uměním lukostřelby.");
	Doc_Show(nDocID);
	if((BOOK_JAGD_UND_BEUTE == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_JAGD_UND_BEUTE = TRUE;
	};
};

instance Kampfkunst(C_Item)
{
	name = "Umění boje";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Umění boje";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseKampfkunst;
};

func void UseKampfkunst()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Po 2000 let určovalo učení tohoto znalce vývoj umění boje.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Obratnost, soustředění, rychlost, postřeh a reakce jsou vlastnosti, které je třeba cvičit. Tvé pohyby musí být správně koordinovány a postoj bezchybný, pokud chceš své síly využít.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Podstata mistrova učení o duchovním a fyzickém rozvoji setrvává v platnosti po mnoho let.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jeho jedinečná úspěšnost ovlivňuje generace. Po tisíciletí se svět ubíral kupředu a měnil, avšak soulad vnitřních sil s pohybem těla zůstává v platnosti dál.");
	Doc_Show(nDocID);
	if((BOOK_KAMPFKUNST == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_KAMPFKUNST = TRUE;
	};
};

instance Die_Gruft(C_Item)
{
	name = "Krypta";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Krypta";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Astronomie(C_Item)
{
	name = "Astronomie";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Astronomie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseAstronomie;
};

func void UseAstronomie()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ve středu se rozkládá Morgrad, jenž se sestává ze čtyř živlů - země, vody, ohně a vzduchu. Je to místo pomíjivosti, srdce nepopsatelné temnoty Beliarovy. Nad tím vším se vypíná nebeská klenba.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"V řádu tohoto vesmíru je člověk příjemcem. Jeho duše mu umožňuje stát se součástí nejvyšší formy bytí, božího ducha. Jen lidské tělo se skládá z hmoty Morgradu. Je zrcadlem světa samého.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Synodická doba oběhu planet, což je dráha mezi dvěma  identickými polohami oběžnice vzhledem k Morgradu čtyř světů, se každým stoletím o několik stupňů mění. Z toho usuzujeme, že se neustále pohybujeme spolu se zbytkem vesmíru.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Když jsme vytvořili první kalendář, pozorovali jsme dráhu Měsíce, abychom mohli určit délku slunečního roku.");
	Doc_Show(nDocID);
	if((BOOK_ASTRONOMIE == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_ASTRONOMIE = TRUE;
	};
};

instance Rezepturen(C_Item)
{
	name = "Recepty";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Recepty";
	text[0] = "Svazek 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseRezepturen;
};

func void UseRezepturen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Balzám vidin");
	Doc_PrintLine(nDocID,0,"----------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Potři oči nemocného žlučí. Tento výměšek je hořké chuti. Styk této hořké látky s okem přinutí nemocného, aby prohlédnul, což jej učiní moudrým. Naučí se dívat! Hořkost a rozum jsou vzájemně výlučné opaky. Jsou si však navzájem protějšky! ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Zármutek, utrpení a zklamání jsou hořké, ale rozum je utěšujícím prostředkem na každý druh bolesti. Hořkost a rozum jsou alternativy. Kde je hořkost, není místo pro rozum a kde je rozum, tam není hořkost.");
	Doc_Show(nDocID);
	if((BOOK_REZEPTUREN == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_REZEPTUREN = TRUE;
	};
};

instance Rezepturen2(C_Item)
{
	name = "Recepty";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Recepty";
	text[0] = "Svazek 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseRezepturen2;
};

func void UseRezepturen2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Víno zapomnění");
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nejlepší vinná réva se nachází vysoko ve svazích Archolosu. Umění nechat toto víno dozrát do dokonalosti spočívá v tom, že se nesmí vystavovat žádnému pohybu. Hrozny se před vinnými sklípky mísí s plevelnou bylinou syos.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Pozoruj a obdivuj se tomu, jak mistr mění čirou vodu ze studánky ve víno. Lidé mu za ně platí a radují se z jeho daru. Své líné učně mistr trestá tím, že je zavírá do sudů. Oheň je zapálen a černí hadi vylézají.");
	Doc_Show(nDocID);
	if((BOOK_REZEPTUREN2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_REZEPTUREN2 = TRUE;
	};
};

instance TagebuchOT(C_Item)
{
	name = "Deníček";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Deníček";
	text[0] = "Stará potrhaná kniha.";
	text[1] = "Tady chybějí stránky.";
	on_state[0] = UseTagebuchOT;
};

func void UseTagebuchOT()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Den 23");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"Ztratil jsem pojem o čase.");
	Doc_PrintLines(nDocID,0,"Myslím, že je asi 23. den potom, co nás skřeti chytili a přinutili pracovat.");
	Doc_PrintLines(nDocID,0,"Práce je těžká a ti bastardi neznají slitování. Pokud jsi slabý, zahyneš!");
	Doc_PrintLines(nDocID,0,"Chci se odsud dostat, je mi jedno jak!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Den 28");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"Musíme prokopat štoly ještě hlouběji do hory.");
	Doc_PrintLines(nDocID,0,"Přední část je již zpevněná. Kdybych tak věděl, proč to děláme.");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Den 67");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"Zaslechl jsem, že ti skřetí kněží nemají srdce. Jestli je tomu tak, jak to že ještě žijí?");
	Doc_PrintLines(nDocID,1,"Dnes jsme zahlédl meč, kterého se kněží tak bojí. Získat jej tak, proklál bych jím jejich těla.");
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Den 78");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"Meč leží v místnosti v přední části chrámu, ale střeží jej jeden kněz.");
	Doc_PrintLines(nDocID,1,"Chystám se uprchnout. Svůj deník nechám tady, snad bude jednou někomu užitečný.");
	Doc_Show(nDocID);
};

instance ItWr_Bloodfly_01(C_Item)
{
	name = "Krvavé mouchy";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Krvavé mouchy";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Bloodfly_01;
};

func void UseItWr_Bloodfly_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Krvavé mouchy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"O mouchách");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Krvavé mouchy se shromažďují jen na místech, kde je půda bažinatá, vzduch vlhký ,a kde jsou vábeny potem veškerých bytostí. Svá žihadla používají k usmrcení svých obětí, na jejichž krvi pak hodují.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Získat takové žihadlo je uměním mnoha lovců z bažin. Provedou do břicha bytosti hluboký řez, potom vedou klikatý řez kolem žihadla, které opatrně vyjmou společně s tkání, která je obklopuje. Nechají skapat krev a oříznou nepoživatelné maso.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((Knows_GetBFSting == FALSE) && (KNOWS_GETBFFLY == FALSE))
	{
		Knows_GetBFSting = TRUE;
		KNOWS_GETBFFLY = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Jak vyjmout žihadlo - krvavé mouchy");
		PrintScreen("Naučil ses: Vyjmout žihadlo",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		//BUG: zbytocny dvojity vypis textu UseItWr_Bloodfly_01
		//B_LogEntry(GE_AnimalTrophies,"Jak vyjmout žihadlo - krvavé mouchy");
		//PrintScreen("Naučil ses: Vyjmout žihadlo",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

var int salmsnotiz;
var int dobraksnotiz;
var int pelensnotiz;
var int mascosnotiz;
var int janosnotiz;
var int allenotizen;

instance ITWR_SALMSNOTIZ(C_Item)
{
	name = "Zpráva od Salma";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usesalmsnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usesalmsnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bylo hloupé předpokládat, že to bude snadný úkol. Ale odměna byla opravdu lákavá. Teď jsem tu uvězněn pod náhorní plošinou, obklopen hordou Břitev. Noc pomalu padá. Pokud budu mít štěstí, proklouznu kolem až usnou. Musím být opatrný.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Salm");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Co potřebuju k útěku?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moje část skládanky:");
	Doc_PrintLine(nDocID,0,"R");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(SALMSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"Našel jsem poznámku od Salma poblíž potopené věže. Napsal, že má práci, a že ho čeká odměna. Pod zprávou bylo napsáno písmeno R.");
		SALMSNOTIZ = TRUE;
	};
};

instance ITWR_DOBRAKSNOTIZ(C_Item)
{
	name = "Zpráva od Dobraka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedobraksnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usedobraksnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Sakra, zůstal jsem odříznutý v trupu lodi. Slyším, jak se venku plíží ještěrky. Musím něco vymyslet. Zajímalo by mě, jestli ostatní něco našli. Ale co je teď důležitější, jak se odsud dostanu, aniž by mě sežrali?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Dobrak");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kde žijí a umírají bažinní žraloci?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moje část skládanky:");
	Doc_PrintLine(nDocID,0,"G");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(DOBRAKSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"Nedaleko rozlomené lodi jsem našel vzkaz od Dobraka. Jeho skupina se zjevně rozdělila, protože ve své zprávě zmiňuje další. Pod zprávou bylo napsáno písmeno G.");
		DOBRAKSNOTIZ = TRUE;
	};
};

instance ITWR_PELENSNOTIZ(C_Item)
{
	name = "Zpráva od Pelena";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usepelensnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usepelensnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Trčím v bažinách a přemýšlím, proč vlastně? Nenašel jsem tu nic, ani náznak. Ani se nemusím ptát sektářů, co si tu před několika týdny začali stavět svůj tábor. Pravděpodobně o ničem neví. Bažinní žraloci se v posledních několika hodinách nebezpečně přiblížili. Měl bych odtud rychle zmizet.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Pelen");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kde najdu zotročenou");
	Doc_PrintLine(nDocID,0,"a navždy zatracenou duši?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moje část skládanky:");
	Doc_PrintLine(nDocID,0,"O");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(PELENSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"V bažině poblíž tábora Bratrstva jsem našel vzkaz od Pelena. Cokoliv hledal, nenašel to. Pravděpodobně ho zabili bažinní žraloci. Pod zprávou bylo napsáno písmeno O.");
		PELENSNOTIZ = TRUE;
	};
};

instance ITWR_MASCOSNOTIZ(C_Item)
{
	name = "Zpráva od Masca";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usemascosnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usemascosnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Šel jsem dolů do krypty a pokusil se bojovat s těmi nemrtvými parchanty. Byl to pitomý nápad. Jeden mě nepěkně podrápal. Stáhl jsem se do této jeskyně, krátce si odpočinu a pokusím se vyléčit rány. Cítím se divně. Musím se trochu vyspat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Masco");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kde najdu ten nejlepší");
	Doc_PrintLine(nDocID,0,"výhled na Kolonii?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moje část skládanky:");
	Doc_PrintLine(nDocID,0,"D");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(MASCOSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"V jeskyni poblíž krypty jsem našel Masca. Šel dolů do krypty kde ho zranil jeden z nemrtvých. Pak se sám proměnil v zombie. Pod zprávou bylo napsáno písmeno D.");
		MASCOSNOTIZ = TRUE;
	};
};

instance ITWR_JANOSNOTIZ(C_Item)
{
	name = "Zpráva od Jana";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usejanosnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usejanosnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Došel jsem ke staré pevnosti, mám dojem, že tu nic nenajdu. Všechno tady vypadá tak prázdné a opuštěné. Nahoře je na mě příliš ticho. Myslím, že nebyl dobrý nápad se rozdělit. Měli jsme hledat společně. Kde jsou teď Salm, Pelen, Masco a Dobrak?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jano");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kam se budu muset ponořit");
	Doc_PrintLine(nDocID,0,"abych se dostal k poznání?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moje část skládanky:");
	Doc_PrintLine(nDocID,0,"A");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(JANOSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"V horách na staré pevnosti jsem našel dopis od Jana. Se svou skupinou něco hledali, podle vypadá to, že se rozdělili. Pod zprávou bylo napsáno písmeno A.");
		JANOSNOTIZ = TRUE;
	};
};

instance ITWR_DIRTYNOTIZ1(C_Item)
{
	name = "Špinavá poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usedirtynotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Hotovo. Vypadá to, že si nikdo ze strážců nevšiml, že jsem utekl. Zatímco ostatní odsouzení mohou pokračovat v práci v dolech, já jsem svobodný muž. Něco se tu však děje. Před časem na hrad přišlo několik mágů. Myslím, že něco plánují.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Teď ale musím co nejdříve");
	Doc_PrintLine(nDocID,0,"vyjít z tohoto zatraceného údolí");
	Doc_PrintLine(nDocID,0,"jinak bylo všechno zbytečné.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_DIRTYNOTIZ2(C_Item)
{
	name = "Roztrhaný kus papíru";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz2;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usedirtynotiz2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"To bylo těsné. Plaval jsem kousek po řece, když jsem narazil na konvoj složený ze strážců a bandy odsouzených. Ubožácí jsou pravděpodobně další, co se budou dřít pro krále v dolech. Jsem si jistý, že mě jeden z nich viděl. Nic ale neřekl. Mezi námi vězni vždy existovala jakási soudržnost.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Několik dní se plížim za jedním z mágů. Nese modrý kámen. Vypadá cenně. Zdá se, že si to namířil směrem k moři.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Půjdu za ním. Brzy se tu něco semele, cejtím to v kostech.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_DIRTYNOTIZ3(C_Item)
{
	name = "Vybledlá poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz3;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usedirtynotiz3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Neuvěřitelné! Mág okouzlil modrý kámen a najednou údolím prošel obrovský modrý pahorek. Nevypadá to, že to plánovál. Vypadal stejně šokovaně jako já.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Co mám teď dělat?! Nevím, jestli můžu projít touto bariérou. Zdá se, že celé údolí je nyní jedním velkým vězením.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Takže všechno bylo zbytečné. Já to nevzdám. Jdu dál, možná nakonec najdu cestu odsud. Ano, určitě. MUSÍ existovat cesta odtud.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_DIRTYNOTIZ4(C_Item)
{
	name = "Stará poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz4;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usedirtynotiz4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tak se to stalo! Odsouzenci se vzbouřili strážcům a uvnitř hradu se bojuje. Dobře, že jsem utekl ještě než se to semlelo. Teď jdu do průsmyku a uvidím, jestli odtud vypadnu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pokud čteš tyto slova, tak jsi našel mou mrtvolu, řeknu na konci ještě jednu věc. Ani se nepokoušej odtud vypadnout. Snažil jsem se a vidíš, co se stalo. Zmiř se tedy s tím, že odtud už nikdy neodejdeš.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Odsouzenec usilující o svobodu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_BUDDLERNOTIZ(C_Item)
{
	name = "Načmáraná zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usebuddlernotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};

func void usebuddlernotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"152. Den");
	Doc_PrintLines(nDocID,0,"Zatracené dveře jsou blokovány a my jsme zaseknutí v této jeskyni. O amuletu se šířily pověsti, vypadá to, že pravdivé. Od té doby, co jsem ho vzal, se cítím divně. Zamkl jsem ho do truhly. Přesto ... jsem si jistý, že jsem včera v noci zaslechl šeptající hlas. Doufám, že jsem si to jen představoval.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"154. Den");
	Doc_PrintLines(nDocID,0,"Mvluí se mnuo už 2 noci. Řkel jsem to osattním, ale nveěří mi. Nadířil mi je zbaít. Ne. Ne. Porč si to nmesylíš? Chci jen pomoci, ale nenechám tě pomoci. Halzs v mé halvě. Šílsnetví.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"155. Den");
	Doc_PrintLines(nDocID,0,"hluchý. snadný fiefdsfk. vice br ahct. grnjvfs. smát se ... fdsfd. smích. fdsge. Ne. více. fdsfoema. žádný smích. více. Hluchý. mrtvý. fdsggsd. mrtvý. grgfsdfegr. ge fre Fassf ssen. fdsifksd. sama. gnsjgdf. hu ng poprava. fdsgd. přátelé. že. fesd.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

