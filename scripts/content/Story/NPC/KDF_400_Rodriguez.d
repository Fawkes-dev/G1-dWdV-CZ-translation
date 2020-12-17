instance KDF_400_Rodriguez(Npc_Default)
{
	name[0] = "Rodriguez";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 25;
	voice = 12;
	id = 400;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 370;
	attribute[ATR_HITPOINTS] = 370;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",6,1,kdf_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,ItArRuneFirebolt);
	CreateInvItem(self,ItMi_Stuff_OldCoin_02);
	CreateInvItem(self,ItFoMutton);
	CreateInvItems(self,ItFoWine,2);
	daily_routine = Rtn_start_400;
};

func void Rtn_start_400()
{
	TA_SitCampfire(22,0,7,0,"OCC_CHAPEL_MAGE_03");
	TA_Smalltalk(7,0,22,0,"OCC_CENTER_2");
};

func void Rtn_KDFRITUAL_400()
{
	TA_Position(8,0,20,0,"OCC_CHAPEL_MAGE_01");
	TA_Position(20,0,8,0,"OCC_CHAPEL_MAGE_01");
};

