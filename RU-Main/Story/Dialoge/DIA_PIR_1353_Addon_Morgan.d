

var int Morgan_Perm_Counter;

instance DIA_Addon_Morgan_EXIT(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 999;
	condition = DIA_Addon_Morgan_EXIT_Condition;
	information = DIA_Addon_Morgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};

func int DIA_Addon_Morgan_EXIT_Info()
{
	if(GregIsBack == FALSE)
	{
		AI_Output(other,self, " DIA_Addon_Morgan_Perm_15_00 " );	// You can go back to sleep.
		if(Morgan_Perm_Counter == 0)
		{
			AI_Output(self,other, " DIA_Addon_Morgan_Perm_07_01 " );	// (yawns) Great idea.
			Morgan_Perm_Counter = 1;
		}
		else if(Morgan_Perm_Counter == 1)
		{
			AI_Output(self,other, " DIA_Addon_Morgan_Perm_07_02 " );	// (drowsily) Well, good night.
			Morgan_Perm_Counter = 2;
		}
		else if(Morgan_Perm_Counter == 2)
		{
			AI_Output(self,other, " DIA_Addon_Morgan_Perm_07_03 " );	// (wearily) With great pleasure.
			Morgan_Perm_Counter = 3;
		}
		else if(Morgan_Perm_Counter == 3)
		{
			AI_Output(self,other, " DIA_Addon_Morgan_Perm_07_04 " );	// Wake me up if something happens.
			Morgan_Perm_Counter = 0;
		};
	};
	AI_StopProcessInfos(self);
	return TRUE;
};


instance DIA_Addon_Morgan_PICKPOCKET(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 900;
	condition = DIA_Addon_Morgan_PICKPOCKET_Condition;
	information = DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 43 );
};

func void DIA_Addon_Morgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,Dialog_Back,DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};

func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};


instance DIA_Addon_Morgan_Hire (C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Hire_Condition;
	information = DIA_Addon_Morgan_Hire_Info;
	important = TRUE;
};


func int DIA_Addon_Morgan_Hire_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GregIsBack == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func int DIA_Addon_Morgan_Hire_Info()
{
	AI_Output(self,other, " DIA_Addon_Morgan_Anheuern_07_00 " );	// Great! Now Greg will make me saw the boards!
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		AI_Output(self,other, " DIA_Addon_Morgan_Anheuern_07_01 " );	// (sarcastically) Good luck eviscerating the monsters!
	};
	return TRUE;
};


instance DIA_Addon_Morgan_Hello(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Hello_Condition;
	information = DIA_Addon_Morgan_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Morgan_Hello_Condition()
{
	if((MIS_AlligatorJack_BringMeat == FALSE) && Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(AlligatorJack) == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//Эй, ты!
	AI_Output(self,other, " DIA_Addon_Morgan_Hello_07_01 " );	// (drowsily) Huh? What do you need?
	AI_Output(self,other, " DIA_Addon_Morgan_Hello_07_02 " );	// (sleepy) Gator Jack is back yet?
	AI_Output(self,other, " DIA_Addon_Morgan_Hello_07_03 " );	// (sleepy) No? Well, that means he'll be back soon. Pleasant dreams.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_Meat(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 2;
	condition = DIA_Addon_Morgan_Meat_Condition;
	information = DIA_Addon_Morgan_Meat_Info;
	description = " I brought meat. " ;
};


func int DIA_Addon_Morgan_Meat_Condition()
{
	if((MIS_AlligatorJack_BringMeat == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_Meat_Info()
{
	var int GivenMeat;
	AI_Output(other,self, " DIA_Addon_Morgan_Meat_15_00 " );	// I brought the meat.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Morgan_Meat_07_01 " );	// (wakes up) Ahhh. I need to take a sip of rum to wake up.
		CreateInvItems(self,ItFo_Booze,3);
		B_UseItem(self,ItFo_Booze);
		AI_Output(self,other, " DIA_Addon_Morgan_Meat_07_02 " );	// That's better. Once again, what do you want?
		AI_Output(other,self, " DIA_Addon_Morgan_Meat_15_03 " );	// I brought the meat. From Alligator Jack.
	};
	AI_Output(self,other, " DIA_Addon_Morgan_Meat_07_04 " );	// Exactly! I remembered! Meat! Give it here.
	GivenMeat = Npc_HasItems(other,ItFoMuttonRaw);
	if(GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	B_GiveInvItems(other,self,ItFoMuttonRaw,GivenMeat);
	if(GivenMeat < 10)
	{
		AI_Output(self,other, " DIA_Addon_Morgan_Meat_07_05 " );	// Is that all? Did you eat the rest yourself? OK...
	};
	B_LogEntry(TOPIC_Addon_BringMeat, " I brought meat to Morgan. " );
	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_AlligatorJAck_BringMeat);
};


instance DIA_Addon_Morgan_Job(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 3;
	condition = DIA_Addon_Morgan_Job_Condition;
	information = DIA_Addon_Morgan_Job_Info;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Morgan_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Meat))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_Job_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_Job_15_01 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Morgan_Job_07_01 " );	// Greg put me in charge of one of the combat squads.
	AI_Output(self,other, " DIA_Addon_Morgan_Job_07_02 " );	// I'm in charge of supplying the camp. Alligator Jack supplies me with meat.
	AI_Output(self,other, " DIA_Addon_Morgan_Job_07_03 " );	// I also make sure that wild animals do not approach the camp, of which there are a lot.
	AI_Output(self,other, " DIA_Addon_Morgan_Job_07_04 " );	// My guys are watching this.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Morgan_Job_07_05 " );	// I told them there shouldn't be (yawns) any animals here by Greg's return.
	};
};


instance DIA_Addon_Morgan_Sleep(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 4;
	condition = DIA_Addon_Morgan_Sleep_Condition;
	information = DIA_Addon_Morgan_Sleep_Info;
	description = " Do you do anything yourself? " ;
};


func int DIA_Addon_Morgan_Sleep_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_Sleep_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_Sleep_15_00 " );	// Do you do anything yourself?
	AI_Output(self,other, " DIA_Addon_Morgan_Sleep_07_01 " );	// What are you hinting at?!
	AI_Output(self,other, " DIA_Addon_Morgan_Sleep_07_02 " );	// Yes, my work here is the most important.
	AI_Output(self,other, " DIA_Addon_Morgan_Sleep_07_03 " );	// I train my people.
	AI_Output(self,other, " DIA_Addon_Morgan_Sleep_07_04 " );	// I make them the best and bravest fighters these waters have ever seen.
	AI_Output(self,other, " DIA_Addon_Morgan_Sleep_07_05 " );	// But they're not the type to sell themselves cheaply.
	AI_Output(self,other, " DIA_Addon_Morgan_Sleep_07_06 " );	// For their work, they receive a decent sum of gold.
};


instance DIA_Addon_Morgan_JoinMorgan(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_JoinMorgan_Condition;
	information = DIA_Addon_Morgan_JoinMorgan_Info;
	description = " I want to join your squad. " ;
};


func int DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Morgan_Sleep ) && ( GregIsBack ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_JoinMorgan_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_JoinMorgan_15_00 " );	// I want to join your squad.
	AI_Output(self,other, " DIA_Addon_Morgan_JoinMorgan_07_01 " );	// (laughs) My squad? My squad is now lying on the beach.
	AI_Output(self,other, " DIA_Addon_Morgan_JoinMorgan_07_03 " );	// They won't lift a finger until the captain returns. This is exactly what I'm telling you.
	AI_Output(self,other, " DIA_Addon_Morgan_JoinMorgan_07_04 " );	// But if you want to show everyone else what you're made of, then go to the northern beach.
	AI_Output(self,other, " DIA_Addon_Morgan_JoinMorgan_07_05 " );	// It's full of snitches... and God knows what else.
	AI_Output(self,other, " DIA_Addon_Morgan_JoinMorgan_07_06 " );	// Deal with them and you'll earn the respect of (yawns) people...
	AI_Output(self,other, " DIA_Addon_Morgan_JoinMorgan_07_07 " );	// Welcome to my squad. Hehe. And I'll still sleep...
	Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
	B_LogEntry(TOPIC_Addon_MorganBeach, " I've joined Morgan's fireteam. He wants me to clear the northern beach of monsters. " );
	MIS_Addon_MorganLurker = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_LurkerPlatt(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 6;
	condition = DIA_Addon_Morgan_LurkerPlatt_Condition;
	information = DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent = TRUE;
	description = " Northern beach is now safe. " ;
};


func int DIA_Addon_Morgan_LurkerPlatt_Condition()
{
	if (Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && (MIS_Addon_MorganLurker == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_LurkerPlatt_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_LurkerPlatt_15_00 " );	// The northern beach is now safe.
	AI_Output(self,other, " DIA_Addon_Morgan_LurkerPlatt_07_01 " );	// And the cave? Have you been there too?
	if(Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Конечно.
		AI_Output(self,other, " DIA_Addon_Morgan_LurkerPlatt_07_03 " );	// Great. You are a good person.
		AI_Output(self,other, " DIA_Addon_Morgan_LurkerPlatt_07_04 " );	// Here's your reward.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
		B_LogEntry(TOPIC_Addon_MorganBeach, " All monsters on the beach have been killed. " );
		MIS_Addon_MorganLurker = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Э-э-э...
		AI_Output(self,other, " DIA_Addon_Morgan_LurkerPlatt_07_06 " );	// This is also part of your task. Come back when you're done.
		B_LogEntry(TOPIC_Addon_MorganBeach, " Morgan asked me to take care of the cave. " );
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Morgan_Auftrag2 (C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Auftrag2_Condition;
	information = DIA_Addon_Morgan_Auftrag2_Info;
	permanent = TRUE;
	description = " Is there any other work for me? " ;
};


func int DIA_Addon_Morgan_Auftrag2_Condition()
{
	if(MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_Auftrag2_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_Auftrag2_15_00 " );	// Is there any other work for me?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Morgan_Auftrag2_07_01 " );	// Not yet.
		AI_Output(self,other, " DIA_Addon_Morgan_Auftrag2_07_02 " );	// Relax, lie down, drink some rum!
		CreateInvItems(self,ItFo_Booze,3);
		B_UseItem(self,ItFo_Booze);
		AI_Output(self,other, " DIA_Addon_Morgan_Auftrag2_07_03 " );	// Fucking awesome stuff!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Morgan_Auftrag2_07_04 " );	// You'd better ask the captain.
	};
	AI_StopProcessInfos(self);
};


var int Morgan_AngusStory;

instance DIA_Addon_Morgan_FOUNDTHEM(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 7;
	condition = DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information = DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent = TRUE;
	description = " About Hank and Angus.... " ;
};


func int DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if((MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_FOUNDTHEM_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_FOUNDTHEM_15_00 " );	// About Hank and Angus...
	if(Morgan_AngusStory == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_07_01 " );	// Don't remind me of them.
		AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_07_02 " );	// They must have fallen into the hands of bandits.
		AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_07_03 " );	// And Angus had my ring.
		AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_07_04 " );	// No, of course, it was already HIS ring. He won it against me at the dice.
		AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_07_05 " );	// But I would definitely win back. And now it's gone forever!
		Morgan_AngusStory = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	if(Npc_HasItems(other,ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Я нашел их.",DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_07_06 " );	// If you find my ring, bring it to me. I will pay you well!
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//Я нашел их.
	AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_07_07 " );	// Well, talk. What's up with them?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//Они мертвы.
	AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_07_08 " );	// And the ring? What's with the ring?!
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Вот оно.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM, " No Ring. " ,DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};

func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output(other,self, " DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00 " );	// They didn't have it.
	AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01 " );	// (horrified) What? Come back and look better. Angus should have had it.
	AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02 " );	// This is a small ring decorated with intricate designs.
	AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03 " );	// You must find him! Must!
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
};

func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Вот оно.
	B_GiveInvItems(other,self,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01 " );	// (joyfully) Yes, that's it! Thank you!
	AI_Output(self,other, " DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02 " );	// Here, take this stone tablet. It may seem useless at first glance, but Garett will pay you well for it.
	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_MorgansRing);
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,1);
};


instance DIA_Addon_Morgan_Francis(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_Francis_Condition;
	information = DIA_Addon_Morgan_Francis_Info;
	description = " What do you think of Francis? " ;
};


func int DIA_Addon_Morgan_Francis_Condition()
{
	if (Francis_shit out ==  FALSE )
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_Francis_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_Francis_15_00 " );	// What do you think of Francis?
	AI_Output(self,other, " DIA_Addon_Morgan_Francis_07_01 " );	// I have nothing against him, (threateningly) as long as he doesn't get on me!
	AI_Output(other,self, " DIA_Addon_Morgan_Francis_15_02 " );	// Is he the boss here?
	AI_Output(self,other, " DIA_Addon_Morgan_Francis_07_03 " );	// (laughs) He THINKS he's in charge.
	AI_Output(self,other, " DIA_Addon_Morgan_Francis_07_04 " );	// But when Greg returns, Francis will go back to his usual job of sawing boards.
};


instance DIA_Addon_Morgan_TRAIN(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_TRAIN_Condition;
	information = DIA_Addon_Morgan_TRAIN_Info;
	description = " Can you teach me something? " ;
};


func int DIA_Addon_Morgan_TRAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_TRAIN_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_TRAIN_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_Morgan_TRAIN_07_01 " );	// Of course! I can improve your skill with one-handed weapons.
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	Morgan_Addon_TeachPlayer = TRUE;
};


var int Morgan_brand1h;
var int Morgan_Labercount;

instance DIA_Addon_Morgan_Teach(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Teach_Condition;
	information = DIA_Addon_Morgan_Teach_Info;
	permanent = TRUE;
	description = " I'm ready to learn! " ;
};


func int DIA_Addon_Morgan_Teach_Condition()
{
	if(Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Morgan_Teach_Info()
{
	AI_Output(other,self, " DIA_Addon_Morgan_Teach_15_00 " );	// I'm ready to learn!
	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_1H] > Morgan_merke1h)
	{
		if(Morgan_Labercount == 0)
		{
			AI_Output(self,other, " DIA_Addon_Morgan_CommentFightSkill_07_00 " );	// So, forget all this nonsense about honor and everything else. Either you kill the enemy or he kills you.
			Morgan_Labercount = 1;
		}
		else if(Morgan_Labercount == 1)
		{
			AI_Output(self,other, " DIA_Addon_Morgan_CommentFightSkill_07_01 " );	// You will learn to put more power into your punches.
			Morgan_Labercount = 2;
		}
		else if(Morgan_Labercount == 2)
		{
			AI_Output(self,other, " DIA_Addon_Morgan_CommentFightSkill_07_02 " );	// Haha. Well, at least now you know which side to take on the sword.
			Morgan_Labercount = 0;
		};
	}
	else if(other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other, " DIA_Addon_Morgan_Teach_Back_07_00 " );	// If you want to become even better, you must find a more experienced teacher.
	};
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
};

func void DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

