

instance DIA_Raoul_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_EXIT_Condition;
	information = DIA_Raoul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Raoul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_NoSentenza(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_NoSentenza_Condition;
	information = DIA_Raoul_NoSentenza_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Raoul_NoSentenza_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Sentenza_Hello) && !Wld_IsTime(18,0,20,30)  && (other.guild == GIL_NONE) && (Npc_CanSeeNpc(self,hero) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_NoSentenza_Info()
{
	AI_Output(self,other, " DIA_Raoul_NoSentenza_01_00 " );	// Wait a minute, mate!
	AI_Output(self,other, " DIA_Raoul_NoSentenza_01_01 " );	// I didn't see Senteza searching you.

	if (Hlp_IsValidNpc(Sentence) &&  ! C_NpcIsDown(Sentence))
	{
		AI_Output(self,other, " DIA_Raoul_NoSentenza_01_02 " );	// Sentesa! Go here!
		AI_Output(self,other, " DIA_Raoul_NoSentenza_01_03 " );	// Wait a second... (politely) He'll be right there!
		AI_Output(self,other, " DIA_Raoul_NoSentenza_01_04 " );	// And then an unpleasant surprise awaits you.
		Info_ClearChoices(DIA_Raoul_NoSentenza);
		Info_AddChoice(DIA_Raoul_NoSentenza,Dialog_Ende,DIA_Raoul_NoSentenza_End);
	}
	else
	{
		AI_Output(self,other, " DIA_Raoul_NoSentenza_01_05 " );	// Where is he? Oh well, whatever, you're in luck...
	};
};

func void DIA_Raoul_NoSentenza_End()
{
	AI_StopProcessInfos(self);
	B_Attack(Sentenza,other,AR_NONE,0);
};

instance DIA_Raoul_Hello(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_Hello_Condition;
	information = DIA_Raoul_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Raoul_Hello_Condition()
{
	if((other.guild == GIL_NONE) && (MustTellResult_Raoul == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Hello_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Raoul_Hello_01_00 " );	// (bored) What do you want?
	}
	else
	{
		AI_Output(self,other, " DIA_Raoul_Hello_01_01 " );	// (irritated) What do you want this time?
	};
};


var int Raoul_said;

instance DIA_Raoul_PERMNone(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_PERMNone_Condition;
	information = DIA_Raoul_PERMNone_Info;
	permanent = TRUE;
	description = " I want to look around this farm! " ;
};


func int DIA_Raoul_PERMNone_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERMNone_Info()
{
	if (Raoul_said ==  FALSE )
	{
		AI_Output(other,self, " DIA_Raoul_PERMNone_15_00 " );	// I want to look around this farm!
		AI_Output(self,other, " DIA_Raoul_PERMNone_01_01 " );	// Don't enter the building on the left. Silvio is there. He's not in the best mood right now.
		AI_Output(self,other, " DIA_Raoul_PERMNone_01_02 " );	// If he sees a weakling who doesn't work on this farm, he might decide to take his anger out on him.
		Raoul_gesagt = TRUE ;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//Удачи!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Raoul_WannaJoin(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_WannaJoin_Condition;
	information = DIA_Raoul_WannaJoin_Info;
	permanent = FALSE;
	description = " I want to join Lee! " ;
};


func int DIA_Raoul_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Raoul_WannaJoin_15_00 " );	// I want to join Lee!
	AI_Output(self,other, " DIA_Raoul_WannaJoin_01_01 " );	// If Lee keeps going like this, he'll soon have no one to command!
	AI_Output(other,self, " DIA_Raoul_WannaJoin_15_02 " );	// What do you mean by that?
	AI_Output(self,other, " DIA_Raoul_WannaJoin_01_03 " );	// He wants us to sit here and twiddle our thumbs. Sometimes you have to give a thrashing to the farmers - and that's it.
	AI_Output(self,other, " DIA_Raoul_WannaJoin_01_04 " );	// Silvio always said that offense is the best defense, and damn it, he's right.
};


instance DIA_Raoul_AboutSylvio(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_AboutSylvio_Condition;
	information = DIA_Raoul_AboutSylvio_Info;
	permanent = FALSE;
	description = " Who is Silvio? " ;
};


func int DIA_Raoul_AboutSylvio_Condition()
{
	if((Raoul_gesagt == TRUE) || Npc_KnowsInfo(other,DIA_Raoul_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Raoul_AboutSylvio_Info()
{
	AI_Output(other,self, " DIA_Raoul_AboutSylvio_15_00 " );	// Who is Silvio?
	AI_Output(self,other, " DIA_Raoul_AboutSylvio_01_01 " );	// Our next leader, if you want my opinion. If you're going to beg him to let you join our ranks, forget it!
	AI_Output(self,other, " DIA_Raoul_AboutSylvio_01_02 " );	// By the looks of you, you're not even fit to herd sheep.
};


instance DIA_Raoul_Stimme(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Stimme_Condition;
	information = DIA_Raoul_Voice_Info;
	permanent = FALSE;
	description = " I'd like to be a mercenary. Do you mind? " ;
};


func int DIA_Raoul_Stimme_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_Stimme_Info()
{
	AI_Output(other,self, " DIA_Raoul_Stimme_15_00 " );	// I would like to become a mercenary. You do not mind, do you?
	AI_Output(self,other, " DIA_Raoul_Stimme_01_01 " );	// Ahh, do whatever you want...
	Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	B_LogEntry(TOPIC_SLDRespekt, " Raoul doesn't mind my joining the mercenaries. " );
};


instance DIA_Raoul_Duell(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Duell_Condition;
	information = DIA_Raoul_Duell_Info;
	permanent = TRUE;
	description = " I think you should punch you in the face... " ;
};


func int DIA_Raoul_Duell_Condition()
{
	if((Raoul_gesagt == TRUE) || Npc_KnowsInfo(other,DIA_Raoul_AboutSylvio) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Duell_Info()
{
	AI_Output(other,self, " DIA_Raoul_Duell_15_00 " );	// I think you should punch you in the face...
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//Что?
	AI_Output(other,self, " DIA_Raoul_Duell_15_02 " );	// This is exactly what you need now...
	AI_Output(self,other, " DIA_Raoul_Duell_01_03 " );	// I think I was too polite to you!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Raoul_PERM(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 900;
	condition = DIA_Raoul_PERM_Condition;
	information = DIA_Raoul_PERM_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Raoul_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info()
{
	AI_Output(other,self, " DIA_Raoul_PERM_15_00 " );	// Is everything okay?
	if(MIS_Raoul_KillTrollBlack == LOG_Running)
	{
		AI_Output(self,other, " DIA_Raoul_PERM_01_01 " );	// Don't talk in vain. Or bring the skin of a black troll.
	}
	else
	{
		AI_Output(self,other, " DIA_Raoul_PERM_01_02 " );	// Are you trying to suck up to me? Forget it!
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other, " DIA_Raoul_PERM_01_03 " );	// I haven't forgotten what you did to me.
		};
	};
};


instance DIA_Raoul_TROLL(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_TROLL_Condition;
	information = DIA_Raoul_TROLL_Info;
	important = TRUE;
};


func int DIA_Raoul_TROLL_Condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info()
{
	AI_Output(self,other, " DIA_Raoul_TROLL_01_00 " );	// (cynically) Just look at this!
	AI_Output(other,self, " DIA_Raoul_TROLL_15_01 " );	// What do you need?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Raoul_TROLL_01_02 " );	// Have you joined the city beggars? It looks like it.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Raoul_TROLL_01_03 " );	// Don't think I'll respect you just for being one of us.
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Raoul_TROLL_01_04 " );	// Playing great mage, huh?
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Raoul_TROLL_01_0A " );	// Another one of those crazy swamps! What do you think - you got stoned and already caught God by the balls ?!
	};
	AI_Output(self,other, " DIA_Raoul_TROLL_01_05 " );	// I'll tell you one thing: no matter what you wear, I can see right through you.
	AI_Output(self,other, " DIA_Raoul_TROLL_01_06 " );	// Seems to me like you're just a slippery little bum and nothing more.
	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL, " I must go. " ,DIA_Raoul_TROLL_weg);
	Info_AddChoice(DIA_Raoul_TROLL, " What's your problem? " ,DIA_Raoul_TROLL_rechnung);
};

func void DIA_Raoul_TROLL_weg()
{
	AI_Output(other,self, " DIA_Raoul_TROLL_weg_15_00 " );	// I have to go.
	AI_Output(self,other, " DIA_Raoul_TROLL_weg_01_01 " );	// Yes, get lost.
	AI_StopProcessInfos(self);
};

func void DIA_Raoul_TROLL_rechnung()
{
	AI_Output(other,self, " DIA_Raoul_TROLL_rechnung_15_00 " );	// What's your problem?
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_01_01 " );	// I see through people like you. Capable only of words, and when it comes to deeds - in the bushes.
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_01_02 " );	// I hate those who dress like nobles and boast about their heroic deeds everywhere.
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_01_03 " );	// As recently as yesterday, I stuffed one of these in the face. He claimed he could take down a black troll with one left hand.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//И что?
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_01_05 " );	// (sarcastically) What do you mean by 'and what'?
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_01_06 " );	// Have you ever seen a black troll in your life, talker? Do you have any idea how big these monsters are?
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_01_07 " );	// If you get too close to them, they'll tear you to pieces.
	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL, " I'm not interested. " ,DIA_Raoul_TROLL_rechnung_hastrecht);
	if (Npc_IsDead(troll_black_ext) || Npc_IsDead(Troll_Black))
	{
		Info_AddChoice(DIA_Raoul_TROLL, " I already killed the black troll. " ,DIA_Raoul_TROLL_rechnung_ich);
	}
	else
	{
		Info_AddChoice(DIA_Raoul_TROLL, " Black troll? Easily. " ,DIA_Raoul_TROLL_rechnung_noProb);
	};
};

func void B_Raoul_Blame()
{
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00 " );	// You're asking for it, right? I should have torn your head off by now. But I have a better idea.
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01 " );	// If you're such a great fighter, prove it.
	AI_Output(other,self, " DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02 " );	// What will happen to me?
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03 " );	// Stupid question. Honor, and your jaw will not be broken.
	AI_Output(other,self, " DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04 " );	// Not much.
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05 " );	// Mmm. Let's say I pay you a whole lot of money if you bring me the skin of a black troll. What do you think?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//Уже лучше.
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07 " );	// Then what are you waiting for?
	Log_CreateTopic(TOPIC_KillTrollBlack,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack,LOG_Running);
	B_LogEntry(TOPIC_KillTrollBlack, " Raoul wants me to bring him a black troll skin. " );
	MIS_Raoul_KillTrollBlack = LOG_Running;
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht()
{
	AI_Output(other,self, " DIA_Raoul_TROLL_rechnung_hastrecht_15_00 " );	// I'm not interested.
	AI_Output(self,other, " DIA_Raoul_TROLL_rechnung_hastrecht_01_01 " );	// Well, as you know.
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich()
{
	AI_Output(other,self, " DIA_Raoul_TROLL_rechnung_ich_15_00 " );	// I've already killed the black troll.
	B_Raoul_Blame();
};

func void DIA_Raoul_TROLL_rechnung_noProb()
{
	AI_Output(other,self, " DIA_Raoul_TROLL_rechnung_noProb_15_00 " );	// Black troll? No problem.
	B_Raoul_Blame();
};


instance DIA_Raoul_TrophyFur(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_TrophyFur_Condition;
	information = DIA_Raoul_TrophyFur_Info;
	permanent = TRUE;
	description = " First, tell me how to skin a black troll. " ;
};


func int DIA_Raoul_TrophyFur_Condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) && (MIS_Raoul_KillTrollBlack == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TrophyFur_Info()
{
	AI_Output(other,self, " DIA_Raoul_TrophyFur_15_00 " );	// First tell me how to skin a black troll.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other, " DIA_Raoul_TrophyFur_01_01 " );	// Then clear your ears. This advice is free.
		AI_Output(self,other, " DIA_Raoul_TrophyFur_01_02 " );	// You grab this beast and make an incision in each of its paws.
		AI_Output(self,other, " DIA_Raoul_TrophyFur_01_03 " );	// Then skin him over his head. Is it so difficult?
	};
};


instance DIA_Raoul_TROLLFELL(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_TROLLFELL_Condition;
	information = DIA_Raoul_TROLLFELL_Info;
	description = " I brought the skin of a black troll. " ;
};


func int DIA_Raoul_TROLLFELL_Condition()
{
	if(Npc_HasItems(other,ItAt_TrollBlackFur) && Npc_KnowsInfo(other,DIA_Raoul_TROLL))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLLFELL_Info()
{
	AI_Output(other,self, " DIA_Raoul_TROLLFELL_15_00 " );	// I brought the skin of a black troll.
	AI_Output(self,other, " DIA_Raoul_TROLLFELL_01_01 " );	// Incredible. Show me.
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	AI_Output(self,other, " DIA_Raoul_TROLLFELL_01_02 " );	// Incredible. What do you want for her?
	AI_Output(other,self, " DIA_Raoul_TROLLFELL_15_03 " );	// Give me everything you have.
	AI_Output(self,other, " DIA_Raoul_TROLLFELL_01_04 " );	// Good! I will give you five hundred gold coins and three powerful healing potions. What do you say?
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
	Info_AddChoice(DIA_Raoul_TROLLFELL, " This is not enough. " ,DIA_Raoul_TROLLFELL_nein);
	Info_AddChoice(DIA_Raoul_TROLLFELL,"Готово.",DIA_Raoul_TROLLFELL_ja);
	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//Продано.
	AI_Output(self,other, " DIA_Raoul_TROLLFELL_ja_01_01 " );	// Great deal.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItAt_TrollBlackFur,1);
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
};

func void DIA_Raoul_TROLLFELL_no()
{
	AI_Output(other,self, " DIA_Raoul_TROLLFELL_nein_15_00 " );	// This is not enough.
	AI_Output(self,other, " DIA_Raoul_TROLLFELL_nein_01_01 " );	// As you know. I'll take this skin anyway.
	AI_Output(self,other, " DIA_Raoul_TROLLFELL_nein_01_02 " );	// I won't forgive myself if I miss this opportunity.
	MIS_Raoul_DoesntPayTrollFur = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_FELLZURUECK(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_FELLZURUECK_Condition;
	information = DIA_Raoul_FELLZURUECK_Info;
	permanent = TRUE;
	description = " Give me back my black troll skin. " ;
};


func int DIA_Raoul_FELLZURUECK_Condition()
{
	if((MIS_Raoul_DoesntPayTrollFur == LOG_Running) && Npc_HasItems(self,ItAt_TrollBlackFur))
	{
		return TRUE;
	};
};

func void DIA_Raoul_FELLZURUECK_Info()
{
	AI_Output(other,self, " DIA_Raoul_FELLZURUECK_15_00 " );	// Give me back my black troll skin.
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//Нет.
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_GotTrollFurBack(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_GotTrollFurBack_Condition;
	information = DIA_Raoul_GotTrollFurBack_Info;
	description = " Don't ever try to fool me again, okay? " ;
};


func int DIA_Raoul_GotTrollFurBack_Condition()
{
	if((MIS_Raoul_DoesntPayTrollFur == LOG_Running) && (Npc_HasItems(self,ItAt_TrollBlackFur) == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Raoul_GotTrollFurBack_Info()
{
	AI_Output(other,self, " DIA_Raoul_GotTrollFurBack_15_00 " );	// Don't ever try to fool me again, okay?
	AI_Output(self,other, " DIA_Raoul_GotTrollFurBack_01_01 " );	// Good. You know the local laws. So take it easy.
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP3_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP3_EXIT_Condition;
	information = DIA_Raoul_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP4_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP4_EXIT_Condition;
	information = DIA_Raoul_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP5_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP5_EXIT_Condition;
	information = DIA_Raoul_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_Ship(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Ship_Condition;
	information = DIA_Raoul_Ship_Info;
	description = " Would you like an ocean cruise? " ;
};


func int DIA_Raoul_Ship_Condition()
{
	if ((Capital >=  5 ) && (MY_SCKnowsWayToIrdorath ==  TRUE ) && ( CAPITALORCATC  ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info()
{
	AI_Output(other,self, " DIA_Raoul_Ship_15_00 " );	// Would you mind taking an ocean cruise?
	AI_Output(self,other, " DIA_Raoul_Ship_01_01 " );	// What are you up to? Do you want to take over the paladin ship? (laughs)
	AI_Output(other,self, " DIA_Raoul_Ship_15_02 " );	// What if it does?
	AI_Output(self,other, " DIA_Raoul_Ship_01_03 " );	// (seriously) You've gone crazy. No thanks. This is not for me.
	AI_Output(self,other, " DIA_Raoul_Ship_01_04 " );	// I see no reason to leave Khorinis. I don't care where I make money, here or on the mainland.
	AI_Output(self,other, " DIA_Raoul_Ship_01_05 " );	// Find someone else.

	if (Npc_IsDead(Torlof) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Raoul_Ship_01_06 " );	// Ask Torlof! He walked the seas, as far as I know.
	};
};


instance DIA_Raoul_KAP6_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP6_EXIT_Condition;
	information = DIA_Raoul_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_PICKPOCKET(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 900;
	condition = DIA_Raoul_PICKPOCKET_Condition;
	information = DIA_Raoul_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Raoul_PICKPOCKET_Condition()
{
	return  C_Robbery ( 45 , 85 );
};

func void DIA_Raoul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
	Info_AddChoice(DIA_Raoul_PICKPOCKET,Dialog_Back,DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Raoul_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

// -------------------------------bones---------------- ---------------------------------

instance DIA_Sld_822_Raoul_Game(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Sld_822_Raoul_Game_condition;
	information = DIA_Sld_822_Raoul_Game_info;
	description = " You are said to be good at dice. " ;
};

func int DIA_Sld_822_Raoul_Game_condition()
{
	if(GameOtherPlayers == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Sld_822_Raoul_Game_info()
{
	AI_Output(other,self, " DIA_Sld_822_Raoul_Game_01_00 " );	// They say you're good at dice.
	AI_Output(self,other, " DIA_Sld_822_Raoul_Game_01_01 " );	// Not bad?! That's too weak to say! I'm the best player around.
	AI_Output(other,self, " DIA_Sld_822_Raoul_Game_01_02 " );	// Maybe then you'll show your skill.
	AI_Output(self,other, " DIA_Sld_822_Raoul_Game_01_03 " );	// Don't say later that I didn't warn you.
	RaoulPlayResult = 300;
	Menu_WriteInt("AST","SysTimer04",0);
};

instance DIA_Sld_822_Raoul_GamePlay(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 900;
	condition = DIA_Sld_822_Raoul_GamePlay_condition;
	information = DIA_Sld_822_Raoul_GamePlay_info;
	permanent = TRUE;
	description = " Let's play dice! " ;
};

func int DIA_Sld_822_Raoul_GamePlay_condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Sld_822_Raoul_Game ) ==  TRUE ) && ( Mount_Up ==  FALSE ) && ( FlyCarpetIsOn ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Sld_822_Raoul_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer04");

	if(CheckLastGame >= RaoulPlayResult)
	{
		CheckLastSum = CheckLastGame - RaoulPlayResult;
	};

	AI_Output(other,self, " DIA_Sld_822_Raoul_GamePlay_01_00 " );	// Let's play dice!

	if(RaoulPlayResult >= CheckLastGame)
	{
		if((RaoulPlayResult > 0) && (RaoulDayFlag == FALSE))
		{
			AI_Output(self,other, " DIA_Sld_822_Raoul_GamePlay_01_01 " );	// Hold on, man! Now your wallet will lose a lot of weight.
			PlayPocker(1,self);
		}
		else
		{
			if(RaoulDayFlag == FALSE)
			{
				AI_Output(self,other, " DIA_Sld_822_Raoul_GamePlay_01_02 " );	// Why would I sit down to play with you again?! Here are the boobies.
				RaoulDayPlay = Wld_GetDay();
				RaoulDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other, " DIA_Sld_822_Raoul_GamePlay_01_03 " );	// Back off! Better some other time.
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Sld_822_Raoul_GamePlay_01_04 " );	// Of course! Just give me back my gold first, which I won from you last time.
		AI_Output(self,other, " DIA_Sld_822_Raoul_GamePlay_01_05 " );	// Otherwise, you can fail.
		Info_ClearChoices(DIA_Sld_822_Raoul_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_Sld_822_Raoul_GamePlay,"Вот твои деньги.",DIA_Sld_822_Raoul_GamePlay_Here);
		};

		Info_AddChoice(DIA_Sld_822_Raoul_GamePlay, " I don't have that much money. " ,DIA_Sld_822_Raoul_GamePlay_No);
	};
};

func void DIA_Sld_822_Raoul_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	RaoulPlayResult = CheckLastGame;
	AI_Output(other,self, " DIA_Sld_822_Raoul_GamePlay_Here_01_01 " );	// Here's your money.
	AI_Output(self,other, " DIA_Sld_822_Raoul_GamePlay_Here_01_02 " );	// How honest! Who would have thought. Come on, let's play.
	PlayPocker(1,self);
};

func void DIA_Sld_822_Raoul_GamePlay_No()
{
	AI_Output(other,self, " DIA_Sld_822_Raoul_GamePlay_No_01_01 " );	// I don't have that much money.
	AI_Output(self,other, " DIA_Sld_822_Raoul_GamePlay_No_01_02 " );	// No gold - no game!
	Info_ClearChoices(DIA_Sld_822_Raoul_GamePlay);
};

instance DIA_Sld_822_Raoul_GameEnd(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Sld_822_Raoul_GameEnd_condition;
	information = DIA_Sld_822_Raoul_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Sld_822_Raoul_GameEnd_condition()
{
	if((MustTellResult_Raoul == TRUE) && ((RaoulLost == TRUE) || (RaoulWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Sld_822_Raoul_GameEnd_info()
{
	if(RaoulLost == TRUE)
	{
		AI_Output(self,other, " DIA_Sld_822_Raoul_GameEnd_00 " );	// Well, you're a rogue! I just got in touch with you.
		RaoulLost = FALSE;
	}
	else if(RaoulWon == TRUE)
	{
		AI_Output(self,other, " DIA_Sld_822_Raoul_GameEnd_01 " );	// Your gold is now my gold! Hehe...
		RaoulWon = FALSE;
	};

	MustTellResult_Raoul = FALSE;
};
