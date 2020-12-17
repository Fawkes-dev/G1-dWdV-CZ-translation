instance Bau_900_Ricelord(Npc_Default)
{
	name[0] = "Rýžový Lord";
	npcType = npctype_guard;
	guild = GIL_ORG;
	level = 10;
	voice = 12;
	id = 900;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"Hum_Body_CookSmith",1,1,"Hum_Head_FatBald",91,0,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,Heerscherstab);
	EquipItem(self,Ring_des_Lebens);
	daily_routine = Rtn_start_900;
};

func void Rtn_start_900()
{
	TA_Boss(7,0,20,0,"NC_RICELORD");
	TA_SitAround(20,0,24,0,"NC_RICELORD_SIT");
	TA_Sleep(24,0,7,0,"NC_RICEBUNKER_10");
};

