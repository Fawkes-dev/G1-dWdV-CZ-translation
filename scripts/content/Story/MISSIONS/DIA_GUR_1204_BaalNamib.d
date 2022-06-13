instance DIA_BaalNamib_EXIT(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 999;
	condition = DIA_BaalNamib_EXIT_Condition;
	information = DIA_BaalNamib_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalNamib_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BaalNamib_NoTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_NoTalk_Condition;
	information = DIA_BaalNamib_NoTalk_Info;
	permanent = 1;
	important = 1;
};

func int DIA_BaalNamib_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalNamib_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalNamib_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalNamib_NoTalk);
	Info_AddChoice(DIA_BaalNamib_NoTalk,DIALOG_ENDE,DIA_BaalNamib_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Je všechno v pořádku, příteli?",DIA_BaalNamib_NoTalk_Imp);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Spáč buď s tebou!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Zdar! Jsem tu nový!",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Zdar! Jsem tu nový!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//(vzdech)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Spáč buď s tebou!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//(vzdech)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Je všechno v pořádku, příteli?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//(vzdech)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};

var int namib_gotocalom;

instance DIA_BaalNamib_FirstTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_FirstTalk_Condition;
	information = DIA_BaalNamib_FirstTalk_Info;
	permanent = 0;
	important = 1;
};

func int DIA_BaalNamib_FirstTalk_Condition()
{
	if(BaalNamib_Ansprechbar == TRUE)
	{
		return 1;
	};
};

func void DIA_BaalNamib_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00");	//(vzdech)
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01");	//Spáč si tě vyvolil. Chceš se k nám opravdu přidat?
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"NEŘÍKEJ NIC.",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Ano, chci následovat Spáče!",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Mute_15_00");	//(vzdech)
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01");	//Všechno v pořádku?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00");	//Ano, chci následovat Spáče!
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01");	//Jdi za Corem Kalomem. Řekni mu, že jsem tě vyslal, protože jsi opravdový služebník víry!
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	NAMIB_GOTOCALOM = TRUE;
	B_LogEntry(CH1_JoinPsi,"Lesterovo herectví fungovalo. Baal Namib se mnou promluvil a je přesvědčený, že jsem opravdově věřící. Nyní můžu jít navštívit guru Cora Kaloma do jeho alchymistické dílny!");
	B_GiveXP(XP_ImpressBaalNamib);
};

instance GUR_1204_NAMIB_BETTERARMOR(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = gur_1204_namib_betterarmor_condition;
	information = gur_1204_namib_betterarmor_info;
	important = 0;
	permanent = 1;
	description = "Rád bych lepší zbroj.";
};

func int gur_1204_namib_betterarmor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void gur_1204_namib_betterarmor_info()
{
	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");	//Rád bych lepší zbroj.
	AI_Output(self,other,"GUR_1204_Namib_BETTERARMOR_Info_06_02");	//Když dokážeš, že jsi toho hoden a když poskytneš štědrý dar ...
	Info_ClearChoices(gur_1204_namib_betterarmor);
	Info_AddChoice(gur_1204_namib_betterarmor,DIALOG_BACK,gur_1204_namib_betterarmor_back);
	Info_AddChoice(gur_1204_namib_betterarmor,B_BuildBuyArmorString(NAME_NAMIBHEAVYNOVICE,VALUE_NOV_ARMOR_H),gur_1204_namib_betterarmor_h);
	Info_AddChoice(gur_1204_namib_betterarmor,B_BuildBuyArmorString(NAME_NAMIBNOVICE,VALUE_NOV_ARMOR_M),gur_1204_namib_betterarmor_m);
};

func void gur_1204_namib_betterarmor_m()
{
	AI_Output(hero,self,"GUR_1204_Namib_BETTERARMOR_Info_M_13_02");	//Chci oděv novice.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_01_05");	//Ještě není čas, abys oblékl oděv novice.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_NOV_ARMOR_M)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Vrať se, až budeš mít dost rudy.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Tahle zbroj ochrání tvoje tělo, tak jako Spáč ochrání tvoji duši!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NOV_ARMOR_M);
		B_GiveInvItems(self,hero,nov_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

func void gur_1204_namib_betterarmor_h()
{
	AI_Output(hero,self,"GRD_219_BaalNamib_BETTERARMOR_Info_H_15_01");	//Chci těžký oděv novice.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");	//Ještě nepřišel čas, abys oblékl těžkou zbroj novice.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_NOV_ARMOR_H)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Vrať se, až budeš mít dost rudy.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Tahle zbroj ochrání tvoje tělo, tak jako Spáč ochrání tvoji duši!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NOV_ARMOR_H);
		B_GiveInvItems(self,hero,nov_armor_h,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

func void gur_1204_namib_betterarmor_back()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Rozmyslel jsem se.
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

instance Info_BaalNamib_BROTHERHOOD(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = Info_BaalNamib_BROTHERHOOD_Condition;
	information = Info_BaalNamib_BROTHERHOOD_Info;
	important = 0;
	permanent = 0;
	description = "Můžu pro Bratrstvo vykonat nějaké úkoly?";
};

func int Info_BaalNamib_BROTHERHOOD_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(hero,PC_Psionic_SEND) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_15_01");	//Můžu pro Bratrstvo vykonat nějaké úkoly?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_02_02");	//Náš mistr, moudrý Y´Berion, nechal poslat pro novice. Protože jsi nyní členem komunity, jdi za ním a nabídni mu své služby.
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Dobrá, půjdu za ním hned.",Info_BaalNamib_BROTHERHOOD_OK);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Kde najdu Y´Beriona?",Info_BaalNamib_BROTHERHOOD_YBWO);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Víš, co ode mě Y´Berion chce?",Info_BaalNamib_BROTHERHOOD_YBWAS);
};

func void Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01");	//Kde najdu Y´Beriona?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02");	//Je v chrámu, jako vždy.
};

func void Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01");	//Víš, co ode mě Y´Berion chce?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02");	//Bude se konat velké vzývání. Aby ale mohlo začít, potřebujeme jeden magický předmět.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03");	//Y´Berion hledá odvážné muže, kteří by mu ten artefakt opatřili.
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04");	//To zní jako snadný úkol.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05");	//Kdyby to bylo snadné, už bysme ten předmět měli. Promluv si nejdříve s Y´Berionem. Všechno ti vysvětlí.
};

func void Info_BaalNamib_BROTHERHOOD_OK()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_OK_15_01");	//Dobrá, hned mu řeknu.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_OK_02_02");	//Kéž tě Spáč ochrání!
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Log_CreateTopic(CH2_Focus,LOG_MISSION);
	Log_SetTopicStatus(CH2_Focus,LOG_RUNNING);
	B_LogEntry(CH2_Focus,"Baal Namib mě poslal k Y'Berionovi, hledá artefakt, který Bratrstvo potřebuje pro velké Vzývání. Templářům hlídajícím vstup do chrámu musím říct, že mě poslal Baal Namib, pak mě nechají projít.");
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

instance GUR_1204_BAALNAMIB_GURAUFNAHME(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = gur_1204_baalnamib_guruaufnahme_condition;
	information = gur_1204_baalnamib_guruaufnahme_info;
	important = 1;
	permanent = 0;
};

func int gur_1204_baalnamib_guruaufnahme_condition()
{
	if(((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV) && (Npc_GetDistToNpc(hero,self) < 1000) && Npc_KnowsInfo(hero,DIA_BaalTondral_SendToKalom) && Npc_KnowsInfo(hero,DIA_BaalTyon_Vision) && Npc_KnowsInfo(hero,dia_baallukor_hypnoticteacher) && Npc_KnowsInfo(hero,DIA_BaalNamib_FirstTalk) && Npc_KnowsInfo(hero,DIA_BaalCadar_SleepSpell) && Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		return TRUE;
	};
};

func void gur_1204_baalnamib_guruaufnahme_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_01");	//Počkej chvíli!
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_10");	//Tvé činy v dole ukázaly, že Spáč je s tebou.
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_03");	//Máš tu čest držet zvláštní místo v naší komunitě.
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_04");	//Jdi za Y'Berionem, řekne ti víc.
	Log_CreateTopic(GE_BECOMEGURU,LOG_NOTE);
	B_LogEntry(GE_BECOMEGURU,"Baal Namib mi řekl, že si mě vybral Spáč, a že v táboře Bratrstva má pro mě speciální místo. Mám jít k Y'Berionovi, ten mi řekne víc.");
};

instance INFO_BAALNAMIB_TATTOOS(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_tattoos_condition;
	information = info_baalnamib_tattoos_info;
	important = 1;
	permanent = 0;
};

func int info_baalnamib_tattoos_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_baalnamib_tattoos_info()
{
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_15_01");	//Vidím, že tě posílá Cor Kalom.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_15_02");	//Co se děje?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_01");	//Chci s tebou vykonat rituál, pomocí kterého zpečetíme tvé členství v Bratrství.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_02");	//Každý nový člen naší komunity se tohoto rituálu účastní.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_03");	//Než ale začneme, musím se ještě na něco zeptat.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_04");	//Proč jsi si vybral cestu Spáče?
	Info_ClearChoices(info_baalnamib_tattoos);
	Info_AddChoice(info_baalnamib_tattoos,"Protože ...",info_baalnamib_tattoos_weil);
};

func void info_baalnamib_tattoos_weil()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	Info_AddChoice(info_baalnamib_tattoos,"... tráva mě o tom přesvědčila.",info_baalnamib_tattoos_kraut);
	Info_AddChoice(info_baalnamib_tattoos,"... věděl jsem, že v ostatních táborech nikdy nebudu volný.",info_baalnamib_tattoos_frei);
	Info_AddChoice(info_baalnamib_tattoos,"... prostě se to stalo.",info_baalnamib_tattoos_ergeben);
	Info_AddChoice(info_baalnamib_tattoos,"... pochopil jsem, že Spáč je mým skutečným Spasitelem.",info_baalnamib_tattoos_erlÖser);
	Info_AddChoice(info_baalnamib_tattoos,"... neměl jsem jinou možnost.",info_baalnamib_tattoos_wahl);
	Info_AddChoice(info_baalnamib_tattoos,"... měl jsem vizi, od Spáče.",info_baalnamib_tattoos_vision);
};

func void info_baalnamib_tattoos_kraut()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_24_01");	//Tráva mě o tom přesvědčila.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_02");	//Pak doufám, že tě také přiblíží ke Spáčovi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_03");	//Nyní provedeme rituál, který tě sváže s osudem nás všech.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_04");	//Tady máš lektvar připravený ze Spáčova sekrétu. Vypij ho než začneme s meditací.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_05");	//Až budeš připraven, posaď se před portál.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_24_06");	//Co je to za portál?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_07");	//Tento portál je posvátným artefaktem našeho bratrství a umožní ti přilížit se Spáčovi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_08");	//Označí tvé tělo znamením Spáče.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_10");	//Tahle znamení jsou znamení Spáčových služebníků.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_09");	//Nyní začneme s rituálem.
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE1 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_frei()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_21_01");	//Protože jsem věděl, že v ostatních táborech nikdy nebudu volný.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_02");	//Ano, Spáč nás povede ke svobodě.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_03");	//Nyní provedeme rituál, který tě sváže s osudem nás všech.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_04");	//Tady máš lektvar připraven ze Spáčova sekrétu. Vypij ho než začneme s meditací.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_05");	//Až budeš připraven, posaď se před portál.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_21_06");	//Co je to za portál?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_07");	//Tento portál je posvátným artefaktem našeho bratrství a umožní ti být nablízku Spáčovi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_08");	//Označí tvé tělo znamením Spáče.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_10");	//Tahle znamení jsou znamení Spáčových služebníků.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_09");	//Nyní začněme s rituálem.
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE2 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_ergeben()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_22_01");	//Protože se to prostě stalo.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_02");	//Možná, že časem získáš spojení se Spáčem.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_03");	//Nyní provedeme rituál, který tě sváže s osudem nás všech.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_04");	//Tady máš lektvar připraven ze Spáčova sekrétu. Vypij ho než začneme s meditací.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_05");	//Až budeš připraven, posaď se před portál.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_22_06");	//Co je to za portál?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_07");	//Tento portál je posvátným artefaktem našeho bratrství a umožní ti být nablízku Spáčovi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_08");	//Označí tvé tělo znamením Spáče.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_10");	//Tahle znamení jsou znamení Spáčových služebníků.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_09");	//Nyní začněme s rituálem.
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE3 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_erlÖser()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_23_01");	//Protože jsem pochopil, že Spáč je mým skutečným Spasitelem.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_02");	//Pak si tedy pravý věřící. Je před tebou cesta plná vědění.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_03");	//Nyní provedeme rituál, který tě sváže s osudem nás všech.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_04");	//Tady máš lektvar připraven ze Spáčova sekrétu. Vypij ho než začneme s meditací.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_05");	//Až budeš připraven, posaď se před portál.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_23_06");	//Co je to za portál?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_07");	//Tento portál je posvátným artefaktem našeho bratrství a umožní ti být nablízku Spáčovi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_08");	//Označí tvé tělo znamením Spáče.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_10");	//Tahle znamení jsou znamení Spáčových služebníků.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_09");	//Nyní začněme s rituálem.
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE4 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_wahl()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_25_01");	//Protože jsem neměl jinou možnost.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_02");	//Doufám, že zjistíš, že jako následovník naší víry tu člověk žije lépe, než na jakémkoli jiném místě v Kolonii.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_03");	//Nyní provedeme rituál, který tě sváže s osudem nás všech.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_04");	//Tady máš lektvar připraven ze Spáčova sekrétu. Vypij ho než začneme s meditací.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_05");	//Až budeš připraven, posaď se před portál.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_25_06");	//Co je to za portál?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_07");	//Tento portál je posvátným artefaktem našeho bratrství a umožní ti být nablízku Spáčovi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_08");	//Označí tvé tělo znamením Spáče.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_10");	//Tahle znamení jsou znamení Spáčových služebníků.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_09");	//Nyní začněme s rituálem.
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE5 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_vision()
{
	AI_Output(other,self,"Info_BaalNamib_VISION_25_01");	//Protože jsem měl vizi, se Spáčem.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_02");	//Spáč si tě vybral a poslal k nám. Tvůj osud se brzy naplní.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_03");	//Nyní provedeme rituál, který tě sváže s osudem nás všech.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_04");	//Tady máš lektvar připraven ze Spáčova sekrétu. Vypij ho než začneme s meditací.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_05");	//Až budeš připraven, posaď se před portál.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_VISION_25_06");	//Co je to za portál?
	AI_Output(self,other,"Info_BaalNamib_VISION_25_07");	//Tento portál je posvátným artefaktem našeho bratrství a umožní ti být nablízku Spáčovi.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_08");	//Označí tvé tělo znamením Spáče.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_10");	//Tahle znamení jsou znamení Spáčových služebníků.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_09");	//Nyní začněme s rituálem.
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE6 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

instance INFO_BAALNAMIB_BEGINNING(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_beginning_condition;
	information = info_baalnamib_beginning_info;
	important = 1;
	permanent = 0;
};

func int info_baalnamib_beginning_condition()
{
	if(Npc_KnowsInfo(hero,info_baalnamib_tattoos))
	{
		return TRUE;
	};
};

func void info_baalnamib_beginning_info()
{
	if(HERO_FACE1 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Spáči, přívádím ti služebníka.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Dokázal, že je hoden a je připraven sloužit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Je to skutečný věřící a stejně jako i My, se chce osvobodit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Ukaž mu cestu a ochraň jeho mysl před nebezpečím.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Protože od této chvíle by měl být součástí naší komunity.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Opakuj po mě.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Oddávám se ti Spáči ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Oddávám se ti Spáči ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//... protože tvoje cesta je cesta ke svobodě.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//... protože tvoje cesta je cesta ke svobodě.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",124,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(HERO_FACE2 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Spáči, přívádím ti služebníka.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Dokázal, že je hoden a je připraven sloužit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Je to skutečný věřící a stejně jako i My, se chce osvobodit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Ukaž mu cestu a ochraň jeho mysl před nebezpečím.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Protože od této chvíle by měl být součástí naší komunity.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Opakuj po mě.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Oddávám se ti Spáči ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Oddávám se ti Spáči ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//... protože tvoje cesta je cesta ke svobodě.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//... protože tvoje cesta je cesta ke svobodě.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",118,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(HERO_FACE3 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Spáči, přívádím ti služebníka.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Dokázal, že je hoden a je připraven sloužit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Je to skutečný věřící a stejně jako i My, se chce osvobodit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Ukaž mu cestu a ochraň jeho mysl před nebezpečím.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Protože od této chvíle by měl být součástí naší komunity.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Opakuj po mě.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Oddávám se ti Spáči ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Oddávám se ti Spáči ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//... protože tvoje cesta je cesta ke svobodě.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//... protože tvoje cesta je cesta ke svobodě.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",122,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(HERO_FACE4 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Spáči, přívádím ti služebníka.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Dokázal, že je hoden a je připraven sloužit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Je to skutečný věřící a stejně jako i My, se chce osvobodit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Ukaž mu cestu a ochraň jeho mysl před nebezpečím.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Protože od této chvíle by měl být součástí naší komunity.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Opakuj po mě.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Oddávám se ti Spáči ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Oddávám se ti Spáči ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//... protože tvoje cesta je cesta ke svobodě.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//... protože tvoje cesta je cesta ke svobodě.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",121,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(HERO_FACE5 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Spáči, přívádím ti služebníka.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Dokázal, že je hoden a je připraven sloužit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Je to skutečný věřící a stejně jako i My, se chce osvobodit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Ukaž mu cestu a ochraň jeho mysl před nebezpečím.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Protože od této chvíle by měl být součástí naší komunity.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Opakuj po mě.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Oddávám se ti Spáči ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Oddávám se ti Spáči ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//... protože tvoje cesta je cesta ke svobodě.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//... protože tvoje cesta je cesta ke svobodě.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",123,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(HERO_FACE6 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Spáči, přívádím ti služebníka.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Dokázal, že je hoden a je připraven sloužit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Je to skutečný věřící a stejně jako i My, se chce osvobodit.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Ukaž mu cestu a ochraň jeho mysl před nebezpečím.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Protože od této chvíle by měl být součástí naší komunity.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Opakuj po mě.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Oddávám se ti Spáči ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Oddávám se ti Spáči ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//... a jsem připraven ti sloužit navěky ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//... protože moje duše, bude osvobozena jedině tvojí mocí ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//... ukaž mi cestu ke svobodě a osviť mě ...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//... protože tvoje cesta je cesta ke svobodě.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//... protože tvoje cesta je cesta ke svobodě.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",125,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	};
};

instance INFO_BAALNAMIB_WILLKOMMEN(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_willkommen_condition;
	information = info_baalnamib_willkommen_info;
	important = 1;
	permanent = 0;
};

func int info_baalnamib_willkommen_condition()
{
	if(Npc_KnowsInfo(hero,info_baalnamib_beginning))
	{
		return TRUE;
	};
};

func void info_baalnamib_willkommen_info()
{
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_01");	//Vítám tě v Spáčově Bratrstvu.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_02");	//Je před tebou dlouhá, ale naplňující cesta.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_03");	//Rozhodnul jsi se správně.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_04");	//Čas ukáže, jaký osud pro tebe Spáč chystá.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_05");	//Možná, že se staneš jedním z jeho vyvolených, tak jako já.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_06");	//Nebo budeš povolán mezi ochránce tábora, tak jako Cor Angar.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_07");	//Uvidíme.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_08");	//Kéž na tebe Spáč dohlíží, novici.
	AI_Standup(self);
	AI_Standup(hero);
	NAMIB_RITUAL = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_RITUAL,LOG_SUCCESS);
	B_LogEntry(CH1_RITUAL,"Baal Namib provedl rituál, během kterého jsem byl oficiálně přijat do Spáčova Bratrství.");
	B_GiveXP(XP_NAMIBRITUAL);
	Npc_ExchangeRoutine(GUR_1204_BaalNamib,"START");
	Npc_ExchangeRoutine(tpl_5051_templer,"START");
	Npc_ExchangeRoutine(tpl_5052_templer,"START");
	AI_StopProcessInfos(self);
};

