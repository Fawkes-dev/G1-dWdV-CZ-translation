func void B_SetRoguesToHostile()
{
	var C_Npc wegelagerer1501;
	var C_Npc wegelagerer1502;
	var C_Npc wegelagerer1503;
	var C_Npc wegelagerer1504;
	var C_Npc wegelagerer5042;
	var C_Npc wegelagerer5043;
	var C_Npc wegelagerer5044;
	var C_Npc wegelagerer5057;
	var C_Npc wegelagerer5058;
	wegelagerer1501 = Hlp_GetNpc(Non_1501_Wegelagerer);
	Npc_SetTempAttitude(wegelagerer1501,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer1501,ATT_HOSTILE);
	wegelagerer1502 = Hlp_GetNpc(Non_1502_Wegelagerer);
	Npc_SetTempAttitude(wegelagerer1502,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer1502,ATT_HOSTILE);
	wegelagerer1503 = Hlp_GetNpc(Non_1503_Wegelagerer);
	Npc_SetTempAttitude(wegelagerer1503,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer1503,ATT_HOSTILE);
	wegelagerer1504 = Hlp_GetNpc(Non_1504_Wegelagerer);
	Npc_SetTempAttitude(wegelagerer1504,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer1504,ATT_HOSTILE);
	wegelagerer5042 = Hlp_GetNpc(non_5042_wegelagerer);
	Npc_SetTempAttitude(wegelagerer5042,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer5042,ATT_HOSTILE);
	wegelagerer5043 = Hlp_GetNpc(non_5043_wegelagerer);
	Npc_SetTempAttitude(wegelagerer5043,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer5043,ATT_HOSTILE);
	wegelagerer5044 = Hlp_GetNpc(non_5044_wegelagerer);
	Npc_SetTempAttitude(wegelagerer5044,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer5044,ATT_HOSTILE);
	wegelagerer5057 = Hlp_GetNpc(non_5057_wegelagerer);
	Npc_SetTempAttitude(wegelagerer5057,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer5057,ATT_HOSTILE);
	wegelagerer5058 = Hlp_GetNpc(non_5058_wegelagerer);
	Npc_SetTempAttitude(wegelagerer5058,ATT_HOSTILE);
	Npc_SetAttitude(wegelagerer5058,ATT_HOSTILE);
	if(Stooges_Fled == TRUE)
	{
	};
};

