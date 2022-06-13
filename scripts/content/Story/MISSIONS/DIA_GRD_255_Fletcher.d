instance DIA_Fletcher_EXIT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 999;
	condition = DIA_Fletcher_EXIT_Condition;
	information = DIA_Fletcher_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

func void DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Fletcher_First(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_First_Condition;
	information = DIA_Fletcher_First_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Fletcher_First_Condition()
{
	if(Wld_IsTime(0,0,6,0))
	{
		return 1;
	};
};

func void DIA_Fletcher_First_Info()
{
	AI_Output(self,other,"DIA_Fletcher_First_06_00");	//Hej, ty!
	AI_Output(other,self,"DIA_Fletcher_First_15_01");	//Kdo? Já?
	AI_Output(self,other,"DIA_Fletcher_First_06_02");	//Však ty víš, s kým mluvím, zlatíčko!
	AI_Output(self,other,"DIA_Fletcher_First_06_03");	//Musím ti něco říci. Tohle je MŮJ obvod a nechci tu žádné problémy!
	AI_Output(self,other,"DIA_Fletcher_First_06_04");	//Nováčci jako ty mívají vždycky problémy. Obzvlášť, když se tu motají v noci.
	AI_Output(self,other,"DIA_Fletcher_First_06_05");	//Tak raději běž, a ať už tě tu nevidím! Naproti aréně je prázdná chatrč, v které je pelest. Trochu se vyspi.
	AI_Output(self,other,"DIA_Fletcher_First_06_06");	//A jestli tě chytím v nějaké jiné chatrči, osobně dohlídnu na to, abys toho litoval.
	AI_StopProcessInfos(self);
};

var int fletcher_whytalk;

instance DIA_Fletcher_Hello(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 2;
	condition = DIA_Fletcher_Hello_Condition;
	information = DIA_Fletcher_Hello_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Fletcher_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void DIA_Fletcher_Hello_Info()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00");	//Hej, ty!
	AI_Output(self,other,"DIA_Fletcher_Hello_06_01");	//Jestli jdeš dát peníze za ochranu - pak sis zvolil špatný den.
	AI_Output(other,self,"DIA_Fletcher_Hello_15_02");	//Tak? Co to má znamenat?
	AI_Output(self,other,"DIA_Fletcher_Hello_06_03");	//Protože už tady nejsem.
	Info_ClearChoices(DIA_Fletcher_Hello);
	Info_AddChoice(DIA_Fletcher_Hello,"Aha ...",DIA_Fletcher_Hello_ISee);
	Info_AddChoice(DIA_Fletcher_Hello,"Tak jak to, že tady s tebou mluvím?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice(DIA_Fletcher_Hello,"Och, a kde teda potom jsi?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00");	//Och, a kde teda potom jsi?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01");	//Momentálně jsem na hradě, sedím u velkého táborového ohně a piju džbánky piva.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00");	//Tak jak to, že tady s tebou mluvím?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01");	//Zmizel Nek. Za tenhle obvod obvykle zodpovídá on.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02");	//A dokud se znovu neobjeví, Thorus MI přikázal, abych tu dělal stráž.
	fletcher_whytalk = TRUE;
	Info_ClearChoices(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00");	//Aha ...
	Info_ClearChoices(DIA_Fletcher_Hello);
};

instance DIA_Fletcher_WoNek(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WoNek_Condition;
	information = DIA_Fletcher_WoNek_Info;
	permanent = 0;
	description = "Víš, kam zmizel Nek?";
};

func int DIA_Fletcher_WoNek_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk == TRUE))
	{
		return 1;
	};
};

func void DIA_Fletcher_WoNek_Info()
{
	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00");	//Víš, kam zmizel Nek?
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01");	//Ne, a ani ho nebudu hledat.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02");	//Pokud by o tom mohl v téhle čtvrti někdo něco vědět, pak jsou to kopáči. Ti ale se strážemi nemluví.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03");	//Obzvlášť ne teď, když vědí, jak já tuhle špinavou práci nenávidím. Vsadím se, že se mi vysmívají za zádama.
	if(Sly_LostNek != LOG_SUCCESS)
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
	};
	Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
	B_LogEntry(CH1_LostNek,"Možná budou kopáči z oblasti arény vědět, kam zmizel Nek.");
};

instance DIA_Fletcher_TroSchu(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_TroSchu_Condition;
	information = DIA_Fletcher_TroSchu_Info;
	permanent = 0;
	description = "Proč přesto nevybereš nějaké peníze za ochranu?";
};

func int DIA_Fletcher_TroSchu_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Hello))
	{
		return 1;
	};
};

func void DIA_Fletcher_TroSchu_Info()
{
	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00");	//Proč přesto nevybereš nějaké peníze za ochranu?
	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01");	//Nek už je vybral, než zmizel. Už toho moc nezbylo, aby se ještě vybíralo.
};

var int fletcher_foundNek;

instance DIA_Fletcher_WegenNek(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WegenNek_Condition;
	information = DIA_Fletcher_WegenNek_Info;
	permanent = 1;
	description = "Co se týče Neka...";
};

func int DIA_Fletcher_WegenNek_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek == FALSE))
	{
		return 1;
	};
};

func void DIA_Fletcher_WegenNek_Info()
{
	var C_Npc Nek;
	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00");	//Co se týče Neka...
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_01");	//Jistě?
	Nek = Hlp_GetNpc(GRD_282_Nek);
	if((Sly_LostNek == LOG_SUCCESS) || !Hlp_IsValidNpc(Nek))
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02");	//Myslím, že vím, kde je.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03");	//Cože? A kde je?
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04");	//Je z něj žrádlo pro krysy...
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05");	//Ach ne! Sakra! To znamená, že se tu teď budu muset ukazovat. Doufal jsem, že se vrátí zpátky.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06");	//A máme tu problém.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07");	//Žádné zprávy.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08");	//Pořád mě informuj.
	};
};

instance DIA_Fletcher_Problem(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_Problem_Condition;
	information = DIA_Fletcher_Problem_Info;
	permanent = 0;
	description = "Co je to za problém?";
};

func int DIA_Fletcher_Problem_Condition()
{
	if(fletcher_foundNek == TRUE)
	{
		return 1;
	};
};

func void DIA_Fletcher_Problem_Info()
{
	AI_Output(other,self,"DIA_Fletcher_Problem_15_00");	//Co je to za problém?
	AI_Output(self,other,"DIA_Fletcher_Problem_06_01");	//Jsem dlužný Scattymu, a to pořádně. Teď se dozví, že dělám Nekovu práci a bude sem chodit každý den...
};

instance DIA_FLETCHER_REDEN(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_reden_condition;
	information = dia_fletcher_reden_info;
	permanent = 0;
	description = "Možná bych si mohl promluvit se Scattym.";
};

func int dia_fletcher_reden_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Problem))
	{
		return 1;
	};
};

func void dia_fletcher_reden_info()
{
	AI_Output(other,self,"DIA_Fletcher_Reden_15_00");	//Možná bych si mohl promluvit se Scattym.
	AI_Output(self,other,"DIA_Fletcher_Reden_06_01");	//Můžeš to zkusit, ale jsem si jistý, že ten můj dlh jenom tak nepromine.
	FLETCHER_SCHULDEN = LOG_RUNNING;
	Log_CreateTopic(CH1_FLETCHER_SCHULDEN,LOG_MISSION);
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Fletcher mi řekl, že má Scattyho dluh. Možná bych si s ním o tom mohl promluvit.");
	Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_RUNNING);
};

instance DIA_FLETCHER_GOTTOFIGHT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_gottofight_condition;
	information = dia_fletcher_gottofight_info;
	permanent = 0;
	description = "Mluvil jsem s Scattym.";
};

func int dia_fletcher_gottofight_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_remember) || (SCATTY_IDOIT == TRUE))
	{
		return 1;
	};
};

func void dia_fletcher_gottofight_info()
{
	AI_Output(other,self,"DIA_Fletcher_GottoFight_15_00");	//Mluvil jsem s Scattym.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_01");	//A co řekl?
	AI_Output(other,self,"DIA_Fletcher_GottoFight_06_02");	//Zruší tvůj dluh, pokud porazím Gor Hanise v aréně.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_03");	//To ti ale vybral hodně tuhého protivníka.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_04");	//Gor Hanis je jedním z templářů ze sektovního tábora.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_05");	//Tito chlapi vědí, jak používat meč.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_06");	//Na tvém místě bych s ním nebojoval, pokud to s mečem pořádně neumíš.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_07");	//Je to v zájmu nás obou.
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Sdělil jsem Fletcherovi Scattyho nabídku. Řekl, že pokud půjdu proti Gor Hanisovi měl bych se naučit pořádně bojovat s mečem.");
};

instance DIA_FLETCHER_RESULT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_result_condition;
	information = dia_fletcher_result_info;
	permanent = 0;
	description = "Bojoval jsem v aréně.";
};

func int dia_fletcher_result_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((HANIS_HERAUSFORDERUNG == TRUE) && ((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_fletcher_result_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Fletcher_Result_15_00");	//Bojoval jsem v aréně.
	if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Result_01_01");	//Jak to šlo?
		AI_Output(other,self,"DIA_Fletcher_Result_01_02");	//Porazil jsem Gor Hanise.
		AI_Output(self,other,"DIA_Fletcher_Result_01_03");	//Skvělé! Zbavil jsi mě dluhů u Scattyho. Vem si tuhle rudu co jsem vybral od kopáčů jako odměnu.
		AI_Output(other,self,"DIA_Fletcher_Result_01_04");	//Jen pár kousků rudy?
		AI_Output(self,other,"DIA_Fletcher_Result_01_05");	//Teď víc nemám, ale ještě ti tvou pomoc oplatím.
		//BUG [Fawkes]: presuva sa item k hracovi ale nevytvara sa.
		//B_GiveInvItems(self,other,ItMiNugget,75);
		CreateInvItems (self,ItMiNugget,75);
		B_GiveInvItems(self,other,ItMiNugget,75);
		AI_StopProcessInfos(self);
	}
	else if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Result_02_01");	//Jak to šlo?
		AI_Output(other,self,"DIA_Fletcher_Result_02_02");	//Gor Hanis mě porazil.
		AI_Output(self,other,"DIA_Fletcher_Result_02_03");	//Sakra! Teď musím našetřit rudu pro Scattyho.
		AI_Output(other,self,"DIA_Fletcher_Result_02_04");	//Ach ano, mimochodem, teď mu dlužíš dvakrát tolik ...
		AI_Output(self,other,"DIA_Fletcher_Result_02_05");	//CO?! Proč jsi mi to předtím neřekl? Nesnáším, když se mnou někdo vyjebe ...
		AI_Output(other,self,"DIA_Fletcher_Result_02_06");	//No ...
		AI_Output(self,other,"EXTRA_FICKDICHSELBER");	//Seru na sebe, kreténe!
		AI_StopProcessInfos(self);
		Npc_SetPermAttitude(self,ATT_ANGRY);
	};
};

instance Grd_255_Fletcher_WELCOME(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = Grd_255_Fletcher_WELCOME_Condition;
	information = Grd_255_Fletcher_WELCOME_Info;
	important = 1;
	permanent = 0;
};

func int Grd_255_Fletcher_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01");	//Pochopil jsi rychle, jak to tu chodí. Vítej mezi stráže!
};

instance GRD_255_FLETCHER_WHATSUP(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_whatsup_condition;
	information = grd_255_fletcher_whatsup_info;
	important = 0;
	permanent = 0;
	description = "Co se děje?";
};

func int grd_255_fletcher_whatsup_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GRD) && (Kapitel == 3) && (FLETCHER_SCHULDEN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_whatsup_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_WhatsUp_Info_06_01");	//Co se děje?
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_02");	//Člověče ... Jak já nesnáším tuhle zasranou práci.
	AI_Output(other,self,"Grd_255_Fletcher_WhatsUp_Info_06_03");	//Není tu nikdo, kdo by tě vystřídal?
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_04");	//Ne, jsem jediný ze Strážců, kteří mohou převzít tuhle čtvrť.
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_05");	//Ostatní mají jinou ... pořádnou práci.
};

instance GRD_255_FLETCHER_ABLOESUNG(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_abloesung_condition;
	information = grd_255_fletcher_abloesung_info;
	important = 0;
	permanent = 0;
	description = "Můžu ti pomoct já?";
};

func int grd_255_fletcher_abloesung_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_whatsup))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_abloesung_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_Abloesung_Info_06_01");	//Můžu ti pomoct já?
	AI_Output(self,other,"Grd_255_Fletcher_Abloesung_Info_06_02");	//Docela by se mi hodila pomoc. Už jsi mi pomohl se Scattym.
	AI_Output(self,other,"Grd_255_Fletcher_Abloesung_Info_06_03");	//Takže ti můžu důvěřovat s tímto úkolem.
};

instance GRD_255_FLETCHER_MUSSTUN(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_musstun_condition;
	information = grd_255_fletcher_musstun_info;
	important = 0;
	permanent = 0;
	description = "Co přesně musím udělat?";
};

func int grd_255_fletcher_musstun_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_abloesung))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_musstun_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_MussTun_Info_06_01");	//Co přesně musím udělat?
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_02");	//Není to tak těžké. Peníze na ochranu se shromažďují každých pět dní. Oslov kopáče, budou už vědět co musí dělat.
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_03");	//Mimochodem, mám na starosti úsek kolem arény. O další části tábora se bát nemusíš, mají je na starosti Jackal a Bloodwyn.
	AI_Output(other,self,"Grd_255_Fletcher_MussTun_Info_06_04");	//Aha ...
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_05");	//Já si konečně můžu odpočinout vedle táboráku a dát si chlazené pivo.
	Log_CreateTopic(GE_ORECOLLECT,LOG_NOTE);
	B_LogEntry(GE_ORECOLLECT,"Odteď mám možnost vybírat peníze za ochranu ve Starém táboře. Můj okrsek je v oblasti Arény, stačí když si každých 5 dní řeknu kopáčům o rudu.");
	Npc_ExchangeRoutine(self,"ChapterThree");
};

instance Info_Fletcher_DIE(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = Info_Fletcher_DIE_Condition;
	information = Info_Fletcher_DIE_Info;
	permanent = 0;
	important = 1;
};

func int Info_Fletcher_DIE_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void Info_Fletcher_DIE_Info()
{
	AI_GotoNpc(self,hero);
	if((oldHeroGuild == GIL_STT) || (oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		if(oldHeroGuild == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_01");	//Zrádce! Myslet si, že necháme takové jako ty, aby se k nám přidali. BRR!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_02");	//Je to jeden z těch zrádných mágů Ohně! BRR!
		}
		else if(oldHeroGuild == GIL_EBR)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_07_02");	//Navždy pro mě bude záhadou co to napadlo Ravena, že z tebe udělal Rudobarona. Je škoda, že jsi nás zradil. Ušel jsi dlouhou cestu. Pche!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_03");	//Zdar, zrádče! To, žes byl jedním z Gomezových Stínů, ti teď nepomůže!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_04");	//Moment. Jak to myslíš, Fletchere?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_05");	//Patříš k té čeládce z Nového tábora, viď?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_06");	//Zadrž...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_07");	//Myslel sis, že na to nepřijdeme, co?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_08");	//No tak... Zadrž!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_09");	//Ne, TY zadrž - a drž si pevně hlavu! Protože o ní co nevidět přijdeš!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_10");	//SMRT ZRÁDCI!!!
		if(Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"Bloodwyn se opevnil u zadní brány. Zachoval se stejně jako Fletcher, který teď střeží hlavní bránu. Nevím sice jak, ale musí to nějak souviset s mým hledáním ohniska v pro Nový tábor.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Fletcher, který se skupinou vojáků střeží hlavní bránu Starého tábora, mě nazval zrádcem a odpadlíkem. Ani mě nevyslechl a zaútočil na mě!");
			B_LogEntry(CH4_BannedFromOC,"Vypadá to, že jsem vyhoštěn ze Starého tábora.");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_11");	//Podívej se na to. Je to chlap z Nového tábora!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_12");	//Podívej se na to. Je to chlap z tábora od bažin!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_13");	//A co? Co tady pohledáváš?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_14");	//Váš důl bude zanedlouho náš.
		AI_Output(hero,self,"Info_Fletcher_DIE_15_15");	//Jo? Pěkný sen!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_16");	//Promiň, ale nemůžu riskovat, že to řekneš někomu dalšímu!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_17");	//Zadrž, nechci žádné problémy!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_18");	//Na to's měl myslet dřív, než ses tu ukázal!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//Hej, co má tahle hádka...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_20");	//Pojďte, hoši, chytneme ho!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	B_ExchangeRoutine(GRD_252_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_253_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_244_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_214_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_215_Torwache,"FMTaken2");
	B_SetPermAttitude(GRD_255_Fletcher,ATT_HOSTILE);
	B_SetPermAttitude(GRD_252_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_253_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_244_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_214_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_215_Torwache,ATT_HOSTILE);
	if(!Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
	{
		B_LogEntry(CH4_Firemages,"Brány Starého tábora jsou nyní uzavřeny a hlídány strážemi. Napadají každého, kdo se přiblíží k táboru.");
	};
	AI_StopProcessInfos(self);
};

instance GRD_255_FLETCHER_NC(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_nc_condition;
	information = grd_255_fletcher_nc_info;
	important = 1;
	permanent = 0;
};

func int grd_255_fletcher_nc_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_nc_info()
{
	AI_Output(self,other,"Grd_255_Fletcher_NC_Info_06_01");	//Co chce někdo jako ty v našem táboře? Raději se vrať zase zpátky ke své lůze z Nového tábora.
};

