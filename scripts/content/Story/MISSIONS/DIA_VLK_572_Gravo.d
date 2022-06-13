instance DIA_Gravo_Exit(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 999;
	condition = DIA_Gravo_Exit_Condition;
	information = DIA_Gravo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Gravo_Exit_Condition()
{
	return 1;
};

func void DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gravo_Hallo(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_Hallo_Condition;
	information = DIA_Gravo_Hallo_Info;
	permanent = 0;
	description = "Jak to jde?";
};

func int DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func void DIA_Gravo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_01");	//Co jsem skončil s prací v dole, nemůžu si stěžovat.
	AI_Output(other,self,"DIA_Gravo_Hallo_15_02");	//A odkud teď bereš rudu?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_03");	//Pomáhám lidem, kteří mají problémy.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_04");	//Jestli se tu dostaneš do problémů s vlivnými lidmi, budu ti schopen nějak pomoci.
};

instance DIA_Gravo_HelpHow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpHow_Condition;
	information = DIA_Gravo_HelpHow_Info;
	permanent = 0;
	description = "Když budu v nesnázích, TY bys mi mohl pomoci? Jak?";
};

func int DIA_Gravo_HelpHow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpHow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00");	//Když budu v nesnázích, TY bys mi mohl pomoci? Jak?
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01");	//No, řekněme, že máš problém s Thorusem. Lepší bude, když se s ním do problému nikdy nedostaneš, ale jeden nikdy neví.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02");	//Thorus dokáže být pěkně neústupný - když se jednou na někoho naštve, už s ním nikdy nepromluví. A to je zlá věc.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03");	//Jako zelenáč jsi na něm závislý. Pak teda přijdeš za mnou. Znám tady řadu lidí, kterým Thorus naslouchá.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04");	//Ztratí u něj za tebe slovo a Thorus bude zase kamarád. Ti hoši však pochopitelně za tenhle druh laskavosti chtějí vidět nějakou rudu. Tvoji rudu.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05");	//A já se starám, aby se ta ruda dostala do správných rukou...
	B_LogEntry(GE_TraderOC,"Kopáč Gravo poskytuje zvláštní služby. Pokud se v táboře dostanu do konfliktu s důležitými lidmi, můžu mu zaplatit za to, že vše urovná.");
};

func void B_Gravo_HelpAttitude(var C_Npc prob)
{
	if(Npc_GetPermAttitude(prob,other) == ATT_ANGRY)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00");	//Pravda je, že jsi zapsaný v jeho špatných knihách.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01");	//Budu muset promluvit s pár lidma. 100 nugetů a já se o ten problém postarám.
		if(Npc_HasItems(other,ItMiNugget) >= 100)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02");	//Ukaž, kolik máš... Ach! To by mělo stačit. Můžeš ten problém považovat za vyřešený.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03");	//A nikomu o tom neříkej. Dělej, jako by se nic nestalo.
			B_GiveInvItems(hero,self,ItMiNugget,100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//Nemám tolik.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Pak pro tebe nebudu moci nic udělat - je mi líto, chlapče.
		};
	}
	else if(Npc_GetPermAttitude(prob,other) == ATT_HOSTILE)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00");	//Tomu říkáš nesnáz? To je skromné označení. Myslím, že by tě za to nejraději roztrhal na kousky, hochu.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01");	//Jestli mám nějaké lidi přesvědčit, aby ho zase uklidnili, tak to nebude vůbec levné. Bude tě to stát aspoň 500 nugetů.
		if(Npc_HasItems(other,ItMiNugget) >= 500)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02");	//Podívejme, co to tady máš... zdá se, že jsi boháč. Vezmu si těch 500 nugetů a smetem tu záležitost ze stolu.
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03");	//A pamatuj: nikdo ať se nedozví, že jsem se o ten problém postaral já - takže to nikomu neříkej, rozumíš?
			B_GiveInvItems(hero,self,ItMiNugget,500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//Nemám tolik.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Pak pro tebe nebudu moci nic udělat - je mi líto, chlapče.
		};
	}
	else
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00");	//Co já vím, tak s tebou nemá problém - neměj obavy.
	};
};

instance DIA_Gravo_HelpAngryNow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpAngryNow_Condition;
	information = DIA_Gravo_HelpAngryNow_Info;
	permanent = 1;
	description = "Můžeš mi pomoci - myslím, že mám problém.";
};

func int DIA_Gravo_HelpAngryNow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//Můžeš mi pomoci - myslím, že mám problém.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//Taky myslím, ale varuju tě, může tě to stát 100 až 500 nugetů.
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,DIALOG_BACK,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pomoz mi s Diegem.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pomoz mi s Thorusem.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Pomoz mi s Gomezem.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	var C_Npc diego;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00");	//Pomoz mi s Diegem.
	diego = Hlp_GetNpc(PC_Thief);
	B_Gravo_HelpAttitude(diego);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	var C_Npc Thorus;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00");	//Pomoz mi s Thorusem.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	B_Gravo_HelpAttitude(Thorus);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	var C_Npc Gomez;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00");	//Pomoz mi s Gomezem.
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	B_Gravo_HelpAttitude(Gomez);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

instance DIA_Gravo_Influence(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 2;
	condition = DIA_Gravo_Influence_Condition;
	information = DIA_Gravo_Influence_Info;
	permanent = 1;
	description = "Můžeš mi říci, který ze Stínů tady patří k vlivným lidem?";
};

func int DIA_Gravo_Influence_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_Influence_Info()
{
	AI_Output(other,self,"DIA_Gravo_Influence_15_00");	//Můžeš mi říci, který ze Stínů tady patří k vlivným lidem?
	AI_Output(self,other,"DIA_Gravo_Influence_04_01");	//Chceš udělat dojem na správné lidi, viď?
	AI_Output(self,other,"DIA_Gravo_Influence_04_02");	//Diego má ze Stínů největší moc. Věří Fingersovi, Whistlerovi a Slyovi.
	AI_Output(self,other,"DIA_Gravo_Influence_04_03");	//Dexter a Fisk prodávají své zboží na trhovém náměstí. Mají spousty zákazníků, dokonce i mezi strážemi, a to z nich dělá důležité osoby.
	AI_Output(self,other,"DIA_Gravo_Influence_04_04");	//A pak je tu Scatty. Ten má na starosti arénu a rozhoduje, kdo bude bojovat a tak. Spousta lidí mu dluží rudu - je teda dost důležitý.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Dexter a Fisk obchodují na tržišti s různým zbožím.");
};

instance DIA_GRAVO_HELPGILBERT(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = dia_gravo_helpgilbert_condition;
	information = dia_gravo_helpgilbert_info;
	permanent = 0;
	description = "Mohl bys pomoct i někomu jinému?";
};

func int dia_gravo_helpgilbert_condition()
{
	if(Npc_KnowsInfo(hero,dia_gilbert_und))
	{
		return 1;
	};
};

func void dia_gravo_helpgilbert_info()
{
	AI_Output(other,self,"DIA_Gravo_HelpGilbert_15_00");	//Mohl bys pomoct i někomu jinému?
	AI_Output(self,other,"DIA_Gravo_HelpGilbert_04_01");	//Komu bych mohl pomoci? A proč za mnou nepřijde sám?
	AI_Output(other,self,"DIA_Gravo_HelpGilbert_04_02");	//Jde o Gilberta, měl problémy s Gomezovými lidmi, a proto se v táboře nemůže ukázat.
	AI_Output(self,other,"DIA_Gravo_HelpGilbert_04_03");	//Aha tak je to tedy. No, můžu mu pomoct. Ale nebude to zadarmo.
	AI_Output(other,self,"DIA_Gravo_HelpGilbert_04_04");	//Kolik?
	AI_Output(self,other,"DIA_Gravo_HelpGilbert_04_05");	//500 kusů rudy.
	AI_Output(other,self,"DIA_Gravo_HelpGilbert_04_06");	//500?
	AI_Output(self,other,"DIA_Gravo_HelpGilbert_04_07");	//Proto není rozumné zaplést se s Gomezovými lidmi. Je to VŽDY drahé.
	B_LogEntry(CH1_GILBERT,"Gravo může Gilbertovi pomoci, ale za pomoc požaduje 500 KUSŮ RUDY.");
};

var int erz_gegeben;

instance DIA_GRAVO_GILBERTORE(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = dia_gravo_gilbertore_condition;
	information = dia_gravo_gilbertore_info;
	permanent = 1;
	description = "Mám 500 kusů rudy.";
};

func int dia_gravo_gilbertore_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_helpgilbert) && (ERZ_GEGEBEN == FALSE))
	{
		return 1;
	};
};

func void dia_gravo_gilbertore_info()
{
	AI_Output(other,self,"DIA_Gravo_GilbertOre_15_00");	//Mám 500 kusů rudy.
	AI_Output(self,other,"DIA_Gravo_GilbertOre_15_01");	//Opravdu? Ukaž mi ji.
	if(Npc_HasItems(other,ItMiNugget) >= 500)
	{
		AI_Output(self,other,"DIA_Gravo_GilbertOre_15_02");	//To by mělo stačit. Řekni Gilbertovi, že je to vyřízeno.
		AI_Output(self,other,"DIA_Gravo_GilbertOre_15_03");	//S nikým o tom nemluv a pokračuj jako by se nic nestalo.
		B_GiveInvItems(hero,self,ItMiNugget,500);
		ERZ_GEGEBEN = TRUE;
		B_LogEntry(CH1_GILBERT,"Gravo byl s platbou spokojený, mám věc považovat za vyřízenou. To znamená, že Gilbert se může vrátit do Starého tábora.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gravo_GilbertOre_15_04");	//To nestačí, omlouvám se, chlapče.
		AI_Output(self,other,"DIA_Gravo_GilbertOre_15_05");	//Vrať se, až budeš mít dost.
	};
};

