
	
instance DIA_ADDON_INEXTREMO_ANNOUNCER_EXIT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 999;
	condition = dia_addon_inextremo_announcer_exit_condition;
	information = dia_addon_inextremo_announcer_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_announcer_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_announcer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_PICKPOCKET(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 900;
	condition = dia_addon_inextremo_announcer_pickpocket_condition;
	information = dia_addon_inextremo_announcer_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_announcer_pickpocket_condition()
{
	return  C_Robbery ( 118 , 300 );
};

func void dia_addon_inextremo_announcer_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
	Info_AddChoice(dia_addon_inextremo_announcer_pickpocket,Dialog_Back,dia_addon_inextremo_announcer_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_announcer_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_announcer_pickpocket_doit);
};

func void dia_addon_inextremo_announcer_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
};

func void dia_addon_inextremo_announcer_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HI(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hi_condition;
	information = dia_addon_inextremo_announcer_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hi_info()
{
	AI_Output(self,other, " DIA_pir_1398_Hi_01_00 " );	// What do you need?! Can't you see we're working.
	AI_Output(self,other, " DIA_pir_1398_Hi_01_01 " );	// Let's talk later!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HALLO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hallo_condition;
	information = dia_addon_inextremo_announcer_hallo_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_addon_inextremo_announcer_hallo_condition()
{
	if((JOINKILLERS == FALSE) && (Npc_GetDistToWP(self,"OCR_ANNOUNCER") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hallo_info()
{
	AI_Output(other,self,"DIA_pir_1398_Hallo_01_00");	//Кто вы?
	AI_Output(self,other, " DIA_pir_1398_Hallo_01_03 " );	// Why, can't you see? (laughs) We are a troupe of itinerant musicians, we entertain and amuse the local audience.
	AI_Output(other,self, " DIA_pir_1398_Hallo_01_04 " );	// And how long have you been in the city?
	AI_Output(self,other, " DIA_pir_1398_Hallo_01_05 " );	// It's been several months now. Usually we try not to stay in one place for a long time, but...
	AI_Output(self,other, " DIA_pir_1398_Hallo_01_06 " );	// ...not a single ship has entered the local port until recently. Unless, of course, you count the paladin galleys that arrived a couple of weeks ago.
	AI_Output(self,other, " DIA_pir_1398_Hallo_01_09 " );	// Although, by and large, we don't care where we perform.
	MEASURING STID = TRUE ;
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HALLOTWO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hallotwo_condition;
	information = dia_addon_inextremo_announcer_hallotwo_info;
	permanent = FALSE;
	description = " How do you like your life? " ;
};


func int dia_addon_inextremo_announcer_hallotwo_condition()
{
	if (Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hello) && ( CHECKFLAGKILLSMEET  ==  FALSE ) && ( JOINKILLERS  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hallotwo_info()
{
	AI_Output(other,self, " DIA_pir_1398_HalloTwo_01_00 " );	// And how do you like this life?
	AI_Output(self,other, " DIA_pir_1398_HalloTwo_01_01 " );	// Yes, it seems there is no need to complain. For now.
	AI_Output(self,other, " DIA_pir_1398_HalloTwo_01_02 " );	// We don't need much - a couple of gold coins to feed ourselves, and sometimes put the guys on a drink.
	AI_Output(self,other, " DIA_pir_1398_HalloTwo_01_03 " );	// Most of the people in this town seem to enjoy our performances.
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MENTION(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_mention_condition;
	information = dia_addon_inextremo_announcer_mention_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_mention_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hallotwo) && (CHECKFLAGKILLSMEET == FALSE) && (Npc_GetDistToWP(self,"OCR_ANNOUNCER") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_mention_info()
{
	AI_Output(self,other, " DIA_pir_1398_Mention_01_00 " );	// Yes... and one more thing.
	AI_Output(self,other, " DIA_pir_1398_Mention_01_02 " );	// I want to ask you not to bother the other guys.
	AI_Output(self,other, " DIA_pir_1398_Mention_01_03 " );	// We've been performing almost all day. And, of course, after a hard day they want to relax a bit.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_TELLABOUTKILLERS(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_tellaboutkillers_condition;
	information = dia_addon_inextremo_announcer_tellaboutkillers_info;
	permanent = FALSE;
	description = " Do you know anything about the Assassin's Guild? " ;
};


func int dia_addon_inextremo_announcer_tellaboutkillers_condition()
{
	if (Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hallo) && ( CANCOMPLETEGUILKILL  ==  FALSE ) && Npc_KnowsInfo(hero,dia_ramirez_guildkill) && ( KILLCANJOIN  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_tellaboutkillers_info()
{
	AI_Output(other,self, " DIA_pir_1398_TellAboutKillers_01_00 " );	// Do you know anything about the Assassin's Guild?
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_01_01");	//ЧТО?!
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_01_04 " );	// Who told you that I know anything about this?
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutkillers, " Ramirez told me about it. " ,dia_addon_inextremo_announcer_tellaboutkillers_ramirez);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutkillers, " It doesn't matter. " ,dia_addon_inextremo_announcer_tellaboutkillers_nomatter);
};

func void dia_addon_inextremo_announcer_tellaboutkillers_ramirez()
{
	AI_Output(other,self, " DIA_pir_1398_TellAboutKillers_Ramirez_01_00 " );	// Ramirez told me about it.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_Ramirez_01_01 " );	// (thoughtfully) Ramirez, you say?
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_Ramirez_01_02 " );	// Hmmm... I think someone's tongue is too long.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_Ramirez_01_05 " );	// So you're interested in the Assassin's Guild, I take it. And why do you need them?
	AI_Output(other,self, " DIA_pir_1398_TellAboutKillers_Ramirez_01_06 " );	// I have one little thing to do with them.
	AI_Output(other,self, " DIA_pir_1398_TellAboutKillers_Ramirez_01_10 " );	// Just tell me what you know about them and where I can find them.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_Ramirez_01_13 " );	// Hmmm... (looking closely)
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_Ramirez_01_14 " );	// Okay. If you are so impatient to play with death, then I can arrange this meeting for you.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_Ramirez_01_15 " );	// Tomorrow at about midnight, come to the abandoned house on the pier. There you will find the one you were looking for.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_Ramirez_01_16 " );	// (smiles) And don't be late. You won't get another chance.
	B_LogEntry( TOPIC_GUILDKILL , " Gillian is ready to arrange a meeting with the Assassin's Guild for me. To do this, I need to arrive at a house by the sea near the pier about an hour after midnight. " );
	KILLSMEET = TRUE;
	THIEFKILLS = TRUE;
	MIS_KILLSMEET_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_announcer_tellaboutkillers_nomatter()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_pir_1398_TellAboutKillers_NoMatter_01_00 " );	// It doesn't matter. You know there are rumors...
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_NoMatter_01_01 " );	// Hmmm... (looks closely) Are you talking about rumors? OK.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_NoMatter_01_03 " );	// So, you're interested in the Assassin's Guild, I take it. And why do you need them?
	AI_Output(other,self, " DIA_pir_1398_TellAboutKillers_NoMatter_01_04 " );	// I have one little thing to do with them.
	AI_Output(other,self, " DIA_pir_1398_TellAboutKillers_NoMatter_01_08 " );	// Tell me what you know about them and where I can find them.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_NoMatter_01_11 " );	// Hmmm... (looking closely)
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_NoMatter_01_12 " );	// Well, good! If you are so impatient to play with death, then I can arrange this meeting for you.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_NoMatter_01_13 " );	// Tomorrow, about an hour after midnight, come to the abandoned house on the pier. There you will find the one you were looking for.
	AI_Output(self,other, " DIA_pir_1398_TellAboutKillers_NoMatter_01_14 " );	// (smiles) And don't be late. You won't get another chance.
	B_LogEntry( TOPIC_GUILDKILL , " Gillian is ready to arrange a meeting with the assassins guild for me. To do this, I need to come to the house by the sea near the pier tomorrow about an hour after midnight. " );
	KILLSMEET = TRUE;
	MIS_KILLSMEET_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MEETINHOUSE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_meetinhouse_condition;
	information = dia_addon_inextremo_announcer_meetinhouse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_meetinhouse_condition()
{
	if((KILLSMEET == TRUE) && (CHECKFLAGKILLSMEET == TRUE) && (JOINKILLERS == FALSE) && Npc_IsInState(self,ZS_Talk) && (MIS_GUILDKILL == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_meetinhouse_info()
{
	B_GivePlayerXP(250);
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_01_00 " );	// So, you did come... (laughs) I didn't expect you to have the guts to do it!
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_01_01 " );	// Gillian?!
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_01_02 " );	// What, surprised? You shouldn't be so surprised. After all, you yourself were looking for this meeting.
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_01_03 " );	// So you're one of those guys in the Assassin's Guild?
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_01_04 " );	// Like everyone you see around here.
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_01_05 " );	// Hmmm... so that's what ordinary itinerant musicians do in their free time. Who would have thought...
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_01_06 " );	// Everyone earns his bread the way he can... (laughs)
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_01_07 " );	// But enough chit-chat - we don't have much time for that right now.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_01_08 " );	// So tell me what you need from us?
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_01_09 " );	// And I really hope that the reason that brought you here is worthy of us listening to you.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_01_10 " );	// Otherwise, this conversation will end pretty quickly. Just like your life! (laughs)
	GUILDKILLKNOWNLOC = TRUE;
	B_LogEntry( TOPIC_GUILDKILL , " I came to the meeting at the appointed time. Gillian was there too... A troupe of itinerant musicians who arrived in the city a couple of weeks ago turned out to be the very guild of assassins that terrified the inhabitants of Khorinis. Now everything depends on my further actions - I need to somehow get out of this situation. " );
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse, " I came here to kill you. " ,dia_addon_inextremo_announcer_meetinhouse_kill);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse, " I want to join you. " ,dia_addon_inextremo_announcer_meetinhouse_join);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse, " I'm looking for a man named Asmal. " ,dia_addon_inextremo_announcer_meetinhouse_asmal);
};

func void dia_addon_inextremo_announcer_meetinhouse_asmal()
{
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Asmal_01_00 " );	// I'm looking for a man named Asmal.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Asmal_01_01 " );	// Asmal? Do you need Asmal? (laughs)
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Asmal_01_02 " );	// Well, then you can consider that you have already found it. Asmal is me!
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Asmal_01_03 " );	// Anything else?
	B_LogEntry( TOPIC_GUILDKILL , " Gillian turned out to be Asmal! A bit imprudent of him, but who knows - maybe this is the last thing I can find out in this case. " );
	self.name[0] = "Асмал";
	KNOWSASMAL = TRUE;
};

func void dia_addon_inextremo_announcer_meetinhouse_kill()
{
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Kill_01_00 " );	// I came here to kill you.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Kill_01_01 " );	// WHAT?! (laughs) Have you really decided that you are such a cool guy and you can do it?
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Kill_01_02 " );	// (laughs) Well, you're a fool!
	B_LogEntry( TOPIC_GUILDKILL , " I showed my cards by telling Asmal I came to kill them. He laughed at my bold statement. Am I strong enough to take on his entire gang? " );
	if (( THIEFKILLS  ==  TRUE ) &&  ! (Npc_IsDead(Cassia) ||  ! Npc_IsDead(Jesper) ||  ! Npc_IsDead(Ramirez)))
	{
		AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Kill_01_05 " );	// Ha! You'll end up like your thieves guild friends with too long tongues.
		AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Kill_01_06");	//ЧТО?
		AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Kill_01_07 " );	// You thought I'd let guys like this Ramirez talk about things that are best kept quiet?
		; _ _ _ _ _ _
		B_KillNpc(VLK_447_Cassia);
		B_KillNpc(VLK_446_Jesper);
		B_KillNpc(VLK_445_Ramirez);
		B_KillNpc(VLK_494_Attila);
	};
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Kill_01_08 " );	// So better save your fire for something else, sucker, and prepare to die!
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Kill_01_10 " );	// Then let's not waste time.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Kill_01_11 " );	// Well, whatever you say!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_join()
{
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Join_01_00 " );	// I want to join you.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Join_01_01 " );	// (puzzled) What? Hmmm... yes, boy, you must be so arrogant!
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Join_01_02 " );	// Come here to offer us this! (laughs) Hey guys, did you hear that?
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Join_01_04 " );	// Well, talk. Why did you suddenly decide that we need your services?
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Join_01_05 " );	// I am in the service of Lord Andre in his city guard and...
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Join_01_08 " );	// ...thought you could use someone who has connections in these circles.
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Join_01_09 " );	// This would solve a lot of your militia problems!
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Join_01_10 " );	// Hmmm... right. Maybe such a person could really come in handy.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Join_01_11 " );	// But how do we know that you will not run immediately after this meeting to the same Lord Andre and tell about everything that you saw here.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Join_01_12 " );	// Besides, I can't figure out what's the benefit to you?
	B_LogEntry( TOPIC_GUILDKILL , " I told Asmal that I wanted to join them. He was very surprised by this fact and wanted to know the reason that prompted me to make such an offer to them. " );
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse, " I heard killers make good money doing their jobs. " ,dia_addon_inextremo_announcer_meetinhouse_money);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse, " This is none of your business! " ,dia_addon_inextremo_announcer_meetinhouse_notyours);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse, " Does it really matter? " ,dia_addon_inextremo_announcer_meetinhouse_donttell);
};

func void dia_addon_inextremo_announcer_meetinhouse_money()
{
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Money_01_00 " );	// I've heard that assassins make good money doing their jobs.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Money_01_01 " );	// You love gold, don't you?
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_Money_01_02 " );	// And who doesn't love him.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Money_01_04 " );	// As far as I know, Lord Andre takes good care of his people.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Money_01_06 " );	// And all this tells me that you are not a very reliable person!
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Money_01_07 " );	// I think you'd easily turn us in at the mere sight of gold.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Money_01_08 " );	// Sorry, but we don't need such people.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Money_01_10");	//Погоди...
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_Money_01_11 " );	// Hey guys! Let's teach this bastard a lesson!
	B_LogEntry( TOPIC_GUILDKILL , " I failed to impress Asmal with my arguments. Now I have two options: kill them all or try to get out of here alive to tell Lord Andre what happened. " );
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_notyours()
{
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_NotYours_01_00 " );	// This doesn't concern you!
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_NotYours_01_01 " );	// Oh, you are deeply mistaken!
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_NotYours_01_02 " );	// I think, most likely, you yourself do not know why you need this.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_NotYours_01_03 " );	// And this leads to very suspicious thoughts.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_NotYours_01_04 " );	// And with everything suspicious, in my opinion, it is always better to finish immediately.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_NotYours_01_07");	//Погоди...
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_NotYours_01_08 " );	// Hey guys! Let's teach this bastard a lesson!
	B_LogEntry( TOPIC_GUILDKILL , " I failed to impress Asmal with my arguments. Now I have two options: kill them all or try to get out of here alive to tell Lord Andre what happened. " );
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_donttell()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_DontTell_01_00 " );	// Is it really that important?
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_DontTell_01_01 " );	// I'm already taking a big risk by coming here.
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_DontTell_01_02 " );	// So you can rest assured that my reasons are good enough.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_04 " );	// So you want to become one of us... (looks carefully)
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_05 " );	// Okay. Think you've convinced me.
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_DontTell_01_06 " );	// So I'm in a guild now?
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_07 " );	// Yes! Now you are one of us.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_08 " );	// But remember: you can't count on much just yet.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_11 " );	// You still have to prove that you can not only talk your tongue, but also do something more serious.
	AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_13 " );	// I hope you understand what I'm talking about.
	AI_Output(other,self, " DIA_pir_1398_MeetInHouse_DontTell_01_17 " );	// I understand.
	if(KNOWSASMAL == FALSE)
	{
		AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_19 " );	// And one more thing...
		AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_20 " );	// Gillian is not my real name.
		AI_Output(self,other, " DIA_pir_1398_MeetInHouse_DontTell_01_22 " );	// Everyone knows me as Asmala. So please contact me this way.
		self.name[0] = "Асмал";
		KNOWSASMAL = TRUE;
	};
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	B_LogEntry( TOPIC_GUILDKILL , " I managed to impress Asmal. He agreed to accept me into their guild under rather tough conditions, but you don't have to choose. " );
	if(JOINKILLERS == FALSE)
	{
		MIS_KILLWAY = LOG_Running;
		Log_CreateTopic(TOPIC_KILLWAY,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KILLWAY,LOG_Running);
		B_LogEntry( TOPIC_KILLWAY , " Asmal accepted me into the killer's guild. True, so far only in words - until I prove to him that I really deserve it. " );
		JOINKILLERS = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MEETKILLERS(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_meetkillers_condition;
	information = dia_addon_inextremo_announcer_meetkillers_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_meetkillers_condition()
{
	if((MIS_GERBRANDTHELP == LOG_Running) && (MEETCHIEFKILLERSLAIT == FALSE) && Npc_IsInState(self,ZS_Talk) && (APEARKILLER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_meetkillers_info()
{
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);

	if ( MEASID  ==  TRUE )
	{
		AI_Output(self,other, " DIA_pir_1398_MeetKillers_01_00 " );	// Hey you! What do you need here?
		AI_Output(other,self, " DIA_pir_1398_MeetKillers_01_01 " );	// Uh... I have to meet someone here.
		AI_Output(self,other, " DIA_pir_1398_MeetKillers_01_02 " );	// huh? Truth?! Hmmm...
		AI_Output(self,other, " DIA_pir_1398_MeetKillers_01_03 " );	// Well, then consider that this meeting has already happened... (looks carefully)
		AI_Output(other,self, " DIA_pir_1398_MeetKillers_01_04 " );	// Why are you looking at me like that?
		AI_Output(self,other, " DIA_pir_1398_MeetKillers_01_05 " );	// Hmmm... your face looks familiar to me. Have we met somewhere before?
		AI_Output(self,other, " DIA_pir_1398_MeetKillers_01_08 " );	// Okay, it doesn't matter now.
		AI_Output(self,other, " DIA_pir_1398_MeetKillers_01_10 " );	// So, that means you were looking for me?
		B_LogEntry( TOPIC_GERBRANDTHELP , " I met the man Gerbrandt was talking about, as agreed - in the tavern, exactly at the appointed time. It turned out to be one of the traveling musicians - Gillian. However, this time he was not so kind, like when we first met. " );
	}
	else
	{
		AI_Output(self,other, " DIA_pir_1398_MeetKillers_01_11 " );	// Hey man, were you looking to meet me?!
		B_LogEntry( TOPIC_GERBRANDTHELP , " I met the person Gerbrandt was talking about, as agreed - in the tavern, exactly at the appointed time. " );
	};

	MEETCHIEFKILLERS = TRUE;
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Да, это был я.",dia_addon_inextremo_announcer_meetkillers_me);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Ну, не совсем я...",dia_addon_inextremo_announcer_meetkillers_notme);
};

func void dia_addon_inextremo_announcer_meetkillers_notme()
{
	STIDKILLME = TRUE;
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_NotMe_01_00 " );	// Well, not exactly me...
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_NotMe_01_01 " );	// (surprised) What does that mean?!
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_NotMe_01_02 " );	// One person sent me to meet you.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_03");	//И кто же?
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_NotMe_01_04 " );	// I can't tell. He asked that his name be kept secret.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_NotMe_01_05 " );	// Hmmm... okay.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_NotMe_01_06 " );	// And what does he want from me?
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
	{
		Info_AddChoice(dia_addon_inextremo_announcer_meetkillers, " Here, take this wallet and letter. " ,dia_addon_inextremo_announcer_meetkillers_giveger);
	};
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Понятия не имею.",dia_addon_inextremo_announcer_meetkillers_dontknow);
};

func void dia_addon_inextremo_announcer_meetkillers_me()
{
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Me_01_00 " );	// Yes, that was me.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Me_01_01 " );	// Okay, so what do you want from me?
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
	{
		Info_AddChoice(dia_addon_inextremo_announcer_meetkillers, " Here, take this wallet and letter. " ,dia_addon_inextremo_announcer_meetkillers_giveger);
	};
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Понятия не имею.",dia_addon_inextremo_announcer_meetkillers_dontknow);
};

func void dia_addon_inextremo_announcer_meetkillers_dontknow()
{
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_DontKnow_01_00 " );	// I have no idea.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontKnow_01_01 " );	// Hmmm. And you are a joker, as I see it ... (laughs)
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontKnow_01_03 " );	// Let me explain a couple of things to you.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontKnow_01_04 " );	// My time is my money!
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontKnow_01_08 " );	// So now you're in my debt... (laughs)
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_DontKnow_01_09 " );	// I don't owe you anything!
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontKnow_01_11 " );	// And I'll tell you honestly, as if in spirit, - I don't really feel sorry for debtors, and most importantly, I always get what is due to me.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontKnow_01_12 " );	// And you know what I decided...
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontKnow_01_14 " );	// ...I've decided that I'll collect your debt from you right now!
	Npc_SetTempAttitude(self, ATT_HOSTILE );
	B_LogEntry( TOPIC_GERBRANDTHELP , " Now I'm sure I won't see Gerbrandt's letter of recommendation, because I screwed up the whole thing. Also, during the meeting, I had, so to speak, some difficulties. " );
	MEETCHIEFKILLERSMISSTIME = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetkillers_giveger()
{
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_00 " );	// Here, take this wallet...
	B_GiveInvItems(other,self,itse_gerbrandpocket,1);
	Npc_RemoveInvItems(self,itse_gerbrandpocket,1);
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_01 " );	// ...and another letter. Everything you need is here.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_02 " );	// Hmmm... well, let's see.
	if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
	{
		B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
		Npc_RemoveInvItems(self,itwr_gerbrandseclet,1);
		B_UseFakeScroll();

		if(STIDKILLME == TRUE)
		{
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_03 " );	// Okay, I'm clear. I don't think this will be much of a problem.
			AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_04 " );	// That's great! I think now our conversation can be considered completed.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_05 " );	// Not so fast, my friend! (smiling mischievously) Not so fast.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_09 " );	// I need the name of the person who sent you to me.
			AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_10 " );	// (raising his voice) I already told you that this is none of your business!
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_11 " );	// Don't be rude! Otherwise, I'll have to teach you good manners.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_12 " );	// If you don't tell me his name, I'm afraid I won't be able to just let you go.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_13 " );	// You see, I have to be clear about who I'm doing business with.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_14 " );	// Otherwise, I risk a lot.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_15 " );	// So you'll have to tell me his name.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_16 " );	// Otherwise...
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_18 " );	// ...I'll just have to kill you.
			AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_20 " );	// Hey, wait...
			AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_22 " );	// If I tell you the name of that person - what then?
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_23 " );	// Hmmm... then you can safely get out of here wherever you want - I won't hurt you.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_24 " );	// So what did you choose?
			Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
			Info_AddChoice(dia_addon_inextremo_announcer_meetkillers, " Threats will get you nowhere! " ,dia_addon_inextremo_announcer_meetkillers_donttell);
			Info_AddChoice(dia_addon_inextremo_announcer_meetkillers, " Okay! I'll tell you what I know. " ,dia_addon_inextremo_announcer_meetkillers_tell);
		}
		else
		{
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_25 " );	// Good! Everything is clear to me. I don't think this will be much of a problem.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_26 " );	// You can be calm - your problem will be solved quickly.
			AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_27 " );	// That's great! I think now our conversation can be considered completed.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_3A " );	// See you again!
			B_LogEntry( TOPIC_GERBRANDTHELP , " I did everything exactly as Gerbrandt told me. Now all I have to do is return to him and collect my reward. " );
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,400);
			Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
			Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_23");
		};
	}
	else
	{
		B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
		Npc_RemoveInvItems(self,itwr_gerbrandseclet_open,1);
		B_UseFakeScroll();
		if(STIDKILLME == TRUE)
		{
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_31 " );	// Good! Everything is clear to me. I don't think this will be much of a problem.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_32 " );	// However, as I noticed, the seal on the letter was broken even before I read it.
			AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_33 " );	// I just wanted to...
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_34 " );	// (interrupting) I know what you wanted.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_35 " );	// All this tells me only one thing - that you are not a very reliable person in cases of this kind.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_39 " );	// Let me explain a couple of things to you.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_40 " );	// You see, there's nothing worse in our business than people you can't rely on.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_43 " );	// So I'm afraid I can't just let you go.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_44");	//То есть?
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_45 " );	// Idiots like you need to be disposed of as quickly as possible.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_47 " );	// Understand, nothing personal - but you left me no choice...
			Npc_SetTempAttitude(self, ATT_HOSTILE );
			B_LogEntry( TOPIC_GERBRANDTHELP , " I did everything Gerbrandt asked. However, during the meeting there were, so to speak, some difficulties. " );
			MEETCHIEFKILLERSNOTOK = TRUE;
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_GuardStopsIntruder,0);
		}
		else
		{
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_48 " );	// Good! Everything is clear to me. I don't think this will be much of a problem.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_49 " );	// However, as I noticed, the seal on the letter was broken even before I read it.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_50 " );	// Does this mean that you decided to read your own letter again, which looks very strange...
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_51 " );	// ...or someone else wrote it?!
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_52");	//Я...
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_53 " );	// Hmmm... you don't have to explain anything. I understand everything.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_54 " );	// All this tells me only one thing - that you are not a very reliable person in cases of this kind.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_55 " );	// But the worst thing is that you lied to me. This is a very sad fact!
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_56 " );	// I think, for sure, someone just sent you to give me this letter and a wallet, and you ... (smiling maliciously)
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_59 " );	// Let me explain a couple of things to you.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_60 " );	// You see, there's nothing worse in our business than people you can't rely on.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_63 " );	// So I'm afraid I can't just let you go.
			AI_Output(other,self, " DIA_pir_1398_MeetKillers_GiveGer_01_64 " );	// That is? What does it mean?!
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_65 " );	// Idiots like you need to be disposed of as quickly as possible.
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_66 " );	// And the sooner this is done, the better for everyone. And for business as well!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_pir_1398_MeetKillers_GiveGer_01_67 " );	// Understand, nothing personal - but you left me no choice...
			Npc_SetTempAttitude(self, ATT_HOSTILE );
			B_LogEntry( TOPIC_GERBRANDTHELP , " I did everything Gerbrandt asked. However, during the meeting there were, so to speak, some difficulties. " );
			MEETCHIEFKILLERSNOTOK = TRUE;
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_GuardStopsIntruder,0);
		};
	};
};

func void dia_addon_inextremo_announcer_meetkillers_donttell()
{
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_DontTell_01_00 " );	// Threats won't get you anything from me!
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontTell_01_01 " );	// Hmmm... so you prefer to die. How stupid of you to do that! (laughs)
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_DontTell_01_02 " );	// Or maybe you decided to bargain with me?
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers, " Stupid or not, that will decide the fight! " ,dia_addon_inextremo_announcer_meetkillers_fight);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers, " Bargain? Why not. " ,dia_addon_inextremo_announcer_meetkillers_torg);
};

func void dia_addon_inextremo_announcer_meetkillers_tell()
{
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Tell_01_00 " );	// Good! I will say what I know myself.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_01");	//Я слушаю...
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Tell_01_02 " );	// His name is Gerbrandt.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_03 " );	// Where does he live?
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Tell_01_04 " );	// In the upper quarter of the city, the first house on the right. I don't know anything more.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_05 " );	// Well, that's enough.
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Tell_01_06 " );	// Hey! But you promised!
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_07 " );	// You shouldn't believe everything they say.
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Tell_01_09 " );	// But we agreed!
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_10 " );	// Ha! (laughs) Let me explain a couple of things to you.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_11 " );	// You see, there's nothing worse in our business than people you can't rely on.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_13 " );	// And apparently, you belong to this category of people. So he just gave me his employer - what else to talk about?
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_14 " );	// It's not a fact that you won't spill the beans about our meeting. And I can't risk it! Understand?
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_15 " );	// And so you left me no choice...
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Tell_01_16 " );	// You're going to have to die today.
	Npc_SetTempAttitude(self, ATT_HOSTILE );
	B_LogEntry( TOPIC_GERBRANDTHELP , " I did everything Gerbrandt asked. However, during the meeting there were, so to speak, some difficulties. Besides, I blabbed about Gerbrandt's involvement in this case. I don't think he will like it. " );
	MEETCHIEFKILLERSNOTOK = TRUE;
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSTELLSGER = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetkillers_fight()
{
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Fight_01_00 " );	// Let's see! Everything will be decided by the fight!
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Fight_01_01 " );	// Ha! Bold words, brave man. You probably don't even know who you're challenging.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Fight_01_03 " );	// Of course, I could easily send you to the next world now, but, you know... (thoughtfully)
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Fight_01_04 " );	// ...I won't do that.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Fight_01_05 " );	// I respect people like you. Besides, as I understand it, you know how to keep your mouth shut, and this is also worth something.
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Fight_01_06 " );	// What do you mean by that?
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Fight_01_07 " );	// That our conversation is over. Go and tell your employer that I will take care of his problems.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_LogEntry( TOPIC_GERBRANDTHELP , " I did everything Gerbrandt asked. However, during the meeting there were, so to speak, some difficulties. I was also smart enough not to blurt out Gerbrandt's involvement in this matter. Now it remains to return to him and collect my reward. " );
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSDANGER = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,400);
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_23");
};

func void dia_addon_inextremo_announcer_meetkillers_torg()
{
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Torg_01_00 " );	// Bargain? Why not.
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Torg_01_01 " );	// Each information is always worth something.
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Torg_01_06 " );	// Especially so valuable!
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_07 " );	// And you, as I see it, are a businessman! Okay, I'll give you three hundred coins. Now speak!
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Torg_01_08 " );	// His name is Gerbrandt, he is a merchant.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_09 " );	// Where does he live?
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Torg_01_10 " );	// In the upper quarter of the city, the first house on the right. I don't know anything more.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_11 " );	// Hmmm... well, that's enough.
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self, " DIA_pir_1398_MeetKillers_Torg_01_12 " );	// Hey! But you promised! And where is my money?
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_13 " );	// You shouldn't believe everything they say.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_14 " );	// Do you really think I'm stupid enough to pay you for this.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_16 " );	// Let me explain a couple of things to you.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_17 " );	// You see, there's nothing worse in our business than people you can't rely on.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_19 " );	// Especially those who are ready to sell everything for the sake of the glitter of gold in their pockets.
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_20 " );	// And apparently, you belong to this category of people. Just like that, he simply took and handed over his employer to me - what else to talk about?
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_21 " );	// It's not a fact that you won't spill the beans about our meeting. And I can't risk it! Understand?
	AI_Output(self,other, " DIA_pir_1398_MeetKillers_Torg_01_22 " );	// And so you left me no choice.
	Npc_SetTempAttitude(self, ATT_HOSTILE );
	B_LogEntry( TOPIC_GERBRANDTHELP , " I did everything Gerbrandt asked. However, during the meeting there were, so to speak, some difficulties. Besides, I blabbed about Gerbrandt's involvement in this case. I don't think he will like it. " );
	MEETCHIEFKILLERSNOTOK = TRUE;
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSTELLSGER = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_TELLABOUTWAMBO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_tellaboutwambo_condition;
	information = dia_addon_inextremo_announcer_tellaboutwambo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_inextremo_announcer_tellaboutwambo_condition()
{
	if((KILLCANJOIN == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_KILLWAMBO_01") <= 1500))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_tellaboutwambo_info()
{
	B_GivePlayerXP(100);
	MEETSTIDGERBRANT = TRUE ;
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	Npc_ExchangeRoutine(self,"Start");
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_0A " );	// It's you again! Hmmm... here we are again.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_0B " );	// Although I don't think you picked the right time for this.
	if ( MEASID  ==  TRUE )
	{
		AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_0C " );	// Well, to be honest, I didn't expect to see you here myself.
		AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_0D " );	// However, it happened!
	}
	else
	{
		AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_0E " );	// Do we know each other?! Wait though! You're the man from the tavern, right?
		AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_0F " );	// I see that you remember me well! However, as I you.
	};
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_00 " );	// Looks like you're in trouble with the militia.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_01 " );	// Me? (laughs) What do you mean?
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_02 " );	// Maybe I imagined it, but it looks like you just killed a man.
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_03 " );	// I think you'll be in big trouble because of this.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_0H " );	// You're wrong, my friend! I will not have them, because it is unlikely that anyone will know about it.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_05 " );	// After all, this requires witnesses ... (laughs)
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_06 " );	// What about me? I saw how you...
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_07 " );	// (interrupting) So much the worse for you!
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_09 " );	// You didn't pick the best time to cross my path.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_10 " );	// I don't blame you though - it's more likely that you ended up here just by an absurd accident.
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_12 " );	// Are you threatening me?!
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_13 " );	// No, what are you! Threats are just a waste of time and effort.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_14 " );	// Actions are much more useful.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_15 " );	// Don't get me wrong - I have nothing against you, but I can't take that risk.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_18 " );	// Just by being here, you left me no choice... (laughs)
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_35 " );	// Especially since you yourself are a member of the militia.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_36 " );	// Especially since you're a paladin yourself.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_37 " );	// Especially since you're a Firebender and you'll probably snitch on your paladin friends.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_NOV)
	{
		AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_38 " );	// Especially since you're a minion of the Firebenders and you'll probably want to curry favor.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	};
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_19 " );	// Wait! Let's just talk calmly.
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_20 " );	// Maybe we can still peacefully settle this problem?
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_25 " );	// (thinking) Maybe...
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_30 " );	// Maybe you will be useful to me, if, of course ... (carefully peering)
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_01_31 " );	// Where are you going?
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_32 " );	// Maybe I could use the help of someone like you.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_33 " );	// As far as I understand, you seem to be a guy of nothing - not one of the talkative ones, and you don’t have the audacity to do so.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_01_34 " );	// So... I think I have a suggestion for you.
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutwambo);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo, " What is it? " ,dia_addon_inextremo_announcer_tellaboutwambo_tellme);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo, " I don't think I'm interested. " ,dia_addon_inextremo_announcer_tellaboutwambo_refuse);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_refuse()
{
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_Refuse_01_00 " );	// I don't think it will interest me.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_Refuse_01_01 " );	// You refused without even listening to what I wanted to offer you.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_Refuse_01_04 " );	// Well, in that case it's time to die, my friend.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_tellme()
{
	CANCOMPLETEGUILDKILL = TRUE;
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_TellMe_01_00 " );	// And what is it?
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_01 " );	// First, let me explain something to you...
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_02 " );	// I think you already probably guess that I'm not quite an ordinary person, as it seems at first glance.
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_TellMe_01_03 " );	// You got it right! It's hard to call you a simple guy.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_05 " );	// My real craft is also not an ordinary occupation.
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_TellMe_01_06 " );	// And what do you do?
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_08 " );	// My real job is helping people solve their problems in ways that are not entirely legal.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_11 " );	// My real name is Asmal. Maybe it tells you something?
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_TellMe_01_13 " );	// Never heard of you before.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_14 " );	// Hmmm...(smiles) Maybe it's for the best for you.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_16 " );	// Don't misunderstand: it doesn't give me pleasure to kill people, but everyone earns his bread the way he can.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_17 " );	// After all, the one I just killed was just a corrupt militia who caused a lot of trouble for the local merchants.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_18 " );	// I think this world won rather than lost by his death.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_19 " );	// By the way, it was you who signed this poor fellow's death warrant by handing me that note with the money in the tavern... (laughs)
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_20 " );	// True, it doesn't matter now. Therefore, it is better to return directly to your person.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_21 " );	// I'll be honest: of course, it would be easier for me to just kill you...
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_22 " );	// ...and thereby solve the problem. But... I want to give you a chance.
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_TellMe_01_23 " );	// What do you mean?
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_24 " );	// I invite you to become one of us.
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_TellMe_01_25 " );	// One of you? Are you asking me to become a killer?!
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_26 " );	// Yes. And join our secret society, or, more simply, our guild of assassins.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_27 " );	// Whether you accept my offer or not is up to you.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_TellMe_01_29 " );	// So what do you say?
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutwambo);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo, " I don't deal with killers! " ,dia_addon_inextremo_announcer_tellaboutwambo_becomeno);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"Хорошо, я с вами!",dia_addon_inextremo_announcer_tellaboutwambo_becomeyes);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_becomeno()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_BecomeNo_01_00 " );	// I don't deal with assassins!
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeNo_01_03 " );	// In that case, I think we should end our conversation here, my friend.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeNo_01_04 " );	// Now it's time to die!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_becomeyes()
{
	self.name[0] = "Асмал";
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_00 " );	// Okay, I'm with you!
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_01 " );	// I knew you would agree to my proposal.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_02 " );	// You made the right choice, otherwise you would just be dead right now.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_03");	//И что теперь?
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_04 " );	// Now you're one of us!
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_07 " );	// I'll tell you - you can't count on much for now.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_08 " );	// You still have to prove that you can not only talk your tongue, but also do something more serious.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_10 " );	// I hope you understand what I'm talking about.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_15");	//Я понимаю.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_16 " );	// And one more thing... Khorinis has become a little restless lately.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_18 " );	// Therefore, it is better to sit in some quiet place for now.
	AI_Output(self,other, " DIA_pir_1398_TellAboutWambo_BecomeYes_01_20 " );	// If you want to meet me again, come to the abandoned house on the pier.

	if(JOINKILLERS == FALSE)
	{
		MIS_KILLWAY = LOG_Running;
		Log_CreateTopic(TOPIC_KILLWAY,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KILLWAY,LOG_Running);
		B_LogEntry( TOPIC_KILLWAY , " Asmal accepted me into the killer's guild. True, so far only in words - until I prove to him that I really deserve it. " );
		JOINKILLERS = TRUE;
	};

	CHANGELOCATIONASMAL = TRUE;
	CHECKFLAGKILLSJOIN = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Logovo");
	B_StartOtherRoutine(vlk_6028_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6029_buergerin,"TOT");
	B_StartOtherRoutine(vlk_6030_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6031_buergerin,"TOT");
	//B_StartOtherRoutine(vlk_6032_buergerin,"TOT");
	B_StartOtherRoutine(vlk_6033_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6034_buergerin,"TOT");
	B_StartOtherRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"Logovo");
	B_StartOtherRoutine(PIR_1395_Addon_InExtremo_Lutter,"Logovo");
	B_StartOtherRoutine(PIR_1396_Addon_InExtremo_Flex,"Logovo");
	B_StartOtherRoutine(PIR_1391_Addon_InExtremo_TheFlail,"Logovo");
	B_StartOtherRoutine(pir_1397_addon_inextremo_charlotte,"Logovo");
	B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Logovo");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLARMOR(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killarmor_condition;
	information = dia_addon_inextremo_announcer_killarmor_info;
	permanent = FALSE;
	description = " What is that armor you're wearing? " ;
};

func int dia_addon_inextremo_announcer_killarmor_condition()
{
	if(JOINKILLERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killarmor_info()
{
	AI_Output(other,self, " DIA_pir_1398_KillArmor_01_00 " );	// What kind of armor are you wearing?
	AI_Output(self,other, " DIA_pir_1398_KillArmor_01_01 " );	// What do you think? I can lend a hand on cutting off that you have not seen anything like this before.
	AI_Output(self,other, " DIA_pir_1398_KillArmor_01_03 " );	// Only those people who have rightfully earned their place in our circle wear such armor. And what, they liked you so much?
	AI_Output(other,self, " DIA_pir_1398_KillArmor_01_04 " );	// Very interesting! How can I get the same?
	AI_Output(other,self, " DIA_pir_1398_KillArmor_01_05 " );	// Now I'm in the Assassin's Guild too, and...
	AI_Output(self,other, " DIA_pir_1398_KillArmor_01_06 " );	// (interrupting) Ha! This armor still needs to be earned first! Or do you think that you have already done a lot for our guild?
	AI_Output(self,other, " DIA_pir_1398_KillArmor_01_07 " );	// First, prove yourself, complete a couple of my tasks, and maybe, in the end, you will be honored to wear the armor of a real assassin!
	B_LogEntry( TOPIC_KILLWAY , " Asmal said that I am not yet worthy to wear the armor of an assassin, and I need to earn this honor by showing myself in action. " );
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_CANTEACH(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_canteach_condition;
	information = dia_addon_inextremo_announcer_canteach_info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};

func int dia_addon_inextremo_announcer_canteach_condition()
{
	if((JOINKILLERS == TRUE) && (ANNOUNCERCANTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_canteach_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_Addon_InExtremo_Announcer_CanTeach_01_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_InExtremo_Announcer_CanTeach_01_01 " );	// I'm afraid I can't teach you much. You understand, it's not my business to teach someone.
	AI_Output(self,other, " DIA_Addon_InExtremo_Announcer_CanTeach_01_02 " );	// But, if it comes to that, I could teach you a couple of tricks.
	AI_Output(self,other, " DIA_Addon_InExtremo_Announcer_CanTeach_01_03 " );	// After all, the success of the work done depends on it - and this is an important point in our craft!
	AI_Output(self,other, " DIA_Addon_InExtremo_Announcer_CanTeach_01_04 " );	// So if you want to learn how to use your sword or sword better, just say so and we'll get started.
	ANNOUNCERCANTEACH = TRUE;
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_TEACH(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_teach_condition;
	information = dia_addon_inextremo_announcer_teach_info;
	permanent = TRUE;
	description = " Let's start training. " ;
};

func int dia_addon_inextremo_announcer_teach_condition()
{
	if((JOINKILLERS == TRUE) && (ANNOUNCERCANTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_teach_info()
{
	self.name[0] = "Асмал";
	Info_ClearChoices(dia_addon_inextremo_announcer_teach);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
};

func void dia_addon_inextremo_announcer_teach_back()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_teach);
};

func void dia_addon_inextremo_announcer_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		Info_ClearChoices(dia_addon_inextremo_announcer_teach);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
	};
};

func void dia_addon_inextremo_announcer_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		Info_ClearChoices(dia_addon_inextremo_announcer_teach);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK0(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork0_condition;
	information = dia_addon_inextremo_announcer_killwork0_info;
	permanent = FALSE;
	description = " How about some work to do? " ;
};


func int dia_addon_inextremo_announcer_killwork0_condition()
{
	if (( JOINKILLERS  ==  TRUE ) && ( WAMBOISDEAD  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork0_info()
{
	self.name[0] = "Асмал";
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(other,self, " DIA_pir_1398_KillWork0_01_00 " );	// How about some work to do?
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_01 " );	// Ha! So are you in a hurry to show yourself in practice? Hmmm...
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_02 " );	// I think there is one thing - just for you! Let's go and see what you're capable of.
	AI_Output(other,self, " DIA_pir_1398_KillWork0_01_03 " );	// And what should be done?
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_04 " );	// One man from the city militia is very annoying to some big merchants from the upper quarter of Khorinis.
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_05 " );	// Apparently, the guy creates quite a lot of problems if they decide to turn to us for help.
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_06 " );	// Judging from what they said, that guard has a huge appetite for money in regards to these merchants...(laughs)
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_08 " );	// I want you to deal with this guard. And the sooner you do it, the better!
	AI_Output(other,self, " DIA_pir_1398_KillWork0_01_09 " );	// Simply put, do I need to kill him?
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_10 " );	// How clever you are!
	AI_Output(other,self, " DIA_pir_1398_KillWork0_01_11 " );	// Who is this guy?
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_12 " );	// His name is Wambo. You may have already met him. So don't waste your time!
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_13 " );	// Come back when you've dealt with this matter. Perhaps I will have more assignments for you.
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_14 " );	// Yes, and more. I hope I don't have to remind you that this is best done without witnesses.
	AI_Output(self,other, " DIA_pir_1398_KillWork0_01_15 " );	// You know, we don't want any more trouble with the militia.
	MIS_KILLWAMBO = LOG_Running;
	Log_CreateTopic(TOPIC_KILLWAMBO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLWAMBO,LOG_Running);
	B_LogEntry( TOPIC_KILLWAMBO , " Asmal has assigned me to deal with a militiaman named Wambo who is seriously harassing merchants from the upper quarter. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Mil_316_Wambo,"WaitFight2");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK0DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork0done_condition;
	information = dia_addon_inextremo_announcer_killwork0done_info;
	permanent = FALSE;
	description = " I settled the deal with Wambo. " ;
};


func int dia_addon_inextremo_announcer_killwork0done_condition()
{
	if (( WAMBOISDEAD  == LOG_Running ) && ( WAMBOISDEAD  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork0done_info()
{
	self.name[0] = "Асмал";
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_pir_1398_KillWork0Done_01_00 " );	// I settled the deal with Wambo.
	AI_Output(self,other, " DIA_pir_1398_KillWork0Done_01_03 " );	// Hmmm. OK then. I think our customers will be happy.
	AI_Output(self,other, " DIA_pir_1398_KillWork0Done_01_04 " );	// You seem to be really useful.
	AI_Output(self,other, " DIA_pir_1398_KillWork0Done_01_05 " );	// Here, take this wallet. Here's your share of the work done.
	B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
	MIS_KILLWAMBO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLWAMBO,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLWAMBO , " Asmal was pleased with my work. " );
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK1(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork1_condition;
	information = dia_addon_inextremo_announcer_killwork1_info;
	permanent = FALSE;
	description = " Do you have a job for me? " ;
};


func int dia_addon_inextremo_announcer_killwork1_condition()
{
	if (( JOINKILLERS  ==  TRUE ) && ( KILLTARGET1  ==  FALSE ) && ( WAMBOISDEAD  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork1_info()
{
	var C_Npc slf;
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork1_01_00 " );	// Got a job for me?
	AI_Output(self,other, " DIA_pir_1398_KillWork1_01_01 " );	// Hmmm... yes, there is one more thing. I think you can easily handle it.
	AI_Output(other,self, " DIA_pir_1398_KillWork1_01_02 " );	// What should be done?
	AI_Output(self,other, " DIA_pir_1398_KillWork1_01_03 " );	// I want you to take care of a man named Louis. You will find it here in the city.
	AI_Output(other,self, " DIA_pir_1398_KillWork1_01_04 " );	// Should I kill him?
	AI_Output(self,other, " DIA_pir_1398_KillWork1_01_05 " );	// Yeah, this guy talks way too much about things that are best kept quiet.
	AI_Output(self,other, " DIA_pir_1398_KillWork1_01_06 " );	// And, of course, some people don't like it very much.
	AI_Output(self,other, " DIA_pir_1398_KillWork1_01_07 " );	// Try to do everything quietly, without too much noise. You know, our reputation depends on it!
	AI_Output(self,other, " DIA_pir_1398_KillWork1_01_08 " );	// And when you settle this matter, come back to me. I have one more task for you.
	AI_StopProcessInfos(self);
	MIS_KILLTARGET1 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET1,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET1,LOG_Running);
	B_LogEntry( TOPIC_KILLTARGET1 , " Asmal asked me to settle a case with a guy named Luis. This guy obviously talks a lot if someone wants him dead. I'll have to do my best to make sure he doesn't cause anyone any more trouble. " );
	Wld_InsertNpc(vlk_6109_luis,"NW_CITY_LUIS");
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if (Npc_IsDead(Lehmar) ==  TRUE )
	{
		KILLTARGET2 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK1DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork1done_condition;
	information = dia_addon_inextremo_announcer_killwork1done_info;
	permanent = FALSE;
	description = " We can forget about the problem with Luis. " ;
};


func int dia_addon_inextremo_announcer_killwork1done_condition()
{
	if((MIS_KILLTARGET1 == LOG_Running) && (KILLTARGET1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork1done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork1Done_01_00 " );	// You can forget about the problem with Louis.
	AI_Output(self,other, " DIA_pir_1398_KillWork1Done_01_01 " );	// Did you make sure he doesn't open his mouth again?
	AI_Output(other,self, " DIA_pir_1398_KillWork1Done_01_02 " );	// The guy is dumb as a fish now.
	AI_Output(self,other, " DIA_pir_1398_KillWork1Done_01_03 " );	// Well, not bad! You're making progress. And this, as you know, is always encouraged.
	AI_Output(self,other, " DIA_pir_1398_KillWork1Done_01_05 " );	// So... here you go - here is your share for your troubles.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_KILLTARGET1 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET1,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLTARGET1 , " I fixed things with Luis. " );
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if (Npc_IsDead(Lehmar) ==  TRUE )
	{
		KILLTARGET2 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK2(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork2_condition;
	information = dia_addon_inextremo_announcer_killwork2_info;
	permanent = FALSE;
	description = " You were talking about another errand. " ;
};


func int dia_addon_inextremo_announcer_killwork2_condition()
{
	if (( JOINKILLERS  ==  TRUE ) && ( KILLTARGET2  ==  FALSE ) && ( KILLTARGET1  ==  TRUE ) && ( WAMBOISDEAD  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork2_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_00 " );	// You were talking about another assignment.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_01 " );	// Yes, and it's quite urgent. We need to resolve this issue as soon as possible before we have problems.
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_02 " );	// What's the point?
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_03 " );	// Do you know a man named Lemar? He is a moneylender in the port district of Khorinis.
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_04 " );	// Yes, I know him. What do you have to do with him?
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_05 " );	// This doesn't concern you! The only thing you should know is that in his time Lemar rendered us one very invaluable service.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_06 " );	// His help made life in the city much easier for us, although the fee for his services was quite high.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_07 " );	// I think he guessed from the very beginning who we are and what we do.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_08 " );	// True, he was most interested in gold, so he did not ask too many questions. At least until recently.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_09 " );	// (angrily) But now that bastard has gone too far!
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_10 " );	// What did he do?
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_11 " );	// Things haven't been going well for him lately.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_12 " );	// Too many debtors, but few of them pay their bills. So he decided that it would be nice to make money in some other way.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_14 " );	// He gave us a condition: that if we don't want anyone to know more about us, we'll have to fork out... (laughs)
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_15 " );	// And if we refuse, he threatens to turn us over to Lord Andre and his militia!
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_17 " );	// So send one of your guys to Lemar to deal with him.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_20 " );	// It's not that simple. The mere appearance of my guys near Lemar's house will cause him anxiety, and he will immediately run to Lord Andre.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_21 " );	// He's not stupid, and he knows we'll probably try to get even with him. In addition, Lemar knows almost all of my guys by sight.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_23 " );	// On top of that, he recently hired a bodyguard, can you imagine? Luther knows this guy - he is a great fighter and it will be extremely difficult to deal with him without too much noise.
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_24 " );	// M-yes. It seems that Lemar has foreseen everything.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_25 " );	// All but one... (laughs)
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_26 " );	// What do you mean?
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_27 " );	// You, of course! This fool doesn't even know you're one of us...(laughs) I can imagine what his face will look like when he finds out about this!
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_30 " );	// Don't waste time. Go to Lemar and make sure that bastard can never threaten us again.
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_31 " );	// What about a bodyguard?
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_32 " );	// You'll have to take care of him if you need to. Of course, it will not be easy at all, but we have no other choice.
	AI_Output(other,self, " DIA_pir_1398_KillWork2_01_33 " );	// Hmmm... but his house is always full of people! If I kill anyone, the militia will immediately grab me!
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_35 " );	// Try to catch the moneylender in a place where there would be fewer onlookers.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_37 " );	// Recently I heard that Lemar often visits the harbor in the evening. Apparently, he goes out for a walk and breathes in the fresh sea air.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_38 " );	// Usually there is hardly anyone there at this time.
	AI_Output(self,other, " DIA_pir_1398_KillWork2_01_45 " );	// When you pierce this fat pig with a sword, say hello to him from me and my guys ... (laughs)
	MIS_KILLTARGET2 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET2,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET2,LOG_Running);
	B_LogEntry( TOPIC_KILLTARGET2 , " The assassin's guild is having trouble with loan shark Lemar. He knows who they are and decided to take advantage of this by blackmailing Asmal and his people. I need to deal with this problem, although it will not be easy. Lemar hired a bodyguard and catch him besides, Asmal mentioned that Lemar loves to walk in the harbor in the evening and hinted that this is the best chance to do my dirty work without too much noise. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(VLK_484_Lehmar,"CanKill");
	Wld_InsertNpc(vlk_6120_lemarguard,"NW_CITY_LEMAR_KILL_GUARD");

	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK2DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork2done_condition;
	information = dia_addon_inextremo_announcer_killwork2done_info;
	permanent = FALSE;
	description = " I said hi to Lemar for you. " ;
};


func int dia_addon_inextremo_announcer_killwork2done_condition()
{
	if((MIS_KILLTARGET2 == LOG_Running) && (KILLTARGET2 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork2done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork2Done_01_00 " );	// I sent Lemar your regards.
	AI_Output(self,other, " DIA_pir_1398_KillWork2Done_01_01 " );	// Yes? (laughs) And what did he say?
	AI_Output(other,self, " DIA_pir_1398_KillWork2Done_01_02 " );	// Nothing, because he was already dead.
	AI_Output(self,other, " DIA_pir_1398_KillWork2Done_01_03 " );	// Great! This pig deserved it! I think many will rejoice at his death.
	AI_Output(self,other, " DIA_pir_1398_KillWork2Done_01_05 " );	// Too many people owed him.
	AI_Output(self,other, " DIA_pir_1398_KillWork2Done_01_06 " );	// As for you, you did a great job!
	AI_Output(self,other, " DIA_pir_1398_KillWork2Done_01_07 " );	// Here, take this gold for your labors and accept my gratitude.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_KILLTARGET2 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET2,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLTARGET2 , " Asmal was glad to know that I killed Lemar. " );
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLREWARD(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killreward_condition;
	information = dia_addon_inextremo_announcer_killreward_info;
	permanent = FALSE;
	description = " I hope now I am worthy to wear the assassin's armor? " ;
};

func int dia_addon_inextremo_announcer_killreward_condition()
{
	if((MIS_KILLTARGET2 == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killarmor))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killreward_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillReward_01_00 " );	// I hope now I'm worthy to wear the assassin's armor?
	AI_Output(self,other, " DIA_pir_1398_KillReward_01_01 " );	// (surprised) Are you still interested?
	AI_Output(self,other, " DIA_pir_1398_KillReward_01_03 " );	// Hmmm...( peering carefully) Well, if you really want to know my opinion, then I think so. You are deserve!
	AI_Output(self,other, " DIA_pir_1398_KillReward_01_04 " );	// You proved to everyone that you rightfully deserved to wear this armor, and even more.
	AI_Output(self,other, " DIA_pir_1398_KillReward_01_05 " );	// I was sure you'd go far!
	AI_Output(self,other, " DIA_pir_1398_KillReward_01_06 " );	// True, I did not expect this to happen so quickly.
	AI_Output(self,other, " DIA_pir_1398_KillReward_01_08 " );	// So here, take this assassin's armor from me.
	AI_Output(self,other, " DIA_pir_1398_KillReward_01_09 " );	// And I hope you understand that only a few have received this honor.
	AI_Output(self,other, " DIA_pir_1398_KillReward_01_10 " );	// The sight of this armor will tell anyone who you are and what you are capable of.
	B_GiveInvItems(self,other,itar_kil_sl,1);
	B_LogEntry( TOPIC_KILLWAY , " Asmal thinks I'm now worthy of being an assassin and a full member of their guild. " );
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK3(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork3_condition;
	information = dia_addon_inextremo_announcer_killwork3_info;
	permanent = FALSE;
	description = " Anything else? " ;
};


func int dia_addon_inextremo_announcer_killwork3_condition()
{
	if (( JOINKILLERS  ==  TRUE ) && ( KILLTARGET3  ==  FALSE ) && ( KILLTARGET1  ==  TRUE ) && ( KILLTARGET2  ==  TRUE ) && ( WAMBOISDEAD  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork3_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork3_01_00 " );	// Anything else?
	AI_Output(self,other, " DIA_pir_1398_KillWork3_01_01 " );	// There's one more job for you that's pretty specific.
	AI_Output(other,self, " DIA_pir_1398_KillWork3_01_02 " );	// Who is this time?
	AI_Output(self,other, " DIA_pir_1398_KillWork3_01_03 " );	// Kantar, merchant in the market square.
	AI_Output(other,self, " DIA_pir_1398_KillWork3_01_04 " );	// Cantar? And to whom did he step on a sore spot, and even so hard?
	AI_Output(self,other, " DIA_pir_1398_KillWork3_01_07 " );	// Kantar is too prosperous a merchant, and because of this, he will soon have big problems.
	AI_Output(self,other, " DIA_pir_1398_KillWork3_01_09 " );	// People don't like the extra lucky. In addition, as it turned out, Kantar himself does not play quite honestly.
	AI_Output(self,other, " DIA_pir_1398_KillWork3_01_11 " );	// He has some connections in the upper circles of the city's nobility, and he uses this to get other merchants out of his way in the market square.
	AI_Output(self,other, " DIA_pir_1398_KillWork3_01_15 " );	// Try not to deceive the hopes of these people - they are counting on our help.
	AI_Output(self,other, " DIA_pir_1398_KillWork3_01_16 " );	// Now go! You know what to do.
	AI_StopProcessInfos(self);
	MIS_KILLTARGET3 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET3,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET3,LOG_Running);
	B_LogEntry( TOPIC_KILLTARGET3 , " Asmal gave me another errand. This time I need to take care of Trader Kantar. I think it won't be too hard. " );

	if(Npc_GetDistToWP(VLK_468_Canthar,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	{
		Npc_ExchangeRoutine(VLK_468_Canthar,"CanKill");
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK3DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork3done_condition;
	information = dia_addon_inextremo_announcer_killwork3done_info;
	permanent = FALSE;
	description = " Kantar is no longer a hindrance to other merchants. " ;
};


func int dia_addon_inextremo_announcer_killwork3done_condition()
{
	if((MIS_KILLTARGET3 == LOG_Running) && (KILLTARGET3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork3done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork3Done_01_00 " );	// Kantar is no longer a hindrance to other merchants.
	AI_Output(self,other, " DIA_pir_1398_KillWork3Done_01_03 " );	// Good! Our customers will be happy.
	AI_Output(self,other, " DIA_pir_1398_KillWork3Done_01_04 " );	// Here, take your share of this work.
	B_GiveInvItems(self,other,ItMi_Gold,750);
	MIS_KILLTARGET3 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET3,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLTARGET3 , " I reported to Asmal about the completed order. " );
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK4(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork4_condition;
	information = dia_addon_inextremo_announcer_killwork4_info;
	permanent = FALSE;
	description = " How about the next order? " ;
};


func int dia_addon_inextremo_announcer_killwork4_condition()
{
	if (( JOINKILLERS  ==  TRUE ) && ( MISSION4COMPLETE  ==  FALSE ) && ( KILLTARGET1  ==  TRUE ) && ( KILLTARGET2  ==  TRUE ) && ( KILLTARGET3  ==  TRUE ) && ( WAMBOISDEAD  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork4_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork4_01_00 " );	// How about the next order?
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_03 " );	// (smiles) Well, whatever you say. I have another one here just for you.
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_05 " );	// A man named Nigel owed a large merchant a huge pile of money.
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_06 " );	// As far as I know, his debt to the merchant is about two thousand gold.
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_08 " );	// A lot of money. So this guy decided that it would be better to forget about the debt than to give it away.
	AI_Output(other,self, " DIA_pir_1398_KillWork4_01_09 " );	// What is required of me?
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_10 " );	// Find this bastard and try to beat this debt out of him. And if he refuses to pay - just kill him!
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_11 " );	// Of course, as you yourself understand, the first option is more preferable for everyone...
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_12 " );	// ...but if it doesn't work out, we need to teach this poor guy a lesson.
	AI_Output(other,self, " DIA_pir_1398_KillWork4_01_13 " );	// Where can I find it?
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_14 " );	// They say that he was recently seen in Orlan's tavern. He apparently naively believes that no one will get him there.
	AI_Output(self,other, " DIA_pir_1398_KillWork4_01_16 " );	// Now go, and don't let me down!
	MIS_KILLTARGET4 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET4,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_Running);
	B_LogEntry( TOPIC_KILLTARGET4 , " I need to find a man named Nigel and remind him of his debt. If he refuses to pay, I'll just have to kill him. Asmal said that this guy was recently seen in Orlan's tavern. " );
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK4DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork4done_condition;
	information = dia_addon_inextremo_announcer_killwork4done_info;
	permanent = FALSE;
	description = " I settled with Nigel. " ;
};


func int dia_addon_inextremo_announcer_killwork4done_condition()
{
	if (( MY_KILL TARGET4  == LOG_Running ) && (( KILL TARGET4  ==  TRUE ) || (( CATCH TARGET4  ==  TRUE ) && ( NIGELBANDITISDEAD  ==  TRUE ) && ( KILL TARGET4  ==  FALSE ) && ((Npc_HasItems(other,ItMi_Gold) >=  2000 ) || (Npc_HasItems(other,self_nigelpocket) >=  1 )))))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork4done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork4Done_01_00 " );	// I settled with Nigel.
	AI_Output(self,other, " DIA_pir_1398_KillWork4Done_01_01 " );	// (with interest) Did he give the money?
	if (( GRABTARGET4  ==  TRUE ) && ( NIGELBANDITISDEAD  ==  TRUE ) && ( KILLTARGET4  ==  FALSE ) && ((Npc_HasItems(other,ItMy_Gold) >=  2000 ) || (Npc_HasItems(other,own_nigelpocket) >=  1 ))) ;
	{
		AI_Output(other,self, " DIA_pir_1398_KillWork4Done_01_02 " );	// We can say yes. True, I had to tinker with this case a little.
		AI_Output(self,other, " DIA_pir_1398_KillWork4Done_01_03 " );	// Where's the money?!
		if(Npc_HasItems(other,itse_nigelpocket) >= 1)
		{
			B_GiveInvItems(other,self,itse_nigelpocket,1);
			AI_Output(other,self, " DIA_pir_1398_KillWork4Done_01_04A " );	// Here, take this wallet.
			Npc_RemoveInvItems(self,itse_nigelpocket,1);

			if(MIS_NIGELMATTER == LOG_Running)
			{
				MIS_NIGELMATTER = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_OBSOLETE);
			};
		}
		else
		{
			B_GiveInvItems(other,self,ItMi_Gold,2000);
			AI_Output(other,self, " DIA_pir_1398_KillWork4Done_01_04B " );	// Here, take this. Like you said - two thousand!
			Npc_RemoveInvItems(self,ItMi_Gold,2000);
		};
		AI_Output(self,other, " DIA_pir_1398_KillWork4Done_01_05 " );	// Great! Our client will be very satisfied with our work.
		AI_Output(self,other, " DIA_pir_1398_KillWork4Done_01_09 " );	// And for the fact that you managed to knock out a debt - your share for this business will be more than usual.
		AI_Output(self,other, " DIA_pir_1398_KillWork4Done_01_10 " );	// Here you go - a whole bunch of gold! I hope you can find a worthy use for it.
		AI_Output(other,self, " DIA_pir_1398_KillWork4Done_01_11 " );	// You can be sure.
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		MIS_KILLTARGET4 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_SUCCESS);
		B_LogEntry( TOPIC_KILLTARGET4 , " Asmal was delighted to know that I managed to get Nigel out of debt. " );
	}
	else if(KILLTARGET4 == TRUE)
	{
		AI_Output(other,self, " DIA_pir_1398_KillWork4Done_01_12 " );	// Unfortunately not. The guy did not take seriously all my arguments, and he did not have any money either.
		AI_Output(other,self, " DIA_pir_1398_KillWork4Done_01_13 " );	// So I had to kill him.
		AI_Output(self,other, " DIA_pir_1398_KillWork4Done_01_14 " );	// Sorry. Although, in general, I did not really count on the fact that you would be able to knock this money out of him.
		AI_Output(self,other, " DIA_pir_1398_KillWork4Done_01_15 " );	// But anyway, you did a good job.
		AI_Output(self,other, " DIA_pir_1398_KillWork4Done_01_16 " );	// Here, take it - as always, your fee for the trouble.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_KILLTARGET4 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_SUCCESS);
		B_LogEntry( TOPIC_KILLTARGET4 , " Asmal was a little upset that I couldn't get Nigel out of debt. On the other hand, the job is done, and that's enough. " );
	};
	MISSION4COMPLETE = TRUE;
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK5(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork5_condition;
	information = dia_addon_inextremo_announcer_killwork5_info;
	permanent = FALSE;
	description = " Any more work to do? " ;
};


func int dia_addon_inextremo_announcer_killwork5_condition()
{
	if (( JOINKILLERS  ==  TRUE ) && ( KILLTARGET5  ==  FALSE ) && ( KILLTARGET1  ==  TRUE ) && ( KILLTARGET2  ==  TRUE ) && ( KILLTARGET3  ==  TRUE ) && ( MISSION4COMPLETE  ==  TRUE ) && ( WAMBOISDEAD  ==  TRUE ) . )
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork5_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork5_01_00 " );	// Any more work?
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_01 " );	// (seriously) Perhaps there is. There is one issue that needs to be addressed immediately.
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_05 " );	// Recently I met a man in Orlan's tavern. Not quite a simple person... an old acquaintance from the distant past.
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_07 " );	// Once upon a time, he was a member of our guild of assassins.
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_10 " );	// But then it happened that this idiot managed to get burned on one case and almost set us all up!
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_11 " );	// He was sentenced to hard labor in the mines in some of the kingdom's colonies. Well, we managed to avoid this bitter fate.
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_13 " );	// No one has heard from him since. At least until recently.
	AI_Output(other,self, " DIA_pir_1398_KillWork5_01_17 " );	// What exactly is the problem?
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_18 " );	// Problem is, he knows too much about us!
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_19 " );	// Plus, this guy still blames us for not being able to get him out of the shit he got himself into back then.
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_20 " );	// And I think now that he met me here on the island, this bastard will not fail to turn me in to the city militia when the opportunity arises.
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_21 " );	// Yes, and the sound of gold for him is not the last in this life.
	AI_Output(other,self, " DIA_pir_1398_KillWork5_01_22 " );	// But he's a runaway convict. Nobody will believe him!
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_23 " );	// Possibly. But don't take that risk!
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_24 " );	// True, as far as I know, now he has gone as a mercenary to Onar's yard.
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_27 " );	// We need to figure it out and as soon as possible!
	AI_Output(other,self, " DIA_pir_1398_KillWork5_01_30 " );	// What's his name?
	AI_Output(self,other, " DIA_pir_1398_KillWork5_01_31 " );	// His name is Rudar. Remember?
	AI_Output(other,self, " DIA_pir_1398_KillWork5_01_32 " );	// Yes, no problem. Consider him already dead.
	MIS_KILLTARGET5 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET5,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET5,LOG_Running);
	B_LogEntry( TOPIC_KILLTARGET5 , " Asmal recently met an old acquaintance. Once upon a time he was a member of the assassin's guild, until he got into a story, because of which he was exiled to hard labor in the Valley of Mines. Asmal is sure that this type is Rudar - he will not fail to hand over Asmal to the militia at the first opportunity because he could not help him in that situation at the first opportunity. Therefore, I need to solve this problem as soon as possible. Asmal said that Rudar went as a mercenary to Onar. " );
	Wld_InsertNpc(sld_6111_rudar,"NW_BIGFARM_RUDAR");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK5DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork5done_condition;
	information = dia_addon_inextremo_announcer_killwork5done_info;
	permanent = FALSE;
	description = " Rudar is dead. " ;
};


func int dia_addon_inextremo_announcer_killwork5done_condition()
{
	if((MIS_KILLTARGET5 == LOG_Running) && (KILLTARGET5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork5done_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWork5Done_01_00 " );	// Rudar is dead.
	AI_Output(self,other, " DIA_pir_1398_KillWork5Done_01_03 " );	// Hmmm... (relieved) Well, then, perhaps, we can forget about this problem.
	AI_Output(self,other, " DIA_pir_1398_KillWork5Done_01_04 " );	// I'm even honestly surprised you could handle it on your own.
	AI_Output(self,other, " DIA_pir_1398_KillWork5Done_01_05 " );	// Rudar has always been a good fighter and also an excellent swordsman. Unlike me, he always preferred a sword over a sword.
	AI_Output(self,other, " DIA_pir_1398_KillWork5Done_01_06 " );	// But okay... none of that matters anymore. Another thing is important - that he will no longer be able to open his filthy mouth.
	AI_Output(self,other, " DIA_pir_1398_KillWork5Done_01_07 " );	// Here, take this gold. This is the best reward for your work that I can offer.
	AI_Output(other,self, " DIA_pir_1398_KillWork5Done_01_08 " );	// Thank you!
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	MIS_KILLTARGET5 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET5,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLTARGET5 , " Asmal breathed a sigh of relief upon learning of Rudar's death. " );
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINAL(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinal_condition;
	information = dia_addon_inextremo_announcer_killworkfinal_info;
	permanent = FALSE;
	description = " Any other errands? " ;
};


func int dia_addon_inextremo_announcer_killworkfinal_condition()
{
	if (( JOINKILLERS  ==  TRUE ) && ( KILLTARGETFINAL  ==  FALSE ) && ( KILLTARGET1  ==  TRUE ) && ( KILLTARGET2  ==  TRUE ) && ( KILLTARGET3  ==  TRUE ) && ( MISSION4COMPLETE  ==  TRUE ) && ( KILLTARGET5  ==  TRUE ) . && ( WAMBOISDEAD  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinal_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_00 " );	// Any other errands?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_01 " );	// I think so.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_05 " );	// As you probably already know, there have been too many bandits in the vicinity of Khorinis lately.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_07 " );	// You yourself understand that such people have nothing to lose, and they are ready to do anything to snatch more jackpot while there is an opportunity.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_08 " );	// They rob and kill everyone! In general, these bastards are completely brutalized.
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_09 " );	// What are you doing here? What does the Assassin's Guild have to do with everything that's going on?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_12 " );	// There are a lot of dissatisfied people in the city because of everything that is happening. In most cases, it is the merchants whose business suffers the most from these robberies and attacks.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_13 " );	// Recently, one such merchant was attacked by bandits. He was carrying a large consignment of various goods and, according to him, a decent amount of gold!
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_14 " );	// Wow! Apparently, the merchant was a big one!
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_15 " );	// Yeah, those scumbags are damn lucky! Fortunately for himself, he was able to get out of this alteration alive, and now he really wants to return his good and his gold back.
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_16 " );	// Then he should have contacted the city militia.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_17 " );	// WHAT?! To these shorts? (laughs) They won't even show their noses outside the city gates - let alone deal with a whole gang.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_18 " );	// All they can do is to tax local farmers. So he turned to us for help.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_21 " );	// By making this offer to us, he hinted that he was speaking on behalf of many influential people in the city.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_22 " );	// Apparently, other merchants supported him in this endeavor. Still, it's in their interest!
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_23 " );	// And you agreed?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_24 " );	// Yes, I agreed. Too good money he offered us for this work!
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_2A " );	// And how much will each share in this business?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_2B " );	// Can't say yet, but it's a decent jackpot. You can not doubt it!
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_28 " );	// Clear. Have you already done something about this?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_29 " );	// I sent Luther and Flail to find out more about these bandits.
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_30 " );	// And what did they learn?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_31 " );	// Not much. The leader of the gang that attacked the merchant seems to be named Hans. I haven't heard anything about him before.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_32 " );	// Together with him, there are about seven other people in the gang, and they all settled down somewhere not far from Onar's farm.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_37 " );	// After we managed to find out where these bastards are, I sent a few of my guys to deal with them.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_41 " );	// But those guys aren't that simple!
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_42 " );	// My guys barely got out of there. Good thing no one was killed!
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_44 " );	// Looks like you ran into tough bandits!
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_45 " );	// Unfortunately, you're right. The Hans gang turned out to be too tough for my guys! And, apparently, you can’t just take them with your bare hands.
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_46 " );	// And what are you going to do now?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_47 " );	// In any case, the job must be done, and it doesn't matter if one person needs to be killed or an entire gang! I think I'll have to pay a visit to this Hans and his guys personally.
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_48 " );	// Are you going to go alone?!
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_49 " );	// Of course not! (laughs) I'm not completely out of my mind yet.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_50 " );	// We'll all go there together! I think then we will have a chance to beat Hans and his guys.
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_54 " );	// When do we move out?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_55 " );	// Right now. We will get out of the city one by one, so as not to attract the attention of the guards.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_58 " );	// We'll be waiting for you in the forest near Onar's farm.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinal_01_60 " );	// According to Luther, there's another guy tending sheep near that place.
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinal_01_62 " );	// Okay, I got it.
	MIS_KILLTARGETFINAL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGETFINAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_Running);
	B_LogEntry( TOPIC_KILLTARGETFINAL , " Asmal said we need to deal with a small gang that has settled near Onar's farm. It is led by a certain Hans, and apparently, he and his guys are pretty cool guys. But work is work, besides, according to Asmal, she will be paid very well. I will have to meet Asmal and the rest of his people near Onar's farm, next to the pasture, after which we will start doing our dirty work. " );
	AI_StopProcessInfos(self);
	b_killmeetinghans();
	Wld_InsertNpc(bdt_6112_hans,"NW_BDT_HANS_S");
	Wld_InsertNpc(bdt_6113_hansband_01,"NW_BDT_HANS_01_S");
	Wld_InsertNpc(bdt_6114_hansband_02,"NW_BDT_HANS_02_S");
	Wld_InsertNpc(bdt_6115_hansband_03,"NW_BDT_HANS_03_S");
	Wld_InsertNpc(bdt_6116_hansband_04,"NW_BDT_HANS_04_S");
	Wld_InsertNpc(bdt_6117_hansband_05,"NW_BDT_HANS_05_S");
	Wld_InsertNpc(bdt_6118_hansband_06,"NW_BDT_HANS_06_S");
	Wld_InsertNpc(bdt_6119_hansband_07,"NW_BDT_HANS_07_S");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINALREADYFORFIGHT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinalreadyforfight_condition;
	information = dia_addon_inextremo_announcer_killworkfinalreadyforfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_killworkfinalreadyforfight_condition()
{
	if((Npc_GetDistToWP(self,"NW_HANSLAGER") < 500) && (MIS_KILLTARGETFINAL == LOG_Running) && (KILLTARGETFINAL == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinalreadyforfight_info()
{
	self.name[0] = "Асмал";
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalReadyForFight_01_00 " );	// (nervously) Where are you?! Why so long?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalReadyForFight_01_02 " );	// Oh, okay! There is no time for chatting now.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalReadyForFight_01_03 " );	// Do you see a small glow of a fire behind me in the forest? This is the Hans camp.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalReadyForFight_01_05 " );	// Time to act! Let's take them by surprise - this will give us a certain advantage at the beginning of the battle.
	GuideGuildsToCamp = TRUE;
	Info_ClearChoices(dia_addon_inextremo_announcer_killworkfinalreadyforfight);
	Info_AddChoice(dia_addon_inextremo_announcer_killworkfinalreadyforfight,"Идем!",dia_addon_inextremo_announcer_killworkfinalreadyforfight_figth);
};

func void dia_addon_inextremo_announcer_killworkfinalreadyforfight_figth()
{
	AI_StopProcessInfos(self);
	b_killgotohans();
	b_changeguild(PIR_1390_Addon_InExtremo_DrPymonte,GIL_NONE);
	b_changeguild(PIR_1391_Addon_InExtremo_TheFlail,GIL_NONE);
	b_changeguild(PIR_1395_Addon_InExtremo_Lutter,GIL_NONE);
	b_changeguild(PIR_1396_Addon_InExtremo_Flex,GIL_NONE);
	b_changeguild(pir_1397_addon_inextremo_charlotte,GIL_NONE);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_NONE);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINALDONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinaldone_condition;
	information = dia_addon_inextremo_announcer_killworkfinaldone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_killworkfinaldone_condition()
{
	if((MIS_KILLTARGETFINAL == LOG_Running) && (KILLTARGETFINAL == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinaldone_info()
{
	var int countlost;
	var int countsharlotte;
	self.name[0] = "Асмал";
	b_changeguild(PIR_1390_Addon_InExtremo_DrPymonte,GIL_OUT);
	b_changeguild(PIR_1391_Addon_InExtremo_TheFlail,GIL_OUT);
	b_changeguild(PIR_1395_Addon_InExtremo_Lutter,GIL_OUT);
	b_changeguild(PIR_1396_Addon_InExtremo_Flex,GIL_OUT);
	b_changeguild(pir_1397_addon_inextremo_charlotte,GIL_OUT);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_OUT);
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_00 " );	// (breathing) Hans and his men are no longer dangerous.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_02 " );	// Those bastards really were tough guys.
	MIS_KILLTARGETFINAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLTARGETFINAL , " Hans' gang is finished - all his people are dead, as is he. " );

	if((CHARLOTTEISDEADX == TRUE) || (FLEXISDEADX == TRUE) || (LUTTERISDEADX == TRUE) || (THEFLAILISDEADX == TRUE) || (DRPYMONTEISDEADX == TRUE))
	{
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_04 " );	// M-yes... this job cost us dearly!
		if(CHARLOTTEISDEADX == TRUE)
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_05 " );	// Charlotte...
			countsharlotte = 1;
			countlost = countlost + 1;
		};
		if(FLEXISDEADX == TRUE)
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_06 " );	// Flex...
			countlost = countlost + 1;
		};
		if(LUTTERISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_07");	//Лютер...
			countlost = countlost + 1;
		};
		if(THEFLAILISDEADX == TRUE)
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_08 " );	// Flail...
			countlost = countlost + 1;
		};
		if(DRPYMONTEISDEADX == TRUE)
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_09 " );	// Compact...
			countlost = countlost + 1;
		};
		if(countlost > 1)
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_10 " );	// ...they're all dead...(sadly) We'll all miss them so much!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_12 " );	// Okay, let's not talk about it anymore. Now there is nothing to fix.
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_13 " );	// Our work is done, and this is the most important thing.
		}
		else
		{
			if(countsharlotte == 1)
			{
				AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_14 " );	// ...she's dead! Poor girl... (sadly) We will all miss her so much!
			}
			else
			{
				AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_16 " );	// ...he's dead! We will all miss him greatly.
			};
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_18 " );	// ...(thoughtfully) Well, let's not talk about it anymore. Now there is nothing to fix.
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_19 " );	// Our work is done, and this is the most important thing.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_20 " );	// So we got off lightly - it looks like none of our guys got killed.
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_22 " );	// Okay, let's not talk about it anymore. Now they are all dead and our job is done. And this is the most important thing!
	};

	AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_23 " );	// What about the promised pile of gold?
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_24 " );	// Oh yes, gold! Now each of us will get a decent jackpot. The gold that the bandits took from the merchant is our fee for this job.

	if ( GLOVES  ==  0 )
	{
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_25 " );	// True, you didn't help us much in this mess, but you still risked your life, which means you deserve your share.
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_26 " );	// Here, take it - here are five hundred gold coins!
		AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_27 " );	// How! So few?
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_28 " );	// But you didn't even kill a single bandit! And you want to get even more?
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_29 " );	// So stop whining and complaining like a woman!
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_30 " );	// I should have swung my sword better if I wanted your share to be more than this... (laughs)
		AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_31 " );	// I don't like this!
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_32 " );	// These are your personal problems.
		Info_ClearChoices(dia_addon_inextremo_announcer_killworkfinaldone);
		Info_AddChoice(dia_addon_inextremo_announcer_killworkfinaldone, " Okay, give me money here. " ,dia_addon_inextremo_announcer_killworkfinaldone_ok);
		Info_AddChoice(dia_addon_inextremo_announcer_killworkfinaldone, " Pay me more now or I'll kill you! " ,dia_addon_inextremo_announcer_killworkfinaldone_refuse);
	}
	else
	{
		AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_34 " );	// As for you, you did a great job!
		MIS_KILLTARGETFINAL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
		B_LogEntry( TOPIC_KILLTARGETFINAL , " Hans' gang is finished - all his people are dead, as is he. " );

		if ( GLOVES  ==  1 )
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_35 " );	// Finished off one of those bastards - good job, man!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_36 " );	// Here, take this - there's a thousand gold coins.
			AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_37 " );	// Well, not bad at all.
			B_GiveInvItems(self,other,ItMi_Gold,1000);
		}
		else  if ( SKILLS  ==  2 )
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_39 " );	// Killed two bastards from this gang - good job, man!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_40 " );	// Here, take this - there are one and a half thousand gold coins.
			AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_41 " );	// Well, not bad at all.
			B_GiveInvItems(self,other,ItMi_Gold,1500);
		}
		else  if ( SKILLS  ==  3 )
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_43 " );	// Finished off three bastards from the Hans gang - great job, man!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_44 " );	// Here, take it - there are two thousand gold coins.
			AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_45 " );	// Well, not bad at all.
			B_GiveInvItems(self,other,ItMi_Gold,2000);
		}
		else  if ( SKILLS  ==  4 )
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_47 " );	// Killed four bastards from the Hans gang - a job worthy of respect, boy!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_48 " );	// Here, take it - there are two and a half thousand gold coins!
			AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_49 " );	// Well, not bad at all!
			B_GiveInvItems(self,other,ItMi_Gold,2500);
		}
		else  if ( SKILLS  ==  5 )
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_51 " );	// (surprised) Killed as many as five bastards from the gang of Hans - incomprehensible!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_52 " );	// Here, take it - there are three thousand gold coins!
			AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_53 " );	// Well, not bad at all!
			B_GiveInvItems(self,other,ItMi_Gold,3000);
		}
		else  if ( SKILLS  ==  6 )
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_55 " );	// (delighted) Killed six! To be honest, I did not expect such a quickness from you!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_56 " );	// Here, take it - there are three and a half thousand gold coins!
			AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_57 " );	// Well, not bad at all!
			B_GiveInvItems(self,other,ItMi_Gold,3500);
		}
		else  if ( SKILLS  ==  7 )
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_59 " );	// My mind is incomprehensible - one killed seven! There are no words!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_60 " );	// The bandits obviously didn't realize who they were messing with!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_61 " );	// Here, take it - there are four thousand gold coins! This is very decent money, more than commensurate with your merits in this matter.
			AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_62 " );	// Well, not bad at all!
			B_GiveInvItems(self,other,ItMi_Gold,4000);
		}
		else  if ( SKILLS  ==  8 )
		{
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_64 " );	// Finished off all the bandits, and even Hans himself to boot! It seems to me that you would have managed this case without us.
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_65 " );	// I think if Hans knew that a guy like you was after his head, he wouldn't even be here!
			AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_01_67 " );	// Here, take it - there are five thousand gold coins! This is very decent money, more than commensurate with your merits in this matter.
			AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_01_68 " );	// Well, not bad at all!
			B_GiveInvItems(self,other,ItMi_Gold,5000);
		};
	};
};

func void dia_addon_inextremo_announcer_killworkfinaldone_ok()
{
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_Ok_01_00 " );	// Okay, give me the money here.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_Ok_01_01 " );	// That's better! Keep your share.
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_Ok_01_02 " );	// And I don't want to hear that whining from you again!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_announcer_killworkfinaldone_refuse()
{
	AI_Output(other,self, " DIA_pir_1398_KillWorkFinalDone_Refuse_01_00 " );	// Pay me more immediately or I'll kill you!
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_Refuse_01_01 " );	// WHAT?! You still threaten me! Who are you to threaten me?!
	AI_Output(self,other, " DIA_pir_1398_KillWorkFinalDone_Refuse_01_02 " );	// You'll still have to teach good manners! You greedy bastard!
	TROUBLEWITHASMAL = TRUE;
	AI_StopProcessInfos(self);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_OUT);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLAFTERDO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killafterdo_condition;
	information = dia_addon_inextremo_announcer_killafterdo_info;
	permanent = FALSE;
	description = " So what are you going to do now? " ;
};


func int dia_addon_inextremo_announcer_killafterdo_condition()
{
	if(MIS_KILLTARGETFINAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killafterdo_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillAfterDo_01_00 " );	// What are you going to do now?
	AI_Output(self,other, " DIA_pir_1398_KillAfterDo_01_01 " );	// I think we'll stay here - away from the city and away from the problems.
	AI_Output(self,other, " DIA_pir_1398_KillAfterDo_01_03 " );	// Here, next to that fat boar Onar and his mercenaries, you can feel much more comfortable.
	AI_Output(other,self, " DIA_pir_1398_KillAfterDo_01_07 " );	// Got it.
	KILLFINISH = TRUE;
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLCANBEMASTER (C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killcanbemaster_condition;
	information = dia_addon_inextremo_announcer_killcanbemaster_info;
	permanent = FALSE;
	description = " How can I get the same armor as yours? " ;
};


func int dia_addon_inextremo_announcer_killcanbemaster_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killreward))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killcanbemaster_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillCanBeMaster_01_00 " );	// How can I get the same armor as you?
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_01 " );	// I'm afraid not! (laughs)
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_03 " );	// This armor is the master of the Assassin's Guild, and only those with this privilege can wear it!
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_04 " );	// They emphasize his status in the guild in front of the rest.
	AI_Output(other,self, " DIA_pir_1398_KillCanBeMaster_01_07 " );	// How do I become an assassin guild master?
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_08 " );	// Hmmm...(looks closely) Are you implying that you want to lead an assassin's guild?
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_10 " );	// And you're a risky guy! This question has not been asked to me for a very long time, because I have long discouraged most people from asking me it!
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_11 " );	// But you're new to our guild, so let me explain something to you.
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_12 " );	// There can only be one master per guild, my friend, and for now, that's me!
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_13 " );	// If you want to become one yourself, you'll have to wait until I step down as guildmaster or...
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_14 " );	// ...you can just challenge me! (laughs)
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_15 " );	// To be honest, I'd be very interested to see how you do it.
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_16 " );	// Although I know for sure that you have no chance against me... (laughs)
	AI_Output(other,self, " DIA_pir_1398_KillCanBeMaster_01_17 " );	// Do you think so?
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_18 " );	// I'm sure of it! Or do you think you're the first one to take my place?
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_19 " );	// Before you, there were plenty of daredevils like you, but now they all feed rats... (gloatingly)
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_21 " );	// So if I were you, I'd get this idea out of my head, and as soon as possible - it's better for you!
	AI_Output(other,self, " DIA_pir_1398_KillCanBeMaster_01_23 " );	// I'll think about your suggestion.
	AI_Output(self,other, " DIA_pir_1398_KillCanBeMaster_01_24 " );	// That's right - think carefully before making rash moves!
	B_LogEntry( TOPIC_KILLWAY , " Asmal said that if I want to get the Assassin's Guild Master Armor and become its leader, the only way to do it is to challenge him. In my opinion, Asmal is an excellent fighter, and it will not be easy to defeat him. " );
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLBEOUT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killbeout_condition;
	information = dia_addon_inextremo_announcer_killbeout_info;
	permanent = FALSE;
	description = " I want to challenge you. " ;
};

func int dia_addon_inextremo_announcer_killbeout_condition()
{
	if (Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killcanbemaster))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killbeout_info()
{
	self.name[0] = "Асмал";
	AI_Output(other,self, " DIA_pir_1398_KillBeOut_01_00 " );	// I want to challenge you.
	AI_Output(self,other, " DIA_pir_1398_KillBeOut_01_01 " );	// So, you still decided on this. Ha! (laughs)
	AI_Output(self,other, " DIA_pir_1398_KillBeOut_01_02 " );	// A bold move, but very stupid in my opinion.
	AI_Output(other,self, " DIA_pir_1398_KillBeOut_01_03 " );	// This will decide our duel!
	AI_Output(other,self, " DIA_pir_1398_KillBeOut_01_04 " );	// In any case, if this is the only way to become the head of the assassin's guild, then you can rest assured that I will do it!
	AI_Output(self,other, " DIA_pir_1398_KillBeOut_01_05 " );	// (laughs) Pathetic worm! Okay, let's see how good you are.
	AI_Output(self,other, " DIA_pir_1398_KillBeOut_01_06 " );	// I'll kill you quickly.
	CANBEKILLMASTER = TRUE;
	B_LogEntry( TOPIC_KILLWAY , " I challenged Asmal. Now only a fight will decide which of us is worthy to be the head of the assassin's guild. " );
	AI_StopProcessInfos(self);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_NONE);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};
