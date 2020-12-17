func void zs_arenafight()
{
	var int choice2;
	OccupiedPerception();
	AI_GotoWP(self,self.wp);
	AI_GotoFP(self,"STAND");
	AI_AlignToFP(self);
	choice2 = Hlp_Random(3);
	if(Npc_IsInState(self,zs_arenafight))
	{
		if(choice2 <= 2)
		{
			AI_PlayAni(self,"S_WATCHFIGHT");
		}
		else if(choice2 >= 1)
		{
			AI_PlayAni(self,"T_WATCHFIGHT_OHNO");
		}
		else if(choice2 >= 0)
		{
			AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
		};
	};
};

func void zs_arenafight_loop()
{
};

func void zs_arenafight_end()
{
};

