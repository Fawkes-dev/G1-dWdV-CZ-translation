instance DIA_Tpl_1416_Torwache_Exit(C_Info)
{
	npc = TPL_1416_Templer;
	nr = 999;
	condition = DIA_Tpl_1416_Torwache_Exit_Condition;
	information = DIA_Tpl_1416_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Tpl_1416_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Tpl_1416_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Tpl_1416_Torwache_Life(C_Info)
{
	npc = TPL_1416_Templer;
	nr = 1;
	condition = DIA_Tpl_1416_Torwache_Life_Condition;
	information = DIA_Tpl_1416_Torwache_Life_Info;
	permanent = 1;
	description = "Jaký je život strážce Bratrstva?";
};

func int DIA_Tpl_1416_Torwache_Life_Condition()
{
	return 1;
};

func void DIA_Tpl_1416_Torwache_Life_Info()
{
	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Life_15_00");	//Jaký je život strážce Bratrstva?
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_01");	//Mám důležitý úkol. Osvícený a jeho žáci na mě spoléhají.
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_02");	//Můj dřívější život už je minulost. Teď jsem GOR NA - Spáčův templář.
};

instance DIA_TPL_1416_TORWACHE_DARRION(C_Info)
{
	npc = TPL_1416_Templer;
	nr = 1;
	condition = dia_tpl_1416_torwache_darrion_condition;
	information = dia_tpl_1416_torwache_darrion_info;
	permanent = 0;
	important = 1;
};

func int dia_tpl_1416_torwache_darrion_condition()
{
	if(((FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void dia_tpl_1416_torwache_darrion_info()
{
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Darrion_15_00");	//Hej ty! Darrion chce s tebou mluvit.
	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Darrion_08_01");	//Co chce?
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Darrion_08_02");	//Určitě ti to sám řekne, čeká na tebe jako obvykle v kovárně.
};

