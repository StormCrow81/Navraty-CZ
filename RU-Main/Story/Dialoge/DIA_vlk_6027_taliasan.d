

var int taliasanteachmagicagree;
var int taliasan_trade;

instance DIA_TALIASAN_EXIT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 999;
	condition = dia_taliasan_exit_condition;
	information = dia_taliasan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_taliasan_exit_condition()
{
	return TRUE;
};

func void dia_taliasan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_taliasan_PICKPOCKET(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 998;
	condition = DIA_taliasan_PICKPOCKET_Condition;
	information = DIA_taliasan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_taliasan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 18 , 10 );
};

func void DIA_taliasan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
	Info_AddChoice(DIA_taliasan_PICKPOCKET,Dialog_Back,DIA_taliasan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_taliasan_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_taliasan_PICKPOCKET_DoIt);
};

func void DIA_taliasan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
};

func void DIA_taliasan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_taliasan_PICKPOCKET);
};

instances of DIA_TALIASAN_HI (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_hi_condition;
	information = dia_taliasan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_check_hi_info()
{
	AI_Output(self,other, " DIA_Taliasan_Hi_01_00 " );	// (annoyed) What do you want here? What do you want?
	AI_Output(other,self,"DIA_Taliasan_Hi_01_01");	//Ничего.
	AI_Output(self,other, " DIA_Taliasan_Hi_01_02 " );	// Then get out of here - you have nothing to do here!
	AI_StopProcessInfos(self);
};


DIA_TALIASAN_WASIST (C_Info) instance
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_wasist_condition;
	information = dia_taliasan_wasist_info;
	permanent = FALSE;
	description = " Are you Gallahad? " ;
};


func int dia_taliasan_wasist_condition()
{
	if (( KNOWLEDGE  ==  TRUE ) && ( KNOWLEDGE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_taliasan_wasist_info()
{
	AI_Output(other,self, " DIA_Taliasan_WasIst_01_00 " );	// Is that you Gallahad?
	AI_Output(self,other, " DIA_Taliasan_WasIst_01_01 " );	// How do you know me? What do you need?
	AI_Output(other,self, " DIA_Taliasan_WasIst_01_02 " );	// I heard you're in trouble.
	AI_Output(self,other, " DIA_Taliasan_WasIst_01_03 " );	// You never know what you heard! People talk a lot...
	METALIZATION = TRUE ;
};


instance DIA_TALIASAN_WASISTNO (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_wasistno_condition;
	information = dia_taliasan_wasistno_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_taliasan_wasistno_condition()
{
	if (( KNOWLEDGE  ==  FALSE ) && ( KNOWLEDGE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_taliasan_wasistno_info()
{
	AI_Output(other,self,"DIA_Taliasan_WasIstNo_01_00");	//Кто ты?
	AI_Output(self,other, " DIA_Taliasan_WasIstNo_01_02 " );	// My name is Gallahad. The rest is none of your business.
	AI_Output(other,self, " DIA_Taliasan_WasIstNo_01_03 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Taliasan_WasIstNo_01_06 " );	// (annoyed) Leave me alone!
	METALIZATION = TRUE ;
};


instances of DIA_TALIASAN_PROBLEM (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_problem_condition;
	information = dia_taliasan_problem_info;
	permanent = FALSE;
	description = " What's your problem? " ;
};


func int dia_taliasan_problem_condition()
{
	if ( METALLY  ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_taliasan_problem_info()
{
	AI_Output(other,self, " DIA_Taliasan_Problem_01_00 " );	// What's your problem?
	AI_Output(self,other, " DIA_Taliasan_Problem_01_02 " );	// In people who pry into things that don't concern them... (annoyed) People like you!
	if ((Chapter <=  2 ) || (( TALIASANTELLWHOMAGE  ==  FALSE ) && ( MIS_XARDASNDMTASKSTWO  == LOG_Running)))
	{
		AI_Output(other,self, " DIA_Taliasan_Problem_01_06 " );	// Can you please tell me?
		AI_Output(self,other, " DIA_Taliasan_Problem_01_07 " );	// What's there to tell - it's a sad story...
		AI_Output(self,other, " DIA_Taliasan_Problem_01_08 " );	// ...once I had everything - honor, money, respect... Not like now...(sadly)
		AI_Output(self,other, " DIA_Taliasan_Problem_01_11 " );	// In my best years, I was the head of the city guild of magicians of Khorinis and the first adviser to the head of our city.
		AI_Output(other,self, " DIA_Taliasan_Problem_01_12 " );	// Are you a former mage?!
		AI_Output(self,other, " DIA_Taliasan_Problem_01_13 " );	// Hell yeah, I was the best mage in Khorinis! What surprises you?
		AI_Output(self,other, " DIA_Taliasan_Problem_01_17 " );	// It's all because of that damn Rister! He's gone to hell!
		if(Npc_KnowsInfo(other,DIA_Richter_Hello))
		{
			AI_Output(other,self, " DIA_Taliasan_Problem_01_18 " );	// Rister? Is that the haughty idiot who donned the robes of judge?
			AI_Output(self,other, " DIA_Taliasan_Problem_01_19 " );	// Yes, this is it. I see you got to know that fat pig.
		}
		else
		{
			AI_Output(other,self, " DIA_Taliasan_Problem_01_20 " );	// Rister? And who is it?
			AI_Output(self,other, " DIA_Taliasan_Problem_01_21 " );	// You don't know this bastard? Lucky you! (laughs)
			AI_Output(self,other, " DIA_Taliasan_Problem_01_22 " );	// This bastard put on the robe of a judge and imagines himself to be who knows who!
			AI_Output(self,other,"DIA_Taliasan_Problem_01_23");	//Болван!
		};
		AI_Output(other,self, " DIA_Taliasan_Problem_01_25 " );	// Explain what happened?
		AI_Output(self,other, " DIA_Taliasan_Problem_01_26 " );	// I got involved in some dark story. As I felt then - I should not have done this.
		AI_Output(self,other, " DIA_Taliasan_Problem_01_27 " );	// 'No one will know anything... Everything will be in the best possible way... I am your friend...', - he said.
		AI_Output(self,other, " DIA_Taliasan_Problem_01_28 " );	// And when the case went bust - he took it and dumped all the blame on me!
		AI_Output(self,other, " DIA_Taliasan_Problem_01_31 " );	// Larius, the head of the city, was so enraged by what had happened that he didn't even listen to me!
		AI_Output(self,other, " DIA_Taliasan_Problem_01_32 " );	// And I lost my place, and everything else with it.
		AI_Output(self,other, " DIA_Taliasan_Problem_01_35 " );	// Eh! I'd give anything to get even with that bastard. He, I suppose, is there, as always - covered in chocolate!
		AI_Output(self,other, " DIA_Taliasan_Problem_01_36 " );	// Yes, there's only one problem - they won't let me into the upper quarter of the city.
		TALIASANTELLWHOMAGE = TRUE;
		if(MIS_XARDASNDMTASKSTWO == LOG_Running)
		{
			B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad must be the mage who had the book Xardas needed. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Taliasan_Problem_01_38 " );	// Leave me alone with your questions! It's clear?!
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_HELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_help_condition;
	information = dia_taliasan_help_info;
	permanent = FALSE;
	description = " Maybe there is a way to solve your problem after all? " ;
};


func int dia_taliasan_help_condition()
{
	if ((Capital <=  2 ) && Npc_KnowsInfo(other,dialogue_problem))
	{
		return TRUE;
	};
};

func void dia_taliasan_help_info()
{
	AI_Output(other,self, " DIA_Taliasan_Help_01_00 " );	// Maybe there is a way to solve your problem after all?
	AI_Output(self,other, " DIA_Taliasan_Help_01_01 " );	// Most likely not... Although, maybe...
	AI_Output(self,other, " DIA_Taliasan_Help_01_03 " );	// ...if only someone convinces Larius that he needs me.
	AI_Output(other,self, " DIA_Taliasan_Help_01_04 " );	// Do you know someone who could put in a good word for you?
	AI_Output(self,other, " DIA_Taliasan_Help_01_05 " );	// Well... There are several people in Khorinis whose opinion he usually listens to.
	AI_Output(self,other, " DIA_Taliasan_Help_01_07 " );	// These are the big merchants from the upper quarter.
	AI_Output(self,other, " DIA_Taliasan_Help_01_08 " );	// Perhaps someone could talk them into doing this.
	AI_Output(self,other, " DIA_Taliasan_Help_01_09 " );	// How about you?
	AI_Output(other,self, " DIA_Taliasan_Help_01_12 " );	// Me? And how can I persuade them to intercede for you?
	AI_Output(self,other, " DIA_Taliasan_Help_01_13 " );	// Try to offer them your help.
	AI_Output(self,other, " DIA_Taliasan_Help_01_21 " );	// In any case, I only care that, as a reward, each of them write a letter in which he speaks positively of my abilities.
	AI_Output(self,other, " DIA_Taliasan_Help_01_22 " );	// Well, what do you say? Will you help me?
	Info_ClearChoices(dia_taliasan_help);
	Info_AddChoice(dia_taliasan_help, " I think you should look for someone else. " ,dia_taliasan_help_no);
	Info_AddChoice(dia_taliasan_help, " Yes, it's a risky business, but I'll help you. " ,dia_taliasan_help_ok);
	Info_AddChoice(dia_taliasan_help, " What will I get for my help? " ,dia_taliasan_help_howmuch);
};

func void dia_taliasan_help_no()
{
	AI_Output(other,self, " DIA_Taliasan_Help_No_01_00 " );	// I think you want to involve me in some dark business. I won't work for you.
	AI_Output(self,other, " DIA_Taliasan_Help_No_01_03 " );	// Then leave. And keep your mouth shut!
	Info_ClearChoices(dia_taliasan_help);
};

func void dia_taliasan_help_ok()
{
	AI_Output(other,self, " DIA_Taliasan_Help_Ok_01_00 " );	// Yes, it's a risky business, but I'll help you.
	AI_Output(self,other, " DIA_Taliasan_Help_Ok_01_01 " );	// I knew you'd agree to help me.
	AI_Output(self,other, " DIA_Taliasan_Help_Ok_01_04 " );	// I promise you that you won't regret your decision.
	Log_CreateTopic(TOPIC_TALIASANHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALIASANHELP,LOG_Running);
	B_LogEntry( TOPIC_TALIASANHELP , " In the waterfront, I met a man named Gallahad. He was once a respected man in Khorinis, until he got involved in one adventure. He was framed by Judge Rister, putting all the blame on the magician, although he himself was involved in the case After the incident, Gallahad lost everything - honor, respect, work ... " );
	B_LogEntry_Quiet( TOPIC_TALIASANHELP , " I agreed to help Gallahad regain his former position as the city magician. Letters of recommendation from influential people of the city written to the mayor of Khorinis - Larius will help him. Perhaps after that Gallahad will be treated with condescension and turn a blind eye to past misunderstandings. " );
	MIS_TALIASANHELP = LOG_Running;
	Info_ClearChoices(dia_taliasan_help);
};

func void dia_taliasan_help_howmuch()
{
	AI_Output(other,self, " DIA_Taliasan_Help_HowMuch_01_00 " );	// And what will I get for my help?
	AI_Output(self,other, " DIA_Taliasan_Help_HowMuch_01_04 " );	// If you can help me, I will pay you.
	AI_Output(other,self, " DIA_Taliasan_Help_HowMuch_01_06 " );	// Money doesn't interest me.
	AI_Output(self,other, " DIA_Taliasan_Help_HowMuch_01_07 " );	// I also have magical potions that can boost your abilities!
	AI_Output(self,other, " DIA_Taliasan_Help_HowMuch_01_08 " );	// I could give you a couple of these potions.
	AI_Output(other,self, " DIA_Taliasan_Help_HowMuch_01_09 " );	// Do you have something special? Perhaps you can teach me magic?
	AI_Output(self,other, " DIA_Taliasan_Help_HowMuch_01_15 " );	// This is the best you could ask for.
	AI_Output(self,other, " DIA_Taliasan_Help_HowMuch_01_16 " );	// Knowledge is much more important than silver and wealth, and wealth is an inevitable addition to outstanding abilities.
	AI_Output(self,other, " DIA_Taliasan_Help_HowMuch_01_17 " );	// Good! If you can help me, then I... I will teach you magic.
};

DIA_TALIASAN_FineFood (C_Info) instance
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_TALIASAN_FineFood_condition;
	information = DIA_TALIASAN_FineFood_info;
	permanent = FALSE;
	description = " Is there anything else I can help you with? " ;
};

func int DIA_TALIASAN_FineFood_condition()
{
	if ( MIS_TALIASANHELP  !=  FALSE )
	{
		return TRUE;
	};
};

func void DIA_TALIASAN_FineFood_info()
{
	AI_Output(other,self, " DIA_Taliasan_FineFood_01_00 " );	// Is there anything else I can help you with?
	AI_Output(self,other, " DIA_Taliasan_FineFood_01_01 " );	// (carelessly) Yes, you can. Bring me something to eat.
	AI_Output(other,self, " DIA_Taliasan_FineFood_01_02 " );	// Are you hungry?
	AI_Output(self,other, " DIA_Taliasan_FineFood_01_03 " );	// No, idiot! I'm just tired of rough food.
	AI_Output(self,other, " DIA_Taliasan_FineFood_01_04 " );	// I'm used to eating delicious food! And it's very hard to get decent food in this hole.
	AI_Output(other,self, " DIA_Taliasan_FineFood_01_05 " );	// Okay, what can I bring you?
	AI_Output(self,other, " DIA_Taliasan_FineFood_01_06 " );	// Well... I think it will be enough if you bring me three bottles of wine, a ham, a piece of cheese, a pot of honey and a bunch of grapes.
	AI_Output(self,other, " DIA_Taliasan_FineFood_01_07 " );	// But don't you dare ask me for money for these products. Think of something yourself!
	MIS_TaliasanFineFood = LOG_Running;
	Log_CreateTopic(TOPIC_TaliasanFineFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TaliasanFineFood,LOG_Running);
	B_LogEntry(TOPIC_TaliasanFineFood, " Gallahad was fed up with the rough food of the waterfront. He asked for three bottles of wine, a ham, a piece of cheese, a pot of honey, and a bunch of grapes. " );
};

instance DIA_TALIASAN_FineFood_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_TALIASAN_FineFood_Done_condition;
	information = DIA_TALIASAN_FineFood_Done_info;
	permanent = FALSE;
	description = " Here's the food you asked for. " ;
};

func int DIA_TALIASAN_FineFood_Done_condition()
{
	if((MIS_TaliasanFineFood == LOG_Running) && (Npc_HasItems(other,ItFo_Honey) >= 1) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItFo_Bacon) >= 1) && (Npc_HasItems(other,ITFO_WINEBERRYS) >= 1) && (Npc_HasItems(other,ItFo_Wine) >= 3)) 
	{
		return TRUE;
	};
};

func void DIA_TALIASAN_FineFood_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Taliasan_FineFood_Done_01_00 " );	// Here's the food you asked for.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItFo_Honey,1);
	Npc_RemoveInvItems(hero,ItFo_Cheese,1);
	Npc_RemoveInvItems(hero,ItFo_Bacon,1);
	Npc_RemoveInvItems(hero,ITFO_WINEBERRYS,1);
	Npc_RemoveInvItems(hero,ItFo_Wine,3);
	AI_Output(self,other, " DIA_Taliasan_FineFood_Done_01_01 " );	// Great! Give it here... (greedily) Finally, my stomach will taste something other than rotten fish soup.
	AI_Output(self,other, " DIA_Taliasan_FineFood_Done_01_02 " );	// You did a good job. Now you can go!
	AI_Output(other,self, " DIA_Taliasan_FineFood_Done_01_03 " );	// What, you won't even say thank you?
	AI_Output(self,other, " DIA_Taliasan_FineFood_Done_01_04 " );	// (carelessly) Thank you.
	CreateInvItems(hero,ItSc_HarmUndead,1);
	MIS_TaliasanFineFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_TaliasanFineFood,LOG_Success);
	B_LogEntry(TOPIC_TaliasanFineFood, " I brought food to Gallahad, and that pompous turkey in a robe didn't even say thank you... No wonder no one here likes him. " );
	AI_StopProcessInfos(self);
};

instance DIA_TALIASAN_GIVEMEGIFT (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegift_condition;
	information = dia_taliasan_givemegift_info;
	permanent = FALSE;
	description = " I want my reward. " ;
};


func int dia_taliasan_givemegift_condition()
{
	if (( MIS_LOG_Running  == LOG_Running) && ( LOG_RUNNING_STEP1  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegift_info()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGift_01_00 " );	// I want my reward.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGift_01_01 " );	// What reward? You haven't done anything yet!
};

instance DIA_LOOK_AT_LETTERFROMFERNANDO ( C_Info ) ;
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromfernando_condition;
	information = dia_taliasan_letterfromfernando_info;
	permanent = FALSE;
	description = " I received a letter from the trader Fernando. " ;
};

func int dia_taliasan_letterfromfernando_condition()
{
	if (( MIS_TALIASANHELP  == LOG_Running) && (Npc_HasItems(other,itwr_fernandoletter) >=  1 ) && ( TALIASANHELP_STEP1  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromfernando_info()
{
	AI_Output(other,self, " DIA_Taliasan_LetterFromFernando_01_00 " );	// I received a letter of recommendation from the trader Fernando.
	if ( Fernando_ImKnast ==  FALSE )
	{
		B_GivePlayerXP(150);
		AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_01 " );	// Let me take a look!
		B_GiveInvItems(other,self,itwr_fernandoletter,1);
		Npc_RemoveInvItems(self,itwr_fernandoletter,1);
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_03 " );	// Great job!
		B_LogEntry( TOPIC_TALIASANHELP , " I gave Gallahad Fernando's letter. " );
		RECOMENDLETTER = RECOMENDLETTER + 1;
		if(RECOMENDLETTER >= 4)
		{
			AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_04 " );	// I think the letters you brought me will be enough to impress Larius.
			TALIASANHELP_STEP1 = TRUE;
		}
		else if(RECOMENDLETTER >= 3)
		{
			AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_06 " );	// But I don't think this will be enough to solve my problem.
			AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_07 " );	// Maybe we could use another letter of recommendation!
		}
		else if(RECOMENDLETTER >= 1)
		{
			AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_08 " );	// But I need more letters of recommendation!
			AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_09 " );	// We need at least a couple more of these recommendations.
		};
	}
	else if((Fernando_ImKnast == TRUE) && (RECOMENDLETTER == 3))
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_10 " );	// (annoyed) And why do I need it?! The whole city already knows that Fernando supplied weapons to the bandits. And you bring me this letter from him!
		AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_12 " );	// Although... Considering that it was you who uncovered this crime, your request may be heeded.
		AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_04 " );	// I think the letters you brought me will be enough to impress Larius.
		TALIASANHELP_STEP1 = TRUE;
		B_LogEntry( TOPIC_TALIASANHELP , " Gallahad did not want to take Fernando's letter of recommendation, believing that the opinion of the criminal was unlikely to be heeded. But my participation in solving Fernando's crime could be useful. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_10 " );	// (annoyed) And why do I need it?! The whole city already knows that Fernando supplied weapons to the bandits. And you bring me this letter from him!
		AI_Output(self,other, " DIA_Taliasan_LetterFromFernando_01_11 " );	// Better keep it to yourself - I definitely don't need it.
		B_LogEntry( TOPIC_TALIASANHELP , " Gallahad did not want to take Fernando's letter of recommendation, believing that the opinion of the criminal is unlikely to be heeded. " );
	};
};


instance DIA_TALIASAN_LETTERFROMLUTERO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromlutero_condition;
	information = dia_taliasan_letterfromlutero_info;
	permanent = FALSE;
	description = " Here's a letter of recommendation from Trader Luthero. " ;
};


func int dia_taliasan_letterfromlutero_condition()
{
	if (( MIS_TALIASANHELP  == LOG_Running) && (Npc_HasItems(other,itwr_luteroletters) >=  1 ) && ( TALIASANHELP_STEP1  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromlutero_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Taliasan_LetterFromLutero_01_00 " );	// Here's a letter of recommendation from Trader Luthero.
	B_GiveInvItems(other,self,itwr_luteroletter,1);
	Npc_RemoveInvItems(self,itwr_luteroletter,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Taliasan_LetterFromLutero_01_03 " );	// Great! I know Luthero - he's a very powerful man in this city. His opinion is a very important detail in our business.
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry( TOPIC_TALIASANHELP , " I gave Gallahad a letter from Luthero. " );
	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromLutero_01_04 " );	// I think the letters you brought me will be enough to impress Larius.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromLutero_01_06 " );	// But I don't think this will be enough to solve my problem.
		AI_Output(self,other, " DIA_Taliasan_LetterFromLutero_01_07 " );	// Maybe we could use another letter of recommendation!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromLutero_01_08 " );	// But I need more letters of recommendation!
		AI_Output(self,other, " DIA_Taliasan_LetterFromLutero_01_09 " );	// We need at least a couple more of these recommendations.
	};
};


instance DIA_TALIASAN_LETTERFROMGERBRANT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromgerbrant_condition;
	information = dia_taliasan_letterfromgerbrant_info;
	permanent = FALSE;
	description = " Here, I brought you a letter from Gerbrandt. " ;
};


func int dia_taliasan_letterfromgerbrant_condition()
{
	if (( MIS_TALIASANHELP  == LOG_Running) && (Npc_HasItems(other,itwr_burnletter) >=  1 ) && ( TALIASANHELP_STEP1  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromgerbrant_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Taliasan_LetterFromGerbrant_01_00 " );	// Here, I brought you a letter from Gerbrandt.
	B_GiveInvItems(other,self,itwr_gerbrantletter,1);
	Npc_RemoveInvItems(self,itwr_gerbrantletter,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Taliasan_LetterFromGerbrant_01_03 " );	// Hmmm... Interesting! I thought you couldn't get a letter from him.
	AI_Output(self,other, " DIA_Taliasan_LetterFromGerbrant_01_04 " );	// You seem to have impressed him with your work.
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry( TOPIC_TALIASANHELP , " I gave Gallahad Gerbrandt's letter of recommendation. He was very surprised that I could get it! " );
	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromGerbrant_01_05 " );	// I think the letters you brought me will be enough to impress Larius.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromGerbrant_01_07 " );	// But I don't think this will be enough to solve my problem.
		AI_Output(self,other, " DIA_Taliasan_LetterFromGerbrant_01_08 " );	// Maybe we could use another letter of recommendation!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromGerbrant_01_09 " );	// But I need more letters of recommendation!
		AI_Output(self,other, " DIA_Taliasan_LetterFromGerbrant_01_10 " );	// We need at least a couple more of these recommendations.
	};
};

instance DIA_TALIASAN_LETTERFROMSALANDRIL(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromsalandril_condition;
	information = dia_taliasan_letterfromsalandril_info;
	permanent = FALSE;
	description = " Alchemist Salandril has written a recommendation for you. " ;
};

func int dia_taliasan_letterfromsalandril_condition()
{
	if (( MIS_SELVESHELP  == LOG_Running) && (Npc_HasItems(other,itwr_salt_slices) >=  1 ) && ( SHELP_STEP1  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromsalandril_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Taliasan_LetterFromSalandril_01_00 " );	// Alchemist Salandril wrote a recommendation for you.
	AI_Output(self,other, " DIA_Taliasan_LetterFromSalandril_01_01 " );	// Salandril? Hmmm. I didn't count on his voice.
	B_GiveInvItems(other,self,itwr_salandrilletter,1);
	Npc_RemoveInvItems(self,itwr_salandrilletter,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Taliasan_LetterFromSalandril_01_03 " );	// Hmmm, not bad! Although few people listen to his opinion in Khorinis.
	AI_Output(self,other, " DIA_Taliasan_LetterFromSalandril_01_04 " );	// However, it can also be useful to us.
	RECOMENDLETTER = RECOMENDLETTER + 1;
	B_LogEntry( TOPIC_TALIASANHELP , " I gave Gallahad Salandril's letter of recommendation. Apparently, this letter will not have the effect that Gallahad expects. But he still kept it for himself. " );

	if(RECOMENDLETTER >= 4)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromSalandril_01_05 " );	// I think the letters you brought me will be enough to impress Larius.
		TALIASANHELP_STEP1 = TRUE;
	}
	else if(RECOMENDLETTER >= 3)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromSalandril_01_07 " );	// But I don't think this will be enough to solve my problem.
		AI_Output(self,other, " DIA_Taliasan_LetterFromSalandril_01_08 " );	// Maybe we could use another letter of recommendation!
	}
	else if(RECOMENDLETTER >= 1)
	{
		AI_Output(self,other, " DIA_Taliasan_LetterFromSalandril_01_09 " );	// But I need more letters of recommendation!
		AI_Output(self,other, " DIA_Taliasan_LetterFromSalandril_01_10 " );	// We need at least a couple more of these recommendations.
	};
};


instance DIA_TALIASAN_LETTERFROMVALENTINO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_letterfromvalentino_condition;
	information = dia_taliasan_letterfromvalentino_info;
	permanent = FALSE;
	description = " I have a letter of recommendation from Valentino for you. " ;
};


func int dia_taliasan_letterfromvalentino_condition()
{
	if (( MIS_CONTINUED_HELP  == LOG_Running) && (Npc_HasItems(other,itwr_valentinoletters) >=  1 ) && ( CLINICAL_STEP1  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_taliasan_letterfromvalentino_info()
{
	AI_Output(other,self, " DIA_Taliasan_LetterFromValentino_01_00 " );	// I have a letter of recommendation for you from Valentino.
	AI_Output(self,other, " DIA_Taliasan_LetterFromValentino_01_01 " );	// WHAT?! From this brainless bastard?
	AI_Output(self,other, " DIA_Taliasan_LetterFromValentino_01_03 " );	// Yes, no one in the city puts his opinion in a penny!
	AI_Output(self,other, " DIA_Taliasan_LetterFromValentino_01_04 " );	// Better keep it to yourself.
	B_LogEntry( TOPIC_TALIASANHELP , " Gallahad didn't even want to take a letter of recommendation from Valentino. Apparently, no one in town cares about his opinion. " );
};


instance DIA_TALIASAN_GIVEMEGIFTOK (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftok_condition;
	information = dia_taliasan_givemegiftok_info;
	permanent = FALSE;
	description = " I want my reward. " ;
};


func int dia_taliasan_givemegiftok_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftok_info()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftOK_01_00 " );	// I want my reward.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftOK_01_03 " );	// Only half done.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftOK_01_04 " );	// So let's talk about your reward later.
};


DIA_TALIASAN_SENDTOLARIUS (C_Info) instance
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_sendtolarius_condition;
	information = dia_taliasan_sendtolarius_info;
	permanent = FALSE;
	description = " So what now? " ;
};


func int dia_taliasan_sendtolarius_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_sendtolarius_info()
{
	AI_Output(other,self, " DIA_Taliasan_SendToLarius_01_00 " );	// And now what?
	AI_Output(self,other, " DIA_Taliasan_SendToLarius_01_01 " );	// Now we need to take these letters to Larius himself.
	AI_Output(self,other, " DIA_Taliasan_SendToLarius_01_03 " );	// The guards won't let me into the town hall, but you'll probably get a chance to see him.
	AI_Output(self,other, " DIA_Taliasan_SendToLarius_01_05 " );	// Show him these letters, and let's hope Larius is in a good mood.
	B_GiveInvItems(self,other,itwr_taliasanrecomendedletters,1);
	AI_Output(other,self, " DIA_Taliasan_SendToLarius_01_06 " );	// And what should I tell him?
	AI_Output(self,other, " DIA_Taliasan_SendToLarius_01_07 " );	// Say that I am very sorry about what happened and ask you to forget about that terrible incident.
	AI_Output(other,self, " DIA_Taliasan_SendToLarius_01_10 " );	// Okay, I'll try to talk to Larius.
	AI_Output(self,other, " DIA_Taliasan_SendToLarius_01_11 " );	// Yes, one more thing. Larius is a peculiar person, and he needs a special approach.
	AI_Output(self,other, " DIA_Taliasan_SendToLarius_01_12 " );	// The fate of most decisions depends on his mood.
	AI_Output(self,other, " DIA_Taliasan_SendToLarius_01_14 " );	// As far as I remember, the best time to make such a request to him is during the afternoon break.
	AI_Output(self,other, " DIA_Taliasan_SendToLarius_01_15 " );	// Remember this well. Now go!
	B_LogEntry( TOPIC_TALIASANHELP , " Now I need to take all the letters of recommendation to Larius, the head of Khorinis, asking him to show mercy to Gallahad in a case that broke his whole life. According to Gallahad, Larius is a peculiar person: he makes most decisions depending on his mood . Gallahad advised to turn to him in the afternoon break, when he is in the best mood. " );
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_400_Larius, " Dinner " );
};


instance DIA_TALIASAN_STOLENBOOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 9;
	condition = dia_taliasan_stolenbook_condition;
	information = dia_taliasan_stolenbook_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_stolenbook_condition()
{
	if ((Npc_HasItems(hero,itwr_rhetoricbook) >=  1 ) && ( LOOK  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_taliasan_stolenbook_info()
{
	AI_Output(self,other, " DIA_Taliasan_StolenBook_00 " );	// Don't touch!
	AI_Output(self,other, " DIA_Taliasan_StolenBook_01 " );	// On this shelf are my personal books, just try to take something!
	AI_Output(self,other, " DIA_Taliasan_StolenBook_02 " );	// If I lose even one book, I will immediately notice it.
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,1);
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_STOLENBOOKTWO(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 9;
	condition = dia_taliasan_stolenbooktwo_condition;
	information = dia_taliasan_stolenbooktwo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_taliasan_stolenbooktwo_condition()
{
	if ((Npc_HasItems(hero,itwr_rhetoricbook) >=  1 ) && ( LOOK  ==  FALSE ) && Npc_KnowsInfo(hero, he_looks_stolenbook))
	{
		return TRUE;
	};
};

func void dia_taliasan_stolenbooktwo_info()
{
	AI_Output(self,other, " DIA_Taliasan_StolenBookTwo_00 " );	// Hey, this is my book. Hands off!
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,1);
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_NEEDBOOK(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_needbook_condition;
	information = dia_taliasan_needbook_info;
	permanent = FALSE;
	description = " Trader Fernando needs a book... " ;
};


func int dia_taliasan_needbook_condition()
{
	if(MIS_FERNANDOHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_taliasan_needbook_info()
{
	AI_Output(other,self, " DIA_Taliasan_NeedBook_01_00 " );	// Trader Fernando needs a book called 'Fundamentals of Rhetoric'. He will write a letter only when I bring him this book.
	AI_Output(self,other, " DIA_Taliasan_NeedBook_01_01 " );	// Ha! So he still needs her? Stubborn!
	AI_Output(self,other, " DIA_Taliasan_NeedBook_01_06 " );	// Find another way to get a letter from him!
	B_LogEntry( TOPIC_FERNANDOHELP , " Gallahad doesn't want to part with his book. He's so distrustful that he won't even let me near his bookshelf. " );
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_IGNAZHELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_ignazhelp_condition;
	information = dia_taliasan_ignazhelp_info;
	permanent = FALSE;
	description = " Ignaz asked me to remind you... " ;
};


func int dia_taliasan_ignazhelp_condition()
{
	if(MIS_IGNAZHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_taliasan_ignazhelp_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Taliasan_IgnazHelp_01_00 " );	// Ignaz asked me to remind you...
	AI_Output(other,self, " DIA_Taliasan_IgnazHelp_01_02 " );	// ...that you promised him a new batch of herbs for his experiments.
	AI_Output(self,other, " DIA_Taliasan_IgnazHelp_01_03 " );	// Oh yes! I completely forgot about him. Now I will go to him.
	TALIASANAWAY = TRUE;
	self.guild = GIL_NONE;
	Npc_SetTrueGuild(self,GIL_NONE);
	Npc_ExchangeRoutine(self,"GoIgnaz");
	Log_SetTopicStatus(TOPIC_IGNAZHELP,LOG_SUCCESS);
	B_LogEntry( TOPIC_FERNANDOHELP , " Gallahad came out to meet with Ignatz. Let's seize this moment! " );
	MIS_IGNAZHELP = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_CANCELHELP(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_cancelhelp_condition;
	information = dia_taliasan_cancelhelp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_cancelhelp_condition()
{
	var int counthelpmiss;
	counthelpmiss = 0;
	if(MIS_GERBRANDTHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if(MIS_FERNANDOHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if(MIS_SALANDRILHELP == LOG_FAILED)
	{
		counthelpmiss = counthelpmiss + 1;
	};
	if((counthelpmiss >= 2) && (MIS_TALIASANHELP == LOG_Running) && (TALIASANHELP_STEP1 == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_cancelhelp_info()
{
	AI_Output(self,other, " DIA_Taliasan_CancelHelp_01_00 " );	// Wait a minute...
	AI_Output(self,other, " DIA_Taliasan_CancelHelp_01_02 " );	// There are many rumors about you in the city. And not very flattering!
	AI_Output(self,other, " DIA_Taliasan_CancelHelp_01_03 " );	// I heard that you somehow managed to quarrel with some powerful people in this city.
	AI_Output(self,other, " DIA_Taliasan_CancelHelp_01_06 " );	// I really counted on their support.
	AI_Output(self,other, " DIA_Taliasan_CancelHelp_01_07 " );	// So forget our deal.
	AI_Output(self,other, " DIA_Taliasan_CancelHelp_01_14 " );	// Now get out of my sight, you idiot!
	TALIASANPISSOFF = TRUE;
	MIS_TALIASANHELP = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_TALIASANHELP);
	AI_StopProcessInfos(self);

	if(MIS_GERBRANDTHELP == LOG_Running)
	{
		MIS_GERBRANDTHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_OBSOLETE);
	};
	if(MIS_FERNANDOHELP == LOG_Running)
	{
		MIS_FERNANDOHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_OBSOLETE);
	};
	if(MIS_SALANDRILHELP == LOG_Running)
	{
		MIS_SALANDRILHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_OBSOLETE);
	};
	if(MIS_LUTEROHELP == LOG_Running)
	{
		MIS_LUTEROHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_OBSOLETE);
	};
	if(MIS_VALENTINOHELP == LOG_Running)
	{
		MIS_VALENTINOHELP = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_OBSOLETE);
	};
};


instance DIA_TALIASAN_FUCKOFF(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 10;
	condition = dia_taliasan_fuckoff_condition;
	information = dia_taliasan_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_taliasan_fuckoff_condition()
{
	if((TALIASANPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_taliasan_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_TALIASAN_SENDTOLARIUSOK (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_sendtolariusok_condition;
	information = dia_taliasan_sendtolariusok_info;
	permanent = FALSE;
	description = " I talked to Larius. " ;
};

func int dia_taliasan_sendtolariusok_condition()
{
	if (( MIS_LOG_Running  == LOG_Running ) && ( LOG_Running  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_taliasan_sendtolariusok_info()
{
	AI_Output(other,self, " DIA_Taliasan_SendToLariusOk_01_00 " );	// I've been talking to Larius.
	AI_Output(self,other, " DIA_Taliasan_SendToLariusOk_01_01 " );	// (excitedly) And what did he say?

	if ( LARIUSPISSOFF  ==  TRUE )
	{
		AI_Output(other,self, " DIA_Taliasan_SendToLariusOk_01_02 " );	// He didn't even listen to me, but immediately pointed me to the door!
		AI_Output(self,other, " DIA_Taliasan_SendToLariusOk_01_06 " );	// Damn! Apparently, you did something wrong, since Larius reacted to your request in such a harsh way.
		AI_Output(self,other, " DIA_Taliasan_SendToLariusOk_01_08 " );	// O Innos! This was my last chance!
		AI_Output(self,other, " DIA_Taliasan_SendToLariusOk_01_09 " );	// Apparently, you just don't know how to communicate with people!
		AI_Output(self,other, " DIA_Taliasan_SendToLariusOk_01_17 " );	// Now get out of my sight!
		TALIASANPISSOFF = TRUE;
		MIS_TALIASANHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_TALIASANHELP);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Taliasan_SendToLariusOk_01_18 " );	// He forgives you. It is done.
		AI_Output(other,self, " DIA_Taliasan_SendToLariusOk_01_19 " );	// Letters of recommendation helped in many ways, which made an indelible impression on Larius.
		AI_Output(other,self, " DIA_Taliasan_SendToLariusOk_01_20 " );	// He said you can get to work immediately.
		AI_Output(self,other, " DIA_Taliasan_SendToLariusOk_01_21 " );	// That's great news! Finally!
		AI_Output(self,other, " DIA_Taliasan_SendToLariusOk_01_22 " );	// I won't have to stick around in this stinking sewer for the rest of my life. I just don't believe it!
		AI_Output(self,other, " DIA_Taliasan_SendToLariusOk_01_29 " );	// I won't waste another minute and I'll go to Larius right away.
		self.guild = GIL_NONE;
		MIS_TALIASANHELP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TALIASANHELP,LOG_SUCCESS);
		B_LogEntry( TOPIC_TALIASANHELP , " I told Gallahad about my meeting with Larius. He was delighted that I managed to convince Larius to forgive him. " );
		AI_StopProcessInfos(self);
		Npc_SetTrueGuild(self,GIL_NONE);
		Npc_ExchangeRoutine(self,"GoInTownHall");
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
		TaliasanNextQuest = Wld_GetDay();
	};
};


instance DIA_TALIASAN_GIVEMEGIFTNEXT(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftnext_condition;
	information = dia_taliasan_givemegiftnext_info;
	permanent = FALSE;
	description = " I want my reward. " ;
};


func int dia_taliasan_givemegiftnext_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftnext_info()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNext_01_00 " );	// I want my reward.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNext_01_03 " );	// Sorry, but I'm in a big hurry right now.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNext_01_04 " );	// So let's talk about your reward tomorrow.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNext_01_05 " );	// Come to the town hall this afternoon and we'll discuss your reward.
	MIS_TALIASAN_GIFT_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_TALIASAN_HOUSE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_house_condition;
	information = dia_taliasan_house_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_taliasan_house_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_taliasan_house_info()
{
	AI_Output(self,other, " DIA_Taliasan_House_01_00 " );	// Yes, and one more thing...
	AI_Output(self,other, " DIA_Taliasan_House_01_02 " );	// I probably won't need this shack now.
	AI_Output(self,other, " DIA_Taliasan_House_01_04 " );	// You can live here if you want.
	TaliasanHomeIsMine = TRUE;
	TALIASANAWAY = TRUE;
	AI_StopProcessInfos(self);

	if(Npc_HasItems(self,itar_mage) == 0)
	{
		CreateInvItem(self,itar_mage);
	};

	AI_EquipBestArmor(self);
	Wld_AssignRoomToGuild("hafen06",GIL_NONE);
};

instance DIA_TALIASAN_GIVEMEGIFTNOW(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_givemegiftnow_condition;
	information = dia_taliasan_givemegiftnow_info;
	permanent = FALSE;
	description = " I want my reward. " ;
};


func int dia_taliasan_givemegiftnow_condition()
{
	if ( ( MIS_TALIASANHELP  ==  LOG_SUCCESS ) && Npc_KnowsInfo ( hero , dia_taliasan_givemegiftnext ) && ( ( MIS_TALIASAN_GIFT_DAY  < ( Wld_GetDay ( ) -  1 ) ) || _  _ _ ))
	{
		return TRUE;
	};
};

func void dia_taliasan_givemegiftnow_info()
{
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_01_00 " );	// I want my reward.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_01_01 " );	// Good! What you choose?
	Info_AddChoice(dia_taliasan_givemegiftnow, " I need money. " ,dia_taliasan_givemegiftnow_money);
	Info_AddChoice(dia_taliasan_givemegiftnow, " Give me some of your potions. " ,dia_taliasan_givemegiftnow_zelia);
	Info_AddChoice(dia_taliasan_givemegiftnow, " Teach me how to use magic. " ,dia_taliasan_givemegiftnow_magic);
};

func void dia_taliasan_givemegiftnow_money()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_Money_01_00 " );	// I need money.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Money_01_01 " );	// I can give you five hundred gold coins for your efforts.
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_Money_01_03 " );	// How, so few?
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Money_01_04 " );	// Hmmm...(thinking) You're probably right.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Money_01_05 " );	// Good. How about a thousand gold coins?
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Money_01_06 " );	// I don't have any more.
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	Info_AddChoice(dia_taliasan_givemegiftnow,"Я согласен.",dia_taliasan_givemegiftnow_thousand);
	Info_AddChoice(dia_taliasan_givemegiftnow, " No, it's still not enough. " ,dia_taliasan_givemegiftnow_nomoney);
};

func void dia_taliasan_givemegiftnow_thousand()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_Thousand_01_00 " );	// Okay, give me the money here.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Thousand_01_01 " );	// Here, take this purse - there's exactly a thousand coins.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Thousand_01_02 " );	// Now excuse me - I have to work.
	B_GiveInvItems(self,other,itse_taliasanpocket,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_nomoney()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_NoMoney_01_00 " );	// No, it's still not enough.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_NoMoney_01_02 " );	// If this doesn't suit you, then I have nothing more to offer you.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_NoMoney_01_03 " );	// Now excuse me - I have to work.
	TALIASANDOLG = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_zelia()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_Zelia_01_00 " );	// Give me some of your potions.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Zelia_01_01 " );	// Which potion would you like to get?
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	Info_AddChoice(dia_taliasan_givemegiftnow, " I want to take a strength potion. " ,dia_taliasan_givemegiftnow_str);
	Info_AddChoice(dia_taliasan_givemegiftnow, " I want to take a potion of dexterity. " ,dia_taliasan_givemegiftnow_dex);
	Info_AddChoice(dia_taliasan_givemegiftnow, " I'll take a mana potion. " ,dia_taliasan_givemegiftnow_mana);
};

func void dia_taliasan_givemegiftnow_str()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_Str_01_00 " );	// I want to take a strength potion.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Str_01_01 " );	// Here, take this.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Str_01_02 " );	// Now sorry! I have to work.
	B_GiveInvItems(self,other,ItPo_Perm_STR_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_dex()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_Dex_01_00 " );	// I choose a potion of agility.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Dex_01_01 " );	// Here, take this.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Dex_01_02 " );	// Now sorry! I have to work.
	B_GiveInvItems(self,other,ItPo_Perm_Dex_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_mana()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_Mana_01_00 " );	// I'll take the mana potion.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Mana_01_01 " );	// Here, take this.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Mana_01_02 " );	// Now sorry! I have to work.
	B_GiveInvItems(self,other,ItPo_Perm_Mana_M_Normal,1);
	AI_StopProcessInfos(self);
};

func void dia_taliasan_givemegiftnow_magic()
{
	AI_Output(other,self, " DIA_Taliasan_GiveMeGiftNow_Magic_01_00 " );	// Teach me how to use magic.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Magic_01_01 " );	// You have chosen the most valuable reward.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Magic_01_03 " );	// However, I must warn you that I won't be able to teach you Firebending or Waterbending. Not to mention necromancer magic!
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Magic_01_04 " );	// These types of magic are available only to the followers of those gods who grant them this knowledge.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Magic_01_05 " );	// I do true magic!
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Magic_01_06 " );	// I'll teach you how to create runes, for this you need magic scrolls.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Magic_01_08 " );	// You can buy them from me.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Magic_01_09 " );	// In addition, I will initiate you into the mysteries of the magic Circles. The circles will help you gain power over the runes you have created.
	AI_Output(self,other, " DIA_Taliasan_GiveMeGiftNow_Magic_01_10 " );	// I can also increase your magic power.
	Info_ClearChoices(dia_taliasan_givemegiftnow);
	TALIASANTEACHMAGIC = TRUE;
	Log_CreateTopic(TOPIC_ADDON_TRMAGICTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ADDON_TRMAGICTEACHER , " Gallahad will teach me how to create runes of true magic, help me learn magic Circles and show me how to increase my magic power. " );
	B_LogEntry_Quiet( TOPIC_ADDON_TRMAGICTEACHER , " Also, I can buy spell scrolls from Gallahad. " );
};


instance DIA_TALIASAN_EXPLAINCIRCLES(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_explaincircles_condition;
	information = dia_taliasan_explaincircles_info;
	important = FALSE;
	permanent = FALSE;
	description = " Please explain to me what is the meaning of Magic Circles? " ;
};


func int dia_taliasan_explaincircles_condition()
{
	if(TALIASANTEACHMAGIC == TRUE)
	{
		return TRUE;
	};
};

func void dia_taliasan_explaincircles_info()
{
	AI_Output(other,self, " DIA_Taliasan_EXPLAINCIRCLES_Info_15_01 " );	// Explain to me what the meaning of magic circles is?
	AI_Output(self,other, " DIA_Taliasan_EXPLAINCIRCLES_Info_14_02 " );	// With pleasure. Circles symbolize your understanding of magic.
	AI_Output(self,other, " DIA_Taliasan_EXPLAINCIRCLES_Info_14_03 " );	// They indicate the level of your knowledge and skills, the ability to learn new spells.
	AI_Output(self,other, " DIA_Taliasan_EXPLAINCIRCLES_Info_14_04 " );	// You must complete each Circle before you can enter the next one.
	AI_Output(self,other, " DIA_Taliasan_EXPLAINCIRCLES_Info_14_05 " );	// It will take long hours of study and a lot more experience to reach the higher Circles.
	AI_Output(self,other, " DIA_Taliasan_EXPLAINCIRCLES_Info_14_06 " );	// Your efforts will be rewarded with powerful new spells every time. But in any case, magic Circles mean much more.
	AI_Output(self,other, " DIA_Taliasan_EXPLAINCIRCLES_Info_14_07 " );	// They are part of your life. They will always be with you. Make them part of you.
	AI_Output(self,other, " DIA_Taliasan_EXPLAINCIRCLES_Info_14_08 " );	// In order to understand their power, you must know yourself.
	EXPLAINCIRCLEMEAN = TRUE;
};

DIA_TALIASAN_RUNEN (C_Info) instance
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_runen_condition;
	information = dia_taliasan_runes_info;
	permanent = TRUE;
	description = " Teach me how to make runes. " ;
};

func int dia_taliasan_runen_condition()
{
	if((TALIASANTEACHMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_taliasan_runen_info()
{
	AI_Output(other,self, " DIA_Parlan_TEACH_15_00 " );	// Train me!
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen, Dialog_Back, dia_taliasan_runen_back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_taliasan_runen, " 3 circle of magic " ,dia_taliasan_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_taliasan_runen, " 2 circle of magic " ,dia_taliasan_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_taliasan_runen, " 1 magic circle " ,dia_taliasan_runen_1);
	};
};

func void dia_taliasan_runen_back()
{
	Info_ClearChoices(dia_taliasan_runen);
};

func void dia_taliasan_runen_1()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen, Dialog_Back, dia_taliasan_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),dia_taliasan_runen_circle_1_spl_light);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),dia_taliasan_runen_circle_1_spl_lightheal);
	};
	if((PLAYER_TALENT_RUNES[SPL_UnlockChest] == FALSE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM)))
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_UnlockChest,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_UnlockChest)),dia_taliasan_runen_circle_1_spl_unlock);
	};
};

func void dia_taliasan_runen_2()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen, Dialog_Back, dia_taliasan_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonWolf)),dia_taliasan_runen_circle_2_spl_summonwolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),dia_taliasan_runen_circle_2_spl_mediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),dia_taliasan_runen_circle_2_spl_destroyundead);
	};
};

func void dia_taliasan_runen_3()
{
	Info_ClearChoices(dia_taliasan_runen);
	Info_AddChoice(dia_taliasan_runen, Dialog_Back, dia_taliasan_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),dia_taliasan_runen_circle_3_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(dia_taliasan_runen,b_buildlearnstringforrunes(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),dia_taliasan_runen_circle_3_spl_fullheal);
	};
};

func void dia_taliasan_runen_circle_1_spl_light()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void dia_taliasan_runen_circle_1_spl_lightheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void dia_taliasan_runen_circle_1_spl_unlock()
{
	B_TeachPlayerTalentRunes(self,other,SPL_UnlockChest);
};

func void dia_taliasan_runen_circle_2_spl_summonwolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void dia_taliasan_runen_circle_2_spl_mediumheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void dia_taliasan_runen_circle_2_spl_destroyundead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void dia_taliasan_runen_circle_3_spl_fullheal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void dia_taliasan_runen_circle_3_spl_summongolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};


instance DIA_TALIASAN_TRADE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_trade_condition;
	information = dia_taliasan_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = " Show me your magical scrolls. " ;
};


func int dia_taliasan_trade_condition()
{
	if(TALIASANTEACHMAGIC == TRUE)
	{
		return TRUE;
	};
};

func void dia_taliasan_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Taliasan_Trade_01_01 " );	// Show me your magical scrolls.

	if(TALIASAN_TRADE == 0)
	{
		CreateInvItems(self,ItSc_Zap,1);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		TALIASAN_TRADE += 1;
	};

	B_GiveTradeInv(self);
};


DIA_TALIASAN_TEACH_MANA (C_Info) instance
{
	npc = vlk_6027_taliasan;
	nr = 10;
	condition = dia_taliasan_teach_mana_condition;
	information = dia_taliasan_teach_mana_info;
	permanent = TRUE;
	description = " I want to increase my magical energy. " ;
};

func int dia_taliasan_teach_mana_condition()
{
	if((TALIASANTEACHMAGIC == TRUE) && ((other.attribute[ATR_MANA_MAX] < T_MED) || (VATRAS_TEACHREGENMANA == FALSE)))
	{
		return TRUE;
	};
};

func void dia_taliasan_teach_mana_info()
{
	AI_Output(other,self, " DIA_Taliasan_TEACH_MANA_15_00 " );	// I want to increase my magical energy.
	AI_Output(self,other, " DIA_Taliasan_TEACH_MANA_15_01 " );	// I can help you with this. How you use it is up to you.
	Info_ClearChoices(god_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if ((Chapter >=  2 ) && ( BACK_TEACREGEN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA, " Mana Regen (Training Points: 20, Cost: 15000 Coins) " ,DIA_Taliasan_TEACH_MANA_Regen);
	};
};

func void dia_taliasan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other, " DIA_Taliasan_TEACH_MANA_05_00 " );	// I can't help you with this anymore.
		AI_Output(self,other, " DIA_Taliasan_TEACH_MANA_05_01 " );	// You're at your limits!
	};

	Info_ClearChoices(god_taliasan_teach_mana);
};

func void DIA_Taliasan_TEACH_NOT_Regen()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_05 " );	// Teach me mana regeneration.

	cost = 20 ;
	money = 15000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Training: Mana Regeneration " );
		VATRAS_TEACHREGENMANA = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(god_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);
};

func void dia_taliasan_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(god_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if ((Chapter >=  2 ) && ( BACK_TEACREGEN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA, " Mana Regen (Training Points: 30, Cost: 15000 coins) " ,DIA_Taliasan_TEACH_MANA_Regen);
	};
};

func void dia_taliasan_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(god_taliasan_teach_mana);
	Info_AddChoice(dia_taliasan_teach_mana,Dialog_Back,dia_taliasan_teach_mana_back);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_taliasan_teach_mana_1);
	Info_AddChoice(dia_taliasan_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_taliasan_teach_mana_5);

	if ((Chapter >=  2 ) && ( BACK_TEACREGEN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Taliasan_TEACH_MANA, " Mana Regen (Training Points: 30, Cost: 15000 coins) " ,DIA_Taliasan_TEACH_MANA_Regen);
	};
};

instance DIA_TALIASAN_CIRCLE(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 99;
	condition = dia_taliasan_circle_condition;
	information = dia_taliasan_circle_info;
	permanent = TRUE;
	description = " I want to learn the essence of magic. " ;
};

func int dia_taliasan_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 3) && (TALIASANTEACHMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_circle_info()
{
	AI_Output(other,self, " DIA_Taliasan_CIRCLE_15_00 " );	// I want to understand the essence of magic.

	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==  FALSE ) && (Chapter >=  1 )) ;
	{
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE, " 1 Circle of Magic (Training Points: 20, Cost: 500 coins) " ,DIA_Taliasan_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE, " 2 Circle of Magic (Training Points: 30, Cost: 1000 coins) " ,DIA_Taliasan_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{	
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
		Info_AddChoice(DIA_Taliasan_CIRCLE,Dialog_Back,DIA_Taliasan_CIRCLE_back);
		Info_AddChoice(DIA_Taliasan_CIRCLE, " 3 Circle of Magic (Training Points: 40, Cost: 2000 coins) " ,DIA_Taliasan_CIRCLE_3);
	}
	else
	{
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_31 " );	// It's not time yet! Come back later.
	};
};

func void DIA_Taliasan_CIRCLE_back()
{
	Info_ClearChoices(DIA_Taliasan_CIRCLE);
};

func void DIA_Taliasan_CIRCLE_1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		if(B_TeachMagicCircle(self,other,1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
			AI_Output(other,self, " DIA_Taliasan_CIRCLE_15_01 " );	// I'm ready to enter the First Circle.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_01 " );	// By joining the First Circle, you will learn how to use magical runes.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_02 " );	// Each rune contains the structure of a special magic spell.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_03 " );	// By using your own magical power, you can release the rune's magic.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_04 " );	// But unlike scrolls, which are essentially magic formulas, rune magic maintains the structure of the spell at all times.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_05 " );	// Each rune contains a magical power that you can take away at any time.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_06 " );	// Just like with the scroll, the moment you use a rune, your own magic power is consumed.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_07 " );	// With each new Circle you will learn more and more about runes.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_08 " );	// Use their power to know yourself.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold for this! Come back later.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};

func void DIA_Taliasan_CIRCLE_2()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_0B " );	// Are you ready to enter the next Circle of Magic?
			AI_Output(other,self, " DIA_Taliasan_CIRCLE_15_02 " );	// I'm ready to enter the Second Circle.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_09 " );	// You've already learned to understand runes. It's time to deepen your knowledge.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_10 " );	// As you enter the Second Circle, you will learn the basics of powerful combat spells.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_11 " );	// But in order to know the true secrets of magic, you have a lot to learn.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_12 " );	// You already know that you can use any rune countless times, but only until you use up your own magic power.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_13 " );	// But before you do anything, think about whether it makes sense. You have the power to sow death and destruction with ease.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_14 " );	// But a true magician uses it only when necessary.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_15 " );	// Learn to assess the situation, and you will know the true power of the runes.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold for this! Come back later.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};


func void DIA_Taliasan_CIRCLE_3()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,2000);
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_0C " );	// Are you ready to enter the next Circle of Magic?
			AI_Output(other,self, " DIA_Taliasan_CIRCLE_15_03 " );	// What knowledge comes with the Third Circle?
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_16 " );	// The Third Circle is one of the most important stages in the life of every magician. When you reach it, you complete your search.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_17 " );	// You have already crossed a significant stage on the path of magic. You have learned how to use runes.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_18 " );	// This knowledge will serve as the basis for the next step. Use runes carefully.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_19 " );	// You can use them or not. But you must make a choice.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_20 " );	// Once you've made your choice, use your power without hesitation.
			AI_Output(self,other, " DIA_Taliasan_CIRCLE_14_21 " );	// Find your way, and then you will know the power of decision.
		};

		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold for this! Come back later.
		Info_ClearChoices(DIA_Taliasan_CIRCLE);
	};
};

instance DIA_TALIASAN_BOOKSEEKXARDS (C_Info) .
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardas_condition;
	information = dia_booksearch_info;
	permanent = FALSE;
	description = " I'm looking for one very rare book. " ;
};


func int dia_taliasan_bookseekxardas_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (TALIASANTELLWHOMAGE == TRUE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardas_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_01_01 " );	// I'm looking for one very rare book.
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_01_03 " );	// I think it's called 'The Wasted Way'. Have you heard anything about her?
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_01_05 " );	// Tell me, why are you interested in her?
	Info_ClearChoices(dia_taliasan_bookseekxardas);
	Info_AddChoice(dia_taliasan_bookseekxardas, " This is a stupid game! " ,dia_taliasan_bookseekxardas_xardas);
	Info_AddChoice(dia_taliasan_bookseekxardas, " I'm just interested in rare things. " ,dia_taliasan_bookseekxardas_nothng);
};

func void dia_taliasan_bookseekxardas_xardas()
{
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_Xardas_01_01 " );	// Xardas needs her.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Xardas_01_02 " );	// (grins) I thought so...
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Xardas_01_03 " );	// Apparently, he will never rest until he has her in his hands.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Xardas_01_05 " );	// I'm afraid I'll disappoint you, but I don't have it.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Xardas_01_07 " );	// I sold it to a traveling merchant.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Xardas_01_09 " );	// Just don't ask about him. I do not remember. It was a long time ago...
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Xardas_01_10 " );	// So don't waste your time - you won't find it here.
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad said he sold this book a long time ago to an itinerant merchant whose name he can't remember. I think Gallahad's missing something. I think we should talk to Xardas about it. " );
	XARDASMISSBOOKFOREVER = TRUE;
};

func void dia_taliasan_bookseekxardas_nothng()
{
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_Nothng_01_01 " );	// I'm just interested in rare things.
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_02 " );	// Yes?! Hmmm... (surprised) Very interesting!
		AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_Nothng_01_03 " );	// So can you tell me where I can find this book?
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_05 " );	// I managed to get one copy of it. Although this is a rarity.
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_09 " );	// But I won't give it to you - don't even hope!
		AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_Nothng_01_12 " );	// Is there anything I can do to change your mind?
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_15 " );	// (thinks) You helped me with Larius... And I agree to give you this book, but only in exchange for the same valuable thing.
		AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_Nothng_01_16 " );	// What are you specifically interested in?
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_18 " );	// Anything will do - elixirs, plants, magic scrolls. The main thing is that this thing should be rare.
		AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_Nothng_01_19 " );	// Okay, I'll see what I can do.
		B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad agreed to give me this book in exchange for another rare item. It could be anything: an elixir, a plant, or a magic scroll. " );
		XARDASBRIGBOOKSPECIAL = TRUE;
		Info_ClearChoices(dia_taliasan_bookseekxardas);
	}
	else
	{
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_20 " );	// Yes?! Hmmm...(surprised) You don't seem like the kind of person who would be interested in that.
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_26 " );	// Hmmm... Okay, let's say I have one such instance.
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_27 " );	// But I won't give it to you - don't even hope!
		AI_Output(other,self, " DIA_Taliasan_BookSeekXardas_Nothng_01_28 " );	// Is there anything I can do to change your mind?
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardas_Nothng_01_29 " );	// I don't see any reason why I should give this book to you.
		B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad sees no reason to give me this book yet. I wonder what would make him change his mind? " );
		XARDASMISSBOOK = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_BOOKSAFTER_THE_THURSDAY ( C_Info ) .
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardasafter_condition;
	information = dia_taliasan_bookseekxardasafter_info;
	permanent = TRUE;
	description = " About that book... " ;
};


func int dia_taliasan_bookseekxardasafter_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (XARDASMISSBOOK == TRUE) && (XARDASBRIGBOOKSPECIAL == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardasafter_info()
{
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasAfter_01_00 " );	// About that book...
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardasAfter_01_01 " );	// Hmmm... Well, okay.
		AI_Output(other,self, " DIA_Taliasan_BookSeekXardasAfter_01_04 " );	// What are you specifically interested in?
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardasAfter_01_06 " );	// Anything will do - elixirs, plants, magic scrolls. The main thing is that this thing should be rare.
		AI_Output(other,self, " DIA_Taliasan_BookSeekXardasAfter_01_07 " );	// Okay, I'll see what I can do.
		B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad agreed to give me this book in exchange for another rare item. It could be anything: an elixir, a plant, or a magic scroll. " );
		XARDASBRIGBOOKSPECIAL = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardasAfter_01_08 " );	// I told you I don't see any reason yet why I should do this.
		AI_Output(self,other, " DIA_Taliasan_BookSeekXardasAfter_01_09 " );	// So leave me alone!
		AI_StopProcessInfos(self);
	};
};


instance DIA_TALIASAN_BOOKSEEKXARDASGIFT(C_Info)
{
	npc = vlk_6027_taliasan;
	condition = dia_taliasan_bookseekxardasgift_condition;
	information = dia_taliasan_bookseekxardasgift_info;
	permanent = TRUE;
	description = " About the rare item you're interested in... " ;
};


func int dia_taliasan_bookseekxardasgift_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (XARDASBRIGBOOKSPECIAL == TRUE) && (GIVEXARDASSEEKBOOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_bookseekxardasgift_info()
{
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_01_00 " );	// About the rare item you're interested in...
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_01_01 " );	// Yes? Do you have something special?
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
	if(Npc_HasItems(other,ItPo_Perm_STR) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift, " Offer potion of power. " ,dia_taliasan_bookseekxardasgift_potionstr);
	};
	if(Npc_HasItems(other,ItPo_Perm_DEX) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift, " Offer Elixir of Agility. " ,dia_taliasan_bookseekxardasgift_potiondex);
	};
	if(Npc_HasItems(other,ItPo_Perm_Mana) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift, " Offer Mana Elixir. " ,dia_taliasan_bookseekxardasgift_potionmana);
	};
	if(Npc_HasItems(other,ItPo_Perm_Health) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift, " Offer an elixir of life. " ,dia_taliasan_bookseekxardasgift_potionlife);
	};
	if(Npc_HasItems(other,ItPl_Perm_Herb) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift, " Suggest King Sorrel. " ,dia_taliasan_bookseekxardasgift_plantperm);
	};
	if(Npc_HasItems(other,itwr_xardasgoblinscroll) >= 1)
	{
		Info_AddChoice(dia_taliasan_bookseekxardasgift, " Offer Scroll of Banishment. " ,dia_taliasan_bookseekxardasgift_scroll);
	};
	Info_AddChoice(dia_taliasan_booksearch_exchange, " Пока нет. " ,dia_taliasan_booksearch_exchange_not);
};

func void dia_taliasan_bookseekxardasgift_not()
{
	AI_Output(other,self,"DIA_Taliasan_BookSeekXardasGift_Not_01_00");	//Пока нет.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_Not_01_01 " );	// In that case, you and I have nothing to discuss yet either.
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionstr()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PotionStr_01_00 " );	// This elixir of strength.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionStr_01_01 " );	// Hmmm... This is a really rare item.
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PotionStr_01_04 " );	// Here, take this. What about my book?
	B_GiveInvItems(other,self,ItPo_Perm_STR,1);
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionStr_01_05 " );	// Of course! As agreed, here it is.
	B_GiveInvItems(self,other,itwr_umsonst_01, 1 );
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionStr_01_06 " );	// And be careful with it - you won't find it anywhere else!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad has agreed to give me this book in exchange for an elixir of power. Now it must be taken to Xardas. " );
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potiondex()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PotionDex_01_00 " );	// This elixir of dexterity.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionDex_01_01 " );	// Hmmm... This is a really rare item.
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PotionDex_01_04 " );	// Here, take this. What about my book?
	B_GiveInvItems(other,self,ItPo_Perm_DEX,1);
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionDex_01_05 " );	// Of course! As agreed, here it is.
	B_GiveInvItems(self,other,itwr_umsonst_01, 1 );
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionDex_01_06 " );	// And be careful with it - you won't find it anywhere else!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad agreed to give me this book in exchange for the elixir of agility. Now I need to take it to Xardas. " );
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionmana()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PotionMana_01_00 " );	// This elixir of magical energy.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionMana_01_01 " );	// Hmmm... This is a really rare item.
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PotionMana_01_04 " );	// Here, take this. What about my book?
	B_GiveInvItems(other,self,ItPo_Perm_Mana,1);
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionMana_01_05 " );	// Of course! As agreed, here it is.
	B_GiveInvItems(self,other,itwr_umsonst_01, 1 );
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionMana_01_06 " );	// And be careful with it - you won't find it anywhere else!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad has agreed to give me this book in exchange for a mana elixir. Now I need to take it to Xardas. " );
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_potionlife()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PotionLife_01_00 " );	// This elixir of life.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionLife_01_01 " );	// Hmmm... This is a really rare item.
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PotionLife_01_04 " );	// Here, take this. What about my book?
	B_GiveInvItems(other,self,ItPo_Perm_Health,1);
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionLife_01_05 " );	// Of course! As agreed, here it is.
	B_GiveInvItems(self,other,itwr_umsonst_01, 1 );
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PotionLife_01_06 " );	// And be careful with it - you won't find it anywhere else!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallaghad agreed to give me this book in exchange for the elixir of life. Now it must be taken to Xardas. " );
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_plantperm()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_00 " );	// This is royal sorrel.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_01 " );	// Hmmm... This is a really rare item.
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_04 " );	// Here, take this. What about my book?
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_05 " );	// Of course! As agreed, here it is.
	B_GiveInvItems(self,other,itwr_umsonst_01, 1 );
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_PlantPerm_01_06 " );	// And be careful with it - you won't find it anywhere else!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad has agreed to give me this book in exchange for royal sorrel. Now I must take it to Xardas. " );
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};

func void dia_taliasan_bookseekxardasgift_scroll()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_Scroll_01_00 " );	// This scroll of banishment.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_Scroll_01_01 " );	// Incredible! This is indeed a very rare item.
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_Scroll_01_04 " );	// Here, take this. What about my book?
	B_GiveInvItems(other,self,itwr_xardasgoblinscroll,1);
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_Scroll_01_05 " );	// Of course! As agreed, here it is.
	B_GiveInvItems(self,other,itwr_umsonst_01, 1 );
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_Scroll_01_06 " );	// And be careful with it - you won't find it anywhere else!
	GIVEXARDASSEEKBOOK = TRUE;
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad has agreed to give me this book in exchange for the scroll of banishment. Now it must be taken to Xardas. " );
	Info_ClearChoices(dia_taliasan_bookseekxardasgift);
};


instance DIA_TALIASAN_TACHDOITSC1 (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_teachdoitsc1_condition;
	information = dia_taliasan_teachdoitsc1_info;
	permanent = TRUE;
	description = " Is there anything else you can teach me? " ;
};

func int dia_teachdoitsc1_condition()
{
	if((MIS_TALIASANHELP == LOG_SUCCESS) && (TALIASANTEACHMAGIC == TRUE) && (HOWCANMAKERUNE_ITSC == FALSE))
	{
		return TRUE;
	};
};

func void dia_taliasan_teachdoitsc1_info()
{
	AI_Output(other,self, " DIA_Taliasan_BookSeekXardasGift_Scroll_55_01 " );	// Is there anything else you can teach me?
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_Scroll_55_02 " );	// I can teach you how to make some magical scrolls.
	AI_Output(self,other, " DIA_Taliasan_BookSeekXardasGift_Scroll_55_16 " );	// But not free, of course.
	HOWCANMAKERUNE_ITSC = TRUE;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus, " Gallahad agreed to teach me how to make magical scrolls. However, he will only teach me how to write special formulas, thanks to which the scrolls themselves are obtained. In addition to knowing the specific formula, I will need: a writing table, a pen and runic paper. " );
};

var int taliasan_counter;

instance DIA_TALIASAN_TACHDOITSC2 (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = dia_taliasan_teachdoitsc2_condition;
	information = dia_taliasan_teachdoitsc2_info;
	permanent = TRUE;
	description = " Teach me how to make scrolls. " ;
};

func int dia_teachdoitsc2_condition()
{
	if((HOWCANMAKERUNE_ITSC == 1) && (TALIASAN_COUNTER < 7))
	{
		return TRUE;
	};
};

func void dia_taliasan_teachdoitsc2_info()
{
	Info_ClearChoices(dia_taliasan_teachdoitsc2);
	Info_AddChoice(dia_teach_teach2, " Отмена " ,teach_teach2_Back);

	if(HOWCANMAKERUNE_ITSC4 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2, " Ice Block Scroll (Training Points: 2, Cost: 500 coins) " ,dia_taliasan_teachdoitsc2_icecube);
	};
	if(HOWCANMAKERUNE_ITSC2 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2, " Scroll 'Destroy Undead' (Training Points: 4, Cost: 750 coins) " ,dia_taliasan_teachdoitsc2_hurmundead);
	};
	if(HOWCANMAKERUNE_ITSC5 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2, " Ice Wave Scroll (Training Points: 6, Cost: 1000 coins) " ,dia_taliasan_teachdoitsc2_icewave);
	};
	if(HOWCANMAKERUNE_ITSC6 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2, " Tornado Scroll (Training Points: 8, Cost: 1250 coins) " ,dia_taliasan_teachdoitsc2_tornado);
	};
	if(HOWCANMAKERUNE_ITSC7 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2, " Magic Hacking' (Training Points: 10, Cost: 1500 Coins) " ,dia_taliasan_teachdoitsc2_unlock);
	};
	if(HOWCANMAKERUNE_ITSC1 == FALSE)
	{
		Info_AddChoice(dia_taliasan_teachdoitsc2, " Rain of Fire Scroll (Training Points: 10, Cost: 2000 coins) " ,dia_taliasan_teachdoitsc2_firerain);
	};
};

func void dia_taliasan_teachdoitsc2_Back()
{
	Info_ClearChoices(dia_taliasan_teachdoitsc2);
};

func void dia_taliasan_teachdoitsc2_unlock()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1500) && (hero.lp >= 10))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1500);
		Npc_RemoveInvItems(self,ItMi_Gold,1500);
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		HOWCANMAKERUNE_ITSC7 = TRUE;
		AI_Print( " Learned how to make a magic scroll - 'Magic Hacking' " );
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1500)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 10)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_firerain()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 2000) && (hero.lp >= 10))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,2000);
		Npc_RemoveInvItems(self,ItMi_Gold,2000);
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		HOWCANMAKERUNE_ITSC1 = TRUE;
		AI_Print( " Learned how to make a magic scroll - 'Rain of Fire' " );
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 2000)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 10)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_hurmundead()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 750) && (hero.lp >= 4))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,750);
		Npc_RemoveInvItems(self,ItMi_Gold,750);
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		HOWCANMAKERUNE_ITSC2 = TRUE;
		AI_Print( " Learned how to make a magic scroll - 'Destroy Undead' " );
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 750)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 4)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_icecube()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 500) && (hero.lp >= 2))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,500);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		HOWCANMAKERUNE_ITSC4 = TRUE;
		AI_Print( " Learned how to make a magic scroll - 'Ice Block' " );
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 500)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 2)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_icewave()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1000) && (hero.lp >= 6))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1000);
		Npc_RemoveInvItems(self,ItMi_Gold,1000);
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		HOWCANMAKERUNE_ITSC5 = TRUE;
		AI_Print( " Learned how to make a magic scroll - 'Ice Wave' " );
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1000)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 6)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

func void dia_taliasan_teachdoitsc2_tornado()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 1250) && (hero.lp >= 8))
	{
		B_GiveInvItems(hero,self,ItMi_Gold,1250);
		Npc_RemoveInvItems(self,ItMi_Gold,1250);
		hero.lp = hero.lp - 8;
		RankPoints = RankPoints + 8;
		HOWCANMAKERUNE_ITSC6 = TRUE;
		AI_Print( " Learned how to make a magic scroll - 'Storm' " );
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
		TALIASAN_COUNTER = TALIASAN_COUNTER + 1;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < 1250)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		AI_Output(self,other, " DIA_Taliasan_CIRCLE_03_90 " );	// You don't have enough gold.
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	}
	else if(hero.lp < 8)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		Info_ClearChoices(dia_taliasan_teachdoitsc2);
	};
};

instance DIA_Review_BuyBooks (C_Info) .
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_BuyBooks_condition;
	information = DIA_Search_BuyBooks_info;
	permanent = FALSE;
	description = " Are you interested in rare books? " ;
};

func int DIA_Taliasan_BuyBooks_condition()
{
	if(MIS_TALIASANHELP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Review_BuyBooks_info()
{
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_01_01");	//Тебя интересуют редкие книги?
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_02");	//Конечно. Это единственное, что меня по-настоящему интересует.
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_03");	//Ибо некоторые знания не купишь даже за все золото мира.
	AI_Output(other,self,"DIA_Taliasan_BuyBooks_01_04");	//А что я получу взамен, если принесу тебе некоторые из них?
	AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_05");	//Хммм... Денег у меня сейчас мало, и мне нечем будет с тобой расплатиться.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_06");	//Однако в качестве награды я могу помочь тебе увеличить магические знания и опыт.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Галлахад также собирает редкие книги. Я могу приносить ему некоторые из их, а взамен он повысит мои магические способности и опыт.");
	}
	else
	{
		AI_Output(self,other,"DIA_Taliasan_BuyBooks_01_07");	//Однако в качестве награды я помогу увеличить твою жизненную энергию.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Галлахад также собирает редкие книги. Я могу приносить ему некоторые из их, а взамен он повысит мою жизненную энергию и опыт.");
	};

	AI_Output(self,other, " DIA_Taliasan_BuyBooks_01_08 " );	// If you're interested, of course.
	AI_Output(self,other, " DIA_Taliasan_BuyBooks_01_09 " );	// Or you can just sell them to any vendor in the marketplace.
	AI_Output(other,self, " DIA_Taliasan_BuyBooks_01_10 " );	// I'll think about your suggestion.
	TalBuyBooks = TRUE;
};

var int BookTalCount;

instance DIA_Taliasan_BuyBooks_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_BuyBooks_Done_condition;
	information = DIA_Search_BuyBooks_Done_info;
	permanent = TRUE;
	description = " Regarding rare books... " ;
};

func int DIA_Taliasan_BuyBooks_Done_condition()
{
	if(TalBuyBooks == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Taliasan_BuyBooks_Done_info()
{
	AI_Output(other,self, " DIA_Taliasan_BuyBooks_Done_01_01 " );	// About rare books...
	AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_01_02 " );	// (with interest) Yes? What can you offer me?
	AI_Output(other,self, " DIA_Taliasan_BuyBooks_Done_01_03 " );	// Here, take a look for yourself.
	AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_01_04 " );	// Good. Wait a minute.
	B_UseFakeScroll();
	
	BookTalCount = FALSE ;

	if (( Npc_HasItems( hero , ITWR_CBOW_T1 ) >=  1 ) && ( BookCountBonus_01 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
	};
	if (( Npc_HasItems( hero , ITWR_CBOW_T2 ) >=  1 ) && ( BookCountBonus_02 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero,ItWr_EinhandBuch) >=  1 ) && (BookTalBonus_03 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_ZweihandBuch) >= 1) && (BookTalBonus_04 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ASTRONOMIE ) >=  1 ) && (BookTalBonus_05 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_DEMONLANG ) >=  1 ) && (BookTalBonus_06 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 2;
	};
	if ((Npc_HasItems(hero, TEACHING_DER_GOETTER1 ) >=  1 ) && (BookTalBonus_07 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, TEACHING_DER_GOETTER2 ) >=  1 ) && (BookTalBonus_08 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, TEACHING_DER_GOETTER3 ) >=  1 ) && (BookTalBonus_09 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, THE_MAGIC_ORE ) >=  1 ) && (BookTalBonus_10 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, SCHLACHT_UM_VARANT1 ) >=  1 ) && (BookTalBonus_11 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, SCHLACHT_UM_VARANT2 ) >=  1 ) && (BookTalBonus_12 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_SOULRIVER) >= 1) && (BookTalBonus_13 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if (( Npc_HasItems( hero , ITWR_AZGOLOR ) >=  1 ) && ( BookCountBonus_14 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 2;
	};
	if ((Npc_HasItems(hero, ITWR_INNOSPRAY ) >=  1 ) && (BookTalBonus_15 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_MANIAC) >= 1) && (BookTalBonus_16 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_KAMPKUNST ) >=  1 ) && (BookTalBonus_17 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_ELEMENTAREARCANEI) >= 1) && (BookTalBonus_18 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_JAGD_UND_BEUTE ) >=  1 ) && (BookTalBonus_19 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, MYRTANAS_LYRIK ) >=  1 ) && (BookTalBonus_20 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, TRUE_MACHT ) >=  1 ) && (BookTalBonus_21 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, POWERFUL_ART ) >=  1 ) && (BookTalBonus_22 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, GOETTERGABE ) >=  1 ) && (BookTalBonus_23 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, MAGIC_MYSTERIES ) >=  1 ) && (BookTalBonus_24 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_UMSONST_01 ) >=  1 ) && (BookCountBonus_25 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_ANCIENT ) >=  1 ) && (BookCountBonus_26 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE) >= 1) && (BookTalBonus_27 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE_2) >= 1) && (BookTalBonus_28 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_DEMONTALE ) >=  1 ) && (BookTalBonus_29 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_SKELETONTALE ) >=  1 ) && (BookTalBonus_30 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_GOLEMBOOK1 ) >=  1 ) && (BookTalBonus_31 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_GOLEMBOOK2 ) >=  1 ) && (BookTalBonus_32 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ELEMENTARE_ARCANEI ) >=  1 ) && (BookTalBonus_33 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_MonasterySecret) >= 1) && (BookTalBonus_34 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
	};
	if ((Npc_HasItems(hero, ITWR_OLDBOOK1 ) >=  1 ) && (BookTalBonus_35 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if (( Npc_HasItems( hero , ITWR_OLDBOOK2 ) >=  1 ) && ( BookCountBonus_36 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
	};
	if (( Npc_HasItems( hero , ITWR_OLDBOOK3 ) >=  1 ) && ( BookCountBonus_37 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero, ITWR_OLDBOOK4 ) >=  1 ) && (BookTalBonus_38 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK5) >= 1) && (BookTalBonus_39 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero,ItWr_Astronomy_Mis) >=  1 ) && (BookTalBonus_40 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_VinosKellergeister_Mis) >= 1) && (BookTalBonus_41 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ITWR_DEATH1) >= 1) && (BookTalBonus_42 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};
	if (( Npc_HasItems( hero , ITWR_DEATH2 ) >=  1 ) && ( BookCountBonus_43 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero,ItWr_HallsofIrdorath_Open_Mis) >=  1 ) && (BookTalBonus_44 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if ((Npc_HasItems(hero,ItWr_XardasSeamapBook_Mis) >=  1 ) && (BookTalBonus_45 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
	};
	if (( Npc_HasItems( hero , ItWr_Alchemy_01 ) >=  1 ) && ( BookCountBonus_46 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
	};
	if((Npc_HasItems(hero,ItWr_Druid_01) >= 1) && (BookTalBonus_47 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
	};

	if(BookTalCount >= 1)
	{
		AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_01_05 " );	// Looks like you actually have some very interesting instances here!
		AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_01_06 " );	// Perhaps I'll take them. Are you sure you don't need them anymore?
		Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
		Info_AddChoice(DIA_Taliasan_BuyBooks_Done, " Yes, pick them up! " ,DIA_Taliasan_BuyBooks_Done_Yes);
		Info_AddChoice(DIA_Taliasan_BuyBooks_Done, " I need to think. " ,DIA_Taliasan_BuyBooks_Done_No);
	}
	else
	{
		AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_01_07 " );	// Unfortunately, you do not have those books that would really interest me.
		AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_01_08 " );	// So you'd better sell this junk to the merchants in the square. They have the right place!
	};
};


func void DIA_Taliasan_BuyBooks_Done_Yes()
{
	var int tempxpbook;

	BookTalCount = FALSE ;

	if (( Npc_HasItems( hero , ITWR_CBOW_T1 ) >=  1 ) && ( BookCountBonus_01 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_CBOW_T1,1);
		CreateInvItems(self,ITWR_CBOW_T1,1);
		BookTalBonus_01 = TRUE;
	};
	if (( Npc_HasItems( hero , ITWR_CBOW_T2 ) >=  1 ) && ( BookCountBonus_02 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_CBOW_T2,1);
		CreateInvItems(self,ITWR_CBOW_T2,1);
		BookTalBonus_02 = TRUE;
	};
	if ((Npc_HasItems(hero,ItWr_EinhandBuch) >=  1 ) && (BookTalBonus_03 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_EinhandBuch, 1 );
		CreateInvItems(self,ItWr_EinhandBuch, 1 );
		BookTalBonus_03 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_ZweihandBuch) >= 1) && (BookTalBonus_04 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_ZweihandBuch,1);
		CreateInvItems(self,ItWr_ZweihandBuch,1);
		BookTalBonus_04 = TRUE;
	};
	if ((Npc_HasItems(hero, ASTRONOMIE ) >=  1 ) && (BookTalBonus_05 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ASTRONOMIE,1);
		CreateInvItems(self,ASTRONOMIE,1);
		BookTalBonus_05 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_DEMONLANG ) >=  1 ) && (BookTalBonus_06 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_DEMONLANG,1);
		CreateInvItems(self,ITWR_DEMONLANG,1);
		BookTalBonus_06 = TRUE;
	};
	if ((Npc_HasItems(hero, TEACHING_DER_GOETTER1 ) >=  1 ) && (BookTalBonus_07 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, TEACH_DER_GOODS1 , 1 );
		CreateInvItems(self, TEACH_DER_GOETTER1 , 1 );
		BookTalBonus_07 = TRUE;
	};
	if ((Npc_HasItems(hero, TEACHING_DER_GOETTER2 ) >=  1 ) && (BookTalBonus_08 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, TEACH_DER_GOODS2 , 1 );
		CreateInvItems(self, TEACH_DER_GOETTER2 , 1 );
		BookTalBonus_08 = TRUE;
	};
	if ((Npc_HasItems(hero, TEACHING_DER_GOETTER3 ) >=  1 ) && (BookTalBonus_09 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, TEACH_DER_GOETTER3 , 1 );
		CreateInvItems(self, TEACH_DER_GOETTER3 , 1 );
		BookTalBonus_09 = TRUE;
	};
	if ((Npc_HasItems(hero, THE_MAGIC_ORE ) >=  1 ) && (BookTalBonus_10 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, THE_MAGIC_ORE , 1 );
		CreateInvItems(self, THE_MAGIC_ORE , 1 );
		BookTalBonus_10 = TRUE;
	};
	if ((Npc_HasItems(hero, SCHLACHT_UM_VARANT1 ) >=  1 ) && (BookTalBonus_11 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, BATTLE_OVER_VARANT1 , 1 );
		CreateInvItems(self, SCHLACHT_UM_VARANT1 , 1 );
		BookTalBonus_11 = TRUE;
	};
	if ((Npc_HasItems(hero, SCHLACHT_UM_VARANT2 ) >=  1 ) && (BookTalBonus_12 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, BATTLE_OVER_VARANT2 , 1 );
		CreateInvItems(self, SCHLACHT_UM_VARANT2 , 1 );
		BookTalBonus_12 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_SOULRIVER) >= 1) && (BookTalBonus_13 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_SOULRIVER,1);
		CreateInvItems(self,ITWR_SOULRIVER,1);
		BookTalBonus_13 = TRUE;
	};
	if (( Npc_HasItems( hero , ITWR_AZGOLOR ) >=  1 ) && ( BookCountBonus_14 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ITWR_AZGOLOR,1);
		CreateInvItems(self,ITWR_AZGOLOR,1);
		BookTalBonus_14 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_INNOSPRAY ) >=  1 ) && (BookTalBonus_15 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_INNOSPRAY,1);
		CreateInvItems(self,ITWR_INNOSPRAY,1);
		BookTalBonus_15 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_MANIAC) >= 1) && (BookTalBonus_16 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_MANIAC,1);
		CreateInvItems(self,ITWR_MANIAC,1);
		BookTalBonus_16 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_KAMPKUNST ) >=  1 ) && (BookTalBonus_17 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, ITWR_MARTIAL ARTS , 1 );
		CreateInvItems(self, ITWR_MARTIAL ARTS , 1 );
		BookTalBonus_17 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_ELEMENTAREARCANEI) >= 1) && (BookTalBonus_18 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_ELEMENTAREARCANEI,1);
		CreateInvItems(self,ITWR_ELEMENTAREARCANEI,1);
		BookTalBonus_18 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_JAGD_UND_BEUTE ) >=  1 ) && (BookTalBonus_19 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, ITWR_HUNTING_AND_POOT , 1 );
		CreateInvItems(self, ITWR_JAGD_UND_BEUTE , 1 );
		BookTalBonus_19 = TRUE;
	};
	if ((Npc_HasItems(hero, MYRTANAS_LYRIK ) >=  1 ) && (BookTalBonus_20 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,MYRTANAS_LYRIK,1);
		CreateInvItems(self, MYRTANAS_LYRIK , 1 );
		BookTalBonus_20 = TRUE;
	};
	if ((Npc_HasItems(hero, TRUE_MACHT ) >=  1 ) && (BookTalBonus_21 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, TRUE_MIGHT , 1 );
		CreateInvItems(self, TRUE_POWER , 1 );
		BookTalBonus_21 = TRUE;
	};
	if ((Npc_HasItems(hero, POWERFUL_ART ) >=  1 ) && (BookTalBonus_22 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, POWERFUL_ART , 1 );
		CreateInvItems(self, POWERFUL_ART , 1 );
		BookTalBonus_22 = TRUE;
	};
	if ((Npc_HasItems(hero, GOETTERGABE ) >=  1 ) && (BookTalBonus_23 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,GOETTERGABE,1);
		CreateInvItems(self,GOETTERGABE,1);
		BookTalBonus_23 = TRUE;
	};
	if ((Npc_HasItems(hero, MAGIC_MYSTERIES ) >=  1 ) && (BookTalBonus_24 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, MAGIC_MYSTERIES , 1 );
		CreateInvItems(self, MAGIC_MYSTERIES , 1 );
		BookTalBonus_24 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_UMSONST_01 ) >=  1 ) && (BookCountBonus_25 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero, ITWR_UMSONST_01 , 1 );
		CreateInvItems(self, ITWR_UMSONST_01 , 1 );
		BookTalBonus_25 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_ANCIENT ) >=  1 ) && (BookCountBonus_26 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_ANCIENT,1);
		CreateInvItems(self,ITWR_ANCIENT,1);
		BookTalBonus_26 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE) >= 1) && (BookTalBonus_27 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DRAGONTALE,1);
		CreateInvItems(self,ITWR_DRAGONTALE,1);
		BookTalBonus_27 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DRAGONTALE_2) >= 1) && (BookTalBonus_28 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DRAGONTALE_2,1);
		CreateInvItems(self,ITWR_DRAGONTALE_2,1);
		BookTalBonus_28 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_DEMONTALE ) >=  1 ) && (BookTalBonus_29 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEMONTALE,1);
		CreateInvItems(self,ITWR_DEMONTALE,1);
		BookTalBonus_29 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_SKELETONTALE ) >=  1 ) && (BookTalBonus_30 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_SKELETONTALE,1);
		CreateInvItems(self,ITWR_SKELETONTALE,1);
		BookTalBonus_30 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_GOLEMBOOK1 ) >=  1 ) && (BookTalBonus_31 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_GOLEMBOOK1,1);
		CreateInvItems(self,ITWR_GOLEMBOOK1,1);
		BookTalBonus_31 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_GOLEMBOOK2 ) >=  1 ) && (BookTalBonus_32 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_GOLEMBOOK2,1);
		CreateInvItems(self,ITWR_GOLEMBOOK2,1);
		BookTalBonus_32 = TRUE;
	};
	if ((Npc_HasItems(hero, ELEMENTARE_ARCANEI ) >=  1 ) && (BookTalBonus_33 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ELEMENTARE_ARCANEI,1);
		CreateInvItems(self,ELEMENTARE_ARCANEI,1);
		BookTalBonus_33 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_MonasterySecret) >= 1) && (BookTalBonus_34 == FALSE))
	{
		BookTalCount = BookTalCount + 2;
		Npc_RemoveInvItems(hero,ItWr_MonasterySecret,1);
		CreateInvItems(self,ItWr_MonasterySecret,1);
		BookTalBonus_34 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_OLDBOOK1 ) >=  1 ) && (BookTalBonus_35 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK1,1);
		CreateInvItems(self,ITWR_OLDBOOK1,1);
		BookTalBonus_35 = TRUE;
	};
	if (( Npc_HasItems( hero , ITWR_OLDBOOK2 ) >=  1 ) && ( BookCountBonus_36 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK2,1);
		CreateInvItems(self,ITWR_OLDBOOK2,1);
		BookTalBonus_36 = TRUE;
	};
	if (( Npc_HasItems( hero , ITWR_OLDBOOK3 ) >=  1 ) && ( BookCountBonus_37 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK3,1);
		CreateInvItems(self,ITWR_OLDBOOK3,1);
		BookTalBonus_37 = TRUE;
	};
	if ((Npc_HasItems(hero, ITWR_OLDBOOK4 ) >=  1 ) && (BookTalBonus_38 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK4,1);
		CreateInvItems(self,ITWR_OLDBOOK4,1);
		BookTalBonus_38 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_OLDBOOK5) >= 1) && (BookTalBonus_39 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_OLDBOOK5,1);
		CreateInvItems(self,ITWR_OLDBOOK5,1);
		BookTalBonus_39 = TRUE;
	};
	if ((Npc_HasItems(hero,ItWr_Astronomy_Mis) >=  1 ) && (BookTalBonus_40 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Astronomy_Mis,1);
		CreateInvItems(self,ItWr_Astronomy_Mis,1);
		BookTalBonus_40 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_VinosKellergeister_Mis) >= 1) && (BookTalBonus_41 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_VinosKellergeister_Mis,1);
		CreateInvItems(self,ItWr_VinosKellergeister_Mis,1);
		BookTalBonus_41 = TRUE;
	};
	if((Npc_HasItems(hero,ITWR_DEATH1) >= 1) && (BookTalBonus_42 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEATH1,1);
		CreateInvItems(self,ITWR_DEATH1,1);
		BookTalBonus_42 = TRUE;
	};
	if (( Npc_HasItems( hero , ITWR_DEATH2 ) >=  1 ) && ( BookCountBonus_43 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ITWR_DEATH2,1);
		CreateInvItems(self,ITWR_DEATH2,1);
		BookTalBonus_43 = TRUE;
	};
	if ((Npc_HasItems(hero,ItWr_HallsofIrdorath_Open_Mis) >=  1 ) && (BookTalBonus_44 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(self,ItWr_HallsofIrdorath_Open_Mis,1);
		BookTalBonus_44 = TRUE;
	};
	if ((Npc_HasItems(hero,ItWr_XardasSeamapBook_Mis) >=  1 ) && (BookTalBonus_45 ==  FALSE ))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_XardasSeamapBook_Mis,1);
		CreateInvItems(self,ItWr_XardasSeamapBook_Mis,1);
		BookTalBonus_45 = TRUE;
	};
	if (( Npc_HasItems( hero , ItWr_Alchemy_01 ) >=  1 ) && ( BookCountBonus_46 ==  FALSE )) ;
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Alchemy_01,1);
		CreateInvItems(self,ItWr_Alchemy_01,1);
		BookTalBonus_46 = TRUE;
	};
	if((Npc_HasItems(hero,ItWr_Druid_01) >= 1) && (BookTalBonus_47 == FALSE))
	{
		BookTalCount = BookTalCount + 1;
		Npc_RemoveInvItems(hero,ItWr_Druid_01,1);
		CreateInvItems(self,ItWr_Druid_01,1);
		BookTalBonus_47 = TRUE;
	};

	tempxpbook= BookTalCount * 150;

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM))
	{
		B_GivePlayerXP(tempxpbook);
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,BookTalCount);
		Npc_ChangeAttribute(hero,ATR_MANA,BookTalCount);
		B_GiveInvItemsManyThings(other,self);
		AI_Output(other,self, " DIA_Taliasan_BuyBooks_Done_Yes_01_01 " );	// Yes, take them.
		AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_Yes_01_02 " );	// Good. And I, in turn, as promised, will increase your magical abilities.
	}
	else
	{
		B_GivePlayerXP(tempxpbook);
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,BookTalCount);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,BookTalCount);
		B_GiveInvItemsManyThings(other,self);
		AI_Output(other,self, " DIA_Taliasan_BuyBooks_Done_Yes_01_05 " );	// Yes, take them.
		AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_Yes_01_06 " );	// Good. And I, in turn, as promised, will increase your vitality.
	};

	Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
};

func void DIA_Taliasan_BuyBooks_Done_No()
{
	AI_Output(other,self, " DIA_Taliasan_BuyBooks_Done_No_01_01 " );	// I need to think.
	AI_Output(self,other, " DIA_Taliasan_BuyBooks_Done_No_01_02 " );	// (sarcastically) Of course. And then you never know, all of a sudden you still need them.
	Info_ClearChoices(DIA_Taliasan_BuyBooks_Done);
};

instance DIA_Taliasan_TestCanone (C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_TestCanone_condition;
	information = DIA_Taliasan_TestCanone_info;
	permanent = FALSE;
	description = " Is there any other work for me to do? " ;
};

func int DIA_Taliasan_TestCanone_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_TALIASANHELP == LOG_SUCCESS) && (TaliasanNextQuest < daynow))
	{
		return TRUE;
	};
};

func void DIA_Taliasan_TestCanone_info()
{
	AI_Output(other,self, " DIA_Taliasan_TestCanone_01_00 " );	// Any other work for me to do?
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_01 " );	// Yes. It's good that you asked.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_02 " );	// I just had one very important business, in which your help would not hurt.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_04 " );	// A couple of days ago, Lord Hagen placed an order with local alchemists to make magic powder for firing cannons.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_05 " );	// The supply of paladins is already low, and the situation with the orcs is getting more and more tense.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_06 " );	// However, the problem is that none of the craftsmen here have ever done anything like this.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_07 " );	// Simply put, none of them know how to do it.
	AI_Output(other,self, " DIA_Taliasan_TestCanone_01_08 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_09 " );	// (annoyed) You haven't listened to the end yet, and you're already asking questions! I just know the recipe for this powder!
	AI_Output(other,self, " DIA_Taliasan_TestCanone_01_10 " );	// Why don't you tell Lord Hagen himself about this?
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_11 " );	// Because I'm not sure if it will work or not.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_12 " );	// And I don't want at all, in case of failure, to look like a complete fool in the eyes of the head of the paladins.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_13 " );	// So I made a little tester and I need someone to test it out.
	AI_Output(other,self, " DIA_Taliasan_TestCanone_01_14 " );	// And you think that person could be me.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_15 " );	// That's right! In the end, in the case of recommendations, you showed your best side.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_16 " );	// Which means this business shouldn't be too difficult for you.
	AI_Output(other,self, " DIA_Taliasan_TestCanone_01_17 " );	// Okay! Say what needs to be done.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_18 " );	// Here, take this flask with magic powder and try to shoot with it from some kind of gun.
	B_GiveInvItems(self,other,ItMi_MagicPowder,1);
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_19 " );	// Just don't try to do it in the city! We don't need any more noise.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_20 " );	// Find a quiet place and shy away to your heart's content. All clear?
	AI_Output(other,self,"DIA_Taliasan_TestCanone_01_21");	//Вполне.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_01_22 " );	// Okay, I'll wait for your report then.
	MIS_MagicPowder = LOG_Running;
	Log_CreateTopic(TOPIC_MagicPowder,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MagicPowder,LOG_Running);
	B_LogEntry(TOPIC_MagicPowder, " Gallahad wants me to test his magical cannon-shooting powder before offering it to Lord Hagen. I need to find a quiet spot and try it out on a cannon. " );
	AI_StopProcessInfos(self);
};

instance DIA_Taliasan_TestCanone_Done(C_Info)
{
	npc = vlk_6027_taliasan;
	nr = 1;
	condition = DIA_Taliasan_TestCanone_Done_condition;
	information = DIA_Taliasan_TestCanone_Done_info;
	permanent = FALSE;
	description = " About your powder... " ;
};

func int DIA_Taliasan_TestCanone_Done_condition()
{
	if((MIS_MagicPowder == LOG_Running) && (CanonIsFire == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Taliasan_TestCanone_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Taliasan_TestCanone_Done_01_00 " );	// About your powder...
	AI_Output(self,other, " DIA_Taliasan_TestCanone_Done_01_01 " );	// (with interest) Yes?
	AI_Output(other,self, " DIA_Taliasan_TestCanone_Done_01_02 " );	// Apparently it works.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_Done_01_03 " );	// Were you able to fire the cannon with it?
	AI_Output(other,self, " DIA_Taliasan_TestCanone_Done_01_04 " );	// Of course. He banged so that his ears were blocked.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_Done_01_05 " );	// Well, great news! Now this powder can be offered to Lord Hagen himself.
	AI_Output(self,other, " DIA_Taliasan_TestCanone_Done_01_06 " );	// Here, take your reward.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_MagicPowder = LOG_Success;
	Log_SetTopicStatus(TOPIC_MagicPowder,LOG_Success);
	B_LogEntry(TOPIC_MagicPowder, " Gallahad was delighted to hear that the powder was successfully tested. " );
};
