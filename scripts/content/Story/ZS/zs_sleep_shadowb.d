var int scavspawn;

func void zs_sleep_shadowb()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_sleep_shadowb");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
		AI_PlayAni(self,"T_SLEEP");
		if(Wld_IsTime(19,59,20,0) && (SCAVSPAWN == (Wld_GetDay() - 1)))
		{
			Wld_InsertNpc(Scavenger,"PATH_OC_PSI_09");
			SCAVSPAWN = Wld_GetDay();
		};
	};
};

func void zs_sleep_shadowb_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_sleep_shadowb_loop");
};

func void zs_sleep_shadowb_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_sleep_shadowb_End");
	B_FullStop(self);
};

