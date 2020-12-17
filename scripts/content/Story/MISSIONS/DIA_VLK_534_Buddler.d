instance DIA_Vlk_534_Exit(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 999;
	condition = DIA_Vlk_534_Exit_Condition;
	information = DIA_Vlk_534_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

func void DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Vlk_534_LeaveMe(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = DIA_Vlk_534_LeaveMe_Condition;
	information = DIA_Vlk_534_LeaveMe_Info;
	permanent = 0;
	description = "Proč jsi tady a ne v táboře?";
};

func int DIA_Vlk_534_LeaveMe_Condition()
{
	return 1;
};

func void DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00");	//Proč jsi tady a ne v táboře?
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01");	//Čekám na přítele, až se vrátí z dolu. Dluží mi nějakou rudu.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02");	//Nemůžu přijít do tábora bez rudy - nemohl bych strážím zaplatit peníze za ochranu a to by mi dost věcí zkomplikovalo.
};

var int erz_schulden_day;

instance DIA_VLK_534_HELP(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_help_condition;
	information = dia_vlk_534_help_info;
	permanent = 0;
	description = "Tvůj kámoš ti dluží rudu? Možná bych mohl pomoci.";
};

func int dia_vlk_534_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Vlk_534_LeaveMe))
	{
		return 1;
	};
};

func void dia_vlk_534_help_info()
{
	AI_Output(other,self,"DIA_Vlk_534_Help_15_00");	//Tvůj kámoš ti dluží rudu? Možná bych mohl pomoci.
	AI_Output(self,other,"DIA_Vlk_534_Help_02_01");	//Dobře, pokud se zastavíš ve Starém dolu poohlídni se po chlápkovi jménem Garp. Dluží mi 30 kusů rudy.
	AI_Output(self,other,"DIA_Vlk_534_Help_02_02");	//Řekni mu, že jsem tě poslal, a že ji chci zpátky. Pak ti ji určitě dá.
	AI_Output(self,other,"DIA_Vlk_534_Help_02_03");	//Pokud utečeš s mou rudou a my se zase potkáme, vyřídím si to s tebou, takže o tom ani nepřemýšlej.
	AI_StopProcessInfos(self);
	ERZ_SCHULDEN = LOG_RUNNING;
	Log_CreateTopic(CH1_SCHULDEN,LOG_MISSION);
	Log_SetTopicStatus(CH1_SCHULDEN,LOG_RUNNING);
	B_LogEntry(CH1_SCHULDEN,"Jeden z kopáčů, co vysedává mimo tábor nedaleko od brány Starého tábora, mě požádal, abych mu přinesl jeho rudu. Kopáč jménem Garp, ze Starého dolu, mu dluží 30 nugetů. Jakmile rudu získám, tak mu ji mám přinést.");
	ERZ_SCHULDEN_DAY = Wld_GetDay();
};

instance DIA_VLK_534_BETRAYED(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_betrayed_condition;
	information = dia_vlk_534_betrayed_info;
	permanent = 0;
	important = 1;
};

func int dia_vlk_534_betrayed_condition()
{
	if((ERZ_SCHULDEN == LOG_RUNNING) && (ERZ_SCHULDEN_DAY <= (Wld_GetDay() - 7)))
	{
		return 1;
	};
};

func void dia_vlk_534_betrayed_info()
{
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_15_00");	//Tady jsi parchante!
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_02_01");	//Je to už nějaký čas, co jsem ti řekl, abys mi donesl mou rudu.
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_02_02");	//Myslel jsi si, že s ní můžeš utéct? Počkej, teď je řada na tobě!
	ERZ_SCHULDEN = LOG_FAILED;
	Log_SetTopicStatus(CH1_SCHULDEN,LOG_FAILED);
	B_LogEntry(CH1_SCHULDEN,"Kopáč, který mě požádal, abych získal jeho rudu zpět, nebyl nadšený, když jsem se víc jak týden neukázal.");
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

instance DIA_VLK_534_ERZ(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_erz_condition;
	information = dia_vlk_534_erz_info;
	permanent = 1;
	description = "Mám tvoji rudu.";
};

func int dia_vlk_534_erz_condition()
{
	if(ERZ_SCHULDEN == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_vlk_534_erz_info()
{
	var int zufallsbelohnung;
	if(Npc_HasItems(other,ItMiNugget) >= 30)
	{
		AI_Output(other,self,"DIA_Vlk_534_Erz_15_00");	//Mám tvoji rudu.
		AI_Output(self,other,"DIA_Vlk_534_Erz_02_01");	//Děkuji, máš to u mně.
		AI_Output(self,other,"DIA_Vlk_534_Erz_02_02");	//Tady, vem si za svou pomoc i tuhle odměnu.
		B_GiveInvItems(other,self,ItMiNugget,30);
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItems(self,ItAt_Claws_01,2);
			B_GiveInvItems(self,other,ItAt_Claws_01,2);
		}
		else if(zufallsbelohnung >= 60)
		{
			CreateInvItems(self,ItMw_1H_Poker_01,1);
			B_GiveInvItems(self,other,ItMw_1H_Poker_01,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItem(self,ItMi_Stuff_OldCoin_01);
			B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,2);
		}
		else if(zufallsbelohnung >= 40)
		{
			CreateInvItems(self,ItFoBeer,3);
			B_GiveInvItems(self,other,ItFoBeer,3);
		}
		else if(zufallsbelohnung >= 30)
		{
			CreateInvItems(self,ItFoLoaf,2);
			B_GiveInvItems(self,other,ItFoLoaf,2);
		}
		else if(zufallsbelohnung >= 20)
		{
			CreateInvItems(self,ItMiNugget,10);
			B_GiveInvItems(self,other,ItMiNugget,10);
		}
		else
		//BUG [Fawkes]: ak padne hodnota zufallsbelohnung medzi 0 - 10 tak hrac nedostane ziadnu odmenu
		//if(zufallsbelohnung >= 10)
		{
			CreateInvItems(self,ItMiSwordraw,1);
			B_GiveInvItems(self,other,ItMiSwordraw,1);
		};
		ERZ_SCHULDEN = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_SCHULDEN,LOG_SUCCESS);
		B_LogEntry(CH1_SCHULDEN,"Podařilo se mi rudu získat zpět. Za pomoc mi dal malou odměnu.");
		B_GiveXP(XP_ERZSCHULDEN);
		dia_vlk_534_erz.permanent = 0;
		Npc_ExchangeRoutine(self,"ALTERNATIVE");
	}
	else
	{
		AI_Output(other,self,"DIA_Vlk_534_Erz_15_00");	//Mám tvoji rudu.
		AI_Output(self,other,"DIA_Vlk_534_Erz_15_01");	//Ale to není 30 kusů. Doufám, že jsi zbytek neprochlastal!
		AI_StopProcessInfos(self);
	};
};

