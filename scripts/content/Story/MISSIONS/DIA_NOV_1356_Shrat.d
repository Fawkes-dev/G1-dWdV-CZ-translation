instance DIA_Shrat_Exit(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 999;
	condition = DIA_Shrat_Exit_Condition;
	information = DIA_Shrat_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int DIA_Shrat_Exit_Condition()
{
	return 1;
};

func void DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Shrat_WhyHere(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_WhyHere_Condition;
	information = DIA_Shrat_WhyHere_Info;
	permanent = 0;
	description = "Co tady děláš?";
};

func int DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

func void DIA_Shrat_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01");	//Dovolil jsem ti na mě mluvit?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02");	//Jen žertuju! Ti zatracení cvoci mi lezou na nervy, proto jsem tady!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03");	//Nemluv na mě!' - 'Modli se ke Spáčovi za odpuštění!' - 'Tvůj úkol je nesmírně důležitý!'
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04");	//Nejde to pustit z hlavy - není divu, že se z toho všichni tady pominuli.
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05");	//Jsem Shrat, novic první třídy - a tím také navždy zůstanu!
};

instance DIA_Shrat_JoinPSI(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_JoinPSI_Condition;
	information = DIA_Shrat_JoinPSI_Info;
	permanent = 0;
	description = "Chci se přidat k Bratrstvu - můžeš mi pomoci?";
};

func int DIA_Shrat_JoinPSI_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Shrat_JoinPSI_Info()
{
	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00");	//Chci se přidat k Bratrstvu - můžeš mi pomoci?
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01");	//Chceš se k nám přidat? Já už vážně přemýšlím o tom, jak se odsud dostat.
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02");	//Mohli bychom se potulovat po kolonii. Ulehčit pár mamlasům o jejich peníze, nasbírat nějakou rudu - co myslíš?
};

instance DIA_Shrat_ComeWithMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_ComeWithMe_Condition;
	information = DIA_Shrat_ComeWithMe_Info;
	permanent = 1;
	description = "Můžeme se toulat společně! Pojď se mnou!";
};

func int DIA_Shrat_ComeWithMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};
};

func void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//Můžeme se toulat společně! Pojď se mnou!
	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01");	//Tohle rád slyším! Pojďme!
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

instance DIA_Shrat_LeaveMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 700;
	condition = DIA_Shrat_LeaveMe_Condition;
	information = DIA_Shrat_LeaveMe_Info;
	permanent = 1;
	description = "Naše cesty se rozcházejí - půjdu si po svých.";
};

func int DIA_Shrat_LeaveMe_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return 1;
	};
};

func void DIA_Shrat_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00");	//Naše cesty se rozcházejí - půjdu si po svých.
	if(!Npc_KnowsInfo(hero,nov_1356_shrat_tavern))
	{
		AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01");	//Dobře. Já se vrátím do svého úkrytu v bažinách. Dávej na sebe pozor!
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Shrat_LeaveMe_02_02");	//Dobře. Pak půjdu do baru v Novém táboře. Takže pokud mě budeš potřebovat, najdeš mě tam. Do té doby se opatruj!
		Npc_ExchangeRoutine(self,"NEWCAMP");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
	};
};

instance NOV_1356_SHRAT_WELCOME(C_Info)
{
	npc = NOV_1356_Shrat;
	condition = nov_1356_shrat_welcome_condition;
	information = nov_1356_shrat_welcome_info;
	important = 1;
	permanent = 0;
};

func int nov_1356_shrat_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1356_shrat_welcome_info()
{
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_01");	//Chlape, vypadá to, že jsi s těmi blázny strávil moc času. Oh, zapomněl jsem, že jsi mi nedovolil oslovit tě. Hehe.
	AI_StopProcessInfos(self);
};

instance NOV_1356_SHRAT_TAVERN(C_Info)
{
	npc = NOV_1356_Shrat;
	condition = nov_1356_shrat_tavern_condition;
	information = nov_1356_shrat_tavern_info;
	important = 1;
	permanent = 0;
};

func int nov_1356_shrat_tavern_condition()
{
	if((Npc_GetDistToWP(self,"NC_TAVERN_ROOM01") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void nov_1356_shrat_tavern_info()
{
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_01");	//Chlape, vypadá to, že jsi s těmi blázny strávil moc času. Oh, zapomněl jsem, že jsi mi nedovolil oslovit tě. Hehe.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_02");	//... tady to nevypadá vůbec špatně, že?
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_03");	//Myslím, že až se příště rozejdeme, tak zůstanu tady a nepůjdu zpátky do bažin prolezlých příšerami.
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_04");	//Dám přednost dobré společnosti rýžové pálenky před močálovými žralokmi. Hehe.
	B_GiveXP(XP_SHRAT);
	AI_StopProcessInfos(self);
};

