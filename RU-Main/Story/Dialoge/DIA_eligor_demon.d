

instance DIA_ELIGOR_DEMON_EXIT(C_Info)
{
	npc = eligor_demon;
	nr = 999;
	condition = dia_eligor_demon_exit_condition;
	information = dia_eligor_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_eligor_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_eligor_demon_exit_info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
};


instance DIA_ELIGOR_DEMON_HELLO(C_Info)
{
	npc = eligor_demon;
	nr = 1;
	condition = dia_eligor_demon_hello_condition;
	information = dia_eligor_demon_hello_info;
	important = TRUE;
};


func int dia_eligor_demon_hello_condition()
{
	return TRUE;
};

func void dia_eligor_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_00 " );	// No more demons will come to your call, human. The rune has lost its power.
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_01 " );	// You yourself understand everything perfectly ... (growls)
	AI_Output(other,self, " DIA_Eligor_Demon_Hello_01_02 " );	// So you are the great Eligor, master of Lang's Demon Legion. And you make an impression!
	AI_Output(other,self, " DIA_Eligor_Demon_Hello_01_03 " );	// Let me ask you a question - why did you come to me yourself?
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_04 " );	// I have come to your call to offer you one thing that might interest you, human.
	AI_Output(other,self, " DIA_Eligor_Demon_Hello_01_05 " );	// What exactly do you want me to offer?
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_06 " );	// You must have already convinced yourself of the power of the Legion and that the demons of Lang are unmatched in strength and power!
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_07 " );	// You can continue to use the services of the demons of my legion. But on one condition...
	AI_Output(other,self, " DIA_Eligor_Demon_Hello_01_08 " );	// What is this condition?
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_09 " );	// Every time you want to summon one of the demons, you'll have to sacrifice a small amount of your life force.
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_10 " );	// Agree, not a very big price compared to the power that you will be bestowed!
	AI_Output(other,self, " DIA_Eligor_Demon_Hello_01_11 " );	// Isn't the price too high for your services?!
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_12 " );	// My business is only to suggest. The decision is yours to make.
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_13 " );	// Think, after that you will be able to use the services of the Legion as many times as you want.
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_14 " );	// And remember: I only betray this once. So think carefully before giving your answer.
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_15 " );	// So, what's your choice, human?
	Info_ClearChoices(dia_eligor_demon_hello);
	Info_AddChoice(dia_eligor_demon_hello, " Consider that we have agreed. " ,dia_eligor_demon_hello_ok);
	Info_AddChoice(dia_eligor_demon_hello, " The fee is too high. " ,dia_eligor_demon_hello_no);
};

func void dia_eligor_demon_hello_ok()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	AI_Output(other,self, " DIA_Eligor_Demon_Hello_01_16 " );	// Consider that we have agreed.
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_17 " );	// I didn't expect anything else. Now Lang's demons are at your complete disposal.
	AI_StopProcessInfos(self);
	ELIGOR_FOREVER = TRUE;
	ELIGOR_TALK = TRUE;
	ELIGORSUM01 = FALSE;
	ELIGORSUM02 = FALSE;
	ELIGORSUM03 = FALSE;
	ELIGORSUM04 = FALSE;
	ELIGORSUM05 = FALSE;
	ELIGORSUM06 = FALSE;
	ELIGORSUM07 = FALSE;
	ELIGORSUM08 = FALSE;
	ELIGORSUM09 = FALSE;
	ELIGORSUM10 = FALSE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

func void dia_eligor_demon_hello_no()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self, " DIA_Eligor_Demon_Hello_01_18 " );	// Too high a fee, Eligor.
	AI_Output(self,other, " DIA_Eligor_Demon_Hello_01_19 " );	// As you say, man. Our conversation is over! Goodbye.
	AI_StopProcessInfos(self);
	ELIGOR_TALK = TRUE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

// --------------------------------------------- Eligor 7 chapters ----------------------------------------------------- -------

instance DIA_ELIGOR_DEMON_OW_EXIT(C_Info)
{
	npc = eligor_demon_ow;
	nr = 999;
	condition = dia_eligor_demon_ow_exit_condition;
	information = dia_eligor_demon_ow_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_eligor_demon_ow_exit_condition()
{
	return TRUE;
};

func void dia_eligor_demon_ow_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ELIGOR_DEMON_OW_HELLO(C_Info)
{
	npc = eligor_demon_ow;
	nr = 1;
	condition = dia_eligor_demon_ow_hello_condition;
	information = dia_eligor_demon_ow_hello_info;
	important = TRUE;
};

func int dia_eligor_demon_ow_hello_condition()
{
	return TRUE;
};

func void dia_eligor_demon_ow_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_01 " );	// WHO CALLED TO ME? WHO DARE TO DISTURB MY PEACE?!
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_02 " );	// I called you.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_03 " );	// Your face seems familiar to me, mortal.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_04 " );	// Of course, now I remember you.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_05 " );	// You are the one who slew the chosen one of Beliar in the Halls of Irdorath!
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_06 " );	// In my opinion, this act is really worthy of respect.
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_07 " );	// I sent a lot of Beliar's minions to the next world.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_08 " );	// However, not all of them were as powerful as that dragon!
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_09 " );	// But enough of the idle chatter...(growls) Say what you want?
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_10 " );	// I need the Demon Crown! Will you give it to me?
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_11 " );	// Why would I do this, mortal?

	if(HasSleeperDefence == 1)
	{
		AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_12 " );	// But you got the Sleeper's mask! Is not it?
	}
	else if(HasSleeperDefence == 2)
	{
		AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_13 " );	// But you got the Crown of Ice! Is not it?
	}
	else if(HasSleeperDefence == 3)
	{
		AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_14 " );	// But you got the Eye of Innos! Is not it?
	}
	else
	{
		AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_99 " );	// But you got something! Is not it?
	};

	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_15 " );	// Now I want to get that artifact instead of mine!
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_16 " );	// (laughs) You're wrong, mortal.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_17 " );	// It was only a payment for the fact that you now have the opportunity to speak with me.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_18 " );	// No more than that. Tell me why you need my artifact?
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_19 " );	// He will help me defeat the oldest of the demons of this world - the Sleeper!
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_20 " );	// (thoughtfully) So that's it! It's all about him.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_21 " );	// He was once as powerful as I am! But now he is no match for me.
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_22 " );	// You - maybe. And I can’t even approach him because of his magic.
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_23 " );	// That's why I ask you for the Crown of Demons.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_24 " );	// Of course... (laughs) I didn't think of it right away.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_25 " );	// However, you must understand that I will not give it away just like that. You will have to pay for it.
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_26 " );	// And how much gold do you need?
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_27 " );	// Gold doesn't interest me at all. You will pay me with your life!
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_28 " );	// Are you going to kill me?
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_29 " );	// No. (laughs) I'll just take half of your life energy away from you.
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_01_30 " );	// Hmmm... Is there another way?
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_31 " );	// I'm not going to bargain with you, mortal!
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_01_32 " );	// Either you accept my terms or we'll end this conversation.
	Info_ClearChoices(DIA_Eligor_Demon_OW_Hello);
	Info_AddChoice(DIA_Eligor_Demon_OW_Hello, " Okay. Take my life force. " ,DIA_Eligor_Demon_OW_Hello_Health);
};

func void DIA_Eligor_Demon_OW_Hello_Health()
{
	var int HalfLife;

	HalfLife = hero.attribute[ATR_HITPOINTS_MAX] / 2;
	EligorPrice = hero.attribute[ATR_HITPOINTS_MAX] / 2;
	AI_Wait(self,4);
	Snd_Play("MYSTERY_04");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
	B_RaiseAttributeQuet(hero,ATR_HITPOINTS_MAX,-HalfLife);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,ATR_HITPOINTS_MAX);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_Health_01_01 " );	// Well then. A deal is a deal! The Crown of Demons is now yours.
	B_GiveInvItems(self,other,ItAr_Helm_G3_06,1);
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_Health_01_02 " );	// I hope you haven't regretted the decision you made yet.
	AI_Output(other,self, " DIA_Eligor_Demon_OW_Hello_Health_01_03 " );	// What's done is done.
	AI_Output(self,other, " DIA_Eligor_Demon_OW_Hello_Health_01_04 " );	// As you say, man. Our meeting is over... goodbye.
	B_LogEntry( TOPIC_SLEEPERBACK , " Eligor demanded some of my life force from me. I had no choice. I had to get his artifact by all means! " );
	AI_StopProcessInfos(self);
	ELIGOR_OW_TALK = TRUE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

// -----------------------ghost of the lighthouse----------------- -

instance DIA_Skeleton_Stefan_EXIT(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 999;
	condition = DIA_Skeleton_Stefan_EXIT_condition;
	information = DIA_Skeleton_Stefan_EXIT_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Skeleton_Stefan_EXIT_condition()
{
	return TRUE;
};

func void DIA_Skeleton_Stefan_EXIT_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Skeleton_Stefan_Hello(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_Hello_condition;
	information = DIA_Skeleton_Stefan_Hello_info;
	important = TRUE;
};

func int DIA_Skeleton_Stefan_Hello_condition()
{
	if(MIS_HauntedLighthouse == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Skeleton_Stefan_Hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_00 " );	// What brings you here, mortal? What are you looking for?
	AI_Output(other,self, " DIA_Skeleton_Stefan_Hello_01_01 " );	// Hmmm... So the rumors are not fiction. This lighthouse is actually haunted!
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_02 " );	// You were not deceived. It's really true. Now answer my question.
	AI_Output(other,self, " DIA_Skeleton_Stefan_Hello_01_03 " );	// I'm looking for Stefan, the lighthouse keeper. He was killed here many years ago.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_04 " );	// Why do you need it?
	AI_Output(other,self, " DIA_Skeleton_Stefan_Hello_01_05 " );	// I want to remove the curse from this place, so I need to know about everything that happened here.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_06 " );	// I'm surprised by your desire, mortal. Usually the living try to avoid this place.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_07 " );	// And you came here and you say you want to help me.
	AI_Output(other,self, " DIA_Skeleton_Stefan_Hello_01_08 " );	// So you are Stefan? Then tell me why you were killed - and, most importantly, for what?
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_09 " );	// For my kindness and excessive compassion for people. It looks like that was the whole problem.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_10 " );	// I once helped a man in need. For this he repaid me by taking my life.
	AI_Output(other,self, " DIA_Skeleton_Stefan_Hello_01_11 " );	// Who is this person?
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_12 " );	// I don't know his real name. He asked to be called Kelevra.
	AI_Output(other,self, " DIA_Skeleton_Stefan_Hello_01_13 " );	// Kelevra? More like a nickname. Maybe even pirated.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_14 " );	// I think he was a pirate. At least he had a pirate sword with him.
	AI_Output(other,self, " DIA_Skeleton_Stefan_Hello_01_15 " );	// And how did he even get to the lighthouse?
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_16 " );	// There was a big storm on the sea that day. I climbed to the top tier of the lighthouse to add some fuel to the fire, and then I saw his body washed up on the shore by the waves.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_17 " );	// Apparently, his ship sank. I picked up his almost lifeless body and carried it to the lighthouse.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_18 " );	// It took him a long time to come to his senses. I had to swim to town several times to get medicine because he had a fever. But in the end he got better.
	AI_Output(other,self, " DIA_Skeleton_Stefan_Hello_01_19 " );	// And what happened next?
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_20 " );	// One day he said he was leaving and he needed my boat.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_21 " );	// But I couldn't give him the boat because I needed it myself. And I offered to take him to Khorinis.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_22 " );	// At that moment, it seemed to me that he was a little tense and nervous.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_23 " );	// He suggested that I go upstairs to show him the best place to land him on the shore.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_24 " );	// And when we got up, he stabbed me with his saber, saying that one way or another he needed the boat himself.
	AI_Output(self,other, " DIA_Skeleton_Stefan_Hello_01_25 " );	// He left, leaving me to die in a pool of my own blood...
	B_LogEntry(TOPIC_HauntedLighthouse, " The ghost of Stefan, who lived at the lighthouse, told me the story of his death. He was killed by a certain Kelevra, who must have been a pirate. " );
};

instance DIA_Skeleton_Stefan_How(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_How_condition;
	information = DIA_Skeleton_Stefan_How_info;
	permanent = FALSE;
	description = " How can I remove the curse from this place? " ;
};

func int DIA_Skeleton_Stefan_How_condition()
{
	return TRUE;
};

func void DIA_Skeleton_Stefan_How_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(other,self, " DIA_Skeleton_Stefan_How_01_00 " );	// How to remove the curse from this place? I am sure that many in Khorinis would like to return this lighthouse back.
	AI_Output(self,other, " DIA_Skeleton_Stefan_How_01_01 " );	// They already have a new one. Why do they need another one?
	AI_Output(other,self, " DIA_Skeleton_Stefan_How_01_02 " );	// I don't know. But ghosts have no place among people. You must understand this.
	AI_Output(self,other, " DIA_Skeleton_Stefan_How_01_03 " );	// I understand you. But I can't help. I'm sorry...
	DealStoryDLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse, " Looks like I need Xardas' help again. He must know how to remove the curse from this lighthouse. " );
	AI_StopProcessInfos(self);
};

instance DIA_Skeleton_Stefan_FinalMeet(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_FinalMeet_condition;
	information = DIA_Skeleton_Stefan_FinalMeet_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Skeleton_Stefan_FinalMeet_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (JackMeetLHGhost == TRUE) && (Npc_GetDistToWP(hero,"NW_SOUL_LH_01") <= 600) && (Npc_GetDistToWP(VLK_444_Jack,"NW_SOUL_LH_01") <= 600))
	{
		return TRUE;
	};
};

func void DIA_Skeleton_Stefan_FinalMeet_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(250);
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_00 " );	// You came to see me again, mortal. And this time not alone...
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_01_01 " );	// Do you recognize my companion?
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_02 " );	// I know. Although he has aged a lot during this time.
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_01_03 " );	// Jack has come to ask your forgiveness for his crime.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_04 " );	// You don't have to continue, mortal. I know why he is here. I felt it as soon as he sailed here.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_05 " );	// I didn't think he'd have the courage to come here.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_06 " );	// But since he's here... I guess we'll have something in common with him. For now, light the flame at the lighthouse.
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_01_07 " );	// Why should I do this?
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_08 " );	// So you want to rid this place of the curse, or not?
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_09");	//Хочу, но...
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_10 " );	// (interrupts) Then listen and do what you're told!
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_11 " );	// The presence of this person here and the power of the curse associated with him will soon attract the rest of the ghosts here.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_12 " );	// And the lighthouse flame will stop them for a while! Therefore, you must go upstairs and light the beacon.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_01_13 " );	// And hurry up, they're getting closer...
	JackMeetGhost = TRUE;
	Info_ClearChoices(DIA_Skeleton_Stefan_FinalMeet);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet, " Then you should promise me something, ghost. " ,DIA_Skeleton_Stefan_FinalMeet_Promise);
	};

	Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet, " No, I won't. " ,DIA_Skeleton_Stefan_FinalMeet_No);
	Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet, " Ok, I'll rock it now. " ,DIA_Skeleton_Stefan_FinalMeet_Yes);
};

func void DIA_Skeleton_Stefan_FinalMeet_Promise()
{
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_Promise_01_00 " );	// Then you have to promise me something, ghost.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_Promise_01_01 " );	// What are you talking about?
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_Promise_01_02 " );	// As long as I'm upstairs, Jack must not die. Enough already and the blood that was once shed here.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_Promise_01_03 " );	// The dead are not responsible to the living, mortal!
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_Promise_01_04 " );	// Swear he won't die! Otherwise, you will be damned until the end of time.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_Promise_01_05 " );	// Okay...(calmly) I promise you he won't die.
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_Promise_01_06 " );	// That's better.
	JackDontDie = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse, " The ghost promised me not to kill Jack. I hope he keeps his word... " );
};

func void DIA_Skeleton_Stefan_FinalMeet_No()
{
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_No_01_00 " );	// No, I won't.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_No_01_01 " );	// As you say, mortal. I'm sorry, but then you're all going to die here...
	AI_StopProcessInfos(self);
	LeaveMeetGhost = TRUE;
	StefanCanFight = TRUE;
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	VLK_444_Jack.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	B_StartOtherRoutine(VLK_444_Jack,"JackFight");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_03");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_04");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_05");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_06");
};

func void DIA_Skeleton_Stefan_FinalMeet_Yes()
{
	AI_Output(other,self, " DIA_Skeleton_Stefan_FinalMeet_Yes_01_00 " );	// Okay, I'll light it up now.
	AI_Output(self,other, " DIA_Skeleton_Stefan_FinalMeet_Yes_01_01 " );	// Then don't hesitate.
	VLK_444_Jack.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	LeaveMeetGhost = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JackTalk");
	B_StartOtherRoutine(VLK_444_Jack,"JackTalk");
};
