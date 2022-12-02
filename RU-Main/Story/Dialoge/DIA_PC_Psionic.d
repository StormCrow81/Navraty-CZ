

instance DIA_Lester_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_EXIT_Condition;
	information = DIA_Lester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if(self.flags == NPC_FLAG_IMMORTAL)
	{
		self.flags = 0;
	};
};

instance DIA_Lester_PREZHello(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_PREZHello_Condition;
	information = DIA_Lester_PREZHello_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Lester_PREZHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void DIA_Lester_PREZHello_Info()
{
	B_Say_Overlay(self,other,"$SEKGREETINGS");
	AI_PlayAni(self,"T_GREETNOV");
};

instance DIA_Lester_Hello(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_Hello_Condition;
	information = DIA_Lester_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lester_Hello_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Lester_Hello_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	self.aivar[AIV_EnemyOverride] = FALSE ;
	AI_Output(self,other, " DIA_Lester_Hello_13_00 " );	// Is that YOU? - Exactly! Oh, how glad I am to see you!
	Info_ClearChoices(DIA_Lester_Hello);
	Info_AddChoice(DIA_Lester_Hello, " Do I know you? " ,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice(DIA_Lester_Hello, " Lester! How did you get here? " ,DIA_Lester_Hello_Lester);
};

func void DIA_Lester_Hello_Lester()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Lester_Hello_Lester_15_00 " );	// Lester! How did you get here?
	AI_Output(self,other, " DIA_Lester_Hello_Lester_13_01 " );	// It was a crazy escape! After the barrier collapsed, I wandered around there for a while in complete disarray.
	AI_Output(self,other, " DIA_Lester_Hello_Lester_13_02 " );	// Then I spent several days making my way through all these forests, until finally I ended up in this valley.
	AI_Output(self,other, " DIA_Lester_Hello_Lester_13_03 " );	// Diego, Milten and Gorn are still in the Mine Valley. At least I think so.
	Info_ClearChoices(DIA_Lester_Hello);
};

func void DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self, " DIA_Lester_Hello_YouKnowMe_15_00 " );	// Do I know you?
	AI_Output(self,other, " DIA_Lester_Hello_YouKnowMe_13_01 " );	// Hey? Are you all at home? I risked my neck so you could have that damn stone.
	AI_Output(self,other, " DIA_Lester_Hello_YouKnowMe_13_02 " );	// You're indebted... Well, that's something you should remember.
	AI_Output(self,other, " DIA_Lester_Hello_YouKnowMe_13_03 " );	// Do you remember Diego, Milten and Gorn?
	Info_AddChoice(DIA_Lester_Hello, " Diego, Milten and WHO? " ,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice(DIA_Lester_Hello, " Of course. How are they? " ,DIA_Lester_Hello_KnowFourFriends);
};

func void DIA_Lester_Hello_KnowFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self, " DIA_Lester_Hello_KnowFourFriends_15_00 " );	// Of course. How are they?
	AI_Output(self,other, " DIA_Lester_Hello_KnowFourFriends_13_01 " );	// As far as I know, they survived the barrier's destruction.
	AI_Output(self,other, " DIA_Lester_Hello_KnowFourFriends_13_02 " );	// But I have no idea where they are now - the trio are probably still hanging out in the Valley of Mines.
	AI_Output(self,other, " DIA_Lester_Hello_KnowFourFriends_13_03 " );	// If you run into them, let me know.
};

func void DIA_Lester_Hello_WhoFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self, " DIA_Lester_Hello_WhoFourFriends_15_00 " );	// Diego, Milten and WHO?
	AI_Output(self,other, " DIA_Lester_Hello_WhoFourFriends_13_01 " );	// Don't tell me you don't remember any of this. Focus stones - troll - a huge pile of ore that belongs to waterbenders?
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Я не знаю...
	AI_Output(self,other, " DIA_Lester_Hello_WhoFourFriends_13_03 " );	// Your memory will come back. It also took me a while to get my head in order.
};


instance DIA_Lester_WhatHappened(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_WhatHappened_Condition;
	information = DIA_Lester_WhatHappened_Info;
	permanent = FALSE;
	description = " What happened? " ;
};


func int DIA_Lester_WhatHappened_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lester_Hello ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Lester_WhatHappened_Info()
{
	AI_Output(other,self, " DIA_Lester_WhatHappened_15_00 " );	// What happened?
	AI_Output(self,other, " DIA_Lester_WhatHappened_13_01 " );	// After the Sleeper was defeated, the entire Brotherhood seemed to go crazy.
	AI_Output(self,other, " DIA_Lester_WhatHappened_13_02 " );	// Without their owner, they began to resemble empty shells.
	AI_Output(other,self, " DIA_Lester_WhatHappened_15_03 " );	// And you? What about you?
	AI_Output(self,other, " DIA_Lester_WhatHappened_13_04 " );	// Not everything was fine with me either. I had nightmares and even hallucinations. But when my head more or less cleared up, I ran from there.
	AI_Output(self,other, " DIA_Lester_WhatHappened_13_05 " );	// Somehow I thought I saw a huge black shadow swoop down on a group of fugitives and burn them to ash in a giant cloud of fire.
	AI_Output(self,other, " DIA_Lester_WhatHappened_13_06 " );	// Then I even thought that a dragon flew in to kill me.
	AI_Output(other,self, " DIA_Lester_WhatHappened_15_07 " );	// Did you see anything else?
	AI_Output(self,other, " DIA_Lester_WhatHappened_13_08 " );	// No - I jumped up and ran!
};


instance DIA_Lester_MineColony(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_MineColony_Condition;
	information = DIA_Lester_MineColony_Info;
	permanent = FALSE;
	description = " How long have you been hiding in this valley? " ;
};


func int DIA_Lester_MineColony_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lester_Hello ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Lester_MineColony_Info()
{
	AI_Output(other,self, " DIA_Lester_ReturnToColony_15_00 " );	// How long have you been hiding in this valley?
	AI_Output(self,other, " DIA_Lester_ReturnToColony_13_01 " );	// I don't know exactly. Maybe a week. But there is more:
	AI_Output(self,other, " DIA_Lester_ReturnToColony_13_02 " );	// When I came here in the evening, I looked at this mountain - there were only a few trees.
	AI_Output(self,other, " DIA_Lester_ReturnToColony_13_03 " );	// And when I looked there the next morning, this tower was already there. I'm willing to swear it wasn't there before. And since then I have not left this valley.
	AI_Output(other,self, " DIA_Lester_ReturnToColony_15_04 " );	// Do you mean the tower of Xardas? I knew that he was capable of many things, but creating a tower like that is so easy...
	AI_Output(self,other, " DIA_Lester_ReturnToColony_13_05 " );	// Xardas, the necromancer? Does he live in this tower? I do not like it...
	AI_Output(other,self, " DIA_Lester_ReturnToColony_15_06 " );	// Don't worry, he saved me from the Temple of the Sleeper. He is on our side.
};

instance DIA_Lester_SEND_XARDAS(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_SEND_XARDAS_Condition;
	information = DIA_Lester_SEND_XARDAS_Info;
	permanent = FALSE;
	description = " You must tell Xardas about this shadow. " ;
};

func int DIA_Lester_SEND_XARDAS_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lester_WhatHappened ) && ( LesterGoXar ==  FALSE ) && Npc_KnowsInfo ( other , DIA_Lester_MineColony ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lester_SEND_XARDAS_Info()
{
	AI_Output(other,self, " DIA_Lester_SEND_XARDAS_15_00 " );	// You must tell Xardas about this shadow. This might be important.
	AI_Output(self,other, " DIA_Lester_SEND_XARDAS_13_01 " );	// You don't think I imagined it? Are you saying that it really was...
	AI_Output(other,self, " DIA_Lester_SEND_XARDAS_15_02 " );	// ... dragon. Yes.
	AI_Output(self,other, " DIA_Lester_SEND_XARDAS_13_03 " );	// You're climbing into hell again. I'm right?
	AI_Output(other,self, " DIA_Lester_SEND_XARDAS_15_04 " );	// I would not say that at the very... yet...
	AI_Output(self,other, " DIA_Lester_SEND_XARDAS_13_05 " );	// (sighs) Well, if it's that important, I'll go see him - but not now.
	AI_Output(self,other, " DIA_Lester_SEND_XARDAS_13_06 " );	// Now I'm going to rest. I'm still exhausted after this escape from the colony.
	AI_Output(self,other, " DIA_Lester_SEND_XARDAS_13_07 " );	// I think you have big plans. See you later at Xardas.
	LesterCanGoXar = TRUE;
 	LesterCanGoXarDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lester_STADT (C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_STADT_Condition;
	information = DIA_Addon_Lester_STADT_Info;
	description = " I'm on my way to Khorinis. What do you know about this city? " ;
};


func int DIA_Addon_Lester_STADT_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Lester_Hello) && (Mil_310_always let in ==  FALSE ) && (Mil_333_already let in ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_CITY_Info()
{
	AI_Output(other,self, " DIA_Addon_Lester_STADT_15_00 " );	// I'm heading to Khorinis. What do you know about this city?
	AI_Output(self,other, " DIA_Addon_Lester_STADT_13_01 " );	// Khorinis? Well, it's a pretty big seaport.
	AI_Output(self,other, " DIA_Addon_Lester_STADT_13_02 " );	// Why do you ask?
	AI_Output(other,self, " DIA_Addon_Lester_STADT_15_03 " );	// I need to talk to the paladins who have settled in the city.
	AI_Output(self,other, " DIA_Addon_Lester_STADT_13_04 " );	// (laughs) Really? Ha, they won't even let you into the city itself, let alone the paladins.
};


instance DIA_Addon_Lester_Proposal (C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_Proposal_Condition;
	information = DIA_Addon_Lester_Proposal_Info;
	description = " Perhaps you know a way to get me to Khorinis? " ;
};


func int DIA_Addon_Lester_Proposal_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Lester_STADT) && (Mil_310_schonmalreinlett ==  FALSE ) && (Mil_333_schonmalreinlett ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Proposal_Info()
{
	AI_Output(other,self, " DIA_Addon_Lester_Vorschlag_15_00 " );	// Maybe you know a way that will help me get to Khorinis?
	AI_Output(self,other, " DIA_Addon_Lester_Vorschlag_13_01 " );	// I know. Some time ago I worked for an old alchemist named Constantino.
	AI_Output(self,other, " DIA_Addon_Lester_Vorschlag_13_02 " );	// He's quite a powerful person in the city. He managed to ensure that the guards let anyone who brings him rare herbs into the city.
	AI_Output(self,other, " DIA_Addon_Lester_Vorschlag_13_03 " );	// So it's actually quite simple. You need to collect a large bunch of plants growing around here, and then tell the guards that you are carrying them to Constantino.
	AI_Output(self,other, " DIA_Addon_Lester_Vorschlag_13_04 " );	// But you don't have to collect different herbs. The guards are not very smart and do not understand alchemy.
	AI_Output(self,other, " DIA_Addon_Lester_Vorschlag_13_05 " );	// In order for them to let you through, they must like your armful of herbs.
	AI_Output(self,other, " DIA_Addon_Lester_Vorschlag_13_06 " );	// I think ten identical plants will be enough.
	AI_Output(other,self, " DIA_Addon_Lester_Vorschlag_15_07 " );	// Thanks for the tip.
	Log_CreateTopic(TOPIC_Addon_PickForConstantino,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino,LOG_Running);
	B_LogEntry(TOPIC_Addon_PickForConstantino, " Lester says I can get past the city guard if I have 10 plants of the same species and if I tell them they are for the alchemist Constantino. " );
	MIS_Addon_Lester_PickForConstantino = LOG_Running;
};


instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS(C_Info)
{
	npc = PC_Psionic;
	nr = 5;
	condition = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;
	description = " Everything worked great. " ;
};


func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition()
{
	if((MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS) && (CheckTownPlants == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info()
{
	AI_Output(other,self, " DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00 " );	// Everything worked great. When I said that I had brought herbs for Constantino, the guards immediately let me through.
	AI_Output(self,other, " DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01 " );	// Like I said. I will not advise bad, my friend.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lester_Perm(C_Info)
{
	npc = PC_Psionic;
	nr = 99;
	condition = DIA_Lester_Perm_Condition;
	information = DIA_Lester_Perm_Info;
	permanent = FALSE;
	description = " What do you know about this area? " ;
};


func int DIA_Lester_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Lester_Perm_Info()
{
	AI_Output(other,self, " DIA_Lester_Perm_15_00 " );	// What do you know about the area?
	AI_Output(self,other, " DIA_Lester_Perm_13_01 " );	// If you follow this path, you will enter a farm. And a little further on the city begins.
	AI_Output(self,other, " DIA_Lester_Perm_13_02 " );	// But be careful! Along the way, you may encounter not only wolves and rats, but also goblins and bandits.

	if(LESTER_TERRAININFO == FALSE)
	{
		AI_Output(self,other, " DIA_Lester_Perm_13_06 " );	// One more thing... Take this novice loincloth!
		AI_Output(self,other, " DIA_Lester_Perm_13_07 " );	// I took it with me before I left the camp in the swamps.
		AI_Output(self,other, " DIA_Lester_Perm_13_08 " );	// I don't need it, but it might serve you well.
		B_GiveInvItems(self,other,itar_sekbed,1);
		LESTER_TERRAININFO = TRUE;
	};
};

instance DIA_LESTER_GETSMOKE(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = dia_lester_getsmoke_condition;
	information = dia_lester_getsmoke_info;
	permanent = FALSE;
	description = " Are you still feeling frazzled? " ;
};

func int dia_lester_getsmoke_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_lester_getsmoke_info()
{
	AI_Output(other,self, " DIA_Lester_Sleep_15_00 " );	// Do you still feel frazzled?
	AI_Output(self,other, " DIA_Lester_Sleep_13_01 " );	// More like. (yawns) I told Xardas everything. And now I'll sleep a little. Day...
	AI_Output(self,other, " DIA_Lester_Sleep_13_02 " );	// ...other... or even more.
	AI_Output(other,self, " DIA_Lester_GetSmoke_01_00 " );	// Is there anything I can help you with?
	AI_Output(self,other, " DIA_Lester_GetSmoke_01_01 " );	// I don't think there's anything you can do to help me. Although ... (thoughtfully)
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_02");	//Что?!
	AI_Output(self,other, " DIA_Lester_GetSmoke_01_03 " );	// Eh!...(nostalgically) I wouldn't mind a couple puffs of the good old bog we used to make in the swamp camp right now.
	AI_Output(self,other, " DIA_Lester_GetSmoke_01_04 " );	// Remember, for example, 'Northern Dark' - this herb was great for clearing the brain!
	AI_Output(self,other, " DIA_Lester_GetSmoke_01_05 " );	// And maybe she could bring me back to life for a little while.
	AI_Output(other,self, " DIA_Lester_GetSmoke_01_06 " );	// If you want, I can look for her for you?!
	AI_Output(self,other, " DIA_Lester_GetSmoke_01_07 " );	// You won't find it now!...(sadly) I heard that even the brothers at the aisle don't make it!
	AI_Output(self,other, " DIA_Lester_GetSmoke_01_09 " );	// But in any case, if you have time for this, you can look for it for me.
	AI_Output(other,self, " DIA_Lester_GetSmoke_01_10 " );	// Okay, I'll do my best!
	MIS_LESTERGETSMOKE = LOG_Running;
	Log_CreateTopic(TOPIC_LESTERGETSMOKE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LESTERGETSMOKE,LOG_Running);
	B_LogEntry( TOPIC_LESTERGETSMOKE , " Lester said he'd love to smoke 'Northern Dark', a swamp that used to be made by the Brotherhood of the Sleeper. If I see this weed, I'll have to remember to bring it to Lester. " );
};

instance DIA_LESTER_SMOKEFOUND(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = dia_lester_smokefound_condition;
	information = dia_lester_smokefound_info;
	permanent = FALSE;
	description = " I have something here for you. " ;
};


func int dia_lester_smokefound_condition()
{
	if((MIS_LESTERGETSMOKE == LOG_Running) && (Npc_HasItems(hero,itmi_joint_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_lester_smokefound_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Lester_SmokeFound_01_00 " );	// I have something here for you.
	AI_Output(self,other, " DIA_Lester_SmokeFound_01_01 " );	// Hmmm...(with interest) What are you hinting at?!
	AI_Output(self,other, " DIA_Lester_SmokeFound_01_02 " );	// Are you saying that you managed to get this weed for me?!
	AI_Output(other,self, " DIA_Lester_SmokeFound_01_03 " );	// Here you go - a real 'Northern Dark'!
	B_GiveInvItems(other,self,itmi_joint_02,1);
	AI_Output(self,other, " DIA_Lester_SmokeFound_01_04 " );	// Really?!...(surprised) Well, let's see now!
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other, " DIA_Lester_SmokeFound_01_05 " );	// Wow - it's really him!
	AI_Output(self,other, " DIA_Lester_SmokeFound_01_07 " );	// Thanks mate! You just rescued me.
	MIS_LESTERGETSMOKE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LESTERGETSMOKE,LOG_SUCCESS);
	B_LogEntry( TOPIC_LESTERGETSMOKE , " I brought 'Northern Dark' to Lester. He was just happy to taste his favorite taste again! It will bring him back to life a little. " );
};

instance DIA_Lester_KAP3_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP3_EXIT_Condition;
	information = DIA_Lester_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_BACKINTOWN(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_BACKINTOWN_Condition;
	information = DIA_Lester_BACKINTOWN_Info;
	important = TRUE;
};

func int DIA_Lester_BACKINTOWN_Condition()
{
	if ((NoDarkInsMe ==  TRUE ) && (Chapter ==  3 ) && (XarMeetsPsi ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lester_BACKINTOWN_Info()
{
	AI_Output(self,other, " DIA_Lester_BACKINTOWN_13_00 " );	// Hey, you're back at last! You must see Xardas immediately. Problems have arisen.
	AI_Output(other,self, " DIA_Lester_BACKINTOWN_15_01 " );	// I'm willing to believe this.
	AI_Output(self,other, " DIA_Lester_BACKINTOWN_13_02 " );	// After you left, all hell broke loose here.
	AI_Output(self,other, " DIA_Lester_BACKINTOWN_13_03 " );	// Talk to Xardas, he's waiting for you!
	AI_StopProcessInfos(self);
};

instance DIA_Lester_PERM3(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_Lester_PERM3_Condition;
	information = DIA_Lester_PERM3_Info;
	permanent = TRUE;
	description = " You don't look very good. " ;
};

func int DIA_Lester_PERM3_Condition()
{
	if((Kapitel >= 3) && (Lester_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Lester_PERM3_OneTime;

func void DIA_Lester_PERM3_Info()
{
	AI_Output(other,self, " DIA_Lester_PERM3_15_00 " );	// You don't look very good.

	if(hero.guild == GIL_KDF)
	{
		if(DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output(self,other, " DIA_Lester_PERM3_13_01 " );	// I don't feel very well. I'm completely exhausted, and these constant headaches...
			AI_Output(self,other, " DIA_Lester_PERM3_13_02 " );	// Every time one of these black-robed guys shows up here, they only get stronger.
			if(SC_KnowsMadPsi == TRUE)
			{
				AI_Output(other,self, " DIA_Lester_PERM3_15_03 " );	// And I can tell you why.
				AI_Output(self,other, " DIA_Lester_PERM3_13_04 " );	// Yes? I'm afraid I don't want to know.
				AI_Output(other,self, " DIA_Lester_PERM3_15_05 " );	// People in black robes or dark wanderers, as we mages call them, were the followers of a powerful archdemon. Doesn't that mean anything to you?
				AI_Output(self,other, " DIA_Lester_PERM3_13_06 " );	// Mmm. No. Unless you want to tell me that...
				AI_Output(other,self, " DIA_Lester_PERM3_15_07 " );	// Yes, exactly. The Dark Wanderers were followers of the Sleeper. Lunatics from the renegade sect from Swamp Camp.
				AI_Output(other,self, " DIA_Lester_PERM3_15_08 " );	// These are your people, Lester. Former Brotherhood of the Sleeper. Now they are just soulless minions of evil.
				AI_Output(self,other, " DIA_Lester_PERM3_13_09 " );	// I had my suspicions, but I hoped it wasn't. Are you saying he's back? Sleeping here again?
				AI_Output(other,self, " DIA_Lester_PERM3_15_10 " );	// Good question. I know for sure, only that I have to stop them before they get too strong.
				AI_Output(self,other, " DIA_Lester_PERM3_13_11 " );	// I don't like this, but I think you're right. I'm sorry, but this is going on in my head...
				B_LogEntry( TOPIC_DEMENTOREN , " My suspicions were confirmed. Even Lester has no doubt that the dark wanderers are the followers of the Sleeper from the old camp in the swamps. " );
				B_GivePlayerXP(XP_Lester_KnowsMadPsi);
				DIA_Lester_PERM3_OneTime = TRUE;
			};
		};
	}
	else if(Lester_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Lester_PERM3_13_12 " );	// Headaches still torment me, but I hope this problem will be solved soon.
		AI_Output(self,other, " DIA_Lester_PERM3_13_13 " );	// One way or another.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Lester_PERM3_13_14 " );	// My headaches have become unbearable. And now these lizard people keep attacking me. I ask myself where they all came from.
	}
	else
	{
		AI_Output(self,other, " DIA_Lester_PERM3_13_15 " );	// These headaches don't stop. Something terrible is coming.
	};
	AI_Output(self,other, " DIA_Lester_PERM3_13_16 " );	// (sighs) I think I better get some rest.
};


instance DIA_Lester_KAP4_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP4_EXIT_Condition;
	information = DIA_Lester_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_KAP5_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP5_EXIT_Condition;
	information = DIA_Lester_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_XARDASWEG(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_XARDASWEG_Condition;
	information = DIA_Lester_XARDASWEG_Info;
	description = " Where is Xardas? " ;
};


func int DIA_Lester_XARDASWEG_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info()
{
	AI_Output(other,self, " DIA_Lester_XARDASWEG_15_00 " );	// Where's Xardas?
	AI_Output(self,other, " DIA_Lester_XARDASWEG_13_01 " );	// He left, and these demonic creatures took over his tower.
	AI_Output(self,other, " DIA_Lester_XARDASWEG_13_02 " );	// I think he just doesn't want anyone rummaging through the tower while he's away.
	AI_Output(other,self, " DIA_Lester_XARDASWEG_15_03 " );	// Where did he go?
	AI_Output(self,other, " DIA_Lester_XARDASWEG_13_04 " );	// He didn't say. He only asked me to give you this letter.
	CreateInvItems(self,ItWr_XardasLetterToOpenBook_MIS,1);
	B_GiveInvItems(self,other,ItWr_XardasLetterToOpenBook_MIS,1);
	AI_Output(self,other, " DIA_Lester_XARDASWEG_13_05 " );	// I read it. I'm sorry. I was just curious.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//И?
	AI_Output(self,other, " DIA_Lester_XARDASWEG_13_07 " );	// I don't know, I didn't understand anything. But one thing is clear to me: we will not see Xardas soon now.
	AI_Output(self,other, " DIA_Lester_XARDASWEG_13_08 " );	// I think it got too hot for him in here, and he headed for the mountains.
	XARDAS_MISS = TRUE;
	B_LogEntry(TOPIC_BuchHallenVonIrdorath, " Xardas has disappeared. Lester gave me the letter Xardas left for me. " );
};


instance DIA_Lester_KnowWhereEnemy(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_KnowWhereEnemy_Condition;
	information = DIA_Lester_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " I found out where the enemy is hiding. " ;
};


func int DIA_Lester_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lester_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lester_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_Lester_KnowWhereEnemy_15_00 " );	// I found out where the enemy is hiding.
	AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_13_01 " );	// Don't ask me why I think so, but I think I should go with you.
	AI_Output(other,self, " DIA_Lester_KnowWhereEnemy_15_02 " );	// What do you mean by that?
	AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_13_03 " );	// I can't explain it, but I know I can only get an answer if I go with you.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_Lester_KnowWhereEnemy_15_04 " );	// Sorry, but the ship is already full.
		AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_13_05 " );	// Maybe that's the way it should be. Maybe my fate means nothing compared to the events that lie ahead of us.
		AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_13_06 " );	// You know what you need to do. Fight evil - don't worry about me.
		AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_13_07 " );	// My fate is not important.
	}
	else
	{
		Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy, " I can't take you with me. " ,DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy, " Then come with me and get your questions answered! " ,DIA_Lester_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lester_KnowWhereEnemy_Yes()
{
	B_GivePlayerXP(XP_Crewmember_Success);
	AI_Output(other,self, " DIA_Lester_KnowWhereEnemy_Yes_15_00 " );	// Then let's go together and find your answers!
	AI_Output(other,self, " DIA_Lester_KnowWhereEnemy_Yes_15_01 " );	// We'll meet at the port. When I'm ready, I'll go there.
	AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_Yes_13_02 " );	// Hurry, we don't have much time.
	Lester_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};

func void DIA_Lester_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_Lester_KnowWhereEnemy_No_15_00 " );	// I can't take you with me.
	AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_No_13_01 " );	// I understand. I probably can't really help you much.
	AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_No_13_02 " );	// It doesn't matter who you take with you - the main thing is that you trust them.
	AI_Output(self,other, " DIA_Lester_KnowWhereEnemy_No_13_03 " );	// And take care of yourself.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};


instance DIA_Lester_LeaveMyShip(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_LeaveMyShip_Condition;
	information = DIA_Lester_LeaveMyShip_Info;
	permanent = TRUE;
	description = " I still don't have a place for you. " ;
};


func int DIA_Lester_LeaveMyShip_Condition()
{
	if((Lester_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_Lester_LeaveMyShip_15_00 " );	// I still don't have a place for you.
	AI_Output(self,other, " DIA_Lester_LeaveMyShip_13_01 " );	// I understand. I would probably do the same if I were you.
	AI_Output(self,other, " DIA_Lester_LeaveMyShip_13_02 " );	// But if you need me, I'll be glad to help. You know where to find me.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lester_StillNeedYou(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_StillNeedYou_Condition;
	information = DIA_Lester_StillNeedYou_Info;
	permanent = TRUE;
	description = " I need a friend who is always ready to help. " ;
};


func int DIA_Lester_StillNeedYou_Condition()
{
	if(((Lester_IsOnBoard == LOG_OBSOLETE) || (Lester_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_Lester_StillNeedYou_15_00 " );	// I need a friend who is always ready to help.
	if(Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other, " DIA_Lester_StillNeedYou_13_01 " );	// I knew it, we'll get through this together, just like before.
		AI_Output(self,other, " DIA_Lester_StillNeedYou_13_02 " );	// Evil must be feared as we follow closely.
		Lester_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Lester_StillNeedYou_13_03 " );	// I think it's better if I stay here anyway. Good luck.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lester_KAP6_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP6_EXIT_Condition;
	information = DIA_Lester_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_Psionic_PICKPOCKET(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_PC_Psionic_PICKPOCKET_Condition;
	information = DIA_PC_Psionic_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_PC_Psionic_PICKPOCKET_Condition()
{
	return  C_Robbery ( 76 , 20 );
};

func void DIA_PC_Psionic_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET,Dialog_Back,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET,DIALOG_PICKPOCKET,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

instance DIA_LESTER_OTHERBROTHER(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_otherbrother_condition;
	information = dia_lester_otherbrother_info;
	permanent = FALSE;
	description = " So all your other brothers are dead? " ;
};


func int dia_lester_otherbrother_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_WhatHappened) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_lester_otherbrother_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Lester_OtherBrother_01_00 " );	// So all your other brothers died?
	AI_Output(self,other, " DIA_Lester_OtherBrother_01_01 " );	// No. As it turned out, there were those who still managed to survive this madness.
	AI_Output(other,self, " DIA_Lester_OtherBrother_01_02 " );	// How do you know that?!
	AI_Output(self,other, " DIA_Lester_OtherBrother_01_03 " );	// One guy told me about this, whom I met him not far from the foothill pass, up there.
	AI_Output(other,self, " DIA_Lester_OtherBrother_01_04 " );	// Who was that?!
	AI_Output(self,other, " DIA_Lester_OtherBrother_01_05 " );	// If my memory serves me, his name was Cavalorn.
	AI_Output(self,other, " DIA_Lester_OtherBrother_01_06 " );	// You must remember him - he was one of Gomez's ghosts in the colony.
	AI_Output(other,self, " DIA_Lester_OtherBrother_01_07 " );	// I seem to remember something. And what did he say?!
	AI_Output(self,other, " DIA_Lester_OtherBrother_01_08 " );	// Well... (thoughtfully) said that the few surviving gurus of the Brotherhood had recently set up a small camp, not far from the passage to the Valley of Mines.
	AI_Output(self,other, " DIA_Lester_OtherBrother_01_09 " );	// True, in his own words - now these guys preach some other faith and no longer worship the Sleeper!
	AI_Output(other,self, " DIA_Lester_OtherBrother_01_12 " );	// Then maybe you should visit there?
	AI_Output(self,other, " DIA_Lester_OtherBrother_01_13 " );	// No, buddy - I've had enough of this! I'm fine here too!
	AI_Output(other,self, " DIA_Lester_OtherBrother_01_14 " );	// Well, whatever you say.
};


instance DIA_LESTER_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_kapitelorcattack_condition;
	information = dia_lester_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " And how are we going to get out now? " ;
};


func int dia_lester_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (PSIONICBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_Lester_NW_KapitelOrcAttack_01_00 " );	// How are we going to get out now?
	AI_Output(self,other, " DIA_Lester_NW_KapitelOrcAttack_01_01 " );	// I'm sure it's not a problem for you...(laughs) You've probably already come up with something!
	AI_Output(self,other, " DIA_Lester_NW_KapitelOrcAttack_01_03 " );	// You've always managed to get away with it.
	AI_Output(other,self, " DIA_Lester_NW_KapitelOrcAttack_01_05 " );	// What are you going to do?!
	AI_Output(self,other, " DIA_Lester_NW_KapitelOrcAttack_01_06 " );	// I don't know yet... (thoughtfully) The only thing that comes to my mind is to break through the city with a fight!
	AI_Output(other,self, " DIA_Lester_NW_KapitelOrcAttack_01_07 " );	// I don't think this is the best solution.
	AI_Output(self,other, " DIA_Lester_NW_KapitelOrcAttack_01_08 " );	// What else can we do...(sadly) Or do you have a better suggestion?!
	Info_ClearChoices(dia_lester_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportPsicamp) >= 1)
	{
		Info_AddChoice(dia_lester_nw_kapitelorcattack, " Offer Teleport Rune to Brotherhood Camp. " ,dia_lester_nw_kapitelorcattack_psicamp);
	};
	Info_AddChoice(dia_lester_nw_kapitelorcattack,"Нет.",dia_lester_nw_kapitelorcattack_nogiverune);
};

func void dia_lester_nw_kapitelorcattack_psicamp()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_01 " );	// I have a rune to teleport to the Brotherhood camp with me. You could use it!
	AI_Output(self,other, " DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_02 " );	// Rune of teleportation?! Hmmm... (thoughtfully)
	B_GiveInvItems(other,self,ItMi_TeleportPsicamp,1);
	Npc_RemoveInvItems(self,ItMi_TeleportPsicamp,1);
	AI_Output(self,other, " DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_04 " );	// Well, thank you... (surprised) Then I probably won't waste time and go there right away.
	PSIONICNOBATTLETHROUGTH = TRUE;
	B_LogEntry( TOPIC_HELPCREW , " I gave Lester the teleportation rune to Swamp Camp! I think he should be able to get out of the harbor without any problems, bypassing the orc patrols. " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_lester_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_NoGiveRune_01_00");	//Нет.
	AI_Output(self,other, " DIA_Lester_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// You see... (sadly) We have no other choice!
	B_LogEntry( TOPIC_HELPCREW , " Lester decided to do the same as most of the other guys. Apparently, they have to fight their way with a sword through numerous ranks of orcs. I think he has a pretty good chance of doing what he planned! " );
	PSIONICBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_ESCAPE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_escape_condition;
	information = dia_lester_nw_escape_info;
	permanent = FALSE;
	description = " It's good to see you alive and well! " ;
};


func int dia_lester_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Lester_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lester_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self, " DIA_Lester_NW_Escape_01_01 " );	// Hey Lester, good to see you alive and well!
	AI_Output(self,other, " DIA_Lester_NW_Escape_01_02 " );	// To be honest... (smiling) I love you too!
	AI_Output(other,self, " DIA_Lester_NW_Escape_01_03 " );	// So you managed to break through the city?!
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other, " DIA_Lester_NW_Escape_01_04 " );	// As you can see, I succeeded! However, not everyone is so lucky.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other, " DIA_Lester_NW_Escape_01_05 " );	// Many of us were taken prisoner by orcs... (sadly) What now they will do with them, only Innos knows!
			B_LogEntry( TOPIC_HELPCREW , " I met Lester at the Brotherhood camp, alive and well. Good news! " );
			Log_AddEntry( TOPIC_HELPCREW , " There were some bad ones though! He told me that a lot of the guys were captured by the orcs during the break through the city. I hope they are still alive! " );
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other, " DIA_Lester_NW_Escape_01_06 " );	// Many of us have been taken prisoner by orcs... (sadly) There are those who died fighting them!
			B_LogEntry( TOPIC_HELPCREW , " I met Lester at the Brotherhood camp, alive and well. Good news! " );
			Log_AddEntry( TOPIC_HELPCREW , "The truth was not without bad ones! He told me that many guys were captured by the orcs during the breakthrough through the city. There are those who died. " );
		};
		AI_Output(other,self, " DIA_Lester_NW_Escape_01_07 " );	// Yes, that's not good news.
		AI_Output(self,other, " DIA_Lester_NW_Escape_01_08 " );	// Now there's nothing you can do about it.
		AI_Output(other,self,"DIA_Lester_NW_Escape_01_09");	//Понимаю.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Lester_NW_Escape_01_10 " );	// As you can see! And as far as I know, everyone who was then on the ship succeeded in this.
		AI_Output(other,self, " DIA_Lester_NW_Escape_01_11 " );	// Yes, that's just great news!
		AI_Output(self,other, " DIA_Lester_NW_Escape_01_12 " );	// I agree with you... (smiling) Even now I don't know who to thank for such a wonderful salvation!
		B_LogEntry( TOPIC_HELPCREW , " I met Lester at the Brotherhood camp, alive and well. That's good news! As well as the fact that all the other guys managed to get out of the city as well. " );
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_LESTER_NW_SOONBATTLE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_soonbattle_condition;
	information = dia_lester_nw_soonbattle_info;
	permanent = FALSE;
	description = " How are things at camp? " ;
};


func int dia_lester_nw_soonbattle_condition()
{
	if((MIS_HELPCREW == LOG_SUCCESS) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_soonbattle_info()
{
	AI_Output(other,self, " DIA_Lester_NW_SoonBattle_01_00 " );	// How are things at the camp?
	AI_Output(self,other, " DIA_Lester_NW_SoonBattle_01_01 " );	// Seems fine...(calmly) Although everyone is talking about orcs!
	AI_Output(other,self, " DIA_Lester_NW_SoonBattle_01_03 " );	// Have they already tried to attack you?!
	AI_Output(self,other, " DIA_Lester_NW_SoonBattle_01_04 " );	// No! They didn't even come close.
	AI_Output(self,other, " DIA_Lester_NW_SoonBattle_01_05 " );	// Apparently, their main goal was still the city itself. And they have nothing to do with us!
};


instance DIA_LESTER_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_soonbattlenow_condition;
	information = dia_lester_nw_soonbattlenow_info;
	permanent = FALSE;
	description = " Will you go fight the orcs? " ;
};


func int dia_lester_nw_soonbattlenow_condition()
{
	if (( KAPITELORCATC  ==  TRUE ) && ( TPL_JOINHAGEN  ==  TRUE ) && ( STOPBIGBATTLE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_lester_nw_soonbattlenow_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lester_NW_SoonBattleNow_01_00 " );	// Are you going to fight the orcs?
	AI_Output(self,other, " DIA_Lester_NW_SoonBattleNow_01_01 " );	// Of course... (smiling) Where am I going to go! After all, now this is our war too.
	AI_Output(self,other, " DIA_Lester_NW_SoonBattleNow_01_02 " );	// In addition, I'm sure many of my friends will also be involved in all this.
	AI_Output(self,other, " DIA_Lester_NW_SoonBattleNow_01_03 " );	// And that can only mean one thing - my place is next to them!
	AI_Output(other,self, " DIA_Lester_NW_SoonBattleNow_01_05 " );	// Glad to hear it.
};


instance DIA_LESTER_NW_BATTLEWIN(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_battlewin_condition;
	information = dia_lester_nw_battlewin_info;
	permanent = FALSE;
	description = " The battle is now ours! " ;
};


func int dia_lester_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lester_NW_BattleWin_01_00 " );	// The battle is ours!
	AI_Output(self,other, " DIA_Lester_NW_BattleWin_01_01 " );	// Yeah, we've taught the orcs a good lesson...(enough) So they probably won't stick around here anymore!
	if ( FREEDOM  ==  FALSE )
	{
		AI_Output(self,other, " DIA_Lester_NW_BattleWin_01_02 " );	// However, don't overestimate the significance of this victory.
		AI_Output(self,other, " DIA_Lester_NW_BattleWin_01_03 " );	// Our enemy is still strong enough and will surely try to change the current situation in his favor.
		AI_Output(other,self, " DIA_Lester_NW_BattleWin_01_04 " );	// Then we need to stop him!
		AI_Output(self,other, " DIA_Lester_NW_BattleWin_01_05 " );	// Of course...(calmly) But I don't think it's worth it to hurry too much! After all, it is not known how everything will turn out.
	};
};


instance DIA_LESTER_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_goonorkshunt_condition;
	information = dia_lester_nw_goonorkshunt_info;
	permanent = FALSE;
	description = " Lord Hagen gave me an assignment. " ;
};


func int dia_lester_nw_goonorkshunt_condition()
{
	if (( HAGENGIVEHELP  ==  TRUE ) && ( ALLGREATVICTORY  ==  FALSE ) && ( LESTERTOBIGLAND  ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && Npc_KnowsInfo(hero,dia_lester_nw_battlewin));
	{
		return TRUE;
	};
};

func void dia_lester_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Lester_NW_GoOnOrksHunt_01_00 " );	// Lord Hagen gave me a mission.
	AI_Output(self,other, " DIA_Lester_NW_GoOnOrksHunt_01_01 " );	// And what is it?...(seriously)
	AI_Output(other,self, " DIA_Lester_NW_GoOnOrksHunt_01_02 " );	// It's about orcs! We need to finish off a couple of these creatures so that others would be discouraged from sticking their nose in here.
	AI_Output(self,other, " DIA_Lester_NW_GoOnOrksHunt_01_03 " );	// It won't be easy! You will need help.
	AI_Output(other,self, " DIA_Lester_NW_GoOnOrksHunt_01_04 " );	// That's exactly what I wanted to ask you.
	AI_Output(self,other, " DIA_Lester_NW_GoOnOrksHunt_01_05 " );	// Well, as for me... (thoughtfully) I'm always ready to help an old friend!
	AI_Output(self,other, " DIA_Lester_NW_GoOnOrksHunt_01_06 " );	// Just tell me when we play. And I will gladly help you with this!
	LESTERJOINMEHUNT = TRUE;
};


instance DIA_LESTER_NW_FOLLOWME(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_followme_condition;
	information = dia_lester_nw_followme_info;
	permanent = TRUE;
	description = " Follow me! " ;
};


func int dia_lester_nw_followme_condition()
{
	if (( LESTERJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( LESTERTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_lester_nw_followme_info()
{
	AI_Output(other,self, " DIA_Lester_NW_FollowMe_01_00 " );	// Follow me!
	AI_Output(self,other, " DIA_Lester_NW_FollowMe_01_01 " );	// Yes! Let's show these creatures.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_STOPHERE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_stophere_condition;
	information = dia_lester_nw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_lester_nw_stophere_condition()
{
	if (( LESTERJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( LESTERTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_lester_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Lester_NW_StopHere_01_00");	//Жди тут!
	AI_Output(self,other, " DIA_Lester_NW_StopHere_01_01 " );	// As you say! Although I think it's too early to rest.
	Npc_ExchangeRoutine(self,"CampOn");
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_allgreatvictory_condition;
	information = dia_lester_nw_allgreatvictory_info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int dia_lester_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_lester_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Lester_NW_AllGreatVictory_01_00 " );	// How are you?
	AI_Output(self,other, " DIA_Lester_NW_AllGreatVictory_01_01 " );	// There are no more orcs around, which is good enough!
	AI_Output(self,other, " DIA_Lester_NW_AllGreatVictory_01_02 " );	// Everything around begins to slowly return to their places and soon, no one will even remember what happened here.
};


instance DIA_LESTER_NW_WHATDONOW(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_whatdonow_condition;
	information = dia_lester_nw_whatdonow_info;
	permanent = FALSE;
	description = " What are you going to do? " ;
};


func int dia_lester_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (LESTERTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_whatdonow_info()
{
	AI_Output(other,self, " DIA_Lester_NW_WhatDoNow_01_00 " );	// What are you going to do?
	AI_Output(self,other, " DIA_Lester_NW_WhatDoNow_01_01 " );	// I'll stay at the camp for now and help the Idol of Oran...(confidently)
	AI_Output(self,other, " DIA_Lester_NW_WhatDoNow_01_02 " );	// After all, someone will have to take care of our new acolytes!
	AI_Output(self,other, " DIA_Lester_NW_WhatDoNow_01_03 " );	// In addition, it is so quiet and calm in it that I can hardly find a better place to live!
};


instance DIA_LESTER_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_travelonbigland_condition;
	information = dia_lester_nw_travelonbigland_info;
	permanent = FALSE;
	description = " I have some news for you. " ;
};


func int dia_lester_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_lester_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lester_NW_TravelOnBigLand_01_00 " );	// I have news for you.
	AI_Output(self,other, " DIA_Lester_NW_TravelOnBigLand_01_01 " );	// Interesting...(slyly) What are you up to this time?!
	AI_Output(other,self, " DIA_Lester_NW_TravelOnBigLand_01_05 " );	// I wanted to invite you to come with me to the mainland.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_06");	//Зачем?!
	AI_Output(other,self, " DIA_Lester_NW_TravelOnBigLand_01_07 " );	// I have a message for the king! Believe me, this is very important.
	AI_Output(self,other, " DIA_Lester_NW_TravelOnBigLand_01_08 " );	// Hmmm... (thoughtfully) The reason is quite serious! And you will surely need the help of your old friends again.
	AI_Output(self,other, " DIA_Lester_NW_TravelOnBigLand_01_09 " );	// So, as much as I'm sorry to part with all this beauty, I'm going to accept your offer.
	AI_Output(other,self, " DIA_Lester_NW_TravelOnBigLand_01_11 " );	// Good! Then I'll wait for you on the ship.
	AI_Output(self,other, " DIA_Lester_NW_TravelOnBigLand_01_12 " );	// I'll be there soon.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	LESTERTOBIGLAND = TRUE;
	B_LogEntry( TOPIC_SALETOBIGLAND , " Lester will take me to the mainland! I guess he just can't afford to let me go there alone. " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

