instance Tpl_1436_Templer_Exit(C_Info)
{
	npc = TPL_1436_Templer;
	nr = 999;
	condition = Tpl_1436_Templer_Exit_Condition;
	information = Tpl_1436_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Tpl_1436_Templer_Exit_Condition()
{
	return TRUE;
};

func void Tpl_1436_Templer_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Tpl_1436_Templer_CRAWLER(C_Info)
{
	npc = TPL_1436_Templer;
	condition = Tpl_1436_Templer_CRAWLER_Condition;
	information = Tpl_1436_Templer_CRAWLER_Info;
	important = 0;
	permanent = 1;
	description = "Co se děje?";
};

func int Tpl_1436_Templer_CRAWLER_Condition()
{
	return TRUE;
};

func void Tpl_1436_Templer_CRAWLER_Info()
{
	AI_Output(other,self,"Tpl_1436_Templer_CRAWLER_Info_15_01");	//Co se děje?
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_02");	//Lovíme tady červy. Vedlejším efektem je ochrana kopáčů, což je taky docela dobré.
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_03");	//Hlavní věc, kterou chceme, je výměšek červů. Náš Guru Cor Kalom připravuje magické lektvary z výměšků z čelistí důlních červů.
};

