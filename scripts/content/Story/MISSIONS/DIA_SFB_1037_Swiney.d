instance Info_Swiney_EXIT(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 999;
	condition = Info_Swiney_EXIT_Condition;
	information = Info_Swiney_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Swiney_EXIT_Condition()
{
	return 1;
};

func void Info_Swiney_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Swiney_Hello(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_Hello_Condition;
	information = Info_Swiney_Hello_Info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int Info_Swiney_Hello_Condition()
{
	return 1;
};

func void Info_Swiney_Hello_Info()
{
	AI_Output(other,self,"Info_Swiney_Hello_15_00");	//Kdo jsi?
	AI_Output(self,other,"Info_Swiney_Hello_09_01");	//Jsem nejlepší důlní inženýr, kterého kdy tahle zpropadená kolonie spatřila, milej zlatej.
	AI_Output(self,other,"Info_Swiney_Hello_09_02");	//Jsem přesvědčený, že by se polovina našich chlapů nemusela nechat zabít padajícími kameny, kdyby nebyla tak stupidní a kopala na správných místech.
};

instance Info_Swiney_Schuerfer(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_Schuerfer_Condition;
	information = Info_Swiney_Schuerfer_Info;
	permanent = 0;
	description = "Chtěl bych se k vám přidat jako rudař!";
};

func int Info_Swiney_Schuerfer_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Hello) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Swiney_Schuerfer_Info()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_15_00");	//Chtěl bych se k vám přidat jako rudař!
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_01");	//Tak? Nemysli si ale, že tím získáš něco zvláštního. Obnáší to tři porce rýže denně a nic víc, co bys musel na vlastní oči vidět.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_02");	//Víš, proč to děláme? Děláme to proto, abysme odtud jednoho dne mohli odejít za svobodou.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_03");	//To znamená, že se všechna ruda vytěží a pak putuje na velkou rudnou haldu. A jednou za měsíc dostane každý, kdo tady pracoval, 50 nugetů, aby se mohl zpít do němoty.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_04");	//To je nejdůležitější věc, kterou bys měl vědět.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_05");	//Máš s touhle prací aspoň nějaké zkušenosti?
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice(Info_Swiney_Schuerfer,"Ne.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice(Info_Swiney_Schuerfer,"Ano.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//Ano.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_01");	//Dobrá! Pak víš, na co tu dávat pozor. Tady máš ochranný oděv. Musíš si obstarat svůj vlastní krumpáč. Hodně úspěchů!
	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_02");	//Tady jsou tvé první 3 porce rýže. Pořádně si je rozděl!
	hero.guild = GIL_SFB;
	CreateInvItem(other,sfb_armor_l);
	AI_EquipBestArmor(hero);
	Mdl_ApplyOverlayMds(hero,"Humans_Tired.mds");
	Log_CreateTopic(GE_BECOMESCHUERFER,LOG_NOTE);
	B_LogEntry(GE_BECOMESCHUERFER,"Swiney mě přijal mezi ostatní Rudaře. Každý den si u něj můžu vyzvednout 3 porce rýže.");
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	CreateInvItems(self,ItFoRice,3);
	B_GiveInvItems(self,other,ItFoRice,3);
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//Ne.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_01");	//Samozřejmě, že ne! Proč pořád já? Dobře, Poslouchej pozorně. Vezmeš tenhle materiál a položíš ho - sem.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_02");	//Když ti spadne magický nuget na nohu a ty přitom nebudeš na sobě mít ochranný oděv, budeš na doživotí mrzák a budeš mít pro nás jen poloviční hodnotu, než si měl předtím.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_03");	//Někde tady bude ležet krumpáč.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_04");	//Ale moc už toho nevydrží - co se dá dělat...
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_05");	//... mimochodem, tady jsou tvé první 3 porce rýže. Pamatuj, že jídlo dostaneš pouze jednou denně.
	hero.guild = GIL_SFB;
	CreateInvItem(other,sfb_armor_l);
	AI_EquipBestArmor(hero);
	Mdl_ApplyOverlayMds(hero,"Humans_Tired.mds");
	Log_CreateTopic(GE_BECOMESCHUERFER,LOG_NOTE);
	B_LogEntry(GE_BECOMESCHUERFER,"Swiney mě přijal mezi ostatní Rudaře. Každý den si u něj můžu vyzvednout 3 porce rýže.");
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	CreateInvItems(self,ItFoRice,3);
	B_GiveInvItems(self,other,ItFoRice,3);
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

instance Info_Swiney_PERM(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_PERM_Condition;
	information = Info_Swiney_PERM_Info;
	permanent = 1;
	description = "Kolik rudy jste už nahromadili?";
};

func int Info_Swiney_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Schuerfer))
	{
		return 1;
	};
};

func void Info_Swiney_PERM_Info()
{
	AI_Output(other,self,"Info_Swiney_PERM_15_00");	//Kolik rudy jste už nahromadili?
	AI_Output(self,other,"Info_Swiney_PERM_09_01");	//Mágové říkají, že už jí nebude tolik potřeba. Jdi do Nového tábora a prohlédni si haldu.
	AI_StopProcessInfos(self);
};

var int swiney_riceday;

instance DIA_SWINEY_DAILYRICE(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 3;
	condition = dia_swiney_dailyrice_condition;
	information = dia_swiney_dailyrice_info;
	permanent = 1;
	description = "Chci si vyzvednout denní dávku rýže.";
};

func int dia_swiney_dailyrice_condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Schuerfer) && (hero.guild == GIL_SFB))
	{
		return 1;
	};
};

func void dia_swiney_dailyrice_info()
{
	AI_Output(other,self,"DIA_Swiney_DailyRice_15_00");	//Chci si vyzvednout denní dávku rýže.
	if(SWINEY_RICEDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Swiney_DailyRice_05_01");	//Tady jsou tvé 3 porce rýže. Pořádně si ji rozděl, musí ti vydržet celý den!
		CreateInvItems(self,ItFoRice,3);
		B_GiveInvItems(self,other,ItFoRice,3);
		SWINEY_RICEDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Swiney_DailyRice_05_02");	//Už jsi dnes dostal rýži. Vrať se zítra anebo běž do tábora a něco si kup.
	};
};

