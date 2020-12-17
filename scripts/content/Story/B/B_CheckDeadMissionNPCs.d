func void B_CheckDeadMissionNPCs()
{
	if(Hlp_GetInstanceID(Org_844_Lefty) == Hlp_GetInstanceID(self))
	{
		if(Lefty_Mission == LOG_RUNNING)
		{
			B_LogEntry(CH1_CarryWater,"Teď když je Lefty mrtev, s nošením vody je asi konec. Ten chlápek se mi stejně nelíbil.");
			Log_SetTopicStatus(CH1_CarryWater,LOG_SUCCESS);
			LeftyDead = TRUE;
		};
	};
	if(Hlp_GetInstanceID(ORG_826_Mordrag) == Hlp_GetInstanceID(self))
	{
		if(Thorus_MordragKo == LOG_RUNNING)
		{
			B_LogEntry(CH1_MordragKO,"Nyní, když je Mordrag mrtvý, je Thorusův problém vyřešen a já jsem udělal svou práci.");
		};
	};
};

