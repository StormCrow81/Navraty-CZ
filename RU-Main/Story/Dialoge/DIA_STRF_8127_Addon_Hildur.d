

instance DIA_STRF_8127_Addon_Hildur_EXIT(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 999;
	condition = DIA_STRF_8127_Addon_Hildur_EXIT_Condition;
	information = DIA_STRF_8127_Addon_Hildur_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8127_Addon_Hildur_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8127_Addon_Hildur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
	
	
instance DIA_STRF_8127_Addon_Hildur_HowYou(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_HowYou_Condition;
	information = DIA_STRF_8127_Addon_Hildur_HowYou_Info;
	permanent = FALSE;
	description = " Are you a blacksmith? " ;
};

func int DIA_STRF_8127_Addon_Hildur_HowYou_Condition()
{
	return TRUE;
};

func void DIA_STRF_8127_Addon_Hildur_HowYou_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowYou_01_00");	//Ты кузнец?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowYou_01_01 " );	// No, I'm a simple ore smelter.
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_HowYou_01_02 " );	// So you don't have to work all day with a pick in your hands?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowYou_01_03 " );	// As you can see. However, do not think that I have an easy job!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowYou_01_04");	//Правда?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowYou_01_05 " );	// If you stand here with mine, you'll understand.
};	
	
instance DIA_STRF_8127_Addon_Hildur_HowLong(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_HowLong_Condition;
	information = DIA_STRF_8127_Addon_Hildur_HowLong_Info;
	permanent = FALSE;
	description = " Have you been here for a long time? " ;
};

func int DIA_STRF_8127_Addon_Hildur_HowLong_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_STRF_8127_Addon_Hildur_HowYou ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_HowLong_Info()
{
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_HowLong_01_00 " );	// How long have you been here?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_01 " );	// More than you can imagine.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_02 " );	// I've been here since the days when the ore barons ruled the valley.
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_HowLong_01_03 " );	// How did you please the orcs?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_04 " );	// It's a long story...(thoughtfully) Once I was escorting a load of ore from an old mine.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_05 " );	// When we were almost approaching the castle, we were suddenly suddenly attacked by orcs.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_06 " );	// They killed most of the convoy then, but they dragged me and a few other guys here.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_07 " );	// When the orcs found out that I was good at handling ore, they put me here by the furnace, pouring steel ingots.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_08 " );	// This is how I'm still stuck here.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_09 " );	// Of course, it's easier for me than for other guys. I even have my own bed.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_HowLong_01_10 " );	// But basically I'm just as much a slave as they are.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowLong_01_11");	//Понятно.
};	

instance DIA_STRF_8127_Addon_Hildur_NeedRest(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_NeedRest_Condition;
	information = DIA_STRF_8127_Addon_Hildur_NeedRest_Info;
	permanent = FALSE;
	description = " Can you teach me how to smelt ore? " ;
};

func int DIA_STRF_8127_Addon_Hildur_NeedRest_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_STRF_8127_Addon_Hildur_HowYou ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_NeedRest_Info()
{
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_NeedRest_01_00 " );	// Can you teach me how to smelt ore?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_NeedRest_01_01 " );	// Sorry, but I don't have time for this right now.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_NeedRest_01_02 " );	// Orcs keep a close eye on how I work. And just a little, they immediately begin to customize with their axes.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_NeedRest_01_03 " );	// Especially that Orc named Dabar Shak! This one never takes my eyes off me.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_NeedRest_01_04 " );	// Now, if you somehow distracted him for a while, then I could well show you how to smelt the ore.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_NeedRest_01_05 " );	// With the condition, of course, that you have enough experience for this.
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_NeedRest_01_06 " );	// Okay! I'll try to come up with something.
	MIS_NeedRest = LOG_Running;
	Log_CreateTopic(TOPIC_NeedRest,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NeedRest,LOG_Running);
	B_LogEntry(TOPIC_NeedRest, " Hildur can teach me how to smelt ore if I can somehow distract the orc Dabar Shak, who is constantly watching him. " );
};	


instance DIA_STRF_8127_Addon_Hildur_NeedRest_Done(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Condition;
	information = DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Info;
	permanent = FALSE;
	description = " Your guard has fallen asleep. " ;
};

func int DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Condition()
{
	if (( MIS_NeedRest == LOG_Running ) && ( PastShakeIsSleeping ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_00 " );	// Your guard fell asleep.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_01 " );	// Well, finally. Now you can relax a bit!
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_02 " );	// So will you teach me how to smelt ore?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_03 " );	// Why not? But only if you have enough experience.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_04");	//Само собой.
	RT_Respect = RT_Respect + 1;
	MIS_NeedRest = LOG_Success;
	Log_SetTopicStatus(TOPIC_NeedRest,LOG_Success);
	B_LogEntry(TOPIC_NeedRest, " I told Hildur about the sleeping Dabar Shaq. Now he can teach me how to smelt ore. " );
};	

instance DIA_STRF_8127_Addon_Hildur_Plavka(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 5;
	condition = DIA_STRF_8127_Addon_Hildur_Plavka_condition;
	information = DIA_STRF_8127_Addon_Hildur_Plavka_info;
	permanent = TRUE;
	description = " Teach me how to smelt iron ore. (Learning points: 3) " ;
};

func int DIA_STRF_8127_Addon_Hildur_Plavka_condition()
{
	if((MIS_NeedRest == LOG_Success) && (KNOWHOWTOOREFUS == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Plavka_info()
{
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_Plavka_01_00 " );	// Teach me how to smelt iron ore.

	if(hero.lp < 3)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= 3)
	{
		AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Plavka_01_01 " );	// Things are simpler in a smelter, but a simple forge will do.
		AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Plavka_01_02 " );	// You need at least fifty pieces of ore. You heat them in the oven, and then pour them into a mold!
		AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Plavka_01_03 " );	// That's the whole secret of making a steel billet.
		hero.lp = hero.lp - 3;
		RankPoints = RankPoints + 3;
		AI_Print( " Studied : ore smelting " );
		KNOWHOWTOOREFUS = TRUE;
		DabarShakIsAwake = TRUE ;
		Snd_Play("LevelUP");
		B_LogEntry( TOPIC_STEELDRAW , " I can now smelt iron ore into steel billets. To make a steel billet, you need a forge and fifty pieces of ore. " );
	};
};

instance DIA_STRF_8127_Addon_Hildur_Work(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_Work_Condition;
	information = DIA_STRF_8127_Addon_Hildur_Work_Info;
	permanent = FALSE;
	description = " Do you have any job for me? " ;
};

func int DIA_STRF_8127_Addon_Hildur_Work_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_STRF_8127_Addon_Hildur_HowYou ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Work_Info()
{
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_Work_01_00 " );	// Do you have any job for me?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Work_01_01 " );	// Hmmm...(thoughtfully) You could help me a lot if you could get some coal somewhere.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Work_01_02 " );	// This stove is so old that I have to spend a lot of time to light it every time.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Work_01_03 " );	// And you won't find normal coal here during the day with fire!
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_Work_01_04 " );	// And how much do you need?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Work_01_05 " );	// Quite a bit. If I had at least ten pieces of coal on hand, this amount would be enough for me for a long time.
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_Work_01_06 " );	// Good. I'll try to get it for you.
	MIS_HildurCoal = LOG_Running;
	Log_CreateTopic(TOPIC_HildurCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HildurCoal,LOG_Running);
	B_LogEntry(TOPIC_HildurCoal, " Hildur needs coal to start a fire in his old smelter. At least ten pieces. " );
};	

instance DIA_STRF_8127_Addon_Hildur_WorkDone(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_WorkDone_Condition;
	information = DIA_STRF_8127_Addon_Hildur_WorkDone_Info;
	permanent = FALSE;
	description = " I brought you coal. " ;
};

func int DIA_STRF_8127_Addon_Hildur_WorkDone_Condition()
{
	if((MIS_HildurCoal == LOG_Running) && (Npc_HasItems(hero,ItMi_Coal) >= 10))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_WorkDone_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_WorkDone_01_00 " );	// I brought you coal.
	B_GiveInvItems(other,self,ItMi_Coal,10);
	Npc_RemoveInvItems(self,ItMi_Coal,10);
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_WorkDone_01_01 " );	// Great, man! Now my suffering is over!
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_WorkDone_01_02 " );	// Unfortunately, I have nothing to thank you with.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_WorkDone_01_03 " );	// If only a couple of pieces of iron ore.
	B_GiveInvItems(self,other,ItMi_SNugget,2);
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_WorkDone_01_04 " );	// You don't need more.
	RT_Respect = RT_Respect + 1;
	MIS_HildurCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_HildurCoal,LOG_Success);
	B_LogEntry(TOPIC_HildurCoal, " I brought coal to Hildur. " );
};
	
instance DIA_STRF_8127_Addon_Hildur_LowLevel(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_LowLevel_Condition;
	information = DIA_STRF_8127_Addon_Hildur_LowLevel_Info;
	permanent = FALSE;
	description = " What do you know about the lower level of the mine? " ;
};

func int DIA_STRF_8127_Addon_Hildur_LowLevel_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_STRF_8127_Hildur_HowYou) ==  TRUE ) && (MIS_LowLevel == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_LowLevel_Info()
{
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_00 " );	// What do you know about the lower level of the mine?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_01 " );	// Hmmm...(surprised) Why all of a sudden such questions?!
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_02 " );	// According to Rolland, you should know something about this.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_03 " );	// Aha! So this is what Rolland whispered to you? Here is the yap!
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_04 " );	// So he's right. Maybe then tell me what you know about the lower level?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_05 " );	// Eh! Okay... (sighing) I don't really like to talk about it though.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_06 " );	// In general, at one time, ore was also mined at the lower level.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_07 " );	// But not just iron, but magic! There was a very rich deposit of this rock.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_08 " );	// And everything was going great until the orcs apparently dug up something they shouldn't have dug up.
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_09 " );	// What exactly did they find there?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_10 " );	// I don't know, mate. At that time I was already working here, by the stove. Therefore, he could not go far.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_11 " );	// But one thing I know for sure...
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_12 " );	// ...after that incident, the orcs closed the passage leading to the lower level, and never opened it again!
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_13 " );	// So no one knows the real reason why the orcs closed that part of the mine?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_14 " );	// If anyone knows her, then only the orcs themselves.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_15 " );	// But of those who were here then, only Grock remained. An old orc guard who stands near the lift.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_16 " );	// You can try talking to him. Unless, of course, he will listen to you.
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_LowLevel_01_17 " );	// Okay, I'll do that.
	KnowGrok = TRUE;
	B_LogEntry(TOPIC_LowLevel, " I've spoken to Hildur about the lower level of the mine. It looks like the orcs have discovered something there that really frightens them. Hildir doesn't know what exactly. Old orc Grok might know something about it. " );
};	

instance DIA_STRF_8127_Addon_Hildur_Perm(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 2;
	condition = DIA_STRF_8127_Addon_Hildur_Perm_Condition;
	information = DIA_STRF_8127_Addon_Hildur_Perm_Info;
	permanent = TRUE;
	description = " How does it work? " ;
};

func int DIA_STRF_8127_Addon_Hildur_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowLong) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Perm_Info()
{
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_Perm_01_00 " );	// How does it work?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Perm_01_01 " );	// Still the same, buddy... (sighing) All day long I've been busy casting steel ingots.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_Perm_01_02 " );	// But it's better that way than with a pick at the vein.
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_Perm_01_03 " );	// That's exactly what you noticed.
};	

instance DIA_STRF_8127_Addon_Hildur_ElkKirka(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 2;
	condition = DIA_STRF_8127_Addon_Hildur_ElkKirka_Condition;
	information = DIA_STRF_8127_Addon_Hildur_ElkKirka_Info;
	permanent = FALSE;
	description = " Do you happen to know where you can get a decent pickaxe around here? " ;
};

func int DIA_STRF_8127_Addon_Hildur_ElkKirka_Condition()
{
	if (( MIS_ElkKirka == LOG_Running ) && ( ElkNeedNewKirka ==  TRUE ) && ( Npc_KnowsInfo ( hero , DIA_STRF_8127_Addon_Hildur_HowYou ) ==  TRUE )) .
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_ElkKirka_Info()
{
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_00 " );	// Do you happen to know where you can get a decent pickaxe around here?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_01 " );	// Vakur Shak is responsible for the entire tool here.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_02 " );	// But he will only sell it to you if you have the gold.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_03 " );	// This bastard is too greedy for an orc! But nonetheless...
	AI_Output(other,self, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_04 " );	// Where do slaves get their gold from?
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_05 " );	// Sometimes small gold streaks can be found among iron ore rocks.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_06 " );	// If you stumbled upon one, consider yourself very lucky.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_07 " );	// For gold here you can buy more or less normal food or new tools.
	AI_Output(self,other, " DIA_STRF_8127_Addon_Hildur_ElkKirka_01_08 " );	// This is how we survive!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_09");	//Ясно.
	ElkNeedNewKirka = 2 ;
};	
