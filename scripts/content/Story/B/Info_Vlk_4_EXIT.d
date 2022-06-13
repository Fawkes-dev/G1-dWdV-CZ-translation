instance Info_Vlk_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_4_EXIT_Condition;
	information = Info_Vlk_4_EXIT_Info;
	permanent = 1;
	description = "KONEC";
};

func int Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_4_EXIT_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00");	//Díky. Hodně štěstí.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01");	//Hlavu vzhůru, hochu.
	AI_StopProcessInfos(self);
};

instance Info_Vlk_4_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_4_EinerVonEuchWerden_Condition;
	information = Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Co musím udělat, abych se mohl přidat k táboru?";
};

func int Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_4_EinerVonEuchWerden_Info()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01");	//Co musím udělat, abych se mohl přidat k táboru?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04");	//Myslíš jako Stín nebo jako strážce? To nebude snadné, člověče. Než tě starý Thorus pustí za Gomezem, budeš muset složit pár zkoušek.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02");	//A budeš tu muset dobře vyjít s lidmi Ale dokud nebudeš patřit k nějakému táboru, nikdo tě nebude brát vážně.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03");	//Být tebou, dal bych řeč s některým ze Stínů. Možná bys našel někoho, kdo by ti mohl pomoci. Samozřejmě když nabídneš něco na oplátku.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

instance Info_Vlk_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_4_WichtigePersonen_Condition;
	information = Info_Vlk_4_WichtigePersonen_Info;
	permanent = 1;
	description = "Je tu něco zvláštního, co bych měl vědět?";
};

func int Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00");	//Je tu někdo důležitý, koho bych měl znát?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_03");	//Ty? Chlapče, jsi jeden z Rudobaronů. Sotva tu bude někdo, koho potřebuješ ještě znát.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01");	//Když jsi tu nový, neměl by ses dostat do křížku s Gravem. I když je jenom kopáč, ví, jak jednat s Rudobarony.
		AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02");	//Pokud se dostaneš do problémů s někým z Gomezovy party, může ti z toho pomoci ven.
	};
};

instance Info_Vlk_4_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_4_DasLager_Condition;
	information = Info_Vlk_4_DasLager_Info;
	permanent = 1;
	description = "Která místa bych tady měl znát?";
};

func int Info_Vlk_4_DasLager_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00");	//Která místa bych tady měl znát?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01");	//Jestli nemáš chuť kopat v dolech, měl by ses porozhlédnout mezi severní a hradní bránou.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02");	//Když budeš mít štěstí, Thorus nebo Diego by ti mohli navrhnout něco, co bys pro ně mohl udělat - tak budeš mít šanci dostat se na jejich stranu. Určitě není špatné patřit ke Gomezovým lidem..
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03");	//Nebo by ses měl setkat s mágy. Občas potřebují vyřídit nějaké obchůzky. A platí vždycky dobře.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04");	//Mágové vycházejí z hradu? A kdy?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05");	//Co já vím.Zeptej se lidí, kteří tam žijí.
};

instance Info_Vlk_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_4_DieLage_Condition;
	information = Info_Vlk_4_DieLage_Info;
	permanent = 1;
	description = "Jsi v pořádku?";
};

func int Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00");	//Jsi v pořádku?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_4_DieLage_04_02");	//Vypracoval jsi se opravdu hezky. Rudobaron, titul, který nenosí každý, chlapče.
		AI_Output(self,other,"Info_Vlk_4_DieLage_04_03");	//Dostal jsi se až na vrchol.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_4_DieLage_04_01");	//Tak jako před dvaceti lety. Nic se za tu dobu nezměnilo.
	};
};

instance INFO_VLK_4_GESCHICHTE(C_Info)
{
	nr = 12;
	condition = info_vlk_4_geschichte_condition;
	information = info_vlk_4_geschichte_info;
	permanent = 1;
	description = "Můžeš mi říct něco zajímavého?";
};

func int info_vlk_4_geschichte_condition()
{
	return 1;
};

func void info_vlk_4_geschichte_info()
{
	var int geschichten;
	AI_Output(other,self,"Info_Vlk_4_Geschichte_15_00");	//Můžeš mi říct něco zajímavého?
	geschichten = Hlp_Random(100);
	if(geschichten < 25)
	{
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_00");	//Už ti někdy někdo řekl o tom velkém povstání?
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_01");	//Den, kdy byla bariéra postavena, začal jako každý jiný.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_02");	//My, vězni jsme seděli na nádvoří hradu a chystali se na ceatu do Opuštěného dolu, abychom se mohli věnovat své ... práci.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_03");	//Najednou se ozval hlasitý třesk a oblohu zakryli blesky.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_04");	//Pak se přes celé údolí natáhla modrá kupole. Dnes známá jako 'Bariéra'.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_05");	//Strážci pravděpodobně nevěděli o plánech Mágů, protože byli stejně překvapení, jako my, když hleděli na oblohu.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_06");	//Mezi vězni byli lidé, kteří využili nedostatku pozornosti.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_07");	//Gomez a jeho chlapi viděli svou šanci a zaútočili na stráže.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_08");	//Krompáče, které jsme měli používat při práci, byly použity jako zbraně k zabití stráží.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_09");	//Když byli všichni dozorci mrtví, Gomez zavelel svým lidem, aby vzali zbraně a stáhli brnění z těl dozorců.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_10");	//Poté vhodili mrtvoly do řeky jako potravu pro chňapavce.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_11");	//Krátce nato začala Gomezova vláda.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_12");	//Věř mi, chlapče, jakmile vidíš něco takového, nikdy na to nezapomeneš.
	}
	else if(geschichten < 50)
	{
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_00");	//Znáš historii vzniku Sektovního tábora?
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_01");	//Několik let zpátky, byl Y'Berion kopáčem, tak jako všichni ostatní.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_02");	//Jednoho dne stál ráno na tržišti a povídal ostatním, že měl vizi.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_03");	//Mluvil o 'Spáči', 'ruinách v bažinách' a 'svobodě'.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_04");	//Většina lidí tady to považovala za nesmysly. Ale našli se i tací, které přesvědčil aby se k němu přidali.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_05");	//Zakrátko se společně přesunuli do bažin. A založili tam tábor.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_06");	//Pak tam našli Trávu z bažin. Většina členů toho kultu říkala, že to Spáč jim ji ukázal. Ale pokud se zeptáš mě, tak jeden z nich si prostě chtěl jenom zakouřit.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_07");	//To je jedno. Když ostatní tábory přišli nato, že mají co nabídnout, začali s nimi obchodovat. Y'Berion a jeho lidé tak dostali vše, co potřebovali k přežití.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_08");	//Tráva je jedním z hlavních důvodů, proč se k Y'Berionovi přidalo tolik lidí.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_09");	//Každopádně 'Spáč' dodnes Y'Beriona nekontaktoval.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_10");	//Myslím, že to všechno stejně jen nějaký nesmysl. Ale pokud hledáš něco ke kouření, sektovní tábor je tím správným místem.
	} else
	//BUG [Fawkes]: Ak by padla hodnota geschichten medzi 75 - 100 (99) tak by sa ziadny dialog nespustil
	//if(geschichten < 75)
	{
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_00");	//Kdysi jsme měli v táboře Rudobarona, který nebyl jako Gomez a ostatní.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_01");	//Byl odvážnější, prozkoumával ruiny Kolonie.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_02");	//Říká se, že odešel na skřetí území, aby tam našel nějaký artefakt.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_03");	//Hledání asi nebylo moc  úspěšné. Nikdy se nevrátil.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_04");	//Mezi lidmi se povídá, že je stále naživu a teď hlídá tento artefakt.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_05");	//Jak jsem řekl, jenom se to povídá. Nedokážu si představit, že je na tom něco pravdy.
	};
};

func void B_AssignAmbientInfos_Vlk_4(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_geschichte.npc = Hlp_GetInstanceID(slf);
};

