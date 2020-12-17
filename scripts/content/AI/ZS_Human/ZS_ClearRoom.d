func void ZS_ClearRoom()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ClearRoom");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ClearRoomEnterRoom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ClearRoomUseMob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_MOVENPC,B_StopGotoHero);
	C_ZSInit();
	B_WhirlAround(self,other);
	AI_PointAtNpc(self,other);
	B_Say(self,other,"$HEYYOU");
	AI_StopPointAt(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SetTarget(self,other);
};

func int ZS_ClearRoom_Loop()
{
	var int portalguild;
	PrintDebugNpc(PD_ZS_LOOP,"ZS_ClearRoom_Loop");
	Npc_GetTarget(self);
	portalguild = Wld_GetPlayerPortalGuild();
	PrintGuild(PD_ZS_Check,portalguild);
	if((portalguild == GIL_None) || (Wld_GetGuildAttitude(self.guild,portalguild) != ATT_FRIENDLY) || (Wld_GetGuildAttitude(other.guild,Wld_GetFormerPlayerPortalGuild()) == ATT_FRIENDLY) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		B_FullStop(self);
		AI_ContinueRoutine(self);
		return LOOP_END;
	};
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) && Npc_CanSeeNpc(self,other))
	{
		B_FullStop(self);
		return LOOP_END;
	};
	AI_GotoNpc(self,other);
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void ZS_ClearRoom_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ClearRoom_End");
	if((Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) && (Wld_GetGuildAttitude(other.guild,Wld_GetPlayerPortalGuild()) != ATT_FRIENDLY))
	{
		AI_TurnToNPC(self,other);
		if(C_AmIStronger(self,other))
		{
			PrintDebugNpc(PD_ZS_Check,"...Nsc ist stärker!");
			B_DrawWeapon(self,other);
			B_Say(self,other,"$GETOUTOFHERE");
			AI_StartState(self,ZS_ClearRoomWait,0,"");
		}
		else
		{
			PrintDebugNpc(PD_ZS_Check,"...Nsc ist schwächer!");
			B_Say(self,other,"$WHYAREYOUINHERE ");
			AI_StartState(self,ZS_ClearRoomWait,0,"");
		};
	};
};

func void ZS_ClearRoomWait()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ClearRoomWait");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ClearRoomEnterRoom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ClearRoomUseMob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	C_ZSInit();
};

func void ZS_ClearRoomWait_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_ClearRoomWait_Loop");
	if(Npc_GetStateTime(self) > 8)
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC wartet seit 8 Sekunden!");
		if((Wld_GetPlayerPortalGuild() == GIL_None) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY))
		{
			if(C_AmIStronger(self,other) && (Wld_GetGuildAttitude(other.guild,Wld_GetFormerPlayerPortalGuild()) != ATT_FRIENDLY) && (Wld_GetFormerPlayerPortalGuild() != GIL_None))
			{
				AI_TurnToNPC(self,other);
				B_Say(self,other,"$WISEMOVE");
			};
			AI_ContinueRoutine(self);
		}
		else if(C_AmIStronger(self,other))
		{
			B_Say(self,other,"$YOUASKEDFORIT");
			B_SetAttackReason(self,AIV_AR_INTRUDER);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Attack,0,"");
		}
		else
		{
			AI_StartState(self,ZS_CallGuardsOnEnterRoom,0,"");
		};
	};
	AI_Wait(self,1);
};

func void ZS_ClearRoomWait_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ClearRoomWait_End");
};

func void B_ClearRoomEnterRoom()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_ClearRoomEnterRoom");
	B_FullStop(self);
	if(Npc_CanSeeNpcFreeLOS(self,other) && (Wld_GetPlayerPortalGuild() != GIL_None))
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC kann SC sehen!");
		if(Wld_GetPlayerPortalGuild() == GIL_None)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC nicht mehr im Raum!");
			if(C_AmIStronger(self,other) && (Wld_GetGuildAttitude(other.guild,Wld_GetFormerPlayerPortalGuild()) != ATT_FRIENDLY) && (Wld_GetFormerPlayerPortalGuild() != GIL_None))
			{
				AI_TurnToNPC(self,other);
				B_Say(self,other,"$WISEMOVE");
			};
			AI_ContinueRoutine(self);
		}
		else if(Wld_GetGuildAttitude(other.guild,Wld_GetPlayerPortalGuild()) != ATT_FRIENDLY)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC wieder im Raum!");
			if(C_AmIStronger(self,other))
			{
				PrintDebugNpc(PD_ZS_Check,"...stronger");
				AI_TurnToNPC(self,other);
				B_Say(self,other,"$YOUASKEDFORIT");
				B_SetAttackReason(self,AIV_AR_INTRUDER);
				Npc_SetTarget(self,other);
				AI_StartState(self,ZS_Attack,0,"");
			}
			else
			{
				PrintDebugNpc(PD_ZS_Check,"...not stronger--> CallGuards");
				AI_StartState(self,ZS_CallGuardsOnEnterRoom,0,"");
			};
		};
	}
	else
	{
		AI_ContinueRoutine(self);
	};
};

func void B_ClearRoomUseMob()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_ClearRoomUseMob");
	if(Npc_IsDetectedMobOwnedByNpc(other,self) || Npc_IsDetectedMobOwnedByGuild(other,self.guild))
	{
		PrintDebugNpc(PD_ZS_Check,"...MOB gehört NSC oder seiner Gilde!");
		if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) || (other.guild == GIL_DMB))
		{
			PrintDebugNpc(PD_ZS_Check,"...Manipulator ist in befreundeter Gilde oder unheimlicher Dämonenbeschwörer");
			if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (other.guild == GIL_DMB))
			{
				db_say(self,other,"$ISaidWhatDoYouWant");
			}
			else
			{
				db_say(self,other,"$HandsOff");
			};
		}
		else
		{
			PrintGlobals(PD_ZS_Check);
			Npc_SetTempAttitude(self,ATT_HOSTILE);
			Npc_ClearAIQueue(self);
			B_WhirlAround(self,other);
			db_say(self,other,"IWillTeachYouRespectForForeignProperty");
			B_SetAttackReason(self,AIV_AR_INTRUDER);
			B_AssessAndMemorize(NEWS_THEFT,NEWS_SOURCE_WITNESS,self,other,self);
			AI_SetWalkMode(self,NPC_RUN);
			if(C_NpcIsWorker(self) && C_AmIWeaker(self,other))
			{
				AI_StartState(self,ZS_CallGuards,0,"");
			}
			else
			{
				Npc_SetTarget(self,other);
				AI_StartState(self,ZS_Attack,0,"");
			};
		};
	};
};

