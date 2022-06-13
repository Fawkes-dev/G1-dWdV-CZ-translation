func void ZS_ProclaimAndPunish()
{
	var int murder_news;
	var C_Npc murder_victim;
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ProclaimAndPunish");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_CombatReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_CombatAssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_CombatAssessDefeat);
	Npc_PercEnable(self,PERC_MOVENPC,B_StopGotoHero);
	if(self.aivar[AIV_WASDEFEATEDBYSC] && !C_NpcIsBoss(self) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE) && (Npc_GetPermAttitude(self,other) != ATT_HOSTILE))
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC wurde schon mal vom SC besiegt!");
		B_RemoveWeapon(self);
		AI_StartState(self,ZS_TurnAway,0,"");
		return;
	};
	B_DrawWeapon(self,other);
	if((Npc_IsInFightMode(self,FMODE_FAR) || Npc_IsInFightMode(self,FMODE_MAGIC)) && (Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG))
	{
		Npc_SetTarget(self,hero);
		AI_StartState(self,ZS_Attack,0,"");
	};
	AI_SetWalkMode(self,NPC_RUN);
	AI_Waitms(self,500);
	if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
	{
		Npc_SetPermAttitude(self,ATT_ANGRY);
	};
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	B_SetFaceExpression(self,other);
	if(Npc_WasInState(self,ZS_AssessEnemy))
	{
		murder_news = Npc_HasNews(self,NEWS_MURDER,hero,NULL);
		if(murder_news)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC hat getötet...");
			murder_victim = Npc_GetNewsVictim(self,murder_news);
			if(Npc_GetAttitude(self,murder_victim) == ATT_FRIENDLY)
			{
				PrintDebugNpc(PD_ZS_Check,"...und zwar einen Freund des NSCs!");
				db_say(self,hero,"YouKilledOneOfUs");
			};
		}
		else if((Wld_GetGuildAttitude(self.guild,hero.guild) == ATT_HOSTILE) || (self.npcType == Npctype_ROGUE) || (Npc_IsInState(self,ZS_HostileGuard) && (self.npcType == npctype_guard)))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC ist Todfeind!");
			db_say(self,hero,"DieMortalEnemy");
		}
		else if(Npc_HasNews(self,NEWS_THEFT,hero,self))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC hat vom NSC geklaut!");
			db_say(self,hero,"DIRTYTHIEF");
		}
		else if(Npc_HasNews(self,NEWS_DEFEAT,self,hero))
		{
			PrintDebugNpc(PD_ZS_Check,"...Normaler Angriff (SC ist schon mal besiegt worden)!");
			db_say(self,hero,"YOUSTILLNOTHAVEENOUGH");
		}
		else
		{
			PrintDebugNpc(PD_ZS_Check,"...Normaler Angriff (SC wurde noch nicht besiegt)!");
			db_say(self,hero,"NowWait");
		};
	}
	else if(C_GetAttackReason(self) == AIV_AR_INTRUDER)
	{
		PrintDebugNpc(PD_ZS_Check,"...SC hat Durchgang durchbrochen!");
		db_say(self,hero,"NowWaitIntruder");
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...SC greift Schützling einer Wache an !");
		db_say(self,hero,"YouAttackedMyCharge");
	};
};

func int ZS_ProclaimAndPunish_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_ProclaimAndPunish_Loop");
	if(Npc_GetStateTime(self) > HAI_TIME_PURSUIT)
	{
		PrintDebugNpc(PD_ZS_Check,"...Verfolgung dauert schon zu lange!");
		AI_ContinueRoutine(self);
	}
	else if((Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG) && !Npc_IsInFightMode(self,FMODE_FAR) && !Npc_IsInFightMode(self,FMODE_MAGIC))
	{
		if(!Npc_HasReadiedWeapon(self))
		{
			AI_ReadyMeleeWeapon(self);
		};
		PrintDebugNpc(PD_ZS_Check,"...noch NICHT in Dialogreichweite!");
		AI_GotoNpc(self,hero);
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...IN Dialogreichweite!");
		B_FullStop(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_ProclaimAndPunish_End()
{
	B_ResetFaceExpression(self);
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ProclaimAndPunish_End");
	if(C_NpcIsDown(hero))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC mittlerweile am Boden!");
		B_RemoveWeapon(self);
		return;
	};
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,0,"");
};

