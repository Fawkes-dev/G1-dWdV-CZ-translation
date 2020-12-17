instance Info_Gorn_EXIT(C_Info)
{
	npc = PC_Fighter;
	nr = 999;
	condition = Info_Gorn_EXIT_Condition;
	information = Info_Gorn_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Gorn_EXIT_Condition()
{
	return 1;
};

func void Info_Gorn_EXIT_Info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,other,"Info_Gorn_EXIT_09_01");	//Do boje!
	}
	else
	{
		AI_Output(self,other,"Info_Gorn_EXIT_09_02");	//Ještě se uvidíme.
	};
	AI_StopProcessInfos(self);
};

instance DIA_Gorn_First(C_Info)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Dia_Gorn_First_Condition;
	information = Dia_Gorn_First_Info;
	permanent = 0;
	important = 1;
};

func int Dia_Gorn_First_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Dia_Gorn_First_Info()
{
	AI_Output(self,other,"DIA_Gorn_First_09_00");	//Hej. Nová tvář.
	AI_Output(other,self,"DIA_Gorn_First_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Gorn_First_09_02");	//Jsem Gorn, žoldák mágů.
};

instance DIA_Gorn_Leben(C_Info)
{
	npc = PC_Fighter;
	nr = 2;
	condition = Dia_Gorn_Leben_Condition;
	information = Dia_Gorn_Leben_Info;
	permanent = 0;
	description = "Co musíš dělat jako žoldák mágů?";
};

func int Dia_Gorn_Leben_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gorn_First))
	{
		return 1;
	};
};

func void Dia_Gorn_Leben_Info()
{
	AI_Output(other,self,"DIA_Gorn_Leben_15_00");	//Co musíš dělat jako žoldák mágů?
	AI_Output(self,other,"DIA_Gorn_Leben_09_01");	//Lee uzavřel s mágy smlouvu. Pronajímá nejlepší bojovníky, jaké je možné v kolonii najít. Tedy nás.
	AI_Output(self,other,"DIA_Gorn_Leben_09_02");	//Staráme se o to, aby rudaři mohli těžit rudu a nebyli přitom obtěžováni a chráníme mágy před nesnázemi.
	AI_Output(self,other,"DIA_Gorn_Leben_09_03");	//Mágové se postarají, abychom odsud mohli odejít. A my dostáváme malý podíl rudy jako plat.
};

var int Gorn_ShrikesHut;

instance DIA_Gorn_Hut(C_Info)
{
	npc = PC_Fighter;
	nr = 3;
	condition = Dia_Gorn_Hut_Condition;
	information = Dia_Gorn_Hut_Info;
	permanent = 0;
	description = "Můžu tu někde zůstat?";
};

func int Dia_Gorn_Hut_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gorn_First))
	{
		return 1;
	};
};

func void Dia_Gorn_Hut_Info()
{
	AI_Output(other,self,"DIA_Gorn_Hut_15_00");	//Můžu tu někde zůstat, aniž bych musel někoho vykopnout z jeho chatrče?
	AI_Output(self,other,"DIA_Gorn_Hut_09_01");	//Myslím, že ne. Ale jestli to opravdu chceš, zajdi za Shrikem.
	AI_Output(self,other,"DIA_Gorn_Hut_09_02");	//Má chatrč úplně vpředu, u vchodu do jeskyně. Byla prázdná - ale vlastně patřila nám.
	AI_Output(other,self,"DIA_Gorn_Hut_15_03");	//Nám?
	AI_Output(self,other,"DIA_Gorn_Hut_09_04");	//Ano, nám žoldákům. Žoldáci a bandité tu žijí zvlášť. A nikdo z Laresovy tlupy by tady, na straně velké propasti, neměl co pohledávat.
	AI_Output(self,other,"DIA_Gorn_Hut_09_05");	//Ve skutečnosti v tom není velký rozdíl. On se ale nikoho nezeptal. A těmhle banditům nesmíš nechat úplně všechno projít, protože se z nich pak stanou opravdoví nafoukanci!
	Log_CreateTopic(CH1_ShrikesHut,LOG_MISSION);
	Log_SetTopicStatus(CH1_ShrikesHut,LOG_RUNNING);
	B_LogEntry(CH1_ShrikesHut,"Žoldák Gorn mi řekl, že si Shrike bez dovolení zabral jednu ze žoldnéřských chatrčí. Protože jsem narozdíl od Shrike o chatrč požádal, nikdo ze žoldáků nebude se mnou mít problém. Stačí, když 'přesvědčím' Shrika, aby si našel jinou chatrč.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

instance DIA_Gorn_HutFree(C_Info)
{
	npc = PC_Fighter;
	nr = 3;
	condition = Dia_Gorn_HutFree_Condition;
	information = Dia_Gorn_HutFree_Info;
	permanent = 0;
	description = "Shrike se přestěhoval do jiné chatrče.";
};

func int Dia_Gorn_HutFree_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void Dia_Gorn_HutFree_Info()
{
	AI_Output(other,self,"DIA_Gorn_HutFree_15_00");	//Shrike se přestěhoval do jiné chatrče.
	AI_Output(self,other,"DIA_Gorn_HutFree_09_01");	//Dobře. Torlof mi právě řekl, že by si chtěl s tím chlapíkem promluvit.
	AI_Output(self,other,"DIA_Gorn_HutFree_09_02");	//Ale dávej si pozor, pokud se připojíš k jinému táboru, ostatní žoldnéři tě z chatrče poženou.
	AI_Output(self,other,"DIA_Gorn_HutFree_09_03");	//Chlapům by se obzvlášť nelíbilo, kdyby v našich chatkách přespávali Gomezové lidé.
	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_ShrikesHut,LOG_SUCCESS);
	B_LogEntry(CH1_ShrikesHut,"Gorna královsky pobavilo, že jsem Shrika vyrazil z chatrče. Působí jako čestný chlap, tvrdý ale férový. Měl bych s ním v budoucnu držet.");
	B_GiveXP(XP_ReportedKickedShrike);
};

instance DIA_Gorn_BecomeSLD(C_Info)
{
	npc = PC_Fighter;
	nr = 5;
	condition = Dia_Gorn_BecomeSLD_Condition;
	information = Dia_Gorn_BecomeSLD_Info;
	permanent = 0;
	description = "Co musím udělat, abych se mohl přidat k Novému táboru?";
};

func int Dia_Gorn_BecomeSLD_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gorn_First) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Dia_Gorn_BecomeSLD_Info()
{
	AI_Output(other,self,"DIA_Gorn_BecomeSLD_15_00");	//Co musím udělat, abych se mohl přidat k Novému táboru?
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_01");	//Než tě Lee uzná, musíš se naučit lépe bojovat. Nezáleží na tom, jakou zbraň používáš, ale ty sám musíš být dobrý.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_02");	//Kromě toho bys měl mít velké zkušenosti se zdejším životem a tak.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_03");	//Jestli nebudeš chtít do jiných táborů, mohl by ses zkusit přidat k banditům, než začneš jako žoldák.
};

var int Gorn_Trade;

instance DIA_Gorn_TRADE(C_Info)
{
	npc = PC_Fighter;
	nr = 800;
	condition = Dia_Gorn_TRADE_Condition;
	information = Dia_Gorn_TRADE_Info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};

func int Dia_Gorn_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_done))
	{
		return 1;
	};
};

func void Dia_Gorn_TRADE_Info()
{
	AI_Output(other,self,"DIA_Gorn_TRADE_15_00");	//Máš ještě víc tohohle zboží?
	AI_Output(self,other,"DIA_Gorn_TRADE_09_01");	//Spousty. Chceš udělat obchod?
};

instance DIA_Gorn_DuHehler(C_Info)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Dia_Gorn_DuHehler_Condition;
	information = Dia_Gorn_DuHehler_Info;
	permanent = 0;
	description = "Proč ses zúčastnil útoku té tlupy?";
};

func int Dia_Gorn_DuHehler_Condition()
{
};

func void Dia_Gorn_DuHehler_Info()
{
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_00");	//Proč ses zúčastnil útoku té tlupy?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_01");	//Kdo to říkal?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_02");	//Kde bys teda potom vzal tolik toho zboží, kdyby to nebyla pravda?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_03");	//Nemysli si, že je to všechno z JEDNÉ várky.
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_04");	//Účastnil ses útoků pravidelně?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_05");	//Kdyby ano, tak bych ti to stejně neřekl. Leeovi by se to pranic nelíbilo.
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_06");	//Aha ...
	CreateInvItems(self,ItFoApple,21);
	B_GiveInvItems(self,other,ItFoApple,21);
	Npc_RemoveInvItems(other,ItFoApple,21);
	CreateInvItems(other,ItMw_1H_LightGuardsSword_03,1);
	CreateInvItems(other,ItFoApple,5);
	CreateInvItems(other,ItFoLoaf,5);
	CreateInvItems(other,ItFoCheese,5);
	CreateInvItems(other,ItFoBeer,5);
};

instance DIA_GORN_UEBERFALL(C_Info)
{
	npc = PC_Fighter;
	nr = 1;
	condition = dia_gorn_ueberfall_condition;
	information = dia_gorn_ueberfall_info;
	permanent = 0;
	description = "Lares mě poslal.";
};

func int dia_gorn_ueberfall_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Lares_BringListBack == LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_gorn_ueberfall_info()
{
	AI_Output(other,self,"DIA_Gorn_Ueberfall_15_00");	//Lares mě poslal.
	AI_Output(self,other,"DIA_Gorn_Ueberfall_09_01");	//Takže jsi novým členem naší tlupy?
	AI_Output(other,self,"DIA_Gorn_Ueberfall_15_02");	//Ano, proč se i ty účastníš přepadení?
	AI_Output(self,other,"DIA_Gorn_Ueberfall_09_03");	//I kdybych se účastnil, nemohl bych ti o tom říct. Lee by z toho nebyl dvakrát nadšený.
	AI_Output(other,self,"DIA_Gorn_Ueberfall_15_04");	//Aha ...
	AI_Output(self,other,"DIA_Gorn_Ueberfall_09_05");	//Můžeme tedy jít?
	AI_Output(other,self,"DIA_Gorn_Ueberfall_15_06");	//Pojďme!
	Npc_ExchangeRoutine(self,"OCCONVOY");
	Npc_ExchangeRoutine(Org_858_Quentin,"CONVOY");
	Npc_ExchangeRoutine(Org_865_Raeuber,"OCCONVOY");
	Npc_ExchangeRoutine(Org_870_Raeuber,"OCCONVOY");
	Npc_ExchangeRoutine(grd_5018_ramon,"CONVOY");
	Npc_ExchangeRoutine(grd_5014_convoitraeger,"CONVOY");
	Npc_ExchangeRoutine(grd_5015_convoitraeger,"CONVOY");
	Npc_ExchangeRoutine(grd_5016_convoiwache,"CONVOY");
	Npc_ExchangeRoutine(grd_5017_convoiwache,"CONVOY");
	AI_StopProcessInfos(self);
	CONVOY_NC = LOG_RUNNING;
	Log_CreateTopic(CH2_KONVOINC,LOG_MISSION);
	Log_SetTopicStatus(CH2_KONVOINC,LOG_RUNNING);
	B_LogEntry(CH2_KONVOINC,"Gorn, žoldák Mágů Vody, je jedním z těch, kteří vedli nájezd na konvoj Starého dolu. Teď mám zaútočit na konvoj spolu s ním !");
};

instance DIA_GORN_DONE(C_Info)
{
	npc = PC_Fighter;
	nr = 1;
	condition = dia_gorn_done_condition;
	information = dia_gorn_done_info;
	permanent = 0;
	important = 1;
};

func int dia_gorn_done_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_third) && (Npc_GetTrueGuild(hero) == GIL_ORG))
	{
		return 1;
	};
};

func void dia_gorn_done_info()
{
	AI_Output(self,other,"DIA_Gorn_Done_15_00");	//Vypadá to, že jsi dobrý bojovník.
	AI_Output(self,other,"DIA_Gorn_Done_15_01");	//Zase se vrátím do Nového tábora.
	AI_Output(self,other,"DIA_Gorn_Done_15_02");	//Myslím, že se nevidíme naposledy, že?
	AI_Output(self,other,"DIA_Gorn_Done_15_03");	//Mám u sebe pár věcí z přepadení, pokud bys chtěl obchodovat, stačí říct.
	AI_Output(self,other,"DIA_Gorn_Done_15_04");	//Tak uvidíme se příště.
	Npc_ExchangeRoutine(self,"START");
	Npc_ExchangeRoutine(Org_858_Quentin,"START");
	Npc_ExchangeRoutine(Org_865_Raeuber,"START");
	Npc_ExchangeRoutine(Org_870_Raeuber,"START");
	Npc_ExchangeRoutine(grd_5018_ramon,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5014_convoitraeger,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5015_convoitraeger,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5016_convoiwache,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5017_convoiwache,"ALTERNATIVE");
	AI_StopProcessInfos(self);
	CONVOY_NC = LOG_SUCCESS;
	B_GiveXP(XP_CONVOINC);
	Log_SetTopicStatus(CH2_KONVOINC,LOG_SUCCESS);
	B_LogEntry(CH2_KONVOINC,"Gorn byl ohromen mými schopnostmi a říkal, že jsem odvedl dobrou práci. Po útoku se vrátil do tábora.");
};

instance Info_Gorn_NCWAIT(C_Info)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Info_Gorn_NCWAIT_Condition;
	information = Info_Gorn_NCWAIT_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_NCWAIT_Condition()
{
	if(Npc_GetDistToWP(self,"NC_PATH52") < 1000)
	{
		return TRUE;
	};
};

func void Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_01");	//Áhh, to jsi ty! Můj přítel Lester z tábora z bažin mi řekl všechno o tom, cos tam dělal.
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_02");	//Na někoho, kdo tu ještě není dlouho, máš už docela rozhled.
	AI_Output(other,self,"Info_Gorn_NCWAIT_15_03");	//Už jsem měl taky párkrát namále, abych se nestal žrádlem pro červy.
};

instance Info_Gorn_MAGES(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_MAGES_Condition;
	information = Info_Gorn_MAGES_Info;
	important = 0;
	permanent = 0;
	description = "Mám důležitou zprávu pro mágy Vody!";
};

func int Info_Gorn_MAGES_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func void Info_Gorn_MAGES_Info()
{
	AI_Output(other,self,"Info_Gorn_MAGES_15_01");	//Mám důležitou zprávu pro mágy Vody!
	AI_Output(self,other,"Info_Gorn_MAGES_09_02");	//Pak bys měl mluvit se Saturasem. Je nejvyšší z mágů Vody a celé dny tráví studiemi nějakých písemností nebo tak.
	AI_Output(self,other,"Info_Gorn_MAGES_09_03");	//Bez ohledu na závažnost té zprávy tě však stráže z horní roviny za ním nepustí.
	AI_Output(other,self,"Info_Gorn_MAGES_15_04");	//Nemůžeš se za mě přimluvit?
	AI_Output(self,other,"Info_Gorn_MAGES_09_05");	//Já ne, ale Cronos, strážce rudy, by ti mohl udělit povolení.
};

instance Info_Gorn_CRONOS(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_CRONOS_Condition;
	information = Info_Gorn_CRONOS_Info;
	important = 0;
	permanent = 0;
	description = "Kde najdu toho 'strážce rudy'?";
};

func int Info_Gorn_CRONOS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func void Info_Gorn_CRONOS_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Gorn_CRONOS_15_01");	//Kde najdu toho 'strážce rudy'?
	AI_Output(self,other,"Info_Gorn_CRONOS_09_01a");	//Když vyjdeš odtud, projdeš velkou obytnou jeskyní za hrází.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_02");	//Cronos obvykle bývá u mříže před velkou haldou rudy.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_03");	//Je ale trochu arogantní. Budeš ho muset přesvědčit, že je tvá zpráva důležitá.
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	B_LogEntry(CH3_EscapePlanNC,"Gorn mi poradil, abych šel přímo za nejvyšším mágem Vody, Saturasem. Cronos, držitel rudy, mi může zajistit audienci. Cronose najdu uprostřed tábora u mříže nad rudnou haldou.");
	Npc_ExchangeRoutine(self,"start");
};

instance Info_Gorn_RUINWAIT(C_Info)
{
	npc = PC_Fighter;
	nr = 2;
	condition = Info_Gorn_RUINWAIT_Condition;
	information = Info_Gorn_RUINWAIT_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINWAIT_Condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_ABYSS_4") < 1000)
	{
		return 1;
	};
};

func void Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_01");	//Zdar, zelenáči. Jak vidíš, kolonie je malá vesnice.
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_02");	//Není možné jít a nikoho nepotkat.
};

instance Info_Gorn_RUINWHAT(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWHAT_Condition;
	information = Info_Gorn_RUINWHAT_Info;
	important = 0;
	permanent = 0;
	description = "Co tady děláš?";
};

func int Info_Gorn_RUINWHAT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINWHAT_Info()
{
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_01");	//Co tady děláš?
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_02");	//Och, pokouším se vystopovat starou legendu.
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_03");	//Legendu?
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_04");	//Ano, Milten, můj kamarád ze Starého tábora, mi řekl, že tady kdysi žili mniši.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_05");	//Samozřejmě, už dávno předtím, než tady byla Bariéra.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_06");	//Říká se, že uctívali boha, který jim dával moc proměňovat se ve zvířata.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_07");	//Jsem přesvědčený, že tady jsou stále ty poklady ze starých dob.
	if(!Npc_KnowsInfo(hero,Info_Gorn_RUINFOCUS))
	{
		AI_Output(self,other,"Info_Gorn_RUINWHAT_09_08");	//Co tě sem přivedlo?
	};
};

instance Info_Gorn_RUINFOCUS(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINFOCUS_Condition;
	information = Info_Gorn_RUINFOCUS_Info;
	important = 0;
	permanent = 0;
	description = "Hledám magické ohnisko.";
};

func int Info_Gorn_RUINFOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINFOCUS_Info()
{
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_01");	//Hledám magické ohnisko.
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_02");	//Musí tady někde být.
	AI_Output(self,other,"Info_Gorn_RUINFOCUS_09_03");	//Ta věc, kterou hledáš, by mohla být ve zřícenině kláštera za kaňonem.
};

instance Info_Gorn_RUINJOIN(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINJOIN_Condition;
	information = Info_Gorn_RUINJOIN_Info;
	important = 0;
	permanent = 0;
	description = "Mohli bychom pokračovat společně.";
};

func int Info_Gorn_RUINJOIN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero,Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINJOIN_Info()
{
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_01");	//Mohli bysme pokračovat společně.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_02");	//Dobrý nápad. Tahle oblast se hemží kousavci.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_03");	//Samotní nejsou pro zkušeného lovce problém, ale většinou loví ve smečkách.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_04");	//Smečka může dokonce i toho nejudatnějšího šermíře roztrhat na kusy.
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_05");	//Tak půjdeme spolu?
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_06");	//Dobře, ale ještě než vyrazíme, chtěl bych prozkoumat ten kaňon. Rád vím, co mám za zádama.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_07");	//Pojď se mnou, našel jsem cestu, po které půjdeme.
	Log_CreateTopic(CH3_MonasteryRuin,LOG_MISSION);
	Log_SetTopicStatus(CH3_MonasteryRuin,LOG_RUNNING);
	B_LogEntry(CH3_MonasteryRuin,"Když jsem se přiblížil k rozvalinám kláštera, potkal jsem žoldáka Gorna. Vypravil se sem, aby tu hledal starý poklad.");
	B_LogEntry(CH3_MonasteryRuin,"Budeme pokračovat v pátrání společně. Gorn mě varoval před velkými smečkami chňapavců, které se v této oblasti vyskytují.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinAbyss");
};

instance Info_Gorn_RUINABYSS(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINABYSS_Condition;
	information = Info_Gorn_RUINABYSS_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINABYSS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6") < 1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_01");	//Tomu se říká štěstí. Určitě tu bývala zásobní jeskyně.
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_02");	//Tak si teď převezmi vedení, chtěl bych mít jistotu, že na zpáteční cestě nezažijeme nějaké překvapení.
	B_LogEntry(CH3_MonasteryRuin,"Nalezli jsme tajnou zásobovací jeskyni. Kromě toho jeden klíč a dva kouzelné svitky, které vypadaly velmi zajímavě.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinFollow");
};

instance Info_Gorn_RUINLEAVE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEAVE_Condition;
	information = Info_Gorn_RUINLEAVE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINLEAVE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG") > 15000) && !Npc_KnowsInfo(hero,Info_Gorn_RUINGATE))
	{
		return 1;
	};
};

func void Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_01");	//Myslím, že už tě ta zřícenina kláštera přestala zajímat.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_02");	//Budu pokračovat sám.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_03");	//Jestli si to rozmyslíš, tak jdi za mnou.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinWall");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_RUINWALL(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWALL_Condition;
	information = Info_Gorn_RUINWALL_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINWALL_Condition()
{
	if((Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero,Info_Gorn_RUINLEAVE)) && (Npc_GetDistToWP(hero,"OW_PATH_175_GATE1") < 1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_01");	//Ta proklatá brána. Říkají, že ji nikdo z kolonie nedokáže otevřít.
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_02");	//Ty malé bestie jsou zřejmě jediné, co se dokáže dostat do vnitřního prostoru.
	B_LogEntry(CH3_MonasteryRuin,"Stojíme přímo před zavřenou bránou. Vypadá to, že zvenčí nepůjde otevřít.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinWall");
};

instance Info_Gorn_RUINWALLWHAT(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWALLWHAT_Condition;
	information = Info_Gorn_RUINWALLWHAT_Info;
	important = 0;
	permanent = 1;
	description = "Jak to dopadlo?";
};

func int Info_Gorn_RUINWALLWHAT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINWALL) && !Npc_KnowsInfo(hero,Info_Gorn_RUINGATE))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01");	//Co se děje?
	AI_Output(self,other,"Info_Gorn_RUINWALLWHAT_09_02");	//Musíš najít cestu na druhou stranu brány.
};

instance Info_Gorn_RUINLEDGE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEDGE_Condition;
	information = Info_Gorn_RUINLEDGE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINLEDGE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && !Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS) && (Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02") < 1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_01");	//Tamhle nahoře je nějaká plošina. Ale vypadá to, že je moc vysoko, aby se na ní dalo vyšplhat.
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_02");	//Musíme najít jinou cestu.
	AI_StopProcessInfos(self);
};

instance Info_Gorn_RUINPLATFORM(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINPLATFORM_Condition;
	information = Info_Gorn_RUINPLATFORM_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINPLATFORM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && !Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS) && (Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4") < 300))
	{
		return 1;
	};
};

func void Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_01");	//Vypadá to jako podstavec pro něco.
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_02");	//Snad ten artefakt, který hledáš, ležel právě tady.
	AI_StopProcessInfos(self);
};

instance Info_Gorn_RUINGATE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINGATE_Condition;
	information = Info_Gorn_RUINGATE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINGATE_Condition()
{
	if((Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero,Info_Gorn_RUINLEAVE)) && MonasteryRuin_GateOpen)
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINGATE_09_01");	//Doopravdy se podařilo tu bránu otevřít. To tvoje kouzlo bylo skutečně šikovné.
	AI_Output(other,self,"Info_Gorn_RUINGATE_15_02");	//A můžeme jít dál.
	B_LogEntry(CH3_MonasteryRuin,"Pomocí kouzelného svitku ze zásobovací jeskyně jsem se proměnil ve žravou štěnici a mohl jsem proklouznout škvírou ve zdi.");
	B_LogEntry(CH3_MonasteryRuin,"Brána je nyní otevřená.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RuinFollowInside");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_RUINLEAVEINSIDE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEAVEINSIDE_Condition;
	information = Info_Gorn_RUINLEAVEINSIDE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINGATE) && (Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6") < 1000) && !Npc_HasItems(hero,Focus_4))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_01");	//Myslím, že už tě ta zřícenina kláštera přestala zajímat.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_02");	//Budu pokračovat sám.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_03");	//Jestli si to rozmyslíš, tak jdi za mnou.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_RUINSUCCESS(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINSUCCESS_Condition;
	information = Info_Gorn_RUINSUCCESS_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINSUCCESS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && Npc_HasItems(hero,Focus_4))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_01");	//Tak jsi našel svůj kouzelný artefakt!
	AI_Output(other,self,"Info_Gorn_RUINSUCCESS_15_02");	//Ano. Musím ohnisko předat mágům Vody. Potřebují ho.
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_03");	//Budu tě chvíli doprovázet.
	B_LogEntry(CH3_MonasteryRuin,"Ohnisko jsem našel v jakési studovně . Gorn mě bude ještě doprovázet.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinYard");
	Wld_InsertNpc(YoungTroll,"OW_PATH_176");
};

instance Info_Gorn_RUINTROLL(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINTROLL_Condition;
	information = Info_Gorn_RUINTROLL_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINTROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS) && (Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01") < 1000))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_01");	//K ČERTU!!! Co je to tady za příšeru?
	AI_Output(other,self,"Info_Gorn_RUINTROLL_15_02");	//Kde se TO tu vzalo?
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_03");	//Vypadá to jako jeden z těch nepřemožitelných trolů. Jen trochu menší!
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_04");	//Jestli se ale chceme odtud dostat, musíme každopádně přes tu příšeru přejít.
	AI_StopProcessInfos(self);
	AI_DrawWeapon(self);
	AI_SetWalkMode(self,NPC_RUN);
};

instance Info_Gorn_RUINVICTORY(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINVICTORY_Condition;
	information = Info_Gorn_RUINVICTORY_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RUINVICTORY_Condition()
{
	var C_Npc yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINTROLL) && Npc_IsDead(yTroll))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_01");	//To byla dřina.
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_02");	//Dobře, porazili jsme tu příšeru. Jestli to ale byl jenom mladý trol...
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_03");	//...pak bysme se raději neměli potkat s jeho rodiči, co?
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_04");	//Tak nějak.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_05");	//Tady se naše cesty rozdělí. Chci tady chvíli zůstat a porozhlédnout se kolem.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_06");	//Jsem si ale jistý, že se ještě potkáme. Tak na viděnou, příteli.
	B_LogEntry(CH3_MonasteryRuin,"Na zpáteční cestě na klášternímu nádvoří jsme narazili na mladého trola. Došlo k tvrdému boji, ale zvítězili jsme.");
	B_LogEntry(CH3_MonasteryRuin,"Má pouť s Gornem nyní skončila. Mám pocit, že se ještě uvidíme.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_DIEGOMILTEN(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_DIEGOMILTEN_Condition;
	information = Info_Gorn_DIEGOMILTEN_Info;
	important = 0;
	permanent = 0;
	description = "Potkal jsem přes Starým táborem Diega a Miltena!";
};

func int Info_Gorn_DIEGOMILTEN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCFAVOR))
	{
		return TRUE;
	};
};

func void Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01");	//Potkal jsem přes Starým táborem Diega a Miltena!
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_02");	//To jsou dobré zprávy!
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_03");	//Chtějí navštívit tebe a Lestera. Na vašem obvyklém místě.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_04");	//Díky. Ve špatných časech, jako jsou teď, není nic cennějšího než dobří přátelé.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_05");	//Teď už jsi téměř jedním z nás. Jsi spolehlivý!
	B_GiveXP(XP_MessageForGorn);
	Npc_ExchangeRoutine(PC_Fighter,"MEETING");
	Npc_ExchangeRoutine(PC_Thief,"MEETING");
	Npc_ExchangeRoutine(PC_Mage,"MEETING");
	if(warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE;
	}
	else
	{
		B_LogEntry(CH4_4Friends,"Řekl jsem Lesterovi a Gornovi o setkání s jejich přáteli. Teď už to není moje věc. Dál si poradí sami...");
		Log_SetTopicStatus(CH4_4Friends,LOG_SUCCESS);
	};
};

instance Info_Gorn_FREEMINE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FREEMINE_Condition;
	information = Info_Gorn_FREEMINE_Info;
	important = 0;
	permanent = 0;
	description = "Co jsi viděl ve Svobodném dole?";
};

func int Info_Gorn_FREEMINE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH) && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Gorn_FREEMINE_Info()
{
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_01");	//Co jsi viděl ve Svobodném dole?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_02");	//Když jsem se vrátil z rozbořeného kláštera, chtěl jsem se zastavit u Okyla, šéfa Svobodného dolu.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_03");	//Když jsem ale přišel, všude se povalovaly mrtvoly.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_04");	//Zahlédl jsem akorát několik strážců, kteří se opevnili u vchodu do dolu.
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_05");	//Jak mohly pouhé dva tucty stráží porazit tolik žoldáků?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_06");	//Připadalo mi to jako léčka. Nikdo nepředpokládal, že by útočníci překročili hory.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_07");	//Prvek překvapení může mnohonásobně zvýšit sílu bojovníka.
	Npc_ExchangeRoutine(SLD_704_Blade,"START");
};

instance Info_Gorn_GUARDNC(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_GUARDNC_Condition;
	information = Info_Gorn_GUARDNC_Info;
	important = 0;
	permanent = 0;
	description = "Co máš teď v plánu?";
};

func int Info_Gorn_GUARDNC_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return TRUE;
	};
};

func void Info_Gorn_GUARDNC_Info()
{
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_01");	//Co máš teď v plánu?
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_02");	//Celá naše obranná strategie se musí změnit. To zabere nějaký čas.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_03");	//Dokud Lee a jeho lidé nebudou připraveni, přidám se ke Cordově provizorní stráži.
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_04");	//Chystáš protiútok?
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_05");	//Zatím ne, ale ten den přijde.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_06");	//Jestli mě někdy budeš hledat, jdi odtud směrem k dolu. Budu tam na stráži.
	B_Story_CordsPost();
	AI_StopProcessInfos(self);
};

instance Info_Gorn_GUARDNCRUNNING(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_GUARDNCRUNNING_Condition;
	information = Info_Gorn_GUARDNCRUNNING_Info;
	important = 0;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Gorn_GUARDNCRUNNING_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_GUARDNC) && !UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01");	//Jak to jde?
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02");	//Všude klid. Ve Svobodném dole se nic neděje.
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03");	//Lee je pořád zaneprázdněný organizací naší obrany.
};

instance Info_Gorn_POST(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_POST_Condition;
	information = Info_Gorn_POST_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_POST_Condition()
{
	if(UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Gorn_POST_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_POST_09_01");	//Jdeš právě včas. Připravujeme protiútok.
	AI_Output(self,hero,"Info_Gorn_POST_09_02");	//V první fázi převezmeme zpět Svobodný důl.
};

instance Info_Gorn_TAKEBACK(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_TAKEBACK_Condition;
	information = Info_Gorn_TAKEBACK_Info;
	important = 0;
	permanent = 0;
	description = "Plánuješ jeho převzetí jenom se čtyřmi muži? Kde jsou všichni žoldáci?";
};

func int Info_Gorn_TAKEBACK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_POST))
	{
		return TRUE;
	};
};

func void Info_Gorn_TAKEBACK_Info()
{
	var int guild;
	AI_Output(hero,self,"Info_Gorn_TAKEBACK_15_01");	//Plánuješ jeho převzetí jenom se čtyřmi muži? Kde jsou všichni žoldáci?
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_02");	//Čelní útok není dobrý! Gomezovi lidé jsou na to příliš dobře opevnění!
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_03");	//Mohli bysme ale zahájit tajnou misi a likvidovat jednoho muže po druhém - to by fungovalo.
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_04");	//Lee mě požádal, abych ti předal zprávu.
	guild = Npc_GetTrueGuild(hero);
	if(guild == GIL_SLD)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_05");	//Jako jeden ze čtyř nejlepších žoldáků jsi byl vybrán, abys vykonal tuhle misi.
	}
	else if(guild == GIL_KDW)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_06");	//Jako mág Kruhu vody a zkušený bojovník jsi byl vybrán, abys vykonal tuhle misi.
	}
	else if(guild == GIL_ORG)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_07");	//Jako jeden z nejlepších banditů jsi byl vybrán, abys vykonal tuhle misi.
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_08");	//I když nejsi jedním z nás, vykonal jsi pro náš tábor velikou službu a vícekrát jsi dokázal svou kvalitu.
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_09");	//Nabízíme ti příležitost, abys vykonal tuhle misi.
	};
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_10");	//Půjdu s tebou. Dohromady se nám to podaří!
};

instance Info_Gorn_SECOND(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_SECOND_Condition;
	information = Info_Gorn_SECOND_Info;
	important = 0;
	permanent = 0;
	description = "První fáze? Co bude druhá?";
};

func int Info_Gorn_SECOND_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_POST))
	{
		return TRUE;
	};
};

func void Info_Gorn_SECOND_Info()
{
	AI_Output(hero,self,"Info_Gorn_SECOND_15_01");	//První fáze? Co bude druhá?
	AI_Output(self,hero,"Info_Gorn_SECOND_09_02");	//Jakmile bude důl zase náš, začneme hledat horský průsmyk, přes který přešli Gomezovi lidé, aby nás napadli!
	AI_Output(self,hero,"Info_Gorn_SECOND_09_03");	//Když bude ten průsmyk uzavřený, situace bude zase pod naší kontrolou.
	AI_Output(hero,self,"Info_Gorn_SECOND_15_04");	//Aha ...
};

instance Info_Gorn_WHYME(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_WHYME_Condition;
	information = Info_Gorn_WHYME_Info;
	important = 0;
	permanent = 0;
	description = "Proč právě já?";
};

func int Info_Gorn_WHYME_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func void Info_Gorn_WHYME_Info()
{
	AI_Output(hero,self,"Info_Gorn_WHYME_15_01");	//Proč právě já?
	AI_Output(self,hero,"Info_Gorn_WHYME_09_02");	//Už jsi vícekrát dokázal, že jsi současně odvážný i chytrý!
	AI_Output(self,hero,"Info_Gorn_WHYME_09_03");	//A kromě toho znáš Starý tábor a jeho stráže líp než kdokoliv z nás.
	AI_Output(self,hero,"Info_Gorn_WHYME_09_04");	//Pro tenhle úkol jsi nejlepší muž!
};

instance Info_Gorn_KICKBUTT(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_KICKBUTT_Condition;
	information = Info_Gorn_KICKBUTT_Info;
	important = 0;
	permanent = 0;
	description = "Dobrá, tak pojďme dát našim nevítaným hostům do dolu pořádnou lekci!";
};

func int Info_Gorn_KICKBUTT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_WHYME) && !Npc_KnowsInfo(hero,Info_Gorn_MYWAY))
	{
		return TRUE;
	};
};

func void Info_Gorn_KICKBUTT_Info()
{
	AI_Output(hero,self,"Info_Gorn_KICKBUTT_15_01");	//Dobrá, tak pojďme dát našim nevítaným hostům do dolu pořádnou lekci!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_02");	//Nečekal jsem, že řekneš něco jiného!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_03");	//Tady je klíč. Je od vrátnice před vstupem do dolu.
	B_Story_GornJoins();
};

instance Info_Gorn_MYWAY(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_MYWAY_Condition;
	information = Info_Gorn_MYWAY_Info;
	important = 0;
	permanent = 0;
	description = "Proč ne. Potřebuju se stejně dostat do dolu!";
};

func int Info_Gorn_MYWAY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_WHYME) && !Npc_KnowsInfo(hero,Info_Gorn_KICKBUTT))
	{
		return TRUE;
	};
};

func void Info_Gorn_MYWAY_Info()
{
	AI_Output(hero,self,"Info_Gorn_MYWAY_15_01");	//Proč ne. Potřebuju se stejně dostat do dolu!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_02");	//Ať už máš k tomu jakýkoliv důvod, jsem rád, že jsme se v téhle věci spolu dohodli!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_03");	//Tady je klíč. Je od vrátnice před vstupem do dolu.
	B_Story_GornJoins();
};

instance Info_Gorn_WOLF(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_WOLF_Condition;
	information = Info_Gorn_WOLF_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_WOLF_Condition()
{
	if(Gorn_JoinedForFM && (Npc_GetDistToWP(hero,"OW_PATH_076") < 500))
	{
		return TRUE;
	};
};

func void Info_Gorn_WOLF_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_WOLF_09_01");	//Och, málem jsem zapomněl!
	AI_Output(self,hero,"Info_Gorn_WOLF_09_02");	//Bandita Wolf chce s tebou nutně mluvit, ještě než odejdeš do dolu.
	Info_ClearChoices(Info_Gorn_WOLF);
	Info_AddChoice(Info_Gorn_WOLF,"Může počkat, máme na práci důležitější věci.",Info_Gorn_WOLF_FM);
	Info_AddChoice(Info_Gorn_WOLF,"Pak tam raději půjdu hned.",Info_Gorn_WOLF_WOLF);
	B_LogEntry(CH4_UluMulu,"Bandita Wolf chce se mnou mluvit ještě předtím, než se vydáme na cestu do dolu. Půjdu ho navštívit.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM()
{
	AI_Output(hero,self,"Info_Gorn_WOLF_15_04");	//Může počkat, máme na práci důležitější věci.
	AI_Output(self,hero,"Info_Gorn_WOLF_09_05");	//Jak říkáš!
	AI_StopProcessInfos(self);
};

func void Info_Gorn_WOLF_WOLF()
{
	AI_Output(hero,self,"Info_Gorn_WOLF_15_06");	//Pak tam raději půjdu hned.
	AI_Output(self,hero,"Info_Gorn_WOLF_09_07");	//Udělej to. Počkám tady na tebe.
	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_LEAVEFORPOST(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_LEAVEFORPOST_Condition;
	information = Info_Gorn_LEAVEFORPOST_Info;
	important = 1;
	permanent = 1;
};

func int Info_Gorn_LEAVEFORPOST_Condition()
{
	if(Gorn_JoinedForFM && (Npc_GetDistToWP(hero,"OW_PATH_074") < 2000) && (FreemineOrc_LookingUlumulu != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc(self,hero);
	if(Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_01");	//Vypadá to, že chceš mluvit s Wolfem!
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_02");	//To je špatný směr! Musíme jít k dolu!
	};
	AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_03");	//Počkám na tebe u provizorní strážnice!
	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_REJOINFORFM(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_REJOINFORFM_Condition;
	information = Info_Gorn_REJOINFORFM_Info;
	important = 0;
	permanent = 1;
	description = "Pojďme k dolu!";
};

func int Info_Gorn_REJOINFORFM_Condition()
{
	if((Npc_KnowsInfo(hero,Info_Gorn_MYWAY) || Npc_KnowsInfo(hero,Info_Gorn_KICKBUTT)) && (Npc_GetDistToWP(hero,"OW_PATH_075_GUARD4") < 1000) && !Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func void Info_Gorn_REJOINFORFM_Info()
{
	AI_Output(hero,self,"Info_Gorn_REJOINFORFM_15_01");	//Pojďme k dolu!
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_02");	//Nejvyšší čas vyhnat odtud stráže!
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_03");	//Jdi napřed, půjdu za tebou!
	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FollowToFMC");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_RAZOR(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RAZOR_Condition;
	information = Info_Gorn_RAZOR_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_RAZOR_Condition()
{
	if(Gorn_JoinedForFM && (Npc_GetDistToWP(hero,"OW_PATH_3000") < 1000))
	{
		return TRUE;
	};
};

func void Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_01");	//POZOR, NEBEZPEČÍ!!!
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_02");	//Loví ve smečkách jako kousavci, ale koušou daleko hůř!
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_03");	//Měli bysme je sprovodit ze světa. Znáš mě, mám rád, když vím, co mám za zády.
	AI_StopProcessInfos(self);
};

instance Info_Gorn_FMCENTRANCE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMCENTRANCE_Condition;
	information = Info_Gorn_FMCENTRANCE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_FMCENTRANCE_Condition()
{
	if(Gorn_JoinedForFM && (Npc_GetDistToWP(hero,"FMC_ENTRANCE") < 1000))
	{
		return TRUE;
	};
};

func void Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_01");	//Zadrž, vidíš všechny ty mrtvoly?
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_02");	//Jdi ke vchodu do dolu, já zůstanu tady a ohlídám, abysme nebyli zezadu nemile zaskočeni.
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_03");	//Až budeš dole, půjdu za tebou.
	Npc_ExchangeRoutine(self,"WaitFMC");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_FMGATE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMGATE_Condition;
	information = Info_Gorn_FMGATE_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_FMGATE_Condition()
{
	if(Gorn_JoinedForFM && !FM_GateOpen && (Npc_GetDistToWP(hero,"FMC_FM_ENTRANCE") < 1000))
	{
		return TRUE;
	};
};

func void Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_01");	//Slyšel jsem, jak bojuješ, a tak jsem za tebou ihned vyrazil.
	AI_Output(hero,self,"Info_Gorn_FMGATE_15_02");	//Starý známý... Ale účet je srovnaný!
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_03");	//Dobrá, otevři ta vrata, já budu hlídat.
	Npc_ExchangeRoutine(self,"WaitFM");
	AI_StopProcessInfos(self);
};

instance Info_Gorn_AFTERFM(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_AFTERFM_Condition;
	information = Info_Gorn_AFTERFM_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_AFTERFM_Condition()
{
	if(FreemineOrc_LookingUlumulu)
	{
		return TRUE;
	};
};

func void Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_01");	//Ach, člověče. To byl opravdu tvrdý boj.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_02");	//Nikdy bych si nebyl pomyslel, že by Gomezovy stráže dokázaly klást takový odpor.
	AI_Output(hero,self,"Info_Gorn_AFTERFM_15_03");	//Hlavní je, že jsme je vyhnali z našeho dolu.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_04");	//Jsem pořád tady a hlídám situaci!
	B_Story_LeftFM();
	Lee_freeminereport = 1;
	AI_StopProcessInfos(self);
};

instance Info_Gorn_FMWATCH(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMWATCH_Condition;
	information = Info_Gorn_FMWATCH_Info;
	important = 0;
	permanent = 1;
	description = "Jaká je situace?";
};

func int Info_Gorn_FMWATCH_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_AFTERFM))
	{
		return TRUE;
	};
};

func void Info_Gorn_FMWATCH_Info()
{
	AI_Output(hero,self,"Info_Gorn_FMWATCH_15_01");	//Jaká je situace?
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_02");	//Všude klid. Ve Svobodném dole se nic neděje.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_03");	//Už to nebude dlouho trvat, než sem dorazí posily, které vyslal Lee.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_04");	//Do té doby bych už byl dávno doma.
};

instance Info_Gorn_FOUNDULUMULU(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FOUNDULUMULU_Condition;
	information = Info_Gorn_FOUNDULUMULU_Info;
	important = 1;
	permanent = 0;
};

func int Info_Gorn_FOUNDULUMULU_Condition()
{
	if(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_01");	//To je zajímavá skřetí standarta, co tady máš.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_02");	//Patřila tomu skřetímu otrokovi z dolu?
	AI_Output(hero,self,"Info_Gorn_FOUNDULUMULU_15_03");	//Je to skřetí symbol přátelství. Chci s ním jít do skřetího města.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_04");	//Doufám, že budeš mít štěstí a že budou skřeti respektovat tuhle... VĚC!
	B_Kapitelwechsel(5);
	AI_StopProcessInfos(self);
};

