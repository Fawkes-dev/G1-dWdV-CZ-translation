instance DIA_GRD_245_Hello(C_Info)
{
	npc = GRD_245_Gardist;
	nr = 1;
	condition = DIA_GRD_245_Hello_Condition;
	information = DIA_GRD_245_Hello_Info;
	permanent = 1;
	description = "Co je v tom domě?";
};

func int DIA_GRD_245_Hello_Condition()
{
	return 1;
};

func void DIA_GRD_245_Hello_Info()
{
	AI_Output(other,self,"DIA_GRD_245_Hello_15_00");	//Co je v tom domu?
	AI_Output(self,other,"DIA_GRD_245_Hello_13_01");	//To je dům Rudobarona. Pokud chceš jít dál, měl by ses lépe chovat!
};

