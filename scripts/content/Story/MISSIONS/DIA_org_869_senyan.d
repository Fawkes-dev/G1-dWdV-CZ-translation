instance DIA_SENYAN1_EXIT(C_Info)
{
	npc = org_869_senyan;
	nr = 999;
	condition = dia_senyan1_exit_condition;
	information = dia_senyan1_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_senyan1_exit_condition()
{
	return 1;
};

func void dia_senyan1_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SENYAN1_HELLO(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan1_hello_condition;
	information = dia_senyan1_hello_info;
	permanent = 0;
	important = 1;
};

func int dia_senyan1_hello_condition()
{
	return 1;
};

func void dia_senyan1_hello_info()
{
	AI_Output(self,other,"DIA_Senyan1_Hello_15_00");	//Hej ty! Kdo jsi a proč jsem tě tu nikdy neviděl?
	AI_Output(other,self,"DIA_Senyan1_Hello_15_01");	//Není divu, jsem tu nový.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_02");	//Oh, tak to jo. Měl by jsi si dát pozor kde všude se potuluješ.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_03");	//Je tu pár lidí, co nestrpí zvědavé nováčky, co všude strkají svůj nos.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_04");	//Takže dávej pozor na to, co děláš.
	AI_StopProcessInfos(self);
};

instance DIA_SENYAN_ORT(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan_ort_condition;
	information = dia_senyan_ort_info;
	permanent = 1;
	important = 0;
	description = "Co je tohle za místo?";
};

func int dia_senyan_ort_condition()
{
	return 1;
};

func void dia_senyan_ort_info()
{
	AI_Output(other,self,"DIA_Senyan_Ort_15_00");	//Co je tohle za místo?
	AI_Output(self,other,"DIA_Senyan_Ort_15_01");	//Toto je jediné místo, kde jsme v této zatracené Kolonii opravdu svobodní.
	AI_Output(self,other,"DIA_Senyan_Ort_15_02");	//Jsme jediné nezávislé místo, které tu najdeš. Nejsou tu žádní templáři, žoldáci ani strážci.
	AI_Output(self,other,"DIA_Senyan_Ort_15_03");	//Všechno co potřebujeme k přežití ukradneme z Gomezových konvojů, anebo získame z lovu.
	AI_Output(self,other,"DIA_Senyan_Ort_15_04");	//Jak vidíš, žijeme daleko od všech táborů a stále se nám velmi dobře daří.
};

var int senyan_esteban;

instance DIA_SENYAN_ESTEBAN(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan_esteban_condition;
	information = dia_senyan_esteban_info;
	permanent = 0;
	important = 0;
	description = "Co si myslíš o Estebanovi?";
};

func int dia_senyan_esteban_condition()
{
	if(ESTEBAN_LEADER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_senyan_esteban_info()
{
	AI_Output(other,self,"DIA_Senyan_Esteban_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Senyan_Esteban_15_01");	//Co si myslím?
	AI_Output(self,other,"DIA_Senyan_Esteban_15_02");	//Esteban je jediný, kdo má na to vést tenhle tábor.
	AI_Output(self,other,"DIA_Senyan_Esteban_15_03");	//Jistě, Quentin je stále vůdcem, ale ne nadlho, to ti povídám.
	B_LogEntry(CH1_ESTEBANQUENTIN,"Senyan věří, že Esteban je jediný, kdo tábor může vést. Nemyslí si, že Quentin zůstane ve vedení dlouho.");
	SENYAN_ESTEBAN = TRUE;
};

