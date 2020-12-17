instance STT_325_OMID_EXIT(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_exit_condition;
	information = stt_325_omid_exit_info;
	important = 0;
	permanent = 1;
	nr = 999;
	description = DIALOG_ENDE;
};

func int stt_325_omid_exit_condition()
{
	return 1;
};

func void stt_325_omid_exit_info()
{
	AI_StopProcessInfos(self);
};

instance STT_325_OMID_DOING(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_doing_condition;
	information = stt_325_omid_doing_info;
	important = 0;
	permanent = 0;
	description = "Kdo jsi?";
};

func int stt_325_omid_doing_condition()
{
	return 1;
};

func void stt_325_omid_doing_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Kdo jsi?
	AI_Output(self,other,"Stt_325_Omid_DOING_02_73");	//Říkej mi Omid. Jsem jedním z Gomezových kuchařů.
	AI_Output(self,other,"Stt_325_Omid_DOING_02_72");	//Jsem docela známy díky svému masovému vývaru, je zde velmi populární.
	AI_Output(self,other,"Stt_325_Omid_DOING_04_71");	//Nejsi tu dlouho co?
	AI_Output(other,self,"Stt_325_Omid_DOING_05_70");	//Jsem tu nový…
};

instance STT_325_OMID_NEEDHELP(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_needhelp_condition;
	information = stt_325_omid_needhelp_info;
	important = 0;
	permanent = 0;
	description = "Neměl by jsi pro mě trochu toho masového vývaru?";
};

func int stt_325_omid_needhelp_condition()
{
	if(Npc_KnowsInfo(hero,stt_325_omid_doing))
	{
		return 1;
	};
};

func void stt_325_omid_needhelp_info()
{
	AI_Output(other,self,"Stt_325_Omid_NeedHelp_01_74");	//Neměl by jsi trochu toho masového vývaru?
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_02_73");	//Ne, Gomez s Rudobarony včera všechno snědli.
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_02_72");	//Pokud ale chceš, můžu ti vývar připravit. Budu ale nejdřív potřebovat několik ingrediencí.
	AI_Output(other,self,"Stt_325_Omid_NeedHelp_05_69");	//Co potřebuješ?
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_05_68");	//Potřebuji šunku, dva sýry, pět pečených kusů masa, ohnivý trn a dva kamenné kořeny.
	OMID_RECEPT = LOG_RUNNING;
	Log_CreateTopic(CH1_OMIDRECEPT,LOG_MISSION);
	Log_SetTopicStatus(CH1_OMIDRECEPT,LOG_RUNNING);
	B_LogEntry(CH1_OMIDRECEPT,"Omid, jeden z Gomezových kuchařů ze Starého tábora, mě požádal, abych našel nějaké přísady pro jeho masový guláš. Chybí mu 1 šunka, 2 kusy sýra, 5 pečených kusů masa, 1 Ohnivý trn a 2 kamenné kořeny.");
};

instance STT_325_OMID_SUCCESS(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_success_condition;
	information = stt_325_omid_success_info;
	important = 0;
	permanent = 1;
	description = "Mám ty věci, co jsi po mně chtěl!";
};

func int stt_325_omid_success_condition()
{
	if(OMID_RECEPT == LOG_RUNNING)
	{
		return 1;
	};
};

func void stt_325_omid_success_info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Mám ty věci, co jsi po mně chtěl!
	if((Npc_HasItems(other,ItFoMutton) >= 5) && (Npc_HasItems(other,ItFo_mutton_01) >= 1) && (Npc_HasItems(other,ItFoCheese) >= 2) && (Npc_HasItems(other,ItFo_Plants_Stoneroot_01) >= 2) && (Npc_HasItems(other,ItFo_Plants_Flameberry_01) >= 1))
	{
		AI_Output(self,other,"Stt_325_Omid_Success_02_73");	//Ahh, velmi dobře.
		AI_Output(self,other,"Stt_325_Omid_Success_04_71");	//Tak, nyní mám vše co potřebuji.
		AI_Output(self,other,"Stt_325_Omid_Success_05_70");	//Dobrá práce. Dej mi chvilku, musím jen přidat pár věcí.
		AI_Output(self,other,"Stt_325_Omid_Success_05_69");	//Tady je tvůj masový vývar. Užij si ji!
		OMID_RECEPT = LOG_SUCCESS;
		Log_CreateTopic(CH1_OMIDRECEPT,LOG_MISSION);
		Log_SetTopicStatus(CH1_OMIDRECEPT,LOG_SUCCESS);
		B_LogEntry(CH1_OMIDRECEPT,"S mojí pomocí Omid dokázal uvařit guláš. Za odměnu jsem dostal porci na ochutnávku.");
		B_GiveXP(XP_OMIDRECEPT);
		CreateInvItems(self,itfofleischeintopf,1);
		B_GiveInvItems(self,other,itfofleischeintopf,1);
		B_GiveInvItems(other,self,ItFoMutton,5);
		B_GiveInvItems(other,self,ItFo_mutton_01,1);
		B_GiveInvItems(other,self,ItFoCheese,2);
		B_GiveInvItems(other,self,ItFo_Plants_Stoneroot_01,2);
		B_GiveInvItems(other,self,ItFo_Plants_Flameberry_01,1);
	}
	else
	{
		AI_Output(self,other,"Stt_325_Omid_Success_02_67");	//Ale to nejsou všechny ingredience. Vrať se, až všechno seženeš.
	};
};

