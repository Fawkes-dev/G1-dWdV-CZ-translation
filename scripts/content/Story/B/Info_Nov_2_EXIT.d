instance Info_Nov_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_2_EXIT_Condition;
	information = Info_Nov_2_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Nov_2_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Nov_2_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_2_EinerVonEuchWerden_Condition;
	information = Info_Nov_2_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chci s k vám přidat.";
};

func int Info_Nov_2_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_2_EinerVonEuchWerden_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00");	//Chci s k vám přidat.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01");	//Opravdu jsi se rozhodl sloužit Spáčovi? Cesta ke štěstí a dobré vyhlídky ti leží přímo u nohou.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02");	//Jdi a promluv si s Corem Kalomem. Rozhodne, jaká práce pro tebe bude nejlepší.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Nov_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_2_WichtigePersonen_Condition;
	information = Info_Nov_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo je váš vůdce?";
};

func int Info_Nov_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_2_WichtigePersonen_Info()
{
	var C_Npc YBerion;
	var C_Npc CorKalom;
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00");	//Kdo je váš vůdce?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01");	//Y'Berion, Cor Kalom a Cor Angar jsou naši rádci.
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02");	//Jsou naším spojením se Spáčem. Během vzývání jsou jediní, kdo mají se Spáčem kontakt.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_03");	//Od Y'berionovi smrti a odchodu Cor Kaloma tu už není nikdo, kdo by tábor držel pohromadě.
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_04");	//Ti co neodišli s Cor Kalomem tu zůstali a snaží se pokračovat ve své práci.
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_05");	//Nikdo neví co teď s Bratrstvem bude.
	};
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Nov_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_2_DasLager_Condition;
	information = Info_Nov_2_DasLager_Info;
	permanent = 1;
	description = "Co bych měl o tomhle místě vědět?";
};

func int Info_Nov_2_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_2_DasLager_15_00");	//Co bych měl o tomhle místě vědět?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Nov_2_DasLager_02_01");	//Toto je místo víry, bratře. Nemáme toho mnoho, ale to co máme, sdílíme s každým, kdo je ochoten naslouchat Spáčovu učení.
		AI_Output(self,other,"Info_Nov_2_DasLager_02_02");	//Promluv si s jedním z Guru a tvá duše bude povznesena.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Nov_2_DasLager_02_03");	//Inu, měl bys vědět, že tohle bývalo místo plné víry.
		AI_Output(self,other,"Info_Nov_2_DasLager_02_04");	//Ale od Y'berionovi smrti se v táboře hodně změnilo.
		AI_Output(self,other,"Info_Nov_2_DasLager_02_05");	//Už to tu není co to bývalo pár týdnů zpátky.
	};
};

instance Info_Nov_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_2_DieLage_Condition;
	information = Info_Nov_2_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Nov_2_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_2_DieLage_15_00");	//Jak to jde?
	if(Npc_GetTrueGuild(other) == GIL_GUR)
	{
		AI_Output(self,other,"Info_Nov_2_DieLage_02_02");	//Mistře! Sloužím Spáčovi jak je mým posláním.
		AI_Output(self,other,"Info_Nov_2_DieLage_02_03");	//Plním své povinnosti, které jste my vy a mnoho dalších dali jak jen nejlépe umím.
	}
	else
	{
		AI_Output(self,other,"Info_Nov_2_DieLage_02_01");	//Nemám moc času. Musím pracovat.
	};
};

instance INFO_NOV_2_GURUWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_2_guruwerden_condition;
	information = info_nov_2_guruwerden_info;
	permanent = 1;
	description = "Chtěl bych stát jedním z Guru.";
};

func int info_nov_2_guruwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_nov_2_guruwerden_info()
{
	AI_Output(other,self,"Info_Nov_2_GuruWerden_15_00");	//Chtěl bych stát jedním z Guru.
	AI_Output(self,other,"Info_Nov_2_GuruWerden_02_01");	//Chceš se stát Guru? Je to dlouhá a náročná cesta. Budeš potřebovat roky než se ti to podaří.
	AI_Output(self,other,"Info_Nov_2_GuruWerden_02_02");	//Ale až přijde jednoho dne čas, budeš-li mít štěstí stane se z tebe jeden ze svatých proroků Spáče.
};

func void B_AssignAmbientInfos_Nov_2(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DieLage.npc = Hlp_GetInstanceID(slf);
	info_nov_2_guruwerden.npc = Hlp_GetInstanceID(slf);
};

