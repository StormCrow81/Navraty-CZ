instance DIA_Ass_131_Adept_EXIT (C_Info)
{
	npc = Ass_131_Adept;
	nr = 999 ;
	condition = DIA_Ass_131_Adept_exit_condition;
	information = DIA_Ass_131_Adept_exit_info;
	permanent = TRUE ;
	description = Dialog_Ende;
};

func int DIA_Ass_131_Adept_exit_condition ()
{
	return  TRUE ;
};

func void DIA_Ass_131_Adept_exit_info ()
{
	AI_StopProcessInfos (self);
};

instance DIA_Ass_131_Adept_WithSlave (C_Info)
{
	npc = Ass_131_Adept;
	nr = 2 ;
	condition = DIA_Ass_131_Adept_WithSlave_Condition;
	information = DIA_Ass_131_Adept_WithSlave_Info;
	permanent = FALSE ;
	important = TRUE ;
};

func int DIA_Ass_131_Adept_WithSlave_Condition ()
{
	if ((PW_WelcomeToHram ==  TRUE ) && (Npc_IsDead ( SEK_168_SLAVEOBSSEK ) ==  FALSE ) && ( SEK_168_SLAVEOBSSEK .aivar [ AIV_PARTYMEMBER ] ==  TRUE ) && (MeetNrozas ==  FALSE ))
	{
		return  TRUE ;
	};
};

func void DIA_Ass_131_Adept_WithSlave_Info ()
{
	AI_Output (self, other, " DIA_Ass_131_Adept_WithSlave_01_01 " );	// Why is it taking so long, novice ?! Master Nrozas is waiting for his new slave.
	AI_Output (self, other, " DIA_Ass_131_Adept_WithSlave_01_02 " );	// Take him to him immediately if you don’t want to know his anger!
	PW_AdepdGuardTellInfo = TRUE ;
	AI_StopProcessInfos (self);
};

instance DIA_Ass_131_Adept_NoSlave (C_Info)
{
	npc = Ass_131_Adept;
	nr = 2 ;
	condition = DIA_Ass_131_Adept_NoSlave_Condition;
	information = DIA_Ass_131_Adept_NoSlave_Info;
	permanent = FALSE ;
	important = TRUE ;
};

func int DIA_Ass_131_Adept_NoSlave_Condition ()
{
	if ((PW_WelcomeToHram ==  TRUE ) && (Npc_IsDead ( SEK_168_SLAVEOBSSEK ) ==  TRUE ) && ( SEK_168_SLAVEOBSSEK .aivar [ AIV_PARTYMEMBER ] ==  FALSE ) && (MeetNrozas ==  FALSE ))
	{
		return  TRUE ;
	};
};

func void DIA_Ass_131_Adept_NoSlave_Info ()
{
	AI_Output (self, other, " DIA_Ass_131_Adept_NoSlave_01_01 " );	// What's taking so long, novice ?!
	AI_Output (self, other, " DIA_Ass_131_Adept_NoSlave_01_02 " );	// And why are you without a slave to bring to Master Nrozas?
	AI_Output (other, self, " DIA_Ass_131_Adept_NoSlave_01_03 " );	// Ummm ... I lost it.
	AI_Output (self, other, " DIA_Ass_131_Adept_NoSlave_01_04 " );	// What ?! (staring intently) Something tells me that you are not at all who you say you are.
	AI_Output (self, other, " DIA_Ass_131_Adept_NoSlave_01_05 " );	// ... brothers, we have an uninvited guest here!
	PW_AdepdGuardTellInfo = TRUE ;
	AI_StopProcessInfos (self);
	PlayerIsPrioratFakeTemp = TRUE ;
};


instance DIA_Ass_131_Adept_NrozasPoisonGift (C_Info)
{
	npc = Ass_131_Adept;
	nr = 2 ;
	condition = DIA_Ass_131_Adept_NrozasPoisonGift_Condition;
	information = DIA_Ass_131_Adept_NrozasPoisonGift_Info;
	permanent = FALSE ;
	important = TRUE ;
};

func int DIA_Ass_131_Adept_NrozasPoisonGift_Condition ()
{
	if ((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift ==  FALSE ))
	{
		return  TRUE ;
	};
};

func void DIA_Ass_131_Adept_NrozasPoisonGift_Info ()
{
	AI_Output (self, other, " DIA_Ass_131_Adept_NrozasPoisonGift_01_01 " );	// Brother, Prior Haniar urgently wanted to see you.
	AI_Output (self, other, " DIA_Ass_131_Adept_NrozasPoisonGift_01_02 " );	// So don't waste his time and go to him immediately!
	AI_StopProcessInfos (self);
};

instance DIA_Ass_131_Adept_STANDARD (C_Info)
{
	npc = Ass_131_Adept;
	nr = 2 ;
	condition = DIA_Ass_131_Adept_STANDARD_Condition;
	information = DIA_Ass_131_Adept_STANDARD_Info;
	permanent = TRUE ;
	important = TRUE ;
};


func int DIA_Ass_131_Adept_STANDARD_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk) && (PW_AdepdGuardTellInfo ==  TRUE ))
	{
		return  TRUE ;
	};
};

func void DIA_Ass_131_Adept_STANDARD_Info ()
{
	var int randy;

	randy = Hlp_Random ( 4 );

	if (PlayerIsAssNow ==  FALSE )
	{
		PlayerIsPrioratFakeTemp = TRUE ;
		AI_Output (self, other, " DIA_ASS_1_STANDARD_01_04 " );	// Hey! You're not one of our people ...
		AI_Output (self, other, " DIA_ASS_1_STANDARD_01_05 " );	// Alarm! Enemy!
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_KILL , 1 );
	}
	else
	{
		if (randy ==  0 )
		{
			AI_Output (self, other, " DIA_ASS_1_STANDARD_01_00 " );	// Better leave! Otherwise, there will be trouble ...
		};	
		if (randy ==  1 )
		{
			AI_Output (self, other, " DIA_ASS_1_STANDARD_01_01 " );	// Don't bother me!
		};
		if (randy ==  2 )
		{
			AI_Output (self, other, " DIA_ASS_1_STANDARD_01_02 " );	// Get out of here!
		};
		if (randy ==  3 )
		{
			AI_Output (self, other, " DIA_ASS_1_STANDARD_01_03 " );	// Not now!
		};
		
		AI_StopProcessInfos (self);
	};
};
