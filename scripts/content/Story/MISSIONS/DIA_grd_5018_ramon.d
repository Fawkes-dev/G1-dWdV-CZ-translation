instance DIA_GRD_5018_EXIT(C_Info)
{
	npc = grd_5018_ramon;
	nr = 999;
	condition = dia_grd_5018_exit_condition;
	information = dia_grd_5018_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_grd_5018_exit_condition()
{
	return 1;
};

func void dia_grd_5018_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GRD_5018_MACHSTHIER(C_Info)
{
	npc = grd_5018_ramon;
	nr = 2;
	condition = dia_grd_5018_machsthier_condition;
	information = dia_grd_5018_machsthier_info;
	permanent = 1;
	description = "Co tady děláš?";
};

func int dia_grd_5018_machsthier_condition()
{
	return 1;
};

func void dia_grd_5018_machsthier_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Co tady děláš?
	if((Npc_GetTrueGuild(hero) != GIL_ORG) || (Npc_GetTrueGuild(hero) != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_01");	//Starám se o to, aby byl Starý důl pořádně zásobován.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_02");	//Vždy, když lidé v dole něco potřebují, jsme to my, kdo zboží doručí.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_03");	//Musím dávat pozor, aby nás nikdo z těch prasat z Nového tábora nepřepadl.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_04");	//Kromě všech nebezpečných potvor co tu pobíhají jsou největší problém bandité.
	}
	else
	{
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_05");	//Vypadni!
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_06");	//Neměli bychom Vás bastardy z Nového tábora ani pouštět k dolu.
	};
};

instance GRD_5018_RAMON_NEEDHELP(C_Info)
{
	npc = grd_5018_ramon;
	nr = 1;
	condition = grd_5018_ramon_needhelp_condition;
	information = grd_5018_ramon_needhelp_info;
	important = 0;
	permanent = 0;
	description = "Slyšel jsem, že by se ti hodila pomocná ruka.";
};

func int grd_5018_ramon_needhelp_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_5018_ramon_needhelp_info()
{
	AI_Output(other,self,"GRD_5018_Ramon_NeedHelp_Info_08_01");	//Slyšel jsem, že by se ti hodila pomocná ruka.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_02");	//Thorus tě přijal mezi stráže, co? Výborně.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_03");	//Ale ano, můžeš mi pomoci. Ti parchanti z Nového tábora by se nás mohli znovu pokusit přepadnout, další strážce navíc není špatný nápad.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_04");	//Obzvlášť zkušený bojovník jako ty.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_05");	//Trasa je stejná, ze Starého tábora do Starého dolu.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_06");	//Ještě máš čas, můžeš se pořádně vyzbrojit a zásobit, až budeš připraven, dej mi vědět a můžeme jít.
	CONVOY_OC = LOG_RUNNING;
	Log_CreateTopic(CH2_KONVOIOC,LOG_MISSION);
	Log_SetTopicStatus(CH2_KONVOIOC,LOG_RUNNING);
	B_LogEntry(CH2_KONVOIOC,"Ramon, vedoucí konvoje ke Starému dolu, mě požádal, abych ho doprovodil ke Starému dolu. Společně musíme pročistit cestu konvoji, a ujistit se, že nedojde k žádnému přepadení.");
};

instance GRD_5018_RAMON_LETSGO(C_Info)
{
	npc = grd_5018_ramon;
	nr = 1;
	condition = grd_5018_ramon_letsgo_condition;
	information = grd_5018_ramon_letsgo_info;
	important = 0;
	permanent = 0;
	description = "Jsem připraven, jdeme.";
};

func int grd_5018_ramon_letsgo_condition()
{
	if(Npc_KnowsInfo(hero,grd_5018_ramon_needhelp))
	{
		return TRUE;
	};
};

func void grd_5018_ramon_letsgo_info()
{
	AI_Output(other,self,"GRD_5018_Ramon_LetsGo_Info_08_01");	//Jsem připraven, jdeme.
	AI_Output(self,other,"GRD_5018_Ramon_LetsGo_Info_08_02");	//Dobře, plán je takový, oba jdeme dopředu a ...
	AI_Output(self,other,"GRD_5018_Ramon_LetsGo_Info_08_03");	//Co, jen my dva?
	AI_Output(self,other,"GRD_5018_Ramon_LetsGo_Info_08_04");	//Přesně, jen my dva. Jdeme dopředu a ujistíme se, že cesta ke Starému dolu je bezpečná. Zbytek konvoje bude následovat, jakmile projdeme celou trasu k dolu.
	AI_Output(other,self,"GRD_5018_Ramon_LetsGo_Info_08_05");	//Dobře. Tak poďme!
	Npc_ExchangeRoutine(self,"FOLLOW");
	Npc_ExchangeRoutine(Org_858_Quentin,"FIGHT");
	Npc_ExchangeRoutine(Org_865_Raeuber,"FIGHT");
	Npc_ExchangeRoutine(Org_874_Raeuber,"FIGHT");
};

instance DIA_GRD_5018_FERTIG(C_Info)
{
	npc = grd_5018_ramon;
	nr = 2;
	condition = dia_grd_5018_fertig_condition;
	information = dia_grd_5018_fertig_info;
	important = 1;
};

func int dia_grd_5018_fertig_condition()
{
	if((Npc_GetDistToWP(self,"OW_OM_ENTRANCE01") < 1000) && (CONVOY_OC == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5018_fertig_info()
{
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_01");	//Dobře, to stačí. Odtud začíná tábor Starého dolu.
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_02");	//Dobrá práce. Máme štěstí, že se k táboru přidal někdo jako ty.
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_05");	//Uvidíme se!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5014_convoitraeger,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5015_convoitraeger,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5016_convoiwache,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5017_convoiwache,"ALTERNATIVE");
	CONVOY_OC = LOG_SUCCESS;
	B_GiveXP(XP_CONVOYOC);
	Log_SetTopicStatus(CH2_KONVOIOC,LOG_SUCCESS);
	B_LogEntry(CH2_KONVOIOC,"Ramon byl s mojí prací spokojený a řekl mi, že pošle Stoneovi pozdrav, ten mi prodá Těžkou zbroj Stráží.");
};

