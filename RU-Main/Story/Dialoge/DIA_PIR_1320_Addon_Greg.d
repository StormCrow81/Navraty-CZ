
var int GregCanPray;
var int FindPirate_01;
var int FindPirate_02;

instance DIA_Addon_Greg_EXIT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 999;
	condition = DIA_Addon_Greg_EXIT_Condition;
	information = DIA_Addon_Greg_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	if((GregCanPray == TRUE) && (MIS_PiratePray == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_Greg_Pray_01_00 " );	// Wait! I have one small request for you.
		AI_Output(other,self,"DIA_Addon_Greg_Pray_01_01");	//Какая?
		AI_Output(self,other, " DIA_Addon_Greg_Pray_01_02 " );	// (sighing) You know, I've never been a believer.
		AI_Output(self,other, " DIA_Addon_Greg_Pray_01_03 " );	// But the case with the ring made me think about something.
		AI_Output(self,other, " DIA_Addon_Greg_Pray_01_04 " );	// So. Could you go to the monastery and ask someone there to pray for the souls of my people?
		AI_Output(self,other, " DIA_Addon_Greg_Pray_01_05 " );	// Trust me - I will thank you generously for this.
		AI_Output(other,self, " DIA_Addon_Greg_Pray_01_06 " );	// This won't be easy. But I will try.
		AI_Output(self,other, " DIA_Addon_Greg_Pray_01_07 " );	// Good. I'm counting on you boy!
		MIS_PiratePray = LOG_Running;
		Log_CreateTopic(TOPIC_PiratePray,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_PiratePray,LOG_Running);
		B_LogEntry(TOPIC_PiratePray, " Greg asked me to go to the monastery and ask someone to pray for the souls of his people. Looks like the story with the ring had a serious effect on him. " );
	};

	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_PICKPOCKET(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 900;
	condition = DIA_Addon_Greg_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Greg_PICKPOCKET_Condition()
{
	return  C_Robbery ( 111 , 666 );
};

func void DIA_Addon_Greg_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};


instance DIA_Addon_Greg_ImNew(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_ImNew_Condition;
	information = DIA_Addon_Greg_ImNew_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_Hello_01_00 " );	// (threateningly) Hey you! What are you doing in my hut?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//Я...
	AI_Output(self,other, " DIA_Addon_Greg_Hello_01_02 " );	// (furious) It's worth leaving for a few days, and now every rogue strives to take care of my home.
	AI_Output(self,other, " DIA_Addon_Greg_ImNew_01_03 " );	// What the hell is going on here?
	AI_Output(self,other, " DIA_Addon_Greg_ImNew_01_04 " );	// The palisade isn't finished yet! The canyon is just teeming with animals, and all they do is stick around.
	GregIsBack = TRUE;
	if ( ! Npc_IsDead(Francis))
	{
		AI_TurnToNPC(self,Francis);
		AI_Output(self,other, " DIA_Addon_Greg_ImNew_01_05 " );	// (shouting) Is that all you did, Francis?
		if(C_BodyStateContains(Francis,BS_SIT))
		{
			AI_Output(self,other, " DIA_Addon_Greg_ImNew_01_06 " );	// (shouting) Get off my bench immediately!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other, " DIA_Addon_Greg_ImNew_01_07 " );	// And YOU? What did you do?
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew, " Not much yet. " ,DIA_Addon_Greg_ImNew_nich);
	if ((Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && Npc_IsDead (BeachShadowbeast1) && ( MIS_Addon_MorganLurker !=  0 )) ) == TRUE )) 
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew, " Я работал. " ,DIA_Addon_Greg_ImNew_turm);
	};
};

func void B_UseRakeBilanz()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Greg_UseRakeBilanz_01_00 " );	// And don't think I've forgotten that you owe me.
		AI_Output(self,other, " DIA_Addon_Greg_UseRakeBilanz_01_01 " );	// In various places of Khorinis, I buried several hundred gold coins.
		AI_Output(self,other, " DIA_Addon_Greg_UseRakeBilanz_01_02 " );	// You pocketed them, didn't you?
		AI_Output(self,other, " DIA_Addon_Greg_UseRakeBilanz_01_03 " );	// I'll make you work every last copper.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_UseRakeBilanz_01_04 " );	// I'll show you what it means to work hard.
	};
	if ( ! Npc_IsDead(Francis))
	{
		Npc_ExchangeRoutine(Francis,"GREGISBACK");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis_ausschissen = TRUE ;
	};
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other,self, " DIA_Addon_Greg_ImNew_nich_15_00 " );	// Not much yet.
	AI_Output(self,other, " DIA_Addon_Greg_ImNew_nich_01_01 " );	// Doesn't matter. I'll get you something, buddy.
	B_UseRakeBalance();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other,self, " DIA_Addon_Greg_ImNew_turm_15_00 " );	// I worked.
	AI_Output(self,other, " DIA_Addon_Greg_ImNew_turm_01_01 " );	// True? So what?
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Greg_ImNew_turm_15_02 " );	// I dealt with the bandits from the tower.
	};
	if (Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker !=  0 ))
	{
		AI_Output(other,self, " DIA_Addon_Greg_ImNew_turm_15_03 " );	// There are no more wild animals on the coast to the north.
	};
	AI_Output(self,other, " DIA_Addon_Greg_ImNew_turm_01_04 " );	// Well then. I guess it's a good start.
	B_UseRakeBalance();
};

instance DIA_Addon_Greg_SmokePipe(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = DIA_Addon_Greg_SmokePipe_Condition;
	information = DIA_Addon_Greg_SmokePipe_Info;
	permanent = FALSE;
	description = " I see you smoking a pipe. " ;
};

func int DIA_Addon_Greg_SmokePipe_Condition()
{
	if((GregHasPipe == TRUE) && (MIS_JackSmokePipe == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_SmokePipe_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Greg_SmokePipe_01_00 " );	// I see you smoking a pipe.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_01 " );	// Well, yes, you do not need to be observant.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_02 " );	// And why did you suddenly decide to ask about this?
	AI_Output(other,self, " DIA_Addon_Greg_SmokePipe_01_03 " );	// I just need the same one.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_04 " );	// Do you need a pipe? And why the hell do you need it?
	AI_Output(other,self, " DIA_Addon_Greg_SmokePipe_01_05 " );	// I don't need it. This is for an old sea dog like you.
	AI_Output(other,self, " DIA_Addon_Greg_SmokePipe_01_06 " );	// His old pipe was falling apart, and he can't find a new one anywhere.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_07 " );	// Hmmm. (thoughtfully) And what is the name of this sailor of yours?
	AI_Output(other,self, " DIA_Addon_Greg_SmokePipe_01_08 " );	// Jack. He is currently looking after the lighthouse in Khorinis.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_09 " );	// (surprised) Old Jack? Well, yes, I remember him. We used to go swimming together!
	AI_Output(other,self, " DIA_Addon_Greg_SmokePipe_01_10 " );	// Was he a pirate too?
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_11 " );	// Was. And, as far as I remember, quite dashing!
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_12 " );	// And the fact that he is now left without a tube is not entirely good.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_13 " );	// For example, I have already got used to mine, as if it were a part of myself!
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_14 " );	// Like him to his, I guess.
	AI_Output(other,self, " DIA_Addon_Greg_SmokePipe_01_15 " );	// And what can we do?
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_16 " );	// Luckily for you, I have another handset that I haven't used in a long time.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_17 " );	// I can give it to you, but on condition that you take it to Jack.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_18 " );	// And look - if I find out that you appropriated the pipe to yourself, - I'll skin you alive! Understood?!
	AI_Output(other,self, " DIA_Addon_Greg_SmokePipe_01_19 " );	// Of course.
	AI_Output(self,other, " DIA_Addon_Greg_SmokePipe_01_20 " );	// Good. Then here you go. And tell Jack hi for me!
	B_GiveInvItems(self,other,ItMi_Smoke_Pipe,1);
	B_LogEntry(TOPIC_JackSmokePipe, " Greg gave me a pipe to take to Jack. " );
	FindPirate_02 = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_DiscoverLH(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_DiscoverLH_Condition;
	information = DIA_Addon_Greg_DiscoverLH_Info;
	description = " Have you ever heard of a pirate named 'Kelevra'? " ;
};

func int DIA_Addon_Greg_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (CanGoGreg == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_DiscoverLH_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Addon_Greg_DiscoverLH_01_00 " );	// Have you ever heard of a pirate named Kelevra?
	AI_Output(self,other, " DIA_Addon_Greg_DiscoverLH_01_01 " );	// And not only heard. We plied the sea in the same team with him.
	AI_Output(other,self, " DIA_Addon_Greg_DiscoverLH_01_02 " );	// Do you know where he is now?
	AI_Output(self,other, " DIA_Addon_Greg_DiscoverLH_01_03 " );	// I have no idea. Haven't seen him for ten years.
	B_LogEntry(TOPIC_HauntedLighthouse, " Greg used to know a pirate named 'Kelevra'. But he hasn't been seen in years, and he doesn't know where to find him either. " );
	FindPirate_01 = TRUE;
};

instance DIA_Addon_Greg_GotPirate(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_GotPirate_Condition;
	information = DIA_Addon_Greg_GotPirate_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Greg_GotPirate_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindPirate_01 == TRUE) && (FindPirate_02 == TRUE) && (JackMainIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_GotPirate_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_GotPirate_01_00 " );	// Hey! Did you ask me about the pirate named 'Kelevra'?
	AI_Output(self,other, " DIA_Addon_Greg_GotPirate_01_02 " );	// So... When you give my old pipe to the person you were going to give it to, you will find him.
	GotPirate = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse, " Wow ! Looks like the pirate who killed the keeper at the haunted lighthouse was none other than Jack himself! We'll have to have a heart to heart talk with him... " );
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_JoinPirates(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_JoinPirates_Condition;
	information = DIA_Addon_Greg_JoinPirates_Info;
	permanent = FALSE;
	description = " What needs to be done? " ;
};


func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_JoinPirates_15_00 " );	// What should be done?
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_01_01 " );	// First of all, we need to sort things out here.
	if (Npc_IsDead(Morgan) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_01_02 " );	// This lazy pig Morgan will be sawing wood.
	};
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_01_03 " );	// And you'll take over Morgan's job and clear the canyon of those damned beasts.
	MIS_Addon_Greg_ClearCanyon = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon,LOG_Running);
	B_LogEntry(TOPIC_Addon_ClearCanyon, " Greg wants me to take over Morgan's job and clear the canyon of animals. " );
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates, " In that case, I have to go. " ,DIA_Addon_Greg_JoinPirates_Leave);
	if ((Npc_IsDead(Brandon) ==  FALSE ) || (Npc_IsDead(Matt) ==  FALSE ))
	{
		Info_AddChoice(DIA_Addon_Greg_JoinPirates, " Am I supposed to do this alone? " ,DIA_Addon_Greg_JoinPirates_Compadres);
	};
	Info_AddChoice(DIA_Addon_Greg_JoinPirates, " What are these animals? " ,DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other,self, " DIA_Addon_Greg_JoinPirates_Leave_15_00 " );	// Well then, I'm leaving.
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_Leave_01_01 " );	// One more thing. Now you are one of us.
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_Leave_01_02 " );	// So find some normal hunter clothes first.
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_Leave_01_03 " );	// Here, put this on! I hope you enjoy this gear.
	CreateInvItems(self,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_L_Addon,1);
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_Leave_01_04 " );	// And don't hesitate. Better get down to business.
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other,self, " DIA_Addon_Greg_JoinPirates_Compadres_15_00 " );	// Am I supposed to do this alone?
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_Compadres_01_01 " );	// You can bring the guys with you.
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_Compadres_01_02 " );	// Let them earn their wages.
	B_LogEntry(TOPIC_Addon_ClearCanyon, " Greg said I could take a few guys with me. " );
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other,self, " DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00 " );	// What are these animals?
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01 " );	// The razor teeth in the canyon are getting closer to our camp.
	AI_Output(self,other, " DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02 " );	// I'm not going to wait for them to eat one of my people.
	B_LogEntry(TOPIC_Addon_ClearCanyon, " I must hunt razor teeth. " );
};


instance DIA_Addon_Greg_AboutCanyon(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_AboutCanyon_Condition;
	information = DIA_Addon_Greg_AboutCanyon_Info;
	permanent = TRUE;
	description = " About the canyon... " ;
};


func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_AboutCanyon_15_00 " );	// About the canyon...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Да, что там?
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if(C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,Dialog_Back,DIA_Addon_Greg_AboutCanyon_Back);
		if ((Npc_IsDead(Brandon) ==  FALSE ) || (Npc_IsDead(Matt) ==  FALSE ))
		{
			Info_AddChoice(DIA_Addon_Greg_AboutCanyon, " Can anyone help me? " ,DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon, " What are these animals I should kill? " ,DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon, " I have destroyed all RazorsDead. " ,DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other,self, " DIA_Addon_Greg_AboutCanyon_Compadres_15_00 " );	// Can anyone help me?
	AI_Output(self,other, " DIA_Addon_Greg_AboutCanyon_Compadres_01_01 " );	// Take a couple of guys with you.
	AI_Output(self,other, " DIA_Addon_Greg_AboutCanyon_Compadres_01_02 " );	// They hang around anyway.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other,self, " DIA_Addon_Greg_AboutCanyon_Job_15_00 " );	// And what are these animals that I have to kill?
	AI_Output(self,other, " DIA_Addon_Greg_AboutCanyon_Job_01_01 " );	// Get rid of the razor teeth! Other creatures are not dangerous.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other,self, " DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00 " );	// I've destroyed all the razor teeth.
	AI_Output(self,other, " DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01 " );	// Good. Looks like you're useful.
	B_LogEntry(TOPIC_Addon_ClearCanyon, " Greg was impressed when I told him I killed all the razor teeth in the canyon. " );
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_addon_ClearCanyon);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};


instance DIA_Addon_Greg_BanditArmor(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditArmor_Condition;
	information = DIA_Addon_Greg_BanditArmor_Info;
	permanent = TRUE;
	description = " I need bandit armor. " ;
};


func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_BanditArmor_15_00 " );	// I need bandit armor.

	if(MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Greg_BanditArmor_01_01 " );	// Show what you can do first. After that we'll talk.
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			AI_Output(self,other, " DIA_Addon_Greg_BanditArmor_01_02 " );	// You must kill all the razor teeth first!
		};
		B_LogEntry(TOPIC_Addon_BDTRuestung, " Greg wants me to help him clean up the camp. Then I can talk to him about armor. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_BanditArmor_01_03 " );	// And you're great!
		AI_Output(self,other, " DIA_Addon_Greg_BanditArmor_01_04 " );	// Bones was supposed to watch the bandits. This armor was meant for him.
		AI_Output(self,other, " DIA_Addon_Greg_BanditArmor_01_05 " );	// But maybe YOUR candidacy is more suitable for this job.
		AI_Output(self,other, " DIA_Addon_Greg_BanditArmor_01_06 " );	// You might even get out of there alive.
		AI_Output(self,other, " DIA_Addon_Greg_BanditArmor_01_07 " );	// Talk to Bones to give you the armor. Then put it on and go to the bandit camp.
		AI_Output(self,other, " DIA_Addon_Greg_BanditArmor_01_08 " );	// I want to know why those bastards are in our valley.
		AI_Output(other,self, " DIA_Addon_Greg_BanditArmor_15_09 " );	// It will be done, captain!
		B_LogEntry(TOPIC_Addon_BDTRuestung, " After I'm done, I can get the armor from Bones. " );
		Log_CreateTopic(TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_ScoutBandits, " I need to find out why the bandits came to the valley and tell Greg. " );
		MIS_Greg_ScoutBandits = LOG_Running;
	};
};


instance DIA_Addon_Greg_Auftraege2 (C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Auftraege2_Condition;
	information = DIA_Addon_Greg_Auftraege2_Info;
	description = " Is there another job for me? " ;
};


func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if ((MIS_Greg_ScoutBandits !=  0 ) && ((C_TowerBanditsDead() ==  FALSE ) || ((Npc_IsDead(BeachLurker1) ==  FALSE ) && (Npc_IsDead(BeachLurker2) ==  FALSE ) && (Npc_IsDead(BeachLurker3) ==  FALSE ) && (Npc_IsDead(BeachWaran1) ==  FALSE ) && (Npc_IsDead(BeachWaran2) ==  FALSE ) && (Npc_IsDead(BeachShadowbeast1) ==  FALSE ))))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_Auftraege2_15_00 " );	// Any other work for me?
	if ((Npc_IsDead(BeachLurker1) ==  FALSE ) && (Npc_IsDead(BeachLurker2) ==  FALSE ) && (Npc_IsDead(BeachLurker3) ==  FALSE ) && (Npc_IsDead(BeachLurker1) ==  FALSE ) && (Npc_IsDead(BeachLurker2) ==  FALSE ) && (Npc_IsDead(BeachShadowbeast1) ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Addon_Greg_Auftraege2_01_01 " );	// The north coast is still inhabited by animals.
		AI_Output(self,other, " DIA_Addon_Greg_Auftraege2_01_02 " );	// Looks like Morgan didn't do anything.
		Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
		B_LogEntry(TOPIC_Addon_MorganBeach, " Greg wants me to clean up a monster-infested beach. " );
		MIS_Addon_MorganLurker = LOG_Running;
	};
	if(C_TowerBanditsDead() == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Greg_Auftraege2_01_03 " );	// There are still bandits in the south tower.
		AI_Output(self,other, " DIA_Addon_Greg_Auftraege2_01_04 " );	// Francis should have dealt with them a long time ago, but did nothing.
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower, " Greg asked me to deal with the bandits who have taken over the tower south of the camp. " );
		MIS_Henry_FreeBDTTower = LOG_Running;
	};
	AI_Output(self,other, " DIA_Addon_Greg_Auftraege2_01_05 " );	// I think you can do this.
};


instance DIA_Addon_Greg_Sauber2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Sauber2_Condition;
	information = DIA_Addon_Greg_Sauber2_Info;
	description = " Northern beach is now safe. " ;
};


func int DIA_Addon_Greg_Sauber2_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead (BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead (BeachShadowbeast1))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_Sauber2_15_00 " );	// The north coast is now safe.
	AI_Output(self,other, " DIA_Addon_Greg_Sauber2_01_01 " );	// Great. Keep your reward.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_MorganBeach, " I reported to Greg that the beach to the north has been cleared of monsters. " );
	MIS_Addon_MorganLurker = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
};


instance DIA_Addon_Greg_BanditPlatt2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditPlatt2_Condition;
	information = DIA_Addon_Greg_BanditPlatt2_Info;
	description = "The bandits in the tower have been destroyed. " ;
};


func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && (C_TowerBanditsDead() == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_BanditPlatt2_15_00 " );	// The bandits in the tower have been destroyed.
	AI_Output(self,other, " DIA_Addon_Greg_BanditPlatt2_01_01 " );	// Great. Good job. Here is your reward.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_BanditsTower, "The tower bandits are dead. Greg is very pleased. " );
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
};


instance DIA_Addon_Greg_BanditGoldmine(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditGoldmine_Condition;
	information = DIA_Addon_Greg_BanditGoldmine_Info;
	permanent = TRUE;
	description = "The bandits found a gold mine. " ;
};


func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if((SC_KnowsRavensGoldmine == TRUE) && (MIS_Greg_ScoutBandits == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_BanditGoldmine_15_00 " );	// Bandits found a gold mine.
	AI_Output(self,other, " DIA_Addon_Greg_BanditGoldmine_01_01 " );	// I knew it! That's why they came here.
	AI_Output(self,other, " DIA_Addon_Greg_BanditGoldmine_01_02 " );	// Nobody wants to live in this hole.
	AI_Output(self,other, " DIA_Addon_Greg_BanditGoldmine_01_03 " );	// Good job. Here you go, I have a reward for you.
	B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	B_LogEntry(TOPIC_Addon_ScoutBandits, " I told Greg about the gold mine. " );
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};


instance DIA_Addon_Greg_WhoAreYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_WhoAreYou_Condition;
	information = DIA_Addon_Greg_WhoAreYou_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int DIA_Addon_Greg_WhoAreYou_Condition()
{
	if((PlayerTalkedToGregNW == FALSE) && (SC_MeetsGregTime == 0))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Addon_Greg_WhoAreYou_01_01 " );	// I'm Greg, the leader of this lazy pack.
	AI_Output(self,other, " DIA_Addon_Greg_WhoAreYou_01_02 " );	// Are you satisfied with this answer?
};


instance DIA_Addon_Greg_NiceToSeeYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_NiceToSeeYou_Condition;
	information = DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent = FALSE;
	description = " How did you get here? " ;
};


func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NiceToSeeYou_15_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_Addon_Greg_NiceToSeeYou_01_01 " );	// Didn't expect to see me here, huh?
	AI_Output(self,other, " DIA_Addon_Greg_NiceToSeeYou_01_02 " );	// Let's dot the 'i's right away. I'm Greg and this is my camp.
	AI_Output(self,other, " DIA_Addon_Greg_NiceToSeeYou_01_03 " );	// Are you satisfied with this answer?
};


instance DIA_Addon_Greg_Story(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 99;
	condition = DIA_Addon_Greg_Story_Condition;
	information = DIA_Addon_Greg_Story_Info;
	permanent = TRUE;
	description = " I would like to know one more thing. " ;
};


func int DIA_Addon_Greg_Story_Condition()
{
	if (((Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou) ==  TRUE ) || (Npc_KnowsInfo(other,DIA_Addon_Greg_NiceToSeeYou) ==  TRUE )) && (MIS_Greg_ScoutBandits !=  0 )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_Story_15_00 " );	// I would like to know one more thing.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Что именно?
	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story,Dialog_Back,DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story, " How did you get here? " ,DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story, " Do you want to ship? " ,DIA_Addon_Greg_Story_Ship);

	if(RavenAway == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story, " What do you know about Raven? " ,DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other,self, " DIA_Addon_Greg_Story_Way_15_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_Addon_Greg_Story_Way_01_01 " );	// I found the entrance to a tunnel near an ancient pyramid guarded by several mages.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Way_01_02 " );	// I managed to slip past these blind men unnoticed.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Way_01_03 " );	// At first I mistook this place for an ancient crypt and decided to check what you can profit from there.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Way_01_04 " );	// Imagine my surprise when I found myself in this wonderful valley.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Way_01_05 " );	// And this happened just at the moment when I had already decided that I would have to hide from the militia for the rest of my life.
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other,self, " DIA_Addon_Greg_Story_Ship_15_00 " );	// Where's your ship?
	AI_Output(self,other, " DIA_Addon_Greg_Story_Ship_01_01 " );	// (sarcastically) I'm a damn lucky person. No ships have sailed here for several months.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Ship_01_02 " );	// Several months! And the first ship that I meet after that turns out to be a warship belonging to the king.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Ship_01_03 " );	// It was full of paladins.
	AI_Output(other,self, " DIA_Addon_Greg_Story_Ship_15_04 " );	// Yes, it didn't connect you.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Ship_01_05 " );	// That's it. They immediately drowned us. I'm the only one who made it to shore.
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other,self, " DIA_Addon_Greg_Story_Raven_15_00 " );	// What do you know about Raven?
	AI_Output(self,other, " DIA_Addon_Greg_Story_Raven_01_01 " );	// He traded in ore. Quite a large cone in the colony.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Raven_01_02 " );	// I have no idea where he might be now or why people are still following him.
	AI_Output(self,other, " DIA_Addon_Greg_Story_Raven_01_03 " );	// But he's clearly up to something. He certainly will not sit in a secluded place.
};

instance DIA_Addon_Greg_RavenDead(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_RavenDead_Condition;
	information = DIA_Addon_Greg_RavenDead_Info;
	description = " Raven is finished... " ;
};

func int DIA_Addon_Greg_RavenDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Addon_Greg_RavenDead_15_00 " );	// Raven is done...
	AI_Output(self,other, " DIA_Addon_Greg_RavenDead_01_01 " );	// Fuck me... I didn't expect this... Caught him by surprise, didn't I?
	AI_Output(self,other, " DIA_Addon_Greg_RavenDead_01_02 " );	// Well, it's worth five hundred gold coins in my opinion.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other, " DIA_Addon_Greg_RavenDead_01_03 " );	// And you are brave! Keep up the good work.
};

var int greg_cantradearmor;
var int greg_tradearmor_middle;
var int greg_tradearmor_heavy;

instance DIA_ADDON_GREG_CANTRADEARMOR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 8;
	condition = dia_addon_greg_cantradearmor_condition;
	information = dia_addon_greg_cantradearmor_info;
	permanent = TRUE;
	description = " How about some better armor? " ;
};


func int dia_addon_greg_cantradearmor_condition()
{
	if((GREG_CANTRADEARMOR == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_greg_cantradearmor_info()
{
	AI_Output(other,self, " DIA_Addon_Greg_CanTradeArmor_01_00 " );	// How about better armor?
	AI_Output(self,other, " DIA_Addon_Greg_CanTradeArmor_01_01 " );	// Why don't you like these?
	AI_Output(other,self, " DIA_Addon_Greg_CanTradeArmor_01_02 " );	// These rags didn't protect me very well from razortooth claws when I was in the canyon.
	AI_Output(self,other, " DIA_Addon_Greg_CanTradeArmor_01_03 " );	// You've proven what you're capable of. You will get new armor.
	AI_Output(self,other, " DIA_Addon_Greg_CanTradeArmor_01_04 " );	// Just don't think I'll give them to you for free!
	GREG_CANTRADEARMOR = TRUE;
};


instance DIA_ADDON_GREG_ARMOR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_armor_condition;
	information = dia_addon_greg_armor_info;
	permanent = TRUE;
	description = " I need better mail. " ;
};


func int dia_addon_greg_armor_condition()
{
	if((GREG_CANTRADEARMOR == TRUE) && ((GREG_TRADEARMOR_MIDDLE == FALSE) || (GREG_TRADEARMOR_HEAVY == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_armor_info()
{
	Info_ClearChoices(dia_addon_greg_armor);
	AI_Output(other,self, " DIA_Addon_Greg_Armor_01_00 " );	// I need better mail.
	Info_AddChoice(dia_addon_greg_armor,Dialog_Back,dia_addon_greg_armor_back);
	if(GREG_TRADEARMOR_MIDDLE == FALSE)
	{
		Info_AddChoice(dia_addon_greg_armor, " Pirate Armor (Price: 2000 coins) " ,dia_addon_greg_armor_buy1);
	};
	if((RavenAway == TRUE) && (GREG_TRADEARMOR_HEAVY == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(dia_addon_greg_armor, " Pirate Heavy Armor (Price: 2500 coins) " ,dia_addon_greg_armor_buy2);
	};
};

func void dia_addon_greg_armor_back()
{
	Info_ClearChoices(dia_addon_greg_armor);
};

func void dia_addon_greg_armor_buy1()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_PIR_M_Addon))
	{
		AI_Output(self,other, " DIA_Addon_Greg_Armor_Buy1_01_01 " );	// Great!
		B_GiveInvItems(self,other,ITAR_PIR_M_Addon,1);
		GREG_TRADEARMOR_MIDDLE = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_Armor_Buy1_01_02 " );	// No money - no chain mail.
	};
	Info_ClearChoices(dia_addon_greg_armor);
};

func void dia_addon_greg_armor_buy2()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_PIR_H_Addon))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy2_01_01");	//Отлично!
		B_GiveInvItems(self,other,ITAR_PIR_H_Addon,1);
		GREG_TRADEARMOR_HEAVY = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_Armor_Buy2_01_02 " );	// No money - no chain mail.
	};
	Info_ClearChoices(dia_addon_greg_armor);
};


instance DIA_ADDON_GREG_MISSGRHUSB(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_missgrhusb_condition;
	information = dia_addon_greg_missgrhusb_info;
	permanent = FALSE;
	description = " Do you know a guy named Brandick? " ;
};


func int dia_addon_greg_missgrhusb_condition()
{
	if(MIS_FINDLOSTHUSB == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_missgrhusb_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Greg_MissGrHusb_01_00 " );	// Do you know a guy named Brandick?
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusb_01_01 " );	// Brandy? Of course I do... (grins) Desperate guy, thug!
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusb_01_03 " );	// Everyone on my team is like that - you can be sure of that!
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusb_01_04 " );	// Only now he is not in the camp - he went to the swamps a few weeks ago.
	AI_Output(other,self, " DIA_Addon_Greg_MissGrHusb_01_05 " );	// And how did he even get to you?
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusb_01_08 " );	// A couple of years ago, we somehow boarded a merchant ship.
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusb_01_09 " );	// Well, having gutted their entire hold clean, we already decided to back off - when suddenly some guy asked to join us on the ship.
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusb_01_13 " );	// I just didn't have enough people back then. And in our business, extra hands never hurt.
	AI_Output(other,self, " DIA_Addon_Greg_MissGrHusb_01_20 " );	// Tell me, what is he doing in the swamps?
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusb_01_21 " );	// I sent him there... (grouchily) And since we lost our ship, the guy has somehow turned sour.
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusb_01_22 " );	// And so, now he has a good thing to do - to watch the bandit camp.
	; _ _ _ _ _ _
	Wld_InsertNpc(pir_6145_brendik,"ADW_BRENDIK_01");
};


instance DIA_ADDON_GREG_MISSGRHUSBAFTER(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_missgrhusbafter_condition;
	information = dia_addon_greg_missgrhusbafter_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_greg_missgrhusbafter_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_greg_missgrhusb) && (MEETBRENDIK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_missgrhusbafter_info()
{
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusbAfter_01_00 " );	// Yes, I almost forgot. If you see Brandick, tell him to get back to camp.
	AI_Output(self,other, " DIA_Addon_Greg_MissGrHusbAfter_01_01 " );	// I have one more task for him.
	MEETBRENDIKGREG = TRUE;
};


instance DIA_ADDON_GREG_GATHERARMY(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmy_condition;
	information = dia_addon_greg_gatherarmy_info;
	permanent = FALSE;
	description = " There is one little thing here. " ;
};


func int dia_addon_greg_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmy_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmy_01_02 " );	// The paladins want to free this island from the orcs, and they could use your help to do so!
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_03 " );	// What?! Boy, you must be joking!
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_07 " );	// Why should I help them?
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmy_01_08 " );	// Because sooner or later the orcs will show up here too.
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_09 " );	// Ha! As far as I know, they are still too far from that.
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmy_01_10 " );	// Not too far since they've already captured Khorinis. And they are unlikely to stop there.
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_13 " );	// Hmmm. Then, apparently, the case is really lousy!
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_14 " );	// Eh... Too bad we don't have our ship! Otherwise, we would have moved away from this island long ago.
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmy_01_18 " );	// Let's get down to business. So you agree to help them in the war against the orcs?
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_19 " );	// Hmmm... (thoughtfully) I might agree, but I don't know what the rest of the guys have to say about all this.
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_21 " );	// I can't force them to risk their lives just because the paladins need it.
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_22 " );	// Therefore, they should offer us something that might be of interest to us in turn.
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmy_01_23 " );	// And what do you need?
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_24 " );	// Hmmm, good question... Well, their ship, for example.
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmy_01_25 " );	// Paladin ship?!
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmy_01_29 " );	// I don't think paladins would just agree to give you their ship.
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_30 " );	// Ha! In this case, even if they do not expect any help from us.
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmy_01_31 " );	// This is our condition.
	MIS_PIRATENEEDSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_PIRATENEEDSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_Running);
	) ; _ _ _ _ _
	Log_AddEntry( TOPIC_OR with GREATWAR , " I thought I'd talk to the pirates about joining the paladin army. Let's see what they say. " );
};


var int gregtellstocrew;

instance DIA_ADDON_GREG_GATHERARMYDONE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmydone_condition;
	information = dia_addon_greg_gatherarmydone_info;
	permanent = FALSE;
	description = " I brought back a response from the paladins. " ;
};


func int dia_addon_greg_gatherarmydone_condition()
{
	if((MIS_PIRATENEEDSHIP == LOG_Running) && (HAGENINVITEPIRATES == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmydone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDone_01_00 " );	// I brought a response from the paladins.
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDone_01_01 " );	// Yes? And what did they say?
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDone_01_02 " );	// Lord Hagen agrees to give you his ship, but on the condition that you become paladins!
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDone_01_03 " );	// Hmm... Shall we become paladins?!
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDone_01_04 " );	// But we're pirates! And how did he come up with that idea?
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDone_01_06 " );	// It's just unthinkable - US and go to the service of the paladins!
	Info_ClearChoices(dia_addon_greg_gatherarmydone);

	if(RhetorikSkillValue[1] >= 80)
	{
		Info_AddChoice(dia_addon_greg_gatherarmydone,"Ну и что с того?",dia_addon_greg_gatherarmydone_tell);
	};

	Info_AddChoice(dia_addon_greg_gatherarmydone, " Okay, whatever you say. " ,dia_addon_greg_gatherarmydone_no);
};

func void dia_addon_greg_gatherarmydone_no()
{
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDone_No_01_00 " );	// Okay, whatever you say.
	MIS_PIRATENEEDSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
	PIR_JOINHAGENREFUSE = TRUE;
	ALLFRACTIONS = ALLFRACTIONS - 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
	};
	B_LogEntry( TOPIC_PIRATENEEDSHIP , " Greg turned down Lord Hagen's offer and I didn't try to convince him otherwise. I don't think you can count on help from the pirates now. " );
	AI_StopProcessInfos(self);
};

func void dia_addon_greg_gatherarmydone_tell()
{
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDone_Tell_01_00 " );	// So what?
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDone_Tell_01_01 " );	// Like what? Not even the least idiot would agree to such conditions!
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDone_Tell_01_04 " );	// Think - you will have a new ship!
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDone_Tell_01_06 " );	// And then, all your team will be forgiven for old crimes.
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDone_Tell_01_07 " );	// Or maybe you'd rather be hanged?
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDone_Tell_01_16 " );	// Okay...(sullenly) You've convinced me! But that alone doesn't mean anything.
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDone_Tell_01_17 " );	// First, I need to confer with the team. And only then we will decide whether it suits us or not!
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDone_Tell_01_18 " );	// And when will you give an answer?
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDone_Tell_01_19 " );	// It'll be better if we talk about it tomorrow.
	GREGFLAGCONTI = TRUE;
	GREGTELLSTOCREW = Wld_GetDay();
	B_LogEntry( TOPIC_PIRATENEEDSHIP , " I managed to convince Greg to accept Lord Hagen's terms. Now we have to wait and see what the rest of his crew say. " );
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_GATHERARMYDONEEXTR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmydoneextr_condition;
	information = dia_addon_greg_gatherarmydoneextr_info;
	permanent = FALSE;
	description = " So what did you decide? " ;
};


func int dia_addon_greg_gatherarmydoneextr_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_PIRATENEEDSHIP == LOG_Running) && (GREGFLAGCONTI == TRUE) && (GREGTELLSTOCREW < daynow))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmydoneextr_info()
{
	var int countpir;
	var int overallpir;
	AI_Output(other,self, " DIA_Addon_Greg_GatherArmyDoneExtr_01_00 " );	// So what did you decide?
	AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDoneExtr_01_01 " );	// Well... (thoughtfully) Anyway, I've been talking to all my guys here...
	countpir = 15;
	overallpir = 50;

	if(MIS_AlligatorJack_BringMeat == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Addon_Bill_SearchAngusMurder == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_ADDON_GARett_BringKompass == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Owen_FindMalcom == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(RavenAway == TRUE)
	{
		countpir = countpir + 5;
	};
	if(countpir >= overallpir)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDoneExtr_01_02 " );	// ... and we decided to accept the paladins' offer.
		AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDoneExtr_01_04 " );	// And hopefully we won't regret our decision!
		PIR_JOINHAGEN = TRUE;
		MIS_PIRATENEEDSHIP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
		B_LogEntry( TOPIC_PIRATENEEDSHIP , " Greg and his people accepted Lord Hagen's offer. " );
		B_LogEntry_Quiet( TOPIC_OR with GREATWAR , " We must inform Lord Hagen that the pirates will now fight for the paladins. " );
	}
	else
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDoneExtr_01_06 " );	// ... and we've decided to drop the paladin offer.
		AI_Output(self,other, " DIA_Addon_Greg_GatherArmyDoneExtr_01_07 " );	// This is not for us! We'd rather be on our own somehow than under the heel of these blockheads.
		MIS_PIRATENEEDSHIP = LOG_SUCCESS;
		PIR_JOINHAGENREFUSE = TRUE;
		ALLFRACTIONS = ALLFRACTIONS - 1;
		Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
		if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
		{
			PREGATHERALLONBIGFARM = TRUE;
		};
		B_LogEntry( TOPIC_PIRATENEEDSHIP , " Greg and his men refused Lord Hagen's offer. " );
		B_LogEntry_Quiet( TOPIC_OR with GREATWAR , " I don't think Lord Hagen should be helped by pirates now. " );
		AI_StopProcessInfos(self);
	};
};

instance DIA_ADDON_GREG_DOOMRING(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_DOOMRING_condition;
	information = dia_addon_greg_DOOMRING_info;
	permanent = FALSE;
	description = " I have something to do with you. " ;
};

func int dia_addon_greg_DOOMRING_condition()
{
	if(MIS_PirateRing == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_DOOMRING_info()
{
	AI_Output(other,self, " DIA_Addon_Greg_DOOMRING_01_00 " );	// I have business with you.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_01 " );	// Well, lay it out then, don't delay!
	AI_Output(other,self, " DIA_Addon_Greg_DOOMRING_01_02 " );	// Someone found out that you have one very unusual ring.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_03 " );	// (grimly) Maybe there is. So what?
	AI_Output(other,self, " DIA_Addon_Greg_DOOMRING_01_04 " );	// A powerful magician would like to have it for himself, and asked me to negotiate a price with you.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_06 " );	// (thoughtfully) Mage, you say? This might work.
	AI_Output(other,self, " DIA_Addon_Greg_DOOMRING_01_07 " );	// What do you mean?
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_08 " );	// Boy, I'd be happy to give you this ring. Yes, but I can't!
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_09 " );	// Looks like some kind of dark curse hangs on it. Beliar take it!
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_10 " );	// And if I give him to you, then I'm afraid that soon I myself will go into his arms.
	AI_Output(other,self, " DIA_Addon_Greg_DOOMRING_01_11 " );	// How did it happen?
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_12 " );	// Yes, it was... (scratching the back of his head)
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_13 " );	// In general, once we managed to plunder a very rich caravan of merchant ships, going, apparently, to Bakaresh.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_14");	//Бакареш?
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_15 " );	// This is one of the major cities of the assassins, which is located in the east of Varant.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_16 " );	// So, among other prey, one ring caught my attention. Outwardly inconspicuous, but possessing some special attractive force.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_17 " );	// Without thinking twice, I decided to keep the ring for myself.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_18 " );	// At first, everything turned out in such a way that it is impossible to imagine better.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_19 " );	// Our raids on trade caravans and ships were extremely successful! We always returned with a very rich booty.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_20 " );	// But one day the guys and I decided to hide most of our treasures.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_21 " );	// We went to the old grotto, southeast of here.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_22 " );	// Having buried all the gold, we were about to go back to the camp, when suddenly things began to happen that were absolutely incomprehensible to me.
	AI_Output(other,self, " DIA_Addon_Greg_DOOMRING_01_23 " );	// What happened?
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_24 " );	// Drake and a few other people on my team seem to be insane.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_25 " );	// They pounced on me and the rest of the guys, as if they were possessed by Beliar himself!
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_26 " );	// Only I managed to get out of that cave alive.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_27 " );	// A few days later, I sent several people there to reconnoiter, but they never returned.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_28 " );	// That's when it became clear to me that I would never see my gold again. For real evil has settled in that grotto!
	AI_Output(other,self, " DIA_Addon_Greg_DOOMRING_01_29 " );	// Yes, the story is not funny.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_30 " );	// But it's not over yet, buddy... (grimly) Those were just flowers compared to what was to come!
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_32 " );	// You'll laugh, but it looks like luck itself has turned its back on us.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_33 " );	// In all our undertakings and plans, one disappointment awaited us!
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_34 " );	// Then the captured merchant sailed without cargo...
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_35 " );	// ...then the cargo turned out to be such that its value would not even be enough to cover our costs.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_36 " );	// And the last time we lost our ship at all, we stumbled upon a paladin's galley in the sea! Beliar would take her...
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_37 " );	// (nervously) But the worst thing is that the ghosts of those who stayed in this cave began to come to me at night!
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_38 " );	// These nightmares have plagued me for a very long time. But every day they become more and more terrible and painful.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_39 " );	// It was then that it dawned on me that the whole thing was in this ring.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_40 " );	// It obviously wasn't easy! And I tried to get rid of it.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_41 " );	// But as soon as I tried to take it off my finger, I was twisted so that...
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_42 " );	// ...well, I put it back on and haven't taken it off since then.
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_43 " );	// Now you understand that I can’t part with him in any way?
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_44 " );	// Now, if this magician of yours would think a little and think about how to remove this curse from me...
	AI_Output(self,other, " DIA_Addon_Greg_DOOMRING_01_45 " );	// I'd give him this ring for free! Are you savvy?
	AI_Output(other,self, " DIA_Addon_Greg_DOOMRING_01_46 " );	// Okay, I'll try asking him about it.
	B_LogEntry(TOPIC_PirateRing, " It turned out to be not so simple. It seems that the ring that Xardas was looking for, according to its last owner, Captain Greg, is cursed with dark magic! The power of this curse killed many of his people and deprived his entire team of luck. In addition he can't just take off this ring, otherwise the curse will kill him too. We need to talk to Xardas about this. " );
	GregCurse = TRUE;
};

instance DIA_ADDON_GREG_DRAKE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_DRAKE_condition;
	information = dia_addon_greg_DRAKE_info;
	permanent = FALSE;
	description = " Who is this Drake? " ;
};

func int dia_addon_greg_DRAKE_condition()
{
	if((MIS_PirateRing == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Greg_DOOMRING)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_DRAKE_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Greg_DRAKE_01_01 " );	// And who is this Drake?
	AI_Output(self,other, " DIA_Addon_Greg_DRAKE_01_02 " );	// One of the captains who sailed under me. He was once my best friend.
	AI_Output(other,self, " DIA_Addon_Greg_DRAKE_01_03 " );	// Tell us a little about him.
	AI_Output(self,other, " DIA_Addon_Greg_DRAKE_01_04 " );	// What can I say, buddy! He was a very reliable person. I could rely on him as on myself.
	AI_Output(self,other, " DIA_Addon_Greg_DRAKE_01_05 " );	// Once he even saved my life... And suddenly - this!
	B_LogEntry(TOPIC_PirateRing, " At night, Greg has nightmares and the ghosts of those who were once killed by the curse of the ring come. Among these ghosts is one of his old friends - Captain Drake. It was from him that strange things began to happen. " );
};

instance DIA_ADDON_GREG_NOMORECURSE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_NOMORECURSE_condition;
	information = dia_addon_greg_NOMORECURSE_info;
	permanent = FALSE;
	description = " Try to take off your ring. " ;
};

func int dia_addon_greg_COURSE_NUMBER_condition() .
{
	if ((MIS_PirateRing == LOG_Running) && (XarCurseClear ==  TRUE ) && (Npc_IsDead(Skeleton_Captain_Drake) ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_addon_greg_NOMORECURSE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Greg_NOMORECURSE_01_01 " );	// Try to take off your ring.
	AI_Output(self,other, " DIA_Addon_Greg_NOMORECURSE_01_02 " );	// WHAT?! I won't do it boy!
	AI_Output(other,self, " DIA_Addon_Greg_NOMORECURSE_01_03 " );	// Take off your ring now! Unless, of course, you want to get rid of your curse.
	AI_Output(self,other, " DIA_Addon_Greg_NOMORECURSE_01_04 " );	// Well, look, buddy... (terribly) If I suddenly go to the next world, you will no longer have peace in this life.
	AI_Output(other,self, " DIA_Addon_Greg_NOMORECURSE_01_05 " );	// Shoot already.
	AI_Output(self,other, " DIA_Addon_Greg_NOMORECURSE_01_06 " );	// (removes the ring)
	AI_Output(other,self, " DIA_Addon_Greg_NOMORECURSE_01_07 " );	// So how do you feel?
	AI_Output(self,other, " DIA_Addon_Greg_NOMORECURSE_01_08 " );	// (surprised) You know, looks like you were right! It was like a stone fell from my soul.
	AI_Output(other,self, " DIA_Addon_Greg_NOMORECURSE_01_09 " );	// You see, you were afraid.
	AI_Output(self,other, " DIA_Addon_Greg_NOMORECURSE_01_10 " );	// (grouchily) I would look at you if you were in my place.
	AI_Output(other,self, " DIA_Addon_Greg_NOMORECURSE_01_11 " );	// Okay, give me the ring.
	AI_Output(self,other, " DIA_Addon_Greg_NOMORECURSE_01_12 " );	// Here - take this damn trinket! I don't want to see her anymore!
	B_GiveInvItems(self,other,ItRi_DarkCurse,1);
	AI_Output(other,self, " DIA_Addon_Greg_NOMORECURSE_01_13 " );	// Thank you.
	GregCanPray = TRUE;
	B_LogEntry(TOPIC_PirateRing, " As Xardas said, the curse was lifted, and Greg, though not without my help, was able to remove the cursed ring. Now we need to take it back to the old man. Let him be a little happy. " );
};

instance DIA_ADDON_GREG_PiratePray_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_PiratePray_Done_condition;
	information = dia_addon_greg_PiratePray_Done_info;
	permanent = FALSE;
	description = " About your prayer request... " ;
};

func int dia_addon_greg_PiratePray_Done_condition()
{
	if((MIS_PiratePray == LOG_Success) || (PyrNotAgreePray == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PiratePray_Done_info()
{
	AI_Output(other,self, " DIA_Addon_Greg_PiratePray_Done_01_00 " );	// About your prayer request...
	AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_01 " );	// So you managed to negotiate with the mages?

	if(MIS_PiratePray == LOG_Success)
	{
		AI_Output(other,self, " DIA_Addon_Greg_PiratePray_Done_01_02 " );	// Yes, they will pray for you and your people.
		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_03 " );	// (pretty) Great, mate. I'm sure this news will cheer up the guys a little!
		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_04 " );	// And those magicians must have shaken you a lot of gold for this, right?
		AI_Output(other,self, " DIA_Addon_Greg_PiratePray_Done_01_05 " );	// I can't say forgiveness was too cheap for you.
		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_06 " );	// Okay, what's there! I know these moneybags as well as you.
		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_07 " );	// Take this as a reward for your efforts.

		if(GregBonusPray == 1)
		{
			B_GivePlayerXP(100);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		}
		else if(GregBonusPray == 2)
		{
			B_GivePlayerXP(200);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ITMI_QUICKSILVER,1);
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		}
		else if(GregBonusPray == 3)
		{
			B_GivePlayerXP(300);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ITMI_QUICKSILVER,1);
			CreateInvItems(other,ItFo_Addon_SchnellerHering, 3 );
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		};

		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_08 " );	// Although not gold, they are quite valuable items.
		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_09 " );	// You will surely find a use for them. (laughs)
	}
	else
	{
		B_GivePlayerXP(150);
		AI_Output(other,self, " DIA_Addon_Greg_PiratePray_Done_01_11 " );	// Unfortunately not.
		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_12 " );	// Beliar would take them! Anyway. Innos witness - I wanted to change my life.
		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_13 " );	// But, you see, it's not fate. So you have to keep being the bad guy!
		AI_Output(self,other, " DIA_Addon_Greg_PiratePray_Done_01_14 " );	// Rob, kill, sink ships... Not life, but a fairy tale! (laughs)
		MIS_PiratePray = LOG_Success;
		Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	};
};

var int PirateDealDay;
var int PirateDealFlag;
var int PirateDealCost;

instance DIA_ADDON_GREG_PirateDeal(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_condition;
	information = dia_addon_greg_PirateDeal_info;
	permanent = FALSE;
	description = " There's one thing for you here. " ;
};

func int dia_addon_greg_PirateDeal_condition()
{
	if(MIS_PirateDeal == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_00 " );	// There's one thing for you here.
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_01_01 " );	// Hmmm... (squinting) Well, lay it out then.
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_02 " );	// I brought an offer from the Waterbenders.
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_01_03 " );	// Water Mages?!
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_04 " );	// It is necessary to provide their mission with everything necessary - food, supplies and weapons.
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_05 " );	// And it seems to me that you can do it quite well. I'm right?
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_01_06 " );	// I wonder why all of a sudden magicians decided to hang out with the dregs of society like us?
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_07 " );	// This part of the island is just you and the Raven bandits.
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_08 " );	// And they are unlikely to even hear about it. So it's just you pirates left.
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_01_09 " );	// Logic! OK then. Let's say we agree.
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_01_10 " );	// But what do we benefit from all this?
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_11 " );	// You tell me. Under what conditions do you agree to provide magicians with everything necessary?
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_01_12 " );	// Hmmm... (thoughtfully) You need to think carefully here.
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_13 " );	// And how long will it take?
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_01_14 " );	// Come tomorrow. I'll think it over, talk to the guys. And then it will be seen.
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_01_15 " );	// Agreed.
	PirateDealDay = Wld_GetDay();
	PirateDealFlag = TRUE;
	B_LogEntry_Quiet(TOPIC_PirateDeal, " Greg needs to think about the proposal of the Waterbenders. Tomorrow he will be ready to put forward his proposals. " );
};

instance DIA_ADDON_GREG_PirateDeal_Choice(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_Choice_condition;
	information = dia_addon_greg_PirateDeal_Choice_info;
	permanent = FALSE;
	description = " So what did you decide? " ;
};

func int dia_addon_greg_PirateDeal_Choice_condition()
{
	be int Daynow;

	Daynow = Wld_GetDay();

	if((MIS_PirateDeal == LOG_Running) && (PirateDealFlag == TRUE) && (PirateDealDay <= (Daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_Choice_info()
{
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_Choice_01_00 " );	// So what did you decide?
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_Choice_01_01 " );	// (sarcastically) Well, the guys and I thought about it and decided that for a start you will pay us...
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_Choice_01_02 " );	// ...let's say five thousand gold pieces. Only then will we be ready to help the Waterbenders with provisions and supplies.
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_Choice_01_03 " );	// Five thousand?! Yes, you're crazy.
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_Choice_01_04 " );	// Those are our terms, mate! Otherwise, we are not interested in their offer.
	PirateDealCost = 5000;
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);

	if(RhetorikSkillValue[1] >= 45)
	{
		Info_AddChoice(DIA_Addon_Greg_PirateDeal_Choice, " Shall we agree on half that amount? " ,DIA_Addon_Greg_PirateDeal_Choice_Cheap);
	};

	Info_AddChoice(DIA_Addon_Greg_PirateDeal_Choice, " Can we at least bargain? " ,DIA_Addon_Greg_PirateDeal_Choice_Yes);
};

func void DIA_Addon_Greg_PirateDeal_Choice_Cheap()
{
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_00 " );	// Maybe we can start with half of this amount? Who knows how things will go there.
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_02 " );	// Okay. You can give me some of the money now.
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_03 " );	// But don't think I'll forget about the rest.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	PirateDealCost = 2500;
	B_LogEntry_Quiet(TOPIC_PirateDeal, " Greg has made his demands. He needs five thousand gold! Then he's ready to start trading with Waterbenders. What a greedy bastard. However, I managed to agree that now I'll give him only half, and bring the rest later. " );
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);
};

func void DIA_Addon_Greg_PirateDeal_Choice_Yes()
{
	AI_Output(other,self, " DIA_Addon_Greg_PirateDeal_Choice_Yes_01_00 " );	// Maybe we can at least bargain?
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_Choice_Yes_01_01 " );	// No, no bargaining here, boy.
	AI_Output(self,other, " DIA_Addon_Greg_PirateDeal_Choice_Yes_01_02 " );	// So lay out five thousand or get lost to Beliar!
	B_LogEntry_Quiet(TOPIC_PirateDeal, " Greg has made his demands. He needs five thousand gold! Then he's ready to start trading with the Waterbenders. That greedy bastard... " );
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);
};

instance DIA_ADDON_GREG_PirateDeal_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_Done_condition;
	information = dia_addon_greg_PirateDeal_Done_info;
	permanent = TRUE;
	description = "Вот твои деньги.";
};

func int dia_addon_greg_PirateDeal_Done_condition()
{
	if((MIS_PirateDeal == LOG_Running) && (PirateDealCost > 0) && (PirateDealOk == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_Done_info()
{
	var int Xp_Temp;

	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Done_01_00");	//Вот твои деньги.

	if(Npc_HasItems(hero,ItMi_Gold) >= PirateDealCost)
	{
		Xp_Temp = 100 -(PirateDealCost / 100);
		Xp_Temp = Xp_Temp * 10;
		B_GivePlayerXP(Xp_Temp);
		B_GiveInvItems(other,self,ItMi_Gold,PirateDealCost);
		Npc_RemoveInvItems(self,ItMi_Gold,PirateDealCost);
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_01");	//(жадно) Отлично! Можешь передать своим магам, что мы согласны снабжать их всем необходимым.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_02");	//Теперь осталось только уладить вопрос с количеством и содержимым этих поставок.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_03");	//Пусть они пришлют к нам кого-нибудь из своих людей. Не самому же мне к ним идти!
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_04");	//А там я уже сам обо всем договорюсь.
		PirateDealOk = TRUE;
		B_LogEntry(TOPIC_PirateDeal,"Я договорился с пиратами о поставках продовольствия магам Воды.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_06");	//(ухмыляясь) Правда? И где они? Я что-то не вижу тут той суммы, о которой мы договаривались.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_08");	//Смотри! Я не позволю делать из себя дурака.
	};
};

instance DIA_Addon_Greg_FoundTreasure(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_FoundTreasure_Condition;
	information = DIA_Addon_Greg_FoundTreasure_Info;
	permanent = TRUE;
	description = "Я нашел все закопанные вещи.";
};

func int DIA_Addon_Greg_FoundTreasure_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_FoundTreasure_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Я нашел все закопанные вещи.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Тогда у тебя должно быть около ста золотых, золотая чаша, серебряное блюдо и амулет! Давай их сюда.
	Info_ClearChoices(DIA_Addon_Greg_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_FoundTreasure,"У меня с собой их нет.",DIA_Addon_Greg_FoundTreasure_not);

	if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_CupGold) && Npc_HasItems(other,ItMi_SilverChalice) && Npc_HasItems(other,ItAm_Prot_Point_01))
	{
		Info_AddChoice(DIA_Addon_Greg_FoundTreasure,"Вот твои вещи.",DIA_Addon_Greg_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_FoundTreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Вот твои вещи.

	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_01 " );	// Wallet.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_02 " );	// One hundred gold.
	};
	if(B_GiveInvItems(other,self,ItMi_CupGold,1))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_03 " );	// Golden bowl.
	};
	if(B_GiveInvItems(other,self,ItMi_SilverChalice,1))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_04 " );	// Silver bowl.
	};
	if(B_GiveInvItems(other,self,ItAm_Prot_Point_01,1))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_05 " );	// And an amulet.
	};
	AI_Output(self,other, " DIA_Addon_Greg_NW_FoundTreasure_ja_01_06 " );	// Very good! I see you were smart enough not to take my stuff.
	AI_Output(self,other, " DIA_Addon_Greg_NW_FoundTreasure_ja_01_07 " );	// Here's your share.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_FoundTreasure);
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_FoundTreasure_not()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_not_15_00 " );	// I don't have them with me.
	AI_Output(self,other, " DIA_Addon_Greg_NW_FoundTreasure_not_01_01 " );	// Then hurry up and bring them to me before I get angry.
	AI_StopProcessInfos(self);
};

// -----------------------Dracia----------------------- ------------------------------

var int GregCanTalkAboutElsa;

instance DIA_Addon_Greg_TalkAboutElza ( C_Info );
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Info;
	permanent = TRUE;
	description = " Where do you sell all your goods? " ;
};

func int DIA_Addon_Greg_TalkAboutElza_Condition();
{
	if((GregIsBack == TRUE) && (GregCanTalkAboutElsa == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_01_00 " );	// Where do you sell all your goods?

	if(RavenAway == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_01 " );	// none of your business!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_02 " );	// Hmmm... Why are you suddenly interested in this?
		AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_01_03 " );	// I was just wondering where you're going with all this.
		AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_01_04 " );	// For sure, before the paladins sank your ship, you looted a lot of good!
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_05 " );	// Yeah, you can't deny your logic, mate.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_06 " );	// Naturally, our craft wouldn't be worth a penny if we couldn't sell all of our catch for a good price.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_07 " );	// We took a small part of the loot to Khorinis to those merchants who did not shy away from doing business with us. And believe me, there were quite a few of them.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_08 " );	// But, unfortunately, it's too dangerous there now. And it's all the fault of these damned paladins who recently arrived in the city.
		AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_01_09 " );	// What about the rest?
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_10 " );	// We took the rest to Drakia. The local merchants with great pleasure paid us hard cash for any goods.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_11 " );	// And without any risk to life! For their local baron only verbally obeys royal decrees.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_12 " );	// But in fact, the same robber and pirate as we are.
		AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_01_13 " );	// Drakia?! What kind of place is it?
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_14 " );	// Are you saying you've never heard of her?!
		AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_01_15 " );	// No, I didn't. But I'd love to hear it.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_16 " );	// Drakia is the western province of the island of Khorinis and a city in it with the same name. The truth is not as big as Khorinis himself.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_17 " );	// As far as I know, Baron Lockhart was in charge there until recently.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_18 " );	// Although Drakia is part of the kingdom of Myrtana, but in fact it is ruled only by the baron himself. This is entirely his land.
		AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_01_19 " );	// And he doesn't care if you're a pirate or not. The main thing is to have gold in your pockets.
		AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_01_20 " );	// Hmmm... Not bad.
		GregCanTalkAboutElsa = TRUE;
	};
};

instance DIA_Addon_Greg_TalkAboutElza_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Done_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Done_Info;
	permanent = FALSE;
	description = " How can I get to this Drakia? " ;
};

func int DIA_Addon_Greg_TalkAboutElza_Done_Condition();
{
	if ((Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) ==  TRUE ) && (GregCanTalkAboutElsa ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Done_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_Done_01_00 " );	// And how can you get into this Drakia?
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Done_01_01 " );	// By sea only. Moreover, you will have to swim around the entire island, through the north.
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Done_01_02");	//Почему?
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Done_01_03 " );	// There are too many rocks in the south and you can easily run into an underwater reef without knowing the correct fairway.
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_Done_01_04 " );	// But you probably know him.
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Done_01_05 " );	// I know, just useless. The ship is still missing! And on a simple boat, you still can’t get there.
};

instance DIA_Addon_Greg_TalkAboutElza_Ship(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Ship_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Ship_Info;
	permanent = FALSE;
	description = " I saw a ship nearby. " ;
};

func int DIA_Addon_Greg_TalkAboutElza_Ship_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Addon_Greg_TalkAboutElza_Done) ==  TRUE ) && (ViewElza ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Ship_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_Ship_01_00 " );	// I saw a ship nearby.
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_01 " );	// What?! Enough of these jokes...
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_Ship_01_02 " );	// I'm serious! He is standing behind those rocks, not far from your camp.
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_03 " );	// Ahhh... (grinning) I think I understand what you're talking about. You probably mean 'One-Eyed Elsa'.
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_Ship_01_04 " );	// 'One-eyed Elsa'?
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_05 " );	// Yes, our old galleon. But we haven't been sailing on it for a long time.
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_Ship_01_06 " );	// What's wrong with him?
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_07 " );	// All is well with him, except for the fact that he has a broken steering wheel, a hole in his left side, and he barely keeps afloat.
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_Ship_01_08 " );	// Then why don't you fix it?
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_09 " );	// Tried already, didn't work. This requires a good carpenter, and we never had such a thing.
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_10 " );	// But it's better to ask Skip about it. He was the one who took care of her.
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_11 " );	// The guy went out of his way to make sure that 'Elsa' could swim again. But in the end, too, reconciled.
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_12 " );	// As they say, the old woman has outlived her...
	AI_Output(other,self, " DIA_Addon_Greg_TalkAboutElza_Ship_01_13 " );	// And why such zeal?
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_14 " );	// I don't know. It seems that this ship meant more to him than just a pile of planks.
	AI_Output(self,other, " DIA_Addon_Greg_TalkAboutElza_Ship_01_15 " );	// But you'd better ask him yourself.
	MIS_OldElza = LOG_Running;
	Log_CreateTopic(TOPIC_OldElza,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OldElza,LOG_Running);
	B_LogEntry(TOPIC_OldElza, " I asked Greg about the ship in the bay near the camp. He laughed and said that it was their old galleon - 'One-Eyed Elza', on which they had not sailed for a long time. The ship had a broken rudder, a hole in The pirates tried to fix it, but without a good carpenter, they could not do it. Skip especially tried to do this. It seems that this corral meant much more to him than anything else. " );
};

instance DIA_Addon_Greg_OldRumors(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_OldRumors_Condition;
	information = DIA_Addon_Greg_OldRumors_Info;
	permanent = FALSE;
	description = " I'm talking about Loa. " ;
};

func int DIA_Addon_Greg_OldRumors_Condition()
{
	if(MIS_OldRumors == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_OldRumors_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_01_00 " );	// I'm talking about Loa.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_01 " );	// What other loa?...(annoyed)
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_01_02 " );	// Well, the girl who came to you with a small request - take her with you to Drakia.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_03 " );	// With a request?! Beliar would take her! Yes, she burst into my hut like a rabid she-wolf!
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_04 " );	// She started yelling at me and threatening that if I didn't put her on this ship, she would make me a living hell here in the camp.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_05 " );	// Of course, I understand everything that the character of women is far from easy. One Abigail is worth something!
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_06 " );	// But talking to me like that, to Greg, to the pirate captain, and even more so to threaten me in my own house... No, buddy, that's too much!
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_07 " );	// Well, I put her out the door without any talk, saying that a woman on a ship is in trouble.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_08 " );	// You must understand that it is very important to me that 'Elsa' makes it to the shores of Drakia safe and sound.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_09 " );	// And this devil with her manners can arrange for me on board who knows what.
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_01_10 " );	// Hush, hush... Calm down! She was obviously just very nervous. As are you.
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_01_11 " );	// I can vouch for the fact that there was nothing bad in her thoughts.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_12 " );	// Words alone are not enough! I'm used to believing only deeds. And what I saw in me does not inspire any confidence.
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_01_13 " );	// I can only tell you one thing - she must go to Drakia! Otherwise, she really will blow this whole camp into small pieces.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_14 " );	// Hmmm... Okay, let's do this. Pay me half the cost of my goods and you can put her on board.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_15 " );	// Otherwise, her feet will not be on the deck of 'Elsa'.
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_01_16 " );	// And what amount are we talking about?
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_17 " );	// We can fetch at least twenty thousand for him in Drachia, by my calculations. Here also consider.
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_01_18 " );	// So you want to get at least ten thousand coins. Isn't it too expensive for such a service?
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_01_19 " );	// Understand, I have to secure my goods. And whether you agree with this or not is your own business.
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_01_20 " );	// Okay, I'll think about your suggestion.
	B_LogEntry(TOPIC_OldRumors, " Greg is willing to take Loa on the ship, but only if I cover half the cost of his goods, which he will take to Drachia. " );
};

instance DIA_Addon_Greg_OldRumors_Agreed(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_OldRumors_Agreed_Condition;
	information = DIA_Addon_Greg_OldRumors_Agreed_Info;
	permanent = FALSE;
	description = " Here's your money. " ;
};

func int DIA_Addon_Greg_OldRumors_Agreed_Condition()
{
	if((MIS_OldRumors == LOG_Running) && (Npc_KnowsInfo(other,DIA_Addon_Greg_OldRumors) == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_OldRumors_Agreed_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_Agreed_01_00 " );	// Here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,10000);
	Npc_RemoveInvItems(self,ItMi_Gold,10000);
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_Agreed_01_01 " );	// Nice doing business with you.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_Agreed_01_02 " );	// Naturally, now you can tell your girlfriend that we will take her with us to Drakia.
	AI_Output(other,self, " DIA_Addon_Greg_OldRumors_Agreed_01_03 " );	// Just try not to.
	AI_Output(self,other, " DIA_Addon_Greg_OldRumors_Agreed_01_04 " );	// Don't worry! I always keep my word.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_Agreed_01_05");	//Надеюсь.
	MIS_OldRumors = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OldRumors,LOG_SUCCESS);
	B_LogEntry(TOPIC_OldRumors, " I gave the money to Greg. Now Loa can safely board the Elsa. " );
};
