instance INFO_VLK_508_SCHUTZGELD(C_Info)
{
	npc = VLK_508_Buddler;
	nr = 5;
	condition = info_vlk_508_schutzgeld_condition;
	information = info_vlk_508_schutzgeld_info;
	permanent = 1;
	description = "Vybírám rudu za ochranu.";
};

func int info_vlk_508_schutzgeld_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_musstun) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_vlk_508_schutzgeld_info()
{
	AI_Output(other,self,"Info_Vlk_1_Schutzgeld_15_00");	//Jak to vypadá s platbou za ochranu?
	AI_Output(self,other,"Info_Vlk_1_Schutzgeld_07_01");	//Tady je 10 kusů rudy.
	AI_Output(self,other,"Info_Vlk_1_Schutzgeld_07_02");	//Sakra, to byly moje poslední úspory ...
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

