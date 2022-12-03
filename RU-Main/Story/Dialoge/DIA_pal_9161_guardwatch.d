

instance DIA_PAL_9161_GUARDWATCH_EXIT(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 999;
	condition = dia_pal_9161_guardwatch_exit_condition;
	information = dia_pal_9161_guardwatch_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9161_guardwatch_exit_condition()
{
	return TRUE;
};

func void dia_pal_9161_guardwatch_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_PAL_9161_GUARDWATCH_HALLO (C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_hallo_condition;
	information = dia_pal_9161_guardwatch_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_hallo_condition()
{
	if(GRANTTOVARUS == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_hallo_info()
{
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_00 " );	// Stop! (terribly) Not a step further!
	if(PYROKARSENTTOHAGEN == TRUE)
	{
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Hallo_01_26 " );	// Let me through! I have an urgent message for Lord Hagen from the Archmage of Fire himself.
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_27 " );	// From the archmage of fire? Hmmm... (surprised) Are you lying, mate?
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Hallo_01_29 " );	// I'm only doing Pyrocar's errand, otherwise I wouldn't have come here.
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_30 " );	// Okay, come on in! But if you lied - I personally will skin you ... (terribly)
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_01 " );	// Do you have any idea where you're going?
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Hallo_01_02 " );	// And where to?
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_03 " );	// To Lord Varus - the head of this garrison and our commander!
		if((MIS_PALADINFOOD == LOG_Running) && (HAGENSENTTOVARUS == TRUE))
		{
			AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Hallo_01_04 " );	// Great! He is just what I need.
			AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_05 " );	// And why?
			AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Hallo_01_06 " );	// I have an order for him from the head of the paladins.
			AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_07 " );	// An order from Lord Hagen himself?
			AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Hallo_01_08 " );	// Exactly! Do you still want to hold me or can I get through?
			AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_09 " );	// Hmmm...(thoughtfully) well, you can pass!
			AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_10 " );	// However, remember that if you cause Lord Varus any trouble...
			AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_11 " );	// ...I'll be the first to teach you good manners! This is clear?
			GRANTTOVARUS = TRUE;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Hallo_01_13 " );	// Thanks, I'll know. Now can I pass?
			if(other.guild == GIL_PAL)
			{
				AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_14 " );	// Well, since you're one of our brothers, I'll let you through.
				AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_15 " );	// However, remember that if you cause Lord Varus any trouble...
				AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_16 " );	// ...I'll be the first to teach you good manners! This is clear?
				GRANTTOVARUS = TRUE;
				AI_StopProcessInfos(self);
			}
			else if(other.guild == GIL_KDF)
			{
				AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_18 " );	// Well, since you're one of Innos' venerable servants, I'll let you through.
				AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_19 " );	// However, remember, mage - if you cause Lord Varus any problems...
				AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_20 " );	// ...I'll be the first to teach you good manners! This is clear?
				GRANTTOVARUS = TRUE;
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(self,other,"DIA_Pal_9161_GuardWatch_Hallo_01_22");	//Нет!
				AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_23 " );	// And if you take another step - I swear by Innos, I will attack you!
				AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Hallo_01_24 " );	// So don't push your luck and get lost.
				other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,"LGR_RATSHAUS_17");
				AI_StopProcessInfos(self);
			};
		};
	};
};


instance DIA_PAL_9161_GUARDWATCH_HALLOATTACK(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_halloattack_condition;
	information = dia_pal_9161_guardwatch_halloattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_halloattack_condition()
{
	if (( GRANTTOVARUS  ==  FALSE ) && Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_hello) && (Npc_GetDistToWP(hero, " LGR_RATSHAUS_17 " ) <= (hero.aivar[AIV_LastDistToWP] -  20 )) && ( ( HAGENSENTTOVARUS  ==  hero.FALSE ) || .guild !=  GIL_PAL ) || (hero.guild !=  GIL_KDF )))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_halloattack_info()
{
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloAttack_01_00 " );	// I think I warned you!
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloAttack_01_01 " );	// Now blame yourself...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_9161_GUARDWATCH_HALLONOTATTACK(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_holonotattack_condition;
	info = dia_pal_9161_guardwatch_holonotattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9161_guardwatch_holonotattack_condition()
{
	if (( GRANTTOVARUS  ==  FALSE ) && Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_hello) && (( PYROKARSENTTOHAGEN  ==  TRUE ) || ( HAGENSENTTOVARUS  ==  TRUE ) || (hero.guild ==  GIL_PAL ) || (hero.guild ==  GIL_KDF )))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_hallonotattack_info()
{
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_00 " );	// Stop! (terribly) What do you need here again?
	if(PYROKARSENTTOHAGEN == TRUE)
	{
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_20 " );	// Let me through! I have an urgent message for Lord Hagen from the Archmage of Fire himself.
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_21 " );	// From the archmage of fire? Hmmm... (surprised) Are you lying, mate?
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_23 " );	// I'm only doing Pyrocar's errand, otherwise I wouldn't have come here.
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_24 " );	// Okay, come on in! But if you lied, I will personally skin you ... (terribly)
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else  if ( HAGENSENTTOVARUS  ==  TRUE )
	{
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_11 " );	// I have an order for him from the head of the paladins.
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_12 " );	// An order from Lord Hagen himself?!
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_13 " );	// Exactly. Do you still want to hold me or can I get through?
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_14 " );	// Hmmm...(thoughtfully) well, you can pass!
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_15 " );	// However, remember that if you cause Lord Varus any trouble...
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_16 " );	// ...I'll be the first to teach you good manners! This is clear?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_01 " );	// I am a member of an order of paladins. Will you miss me?
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_02 " );	// All right, since you're one of our brothers, I'll do it.
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_03 " );	// However, remember that if you cause Lord Varus any trouble...
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_04 " );	// ...I'll be the first to teach you good manners! This is clear?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_06 " );	// I am a fire mage. Will you miss me?
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_07 " );	// Well, since you are one of the honored servants of Innos, then I will do it.
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_08 " );	// However, remember, mage - if you cause Lord Varus any problems...
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_09 " );	// ...I'll be the first to teach you good manners! This is clear?
		GRANTTOVARUS = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9161_GuardWatch_HalloNotAttack_01_18");	//Ничего.
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_HalloNotAttack_01_19 " );	// Then get lost!
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9161_GUARDWATCH_WHAT(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_what_condition;
	information = dia_pal_9161_guardwatch_what_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_pal_9161_guardwatch_what_condition()
{
	if(GRANTTOVARUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_what_info()
{
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_What_01_00 " );	// How setting?
	if(MIS_LANZRING == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Pal_9161_GuardWatch_What_01_01 " );	// It's all right, mate! Come on.
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,30);
	};
};


instance DIA_PAL_9161_GUARDWATCH_POST(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_post_condition;
	information = dia_pal_9161_guardwatch_post_info;
	permanent = FALSE;
	description = " Are you always on duty here? " ;
};


func int dia_pal_9161_guardwatch_post_condition()
{
	if(GRANTTOVARUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_post_info()
{
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Post_01_01 " );	// Are you always on duty here?
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Post_01_02 " );	// Almost always.
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_Post_01_03 " );	// And you never rest?
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Post_01_04 " );	// No! I don't need rest - faith in Innos gives me strength.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_Post_01_05 " );	// And stop distracting me from the case. Better do something!
};


instance DIA_PAL_9161_GUARDWATCH_MISSGOLD(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_missgold_condition;
	information = dia_pal_9161_guardwatch_missgold_info;
	permanent = FALSE;
	description = " Are you all right? " ;
};


func int dia_pal_9161_guardwatch_missgold_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9161_guardwatch_post))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_missgold_info()
{
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGold_01_01 " );	// Are you all right? Why are you so unfriendly?
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_02 " );	// What do you care?
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGold_01_05 " );	// Just tell us what happened and we'll see.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_06 " );	// Well... anyway, during one of my night shifts on the east wall of the fort, I accidentally dropped my wallet downstairs.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_07 " );	// At first I wanted to go down and pick him up, but then I realized that I couldn't quit my post because of such a small thing!
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGold_01_08 " );	// And what's the problem? Would pick it up later.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_09 " );	// That's right, but I just didn't have time to do it... (annoyed)
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_10 " );	// Some vile creature crawled out of the bushes, grabbed my wallet and rushed towards the beach.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_11 " );	// I shot her with my crossbow, but it was so dark...
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_12 " );	// In general, after releasing a couple of bolts - I realized that it was useless.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_13 " );	// Now I can't find my place - I have to get my wallet back!
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGold_01_14 " );	// And what was so valuable about it?
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_15 " );	// In addition to a few hundred gold coins, I kept one ring in it. It is very precious to me!
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGold_01_16 " );	// What is this ring?
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_17 " );	// This is my talisman! It was given to me by Lord Hagen himself, after the battle with the orcs in the deserts of Varant.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_18 " );	// Since then, I have never parted with him! Until now... (sadly)
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGold_01_19 " );	// I understand. And can I help you with something?
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_20 " );	// Absolutely! Just find my wallet and give it back to me.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_21 " );	// Not even the wallet itself, but the ring. The money that was there, I'm not particularly interested.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_22 " );	// So you can keep them.
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGold_01_23 " );	// Okay, I'll try.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_24 " );	// Thank you! You will make me the happiest person if you succeed.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGold_01_25 " );	// Now excuse me - I can't chat for long at the post.
	MIS_LANZRING = LOG_Running;
	Log_CreateTopic(TOPIC_LANZRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LANZRING,LOG_Running);
	B_LogEntry( TOPIC_LANZRING , " Guard Glanz dropped his wallet while on duty on the east wall of the fort. He doesn't really care about the wallet itself, but it contained a ring given to him by Lord Hagen himself. I volunteered to help Glanz. The thing that stole his wallet ran away towards the sandy beach. " );
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9161_GUARDWATCH_MISSGOLDDONE(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_missgolddone_condition;
	information = dia_pal_9161_guardwatch_missgolddone_info;
	permanent = FALSE;
	description = " I found your ring. " ;
};


func int dia_pal_9161_guardwatch_missgolddone_condition()
{
	if((MIS_LANZRING == LOG_Running) && (Npc_HasItems(other,itri_lanzring) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_missgolddone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGoldDone_01_01 " );	// I found your ring.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGoldDone_01_02 " );	// (incredulously) Show me.
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGoldDone_01_03 " );	// Here, take this. This is it?
	B_GiveInvItems(other,self,itri_lanzring,1);
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGoldDone_01_04 " );	// Yes! It's the same ring...(happily) I can't believe it's with me again!
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_MissGoldDone_01_05 " );	// Then I guess you don't have any reason to worry anymore.
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_MissGoldDone_01_06 " );	// Thank you, mate!
	MIS_LANZRING = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LANZRING,LOG_SUCCESS);
	B_LogEntry( TOPIC_LANZRING , " I returned the ring to Glanz. " );
};


instance DIA_PAL_9161_GUARDWATCH_RAYNEHELP(C_Info)
{
	npc = pal_9161_guardwatch;
	nr = 1;
	condition = dia_pal_9161_guardwatch_raynehelp_condition;
	information = dia_pal_9161_guardwatch_raynehelp_info;
	permanent = FALSE;
	description = " Could you help Rain at the warehouse? " ;
};


func int dia_pal_9161_guardwatch_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9161_guardwatch_raynehelp_info()
{
	AI_Output(other,self, " DIA_Pal_9161_GuardWatch_RayneHelp_01_00 " );	// Could you help Rain at the warehouse?
	AI_Output(self,other, " DIA_Pal_9161_GuardWatch_RayneHelp_01_01 " );	// Well, how do you imagine it? (annoyed) Now I'm going to leave my post and go help this poor fellow!
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if (( HELPCOUNTRAYNE  >  10 ) && ( MAYTALKVARUSRAYNE  ==  FALSE ) && ( MY_RAYHELP  == LOG_Running ))
	{
		MAYTALKVARUSRAYNE = TRUE ;
		B_LogEntry( TOPIC_RAYNEHELP , " I feel like I'm wasting my time - none of the paladins want to help Rayne. Maybe I should take more drastic action... " );
	};
};


