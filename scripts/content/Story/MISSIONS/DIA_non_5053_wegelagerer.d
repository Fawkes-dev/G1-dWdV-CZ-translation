instance DIA_WEGELAGERER_EXIT(C_Info)
{
	npc = non_5053_wegelagerer;
	nr = 999;
	condition = dia_wegelagerer_exit_condition;
	information = dia_wegelagerer_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_wegelagerer_exit_condition()
{
	return 1;
};

func void dia_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_WEGELAGERER_HELLO(C_Info)
{
	npc = non_5053_wegelagerer;
	nr = 1;
	condition = dia_wegelagerer_hello_condition;
	information = dia_wegelagerer_hello_info;
	permanent = 0;
	important = 1;
};

func int dia_wegelagerer_hello_condition()
{
	return 1;
};

func void dia_wegelagerer_hello_info()
{
	AI_Output(self,other,"DIA_Wegelagerer_Hello_15_00");	//Ahoj chlapečku, kampak chceš jít?
	AI_Output(other,self,"DIA_Wegelagerer_Hello_12_01");	//To není tvoje starost.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_02");	//Ten před tebou to taky říkal.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_03");	//Ale víš, viděl jsem to jinak, a teď je z něj žrádlo pro krysy.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_04");	//Ty neskončíš jinak, Kolonie má svá pravidla.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_05");	//Budu na tebe myslet při propíjení tvé rudy. Hehe.
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

