instance Info_Bau_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Bau_4_EXIT_Condition;
	information = Info_Bau_4_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_Bau_4_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_Bau_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Bau_4_WichtigePersonen_Condition;
	information = Info_Bau_4_WichtigePersonen_Info;
	permanent = 1;
	description = "Máte nějakého vůdce?";
};

func int Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_4_WichtigePersonen_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00");	//Máte nějakého vůdce?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01");	//Rýžový Lord je něco jako náš vůdce. Ale většina z nás pro něj pracuje jen ze strachu z něho a z jeho hrdlořezů.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02");	//Já ale ne. Už jsem tu nějakých pár let, protože jsem měl už dost výprasků od těch lotrů z tábora... rýžová pole jsou pro mě to pravé.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Bau_4_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Bau_4_DasLager_Condition;
	information = Info_Bau_4_DasLager_Info;
	permanent = 1;
	description = "Je něco, co bych měl vědět o tomhle místě?";
};

func int Info_Bau_4_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00");	//Je něco, co bych měl o tomhle místě vědět?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01");	//Dávej si v táboře pozor, chlapče. Motá se tam spousta zabijáků, kteří se nemohou dočkat, až si podají nováčky, jako jsi ty.
};

instance Info_Bau_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Bau_4_DieLage_Condition;
	information = Info_Bau_4_DieLage_Info;
	permanent = 1;
	description = "Jak to jde?";
};

func int Info_Bau_4_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01");	//Je tu spousta práce. Musíme dodávat hromady rýže na obživu všech těch lidí.
};

instance Info_Bau_4_Wasser(C_Info)
{
	nr = 800;
	condition = Info_Bau_4_Wasser_Condition;
	information = Info_Bau_4_Wasser_Info;
	permanent = 1;
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
};

func int Info_Bau_4_Wasser_Condition()
{
	if((Lefty_Mission == LOG_RUNNING) && Npc_HasItems(other,ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Bau_4_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00");	//Lefty mě poslal. Přinesl jsem ti trochu vody.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Bau_4_Wasser_04_01");	//Díky, kamaráde. Už jsem to potřeboval!
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00");	//Ale tobě už žádná nezůstala. Nezoufej, chlapče. Řeknu někomu jinému.
	};
};

func void B_AssignAmbientInfos_Bau_4(var C_Npc slf)
{
	Info_Bau_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Bau_4_Wasser.npc = Hlp_GetInstanceID(slf);
};

