func void zs_drunk()
{
	besoffenperception();
	Mdl_ApplyOverlayMds(self,"HUMANS_DRUNKEN.MDS");
};

func int zs_drunk_loop()
{
	if(Npc_GetStateTime(self) > 20)
	{
		return 1;
	};
	AI_Wait(self,1);
};

func void zs_drunk_end()
{
	Mdl_RemoveOverlayMds(self,"HUMANS_DRUNKEN.MDS");
};

