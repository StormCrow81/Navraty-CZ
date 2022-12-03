

instance DIA_HUN_743_NIX_EXIT(C_Info)
{
	npc = hun_743_nix;
	nr = 999;
	condition = dia_hun_743_nix_exit_condition;
	information = dia_hun_743_nix_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_743_nix_exit_condition()
{
	return TRUE;
};

func void dia_hun_743_nix_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_743_NIX_WHOSDOGS(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_whosdogs_condition;
	information = dia_hun_743_nix_whosdogs_info;
	permanent = FALSE;
	description = " Is this your dog? " ;
};


func int dia_hun_743_nix_whosdogs_condition()
{
	if (( HEROISHUNTER  ==  TRUE ) && ( CLAWISDEAD  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_whosdogs_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_WhosDogs_01_00 " );	// Is this your dog?
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_01 " );	// If you mean Fang, then yes, mine. It's not really a dog though.
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_02 " );	// You may not believe it, but Fang is born a purebred wolf!
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_06 " );	// About five years ago, during one of my hunts, I came across a little wolf cub in the forest.
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_09 " );	// Apparently, everyone abandoned him, since none of the wolves were near him.
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_10 " );	// In addition, the baby had a broken leg, and with such a wound, he would become easy prey for other animals.
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_11 " );	// Anyway, I picked it up and brought it here to our camp.
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_12 " );	// It took a lot of effort to get it out. The poor fellow was extremely ill and practically without strength.
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_13 " );	// But, in the end, everything fell into place - the leg healed, and the baby gradually recovered and got stronger.
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_14 " );	// By the way, during the time that he spent in our camp, most of the guys, just like me, got very used to him.
	AI_Output(self,other, " DIA_HUN_743_Nix_WhosDogs_01_15 " );	// Since then, this wolf cub has been living with us, gradually becoming the same real hunter as all of us!
};


instance DIA_HUN_743_NIX_NEXDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_nexdog_condition;
	information = dia_hun_743_nix_nexdog_info;
	permanent = FALSE;
	description = " But can a wolf be a hunter? " ;
};


func int dia_hun_743_nix_nexdog_condition()
{
	if ( Npc_KnowsInfo ( other , dia_hun_743_nix_whosdogs ) && ( HEROISHUNTER  ==  TRUE ) && ( CLAWISDEAD  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_nexdog_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_NexDog_01_00 " );	// Can a wolf be a hunter?
	AI_Output(self,other, " DIA_HUN_743_Nix_NexDog_01_03 " );	// Of course. Me and other guys often take it with us to the forest to hunt.
	AI_Output(self,other, " DIA_HUN_743_Nix_NexDog_01_05 " );	// He even saved my life once.
	AI_Output(self,other, " DIA_HUN_743_Nix_NexDog_01_06 " );	// So this wolf means a lot more to me than just a normal beast.
	AI_Output(self,other, " DIA_HUN_743_Nix_NexDog_01_07 " );	// Fang is my friend!
	AI_Output(other,self,"DIA_HUN_743_Nix_NexDog_01_08");	//Ясно.
};


instance DIA_HUN_743_NIX_NEXILLDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_nexilldog_condition;
	information = dia_hun_743_nix_nexilldog_info;
	permanent = FALSE;
	description = " Your friend looks a bit weak. " ;
};


func int dia_hun_743_nix_nexilldog_condition()
{
	if ( Npc_KnowsInfo ( other , dia_hun_743_nix_nexdog ) && ( HEROISHUNTER  ==  TRUE ) && ( CLAWISDEAD  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_nexilldog_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_NexIllDog_01_00 " );	// Your friend looks a little weak.
	AI_Output(self,other, " DIA_HUN_743_Nix_NexIllDog_01_01 " );	// It seems only at first glance.
	AI_Output(self,other, " DIA_HUN_743_Nix_NexIllDog_01_02 " );	// In fact, the Fang is much stronger and more resilient than his ordinary relatives.
	AI_Output(self,other, " DIA_HUN_743_Nix_NexIllDog_01_06 " );	// True, during the last hunt, one warg seriously injured him.
	AI_Output(self,other, " DIA_HUN_743_Nix_NexIllDog_01_07 " );	// I did everything I could - but it seems that this is not enough for him to finally recover.
};


instance DIA_HUN_743_NIX_RECOVERDOG(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdog_condition;
	information = dia_hun_743_nix_recoverdog_info;
	permanent = FALSE;
	description = " Is there something I can help you with? " ;
};


func int dia_hun_743_nix_recoverdog_condition()
{
	if ( Npc_KnowsInfo ( other , dia_hun_743_nix_nexilldog ) && ( HEROISHUNTER  ==  TRUE ) && ( CLAWISDEAD  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdog_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_RecoverDog_01_00 " );	// Is there anything I can do to help?
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDog_01_01 " );	// The only thought that comes to my mind is to turn to Sagitta, the forest healer.
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDog_01_02 " );	// She lives deep in the woods behind the Secoba farm.
	if ( Npc_KnowsInfo ( other , DIA_Say_HELLO ))
	{
		AI_Output(other,self, " DIA_HUN_743_Nix_RecoverDog_01_03 " );	// I know where she lives.
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDog_01_04 " );	// This is good.
	};
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDog_01_05 " );	// However, I'm not sure if she can help Fang either.
	AI_Output(other,self, " DIA_HUN_743_Nix_RecoverDog_01_07 " );	// But it's worth a try anyway.
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDog_01_08 " );	// Good. I beg you, hurry up!
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDog_01_09 " );	// The Fang is getting weaker every day. I don't even want to think about what could happen!
	CLOCKTIMER = Wld_GetDay();
	MIS_RECOVERDOG = LOG_Running;
	Log_CreateTopic(TOPIC_RECOVERDOG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RECOVERDOG,LOG_Running);
	; _ _ _ _ _ _
};


instance DIA_HUN_743_NIX_RECOVERDOGBRING(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogbring_condition;
	information = dia_hun_743_nix_recoverdogbring_info;
	permanent = FALSE;
	description = " I brought medicine for your wolf. " ;
};


func int dia_hun_743_nix_recoverdogbring_condition()
{
	if (( MIS_RECOVERDOG  == LOG_Running ) && ( SAGITTAHELPSCLAW  ==  TRUE ) && ( Npc_HasItems ( other , itpo_sagittaclawpotion ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogbring_info()
{
	where int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_HUN_743_Nix_RecoverDogBring_01_00 " );	// I brought medicine for your wolf.
	if(CLAWTIMER < (daynow - 3))
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogBring_01_01 " );	// Hey buddy! Thank you, of course.
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogBring_01_02 " );	// But, unfortunately, you're too late - Fang is no longer with us.
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogBring_01_03 " );	// He died and there was nothing I could do to help him... although I simply had to do it.
		AI_StopProcessInfos(self);
		MIS_RECOVERDOG = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_RECOVERDOG);
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogBring_01_04 " );	// True? Do you think it will really help him?
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogBring_01_06 " );	// What should be done?
		AI_Output(other,self, " DIA_HUN_743_Nix_RecoverDogBring_01_07 " );	// We need to treat his wound with this herbal infusion she gave.
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogBring_01_08 " );	// Okay, give this medicine here.
		AI_Output(other,self, " DIA_HUN_743_Nix_RecoverDogBring_01_09 " );	// Here, take this.
		B_GiveInvItems(other,self,itpo_sagittaclawpotion,1);
		Npc_RemoveInvItems(self,itpo_sagittaclawpotion,1);
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogBring_01_10 " );	// Good! Now I'll treat the wound...
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_HUNTERCAMP_CLAW");
		AI_AlignToWP(self);
		AI_PlayAni(self,"T_PLUNDER");
		AI_GotoNpc(self,hero);
		AI_TurnToNPC(self,other);
		AI_LookAtNpc(self,other);
		AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogBring_01_11 " );	// All. Hope this helps.
		; _ _ _ _ _ _
		CLAWTIMERRECOVER = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Recover");
		CLAWBEGINRECOVER = TRUE;
	};
};


instance DIA_HUN_743_NIX_RECOVERDOGABOUT(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogabout_condition;
	information = dia_hun_743_nix_recoverdogabout_info;
	permanent = TRUE;
	description = " How does Fang feel? " ;
};


func int dia_hun_743_nix_recoverdogabout_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (CLAWBEGINRECOVER == TRUE) && (CLAWHEALTHOK == FALSE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogabout_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_RecoverDogAbout_01_01 " );	// How is Fang feeling?
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogAbout_01_02 " );	// Eh... (sighing sadly) so far so bad.
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogAbout_01_03 " );	// It may take more time for him to fully recover.
};


instance DIA_HUN_743_NIX_RECOVERDOGDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_recoverdogdone_condition;
	information = dia_hun_743_nix_recoverdogdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_recoverdogdone_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (CLAWHEALTHOK == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_recoverdogdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogDone_01_00 " );	// Hey buddy!
	AI_Output(other,self,"DIA_HUN_743_Nix_RecoverDogDone_01_01");	//Что?
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogDone_01_02 " );	// Thanks to our efforts and Sagitta's medicine, Fang's wound has already healed and he is on the mend.
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogDone_01_03 " );	// So I want to thank you from the bottom of my heart for helping me heal him.
	AI_Output(self,other, " DIA_HUN_743_Nix_RecoverDogDone_01_04 " );	// Here, take this little thing as my thanks.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	MIS_RECOVERDOG = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RECOVERDOG,LOG_SUCCESS);
	B_LogEntry( TOPIC_RECOVERDOG , " Nyx told me Sagitta's medicine helped Fang and he got better. " );
};


instance DIA_HUN_743_NIX_CLAWGOHUNT(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_clawgohunt_condition;
	information = dia_hun_743_nix_clawgohunt_info;
	permanent = FALSE;
	description = " When are you going to hunt now? " ;
};


func int dia_hun_743_nix_clawgohunt_condition()
{
	if((MIS_RECOVERDOG == LOG_SUCCESS) && (HEROISHUNTER == TRUE) && (CLAWISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_clawgohunt_info()
{
	var C_Npc dog;
	dog = Hlp_GetNpc(nixdog);
	AI_Output(other,self, " DIA_HUN_743_Nix_ClawGoHunt_01_00 " );	// When are you going to hunt now?
	AI_Output(self,other, " DIA_HUN_743_Nix_ClawGoHunt_01_01 " );	// I don't know, mate. I still have enough things to do in the camp.
	AI_Output(self,other, " DIA_HUN_743_Nix_ClawGoHunt_01_02 " );	// By the way, if you suddenly decide to go hunting yourself, you can take Fang with you.
	AI_Output(self,other, " DIA_HUN_743_Nix_ClawGoHunt_01_05 " );	// At the same time, you will see what he is capable of!
	AI_Output(self,other, " DIA_HUN_743_Nix_ClawGoHunt_01_06 " );	// True, it's better not to do this right now - let Fang finally recover. Well, in a couple of days...
	AI_Output(other,self, " DIA_HUN_743_Nix_ClawGoHunt_01_07 " );	// Okay, I'll think about it.
	CLAWTIMERCLAWGOHUNT = Wld_GetDay();
	dog.start_aistate = zs_mm_rtn_huntgone;
};


instance DIA_HUN_743_NIX_CLAWREVENGE(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_clawrevenge_condition;
	information = dia_hun_743_nix_clawrevenge_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_743_nix_clawrevenge_condition()
{
	if(KILLCLAWREVENGE == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_clawrevenge_info()
{
	if(NIXFIRSTWARN == FALSE)
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_ClawRevenge_01_01 " );	// Why did you kill Fang, you bastard! What did he do wrong to you?!
		if(MIS_RECOVERDOG == LOG_Running)
		{
			MIS_RECOVERDOG = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_RECOVERDOG);
		}
		else
		{
		};
		AI_Output(self,other, " DIA_HUN_743_Nix_ClawRevenge_01_04 " );	// Idiot! He was my friend and didn't deserve to die like that!
		AI_Output(self,other, " DIA_HUN_743_Nix_ClawRevenge_01_05 " );	// I'll kill you for this, you bastard!
		AI_StopProcessInfos(self);
		NIXFIRSTWARN = TRUE;
		B_Attack(self,other,AR_KILL,1);
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_ClawRevenge_01_06 " );	// I remember what you did, you bastard!
		AI_Output(self,other, " DIA_HUN_743_Nix_ClawRevenge_01_08 " );	// I'll never forgive you for this - die, you bastard!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};


instance DIA_HUN_743_NIX_WELCOME(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_welcome_condition;
	information = dia_hun_743_nix_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_welcome_condition()
{
	if (( HEROISHUNTER  ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_welcome_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_Welcome_01_01 " );	// Hey, look who we have here. Another hunter!
		AI_Output(self,other, " DIA_HUN_743_Nix_Welcome_01_03 " );	// There's always room in our camp for guys like you.
		AI_Output(self,other, " DIA_HUN_743_Nix_Welcome_01_04 " );	// And if you want to stay with us, just talk to Falk.
		AI_Output(self,other, " DIA_HUN_743_Nix_Welcome_01_05 " );	// He's in charge here.
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_Welcome_01_06 " );	// Hey you! What do you want here, huh?!
		AI_Output(other,self, " DIA_HUN_743_Nix_Welcome_01_07 " );	// Yes, I'm just walking around here.
		AI_Output(self,other, " DIA_HUN_743_Nix_Welcome_01_09 " );	// Boy, hunters live here and you don't belong here!
		AI_Output(self,other, " DIA_HUN_743_Nix_Welcome_01_11 " );	// And if you cause trouble in the camp, I will personally teach you good manners! Understood?!
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_743_NIX_WELCOMEHUNT (C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_welcomehunt_condition;
	information = dia_hun_743_nix_welcomehunt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_welcomehunt_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_welcomehunt_info()
{
	AI_Output(self,other, " DIA_HUN_743_Nix_WelcomeHunt_01_00 " );	// So you're one of us now, mate?
	AI_Output(other,self, " DIA_HUN_743_Nix_WelcomeHunt_01_01 " );	// Yes, Falk accepted me to the camp.
	AI_Output(self,other, " DIA_HUN_743_Nix_WelcomeHunt_01_02 " );	// Well then, congratulations! And I am sure that you will not regret your decision to join us.
};


instance DIA_HUN_743_NIX_NEWS(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_news_condition;
	information = dia_hun_743_nix_news_info;
	permanent = TRUE;
	description = " Is everything calm in the camp? " ;
};


func int dia_hun_743_nix_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_news_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_News_01_00 " );	// Is everything calm in the camp?
	if ((Chapter >=  3 ) && ( MY_INBLACKSANPPER  ==  FALSE ))
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_01 " );	// Yes, there is something...
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_02 " );	// They say that some unusual snapper was seen in the north of the valley near the ancient pyramids.
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_03 " );	// Unlike its kin, this one was black as night! And besides that, he was behaving strangely.
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_04 " );	// Moreover, according to rumors, this black snapper hunted alone there, although usually these creatures live only in a flock.
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_06 " );	// Some people say that killing such an animal is considered a great success for the hunter!
		AI_Output(other,self,"DIA_HUN_743_Nix_News_01_07");	//Почему?
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_08 " );	// Yes, because meeting him is already a great luck! Not to mention everything else.
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_09 " );	// Although for me personally, these are just stupid superstitions.
		MIS_INSBLACKSANPPER = LOG_Running;
		Log_CreateTopic(TOPIC_INSBLACKSANPPER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSBLACKSANPPER,LOG_Running);
		B_LogEntry( TOPIC_INSBLACKSANPPER , " According to the hunter Nyx, an unusual black snapper was seen near the ancient pyramids. They say that killing such a snapper is a great success for a hunter. " );
		Wld_InsertNpc(blacksnapper,"NW_TROLLAREA_RUINS_22");
	}
	else  if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_11 " );	// Looks like yes. However, many guys are worried about the appearance in the district of these guys in black.
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_12 " );	// I think they didn't show up here just like that!
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_13 " );	// Apparently, they are looking for something or someone... (mysteriously)
	}
	else  if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_16 " );	// For now, yes. Although I'm a little worried that orcs have been appearing here quite often lately.
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_17 " );	// I don't like all this.
	}
	else  if (chapter ==  6 )
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_18 " );	// All the guys are on their nerves!
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_19 " );	// The county is just teeming with orcs - you just can't take a step out of here.
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_20 " );	// Well, yes. And why should there be restlessness?
		AI_Output(self,other, " DIA_HUN_743_Nix_News_01_21 " );	// I will say even more - you will not find a calmer place in all Khorinis!
	};
};


instance DIA_HUN_743_NIX_INSBLACKSANPPER (C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_insblacksanpper_condition;
	info = dia_hun_743_nix_insblacksanpper_info;
	permanent = FALSE;
	description = " I killed the black snapper. " ;
};


func int dia_hun_743_nix_insblacksanpper_condition()
{
	if((MIS_INSBLACKSANPPER == LOG_Running) && Npc_IsDead(blacksnapper) && (Npc_HasItems(other,itat_clawblacksnapper) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_insblacksanpper_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_743_Nix_InsBlackSanpper_01_00 " );	// I killed the black snapper.
	AI_Output(self,other, " DIA_HUN_743_Nix_InsBlackSanpper_01_01 " );	// True? Where is the evidence?
	AI_Output(other,self, " DIA_HUN_743_Nix_InsBlackSanpper_01_02 " );	// Here are his claws.
	B_GiveInvItems(other,self,itat_clawblacksnapper,1);
	Npc_RemoveInvItems(self,itat_clawblacksnapper,1);
	AI_Output(self,other, " DIA_HUN_743_Nix_InsBlackSanpper_01_03 " );	// Wow... Just incredible!
	AI_Output(self,other, " DIA_HUN_743_Nix_InsBlackSanpper_01_04 " );	// Guy, you're just lucky!
	AI_Output(self,other, " DIA_HUN_743_Nix_InsBlackSanpper_01_05 " );	// Congratulations.
	AI_Output(self,other, " DIA_HUN_743_Nix_InsBlackSanpper_01_06 " );	// You're just a great hunter!
	MIS_INSBLACKSANPPER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSBLACKSANPPER,LOG_SUCCESS);
	B_LogEntry( TOPIC_INSBLACKSANPPER , " Nyx was amazed when I showed him the claws of the black snapper I killed. " );
};


instance DIA_HUN_743_NIX_RESPECT(C_Info)
{
	npc = hun_743_nix;
	nr = 4;
	condition = dia_hun_743_nix_respect_condition;
	information = dia_hun_743_nix_respect_info;
	permanent = FALSE;
	description = " I need your help. " ;
};


func int dia_hun_743_nix_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( NIX_RESPECT  ==  FALSE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_respect_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_Respect_01_00 " );	// I need your help.
	AI_Output(self,other, " DIA_HUN_743_Nix_Respect_01_01 " );	// And which one exactly?
	AI_Output(other,self, " DIA_HUN_743_Nix_Respect_01_02 " );	// I'm going to challenge Falk to a duel, but I'll have to enlist the support of most of the hunters to do so.
	AI_Output(other,self, " DIA_HUN_743_Nix_Respect_01_03 " );	// Can I count on your vote?
	if((MIS_RECOVERDOG == LOG_SUCCESS) || (MIS_INSBLACKSANPPER == LOG_SUCCESS))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_743_Nix_Respect_01_04 " );	// Of course, mate!
		if(MIS_RECOVERDOG == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_HUN_743_Nix_Respect_01_05 " );	// After all, you helped me get out of the Fang, and I never forget such things!
			AI_Output(self,other, " DIA_HUN_743_Nix_Respect_01_06 " );	// So feel free to go to Falk and say that I support you.
		}
		else
		{
			AI_Output(self,other, " DIA_HUN_743_Nix_Respect_01_07 " );	// The mere fact that you were able to take down that black snapper already says that you are an excellent hunter and worthy of respect!
			AI_Output(self,other, " DIA_HUN_743_Nix_Respect_01_08 " );	// So feel free to go to Falk and say that I support you.
		};
		B_LogEntry( TOPIC_HUNTERSWORK , " Nyx will vote for me if I decide to challenge Falk. " );
		NIX_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_Respect_01_10 " );	// You haven't proven yourself worthy yet.
		AI_Output(self,other, " DIA_HUN_743_Nix_Respect_01_11 " );	// So first, show yourself in some way, and then we'll talk.
	};
};


instance DIA_HUN_743_NIX_RESPECTDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 4;
	condition = dia_hun_743_nix_respectdone_condition;
	information = dia_hun_743_nix_respectdone_info;
	permanent = TRUE;
	description = " What about my request? " ;
};


func int dia_hun_743_nix_respectdone_condition()
{
	if ( Npc_KnowsInfo ( other , dia_hun_743_nix_respect ) && ( CANHUNTERCHALLANGE  ==  TRUE ) && ( NIX_RESPECT  ==  FALSE ) && ( MIS_HUNTERCHALLANGE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_respectdone_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_RespectDone_01_00 " );	// What about my request?
	if((MIS_RECOVERDOG == LOG_SUCCESS) || (MIS_INSBLACKSANPPER == LOG_SUCCESS))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_743_Nix_RespectDone_01_01 " );	// Well, why not?
		if(MIS_RECOVERDOG == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_HUN_743_Nix_RespectDone_01_02 " );	// After all, you helped me get out of the Fang, and I never forget such things!
			AI_Output(self,other, " DIA_HUN_743_Nix_RespectDone_01_03 " );	// So feel free to go to Falk and say that I support you.
		}
		else
		{
			AI_Output(self,other, " DIA_HUN_743_Nix_RespectDone_01_04 " );	// The mere fact that you were able to take down that black snapper already says that you are an excellent hunter and worthy of respect!
			AI_Output(self,other, " DIA_HUN_743_Nix_RespectDone_01_05 " );	// So feel free to go to Falk and say that I support you.
		};
		B_LogEntry( TOPIC_HUNTERSWORK , " Nyx will vote for me if I decide to challenge Falk. " );
		NIX_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_743_Nix_RespectDone_01_06 " );	// Guy! I told you that you need to prove yourself in practice, and not bother me with questions!
		AI_Output(self,other, " DIA_HUN_743_Nix_RespectDone_01_07 " );	// What's wrong here?
	};
};


instance DIA_HUN_743_NIX_HELLO(C_Info)
{
	npc = hun_743_nix;
	nr = 2;
	condition = dia_hun_743_nix_hello_condition;
	information = dia_hun_743_nix_hello_info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int dia_hun_743_nix_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_hello_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_Hello_01_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_HUN_743_Nix_Hello_01_01 " );	// I can show you how to get more agile.
	AI_Output(self,other, " DIA_HUN_743_Nix_Hello_01_02 " );	// If you want, of course.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry( TOPIC_HUNTERTEACHERS , " Nyx can show me how to be more agile. " );
};


instance DIA_HUN_743_NIX_DEX (C_Info)
{
	npc = hun_743_nix;
	nr = 3;
	condition = dia_hun_743_nix_dex_condition;
	information = dia_hun_743_nix_dex_info;
	permanent = TRUE;
	description = " Show me how to become more agile. " ;
};


func int dia_hun_743_nix_dex_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_743_nix_hello))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_dex_info()
{
	AI_Output(other,self, " DIA_HUN_743_Nix_Dex_01_00 " );	// Show me how to get more agile.
	AI_Output(self,other, " DIA_HUN_743_Nix_Dex_01_01 " );	// Hunting success depends a lot on dexterity!
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};

func void dia_hun_743_nix_dex_back()
{
	Info_ClearChoices(dia_hun_743_nix_dex);
};

func void dia_hun_743_nix_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};

func void dia_hun_743_nix_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_hun_743_nix_dex);
	Info_AddChoice(dia_hun_743_nix_dex,Dialog_Back,dia_hun_743_nix_dex_back);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_hun_743_nix_dex_1);
	Info_AddChoice(dia_hun_743_nix_dex,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_hun_743_nix_dex_5);
};


instance DIA_HUN_743_NIX_SHADOWFUR(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_shadowfur_condition;
	information = dia_hun_743_nix_shadowfur_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_743_nix_shadowfur_condition()
{
	if ((Capital >=  2 ) && ( HEROISHUNTER  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_shadowfur_info()
{
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFur_01_00 " );	// Hey, wait. I have one thing for you.
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFur_01_02 " );	// I desperately need a mrakoris hide! But I can't go hunting - I have to guard this camp.
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFur_01_03 " );	// But you are another matter! Get me that skin and I promise you won't regret it.
	AI_Output(other,self, " DIA_HUN_743_Nix_ShadowFur_01_04 " );	// Where can I find the obscurantists?
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFur_01_05 " );	// They usually live in caves or deep forests.
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFur_01_06 " );	// These animals don't like daylight too much, so they do their best to hide from it.
	AI_Output(other,self, " DIA_HUN_743_Nix_ShadowFur_01_07 " );	// I'll see what I can do.
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFur_01_08 " );	// Thanks mate. Believe me, I will not stay in debt!
	MIS_SHADOWFURNIX = LOG_Running;
	Log_CreateTopic(TOPIC_SHADOWFURNIX,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHADOWFURNIX,LOG_Running);
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
};


instance DIA_HUN_743_NIX_SHADOWFURDONE(C_Info)
{
	npc = hun_743_nix;
	nr = 1;
	condition = dia_hun_743_nix_shadowfurdone_condition;
	information = dia_hun_743_nix_shadowfurdone_info;
	permanent = FALSE;
	description = " Here is the mrakoris hide you asked for. " ;
};


func int dia_hun_743_nix_shadowfurdone_condition()
{
	if((MIS_SHADOWFURNIX == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowFur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_743_nix_shadowfurdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_743_Nix_ShadowFurDone_01_00 " );	// Here's the mrakoris skin you asked for.
	B_GiveInvItems(other,self,ItAt_ShadowFur,1);
	Npc_RemoveInvItems(self,ItAt_ShadowFur,1);
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFurDone_01_01 " );	// Great! You must have had a little tinkering with this case, right?
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFurDone_01_02 " );	// Quite a bit.
	AI_Output(self,other, " DIA_HUN_743_Nix_ShadowFurDone_01_03 " );	// Well then, okay! Here, take this gold - you honestly earned it!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_SHADOWFURNIX = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SHADOWFURNIX,LOG_SUCCESS);
	B_LogEntry( TOPIC_SHADOWFURNIX , " I've obtained a Shadowhide Hide for Hunter Nyx. " );
};


instance DIA_HUN_743_NIXNW_PICKPOCKET(C_Info)
{
	npc = hun_743_nix;
	nr = 900;
	condition = dia_hun_743_nixnw_pickpocket_condition;
	information = dia_hun_743_nixnw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_743_nixnw_pickpocket_condition()
{
	return  C_Robbery ( 65 , 90 );
};

func void dia_hun_743_nixnw_pickpocket_info()
{
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
	Info_AddChoice(dia_hun_743_nixnw_pickpocket,Dialog_Back,dia_hun_743_nixnw_pickpocket_back);
	Info_AddChoice(dia_hun_743_nixnw_pickpocket,DIALOG_PICKPOCKET,dia_hun_743_nixnw_pickpocket_doit);
};

func void dia_hun_743_nixnw_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
};

func void dia_hun_743_nixnw_pickpocket_back()
{
	Info_ClearChoices(dia_hun_743_nixnw_pickpocket);
};

