instance DIA_VELAYA_EXIT(C_Info)
{
	npc = EBR_108_Velaya;
	nr = 999;
	condition = dia_velaya_exit_condition;
	information = dia_velaya_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_velaya_exit_condition()
{
	return 1;
};

func void dia_velaya_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VELAYA_GOMEZFINISHED(C_Info)
{
	npc = EBR_108_Velaya;
	nr = 1;
	condition = dia_velaya_gomezfinished_condition;
	information = dia_velaya_gomezfinished_info;
	permanent = 0;
	important = 1;
};

func int dia_velaya_gomezfinished_condition()
{
	var C_Npc Gomez;
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	if(Npc_IsDead(Gomez))
	{
		return TRUE;
	};
};

func void dia_velaya_gomezfinished_info()
{
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_00");	//Cože? Jak jsi se sem dostal? Kde je Gomez?
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_01");	//Je z něj žrádlo pro krysy.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_02");	//TY jsi ho zabil?
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_03");	//Vypadá to tak.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_04");	//Konečně! Ani nevíš jak ráda něco takového slyším, už jsem to prase nemohla vystát.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_05");	//Choval se ke mně jako ke svému otrokovi a zamknul mě tu. Teď už je po něm, děkuju.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_06");	//Nemám toho moc, ale vem si tohle.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_07");	//Je to magický artefakt, který jsem mu ukradla. Měl by tě udělat silnějším a odolnějším.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_08");	//Snad tě ochráni na cestách.
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_09");	//Já děkuji tobě.
	B_GiveXP(XP_VELAYAHELP);

	//BUG [Fawkes]: presuva sa item k hracovi ale nevytvara sa.
	//B_GiveInvItems(self,other,Lebensamulett,1);
	CreateInvItem(self,Lebensamulett);
	B_GiveInvItems(self,other,Lebensamulett,1);
};

