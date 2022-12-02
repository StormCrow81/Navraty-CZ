

instance DIA_JACK_LI_KAP3_EXIT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 999;
	condition = dia_jack_li_kap3_exit_condition;
	information = dia_jack_li_kap3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jack_li_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jack_li_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_LI_PICKPOCKET(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 900;
	condition = dia_jack_li_pickpocket_condition;
	information = dia_jack_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_jack_li_pickpocket_condition()
{
	return  C_Robbery ( 76 , 120 );
};

func void dia_jack_li_pickpocket_info()
{
	Info_ClearChoices(dia_jack_li_pickpocket);
	Info_AddChoice(dia_jack_li_pickpocket,Dialog_Back,dia_jack_li_pickpocket_back);
	Info_AddChoice(dia_jack_li_pickpocket,DIALOG_PICKPOCKET,dia_jack_li_pickpocket_doit);
};

func void dia_jack_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_jack_li_pickpocket);
};

func void dia_jack_li_pickpocket_back()
{
	Info_ClearChoices(dia_jack_li_pickpocket);
};


instance DIA_JACK_LI_STORM(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_storm_condition;
	information = dia_jack_li_storm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jack_li_storm_condition()
{
	return TRUE;
};

func void dia_jack_li_storm_info()
{
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_01 " );	// You've finally come to your senses! How do you feel?
	AI_Output(other,self, " DIA_Jack_LI_Storm_01_02 " );	// Head splits like it's been hit with something heavy!
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_03 " );	// Yeah, buddy... (laughs) You've had enough.
	AI_Output(other,self, " DIA_Jack_LI_Storm_01_04 " );	// What happened?
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_07 " );	// During the storm, you helped me steer the helm, and everything went well...
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_08 " );	// But in the midst of it, one of the waves hit our ship with such force that it knocked you off your feet and threw you onto the bulwark!
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_09 " );	// You must have hit your head really hard on him, because you immediately lost consciousness.
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_11 " );	// It was only by a miracle that the guys and I managed to get to you in time to drag you away from the edge. Otherwise, the next wave would have washed your insensible body overboard.
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_13 " );	// (besides himself) Damn! Yes, this storm almost sent us all to the next world!
	AI_Output(other,self, " DIA_Jack_LI_Storm_01_14 " );	// But everything seems to be ok.
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_15 " );	// Yeah, it worked out. Thank Innos that we stumbled upon this island. A little more - and our ship would have broken in two.
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_20 " );	// Oh, okay... At least you can feel completely safe in this bay.
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_23 " );	// But it's too early to rejoice. Now we need to think about how to fix our ship.
	AI_Output(other,self, " DIA_Jack_LI_Storm_01_24 " );	// Does it need repair?
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_25 " );	// Still! The storm had beaten him up.
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_26 " );	// Patch a couple of holes, of course, not a problem, but we have a broken steering wheel. Without it, we won't get far.
	AI_Output(other,self, " DIA_Jack_LI_Storm_01_27 " );	// How long will it take?
	AI_Output(self,other, " DIA_Jack_LI_Storm_01_28 " );	// Maybe a couple of days, maybe a week. I can not say exactly.
};


instance DIA_JACK_LI_REPAIR(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repair_condition;
	information = dia_jack_li_repair_info;
	permanent = FALSE;
	description = " Is there anything I can help you do with the repair? " ;
};


func int dia_jack_li_repair_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_repair_info()
{
	AI_Output(other,self, " DIA_Jack_LI_Repair_01_01 " );	// Can I help you with the repair?
	AI_Output(self,other, " DIA_Jack_LI_Repair_01_02 " );	// (thoughtfully) I don't even know. First I have to take a closer look at the damage, and then I have to figure out how to fix it.
	AI_Output(self,other, " DIA_Jack_LI_Repair_01_04 " );	// So I don't think I'll need your help right now. If only later.
	TORLOFLITIMER = Wld_GetDay();
	MIS_REPAIRSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_REPAIRSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_Running);
	B_LogEntry( TOPIC_REPAIRSHIP , " I offered to help Jack repair the ship. He said he needed to inspect all the damage first and figure out how to fix it. So for now Jack doesn't need my help. I should ask him about it later. " );
};


instance DIA_JACK_LI_REPAIRHELP(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repairhelp_condition;
	information = dia_jack_li_repairhelp_info;
	permanent = FALSE;
	description = " How is the repair going on the ship? " ;
};


func int dia_jack_li_repairhelp_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && (TORLOFLITIMER <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jack_li_repairhelp_info()
{
	AI_Output(other,self, " DIA_Jack_LI_RepairHelp_01_01 " );	// How is the ship's repair progressing?
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_02 " );	// It's good that you asked. Looks like I still need your help.
	AI_Output(other,self, " DIA_Jack_LI_RepairHelp_01_03 " );	// Sure, no problem.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_04 " );	// Let's get down to business then.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_05 " );	// Over the past few days, I've examined all the damage on the ship and come to the conclusion that most of them are quite minor.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_06 " );	// I can handle them myself. But we also have one serious problem - this is our steering wheel.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_08 " );	// It doesn't work at all! Looks like he's been completely ripped off. And without it, as you understand, the ship is absolutely uncontrollable!
	AI_Output(other,self, " DIA_Jack_LI_RepairHelp_01_10 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_11 " );	// I think that the whole problem is in one of the gears.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_12 " );	// Probably, during the storm, her teeth were torn off, and for this reason our steering wheel lost control.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_13 " );	// So if we can find a replacement for her, we'll probably solve this problem.
	AI_Output(other,self, " DIA_Jack_LI_RepairHelp_01_14 " );	// But where do we get the new gear?
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_15 " );	// That's exactly what I wanted to ask you to do. Maybe you will be lucky and you will be able to find a suitable little thing.
	AI_Output(other,self, " DIA_Jack_LI_RepairHelp_01_16 " );	// This won't be easy.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_17 " );	// I understand, but we have no other choice. Otherwise, we'll be stuck here for a long time!
	AI_Output(other,self, " DIA_Jack_LI_RepairHelp_01_18 " );	// Okay, I'll try to look for something suitable.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelp_01_19 " );	// That's great. And I, in order not to waste time in vain, will fix the rest of the damage.
	B_LogEntry( TOPIC_REPAIRSHIP , " Jack asked me to help him with a helm that had been broken in a storm. One of his gears had been torn off and the ship was now completely out of control. Jack asked me to look for a replacement for this part - something that could serve as a gear. " );
};


instance DIA_JACK_LI_REPAIRHELPDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repairhelpdone_condition;
	information = dia_jack_li_repairhelpdone_info;
	permanent = FALSE;
	description = " I found something here. " ;
};


func int dia_jack_li_repairhelpdone_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && Npc_KnowsInfo(hero,dia_jack_li_repairhelp) && (Npc_HasItems(hero,itmi_stuff_gearwheel_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_repairhelpdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Jack_LI_RepairHelpDone_01_01 " );	// I found something here.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_02 " );	// What exactly?
	AI_Output(other,self, " DIA_Jack_LI_RepairHelpDone_01_03 " );	// Here, take a look.
	B_GiveInvItems(other,self,itmi_stuff_gearwheel_02,1);
	AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_04 " );	// What an interesting thing! Where did you dig it up?
	AI_Output(other,self, " DIA_Jack_LI_RepairHelpDone_01_05 " );	// In a small pyramid located on an island.
	AI_Output(other,self, " DIA_Jack_LI_RepairHelpDone_01_07 " );	// Will it work as a gear?
	AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_08 " );	// Hmmm...(thoughtfully) We'll see.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_09");	//Ну как?
	AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_10 " );	// Incredible! Looks like it really fits!
	AI_Output(other,self, " DIA_Jack_LI_RepairHelpDone_01_11 " );	// So our helm is fine now?
	AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_12 " );	// Wait a second... This needs to be checked.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_13");	//И?
	AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_14 " );	// Yes. Everything seems to be in order. True, the management has become a little tight, but we will somehow survive.
	AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_15 " );	// The main thing is that now we can get off this island!
	AI_Output(other,self, " DIA_Jack_LI_RepairHelpDone_01_16 " );	// This is great news. When do we leave?
	MIS_REPAIRSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_SUCCESS);
	B_LogEntry( TOPIC_REPAIRSHIP , " I brought Jack a cog-shaped piece of rock that I found. And much to his surprise, this thing fit perfectly as a cog for our steering wheel. " );

	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_17 " );	// Yes, right now!

		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_18 " );	// Only first we need to inform the guys on the shore that we are weighing anchor.
			AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_19 " );	// Let's not leave them here! (laughs)
			AI_Output(other,self, " DIA_Jack_LI_RepairHelpDone_01_20 " );	// Okay, I'll pass it on to them.
			CANWAYFROMLI = TRUE ;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			Log_AddEntry( TOPIC_GATHERCREW , " Jack asked me to tell all the boys on the beach that we are weighing anchor. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_21 " );	// So just say it and we'll set sail in no time.
			AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_22");	//Хорошо.
			CANWAYFROMLI = TRUE ;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else
	{
		TORLOFLITIMERAWAY = Wld_GetDay();
		AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_23 " );	// Not so fast, mate! The helm, of course, is now in order, but this does not mean that the ship is ready to sail.
		AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_24 " );	// I haven't had time to repair some other minor damage yet, and going out to sea without being properly prepared is a dangerous business!

		if(MIS_LOSTISLAND == LOG_Running)
		{
			AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_25 " );	// Moreover, we still don't know where we are!
		}
		else if(MIS_CHANGECOURSE == LOG_Running)
		{
			AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_26 " );	// Moreover, we still haven't decided where to go.
		};

		AI_Output(self,other, " DIA_Jack_LI_RepairHelpDone_01_27 " );	// So let's not rush.
		AI_Output(other,self, " DIA_Jack_LI_RepairHelpDone_01_28 " );	// Okay, then you'll say it yourself.
	};
};


instance DIA_JACK_LI_AWAY(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_away_condition;
	information = dia_jack_li_away_info;
	permanent = TRUE;
	description = " When are we leaving? " ;
};

func int dia_jack_li_away_condition()
{
	where int daynow;
	daynow = Wld_GetDay();

	if (( MIS_REPAIRSHIP  ==  LOG_SUCCESS ) && ( CANAWAYFROMLI  ==  FALSE ) && ( TORLOFLITIMERAWAY  <= ( daynow -  1 )))
	{
		return TRUE;
	};
};

func void dia_jack_li_away_info()
{
	AI_Output(other,self, " DIA_Jack_LI_Away_01_00 " );	// When do we sail?

	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Jack_LI_Away_01_01 " );	// Yes, right now!

		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other, " DIA_Jack_LI_Away_01_02 " );	// Only first we need to inform the guys on the shore that we are weighing anchor.
			AI_Output(self,other, " DIA_Jack_LI_Away_01_03 " );	// Let's not leave them here! (laughs)
			AI_Output(other,self, " DIA_Jack_LI_Away_01_04 " );	// Okay, I'll pass it on to them.
			CANWAYFROMLI = TRUE ;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			B_LogEntry( TOPIC_GATHERCREW , " Jack asked me to tell all the guys on the beach that we are weighing anchor. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Jack_LI_Away_01_05 " );	// So just say it and we'll set sail in no time.
			AI_Output(other,self,"DIA_Jack_LI_Away_01_06");	//Хорошо.
			CANWAYFROMLI = TRUE ;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else  if ( MIS_LOST_ISLAND  == LOG_Running )
	{
		AI_Output(self,other, " DIA_Jack_LI_Away_01_07 " );	// But we still haven't found out where we are!
		AI_Output(self,other, " DIA_Jack_LI_Away_01_08 " );	// So it's too early to think about it.
		AI_Output(other,self, " DIA_Jack_LI_Away_01_09 " );	// As you say.
	}
	else if(MIS_CHANGECOURSE == LOG_Running)
	{
		AI_Output(self,other, " DIA_Jack_LI_Away_01_10 " );	// But we still haven't decided where to go!
		AI_Output(self,other, " DIA_Jack_LI_Away_01_11 " );	// So it's too early to think about it.
		AI_Output(other,self, " DIA_Jack_LI_Away_01_12 " );	// As you say.
	}
	else
	{
		AI_Output(self,other, " DIA_Jack_LI_Away_01_13 " );	// It's too soon to think about it until I've finished repairing the ship.
		AI_Output(self,other, " DIA_Jack_LI_Away_01_14 " );	// So it's better to do something useful for now.
		AI_Output(other,self, " DIA_Jack_LI_Away_01_15 " );	// As you say.
	};
};

instance DIA_JACK_LI_AWAYDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_awaydone_condition;
	information = dia_jack_li_awaydone_info;
	permanent = TRUE;
	description = " Time to go. " ;
};

func int dia_jack_li_awaydone_condition()
{
	where int daynow;
	daynow = Wld_GetDay();

	if (( CANAWAYFROMLI  ==  TRUE ) && ( NORTH CAPTAINLIAWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_jack_li_awaydone_info()
{
	var int crewlicountmiss;
	var string concatText;
	var string text;
	var string text2;
	AI_Output(other,self, " DIA_Jack_LI_AwayDone_01_00 " );	// Time to go.
	if(NOPEOPLEONLANDLI == TRUE)
	{
		AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_01 " );	// Good! We weigh anchor.
		AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_02 " );	// In the meantime, you can go and relax in your cabin. I suppose you've been running around in recent days?
		AI_Output(other,self, " DIA_Jack_LI_AwayDone_01_03 " );	// There are few.
		AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_04 " );	// Well, then go to sleep. And we'll be leaving soon.
		CAPITANORDERLIAWAY = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIONBOARD == TRUE) && (GORNLIHERE == TRUE) && (GORNLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_fighter_li,"RunAway");
			AI_Teleport(pc_fighter_li,"SHIP_DECK_03");
			GORNLIHEREDONE = TRUE;
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE) && (MILTENLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_mage_li,"RunAway");
			AI_Teleport(pc_mage_li,"SHIP_CREW_19");
			MILTENLIHEREDONE = TRUE ;
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE) && (LESTERLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_psionic_li,"RunAway");
			AI_Teleport(pc_psionic_li,"SHIP_DECK_28");
			LESTERLIHEREDONE = TRUE;
		};
		if (( Diego_IsOnBoard ==  LOG_SUCCESS ) && ( Npc_IsDead ( pc_thief_li ) ==  FALSE ) && ( DIEGOLIONBOARD  ==  TRUE ) && ( DIEGOLIHERE  ==  TRUE ) && ( DIEGOLIHEREDONE  ==  FALSE ))
		{
			Npc_ExchangeRoutine(pc_thief_li,"RunAway");
			AI_Teleport(pc_thief_li,"SHIP_CREW_04");
			DIEGOLIHEREDONE = TRUE;
		};
		if ((Angar_IsOnBoard ==  LOG_SUCCESS ) && (Npc_IsDead(djg_705_angar_li) ==  FALSE ) && ( ANGARLIONBOARD  ==  TRUE ) && ( ANGARLIHERE  ==  TRUE ) && ( ANGARLIHEREDONE  ==  FALSE )) ;
		{
			Npc_ExchangeRoutine(djg_705_angar_li,"RunAway");
			AI_Teleport(djg_705_angar_li,"SHIP_CREW_03");
			ANGARLIHEREDONE = TRUE;
		};
		if(LICREWONBOARD == TRUE)
		{
			B_GivePlayerXP(500);
			AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_06 " );	// Good. It seems that all the guys are on the ship, which means you can weigh anchor.
			AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_07 " );	// In the meantime, you can go and relax in your cabin. I suppose you've been running around in recent days?
			AI_Output(other,self, " DIA_Jack_LI_AwayDone_01_08 " );	// There are few.
			AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_09 " );	// Well, then go to sleep. And we'll be leaving soon.
			CAPITANORDERLIAWAY = TRUE;
			MIS_GATHERCREW = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_SUCCESS);
			B_LogEntry( TOPIC_GATHERCREW , " All the crew is on the ship and we are ready to go! " );
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_11 " );	// But not all the guys have returned from the shore yet! We cannot leave them.
			AI_Output(other,self, " DIA_Jack_LI_AwayDone_01_12 " );	// Who's missing?
			AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_13 " );	// Hmmm, I don't think so... (looking around)
			if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE) && (GORNLIONBOARD == FALSE))
			{
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_14");	//...Горна
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE) && (MILTENLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_15");	//...Милтена
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE) && (LESTERLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_16");	//...Лестера
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE) && (DIEGOLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_17");	//...Диего
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE) && (ANGARLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_18");	//...Кор Ангара
				crewlicountmiss = crewlicountmiss + 1;
			};
			AI_Output(self,other, " DIA_Jack_LI_AwayDone_01_19 " );	// The rest of the guys seem to be in place.
			if(crewlicountmiss >= 2)
			{
				AI_Output(other,self, " DIA_Jack_LI_AwayDone_01_20 " );	// I'll tell them to get back to the ship.
			}
			else
			{
				AI_Output(other,self, " DIA_Jack_LI_AwayDone_01_21 " );	// I'll tell him to get back to the ship.
			};
		};
	};
};


instance DIA_JACK_LI_ISLAND(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_island_condition;
	information = dia_jack_li_island_info;
	permanent = FALSE;
	description = " Where are we and what is this island? " ;
};


func int dia_jack_li_island_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_island_info()
{
	AI_Output(other,self, " DIA_Jack_LI_Island_01_01 " );	// Where are we and what is this island?
	AI_Output(self,other, " DIA_Jack_LI_Island_01_02 " );	// How do I know, mate? (laughs) I see this island for the first time just like you! I have no idea where we are.
	AI_Output(other,self, " DIA_Jack_LI_Island_01_04 " );	// It turns out that we are seriously confused.
	AI_Output(self,other, " DIA_Jack_LI_Island_01_05 " );	// Looks like it. Only Innos knows where we've gone.
	AI_Output(self,other, " DIA_Jack_LI_Island_01_06 " );	// Of course, you can swim at random, but I'm afraid it won't end well.
	AI_Output(other,self, " DIA_Jack_LI_Island_01_07 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_Jack_LI_Island_01_13 " );	// We need to understand in which part of the ocean we ended up - then we can return to our previous course.
	AI_Output(other,self, " DIA_Jack_LI_Island_01_14 " );	// But how?
	AI_Output(self,other, " DIA_Jack_LI_Island_01_15 " );	// I don't know... Perhaps we should take a walk around the island itself. And there, you see, something will clear up.
	MY_LOST ISLAND = LOG_Running;
	Log_CreateTopic(TOPIC_LOSTISLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_Running);
	B_LogEntry( TOPIC_LOSTISLAND , " It looks like we're completely lost. Our captain has absolutely no idea what kind of island this is and where we ended up. The only thing we can do in this situation is to try to figure it out on our own and find out where we are we are. " );
	Log_AddEntry( TOPIC_LOSTISLAND , " After talking with Jack about this, we both agreed that the first thing to do would be to just visit this mysterious island and inspect it carefully. Maybe we can find something there. " );
};


instance DIA_JACK_LI_ISLANDPROGRESS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_islandprogress_condition;
	information = dia_jack_li_islandprogress_info;
	permanent = FALSE;
	description = " Look, I found this tile. " ;
};


func int dia_jack_li_islandprogress_condition()
{
	if (( MY_LOST_COUNTRY  == LOG_Running ) && ( Npc_HasItems ( hero , itwr_lost_countrymap ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dia_jack_li_islandprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Jack_LI_IslandProgress_01_00 " );	// Look, I found this tile.
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_01 " );	// What a fun thing! You seem to be lucky for things like this... (laughs)
	AI_Output(other,self, " DIA_Jack_LI_IslandProgress_01_03 " );	// It has some strange symbols on it. What they mean, I still don't understand.
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_05 " );	// Let me see.
	AI_Output(other,self, " DIA_Jack_LI_IslandProgress_01_06 " );	// Here, take this.
	B_GiveInvItems(other,self,itwr_lostislandmap,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_07 " );	// Hmmm... (thoughtfully) This is all very strange.
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_08 " );	// Although if you look closely, it all looks very much like... (hesitantly)
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_09");	//На что?
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_10 " );	// Not exactly sure, but this stone tile looks a bit like a map.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_11");	//Карту?
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_12 " );	// Yes! That's just what she shows, it's not entirely clear.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_13 " );	// It looks like some numbers are still stamped here. Perhaps they are the key to deciphering what is depicted on the card itself.
	AI_Output(other,self, " DIA_Jack_LI_IslandProgress_01_14 " );	// How can we understand this?
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_15 " );	// Don't know yet! Although... I have a suspicion that these numbers mean the latitude and longitude of this island.
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_18 " );	// If it turns out that way, then we can easily determine where we are now. True, for this I would need a marine sextant.
	AI_Output(other,self, " DIA_Jack_LI_IslandProgress_01_20 " );	// Is this a problem?
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_21 " );	// Yes, since I simply don't have it. And without it, I won't be able to make accurate calculations.
	AI_Output(other,self, " DIA_Jack_LI_IslandProgress_01_22 " );	// Good. I will try to find it.
	AI_Output(self,other, " DIA_Jack_LI_IslandProgress_01_23 " );	// Try. Although I do not think that here, on the island, you can find it. But maybe you will be lucky as always... (laughs)
	CAPNEEDSEXTANT = TRUE;
	B_LogEntry( TOPIC_LOSTISLAND , " I showed Jack a stone tile I found in the ancient ruins on the island. He examined it carefully and assumed that the tile depicted some kind of mysterious map. In addition, several numbers are scrawled on the back of this tablet, which may mean that "something very important - like the latitude and longitude of the island. However, to verify this version, Jack needs a sextant, otherwise his calculations will be inaccurate. " );
};


instance DIA_JACK_LI_ISLANDPROGRESSNEXT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_islandprogressnext_condition;
	information = dia_jack_li_islandprogressnext_info;
	permanent = FALSE;
	description = " I have a sextant. " ;
};


func int dia_jack_li_islandprogressnext_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (CAPNEEDSEXTANT == TRUE) && (Npc_HasItems(hero,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_islandprogressnext_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Jack_LI_IslandProgressNext_01_00 " );	// I have a sextant.
	AI_Output(self,other, " DIA_Jack_LI_IslandProgressNext_01_01 " );	// (surprised) Really? But where did you get it from?
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_02");	//Не важно.
	AI_Output(self,other, " DIA_Jack_LI_IslandProgressNext_01_03 " );	// Okay. Give it here.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_04");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other, " DIA_Jack_LI_IslandProgressNext_01_05 " );	// Great! Now I can finally decipher those strange symbols.
	AI_Output(other,self, " DIA_Jack_LI_IslandProgressNext_01_06 " );	// And how long will it take you?
	AI_Output(self,other, " DIA_Jack_LI_IslandProgressNext_01_07 " );	// I think not more than a couple of days.
	TORLOFDESCRTIMER = Wld_GetDay();
	TORLOFBEGINSEARCH = TRUE;
	B_LogEntry( TOPIC_LOSTISLAND , " I've got a sextant for Jack, and now he can start his calculations. According to him, it will take no more than two days. " );
};


instance DIA_JACK_LI_SEARCH(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_search_condition;
	information = dia_jack_li_search_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jack_li_search_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_LOSTISLAND == LOG_Running) && (TORLOFBEGINSEARCH == TRUE) && (TORLOFBEGINSEARCH <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jack_li_search_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other, " DIA_Jack_LI_Search_01_00 " );	// Good to have you here. I have already finished my calculations.
	AI_Output(other,self, " DIA_Jack_LI_Search_01_01 " );	// And how are you doing?
	AI_Output(self,other, " DIA_Jack_LI_Search_01_04 " );	// We seem to be right in assuming that these characters actually mean something.
	AI_Output(self,other, " DIA_Jack_LI_Search_01_05 " );	// I checked our previous heading on the chart and made a slight correction for possible drift during the storm.
	AI_Output(self,other, " DIA_Jack_LI_Search_01_06 " );	// And then I substituted in my calculations the numbers that were drawn on the back of the stone tile you found. And guess what, they came!
	AI_Output(self,other, " DIA_Jack_LI_Search_01_09 " );	// If we overlay them on the map in a certain sequence, then they indicate the place where we could well be at the moment.
	AI_Output(self,other, " DIA_Jack_LI_Search_01_10 " );	// Of course, my calculations are not entirely accurate. But at least it already gives a rough idea of ​​what to do and where to sail.
	AI_Output(other,self, " DIA_Jack_LI_Search_01_11 " );	// Are you saying we can get off this island whenever we want?
	AI_Output(self,other, " DIA_Jack_LI_Search_01_12 " );	// To the point! (laughs) As soon as the ship is ready to sail, we can weigh anchor.
	AI_Output(other,self, " DIA_Jack_LI_Search_01_13 " );	// Then let's not waste time and get down to business.
	AI_Output(self,other, " DIA_Jack_LI_Search_01_17 " );	// Yes, and more. Here, take this card. It marks the island itself and the exact course to it.
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(self,other, " DIA_Jack_LI_Search_01_18 " );	// You may still need this item. And if not, then still let it be kept by you.
	MIS_LOSTISLAND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_SUCCESS);
	B_LogEntry( TOPIC_LOSTISLAND , " Jack told me that he had finished his calculations. They seemed to be quite successful. The tile I found on this island was indeed a kind of map, and the entries on it helped Jack with a high degree of probability to determine our current location So, as soon as our ship gets the proper look, we can finally hit the road from this island. " );
};


instance DIA_JACK_LI_ABOUTISLAND(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_aboutisland_condition;
	information = dia_jack_li_aboutisland_info;
	permanent = FALSE;
	description = " I wonder if anyone lives on this island? " ;
};


func int dia_jack_li_aboutisland_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_island))
	{
		return TRUE;
	};
};

func void dia_jack_li_aboutisland_info()
{
	AI_Output(other,self, " DIA_Jack_LI_AboutIsland_01_01 " );	// I wonder if anyone lives on this island?
	AI_Output(self,other, " DIA_Jack_LI_AboutIsland_01_02 " );	// Hardly. It appears to be completely uninhabited.
	AI_Output(other,self, " DIA_Jack_LI_AboutIsland_01_03 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_Jack_LI_AboutIsland_01_04 " );	// Eh, boy... (sadly) I'm not sure about anything anymore.
	AI_Output(self,other, " DIA_Jack_LI_AboutIsland_01_05 " );	// But if you think logically, then our appearance here could not go unnoticed. If someone lived here, they would certainly have already made themselves felt.
	AI_Output(self,other, " DIA_Jack_LI_AboutIsland_01_07 " );	// In the meantime, apart from a couple of fire lizards on the shore, we have not met anyone.
	AI_Output(other,self, " DIA_Jack_LI_AboutIsland_01_08 " );	// But things can change.
	AI_Output(self,other, " DIA_Jack_LI_AboutIsland_01_09 " );	// (nervously) Maybe. But for me, it's better to have fewer surprises.
};


instance DIA_JACK_LI_WHEREGUYS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_whereguys_condition;
	information = dia_jack_li_whereguys_info;
	permanent = FALSE;
	description = " Where are all the other guys? " ;
};


func int dia_jack_li_whereguys_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_whereguys_info()
{
	AI_Output(other,self, " DIA_Jack_LI_WhereGuys_01_01 " );	// Where are all the other guys?
	AI_Output(self,other, " DIA_Jack_LI_WhereGuys_01_02 " );	// Most of the guys went ashore as soon as we landed on this island.
	AI_Output(other,self,"DIA_Jack_LI_WhereGuys_01_03");	//Зачем?
	AI_Output(self,other, " DIA_Jack_LI_WhereGuys_01_04 " );	// They said they wanted to scout the immediate surroundings of this island.
	AI_Output(self,other, " DIA_Jack_LI_WhereGuys_01_05 " );	// Although, most likely, it's something else.
	AI_Output(other,self,"DIA_Jack_LI_WhereGuys_01_06");	//То есть?
	AI_Output(self,other, " DIA_Jack_LI_WhereGuys_01_07 " );	// To me, they're just scared. So they did not want to stay on this ship anymore.
	AI_Output(self,other, " DIA_Jack_LI_WhereGuys_01_08 " );	// It's me, an old sea dog, no stranger to this kind of thing... (laughs) I've seen storms and stronger ones!
	AI_Output(self,other, " DIA_Jack_LI_WhereGuys_01_09 " );	// But he apparently scared the rest quite a bit.
	AI_Output(self,other, " DIA_Jack_LI_WhereGuys_01_10 " );	// And after everything they've been through, for most of them, this piece of land seemed to be the best place on earth!
	AI_Output(self,other, " DIA_Jack_LI_WhereGuys_01_11 " );	// At least it showed on their faces.
};


instance DIA_JACK_LI_WHEREGOLD(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_wheregold_condition;
	information = dia_jack_li_wheregold_info;
	permanent = FALSE;
	description = " Where did my gold go? " ;
};


func int dia_jack_li_wheregold_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm) && (MIS_MISSMYGOLD == LOG_Running) && (BEGINGOLDSEEK == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_li_wheregold_info()
{
	AI_Output(other,self, " DIA_Jack_LI_WhereGold_01_01 " );	// Where did my gold go?
	AI_Output(self,other, " DIA_Jack_LI_WhereGold_01_02 " );	// What are you talking about, mate?
	AI_Output(other,self, " DIA_Jack_LI_WhereGold_01_03 " );	// About the big pile of gold we took from the island of Irdorath. It was in the hold of our ship!
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_04");	//А что с ним?
	AI_Output(other,self, " DIA_Jack_LI_WhereGold_01_05 " );	// Now it's not there!
	AI_Output(self,other, " DIA_Jack_LI_WhereGold_01_08 " );	// Sorry mate, but I have no idea where it went.
	AI_Output(self,other, " DIA_Jack_LI_WhereGold_01_09 " );	// And how could I put such a pile of gold in my pocket?
	AI_Output(other,self, " DIA_Jack_LI_WhereGold_01_10 " );	// M-yes, that's also true... And what should I do now?
	AI_Output(self,other, " DIA_Jack_LI_WhereGold_01_11 " );	// Try asking other guys about it - maybe they know something.
	BEGINGOLDSEEK = TRUE;
	Wld_InsertItem(itmi_misstorlofthing,"FP_ITEM_CAPITANTHING");
	B_LogEntry( TOPIC_MISSMYGOLD , " Jack says he doesn't know where my gold went. He told me to ask the other guys about it. " );
};


instance DIA_JACK_LI_MISSCOMPAS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_misscompas_condition;
	information = dia_jack_li_misscompas_info;
	permanent = FALSE;
	description = "The bugle said you lost your compass. " ;
};


func int dia_jack_li_misscompas_condition()
{
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLABOUTCOMPAS == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		return TRUE;
	};
};

func void dia_jack_li_misscompas_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Jack_LI_MissCompas_01_01 " );	// Horn said you lost your compass.
	AI_Output(self,other, " DIA_Jack_LI_MissCompas_01_02 " );	// (frustrated) Yes, there is such a thing! It must have fallen out of my pocket during the storm.
	AI_Output(other,self, " DIA_Jack_LI_MissCompas_01_06 " );	// Looks like this compass meant a lot to you.
	AI_Output(self,other, " DIA_Jack_LI_MissCompas_01_07 " );	// Eh! (sadly) This little thing was really dear to me - a keepsake from an old friend of mine!
	AI_Output(self,other, " DIA_Jack_LI_MissCompas_01_08 " );	// I always thought it brought me luck, and trust me, it did!
	AI_Output(self,other, " DIA_Jack_LI_MissCompas_01_09 " );	// But now I understand that this very luck turned away from me this time.
	AI_Output(other,self, " DIA_Jack_LI_MissCompas_01_10 " );	// Have you tried searching for it?
	AI_Output(self,other, " DIA_Jack_LI_MissCompas_01_11 " );	// Tried, of course. I searched the entire upper deck, but it turned out to be in vain - he is not here!
	AI_Output(self,other, " DIA_Jack_LI_MissCompas_01_12 " );	// So, most likely, he was simply washed overboard by a wave, and nothing can be done about it.
	B_LogEntry( TOPIC_MISSMYGOLD , " I asked Jack about his compass. He seems really upset about it missing. He searched the entire upper deck hoping to find it, but all in vain. " );
};


instance DIA_JACK_LI_WHEREGOLDDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_wheregolddone_condition;
	information = dia_jack_li_wheregolddone_info;
	permanent = FALSE;
	description = " Is this your compass by any chance? " ;
};


func int dia_jack_li_wheregolddone_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running) && (Npc_HasItems(hero,itmi_misstorlofthing) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_wheregolddone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_01 " );	// Is this your compass by any chance?
	B_GiveInvItems(other,self,itmi_misstorlofthing,1);
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_04 " );	// (enthusiastic) My compass! How did you manage to find it?
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_06 " );	// The question is different - where did I find it.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_07");	//И где же?
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_08 " );	// I found it where my pile of gold used to be.
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_09 " );	// What are you implying?
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_10 " );	// To the fact that you probably know something about this!
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_11 " );	// But I already told you that I have no idea where it is... (confused)
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_12 " );	// If I were you, I'd rather tell the whole truth.
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_13 " );	// Truth? (quite confused) But...
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_15 " );	// Oh, okay. In general ... (he hesitated) Much to the regret of many crew members, he had to be thrown overboard.
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_17 " );	// That is, how to throw it away?
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_18 " );	// And so! The ship gave a strong list, and if we had not done this, then everyone would have gone to feed the fish.
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_19 " );	// You threw away ALL the gold?!
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_20 " );	// Sorry, but I somehow forgot to think about it then... (snidely) It wasn't before.
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_22 " );	// Why was everyone hiding this from me?
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_23 " );	// We thought you'd be very upset, so we pretended we didn't know anything about your gold.
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_25 " );	// You were right - I'm really upset!
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_26 " );	// Buddy! (smiles) If I were you, I wouldn't get too upset.
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_27 " );	// Gold is a profitable business, and you still have time to become rich.
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_28 " );	// Better thank Innos for keeping us all alive.
	AI_Output(other,self, " DIA_Jack_LI_WhereGoldDone_01_29 " );	// Well, yes, you're probably right.
	AI_Output(self,other, " DIA_Jack_LI_WhereGoldDone_01_30 " );	// Then let's stop talking and get on with more important things.
	MIS_MISSMYGOLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_SUCCESS);
	B_LogEntry( TOPIC_MISSMYGOLD , " Now everything became clear - my gold was simply thrown overboard during a storm, because due to the heavy workload, our ship listed and could easily capsize. The guys did not want to tell me the whole truth, because they thought that I would be very upset because of that. They were right, but I'll get over this loss somehow. " );
};


instance DIA_JACK_LI_HALLO(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 4;
	condition = dia_jack_li_hallo_condition;
	information = dia_jack_li_hallo_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int dia_jack_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_aboutisland) && Npc_KnowsInfo(hero,dia_jack_li_whereguys) && Npc_KnowsInfo(hero,dia_jack_li_island))
	{
		return TRUE;
	};
};

func void dia_jack_li_hallo_info()
{
	AI_Output(other,self, " DIA_Jack_LI_Hallo_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Jack_LI_Hallo_01_01 " );	// So far, yes.
};


instance DIA_JACK_LI_BRINGFOODDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_bringfooddone_condition;
	information = dia_jack_li_bringfooddone_info;
	permanent = FALSE;
	description = " How are we doing with the provisions? " ;
};


func int dia_jack_li_bringfooddone_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (GORNTELLABOUTMEAT == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24))
	{
		return TRUE;
	};
};

func void dia_jack_li_bringfooddone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Jack_LI_BringFoodDone_01_01 " );	// How are we doing with provisions?
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDone_01_02 " );	// Not very good. Our stocks are already running low. Why do you ask?
	AI_Output(other,self, " DIA_Jack_LI_BringFoodDone_01_04 " );	// Some guys complain that you cut their daily food allowances.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDone_01_06 " );	// And I had no other choice. Knowing the appetites of some of our guys, I believe that in a couple of days we would have nothing left.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDone_01_08 " );	// Especially for Gorn! If this troglodyte is allowed into the galley, then in one sitting it will destroy all our food supplies! And what are we going to do then?
	AI_Output(other,self, " DIA_Jack_LI_BringFoodDone_01_12 " );	// I brought you a lot of fresh meat. There are five dozen pieces.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDone_01_13 " );	// Meat? What, did you go hunting?
	AI_Output(other,self, " DIA_Jack_LI_BringFoodDone_01_14 " );	// Well, yes - walked around the island a bit, shot a couple of vile creatures. So take it.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDone_01_19 " );	// No-no-no! (grouchily) I'm not going to take this meat from you just like that.
	AI_Output(other,self, " DIA_Jack_LI_BringFoodDone_01_20 " );	// Why is this?
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDone_01_21 " );	// I don't have time to mess around with it. And so things are up to the throat!
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDone_01_22 " );	// And you can't leave it raw either, otherwise it will quickly deteriorate.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDone_01_23 " );	// Go to the galley and fry all these pieces well. And then come back to me.
	B_LogEntry( TOPIC_BRINGFOOD , " Jack was surprised that I managed to get such a quantity of fresh meat. However, he refused to take it - he has no time to prepare it now. Jack asked me to go to the galley and fry each piece, and then bring them to him. " );
};


instance DIA_JACK_LI_BRINGFOODDONEEXT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_bringfooddoneext_condition;
	information = dia_jack_li_bringfooddoneext_info;
	permanent = FALSE;
	description = " I've fried meat. " ;
};


func int dia_jack_li_bringfooddoneext_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_jack_li_bringfooddone) && (Npc_HasItems(hero,ItFoMutton) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_jack_li_bringfooddoneext_info()
{
	AI_Output(other,self, " DIA_Jack_LI_BringFoodDoneExt_01_01 " );	// I fried the meat like you asked.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_01_02 " );	// If so, then give it here.
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	if(GORNTELLABOUTMEAT == TRUE)
	{
		Info_AddChoice(dia_jack_li_bringfooddoneext, " Here you go...(give 14 pieces of meat and apples) " ,dia_jack_li_bringfooddoneext_fifty);
	};
	Info_AddChoice(dia_jack_li_bringfooddoneext,"Вот, держи.",dia_jack_li_bringfooddoneext_sixty);
};

func void dia_jack_li_bringfooddoneext_fifty()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,14);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,14);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_Fifty_01_01 " );	// Hmmm... Where's everything else? I thought you had more meat then than you do now.
	AI_Output(other,self, " DIA_Jack_LI_BringFoodDoneExt_Fifty_01_03 " );	// I decided to eat a little.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_Fifty_01_04 " );	// M-yes, buddy... (surprised) Well, you have an appetite! You've eaten at least ten pieces!
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_Fifty_01_09 " );	// Okay, after all, you're the one who got us that meat.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_Fifty_01_11 " );	// I just wanted to increase the daily ration for all our guys a little. And they've been a little sluggish lately.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_Fifty_01_13 " );	// Eh... But why now... Thank you anyway.
	NOTTHANKSTELLALLMEAT = TRUE;
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	; _ _ _ _ _ _
};

func void dia_jack_li_bringfooddoneext_sixty()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,24);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,24);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_Sixty_01_01 " );	// Great! Now the guys will certainly have something to eat in the coming days.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_Sixty_01_02 " );	// And I'll even be able to slightly increase the daily ration for all of our crew members.
	AI_Output(self,other, " DIA_Jack_LI_BringFoodDoneExt_Sixty_01_03 " );	// After a few days of a little hunger strike, this will surely be good news for them.
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	THANKSTELLALLMEAT = TRUE;
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry( TOPIC_BRINGFOOD , " I gave Jack all the grilled meat, and now he can slightly increase the daily ration for all the crew members of our ship. " );
};


instance DIA_JACK_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecave_condition;
	information = dia_jack_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I have some interesting news. " ;
};


func int dia_jack_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && ((FINDLIORE_CAVE_01 == TRUE) || (FINDLIORE_CAVE_02 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_01 " );	// I have some interesting news.
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_02 " );	// And what are they?
	if((FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_03 " );	// I discovered several caves with huge deposits of magical ores.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_04 " );	// (surprised) Really?
		AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_05 " );	// I think this whole island is just crammed to the ground with her.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_06 " );	// (thoughtfully) Well, this is really quite unusual news.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_07 " );	// Magical ore deposits are very rare! Especially, as you say, in such huge sizes.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_08 " );	// As far as I know, until recently, such reserves were only in the Valley of Mines, until the orcs came there.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_09 " );	// So, if you're right, this is truly a great discovery!
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_10 " );	// Though I still don't really believe it... (doubtfully) You probably confused magic ore with ordinary stones.
		AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_11 " );	// And what do I need to do for you to believe this?
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_12 " );	// (thoughtfully) Perhaps if I saw this ore with my own eyes, it would completely clarify the situation.
		AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_13 " );	// Then come with me. I'll show you one of the caves.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_14 " );	// It won't work, buddy... (smiles) I have absolutely no time for this right now.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_15 " );	// Besides, I haven't finished fixing our ship yet.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_16 " );	// If you don't mind, just bring me a small piece of the ore you found on this island.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_17 " );	// I think this will be quite enough to fully verify your words.
		AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_18 " );	// Good. I'll bring the ore.
		LITESTOK = TRUE;
		B_LogEntry( TOPIC_FINDMAGICORECAVE , " I told Jack that I discovered several caves on the island with huge deposits of magic ore. As proof of my words, he asked me to bring him a small piece of this rock. " );
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_19 " );	// In one of the caves on this island, I discovered large deposits of magical ore.
		AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_20 " );	// There may be even more hoards lurking on this island.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_21 " );	// (thoughtfully) Well, this is really quite unusual news.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_22 " );	// Finding deposits of magical ore is a very big success! Especially, as you say, in such large sizes.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_23 " );	// As far as I know, until recently, such reserves were only in the Valley of Mines, until the orcs came there.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_24 " );	// So if you're right, it will be a truly great discovery!
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_25 " );	// Though I can hardly believe it... (doubtfully) You must have confused ore with ordinary stones.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_26 " );	// In addition, the deposits you found in this cave do not yet indicate that there can be a lot of it here.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_27 " );	// This could just be an accident!
		AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCave_01_28 " );	// And what should I do now?
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_29 " );	// If I were you, I'd try to explore this island more carefully.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_30 " );	// Maybe this would clear things up a bit with the ore you found.
		AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCave_01_31 " );	// So, when you find something else interesting, then we'll talk.
		LIBEFORETESTOK = TRUE;
		B_LogEntry( TOPIC_FINDMAGICORECAVE , " I informed Jack that I discovered a cave with large deposits of magical ore on the island. He strongly doubted my words and asked me to more carefully examine the island in order to find more evidence of the presence of this rock here. " );
	};
};


instance DIA_JACK_LI_FINDMAGICORECAVEPROGRESS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecaveprogress_condition;
	information = dia_jack_li_findmagicorecaveprogress_info;
	permanent = FALSE;
	description = " I've explored the island. " ;
};


func int dia_jack_li_findmagicorecaveprogress_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == TRUE) && (FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecaveprogress_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveProgress_01_01 " );	// I explored the island...
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_02");	//И?
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveProgress_01_03 " );	// ...and found another cave. There is even more ore in it than in the first one!
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveProgress_01_04 " );	// Are you sure about this?
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveProgress_01_05 " );	// Are my words not enough?
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveProgress_01_06 " );	// Sure enough! (sarcastically) I just still can't believe that we're so lucky!
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveProgress_01_07 " );	// And what do I need to do so that you finally believe in this?
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveProgress_01_08 " );	// (thoughtfully) Perhaps if I saw this ore with my own eyes, it would completely clarify the situation.
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveProgress_01_09 " );	// Then come with me. I'll show you one of the caves.
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveProgress_01_10 " );	// It won't work, mate. I have absolutely no time for this right now.
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveProgress_01_11 " );	// Besides, I haven't finished fixing our ship yet!
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveProgress_01_12 " );	// If you don't mind, just bring me a small piece of the ore you found on this island.
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveProgress_01_13 " );	// I think this will be quite enough to fully verify your words.
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveProgress_01_14 " );	// Good. I'll bring the ore.
	LITESTOK = TRUE;
	B_LogEntry( TOPIC_FINDMAGICORECAVE , " I told Jack that I found another cave with deposits of magical ore. He listened to me calmly, and then asked me to bring him a small piece of this rock to finally verify the veracity of my words. " );
};


instance DIA_JACK_LI_FINDMAGICORECAVEDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecavedone_condition;
	information = dia_jack_li_findmagicorecavedone_info;
	permanent = FALSE;
	description = " I brought you a piece of that ore. " ;
};


func int dia_jack_li_findmagicorecavedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (TESTNUGGETGAVE == TRUE) && (Npc_HasItems(hero,itmi_testnugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecavedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveDone_01_01 " );	// I brought you a piece of that ore.
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveDone_01_02 " );	// (sarcastically) Show it to me.
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveDone_01_03 " );	// Vot, admire.
	B_GiveInvItems(other,self,itmi_testnugget,1);
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveDone_01_04 " );	// (very surprised) Yeah man - looks like you were right!
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveDone_01_05 " );	// This is indeed a magical ore. And it seems to be excellent quality too!
	AI_Output(other,self, " DIA_Jack_LI_FindMagicOreCaveDone_01_06 " );	// Do you believe me now?
	AI_Output(self,other, " DIA_Jack_LI_FindMagicOreCaveDone_01_07 " );	// I'm sorry I doubted your words. I'm just used to believing only what I saw myself.
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_08");	//Понимаю.
	MIS_FINDMAGICORECAVE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_SUCCESS);
	B_LogEntry( TOPIC_FINDMAGICORECAVE , " I brought Jack a piece of ore that I chipped from magic rock. After that, he stopped doubting my words. " );
};


instance DIA_JACK_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_changecourse_condition;
	information = dia_jack_li_changecourse_info;
	permanent = FALSE;
	description = " So what are we going to do now? " ;
};


func int dia_jack_li_changecourse_condition()
{
	if(MIS_FINDMAGICORECAVE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jack_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_01_01 " );	// And what are we going to do now?
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_01_03 " );	// Of course, it would be nice to get our hands on all this ore. We could get a huge pile of gold for it on the mainland!
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_01_05 " );	// Sounds tempting.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_01_06 " );	// Yes... (thoughtfully) But how do we do it?
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_01_07 " );	// Our ship is already packed to capacity. And the ore weighs a lot.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_01_08 " );	// Besides, it still needs to be mined somehow, and we are unlikely to make good miners.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_01_09 " );	// What about you? Do you have any ideas about this?
	Info_ClearChoices(dia_jack_li_changecourse);
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		Info_AddChoice(dia_jack_li_changecourse, " I think we should report this ore to Lord Hagen. " ,dia_jack_li_changecourse_paladin);
	};
	Info_AddChoice(dia_jack_li_changecourse, " We can sell this island along with the ore. " ,dia_jack_li_changecourse_sell);
	Info_AddChoice(dia_jack_li_changecourse, " Let's stay on the island and mine. " ,dia_jack_li_changecourse_here);
};

func void dia_jack_li_changecourse_paladin()
{
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Paladin_01_01 " );	// I think we should report this ore to Lord Hagen.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Paladin_01_02 " );	// (puzzled) What? Give this ore to the paladins?
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Paladin_01_03 " );	// Without her, they have no chance of winning this war.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Paladin_01_04 " );	// So what? Perhaps they have already lost it!
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Paladin_01_05 " );	// And we don't even know exactly how things are on the mainland. But, according to rumors, the orcs are already in charge there!
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Paladin_01_06 " );	// If so, then we will not need this ore at all.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Paladin_01_07 " );	// Eh... Okay, let it be your way.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Paladin_01_08 " );	// But then we'll have to go back to Khorinis. I don't think most guys will like this idea...
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Paladin_01_10 " );	// I'll try to persuade them.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Paladin_01_11 " );	// As you say. Then let me know if you succeed.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Paladin_01_12 " );	// In any case, this question is up to the rest of the guys. As most of them decide, so be it!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_13");	//Конечно.
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry( TOPIC_CHANGECOURSE , " Now we need to decide what to do with the ore we found on this mysterious island. I suggested that Jack return to Khorinis and tell the paladins about it, but he did not really like this idea. We came to the conclusion that first we need to find out the opinion of other members of our team. And then, as most of them decide, it will be so. " );
	Info_ClearChoices(dia_jack_li_changecourse);
};

func void dia_jack_li_changecourse_sell()
{
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Sell_01_01 " );	// We can sell this island along with the ore!
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Sell_01_02 " );	// Interesting... (doubtfully) And who will buy it from us?
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Sell_01_04 " );	// Maybe paladins?
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Sell_01_05 " );	// Hmmm... (thoughtfully) Well, the idea is not bad at all.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Sell_01_06 " );	// Given their situation, they'll probably jump at this offer happily.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Sell_01_07 " );	// But which of the paladins will be able to accept our conditions?
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Sell_01_08 " );	// Perhaps we should take this to Lord Hagen.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Sell_01_10 " );	// Yes, you're probably right. But then we will have to return to Khorinis. I don't think most guys will like this idea.
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Sell_01_13 " );	// I'll try to persuade them.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Sell_01_14 " );	// Okay. Then let me know if you succeed.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Sell_01_15 " );	// In any case, this question is up to the rest of the guys. As most of them decide, so be it!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_16");	//Конечно.
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry( TOPIC_CHANGECOURSE , " Now we need to decide what to do with the ore we found on this mysterious island. I suggested that Jack sell this ore to the paladins, and he liked this idea. But for this we will have to return to Khorinis, and so, first we need to find out the opinion of other members of our team. And then, as most of them decide, it will be so. " );
	Info_ClearChoices(dia_jack_li_changecourse);
};

func void dia_jack_li_changecourse_here()
{
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourse_Here_01_01 " );	// Let's stay on the island and mine.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Here_01_02 " );	// I don't think this is a good idea.
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Here_01_03");	//Почему?
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Here_01_04 " );	// Yes, because even if we start working here from morning till night with a pick in our hands, it will still not give us anything.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Here_01_05 " );	// It will take years to get enough ore!
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Here_01_06 " );	// Besides, I'm not going to spend the rest of my life on this rotten island. He's already got me fed up with it!
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourse_Here_01_08 " );	// So it's better if you put this idea out of your head.
};


instance DIA_JACK_LI_CHANGECOURSEDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_changecoursedone_condition;
	information = dia_jack_li_changecoursedone_info;
	permanent = FALSE;
	description = " I've talked to all the guys. " ;
};


func int dia_jack_li_changecoursedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_SUCCESS) && (READYCHANGECOURSE == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_li_changecoursedone_info()
{
	AI_Output(other,self, " DIA_Jack_LI_ChangeCourseDone_01_01 " );	// I talked to all the guys.
	AI_Output(self,other, " DIA_Jack_LI_ChangeCourseDone_01_02 " );	// And what did they say?
	if(CREWAGREEAWAYBACKPAL > CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Jack_LI_ChangeCourseDone_01_03 " );	// Most of them agree to sail to Khorinis to help the paladins.
		AI_Output(self,other, " DIA_Jack_LI_ChangeCourseDone_01_05 " );	// Well, okay... If the majority decides so, then so be it!
		AI_Output(self,other, " DIA_Jack_LI_ChangeCourseDone_01_06 " );	// One can only hope that Lord Hagen and his people will really benefit from all this.
		B_LogEntry( TOPIC_CHANGECOURSE , " As a result, taking into account the opinion of the majority of the team members, it was decided to go back to Khorinis to inform the paladins about the magic ore we found on the island. " );
		LIGOFORFREE = TRUE;
	}
	else if(CREWAGREEAWAYBACKPAL < CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(450);
		AI_Output(other,self, " DIA_Jack_LI_ChangeCourseDone_01_10 " );	// Most of them liked the idea of ​​demanding a decent amount of gold from the paladins for the ore we found.
		AI_Output(self,other, " DIA_Jack_LI_ChangeCourseDone_01_12 " );	// Now that's another matter! To be honest, I didn't expect anything else.
		AI_Output(other,self, " DIA_Jack_LI_ChangeCourseDone_01_13 " );	// Why such confidence?
		AI_Output(self,other, " DIA_Jack_LI_ChangeCourseDone_01_14 " );	// It's just that everyone understands what is worth risking one's life for, and what is not.
		B_LogEntry( TOPIC_CHANGECOURSE , " Most of the team liked the idea of ​​demanding gold from the paladins for the ore we found. So our course is back to Khorinis. " );
		LIGOFORGOLD = TRUE;
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Jack_LI_ChangeCourseDone_01_16 " );	// Opinions are divided. Half for helping the paladins, the rest against.
		AI_Output(self,other, " DIA_Jack_LI_ChangeCourseDone_01_17 " );	// (thoughtfully) Not an easy situation.
		AI_Output(other,self, " DIA_Jack_LI_ChangeCourseDone_01_18 " );	// And what are we going to do?
		AI_Output(self,other, " DIA_Jack_LI_ChangeCourseDone_01_19 " );	// I don't know. We should probably go back to the island after all. And there - come what may!
		AI_Output(other,self, " DIA_Jack_LI_ChangeCourseDone_01_20 " );	// Good! So let's do it.
		B_LogEntry( TOPIC_CHANGECOURSE , " As a result, the opinions of the team were divided. Half were in favor of helping the paladins, the rest were against. But despite this, Jack and I decided to still return back to Khorinis and already there decide what to do with the found by us on the island with ore. " );
		LIGOFORUNKNOWN = TRUE;
	};
	MIS_CHANGECOURSE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_SUCCESS);
};


