

instance DIA_Bosper_EXIT(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 999;
	condition = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bosper_EXIT_Info()
{
	Value_Arrow = 5 ;
	Value_Bolzen = 10 ;
	AI_StopProcessInfos(self);
};

var int FirstTalkBosper;

instance DIA_Bosper_NoTalkAtAll (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_NoTalkAtAll_Condition;
	information = DIA_Bosper_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Bosper_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_NoTalkAtAll_Info()
{
	if(FirstTalkBosper == FALSE)
	{
		AI_Output(self,other, " DIA_Bosper_NoTalkAtAll_12_00 " );	// What do you want here, huh?
		AI_Output(self,other, " DIA_Bosper_NoTalkAtAll_12_01 " );	// You have nothing to do here. Get out of here!
		FirstTalkBosper = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_NoTalkAtAll_12_03 " );	// I said get out!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Bosper_HELLO (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_HELLO_Condition;
	information = DIA_Bosper_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bosper_HELLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_HELLO_Info()
{
	if (Wld_IsTime( 14 , 0 , 16 , 0 ) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Bosper_HALLO_11_00 " );	// Welcome to my shop, outlander!
	};

	AI_Output(self,other, " DIA_Bosper_HALLO_11_01 " );	// I'm Bosper! I make bows and sell skins.
	AI_Output(self,other, " DIA_Bosper_HALLO_11_02 " );	// What brings you to Khorinis?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Bosper makes bows and sells skins. His shop is at the east gate, in the lower part of the city. " );
};


instance DIA_Bosper_IntoOV (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent = FALSE;
	description = " I need to get to the upper quarter... " ;
};


func int DIA_Bosper_IntoOV_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_IntoOV_Info()
{
	AI_Output(other,self, " DIA_Bosper_IntoOV_15_00 " );	// I need to get to the top quarter...
	AI_Output(self,other, " DIA_Bosper_IntoOV_11_01 " );	// Where do paladins live? Forget it.
	AI_Output(self,other, " DIA_Bosper_IntoOV_11_02 " );	// You need to be a respectable citizen, or at least have a decent job.
	AI_Output(self,other, " DIA_Bosper_IntoOV_11_03 " );	// And a stranger like you would never get there.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] ==  TRUE )
	{
		AI_Output(other,self, " DIA_Bosper_IntoOV_15_04 " );	// I noticed this...
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_Running);
	B_LogEntry( TOPIC_OV , " To get to the top quarter, I either have to become a respected citizen or get a job. " );
};


instance DIA_Bosper_SeekWork (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent = FALSE;
	description = " I'm looking for a job! " ;
};


func int DIA_Bosper_SeekWork_Condition()
{
	return TRUE;
};

func void DIA_Bosper_SeekWork_Info()
{
	AI_Output(other,self, " DIA_Bosper_SeekWork_15_00 " );	// I'm looking for a job!
	AI_Output(self,other, " DIA_Bosper_SeekWork_11_01 " );	// Mmm...(thoughtfully) I could use a new student.
	AI_Output(self,other, " DIA_Bosper_SeekWork_11_02 " );	// The last one I had quit my job a couple of days ago.
	AI_Output(self,other, " DIA_Bosper_SeekWork_11_03 " );	// You know anything about hunting, huh?

	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Нуууу...
		AI_Output(self,other, " DIA_Bosper_SeekWork_11_05 " );	// I could teach you how to skin animals.
		AI_Output(self,other, " DIA_Bosper_SeekWork_11_06 " );	// I'll pay you well for every skin you bring me.
	}
	else
	{
		AI_Output(other,self, " DIA_Bosper_SeekWork_15_07 " );	// I can give you some skins, if that's what you meant.
		AI_Output(self,other, " DIA_Bosper_SeekWork_11_08 " );	// Great! Bring me all the skins you can get - I will buy them from you at a very good price.
	};
	B_LogEntry(TOPIC_Lehrling, " Bosper is looking for a new student. I can start working for him. " );
};


var int Bosper_HintToJob;
var int Bosper_StartGuild;

instance DIA_Bosper_LEHRLING (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent = TRUE;
	description = " I want to be your student! " ;
};

func int DIA_Bosper_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEHRLING_Info()
{
	var int vote;
	vote = 0 ;
	AI_Output(other,self, " DIA_Bosper_LEHRLING_15_00 " );	// I want to be your student!
	if (MIS_Bosper_WolfFurs ==  LOG_SUCCESS )
	{
		AI_Output(self,other, " DIA_Bosper_LEHRLING_11_01 " );	// (grins) Great! It looks like you already know the basics.
		vote = vote +  1 ;
		if (Harad.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_02 " );	// Harad thinks you're a good person.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_03 " );	// But Harad isn't sure of your abilities yet.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Bosper_LEHRLING_11_04 " );	// But Harad says he never saw you.
		};
		if (Thorben.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_05 " );	// Torben gives you his blessing. I'm not as devout as he is, but it's still good.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_06 " );	// Torben will give you his approval only with the blessing of the gods.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Bosper_LEHRLING_11_07 " );	// Torben has no idea who you are.
		};
		if (Constantino.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_08 " );	// Constantino says you can become a student of whoever you want.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_09 " );	// Constantino says you're accused of a crime in the city - I hope this is some kind of nonsense?
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_10 " );	// Make sure this issue is resolved.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Bosper_LEHRLING_11_11 " );	// Constantino has never even heard of you.
		};
		if (Matteo.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_12 " );	// Matteo says you're worth as much as gold equal to your weight.
				vote = vote +  1 ;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_13 " );	// Matteo mentioned some debt - I don't know what he means, but you better talk to him.
			}
			else
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_14 " );	// Matteo says he hasn't talked to you about this yet.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Bosper_LEHRLING_11_15 " );	// Matteo says he never saw you.
		};
		if (vote >=  4 )
		{
			if (vote ==  5 )
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_16 " );	// This means that you have received the approval of all the masters!
			}
			else
			{
				AI_Output(self,other, " DIA_Bosper_LEHRLING_11_17 " );	// You have received the approval of the four masters. This is enough to be accepted as a student.
			};
			AI_Output(self,other, " DIA_Bosper_LEHRLING_11_18 " );	// You can start working for me whenever you want.
			Info_ClearChoices(DIA_Bosper_LEHRLING);
			Info_AddChoice(DIA_Bosper_LEHRLING, " Okay, I'll think about it. " ,DIA_Bosper_LEHRLING_Later);
			Info_AddChoice(DIA_Bosper_LEHRLING, " I'm ready to be your student. " ,DIA_Bosper_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other, " DIA_Bosper_LEHRLING_11_19 " );	// You need to get the approval of at least four masters. Without that, you won't be able to become a disciple in the lower part of the city.
			AI_Output(self,other, " DIA_Bosper_LEHRLING_11_20 " );	// This means you should talk to anyone who still doubts you.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_LEHRLING_11_21 " );	// Before I take you in, I first need to know if you're good for anything at all.
		if (MIS_Bosper_Bogen ==  LOG_SUCCESS )
		{
			AI_Output(self,other, " DIA_Bosper_LEHRLING_11_22 " );	// You got my bow back, but that says nothing about your talent as a hunter.
		};
		Bosper_HintToJob = TRUE ;
	};
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output(other,self, " DIA_Bosper_LEHRLING_OK_15_00 " );	// I'm ready to become your student.
	AI_Output(self,other, " DIA_Bosper_LEHRLING_OK_11_01 " );	// You won't regret it! I think we'll work.
	AI_Output(self,other, " DIA_Bosper_LEHRLING_OK_11_02 " );	// Oh yeah, I almost forgot. Here, take this armor! It will reliably protect you when you go hunting.
	B_GiveInvItems(self,other,ITAR_Leather_L,1);
	AI_Output(self,other, " DIA_Bosper_LEHRLING_OK_11_03 " );	// And this bow!
	B_GiveInvItems(self,other,itrw_bospbow_l_03,1);
	AI_Output(self,other, " DIA_Bosper_LEHRLING_OK_11_04 " );	// And so you can use it properly - I'll teach you a couple of new tricks.
	B_RaiseAttribute_Bonus_Many(other,ATR_DEXTERITY,5);
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_BOW,5);
	AI_Print( PRINT_BOSPERBONUS );
	Player_IsApprentice = APP_Bosper;
	Npc_ExchangeRoutine(Lothar,"START");
	Bosper_StartGuild = other.guild;
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_apprentice);
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus, " Bosper took me on as his apprentice. Now I have access to the uptown. " );
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output(other,self, " DIA_Bosper_LEHRLING_Later_15_00 " );	// Okay, I'll think about it.
	AI_Output(self,other, " DIA_Bosper_LEHRLING_Later_11_01 " );	// Watch out, don't make the wrong decision! You are the best fit for my job.
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

var int Bosper_LeatherBought;

instance DIA_Bosper_LEATHER (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 850;
	condition = DIA_Bosper_LEATHER_Condition;
	information = DIA_Bosper_LEATHER_Info;
	permanent = TRUE;
	description = " Buy heavy leather armor. (Price: 500 coins) " ;
};

func int DIA_Bosper_LEATHER_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && (Bosper_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEATHER_Info()
{
	AI_Output(other,self, " DIA_Bosper_LEATHER_01_00 " );	// Sell me some heavy leather armor.

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other, " DIA_Bosper_LEATHER_01_01 " );	// As you say! Here you are. You will like it!
		B_GiveInvItems(self,other,ITAR_Leather_M,1);
		Bosper_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_LEATHER_01_02 " );	// You don't have enough gold, mate.
	};
};

instance DIA_Bosper_OtherMasters (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent = FALSE;
	description = " What if I want to apprentice with another master? " ;
};

func int DIA_Bosper_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_OtherMasters_Info()
{
	AI_Output(other,self, " DIA_Bosper_OtherMasters_15_00 " );	// What if I want to be apprenticed to another master?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//Бред!
	AI_Output(self,other, " DIA_Bosper_OtherMasters_11_02 " );	// Harad and Matteo already have students.
	AI_Output(self,other, " DIA_Bosper_OtherMasters_11_03 " );	// Alchemist Constantino is a loner! He had not had an apprentice for many years.
	AI_Output(self,other, " DIA_Bosper_OtherMasters_11_04 " );	// As for Torben, everyone knows he's too poor. He probably won't even be able to pay you.
	AI_Output(self,other, " DIA_Bosper_OtherMasters_11_05 " );	// And here, for example, I really need a student. And I cry well.
	AI_Output(self,other, " DIA_Bosper_OtherMasters_11_06 " );	// But no matter whose apprentice you want to become, you'll need the approval of all the masters from the bottom of the city...
};

instance DIA_Bosper_Bartok (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent = FALSE;
	description = " Why did your student quit his job? " ;
};

func int DIA_Bosper_Bartok_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Bartok_Info()
{
	AI_Output(other,self, " DIA_Bosper_Bartok_15_00 " );	// Why did your student quit his job?
	AI_Output(self,other, " DIA_Bosper_Bartok_11_01 " );	// Like he said, hunting has become too dangerous lately.
	AI_Output(self,other, " DIA_Bosper_Bartok_11_02 " );	// If you're really interested, you can ask him about it yourself.
	AI_Output(self,other, " DIA_Bosper_Bartok_11_03 " );	// His name is Bartok. He's probably hanging around at Koragon's tavern somewhere.
	AI_Output(self,other, " DIA_Bosper_Bartok_11_04 " );	// Go through the underground passage at the forge and you'll be right in front of it.
};

instance DIA_Bosper_CONSENT (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_APPROVAL_Condition;
	information = DIA_Bosper_APPROVAL_Info;
	permanent = TRUE;
	description = " Will I get your approval to work with another master? " ;
};

func int DIA_Bosper_APPROVAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

var int Bosper_Consent_Once;

func void DIA_Bosper_CONSENT_Info()
{
	AI_Output(other,self, " DIA_Bosper_ZUSTIMMUNG_15_00 " );	// Will I get your approval to work with another master?
	if ((MIS_Bosper_Bogen ==  LOG_SUCCESS ) || (MIS_Bosper_WolfFurs ==  LOG_SUCCESS ))
	{
		AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_01 " );	// (disappointed) I was hoping you'd pick me.
		AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_02 " );	// But if you decide so...
		AI_Output(other,self, " DIA_Bosper_ZUSTIMMUNG_15_03 " );	// Does this mean you will vote for me?
		AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_04 " );	// If no other masters object, then yes.
		if (MIS_Bosper_Bogen ==  LOG_SUCCESS )
		{
			AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_05 " );	// You got my bow back after all.
		};
		if (MIS_Bosper_WolfFurs ==  LOG_SUCCESS )
		{
			AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_06 " );	// But you'd make such a good hunter!
		};
		if (Bosper_Approval_Once ==  FALSE )
		{
			B_GivePlayerXP(XP_Consent);
			Bosper_Agreement_Once = TRUE ;
			B_LogEntry(TOPIC_Lehrling, " Bosper will give his consent if I want to become an apprentice with another master. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_07 " );	// (sighs) Good! You will have my approval - but on one condition.
		AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_08 " );	// Work for me, at least for a little while.
		AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_09 " );	// This way you can see if you like my craft or not.
		AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_10 " );	// And who knows - maybe you'll like it so much that you'll stay with me.
		AI_Output(self,other, " DIA_Bosper_ZUSTIMMUNG_11_11 " );	// If you're good enough to be MY apprentice, then you'll be good enough for other masters as well.
		Bosper_HintToJob = TRUE ;
	};
};

instance DIA_Bosper_Job (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent = FALSE;
	description = " What do you want me to do for you? " ;
};

func int DIA_Bosper_Job_Condition()
{
	if (Bosper_HintToJob ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Bosper_Job_Info()
{
	AI_Output(other,self, " DIA_Bosper_Job_15_00 " );	// What do you want me to do for you?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other, " DIA_Bosper_Job_11_01 " );	// I'll teach you how to skin animals, and you'll bring me - say - half a dozen wolf skins.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher, " Bosper can teach me how to skin animals. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_Job_11_02 " );	// Bring me half a dozen wolf pelts.
	};
	AI_Output(self,other, " DIA_Bosper_Job_11_03 " );	// Then I will understand that you have mastered this craft.
	AI_Output(self,other, " DIA_Bosper_Job_11_04 " );	// Unless it takes you forever, and if the skins are in acceptable condition. And then I'll take you to me, if you want.
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters))
	{
		AI_Output(self,other, " DIA_Bosper_Job_11_05 " );	// Or (sighs) you can become another master's apprentice - if that's what you really want.
	};
	MIS_Bosper_WolfFurs = LOG_Running;
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperWolf,LOG_Running);
	B_LogEntry(TOPIC_BosperWolf, " I have to bring six wolf skins to Bosper. Then I can either work for him or get his approval to work with other masters. " );
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry(TOPIC_BosperWolf, " I should ask him to teach me how to skin animals. " );
	};
};


instance DIA_Bosper_BringFur (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 102;
	condition = DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent = TRUE;
	description = " About the wolf skins... " ;
};


func int DIA_Bosper_BringFur_Condition()
{
	if (MIS_Bosper_WolfFurs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BringFur_Info()
{
	AI_Output(other,self, " DIA_Bosper_BringFur_15_00 " );	// About wolf skins...

	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other, " DIA_Bosper_BringFur_11_01 " );	// You've already become another master's apprentice. I will buy skins from you at the regular price.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE ;
		return;
	};
	if(B_GiveInvItems(other,self,ItAt_WolfFur,6))
	{
		B_GivePlayerXP(XP_Bosper_Book);
		AI_Output(other,self, " DIA_Bosper_BringFur_15_02 " );	// I brought them - here.
		AI_Output(self,other, " DIA_Bosper_BringFur_11_03 " );	// Great! I knew you were right for the job.
		AI_Output(self,other, " DIA_Bosper_BringFur_11_04 " );	// Here's the money, as I promised you.
		B_GiveInvItems(self,other,ItMi_Gold,Value_WolfFur * 3);
		AI_Output(self,other, " DIA_Bosper_BringFur_11_05 " );	// And? What do you say? Isn't that better than poring over swords all day long or filling bottles in a dusty closet?
		MIS_Bosper_WolfFurs = LOG_SUCCESS ;
		B_LogEntry(TOPIC_Lehrling, " Bosper will accept me as an apprentice if the other masters don't mind. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_BringFur_11_06 " );	// We agreed on half a dozen - but you still have time. Go and get those skins.
	};
};

instance DIA_Bosper_TeachFUR (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent = TRUE;
	description = " Teach me how to skin animals. " ;
};

func int DIA_Bosper_TeachFUR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_TeachFUR_Info()
{
	AI_Output(other,self, " DIA_Bosper_TeachFUR_15_00 " );	// Teach me how to skin animals.
	Info_ClearChoices(DIA_Bosper_TeachFUR);
	Info_AddChoice(DIA_Bosper_TeachFUR,Dialog_Back,DIA_Bosper_TeachFUR_Back);
	Info_AddChoice(DIA_Bosper_TeachFUR,b_buildlearnstringforsmithhunt("Содрать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Bosper_TeachFUR_Fur);
};

func void DIA_Bosper_TeachFUR_Back()
{
	Info_ClearChoices(DIA_Bosper_TeachFUR);
};

func void DIA_Bosper_TeachFUR_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other, " DIA_Bosper_TeachFUR_11_01 " );	// Good! Listen. It's pretty simple.
		AI_Output(self,other, " DIA_Bosper_TeachFUR_11_02 " );	// You take a sharp knife and cut open the animal's belly. Then you make a few small incisions on the inside of the legs, and remove the skin.
	};

	Info_ClearChoices(DIA_Bosper_TeachFUR);
};

instance DIA_Bosper_Trade (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 700;
	condition = DIA_Bosper_Trade_Condition;
	information = DIA_Bosper_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};

func int DIA_Bosper_Trade_Condition()
{
	if ((MIS_Bosper_WolfFurs == LOG_Success) && (Wld_IsTime( 5 , 0 , 14 , 0 ) || Wld_IsTime( 16 , 0 , 23 , 0 )))
	{
		return TRUE;
	};
	if((Player_IsApprentice > APP_NONE) && (Wld_IsTime(5,0,14,0) || Wld_IsTime(16,0,23,0)))
	{
		return TRUE;
	};
};

var int bosperarrowsday;
var int bosperarrowssay;
var int BosperTradeLowBows;

func void DIA_Bosper_Trade_Info()
{
	where int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Bosper_Trade_15_00 " );	// Show me your products.

	daynow = Wld_GetDay();

	if ((Player_IsApprentice == APP_Bosper) && (BosperTradeBows ==  FALSE ) && (MIS_Bosper_Bogen ==  LOG_SUCCESS ))
	{
		AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_06 " );	// Because you helped me get my bow back, and my apprentice too...
		AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_07 " );	// ...then I can probably sell you not only bolts and arrows, but pretty good bows as well.
		AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_08 " );	// Of course, they cannot be called a work of art, but they are quite suitable for hunting.
		BosperTradeBows = TRUE ;
	};
	if ((BosperTradeBows ==  TRUE ) && (BosperTradeLowBows ==  FALSE ))
	{
		CreateInvItems(self,ItRw_Bow_L_01,1);
		CreateInvItems(self,ItRw_Bow_L_02,1);
		CreateInvItems(self,ItRw_Bow_L_03,1);
		CreateInvItems(self,ItRw_Bow_L_04,1);
		CreateInvItems(self,ItRw_Bow_M_01,1);
		CreateInvItems(self,ItRw_Bow_M_02,1);
		CreateInvItems(self,ItRw_Bow_M_03,1);
		CreateInvItems(self,ItRw_Bow_M_04,1);
		BosperTradeLowBows = TRUE ;
	};
	if ( BOSPERARROWSDAY  < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (BOSPERARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Chapter *  25 ) + ( 10  * (daynow -  BOSPERARROWSDAY  -  1 ));

			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};

			BOSPERARROWSDAY = daynow;
		};
	}
	else  if ( FOREST PERROWSSAY  ==  FALSE )
	{
		if((Npc_HasItems(self,ItRw_Bolt) == 0) && (Npc_HasItems(self,ItRw_Arrow) == 0))
		{
			AI_Output(self,other, " DIA_Bosper_Trade_11_03 " );	// Arrows and bolts are out - come back tomorrow.
		}
		else if(Npc_HasItems(self,ItRw_Bolt) == 0)
		{
			AI_Output(self,other, " DIA_Bosper_Trade_11_04 " );	// Bolts out - come back tomorrow.
		}
		else if(Npc_HasItems(self,ItRw_Arrow) == 0)
		{
			AI_Output(self,other, " DIA_Bosper_Trade_11_05 " );	// Arrows out - come back tomorrow.
		};

		AI_Output(self,other, " DIA_Bosper_Trade_11_06 " );	// New arrivals - only tomorrow by noon.
		FOREST PERROWSSAY = TRUE ;
	};

	B_GiveTradeInv(self);
};

instance DIA_Bosper_BogenRunning (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BogenRunning_Condition;
	information = DIA_Bosper_BogenRunning_Info;
	permanent = FALSE;
	description = " I heard something was stolen from you. " ;
};

func int DIA_Bosper_BogenRunning_Condition()
{
	if (MIS_Bosper_Bogen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenRunning_Info()
{
	AI_Output(other,self, " DIA_Bosper_BogenRunning_15_00 " );	// I heard something was stolen from you.
	AI_Output(self,other, " DIA_Bosper_BogenRunning_11_01 " );	// Who told you this? Probably Bartok, right? Did he have nothing more to say to you? Oh, okay.
	AI_Output(self,other, " DIA_Bosper_BogenRunning_11_02 " );	// But if I get to that bastard, no amount of prayer will help him!
	AI_Output(self,other, " DIA_Bosper_BogenRunning_11_03 " );	// I've been out of my shop for just a minute. And when I returned, I only saw how he was leaving - with my bow on his shoulder.
	AI_Output(self,other, " DIA_Bosper_BogenRunning_11_04 " );	// I immediately called the guards, but this bastard ran to the harbor. And they lost it there!
	AI_Output(self,other, " DIA_Bosper_BogenRunning_11_05 " );	// I unleashed all the dogs on them for this, and the guards searched the entire port area. But they didn't find anything.
	AI_Output(self,other, " DIA_Bosper_BogenRunning_11_06 " );	// Stupid!
	AI_Output(self,other, " DIA_Bosper_BogenRunning_11_07 " );	// I bet my bow is still somewhere in the city. I spoke to the guards at both city gates, but they did not see anyone leaving the city with a bow.
	AI_Output(self,other, " DIA_Bosper_BogenRunning_11_08 " );	// When I get to that bastard...
	Log_CreateTopic(TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperBogen,LOG_Running);
	B_LogEntry(TOPIC_BosperBogen, " Bosper's bow was stolen. The thief ran to the harbor and escaped there. The militia searched the waterfront, but they didn't find anything, although the bow should still be in town. " );
};

instance DIA_Bosper_BogenSuccess (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 6;
	condition = DIA_Bosper_BogenSuccess_Condition;
	information = DIA_Bosper_BogenSuccess_Info;
	permanent = FALSE;
	description = " I think this is your bow. " ;
};

func int DIA_Bosper_BogenSuccess_Condition()
{
	if ((MIS_Bosper_Book == LOG_Running) && (Npc_KnowsInfo(other,DIA_Bosper_BookRunning) ==  TRUE ) && (Npc_HasItems(other,ItRw_Bow_L_03_MIS) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenSuccess_Info()
{
	B_GivePlayerXP(XP_Bosper_Book);
	AI_Output(other,self, " DIA_Bosper_BogenSuccess_15_00 " );	// I think it's your bow.
	B_GiveInvItems(other,self,ItRw_Bow_L_03_MIS,1);
	Npc_RemoveInvItems(self,ItRw_Bow_L_03_MIS,1);
	AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_01 " );	// My bow! Where did you find it?
	AI_Output(other,self, " DIA_Bosper_BogenSuccess_15_02 " );	// In a dark hole full of rats.
	AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_03 " );	// I hope you don't get in trouble for this?
	AI_Output(other,self, " DIA_Bosper_BogenSuccess_15_04 " );	// No! I've had to do this before.
	AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_05 " );	// Hmmm... (approvingly) Thanks anyway. I owe you!
	MIS_Bosper_Bogen = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_BosperBogen, LOG_SUCCESS );
	B_LogEntry(TOPIC_BosperBogen, " I gave Bosper back his bow. " );

	if ((Player_IsApprentice == APP_Bosper) && (BosperTradeBows ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_06 " );	// Because you helped me get my bow back, and my apprentice too...
		AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_07 " );	// ...then I can probably sell you not only bolts and arrows, but pretty good bows as well.
		AI_Output(self,other, " DIA_Bosper_BogenSuccess_11_08 " );	// Of course, they cannot be called a work of art, but they are quite suitable for hunting.
		BosperTradeBows = TRUE ;
	};
};

instance DIA_Bosper_MakeBow (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_MakeBow_Condition;
	information = DIA_Bosper_MakeBow_Info;
	permanent = FALSE;
	description = " Where do you get your bows from? " ;
};

func int DIA_Bosper_MakeBow_Condition()
{
	if ((BosperTradeBows ==  TRUE ) && (Player_IsApprentice == APP_Bosper))
	{
		return TRUE;
	};
};

func void DIA_Bosper_MakeBow_Info()
{
	AI_Output(other,self, " DIA_Bosper_MakeBow_01_00 " );	// Where do you get your bows from?
	AI_Output(self,other, " DIA_Bosper_MakeBow_01_01 " );	// (surprised) How from where? I make them myself!
	AI_Output(self,other, " DIA_Bosper_MakeBow_01_02 " );	// Not much, though, since each of them takes quite a long time to produce.
	AI_Output(self,other, " DIA_Bosper_MakeBow_01_03 " );	// But it's worth it in the end! This activity is well worth it.
	AI_Output(other,self, " DIA_Bosper_MakeBow_01_04 " );	// Could you teach me this?
	AI_Output(self,other, " DIA_Bosper_MakeBow_01_05 " );	// (thoughtfully) Well, why not. After all, you are my student.
	AI_Output(self,other, " DIA_Bosper_MakeBow_01_06 " );	// True, for this you will need some experience, because the craft is quite difficult!
	AI_Output(self,other, " DIA_Bosper_MakeBow_01_07 " );	// Well, of course, I won’t take money from you for this.
	BosperTeachMakeBows = TRUE ;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows, " Bosper can teach me how to make bows. " );
};

instance DIA_Bosper_BOWTEACH1 (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BOWTEACH1_condition;
	information = DIA_Bosper_BOWTEACH1_info;
	permanent = TRUE;
	description = " Teach me how to make bows (Training Points: 1 LP) " ;
};

func int DIA_Bosper_BOWTEACH1_condition()
{
	if((BosperTeachMakeBows == TRUE) && (BowMake_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BOWTEACH1_info()
{
	AI_Output(other,self, " DIA_Bosper_BOWTEACH1_01_00 " );	// Teach me how to make bows.

	if(hero.lp >= 1)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_01 " );	// Good. Then let's start with the basics.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_02 " );	// The main thing you should know is that the bow has two fundamental components - the shaft and the bowstring.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_03 " );	// The better the quality of these ingredients, the better the bow you're going to make.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_04 " );	// Shafts use different types of wood, each with different combinations of flex and resilience.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_05 " );	// If you take an ordinary log and make a bow out of it, it will crack in half on the first shot.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_06 " );	// Therefore, you should carefully choose the material that will be used in production.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_07 " );	// Now about the string. Here, too, there are some nuances.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_08 " );	// Basically, the bowstring is made from the skins of animals - wolves, wild boars, obscurantists or wargs.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_09 " );	// This material allows the bowstring to maintain its tension properties in any weather.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_10 " );	// She will never get wet in the rain and will not harden in the bitter cold.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_11 " );	// True, for this it will also need to be treated with various lubricants like fat or resin.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_12 " );	// As for the production process itself, everything is simple.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_13 " );	// You take the piece of wood you need, the tongs, and carefully grind the shaft itself on the carpenter's workbench.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_14 " );	// Then you take a piece of the skin, a carving knife and cut it into thin pieces on the skinner.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_15 " );	// Then you process each of these pieces with fat or resin, intertwine and dry them.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_16 " );	// Actually, this is how the string is made. Well, after that, on the same workbench, you already collect the bow itself.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_17 " );	// Your first bows won't be a work of art, but if you practice long enough...
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_18 " );	// ...in general - everything will come with experience.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_19 " );	// Well, in the future, I can show you how to make even more durable and deadly bows.
		hero.lp = hero.lp - 1;
		BowMake_01 = TRUE;
		AI_Print( " Learned bow crafting recipe - 'Short wooden bow' " );
		; _ _ _ _
		B_LogEntry_Quiet(Topic_TalentMakeBows, " To create a bowstring I will need: a skinner, a carving knife, a piece of animal skin and a lubricant in the form of fat or resin. " );
		; _ _ _ _
		B_LogEntry_Quiet(Topic_TalentMakeBows, " To make a short wooden bow, I need a wolfskin string, a regular bow shaft, and resin. " );
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 1)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH1_01_22 " );	// You're not ready for this yet! Come back when you've gained experience.
		AI_StopProcessInfos(self);
	};
};

instances DIA_Bosper_WhereBowWood (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_WhereBowWood_Condition;
	information = DIA_Bosper_WhereBowWood_Info;
	permanent = FALSE;
	description = " Where can I get wood pieces? " ;
};

func int DIA_Bosper_WhereBowWood_Condition()
{
	if(BowMake_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_WhereBowWood_Info()
{
	AI_Output(other,self, " DIA_Bosper_WhereBowWood_01_00 " );	// Where can I get wood blanks?
	AI_Output(self,other, " DIA_Bosper_WhereBowWood_01_01 " );	// Talk to Torben about it. He probably has a lot of them.
	AI_Output(self,other, " DIA_Bosper_WhereBowWood_01_02 " );	// Maybe he'll sell you something.
	TorbenSellWood = TRUE ;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows, " Bosper told me to talk to Torben about the wood blanks. " );
};

instance DIA_Bosper_BosperBuyAllBows (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_BosperBuyAllBows_Condition;
	information = DIA_Bosper_BosperBuyAllBows_Info;
	permanent = FALSE;
	description = " What should I do with crafted bows? " ;
};

func int DIA_Bosper_BosperBuyAllBows_Condition()
{
	if(BowMake_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BosperBuyAllBows_Info()
{
	AI_Output(other,self, " DIA_Bosper_BosperBuyAllBows_01_00 " );	// What should I do with the crafted bows?
	AI_Output(self,other, " DIA_Bosper_BosperBuyAllBows_01_01 " );	// Well, if you want, you can sell them to the merchants in the square. True, they will give you mere pennies for them!
	AI_Output(self,other, " DIA_Bosper_BosperBuyAllBows_01_02 " );	// Better bring them to me. I'm sure we can come to an agreement.
	AI_Output(other,self, " DIA_Bosper_BosperBuyAllBows_01_03 " );	// I'll think about it.
	BosperBuyAllBows = TRUE ;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows, " Bosper will buy all the bows I make from me. " );
};

instance DIA_Bosper_SellBows (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 200;
	condition = DIA_Bosper_SellBows_Condition;
	information = DIA_Bosper_SellBows_Info;
	permanent = TRUE;
	description = " I want to sell crafted bows. " ;
};

func int DIA_Bosper_SellBows_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && (BosperBuyAllBows == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellBows_Info()
{
	var C_Item EquipWeap;
	var int number_common;
	var int number_eve;
	var int number_vyz;
	var int number_ysuo;
	var int number_bok;
	var int total;
	var int lohnbow;
	var string concatText;


	AI_Output(other,self, " DIA_Bosper_SellBows_15_00 " );	// I want to sell crafted bows.
	EquipWeap = Npc_GetEquippedRangedWeapon(other);

	number_common = Npc_HasItems(other,ItRw_BowCraft_01);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) == TRUE)
	{
		if (number_common >  1 )
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_01,anzahl_common);
		};
		number_common -=  1 ;
	};

	number_eve = Npc_HasItems(other,ItRw_BowCraft_02);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) == TRUE)
	{
		if (number_eve >  1 )
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_02,anzahl_eve);
		};
		number_eve = number_eve -  1 ;
	};

	number_vyz = Npc_HasItems(other,ItRw_BowCraft_03);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) == TRUE)
	{
		if (number_vyz >  1 )
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_03,anzahl_vyz);
		};
		number_vyz = number_vyz -  1 ;
	};

	number_ysuo = Npc_HasItems(other,ItRw_BowCraft_04);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) == TRUE)
	{
		if (number_ysuo >  1 )
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_04,number_ysuo);
		};
		number_ysuo = number_ysuo -  1 ;
	};

	number_bok = Npc_HasItems(other,ItRw_BowCraft_05);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) == TRUE)
	{
		if (number_bok >  1 )
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_05,number_bok);
		};
		number_bok = number_bok -  1 ;
	};

	total = number_common + number_eve + number_vyz + number_ysuo + number_bok;

	if (total ==  0 )
	{
		if((Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) == TRUE))
		{
			AI_Output(self,other, " DIA_Bosper_SellBows_12_01 " );	// But besides what's hanging on your back, I don't see any of your bows!
		}
		else
		{
			AI_Output(self,other, " DIA_Bosper_SellBows_12_04 " );	// So make them first!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_SellBows_12_02 " );	// Okay - come here.

		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_01,anzahl_common);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_02,anzahl_eve);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_03,anzahl_vyz);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_04,number_ysuo);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_05,number_bok);
		};

		concatText = b_formgivestring(other,gesamt);
		AI_Print(concatText);
		AI_Output(self,other, " DIA_Bosper_SellBows_12_03 " );	// Great! Here is your gold.
		wagebow = (number_common *  50 ) + (number_eve *  100 ) + (number_vyz *  200 ) + (number_ysuo *  300 ) + (number_bok *  500 );
		B_GiveInvItems(self,other,ItMi_Gold,lohnbow);
	};
};

instance DIA_Bosper_BOWTEACH_Other (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BOWTEACH_Other_condition;
	information = DIA_Bosper_BOWTEACH_Other_info;
	permanent = TRUE;
	description = " What other bows can I learn how to make from you? " ;
};

func int DIA_Bosper_BOWTEACH_Other_condition()
{
	if((BosperTeachMakeBows == TRUE) && (BowMake_01 == TRUE) && ((BowMake_02 == FALSE) || (BowMake_03 == FALSE) || (BowMake_04 == FALSE) || (BowMake_05 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BOWTEACH_Other_info()
{
	AI_Output(other,self, " DIA_Bosper_BOWTEACH_Other_01_00 " );	// What kind of bows can I still learn from you?
	AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_01_01 " );	// See for yourself...
	Info_ClearChoices(DIA_Bosper_BOWTEACH_Other);
	Info_AddChoice(DIA_Bosper_BOWTEACH_Other,Dialog_Back,DIA_Bosper_BOWTEACH_Other_Back);

	if((BowMake_01 == TRUE) && (BowMake_02 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Weidenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other, " Willow Bow (Training Points: 1) " ,DIA_Bosper_BOWTEACH_Other_Bow_01);
	};
	if((BowMake_02 == TRUE) && (BowMake_03 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Ulmenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other, " Elm Bow (Training Points: 2) " ,DIA_Bosper_BOWTEACH_Other_Bow_02);
	};
	if((BowMake_03 == TRUE) && (BowMake_04 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Eschenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other, " Ash Bow (Training Points: 3) " ,DIA_Bosper_BOWTEACH_Other_Bow_03);
	};
	if((BowMake_04 == TRUE) && (BowMake_05 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Buchenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other, " Beech Bow (Training Points: 4) " ,DIA_Bosper_BOWTEACH_Other_Bow_04);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Back()
{
	Info_ClearChoices(DIA_Bosper_BOWTEACH_Other);
};

func void DIA_Bosper_BOWTEACH_Other_Bow_01()
{
	if(hero.lp >= 1)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_01_01_01 " );	// Good. Now you know how to make this bow.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_01_01_02 " );	// I hope everything works out for you.
		hero.lp = hero.lp - 1;
		BowMake_02 = TRUE;
		AI_Print( " Learned bow crafting recipe - 'Willow Bow' " );
		B_LogEntry(Topic_TalentMakeBows, " To make a willow bow, I need a boar skin string, a willow bow shaft, and resin. " );
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 1)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_01_01_03 " );	// You're not ready for this yet! Come back when you've gained experience.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_02()
{
	if(hero.lp >= 2)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_02_01_01 " );	// Good. Now you know how to make this bow.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_02_01_02 " );	// I hope everything works out for you.
		hero.lp = hero.lp - 2;
		BowMake_03 = TRUE;
		AI_Print( " Learned the recipe for crafting bows - 'Elm Bow' " );
		B_LogEntry(Topic_TalentMakeBows, " To make an elm bow, I'll need a warg hide string, an elm pole, and resin. " );
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 2)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_02_01_03 " );	// You're not ready for this yet! Come back when you've gained experience.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_03()
{
	if(hero.lp >= 3)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_03_01_01 " );	// Good. Now you know how to make this bow.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_03_01_02 " );	// I hope everything works out for you.
		hero.lp = hero.lp - 3;
		BowMake_04 = TRUE;
		AI_Print( " Izuchen recipe for making onions - 'Ashley onions' " );
		B_LogEntry(Topic_TalentMakeBows, " To make an ash bow, I need a mracoris skin string, an ash bow shaft, and resin. " );
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 3)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_03_01_03 " );	// You're not ready for this yet! Come back when you've gained experience.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_04()
{
	if(hero.lp >= 4)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_04_01_01 " );	// Good. Now you know how to make this bow.
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_04_01_02 " );	// I hope everything works out for you.
		hero.lp = hero.lp - 4;
		BowMake_05 = TRUE;
		AI_Print( " Learned the recipe for crafting bows - 'Beech Bow' " );
		B_LogEntry(Topic_TalentMakeBows, " To make a beech bow, I need a trollskin string, a beech bow shaft, and two resins. " );
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 4)
	{
		AI_Output(self,other, " DIA_Bosper_BOWTEACH_Other_Bow_04_01_03 " );	// You're not ready for this yet! Come back when you've gained experience.
		AI_StopProcessInfos(self);
	};
};

var int Bosper_Island;

instance DIA_Bosper_PERM (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 10;
	condition = DIA_Bosper_PERM_Condition;
	information = DIA_Bosper_PERM_Info;
	permanent = TRUE;
	description = " How is the city? " ;
};

func int DIA_Bosper_PERM_Condition()
{
	if (Chapter >=  2 )
	{
		return TRUE;
	};
};

func void DIA_Bosper_PERM_Info()
{
	AI_Output(other,self, " DIA_Bosper_PERM_15_00 " );	// How is the situation in the city?
	if (Bosper_Island ==  FALSE )
	{
		AI_Output(self,other, " DIA_Bosper_PERM_11_01 " );	// If the orcs really decide to attack us, it's going to be really bad in here.
		AI_Output(self,other, " DIA_Bosper_PERM_11_02 " );	// There is only one ship in the harbor - and it is guarded by paladins. I don't think they're using it to save the townspeople.
		AI_Output(other,self, " DIA_Bosper_PERM_15_03 " );	// Is there any other way to get out of here?
		AI_Output(self,other, " DIA_Bosper_PERM_11_04 " );	// No, none of us can leave this island without a ship.
		Bosper_Island = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_PERM_11_05 " );	// No news yet. Come back later if you want.
	};
};

var int Bosper_MILKommentar;
var int Bosper_PALKommentar;
var int Bosper_INNOSKommentar;
var int Bosper_KDWKommentar;
var int Bosper_SEKComment;
var int Bosper_KDMKommentar;

instance DIA_Bosper_AlsLehrling (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Bosper_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_AlsLehrling_Info()
{
	if ((other.guild ==  GIL_MIL ) && (Bosper_StartGuild !=  GIL_MIL ) && (Bosper_MILKommentar ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_00 " );	// You joined the militia, didn't you?
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_01 " );	// I don't really care. If only you, in addition to orcs and bandits, also hunted wolves. (grins)
		Bosper_MILcomment = TRUE ;
	}
	else  if ((other.guild ==  GIL_PAL ) && (Bosper_StartGuild !=  GIL_PAL ) && (Bosper_PALKommentar ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_02 " );	// Looks like your career is on the rise. King's paladin!
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_03 " );	// But wherever you go, please don't forget your old teacher...
		Bosper_PALKommentar = TRUE ;
	}
	else  if (((other.guild ==  GIL_NOV ) || (other.guild ==  GIL_KDF )) && (Bosper_StartGuild !=  GIL_NOV ) && (Bosper_StartGuild !=  GIL_KDF ) && (Bosper_INNOSKommentar ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_04 " );	// You took the vows in the monastery, didn't you? I hope they will let you go at least sometimes, and you can bring me the skins...
		Bosper_INNOSKommentar = TRUE ;
	}
	else  if ((other.guild ==  GIL_KDW ) && (Bosper_KDWcomment ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_08 " );	// You joined the Circle of Water. I hope your vow doesn't stop you from hunting and bringing me skins like you used to. You won't forget old Bosper, will you?
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_09 " );	// Just... don't piss the skins for nothing, okay? You're a water mage, and I can't stand wet skins.
		Bosper_KDWKommentar = TRUE ;
	}
	else if((Bosper_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_10 " );	// Oh, you're with these wonderful guys now! Excellent! You made the right choice! Swamp Brotherhood is a very good place for you!

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_11 " );	// The Monastery of Innos, for example, would certainly have interrupted our cooperation, and with the Brotherhood you will be closer to nature, to animals, to skins and to me...
		};

		Bosper_SEKComment = TRUE ;
	}
	else if((Bosper_KDMKommentar == FALSE) && ((other.guild == GIL_KDM) || (other.guild == GIL_NDM)))
	{
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_12 " );	// Are you a dark mage? Necromancer, right? It... doesn't bother me at all, I swear.
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_13 " );	// I will buy skins from you even if you turn into Beliar himself! Just bring them in person. Don't send your people here... how are they? Raised servants. Deal?
		Bosper_KDMKommentar = TRUE ;
	}
	else if((Bosper_Lehrling_Day <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_05 " );	// Where have you been hanging out for so long?
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_06 " );	// I need more skins. Did you bring them?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_AlsLehrling_11_07 " );	// Finally arrived...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Bosper_Tasks (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_Tasks_Condition;
	information = DIA_Bosper_Tasks_Info;
	permanent = FALSE;
	description = " What should the student do? " ;
};

func int DIA_Bosper_Tasks_Condition()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Tasks_Info()
{
	AI_Output(other,self, " DIA_Bosper_Aufgaben_15_00 " );	// What should the student do?
	AI_Output(self,other, " DIA_Bosper_Aufgaben_11_01 " );	// It's simple. Bring me all the skins you can get.
	AI_Output(self,other, " DIA_Bosper_Aufgaben_11_02 " );	// I'll give you a higher price for them than any of the local merchants.
	AI_Output(self,other, " DIA_Bosper_Aufgaben_11_03 " );	// Well, the rest of the time, you don't have to show up at my shop. I'm doing pretty well on my own here.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self, " DIA_Bosper_Aufgaben_15_04 " );	// Where will I sleep?
		AI_Output(self,other, " DIA_Bosper_Aufgaben_11_05 " );	// I don't have a place for you here. But you can always find a free bed in a hotel in the market square.
	};
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus, " Bosper is willing to pay a very good price for animal skins. " );
};


var int Bosper_TrollFurSold;

instance DIA_Bosper_SellFur (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 600;
	condition = DIA_Bosper_SellFur_Condition;
	information = DIA_Bosper_SellFur_Info;
	permanent = TRUE;
	description = " I brought some skins for you. " ;
};

func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellFur_Info ()
{
	be int warfur;
	var int SumRabbitFur;
	var int dogfur;
	var int wolffur;
	var int icewolffur;
	var int summwolf;
	var int LurkerSkin;
	var int SharkSkin;
	var int SumSkin;
	var int pumafur;
	var int icepumafur;
	be int sumpuma;

	AI_Output(other,self, " DIA_Bosper_SellFur_15_00 " );	// I brought some skins for you.

	if((Npc_HasItems(other,ItAt_RabbitFur) > 0) || (Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,itat_LurkerSkin) > 0))
	{
		if(Npc_HasItems(other,ItAt_RabbitFur) > 0)
		{
			SummRabbitFur = Npc_HasItems(other,ItAt_RabbitFur) * 5;
			AI_Output(self,other, " DIA_Bosper_SellFur_11_95A " );	// Hmm... Rabbit skins? Okay, give them here. Suitable for anything.
			B_GiveInvItems(self,other,ItMi_Gold,SummRabbitFur);
			Npc_RemoveInvItems(other,ItAt_RabbitFur,Npc_HasItems(other,ItAt_RabbitFur));
		};
		if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
		{
			LurkerSkin = Npc_HasItems(other,itat_LurkerSkin);
			SharkSkin = Npc_HasItems(other,ItAt_SharkSkin);
			SummSkin = (LurkerSkin * Value_ReptileSkin) + (SharkSkin * Value_SharkSkin);

			AI_Output(self,other, " DIA_Bosper_SellFur_11_15A " );	// Reptile skins? Useful for armor guards.
			B_GiveInvItems(self,other,ItMi_Gold,SummSkin);
			Npc_RemoveInvItems(other,itat_LurkerSkin,Npc_HasItems(other,itat_LurkerSkin));
			Npc_RemoveInvItems(other,ItAt_SharkSkin,Npc_HasItems(other,ItAt_SharkSkin));
		};
		if(Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0)
		{
			AI_Output(self,other, " DIA_Bosper_SellFur_11_15B " );	// Boar skin? Good for a start...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Addon_KeilerFur) * Value_Keilerfur);
			Npc_RemoveInvItems(other,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		};
		if(Npc_HasItems(other,ItAt_SheepFur) > 0)
		{
			AI_Output(self,other, " DIA_Bosper_SellFur_11_01 " );	// Sheepskin? You didn't kill the farmers' sheep in the pastures, did you?
			AI_Output(other,self, " DIA_Bosper_SellFur_15_02 " );	// I didn't even think about doing this.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_SheepFur) * Value_SheepFur);
			Npc_RemoveInvItems(other,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
		};
		if((Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0))
		{
			wolffur = Npc_HasItems(other,ItAt_WolfFur);
			icewolffur = Npc_HasItems(other,ItAt_IceWolfFur);
			summwolf = (wolffur * Value_WolfFur) + (icewolffur * Value_IceWolfFur);

			AI_Output(self,other, " DIA_Bosper_SellFur_11_03 " );	// Wolf skins, that's good...
			B_GiveInvItems(self,other,ItMi_Gold,summwolf);
			Npc_RemoveInvItems(other,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
			Npc_RemoveInvItems(other,ItAt_IceWolfFur,Npc_HasItems(other,ItAt_IceWolfFur));
		};
		if((Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0))
		{
			wargfur = Npc_HasItems(other,ItAt_WargFur);
			dogfur = Npc_HasItems(other,ItAt_OrcDogFur);
			wagfur = wagfur + dogfur;

			AI_Output(self,other, " DIA_Bosper_SellFur_11_04 " );	// Warg hide? They are dangerous animals...
			B_GiveInvItems(self,other,ItMi_Gold,wargfur * Value_WargFur);
			Npc_RemoveInvItems(other,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
			Npc_RemoveInvItems(other,ItAt_OrcDogFur,Npc_HasItems(other,ItAt_OrcDogFur));
		};
		if((Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,ItAt_WhitePuma) > 0))
		{
			pumafur = Npc_HasItems(other,itat_pumafur);
			icepumafur = Npc_HasItems(other,ItAt_WhitePuma);
			summpuma = (pumafur * Value_PumaFur) + (icepumafur * Value_IcePumaFur);

			AI_Output(self,other, " DIA_Bosper_SellFur_11_14 " );	// Panther skin? This is a rarity in our area.
			B_GiveInvItems(self,other,ItMi_Gold,summpuma);
			Npc_RemoveInvItems(other,itat_pumafur,Npc_HasItems(other,itat_pumafur));
			Npc_RemoveInvItems(other,ItAt_WhitePuma,Npc_HasItems(other,ItAt_WhitePuma));
		};
		if(Npc_HasItems(other,ItAt_ShadowFur) > 0)
		{
			AI_Output(self,other, " DIA_Bosper_SellFur_11_05 " );	// Yeah... (amazed) And even the skin of the mrakoris? She is worth a lot!
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_ShadowFur) * Value_ShadowFur);
			Npc_RemoveInvItems(other,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		};
		if((Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0))
		{
			if (Bosper_TrollFurSold ==  FALSE )
			{
				AI_Output(self,other, " DIA_Bosper_SellFur_11_06 " );	// What the hell is that skin?
				AI_Output(other,self, " DIA_Bosper_SellFur_15_07 " );	// I took it off the troll.
				AI_Output(self,other, " DIA_Bosper_SellFur_11_08 " );	// This... She costs a fortune!
				Bosper_TrollFurSold = TRUE ;
			}
			else
			{
				AI_Output(self,other, " DIA_Bosper_SellFur_11_09 " );	// Another huge troll skin! Are you after them?!
				AI_Output(other,self, " DIA_Bosper_SellFur_15_10 " );	// If I suddenly come across one, I won't miss the moment...
			};
			if(Npc_HasItems(other,ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollFur) * Value_TrollFur);
				Npc_RemoveInvItems(other,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
			};
			if(Npc_HasItems(other,ItAt_TrollBlackFur) > 0)
			{
				AI_Output(self,other, " DIA_Bosper_SellFur_11_11 " );	// And a BLACK troll skin! Wow!
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollBlackFur) * Value_TrollBlackFur);
				Npc_RemoveInvItems(other,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
			};
		};
		AI_Output(self,other, " DIA_Bosper_SellFur_11_12 " );	// Great job! Come see me again when you have the skins.
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_SellFur_11_13 " );	// But you know, I'm only interested in the skins of wolves, obscurantists and the like.
	};
};


instance DIA_Bosper_Minenanteil (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_Minenanteil_Condition;
	information = DIA_Bosper_MinenTeil_Info;
	description = " I see you're selling shares in the mines. " ;
};

func int DIA_Bosper_Minenanteil_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (MY_Serpent_MineBefore_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Minenanteil_Info()
{
	AI_Output(other,self, " DIA_Bosper_Minenanteil_15_00 " );	// I see you're selling shares in the mines.
	AI_Output(self,other, " DIA_Bosper_Minenanteil_11_01 " );	// Hm. I don't know anything about it. You can take them if you want.
	B_GivePlayerXP(XP_Ambient);
};


instances DIA_Bosper_PICKPOCKET (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 900;
	condition = DIA_Bosper_PICKPOCKET_Condition;
	information = DIA_Bosper_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bosper_PICKPOCKET_Condition()
{
	return  C_Robbery ( 67 , 120 );
};

func void DIA_Bosper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,Dialog_Back,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};

func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};


instance DIA_BOSPER_BRINGARROW (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = dia_bosper_bringarrow_condition;
	information = dia_bosper_bringarrow_info;
	permanent = FALSE;
	description = " I have a letter for you. " ;
};


func int dia_bosper_bringarrow_condition()
{
	if((MIS_LETTERFALK == LOG_Running) && ((Npc_HasItems(hero,itwr_letterfalk) >= 1) || (Npc_HasItems(hero,itwr_letterfalk_open) >= 1)))
	{
		return TRUE;
	};
};

func void dia_bosper_bringarrow_info()
{
	AI_Output(other,self, " DIA_Bosper_BringArrow_01_00 " );	// I have a letter for you from the hunter Falk.
	AI_Output(self,other, " DIA_Bosper_BringArrow_01_03 " );	// Well, then give it here.
	if(Npc_HasItems(hero,itwr_letterfalk) >= 1)
	{
		B_GivePlayerXP(150);
		B_GiveInvItems(other,self,itwr_letterfalk,1);
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Bosper_BringArrow_01_05 " );	// Aha! All clear. I don't think there will be any problems with this order.
		AI_Output(self,other, " DIA_Bosper_BringArrow_01_06 " );	// Here, take these arrows and take them to Falk.
		B_GiveInvItems(self,other,ITRW_ZUNTARROW,100);
		Npc_RemoveInvItems(self,itwr_letterfalk,1);
		AI_Output(self,other, " DIA_Bosper_BringArrow_01_07 " );	// And don't lose them...(seriously) Otherwise, he won't thank you for it!
		B_LogEntry( TOPIC_LETTERFALK , " Merchant Bosper read the letter and then handed me a hundred arrows to take to Falk. " );
		BOSPERGIVEARROWS = TRUE ;
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,itwr_letterfalk_open) >= 1)
	{
		B_GiveInvItems(other,self,itwr_letterfalk_open,1);
		Npc_RemoveInvItems(self,itwr_letterfalk_open,1);
		AI_Output(self,other, " DIA_Bosper_BringArrow_01_13 " );	// Ok, let's see what he writes. But wait, his letter... it's been opened! The seal is broken!
		AI_Output(other,self, " DIA_Bosper_BringArrow_01_14 " );	// Really?! I don't know how it happened.
		AI_Output(self,other, " DIA_Bosper_BringArrow_01_17 " );	// Don't take me for an idiot, boy! (angrily) This can't be!
		AI_Output(self,other, " DIA_Bosper_BringArrow_01_18 " );	// So you'd better get out of my sight before I test my new bow on you.
		AI_Output(self,other, " DIA_Bosper_BringArrow_01_19 " );	// You won't get anything from me. Away!
		B_LogEntry( TOPIC_LETTERFALK , " Merchant Bosper kicked me out the door when he saw that the letter intended for him was opened. Now there is nothing left but to tell Falk about it himself. " );
		BOSPERREFUSEARROW = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_BOSPER_SHADOWBOW (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbow_condition;
	information = dia_bosper_shadowbow_info;
	permanent = FALSE;
	description = " Do you recognize this bow? " ;
};

func int dia_bosper_shadowbow_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_SUCCESS) && (Npc_HasItems(hero,itrw_shadowbow) >= 1) && (TakeShadowBow == TRUE))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbow_info()
{
	AI_Output(other,self, " DIA_Bosper_ShadowBow_01_00 " );	// Are you familiar with this bow?
	AI_Output(self,other, " DIA_Bosper_ShadowBow_01_01 " );	// Hmmm, keren bow... (looking) Certainly familiar - it's hard to confuse it with any other thing.
	AI_Output(self,other, " DIA_Bosper_ShadowBow_01_02 " );	// Really, I still don't really understand what this bow does with you?!
	AI_Output(other,self, " DIA_Bosper_ShadowBow_01_03 " );	// Falk gave it to me.
	AI_Output(self,other, " DIA_Bosper_ShadowBow_01_04 " );	// Falk?! Hmmm... (surprised) Then that can only mean one thing - we have another great hunter!
	AI_Output(self,other, " DIA_Bosper_ShadowBow_01_06 " );	// Then congratulations, mate! Believe me: only a few have received this honor!
	if (Player_IsApprentice == APP_Bosper)
	{
		AI_Output(self,other, " DIA_Bosper_ShadowBow_01_07 " );	// Although I never doubted that you could reach such heights.
		AI_Output(self,other, " DIA_Bosper_ShadowBow_01_10 " );	// I understood this even when you first came into my shop.
		AI_Output(self,other, " DIA_Bosper_ShadowBow_01_11 " );	// And now I am very glad that I made the decision to take you as my student.
	};
	AI_Output(self,other, " DIA_Bosper_ShadowBow_01_14 " );	// And you probably need arrows for this bow.
	AI_Output(self,other, " DIA_Bosper_ShadowBow_01_16 " );	// I can make them for you.
	AI_Output(self,other, " DIA_Bosper_ShadowBow_01_17 " );	// True, it won't be free.
	AI_Output(self,other, " DIA_Bosper_ShadowBow_01_18 " );	// I won't charge you anything for my work, but you'll have to pay for the material for these arrows.
	FOREST PERMAKESHADOWARROW = TRUE ;
};

instance DIA_Bosper_ShadowBowArrowMake (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_ShadowBowArrowMake_condition;
	information = DIA_Bosper_ShadowBowArrowMake_info;
	permanent = FALSE;
	description = " Can I make them myself? " ;
};

func int DIA_Bosper_ShadowBowArrowMake_condition()
{
	if((BOSPERMAKESHADOWARROW == TRUE) && (Player_IsApprentice == APP_Bosper) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_ShadowBowArrowMake_info()
{
	AI_Output(other,self, " DIA_Bosper_ShadowBowArrowMake_01_00 " );	// Can I make them myself?
	AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMake_01_01 " );	// (thoughtfully) Making those arrows is actually a big secret!
	AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMake_01_02 " );	// But since you happen to be my apprentice... so be it.
	AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMake_01_03 " );	// I'll tell you how to make core arrows.
	AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMake_01_04 " );	// But you'll have to pay for it. I won't teach it for free.
	Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
	B_LogEntry( TOPIC_TALENTMAKEARROWS , " Because I'm Bosper's apprentice, he can teach me how to make Keren arrows. " );
};

instance DIA_Bosper_ShadowBowArrowMakeDone (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_ShadowBowArrowMakeDone_condition;
	information = DIA_Bosper_ShadowBowArrowMakeDone_info;
	permanent = TRUE;
	description = " Teach me how to make Keren Arrows. (Training Points: 5, Cost: 3000 coins) " ;
};

func int DIA_Bosper_ShadowBowArrowMakeDone_condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_ShadowBowArrowMake) && (KNOWHOWTOMAKEARROWSKER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_ShadowBowArrowMakeDone_info()
{
	var int cost;
	var int money;

	cost = 5 ;
	money = 3000;

	AI_Output(other,self, " DIA_Bosper_ShadowBowArrowMakeDone_01_00 " );	// Teach me how to make core arrows.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMakeDone_03_90 " );	// You don't have enough gold to train! Come back later.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMakeDone_01_01 " );	// Good. Listen carefully.
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMakeDone_01_02 " );	// The secret of keren arrows lies in their perfect balance.
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMakeDone_01_03 " );	// It is he who allows these arrows to fly much further than usual and pierce the most durable armor.
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMakeDone_01_04 " );	// Their shafts are made from normal wood, but the tips are forged from magic ore instead of regular iron.
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrowMakeDone_01_05 " );	// And so, in fact, that's all.
		hero.lp = hero.lp - kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		RankPoints = RankPoints + cost;
		Npc_SetTalentSkill(hero,NPC_TALENT_MAKEARROWS,1);
		AI_Print( " Recipe learned - 'Keren Arrows' " );
		KNOWHOWTOMAKEARROWSKER = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
		B_LogEntry( TOPIC_TALENTMAKEARROWS , " To make Keren Arrows, I need an arrow shaft, a tip forged from magic ore, and a harpy feather, in the amount of one stack for fifty arrows. " );
	};
};

instance DIA_BOSPER_SHADOWBOWARROW (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbowarrow_condition;
	information = dia_bosper_shadowbowarrow_info;
	permanent = TRUE;
	description = " I need arrows for my keren bow. " ;
};


func int dia_bosper_shadowbowarrow_condition()
{
	if (( BOSPERMAKESHADOWARROW  ==  TRUE ) && ( BOSPERMAKESHADOWARROWPROGRESS  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbowarrow_info()
{
	AI_Output(other,self, " DIA_Bosper_ShadowBowArrow_01_00 " );	// I need arrows for the keren bow.
	AI_Output(self,other, " DIA_Bosper_ShadowBowArrow_01_01 " );	// No problem! Unless, of course, you have gold.
	if(KNOWSHADOWBOWARROW == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_01_02");	//Сколько?
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrow_01_03 " );	// I think two hundred gold coins will be enough.
		KNOWSHADOWBOWARROW = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrow_01_04 " );	// You know my price - two hundred gold coins.
	};
	Info_ClearChoices(dia_bosper_shadowbowarrow);
	Info_AddChoice(dia_bosper_shadowbowarrow, " Perhaps another time. " ,dia_bosper_shadowbowarrow_no);
	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		Info_AddChoice(dia_bosper_shadowbowarrow, " Вот твое золото. " ,dia_bosper_shadowbowarrow_yes);
	};
};

func void dia_bosper_shadowbowarrow_no()
{
	AI_Output(other,self, " DIA_Bosper_ShadowBowArrow_No_01_00 " );	// Maybe some other time.
	AI_Output(self,other, " DIA_Bosper_ShadowBowArrow_No_01_01 " );	// As you say.
	Info_ClearChoices(dia_bosper_shadowbowarrow);
};

func void dia_bosper_shadowbowarrow_yes()
{
	AI_Output(other,self, " DIA_Bosper_ShadowBowArrow_Yes_01_00 " );	// Here's your gold.
	B_GiveInvItems(other,self,ItMi_Gold,200);
	AI_Output(self,other, " DIA_Bosper_ShadowBowArrow_Yes_01_01 " );	// Great! Then I immediately get to work.
	AI_Output(other,self, " DIA_Bosper_ShadowBowArrow_Yes_01_02 " );	// When will my arrows be ready?
	AI_Output(self,other, " DIA_Bosper_ShadowBowArrow_Yes_01_03 " );	// I think I can finish your order by noon tomorrow. So you'll have to wait a bit.
	BOSPERMAKESHADOWARROWPROGRESS = TRUE ;
	TIMER_SHADOWBOWARROW = Wld_GetDay();
	Info_ClearChoices(dia_bosper_shadowbowarrow);
};


instance DIA_BOSPER_SHADOWBOWARROWDONE (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbowarrowdone_condition;
	information = dia_bosper_shadowbowarrowdone_info;
	permanent = TRUE;
	description = " How is my order doing? " ;
};


func int dia_bosper_shadowbowarrowdone_condition()
{
	if (( BOSPERMAKESHADOWARROW  ==  TRUE ) && ( BOSPERMAKESHADOWARROWPROGRESS  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbowarrowdone_info()
{
	where int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Bosper_ShadowBowArrowDone_01_00 " );	// How is my order doing?

	if(TIMER_SHADOWBOWARROW < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (TIMER_SHADOWBOWARROW < (daynow - 1)))
		{
			AI_Output(self,other, " DIA_Bosper_ShadowBowArrowDone_01_01 " );	// Everything is ready! Here, take it - here are fifty Keren arrows of the best quality!
			B_GiveInvItems(self,other,ITRW_MYHUNTARROW,50);
			AI_Output(self,other, " DIA_Bosper_ShadowBowArrowDone_01_04 " );	// But if you need more, feel free to contact me.
			BOSPERMAKESHADOWARROWPROGRESS = FALSE ;
			TIMER_SHADOWBOWARROW = 0;
		}
		else
		{
			AI_Output(self,other, " DIA_Bosper_ShadowBowArrowDone_01_06 " );	// Not ready yet. Come back later!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bosper_ShadowBowArrowDone_01_06 " );	// Not ready yet. Come back later!
	};
};

var int BosperBuyMace;

instance DIA_Bosper_CanBuyGoblinWeapon(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_CanBuyGoblinWeapon_Condition;
	information = DIA_Bosper_CanBuyGoblinWeapon_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bosper_CanBuyGoblinWeapon_Condition()
{
	if(Player_IsApprentice != APP_NONE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_CanBuyGoblinWeapon_Info()
{
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_00 " );	// Wait! I have one suggestion for you.
	AI_Output(other,self, " DIA_Bosper_CanBuyGoblinWeapon_01_01 " );	// I'm listening to you.
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_02 " );	// If you get goblin sticks, I could trade them with you for arrows!
	AI_Output(other,self, " DIA_Bosper_CanBuyGoblinWeapon_01_03 " );	// Why are you doing this?
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_04 " );	// You see, although goblins seem to be very primitive creatures, they really aren't.
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_05 " );	// They choose the straightest branches for their clubs and dry them thoroughly.
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_06 " );	// One such club can make several excellent arrows, and without prior drying.
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_07 " );	// The goblin's stick just needs to be split and crafted a bit. For a master like me, this is not a big deal.
	AI_Output(other,self, " DIA_Bosper_CanBuyGoblinWeapon_01_08 " );	// And how do you do it?
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_09 " );	// If I talk about all the intricacies of my craft to everyone, then soon I will have to go to the street to beg.
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_10 " );	// But we can make a good deal with you! You bring me goblin sticks, and I give you ready-made arrows for them.
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_11 " );	// Of course, you'll get fewer arrows than I can make with a single stick. But, given the processing and fletching for arrows, this will be a fair exchange!
	AI_Output(other,self, " DIA_Bosper_CanBuyGoblinWeapon_01_12 " );	// And how many arrows will I get for one stick?
	AI_Output(self,other, " DIA_Bosper_CanBuyGoblinWeapon_01_13 " );	// (thoughtfully) Well, let's say I give you two good arrows I made. Well, do you agree?
	AI_Output(other,self, " DIA_Bosper_CanBuyGoblinWeapon_01_14 " );	// Okay, I'll keep that in mind.
	BosperBuyMace = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Bosper is buying goblin wooden sticks. For one stick, he will give you two arrows. " );
};

instance DIA_Bosper_BuyGoblinWeapon (C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_BuyGoblinWeapon_Condition;
	information = DIA_Bosper_BuyGoblinWeapon_Info;
	permanent = TRUE;
	description = " I've got some goblin sticks here for you. " ;
};

func int DIA_Bosper_BuyGoblinWeapon_Condition()
{
	if((BosperBuyMace == TRUE) && (Npc_HasItems(hero,ItMw_1h_Bau_Mace) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BuyGoblinWeapon_Info()
{
	var int allarrow;

	allarrow = Npc_HasItems(hero,ItMw_1h_Bau_Mace);
	Npc_RemoveInvItems(hero,ItMw_1h_Bau_Mace,allarrow);
	AI_Output(other,self, " DIA_Bosper_BuyGoblinWeapon_01_00 " );	// I've got some goblin sticks here for you.
	AI_Output(self,other, " DIA_Bosper_BuyGoblinWeapon_01_01 " );	// So let's see how many you have...
	AI_Output(self,other, " DIA_Bosper_BuyGoblinWeapon_01_02 " );	// (counts) Great! I'll take them all.
	AI_Output(self,other, " DIA_Bosper_BuyGoblinWeapon_01_03 " );	// Here are your arrows!
	B_GiveInvItems(self,other,ItRw_Arrow,allarrow * 2);
};
