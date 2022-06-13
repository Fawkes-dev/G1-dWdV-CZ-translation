func void ZS_PracticeBow()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeBow");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PRACTICEBOW"))
	{
		AI_GotoFP(self,"PRACTICEBOW");
		AI_AlignToFP(self);
		AI_PlayAni(self,"T_BOW_RELOAD");
		AI_Wait(self,1);
		AI_PlayAni(self,"T_BOW_BOWAIM");
		AI_Wait(self,1);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_PlayAni(self,"T_BOW_RELOAD");
		AI_Wait(self,1);
		AI_PlayAni(self,"T_BOW_BOWAIM");
		AI_Wait(self,5);
	};
};

func void ZS_PracticeBow_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeBow_Loop");
	AI_EquipBestRangedWeapon(self);
	AI_DrawWeapon(self);
	AI_Wait(self,1);
};

func void ZS_PracticeBow_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeBow_End");
	B_FullStop(self);
	B_RemoveWeapon(self);
};

