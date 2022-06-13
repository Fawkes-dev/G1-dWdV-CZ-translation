var int MordragKO_PlayerChoseOreBarons;
var int MordragKO_PlayerChoseThorus;
var int MordragKO_HauAb;
var int MordragKO_StayAtNC;

instance Org_826_Mordrag_Exit(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 999;
	condition = Org_826_Mordrag_Exit_Condition;
	information = Org_826_Mordrag_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

func void Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Org_826_Mordrag_Greet(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 1;
	condition = Org_826_Mordrag_Greet_Condition;
	information = Org_826_Mordrag_Greet_Info;
	permanent = 0;
	important = 1;
};

func int Org_826_Mordrag_Greet_Condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void Org_826_Mordrag_Greet_Info()
{
	AI_Output(self,other,"Org_826_Mordrag_Greet_11_00");	//Hej, ty novej! Já jsem Mordrag. To jméno by sis měl zapamatovat - ode mě můžeš koupit jakékoliv zboží za dobrou cenu!
};

var int Mordrag_Traded;

instance Org_826_Mordrag_Trade(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 800;
	condition = Org_826_Mordrag_Trade_Condition;
	information = Org_826_Mordrag_Trade_Info;
	permanent = 1;
	description = "Ukaž mi svoje zboží.";
	trade = 1;
};

func int Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

func void Org_826_Mordrag_Trade_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_Trade_15_00");	//Ukaž mi tvoje zboží.
	AI_Output(self,other,"Org_826_Mordrag_Trade_11_01");	//Něco si vyber...
	if(Mordrag_Traded == 0)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Bandita Mordrag prodává na tržišti kradené zboží.");
		Mordrag_Traded = 1;
	};
};

instance Org_826_Mordrag_Courier(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_Courier_Condition;
	information = Org_826_Mordrag_Courier_Info;
	permanent = 0;
	description = "Jsi doopravdy kurýr mágů?";
};

func int Org_826_Mordrag_Courier_Condition()
{
	if(Thorus_MordragMageMessenger)
	{
		return 1;
	};
};

func void Org_826_Mordrag_Courier_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_Courier_15_00");	//Jsi doopravdy kurýr mágů?
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_01");	//A co když jsem?
	AI_Output(other,self,"Org_826_Mordrag_Courier_15_02");	//Potřeboval bych si promluvit s mágy. Musím se dostat do hradu.
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_03");	//Kurýři mágů nosí znak, který jim umožní vstup na hrad. Jestli jsi jeden z nás, pak bys měl mít takový znak...
	B_LogEntry(CH1_MESSAGEKDF,"I jako člen Nového tábora bych se mohl dostat na hrad. Jediné, co musím udělat, je připojit se k banditům a jako posel Vodních Mágů bych získal přístup na hrad.");
};

instance Org_826_Mordrag_Problem(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_Problem_Condition;
	information = Org_826_Mordrag_Problem_Info;
	permanent = 0;
	description = "Máš problém.";
};

func int Org_826_Mordrag_Problem_Condition()
{
	if((Thorus_MordragKo == LOG_RUNNING) && (MordragKO_HauAb != TRUE))
	{
		return 1;
	};
};

func void Org_826_Mordrag_Problem_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_00");	//Máš problém.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_01");	//Opravdu? Co se děje?
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_02");	//Jsou tady lidi, kteří se tě chtějí zbavit.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_03");	//Opravdu? Pak jim můžeš říci, že by měli někoho vyslat, aby jim splnil jejich přání.
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_04");	//Jak si můžeš být tak jistý, že nejsem ten, kdo to má udělat?
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_05");	//Protože si myslím, že na to jsi příliš bystrý, chlapče. Brzy si uvědomíš, že je lepší stát proti Gomezovi, než pro něj pracovat.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_06");	//V Novém táboře hodně potřebujeme schopné lidi a nikdo ti tam nebude přikazovat, co máš dělat.
};

instance Org_826_Mordrag_NCInfo(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_NCInfo_Condition;
	information = Org_826_Mordrag_NCInfo_Info;
	permanent = 0;
	description = "Pověz mi víc o Novém táboře.";
};

func int Org_826_Mordrag_NCInfo_Condition()
{
	if(Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier))
	{
		return 1;
	};
};

func void Org_826_Mordrag_NCInfo_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_00");	//Pověz mi víc o Novém táboře.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_01");	//Je to tábor, ve kterém máš největší svobodu v celé kolonii. Nemáme žádné Rudobarony ani Guru, kteří by nám šéfovali.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_02");	//Máme vlastní důl. Ale ruda, kterou vyrábíme, neputuje k žádnému zpropadenému králi!
	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_03");	//Tak k čemu se používá?
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_04");	//Naši mágové pracují na plánu, jak prolomit Bariéru. Všechna ruda se shromažďuje pro tento plán.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_05");	//Zatímco se Gomez a jeho lidé povalují, my se dřeme za svobodu - to je to, co se děje.
};

instance Org_826_Mordrag_JoinNewcamp(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_JoinNewcamp_Condition;
	information = Org_826_Mordrag_JoinNewcamp_Info;
	permanent = 0;
	description = "A kdybych se chtěl přidat k Novému táboru... mohl bys mi pomoci?";
};

func int Org_826_Mordrag_JoinNewcamp_Condition()
{
	if(Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier))
	{
		return 1;
	};
};

func void Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_JoinNewcamp_15_00");	//A kdybych se chtěl přidat k Novému táboru... mohl bys mi pomoci?
	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_01");	//Jestli to myslíš vážně, můžeme hned jít! Zavedu tě k Laresovi. Je hlavou tlupy.
	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_02");	//Ale jestli mě chceš raději zmlátit někde mimo tábor... Dobrá, do toho!
};

instance Org_826_Mordrag_GotoNewcamp(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_GotoNewcamp_Condition;
	information = Org_826_Mordrag_GotoNewcamp_Info;
	permanent = 0;
	description = "Tak pojďme do Nového tábora!";
};

func int Org_826_Mordrag_GotoNewcamp_Condition()
{
	if(Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp) && !Npc_KnowsInfo(hero,Org_826_Mordrag_HauAb))
	{
		return 1;
	};
};

func void Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoNewcamp_15_00");	//Tak pojďme do Nového tábora!
	AI_Output(self,other,"Org_826_Mordrag_GotoNewcamp_11_01");	//Dobře! Následuj mě.
	Mordrag_GotoNC_Day = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinNC,"Mordrag mi slíbil, že mi ukáže cestu do Nového tábora. Doufám, že to není léčka!");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
};

instance Org_826_Mordrag_AtNewcamp(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_AtNewcamp_Condition;
	information = Org_826_Mordrag_AtNewcamp_Info;
	permanent = 0;
	important = 1;
};

func int Org_826_Mordrag_AtNewcamp_Condition()
{
	if(Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") && !Npc_KnowsInfo(hero,Org_826_Mordrag_HauAb))
	{
		self.flags = 0;
		return 1;
	};
};

func void Org_826_Mordrag_AtNewcamp_Info()
{
	var C_Npc Lares;
	if(Mordrag_GotoNC_Day > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_00");	//Tak, a jsme tady.
	}
	else
	{
		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_LATE_11_00");	//Myslel jsem, že už nikdy nepřijdeš! Nevadí - jsme tady!
	};
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_01");	//Jakmile projdeš branou, budeš v Novém táboře. Promluv si s Laresem. Pomůže ti. Dej mu tohle. Je to nádherný prsten.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_02");	//To je tvoje vstupenka k Laresovi. Musíš mít dobrý důvod, abys ho mohl navštívit.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_03");	//Dobrá, jak o tom přemýšlím, myslím, že tady na nějaký čas zůstanu. Už jsem vydělal dost a ve Starém táboře je teď trochu dusno.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_04");	//Jestli chceš, přijď za mnou do baru - to je ta chatrč na jezeře. Dávej pozor!
	AI_Output(other,self,"Org_826_Mordrag_AtNewcamp_15_05");	//Ještě se uvidíme.
	CreateInvItems(self,MordragsRing,1);
	B_GiveInvItems(self,other,MordragsRing,1);
	B_GiveXP(XP_ArrivedWithMordrag);
	B_LogEntry(CH1_JoinNC,"Stojíme u přední brány Nového tábora a Mordrag mi dal prsten, který mám ukázat vůdci banditů Laresovi, pokud se chci přidat k Novému táboru. Mordrag se chce na chvilku zastavit v baru na jezeře.");
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

instance Org_826_Mordrag_Fight(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_Fight_Condition;
	information = Org_826_Mordrag_Fight_Info;
	permanent = 0;
	description = "Tenhle tábor není pro nás dva dost velký!";
};

func int Org_826_Mordrag_Fight_Condition()
{
	if((Thorus_MordragKo == LOG_RUNNING) && !Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp))
	{
		return 1;
	};
};

func void Org_826_Mordrag_Fight_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_Fight_15_00");	//Tenhle tábor není pro nás dva dost velký!
	AI_Output(self,other,"Org_826_Mordrag_Fight_11_01");	//Co prosím?
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice(Org_826_Mordrag_Fight,"Prostě odsud vypadni!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice(Org_826_Mordrag_Fight,"Tady není místo pro lidi, kteří kradou u Rudobaronů!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice(Org_826_Mordrag_Fight,"Poslal mě Thorus. Chce, abych tě provždy odstranil.",Info_Mordrag_Fight_Thorus);
};

func void Info_Mordrag_Fight_GetAway()
{
	AI_Output(other,self,"Info_Mordrag_Fight_GetAway_15_00");	//Prostě odsud vypadni!
	AI_Output(self,other,"Info_Mordrag_Fight_GetAway_11_01");	//Velký slova malýho chlapa...
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void Info_Mordrag_Fight_OreBarons()
{
	AI_Output(other,self,"Info_Mordrag_Fight_OreBarons_15_00");	//Tady není místo pro lidi, kteří kradou u Rudobaronů!
	AI_Output(self,other,"Info_Mordrag_Fight_OreBarons_11_01");	//Á, tak tohle máš na mysli! Proč neřekneš rovnou...
	MordragKO_PlayerChoseOreBarons = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void Info_Mordrag_Fight_Thorus()
{
	AI_Output(other,self,"Info_Mordrag_Fight_Thorus_15_00");	//Poslal mě Thorus. Chce, abych tě provždy odstranil.
	AI_Output(self,other,"Info_Mordrag_Fight_Thorus_11_01");	//Opravdu? Thorus? To je všechno, co jsem chtěl vědět...
	MordragKO_PlayerChoseThorus = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

instance Org_826_Mordrag_HauAb(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = Org_826_Mordrag_HauAb_Condition;
	information = Org_826_Mordrag_HauAb_Info;
	permanent = 0;
	important = 1;
};

func int Org_826_Mordrag_HauAb_Condition()
{
	var C_Npc Mordrag;
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
	if((Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1) && (MordragKO_StayAtNC != TRUE) && (Thorus_MordragKo == LOG_RUNNING))
	{
		return 1;
	};
};

func void Org_826_Mordrag_HauAb_Info()
{
	AI_Output(other,self,"Org_826_HauAb_GotoNewcamp_15_00");	//Tak odsud vypadni...
	AI_StopProcessInfos(self);
	MordragKO_HauAb = TRUE;
	B_LogEntry(CH1_MordragKO,"Vyběhl jsem s Mordragem a řekl mu, že ho už nikdy nechci ve Starém táboře vidět.");
	Npc_ExchangeRoutine(self,"Start");
};

instance Org_826_Mordrag_GotoKalom(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 2;
	condition = Org_826_Mordrag_GotoKalom_Condition;
	information = Org_826_Mordrag_GotoKalom_Info;
	permanent = 0;
	description = "Lares má pro tebe zprávu.";
};

func int Org_826_Mordrag_GotoKalom_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_ORG) && (Lares_InformMordrag == LOG_RUNNING))
	{
		return 1;
	};
};

func void Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_00");	//Lares má pro tebe zprávu.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_01");	//Řekni mi o tom.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_02");	//Chce vědět, co se děje v Sektovním táboře a chce, abys mu to zjistil ty.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_03");	//Mám pocit, že se ten problém vyřeší sám...
	B_LogEntry(CH1_JoinNC,"Sdělil jsem Mordragovi, co mi řekl Lares. Blábolil něco o tom, jak se věci o sebe sami postarají. Nevím, co tím myslí!");
};

var int Mordrag_GotoKalom;

instance Org_826_Mordrag_GotoKalomNOW(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 2;
	condition = Org_826_Mordrag_GotoKalomNOW_Condition;
	information = Org_826_Mordrag_GotoKalomNOW_Info;
	permanent = 0;
	description = "Lares mi řekl, abych ti pomohl s tou sektářskou záležitostí.";
};

func int Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if((Npc_GetTrueGuild(other) == GIL_ORG) && Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom))
	{
		return TRUE;
	};
};

func void Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_00");	//Lares mi řekl, abych ti pomohl s tou sektářskou záležitostí.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_01");	//Vidíš... Věděl jsem, že se o to nebudu muset starat sám.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_02");	//Chceš, abych ten případ vyřešil celý já sám?
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_03");	//Jsem si jistý, že to zvládneš. Poslouchej: důležité je zjistit, co je pravdy na těch pověstech o vzývání.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_04");	//Vím, ti sektářští blázni plánují velké vzývání. Co se mě týče, já ve Spáče nevěřím - jedna věc je ale jistá:
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_05");	//Guru mají ve své moci silná kouzla. Proto bude lepší vědět, o co půjde. Rozumíš mi?
	B_LogEntry(CH1_GotoPsiCamp,"Mordrag šikovně přehodil svůj úkol v táboře v bažinách na mně. Guru se zřejmě připravují k velkému vzývání, musím zjistit co chystají.");
	B_GiveXP(XP_AssistMordrag);
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	Info_ClearChoices(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice(Org_826_Mordrag_GotoKalomNOW,"Můžeš mi dát nějaké podrobnější pokyny?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice(Org_826_Mordrag_GotoKalomNOW,"Uvidím, co budu moci udělat.",Org_826_Mordrag_GotoKalomNOW_DoIt);
};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00");	//Můžeš mi dát nějaké podrobnější pokyny?
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01");	//Řekni Lesterovi. Kdysi jsem strávil dlouhou dobu v Sektovním táboře a on mi tam pomáhal. Patří k těm dobrým chlapům.
	B_LogEntry(CH1_GotoPsiCamp,"V táboře Bratrstva si mám promluvit s novicem Lesterem. Zdá se, že je důvěryhodný, protože kdysi pomohl Mordragovi.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00");	//Uvidím, co budu moci udělat.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01");	//Jakmile se dozvíš o jejich plánech, vrať se a podej mi hlášení.
	Info_ClearChoices(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos(self);
};

instance Org_826_Mordrag_RUNNING(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 2;
	condition = Org_826_Mordrag_RUNNING_Condition;
	information = Org_826_Mordrag_RUNNING_Info;
	permanent = 1;
	description = "O té sektářské záležitosti...";
};

func int Org_826_Mordrag_RUNNING_Condition()
{
	if(Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

func void Org_826_Mordrag_RUNNING_Info()
{
	AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_00");	//O té sektářské záležitosti...
	AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_01");	//Cože?
	if(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if(Kapitel >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//Nadešlo velké vzývání.
			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_09");	//Ne! Zúčastnil ses toho jejich bláznovství?
		}
		else
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_06");	//Mají v úmyslu kontaktovat Spáče prostřednictvím lektvaru, který vyrobili z vajíček důlních červů.
			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_07");	//Jak pošetilé! Ty šílené hlavy tomu všemu opravdu věří, že jo?
		};
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_10");	//Jsem zvědavý, co z toho vzejde.
		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_11");	//Já taky. Dej mi vědět, až z toho Guru konečně úplně zešílí.
		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP(XP_ReportToMordrag);
		Log_SetTopicStatus(CH1_GotoPsiCamp,LOG_SUCCESS);
		B_LogEntry(CH1_GotoPsiCamp,"Mordrag se mohl potrhat smíchy, když jsem mu řekl o vajíčkách důlního červa. Vypadá to, že už ho vyzvídání u guru příliš nezajímá. Shledávám že záležitost je vyřešena!");
	}
	else
	{
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_02");	//Nic jsme neobjevil.
		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_03");	//Tak v tom pokračuj...
	};
};

instance DIA_MORDRAG_NOWORG(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 1;
	condition = dia_mordrag_noworg_condition;
	information = dia_mordrag_noworg_info;
	permanent = 0;
	important = 1;
};

func int dia_mordrag_noworg_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void dia_mordrag_noworg_info()
{
	AI_Output(self,other,"DIA_Mordrag_NowORG_09_00");	//Takže jsi to opravdu zvládl? Udělal jsi správné rozhodnutí.
};

var int mordrag_schwert;

instance ORG_826_MORDRAG_HUNOSSWORD(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 801;
	condition = org_826_mordrag_hunossword_condition;
	information = org_826_mordrag_hunossword_info;
	permanent = 1;
	description = "Chci koupit meč, který ti prodal Jesse.";
};

func int org_826_mordrag_hunossword_condition()
{
	if(Npc_KnowsInfo(hero,dia_jesse_sword) && (MORDRAG_SCHWERT == FALSE))
	{
		return 1;
	};
};

func void org_826_mordrag_hunossword_info()
{
	AI_Output(other,self,"Org_826_Mordrag_HunosSword_15_00");	//Chtěl bych meč co ti prodal Jesse.
	AI_Output(self,other,"Org_826_Mordrag_HunosSword_12_01");	//Oh, opravdu? Bude to pěkně drahé.
	AI_Output(other,self,"Org_826_Mordrag_HunosSword_12_02");	//Kolik rudy chceš?
	AI_Output(self,other,"Org_826_Mordrag_HunosSword_12_03");	//200 kousků rudy by mělo stačit.
	Info_ClearChoices(org_826_mordrag_hunossword);
	Info_AddChoice(org_826_mordrag_hunossword,"Možná později.",org_826_mordrag_hunossword_back);
	Info_AddChoice(org_826_mordrag_hunossword,"Tady je 200 kusů rudy.",org_826_mordrag_hunossword_takeit);
};

func void org_826_mordrag_hunossword_back()
{
	AI_Output(other,self,"Org_826_Mordrag_HunosSword_BACK_15_00");	//Možná později.
	Info_ClearChoices(org_826_mordrag_hunossword);
};

func void org_826_mordrag_hunossword_takeit()
{
	AI_Output(other,self,"Org_826_Mordrag_HunosSword_TakeIt_15_00");	//Tady je 200 kusů rudy.
	if(Npc_HasItems(other,ItMiNugget) >= 200)
	{
		AI_Output(self,other,"Org_826_Mordrag_HunosSword_TakeIt_12_01");	//Tady je tvůj meč. Udělal jsi dobrý obchod.
		B_GiveInvItems(other,self,ItMiNugget,200);
		CreateInvItem(self,bloodwyns_schwert);
		B_GiveInvItems(self,other,bloodwyns_schwert,1);
		Info_ClearChoices(org_826_mordrag_hunossword);
		MORDRAG_SCHWERT = TRUE;
		B_LogEntry(CH1_HUNOLOSTSWORD,"Mordrag mi prodal meč. Teď ho musím zanést zpátky Hunovi.");
	}
	else
	{
		AI_Output(self,other,"Org_826_Mordrag_HunosSword_TakeIt_12_02");	//Nauč se počítat. Nemáš 200 kousků rudy.
	};
};

instance ORG_826_MORDRAG_SECT(C_Info)
{
	npc = ORG_826_Mordrag;
	nr = 3;
	condition = org_826_mordrag_sect_condition;
	information = org_826_mordrag_sect_info;
	permanent = 1;
	description = "Co děláš v tomhle táboře?";
};

func int org_826_mordrag_sect_condition()
{
	if(((Kapitel == 2) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Kapitel == 2) && (Npc_GetTrueGuild(hero) == GIL_STT)))
	{
		return 1;
	};
};

func void org_826_mordrag_sect_info()
{
	AI_Output(other,self,"Org_826_Mordrag_Sect_15_00");	//Co tady děláš?
	AI_Output(self,other,"Org_826_Mordrag_Sect_11_01");	//Poslal mně sem Lares. Zdá se, že bratrstvo chystá něco velkého.
	AI_Output(self,other,"Org_826_Mordrag_Sect_15_02");	//Jsem tu abych to sledoval.
	AI_Output(self,other,"Org_826_Mordrag_Sect_11_03");	//A než to vypukne ... budu se věnovat obchodu.
};

