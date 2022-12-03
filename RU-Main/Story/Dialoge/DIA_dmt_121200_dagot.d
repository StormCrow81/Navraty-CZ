

instance DMT_121200_DAGOT_EXIT(C_Info)
{
	npc = dmt_121200_dagot;
	condition = dmt_121200_dagot_exit_condition;
	information = dmt_121200_dagot_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
	nr = 999;
};


func int dmt_121200_dagot_exit_condition()
{
	return TRUE;
};

func void dmt_121200_dagot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_121200_DAGOT_TRUESTORY(C_Info)
{
	npc = dmt_121200_dagot;
	condition = dmt_121200_dagot_truestory_condition;
	information = dmt_121200_dagot_truestory_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_121200_dagot_truestory_condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void dmt_121200_dagot_truestory_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_01_01 " );	// So, Beliar's chosen one is dead. Well, that's really impressive!
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_01_02 " );	// Keeper Dagoth?!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_01_03 " );	// (smartly) I'm sure you're surprised by my appearance here. However, I think you yourself are well aware that this kind of thing does not happen unnoticed on our part.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_01_04 " );	// Especially if they were already foreseen by us in advance.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_01_06 " );	// The meaning of your existence has long been forged into the chain of existence of this world. And no one can change that!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_01_07 " );	// But the moment has come when we still need to intervene in the course of ongoing events.
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_01_08 " );	// What do you mean?
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_01_09 " );	// You have already played your part in the fate of this world, and it no longer needs a hero like you.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_01_10 " );	// For everything that was required of you, you have already done, and your continued presence in this world may disrupt the course of the great plan of the Creators!
	MIS_GUARDIANS = LOG_Running;
	ORCCANNOFEAR = TRUE;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry( TOPIC_GUARDIANS , " In the temple of Irdorath, I met Guardian Dagoth! His appearance in this place is a rather strange turn of events... " );
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory, "The Creators ' Grand Design? " ,dmt_121200_dagot_truestory_whatplan);
};

func void dmt_121200_dagot_truestory_whatplan()
{
	var C_Npc demdag1;
	var C_Npc demdag2;
	var C_Npc demdag3;
	var C_Npc demdag4;
	demdag1 = Hlp_GetNpc(demondagot_01);
	demdag2 = Hlp_GetNpc(demondagot_02);
	demdag3 = Hlp_GetNpc(demondagot_03);
	demdag4 = Hlp_GetNpc(demondagot_04);
	demdag1.flags = 0;
	demdag2.flags = 0;
	demdag3.flags = 0;
	demdag4.flags = 0;
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_WhatPlan_01_01 " );	// The Grand Design of the Creators?
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_04 " );	// Yes. This is what will forever change the face of this world and make it the way it should be!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_07 " );	// I think you know that there are three deities in this world - Innos, Adanos and Beliar.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_08 " );	// Endowed with the power and wisdom of the Creators, for many millennia they reign supreme over him, completely determining his future fate.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_09 " );	// Unfortunately, these miserable nonentities have long forgotten their true purpose, which was actually assigned to them by the Creators.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_10 " );	// They turned in the direction of discord among themselves, destroying this beautiful world with their every deed.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_11 " );	// Therefore, we, the Guardians, decided to put an end to all this, in order to protect it from complete destruction.
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_WhatPlan_01_14 " );	// So you want to destroy the gods?!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_15 " );	// And everything they created is mortal. No one and nothing will hide from the wrath of the Creators!
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_WhatPlan_01_16 " );	// But this is crazy! I do not think that the gods themselves will look indifferently at all this.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_17 " );	// (arrogantly) What can they do?! Now these nonentities are too weak to resist us.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_18 " );	// And by the way, it was you who played an important role in this. (laughing) Without even realizing it.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_20 " );	// That was your purpose, chosen one.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_21 " );	// I will not explain to you the whole hidden meaning of your deeds, because I am sure that you yourself will soon understand it ...
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_22 " );	// ...'And a man entered the kingdom of Beliar and killed the beast!'... Do you know these words?!
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_WhatPlan_01_23 " );	// So you mean...?
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_24 " );	// (smartly) You're absolutely right.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_25 " );	// And that's just part of what we Guardians call inevitable! What was supposed to happen will definitely happen.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_26 " );	// As well as the destruction of this world, and its rebirth in the image and likeness of the Creators!
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_WhatPlan_01_27 " );	// What about Innos?
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_28 " );	// His faith in people is his weakness!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_29 " );	// So you don't have to worry about him either. Orcs will take care of it!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_30 " );	// I am sure that soon there will be no one left who could worship him too.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_31 " );	// And then his fate will also be predetermined!
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_WhatPlan_01_32 " );	// Orcs?! So they obey your will?
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_33 " );	// Did you think they were Beliar's creations? (laughing) How foolish of you to think so!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_34 " );	// Orcs are ancient creatures! Their very existence goes far into the past, to the time of the birth of this world.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_35 " );	// Therefore, only we have the power and authority to command them!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_38 " );	// With their iron fists, we will cleanse this world of the human race, and then we will revive it in unprecedented greatness!
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_WhatPlan_01_39 " );	// But there's still Adanos!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_40 " );	// (smartly) Yes. This is the only deity worthy of indulgence.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_WhatPlan_01_41 " );	// However, his power is not strong enough to rule this world alone.
	B_LogEntry( TOPIC_GUARDIANS , " Now everything has become clear to me. The Guardians have conceived absolute madness - to destroy the gods and all life in this world. They believe that the discord between Beliar and Innos has gone too far, and this can finally plunge the world into the darkness of chaos and destruction. " );
	B_LogEntry( TOPIC_GUARDIANS , " They also used me for this purpose! Without realizing it, I carefully and systematically weakened the power of the gods in this world by my actions, and as a result, gave the Guardians the opportunity to carry out their plan. " );
	B_LogEntry( TOPIC_GUARDIANS , " It was the Guardians who were behind the beginning of the bloody war between humans and orcs, which has been going on for many years. Having obeyed the will of their creators, these creatures must now wipe out the entire human race from the face of the earth so that no one can worship the gods anymore! " ) ;
	DAGOTTRUTH_01 = TRUE;
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory, " Now what? " ,dmt_121200_dagot_truestory_askme);
	Info_AddChoice(dmt_121200_dagot_truestory, " What about Xardas? " ,dmt_121200_dagot_truestory_xardas);
};

func void dmt_121200_dagot_truestory_askme()
{
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_AskMe_01_01 " );	// And now what?
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_AskMe_01_02 " );	// I think you understand very well yourself.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_AskMe_01_03 " );	// Your path ends here.
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_AskMe_01_04 " );	// So the Guardians want me dead. Well, it won't be that easy to do!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_AskMe_01_05 " );	// I have no doubt about that. (respectfully) One who has been able to defeat the Beast himself cannot be weak.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_AskMe_01_06 " );	// But you have no idea how strong and powerful we are! You have no chance in this battle.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_AskMe_01_07 " );	// Better accept your fate, chosen one!
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_AskMe_01_08 " );	// We'll see about that later.
	B_LogEntry( TOPIC_GUARDIANS , " Now the Guardians want me dead as well, because they think I'm a threat to them. That was not my plan at all! " );
	DAGOTTRUTH_02 = TRUE;
	if((DAGOTTRUTH_01 == TRUE) && (DAGOTTRUTH_02 == TRUE) && (DAGOTTRUTH_03 == TRUE))
	{
		Info_ClearChoices(dmt_121200_dagot_truestory);
		Info_AddChoice(dmt_121200_dagot_truestory, " Then come and try to kill me! " ,dmt_121200_dagot_truestory_killme);
	};
};

func void dmt_121200_dagot_truestory_xardas()
{
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_Xardas_01_01 " );	// What about Xardas?
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_Xardas_01_02 " );	// Oh yeah... (carelessly) That pathetic mage who thinks he's a god in the flesh!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_Xardas_01_03 " );	// He betrayed us, knowing our true intentions.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_Xardas_01_04 " );	// But rest assured, the wrath of the Makers will punish him, wherever he is.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_Xardas_01_05 " );	// No one will escape the punishment of the Creators!
	B_LogEntry( TOPIC_GUARDIANS , " Dagoth said a few words about Xardas. It seems that he understood what the Guardians are up to and what it threatens, hastening to move away from all this. However, the question remains what Xardas was doing in the Halls of the Beast and what really happened there. .. " );
	DAGOTTRUTH_03 = TRUE;
	if((DAGOTTRUTH_01 == TRUE) && (DAGOTTRUTH_02 == TRUE) && (DAGOTTRUTH_03 == TRUE))
	{
		Info_ClearChoices(dmt_121200_dagot_truestory);
		Info_AddChoice(dmt_121200_dagot_truestory, " Then come and try to kill me! " ,dmt_121200_dagot_truestory_killme);
	};
};

func void dmt_121200_dagot_truestory_killme()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Snd_Play("DEM_WARN01");
	AI_Output(other,self, " DMT_121200_Dagot_TrueStory_KillMe_01_01 " );	// Then come and try to kill me!
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_KillMe_01_02 " );	// Are you in a hurry to die?! Then this will end our conversation.
	AI_Output(self,other, " DMT_121200_Dagot_TrueStory_KillMe_01_03 " );	// My servants will take care of you... (smartly) Farewell, chosen one!
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory,Dialog_Ende,dmt_121200_dagot_truestory_killmeext);
};

func void dmt_121200_dagot_truestory_killmeext()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = TRUE ;
	DAGOTTELLALL = TRUE;
};

