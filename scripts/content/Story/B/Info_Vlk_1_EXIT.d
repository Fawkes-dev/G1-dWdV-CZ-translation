instance Info_Vlk_1_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_1_EXIT_Condition;
	information = Info_Vlk_1_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Vlk_1_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Vlk_1_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_1_EinerVonEuchWerden_Condition;
	information = Info_Vlk_1_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Jak se můžu přidat k táboru?";
};

func int Info_Vlk_1_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00");	//Jak se můžu přidat k táboru?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01");	//To je jednoduché. Seber krumpáč a jdi do dolu. Polovinu své rudy vydáš za ochranu a zbytek ti umožní přežití.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02");	//Ceny, jaké si Gomez říká za ochranu, jsou lichvářské. Ale je to pořád lepší, než celý den přežvykovat rýži jako v Novém táboře.
};

instance Info_Vlk_1_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_1_WichtigePersonen_Condition;
	information = Info_Vlk_1_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo to tady vede?";
};

func int Info_Vlk_1_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00");	//Kdo to tady vede?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_02");	//Jako jeden z Rudobaronů byste to měl vědět nejlépe.
		AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_03");	//Nechci žádné potíže ...
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01");	//Rudobaroni. Organizují výměnu rudy s Králem. Čím důležitější jsi, tím víc dostáváš.
	};
};

instance Info_Vlk_1_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_1_DasLager_Condition;
	information = Info_Vlk_1_DasLager_Info;
	permanent = 1;
	description = "Je tady k vidění něco zajímavějšího než chatrče?";
};

func int Info_Vlk_1_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_1_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00");	//Je tady něco zajímavějšího k vidění než pece?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01");	//Jistě, večer můžeš jít do arény a pozorovat strážce, jak si navzájem rozbíjejí ksichty.
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02");	//Za to vstupné to opravdu stojí.
	if(Npc_GetTrueGuild(other) != GIL_None)
	{
		AI_Output(self,other,"Info_Vlk_1_DasLager_01_03");	//Také patříš do jednoho z táborů, že?
		AI_Output(self,other,"Info_Vlk_1_DasLager_01_04");	//Možná tě Scatty zaměstná v Aréně jako jednoho z bojovníků.
		AI_Output(self,other,"Info_Vlk_1_DasLager_01_05");	//Poptej se ho, je to dobrý způsob, jak si vydělat trochu rudy navíc.
	};
};

instance Info_Vlk_1_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_1_DieLage_Condition;
	information = Info_Vlk_1_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Vlk_1_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00");	//Jak se máš?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01");	//Poslední dva týdny jsem strávil prací v dole. Jediné, co chci, je klid. Takže se mi kliď z očí.
};

func void B_AssignAmbientInfos_Vlk_1(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DieLage.npc = Hlp_GetInstanceID(slf);
};

