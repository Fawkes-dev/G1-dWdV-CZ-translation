func void zs_teaching_cadar()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Teaching_Cadar");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	if(!Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
};

func void zs_teaching_cadar_loop()
{
	var int reaktion;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Teaching_Cadar_Loop");
	B_GotoFP(self,"TEACHING");
	reaktion = Hlp_Random(1000);
	if(reaktion >= 900)
	{
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS1_Info_02_03");
	}
	else if(reaktion >= 800)
	{
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS1_Info_02_04");
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS1_Info_02_05");
	}
	else if(reaktion >= 700)
	{
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS2_Info_02_03");
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS2_Info_02_04");
	}
	else if(reaktion >= 600)
	{
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS2_Info_02_05");
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS3_Info_02_03");
	}
	else if(reaktion >= 500)
	{
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS3_Info_02_04");
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS3_Info_02_05");
	}
	else if(reaktion >= 400)
	{
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS4_Info_02_02");
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS4_Info_02_03");
		B_Say(self,NULL,"Gur_1208_BaalCadar_KREIS4_Info_02_04");
	};
	AI_Wait(self,3);
};

func void zs_teaching_cadar_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Teaching_Cadar_End");
};

