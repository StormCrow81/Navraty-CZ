

instance DIA_Ulf_EXIT(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 999;
	condition = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulf_Hello (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 2;
	condition = DIA_Ulf_Hallo_Condition;
	information = DIA_Ulf_Hallo_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Ulf_Hallo_Condition()
{
	if ((other.guild !=  GIL_NOV ) && ( MIS_SCHNITZELJAGD  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Hallo_Info()
{
	AI_Output(other,self, " DIA_Ulf_Hallo_15_00 " );	// What are you doing here?

	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Ulf_Hallo_03_01 " );	// If you're interested in knowing this, I'm on a mission for the monastery.
	}
	else
	{
		AI_Output(self,other, " DIA_Ulf_Hallo_03_02 " );	// I'm a novice in a monastery! I carry out the tasks of magicians, as well as paladins.

		if(Npc_GetDistToWP(self,"NW_CITY_BEER_04") < 1500)
		{
			AI_Output(self,other, " DIA_Ulf_Hallo_03_03 " );	// I brought wine to three innkeepers in the city.
		};
	};
};


instance DIA_Ulf_Wirte (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Wirte_Condition;
	information = DIA_Ulf_Wirte_Info;
	permanent = FALSE;
	description = " Who are these three innkeepers? " ;
};


func int DIA_Ulf_Wirte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulf_Hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (Npc_GetDistToWP(self,"NW_TAVERNE_GREGSBENCH") > 1500))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Wirte_Info()
{
	AI_Output(other,self, " DIA_Ulf_Wirte_15_00 " );	// Who are these three innkeepers?
	AI_Output(self,other, " DIA_Ulf_Wirte_03_01 " );	// One of them is this kind man behind the counter.
	AI_Output(self,other, " DIA_Ulf_Wirte_03_02 " );	// Also Karagon is the owner of a tavern on the temple square, and Cardiff is the owner of a bar in the waterfront.
};


instance DIA_Ulf_Kloster(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Kloster_Condition;
	information = DIA_Ulf_Kloster_Info;
	permanent = FALSE;
	description = " What can you tell me about the monastery? " ;
};


func int DIA_Ulf_Kloster_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Ulf_Hallo ) && ( hero . guild !=  GIL_KDF ) && ( hero . guild !=  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Kloster_Info()
{
	AI_Output(other,self, " DIA_Ulf_Kloster_15_00 " );	// What can you tell me about the monastery?
	AI_Output(self,other, " DIA_Ulf_Kloster_03_01 " );	// We, the novices, seek enlightenment in prayers to Innos and the study of the principles of faith under the guidance of magicians.
	AI_Output(self,other, " DIA_Ulf_Kloster_03_02 " );	// We serve them as we serve Innos, and prepare ourselves for union with the fire.
};


instance DIA_Ulf_Bringen (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 4;
	condition = DIA_Ulf_Bringen_Condition;
	information = DIA_Ulf_Bringen_Info;
	permanent = FALSE;
	description = " Take me to the monastery. " ;
};


func int DIA_Ulf_Bringen_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Ulf_Hallo) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_NOV ) && (hero.guild !=  GIL_PAL ))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Bringen_Info()
{
	AI_Output(other,self, " DIA_Ulf_Bringen_15_00 " );	// Take me to the monastery.
	AI_Output(self,other, " DIA_Ulf_Bringen_03_01 " );	// Forget it. Do you know how many different evil creatures I met along the way?
	AI_Output(self,other, " DIA_Ulf_Bringen_03_02 " );	// When I think about all those bloody flies and wolves and goblins, I'm glad I don't have to live here anymore.
	AI_Output(self,other, " DIA_Ulf_Bringen_03_03 " );	// Besides, you won't be allowed into the monastery anyway.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Почему?
	AI_Output(self,other, " DIA_Ulf_Bringen_03_05 " );	// Only mages, paladins, and acolytes are allowed to enter the monastery.
};


instance DIA_Ulf_Recording (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Recording_Condition;
	information = DIA_Ulf_Recording_Info;
	permanent = FALSE;
	description = " How do I become a novice? " ;
};


func int DIA_Ulf_Recording_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Bild_Info()
{
	AI_Output(other,self, " DIA_Ulf_Aufnahme_15_00 " );	// How do I become a novice?
	AI_Output(self,other, " DIA_Ulf_Aufnahme_03_01 " );	// If a person feels a deep desire...
	AI_Output(other,self, " DIA_Ulf_Aufnahme_15_02 " );	// Hey! Just tell me what the conditions are.
	AI_Output(self,other, " DIA_Ulf_Aufnahme_03_03 " );	// You must bring gifts. Sheep and...
	B_Say_Gold(self,other,Summe_Kloster);
	Log_CreateTopic(Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus(Topic_Kloster,LOG_Running);
	B_LogEntry(Topic_Kloster, " To become an acolyte of the Innos monastery, I need a sheep and a thousand gold pieces. " );
};


instance DIA_Ulf_Gold(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 8;
	condition = DIA_Ulf_Gold_Condition;
	information = DIA_Ulf_Gold_Info;
	permanent = FALSE;
	description = " How can I get such a huge amount? " ;
};


func int DIA_Ulf_Gold_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Ulf_Aufnahme ) && ( hero . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Gold_Info()
{
	AI_Output(other,self, " DIA_Ulf_Gold_15_00 " );	// How do I get such a huge amount?
	AI_Output(self,other, " DIA_Ulf_Gold_03_01 " );	// Since you obviously don't know anyone who could pay for you, you just need to earn it.
};


instance DIA_Ulf_Schaf (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Schaf_Condition;
	information = DIA_Ulf_Schaf_Info;
	permanent = FALSE;
	description = " Where can I find sheep? " ;
};


func int DIA_Ulf_Schaf_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Wolf_Aufname ) & & ( other . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Schaf_Info()
{
	AI_Output(other,self, " DIA_Ulf_Schaf_15_00 " );	// Where can I find a sheep?
	AI_Output(self,other, " DIA_Ulf_Schaf_03_01 " );	// Farmers, of course. But you won't get it for free.
	B_LogEntry(Topic_Kloster, " I can get sheep from the farmers. " );
};


instance DIA_Ulf_Search (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Suche_Condition;
	information = DIA_Ulf_Search_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Suche_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Search_Info()
{
	AI_Output(self,other, " DIA_Ulf_Suche_03_00 " );	// Hey, do you know the news?
	AI_Output(other,self, " DIA_Ulf_Suche_15_01 " );	// You have been chosen.
	AI_Output(self,other, " DIA_Ulf_Suche_03_02 " );	// Exactly. I was just about to sit down and have a cold beer when Daron came around the corner and told me that I had been chosen.
	AI_Output(self,other, " DIA_Ulf_Suche_03_03 " );	// Who would have thought? The will of Innos is incomprehensible. What brought you here?
	AI_Output(other,self, " DIA_Ulf_Suche_15_04 " );	// I requested a Trial by Fire.
	AI_Output(self,other, " DIA_Ulf_Suche_03_05 " );	// Is this impossible?! It looks like you have enough courage for ten. Does this mean that you too will look for 'what the believer finds at the end of the road'?
	AI_Output(other,self, " DIA_Ulf_Suche_15_06 " );	// Looks like this.
};


instance DIA_Ulf_Rausfound (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Rausfound_Condition;
	information = DIA_Ulf_Rausfound_Info;
	permanent = FALSE;
	description = " Have you found anything yet? " ;
};


func int DIA_Ulf_Rausfound_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Get out_Info()
{
	AI_Output(other,self, " DIA_Ulf_Rausgefunden_15_00 " );	// Haven't found anything yet?
	AI_Output(self,other, " DIA_Ulf_Rausgefunden_03_01 " );	// Well, I tried to follow Agon - but I lost him.
	AI_Output(self,other, " DIA_Ulf_Rausgefunden_03_02 " );	// And now what? What they're saying? Follow the signs of Innos. But I don't understand this riddle with the path.
	AI_Output(self,other, " DIA_Ulf_Rausgefunden_03_03 " );	// So I'll continue my search.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_Ulf_Folgen (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Folgen_Condition;
	information = DIA_Ulf_Folgen_Info;
	permanent = FALSE;
	description = " Hey, are you following me? " ;
};


func int DIA_Ulf_Folgen_Condition()
{
	if (( MIS_SCHNITZELJAGD  == LOG_Running) && (other.guild ==  GIL_NOV ) && Npc_KnowsInfo(other,DIA_Wolf_RausgeFound))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Follow_Info()
{
	AI_Output(other,self, " DIA_Ulf_Folgen_15_00 " );	// Hey, are you following me?
	AI_Output(self,other, " DIA_Ulf_Folgen_03_01 " );	// Nonsense. I just happen to be walking in the same direction as you.
	AI_StopProcessInfos(self);
};


instance DIA_Ulf_Stop(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Stop_Condition;
	information = DIA_Ulf_Stop_Info;
	permanent = FALSE;
	description = " Stop chasing me! " ;
};


func int DIA_Ulf_Stop_Condition()
{
	if (( MIS_SCHNITZELJAGD  == LOG_Running) && (other.guild ==  GIL_NOV ) && Npc_KnowsInfo(other,DIA_Wolf_Follow))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Stop_Info()
{
	AI_Output(other,self, " DIA_Ulf_Stop_15_00 " );	// Stop chasing me!
	AI_Output(self,other, " DIA_Ulf_Stop_03_01 " );	// I'm not following you. But please, if you think so, I'll go the other way.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_Ulf_Abrechnung (C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Abrechnung_Condition;
	information = DIA_Ulf_Abrechnung_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Abrechnung_Condition()
{
	if (( MIS_SCHNITZELJAGD  == LOG_Running ) && ( other . guild ==  GIL_NOV ) && ( Npc_HasItems ( other , ItMi_RuneBlank ) >=  1 ) && ( Npc_KnowsInfo ( other , DIA_Agon_GolemDead ) ||
	{
		return TRUE;
	};
};

func void DIA_Ulf_Abrechnung_Info()
{
	AI_Output(self,other, " DIA_Ulf_Abrechnung_03_00 " );	// We met again. I've been thinking a lot. I believe that the desire to become a magician is strong in me.
	AI_Output(other,self, " DIA_Ulf_Abrechnung_15_01 " );	// Oh - don't do that...
	AI_Output(self,other, " DIA_Ulf_Abrechnung_03_02 " );	// I don't have a choice. The life of a novice is not for me.
	AI_Output(self,other, " DIA_Ulf_Abrechnung_03_03 " );	// I have to become a mage. Then immediately everything will be fine. And now I'll take what should be mine.
	AI_Output(self,other, " DIA_Ulf_Abrechnung_03_04 " );	// Do you want to have the last word?
	Info_ClearChoices(DIA_Ulf_Abrechnung);
	Info_AddChoice(DIA_Ulf_Abrechnung, " Stop, I don't want to kill you. " ,DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice(DIA_Ulf_Abrechnung, " You may not understand - I need to go back to the monastery. " ,DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice(DIA_Ulf_Abrechnung, " Don't you have something to smoke? " ,DIA_Ulf_Abrechnung_Rauch);
};

func void DIA_Ulf_Abrechnung_Lass()
{
	AI_Output(other,self, " DIA_Ulf_Abrechnung_Lass_15_00 " );	// Stop it, I don't want to kill you.
	AI_Output(self,other, " DIA_Ulf_Abrechnung_Lass_03_01 " );	// Nonsense. You know you don't stand a chance against me! Fight!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};

func void DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output(other,self, " DIA_Ulf_Abrechnung_Schnell_15_00 " );	// You may not understand something... I need to get back to the monastery.
	AI_Output(self,other, " DIA_Ulf_Abrechnung_Schnell_03_01 " );	// You don't have to go anywhere else!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};

func void DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output(other,self, " DIA_Ulf_Abrechnung_Rauch_15_00 " );	// Don't you have anything to smoke?
	AI_Output(self,other, " DIA_Ulf_Abrechnung_Rauch_03_01 " );	// You're in luck. I just have something.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	B_UseItem(other,ItMi_Joint);
	AI_Output(self,other, " DIA_Ulf_Abrechnung_Rauch_03_02 " );	// Let's smoke.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Ulf_Troll(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Troll_Condition;
	information = DIA_Ulf_Troll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Troll_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Troll_Info()
{
	AI_Output(self,other, " DIA_Ulf_Troll_03_00 " );	// Hey, do you really think we're on the right track? The troll doesn't live here.
	AI_Output(self,other, " DIA_Ulf_Troll_03_01 " );	// I think we need to go the other way.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_RING(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 2;
	condition = dia_ulf_ring_condition;
	information = dia_ulf_ring_info;
	permanent = FALSE;
	description = " Hey, why are you so gloomy? " ;
};


func int dia_ulf_ring_condition()
{
	if((Kapitel >= 2) && (ULFTAVERNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_ulf_ring_info()
{
	AI_Output(other,self, " DIA_Ulf_Ring_01_00 " );	// Hey, why are you so gloomy?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Ulf_Ring_01_01 " );	// Forgive me, master... (he hesitated) I...
		AI_Output(other,self, " DIA_Ulf_Ring_01_02 " );	// Come on, tell me. What happened to you?
	}
	else
	{
		AI_Output(self,other, " DIA_Ulf_Ring_01_03 " );	// Don't even ask!
	};
	AI_Output(self,other, " DIA_Ulf_Ring_01_05 " );	// Eh. The thing is, I lost my ring.
	AI_Output(self,other, " DIA_Ulf_Ring_01_07 " );	// It was very dear to me because it was inherited from my father.
	AI_Output(other,self, " DIA_Ulf_Ring_01_08 " );	// How did you lose it?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Ulf_Ring_01_09 " );	// You see, when I was walking along the road from the city to the monastery, not far from the bridge, which is next to Akila's farm, bandits attacked me.
	}
	else
	{
		AI_Output(self,other, " DIA_Ulf_Ring_01_10 " );	// You see, when I was walking along the road from the city to the monastery, not far from the bridge, which is next to Akila's farm, bandits attacked me.
	};
	AI_Output(self,other, " DIA_Ulf_Ring_01_11 " );	// Those bastards tried to kill me! But I, don't be a fool, rushed headlong from them into the forest, which was nearby.
	AI_Output(self,other, " DIA_Ulf_Ring_01_12 " );	// I ran headlong from them, not understanding where I was running.
	AI_Output(self,other, " DIA_Ulf_Ring_01_13 " );	// And then I discovered that it was gone.
	AI_Output(self,other, " DIA_Ulf_Ring_01_14 " );	// I may have dropped it in that forest, but I won't go there again. My life is dearer to me!
	AI_Output(other,self, " DIA_Ulf_Ring_01_15 " );	// I'll think of something.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Ulf_Ring_01_16 " );	// Please, find him... (doomed) I would be extremely grateful to you!
	}
	else
	{
		AI_Output(self,other, " DIA_Ulf_Ring_01_17 " );	// Please, find him... (doomed) I would be extremely grateful to you for this!
	};
	MIS_ULFRING = LOG_Running;
	Log_CreateTopic(TOPIC_ULFRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ULFRING,LOG_Running);
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItRi_Ulf,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
};

instance DIA_ULF_RINGHERE(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 2;
	condition = dia_ulf_ringhere_condition;
	information = dia_ulf_ringhere_info;
	permanent = FALSE;
	description = " Is this your ring? " ;
};


func int dia_ulf_ringhere_condition()
{
	if((MIS_ULFRING == LOG_Running) && (Npc_HasItems(hero,itri_ulf) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_ringhere_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Ulf_RingHere_01_00 " );	// Is this your ring?
	AI_Output(self,other, " DIA_Ulf_RingHere_01_01 " );	// Oh yes, that's it!
	B_GiveInvItems(other,self,itri_ulf,1);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Ulf_RingHere_01_03 " );	// Thank you, master! What would I do without your help.
		AI_Output(self,other, " DIA_Ulf_RingHere_01_04 " );	// Here. Take this magical elixir as my thanks.
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Ulf_RingHere_01_05 " );	// Thank you! What would I do without your help.
		AI_Output(self,other, " DIA_Ulf_RingHere_01_06 " );	// Here. Take this elixir of life as my thanks.
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	};
	AI_Output(self,other, " DIA_Ulf_RingHere_01_07 " );	// I understand that this is not enough. But this is the most valuable thing I have with me!
	MIS_ULFRING = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ULFRING,LOG_SUCCESS);
	B_LogEntry( TOPIC_ULFRING , " Ulf was glad to have his ring back. " );
};


instance DIA_Ulf_PICKPOCKET(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 900;
	condition = DIA_Ulf_PICKPOCKET_Condition;
	information = DIA_Ulf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ulf_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 50 );
};

func void DIA_Ulf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
	Info_AddChoice(DIA_Ulf_PICKPOCKET,Dialog_Back,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
};

func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
};

