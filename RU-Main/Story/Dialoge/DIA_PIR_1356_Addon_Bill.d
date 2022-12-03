

instance DIA_Addon_Bill_EXIT(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 999;
	condition = DIA_Addon_Bill_EXIT_Condition;
	information = DIA_Addon_Bill_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bill_PICKPOCKET(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 900;
	condition = DIA_Addon_Bill_PICKPOCKET_Condition;
	information = DIA_Addon_Bill_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Bill_PICKPOCKET_Condition()
{
	return  C_Robbery ( 80 , 205 );
};

func void DIA_Addon_Bill_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bill_PICKPOCKET,Dialog_Back,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bill_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
};

func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
};


instance DIA_Addon_Bill_Hello(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 1;
	condition = DIA_Addon_Bill_Hello_Condition;
	information = DIA_Addon_Bill_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bill_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bill_Hello_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_Hello_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_Bill_Hello_03_01 " );	// Did Henry send you here?
	AI_Output(self,other, " DIA_Addon_Bill_Hello_03_02 " );	// Tell him he'll get his tree as soon as I'm done.
	AI_Output(self,other, " DIA_Addon_Bill_Hello_03_03 " );	// And if he doesn't want to wait, he can come here and help me saw.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bill_Planks(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 2;
	condition = DIA_Addon_Bill_Planks_Condition;
	information = DIA_Addon_Bill_Planks_Info;
	description = " What is all this tree for? " ;
};


func int DIA_Addon_Bill_Planks_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bill_Planks_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_Planks_15_00 " );	// What is all this tree for?
	AI_Output(self,other, " DIA_Addon_Bill_Planks_03_01 " );	// For the stockade, fool.
	AI_Output(self,other, " DIA_Addon_Bill_Planks_03_02 " );	// Greg decided it wouldn't hurt to protect our camp with a wall.
	AI_Output(self,other, " DIA_Addon_Bill_Planks_03_03 " );	// However, I think we could not work too hard.
	AI_Output(self,other, " DIA_Addon_Bill_Planks_03_04 " );	// If the bandits are serious about attacking us, this ridiculous fence won't protect us.
	AI_Output(self,other, " DIA_Addon_Bill_Planks_03_05 " );	// They should have been driven out of here from the very beginning.
	AI_Output(self,other, " DIA_Addon_Bill_Planks_03_06 " );	// If I had known that it would come to this, I would have stayed in Khorinis.
};


var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 4;
	condition = DIA_Addon_Bill_Perm_Condition;
	information = DIA_Addon_Bill_Perm_Info;
	permanent = TRUE;
	description = " Can I help you? " ;
};


func int DIA_Addon_Bill_Perm_Condition()
{
	if((GregIsBack == FALSE) && Npc_WasInState(self,ZS_Saw))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Perm_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_Perm_15_00 " );	// Can I help you?
	AI_Output(self,other, " DIA_Addon_Bill_Perm_03_01 " );	// No thanks, I can handle it myself.
	if(Bill_Perm_Once == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Bill_Perm_03_02 " );	// I recently joined the pirates, and if I blame others for my work, then I will not achieve much here.
		Bill_Perm_Once = TRUE;
	};
};


instance DIA_Addon_Bill_Perm2(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 5;
	condition = DIA_Addon_Bill_Perm2_Condition;
	information = DIA_Addon_Bill_Perm2_Info;
	permanent = TRUE;
	description = " What are you doing now? " ;
};


func int DIA_Addon_Bill_Perm2_Condition()
{
	if(GregIsBack == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bill_Perm2_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_Perm2_15_00 " );	// What are you doing now?
	AI_Output(self,other, " DIA_Addon_Bill_Perm2_03_01 " );	// Me? I rest.
	if ( ! Npc_IsDead(Francis))
	{
		AI_Output(self,other, " DIA_Addon_Bill_Perm2_03_02 " );	// (chuckles) Francis does my job.
		AI_Output(self,other, " DIA_Addon_Bill_Perm2_03_03 " );	// And he will saw until his hands fall off.
	};
};


instance DIA_Addon_Bill_AngusnHank(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 11;
	condition = DIA_Addon_Bill_AngusnHank_Condition;
	information = DIA_Addon_Bill_AngusnHank_Info;
	permanent = FALSE;
	description = " I'm looking for Angus and Hank. " ;
};


func int DIA_Addon_Bill_AngusnHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank) && Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_AngusnHank_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_AngusnHank_15_00 " );	// I'm looking for Angus and Hank.
	AI_Output(self,other, " DIA_Addon_Bill_AngusnHank_03_01 " );	// (sighs) I don't know where they are. The bandits must have killed them.
	AI_Output(other,self, " DIA_Addon_Bill_AngusnHank_15_02 " );	// You were friends, right?
	AI_Output(self,other, " DIA_Addon_Bill_AngusnHank_03_03 " );	// All I know is that they were supposed to meet the bandits in some cave not far from here.
	AI_Output(self,other, " DIA_Addon_Bill_AngusnHank_03_04 " );	// It should be somewhere east of the camp.
	AI_Output(self,other, " DIA_Addon_Bill_AngusnHank_03_05 " );	// Don't know where exactly it is. I myself have never been there.
	AI_Output(self,other, " DIA_Addon_Bill_AngusnHank_03_06 " );	// Maybe you should talk to Alligator Jack. He likes to wander around the camp.
	B_LogEntry(TOPIC_Addon_SkipsGrog, " Angus and Hank had a cave east of the camp. Alligator Jack should know about it. " );
};


instance DIA_Addon_Bill_FoundFriends(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 12;
	condition = DIA_Addon_Bill_FoundFriends_Condition;
	information = DIA_Addon_Bill_FoundFriends_Info;
	permanent = FALSE;
	description = " I found your friends. " ;
};


func int DIA_Addon_Bill_FoundFriends_Condition()
{
	if(!Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_FoundFriends_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_FoundFriends_15_00 " );	// I found your friends.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//И? Где они?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//Они мертвы.
	AI_Output(self,other, " DIA_Addon_Bill_FoundFriends_03_03 " );	// (with hatred) Damned bandits! They killed them!
	if(SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//Возможно.
	};
	AI_Output(self,other, " DIA_Addon_Bill_FoundFriends_03_04 " );	// Damn pigs! You will burn in hell.
	AI_Output(self,other, " DIA_Addon_Bill_FoundFriends_03_05 " );	// If only I knew the name of the scum who did this...
	MIS_Addon_Bill_SearchAngusMurder = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillJuan,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan, " Bill was shocked when I told him about Angus and Hank's death. He wants to know the names of their killers. " );
};


instance DIA_Addon_Bill_JuanMurder(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 13;
	condition = DIA_Addon_Bill_JuanMurder_Condition;
	information = DIA_Addon_Bill_JuanMurder_Info;
	description = " I know who killed Hank and Angus. " ;
};


func int DIA_Addon_Bill_JuanMurder_Condition()
{
	if((MIS_Addon_Bill_SearchAngusMurder == LOG_Running) && (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_JuanMurder_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_JuanMurder_15_00 " );	// I know who killed Hank and Angus.
	AI_Output(self,other, " DIA_Addon_Bill_JuanMurder_03_01 " );	// Who? Who did it?
	AI_Output(other,self, " DIA_Addon_Bill_JuanMurder_15_02 " );	// One of the bandits. His name is Juan.
	AI_Output(self,other, " DIA_Addon_Bill_JuanMurder_03_03 " );	// You have to kill this bastard, do you hear me?
	AI_Output(self,other, " DIA_Addon_Bill_JuanMurder_03_04 " );	// He shouldn't get away with it.
	B_LogEntry(TOPIC_Addon_KillJuan, " I must avenge Angus and Hank and kill Juan. " );
};


instance DIA_Addon_Bill_KilledEsteban(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 14;
	condition = DIA_Addon_Bill_KilledEsteban_Condition;
	information = DIA_Addon_Bill_KilledEsteban_Info;
	description = " Juan killed. " ;
};


func int DIA_Addon_Bill_KilledEsteban_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Bill_JohnMurder ) && Npc_IsDead ( John ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_KilledEsteban_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_KilledEsteban_15_00 " );	// Juan is killed.
	AI_Output(self,other, " DIA_Addon_Bill_KilledEsteban_03_01 " );	// Did he suffer?
	AI_Output(other,self, " DIA_Addon_Bill_KilledEsteban_15_02 " );	// Calm down, son!
	AI_Output(self,other, " DIA_Addon_Bill_KilledEsteban_03_03 " );	// Okay...(sighs) At least that pig is dead.
	B_LogEntry(TOPIC_Addon_KillJuan, " Juan is dead! Bill was very happy. " );
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Bill_KillAngusMurder);
};


instance DIA_Addon_Bill_Khorinis(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 21;
	condition = DIA_Addon_Bill_Khorinis_Condition;
	information = DIA_Addon_Bill_Khorinis_Info;
	description = " Are you from Khorinis? " ;
};


func int DIA_Addon_Bill_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bill_Khorinis_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_Khorinis_15_00 " );	// Are you from Khorinis?
	AI_Output(self,other, " DIA_Addon_Bill_Khorinis_03_01 " );	// Yes. I made a living by pickpocketing and cheating.
	AI_Output(self,other, " DIA_Addon_Bill_Khorinis_03_02 " );	// But when the ships stopped entering the port, things started to get worse and worse.
	AI_Output(self,other, " DIA_Addon_Bill_Khorinis_03_03 " );	// In the end, I got tired of running from the militia because of a couple of crusts of bread.
	AI_Output(self,other, " DIA_Addon_Bill_Khorinis_03_04 " );	// That's why I joined Greg. And now I'm stuck here.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Bill_Khorinis_03_05 " );	// (sighs) I've been sawing all day to build a palisade no one wants.
	};
};


instance DIA_Addon_Bill_TeachPlayer(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 22;
	condition = DIA_Addon_Bill_TeachPlayer_Condition;
	information = DIA_Addon_Bill_TeachPlayer_Info;
	description = " Can you teach me something? " ;
};


func int DIA_Addon_Bill_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bill_TeachPlayer_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_TeachPlayer_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_Bill_TeachPlayer_03_01 " );	// Well, I could show you how to steal other people's wallets undetected.
	AI_Output(self,other, " DIA_Addon_Bill_TeachPlayer_03_02 " );	// But you have to be smart enough or it won't work.
	Bill_Addon_TeachPickPocket = TRUE;
};


instance DIA_Addon_Bill_LearnTalent(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 23;
	condition = DIA_Addon_Bill_LearnTalent_Condition;
	information = DIA_Addon_Bill_LearnTalent_Info;
	permanent = TRUE;
	description = " Teach me how to pickpocket. (Training Points: 10) " ;
};


func int DIA_Addon_Bill_LearnTalent_Condition()
{
	if((Bill_Addon_TeachPickPocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bill_LearnTalent_Info()
{
	AI_Output(other,self, " DIA_Addon_Bill_LearnTalent_15_00 " );	// Teach me how to pickpocket.

	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other, " DIA_Addon_Bill_LearnTalent_03_01 " );	// First of all, you have to make the victim feel safe.
			AI_Output(self,other, " DIA_Addon_Bill_LearnTalent_03_02 " );	// I, for example, approached a person and started a conversation. It worked flawlessly.
			AI_Output(self,other, " DIA_Addon_Bill_LearnTalent_03_03 " );	// When the person is distracted, pull out the prey, but make sure the victim doesn't notice anything.
			AI_Output(other,self, " DIA_Addon_Bill_LearnTalent_15_05 " );	// Anything else?
			AI_Output(self,other, " DIA_Addon_Bill_LearnTalent_03_06 " );	// Keep training your agility. The more dexterous you are, the more you will notice.
			AI_Output(self,other, " DIA_Addon_Bill_LearnTalent_03_07 " );	// And the more often you will be able to discreetly take things from people!
			AI_Output(self,other, " DIA_Addon_Bill_LearnTalent_03_08 " );	// That's all. At least in terms of theory.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Bill_LearnTalent_03_09 " );	// Forget it! You're not smart enough!
		AI_Output(self,other, " DIA_Addon_Bill_LearnTalent_03_10 " );	// You must either become more dexterous or find a better teacher.
	};
};

