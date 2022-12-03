
instance DIA_Cord_EXIT(C_Info)
{
	npc = Sld_805_Cord;
	nr = 999;
	condition = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cord_MeetingIsRunning(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Addon_Cord_MeetingIsRunning_Condition;
	information = DIA_Addon_Cord_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Cord_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};

var int DIA_Addon_Cord_MeetingIsRunning_OneTime;

func void DIA_Addon_Cord_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Cord_MeetingIsRunning_14_00 " );	// Welcome to the Ring of Water, brother.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Cord_MeetingIsRunning_14_01 " );	// You should talk to Vatras...
	};

	AI_StopProcessInfos(self);
};


instance DIA_Cord_Hello (C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cord_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (RangerMeetingRunning != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
{
	AI_Output(self,other, " DIA_Cord_Hallo_14_00 " );	// If you're having trouble with wolves or field predators, talk to one of the younger mercenaries.
	AI_Output(self,other, " DIA_Cord_Hallo_14_01 " );	// And you can contact me when the paladins appear.
	if(SC_IsRanger == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Что?
		AI_Output(self,other, " DIA_Cord_Hallo_14_03 " );	// When you peasants address me, you always ask me to kill innocent animals.
		AI_Output(other,self, " DIA_Cord_Hallo_15_04 " );	// I'm not a peasant.
		AI_Output(self,other, " DIA_Cord_Hallo_14_05 " );	// Oh... And what do you want?
	};
};

var int Cord_Already asked;
var int CordAppFT;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = " I want to become a mercenary! " ;
};


func int DIA_Cord_WannaJoin_Condition()
{
	if((Cord_Approved == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void B_Cord_BeBetter()
{
	AI_Output(self,other, " DIA_Cord_WannaJoin_14_14 " );	// As long as you barely know how to handle a weapon, you don't belong here!
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Cord_WannaJoin_15_00 " );	// I want to become a mercenary!
	if (Cord_SchonmalGefraged ==  FALSE )
	{
		AI_Output(self,other, " DIA_Cord_WannaJoin_14_01 " );	// You look more like someone who was born to work in the field, boy.
		AI_Output(self,other, " DIA_Cord_WannaJoin_14_02 " );	// Are you good with weapons?
		Cord_SchonmalGefraged = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Cord_WannaJoin_14_03 " );	// Have you upgraded your skills?
	};
	AI_Output(self,other, " DIA_Cord_WannaJoin_14_04 " );	// So what about one-handed weapons?

	if(hero.HitChance[NPC_TALENT_1H] >= 30)
	{
		AI_Output(other,self, " DIA_Cord_WannaJoin_15_05 " );	// I'm not that bad at this.
	}
	else
	{
		AI_Output(other,self, " DIA_Cord_WannaJoin_15_06 " );	// Well... (thoughtfully)
	};
	AI_Output(self,other, " DIA_Cord_WannaJoin_14_07 " );	// What about two-handed weapons?

	if(hero.HitChance[NPC_TALENT_2H] >= 30)
	{
		AI_Output(other,self, " DIA_Cord_WannaJoin_15_08 " );	// I know how to handle it.
	}
	else
	{
		AI_Output(other,self, " DIA_Cord_WannaJoin_15_09 " );	// And soon I'll be even better!
	};
	if((hero.HitChance[NPC_TALENT_1H] >= 30) || (hero.HitChance[NPC_TALENT_2H] >= 30))
	{
		AI_Output(self,other, " DIA_Cord_WannaJoin_14_10 " );	// Well, at least you're not a green newbie. Good. I will vote for you.
		AI_Output(self,other, " DIA_Cord_WannaJoin_14_11 " );	// If there's anything else you need to know, you can ask me.
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt, " Kord's voice is in my pocket. " );
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry_Quiet(Topic_SoldierTeacher, " Kord can teach me how to use one-handed and two-handed weapons. It can also increase my stamina. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Cord_WannaJoin_14_12 " );	// In other words, you're a green newbie!
		AI_Output(self,other, " DIA_Cord_WannaJoin_14_13 " );	// We are mercenaries, we must be sure that we can fully rely on our comrades. Our lives depend on it.
		B_Cord_BeBetter();

		if(CordAppFT == FALSE)
		{
			Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
			B_LogEntry(TOPIC_CordProve, " Cord will vote for me when I get better at fighting. (Requirement: One-Handed or Two-Handed Weapon Skill 30 or more) " );
			CordAppFT = TRUE;
		};
	};
};

instance DIA_Addon_Cord_YouAreRanger(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_YouAreRanger_Condition;
	information = DIA_Addon_Cord_YouAreRanger_Info;
	description = " They say you belong to the Ring of Water? " ;
};

func int DIA_Addon_Cord_YouAreRanger_Condition()
{
	if ((RangerHelp_gildeSLD ==  TRUE ) && (Cord_SchonmalGefragt ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Info()
{
	AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_15_00 " );	// They say you belong to the Water Ring?
	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_14_01 " );	// What kind of rat couldn't keep its chatty mouth shut?

		if(SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_15_02 " );	// Lee told me.
		};
		if(SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_15_03 " );	// Lares said you'd help me if I told him he took me under his wing.
		};
	};

	AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_14_04 " );	// Looks like I'll have to mess with you now, right?
	AI_Output(self,other, " DIA_Addon_Cord_Add_14_01 " );	// Okay, what do you need?
	AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_14_06 " );	// And think carefully about what you tell me. Because if I don't like what I hear, I'll skin you.
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger, " I don't really need anything. I can handle it myself. " ,DIA_Addon_Cord_YouAreRanger_nix);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger, " I need your armor. " ,DIA_Addon_Cord_YouAreRanger_ruestung);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger, " I need your weapon! " ,DIA_Addon_Cord_YouAreRanger_waffe);

	if((Cord_Approved == FALSE) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && (Cord_RangerHelp_Fight == FALSE))
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger, " Teach me how to fight! " ,DIA_Addon_Cord_YouAreRanger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger, " You could help me become a mercenary. " ,DIA_Addon_Cord_YouAreRanger_SLDAufnahme);
	};
};


var int Cord_SC_Brazen;

func void B_DIA_Addon_Cord_YouAreRanger_WARN()
{
	AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_WARN_14_00 " );	// And woe to you if it becomes known to me that you are loosening your tongue. I'm warning you for the first and only time, okay?
};

func void B_DIA_Addon_Cord_YouAreRanger_FRESSE()
{
	AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_FRESSE_14_00 " );	// Enough! You've gone too far this time. I'll beat the hell out of you.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void DIA_Addon_Cord_YouAreRanger_ruestung()
{
	AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_ruestung_15_00 " );	// I need your armor.
	if (Cord_SC_Dreist ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_ruestung_14_01 " );	// Say that one more time and you'll have to pick your teeth off the ground.
		Cord_SC_Dreist = TRUE ;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe()
{
	AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_Add_15_00 " );	// I need your weapon!

	if (Cord_SC_Dreist ==  FALSE )
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//Неужели?...(угрожающе)
		AI_Output(self,other, " DIA_Addon_Cord_Add_14_02 " );	// Then try to pick it up!
		Cord_SC_Dreist = TRUE ;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg()
{
	AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_weg_15_00 " );	// Get out of here! I want to take your place on this farm.

	if (Cord_SC_Dreist ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_weg_14_01 " );	// Don't mess with me, baby, or I'll break all your bones.
		Cord_SC_Dreist = TRUE ;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};


var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Addon_Cord_YouAreRanger_kampf()
{
	AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_kampf_15_00 " );	// Teach me how to fight!
	AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_kampf_14_01 " );	// Good. What else?
	Cord_RangerHelp_Fight = TRUE;

	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Это все.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme()
{
	AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00 " );	// You could help me become a mercenary.
	AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01 " );	// Ha-ha-ha... (laughs) Everything is clear. Okay, I'll try. What else?
	Cord_RangerHelp_GetSLD = TRUE;

	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Это все.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Gold()
{
	AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_Gold_15_00 " );	// Pay me for my silence.
	if (Cord_SC_Dreist ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_Gold_14_01 " );	// Like this? You were unlucky. I'm not someone to be blackmailed, mate.
		Cord_SC_Dreist = TRUE ;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_nix()
{
	AI_Output(other,self, " DIA_Addon_Cord_YouAreRanger_nix_15_00 " );	// Actually, I don't need anything. I can manage myself.
	AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_nix_14_01 " );	// As you say.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

func void DIA_Addon_Cord_YouAreRanger_rang()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//Это все.
	AI_Output(self,other, " DIA_Addon_Cord_YouAreRanger_reicht_14_01 " );	// Well, it's not hard.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};


instance DIA_Addon_Cord_RangerHelp2GetSLD(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information = DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent = TRUE;
	description = " Help me become a mercenary. " ;
};

var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;

func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition()
{
	if((Cord_RangerHelp_GetSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void B_Cord_RangerHelpObsolete()
{
	AI_Output(other,self, " DIA_Addon_Cord_RangerHelpObsolete_15_00 " );	// I've already taken care of this.
	AI_Output(self,other, " DIA_Addon_Cord_RangerHelpObsolete_14_01 " );	// In that case, I can't help you.
	AI_Output(other,self, " DIA_Addon_Cord_RangerHelpObsolete_15_02 " );	// What do you mean?
	AI_Output(self,other, " DIA_Addon_Cord_RangerHelpObsolete_14_03 " );	// I mean, I can't help you.
	AI_Output(self,other, " DIA_Addon_Cord_RangerHelpObsolete_14_04 " );	// Or do you want me to personally convince every mercenary that you can join us?
	AI_Output(self,other, " DIA_Addon_Cord_RangerHelpObsolete_14_05 " );	// You'll have to do this yourself.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void B_Cord_ComeLaterWhenDone()
{
	AI_Output(self,other, " DIA_Addon_Cord_ComeLaterWhenDone_14_00 " );	// So go ahead. Do this and come back to me.
	AI_StopProcessInfos(self);
};

func void B_Cord_IDoItForYou()
{
	AI_Output(self,other, " DIA_Addon_Cord_IDoItForYou_14_00 " );	// Got it. Well, it's simple. Come back tomorrow and everything will be done.
	AI_Output(self,other, " DIA_Addon_Cord_IDoItForYou_14_01 " );	// But for that, you'll have to do something for me.
	AI_Output(other,self, " DIA_Addon_Cord_IDoItForYou_15_02 " );	// And what exactly?
	AI_Output(self,other, " DIA_Addon_Cord_IDoItForYou_14_03 " );	// Not far from here, in the hills to the southeast, there is a small bandit camp.
	AI_Output(self,other, " DIA_Addon_Cord_IDoItForYou_14_04 " );	// If you go southeast from here, you'll soon see their tower.
	AI_Output(self,other, " DIA_Addon_Cord_IDoItForYou_14_05 " );	// One of my men, Patrick, went there a few days ago to make a deal with those scumbags.
	AI_Output(self,other, " DIA_Addon_Cord_IDoItForYou_14_06 " );	// I told him it was a bad idea, but that idiot didn't listen to me.
	AI_Output(self,other, " DIA_Addon_Cord_IDoItForYou_14_07 " );	// I think they killed him. But not sure.
	AI_Output(self,other, " DIA_Addon_Cord_IDoItForYou_14_08 " );	// You must find out what happened to him.
	) ; _ _ _
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD, " Forget it. This is much more difficult than Torlof's task. " ,B_Cord_IDoItForYou_mist);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD, " Why do you think they won't kill me like they did Patrick? " ,B_Cord_IDoItForYou_Dexter);
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};

func void B_Cord_IDoItForYou_mist()
{
	AI_Output(other,self, " Dia_Addon_Cord_IDoItForYou_mist_15_00 " );	// Forget it. This is much more difficult than Torlof's task.
	AI_Output(self,other, " Dia_Addon_Cord_IDoItForYou_mist_14_01 " );	// No. Such a small and harmless person like you will not arouse their interest.
	AI_Output(self,other, " Dia_Addon_Cord_IDoItForYou_mist_14_02 " );	// But I can't go there. These guys grab their weapons at the mere sight of a mercenary.
};

func void B_Cord_IDoItForYou_Dexter()
{
	AI_Output(other,self, " Dia_Addon_Cord_IDoItForYou_Dexter_15_00 " );	// Why do you think they won't deal with me the same way as they did with Patrick?
	AI_Output(self,other, " Dia_Addon_Cord_IDoItForYou_Dexter_14_01 " );	// The thing is, I know the bandit leader's name. His name is Dexter. Just tell them you know this guy.
	AI_Output(self,other, " Dia_Addon_Cord_IDoItForYou_Dexter_14_02 " );	// This should make them less likely to wring your neck.
	AI_Output(self,other, " Dia_Addon_Cord_IDoItForYou_Dexter_14_03 " );	// Of course, this is all pretty dangerous.
	AI_Output(self,other, " Dia_Addon_Cord_IDoItForYou_Dexter_14_04 " );	// But you can do it.
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD, " The ringleader's name is Dexter. " );
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople, " Mercenary Kord is looking for his buddy Patrick. " );
	MIS_Addon_Cord_Look4Patrick = LOG_Running;
	Ranger_SCKnowsDexter = TRUE;
};

func void DIA_Addon_Cord_RangerHelp2GetSLD_Info()
{
	AI_Output(other,self, " DIA_Addon_Cord_RangerHelp2GetSLD_15_00 " );	// Help me become a mercenary.
	AI_Output(self,other, " DIA_Addon_Cord_RangerHelp2GetSLD_14_01 " );	// Need to think! Hmmm... (thoughtfully) If you want to achieve something here, you need to talk to Torlof.
	AI_Output(self,other, " DIA_Addon_Cord_RangerHelp2GetSLD_14_02 " );	// Have you already met him?

	if(Torlof_Go == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Еще нет.
		B_Cord_ComeLaterWhenDone();
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Cord_RangerHelp2GetSLD_15_04 " );	// Yes. He told me about the test and stuff...
		AI_Output(self,other, " DIA_Addon_Cord_RangerHelp2GetSLD_14_05 " );	// Yeah. And what was your assignment?

		if((Torlof_ProbeBestanden == TRUE) || ((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick)) || ((MIS_Torlof_HolPachtVonSekob == LOG_Running) && ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))))
		{
			B_Cord_RangerHelpObsolete();
		}
		else if(Torlof_Probe == 0)
		{
			AI_Output(other,self, " DIA_Addon_Cord_RangerHelp2GetSLD_15_06 " );	// I haven't received the task yet.
			B_Cord_ComeLaterWhenDone();
		}
		else if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(other,self, " DIA_Addon_Cord_RangerHelp2GetSLD_15_07 " );	// I have to collect rent from the Sekob farm.
			B_Cord_IDoItForYou();
		}
		else if(Torlof_Probe == Probe_Bengar)
		{
			AI_Output(other,self, " DIA_Addon_Cord_RangerHelp2GetSLD_15_08 " );	// I have to rid Bengar of the militia soldiers.
			B_Cord_IDoItForYou();
		}
		else
		{
			B_Cord_RangerHelpObsolete();
		};
	};
};


instance DIA_Addon_Cord_TalkedToDexter(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Addon_Cord_TalkedToDexter_Condition;
	information = DIA_Addon_Cord_TalkedToDexter_Info;
	description = " I met Dexter. " ;
};


func int DIA_Addon_Cord_TalkedToDexter_Condition()
{
	if(((BDT_1060_Dexter.aivar[AIV_TalkedToPlayer] == TRUE) || Npc_IsDead(BDT_1060_Dexter)) && (MIS_Addon_Cord_Look4Patrick == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_TalkedToDexter_Info()
{
	AI_Output(other,self, " DIA_Addon_Cord_TalkedToDexter_15_00 " );	// I met with Dexter.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//И?
	if(Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Он мертв.
	};
	AI_Output(other,self, " DIA_Addon_Cord_TalkedToDexter_15_03 " );	// I found no trace of your friend Patrick.
	if(Dexter_KnowsPatrick == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Cord_TalkedToDexter_15_04 " );	// Dexter remembered him, but said that he had last seen him a long time ago.
		AI_Output(self,other, " DIA_Addon_Cord_TalkedToDexter_14_05 " );	// Are you sure Dexter wasn't lying?
		AI_Output(other,self, " DIA_Addon_Cord_TalkedToDexter_15_06 " );	// Not sure. But that's all I can tell you.
	};
	AI_Output(self,other, " DIA_Addon_Cord_TalkedToDexter_14_07 " );	// I don't understand... Patrick couldn't just disappear like that.
	AI_Output(self,other, " DIA_Addon_Cord_TalkedToDexter_14_08 " );	// Well, you fulfilled the terms of the deal...
	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP(XP_Addon_Cord_Look4Patrick);
	AI_Output(other,self, " DIA_Addon_Cord_TalkedToDexter_15_09 " );	// What about Torlof's mission?
	AI_Output(self,other, " DIA_Addon_Cord_TalkedToDexter_14_10 " );	// Don't worry, I've taken care of everything. Your mission is complete and you have passed the test. You can talk to Torlof.
	Cord_RangerHelp_TorlofsProbe = TRUE;
	if(Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if(Torlof_Probe == Probe_Bengar)
	{
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
};

instance DIA_Cord_ReturnPatrick(C_Info)
{
	npc = Sld_805_Cord;
	nr = 8;
	condition = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent = FALSE;
	description = " Patrick is back. " ;
};


func int DIA_Cord_ReturnPatrick_Condition()
{
	if((Npc_GetDistToWP(STRF_1123_Addon_Patrick_NW,"NW_BIGFARM_PATRICK") <= 10000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cord_ReturnPatrick_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Addon_Cord_ReturnPatrick_15_00 " );	// Patrick is back.
	AI_Output(self,other, " DIA_Addon_Cord_ReturnPatrick_14_01 " );	// Great! I've almost lost hope. You...
	AI_Output(other,self, " DIA_Addon_Cord_ReturnPatrick_15_02 " );	// I have one request.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Да?
	AI_Output(other,self, " DIA_Addon_Cord_ReturnPatrick_15_04 " );	// Let's do without thanks.
	AI_Output(self,other, " DIA_Addon_Cord_ReturnPatrick_14_05 " );	// But I didn't mean to thank you.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Что?..
	AI_Output(self,other, " DIA_Addon_Cord_ReturnPatrick_14_07 " );	// (chuckles) I was going to tell you that you are a cheeky and slippery fellow.
	AI_Output(self,other, " DIA_Addon_Cord_ReturnPatrick_14_09 " );	// Keep up the good work!
	AI_StopProcessInfos(self);
};

instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = " Well, what are the advantages of one-handed and two-handed weapons? " ;
};


func int DIA_Cord_ExplainWeapons_Condition()
{
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other,self, " DIA_Cord_ExplainWeapons_15_00 " );	// Well, what are the advantages of one-handed and two-handed weapons?
	AI_Output(self,other, " DIA_Cord_ExplainWeapons_14_01 " );	// Good question. I see that you have thought about this question.
	AI_Output(self,other, " DIA_Cord_ExplainWeapons_14_02 " );	// One-handed weapons are faster, but deal less damage to enemies.
	AI_Output(self,other, " DIA_Cord_ExplainWeapons_14_03 " );	// Two-handed weapons do more damage, but won't swing as fast as one-handed ones.
	AI_Output(self,other, " DIA_Cord_ExplainWeapons_14_04 " );	// Also, to wield a two-handed sword, you'll need more strength. This means more training is needed.
	AI_Output(self,other, " DIA_Cord_ExplainWeapons_14_05 " );	// It takes a lot of effort to become a true professional.
};

var int Cord_Brand_1h;
var int Cord_Brand_2h;

instance DIA_Cord_Teach(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = DIA_Cord_Teach_Condition;
	information = DIA_Cord_Teach_Info;
	permanent = TRUE;
	description = " Teach me how to fight! " ;
};

func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Waste of Time()
{
	AI_Output(self,other, " DIA_Cord_Teach_14_03 " );	// I don't want to waste my time on newbies.
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other,self, " DIA_Cord_Teach_15_00 " );	// Teach me how to fight!

	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		AI_Output(self,other, " DIA_Cord_Teach_14_01 " );	// I can teach you how to use any weapon - where do we start?
		Cord_Merke_1h = hero.HitChance[NPC_TALENT_1H];
		Cord_Merke_2h = hero.HitChance[NPC_TALENT_2H];
		Info_ClearChoices(DIA_Cord_Teach);
		Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

		if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
		{
			Info_AddChoice(DIA_Cord_Teach, " Stamina Regeneration (Training Points: 5, Cost: 10000 Coins) " ,DIA_Cord_Teach_RegenStam);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Cord_Teach_14_06 " );	// I only train mercenaries and worthy candidates!
		B_Cord_Waste of Time();
		B_Cord_BeBetter();
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other, " DIA_Cord_Teach_BACK_14_00 " );	// You've gotten a lot better - keep it up!
	};

	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_RegenStam()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_03 " );	// Teach me faster stamina recovery.

	cost = 5 ;
	money = 10000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Tutorial: Accelerated Stamina Regeneration " );
		VATRAS_TEACHREGENSTAM = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);

	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach, " Stamina Regeneration (Training Points: 5, Cost: 10000 Coins) " ,DIA_Cord_Teach_RegenStam);
	};
};

func void DIA_Cord_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

		if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
		{
			Info_AddChoice(DIA_Cord_Teach, " Stamina Regeneration (Training Points: 5, Cost: 10000 Coins) " ,DIA_Cord_Teach_RegenStam);
		};
};

func void DIA_Cord_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach, " Stamina Regeneration (Training Points: 5, Cost: 10000 Coins) " ,DIA_Cord_Teach_RegenStam);
	};
};

func void DIA_Cord_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach, " Stamina Regeneration (Training Points: 5, Cost: 10000 Coins) " ,DIA_Cord_Teach_RegenStam);
	};
};

func void dia_cord_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach, " Stamina Regeneration (Training Points: 5, Cost: 10000 Coins) " ,DIA_Cord_Teach_RegenStam);
	};
};

func void dia_cord_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach, " Stamina Regeneration (Training Points: 5, Cost: 10000 Coins) " ,DIA_Cord_Teach_RegenStam);
	};
};

instance DIA_Cord_PICKPOCKET(C_Info)
{
	npc = Sld_805_Cord;
	nr = 900;
	condition = DIA_Cord_PICKPOCKET_Condition;
	information = DIA_Cord_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Cord_PICKPOCKET_Condition()
{
	return  C_Robbery ( 65 , 75 );
};

func void DIA_Cord_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
	Info_AddChoice(DIA_Cord_PICKPOCKET,Dialog_Back,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cord_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};


// ------------------------------------------------ ----Loa------------------------------------

instance DIA_Loa_EXIT(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 999;
	condition = DIA_Loa_EXIT_Condition;
	information = DIA_Loa_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Loa_EXIT_Condition()
{
	if((LoaOnParty == FALSE) || (LoaOverParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_EXIT_Info()
{
	if((LoaBonus_01 == TRUE) && (LoaBonus_02 == TRUE) && (LoaBonus_03 == TRUE) && (MIS_LoaRomance != LOG_Success))
	{
		MIS_LoaRomance = LOG_Success;
		Log_SetTopicStatus(TOPIC_LoaRomance,LOG_Success);

		if((KAPITELORCATC == FALSE) && (LoaLover == FALSE) && (LoaAntiBonus == FALSE))
		{
			LoaLover = TRUE;
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Loa_Hello (C_Info)
{
	npc = SLD_10920_Loa;
	nr = 1;
	condition = DIA_Loa_Hello_Condition;
	information = DIA_Loa_Hello_Info;
	permanent = FALSE;
	description = " Your face looks familiar to me. " ;
};

func int DIA_Loa_Hello_Condition()
{
	return TRUE;
};

func void DIA_Loa_Hello_Info()
{
	AI_Output(other,self, " DIA_Loa_Hello_01_01 " );	// Your face looks familiar to me.
	AI_Output(self,other, " DIA_Loa_Hello_01_02 " );	// Hmmm... (appreciatively) Yes, I seem to remember you too.
	AI_Output(self,other, " DIA_Loa_Hello_01_03 " );	// Oh, yes, now I remember.
	Info_ClearChoices(DIA_Loa_Hello);
	Info_AddChoice(DIA_Loa_Hello, " Um... can you remind me? " ,DIA_Loa_Hello_Later);
};

func void DIA_Loa_Hello_Later()
{
	PlayVideo("RET2_LoaMeet.bik");
	AI_Output(self,other, " DIA_Loa_Hello_Later_01_01 " );	// Well, how? Do you remember?
	AI_Output(other,self, " DIA_Loa_Hello_Later_01_02 " );	// Still! Yeah, great you hit me then.
	AI_Output(other,self, " DIA_Loa_Hello_Later_01_03 " );	// Looks like I was passed out for a long time. And when I woke up, you were no longer there.
	AI_Output(self,other, " DIA_Loa_Hello_Later_01_04 " );	// Sorry. But then I didn't know if you could be trusted.
	AI_Output(other,self, " DIA_Loa_Hello_Later_01_05 " );	// Do you know now?
	AI_Output(self,other, " DIA_Loa_Hello_Later_01_06 " );	// Now I don't know either! But, perhaps, that this time I will regret your face.
	AI_Output(other,self, " DIA_Loa_Hello_Later_01_07 " );	// I really hope so.
};

instance DIA_Loa_MineTale (C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_MineTale_Condition;
	information = DIA_Loa_MineTale_Info;
	permanent = FALSE;
	description = " Have you been to Mining Valley too? " ;
};

func int DIA_Loa_MineTale_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_Hello))
	{
		return TRUE;
	};
};

func void DIA_Loa_MineTale_Info()
{
	AI_Output(other,self, " DIA_Loa_MineTale_01_01 " );	// Have you been to the Valley of Mines too?
	AI_Output(self,other, " DIA_Loa_MineTale_01_02 " );	// Yes... (sadly) Unfortunately, I had to go there too.
	AI_Output(self,other, " DIA_Loa_MineTale_01_03 " );	// But now everything is in the past! So don't be reminded of it.
};

instance DIA_Loa_WhatNew(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 1;
	condition = DIA_Loa_WhatNew_Condition;
	information = DIA_Loa_WhatNew_Info;
	permanent = TRUE;
	description = " What's new? " ;
};

func int DIA_Loa_WhatNew_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Loa_Hello ) && ( LoveBonus ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Loa_WhatNew_Info()
{
	AI_Output(other,self, " DIA_Loa_WhatNew_01_01 " );	// What's new?
	AI_Output(self,other, " DIA_Loa_WhatNew_01_02 " );	// Instead of torturing me with stupid questions, do something useful instead.
	AI_Output(other,self, " DIA_Loa_WhatNew_01_03 " );	// Okay, sorry.
};

// ---------------romance--------------------------------

instance DIA_Loa_Romantic(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Romantic_Condition;
	information = DIA_Loa_Romantic_Info;
	permanent = FALSE;
	description = " I really enjoyed your dance! " ;
};

func int DIA_Loa_Romantic_Condition()
{
	if((ConcertLoaBonus == TRUE) && (Npc_KnowsInfo(other,DIA_Loa_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_Romantic_Info()
{
	AI_Output(other,self, " DIA_Loa_Romantic_01_01 " );	// I really liked your dance!
	AI_Output(self,other, " DIA_Loa_Romantic_01_02 " );	// Don't suck up! If you are thinking of dragging me into bed, then you are trying in vain. I'm not one of those!
	AI_Output(self,other, " DIA_Loa_Romantic_01_03 " );	// So you'd better go straight to the brothel.
	AI_Output(other,self, " DIA_Loa_Romantic_01_04 " );	// What are you! I just wanted to express my admiration for your talents.
	AI_Output(self,other, " DIA_Loa_Romantic_01_05 " );	// At first everyone says that, and then they pester with all sorts of nonsense. I think you are no exception!
	AI_Output(self,other, " DIA_Loa_Romantic_01_06 " );	// But I warn you, if you climb, you'll get smacked in the face! Just like that time, on the pier. Or forgot?
	AI_Output(other,self, " DIA_Loa_Romantic_01_07 " );	// This is unlikely to be forgotten.
};

instance DIA_Loa_HowGetYou(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_HowGetYou_Condition;
	information = DIA_Loa_HowGetYou_Info;
	permanent = FALSE;
	description = " I think you're too hard on men. " ;
};

func int DIA_Loa_HowGetYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_Romantic))
	{
		return TRUE;
	};
};

func void DIA_Loa_HowGetYou_Info()
{
	AI_Output(other,self, " DIA_Loa_HowGetYou_01_01 " );	// I think you're too hard on men.
	AI_Output(self,other, " DIA_Loa_HowGetYou_01_02 " );	// How about you? What are you, that these uncouth chumps around me - do not even know how you can impress a decent girl.
	AI_Output(self,other, " DIA_Loa_HowGetYou_01_03 " );	// Whoever you take - everyone has only one thing on their minds and nothing more.
	AI_Output(other,self, " DIA_Loa_HowGetYou_01_04 " );	// Maybe then you can share the secret of how to make a good impression on you?
	AI_Output(self,other, " DIA_Loa_HowGetYou_01_05 " );	// O Innos! Yes, whatever! The main thing is that the girl likes it, and that after that she feels special! Understand?
	AI_Output(other,self, " DIA_Loa_HowGetYou_01_06 " );	// Not much yet. And more specifically?
	AI_Output(self,other, " DIA_Loa_HowGetYou_01_07 " );	// Well... perhaps write poetry for her, give her some beautiful jewelry, or just give her flowers.
	AI_Output(self,other, " DIA_Loa_HowGetYou_01_08 " );	// Not the weeds that grow behind Thecla's barn. They must be truly amazing!
	MIS_LoaRomance = LOG_Running;
	Log_CreateTopic(TOPIC_LoaRomance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LoaRomance,LOG_Running);
	B_LogEntry(TOPIC_LoaRomance, " If I want to woo Loa, I must impress her in a gallant way. " );
	Info_ClearChoices(DIA_Loa_Hello);
	Info_AddChoice(DIA_Loa_HowGetYou, " What kind of flowers do you like? " ,DIA_Loa_Hello_Flower);
	Info_AddChoice(DIA_Loa_HowGetYou, " Do you have such a special decoration in mind? " ,DIA_Loa_Hello_Pearl);
	Info_AddChoice(DIA_Loa_HowGetYou, " I doubt there will be poets among the mercenaries. " ,DIA_Loa_Hello_Stihi);
};

func void DIA_Loa_Hello_Flower()
{
	AI_Output(other,self, " DIA_Loa_Hello_Flower_01_01 " );	// What kind of flowers do you like?
	AI_Output(self,other, " DIA_Loa_Hello_Flower_01_02 " );	// Hard to say. All flowers are beautiful in their own way.
	AI_Output(other,self, " DIA_Loa_Hello_Flower_01_03 " );	// Maybe there are some special ones?
	AI_Output(self,other, " DIA_Loa_Hello_Flower_01_04 " );	// Hmmm... Maybe it's... blue mallows, among others.
	AI_Output(self,other, " DIA_Loa_Hello_Flower_01_05 " );	// They grew up near our house in Silden and always reminded me of the happiest years of my life.
	AI_Output(other,self, " DIA_Loa_Hello_Flower_01_06 " );	// Do you want me to bring you a bouquet of these flowers?
	AI_Output(self,other, " DIA_Loa_Hello_Flower_01_07 " );	// That would be very nice of you. But I'm afraid you won't see them in this part of the archipelago.
	AI_Output(self,other, " DIA_Loa_Hello_Flower_01_08 " );	// Father said that they grow only on the mainland, and even then not everywhere.
	AI_Output(other,self, " DIA_Loa_Hello_Flower_01_09 " );	// Well, I'll think of something.
	AI_Output(self,other, " DIA_Loa_Hello_Flower_01_10 " );	// Okay, I'll be waiting.
	LoaCase_01 = TRUE;
	B_LogEntry(TOPIC_LoaRomance, " Loa will be happy if I bring her a bouquet of blue mallows. " );
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Мне пора.",DIA_Loa_Hello_Buy);		
	};
};

func void DIA_Loa_Hello_Pearl()
{
	AI_Output(other,self, " DIA_Loa_Hello_Pearl_01_01 " );	// Do you have such a special decoration in mind?
	AI_Output(self,other, " DIA_Loa_Hello_Pearl_01_02 " );	// I don't know about others, but I always wanted to have a black pearl necklace!
	AI_Output(self,other, " DIA_Loa_Hello_Pearl_01_03 " );	// The depth of its color is sometimes so mesmerizing that it is simply impossible to take your eyes off it.
	AI_Output(self,other, " DIA_Loa_Hello_Pearl_01_04 " );	// Eh... I once had one such pearl. I kept it for many years and always carried it with me as a talisman that brings good luck.
	AI_Output(self,other, " DIA_Loa_Hello_Pearl_01_05 " );	// But, unfortunately, the king's guards took it from me when they sent it to the Valley of Mines.
	AI_Output(other,self, " DIA_Loa_Hello_Pearl_01_06 " );	// What's stopping you from finding someone else?
	AI_Output(self,other, " DIA_Loa_Hello_Pearl_01_07 " );	// It's not that easy! Black pearls are very rare, and finding one such pearl is already considered a huge success.
	AI_Output(self,other, " DIA_Loa_Hello_Pearl_01_08 " );	// And to get them for a whole necklace...
	LoaCase_02 = TRUE;
	B_LogEntry(TOPIC_LoaRomance, " Loa has always wanted a black pearl necklace. I think I should try to find one if I want to win her attention. " );
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Мне пора.",DIA_Loa_Hello_Buy);	
	};
};

func void DIA_Loa_Hello_Stihi()
{
	AI_Output(other,self, " DIA_Loa_Hello_Stihi_01_01 " );	// I doubt there will be poets among the mercenaries.
	AI_Output(self,other, " DIA_Loa_Hello_Stihi_01_02 " );	// You're right here! To do this, you need to be quite refined in nature and have a sharp mind.
	AI_Output(self,other, " DIA_Loa_Hello_Stihi_01_03 " );	// And these mediocrity can’t even connect a couple of words, especially after they sort it out with schnapps.
	AI_Output(self,other, " DIA_Loa_Hello_Stihi_01_04 " );	// Although what else to take from the former convicts.
	LoaCase_03 = TRUE;
	B_LogEntry(TOPIC_LoaRomance, " Loa loves beautiful poetry. I should look for something like this if I want to impress her. " );
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Мне пора.",DIA_Loa_Hello_Buy);	
	};
};

func void DIA_Loa_Hello_Buy()
{
	AI_Output(other,self,"DIA_Loa_Hello_Buy_01_01");	//Мне пора.
	AI_Output(self,other, " DIA_Loa_Hello_Buy_01_02 " );	// See you later.
	AI_StopProcessInfos(self);
};

instance DIA_Loa_Give_Flower(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Flower_Condition;
	information = DIA_Loa_Give_Flower_Info;
	permanent = FALSE;
	description = " Look what I brought you. " ;
};

func int DIA_Loa_Give_Flower_Condition()
{
	if (( MIS_LoaRomance == LOG_Running ) && ( LoaCase_01 ==  TRUE ) && ( LoaCase_01_Done ==  FALSE ) && ( Npc_HasItems ( other , ItPl_ExBlueMalve ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Flower_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Loa_Give_Flower_01_01 " );	// Look what I brought you.
	B_GiveInvItems(other,self,ItPl_ExBlueMalve,1);
	Npc_RemoveInvItems(self,ItPl_ExBlueMalve,1);
	AI_Output(self,other, " DIA_Loa_Give_Flower_01_02 " );	// Incredible! Where did you manage to find them?
	AI_Output(other,self, " DIA_Loa_Give_Flower_01_03 " );	// Long story. I hope they make you happy in some way.
	AI_Output(self,other, " DIA_Loa_Give_Flower_01_04 " );	// Wrong word! You just can't imagine how happy I am to see these flowers again and feel their fragrance.
	AI_Output(self,other, " DIA_Loa_Give_Flower_01_05 " );	// Although, to be honest, I didn't expect that from you.
	AI_Output(self,other, " DIA_Loa_Give_Flower_01_06 " );	// Here - I want you to take this gold. There is nothing to spend here anyway.
	LoaCase_01_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance, " I brought a blue mallow to Loa. She was absolutely delighted! " );
	Info_ClearChoices(DIA_Loa_Give_Flower);
	Info_AddChoice(DIA_Loa_Give_Flower,"Не стоит!",DIA_Loa_Give_Flower_No);
	Info_AddChoice(DIA_Loa_Give_Flower, " Thank you! " ,DIA_Loa_Give_Flower_Yes);
};

func void DIA_Loa_Give_Flower_No()
{
	AI_Output(other,self, " DIA_Loa_Give_Flower_No_01_01 " );	// Don't! Simple words are enough.
	LoaBonus_01 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Flower);
};

func void DIA_Loa_Give_Flower_Yes()
{
	AI_Output(other,self, " DIA_Loa_Give_Flower_Yes_01_01 " );	// Thank you! Extra gold never hurts.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	LoaBonus_01 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Flower);
};

instance DIA_Loa_Give_Pearl(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Pearl_Condition;
	information = DIA_Loa_Give_Pearl_Info;
	permanent = FALSE;
	description = " Here, try on this necklace. " ;
};

func int DIA_Loa_Give_Pearl_Condition()
{
	if((MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE) && (Npc_HasItems(other,ItMi_BlackPearlNeckle) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Pearl_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Loa_Give_Pearl_01_01 " );	// Here, try on this necklace.
	B_GiveInvItems(other,self,ItMi_BlackPearlNeckle,1);
	Npc_RemoveInvItems(self,ItMi_BlackPearlNeckle,1);
	AI_Output(self,other, " DIA_Loa_Give_Pearl_01_02 " );	// But... but how did you manage to collect so many pearls?
	AI_Output(other,self, " DIA_Loa_Give_Pearl_01_03 " );	// I confess it wasn't easy. I had to run around Khorinis and not only.
	AI_Output(self,other, " DIA_Loa_Give_Pearl_01_04 " );	// And the pearls themselves... are they really all real?
	AI_Output(other,self, " DIA_Loa_Give_Pearl_01_05 " );	// Of course! Take a look for yourself. See how they play in the light.
	AI_Output(self,other, " DIA_Loa_Give_Pearl_01_06 " );	// Incredible! You really surprised me. I never thought that you would take my words seriously.
	AI_Output(other,self, " DIA_Loa_Give_Pearl_01_07 " );	// As you can see, that's exactly what I did.
	AI_Output(self,other, " DIA_Loa_Give_Pearl_01_08 " );	// Well, well... Then accept my sincere gratitude for this gift! He is truly wonderful.
	AI_Output(self,other, " DIA_Loa_Give_Pearl_01_09 " );	// And here is the ring. At one time I got it from my father, but now it's yours.
	LoaCase_02_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance, " I brought a black pearl necklace to Loa. She liked it very much. " );
	Info_ClearChoices(DIA_Loa_Give_Pearl);
	Info_AddChoice(DIA_Loa_Give_Pearl, " I can't accept it! " ,DIA_Loa_Give_Pearl_No);
	Info_AddChoice(DIA_Loa_Give_Pearl, " This is very handy. " ,DIA_Loa_Give_Pearl_Yes);
};

func void DIA_Loa_Give_Pearl_No()
{
	AI_Output(other,self, " DIA_Loa_Give_Pearl_No_01_01 " );	// I can't accept it! I am sure that you yourself will be sorry to part with him.
	AI_Output(self,other, " DIA_Loa_Give_Pearl_No_01_02 " );	// You're right... (sighing) It's as dear to me as a memory! But I just have nothing else to thank you.
	AI_Output(other,self, " DIA_Loa_Give_Pearl_No_01_03 " );	// This is not required. So you'd better keep it to yourself.
	AI_Output(self,other, " DIA_Loa_Give_Pearl_No_01_04 " );	// Well, okay. As you wish.
	LoaBonus_02 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Pearl);
};

func void DIA_Loa_Give_Pearl_Yes()
{
	AI_Output(other,self, " DIA_Loa_Give_Pearl_Yes_01_01 " );	// This is very handy. Thank you
	B_GiveInvItems(self,other,ItRi_Loa,1);
	AI_Output(self,other,"DIA_Loa_Give_Pearl_Yes_01_02");	//Не за что.
	LoaBonus_02 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Pearl);
};

instance DIA_Loa_Give_Stihi(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Stihi_Condition;
	information = DIA_Loa_Give_Stihi_Info;
	permanent = FALSE;
	description = " I'm talking about poetry. " ;
};

func int DIA_Loa_Give_Stihi_Condition()
{
	if ((MY_LoaRomance == LOG_Running) && (LoaCase_03 ==  TRUE ) && (LoaCase_03_Done ==  FALSE ) && (Npc_HasItems(other, MYRTANAS_LYRICS ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Stihi_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Loa_Give_Stihi_01_01 " );	// I'm talking about poetry.
	AI_Output(self,other, " DIA_Loa_Give_Stihi_01_02 " );	// What, he decided to surprise me with his poetic knowledge?
	AI_Output(other,self, " DIA_Loa_Give_Stihi_01_03 " );	// No, just thought you might be interested in looking at this.
	B_GiveInvItems(other,self,MYRTANAS_LYRIK,1);
	Npc_RemoveInvItems(self,MYRTANAS_LYRIK,1);
	AI_Output(self,other, " DIA_Loa_Give_Stihi_01_04 " );	// (reading) Quite an interesting book! Not so beautifully written, but it's much better than listening to the unbearable nonsense of drunken mercenaries.
	AI_Output(other,self, " DIA_Loa_Give_Stihi_01_05 " );	// You can keep it for yourself.
	AI_Output(self,other, " DIA_Loa_Give_Stihi_01_06 " );	// True? Then maybe I'll take your offer.
	AI_Output(self,other, " DIA_Loa_Give_Stihi_01_07 " );	// She will certainly brighten up my boring evenings on this farm. Thank you!
	LoaCase_03_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance, " I brought Loa a book of poetry. She seems to like it. " );
	Info_ClearChoices(DIA_Loa_Give_Stihi);
	Info_AddChoice(DIA_Loa_Give_Stihi, " Enjoy! " ,DIA_Loa_Give_Stihi_No);
	Info_AddChoice(DIA_Loa_Give_Stihi, " I thought I was due some kind of reward. " ,DIA_Loa_Give_Stihi_Yes);
};

func void DIA_Loa_Give_Stihi_No()
{
	AI_Output(other,self, " DIA_Loa_Give_Stihi_No_01_01 " );	// Enjoy!
	AI_Output(self,other,"DIA_Loa_Give_Stihi_No_01_02");	//Спасибо.
	LoaBonus_03 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Stihi);
};

func void DIA_Loa_Give_Stihi_Yes()
{
	AI_Output(other,self, " DIA_Loa_Give_Stihi_Yes_01_01 " );	// And I thought I was due some kind of reward.
	B_GiveInvItems(self,other,ItFo_Wine_Loa,1);
	AI_Output(self,other, " DIA_Loa_Give_Stihi_Yes_01_02 " );	// Of course! Here, take this bottle of wine.
	AI_Output(self,other, " DIA_Loa_Give_Stihi_Yes_01_03 " );	// I'm sure that you will quickly find a common language with her.
	AI_Output(other,self, " DIA_Loa_Give_Stihi_Yes_01_04 " );	// You can be sure.
	LoaBonus_03 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Stihi);
};

instance DIA_Loa_Give_Lover(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Lover_Condition;
	information = DIA_Loa_Give_Lover_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_Give_Lover_Condition()
{
	if((LoaLover == TRUE) && (LoaLoverDay == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Lover_Info()
{
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_01");	//Постой! 
	AI_Output(other,self, " DIA_Loa_Give_Lover_01_02 " );	// Yes, I'm listening.
	AI_Output(self,other, " DIA_Loa_Give_Lover_01_03 " );	// You know, you've done so much for me, and I still haven't thanked you with anything.
	AI_Output(other,self, " DIA_Loa_Give_Lover_01_04 " );	// This is not required at all.
	AI_Output(self,other, " DIA_Loa_Give_Lover_01_05 " );	// And yet... You know, come tomorrow at midnight to the lighthouse, which is not far from the city.
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_06");	//Зачем?
	AI_Output(self,other, " DIA_Loa_Give_Lover_01_07 " );	// Let's say I want to show you something. Just don't worry! You will surely like it.
	AI_Output(other,self, " DIA_Loa_Give_Lover_01_08 " );	// Okay, I'll think about your suggestion.
	AI_Output(self,other, " DIA_Loa_Give_Lover_01_09 " );	// Okay, just think faster.
	LoaLoverDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instances of DIA_Loa_ComeLH (C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_ComeLH_Condition;
	information = DIA_Loa_ComeLH_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_ComeLH_Condition()
{
	if((MIS_LoaRomance == LOG_Success) && (LoaInLH == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_ComeLH_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Loa_ComeLH_01_01 " );	// I came as you asked.
	AI_Output(self,other, " DIA_Loa_ComeLH_01_02 " );	// I see! And you weren't even late... (smiling)
	AI_Output(other,self, " DIA_Loa_ComeLH_01_03 " );	// When a girl like you asks for it, I always try to be punctual.
	AI_Output(self,other, " DIA_Loa_ComeLH_01_04 " );	// No doubt. Although I had some doubts about this.
	AI_Output(other,self, " DIA_Loa_ComeLH_01_05 " );	// Will I come or not?
	AI_Output(self,other, " DIA_Loa_ComeLH_01_06 " );	// Yes. But then you'd be missing out on a lot.
	AI_Output(other,self, " DIA_Loa_ComeLH_01_07 " );	// Hmmm... For example?
	AI_Output(self,other, " DIA_Loa_ComeLH_01_08 " );	// For example... an opportunity to admire the local beauties that open from the height of this lighthouse.
	AI_Output(self,other, " DIA_Loa_ComeLH_01_09 " );	// By the way, how do you like the view from here?
	LoaTellInLH = TRUE;
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH, " This is impressive! " ,DIA_Loa_ComeLH_S_03);
	Info_AddChoice(DIA_Loa_ComeLH, " I'm sure there are better views here. " ,DIA_Loa_ComeLH_S_02);
	Info_AddChoice(DIA_Loa_ComeLH, " Maybe we should get right down to business? " ,DIA_Loa_ComeLH_S_01);
};

func void DIA_Loa_ComeLH_S_03()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_S_03_01 " );	// This makes an impression!
	AI_Output(self,other, " DIA_Loa_ComeLH_S_03_02 " );	// You're right... (sighing) It's very beautiful here! I often come here. I look at the stars, at the sea ...
	AI_Output(self,other, " DIA_Loa_ComeLH_S_03_03 " );	// They have something that fills your inner world with something special.
	AI_Output(self,other, " DIA_Loa_ComeLH_S_03_04 " );	// And at the same time soothes, helping to forget about past hardships.
	AI_Output(self,other, " DIA_Loa_ComeLH_S_03_05 " );	// What are you thinking about?
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH, " About the same as you. " ,DIA_Loa_ComeLH_M_01);
	Info_AddChoice(DIA_Loa_ComeLH,"Ни о чем.",DIA_Loa_ComeLH_M_02);
	Info_AddChoice(DIA_Loa_ComeLH, " Sorry, I don't have time for this. " ,DIA_Loa_ComeLH_M_03);
};

func void DIA_Loa_ComeLH_S_02()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_S_02_01 " );	// I'm sure there are better views here.
	AI_Output(self,other, " DIA_Loa_ComeLH_S_02_02 " );	// What are you talking about?
	AI_Output(other,self, " DIA_Loa_ComeLH_S_02_03 " );	// About you! Your view of me makes a much more pleasant impression than all these local beauties.
	AI_Output(self,other, " DIA_Loa_ComeLH_S_02_04 " );	// Is that a compliment?
	AI_Output(other,self, " DIA_Loa_ComeLH_S_02_05 " );	// Why not? After all, everyone has their own idea of ​​beauty!
	AI_Output(self,other, " DIA_Loa_ComeLH_S_02_06 " );	// And you rightly believe that after that I will, of course, throw myself on your neck.
	AI_Output(other,self, " DIA_Loa_ComeLH_S_02_07 " );	// This is a good idea.
	AI_Output(self,other, " DIA_Loa_ComeLH_S_02_08 " );	// O Innos! You, like all men, always think of only one thing.
	AI_Output(self,other, " DIA_Loa_ComeLH_S_02_09 " );	// I wonder if you ever have other thoughts in your head?
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH, " Usually there are many more. " ,DIA_Loa_ComeLH_H_03);
	Info_AddChoice(DIA_Loa_ComeLH, " Of course. " ,DIA_Loa_ComeLH_H_02);
	Info_AddChoice(DIA_Loa_ComeLH, " I have only one thought right now. " ,DIA_Loa_ComeLH_H_01);
};

func void DIA_Loa_ComeLH_S_01()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_S_01_01 " );	// Maybe we'd better get straight to the point?
	AI_Output(self,other, " DIA_Loa_ComeLH_S_01_02 " );	// What are you talking about?!
	AI_Output(other,self, " DIA_Loa_ComeLH_S_01_03 " );	// I'm sure you didn't call me here to see the view from the lighthouse.
	AI_Output(other,self, " DIA_Loa_ComeLH_S_01_04 " );	// So come on already, get undressed.
	AI_Output(self,other, " DIA_Loa_ComeLH_S_01_05 " );	// (indignantly) What?!
	AI_Output(other,self, " DIA_Loa_ComeLH_S_01_06 " );	// What did you hear! Or am I not expressing myself clearly?
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_Loa_ComeLH_S_01_07 " );	// Just try to touch me with your finger, you bastard!
	AI_Output(self,other, " DIA_Loa_ComeLH_S_01_08 " );	// I thought you weren't such a complete bastard as the others.
	AI_Output(self,other, " DIA_Loa_ComeLH_S_01_09 " );	// But, apparently, I was mistaken!
	AI_Output(self,other, " DIA_Loa_ComeLH_S_01_10 " );	// So get out of here while your face is still intact!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LoaPissOff[1] = TRUE;
};

func void DIA_Loa_ComeLH_M_01()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_M_01_01 " );	// About the same as you.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_02");	//Правда?
	AI_Output(other,self, " DIA_Loa_ComeLH_M_01_03 " );	// You know, sometimes you get so tired of everything that you just want to be in silence and watch the sunset.
	AI_Output(other,self, " DIA_Loa_ComeLH_M_01_04 " );	// At such moments you understand that life consists not only of constant battles and struggle for survival.
	AI_Output(other,self, " DIA_Loa_ComeLH_M_01_05 " );	// It also has a lot to instill confidence in you and allow you to see much more than meets the eye.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_01_06 " );	// I would never have thought that I was capable of such thoughts!
	AI_Output(other,self, " DIA_Loa_ComeLH_M_01_07 " );	// Why is this?
	AI_Output(self,other, " DIA_Loa_ComeLH_M_01_08 " );	// Because you look more like...
	AI_Output(other,self, " DIA_Loa_ComeLH_M_01_09 " );	// ...an uncouth chump. I know.
	AI_Output(other,self, " DIA_Loa_ComeLH_M_01_10 " );	// But sometimes it's nice to realize that someone still saw something more in you.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_01_11 " );	// As I understand you...
	AI_Output(self,other, " DIA_Loa_ComeLH_M_01_12 " );	// You know, I've rarely met people like you.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_01_13 " );	// Most of them were only interested in one thing about me. And at the same time they did not care at all what I myself feel.
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH, " I'm not one of them. " ,DIA_Loa_ComeLH_F_02);
	Info_AddChoice(DIA_Loa_ComeLH, " I understand them. " ,DIA_Loa_ComeLH_F_01);
};

func void DIA_Loa_ComeLH_M_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_01");	//Ни о чем.
	AI_Output(other,self, " DIA_Loa_ComeLH_M_02_03 " );	// When I see you next to me, I can't think of anything else.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_02_04 " );	// What are you talking about?
	AI_Output(other,self, " DIA_Loa_ComeLH_M_02_05 " );	// That it's time to end this whole performance.
	AI_Output(other,self, " DIA_Loa_ComeLH_M_02_06 " );	// I'm sure you didn't call me here to see the view from the lighthouse.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_02_07 " );	// Ah, yes... of course! What else could I expect from you in a situation like this?
	AI_Output(self,other, " DIA_Loa_ComeLH_M_02_08 " );	// But I'm afraid I have nothing to offer you.
	AI_Output(other,self, " DIA_Loa_ComeLH_M_02_09 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_Loa_ComeLH_M_02_10 " );	// You can be sure. So you better go to the brothel!
	AI_Output(self,other, " DIA_Loa_ComeLH_M_02_11 " );	// The views are not much worse there than here.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_02_12 " );	// And it's time for me to go back. Goodbye!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_M_03()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_M_03_01 " );	// Sorry, but I don't have time for this.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_03_02 " );	// What are you talking about?!
	AI_Output(other,self, " DIA_Loa_ComeLH_M_03_03 " );	// I'm sure you didn't call me here to see the view from the lighthouse.
	AI_Output(other,self, " DIA_Loa_ComeLH_M_03_04 " );	// So let's finally get down to business.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_03_05 " );	// I won't do any 'business' with you!
	AI_Output(self,other, " DIA_Loa_ComeLH_M_03_06 " );	// And if you try to even touch me with your finger, you will hit your impudent mug.
	AI_Output(self,other, " DIA_Loa_ComeLH_M_03_07 " );	// Everyone! The conversation is over!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LoaPissOff[1] = TRUE;
};

func void DIA_Loa_ComeLH_H_03()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_01 " );	// Usually, there are a lot more of them.
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_02 " );	// But to be honest...
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_03");	//Что?
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_04 " );	// I just really like you!
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_05 " );	// True, this does not mean that I'm counting on something. After all, most likely, you will send me far away!
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_06 " );	// But I'd rather say it now than regret it for the rest of my life.
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_07 " );	// Of course, sometimes I myself like to be in silence and meditate, looking at the sunset of the departing sun.
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_08 " );	// At such moments you understand that life consists not only of constant battles and struggle for survival.
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_09 " );	// It also has a lot that gives you confidence and allows you to see much more than meets the eye.
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_10 " );	// But this time, my head is exclusively occupied with thoughts of you.
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_11 " );	// So sorry if I didn't live up to your expectations. But the truth is better than sweet lies.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_03_12 " );	// Hmmm... (staring) Sounds like a declaration of love.
	AI_Output(other,self, " DIA_Loa_ComeLH_H_03_13 " );	// Something like that.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_03_14 " );	// You know, I really like you too.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_03_15 " );	// But I don't think that's a reason to take things to the extreme.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_03_16 " );	// So maybe we'd better end this conversation. Perhaps someday we will have the opportunity to return to it.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_03_17 " );	// But not now...
	AI_Output(self,other, " DIA_Loa_ComeLH_H_03_18 " );	// It's getting light... I have to go back. Good luck!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_H_02()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_H_02_01 " );	// Of course.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_02_02 " );	// True, they always come down to one. I guess?
	AI_Output(other,self,"DIA_Loa_ComeLH_H_02_03");	//Почти.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_02_04 " );	// This is not surprising... Just look at yourself!
	AI_Output(self,other, " DIA_Loa_ComeLH_H_02_05 " );	// So tense that now you will jump out of your pants.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_02_06 " );	// You know what, I like you. But I don't think that's a reason to take things to the extreme.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_02_07 " );	// So you better calm down and go. I think someday we will have the opportunity to return to this conversation.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_02_08 " );	// And it's time for me to go back... Farewell!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_H_01()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_H_01_01 " );	// Now I have only one thought.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_01_02 " );	// You don't even have to say which one!
	AI_Output(self,other, " DIA_Loa_ComeLH_H_01_03 " );	// But it is unlikely that she is destined to come true. At least today!
	AI_Output(self,other, " DIA_Loa_ComeLH_H_01_04 " );	// So you'd better go where you came from.
	AI_Output(self,other, " DIA_Loa_ComeLH_H_01_05 " );	// Yes, and it's time for me to return... Goodbye!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_F_01()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_01 " );	// I understand them.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_01_02 " );	// What do you mean by that?
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_03 " );	// I really like you too.
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_04 " );	// True, this does not mean that I'm counting on something. After all, most likely, you will send me far away!
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_05 " );	// But I'd rather say it now than regret it for the rest of my life.
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_06 " );	// Of course, sometimes I myself like to be in silence and meditate, looking at the sunset of the departing sun.
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_07 " );	// At such moments you understand that life consists not only of constant battles and struggle for survival.
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_08 " );	// It also has a lot that gives you confidence and allows you to see much more than meets the eye.
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_09 " );	// But this time, my head is exclusively occupied with thoughts of you.
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_10 " );	// So sorry if I didn't live up to your expectations. But the truth is better than sweet lies.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_01_11 " );	// Hmmm... (staring) Sounds like a declaration of love.
	AI_Output(other,self, " DIA_Loa_ComeLH_F_01_12 " );	// Looks like this is it.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_01_13 " );	// You know, I really like you too.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_01_14 " );	// But I don't think that's a reason to take things to the extreme.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_01_15 " );	// So maybe we'd better end this conversation. I think someday we will have the opportunity to return to it.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_01_16 " );	// But not now... Moreover, it's already getting light.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_01_17 " );	// And it's time for me to go back! Goodbye.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	CanSayLoaStay = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PreLoveScene");
};

func void DIA_Loa_ComeLH_F_02()
{
	AI_Output(other,self, " DIA_Loa_ComeLH_F_02_01 " );	// I'm not one of them.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_02_02 " );	// I already figured it out.
	AI_Output(self,other, " DIA_Loa_ComeLH_F_02_03 " );	// Okay, it's getting light. It's time to return! Good luck.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Loa_PissOff(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PissOff_Condition;
	information = DIA_Loa_PissOff_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PissOff_Condition()
{
	if((LoaPissOff[1] == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PissOff_Info()
{
	B_Say(self,other,"$HandsOff");
	AI_StopProcessInfos(self);
};

instance DIA_Loa_LoveScene(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_LoveScene_Condition;
	information = DIA_Loa_LoveScene_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_LoveScene_Condition()
{
	if((CanSayLoaStay == TRUE) && (LoaLoveScene == TRUE) && (LoaLoveSceneNoBonus == FALSE) && (LoaLoveSceneFailed == FALSE) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_LOA_LOVE_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Loa_LoveScene_Info()
{
	AI_Output(self,other, " DIA_Loa_LoveScene_Do_01_01 " );	// Now I have to go...
	AI_Output(self,other, " DIA_Loa_LoveScene_Do_01_02 " );	// I will never forget what you did for me and what we had.
	Info_ClearChoices(DIA_Loa_LoveScene);
	Info_AddChoice(DIA_Loa_LoveScene, " И я... " ,DIA_Loa_LoveScene_Done);
};

func void DIA_Loa_LoveScene_Done()
{
	AI_Output(other,self, " DIA_Loa_LoveScene_Done_01_01 " );	// And I... won't forget.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");

	if(LoveBonus == FALSE)
	{
		Snd_Play("LevelUp");
		hero.lp = hero.lp + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_LoveBonus);
		LoveBonus = TRUE;
		LoveBonusDay = Wld_GetDay();

	};
};

// ------------------------------------------------ -Loa epic quest-----------------------------------------------------

instance DIA_Loa_EpicQuest(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Condition;
	information = DIA_Loa_EpicQuest_Info;
	permanent = FALSE;
	description = " Are you okay? " ;
};

func int DIA_Loa_EpicQuest_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((LoveBonus == TRUE) && (LoveBonusDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Loa_EpicQuest_01_01 " );	// Are you okay?
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_02 " );	// Yes. Why are you asking?
	AI_Output(other,self, " DIA_Loa_EpicQuest_01_03 " );	// I... I'm just worried about you.
	AI_Output(other,self, " DIA_Loa_EpicQuest_01_04 " );	// You know, after that meeting at the lighthouse, I feel some responsibility for your fate.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_05 " );	// That's good to hear. But nothing threatens me now, if that's what you mean.
	AI_Output(other,self, " DIA_Loa_EpicQuest_01_06 " );	// I hope. By the way, how did you get to the mercenaries?
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_07 " );	// It's a long story.
	AI_Output(other,self, " DIA_Loa_EpicQuest_01_08 " );	// You could tell me. And I know so little about you.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_09 " );	// I don't like to remember it too much. But you ... so be it, I'll tell you.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_10 " );	// In general, when I was thrown onto the shore of Khorinis, in the Valley of Mines, I was seriously injured.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_11 " );	// The crossbow bolt fired by the king's bailiff pierced almost through my right side.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_12 " );	// I bled a lot and thought this was the end.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_13 " );	// But luckily for me, a small troop of mercenaries was passing nearby.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_14 " );	// I guess they just robbed another caravan of Gomez's men and were heading back to the New Camp.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_15 " );	// They picked me up and took me to their place. Actually, I lived there, until the barrier collapsed.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_16 " );	// And then, Lee and most of his guys came here and started working for Onar. Well, I'm with them.
	AI_Output(self,other, " DIA_Loa_EpicQuest_01_17 " );	// (smiling) Here is such a story.
	LoaEpicStory = TRUE;
};

instance DIA_Loa_EpicQuest_Next(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Next_Condition;
	information = DIA_Loa_EpicQuest_Next_Info;
	permanent = FALSE;
	description = " I hope none of them offended you there? " ;
};

func int DIA_Loa_EpicQuest_Next_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_EpicQuest) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Next_Info()
{
	AI_Output(other,self, " DIA_Loa_EpicQuest_Next_01_01 " );	// I hope none of them offended you there?
	AI_Output(self,other, " DIA_Loa_EpicQuest_Next_01_02 " );	// No, nothing like that.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Next_01_03 " );	// In addition, Kord and Torlof immediately warned - that anyone who even lays a finger on me will deal with them.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Next_01_04 " );	// You understand, after such words, there were no people who really wanted to touch me.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Next_01_05 " );	// Yes, I myself, if anything, I can stand up for myself. And you know this very well.
	AI_Output(other,self, " DIA_Loa_EpicQuest_Next_01_06 " );	// Forget it here! You remind me of this every time.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Next_01_07 " );	// Don't be angry... I'm not out of malice.
};

instance DIA_Loa_EpicQuest_Judge(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Judge_Condition;
	information = DIA_Loa_EpicQuest_Judge_Info;
	permanent = FALSE;
	description = " So you ran away from the royal bailiffs? " ;
};

func int DIA_Loa_EpicQuest_Judge_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Loa_EpicQuest) == TRUE) && (LoaEpicStory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Judge_Info()
{
	AI_Output(other,self, " DIA_Loa_EpicQuest_Judge_01_01 " );	// So you ran away from the royal bailiffs?
	AI_Output(self,other, " DIA_Loa_EpicQuest_Judge_01_02 " );	// From them and from the judge who read the verdict to me.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Judge_01_03 " );	// I knew this was my last chance at salvation. So I used it without hesitation.
	AI_Output(other,self, " DIA_Loa_EpicQuest_Judge_01_04 " );	// And what was your fault? Have you stolen something or maybe killed someone?
	AI_Output(self,other, " DIA_Loa_EpicQuest_Judge_01_05 " );	// Neither. Although I would love to get even with one type.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Judge_01_06 " );	// But unfortunately, he eluded me, and I ended up in the hands of royal justice.
	AI_Output(other,self, " DIA_Loa_EpicQuest_Judge_01_07 " );	// And what was that type?
	AI_Output(self,other, " DIA_Loa_EpicQuest_Judge_01_08 " );	// I think you're asking too many questions. What do you have to do with this?
	AI_Output(other,self, " DIA_Loa_EpicQuest_Judge_01_09 " );	// Perhaps I could help you with this.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Judge_01_10 " );	// Help? In what? Look, this happened so long ago and I don't want to go back to it.
	AI_Output(other,self, " DIA_Loa_EpicQuest_Judge_01_11 " );	// Okay, whatever you say.
	MIS_LoaSecret = LOG_Running;
	Log_CreateTopic(TOPIC_LoaSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LoaSecret,LOG_Running);
	B_LogEntry(TOPIC_LoaSecret, " It seems that by accident I stepped on Loa's sore spot, bringing up this topic with her escape from the royal bailiffs. Apparently, she does not really want to remember this. But judging by her face, something is constantly eating her "It's just that she won't talk to me about it. I think I should come up with something special so that she herself would have a desire to tell me everything. " );
};

instance DIA_Loa_EpicQuest_Party(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Party_Condition;
	information = DIA_Loa_EpicQuest_Party_Info;
	permanent = FALSE;
	description = " Why don't we have something like a picnic? " ;
};

func int DIA_Loa_EpicQuest_Party_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (RhetorikSkillValue[1] >= 70))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Party_Info()
{
	AI_Output(other,self, " DIA_Loa_EpicQuest_Party_01_01 " );	// Why don't we have something like a picnic?
	AI_Output(other,self, " DIA_Loa_EpicQuest_Party_01_02 " );	// Beautiful nature, delicious food, excellent wine - what do you say?
	AI_Output(self,other, " DIA_Loa_EpicQuest_Party_01_03 " );	// Hmmm... Sounds tempting! Will there be surprises?
	AI_Output(other,self, " DIA_Loa_EpicQuest_Party_01_04 " );	// Of course!
	AI_Output(self,other, " DIA_Loa_EpicQuest_Party_01_05 " );	// (playfully) Then, I'm all for it.
	AI_Output(other,self, " DIA_Loa_EpicQuest_Party_01_06 " );	// Well, if so, then I'll probably do it.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Party_01_07 " );	// I'll be waiting!
	MakeLoaParty = TRUE;
	B_LogEntry(TOPIC_LoaSecret, " I suggested to Loa that we organize some kind of picnic and she agreed. Now we need to find a suitable place for our rest, some delicious food and a couple of bottles of expensive wine. Perhaps relaxing a little, she will be more open in conversation. " );
	AI_StopProcessInfos(self);
};

instance DIA_Loa_EpicQuest_Party_Go(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Party_Go_Condition;
	information = DIA_Loa_EpicQuest_Party_Go_Info;
	permanent = FALSE;
	description = " Everything is ready! " ;
};

func int DIA_Loa_EpicQuest_Party_Go_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE) && (LoaPartyWine == TRUE) && (LoaPartyFood == TRUE) && (Npc_HasItems(other,ItMi_LoaWine) >= 2) && (Npc_HasItems(other,ItMi_LoaPartyFood) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Party_Go_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Loa_EpicQuest_Party_Go_01_01 " );	// Everything is ready! Delicious food, exquisite wine... It remains only to find a suitable place.
	AI_Output(self,other, " DIA_Loa_EpicQuest_Party_Go_01_02 " );	// I think I know this. It is just in the forest, behind this farm. Follow me!
	LoaGoParty = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	; _ _ _ _
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guide");
};

instance DIA_Loa_PartyInPlace(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyInPlace_Condition;
	information = DIA_Loa_PartyInPlace_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PartyInPlace_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_01_56") <= 500) && (LoaGoParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyInPlace_Info()
{
	AI_Output(self,other, " DIA_Loa_PartyInPlace_01_01 " );	// Here we are. And how are you here?
	AI_Output(other,self, " DIA_Loa_PartyInPlace_01_02 " );	// Pretty nice.
	AI_Output(self,other, " DIA_Loa_PartyInPlace_01_03 " );	// I knew you'd like it. Then we'll stop here.
	AI_Output(self,other, " DIA_Loa_PartyInPlace_01_04 " );	// Well... (smiling) What about the fine wine you were talking about?
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	B_LogEntry(TOPIC_LoaSecret, " We've reached the place Loa found. I think we can relax a little now... " );
	Info_ClearChoices(DIA_Loa_PartyInPlace);
	Info_AddChoice(DIA_Loa_PartyInPlace, " Now everything will be... " ,DIA_Loa_PartyInPlace_Done);
};

func void DIA_Loa_PartyInPlace_Done()
{
	Wld_SendTrigger("EVT_LOAPARTY_CAM");
	AI_SetWalkMode(self,NPC_WALK);
	AI_SetWalkMode(other,NPC_WALK);
	AI_GotoWP(self,"NW_DARKFOREST_IN_LOA_PARTY");
	AI_GotoWP(other,"NW_DARKFOREST_IN_HERO_PARTY");
	B_TurnToNpc(self,other);
	B_TurnToNpc(other,self);
	AI_PlayAni(self,"T_STAND_2_SIT");
	AI_PlayAni(other,"T_STAND_2_SIT");
	Npc_RemoveInvItems(other,ItMi_LoaWine,Npc_HasItems(other,ItMi_LoaWine));
	Npc_RemoveInvItems(other,ItMi_LoaPartyFood,Npc_HasItems(other,ItMi_LoaPartyFood));
	Info_ClearChoices(DIA_Loa_PartyInPlace);
	Info_AddChoice(DIA_Loa_PartyInPlace,"...(продолжить)",DIA_Loa_PartyInPlace_Exit);
};

func void DIA_Loa_PartyInPlace_Exit()
{
	Wld_SendTrigger("EVT_PARTYPLACE_01");
	PlayVideo("RET2_BlackScreen.bik");
	LoaOnParty = TRUE;
	AI_NoticePrint( 500 , 7000 , " Two hours later... " );
	AI_Output(self,other, " DIA_Loa_PartyTalk_01_00 " );	// Why are you up? Where are you leaving?
	AI_Output(other,self, " DIA_Loa_PartyTalk_01_01 " );	// No, just a stiff back. So what was next?
	AI_Output(self,other, " DIA_Loa_PartyTalk_01_02 " );	// Well... and I tell him, if you find a horse, then come!
	AI_Output(self,other, " DIA_Loa_PartyTalk_01_03 " );	// That's how he left. Apparently, she is still looking for her ... (bursting with laughter)
	AI_Output(other,self, " DIA_Loa_PartyTalk_01_04 " );	// Yeah, funny story.
	AI_Output(self,other, " DIA_Loa_PartyTalk_01_05 " );	// You know... (thoughtfully) I'm really glad that you came up with the idea to arrange this little vacation for us.
	AI_Output(self,other, " DIA_Loa_PartyTalk_01_06 " );	// In the midst of the gray and dreary routine of life here, he turned out to be like a breath of fresh air for me. Thank you for this!
	AI_Output(other,self, " DIA_Loa_PartyTalk_01_07 " );	// Yes, not at all. Although I noticed that something is still bothering you.
	AI_Output(self,other, " DIA_Loa_PartyTalk_01_08 " );	// I just remembered that I once loved to spend time in the forest, enjoying its peace and quiet.
	AI_Output(self,other, " DIA_Loa_PartyTalk_01_09 " );	// But that was a long time ago, when I was little. When my parents were still alive...
};

instance DIA_Loa_PartyTalk_Ext(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Ext_Condition;
	information = DIA_Loa_PartyTalk_Ext_Info;
	permanent = FALSE;
	description = " So, it was for them that you wanted to get even with the guy you were chasing? " ;
};

func int DIA_Loa_PartyTalk_Ext_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (LoaOnParty == TRUE) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_LOA_PARTY") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Ext_Info()
{
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_01 " );	// So, it was for them that you wanted to get even with the guy you were chasing?
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_02 " );	// ...(hesitating) I didn't want to talk about it. But... you're right.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_03 " );	// It was because of him that my relatives died and I myself was on the verge of death.
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_04 " );	// Who was this bastard?
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_05 " );	// Eh... (sighing) I don't know for sure. I was no more than ten years old when it all happened. But I have remembered this name for the rest of my life. Rothgriff!
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_06 " );	// And every time I pronounce this name, I constantly feel uneasy at the thought that this bastard is still calmly walking free, alive and unacceptable.
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_07 " );	// Believe me, this is easy to fix. I don't think it's going to be that hard to find this bastard. Where did you last see him?
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_08 " );	// In Drakia. It was rumored that he settled there in the service of a local baron. But I have not been able to verify this.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_09 " );	// Apparently, someone whispered to Rothgriff that I was in the city and trying to find out about him.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_10 " );	// After which I was immediately arrested. Well, you already know the rest of the story. Port... remember?
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_11 " );	// You remembered it again! Apparently, this is how you will remind me of this all your life.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_12 " );	// Sorry, but you wanted to hear it yourself.
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_13 " );	// Okay, let's forget about it. You said Drakia. So that's where we met.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_14 " );	// Have you been there?
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_15 " );	// It turns out that he has been. I don't remember anything about this place though. Will have to fix this.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_16 " );	// Wait! Are you going to avenge me yourself?
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_17 " );	// Yes. What are you against?
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_18 " );	// No, that's not the point. Look, don't get me wrong... I don't mind your help. But...
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_19");	//Что но?
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_20 " );	// ...it's up to me to do this! And no one else.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_21 " );	// I want to look this fat pig in the eye and see how it feels. Repentance, contempt... or fear!
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_22 " );	// Otherwise, this nightmare will never leave me alone.
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_23 " );	// Okay, I understand you. But I'll try to help you anyway.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_24 " );	// Oh... (rolling his eyes) Has anyone ever told you that you're terribly stubborn?
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_25 " );	// No. But I don't really care what people say about me.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Ext_01_26 " );	// And for some reason this doesn't surprise me. Okay, let's change the subject. In the end, we still have a holiday.
	AI_Output(other,self, " DIA_Loa_PartyTalk_Ext_01_27 " );	// As you say.
	KnowAboutRotgrif = TRUE;
	B_LogEntry(TOPIC_LoaSecret, " I figured out what was bothering Loa so much. In an attempt to get even for the death of her parents, she almost died herself. According to her, the man she was looking for was called Rotgriff. He served with a local baron in Drachia. Although I had never heard of this place before, but I still decided to help Loa in her search. I think at the first opportunity I need to find out more about this place. " );
};

instance DIA_Loa_PartyTalk_Over(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Over_Condition;
	information = DIA_Loa_PartyTalk_Over_Info;
	permanent = FALSE;
	description = " Would you like some more wine? " ;
};

func int DIA_Loa_PartyTalk_Over_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (KnowAboutRotgrif == TRUE) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_LOA_PARTY") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Over_Info()
{
	AI_Output(other,self, " DIA_Loa_PartyTalk_Over_01_01 " );	// Would you like some more wine?
	AI_Output(self,other, " DIA_Loa_PartyTalk_Over_01_02 " );	// I won't refuse. Lei to the brim!
	AI_Output(other,self, " DIA_Loa_PartyTalk_Over_01_03 " );	// Wait, you didn't hear anything?
	AI_Output(self,other, " DIA_Loa_PartyTalk_Over_01_04 " );	// Umm... What do you mean?
	LoaOverParty = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Loa_PartyTalk_Home(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Home_Condition;
	information = DIA_Loa_PartyTalk_Home_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PartyTalk_Home_Condition()
{
	if((LoaOverParty == TRUE) && (ShadowbeastLoa01 == TRUE) && (ShadowbeastLoa02 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Home_Info()
{
	AI_Output(self,other, " DIA_Loa_PartyTalk_Home_01_01 " );	// And here is the promised surprise...
	AI_Output(other,self, " DIA_Loa_PartyTalk_Home_01_02 " );	// Damn, this is getting dangerous! It's time for us to return.
	AI_Output(self,other, " DIA_Loa_PartyTalk_Home_01_03 " );	// Then take me back to the farm.
	AI_Output(other,self, " DIA_Loa_PartyTalk_Home_01_04 " );	// Okay, let's go.
	LoaBackToFarm = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_Loa_BackToFarm (C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_BackToFarm_Condition;
	information = DIA_Loa_BackToFarm_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_BackToFarm_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (LoaBackToFarm == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_TORLOF") <= 3000))
	{
		return TRUE;
	};
};

func void DIA_Loa_BackToFarm_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other, " DIA_Loa_BackToFarm_01_01 " );	// Thanks for walking me out.
	AI_Output(self,other, " DIA_Loa_BackToFarm_01_02 " );	// But now I have to mind my own business. See you later.
	AI_Output(other,self, " DIA_Loa_BackToFarm_01_03 " );	// Of course...
	LoaBackToFarmDone = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Loa_GoDrakia (C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_GoDrakia_Condition;
	information = DIA_Loa_GoDrakia_Info;
	permanent = FALSE;
	description = " I'm going to Drachia. Will you come with me? " ;
};

func int DIA_Loa_GoDrakia_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (KnowAboutRotgrif == TRUE) && (MIS_OldElza == LOG_SUCCESS) && (SailAwayDrakia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Loa_GoDrakia_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Loa_GoDrakia_01_01 " );	// I'm going to Drakia. Will you come with me?
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_02 " );	// To Drakia?! Are you kidding? And how are you going to go there?
	AI_Output(other,self, " DIA_Loa_GoDrakia_01_03 " );	// The pirates will help me with this. Their ship sails there in about a couple of days.
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_04 " );	// Pirates?! Hmmm... (surprised) I didn't think you had anything in common with them.
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_05 " );	// Moreover, as far as I know, they do not have a ship now, since it was sunk by paladins who recently arrived in Khorinis.
	AI_Output(other,self, " DIA_Loa_GoDrakia_01_06 " );	// And I see that you are quite aware of what is happening for an ordinary mercenary.
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_07 " );	// Trust me, it's not that hard if you can listen.
	AI_Output(other,self, " DIA_Loa_GoDrakia_01_08 " );	// Actually, they fixed their old one. And now they want to take all their junk to sell in Drakia.
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_09 " );	// Quite reasonable of them.
	AI_Output(other,self, " DIA_Loa_GoDrakia_01_10 " );	// So, are you coming with me?
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_11 " );	// Well, if everything is really the same as you say... then, of course, I'll go. After all, this will be a great chance to get even with Rothgriff.
	AI_Output(other,self, " DIA_Loa_GoDrakia_01_12 " );	// Then, it's better not to waste time and go there right now.
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_13 " );	// Hey, hey... Not so fast! I can't just take everything here and leave it.
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_14 " );	// Also, I need some time to get ready. So let's meet right there.
	AI_Output(other,self, " DIA_Loa_GoDrakia_01_15 " );	// But you don't know where the pirate camp is?!
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_16 " );	// Don't worry! I'll figure it out somehow. And my advice to you is to prepare well for the upcoming trip.
	AI_Output(self,other, " DIA_Loa_GoDrakia_01_17 " );	// Drakia is a dangerous place and definitely don't expect a warm welcome there.
	AI_Output(other,self, " DIA_Loa_GoDrakia_01_18 " );	// And why all this does not surprise me. Okay, whatever you say.
	LoaGoDrakia = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

// -------------------Loa in Yarik------------ ------------------

instance DIA_SLD_10921_Loa_ADW_EXIT(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 999;
	condition = DIA_SLD_10921_Loa_ADW_EXIT_Condition;
	information = DIA_SLD_10921_Loa_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_10921_Loa_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_10921_Loa_ADW_Hello(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 1;
	condition = DIA_SLD_10921_Loa_ADW_Hello_Condition;
	information = DIA_SLD_10921_Loa_ADW_Hello_Info;
	permanent = FALSE;
	description = " Incredible! You're already here. " ;
};

func int DIA_SLD_10921_Loa_ADW_Hello_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_Hello_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_Hello_01_01 " );	// Incredible! You're already here.
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_Hello_01_02 " );	// As you can see...(annoyed) Only, it looks like I was in such a hurry in vain.
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_Hello_01_03 " );	// You seem to be out of your mind. What happened?
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_Hello_01_04 " );	// What, what... That bastard Greg won't let me sail with you.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_05");	//Почему?
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_Hello_01_06 " );	// Says that a woman on a ship is in trouble. And for him it is very important that his ship sailed to Drakia without any trouble.
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_Hello_01_07 " );	// Of course, I tried to explain to him that all these are old stupid prejudices.
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_Hello_01_08 " );	// But he didn't even listen to me. And just put out the door of his hut!
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_Hello_01_09 " );	// Don't worry like that! I'll try to talk to him myself.
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_Hello_01_10 " );	// I doubt you will succeed. This fool is more stubborn than a donkey!
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_Hello_01_11 " );	// It will be visible there.
	MIS_OldRumors = LOG_Running;
	Log_CreateTopic(TOPIC_OldRumors,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OldRumors,LOG_Running);
	B_LogEntry(TOPIC_OldRumors, " Loa has a little problem with Greg. He is absolutely against her taking his ship to Drachia. According to him, women on the ship bring nothing but trouble. And it is very important to him that nothing happens to the ship during his voyage. " );
};

instance DIA_SLD_10921_Loa_ADW_CanSail(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 1;
	condition = DIA_SLD_10921_Loa_ADW_CanSail_Condition;
	information = DIA_SLD_10921_Loa_ADW_CanSail_Info;
	permanent = FALSE;
	description = " You can board the ship. " ;
};

func int DIA_SLD_10921_Loa_ADW_CanSail_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_CanSail_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_CanSail_01_01 " );	// You can board the ship.
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_CanSail_01_02 " );	// What do you mean?
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_CanSail_01_03 " );	// Only that Greg agreed to take you to Drakia.
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_CanSail_01_04 " );	// Hmmm... I wonder what made him change his mind?
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_CanSail_01_05 " );	// Well, let's say I just know a certain approach to it.
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_CanSail_01_06 " );	// Although it was better not to allow situations like this again. Otherwise, approaches can end very...mmm...abruptly at such a pace.
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_CanSail_01_07 " );	// Thank you! Once again you have done me an invaluable service. And what would I do without you.
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_CanSail_01_08 " );	// Better tell me you won't piss Greg off again. At least until we get to Drakia.
	AI_Output(self,other, " DIA_SLD_10921_Loa_ADW_CanSail_01_09 " );	// Okay, I'll be quieter than water.
	AI_Output(other,self, " DIA_SLD_10921_Loa_ADW_CanSail_01_10 " );	// That's nice.
	LoaInsDrakia = TRUE;
	AI_StopProcessInfos(self);
};
