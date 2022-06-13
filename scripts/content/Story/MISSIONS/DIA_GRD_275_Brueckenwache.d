instance Info_GRD_275_PreExit(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 999;
	condition = Info_GRD_275_PreExit_Condition;
	information = Info_GRD_275_PreExit_Info;
	permanent = 0;
	description = DIALOG_ENDE;
};

func int Info_GRD_275_PreExit_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_GRD_275_PreExit_Info()
{
	AI_Output(self,other,"Info_GRD_275_PreExit_06_01");	//Určitě se musíš zastavit ve Starém táboře, mají tam pro tebe krumpáč, haha!
	AI_Output(other,self,"Info_GRD_275_PreExit_15_02");	//Rozhodně nebudu v dolech pracovat pro tebe.
	AI_Output(self,other,"Info_GRD_275_PreExit_06_03");	//Chceš se k nám přidat? Tak se chovej hezky, protože tady budeme i zítra, a ty budeš možná zítra něco potřebovat. (úsměv)
	AI_Output(other,self,"Info_GRD_275_PreExit_15_04");	//Slyšel jsem, že jsou tu i další tábory ...
	AI_Output(self,other,"Info_GRD_275_PreExit_06_05");	//No jestli se tu budeš špacírovat tímhle spůsobem, daleko nedojdeš. Zmizni.
	AI_StopProcessInfos(self);
};

instance Info_GRD_275_Exit(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 999;
	condition = Info_GRD_275_Exit_Condition;
	information = Info_GRD_275_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};

func int Info_GRD_275_Exit_Condition()
{
	if((Kapitel > 1) || Npc_KnowsInfo(hero,Info_GRD_275_PreExit))
	{
		return 1;
	};
};

func void Info_GRD_275_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Info_GRD_275_WasMachtIhrHier(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 1;
	condition = Info_GRD_275_WasMachtIhrHier_Condition;
	information = Info_GRD_275_WasMachtIhrHier_Info;
	permanent = 1;
	description = "Co tady děláš?";
};

func int Info_GRD_275_WasMachtIhrHier_Condition()
{
	return 1;
};

func void Info_GRD_275_WasMachtIhrHier_Info()
{
	AI_Output(other,self,"Info_GRD_275_WasMachtIhrHier_15_00");	//Co tady děláte?
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_01");	//Co myslíš? Hlídáme tady přece most!
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_02");	//Dáváme pozor, aby tu přes něj nepřešly ty bestie.
};

instance Info_GRD_275_Tips(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 1;
	condition = Info_GRD_275_Tips_Condition;
	information = Info_GRD_275_Tips_Info;
	permanent = 1;
	description = "Neměl bys pro mě nějakou radu?";
};

func int Info_GRD_275_Tips_Condition()
{
	return 1;
};

func void Info_GRD_275_Tips_Info()
{
	AI_Output(other,self,"Info_GRD_275_Tips_15_00");	//Neměl bys pro mě nějakou radu?
	AI_Output(self,other,"Info_GRD_275_Tips_06_01");	//Jistě. Nechoď sám do lesa.
	AI_Output(self,other,"Info_GRD_275_Tips_06_02");	//Dokud nebudeš natolik silný, abys přemohl ty bestie.
};

