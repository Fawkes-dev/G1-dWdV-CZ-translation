instance VLK_586_Grimes_Exit(C_Info)
{
	npc = VLK_586_Grimes;
	nr = 999;
	condition = VLK_586_Grimes_Exit_Condition;
	information = VLK_586_Grimes_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

func void VLK_586_Grimes_Exit_Info()
{
	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01");	//Hodně štěstí!
	AI_Output(self,other,"VLK_586_Grimes_Exit_Info_04_02");	//Tobě taky, chlapče, tobě taky.
	AI_StopProcessInfos(self);
};

instance VLK_586_Grimes_STORY(C_Info)
{
	npc = VLK_586_Grimes;
	condition = VLK_586_Grimes_STORY_Condition;
	information = VLK_586_Grimes_STORY_Info;
	important = 0;
	permanent = 0;
	description = "Jsi tady už dlouho?";
};

func int VLK_586_Grimes_STORY_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_586_Grimes_FIRST))
	{
		return 1;
	};
};

func void VLK_586_Grimes_STORY_Info()
{
	AI_Output(other,self,"VLK_586_Grimes_STORY_Info_15_01");	//Jsi tady už dlouho?
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_02");	//Jsem tady už 10 let. Věř mi, naučil jsem se toho už dost a také jsem nabyl zkušenosti.
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_03");	//Čelil jsem už mnoha nebezpečím a podařilo se mi přežít.
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_04");	//Za starých časů, když jsme pracovali v zavřeném dolu, v tom, který je teď opuštěný,  se zhroutily nosné trámy...
	AI_Output(self,other,"VLK_586_Grimes_STORY_Info_04_05");	//To je ale starý příběh...
};

instance VLK_586_Grimes_KNOW(C_Info)
{
	npc = VLK_586_Grimes;
	condition = VLK_586_Grimes_KNOW_Condition;
	information = VLK_586_Grimes_KNOW_Info;
	important = 0;
	permanent = 0;
	description = "Určitě jsi také slyšel o spoustě únikových cest.";
};

func int VLK_586_Grimes_KNOW_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_586_Grimes_STORY))
	{
		return 1;
	};
};

func void VLK_586_Grimes_KNOW_Info()
{
	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_01");	//Určitě jsi také slyšel o spoustě únikových cest.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_02");	//Poslyš, hochu: vím, že odtud chceš pryč, ale na to zapomeň.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_03");	//Lepší bude zapomenout na ty únikové cesty. Viděl jsem tváře těch, co se pokoušeli dostat z Bariéry.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_04");	//Neudělej tu samou chybu, Bariéra zastaví každého.
	AI_Output(other,self,"VLK_586_Grimes_KNOW_Info_15_05");	//Nechci dalších deset let života rubat v dole!
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_06");	//Ne, nebudeš! Snad budeš jedním z těch velkých šéfů, kdo ví.
	AI_Output(self,other,"VLK_586_Grimes_KNOW_Info_04_07");	//Vypracuješ se dál, ale bez ohledu na to jak vysoko, Bariéra tě vždycky nakonec zastaví.
};

instance VLK_586_Grimes_FIRST(C_Info)
{
	npc = VLK_586_Grimes;
	condition = VLK_586_Grimes_FIRST_Condition;
	information = VLK_586_Grimes_FIRST_Info;
	important = 1;
	permanent = 0;
};

func int VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void VLK_586_Grimes_FIRST_Info()
{
	AI_Output(self,other,"VLK_586_Grimes_FIRST_Info_04_02");	//Nová tvář. Už si někdy kutal rudu, hochu?
};

instance VLK_586_GRIMES_GARRET(C_Info)
{
	npc = VLK_586_Grimes;
	condition = vlk_586_grimes_garret_condition;
	information = vlk_586_grimes_garret_info;
	important = 0;
	permanent = 0;
	description = "Znáš chlapa jménem Garret?";
};

func int vlk_586_grimes_garret_condition()
{
	if(LOST_DIGGER == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_586_grimes_garret_info()
{
	AI_Output(other,self,"VLK_586_Grimes_GARRET_Info_15_01");	//Znáš někoho jménem Garret?
	AI_Output(self,other,"VLK_586_Grimes_GARRET_Info_15_02");	//Garret? Samozřejmě, že znám.
	AI_Output(self,other,"VLK_586_Grimes_GARRET_Info_15_03");	//Chlapče, kopali jsme spolu ještě v opuštěném dolu.
	AI_Output(self,other,"VLK_586_Grimes_GARRET_Info_15_04");	//Byl to dobrej chlap. Co s ním chceš?
	AI_Output(other,self,"VLK_586_Grimes_GARRET_Info_15_05");	//Zmizel a já se snažím zjistit, kde by mohl být.
	AI_Output(self,other,"VLK_586_Grimes_GARRET_Info_15_06");	//Zmizel? No já netuším kde  by mohl být. Většinou jsem tady a nic jiného mne moc nezajímá.
	AI_Output(self,other,"VLK_586_Grimes_GARRET_Info_15_07");	//Promluv si s mladšími kopáči, určitě něco budou vědět.
	B_LogEntry(CH1_LOSTDIGGER,"Grimes zná Garreta, ale neví, kde by mohl být. Ale dal mi tip, že bych si měl promluvit s mladšími kopáči.");
};

