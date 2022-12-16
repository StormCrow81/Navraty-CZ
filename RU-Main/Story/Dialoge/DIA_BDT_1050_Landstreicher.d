
instance DIA_Landstreicher_EXIT (C_Info)
{
	npc = BDT_1050_tramp;
	nr = 999;
	condition = DIA_Landstreicher_EXIT_Condition;
	information = DIA_Landstreicher_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tramp_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Tramp_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tramp_HALLO (C_Info)
{
	npc = BDT_1050_tramp;
	nr = 5;
	condition = DIA_Tramper_HALLO_Condition;
	information = DIA_Tramper_HALLO_Info;
	important = TRUE;
};


func int DIA_tramp_HELLO_Condition()
{
	return TRUE;
};

func void DIA_tramp_HELLO_Info()
{
	AI_Output(self,other, " DIA_Landstreicher_HALLO_09_00 " );	// What's going on?
	AI_Output(other,self, " DIA_Landstreicher_HALLO_15_01 " );	// What do you mean?
	AI_Output(self,other, " DIA_Landstreicher_HALLO_09_02 " );	// You're already the second one here, rushing around as if stung by a blood fly.
	Info_ClearChoices(DIA_tramp_HELLO);
	Info_AddChoice(DIA_Landstreicher_HALLO, " I must go on. " ,DIA_Landstreicher_HALLO_weg);
	Info_AddChoice(DIA_tramp_HELLO, " Where is the first? " ,DIA_tramp_HELLO_where);
	Info_AddChoice(DIA_tramp_HALLO, " The second one? " ,DIA_tramp_HALLO_who);
};

func void DIA_vagrant_HELLO_wo()
{
	AI_Output(other,self, " DIA_Landstreicher_HALLO_wo_15_00 " );	// And where did the first one run?
	AI_Output(self,other, " DIA_Landstreicher_HALLO_wo_09_01 " );	// Over there. Ran, that's putting it mildly.
};

func void DIA_tramp_HELLO_who()
{
	AI_Output(other,self, " DIA_Landstreicher_HALLO_wer_15_00 " );	// Who was that?
	AI_Output(self,other, " DIA_Landstreicher_HALLO_wer_09_01 " );	// He looked like one of those big-headed novices from the monastery.
	AI_Output(self,other, " DIA_Landstreicher_HALLO_wer_09_02 " );	// Say what you want, but I don't think those guys are all right in the head.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Landstreicher_HALLO_wer_09_03 " );	// Just look at your ridiculous rags. I wouldn't dare go out like that even at night. (laughs)
		Info_AddChoice(DIA_Landstreicher_HALLO, " Watch your language. " ,DIA_Landstreicher_HALLO_wer_vorsicht);
	};
};

func void DIA_vagrant_HELLO_who_caution()
{
	AI_Output(other,self, " DIA_Landstreicher_HALLO_wer_vorsicht_15_00 " );	// Hold your tongue. I myself was a novice in a monastery.
	AI_Output(self,other, " DIA_Landstreicher_HALLO_wer_vorsicht_09_01 " );	// Oh, you poor thing. That explains a lot.
	AI_Output(self,other, " DIA_Landstreicher_HALLO_wer_vorsicht_09_02 " );	// Nothing personal. Walk with the gods. You're a busy man, I won't keep you.
	Info_AddChoice(DIA_Landstreicher_HALLO, " Somebody needs to teach you manners. " ,DIA_Landstreicher_HALLO_wer_vorsicht_Manieren);
};

func void DIA_tramp_HELLO_who_careful_manners()
{
	AI_Output(other,self, " DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00 " );	// Someone needs to teach you manners.
	AI_Output(self,other, " DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01 " );	// Don't be so touchy. But if you really want to fight, then go ahead.
	AI_Output(self,other, " DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02 " );	// Show me what you acolytes can do.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_vagrant_HELLO_away()
{
	AI_Output(other,self, " DIA_Landstreicher_HALLO_weg_15_00 " );	// I need to go.
	AI_Output(self,other, " DIA_Landstreicher_HALLO_weg_09_01 " );	// Heh. No problem.
	AI_StopProcessInfos(self);
};


instance DIA_Landstreicher_WASMACHSTDU (C_Info)
{
	npc = BDT_1050_tramp;
	nr = 6;
	condition = DIA_Landstreicher_WASMACHSTDU_Condition;
	information = DIA_Landstreicher_WASMACHSTDU_Info;
	permanent = TRUE;
	description = " What are you doing here? " ;
};


func int DIA_vagrant_WASMACHSTDU_Condition()
{
	return TRUE;
};

func void DIA_vagrant_WASMACHSTDU_Info()
{
	AI_Output(other,self, " DIA_Landstreicher_WASMACHSTDU_15_00 " );	// What are you doing here?
	if (Npc_KnowsInfo(other,DIA_Landstreicher_HALLO))
	{
		AI_Output(self,other, " DIA_Landstreicher_WASMACHSTDU_09_01 " );	// You ask too many questions, sucker.
	};
	AI_Output(self,other, " DIA_Landstreicher_WASMACHSTDU_09_02 " );	// Name the goblin cave we crawled in together, and I'll tell you all my secrets.
	AI_Output(self,other, " DIA_Landstreicher_WASMACHSTDU_09_03 " );	// Otherwise, it's none of your business.
	AI_StopProcessInfos(self);
};
