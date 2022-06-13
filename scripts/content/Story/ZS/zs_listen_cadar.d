func void zs_listen_cadar()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_LISTEN_Cadar");
	self.aivar[AIV_FOUNDPERSON] = FALSE;
	OccupiedPerception();
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_listen_cadar_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_LISTEN_Cadar");
	if(self.aivar[AIV_FOUNDPERSON] == FALSE)
	{
		PrintDebugNpc(PD_TA_CHECK,"...bisher keinen Redner gefunden...!");
		B_GotoFP(self,"LISTEN");
		Npc_PerceiveAll(self);
		if(Wld_DetectNpc(self,-1,zs_teaching_cadar,-1))
		{
			PrintDebugNpc(PD_TA_CHECK,"...aber JETZT einen Redner gefunden...!");
			if(Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)
			{
				PrintDebugNpc(PD_TA_CHECK,"...der nah genug ist!");
				AI_TurnToNPC(self,other);
				AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
				C_LookAtNpc(self,other);
				self.aivar[AIV_FOUNDPERSON] = TRUE;
			};
		};
	};
	AI_Wait(self,1);
};

func void zs_listen_cadar_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Listen_Cadar_End");
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
		C_StopLookAt(self);
	};
};

