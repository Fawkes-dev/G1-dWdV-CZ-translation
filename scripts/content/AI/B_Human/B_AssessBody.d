func void B_AssessBody()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessBody");
	PrintGlobals(PD_ZS_Check);
	if(Npc_GetDistToNpc(self,other) < 1000)
	{
		PrintDebugNpc(PD_ZS_Check,"...Körper näher als 10m!");
		B_FullStop(self);
		AI_StartState(self,ZS_AssessBody,0,"");
	};
};

func void ZS_AssessBody()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessBody");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_RefuseTalk);
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		PrintDebugNpc(PD_ZS_Check,"...Körper bereits geplündert!");
		AI_ContinueRoutine(self);
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		PrintDebugNpc(PD_ZS_Check,"...Körper zu weit weg!");
		AI_ContinueRoutine(self);
	};
};

func int ZS_AssessBody_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_AssessBody_Loop");
	B_FullStop(self);
	AI_GotoNpc(self,other);
	return LOOP_END;
};

func void ZS_AssessBody_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessBody_End");
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		AI_ContinueRoutine(self);
	};
	if((self.fight_tactic != FAI_HUMAN_RANGED) && (self.npcType != npctype_friend) && C_NpcIsHuman(self))
	{
		PrintDebugNpc(PD_ZS_Check,"...kein purer Fernkämpfer und kein NSC-Freund!");
		AI_PlayAni(self,"T_PLUNDER");
		if(B_Plunder())
		{
			B_Say(self,other,"$ITookYourOre");
		}
		else
		{
			B_Say(self,other,"$ShitNoOre");
		};
		other.aivar[AIV_PLUNDERED] = TRUE;
	};
	AI_StartState(self,ZS_AssessBody_RecoverWeapon,1,"");
};

func void ZS_AssessBody_RecoverWeapon()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessBody_RecoverWeapon");
	B_SetPerception(self);
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF) || (Npc_GetDistToItem(self,ItMw_1H_Club_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Poker_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sickle_01) <= 500) || (Npc_GetDistToItem(self,ItMwPickaxe) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sledgehammer_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_Light_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Hatchet_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Old_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Nailmace_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Short_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Short_02) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Short_03) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Short_04) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Short_05) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Axe_Old_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Scythe_01) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Staff_01) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Staff_02) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Staff_03) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_LightGuardsSword_03) <= 500) || (Npc_GetDistToItem(self,itmw_1h_lightguardssword_03_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_01) <= 500) || (Npc_GetDistToItem(self,itmw_1h_mace_01_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_02) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_03) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_04) <= 500) || (Npc_GetDistToItem(self,itmw_1h_mace_04_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_01) <= 500) || (Npc_GetDistToItem(self,itmw_1h_sword_01_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_02) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_03) <= 500) || (Npc_GetDistToItem(self,itmw_1h_sword_03_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_04) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_05) <= 500) || (Npc_GetDistToItem(self,itmw_1h_sword_05_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_War_01) <= 500) || (Npc_GetDistToItem(self,itmw_1h_mace_war_01_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_War_02) <= 500) || (Npc_GetDistToItem(self,itmw_1h_mace_war_02_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_War_03) <= 500) || (Npc_GetDistToItem(self,itmw_1h_mace_war_03_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Mace_War_04) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Long_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Long_02) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Long_03) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Long_04) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Long_05) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Warhammer_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Warhammer_02) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Warhammer_03) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Axe_01) <= 500) || (Npc_GetDistToItem(self,itmw_1h_axe_01_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Axe_02) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Axe_03) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Broad_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Broad_02) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Broad_03) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Broad_04) <= 500) || (Npc_GetDistToItem(self,itmw_1h_sword_broad_04_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Old_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Bastard_01) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Bastard_02) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Bastard_03) <= 500) || (Npc_GetDistToItem(self,ItMw_1H_Sword_Bastard_04) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_Old_01) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_Old_02) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_Old_03) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Light_01) <= 500) || (Npc_GetDistToItem(self,itmw_2h_sword_light_01_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Light_02) <= 500) || (Npc_GetDistToItem(self,itmw_2h_sword_light_02_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Light_03) <= 500) || (Npc_GetDistToItem(self,itmw_2h_sword_light_03_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Light_04) <= 500) || (Npc_GetDistToItem(self,itmw_2h_sword_light_04_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Light_05) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_light_01) <= 500) || (Npc_GetDistToItem(self,itmw_2h_axe_light_01_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_light_02) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_light_03) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_01) <= 500) || (Npc_GetDistToItem(self,itmw_2h_sword_01_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_02) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_03) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Heavy_01) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Heavy_02) <= 500) || (Npc_GetDistToItem(self,itmw_2h_sword_heavy_02_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Light_03) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Sword_Light_04) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_Heavy_01) <= 500) || (Npc_GetDistToItem(self,itmw_2h_axe_heavy_01_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_Heavy_02) <= 500) || (Npc_GetDistToItem(self,itmw_2h_axe_heavy_02_smith) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_Heavy_03) <= 500) || (Npc_GetDistToItem(self,ItMw_2H_Axe_Heavy_04) <= 500) || (Npc_GetDistToItem(self,ItMw2hOrcSword01) <= 500) || (Npc_GetDistToItem(self,ItMw2hOrcAxe01) <= 500) || (Npc_GetDistToItem(self,ItMw2hOrcAxe02) <= 500) || (Npc_GetDistToItem(self,ItMw2hOrcAxe03) <= 500) || (Npc_GetDistToItem(self,ItMw2hOrcAxe04) <= 500) || (Npc_GetDistToItem(self,ItMw2hOrcMace01) <= 500) || (Npc_GetDistToItem(self,ItRwOrcstaff) <= 500) || (Npc_GetDistToItem(self,ItRwUdOrcstaff) <= 500) || (Npc_GetDistToItem(self,itmw_1h_sword_short_06) <= 500) || (Npc_GetDistToItem(self,itmw_2h_sword_04) <= 500) || (Npc_GetDistToItem(self,itmw_1h_sword_bastard_06) <= 500) || (Npc_GetDistToItem(self,scorpio_crossbow) <= 500) || (Npc_GetDistToItem(self,fletcher_sword) <= 500) || (Npc_GetDistToItem(self,slys_sword) <= 500) || (Npc_GetDistToItem(self,rodriguez_staff) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Small_01) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Small_02) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Small_03) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Small_04) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Small_05) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_War_01) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_War_02) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_War_03) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_War_04) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_War_05) <= 500) || (Npc_GetDistToItem(self,ItRw_Crossbow_01) <= 500) || (Npc_GetDistToItem(self,ItRw_Crossbow_02) <= 500) || (Npc_GetDistToItem(self,ItRw_Crossbow_03) <= 500) || (Npc_GetDistToItem(self,ItRw_Crossbow_04) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_01) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_02) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_03) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_04) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_05) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_06) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_07) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_08) <= 500) || (Npc_GetDistToItem(self,ItRw_Bow_Long_09) <= 500))
	{
		PrintDebugNpc(PD_ZS_Check,"...Nah- oder Fernkampfwaffe gefunden!");
		AI_TakeItem(self,item);
		AI_EquipBestMeleeWeapon(self);
		AI_EquipBestRangedWeapon(self);
		B_Say(self,other,"$ITakeYourWeapon");
	};
	AI_StartState(self,ZS_HealSelf,1,"");
};

