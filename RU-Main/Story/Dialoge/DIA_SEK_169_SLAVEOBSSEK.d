
instance DIA_SEK_169_SLAVEOBSSEK_EXIT(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 999;
	condition = dia_SEK_169_SLAVEOBSSEK_exit_condition;
	information = dia_SEK_169_SLAVEOBSSEK_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_169_SLAVEOBSSEK_exit_condition()
{
	return TRUE;
};

func void dia_SEK_169_SLAVEOBSSEK_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SEK_169_SLAVEOBSSEK_HALLO(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_hallo_condition;
	information = dia_SEK_169_SLAVEOBSSEK_hello_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_SEK_169_SLAVEOBSSEK_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KnowWhoRebels == FALSE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_hallo_info()
{
	be int randy;

	randy = Hlp_Random( 3 );

	if(randy == 0)
	{
		AI_Output(self,other, " DIA_SEK_169_STANDARD_13_00 " );	// Leave me alone!
	};
	if(randy == 1)
	{
		AI_Output(self,other, " DIA_SEK_169_STANDARD_13_01 " );	// What do you want from me? Leave me alone!
	};
	if(randy == 2)
	{
		AI_Output(self,other, " DIA_SEK_169_STANDARD_13_02 " );	// We're all going to die here!
	};

	AI_StopProcessInfos(self);
};


instance DIA_SEK_169_SLAVEOBSSEK_REBELS(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_REBELS_condition;
	information = dia_SEK_169_SLAVEOBSSEK_REBELS_info;
	permanent = FALSE;
	description = " I heard you're planning an escape. " ;
};

func int dia_SEK_169_SLAVEOBSSEK_REBELS_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (KnowWhoRebels == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_REBELS_info()
{
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_01 " );	// I heard you're planning an escape.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_02 " );	// You're confusing something. I didn't do anything like that.
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_03 " );	// Undoing is pointless! One of the slaves betrayed you.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_04 " );	// Damn! I knew this would happen someday. (viciously) Well, what do you want from me?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_05 " );	// I just want to help.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_06 " );	// You? (surprised) And why would an acolyte of the Shadows suddenly help the slaves?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_07 " );	// (lowering mask) The Namib Idol and the other Gurus are very concerned about the recent loss of novices.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_08");	//Идол Намиб?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_09 " );	// (surprised) So you're from...
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_10 " );	// No need for extra words. I think you understood everything perfectly.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_REBELS_01_11 " );	// Well, if that's the case...(puzzled) Then maybe you can be trusted.
	B_LogEntry(TOPIC_RebelSlave, " I found Marius. Apparently, he really is plotting a rebellion against his masters, and I, being on his side, decided to help him with this. But the question arises: what should I say to Osair then? " );
	RebelsTrust = TRUE;
};

instance DIA_SEK_169_SLAVEOBSSEK_RebelsTrust(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_condition;
	information = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_info;
	permanent = FALSE;
	description = " Tell me what you're up to. " ;
};

func int dia_SEK_169_SLAVEOBSSEK_RebelsTrust_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (RebelsTrust == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_RebelsTrust_info()
{
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_01 " );	// Tell me what you're up to.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_02 " );	// First we need a weapon... (quietly) That's the main thing.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_03 " );	// Without him, there's little we can do against the well-trained fighters of Masyaf.
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_04 " );	// In my opinion, it will not help you. Any of the Masyaf fighters will easily kill you all.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_05 " );	// Eh... (sighing) To be honest, I know that myself.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_06 " );	// But without a weapon, hardly any of the slaves will want to oppose the Shadows.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_07 " );	// And without this, the very idea of ​​escaping is simply impossible.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_08 " );	// If we have a chance to defeat them, then only together and together!
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_09 " );	// I understand. Have you already tried to get a weapon?
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_10 " );	// I tried, but it's not so easy to do. I am constantly being followed.
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_11 " );	// Maybe I should try and get it for you then?
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_12 " );	// (thoughtfully) Can you?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_13 " );	// I'll try. It will be easier for me to do this than for you.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_14 " );	// Good! Then we need at least three bundles of weapons.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_15 " );	// I guess that's enough to arm us all.
	MIS_RebelsWeapon = LOG_Running;
	Log_CreateTopic(TOPIC_RebelsWeapon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RebelsWeapon,LOG_Running);
	B_LogEntry(TOPIC_RebelsWeapon, " Marius asked me to get three bundles of weapons to arm the slaves. " );
};

instance DIA_SEK_169_SLAVEOBSSEK_OsairNeed(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_OsairNeed_condition;
	information = dia_SEK_169_SLAVEOBSSEK_OsairNeed_info;
	permanent = FALSE;
	description = " Osair demands the head of the instigator. " ;
};

func int dia_SEK_169_SLAVEOBSSEK_OsairNeed_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (RebelsTrust == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_OsairNeed_info()
{
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_01 " );	// Osair demands the head of the instigator.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_02 " );	// Not surprising. All the slaves have been acting very nervous and agitated lately.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_03 " );	// And all because of the fact that I constantly try to instill in them the hope of salvation.
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_04 " );	// And how can we be then?
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_05 " );	// Why don't you just tell him you didn't find one?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_06 " );	// Not sure if this will work. Osair is not stupid enough to believe it.
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_07 " );	// And he probably won't rest until he finds you.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_08 " );	// Then what do you suggest?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_09 " );	// What if the person who betrayed you becomes that person?
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_11 " );	// I don't even know what to say to you...
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_12 " );	// Don't you think that this would be too cruel a punishment for his act?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_13 " );	// Well, if you care so much about him, I can tell Osair about you. And then...
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_14 " );	// Okay, okay... (excitedly) You don't have to continue.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_15 " );	// Good. Let it remain on my conscience, but our business is much more important.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_16 " );	// We'll all be much better off if Osair thinks he's done with the conspirator.
	BetrayFound = TRUE;
	B_LogEntry(TOPIC_RebelSlave, " Marius and I decided to give Osair the slave who betrayed him. Thus, all suspicions will be removed from him, and Osair, having dealt with the instigator, will calm down and lose his vigilance. " );
};

instance DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_condition;
	information = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_info;
	permanent = FALSE;
	description = " There are three bundles of weapons here. " ;
};

func int dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_condition()
{
	if((MIS_RebelsWeapon == LOG_Running) && (Npc_HasItems(other,ItSe_Weapon_Sack) >= 3))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_01 " );	// There are three bundles of weapons here.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_02 " );	// Hush, hush... (whispering) Give them faster.
	B_GiveInvItems(other,self,ItSe_Weapon_Sack,3);
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_03 " );	// I'll hide them somewhere safe until we're ready.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_04 " );	// Thanks for the help.
	MIS_RebelsWeapon = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RebelsWeapon,LOG_SUCCESS);
	B_LogEntry(TOPIC_RebelsWeapon, " I brought Marius three bundles of weapons. " );
};

instance DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Death(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 2;
	condition = dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_condition;
	information = dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_info;
	permanent = FALSE;
	description = " The traitor got what he deserved. " ;
};

func int dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_condition()
{
	if((MIS_RebelSlave == LOG_SUCCESS) && (Npc_IsDead(SEK_156_SLAVEOBSSEK) == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_01 " );	// The traitor got what he deserved.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_02 " );	// (sympathetically) I hope he didn't suffer for long?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_03 " );	// No. Osair finished him off with one blow.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_04 " );	// You know, I kind of feel bad about this.
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_05 " );	// Calm down. But now you can safely prepare your escape, and no one will suspect you.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_06 " );	// I hope you're right and this sacrifice was not in vain.
	AI_StopProcessInfos(self);
};

instance DIA_SEK_169_SLAVEOBSSEK_WhenRun(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_WhenRun_condition;
	information = dia_SEK_169_SLAVEOBSSEK_WhenRun_info;
	permanent = FALSE;
	description = " When did you decide to escape? " ;
};

func int dia_SEK_169_SLAVEOBSSEK_WhenRun_condition()
{
	if(MIS_RebelsWeapon == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_WhenRun_info()
{
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_01 " );	// When did you decide to escape?
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_02 " );	// Don't know yet. But I don't think it's worth the hassle.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_03 " );	// Otherwise, we'll all die here from hunger... or from beatings.
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_04 " );	// I just have bad news for you.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_05 " );	// What else is this?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_06 " );	// The only passage out of the valley was blocked by rockfall. So if I were you, I wouldn't be in a hurry to escape.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_08 " );	// Are you serious? Damn. This was not at all in my plans.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_09 " );	// But wait, then how come the Shadows keep leaving the valley and coming back with new slaves?
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_10 " );	// I have yet to find out. But until we find out, you should not start anything serious.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_12 " );	// Yes, you're right. OK. I need to work.
	AI_Output(self,other, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_13 " );	// If the Shadows see me talking instead of sweeping the floor, they'll beat me half to death.
	AI_Output(other,self, " DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_14 " );	// Okay, see you later.
	AI_StopProcessInfos(self);
};
