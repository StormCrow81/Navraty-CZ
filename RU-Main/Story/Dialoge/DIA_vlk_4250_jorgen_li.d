

instance DIA_JORGEN_LI_KAP3_EXIT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 999;
	condition = dia_jorgen_li_kap3_exit_condition;
	information = dia_jorgen_li_kap3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jorgen_li_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jorgen_li_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_LI_PICKPOCKET(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 900;
	condition = dia_jorgen_li_pickpocket_condition;
	information = dia_jorgen_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_jorgen_li_pickpocket_condition()
{
	return  C_Robbery ( 76 , 120 );
};

func void dia_jorgen_li_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_li_pickpocket);
	Info_AddChoice(dia_jorgen_li_pickpocket,Dialog_Back,dia_jorgen_li_pickpocket_back);
	Info_AddChoice(dia_jorgen_li_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_li_pickpocket_doit);
};

func void dia_jorgen_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_jorgen_li_pickpocket);
};

func void dia_jorgen_li_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_li_pickpocket);
};


instance DIA_JORGEN_LI_STORM (C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_storm_condition;
	information = dia_jorgen_li_storm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_li_storm_condition()
{
	return TRUE;
};

func void dia_jorgen_li_storm_info()
{
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_01 " );	// You've finally come to your senses! How are you feeling?
	AI_Output(other,self, " DIA_Jorgen_LI_Storm_01_02 " );	// Looks good! Only now the head is splitting, as if it had been hit with something heavy.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_03 " );	// Yeah, buddy... (laughs) you've had a pretty good time!
	AI_Output(other,self, " DIA_Jorgen_LI_Storm_01_04 " );	// What happened?
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_05 " );	// Ah, yes, you seem to remember almost nothing.
	AI_Output(other,self, " DIA_Jorgen_LI_Storm_01_06 " );	// You're right, not very many.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_07 " );	// Hmmm... (seriously) During the storm, you helped me steer the helm, and everything would be fine...
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_08 " );	// But in the midst of it, one of the waves hit our ship with such force that it knocked you off your feet and threw you onto the bulwark!
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_09 " );	// You must have hit your head really hard on him, because you immediately lost consciousness.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_11 " );	// It was only by a miracle that the guys and I managed to get to you in time to drag you away from the edge.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_12 " );	// Otherwise, your unconscious body would be washed overboard in the next wave.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_13 " );	// Damn! (besides himself) Yes, this storm almost sent us all to the next world!
	AI_Output(other,self, " DIA_Jorgen_LI_Storm_01_14 " );	// But everything seems to be ok.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_15 " );	// Yeah, it worked out... Thank Innos that we stumbled upon this island!
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_16 " );	// Just a little more - and our ship would have broken in two!
	AI_Output(other,self, " DIA_Jorgen_LI_Storm_01_17 " );	// I think you better calm down. After all, we are no longer in danger.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_18 " );	// How! (nervously) Calm down here...
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_20 " );	// Oh, okay... At least one thing pleases - the storm will never reach here.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_21 " );	// In this bay, you can feel completely safe.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_23 " );	// But it's too early to rejoice! Now we need to think about how to fix our ship.
	AI_Output(other,self, " DIA_Jorgen_LI_Storm_01_24 " );	// Does it need repair?
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_25 " );	// Still! The storm had beaten him up.
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_26 " );	// Patch a couple of holes, of course, not a problem, but we have a broken steering wheel. Without it, we won't get far!
	AI_Output(other,self, " DIA_Jorgen_LI_Storm_01_27 " );	// How long do you think this will take?
	AI_Output(self,other, " DIA_Jorgen_LI_Storm_01_28 " );	// I don't know... Maybe a couple of days, maybe a week. I can not say exactly.
	AI_Output(other,self, " DIA_Jorgen_LI_Storm_01_29 " );	// Got it.
};


instance DIA_JORGEN_LI_REPAIR (C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repair_condition;
	information = dia_jorgen_li_repair_info;
	permanent = FALSE;
	description = " Is there anything I can help you do with the repair? " ;
};


func int dia_jorgen_li_repair_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void day_jorgen_li_repair_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_Repair_01_01 " );	// Can I help you with the repair?
	AI_Output(self,other, " DIA_Jorgen_LI_Repair_01_02 " );	// You?! Hmmm... I don't even know.
	AI_Output(self,other, " DIA_Jorgen_LI_Repair_01_03 " );	// I need to get a better look at the damage first and then figure out how to fix it.
	AI_Output(self,other, " DIA_Jorgen_LI_Repair_01_04 " );	// So now your help is unlikely to be useful to me. If only later...
	AI_Output(other,self,"DIA_Jorgen_LI_Repair_01_05");	//Ясно.
	TORLOFLITIMER = Wld_GetDay();
	MIS_REPAIRSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_REPAIRSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_Running);
	B_LogEntry( TOPIC_REPAIRSHIP , " I offered to help Jorgen fix our ship. But he replied that he needed to inspect all the damage to the ship first and figure out how to fix it. So for now, Jorgen doesn't really need my help. I should ask him about it later . " );
};


instance DIA_JORGEN_LI_REPAIRHELP(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repairhelp_condition;
	information = dia_jorgen_li_repairhelp_info;
	permanent = FALSE;
	description = " How is the repair going on the ship? " ;
};


func int dia_jorgen_li_repairhelp_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && (TORLOFLITIMER <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_repairhelp_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelp_01_01 " );	// How is the ship's repair progressing?
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_02 " );	// Good thing you asked! Looks like I still need your help.
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelp_01_03 " );	// Sure, no problem.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_04 " );	// Let's get down to business then!
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_05 " );	// Over the past few days, I've examined all the damage on the ship and come to the conclusion that most of them are quite minor.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_06 " );	// I can handle them myself. But we also have one serious problem - this is our steering wheel!
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelp_01_07 " );	// What about him?
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_08 " );	// It doesn't work at all! Looks like it got ripped off completely, and now it's a completely useless thing.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_09 " );	// And without it, as you yourself understand, the ship is absolutely uncontrollable!
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelp_01_10 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_11 " );	// I think that the whole problem is in one of the gears.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_12 " );	// Apparently, during the storm, her teeth were torn off, and for this reason our steering wheel lost control.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_13 " );	// So if we can find a replacement for her, we'll probably solve this problem.
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelp_01_14 " );	// But where do we get the new gear?
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_15 " );	// That's exactly what I wanted to ask you to do. Maybe you will be lucky and you will be able to find some suitable little thing for this business!
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelp_01_16 " );	// This won't be easy.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_17 " );	// I understand, but we have no other choice... Otherwise, we'll be stuck here for a long time!
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelp_01_18 " );	// Okay, I'll try to look for something suitable.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelp_01_19 " );	// That's great! And I, so as not to waste time in vain, while I fix the rest of the damage.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_20");	//Хорошо.
	B_LogEntry( TOPIC_REPAIRSHIP , " Jorgen asked me to help him with a helm that was broken in a storm. One of the gears on our rudder was torn off and now the ship is completely uncontrollable. Jorgen asked me to look for a replacement for this part - something that could serve as a gear. " );
};


instance DIA_JORGEN_LI_REPAIRHELPDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repairhelpdone_condition;
	information = dia_jorgen_li_repairhelpdone_info;
	permanent = FALSE;
	description = " I found something here. " ;
};


func int dia_jorgen_li_repairhelpdone_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if (( MIS_REPAIRSHIP  == LOG_Running ) && Npc_KnowsInfo ( hero , dia_jorgen_li_repairhelp ) && ( Npc_HasItems ( hero , itmi_stuff_gearwheel_02 ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_jorgen_li_repairhelpdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelpDone_01_01 " );	// I found something here.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_02 " );	// What exactly?
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelpDone_01_03 " );	// Here, take a look.
	B_GiveInvItems(other,self,itmi_stuff_gearwheel_02,1);
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_04 " );	// What an interesting thing! (surprised) Where did you dig it up?
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelpDone_01_05 " );	// Yes, in one small pyramid located on the island.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_06 " );	// Not bad at all! I see you didn't waste any time.
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelpDone_01_07 " );	// Better tell me, will it fit as a gear?
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_08 " );	// Hmmm... we'll see now.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_09");	//Ну как?
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_10 " );	// Man, looks like she really fits! (joyfully) I just can't believe my eyes!
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelpDone_01_11 " );	// So our helm is fine now?
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_12 " );	// Wait a second... Check it out!
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_13");	//И?
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_14 " );	// Yes! Everything seems to be in order. True, the management has become a little tight, but we will survive it somehow.
	AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_15 " );	// The main thing is that now we can get off this island!
	AI_Output(other,self, " DIA_Jorgen_LI_RepairHelpDone_01_16 " );	// This is great news. When do we leave?
	MIS_REPAIRSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_SUCCESS);
	; _ _ _ _ _ _
	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_17 " );	// Yes, right now!
		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_18 " );	// Only first we need to inform the guys on the shore that we are weighing anchor.
			AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_19 " );	// Let's not leave them here! (laughs)
			AI_Output(other,self, " DIA_Jorgen_LI_RepairHelpDone_01_20 " );	// Okay, I'll pass it on to them.
			CANWAYFROMLI = TRUE ;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			Log_AddEntry( TOPIC_GATHERCREW , " Jorgen asked me to tell all the guys on the beach that we are weighing anchor. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_21 " );	// So just say it and we'll set sail in no time.
			AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_22");	//Хорошо.
			CANWAYFROMLI = TRUE ;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else
	{
		TORLOFLITIMERAWAY = Wld_GetDay();
		AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_23 " );	// Not so fast, mate! The steering wheel, of course, is now in order, but this does not mean that the ship is completely and completely ready to sail.
		AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_24 " );	// I haven't had time to repair some of the other minor damage yet, and going out to sea without being properly prepared is a dangerous business!
		if(MIS_LOSTISLAND == LOG_Running)
		{
			AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_25 " );	// Moreover, we still don't know where we are!
		}
		else if(MIS_CHANGECOURSE == LOG_Running)
		{
			AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_26 " );	// Moreover, we still haven't decided where to go.
		};
		AI_Output(self,other, " DIA_Jorgen_LI_RepairHelpDone_01_27 " );	// So let's not rush!
		AI_Output(other,self, " DIA_Jorgen_LI_RepairHelpDone_01_28 " );	// Okay, then you'll say it yourself.
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_29");	//Конечно.
	};
};


instance DIA_JORGEN_LI_AWAY(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_away_condition;
	information = dia_jorgen_li_away_info;
	permanent = TRUE;
	description = " When are we leaving? " ;
};


func int dia_jorgen_li_away_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if (( MIS_REPAIRSHIP  ==  LOG_SUCCESS ) && ( CANAWAYFROMLI  ==  FALSE ) && ( TORLOFLITIMERAWAY  <= ( daynow -  1 )))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_away_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_Away_01_00 " );	// When do we sail?
	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Jorgen_LI_Away_01_01 " );	// Yes, right now!
		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other, " DIA_Jorgen_LI_Away_01_02 " );	// Only first we need to inform the guys on the shore that we are weighing anchor.
			AI_Output(self,other, " DIA_Jorgen_LI_Away_01_03 " );	// Let's not leave them here! (laughs)
			AI_Output(other,self, " DIA_Jorgen_LI_Away_01_04 " );	// Okay, I'll pass it on to them.
			CANWAYFROMLI = TRUE ;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			B_LogEntry( TOPIC_GATHERCREW , " Jorgen asked me to tell all the guys on the beach that we are weighing anchor. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Jorgen_LI_Away_01_05 " );	// So just say it and we'll set sail in no time.
			AI_Output(other,self,"DIA_Jorgen_LI_Away_01_06");	//Хорошо.
			CANWAYFROMLI = TRUE ;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else  if ( MIS_LOST_ISLAND  == LOG_Running )
	{
		AI_Output(self,other, " DIA_Jorgen_LI_Away_01_07 " );	// But we still don't know where we are!
		AI_Output(self,other, " DIA_Jorgen_LI_Away_01_08 " );	// So it's too early to think about it.
		AI_Output(other,self, " DIA_Jorgen_LI_Away_01_09 " );	// As you say.
	}
	else if(MIS_CHANGECOURSE == LOG_Running)
	{
		AI_Output(self,other, " DIA_Jorgen_LI_Away_01_10 " );	// But we still haven't decided where to go!
		AI_Output(self,other, " DIA_Jorgen_LI_Away_01_11 " );	// So it's too early to think about it.
		AI_Output(other,self, " DIA_Jorgen_LI_Away_01_12 " );	// As you say.
	}
	else
	{
		AI_Output(self,other, " DIA_Jorgen_LI_Away_01_13 " );	// It's too soon to think about it until I've finished repairing the ship.
		AI_Output(self,other, " DIA_Jorgen_LI_Away_01_14 " );	// So it's better to do something useful for now.
		AI_Output(other,self, " DIA_Jorgen_LI_Away_01_15 " );	// As you say.
	};
};


instance DIA_JORGEN_LI_AWAYDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_awaydone_condition;
	information = dia_jorgen_li_awaydone_info;
	permanent = TRUE;
	description = " Time to go. " ;
};


func int dia_jorgen_li_awaydone_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if (( CANAWAYFROMLI  ==  TRUE ) && ( NORTH CAPTAINLIAWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_awaydone_info()
{
	var int crewlicountmiss;
	var string concatText;
	var string text;
	var string text2;
	AI_Output(other,self, " DIA_Jorgen_LI_AwayDone_01_00 " );	// Time to go.
	if(NOPEOPLEONLANDLI == TRUE)
	{
		AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_01 " );	// Good! We weigh anchor.
		AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_02 " );	// In the meantime, you can go and relax in your cabin. I suppose you've been running around in recent days?
		AI_Output(other,self, " DIA_Jorgen_LI_AwayDone_01_03 " );	// There are few.
		AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_04 " );	// Well, then go to sleep. And we'll be leaving soon!
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
			AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_06 " );	// Good! It seems that all the guys are on the ship, which means that you can weigh anchor.
			AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_07 " );	// In the meantime, you can go and relax in your cabin. I suppose you've been running around in recent days?
			AI_Output(other,self, " DIA_Jorgen_LI_AwayDone_01_08 " );	// There are few.
			AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_09 " );	// Well, then go to sleep. And we'll be leaving soon!
			CAPITANORDERLIAWAY = TRUE;
			MIS_GATHERCREW = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_SUCCESS);
			B_LogEntry( TOPIC_GATHERCREW , " All the crew are on the ship and we are ready to go. " );
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_11 " );	// But not all the guys have returned from the shore yet! (surprised) We can't leave them!
			AI_Output(other,self, " DIA_Jorgen_LI_AwayDone_01_12 " );	// Who's missing?
			AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_13 " );	// (looking around) I don't think so...
			if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE) && (GORNLIONBOARD == FALSE))
			{
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_14");	//...Горна
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE) && (MILTENLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_15");	//...Милтена
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE) && (LESTERLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_16");	//...Лестера
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE) && (DIEGOLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_17");	//...Диего
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE) && (ANGARLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_18");	//...Кор Ангара
				crewlicountmiss = crewlicountmiss + 1;
			};
			AI_Output(self,other, " DIA_Jorgen_LI_AwayDone_01_19 " );	// The rest of the guys seem to be in place!
			if(crewlicountmiss >= 2)
			{
				AI_Output(other,self, " DIA_Jorgen_LI_AwayDone_01_20 " );	// Okay! I will tell them to return to the ship.
			}
			else
			{
				AI_Output(other,self, " DIA_Jorgen_LI_AwayDone_01_21 " );	// Okay! I will tell him to return to the ship.
			};
		};
	};
};


instance DIA_JORGEN_LI_ISLAND (C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_island_condition;
	information = dia_jorgen_li_island_info;
	permanent = FALSE;
	description = " Where are we and what is this island? " ;
};


func int dia_jorgen_li_island_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_island_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_Island_01_01 " );	// Where are we and what is this island?
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_02 " );	// I don't know, buddy... (laughs) I see this island just like you see it for the first time in my life!
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_03 " );	// And I have absolutely no idea where we are right now.
	AI_Output(other,self, " DIA_Jorgen_LI_Island_01_04 " );	// It turns out that we are seriously confused.
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_05 " );	// Looks like it! (sadly) Only Innos knows where we've gone.
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_06 " );	// Of course, it would be possible to swim somewhere at random, but I'm just afraid that this is unlikely to end well.
	AI_Output(other,self, " DIA_Jorgen_LI_Island_01_07 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_08 " );	// Would you ask something easier...
	AI_Output(other,self, " DIA_Jorgen_LI_Island_01_09 " );	// Well, do you have any thoughts on this?
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_10 " );	// Hmmm... well, if there is, it's only one.
	AI_Output(other,self, " DIA_Jorgen_LI_Island_01_11 " );	// And what is it?
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_12 " );	// Try to figure out what's what here.
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_13 " );	// If we can at least roughly understand in which part of the ocean we ended up, then we can easily return to our previous course.
	AI_Output(other,self, " DIA_Jorgen_LI_Island_01_14 " );	// But how to do it?
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_15 " );	// I don't know... (sadly) Maybe we should take a walk around the island itself.
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_16 " );	// I think if we look for answers to all our questions, then only there. They are definitely not here!
	AI_Output(other,self, " DIA_Jorgen_LI_Island_01_17 " );	// Not a bad idea.
	AI_Output(self,other, " DIA_Jorgen_LI_Island_01_18 " );	// Well, yes! And there, you look, maybe something will clear up.
	MY_LOST ISLAND = LOG_Running;
	Log_CreateTopic(TOPIC_LOSTISLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_Running);
	B_LogEntry( TOPIC_LOSTISLAND , " It looks like we're completely lost. Our captain has absolutely no idea what kind of island this is and where we ended up. The only thing left for us is to try to figure it out ourselves and find out where we are now . " );
	Log_AddEntry( TOPIC_LOSTISLAND , " After talking with Jorgen, we agreed that for a start it would be worth just visiting this most mysterious island and examining it as carefully as possible. Perhaps something can be found there. " );
};


instance DIA_JORGEN_LI_ISLANDPROGRESS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_islandprogress_condition;
	information = dia_jorgen_li_islandprogress_info;
	permanent = FALSE;
	description = " Look, I found this tile. " ;
};


func int dia_jorgen_li_islandprogress_condition()
{
	if (( MY_LOST_COUNTRY  == LOG_Running ) && ( Npc_HasItems ( hero , itwr_lost_countrymap ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dia_jorgen_li_islandprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgress_01_00 " );	// Look, I found this tile.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_01 " );	// Hmmm... what an interesting thing!
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_02 " );	// Looks like you're lucky for this kind of thing...(laughs)
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgress_01_03 " );	// Maybe! By the way, some strange kind of symbols are depicted on it.
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgress_01_04 " );	// What exactly do they mean, I still do not understand.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_05 " );	// Let me see...
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgress_01_06 " );	// Here, take this.
	B_GiveInvItems(other,self,itwr_lostislandmap,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_07 " );	// Hmmm... indeed, this is all very strange.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_08 " );	// Although if you look closely, it all looks very much like... (hesitantly)
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_09");	//На что?
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_10 " );	// Not exactly sure, but this stone tile looks a bit like a map.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_11");	//Карту?
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_12 " );	// Yes, a map! That's just what she shows - this I can not say.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_13 " );	// It looks like some numbers are still stamped here. Perhaps they are the key to deciphering what is depicted on the card itself!
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgress_01_14 " );	// How can we understand this?
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_15 " );	// Don't know yet! Although ... there is, of course, one idea.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_17 " );	// This is just a guess, but maybe these numbers represent the latitude and longitude of this island.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_18 " );	// If this really turns out to be the case, then we can easily determine where we are now.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_19 " );	// True, for this I would need a sea sextant.
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgress_01_20 " );	// Is this a problem?
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_21 " );	// Yes, since I simply don't have it... (sadly) And without it, I can't do accurate calculations.
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgress_01_22 " );	// Good! I will look for it for you.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_23 " );	// Try it, of course! Although I do not think that here, on the island, you can find this kind of thing.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgress_01_24 " );	// But maybe you will be lucky again as always... (laughs) and then, who knows!
	CAPNEEDSEXTANT = TRUE;
	B_LogEntry( TOPIC_LOSTISLAND , " I showed Jorgen a stone tile I found in an ancient ruin on the island. He suggested that the tile depicted some kind of mysterious map. In addition, several numbers are scrawled on the back of this stone tablet, which may well mean something very important - for example, the latitude and longitude of the island itself. But to verify this version, Jorgen needs a sextant. " );
};


instance DIA_JORGEN_LI_ISLANDPROGRESSNEXT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_islandprogressnext_condition;
	information = dia_jorgen_li_islandprogressnext_info;
	permanent = FALSE;
	description = " I have a sextant. " ;
};


func int dia_jorgen_li_islandprogressnext_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (CAPNEEDSEXTANT == TRUE) && (Npc_HasItems(hero,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_islandprogressnext_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgressNext_01_00 " );	// I have a sextant.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgressNext_01_01 " );	// True? (surprised) But where did you get it from?
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_02");	//Не важно.
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgressNext_01_03 " );	// Okay. Whatever you say, buddy... (laughs) Bring it over here.
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgressNext_01_04 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgressNext_01_05 " );	// Great! Now I can finally work on deciphering those strange symbols.
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgressNext_01_06 " );	// And how long will it take you?
	AI_Output(self,other, " DIA_Jorgen_LI_IslandProgressNext_01_07 " );	// I think not more than a couple of days.
	AI_Output(other,self, " DIA_Jorgen_LI_IslandProgressNext_01_08 " );	// Okay, let's wait then.
	TORLOFDESCRTIMER = Wld_GetDay();
	TORLOFBEGINSEARCH = TRUE;
	B_LogEntry( TOPIC_LOSTISLAND , " I got Jorgen a sextant. Now he can start his calculations. According to him, it will take no more than two days. " );
};


instance DIA_JORGEN_LI_SEARCH(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_search_condition;
	information = dia_jorgen_li_search_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_li_search_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_LOSTISLAND == LOG_Running) && (TORLOFBEGINSEARCH == TRUE) && (TORLOFBEGINSEARCH <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_search_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_00 " );	// Good to have you here! I have already finished my calculations.
	AI_Output(other,self, " DIA_Jorgen_LI_Search_01_01 " );	// And how are you doing?
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_02 " );	// Not bad at all! There is something to please.
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_04 " );	// Hmm. It seems that we were not mistaken in assuming that these symbols really mean something!
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_05 " );	// I checked our previous heading on the chart and made a slight correction for possible drift during the storm.
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_06 " );	// And then I substituted in my calculations the numbers that were drawn on the back of the stone tile you found.
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_07 " );	// And imagine, they came up!
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_08");	//Это как?
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_09 " );	// And so! If we impose them on the map in a certain sequence, then they indicate the place where we could well be at the moment.
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_10 " );	// Of course, my calculations are not entirely accurate... (skeptical) But at least this already gives a rough idea of ​​what to do and where to sail!
	AI_Output(other,self, " DIA_Jorgen_LI_Search_01_11 " );	// Are you saying we can get off this island whenever we want?
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_12 " );	// To the point! (laughs) So as soon as the ship is ready to sail, we can weigh anchor.
	AI_Output(other,self, " DIA_Jorgen_LI_Search_01_13 " );	// This is really good news.
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_14 " );	// That's right, man. I like them too!
	AI_Output(other,self, " DIA_Jorgen_LI_Search_01_15 " );	// Then let's not waste time and get down to business.
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_16 " );	// Agree! The sooner we get this over with, the sooner we can get out of here.
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_17 " );	// Oh, and one more thing... (seriously) Here, take this card! It marks the island itself and the exact course to it.
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(self,other, " DIA_Jorgen_LI_Search_01_18 " );	// Perhaps this thing will be useful to you somehow. And if not, then it doesn't matter - let it be kept by you for now.
	MIS_LOSTISLAND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_SUCCESS);
	B_LogEntry( TOPIC_LOSTISLAND , " Jorgen finished his calculations, and they turned out to be very successful. The tile that I found on the island really seemed to be a kind of map, and the entries on it helped Jorgen to determine our current location with a high degree of probability. So, as soon as our ship will take on the proper form, it will be possible to finally hit the road from this island. " );
};


instance DIA_JORGEN_LI_ABOUTISLAND(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_aboutisland_condition;
	information = dia_jorgen_li_aboutisland_info;
	permanent = FALSE;
	description = " I wonder if anyone lives on this island? " ;
};


func int dia_jorgen_li_aboutisland_condition()
{
	if (Npc_KnowsInfo(hero,dia_jorgen_li_island))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_aboutisland_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_AboutIsland_01_01 " );	// I wonder if anyone lives on this island?
	AI_Output(self,other, " DIA_Jorgen_LI_AboutIsland_01_02 " );	// Hardly. It looks like it's completely uninhabited.
	AI_Output(other,self, " DIA_Jorgen_LI_AboutIsland_01_03 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_Jorgen_LI_AboutIsland_01_04 " );	// Eh, boy... I'm not sure about anything anymore!
	AI_Output(self,other, " DIA_Jorgen_LI_AboutIsland_01_05 " );	// But if you think logically, then our appearance here could not go unnoticed.
	AI_Output(self,other, " DIA_Jorgen_LI_AboutIsland_01_06 " );	// So, if someone lived here, they would probably have already made themselves felt.
	AI_Output(self,other, " DIA_Jorgen_LI_AboutIsland_01_07 " );	// In the meantime, apart from a couple of fire lizards on the shore, we have not met anyone.
	AI_Output(other,self, " DIA_Jorgen_LI_AboutIsland_01_08 " );	// But things can change.
	AI_Output(self,other, " DIA_Jorgen_LI_AboutIsland_01_09 " );	// Maybe... (nervously) But for me, it's better to have fewer surprises. And without that enough!
};


instance DIA_JORGEN_LI_WHEREGUYS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_whereguys_condition;
	information = dia_jorgen_li_whereguys_info;
	permanent = FALSE;
	description = " Where are all the other guys?! " ;
};


func int dia_jorgen_li_whereguys_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_whereguys_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGuys_01_01 " );	// Where are all the other guys?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGuys_01_02 " );	// Most of the guys went ashore as soon as we landed on this island.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_03");	//Зачем?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGuys_01_04 " );	// Well... (he hesitated) They said they wanted to scout the immediate surroundings of this island.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGuys_01_05 " );	// Although, most likely, it's something else.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_06");	//То есть?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGuys_01_07 " );	// But to me, they're just really scared! So they did not want to stay on this ship anymore.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGuys_01_08 " );	// This is me, the old sea dog is no stranger to this kind of thing... (laughs) I've seen storms and stronger ones!
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGuys_01_09 " );	// But he apparently scared the rest quite decently.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGuys_01_10 " );	// So after all they've been through, this piece of land seemed like the best place on earth to most of them!
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGuys_01_11 " );	// At least it showed on their faces.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_12");	//Понятно.
};


instance DIA_JORGEN_LI_WHEREGOLD(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_wheregold_condition;
	information = dia_jorgen_li_wheregold_info;
	permanent = FALSE;
	description = " Where did my gold go? " ;
};


func int dia_jorgen_li_wheregold_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_jorgen_li_storm ) && ( MIS_MISSMYGOLD  == LOG_Running ) && ( BEGINNING SEEK  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_wheregold_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGold_01_01 " );	// Where did my gold go?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGold_01_02 " );	// What are you talking about, mate?
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGold_01_03 " );	// About the big pile of gold we took from the island of Irdorath. It was in the hold of our ship!
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGold_01_04 " );	// (surprised) What about him?
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGold_01_05 " );	// Now it's not there!
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGold_01_06 " );	// True? How is it not?
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGold_01_07 " );	// And so! It just disappeared.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGold_01_08 " );	// Sorry mate. But I have no idea where it went.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGold_01_09 " );	// And how could I put such a pile of gold in my pocket? So I have nothing to do with it!
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGold_01_10 " );	// Hmm, that's also true. And how can I be now?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGold_01_11 " );	// I don't know...(confused) Maybe you should ask the other guys about it - maybe they know something.
	BEGINGOLDSEEK = TRUE;
	Wld_InsertItem(itmi_misstorlofthing,"FP_ITEM_CAPITANTHING");
	B_LogEntry( TOPIC_MISSMYGOLD , " Jorgen said he didn't know where my gold went. But he told me to ask the other guys about it. " );
};


instance DIA_JORGEN_LI_MISSCOMPAS (C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_misscompas_condition;
	information = dia_jorgen_li_misscompass_info;
	permanent = FALSE;
	description = "The bugle said you lost your compass. " ;
};


func int dia_jorgen_li_misscompas_condition()
{
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLABOUTCOMPAS == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		return TRUE;
	};
};

func void day_jorgen_li_misscompas_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Jorgen_LI_MissCompas_01_01 " );	// Horn said you lost your compass.
	AI_Output(self,other, " DIA_Jorgen_LI_MissCompas_01_02 " );	// (frustrated) Yes, there is such a thing...
	AI_Output(other,self, " DIA_Jorgen_LI_MissCompas_01_03 " );	// And how did this happen?
	AI_Output(self,other, " DIA_Jorgen_LI_MissCompas_01_04 " );	// I don't know! It must have fallen out of my pocket during a storm.
	AI_Output(self,other, " DIA_Jorgen_LI_MissCompas_01_05 " );	// But I'm not exactly sure...
	AI_Output(other,self, " DIA_Jorgen_LI_MissCompas_01_06 " );	// Looks like this compass meant a lot to you.
	AI_Output(self,other, " DIA_Jorgen_LI_MissCompas_01_07 " );	// Eh... this little thing was really dear to me - a keepsake from one of my old friends!
	AI_Output(self,other, " DIA_Jorgen_LI_MissCompas_01_08 " );	// I always thought it brought me luck, and trust me, it did!
	AI_Output(self,other, " DIA_Jorgen_LI_MissCompas_01_09 " );	// But now I understand that this very luck turned away from me this time.
	AI_Output(other,self, " DIA_Jorgen_LI_MissCompas_01_10 " );	// Have you tried searching for it?
	AI_Output(self,other, " DIA_Jorgen_LI_MissCompas_01_11 " );	// I tried, of course... (sadly) I searched the entire upper deck, but it turned out to be in vain - he's not here!
	AI_Output(self,other, " DIA_Jorgen_LI_MissCompas_01_12 " );	// So, most likely, he was simply washed overboard by a wave, and nothing can be done about it.
	AI_Output(other,self, " DIA_Jorgen_LI_MissCompas_01_13 " );	// Got it.
	B_LogEntry( TOPIC_MISSMYGOLD , " I asked Jorgen about his compass. He seems really upset about this loss. He searched the entire upper deck of the ship, hoping to find it, but never did. " );
};


instance DIA_JORGEN_LI_WHEREGOLDDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_wheregolddone_condition;
	information = dia_jorgen_li_wheregolddone_info;
	permanent = FALSE;
	description = " This isn't your item, is it? " ;
};


func int dia_jorgen_li_wheregolddone_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running) && (Npc_HasItems(hero,itmi_misstorlofthing) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_wheregolddone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_01 " );	// Isn't this your thing?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_02 " );	// (surprised) What other thing?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_03");	//Вот.
	B_GiveInvItems(other,self,itmi_misstorlofthing,1);
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_04 " );	// (enthusiastic) Buddy... that's my compass! And I thought that everything...
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_05 " );	// How did you manage to find it?
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_06 " );	// The question is different - where did I find it.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_07");	//И где же?
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_08 " );	// And right where the missing pile of my gold used to be.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_09 " );	// What are you implying, mate?
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_10 " );	// To the fact that you probably know something about this.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_11 " );	// (confused) But I already told you I have no idea where it is...
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_12 " );	// If I were you, I'd rather tell the whole truth.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_13 " );	// Truth? (quite confused) But...
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_14");	//Ну?! Говори же!
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_15 " );	// Oh, okay! In general ... to the great regret of many crew members, he had to be thrown overboard.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_16 " );	// But to be honest, life is more precious to me!
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_17 " );	// That is, how to throw it away?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_18 " );	// And so! (seriously) The ship rolled a lot, and if we didn't, then everyone would go to feed the fish.
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_19 " );	// But did you really have to throw away all the gold?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_20 " );	// Sorry, but somehow I forgot to think about it then... (snidely) It just wasn't up to that!
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_21 " );	// M-yes. It turns out that we now have no gold either.
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_22 " );	// Why was everyone hiding this from me?
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_23 " );	// We didn't want to tell you about this because we thought you'd be very upset.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_24 " );	// That's why we pretended we didn't know anything about your gold.
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_25 " );	// You were right - I'm really upset!
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_26 " );	// Buddy! (smiles) If I were you, I wouldn't be too upset.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_27 " );	// Gold can be acquired, and you still have time to become rich!
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_28 " );	// Better thank Innos for keeping us all alive. This is much more important!
	AI_Output(other,self, " DIA_Jorgen_LI_WhereGoldDone_01_29 " );	// Well, yes, you're probably right.
	AI_Output(self,other, " DIA_Jorgen_LI_WhereGoldDone_01_30 " );	// And if so, then let's end this conversation and get on with more important matters.
	MIS_MISSMYGOLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_SUCCESS);
	B_LogEntry( TOPIC_MISSMYGOLD , " Now everything became clear - my gold was simply thrown overboard during a storm, because due to the heavy workload our ship lurched and could capsize. So this was a vital necessity! The guys did not want to tell me the whole truth at first, because they thought that I would be very upset because of this. In principle, they turned out to be right, but I will somehow survive this loss. " );
};


instance DIA_JORGEN_LI_HELLO (C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 4;
	condition = dia_jorgen_li_hallo_condition;
	information = dia_jorgen_li_hello_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int dia_jorgen_li_hallo_condition()
{
	if ( Npc_KnowsInfo ( hero , Dia_jorgen_li_island ) && Npc_KnowsInfo ( Hero , Dia_jorgen_li_whereguys ) && Npc_KnowsInfo ( hero , Dia_jorgen_li_island ))
	{
		return TRUE;
	};
};

func void day_jorgen_li_hallo_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_Hallo_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Jorgen_LI_Hallo_01_01 " );	// So far, yes.
};


instance DIA_JORGEN_LI_BRINGFOODDONE (C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_bringfooddone_condition;
	information = dia_jorgen_li_bringfooddone_info;
	permanent = FALSE;
	description = " How are we doing with the provisions? " ;
};


func int dia_jorgen_li_bringfooddone_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (GORNTELLABOUTMEAT == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_bringfooddone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDone_01_01 " );	// How are we doing with provisions?
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_02 " );	// Not very good... (seriously) It's slowly starting to come to an end.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_03 " );	// Why did you ask?
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDone_01_04 " );	// Some guys complain that you cut their daily food allowances.
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDone_01_05 " );	// And in my opinion, most of them did not really like this news!
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_06 " );	// Unfortunately, I had no other choice...
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_07 " );	// Knowing the appetites of some of our guys, we would have nothing left in a couple of days.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_08 " );	// Especially for Gorn! If this troglodyte is allowed into the galley, then it will immediately destroy all our food supplies in one sitting!
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_09 " );	// And what are we going to do next? BUT?
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDone_01_10 " );	// Nothing. Because now you can relax a little.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_11 " );	// Why is that?
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDone_01_12 " );	// Because I brought you a lot of fresh meat.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_13 " );	// Meat? (surprised) Did you go hunting?
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDone_01_14 " );	// Well, yes - walked around the island a bit, shot a couple of vile creatures.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_15 " );	// Now everything is clear... (laughs) Well, how much do you have?
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDone_01_16 " );	// Five dozen pieces.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_17 " );	// Wow! Quite good! I think this stock will last us a long time.
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDone_01_18 " );	// Then, here - take it.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_19 " );	// No, no, no! (grouchily) I'm not going to take this meat from you just like that.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_20");	//Как так?
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_21 " );	// And so that now I have absolutely no time to mess with him. And so things are up to the throat!
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_22 " );	// And you can't leave it raw either. Otherwise, it will quickly deteriorate, and all your work will be in vain.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_23 " );	// So go to the galley first and fry all those pieces really well.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDone_01_24 " );	// And only after that come back to me. All clear?
	B_LogEntry( TOPIC_BRINGFOOD , " Jorgen was surprised that I managed to get such a large amount of fresh meat. However, he refused to take it, because he simply had no time to do all this now. So he asked me to go to the galley and for a good fry each piece so that they not spoiled. And then bring this meat to him. " );
};


instance DIA_JORGEN_LI_BRINGFOODDONEEXT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_bringfooddoneext_condition;
	information = dia_jorgen_li_bringfooddoneext_info;
	permanent = FALSE;
	description = " I've fried meat. " ;
};


func int dia_jorgen_li_bringfooddoneext_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_jorgen_li_bringfooddone) && (Npc_HasItems(hero,ItFoMutton) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_bringfooddoneext_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDoneExt_01_01 " );	// I fried the meat like you asked.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_01_02 " );	// If so, then give it here.
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	if(GORNTELLABOUTMEAT == TRUE)
	{
		Info_AddChoice(dia_jorgen_li_bringfooddoneext, " Here you go...(give 14 meats and apples) " ,dia_jorgen_li_bringfooddoneext_fifty);
	};
	Info_AddChoice(dia_jorgen_li_bringfooddoneext,"Вот держи!",dia_jorgen_li_bringfooddoneext_sixty);
};

func void dia_jorgen_li_bringfooddoneext_fifty()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,14);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,14);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_01 " );	// Hmm. Where is everything else?
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_02 " );	// I thought you had more meat then than you do now.
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_03 " );	// I decided to eat a little.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_04 " );	// M-yes, buddy... (surprised) Well, you have an appetite!
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_05 " );	// I wonder if you didn't burst after that?
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_06");	//А что?
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_07 " );	// You've eaten at least ten pieces!
	AI_Output(other,self, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_08 " );	// No. On the contrary, just right.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_09 " );	// As you say. After all, it was you who got us this meat, not someone else.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_10 " );	// So don't think I'm judging you for this.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_11 " );	// I just wanted to increase the daily ration for all our guys a little. And they've been a little sluggish lately!
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_12 " );	// But it looks like I won't be able to do that in this situation...
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_13 " );	// Alright though! What can we say about it now.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_14 " );	// But anyway, thank you!
	NOTTHANKSTELLALLMEAT = TRUE;
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry( TOPIC_BRINGFOOD , " I gave Jorgen the fried meat without forgetting Gorn's request. Jorgen was a little upset because he wanted to increase the daily ration for the other guys. But now it doesn't matter anymore. " );
};

func void dia_jorgen_li_bringfooddoneext_sixty()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,24);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,24);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_01 " );	// Great! Now the guys will certainly have something to eat in the coming days.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_02 " );	// And besides, I can even slightly increase the daily ration for all members of our crew.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_03 " );	// Surely, after a few days of a little hunger strike, this will be good news for them.
	AI_Output(self,other, " DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_04 " );	// And it's all thanks to you, mate!
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	THANKSTELLALLMEAT = TRUE;
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry( TOPIC_BRINGFOOD , " I gave Jorgen all the grilled meat, and now he can slightly increase the daily ration for all the crew members of our ship. " );
};


instance DIA_JORGEN_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecave_condition;
	information = dia_jorgen_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I have some interesting news. " ;
};


func int dia_jorgen_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && ((FINDLIORE_CAVE_01 == TRUE) || (FINDLIORE_CAVE_02 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_01 " );	// I have some interesting news.
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_02 " );	// And what are they?
	if((FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_03 " );	// I discovered several caves with huge deposits of magical ores.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_04 " );	// (surprised) Really?
		AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_05 " );	// There can be no doubt! I think this whole island is just crammed to the ground with her.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_06 " );	// Hmmm... well, that's some pretty unusual news indeed.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_07 " );	// Magical ore deposits are very rare! Especially, as you say, in such huge sizes.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_08 " );	// As far as I know, until recently, such reserves were only in the Valley of Mines, until the orcs came there.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_09 " );	// So, if you're right, this is truly a great discovery!
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_10 " );	// Although I still don't really believe it... You probably confused magic ore with ordinary stones.
		AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_11 " );	// And what do I need to do for you to believe this?
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_12 " );	// (thoughtfully) Perhaps if I saw this ore with my own eyes, it would completely clarify the situation!
		AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_13 " );	// Then come with me. I'll show you one of the caves.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_14 " );	// It won't work, buddy... (smiles) I have absolutely no time for this right now.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_15 " );	// Besides, I haven't finished fixing our ship yet.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_16 " );	// So, if it's not difficult for you, just bring me a small piece of the ore that you found on this island.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_17 " );	// I think this will be quite enough to fully verify your words.
		AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_18 " );	// Okay! I'll try to get you one copy.
		LITESTOK = TRUE;
		B_LogEntry( TOPIC_FINDMAGICORECAVE , " I told Jorgen that I discovered several caves on the island with huge deposits of magical ore. He was surprised by this and asked me to bring him a small piece of this rock as proof of my words. " );
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_19 " );	// In one of the caves on this island, I discovered large deposits of magical ore.
		AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_20 " );	// There may be even more of it hiding on this island!
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_21 " );	// Hmmm... well, that's some pretty unusual news indeed.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_22 " );	// Encountering a deposit of magical ore is very lucky! Especially, as you say, in such large sizes.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_23 " );	// As far as I know, until recently, such reserves were only in the Valley of Mines, until the orcs came there.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_24 " );	// So if you're right, this will be a truly great discovery!
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_25 " );	// Though I don't quite believe it... Most likely, you confused the ore with just ordinary stones.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_26 " );	// In addition, the deposits you found in this cave do not yet indicate that there can be a lot of it here.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_27 " );	// This could just be an accident!
		AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCave_01_28 " );	// And what should I do now?
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_29 " );	// If I were you, I'd try to explore this island more carefully.
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_30 " );	// Maybe this would clear things up a bit with the ore you found!
		AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCave_01_31 " );	// So, when you find something else interesting, then we'll talk... (smiles)
		LIBEFORETESTOK = TRUE;
		B_LogEntry( TOPIC_FINDMAGICORECAVE , " I told Jorgen that I discovered a cave on the island with large deposits of magical ore. He strongly doubted my words and therefore asked me to more carefully examine the island in order to find more evidence of the presence of deposits of this rock here. " ) ;
	};
};


instance DIA_JORGEN_LI_FINDMAGICORECAVEPROGRESS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecaveprogress_condition;
	information = dia_jorgen_li_findmagicorecaveprogress_info;
	permanent = FALSE;
	description = " I've explored the island. " ;
};


func int dia_jorgen_li_findmagicorecaveprogress_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == TRUE) && (FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecaveprogress_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_01 " );	// I explored the island...
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_02");	//И?
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_03 " );	// ...and found another cave. There is even more ore in it than in the first one!
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_04 " );	// Hmmm... are you sure about that?
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_05 " );	// Are my words not enough?
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_06 " );	// Sure enough! (sarcastically) I just still can't believe that we're so lucky!
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_07 " );	// And what do I need to do so that you finally believe in this?
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_08 " );	// (thoughtfully) Perhaps if I saw this ore with my own eyes, it would completely clarify the situation!
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_09 " );	// Then come with me! I'll show you one of the caves.
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_10 " );	// It won't work, buddy... (smiles) I have absolutely no time for this right now.
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_11 " );	// Besides, I haven't finished fixing our ship yet!
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_12 " );	// So, if it's not difficult for you, just bring me a small piece of the ore that you found on this island.
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_13 " );	// I think this will be quite enough to fully verify your words.
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveProgress_01_14 " );	// Okay! I'll try to get you one copy.
	LITESTOK = TRUE;
	B_LogEntry( TOPIC_FINDMAGICORECAVE , " I told Jorgen that I found another cave with deposits of magical ore. After listening to me, he asked me to bring him a small piece of this rock in order to finally verify the veracity of my words. " );
};


instance DIA_JORGEN_LI_FINDMAGICORECAVEDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecavedone_condition;
	information = dia_jorgen_li_findmagicorecavedone_info;
	permanent = FALSE;
	description = " I brought you a piece of that ore. " ;
};


func int dia_jorgen_li_findmagicorecavedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (Npc_HasItems(hero,itmi_testnugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecavedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveDone_01_01 " );	// I brought you a piece of that ore.
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveDone_01_02 " );	// Great! (sarcastically) Show it to me.
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveDone_01_03 " );	// Here, take a look.
	B_GiveInvItems(other,self,itmi_testnugget,1);
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveDone_01_04 " );	// Hmm... Yeah man - looks like you were right!
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveDone_01_05 " );	// This is indeed a magical ore. And judging by the appearance of this nugget, it is also of excellent quality!
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveDone_01_06 " );	// Do you believe me now?
	AI_Output(self,other, " DIA_Jorgen_LI_FindMagicOreCaveDone_01_07 " );	// I'm sorry I doubted your words. I'm just used to believing only what I saw myself!
	AI_Output(other,self, " DIA_Jorgen_LI_FindMagicOreCaveDone_01_08 " );	// I understand.
	MIS_FINDMAGICORECAVE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_SUCCESS);
	B_LogEntry( TOPIC_FINDMAGICORECAVE , " I brought Jorgen a piece of ore that I chipped from magical rock. After that, he did not doubt my words. " );
};


instance DIA_JORGEN_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_changecourse_condition;
	information = dia_jorgen_li_changecourse_info;
	permanent = FALSE;
	description = " So what are we going to do now? " ;
};


func int dia_jorgen_li_changecourse_condition()
{
	if(MIS_FINDMAGICORECAVE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_01_01 " );	// And what are we going to do now?
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_01_02 " );	// (confused) I have no idea!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_01_03 " );	// Of course, it would be nice to get our hands on all this ore.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_01_04 " );	// On the mainland, we could get a huge pile of gold for it!
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_01_05 " );	// Sounds tempting!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_01_06 " );	// Yes... but how do we do that?
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_01_07 " );	// Our ship is already packed to capacity. And the ore itself weighs a lot!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_01_08 " );	// Besides, it still needs to be mined somehow, and we are unlikely to make good miners.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_01_09 " );	// So... (sadly) Do you have any ideas about this yourself?
	Info_ClearChoices(dia_jorgen_li_changecourse);
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		Info_AddChoice(dia_jorgen_li_changecourse, " I think we should report this ore to Lord Hagen. " ,dia_jorgen_li_changecourse_paladin);
	};
	Info_AddChoice(dia_jorgen_li_changecourse, " We can sell this island along with the ore to someone! " ,dia_jorgen_li_changecourse_sell);
	Info_AddChoice(dia_jorgen_li_changecourse, " Let's stay on the island and slowly start mining this ore. " ,dia_jorgen_li_changecourse_here);
};

func void dia_jorgen_li_changecourse_paladin()
{
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_01 " );	// I think we should report this ore to Lord Hagen.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_02 " );	// What? Give this ore to the paladins?
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_03 " );	// They need it more than we do! Without it, they have no chance of winning this war.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_04 " );	// So what? Perhaps they have already lost it!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_05 " );	// We still, of course, do not know how things are on the mainland itself. But according to rumors, orcs are already in charge there!
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_06 " );	// If so, then we will not need this ore at all.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_07 " );	// Eh... okay, let it be your way.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_08 " );	// True, then we will have to return back to Khorinis.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_09 " );	// I don't think most guys would like this idea...
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_10 " );	// I'll try to persuade them. Perhaps they will agree with my arguments.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_11 " );	// As you say! Then let me know if you succeed...(snidely)
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_12 " );	// In any case, this question is up to the rest of the guys. As most of them decide, so be it!
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Paladin_01_13 " );	// Of course.
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry( TOPIC_CHANGECOURSE , " Now we need to decide what to do with the ore found on the island. I suggested that Jorgen return to Khorinis and tell the paladins about it, but he did not like this idea. In the end, we decided to get the opinion of other members of our team. And there, as most of them decide, it will be so. " );
	Info_ClearChoices(dia_jorgen_li_changecourse);
};

func void dia_jorgen_li_changecourse_sell()
{
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Sell_01_01 " );	// We can sell this island along with the ore to someone!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_02 " );	// Interesting... (doubtfully) And who will buy it from us?
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_03 " );	// Who needs just an island, even if it's full of magic ore?
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Sell_01_04 " );	// I don't know. Maybe paladins? They definitely need her.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_05 " );	// Hmm. Well, that's a pretty good idea!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_06 " );	// Given their situation, they'll probably jump at this offer happily.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_07 " );	// But who should do it? Which paladin will be able to accept our conditions?
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Sell_01_08 " );	// Perhaps we should take this to Lord Hagen.
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Sell_01_09 " );	// He will definitely listen to me...
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_10 " );	// You're probably right. After what you did, you can definitely not doubt it!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_11 " );	// True, then we will have to return back to Khorinis.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_12 " );	// I don't think most guys would like this idea...
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Sell_01_13 " );	// I'll try to persuade them. Perhaps they will agree with my arguments.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_14 " );	// Okay! Then let me know if you succeed.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Sell_01_15 " );	// In any case, this question is up to the rest of the guys. As most of them decide, so be it!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_16");	//Конечно.
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry( TOPIC_CHANGECOURSE , " Now we need to decide what to do with the ore found on the island. I gave Jorgen the idea that we could sell this ore to the paladins. He liked it. However, for this, we probably have to return to Khorinis, therefore, first we need to find out the opinion of other members of our team. And then, as most of them decide, it will be so. " );
	Info_ClearChoices(dia_jorgen_li_changecourse);
};

func void dia_jorgen_li_changecourse_here()
{
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourse_Here_01_01 " );	// Let's stay on the island and slowly start mining this ore.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Here_01_02 " );	// Hmm. I don't think this is a good idea.
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Here_01_03");	//Почему?
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Here_01_04 " );	// Yes, because even if we start working here from morning to night with a pick in our hands, it still won't give us anything.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Here_01_05 " );	// It will take years to get more or less enough ore. If not more!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Here_01_06 " );	// Besides, I'm not going to spend the rest of my life on this rotten island.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Here_01_07 " );	// (grouchily) I'm already getting fed up with him!
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourse_Here_01_08 " );	// So, it's better if you put this idea out of your head.
};


instance DIA_JORGEN_LI_CHANGECOURSEDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_changecoursedone_condition;
	information = dia_jorgen_li_changecoursedone_info;
	permanent = FALSE;
	description = " I've talked to all the guys. " ;
};


func int dia_jorgen_li_changecoursedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_SUCCESS) && (READYCHANGECOURSE == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_changecoursedone_info()
{
	AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_01 " );	// I talked to all the guys.
	AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_02 " );	// And what did they say?
	if(CREWAGREEAWAYBACKPAL > CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_03 " );	// Most of them agree to sail to Khorinis to help the paladins.
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_04 " );	// So draw your own conclusions.
		AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_05 " );	// Well, okay... If the majority decides so, then so be it!
		AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_06 " );	// One can only hope that Lord Hagen and his people will really benefit from all this.
		AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_07 " );	// At least not in vain, let's do the way back!
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_08 " );	// Don't worry. Everything will be as it should be.
		AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_09 " );	// (sarcastically) Thank you, reassured me...
		B_LogEntry( TOPIC_CHANGECOURSE , " As a result, taking into account the opinion of the majority of the team members, it was decided to go back to Khorinis to inform the paladins about the magic ore we found on the island. " );
		LIGOFORFREE = TRUE;
	}
	else if(CREWAGREEAWAYBACKPAL < CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(450);
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_10 " );	// Most of them liked the idea of ​​demanding a decent amount of gold from the paladins for the ore we found.
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_11 " );	// So draw your own conclusions.
		AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_12 " );	// That's another matter. To be honest, I didn't expect anything else!
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_13 " );	// Why such confidence?
		AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_14 " );	// It's just that everyone understands why it's worth risking your life, and why not!
		B_LogEntry( TOPIC_CHANGECOURSE , " Most of the team liked the idea of ​​charging the paladins for a decent amount of gold for the ore we found. Our course is back to Khorinis. " );
		LIGOFORGOLD = TRUE;
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_16 " );	// Opinions are divided! Half for helping the paladins - the rest against.
		AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_17 " );	// (thoughtfully) not an easy situation.
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_18 " );	// And what are we going to do?
		AI_Output(self,other, " DIA_Jorgen_LI_ChangeCourseDone_01_19 " );	// I don't know. In any case, we should probably return to the island after all. And there, come what may!
		AI_Output(other,self, " DIA_Jorgen_LI_ChangeCourseDone_01_20 " );	// Good! So let's do it.
		; _ _ _ _ _ _
		LIGOFORUNKNOWN = TRUE;
	};
	MIS_CHANGECOURSE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_SUCCESS);
};


