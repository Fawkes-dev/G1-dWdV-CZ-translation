func void ZS_Smalltalk()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smalltalk");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	if(!Npc_IsOnFP(self,"SMALLTALK"))
	{
		PrintDebugNpc(PD_TA_CHECK,"...nicht auf FP!");
		AI_GotoWP(self,self.wp);
	};
	AI_GotoFP(self,"SMALLTALK");
	AI_AlignToFP(self);
};

func void ZS_Smalltalk_Loop()
{
	var int talktime;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Smalltalk_Loop");
	Npc_PerceiveAll(self);

	//BUG [Fawkes]: odstranena dvojita detekcia NPC
	//Wld_DetectNpc(self,-1,ZS_Smalltalk,-1);
	//if(Wld_DetectNpc(self,-1,ZS_Smalltalk,-1) && (Npc_GetDistToNpc(self,other) < HAI_DIST_SMALLTALK))
	
	var int smallTalkPossible; smallTalkPossible = FALSE;
	
	if(Wld_DetectNpc(self,-1,ZS_Smalltalk,-1)) {
		if (Hlp_IsValidNPC (other)) {
			if (Npc_GetDistToNpc(self,other) < HAI_DIST_SMALLTALK) {
				smallTalkPossible = TRUE;
			};
		};
	};
	
	if (smallTalkPossible)
	{
		AI_TurnToNPC(self,other);
		talktime = Hlp_Random(200);
		if(talktime < 5)
		{
			//BUG [Fawkes]: B_Say(self,NULL restored back to B_Say(self,other
			B_Say(self,other,"$SMALLTALK01");
		}
		else if(talktime < 10)
		{
			B_Say(self,other,"$SMALLTALK02");
		}
		else if(talktime < 15)
		{
			B_Say(self,other,"$SMALLTALK03");
		}
		else if(talktime < 20)
		{
			B_Say(self,other,"$SMALLTALK04");
		}
		else if(talktime < 25)
		{
			B_Say(self,other,"$SMALLTALK05");
		}
		else if(talktime < 30)
		{
			B_Say(self,other,"$SMALLTALK06");
		}
		else if(talktime < 35)
		{
			B_Say(self,other,"$SMALLTALK07");
		}
		else if(talktime < 40)
		{
			B_Say(self,other,"$SMALLTALK08");
		}
		else if(talktime < 45)
		{
			B_Say(self,other,"$SMALLTALK09");
		}
		else if(talktime < 50)
		{
			B_Say(self,other,"$SMALLTALK10");
		}
		else if(talktime < 55)
		{
			B_Say(self,other,"$SMALLTALK11");
		}
		else if(talktime < 60)
		{
			B_Say(self,other,"$SMALLTALK12");
		}
		else if(talktime < 65)
		{
			B_Say(self,other,"$SMALLTALK13");
		}
		else if(talktime < 70)
		{
			B_Say(self,other,"$SMALLTALK14");
		}
		else if(talktime < 75)
		{
			B_Say(self,other,"$SMALLTALK15");
		}
		else if(talktime < 80)
		{
			B_Say(self,other,"$SMALLTALK16");
		}
		else if(talktime < 85)
		{
			B_Say(self,other,"$SMALLTALK17");
		}
		else if(talktime < 90)
		{
			B_Say(self,other,"$SMALLTALK18");
		}
		else if(talktime < 95)
		{
			B_Say(self,other,"$SMALLTALK19");
		}
		else if(talktime < 100)
		{
			B_Say(self,other,"$SMALLTALK20");
		}
		else if(talktime < 105)
		{
			B_Say(self,other,"$SMALLTALK21");
		}
		else if(talktime < 110)
		{
			B_Say(self,other,"$SMALLTALK22");
		}
		else if(talktime < 115)
		{
			B_Say(self,other,"$SMALLTALK23");
		}
		else if(talktime < 120)
		{
			B_Say(self,other,"$SMALLTALK24");
		};
		AI_Wait(self,3);
		Npc_SetStateTime(self,0);
	}
	else if(Npc_GetStateTime(self) >= 5)
	{
		PrintDebugNpc(PD_TA_CHECK,"... kein Gesprächspartner gefunden!");
		AI_StartState(self,ZS_Stand,1,"");
	};
	AI_Wait(self,1);
};

func void ZS_Smalltalk_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smalltalk_End");
};

