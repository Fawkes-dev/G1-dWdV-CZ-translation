instance VLK_583_Glen_Exit(C_Info)
{
	npc = VLK_583_Glen;
	nr = 999;
	condition = VLK_583_Glen_Exit_Condition;
	information = VLK_583_Glen_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int VLK_583_Glen_Exit_Condition()
{
	return 1;
};

func void VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance VLK_583_Glen_INFO(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_INFO_Condition;
	information = VLK_583_Glen_INFO_Info;
	important = 0;
	permanent = 1;
	description = "Na co bych měl pamatovat, až budu v dole?";
};

func int VLK_583_Glen_INFO_Condition()
{
	return 1;
};

func void VLK_583_Glen_INFO_Info()
{
	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01");	//Na co bych měl pamatovat, až budu v dole?
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02");	//Dávat si pozor na důlní červy.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03");	//Čím jdeš níž, tím blíž se k těm bestiím dostáváš. Ty prašivé příšery přicházejí rovnou z Beliarova království!
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04");	//Uslyšíš hrabání a škrábání. Drží se v temnotě a vyčkávají na tebe. Viděl jsem je zabíjet...
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05");	//Jsou nemilosrdní a rychlí. Jestli chceš zůstat naživu, neměl bys chodit dolu. Měl bys odejít, než se ti něco stane.
};

instance VLK_583_Glen_LOCKPICK(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_LOCKPICK_Condition;
	information = VLK_583_Glen_LOCKPICK_Info;
	important = 0;
	permanent = 0;
	description = "Slyšel jsem, že bych tu dostal paklíče?";
};

func int VLK_583_Glen_LOCKPICK_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_GLEN))
	{
		return 1;
	};
};

func void VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01");	//Slyšel jsem, že bych tu dostal paklíče?
	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02");	//Jistě, protože jsi dost bystrý, když jsi to našel, tak můžeš nějaký dostat. 10 nugetů za kus.
};

var int glen_trade;

instance VLK_583_Glen_BUY(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_BUY_Condition;
	information = VLK_583_Glen_BUY_Info;
	important = 0;
	permanent = 1;
	description = "(kup paklíče)";
	trade = 1;
};

func int VLK_583_Glen_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_583_Glen_LOCKPICK))
	{
		return 1;
	};
};

func void VLK_583_Glen_BUY_Info()
{
	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01");	//Chci koupit paklíče.
	if(GLEN_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Glen, jeden z kopáčů Starého dolu, obchoduje s paklíči.");
		GLEN_TRADE = TRUE;
	};
};

instance VLK_583_GLEN_GARRET(C_Info)
{
	npc = VLK_583_Glen;
	condition = vlk_583_glen_garret_condition;
	information = vlk_583_glen_garret_info;
	important = 0;
	permanent = 0;
	description = "Znamená pro tebe něco jméno Garret?";
};

func int vlk_583_glen_garret_condition()
{
	if(LOST_DIGGER == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_583_glen_garret_info()
{
	AI_Output(other,self,"VLK_583_Glen_GARRET_Info_15_01");	//Říká ti něco jméno Garret?
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_02");	//Garret? Jistě, jeden z kopáčů. Je v Bariéře už celé věky.
	AI_Output(other,self,"VLK_583_Glen_GARRET_Info_15_03");	//Snažím se ho najít. Ian říká, že zmizel.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_04");	//Garret zmizel? Inu, už je to dlouho co jsem ho viděl.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_05");	//Ale mohu tě ujistit že důl neopustil, to vím jistě.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_06");	//Vím o každém, kdo tady prochází. A Garret tudy určitě neprošel.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_07");	//Takže tady stále musí někde být.
	B_LogEntry(CH1_LOSTDIGGER,"Glen si je jistý, že Garret je někde v dole. Nikdy ho neopustil.");
};

