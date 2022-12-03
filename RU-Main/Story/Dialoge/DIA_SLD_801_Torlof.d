

instance DIA_Torlof_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_Hello (C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = DIA_Torlof_HALLO_Condition;
	information = DIA_Torlof_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_HALLO_Info()
{
	AI_Output(self,other, " DIA_Torlof_Hallo_01_00 " );	// What do you want from me?
};


instance DIA_Torlof_WannaJoin(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 2;
	condition = DIA_Torlof_WannaJoin_Condition;
	information = DIA_Torlof_WannaJoin_Info;
	permanent = FALSE;
	description = " I want to join the mercenaries! " ;
};

func int DIA_Torlof_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Torlof_WannaJoin_15_00 " );	// I want to join the mercenaries!
	AI_Output(self,other, " DIA_Torlof_WannaJoin_01_01 " );	// Oh? And what makes you think that I will support you in this endeavor?
};

var int Torlof_Go;

instance DIA_Torlof_Probe(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 3;
	condition = DIA_Torlof_Probe_Condition;
	information = DIA_Torlof_Probe_Info;
	permanent = TRUE;
	description = " Test me! " ;
};


func int DIA_Torlof_Probe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_WannaJoin) && (hero.guild == GIL_NONE) && (Torlof_Go == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Probe_Info()
{
	AI_Output(other,self, " DIA_Torlof_Probe_15_00 " );	// Test me!
	AI_Output(self,other, " DIA_Torlof_Probe_01_01 " );	// Did Lee send you to me?

	if(Npc_KnowsInfo(other,DIA_Lee_OtherSld))
	{
		AI_Output(other,self, " DIA_Torlof_Probe_15_02 " );	// He said you will help me.
		AI_Output(self,other, " DIA_Torlof_Probe_01_03 " );	// Okay...(sighs) Then listen! Before joining us, you must do two things.
		AI_Output(self,other, " DIA_Torlof_Probe_01_04 " );	// First, you must prove that you are capable of solving tasks that are part of the duties of mercenaries. I must test you.
		AI_Output(self,other, " DIA_Torlof_Probe_01_05 " );	// And second, you must earn the respect of other mercenaries.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
		B_LogEntry(TOPIC_BecomeSLD, " To be accepted as a mercenary, I must pass Torlof's test and earn the respect of the other mercenaries. " );
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//Нет.
		AI_Output(self,other, " DIA_Torlof_Probe_01_07 " );	// Then why would I have to listen to your nonsense?
		AI_StopProcessInfos(self);
	};
};


instance DIA_Permission_Respect (C_Info) .
{
	npc = SLD_801_Torlof;
	nr = 4;
	condition = DIA_Torlof_Respekt_Condition;
	information = DIA_Torlof_Respect_Info;
	permanent = FALSE;
	description = " How do I earn the respect of other mercenaries? " ;
};


func int DIA_Torlof_Respect_Condition()
{
	if((Torlof_Go == TRUE) && (hero.guild == GIL_NONE) && (MIS_SLDRESPEKT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Respect_Info()
{
	AI_Output(other,self, " DIA_Torlof_Respekt_15_00 " );	// How can I earn the respect of other mercenaries?
	AI_Output(self,other, " DIA_Torlof_Respekt_01_01 " );	// For most, it will be enough if you complete your tasks and pass my test.
	AI_Output(self,other, " DIA_Torlof_Respekt_01_02 " );	// But to convince others, you'll have to look for a different approach.
	AI_Output(self,other, " DIA_Torlof_Respekt_01_03 " );	// Some will try to take advantage of your position, others may not like your face.
	AI_Output(self,other, " DIA_Torlof_Respekt_01_04 " );	// You should try to persuade as many of our guys as possible - but if all else fails, you can always resort to a duel.
	AI_Output(self,other, " DIA_Torlof_Respekt_01_05 " );	// If you win, you will earn the respect of most of them. But just be careful not to accidentally kill anyone. Then you will have very big problems.
	Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	MIS_SLDRESPEKT = LOG_Running;
	B_LogEntry(TOPIC_SLDRespekt, " In order for the mercenaries to support me, I must complete the task that Torlof will give me. To earn the respect of the mercenaries, I will have to do something to help them, or win a duel. " );
};


instance DIA_Torlof_DuelRules (C_Info)
{
	npc = SLD_801_Torlof;
	nr = 5;
	condition = DIA_Torlof_Duellregeln_Condition;
	information = DIA_Torlof_Duelrules_Info;
	permanent = FALSE;
	description = " What are the dueling rules? " ;
};


func int DIA_Torlof_Duellregeln_Condition()
{
	if (Npc_KnowsInfo(other,THE_Of_Respect) || Npc_KnowsInfo(other,THE_Jarvis_My_Mission))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Duel_Rules_Info()
{
	AI_Output(other,self, " DIA_Torlof_Duellregeln_15_00 " );	// What are the duel rules?
	AI_Output(self,other, " DIA_Torlof_Duellregeln_01_01 " );	// This is pretty simple. Both duelists must be able to draw their weapons before the first strike.
	AI_Output(self,other, " DIA_Torlof_Duellregeln_01_02 " );	// You can't just pick up and attack someone without warning.
	AI_Output(self,other, " DIA_Torlof_Duellregeln_01_03 " );	// There must be a verbal call. An insult, for example, or some other reason for fighting.
	AI_Output(self,other, " DIA_Torlof_Duellregeln_01_04 " );	// None of the spectators have the right to interfere in the duel. Unless one of the duelists is killed.
	B_LogEntry(TOPIC_SLDRespekt, " Duel rules: The duel must start with a challenge, then no one has the right to interfere in it. You cannot kill the opponent in the duel. " );
};


instance DIA_Torlof_YourVoice (C_Info)
{
	npc = SLD_801_Torlof;
	nr = 6;
	condition = DIA_Torlof_DeineVoice_Condition;
	information = DIA_Torlof_YourVoice_Info;
	permanent = FALSE;
	description = " What about you? Will you vote for me? " ;
};


func int DIA_Torlof_YourVoice_Condition()
{
	if((Torlof_Go == TRUE) && (other.guild == GIL_NONE) && (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Torlof_YourVoice_Info()
{
	AI_Output(other,self, " DIA_Torlof_DeineStimme_15_00 " );	// What about you? Will you vote for me?
	AI_Output(self,other, " DIA_Torlof_DeineStimme_01_01 " );	// If you can prove that you can perform the duties of a mercenary, then yes.
};


var int Points_Sld;

instance DIA_Torlof_RUF(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 7;
	condition = DIA_Torlof_RUF_Condition;
	information = DIA_Torlof_RUF_Info;
	permanent = TRUE;
	description = " How is my reputation with the mercenaries? " ;
};


func int DIA_Torlof_RUF_Condition()
{
	if((Torlof_Go == TRUE) && (Torlof_GenugStimmen == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_RUF_Info()
{
	AI_Output(other, self, " DIA_Torlof_RUF_15_00 " );	// How is my reputation with the mercenaries?
	AI_Output(self,other, " DIA_Torlof_RUF_01_01 " );	// Ok, let's see...
	Points_Sld = 0;
	if (Npc_IsDead(SLD_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(MIS_AppleTest == LOG_Success)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_02 " );	// Wolf says he has nothing against you.
		Points_Sld = Points_Sld + 1;
	};
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_03 " );	// Jarvis thinks you're on the right side.
		Points_Sld = Points_Sld + 1;
	}
	else if(Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_04 " );	// Jarvis is still not sure you're on the right side.
		AI_Output(self,other, " DIA_Torlof_RUF_01_05 " );	// He doesn't want more people dancing to Silvio's tune. If you're interested, I agree with him on that.
	};
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Cord_Approved == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_06 " );	// Kord thinks you're good enough to join us.
		Points_Sld = Points_Sld + 1;
	}
	else if(Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_07 " );	// In Kord's opinion, you need to learn how to use weapons better first.
	};
	if(Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if((MIS_Cipher_Paket == LOG_SUCCESS) || (MIS_Cipher_BringWeed == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_08 " );	// Cypher says he's absolutely clear that you're worthy to join us. It seems that something made him infinitely happy.
		Points_Sld = Points_Sld + 1;
	}
	else  if (Cipher.aivar[AIV_TalkedToPlayer] ==  TRUE )
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_09 " );	// Cypher says you owe him a favor and that you know what he's talking about.
	};
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Npc_HasItems(Rod,ItMw_2h_Rod) == 0)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_10 " );	// Rod just wants his sword back.
	}
	else if((Rod.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod_WetteGewonnen == TRUE))
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_11 " );	// Looks like you managed to convince Rod that you're strong enough.
		if (Rod.aivar[AIV_DefeatedByPlayer] ==  FALSE )
		{
			Points_Sld = Points_Sld + 1;
		};
	}
	else if(Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_12 " );	// Rod thinks you're weak.
	};
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Npc_HasItems(Sentenza,ItMi_Gold) >= 50)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_13 " );	// Sentenza will vote for you. He says that you are a very reasonable person.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if(Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_14 " );	// Sentenza won't vote for you. He says you owe him fifty gold coins.
	};
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else  if (Raoul.aivar[AIV_DefeatedByPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_15 " );	// Raul is against you. I don't think he can stand you.
	};
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else  if (Bullco.aivar[AIV_DefeatedByPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_16 " );	// Nothing to say about Silvio and Bulko. These two cretins are always against everyone and everything.
	};
	if(Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Buster_Duell == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_17 " );	// Buster says you're fine.
		if (Buster.aivar[AIV_DefeatedByPlayer] ==  FALSE )
		{
			AI_Output(self,other, " DIA_Torlof_RUF_01_18 " );	// Even though you lost to him.
		};
	}
	else if(Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_19 " );	// Buster says you chickened out when he called you.
		AI_Output(self,other, " DIA_Torlof_RUF_01_20 " );	// This is not very good. Perhaps you should return to the outpost and summon him.
	};
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Dar_LostAgainstCipher == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_21 " );	// Dar says you're a talker. But his voice is not particularly listened to here.
	};
	if(Points_Sld > 0)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_22 " );	// The rest of the mercenaries didn't say anything.
	};
	if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_23 " );	// Most of them are just waiting to see if you pass the test.
	}
	else
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_24 " );	// You convinced most of them by passing the test.

		if(Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_Torlof_RUF_01_00 " );	// (chuckles) Let Kord be part of this...
			Points_Sld = Points_Sld + 4;
		}
		else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Torlof_RUF_01_25 " );	// Although many believe that getting the farmer to pay the rent was too easy to consider this a test.
			Points_Sld = Points_Sld + 3;
		}
		else
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output(self,other, " DIA_Torlof_RUF_01_26 " );	// In any case, you can count on my vote.
		Points_Sld = Points_Sld + 1;
	};
	if (Sld_Duels_won >=  3 )
	{
		Points_Sld = Points_Sld + 1;
		if(Points_Sld >= 9)
		{
			AI_Output(self,other, " DIA_Torlof_RUF_01_27 " );	// And you won several fair duels.
			AI_Output(self,other, " DIA_Torlof_RUF_01_28 " );	// Many mercenaries respect this.
		}
		else
		{
			AI_Output(self,other, " DIA_Torlof_RUF_01_29 " );	// Anyway, you've already won several fair duels.
		};
	};
	if(Points_Sld >= 9)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other, " DIA_Torlof_RUF_01_30 " );	// Most of the mercenaries are for you. And we believe that you can join us at any time.
		AI_Output(self,other, " DIA_Torlof_RUF_01_31 " );	// Go talk to Lee. He will explain the details to you.
		Torlof_GenugStimmen = TRUE;
		MIS_SLDRESPEKT = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_SUCCESS);
		B_LogEntry(TOPIC_BecomeSLD, " Now I have enough mercenary votes. I should speak to Lee immediately! " );
	}
	else if(Points_Sld >= 7)
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_32 " );	// This is quite a lot, but not enough yet.
		AI_Output(self,other, " DIA_Torlof_RUF_01_33 " );	// You still need to fight a few guys.
	}
	else
	{
		AI_Output(self,other, " DIA_Torlof_RUF_01_34 " );	// You still have a long way to go, boy. If you want us to accept you into our ranks, you need to work hard.
	};
};


instance DIA_Torlof_Tasks (C_Info)
{
	npc = SLD_801_Torlof;
	nr = 8;
	condition = DIA_Torlof_Tasks_Condition;
	information = DIA_Torlof_Tasks_Info;
	permanent = FALSE;
	description = " What are the duties of a mercenary? " ;
};


func int DIA_Torlof_Afgaben_Condition()
{
	if((Torlof_Go == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Tasks_Info()
{
	AI_Output(other,self, " DIA_Torlof_Aufgaben_15_00 " );	// And what are the duties of a mercenary?
	AI_Output(self,other, " DIA_Torlof_Aufgaben_01_01 " );	// Onar hired us for two reasons: he wants us to get the militia off his neck, and he wants us to keep order on his farms.
	AI_Output(self,other, " DIA_Torlof_Aufgaben_01_02 " );	// This includes rent collection when farmers refuse to pay.
	AI_Output(self,other, " DIA_Torlof_Aufgaben_01_03 " );	// So what do you choose?
	Info_ClearChoices(DIA_Torlof_Tasks);
	Info_AddChoice(DIA_Torlof_Aufgaben, " I'll collect rent! " ,DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice(DIA_Torlof_Aufgaben, " I'll deal with the militia, you can forget about this problem! " ,DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output(self,other, " B_Torlof_HolPachtvonSekob_01_00 " );	// Good. Listen. Farmer Sekob hasn't paid his rent to Onar for weeks.
	AI_Output(self,other, " B_Torlof_HolPachtvonSekob_01_01 " );	// Onar wants him to lay out fifty gold coins. Have questions?
	AI_Output(other,self, " B_Torlof_HolPachtvonSekob_15_02 " );	// Where is Sekoba's farm?
	AI_Output(self,other, " B_Torlof_HolPachtvonSekob_01_03 " );	// In the north of this valley. Looking from here, it will be to the right of the big crossroads.
	AI_Output(self,other, " B_Torlof_HolPachtvonSekob_01_04 " );	// If you're in trouble, the farmers in the fields will help you find your way.
	MIS_Torlof_HolPachtVonSekob = LOG_Running;
	Sekob.flags = 0;
	CreateInvItems(Sekob,ItMi_Gold,50);
	Log_CreateTopic(TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofPacht,LOG_Running);
	B_LogEntry(TOPIC_TorlofPacht, " Torlof has asked me to collect rent from Farmer Sekob. He must pay fifty gold pieces. " );
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output(self,other, " B_Torlof_BengarMilizKlatschen_01_00 " );	// Farmer Bengar recently complained that the militia from the city was getting on his nerves.
	AI_Output(self,other, " B_Torlof_BengarMilizKlatschen_01_01 " );	// They're putting pressure on this farmer - maybe trying to get him to break up with Onar.
	AI_Output(self,other, " B_Torlof_BengarMilizKlatschen_01_02 " );	// I want you to go to his farm and let those militias know there's nothing for them to do there! Have questions?
	AI_Output(other, self, " B_Torlof_BengarMilizKlatschen_15_03 " );	// How do I find Bengar's farm?
	AI_Output(self,other, " B_Torlof_BengarMilizKlatschen_01_04 " );	// In the southwest of this valley, there is a large staircase leading to a plateau in the mountains. Bengar's farm is located on it.
	AI_Output(self,other, " B_Torlof_BengarMilizKlatschen_01_05 " );	// If you get lost, ask the farmers in the fields, they will show you the way.
	MIS_Torlof_BengarMilizKlatschen = LOG_Running;
	Bengar.flags = 0;
	Wld_InsertNpc(Mil_335_Rumbold,"FARM3");
	Wld_InsertNpc(Mil_336_Rick,"FARM3");
	B_InitNpcGlobals();
	Log_CreateTopic(TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofMiliz,LOG_Running);
	B_LogEntry(TOPIC_TorlofMiliz, " Torlof has requested that the militia be expelled from Bengar's farm. It is on a plateau. " );
};

func void DIA_Torlof_Tasks_Pacht()
{
	AI_Output(other,self, " DIA_Torlof_Aufgaben_Pacht_15_00 " );	// I'll collect the rent!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices(DIA_Torlof_Tasks);
};

func void DIA_Torlof_Tasks_Militia()
{
	AI_Output(other,self, " DIA_Torlof_Aufgaben_Miliz_15_00 " );	// I'll deal with the militia, you can forget about this problem!
	B_Torlof_BengarMilizKlatschen();
	Torlof_Probe = Probe_Bengar;
	Info_ClearChoices(DIA_Torlof_Tasks);
};


var int Torlof_TheOtherMission_Day;

func void B_Torlof_TheOtherMissionDay()
{
	if(Torlof_TheOtherMission_Day < (Wld_GetDay() - 1))
	{
		AI_Output(self,other, " B_Torlof_TheOtherMissionDay_01_00 " );	// You spent too much time on this. Onar will be dissatisfied.
		Torlof_TheOtherMission_TooLate = TRUE;
		if(EnterOW_Kapitel2 == TRUE)
		{
			AI_Output(self,other, " DIA_Torlof_Add_01_00 " );	// And he doesn't care if the paladins in the Valley of Mines die or not...
		};
	}
	else
	{
		AI_Output(self,other, " B_Torlof_TheOtherMissionDay_01_01 " );	// Great! When I have something new, I'll let you know.
	};
};


instance DIA_Torlof_SekobSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 9;
	condition = DIA_Torlof_SekobSuccess_Condition;
	information = DIA_Torlof_SekobSuccess_Info;
	permanent = TRUE;
	description = " I've collected Sekob's rent. " ;
};


func int DIA_Torlof_SekobSuccess_Condition()
{
	if(MIS_Torlof_HolPachtVonSekob == LOG_Running)
	{
		if ((Sekob.aivar[AIV_DefeatedByPlayer] ==  TRUE ) || Npc_IsDead(Sekob))
		{
			return TRUE;
		};
	};
};

func void DIA_Torlof_SekobSuccess_Info()
{
	AI_Output(other,self, " DIA_Torlof_SekobSuccess_15_00 " );	// I collected Sekob's rent.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		B_GivePlayerXP(XP_Torlof_SekobsKohlebekommen);
		AI_Output(self,other, " DIA_Torlof_SekobSuccess_01_01 " );	// And? Did he volunteer?

		if (Npc_IsDead(Sekob))
		{
			AI_Output(other,self, " DIA_Torlof_SekobTot_15_00 " );	// Well, he had an accident...
		}
		else
		{
			AI_Output(other,self, " DIA_Torlof_SekobSuccess_15_02 " );	// I had to convince him.
		};
		if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(self,other, " DIA_Torlof_SekobSuccess_01_03 " );	// Great! You passed the test. This will convince most mercenaries that you are a worthy candidate.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TorlofPacht,LOG_SUCCESS);
		B_LogEntry(TOPIC_TorlofPacht, " I gave Torlof an annuity from Sekob. " );
		B_LogEntry_Quiet(TOPIC_BecomeSLD, " I completed the task Torlof gave me. " );
		Torlof_ProbePassed = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Torlof_SekobSuccess_01_04 " );	// And? Have you squandered all your money? You must bring them to me! And hurry up!
	};
};


instance DIA_Torlof_BengarSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 10;
	condition = DIA_Torlof_BengarSuccess_Condition;
	information = DIA_Torlof_BengarSuccess_Info;
	permanent = FALSE;
	description = " I solved Bengar's problems with the militia. " ;
};


func int DIA_Torlof_BengarSuccess_Condition()
{
	if ((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BengarSuccess_Info()
{
	AI_Output(other,self, " DIA_Torlof_BengarSuccess_15_00 " );	// I solved Bengar's problems with the militia.
	AI_Output(self,other, " DIA_Torlof_BengarSuccess_01_01 " );	// Did you make sure they didn't show up on his doorstep tomorrow morning?
	AI_Output(other, self, " DIA_Torlof_BengarSuccess_15_02 " );	// To do this, they will have to work really hard...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Отлично!
	if(Torlof_Probe == Probe_Bengar)
	{
		AI_Output(self,other, " DIA_Torlof_BengarSuccess_01_04 " );	// You passed the test. You were able to deal with the militia, enough to earn the respect of the majority.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry(TOPIC_BecomeSLD, " I completed the task that Torlof gave me. " );
	Torlof_ProbePassed = TRUE ;
};


instance DIA_Torlof_Welcome(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 11;
	condition = DIA_Torlof_Welcome_Condition;
	information = DIA_Torlof_Welcome_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_Welcome_Condition()
{
	if((other.guild == GIL_SLD) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Welcome_Info()
{
	AI_Output(self,other, " DIA_Torlof_Welcome_01_00 " );	// Welcome to the ranks of the mercenaries, boy!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//Спасибо!
	AI_Output(self,other, " DIA_Torlof_Welcome_01_02 " );	// As soon as I have a job for you, I'll let you know.
};


var int Torlof_KnowsDragons;

func void B_Torlof_Dragons()
{
	AI_Output(self,other, " DIA_Torlof_Add_01_01 " );	// Where were you?
	AI_Output(other,self, " DIA_Torlof_Add_15_02 " );	// I was in the Valley of Mines! There are dragons! And the paladins have a hard time!
	AI_Output(self,other, " DIA_Torlof_Add_01_03 " );	// Yes? It looks like there is some truth in all these stories!
	AI_Output(self,other, " DIA_Torlof_Add_01_04 " );	// Whether it will be interesting...
	Torlof_KnowsDragons = TRUE;
};


instance DIA_Torlof_TheOtherMission(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 11;
	condition = DIA_Torlof_TheOtherMission_Condition;
	information = DIA_Torlof_TheOtherMission_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_TheOtherMission_Condition()
{
	if ((other.guild ==  GIL_SLD ) && (Chapter >=  2 ))
	{
		return TRUE;
	};
};

func void DIA_Torlof_TheOtherMission_Info()
{
	if((Torlof_KnowsDragons == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		B_Torlof_Dragons();
	};
	AI_Output(self,other, " DIA_Torlof_TheOtherMission_01_00 " );	// Good to have you here. I have a job for you...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//Что такое?
	if(Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else
	{
		B_Torlof_BengarMilizKlatschen();
	};
	AI_Output(self,other, " DIA_Torlof_TheOtherMission_01_02 " );	// And you have to finish this before tomorrow morning!
	Torlof_TheOtherMission_Day = Wld_GetDay();
};


instance DIA_Torlof_Dragons(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 12;
	condition = DIA_Torlof_Dragons_Condition;
	information = DIA_Torlof_Dragons_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_Dragons_Condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (Kapitel <= 3) && (other.guild == GIL_SLD) && (Torlof_KnowsDragons == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Dragons_Info()
{
	B_Torlof_Dragons();
};


instance DIA_Torlof_WhatCanYouTeach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 140;
	condition = DIA_Torlof_WhatCanYouTeach_Condition;
	information = DIA_Torlof_WhatCanYouTeach_Info;
	permanent = FALSE;
	description = " Can you help me improve my abilities? " ;
};

func int DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};

func void DIA_Torlof_WhatCanYouTeach_Info()
{
	AI_Output(other,self, " DIA_Torlof_WhatCanYouTeach_15_00 " );	// Can you help me improve my abilities?
	AI_Output(self,other, " DIA_Torlof_WhatCanYouTeach_01_01 " );	// I could show you how to use strength better in close combat.
	AI_Output(self,other, " DIA_Torlof_WhatCanYouTeach_01_02 " );	// Many fighters lose because they don't know how to properly use their power.
	AI_Output(self,other, " DIA_Torlof_WhatCanYouTeach_01_03 " );	// Same goes for agility and ranged weapons.
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher, " Torlof can increase my dexterity and strength. " );
};

var int Torlof_Brand_STR;
var int Torlof_Brand_DEX;

instance DIA_Torlof_NoTeach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 150;
	condition = DIA_Torlof_NoTeach_Condition;
	information = DIA_Torlof_NoTeach_Info;
	permanent = FALSE;
	description = " I want to improve my abilities! " ;
};

func int DIA_Torlof_NoTeach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Torlof_WhatCanYouTeach) == TRUE) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Torlof_NoTeach_Info()
{
	AI_Output(other,self, " DIA_Torlof_Teach_15_00 " );	// I want to improve my abilities!
	AI_Output(self,other, " DIA_Torlof_Teach_01_01 " );	// I said I COULD help you, but that doesn't mean I WILL help.
	AI_Output(self,other, " DIA_Torlof_Teach_01_02 " );	// Until you become one of us, you'd better look for another teacher!
};

instance DIA_Torlof_Teach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 150;
	condition = DIA_Torlof_Teach_Condition;
	information = DIA_Torlof_Teach_Info;
	permanent = TRUE;
	description = " I want to improve my abilities! " ;
};

func int DIA_Torlof_Teach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Torlof_WhatCanYouTeach) == TRUE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Teach_Info()
{
	AI_Output(other,self, " DIA_Torlof_Teach_15_00 " );	// I want to improve my abilities!
	Torlof_Merke_STR = other.attribute[ATR_STRENGTH];
	Torlof_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_Back()
{
	if((Torlof_Merke_STR < other.attribute[ATR_STRENGTH]) || (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other, " DIA_Torlof_Teach_Back_01_00 " );	// Good! Now you can use your abilities more effectively!
	};
	Info_ClearChoices(DIA_Torlof_Teach);
};

func void DIA_Torlof_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_HIGH);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_HIGH);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void dia_torlof_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void dia_torlof_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};


instance DIA_Torlof_KAP3_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP3_EXIT_Condition;
	information = DIA_Torlof_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DEMENTOREN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 30;
	condition = DIA_Torlof_DEMENTOREN_Condition;
	information = DIA_Torlof_DEMENTOREN_Info;
	description = " Do you have any work for me? " ;
};


func int DIA_Torlof_DEMENTOREN_Condition()
{
	if ((Chapter >=  3 ) && ( CAPTAINNORDERDIAWAY  ==  FALSE ) && (MeetDarkRavenSpeaker ==  TRUE ) && (DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DEMENTOREN_Info()
{
	AI_Output(other,self, " DIA_Torlof_DEMENTOREN_15_00 " );	// Do you have any work for me?
	AI_Output(self,other, " DIA_Torlof_DEMENTOREN_01_01 " );	// Have you seen these guys dressed in black robes hanging around here? They give me the creeps, to be honest.
	AI_Output(self,other, " DIA_Torlof_DEMENTOREN_01_02 " );	// When I was on the sea, I saw a lot of strange things, but these guys really scared me.
	AI_Output(self,other, " DIA_Torlof_DEMENTOREN_01_03 " );	// They came from the direction of the bandit camp, which is located in the mountains, in the southern part of this valley.
	AI_Output(self,other, " DIA_Torlof_DEMENTOREN_01_04 " );	// Maybe you should go over there and deal with those guys!
	MIS_Torlof_Dmt = LOG_Running;
	Log_CreateTopic(TOPIC_Torlof_Dmt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt,LOG_Running);
	B_LogEntry(TOPIC_Torlof_Dmt, " In the southern part of the valley, in the mountains, in a bandit camp, it seems that these people in black robes have appeared. Torlof is very worried about this! I have to solve this problem for him. " );
};

instance DIA_Torlof_DmtSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 30;
	condition = DIA_Torlof_DmtSuccess_Condition;
	information = DIA_Torlof_DmtSuccess_Info;
	description = " Those people in dark robes won't bother you anymore! " ;
};

func int DIA_Torlof_DmtSuccess_Condition()
{
	if((MIS_Torlof_Dmt == LOG_Running) && (CastlemineDMTMasterIsDead == TRUE) && (CastlemineDMTIsDead == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DmtSuccess_Info()
{
	B_GivePlayerXP(XP_Torlof_DMT);
	AI_Output(other,self, " DIA_Torlof_DmtSuccess_15_00 " );	// Those people in dark robes won't bother you anymore!
	AI_Output(self,other, " DIA_Torlof_DmtSuccess_01_01 " );	// Were you able to deal with them? Excellent!
	AI_Output(self,other, " DIA_Torlof_DmtSuccess_01_02 " );	// I didn't trust these guys right away. From a mile away it was clear that they would be nothing but trouble!
	MIS_Torlof_Dmt = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Torlof_Dmt,LOG_SUCCESS);
	B_LogEntry(TOPIC_Torlof_Dmt, " I told Torlof not to worry about the dark wanderers anymore. " );
};

instance DIA_Torlof_KAP4_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP4_EXIT_Condition;
	information = DIA_Torlof_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Torlof_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_WOISTSYLVIO(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 40;
	condition = DIA_Torlof_WOISTSYLVIO_Condition;
	information = DIA_Torlof_WOISTSYLVIO_Info;
	description = " Have some of the mercenaries left here? " ;
};


func int DIA_Torlof_WOISTSYLVIO_Condition()
{
	if((CAPITANORDERDIAWAY == FALSE) && ((MIS_ReadyforChapter4 == TRUE) || (Kapitel == 4)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_WOISTSYLVIO_Info()
{
	AI_Output(other,self, " DIA_Torlof_WOISTSYLVIO_15_00 " );	// What, some of the mercenaries left here?
	AI_Output(self,other, " DIA_Torlof_WOISTSYLVIO_01_01 " );	// Silvio took a few guys and left through the passage.
	AI_Output(self,other, " DIA_Torlof_WOISTSYLVIO_01_02 " );	// Rumor has it that dragons appeared there. When he heard this, he was unstoppable.
	AI_Output(self,other, " DIA_Torlof_WOISTSYLVIO_01_03 " );	// Who knows? Dragon treasures can certainly sell for a very high price.
	AI_Output(self,other, " DIA_Torlof_WOISTSYLVIO_01_04 " );	// But that doesn't concern me. I am a sailor. I belong to the sea, and I don't care about the sweltering lair of the dragon.
};


instance DIA_Torlof_KAP5_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP5_EXIT_Condition;
	information = DIA_Torlof_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_BEMYCAPTAIN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 51;
	condition = DIA_Torlof_BEMYCAPTAIN_Condition;
	information = DIA_Torlof_BEMYCAPTAIN_Info;
	permanent = FALSE;
	description = " Were you a sailor? " ;
};


func int DIA_Torlof_BEMYCAPTAIN_Condition()
{
	if ((Capitol ==  5 ) && (MY_SCKnowsWayToIrdorath ==  TRUE ) && ( TORLOFCISCAPTAIN  ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//Ты моряк?
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_01_01 " );	// Did you just find out about this?! (surprised) Yes, damn it, I'm a sailor! Why are you asking?
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN_15_02 " );	// I could find a use for your talents. I need to get to the island.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_01_03 " );	// To the island? (laughs) You don't even have a ship, let alone a crew!
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_01_04 " );	// No, my boy! If you wish to use my services as a captain and force teacher, you must first prove to me that you understand what you are talking about.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_01_05 " );	// In addition, I have enough other problems. The paladins didn't leave the city as I expected.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_01_06 " );	// Something very serious has to happen for them to get out of there.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN, " Okay, forget it. " ,dia_torlof_bemycaptain_no);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN, " And if I take care of this, then will you be my captain? " ,dia_torlof_bemycaptain_yes);
};

func void dia_torlof_bemycaptain_no()
{
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN_No_01_00 " );	// Okay, forget it.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_No_01_01 " );	// Here, here... (grinning) And I'm talking about it to you!
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_01_08 " );	// So you better get lost!
	AI_StopProcessInfos(self);
};

func void dia_torlof_bemycaptain_yes()
{
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN_Yes_01_00 " );	// And if I make sure that the paladins leave the city - then you will become my captain?
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_Yes_01_01 " );	// Hmmm...(thoughtfully) Yeah, then maybe I could actually help you get to the island.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN_Yes_01_02 " );	// But not before you fulfill what you promised!
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain, " Before Torlof takes over as captain, I'll have to make sure the paladins leave town. I wonder how I can do that? " );
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_BEMYCAPTAIN2(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 52;
	condition = DIA_Torlof_BEMYCAPTAIN2_Condition;
	information = DIA_Torlof_BEMYCAPTAIN2_Info;
	description = " The gates of the castle in the Valley of Mines are open. " ;
};


func int DIA_Torlof_BEMYCAPTAIN2_Condition()
{
	if((MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Torlof_BEMYCAPTAIN) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN2_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN2_15_00 " );	// The gates in the Valley of Mines castle are open and jammed. Now nothing holds back the orcs, and they take this castle by storm.
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN2_15_01 " );	// The paladins in the castle are taking heavy casualties.
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN2_15_02 " );	// And I don't think it will be long before the paladins from the city march out into the Valley of Mines to rescue the guys besieged in the castle.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN2_01_03 " );	// That's good news! Now nothing prevents me from leaving this god damned place.
};


instance DIA_Torlof_BEMYCAPTAIN3(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 53;
	condition = DIA_Torlof_BEMYCAPTAIN3_Condition;
	information = DIA_Torlof_BEMYCAPTAIN3_Info;
	permanent = TRUE;
	description = " Now will you help me get to the island? " ;
};


var int Torlof_PaidToBeCaptain;

func int DIA_Torlof_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_BEMYCAPTAIN2) && (Torlof_PaidToBeCaptain == FALSE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN3_15_00 " );	// Now will you help me get to the island?
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN3_01_01 " );	// Oh, yes. You wanted to get to the island. Mmm. Here are my conditions.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN3_01_02 " );	// You will pay me two and a half thousand gold, and I am ready to become the captain of your ship.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN3_01_03 " );	// And I'm also ready to increase your strength and agility whenever you want.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3, " That's a hell of a lot. " ,DIA_Torlof_BEMYCAPTAIN3_zuViel);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3, " Okay. Here's your gold. " ,DIA_Torlof_BEMYCAPTAIN3_ok);
};

func void DIA_Torlof_BEMYCAPTAIN3_too much()
{
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00 " );	// That's a hell of a lot.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01 " );	// Yes. Professional help is expensive. But you have no other choice. You can't find another captain for your ship.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02 " );	// So pay your money and don't make trouble.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry(Topic_Captain, " Torlof is now ready to command the ship. However, he wants to get two and a half thousand gold coins for this job. " );
};

func void DIA_Torlof_BEMYCAPTAIN3_ok()
{
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN3_ok_15_00 " );	// Good. Here is your gold.
	if(B_GiveInvItems(other,self,ItMi_Gold,2500))
	{
		AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN3_ok_01_01 " );	// Excellent. Now it only remains for you to tell me in detail what I must do.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry(Topic_Captain, " After Torlof got his money, he's finally ready to go with me. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN3_ok_01_02 " );	// Are you trying to fool me? Get the money first. Then we'll talk.
	};
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
};


instance DIA_Torlof_BEMYCAPTAIN4(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 54;
	condition = DIA_Torlof_BEMYCAPTAIN4_Condition;
	information = DIA_Torlof_BEMYCAPTAIN4_Info;
	permanent = TRUE;
	description = " Be my captain. " ;
};


func int DIA_Torlof_BEMYCAPTAIN4_Condition()
{
	if((SCGotCaptain == FALSE) && (Torlof_PaidToBeCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN4_Info()
{
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN4_15_00 " );	// Be my captain.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN4_01_01 " );	// Good. Give me a ship and a strong crew, and I will take you to this cursed island.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN4_01_02 " );	// Do you have a sea chart? We won't get far without her.
	AI_Output(other,self, " DIA_Torlof_BEMYCAPTAIN4_15_03 " );	// I'll take care of everything. See you at the port.
	AI_Output(self,other, " DIA_Torlof_BEMYCAPTAIN4_01_04 " );	// I can't wait to see how it all pans out for you.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	TorlofIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Torlof_LOSFAHREN (C_Info)
{
	npc = SLD_801_Torlof;
	nr = 59;
	condition = DIA_Torlof_LOSFAHREN_Condition;
	information = DIA_Torlof_LOSFAHREN_Info;
	permanent = TRUE;
	description = " We're going to the island. " ;
};


func int DIA_Torlof_LOSFAHREN_Condition()
{
	if((TorlofIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_LOSFAHREN_Info()
{
	AI_Output(other,self, " DIA_Torlof_LOSFAHREN_15_00 " );	// We're heading to the island.
	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_LOSFAHREN_01_01 " );	// Good! Give me a sea chart - and we raise the sails!
		AI_Output(other,self, " DIA_Torlof_LOSFAHREN_01_07 " );	// Here, take this.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other, " DIA_Torlof_LOSFAHREN_01_02 " );	// (screaming loudly) Raise the sails!
		AI_Output(self,other, " DIA_Torlof_LOSFAHREN_01_03 " );	// Check if you managed to take everything you need. There will be no return!
		AI_Output(self,other, " DIA_Torlof_LOSFAHREN_01_04 " );	// If you're sure of everything, go take a nap in the captain's quarters. This journey will be long!
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Torlof_LOSFAHREN_01_05 " );	// Without a ship, a crew, and a sea chart, there's no voyage, mate.
		AI_Output(self,other, " DIA_Torlof_LOSFAHREN_01_06 " );	// I need at least 5 people ready to stand under me.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Torlof_PERM5_NOTCAPTAIN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 59;
	condition = DIA_Torlof_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Torlof_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = " I've decided to take another captain. " ;
};


func int DIA_Torlof_PERM5_NOTCAPTAIN_Condition()
{
	if((SCGotCaptain == TRUE) && (TorlofIsCaptain == FALSE) && (Torlof_PaidToBeCaptain == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self, " DIA_Torlof_PERM5_NOTCAPTAIN_15_00 " );	// I decided to take another captain. Give me back my money.
	AI_Output(self,other, " DIA_Torlof_PERM5_NOTCAPTAIN_01_01 " );	// Damn it! If you paid me up front and then refused my services, that's your problem.
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_KAP6_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP6_EXIT_Condition;
	information = DIA_Torlof_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_PICKPOCKET(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 900;
	condition = DIA_Torlof_PICKPOCKET_Condition;
	information = DIA_Torlof_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Torlof_PICKPOCKET_Condition()
{
	return  C_Robbery ( 76 , 120 );
};

func void DIA_Torlof_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_PICKPOCKET,Dialog_Back,DIA_Torlof_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Torlof_PICKPOCKET_DoIt);
};

func void DIA_Torlof_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};

func void DIA_Torlof_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};


instance DIA_TORLOF_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_torlof_nw_kapitelorcattack_condition;
	information = dia_torlof_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " I have bad news for you. " ;
};


func int dia_torlof_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (TORLOFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_Torlof_NW_KapitelOrcAttack_01_00 " );	// I've got bad news for you - Khorinis has been captured by orcs!
	AI_Output(self,other, " DIA_Torlof_NW_KapitelOrcAttack_01_01 " );	// When we were just approaching the harbor, I already felt something was wrong.
	AI_Output(self,other, " DIA_Torlof_NW_KapitelOrcAttack_01_04 " );	// I think that in our current situation, only one thing can help us.
	AI_Output(other,self, " DIA_Torlof_NW_KapitelOrcAttack_01_05 " );	// What exactly?
	AI_Output(self,other, " DIA_Torlof_NW_KapitelOrcAttack_01_06 " );	// A miracle, of course!
	Info_ClearChoices(dia_torlof_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_torlof_nw_kapitelorcattack, " Offer teleportation rune to Onar's farm. " ,dia_torlof_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_torlof_nw_kapitelorcattack, " Okay, whatever you say. " ,dia_torlof_nw_kapitelorcattack_nogiverune);
};

func void dia_torlof_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Torlof_NW_KapitelOrcAttack_Farm_01_01 " );	// Wait! I have a rune to teleport to Onar's farm with me.
	AI_Output(other,self, " DIA_Torlof_NW_KapitelOrcAttack_Farm_01_02 " );	// You can use it.
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_03");	//Руна?!
	AI_Output(other,self, " DIA_Torlof_NW_KapitelOrcAttack_Farm_01_05 " );	// Your idea of ​​fighting your way through a city filled to the brim with orcs is pure madness.
	AI_Output(other,self, " DIA_Torlof_NW_KapitelOrcAttack_Farm_01_06 " );	// These creatures will make mincemeat out of you! And you know it as well as I do.
	AI_Output(self,other, " DIA_Torlof_NW_KapitelOrcAttack_Farm_01_09 " );	// Okay, give it here.
	AI_Output(other,self, " DIA_Torlof_NW_KapitelOrcAttack_Farm_01_10 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other, " DIA_Torlof_NW_KapitelOrcAttack_Farm_01_11 " );	// Eh! I hope after it I won’t be sick again for a week, like after a bottle of old schnapps.
	TORLOFNOBATTLETHROUGTH = TRUE;
	B_LogEntry( TOPIC_HELPCREW , " I gave Torlof the rune of teleportation to Onar's farm. Now I am calm about his fate. " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_torlof_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Torlof_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// Okay, I won't dissuade you.
	B_LogEntry( TOPIC_HELPCREW , " Torlof will fight his way through the city. I think he has a chance. " );
	TORLOFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_FUCKOFF(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 2;
	condition = dia_sld_801_torlof_fuckoff_condition;
	information = dia_sld_801_torlof_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_801_torlof_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_801_TORLOF_YOURFREE(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_yourfree_condition;
	information = dia_sld_801_torlof_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_801_torlof_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_yourfree_info()
{
	AI_Output(self,other, " DIA_SLD_801_Torlof_YourFree_01_08 " );	// What else do you need?!
	AI_Output(other,self,"DIA_SLD_801_Torlof_YourFree_01_00");	//Ты свободен!
	AI_Output(self,other, " DIA_SLD_801_Torlof_YourFree_01_01 " );	// Hmmm... (surprised) Have you killed all the orcs in the city?
	AI_Output(other,self, " DIA_SLD_801_Torlof_YourFree_01_02 " );	// Yes, that's right.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other, " DIA_SLD_801_Torlof_YourFree_01_03 " );	// Well, great mate! And then we thought that we all came to an end.
		AI_Output(self,other, " DIA_SLD_801_Torlof_YourFree_01_04 " );	// Just open the bars first so we can get out of here.
	}
	else
	{
		AI_Output(self,other, " DIA_SLD_801_Torlof_YourFree_01_05 " );	// Well, great mate! And then I thought I was finished.
		AI_Output(self,other, " DIA_SLD_801_Torlof_YourFree_01_06 " );	// Just open the grate first so I can get out of here.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_OPENGATENOW(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_opengatenow_condition;
	information = dia_sld_801_torlof_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_801_torlof_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (TORLOFISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_opengatenow_info()
{
	AI_Output(self,other, " DIA_SLD_801_Torlof_OpenGateNow_01_00 " );	// (uncomprehendingly) Are you going to stand here?!
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_AGAINCAPITAN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 5;
	condition = dia_sld_801_torlof_againcapitan_condition;
	information = dia_sld_801_torlof_againcapitan_info;
	permanent = FALSE;
	description = " I need a captain! " ;
};


func int dia_sld_801_torlof_againcapitan_condition()
{
	if ( Npc_KnowsInfo ( other , this_lord_hagen_need_capitan ) && ( TORLOFISFREE  ==  TRUE ) && ( GREEK CAPTAIN  !=  TRUE ) && ( SHIPAGAINACCESS  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_againcapitan_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_SLD_801_Torlof_AgainCapitan_01_00 " );	// I need a captain!
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_01 " );	// Yes?! And where are you going again, buddy?
	}
	else
	{
		AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_02 " );	// Yes?! And why did you suddenly need it?
	};
	AI_Output(other,self, " DIA_SLD_801_Torlof_AgainCapitan_01_03 " );	// I need to sail to the mainland immediately.
	AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_04 " );	// (surprised) To the mainland?
	AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_06 " );	// Consider yourself a captain.
	AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_07 " );	// In the end, it's better than hanging out on this damn farm for eternity.
	AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_08 " );	// And when do we weigh anchor?
	AI_Output(other,self, " DIA_SLD_801_Torlof_AgainCapitan_01_09 " );	// Right now.
	AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_10 " );	// Okay...(decidedly) Then I'm going to the harbor to prepare the ship for departure.
	AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_11 " );	// Oh, and don't forget: I'll need a few more people to somehow manage this vessel.
	AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_12 " );	// I guess five or six people would be enough!
	AI_Output(self,other, " DIA_SLD_801_Torlof_AgainCapitan_01_14 " );	// Meet me on the ship!
	B_LogEntry( TOPIC_SALETOBIGLAND , " Torlof is now my captain. However, in order to sail, I need to find five or six more people. " );
	WHOTRAVELONBIGLAND = TRUE;
	TORLOFISAGAINCAPITAN = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AllOnBoard");
};


instance DIA_SLD_801_TORLOF_TRAVELONBIGLAND(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_travelonbigland_condition;
	information = dia_sld_801_torlof_travelonbigland_info;
	permanent = TRUE;
	description = " Is my ship ready? " ;
};


func int dia_sld_801_torlof_travelonbigland_condition()
{
	if((TORLOFISAGAINCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE) && (WHOTRAVELONBIGLAND == TRUE) && (COUNTTRAVELONBIGLAND > 0) && (ALLSAYGOODBUY == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_travelonbigland_info()
{
	AI_Output(other,self, " DIA_SLD_801_Torlof_TravelOnBigLand_01_00 " );	// Is my ship ready?
	if(COUNTTRAVELONBIGLAND >= 5)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other, " DIA_SLD_801_Torlof_TravelOnBigLand_01_01 " );	// Of course. Everything is fine! How else.
		AI_Output(other,self, " DIA_SLD_801_Torlof_TravelOnBigLand_01_02 " );	// Well, if so, then we can sail.
		AI_Output(self,other, " DIA_SLD_801_Torlof_TravelOnBigLand_01_03 " );	// Hmmm. Are you completely sure of this?
		AI_Output(other,self, " DIA_SLD_801_Torlof_TravelOnBigLand_01_04 " );	// Yes. Time does not wait.
		AI_Output(self,other, " DIA_SLD_801_Torlof_TravelOnBigLand_01_05 " );	// Good. As you wish.
		AI_TurnToNPC(self,DiegoNW);
		AI_Output(self,other, " DIA_SLD_801_Torlof_TravelOnBigLand_01_06 " );	// ...(shouting) Hey, you land rats!
		AI_Output(self,other, " DIA_SLD_801_Torlof_TravelOnBigLand_01_07 " );	// ...(shouting) Raise the anchor, give up the mooring lines, set the sails!
		AI_Output(self,other, " DIA_SLD_801_Torlof_TravelOnBigLand_01_08 " );	// ...(shouting) Secure knots and winch!
		ALLSAYGOODBUY = TRUE;
		MIS_SALETOBIGLAND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_SUCCESS);
		B_LogEntry( TOPIC_SALETOBIGLAND , " We are leaving Khorinis for the mainland. Who knows what awaits us there... " );
		Info_ClearChoices(dia_sld_801_torlof_travelonbigland);
		Info_AddChoice(dia_sld_801_torlof_travelonbigland,Dialog_Ende,dia_sld_801_torlof_travelonbigland_ok);
	}
	else
	{
		AI_Output(self,other, " DIA_SLD_801_Torlof_TravelOnBigLand_01_09 " );	// Of course. Everything is fine! How else.
	};
};

func void dia_sld_801_torlof_travelonbigland_ok()
{
	AI_StopProcessInfos(self);
	b_end_avi();
};

