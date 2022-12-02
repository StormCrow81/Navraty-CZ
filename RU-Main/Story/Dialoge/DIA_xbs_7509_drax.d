

instance DIA_DRAX_EXIT(C_Info)
{
	npc = xbs_7509_drax;
	nr = 999;
	condition = dia_drax_exit_condition;
	information = dia_drax_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_drax_exit_condition()
{
	return TRUE;
};

func void dia_drax_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAX_PICKPOCKET(C_Info)
{
	npc = xbs_7509_drax;
	nr = 900;
	condition = dia_drax_pickpocket_condition;
	information = dia_drax_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_drax_pickpocket_condition()
{
	return  C_Robbery ( 25 , 30 );
};

func void dia_drax_pickpocket_info()
{
	Info_ClearChoices(dia_drax_pickpocket);
	Info_AddChoice(dia_drax_pickpocket,Dialog_Back,dia_drax_pickpocket_back);
	Info_AddChoice(dia_drax_pickpocket,DIALOG_PICKPOCKET,dia_drax_pickpocket_doit);
};

func void dia_drax_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_drax_pickpocket);
};

func void dia_drax_pickpocket_back()
{
	Info_ClearChoices(dia_drax_pickpocket);
};


instance DIA_DRAX_HELLO (C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_hallo_condition;
	information = dia_drax_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_drax_hallo_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_drax_hello_info()
{
	AI_Output(self,other, " DIA_Drax_Hallo_01_0E " );	// Yes, yes...

	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_00 " );	// Well, you must! How many years have I not seen the servants of Innos...
	}
	else if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_0A " );	// Well, you must! How many years have I not seen the servants of Adanos...
	}
	else if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_0B " );	// Well, you must! It is impossible to confuse you minions of Beliar with anyone ... (with caution)
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_0C " );	// Well, you must! Another lost soul from the former Swamp Brotherhood...
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_0D " );	// Wow - another mercenary... How did you end up here?!
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_01 " );	// Well, you must! How many years have I not seen the royal servants ...
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_02 " );	// Another tramp! It's amazing how you got here.
	};
	AI_Output(other,self, " DIA_Drax_Hallo_15_03 " );	// I think your name is Drax, right? I remember you - I'm also a former prisoner...
	AI_Output(self,other, " DIA_Drax_Hallo_01_04 " );	// Yes? Ah, can you remember all of you ... We hunted near the pass and saw so many green beginners.
	AI_Output(other,self, " DIA_Drax_Hallo_15_05 " );	// Well, not everyone then made so much noise in the Old Camp.
	AI_Output(self,other, " DIA_Drax_Hallo_01_06 " );	// Now I remember - there was such a thing just before the fall of the Barrier!
	AI_Output(self,other, " DIA_Drax_Hallo_01_07 " );	// The only pity is that you didn't manage to get the Crow.

	if(RavenIsDead == TRUE)
	{
		AI_Output(other,self, " DIA_Drax_Hallo_15_08 " );	// Wrong, I found it a little later.
		AI_Output(self,other, " DIA_Drax_Hallo_01_09 " );	// huh? I do not believe!
		AI_Output(self,other, " DIA_Drax_Hallo_01_10 " );	// I don't believe it! I would like to see his ring. With just one eye!

		if(Npc_HasItems(other,ITMI_RAVENGOLDRING) >= 1)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self, " DIA_Drax_Hallo_15_11 " );	// Here it is - look. You can even keep it for yourself.
			B_GiveInvItems(other,self,ITMI_RAVENGOLDRING,1);
			Npc_RemoveInvItems(self,ITMI_RAVENGOLDRING,1);
			AI_Output(self,other, " DIA_Drax_Hallo_01_12 " );	// (respectfully) Yes, someone did get that bastard! Well, thank you brother.
			AI_Output(other,self, " DIA_Drax_RavenRing_15_00 " );	// So I owe something for this ring?
			AI_Output(self,other, " DIA_Drax_RavenRing_01_01 " );	// More precisely, for your work... (laughs) Well, why not? For a good person nothing is a pity.
			AI_Output(self,other, " DIA_Drax_RavenRing_01_02 " );	// Of course, not God knows what a gift - but the richer, the more happy.
			B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
			AI_Output(self,other, " DIA_Drax_RavenRing_01_03 " );	// Here, take this strange stone tablet. I still don't understand what she is.
			AI_Output(self,other, " DIA_Drax_RavenRing_01_04 " );	// Maybe you can deal with it.
			AI_Output(other,self, " DIA_Drax_RavenRing_01_05 " );	// And thanks for that!
			DRAXHASRING = TRUE;
		}
		else
		{
			AI_Output(other,self, " DIA_Drax_Hallo_15_13 " );	// ...hell, already sold to someone.
			AI_Output(self,other,"DIA_Drax_Hallo_01_14");	//Ну-ну.
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Drax_Hallo_15_15 " );	// It will be his turn.
		AI_Output(self,other, " DIA_Drax_Hallo_01_16 " );	// Ha. Well, let's say ... I want to believe you.
		AI_Output(self,other, " DIA_Drax_Hallo_01_17 " );	// Bring me his ring then. He had something special!
		AI_Output(self,other, " DIA_Drax_Hallo_01_18 " );	// And old Drax will repay such a good man.
		MIS_RavenRing = LOG_Running;
		Log_CreateTopic(TOPIC_RavenRing,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RavenRing,LOG_Running);
		B_LogEntry(TOPIC_RavenRing, " Drax asked me to bring him the Raven Ring as proof of his death. " );
	};
};

instance DIA_DRAX_RAVENRING(C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = dia_drax_ravenring_condition;
	information = dia_drax_ravenring_info;
	permanent = FALSE;
	description = " I have a Raven ring! " ;
};

func int dia_drax_ravenring_condition()
{
	if((MIS_RavenRing == LOG_Running) && (DRAXHASRING == FALSE) && (Npc_HasItems(hero,ITMI_RAVENGOLDRING) >= 1))
	{
		return TRUE;
	};
};

func void dia_drax_ravenring_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Drax_RavenRing_01_06 " );	// I have a Raven ring!
	AI_Output(self,other,"DIA_Drax_RavenRing_01_07");	//Правда?
	AI_Output(other,self, " DIA_Drax_Hallo_15_11 " );		// Here it is - admire as much as you like. You can even keep it for yourself.
	B_GiveInvItems(other,self,ITMI_RAVENGOLDRING,1);
	Npc_RemoveInvItems(self,ITMI_RAVENGOLDRING,1);
	AI_Output(self,other, " DIA_Drax_Hallo_01_12 " );		// (respectfully) Yes, someone did get that bastard! Well, thank you brother.
	AI_Output(other,self, " DIA_Drax_RavenRing_15_00 " );	// So I owe something for this ring?
	AI_Output(self,other, " DIA_Drax_RavenRing_01_01 " );	// More precisely, for your work... (laughs) Well, why not? For a good person nothing is a pity.
	AI_Output(self,other, " DIA_Drax_RavenRing_01_02 " );	// Of course, not God knows what a gift - but the richer, the more happy.
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	AI_Output(self,other, " DIA_Drax_RavenRing_01_03 " );	// Here, take this strange stone tablet. I still don't understand what she is.
	AI_Output(self,other, " DIA_Drax_RavenRing_01_04 " );	// Maybe you can deal with it.
	AI_Output(other,self, " DIA_Drax_RavenRing_01_05 " );	// And thanks for that!
	DRAXHASRING = TRUE;
	MIS_RavenRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_RavenRing,LOG_Success);
	B_LogEntry(TOPIC_RavenRing, " I brought Drax a Raven Ring. " );
	AI_StopProcessInfos(self);
};

instance DIA_DRAX_KAPITEL4 (C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_kapitel4_condition;
	information = dia_drax_kapitel4_info;
	permanent = FALSE;
	description = " Have the orcs been here recently? " ;
};

func int dia_drax_kapitel4_condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void dia_drax_kapitel4_info()
{
	AI_Output(other,self, " DIA_Drax_Kapitel4_15_00 " );	// Orcs haven't been through here lately?
	AI_Output(self,other, " DIA_Drax_Kapitel4_01_01 " );	// No, they didn't pass - they ran. Somehow they feel uncomfortable in our forest.
	AI_Output(self,other, " DIA_Drax_Kapitel4_01_02 " );	// A whole bunch of orcs! And they didn't even look in our direction. They rushed behind their fence - only their heels sparkled. Yes!
	AI_Output(other,self, " DIA_Drax_Kapitel4_15_03 " );	// Got it.
};

instance DIA_DRAX_CAMPER(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_camper_condition;
	information = dia_drax_camper_info;
	permanent = FALSE;
	description = " Who is this with you? " ;
};

func int dia_drax_camper_condition()
{
	if ( ! Npc_KnowsInfo(other,dia_camper01_hello) && (Npc_IsDead(camper_7501) ==  FALSE ) && (MoveDracarBoard ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_drax_camper_info()
{
	AI_Output(other,self, " DIA_Drax_Camper_15_00 " );	// And who is this with you?
	AI_Output(self,other, " DIA_Drax_Camper_01_01 " );	// This guy is from a camp somewhere up north.
	AI_Output(self,other, " DIA_Drax_Camper_01_02 " );	// Called us to them. He says that they have either a magician or some kind of prophet there, and life is calm.

	if (Npc_IsDead(ratford))
	{
		AI_Output(self,other, " DIA_Drax_Camper_01_03 " );	// And what is it for me? I am free and calm here.
		AI_Output(self,other, " DIA_Drax_Camper_01_04 " );	// Only now there is no one to talk to.
		AI_Output(self,other, " DIA_Drax_Camper_01_05 " );	// Though Ratford wasn't much of a talker.
	}
	else
	{
		AI_Output(self,other, " DIA_Drax_Camper_01_06 " );	// And what is it for us? We are free and calm here.
	};
};

instance DIA_DRAX_GOHOME(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = DIA_DRAX_GOHOME_condition;
	information = DIA_DRAX_GOHOME_info;
	permanent = FALSE;
	description = " Are you here? " ;
};

func int DIA_DRAX_GOHOME_condition()
{
	if ((Chapter >=  5 ) && (MoveDracarBoard ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_DRAX_GOHOME_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_DRAX_GOHOME_01_00 " );	// Are you here?
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_01 " );	// Yes. Here is the place you need! Quiet and calm.
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_02 " );	// In addition, I heard that the orcs attacked the castle again. Who knows what they have in mind now!
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_03 " );	// But one thing I know for sure - they are unlikely to turn up here.
	AI_Output(other,self, " DIA_DRAX_GOHOME_01_04 " );	// And what do you do here all day?
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_05 " );	// We stand on the clock. In sequence, of course. First me, then Retford.
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_06 " );	// Make sure to give a signal if something happens. Well, if the orcs get too close to our camp.
	AI_Output(other,self, " DIA_DRAX_GOHOME_01_07 " );	// Yes, you're doing well here.
};

instance DIA_DRAX_WHOCAP(C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = DIA_DRAX_WHOCAP_condition;
	information = DIA_DRAX_WHOCAP_info;
	permanent = FALSE;
	description = " Do you happen to know if there are any sailors among you? " ;
};

func int DIA_DRAX_WHOCAP_condition()
{
	if ((MIS_SylvioCrew == LOG_Running) && (RatfordAgree ==  FALSE ) && (RatfordNeedMap ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_DRAX_WHOCAP_info()
{
	AI_Output(other,self, " DIA_DRAX_WHOCAP_01_00 " );	// Do you happen to know if there are no sailors among you?

	if(Npc_IsDead(xbs_7510_ratford) == TRUE)
	{
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_01");	//Эх, приятель...
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_02 " );	// Ratford was the captain of a merchant ship until he ended up in a colony.
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_03 " );	// But that doesn't matter anymore. Now he's dead...
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_04");	//Ясно.
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_05 " );	// Well, how can I tell you... There are.
		AI_Output(other,self, " DIA_DRAX_WHOCAP_01_06 " );	// And who is this?
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_07 " );	// Yeah, over there, my buddy Ratford is just one of them.
		AI_Output(other,self, " DIA_DRAX_WHOCAP_01_08 " );	// Are you serious?
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_09 " );	// Of course! He was the captain of a merchant ship until he ended up in a colony.
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_10 " );	// Then, drunk, he stuffed the face of the royal bailiff. And he's been here ever since.
		AI_Output(other,self, " DIA_DRAX_WHOCAP_01_11 " );	// Hmmm, you guys are funny.
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_12");	//А то!
		RatfordCap = TRUE;
	};
};

instance DIA_Drax_Sail(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = DIA_Drax_Sail_condition;
	information = DIA_Drax_Sail_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Drax_Sail_condition()
{
	if((RatfordAgree == TRUE) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Drax_Sail_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Drax_Sail_01_01 " );	// Hey buddy... (smiling) Rutford told me what you were up to.
	AI_Output(self,other, " DIA_Drax_Sail_01_02 " );	// For me, this is the best idea since I got behind the Barrier.
	AI_Output(self,other, " DIA_Drax_Sail_01_03 " );	// I have long dreamed of visiting the mainland!
	AI_Output(self,other, " DIA_Drax_Sail_01_04 " );	// They say there's plenty to do for a smart guy like me.
	AI_Output(other,self, " DIA_Drax_Sail_01_05 " );	// Dreams come true. Most importantly, don't get caught again!
	AI_Output(self,other, " DIA_Drax_Sail_01_06 " );	// Hmmm. That's right, buddy. That's for sure...
	AI_StopProcessInfos(self);
};

instance DIA_Drax_Drakar_Perm (C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = DIA_Drax_Drakar_Perm_condition;
	info = DIA_Drax_Drakar_Perm_info;
	permanent = TRUE;
	description = " How are you on the ship? " ;
};

func int DIA_Drax_Drakar_Perm_condition()
{
	if((MoveDracarBoard == TRUE) && (DraxOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Drax_Drakar_Perm_info()
{
	AI_Output(other,self, " DIA_Drax_Drakar_Perm_01_00 " );	// How are you on the ship?
	AI_Output(self,other, " DIA_Drax_Drakar_Perm_01_01 " );	// OK. If only Ratford would fix that damn steering wheel sooner!
	AI_Output(self,other, " DIA_Drax_Drakar_Perm_01_02 " );	// And then at night I see orcs in almost every corner.
	AI_Output(other,self, " DIA_Drax_Drakar_Perm_01_03 " );	// Calm down, mate. I don't think the orcs will come here anytime soon.
	AI_Output(self,other, " DIA_Drax_Drakar_Perm_01_04 " );	// Eh... (sighing) I would like your confidence.
};
