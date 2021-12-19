
instance DIA_Ass_127_Osair_EXIT(C_Info)
{
	npc = Ass_127_Osair;
	No. = 999 ;
	condition = dia_Ass_127_Osair_exit_condition;
	information = dia_Ass_127_Osair_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_127_Osair_exit_condition()
{
	return TRUE;
};

func void dia_Ass_127_Osair_exit_info()
{
	if((OsairGetsNrozasPoisonLaw == TRUE) && (MIS_NrozasPoisonGift == FALSE) && (NrozasIsDead == FALSE))
	{
		AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_01 " );	//Wait! Before you leave, here.
		B_GiveInvItems(self,other,ItFo_BeliarTear,1);
		AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_02 " );	//Take this bottle of fine wine and take it to Nrozas. As a token of my gratitude.
		AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_03 " );	//Of course, master. As you wish.
		AI_Output(self,other  , " DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_04 " );     //Now go.
		MIS_NrozasPoisonGift = LOG_Running;
		Log_CreateTopic(TOPIC_NrozasPoisonGift,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_NrozasPoisonGift,LOG_Running);
		B_LogEntry (TOPIC_NrozasPoisonGift, " Osair wants me to give Master Nrozas a bottle of wine as a thank you. " );
	};

	AI_StopProcessInfos(self);
};


instance DIA_Ass_127_Osair_PreHALLO(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_PreHALLO_condition;
	information = dia_Ass_127_Osair_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairMurid == FALSE) && (OsairMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_PreHALLO_info()
{
	AI_Output (self, other, " DIA_Ass_127_Osair_PreHALLO_01_00 " );	//(drily) What do you need, novice? Speak up!
};

instance DIA_Ass_127_Osair_PreHALLO_Kill(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_PreHALLO_Kill_condition;
	information = dia_Ass_127_Osair_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairMurid == FALSE) && (MIS_NrozasToOsair == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_127_Osair_NrozasToOsair(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_NrozasToOsair_condition;
	information = dia_Ass_127_Osair_NrozasToOsair_info;
	permanent = FALSE ;
	description = " Master Nrozas sent me. " ;
};

func int dia_Ass_127_Osair_NrozasToOsair_condition()
{
	if(MIS_NrozasToOsair == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_NrozasToOsair_info()
{
	B_GivePlayerXP(100);
	AI_Output (other, self, " DIA_Ass_127_Osair_NrozasToOsair_01_01 " );	//Master Nrozas sent me.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_02");		//What does he want?
	AI_Output (other, self, " DIA_Ass_127_Osair_NrozasToOsair_01_03 " );	//He asked me to tell you to send him stronger slaves next time.
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_04 " );	//(haughtily) And what, pray tell, is wrong with the current ones?
	AI_Output (other, self, " DIA_Ass_127_Osair_NrozasToOsair_01_05 " );	//They die too quickly.
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_06 " );	//Of course. Considering what he gets up to with them.
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_07 " );	//Although without his expertise with poisons, we would have had to be a little stricter about his... predelections.
	AI_Output( self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_08 " );	//Alright, here.
	B_UseFakeScroll();
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_09 " );	//Give him this letter, novice. Here is my answer to his request.
	B_GiveInvItems(self,other,ItWr_Osair,1);
	AI_Output(other,self, " DIA_Ass_127_Osair_NrozasToOsair_01_10");	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_11 " );	//By the way, since you are here, novice, then I have one more assignment for you.
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_12 " );	//Recently a flock of black glorchs appeared near my cave.
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_13 " );	//It doesn't bother me and my people much, but they recently ate my messenger.
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_14 " );	//And this, as you may guess, I cannot tolerate.
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_15 " );	//I want you to deal with them for me.
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_16 " );	//This might even show me what you are capable of. Understand?
	AI_Output (other,self , " DIA_Ass_127_Osair_NrozasToOsair_01_17 " );	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_127_Osair_NrozasToOsair_01_18 " );	//Good. Then go.
	MIS_OsairSnappers = LOG_Running;
	OsairMeet = TRUE;
	Log_CreateTopic(TOPIC_OsairSnappers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairSnappers,LOG_Running);
 	B_LogEntry (TOPIC_OsairSnappers, " One of Master Osair's messengers was recently devoured by a flock of black glorchs that appeared near his cave. He wants me to fix this problem and prove myself in this way. " );
	B_LogEntry_Quiet (TOPIC_NrozasToOsair, " I told Osair about Nrozas's request. In response, he asked me to give him a letter. It looks like Osair has his own thoughts on this matter. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Snapper_Black_Osair_01,"PW_OSAIRSNAPPER_01");
	Wld_InsertNpc(Snapper_Black_Osair_02,"PW_OSAIRSNAPPER_02");
	Wld_InsertNpc(Snapper_Black_Osair_03,"PW_OSAIRSNAPPER_03");
	Wld_InsertNpc(Snapper_Black_Osair_04,"PW_OSAIRSNAPPER_04");
	Wld_InsertNpc(Snapper_Black_Osair_05,"PW_OSAIRSNAPPER_05");
};	


instance DIA_Ass_127_Osair_Snapper(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_Snapper_condition;
	information = dia_Ass_127_Osair_Snapper_info;
	permanent = FALSE ;
	description = " I killed the black glorchs. " ;
};

func int dia_Ass_127_Osair_Snapper_condition()
{
	if((MIS_OsairSnappers == LOG_Running) && (Npc_IsDead(Snapper_Black_Osair_01)) && (Npc_IsDead(Snapper_Black_Osair_02)) && (Npc_IsDead(Snapper_Black_Osair_03)) && (Npc_IsDead(Snapper_Black_Osair_04)) && (Npc_IsDead(Snapper_Black_Osair_05)))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Snapper_info()
{
	B_GivePlayerXP(500);
	AI_Output (other, self, " DIA_Ass_127_Osair_Snapper_01_01 " );	//I killed the black glorchs.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_02 " );	//Hmmm. Well, then I have nothing more to worry about. Right?
	AI_Output (other, self, " DIA_Ass_127_Osair_Snapper_01_03");	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_04 " );	//That's great! Excellent work, novice.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_05 " );	//And since you did your job so well, I decided to give you one more. More difficult than the first.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_06 " );	//I hope you don't mind?
	AI_Output (other, self, " DIA_Ass_127_Osair_Snapper_01_07 " );	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_08 " );	//Then listen. You have already encountered my slaves, below? Yes?
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_09 " );	//I sense that a pathetic little insurrection is brewing among them.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_10 " );	//Of course, they are delusional if they think they can oppose me or dream of escaping from here.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_11 " );	//But the point is moot. It will be necessary to knock this nonsense out of their heads so that they will fear the very thought of rebellion.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_12 " );	//Therefore, I need to find their little instigator and "re-educate" him. In front of all of them.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_13 " );	//And that is where you come in.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_14 " );	//Find the one who incites the slaves to revolt and then inform me about it. Do you understand everything?
	AI_Output (other, self, " DIA_Ass_127_Osair_Snapper_01_15 " );	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_16 " );	//You have your orders.
	AI_Output (self, other, " DIA_Ass_127_Osair_Snapper_01_17 " );	//If you need to talk to the slaves, tell the guards I sent you.
	MIS_OsairSnappers = LOG_SUCCESS;
	MIS_RebelSlave = LOG_Running;
	OsairLetsPrision = TRUE;
	Log_CreateTopic(TOPIC_RebelSlave,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairSnappers,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_RebelSlave,LOG_Running);
	B_LogEntry (TOPIC_OsairSnappers, " Osair was pleased that I was able to deal with the glorchs. " );
	B_LogEntry_Quiet (TOPIC_RebelSlave, " Osair gave me another assignment. I have to find a slave who is encouraging the rest of the prisoners to escape. I wonder where I should start? " );
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_OsairDemand(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_OsairDemand_condition;
	information = dia_Ass_127_Osair_OsairDemand_info;
	permanent = FALSE ;
	description = " (give the skin of a cave troll) " ;
};

func int dia_Ass_127_Osair_OsairDemand_condition()
{
	if((MIS_OsairDemand == LOG_Running) && (Npc_HasItems(other,ItAt_CaveBlackFurTroll) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_OsairDemand_info()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_CaveBlackFurTroll,1);
	AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_02 " );	//What is this, novice? Wait. Is this what I think it is?
	AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_03 " );	//It's the skin of a black cave troll! Incredible! Nrozas agreed to part with this?
	AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_04 " );	//Bah, it doesn't matter. All that matters is that it is mine!
	AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_05 " );	//I will send him my strongest slaves. As he requested.
	MIS_OsairDemand = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OsairDemand,LOG_SUCCESS);
	B_LogEntry (TOPIC_OsairDemand, " Osair was overjoyed to get the hide of a black cave troll. Now he will send Nrozas his best slaves. " );

	if(MIS_RebelSlave == LOG_SUCCESS)
	{
		AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_06 " );	//As for you, novice. You were able to prove to me that you are capable of much.
		AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_07 " );	//Believe me, few have succeeded at that.
		AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_08 " );	//And as a reward for your diligence, from now on you are my chosen murid!
		AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_09 " );	//I think you understand what this means and will not let me down in the future.
		AI_Output (other, self, " DIA_Ass_128_Osair_OsairDemand_01_10 " );	//Thank you, master.
		AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_11 " );	//No need to thank me. This is well deserved.
		OsairMurid = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry_Quiet (TOPIC_MasiafStory, " Master Osair was pleased that I was able to carry out all his orders. For this he appointed me as his murid, the chosen novice. I must inform Gonzalez about this. " );

		if((NrozasMurid == TRUE) && (PlayerSendToTiamant == FALSE))
		{
			AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_12 " );	//Oh, one more thing.
			AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_13 " );	//Since you were able to defeat the cave troll, then I must assume that you are quite a skilled fighter.
			AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_14 " );	//Prior Tiamant is engaged in the combat training of the Shadows, and I'm sure he will be interested in this fact.
			AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_15 " );	//Talk to him. And if he has any questions, just tell him that I sent you.
			AI_Output (other, self, " DIA_Ass_127_Osair_OsairDemand_01_16 " );	//Yes master.
			PlayerSendToTiamant = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, " DIA_Ass_127_Osair_OsairDemand_01_17 " );	//What are you waiting for? Go - I'm sure you still have work to do.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_127_Osair_Murid (C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_Murid_condition;
	information = dia_Ass_127_Osair_Murid_info;
	permanent = FALSE ;
	description = " What does it mean to be the chosen one, master? " ;
};

func int dia_Ass_127_Osair_Murid_condition()
{
	if((OsairMurid == TRUE) && (MuridTells == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Murid_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_Murid_01_01 " );	//What does it mean to be the chosen one, master?
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_02 " );	//Let me explain something to you. Listen carefully.
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_03 " );	//Once every four years, one of our novices is raised to become the Shadow of Masiaf.
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_04 " );	//Shadows are what we call our warriors, bringing death to all those who doubt our power and, most importantly, the power of Beliar himself.
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_05 " );	//Each Masiaf Prior, including myself, chooses from among the novices one who, in his opinion, is worthy of it.
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_06 " );	//And appoints him as his murid, thereby proposing him as a candidate for the ritual of conversion.
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_07 " );	//When the time comes, all murids undergo a series of very difficult and deadly tests.
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_08 " );	//And the one who survives undergoes the rite of initiation into a chosen warrior of Beliar. 
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_09 " );	//I chose you as my murid. However, others, as far as I know, have not yet made their choice.
	AI_Output (other, self, " DIA_Ass_127_Osair_Murid_01_10 " );	//What if all the priests choose the same novice?
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_11 " );	//(thoughtfully) As far as I know, this has never happened before.
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_12 " );	//But, most likely, his fate will be decided by Haniar the Blind himself, as he is the most powerful and wise of us.
	AI_Output (self, other, " DIA_Ass_127_Osair_Murid_01_13 " );	//And what he decides is known only to Beliar himself.
	MuridTells = TRUE;
	B_LogEntry (TOPIC_MasiafStory, " Osair told me about the ritual of turning selected novices into the ranks of the Shadows - warriors of the Brotherhood of Masiaf. Each prior must choose a murid, and then they compete with each other. If all the priors choose the same person, then the fate of this murid is decided by Haniar the Blind. " );
};

instance DIA_Ass_127_RebelSlave(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_RebelSlave_condition;
	information = dia_Ass_127_Osair_RebelSlave_info;
	permanent = FALSE ;
	description = " (point to novice) " ;
};

func int dia_Ass_127_Osair_RebelSlave_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (Npc_IsDead(SEK_156_SLAVEOBSSEK) == FALSE) && (PW_Betray.aivar[AIV_PARTYMEMBER] == TRUE) && (PW_BetrayFollowMe == TRUE) && (Npc_GetDistToWP(PW_Betray,"PW_OSAIR_BETRAY") <= 750))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_RebelSlave_info()
{
	B_GivePlayerXP(500);
	AI_Output (other, self, " DIA_Ass_127_Osair_RebelSlave_01_01 " );	//(indicates a novice)
	AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_02 " );	//(peering) So this is our hero?
	AI_Output (other, self, " DIA_Ass_127_Osair_RebelSlave_01_03" ) ;	//(nods silently)
	AI_PlayAni(other,"T_YES");
	PW_Betray.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_04 " );	//Well then, I guess I no longer need to worry about the mutiny.
	AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_05 " );	//(ominously) I'll deal with him later. As for you, good work.
	MIS_RebelSlave = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RebelSlave,LOG_SUCCESS);
	B_LogEntry (TOPIC_RebelSlave, " Osair was pleased that I was able to bring him the instigator of the riot, although not the real one. But he will never know about it. " );

	if(MIS_OsairDemand == LOG_SUCCESS)
	{
		AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_06 " );	//You were able to prove to me that you are capable of much. And take my word for it, few have succeeded.
		AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_07 " );	//Therefore, as a reward for your efforts, from now on I will call you my chosen murid!
		AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_08 " );	//I think you understand what this means and will not let me down in the future.
		AI_Output (other, self, " DIA_Ass_128_Osair_RebelSlave_01_09 " );	//Thank you, master.
		AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_10 " );	//Not worth it. You just got what you deserve.
		OsairMurid = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry_Quiet (TOPIC_MasiafStory, " I was able to carry out all the orders of Master Osair. For this he appointed me as his murid, the chosen novice. I must inform Gonzalez about this. " );

		if((NrozasMurid == TRUE) && (PlayerSendToTiamant == FALSE))
		{
			AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_11 " );	//Oh, one more thing. 
			AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_12 " );	//Since you were able to defeat the cave troll, then I must assume that you are quite a skilled fighter.
			AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_13 " );	//Prior Tiamant is engaged in the combat training of the Shadows, and I'm sure he will be interested in this fact.
			AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_14 " );	//Talk to him. And if he has any questions, just tell him that I sent you.
			AI_Output (other, self, " DIA_Ass_127_Osair_RebelSlave_01_15 " );	//Yes master.
			PlayerSendToTiamant = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other, " DIA_Ass_127_Osair_RebelSlave_01_16 " );	//Keep up the good work and you will soon have a chance to truly prove yourself.
		AI_StopProcessInfos(self);
	};

	Npc_ExchangeRoutine(PW_Betray,"OsairReady");
	B_Attack(self,PW_Betray,AR_KILL,1);
};

instance DIA_Ass_127_Osair_AssasinGold(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_AssasinGold_condition;
	information = dia_Ass_127_Osair_AssasinGold_info;
	permanent = FALSE ;
	description = " Will there be more assignments for me? " ;
};

func int dia_Ass_127_Osair_AssasinGold_condition()
{
	if(OsairMurid == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_AssasinGold_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_AssasinGold_01_01 " );	//Will there be more assignments for me?
	AI_Output (self, other, " DIA_Ass_127_Osair_AssasinGold_01_02 " );	//No. Although, if you are in the temple, give this gold to two Shadows - Hasim and Narugu.
	B_GiveInvItems(self,other,ItMi_AssGoldPocket,2);
	AI_Output (self, other, " DIA_Ass_127_Osair_AssasinGold_01_03 " );	//This is their payment for the last batch of slaves.
	AI_Output (other, self, " DIA_Ass_127_Osair_AssasinGold_01_04 " );	//Yes, master.
	MIS_AssasinGold = LOG_Running;
	Log_CreateTopic(TOPIC_AssasinGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AssasinGold,LOG_Running);
	B_LogEntry (TOPIC_AssasinGold, " I must take Osair's gold to the two Shadows in the temple. Their names are Hasim and Narug. " );
	AI_StopProcessInfos(self);

	if(HasimInserted == FALSE)
	{
		HasimInserted = TRUE;
		Wld_InsertNpc(Ass_170_Adept,"PW_TEMPLE_HASIM");
	};
};

instance DIA_Ass_127_Osair_AssasinGold_Done(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_AssasinGold_Done_condition;
	information = dia_Ass_127_Osair_AssasinGold_Done_info;
	permanent = FALSE ;
	description = " I gave the gold to the Shadows, master. " ;
};

func int dia_Ass_127_Osair_AssasinGold_Done_condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimNeedRareWineDone == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_AssasinGold_Done_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_AssasinGold_Done_01_01 " );	//I gave the gold to the Shadows, Master.
	AI_Output (self, other, " DIA_Ass_127_Osair_AssasinGold_Done_01_02 " );	//Good. Now stop wasting my time with trivialities, I am busy.
	AI_Output (self, other, " DIA_Ass_127_Osair_AssasinGold_Done_01_03 " );	//Go away.
	AI_Output (other, self, " DIA_Ass_127_Osair_AssasinGold_Done_01_04 " );	//Yes, master.
	PW_RecoverDeadBodyDay = Wld_GetDay();
	MIS_AssasinGold = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AssasinGold,LOG_SUCCESS);
	B_LogEntry (TOPIC_AssasinGold, " I reported to Osair that I gave his gold to the Shadows. " );
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_HelpWithAssair(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_HelpWithAssair_condition;
	information = dia_Ass_127_Osair_HelpWithAssair_info;
	permanent = FALSE ;
	description = " Prior Tiamant sent me, Master. " ;
};

func int dia_Ass_127_Osair_HelpWithAssair_condition()
{
	if(TiamantSendsToOsair == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_HelpWithAssair_info()
{
	B_GivePlayerXP(100);
	AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_01_01 " );	//Prior Tiamant sent me, Master.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_02 " );	//And what does he want?
	AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_01_03 " );	//He wanted to remind you to bring new slaves to the ore mine, as soon as possible.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_04 " );	//(angrily) What?! He thinks to tell me what to do?
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_05 " );	//If I were in his place, I'd guard the old slaves better!
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_06 " );	//But apparently his people are not even capable of that.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_07 " );	//Until I can be sure that the mine is well guarded ...
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_08 " );	//... I won't send any more slaves there. And I don't care how he does it.
	AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_01_09 " );	//I'll give him your answer, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_10 " );	//Don't. I'll send my messenger myself with a letter for Tiamant.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_11 " );	//You have done enough for now.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_12 " );	//Besides, I will have another assignment for you.
	AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_01_13 " );	//I am listening, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_14 " );	//Recently I heard rumors that there is supposedly a large gold mine in the old foothill pass, somewhere deep in the mountain.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_15 " );	//It follows that someone should go there and check if this is true.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_16 " );	//It will be tricky, but I'm sure you can do it.

	MIS_PW_GOLDSHAHT = LOG_Running;
	Log_CreateTopic(TOPIC_PW_GOLDSHAHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_GOLDSHAHT,LOG_Running);

	if(PW_GOLDSHAHT == TRUE)
	{
		AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_01_17 " );	//The mine does exist, master.
		AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_18 " );	//Are you sure about that?
		AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_01_19 " );	//There can be no doubt.
		AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_20 " );	//(thoughtfully) It's not that I don't trust you. But I’m still used to trusting my eyes, not the words of servants.
		AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_21 " );	//Bring me some of the gold from the mine. That will be the proof I need.
		AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_01_22 " );	//Of course, master. I'll do as you ask.
		AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_23 " );	//You may go.
		B_LogEntry ( TOPIC_PW_GOLDSHAHT , " Osair wants me to bring a gold specimen from the mine that I found in the foothill pass as proof of my words. " );
	}
	else
	{
		AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_24 " );	//And if you suddenly find this mine, then bring me at least one specimen of gold ore.
		AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_01_25 " );	//Of course, master. I'll do as you ask.
		AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_01_26 " );	//You may go.
		B_LogEntry ( TOPIC_PW_GOLDSHAHT , " Osair wants me to verify that there is a large gold mine in the foothill pass. If I do find it, I need to bring the prior a gold specimen from the mine. " );
	};
	
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_185_Adept,"PW_CAVEGOLDORE_01");
};

instance DIA_Ass_127_Osair_HelpWithAssair_Done(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_HelpWithAssair_Done_condition;
	information = dia_Ass_127_Osair_HelpWithAssair_Done_info;
	permanent = FALSE ;
	description = " About the gold mine ... " ;
};

func int dia_Ass_127_Osair_HelpWithAssair_Done_condition()
{
	if((MIS_PW_GOLDSHAHT == LOG_Running) && (Npc_HasItems(other,ItMi_Osair_GoldNugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_HelpWithAssair_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_01 " );	//About the gold mine ...
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_02 " );	//Yes, what did you find?
	AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_03 " );	//I have the gold sample you requested.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_04 " );	//Come, let me have a look at it.
	B_GiveInvItems(other,self,ItMi_Osair_GoldNugget,1);
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_05 " );	//Judging by its appearance, this mine must be quite rich in gold.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_06 " );	//I think it might be worth sending a couple of slaves there to pick it clean.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_07 " );	//Extra gold never hurts, eh?
	AI_Output (other, self, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_08 " );	//Of course, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_09 " );	//So. Where is that bum Joaquin?
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_10 " );	//Ah, well, yes, I sent him with a letter to Prior Tiamant.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_11 " );	//I see! As soon as he returns from the temple, take him and some of the slaves to that mine.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_12 " );	//And make sure he puts them to work.
	AI_Output (self, other, " DIA_Ass_127_Osair_HelpWithAssair_Done_01_13 " );	//You are free to go.
	MIS_PW_GOLDSHAHT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PW_GOLDSHAHT,LOG_SUCCESS);
	B_LogEntry ( TOPIC_PW_GOLDSHAHT , " I gave a piece of gold ore to Osair. Apparently, the mine will not remain empty for long. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ass_127_Osair_DamnHoakin(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_DamnHoakin_condition;
	information = dia_Ass_127_Osair_DamnHoakin_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_DamnHoakin_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarBlameTiamant == TRUE) && (HoakinIsDead == TRUE) && (MIS_PW_FollowGoldOre == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_DamnHoakin_info()
{
	var C_Npc Slave_01;
	var C_Npc Slave_02;

	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);
	Slave_01.aivar[AIV_PARTYMEMBER] = TRUE;
	Slave_02.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_01 " );	//Ah! It's good that you came to me.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_02 " );	//My henchman, that fool Joaquin, has disappeared. Have you seen him by any chance?
	AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_01_03 " );	//No.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_04 " );	//Damn it! It seems Beliar is with him. But if you meet him, then tell him that he may never come back here.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_05 " );	//Otherwise, I will tear off his skin, and stick his head on a pike!
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_06 " );	//As for you, you'll have to take the slaves to the gold mine yourself.
	AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_01_07 " );	//I understand, master. However, your slaves ... they will be completely unguarded there.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_08 " );	//Don't worry. They won't try to run. You can't just get out of the valley.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_09 " );	//They will either be devoured by wild animals, or my people will find them, which is tantamount to the same thing - death.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_10 " );	//I do not think any of them crave death that dearly.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_01_11 " );	//So take the slaves and go to the mine. Stay there, and I'll send my people there in a couple of days.
	AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_01_12 " );	//Of course, master! Consider it done.
	OsairWarriorWait = TRUE;
	MIS_PW_FollowGoldOre = LOG_Running;
	Log_CreateTopic(TOPIC_PW_FollowGoldOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Running);
	B_LogEntry (TOPIC_PW_FollowGoldOre, " Since Joaquin is dead, I will have to lead the slaves to the gold mine myself. And besides that, wait for Osair's people, whom he promised to send in a couple of days. Hmmm ... Joaquin's death has complicated things for me. " ) ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(SEK_186_SLAVEOBSSEK,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_387_SLAVEOBSSEK,"FollowGoldOre");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_01");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_02");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_03");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_04");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_05");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_06");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_07");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_08");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_09");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_10");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_11");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_12");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_13");
};

instance DIA_Ass_127_Osair_DamnHoakin_Done(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_DamnHoakin_Done_condition;
	information = dia_Ass_127_Osair_DamnHoakin_Done_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_127_Osair_DamnHoakin_Done_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((OsairInRage == TRUE) || (ConvoyGoldShahtDone == TRUE)))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_DamnHoakin_Done_info()
{
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_01 " );	// So? How are things at the gold mine?

	if(OsairInRage == TRUE)
	{
		AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_Done_01_02 " );	//The thing is, I need more slaves...
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_03 " );	//What happened to those who went with you?
		AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_Done_01_04 " );	//They did not reach the mine alive.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_05 " );	//Are you saying they're ALL dead?
		AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_Done_01_06 " );	//Yes, master.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_07 " );	//How in Beliar's name could you let this happen?
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_08 " );	//You're no better than that useless Joaquin for letting them die so easily.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_09 " );	//So let me explain something to you. Those were MY slaves!
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_10 " );	//And if you couldn't save them, then you have to pay for them!
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_11 " );	//Let's say two thousand gold coins for each slave.
		Info_ClearChoices(DIA_Ass_127_Osair_DamnHoakin_Done);
		Info_AddChoice (DIA_Ass_127_Osair_DamnHoakin_Done, " I don't have that much gold. " , DIA_Ass_127_Osair_DamnHoakin_Done_None);

		if(Npc_HasItems(other,ItMi_Gold) >= 4000)
		{
			Info_AddChoice (DIA_Ass_127_Osair_DamnHoakin_Done, " Here is my gold for the slaves, master. " , DIA_Ass_127_Osair_DamnHoakin_Done_Yes);
		};
	}
	else if(ConvoyGoldShahtDone == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_Done_01_12 " );	//Your slaves have already begun mining for gold, master.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_13 " );	//Wonderful! if everything goes smoothly, we will soon become richer than Zuben himself.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_14 " );	//Nice work, brother. I am very pleased with your diligence.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_15 " );	//Here, take this gold for your labors.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_Done_01_16 " );	//Thank you, master.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_17 " );	//You deserve it.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_18 " );	//But enough chatter. We have another concern. Blood will be spilled in the Temple this day.
		AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_Done_01_19 " );	//I beg your pardon, master? What is going on?
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_20 " );	//Haniar challenged Prior Tiamant to a duel to the death, accusing him of betraying the Brotherhood.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_21 " );	//This is a very serious charge. But Haniar is not the kind of person to spew empty accusations.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_22 " );	//Surely he has something on Tiamant. Something very serious!
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_23 " );	//Well, I, as one of the priors, will have to act as a judge of this duel.
		AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_01_24 " );	//This will be interesting. You may want to witness it for yourself.
		B_GiveInvItems(self,other,ItMi_PurseOsair,1);
		MIS_PW_FollowGoldOre = LOG_Success;
		Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Success);
		B_LogEntry (TOPIC_PW_FollowGoldOre, " Osair is delighted to hear that the gold mine is up and running. " );
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_125_Tiamant,"DeathMatch");
		Npc_ExchangeRoutine(Ass_126_Haniar,"DeathMatch");
		Npc_ExchangeRoutine(Ass_127_Osair,"DeathMatch");
		Npc_ExchangeRoutine(Ass_128_Nrozas,"DeathMatch");
		Npc_ExchangeRoutine(Ass_144_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_145_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_146_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_147_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_148_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_149_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_138_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_139_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_140_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_141_Adept,"DeathMatch");
	};
};

func void DIA_Ass_127_Osair_DamnHoakin_Done_None()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_Done_None_01_01 " );	//I don't have that much gold.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_None_01_02 " );	//Well, Then you will have to pay with your blood!
	MIS_PW_FollowGoldOre = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_PW_FollowGoldOre);
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_127_Osair_DamnHoakin_Done_Yes()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_01 " );	//Here's my gold for the slaves, master.
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_02 " );	//It's not yours anymore - it's mine! And I hope that you will remember this lesson in the future.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_03 " );	//Because next time gold won't be enough.
	AI_Output (self, other, " DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_04 " );	//Now get out of my sight!
	MIS_PW_FollowGoldOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Success);
	B_LogEntry (TOPIC_PW_FollowGoldOre, " Osair found out that all of his slaves were dead. I had to pay for them in order not to anger the prior. I won't be so lucky next time. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_125_Tiamant,"DeathMatch");
	Npc_ExchangeRoutine(Ass_126_Haniar,"DeathMatch");
	Npc_ExchangeRoutine(Ass_127_Osair,"DeathMatch");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"DeathMatch");
	Npc_ExchangeRoutine(Ass_144_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_145_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_146_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_147_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_148_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_149_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_138_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_139_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_140_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_141_Adept,"DeathMatch");
};

instance DIA_Ass_127_Osair_Poison(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_Poison_condition;
	information = dia_Ass_127_Osair_Poison_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_127_Osair_Poison_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairSeekYou == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Poison_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_01_01 " );	//You were looking for me, master?
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_02 " );	//You? Oh yes. There is business.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_01_03 " );	//I am of service.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_04 " );	//Hmmm quite. Recently, in a conversation with Nrozas, he accidentally mentioned that he had managed to prepare an extremely strong and fast-acting poison.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_05 " );	//According to him, it is so strong that it can instantly kill even a full grown mountain troll.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_06 " );	//I don't really believe him, of course, as Nrozas sometimes likes to embellish his own achievements.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_07 " );	//But if this is true, then I would certainly like a sample of this miraculous concoction.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_08 " );	//Go to Nrozas. Speak with him.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_09 " );	//And, if possible, bring me a small sample of this poison.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_01_10 " );	//Why don't you ask Nrozas yourself, Master?
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_11 " );	//You've started asking too many stupid questions lately. 
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_12 " );	//Why would I send you if I could go myself? 
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_01_13 " );	//I will go to him and try to get this poison for you.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_01_14 " );	//See that you do. We will speak later.
	MIS_PW_PoisonNrozas = LOG_Running;
	Log_CreateTopic(TOPIC_PW_PoisonNrozas,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Running);
	B_LogEntry (TOPIC_PW_PoisonNrozas, " Osair wants me to bring him a new potent poison made by Prior Nrozas. " );
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_Poison_Done(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_Poison_Done_condition;
	information = dia_Ass_127_Osair_Poison_Done_info;
	permanent = TRUE;
	description = " I'm here about Nrozas, master. " ;
};

func int dia_Ass_127_Osair_Poison_Done_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Poison_Done_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_01_01 " );	//I'm here about Nrozas, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_01_02 " );	//I hope you have some news that will please me.
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);

	if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
	{	
		Info_AddChoice (DIA_Ass_127_Osair_Poison_Done, " I have a vial of his poison here for you. " , DIA_Ass_127_Osair_Poison_Done_Give);
	}
	else if(Npc_HasItems(other,ItMi_NrozasPoisonOsair) >= 1)
	{	
		Info_AddChoice (DIA_Ass_127_Osair_Poison_Done, " I have a vial of his poison here for you. " , DIA_Ass_127_Osair_Poison_Done_GiveLaw);
	};
	
	if(PlayerSafeFromNrozasNo == TRUE)
	{
		if(PlayerSafeFromNrozas == TRUE)
		{
			Info_AddChoice (DIA_Ass_127_Osair_Poison_Done, " His new poison is useless. " , DIA_Ass_127_Osair_Poison_Done_TellPoison);
		}
		else
		{
			Info_AddChoice (DIA_Ass_127_Osair_Poison_Done, " Nothing to report. " , DIA_Ass_127_Osair_Poison_Done_NoTellPoison);
		};
	};

};

func void DIA_Ass_127_Osair_Poison_Done_Give()
{
	B_GivePlayerXP(200);
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_Give_01_01 " );	//I have a vial of his poison here for you.
	B_GiveInvItems(other,self,ItMi_NrozasPoison,1);
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_02 " );	//Good. So you succeeded.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_Give_01_03 " );	//You're right, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_04 " );	//Well, I'll just personally have to test it.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_05 " );	//If it is good enough, my men will use it.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_Give_01_06 " );	//Why is there such an urgent need?
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_07 " );	//The fact is that the last expedition into the interior of the island was not very successful for us.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_08 " );	//Apparently, someone knows about our presence on the island.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_09 " );	//And whoever it is has been killing our brothers.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_10 " );	//This mysterious assailant must be a very worthy opponent if he could handle my Shadows so easily.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_11 " );	//However, with this poison, our "friend" will be a dead man.
	OsairGetsNrozasPoison = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry (TOPIC_PW_PoisonNrozas, " I gave the bottle of poison to Osair. He was pleased with my work. He doesn't know that this bottle was not meant for him at all. " );
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

func void DIA_Ass_127_Osair_Poison_Done_GiveLaw()
{
	B_GivePlayerXP(500);
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_Give_01_01 " );	//I have a vial of his poison here for you.
	B_GiveInvItems(other,self,ItMi_NrozasPoisonOsair,1);
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_02 " );	//Good. So you succeeded.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_Give_01_03 " );	//You're right, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_04 " );	//Well, I'll just personally have to test it.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_05 " );	//If it is good enough, my men will use it.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_Give_01_06 " );	//Why is there such an urgent need?
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_07 " );	//The fact is that the last expedition into the interior of the island was not very successful for us.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_08 " );	//Apparently, someone knows about our presence on the island.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_09 " );	//And whoever it is has been killing our brothers.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_10 " );	//This mysterious assailant must be a very worthy opponent if he could handle my Shadows so easily.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_Give_01_11 " );	//However, with this poison, our "friend" will be a dead man.
	OsairGetsNrozasPoisonLaw = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry (TOPIC_PW_PoisonNrozas, " I gave the bottle of poison to Osair. He was very pleased with my work. " );
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

func void DIA_Ass_127_Osair_Poison_Done_NoTellPoison()
{
	B_GivePlayerXP(50);
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_01 " );	//Nothing to report.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_02 " );	//Explain yourself?
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_03 " );	//Nrozas himself doesn't know how good his poison is.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_04 " );	//He never even tried it in action.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_05 " );	//That is unlike him. Nrozas is not one for empty boasts.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_06 " );	//Every poison in it is almost a work of art.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_07 " );	//(staring intently) You wouldn't be hiding something from me, would you?
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_08 " );	//Were you at least able to get a sample of this poison?
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_09 " );	//No, master. Nrozas refused my request.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_10 " );	//He said that he would give you this poison if you ask him personally.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_11 " );	//What? Beliar take his eyes, the gall of this man!
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_12 " );	//I had huge plans for this poison, but it seems I will have to wait.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_13 " );	//Is something the matter?
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_14 " );	//The fact is that the last expedition into the interior of the island was not very successful for us.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_15 " );	//Apparently, someone knows about our presence on the island.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_16 " );	//And whoever it is has been killing our brothers.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_17 " );	//This mysterious assailant must be a very worthy opponent if he could handle my Shadows so easily.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_18 " );	//However, with this poison, our "friend" will be a dead man.
	AI_Output (other, self ," DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_19" ) ;	//I see...
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_20 " );	//Curse him, it seems I'll have to talk to Nrozas about this in person.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_21 " );	//But keep in mind, if I find out that you lied to me, you will die screaming.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_22 " );	//You may go.
	OsairLiarNrozasPoison = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry (TOPIC_PW_PoisonNrozas, " I lied to Osair, saying that Nrozas would give a sample of poison only to him, personally. And now if I don't take care of Nrozas himself, I will end up dead as soon as Osair finds out the truth. I need to think of something quickly. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_Poison_Done_TellPoison()
{
	B_GivePlayerXP(300);
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_01 " );	//His new poison is useless.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_02 " );	//Explain?
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_03 " );	//I was able to try it out.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_04 " );	//And it couldn't even kill a young mountain troll.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_05 " );	//(thoughtfully) Are you telling the truth?
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_06 " );	//You can rest assured of this, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_07 " );	//So it turns out that Nrozas somewhat exaggerated the value of his new invention.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_08 " );	//Well, so much the worse for his health. I reckon a lesson is in order.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_09 " );	//I had huge plans for this poison, but it seems I will have to wait.
	AI_Output (other, self, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_10 " );	//Is something the matter?
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_11 " );	//The fact is that the last expedition into the interior of the island was not very successful for us.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_12 " );	//Apparently, someone knows about our presence on the island.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_13 " );	//And whoever it is has been killing our brothers.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_14 " );	//This mysterious assailant must be a very worthy opponent if he could handle my Shadows so easily.
	AI_Output (self, other, " DIA_Ass_127_Osair_Poison_Done_TellPoison_01_15 " );	//However, with this poison, our "friend" would have been a dead man.
	MIS_PW_PoisonNrozas = LOG_Success;
	OsairTellNrozasPoison = TRUE;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry (TOPIC_PW_PoisonNrozas, " I lied to Osair, saying that Nrozas's poison was pretty bad. The news upset him a little, but it seems he now plans to hurt Nrozas. " );
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

instance DIA_Ass_127_Osair_Portal(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_Portal_condition;
	information = dia_Ass_127_Osair_Portal_info;
	permanent = FALSE ;
	description = " Can I take part in the next expedition? " ;
};

func int dia_Ass_127_Osair_Portal_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Portal_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_Portal_01_01 " );	//Can I take part in the next expedition?
	AI_Output (self, other, " DIA_Ass_127_Osair_Portal_01_02 " );	//I appreciate your zeal, brother. But only Haniar can decide that.
	AI_Output (self, other, " DIA_Ass_127_Osair_Portal_01_03 " );	//Whatever he says, so be it.
	AI_Output(other,self,"DIA_Ass_127_Osair_Portal_01_04");	//Ясно.
};

instance DIA_Ass_127_Osair_GotoHram(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_GotoHram_condition;
	information = dia_Ass_127_Osair_GotoHram_info;
	permanent = FALSE ;
	description = " When are you going to go to the temple, master? " ;
};

func int dia_Ass_127_Osair_GotoHram_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Success) && (OsairLiarNrozasPoison == TRUE) && (OsairGotoHram == FALSE) && (OsairGetKill == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_GotoHram_01_01 " );	//When are you going to go to the temple, master?
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_01_02 " );	//As far as I know Nrozas, it is best to discuss serious issues with him before lunch.
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_01_03 " );	//So I guess I'll be there by noon tomorrow.
	OsairGotoHram = TRUE;
	OsairGotoHramDay = Wld_GetDay();
};

instance DIA_Ass_127_Osair_GotoHram_Fail(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_GotoHram_Fail_condition;
	information = dia_Ass_127_Osair_GotoHram_Fail_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_127_Osair_GotoHram_Fail_condition()
{
	if(OsairGetKill == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_Fail_info()
{
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Fail_01_01 " );	//I was at the temple, and I had an extremely interesting conversation with Nrozas.
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Fail_01_02 " );	//I don't appreciate being taken for a fool!
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Fail_01_03 " );	//But an even worse offence is making me look foolish in front of the other brothers!
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Fail_01_04 " );	//Your head would make a nice decoration for my cave. I think I'll put it... over there.
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_127_Osair_GotoHram_Ok(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_GotoHram_Ok_condition;
	information = dia_Ass_127_Osair_GotoHram_Ok_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_127_Osair_GotoHram_Ok_condition()
{
	if((OsairGoKill == TRUE) && (OsairGetKill == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_Ok_info()
{
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Ok_01_01 " );	//What are you doing here, brother? Who is that with you...
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Ok_01_02 " );	//Beliar's eyes! I can't believe it. Gonzalez!?
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Ok_01_03 " );	//It's been a long time, "old friend".
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Ok_01_04 " );	//Do I need ask what you're doing here?
	AI_Output (other, self, " DIA_Ass_127_Osair_GotoHram_Ok_01_05 " );	//I think you already figured it out.
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Ok_01_06 " );	//Of course! It is betrayal, then. This is a great opportunity you've given me.
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Ok_01_07 " );	//When I bring Haniar your heads it will certainly be another notch on my belt.
	AI_Output (other, self, " DIA_Ass_127_Osair_GotoHram_Ok_01_08 " );	//Well, you can try.
	AI_Output (self, other, " DIA_Ass_127_Osair_GotoHram_Ok_01_09 " );	//Then let us begin...
	Info_ClearChoices(DIA_Ass_127_Osair_GotoHram_Ok);
	Info_AddChoice (DIA_Ass_127_Osair_GotoHram_Ok, Dialog_Ende, DIA_Ass_127_Osair_GotoHram_Ok_Exit);
};

func void DIA_Ass_127_Osair_GotoHram_Ok_Exit()
{
	var C_Npc Gonsales;

	Gonsales = Hlp_GetNpc(NONE_1190_Assasin);
	Gonsales.attribute[ATR_HITPOINTS] = Gonsales.attribute[ATR_HITPOINTS_MAX];
	PlayerIsPrioratFake = TRUE;
	OsairAttackMe = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	B_Attack(Gonsales,self,AR_KILL,1);
};

instance DIA_Ass_127_Osair_DualWeapon(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = DIA_Ass_127_Osair_DualWeapon_condition;
	information = DIA_Ass_127_Osair_DualWeapon_info;
	permanent = FALSE ;
	description = " I would like to ask about the schematics for making moon blades. " ;
};

func int DIA_Ass_127_Osair_DualWeapon_condition()
{
	if(MIS_MoonBlades == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_DualWeapon_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_01_01 " );	//I would like to ask about the schematics for making moon blades.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_02 " );	//(gazing intently) How did you know about that?
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_01_03 " );	//Master Tiamant told me about it.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_04 " );	//(grumpy) Well, yes, I do have this scematic.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_05 " );	//Once, I was fully planning on making myself a pair of these legendary weapons.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_06 " );	//But I ran into a small problem that completely canceled all my endeavors.
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_01_07 " );	//What problem?
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_08 " );	//There is a certain, extremely rare, extremely valuable component involved in the process. A Moonstone.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_09 " );	//It is the rarest ore rock, which is almost impossible to find in its pure form.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_10 " );	//I spent many years looking for it, but I have not yet even seen one.
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_01_11 " );	//I would still like to take a look at the recipe...
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_12 " );	//Oh I am sure you do. However, I won't give it to you just like that.
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_01_13 " );	//What would I need to do?
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_14 " );	//You can buy it from me, or complete a little errand.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_01_15 " );	//Do that, and the recipe is yours.
	B_LogEntry (TOPIC_MoonBlades, " Prior Osair does have a recipe for making moon blades. But he won't give it to me just like that. I can either buy it or do one of his little errands. " );
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice (DIA_Ass_127_Osair_DualWeapon, " How much do you want for the recipe? " , DIA_Ass_127_Osair_DualWeapon_Gold);
	Info_AddChoice (DIA_Ass_127_Osair_DualWeapon, " What is this errand? " , DIA_Ass_127_Osair_DualWeapon_Mission);
};

func void DIA_Ass_127_Osair_DualWeapon_Gold()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_Gold_01_01 " );	//How much do you want for the recipe?
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Gold_01_02 " );	//(smiling) Not nearly what it is worth. Twenty thousand gold coins.
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_Gold_01_03" ) ;	//That is a fortune!
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Gold_01_04 " );	//Not at all. Like I said, this weapon is worth much more than that. I'm giving you a discount! Be thankful!
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);

	if(Npc_HasItems(other,ItMi_Gold) >= 20000)
	{
		Info_AddChoice (DIA_Ass_127_Osair_DualWeapon, " Okay. Here's your gold. " , DIA_Ass_127_Osair_DualWeapon_Buy);
	}
	else
	{
		Info_AddChoice (DIA_Ass_127_Osair_DualWeapon, " I don't have that much gold. " , DIA_Ass_127_Osair_DualWeapon_NoGold);
	};
};

func void DIA_Ass_127_Osair_DualWeapon_Buy()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Buy_01_01");	//Okay. Here's your gold..
	B_GiveInvItems(other,self,ItMi_Gold,20000);
	Npc_RemoveInvItems(self,ItMi_Gold,20000);
	AI_Output(self, other,"DIA_Ass_127_Osair_DualWeapon_Buy_01_02");// Then the recipe is yours. Here, take it.
	B_GiveInvItems(self,other,ItWr_MoonBladesRezept,1);
	B_LogEntry (TOPIC_MoonBlades, " I bought a recipe scroll from Osair. Now all I need to do is find all the materials I need. " );
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
};

func void DIA_Ass_127_Osair_DualWeapon_NoGold()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_NoGold_01_01 " );	//I don't have that much gold.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_NoGold_01_02 " );	//Then I'm afraid there is nothing I can do to help you.
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice (DIA_Ass_127_Osair_DualWeapon, " What kind of order? " , DIA_Ass_127_Osair_DualWeapon_Mission);
};

func void DIA_Ass_127_Osair_DualWeapon_Mission()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_Mission_01_01 " );	//What is this assignment?
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Mission_01_02 " );	//This is a pretty delicate matter. I'm sure you understand what that means.
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_Mission_01_03 " );	//Of course.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Mission_01_04 " );	//Then I'll explain the matter. I need to enlist the support of several of our brothers.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Mission_01_05 " );	//But this must be done so that no one suspects anything.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Mission_01_06 " );	//As you can imagine, I myself cannot do this.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Mission_01_07 " );	//Therefore, I offer this to you. Complete everything - and the recipe scroll is yours.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Mission_01_08 " );	//Well, what do you say?
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice (DIA_Ass_127_Osair_DualWeapon, " Ok! I'll do it. " , DIA_Ass_127_Osair_DualWeapon_Yes);
	Info_AddChoice (DIA_Ass_127_Osair_DualWeapon, " No, this is not for me. " , DIA_Ass_127_Osair_DualWeapon_No);
};

func void DIA_Ass_127_Osair_DualWeapon_No()
{
	B_GivePlayerXP(100);
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_No_01_01 " );	//No, this is not for me.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_No_01_02 " );	//Okay, whatever you say. I will find someone else to do this for me.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_No_01_03 " );	//But you can forget about the recipe scroll. You will never get your hands on it.
	B_LogEntry (TOPIC_MoonBlades, " I turned down Osair's offer. Now he won't give me this scroll. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_DualWeapon_Yes()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_DualWeapon_Yes_01_01 " );	//Ok! I will do it.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Yes_01_02 " );	//Good. The men you need to talk to are Famid, Rafat, Nazim and Kudir.
	AI_Output (self, other, " DIA_Ass_127_Osair_DualWeapon_Yes_01_03 " );	//Now go. Make sure they listen to you.
	MIS_CareOsair = LOG_Running;
	Log_CreateTopic(TOPIC_CareOsair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CareOsair,LOG_Running);
	B_LogEntry (TOPIC_CareOsair, " I have to talk to the four Masiaf brothers and get their support for Osair. The names of these people are Famid, Rafat, Nazim and Kudir. " );
	B_LogEntry_Quiet (TOPIC_MoonBlades, " I will have to work for Prior Osair to get the scroll. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_391_Adept,"PW_FAMID");
	Wld_InsertNpc(Ass_392_Adept,"PW_RAFAT");
	Wld_InsertNpc(Ass_393_Adept,"PW_NAZIM");
	Wld_InsertNpc(Ass_394_Adept,"PW_KUDIR");
};

instance DIA_Ass_127_Osair_FinalHaniar(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = DIA_Ass_127_Osair_FinalHaniar_condition;
	information = DIA_Ass_127_Osair_FinalHaniar_info;
	permanent = FALSE ;
	description = " I have brought a message from Haniar, master. " ;
};

func int DIA_Ass_127_Osair_FinalHaniar_condition()
{
	if(Npc_HasItems(other,ItWr_HaniarToOsair) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_FinalHaniar_info()
{
	B_GivePlayerXP(200);
	AI_Output (other, self, " DIA_Ass_127_Osair_FinalHaniar_01_01 " );	//I have brought a message from Haniar, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_FinalHaniar_01_02 " );	//Okay, give it to me.
	AI_Output (other, self, " DIA_Ass_127_Osair_FinalHaniar_01_03 " );	//Here.
	B_GiveInvItems(other,self,ItWr_HaniarToOsair,1);
	B_UseFakeScroll();
	Npc_RemoveInvItems(self,ItWr_HaniarToOsair,1);
	AI_Output (self, other, " DIA_Ass_127_Osair_FinalHaniar_01_04 " );	//Good news! It's about time.
	AI_Output (self, other, " DIA_Ass_127_Osair_FinalHaniar_01_05 " );	//Tell Haniar that I agree to his proposal.
	AI_Output (self, other, " DIA_Ass_127_Osair_FinalHaniar_01_06 " );	//Be quick about it.
	OsairReadyMeeting = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_RafatNeedPermission(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = DIA_Ass_127_Osair_RafatNeedPermission_condition;
	information = DIA_Ass_127_Osair_RafatNeedPermission_info;
	permanent = FALSE ;
	description = " Rafat wants to pray at the temple again. " ;
};

func int DIA_Ass_127_Osair_RafatNeedPermission_condition()
{
	if((MIS_CareOsair == LOG_Running) && (RafatNeedPermission == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_RafatNeedPermission_info()
{
	B_GivePlayerXP(200);
	AI_Output (other, self, " DIA_Ass_127_Osair_RafatNeedPermission_01_01 " );	//Rafat wants to pray again in the temple.
	AI_Output (self, other, " DIA_Ass_127_Osair_RafatNeedPermission_01_02 " );	//(grumpy) And what does that have to do with me?
	AI_Output (other, self, " DIA_Ass_127_Osair_RafatNeedPermission_01_03 " );	//He needs permission from one of the priors, as Haniar himself forbade him to do this.
	AI_Output (self, other, " DIA_Ass_127_Osair_RafatNeedPermission_01_04" ) ;	//So, that's it.
	AI_Output (other, self, " DIA_Ass_127_Osair_RafatNeedPermission_01_05 " );	//And if he gets it from you, I think his devotion will know no bounds.
	AI_Output (self, other, " DIA_Ass_127_Osair_RafatNeedPermission_01_06 " );	//Logically. Okay, tell Rafat that I am giving him permission.
	AI_Output (self, other, " DIA_Ass_127_Osair_RafatNeedPermission_01_07 " );	//If Haniar asks, he can speak to me.
	AI_Output (other, self, " DIA_Ass_127_Osair_RafatNeedPermission_01_08 " );	//I'll tell him.
	RafatGetPermission = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Osair gave permission to Rafat to pray in the temple, despite Haniar's ban. I'm sure Haniar won't like it very much. " );
	AI_StopProcessInfos(self);
};

var int FazimAboutKnow;
var int NazimAboutKnow;
var int RafatAboutKnow;
var int KudirAboutKnow;
var int CareOsairCount;

instance DIA_Ass_127_Osair_CareOsair(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = DIA_Ass_127_Osair_CareOsair_condition;
	information = DIA_Ass_127_Osair_CareOsair_info;
	permanent = TRUE;
	description = " About new people ... " ;
};

func int DIA_Ass_127_Osair_CareOsair_condition()
{
	if(MIS_CareOsair == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_CareOsair_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_01_01 " );	//About the new people ...
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_01_02 " );	//Something to report?
	Info_ClearChoices(DIA_Ass_127_Osair_CareOsair);

	Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Not yet.",DIA_Ass_127_Osair_CareOsair_NoNews);

	if((FazimAgreed == TRUE) && (FazimAboutKnow == FALSE))
	{
		Info_AddChoice (DIA_Ass_127_Osair_CareOsair, " Famid is now one of your people. " , DIA_Ass_127_Osair_CareOsair_Fazim);
	}
	else if((FazimRefuseTalk == TRUE) && (FazimAboutKnow == FALSE))
	{
		Info_AddChoice (DIA_Ass_127_Osair_CareOsair, " I could not enlist Famid. " , DIA_Ass_127_Osair_CareOsair_NoFazim);
	};
	if ((RafatAgreed ==  TRUE ) && (RafatAboutKnow ==  FALSE ))
	{
		Info_AddChoice (DIA_Ass_127_Osair_CareOsair, " Rafat agrees to be your man. " , DIA_Ass_127_Osair_CareOsair_Rafat);
	};
	if ((NazimKnowAboutCave ==  TRUE ) && (NazimAboutKnow ==  FALSE ) && ((NazimPissOff ==  TRUE ) || (NazimGetOutCave ==  TRUE ) || (NazimStayInCave ==  TRUE )))
	{
		if ((NazimPissOff ==  TRUE ) || (NazimStayInCave ==  TRUE ))
		{
			Info_AddChoice (DIA_Ass_127_Osair_CareOsair, " Nazim won't be able to work for you, master. " , DIA_Ass_127_Osair_CareOsair_NoNazim);
		}
		else if(NazimGetOutCave == TRUE)
		{
			Info_AddChoice (DIA_Ass_127_Osair_CareOsair, " Nazim is ready to work for you. " , DIA_Ass_127_Osair_CareOsair_Nazim);
		};
	};
	if((KudirGetTrollPlant == TRUE) && (KudirAboutKnow == FALSE))
	{
		Info_AddChoice (DIA_Ass_127_Osair_CareOsair, " Kudir will join you soon. " , DIA_Ass_127_Osair_CareOsair_Kudir);
	}
	else if((KudirPissOff == TRUE) && (KudirAboutKnow == FALSE))
	{
		Info_AddChoice (DIA_Ass_127_Osair_CareOsair, " Kudir declined the offer. " , DIA_Ass_127_Osair_CareOsair_NoKudir);
	};
	if((FazimAboutKnow == TRUE) && (NazimAboutKnow == TRUE) && (RafatAboutKnow == TRUE) && (KudirAboutKnow == TRUE))
	{
		Info_AddChoice (DIA_Ass_127_Osair_CareOsair, " I think I talked to everyone. " , DIA_Ass_127_Osair_CareOsair_AlDone);
	};
};

func void DIA_Ass_127_Osair_CareOsair_AlDone()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_AlDone_01_01 " );	//I think I've talked to everyone.
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_AlDone_01_02 " );	//How about our deal?

	if(CareOsairCount >= 3)
	{
		B_GivePlayerXP(1000);
		AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_AlDone_01_03 " );	//Well, your help has been really invaluable.
		AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_AlDone_01_04 " );	//Here, take this recipe scroll as agreed.
		B_GiveInvItems(self,other,ItWr_MoonBladesRezept,1);
		AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_AlDone_01_05 " );	//It is rightfully yours.
		B_LogEntry (TOPIC_MoonBlades, " Osair gave me the recipe scroll. Now I just need to find all the materials I need. " );
	}
	else
	{
		AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_AlDone_01_06 " );	//You did not succeed!
		AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_AlDone_01_07 " );	//So consider our deal null and void.
		AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_AlDone_01_08 " );	//This conversation is over.
		B_LogEntry (TOPIC_MoonBlades, " Osair thought I did a poor job. I'm afraid I won't see this scroll now. " );
	};

	MIS_CareOsair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CareOsair,LOG_SUCCESS);
	B_LogEntry (TOPIC_CareOsair, " I spoke to everyone who could help Osair. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_CareOsair_NoNews()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNews_01_01");	//Not yet.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoNews_01_02 " );	//Then there's nothing to talk about.
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_CareOsair_Fazim()
{
	B_GivePlayerXP(250);
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_Fazim_01_01 " );	//Famid is now one of your people, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Fazim_01_02 " );	//Great! True, I had no doubts about him.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Fazim_01_03 " );	//(smiling) Just answer me one question. How much did his loyalty cost you?
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_Fazim_01_04 " );	//Up a small mountain of gold.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Fazim_01_05 " );	//I thought so. Although for me such loyalty is the most reliable.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Fazim_01_06 " );	//Don't think that I will reimburse your expenses.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Fazim_01_07 " );	//Everything you have done concerns only you and no one else.
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_Fazim_01_08 " );	//I didn't expect anything else.
	CareOsairCount + =  1 ;
	FazimAboutKnow = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Osair was pleased that Famid would join his people. " );
};


func void DIA_Ass_127_Osair_CareOsair_NoFazim()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_NoFazim_01_01 " );	//I could not reason with Famid, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoFazim_01_02 " );	//Unacceptable. Perhaps you did not use terms he would find agreeable?
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_NoFazim_01_03 " );	//That bastard is too greedy for gold.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoFazim_01_04 " );	//I know. That is not an excuse, however.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoFazim_01_05 " );	//I need a result. How you will achieve it is your concern.
	FazimAboutKnow = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Osair was not happy that Famid would not join his people. " );
};

func void DIA_Ass_127_Osair_CareOsair_Rafat()
{
	B_GivePlayerXP(100);
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_Rafat_01_01 " );	//Rafat agrees to be your man.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Rafat_01_02 " );	//Good. I expected nothing less.
	CareOsairCount + =  1 ;
	RafatAboutKnow = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Prior Osair is pleased with Rafat's decision. " );
};

func void DIA_Ass_127_Osair_CareOsair_Nazim()
{
	B_GivePlayerXP(400);
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_Nazim_01_01 " );	//Nazim is ready to work for you.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Nazim_01_02 " );	//Glad to hear it. I hope you didn't have to be too persuasive?
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_Nazim_01_03 " );	//He was willing to do anything to get out of the ore mine.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Nazim_01_04");	//Ha. Of course he was.
	CareOsairCount + =  1 ;
	NazimAboutKnow = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Osair was delighted to hear that Nazim is now working for him. " );
};

func void DIA_Ass_127_Osair_CareOsair_NoNazim()
{
	B_GivePlayerXP(100);
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_NoNazim_01_01 " );	//Nazim won't be able to work for you, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoNazim_01_02 " );	//(displeased) What's the reason?
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_NoNazim_01_03 " );	//He is currently guarding the ore mine on Haniar's orders.
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_NoNazim_01_04 " );	//I spoke with Haniar about this, but could not convince him of the need to let Nazim go.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoNazim_01_05 " );	//Ah, so that's it? Okay, then I'll fix this problem myself.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoNazim_01_06 " );	//Nothing more is required from you.
	NazimAboutKnow = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Osair will deal with Nazim himself. He doesn't need my help now. " );
};

func void DIA_Ass_127_Osair_CareOsair_Kudir()
{
	B_GivePlayerXP(500);
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_Kudir_01_01 " );	//Kudir will join you shortly.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Kudir_01_02 " );	//I never thought he would agree to such a thing.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Kudir_01_03 " );	//How did you manage it?
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_Kudir_01_04 " );	//I made him an offer he couldn't refuse.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Kudir_01_05 " );	//You seem to know how to negotiate with people. This is a rather rare gift.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_Kudir_01_06 " );	//And a lot can be achieved if it used correctly.
	CareOsairCount + =  1 ;
	KudirAboutKnow = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Osair was surprised that I managed to lure Kudir over to his side. " );
};

func void DIA_Ass_127_Osair_CareOsair_NoKudir()
{
	B_GivePlayerXP(50);
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_NoKudir_01_01 " );	//Kudir refused the offer.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoKudir_01_02 " );	//Why?
	AI_Output (other, self, " DIA_Ass_127_Osair_CareOsair_NoKudir_01_03 " );	//He is currently working for Prior Haniar and is not going to change anything.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoKudir_01_04 " );	//So he is Haniar's man? Hmmm ... Well, that changes things.
	AI_Output (self, other, " DIA_Ass_127_Osair_CareOsair_NoKudir_01_05 " );	//Okay, I'll take care of the rest. You can leave Kudir alone.
	KudirAboutKnow = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Prior Osair will take care of Kudir himself. " );
};

instance DIA_Ass_127_Osair_OsairPlans(C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = DIA_Ass_127_Osair_OsairPlans_condition;
	information = DIA_Ass_127_Osair_OsairPlans_info;
	permanent = FALSE ;
	description = " Why exactly these people, master? " ;
};

func int DIA_Ass_127_Osair_OsairPlans_condition()
{
	if((HaniarKnowsOsairPlans_01 == TRUE) && (MIS_OsairTrait == FALSE) && ((MIS_CareOsair == LOG_Running) || (MIS_CareOsair == LOG_Success)))
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_OsairPlans_info()
{
	AI_Output (other, self, " DIA_Ass_127_Osair_OsairPlans_01_01 " );	//Why exactly these people, master?
	AI_Output (self, other, " DIA_Ass_127_Osair_OsairPlans_01_02 " );	//That is not your concern. 
};

instance DIA_Ass_127_Osair_Trait (C_Info)
{
	npc = Ass_127_Osair;
	no. = 1 ;
	condition = dia_Ass_127_Osair_Trait_condition;
	information = dia_Ass_127_Osair_Trait_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_127_Osair_Trait_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Trait_info()
{
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_01 " );	//Ah, you're here. I have already heard what happened in the temple.
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_02 " );	//This is the first time in living memory that an adept was able to defeat a Prior in battle.
	AI_Output (other, self, " DIA_Ass_127_Osair_Trait_01_03 " );	//But there's a first time for everything.
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_04 " );	//(staring intently) And you are quite a bit more formidable than you seem at first glance.
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_05 " );	//Therefore, I will have a proposition for you.
	AI_Output (other, self, " DIA_Ass_127_Osair_Trait_01_06 " );	//I am listening, master.
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_07 " );	//You are starting to become a fairly prominent figure in the Brotherhood.
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_08 " );	//If it goes on like this, then you could well become one of the Masyaf priors.
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_09 " );	//Therefore, I need to be sure that when the time comes, you will be on my side.
	AI_Output (other, self, " DIA_Ass_127_Osair_Trait_01_10 " );	//What do you mean?
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_11 " );	//I'm sure you understand. Powerful, loyal friends are very valuable in our line of business.
	AI_Output (other, self, " DIA_Ass_127_Osair_Trait_01_12 " );	//What if I refuse?
	AI_Output (self, other, " DIA_Ass_127_Osair_Trait_01_13 " );	//Then you just leave me no choice but to ensure you do not ally with my enemies.
	Info_ClearChoices(DIA_Ass_127_Osair_Trait);
	Info_AddChoice (DIA_Ass_127_Osair_Trait, " I will not be you puppet! " , DIA_Ass_127_Osair_Trait_No);
	Info_AddChoice (DIA_Ass_127_Osair_Trait, " Better to be on your side then. " , DIA_Ass_127_Osair_Trait_Yes);
};

func void dia_Ass_127_Osair_Trait_No()
{
	AI_Output (other, self, " dia_Ass_127_Osair_Trait_No_01_01 " );	// I will not be your puppet!
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_No_01_02 " );	// Well, you chose your own path. Kill him!
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void dia_Ass_127_Osair_Trait_Yes()
{
	AI_Output (other, self, " dia_Ass_127_Osair_Trait_Yes_01_01 " );	//Better to be on your side then.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_02 " );	//A wise decision, oh father of wisdom. And I promise you that you will not regret it.
	AI_Output (other, self, " dia_Ass_127_Osair_Trait_Yes_01_03 " );	//What are you up to, master?
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_04 " );	//Quite strange things have been happening in the Brotherhood lately.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_05 " );	//And, in my opinion, Haniar is too old to keep it all under control.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_06 " );	//Don't you think so?
	AI_Output (other, self, " dia_Ass_127_Osair_Trait_Yes_01_07 " );	//It seems like it, yes.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_08 " );	//Based on what has been happening lately, I believe that the time has come to change the leadership structure in the Brotherhood.
	AI_Output (other, self, " dia_Ass_127_Osair_Trait_Yes_01_09 " );	//I don't think Haniar will like this too much.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_10 " );	//Of course. This will call for bloodshed, unfortunately.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_11 " );	//I understand your bewilderment now, but believe me - this is not the first time this has happened.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_12 " );	//So we'll have to  drain some old blood for the sake of the new to flourish.
	AI_Output (other, self, " dia_Ass_127_Osair_Trait_Yes_01_13 " );	//So you want to attack the temple?
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_14 " );	//Unfortunately, we have no other choice. We will have to do this if we want to save the Brotherhood.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_15 " );	//But too many people are devoted to Haniar to resolve this issue peacefully.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_16 " );	//Therefore, you did the right thing to agree to my proposal.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_17 " );	//For when the time comes, everyone who does not support me will have to be dealt with.
	AI_Output (other, self, " dia_Ass_127_Osair_Trait_Yes_01_18 " );	//It can't be otherwise, master.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_19 " );	//I am pleased you see things my way. In the meantime, you can go about your business.
	AI_Output (self, other, " dia_Ass_127_Osair_Trait_Yes_01_20 " );	//When I need you, I'll let you know.
	MIS_OsairTrait = LOG_Running;
	Log_CreateTopic(TOPIC_OsairTrait,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairTrait,LOG_Running);
	B_LogEntry (TOPIC_OsairTrait, " It looks like things are getting serious. Osair is planning to attack the temple and kill Haniar in order to seize power in the Brotherhood! We must immediately report this to Haniar. But it is better to do it without witnesses. " );
	AI_StopProcessInfos(self);
};
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
