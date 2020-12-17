instance Info_ORG_829_EXIT(C_Info)
{
	npc = Org_829_Organisator;
	nr = 999;
	condition = Info_ORG_829_EXIT_Condition;
	information = Info_ORG_829_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_ORG_829_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_829_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_ORG_829_Hello(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_Hello_Condition;
	information = Info_ORG_829_Hello_Info;
	permanent = 0;
	description = "Jak to jde?";
};

func int Info_ORG_829_Hello_Condition()
{
	return 1;
};

func void Info_ORG_829_Hello_Info()
{
	AI_Output(other,self,"Info_ORG_829_Hello_15_00");	//Jak to jde?
	AI_Output(self,other,"Info_ORG_829_Hello_06_01");	//Docela to ujde, ale nemám co kouřit.
};

var int Org_829_GotJoint;

instance Info_ORG_829_OfferJoint(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_OfferJoint_Condition;
	information = Info_ORG_829_OfferJoint_Info;
	permanent = 0;
	description = "Mám drogu z bažin - chceš trochu?";
};

func int Info_ORG_829_OfferJoint_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_829_Hello))
	{
		return 1;
	};
};

func void Info_ORG_829_OfferJoint_Info()
{
	AI_Output(other,self,"Info_ORG_829_OfferJoint_15_00");	//Mám drogu z bažin - chceš trochu?
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"Info_ORG_829_OfferJoint_06_01");	//Jistě! Jsi jeden z překupníků ze Sektovního tábora, nebo co?
		Org_829_GotJoint = TRUE;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output(self,other,"Info_ORG_829_OfferJoint_No_Joint_06_00");	//Hej, člověče! Přestaň takhle žvanit, jasný? Nemám to rád.
	};
};

instance Info_ORG_829_SpecialInfo(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_SpecialInfo_Condition;
	information = Info_ORG_829_SpecialInfo_Info;
	permanent = 0;
	description = "Právě jsem přišel - můžeš mi dát nějakou radu?";
};

func int Info_ORG_829_SpecialInfo_Condition()
{
	if(Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

func void Info_ORG_829_SpecialInfo_Info()
{
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_00");	//Právě jsem přišel - můžeš mi dát nějakou radu?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_01");	//Jistě! Když přijdeš do tábora, jdi za Gornem. Patří ke kouzelnickým žoldákům, ale je dobrý. Býval jedním z nás.
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_02");	//Co myslíš tím 'z nás'?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_03");	//Psanec, samozřejmě. Jeden z 'nakopávačů Rudobaronskejch zadků'!
};

instance Info_ORG_829_PERM(C_Info)
{
	npc = Org_829_Organisator;
	nr = 2;
	condition = Info_ORG_829_PERM_Condition;
	information = Info_ORG_829_PERM_Info;
	permanent = 0;
	description = "Můžeš mi říct, co mě v táboře čeká?";
};

func int Info_ORG_829_PERM_Condition()
{
	if(Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

func void Info_ORG_829_PERM_Info()
{
	AI_Output(other,self,"Info_ORG_829_PERM_15_00");	//Můžeš mi říct, co mě v táboře čeká?
	AI_Output(self,other,"Info_ORG_829_PERM_06_01");	//Tak běž a zjisti to.
};

instance DIA_ORG_829_SCGOMEZ(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = dia_org_829_scgomez_condition;
	information = dia_org_829_scgomez_info;
	permanent = 0;
	important = 1;
};

func int dia_org_829_scgomez_condition()
{
	if((other.guild == GIL_STT) || (other.guild == GIL_GRD))
	{
		return 1;
	};
};

func void dia_org_829_scgomez_info()
{
	AI_Output(self,other,"DIA_Org_829_ScGomez_06_00");	//Hodně štěstí!
	AI_Output(other,self,"DIA_Org_829_ScGomez_06_01");	//Co?
	AI_Output(self,other,"DIA_Org_829_ScGomez_06_02");	//Držím palce, abys odsud vyvázl se zdravou kůži. Víš, tady nejsou Gomezovi lidé vítaní. Určitě nebudu poslední, kdo ti o tom řekne. Hehe.
	ORG_876_Tuersteher.aivar[AIV_PASSGATE] = FALSE;
};

