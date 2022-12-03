
instance DIA_SEK_156_SLAVEOBSSEK_EXIT(C_Info)
{
	npc = SEK_156_SLAVEOBSSEK;
	nr = 999;
	condition = dia_SEK_156_SLAVEOBSSEK_exit_condition;
	information = dia_SEK_156_SLAVEOBSSEK_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_156_SLAVEOBSSEK_exit_condition()
{
	return TRUE;
};

func void dia_SEK_156_SLAVEOBSSEK_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEK_156_SLAVEOBSSEK_HALLO(C_Info)
{
	npc = SEK_156_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_156_SLAVEOBSSEK_hallo_condition;
	information = dia_SEK_156_SLAVEOBSSEK_hello_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_SEK_156_SLAVEOBSSEK_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_SEK_156_SLAVEOBSSEK_hallo_info()
{
	be int randy;

	randy = Hlp_Random( 3 );

	if((MIS_RebelSlave == LOG_Running) && (FindMistake == FALSE) && (KnowWhoRebels == FALSE))
	{
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_01 " );	// If I don't get out of this place, I'll probably die!
		FindMistake = TRUE;
		AI_StopProcessInfos(self);
	}
	else if((MIS_RebelSlave == LOG_Running) && (PW_BetrayFollowMe == FALSE) && (BetrayFound == TRUE))
	{
		AI_Output(other,self, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_02 " );	// Hey you! Follow me immediately. Osair himself wants to see you!
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_03 " );	// (fearful) Osair? May I know why?
		AI_Output(other,self, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_04 " );	// He just wants to personally thank you for helping us catch the conspirator.
		AI_Output(other,self, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_05 " );	// Just don't try to open your mouth in front of him! Otherwise, I will personally close it.
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_06 " );	// Okay, okay. I'm going.
		PW_BetrayFollowMe = TRUE;
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"OsairReady");
	}
	else if((MIS_RebelSlave == LOG_Running) && (PW_BetrayFollowMe == TRUE) && (BetrayFound == TRUE))
	{
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_07 " );	// I'm going, I'm going...
		AI_StopProcessInfos(self);
	}
	else if((MIS_RebelSlave == LOG_Running) && (FindMistake == TRUE) && (KnowWhoRebels == FALSE))
	{
		B_GivePlayerXP(150);
		AI_Output(other,self, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_08 " );	// Hey! What makes you think you can even get out of here?
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_09 " );	// Ummm...(pauses) Never mind. It's me, just... Thoughts out loud.
		AI_Output(other,self, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_10 " );	// Come on, post everything you know!
		AI_Output(other,self, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_11 " );	// Otherwise, I'll have Osaira's bodyguards deal with you personally.
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_12 " );	// Okay, okay... (cowardly) I'll tell you everything. Just don't tell the guards about it.
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_13 " );	// It's all Marius! He constantly talks about how he is preparing an escape.
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_14 " );	// And encourages us to revolt against the people of Masyaf.
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_15 " );	// He even volunteered to work at the temple to try and get weapons for us.
		AI_Output(self,other, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_16 " );	// And I don't know anything else...
		AI_Output(other,self, " DIA_SEK_156_SLAVEOBSSEK_HALLO_01_17 " );	// I hope you didn't lie. Otherwise it will be worse.
		B_LogEntry(TOPIC_RebelSlave, " I think I've hit the trail. One of the slaves let slip that Slave Marius was plotting a breakout and inciting the others to mutiny against the guards. I guess he should be checked first before reporting this to Osair. " );
		KnowWhoRebels = TRUE;
		MariusIns = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_169_SLAVEOBSSEK,"PW_TEMPLE_MARIUS_01");
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_SEK_156_STANDARD_13_00 " );	// Leave me alone!
		};
		if(randy == 1)
		{
			AI_Output(self,other, " DIA_SEK_156_STANDARD_13_01 " );	// What do you want from me? Leave me alone!
		};
		if(randy == 2)
		{
			AI_Output(self,other, " DIA_SEK_156_STANDARD_13_02 " );	// We're all going to die here!
		};

		AI_StopProcessInfos(self);
	};
};
