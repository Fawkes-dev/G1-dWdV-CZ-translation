instance DIA_QUENTIN_EXIT(C_Info)
{
	npc = Org_858_Quentin;
	nr = 999;
	condition = dia_quentin_exit_condition;
	information = dia_quentin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int dia_quentin_exit_condition()
{
	return 1;
};

func void dia_quentin_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_QUENTIN_FIRST(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_first_condition;
	information = dia_quentin_first_info;
	permanent = 0;
	important = 1;
};

func int dia_quentin_first_condition()
{
	if(Npc_KnowsInfo(hero,grd_5018_ramon_letsgo))
	{
		return 1;
	};
};

func void dia_quentin_first_info()
{
	AI_Output(self,other,"DIA_Quentin_First_06_00");	//Koho to tu máme? Pár Gomezových poskoků, co se chtějí dostat do Starého dolu?
	AI_Output(self,other,"DIA_Quentin_First_06_01");	//Měl jsi jít objížďkou, bohužel za tu chybu teď zaplatíš životem.
	AI_Output(self,other,"DIA_Quentin_First_06_02");	//CHLAPI! ÚTOK!
	B_ChangeGuild(Org_865_Raeuber,GIL_ZOMBIE);
	B_ChangeGuild(Org_874_Raeuber,GIL_ZOMBIE);
	B_ChangeGuild(self,GIL_ZOMBIE);
	AI_StopProcessInfos(self);
	B_LogEntry(CH2_KONVOIOC,"Krátce před naším cílem nás s Ramonem přepadli lupiči z Nového tábora. Vůdce skupiny se jmenoval Quentin.");
};

instance DIA_QUENTIN_SECOND(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_second_condition;
	information = dia_quentin_second_info;
	permanent = 0;
	important = 1;
};

func int dia_quentin_second_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_ueberfall))
	{
		return 1;
	};
};

func void dia_quentin_second_info()
{
	AI_Output(self,other,"DIA_Quentin_Angriff_06_01");	//Psst. Tiše!
	AI_Output(self,other,"DIA_Quentin_Angriff__06_02");	//Dobré, že jsi tu. Sedí tam Gomezovi lidé.
	AI_Output(self,other,"DIA_Quentin_First_06_03");	//Vypadá to, že si udělali krátkou přestávku.
	AI_Output(self,other,"DIA_Quentin_First_06_04");	//Můžeme toho využít.
	AI_Output(self,other,"DIA_Quentin_First_06_05");	//Pokud chceš začít, začni a my se přidáme.
	AI_StopProcessInfos(self);
	B_ChangeGuild(grd_5018_ramon,GIL_ZOMBIE);
	B_ChangeGuild(grd_5014_convoitraeger,GIL_ZOMBIE);
	B_ChangeGuild(grd_5015_convoitraeger,GIL_ZOMBIE);
	B_ChangeGuild(grd_5016_convoiwache,GIL_ZOMBIE);
	B_ChangeGuild(grd_5017_convoiwache,GIL_ZOMBIE);
};

instance DIA_QUENTIN_THIRD(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_third_condition;
	information = dia_quentin_third_info;
	permanent = 0;
	important = 1;
};

func int dia_quentin_third_condition()
{
	if((Npc_KnowsInfo(hero,dia_quentin_second) && grd_5018_ramon.aivar[AIV_WASDEFEATEDBYSC] && grd_5014_convoitraeger.aivar[AIV_WASDEFEATEDBYSC] && grd_5015_convoitraeger.aivar[AIV_WASDEFEATEDBYSC] && grd_5016_convoiwache.aivar[AIV_WASDEFEATEDBYSC] && grd_5017_convoiwache.aivar[AIV_WASDEFEATEDBYSC]) || (Npc_KnowsInfo(hero,dia_quentin_second) && Npc_IsDead(grd_5018_ramon) && Npc_IsDead(grd_5014_convoitraeger) && Npc_IsDead(grd_5015_convoitraeger) && Npc_IsDead(grd_5016_convoiwache) && Npc_IsDead(grd_5017_convoiwache)))
	{
		return 1;
	};
};

func void dia_quentin_third_info()
{
	AI_Output(self,other,"DIA_Quentin_Third_06_00");	//Dobře chlape, dobrá práce. Mají dost, hehe.
	AI_Output(self,other,"DIA_Quentin_Third_06_02");	//Dostaneš polovinu kořisti a ta druhá je naše. Tak to u nás funguje.
	AI_Output(self,other,"DIA_Quentin_Third_06_03");	//Tady je tvůj podíl.
	AI_Output(self,other,"DIA_Quentin_Third_06_04");	//Oh, a ještě jedna věc. Vítej mezi nás!
	AI_Output(self,other,"DIA_Quentin_Third_06_05");	//Pokud chceš, můžeš nás navštívit v našem táboře v horách.
	AI_Output(self,other,"DIA_Quentin_Third_06_06");	//Uvidíme se.
	CreateInvItems(self,ItFoApple,21);
	B_GiveInvItems(self,other,ItFoApple,21);
	Npc_RemoveInvItems(other,ItFoApple,21);
	CreateInvItems(other,ItMw_1H_LightGuardsSword_03,1);
	CreateInvItems(other,ItFoApple,5);
	CreateInvItems(other,ItFoLoaf,5);
	CreateInvItems(other,ItFoCheese,5);
	CreateInvItems(other,ItFoBeer,5);
	B_LogEntry(CH2_KONVOINC,"Quentin, vůdce nájezdu na konvoj byl s mojí prací spokojený, vysvětlil mi, jak je kořist rozdělena mezi bandity. Pak se vrátil zpátky do tábora v horách. Měl bych ho tam navštívit, až se k tomu dostanu.");
	AI_StopProcessInfos(self);
};

instance DIA_QUENTIN_WER(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_wer_condition;
	information = dia_quentin_wer_info;
	permanent = 0;
	important = 0;
	description = "Kdo jsi?";
};

func int dia_quentin_wer_condition()
{
	return 1;
};

func void dia_quentin_wer_info()
{
	AI_Output(other,self,"DIA_Quentin_Wer_06_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Quentin_Wer_06_01");	//Jsem Quentin. Jsem šéfem tohoto tábora a starám se o to, aby tu všechno probíhalo hladce.
};

instance DIA_QUENTIN_LAGER(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_lager_condition;
	information = dia_quentin_lager_info;
	permanent = 0;
	important = 0;
	description = "Co je to za tábor?";
};

func int dia_quentin_lager_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_lager_info()
{
	AI_Output(other,self,"DIA_Quentin_Lager_06_00");	//Co je to za tábor?
	AI_Output(self,other,"DIA_Quentin_Lager_06_01");	//Toto je tábor banditů. Žijeme z lovu a z nájezdů na Starý tábor.
	AI_Output(self,other,"DIA_Quentin_Lager_06_02");	//Před časem jsem vyjednal alianci s Laresem, šéfem banditů Nového tábora, podporujeme je při nájezdech.
	AI_Output(self,other,"DIA_Quentin_Lager_06_03");	//Polovina kořisti jde do Nového tábora a druhá polovina nám.
};

instance DIA_QUENTIN_RUESTUNGEN(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_ruestungen_condition;
	information = dia_quentin_ruestungen_info;
	permanent = 0;
	important = 0;
	description = "Nosíš brnění z Nového tábora?";
};

func int dia_quentin_ruestungen_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_ruestungen_info()
{
	AI_Output(other,self,"DIA_Quentin_Ruestungen_06_00");	//Nosíš brnění z Nového tábora?
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_01");	//Ano, vidíš dobře.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_02");	//Pár let zpátky jsme patřili k Novému táboru. Dostali jsme se ale do křížku s žoldáky. Lee nesouhlasil s našimi metodami.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_08_02");	//Víš, my bandité jsme jediní, kdo bojuje proti Gomezovým lidem.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_08_03");	//A co žoldáci?
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_02");	//Pár let zpátky jsme patřili k Novému táboru. Dostali jsme se ale do křížku s žoldáky. Lee nesouhlasil s našimi metodami.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_03");	//Tak jsme se osamostatnili. Chtěli jsme žít osamotě. Daleko od všeho.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_04");	//Tady v tomto údolí jsme našli nezávislost.
};

instance DIA_QUENTIN_HOEHLE(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_hoehle_condition;
	information = dia_quentin_hoehle_info;
	permanent = 0;
	important = 0;
	description = "Co je to za jeskyni?";
};

func int dia_quentin_hoehle_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_hoehle_info()
{
	AI_Output(other,self,"DIA_Quentin_Hoehle_06_00");	//Co je to za jeskyni?
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_01");	//Nevím.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_02");	//Myslím, že to může být zhroucený důlní tunel.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_03");	//Pokud by jsme ho zprůchodnili, měli bychom rudu a mohli pak obchodovat s tábory.
	AI_Output(other,self,"DIA_Quentin_Hoehle_06_04");	//S čim obchodujete teď?
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_05");	//Zejména se zvířecími trofejemi, získánými z lovu. Drápy, kůže, zuby, všechno má hodnotu.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_06");	//Teď se nám zrovna moc nedaří.
};

