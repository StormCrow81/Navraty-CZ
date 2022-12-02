

instance DIA_XARDAS_GOBLIN_EXIT(C_Info)
{
	npc = xardas_goblin;
	nr = 999;
	condition = dia_xardas_goblin_exit_condition;
	information = dia_xardas_goblin_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xardas_goblin_exit_condition()
{
	return TRUE;
};

func void dia_xardas_goblin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_HELLO(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_hello_condition;
	information = dia_xardas_goblin_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_goblin_hello_condition()
{
	if(XARDASGOBLINATTACKED == TRUE)
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_hello_info()
{
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_01_00 " );	// (mournfully) Wait, man, and listen to the unfortunate goblin's verb...
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_01_01 " );	// Wow! Talking Goblin!
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_01_02 " );	// Scavenger looks at me as if he saw scraps!
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_01_03 " );	// Really hitherto you have not seen goblins who understand human speech?
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_01_04 " );	// No, I didn't. How do you even manage to speak? And yet so strange?
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_01_05 " );	// Magus alone, possessing power, rewarded me with knowledge.
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_01_06 " );	// (sadly) But where there is a lot of knowledge, there is a lot of grief...
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_01_07 " );	// Listen! He asks for your help, man, poor goblin.
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_01_08 " );	// In return, I'll give you magical things from the chest that stands next to us.
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_01_09 " );	// So this is YOUR chest? What's stopping me from just taking your key and its contents?
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_01_10 " );	// (belligerently) Although I am small in stature, I have great strength in my paws!
	Info_ClearChoices(dia_xardas_goblin_hello);
	Info_AddChoice(dia_xardas_goblin_hello, " Okay, how can I help you? " ,dia_xardas_goblin_hello_ok);
	Info_AddChoice(dia_xardas_goblin_hello, " Oh right?! Hold on. " ,dia_xardas_goblin_hello_no);
};

func void dia_xardas_goblin_hello_ok()
{
	AI_RemoveWeapon(other);
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_Ok_01_01 " );	// Ha, well, let's say, and how can I help the GOBLIN?
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_02 " );	// My point is that I am not a goblin in my nature. And the ghost is bodily, immortal and eternal in its sorrow.
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_03 " );	// Magus called me to his service long ago, we lived with him for a long time in the tower behind your back.
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_Ok_01_05 " );	// So you are the spirit summoned by the necromancer Xardas?
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_Ok_01_06 " );	// Then all the more than I can help YOU?
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_07 " );	// More than anything, I want to perish from this world!
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_08 " );	// Cast me out like I'm a ghost that threatens the living.
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_Ok_01_09 " );	// What?! And how will I do it?
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_10 " );	// Xardas kept a pile of special scrolls, servants to drive out if the time comes. Apparently, he has these scrolls.
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_11 " );	// Also, there probably is at least one scroll in the old tower, that's for sure.
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_Ok_01_12 " );	// Okay, I'll think of something.
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_13 " );	// Before leaving, I want to give you instructions:
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_14 " );	// If you go straight to the necromancer, don't say you met me, for the servants...
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_15 " );	// ...the magus is unlikely to be merciful. 	
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_16 " );	// I'll also tell you if you're going to visit the tower, be careful.
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_Ok_01_17 " );	// Undead and demons of evil live there, having risen from hell itself.
	MIS_GOBLINAWAY = LOG_Running;
	Log_CreateTopic(TOPIC_GOBLINAWAY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOBLINAWAY,LOG_Running);
	B_LogEntry( TOPIC_GOBLINAWAY , " Not far from the old tower of Xardas, I met a strange creature - a talking goblin! He turned out to be a ghost, although you can't tell from the outside. The goblin asked me for help, and in return promised to give me a couple of valuable things from his chest. I need to get a scroll of exile and use it to put the soul of this goblin to rest. You can look for such a scroll in the old tower or ask Xardas himself, who summoned the soul of the goblin to this world. " );
	AI_StopProcessInfos(self);
};

func void dia_xardas_goblin_hello_no()
{
	AI_Output(other,self, " DIA_Xardas_Goblin_Hello_No_01_01 " );	// Force?! Yes, I like you, like a barbecue - I string three pieces at a time on a sword.
	AI_Output(self,other, " DIA_Xardas_Goblin_Hello_No_01_02 " );	// Stupidity is sometimes fatal for life!
	XARDASGOBLINHUNT = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_BRINGSCROLL(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_bringscroll_condition;
	information = dia_xardas_goblin_bringscroll_info;
	permanent = FALSE;
	description = " I found a scroll of banishment. " ;
};


func int dia_xardas_goblin_bringscroll_condition()
{
	if((MIS_GOBLINAWAY == LOG_Running) && (Npc_HasItems(hero,itwr_xardasgoblinscroll) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_bringscroll_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Xardas_Goblin_BringScroll_01_01 " );	// I found the scroll of banishment. How about a reward?
	AI_Output(self,other, " DIA_Xardas_Goblin_BringScroll_01_02 " );	// There is no limit to the happiness of the poor goblin! Come on, give me freedom.
	AI_Output(self,other, " DIA_Xardas_Goblin_BringScroll_01_03 " );	// I give you my word that as soon as the chains that hold my spirit in this world...
	AI_Output(self,other, " DIA_Xardas_Goblin_BringScroll_01_04 " );	// ...your exorcism will destroy, I will give you the key to the chest.
	XARDASGOBLINREADYAWAY = TRUE;
	B_LogEntry( TOPIC_GOBLINAWAY , " To exorcise the soul of a ghost goblin, I just need to use a scroll. " );
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_WAIT(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_wait_condition;
	information = dia_xardas_goblin_wait_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_xardas_goblin_wait_condition()
{
	if((MIS_GOBLINAWAY == LOG_Running) && (XARDASGOBLINREADYAWAY == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_wait_info()
{
	AI_Output(self,other, " DIA_Xardas_Goblin_Wait_01_01 " );	// Why are you delaying? There is no more languishing urine in this world!
	AI_StopProcessInfos(self);
};

// ------------------Shakzi----------------------------- --------

instance DIA_Gobbo_Desert_EXIT(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 999;
	condition = DIA_Gobbo_Desert_EXIT_condition;
	information = DIA_Gobbo_Desert_EXIT_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gobbo_Desert_EXIT_condition()
{
	return TRUE;
};

func void DIA_Gobbo_Desert_EXIT_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gobbo_Desert_HELLO(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_HELLO_condition;
	information = DIA_Gobbo_Desert_HELLO_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Gobbo_Desert_HELLO_condition()
{
	if(GoblinKing == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_HELLO_info()
{
	AI_Output(self,other, " DIA_Gobbo_Desert_HELLO_01_00 " );	// Human... human, human! Shakzi see that he is wearing a Heer Shar.
	AI_Output(other,self, " DIA_Gobbo_Desert_HELLO_01_01 " );	// Are you talking to me?!
	AI_Output(self,other, " DIA_Gobbo_Desert_HELLO_01_02 " );	// Stupid person! Does he see more people here?...Shakzi talk to him! He doesn't understand...funny man!
	AI_Output(other,self, " DIA_Gobbo_Desert_HELLO_01_03 " );	// Since when did goblins start speaking human language?
	AI_Output(self,other, " DIA_Gobbo_Desert_HELLO_01_04 " );	// People used to live here... a lot of people. Now nobody! All to die... long to die.
	AI_Output(self,other, " DIA_Gobbo_Desert_HELLO_01_05 " );	// Shakzi know a little the language of the people. Live nearby, see people, listen to people.
	AI_Output(other,self, " DIA_Gobbo_Desert_HELLO_01_06 " );	// Or I'm just lucky with talking goblins.
};

instance DIA_Gobbo_Desert_WhatNeed(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_WhatNeed_condition;
	information = DIA_Gobbo_Desert_WhatNeed_info;
	permanent = FALSE;
	description = " Why did you suddenly decide to talk to me? " ;
};

func int DIA_Gobbo_Desert_WhatNeed_condition()
{
	if ((GoblinKing ==  TRUE ) && (Npc_KnowsInfo(hero,DIA_Gobbo_Desert_HELLO) ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_WhatNeed_info()
{
	AI_Output(other,self, " DIA_Gobbo_Desert_WhatNeed_01_00 " );	// And why did you suddenly decide to talk to me?
	AI_Output(self,other, " DIA_Gobbo_Desert_WhatNeed_01_01 " );	// Shakzi to see that a person is not simple. He carry with him Heer Shar!
	AI_Output(other,self, " DIA_Gobbo_Desert_WhatNeed_01_02 " );	// What is Heer Shar?
	AI_Output(self,other, " DIA_Gobbo_Desert_WhatNeed_01_03 " );	// Stupid person! Don't know what Hir Shar is! Wear it yourself and know nothing. Funny man!
	AI_Output(other,self, " DIA_Gobbo_Desert_WhatNeed_01_04 " );	// So you mean this cudgel hanging on my back?
	AI_Output(self,other, " DIA_Gobbo_Desert_WhatNeed_01_05 " );	// Man be a cudgel himself! Heer Shar is not a club... He is a sign of power for goblins. All Shakzi brothers respect this totem!
	AI_Output(self,other, " DIA_Gobbo_Desert_WhatNeed_01_06 " );	// But Shakzi doesn't know where he comes from, man?
	AI_Output(self,other, " DIA_Gobbo_Desert_WhatNeed_01_07 " );	// Maybe he should steal it? Or kill the Shakzi brothers and take Heer Shar for yourself?
	AI_Output(other,self, " DIA_Gobbo_Desert_WhatNeed_01_08 " );	// No! It's just a gift from one of the goblins.
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_09");	//Подарок?!
	AI_Output(other,self, " DIA_Gobbo_Desert_WhatNeed_01_10 " );	// Yes, a gift. What's so amazing about that? I helped him in one very important matter, and as a token of gratitude he left me this one of yours... Khir Shar.
	AI_Output(self,other, " DIA_Gobbo_Desert_WhatNeed_01_11 " );	// Great to be a gift! Very large and very valuable...
	AI_Output(self,other, " DIA_Gobbo_Desert_WhatNeed_01_12 " );	// Shakzi thinks a person is very helpful to someone who gives him a Heer Shar.
	AI_Output(other,self, " DIA_Gobbo_Desert_WhatNeed_01_13 " );	// So this piece of wood means something to you.
	AI_Output(self,other, " DIA_Gobbo_Desert_WhatNeed_01_14 " );	// Whoever wears it doesn't have to be afraid of goblins. Goblins don't touch him!
	AI_Output(other,self, " DIA_Gobbo_Desert_WhatNeed_01_15 " );	// Hmmm... That explains a lot then.
};

instance DIA_Gobbo_Desert_Quest(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_Quest_condition;
	information = DIA_Gobbo_Desert_Quest_info;
	permanent = FALSE;
	description = " Anything else? " ;
};

func int DIA_Gobbo_Desert_Quest_condition()
{
	if((GoblinKing == TRUE) && (Npc_KnowsInfo(hero,DIA_Gobbo_Desert_WhatNeed) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_Quest_info()
{
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_00 " );	// Anything else?
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_01 " );	// Man to be right... Shakzi doesn't just talk to him like that. He wants that one to help him a little too.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_02 " );	// For this, Shakzi give the person a big and valuable reward! A person must like it very much.
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_03 " );	// Okay, you've got me intrigued. And what will my help be?
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_04 " );	// A human must help find one thing for Shakzi - their sacred totem!
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_05 " );	// Holy totem? What else is this?
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_06 " );	// To be so beautiful, to be so shiny, to stand over there on the big rock in the middle of the camp.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_07 " );	// All brothers worship him every day, listen to what he says to them, and bring gifts to him.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_08 " );	// But recently he disappeared! Nobody knows how it will happen. He stand there, and then he does not become.
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_09 " );	// Was he stolen?
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_10 " );	// Shakzi doesn't know... But he's sure none of his brothers could have done it.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_11 " );	// They all respect and fear the sacred totem very much, and now all the Shakzi brothers are very sad.
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_12 " );	// Well, okay. Can you describe more precisely what it looked like, this your ... totem?
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_13 " );	// Mmmm... He's so handsome, like... like people's gold! Yes exactly! And it shines in the sun, shines very strongly.
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_14 " );	// And that's all?! Yes, not so much.
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_15 " );	// What happens... Usually the goblins themselves drag everything that lies badly. Especially gold. And here, apparently, the thing was stolen from you yourself.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_16 " );	// Man laughing in vain... Shakzi doesn't want to joke right now. Shakzi must return the totem to its place! Otherwise, be trouble for them. Big trouble!
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_17 " );	// Okay, don't worry! I will look for it for you. Just don't forget the reward you promised.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_01_18 " );	// Shakzi remember everything. The person need not worry. But Shakzi is waiting for a man when he returns the totem to him.
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_01_19 " );	// No doubt...
	MIS_GoblinTotem = LOG_Running;
	Log_CreateTopic(TOPIC_GoblinTotem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GoblinTotem,LOG_Running);
	B_LogEntry(TOPIC_GoblinTotem, " Goblin Shakzi asked me to look for a sacred goblin totem that was missing from their camp. " );
	AI_StopProcessInfos(self);
};

instance DIA_Gobbo_Desert_Quest_Done(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_Quest_Done_condition;
	information = DIA_Gobbo_Desert_Quest_Done_info;
	permanent = FALSE;
	description = " This isn't your totem, is it? " ;
};

func int DIA_Gobbo_Desert_Quest_Done_condition()
{
	if((GoblinKing == TRUE) && (MIS_GoblinTotem == LOG_Running) && (Npc_HasItems(hero,ItMi_TGoblin) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_Quest_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_Done_01_00 " );	// Isn't this your totem?
	B_GiveInvItems(other,self,ItMi_TGoblin,1);
	Npc_RemoveInvItems(self,ItMi_TGoblin,1);
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_Done_01_01 " );	// It be him! Man find the brothers' sacred totem!
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_Done_01_02 " );	// Shakzi be very happy. But he did not understand where the man could find him?
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_Done_01_03 " );	// Looks like some other goblin took a liking to your totem. Just...not quite normal.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_Done_01_04 " );	// Doesn't matter! The main thing is that Shakzi has the totem again and the brothers will be able to worship him again.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_Done_01_05 " );	// Shakzi can also see that the man didn't lie when he said he was helping the goblins.
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_Done_01_06 " );	// For this, he takes this key, which opens the chest, next to Shakzi.
	B_GiveInvItems(self,other,ItKey_GoblinChest,1);
	AI_Output(self,other, " DIA_Gobbo_Desert_Quest_Done_01_07 " );	// There he will find his reward!
	AI_Output(other,self, " DIA_Gobbo_Desert_Quest_Done_01_08 " );	// Thank you.
	MIS_GoblinTotem = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GoblinTotem,LOG_SUCCESS);
	B_LogEntry(TOPIC_GoblinTotem, " I returned Shakzi his sacred totem. Looks like all the goblins in camp are having a party today! " );
	AI_StopProcessInfos(self);
};
