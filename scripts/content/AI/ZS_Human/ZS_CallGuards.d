func void ZS_CallGuards()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_CallGuards");
	PrintGlobals(PD_ZS_FRAME);
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	B_SmartTurnToNpc(self,hero);
	db_say(self,hero,"ALARM");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,hero);
	AI_StartState(self,ZS_Flee,0,"");
};

func void ZS_CallGuardsOnEnterRoom()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_CallGuardsOnEnterRoom");
	PrintGlobals(PD_ZS_FRAME);
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	B_SmartTurnToNpc(self,hero);
	db_say(self,hero,"ALARM");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,hero);
	if(C_AmIStronger(self,other))
	{
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,0,"");
	}
	else
	{
		AI_StartState(self,ZS_Flee,0,"");
	};
};

