instance DIA_Grim_Exit(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 999;
	condition = DIA_Grim_Exit_Condition;
	information = DIA_Grim_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Grim_Exit_Condition()
{
	return 1;
};

func void DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Grim_Falle(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Falle_Condition;
	information = DIA_Grim_Falle_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Grim_Falle_Condition()
{
	if((Grim_ProtectionBully == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Grim_Falle_Info()
{
	AI_Output(self,other,"DIA_Grim_Falle_06_00");	//Hej, ty! Nejseš ty ten, co se chce přidat k táboru?
	AI_Output(other,self,"DIA_Grim_Falle_15_01");	//A co když jo?
	AI_Output(self,other,"DIA_Grim_Falle_06_02");	//Mohl bych ti pomoci.
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//A jak?
	AI_Output(self,other,"DIA_Grim_Falle_06_04");	//Před táborem posedávají dva chlapíci a jeden z nich něco ukradl Rudobaronům. Je to znamenitý amulet, který měl přijet s posledním konvojem.
	AI_Output(self,other,"DIA_Grim_Falle_06_05");	//Jeden z nich by ten amulet měl mít pořád ještě u sebe. Jestliže je napadneme společně, mohlo by se nám to podařit - sám bych to nedokázal. Co ty na to?
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"Nemám zájem - budeš se muset poohlédnout po někom jiném.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Co se stane, až budeme mít ten amulet?",DIA_Grim_Falle_HowShare);
	Info_AddChoice(DIA_Grim_Falle,"Počítej se mnou.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00");	//Nemám zájem - budeš se muset poohlédnout po někom jiném.
	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01");	//S tímhle přístupem daleko nedojdeš -  řekni mi, kdyby sis to rozmyslel.
	Info_ClearChoices(DIA_Grim_Falle);
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00");	//Co se stane, až budeme mít ten amulet?
	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01");	//To je snadné! Vrátím ho a dostanu odměnu. Řeknu jim, že jsi mi pomohl. Pak budeš mít u Gomeze jistě oko...
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"Nemám zájem - budeš se muset poohlédnout po někom jiném.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Ne! Buď to bude půl na půl, nebo si to udělej sám!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice(DIA_Grim_Falle,"Počítej se mnou.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00");	//Ne! Buď to bude půl na půl, nebo si to udělej sám!
	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01");	//Dobře, dobře, teda půl na půl. Doufám, že to bude pro oba dost. Tak - můžu s tebou počítat?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00");	//Počítej se mnou.
	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01");	//Dobrá, řekni mi, kdy můžeme začít!
	Info_ClearChoices(DIA_Grim_Falle);
};

instance DIA_Grim_ReadyToGo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_ReadyToGo_Condition;
	information = DIA_Grim_ReadyToGo_Info;
	permanent = 0;
	description = "Jsem připravený jít s tebou - pojďme pro ten amulet!";
};

func int DIA_Grim_ReadyToGo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

func void DIA_Grim_ReadyToGo_Info()
{
	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00");	//Jsem připravený jít s tebou - pojďme pro ten amulet!
	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01");	//Dobře, pojďme do toho...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};

instance DIA_Grim_AtOCdraussen(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_AtOCdraussen_Condition;
	information = DIA_Grim_AtOCdraussen_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Grim_AtOCdraussen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo) && (Npc_GetDistToWP(hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500))
	{
		return 1;
	};
};

func void DIA_Grim_AtOCdraussen_Info()
{
	var C_Npc Bu520;
	var C_Npc Bu534;
	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00");	//Tak, jsme tady - daleko od našeho přítele Diega.
	if(((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520)) || ((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534)))
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01");	//Máme vyřídit pozdravy od Bloodwyna!
	}
	else
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02");	//Mám vyřídit pozdravy od Bloodwyna!
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Bu520 = Hlp_GetNpc(VLK_520_Buddler);
	Bu534 = Hlp_GetNpc(VLK_534_Buddler);
	if((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520))
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_Attack,1,"");
	};
	if((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534))
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_Attack,1,"");
	};
};

instance DIA_Grim_NACHFalle(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_NACHFalle_Condition;
	information = DIA_Grim_NACHFalle_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Grim_NACHFalle_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen) && (Npc_GetDistToNpc(self,other) < ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Grim_NACHFalle_Info()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01");	//Ty idiote, chtěl jsi mě chytit do pasti...
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02");	//Hej, člověče! Jsme na stejné lodi! Nechce se mi rubat v dolech.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03");	//Udělám, co mi řeknou stráže, pak mě přijmou dříve.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04");	//Měl bych TĚ praštit po tlamě a zarazit do země. Proč jsi proboha začal bojovat se strážemi?
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05");	//Já proti tobě osobně nic nemám. Tak co myslíš - mír nebo válka?
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Info_AddChoice(DIA_Grim_NACHFalle,"Do toho.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice(DIA_Grim_NACHFalle,"Mír.",DIA_Grim_NACHFalle_Frieden);
};

func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00");	//Já to vidím jako válku.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01");	//Och, člověče, dostal jsi mě...
	Info_ClearChoices(DIA_Grim_NACHFalle);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00");	//Mír zní líp.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01");	//Jsem rád, že jsme si to vyříkali z očí do očí. Zapomeňme na to. Od teďka jsem na tvojí straně.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02");	//Kdybys měl ještě někdy nějaké problémy, můžeš se mnou počítat - konečně, něco ti dlužím.
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

var int FirstOver;

instance DIA_Grim_Hallo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_Hallo_Condition;
	information = DIA_Grim_Hallo_Info;
	permanent = 0;
	description = "Jsem tady nový.";
};

func int DIA_Grim_Hallo_Condition()
{
	if(Grim_ProtectionBully == TRUE)
	{
		FirstOver = TRUE;
	};
	if(FirstOver == FALSE)
	{
		return 1;
	};
};

func void DIA_Grim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Grim_Hallo_15_00");	//Jsem tady nový.
	AI_Output(self,other,"DIA_Grim_Hallo_06_01");	//Právě jsi přišel, viď? Já jsem Grim - nejsem tady ještě dlouho. Strčili mě sem se skupinou právě před tebou.
};

instance DIA_Grim_Leben(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Leben_Condition;
	information = DIA_Grim_Leben_Info;
	permanent = 0;
	description = "Jak se tady žije?";
};

func int DIA_Grim_Leben_Condition()
{
	return 1;
};

func void DIA_Grim_Leben_Info()
{
	AI_Output(other,self,"DIA_Grim_Leben_15_00");	//Jaký je tady život?
	AI_Output(self,other,"DIA_Grim_Leben_06_01");	//Docela to ujde, pokud platíš strážím peníze za ochranu.
};

instance DIA_Grim_Aufnahme(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_Aufnahme_Condition;
	information = DIA_Grim_Aufnahme_Info;
	permanent = 0;
	description = "Co musím udělat, aby mě v táboře uznávali?";
};

func int DIA_Grim_Aufnahme_Condition()
{
	return 1;
};

func void DIA_Grim_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00");	//Co musím udělat, když budu chtít, aby mě v táboře uznávali?
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01");	//Tak, nejdřív se musíš stát Stínem. Proto si musíš najít někoho, kdo tě bude podporovat. Někoho, kdo ti všechno vysvětlí a bude za tebou stát.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02");	//Být tebou, zkusil bych se dostat k Diegovi - já to taky tak udělal - je docela dobrý.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03");	//Udělá s tebou zkoušku poctivosti - ta je pro každého jiná. Pak splníš pár menších úkolů od ostatních Stínů.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04");	//Když se ti to podaří, budeš patřit k nám.
};

var int Grim_Tests;

instance DIA_Grim_HowFarAreYou(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 4;
	condition = DIA_Grim_HowFarAreYou_Condition;
	information = DIA_Grim_HowFarAreYou_Info;
	permanent = 1;
	description = "A - jak daleko ses dostal se svými zkouškami?";
};

func int DIA_Grim_HowFarAreYou_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules) && (Kapitel == 1))
	{
		return 1;
	};
};

func void DIA_Grim_HowFarAreYou_Info()
{
	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00");	//A - jak daleko ses dostal se svými zkouškami?
	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01");	//Už jsem mluvil s Dexterem, Slyem a Fingersem. Ti patří k nejdůležitějším lidem v táboře.
	if(!Grim_Tests)
	{
		B_LogEntry(CH1_JoinOC,"Dexter, Sly a Shadow jsou vlivní Stínové.");
		Grim_Tests = TRUE;
	};
};

instance DIA_Grim_YourPDV(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 5;
	condition = DIA_Grim_YourPDV_Condition;
	information = DIA_Grim_YourPDV_Info;
	permanent = 0;
	description = "Jaká byla TVOJE zkouška poctivosti?";
};

func int DIA_Grim_YourPDV_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

func void DIA_Grim_YourPDV_Info()
{
	AI_Output(other,self,"DIA_Grim_YourPDV_15_00");	//Jaká byla TVOJE zkouška poctivosti?
	AI_Output(self,other,"DIA_Grim_YourPDV_06_01");	//To ti, člověče, nemůžu říci. O věcech, jako je tahle, nesmíš mluvit.
};

instance DIA_Grim_INEXTREMO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMO_Condition;
	information = DIA_Grim_INEXTREMO_Info;
	permanent = 0;
	important = 1;
};

func int DIA_Grim_INEXTREMO_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMO_Info()
{
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01");	//Hej, už si slyšel novinky?
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02");	//Jsou tady In Extremo. Jsou právě na tribuně.
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03");	//Pospěš, jinak tu štaci propásneme!
	Npc_ExchangeRoutine(self,"InExtremo");
	AI_StopProcessInfos(self);
};

instance DIA_GRIM_SCHATTEN(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = dia_grim_schatten_condition;
	information = dia_grim_schatten_info;
	permanent = 1;
	important = 0;
	description = "Přijali tě ke Stínům?";
};

func int dia_grim_schatten_condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void dia_grim_schatten_info()
{
	AI_Output(other,self,"DIA_Grim_SCHATTEN_06_01");	//Přijali tě ke Stínům?
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_02");	//Ano, teprve nedávno.
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_03");	//Jako jeden z Gomezových lidí budeš mít opravdu pohodlný život.
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_04");	//Nedokážu si představit nic lepšího.
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		AI_Output(self,other,"DIA_Grim_SCHATTEN_06_05");	//Zdá se, že to vidíš stejně, kolego.
	};
	AI_StopProcessInfos(self);
};

instance DIA_Grim_INEXTREMOAWAY(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMOAWAY_Condition;
	information = DIA_Grim_INEXTREMOAWAY_Info;
	permanent = 0;
	important = 0;
	description = "Kde jsou In Extremo?";
};

func int DIA_Grim_INEXTREMOAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_INEXTREMO) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01");	//Kde jsou In Extremo?
	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02");	//Už jsou pryč. To je škoda, obvykle bývám po večerech u tribuny.
	AI_StopProcessInfos(self);
};

var int grim_member;
var int grim_kumpel;

instance DIA_GRIM_LETSGO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_letsgo_condition;
	information = dia_grim_letsgo_info;
	permanent = 0;
	description = "Řekl jsi, že se od nynějška můžu spolehnout na tvou pomoc.";
};

func int dia_grim_letsgo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_NACHFalle))
	{
		return 1;
	};
};

func void dia_grim_letsgo_info()
{
	AI_Output(other,self,"DIA_Grim_LetsToGo_15_00");	//Řekl jsi, že se od nynějška můžu spolehnout na tvou pomoc.
	AI_Output(self,other,"DIA_Grim_LetsToGo_06_01");	//Myslíš kvůli té věci s amuletem? Dodržím svoje slovo, neboj.
	AI_Output(self,other,"DIA_Grim_LetsToGo_06_02");	//Pokud někdy budeš potřebovat, přijď za mnou a já se k tobě přidám.
	GRIM_KUMPEL = TRUE;
};

instance DIA_GRIM_GOGO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_gogo_condition;
	information = dia_grim_gogo_info;
	permanent = 1;
	description = "Pojď se mnou.";
};

func int dia_grim_gogo_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_letsgo) && (GRIM_KUMPEL == TRUE) && (GRIM_MEMBER == FALSE))
	{
		return 1;
	};
};

func void dia_grim_gogo_info()
{
	AI_Output(other,self,"DIA_Grim_GoGo_15_00");	//Pojď se mnou.
	AI_Output(self,other,"DIA_Grim_GoGo_06_01");	//Dobře. Držím se hned za tebou.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	GRIM_MEMBER = TRUE;
};

instance DIA_GRIM_STOP(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_stop_condition;
	information = dia_grim_stop_info;
	permanent = 1;
	description = "Zde se naše cesty oddělují.";
};

func int dia_grim_stop_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_letsgo) && (GRIM_MEMBER == TRUE))
	{
		return 1;
	};
};

func void dia_grim_stop_info()
{
	AI_Output(other,self,"DIA_Grim_Stop_15_00");	//Zde se naše cesty oddělují.
	AI_Output(self,other,"DIA_Grim_Stop_06_01");	//Jak chceš. Kdybys potřeboval, víš, kde mě najít.
	AI_StopProcessInfos(self);
	if((Kapitel == 1) || (Kapitel >= 3))
	{
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Kapitel == 2)
	{
		Npc_ExchangeRoutine(self,"INEXTREMO");
	};
	GRIM_MEMBER = FALSE;
};

instance INFO_GRIM_NCWAIT(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_ncwait_condition;
	information = info_grim_ncwait_info;
	important = 1;
	permanent = 0;
};

func int info_grim_ncwait_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_174") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_ncwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_NCWAIT_09_01");	//Počkej chvilku ...
	AI_Output(self,other,"Info_Grim_NCWAIT_09_02");	//Nedokážu ti říct co, ale z té věži jde něco děsivého. Cítím to.
	AI_Output(self,other,"Info_Grim_NCWAIT_15_03");	//Pokud chceš jít dovnitř, můžeme to zkusit. Ale nejsem si jistý, jestli odtamtud vyvázneme živí.
	AI_Output(self,other,"Info_Grim_NCWAIT_15_04");	//Takže neříkej, že jsem tě nevaroval.
	AI_StopProcessInfos(self);
};

instance INFO_GRIM_PSI(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_psi_condition;
	information = info_grim_psi_info;
	important = 1;
	permanent = 0;
};

func int info_grim_psi_condition()
{
	if(Npc_GetDistToWP(self,"PSI_START") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_psi_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_PSI_09_01");	//Takže toto je Tábor v bažinách ...
	AI_Output(self,other,"Info_Grim_PSI_09_02");	//Nikdy jsem tu nebyl, ale slyšel jsem, že obyvatelé tábora jsou v pohodě.
	AI_Output(self,other,"Info_Grim_PSI_15_03");	//Někteří z nich to nemají v hlavě v pořádku, protože příliš kouřily.
	AI_Output(self,other,"Info_Grim_PSI_15_04");	//Pojďme se podívat.
	AI_StopProcessInfos(self);
};

instance INFO_GRIM_SHIP(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_ship_condition;
	information = info_grim_ship_info;
	important = 1;
	permanent = 0;
};

func int info_grim_ship_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_25_01") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_ship_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Ship_09_01");	//Loď ...
	AI_Output(self,other,"Info_Grim_Ship_09_02");	//Myslíš, že by tam něco, zajímavého mohlo být?
	AI_Output(self,other,"Info_Grim_Ship_15_03");	//Než mě tu vhodili, slyšel jsem příběhy o pirátech.
	AI_Output(self,other,"Info_Grim_Ship_15_04");	//Třeba je to jedna z jejich lodí. Kdoví jak dlouho tu ten vrak je.
	AI_Output(self,other,"Info_Grim_Ship_15_05");	//To je jedno. Uvnitř by mohlo být něco cenného.
	AI_StopProcessInfos(self);
};

instance INFO_GRIM_ORC(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_orc_condition;
	information = info_grim_orc_info;
	important = 1;
	permanent = 0;
};

func int info_grim_orc_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_016") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_orc_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_ORC_09_01");	//Člověče, opravdu TAM chceš jít?
	AI_Output(self,other,"Info_Grim_ORC_09_02");	//Myslím, že skřetí oblast je pro nás moc velké sousto.
	AI_Output(self,other,"Info_Grim_ORC_15_03");	//Pohybují se tam nebezpečné stvůy.
	AI_Output(self,other,"Info_Grim_ORC_15_04");	//Dokonce jsem slyšel, že tam mají celé město plné skřetů.
	AI_Output(self,other,"Info_Grim_ORC_15_05");	//Nevím, jestli je to pravda. Nikdo se odtamtud ještě nevrátil ...
	AI_StopProcessInfos(self);
};

instance INFO_GRIM_NC(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_nc_condition;
	information = info_grim_nc_info;
	important = 1;
	permanent = 0;
};

func int info_grim_nc_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_07_21") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_nc_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_NC_09_01");	//Podívejme Nový tábor. Místo, které mě nikdy moc nezajímalo.
	AI_Output(self,other,"Info_Grim_NC_09_02");	//Zatím jsem o něm slyšel jen špatné zvěsti. Jsou tu prý chlapi, kteří ti podříznou hrdlo pro kousek chleba.
	AI_Output(self,other,"Info_Grim_NC_15_03");	//Pokud chceš jít dovnitř, tak si připrav nějakou zbraň.
	AI_Output(self,other,"Info_Grim_NC_15_04");	//S těmi parchanty tady nikdy nevíš ...
	AI_StopProcessInfos(self);
};

instance INFO_GRIM_GRAVE(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_grave_condition;
	information = info_grim_grave_info;
	important = 1;
	permanent = 0;
};

func int info_grim_grave_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_grave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Grave_09_01");	//Počkej!
	AI_Output(self,other,"Info_Grim_Grave_09_02");	//Slyšel jsem zvěsti, že se to tu jenom hemží nemrtvými.
	AI_Output(self,other,"Info_Grim_Grave_15_03");	//Údajně sem sestoupil Rudobaron ze Starého tábora, ale nikdy se nevrátil. Říkají mu 'Strážce'.
	AI_Output(self,other,"Info_Grim_Grave_15_04");	//Od té doby se tomuto místu všichni vyhýbají.
	AI_StopProcessInfos(self);
};

instance INFO_GRIM_START(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_start_condition;
	information = info_grim_start_info;
	important = 1;
	permanent = 0;
};

func int info_grim_start_condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO_FALL3") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_start_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Start_09_01");	//Není to tak dávno, co jsem tu byl naposledy.
	AI_Output(self,other,"Info_Grim_Start_09_02");	//Už teď mi je líto těch ubohých prasat, které sem ještě vhodí.
	AI_StopProcessInfos(self);
};

instance INFO_GRIM_EASTEREGG(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_easteregg_condition;
	information = info_grim_easteregg_info;
	important = 1;
	permanent = 0;
};

func int info_grim_easteregg_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_ncwait) && Npc_KnowsInfo(hero,info_grim_psi) && Npc_KnowsInfo(hero,info_grim_nc) && Npc_KnowsInfo(hero,info_grim_orc) && Npc_KnowsInfo(hero,info_grim_grave) && Npc_KnowsInfo(hero,info_grim_start))
	{
		return TRUE;
	};
};

func void info_grim_easteregg_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_EasterEgg_09_01");	//Docela jsme se naběhali.
	AI_Output(self,other,"Info_Grim_EasterEgg_09_02");	//Nebyl to zas tak špatný nápad, se k tobě připojit.
	AI_Output(self,other,"Info_Grim_EasterEgg_09_03");	//Slibuji, že pokud se odtud někdy dostaneme ven, dlužím ti velkou laskavost.
	B_GiveXP(XP_GRIMGUIDE);
	AI_StopProcessInfos(self);
};

