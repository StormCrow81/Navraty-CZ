

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
		AI_Output(self,other, " DIA_Drax_Hallo_01_00 " );	// Well, you must! I rarely see a true servant of Innos...
	}
	else if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_0A " );	// Well, you must! I rarely see a true servant of Adanos...
	}
	else if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_0B " );	// Well, you must! A servant of Beliar is always recognisable...
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
		AI_Output(self,other, " DIA_Drax_Hallo_01_01 " );	// Well, you must! We are always glad to see a servant of His Higness ...
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Drax_Hallo_01_02 " );	// Another tramp! 
	};
	AI_Output(other,self, " DIA_Drax_Hallo_15_03 " );	// I think your name is Drax, right? I remember you - I'm also a former prisoner...
	AI_Output(self,other, " DIA_Drax_Hallo_01_04 " );	// Yes? Ah, I don't remember you ... We hunted near the pass and saw so many green beginners.
	AI_Output(other,self, " DIA_Drax_Hallo_15_05 " );	// Well, not everyone back then made so much noise in the Old Camp.
	AI_Output(self,other, " DIA_Drax_Hallo_01_06 " );	// Now I remember - You really stirred the old place up!
	AI_Output(self,other, " DIA_Drax_Hallo_01_07 " );	// The only pity is that you didn't manage to get the Raven back then.

	if(RavenIsDead == TRUE)
	{
		AI_Output(other,self, " DIA_Drax_Hallo_15_08 " );	// Wrong, our paths crossed a little later, to his detriment.
		AI_Output(self,other, " DIA_Drax_Hallo_01_09 " );	// huh? I don't believe it!
		AI_Output(self,other, " DIA_Drax_Hallo_01_10 " );	// I don't believe it! I would like to see his ring. With my own eyes!

		if(Npc_HasItems(other,ITMI_RAVENGOLDRING) >= 1)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self, " DIA_Drax_Hallo_15_11 " );	// Here it is - look. You can even keep it.
			B_GiveInvItems(other,self,ITMI_RAVENGOLDRING,1);
			Npc_RemoveInvItems(self,ITMI_RAVENGOLDRING,1);
			AI_Output(self,other, " DIA_Drax_Hallo_01_12 " );	// (respectfully) Yes, someone did get that bastard! Well, thank you brother.
			AI_Output(other,self, " DIA_Drax_RavenRing_15_00 " );	// So do I owe you something for this ring?
			AI_Output(self,other, " DIA_Drax_RavenRing_01_01 " );	// Why not, I can see you are a good man.
			AI_Output(self,other, " DIA_Drax_RavenRing_01_02 " );	// And good men deserve good things, yes?
			B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
			AI_Output(self,other, " DIA_Drax_RavenRing_01_03 " );	// Here, take this strange stone tablet. It just hurts to look at.
			AI_Output(self,other, " DIA_Drax_RavenRing_01_04 " );	// Maybe you can deal with it.
			AI_Output(other,self, " DIA_Drax_RavenRing_01_05 " );	// Well well, thank you for this.
			DRAXHASRING = TRUE;
		}
		else
		{
			AI_Output(other,self, " DIA_Drax_Hallo_15_13 " );	// ...hell, I already sold it to someone.
			AI_Output(self,other,"DIA_Drax_Hallo_01_14");	//Oh well.
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Drax_Hallo_15_15 " );	// It will soon be his turn.
		AI_Output(self,other, " DIA_Drax_Hallo_01_16 " );	// Ha. Well, let's just say ... I want to believe you.
		AI_Output(self,other, " DIA_Drax_Hallo_01_17 " );	// Bring me his ring then. His was quite special!
		AI_Output(self,other, " DIA_Drax_Hallo_01_18 " );	// And old Drax will repay you.
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
	AI_Output(other,self, " DIA_Drax_RavenRing_01_06 " );	// I have Raven's ring!
	AI_Output(self,other,"DIA_Drax_RavenRing_01_07");	//Really?
	AI_Output(other,self, " DIA_Drax_Hallo_15_11 " );		// Here it is - admire it as much as you like. You can even keep it for yourself.
	B_GiveInvItems(other,self,ITMI_RAVENGOLDRING,1);
	Npc_RemoveInvItems(self,ITMI_RAVENGOLDRING,1);
	AI_Output(self,other, " DIA_Drax_Hallo_01_12 " );		// (respectfully) Yes, someone did get that bastard! Well, thank you brother.
	AI_Output(other,self, " DIA_Drax_RavenRing_15_00 " );	// So do I owe you something for this ring?
	AI_Output(self,other, " DIA_Drax_RavenRing_01_01 " );	// Why not, I can see you are a good man.
	AI_Output(self,other, " DIA_Drax_RavenRing_01_02 " );	// And good men deserve good things, yes?
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	AI_Output(self,other, " DIA_Drax_RavenRing_01_03 " );	// Here, take this strange stone tablet. It just hurts to look at.
	AI_Output(self,other, " DIA_Drax_RavenRing_01_04 " );	// Maybe you can deal with it.
	AI_Output(other,self, " DIA_Drax_RavenRing_01_05 " );	// Thanks for that!
	DRAXHASRING = TRUE;
	MIS_RavenRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_RavenRing,LOG_Success);
	B_LogEntry(TOPIC_RavenRing, " I brought Drax Raven's Ring. " );
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
	AI_Output(self,other, " DIA_Drax_Kapitel4_01_02 " );	// A whole bunch of orcs! And they didn't even look in our direction. They rushed behind their fence as if Beliar himself was on their heels!
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
	AI_Output(self,other, " DIA_Drax_Camper_01_02 " );	// He says that they have either a magician or some kind of prophet there, and life is calm.

	if (Npc_IsDead(ratford))
	{
		AI_Output(self,other, " DIA_Drax_Camper_01_03 " );	// And what about it? I am free and calm here.
		AI_Output(self,other, " DIA_Drax_Camper_01_04 " );	// Only now there is no one to talk to.
		AI_Output(self,other, " DIA_Drax_Camper_01_05 " );	// Though Ratford wasn't much of a talker.
	}
	else
	{
		AI_Output(self,other, " DIA_Drax_Camper_01_06 " );	// And what about it? I am free and calm here.
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
	AI_Output(other,self, " DIA_DRAX_GOHOME_01_00 " );	// Are you alright here?
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_01 " );	// Yes. This place is heavenly, quiet and calm.
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_02 " );	// I heard that the orcs attacked the castle again. Who knows what they have in mind now!
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_03 " );	// But one thing I know for sure - they are unlikely to turn up here.
	AI_Output(other,self, " DIA_DRAX_GOHOME_01_04 " );	// And what do you do here all day?
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_05 " );	// We stand guard round the clock. In turns, of course. First me, then Retford.
	AI_Output(self,other, " DIA_DRAX_GOHOME_01_06 " );	// We'll make sure to give a signal if something happens or if the orcs get too close to camp.
	AI_Output(other,self, " DIA_DRAX_GOHOME_01_07 " );	// Great. Keep up the good work.
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
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_01");	//Nope...
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_02 " );	// Ratford was the captain of a merchant ship until he ended up in the colony.
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_03 " );	// But that doesn't matter anymore. Now he's dead...
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_04");	//I see.
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_05 " );	// Well, I might know a few.
		AI_Output(other,self, " DIA_DRAX_WHOCAP_01_06 " );	// Yes?
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_07 " );	// Yeah, over there, my buddy Ratford is one of them.
		AI_Output(other,self, " DIA_DRAX_WHOCAP_01_08 " );	// Are you serious?
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_09 " );	// Of course! He was the captain of a merchant ship until he ended up in the colony.
		AI_Output(self,other, " DIA_DRAX_WHOCAP_01_10 " );	// Then, while drunk, he punched the royal bailiff. And he's been here ever since.
		AI_Output(other,self, " DIA_DRAX_WHOCAP_01_11 " );	// Hmmm, you guys are funny.
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_12");	// You know it!
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
	AI_Output(self,other, " DIA_Drax_Sail_01_01 " );	// Hey buddy... Ratford told me what you were up to.
	AI_Output(self,other, " DIA_Drax_Sail_01_02 " );	// This is the best idea since I got behind the Barrier.
	AI_Output(self,other, " DIA_Drax_Sail_01_03 " );	// I have long dreamed of visiting the mainland!
	AI_Output(self,other, " DIA_Drax_Sail_01_04 " );	// They say there's plenty to do for a smart guy like me.
	AI_Output(other,self, " DIA_Drax_Sail_01_05 " );	// Dreams come true. Most importantly, try not to get caught again!
	AI_Output(self,other, " DIA_Drax_Sail_01_06 " );	// Hmmm. That's for sure...
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
	AI_Output(other,self, " DIA_Drax_Drakar_Perm_01_00 " );	// How are things on the ship?
	AI_Output(self,other, " DIA_Drax_Drakar_Perm_01_01 " );	// OK. If only Ratford would fix that damn steering wheel sooner!
	AI_Output(self,other, " DIA_Drax_Drakar_Perm_01_02 " );	// And then at night I see orcs in almost every corner.
	AI_Output(other,self, " DIA_Drax_Drakar_Perm_01_03 " );	// Calm down, mate. I don't think the orcs will come here anytime soon.
	AI_Output(self,other, " DIA_Drax_Drakar_Perm_01_04 " );	// Eh... (sighing) I would like your confidence.
};
