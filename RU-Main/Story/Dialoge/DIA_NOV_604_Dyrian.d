

instance DIA_Dyrian_EXIT(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 999;
	condition = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Hello(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Hello_Condition()
{
	if (Npc_IsInState(self,ZS_Talk) && ( MY_RUNE  ==  FALSE ) && ( MY_SCHNITZELJAGD  ==  FALSE ) && ( MY_GOLEM  ==  FALSE ) && ( other.guild ==  GIL_NOV )) ;
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Hello_Info()
{
	AI_Output(self,other, " DIA_Dyrian_Hello_13_00 " );	// (sadly) What do you want?
};


instance DIA_Dyrian_Wurst (C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Wurst_Condition;
	information = DIA_Dyrian_Sausage_Info;
	permanent = FALSE;
	description = " I'm in charge of sausage distribution. " ;
};


func int DIA_Dyrian_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Dyrian_Wurst_15_00 " );	// I'm in charge of distributing the sausage.
	AI_Output(self,other, " DIA_Dyrian_Wurst_13_01 " );	// Thank you. I hope this is not the last sausage I get here.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Dyrian_Job(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Dyrian_Job_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Dyrian_Hello ) && ( MY_RUNE  ==  FALSE ) && ( MY_SCHNITZELJAGD  ==  FALSE ) && ( MY_GOLEM  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Job_Info()
{
	AI_Output(other,self, " DIA_Dyrian_Job_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Dyrian_Job_13_01 " );	// I'm a sinner. I violated the rules of conduct in the monastery.
	AI_Output(self,other, " DIA_Dyrian_Job_13_02 " );	// Now I'm waiting for the High Council's decision. I don't know if they will leave me in the monastery.
};


instance DIA_Dyrian_WhatDone(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent = FALSE;
	description = " Tell me what happened. " ;
};


func int DIA_Dyrian_WhatDone_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Dyrian_Job ) && ( MIS_RUNE  ==  FALSE ) && ( MIS_SCHNITZELJAGD  ==  FALSE ) && ( MIS_GOLEM  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_WhatDone_Info()
{
	AI_Output(other,self, " DIA_Dyrian_WhatDone_15_00 " );	// Tell me what happened.
	AI_Output(self,other, " DIA_Dyrian_WhatDone_13_01 " );	// I took the book from one of the magicians' room when I was sweeping it so I could read it at my leisure.
	AI_Output(self,other, " DIA_Dyrian_WhatDone_13_02 " );	// Master Higlas, of course, immediately noticed the loss and asked me about this book.
	AI_Output(self,other, " DIA_Dyrian_WhatDone_13_03 " );	// For fear of being punished, I lied. And then he caught me in my cell while I was reading this book.
	AI_Output(self,other, " DIA_Dyrian_WhatDone_13_04 " );	// He became very angry and reported this to the High Council. Now they are deciding if I can stay in the monastery.
};


instance DIA_Dyrian_CanHelp(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent = TRUE;
	description = " Is there anything I can help you with? " ;
};


func int DIA_Dyrian_CanHelp_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Dyrian_Job ) && ( MIS_RUNE  ==  FALSE ) && ( MIS_SCHNITZELJAGD  ==  FALSE ) && ( MIS_GOLEM  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_CanHelp_Info()
{
	AI_Output(other,self, " DIA_Dyrian_CanHelp_15_00 " );	// Is there anything I can help you with?
	AI_Output(self,other, " DIA_Dyrian_CanHelp_13_01 " );	// No, my fate now depends only on the mercy of Innos and the magicians.
};


instance DIA_Dyrian_Scroll(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Scroll_Condition()
{
	if (( MIS_SCHNITZELJAGD  == LOG_Running) || ( MIS_RUNE  == LOG_Running) || ( MIS_GOLEM  == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Scroll_Info()
{
	AI_Output(self,other, " DIA_Dyrian_Scroll_13_00 " );	// Hey, did you really request a Trial by Fire?
	AI_Output(other,self, " DIA_Dyrian_Scroll_15_01 " );	// Yes. And I intend to pass it.
	AI_Output(self,other, " DIA_Dyrian_Scroll_13_02 " );	// Okay - maybe I can help you with that. I can give you a scroll with a very powerful spell. SLEEP spell. Well, how?
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll, " No, I don't need your help. " ,DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll, " What do you want for this? " ,DIA_Dyrian_Scroll_How);
	Info_AddChoice(DIA_Dyrian_Scroll, " What should I do with it? " ,DIA_Dyrian_Scroll_What);
};

func void DIA_Dyrian_Scroll_What()
{
	AI_Output(other,self, " DIA_Dyrian_Scroll_What_15_00 " );	// And what should I do with it?
	AI_Output(self,other, " DIA_Dyrian_Scroll_What_13_01 " );	// With this spell, you can put people into a magical sleep for a short time. But only if their will is weaker than yours.
	AI_Output(self,other, " DIA_Dyrian_Scroll_What_13_02 " );	// This can be very useful if someone gets in your way...
	AI_Output(other,self, " DIA_Dyrian_Scroll_What_15_03 " );	// How do I know whose will is stronger?
	AI_Output(self,other, " DIA_Dyrian_Scroll_What_13_04 " );	// You shouldn't even try this spell on mages. But you will be able to put most of the novices to sleep.
};

func void DIA_Dyrian_Scroll_No()
{
	AI_Output(other,self, " DIA_Dyrian_Scroll_No_15_00 " );	// No, I don't need your help.
	AI_Output(self,other, " DIA_Dyrian_Scroll_No_13_01 " );	// You can contact me anytime if you change your mind.
	Info_ClearChoices(DIA_Dyrian_Scroll);
};

func void DIA_Dyrian_Scroll_How()
{
	AI_Output(other,self, " DIA_Dyrian_Scroll_How_15_00 " );	// What do you want for him?
	AI_Output(self,other, " DIA_Dyrian_Scroll_How_13_01 " );	// Every newly initiated mage is entitled to one wish.
	AI_Output(self,other, " DIA_Dyrian_Scroll_How_13_02 " );	// And if you do pass the Trial by Fire, you may want me to stay at the monastery.
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll, " No, I don't need your help. " ,DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll, " Okay, give me this scroll. " ,DIA_Dyrian_Scroll_Yes);
};

func void DIA_Dyrian_Scroll_Yes()
{
	AI_Output(other,self, " DIA_Dyrian_Scroll_Yes_15_00 " );	// Okay, give me this scroll.
	AI_Output(self,other, " DIA_Dyrian_Scroll_Yes_13_01 " );	// Good luck with this challenge. May Innos help you.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
	Log_CreateTopic(Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus(Topic_DyrianDrin,LOG_Running);
	B_LogEntry(Topic_DyrianDrin, " Durian gave me a scroll with the Sleep spell. In return, he wants me to put in a good word for him and he stays in the monastery. " );
	Info_ClearChoices(DIA_Dyrian_Scroll);
};


instance DIA_Dyrian_Doch (C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent = TRUE;
	description = " I've changed my mind. Give me that sleep spell. " ;
};


func int DIA_Dyrian_Doch_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Dyrian_Scroll ) & & ( MIS_HelpDyrian != LOG_Running ) & & ( other . guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Doch_Info()
{
	AI_Output(other,self, " DIA_Dyrian_Doch_15_00 " );	// I changed my mind. Give me that sleep spell.
	AI_Output(self,other, " DIA_Dyrian_Doch_13_01 " );	// Well, if you pass the test, you will put in a good word for me, and they will leave me in the monastery.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
};


instance DIA_Dyrian_HelloAgain(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_HelloAgain_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_KDF) && (MIS_HelpDyrian == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HelloAgain_Info()
{
	AI_Output(self,other, " DIA_Dyrian_HelloAgain_13_00 " );	// (joyfully) Thank you! You saved me!
	AI_Output(self,other, " DIA_Dyrian_HelloAgain_13_01 " );	// (frightened) Oh - please forgive me, Master. I didn't mean to be impolite.
	AI_Output(self,other, " DIA_Dyrian_HelloAgain_13_02 " );	// (respectfully) I thank you for allowing me to stay at the monastery. My life is about to change...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output(other,self, " DIA_Dyrian_HowIsIt_15_00 " );	// How are you?
};


instances DIA_Dyrian_HowIsIt (C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Dyrian_HowIsIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_HelloAgain))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other, " DIA_Dyrian_HowIsIt_13_01 " );	// Good. I really like my work, Master.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_other(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Dyrian_other_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other, " DIA_Dyrian_HowIsIt_13_02 " );	// I am grateful to Innos for being able to live in a monastery.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Bar (C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Dyrian_Kneipe_Condition()
{
	if((MIS_HelpDyrian == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Kneipe_Info()
{
	AI_Output(other,self, " DIA_Dyrian_Kneipe_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Dyrian_Kneipe_13_01 " );	// Are you still asking? I hoped so much for you, and you left me in trouble.
	AI_Output(self,other, " DIA_Dyrian_Kneipe_13_02 " );	// Now I have no choice but to fill my grief with wine. And this is your fault!
	Info_ClearChoices(DIA_Dyrian_Kneipe);
	Info_AddChoice(DIA_Dyrian_Kneipe, " Here, take 5 gold. " ,DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice(DIA_Dyrian_Kneipe, " I can explain everything. " ,DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice(DIA_Dyrian_Kneipe, " Watch your words. " ,DIA_Dyrian_Kneipe_ShutUp);
};

func void DIA_Dyrian_Kneipe_Gold()
{
	AI_Output(other,self, " DIA_Dyrian_Kneipe_Gold_15_00 " );	// Here, take 5 gold.
	AI_Output(self,other, " DIA_Dyrian_Kneipe_Gold_13_01 " );	// (nervously) 5 gold? Are you giving me 5 gold as compensation for depriving me of the meaning of my life?
	AI_Output(self,other, " DIA_Dyrian_Kneipe_Gold_13_02 " );	// I'll take all your gold!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

func void DIA_Dyrian_Kneipe_CanExplain()
{
	AI_Output(other,self, " DIA_Dyrian_Kneipe_CanExplain_15_00 " );	// I can explain everything.
	AI_Output(self,other, " DIA_Dyrian_Kneipe_CanExplain_13_01 " );	// I don't need your explanations.
	AI_Output(self,other, " DIA_Dyrian_Kneipe_CanExplain_13_02 " );	// You lie every time you open your fucking mouth. Now leave me.
	AI_StopProcessInfos(self);
};

func void DIA_Dyrian_Kneipe_ShutUp()
{
	AI_Output(other,self, " DIA_Dyrian_Kneipe_ShutUp_15_00 " );	// Watch your words.
	AI_Output(self,other, " DIA_Dyrian_Kneipe_ShutUp_13_01 " );	// Yeah, go ahead and threaten me! It still won't help you.
	AI_Output(self,other, " DIA_Dyrian_Kneipe_ShutUp_13_02 " );	// I'll tell everyone what a treacherous bastard you are! I'm about to finish this bottle...
	AI_Output(self,other, " DIA_Dyrian_Kneipe_ShutUp_13_03 " );	// Now get out of my sight, you disgust me!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_after (C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_after_Condition;
	information = DIA_Dyrian_after_Info;
	permanent = TRUE;
	description = " What's wrong with you? " ;
};


func int DIA_Dyrian_after_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Kneipe))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_after_Info()
{
	AI_Output(other,self, " DIA_Dyrian_nachher_15_00 " );	// What's wrong with you?
	AI_Output(self,other, " DIA_Dyrian_nachher_13_01 " );	// Ah, leave me alone! I don't even want to know you!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_PICKPOCKET(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 900;
	condition = DIA_Dyrian_PICKPOCKET_Condition;
	information = DIA_Dyrian_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dyrian_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 15 );
};

func void DIA_Dyrian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,Dialog_Back,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

