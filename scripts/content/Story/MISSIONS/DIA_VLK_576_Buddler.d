instance INFO_VLK_576_SCHUTZGELD(C_Info)
{
	npc = VLK_576_Buddler;
	nr = 5;
	condition = info_vlk_560_schutzgeld_condition;
	information = info_vlk_560_schutzgeld_info;
	permanent = 1;
	description = "Už jsi zaplatil poplatek za ochranu?";
};

func int info_vlk_576_schutzgeld_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_musstun) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_vlk_576_schutzgeld_info()
{
	AI_Output(other,self,"Info_Vlk_2_Schutzgeld_15_00");	//Už jsi zaplatil poplatek za ochranu?
	AI_Output(self,other,"Info_Vlk_2_Schutzgeld_07_01");	//To je v pořádku, tady je mých 10 kusů rudy.
	AI_Output(self,other,"Info_Vlk_2_Schutzgeld_07_02");	//Ale ujistíš se, že tu mám pořád svoje ticho a pokoj.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

