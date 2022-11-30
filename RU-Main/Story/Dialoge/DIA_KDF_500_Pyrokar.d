
instance DIA_Pyrokar_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_NoEnter_PissOff (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_NoEnter_PissOff_Condition;
	information = DIA_Pyrokar_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Pyrokar_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Pyrokar_WELCOME(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_WELCOME_Condition;
	information = DIA_Pyrokar_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Pyrokar_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WELCOME_Info()
{
	AI_Output(self,other, " DIA_Pyrokar_WELCOME_11_00 " );	// So, we have a new novice. I believe you have already received the task from Master Parlan.
	AI_Output(self,other, " DIA_Pyrokar_WELCOME_11_01 " );	// You know that everyone in the monastery must fulfill their duties according to the will of Innos.
};


instance DIA_Pyrokar_Hagen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_Hagen_Condition;
	information = DIA_Pyrokar_Hagen_Info;
	permanent = FALSE;
	description = " I need to talk to the paladins! It's urgent. " ;
};


func int DIA_Pyrokar_Hagen_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Hagen_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_Hagen_15_00 " );	// I need to talk to the paladins! This is urgent.
	AI_Output(self,other, " DIA_Pyrokar_Hagen_11_01 " );	// Are you telling us what you're going to talk to them about?
	AI_Output(other,self, " DIA_Pyrokar_Hagen_15_02 " );	// I have an important message for them.
	AI_Output(self,other, " DIA_Pyrokar_Hagen_11_03 " );	// What is this message?
	AI_Output(other,self, " DIA_Pyrokar_Hagen_15_04 " );	// An army of evil is gathering in the Valley of Mines. It's led by dragons! We must stop them while we still can.
	AI_Output(self,other, " DIA_Pyrokar_Hagen_11_05 " );	// Hmm. We must consider your words, novice. When the time is right, we will let you know what the Council has decided on this matter.
	AI_Output(self,other, " DIA_Pyrokar_Hagen_11_06 " );	// In the meantime, you'd better pay close attention to your duties as an acolyte.
	if(Npc_KnowsInfo(other,DIA_Pyrokar_Auge))
	{
		AI_Output(self,other, " DIA_Pyrokar_ALL_11_07 " );	// We won't interrupt your work anymore - you can go.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Pyrokar_Eye (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_Auge_Condition;
	information = DIA_Pyrokar_Eye_Info;
	permanent = FALSE;
	description = " I'm looking for the Eye of Innos. " ;
};


func int DIA_Pyrokar_Auge_Condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Eye_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_Auge_15_00 " );	// I'm looking for the Eye of Innos.
	AI_Output(self,other, " DIA_Pyrokar_Auge_11_01 " );	// Anyone who thinks they can not only find this sacred amulet but also wear it is an idiot.
	AI_Output(self,other, " DIA_Pyrokar_Auge_11_02 " );	// This amulet chooses its owner by itself - only those who are destined for this are able to wear it.
	AI_Output(other,self, " DIA_Pyrokar_Auge_15_03 " );	// I'd still like to try.
	AI_Output(self,other, " DIA_Pyrokar_Auge_11_04 " );	// The obligation of a novice to show humility is not desire.
	B_LogEntry( TOPIC_INNOSEYE , " I didn't think it would be so difficult, but Pyrokar won't give up the Eye voluntarily, paladins help here. " );
	if(Npc_KnowsInfo(other,DIA_Pyrokar_Hagen))
	{
		AI_Output(self,other, " DIA_Pyrokar_ALL_11_05 " );	// Well, we won't interrupt your work anymore - you can go.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Pyrokar_MissingPeople(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 5;
	condition = DIA_Addon_Pyrokar_MissingPeople_Condition;
	information = DIA_Addon_Pyrokar_MissingPeople_Info;
	description = " Citizens of Khorinis mysteriously disappear. " ;
};


func int DIA_Addon_Pyrokar_MissingPeople_Condition()
{
	if ((SC_HearedAboutMissingPeople ==  TRUE ) && (slave_escape ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pyrokar_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Pyrokar_MissingPeople_15_00 " );	// The inhabitants of Khorinis mysteriously disappear.
	AI_Output(self,other, " DIA_Addon_Pyrokar_MissingPeople_11_01 " );	// I know this and am deeply saddened by these disappearances. But this is what waterbenders do.
	AI_Output(self,other, " DIA_Addon_Pyrokar_MissingPeople_11_02 " );	// They are also trying to find out the causes of strange earthquakes occurring in the northeastern part of Khorinis.
	AI_Output(self,other, " DIA_Addon_Pyrokar_MissingPeople_11_03 " );	// So far, they haven't let me know they need our help. Therefore, we are not taking any action.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//Да, но...
	AI_Output(self,other, " DIA_Addon_Pyrokar_MissingPeople_11_05 " );	// No 'buts'! We will do as we see fit, and I hope you understand that.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, "The Fire Mages are saddened by the disappearance of the townspeople. However, they say that it is up to the Water Mages to deal with this. I can't find help on this issue in the monastery. " );
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_Pyrokar_GOAWAY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_GOAWAY_Condition;
	information = DIA_Pyrokar_GOAWAY_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pyrokar_GOAWAY_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Pyrokar_MissingPeople) == FALSE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return  FALSE ;
	};
	if ( Npc_IsInState ( self , ZS_Talk ) && Npc_KnowsInfo ( other , DIA_Pyrokar_Hagen ) && Npc_KnowsInfo ( other , DIA_Pyrokar_Auge ) && ( KNOWS_FIRE_CONTEST  ==  FALSE ) && ( other . guild ==  GIL_NOV )) ;
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GOAWAY_Info()
{
	AI_Output(self,other, " DIA_Pyrokar_GOAWAY_11_00 " );	// (irritated) Humility is a virtue you have yet to learn. Anyway.
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_FIRE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_FIRE_Condition;
	information = DIA_Pyrokar_FIRE_Info;
	permanent = FALSE;
	description = " I want to take the Trial by Fire! " ;
};


func int DIA_Pyrokar_FIRE_Condition()
{
	if (( KNOWS_FIRE_CONTEST  ==  TRUE ) && ( other . guild ==  GIL_NOV ) && Npc_KnowsInfo ( other , DIA_Pyrokar_Hagen ) ) .
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FIRE_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_FIRE_15_00 " );	// I want to take the Trial by Fire!
	AI_Output(self,other, " DIA_Pyrokar_FIRE_11_01 " );	// So you know about...(surprised) Do you want to take the Trial by Fire?
	AI_Output(other,self, " DIA_Pyrokar_FIRE_15_02 " );	// Yes, I'm referring to the Law of Fire, which says...
	AI_Output(self,other, " DIA_Pyrokar_FIRE_11_03 " );	// (abruptly interrupts) We know the Law of Fire. We also saw how many novices died in this test. You must reconsider your decision.
	AI_Output(other,self, " DIA_Pyrokar_FIRE_15_04 " );	// I want to pass this test - and I will pass it.
	AI_Output(self,other, " DIA_Pyrokar_FIRE_11_05 " );	// (warning) If you categorically insist, the High Council will subject you to this test.
	AI_Output(other,self, " DIA_Pyrokar_FIRE_15_06 " );	// I insist on passing the Trial by Fire.
	AI_Output(self,other, " DIA_Pyrokar_FIRE_11_07 " );	// In that case, so be it. When you are ready, each of the mages of the High Council will give you a task to complete.
	AI_Output(self,other, " DIA_Pyrokar_FIRE_11_08 " );	// May Innos have mercy on your soul.
	B_LogEntry(TOPIC_FireContest, " I requested the Pyrocar to complete the Trial of Fire. Now I must complete three High Council tasks. " );
};


instance DIA_Pyrokar_TEST(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_TEST_Condition;
	information = DIA_Pyrokar_TEST_Info;
	permanent = FALSE;
	description = " I'm ready to take your test, master. " ;
};


func int DIA_Pyrokar_TEST_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pyrokar_FIRE ) && ( MIS_SCHNITZELJAGD  ==  FALSE ) && ( hero . guild ==  GIL_NOV )) .
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEST_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_TEST_15_00 " );	// I'm ready to take the test, Master.
	AI_Output(self,other, " DIA_Pyrokar_TEST_11_01 " );	// And only Innos knows whether you will pass it. You will be subjected to the same test as the chosen novices.
	AI_Output(self,other, " DIA_Pyrokar_TEST_11_02 " );	// Trial by Fire!...(haughtily) You probably know that only ONE of the acolytes can pass this test.
	AI_Output(other,self, " DIA_Pyrokar_TEST_15_03 " );	// I understand. And who are my rivals?
	AI_Output(self,other, " DIA_Pyrokar_TEST_11_04 " );	// Innos, in his wisdom, chose three novices to be subjected to this test: Agon, Igaraz, and Ulf. They have already begun searching.
	AI_Output(self,other, " DIA_Pyrokar_TEST_11_05 " );	// But enough about that! Hear the words of this test: 'Follow the signs of Innos and bring what the believer finds at the end of the path'.
	AI_Output(self,other, " DIA_Pyrokar_TEST_11_06 " );	// You will need this key.
	Log_CreateTopic(TOPIC_scavenger hunt, LOG_MISSION );
	Log_SetTopicStatus(TOPIC_Scavenger Hunt,LOG_Running);
	B_LogEntry(TOPIC_Schnitzeljagd, "The Pyrocar is giving me a Trial of Fire. This is the same trial that the chosen acolytes of Ulf, Igaraz, and Agon must pass. " );
	B_LogEntry_Quiet(TOPIC_Schnitzeljagd, " I must follow the signs of Innos and 'bring what the believer finds at the end of the path'. He also gave me a key. " );
	CreateInvItems(self,ItKe_MagicChest,1);
	B_GiveInvItems(self,other,ItKe_MagicChest,1);
	B_StartOtherRoutine(Igaraz,"CONTEST");
	AI_Teleport(Igaraz,"NW_TAVERNE_BIGFARM_05");
	CreateInvItems(Igaraz,ItKe_MagicChest,1);
	Igaraz.aivar[AIV_DropDeadAndKill] = TRUE ;
	Igaraz.aivar[AIV_NewsOverride] = TRUE ;
	B_StartOtherRoutine(Nov607,"EXCHANGE");
	B_StartOtherRoutine(Agon,"GOLEMDEAD");
	AI_Teleport(Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems(Agon,ItKe_MagicChest,1);
	Agon.aivar[AIV_DropDeadAndKill] = TRUE ;
	Agon.aivar[AIV_NewsOverride] = TRUE ;
	B_StartOtherRoutine(Ulf,"SUCHE");
	AI_Teleport(Ulf,"NW_TROLLAREA_PATH_42");
	CreateInvItems(Ulf,ItKe_MagicChest,1);
	Ulf.aivar[AIV_DropDeadAndKill] = TRUE ;
	Ulf.aivar[AIV_NewsOverride] = TRUE ;
	MIS_SCHNITZELJAGD = LOG_Running;
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_RUNNING(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 20;
	condition = DIA_Pyrokar_RUNNING_Condition;
	information = DIA_Pyrokar_RUNNING_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Pyrokar_RUNNING_Condition()
{
	if (( MIS_SCHNITZELJAGD  == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild ==  GIL_NOV ) && Mob_HasItems( " MAGICCHEST " ,ItMi_RuneBlank));
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_RUNNING_Info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other, " DIA_Pyrokar_RUNNING_11_00 " );	// Until you pass this test, we have nothing to tell you.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other, " DIA_Pyrokar_RUNNING_11_01 " );	// What are you waiting for? Go take the test!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other, " DIA_Pyrokar_RUNNING_11_02 " );	// It's time to back up your big words with deeds. Don't you think so, novice?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_SUCCESS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SUCCESS_Condition;
	information = DIA_Pyrokar_SUCCESS_Info;
	permanent = FALSE;
	description = " I found a runestone. " ;
};

func int DIA_Pyrokar_SUCCESS_Condition()
{
	if (( MIS_SCHNITZELJAGD  == LOG_Running) && (MageFireChestOpen ==  TRUE ) && (hero.guild ==  GIL_NOV ) &&  ! Mob_HasItems( " MAGICCHEST " ,ItMi_RuneBlank) && ((Npc_HasItems(other,ItMi_RuneBlank) > =  1 ) || Npc_HasItems ( other , ItRu_FireBolt ) >=  1 ))) ;
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SUCCESS_Info()
{
	B_GivePlayerXP( XP_SCHNITZELJAGD );
	AI_Output(other,self, " DIA_Pyrokar_SUCCESS_15_00 " );	// I found a runestone.
	AI_Output(self,other, " DIA_Pyrokar_SUCCESS_11_01 " );	// (in disbelief) Did you do it? You followed the signs and found the hidden portal...
	AI_Output(other,self, " DIA_Pyrokar_SUCCESS_15_02 " );	// ...and defeated all those monsters that already considered me their prey with one left hand.
	AI_Output(self,other, " DIA_Pyrokar_SUCCESS_11_03 " );	// And the other acolytes? What about Agon? Did they get ahead of you?
	AI_Output(other,self, " DIA_Pyrokar_SUCCESS_15_04 " );	// They couldn't. I think they were not destined to pass this test.
	AI_Output(self,other, " DIA_Pyrokar_SUCCESS_11_05 " );	// Well, in that case, we announce that you have passed this test. And this runestone is now yours.
	MIS_SCHNITZELJAGD = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_scavenger hunt, LOG_SUCCESS );
	B_LogEntry(TOPIC_Schnitzeljagd, " I passed the Trial of Fire that the Pyrocar gave me! " );
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Igaraz,"Start");
	Igaraz.aivar[AIV_DropDeadAndKill] = FALSE ;
	Igaraz.aivar[AIV_NewsOverride] = FALSE ;
	B_StartOtherRoutine(Nov607,"Start");
	B_StartOtherRoutine(Agon,"Start");
	Agon.aivar[AIV_DropDeadAndKill] = FALSE ;
	Agon.aivar[AIV_NewsOverride] = FALSE ;
	B_StartOtherRoutine(Ulf,"Start");
	Ulf.aivar[AIV_DropDeadAndKill] = FALSE ;
	Ulf.aivar[AIV_NewsOverride] = FALSE ;
};

instance DIA_Pyrokar_Todo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Todo_Condition;
	information = DIA_Pyrokar_Todo_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Pyrokar_Todo_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && ((MIS_RUNE != LOG_SUCCESS) || (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Todo_Info()
{
	AI_Output(self,other, " DIA_Pyrokar_Todo_11_00 " );	// You passed the test I put you through.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//Но...

	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Pyrokar_Todo_11_02 " );	// ... you still need to pass Ulthar's test.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Pyrokar_Todo_11_03 " );	// ... you still need to complete Serpentes' quest.
	};

	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_MAGICAN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_MAGICAN_Condition;
	information = DIA_Pyrokar_MAGICAN_Info;
	permanent = FALSE;
	description = " Will I be accepted into the Mages Guild now? " ;
};

func int DIA_Pyrokar_MAGICAN_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && (MIS_RUNE == LOG_SUCCESS) && (MIS_GOLEM == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAGICAN_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_MAGICAN_15_00 " );	// Will I be accepted into the Mages Guild now?
	AI_Output(self,other, " DIA_Pyrokar_MAGICAN_11_01 " );	// You did it. You have passed the Trial by Fire. From the very beginning we were sure that you would succeed in this.
	AI_Output(self,other, " DIA_Pyrokar_MAGICAN_11_02 " );	// (persistently) We are also confident that you will continue to do your best to become a WORTHY servant of Innos.
	AI_Output(self,other, " DIA_Pyrokar_MAGICAN_11_03 " );	// So, if you're ready to accept the Oath of Fire, you'll be accepted into our ranks.
	AI_Output(self,other, " DIA_Pyrokar_MAGICAN_100_01 " );	// But first, I have one last task for you, as the chosen acolyte of Innos. Go to Karras, he will tell you everything in detail!
	MIS_KARRAS_BOOKS = LOG_Running;
	Log_CreateTopic(TOPIC_HELPKARRASBOOKS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPKARRASBOOKS,LOG_Running);
	; _ _ _ _ _ _
};

instance DIA_Pyrokar_OATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_OATH_Condition;
	information = DIA_Pyrokar_OATH_Info;
	permanent = FALSE;
	description = " I'm ready to enter the Circle of Fire. " ;
};

func int DIA_Pyrokar_OATH_Condition()
{
	if ((hero.guild ==  GIL_NOV ) && ( MIS_KARRAS_BOOKS  ==  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_OATH_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_OATH_15_00 " );	// I'm ready to enter the Circle of Fire.
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_01 " );	// Okay, then take the Oath of Fire.
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_02 " );	// (solemnly) Do you swear, in the face of Innos the Almighty, his servants and the Holy Fire...
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_03 " );	// ... that from this moment until the end of your days, your whole life will be one with fire...
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_04 " );	// ...until your body and soul find rest in these sacred halls and the flame of your life is extinguished?
	AI_Output(other,self, " DIA_Pyrokar_OATH_15_05 " );	// I swear.
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_06 " );	// By uttering the words of this oath, you have joined the Covenant of Fire.
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_07 " );	// Wear this robe as a sign of this eternal bond.
	CreateInvItems(self,ItAr_KDF_L,1);
	B_GiveInvItems(self,other,ItAr_KDF_L,1);

	if(CanTeachTownMaster == FALSE)
	{
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_KDF;
	other.protection[PROT_FIRE] += 10;
	REALPROTFIRE += 10;
	AI_PrintClr( " Fire protection + 10 " , 83 , 152 , 48 );
	CheckHeroGuild[0] = TRUE;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_1A " );	// Also accept this staff from me. Only we - the magicians of Fire - have been granted the honor to possess it and control its power!
	Npc_ExchangeRoutine(Lothar,"START");
	Fire_Contest = TRUE;
	Snd_Play("GUILD_INV");
	KDF_Recording = LOG_SUCCESS ;
	SLD_recording = LOG_OBSOLETE ;
	MIL_recording = LOG_OBSOLETE ;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 15;
	B_GivePlayerXP(XP_BecomeMage);
	CreateInvItems(self,ITMW_2H_G3_STAFFFIRE_01,1);
	B_GiveInvItems(self,other,ITMW_2H_G3_STAFFFIRE_01,1);
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_08 " );	// Now that you've been accepted into our ranks, you can speak to Lord Hagen, Commander-in-Chief of the Paladins.
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_09 " );	// We're also very interested to know how he views the situation. So you can now go to Khorinis.
	AI_Output(self,other, " DIA_Pyrokar_OATH_11_10 " );	// We expect you to bring his answer immediately.
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_Lernen (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Lernen_Condition;
	information = DIA_Pyrokar_Lernen_Info;
	permanent = FALSE;
	description = " What can I learn now? " ;
};


func int DIA_Pyrokar_Lernen_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Lernen_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_Lernen_15_00 " );	// What can I learn now?
	AI_Output(self,other, " DIA_Pyrokar_Lernen_11_01 " );	// First of all, now you have the right to learn Circles of Magic. They will give you power over the runes.
	AI_Output(self,other, " DIA_Pyrokar_Lernen_11_02 " );	// The higher you climb in the six Circles of Magic, the more powerful spells you can master.
	AI_Output(self,other, " DIA_Pyrokar_Lernen_11_10 " );	// Brother Parlan will introduce you to the first Circle of Magic and teach you how to make runes. And don't forget to increase your magic power as well!
	Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
	B_LogEntry(Topic_KlosterTeacher, " Brother Parlan will introduce me to the first Circle of Magic and may initiate me into the mysteries of Fire. " );
};


instance DIA_Pyrokar_Wunsch (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Wunsch_Condition;
	information = DIA_Pyrokar_Wunsch_Info;
	permanent = FALSE;
	description = " I'd like to make a wish... " ;
};


func int DIA_Pyrokar_Wunsch_Condition()
{
	if ((other.guild ==  GIL_KDF ) && (Chapter <  2 )) .
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Wunsch_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_Wunsch_15_00 " );	// I'd like to make a wish...
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_11_01 " );	// Once accepted into our ranks, every mage has the right to take the first step.
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_11_02 " );	// So, what will be your first step as a mage?
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
	Info_AddChoice(DIA_Pyrokar_Wunsch, " Ничего. " ,DIA_Pyrokar_Wunsch_Nothing);
	if(MIS_HelpBabo == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch, " Let novice Babo lead the monastery garden. " ,DIA_Pyrokar_Wunsch_Babo);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch, " Allow Acolyte Opolos to access the library. " ,DIA_Pyrokar_Wunsch_Opolos);
	};
	if(MIS_HelpDyrian == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch, " Let novice Durian stay at the monastery. " ,DIA_Pyrokar_Wunsch_Dyrian);
	};
};

func void DIA_Pyrokar_Wunsch_Nothing()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self, " DIA_Pyrokar_Wunsch_Nothing_15_00 " );	// None.
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_Nothing_11_01 " );	// (surprised) So be it. The new magician refuses the first step.
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");

	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Dyrian()
{
	AI_Output(other,self, " DIA_Pyrokar_Wunsch_Dyrian_15_00 " );	// Let novice Durian stay at the monastery.
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_Dyrian_11_01 " );	// So be it.
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_Dyrian_11_02 " );	// This acolyte will be allowed to stay at the monastery and take the gardener's position, which is currently vacant.
	B_GivePlayerXP(XP_HelpDyrian);
	B_StartOtherRoutine(Dyrian,"FAVOUR");
	MIS_HelpDyrian = LOG_SUCCESS;
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Babo()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self, " DIA_Pyrokar_Wunsch_Babo_15_00 " );	// Let the novice Babo lead the monastery garden.
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_Babo_11_01 " );	// So be it.
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_Babo_11_02 " );	// From now on, novice Babo will be in charge of the monastery garden.
	B_GivePlayerXP(XP_HelpBabo);
	B_StartOtherRoutine(Babo,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	MIS_HelpBabo = LOG_SUCCESS;
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Opolos()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self, " DIA_Pyrokar_Wunsch_Opolos_15_00 " );	// Allow Acolyte Opolos to access the library.
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_Opolos_11_01 " );	// So be it.
	AI_Output(self,other, " DIA_Pyrokar_Wunsch_Opolos_11_02 " );	// From now on, the novice Opolos will be allowed to study the writings of Innos.
	B_GivePlayerXP(XP_HelpOpolos);
	B_StartOtherRoutine(Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	MIS_HelpOpolos = LOG_SUCCESS;
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};


instance DIA_Pyrokar_Message (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Message_Condition;
	information = DIA_pyrocar_message_info;
	permanent = FALSE;
	description = " I bring news from Lord Hagen. " ;
};


func int DIA_Pyrokar_Message_Condition()
{
	if (( MY_OLDWORLD  == LOG_Running ) && ( other . guild ==  GIL_KDF ))
	{
		return TRUE;
	};
};

func void DIA_pyrocar_message_info()
{
	AI_Output(other,self, " DIA_Pyrokar_Nachricht_15_00 " );	// I brought news from Lord Hagen. He wants to get evidence of the presence of dragons and the army of Evil.
	if (EnterOW_Chapter2 ==  FALSE )
	{
		AI_Teleport(Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self, " DIA_Pyrokar_Nachricht_15_01 " );	// Therefore, I must go to the Valley of Mines and deliver this evidence to him.
		AI_Output(self,other, " DIA_Pyrokar_Nachricht_11_02 " );	// Good. You will follow this order. Paladin Sergio will escort you to the Passage.
		AI_Output(self,other, " DIA_Pyrokar_Nachricht_11_03 " );	// May Innos keep you.
		Sergio_Follow = TRUE;
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self, " DIA_Pyrokar_Nachricht_15_04 " );	// I'm going to the Valley of Mines.
		AI_Output(self,other, " DIA_Pyrokar_Nachricht_11_05 " );	// Good. Since you already know the way to the valley, you don't need an escort.
		AI_Output(self,other, " DIA_Pyrokar_Nachricht_11_06 " );	// Complete this task from Lord Hagen - may Innos keep you.
	};
};

instance DIA_Pyrokar_TEACH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 4;
	condition = DIA_Pyrokar_TEACH_Condition;
	information = DIA_Pyrokar_TEACH_Info;
	permanent = TRUE;
	description = " Teach me the sixth Circle of Magic. (Training Points: 100) " ;
};

func int DIA_Pyrokar_TEACH_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE ) ==  5 ) && (Chapter >=  5 ) && Npc_KnowsInfo(other,DIA_Pyrokar_Language));
	{
		if((MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS))
		{
			return TRUE;
		};
	};
};

func void DIA_Pyrokar_TEACH_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_TEACH_15_00 " );	// Teach me the last Circle of Magic.

	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if(B_TeachMagicCircle(self,other,6))
		{
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_01 " );	// A lot of time has passed since you bonded with Fire. Much has happened since then, but there is still no rest.
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_02 " );	// You are the Chosen One of Innos. And you will need all your strength to win this battle.
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_03 " );	// I initiate you, oh Chosen One. You enter the sixth Circle - may you bring light with you and dispel the darkness.
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_04 " );	// Now you can learn the formulas for this last circle from me, if you so desire.
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_05 " );	// Oh - and one more thing. It took me a while to recognize you.
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_06 " );	// You received this letter from me when they threw you over the Barrier.
			AI_Output(other,self, " DIA_Pyrokar_TEACH_15_07 " );	// Yes, you thus saved me from the idle chatter of the judge.
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_08 " );	// And you are the Chosen One of Innos.
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_09 " );	// Receive my blessing now, O Chosen One!
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_10 " );	// Innos, light of the sun and fire of the tree, bless this man, your chosen servant.
			AI_Output(self,other, " DIA_Pyrokar_TEACH_11_11 " );	// Give him courage, strength, and wisdom to follow the path you have set for him.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_TEACH_11_12 " );	// The time has not yet come for this. When you have gone a little further down the path that Innos will show you, I will teach you.
	};
};


instance DIA_Pyrokar_SPELLS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SPELLS_Condition;
	information = DIA_Pyrokar_SPELLS_Info;
	permanent = TRUE;
	description = " Teach me how to make runes. " ;
};

func int DIA_Pyrokar_SPELLS_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && ( Npc_GetTalentSkill (other, NPC_TALENT_MAGE ) >=  6 ) && Npc_KnowsInfo(other,DIA_Pyrokar_Speak ) && ( ( PLAYER_TALENT_RUNES [ SPL_Firerain ] ==  FALSE ) || ))) 
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPELLS_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Обучи меня.
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
	Info_AddChoice(DIA_Pyrokar_SPELLS,Dialog_Back,DIA_Pyrokar_SPELLS_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Pyrokar_SPELLS_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_FireMeteor] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,b_buildlearnstringforrunes(NAME_SPL_FireMeteor,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FireMeteor)),DIA_Pyrokar_SPELLS_FireMeteor);
	};
};

func void DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
};

func void DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Pyrokar_SPELLS_FireMeteor()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FireMeteor);
};

instances of DIA_Pyrokar_Parlan (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 99;
	condition = DIA_Pyrokar_Parlan_Condition;
	information = DIA_Pyrokar_Parlan_Info;
	permanent = FALSE;
	description = " Parlan sent me. " ;
};

func int DIA_Pyrokar_Parlan_Condition()
{
	if (( hero . guild ==  GIL_KDF ) && ( Talk_Sends ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Parlan_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_Parlan_15_00 " );	// Parlan sent me. I want to increase my magical abilities
	AI_Output(self,other, " DIA_Pyrokar_Parlan_11_01 " );	// Well, you've learned a lot and your strength has grown. From now on, you will learn from me.
};


instance DIA_Pyrokar_TEACH_MANA(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 99;
	condition = DIA_Pyrokar_TEACH_MANA_Condition;
	information = DIA_Pyrokar_TEACH_MANA_Info;
	permanent = TRUE;
	description = " I want to increase my magical abilities. " ;
};


func int DIA_Pyrokar_TEACH_MANA_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && Npc_KnowsInfo(other,DIA_Pyrokar_Speech))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEACH_MANA_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_TEACH_MANA_15_00 " );	// I want to increase my magical abilities.
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};

func void DIA_Pyrokar_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other, " DIA_Pyrokar_TEACH_MANA_11_00 " );	// I can feel the magical energy flowing through you without any barriers. Even I can't show you how to increase it even more.
	};
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
};

func void DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};

func void DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};


instance DIA_Pyrokar_PERM(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PERM_Condition;
	information = DIA_Pyrokar_PERM_Info;
	permanent = TRUE;
	description = " (blessing) " ;
};


func int DIA_Pyrokar_PERM_Condition()
{
	if (Chapter >=  2 )
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PERM_Info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Pyrokar_PERM_15_00 " );	// Bless me, master.
	}
	else
	{
		AI_Output(other,self, " DIA_Pyrokar_PERM_15_01 " );	// How about a blessing? It wouldn't bother me.
	};
	if((Kapitel == 5) && (MIS_PyrokarClearDemonTower == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Pyrokar_PERM_11_02 " );	// May your final battle against our sworn enemy be crowned with success. May Innos be with you.
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_PERM_11_03 " );	// May Innos stand between you and the pain in all the unholy paths you are destined to walk.
	};
};


instance DIA_Pyrokar_KAP3_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP3_EXIT_Condition;
	information = DIA_Pyrokar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_BACKFROMOW(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_BACKFROMOW_Condition;
	information = DIA_Pyrokar_BACKFROMOW_Info;
	description = " I come from the old Valley of Mines. " ;
};

func int DIA_Pyrokar_BACKFROMOW_Condition()
{
	if ((Chapter >=  3 ) && (Chapter <  6 ) && ( MIS_OLDWORLD  ==  LOG_SUCCESS ) && (DarkPathStart ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_BACKFROMOW_15_00 " );	// I come from the old Valley of Mines.
	AI_Output(self,other, " DIA_Pyrokar_BACKFROMOW_11_01 " );	// What can you report?
	AI_Output(other,self, " DIA_Pyrokar_BACKFROMOW_15_02 " );	// The enemy has formed an army of orcs and dragons there.
	AI_Output(self,other, " DIA_Pyrokar_BACKFROMOW_11_03 " );	// We already learned this from Milten - but what about the royal cargo of ore?
	AI_Output(other,self, " DIA_Pyrokar_BACKFROMOW_15_04 " );	// The mines that mine in the valley can't satisfy the needs of the king.
	AI_Output(self,other, " DIA_Pyrokar_BACKFROMOW_11_05 " );	// The days are getting darker and the light of the sun is getting dimmer.
	AI_Output(other,self, " DIA_Pyrokar_BACKFROMOW_15_06 " );	// I was attacked by people in black cassocks.
	AI_Output(self,other, " DIA_Pyrokar_BACKFROMOW_11_07 " );	// I know! These are dark magicians, minions of Beliar. Beware of them! They will try to possess you.
	AI_Output(self,other, " DIA_Pyrokar_BACKFROMOW_11_08 " );	// By being possessed, you will no longer be yourself. Only here, in the monastery, can you find help. So be careful.

	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
		; _ _ _ _ _ _
	};
	if (( Npc_IsDead( Karras ) ==  FALSE ) && ( hero . guild ==  GIL_KDF ))
	{
		AI_Output(self,other, " DIA_Pyrokar_BACKFROMOW_11_09 " );	// I asked Karras to look into this issue. He will surely soon be able to better understand this problem, which will allow us to see more clearly.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry( TOPIC_DEMENTOREN , " Pyrokar ordered Karras to eliminate the threat posed by the dark mages. " );
	};

	AI_Output(self,other, " DIA_Pyrokar_BACKFROMOW_11_10 " );	// Remember, we must resist or we'll all be finished.
};


instance DIA_Pyrokar_GIVEINNOSEYE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 31;
	condition = DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information = DIA_Pyrokar_GIVEINNOSEYE_Info;
	description = " I've come to take the Eye of Innos. " ;
};


func int DIA_Pyrokar_GIVEINNOSEYE_Condition()
{
	if ((Chapter ==  3 ) && (Npc_HasItems(hero,ItWr_PermissionToWearInnosEye_MY) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_GIVEINNOSEYE_15_00 " );	// I've come to take the Eye of Innos.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_11_01 " );	// I see you've received permission personally from Lord Hagen to wear the Eye of Innos.

	if(DarkPathStartPyr == FALSE)
	{
		AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_11_02 " );	// But I'm afraid I'll have to disappoint you. We have become victims of the treacherous plan of the enemy.
		AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_11_03 " );	// The Eye of Innos was brazenly stolen from these sacred walls.

		if(hero.guild == GIL_KDF)
		{
			Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE, " Who could do such a daring thing, master? " ,DIA_Pyrokar_GIVEINNOSEYE_wer);
		}
		else
		{
			Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE, " Who did this? " ,DIA_Pyrokar_GIVEINNOSEYE_wer);
		};
	}
	else
	{
		B_GivePlayerXP(300);
		AI_Output(other,self, " DIA_Pyrokar_GIVEINNOSEYE_Bad_01_01 " );	// As you can see.
		AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_Bad_01_02 " );	// Good! Then you can take it. Here, now it's yours.
		B_GiveInvItems(self,other,ItMi_InnosEye_Bad,1);
		AI_Output(other,self, " DIA_Pyrokar_GIVEINNOSEYE_Bad_01_03 " );	// Thank you, master.
		AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_Bad_01_04 " );	// Save it! And remember that such things must never fall into the hands of evil.
		AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_Bad_01_05 " );	// Now go. May Innos sanctify your path, my son...
		; _ _ _ _ _ _
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(DMT_2200_DarkSpeaker,"Circle");
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Pyrokar_GIVEINNOSEYE_wer_15_00 " );	// Who could do such a daring thing, master?
	}
	else
	{
		AI_Output(other,self, " DIA_Pyrokar_GIVEINNOSEYE_wer_15_01 " );	// Who did this?
	};

	AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_wer_11_02 " );	// Evil is insidious, and usually operates in secret. It is extremely rare to see how it crawls into the light of day to openly carry out its machinations.
	AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_wer_11_03 " );	// But things are different these days. The enemy now operates openly on every street, in every house and in every square.
	AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_wer_11_04 " );	// This can only mean that he is no longer afraid of his opponent, and is not going to back down from anything.
	AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_wer_11_05 " );	// One of our most loyal followers, a candidate for the sacred robe of the Fire Mage, suddenly changed his faith and did so in a defiantly diabolical manner. This is Pedro.
	AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_wer_11_06 " );	// The enemy has taken possession of it, thus inflicting a terrible defeat on all of us.
	AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_wer_11_07 " );	// Pedro cut his way with his sword into our most sacred chambers and stole the Eye.
	AI_Output(self,other, " DIA_Pyrokar_GIVEINNOSEYE_wer_11_08 " );	// I'm afraid he just spent too much time alone, behind the gates and protective walls of the monastery, open to dangers of all kinds.
	Pedro.flags = 0;
	Pedro_Traitor = TRUE;
	B_LogEntry( TOPIC_INNOSEYE , " Incredible. Although I expected something like this. I'm too late, those stupid people from the monastery allowed some acolyte to steal the Eye, and now I have to chase the traitor Pedro and hope he hasn't sold the Eye to someone yet . " );
	MIS_TraitorPedro = LOG_Running;
	Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_Running);
	B_LogEntry(TOPIC_TraitorPedro, " The traitor Pedro stole the Eye of Innos from the monastery. I understand the Firebenders are now going out of their way to find this traitor. " );
};

instance DIA_Pyrokar_NOVIZENCHASE (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 34;
	condition = DIA_Pyrokar_NOVIZENCHASE_Condition;
	information = DIA_Pyrokar_NOVIZENCHASE_Info;
	description = " Where did this thief go? " ;
};


func int DIA_Pyrokar_NOVIZENCHASE_Condition()
{
	if ((Capital ==  3 ) && (Peter_Traitor ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_NOVIZENCHASE_15_00 " );	// Where did this thief run?
	AI_Output(self,other, " DIA_Pyrokar_NOVIZENCHASE_11_01 " );	// Pedro killed several acolytes who tried to stop him and vanished into the morning mist.
	AI_Output(self,other, " DIA_Pyrokar_NOVIZENCHASE_11_02 " );	// Many acolytes chase after him to bring the Eye back to its rightful place.
	AI_Output(self,other, " DIA_Pyrokar_NOVIZENCHASE_11_03 " );	// If you want to catch up with them, hurry up before Pedro gets out of reach.
	MIS_NoviceChase = LOG_Running;
};


instance DIA_Pyrokar_FOUNDINNOSEYE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 35;
	condition = DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information = DIA_Pyrokar_FOUNDINNOSEYE_Info;
	description = " I found the Eye of Innos. " ;
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition()
{
	if ((Kapitel ==  3 ) && (MIS_NovizenChase == LOG_Running) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_FOUNDINNOSEYE_15_00 " );	// I found the Eye of Innos. He's damaged.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_11_01 " );	// But... that can't be. What happened?
	AI_Output(other,self, " DIA_Pyrokar_FOUNDINNOSEYE_15_02 " );	// He got his hands on the customers of a very disgusting kind. It so happened that I arrived too late.
	AI_Output(other,self, " DIA_Pyrokar_FOUNDINNOSEYE_15_03 " );	// They performed a strange rite on a crescent-shaped pedestal in the forest here.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_11_04 " );	// May Innos be with us! They have desecrated our Circle of the Sun.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_11_05 " );	// Even in my worst nightmares, I could not imagine that they had such power.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	MIS_NoviceChase = LOG_SUCCESS ;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE, " What can we do now? " ,DIA_Pyrokar_FOUNDINNOSEYE_was);
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was()
{
	AI_Output(other,self, " DIA_Pyrokar_FOUNDINNOSEYE_was_15_00 " );	// What can we do now?
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_was_11_01 " );	// The enemy has become very strong. But still, this ancient artifact posed a serious threat to him.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_was_11_02 " );	// We must heal the Eye and restore its former strength. But time is working against us.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_was_11_03 " );	// I can't even imagine what awaits all of us now. Without the protection of the Eye, we are helpless and completely in the hands of the enemy.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_was_11_04 " );	// Go to the city, to Vatras, the mage of Water. In this terrible situation, only he knows what to do. Take the Eye to him, and hurry.
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,Dialog_Back,DIA_Pyrokar_FOUNDINNOSEYE_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE, " Why Watras? " ,DIA_Pyrokar_FOUNDINNOSEYE_was_vatras);
	};
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE, " What is the Circle of the Sun? " ,DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis);
	B_LogEntry( TOPIC_INNOSEYE , " Pyrocar wants me to ask the watermage Vatras in town for advice on what to do about the damaged Eye. " );
	MIS_Pyrokar_GoToVatrasInnoseye = LOG_Running;
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras()
{
	AI_Output(other,self, " DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00 " );	// Why Vatras?
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01 " );	// The privilege of wearing a mage's robe doesn't give you the right to discuss my orders, brother.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02 " );	// Vatras servant of Adanos. Only the knowledge of the Water Mages can bring us clarity in this dark hour.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03 " );	// That's all you need to know.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis()
{
	AI_Output(other,self, " DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00 " );	// What is the Circle of the Sun?
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01 " );	// Every year, all the magicians and novices of the monastery go to this place during the solstice to mark the beginning of a new cycle.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02 " );	// This place is filled with the immeasurable power of the sun.
	AI_Output(self,other, " DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03 " );	// I never even had such an idea that this force can be reversed. And yet it happened.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter()
{
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
};


instance DIA_Pyrokar_SPOKETOVATRAS (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information = DIA_Pyrokar_SPOKETOVATRAS_Info;
	description = " I spoke to Vatras. " ;
};


func int DIA_Pyrokar_SPOKETOVATRAS_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_SPOKETOVATRAS_15_00 " );	// I spoke with Vatras.
	AI_Output(self,other, " DIA_Pyrokar_SPOKETOVATRAS_11_01 " );	// Ah, good. Where is he?
	AI_Output(other,self, " DIA_Pyrokar_SPOKETOVATRAS_15_02 " );	// He prepares a ritual in the Circle of the Sun to heal the Eye of Innos.
	AI_Output(self,other, " DIA_Pyrokar_SPOKETOVATRAS_11_03 " );	// If this is true, then maybe we still have a network of hope.
	AI_Output(other,self, " DIA_Pyrokar_SPOKETOVATRAS_15_04 " );	// Vatras wants Xardas and you to help him with this.
	AI_Output(self,other, " DIA_Pyrokar_SPOKETOVATRAS_11_05 " );	// WHAT? Will Xardas be there too? You are not serious.
	AI_Output(other,self, " DIA_Pyrokar_SPOKETOVATRAS_15_06 " );	// Listen. This is not my decision. Vatras insists.
	AI_Output(self,other, " DIA_Pyrokar_SPOKETOVATRAS_11_07 " );	// Always and everywhere this Xardas. I'm tired of this. Nothing could be worse.
	AI_Output(self,other, " DIA_Pyrokar_SPOKETOVATRAS_11_08 " );	// How do I know this Xardas is not in league with our enemy?
	AI_Output(self,other, " DIA_Pyrokar_SPOKETOVATRAS_11_09 " );	// I can't trust Xardas. And it doesn't matter that we need it so much.
	AI_Output(self,other, " DIA_Pyrokar_SPOKETOVATRAS_11_10 " );	// Sorry, but I can't help Vatras under these conditions.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Pyrokar_XARDASVERTRAUEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information = DIA_Pyrokar_XARDASVERTRAUEN_Info;
	description = " It won't work without you! " ;
};


func int DIA_Pyrokar_XARDASVERTRAUEN_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pyrokar_BACK_SPOKE ) && ( Capital ==  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_XARDASVERTRAUEN_15_00 " );	// It won't work without you! Vatras will not be able to perform this ritual.
	AI_Output(other,self, " DIA_Pyrokar_XARDASVERTRAUEN_15_01 " );	// You must trust Xardas.
	AI_Output(self,other, " DIA_Pyrokar_XARDASVERTRAUEN_11_02 " );	// I can't help it, do you hear? I don't have the slightest proof that Xardas isn't working against us. I can not do it.
	AI_Output(other,self, " DIA_Pyrokar_XARDASVERTRAUEN_15_03 " );	// What if I bring you proof?
	AI_Output(self,other, " DIA_Pyrokar_XARDASVERTRAUEN_11_04 " );	// I'm afraid that's not possible. It must be something that will really shock me.
	AI_Output(self,other, " DIA_Pyrokar_XARDASVERTRAUEN_11_05 " );	// As for Xardas, I have serious doubts that he can impress me at all.
	B_LogEntry( TOPIC_INNOSEYE , "The Pyrocar gets shivers when he hears about Xardas. I should discuss with Xardas how to get the Pyrocar to participate in the Circle of the Sun ritual. " );
	Pyrokar_DeniesInnosEyeRitual = TRUE;
};


instance DIA_Pyrokar_BUCHZURUECK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_BUCHZURUECK_Condition;
	information = DIA_Pyrokar_BUCHZURUECK_Info;
	description = " I brought this book from Xardas. " ;
};


func int DIA_Pyrokar_BUCHZURUECK_Condition()
{
	if (Npc_HasItems(other,ItWr_XardasBookForPyrokar_Mis) && (Kapitel ==  3 ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHZURUECK_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_BUCHZURUECK_15_00 " );	// I brought this book from Xardas.
	AI_Output(other,self, " DIA_Pyrokar_BUCHZURUECK_15_01 " );	// This is a sign of his trust.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Покажи.
	B_GiveInvItems(other,self,ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems(self,ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output(self,other, " DIA_Pyrokar_BUCHZURUECK_11_03 " );	// (amazed) But this is unbelievable! Do you have any idea what you just gave me?
	AI_Output(other,self, " DIA_Pyrokar_BUCHZURUECK_15_04 " );	// Eee. No.
	AI_Output(self,other, " DIA_Pyrokar_BUCHZURUECK_11_05 " );	// (angrily) This is an ancient, long-lost tome from days long past.
	AI_Output(self,other, " DIA_Pyrokar_BUCHZURUECK_11_06 " );	// We all thought he was lost forever, and now I find out that Xardas knew all along what became of him.
	AI_Output(other,self, " DIA_Pyrokar_BUCHZURUECK_15_07 " );	// So you'll be attending the ritual?
	AI_Output(self,other, " DIA_Pyrokar_BUCHZURUECK_11_08 " );	// Yes, I'm going to the Circle of the Sun, but certainly not because I'm convinced of the good intentions of Xardas.
	AI_Output(self,other, " DIA_Pyrokar_BUCHZURUECK_11_09 " );	// Actually, I'm going to have this jackal explain where he hid this book for so many years. This time he definitely went too far.
	AI_Output(self,other, " DIA_Pyrokar_BUCHZURUECK_11_10 " );	// See you in the Circle of the Sun.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	B_LogEntry( TOPIC_INNOSEYE , " Pyrocar has finally agreed to go to the Circle of the Sun. " );
	Pyrokar_GoesToRitualInnosEye = TRUE;
};


instance DIA_Pyrokar_PRERITUAL (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_PRERITUAL_Condition;
	information = DIA_Pyrokar_PRERITUAL_Info;
	permanent = TRUE;
	description = " Do you think you can repair the Eye? " ;
};


func int DIA_Pyrokar_PRERITUAL_Condition()
{
	if((Pyrokar_GoesToRitualInnosEye == TRUE) && (MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PRERITUAL_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_PRERITUAL_15_00 " );	// Do you think you can restore the Eye?
	AI_Output(self,other, " DIA_Pyrokar_PRERITUAL_11_01 " );	// Hard to say. Wait and see.
};


instance DIA_Pyrokar_EYE HEALED (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_AUGEGEHEILT_Condition;
	information = DIA_Pyrokar_EYEHEALED_Info;
	description = " You did it. Innos' eye is healed. " ;
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_EYEHEALED_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_AUGEGEHEILT_15_00 " );	// You did it! Innos' eye is healed.
	AI_Output(self,other, " DIA_Pyrokar_AUGEGEHEILT_11_01 " );	// I almost didn't believe it was possible.

	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Pyrokar_AUGEGEHEILT_15_02 " );	// Yes, master.
		AI_Output(self,other, " DIA_Pyrokar_AUGEGEHEILT_11_03 " );	// You've proven time and time again that you're ready to join the Supreme Order of the Firebenders.
		AI_Output(self,other, " DIA_Pyrokar_AUGEGEHEILT_11_04 " );	// From this day forward, you are a member of the Council and will represent our Order around the world. Now you are one of the highest Fire Mages.
		AI_Output(self,other, " DIA_Pyrokar_AUGEGEHEILT_11_05 " );	// Wear this sacred robe and magical staff with dignity. Bring order, honor and glory to the world, my brother!
		CreateInvItem(hero,ItMW_Addon_Stab01);
		CreateInvItems(self,ItAr_KDF_H,1);
		B_GiveInvItems(self,other,ItAr_KDF_H,1);
		heroGIL_KDF2 = TRUE;
	};
};

instance DIA_Pyrokar_KAP3_READY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_KAP3_READY_Condition;
	information = DIA_Pyrokar_KAP3_READY_Info;
	description = " What's left for me to do here? " ;
};

func int DIA_Pyrokar_KAP3_READY_Condition()
{
	if ((Capital ==  3 ) && Npc_KnowsInfo(other,DIA_Pyrokar_AUGEGEHEILT)) .
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_READY_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_KAP3_READY_15_00 " );	// What do I have to do here?
	AI_Output(self,other, " DIA_Pyrokar_KAP3_READY_11_01 " );	// Don't waste your time on trivial things. Go and destroy the dragons! Here, take the Eye.
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems(self,other,ItMi_InnosEye_MIS,1);
	AI_Output(self,other, " DIA_Pyrokar_KAP3_READY_11_02 " );	// Remember that you need to talk to the dragon first before you can attack it.
	AI_Output(self,other, " DIA_Pyrokar_Add_11_01 " );	// The power of the Eye will make the dragons speak to you, and speak the truth.
	AI_Output(self,other, " DIA_Pyrokar_Add_11_02 " );	// In addition, it will give protection from their attacks.
	AI_Output(self,other, " DIA_Pyrokar_KAP3_READY_11_05 " );	// However, its power is not eternal. You will have to replenish it again with magical energy.
	AI_Output(self,other, " DIA_Pyrokar_KAP3_READY_11_06 " );	// To do this, you'll need an Essence from the Dragon's Heart, which you need to combine with the Eye on the Alchemy Table.
	AI_Output(self,other, " DIA_Pyrokar_KAP3_READY_11_07 " );	// Only then will you be able to approach the next dragon.
	AI_Output(other,self, " DIA_Pyrokar_KAP3_READY_15_08 " );	// Thank you. I will remember this.
	AI_Output(self,other, " DIA_Pyrokar_KAP3_READY_11_09 " );	// Now you have everything you need. Come on, you don't have much time!
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP(XP_Ambient);
	CreateInvItems(Gorax,ItMi_RuneBlank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_Running);
	B_LogEntry( TOPIC_DRACHENJAGD , " Now I'm ready to face the dragons. The eye of Innos will help me destroy them. But before I fight the dragons, I must remember to put it on. I must talk to the dragons before I start the fight. The problem is that the Eye loses its power every time I talk to one of them.To restore the power of this amulet, I need the heart of the dragon and an empty beaker.I must combine the weakened stone and the extract from the dragon's heart on the alchemy table before confronting the other dragon. " );
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_500_Pyrokar,"Start");
	B_Chapter Change( 4 , NEWWORLD_ZEN );
	B_Chapter4_OneTime = TRUE;
	IntroduceCH_04 = TRUE;
};


instance DIA_Pyrokar_BUCHDERBESSENEN (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 39;
	condition = DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information = DIA_Pyrokar_BOOKOFBESSENEN_Info;
	description = " I found a strange almanac. " ;
};


func int DIA_Pyrokar_BUCHDERBESSENEN_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pyrokar_BACKFROMOW ) & & Npc_HasItems ( other , ITWR_DementorObsessionBook_MIS ) & & ( DarkPathStart == FALSE  ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_BUCHDERBESSENEN_15_00 " );	// I found a strange almanac.
	AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSENEN_11_01 " );	// Yes? What is an almanac?
	AI_Output(other,self, " DIA_Pyrokar_BUCHDERBESSENEN_15_02 " );	// I'm not sure. I thought you might know what to do with it.
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSENEN_11_03 " );	// Truly, this is a very disturbing sign. I'm glad you brought it to me. It was wise.
	B_GivePlayerXP(XP_Ambient);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSENEN_11_04 " );	// I guess it's not the only one. Go and find some more of these curse books.
		AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSEN_11_05 " );	// I suspect this is a tool of the dark magicians.
		AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSENEN_11_06 " );	// They use it to control the lost souls of their victims.
		AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSEN_11_07 " );	// They apparently write the names of those they plan to possess in these books.
		AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSENEN_11_08 " );	// Listen. I will give you this magical letter. It will show you the names written in these books.
		CreateInvItems(self,ItWr_PyrokarsObsessionList,1);
		B_GiveInvItems(self,other,ItWr_PyrokarsObsessionList,1);
		AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSENEN_11_09 " );	// Find these victims and bring me their books. I will get rid of them.
		if (Npc_IsDead(Karras) ==  FALSE )
		{
			AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSEN_11_10 " );	// But first you must show at least one of them to Karras. Maybe it will help him in his research.
		};
		AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSEN_11_11 " );	// And don't make the mistake of trying to destroy them yourself. You are not yet ready to withstand their power.
		; _ _ _ _ _ _
	};
	AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSEN_11_12 " );	// Don't get close to them or they'll take you.
	AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSEN_11_13 " );	// If you find yourself unable to resist their call, return to me as soon as possible.
	AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSEN_11_14 " );	// Only here, in the monastery, can your soul be saved.
	if (( Npc_IsDead( Karras ) ==  FALSE ) && ( hero . guild ==  GIL_KDF ))
	{
		AI_Output(other,self, " DIA_Pyrokar_BUCHDERBESSENEN_15_15 " );	// Is there any defense against their mental attacks?
		AI_Output(self,other, " DIA_Pyrokar_BUCHDERBESSEN_11_16 " );	// Protection possible. Karras might know something about it.
		Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
		B_LogEntry( TOPIC_DEMENTOREN , " Karras should help me find protection against the dark wanderers' mental attacks. " );
	};
};

instance DIA_Pyrokar_SCOBSESSED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 70;
	condition = DIA_Pyrokar_SCOBSESSED_Condition;
	information = DIA_Pyrokar_SCOBSESSED_Info;
	permanent = TRUE;
	description = " I think I'm possessed. Can you heal me? " ;
};

func int DIA_Pyrokar_SCOBSESSED_Condition()
{
	if(SC_IsObsessed == TRUE)
	{
		return TRUE;
	};
};


var int Got_HealObsession_Day;

func void DIA_Pyrokar_SCOBSESSED_Info()
{
	if(((Got_HealObsession_Day <= (Wld_GetDay() - 2)) || (Got_HealObsession_Day == 0)) && (Npc_HasItems(other,ItPo_HealObsession_MIS) == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self, " DIA_Pyrokar_SCOBSESSED_15_00 " );	// Heal me, master, for I am possessed.
			AI_Output(self,other, " DIA_Pyrokar_SCOBSESSED_11_01 " );	// So be it! Take this potion. It will save you from nightmares.
			AI_Output(self,other, " DIA_Pyrokar_SCOBSESSED_11_02 " );	// May Innos deliver you from this misfortune.
			AI_Output(self,other, " DIA_Pyrokar_SCOBSESSED_11_03 " );	// Act on his behalf and beware of the enemy's black gaze.
			if(SC_ObsessionTimes > 3)
			{
				AI_Output(self,other, " DIA_Pyrokar_SCOBSESSED_11_04 " );	// But I warn you - if you fall into their web too often, there may be no return. Always remember this.
			};
			CreateInvItems(self,ItPo_HealObsession_MIS,10);
			B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
			Got_HealObsession_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self, " DIA_Pyrokar_SCOBSESSED_15_05 " );	// I think I'm obsessed. Can you heal me?
			AI_Output(self,other, " DIA_Pyrokar_SCOBSESSED_11_06 " );	// Subject to your respect for this monastery, my son. Three hundred gold coins!
			Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
			Info_AddChoice(DIA_Pyrokar_SCOBSESSED, " This is too much. " ,DIA_Pyrokar_SCOBSESSED_nein);
			Info_AddChoice(DIA_Pyrokar_SCOBSESSED, " Great! Here's the money. " ,DIA_Pyrokar_SCOBSESSED_ok);
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Pyrokar_SCOBSESSED_15_05 " );	// I think I'm obsessed. Can you heal me?
		AI_Output(self,other, " DIA_Pyrokar_SCOBSESSED_11_07 " );	// But you just got a healing potion. Only contact me if you really need help.
	};
};

func void DIA_Pyrokar_SCOBSESSED_ok()
{
	AI_Output(other,self, " DIA_Pyrokar_SCOBSESSED_ok_15_00 " );	// Great! Here's the money.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other, " DIA_Pyrokar_SCOBSESSED_ok_11_01 " );	// Here, drink this. May Innos deliver you from this misfortune.
		CreateInvItems(self,ItPo_HealObsession_MIS,10);
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
		Got_HealObsession_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_SCOBSESSED_ok_11_02 " );	// Bring me the money and I can help you.
	};
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_no()
{
	AI_Output(other,self, " DIA_Pyrokar_SCOBSESSED_nein_15_00 " );	// This is too much.
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};


instance DIA_PYROKAR_GIVEHEALPOTIONS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 71;
	condition = dia_pyrokar_givehealpotions_condition;
	information = dia_pyrokar_givehealpotions_info;
	permanent = TRUE;
	description = " I need medicine for headaches. " ;
};

func int dia_pyrokar_givehealpotions_condition()
{
	if(MIS_SEKTEHEILEN == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pyrokar_givehealpotions_info()
{
	AI_Output(other,self, " DIA_Pyrokar_GiveHealPotions_01_00 " );	// I need medicine for headaches.
	if(FIRSTGIVEHEALPOTIONS == FALSE)
	{
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_01_01 " );	// (irritated) Is there a sign of a healer at the entrance to the monastery?
		AI_Output(other,self, " DIA_Pyrokar_GiveHealPotions_01_02 " );	// I don't think these are just headaches. This is more like the first signs of possession!
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_01_03 " );	// Well, if so, then you've come to the right place. We really have one remedy that can save you from this disease.
		AI_Output(other,self, " DIA_Pyrokar_GiveHealPotions_01_04 " );	// Well, not exactly me. I think I will need a large amount of this medicine.
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_01_05 " );	// Good! But you will have to pay for it, as a token of your respect for this monastery.
		AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_06");	//Сколько?
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_01_07 " );	// Three hundred coins per drink.
		FIRSTGIVEHEALPOTIONS = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_01_08 " );	// Like I told you, it costs three hundred coins for one drink.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
	Info_AddChoice(dia_pyrokar_givehealpotions, " That's too much! " ,dia_pyrokar_givehealpotions_nein);
	Info_AddChoice(dia_pyrokar_givehealpotions, " Ok! I'll take one. " ,dia_pyrokar_givehealpotions_ok_1);
	Info_AddChoice(dia_pyrokar_givehealpotions, " Okay! I'll take five. " ,dia_pyrokar_givehealpotions_ok_5);
	Info_AddChoice(dia_pyrokar_givehealpotions, " Ok! I'll take ten. " ,dia_pyrokar_givehealpotions_ok_10);
};

func void dia_pyrokar_givehealpotions_no()
{
	AI_Output(other,self, " DIA_Pyrokar_GiveHealPotions_nein_01_00 " );	// That's too much!
	AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_nein_01_01 " );	// As you say.
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_1()
{
	AI_Output(other,self, " DIA_Pyrokar_GiveHealPotions_ok_1_01_00 " );	// Good! I'll take one.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_ok_1_01_01 " );	// Here, take this drink. He will deliver the sufferer from this black infection!
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_ok_1_01_02 " );	// Bring me money and you'll get help.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_5()
{
	AI_Output(other,self, " DIA_Pyrokar_GiveHealPotions_ok_5_01_00 " );	// Good! I'll take five.
	if(B_GiveInvItems(other,self,ItMi_Gold,1500))
	{
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_ok_5_01_01 " );	// Here, take these drinks. They will save the sufferers from this black infection!
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,5);
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_ok_5_01_02 " );	// Bring me money and you'll get help.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_10()
{
	AI_Output(other,self, " DIA_Pyrokar_GiveHealPotions_ok_10_01_00 " );	// Good! I'll take ten.
	if(B_GiveInvItems(other,self,ItMi_Gold,3000))
	{
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_ok_10_01_01 " );	// Here, take these drinks. They will save the sufferers from this black infection!
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_GiveHealPotions_ok_10_01_02 " );	// Bring me money and you'll get help.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};


instance DIA_Pyrokar_AlmanachBringen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 5;
	condition = DIA_Pyrokar_AlmanachBringen_Condition;
	information = DIA_Pyrokar_AlmanachBringen_Info;
	permanent = TRUE;
	description = " I can tell you one more thing about these Possessed. " ;
};


func int DIA_Pyrokar_AlmanachBringen_Condition()
{
	if ((Chapter >=  3 ) && (DarkPathStart ==  FALSE ) && (Npc_HasItems(other,ITWR_DementorObsessionBook_MIS) >=  1 ) && Npc_KnowsInfo(other,DIA_Pyrokar_BOOKTHEREISSUES));
	{
		return TRUE;
	};
};


var int AlmanacCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info()
{
	var int AlmanacCount;
	var int XP_KDF_BringAlmanacs;
	var int AlmanachGeld;
	be int PyrokarsAlmanachOffer;
	AI_Output(other,self, " DIA_Pyrokar_AlmanachBringen_15_00 " );	// I can tell you a few more things about these Possessed.
	AI_Output(self,other, " DIA_Pyrokar_AlmanachBringen_11_01 " );	// Speak, brother.
	PyrokarsAlmanachOffer = 400;
	AlmanachCount = Npc_HasItems(other,ITWR_DementorObsessionBook_MIS);
	if(AlmanachCount == 1)
	{
		AI_Output(other,self, " DIA_Pyrokar_AlmanachBringen_15_02 " );	// I found another almanac.
		B_GivePlayerXP(XP_KDF_BringAlmanach);
		B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
		AlmanachCounter = AlmanachCounter + 1;
	}
	else
	{
		AI_Output(other,self, " DIA_Pyrokar_AlmanachBringen_15_03 " );	// I found some more dark wanderer books.
		B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,AlmanachCount);
		XP_KDF_BringAlmanachs = AlmanacCount * XP_KDF_BringAlmanach;
		AlmanachCounter = AlmanachCounter + AlmanachCount;
		B_GivePlayerXP(XP_KDF_BringAlmanacs);
	};
	if(AlmanachCounter <= 5)
	{
		AI_Output(self,other, " DIA_Pyrokar_AlmanachBringen_11_04 " );	// This is good. I'm afraid, however, that this is not all. Keep looking.
	}
	else if(AlmanachCounter <= 8)
	{
		AI_Output(self,other, " DIA_Pyrokar_AlmanachBringen_11_05 " );	// Many of them have already been found. But I don't think we've seized them all.
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_AlmanachBringen_11_06 " );	// You've already brought a whole bunch of those enemy books.
		AI_Output(self,other, " DIA_Pyrokar_AlmanachBringen_11_07 " );	// I'll be surprised if you can find more.
	};
	AI_Output(self,other, " DIA_Pyrokar_AlmanachBringen_11_08 " );	// Here, take this. This is a gift from the monastery that will help you resist evil.
	if(DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Pyrokar_AlmanachBringen_11_09 " );	// And don't forget to check my magic letter from time to time.
		AI_Output(self,other, " DIA_Pyrokar_AlmanachBringen_11_10 " );	// Perhaps they will try to do this with others whose names are not yet inscribed in the almanacs.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE;
	};
	AlmanachGeld = AlmanachCount * PyrokarsAlmanachOffer;
	CreateInvItems(self,ItMi_Gold,AlmanachGeld);
	B_GiveInvItems(self,other,ItMi_Gold,AlmanachGeld);
};


instance DIA_Pyrokar_KAP4_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP4_EXIT_Condition;
	information = DIA_Pyrokar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_KAP5_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP5_EXIT_Condition;
	information = DIA_Pyrokar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_DRACHENTOT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_DRACHENTOT_Condition;
	information = DIA_Pyrokar_DRACHENTOT_Info;
	description = " All dragons are dead. " ;
};


func int DIA_Pyrokar_DRACHENTOT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_DRACHENTOT_15_00 " );	// All dragons are dead.
	AI_Output(self,other, " DIA_Pyrokar_DRACHENTOT_11_01 " );	// This is really good news. But this does not change our situation at all, which seems hopeless.
	AI_Output(self,other, " DIA_Pyrokar_DRACHENTOT_11_02 " );	// The dark wanderers still haven't left. Rather the opposite! I hear more and more reports that over the past few days, their numbers have even increased.
	AI_Output(self,other, " DIA_Pyrokar_DRACHENTOT_11_03 " );	// Destroying the dragons has dealt a serious blow to the enemy, but it's not enough. We need to root out this evil.
};


instance DIA_Pyrokar_DERMEISTER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_DERMEISTER_Condition;
	information = DIA_Pyrokar_DERMEISTER_Info;
	description = " I've spoken to dragons. " ;
};


func int DIA_Pyrokar_DERMEISTER_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_DERMEISTER_15_00 " );	// I spoke with dragons.
	AI_Output(self,other, " DIA_Pyrokar_DERMEISTER_11_01 " );	// What did they say?
	AI_Output(other,self, " DIA_Pyrokar_DERMEISTER_15_02 " );	// They kept talking about their master's power and that he was in the Halls of Irdorath.
	AI_Output(self,other, " DIA_Pyrokar_DERMEISTER_11_03 " );	// May Innos be with us. The Black Temple has regained its strength and is now sending its minions to our world.
};


instance DIA_Pyrokar_WASISTIRDORATH (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_WASISTIRDORATH_Condition;
	information = DIA_Pyrokar_WASISTIRDORATH_Info;
	description = " What are these Halls of Irdorath? " ;
};


func int DIA_Pyrokar_WASISTIRDORATH_Condition()
{
	if ((Capital ==  5 ) && Npc_KnowsInfo(other,DIA_Pyrokar_DERMEISTER))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_WASISTIRDORATH_15_00 " );	// What are these Halls of Irdorath?
	AI_Output(self,other, " DIA_Pyrokar_WASISTIRDORATH_11_01 " );	// Eastern temple of summoning the god Beliar. In total, there are four of them on the land of Myrtana. But this one is probably the most terrible temple of all.
	AI_Output(self,other, " DIA_Pyrokar_WASISTIRDORATH_11_02 " );	// About forty years ago, the northern and western temples of this terrible deity were destroyed.
	AI_Output(self,other, " DIA_Pyrokar_WASISTIRDORATH_11_03 " );	// Courageous knights of that time gave everything to raze these majestic structures to the ground.
	AI_Output(self,other, " DIA_Pyrokar_WASISTIRDORATH_11_04 " );	// Then the black hordes of the enemy were powerless against their superior courage and number of knights and paladins.
	AI_Output(self,other, " DIA_Pyrokar_WASISTIRDORATH_11_05 " );	// It would be easy to destroy the remaining two temples to rid the land of evil forever...
	AI_Output(self,other, " DIA_Pyrokar_WASISTIRDORATH_11_06 " );	// ... but after the second temple fell, they simply dissolved.
	AI_Output(other,self, " DIA_Pyrokar_WASISTIRDORATH_15_07 " );	// (mockingly) Dissolved. The whole temple. Yes exactly.
	AI_Output(self,other, " DIA_Pyrokar_WASISTIRDORATH_11_08 " );	// Don't laugh. The situation is serious. The halls of Irdorath have indeed regained their strength, and now it will be very difficult to defeat the enemy.
	AI_Output(self,other, " DIA_Pyrokar_WASISTIRDORATH_11_09 " );	// Therefore, first you must find this temple, and I think this will be your next and hardest task.
	AI_Output(other,self, " DIA_Pyrokar_WASISTIRDORATH_15_10 " );	// Let's see.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath, " According to the Pyrokar, the Halls of Irdorath is a forgotten temple to summon the god Beliar. I must find this temple. " );
};


instance DIA_Pyrokar_BUCHIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 54;
	condition = DIA_Pyrokar_BUCHIRDORATH_Condition;
	information = DIA_Pyrokar_BUCHIRDORATH_Info;
	description = " The book of Xardas that was thought to be lost - where is it? " ;
};


func int DIA_Pyrokar_BUCHIRDORATH_Condition()
{
	if ((Capital ==  5 ) && (ItWr_HallsofIrdorathIsOpen ==  FALSE ) && Npc_KnowsInfo(other,DIA_Pyrokar_HOUSE OFIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_BUCHIRDORATH_15_00 " );	// The book of Xardas that was thought to be lost - where is it?
	AI_Output(self,other, " DIA_Pyrokar_BUCHIRDORATH_11_01 " );	// I expected you to ask this. But I'm afraid it will be of no use to you.
	AI_Output(self,other, " DIA_Pyrokar_BUCHIRDORATH_11_02 " );	// It's closed with magic. I took it to one of our cellars, but no matter how much we tried to open it, all in vain.
	AI_Output(self,other, " DIA_Pyrokar_BUCHIRDORATH_11_03 " );	// That damned Xardas played a dirty trick on us.
	AI_Output(other,self, " DIA_Pyrokar_BUCHIRDORATH_15_04 " );	// Can I see this book?
	AI_Output(self,other, " DIA_Pyrokar_BUCHIRDORATH_11_05 " );	// Be my guest. But I cannot imagine that you will succeed where the greatest mages of our monastery have failed.
	AI_Output(self,other, " DIA_Pyrokar_BUCHIRDORATH_11_06 " );	// But still you can try, Talamon won't stop you.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath, " Xardas' book 'HALLS OF IRDORATH' is in the lower cellars of the monastery. It is guarded by Talamon. The magicians could not open this book. It is closed with magic and they blame Xardas for this. " );
	Pyrokar_LetYouPassTalamon = TRUE;
};


instance DIA_Pyrokar_IRDORATHBOOKOPEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information = DIA_Pyrokar_IRDORATHBOOKOPEN_Info;
	description = " I was able to open the book of Xardas. " ;
};


func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition()
{
	if ((ItWr_HallsofIrdorathIsOpen ==  TRUE ) && (Chapter ==  5 ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_IRDORATHBOOKOPEN_15_00 " );	// I was able to open the book of Xardas.
	AI_Output(self,other, " DIA_Pyrokar_IRDORATHBOOKOPEN_11_01 " );	// What?! How did you do it? This is all driving me crazy!
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN, " Xardas told me a secret. " ,DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN, " Just blind luck I guess. " ,DIA_Pyrokar_IRDORATHBOOKOPEN_glueck);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck()
{
	AI_Output(other,self, " DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00 " );	// Just blind luck, I guess.
	AI_Output(self,other, " DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01 " );	// Don't talk nonsense. Luck!
	AI_Output(self,other, " DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02 " );	// Even if I couldn't open this book, and then someone like you comes along and playfully opens it...
	AI_Output(self,other, " DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03 " );	// ... this makes me sad...
	AI_Output(self,other, " DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04 " );	// Okay. Since you are obviously the only one who has been able to open this book, I would rather let you keep it. At least until we resolve this crisis.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas()
{
	AI_Output(other,self, " DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00 " );	// Xardas told me a secret.
	AI_Output(self,other, " DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01 " );	// Ah, that's it. How interesting. I can only hope that the evil influence of Xardas does not poison your soul.
	AI_Output(self,other, " DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02 " );	// I warn you. Don't fall for this old devil's tricks. You may regret this.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};


instance DIA_Pyrokar_SECRET LIBRARY (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information = DIA_Pyrokar_SECRET LIBRARY_Info;
	description = " This book mentions a secret library. " ;
};


func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition()
{
	if ((ItWr_SCReadsHallsofIrdorath ==  TRUE ) && (Chapter ==  5 ) && (MY_SCKnowsWayToIrdorath ==  FALSE ) && Npc_KnowsInfo(other,DAY_Pyrokar_IRDORATHBOOK))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SECRETLIBRARY_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00 " );	// This book mentions a secret library.
	AI_Output(self,other, " DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01 " );	// What are you talking about?
	AI_Output(other,self, " DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02 " );	// About the library under these walls. Doesn't that mean anything to you?
	AI_Output(self,other, " DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03 " );	// No. Where is this library supposed to be, you said?
	AI_Output(other,self, " DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04 " );	// Got it. You don't know anything about her. Mmm.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath, " Pyrocar doesn't know anything about the secret library. Looks like only Xardas has been there. " );
};


instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH (C_Info) .
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information = DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;
	description = " I know where to look for the Halls of Irdorath. " ;
};


func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition()
{
	if ((Chapter ==  5 ) && (MIS_SCKnowsWayToIrdorath ==  TRUE ) && Npc_KnowsInfo(other,DAY_Pyrokar_IRDORATHBOOK))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00 " );	// I know where to look for the Halls of Irdorath.
	AI_Output(other,self, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01 " );	// This temple is on an island. I found a nautical chart that will show the way.
	AI_Output(self,other, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02 " );	// This is great. Then you'll need a ship and a crew to get to that enemy.
	AI_Output(self,other, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03 " );	// But remember that you must prepare well if you want to destroy the Lord of Irdorath.
	AI_Output(other,self, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04 " );	// Where can I find the command?
	AI_Output(self,other, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05 " );	// Your team should be made up of people you can trust.
	AI_Output(self,other, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06 " );	// Talk to your friends and think about who can be useful to you on this island.
	AI_Output(self,other, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07 " );	// You'll probably need a mage there. But, unfortunately, I cannot single out a single person from the monastery.
	AI_Output(self,other, " DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08 " );	// You'll have to look for the mage outside of our walls.
};


instance DIA_Pyrokar_SCWILLJORGEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_SCWILLJORGEN_Condition;
	information = DIA_Pyrokar_SCWILLJORGEN_Info;
	description = " Jorgen is an experienced sailor. " ;
};


func int DIA_Pyrokar_SCWILLJORGEN_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Jorgen_Home ) && Npc_KnowsInfo ( other , DIA_Pyrokar_SCKNOWSWAYTOIRDORATH ) && ( Capital ==  5 )) ;
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_SCWILLJORGEN_15_00 " );	// Jorgen is an experienced sailor. He could help me get to Irdorath Island.
	AI_Output(self,other, " DIA_Pyrokar_SCWILLJORGEN_11_01 " );	// I'm afraid it won't be that easy.
	AI_Output(self,other, " DIA_Pyrokar_SCWILLJORGEN_11_02 " );	// He asked to work in our monastery. But he did not pay the entrance fee and did not bring the sheep.
	AI_Output(self,other, " DIA_Pyrokar_SCWILLJORGEN_11_03 " );	// Jorgen must finish his work first, and then you can take him if you wish.
	AI_Output(other,self, " DIA_Pyrokar_SCWILLJORGEN_15_04 " );	// How long will it take?
	AI_Output(self,other, " DIA_Pyrokar_SCWILLJORGEN_11_05 " );	// He ate a mountain of food the first day. This provision would have been enough for an ordinary novice for three weeks.
	AI_Output(self,other, " DIA_Pyrokar_SCWILLJORGEN_11_06 " );	// So I can't let him go until he's done three months in our gardens.
};


instance DIA_Pyrokar_MACHDTFREI(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_MACHDTFREI_Condition;
	information = DIA_Pyrokar_MACHDTFREI_Info;
	description = " What can I do so I can take Jorgen with me NOW? " ;
};


func int DIA_Pyrokar_MACHDTFREI_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pyrokar_SCWILLJORGEN ) && ( Chapter ==  5 )) .
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MACHDTFREI_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_MACHDTFREI_15_00 " );	// What can I do so I can take Jorgen with me NOW?
	AI_Output(self,other, " DIA_Pyrokar_MACHDTFREI_11_01 " );	// Mmm. Indeed, there is something you could do for me. Your good relationship with Xardas could help you with that.
	AI_Output(self,other, " DIA_Pyrokar_MACHDTFREI_11_02 " );	// Strange things have been going on in his tower for the past few days.
	AI_Output(self,other, " DIA_Pyrokar_MACHDTFREI_11_03 " );	// Many people heard loud screams in the night coming from there, and saw a strange light dancing above this tower.
	AI_Output(self,other, " DIA_Pyrokar_MACHDTFREI_11_04 " );	// Only this was not enough for us yet. Go check what's going on there and stop this mess.
	AI_Output(self,other, " DIA_Pyrokar_MACHDTFREI_11_05 " );	// Then you can take Jorgen.
	MIS_PyrokarClearDemonTower = LOG_Running;
	Log_CreateTopic(TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PyrokarClearDemonTower,LOG_Running);
	B_LogEntry(TOPIC_PyrokarClearDemonTower, " Strange things are going on with Xardas' tower. If I'm going to find out what's going on there, I can take Jorgen with me. " );
};


instance DIA_Pyrokar_DTCLEARED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_DTCLEARED_Condition;
	information = DIA_Pyrokar_DTCLEARED_Info;
	description = " The tower of Xardas won't bother anyone anymore. " ;
};


func int DIA_Pyrokar_DTCLEARED_Condition()
{
	if (Npc_IsDead(Xardas_DT_Demon1) && Npc_IsDead(Xardas_DT_Demon2) && Npc_IsDead(Xardas_DT_Demon3) && Npc_IsDead(Xardas_DT_Demon4) && Npc_IsDead(Xardas_DT_Demon5) && Npc_IsDead(Xardas_DT_DemonLord) && (MIS_PyrokarLog_RunningDemonTower ) == ClearLog
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DTCLEARED_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_DTCLEARED_15_00 " );	// The Tower of Xardas won't bother anyone anymore.
	AI_Output(self,other, " DIA_Pyrokar_DTCLEARED_11_01 " );	// So there was... no, wait, I don't even want to know.
	AI_Output(self,other, " DIA_Pyrokar_DTCLEARED_11_02 " );	// If you still need Jorgen, you can pick him up from the monastery.
	AI_Output(self,other, " DIA_Pyrokar_DTCLEARED_11_03 " );	// May Innos keep you.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_PyrokarClearDemonTower);
};


var int Pyro_Gives_Aura;

instance DIA_Pyrokar_AmulettofDeath(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = DIA_Pyrokar_AmulettofDeath_Condition;
	information = DIA_Pyrokar_AmulettofDeath_Info;
	permanent = TRUE;
	description = " The prophecy mentions the sacred Aura of Innos. " ;
};

func int DIA_Pyrokar_AmulettofDeath_Condition()
{
	if((PlayerGetsAmulettOfDeath == TRUE) && (Pyro_Gives_Aura == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_AmulettofDeath_15_00 " );	// The prophecy mentions the sacred Aura of Innos.
	AI_Output(self,other, " DIA_Pyrokar_AmulettofDeath_11_01 " );	// The Aura of Innos is an amulet that only the greatest magicians of all times and peoples can wear.
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,Dialog_Back,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath, " Can I have him? " ,DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath, " What does this amulet do? " ,DIA_Pyrokar_AmulettofDeath_Amulett);
};

func void DIA_Pyrokar_AmulettofDeath_BAck()
{
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
};

func void DIA_Pyrokar_AmulettofDeath_CanHaveIt()
{
	AI_Output(other,self, " DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00 " );	// Can I have it?
	AI_Output(self,other, " DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01 " );	// What? What are you going to do with it?
	AI_Output(other,self, " DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02 " );	// Take on the dragons.
	AI_Output(self,other, " DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03 " );	// Yes, of course. I will give you this amulet, but handle it with care.
	AI_Output(other,self, " DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04 " );	// Yes, of course.
	AI_Output(self,other, " DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05 " );	// I don't want to have to buy it back from some merchant later.
	AI_Output(self,other, " DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06 " );	// Use it wisely, and may Innos keep you.
	CreateInvItems(self,ItAm_AmulettOfDeath_Mis,1);
	B_GiveInvItems(self,other,ItAm_AmulettOfDeath_Mis,1);
	Pyro_Gives_Aura = TRUE;
};

func void DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output(other,self, " DIA_Pyrokar_AmulettofDeath_Amulett_15_00 " );	// What does this amulet do?
	AI_Output(self,other, " DIA_Pyrokar_AmulettofDeath_Amulett_11_01 " );	// It is said that Innos personally forged it and gave it to mankind.
	AI_Output(self,other, " DIA_Pyrokar_AmulettofDeath_Amulett_11_02 " );	// It protects its wearer from all types of damage.
};


instance DIA_Pyrokar_PotionofDeath(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = DIA_Pyrokar_PotionofDeath_Condition;
	information = DIA_Pyrokar_PotionofDeath_Info;
	permanent = TRUE;
	description = " What are the Tears of Innos? " ;
};


func int DIA_Pyrokar_PotionofDeath_Condition()
{
	if(Npc_HasItems(other,ItPo_PotionOfDeath_01_Mis))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_PotionofDeath_15_00 " );	// What are Tears of Innos?
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_11_01 " );	// Tears of Innos are nothing more than old children's tales. They say how at the beginning of time a battle broke out between Innos and Beliar.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, " I understand. " ,DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, " I found this potion. " ,DIA_Pyrokar_PotionofDeath_Potion);
};

func void DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output(other,self, " DIA_Pyrokar_PotionofDeath_Aha_15_00 " );	// I understand.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Aha_11_01 " );	// I don't know if you understand the gravity of our situation, but I doubt very much that our enemy can be defeated with children's stories.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Potion()
{
	AI_Output(other,self, " DIA_Pyrokar_PotionofDeath_Potion_15_00 " );	// I found this potion.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Potion_11_01 " );	// This can't be! I can not believe it!
	AI_Output(other,self, " DIA_Pyrokar_PotionofDeath_Potion_15_02 " );	// What's wrong?
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Potion_11_03 " );	// If these are indeed the Tears of Innos, then...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//Вряд ли.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Potion_11_05 " );	// Don't interrupt me! If these are indeed the Tears of Innos, then we have received a formidable weapon against the enemy.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,Dialog_Back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, " So what are those Tears of Innos? " ,DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, " What do you mean by 'weapon'? " ,DIA_Pyrokar_PotionofDeath_Weapon);
};

func void DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output(other,self, " DIA_Pyrokar_PotionofDeath_Teardrops_15_00 " );	// So what are these Tears of Innos?
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Teardrops_11_01 " );	// When Innos realized that he would have to fight Beliar, his own brother, in order to save what had been created, his sadness was great.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Teardrops_11_02 " );	// Tears flowed from his eyes and fell into our world. There were many of them, for his heart was filled with sorrow, and he wept for thirteen years.
	AI_Output(other,self, " DIA_Pyrokar_PotionofDeath_Teardrops_15_03 " );	// Get to the point.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Teardrops_11_04 " );	// People who found his tears and tasted them gained supernatural strength and clarity of mind. They recognized the wisdom of Innos, the Creator, and began to serve him.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Teardrops_11_05 " );	// They became the first members of the Brotherhood of Fire! These tears gave them strength, courage and wisdom. But that was a long time ago, and more than two hundred and fifty years have passed since the Tears of Innos were last seen.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Weapon()
{
	AI_Output(other,self, " DIA_Pyrokar_PotionofDeath_Weapon_15_00 " );	// What do you mean by weapon?
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Weapon_11_01 " );	// Legend says that under the influence of this substance, the warriors of Innos could perform almost supernatural deeds.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Weapon_11_02 " );	// They knew no fatigue, and they had the strength of two bears.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Weapon_11_03 " );	// The greatest heroic deeds of yesteryear were only made possible by the Tears of Innos.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//Понятно.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Weapon_11_05 " );	// But these tears can also bring suffering and death. Only members of our order may drink them.
	AI_Output(self,other, " DIA_Pyrokar_PotionofDeath_Weapon_11_06 " );	// Any other - even our Lord's paladin - will face a painful death.
	Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems(hero,ItPo_PotionOfDeath_02_Mis,1);
};

instance DIA_Pyrokar_KAP6_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP6_EXIT_Condition;
	information = DIA_Pyrokar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_PICKPOCKET(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PICKPOCKET_Condition;
	information = DIA_Pyrokar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Pyrokar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 108 , 550 );
};

func void DIA_Pyrokar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET,Dialog_Back,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};

func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};


instance DIA_PYROKAR_KAPITELORCATTACK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_kapitelorcattack_condition;
	info = dia_pyrokar_kapitelorcattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pyrokar_kapitelorcattack_condition()
{
	if((CAPITANORDERDIAWAY == TRUE) && (CAPITANORDERLIAWAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kapitelorcattack_info()
{
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_01_00 " );	// Praise to Innos! Finally you showed up!
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_01_01 " );	// And then I began to think that this would never happen again.
	AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_01_02 " );	// Well, to be honest, we were not going to return to the island - it just so happened.
	AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_01_04 " );	// We have some very important news for paladins. Therefore, I need to speak to Lord Hagen as soon as possible!
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_01_08 " );	// Terrible things have happened here in your absence.
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack, " What happened here? " ,dia_pyrokar_kapitelorcattack_what);
};

func void dia_pyrokar_kapitelorcattack_what()
{
	PlayVideo("RET2_OrcSiege.BIK");
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_01 " );	// (doomed) Khorinis has fallen! Now it's all about the orcs.
	AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_What_01_02 " );	// What? But how did it happen?
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_03 " );	// A few days after you sailed, their hordes passed through the pass and attacked the city!
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_04 " );	// At first, they just took him into the ring, and the next night they went on the assault.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_05 " );	// You just have no idea what was going on there. It was not even a battle, but just a bloody massacre!
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_07 " );	// Lord Hagen and his men did their best... They fought bravely to the last, but the numbers were overwhelming.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_08 " );	// In the end, those who still managed to survive retreated to positions in Fort Azgan, and the city passed into the clutches of the orcs.
	AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_What_01_09 " );	// M-yes... Wow! It turns out that the situation is completely out of control!
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_12 " );	// This is only a small part of the horror that the orcs have sown here!
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_13 " );	// The Firebenders' monastery has been under their siege for a long time, and only Innos knows how much longer we can hold out.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_14 " );	// All roads are controlled by orc war patrols, and most of the peasant farms are simply captured!
	AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_What_01_15 " );	// And what about Onar's farm?
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_16 " );	// Orcs haven't gotten to her yet! But I think it's only a matter of time.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_17 " );	// They have set up a large camp near the farm itself, and, apparently, will soon storm.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_18 " );	// True, of course, there is still hope for Fort Azgan, in which the remnants of a squad of paladins are concentrated.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_What_01_19 " );	// But we haven't heard from them yet!
	KAPITELORCATC = TRUE ;
	MIS_ORсGREATWAR = LOG_Running;
	Log_CreateTopic(TOPIC_ORсGREATWAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORсGREATWAR,LOG_Running);
	B_LogEntry( TOPIC_OR with GREATWAR , " The pyrocar told me the terrible news: just after we sailed to Irdorath, hordes of orcs came through the pass and attacked Khorinis! The battle for the city was quite heated, but the forces of the opposing sides were too unequal. Lord Hagen had to give up his positions and retreat to the royal fort Azgan with his people. The city has fallen. Orcs now rule there. " );
	Log_AddEntry( TOPIC_OR with GREATWAR , " The Firebenders themselves are not in the best position - their monastery has been besieged by the orcs for several weeks now. More or less stable position at Onar's farm - the orcs have not yet reached there. True, they set up a small camp near the farm, and, apparently, they are waiting for the right moment to attack. " );
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack, " What are we going to do now? " ,dia_pyrokar_kapitelorcattack_do);
};

func void dia_pyrokar_kapitelorcattack_do()
{
	AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_Do_01_01 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_02 " );	// I don't know for sure yet. But I think that first we need to somehow try to rectify the current situation.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_07 " );	// I think the first thing you should do is go to Lord Hagen immediately! This is the first thing to do.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_11 " );	// Go to Azgan Royal Fort as soon as possible and find out what the situation is there.
	B_GiveInvItems(self,other,itwr_pyrorderfort,1);
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_12 " );	// (seriously) And one more thing...
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_13 " );	// As you probably already understood, the city is full of orcs, and it will be extremely difficult for you to get out of here.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_15 " );	// I'm sure you can somehow get out of this difficult situation.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_16 " );	// But most of those who sailed with you were actually trapped.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_17 " );	// The hour is not even when the orcs come to your ship, and then... I think you yourself understand everything.
	AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_Do_01_18 " );	// I understand. And what do you suggest?
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_19 " );	// The only thing that comes to my mind right now is to use magical teleportation runes.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_20 " );	// I think this is the easiest way to get out of here unhindered.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_99 " );	// Here, take this. This is all I have now.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItMi_TeleportFarm,1);
	CreateInvItems(other,ItMi_TeleportTaverne,1);
	CreateInvItems(other,ItMi_TeleportPsicamp,1);
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_21 " );	// However, I also understand that there may not be enough runes for everyone, and many still have to fight their way through the city.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_22 " );	// Therefore, before deciding who to give them to, think carefully about this.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_23 " );	// Yes, and more. Do not try to offer them the runes of teleportation to the monastery or to the passage to the Valley of Mines!
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_24 " );	// By doing so, you will sign their death warrant!
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_26 " );	// The exit from the valley, like the area near the monastery, is heavily guarded by orcs.
	if((VATRASBACKNW == TRUE) || (MAGEBACKNW == TRUE))
	{
		if((VATRASBACKNW == TRUE) && (MAGEBACKNW == TRUE))
		{
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_29 " );	// Good. By the way, don't worry about Vatras and Milten. Wizards can take care of themselves.
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_30 " );	// They will go with me to the monastery - their place is now there.
		}
		else if((VATRASBACKNW == FALSE) && (MAGEBACKNW == TRUE))
		{
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_31 " );	// Good. By the way, don't worry about Milten. The Magician can take care of himself.
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_32 " );	// He will go with me to the monastery - his place is now there.
		}
		else if((VATRASBACKNW == TRUE) && (MAGEBACKNW == FALSE))
		{
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_33 " );	// Good. By the way, don't worry about Vatras. The Magician can take care of himself.
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_34 " );	// He will go with me to the monastery - his place is now there.
		};
	};
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_35 " );	// Good. As for the others, I think you should talk to them anyway.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_36 " );	// This will surely give them some confidence in their abilities!
	if(PEDROBACKNW == TRUE)
	{
		AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_Do_01_37 " );	// What about acolyte Pedro?
		AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_38 " );	// What?! (angrily) Is that traitor with you too? I thought he was dead.
		AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_Do_01_39 " );	// I found it in one of the caves on the island of Irdorath. He was a prisoner of the orcs.
		AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_40 " );	// Well, if so, then, perhaps, I will take him with me to the monastery.
		AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_41 " );	// There he will get his!
		if(MIS_HELPPEDRO == LOG_Running)
		{
			B_GivePlayerXP(150);
			AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_Do_01_42 " );	// Just try to be a little gentler with him.
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_43 " );	// Why is that?!
			AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_Do_01_44 " );	// I'm sure the guy isn't particularly to blame for what happened.
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_45 " );	// Yes? And why do you think so?
			AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_Do_01_46 " );	// Let me tell you about it a little later. Now is not the right time for this.
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_47 " );	// Hmmm. OK then.
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_48 " );	// But keep in mind that later on you will have to prove his innocence to me anyway!
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_49 " );	// Otherwise, you yourself know what punishment awaits him in the monastery.
			PEDROCANSAVE = TRUE ;
			Log_AddEntry( TOPIC_HELPPEDRO , " As promised, I put in a good word for the acolyte Pedro in front of the Pyrocar. However, now I still need to explain and prove to him why I think he is innocent. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_50 " );	// As for you, I have nothing more to add. Now everything depends on your actions!
		};
	};
	AI_Output(other,self, " DIA_Pyrokar_KapitelOrcAttack_Do_01_51 " );	// Okay, I got it.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_52 " );	// (seriously) Good. I then go back to the monastery.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_53 " );	// If you want to talk to me about anything else, you know where to find me.
	AI_Output(self,other, " DIA_Pyrokar_KapitelOrcAttack_Do_01_54 " );	// May Innos protect you!
	MIS_HELPCREW = LOG_Running;
	PYROKARSENTTOHAGEN = TRUE ;
	Log_CreateTopic(TOPIC_HELPCREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_Running);
	B_LogEntry( TOPIC_HELPCREW , " Pyrokar asked me to help the rest of the crew get out of Khorinis, which was captured by the orcs. He gave me some teleportation runes. They will help the rest of them to leave the city without hindrance. But there will not be enough runes for all, and they will be able to fight their way through the crowds of orcs not all. I think I should definitely talk to each of the members of my team. " );
	Log_AddEntry( TOPIC_OR with GREATWAR , " Looks like I'm going to have to take on the role of savior of the world again. According to Pyrocar, I'm the only one who can. I hope he's right. " );
	Log_AddEntry( TOPIC_OR with GREATWAR , " First, I should go to the Royal Fort Azgan as soon as possible and ask Lord Hagen about the state of his troops. After all, the paladins are the only force on the island that can somehow resist the orcs. " ) ;
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack, " (end call) " ,dia_pyrokar_kapitelorcattack_away);
};

func void dia_pyrokar_kapitelorcattack_away()
{
	if((VATRASBACKNW == TRUE) || (MAGEBACKNW == TRUE))
	{
		if((VATRASBACKNW == TRUE) && (MAGEBACKNW == TRUE))
		{
			AI_Teleport(VLK_439_Vatras,"NW_MONASTERY_GRASS_VATRAS");
			AI_Teleport(PC_Mage_NW,"NW_MONASTERY_GRASS_05");
			Npc_ExchangeRoutine(VLK_439_Vatras,"OrcAtcNW");
			Npc_ExchangeRoutine(PC_Mage_NW,"OrcAtcNW");
		}
		else if((VATRASBACKNW == FALSE) && (MAGEBACKNW == TRUE))
		{
			AI_Teleport(PC_Mage_NW,"NW_MONASTERY_GRASS_05");
			Npc_ExchangeRoutine(PC_Mage_NW,"OrcAtcNW");
		}
		else if((VATRASBACKNW == TRUE) && (MAGEBACKNW == FALSE))
		{
			AI_Teleport(VLK_439_Vatras,"NW_MONASTERY_GRASS_VATRAS");
			Npc_ExchangeRoutine(VLK_439_Vatras,"OrcAtcNW");
		};
	};
	if(PEDROCANSAVE == TRUE)
	{
		AI_Teleport(NOV_600_Pedro,"NW_MONASTERY_CHAPELL_02");
		Npc_ExchangeRoutine(NOV_600_Pedro,"OrcAtcNW");
	};

	IntroduceCH_07 = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_Attack(self,other,0,0);
};


instance DIA_PYROKAR_PEDROCANSAVE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_pedrocansave_condition;
	information = dia_pyrokar_pedrocansave_info;
	permanent = FALSE;
	description = " Let's talk about Pedro. " ;
};


func int dia_pyrokar_pedrocansave_condition()
{
	if (( MY_HELPPEDRO  == LOG_Running) && ( PEDROCANSAVE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_pyrokar_pedrocansave_info()
{
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_01_00 " );	// Let's talk about Pedro.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_01_01 " );	// Good. And what can you say in his defense?
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	Info_AddChoice(dia_pyrokar_pedrocansave, " Я не знаю. " ,dia_pyrokar_pedrocansave_dontknow);
	Info_AddChoice(dia_pyrokar_pedrocansave, " I believe he is not guilty. " ,dia_pyrokar_pedrocansave_innocent);
	Info_AddChoice(dia_pyrokar_pedrocansave, " Trust me. " ,dia_pyrokar_pedrocansave_trustme);
};

func void dia_pyrokar_pedrocansave_dontknow()
{
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_DontKnow_01_00 " );	// I don't know.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_DontKnow_01_01 " );	// In that case, we have nothing to talk about... (imperiously) I won't change my mind!
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_DontKnow_01_02 " );	// Novice Pedro will be severely punished for his betrayal, and Innos himself will be a witness.
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	MIS_HELPPEDRO = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_HELPPEDRO);
};

func void dia_pyrokar_pedrocansave_trustme()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_TrustMe_01_02 " );	// Just take my word for it, he's innocent.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_TrustMe_01_03 " );	// (angrily) What? Are you out of your mind to suggest this to me?
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_TrustMe_01_05 " );	// Your audacity just knows no limits this time! You have no right to decide for me the fate of this thief and traitor!
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_TrustMe_01_06 " );	// You owe me a lot! Can't you do me such a small favor?
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_TrustMe_01_09 " );	// I think you're asking too much!
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_TrustMe_01_10 " );	// Just drop all the charges against Pedro and let him go - that's all I ask of you.
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_TrustMe_01_11 " );	// I, in turn, am ready to vouch for him. Or is that not enough for you?
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_TrustMe_01_12 " );	// (reluctantly) All right! If you so blindly vouch for him, then I am ready to make such a concession.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_TrustMe_01_13 " );	// After all, we really owe you a lot and have no right to question any of your actions.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_TrustMe_01_14 " );	// Acolyte Pedro is cleared of all charges of betrayal and theft.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry( TOPIC_HELPPEDRO , " As promised, I helped Pedro save his life by using my influence with the Pyrocar. " );
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_innocent()
{
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_Innocent_01_00 " );	// I guess he's not guilty.
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_Innocent_01_03 " );	// Pretty sure he was just forced to do it.
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_Innocent_01_04 " );	// A normal acolyte is too weak to resist Seekers' dark magic.
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_Innocent_01_08 " );	// Give him a chance to regain his faith!
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_Innocent_01_10 " );	// But stealing from your brothers is worthy of the most severe punishment!
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_Innocent_01_11 " );	// Do you really think that I can turn a blind eye to this?!
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_Innocent_01_12 " );	// I'm not asking you to do this. I just want you to keep him alive!
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_Innocent_01_17 " );	// Okay...(seriously) If you're asking this so passionately, I'm willing to make that concession.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_Innocent_01_18 " );	// However, you will have to pay for his life!
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_Innocent_01_19 " );	// I believe that a small donation to our monastery will soften the indignation of others a little about making such a decision.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_20");	//Сколько?
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_Innocent_01_21 " );	// (imperiously) Five thousand gold coins. I'm sure this will be enough.
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	Info_AddChoice(dia_pyrokar_pedrocansave, " I don't have enough gold. " ,dia_pyrokar_pedrocansave_nomoney);
	Info_AddChoice(dia_pyrokar_pedrocansave, " This is not worth it. " ,dia_pyrokar_pedrocansave_tomuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_pyrokar_pedrocansave, " Here's your gold. " ,dia_pyrokar_pedrocansave_money);
	};
};

func void dia_pyrokar_pedrocansave_nomoney()
{
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_NoMoney_01_00 " );	// I don't have enough gold.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_NoMoney_01_01 " );	// Then we'll talk about it when you have it.
	GIVEPEDROCHANCE = TRUE;
	B_LogEntry( TOPIC_HELPPEDRO , " Pyrocar has agreed to drop all charges against Pedro, but only if I donate five thousand gold to his monastery. " );
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_tomuch()
{
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_ToMuch_01_00 " );	// I won't waste time on such trifles.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_ToMuch_01_01 " );	// In that case, we have nothing to talk about... (imperiously) I won't change my mind!
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_ToMuch_01_02 " );	// Novice Pedro will be severely punished for his betrayal, and Innos himself will be a witness.
	MIS_HELPPEDRO = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_HELPPEDRO);
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_money()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSave_Money_01_00 " );	// Here's your gold.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_Money_01_01 " );	// Good. In this case, you can consider that all charges of betrayal and theft are now cleared from Pedro.
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSave_Money_01_02 " );	// And I really hope that in the future I will not regret this decision of mine.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry( TOPIC_HELPPEDRO , " As promised, I helped Pedro save his life by buying him a Firebender indulgence for a huge amount of gold. " );
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};


instance DIA_PYROKAR_PEDROCANSAVEFORMONEY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_pedrocansaveformoney_condition;
	information = dia_pyrokar_pedrocansaveformoney_info;
	permanent = FALSE;
	description = " I want to make a donation for acolyte Pedro. " ;
};


func int dia_pyrokar_pedrocansaveformoney_condition()
{
	if (( MY_HELPER  == LOG_Running ) && ( GIVEPEDROCHANCE  ==  TRUE ) && ( Npc_HasItems ( other , ItMy_Gold ) >=  5000 )) ;
	{
		return TRUE;
	};
};

func void dia_pyrokar_pedrocansaveformoney_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Pyrokar_PedroCanSaveForMoney_01_00 " );	// I want to make a donation for acolyte Pedro.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other, " DIA_Pyrokar_PedroCanSaveForMoney_01_03 " );	// Well... (a little surprised) In this case, you can consider that all charges of betrayal and theft are now cleared from Pedro.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry( TOPIC_HELPPEDRO , " As promised, I helped Pedro save his life by buying him a Firebender indulgence for a huge amount of gold. " );
};


instance DIA_PYROKAR_ABOUTGUARDIANS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_aboutguardians_condition;
	information = dia_pyrokar_aboutguardians_info;
	permanent = FALSE;
	description = " What do you know about Guardians? " ;
};


func int dia_pyrokar_aboutguardians_condition()
{
	if ( KAPITELORCATC  ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_pyrokar_aboutguardians_info()
{
	AI_Output(other,self, " DIA_Pyrokar_AboutGuardians_01_00 " );	// What do you know about Guardians?
	AI_Output(self,other, " DIA_Pyrokar_AboutGuardians_01_01 " );	// Keepers? (thoughtfully) I'm afraid I don't know much about these ancient creatures.
	AI_Output(self,other, " DIA_Pyrokar_AboutGuardians_01_02 " );	// And most of this knowledge, most likely, is rumors or fiction of other people, rather than the truth.
	AI_Output(self,other, " DIA_Pyrokar_AboutGuardians_01_04 " );	// Many who have ever heard of Guardians believe they were spawned by the gods themselves!
	AI_Output(self,other, " DIA_Pyrokar_AboutGuardians_01_05 " );	// However, there are those who consider them the creation of more powerful forces that existed long before the appearance of this world.
	AI_Output(self,other, " DIA_Pyrokar_AboutGuardians_01_06 " );	// What of all this is true and what is not - I, of course, do not know.
	AI_Output(self,other, " DIA_Pyrokar_AboutGuardians_01_07 " );	// The true fact of the existence of the Guardians is unknown to anyone and is mostly a myth.
};


instance DIA_PYROKAR_GUARDIANSEXISTS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_guardiansexists_condition;
	information = dia_pyrokar_guardiansexists_info;
	permanent = FALSE;
	description = " The Guardians are not a myth at all! " ;
};


func int dia_pyrokar_guardiansexists_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_aboutguardians))
	{
		return TRUE;
	};
};

func void dia_pyrokar_guardiansexists_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_00 " );	// Guardians are not a myth at all!
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_02 " );	// I personally met one of them in the temple of Irdorath.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_03 " );	// (thoughtfully) To be honest, I find this very hard to believe. For no one has ever met them in this world before!
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_06 " );	// And what did the keeper want from you?!
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_07 " );	// He wanted to kill me.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_08 " );	// Kill? (bewildered) This is a rather unexpected turn of events.
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_14 " );	// Before attacking, the guardian told me the true meaning of their appearance in this world.
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_15 " );	// And, apparently, my presence here may prevent them from carrying out their plans.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_16 " );	// And what is their intention?
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_17 " );	// They want to destroy all gods. And with them, everything else in this world!
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_18 " );	// O merciful Innos! But how can this be? Why would they do it?!
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_19 " );	// Keepers believe that the eternal struggle between Innos and Beliar brings only one destruction and chaos to this world.
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_20 " );	// They want to end this feud once and for all.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_21 " );	// But do they really think the gods will let them do it?
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_22 " );	// I'm afraid that the gods are now too weak to resist the might of the Guardians.
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_23 " );	// And in part, everything turned out this way precisely because of my fault. The Guardians were just using me...
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_24 " );	// Without realizing it myself, with each of my actions, I gradually weakened their power in this world.
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_25 " );	// And now they are unlikely to be able to help us with anything!
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_26 " );	// O Innos! Everything you said is simply unthinkable... (confused) Who would have thought that all our actions would turn against us.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_27 " );	// And if that's true, then I'm afraid we're all doomed. We ourselves will never defeat the Guardians without the help of the gods.
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_28 " );	// Also, don't forget about orcs.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_29 " );	// Oh yeah, and those damn orcs... (angrily) We can't even deal with them, let alone this new threat!
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_30 " );	// You don't know yet that the Guardians themselves help these creatures!
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_31 " );	// It is with their help that they want to destroy people and, thereby, further weaken the power of the gods.
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_32 " );	// And that's why all the efforts of the paladins in the war with them are so futile!
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_33 " );	// What?! We just didn't have enough! Everything turned against us and it seems that this world is really doomed.
	AI_Output(other,self, " DIA_Pyrokar_GuardiansExists_01_34 " );	// I'll think of something.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansExists_01_35 " );	// What can you think of here? All our efforts will be in vain if the Guardians themselves want our death.
	) ; _ _ _ _ _
};

instance DIA_PYROKAR_WHATDOUS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdous_condition;
	information = dia_pyrokar_whatdous_info;
	permanent = FALSE;
	description = " Do you have any idea how we can defeat the Guardians? " ;
};

func int dia_pyrokar_whatdous_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_guardiansexists))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdous_info()
{
	AI_Output(other,self, " DIA_Pyrokar_WhatDoUs_01_00 " );	// Do you have any thoughts on how we can defeat the Guardians?
	AI_Output(self,other, " DIA_Pyrokar_WhatDoUs_01_01 " );	// I'm afraid not yet...(seriously) And I can't even imagine how to do it.
	AI_Output(self,other, " DIA_Pyrokar_WhatDoUs_01_02 " );	// The only thing that comes to my mind now is to turn to the ancient manuscripts that are stored in the secret library of the monastery.
	AI_Output(self,other, " DIA_Pyrokar_WhatDoUs_01_03 " );	// Perhaps, in them I will still be able to find answers to the question that interests us.
	AI_Output(self,other, " DIA_Pyrokar_WhatDoUs_01_04 " );	// But I'll need some time. At least two days.
	B_LogEntry( TOPIC_GUARDIANS , " Pyrocar will go to the secret library of the monastery to study the ancient manuscripts. Perhaps he will find something in them that will help us defeat the Guardians. I should not know the result of his search until two days later. " );
	DAYDISCOVERANSWER = Wld_GetDay();
	PYROKARBEGINSEARCH = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_500_Pyrokar,"SearchAnswer");
};

instance DIA_PYROKAR_WHATDOUSNOT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdousnot_condition;
	information = dia_pyrokar_whatdousnot_info;
	permanent = TRUE;
	description = " Have you found out anything about Guardians? " ;
};

func int dia_pyrokar_whatdousnot_condition()
{
	where int daynow;
	daynow = Wld_GetDay();

	if(((daynow - 2) >= DAYDISCOVERANSWER) && (PYROKARBEGINSEARCH == TRUE) && (GATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdousnot_info()
{
	AI_Output(other,self, " DIA_Pyrokar_WhatDoUsNot_01_00 " );	// Did you manage to find out anything about the Guardians?

	if(PYROKARMESSAGEPAL == FALSE)
	{
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_01 " );	// Not yet...(seriously) Guess this will take even longer than I thought.
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_04 " );	// Yes! I have researched several ancient writings regarding these ancient creatures, and have come to the conclusion that they can still be destroyed.
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_05 " );	// More precisely, do not destroy, because they are immortal beings. (seriously) And just deprive them of part of the divine power, in order to then expel them from this world.
		AI_Output(other,self, " DIA_Pyrokar_WhatDoUsNot_01_06 " );	// And how do we do this?
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_07 " );	// Since the Guardians are not inherently part of this world and their true abode is some sacred halls of Wakhan...
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_08 " );	// ...then their power here is not as limitless as it might actually seem.
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_09 " );	// And, apparently, that is why the Keepers tried to weaken the gods, knowing that in their power they cannot be compared here with the same Innos or Beliar.
		AI_Output(other,self, " DIA_Pyrokar_WhatDoUsNot_01_10 " );	// That is, it is the gods themselves who can destroy them?
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_11 " );	// That's the whole problem. They could, as long as they were able to do it. But now the situation has changed!
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_12 " );	// They themselves may soon fall victim to their own hindsight, and we cannot hope for their help now.
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_17 " );	// You may be the one who can find some clue in all this.
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_18 " );	// It's not just that the Guardians wanted to kill you. It turns out that you are a serious threat to them too!
		AI_Output(self,other, " DIA_Pyrokar_WhatDoUsNot_01_19 " );	// So, as long as you're alive, we have a ghostly chance of salvation.
		GATHERALLONBIGFARM = TRUE;
		B_LogEntry( TOPIC_GUARDIANS , " Pyrokar told me everything he could find in the ancient manuscripts regarding the Guardians. Their power is not as limitless as we previously believed - the power of the gods is quite capable of destroying them. That is why they were so eager to weaken the influence of Innos, Beliar and Adanos in this world. I think the orc attack on Khorinis is also something to do with this. I should look for an answer to this question as well. " );

		if(PyrokarTellAboutCreatures == TRUE)
		{
			B_LogEntry_Quiet( TOPIC_GUARDIANS , " The only way to defeat the Guardians is to try to find another deity that can withstand their power. " );
		};

		Npc_ExchangeRoutine(self,"Start");
	};
};

instance DIA_PYROKAR_ORCSECRET(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_PYROKAR_ORCSECRET_condition;
	information = DIA_PYROKAR_ORCSECRET_info;
	permanent = FALSE;
	description = " Lee sent me. " ;
};

func int DIA_PYROKAR_ORCSECRET_condition()
{
	if(MIS_ORCSECRET == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_PYROKAR_ORCSECRET_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_PYROKAR_ORCSECRET_01_01 " );	// Lee sent me.
	AI_Output(other,self, " DIA_PYROKAR_ORCSECRET_01_02 " );	// In the last skirmish with the orcs, he noticed that some of them were almost invulnerable.
	AI_Output(other,self, " DIA_PYROKAR_ORCSECRET_01_04 " );	// This worries him very much, since the humans will not stand a chance against the orcs in the upcoming battle.
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_05 " );	// (thoughtfully) In my opinion, these are all links of the same chain!
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_06 " );	// For sure, and here it was not without interference from the Guardians.
	AI_Output(other,self, " DIA_PYROKAR_ORCSECRET_01_07 " );	// So, until we destroy them, all our actions will be meaningless?
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_08 " );	// I'm afraid so.
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_09 " );	// However, you must understand that Guardians are still divine beings.
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_10 " );	// They are as powerful as they are vain!
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_11 " );	// So it's unlikely they'll condescend to personally appear in this world to start helping these green-skinned creatures.
	AI_Output(other,self, " DIA_PYROKAR_ORCSECRET_01_12 " );	// They already did it! I know this for sure because...
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_13 " );	// You are a completely different matter. In fact, you have become their stumbling block in their desire to rule this world.
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_14 " );	// But it doesn't make much sense for them to make their intervention so obvious right now.
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_15 " );	// After all, the gods of this world are still too strong, and the Guardians are not yet ready to openly challenge them.
	AI_Output(other,self, " DIA_PYROKAR_ORCSECRET_01_16 " );	// Then how do they help the orcs?
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_17 " );	// Perhaps through their servants in this world... (thoughtfully) For example, what were the dragons in their time in the Valley of Mines.
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_18 " );	// The magical aura that surrounded these ancient and powerful creatures could well have made the orcs even more powerful and dangerous enemies.
	AI_Output(other,self, " DIA_PYROKAR_ORCSECRET_01_19 " );	// Dragons again?
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_20 " );	// You misunderstood me. I gave them only as an example.
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_21 " );	// In fact, it can be any other creatures that obey the will of the Guardians.
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_22 " );	// True, this is just my guess. So I wouldn't say this with absolute certainty.
	AI_Output(other,self, " DIA_PYROKAR_ORCSECRET_01_23 " );	// What are these creatures and where to find them?
	AI_Output(self,other, " DIA_PYROKAR_ORCSECRET_01_24 " );	// Sorry, but I don't know the answer to this question. Try looking for it elsewhere.
	B_LogEntry( TOPIC_ORCSECRET , "The Pyrokar suggested that the Guardians granted protection to the orcs through some powerful creature. " );
	PyrokarTellAboutCreatures = TRUE;

	if(GATHERALLONBIGFARM == TRUE)
	{
		B_LogEntry_Quiet( TOPIC_GUARDIANS , " Perhaps the only chance to defeat the Guardians is to try to find another deity that can withstand their power. " );
	};
};

instance DIA_PYROKAR_GATHERALLONBIGFARMTWO(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_gatherallonbigfarmtwo_condition;
	information = dia_pyrokar_gatherallonbigfarmtwo_info;
	permanent = FALSE;
	description = " I have some news for you. " ;
};

func int dia_pyrokar_gatherallonbigfarmtwo_condition()
{
	if(HAGENNOMORETIMEWAIT == TRUE)
	{
		return TRUE;
	};
};

func void dia_pyrokar_gatherallonbigfarmtwo_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pyrokar_GatherAllOnBigFarmTwo_01_00 " );	// I have news for you.
	AI_Output(other,self, " DIA_Pyrokar_GatherAllOnBigFarmTwo_01_02 " );	// The paladins are ready to move into position in Khorinis. Lord Hagen and his men will camp near Onar's farm, and asks you to be ready to join him.
	AI_Output(self,other, " DIA_Pyrokar_GatherAllOnBigFarmTwo_01_03 " );	// But why did he decide to take up defense there?
	AI_Output(other,self, " DIA_Pyrokar_GatherAllOnBigFarmTwo_01_04 " );	// According to his information, the orcs are concentrating their main forces precisely to this farm. Therefore, the head of the paladins is sure that they will strike there!
	AI_Output(self,other, " DIA_Pyrokar_GatherAllOnBigFarmTwo_01_05 " );	// All right...(seriously) Then we'll join his army soon.
	PYROKARMESSAGEPAL = TRUE;
};


instance DIA_PYROKAR_TELLTOHAGENFORT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_telltohagenfort_condition;
	information = dia_pyrokar_telltohagenfort_info;
	permanent = FALSE;
	description = " I spoke to the head of the paladins. " ;
};


func int dia_pyrokar_telltohagenfort_condition()
{
	if (( CAPITELORCATC  ==  TRUE ) && ( TELLTOHAGENFORT  ==  TRUE ) && ( HAGENNOMORETIMEWAIT  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pyrokar_telltohagenfort_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pyrokar_TellToHagenFort_01_00 " );	// I spoke to the head of the paladins.
	AI_Output(self,other, " DIA_Pyrokar_TellToHagenFort_01_01 " );	// And what did Lord Hagen say? (excitedly) How does he himself assess the current situation?
	AI_Output(other,self, " DIA_Pyrokar_TellToHagenFort_01_02 " );	// The situation couldn't be worse! The paladins have suffered huge losses while defending the city, and now they are unlikely to be able to openly oppose the orcs.
	AI_Output(other,self, " DIA_Pyrokar_TellToHagenFort_01_03 " );	// Therefore, he and his men will stay at the fort for the time being and plan a counterattack.
	AI_Output(self,other, " DIA_Pyrokar_TellToHagenFort_01_12 " );	// Eh. I hope he understands what he's doing.
};


instance DIA_PYROKAR_KDFANSWER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_kdfanswer_condition;
	information = dia_pyrokar_kdfanswer_info;
	permanent = FALSE;
	description = "The paladins need your help! " ;
};


func int dia_pyrokar_kdfanswer_condition()
{
	if (( HAGENOTHERSAGREED  ==  TRUE ) && ( KDF_JOINHAGEN  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kdfanswer_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pyrokar_KDFAnswer_01_00 " );	// Paladins need your help!
	AI_Output(other,self, " DIA_Pyrokar_KDFAnswer_01_02 " );	// Lord Hagen wants to oppose the orcs, and now gathers under his banner all the people who are ready to support him in this.
	AI_Output(self,other, " DIA_Pyrokar_KDFAnswer_01_03 " );	// Well, that's good news. And we will certainly give him every support in the fight against these creatures.
	AI_Output(self,other, " DIA_Pyrokar_KDFAnswer_01_04 " );	// However, we should not forget that the orcs are not our main enemy now. The Guardians are the true threat to this world!
	AI_Output(self,other, " DIA_Pyrokar_KDFAnswer_01_05 " );	// Therefore, first of all, we must solve this particular problem. Otherwise, everything will be in vain.
	KDF_JOINHAGEN = TRUE;
	Log_AddEntry( TOPIC_OR with GREATWAR , " The Fire Mages will support the paladins against the orcs. " );
};


instance DIA_PYROKAR_STRANGETHINGS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_strangethings_condition;
	information = dia_pyrokar_strangethings_info;
	permanent = FALSE;
	description = " Strange things started to happen... " ;
};


func int dia_pyrokar_strangethings_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_guardiansexists) && (MIS_STRANGETHINGS == LOG_Running) && (GUARDIANSISDEFEATED == FALSE) && ((FIRSTLOOKONTOTEM == TRUE) || (FIRSTSTRIKEME == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_strangethings_info()
{
	AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_00 " );	// Strange things started to happen...
	AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_01 " );	// Which ones exactly?

	if((FIRSTLOOKONTOTEM == TRUE) && (FIRSTSTRIKEME == TRUE))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_02 " );	// Traveling around the island, I accidentally stumbled upon a huge and unusual-looking statue.
		AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_03 " );	// I bet I've never seen her there before!
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_04 " );	// (thoughtfully) It's really strange, because not far from the monastery appeared exactly the same.
		AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_05 " );	// I also thought she was emitting some kind of very strange magical energy, which, to be honest, makes me a little uncomfortable.
		AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_06 " );	// You don't know what all this could mean?
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_07 " );	// I'm afraid not. But I think you should stay away from them for now. It is still unknown exactly what magical properties they possess.
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_08 " );	// Perhaps this is the work of the Guardians.
		AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_09 " );	// But that's not all.
		AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_10 " );	// Recently, when I tried to attack one of the orcs, I was hit by a strong bolt of lightning, almost killing me.
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_12 " );	// (thoughtfully) I seem to be starting to understand something.
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_15 " );	// I assume that those unusual statues you met on the island serve the orcs as some sort of protective totems.
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_16 " );	// And by the looks of things, these creatures are practically invincible at close range!
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_17 " );	// And given that the orcs themselves are unlikely to have such knowledge of magic, then only one conclusion can be drawn from all this - it is the Guardians who are behind all this!
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_20 " );	// And now our only chance to defeat the orcs is to deprive them of the support of the Guardians.
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_23 " );	// I don't yet know how much influence these ancient artifacts have and their range.
		AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_24 " );	// So I think it's best if you stay away from large concentrations of orcs for the time being.
		MIS_STRANGETHINGS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
	}
	else
	{
		if(FIRSTLOOKONTOTEM == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_27 " );	// Traveling around the island, I accidentally stumbled upon a huge and unusual-looking statue.
			AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_28 " );	// I bet I've never seen her there before!
			AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_29 " );	// (thoughtfully) It's really strange, because not far from the monastery appeared exactly the same.
			AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_30 " );	// And it also seemed to me that she emits some very strange magical energy, which, to be honest, makes me a little uncomfortable.
			AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_31 " );	// You don't know what all this could mean?
			AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_32 " );	// I'm afraid not. But I think you should stay away from them for now. It is still unknown exactly what magical properties they possess.
			AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_33 " );	// Perhaps this is the work of the Guardians.
			AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_34 " );	// Okay, I'm clear.
			STRIKENODISCOVER = TRUE;
			B_LogEntry( TOPIC_STRANGETHINGS , " I told Pyrokar about the strange statues I saw on the island. He advised me to stay away from them, as he does not exclude that all this is the work of the Guardians, and it is better to mess with their ancient magic. " );
		};
		if(FIRSTSTRIKEME == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self, " DIA_Pyrokar_StrangeThings_01_35 " );	// Recently, when I tried to attack one of the orcs, I was hit by a strong bolt of lightning, almost killing me.
			AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_37 " );	// (thoughtfully) This is really quite unexpected! I don't even know what to say to you.
			AI_Output(self,other, " DIA_Pyrokar_StrangeThings_01_38 " );	// In any case, try to avoid orc patrols for now.
			B_LogEntry( TOPIC_STRANGETHINGS , " I told Pyrokar about my attempt to attack the orcs and what came of it. He advised me to stay away from them until the full circumstances of this unusual turn of events were revealed. " );
		};
	};
};

instance DIA_PYROKAR_STRANGETHINGSAGAIN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_strangethingsagain_condition;
	information = dia_pyrokar_strangethingsagain_info;
	permanent = FALSE;
	description = " About strange things... " ;
};

func int dia_pyrokar_strangethingsagain_condition()
{
	if((MIS_STRANGETHINGS == LOG_Running) && (FIRSTLOOKONTOTEM == TRUE) && (FIRSTSTRIKEME == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_strangethings) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_strangethingsagain_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pyrokar_StrangeThingsAgain_01_00 " );	// About strange things...
	AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_01 " );	// Yes? Has anything else happened?
	if(STRIKENODISCOVER == TRUE)
	{
		AI_Output(other,self, " DIA_Pyrokar_StrangeThingsAgain_01_02 " );	// Recently, when I tried to attack one of the orcs, I was hit by a strong bolt of lightning, almost killing me.
		AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_04 " );	// (thoughtfully) I seem to be starting to understand something.
	}
	else
	{
		AI_Output(other,self, " DIA_Pyrokar_StrangeThingsAgain_01_06 " );	// Traveling around the island, I accidentally stumbled upon a huge and unusual-looking statue.
		AI_Output(other,self, " DIA_Pyrokar_StrangeThingsAgain_01_07 " );	// I bet I've never seen her there before!
		AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_08 " );	// (thoughtfully) It's really strange, because not far from the monastery appeared exactly the same.
		AI_Output(other,self, " DIA_Pyrokar_StrangeThingsAgain_01_09 " );	// And I also thought that this statue emits some very strange magical energy, which, to be honest, makes me a little uncomfortable.
		AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_10 " );	// (thoughtfully) I seem to be starting to understand something.
	};
	AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_13 " );	// I assume that those unusual statues you met on the island serve the orcs as some sort of protective totems.
	AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_14 " );	// And by the looks of things, these creatures are practically invincible at close range!
	AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_15 " );	// And given that the orcs themselves are unlikely to have such knowledge of magic, then only one conclusion can be drawn from all this - the Guardians are behind all this!
	AI_Output(other,self, " DIA_Pyrokar_StrangeThingsAgain_01_16 " );	// And how do we deal with all this now?
	AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_18 " );	// I don't know, but I'm sure our only chance to defeat the orcs now is to deprive them of the support of the Guardians.
	AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_21 " );	// I don't yet know how much influence these ancient artifacts have and their range.
	AI_Output(self,other, " DIA_Pyrokar_StrangeThingsAgain_01_22 " );	// So I think it's best if you stay away from large concentrations of orcs for the time being.
	MIS_STRANGETHINGS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
};

instance DIA_PYROKAR_TRANSENERGY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_transenergy_condition;
	information = dia_pyrokar_transenergy_info;
	permanent = FALSE;
	description = " I need your help. " ;
};

func int dia_pyrokar_transenergy_condition()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_transenergy_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pyrokar_TransEnergy_01_00 " );	// I need your help.
	AI_Output(self,other, " DIA_Pyrokar_TransEnergy_01_01 " );	// Help? Which one?
	AI_Output(other,self, " DIA_Pyrokar_TransEnergy_01_02 " );	// I urgently need a scroll with a spell that can transfer energy from one item to another.
	AI_Output(other,self, " DIA_Pyrokar_TransEnergy_01_03 " );	// Can you make one for me?
	AI_Output(self,other, " DIA_Pyrokar_TransEnergy_01_04 " );	// (thoughtfully) It won't be easy.
	AI_Output(self,other, " DIA_Pyrokar_TransEnergy_01_07 " );	// This will take me a while.
	AI_Output(self,other, " DIA_Pyrokar_TransEnergy_01_12 " );	// The formula for the spell you need is quite complicated, so rushing to calculate it can have unpredictable consequences.
	AI_Output(self,other, " DIA_Pyrokar_TransEnergy_01_15 " );	// It will take me about a day to do this.
	TRANSENERGYDAY = Wld_GetDay();
	B_LogEntry( TOPIC_GUARDIANS , " I asked Pyrokar for help in creating a scroll with a spell that could transfer all the energy of magical artifacts into an ore blade. As expected, creating such a spell for the archmage of Fire will not be too much of a problem, but it will take about a day. " );
	AI_StopProcessInfos(self);
};

instance DIA_PYROKAR_TRANSENERGYDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_transenergydone_condition;
	information = dia_pyrokar_transenergydone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pyrokar_transenergydone_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((daynow > TRANSENERGYDAY) && (NETBEKLEADME_STEP2DONE == FALSE) && (Npc_KnowsInfo(other,dia_pyrokar_transenergy) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_transenergydone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Pyrokar_TransEnergyDone_01_00 " );	// The scroll with the spell you need is ready!
	AI_Output(self,other, " DIA_Pyrokar_TransEnergyDone_01_01 " );	// Here, take it. And most importantly, remember that you need to handle it with extreme care.
	B_GiveInvItems(self,other,itwr_transferenergy,1);
};


instance DIA_PYROKAR_RUNEMAGIC(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagic_condition;
	information = dia_pyrokar_runemagic_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pyrokar_runemagic_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (ORCSWINSBB == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagic_info()
{
	AI_Output(self,other, " DIA_Pyrokar_RuneMagic_01_00 " );	// (relieved) Praise Innos - you're alive!
	AI_Output(self,other, " DIA_Pyrokar_RuneMagic_01_01 " );	// And then I already began to fear that these creatures still managed to get to you.
	AI_Output(other,self, " DIA_Pyrokar_RuneMagic_01_02 " );	// No, everything is fine.

 	if(HERONOTJOINBIGBATTLE == FALSE)
	{
		AI_Output(other,self, " DIA_Pyrokar_RuneMagic_01_03 " );	// By the way, I think you must have noticed - we just defeated a huge army of orcs!
	};

	AI_Output(other,self, " DIA_Pyrokar_RuneMagic_01_04 " );	// So I have some news for you on this.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagic_01_06 " );	// Yes? What news are you talking about?
};

instance DIA_PYROKAR_GUARDIANSKILLED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_guardianskilled_condition;
	information = dia_pyrokar_guardianskilled_info;
	permanent = FALSE;
	description = " The Guardian threat is gone! " ;
};

func int dia_pyrokar_guardianskilled_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (ORCSWINSBB == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_guardianskilled_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Pyrokar_GuardiansKilled_01_00 " );	// Threat from the Keepers no more!
	AI_Output(self,other, " DIA_Pyrokar_GuardiansKilled_01_01 " );	// (very surprised) What do you mean by that?
	AI_Output(other,self, " DIA_Pyrokar_GuardiansKilled_01_02 " );	// I was able to defeat them and drive them out of this world.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansKilled_01_03 " );	// O Innos! Is it all true?
	AI_Output(self,other, " DIA_Pyrokar_GuardiansKilled_01_05 " );	// Then this is the best news you could have given me.
	AI_Output(self,other, " DIA_Pyrokar_GuardiansKilled_01_11 " );	// Now this world is saved, as are we all!
	AI_Output(self,other, " DIA_Pyrokar_GuardiansKilled_01_12 " );	// So please accept my deepest gratitude for everything you've done for us.
};

instance DIA_PYROKAR_LOOKUNUSUAL(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_lookunusual_condition;
	information = dia_pyrokar_lookunusual_info;
	permanent = FALSE;
	description = " You look at me strangely. " ;
};

func int dia_pyrokar_lookunusual_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && Npc_KnowsInfo(other,dia_pyrokar_guardianskilled))
	{
		return TRUE;
	};
};

func void dia_pyrokar_lookunusual_info()
{
	AI_Output(other,self, " DIA_Pyrokar_LookUnusual_01_00 " );	// You look at me strangely.
	AI_Output(self,other, " DIA_Pyrokar_LookUnusual_01_04 " );	// I have the feeling that something has changed in you since we last met.
	AI_Output(self,other, " DIA_Pyrokar_LookUnusual_01_05 " );	// I suddenly began to feel a huge power in you, which I did not feel before.
	AI_Output(self,other, " DIA_Pyrokar_LookUnusual_01_06 " );	// It's as if it's not just a simple person standing in front of me now... (uncertainly) But Innos himself!
	AI_Output(other,self, " DIA_Pyrokar_LookUnusual_01_07 " );	// Hmmm... Apparently, nothing can really escape you.
	AI_Output(other,self, " DIA_Pyrokar_LookUnusual_01_08 " );	// You're right! The gods themselves gave me their power so that I could fight our enemy.
	AI_Output(other,self, " DIA_Pyrokar_LookUnusual_01_09 " );	// And all without exception.
	AI_Output(self,other, " DIA_Pyrokar_LookUnusual_01_10 " );	// And even Beliar himself? Dark God?
	AI_Output(self,other, " DIA_Pyrokar_LookUnusual_01_12 " );	// Incredible! I never imagined that such a thing was possible!
	AI_Output(self,other, " DIA_Pyrokar_LookUnusual_01_16 " );	// The gods made you their chosen ones, so that it was you who protected their world from the evil that befell it!
	AI_Output(self,other, " DIA_Pyrokar_LookUnusual_01_17 " );	// And apparently, they were not mistaken in their choice.
	AI_Output(self,other, " DIA_Pyrokar_LookUnusual_01_19 " );	// All I have to do is kneel before you again, hero.
};

instance DIA_PYROKAR_WHATDO(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdo_condition;
	information = dia_pyrokar_whatdo_info;
	permanent = FALSE;
	description = " So what now? " ;
};

func int dia_pyrokar_whatdo_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (MONASTERYISFREE == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_guardianskilled))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdo_info()
{
	AI_Output(other,self, " DIA_Pyrokar_WhatDo_01_00 " );	// And now what?
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_01_01 " );	// Me and all the surviving magicians will now have to return to the monastery!
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_01_02 " );	// It's still under orc siege, and we can't leave its walls for long.
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_01_03 " );	// Since the acolytes who remain there are unlikely to be able to hold off these creatures if they decide to storm it again!
	RUNEMAGICNOTWORK = TRUE;
	Info_ClearChoices(dia_pyrokar_whatdo);
	Info_AddChoice(dia_pyrokar_whatdo, " (end call) " ,dia_pyrokar_whatdo_away);
};

func void dia_pyrokar_whatdo_away()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_00 " );	// Damn! What's happening? I do not understand!
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_02 " );	// My teleportation rune - it doesn't work!
	AI_Output(other,self, " DIA_Pyrokar_WhatDo_Away_01_03 " );	// That is, how does it not work?
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_04 " );	// I should have been in the courtyard of the monastery a few seconds ago.
	AI_Output(other,self, " DIA_Pyrokar_WhatDo_Away_01_08 " );	// Then try again. Maybe everything will work out now.
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_10 " );	// No! Nothing comes out... (bewildered) But how is this even possible?
	AI_Output(other,self, " DIA_Pyrokar_WhatDo_Away_01_12 " );	// What about other runes?
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_13 " );	// (thoughtfully) Hmmm.
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_PlayAni(self,"T_PRACTICEMAGIC3");
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_14 " );	// No, the same! I can't use any magic rune.
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_15 " );	// They all seem to have lost their magic!
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_17 " );	// O Innos! This is the only thing we need right now!
	if(MONASTERYISFREE == FALSE)
	{
		AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_18 " );	// Without this magic, we have no chance of protecting our monastery from the orcs.
	};
	AI_Output(other,self, " DIA_Pyrokar_WhatDo_Away_01_19 " );	// And what are we going to do now?
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_20 " );	// Listen to me carefully. Find one of the magicians and ask them if their magic runes work.
	AI_Output(self,other, " DIA_Pyrokar_WhatDo_Away_01_21 " );	// Ask paladins for this too. We need to figure out what's going on here as soon as possible.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_24");	//Ступай!
	MIS_RUNEMAGICNOTWORK = LOG_Running;
	Log_CreateTopic(TOPIC_RUNEMAGICNOTWORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNEMAGICNOTWORK,LOG_Running);
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " Strange - for some unknown reason, Pyrokar is now unable to use rune magic. None of his spells have worked. It is urgent to find out how other mages and paladins are doing with this. " );
	AI_StopProcessInfos(self);
};


where int frdnw;
where int wrdnw;
var int grdnw;
where int prdnw;

instance DIA_PYROKAR_RUNEMAGICNOTWORKDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicnotworkdone_condition;
	information = dia_pyrokar_runemagicnotworkdone_info;
	permanent = TRUE;
	description = " I managed to learn something about runic magic. " ;
};


func int dia_pyrokar_runemagicnotworkdone_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == FALSE) && ((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicnotworkdone_info()
{
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_01_00 " );	// I managed to learn something about runic magic.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_01_01 " );	// (impatiently) What exactly? Speak now!
	Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
	if((FIREMAGERUNESNOT == TRUE) && (FRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone, " Other Firebenders can no longer use it either. " ,dia_pyrokar_runemagicnotworkdone_fire);
	};
	if((WATERMAGERUNESNOT == TRUE) && (WRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone, " Water Mages have lost the ability to control their runes. " ,dia_pyrokar_runemagicnotworkdone_water);
	};
	if((GURUMAGERUNESNOT == TRUE) && (GRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone, " Brotherhood gurus no longer have the power to cast spells with runes. " ,dia_pyrokar_runemagicnotworkdone_guru);
	};
	if((PALADINRUNESNOT == TRUE) && (PRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone, " Paladin magic no longer works! " ,dia_pyrokar_runemagicnotworkdone_paladin);
	};
	Info_AddChoice(dia_pyrokar_runemagicnotworkdone, " That's all I've learned so far. " ,dia_pyrokar_runemagicnotworkdone_no);
};

func void dia_pyrokar_runemagicnotworkdone_fire()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_Fire_01_00 " );	// Other Firebenders can no longer use it either.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_Fire_01_01 " );	// (thoughtfully) That's what I was afraid of. Anything else?
	FRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_water()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_Water_01_00 " );	// Water Mages have lost the ability to control their runes.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_Water_01_01 " );	// This is even weirder than I thought. Did you manage to find out anything else?
	WRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_guru()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_Guru_01_00 " );	// Gurus of the Brotherhood no longer have the power to cast spells using runes.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_Guru_01_01 " );	// Even so! Hmmm... (thoughtfully) Any more news?
	GRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_paladin()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_00 " );	// Paladin magic no longer works.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_01 " );	// I thought so... (thoughtfully) Then, apparently, we have very serious problems.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_02 " );	// Is that all you've been able to find out?
	PRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_no()
{
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_00 " );	// So far this is all I've learned.
	if((FRDNW == TRUE) && (WRDNW == TRUE) && (GRDNW == TRUE) && (PRDNW == TRUE))
	{
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_01 " );	// Good. I think that's enough.
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_02 " );	// And by the looks of it, I seem to be beginning to understand what exactly happened.
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_03 " );	// But before you finally make sure of the correctness of your judgments...
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_04 " );	// ...I want to ask you to fulfill one more small request of mine.
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_06 " );	// You should try to use any magic rune yourself.
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_07 " );	// And then tell me what you got.
		ALLMAGESRUNEMAGICNOTWORK = TRUE;
		if ( TESTRUNEME  ==  TRUE )
		{
			B_GivePlayerXP(200);
			AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_08 " );	// I already did it!
			AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_09");	//И?
			AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_10 " );	// I still manage to use rune magic.
			AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_11 " );	// That's what I thought! Now everything is clear to me.
			KNOWNHOWDESTROYRUNE = TRUE;
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " I think I've told Pyrokar all I can about rune magic. After learning that I myself can still use runic power, he finally understood what happened. " );
			Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
		}
		else
		{
			B_GivePlayerXP(100);
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " I seem to have told Pyrokar everything I could about rune magic. Now the archmage has asked me to personally try out the power of my runes and then report back to him. " );
			AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_12 " );	// Okay, I'll try.
			AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_13 " );	// In that case, I'm waiting for your answer.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDone_No_01_14 " );	// Good. However, this is not enough! Try to find out something else.
	};
	Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
};


instance DIA_PYROKAR_RUNEMAGICNOTWORKDONEAFTER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicnotworkdoneafter_condition;
	information = dia_pyrokar_runemagicnotworkdoneafter_info;
	permanent = FALSE;
	description = " Give me some rune. " ;
};


func int dia_pyrokar_runemagicnotworkdoneafter_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == TRUE) && (TESTRUNEME == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicnotworkdoneafter_info()
{
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_00 " );	// Give me some rune so I can try.

	if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_KDM ))
	{
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_01 " );	// Use your rune.
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_03 " );	// (thoughtfully) Good. Here, take this.
		B_GiveInvItems(self,other,ItRu_Light_Pyr,1);
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_RUNEMAGICTESTMERESULT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagictestmeresult_condition;
	information = dia_pyrokar_runemagictestmeresult_info;
	permanent = FALSE;
	description = " I did what you asked for. " ;
};


func int dia_pyrokar_runemagictestmeresult_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == TRUE) && (TESTRUNEME == TRUE) && (KNOWNHOWDESTROYRUNE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagictestmeresult_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicTestMeResult_01_00 " );	// I did what you asked.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicTestMeResult_01_01");	//И?
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicTestMeResult_01_02 " );	// I still manage to use rune magic.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicTestMeResult_01_03 " );	// That's what I thought! Now everything is clear to me.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " I've told Pyrokar that I'm still able to use the power of runes. Now it's clear to him what happened. " );
	KNOWNHOWDESTROYRUNE = TRUE;
};


instance DIA_PYROKAR_RUNEMAGICEXPLAIN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicexplain_condition;
	information = dia_pyrokar_runemagicexplain_info;
	permanent = FALSE;
	description = " So what really happened? " ;
};


func int dia_pyrokar_runemagicexplain_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (KNOWNHOWDESTROYRUNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicexplain_info()
{
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicExplain_01_00 " );	// So what actually happened?
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicExplain_01_01 " );	// Why can't you use your rune magic anymore?
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_02 " );	// Because it no longer exists in the form in which it was subject to us before.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_03 " );	// And I'm afraid it's partly your fault.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_05 " );	// I believe that by endowing you with their power, the gods gave you most of their power.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_06 " );	// However, by doing so, they practically lost the opportunity to show their divine essence, which gave us the opportunity to use their magic.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_07 " );	// The very structure of the magical connection between humans and gods has become extremely fragile and unstable.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_08 " );	// And any little magical disturbance in this world was quite capable of completely destroying her!
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_11 " );	// But, apparently, it was your victory over the Guardians that caused all these consequences.
	AI_Output(other,self, " DIA_Pyrokar_RuneMagicExplain_01_13 " );	// But why can I use magic runes then?
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_14 " );	// This is pretty easy to explain. You now have a huge divine power!
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_15 " );	// And your connection to the gods themselves is far greater than you can imagine.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_16 " );	// All this gives you the ability to use rune magic!
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_23 " );	// Yes, and one more thing. Please inform Lord Hagen that our rune magic has been destroyed.
	AI_Output(self,other, " DIA_Pyrokar_RuneMagicExplain_01_24 " );	// Of course, this will be hard news for him, but the head of the paladins needs to know about this!
	MIS_RUNEMAGICNOTWORK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUNEMAGICNOTWORK,LOG_SUCCESS);
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " By giving me part of their divine power, the gods weakened the magical connection between them and people, which led to its final destruction. The expulsion of the Guardians from this world by me also left its mark on everything that happens, but there's nothing to be done about it. " );
	if(MONASTERYISFREE == TRUE)
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_MONASTERYSIEDGE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_monasterysiedge_condition;
	information = dia_pyrokar_monasterysiedge_info;
	permanent = FALSE;
	description = " How will you get back to the monastery now? " ;
};


func int dia_pyrokar_monasterysiedge_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_SUCCESS) && (MONASTERYISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_monasterysiedge_info()
{
	AI_Output(other,self, " DIA_Pyrokar_MonasterySiedge_01_00 " );	// How do you get back to the monastery now?
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_01 " );	// Yes, that's a really big problem, because without our magic we won't even get close to it.
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_02 " );	// The orcs are still besieging it from all sides!
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_03 " );	// And if they suddenly sniff out that there is not a single magician there now who can resist them, then they will definitely try to capture him.
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_04 " );	// O Innos! I'm even afraid to think what will happen to all our novices!
	AI_Output(other,self, " DIA_Pyrokar_MonasterySiedge_01_05 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_06 " );	// I don't know. As you can imagine, there is no way we can protect him now.
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_07 " );	// Therefore, all our hope remains only on you!
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_09 " );	// I'm sure that you, as the chosen one of the gods, are quite capable of this!
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_10 " );	// Especially now, when these creatures have lost the support of the Guardians.
	AI_Output(other,self, " DIA_Pyrokar_MonasterySiedge_01_14 " );	// I'll see what I can do.
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_15 " );	// In that case, hurry up! Now every minute counts.
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedge_01_18 " );	// I hope that everything will work out for you, my son... (hopefully) And may Innos keep you!
	MIS_MONASTERYSIEDGE = LOG_Running;
	Log_CreateTopic(TOPIC_MONASTERYSIEDGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_Running);
	) ; _ _ _ _ _
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_MONASTERYSIEDGEDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_monasterysiedgedone_condition;
	information = dia_pyrokar_monasterysiedgedone_info;
	permanent = FALSE;
	description = " The monastery is under siege! " ;
};


func int dia_pyrokar_monasterysiedgedone_condition()
{
	if((MONASTERYISFREE == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_monasterysiedgedone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Pyrokar_MonasterySiedgeDone_01_00 " );	// The monastery is under siege!
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedgeDone_01_02 " );	// O Innos! Finally it happened.
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedgeDone_01_03 " );	// All of our acolytes are safe now, and I'm going to follow them immediately.
	AI_Output(self,other, " DIA_Pyrokar_MonasterySiedgeDone_01_04 " );	// Thank you, my son, for all that you have done for us. We will never forget this.
	if((MIS_RUNEMAGICNOTWORK == FALSE) && (RUNEMAGICNOTWORK == FALSE))
	{
		RUNEMAGICNOTWORK = TRUE;
		Info_ClearChoices(dia_pyrokar_monasterysiedgedone);
		Info_AddChoice(dia_pyrokar_monasterysiedgedone, " (end call) " ,dia_pyrokar_whatdo_away);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_ALLGREATVICTORY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_allgreatvictory_condition;
	information = dia_pyrokar_allgreatvictory_info;
	permanent = FALSE;
	description = " I destroyed all the orcs in Khorinis! " ;
};


func int dia_pyrokar_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_pyrokar_allgreatvictory_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pyrokar_AllGreatVictory_01_00 " );	// I destroyed all the orcs in Khorinis! And those that remain do not pose a significant threat.
	AI_Output(self,other, " DIA_Pyrokar_AllGreatVictory_01_03 " );	// This is good news, my son... (smiling) Although, looking at you, I did not doubt it at all!
	AI_Output(self,other, " DIA_Pyrokar_AllGreatVictory_01_04 " );	// I'm sure that every person on this island will be grateful to you for everything you've done for us.
	AI_Output(self,other, " DIA_Pyrokar_AllGreatVictory_01_05 " );	// After all, you gave everyone, though small, but still hope for a successful outcome in this long and bloody war.
	AI_Output(self,other, " DIA_Pyrokar_AllGreatVictory_01_07 " );	// Thank you. May Innos protect you!
	if((MIS_RUNEMAGICNOTWORK == FALSE) && (RUNEMAGICNOTWORK == FALSE))
	{
		RUNEMAGICNOTWORK = TRUE;
		Info_ClearChoices(dia_pyrokar_allgreatvictory);
		Info_AddChoice(dia_pyrokar_allgreatvictory, " (end call) " ,dia_pyrokar_whatdo_away);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_BELIARCURSE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_beliarcurse_condition;
	information = dia_pyrokar_beliarcurse_info;
	permanent = FALSE;
	description = " I'm under the curse of Beliar! " ;
};


func int dia_pyrokar_beliarcurse_condition()
{
	if (( MY_BELIARCURSE  == LOG_Running ) && ( BELIARCURSEYOU  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_pyrokar_beliarcurse_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pyrokar_BeliarCurse_01_00 " );	// Beliar's curse on me! Can you help me?
	AI_Output(self,other, " DIA_Pyrokar_BeliarCurse_01_01 " );	// What?! (looking thoughtfully) If you're telling the truth, then it's very serious!
	AI_Output(self,other, " DIA_Pyrokar_BeliarCurse_01_02 " );	// I even wonder what you could do if Beliar decided to put a curse on you.
	AI_Output(self,other, " DIA_Pyrokar_BeliarCurse_01_03 " );	// However, as a servant of Innos, I cannot stand aside and tell you a way to get rid of the curse of the God of Darkness.
	AI_Output(self,other, " DIA_Pyrokar_BeliarCurse_01_05 " );	// You need to get the blessing of Innos himself for Beliar's curse to lose its power!
	AI_Output(other,self, " DIA_Pyrokar_BeliarCurse_01_06 " );	// Can't you bless me?
	AI_Output(self,other, " DIA_Pyrokar_BeliarCurse_01_07 " );	// No, that won't help... (seriously) Only Innos himself can save you!
	AI_Output(self,other, " DIA_Pyrokar_BeliarCurse_01_08 " );	// So go and kneel before any of his altars.
	AI_Output(self,other, " DIA_Pyrokar_BeliarCurse_01_09 " );	// And then pray until Innos is favorable to you enough to help you.
	AI_Output(self,other, " DIA_Pyrokar_BeliarCurse_01_12 " );	// I'm sure you'll have many days and nights to pray before that happens.
	AI_Output(other,self, " DIA_Pyrokar_BeliarCurse_01_14 " );	// Okay, I got it.
	B_LogEntry( TOPIC_BELIARCURSE , " The Archmage of the Circle of Fire told me a way to get rid of the curse hanging over me. To do this, I need to go to any altar of Innos and pray to him to save me. The pyrocar warned that Innos should be with me more than gracious to answer my pleas. " );
	PYRIKARSENDALTAR = TRUE;
};


instance DIA_Pyrokar_IgaranzNew(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_IgaranzNew_condition;
	information = DIA_Pyrokar_IgaranzNew_info;
	permanent = FALSE;
	description = " Acolyte of Igaraz is determined to become a Fire Mage. " ;
};

func int DIA_Pyrokar_IgaranzNew_condition()
{
	if ((hero.guild ==  GIL_KDF ) && (Chapter >=  2 ) && (MY_Igaraz_OneMoreChance == LOG_Running) && (IgarazIsDead ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IgaranzNew_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Pyrokar_IgaranzNew_01_01 " );	// Acolyte Igaraz is determined to become a Firebender.
	AI_Output(other,self, " DIA_Pyrokar_IgaranzNew_01_02 " );	// I'm sure he deserves another chance.
	AI_Output(self,other, " DIA_Pyrokar_IgaranzNew_01_03 " );	// (thoughtfully) Igarats? Perhaps he is worthy, but I have no time to find out now.
	AI_Output(self,other, " DIA_Pyrokar_IgaranzNew_01_04 " );	// In exceptional situations, the test can be re-assigned, that's true.
	AI_Output(self,other, " DIA_Pyrokar_IgaranzNew_01_05 " );	// In such cases, the assignment to the novice should be given by the fourth member of the council - the guardian of the monastery's chambers.
	AI_Output(self,other, " DIA_Pyrokar_IgaranzNew_01_06 " );	// As you probably already understood, I'm talking about Talamone. And turn to him.
	AI_Output(self,other, " DIA_Pyrokar_IgaranzNew_01_07 " );	// Now go, - do not distract me anymore on such trifles.
	IS_PYROKAR_IGORANZINFO = TRUE ;
	; _ _ _ _ _ _
};

instance DIA_PYROKAR_PiratePray(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_PiratePray_condition;
	information = dia_pyrokar_PiratePray_info;
	permanent = FALSE;
	description = " I need your help. " ;
};

func int dia_pyrokar_PiratePray_condition()
{
	if(MIS_PiratePray == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pyrokar_PiratePray_info()
{
	AI_Output(other,self, " DIA_Pyrokar_PiratePray_01_00 " );		// I need your help.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_01 " );		// What are we talking about?
	AI_Output(other,self, " DIA_Pyrokar_PiratePray_01_02 " );		// It's a very delicate matter! It is necessary to pray for the souls of people whose crimes against Innos were quite great.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_03 " );		// What kind of people are these?

	if(RhetorikSkillValue[1] >= 60)
	{
		AI_Output(other,self, " DIA_Pyrokar_PiratePray_01_04 " );		// Pirates. But they want to start a new life and, above all, to atone for their sins.
		AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_05 " );		// Of course, this is a commendable zeal on their part...
		AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_06 " );		// But people of this kind are usually too heavily burdened by the burden of their crimes.
		AI_Output(other,self, " DIA_Pyrokar_PiratePray_01_07 " );		// Can't do anything?
		AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_08 " );		// Well, why, you can, of course. But you will have to make a very generous donation to the monastery.
		AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_09 " );		// For Innos to accept this expiatory prayer for their souls.
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_10");		//Сколько?
		AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_11 " );		// It all depends on your generosity, my son. But this donation must be no less than a thousand gold coins!
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_12");		//Понимаю.

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		PyrAgreePray = TRUE;
		B_LogEntry(TOPIC_PiratePray, " Pyrocar has agreed to pray for the souls of Greg's people. But first I must make a generous donation to the monastery - at least a thousand gold pieces. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Pyrokar_PiratePray_01_13 " );		// Pirates. But they want to start a new life and, above all, to atone for their sins.
		AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_14 " );		// Pirates? This is out of the question!
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_15");		//Но...
		AI_Output(self,other, " DIA_Pyrokar_PiratePray_01_16 " );		// No 'buts'! And don't you dare ask me for this again!
		PyrNotAgreePray = TRUE;
		B_LogEntry(TOPIC_PiratePray, " Pyrocar refused to pray for the souls of Greg's people. Will have to upset him. " );
		AI_StopProcessInfos(self);
	};
};

instance DIA_PYROKAR_PiratePray_Gold(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_PiratePray_Gold_condition;
	information = dia_pyrokar_PiratePray_Gold_info;
	permanent = TRUE;
	description = " Then pray for them. " ;
};

func int dia_pyrokar_PiratePray_Gold_condition()
{
	if((MIS_PiratePray == LOG_Running) && (PyrAgreePray == TRUE)) 
	{
		return TRUE;
	};
};

func void dia_pyrokar_PiratePray_Gold_info()
{
	AI_Output(other,self, " DIA_Pyrokar_PiratePray_Gold_01_00 " );		// Then pray for them. I will make a donation.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_Gold_01_01 " );		// And how much gold can you contribute to this good cause?
	Info_ClearChoices(DIA_Pyrokar_PiratePray_Gold);
	Info_AddChoice(DIA_Pyrokar_PiratePray_Gold, " I'll think about it. " ,DIA_Pyrokar_PiratePray_Gold_Back);

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold, " A thousand gold coins. " ,DIA_Pyrokar_PiratePray_Gold_One);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold, " Two thousand gold coins. " ,DIA_Pyrokar_PiratePray_Gold_Two);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold, " Three thousand gold coins. " ,DIA_Pyrokar_PiratePray_Gold_Three);
	};
};

func void DIA_Pyrokar_PiratePray_Gold_Back()
{
	AI_Output(other,self, " DIA_Pyrokar_PiratePray_Gold_Back_01_00 " );		// I'll think about it for now.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_Gold_Back_01_01 " );		// All right, my son. Whatever you think, get in touch.
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_One()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	AI_Output(other,self, " DIA_Pyrokar_PiratePray_Gold_One_01_00 " );		// A thousand gold coins.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_Gold_One_01_01 " );		// All right, my son.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_Gold_One_01_02 " );		// I accept your gift, and we will hold a prayer for the purification of the souls of these people.
	GregBonusPray = 1;
	B_LogEntry(TOPIC_PiratePray, " Pyrocar pray for the souls of Greg's people. " );
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_Two()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(other,self, " DIA_Pyrokar_PiratePray_Gold_Two_01_00 " );		// Two thousand gold coins.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_Gold_Two_01_01 " );		// That's very generous of you, my son.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_Gold_Two_01_02 " );		// I accept your gift, and we will hold a prayer for the purification of the souls of these people.
	GregBonusPray = 2;
	B_LogEntry(TOPIC_PiratePray, " Pyrocar will pray for the souls of Greg's people. " );
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_Three()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	AI_Output(other,self, " DIA_Pyrokar_PiratePray_Gold_Three_01_00 " );		// Three thousand gold coins.
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_Gold_Three_01_01 " );		// (respectfully) Well, I thank you from the bottom of my heart, my son, for such a generous donation!
	AI_Output(self,other, " DIA_Pyrokar_PiratePray_Gold_Three_01_02 " );		// I will immediately order that we immediately conduct a prayer for the purification of the souls of these people.
	GregBonusPray = 3;
	B_LogEntry(TOPIC_PiratePray, " Pyrocar will pray for the souls of Greg's people. " );
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

instance DIA_PYROKAR_DarkOrden(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrden_condition;
	information = dia_pyrokar_DarkOrden_info;
	permanent = FALSE;
	description = " Lord Hagen sent me. " ;
};

func int dia_pyrokar_DarkOrden_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_SendToPyro == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrden_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_01_00 " );		// Lord Hagen sent me.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_01 " );		// You don't have to continue. I can already guess what we're talking about.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_01_02 " );		// Then I need your wise advice!
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_03 " );		// To be honest, I don't even know how I can help you.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_04 " );		// All of our own research into what's going on hasn't given us any definitive answers to this question.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_05 " );		// However, there is one thing that might be of interest to you.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_07 " );		// In the ancient manuscripts that we managed to find in the library, it is said that something similar happened already before.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_08 " );		// Then the reason for everything was one very powerful artifact that awakened some terrible Evil to life!
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_01_09 " );		// What is this artifact?
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_10 " );		// Apparently, it's just an ordinary book... (cryptically) In those manuscripts, it's called Chromanin.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_01_11 " );		// Seems like I've heard about this thing before. Honestly, I don't remember where.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_12 " );		// Anyway, this is our only clue. So you'll have to find out everything you can about her.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_01_13 " );		// And how to do it? I don't even know where to look for her.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_14 " );		// Me too. However, this artifact is without a doubt the product of Beliar and his servants!
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_01_15 " );		// So, if we look for answers to questions that interest us, then only one of them.
	DO_SendToKriol = TRUE; 
	B_LogEntry(TOPIC_DarkOrden, " Pyrokar could not really answer why the undead invaded Khorinis, but told me that something like this had happened before. And the reason for this was an ancient artifact - a book that the Ancients called Chromanin. Pyrokar advised me to find out everything related to this books According to him, this artifact was generated by Beliar himself, and answers should be sought from one of his servants. " );
};

instance DIA_PYROKAR_DarkOrdenKnown(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrdenKnown_condition;
	information = dia_pyrokar_DarkOrdenKnown_info;
	permanent = FALSE;
	description = " I found out the cause of the undead invasion. " ;
};

func int dia_pyrokar_DarkOrdenKnown_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_KnowAboutDO == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrdenKnown_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Pyrokar_DarkOrdenKnown_01_00 " );		// I found out the reason for the undead invasion.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_01 " );		// Well, that's good news! Tell me everything you know, my son.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrdenKnown_01_02 " );		// Okay, but first answer me one question. How many noble paladins are buried in Khorinis?
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_03 " );		// You asked a rather difficult question. Let me think...
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_04 " );		// (thoughtfully) In my memory there were only three of them - lords Inubis, Mirath and Ulzar.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_05 " );		// They were all honored members of the paladin order. And their tombs are here on the island.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_06 " );		// Why are you asking about this?
	AI_Output(other,self, " DIA_Pyrokar_DarkOrdenKnown_01_07 " );		// After their death, these paladins rose up as powerful undead.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrdenKnown_01_08 " );		// It is they who send hordes of the undead to Khorinis. And only by putting their souls to rest can we stop the invasion.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_09 " );		// Are you out of your mind? O Innos, this is pure sacrilege!
	AI_Output(other,self, " DIA_Pyrokar_DarkOrdenKnown_01_10 " );		// I understand your feelings, but we have no other way.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrdenKnown_01_11 " );		// We need to check these tombs. Otherwise it will be too late!
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_12 " );		// (excitedly) I must be crazy to let you do this.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_13 " );		// But apparently you're right and we can't afford to take that risk.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_14 " );		// The keys that unlock these tombs are here, in the monastery.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_15 " );		// Here, take them.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItKe_Hagen_Innubis,1);
	CreateInvItems(other,ItKe_Hagen_DarkOrder_01,1);
	CreateInvItems(other,ItKe_Hagen_DarkOrder_02,1);
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenKnown_01_16 " );		// However, I still hope that you made a mistake in your calculations, and these noble people are not to blame for anything.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrdenKnown_01_17 " );		// I would like to believe it.
	B_LogEntry(TOPIC_DarkOrden, " Reluctantly, Pyrokar gave me the keys to the paladin tombs. Time to pay them a visit. " );
	AI_StopProcessInfos(self);

	Wld_InsertNpc(DARKTOWER_SKELETON_LORD,"NW_FARM2_TAVERNCAVE1_09");
	Wld_InsertNpc(skeleton_warrior_dark,"NW_FARM2_TAVERNCAVE1_10");
	Wld_InsertNpc(skeleton_warrior_dark,"NW_FARM2_TAVERNCAVE1_08");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FARM2_TAVERNCAVE1_07");

	Wld_InsertNpc(SKELETON_LORD_MIRAT,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_MAIN");
	Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_10_01");
	Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_07_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_TROLLAREA_TROLLROCKCAVE_06");

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(skeleton_dark,"FP_ITEM_STONETPLATETEACH_25");
		Wld_InsertNpc(skeleton_dark,"FP_ITEM_FOREST_STPLATE_04");
		Wld_InsertNpc(skeleton_dark,"NW_FARM2_TAVERNCAVE1_06");
		Wld_InsertNpc(skeleton_dark,"NW_FARM2_TAVERNCAVE1_04");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_09");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_08");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_04");

		Wld_InsertNpc(skeleton,"NW_TROLLAREA_TROLLROCKCAVE_02");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_03_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_03_01");
		Wld_InsertNpc(skeleton,"NW_TROLLAREA_TROLLROCKCAVE_03");
		Wld_InsertNpc(skeleton_warrior,"NW_TROLLAREA_TROLLROCKCAVE_01");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_04");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_02");

		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM2_TO_TAVERNCAVE1_05");

		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_04");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_05");

		Wld_InsertNpc(skeleton,"NW_CRYPT_01");
		Wld_InsertNpc(skeleton_warrior,"CRYPT");
		Wld_InsertNpc(skeleton_dark,"NW_CRYPT_10");
		Wld_InsertNpc(skeleton,"NW_CRYPT_05");
		Wld_InsertNpc(skeleton_warrior,"NW_CRYPT_03");
		Wld_InsertNpc(skeleton_dark,"NW_CRYPT_02");
	};
};

instance DIA_PYROKAR_DarkOrdenWhere(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrdenWhere_condition;
	information = dia_pyrokar_DarkOrdenWhere_info;
	permanent = FALSE;
	description = " Where can I find these tombs? " ;
};

func int dia_pyrokar_DarkOrdenWhere_condition()
{
	if ((MIS_DarkOrder == LOG_Running) && (Npc_KnowsInfo(other,DIA_Pyrokar_DarkOrderKnown) ==  TRUE ) && (KillDeadPalAll ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrdenWhere_info()
{
	AI_Output(other,self, " DIA_Pyrokar_DarkOrdenWhere_01_00 " );		// Where can I find these tombs?
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenWhere_01_01 " );		// One of them is near Onar's farm.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenWhere_01_02 " );		// The second one is at the fork, in the cave near the Dead Harpy tavern.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrdenWhere_01_03 " );		// You'll find the third one near the Circle of the Sun, in a small hollow.
};

instances DIA_PYROKAR_DarkOrden_SLK (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrden_SLK_condition;
	information = dia_pyrokar_DarkOrden_SLK_info;
	permanent = FALSE;
	description = " I have visited all three tombs. " ;
};

func int dia_pyrokar_DarkOrden_SLK_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (KillDeadPalAll == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrden_SLK_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_SLK_01_00 " );		// I have visited all three tombs.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_01 " );		// And what did you find out?
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_SLK_01_02 " );		// As expected, they were all just swarming with the undead. So I had to do some cleaning up there.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_03 " );		// O Innos! So your fears have been confirmed. What about the paladins themselves?
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_SLK_01_04 " );		// I hope I put their souls to rest forever. They will no longer disturb the inhabitants of this island.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_05 " );		// May Innos bless them. All the same, during their lifetime they were worthy people!
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_06 " );		// However, it's too early for us to rejoice. I recently received a message from Lord Hagen.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_07 " );		// According to him, the city is still constantly under attack from the undead.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_08 " );		// And it seems to be getting bigger and bigger!
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_SLK_01_09 " );		// How so? Did our plan not work?
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_10 " );		// I don't have an answer to this question.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_11 " );		// But apparently, our actions made the enemy even more zealous to unleash all his fury on us.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_12 " );		// If this continues, the city will soon fall. And then the whole island.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_SLK_01_13 " );		// Then what can we do now?
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_14 " );		// (depressed) I think we're on the right track. However, they still missed something.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_15 " );		// Something that could hide from our eyes, not allowing us to fully understand the current situation.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_16 " );		// So the only thing that comes to my mind now is to go to the city and talk to Lord Hagen himself.
	AI_Output(self,other, " DIA_Pyrokar_DarkOrden_SLK_01_17 " );		// After all, he is the head of the paladin order! And he will probably be able to tell us more about those people.
	AI_Output(other,self, " DIA_Pyrokar_DarkOrden_SLK_01_18 " );		// Okay, I'm heading to him immediately.
	DO_SendToHagen = TRUE;
	B_LogEntry(TOPIC_DarkOrden, " I informed the Pyrocar about clearing the tombs of the undead and resting the souls of the damned paladins. But the undead attacks didn't stop there. It feels like we've hurt the beast, and now it's extremely dangerous in its agony. I need to talk about those paladins with Lord Hagen - perhaps he knows something about them that we don't. " );
	AI_StopProcessInfos(self);

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(skeleton_warrior,"FP_CAMPFIRE_NW_ATC_ORC_50");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_NW_ATC_ORC_177");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_ATC_ORC_176");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_178");
		Wld_InsertNpc(Zombie02,"FP_ROAM_NW_ATC_ORC_179");
		Wld_InsertNpc(skeleton_warrior,"NW_CITY_CONNECT_FOREST");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_CAMPFIRE_NW_ATC_ORC_124");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_ATC_ORC_101");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_102");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_ATC_ORC_104");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FARM1_CONNECT_CITY");
	};

	Wld_InsertNpc(KDW_1406_Mitras,"NW_MITRAS_JARCURSE");
	B_StartOtherRoutine(KDW_140300_Addon_Myxir_CITY,"JarCurse");
};

instance DIA_Pyrokar_MAXROBE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_MAXROBE_condition;
	information = DIA_Pyrokar_MAXROBE_info;
	permanent = FALSE;
	description = " How about a better robe? " ;
};

func int DIA_Pyrokar_MAXROBE_condition()
{
	if ((hero.guild ==  GIL_KDF ) && (Chapter >=  5 ) && (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==  6 ) && (LastRobeKDF ==  FALSE ) && (MAXROBE_Permanent ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAXROBE_info()
{
	AI_Output(other,self, " DIA_Pyrokar_MAXROBE_01_00 " );	// How about a better robe?
	AI_Output(self,other, " DIA_Pyrokar_MAXROBE_01_01 " );	// Since you are proficient with all six Circles of Magic, you are worthy to wear the Robe of the Fire Archmage!
	AI_Output(self,other, " DIA_Pyrokar_MAXROBE_01_02 " );	// However, you will have to pay for it. Its production costs us dearly, so we cannot give it away for free.
	LastRobeKDF = TRUE;
};

instance DIA_Pyrokar_MAXROBE_Buy(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_MAXROBE_Buy_condition;
	information = DIA_Pyrokar_MAXROBE_Buy_info;
	permanent = TRUE;
	description = " Sell me the Robe of the Fire Archmage. (Price: 25,000 coins) " ;
};

func int DIA_Pyrokar_MAXROBE_Buy_condition()
{
	if (( hero . guild ==  GIL_KDF ) && ( LastRobeKDF ==  TRUE ) && ( MAXROBE_Permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAXROBE_Buy_info()
{
	AI_Output(other,self, " DIA_Pyrokar_MAXROBE_Buy_01_00 " );	// Sell me the Robe of the Fire Archmage.

	if(Npc_HasItems(hero,ItMi_Gold) >= 25000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,25000);
		Npc_RemoveInvItems(self,ItMi_Gold,25000);
		AI_Output(self,other, " DIA_Pyrokar_MAXROBE_Buy_01 " );	// Good. Here, hold her.
		AI_Output(self,other, " DIA_Pyrokar_MAXROBE_Buy_02 " );	// It's a great honor to wear such an attire. Remember this.
		CreateInvItems(self,itar_kdf_sh,1);
		B_GiveInvItems(self,other,itar_kdf_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Pyrokar_MAXROBE_Buy_01_03 " );	// Sorry, but you don't have enough gold for this.
	};
};
	
instance DIA_Pyrokar_Fregarah (C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_Fregarah_Condition;
	information = DIA_Pyrokar_Fregarah_Info;
	permanent = FALSE;
	description = " I have one question. " ;
};

func int DIA_Pyrokar_Fregarah_Condition()
{
	if(MIS_XRANFREG == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_01_00 " );	// I have one question.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_01 " );	// Ask.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_01_02 " );	// In the library of the monastery, I found a record about an expedition to the mountains of Khorinis.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_01_03 " );	// And as I understand it, several Firebenders, including you, took part in it.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_04 " );	// Yes, you're right. This expedition took place by decision of the High Council of the Firebenders.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_05 " );	// We had to find out how rich this area was in magical ore deposits.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_06 " );	// And also to describe a little the general picture of those lands hitherto unknown to us.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_01_07 " );	// The notes said you found some ancient temple guarded by a stone golem.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_08 " );	// It was not just a golem, but a real rock cliff come to life!
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_09 " );	// Which, on top of everything else, also possessed incredible power.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_10 " );	// The paladins accompanying me and the other Firebenders tried to stop him.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_11 " );	// But only one blow was enough for him to send most of them to the realm of Innos.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_01_12 " );	// And what happened next?
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_13 " );	// Only a miracle then saved us from death! I managed to cast a teleportation spell just in time, which took us back to Khorinis.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_14 " );	// Since then, we no longer remember this incident.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_01_15 " );	// True, the image of that stone giant is still in my head!
	B_LogEntry( TOPIC_XRANFREG , " Pyrocar told me about the expedition and the stone giant. According to him, he was of incredible size and had tremendous power. " );
};
	
instance DIA_Pyrokar_Fregarah_Mage(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_Fregarah_Mage_Condition;
	information = DIA_Pyrokar_Fregarah_Mage_Info;
	permanent = FALSE;
	description = " Which other mages knew about this expedition? " ;
};

func int DIA_Pyrokar_Fregarah_Mage_Condition()
{
	if (( MIS_XRANFREG  == LOG_Running ) && ( Npc_KnowsInfo ( other , DIA_Pyrokar_Fregarah ) ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Mage_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Mage_01_00 " );	// Who else among the magicians knows about this expedition?
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Mage_01_01 " );	// There aren't too many of them. Corristo, Damarok, Drago and that renegade Xardas!
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Mage_01_02 " );	// But most of them ended up trapped in the Valley of Mines after the magic barrier was cast.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Mage_01_03 " );	// So I'm the only one alive today who knows what happened that day.
	B_LogEntry( TOPIC_XRANFREG , " From Pyrokar's words, I deduced that he and Xardas were the only ones alive today who were aware of what happened then. " );
	XRANFREGXAR = TRUE;

	if ((Chapter >=  5 ) && (XarGiveFirstTome ==  FALSE ))
	{
		Wld_InsertItem(ItWr_Fregarah,"FP_ITEM_XARDAS_07");
		Wld_InsertItem(itke_xardasowt,"FP_ITEM_XARDAS_05");
	};
};

var int PyrokarRuneDay;
var int PyrokarRuneDo;
	
instance DIA_Pyrokar_Fregarah_Know(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_Fregarah_Know_Condition;
	information = DIA_Pyrokar_Fregarah_Know_Info;
	permanent = FALSE;
	description = " About that stone golem. " ;
};

func int DIA_Pyrokar_Fregarah_Know_Condition()
{
	if (( MY_XRANFREG  == LOG_Running ) && ( StonnosHrAll ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Know_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_00 " );	// About that stone golem.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_01 " );	// I found out what this creature was and where it came from.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_02 " );	// Did you really know about everything? But how?
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_03 " );	// This is too long to explain. Just take my word for it.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_04 " );	// So, that creature has a divine origin under it.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_05 " );	// And the source of his power is just an ordinary magic ore.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_06 " );	// Oh Innos... (hesitantly) And you're right!
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_07 " );	// As far as I remember, its entire base was indeed covered with rock that very much resembled this ore.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_08 " );	// We did not attach much importance to this then, but now everything becomes clear to me.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_09 " );	// It's also clear that you didn't have a single chance to resist him back then.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_10 " );	// Only a huge flow of magical energy that has the same properties can harm him.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_11 " );	// You mean the magic contained in the ore itself?
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_12 " );	// Absolutely right. Only it should be a lot. But that's not all...
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_13 " );	// The main question remains - what object is capable of absorbing such a huge amount of magical energy?
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_14 " );	// Only a magic rune... (confidently) And only it.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_15 " );	// What about weapons?
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_16 " );	// I'm not sure if there is such a weapon in the world.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_17 " );	// But, even if it exists, it will still have to use the rune as a container to store magical energy.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_18 " );	// Without it, the sword simply has nowhere to store it.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_19 " );	// Can you make this rune for me?
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_20 " );	// So are you seriously going to compete with that stone giant?
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_21");	//Возможно.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_22 " );	// But this is pure madness!
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_23 " );	// So will you make this rune for me or not?
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_24 " );	// Okay, it's up to you... (shaking his head) Of course I will! And I will say even more.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_25 " );	// You'll need not only a rune, but also a scroll with an energy transfer spell.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_26 " );	// I'll make you a rune that can absorb it on its own.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_27 " );	// The main thing is to be close to the very source of magic!
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_28 " );	// Great. And how long will it take to make it?
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_29 " );	// I believe that by tomorrow morning it will be ready.
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_Know_01_30 " );	// Okay, then I'll visit you tomorrow.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_Know_01_31 " );	// As you say, my son.
	B_LogEntry( TOPIC_XRANFREG , " I told Pyrokar everything I could find out about the stone golem. He promised me to make a rune that can absorb a huge amount of magical energy and with which I can defeat that creature - if, of course, I present myself a chance to meet him. " );
	PyrokarRuneDay = Wld_GetDay();
	PyrokarRuneDo = TRUE;
};

instance DIA_Pyrokar_Fregarah_RuneDo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_Fregarah_RuneDo_Condition;
	information = DIA_Pyrokar_Fregarah_RuneDo_Info;
	permanent = FALSE;
	description = " How is my rune doing? " ;
};

func int DIA_Pyrokar_Fregarah_RuneDo_Condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_XRANFREG == LOG_Running) && (PyrokarRuneDo == TRUE) && (PyrokarRuneDay <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_RuneDo_Info()
{
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_RuneDo_01_00 " );	// How's my rune doing?
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_RuneDo_01_01 " );	// She's ready. Here, take her.
	B_GiveInvItems(self,other,ItMi_PyroRune,1);
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_RuneDo_01_02 " );	// However, I still want to stop you before it's too late.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_RuneDo_01_03 " );	// Meeting this creature could cost you your life!
	AI_Output(other,self, " DIA_Pyrokar_Fregarah_RuneDo_01_04 " );	// I'll think about your words. And, of course, thanks for the rune.
	AI_Output(self,other, " DIA_Pyrokar_Fregarah_RuneDo_01_05 " );	// (sighing) No way, my son...
	; _ _ _ _ _ _
};
Footer
