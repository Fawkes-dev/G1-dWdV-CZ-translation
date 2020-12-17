instance DIA_BRAGO_EXIT(C_Info)
{
	npc = stt_5027_brago;
	nr = 999;
	condition = dia_brago_exit_condition;
	information = dia_brago_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_brago_exit_condition()
{
	return 1;
};

func void dia_brago_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BRAGO_FIRST(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_first_condition;
	information = dia_brago_first_info;
	permanent = 0;
	important = 0;
	description = "Zdar! Jsem tady nový.";
};

func int dia_brago_first_condition()
{
	return 1;
};

func void dia_brago_first_info()
{
	AI_Output(other,self,"Info_GRD_276_Tips_15_00");	//Zdar! Jsem tady nový.
	AI_Output(self,other,"DIA_Brago_First_10_01");	//... a co chceš ode mně?
};

instance DIA_BRAGO_WASGIBT(C_Info)
{
	npc = stt_5027_brago;
	nr = 2;
	condition = dia_brago_wasgibt_condition;
	information = dia_brago_wasgibt_info;
	permanent = 0;
	description = "Chtěl jsem vědět jestli je tu něco zajímavého.";
};

func int dia_brago_wasgibt_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_first))
	{
		return 1;
	};
};

func void dia_brago_wasgibt_info()
{
	AI_Output(other,self,"DIA_Brago_WasGibt_15_00");	//Chtěl jsem vědět jestli je tu něco zajímavého.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_01");	//Pro nováčky? Nic, jenom problémy.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_02");	//Jestli chceš poradím ti, dej si pozor na koho tu narazíš.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_03");	//Někteří vězni co si tu odpykávají trest jsou tu za mnohem horší věci, než jenom ukradené jablko ...
};

instance DIA_BRAGO_NAME(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_name_condition;
	information = dia_brago_name_info;
	permanent = 0;
	description = "Kdo jsi?";
};

func int dia_brago_name_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_first))
	{
		return 1;
	};
};

func void dia_brago_name_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Brago_Name_10_01");	//Já jsem Brago, jeden z Gomezových Stínů.
	AI_Output(other,self,"DIA_Brago_Name_10_02");	//Stínů?
	AI_Output(self,other,"DIA_Brago_Name_10_03");	//Ano, my Stíny tak jako Stráže pracujeme pro Gomeze.
	AI_Output(self,other,"DIA_Brago_Name_10_04");	//Pokud se přidáš ke Gomezovým lidem, tak i tady v Kolonii můžeš mít pohodlný život.
};

instance DIA_BRAGO_HILFE(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_hilfe_condition;
	information = dia_brago_hilfe_info;
	permanent = 0;
	description = "Ty jsi jedním z Gomezových lidí, že? Mohl by jsi mi pomoct dostat se do hradu?";
};

func int dia_brago_hilfe_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_name))
	{
		return 1;
	};
};

func void dia_brago_hilfe_info()
{
	AI_Output(other,self,"DIA_Brago_Hilfe__15_00");	//Ty jsi jedním z Gomezových lidí, že? Mohl by jsi mi pomoct dostat se do hradu?
	AI_Output(self,other,"DIA_Brago_Hilfe__10_01");	//Chceš se dostat do hradu? Copak tam chceš?
	Info_ClearChoices(dia_brago_hilfe);
	Info_AddChoice(dia_brago_hilfe,"Mám zprávu pro nejvyššího z Mágů Ohně.",dia_brago_hilfe_brief);
	Info_AddChoice(dia_brago_hilfe,"Chci se dostat ke Gomezovi.",dia_brago_hilfe_gomez);
};

func void dia_brago_hilfe_brief()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_00");	//Mám zprávu pro nejvyššího z Mágů Ohně.
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_05_01");	//Aha. Dali ti ji krátce předtím, než tě sem vhodili, že?
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_01");	//Přesně tak.
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_02");	//No, myslím, že ti můžu pomoct.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_03");	//A jak?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_04");	//Existuje tajný průchod, skrz který se můžeš dostat do hradu. Mnoho lidí o něm neví, ti co ví, nemají k němu klíč.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_05");	//A ty ho máš?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_06");	//Správně. Jestli chceš abych ti pomohl, musíš mi ale slíbit, že o tom průchodu nikomu nic neřekneš.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_07");	//Slibuju. Kdepak je ten tajný průchod?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_08");	//Můžu tě k němu hned vzít. Stačí říct.
	Info_ClearChoices(dia_brago_hilfe);
	Info_AddChoice(dia_brago_hilfe,"Tak pojďme!",dia_brago_hilfe_go);
	Info_AddChoice(dia_brago_hilfe,"Zvládnu to sám.",dia_brago_hilfe_walkalone);
};

func void dia_brago_hilfe_gomez()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Gomez_15_00");	//Chci se dostat ke Gomezovi.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_01");	//Hehe ... na to zapomeň.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_02");	//I kdyby jsi se dostal na hrad, přes Stráže Rudobaronů se nedostaneš.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_03");	//Ke Gomezovi tě nepustí, dokud nedostaneš svolení od Thoruse.
	Info_ClearChoices(dia_brago_hilfe);
};

func void dia_brago_hilfe_go()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Go_15_00");	//Tak pojďme!
	AI_Output(self,other,"DIA_Brago_Hilfe_Go_05_01");	//Dobře, pojď za mnou.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
};

func void dia_brago_hilfe_walkalone()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_WalkAlone_15_00");	//Zvládnu to sám.
	AI_Output(self,other,"DIA_Brago_Hilfe_WalkAlone_05_01");	//Jak chceš, pokud si myslíš, že to zvládneš sám ...
	Info_ClearChoices(dia_brago_hilfe);
};

instance DIA_BRAGO_TRAP(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_trap_condition;
	information = dia_brago_trap_info;
	permanent = 0;
	important = 1;
	description = "So, hier sind wir. [important - no description required]";
};

func int dia_brago_trap_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_hilfe) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_297"))
	{
		return 1;
	};
};

func void dia_brago_trap_info()
{
	AI_Output(self,other,"DIA_Brago_Trap_15_00");	//Tak jsme tady.
	AI_Output(other,self,"DIA_Brago_Trap_10_01");	//A kde je ten skrytý průchod?
	AI_Output(self,other,"DIA_Brago_Trap_10_02");	//Hehe ... žádný skrytý průchod není.
	AI_Output(other,self,"DIA_Brago_Trap_10_03");	//Cože ?!
	AI_Output(self,other,"DIA_Brago_Trap_10_04");	//Bylo to od tebe hodně hloupé, říct mi o dopisu pro Mágy Ohně.
	AI_Output(self,other,"DIA_Brago_Trap_10_05");	//Neboj, už takovou chybu neuděláš.
	AI_Output(self,other,"DIA_Brago_Trap_10_06");	//O to se postarám.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	Npc_ExchangeRoutine(self,"START");
};

