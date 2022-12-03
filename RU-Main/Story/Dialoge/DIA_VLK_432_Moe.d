

instance DIA_Moe_EXIT(C_Info)
{
	npc = VLK_432_Moe;
	nr = 999;
	condition = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Moe_PICKPOCKET(C_Info)
{
	npc = VLK_432_Moe;
	nr = 900;
	condition = DIA_Moe_PICKPOCKET_Condition;
	information = DIA_Moe_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Moe_PICKPOCKET_Condition()
{
	return  C_Robbery ( 25 , 30 );
};

func void DIA_Moe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
	Info_AddChoice(DIA_Moe_PICKPOCKET,Dialog_Back,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Moe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
};

func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
};


instance DIA_Moe_Hello (C_Info)
{
	npc = VLK_432_Moe;
	nr = 2;
	condition = DIA_Moe_Hallo_Condition;
	information = DIA_Moe_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Moe_Hallo_Condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Moe_Hello_Info()
{
	AI_Output(self,other, " DIA_Moe_Hallo_01_00 " );	// Hey, I don't know you. What do you need here? Are you going to the pub?
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, " No, I'm not going to the bar... " ,DIA_Moe_Hallo_Gehen);
	Info_AddChoice(DIA_Moe_Hallo, " Oh, so this is a waterfront inn... " ,DIA_Moe_Hallo_Witz);
	Info_AddChoice(DIA_Moe_Hallo, " Do you mind? " ,DIA_Moe_Hallo_Reizen);
};

func void DIA_Moe_Hallo_Gehen()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Gehen_15_00 " );	// No, I'm not going to the tavern...
	AI_Output(self,other, " DIA_Moe_Hallo_Gehen_01_01 " );	// I thought so. But this is not so important - we can get straight to the point.
	AI_Output(self,other, " DIA_Moe_Hallo_Gehen_01_02 " );	// Since you're new here, I want to make you a tempting offer. You give me fifty gold coins and you can move on.
	AI_Output(self,other, " DIA_Moe_Hallo_Gehen_01_03 " );	// This is the fee for free admission to the tavern.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, " Let's ask what the militia thinks about this. " ,DIA_Moe_Hallo_Miliz);
	Info_AddChoice(DIA_Moe_Hallo, " Forget it, you won't get a dime! " ,DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo, " Ok, I'll pay. " ,DIA_Moe_Hallo_Zahlen);
	Info_AddChoice(DIA_Moe_Hallo, " But I don't want to go to the bar! " ,DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Kneipe()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Kneipe_15_00 " );	// But I don't want to go to the tavern!
	AI_Output(self,other, " DIA_Moe_Hallo_Kneipe_01_01 " );	// You see, sooner or later everyone goes to the tavern. So it's better for you to pay right now - and this problem will not bother you anymore.
};

func void DIA_Moe_Hello_Witz()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Witz_15_00 " );	// Oh, so this is a port inn. I mistook it for the king's palace.
	AI_Output(self,other, " DIA_Moe_Hallo_Witz_01_01 " );	// Hey - keep your jokes to yourself, cretin, or I'll make you gnaw on cobblestones.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, " I know I'm going to have to break a couple of your ribs to get through! " ,DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo, " Are you trying to make trouble for me? " ,DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo, " Calm down, I just wanted a beer. " ,DIA_Moe_Hallo_Ruhig);
	Info_AddChoice(DIA_Moe_Hallo, " But I don't want to go to the bar! " ,DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hello_Travel()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Reizen_15_00 " );	// Do you mind?
	AI_Output(self,other, " DIA_Moe_Hallo_Reizen_01_01 " );	// You have nothing to do here, kid.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, " I know I'm going to have to break a couple of your ribs to get through! " ,DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo, " Are you trying to make trouble for me? " ,DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo, " Calm down, I just wanted a beer. " ,DIA_Moe_Hallo_Ruhig);
};

func void DIA_Moe_Hello_Miliz()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Miliz_15_00 " );	// Let's ask what the militia thinks about this.
	AI_Output(self,other, " DIA_Moe_Hallo_Miliz_01_01 " );	// (laughs) There is no militia here. Do you know why they are not here?
	AI_Output(self,other, " DIA_Moe_Hallo_Miliz_01_02 " );	// You're in the waterfront, kid. None of the militia will dare to fight me here.
	AI_Output(self,other, " DIA_Moe_Hallo_Miliz_01_03 " );	// They only occasionally drop by the Red Lantern. See, it's just you and me. (nasty grin)
};

func void DIA_Moe_Hallo_Pruegel()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Pruegel_15_00 " );	// I know I'm going to have to break a couple of your ribs to get through!
	AI_Output(self,other, " DIA_Moe_Hallo_Pruegel_01_01 " );	// You can try, baby. Show me what you are capable of!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hello_Aerger()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Aerger_15_00 " );	// Are you trying to get me into trouble?
	AI_Output(self,other, " DIA_Moe_Hallo_Aerger_01_01 " );	// Of course, I'm a master at creating problems. So defend yourself, cretin!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Quiet()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Ruhig_15_00 " );	// Calm down, I just wanted to have a beer.
	AI_Output(self,other, " DIA_Moe_Hallo_Ruhig_01_01 " );	// Okay, but it will cost you 50 coins. This is the entrance fee. (grins)
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, " Forget it, you won't get a dime! " ,DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo, " Ok, I'll pay. " ,DIA_Moe_Hallo_Zahlen);
};

func void DIA_Moe_Hello_Numbers()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Zahlen_15_00 " );	// Okay, I'll pay.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Moe_Hallo_Zahlen_01_01 " );	// Great! Since you are so generous today, now you can give me the entire contents of your wallet.
		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo, " Forget it, you won't get a dime! " ,DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo, " Okay, that's all I have. " ,DIA_Moe_Hallo_Alles);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) > 9)
	{
		AI_Output(other,self, " DIA_Moe_Hallo_Zahlen_15_02 " );	// But I don't have that much gold with me.
		AI_Output(self,other, " DIA_Moe_Hallo_Zahlen_01_03 " );	// It doesn't matter. Just give me everything you have.
		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo, " Forget it, you won't get a dime! " ,DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo, " Okay, that's all I have. " ,DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output(other,self, " DIA_Moe_Hallo_Zahlen_15_04 " );	// But I don't even have ten coins.
		AI_Output(self,other, " DIA_Moe_Hallo_Zahlen_01_05 " );	// Damn, am I out of luck today?!
		AI_Output(self,other, " DIA_Moe_Hallo_Zahlen_01_06 " );	// Okay...(sigh) You can go.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Moe_Hello_Vergisses()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Vergisses_15_00 " );	// Forget it, you won't get a penny!
	AI_Output(self,other, " DIA_Moe_Hallo_Vergisses_01_01 " );	// Then I'll take everything you have! And you will lie prostrate on the ground before me.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hello_Everything()
{
	AI_Output(other,self, " DIA_Moe_Hallo_Alles_15_00 " );	// Okay, that's all I have.
	B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	b_givealltobayguy(other,self);
	AI_Output(self,other, " DIA_Moe_Hallo_Alles_01_01 " );	// Great! It's enough. I am generous today.
	AI_StopProcessInfos(self);
};


instance DIA_Moe_Harbor(C_Info)
{
	npc = VLK_432_Moe;
	nr = 998;
	condition = DIA_Moe_Harbor_Condition;
	information = DIA_Moe_Harbor_Info;
	permanent = TRUE;
	description = " You know almost everything about the port, don't you? " ;
};


func int DIA_Moe_Harbor_Condition()
{
	return TRUE;
};

func void DIA_Moe_Harbor_Info()
{
	AI_Output(other,self, " DIA_Moe_Harbor_15_00 " );	// You know almost everything about the port, right?
	AI_Output(self,other, " DIA_Moe_Harbor_01_01 " );	// Of course. And what?
	Info_ClearChoices(DIA_Moe_Harbor);
	Info_AddChoice(DIA_Moe_Harbor,Dialog_Back,DIA_Moe_Harbor_Back);
	Info_AddChoice(DIA_Moe_Harbor, " How are the ships here? " ,DIA_Moe_Harbor_Ship);
	Info_AddChoice(DIA_Moe_Harbor, " Why can't I see any militia here? " ,DIA_Moe_Harbor_Militia);
	Info_AddChoice(DIA_Moe_Harbor, " What are the rumors going around lately? " ,DIA_Moe_Harbor_Rumors);
};

func void DIA_Moe_Harbor_Back()
{
	Info_ClearChoices(DIA_Moe_Harbor);
};

func void DIA_Moe_Harbor_Ship()
{
	AI_Output(other,self, " DIA_Moe_Harbor_Ship_15_00 " );	// How are the ships here?
	AI_Output(self,other, " DIA_Moe_Harbor_Ship_01_01 " );	// The only ship that has come in lately is the paladin ship.
	AI_Output(self,other, " DIA_Moe_Harbor_Ship_01_02 " );	// He's standing over there, behind the rocks to the southwest.
};

func void DIA_Moe_Harbor_Militia()
{
	AI_Output(other,self, " DIA_Moe_Harbor_Militia_15_00 " );	// Why can't I see any of the militia here?
	AI_Output(self,other, " DIA_Moe_Harbor_Militia_01_01 " );	// They dare not come in here. We have our rules here.
};

func void DIA_Moe_Harbor_Rumors()
{
	AI_Output(other,self, " DIA_Moe_Harbor_Rumors_15_00 " );	// What rumors have been circulating lately?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_01 " );	// We don't like people here who ask too many questions. Especially if they are strangers.
	}
	else  if (chapter ==  2 )
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_02 " );	// Nothing, and what could happen? Everything is quiet.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_03 " );	// (acted) Everything is bad. Times are tough, but we're still trying to stay on the right path.
			AI_Output(other,self, " DIA_Moe_Harbor_Rumors_15_04 " );	// Stop teasing me.
			AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_05 " );	// How could you think that of me? I am deeply offended.
		}
		else
		{
			AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_06 " );	// It's getting hot. Lord Andre is trying to stick his nose where he has nothing to do.
			AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_07 " );	// These bigwigs never understood how things are done here.
		};
	}
	else  if (chapter ==  3 )
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_08 " );	// We have nothing to do with this case.
				AI_Output(other,self, " DIA_Moe_Harbor_Rumors_15_09 " );	// What's the point?
				AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_10 " );	// To that paladin kill up there. If I were you, I'd think of mercenaries instead of wasting time here.
			}
			else
			{
				AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_11 " );	// I know you had nothing to do with this, but killing a paladin really scared these nobles.
				AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_12 " );	// Want some friendly advice? You better get out of town. At least for a while.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_13 " );	// Since it was revealed that the mercenaries had nothing to do with this paladin, the militia dare not even look here.
			AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_14 " );	// I think they're afraid to walk out of here with a bloody nose. And for me, it's even better.
		};
	}
	else  if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_15 " );	// Absolutely nothing happens here.
	}
	else
	{
		AI_Output(self,other, " DIA_Moe_Harbor_Rumors_01_16 " );	// Finally, those overweight paladins are leaving the harbor. It is high time.
	};
};


instance DIA_Moe_LEHMARGELDEINTREIBEN (C_Info)
{
	npc = VLK_432_Moe;
	nr = 2;
	condition = DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information = DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition()
{
	if ((Lehmar_GeldGeleihen_Day <= (Wld_GetDay() -  2 )) && (Lehmar_GeldGeleihen !=  0 ) && (RangerHelp_LehmarKohle ==  FALSE ) && (Lehmar.aivar[AIV_DefeatedByPlayer] ==  FALSE ) && (LehmarIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Moe_LEHMARGELDEINTREIBEN_Info()
{
	AI_Output(self,other, " DIA_Moe_LEHMARGELDEINTREIBEN_01_00 " );	// Hey you! Lemar says hello to you.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_MOE_MOEBORED(C_Info)
{
	npc = VLK_432_Moe;
	nr = 1;
	condition = dia_moe_moebored_condition;
	information = dia_moe_moebored_info;
	permanent = FALSE;
	description = " Cardiff is complaining about you! " ;
};


func int dia_moe_moebored_condition()
{
	if(MIS_MOEBORED == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_moe_moebored_info()
{
	AI_Output(other,self, " DIA_Moe_MoeBored_01_00 " );	// Cardiff is complaining about you!
	AI_Output(self,other, " DIA_Moe_MoeBored_01_01 " );	// True? (grins) And what does he say?
	AI_Output(other,self, " DIA_Moe_MoeBored_01_02 " );	// He said that you constantly extort money from people who go into his tavern.
	AI_Output(other,self, " DIA_Moe_MoeBored_01_03 " );	// This is pretty bad for his wallet.
	AI_Output(other,self, " DIA_Moe_MoeBored_01_04 " );	// People are afraid to come here!
	AI_Output(self,other, " DIA_Moe_MoeBored_01_05 " );	// (roughly) So what? What do I care about that!
	if(MOEISBEATEN == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Moe_MoeBored_01_07 " );	// I think you should go somewhere else.
		AI_Output(other,self, " DIA_Moe_MoeBored_01_08 " );	// Otherwise, I'll have to teach you a lesson in good manners.
		AI_Output(self,other, " DIA_Moe_MoeBored_01_11 " );	// Okay, okay... (fearful) Just don't get excited, boy! I got it.
		AI_Output(self,other, " DIA_Moe_MoeBored_01_12 " );	// If it's really that important to you, then so be it, I'll find myself another place.
		AI_Output(self,other, " DIA_Moe_MoeBored_01_13 " );	// Just don't hit me anymore!
		B_LogEntry( TOPIC_MOEBORED , " I spoke to Moe and he promised he wouldn't bother Cardiff customers again. " );
		MOEISAWAYFROMTAVERNE = TRUE ;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"AwayFromTaverne");
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(other,self, " DIA_Moe_MoeBored_01_17 " );	// I think you should go somewhere else.
		AI_Output(other,self, " DIA_Moe_MoeBored_01_18 " );	// Otherwise, I'll have to teach you a lesson in good manners.
		AI_Output(self,other, " DIA_Moe_MoeBored_01_19 " );	// What? (laughs) You also thought to threaten me?!
		AI_Output(self,other, " DIA_Moe_MoeBored_01_20 " );	// Okay, hold on, sucker! Now I'll show you how to contact me.
		B_LogEntry( TOPIC_MOEBORED , " As I expected, I'll have to teach Mo good manners. " );
		MOEATTACKME = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_MOE_MOEBOREDDONE(C_Info)
{
	npc = VLK_432_Moe;
	nr = 1;
	condition = dia_moe_moeboreddone_condition;
	information = dia_moe_moeboreddone_info;
	permanent = FALSE;
	description = " Well, is that enough for you?! " ;
};


func int dia_moe_moeboreddone_condition()
{
	if((MIS_MOEBORED == LOG_Running) && (MOEISBEATEN == TRUE) && (MOEATTACKME == TRUE))
	{
		return TRUE;
	};
};

func void dia_moe_moeboreddone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Moe_MoeBoredDone_01_01 " );	// Well, is that enough for you?!
	AI_Output(self,other, " DIA_Moe_MoeBoredDone_01_02 " );	// Okay, okay... (fearfully) Don't get excited, boy! I got it.
	AI_Output(self,other, " DIA_Moe_MoeBoredDone_01_03 " );	// If it's really that important to you, then so be it, I'll find myself another place.
	AI_Output(self,other, " DIA_Moe_MoeBoredDone_01_04 " );	// Just don't hit me anymore!
	B_LogEntry( TOPIC_MOEBORED , " Mo has promised that he will no longer harass Cardiff customers. " );
	MOEISAWAYFROMTAVERNE = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AwayFromTaverne");
};


instance DIA_MOE_MOEBOREDFAIL(C_Info)
{
	npc = VLK_432_Moe;
	nr = 1;
	condition = dia_moe_moeboredfail_condition;
	information = dia_moe_moeboredfail_info;
	permanent = FALSE;
	description = " Hey you! We're not done yet. " ;
};


func int dia_moe_moeboredfail_condition()
{
	if((MIS_MOEBORED == LOG_Running) && (MOEBEATME == TRUE) && (MOEATTACKME == TRUE))
	{
		return TRUE;
	};
};

func void dia_moe_moeboredfail_info()
{
	AI_Output(other,self, " DIA_Moe_MoeBoredFail_01_01 " );	// Hey you! We haven't finished yet.
	AI_Output(self,other, " DIA_Moe_MoeBoredFail_01_02 " );	// Back off, sucker! (laughs) Everything you wanted, you have already proved!
	AI_Output(self,other, " DIA_Moe_MoeBoredFail_01_03 " );	// Even women fight better than you!
	AI_Output(self,other, " DIA_Moe_MoeBoredFail_01_05 " );	// Get lost...
	AI_StopProcessInfos(self);
};

