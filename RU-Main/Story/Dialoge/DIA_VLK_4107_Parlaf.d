

instance DIA_Parlaf_EXIT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 999;
	condition = DIA_Parlaf_EXIT_Condition;
	information = DIA_Parlaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parlaf_HELLO (C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_HALLO_Condition;
	information = DIA_Parlaf_HALLO_Info;
	description = " Hi, how are you? " ;
};


func int DIA_Parlaf_HALLO_Condition()
{
	if (chapter <  4 )
	{
		return TRUE;
	};
};

func void DIA_Parlaf_HELLO_Info()
{
	AI_Output(other,self, " DIA_Parlaf_HALLO_15_00 " );	// Hello, how are you?
	AI_Output(self,other, " DIA_Parlaf_HALLO_03_01 " );	// What do you think? I spent the whole day at the grinding wheel sharpening my blades.
	if (Npc_IsDead(Engor) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Parlaf_HALLO_03_02 " );	// And yesterday Angore cut our rations again. If he continues like this, we will all starve to death.
		AI_Output(self,other, " DIA_Parlaf_HALLO_03_03 " );	// Or we'll all be killed by orcs. Not the brightest prospect.
	};
};


instance DIA_Parlaf_ENGOR(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_ENGOR_Condition;
	information = DIA_Parlaf_ENGOR_Info;
	description = " Who is Engor? " ;
};


func int DIA_Parlaf_ENGOR_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Speech_HELLO ) && ( Npc_IsDead ( Engor ) ==  FALSE )) .
	{
		if (chapter <  4 )
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_ENGOR_Info()
{
	AI_Output(other,self, " DIA_Parlaf_ENGOR_15_00 " );	// Who is Engor?
	AI_Output(self,other, " DIA_Parlaf_ENGOR_03_01 " );	// Angor is in charge of provisions and issues rations. And they are getting smaller every week.
	AI_Output(self,other, " DIA_Parlaf_ENGOR_03_02 " );	// Of course, you can negotiate with him, but only for gold and very expensive.
	AI_Output(other,self, " DIA_Parlaf_ENGOR_15_03 " );	// Can't you afford it?
	AI_Output(self,other, " DIA_Parlaf_ENGOR_03_04 " );	// For the pennies we're being paid, I can only buy a couple of raps!
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	Log_AddEntry(TOPIC_Trader_OC, " Angore manages the castle's supplies and runs a small business on the side. " );
};


instance DIA_Parlaf_Wo (C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_Wo_Condition;
	information = DIA_Parlaf_Wo_Info;
	permanent = FALSE;
	description = " Where can I find this Angore? " ;
};


func int DIA_Parlaf_Wo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Speech_ENGOR ) && ( Npc_IsDead ( Engor ) ==  FALSE ))
	{
		if (chapter <  4 )
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_Wo_Info()
{
	AI_Output(other,self, " DIA_Parlaf_Wo_15_00 " );	// Where can I find this Angora?
	AI_Output(self,other, " DIA_Parlaf_Wo_03_01 " );	// In the house of the knights! Go through the open entrance next to the forge.
};


instance DIA_Parlaf_HUNGRIG (C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_HUNGRIG_Condition;
	information = DIA_Parlaf_HUNGRIG_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_Parlaf_HUNGRIG_Condition()
{
	if ((MIS_Engor_BringMeat !=  LOG_SUCCESS ) && Npc_KnowsInfo(hero,DIA_Speech_HELLO) && (Npc_IsDead(Engor) ==  FALSE ))
	{
		if (chapter <  4 )
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_HUNGRIG_Info()
{
	AI_Output(other,self, " DIA_Parlaf_HUNGRIG_15_00 " );	// What's new?
	AI_Output(self,other, " DIA_Parlaf_HUNGRIG_03_01 " );	// That damn Angore needs to increase the rations!
};


instance DIA_Parlaf_SATT (C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_SATT_Condition;
	information = DIA_Parlaf_SATT_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_Parlaf_SATT_Condition()
{
	if (((MIS_Engor_BringMeat ==  LOG_SUCCESS ) || Npc_IsDead(Engor)) && Npc_KnowsInfo(hero,DIA_Speech_HELLO))
	{
		if (chapter <  4 )
		{
			return TRUE;
		};
	};
};


var int DIA_Parlaf_SATT_OneTime;

func void DIA_Parlaf_SATT_Info()
{
	AI_Output(other,self, " DIA_Parlaf_SATT_15_00 " );	// What's new?

	if ((DIA_Speak_SATT_OneTime ==  FALSE ) && (Npc_IsDead(Engor) ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Parlaf_SATT_03_01 " );	// Angore handed out meat rations. Oh how long I've been waiting for this.
		DIA_Parlaf_SAT_OneTime = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Parlaf_SATT_03_02 " );	// Your arrival is the only really fresh news.
	};
};

instance DIA_Parlaf_DobarOut(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_DobarOut_Condition;
	information = DIA_Parlaf_DobarOut_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlaf_DobarOut_Condition()
{
	if(MIS_DobarOut == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarOut_Info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_00 " );	// (frightened) Who's here? Ah, it's you...
	AI_Output(other,self, " DIA_Parlaf_DobarOut_01_01 " );	// So that's where you've gone. But how did you get here?
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_02 " );	// (depressed) One night, Dobar woke me up and offered to run away from the castle. And I, the fool, listened to him.
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_03 " );	// But it looks like you won't make it out of this valley alive... (quietly) Well, unless you're the only one who somehow manages to do it.
	AI_Output(other,self, " DIA_Parlaf_DobarOut_01_04 " );	// Get to the point. Where did Dobar go, and how did you end up here?
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_05 " );	// A-ah... yes, good, good. The next night we managed to go down the ram unnoticed - Udar, it seems, went to take a piss, and Sengrat was not at his post at all.
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_06 " );	// We were almost out of the siege ring when a group of orcs spotted us.
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_07 " );	// There was no time to think - we rushed as fast as we could in different directions.
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_08 " );	// I ran without looking back along the cliff until I spotted a ledge, then I climbed up here.
	AI_Output(other,self, " DIA_Parlaf_DobarOut_01_09 " );	// And the orcs didn't see you get in here?
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_10 " );	// I'm surprised that I'm still alive. They couldn't help but see it... (scratching the back of their head)
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_11 " );	// I think they just knew that I had nowhere to go from here, and chose to mock me, leaving me to starve to death here.
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_12 " );	// I have no other suggestions.
	AI_Output(other,self, " DIA_Parlaf_DobarOut_01_13 " );	// And where did Dobar run?
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_14 " );	// I don't know... I'm telling you, it all happened so suddenly. But he didn't run in that direction.
	AI_Output(other,self, " DIA_Parlaf_DobarOut_01_15 " );	// I see... And what should I do with you now?
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_16 " );	// I... I'd really appreciate it if... if you'd escort me back to the castle.
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_17 " );	// Just... I'm afraid to imagine how Garond will react to my desertion...
	AI_Output(other,self, " DIA_Parlaf_DobarOut_01_18 " );	// I don't think you'll be punished too harshly. I've talked to him and he's clearly more concerned about other issues.
	AI_Output(other,self, " DIA_Parlaf_DobarOut_01_19 " );	// So tell me right away - to take you to the castle or not?
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_20 " );	// Ah, come what may... I'll go with you.
	AI_Output(other,self, " DIA_Parlaf_DobarOut_01_21 " );	// Let's go then.
	AI_Output(self,other, " DIA_Parlaf_DobarOut_01_22 " );	// Okay, drive on.
	B_LogEntry(TOPIC_DobarOut, " I need to take Parlaff back to the castle. " );
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	ParlafFind = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
};

instance DIA_Parlaf_DobarOut_Come(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_DobarOut_Come_Condition;
	information = DIA_Parlaf_DobarOut_Come_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlaf_DobarOut_Come_Condition()
{
	if((MIS_DobarOut == LOG_Running) && (ParlafFind == TRUE) && (Npc_GetDistToWP(self,"OC_RAMP_08") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarOut_Come_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Parlaf_DobarOut_Come_01_00 " );	// Here we are.
	AI_Output(self,other, " DIA_Parlaf_DobarOut_Come_01_01 " );	// Thanks mate. You saved my ass! I'm afraid I can't thank you enough. Except that...

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
	{
		AI_Output(self,other, " DIA_Parlaf_DobarOut_Come_01_02 " );	// Once, when I looked into the chapel, I found a runestone there. Probably left from the magicians. I think you will need it.
		B_GiveInvItems(self,other,ItMi_HighRuneBlank,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Parlaf_DobarOut_Come_01_03 " );	// I have a few steel blanks left. I think they will come in handy for you.
		B_GiveInvItems(self,other,ItMiSwordraw,3);
	};

	AI_Output(other,self, " DIA_Parlaf_DobarOut_Come_01_04 " );	// Thank you.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	ParlafOnPlace = TRUE;
	B_LogEntry(TOPIC_DobarOut, " I brought Parlaff back to the castle. I think it's worth telling Garond. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"StartNew");
};

instance DIA_Parlaf_DobarDead(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_DobarDead_Condition;
	information = DIA_Parlaf_DobarDead_Info;
	permanent = FALSE;
	description = " I found Dobar near the castle. He's dead. " ;
};

func int DIA_Parlaf_DobarDead_Condition()
{
	if((ParlafOnPlace == TRUE) && (DobarOnPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarDead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Parlaf_DobarDead_01_00 " );	// I found Dobar near the castle. He is dead.
	AI_Output(self,other, " DIA_Parlaf_DobarDead_01_01 " );	// Eh... we shouldn't have run after all. The earth rest in peace to him.
};

instance DIA_Parlaf_WorkAgain(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_WorkAgain_Condition;
	information = DIA_Parlaf_WorkAgain_Info;
	permanent = FALSE;
	description = " Garond decided not to punish you. " ;
};

func int DIA_Parlaf_WorkAgain_Condition()
{
	if(MIS_DobarOut == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Parlaf_WorkAgain_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Parlaf_WorkAgain_01_00 " );	// Garond chose not to punish you.
	AI_Output(other,self, " DIA_Parlaf_WorkAgain_01_01 " );	// You will have to sharpen your blades as before.
	AI_Output(self,other, " DIA_Parlaf_WorkAgain_01_02 " );	// Oh, I already feared the worst...
	AI_Output(self,other, " DIA_Parlaf_WorkAgain_01_03 " );	// But now I will never leave the castle as long as at least one of the creatures around it is alive.
	AI_Output(self,other, " DIA_Parlaf_WorkAgain_01_04 " );	// Thank you very much!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Parlaf_PICKPOCKET(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 900;
	condition = DIA_Parlaf_PICKPOCKET_Condition;
	information = DIA_Parlaf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Parlaf_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 12 );
};

func void DIA_Parlaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET,Dialog_Back,DIA_Parlaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parlaf_PICKPOCKET_DoIt);
};

func void DIA_Parlaf_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};

func void DIA_Parlaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};
