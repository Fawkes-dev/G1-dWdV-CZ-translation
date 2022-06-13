instance ItWrFocusmapPsi(C_Item)
{
	name = "Y´Berionova mapa ohnisek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseFocusmapPsi;
	description = name;
	text[1] = "Tato mapa značí cestu k ohniskovému";
	text[2] = "kameni, která Y´Berion potřebuje";
	text[3] = "k Vzývání Spáče.";
};

func void UseFocusmapPsi()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_FocusPSI.tga",1);
	Doc_Show(nDocID);
};

instance Focus_1(C_Item)
{
	name = "Ohnisko z mořských útesů";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Jeden z pěti ohniskových kamenů,";
	text[2] = "které byly použity k vytvoření magické Bariéry.";
};

instance ItMi_Stuff_Gearwheel_01(C_Item)
{
	name = "Ozubené kolo!";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Gearwheel_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Je z rozbité drtičky rudy, která";
	text[1] = "zůstala v opuštěné postranní chodbě";
	text[2] = "Starého dolu.";
};

instance ItAt_Crawlerqueen(C_Item)
{
	name = "Vajíčko Důlního červů";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItAt_Crawlerqueen.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Tato vajíčka snesla královna";
	text[1] = "Důlních červů.";
	text[2] = "Obsahují daleko silnější výtažek než";
	text[3] = "obyčejné čelisti Důlních červů.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrFokusbuch(C_Item)
{
	name = "Almanach";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseItWrFokusbuch;
	description = name;
	text[0] = "V této prastaré knize je pár";
	text[1] = "kouzelných zaříkadel, která se vztahují";
	text[2] = "k použití takzvaných ohniskových kamenů.";
};

func void UseItWrFokusbuch()
{
	var int nDocID;
	if((BOOK_ALMANACH == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_ALMANACH = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Kapitola 23");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"Koncentrace sil");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Síla zakletá v kameni neustále narůstá a uvolní se prostřednictvím kouzelnického zaříkadla. Jestli bude její účinek trvalý či okamžitý, to záleží na vlastním rozvážení. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jakmile se jednou síla uvolní, ohniskový kámen je zproštěn veškeré síly a není ničím než prázdnou skořápkou.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Slova, která musí být pro uvolnění síly z ohniska pronesena, jsou známa mnohým znalcům tajemných sil. Dokonce i schopnost vybavit nový artefakt kouzelnou mocí se již stalo spíše běžnou kouzelnickou praxí než tajnou vědou.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Avšak jen nemnozí mají znalosti, kterých je třeba k obnově síly použitého ohniskového kamene. Tento magický svitek starých dob je znamením těch největších schopností.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"A nyní, ty, jenž jsi vyvolený, otevři svoji mysl těm slovům pradávné moci.");
	Doc_Show(nDocID);
};

