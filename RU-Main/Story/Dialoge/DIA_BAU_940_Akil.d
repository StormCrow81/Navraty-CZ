
instance DIA_Akil_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_EXIT_Condition;
	information = DIA_Akil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Akil_EXIT_Info()
{
	AI_Output(other,self, " DIA_Akil_EXIT_15_00 " );	// I have to go.
	if(Akil_Sauer == TRUE)
	{
		AI_Output(self,other, " DIA_Akil_EXIT_13_01 " );	// I won't keep you.
	}
	else
	{
		AI_Output(self,other, " DIA_Akil_EXIT_13_02 " );	// Bye! I'll always be happy to help in any way.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Hallo (C_Info)
{
	npc = BAU_940_Akil;
	nr = 4;
	condition = DIA_Akil_Hallo_Condition;
	information = DIA_Akil_Hello_Info;
	permanent = FALSE;
	description = " Are you having problems? " ;
};


func int DIA_Akil_Hallo_Condition()
{
	if ( ! Npc_IsDead(Alvares) &&  ! Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hallo_Info()
{
	AI_Output(other,self, " DIA_Akil_Hallo_15_00 " );	// Do you have any problems?
	AI_Output(self,other, " DIA_Akil_Hallo_13_01 " );	// (in a sweat)... Uh... no, no... it's all right. (nervously) It's... you'd better leave now.
	AI_Output(other, self, " DIA_Akil_Hallo_15_02 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_Akil_Hallo_13_03 " );	// Uh... yes, yes... it's all right. You... uh... I... I can't talk to you right now.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere, " Farmer Akils is threatened by mercenaries. " );
	Akils_SLDStillthere = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Not now (C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Nichtjetzt_Condition;
	information = DIA_Akil_Not now_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Akil_NotNow_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) &&  ! Npc_IsDead ( Alvares ) &&  ! Npc_IsDead ( Engardo ) && Npc_KnowsInfo ( other , DIA_Akil_Hallo )) .
	{
		return TRUE;
	};
};

func void DIA_Akil_NotNow_Info()
{
	AI_Output(self,other, " DIA_Akil_Nichtjetzt_13_00 " );	// Uh... not now, I can't talk to you right now.
	AI_StopProcessInfos(self);
};


instance DIA_Akil_NachKampf (C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Akil_AfterFight_Condition;
	information = DIA_Akil_NachKampf_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Akil_AfterFight_Condition()
{
	if (Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_AfterFight_Info()
{
	AI_Output(self,other, " DIA_Akil_NachKampf_13_00 " );	// Glory to Innos. I thought I was finished.
	AI_Output(self,other, " DIA_Akil_NachKampf_13_01 " );	// My name is Akil. I am a farmer on this little piece of land.
	AI_Output(other,self, " DIA_Akil_NachKampf_15_02 " );	// Who are these people?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Akil_NachKampf_13_03 " );	// You must know them. These are mercenaries from Onar's farm. As are you.
	}
	else
	{
		AI_Output(self,other, " DIA_Akil_NachKampf_13_04 " );	// These are mercenaries from Onar's farm. These bastards only know what to rob and kill.
	};
	AI_Output(self,other, " DIA_Akil_NachKampf_13_05 " );	// I feared the worst...
	AI_Output(self,other, " DIA_Akil_NachKampf_13_06 " );	// (takes a deep breath)... thank Innos it didn't come to that. Tell me what can I do for you?
	Info_ClearChoices(DIA_Akil_AfterFight);
	Info_AddChoice(DIA_Akil_NachKampf, " Nothing. I'm just glad you're okay now. " ,DIA_Akil_NachKampf_Ehre);
	Info_AddChoice(DIA_Akil_NachKampf, " How about some gold? " ,DIA_Akil_NachKampf_Gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if (Hlp_IsValidNpc(Current) &&  ! Npc_IsDead(Current))
	{
		Npc_ExchangeRoutine(Kati,"Start");
		AI_ContinueRoutine(Kati);
		Kati.flags = 0 ;
	};
	if(Hlp_IsValidNpc(Randolph) && !Npc_IsDead(Randolph))
	{
		Npc_ExchangeRoutine(Randolph,"Start");
		AI_ContinueRoutine(Randolph);
		Randolph.flags = 0;
	};
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Akil_AfterFight_Honour()
{
	AI_Output(other,self, " DIA_Akil_NachKampf_Ehre_15_00 " );	// Nothing. I'm just glad you're okay now.
	AI_Output(self,other, " DIA_Akil_NachKampf_Ehre_13_01 " );	// You are a true friend. May Innos keep you on your path.
	B_GivePlayerXP(XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices(DIA_Akil_AfterFight);
};

func void DIA_Akil_AfterBattle_Gold()
{
	AI_Output(other,self, " DIA_Akil_NachKampf_Gold_15_00 " );	// How about some gold?
	AI_Output(self,other, " DIA_Akil_NachKampf_Gold_13_01 " );	// I'm afraid I'll have to disappoint you - we're poor farmers. We barely have enough to live on.
	AI_Output(self,other, " DIA_Akil_NachKampf_Gold_13_02 " );	// All I can offer you is food. Go to Katya, let her feed you.
	B_GivePlayerXP(XP_Akil_SLDWegVomHof);
	Info_ClearChoices(DIA_Akil_AfterFight);
	cat_meal = TRUE ;
};


instances of DIA_Akil_Soeldner (C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Soeldner_Condition;
	information = DIA_Akil_Soeldner_Info;
	permanent = FALSE;
	description = " What did these mercenaries want from you? " ;
};


func int DIA_Akil_Soeldner_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};

func void DIA_Akil_Soeldner_Info()
{
	AI_Output(other,self, " DIA_Akil_Soeldner_15_00 " );	// What did these mercenaries want from you?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Akil_Soeldner_13_01 " );	// Are you kidding me? These mercenaries wanted to collect rent.
	}
	else
	{
		AI_Output(self,other, " DIA_Akil_Soeldner_13_02 " );	// You don't know this? Onar hired them. They guard his farm and collect rent for him.
		AI_Output(self,other, " DIA_Akil_Soeldner_13_03 " );	// This means they go from farm to farm and take what they like best. And those who cannot pay risk losing their lives.
	};
};


instance DIA_Addon_Akil_MissingPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_MissingPeople_Condition;
	information = DIA_Addon_Akil_MissingPeople_Info;
	description = " Have you heard anything about the missing townsfolk? " ;
};


func int DIA_Addon_Akil_MissingPeople_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Knows_Info ) && ( SC_HeardAboutMissingPeople ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Akil_MissingPeople_15_00 " );	// Have you heard anything about the missing townspeople?
	AI_Output(self,other, " DIA_Addon_Akil_MissingPeople_13_01 " );	// Heard? Do not make me laugh. I've lost a few people myself.
	AI_Output(self,other, " DIA_Addon_Akil_MissingPeople_13_02 " );	// Tonak and Telbor worked in my fields. But three days ago they disappeared.
	AI_Output(self,other, " DIA_Addon_Akil_MissingPeople_13_03 " );	// I know for a fact that they wouldn't just leave the farm without telling me.
	AI_Output(self,other, " DIA_Addon_Akil_MissingPeople_13_04 " );	// However, they are gone, and no one knows where they are now.
	AI_Output(self,other, " DIA_Addon_Akil_MissingPeople_13_05 " );	// If you find out anything about their fate, be sure to let me know
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople, " Farmer Akil is worried about two missing workers, Tonak and Telbor " );
	MIS_Akil_BringMissPeopleBack = LOG_Running;
};


instance DIA_Addon_Akil_ReturnPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_ReturnPeople_Condition;
	information = DIA_Addon_Akil_ReturnPeople_Info;
	permanent = FALSE;
	description = " About your employees... " ;
};


func int DIA_Addon_Akil_ReturnPeople_Condition()
{
	if((MIS_Akil_BringMissPeopleBack == LOG_Running) && (MissingPeopleReturnedHome == TRUE) && ((Npc_GetDistToWP(Tonak_NW,"NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(Telbor_NW,"NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_ReturnPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Akil_ReturnPeople_15_00 " );	// About your employees...
	if((Npc_GetDistToWP(Tonak_NW,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(Telbor_NW,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other, " DIA_Addon_Akil_ReturnPeople_13_01 " );	// You brought them back! You are a very brave person.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Akil_ReturnPeople_13_02 " );	// At least one of them survived.
	};
	AI_Output(self,other, " DIA_Addon_Akil_ReturnPeople_13_03 " );	// Take this gold as a reward.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	B_GivePlayerXP(XP_Ambient);
	MIS_Akil_BringMissPeopleBack = LOG_SUCCESS;
};


instance DIA_Akil_delivery (C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Delivery_Condition;
	information = DIA_Akil_Delivery_Info;
	permanent = FALSE;
	description = " Baltram sent me. " ;
};


func int DIA_Akil_Delivery_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Achilles_AfterCombat ) && ( MIS_ Baltram_ ScoutAchilles == LOG_Running ))
	{
		return TRUE;
	};
};

func void DIA_Akil_Delivery_Info()
{
	AI_Output(other,self, " DIA_Akil_Lieferung_15_00 " );	// Baltram sent me. I have to pick up a package for him.
	AI_Output(self,other, " DIA_Akil_Lieferung_13_01 " );	// So you're his new messenger? Okay, I've already prepared it.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Delivery_Geholt = TRUE ;
	B_LogEntry(TOPIC_Baltram, " I received the package. Now I can deliver it to Baltram... " );
	B_LogEntry_Quiet(TOPIC_Nagur, " I received the package. Now I can take it to Nagur... " );
};


instance DIA_Akil_Area (C_Info)
{
	npc = BAU_940_Akil;
	nr = 90;
	condition = DIA_Akil_Area_Condition;
	information = DIA_Akil_Area_Info;
	permanent = FALSE;
	description = " You know this place... " ;
};


func int DIA_Akil_Area_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Akil_Soeldner ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};


var int Knows_Taverne;

func void DIA_Akil_Area_Info()
{
	AI_Output(other,self, " DIA_Akil_Gegend_15_00 " );	// You know these places...
	AI_Output(self,other, " DIA_Akil_Gegend_13_01 " );	// Of course, what do you want to know?
};


instances DIA_Akil_Hof (C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Hof_Condition;
	information = DIA_Akil_Hof_Info;
	permanent = FALSE;
	description = " How can I find Onar's farm? " ;
};


func int DIA_Akil_Hof_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Akil_Gegend ))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hof_Info()
{
	AI_Output(other,self, " DIA_Akil_Gegend_Onar_15_00 " );	// How can I find Onar's farm?
	AI_Output(self,other, " DIA_Akil_Gegend_Onar_13_01 " );	// Go down the stone stairs over there, and then follow the road to the east.
	AI_Output(self,other, " DIA_Akil_Gegend_Onar_13_02 " );	// You'll come across a tavern along the way. From it, go further east until you reach a large field. That's where these mercenaries live.
	Knows_Taverne = TRUE ;
};


instance DIA_Akil_Taverns (C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Taverne_Condition;
	information = DIA_Akil_Taverne_Info;
	permanent = FALSE;
	description = " What is this tavern to the east of here? " ;
};


func int DIA_Akil_Taverne_Condition()
{
	if(Knows_Taverne == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Akil_Taverne_Info()
{
	AI_Output(other,self, " DIA_Akil_Gegend_Taverne_15_00 " );	// What's that tavern east of here?
	AI_Output(self,other, " DIA_Akil_Gegend_Taverne_13_01 " );	// Ask Randolph about it. He knows about her better than me. He has been there several times.
};


instance DIA_Achilles_Wald (C_Info) .
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Wald_Condition;
	information = DIA_Akil_Wald_Info;
	permanent = FALSE;
	description = " What's in the forest behind your farm? " ;
};


func int DIA_Akil_Wald_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Akil_Gegend ))
	{
		return TRUE;
	};
};

func void DIA_Akil_Wald_Info()
{
	AI_Output(other,self, " DIA_Akil_Gegend_Wald_15_00 " );	// And what is there, in the forest behind your farm?
	AI_Output(self,other, " DIA_Akil_Gegend_Wald_13_01 " );	// There are monsters roaming around. And wolves are still the most harmless of them.
	AI_Output(self,other, " DIA_Akil_Gegend_Wald_13_02 " );	// It is also said that bandits have made their lair there. Well, at least they don't touch my farm.
};


instance DIA_Akil_Perm(C_Info)
{
	npc = BAU_940_Akil;
	nr = 32;
	condition = DIA_Akil_Perm_Condition;
	information = DIA_Akil_Perm_Info;
	permanent = TRUE;
	description = " Anything interesting? " ;
};


func int DIA_Akil_Perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Akil_Soeldner ) && ( Capital >=  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Akil_Perm_Info()
{
	AI_Output(other,self, " DIA_Akil_Perm_15_00 " );	// Anything interesting?
	if (chapter ==  3 )
	{
		if(MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Akil_Perm_13_01 " );	// No. I hope now my sheep will no longer be wasted.
		}
		else
		{
			AI_Output(self,other, " DIA_Akil_Perm_13_02 " );	// My sheep go missing all the time. Soon we won't have anything to eat.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other, " DIA_Akil_Perm_13_03 " );	// Orcs are everywhere now. They even say that they have their headquarters here somewhere. Ask Farmer Lobart about it.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other, " DIA_Akil_Perm_13_04 " );	// Lizard people are said to have appeared in the area. If I were you, I wouldn't go into caves.
		};
		if((hero.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
		{
			AI_Output(self,other, " DIA_Akil_Perm_13_05 " );	// People in black robes are looking for you.
			AI_Output(other,self, " DIA_Akil_Perm_15_06 " );	// This is not news.
			AI_Output(self,other, " DIA_Akil_Perm_13_07 " );	// Well, okay. I just thought you should know this.
		};
		if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(self,other, " DIA_Akil_Perm_13_08 " );	// The area is just teeming with beasts! If I were you, I'd be more careful...
		};
	};
};


instance DIA_Akil_KAP3_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP3_EXIT_Condition;
	information = DIA_Akil_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Akil_SCHAFDIEB (C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEB_Condition;
	information = DIA_Akil_SCHAFDIEB_Info;
	description = " This is not news. " ;
};


func int DIA_Akil_SCHAFDIEB_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEB_Info()
{
	AI_Output(other,self, " DIA_Akil_SCHAFDIEB_15_00 " );	// Any more news?
	AI_Output(self,other, " DIA_Akil_SCHAFDIEB_13_01 " );	// Someone is constantly stealing my sheep. I can't sleep well at night now.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
	Info_AddChoice(DIA_Akil_SCHAFDIEB, " These are not my problems. " ,DIA_Akil_SCHAFDIEB_nein);
	Info_AddChoice(DIA_Akil_SCHAFDIEB, " How many sheep have you lost? " ,DIA_Akil_SCHAFDIEB_wieviel);
	Info_AddChoice(DIA_Akil_SCHAFDIEB, " Who can do this? " ,DIA_Akil_SCHAFDIEB_wer);
	MIS_Akil_SchafDiebe = LOG_Running;
	Log_CreateTopic(TOPIC_AkilSchafDiebe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe,LOG_Running);
	B_LogEntry(TOPIC_AkilSchafDiebe, " Akil's sheep continue to go missing. He suspects bandits living in a cave in the nearby forest are involved. " );
};

func void DIA_Akil_SCHAFDIEB_wer()
{
	AI_Output(other,self, " DIA_Akil_SCHAFDIEB_wer_15_00 " );	// Who can do this?
	AI_Output(self,other, " DIA_Akil_SCHAFDIEB_wer_13_01 " );	// I have my suspicions.
	AI_Output(self,other, " DIA_Akil_SCHAFDIEB_wer_13_02 " );	// Some dark personalities have settled in a cave in that forest over there.
	AI_Output(self,other, " DIA_Akil_SCHAFDIEB_wer_13_03 " );	// I find it hard to believe that they only eat berries. I'm pretty sure they're the ones responsible for the disappearance of my sheep.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_how much()
{
	AI_Output(other,self, " DIA_Akil_SCHAFDIEB_wieviel_15_00 " );	// How many sheep have you lost?
	AI_Output(self,other, " DIA_Akil_SCHAFDIEB_wieviel_13_01 " );	// At least three.
};

func void DIA_Akil_SCHAFDIEB_no()
{
	AI_Output(other,self, " DIA_Akil_SCHAFDIEB_nein_15_00 " );	// These are not my problems.
	AI_Output(self,other, " DIA_Akil_SCHAFDIEB_nein_13_01 " );	// I understand. You have other worries.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};


instance DIA_Akil_SCHAFDIEBEPLATT (C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information = DIA_Akil_SCHAFDIEBEPLATT_Info;
	description = " I found those who stole sheep from you. " ;
};


func int DIA_Akil_SCHAFDIEBEPLATT_Condition()
{
	if ((Kapitel >=  3 ) && (MIS_Akil_SchafDiebe == LOG_Running) && Npc_IsDead(BDT_1025_Bandit_H) && Npc_IsDead(BDT_1026_Bandit_H) && Npc_IsDead(BDT_1027_Bandit_H))
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info()
{
	AI_Output(other,self, " DIA_Akil_SCHAFDIEBEPLATT_15_00 " );	// I found those who stole sheep from you.
	AI_Output(other,self, " DIA_Akil_SCHAFDIEBEPLATT_15_01 " );	// You were right. They were bandits from a cave in the forest. But they won't steal anything from you.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Akil_SCHAFDIEBEPLATT_13_02 " );	// Thank you, oh noble servant of Innos.
	}
	else  if (hero.guild ==  GIL_MIL )
	{
		AI_Output(self,other, " DIA_Akil_SCHAFDIEBEPLATT_13_03 " );	// Thank you. Now I see that the militia sometimes helps us small farmers.
	}
	else  if (hero.guild ==  GIL_KDW )
	{
		AI_Output(self,other, " DIA_Akil_SCHAFDIEBEPLATT_13_03A " );	// Thank you, servant of Adanos.
	}
	else  if (hero.guild ==  GIL_KDM )
	{
		AI_Output(self,other, " DIA_Akil_SCHAFDIEBEPLATT_13_03B " );	// Although it sounds strange, I thank you, dark mage.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Akil_SCHAFDIEBEPLATT_13_0C " );	// Thank you. Although you sectarians are strange people, compassion for other people's troubles is not alien to you.
	}
	else
	{
		AI_Output(self,other, " DIA_Akil_SCHAFDIEBEPLATT_13_04 " );	// Thank you. You are a very strange mercenary. Not like the others.
	};
	AI_Output(self,other, " DIA_Akil_SCHAFDIEBEPLATT_13_05 " );	// Take this as a thank you for the selfless service you've done me.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_Akil_SchafDiebe = LOG_SUCCESS ;
	B_GivePlayerXP(XP_Akil_SchafDiebe);
};


instances DIA_Akil_AkilsSchaf (C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_AkilsSchaf_Condition;
	information = DIA_Akil_AkilsSchaf_Info;
	description = " (return the sheep to Akila) " ;
};


func int DIA_Akil_AkilsSchaf_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToNpc(self,Follow_Sheep_AKIL) < 1000) && (MIS_Akil_SchafDiebe != 0))
	{
		return TRUE;
	};
};

func void DIA_Akil_AkilsSchaf_Info()
{
	AI_Output(self,other, " DIA_Akil_AkilsSchaf_13_01 " );	// Very good. Here are some gold ones. I hope this is enough.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Follow_Sheep_AKIL.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Follow_Sheep_AKIL.wp = "NW_FARM2_OUT_02";
	Follow_Sheep_AKIL.start_aistate = ZS_MM_AllScheduler;
	B_GivePlayerXP(XP_AkilsSchaf);
};


instance DIA_Akil_KAP4_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP4_EXIT_Condition;
	information = DIA_Akil_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP5_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP5_EXIT_Condition;
	information = DIA_Akil_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP6_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP6_EXIT_Condition;
	information = DIA_Akil_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Akil_PICKPOCKET (C_Info)
{
	npc = BAU_940_Akil;
	nr = 900;
	condition = DIA_Akil_PICKPOCKET_Condition;
	information = DIA_Akil_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Akil_PICKPOCKET_Condition()
{
	return  C_Robbery ( 37 , 30 );
};

func void DIA_Akil_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
	Info_AddChoice(DIA_Akil_PICKPOCKET,Dialog_Back,DIA_Akil_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Akil_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Akil_PICKPOCKET_DoIt);
};

func void DIA_Akil_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

func void DIA_Akil_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

instance DIA_Akil_Werewolf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 3;
	condition = DIA_Akil_Werewolf_Condition;
	information = DIA_Akil_Werewolf_Info;
	permanent = FALSE;
	description = " Regarding the recent attack... " ;
};

func int DIA_Akil_Werewolf_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Mika_Werewolf) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Akil_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Akil_Werewolf_01_00 " );	// What can you tell us about the recent attack?
	AI_Output(self,other, " DIA_Akil_Werewolf_01_01 " );	// Eh... You're talking about this terrible case.
	AI_Output(self,other, " DIA_Akil_Werewolf_01_03 " );	// One of my peasants went to Orlan's tavern to wet his throat before going to sleep.
	AI_Output(self,other, " DIA_Akil_Werewolf_01_04 " );	// Just at that moment, I was about to go into the house, when suddenly I heard a desperate cry and the roar of a beast behind me.
	AI_Output(self,other, " DIA_Akil_Werewolf_01_05 " );	// I turned around to see what was the matter. But I couldn't really see anything. It was almost at night!
	AI_Output(self,other, " DIA_Akil_Werewolf_01_06 " );	// Then I rushed into the house with all my might to call for help from the others.
	AI_Output(self,other, " DIA_Akil_Werewolf_01_07 " );	// But when we returned, neither the beast nor the peasant was anywhere.
	AI_Output(self,other, " DIA_Akil_Werewolf_01_08 " );	// We only found a piece of torn tissue and a pool of blood... That's it.
	AI_Output(other,self, " DIA_Akil_Werewolf_01_09 " );	// Where did you find them?
	AI_Output(self,other, " DIA_Akil_Werewolf_01_10 " );	// Here, right under the bridge. But if I were you, I wouldn't go there. And just a little...
	B_LogEntry(TOPIC_WolfAndMan, " Akil said that one of the peasants was attacked by a huge beast. It happened not far from the tavern, under the bridge. " );
};
