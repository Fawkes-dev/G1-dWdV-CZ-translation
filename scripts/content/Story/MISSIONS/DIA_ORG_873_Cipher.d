instance Org_873_Cipher_Exit(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 999;
	condition = Org_873_Cipher_Exit_Condition;
	information = Org_873_Cipher_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

func void Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Org_873_Cipher_Hello(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Hello_Condition;
	information = Org_873_Cipher_Hello_Info;
	permanent = 0;
	description = "Jak to jde?";
};

func int Org_873_Cipher_Hello_Condition()
{
	return 1;
};

func void Org_873_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Cipher_Hello_12_01");	//Vsadili jsme další příčel do Gomezova kola.
	AI_Output(self,other,"DIA_Cipher_Hello_12_02");	//Tři mrtví strážci a spousta zboží na prodej. Připíjím na to!
	AI_Output(other,self,"DIA_Cipher_Hello_15_03");	//Ty patříš k těm chlapům, co neustále napadali Starý tábor?
	AI_Output(self,other,"DIA_Cipher_Hello_12_04");	//Ne. Jen když to stojí za to.
};

instance Org_873_Cipher_Fisk(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Fisk_Condition;
	information = Org_873_Cipher_Fisk_Info;
	permanent = 1;
	description = "Fisk ze Starého tábora hledá obchodního partnera.";
};

func int Org_873_Cipher_Fisk_Condition()
{
	if(Fisk_GetNewHehler == LOG_RUNNING)
	{
		return 1;
	};
};

func void Org_873_Cipher_Fisk_Info()
{
	AI_Output(other,self,"DIA_Cipher_Fisk_15_00");	//Fisk ze Starého tábora hledá obchodního partnera.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_01");	//Nemám zájem.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_02");	//Ale Sharky by mohl mít zájem. Jestli ho uvidíš, řekni mu.
};

var int Cipher_Trade;

instance Org_873_Cipher_FromBalor(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_FromBalor_Condition;
	information = Org_873_Cipher_FromBalor_Info;
	permanent = 1;
	description = "Co můžeš nabídnout?";
};

func int Org_873_Cipher_FromBalor_Condition()
{
	if(Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		return 1;
	};
};

func void Org_873_Cipher_FromBalor_Info()
{
	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00");	//Co můžeš nabídnout?
	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01");	//Opakuji otázku: co MŮŽEŠ nabídnout? Zajímají mě jen velké dodávky.
	if(Balor_TellsNCDealer == TRUE)
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02");	//Balor říkal, že by tě zajímala droga z bažin.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03");	//Mhmmm. Chceš teda obchodovat?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04");	//S tím ti nemůžu pomoci.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05");	//Až mi budeš schopen pomoci, přijď zpátky.
	};
};

instance Org_873_Cipher_TRADE(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_TRADE_Condition;
	information = Org_873_Cipher_TRADE_Info;
	permanent = 1;
	description = "Uzavřeme obchod.";
	trade = 1;
};

func int Org_873_Cipher_TRADE_Condition()
{
	if(Cipher_Trade == TRUE)
	{
		return 1;
	};
};

func void Org_873_Cipher_TRADE_Info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Uzavřeme obchod.
	AI_Output(self,other,"DIA_Cipher_TRADE_12_01");	//Co chceš?
};

instance ORG_873_CIPHER_BOTE(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = org_873_cipher_bote_condition;
	information = org_873_cipher_bote_info;
	permanent = 0;
	important = 1;
};

func int org_873_cipher_bote_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return 1;
	};
};

func void org_873_cipher_bote_info()
{
	AI_Output(self,other,"DIA_Cipher_BOTE_15_00");	//Hej ty! Ty jsi ze sektovního tábora, že? Měl bych pro tebe práci, jestli máš zájem.
	AI_Output(other,self,"DIA_Cipher_BOTE_12_01");	//O co jde?
	AI_Output(self,other,"DIA_Cipher_BOTE_15_01");	//Balor, jeden ze sektářů mi nedávno poslal balíček. Jestli máš cestu kolem, mohl by jsi mu dát rudu co mu dlužím.
	AI_Output(self,other,"DIA_Cipher_BOTE_15_02");	//Tady, je to 50 kusů.
	AI_Output(self,other,"DIA_Cipher_BOTE_15_03");	//Řekni mu, že jsem tě poslal já, on už bude vědět o co jde.
	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	CIPHER_PAYMENT = LOG_RUNNING;
	Log_CreateTopic(CH1_CIPHERDELIEVERED,LOG_MISSION);
	Log_SetTopicStatus(CH1_CIPHERDELIEVERED,LOG_RUNNING);
	B_LogEntry(CH1_CIPHERDELIEVERED,"Cipher, jeden z lupičů Nového tábora si ze mně udělal poslíčka. Mám donést Balorovi, Novicovi z Tábora v bažinách, jeho platbu za - 'donášku' - kterou doručil Cipherovi. 50 kusů rudy.");
};

