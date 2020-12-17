func void uselehren_der_goetter1_bookstand()
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
};

