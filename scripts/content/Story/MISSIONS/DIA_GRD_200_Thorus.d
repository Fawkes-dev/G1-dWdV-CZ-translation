instance Info_Thorus_EXIT(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 999;
	condition = Info_Thorus_EXIT_Condition;
	information = Info_Thorus_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Thorus_EXIT_Condition()
{
	return 1;
};

func void Info_Thorus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Thorus_EnterCastle(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 3;
	condition = Info_Thorus_EnterCastle_Condition;
	information = Info_Thorus_EnterCastle_Info;
	permanent = 0;
	description = "Nevypadáš, jako bys každého pustil na hrad.";
};

func int Info_Thorus_EnterCastle_Condition()
{
	if(Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};

func void Info_Thorus_EnterCastle_Info()
{
	AI_Output(other,self,"Info_EnterCastle_15_00");	//Nevypadáš, jako bys každého pustil na hrad.
	AI_Output(self,other,"Info_EnterCastle_09_01");	//Na hrad smějí jenom Gomezovi muži.
};

instance Info_Thorus_WorkForGomez(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 3;
	condition = Info_Thorus_WorkForGomez_Condition;
	information = Info_Thorus_WorkForGomez_Info;
	permanent = 0;
	description = "Chci pro Gomeze pracovat.";
};

func int Info_Thorus_WorkForGomez_Condition()
{
	if((Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo(hero,Info_Thorus_EnterCastle)) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Thorus_WorkForGomez_Info()
{
	AI_Output(other,self,"Info_WorkForGomez_15_00");	//Chci pro Gomeze pracovat.
	AI_Output(self,other,"Info_WorkForGomez_09_01");	//Vážně? A proč si myslíš, že by ti Gomez chtěl dát práci?
};

instance Info_Thorus_DiegoSentMe(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_DiegoSentMe_Condition;
	information = Info_Thorus_DiegoSentMe_Info;
	permanent = 0;
	description = "Diego řekl, že ty rozhoduješ, kdo je pro Gomeze zajímavý.";
};

func int Info_Thorus_DiegoSentMe_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp))
	{
		return 1;
	};
};

func void Info_Thorus_DiegoSentMe_Info()
{
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_00");	//Diego říká, že TY rozhoduješ, o koho bude mít Gomez zájem.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_01");	//No... Jestli Diego říká, že jsi v pohodě, proč se o tebe nepostará ON?
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_02");	//Poslouchej, vysvětlím ti to. Diego si tě chce vyzkoušet. Jestli si ON myslí, že jsi dost dobrý, tak tě pustím na hrad, abys mohl navštívit Gomeze.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_03");	//Cokoliv se stane, je to na tebe, jasný?
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_04");	//Řeknu to Diegovi.
	B_LogEntry(CH1_JoinOC,"Thorus mi řekl, že jestli chci být přijat do Starého tábora, měl bych si promluvit s Diegem. Diego mě vyzkouší.");
};

instance Info_Thorus_TryMe(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_TryMe_Condition;
	information = Info_Thorus_TryMe_Info;
	permanent = 0;
	description = "Proč mě nevyzkoušíš?";
};

func int Info_Thorus_TryMe_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_WorkForGomez))
	{
		return 1;
	};
};

func void Info_Thorus_TryMe_Info()
{
	AI_Output(other,self,"Info_Thorus_TryMe_15_00");	//Proč mě nevyzkoušíš?
	AI_Output(self,other,"Info_Thorus_TryMe_09_01");	//To není tak jednoduché, chlapče! Každý nováček, který se chce kamkoliv dostat, musí mít ochránce.
	AI_Output(self,other,"Info_Thorus_TryMe_09_02");	//A tím ochráncem musí být někdo z Gomezových lidí. Vyzkouší tě sám.
	AI_Output(self,other,"Info_Thorus_TryMe_09_03");	//A jestli zklameš, je to na tvoje vlastní riziko - to je zdejší zákon.
};

instance Info_Thorus_TryMeAgain(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_TryMeAgain_Condition;
	information = Info_Thorus_TryMeAgain_Info;
	permanent = 0;
	description = "Je tu určitě něco, co chceš udělat.";
};

func int Info_Thorus_TryMeAgain_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_TryMe))
	{
		return 1;
	};
};

func void Info_Thorus_TryMeAgain_Info()
{
	AI_Output(other,self,"Info_Thorus_TryMeAgain_15_00");	//Je tu určitě něco, co chceš udělat.
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_01");	//Ne. Věci se mají tak, že my, strážci, jsme trochu víc než ty, hochu.
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_02");	//Ty akorát provedeš úkoly, které pro tebe tvůj ochránce přichystal.
};

instance Info_Thorus_TryMeICanDoIt(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_TryMeICanDoIt_Condition;
	information = Info_Thorus_TryMeICanDoIt_Info;
	permanent = 0;
	description = "Jsem schopný udělat cokoliv, co mi přikážeš.";
};

func int Info_Thorus_TryMeICanDoIt_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_TryMeAgain))
	{
		return 1;
	};
};

func void Info_Thorus_TryMeICanDoIt_Info()
{
	AI_Output(other,self,"Info_Thorus_TryMeICanDoIt_15_00");	//Jsem schopný udělat cokoliv, co mi přikážeš.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_01");	//Eh? Vypadá to, že jsi odhodlaný, eh... Je tady jedna věc, kterou může vědět jen někdo, kdo není s Gomezem.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_02");	//Ale varuju tě: jestli to vyzradíš, můžeš se dostat do pěkného maléru!
};

var int Thorus_MordragKo;

instance Info_Thorus_MordragKo_Offer(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_MordragKo_Offer_Condition;
	information = Info_Thorus_MordragKo_Offer_Info;
	permanent = 0;
	description = "Jsem připraven vykonat tvůj úkol.";
};

func int Info_Thorus_MordragKo_Offer_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_TryMeICanDoIt))
	{
		return 1;
	};
};

func void Info_Thorus_MordragKo_Offer_Info()
{
	var C_Npc Mordrag;
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_00");	//Jsem připraven vykonat tvůj úkol.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_01");	//To, co ti teď povím, zůstane jenom mezi náma dvěma a nikdo jiný se o tom nesmí dozvědět, jasný?
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_02");	//Jasný.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_03");	//Mám potíže s jedním chlapíkem z Nového tábora. Jmenuje se Mordrag. Kradl u Rudobaronů.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_04");	//Samozřejmě máme v Novém táboře hromadu zabijáků, ale ten chlapík měl takové nervy, že přišel do NAŠEHO tábora a prodával NAŠE zboží NAŠIM lidem!
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_05");	//Zašel moc daleko. Dobře ale ví, že s tím nemůžu nic udělat.
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_06");	//Jak to?
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_07");	//Protože je pod ochranou mágů.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Postarám se o to.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Chceš po mně, abych toho chlapíka zabil?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Kde Mordraga najdu?",Info_Thorus_MordragKo_Where);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Proč ho mágové ochraňují?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Zdá se, že ti mágové jsou pro tebe problém...",Info_Thorus_MordragKo_MageProblem);
	Thorus_MordragKo = LOG_RUNNING;
	Log_CreateTopic(CH1_MordragKO,LOG_MISSION);
	B_LogEntry(CH1_MordragKO,"Thorus mě požádal, abych z tábora vyhnal lumpa jménem Mordrag. Jak to udělám, je prý má věc. Nikdo však nesmí vědět, že za tím stojí Thorus.");
	Log_SetTopicStatus(CH1_MordragKO,LOG_RUNNING);
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

func void Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00");	//Postarám se o to.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

func void Info_Thorus_MordragKo_KillHim()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_KillHim_15_00");	//Chceš po mně, abych toho chlapíka zabil?
	AI_Output(self,other,"Info_Thorus_MordragKo_KillHim_09_01");	//Chci, abys zařídil, abych se už na něj nikdy nemusel podívat. Je mi jedno, jak to uděláš.
};

func void Info_Thorus_MordragKo_Where()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_Where_15_00");	//Kde Mordraga najdu?
	AI_Output(self,other,"Info_Thorus_MordragKo_Where_09_01");	//Najdeš ho u jižní brány na druhé straně hradu, přímo za vstupem. Ten bastard by se už nikdy neměl odvážit přijít do tábora.
	B_LogEntry(CH1_MordragKO,"Mordrag je u jižní brány za hradem.");
};

func void Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_00");	//Proč ho mágové ochraňují?
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_01");	//Protože jim slouží jako poslíček. Naši kouzelníci jsou v kontaktu s mágy v Novém táboře. Často posílají poslíčky tam a zpátky.
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_02");	//Byli by nejspíš HODNĚ rozzlobení, kdybych některého z jejich poslíčků vyhodil z tábora, nebo ho zabil.
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_03");	//A co JÁ? Co myslíš, že udělají MNĚ?
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_04");	//Jsi tu nový, můžeš být v klidu. Já ale zodpovídám za to, co dělají moji chlapi. Proto je nesmírně důležité, abys držel jazyk za zuby.
	Thorus_MordragMageMessenger = TRUE;
};

func void Info_Thorus_MordragKo_MageProblem()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MageProblem_15_00");	//Zdá se, že ti mágové jsou tvůj problém...
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_01");	//Jistě, ale jsou takovým problémem, který se těžce řeší. Před pár lety se jeden ze Stínů pokusil ve spánku probodnout Velkého mága Ohnivého kruhu.
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_02");	//Potom ho našli na Vnějším okruhu - po pravdě řečeno, sbírali ho po CELÉM  Vnějším okruhu.
};

instance Info_Thorus_MordragKo_Analyze(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_MordragKo_Analyze_Condition;
	information = Info_Thorus_MordragKo_Analyze_Info;
	permanent = 1;
	description = "Postarám se o to.";
};

func int Info_Thorus_MordragKo_Analyze_Condition()
{
	if((Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE))
	{
		return 1;
	};
};

func void Info_Thorus_MordragKo_Analyze_Info()
{
	var C_Npc Mordrag;
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Postarám se o to.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Kde Mordraga najdu?",Info_Thorus_MordragKo_Where);
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
	if(Npc_IsDead(Mordrag) && (MordragKO_StayAtNC != TRUE))
	{
		Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Mordrag už nikdy nikomu nic neukradne!",Info_Thorus_MordragKo_MordragDead);
	}
	else if((MordragKO_HauAb == TRUE) || (MordragKO_StayAtNC == TRUE))
	{
		Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Už se tu nikdy víc neukáže!",Info_Thorus_MordragKo_MordragGone);
	};
};

func void Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00");	//Postarám se o to.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

func void Info_Thorus_MordragKo_MordragDead()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragDead_15_00");	//Mordrag už nikdy nikomu nic neukradne!
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragDead_09_01");	//Myslíš tím, žes ho porazil? To není špatné, hochu.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO,LOG_SUCCESS);
	B_LogEntry(CH1_MordragKO,"Thorus byl potěšen, že mu Mordrag zmizel z cesty. Výhoda pro mě.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

func void Info_Thorus_MordragKo_MordragGone()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragGone_15_00");	//Už se tu nikdy víc neukáže!
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragGone_09_01");	//Byl bych radši, kdybys ho zabil.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO,LOG_SUCCESS);
	B_LogEntry(CH1_MordragKO,"Thorus je rád, že už Mordrag není v táboře.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

instance Info_Thorus_MordragFailed(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_MordragFailed_Condition;
	information = Info_Thorus_MordragFailed_Info;
	permanent = 0;
	important = 1;
};

func int Info_Thorus_MordragFailed_Condition()
{
	if(MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

func void Info_Thorus_MordragFailed_Info()
{
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_00");	//Špatně! Říkal jsem ti NEVYSLOVUJ MOJE JMÉNO!!!
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_01");	//Vyzradil jsi to! Na všechno jsi zapomněl! Neopovažuj se už nijak do té záležitosti znovu pouštět!
	Thorus_MordragKo = LOG_FAILED;
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
	B_LogEntry(CH1_MordragKO,"Thorusovi se nelíbilo, že jsem Mordragovi řekl jeho jméno. Myslím, že bych mu chvíli neměl chodit na oči.");
	AI_StopProcessInfos(self);
};

instance Info_Thorus_BribeGuard(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_BribeGuard_Condition;
	information = Info_Thorus_BribeGuard_Info;
	permanent = 0;
	description = "Kdybych ti dal určité množství rudy, pustil bys mě na hrad?";
};

func int Info_Thorus_BribeGuard_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild(other) != GIL_STT) && (Npc_GetTrueGuild(other) != GIL_GRD))
	{
		return 1;
	};
};

func void Info_Thorus_BribeGuard_Info()
{
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_00");	//Kdybych ti dal určité množství rudy, pustil bys mě na hrad?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_01");	//Za určité množství...
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_02");	//Jak velké?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_02");	//Dobrá - musí být takové, aby se muselo chvíli počítat. Dost dlouho na to, aby bylo jisté, že já i mí chlapi budeme zaměstnaní jeho počítáním, zatímco ty vklouzneš dovnitř.
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_03");	//Tak řekni kolik?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_03");	//1000 nugetů by mělo stačit.
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_04");	//1000 nugetů?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_04");	//Dobře, tak se přidej ke Gomezovi, a budeš mít vstup na hrad zdarma.
};

var int erzbezahlt;

instance Info_Thorus_Give1000Ore(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_Give1000Ore_Condition;
	information = Info_Thorus_Give1000Ore_Info;
	permanent = 1;
	description = "Mám 1000 magických nugetů. Teď mě pusť dovnitř!";
};

func int Info_Thorus_Give1000Ore_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_BribeGuard) && (ERZBEZAHLT == FALSE))
	{
		return 1;
	};
};

func void Info_Thorus_Give1000Ore_Info()
{
	var C_Npc wache212;
	var C_Npc wache213;
	AI_Output(other,self,"Info_Thorus_Give1000Ore_15_00");	//Mám 1000 magických nugetů. Teď mě pusť dovnitř!
	if(Npc_HasItems(other,ItMiNugget) >= 1000)
	{
		B_GiveInvItems(other,self,ItMiNugget,1000);
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01");	//Dobrá, běž přímo rovně. Můžeš jít do hradu, ale žádné hlouposti, jasný?
		wache212 = Hlp_GetNpc(Grd_212_Torwache);
		wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		ERZBEZAHLT = TRUE;
		B_LogEntry(CH1_MESSAGEKDF,"Zaplatil jsem Thorusovi za vstup na hrad 1000 kusů rudy. Teď už budu schopen doručit zprávu Mágům Ohně.");
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_02");	//Nezkoušej na mě žádné triky, chlapče. Ty nemáš žádných 1000 magických nugetů!
	};
};

instance Info_Thorus_LetterForMages(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_LetterForMages_Condition;
	information = Info_Thorus_LetterForMages_Info;
	permanent = 1;
	description = "Potřebuju se dostat do hradu! Nesu dopis pro nejvyššího Mága Ohně.";
};

func int Info_Thorus_LetterForMages_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_HasItems(hero,ItWr_Fire_Letter_01) || Npc_HasItems(hero,ItWr_Fire_Letter_02)))
	{
		return 1;
	};
};

func void Info_Thorus_LetterForMages_Info()
{
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00");	//Potřebuju se dostat do hradu! Nesu dopis pro nejvyššího Mága Ohně.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_01");	//A ty si myslíš, že tě pustím do hradu, abys ho předal a shrábl odměnu?
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_02");	//Tak.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_03");	//Dobrá, ukaž mi tu zprávu.
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_04");	//Nemůžu ji ukázat TOBĚ - zapomeň na to!
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_05");	//Dobře, zapomněl jsem.
};

instance Info_Thorus_ReadyForGomez(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_ReadyForGomez_Condition;
	information = Info_Thorus_ReadyForGomez_Info;
	permanent = 0;
	description = "Diego říká, že můžu vidět Gomeze!";
};

func int Info_Thorus_ReadyForGomez_Condition()
{
	if(Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

func void Info_Thorus_ReadyForGomez_Info()
{
	var C_Npc wache212;
	var C_Npc wache213;
	var C_Npc wache218;
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_00");	//Diego říká, že můžu vidět Gomeze!
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_01");	//O tom rozhoduju já!
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_02");	//A jak ses rozhodl?
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_03");	//Hmmm...
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_04");	//Musím připustit, že svoji práci děláš opravdu dobře.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_05");	//Dobrá! Můžeš za Gomezem. Sám rozhodne, jestli se k nám přidáš, nebo ne.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_06");	//Od teďka jsi jedním z nás, hochu.
	wache212 = Hlp_GetNpc(Grd_212_Torwache);
	wache213 = Hlp_GetNpc(Grd_213_Torwache);
	wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

instance Info_Thorus_Krautbote(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 4;
	condition = Info_Thorus_Krautbote_Condition;
	information = Info_Thorus_Krautbote_Info;
	permanent = 0;
	description = "Mám tady od Cora Kaloma zásilku drogy z bažin pro Gomeze.";
};

func int Info_Thorus_Krautbote_Condition()
{
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Thorus_Krautbote_Info()
{
	var C_Npc wache212;
	var C_Npc wache213;
	var C_Npc wache218;
	AI_Output(other,self,"Info_Thorus_Krautbote_15_00");	//Mám tady od Cora Kaloma pro Gomeze zásilku drogy z bažin.
	if(Npc_HasItems(other,ItMi_Amulet_Psi_01))
	{
		AI_Output(self,other,"Info_Thorus_Krautbote_09_02");	//Hmmm...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_01");	//Ukaž mi ji!
		wache212 = Hlp_GetNpc(Grd_212_Torwache);
		wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_Krautbote_09_04");	//To může tvrdit kde kdo. A kde máš amulet poslíčků?
	};
};

var int thorus_Amulettgezeigt;

instance Info_Thorus_KdWSiegel(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 4;
	condition = Info_Thorus_KdWSiegel_Condition;
	information = Info_Thorus_KdWSiegel_Info;
	permanent = 1;
	description = "Jsem posel mágů Vody. Potřebuju se dostat na hrad!";
};

func int Info_Thorus_KdWSiegel_Condition()
{
	if((Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) || (Npc_HasItems(other,KdW_Amulett) >= 1)) && (thorus_Amulettgezeigt == FALSE))
	{
		return 1;
	};
};

func void Info_Thorus_KdWSiegel_Info()
{
	var C_Npc wache212;
	var C_Npc wache213;
	AI_Output(other,self,"Info_Thorus_KdWSiegel_15_00");	//Jsem posel mágů Vody. Potřebuju se dostat na hrad!
	if(Npc_HasItems(other,KdW_Amulett) >= 1)
	{
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_01");	//Máš sebou amulet kurýra. S tím projdeš skrze stáže.
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_02");	//S mágy nechci mít nic společného. Přestaň mě obtěžovat, jo?
		wache212 = Hlp_GetNpc(Grd_212_Torwache);
		wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_03");	//To jistě jsi. Ale asi jsi musel někde zapomenout amulet kurýra, viď?
	};
};

instance Info_Thorus_SttGeschafft(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_SttGeschafft_Condition;
	information = Info_Thorus_SttGeschafft_Info;
	permanent = 0;
	description = "Vyřízeno. Teď jsem členem tábora.";
};

func int Info_Thorus_SttGeschafft_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

func void Info_Thorus_SttGeschafft_Info()
{
	AI_Output(other,self,"Info_Thorus_SttGeschafft_15_00");	//Vyřízeno. Teď jsem členem tábora.
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_01");	//Gratuluju, hochu! Ode dneška se raději drž v blízkosti Diega.
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_02");	//Musím jen něco OPRAVDU důležitého říci Gomezovi nebo Ravenovi.
};

instance Info_Thorus_PERM2(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_PERM2_Condition;
	information = Info_Thorus_PERM2_Info;
	permanent = 0;
	description = "Jak to jde?";
};

func int Info_Thorus_PERM2_Condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_Thorus_PERM2_Info()
{
	AI_Output(other,self,"Info_Thorus_PERM2_15_00");	//Jak se máš?
	AI_Output(self,other,"Info_Thorus_PERM2_09_01");	//S Novým táborem nemáme tolik starostí. Spíš mám obavy z těch sektářských bláznů.
};

instance GRD_200_Thorus_GARDIST(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_GARDIST_Condition;
	information = GRD_200_Thorus_GARDIST_Info;
	important = 0;
	permanent = 0;
	description = "Chceš mi něco říci?";
};

func int GRD_200_Thorus_GARDIST_Condition()
{
	if(((CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,Grd_214_Torwache_SEETHORUS) || Npc_KnowsInfo(hero,GRD_216_Torwache_SEETHORUS)) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache;
	KDFWache = Hlp_GetNpc(GRD_245_Gardist);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output(other,self,"GRD_200_Thorus_GARDIST_Info_15_01");	//Chceš mi něco říci?
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_02");	//Ano. To, jak sis počínal v dolech, nejen dokázalo určitou odvahu, ale také prokázalo tvoji sílu a umění v boji.
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_03");	//Jsem rozhodnutý tě přijmout mezi své stráže.
	if(hero.level < 10)
	{
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_04");	//Ale nejsi zatím úplně připravený stát se strážcem. Potřebuješ ještě získat trochu zkušeností, než tě budu moci konečně přijmout.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_05");	//Dávám ti šanci. Co na to říkáš?
	};
};

instance GRD_200_Thorus_AUFNAHME(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_AUFNAHME_Condition;
	information = GRD_200_Thorus_AUFNAHME_Info;
	permanent = 0;
	description = "Chci se stát strážcem.";
};

func int GRD_200_Thorus_AUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST) && (hero.level >= 10) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_AUFNAHME_Info()
{
	var C_Npc KDFWache;
	AI_Output(other,self,"GRD_200_Thorus_AUFNAHME_Info_15_01");	//Chci se stát strážcem.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_02");	//To rád slyším. Nejprve ti ale musím říci něco, co říkám všem adeptům. Poslouchej dobře, protože to budu říkat jenom jednou.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_03");	//Dosud ses jenom pokoušel stát se jedním z nás. Ty dny jsou už pryč. Mí chlapi drží pohromadě. My, strážci, chráníme Rudobarony, tábor a důl.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_04");	//Kopáči dobývají rudu a my je za to nenecháme sežrat červům. Rudobaroni vyjednávají s králem, ale my jsme ti, co je chrání.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_05");	//Ve dne v noci jsme v dole. Ve dne v noci střežíme bránu tábora a staráme se, aby lidi mohli v klidu spát.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_06");	//Kdysi jsme byli divoká smečka, ale teď jsme síla, se kterou se počítá. Tvrdě pracujeme a dáváme své životy za životy druhých.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_07");	//Od svých chlapů očekávám jednu věc: že budou držet spolu. Jedině spolu dokážeme to, co dokázat musíme.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_08");	//Potom přežijeme.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_09");	//Všechno ostatní se naučíš během výcviku. Buď připravený pomáhat kdekoliv to bude zapotřebí a dělat cokoliv, co bude třeba.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_10");	//Zajdi za Stonem, aby ti dal nějakou zbroj a meč.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_11");	//Stonea najdeš v kovářském obchodě na Vnitřním okruhu.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_12");	//Tvůj první úkol na tebe čeká na hradě.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_13");	//Chlapům z Konvoje by se hodila tvoje pomoc. Promluv si s Ramonem.
	KDFWache = Hlp_GetNpc(GRD_245_Gardist);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	Npc_SetTrueGuild(hero,GIL_GRD);
	hero.guild = GIL_GRD;
};

instance GRD_200_Thorus_NOCHWAS(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_NOCHWAS_Condition;
	information = GRD_200_Thorus_NOCHWAS_Info;
	important = 1;
	permanent = 0;
};

func int GRD_200_Thorus_NOCHWAS_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_200_Thorus_AUFNAHME) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_01");	//Jo, a ještě jednu věc...
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_02");	//Vítej mezi strážemi.
	AI_StopProcessInfos(self);
	Log_CreateTopic(GE_BecomeGuard,LOG_NOTE);
	B_LogEntry(GE_BecomeGuard,"Dnes mě Thorus přijal mezi stráže. Mám si na hradě u kováře Stonea vyzvednout svoji novou zbroj.");
};

instance GRD_200_Thorus_WANNABEMAGE(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_WANNABEMAGE_Condition;
	information = GRD_200_Thorus_WANNABEMAGE_Info;
	permanent = 0;
	description = "Zajímá mě cesta magie.";
};

func int GRD_200_Thorus_WANNABEMAGE_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST) && !Npc_KnowsInfo(hero,GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_WANNABEMAGE_Info()
{
	var C_Npc Corristo;
	AI_Output(other,self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01");	//Zajímá mě cesta magie.
	AI_Output(self,other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02");	//Dobrá, pak by sis měl možná promluvit s Corristem. Vyučoval Miltena. Jsem si jistý, že ti nic nestojí v cestě.
	Corristo = Hlp_GetNpc(Kdf_402_Corristo);
	Npc_ExchangeRoutine(Corristo,"WAITFORSC");
	AI_ContinueRoutine(Corristo);
};

instance GRD_200_Thorus_Teach(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 10;
	condition = GRD_200_Thorus_Teach_Condition;
	information = GRD_200_Thorus_Teach_Info;
	permanent = 1;
	description = "Mohl bys mě učit?";
};

func int GRD_200_Thorus_Teach_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00");	//Můžeš mě cvičit?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01");	//Můžu ti ukázat, jak nabýt sílu a zlepšit umění boje.
	if(log_thorustrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Thorus mi pomůže zdokonalit mou SÍLU a OBRATNOST.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	Info_ClearChoices(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

instance GRD_200_Thorus_ZWEIHAND1(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_ZWEIHAND1_Condition;
	information = GRD_200_Thorus_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};

func int GRD_200_Thorus_ZWEIHAND1_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_ZWEIHAND1_Info()
{
	if(log_thorusfight == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Thorus mě může naučit bojovat s OBOURUČNÍMI ZBRANĚMI, jen co zvládnu boj s JEDNORUČNÍMI ZBRANĚMI.");
		log_thorusfight = TRUE;
	};
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01");	//Chci se naučit zacházet s obouručním mečem.
	if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02");	//Dobře, ale nejdřív musíme probrat základy.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03");	//Meč musíš držet vodorovně. Potřebuješ silnější rozmach, abys mohl na nepřítele zaútočit takovou těžkou zbraní.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04");	//Zvedni ruku a rozmáchni se rovnou dolu. To obvykle stačí na to, abys nepřítele srazil k zemi.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05");	//Toho momentu pak využiješ k novému rozmáchnutí.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06");	//Obouruční meče jsou ideální k zasazování bočních úderů, kterými si nepřítele udržíš od těla.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07");	//To by mohlo pro začátek stačit. Trénuj.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};

instance GRD_200_Thorus_ZWEIHAND2(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_ZWEIHAND2_Condition;
	information = GRD_200_Thorus_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0);
};

func int GRD_200_Thorus_ZWEIHAND2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01");	//Chci se dozvědět víc o boji s obouručním mečem.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02");	//Ze všeho nejdříve musíš zaujmout základní postoj. Meč musíš držet svisle, stranou od těla a údery vést silně oběma rukama.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03");	//Švihnout rychle dolu a ostří vést přes rameno. Pak máš šanci provést rychlý švih napravo.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04");	//Tvůj protivník nebude mít šanci se k tobě dostat.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05");	//Nebo mečem švihni z levé horní strany směrem dopředu, abys odrazil protivníka dozadu.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06");	//Pořád se otáčej, abys následnému švihu vždy dodával potřebnou sílu, která protivníka srazí.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07");	//Pokud to nebude stačit, zbylý švih využij k novému napřáhnutí meče.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08");	//Až útok dokončíš, zneškodni protivníka a vyčkej na další souboj.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09");	//Klíčem k úspěchu je měnit postoje a polohy.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0;
	};
};

instance DIA_THORUS_SCBARON(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 3;
	condition = dia_thorus_scbaron_condition;
	information = dia_thorus_scbaron_info;
	permanent = 0;
	important = 1;
};

func int dia_thorus_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_thorus_scbaron_info()
{
	AI_Output(self,other,"DIA_Thorus_SCBARON_15_00");	//Teď patříš mezi Rudobarony? Člověče, jsem vážně ohromen, máš vyjímečné schopnosti.
	AI_Output(self,other,"DIA_Thorus_SCBARON_15_01");	//Nevěřil bych, že to dotáhneš takhle daleko.
	AI_Output(self,other,"DIA_Thorus_SCBARON_15_02");	//A teď jsi úplně na vrcholu.
	AI_StopProcessInfos(self);
};

