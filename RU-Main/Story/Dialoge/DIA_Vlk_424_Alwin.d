

instance DIA_Alwin_EXIT(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 999;
	condition = DIA_Alwin_EXIT_Condition;
	information = DIA_Alwin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alwin_PICKPOCKET(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 900;
	condition = DIA_Alwin_PICKPOCKET_Condition;
	information = DIA_Alwin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alwin_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 10 );
};

func void DIA_Alwin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,Dialog_Back,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};


instance DIA_Alwin_Sheep(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Condition;
	information = DIA_Alwin_Sheep_Info;
	permanent = FALSE;
	description = " Are these your sheep? " ;
};


func int DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other,self, " DIA_Alwin_Sheep_15_00 " );	// Are these your sheep?
	AI_Output(self,other, " DIA_Alwin_Sheep_12_01 " );	// The only sheep that belongs to me goes by the name of Lucy. (laughs) This is my wife, Lucy.
	AI_Output(self,other, " DIA_Alwin_Sheep_12_02 " );	// These sheep belong to the militia. They take them from the farmers and bring them to me.
};

instance DIA_Alwin_Sheep_Do(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Do_Condition;
	information = DIA_Alwin_Sheep_Do_Info;
	permanent = FALSE;
	description = " What do you do with them? " ;
};

func int DIA_Alwin_Sheep_Do_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Sheep_Do_Info()
{
   	AI_Output(other,self, " DIA_Alwin_Sheep_Do_12_00 " );   // What do you do with them?
   	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_01 " );   // (surprised) Like what? I score! Militias and paladins require a regular supply of food.
   	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_02 " );   // But this has been extremely rare lately, because now every living sheep is almost worth its weight in gold.
   	AI_Output(other,self, " DIA_Alwin_Sheep_Do_12_03 " );   // You don't have a very difficult job.
   	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_04 " );   // Well, how can I tell you. Yes, the work is simple, but it still requires some experience.
   	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_05 " );   // Because you need to know how to properly skin a carcass and from where to cut the juiciest piece of meat.
   	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_06 " );   // And still don't mess it up. Well, now judge for yourself - is my job difficult or not?
   	AI_Output(other,self, " DIA_Alwin_Sheep_Do_12_07 " );   // Can you teach me this?
   	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_08 " );   // What? Split carcasses? Hmmm... Well, why not.
   	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_09 " );   // But you'll have to pay for it! I won't do it for free.
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_10");   //Сколько?
	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_11 " );   // Well, let's say... one hundred and fifty gold coins.
   	AI_Output(self,other, " DIA_Alwin_Sheep_Do_12_12 " );   // At least this will cover my expenses in case someone decides to steal one of my sheep while I teach you.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Alvin can teach me how to skin animal carcasses and cut edible pieces of meat from them. " );
};

instance DIA_Alwin_Butcher(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 5;
	condition = DIA_Alwin_Butcher_condition;
	information = DIA_Alwin_Butcher_info;
	permanent = TRUE;
	description = " Teach me how to carve animal carcasses. (Learning points: 2, Cost: 150 coins) " ;
};

func int DIA_Alwin_Butcher_condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep_Do) && (ButcherSkill == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Butcher_info()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Alwin_Butcher_01_00 " );   // Teach me how to carve animal carcasses.
	cost = 2 ;
	money = 150;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Alwin_Butcher_01_90 " );   // You don't even have gold!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
      	AI_Output(self,other, " DIA_Alwin_Butcher_01_01 " );   // It's simple. The main thing to remember: never start butchering the carcass from the head.
      	AI_Output(self,other, " DIA_Alwin_Butcher_01_02 " );   // The first incision is best made in the abdomen. The skin is soft and peels off easily.
      	AI_Output(self,other, " DIA_Alwin_Butcher_01_03 " );   // Always choose only places on the carcass where you can cut a decent piece of meat. And the more the better.
      	AI_Output(self,other, " DIA_Alwin_Butcher_01_04 " );   // Now you can practice. But just don't try to do it on my sheep, otherwise I'll skin you myself!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Studied : butchering " );
		ButcherSkill = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TalentAnimalTrophy, " Now I can butcher animal carcasses and extract meat from them. " );
	};
};

instance DIA_Alwin_Fellan(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_Fellan_Condition;
	information = DIA_Alwin_Fellan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alwin_Fellan_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self,other, " DIA_Alwin_Fellan_12_00 " );	// Oh, this lunatic's hammer will soon drive me crazy.
	AI_Output(other,self, " DIA_Alwin_Fellan_15_01 " );	// Who are you talking about?
	AI_Output(self,other, " DIA_Alwin_Fellan_12_02 " );	// Can't you hear the hammer? Who do you think is pounding all day long in the waterfront?
	AI_Output(self,other, " DIA_Alwin_Fellan_12_03 " );	// I mean that psycho Fellan. He bangs his hammer on his hut every day.
};


instance DIA_Alwin_FellanRunning(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_FellanRunning_Condition;
	information = DIA_Alwin_FellanRunning_Info;
	permanent = FALSE;
	description = " I can talk to Phellan. " ;
};


func int DIA_Alwin_FellanRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other,self, " DIA_Alwin_FellanRunning_15_00 " );	// I can talk to Phellan.
	AI_Output(self,other, " DIA_Alwin_FellanRunning_12_01 " );	// Do you want to help me? Why do you want it?
	AI_Output(other,self, " DIA_Alwin_FellanRunning_15_02 " );	// You tell me.
	AI_Output(self,other, " DIA_Alwin_FellanRunning_12_03 " );	// Oh, there you are! Good - if you make him stop thrashing, I'll pay you 25 gold coins.
	AI_Output(self,other, " DIA_Alwin_FellanRunning_12_04 " );	// But I'll tell you right away - you can't talk this guy into it. He went crazy. The only thing that can help is a few good punches!
	MIS_AttackFellan = LOG_Running;
	Log_CreateTopic(TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin,LOG_Running);
	B_LogEntry(TOPIC_Alwin, " Alwin wants me to make Fellan stop hammering. Don't kill him for that though. " );
	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning, " I'll see what I can do. " ,DIA_Alwin_FellanRunning_Ok);
	if ((hero.guild !=  GIL_MIL ) && (hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW ))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning, " If I start hitting him, I'll have trouble with the militia. " ,DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other,self, " DIA_Alwin_FellanRunning_Ok_15_00 " );	// I'll see what I can do.
	AI_Output(self,other, " DIA_Alwin_FellanRunning_Ok_12_01 " );	// Think about it. And remember, I will pay you 25 gold.
	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other,self, " DIA_Alwin_FellanRunning_Problems_15_00 " );	// If I start hitting him, I'll be in trouble with the militia.
	AI_Output(self,other, " DIA_Alwin_Add_12_00 " );	// Here at the port, no one pays attention to fights.
	AI_Output(self,other, " DIA_Alwin_Add_12_01 " );	// But if you steal something, or kill a sheep, you'll be in big trouble.
};


instance DIA_Alwin_FellanSuccess(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = DIA_Alwin_FellanSuccess_Condition;
	information = DIA_Alwin_FellanSuccess_Info;
	permanent = FALSE;
	description = " Fellan will no longer knock. " ;
};


func int DIA_Alwin_FellanSuccess_Condition()
{
	if((MIS_AttackFellan == LOG_Running) && ((FellanGeschlagen == TRUE) || Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other,self, " DIA_Alwin_FellanSuccess_15_00 " );	// Fallan will no longer knock.
	AI_Output(self,other, " DIA_Alwin_FellanSuccess_12_01 " );	// Wow! No more that knock. Finally. I thought he would never stop.
	if (Npc_IsDead(Dead) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Alwin_FellanSuccess_12_02 " );	// You did me a great favor. You know what, I'll give you thirty gold coins.
		B_GiveInvItems(self,other,ItMi_Gold,30);
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};


instance DIA_Alwin_Endlos (C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 8;
	condition = DIA_Alwin_Endlos_Condition;
	information = DIA_Alwin_Endlos_Info;
	permanent = TRUE;
	description = " How are your sheep? " ;
};


func int DIA_Alwin_Endlos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other,self, " DIA_Alwin_Endlos_15_00 " );	// How are your sheep?
	if ((MY_AttackFellan !=  LOG_SUCCESS ) && (Npc_IsDead(Fellan) ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Alwin_Endlos_12_01 " );	// That Fellan's knock will drive them crazy. One day they will all run away.
	}
	else  if (chapter <=  2 )
	{
		AI_Output(self,other, " DIA_Alwin_Endlos_12_02 " );	// Sheep eat and get fatter and fatter. Just like my wife. HAHAHA (laughs out loud)
	}
	else  if (chapter ==  3 )
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Alwin_Endlos_12_03 " );	// I'll probably kill one of them. Meat for the last meal!
			AI_Output(other,self, " DIA_Alwin_Endlos_15_04 " );	// For whom?
			AI_Output(self,other, " DIA_Alwin_Endlos_12_05 " );	// For the mercenary that killed the paladin. Of course, he is executed.
			AI_Output(self,other, " DIA_Alwin_Endlos_12_06 " );	// I just need to decide which one to send to the slaughter.
		}
		else
		{
			AI_Output(self,other, " DIA_Alwin_Endlos_12_07 " );	// Lucy is very lucky to be alive.
			AI_Output(other,self, " DIA_Alwin_Endlos_15_08 " );	// I thought Lucy was your wife.
			AI_Output(self,other, " DIA_Alwin_Endlos_12_09 " );	// Correct, but I also named this sheep Lucy. I mean the sheep that was intended for Bennett's last meal.
			AI_Output(self,other, " DIA_Alwin_Endlos_12_10 " );	// But everything ended well. Lucy should be happy.
		};
	}
	else  if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_Alwin_Endlos_12_11 " );	// Frankly, watching sheep eat is so boring!
	}
	else
	{
		AI_Output(self,other, " DIA_Alwin_Endlos_12_12 " );	// I tell them goodbye. Lord Hagen ordered that all the sheep go to provide for his army.
		AI_Output(self,other, " DIA_Alwin_Endlos_12_13 " );	// Well, at least now I'll spend more time with my wife.
	};
};

instance DIA_Alwin_GiveAmulet(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_GiveAmulet_condition;
	information = DIA_Alwin_GiveAmulet_info;
	permanent = FALSE;
	description = " Holger sent me to you. " ;
};

func int DIA_Alwin_GiveAmulet_condition()
{
	if(MIS_HOLGER_QUEST == 1)
	{
		return TRUE;
	};
};

func void DIA_Alwin_GiveAmulet_info()
{
	AI_Output(other,self, " DIA_Alwin_GiveAmulet_01_01 " );	// Holger sent me to you.
	AI_Output(self,other, " DIA_Alwin_GiveAmulet_01_02 " );	// (surprised) My son? Lucy! Did you hear? Finally, word came from Holger.
	AI_Output(self,other, " DIA_Alwin_GiveAmulet_01_03 " );	// Well, how is he doing there? Doesn't need anything?
	AI_Output(other,self, " DIA_Alwin_GiveAmulet_01_04 " );	// Nothing, as it seemed to me.
	AI_Output(other,self, " DIA_Alwin_GiveAmulet_01_05 " );	// The only thing he doesn't like there is the excessive discipline.
	AI_Output(self,other, " DIA_Alwin_GiveAmulet_01_06 " );	// I recognize my son! I have never been an obedient child.
	AI_Output(other,self, " DIA_Alwin_GiveAmulet_01_07 " );	// He asked me to pick up some amulet and said that you should understand what he is talking about.
	AI_Output(self,other, " DIA_Alwin_GiveAmulet_01_08 " );	// This one, probably. We gave this little thing to Holger when he was eight years old.
	AI_Output(self,other, " DIA_Alwin_GiveAmulet_01_09 " );	// She was supposed to bring happiness, but on that ill-fated day he forgot to put on this amulet...
	AI_Output(self,other, " DIA_Alwin_GiveAmulet_01_10 " );	// Here, give it to him and tell him we miss him so much!
	B_GiveInvItems(self,other,itam_holger_amulet,1);
	AI_Output(other,self, " DIA_Alwin_GiveAmulet_01_11 " );	// Okay, I'll pass it on.
	MIS_HOLGER_QUEST = 2;
	B_LogEntry( TOPIC_BADSON , " Something cleared up. It turns out that Holger is Alvin's son. Who would have thought. Just what did Alvin mean when he said about 'that ill-fated day'? Holger will have to tell me everything! " );

	if(Npc_HasItems(other,itwr_holger_letter) >= 1)
	{
		B_GivePlayerXP(50);
		AI_Output(other,self, " DIA_Alwin_GiveAmulet_01_12 " );	// And one more thing, I almost forgot...
		AI_Output(other,self, " DIA_Alwin_GiveAmulet_01_13 " );	// He also asked me to give you this letter.
		B_GiveInvItems(other,self,itwr_holger_letter,1);
		B_UseFakeScroll();

		if((hero.guild != GIL_NDM) && (hero.guild != GIL_KDM))
		{
			AI_Output(self,other, " DIA_Alwin_GiveAmulet_01_14 " );	// Thank you very much! Let Innos help you in your affairs.
		}
		else
		{
			AI_Output(self,other, " DIA_Alwin_GiveAmulet_01_15 " );	// (to himself) The Necromancer does good to people... Looks like I don't understand anything in this life! I'm probably getting old...
		};
	};
};
