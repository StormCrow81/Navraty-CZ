
instance DIA_1051_Wegelagerer_EXIT (C_Info)
{
	npc = BDT_1051_hijacker;
	nr = 999;
	condition = DIA_1051_Wegelagerer_EXIT_Condition;
	information = DIA_1051_Wegelagerer_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int BDT_1051_Hijacker_Attack;

func int DIA_1051_Wegelagerer_EXIT_Condition()
{
	if (Npc_KnowsInfo(other,DIA_1051_Router_Question) || (BDT_1051_Router_Attack ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_1051_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if (BDT_1051_Wegelagerer_Angriff ==  TRUE )
	{
		self.aivar[AIV_EnemyOverride] = FALSE ;
		BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE ;
	};
};


instance DIA_1051_Wegelagerer_Hello (C_Info)
{
	npc = BDT_1051_hijacker;
	nr = 4;
	condition = DIA_Wegelagerer_Hello_Condition;
	information = DIA_Wegelagerer_Hello_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Wegelagerer_Hello_Condition()
{
	if (BDT_1051_Wegelagerer_Angriff ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_Hello_Info()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Hello_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_1051_Wegelagerer_Hello_07_01 " );	// What do you need?
};


instance DIA_1051_Wegelagerer_Novice (C_Info)
{
	npc = BDT_1051_hijacker;
	nr = 4;
	condition = DIA_Wegelagerer_Novice_Condition;
	information = DIA_Wegelagerer_Novice_Info;
	permanent = FALSE;
	description = " I'm looking for an acolyte. " ;
};


func int DIA_Wegelagerer_Novice_Condition()
{
	if ((MIS_NovizenChase == LOG_Running) && (MIS_SCKnowsInnosEyeIsBroken ==  FALSE ) && (BDT_1051_Wegelagerer_Angriff ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_Novice_Info()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Novice_15_00 " );	// I'm looking for an acolyte.
	AI_Output(self,other, " DIA_1051_Wegelagerer_Novice_07_01 " );	// Very interesting. We are also looking for someone.
	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
	Info_AddChoice(DIA_1051_Wegelagerer_Novice, " Who are you looking for? " ,DIA_1051_Wegelagerer_Question_Novice_Who);
};


instance DIA_1051_Wegelagerer_Question(C_Info)
{
	npc = BDT_1051_hijacker;
	nr = 4;
	condition = DIA_Wegelagerer_Question_Condition;
	information = DIA_Wegelagerer_Question_Info;
	permanent = FALSE;
	description = " I was just asking. " ;
};


func int DIA_Wegelagerer_Question_Condition()
{
	if (Npc_KnowsInfo(other,DIA_1051_Wegelagerer_Hello) && (BDT_1051_Wegelagerer_Angriff ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_Question_Info()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Question_15_00 " );	// I just asked.
	AI_Output(self,other, " DIA_1051_Wegelagerer_Question_07_01 " );	// Got it. But what are YOU doing here?
	AI_Output(self,other, " DIA_1051_Wegelagerer_Question_07_02 " );	// Okay. This is our road and we don't like it when someone bothers us here.
	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
	if ((MIS_NovizenChase == LOG_Running) && (MIS_SCKnowsInnosEyeIsBroken ==  FALSE ))
	{
		Info_AddChoice(DIA_1051_Wegelagerer_Question, " I'm looking for a novice. " ,DIA_1051_Wegelagerer_Question_Novice);
	};
	Info_AddChoice(DIA_1051_Wegelagerer_Question, " It's none of your business. " ,DIA_1051_Wegelagerer_Question_MyConcern);
	Info_AddChoice(DIA_1051_Wegelagerer_Question, " I just love nature. " ,DIA_1051_Wegelagerer_Question_LookAround);
};

func void DIA_1051_Wegelagerer_Question_Novice()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Question_Novice_15_00 " );	// I'm looking for an acolyte.
	AI_Output(self,other, " DIA_1051_Wegelagerer_Question_Novice_07_01 " );	// Very interesting. We are also looking for someone.
	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
	Info_AddChoice(DIA_1051_Wegelagerer_Question, " Who are you looking for? " ,DIA_1051_Wegelagerer_Question_Novice_Who);
};

func void DIA_1051_Wegelagerer_Question_Novice_Who()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Question_Novice_Who_15_00 " );	// And who?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01");	//Тебя!
	BDT_1051_Wegelagerer_Angriff = TRUE ;
	Npc_SetRefuseTalk(self,40);
	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
};

func void DIA_1051_Wegelagerer_Question_MyConcern()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Question_MyConcern_15_00 " );	// It's none of your business.
	AI_Output(self,other, " DIA_1051_Wegelagerer_Question_MyConcern_07_01 " );	// What do you mean by that? Are you running into trouble?
	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
	Info_AddChoice(DIA_1051_Wegelagerer_Question, " No, nothing. No trouble needed. " ,DIA_1051_Wegelagerer_Question_MyConcern_No);
	Info_AddChoice(DIA_1051_Wegelagerer_Question, " If you like it. " ,DIA_1051_Wegelagerer_Question_MyConcern_Yes);
};

func void DIA_1051_Wegelagerer_Question_MyConcern_No()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Question_MyConcern_No_15_00 " );	// No, nothing. No need for any trouble.
	AI_Output(self,other, " DIA_1051_Wegelagerer_Question_MyConcern_No_07_01 " );	// Clearly, he put it in his pants. Now get lost.
	AI_StopProcessInfos(self);
};

func void DIA_1051_Wegelagerer_Question_MyConcern_Yes()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00 " );	// If you like.
	AI_Output(self,other, " DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01 " );	// Ho-ho, what a brat.
	AI_Output(self,other, " DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02 " );	// Now we'll shut your mouth.
	BDT_1051_Wegelagerer_Angriff = TRUE ;
	Npc_SetRefuseTalk(self,40);
	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
};

func void DIA_1051_Wegelagerer_Question_LookAround()
{
	AI_Output(other,self, " DIA_1051_Wegelagerer_Question_LookAround_15_00 " );	// I'm just admiring nature.
	AI_Output(self,other, " DIA_1051_Wegelagerer_Question_LookAround_07_01 " );	// Admire further, but don't bother us anymore.
	AI_StopProcessInfos(self);
};


instance DIA_Wegelagerer_ANGRIFF (C_Info)
{
	npc = BDT_1051_hijacker;
	nr = 2;
	condition = DIA_Wegelagerer_ANGRIFF_Condition;
	information = DIA_Wegelagerer_ANGRIFF_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Router_ATTACK_Condition()
{
	var C_Npc Pal;
	Pal = Hlp_GetNpc(BDT_1052_Hijacker);
	if((Npc_RefuseTalk(self) == FALSE) && ((BDT_1051_Wegelagerer_Angriff == TRUE) || C_NpcIsDown(Pal)))
	{
		return TRUE;
	};
};

func void DIA_Hijacker_ATTACK_Info()
{
	AI_Output(self,other, " DIA_Wegelagerer_ANGRIFF_07_00 " );	// Now you will receive.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,40);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE ;
};
