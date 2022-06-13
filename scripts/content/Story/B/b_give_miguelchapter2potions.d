func void b_give_miguelchapter2potions()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(stt_5036_miguel);
	CreateInvItems(stt_5036_miguel,ItFo_Plants_Herb_02,4);
	CreateInvItems(stt_5036_miguel,ItFo_Plants_Nightshadow_01,3);
	CreateInvItems(stt_5036_miguel,ItFo_Plants_mountainmoos_01,2);
	CreateInvItems(stt_5036_miguel,ItFo_Plants_Nightshadow_01,1);
	CreateInvItems(stt_5036_miguel,ItMiNugget,150);
};

func void b_give_miguelchapter3potions()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(stt_5036_miguel);
	CreateInvItems(stt_5036_miguel,ItFo_Plants_Herb_03,4);
	CreateInvItems(stt_5036_miguel,ItFo_Plants_Nightshadow_02,3);
	CreateInvItems(stt_5036_miguel,ItFo_Plants_mountainmoos_02,2);
	CreateInvItems(stt_5036_miguel,ItFo_Plants_Nightshadow_02,1);
	CreateInvItems(stt_5036_miguel,ItMiNugget,175);
};

