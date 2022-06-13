# G1 Die Welt der Verurteilten CZ translation v0.2

Mod Author: [Issues](https://forum.worldofplayers.de/forum/members/67037-Issues)

WoG Forum: [Release-Gothic-Welt-der-Verurteilten-v1-03-6](https://forum.worldofplayers.de/forum/threads/1332744-Release-Gothic-Welt-der-Verurteilten-v1-03-6)

CZ Translation v0.1: Fawkes & Kaiser

This is amateur fast-tracked translation of dWdV mod, I have used Google Translator to translate from DE >> EN >> CZ. Czech translation was revised and adjusted to fit context of dialogues. Not ideal. There might be still some issues with some dialogues.

We have fixed some bugs along the way during translation, some original G1 bugs, some related to mod. There might be still some bugs which we did not fix.

ChangeLog:

### v0.2 2020-12-13
#### Fixed translation:
```c
\CONTENT\Story\MISSIONS\DIA_GUR_1203_BaalTondral.d

	//Description was still in DE:
	DIA_BaalTondral_MuteExit.description = "Nichts sagen";
	//Translated to CZ:
	DIA_BaalTondral_MuteExit.description = "Nic neříkej. (KONEC)";

\CONTENT\Story\CHAPTERS\B_Kapitelwechsel.d

	//Chapter names were not translated

\CONTENT\Story\Events\Sleepabit.d

	//Sleepabit descriptions were not translated

\CONTENT\Story\Text.d

	//TXT_TALENTS for Alchemy and Smithing were overlooked - now fixed:

	const string TXT_TALENTS[12], Regenerace zmenena na Alchýmie a Mistr ohně na Kovářství
	{
		"",
		"Jednoruční meč",
		"Obouruční meč",
		"Luk",
		"Samostříl",
		"Otevírání zámků",
		"Vybírání kapes",
		"Magie",
		"Plížení",
		"Alchýmie",	//Regenerace
		"Kovářství",	//Mistr ohně
		"Akrobacie"
	};
```

### v0.1 2020-12-06
#### Bugfixes - original G1:
```c
\CONTENT\Story\ZS\ZS_Smalltalk.d
	func void ZS_Smalltalk_Loop(){
		//Double-detection of NPC using Wld_DetectNpc removed
		//Added validation for 'other' NPC detected by Wld_DetectNpc
		//B_Say(self,NULL,"") changed back to B_Say(self,other,"");
	};

\CONTENT\AI\AI_Intern\B_Functions.d
	func void B_SmartTurnToNpc(var C_Npc slf,var C_Npc oth){
		//Added validation for 'oth' when using B_SmartTurnToNPC
		if (!Hlp_IsValidNPC (oth)) { return; };
	};

	//B_Say & B_SayOverlay: Added check forcing NPC to talk to NULL if NPC is not in ZS_Talk dialog - AI_OutputSVM & AI_OutputSVM_Overlay would cause dialog skipping in G1
	func void B_Say(var C_Npc slf,var C_Npc oth,var string text){
		
		//AI_OutputSVM(slf,oth,text);
		if (NPC_IsInState (slf, ZS_Talk) && Hlp_IsValidNPC (oth))
		|| (NPC_IsInState (oth, ZS_Talk) && Hlp_IsValidNPC (oth))
		{
			AI_OutputSVM (slf, oth, text);
		} else {
			AI_OutputSVM (slf, NULL, text);
		};	
	};

	func void B_SayOverlay(var C_Npc slf,var C_Npc oth,var string text){
		//AI_OutputSVM_Overlay(slf,oth,text);
		if (NPC_IsInState (slf, ZS_Talk) && Hlp_IsValidNPC (oth))
		|| (NPC_IsInState (oth, ZS_Talk) && Hlp_IsValidNPC (oth))
		{
			AI_OutputSVM_Overlay (slf, oth, text);
		} else {
			AI_OutputSVM_Overlay (slf, NULL, text);
		};	
	};

\CONTENT\Story\MISSIONS\PC_Mage.d
	func int DIA_Milten_NochEinBrief_Condition(){
		if((Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3))
		//Added check validating that hero really has 'Cronos_Brief'
		&& (Npc_HasItems (other, Cronos_Brief)){
			return TRUE;
		};
	};
	
	func void DIA_Milten_NochEinBrief_Info(){
		B_GiveInvItems(other,self,Cronos_Brief,1);
	};

\CONTENT\Story\MISSIONS\DIA_GRD_237_Gardist.d
	func void Info_Grd_237_FirstWarn_Info(){
		//Added check Npc_HasItems - dialog choice will be available only when player has > 0 x ore
		if (Npc_HasItems(hero,ItMiNugget)){
			Info_AddChoice(Info_Grd_237_FirstWarn,"Jistě, tady je moje ruda!",Info_Grd_237_FirstWarn_Info_YES);
		};
	};

	func void Info_Grd_237_FirstWarn_Info_YES(){
		var int ore;
		ore = Npc_HasItems(hero,ItMiNugget);
		B_GiveInvItems(hero,self,ItMiNugget,ore);
	};

\CONTENT\Story\MISSIONS\DIA_XardasDemon.d
	func void Info_XardasDemon_ICEHEART_Info(){
		//Added Npc_RemoveInvItem to remove ItAt_IceGolem_01 from demon's inventory. Not a big issue.
	};
	
	func void Info_XardasDemon_FIREHEART_Info(){
		//Added Npc_RemoveInvItem to remove ItAt_FireGolem_01 from demon's inventory. Not a big issue.
	};

//Not really an issue ... but not 'best practice' either:

\CONTENT\Story\MISSIONS\DIA_TPL_1455_GorBoba.d
	
	func void Info_TPL_1455_GorBoba1_Info(){
		//Log_CreateTopic not used with constant but used with dircet string "Orktempel" --> so I replaced it with constant
		Log_CreateTopic("Orktempel",LOG_NOTE);
		B_LogEntry("Orktempel","GorBoba hat sich mir in den Weg gestellt um micht auf zu halten. Ich habe noch von ihm erfahren, dass Kalom und seine Anhänger von dem Hohenpriester Macht verliehen bekommen haben, so dass sie nicht mehr mit menschlichen Waffen verletzt werden können.");
	};

//Added CreateInvItems, before calling B_GiveInvItems (not a big deal, as B_GiveInvItems will create item, though I don't like that)

\CONTENT\Story\MISSIONS\DIA_EBR_108_Velaya.d
	func void dia_velaya_gomezfinished_info(){
		B_GiveInvItems(self,other,Lebensamulett,1);
	};

\CONTENT\Story\MISSIONS\DIA_GRD_255_Fletcher.d
	func void dia_fletcher_result_info(){
		B_GiveInvItems(self,other,ItMiNugget,75);
	};

\CONTENT\Story\MISSIONS\DIA_NOV_1302_Viran.d
	func void DIA_Viran_Running_Info(){
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
	};

\CONTENT\Story\MISSIONS\DIA_Org_862_Jacko.d
	func void ORG_862_Jacko_GUARD_InfoWert(){
		B_GiveInvItems(self,other,ItMiNugget,95);
	};

\CONTENT\Story\MISSIONS\DIA_org_864_esteban.d
	func void dia_esteban_success_info(){
		B_GiveInvItems(self,other,estebans_bogen,1);
	};

\CONTENT\Story\MISSIONS\DIA_VLK_573_Graham.d
	func void DIA_Graham_SellMap_Pay(){
		B_GiveInvItems(self,other,ItWrOMMap,1);
	};

	func void func void DIA_Graham_SellMap_AufsMaul(){
		B_GiveInvItems(self,other,ItWrOMMap,1);
	};

\CONTENT\Story\MISSIONS\DIA_STT_301_Ian.d
	func void STT_301_IAN_GETLIST_Info(){
		B_GiveInvItems(self,hero,TheList,1);
	};

\CONTENT\Story\MISSIONS\DIA_GRD_219_Stone.d
	func void GRD_219_Stone_BETTERARMOR_M(){
		B_GiveInvItems(self,hero,grd_armor_m,1);
	};
	
	func void GRD_219_Stone_BETTERARMOR_H(){
		B_GiveInvItems(self,hero,grd_armor_h,1);
	};

\CONTENT\Story\MISSIONS\DIA_GRD_233_Bloodwyn.d
	func void Info_Bloodwyn_Hello_NotNow(){
		B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
	};

\CONTENT\Story\MISSIONS\DIA_NOV_1304_Balor.d
	func void dia_balor_gotweed_info(){
		B_GiveInvItems(self,other,ItMiNugget,10);
	};
	
	func void DIA_Balor_FetchWeed_Info(){
		B_GiveInvItems(self,other,ItMi_Plants_Swampherb_01,50);
	};
```

#### Bugfixes - mod:

```c
\CONTENT\Story\MISSIONS\DIA_org_5060_bandit.d
	func void org_5060_bandit_beated_info(){
		//Added Npc_HasItems to check if hero has item before removing. Not a big deal.
		if (Npc_HasItems(hero,ItWr_Fire_Letter_01)){
			Npc_RemoveInvItem(hero,ItWr_Fire_Letter_01);
		};
		
		//Added Npc_HasItems to check if hero has item before removing. Not a big deal.
		if (Npc_HasItems(hero,ItWr_Fire_Letter_02)){
			Npc_RemoveInvItem(hero,ItWr_Fire_Letter_02);
		};
	};

\CONTENT\Story\MISSIONS\DIA_PC_Thief.d
	func void info_diego_münzenabgeben_info(){
		/*
		XP_STANDART = 1;
		PLAYER_MUENZEN = Npc_HasItems(hero,ItMi_Stuff_OldCoin_01);
		PLAYER_MUENZEN_2 = Npc_HasItems(hero,ItMi_Stuff_OldCoin_02);
		XP_PLAYERMUENZEN = (PLAYER_MUENZEN + PLAYER_MUENZEN_2) * XP_STANDART;
		B_GiveInvItems(other,self,ItMi_Stuff_OldCoin_01,Npc_HasItems(other,ItMi_Stuff_OldCoin_01));
		B_GiveInvItems(other,self,ItMi_Stuff_OldCoin_02,Npc_HasItems(other,ItMi_Stuff_OldCoin_02));
		Npc_RemoveInvItem(self,ItMi_Stuff_OldCoin_01);
		Npc_RemoveInvItem(self,ItMi_Stuff_OldCoin_02);
		*/

		XP_STANDART = 1;
		PLAYER_MUENZEN = Npc_HasItems(hero,ItMi_Stuff_OldCoin_01);
		PLAYER_MUENZEN_2 = Npc_HasItems(hero,ItMi_Stuff_OldCoin_02);
		XP_PLAYERMUENZEN = (PLAYER_MUENZEN + PLAYER_MUENZEN_2) * XP_STANDART;

		//Added checks validating if hero has any of these items
		if (PLAYER_MUENZEN) {
			B_GiveInvItems(other,self,ItMi_Stuff_OldCoin_01,PLAYER_MUENZEN);
			Npc_RemoveInvItems(self,ItMi_Stuff_OldCoin_01,PLAYER_MUENZEN);
		};

		//Added checks validating if hero has any of these items
		if (PLAYER_MUENZEN_2) {
			B_GiveInvItems(other,self,ItMi_Stuff_OldCoin_02,PLAYER_MUENZEN_2);
			Npc_RemoveInvItems(self,ItMi_Stuff_OldCoin_02,PLAYER_MUENZEN_2);
		};

		AI_Output(self,hero,"Info_Diego_MünzenAbgeben_12_03");	//Takže, jak bylo dohodnuto, za každou minci 1 kus rudy.

		CreateInvItems(self,ItMiNugget,PLAYER_MUENZEN + PLAYER_MUENZEN_2);
		B_GiveInvItems(self,other,ItMiNugget,PLAYER_MUENZEN + PLAYER_MUENZEN_2);
	};

\CONTENT\Story\MISSIONS\DIA_VLK_534_Buddler.d
	func void dia_vlk_534_erz_info() {
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75) {
		}
		else if(zufallsbelohnung >= 60){
		}
		else if(zufallsbelohnung >= 50){
		}
		else if(zufallsbelohnung >= 40){
		}
		else if(zufallsbelohnung >= 30){
		}
		else if(zufallsbelohnung >= 20){
		} else {
		//last condition commented out - there is no code prepared for situation in which 'zufallsbelohnung' will be between 0 - 10
		//else if(zufallsbelohnung >= 10){
		};
	};

\CONTENT\Story\MISSIONS\DIA_Stt_311_Fisk.d
	func void dia_fingers_butch_info(){
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75) {
		}
		else if(zufallsbelohnung >= 60)
		}
		else if(zufallsbelohnung >= 50)
		}
		else if(zufallsbelohnung >= 40)
		}
		else if(zufallsbelohnung >= 30)
		}
		else if(zufallsbelohnung >= 20){
		} else {
		//last condition commented out - there is no code prepared for situation in which 'zufallsbelohnung' will be between 0 - 10
		//else if(zufallsbelohnung >= 10){
		};
	};

\CONTENT\Story\MISSIONS\DIA_STT_301_Ian.d
	func void stt_301_ian_founddigger_info(){
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75) {
		}
		else if(zufallsbelohnung >= 60)
		}
		else if(zufallsbelohnung >= 50)
		}
		else if(zufallsbelohnung >= 40)
		}
		else if(zufallsbelohnung >= 30)
		}
		else if(zufallsbelohnung >= 20){
		} else {
		//last condition commented out - there is no code prepared for situation in which 'zufallsbelohnung' will be between 0 - 10
		//else if(zufallsbelohnung >= 10){
		};
	};

\CONTENT\Story\MISSIONS\DIA_ORG_855_Wolf.d
	func void Info_Wolf_MCPLATESENOUGH_Info(){
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75){
		}
		else if(zufallsbelohnung >= 50){
		} else {
		//last condition commented out - there is no code prepared for situation in which 'zufallsbelohnung' will be between 0 - 25
		//else if(zufallsbelohnung >= 25){
		};
	};

	//Dialog choice says we need: 6x ItAt_Swampshark_01, 5x ItAt_Swampshark_02, 2x ItAt_Claws_01 -->
	Info_AddChoice(info_wolf_craft_which,"Zbroj z kůže Močálového žraloka (6 kůží močálového žraloka, 5 zubů močálového žraloka, 2 drápy, 1700 ks rudy)",info_wolf_craft_which_shark);

	func void info_wolf_craft_which_shark(){
		//--> But condition si fine with 4x ItAt_Swampshark_01, 3x ItAt_Swampshark_02, 2x ItAt_Claws_01 -->
		//if((Npc_HasItems(other,ItAt_Swampshark_01) >= 4) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Swampshark_02) >= 3) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_L))
		if((Npc_HasItems(other,ItAt_Swampshark_01) >= 6) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Swampshark_02) >= 5) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_L))

			//--> And we are removing 5x ItAt_Swampshark_01, 5x ItAt_Swampshark_02 :)
			B_GiveInvItems(other,self,ItAt_Swampshark_01,5);
			B_GiveInvItems(other,self,ItAt_Claws_01,2);
			B_GiveInvItems(other,self,ItAt_Swampshark_02,5);
		};
	};
	
	func void dia_wolf_sellfur_info(){
		//Added CreateInvItems for ore
		CreateInvItems (self, ItMiNugget,Npc_HasItems(other,ItAt_Wolf_01) * Value_Wolfsfell);
		B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_01) * Value_Wolfsfell);
	};

\CONTENT\Story\MISSIONS\DIA_ORG_818_Ratford.d
	func void dia_ratford_map_info(){
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75) {
		}
		else if(zufallsbelohnung >= 60)
		}
		else if(zufallsbelohnung >= 50)
		}
		else if(zufallsbelohnung >= 40)
		}
		else if(zufallsbelohnung >= 30)
		}
		else if(zufallsbelohnung >= 20){
		} else {
		//last condition commented out - there is no code prepared for situation in which 'zufallsbelohnung' will be between 0 - 10
		//else if(zufallsbelohnung >= 10){
		};
	};
	
	func void dia_ratford_map_info() {
		//In case that hero has both maps --> itwrworldmap_mission + ItWrWorldmap order of this condition will fail this quest ... even though it should not -->
		/*
		if(Npc_HasItems(other,ItWrWorldmap) > 0){
			...
		}
		else if(Npc_HasItems(other,itwrworldmap_mission) > 0){
			...
		};
		*/

		//---> So I switched the order of conditions
		if(Npc_HasItems(other,itwrworldmap_mission) > 0){
			...
		}
		else if(Npc_HasItems(other,ItWrWorldmap) > 0){
			...
		};
	};

\CONTENT\Story\MISSIONS\DIA_Non_1500_Gilbert.d
	func void dia_gilbert_finished_info(){
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75) {
		}
		else if(zufallsbelohnung >= 60)
		}
		else if(zufallsbelohnung >= 50)
		}
		else if(zufallsbelohnung >= 40)
		}
		else if(zufallsbelohnung >= 30)
		}
		else if(zufallsbelohnung >= 20){
		} else {
		//last condition commented out - there is no code prepared for situation in which 'zufallsbelohnung' will be between 0 - 10
		//else if(zufallsbelohnung >= 10){
		};
	};

\CONTENT\Story\MISSIONS\DIA_BAU_903_Rufus.d
	func void dia_rufus_done_info(){
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75) {
		}
		else if(zufallsbelohnung >= 60)
		}
		else if(zufallsbelohnung >= 50)
		}
		else if(zufallsbelohnung >= 40)
		}
		else if(zufallsbelohnung >= 30)
		}
		else if(zufallsbelohnung >= 20){
		} else {
		//last condition commented out - there is no code prepared for situation in which 'zufallsbelohnung' will be between 0 - 10
		//else if(zufallsbelohnung >= 10){
		};
	};

\CONTENT\Story\MISSIONS\DIA_GRD_267_Gardist.d
	//Several issues
	func int grd_267_gardist_workingork_condition(){
		//This dialogue is available if hero has >= 150 ore
		if(Npc_KnowsInfo(hero,grd_267_gardist_sittingork) && (ORE_VLK == LOG_RUNNING) && (Npc_HasItems(other,ItMiNugget) >= 150)){
			return 1;
		};
	};

	func void grd_267_gardist_workingork_info(){
		//This block is available if hero has <= 150 ore (no issue here ... basically available when hero has exactly 150 ore)
		if(Npc_HasItems(other,ItMiNugget) <= 150){
			B_GiveInvItems(other,self,ItMiNugget,150);

		//This block is available if hero has > 150 ore and <= 200 ore
		} else if(Npc_HasItems(other,ItMiNugget) <= 200){
			//Problem: We are moving 200 ore, so if player has 151 ore - this moves 200 ore
			B_GiveInvItems(other,self,ItMiNugget,200);

		//This block is available if hero has >= 250 ore
		} else if(Npc_HasItems(other,ItMiNugget) >= 250){
			//We transfer everything (no issue here)
			B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
		};
		
		//But - here we have problem: If player has > 200 < 250 ore, then there is no dialogue ...
	};

\CONTENT\Story\MISSIONS\DIA_NOV_1301_Caine.d

	func void nov_1301_caine_traenke_crawlerelixier(){
		//Dialogue suggest we should learn KNOWS_PSICRAWLER but scripts teaches us KNOWS_DEXELIXIER
		//KNOWS_DEXELIXIER = TRUE;
		KNOWS_PSICRAWLER = TRUE;
	};
	
\CONTENT\Story\B\Info_Vlk_4_EXIT.d
	func void info_vlk_4_geschichte_info(){
		geschichten = Hlp_Random(100);
		
		if(geschichten < 25){
		}else if(geschichten < 50){
		} else {
		//last condition commented out - there is no code prepared for situation in which 'zufallsbelohnung' will be between 75 - 100
		//}else if(geschichten < 75){
		};
	};

\CONTENT\_misk_\potionalchemy_s1.d
	
	func void pc_heal3_info(){
		//Dialogue suggest we should be creating ItFo_Potion_Health_03, but in scripts there is ItFo_Potion_Health_02
		//CreateInvItems(hero,ItFo_Potion_Health_02,1);
		CreateInvItems(hero,ItFo_Potion_Health_03,1);
	};

	func void pc_mana3_info()
	{
		//Dialogue suggest we should be creating ItFo_Potion_Mana_03, but in scripts there is ItFo_Potion_Mana_02
		//CreateInvItems(hero,ItFo_Potion_Mana_02,1);
		CreateInvItems(hero,ItFo_Potion_Mana_03,1);
	};

\CONTENT\Story\MISSIONS\DIA_SLD_704_Blade.d
	func void dia_blade_learnyes_axt() {
		//Printscreen for Morning Star was missing ... so in order to remain consistent it was added here
		PrintScreen("Naučil ses vykovat: Morning Star",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	};
```
