instance STT_5036_MIGUEL_EXIT(C_Info)
{
	npc = stt_5036_miguel;
	nr = 999;
	condition = stt_5036_miguel_exit_condition;
	information = stt_5036_miguel_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int stt_5036_miguel_exit_condition()
{
	return 1;
};

func void stt_5036_miguel_exit_info()
{
	AI_StopProcessInfos(self);
};

instance STT_5036_MIGUEL_HELLO(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_hello_condition;
	information = stt_5036_miguel_hello_info;
	important = 0;
	permanent = 0;
	description = "Kdo jsi?";
};

func int stt_5036_miguel_hello_condition()
{
	return 1;
};

func void stt_5036_miguel_hello_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Hello_Info_15_01");	//Kdo jsi?
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_02");	//Jsem Miguel. Obchoduji s rostlinami, které můžeš najít v lesích a horách.
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_03");	//Pokud nějaké najdeš, můžeš mi je prodat. Na oplátku mám spoustu jiných věcí.
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_04");	//Můžu ti také říci něco o bylinách a rostlinách, které najdeš tady v Kolonii.
	Log_CreateTopic(GE_TraderOW,LOG_NOTE);
	B_LogEntry(GE_TraderOW,"Miguel, jeden ze Stínů, obchoduje s bylinami a rostlinami. Obvykle ho najdu v táboře před Starým dolem.");
};

instance STT_5036_MIGUEL_TRADE(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_trade_condition;
	information = stt_5036_miguel_trade_info;
	important = 0;
	permanent = 1;
	description = "Chtěl bych s tebou obchodovat.";
	trade = 1;
};

func int stt_5036_miguel_trade_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_hello))
	{
		return 1;
	};
};

func void stt_5036_miguel_trade_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Trade_Info_15_01");	//Chci obchodovat.
	AI_Output(self,other,"STT_5036_Miguel_Trade_Info_07_02");	//Pak ukaž co máš …
};

instance STT_5036_MIGUEL_ERZAEHL(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_erzaehl_condition;
	information = stt_5036_miguel_erzaehl_info;
	important = 0;
	permanent = 1;
	description = "Řekni mi něco o rostlinách.";
};

func int stt_5036_miguel_erzaehl_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_hello))
	{
		return 1;
	};
};

func void stt_5036_miguel_erzaehl_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Erzaehl_Info_15_01");	//Řekni mi něco o rostlinách.
	AI_Output(self,other,"STT_5036_Miguel_Erzaehl_Info_07_02");	//Co chceš vědět?
	Info_ClearChoices(stt_5036_miguel_erzaehl);
	Info_AddChoice(stt_5036_miguel_erzaehl,DIALOG_BACK,info_miguel_erzaehl_back);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Něco o léčivých rostlinách.",info_miguel_erzaehl_heal);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Něco o rostlinách many.",info_miguel_erzaehl_mana);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Co je dobré vědět o speciálních rostlinách?",info_miguel_erzaehl_special);
};

func void info_miguel_erzaehl_back()
{
	Info_ClearChoices(stt_5036_miguel_erzaehl);
};

func void info_miguel_erzaehl_heal()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Heal_15_01");	//Něco o léčivých rostlinách.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_02");	//Existují tři různé druhy léčivých rostlin. Existují lehké, střední a silné léčivé rostliny.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_03");	//Léčivé rostliny můžeš přímo sníst, anebo je můžeš zpracovat na alchymickém stolu.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_04");	//Pokud je správně zpracuješ, můžeš připravit léčivé lektvary. Čím silnější bude rostlina, tím účinnější bude léčivý lektvar.
};

func void info_miguel_erzaehl_mana()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Mana_15_01");	//Něco o rostlinách many.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_02");	//Existují tři různé druhy rostlin mana. Existují lehké, střední a silné manové rostliny.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_03");	//Manové rostliny můžeš přímo sníst, anebo je můžeš zpracovat na alchymickém stolu.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_04");	//Pokud je správně zpracuješ, můžeš připravit manové lektvary. Čím silnější bude rostlina, tím účinnější bude manový lektvar.
};

func void info_miguel_erzaehl_special()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Special_15_01");	//Co je dobré vědět o speciálních rostlinách?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_02");	//Existují rostliny, které je velmi obtížné najít. Některé z nich mají mimořádné účinky.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_03");	//Kromě vzácných rostlin existují i bobule, semena a mech.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_04");	//Existují lektvary, které lze vyrobit pouze s těmito vzácnými ingrediencemi. Výška ceny, kterou obchodníci jako já za tyto rostliny platí, odpovídá jejich vzácnosti.
};

instance STT_5036_MIGUEL_GARAZ(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_garaz_condition;
	information = stt_5036_miguel_garaz_info;
	important = 0;
	permanent = 0;
	description = "Můžeš mi říct něco o Garazovi?";
};

func int stt_5036_miguel_garaz_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_tax) && (ERZ_SCHULDEN == LOG_RUNNING))
	{
		return 1;
	};
};

func void stt_5036_miguel_garaz_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_15_01");	//Můžeš mi říct něco o Garazovi?
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_02");	//Co chceš vědět?
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_03");	//Potřebuji klíč k jeho truhle. Bohužel ho má vždy u sebe.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_04");	//Takže o tohle ti jde. Hehe.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_05");	//No, pokud chceš jeho klíč, existují dva způsoby, jak jej získat.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_06");	//Můžeš mu ten klíč ukrást ...
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_07");	//... nebo můžeš využít jeho slabosti.
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_08");	//Jaké slabosti? 
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_09");	//Dej mu lahev vína. Vyprázdní ji rychleji než si dovedeš představit. Potom už nebude tak těžké klíč získat.
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_10");	//Díky za pomoc. Dávej na sebe pozor!
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_11");	//Neděkuj. Bude to pro něho cenná lekce, za to šlapání po mé - zelenině - jak tomu sám říká.
	B_LogEntry(CH1_SCHULDEN,"Miguel říká, že by mělo stačit Garazovi koupit láhev vína. Poté by už získání jeho klíče neměl být problém.");
};

