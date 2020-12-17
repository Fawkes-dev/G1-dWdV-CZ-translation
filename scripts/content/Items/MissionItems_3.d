instance OrkParchmentOne(C_Item)
{
	name = "Půlka pergamenu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 3;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Část starého pergamenu.";
	text[1] = "Vypadá to, jako by spodní část byla utržena.";
	text[2] = "Nápis se podobá runám";
	text[3] = "na stěnách jeskyně.";
};

instance OrkParchmentTwo(C_Item)
{
	name = "Půlka pergamenu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 3;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Část starého pergamenu.";
	text[1] = "Vypadá to, jako by horní část byla utržena.";
	text[2] = "Nápis se podobá runám";
	text[3] = "na stěnách jeskyně.";
};

instance ITKE_PSI_KALOM_01(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = "Klíč od dílny";
	text[0] = "Otevře truhlici v alchymistické dílně";
	text[1] = "v Táboře v bažinách.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrFocimap(C_Item)
{
	name = "Saturasova mapa ohniskových kamenů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseFocimap;
	description = name;
	text[0] = "Cípy pentagramu";
	text[1] = "prozrazují umístění všech pěti";
	text[2] = "ohniskových kamenů, které byly použity k ";
	text[3] = "vytvoření magické Bariéry. Mapa je však ";
	text[4] = "už stará a kameny mohly být zatím ";
	text[5] = "přemístěny z původních míst jinam.";
};

func void UseFocimap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_Foki.tga",1);
	Doc_Show(nDocID);
};

instance ItWr_Troll_01(C_Item)
{
	name = "List z deníku";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTroll;
	description = name;
	text[1] = "Velmi omšelá stránka a písmo v ní";
	text[2] = "lze jen těžko rozeznat.";
	text[3] = "Ten, komu deník patřil, byl zřejmě";
	text[4] = "lovec trolů.";
};

func void UseTroll()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"Den 169");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dnes to udělám. Vím to. Bohové budou stát při mně. Zkoušel jsem už vše, abych zabil trola. Nepomohl ani ten nejpevnější meč a šípy se odrážely od jeho kůže, jako by byla z kamene.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ještě zkusím použít magický svitek, který mi prodal obchodník v Khorinisu. Stál sice 50 nugetů, ale se ziskem, který mi tato kořist přinese, budu boháč.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dnes zabiju trola.");
	Doc_Show(nDocID);
};

instance Focus_2(C_Item)
{
	name = "Ohnisko z Trolího kaňonu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Jeden z pěti ohniskových kamenů, které ";
	text[2] = "byly použity k vytvoření magické Bariéry.";
};

instance ItKe_BERG_01(C_Item)
{
	name = "Klíč od truhlice";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Stará horská pevnost.";
	text[1] = "Starý rezavý klíč od truhlice.";
	text[2] = "patřil k jedné truhlici";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Urkunde_01(C_Item)
{
	name = "Listina";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseUrkunde;
	description = "Držitel listiny";
	text[0] = "Opravňuje držitele k nároku na";
	text[1] = "na území horské pevnosti.";
	text[2] = "platná k provedení.";
	text[5] = "Cena                                  400 liber rudy";
};

func void UseUrkunde()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"Listina");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Já, Bergmar, purkrabí Západních polí a předsedající soudce zemí mého pána Tymorisina, oblastí přiléhajícím ke Khorinisu, ... prohlašuji tímto... že já ... podstupuji a prodávám držiteli této listiny... a rodu Innosovu léno horské pevnosti (spolu s další desetinou mého vlastnictví, jenž je její součástí) za 400 liber rudy.");
	Doc_Show(nDocID);
};

instance Fakescroll(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Focus_3(C_Item)
{
	name = "Ohniskový kámen z horské pevnosti";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Jeden z pěti ohniskových kamenů, které ";
	text[2] = "byly použity k vytvoření magické Bariéry.";
};

instance ItKe_Focus4(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Tento klíč pochází z jeskyně v ";
	text[2] = "rozvalinách kláštera.";
};

instance Focus_4(C_Item)
{
	name = "Ohniskový kámen z rozvalin kláštera";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Jeden z pěti ohniskových kamenů, které ";
	text[2] = "byly použity k vytvoření magické Bariéry.";
};

instance ItMi_OrcTalisman(C_Item)
{
	name = "Skřetí talisman";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Amulet_UluMulu_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_OrcTalisman;
	on_unequip = UnEquip_OrcTalisman;
	description = name;
	text[2] = NAME_Prot_Fire;
	count[2] = 20;
	text[5] = NAME_Value;
	count[5] = value;
};

func void Equip_OrcTalisman()
{
	self.protection[PROT_FIRE] += 20;
};

func void UnEquip_OrcTalisman()
{
	self.protection[PROT_FIRE] -= 20;
};

instance ItKe_Focus5(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Tento klíč je z krypty";
	text[2] = "pod kamenným kruhem.";
};

instance Focus_5(C_Item)
{
	name = "Ohniskový kámen zpod kamenného kruhu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Jeden z pěti ohniskových kamenů, které ";
	text[2] = "byly použity k vytvoření magické Bariéry.";
};

instance ORE_BANDITS_MESSAGE(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useore_bandits_message;
	description = name;
	text[0] = "Patřila loupežníkovi u řeky.";
	text[1] = "";
};

func void useore_bandits_message()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zásilku rudy jsem nechal v jeskyni po řece. Teď se tam nemůžu dostat, protože se tam uhnízdil Číhavec. Budu muset počkat, až se vyplíží ven. Jsou to tuhé potvory měl bych si sehnad lepší zbraň.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"PS: Jestli někdo najde tento dopis, držte ruce pryč od mé rudy. Jinak si tě najdu a dostanu své věci zpět!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ORE_BANDITS_MESSAGE2(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useore_bandits_message2;
	description = name;
	text[0] = "Patřila loupežníkovi v rokli.";
	text[1] = "";
};

func void useore_bandits_message2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Utéct ze Starého tábora bylo správné rozhodnutí. Dva z nás šli do tábora ve skřetí oblasti. Brzy půjdeme za nimi a pak si rudu rozdělíme.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ORE_BANDITS_MESSAGE3(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useore_bandits_message3;
	description = name;
	text[0] = "Patřila loupežníkovi na úskalí.";
	text[1] = "";
};

func void useore_bandits_message3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Rozdělili jsme se. Nevím jistě, kde jsou ostatní. Utábořili jsme se na úskalí nad jeskyní s černými gobliny. Dokázal jsem v noci proklouznout na horu a skrýt rudu v jeskyni mezi loveckými psi.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ORE_BANDITS_MESSAGE4(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useore_bandits_message4;
	description = name;
	text[0] = "Patřila loupežníkovi ze skřetího území.";
	text[1] = "";
};

func void useore_bandits_message4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nebyl špatný nápad ukrýt se na skřetím území. Žádný z Gomezových lidí se tu neodváží. S rudou budeme mít v Novém táboře spokojený život. Musíme ještě ale chvíli počkat až se situace uklidní. Gomezovy krysy se tak snadno nevzdávají.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

