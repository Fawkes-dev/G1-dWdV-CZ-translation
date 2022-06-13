instance KDF_403_Drago_RUNE(C_Info)
{
	npc = KDF_403_Drago;
	condition = KDF_403_Drago_RUNE_Condition;
	information = KDF_403_Drago_RUNE_Info;
	important = 1;
	permanent = 0;
};

func int KDF_403_Drago_RUNE_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE))
	{
		return TRUE;
	};
};

func void KDF_403_Drago_RUNE_Info()
{
	AI_Output(self,other,"KDF_403_Drago_RUNE_Info_13_01");	//Vezmi si tuto runu, dar od Innose. Kéž tě ochraňuje na tvé cestě.
	CreateInvItem(self,ItArRuneFirebolt);
	B_GiveInvItems(self,other,ItArRuneFirebolt,1);
	AI_StopProcessInfos(self);
};

instance KDF_403_Drago_Exit(C_Info)
{
	npc = KDF_403_Drago;
	nr = 999;
	condition = KDF_403_Drago_Exit_Condition;
	information = KDF_403_Drago_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int KDF_403_Drago_Exit_Condition()
{
	return TRUE;
};

func void KDF_403_Drago_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance KDF_403_DRAGO_GESCHAH(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_geschah_condition;
	information = kdf_403_drago_geschah_info;
	important = 0;
	permanent = 0;
	description = "Máte pro mě práci";
};

func int kdf_403_drago_geschah_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_403_drago_geschah_info()
{
	AI_Output(other,self,"KDF_403_Drago_Geschah_Info_13_01");	//Máte pro mě práci
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_02");	//Měl bych pro tebe jeden úkol.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_03");	//Jde o hledání artefaktů.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_04");	//Tyto artefakty jsou důležité pro naše studie, protože obsahují pro nás neznámou magii.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_05");	//Nedávno jsem poslal pár mužů, aby tyto artefakty našli, ale nikdo z nich se nevrátil.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_06");	//Takže hledání může být velmi nebezpečné.
};

var int joinoc_aufgabe;

instance KDF_403_DRAGO_ARTEFAKTE(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_artefakte_condition;
	information = kdf_403_drago_artefakte_info;
	important = 0;
	permanent = 0;
	description = "Jaké artefakty hledali?";
};

func int kdf_403_drago_artefakte_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_geschah))
	{
		return TRUE;
	};
};

func void kdf_403_drago_artefakte_info()
{
	AI_Output(other,self,"KDF_403_Drago_Artefakte_Info_13_01");	//Jaké artefakty hledali?
	if((Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_STT)) || (Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || (Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_KDF)))
	{
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_02");	//Jde o magické runy, z dávno zapomenutých časů.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_03");	//Stará legenda říká, že v troskách kláštera na pobřeží kdysi žili mniši, jenž se dokázali proměnit v různou zvěř.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_04");	//Je důležité abychom ty artefakty získali, mohly být nebezpečné, kdyby se dostaly do nesprávných rukou.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_05");	//Před mnoha lety jsme tu ruinu prohledali, ale nenašli jsme tam nic.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_06");	//Poslal jsem tedy pár mužů i na jiná vytipovaná místa.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_07");	//Ale bylo to zbytečné ...
		JOINOC_AUFGABE = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_08");	//Nejsem si jistý, jestli ti můžu věřit. Tento úkol ti můžu svěřit, jedině, pokud se přidáš k našemu táboru.
		AI_StopProcessInfos(self);
	};
};

instance KDF_403_DRAGO_WONOCH(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_wonoch_condition;
	information = kdf_403_drago_wonoch_info;
	important = 0;
	permanent = 0;
	description = "Existují i jiná místa, kde bych tyto artefakty mohl najít?";
};

func int kdf_403_drago_wonoch_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_artefakte) && (JOINOC_AUFGABE == TRUE))
	{
		return TRUE;
	};
};

func void kdf_403_drago_wonoch_info()
{
	AI_Output(other,self,"KDF_403_Drago_WoNoch_Info_13_01");	//Existují i jiná místa, kde bych tyto artefakty mohl najít?
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_02");	//Ano, je tu jedno místo, na kterém jsme ještě nehledali.
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_03");	//Nachází se docela blízko ...
	AI_Output(other,self,"KDF_403_Drago_WoNoch_Info_13_04");	//Proč jste to ho neprozkoumali?
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_05");	//To místo je ... skřetí posvátné místo. Je velmi nebezpečné, protože tam žijí jedni z nejmocnějších skřetích šamanů.
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_06");	//Ti muži, jenž se už nikdy nevrátili ... pokusili se navštívit právě tohle místo.
};

instance KDF_403_DRAGO_VERSUCHEN(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_versuchen_condition;
	information = kdf_403_drago_versuchen_info;
	important = 0;
	permanent = 0;
	description = "Já to zkusím.";
};

func int kdf_403_drago_versuchen_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_artefakte) && (JOINOC_AUFGABE == TRUE))
	{
		return TRUE;
	};
};

func void kdf_403_drago_versuchen_info()
{
	AI_Output(other,self,"KDF_403_Drago_versuchen_Info_13_01");	//Já to zkusím.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_02");	//Co?! Jsi si jistý?
	AI_Output(other,self,"KDF_403_Drago_versuchen_Info_13_03");	//Jestli existuje způsob, jak tyto artefakty získat, tak to zvládnu.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_04");	//Tak dobrá. Budu tě očekávat. Pokud mi přineseš ty artefakty, odměním tě.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_05");	//Vezmi si tyto léčivé lektvary. Vyléčí tvé rány, kdyby jsi se dostal do boje.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_06");	//Nechť tě Innos ochraňuje.
	Log_CreateTopic(ARTEFACTS,LOG_MISSION);
	Log_SetTopicStatus(ARTEFACTS,LOG_RUNNING);
	B_LogEntry(ARTEFACTS,"Drago, jeden z mágů Starého tábora, mě požádal, abych navštívil posvátné místo skřetů a poohlédl se po artefaktu.");
	MAGIC_ARTEFACTS = LOG_RUNNING;
	Wld_InsertNpc(orc_5047_shaman,"OW_PATH_ORCRUIN_GOLEM");
	AI_StopProcessInfos(self);
	CreateInvItems(self,ItFo_Potion_Health_02,2);
	B_GiveInvItems(self,other,ItFo_Potion_Health_02,2);
};

instance KDF_403_DRAGO_WO(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_wo_condition;
	information = kdf_403_drago_wo_info;
	important = 0;
	permanent = 0;
	description = "Kde přesně je to skřetí místo?";
};

func int kdf_403_drago_wo_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_versuchen))
	{
		return TRUE;
	};
};

func void kdf_403_drago_wo_info()
{
	AI_Output(other,self,"KDF_403_Drago_Wo_Info_13_01");	//Kde přesně je to skřetí místo?
	AI_Output(self,other,"KDF_403_Drago_Wo_Info_13_02");	//Mimo náš tábor žije lovec jménem Cavalorn. Na levo od jeho chatrče je široká rokle. Když se vydáš tou roklí, najdeš ho.
	B_LogEntry(ARTEFACTS,"Posvátné skřetí místo se nachází poblíž Cavalornovy chaty. Musím projít roklí a pak bych se měl dostat do cíle.");
};

instance KDF_403_DRAGO_KULTSTĺTTE(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_kultstĺtte_condition;
	information = kdf_403_drago_kultstĺtte_info;
	important = 0;
	permanent = 0;
	description = "Navštívil jsem to skřetí místo.";
};

func int kdf_403_drago_kultstĺtte_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_versuchen) && Npc_HasItems(other,itarrunetrfscavenger))
	{
		return TRUE;
	};
};

func void kdf_403_drago_kultstĺtte_info()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_Info_13_01");	//Navštívil jsem to skřetí místo.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_Info_13_02");	//A? Co jsi našel?
	Info_ClearChoices(kdf_403_drago_kultstĺtte);
	Info_AddChoice(kdf_403_drago_kultstĺtte,"Našel jsem runu proměn.",kdf_403_drago_kultstĺtte_ja);
	Info_AddChoice(kdf_403_drago_kultstĺtte,"Nic jsem tam nenašel.",kdf_403_drago_kultstĺtte_nein);
};

func void kdf_403_drago_kultstĺtte_ja()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_JA_15_00");	//Našel jsem tuhle runu proměn.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_01");	//Našel jsi runu? Vynikající! Ukaž mi ji.
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_JA_11_02");	//Tady je.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_03");	//Prokázal jsi mi ... ne nám velkou službu. Tato runa mohla ve špatných rukou napáchat hodně škody.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_04");	//Vem si tohle, jako projev mého uznání a jako poděkování od Innose.
	B_GiveXP(XP_MYSTERIOUSNOTICES2);
	Log_SetTopicStatus(ARTEFACTS,LOG_SUCCESS);
	B_LogEntry(ARTEFACTS,"Dal jsem runu Dragovi, byl velmi potěšen a dal mi štědrou odměnu.");
	MAGIC_ARTEFACTS = LOG_SUCCESS;
	CreateInvItem(self,Schutzring_Magie1_Fire1);
	B_GiveInvItems(self,other,Schutzring_Magie1_Fire1,1);
	B_GiveInvItems(other,self,itarrunetrfscavenger,1);
	Npc_RemoveInvItem(self,itarrunetrfscavenger);
	AI_StopProcessInfos(self);
};

func void kdf_403_drago_kultstĺtte_nein()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_NEIN_15_00");	//Nic jsem tam nenašel.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_01");	//To není dobré. Myslím, že veškeré naše úsilí bylo marné.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_02");	//Vrátím se k starým písmům a budu hledat další stopy.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_03");	//Můžeš jít a vrátit se ke své práci.
	Log_SetTopicStatus(ARTEFACTS,LOG_FAILED);
	B_LogEntry(ARTEFACTS,"Nedal jsem runu Dragovi a řekl jsem mu, že nemohu nic najít.");
	MAGIC_ARTEFACTS = LOG_FAILED;
	AI_StopProcessInfos(self);
};

