instance Info_FindNPC_ST(C_Info)
{
	nr = 900;
	condition = Info_FindNPC_ST_Condition;
	information = Info_FindNPC_ST_Info;
	permanent = 1;
	description = "Kde najdu...";
};

func int Info_FindNPC_ST_Condition()
{
	return 1;
};

func void Info_FindNPC_ST_Info()
{
	var C_Npc CorAngar;
	var C_Npc CorKalom;
	var C_Npc YBerion;
	Info_ClearChoices(Info_FindNPC_ST);
	Info_AddChoice(Info_FindNPC_ST,DIALOG_BACK,Info_FindNPC_ST_BACK);
	CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
	if(CorAngar.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_ST,"... Cor Angara?",Info_FindNPC_ST_CorAngar);
	};
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	if((CorKalom.aivar[AIV_FINDABLE] == TRUE) && (CorAngar_GotoOGY != TRUE))
	{
		Info_AddChoice(Info_FindNPC_ST,"... Cor Kaloma?",Info_FindNPC_ST_CorKalom);
	};
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	if((YBerion.aivar[AIV_FINDABLE] == TRUE) && (Kapitel < 3))
	{
		Info_AddChoice(Info_FindNPC_ST,"... Y'Beriona?",Info_FindNPC_ST_YBerion);
	};
};

func void Info_FindNPC_ST_BACK()
{
	Info_ClearChoices(Info_FindNPC_ST);
};

func void Info_FindNPC_ST_CorAngar()
{
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_FindNPC_ST_CorAngar_15_00");	//Kde najdu Cora Angara?
	CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
	if(Npc_GetDistToNpc(self,CorAngar) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,CorAngar);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_02_01");	//Templářské cvičiště je na druhé úrovni. Přes den bývá obyčejně tam.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_03_01");	//Templářské cvičiště je na druhé úrovni. Přes den tam obyčejně bývá.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_05_01");	//Templářské cvičiště je na druhé úrovni. Přes den tam obyčejně bývá.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_08_01");	//Templářské cvičiště je na druhé úrovni. Přes den tam obyčejně bývá.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_13_01");	//Templářské cvičiště je na druhé úrovni. Přes den tam obyčejně bývá.
		};
	};
	Info_ClearChoices(Info_FindNPC_ST);
};

func void Info_FindNPC_ST_CorKalom()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_FindNPC_ST_CorKalom_15_00");	//Kde najdu Cora Kaloma?
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	if(Npc_GetDistToNpc(self,CorKalom) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,CorKalom);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_02_01");	//Alchymistická dílna je na druhé úrovni, poblíž chrámového vrchu. Pracuje ve dne v noci.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_03_01");	//Alchymistická dílna je na druhé úrovni, poblíž chrámového vrchu. Pracuje ve dne v noci.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_05_01");	//Alchymistická dílna je na druhé úrovni, poblíž chrámového vrchu. Pracuje ve dne v noci.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_08_01");	//Alchymistická dílna je na druhé úrovni, poblíž chrámového vrchu. Pracuje ve dne v noci.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_13_01");	//Alchymistická dílna je na druhé úrovni, poblíž chrámového vrchu. Pracuje ve dne v noci.
		};
	};
	Info_ClearChoices(Info_FindNPC_ST);
};

func void Info_FindNPC_ST_YBerion()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_FindNPC_ST_YBerion_15_00");	//Kde najdu Y´Beriona?
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	if(Npc_GetDistToNpc(self,YBerion) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,YBerion);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_02_01");	//Osvícený žije stranou, v bezpečí chrámového vrchu. Vychází ven jen při výjimečných příležitostech.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_03_01");	//Osvícený žije stranou, v bezpečí chrámového vrchu. Vychází ven jen při výjimečných příležitostech.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_05_01");	//Osvícený žije stranou, v bezpečí chrámového vrchu. Vychází ven jen při výjimečných příležitostech.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_08_01");	//Osvícený žije stranou, v bezpečí chrámového vrchu. Vychází ven jen při výjimečných příležitostech.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_13_01");	//Osvícený žije stranou, v bezpečí chrámového vrchu. Vychází ven jen při výjimečných příležitostech.
		};
	};
	Info_ClearChoices(Info_FindNPC_ST);
};

func void B_AssignFindNpc_ST(var C_Npc slf)
{
	Info_FindNPC_ST.npc = Hlp_GetInstanceID(slf);
};

