

where int RagnarPissOff;

instance DIA_STRF_8160_Ragnar_EXIT(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 999;
	condition = DIA_STRF_8160_Ragnar_exit_condition;
	information = DIA_STRF_8160_Ragnar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int DIA_STRF_8160_Ragnar_exit_condition()
{
	return TRUE;
};
func void DIA_STRF_8160_Ragnar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_PreHello (C_Info);
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_PreHello_condition;
	information = DIA_STRF_8160_Ragnar_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8160_Ragnar_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_PreHello_info()
{
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_PreHello_01_00 " );	// What, come to laugh at me too? Come on, I don't care anymore.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_PreHello_01_01 " );	// What are you talking about?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_PreHello_01_02 " );	// I say - leave me! Let me die in peace already.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_Hello(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_Hello_condition;
	information = DIA_STRF_8160_Ragnar_Hello_info;
	permanent = FALSE;
	description = " Looks like you're in trouble mate. " ;
};

func int DIA_STRF_8160_Ragnar_Hello_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_STRF_8160_Ragnar_PreHello ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_Hello_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_01_00 " );	// Looks like you're in trouble, mate.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_01_01 " );	// Problems? (grouchily) What are you doing! I don't have them at all.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_01_02 " );	// Except that I'm an escaped convict and haven't eaten anything in almost a week.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_01_03 " );	// Well, you see? You definitely need my help!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_01_04 " );	// Hmmm... (suspiciously) Who are you, anyway?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " I also sat behind the barrier, just like you. " ,DIA_STRF_8160_Ragnar_Hello_W1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " Simple Adventurer. " ,DIA_STRF_8160_Ragnar_Hello_W2);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " I broke the barrier over the colony! " ,DIA_STRF_8160_Ragnar_Hello_W3);
};

func void DIA_STRF_8160_Ragnar_Hello_W1()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_W1_01_00 " );	// I also sat behind the barrier, just like you.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W1_01_01");	//Правда?!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_W1_01_02 " );	// I heard that all the fugitive convicts either became mercenaries or joined the bandits.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);

	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " As you can see, I am the mercenary from Onar's farm. " ,DIA_STRF_8160_Ragnar_Hello_Q2);
	}
	else
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " This is not for me! " ,DIA_STRF_8160_Ragnar_Hello_Q1);
	};

	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " And I'm just a bandit. " ,DIA_STRF_8160_Ragnar_Hello_Q3);
};

func void DIA_STRF_8160_Ragnar_Hello_W2()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_W2_01_00 " );	// I'm a simple adventurer.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_W2_01_01 " );	// Well, then you've come to the wrong place, boy.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_W2_01_02 " );	// As you can see, there are no adventures here.
};

func void DIA_STRF_8160_Ragnar_Hello_W3()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_W3_01_00 " );	// I destroyed the barrier above the colony!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_W3_01_01 " );	// Well, yes, you can see it.
};

func void DIA_STRF_8160_Ragnar_Hello_Q1()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Q1_01_00 " );	// This is not for me! I prefer not to mess with either one or the other.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Q1_01_01 " );	// And if I were you, I'd rather go either to the city or to the monastery with the Firebenders.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Q1_01_02 " );	// Well, or as a last resort, you can always go to the Brotherhood camp.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Q1_01_03 " );	// They always need new acolytes there!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q1_01_04 " );	// Oh no. Just not to them! I can't stand these idiots since the Barrier!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q1_01_05 " );	// All they know is to smoke their swamp all day long and talk about some Sleeper.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q1_01_06 " );	// I've already thought about the city myself. Yes, only their guards are unlikely to let me go beyond the city gates.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q1_01_07 " );	// And even more so, nothing shines for me in the monastery. Where do I go to magicians with such a past?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " Here's a hundred gold coins for you. " ,DIA_STRF_8160_Ragnar_Hello_T1);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " Hold a thousand coins and stop grumbling! " ,DIA_STRF_8160_Ragnar_Hello_T2);
	};

	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " Then you're in really bad shape. " ,DIA_STRF_8160_Ragnar_Hello_T3);
};

func void DIA_STRF_8160_Ragnar_Hello_Q2()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Q2_01_00 " );	// As you can see, I am the mercenary from Onar's farm.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q2_01_01 " );	// I see, not blind. I've also tried to get on them.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q2_01_02 " );	// But that bastard Sentenza tried to charge me fifty gold coins for my entry.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q2_01_03 " );	// Naturally, I didn't have a penny with me, so he just sent me to Beliar!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Q2_01_04 " );	// With me, he also tried to pull off a similar trick.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q2_01_05 " );	// And what did you do?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " Paid, of course! No other way. " ,DIA_STRF_8160_Ragnar_Hello_Y1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " It doesn't matter what I did. " ,DIA_STRF_8160_Ragnar_Hello_Y2);
};

func void DIA_STRF_8160_Ragnar_Hello_Y1()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Y1_01_06 " );	// Paid, of course! No other way.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Y1_01_07 " );	// Hmmm... Yes, I would do exactly the same if I had them.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Y1_01_08 " );	// Could you lend me fifty coins?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Y1_01_09 " );	// And I wouldn't be in debt! What do you say?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " No, that's a whole bunch of gold. " ,DIA_STRF_8160_Ragnar_Hello_R1);

	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello, " Of course buddy! I'll help you out anyway. " ,DIA_STRF_8160_Ragnar_Hello_R2);
	};
};

func void DIA_STRF_8160_Ragnar_Hello_Y2()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Y2_01_10 " );	// Doesn't matter what I did. The main thing is that this bastard did not get a penny from me.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Y2_01_11 " );	// And you're a daredevil, I'll see... (respectfully) Maybe I should have kicked his ass too?
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Y2_01_12 " );	// Of course! That's the only way you can make him respect you.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Y2_01_13 " );	// Okay...(scratching the back of his head) Then I'll rest for a while, and then I'll go and deal with this guy.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Y2_01_14 " );	// Thanks for the tip, mate.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y2_01_15");	//Не за что.
	AI_StopProcessInfos(self);
	RagnarKill = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_Q3()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_Q3_01_00 " );	// And I'm just a bandit! So bring your gold here.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q3_01_01 " );	// I don't have a penny...(doomed) So if you want, you can just kill me!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_Q3_01_02 " );	// Come on, I don't care anymore...
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};


func void DIA_STRF_8160_Ragnar_Hello_R1()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_R1_01_00 " );	// No, what are you! It's a whole bunch of gold.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_R1_01_01 " );	// Well... (sullenly) I trusted the man! And he feels sorry for some fifty gold coins.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_R1_01_02 " );	// Get lost! I have nothing more to discuss with someone like you.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_R2()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_R2_01_00 " );	// Of course, mate! So be it, I will rescue you.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	Npc_RemoveInvItems(self,ItMi_Gold,50);
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_R2_01_01 " );	// Here, that's another matter. It is immediately clear that in front of me is a person, and not a piece of shit.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_R2_01_02 " );	// So, now you can go to the mercenaries. Only first I will rest a little, and then I will move to the farm.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_R2_01_03 " );	// See you there!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_R2_01_04 " );	// Of course.
	AI_StopProcessInfos(self);
	RagnarIsSLD = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_T1()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T1_01_00 " );	// Here's a hundred gold pieces for you. Just stop whining.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Npc_RemoveInvItems(self,ItMi_Gold,100);
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T1_01_01 " );	// And why are you giving me this gold?
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T1_01_02 " );	// You will give it to the guards at the southern gates of the city.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T1_01_03 " );	// For that amount, they'll let you pass without question.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T1_01_04 " );	// Well, if so... Then, perhaps, I'll go to the city and try my luck there.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T1_01_05 " );	// Okay, see you later.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T1_01_06 " );	// Of course.
	AI_StopProcessInfos(self);
	RagnarIsMIL = TRUE;
};


func void DIA_STRF_8160_Ragnar_Hello_T2()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T2_01_00 " );	// Hold a thousand coins and stop grumbling!
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T2_01_01 " );	// Boy, are you out of your mind? (surprised) Do you really want to give me that much gold?!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T2_01_02 " );	// The Fire Mages at the monastery demand a small tribute from each newcomer.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T2_01_03 " );	// And this amount is enough to atone for all your old sins.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T2_01_04 " );	// I didn't think that there are people like you in the world... (respectfully) But everyone makes mistakes sometimes.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T2_01_05 " );	// Okay, then, perhaps, I'll go to the monastery. Plus, I heard they make excellent wine!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T2_01_07 " );	// I'll see you there.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T2_01_08 " );	// Of course.
	AI_StopProcessInfos(self);
	RagnarIsNOV = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_T3()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Hello_T3_01_00 " );	// Then you're really in trouble.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T3_01_01 " );	// I'm surprised! I know all this without you.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Hello_T3_01_02 " );	// Eh...(sullenly) You'd better go where you're going and leave me alone.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_PissOff(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_PissOff_condition;
	information = DIA_STRF_8160_Ragnar_PissOff_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8160_Ragnar_PissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RagnarPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_PissOff_info()
{
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_PissOff_01_00 " );	// Back off! Not up to you...
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_Wait (C_Info) .
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_Wait_condition;
	information = DIA_STRF_8160_Ragnar_Wait_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8160_Ragnar_Wait_condition()
{
	if((RagnarIsNOV == TRUE) || (RagnarIsSLD == TRUE) || (RagnarIsMIL == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_Wait_info()
{
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	};

	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Wait_01_00 " );	// Wait! Damn... I can't even stand up.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Wait_01_01 " );	// What else is this?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Wait_01_02 " );	// I haven't eaten for so many days that I seem to be completely exhausted.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Wait_01_03 " );	// Maybe you could bring me something to eat?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Wait_01_04 " );	// Let's say a regular piece of grilled meat and a bottle of water.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_Wait_01_05 " );	// I don't ask for more... (sadly) But I won't last long without it.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_Wait_01_06 " );	// Okay, wait here. I'll bring you food.
	MIS_RagnarFood = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarFood,LOG_Running);
	B_LogEntry(TOPIC_RagnarFood, " Ragnar hasn't eaten in such a long time that he's completely exhausted. We'll have to help the poor fellow and bring him some food, namely a piece of fried meat and a bottle of water. " );
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_WaitDone(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_WaitDone_condition;
	information = DIA_STRF_8160_Ragnar_WaitDone_info;
	permanent = FALSE;
	description = " Here's your food. " ;
};

func int DIA_STRF_8160_Ragnar_WaitDone_condition()
{
	if((MIS_RagnarFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 1) && (Npc_HasItems(other,ItFo_Water) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_WaitDone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_WaitDone_01_00 " );	// Here's your food.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,1);
	Npc_RemoveInvItems(other,ItFo_Water,1);
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_WaitDone_01_01 " );	// Oh, thank you, buddy. He didn't let me die of hunger.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_WaitDone_01_02 " );	// Enjoy.
	MIS_RagnarFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarFood,LOG_Success);
	B_LogEntry(TOPIC_RagnarFood, " I kept Ragnar from starving. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Pear");
};

// --------------------------------monastery branch-------------- ----------------------------------


instance DIA_STRF_8160_Ragnar_NOV(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_condition;
	information = DIA_STRF_8160_Ragnar_NOV_info;
	permanent = FALSE;
	description = " How did it go? " ;
};

func int DIA_STRF_8160_Ragnar_NOV_condition()
{
	if ((Chapter >=  2 ) && (self.guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_01_00 " );	// How did it go?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_01_01 " );	// Thanks to your help, the magicians accepted me as a monk of the monastery. But still, I'm a little disappointed.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_01_02 " );	// What else is this?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_01_03 " );	// Yes, everything would be fine, but all day long I do nothing but sweep the floors and bend my back in the garden.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_01_04 " );	// Everyone around me keeps telling me that the first step is to learn patience, and this can take years!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_01_05 " );	// But it's still better than starving in the forest. Is not it?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_01_06 " );	// Yeah, you can't argue with you... (chuckling)
};


instance DIA_STRF_8160_Ragnar_NOV_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Q1_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Q1_info;
	permanent = FALSE;
	description = " You just need to impress mages. " ;
};

func int DIA_STRF_8160_Ragnar_NOV_Q1_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_STRF_8160_Ragnar_NOV ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1_01_01 " );	// You just need to impress the mages.
 	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_01_02 " );	// I already thought about it. And I even came up with an idea!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1_01_03 " );	// What are you thinking?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_01_04 " );	// I heard that Master Neoras needed an assistant urgently. But he has not yet chosen any of the novices.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_01_05 " );	// I also learned that he is extremely interested in rare herbs for his experiments.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1_01_06 " );	// And what exactly is he interested in?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_01_07 " );	// Some plant he calls troll cherry. Beliar knows what it looks like and where to look for it!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_01_08 " );	// So, if I bring him this herb, he will surely make a choice in my favor.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1_01_09 " );	// Then what are you waiting for? Go and find her!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_01_10 " );	// Not everything is so simple, my friend... (sadly) Parlan will never let me out of the monastery.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_01_11 " );	// This old bastard keeps an eye on what I'm doing. And he doesn't seem to trust me much.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_01_12 " );	// So I thought: maybe you can get this plant for me?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_NOV_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_NOV_Q1, " Okay. I'll try to get it for you. " ,DIA_STRF_8160_Ragnar_NOV_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_NOV_Q1, " No, do it yourself! " ,DIA_STRF_8160_Ragnar_NOV_Q1_No);
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_Yes()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_01 " );	// Okay. I'll try to get it for you.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_02 " );	// Thank you, buddy. You just can't imagine how tired I am of sweeping these cells and cultivating the land for a vineyard!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_03 " );	// After all, I didn't make it out of the Valley of Mines to work like hell again!
	MIS_RagnarNeoras = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarNeoras,LOG_Running);
	B_LogEntry(TOPIC_RagnarNeoras, " Ragnar is unhappy that he has to bend his back all day in the monastery. But he heard that Master Neoras needed an assistant. To impress him, Ragnar needs to bring him a rare plant - troll cherry, and he asked me to get this plant, since he himself is forbidden to leave the monastery. " );
	AI_StopProcessInfos(self);
	Wld_InsertItem(ITPL_SUPER_HERB,"FP_ITEM_RAGNARFLOWER");
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_No()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1_No_01_01 " );	// No, do it yourself!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1_No_01_02 " );	// I already helped you enter the monastery. I just don't have time for the rest.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_No_01_03 " );	// Oh, okay... Looks like I'll have to sweep these cells for the rest of my days.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1_No_01_04 " );	// And I really counted on you, buddy...
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_NOV_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Q1Done_info;
	permanent = FALSE;
	description = " I brought the plant you need. " ;
};

func int DIA_STRF_8160_Ragnar_NOV_Q1Done_condition()
{
	if((MIS_RagnarNeoras == LOG_Running) && (Npc_HasItems(other,ITPL_SUPER_HERB) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Q1Done_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1Done_01_00 " );	// I brought the plant you need.
	B_GiveInvItems(other,self,ITPL_SUPER_HERB,1);
	Npc_RemoveInvItems(self,ITPL_SUPER_HERB,1);
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1Done_01_01 " );	// Wow! Never thought it would look like this.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Q1Done_01_02 " );	// Instead of scratching your tongue, take it to Master Neoras as soon as possible.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Q1Done_01_03 " );	// Yes, buddy, you're right! And then suddenly someone else will take my place.
	MIS_RagnarNeoras = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarNeoras,LOG_Success);
	B_LogEntry(TOPIC_RagnarNeoras, " I brought Ragnar the plant he wanted. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Neoras");
};

var int RangarFireContestDay;

instance DIA_STRF_8160_Ragnar_NOV_Neoras(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Neoras_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Neoras_info;
	permanent = FALSE;
	description = " Did everything work out? " ;
};

func int DIA_STRF_8160_Ragnar_NOV_Neoras_condition()
{
	if(MIS_RagnarNeoras == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Neoras_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_NOV_Neoras_01_00 " );	// Did everything work out?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Neoras_01_01 " );	// (pretty) As you can see. I am now Master Neoras' assistant! And it's all thanks to you.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Neoras_01_02 " );	// Here, take this potion. Neoras himself gave it to me because I brought him that herb.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_NOV_Neoras_01_03 " );	// I think it's rightfully yours.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	RangarFireContestDay = Wld_GetDay();
};

instance DIA_STRF_8160_Ragnar_BecameKDF(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_info;
	permanent = FALSE;
	description = " What's new? " ;
};

func int DIA_STRF_8160_Ragnar_BecameKDF_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if ((Npc_KnowsInfo(hero,DAY_STRF_8160_Ragnar_NOV_Night) ==  TRUE ) && (Chapter >=  4 ) && (FightFireContestDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_01_00 " );	// What's new?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_01_01 " );	// Trial of Fire just started... (nervously) For me and a few other novices.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_01_02 " );	// I don't think you liked it too much.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_01_03 " );	// I didn't have a choice. Master Neoras personally proposed my candidacy to Pirokar!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_01_04 " );	// And now I have no idea how I can deal with all this.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_01_05 " );	// If I fail this test, I'll surely let Master Neoras down badly.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_01_06 " );	// And then I'll have to work again with a hoe in my hands in the vineyards.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_01_07 " );	// And as you understand, this is not a pleasant occupation!
};

instance DIA_STRF_8160_Ragnar_BecameKDF_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_Q1_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_Q1_info;
	permanent = FALSE;
	description = " What task did the Magi give you? " ;
};

func int DIA_STRF_8160_Ragnar_BecameKDF_Q1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_BecameKDF) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_00 " );	// What task did the magicians give you?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_01 " );	// Make a fire arrow rune. But I don't even know where to start.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_02 " );	// I think you'll need a runestone first.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_03 " );	// Even you know that...(doomedly) So tell me - which of the former miner-convict is a magician of Fire?
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_04 " );	// There's nothing you can do about it, mate. You'll have to at least try.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_05 " );	// You know, I have an idea here.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_06 " );	// Since you're better than me at all this, maybe you can get this rune for me?
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_07 " );	// What?! Why did you suddenly take it?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_08 " );	// Well, you know me, I will not remain in debt.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_09 " );	// Here, in the basement of the monastery, there are all sorts of valuable things!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_10 " );	// And I could share all this goodness with you. Let's say it's a quid pro quo.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_11 " );	// How do you like this offer?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_BecameKDF_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_BecameKDF_Q1, " Daughter, yes! " ,DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_BecameKDF_Q1, " No, I don't want to deal with this anymore. " ,DIA_STRF_8160_Ragnar_BecameKDF_Q1_No);
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_01 " );	// Okay, deal with it!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_02 " );	// Only it has to be a really, really valuable thing.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_03 " );	// I got you, buddy... (chuckling) Don't worry about it.
	MIS_RagnarRune = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarRune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarRune,LOG_Running);
	B_LogEntry(TOPIC_RagnarRune, " Ragnar was forced to participate in the Trial of Fire! The magicians gave him the task of making a fireball rune. However, the poor fellow does not even know how to approach this task. If he fails the test, then he will probably have to work hard again. For he promised to give me my help a very valuable thing from the treasury of the monastery. " );
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItRu_FireBolt, " FP_ITEM_RAGNARRUNE " );
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_No()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_No_01_01 " );	// No, I don't want to mess with this anymore.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1_No_01_02 " );	// Okay, as you know. You'll have to get out somehow.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_BecameKDF_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_info;
	permanent = FALSE;
	description = " Here's your rune. " ;
};

func int DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_condition()
{
	if((MIS_RagnarRune == LOG_Running) && (Npc_HasItems(other,ItRu_FireBolt) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_00 " );	// Here's your rune.
	B_GiveInvItems(other,self,ItRu_FireBolt,1);
	Npc_RemoveInvItems(self,ItRu_FireBolt, 1 );
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_01 " );	// (delighted) I knew you could do it! Now I have nothing more to fear for my fate!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_02 " );	// Where's my reward?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_03 " );	// Of course, I haven't forgotten about our contract. Here, take this old book.
	B_GiveInvItems(self,other,ItWr_MonasterySecret,1);
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_04 " );	// Book?! Was there anything more interesting?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_05 " );	// Don't rush! I think it is of great value to sorcerers.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_06 " );	// After all, I took it from the closed section of the monastery library.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_07 " );	// True, it took a lot of work to divert Talamon's attention. But I still succeeded!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_08 " );	// And while he was busy doing something else, I stole this book from one of the bookshelves.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_09 " );	// Okay, I'll see what book it is later. And now it's time for me.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_10 " );	// Good luck mate! And then I'll go to Pirokar and show him my craft.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_11 " );	// I'll please the old man... (chuckling)
	MIS_RagnarRune = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarRune,LOG_Success);
	B_LogEntry(TOPIC_RagnarRune, " I brought Ragnar a magical rune. For that he gave me some old trash in the form of a book. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Pyrokar");
};

instance DIA_STRF_8160_Ragnar_KDF (C_Info) .
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_KDF_condition;
	information = DIA_STRF_8160_Ragnar_KDF_info;
	permanent = FALSE;
	description = " So you're a Firebender now! " ;
};

func int DIA_STRF_8160_Ragnar_KDF_condition()
{
	if((MIS_RagnarRune == LOG_Success) && (RagnarIsKDF == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_KDF_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_KDF_01_00 " );	// So you're a Firebender now!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_KDF_01_01 " );	// (puzzled) I can't believe it myself...
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_KDF_01_02 " );	// Just a couple of weeks ago, I was starving in the woods.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_KDF_01_03 " );	// And now I am one of the most respected people of the monastery. It happens!
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_KDF_01_04 " );	// Hope you don't need my help now?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_KDF_01_05 " );	// Not yet... (maliciously) And there, who knows.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_KDF_01_06 " );	// Don't even think about it.
};

// ---------------------------------------------Ragnar Militiaman-- ----------------------------------------------

instance DIA_STRF_8160_Ragnar_MIL(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_condition;
	information = DIA_STRF_8160_Ragnar_MIL_info;
	permanent = FALSE;
	description = " Have you joined the militia? " ;
};

func int DIA_STRF_8160_Ragnar_MIL_condition()
{
	if ((Capital >=  2 ) && (self.guild ==  GIL_MIL ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_01_00 " );	// Have you joined the militia?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_01_01 " );	// Not on a whim. I did everything just like you said.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_01_02 " );	// I gave a hundred coins to the guards that stood at the entrance, and politely asked them to let me into the city.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_01_03 " );	// But it wasn't there! They grabbed me and dragged me to their barracks to some Lord Andre!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_01_04 " );	// He interrogated me for a long time, and in the end I was faced with a choice.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_01_05 " );	// Either join the militia or go to jail!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_01_06 " );	// So now I'm standing guard here and guarding the entrance to the tower.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_01_07 " );	// But for me it's better than hanging from the gallows with a rope around your neck.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_01_08 " );	// Yeah, mate. Looks like you just went to the wrong gate.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_01_09 " );	// Though it doesn't matter anymore.
};

instance DIA_STRF_8160_Ragnar_MIL_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Q1_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Q1_info;
	permanent = FALSE;
	description = " Need no more help? " ;
};

func int DIA_STRF_8160_Ragnar_MIL_Q1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_MIL) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1_01_00 " );	// No more help needed?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_01_01 " );	// How can you help me, mate?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_01_02 " );	// Now, if I myself somehow distinguished myself in front of Lord Andre ...
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_01_03 " );	// Then, you see, you wouldn't have to hang around here all day like a damned one.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1_01_04 " );	// Do you have any thoughts on this?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_01_05 " );	// I've heard that a few bandits have been seen near the southern city walls.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_01_06 " );	// It would be nice to deal with them! And the bounty on their heads is surely rather big.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1_01_07 " );	// And what's stopping you?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_01_08 " );	// Like what?! I just can't leave my post!
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_01_09 " );	// If someone from the militia finds out about this, then I will have a hard time.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1, " Let me deal with them. " ,DIA_STRF_8160_Ragnar_MIL_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1, " Yes, you're in trouble. " ,DIA_STRF_8160_Ragnar_MIL_Q1_No);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_Yes()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_00 " );	// Let me deal with them.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_01 " );	// (surprised) Are you serious?
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_02 " );	// Don't worry! I can handle them.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_03 " );	// If you help me, I won't be indebted.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_04 " );	// I have a lot of junk in my warehouse! Surely you will need something.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_05 " );	// Okay, agreed.
	MIS_RagnarBandits = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarBandits,LOG_Running);
	B_LogEntry(TOPIC_RagnarBandits, " I agreed to help Ragnar deal with a gang of bandits that was seen near the southern city gate. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(BDT_10046_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
	Wld_InsertNpc(BDT_10047_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
	Wld_InsertNpc(BDT_10048_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_No()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1_No_01_00 " );	// Yes, things are bad for you.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_No_01_01 " );	// (sadly) Okay, stop talking...
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_No_01_02 " );	// And then someone else will inadvertently surprise that I'm chatting with you here at the post.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1_No_01_03 " );	// They'll kick you out! And again you have to die of hunger.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_MIL_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Q1Done_info;
	permanent = FALSE;
	description = " Your bandits are finished. " ;
};

func int DIA_STRF_8160_Ragnar_MIL_Q1Done_condition()
{
	if((MIS_RagnarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_RagnarBand) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_01_00 " );	// Your bandits are finished.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_01_01 " );	// Of course I believe you, buddy...
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_01_02 " );	// But Lord Andre will surely need more solid evidence.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_01_03 " );	// Then just give him this letter. One of those vagrants had it.
	B_GiveInvItems(other,self,ItWr_RagnarBand,1);
	Npc_RemoveInvItems(self,ItWr_RagnarBand,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_04");	//О чем оно?
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_01_05 " );	// See for yourself.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_01_06 " );	// Hmmm...(thoughtfully) Yes, I think Lord Andre would be extremely interested in looking at its contents.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_01_07 " );	// Well, that's nice. What have you prepared for me?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_01_08 " );	// Here, take your pick.
	MIS_RagnarBandits = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarBandits,LOG_Success);
	B_LogEntry(TOPIC_RagnarBandits, " To prove that the bandits are finished, I brought Ragnar a letter from one of them. " );
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done, " Box " ,DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done, " вЂ‚вЂ‹вЂ‹вЂ‹ " ,DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done, " Material " ,DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_01 " );	// I'll take the helmet.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_02 " );	// (businesslike) Good. Here, now it's yours.
	B_GiveInvItems(self,other,ItAr_Helm_01,1);
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_03 " );	// As they say, the hand washes the hand.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_04 " );	// Thank you.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_01 " );	// Give me the bolts.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_02 " );	// (businesslike) Good. Here, hold them.
	B_GiveInvItems(self,other,ItRw_Bolt,50);
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_03 " );	// As they say, the hand washes the hand.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_04 " );	// Thank you.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_01 " );	// I liked the sword.
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_02 " );	// (businesslike) Good. Here he is.
	B_GiveInvItems(self,other,ItMw_1h_Pal_Sword,1);
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_03 " );	// As they say, the hand washes the hand.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_04 " );	// Thank you.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

instance DIA_STRF_8160_Ragnar_MIL_Up(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Up_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Up_info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int DIA_STRF_8160_Ragnar_MIL_Up_condition()
{
	if((Kapitel >= 3) && (MIS_RagnarBandits == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Up_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Up_01_00");	//Как жизнь?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_MIL_Up_01_01 " );	// As you can see, now I guard the upper quarter of the city.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_MIL_Up_01_02 " );	// Well, well, I'm glad for you.
};

// ---------------------------------------------Ragnar the Mercenary-- ----------------------------------------------

instance DIA_STRF_8160_Ragnar_SLD(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_SLD_condition;
	information = DIA_STRF_8160_Ragnar_SLD_info;
	permanent = FALSE;
	description = " I see everything went smoothly? " ;
};

func int DIA_STRF_8160_Ragnar_SLD_condition()
{
	if((Kapitel >= 2) && (self.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_SLD_info()
{
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_SLD_01_00 " );	// I see everything went smoothly?
	AI_Output(self,other, " DIA_STRF_8160_Ragnar_SLD_01_01 " );	// (pretty) Yes. Li accepted me as a mercenary! Now I am his man.
	AI_Output(other,self, " DIA_STRF_8160_Ragnar_SLD_01_02 " );	// Well, I'm glad for you.
};
