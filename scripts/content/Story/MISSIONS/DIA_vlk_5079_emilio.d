instance VLK_5079_ANNOUNCER_EXIT(C_Info)
{
	npc = vlk_5079_emilio;
	nr = 999;
	condition = vlk_5079_emilio_exit_condition;
	information = vlk_5079_emilio_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int vlk_5079_emilio_exit_condition()
{
	return 1;
};

func void vlk_5079_emilio_exit_info()
{
	AI_StopProcessInfos(self);
};

instance VLK_5079_EMILIO_WELCOME(C_Info)
{
	npc = vlk_5079_emilio;
	condition = vlk_5079_emilio_welcome_condition;
	information = vlk_5079_emilio_welcome_info;
	important = 0;
	permanent = 0;
	description = "Ahoj, kdo jsi?";
};

func int vlk_5079_emilio_welcome_condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void vlk_5079_emilio_welcome_info()
{
	AI_Output(other,self,"Info_Emilio_Welcome_11_01");	//Ahoj, kdo jsi?
	AI_Output(self,other,"Info_Emilio_Welcome_11_02");	//Jsem Emilio. Přišel jsem s posledním nákladem z Vnějšího světa, který dorazil před několika dny.
	AI_Output(self,other,"Info_Emilio_Welcome_11_03");	//Od té doby tu sedím, pravděpodobně budu brzy pracovat v dole.
	AI_Output(self,other,"Info_Emilio_Welcome_11_04");	//Se všemi strážemi kolem asi nemám moc na vybranou.
};

instance VLK_5079_EMILIO_HAPPENED(C_Info)
{
	npc = vlk_5079_emilio;
	condition = vlk_5079_emilio_happened_condition;
	information = vlk_5079_emilio_happened_info;
	important = 0;
	permanent = 0;
	description = "Stalo se tu něco zajímavého?";
};

func int vlk_5079_emilio_happened_condition()
{
	if(Npc_KnowsInfo(hero,vlk_5079_emilio_welcome))
	{
		return TRUE;
	};
};

func void vlk_5079_emilio_happened_info()
{
	AI_Output(other,self,"Info_Emilio_happened_11_01");	//Stalo se tu něco zajímavého?
	AI_Output(self,other,"Info_Emilio_happened_11_02");	//Slyšel jsem, že tu před chvílí byl chlapík, který vyčistil hnízdo důlních červů.
	AI_Output(self,other,"Info_Emilio_happened_11_03");	//Od té doby je Starý důl bezpečnější a my kopáči se můžeme zase dřít pro Gomeze.
	AI_Output(self,other,"Info_Emilio_happened_11_04");	//Skutečný to hrdina ... (povzdech)
	B_GiveXP(XP_EMILIO);
};

