

instance DIA_Buster_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_EXIT_Condition;
	information = DIA_Buster_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Hello(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_Hello_Condition;
	information = DIA_Buster_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_Hello_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] !=  FIGHT_LOST ) && (hero.guild !=  GIL_SLD ) && (hero.guild !=  GIL_DJG ) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Buster_Hello_Info()
{
	AI_Output(self,other, " DIA_Buster_Hello_13_00 " );	// Look who we have here?! Do I happen to know you?
	Info_ClearChoices(DIA_Buster_Hello);

	if(OnarFM == FALSE)
	{
		Info_AddChoice(DIA_Buster_Hello, " As you say. I want to see Onar. " ,DIA_Buster_Hello_GoingToFarm);
	};

	Info_AddChoice(DIA_Buster_Hello, " Who's asking? " ,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output(other,self, " DIA_Buster_Hello_WhoAreYou_15_00 " );	// Who asks?
	AI_Output(self,other, " DIA_Buster_Hello_WhoAreYou_13_01 " );	// I'm Buster, one of Lee's mercenaries!
	AI_Output(self,other, " DIA_Buster_Hello_WhoAreYou_13_02 " );	// And you'd better be nicer to me or I'll have to teach you some manners!
	AI_Output(self,other, " DIA_Buster_Hello_WhoAreYou_13_03 " );	// Okay, what do you need here?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello, " It's none of your business. " ,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello,"Я знаю Ли!",DIA_Buster_Hello_IKnowLee);

	if(OnarFM == FALSE)
	{
		Info_AddChoice(DIA_Buster_Hello, " I want to see Onar. " ,DIA_Buster_Hello_GoingToFarm);
	};
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output(other,self, " DIA_Buster_Hello_IKnowLee_15_00 " );	// I know Lee!
	AI_Output(self,other, " DIA_Buster_Hello_IKnowLee_13_01 " );	// Everyone knows Lee! It doesn't mean anything, mate. Now you are talking to ME!
	AI_Output(self,other, " DIA_Buster_Hello_IKnowLee_13_02 " );	// So where are you going?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello, " It's none of your business. " ,DIA_Buster_Hello_NotYourBusiness);

	if(OnarFM == FALSE)
	{
		Info_AddChoice(DIA_Buster_Hello, " I want to see Onar. " ,DIA_Buster_Hello_GoingToFarm);
	};
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output(other,self, " DIA_Buster_Hello_NotYourBusiness_15_00 " );	// It's none of your business.
	AI_Output(self,other, " DIA_Buster_Hello_NotYourBusiness_13_01 " );	// I won't let anyone talk to me like that, you dirty worm! I think you deserve a good thrashing.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output(other,self, " DIA_Buster_Hello_GoingToFarm_15_00 " );	// As you say. I want to see Onar.
	AI_Output(self,other, " DIA_Buster_Hello_GoingToFarm_13_01 " );	// Yes?.. Hmm - you don't seem so dangerous to me.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello, " Want to check it out? " ,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice(DIA_Buster_Hello, " I killed a couple of other critters too. " ,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice(DIA_Buster_Hello, " You seem right. " ,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output(other,self, " DIA_Buster_Hello_ImNoDanger_15_00 " );	// You seem right.
	AI_Output(self,other, " DIA_Buster_Hello_ImNoDanger_13_01 " );	// Yeah, I've learned to recognize these things over the years, mate.
	AI_Output(self,other, " DIA_Buster_Hello_ImNoDanger_13_02 " );	// We constantly have to fight orcs. Or with guards from the city. They are so stubborn!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello, " You mean REAL Orcs? Those big things? " ,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"И?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"Потрясающе.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output(other,self, " DIA_Buster_Hello_SlewBeasts_15_00 " );	// I also killed a couple of other creatures.
	AI_Output(self,other, " DIA_Buster_Hello_SlewBeasts_13_01 " );	// Ha! You must have swatted some weevils in the field and kicked a couple of rats out of their holes.
	AI_Output(self,other, " DIA_Buster_Hello_SlewBeasts_13_02 " );	// And we're dealing with orcs here! Yes, and with those treacherous city guards.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello, " You mean REAL Orcs? Those big things? " ,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"И?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"Потрясающе.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output(other,self, " DIA_Buster_Hello_WannaTestIt_15_00 " );	// Want to check?
	AI_Output(self,other, " DIA_Buster_Hello_WannaTestIt_13_01 " );	// Wow! I attacked the wrong guy, didn't I?
	AI_Output(other,self, " DIA_Buster_Hello_WannaTestIt_15_02 " );	// You can say that.
	AI_Output(self,other, " DIA_Buster_Hello_WannaTestIt_13_03 " );	// Then come on, show me what you're good for.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output(other,self, " DIA_Buster_Hello_Impressive_15_00 " );	// Awesome.
	AI_Output(self,other, " DIA_Buster_Hello_Impressive_13_01 " );	// It's our job, man! We even make our own weapons and armor!
	AI_Output(self,other, " DIA_Buster_Hello_Impressive_13_02 " );	// We walk hand in hand with death every day. But a redneck like you can't understand that.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello, " Looks like I'll have to show you what I know about this! " ,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice(DIA_Buster_Hello,"Как скажешь.",DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output(other,self, " DIA_Buster_Hello_IfYouSaySo_15_00 " );	// As you say.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//Проходи, зануда!
	AI_StopProcessInfos(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output(other,self, " DIA_Buster_Hello_LetMeShowYou_15_00 " );	// Looks like I'll have to show you what I know about this!
	AI_Output(self,other, " DIA_Buster_Hello_LetMeShowYou_13_01 " );	// Are you making a wild peasant out of yourself, aren't you?
	AI_Output(self,other, " DIA_Buster_Hello_LetMeShowYou_13_02 " );	// Okay, come on, show me what you can do.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//И?
	AI_Output(self,other, " DIA_Buster_Hello_SoWhat_13_01 " );	// Like you know what I'm talking about. You think you're cool, don't you?
	AI_Output(self,other, " DIA_Buster_Hello_SoWhat_13_02 " );	// Looks like it's time to teach you a lesson!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello, " Always Ready! " ,DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello, " I'm just kidding... " ,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output(other,self, " DIA_Buster_Hello_RealOrcs_15_00 " );	// You mean REAL orcs? Those big creatures?
	AI_Output(self,other, " DIA_Buster_Hello_RealOrcs_13_01 " );	// I mean... Wait a minute! Are you kidding me?
	AI_Output(other,self, " DIA_Buster_Hello_RealOrcs_15_02 " );	// I didn't even think about it.
	AI_Output(self,other, " DIA_Buster_Hello_RealOrcs_13_03 " );	// Oh, you dung worm! You're asking yourself, right?
	AI_Output(self,other, " DIA_Buster_Hello_RealOrcs_13_04 " );	// Then come on, show what you can do, hero!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello, " Always Ready! " ,DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello, " I'm just kidding... " ,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output(other,self, " DIA_Buster_Hello_Whenever_15_00 " );	// Always ready!
	AI_Output(self,other, " DIA_Buster_Hello_Whenever_13_01 " );	// Then come here, buddy!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output(other,self, " DIA_Buster_Hello_JustJoking_15_00 " );	// I'm just kidding...
	AI_Output(self,other, " DIA_Buster_Hello_JustJoking_13_01 " );	// Be careful with such jokes! Now get out!
	AI_StopProcessInfos(self);
};


instance DIA_Buster_FightNone(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_FightNone_Condition;
	information = DIA_Buster_FightNone_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_FightNone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_Hello) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output(self,other, " DIA_Buster_FightNone_13_00 " );	// What do you want, slug?
};

instance DIA_Buster_Duell (C_Info)
{
	npc = SLD_802_Buster;
	nr = 3;
	condition = DIA_Buster_Duell_Condition;
	information = DIA_Buster_Duell_Info;
	permanent = TRUE;
	description = " I challenge you to a duel! " ;
};

func int DIA_Buster_Duell_Condition()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void DIA_Buster_Duell_Info()
{
	AI_Output(other,self, " DIA_Buster_Duell_15_00 " );	// I challenge you to a duel!

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other, " DIA_Buster_Duell_13_01 " );	// Ah-ah! You're itching for everything, right? Okay, come here!
	}
	else
	{
		AI_Output(self,other, " DIA_Buster_Duell_13_02 " );	// Do you want to try again? Well, you're a bore, okay, come here!

		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other, " DIA_Buster_Duell_13_03 " );	// Just don't run away anymore!
		};
	};

	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Buster_WannaJoin(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WannaJoin_Condition;
	information = DIA_Buster_WannaJoin_Info;
	permanent = TRUE;
	description = " I want to join the mercenaries! " ;
};


func int DIA_Buster_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (Buster_Duell == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Buster_WannaJoin_15_00 " );	// I want to join the mercenaries!

	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other, " DIA_Buster_WannaJoin_13_01 " );	// A guy with a kick like you shouldn't have too much trouble with this.
		}
		else
		{
			AI_Output(self,other, " DIA_Buster_WannaJoin_13_02 " );	// You're not a particularly good fighter, but you're not a coward either.
		};

		Buster_Duell = TRUE;
		BUSTERDUELOK = TRUE;
		AI_Output(self,other, " DIA_Buster_WannaJoin_13_03 " );	// My vote doesn't mean much since I haven't been here very long, but if Lee asks, I'll vote for you.
		Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		B_LogEntry(TOPIC_SLDRespekt, " Since I defeated Buster, he has nothing against me joining the mercenary ranks. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Buster_WannaJoin_13_04 " );	// You? I don't remember cowards like you ever being hired...

		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other, " DIA_Buster_WannaJoin_13_05 " );	// You're running away from a duel - people like you have nothing to do here!
		};
	};
};


var int Buster_SentenzaTip;

instance DIA_Buster_OtherSld(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_OtherSld_Condition;
	information = DIA_Buster_OtherSld_Info;
	permanent = FALSE;
	description = " I want to learn more about the mercenaries and this area. " ;
};


func int DIA_Buster_OtherSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Buster_OtherSld_Info()
{
	AI_Output(other,self, " DIA_Buster_OtherSld_15_00 " );	// I want to learn more about the mercenaries and this area.
	AI_Output(self,other, " DIA_Buster_OtherSld_13_01 " );	// I can't say much about the terrain. You'd better ask the farmers.
	AI_Output(self,other, " DIA_Buster_OtherSld_13_02 " );	// As for mercenaries, our rules are simple: if you can stand up for yourself, welcome to us.
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other, " DIA_Buster_OtherSld_13_03 " );	// I think you deserve to be one of us.
		AI_Output(self,other, " DIA_Buster_OtherSld_13_04 " );	// But don't be fooled. You just got lucky during our last fight.
		AI_Output(self,other, " DIA_Buster_OtherSld_13_05 " );	// This farm is full of guys who will be better than me...
		AI_Output(self,other, " DIA_Buster_OtherSld_13_06 " );	// Sentenza, for example. He guards the entrance to the farm. You better not mess with him.
		Buster_SentenzaTip = TRUE;
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other, " DIA_Buster_OtherSld_13_07 " );	// But why am I telling you all this, slug?!
		AI_StopProcessInfos(self);
	};
};


var int Buster_GoldZumBrennen;
var int Buster_Bonus;

instance DIA_Buster_AboutSentenza(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_AboutSentenza_Condition;
	information = DIA_Buster_AboutSentenza_Info;
	permanent = FALSE;
	description = " What about Sentenza? " ;
};


func int DIA_Buster_AboutSentenza_Condition()
{
	if(Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_AboutSentenza_Info()
{
	AI_Output(other,self, " DIA_Buster_AboutSentenza_15_00 " );	// What about Sentenza?
	AI_Output(self,other, " DIA_Buster_AboutSentenza_13_01 " );	// He will try to shake the gold out of you when you enter the farm - he does this to everyone.
	AI_Output(self,other, " DIA_Buster_AboutSentenza_13_02 " );	// If I were you, I'd pay. I did that myself when I first went there. And what's good, he voted for me after that.
	AI_Output(self,other, " DIA_Buster_AboutSentenza_13_03 " );	// Quite a favor, as he said. I lost all my gold in the process, but it still wasn't much. And then I even rejoiced at it.
	AI_Output(self,other, " DIA_Buster_AboutSentenza_13_04 " );	// I saw him beat up a guy who decided NOT to pay him.
	AI_Output(other,self, " DIA_Buster_AboutSentenza_15_05 " );	// Thanks for the tip.
	AI_Output(self,other, " DIA_Buster_AboutSentenza_13_06 " );	// Please. Does he mean a lot to you?
	Info_ClearChoices(DIA_Buster_AboutSentenza);
	Info_AddChoice(DIA_Buster_AboutSentenza,"Нет.",DIA_Buster_AboutSentenza_No);
	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		Info_AddChoice(DIA_Buster_AboutSentenza, " Here! Have five gold. " ,DIA_Buster_AboutSentenza_Give);
	};
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output(other,self, " DIA_Buster_AboutSentenza_Give_15_00 " );	// Here! Hold five gold.
	B_GiveInvItems(other,self,ItMi_Gold,5);
	AI_Output(self,other, " DIA_Buster_AboutSentenza_Give_13_01 " );	// Thank you! Now I can have some fun tonight.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//Нет.
	AI_Output(self,other, " DIA_Buster_AboutSentenza_No_13_01 " );	// I thought so.
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};


instance DIA_Buster_LeeLeader(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_LeeLeader_Condition;
	information = DIA_Buster_LeeLeader_Info;
	permanent = FALSE;
	description = " The mercenaries are led by Lee, right? " ;
};


func int DIA_Buster_LeeLeader_Condition()
{
	if(Buster_Duell == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_LeeLeader_Info()
{
	AI_Output(other,self, " DIA_Buster_LeeLeader_15_00 " );	// The mercenaries are led by Lee, right?
	AI_Output(self,other, " DIA_Buster_LeeLeader_13_01 " );	// That's right - hey, now I remember where I saw you! You were also in prison.
	AI_Output(other,self, " DIA_Buster_LeeLeader_15_02 " );	// Oh... (sighs) So do I!
	AI_Output(self,other, " DIA_Buster_LeeLeader_13_03 " );	// I didn't see you when everything exploded. And shortly before that too.
	AI_Output(other,self, " DIA_Buster_LeeLeader_15_04 " );	// I had other problems.
	AI_Output(self,other, " DIA_Buster_LeeLeader_13_05 " );	// Then you missed a lot - a lot has changed since then.
};


instance DIA_Buster_WhatHappened(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WhatHappened_Condition;
	information = DIA_Buster_WhatHappened_Info;
	permanent = FALSE;
	description = " What happened to the mercenaries from the colony? " ;
};


func int DIA_Buster_WhatHappened_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Buster_LeeLeader ) && ( ( hero . guild !=  GIL_SLD ) && ( hero . guild !=  GIL_DJG )))
	{
		return TRUE;
	};
};

func void DIA_Buster_WhatHappened_Info()
{
	AI_Output(other,self, " DIA_Buster_WhatHappened_15_00 " );	// What happened to the mercenaries from the colony?
	AI_Output(self,other, " DIA_Buster_WhatHappened_13_01 " );	// After the Barrier was gone, Lee led us out of the colony. He said we're not afraid of anything if we stick together. And he was right.
	AI_Output(self,other, " DIA_Buster_WhatHappened_13_02 " );	// Soon we found ourselves a warm place here. Onar pays us to keep the militia out of the city.
	AI_Output(self,other, " DIA_Buster_WhatHappened_13_03 " );	// Although most of us are willing to do it even for free.
	AI_Output(self,other, " DIA_Buster_WhatHappened_13_04 " );	// Onar feeds us all, and we can safely wait for the opportunity to get off this damned island.
};

instance DIA_Buster_KAP3_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP3_EXIT_Condition;
	information = DIA_Buster_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_SHADOWBEASTS(C_Info)
{
	npc = SLD_802_Buster;
	nr = 30;
	condition = DIA_Buster_SHADOWBEASTS_Condition;
	information = DIA_Buster_SHADOWBEASTS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_SHADOWBEASTS_Condition()
{
	if ((Capital >=  3 ) && ( BUSTERDUELOK  ==  TRUE ))
	{
		return TRUE;
	};
};

func void B_DIA_Buster_SHADOWBEASTS_OK()
{
	AI_StopProcessInfos(self);
};

func void DIA_Buster_SHADOWBEASTS_Info()
{
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_13_00 " );	// Hey buddy!
	AI_Output(other,self, " DIA_Buster_SHADOWBEASTS_15_01 " );	// What do you need?
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_13_02 " );	// Lately I've been thinking about how you can make money in this hole.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//И?
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_13_04 " );	// I think I know how to do this.
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_13_05 " );	// A merchant from the city is willing to shell out a round sum for a certain item.
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS, " Who is this merchant you're talking about? " ,DIA_Buster_SHADOWBEASTS_wer);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS, " What are you thinking? " ,DIA_Buster_SHADOWBEASTS_was);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS, " Why are you telling me all this? " ,DIA_Buster_SHADOWBEASTS_ich);
};

func void DIA_Buster_SHADOWBEASTS_ich()
{
	AI_Output(other,self, " DIA_Buster_SHADOWBEASTS_ich_15_00 " );	// Why are you telling me all this?
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_ich_13_01 " );	// I can't do it myself. I have to stay here and keep an eye on those damn sheep.
	AI_Output(other,self, " DIA_Buster_SHADOWBEASTS_ich_15_02 " );	// You mean, for the farmers.
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_ich_13_03 " );	// Well, that's what I said.
};

func void DIA_Buster_SHADOWBEASTS_was()
{
	AI_Output(other,self, " DIA_Buster_SHADOWBEASTS_was_15_00 " );	// What did you come up with?
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_was_13_01 " );	// This merchant claims to be able to sell the horns of the Abyssers for a very profitable price.
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_was_13_02 " );	// Someone should go into the woods and hunt these creatures. That's what you're for.
	Info_AddChoice(DIA_Buster_SHADOWBEASTS, " How much can you earn from this? " ,DIA_Buster_SHADOWBEASTS_was_wieviel);
};

func void DIA_Buster_SHADOWBEASTS_was_how much()
{
	AI_Output(other,self, " DIA_Buster_SHADOWBEASTS_was_wieviel_15_00 " );	// How much can you earn from this?
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_was_wieviel_13_01 " );	// A whole lot of money! That's enough for both of us.
	if(Buster_GoldZumBrennen == TRUE)
	{
		AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_was_wieviel_13_02 " );	// And remembering the gold you gave me, I will make a special price for you.
	};
	AI_Output(other,self, " DIA_Buster_SHADOWBEASTS_was_wieviel_15_03 " );	// Sounds tempting! I'll let you know when I get those horns.
	MIS_Buster_KillShadowbeasts_DJG = LOG_Running;
	Log_CreateTopic(TOPIC_Buster_KillShadowbeasts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts,LOG_Running);
	B_LogEntry(TOPIC_Buster_KillShadowbeasts, " Buster will give you a good price for every Shadowhorn horn I bring him. " );
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
};

func void DIA_Buster_SHADOWBEASTS_wer()
{
	AI_Output(other,self, " DIA_Buster_SHADOWBEASTS_wer_15_00 " );	// Who is this merchant you speak of?
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_wer_13_01 " );	// That won't do, mate. What do you think, am I a fool to reveal my sources? Are you trying to deceive me?
	AI_Output(self,other, " DIA_Buster_SHADOWBEASTS_wer_13_02 " );	// Either you'll deal with ME, or you can forget about it, okay?
};

instance DIA_Buster_TeachTrophyShadowbeast (C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_HouseTrophyShadowbeast_Condition;
	information = DIA_Buster_TeachTrophyShadowbeast_Info;
	permanent = TRUE;
	description = " How do you gut a mrakoris? " ;
};

func int DIA_Buster_TroachTrophyShadowbeast_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG == LOG_Running) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_TroachTrophyShadowbeast_Info()
{
	AI_Output(other,self, " DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03 " );	// And how to gut a mrakoris?
	AI_Output(self,other, " DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04 " );	// You don't know this? Oh man, I thought better of you.
	Info_ClearChoices(DIA_Buster_HouseTrophyShadowbeast);
	Info_AddChoice(DIA_Buster_TraceTrophyShadowbeast,Dialog_Back,DIA_Buster_TraceTrophyShadowbeast_back);
	Info_AddChoice(DIA_Buster_TeachTrophyShadowbeast,b_buildlearnstringforsmithhunt( " Teach me how to break off the horn of the shadowbeast. " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_ShadowHorn)),DIA_Buster_TeachTrophyShadowbeast_teach);
};

func void DIA_Buster_TroachTrophyShadowbeast_teach()
{
	AI_Output(other,self, " DIA_Buster_BringTrophyShadowbeast_teach_15_00 " );	// Teach me how to break the horn off the mrakoris.

	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_teach_13_01 " );	// Okay, listen. You kill the mrakoris, and as tightly as possible you take his horn with your right hand.
		AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_teach_13_02 " );	// Then you put a knife to his forehead and make a deep cut around the horn.
		AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_teach_13_03 " );	// Well, then you just pry the horn with a knife, use it as a lever, and put the horn in your pocket.
		AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_teach_13_04 " );	// And bring it to me. I think you can do it.
	};

	Info_ClearChoices(DIA_Buster_HouseTrophyShadowbeast);
};

func void DIA_Buster_TroachTrophyShadowbeast_back()
{
	Info_ClearChoices(DIA_Buster_HouseTrophyShadowbeast);
};

instance DIA_Buster_BringTrophyShadowbeast (C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_BringTrophyShadowbeast_Condition;
	information = DIA_Buster_BringTrophyShadowbeast_Info;
	permanent = TRUE;
	description = " About the horns of the obscurantists... " ;
};

func int DIA_Buster_BringTrophyShadowbeast_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowHorn) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Buster_BringTrophyShadowbeast_Info()
{
	var int BusterTrophyShadowbeastCount;
	var int XP_BringBusterTrophyShadowbeast;
	var int XP_BringBusterTrophyShadowbeasts;
	var int BustersBusterTrophyShadowbeastOffer;
	var int BusterTrophyShadowbeastMoney;

	if (Chapter >=  5 )
	{
		AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_13_00 " );	// My trader from the city said farewell.
		AI_Output(other,self, " DIA_Buster_BringTrophyShadowbeast_15_01 " );	// What does this mean?
		AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_13_02 " );	// He's dead. You can keep those horns for yourself. Now I still don't know what to do with them.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		BusterTrophyShadowbeastCount = Npc_HasItems(other,ItAt_ShadowHorn);

		if(BusterTrophyShadowbeastCount == 1)
		{
			XP_BringBusterTrophyShadowbeast = Shadowbeast.level * XP_PER_VICTORY;
			BustersBusterTrophyShadowbeastOffer = Buster_Bonus + 100;
			AI_Output(other,self, " DIA_Buster_BringTrophyShadowbeast_15_05 " );	// I brought you the horn of darkness.
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeast);
			B_GiveInvItems(other,self,ItAt_ShadowHorn,1);
			Npc_RemoveInvItems(self,ItAt_ShadowHorn,Npc_HasItems(self,ItAt_ShadowHorn));
			AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_13_07 " );	// Great. Come here. And bring more if you can. Who knows how long the merchant will be interested in these horns.
			AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_13_08 " );	// Here's your share.
			BusterTrophyShadowbeastGeld = BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer;
			CreateInvItems(self,ItMi_Gold,BusterTrophyShadowbeastMoney);
			B_GiveInvItems(self,other,ItMi_Gold,BusterTrophyShadowbeastGeld);
		}
		else if(BusterTrophyShadowbeastCount > 1)
		{
			XP_BringBusterTrophyShadowbeast = Shadowbeast.level * XP_PER_VICTORY;
			BustersBusterTrophyShadowbeastOffer = Buster_Bonus + 100;
			AI_Output(other,self, " DIA_Buster_BringTrophyShadowbeast_15_06 " );	// I brought the horns of the Abyssers for your merchant.
			B_GiveInvItems(other,self,ItAt_ShadowHorn,BusterTrophyShadowbeastCount);
			Npc_RemoveInvItems(self,ItAt_ShadowHorn,Npc_HasItems(self,ItAt_ShadowHorn));
			XP_BringBusterTrophyShadowbeasts = BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast;
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeasts);
			AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_13_07 " );	// Great. Come here. And bring more if you can. Who knows how long the merchant will be interested in these horns.
			AI_Output(self,other, " DIA_Buster_BringTrophyShadowbeast_13_08 " );	// Here's your share.
			BusterTrophyShadowbeastGeld = BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer;
			CreateInvItems(self,ItMi_Gold,BusterTrophyShadowbeastMoney);
			B_GiveInvItems(self,other,ItMi_Gold,BusterTrophyShadowbeastGeld);
		}
		else
		{
			AI_Output(other,self, " DIA_Buster_BringTrophyShadowbeast_back_15_00 " );	// I will return to you with horns.
			AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//Надеюсь.
		};
	};
};

instance DIA_Buster_KAP4_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP4_EXIT_Condition;
	information = DIA_Buster_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Perm4(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_Perm4_Condition;
	information = DIA_Buster_Perm4_Info;
	permanent = TRUE;
	description = " What do you think of dragon hunters? " ;
};


func int DIA_Buster_Perm4_Condition()
{
	if (Chapter >=  4 )
	{
		return TRUE;
	};
};

func void DIA_Buster_Perm4_Info()
{
	AI_Output(other,self, " DIA_Buster_Perm4_15_00 " );	// What do you think of dragon hunters?
	AI_Output(self,other, " DIA_Buster_Perm4_13_01 " );	// These guys could make a whole bunch of gold - if they don't play catch.
	AI_Output(self,other, " DIA_Buster_Perm4_13_02 " );	// And I prefer to stay with Lee.
};


instance DIA_Buster_KAP5_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP5_EXIT_Condition;
	information = DIA_Buster_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_KAP6_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP6_EXIT_Condition;
	information = DIA_Buster_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_PICKPOCKET(C_Info)
{
	npc = SLD_802_Buster;
	nr = 900;
	condition = DIA_Buster_PICKPOCKET_Condition;
	information = DIA_Buster_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Buster_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 60 );
};

func void DIA_Buster_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
	Info_AddChoice(DIA_Buster_PICKPOCKET,Dialog_Back,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Buster_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

