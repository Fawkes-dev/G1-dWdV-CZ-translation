instance INFO_VLK_555_SCHUTZGELD(C_Info)
{
	npc = VLK_555_Buddler;
	nr = 5;
	condition = info_vlk_555_schutzgeld_condition;
	information = info_vlk_555_schutzgeld_info;
	permanent = 1;
	description = "Je načase zaplatit peníze za ochranu.";
};

func int info_vlk_555_schutzgeld_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_musstun) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_vlk_555_schutzgeld_info()
{
	AI_Output(other,self,"Info_Vlk_3_Schutzgeld_15_00");	//Je načase zaplatit peníze za ochranu.
	AI_Output(self,other,"Info_Vlk_3_Schutzgeld_07_01");	//Tady máš 10 kusů rudy.
	AI_Output(self,other,"Info_Vlk_3_Schutzgeld_07_02");	//Doufám, že to na pár dní postačí.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

