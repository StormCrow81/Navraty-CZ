

instance DIA_Sentenza_EXIT (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 999;
	condition = DIA_Sentenza_EXIT_Condition;
	information = DIA_Sentence_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sentenza_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Sentence_Wants50;
var int Sentence_SearchDay;

instance DIA_Sentenza_Hello (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 1;
	condition = DIA_Sentenza_Hello_Condition;
	information = DIA_Sentence_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sentenza_Hello_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] ==  FALSE ) && ( KAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Hello_Info()
{
	AI_Output(self,other, " DIA_Sentenza_Hello_09_00 " );	// And where are you going?!
	self.aivar[AIV_LastFightComment] = TRUE ;
	Sentence_SearchDay = B_GetDayPlus();
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello, " What do you care? " ,DIA_Sentenza_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Sentenza_Hello, " I'm just walking. That's it. " ,DIA_Sentenza_Hello_JustLooking);
};

func void DIA_Sentenza_Hello_JustLooking()
{
	AI_Output(other,self, " DIA_Sentenza_Hello_JustLooking_15_00 " );	// I'm just walking around. That's all!
	AI_Output(self,other, " DIA_Sentenza_Hello_JustLooking_09_01 " );	// People like you are in big trouble here! Are you telling me that you're just walking around?
	AI_Output(self,other, " DIA_Sentenza_Hello_JustLooking_09_02 " );	// Ha! You are going to the yard! Why else did you have to make such a long journey?
	AI_Output(self,other, " DIA_Sentenza_Hello_JustLooking_09_03 " );	// So stop talking nonsense. Now I will search you, and you can stomp on.
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello, " Hold your hands! " ,DIA_Sentenza_Hello_HandsOff);
	Info_AddChoice(DIA_Sentenza_Hello, " As you wish. You can search me! " ,DIA_Sentenza_Hello_SearchMe);
};

func void DIA_Sentenza_Hello_NotYourBusiness()
{
	AI_Output(other,self, " DIA_Sentenza_Hello_NotYourBusiness_15_00 " );	// What do you care?
	AI_Output(self,other, " DIA_Sentenza_Hello_NotYourBusiness_09_01 " );	// (sighs) So I'll have to explain this to you in detail.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Sentenza_SearchMe()
{
	var int playerGold;
	playerGold = Npc_HasItems(other,ItMi_Gold);
	AI_Output(other,self, " DIA_Sentenza_Hello_SearchMe_15_00 " );	// As you wish. You can search me!
	AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_01 " );	// Ok, let's see what we have here...
	if(playerGold >= 50)
	{
		AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_02 " );	// Ah! Gold! It is very dangerous to carry that amount of gold with you.
		AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_03 " );	// Many of the mercenaries are real thugs. Not honest guys like me.
		B_GiveInvItems(other,self,ItMi_Gold,50);
		Sentenza_GoldTaken = TRUE ;
	}
	else if(playerGold > 0)
	{
		AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_04 " );	// Yeah... You don't have much with you.
		AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_05 " );	// I'll get back to you later.
	}
	else
	{
		AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_06 " );	// Don't you have any gold with you?
		AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_07 " );	// Doesn't look like you're starving. You must have hidden the gold somewhere, right?
		AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_08 " );	// You're not stupid. I'm sure we'll meet again. Take care.
		AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_09 " );	// You're probably the only one who knows where all your gold is!
	};
	Sentenza_Wants50 = TRUE;
	AI_Output(self,other, " DIA_Sentenza_Hello_SearchMe_09_10 " );	// I want only fifty gold from you - this is the standard fee. You only have to pay it once. It's honest, isn't it?
};

func void DIA_Sentenza_Hello_SearchMe()
{
	B_Judgment_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Hello_HandsOff()
{
	AI_Output(other,self, " DIA_Sentenza_Hello_HandsOff_15_00 " );	// Keep your hands up!
	AI_Output(self,other, " DIA_Sentenza_Hello_HandsOff_09_01 " );	// (menacingly) What is it?
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello, " Or nothing. Search me! " ,DIA_Sentenza_Hello_SearchMe);
	Info_AddChoice(DIA_Sentenza_Hello, " You won't be able to search anyone for a long time! " ,DIA_Sentenza_Hello_OrElse);
};

func void DIA_Sentenza_Hello_OrElse()
{
	AI_Output(other,self, " DIA_Sentenza_Hello_OrElse_15_00 " );	// You won't be able to search anyone for a long time!
	AI_Output(self,other, " DIA_Sentenza_Hello_OrElse_09_01 " );	// Well, we'll see!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_Vzwei (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 2;
	condition = DIA_Sentenza_Vzwei_Condition;
	information = DIA_Sentence_Vzwei_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sentenza_Vzwei_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ) && (Sentence_GoldTaken ==  FALSE ) && (Sentence_SearchDay < Wld_GetDay()));
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vzwei_Info()
{
	AI_Output(self,other, " DIA_Sentenza_Vzwei_09_00 " );	// You again! Let's see what you have this time!
	self.aivar[AIV_LastFightComment] = TRUE ;
	Sentence_SearchDay = B_GetDayPlus();
	Info_ClearChoices(DIA_Sentenza_Vzwei);
	Info_AddChoice(DIA_Sentenza_Vzwei, " Get your dirty hands off me! " ,DIA_Sentenza_Vzwei_HandsOff);
	Info_AddChoice(DIA_Sentenza_Vzwei, " Whatever you want. You can search me! " ,DIA_Sentenza_Vzwei_SearchMe);
};

func void DIA_Sentenza_Vzwei_SearchMe()
{
	B_Judgment_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Vzwei_HandsOff()
{
	AI_Output(other,self, " DIA_Sentenza_Vzwei_HandsOff_15_00 " );	// Get your dirty hands off me!
	AI_Output(self,other, " DIA_Sentenza_Vzwei_HandsOff_09_01 " );	// (menacingly) Yes? Looks like you have more gold with you now!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Sentenza_RagnarDead (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 3;
	condition = DIA_Sentenza_RagnarDead_Condition;
	information = DIA_Sentenza_RagnarDead_Info;
	permanent = FALSE;
	description = " What happened here?! " ;
};

func int DIA_Sentenza_RagnarDead_Condition()
{
	if((Kapitel == 2) && (RagnarIsSLDDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_RagnarDead_Info()
{
	AI_Output(other,self, " DIA_Sentenza_RagnarDead_01_00 " );	// What happened here?
	AI_Output(self,other, " DIA_Sentenza_RagnarDead_01_01 " );	// (calmly) Are you talking about this jerk? I just asked him for a standard fee to enter the farm, and he hit me back!
	AI_Output(self,other, " DIA_Sentenza_RagnarDead_01_02 " );	// I flared up and simply stabbed him with my sword. What about you?
	AI_Output(other,self, " DIA_Sentenza_RagnarDead_01_03 " );	// Nothing now...
};

instance DIA_Sentenza_WannaJoin (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 3;
	condition = DIA_Sentenza_WannaJoin_Condition;
	information = DIA_Judgment_WannaJoin_Info;
	permanent = FALSE;
	description = " I've come to join you! " ;
};

func int DIA_Sentenza_WannaJoin_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Judgment_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Sentenza_WannaJoin_15_00 " );	// I've come to join you!
	AI_Output(self,other, " DIA_Sentenza_WannaJoin_09_01 " );	// A commendable wish.
	AI_Output(self,other, " DIA_Sentenza_WannaJoin_09_02 " );	// (in passing) Did you know that the mercenaries will vote whether to accept you or not?
};


instance DIA_Sentenza_Vote (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 4;
	condition = DIA_Sentenza_Vote_Condition;
	information = DIA_Sentenza_Vote_Info;
	permanent = TRUE;
	description = " Will you vote for me? " ;
};

func int DIA_Sentenza_Vote_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sentenza_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vote_Info()
{
	AI_Output(other,self, " DIA_Sentenza_Vote_15_00 " );	// Will you vote for me?

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other, " DIA_Sentenza_Vote_09_01 " );	// Just because you beat me? (laughs) No.
	}
	else if((Npc_HasItems(self,ItMi_Gold) >= 50) && ((Sentenza_GoldTaken == TRUE) || (Sentenza_GoldGiven == TRUE)))
	{
		AI_Output(self,other, " DIA_Sentenza_Vote_09_02 " );	// Although, why not? Fifty gold is a reasonable price for my vote, don't you think?
		Sentenza_voice = TRUE ;
		B_LogEntry(TOPIC_SLDRespekt, " Sentenza doesn't mind my joining the mercenaries. " );
	}
	else if((Sentenza_Stimme == TRUE) && (Npc_HasItems(self,ItMi_Gold) < 50))
	{
		AI_Output(self,other, " DIA_Sentenza_Vote_09_03 " );	// After you took my gold? Not likely, my boy.
	}
	else
	{
		AI_Output(self,other, " DIA_Sentenza_Vote_09_04 " );	// You can't do anything like that, boy! If you want me to vote for you, you must present me some gold.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//Сколько?
		AI_Output(self,other, " DIA_Sentenza_Vote_09_06 " );	// Fifty coins. It's a fee that you would still have to pay.
		Sentenza_Wants50 = TRUE;
	};
};

var int Sentenza_GoldGiven;

instance DIA_Sentenza_Pay50 (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 5;
	condition = DIA_Sentenza_Pay50_Condition;
	information = DIA_Judgment_Pay50_Info;
	permanent = TRUE;
	description = " Here are your fifty gold coins. " ;
};

func int DIA_Sentenza_Pay50_Condition()
{
	if((Sentenza_Wants50 == TRUE) && (Npc_HasItems(self,ItMi_Gold) < 50) && (other.guild == GIL_NONE) && (Sentenza_GoldGiven == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Pay50_Info()
{
	AI_Output(other,self, " DIA_Sentenza_Pay50_15_00 " );	// Here are your fifty gold coins.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Sentenza_Pay50_09_01 " );	// Thank you dear.
		Sentenza_GoldGiven = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Sentenza_Pay50_09_02 " );	// Don't try to fool me. Fifty gold coins and not a coin less! Understood?
	};
};

var int Sentenza_Once;

instance DIA_Sentenza_GoldBack (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 6;
	condition = DIA_Sentenza_GoldBack_Condition;
	information = DIA_Judgment_GoldBack_Info;
	permanent = TRUE;
	description = " Give me back my gold! " ;
};

func int DIA_Sentenza_GoldBack_Condition()
{
	if(Npc_HasItems(self,ItMi_Gold) >= 50)
	{
		if((Sentenza_GoldGiven == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void DIA_Judgment_GoldBack_Info()
{
	AI_Output(other,self, " DIA_Sentenza_GoldBack_15_00 " );	// Give me back my gold!

	if((other.guild == GIL_SLD) && (Torlof_SentenzaCounted == TRUE) && (Sentenza_Einmal == FALSE))
	{
		AI_Output(self,other, " DIA_Sentenza_GoldBack_09_01 " );	// After I upvoted you?
		AI_Output(self,other, " DIA_Sentenza_GoldBack_09_02 " );	// Oh, you filthy beggar!
		Sentenza_Once = TRUE ;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Sentenza_GoldBack_09_03 " );	// Relax! I'll just keep an eye on him...
	};
};


instance DIA_Judgment_AufsMaul (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 7;
	condition = DIA_Sentenza_AufsMaul_Condition;
	information = DIA_Sentence_AufsMaul_Info;
	permanent = FALSE;
	description = " Hey, what's in front of your head? Face or ass? " ;
};


func int DIA_Sentenza_AufsMaul_Condition()
{
	if (( Npc_HasItems ( self , It's_My_Gold ) > =  50 ) ||
	{
		return TRUE;
	};
};

func void DIA_Judgment_AufsMaul_Info()
{
	AI_Output(other,self, " DIA_Sentenza_AufsMaul_15_00 " );	// Listen, what's in front of your head? Face or ass?
	AI_Output(self,other, " DIA_Sentenza_AufsMaul_09_01 " );	// (laughs evilly) Okay, that's what you wanted...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Judgment_AufsMaulAgain (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 8;
	condition = DIA_Sentenza_AufsMaulAgain_Condition;
	information = DIA_Judgment_AufsMaulAgain_Info;
	permanent = TRUE;
	description = " It's time for another thrashing! " ;
};


func int DIA_Sentenza_AufsMaulAgain_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Sentence_AufsMaul ))
	{
		if (( Npc_HasItems ( self , It's_My_Gold ) > =  50 ) ||
		{
			return TRUE;
		};
	};
};

func void DIA_Judgment_AufsMaulAgain_Info()
{
	AI_Output(other,self, " DIA_Sentenza_AufsMaulAgain_15_00 " );	// It's time for another thrashing!
	AI_Output(self,other, " DIA_Sentenza_AufsMaulAgain_09_01 " );	// How do you say...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_PERM (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 1;
	condition = DIA_Sentenza_PERM_Condition;
	information = DIA_Sentence_PERM_Info;
	permanent = TRUE;
	description = " Hey, how are you? " ;
};


func int DIA_Sentenza_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sentence_PERM_Info()
{
	AI_Output(other,self, " DIA_Sentenza_PERM_15_00 " );	// Hey, how are you?
	AI_Output(self,other, " DIA_Sentenza_PERM_09_01 " );	// Few people come here, but until recently they all paid me a fee.
	if(Npc_HasItems(self,ItMi_Gold) < 50)
	{
		AI_Output(self,other, " DIA_Sentenza_PERM_09_02 " );	// Except for you. (grins)
	};
};


instance DIA_Sentenza_PICKPOCKET (C_Info)
{
	npc = SLD_814_Sentence;
	nr = 900;
	condition = DIA_Sentenza_PICKPOCKET_Condition;
	information = DIA_Judgment_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sentenza_PICKPOCKET_Condition()
{
	return  C_Robbery ( 56 , 65 );
};

func void DIA_Sentenza_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET,Dialog_Back,DIA_Sentenza_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sentenza_PICKPOCKET_DoIt);
};

func void DIA_Sentenza_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

func void DIA_Sentenza_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

