instance DIA_GORBOBA_EXIT(C_Info)
{
	npc = tpl_5026_gorboba;
	nr = 999;
	condition = dia_gorboba_exit_condition;
	information = dia_gorboba_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_gorboba_exit_condition()
{
	return 1;
};

func void dia_gorboba_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GORBOBA_HELLO(C_Info)
{
	npc = tpl_5026_gorboba;
	nr = 1;
	condition = dia_gorboba_hello_condition;
	information = dia_gorboba_hello_info;
	permanent = 1;
	description = "Co tady děláš?";
};

func int dia_gorboba_hello_condition()
{
	return 1;
};

func void dia_gorboba_hello_info()
{
	AI_Output(other,self,"DIA_GorBoba_Hello_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_GorBoba_Hello_05_01");	//Byl jsem vybrán, abych strážil tuto bránu. Je to důležitý úkol.
	AI_Output(self,other,"DIA_GorBoba_Hello_05_02");	//Dávám pozor, aby se žádná z bestií z lesa anebo z bažiny nepřiblížila k táboru.
	AI_Output(self,other,"DIA_GorBoba_Hello_05_03");	//Spáč si mně vybral pro tento čestný úkol. Dává mi sílu stát zde ve dne - v noci.
	if(Npc_GetTrueGuild(hero) != GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorBoba_Hello_05_04");	//Teď mě neobtěžuj, musím dávat pozor.
	};
	AI_StopProcessInfos(self);
};

