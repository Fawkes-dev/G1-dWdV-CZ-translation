instance Info_Bau_9_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Bau_9_EXIT_Condition;
	information = Info_Bau_9_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Bau_9_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Bau_9_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Bau_9_WichtigePersonen_Condition;
	information = Info_Bau_9_WichtigePersonen_Info;
	permanent = 1;
	description = "Kdo má na starosti dohled nad plněním plánu práce na těch polích?";
};

func int Info_Bau_9_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_9_WichtigePersonen_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00");	//Kdo má na starosti dohled nad plněním plánu práce na těch polích?
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01");	//Každý! Rýžový Lord sice hlídá všechno, ale já mám dojem, že celé dny prosedí ve svém bunkru a počítá pytle.
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02");	//On a Homer to všechno vymysleli.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Bau_9_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Bau_9_DasLager_Condition;
	information = Info_Bau_9_DasLager_Info;
	permanent = 1;
	description = "Povídej mi o táboře.";
};

func int Info_Bau_9_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_9_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_9_DasLager_15_00");	//Povídej mi o táboře.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_01");	//Je až po střechu plný bastardů. Kdyby bylo po mém, nechal bych žoldáky, aby všechny ty lotry z tábora vyházeli.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_02");	//Nedělají nic...jenom problémy.
};

instance Info_Bau_9_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Bau_9_DieLage_Condition;
	information = Info_Bau_9_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Bau_9_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_9_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_9_DieLage_15_00");	//Jak se máš?
	AI_Output(self,other,"Info_Bau_9_DieLage_09_01");	//Pracujeme do úmoru, abysme dostali něco k jídlu!
};

instance Info_Bau_9_Wasser(C_Info)
{
	nr = 800;
	condition = Info_Bau_9_Wasser_Condition;
	information = Info_Bau_9_Wasser_Info;
	permanent = 1;
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
};

func int Info_Bau_9_Wasser_Condition()
{
	if((Lefty_Mission == LOG_RUNNING) && Npc_HasItems(other,ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Bau_9_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_9_Wasser_15_00");	//Lefty mě poslal. Přinesl jsem ti trochu vody.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Bau_9_Wasser_09_01");	//Díky, kamaráde! Ještě chvilku a zešílel bych žízní!
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00");	//Už nic nezbylo. Vezmu trochu od ostatních.
	};
};

func void B_AssignAmbientInfos_Bau_9(var C_Npc slf)
{
	Info_Bau_9_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Bau_9_Wasser.npc = Hlp_GetInstanceID(slf);
};

