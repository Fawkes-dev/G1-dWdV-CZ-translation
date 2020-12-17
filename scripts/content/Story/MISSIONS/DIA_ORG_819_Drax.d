instance Org_819_Drax_Exit(C_Info)
{
	npc = ORG_819_Drax;
	nr = 999;
	condition = Org_819_Drax_Exit_Condition;
	information = Org_819_Drax_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Org_819_Drax_Exit_Condition()
{
	return 1;
};

func void Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Org_819_Drax_HuntHere(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_HuntHere_Condition;
	information = Org_819_Drax_HuntHere_Info;
	permanent = 0;
	description = "Ty tady lovíš, že jo?";
};

func int Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

func void Org_819_Drax_HuntHere_Info()
{
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_00");	//Ty tady lovíš, že jo?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_01");	//Vypadá to tak... co chceš?
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_02");	//Můžeš mi dát nějaké rady pro lov?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_03");	//Můžu tě naučit pár věcí - ale všechno má svoji cenu.
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_04");	//Kolik by to stálo?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_05");	//Pořádný doušek piva by pro začátek mohl stačit - pak se uvidí.
	Npc_ExchangeRoutine(self,"HUNT");
};

var int drax_bierbekommen;
var int drax_Lehrer_frei;

instance Org_819_Drax_Scavenger(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_Scavenger_Condition;
	information = Org_819_Drax_Scavenger_Info;
	permanent = 1;
	description = "Tady je, vezmi si pivo a vyprávěj mi o lovu.";
};

func int Org_819_Drax_Scavenger_Condition()
{
	if(Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen == FALSE))
	{
		return 1;
	};
};

func void Org_819_Drax_Scavenger_Info()
{
	if(Npc_HasItems(other,ItFoBeer) > 0)
	{
		B_GiveInvItems(other,self,ItFoBeer,1);
		AI_Output(other,self,"Org_819_Drax_Scavenger_15_00");	//Tady je, vezmi si pivo a vyprávěj mi o lovu.
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBeer);
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_01");	//Mrchožrouty, tak říkáme těm velkým ptákům, je nejlepší lovit jednoho po druhém. Vylákat jednoho mrchožrouta z hejna je snadné.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_02");	//Když přijdeš moc blízko, jsou podráždění. Za chvilku vyrazí tvým směrem. V tom okamžiku bys na ně měl čekat s připravenou zbraní.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_03");	//Když se ti tu potvoru podaří srazit, ještě než na tebe zaútočí, musíš být pořád ve střehu, abys ji pak mohl dorazit, a sám se přitom nezranil.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_04");	//Pokud udeříš první TY - výborně - ale nenech to udělat je.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00");	//Nemám žádné pivo.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01");	//Tak běž a nějaké sežeň. Takhle lacino už nikdy k žádné dobré radě nepřijdeš. A až přijdeš příště, přines také nějakou rudu!
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02");	//Můžu ti dát pár informací o zvěři, ale bude tě to něco stát!
	};
	drax_Lehrer_frei = TRUE;
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Bandita Drax mi nabídl, že mě naučí kuchat zvěř, když mu zaplatím, oč požádá. Většinou loví na cestě z tržiště do Starého tábora.");
};

instance Org_819_Drax_Creatures(C_Info)
{
	npc = ORG_819_Drax;
	nr = 1;
	condition = Org_819_Drax_Creatures_Condition;
	information = Org_819_Drax_Creatures_Info;
	permanent = 1;
	description = "Co mi ještě můžeš říci o lovu?";
};

func int Org_819_Drax_Creatures_Condition()
{
	if((drax_Lehrer_frei == TRUE) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void Org_819_Drax_Creatures_Info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_15_00");	//Co mi ještě můžeš říci o lovu?
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_06_01");	//Spoustu - ale bude tě to stát mnohem víc než pivo.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_02");	//Když víš jak, můžeš si z těch příšer vzít zuby, drápy a kůži. Je těžké je získat, ale mají velkou cenu.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_03");	//Každý obchodník ty věci s tebou vymění.
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice(Org_819_Drax_Creatures,DIALOG_BACK,Org_819_Drax_Creatures_BACK);
		Info_AddChoice(Org_819_Drax_Creatures,"Požaduješ toho za své rady moc.",Org_819_Drax_Creatures_PrettyMuch);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(Org_819_Drax_Creatures,"Vyjmout zuby (cena: 1 dovednostní bod, 50 nugetů)",Org_819_Drax_Creatures_Zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(Org_819_Drax_Creatures,"Stáhnout kožešinu (cena: 1 dovednostní bod, 100 nugetů)",Org_819_Drax_Creatures_Fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(Org_819_Drax_Creatures,"Vyjmout drápy (cena: 1 dovednostní bod, 50 nugetů)",Org_819_Drax_Creatures_Kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(Org_819_Drax_Creatures,"Stáhnout plaza (cena: 1 dovednostní bod, 100 nugetů)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//Řekl jsem ti všechno, co vím.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00");	//Požaduješ toho za své rady moc.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01");	//Možná, ale ty na nich můžeš vydělat daleko víc.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02");	//Všechna ta zvěř, kterou zabiješ, ti shnije, když nebudeš vědět, jak ji rozřezat.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03");	//Tím ztratíš možnost stáhnout ji z kůže a za vysokou cenu prodat kožešinu.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04");	//Já být tebou, pokusil bych si doplnit vědomosti, jak nejvíce to půjde.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00");	//Jak dostanu zuby?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Naučil ses: Odebírání zubů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01");	//Nejdůležitější je zajistit, aby se zuby netříštily. Tomu se vyhneš tak, že vložíš nůž blízko středu zubu a opatrně ho vypáčíš.
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02");	//Tak si můžeš vzít zuby vlků, stínových příšer a kousavců.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Odebírání zubů - Vlk, Skřetí pes, Chňapavec, Kousavec, Lovecký pes, Stínová šelma");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_00");	//Musíš ještě získat zkušenosti, jinak ti mé rady nebudou k ničemu.
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00");	//Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00");	//Jak dostanu kůži těch příšer?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Naučil ses: Stahování kožešiny",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_01");	//Důležité je kůži stahovat zezadu dopředu. Jakmile se ti napne, už je to snadné. Kožešiny se velmi cení!
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_02");	//Kůže vlků a stínových příšer se můžou použít na oděv. Když prohlídneš kožešinu zabitého zvířete, hned poznáš, jestli ji půjde použít, nebo ne.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Stahování kožešiny - Vlk, Skřetí pes, Stínová šelma, Troll");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_01");	//Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01");	//Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Naučil ses: Odebírání drápů",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00");	//Ukaž mi, jak dostanu drápy!
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_01");	//Je to v podstatě velmi jednoduché, pokud víš jak na to. Ohneš drápy dopředu - nikdy ne dozadu - ale NESMÍŠ je vytahovat!
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_02");	//Drápy můžeš dostat hlavně z ještěrek. Teď už víš, z kterých příšer drápy brát.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Odebírání drápů - Ještěrka, Chňapavec, Číhavec, Kousavec, Břitva");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_02");	//Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02");	//Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Naučil ses: Stahování plazí kůže",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00");	//Na co musím dávat pozor, když stahuji plazí kůži?
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_01");	//Jediní plazi, kteří jsou k tomuhle účelu vhodní, jsou číhavci a močáloví žraloci.
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_02");	//Když nařízneš kůži po stranách, sloupne se sama. Teď už bys měl umět stahovat plazy.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Stahování plazů - Číhavec, Močálový žralok");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_03");	//Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
			PrintScreen("Nedostatek vědomostních bodů!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03");	//Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

