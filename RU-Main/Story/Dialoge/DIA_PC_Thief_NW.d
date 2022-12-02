

instance DIA_DiegoNW_EXIT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 999;
	condition = DIA_DiegoNW_EXIT_Condition;
	information = DIA_DiegoNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoNW_Perm(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_DiegoNW_Perm_Condition;
	information = DIA_DiegoNW_Perm_Info;
	permanent = TRUE;
	description = " How are things going? " ;
};


func int DIA_DiegoNW_Perm_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_Perm_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_DiegoNW_Perm_11_01 " );	// Bad. Why didn't anyone tell me that Khorinis was completely ruined during this time?
	AI_Output(other,self, " DIA_DiegoNW_Perm_15_02 " );	// I have no idea. I know this city just like that.
	AI_Output(self,other, " DIA_DiegoNW_Perm_11_03 " );	// You should have seen him years ago. You wouldn't like him at all in his current state.
};


instance DIA_DiegoNW_NeedHelp (C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = DIA_DiegoNW_NeedHelp_Condition;
	information = DIA_DiegoNW_NeedHelp_Info;
	important = TRUE;
};


func int DIA_DiegoNW_NeedHelp_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if (Diego_IsDead ==  TRUE )
	{
		AI_Output(self,other, " DIA_Addon_DiegoNW_NeedHelp_11_01 " );	// Hey! You look like you saw a ghost!
		AI_Output(self,other, " DIA_Addon_DiegoNW_NeedHelp_11_02 " );	// (laughs) You thought I was done for, right?
		AI_Output(self,other, " DIA_Addon_DiegoNW_NeedHelp_11_03 " );	// I then lay unconscious for quite a long time. But as you can see, I'm still alive.
		AI_Output(self,other, " DIA_Addon_DiegoNW_NeedHelp_11_04 " );	// Okay, the most important thing is that we're both here now.
		AI_Output(self,other, " DIA_Addon_DiegoNW_NeedHelp_11_05 " );	// You have to help me.
	}
	else
	{
		AI_Output(self,other, " DIA_DiegoNW_NeedHelp_11_00 " );	// Good to have you here. You must help me.
	};
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	if ( DiegoOW . aivar [ AIV_TalkedToPlayer ] ==  FALSE )
	{
	};
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " What are those clothes you're wearing? " ,DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " What are you doing here? " ,DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " Why not? " ,DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Plan_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Plan_11_01 " );	// Guards are watching me. They are always on the lookout.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Plan_11_02 " );	// I don't think it will be easy for me to get settled here.
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_WhoAreYou_11_01 " );	// Damn, it's probably because of the clothes. In old clothes, the guards would not let me into the city.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_WhoAreYou_11_02 " );	// That's why I bought this robe from a merchant outside the city. Now, I hope you remember me? I am Diego.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_WhoAreYou_11_03 " );	// In the old colony, I taught you everything you need to survive.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_WhoAreYou_11_04 " );	// You couldn't just forget everything like that.
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_WhoAreYou_15_05 " );	// Uh... what exactly happened there?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_WhoAreYou_11_06 " );	// Damn it! You really don't remember anything.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_WhoAreYou_11_07 " );	// Look, I really don't have time to explain everything to you now. Listen to just one thing: we were damn good friends, and I saved your life more than once.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_WhoAreYou_11_08 " );	// And now I need your help.
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Clothes_15_00 " );	// What are those clothes you're wearing?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Clothes_11_01 " );	// I bought it from a merchant outside the city. The guards didn't want to let me into the city.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Clothes_11_02 " );	// Also don't tell anyone where I'm from.
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Clothes_15_03 " );	// This makes sense.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Clothes_11_04 " );	// I think so too. But even though I took off my old outfit, I still remained the same.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Clothes_11_05 " );	// And I have big plans for this city.
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_15_00 " );	// What are the plans?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_11_01 " );	// A lot has changed here since I left it. I need to get back on my feet somehow.
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_15_02 " );	// What's the problem?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_11_03 " );	// I have to get to the top quarter.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_11_04 " );	// But I'm not a citizen of this city, and I don't have the money to bribe the guards. That's why we need you!
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_15_05 " );	// So you want me to lend you some gold?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_11_06 " );	// Nonsense. I have gold. I would even say a whole bunch of gold! But, unfortunately, it is not with me.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_11_07 " );	// You must take my gold where it is.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " I don't have time for this. " ,DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " What will happen to me? " ,DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " Ok, I'll help you. " ,DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00 " );	// I don't have time for this.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01 " );	// Hey, I thought we were friends! It was me, don't forget, that saved your ass when you were thrown into the colony.
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02 " );	// You're exaggerating.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03 " );	// Yes?! And you think for a moment what could have happened if I had not explained to you then how to behave in the colony.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04 " );	// The ore barons would eat you for breakfast, and you'd die a miserable death in a mine somewhere.
	MIS_HelpDiegoNW = LOG_FAILED;
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_Reward_15_00 " );	// What will happen to me?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_Reward_11_01 " );	// Have I ever asked you what would you give me in return? We're friends, isn't that enough?
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00 " );	// Okay, I'll help you.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_01 " );	// Great. Listen carefully. When the Barrier was still in place, I hid a small treasure in the Valley of Mines.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_02 " );	// It was quite a while ago, and so when I left there, I forgot to pick it up.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_03 " );	// And now I really need this money.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_04 " );	// Long story short, you should go to the Valley of Mines and get my gold.
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW, " Diego's gold is in Mining Valley. He needs it to get to the upper part of the city, and he asked me to find this gold. " );
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " What are you going to do with this gold? " ,DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " Where did you get this gold? " ,DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " Did you really want this? " ,DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00 " );	// What are you going to do with this gold?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01 " );	// I want to settle scores with one of the merchants in the upper quarter. I really want this.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02 " );	// And then, I'll be ready to start a new career!
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00 " );	// Where did you get this gold from?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01 " );	// Am I the only one who saved gold for himself in the Valley of Mines?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02 " );	// Stealing a few chunks of ore was a breeze. Just in case we ever manage to get out of there.
	AI_Output(self,other, " DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03 " );	// Everyone was so focused on the ore that no one paid any attention to the gold...
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00 " );	// Where is this gold hidden?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01 " );	// Right on the site, next to an abandoned mine! It's in a leather wallet.
	if (Diego_arrived ==  TRUE )
	{
		AI_Output(self,other, " DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01 " );	// Skip the comments. I myself remember that we passed by this place.
		AI_Output(self,other, " DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02 " );	// Just bring me some gold.
	};
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02 " );	// But make sure it's the same wallet so you don't go there empty.
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03 " );	// How do I recognize it?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04 " );	// It's full of gold. Filled to the brim!
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " I'll try to find your gold. " ,DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);
	B_LogEntry(TOPIC_HelpDiegoNW, " Diego's gold is somewhere in the old market square, where goods were transported to the colony by cable car, above an abandoned mine. " );
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00 " );	// I'll try to find your gold.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01 " );	// Do it...(grins) That'll be enough for me!
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, " И еще... " ,dia_diegonw_needhelp_problem_willhelpyou_wheremoregold);
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheremoregold()
{
	AI_Output(other,self, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_15_00 " );	// And one more thing... Spread out - where did you find these nuggets?
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_01 " );	// Hmmm...(thoughtfully) Well, really, why not.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_02 " );	// I found it there. Do you think what business I had at the aisle? I checked out this very place.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_03 " );	// This is one of the branches of the abandoned mine, which everyone forgot about, going crazy on the ore. It has a separate entrance.
	AI_Output(self,other, " DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_04 " );	// Climb up to the plateau right above the shaft that leads to Khorinis and the entrance will be on your left.
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus, " The entrance to the gold-rich offshoot of the abandoned mine is on the plateau above the hidden passage to the Valley of Mines. " );
};


instance DIA_DiegoNW_HelpYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_HelpYou_Condition;
	information = DIA_DiegoNW_HelpYou_Info;
	permanent = FALSE;
	description = " Okay, I'll help you anyway. " ;
};


func int DIA_DiegoNW_HelpYou_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_HelpDiegoNW == LOG_FAILED) && (Diego_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_HelpYou_15_00 " );	// Okay, I'll help you anyway.
	AI_Output(self,other, " DIA_DiegoNW_HelpYou_11_01 " );	// I knew it.
	AI_Output(other,self, " DIA_DiegoNW_HelpYou_15_02 " );	// Let's get straight to the point.
	AI_Output(self,other, " DIA_DiegoNW_HelpYou_11_03 " );	// Good! I have hidden the gold in the Valley of Mines, and you must retrieve it from there for me.
	AI_Output(self,other, " DIA_DiegoNW_HelpYou_11_06 " );	// And I'll wait here and prepare everything for further actions.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW, " Diego's gold is in Mining Valley. He needs it to get to the upper part of the city, and he asked me to find this gold. " );
};

instance DIA_DiegoNW_HaveYourGold(C_Info)
{
	npc = PC_Thief_NW;
	nr = 31;
	condition = DIA_DiegoNW_HaveYourGold_Condition;
	information = DIA_DiegoNW_HaveYourGold_Info;
	permanent = TRUE;
	description = " I found your gold. " ;
};


func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if(((OpenedDiegosBag == TRUE) || (Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other, " DIA_DiegoNW_HaveYourGold_11_05 " );	// Very good. Let Gerbrandt now tremble with fear.
};


var int DiegosRevenge;

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_HaveYourGold_15_00 " );	// I found your gold.
	AI_Output(self,other, " DIA_DiegoNW_HaveYourGold_11_01 " );	// Great! Show me.

	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)
	{
		B_GiveInvItems(other,self,ItSe_DiegosTreasure_Mis,1);
		b_diegonw_diegorevenge();
		DiegosRevenge = TRUE;
	}
	else if(Npc_HasItems(other,ItMi_Gold) < DiegosTreasure)
	{
		AI_Output(self,other, " DIA_DiegoNW_HaveYourGold_11_02 " );	// But that's not all! What, you don't trust me? I need the full amount.
		AI_Output(self,other, " DIA_DiegoNW_HaveYourGold_11_03 " );	// If my plan works, there will be enough gold left for you.
		AI_Output(self,other, " DIA_DiegoNW_HaveYourGold_11_04 " );	// So please bring the full amount. It is very important!
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,DiegosTreasure);
		b_diegonw_diegorevenge();
		DiegosRevenge = TRUE;
	};
	if ((Npc_IsDead(Gerbrandt) ==  FALSE ) && (DiegosRevenge ==  TRUE ))
	{
		AI_Output(self,other, " DIA_DiegoNW_HaveYourGold_11_06 " );	// Look, I'm still out of touch with the guards.
		AI_Output(self,other, " DIA_DiegoNW_HaveYourGold_11_07 " );	// I want you to take this letter to Gerbrandt. This is one of the merchants in the upper quarter.
		AI_Output(self,other, " DIA_DiegoNW_HaveYourGold_11_08 " );	// Say hi to him for me. And then we'll meet in front of Gerbrandt's house.
		CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
		B_StartOtherRoutine(Gerbrandt,"WaitForDiego");
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_Running;
		B_GivePlayerXP(XP_HelpDiegoNW);
		Log_CreateTopic(TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence,LOG_Running);
		B_LogEntry(TOPIC_DiegosResidence, " Diego gave me a letter for merchant Gerbrandt. " );
		AI_StopProcessInfos(self);
	};
};


instance DIA_DiegoNW_DeliveredLetter(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_DeliveredLetter_Condition;
	information = DIA_DiegoNW_DeliveredLetter_Info;
	permanent = FALSE;
	description = " I delivered your letter. " ;
};


func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_DiegosResidence == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_DeliveredLetter_15_00 " );	// I delivered your letter.
	AI_Output(self,other, " DIA_DiegoNW_DeliveredLetter_11_01 " );	// Very good. How did Gerbrandt take it?
	AI_Output(other,self, " DIA_DiegoNW_DeliveredLetter_15_02 " );	// He was in shock and instantly disappeared somewhere.
	AI_Output(self,other, " DIA_DiegoNW_DeliveredLetter_11_03 " );	// (satisfied) I thought so.
	AI_Output(self,other, " DIA_DiegoNW_DeliveredLetter_11_04 " );	// I'm afraid, though, that the first thing I'll have to do is furnish my new home. If I remember correctly, Gerbrandt's taste is terrible.
	B_GivePlayerXP(XP_DiegoHasANewHome);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, " How did you pull this off? " ,DIA_DiegoNW_DeliveredLetter_YourTrick);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, " So this is your house now? " ,DIA_DiegoNW_DeliveredLetter_YourHouse);
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other,self, " DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00 " );	// What about Gerbrandt?
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01 " );	// He's been enjoying a carefree life for far too long.
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02 " );	// He lived here, bathed in luxury while I lived on meat bug stew.
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03 " );	// I have no idea where he fled from here, but he will not dare to appear in Khorinis again - I will take care of it.
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04 " );	// If you're looking for it, try poking around in the waterfront.
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other,self, " DIA_DiegoNW_TalkedToJudge_YourHouse_15_00 " );	// So this is your house now?
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourHouse_11_01 " );	// Yes, from the cellar to the attic! With all furniture!
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourHouse_11_02 " );	// I spent so many years in unbearable conditions and now I dream about how I will sleep in a huge four-poster bed.
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourHouse_11_03 " );	// And then, for breakfast, I will eat an excellent ham and wash it down with expensive wine.
	AI_Output(other,self, " DIA_DiegoNW_TalkedToJudge_YourHouse_15_04 " );	// Yes, you won't miss yours.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Точно.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other,self, " DIA_DiegoNW_TalkedToJudge_YourTrick_15_00 " );	// How did you manage to pull this off?
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourTrick_11_01 " );	// Do you think Gerbrandt made his fortune in an honest business?
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourTrick_11_02 " );	// Of course, he never got his hands dirty when it came to dirty deeds. He had an assistant for this.
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourTrick_11_03 " );	// There were a lot of things on my conscience then. Gerbrandt finally decided to get rid of me. He was probably afraid that I knew too much.
	AI_Output(other,self, " DIA_DiegoNW_TalkedToJudge_YourTrick_15_04 " );	// You never told me about this.
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourTrick_11_05 " );	// And you never asked.
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,Dialog_Back,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, " What about my share? " ,DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, " What about Gerbrandt? " ,DIA_DiegoNW_DeliveredLetter_Gerbrandt);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other,self, " DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00 " );	// What about my share?
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01 " );	// Looks like you haven't forgotten anything I taught you.
	AI_Output(self,other, " DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02 " );	// But you're right, I couldn't have done it without your help. Here is your share.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};


var int Diego_Teach;

instance DIA_DiegoNW_CanYouTeach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_CanYouTeach_Condition;
	information = DIA_DiegoNW_CanYouTeach_Info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};


func int DIA_DiegoNW_CanYouTeach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_CanYouTeach_15_00 " );	// Can you teach me something?
	if(Npc_KnowsInfo(other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output(self,other, " DIA_DiegoNW_CanYouTeach_11_01 " );	// Yes, of course. Let me know when you're ready.
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_DiegoNW_CanYouTeach_11_02 " );	// First I need to solve my problems.
	};
};


var int DiegoNW_Merke_DEX;

instance DIA_DiegoNW_Teach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_Teach_Condition;
	information = DIA_DiegoNW_Teach_Info;
	permanent = TRUE;
	description = " Teach me. " ;
};


func int DIA_DiegoNW_Teach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_Teach_15_00 " );	// Train me.
	AI_Output(self,other, " DIA_DiegoNW_Teach_11_01 " );	// I can teach you how to become more agile.
	DiegoNW_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if(DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other, " DIA_DiegoNW_Teach_BACK_11_00 " );	// You've already become more dexterous. Keep it up!
	};
	Info_ClearChoices(DIA_DiegoNW_Teach);
};

func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};


instance DIA_DiegoNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_KnowWhereEnemy_Condition;
	information = DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " I'm about to leave Khorinis. " ;
};


func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_KnowWhereEnemy_15_00 " );	// I'm going to leave Khorinis.
	AI_Output(self,other, " DIA_DiegoNW_KnowWhereEnemy_11_01 " );	// Wise decision. I wouldn't mind going with you. This city has changed too quickly - the times when you could get rich here are already in the past.
	AI_Output(self,other, " DIA_DiegoNW_KnowWhereEnemy_11_02 " );	// I could teach you how to shoot accurately, how to use lock picks, and I could increase your dexterity.
	AI_Output(self,other, " DIA_DiegoNW_KnowWhereEnemy_11_03 " );	// Also, I'm sure you could use a good thief.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew, " Of course, Diego is ready to come with me. He thinks that the sooner he leaves Khorinis, the better. He could teach me how to become more dexterous and make me an excellent archer. He can also teach me how to use master keys. " );
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_DiegoNW_KnowWhereEnemy_15_04 " );	// I'll think about it. But for now, my team is fully staffed.
		AI_Output(self,other, " DIA_DiegoNW_KnowWhereEnemy_11_05 " );	// Take your time. I'm still not going anywhere.
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy, " Maybe I'll let you know when the time is right. " ,DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy, " Would you like to join? " ,DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_DiegoNW_KnowWhereEnemy_Yes_15_00 " );	// Come with us. We are going to the port.
	AI_Output(self,other, " DIA_DiegoNW_KnowWhereEnemy_Yes_11_01 " );	// Hmm. You're right, Khorinis is a hole. I will go with you.
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other, " DIA_DiegoNW_KnowWhereEnemy_Yes_11_02 " );	// Wait, I'll be ready in a minute.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other, " DIA_DiegoNW_KnowWhereEnemy_Yes_11_03 " );	// Well, I'm ready. Meet me at the ship.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_DiegoNW_KnowWhereEnemy_No_15_00 " );	// Maybe I'll let you know when the time is right.
	AI_Output(self,other, " DIA_DiegoNW_KnowWhereEnemy_No_11_01 " );	// Try. And maybe I'll even join you. Who knows?
	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};


instance DIA_DiegoNW_LeaveMyShip(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_LeaveMyShip_Condition;
	information = DIA_DiegoNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = " You must take care of the city. " ;
};


func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if((Diego_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_LeaveMyShip_15_00 " );	// You have to take care of the city.
	AI_Output(self,other, " DIA_DiegoNW_LeaveMyShip_11_01 " );	// Yes? Do you need me anymore? Oh, okay. Don't forget to visit me when you get back to town.
	AI_Output(other,self, " DIA_DiegoNW_LeaveMyShip_15_02 " );	// Do you think we'll meet again?
	AI_Output(self,other, " DIA_DiegoNW_LeaveMyShip_11_03 " );	// I'll never forget the look on your face as you lay on the ground after Bullitt knocked you out. Then we met for the first time.
	AI_Output(self,other, " DIA_DiegoNW_LeaveMyShip_11_04 " );	// They will never defeat you. We will DEFINITELY meet again. Take care.
	Diego_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DiegoNW_StillNeedYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_StillNeedYou_Condition;
	information = DIA_DiegoNW_StillNeedYou_Info;
	permanent = TRUE;
	description = " Come back. I want you to accompany me. " ;
};


func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if(((Diego_IsOnBoard == LOG_OBSOLETE) || (Diego_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_DiegoNW_StillNeedYou_15_00 " );	// Come back. I want you to accompany me.
	AI_Output(self,other, " DIA_DiegoNW_StillNeedYou_11_01 " );	// Where is your determination, my friend? Of course, I will go with you if you know what you want.
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other, " DIA_DiegoNW_StillNeedYou_11_02 " );	// Wait, I'll be ready in a minute.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other, " DIA_DiegoNW_StillNeedYou_11_03 " );	// Great, we can go.
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

instance DIA_DIEGONW_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_kapitelorcattack_condition;
	information = dia_diegonw_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " It looks like the whole city is occupied by orcs. " ;
};


func int dia_diegonw_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (THIEFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_01_00 " );	// It looks like the whole city is occupied by orcs.
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_01_01 " );	// (sadly) Looks like people are having a hard time! Many have already died, many more will die...
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_01_03 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_01_04 " );	// (surprised) Like what? Try to somehow get out of this trap.
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_01_05 " );	// Although, if you look at things realistically, we have little chance.
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_01_06 " );	// Or you can wait until the orcs come here on their own - then you certainly won't have to do anything.
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_01_07 " );	// I don't think you like this idea.
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_01_08 " );	// And you're right. So it's better to visit them yourself.
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_01_09 " );	// Are you saying you're going to attack the orcs yourself?
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_01_10 " );	// You got it right.
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_01_11 " );	// But this is pure madness!
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_01_12 " );	// Maybe so...(thoughtfully) However, the orcs probably don't expect us to make such a move - so my plan might work.
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_01_13 " );	// What if it doesn't work?
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_01_14 " );	// Then... uh... (sighs) Believe me, these creatures will have to work hard to get me!
	Info_ClearChoices(dia_diegonw_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_diegonw_nw_kapitelorcattack, " (offer teleport rune to tavern) " ,dia_diegonw_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_diegonw_nw_kapitelorcattack, " I have no doubt about that. " ,dia_diegonw_nw_kapitelorcattack_nogiverune);
};

func void dia_diegonw_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_01 " );	// I have a rune to teleport to Orlan's tavern.
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_02 " );	// With her help, you can get out of here.
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_05 " );	// Well, I guess I'll take your offer.
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_07 " );	// Give her here.
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_08 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_09 " );	// Well, thanks! Now I'm in your debt.
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_11 " );	// See you later.
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_12 " );	// Good.
	THIEFNOBATTLETHROUGTH = TRUE;
	B_LogEntry( TOPIC_HELPCREW , " I gave Diego the teleportation rune to the Dead Harpy Tavern. I think he's safe now. " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_diegonw_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// I have no doubt about that. As in the fact that despite everything, we will meet again.
	AI_Output(self,other, " DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_02 " );	// Like the good old days, huh? (laughs) Of course, buddy - we will definitely meet!
	AI_Output(other,self, " DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_03 " );	// See you then! Take care.
	B_LogEntry( TOPIC_HELPCREW , " Diego decided to attack the orcs himself and take them by surprise. He thinks it can work. Although as far as I know Diego - this guy never does something rash. " );
	THIEFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_NW_ESCAPE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_escape_condition;
	information = dia_diegonw_nw_escape_info;
	permanent = FALSE;
	description = " It's good to see you alive and well! " ;
};


func int dia_diegonw_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Diego_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self, " DIA_DiegoNW_NW_Escape_01_01 " );	// Glad to see you alive and well!
	AI_Output(self,other, " DIA_DiegoNW_NW_Escape_01_02 " );	// I love you too!
	AI_Output(other,self, " DIA_DiegoNW_NW_Escape_01_03 " );	// So you managed to break through the city?
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other, " DIA_DiegoNW_NW_Escape_01_04 " );	// I, as you can see, succeeded. However, not everyone is so lucky.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other, " DIA_DiegoNW_NW_Escape_01_05 " );	// Many orcs have been taken prisoner! What will happen to them now - only Innos knows.
			B_LogEntry( TOPIC_HELPCREW , " I met Diego at Onar's farm, alive and well. Good news! " );
			Log_AddEntry( TOPIC_HELPCREW , " But there were some bad guys. He told me that a lot of the guys were captured by the orcs during the break through the city. I hope they are still alive. " );
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other, " DIA_DiegoNW_NW_Escape_01_06 " );	// Many of us have been taken prisoner by the orcs! There are those who died fighting them.
			B_LogEntry( TOPIC_HELPCREW , " I met Diego at Onar's farm, alive and well. Good news! " );
			Log_AddEntry( TOPIC_HELPCREW , " But there were some bad ones. He told me that many guys were captured by the orcs during the break through the city. There are those who died. " );
		};
		AI_Output(other,self, " DIA_DiegoNW_NW_Escape_01_07 " );	// Yes, that's not good news.
		AI_Output(self,other, " DIA_DiegoNW_NW_Escape_01_08 " );	// It was obvious. And there's nothing you can do about it.
		AI_Output(other,self, " DIA_DiegoNW_NW_Escape_01_09 " );	// I understand.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_DiegoNW_NW_Escape_01_10 " );	// As you can see. And, as far as I know, everyone who was then on the ship succeeded in this.
		AI_Output(other,self, " DIA_DiegoNW_NW_Escape_01_11 " );	// Yes, that's just great news!
		AI_Output(self,other, " DIA_DiegoNW_NW_Escape_01_12 " );	// I agree with you... (smiling) I don't even know who to thank for such a miraculous salvation.
		AI_Output(other,self, " DIA_DiegoNW_NW_Escape_01_13 " );	// That's right.
		B_LogEntry( TOPIC_HELPCREW , " I met Diego at Onar's farm, alive and well. The rest of the guys also managed to get out of town. " );
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_DIEGONW_NW_GATHERARMY(C_Info)
{
	npc = PC_Thief_NW;
	nr = 3;
	condition = dia_diegonw_nw_gatherarmy_condition;
	information = dia_diegonw_nw_gatherarmy_info;
	permanent = FALSE;
	description = " Will you fight orcs? " ;
};


func int dia_diegonw_nw_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (ALLGUARDIANSKILLED == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_gatherarmy_info()
{
	AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmy_01_00 " );	// Will you fight orcs?
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_01 " );	// Why not? Only for this we need a whole army. Do you have it?
	AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmy_01_02 " );	// I'm not sure about the army, but I know for sure that the paladins are already ready to oppose them.
	AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmy_01_03 " );	// And they would certainly need the help of someone like you.
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_04 " );	// This is, of course, good news. However, I am afraid that this will not be enough.
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_05 " );	// They just don't have enough strength to stop all these creatures, and Khorinis' sad experience has already shown this.
	AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmy_01_06 " );	// But if we all unite, then the situation will be somewhat different.
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_08 " );	// Hmmm...(thoughtfully) If that happens, then you're right. Then we really will have a ghostly chance to win this war.
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_09 " );	// But in any case, you can be sure about me. I am always ready to support your wildest ideas.
	OTH_JOINHAGEN = TRUE;
	if(MIS_OLDGUARDGOWAR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_10 " );	// Especially now that I have my guys from the Old Camp with me. You can rely on them!
	}
	else if(REFUSEHELPCAVALORN == FALSE)
	{
		AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_11 " );	// Although, of course, I would be calmer if more reliable people stood in the same row with me. The ones I could rely on!
		AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_12 " );	// I don't trust these arrogant paladins too well.
		AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmy_01_13 " );	// Who exactly do you mean?
		AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_14 " );	// Hmmm... (thoughtfully) Well, at least one of the guys that used to be with me in the Old Camp.
		AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmy_01_15 " );	// We experienced a lot then, and life taught us to always stick together in difficult times.
		AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmy_01_17 " );	// Got it.
		MIS_DIEGOOLDFRIENS = LOG_Running;
		Log_CreateTopic(TOPIC_DIEGOOLDFRIENS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOOLDFRIENS,LOG_Running);
  		B_LogEntry( TOPIC_DIEGOOLDFRIENS , " Diego seems to agree to fight the orcs on the side of the paladins. However, he would rather have his back covered by more reliable people - those he trusts. " );
	}
	else
	{
		B_StartOtherRoutine(thorus_nw,"KillHim");
		B_StartOtherRoutine(scatty_nw,"KillHim");
		AI_Teleport(vlk_6022_thorus,"NW_FARM2_PATH_SCATTY");
		AI_Teleport(vlk_6024_scatty,"NW_FARM2_PATH_01");
		B_KillNpc(vlk_6022_thorus);
		B_KillNpc(vlk_6024_scatty);
		b_killnpccannodead(BAU_4300_Addon_Cavalorn);
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_02");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_03");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_04");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_05");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_06");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_08");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_09");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_10");
		ORCAKILINSERTED = TRUE;
	};
};


instance DIA_DIEGONW_NW_GATHERARMYDONE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 3;
	condition = dia_diegonw_nw_gatherarmydone_condition;
	information = dia_diegonw_nw_gatherarmydone_info;
	permanent = FALSE;
	description = " How about Cavalorn? " ;
};


func int dia_diegonw_nw_gatherarmydone_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_SUCCESS) && (MIS_DIEGOOLDFRIENS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_gatherarmydone_info()
{
	var int ths;
	var int sct;
	AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmyDone_01_00 " );	// How about Cavalorn?
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_01 " );	// (thoughtfully) Yes, I would trust this person with my life.
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_02 " );	// I've been through a lot with him.
	if((THORUSINSERTED == TRUE) && (THORUSJOINME == TRUE) && !Npc_IsDead(vlk_6022_thorus))
	{
		ths = TRUE;
	};
	if((SCATTYINSERTED == TRUE) && (SCATTYJOINME == TRUE) && !Npc_IsDead(vlk_6024_scatty))
	{
		sct = TRUE;
	};
	if((sct == TRUE) || (ths == TRUE))
	{
		if((sct == TRUE) && (ths == TRUE))
		{
			B_GivePlayerXP(150);
			AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmyDone_01_03 " );	// Other than that, Scutty and Torus are here too.
			AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_04 " );	// Great! You can rely on these guys too.
			AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_05 " );	// And they've proven it time and time again.
		}
		else if((sct == TRUE) && (ths == FALSE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmyDone_01_06 " );	// And Scutty's here too.
			AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_07 " );	// Good! You can rely on this guy too.
			AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_08 " );	// And he proved it more than once.
		}
		else if((sct == FALSE) && (ths == TRUE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmyDone_01_09 " );	// And Torus is here too.
			AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_10 " );	// Good! You can rely on this guy too.
			AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_11 " );	// And he proved it more than once.
		};
	}
	else
	{
		B_GivePlayerXP(300);
	};
	AI_Output(other,self, " DIA_DiegoNW_NW_GatherArmyDone_01_12 " );	// Is the problem with trustworthy people solved now?
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_13 " );	// Yes. Thanks for your help.
	AI_Output(self,other, " DIA_DiegoNW_NW_GatherArmyDone_01_14 " );	// And don't forget...(snidely) When you're about to go against the orcs, tell us about it.
	MIS_DIEGOOLDFRIENS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DIEGOOLDFRIENS,LOG_SUCCESS);
	B_LogEntry( TOPIC_DIEGOOLDFRIENS , " Diego now has people around him he can trust. " );
};


instance DIA_DIEGONW_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_soonbattlenow_condition;
	information = dia_diegonw_nw_soonbattlenow_info;
	permanent = FALSE;
	description = " Are you nervous? " ;
};


func int dia_diegonw_nw_soonbattlenow_condition()
{
	if((STOPBIGBATTLE == FALSE) && (MOVEFORCESCOMPLETE_01 == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_soonbattlenow_info()
{
	AI_Output(other,self, " DIA_DiegoNW_NW_SoonBattleNow_01_00 " );	// Are you nervous?
	AI_Output(self,other, " DIA_DiegoNW_NW_SoonBattleNow_01_01 " );	// No, it's just that all this uncertainty is fucking annoying!
	AI_Output(self,other, " DIA_DiegoNW_NW_SoonBattleNow_01_02 " );	// I wish the orcs were moving their butts soon. And then you sit here and do not know what to expect from them!
	AI_Output(other,self, " DIA_DiegoNW_NW_SoonBattleNow_01_03 " );	// I believe that soon everything will clear up.
	AI_Output(self,other, " DIA_DiegoNW_NW_SoonBattleNow_01_04 " );	// Hope mate.
};


instance DIA_DIEGONW_NW_BATTLEWIN(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_battlewin_condition;
	information = dia_diegonw_nw_battlewin_info;
	permanent = FALSE;
	description = " We won this fight! " ;
};


func int dia_diegonw_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_DiegoNW_NW_BattleWin_01_00 " );	// We won this fight!
	AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_01 " );	// (seriously) Yes, mate. I believe the orcs will remember this day for a long time.
	AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_02 " );	// Although the price we had to pay for this victory is quite high.
	if ( FREEDOM  ==  FALSE )
	{
		AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_03 " );	// However, there's nothing you can do about it. Now we need to decide what to do next.
		AI_Output(other,self, " DIA_DiegoNW_NW_BattleWin_01_04 " );	// Do you have any thoughts on this?
		AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_05 " );	// I think the main thing that is important for us now is not to overestimate the significance of this success.
		AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_06 " );	// Still, most of the island is still dominated by these bloodthirsty creatures.
		AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_09 " );	// We shouldn't stop there.
		AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_10 " );	// We need to seize the moment and finish off the enemy before he comes to his senses.
		AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_11 " );	// I'm sure you know how to proceed. After all, you've been in a similar situation more than once.
		AI_Output(self,other, " DIA_DiegoNW_NW_BattleWin_01_12 " );	// Besides, I think many will agree to help you with this. Including me.
	};
};


instance DIA_DIEGONW_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_goonorkshunt_condition;
	information = dia_diegonw_nw_goonorkshunt_info;
	permanent = FALSE;
	description = " You promised to help me! " ;
};


func int dia_diegonw_nw_goonorkshunt_condition()
{
	if (( HAGENGIVEHELP  ==  TRUE ) && ( ALLGREATVICTORY  ==  FALSE ) && ( DIEGOTOBIGLAND  ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && Npc_KnowsInfo(hero,dia_diegonw_nw_battlewin));
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_DiegoNW_NW_GoOnOrksHunt_01_00 " );	// You promised to help me.
	AI_Output(self,other, " DIA_DiegoNW_NW_GoOnOrksHunt_01_01 " );	// Spread out what you have in mind?
	AI_Output(other,self, " DIA_DiegoNW_NW_GoOnOrksHunt_01_02 " );	// It's time to show these creatures who's boss!
	AI_Output(self,other, " DIA_DiegoNW_NW_GoOnOrksHunt_01_03 " );	// That's different, man! You can count on me.
	DIEGOJOINMEHUNT = TRUE;
};


instance DIA_DIEGON_NW_FOLLOW (C_Info) .
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_followme_condition;
	information = dia_diegonw_nw_followme_info;
	permanent = TRUE;
	description = " Follow me! " ;
};


func int dia_diegons_new_follow_me_condition();
{
	if (( DIEGOJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( DIEGOTOBIGLAND  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_followme_info()
{
	AI_Output(other,self, " DIA_DiegoNW_NW_FollowMe_01_00 " );	// Follow me!
	AI_Output(self,other, " DIA_DiegoNW_NW_FollowMe_01_01 " );	// Good! Then go ahead.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_NW_STOPHERE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_stophere_condition;
	information = dia_diegonw_nw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_diegonw_nw_stophere_condition()
{
	if (( DIEGOJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( DIEGOTOBIGLAND  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_stophere_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_StopHere_01_00");	//Жди тут!
	AI_Output(self,other, " DIA_DiegoNW_NW_StopHere_01_01 " );	// Good! If you need me again, you know where to find me.
	Npc_ExchangeRoutine(self,"OrcAtcNW");
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
};


instance DIA_THIEF_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_allgreatvictory_condition;
	information = dia_thief_nw_allgreatvictory_info;
	permanent = FALSE;
	description = " Orc problems are a thing of the past. " ;
};


func int dia_thief_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_thief_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Thief_NW_AllGreatVictory_01_00 " );	// Problems with orcs are a thing of the past.
	AI_Output(self,other, " DIA_Thief_NW_AllGreatVictory_01_01 " );	// Well, great! (smiling) At least, at least it will be calm here now.
	AI_Output(self,other, " DIA_Thief_NW_AllGreatVictory_01_02 " );	// However, I suppose you yourself are well aware that this is far from the end.
	AI_Output(self,other, " DIA_Thief_NW_AllGreatVictory_01_03 " );	// Most likely just a short respite in the face of a new threat.
	AI_Output(other,self, " DIA_Thief_NW_AllGreatVictory_01_04 " );	// We'll find out soon.
};


instance DIA_THIEF_NW_WHATDONOW(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_whatdonow_condition;
	information = dia_thief_nw_whatdonow_info;
	permanent = FALSE;
	description = " So what now? " ;
};


func int dia_thief_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (DIEGOTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Thief_NW_WhatDoNow_01_00");	//И что теперь?
	AI_Output(self,other, " DIA_Thief_NW_WhatDoNow_01_01 " );	// It's up to you to decide.
	AI_Output(self,other, " DIA_Thief_NW_WhatDoNow_01_02 " );	// After all, you are the one who never sits in one place.
	AI_Output(self,other, " DIA_Thief_NW_WhatDoNow_01_03 " );	// I, as always, will keep an eye on you so that you do not get into some bad story again.
	AI_Output(other,self,"DIA_Thief_NW_WhatDoNow_01_05");	//Хорошо.
};


instance DIA_THIEF_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_travelonbigland_condition;
	information = dia_thief_nw_travelonbigland_info;
	permanent = FALSE;
	description = " Are you ready to go with me? " ;
};


func int dia_thief_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_thief_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Thief_NW_TravelOnBigLand_01_00 " );	// Are you ready to go with me?
	AI_Output(self,other, " DIA_Thief_NW_TravelOnBigLand_01_01 " );	// (slyly) Wherever you want, mate!
	AI_Output(other,self, " DIA_Thief_NW_TravelOnBigLand_01_02 " );	// Then we sail to the mainland. I need to send a message to the king urgently.
	AI_Output(self,other, " DIA_Thief_NW_TravelOnBigLand_01_03 " );	// Now that's another matter! Now there will be something to do. When do we perform?
	AI_Output(other,self, " DIA_Thief_NW_TravelOnBigLand_01_04 " );	// The ship is in the harbor, ready to sail.
	AI_Output(self,other, " DIA_Thief_NW_TravelOnBigLand_01_05 " );	// Good. Consider me already there.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	DIEGOTOBIGLAND = TRUE;
	B_LogEntry( TOPIC_SALETOBIGLAND , " Diego didn't have to beg for much! He gladly agreed to come with me. " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_Thief_NW_PICKPOCKET(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_Thief_NW_PICKPOCKET_Condition;
	information = DIA_Thief_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Thief_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 120 , 600 );
};

func void DIA_Thief_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,Dialog_Back,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};
