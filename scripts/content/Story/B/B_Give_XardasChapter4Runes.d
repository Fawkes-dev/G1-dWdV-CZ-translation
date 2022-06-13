func void B_Give_XardasChapter4Runes()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(KDF_404_Xardas);
	CreateInvItem(npc,ItArRuneDestroyUndead);
	CreateInvItem(npc,itarrunesummonskeletons);
	CreateInvItems(npc,ItArScrollSummonSkeletons,8);
	CreateInvItems(npc,ItArScrollSummonGolem,4);
	CreateInvItems(npc,ItArScrollDestroyUndead,5);
};

func void B_Give_XardasChapter5Runes()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(KDF_404_Xardas);
	CreateInvItem(npc,itarrunesummongolem);
	CreateInvItem(npc,itarrunesummondemon);
	CreateInvItems(npc,ItArScrollSummonDemon,4);
	CreateInvItems(npc,ItArScrollSummonSkeletons,8);
	CreateInvItems(npc,ItArScrollSummonGolem,4);
};

func void B_Give_XardasChapter6Runes()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(KDF_404_Xardas);
	CreateInvItem(npc,ItArRuneBreathOfDeath);
	CreateInvItem(npc,itarrunearmyofdarkness);
	CreateInvItems(npc,ItArScrollSummonDemon,4);
	CreateInvItems(npc,ItArScrollSummonSkeletons,8);
	CreateInvItems(npc,ItArScrollSummonGolem,4);
	CreateInvItems(npc,ItArScrollArmyOfDarkness,8);
	CreateInvItem(npc,Amulett_der_Macht);
	CreateInvItem(npc,Amulett_der_Erleuchtung);
};

