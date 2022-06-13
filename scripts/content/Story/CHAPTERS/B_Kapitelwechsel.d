func void B_Kapitelwechsel(var int neues_Kapitel)
{
	var C_Npc nyras;
	var C_Npc YBerion;
	var C_Npc Templer;
	var C_Npc Templer_1;
	var C_Npc Novize;
	var C_Npc Novize_1;
	Kapitel = neues_Kapitel;
	if(neues_Kapitel == 1)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS ERSTES KAPITEL ===---");
		IntroduceChapter("Kapitola 1","Svět odsouzených","chapter1.tga","levelup.wav",6000);
		B_Give_SkipChapter2Weapons();
		b_give_ricelordchapter1weapons();
		b_give_bartholochapter1weapons();
	}
	else if(neues_Kapitel == 2)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS ZWEITE KAPITEL ===---");
		B_Give_FiskChapter2Weapons();
		B_Give_DarrionChapter2Weapons();
		B_Give_SharkyChapter2Weapons();
		B_Give_BaalCadarChapter2Runes();
		B_Give_TorrezChapter2Runes();
		B_Give_CronosChapter2Runes();
		B_GiveRiordianChapter2Potions();
		B_Give_CavalornChapter2Weapons();
		B_Give_WolfChapter2Weapons();
		B_Give_SkipChapter2Weapons();
		b_give_isidrochapter2joints();
		b_give_ricelordchapter2weapons();
		b_give_fortunochapter2potions();
		b_give_cipherchapter2joints();
		b_give_bartholochapter2weapons();
		b_give_mordragchapter2weapons();
		b_give_kaganchapter2joints();
		b_give_miguelchapter2potions();
		B_Story_RespawnOW();
		b_story_respawn_plants_chapter2();
		B_InsertInExtremo();
		IntroduceChapter("Kapitola 2","Hnízdo důlních červů","chapter2.tga","levelup.wav",6000);
		Mdl_SetVisualBody(VLK_582_Melvin,"hum_body_Naked0",1,1,"Hum_Head_FatBald",119,3,nov_armor_l);
		Mdl_ApplyOverlayMds(VLK_582_Melvin,"Humans_Relaxed.mds");
		Npc_RemoveInvItem(VLK_582_Melvin,ItMw_1H_Club_01);
		CreateInvItems(VLK_582_Melvin,ItMw_1H_Hatchet_01,1);
		AI_EquipBestMeleeWeapon(VLK_582_Melvin);
		if(BaalTondral_GetNewGuy == LOG_SUCCESS)
		{
			Mdl_SetVisualBody(VLK_524_Dusty,"hum_body_Naked0",1,1,"Hum_Head_Psionic",120,0,nov_armor_l);
			Mdl_ApplyOverlayMds(VLK_524_Dusty,"Humans_Relaxed.mds");
			Npc_RemoveInvItem(VLK_524_Dusty,ItMw_1H_Club_01);
			CreateInvItems(VLK_524_Dusty,ItMw_1H_Hatchet_01,1);
			AI_EquipBestMeleeWeapon(VLK_524_Dusty);
		};
		B_ChangeGuild(Vlk_580_Grim,GIL_STT);
		Mdl_SetVisualBody(Vlk_580_Grim,"hum_body_Naked0",0,1,"Hum_Head_Thief",72,2,stt_armor_m);
		Mdl_ApplyOverlayMds(Vlk_580_Grim,"Humans_Relaxed.mds");
		CreateInvItems(Vlk_580_Grim,ItAmArrow,12);
		Npc_RemoveInvItem(Vlk_580_Grim,ItMw_1H_Club_01);
		CreateInvItems(Vlk_580_Grim,ItMw_1H_Sword_Short_03,1);
		CreateInvItems(Vlk_580_Grim,ItRw_Bow_Small_03,1);
		AI_EquipBestMeleeWeapon(Vlk_580_Grim);
		AI_EquipBestRangedWeapon(Vlk_580_Grim);
		Mdl_SetVisualBody(Tpl_1422_GorHanis,"hum_body_Naked0",1,1,"Hum_Head_Bald",66,1,tpl_armor_m);
		Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
		CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
		AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
		CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
		AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
		Mdl_SetVisualBody(Sld_729_Kharim,"hum_body_Naked0",0,3,"Hum_Head_FatBald",9,1,sld_armor_h);
		Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
		CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
		AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		Mdl_SetVisualBody(PC_Psionic,"hum_body_Naked0",1,0,"Hum_Head_Bald",17,2,nov_armor_h);
		Mdl_SetVisualBody(KDW_604_Cronos,"hum_body_Naked0",0,0,"Hum_Head_Thief",7,1,kdw_armor_h);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_STRENGTH,30);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_DEXTERITY,30);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS_MAX,20);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,20);
		if(C_NpcBelongsToPsiCamp(hero))
		{
			Npc_ExchangeRoutine(ORG_826_Mordrag,"SECT");
			Npc_ExchangeRoutine(STT_329_Dexter,"SECT");
		};
		if(C_NpcBelongsToOldCamp(hero))
		{
			Npc_ExchangeRoutine(ORG_826_Mordrag,"SECT");
		};
		if(C_NpcBelongsToNewCamp(hero))
		{
			Npc_ExchangeRoutine(STT_329_Dexter,"SECT");
		};
		Npc_ExchangeRoutine(SFB_1039_Schuerfer,"TAVERN");
		Npc_ExchangeRoutine(SFB_1034_Schuerfer,"TAVERN");
	}
	else if(neues_Kapitel == 3)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS DRITTE KAPITEL ===---");
		B_InExtremoStopMusic();
		B_KillInExtremo();
		YBerion_BringFocus = LOG_SUCCESS;
		CorKalom_BringMCQBalls = LOG_SUCCESS;
		CorKalom_BringBook = LOG_SUCCESS;
		B_Story_RespawnOW();
		b_story_respawn_plants_chapter3();
		B_Give_FiskChapter3Weapons();
		B_Give_DarrionChapter3Weapons();
		B_Give_SharkyChapter3Weapons();
		B_Give_BaalCadarChapter3Runes();
		B_Give_TorrezChapter3Runes();
		B_Give_TorrezChapter3Runes();
		B_Give_CronosChapter3Runes();
		B_GiveRiordianChapter3Potions();
		B_Give_CavalornChapter3Weapons();
		B_Give_WolfChapter3Weapons();
		B_Give_SkipChapter3Weapons();
		b_give_isidrochapter3joints();
		b_give_ricelordchapter3weapons();
		b_give_fortunochapter3potions();
		b_give_cipherchapter3joints();
		b_give_bartholochapter3weapons();
		b_give_mordragchapter3weapons();
		b_give_kaganchapter3joints();
		b_give_miguelchapter3potions();
		PlayVideo("GREATPRAYER.BIK");
		if(SHARK_HUNTER == TRUE)
		{
			Npc_ExchangeRoutine(TPL_1402_GorNaToth,"SHARKHUNT");
		};
		Mdl_SetVisualBody(STT_329_Dexter,"hum_body_Naked0",0,1,"Hum_Head_FatBald",58,1,stt_armor_h);
		Npc_RemoveInvItem(STT_329_Dexter,ItRw_Bow_Small_03);
		CreateInvItems(STT_329_Dexter,ItRw_Bow_Long_01,1);
		AI_EquipBestRangedWeapon(STT_329_Dexter);
		Mdl_SetVisualBody(PC_Fighter,"hum_body_Naked0",0,3,"Hum_Head_Fighter",13,0,sld_armor_m);
		Mdl_SetVisualBody(non_5054_paul,"hum_body_Naked0",2,1,"Hum_Head_Bald",39,2,vlk_armor_m);
		CreateInvItems(non_5054_paul,ItMw_1H_Nailmace_01,1);
		AI_EquipBestMeleeWeapon(non_5054_paul);
		Mdl_SetVisualBody(Nov_1330_BaalParvez,"hum_body_Naked0",1,1,"Hum_Head_Psionic",25,2,nov_armor_h);
		Mdl_SetVisualBody(Kdw_603_Nefarius,"hum_body_Naked0",0,0,"Hum_Head_Psionic",8,1,kdw_armor_h);
		Mdl_SetVisualBody(KDW_605_Riordian,"hum_body_Naked0",0,0,"Hum_Head_Bald",9,1,kdw_armor_h);
		B_ClearImmortal(GUR_1203_BaalTondral);
		B_ClearImmortal(GUR_1204_BaalNamib);
		B_ClearImmortal(GUR_1209_BaalOrun);
		B_ClearImmortal(GUR_1210_BaalTyon);
		B_ClearImmortal(TPL_1402_GorNaToth);
		B_ClearImmortal(Org_801_Lares);
		B_ClearImmortal(GRD_263_Asghan);
		B_ClearImmortal(STT_301_Ian);
		B_ExchangeRoutine(TPL_1439_GorNaDrak,"FMTaken");
		B_ExchangeRoutine(TPL_1440_Templer,"FMTaken");
		Npc_ExchangeRoutine(gur_5021_baallukor,"OT");
		Npc_ExchangeRoutine(ORG_826_Mordrag,"START");
		Npc_ExchangeRoutine(STT_329_Dexter,"START");
		Wld_InsertNpc(vlk_5079_emilio,"OW_OM_ENTRANCE02");
		nyras = Hlp_GetNpc(Nov_1303_Nyras);
		Npc_ExchangeRoutine(nyras,"AfterRitual");
		AI_ContinueRoutine(nyras);
		YBerion = Hlp_GetNpc(GUR_1200_YBerion);
		YBerion.flags = 0;
		Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,-YBerion.attribute[ATR_HITPOINTS_MAX] + 1);
		YBerion.flags = NPC_FLAG_IMMORTAL;
		Npc_ExchangeRoutine(YBerion,"DRAINED");
		AI_ContinueRoutine(YBerion);
		Npc_ExchangeRoutine(SFB_1039_Schuerfer,"FMCstart");
		Npc_ExchangeRoutine(SFB_1034_Schuerfer,"FMCstart");
		Templer = Hlp_GetNpc(TPL_1431_Templer);
		Templer.senses = hero.senses;
		Templer_1 = Hlp_GetNpc(TPL_1430_Templer);
		Templer_1.senses = hero.senses;
		Novize = Hlp_GetNpc(NOV_1319_Novize);
		Novize.senses = hero.senses;
		Novize_1 = Hlp_GetNpc(NOV_1319_Novize);
		Novize_1.senses = hero.senses;
		IntroduceChapter("Kapitola 3","Artefakty pradávných sil","chapter3.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 4)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS VIERTE KAPITEL ===---");
		B_ExchangeRoutine(GRD_205_Scorpio,"BANNISHED");
		B_ChangeGuild(GRD_205_Scorpio,GIL_None);
		B_SetPermAttitude(GRD_205_Scorpio,ATT_NEUTRAL);
		B_ChangeGuild(STT_336_Cavalorn,GIL_None);
		B_Give_ScorpioChapter4Weapons();
		B_Give_DarrionChapter4Weapons();
		B_Give_SharkyChapter4Weapons();
		B_Give_BaalCadarChapter4Runes();
		B_Give_XardasChapter4Runes();
		B_Give_CronosChapter4Runes();
		B_GiveRiordianChapter4Potions();
		B_Give_CavalornChapter4Weapons();
		B_Give_WolfChapter4Weapons();
		b_give_isidrochapter4joints();
		b_give_ricelordchapter4weapons();
		b_give_fortunochapter4potions();
		b_give_cipherchapter4joints();
		b_give_mordragchapter4weapons();
		b_give_kaganchapter4joints();
		Saturas_BringFoci = 5;
		Wld_SetObjectRoutine(0,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(1,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(2,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(3,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(4,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(5,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(6,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(7,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(8,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(9,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(10,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(11,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(12,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(13,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(14,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(15,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(16,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(17,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(18,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(19,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(20,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(21,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(22,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(23,0,"EVT_AM_LOB_GATE_BIG",1);
		Npc_ExchangeRoutine(grd_5072_gardist,"OLDMINE");
		CreateInvItem(hero,ItArRuneTeleport2);
		Log_CreateTopic(CH4_Firemages,LOG_MISSION);
		Log_SetTopicStatus(CH4_Firemages,LOG_RUNNING);
		B_LogEntry(CH4_Firemages,"Saturas, představený mágů Vody, mě požádal o poslední laskavost. K odpálení rudné haldy potřebuje pomoc mágů Ohně ze Starého tábora. Nevím sice, jak přesvědčím Gomezovy mágy, aby se účastnili plánu, který je připraví o jejich moc, ale něco už vymyslím.");
		B_ExchangeRoutine(Sld_700_Lee,"DAMNPAST");
		B_ExchangeRoutine(BAU_935_Homer,"DAMNPAST");
		oldHeroGuild = Npc_GetTrueGuild(hero);
		if(C_NpcBelongsToOldCamp(hero))
		{
			Npc_SetTrueGuild(hero,GIL_None);
			hero.guild = GIL_None;
		};
		B_ExchangeRoutine(GRD_228_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_230_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_280_Gardist,"FMTaken");
		B_ClearImmortal(GRD_228_Gardist);
		B_ClearImmortal(GRD_230_Gardist);
		B_ClearImmortal(GRD_280_Gardist);
		B_ClearImmortal(EBR_101_Scar);
		B_ClearImmortal(EBR_102_Arto);
		B_ClearImmortal(EBR_105_Raven);
		B_ClearImmortal(GRD_200_Thorus);
		B_ClearImmortal(org_871_logan);
		B_ClearImmortal(SLD_752_Okyl);
		B_ClearImmortal(Sld_700_Lee);
		B_ClearImmortal(SLD_701_Orik);
		B_ClearImmortal(SLD_737_Torlof);
		B_ClearImmortal(Sld_709_Cord);
		B_ClearImmortal(SLD_728_Jarvis);
		B_KillNpc(KDF_400_Rodriguez);
		B_KillNpc(KDF_401_Damarok);
		B_KillNpc(Kdf_402_Corristo);
		B_KillNpc(KDF_403_Drago);
		B_KillNpc(KDF_405_Torrez);
		if(oldHeroGuild == GIL_KDF)
		{
			CreateInvItem(Kdf_402_Corristo,itke_corristo);
		};
		if(oldHeroGuild == GIL_EBR)
		{
			CreateInvItem(EBR_105_Raven,itkey_raven_ebr_01);
		};
		B_KillNpc(Nov_1330_BaalParvez);
		B_KillNpc(Nov_1331_BaalTaran);
		B_KillNpc(Tpl_1422_GorHanis);
		B_KillNpc(Sld_729_Kharim);
		Npc_ExchangeRoutine(grd_5014_convoitraeger,"START");
		Npc_ExchangeRoutine(grd_5015_convoitraeger,"START");
		Npc_ExchangeRoutine(grd_5016_convoiwache,"START");
		Npc_ExchangeRoutine(grd_5017_convoiwache,"START");
		B_ExchangeRoutine(PC_Thief,"OCWait");
		B_ExchangeRoutine(PC_Mage,"OCWait");
		B_ChangeGuild(PC_Thief,GIL_KDF);
		B_SetPermAttitude(PC_Thief,ATT_FRIENDLY);
		B_SetPermAttitude(PC_Mage,ATT_FRIENDLY);
		B_ChangeGuild(VLK_574_Mud,GIL_VLK);
		B_ChangeGuild(GRD_251_Kirgo,GIL_GRD);
		B_ClearImmortal(Grd_211_Skip);
		CreateInvItem(KDF_400_Rodriguez,ItMi_Stuff_OldCoin_02);
		CreateInvItem(KDF_401_Damarok,ItMi_Stuff_OldCoin_02);
		CreateInvItem(Kdf_402_Corristo,ItMi_Stuff_OldCoin_02);
		CreateInvItem(KDF_403_Drago,ItMi_Stuff_OldCoin_02);
		CreateInvItem(KDF_405_Torrez,ItMi_Stuff_OldCoin_02);
		Mdl_SetVisualBody(PC_Fighter,"hum_body_Naked0",0,3,"Hum_Head_Fighter",13,0,sld_armor_h);
		Mdl_SetVisualBody(GRD_233_Bloodwyn,"hum_body_Naked0",0,1,"Hum_Head_Bald",18,1,grd_armor_h);
		Mdl_SetVisualBody(ORG_873_Cipher,"hum_body_Naked0",0,1,"Hum_Head_Bald",50,2,org_armor_h);
		Mdl_SetVisualBody(Kdw_601_Myxir,"hum_body_Naked0",0,0,"Hum_Head_Pony",7,4,kdw_armor_h);
		Mdl_SetVisualBody(Kdw_602_Merdarion,"hum_body_Naked0",0,0,"Hum_Head_Thief",8,0,kdw_armor_h);
		B_ExchangeRoutine(grd_5037_garaz,"OCESCAPE");
		AI_ContinueRoutine(grd_5037_garaz);
		B_ExchangeRoutine(EBR_105_Raven,"OCESCAPE");
		AI_ContinueRoutine(EBR_105_Raven);
		B_ExchangeRoutine(org_864_esteban,"OCESCAPE");
		AI_ContinueRoutine(org_864_esteban);
		B_ExchangeRoutine(VLK_538_Huno,"OCESCAPE");
		AI_ContinueRoutine(VLK_538_Huno);
		B_ExchangeRoutine(grd_5032_carlos,"OCESCAPE");
		AI_ContinueRoutine(grd_5032_carlos);
		B_ExchangeRoutine(Stt_311_Fisk,"OCESCAPE");
		AI_ContinueRoutine(Stt_311_Fisk);
		B_ExchangeRoutine(GRD_210_Scatty,"OCESCAPE");
		AI_ContinueRoutine(GRD_210_Scatty);
		B_ExchangeRoutine(GRD_200_Thorus,"OCESCAPE");
		AI_ContinueRoutine(GRD_200_Thorus);
		B_ExchangeRoutine(VLK_581_Snaf,"OCESCAPE");
		AI_ContinueRoutine(VLK_581_Snaf);
		B_ExchangeRoutine(grd_5018_ramon,"OCESCAPE");
		AI_ContinueRoutine(grd_5018_ramon);
		B_ExchangeRoutine(vlk_5079_emilio,"OCESCAPE");
		AI_ContinueRoutine(vlk_5079_emilio);
		B_ExchangeRoutine(stt_5036_miguel,"OCESCAPE");
		AI_ContinueRoutine(stt_5036_miguel);
		B_ExchangeRoutine(non_5054_paul,"OCESCAPE");
		AI_ContinueRoutine(non_5054_paul);
		B_ChangeGuild(org_871_logan,GIL_GRD);
		B_ChangeGuild(org_869_senyan,GIL_GRD);
		B_ChangeGuild(Org_870_Raeuber,GIL_GRD);
		B_ChangeGuild(org_866_franco,GIL_GRD);
		B_ChangeGuild(Org_865_Raeuber,GIL_GRD);
		B_ChangeGuild(org_864_esteban,GIL_GRD);
		B_ChangeGuild(org_863_skinner,GIL_GRD);
		B_ChangeGuild(Org_874_Raeuber,GIL_GRD);
		if(Npc_GetTrueGuild(hero) == GIL_GUR)
		{
			B_ExchangeRoutine(TPL_1406_Templer,"KALOMSAWAY");
			AI_ContinueRoutine(TPL_1406_Templer);
		};
		if(Npc_IsDead(non_5044_wegelagerer) && Npc_IsDead(non_5043_wegelagerer) && Npc_IsDead(non_5042_wegelagerer))
		{
			Npc_ExchangeRoutine(org_5033_gestath,"ALTERNATIVE");
			AI_ContinueRoutine(org_5033_gestath);
		};
		B_ExchangeRoutine(EBR_108_Velaya,"FMTaken");
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
		B_InitMonsterAttitudes();
		B_ExchangeRoutine(GRD_255_Fletcher,"FMTaken");
		B_ExchangeRoutine(GRD_252_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_253_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_244_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_214_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_215_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_233_Bloodwyn,"FMTaken");
		B_ExchangeRoutine(GRD_232_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_229_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_216_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_217_Torwache,"FMTaken");
		IntroduceChapter("Kapitola 4","Xardas","chapter4.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 5)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS FÜNFTE KAPITEL ===---");
		B_Give_ScorpioChapter5Weapons();
		B_Give_DarrionChapter5Weapons();
		B_Give_SharkyChapter5Weapons();
		B_Give_XardasChapter5Runes();
		B_Give_CavalornChapter5Weapons();
		B_Give_WolfChapter5Weapons();
		B_Give_CronosChapter5Runes();
		B_GiveRiordianChapter5Potions();
		b_give_isidrochapter5joints();
		b_give_ricelordchapter5weapons();
		b_give_fortunochapter5potions();
		b_give_cipherchapter5joints();
		b_give_mordragchapter5weapons();
		b_give_kaganchapter5joints();
		B_Give_ScorpioChapter6Weapons();
		B_Give_DarrionChapter6Weapons();
		B_Give_SharkyChapter6Weapons();
		B_Give_XardasChapter6Runes();
		B_GiveRiordianChapter6Potions();
		B_Give_CavalornChapter6Weapons();
		B_Give_WolfChapter6Weapons();
		b_give_cipherchapter6joints();
		b_give_mordragchapter6weapons();
		b_give_kaganchapter6joints();
		B_ClearImmortal(GRD_219_Stone);
		B_ClearImmortal(GUR_1202_CorAngar);
		B_ClearImmortal(STT_336_Cavalorn);
		B_ChangeGuild(ORG_855_Wolf,GIL_SLD);
		Mdl_ApplyOverlayMds(ORG_855_Wolf,"Humans_Militia.mds");
		Mdl_SetVisualBody(ORG_855_Wolf,"hum_body_Naked0",0,1,"Hum_Head_FatBald",38,1,sld_armor_m);
		B_LogEntry(CH4_EnterTemple,"Gorn příliš nevěřil tomu, že by mi mohlo ULU-MULU ve skřetím městě nějak pomoci. Ať tak nebo tak, už brzy si to vyzkouším na vlastní kůži...");
		B_Story_RespawnOW();
		if(Npc_GetTrueGuild(hero) == GIL_DMB)
		{
			Wld_InsertNpc(skeletonmage_demontower,"MAGICTOWER_03");
		};
		b_story_respawn_plants_chapter5();
		IntroduceChapter("Kapitola 5","Strážci portálu","chapter5.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 6)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS SECHSTE KAPITEL ===---");
		B_Give_XardasChapter6Runes();
		b_give_isidrochapter6joints();
		b_give_ricelordchapter6weapons();
		b_give_fortunochapter6potions();
		PlayVideo("OREHEAP.BIK");
		CreateInvItem(hero,Mythrilklinge02);
		IntroduceChapter("Kapitola 6","Spáčovo doupě","chapter6.tga","levelup.wav",6000);
	};
};

func int C_IsChapter(var int chapter)
{
	if(Kapitel == chapter)
	{
		return TRUE;
	};
};

