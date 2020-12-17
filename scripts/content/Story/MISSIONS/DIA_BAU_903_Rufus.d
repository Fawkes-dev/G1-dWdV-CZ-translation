instance DIA_Rufus_EXIT(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 999;
	condition = DIA_Rufus_EXIT_Condition;
	information = DIA_Rufus_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Rufus_EXIT_Condition()
{
	return 1;
};

func void DIA_Rufus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Rufus_Wasser(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 800;
	condition = Info_Rufus_Wasser_Condition;
	information = Info_Rufus_Wasser_Info;
	permanent = 1;
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
};

func int Info_Rufus_Wasser_Condition()
{
	if((Lefty_Mission == LOG_RUNNING) && Npc_HasItems(other,ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00");	//Lefty mě poslal. Přinesl jsem ti trochu vody.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//Díky, příteli! Umírám žízní.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00");	//Vodu! Hej, příteli! Už tu žádná není! Neříkej mi, že zase dostal každý kromě mě!
	};
};

instance DIA_Rufus_Hello(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Hello_Condition;
	information = DIA_Rufus_Hello_Info;
	permanent = 0;
	description = "Zdar! Jsem tady nový. Jen jsem chtěl vědět, co se tu děje.";
};

func int DIA_Rufus_Hello_Condition()
{
	return 1;
};

func void DIA_Rufus_Hello_Info()
{
	AI_Output(other,self,"DIA_Rufus_Hello_15_00");	//Zdar! Jsem tady nový. Jen jsem chtěl vědět, co se tu děje.
	AI_Output(self,other,"DIA_Rufus_Hello_02_01");	//Zeptej se někoho jiného. Nedělám nic jiného, než že tu pracuju na polích, nevím nic.
	AI_Output(self,other,"DIA_Rufus_Hello_02_02");	//Člověče, nejraději bych Rýžovému Lordovi řekl, aby si tu svoji zpropadenou práci dělal sám!
};

instance DIA_Rufus_Why(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Why_Condition;
	information = DIA_Rufus_Why_Info;
	permanent = 0;
	description = "Když se ti to nelíbí, tak proč tu pracuješ?";
};

func int DIA_Rufus_Why_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Why_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Rufus_Why_15_00");	//Když se ti to nelíbí, tak proč tu pracuješ?
	AI_Output(self,other,"DIA_Rufus_Why_02_01");	//Stalo se to první den, když jsem se sem dostal. Přišel ke mně Lefty, jeden z hrdlořezů, co dělají pro Rýžového Lorda, a zeptal se mě, jestli nechci pracovat na rýžových polích.
	AI_Output(self,other,"DIA_Rufus_Why_02_02");	//Jasně, řekl jsem. Byl jsem tu nový a chtěl jsem dělat něco užitečného.
	AI_Output(self,other,"DIA_Rufus_Why_02_03");	//Příští den, když jsem si dával chvilku odpočinku, ke mně ten chlapík přišel znovu.
	AI_Output(self,other,"DIA_Rufus_Why_02_04");	//Nechceš snad nechávat své kolegy, aby pracovali sami, že ne?
	AI_Output(self,other,"DIA_Rufus_Why_02_05");	//Řekl jsem mu, že jsem vyčerpaný z předešlého dne a že si potřebuji jen trochu odpočinout. Vůbec mě neposlouchal.
	AI_Output(self,other,"DIA_Rufus_Why_02_06");	//Chytil mě za límec a odvlekl zpátky na pole.
	AI_Output(self,other,"DIA_Rufus_Why_02_07");	//Od toho dne stával pokaždé před mými dveřmi, dokud jsem si nezvykl chodit sám. Nechtěl jsem mít s těmi chlapíky žádné problémy.
	AI_Output(self,other,"DIA_Rufus_Why_02_08");	//Jsou to opravdoví hrdlořezové, uděláš nejlíp, když s nimi budeš zadobře.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};

instance DIA_Rufus_Ricelord(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 2;
	condition = DIA_Rufus_Ricelord_Condition;
	information = DIA_Rufus_Ricelord_Info;
	permanent = 1;
	description = "Kdo je Rýžový Lord?";
};

func int DIA_Rufus_Ricelord_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Ricelord_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00");	//Kdo je Rýžový Lord?
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01");	//Byl jedním z prvních zdejších přistěhovalců. Pomáhal budovat tábor a založil rýžová pole.
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02");	//Teď už jenom postává ve skladišti a cpe si břicho, to tlustý prase!
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};

instance DIA_RUFUS_NEEDHELP(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = dia_rufus_needhelp_condition;
	information = dia_rufus_needhelp_info;
	permanent = 0;
	description = "Můžu ti pomoct?";
};

func int dia_rufus_needhelp_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void dia_rufus_needhelp_info()
{
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_01");	//Můžu ti pomoct?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_02");	//Nemyslím si ... I když možná, když už se ptáš.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_03");	//Možná bych od tebe něco chtěl. Chci aby jsi Rýžovému lordovi a té jeho bandě dal lekci.
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_04");	//Co? Snad nechceš abych je přepral jenom já sám.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_05");	//Ne, ne. Nechci aby jsi je zmlátil.
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_06");	//A co tedy?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_07");	//Měli by si namlátit navzájem sami mezi sebou. Hehe.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_08");	//Rýžový Lord má truhlu, ve které má pár věcí. Mimo jiné i cenný prsten. Ukradni mu ho.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_09");	//A pak se ujisti, že se prsten dostane k Leftymu.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_10");	//Pak jenom stačí když mezi řečí s Rýžovým Lordem 'náhodou' spomeneš, že Lefty má nový prsten.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_11");	//Nemůžu se dočkat, až pak uvidím ten Leftyho přihlouplý výraz v tváři. Hehe.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_12");	//Oh, ale nejdříve budeš muset nějak získat klíč od jeho truhly. Určitě ho má někde ve své chatrči.
	AI_StopProcessInfos(self);
	RIOT_RICELORD = LOG_RUNNING;
	Log_CreateTopic(CH1_RICELORD,LOG_MISSION);
	Log_SetTopicStatus(CH1_RICELORD,LOG_RUNNING);
	B_LogEntry(CH1_RICELORD,"Rolník Rufus by dal rád Rýžovému Lordu a jeho bandě budižkničemů lekci. Chce abych mu ukradl klíč od truhly. Až ho budu mít najdu v truhle prsten, ten musím strčit Leftymu do kapsy. A nakonec bych měl Rýžovému Lordu naznačit, že to Lefty mu prsten ukradl.");
};

instance DIA_RUFUS_DONE(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = dia_rufus_done_condition;
	information = dia_rufus_done_info;
	permanent = 0;
	description = "Postaral jsem se o Leftyho.";
};

func int dia_rufus_done_condition()
{
	if(Npc_KnowsInfo(hero,dia_ricelord_lefty))
	{
		return 1;
	};
};

func void dia_rufus_done_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Rufus_Done_02_01");	//Postaral jsem se o Leftyho.
	AI_Output(self,other,"DIA_Rufus_Done_02_02");	//Už jsem si všimnul. Hehe.
	AI_Output(self,other,"DIA_Rufus_Done_02_03");	//Konečně ten zmezek dostal, co si zasloužil.
	AI_Output(self,other,"DIA_Rufus_Done_02_06");	//Tady, mám tu nějakou rýžovou pálenku navíc.
	AI_Output(other,self,"DIA_Rufus_Done_02_07");	//Díky, měj se!
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,ItFoMutton,1);
		B_GiveInvItems(self,other,ItFoMutton,1);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,ItFoApple,2);
		B_GiveInvItems(self,other,ItFoApple,2);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,5);
		B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,5);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItMw_1H_Scythe_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Scythe_01,1);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItMw_1H_Sword_Short_02,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_Short_02,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMiNugget,40);
		B_GiveInvItems(self,other,ItMiNugget,40);
	}
	else
	//BUG [Fawkes]: ak padne hodnota zufallsbelohnung medzi 0 - 10 tak hrac nedostane ziadnu odmenu
	//if(zufallsbelohnung >= 10)
	{
		CreateInvItems(self,ItFoBooze,3);
		B_GiveInvItems(self,other,ItFoBooze,3);
	};
	AI_StopProcessInfos(self);
	RIOT_RICELORD = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_RICELORD,LOG_SUCCESS);
	B_LogEntry(CH1_RICELORD,"Rufus byl více než nadšený, když Lefty dosta co si zasloužil. Nakonec jsem z toho neodešel zkrátka a dostal jsem od Rufuse odměnu.");
	B_GiveXP(XP_LEFTYRICELORD);
};

