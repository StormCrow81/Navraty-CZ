

instance DIA_Jack_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_PICKPOCKET(C_Info)
{
	npc = VLK_444_Jack;
	nr = 900;
	condition = DIA_Jack_PICKPOCKET_Condition;
	information = DIA_Jack_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jack_PICKPOCKET_Condition()
{
	return  C_Robbery ( 50 , 100 );
};

func void DIA_Jack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
	Info_AddChoice(DIA_Jack_PICKPOCKET,Dialog_Back,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jack_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};

func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};


instance DIA_Jack_GREET(C_Info)
{
	npc = VLK_444_Jack;
	nr = 4;
	condition = DIA_Jack_GREET_Condition;
	information = DIA_Jack_GREET_Info;
	important = TRUE;
};


func int DIA_Jack_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jack_GREET_Info()
{
	AI_Output(self,other, " DIA_Jack_GREET_14_00 " );	// Hello land rat! Looks like you're broke now.
	AI_Output(self,other, " DIA_Jack_GREET_14_01 " );	// Your gills are kind of pale.
	AI_Output(self,other, " DIA_Jack_GREET_14_02 " );	// Never mind, boy. All you need is a strong sea breeze.
};


instance DIA_Jack_Job(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_Job_Condition;
	information = DIA_Jack_Job_Info;
	description = " What are you doing here? " ;
};


func int DIA_Jack_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_GREET) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_Job_Info()
{
	AI_Output(other,self, " DIA_Jack_Job_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Jack_Job_14_01 " );	// When I was still a young man, I went to travel the seas, and survived many strong storms.
	AI_Output(self,other, " DIA_Jack_Job_14_02 " );	// But many years ago I settled here, and since then I have worked as a lighthouse keeper of Khorinis.
	AI_Output(self,other, " DIA_Jack_Job_14_03 " );	// There is nothing complicated about this. At all. But this old lighthouse has become my home.
	AI_Output(self,other, " DIA_Jack_Job_14_04 " );	// But I haven't been in it for so long.
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Почему?
	AI_Output(self,other, " DIA_Jack_Job_14_06 " );	// Since those bastards took over my lighthouse, I dare not come closer than twenty feet to it. These are very bad people.
	AI_Output(self,other, " DIA_Jack_Job_14_07 " );	// They're outlaws from the Valley of Mines, you know?
	AI_Output(self,other, " DIA_Jack_Job_14_08 " );	// There was a deafening explosion on the other side of the mountains, and then they swooped down on this land like flies on shit. Now they're hiding all over the place - even on my lighthouse.
	AI_Output(self,other, " DIA_Jack_Job_14_09 " );	// I think they're waiting for a ship they can take.
	AI_Output(self,other, " DIA_Jack_Job_14_10 " );	// Ha! Let them swim where they want. Then at least they'll get off my lighthouse!
	Log_CreateTopic(TOPIC_KillLighthouseBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits,LOG_Running);
	B_LogEntry(TOPIC_KillLighthouseBandits, " Old Sea Dog Jack can't get back to his lighthouse because there are bandits in it. " );
	MIS_Jack_KillLighthouseBandits = LOG_Running;
};

instance DIA_Jack_HauntedLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_HauntedLH_Condition;
	information = DIA_Jack_HauntedLH_Info;
	description = " You mean the lighthouse in the sea? " ;
};

func int DIA_Jack_HauntedLH_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Jack_Job) == TRUE) && (Kapitel <= 4))
	{
		return TRUE;
	};
};

func void DIA_Jack_HauntedLH_Info()
{
	AI_Output(other,self, " DIA_Jack_HauntedLH_01_00 " );	// You mean that lighthouse that is located in the sea near the island?
	AI_Output(self,other, " DIA_Jack_HauntedLH_01_01 " );	// No, I'm talking about what is on land, on a high slope near the city.
	AI_Output(self,other, " DIA_Jack_HauntedLH_01_02 " );	// And the one in the sea is an old lighthouse. Nobody has been using it for a long time.
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_03");	//Почему?
	AI_Output(self,other, " DIA_Jack_HauntedLH_01_04 " );	// Umm... People are afraid to go there. They say there are ghosts there.
	AI_Output(other,self, " DIA_Jack_HauntedLH_01_05 " );	// Are you serious?
	AI_Output(self,other, " DIA_Jack_HauntedLH_01_06 " );	// I tell it like it is! I saw one ghost myself. A long time ago, really. About ten years ago.
	AI_Output(other,self, " DIA_Jack_HauntedLH_01_07 " );	// Interesting. Why are there ghosts on the lighthouse?
   	AI_Output(self,other, " DIA_Jack_HauntedLH_01_08 " );	// I don't know exactly what happened there. But people say that lighthouse is cursed. And for what and why - no one knows.
	MIS_HauntedLighthouse = LOG_Running;
	Log_CreateTopic(TOPIC_HauntedLighthouse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Running);
	B_LogEntry(TOPIC_HauntedLighthouse, " According to Jack, the old lighthouse in the middle of the sea off the coast of Khorinis is haunted. " );
};

instance DIA_Jack_City(C_Info)
{
	npc = VLK_444_Jack;
	nr = 6;
	condition = DIA_Jack_City_Condition;
	information = DIA_Jack_City_Info;
	description = " Do you often visit the city? " ;
};


func int DIA_Jack_City_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_Job) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_City_Info()
{
	AI_Output(other,self, " DIA_Jack_City_15_00 " );	// Do you often visit the city?
	AI_Output(self,other, " DIA_Jack_City_14_01 " );	// I always say: a city is only as good as its port.
	AI_Output(self,other, " DIA_Jack_City_14_02 " );	// The port is the gateway to the world. This is where everyone meets and everything starts here.
	AI_Output(self,other, " DIA_Jack_City_14_03 " );	// And when desolation reigns in the port, the same fate inevitably awaits the city.
};


instance DIA_Jack_Harbor(C_Info)
{
	npc = VLK_444_Jack;
	nr = 70;
	condition = DIA_Jack_Harbor_Condition;
	information = DIA_Jack_Harbor_Info;
	permanent = TRUE;
	description = " Tell me about this port. " ;
};


func int DIA_Jack_Harbor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_City) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_Harbor_Info()
{
	AI_Output(other,self, " DIA_Jack_Harbor_15_00 " );	// Tell me about this port.
	AI_Output(self,other, " DIA_Jack_Harbor_14_01 " );	// The port of Khorinis is not what it used to be.
	AI_Output(self,other, " DIA_Jack_Harbor_14_02 " );	// There's no one left here but the loitering rabble. Ships no longer come here and trade has fallen into decline! This port seems to be coming to an end soon.
	Info_ClearChoices(DIA_Jack_Harbor);
	Info_AddChoice(DIA_Jack_Harbor,Dialog_Back,DIA_Jack_Harbor_Back);
	Info_AddChoice(DIA_Jack_Harbor, " Why don't ships come here anymore? " ,DIA_Jack_Harbor_Ships);
	Info_AddChoice(DIA_Jack_Harbor, " What do you mean by rabble? " ,DIA_Jack_Harbor_Rogue);
	Info_AddChoice(DIA_Jack_Harbor, " So why don't you leave here? " ,DIA_Jack_Harbor_Leave);
};

func void DIA_Jack_Harbor_Back()
{
	Info_ClearChoices(DIA_Jack_Harbor);
};

func void DIA_Jack_Harbor_Ships()
{
	AI_Output(other,self, " DIA_Jack_Harbor_Ships_15_00 " );	// Why don't ships come here anymore?
	AI_Output(self,other, " DIA_Jack_Harbor_Ships_14_01 " );	// They say here that when the war is over, everything will return to normal. This is all bullshit.
	AI_Output(self,other, " DIA_Jack_Harbor_Ships_14_02 " );	// I assure you, a true sailor is always the first to know that a city is in decline.
	AI_Output(self,other, " DIA_Jack_Harbor_Ships_14_03 " );	// The sailor feels it in his gut. And I tell you, forget about this port, its best days are long gone.
};

func void DIA_Jack_Harbor_Rogue()
{
	AI_Output(other,self, " DIA_Jack_Harbor_Rogue_15_00 " );	// What do you mean by rabble?
	AI_Output(self,other, " DIA_Jack_Harbor_Rogue_14_01 " );	// Look at them, they're a bunch of slackers. Most of them don't even know what a job is. All they do is drink all day long and take their last pennies to a brothel.
	AI_Output(self,other, " DIA_Jack_Harbor_Rogue_14_02 " );	// I'm telling you, stay away from them.
};

func void DIA_Jack_Harbor_Leave()
{
	AI_Output(other,self, " DIA_Jack_Harbor_Leave_15_00 " );	// So why don't you leave here?
	AI_Output(self,other, " DIA_Jack_Harbor_Leave_14_01 " );	// Today, no one will take an old sea dog like me on a ship.
	AI_Output(self,other, " DIA_Jack_Harbor_Leave_14_02 " );	// Most people think that Old Jack is good for nothing and that gout is eating away at his old bones.
	AI_Output(other,self, " DIA_Jack_Harbor_Leave_15_03 " );	// And? They are right?
	AI_Output(self,other, " DIA_Jack_Harbor_Leave_14_04 " );	// Nonsense. As soon as I feel the deck under my feet again, I will give odds to any of these impudent youths.
};


instance DIA_Jack_BANDITENWEG(C_Info)
{
	npc = VLK_444_Jack;
	nr = 7;
	condition = DIA_Jack_BANDITENWEG_Condition;
	information = DIA_Jack_BANDITENWEG_Info;
	description = "The bandits who took over your lighthouse are gone. " ;
};


func int DIA_Jack_BANDITENWEG_Condition()
{
	if (Npc_IsDead(LeuchtturmBandit_1021) && Npc_IsDead(LeuchtturmBandit_1022) && Npc_IsDead(LeuchtturmBandit_1023) && (MIS_Jack_KillLighthouseBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jack_BANDITENWEG_Info()
{
	AI_Output(other,self, " DIA_Jack_BANDITENWEG_15_00 " );	// The bandits who took over your lighthouse are gone.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_14_01 " );	// Is this true? Finally, I can get back to my work.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_14_02 " );	// Come with me to the lighthouse. From there you can enjoy stunning sea views.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillLighthouseBandits);
};

instance DIA_Jack_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_444_Jack;
	nr = 8;
	condition = DIA_Jack_LIGHTHOUSEFREE_Condition;
	information = DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent = FALSE;
	description = " I like your lighthouse. " ;
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_KillLighthouseBandits == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKnowsWayToIrdorath == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self, " DIA_Jack_LIGHTHOUSEFREE_15_00 " );	// I like your beacon.
	AI_Output(self,other, " DIA_Jack_LIGHTHOUSEFREE_14_01 " );	// Thank you! Climb the stairs to the top for such an amazing view. Feel at home here!
};

instance DIA_Jack_SmokePipe(C_Info)
{
	npc = VLK_444_Jack;
	nr = 3;
	condition = DIA_Jack_SmokePipe_Condition;
	information = DIA_Jack_SmokePipe_Info;
	permanent = FALSE;
	description = " What are you thinking about? " ;
};

func int DIA_Jack_SmokePipe_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Jack_LIGHTHOUSEFREE) == TRUE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Jack_SmokePipe_Info()
{
	AI_Output(other,self, " DIA_Jack_SmokePipe_01_00 " );	// What are you thinking about?
	AI_Output(self,other, " DIA_Jack_SmokePipe_01_01 " );	// Eh... (dreamy) I thought it would be nice to smoke a good pipe of tobacco now!
	AI_Output(other,self, " DIA_Jack_SmokePipe_01_02 " );	// So what's the deal?
	AI_Output(self,other, " DIA_Jack_SmokePipe_01_03 " );	// Because I don't have it! My old pipe has been crumbling for a long time, and getting a new one is problematic here.
	AI_Output(self,other, " DIA_Jack_SmokePipe_01_04 " );	// Especially now, when ships with merchants have stopped sailing from the mainland.
	AI_Output(other,self, " DIA_Jack_SmokePipe_01_05 " );	// Why don't you like a swamp joint?
	AI_Output(self,other, " DIA_Jack_SmokePipe_01_06 " );	// Smoke that stuff yourself! And I'm used to good tobacco and a pipe. He smoked it in his wanderings on the seas, and on land he always remained faithful to her.
	AI_Output(self,other, " DIA_Jack_SmokePipe_01_07 " );	// In addition, in cold and windy weather, the pipe warmed my face when I stood on top of the lighthouse.
	AI_Output(self,other, " DIA_Jack_SmokePipe_01_08 " );	// And your cant is hardly suitable for this!
	AI_Output(other,self, " DIA_Jack_SmokePipe_01_09 " );	// Well, if so, then I can look for her for you.
	AI_Output(self,other, " DIA_Jack_SmokePipe_01_10 " );	// Oh, thanks mate. Do the old man a favor! And I will thank you very much for that.
	MIS_JackSmokePipe = LOG_Running;
	Log_CreateTopic(TOPIC_JackSmokePipe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JackSmokePipe,LOG_Running);
	B_LogEntry(TOPIC_JackSmokePipe, " Jack needs a new pipe. He promised to thank me generously if I found one for him. " );
};

instance DIA_Jack_SmokePipe_Done(C_Info)
{
	npc = VLK_444_Jack;
	nr = 3;
	condition = DIA_Jack_SmokePipe_Done_Condition;
	information = DIA_Jack_SmokePipe_Done_Info;
	permanent = FALSE;
	description = " I brought you a pipe. " ;
};

func int DIA_Jack_SmokePipe_Done_Condition()
{
	if((MIS_JackSmokePipe == LOG_Running) && (Npc_HasItems(other,ItMi_Smoke_Pipe) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Jack_SmokePipe_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Jack_SmokePipe_Done_01_00 " );	// I brought you a pipe.
	B_GiveInvItems(other,self,ItMi_Smoke_Pipe,1);
	Npc_RemoveInvItems(self,ItMi_Smoke_Pipe,1);
	AI_Output(self,other, " DIA_Jack_SmokePipe_Done_01_01 " );	// Great, mate. This is just what you need!
	AI_Output(self,other, " DIA_Jack_SmokePipe_Done_01_02 " );	// What about my reward?
	AI_Output(self,other, " DIA_Jack_SmokePipe_Done_01_03 " );	// Here, take this gold. I hope that such gratitude will allow you to forget the tedious search that you subjected yourself to for me.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_Output(self,other,"DIA_Jack_SmokePipe_Done_01_04");	//Спасибо.
	MIS_JackSmokePipe = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_JackSmokePipe,LOG_SUCCESS);
	B_LogEntry(TOPIC_JackSmokePipe, " I got Jack a new pipe and he gave me a lot of gold. " );
	AI_StopProcessInfos(self);

	if (chapter <  5 )
	{
		Npc_ExchangeRoutine(self,"LighthouseSmoke");
	};
};

instance DIA_Jack_KAP3_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP3_EXIT_Condition;
	information = DIA_Jack_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP4_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP4_EXIT_Condition;
	information = DIA_Jack_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP5_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP5_EXIT_Condition;
	information = DIA_Jack_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_BEMYCAPTAIN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 51;
	condition = DIA_Jack_BEMYCAPTAIN_Condition;
	information = DIA_Jack_BEMYCAPTAIN_Info;
	permanent = TRUE;
	description = " Would you like to go out to sea again? " ;
};


func int DIA_Jack_BEMYCAPTAIN_Condition()
{
	if ((Capital ==  5 ) && (MY_SCKnowsWayToIrdorath ==  TRUE ) && (MY_Jack_KillLighthouseBandits ==  LOG_SUCCESS ) && (MY_Jack_NewLighthouseOfficer ==  0 )) ;
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN_Info()
{
	AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN_15_00 " );	// Wouldn't you like to go out to sea again?
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN_14_01 " );	// I would gladly give my right hand just for someone to hire me on a big schooner, even if only for a little while.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN_14_02 " );	// But it's not easy for an old sea dog like me, mate. And besides, who will look after the lighthouse then?
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN, " Forget it. I just said it. " ,DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN, " I need your seaman experience. " ,DIA_Jack_BEMYCAPTAIN_seaman);
};

func void DIA_Jack_BEMYCAPTAIN_seaman()
{
	AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN_seaman_15_00 " );	// I need your experience as a sailor.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN_seaman_14_01 " );	// Damn me! What are you thinking, buddy? You're not going to take over the royal war galley, are you?
	AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN_seaman_15_02 " );	// Who knows?
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN_seaman_14_03 " );	// (laughs) It will be something! Damn. But I can't pick up and drop my beacon like that. Mmm. What are we to do with it?
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain, " Jack, the old harbor sea dog, would make a good captain. But first I need to find someone to watch his lighthouse. " );
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN, " Forget it. I just said it. " ,DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN, " What if I bring someone to you? " ,DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer);
};

func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer()
{
	AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00 " );	// What if I bring someone to you to take care of the lighthouse in your absence?
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01 " );	// Not a bad idea, mate. And I have a suitable candidate.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02 " );	// Harad, the blacksmith, has an apprentice named Brian. I have talked with him many times.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03 " );	// I'd like to trust him with my beacon. I think he's the best for it.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04 " );	// Go talk to him. Maybe we'll get lucky and this guy will agree to help us.
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_Running;
};

func void DIA_Jack_BEMYCAPTAIN_no()
{
	AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN_no_15_00 " );	// Forget it! That's just what I said.
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
};


instance DIA_Jack_BEMYCAPTAIN2(C_Info)
{
	npc = VLK_444_Jack;
	nr = 52;
	condition = DIA_Jack_BEMYCAPTAIN2_Condition;
	information = DIA_Jack_BEMYCAPTAIN2_Info;
	description = " About Brian... " ;
};


func int DIA_Jack_BEMYCAPTAIN2_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) || ((MIS_Jack_NewLighthouseOfficer == LOG_Running) && Npc_IsDead(Brian)))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN2_Info()
{
	if (Npc_IsDead(Brian))
	{
		AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN2_15_00 " );	// Brian is dead.
		AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN2_14_01 " );	// Oh. Terrible times. He was such a good guy.
		MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN2_15_02 " );	// Brian will take care of your beacon.
		AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN2_14_03 " );	// I was hoping you'd say that.
		B_GivePlayerXP(XP_Jack_NewLighthouseOfficer);

		if(SCGotCaptain == FALSE)
		{
			AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN2_14_04 " );	// Do you still need me?
		}
		else
		{
			AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN2_14_05 " );	// Let's see if this guy works.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Jack_BEMYCAPTAIN3(C_Info)
{
	npc = VLK_444_Jack;
	nr = 53;
	condition = DIA_Jack_BEMYCAPTAIN3_Condition;
	information = DIA_Jack_BEMYCAPTAIN3_Info;
	description = " Be my captain. " ;
};


func int DIA_Jack_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_BEMYCAPTAIN2) && (SCGotCaptain == FALSE) && (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN3_15_00 " );	// Be my captain.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN3_14_01 " );	// I've sailed the seven seas, mate, but I've never been captain of a ship before.
	AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN3_15_02 " );	// I don't know anything about navigation. You must take on these responsibilities.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN3_14_03 " );	// I'll do my best.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN3_14_04 " );	// Now show me my ship and your crew. Do you even know where you're going? I mean, do you have a nautical chart?
	AI_Output(other,self, " DIA_Jack_BEMYCAPTAIN3_15_05 " );	// Wait for me at the port. Don't worry about the rest.
	AI_Output(self,other, " DIA_Jack_BEMYCAPTAIN3_14_06 " );	// Well, whatever you say.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Jack_LOSFAHREN (C_Info)
{
	npc = VLK_444_Jack;
	nr = 59;
	condition = DIA_Jack_LOSFAHREN_Condition;
	information = DIA_Jack_LOSFAHREN_Info;
	permanent = TRUE;
	description = " Very well, old man. Raise the sails! " ;
};


func int DIA_Jack_LOSFAHREN_Condition()
{
	if((JackIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LOSFAHREN_Info()
{
	AI_Output(other,self, " DIA_Jack_LOSFAHREN_15_00 " );	// Fine, old man. Raise the sails!

	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other, " DIA_Jack_LOSFAHREN_14_01 " );	// Everything is fine! Now show me your sea chart.
		AI_Output(other,self,"DIA_Jack_LOSFAHREN_14_07");	//Вот.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other, " DIA_Jack_LOSFAHREN_14_02 " );	// It won't be an easy voyage, but I still hope we get there safe and sound.
		AI_Output(self,other, " DIA_Jack_LOSFAHREN_14_03 " );	// Do you really have everything you need? We won't go back just because you forgot something.
		AI_Output(self,other, " DIA_Jack_LOSFAHREN_14_04 " );	// If you're sure you've got everything you need, go to the captain's quarters and take a nap. You will need your strength soon!
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Jack_LOSFAHREN_14_05 " );	// Take it easy, mate. I haven't even seen this trough yet. Will not work.
		AI_Output(self,other, " DIA_Jack_LOSFAHREN_14_06 " );	// First, you must complete a team of at least five people, gain access to the ship and get a nautical chart. Otherwise, forget about it.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Jack_KAP6_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP6_EXIT_Condition;
	information = DIA_Jack_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_NW_KAPITELORCATTACK(C_Info)
{
	npc = VLK_444_Jack;
	nr = 1;
	condition = dia_jack_nw_kapitelorcattack_condition;
	information = dia_jack_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " What do you say, captain? " ;
};


func int dia_jack_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JACKBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_Jack_NW_KapitelOrcAttack_01_00 " );	// What do you say, captain?
	AI_Output(self,other, " DIA_Jack_NW_KapitelOrcAttack_01_01 " );	// What can I say... I heard that orcs are in full swing in Khorinis!
	AI_Output(other,self, " DIA_Jack_NW_KapitelOrcAttack_01_02 " );	// I heard that a few guys still want to try to break through the city with a fight.
	AI_Output(self,other, " DIA_Jack_NW_KapitelOrcAttack_01_04 " );	// Many of them are experienced warriors and are not the first to fight against orcs.
	AI_Output(self,other, " DIA_Jack_NW_KapitelOrcAttack_01_03 " );	// Eh, what can not be said about me. I don't even know how to hold a sword. Where can I go against these creatures?
	Info_ClearChoices(dia_jack_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_jack_nw_kapitelorcattack, " Offer teleport rune to tavern. " ,dia_jack_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_jack_nw_kapitelorcattack, " You'll have to try. " ,dia_jack_nw_kapitelorcattack_nogiverune);
};

func void dia_jack_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Jack_NW_KapitelOrcAttack_Taverne_01_01 " );	// Wait. I have a rune to teleport to the Dead Harpy Tavern with me.
	AI_Output(other,self, " DIA_Jack_NW_KapitelOrcAttack_Taverne_01_05 " );	// Fighting your way through a city filled to the brim with orcs is certain death for you!
	AI_Output(self,other, " DIA_Jack_NW_KapitelOrcAttack_Taverne_01_08 " );	// Yeah... you're right. I'll take it, thanks!
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other, " DIA_Jack_NW_KapitelOrcAttack_Taverne_01_10 " );	// Eh! I hope that after it I won’t feel sick again for a week, like after a hangover.
	JACKNOBATTLETHROUGTH = TRUE;
	B_LogEntry( TOPIC_HELPCREW , " I gave Jack the teleportation rune to the Dead Harpy Tavern. Now I'm at peace with his fate. " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_jack_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// There is no other way to get out of here!
	AI_Output(self,other, " DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_02 " );	// I don't think I can...(doomed) But I'll have to try.
	AI_Output(other,self, " DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_03 " );	// Good luck then! You will need it.
	AI_Output(self,other, " DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_04 " );	// (desperately) Thank you.
	B_LogEntry( TOPIC_HELPCREW , " Jack will fight his way out of the captured city with everyone. I think he has no chance of staying alive. " );
	JACKBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_JACK_NW_AGAINCAPITAN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 1;
	condition = dia_jack_nw_againcapitan_condition;
	information = dia_jack_nw_againcapitan_info;
	permanent = FALSE;
	description = " My ship needs a captain again. " ;
};


func int dia_jack_nw_againcapitan_condition()
{
	if ( Npc_KnowsInfo ( hero , their_lord_hagen_need_captain ) && ( WHOTRAVELONBIGLAND  ==  FALSE ) && ( SHIPGAINACESS  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_jack_nw_againcapitan_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Jack_NW_AgainCapitan_01_00 " );	// My ship needs a captain again.
	AI_Output(self,other, " DIA_Jack_NW_AgainCapitan_01_01 " );	// Hmmm...(with a smirk) And where are you going to swim this time?
	AI_Output(other,self, " DIA_Jack_NW_AgainCapitan_01_02 " );	// I'm sailing to the mainland. I have a very important message for the king. Will you help me?
	AI_Output(self,other, " DIA_Jack_NW_AgainCapitan_01_03 " );	// To the mainland?! Eh, boy... I'm sorry, but it's better for me to stay here.
	AI_Output(self,other, " DIA_Jack_NW_AgainCapitan_01_04 " );	// I've heard that orcs are already running the mainland with might and main.
	AI_Output(self,other, " DIA_Jack_NW_AgainCapitan_01_05 " );	// So you'd better find yourself another captain.
	AI_Output(other,self, " DIA_Jack_NW_AgainCapitan_01_06 " );	// Very sorry. I counted on you.
	B_LogEntry( TOPIC_SALETOBIGLAND , " Jack refused to sail with me to the mainland. " );
};

instance DIA_JACK_BANDITENWEG1(C_Info)
{
	npc = VLK_444_Jack;
	nr = 2;
	condition = dia_jack_banditenweg1_condition;
	information = dia_jack_banditenweg1_info;
	permanent = FALSE;
	description = " What do you know about pirates? " ;
};

func int dia_jack_banditenweg1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jack_City))
	{
		return TRUE;
	};
};

func void dia_jack_banditenweg1_info()
{
	AI_Output(other,self, " DIA_Jack_BANDITENWEG_01_01 " );	// What do you know about pirates?
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_01_02 " );	// Well... all pirates are notorious thugs, thieves and scoundrels!
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_01_03 " );	// True, behind the cruelty and inhumanity with which they rob and sink ships, sometimes something warm and sincere is hidden.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_01_04 " );	// For example, in order to somehow pass the time and have fun in between robberies, they compose poems and songs.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_01_05 " );	// And often they do really good things! Do you want to listen?
	Info_ClearChoices(dia_jack_banditenweg1);
	Info_AddChoice(dia_jack_banditenweg1, " No thanks. " ,dia_jack_banditenweg1_no);
	Info_AddChoice(dia_jack_banditenweg1, " I wouldn't mind. " ,dia_jack_banditenweg1_yes);
};

func void dia_jack_banditenweg1_no()
{
	AI_Output(other,self, " DIA_Jack_BANDITENWEG_no_01_01 " );	// No thanks.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_no_01_02 " );	// Well, I understand. Good luck then, young man. See you!
	AI_StopProcessInfos(self);
};

func void dia_jack_banditenweg1_yes()
{
	AI_Output(other,self, " DIA_Jack_BANDITENWEG_yes_01_01 " );	// I wouldn't mind.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_02 " );	// Then listen... (singing under his breath)
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_03 " );	// Well, that's all, my friend, it's time to open the kingstones,
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_04 " );	// Prokazy na vode did not lead to good.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_05 " );	// Well, how long can you swim to the immensely remote,
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_06 " );	// To his only mysterious star?
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_07 " );	// Already the fuse is not the one to keep the course stubbornly,
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_08 " );	// And all the winds in spite of tending to nowhere.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_09 " );	// And it's very hard to be a captain,
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_10 " );	// When only one star burns in the darkness.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_11 " );	// Wouldn't it be better to lie modestly at the bottom among the gloomy
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_12 " );	// Deep-sea fish with a poisoned tail?
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_13 " );	// After all, gold lies at the bottom in pirate holds,
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_14 " );	// And mindless plankton floats on top.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_15 " );	// So what draws me to the boundaries of the sky?
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_16 " );	// What am I tormented about in delirium and in reality?
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_17 " );	// Why am I again to the immensely remote,
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_18 " );	// To my only swim, swim, swim...
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yes_01_19 " );	// Hmmm... how are you?
	Info_ClearChoices(dia_jack_banditenweg1);
	Info_AddChoice(dia_jack_banditenweg1,"Так себе.",dia_jack_banditenweg1_not);
	Info_AddChoice(dia_jack_banditenweg1, " That was great! " ,dia_jack_banditenweg1_yea);
};

func void dia_jack_banditenweg1_not()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_not_01_01");	//Так себе.
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_not_01_02 " );	// Well... (annoyed) Good luck then, young man. See you!
	AI_StopProcessInfos(self);
};

func void dia_jack_banditenweg1_yea()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Jack_BANDITENWEG_yea_01_01 " );	// It was great!
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yea_01_02 " );	// I knew you'd like it. This is real pirate romance!
	AI_Output(other,self, " DIA_Jack_BANDITENWEG_yea_01_03 " );	// Listen, aren't you a pirate yourself?
	AI_Output(self,other, " DIA_Jack_BANDITENWEG_yea_01_04 " );	// Who? I?! (stammered) No, what are you! I'm just an old sailor. And just something...
	AI_Output(other,self, " DIA_Jack_BANDITENWEG_yea_01_05 " );	// Well, yes, of course.
	AI_StopProcessInfos(self);
};

instance DIA_Jack_DiscoverLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_DiscoverLH_Condition;
	information = DIA_Jack_DiscoverLH_Info;
	description = " Have you ever heard of a pirate named Kelevra? " ;
};

func int DIA_Jack_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (KnowStoryDLH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jack_DiscoverLH_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Jack_DiscoverLH_01_00 " );	// Have you ever heard of a pirate named Kelevra?
	AI_Output(self,other, " DIA_Jack_DiscoverLH_01_01 " );	// (thoughtfully) First time I've heard of this.
	AI_Output(self,other, " DIA_Jack_DiscoverLH_01_02 " );	// And in general, hanging out with pirates is not in my rules, son.
	AI_Output(other,self, " DIA_Jack_DiscoverLH_01_03 " );	// Okay, I understand you.
	CanGoGreg = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse, " Jack doesn't know anything about the pirate known as Kelevra. Maybe you should ask the pirates about it? " );
};

instance DIA_Jack_GotPirate(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_GotPirate_Condition;
	information = DIA_Jack_GotPirate_Info;
	description = " Hello, Jack. " ;
};

func int DIA_Jack_GotPirate_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (GotPirate == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jack_GotPirate_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Jack_GotPirate_01_00 " );	// Hello, Kelevra!
	AI_Output(self,other,"DIA_Jack_GotPirate_01_01");	//Что?!
	AI_Output(other,self, " DIA_Jack_GotPirate_01_02 " );	// Don't deny it, Greg told me about you.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_03 " );	// That's yap!.. Well, well. So what?
	AI_Output(other,self, " DIA_Jack_GotPirate_01_04 " );	// You don't seem to be as good-natured as you pretend to be.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_05 " );	// I don't understand what you mean?!
	AI_Output(other,self, " DIA_Jack_GotPirate_01_06 " );	// But it seems to me that you understand everything perfectly! After all, it was you who killed the guy named Stefan, who, by the way, saved your life.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_07 " );	// What Beliar! Where did you come from? .. (sighs) Okay. I see that you already know everything. Did Greg tell you that too?
	AI_Output(other,self, " DIA_Jack_GotPirate_01_08 " );	// This was told to me by the ghost of that caretaker, whom you killed only because he did not want to give you the boat.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_09 " );	// Yes, I did it! So what now? Will you kill me? Let's! I myself still regret what I did then.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_10 " );	// After that incident, I gave up piracy, settled on the shore and began working as a lighthouse keeper in order to somehow make amends.
	AI_Output(other,self, " DIA_Jack_GotPirate_01_11 " );	// I won't kill you. But I have a better idea. You will help me remove the curse from that lighthouse.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_12 " );	// Me?! Interesting ... And what should I do for this? Go and die there?
	AI_Output(other,self, " DIA_Jack_GotPirate_01_13 " );	// This is optional. It is enough to ask for forgiveness from the ghost so that the power of the curse weakens.
	AI_Output(other,self, " DIA_Jack_GotPirate_01_14 " );	// But you were right about one thing - you still have to go there.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_15 " );	// Feed me in the ass! Okay, if there's no other way.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_16 " );	// Just... Before I go there, let me settle a couple of things here on the beach. I don't know if I'll make it back alive or not.
	AI_Output(other,self, " DIA_Jack_GotPirate_01_17 " );	// Good. You have a day.
	AI_Output(self,other, " DIA_Jack_GotPirate_01_18 " );	// Then we'll meet the day after tomorrow right at the pier near the lighthouse.
	AI_Output(other,self, " DIA_Jack_GotPirate_01_19 " );	// See you. Yes, and until I forgot ... what does this nickname mean - Kelevra?
	AI_Output(self,other, " DIA_Jack_GotPirate_01_20 " );	// In the language of the Assassins, it means 'Evil Dog'. Don't ask me why they call me that...
	JackGoLH = TRUE;
	JackGoLHDay = Wld_GetDay();
	B_LogEntry(TOPIC_HauntedLighthouse, " Jack confessed everything. Now we'll go to the lighthouse to try to remove the curse from him. " );
	AI_StopProcessInfos(self);
};

instance DIA_Jack_OnLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_OnLH_Condition;
	information = DIA_Jack_OnLH_Info;
	important = TRUE;
};

func int DIA_Jack_OnLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (JackOnLH == TRUE) && (Npc_GetDistToWP(self,"NW_JACK_LH_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jack_OnLH_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Jack_OnLH_01_00 " );	// You still came.
	AI_Output(self,other, " DIA_Jack_OnLH_01_01 " );	// Who do you take me for, boy?! If I have given my word, I will keep it.
	AI_Output(other,self, " DIA_Jack_OnLH_01_02 " );	// Let's go then. Just let me speak.
	AI_Output(self,other, " DIA_Jack_OnLH_01_03 " );	// As you say.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	JackMeetLHGhost = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse, " I met Jack at the lighthouse and we went to Stefan's ghost. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowLH");
};

instance DIA_Jack_OnLHDone(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_OnLHDone_Condition;
	information = DIA_Jack_OnLHDone_Info;
	important = TRUE;
};

func int DIA_Jack_OnLHDone_Condition()
{
	if(FinishStoryLH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jack_OnLHDone_Info()
{
	AI_Output(self,other, " DIA_Jack_OnLHDone_01_00 " );	// Anchor in my ass! And I thought I was finished.
	AI_Output(other,self, " DIA_Jack_OnLHDone_01_01 " );	// You can calm down. Everything is already behind.
	AI_Output(self,other, " DIA_Jack_OnLHDone_01_02 " );	// To be honest, after all this, I myself fell like a stone from my soul.

	if(JackMeetGhost == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self, " DIA_Jack_OnLHDone_01_03 " );	// What's wrong with your eye?
		AI_Output(self,other, " DIA_Jack_OnLHDone_01_04 " );	// Yeah, blind... (grins) A keepsake from that ghost.
		AI_Output(other,self, " DIA_Jack_OnLHDone_01_05 " );	// You're lucky he didn't kill you.
		AI_Output(self,other, " DIA_Jack_OnLHDone_01_06 " );	// And don't talk. (sighs) Thank you for your help, buddy. Now I am in your debt.
		MIS_HauntedLighthouse = LOG_Success;
		Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Success);
		B_LogEntry(TOPIC_HauntedLighthouse, " I removed the curse from the lighthouse. Now people are safe here. " );
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other, " DIA_Jack_OnLHDone_01_08 " );	// Thanks for your help, mate. Now I am in your debt.
	};

	AI_StopProcessInfos(self);

	if(JackIsCaptain == TRUE)
	{
		Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	}
	else if(MIS_JackSmokePipe == LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"LighthouseSmoke");
	}
	else
	{
		if(MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"Lighthouse");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
};
