
instance DIA_Stoneguardian_Boss_Exit(C_Info)
{
	npc = Stoneguardian_Boss;
	nr = 999;
	condition = DIA_Stoneguardian_Boss_Exit_Condition;
	information = DIA_Stoneguardian_Boss_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Stoneguardian_Boss_Exit_Condition()
{
	return TRUE;
};

func void DIA_Stoneguardian_Boss_Exit_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_Stoneguardian_Boss_Hello(C_Info)
{
	npc = Stoneguardian_Boss;
	nr = 1;
	condition = DIA_Stoneguardian_Boss_Hello_Condition;
	information = DIA_Stoneguardian_Boss_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Stoneguardian_Boss_Hello_Condition()
{
	if(StoneTitanAwake == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Stoneguardian_Boss_Hello_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_01 " );	// WHO DARE TO DISTURB MY SACRED PEACE?!
	AI_Output(other,self, " DIA_Stoneguardian_Boss_Hello_01_02 " );	// Actually, it was me.
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_03 " );	// How interesting. And what do you want from me, man?
	AI_Output(other,self, " DIA_Stoneguardian_Boss_Hello_01_04 " );	// I want to know about an artifact you once guarded.
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_05 " );	// WHAT?! How do you know this?
	AI_Output(other,self, " DIA_Stoneguardian_Boss_Hello_01_06 " );	// From the records in the magic scroll of the ancients, with the help of which I awakened you.
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_07 " );	// Even if you can read the inscriptions, that doesn't make you worthy of sacred knowledge.
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_08 " );	// For only the chosen one of Adanos can know his wisdom!
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_09 " );	// But I don't think you are.
	AI_Output(other,self, " DIA_Stoneguardian_Boss_Hello_01_10 " );	// So you're still going to tell me about this artifact?
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_11 " );	// And why should I do this?
	AI_Output(other,self, " DIA_Stoneguardian_Boss_Hello_01_12 " );	// Maybe I really am the chosen one of Adanos!
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_13 " );	// Ha ha ha... Don't make me laugh, you pathetic human! It can not be.
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_14 " );	// But if you really think you're one, prove it.
	AI_Output(other,self, " DIA_Stoneguardian_Boss_Hello_01_15 " );	// How?
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_16 " );	// Fight me!
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_17 " );	// Only if you can defeat me will the secret of this sacred artifact be revealed to you!
	AI_Output(self,other, " DIA_Stoneguardian_Boss_Hello_01_18 " );	// Otherwise, you'll just die.
	AI_Output(other,self, " DIA_Stoneguardian_Boss_Hello_01_19 " );	// Well, I didn't count on anything else.
	B_LogEntry(TOPIC_AdanosCrone, " I was able to revive the ancient Guardian, but it did nothing for me. The Guardian refused to tell me about this mysterious artifact. Only by defeating him will I be able to progress further in my quest. " );
	KnowAboutAdVal = TRUE;
};

// ============================Sleeping================== ===============================

instance DIA_Sleeper_Old_Exit(C_Info)
{
	npc = Sleeper_Old;
	nr = 999;
	condition = DIA_Sleeper_Old_Exit_Condition;
	information = DIA_Sleeper_Old_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Sleeper_Old_Exit_Condition()
{
	return TRUE;
};

func void DIA_Sleeper_Old_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Sleeper_Old_Hello(C_Info)
{
	npc = Sleeper_Old;
	nr = 1;
	condition = DIA_Sleeper_Old_Hello_Condition;
	information = DIA_Sleeper_Old_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sleeper_Old_Hello_Condition()
{
	return TRUE;
};

func void DIA_Sleeper_Old_Hello_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_01_01 " );	//Arghhh...(ominously ) WE FINALLY DATE, HUMAN!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_01_02 " );	// How long have I been waiting for this meeting!
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_01_03 " );	// Asleep! I never thought I'd see you here again.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_01_04 " );	// All my senses tell me that the magician who summoned me here is long dead.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_01_05 " );	// I bet you had a hand in this.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_01_06 " );	// Although, however, it no longer matters.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_01_07 " );	// The main thing is that now you are standing in front of me!
	SleeperHello = TRUE;
	B_LogEntry( TOPIC_SLEEPERBACK , " The sleeper has returned to the human world! Looks like this demon is my doom. Now I need to deal with him once and for all, if the opportunity presents itself. " );
	Info_ClearChoices(DIA_Sleeper_Old_Hello);
	Info_AddChoice(DIA_Sleeper_Old_Hello, " Do I really want revenge? " ,DIA_Sleeper_Old_Hello_Battle);
	Info_AddChoice(DIA_Sleeper_Old_Hello, " Why did you wake up the dragons? " ,DIA_Sleeper_Old_Hello_Dragons);
	Info_AddChoice(DIA_Sleeper_Old_Hello, " Who are you anyway? " ,DIA_Sleeper_Old_Hello_WhoYou);
};

func void DIA_Sleeper_Old_Hello_WhoYou()
{
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_WhoYou_01_01 " );	// Who are you anyway?
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_WhoYou_01_02 " );	// You don't look much like the creature Beliar created.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_03 " );	// That's right... (ominously) However, his power helped me to return to this world!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_04 " );	// I am the oldest demon, spawned by the magic of this world in the era of its creation.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_05 " );	// People once worshiped me as you worship your gods now.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_06 " );	// But my time is long gone. And only thanks to the orcs I was again able to be reborn from oblivion.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_07 " );	// But you, pathetic worm, ruined everything then!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_08 " );	// And I was too weak to resist the power of your weapon.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_09 " );	// But now, thanks to Beliar and his servant, I'm ready to appear in this world again!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_10 " );	// And this time you won't take me by surprise.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_11 " );	// I have fully regained my former power, and now I am ready to unleash my wrath on anyone who dares to rebel against my master.
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_WhoYou_01_12 " );	// It turns out that from a mighty demon you turned into another puppet of Beliar.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_WhoYou_01_13 " );	// Say what you want, man! You still don't have long to live...
};

func void DIA_Sleeper_Old_Hello_Dragons()
{
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_Dragons_01_01 " );	// Why did you awaken the dragons?
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Dragons_01_02 " );	// Those you call dragons are as ancient as I am.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Dragons_01_03 " );	// They just couldn't help but hear my call for help!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Dragons_01_04 " );	// But I didn't awaken them... (ominously) They only obey the will of those who actually created them!
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_Dragons_01_05 " );	// Are you talking about Guardians?
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Dragons_01_06 " );	// About them!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Dragons_01_07 " );	// Ancient guardians of the universe, hiding in the shadows, so as not to overshadow the glory of your gods...
};

func void DIA_Sleeper_Old_Hello_Battle()
{
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_Battle_01_01 " );	// Apparently, you want to take revenge on me for that case in the temple.
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Battle_01_02 " );	// Silly to hide it! I want this more than anything!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Battle_01_03 " );	// And what happened last time was just an absurd accident.
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_Battle_01_04 " );	// Well, then don't waste your time on pleasantries.
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_Battle_01_05 " );	// Just like last time, I will send you back to where you crawled into this world from!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Battle_01_06 " );	// (evil laughter) It won't happen again, human!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Battle_01_07 " );	// First I'll crush you, and then your whole miserable little world!
	AI_Output(other,self, " DIA_Sleeper_Old_Hello_Battle_01_08 " );	// Then show me what you can do, slug!
	AI_Output(self,other, " DIA_Sleeper_Old_Hello_Battle_01_09 " );	// Don't worry! You won't have to wait long...
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");
};

instance DIA_XranFreg_Exit(C_Info)
{
	npc = XranFreg;
	nr = 999;
	condition = DIA_XranFreg_Exit_Condition;
	information = DIA_XranFreg_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_XranFreg_Exit_Condition()
{
	return TRUE;
};

func void DIA_XranFreg_Exit_Info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_XranFreg_Hello(C_Info)
{
	npc = XranFreg;
	nr = 1;
	condition = DIA_XranFreg_Hello_Condition;
	information = DIA_XranFreg_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_XranFreg_Hello_Condition()
{
	return TRUE;
};

func void DIA_XranFreg_Hello_Info()
{
	AI_Output(self,other, " DIA_XranFreg_Hello_01_01 " );	// Man, you've come...
	AI_Output(other,self, " DIA_XranFreg_Hello_01_02 " );	// Are you still talking? And I already thought that I would meet another stone blockhead.
	AI_Output(other,self, " DIA_XranFreg_Hello_01_03 " );	// So you are this living stone cliff? Something is not the same size.
	AI_Output(self,other, " DIA_XranFreg_Hello_01_04 " );	// My size doesn't matter, mortal!
	AI_Output(self,other, " DIA_XranFreg_Hello_01_05 " );	// If I want, I can become both a stone rock and a small pebble under your feet.
	AI_Output(self,other, " DIA_XranFreg_Hello_01_06 " );	// But my strength and power will not decrease from this at all.
	AI_Output(other,self, " DIA_XranFreg_Hello_01_07 " );	// Who are you and why are you here?
	AI_Output(self,other, " DIA_XranFreg_Hello_01_08 " );	// The Guardians named me Fregarach, and I am the guardian of the gates of Egesarth.
	AI_Output(other,self, " DIA_XranFreg_Hello_01_09 " );	// And who is Egesart?
	AI_Output(self,other, " DIA_XranFreg_Hello_01_10 " );	// The one behind this gate. You don't need to know more.
	AI_Output(other, self, " DIA_XranFreg_Hello_01_11 " );	// And how do I go further?
	AI_Output(self,other, " DIA_XranFreg_Hello_01_12 " );	// Your road ends here, mortal. Turn back or die.
	AI_Output(other,self, " DIA_XranFreg_Hello_01_13 " );	// You leave me no choice, guardian. I'll still move on!
	AI_Output(self,other, " DIA_XranFreg_Hello_01_15 " );	// You leave me no choice. You can't go further.

	if(MIS_XRANFREG == LOG_Running)
	{
		B_GivePlayerXP(1000);
		B_LogEntry( TOPIC_XRANFREG , " I met the stone giant mentioned in the entries. To tell the truth, he didn't impress me much. Looks can be deceiving, though... " );
	};
};
