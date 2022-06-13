instance DIA_Snaf_Exit(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 999;
	condition = DIA_Snaf_Exit_Condition;
	information = DIA_Snaf_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Snaf_Exit_Condition()
{
	return 1;
};

func void DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Snaf_Hello(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Hello_Condition;
	information = DIA_Snaf_Hello_Info;
	permanent = 0;
	description = "Jak to jde?";
};

func int DIA_Snaf_Hello_Condition()
{
	return 1;
};

func void DIA_Snaf_Hello_Info()
{
	AI_Output(other,self,"DIA_Snaf_Hello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//Není to zlé. Když umíš dobře vařit, máš tady spoustu přátel.
	AI_Output(self,other,"DIA_Snaf_Hello_01_02");	//Nechceš nějaký z mých rýžových nákypů?
	AI_Output(other,self,"DIA_Snaf_Hello_15_03");	//Díky.
	AI_Output(self,other,"DIA_Snaf_Hello_01_04");	//Mohl bys pro mě udělat laskavost.
	CreateInvItem(self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

var int Snaf_Zutaten;
var int Snaf_FreeMBRagout;

instance DIA_Snaf_Zutaten(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Zutaten_Condition;
	information = DIA_Snaf_Zutaten_Info;
	permanent = 0;
	description = "Co pro tebe můžu udělat?";
};

func int DIA_Snaf_Zutaten_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

func void DIA_Snaf_Zutaten_Info()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00");	//Co bych měl udělat?
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01");	//Musíš být zvyklý na dobré jídlo. Mám nový recept: ragú ze žravých štěnic po zlodějsku s rýží a houbami.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02");	//Můžeš mít, kolik si jen vzpomeneš, ale budeš potřebovat: 3 žravé štěnice a pár pekelných hub - 5 by mělo stačit.
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice(DIA_Snaf_Zutaten,"Chceš, abych se pozvracel?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice(DIA_Snaf_Zutaten,"To zní dobře.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00");	//Chceš, abych se pozvracel?
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01");	//Nemusíš to sníst, ale mohl bys to aspoň zkusit! Jestli se ti podaří ty věci sehnat, vzpomeň si na mě.
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02");	//Už jsem někoho poslal, ale ještě se nevrátil - zřejmě zběhl do Nového tábora.
	Snaf_Zutaten = LOG_RUNNING;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Snaf, kuchař který žije na Vnějším okruhu, mě poslal, abych mu pro nový kuchařský recept opatřil 3 žravé štěnice a 5 pekelných hub.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00");	//To zní dobře.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01");	//Tak jdi a sežeň mi ty věci.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02");	//Poslední, kterého jsem poslal, se ještě nevrátil - zřejmě zběhl do Nového tábora.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Snaf, kuchař který žije na Vnějším okruhu, mě poslal, abych mu pro nový kuchařský recept opatřil 3 žravé štěnice a 5 pekelných hub.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

instance DIA_Snaf_ZutatenSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_ZutatenSuccess_Condition;
	information = DIA_Snaf_ZutatenSuccess_Info;
	permanent = 0;
	description = "Mám ty věci, co jsi po mně chtěl!";
};

func int DIA_Snaf_ZutatenSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_mushroom_01) >= 5) && (Npc_HasItems(other,ItAt_Meatbug_01) >= 3))
	{
		return 1;
	};
};

func void DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Mám ty věci, co jsi po mně chtěl!
	AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01");	//Výborně, musím je přidat, pak bude to ragú hotové... Počkej...
	CreateInvItems(other,ItFo_Plants_mushroom_01,3);
	B_GiveInvItems(other,self,ItFo_Plants_mushroom_01,5);
	Npc_RemoveInvItems(self,ItFo_Plants_mushroom_01,5);
	Npc_RemoveInvItems(other,ItAt_Meatbug_01,3);
	CreateInvItems(self,ItFoMeatbugragout,3);
	B_GiveInvItems(self,other,ItFoMeatbugragout,3);
	Snaf_Zutaten = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_SUCCESS);
	B_LogEntry(CH1_SnafsRecipe,"Snaf byl velmi spokojený, když jsem mu přinesl ty přísady.");
	if(Snaf_FreeMBRagout == TRUE)
	{
		B_LogEntry(CH1_SnafsRecipe,"Ode dneška mi bude každý den dávat ragú ze žravých štěnic.");
	};
	B_GiveXP(100);
	AI_StopProcessInfos(self);
};

var int Snaf_RagoutDay;

instance DIA_Snaf_AfterSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_AfterSuccess_Condition;
	information = DIA_Snaf_AfterSuccess_Info;
	permanent = 1;
	description = "Řekl jsi mi, že můžu mít tolik ragú, kolik budu chtít...";
};

func int DIA_Snaf_AfterSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_SUCCESS) && (Snaf_FreeMBRagout == TRUE))
	{
		return 1;
	};
};

func void DIA_Snaf_AfterSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00");	//Řekl jsi mi, že můžu mít tolik ragú, kolik budu chtít...
	if(Snaf_RagoutDay != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01");	//A to je pravda. Tady jsou tři porce.
		CreateInvItems(self,ItFoMeatbugragout,3);
		B_GiveInvItems(self,other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02");	//Jistě! Ale dnes nic nezbylo. Přijď zase zítra.
	};
};

instance DIA_Snaf_WhereMeatbugs(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = DIA_Snaf_WhereMeatbugs_Condition;
	information = DIA_Snaf_WhereMeatbugs_Info;
	permanent = 0;
	description = "Kde najdu žravé štěnice?";
};

func int DIA_Snaf_WhereMeatbugs_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00");	//Kde najdu žravé štěnice?
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01");	//Všude, kde se válí odpadky. Něco bys mohl najít u té opuštěné chatrče nedaleko hradní zdi.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02");	//Nedej se zmást jejich nevábným vzhledem. Jakmile se uvaří, jsou znamenité.
	B_LogEntry(CH1_SnafsRecipe,"Poblíž zpustlých chatrčí u hradních zdí se vyskytují žravé štěnice.");
};

instance DIA_Snaf_WhereMushrooms(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 4;
	condition = DIA_Snaf_WhereMushrooms_Condition;
	information = DIA_Snaf_WhereMushrooms_Info;
	permanent = 0;
	description = "Kde najdu houby?";
};

func int DIA_Snaf_WhereMushrooms_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMushrooms_15_00");	//Kde najdu houby?
	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01");	//Když projdeš jižní branou - to je ta zhroucená věž - uvidíš přímo před sebou pláň. Tam rostou houby.
	B_LogEntry(CH1_SnafsRecipe,"Pekelné houby najdu na planině před zřícenou věží jižní brány.");
};

instance DIA_Snaf_WhereNek(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 5;
	condition = DIA_Snaf_WhereNek_Condition;
	information = DIA_Snaf_WhereNek_Info;
	permanent = 0;
	description = "Kdo byl ten chlapík, kterého jsi poslal přede mnou?";
};

func int DIA_Snaf_WhereNek_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereNek_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00");	//Kdo byl ten chlapík, kterého jsi poslal přede mnou?
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01");	//Jmenoval se Nek. Byl tady hrozně nespokojený - myslím, že je teď v Novém táboře.
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02");	//Poslal jsem ho nasbírat houby - ale už se nevrátil zpátky...
	if((Sly_LostNek != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
		Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
	};
	B_LogEntry(CH1_LostNek,"Kuchař Snaf viděl Neka naposledy, když odešel sbírat houby.");
};

instance DIA_SNAF_TEACH(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 5;
	condition = dia_snaf_teach_condition;
	information = dia_snaf_teach_info;
	permanent = 0;
	description = "Můžeš mě naučit něco o vaření?";
};

func int dia_snaf_teach_condition()
{
	if(Snaf_Zutaten == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_snaf_teach_info()
{
	AI_Output(other,self,"DIA_Snaf_teach_15_00");	//Můžeš mě naučit něco o vaření?
	AI_Output(self,other,"DIA_Snaf_teach_01_01");	//Naučím tě svůj recept na přípravu Ragů ze Žravých štěnic.
	AI_Output(self,other,"DIA_Snaf_teach_01_02");	//Přinejmenším jsi mi přinesl ingredience.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Kuchař Snaf ve Vnějším kruhu Starého tábora mě může naučit vařit.");
};

instance DIA_SNAF_LEARN(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = dia_snaf_learn_condition;
	information = dia_snaf_learn_info;
	permanent = 1;
	description = "Ragú ze žravých štěnic (cena: 1 VB)";
};

func int dia_snaf_learn_condition()
{
	if((Snaf_Zutaten == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_snaf_teach) && (KNOWS_MEATBUGRAGOUT == FALSE))
	{
		return 1;
	};
};

func void dia_snaf_learn_info()
{
	AI_Output(other,self,"DIA_Snaf_Learn_15_00");	//Nauč mě vařit Ragů ze Žravých štěnic.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Snaf_Learn_12_01");	//Začni tím, že dáš vařit vodu.
		AI_Output(self,other,"DIA_Snaf_Learn_12_02");	//Jakmile se začne vařit, vložíš do hrnce pekelné houby. Je důležité aby jsi směs pořád míchal.
		AI_Output(self,other,"DIA_Snaf_Learn_12_03");	//Po chvíli přidej maso Žravých štěnic. Musí být vždy přidáno do hrnce až po pekelných houbách, kdybys ho vařil příliš dlouho ztratilo by svou chuť.
		AI_Output(self,other,"DIA_Snaf_Learn_12_04");	//Až bude ragů hotovo poznáš to díky jeho vůni.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Umím uvařit: Ragů ze žravých štěnic.");
		B_LogEntry(GE_COOK,"Ingredience jsou: 2 kusy masa ze žravé štěnice a 4 pekelné houby.");
		KNOWS_MEATBUGRAGOUT = TRUE;
		PrintScreen("Naučil ses uvařit: Ragů ze žravých štěnic",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

