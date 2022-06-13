instance TPL_1402_GorNaToth(Npc_Default)
{
	name[0] = "Gor Na Toth";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 21;
	voice = 11;
	id = 1402;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 322;
	attribute[ATR_HITPOINTS] = 322;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",86,1,tpl_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	EquipItem(self,toth_sword);
	daily_routine = Rtn_start_1402;
};

func void Rtn_start_1402()
{
	TA_Sleep(0,0,3,0,"PSI_33_HUT_IN");
	TA_Boss(3,0,5,0,"PSI_VIEWPOINT");
	TA_Boss(5,0,15,0,"PSI_MEETING_BRIDGE_MOVEMENT");
	TA_Stay(15,0,20,0,"PSI_STAND_TOTH_01");
	TA_Boss(20,0,0,0,"PSI_MEETING_BRIDGE_MOVEMENT");
};

func void rtn_sharkhunt_1402()
{
	TA_Boss(0,0,3,0,"PSI_GUARD_GORNATOTH");
	TA_Boss(3,0,0,0,"PSI_GUARD_GORNATOTH");
};

func void rtn_guide_1402()
{
	TA_GuidePC(0,0,3,0,"PATH_AROUND_PSI21");
	TA_GuidePC(3,0,0,0,"PATH_AROUND_PSI21");
};

