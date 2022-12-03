

instance DIA_Gerbrandt_EXIT (C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 999;
	condition = DIA_Gerbrandt_EXIT_Condition;
	information = DIA_Gerbrandt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gerbrandt_EXIT_Info()
{
	if(DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc(PC_Thief_NW);

		if(Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine(DiegoNW,"GERBRANDT");
		};

		Npc_ExchangeRoutine(self,"NEWLIFE");
		B_StartOtherRoutine(GerbrandtsFrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
	AI_SetWalkMode(self,NPC_RUN);
};

instance DIA_Gerbrandt_Hello (C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 5;
	condition = DIA_Gerbrandt_Hello_Condition;
	information = DIA_Gerbrandt_Hello_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Gerbrandt_Hello_Condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Hello_Info()
{
	AI_Output(other,self, " DIA_Gerbrandt_Hello_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Gerbrandt_Hello_10_01 " );	// Who are you? Looks like you're new here and have no idea who you're dealing with.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_10_02 " );	// My name is Gerbrandt. And for you, I'm Mr. Gerbrandt. Understood?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello, " I got it, Gerbrandt. " ,DIA_Gerbrandt_Hello_No);
	Info_AddChoice(DIA_Gerbrandt_Hello, " I got it Mr. Gerbrandt. " ,DIA_Gerbrandt_Hello_Yes);
};

func void DIA_Gerbrandt_Hello_No()
{
	AI_Output(other,self, " DIA_Gerbrandt_Hello_No_15_00 " );	// I got it, Gerbrandt.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_No_10_01 " );	// Hold your tongue! You better show respect to me or you'll be in big trouble...
	AI_Output(self,other, " DIA_Gerbrandt_Hello_No_10_02 " );	// This is where I make the law. Whoever creates problems will have to answer to me. And it’s better for him to immediately run out of the city as fast as possible, because after I deal with him, he will regret that he caught my eye!
	AI_Output(self,other, " DIA_Gerbrandt_Hello_No_10_03 " );	// Most of the people in the port work for me. And if you're looking for a job, you'd better make sure that my memories of you are pleasant.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes()
{
	AI_Output(other,self, " DIA_Gerbrandt_Hello_Yes_15_00 " );	// I understand, Mr. Gerbrandt.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_10_01 " );	// Well, at least it didn't take you long to figure out which way the wind was blowing here.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_10_02 " );	// As soon as business picks up again, I'll probably have a job for a smart kid like you.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_10_03 " );	// You'd make a great storekeeper.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_10_04 " );	// Can you read?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello, " Нет. " ,DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice(DIA_Gerbrandt_Hello, " I don't need a job. " ,DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice(DIA_Gerbrandt_Hello, " Конечно. " ,DIA_Gerbrandt_Hello_Yes_Yes);
};

func void DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Нет.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_No_10_01 " );	// Nothing, at least you can move a few sacks from place to place.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_No_10_02 " );	// And if I'm pleased with you, I might even offer you a permanent position. There is always a lot of work here.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_No_10_03 " );	// Well, then I'll be waiting for you at my place as soon as the first merchant ship docks at the pier.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_NoJob()
{
	AI_Output(other,self, " DIA_Gerbrandt_Hello_NoJob_15_00 " );	// I don't need a job.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_NoJob_10_01 " );	// You think you're awfully cool. Look, no one can get a job here without my approval.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_NoJob_10_02 " );	// And if you continue to insult me, you can immediately look for a straw mattress with bugs, because it will be all you can afford.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_NoJob_10_03 " );	// There will come a time when you will beg me to give you a job.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Конечно.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_Yes_10_01 " );	// Great. It's hard to find trained workers these days.
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_Yes_10_02 " );	// What about your recommendations?
	AI_Output(other,self, " DIA_Gerbrandt_Hello_Yes_Yes_15_03 " );	// Recommendations?
	AI_Output(self,other, " DIA_Gerbrandt_Hello_Yes_Yes_10_04 " );	// Okay, I'll remember your face. When trading resumes again, come to me. Then I'll give you a job.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void B_GErbrandt_PissOff()
{
	AI_Output(self,other, " B_Gerbrandt_PissOff_10_00 " );	// What does it all mean - are you kidding me?
	AI_Output(self,other, " B_Gerbrandt_PissOff_10_01 " );	// You and your buddy Diego are already done.
	AI_Output(self,other, " B_Gerbrandt_PissOff_10_02 " );	// Leave me alone!
	if(DIEGO_COMING != TRUE)
	{
		AI_StopProcessInfos(self);
	};
	if(MIS_GERBRANDTHELP == LOG_Running)
	{
		MIS_GERBRANDTHELP = LOG_FAILED;
		GERBRANDTPISSOFF = TRUE;
		B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
	};
};


instance DIA_Gerbrandt_Perm (C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 800;
	condition = DIA_Gerbrandt_Perm_Condition;
	information = DIA_Gerbrandt_Perm_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_Gerbrandt_Perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gerbrandt_Hello ))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Perm_Info()
{
	AI_Output(other,self, " DIA_Gerbrandt_Perm_15_00 " );	// Any news?
	if (chapter <=  2 )
	{
		if ((hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDW ) && (hero.guild !=  GIL_KDM ))
		{
			if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (GERBRANDTPISSOFF == FALSE))
			{
				AI_Output(self,other, " DIA_Gerbrandt_Perm_10_20 " );	// No. Nothing like this has happened lately.
				AI_Output(self,other, " DIA_Gerbrandt_Perm_10_21 " );	// Good thing you looked! Was glad to see you.
			}
			else
			{
				AI_Output(self,other, " DIA_Gerbrandt_Perm_10_01 " );	// People like you have nothing to do here. Decent members of society live here, and not some vagabonds and rogues.
				AI_Output(self,other, " DIA_Gerbrandt_Perm_10_02 " );	// If you ever manage to become rich and respected, perhaps you will be more welcome here.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Gerbrandt_Perm_10_03 " );	// I have nothing to complain about, oh noble knight.
		};
	}
	else  if (chapter >=  3 )
	{
		if(MIS_DiegosResidence != LOG_SUCCESS)
		{
			if ((hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDW ) && (hero.guild !=  GIL_KDM ))
			{
				if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (GERBRANDTPISSOFF == FALSE))
				{
					AI_Output(self,other, " DIA_Gerbrandt_Perm_10_22 " );	// No. Nothing like this has happened lately.
					AI_Output(self,other, " DIA_Gerbrandt_Perm_10_23 " );	// Good thing you looked! Was glad to see you.
				}
				else
				{
					AI_Output(self,other, " DIA_Gerbrandt_Perm_10_04 " );	// I've seen a lot of people like you. You just don't know your place!
					AI_Output(self,other, " DIA_Gerbrandt_Perm_10_05 " );	// I should talk to the governor about tightening security in the upper block.
				};
			}
			else
			{
				AI_Output(self,other, " DIA_Gerbrandt_Perm_10_06 " );	// This concerns no one but me. I'm busy!
			};
		}
		else
		{
			B_GErbrandt_PissOff();
		};
	};
};


instance DIA_GERBRANDT_FUCKOFF (C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_fuckoff_condition;
	information = dia_gerbrandt_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gerbrandt_fuckoff_condition()
{
	if((GERBRANDTPISSOFF == TRUE) && (MIS_DiegosResidence != LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_Gerbrandt_GreetingsFromDiego (C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information = DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent = FALSE;
	description = " Diego says hello to you. " ;
};


func int DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	if((MIS_DiegosResidence == LOG_Running) && (Npc_HasItems(other,ItWr_DiegosLetter_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output(other,self, " DIA_Gerbrandt_GreetingsFromDiego_15_00 " );	// Diego says hello to you.
	AI_Output(self,other, " DIA_Gerbrandt_GreetingsFromDiego_10_01 " );	// (frightened) What? Who? Which Diego?
	AI_Output(other,self, " DIA_Gerbrandt_GreetingsFromDiego_15_02 " );	// He asked me to give you this letter.
	B_GiveInvItems(other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Gerbrandt_GreetingsFromDiego_10_03 " );	// (excitedly) It can't be. No. I'm finished!
	AI_Output(self,other, " DIA_Gerbrandt_GreetingsFromDiego_10_04 " );	// (in fear) Is he already in town?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Кто?
	AI_Output(self,other, " DIA_Gerbrandt_GreetingsFromDiego_10_06 " );	// Diego, of course!
	AI_Output(other,self, " DIA_Gerbrandt_GreetingsFromDiego_15_07 " );	// Yes, I should meet him soon.
	AI_Output(self,other, " DIA_Gerbrandt_GreetingsFromDiego_10_08 " );	// (in desperation, to himself) This is the end! Everything is lost!
	AI_Output(self,other, " DIA_Gerbrandt_GreetingsFromDiego_10_09 " );	// I don't have time, I have to get out of here. Fast. If he finds me here, I'm done for!
	MIS_DiegosResidence = LOG_SUCCESS;
	B_GivePlayerXP(XP_DiegosResidence);
	DIEGO_COMING = TRUE;
};

instance DIA_GERBRANDT_WORKSFOR(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_worksfor_condition;
	information = dia_gerbrandt_worksfor_info;
	permanent = FALSE;
	description = " Do you have any work for me to do? " ;
};

func int dia_gerbrandt_worksfor_condition()
{
	if (( MY_TALIASANHELP  == LOG_Running) && (MY_DiegosResidence !=  LOG_SUCCESS ) && Npc_KnowsInfo(other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_worksfor_info()
{
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_01_00 " );	// Do you have any work for me?
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_01_01 " );	// And why did you think that I need your services?
	Info_ClearChoices(dia_gerbrandt_worksfor);
	Info_AddChoice(dia_gerbrandt_worksfor, " I was just wondering. " ,dia_gerbrandt_worksfor_interes);
	Info_AddChoice(dia_gerbrandt_worksfor, " I think so. " ,dia_gerbrandt_worksfor_think);
	Info_AddChoice(dia_gerbrandt_worksfor, " I have no idea. Don't I? " ,dia_gerbrandt_worksfor_dontknow);
	Info_AddChoice(dia_gerbrandt_worksfor, " I really need this job. " ,dia_gerbrandt_worksfor_needwork);
};

func void dia_gerbrandt_worksfor_interes()
{
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Interes_01_00 " );	// I just asked.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Interes_01_02 " );	// Then I'll just answer you: I don't have any work for you.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Interes_01_03 " );	// Look for it somewhere else. For example, in the port quarter.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Interes_01_04 " );	// Here, a fool like you will never get her.
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_dontknow()
{
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_DontKnow_01_00 " );	// I have no idea. Is not it so?
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_DontKnow_01_01 " );	// What? Do you offer your services and at the same time you do not know what you can offer?
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_DontKnow_01_02 " );	// In that case, I don't know what kind of job to offer to an idiot like you either.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_DontKnow_01_03 " );	// And now be so kind as to disappear from my sight.
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_needwork()
{
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_NeedWork_01_00 " );	// I really need this job.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_NeedWork_01_01 " );	// Everyone needs a job. But I don't see any reason why I should offer it to you.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_NeedWork_01_02 " );	// All around are fools who only do what they try to fool me.
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_think()
{
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_00 " );	// I think it is.
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_02 " );	/ / I thought that a businessman like you, Mr. Gerbrandt, always has a couple of some urgent assignments.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_07 " );	// And I'll see, you're a good guy!
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_08 " );	// Maybe your help will really be in place...
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_10 " );	// Hmmm... I have a little business here. I think just for you.
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_11 " );	// And what is it?
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_12 " );	// Nothing special. You need to meet with one person and just give him something.
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_13 " );	// What exactly should I tell him, and who is this person?
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_14 " );	// I have an appointment with him today. Exactly at midnight in the tavern 'Dead Harpy'.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_15 " );	// You will have to give him this wallet with money and this letter.
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_16 " );	// How do I recognize it?
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_17 " );	// Trust me, it won't be as hard as it looks. In addition, there is one more condition.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_19 " );	// This person you will meet must under no circumstances know that I sent you.
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_1A " );	// So I have to act on my own behalf?
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_1B " );	// Yes. He shouldn't suspect anything.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_22 " );	// Here, take your wallet...
	B_GiveInvItems(self,other,itse_gerbrandpocket,1);
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_23");	//...и письмо.
	B_GiveInvItems(self,other,itwr_gerbrandseclet,1);
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_24 " );	// Don't you dare read it! And leave all thoughts of taking my money for yourself.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_26 " );	// Now let's talk about your fee. I think five hundred gold coins will be enough.
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_27 " );	// Money doesn't interest me.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_30 " );	// Then what do you want?
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_31 " );	// I need you, in turn, to write a letter to Larius, the head of the city.
	AI_Output(other,self, " DIA_Gerbrandt_WorksFor_Think_01_33 " );	// In it, you must speak well of one person - Gallahad.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_36 " );	// Gallahad? Yes, I know him well. I won’t say that we were friends with him, but it’s hard to call us enemies either.
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_37 " );	// (thoughtfully) So he needs my help. Apparently, he wants to restore his former position in the city...
	AI_Output(self,other, " DIA_Gerbrandt_WorksFor_Think_01_40 " );	// Good! Do everything that I have instructed you to do, and you will receive the letter of recommendation you need.
	MIS_GERBRANDT_MEETINTAVERNE_DAY = Wld_GetDay();
	MIS_GERBRANDTHELP = LOG_Running;
	Log_CreateTopic(TOPIC_GERBRANDTHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_Running);
	B_LogEntry( TOPIC_GERBRANDTHELP , " Gerbrandt will write a letter of recommendation for Gallahad if I do a little business for him. I need to meet a certain person. money. " );
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_WORKSFORDONE(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_worksfordone_condition;
	information = dia_gerbrandt_worksfordone_info;
	permanent = FALSE;
	description = " About the meeting... " ;
};


func int dia_gerbrandt_worksfordone_condition()
{
	if((MIS_GERBRANDTHELP == LOG_Running) && (MIS_DiegosResidence != LOG_SUCCESS) && ((MEETCHIEFKILLERS == TRUE) || (MEETCHIEFKILLERSLAIT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_worksfordone_info()
{
	AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_00 " );	// Regarding the meeting...
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_01");	//Да?
	if(MEETCHIEFKILLERSLAIT == TRUE)
	{
		AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_02 " );	// Sorry, I missed it.
		AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_03 " );	// (angrily) WHAT?! Worthless idiot! And how could I entrust this matter to you! ..
		AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_07 " );	// I hope you still have my money and letter with you?
		if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
		{
			if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
			{
				AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_08 " );	// Yes, here they are.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_09 " );	// Come here!
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_10 " );	// At least you were smart enough to bring them back to me.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_13 " );	// And now get out of my sight, you bastard!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_14 " );	// Get out!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_15 " );	// Yes, here they are.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_16 " );	// Come here!
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_17 " );	// At least you were smart enough to bring them back to me. (fading face) Wait...
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_18 " );	// Did you read my letter?!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_20 " );	// Oh you bastard!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_21 " );	// I think I warned you not to do this.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_22 " );	// Now you will regret it bitterly!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
		{
			if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
			{
				AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_23 " );	// I only have a letter left. Here, take it.
				B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_24 " );	// WHAT?! Where is my wallet?
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_26 " );	// Oh you bastard!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_27 " );	// So you thought you could easily take what belongs to me?!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_28 " );	// Now I'll show you what happens to those who steal from me!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			}
			else
			{
				AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_29 " );	// I only have a letter left. Here, take it.
				B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_30 " );	// WHAT?! Where's my wallet?!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_32 " );	// Oh you bastard!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_33 " );	// So you thought you could easily take what belongs to me?!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_34 " );	// Wait... (darkens) Have you read my letter yet?
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_36 " );	// I think I warned you not to do this.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_37 " );	// Now you will regret it bitterly!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
		{
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_38 " );	// I only have money left. Here, take them.
			B_GiveInvItems(other,self,itse_gerbrandpocket,1);
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_39 " );	// WHAT?! Where is my letter?
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_41 " );	// Oh you bastard!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_42 " );	// So you thought you could easily take what belongs to me?!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_43 " );	// No matter how! Now I'll show you what it means to steal from me!
			MIS_GERBRANDTHELP = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			GERBRANDTPISSOFF = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_ReactToWeapon,0);
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
		{
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_44 " );	// I don't have them.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_45 " );	// WHAT?! Oh you bastard!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_46 " );	// So you thought you could easily take what belongs to me?!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_47 " );	// No matter how! Now I'll show you what it means to steal from me!
			MIS_GERBRANDTHELP = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			GERBRANDTPISSOFF = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_ReactToWeapon,0);
		};
	};
	if(MEETCHIEFKILLERS == TRUE)
	{
		if(MEETCHIEFKILLERSMISSTIME == TRUE)
		{
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_48 " );	// I met with the one you asked for.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_49 " );	// And how was the meeting? Did you give him my letter and purse?
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_50 " );	// Unfortunately not. I didn't have them with me.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_52 " );	// WHAT?! What you said?!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_53 " );	// Worthless idiot! What have you done? You screwed up the whole thing!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_54 " );	// (besides himself) And how could I entrust it to you?!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_59 " );	// I hope you still have my money and letter with you?
			if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
			{
				if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
				{
					AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_60 " );	// Yes, here they are.
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_61 " );	// Come here!
					B_GiveInvItems(other,self,itse_gerbrandpocket,1);
					B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_62 " );	// At least you were smart enough to bring them back to me!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_65 " );	// And now get out of my sight, you bastard!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_66 " );	// Get out!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
				}
				else
				{
					AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_67 " );	// Yes, here they are.
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_68 " );	// Come here!
					B_GiveInvItems(other,self,itse_gerbrandpocket,1);
					B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_69 " );	// At least you were smart enough to bring them back to me! (fading face) Wait...
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_70 " );	// Did you read my letter?!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_72 " );	// Oh you bastard!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_73 " );	// I think I warned you not to do this.
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_74 " );	// Now you will regret it bitterly!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				};
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
			{
				if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
				{
					AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_75 " );	// I only have a letter left. Here, take it.
					B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_76 " );	// WHAT?! Where's my wallet?!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_78 " );	// Oh you bastard!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_79 " );	// So you thought you could easily take what belongs to me?!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_80 " );	// No matter how! Now I'll show you what happens to those who steal from me!
					MIS_GERBRANDTHELP = LOG_FAILED;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					GERBRANDTPISSOFF = TRUE;
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				}
				else
				{
					AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_81 " );	// I only have a letter left. Here, take it.
					B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_82 " );	// WHAT?! Where's my wallet?!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_84 " );	// Oh you bastard!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_85 " );	// So you thought you could easily take what belongs to me?!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_86 " );	// Wait... (face darkens) Have you even read my letter?!
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_88 " );	// I think I warned you not to do this.
					AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_89 " );	// Now you will regret it bitterly!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				};
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
			{
				AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_90 " );	// I only have money left. Here, take them.
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_91 " );	// WHAT?! Where is my letter?
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_93 " );	// Oh you bastard!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_94 " );	// So you thought you could easily take what belongs to me?!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_95 " );	// No matter how! Now I'll show you what it means to steal from me!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
			{
				AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_01_96 " );	// I don't have them.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_97 " );	// WHAT?! Oh you bastard!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_98 " );	// So you thought you could easily take what belongs to me?!
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_01_99 " );	// No matter how! Now I'll show you what it means to steal from me!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == TRUE) && (MEETCHIEFKILLERSTELLSGER == FALSE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_02_00 " );	// I met with the one you asked for.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_01 " );	// And how was the meeting? Did you give him my letter and purse?
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_02_02 " );	// Yes, I gave him everything you asked for.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_03 " );	// Great! I had some problems?
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_02_06 " );	// He seems to have figured out that I'm a figurehead. I failed to deceive him.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_08 " );	// WHAT?! You're an idiot!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_09 " );	// I hope you didn't say my name?!
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_02_10 " );	// Don't worry! He did not know this.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_11 " );	// (relieved) Well, at least you had enough sense for that!
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_02_14 " );	// What about a letter for Gallahad?
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_15");	//Хммм...(задумался)
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_16 " );	// Okay, so be it. You will get it.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_17 " );	// At least for the fact that you still know how to keep your mouth shut.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_18 " );	// Here, take it - it's here.
			B_GiveInvItems(self,other,itwr_gerbrantletter,1);
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_19 " );	// But for the future, you'll never get another job from me!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_02_21 " );	// Now get out!
			MIS_GERBRANDTHELP = LOG_SUCCESS;
			GERBRANDTPISSOFF = TRUE;
			Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
			B_LogEntry( TOPIC_GERBRANDTHELP , " Gerbrandt was beside himself with the fact that I had failed to complete part of the task assigned to me. Although he was somewhat relieved by the fact that his name remained a mystery to the man in the tavern. Reluctantly, he gave me a letter of introduction for Gallahad. " );
			AI_StopProcessInfos(self);
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == TRUE) && (MEETCHIEFKILLERSTELLSGER == TRUE))
		{
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_03_00 " );	// I met with the one you asked for.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_01 " );	// And how was the meeting? Did you give him my letter and purse?
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_03_02 " );	// Yes, I gave him everything you asked for.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_03 " );	// Great! I had some problems?
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_03_06 " );	// He seems to have figured out that I'm a figurehead. I failed to deceive him.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_08 " );	// WHAT?! You're an idiot!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_09 " );	// I hope you didn't say my name?!
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_03_10 " );	// Sorry, but he made me say it.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_12 " );	// WHAT?! (face darkens) You nailed me! Oh Innos!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_13 " );	// Worthless idiot! (panicked) What have you done?! Oh Innos.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_14 " );	// And how could I entrust this task to you?!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_15 " );	// I should have found someone else - and what was I thinking?
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_03_18 " );	// What about a letter for Gallahad?
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_19 " );	// (angrily) WHAT?! And you still have the audacity to ask me about it?!
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_03_20 " );	// Get out of my sight, you bastard!
			MIS_GERBRANDTHELP = LOG_FAILED;
			GERBRANDTPISSOFF = TRUE;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			AI_StopProcessInfos(self);
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == FALSE) && (MEETCHIEFKILLERSTELLSGER == FALSE))
		{
			B_GivePlayerXP(200);
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_04_01 " );	// I met with the one you asked for.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_04_02 " );	// And how was the meeting? Did you give him my letter and purse?
			AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_04_03_01 " );	// Yes, I gave them to him.
			AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_04_03 " );	// Great! I had some problems?
			if(MEETCHIEFKILLERSDANGER == TRUE)
			{
				Info_ClearChoices(dia_gerbrandt_worksfordone);
				Info_AddChoice(dia_gerbrandt_worksfordone, " Unfortunately yes. " ,dia_gerbrandt_worksfordone_ok);
			}
			else
			{
				AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_04_05 " );	// None! Everything went like clockwork.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_04_06 " );	// You're great! I knew that I could rely on you in this difficult matter.
				AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_04_08 " );	// What about a letter for Gallahad?
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_04_09 " );	// Oh yes, of course. I already wrote it, as we agreed.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_04_10 " );	// Here, take this.
				B_GiveInvItems(self,other,itwr_gerbrantletter,1);
				B_UseItem(other,itwr_gerbrantletter);
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_04_13 " );	// Yes, and I want to say one more thing...
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_04_14 " );	// If you suddenly need a job again - then you can always feel free to contact me.
				AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_04_15 " );	// After all, people like you are worth their weight in gold in our time.
				MIS_GERBRANDTHELP = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
				B_LogEntry( TOPIC_GERBRANDTHELP , " Gerbrandt was pleased with the way I handled his assignment. He gave me a letter of recommendation for Gallahad and also added that he would be happy to use my services again if such a case presented itself. " );

				if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (CHIEFKILLERISDEAD == FALSE) && (STARTKILLERWAY == FALSE) && (STARTKILLERWAY_ANDRE == FALSE))
				{
					STARTKILLERWAY = TRUE;
				};

				AI_StopProcessInfos(self);
			};
		};
	};
};

func void dia_gerbrandt_worksfordone_ok()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 500;
	AI_NoticePrint(3000,4098,NAME_ADDON_BRAVEBONUS);
	BRAVEBONUS = TRUE;
	AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_Ok_04_00 " );	// Unfortunately, yes.
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_01 " );	// (alarmed) What?
	AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_Ok_04_02 " );	// He seems to have figured out that I'm a figurehead. I failed to deceive him.
	AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_Ok_04_03 " );	// He even threatened me with death to tell me your name.
	AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_Ok_04_04 " );	// But, in the end, we managed to agree.
	AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_Ok_04_06 " );	// So don't worry.
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_07 " );	// Hmmm... (grabbing his heart) You... you even surprised me!
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_08 " );	// If everything you said is true, then I really have nothing to worry about.
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_09 " );	// Ha! Well done! I knew that I could rely on you in this difficult matter.
	AI_Output(other,self, " DIA_Gerbrandt_WorksForDone_Ok_04_11 " );	// What about a letter for Gallahad?
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_12 " );	// Oh yes, of course. I already wrote it, as we agreed.
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_13 " );	// Here, take it - it's yours.
	B_GiveInvItems(self,other,itwr_gerbrantletter,1);
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_16 " );	// Yes, and I want to say one more thing...
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_17 " );	// If you suddenly need a job again, then you can always feel free to contact me.
	AI_Output(self,other, " DIA_Gerbrandt_WorksForDone_Ok_04_18 " );	// After all, people like you are worth their weight in gold in our time.
	MIS_GERBRANDTHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
	B_LogEntry( TOPIC_GERBRANDTHELP , " Gerbrandt was pleased with the way I handled his task. He was especially surprised that I made a good impression on the man in the tavern. He handed me a letter of introduction for Gallahad and also added that he would be happy to use my services again, if such a case presents itself. " );

	if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (CHIEFKILLERISDEAD == FALSE) && (STARTKILLERWAY == FALSE) && (STARTKILLERWAY_ANDRE == FALSE))
	{
		STARTKILLERWAY = TRUE;
	};

	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_HEARKILL(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_hearkill_condition;
	information = dia_gerbrandt_hearkill_info;
	permanent = FALSE;
	description = " Who was the man I met at the tavern? " ;
};


func int dia_gerbrandt_hearkill_condition()
{
	if((STARTKILLERWAY == TRUE) && (MEETSTIDGERBRANT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_hearkill_info()
{
	AI_Output(other,self, " DIA_Gerbrandt_HearKill_01_00 " );	// And who was this person I met in the tavern?
	AI_Output(self,other, " DIA_Gerbrandt_HearKill_01_01 " );	// Trust me, you're better off not knowing.
	AI_Output(self,other, " DIA_Gerbrandt_HearKill_01_03 " );	// I don't understand why you're so interested in him?
	AI_Output(other,self, " DIA_Gerbrandt_HearKill_01_04 " );	// Can you tell me?
	AI_Output(self,other, " DIA_Gerbrandt_HearKill_01_05 " );	// Heh... (clearly nervous) Okay! But don't tell anyone about it. Understood?!
	AI_Output(self,other, " DIA_Gerbrandt_HearKill_01_07 " );	// Basically...
	AI_Standup(self);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Gerbrandt_HearKill_01_08 " );	// If you want to meet this person again, stay up tonight - walk uptown until midnight. Maybe you will meet him.
	ASMALCANAPPEAR = TRUE;
	AsmalDayMeet = Wld_GetDay();
	AI_StopProcessInfos(self);
};
