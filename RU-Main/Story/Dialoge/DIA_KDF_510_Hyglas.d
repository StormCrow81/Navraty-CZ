
instance DIA_Hyglas_Kap1_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap1_EXIT_Condition()
{
	if (chapter <=  1 )
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Feuer (C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Feuer_Condition;
	information = DIA_Hyglas_Feuer_Info;
	permanent = FALSE;
	description = " I need to pass the Trial by Fire. " ;
};


func int DIA_Hyglas_Feuer_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Feuer_Info()
{
	AI_Output(other,self, " DIA_Hyglas_Feuer_15_00 " );	// I need to pass the Trial by Fire.
	AI_Output(self,other, " DIA_Hyglas_Feuer_14_01 " );	// Trial by Fire is a rite from ancient times, it has not been performed for a long time.
	AI_Output(self,other, " DIA_Hyglas_Feuer_14_02 " );	// What you require is very dangerous. Don't even think about it.
};


instance DIA_Hyglas_Hallo(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Hallo_Condition;
	information = DIA_Hyglas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hyglas_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Hallo_Info()
{
	AI_Output(self,other, " DIA_Hyglas_Hallo_14_00 " );	// I am Master Higlas, Guardian of Fire and Loremaster.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other, " DIA_Hyglas_Hallo_14_01 " );	// So, Master Parlan gave you permission to study the sacred books.
		AI_Output(self,other, " DIA_Hyglas_Hallo_14_02 " );	// Then take them and study them. Perhaps you will find enlightenment in these scriptures.
	};
};


instance DIA_Hyglas_JOB(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_JOB_Condition;
	information = DIA_Hyglas_JOB_Info;
	permanent = FALSE;
	description = " What are you studying, Master? " ;
};


func int DIA_Hyglas_JOB_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_JOB_Info()
{
	AI_Output(other,self, " DIA_Hyglas_JOB_15_00 " );	// What are you studying, Master?
	AI_Output(self,other, " DIA_Hyglas_JOB_14_01 " );	// I devoted myself to the study of fire - the power of Innos.
	AI_Output(self,other, " DIA_Hyglas_JOB_14_02 " );	// This is his gift, and at the same time a powerful weapon. I create runes containing a particle of his power.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self, " DIA_Hyglas_JOB_15_03 " );	// How interesting! Could you teach me that too?
		AI_Output(self,other, " DIA_Hyglas_JOB_14_04 " );	// Magic is bestowed by Innos. And only his servants, the Mages of Fire, are given to know how to use this power.
	};
};


instance DIA_Hyglas_CONTEST(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_CONTEST_Condition;
	information = DIA_Hyglas_CONTEST_Info;
	permanent = FALSE;
	description = " I requested a Trial by Fire. " ;
};


func int DIA_Hyglas_CONTEST_Condition()
{
	if(MIS_RUNE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_CONTEST_Info()
{
	AI_Output(other,self, " DIA_Hyglas_CONTEST_15_00 " );	// I must pass the Trial by Fire. Ulthar gave me the task of creating a firebolt rune.
	AI_Output(self,other, " DIA_Hyglas_CONTEST_14_01 " );	// And you want me to teach you this?
	AI_Output(other,self, " DIA_Hyglas_CONTEST_15_02 " );	// I don't know of any other way to do this task.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Хмм...
	AI_Output(self,other, " DIA_Hyglas_CONTEST_14_04 " );	// Okay, I'll teach you. But first you must find all the necessary ingredients.
	B_LogEntry(TOPIC_Rune, " Higlas is ready to teach me how to make the Firebolt rune if I bring him all the ingredients he needs. " );
};


instance DIA_Hyglas_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_FIREBOLT_Condition;
	information = DIA_Hyglas_FIREBOLT_Info;
	permanent = FALSE;
	description = " What ingredients do you need to craft a Firebolt Rune? " ;
};


func int DIA_Hyglas_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (MIS_RUNE == LOG_Running) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_FIREBOLT_Info()
{
	AI_Output(other,self, " DIA_Hyglas_FIREBOLT_15_00 " );	// What ingredients are needed to create a firebolt rune?
	AI_Output(self,other, " DIA_Hyglas_FIREBOLT_14_01 " );	// Read about it - you will find this information here in the books.
};


instance DIA_Hyglas_TALENT_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 990;
	condition = DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information = DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent = TRUE;
	description = " Teach me how to make a FIRE ARROW rune. " ;
};


func int DIA_Hyglas_TALENT_FIREBOLT_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && ( PLAYER_TALENT_RUNES [SPL_Firebolt] ==  ​​FALSE ) && (Npc_HasItems(other,ItSc_Firebolt) >=  1 ) && (Npc_HasItems(other,ItSc_Firebolt) >= 1 ) && (Npc_HasItems(other,ItSc_Firebolt) >= 1 ) && (Npc_HasItems(other,ItSc_Firebolt) >= 1 ) && ( Npc_HasItems(other,ItSc_Firebolt) >=  1 ) && >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TALENT_FIREBOLT_Info()
{
	AI_Output(other,self, " DIA_Hyglas_TALENT_FIREBOLT_15_00 " );	// Teach me how to make a FIRE ARROW rune.

	if(B_TeachPlayerTalentRunes(self,other,SPL_Firebolt))
	{
		AI_Output(self,other, " DIA_Hyglas_TALENT_FIREBOLT_14_01 " );	// To create a firebolt rune, you must combine brimstone with a runestone on the rune table.
		AI_Output(self,other, " DIA_Hyglas_TALENT_FIREBOLT_14_02 " );	// The power of the firebolt scroll will flow into this rune, and you will become the owner of the weapon of Innos.
		AI_Output(self,other, " DIA_Hyglas_TALENT_FIREBOLT_14_03 " );	// When you have everything you need, go to the rune table and craft your rune.
	};
};


instance DIA_Hyglas_BLANK_RUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_BLANK_RUNE_Condition;
	information = DIA_Hyglas_BLANK_RUNE_Info;
	permanent = FALSE;
	description = " Where can I find a runestone? " ;
};


func int DIA_Hyglas_BLANK_RUNE_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Hyglas_FIREBOLT ) && ( MY_RUNE  == LOG_Running ) && ( Npc_HasItems ( other , ItMy_Rune Blank ) <  1 ) && ( PLAYER_TALENT_RUNES [ SPL_Firebolt ] ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BLANK_RUNE_Info()
{
	AI_Output(other,self, " DIA_Hyglas_BLANK_RUNE_15_00 " );	// Where can I find a runestone?
	AI_Output(self,other, " DIA_Hyglas_BLANK_RUNE_14_01 " );	// Look, YOU need to pass the Trial by Fire - not me. The quest is included in this test.
};


instance DIA_Hyglas_GOTRUNE (C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_GOTRUNE_Condition;
	information = DIA_Hyglas_GOTRUNE_Info;
	permanent = FALSE;
	description = " I created a rune. " ;
};


func int DIA_Hyglas_GOTRUNE_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Ulthar_SUCCESS) ==  FALSE ) && (Npc_HasItems(hero, ItRu_FireBolt) >=  1 ) && (other.guild ==  GIL_KDF )) ;
	{
		return TRUE;
	};
};

func void DIA_Hyglas_GOTRUNE_Info()
{
	AI_Output(other,self, " DIA_Hyglas_GOTRUNE_15_00 " );	// I created a rune.
	AI_Output(self,other, " DIA_Hyglas_GOTRUNE_14_01 " );	// Okay, okay. I think you passed this test. However, it was not so difficult.
	AI_Output(self,other, " DIA_Hyglas_GOTRUNE_14_02 " );	// Now go to Ulthar and show him the fruits of your labor.
	B_LogEntry(TOPIC_Rune, " I succeeded in creating a Firebolt rune. " );
};


instance DIA_Hyglas_Kap2_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap3_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_BringBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent = FALSE;
	description = " Any news? " ;
};


func int DIA_Hyglas_BringBook_Condition()
{
	if ((Chapter >=  3 ) && (hero.guild !=  GIL_SLD ) && (hero.guild !=  GIL_DJG ))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BringBook_Info()
{
	AI_Output(other,self, " DIA_Hyglas_BringBook_15_00 " );	// Any news?
	AI_Output(self,other, " DIA_Hyglas_BringBook_14_01 " );	// Hmm, yes. Well, you probably noticed these figures in black robes.
	AI_Output(other,self, " DIA_Hyglas_BringBook_15_02 " );	// I met them.
	AI_Output(self,other, " DIA_Hyglas_BringBook_14_03 " );	// Here! And now let's get to the heart of the matter. We are currently seeing a very rare constellation.
	AI_Output(self,other, " DIA_Hyglas_BringBook_14_04 " );	// To be more precise, the Bull constellation is now in direct relationship with the Warrior constellation. I assume you know what that means.
	AI_Output(other,self, " DIA_Hyglas_BringBook_15_05 " );	// Hmm. Well, to be honest...
	AI_Output(self,other, " DIA_Hyglas_BringBook_14_06 " );	// Yes, okay, I understand. Well, I can't explain all the details to you right now, but this certainly portends great changes. And I don't like change.
	AI_Output(self,other, " DIA_Hyglas_BringBook_14_07 " );	// That's why I want you to bring me a book from the city. It is called 'Divine Power of the Stars'. You may have to look for her, but I'm sure you can handle it.
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Info_AddChoice(DIA_Hyglas_BringBook, " Get this book yourself. " ,DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice(DIA_Hyglas_BringBook, " What will happen to me? " ,DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice(DIA_Hyglas_BringBook, " I'll try to find her. " ,DIA_Hyglas_BringBook_Yes);
};

func void DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output(other,self, " DIA_Hyglas_BringBook_GetItYourself_15_00 " );	// Get this book yourself.
	AI_Output(self,other, " DIA_Hyglas_BringBook_GetItYourself_14_01 " );	// How dare you talk to me like that?! Your behavior is unacceptable, you must show respect to me!
	AI_Output(self,other, " DIA_Hyglas_BringBook_GetItYourself_14_02 " );	// Get out of my sight and think about your behavior.
	MIS_HyglasBringBook = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output(other,self, " DIA_Hyglas_BringBook_GetForIt_15_00 " );	// And what do I get for it?
	AI_Output(self,other, " DIA_Hyglas_BringBook_GetForIt_14_01 " );	// What do you mean?
	AI_Output(other,self, " DIA_Hyglas_BringBook_GetForIt_15_02 " );	// I would like to know what you will give me if I bring this book.
	AI_Output(self,other, " DIA_Hyglas_BringBook_GetForIt_14_03 " );	// Nothing. What did you expect to get? If you have time to complete a task for me in the city, it is your duty to help me.
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_Yes()
{
	AI_Output(other,self, " DIA_Hyglas_BringBook_Yes_15_00 " );	// I'll try to find it.
	AI_Output(self,other, " DIA_Hyglas_BringBook_Yes_14_01 " );	// Good - this will save me time so I can get on with other things.
	AI_Output(self,other, " DIA_Hyglas_BringBook_Yes_14_02 " );	// But don't spend too much time on this. I'm afraid we don't have much time.
	MIS_HyglasBringBook = LOG_Running;
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Log_CreateTopic(TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HyglasBringBook,LOG_Running);
	B_LogEntry(TOPIC_HyglasBringBook, " Hyglas wants me to bring him the book 'Divine Power of the Stars'. One of the vendors in town might have it. " );
};


instance DIA_Hyglas_HaveBook (C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent = FALSE;
	description = " I brought you a book. " ;
};


func int DIA_Hyglas_HaveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook) && (Npc_HasItems(other,ItWr_Astronomy_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_HaveBook_Info()
{
	AI_Output(other,self, " DIA_Hyglas_HaveBook_15_00 " );	// I brought you a book.

	if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other, " DIA_Hyglas_HaveBook_14_01 " );	// Very good, give it here.
	}
	else
	{
		AI_Output(self,other, " DIA_Hyglas_HaveBook_14_02 " );	// You still changed your mind. Very well. So where is this book?
	};
	B_GiveInvItems(other,self,ItWr_Astronomy_Mis,1);
	MIS_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP(XP_HyglasBringBook);
	AI_Output(self,other, " DIA_Hyglas_HaveBook_14_03 " );	// Now you can leave. And I have to retire and study it.
};


instance DIA_Hyglas_Kap4_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap4_PERM(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 49;
	condition = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent = TRUE;
	description = " Have you found anything yet? " ;
};


func int DIA_Hyglas_Kap4_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output(other,self, " DIA_Hyglas_Kap4_PERM_15_00 " );	// Haven't found anything yet?
	if(MIS_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Hyglas_Kap4_PERM_14_01 " );	// Well, I'm not entirely sure, but the current alignment of the stars seems to pose a lot of danger.
		AI_Output(other,self, " DIA_Hyglas_Kap4_PERM_15_02 " );	// What kind of danger?
		AI_Output(self,other, " DIA_Hyglas_Kap4_PERM_14_03 " );	// Well, matter between worlds seems to be very weak. It only takes a small fraction of the force that would be required in normal times to break a hole in this matter.
		AI_Output(self,other, " DIA_Hyglas_Kap4_PERM_14_04 " );	// Demons can use these portals to enter our world unopposed.
		Hyglas_SendsToKarras = TRUE ;
	}
	else if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other, " DIA_Hyglas_Kap4_PERM_14_05 " );	// No, I'm still waiting for this book.
	}
	else
	{
		AI_Output(self,other, " DIA_Hyglas_Kap4_PERM_14_06 " );	// I told you that I still continue my research, but it will certainly take more time if I do not have the necessary materials.
	};
};


instance DIA_Hyglas_Kap5_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap5_EXIT_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_PICKPOCKET(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 900;
	condition = DIA_Hyglas_PICKPOCKET_Condition;
	information = DIA_Hyglas_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Hyglas_PICKPOCKET_Condition()
{
	return  C_Robbery ( 73 , 200 );
};

func void DIA_Hyglas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,Dialog_Back,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 90)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,50);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};


instance DIA_HYGLAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 1;
	condition = dia_hyglas_runemagicnotwork_condition;
	information = dia_hyglas_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_hyglas_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Hyglas_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Hyglas_RuneMagicNotWork_01_01 " );	// I thought the library was deforming me, but no - my runes really don't work.
	AI_Output(other,self, " DIA_Hyglas_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_Hyglas_RuneMagicNotWork_01_03 " );	// Everyone does. Looking at the others, I realized that it was not a bewildered form.
	AI_Output(other,self, " DIA_Hyglas_RuneMagicNotWork_01_04 " );	// Got it.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_HIGLAS_TEACHBLROBS(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 1;
	condition = dia_higlas_teachblrobs_condition;
	information = dia_higlas_teachblrobs_info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};

func int dia_higlas_teachblrobs_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_higlas_teachblrobs_info()
{
	AI_Output(other,self, " DIA_higlas_TeachBlRobs_01_01 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_higlas_TeachBlRobs_01_02 " );	// If you mean magic, then no, acolyte. It's too early for you to think about it.
};
Footer
