

instance DIA_Harad_EXIT(C_Info)
{
	npc = VLK_412_Harad;
	nr = 999;
	condition = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Harad_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Harad_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

var int FirstTalkHard;

instance DIA_Harad_NoTalkAtAll(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_NoTalkAtAll_Condition;
	information = DIA_Harad_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Harad_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_NoTalkAtAll_Info()
{
	if(FirstTalkHarad == FALSE)
	{
		AI_Output(self,other, " DIA_Harad_NoTalkAtAll_12_00 " );	// (terribly) Hey, what do you want here?
		AI_Output(self,other, " DIA_Harad_NoTalkAtAll_12_01 " );	// You have nothing to do here! Go away!
		AI_Output(self,other, " DIA_Harad_NoTalkAtAll_12_02 " );	// And so that your spirit is no longer here.
		FirstTalkHarad = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_NoTalkAtAll_12_03 " );	// I said get out!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Harad_Hallo (C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Hallo_Condition;
	information = DIA_Harad_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Harad_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Harad_Hallo_Info()
{
	AI_Output(self,other, " DIA_Harad_Hallo_12_00 " );	// (annoyed) What do you want?
};

instance DIA_Harad_Work (C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Work_Condition;
	information = DIA_Harad_Work_Info;
	permanent = FALSE;
	description = " I'm looking for a job! " ;
};

func int DIA_Harad_Work_Condition()
{
	return TRUE;
};

func void DIA_Harad_Work_Info()
{
	AI_Output(other,self, " DIA_Harad_Arbeit_15_00 " );	// I'm looking for a job!
	AI_Output(self,other, " DIA_Harad_Arbeit_12_01 " );	// Hmm - I could use a new student.
	AI_Output(self,other, " DIA_Harad_Arbeit_12_02 " );	// Brian will soon finish his training and then leave town.
	AI_Output(self,other, " DIA_Harad_Arbeit_12_03 " );	// Are you good for anything?
	AI_Output(other,self, " DIA_Harad_Arbeit_15_04 " );	// If you mean do I know the work of a blacksmith.
	AI_Output(self,other, " DIA_Harad_Arbeit_12_05 " );	// No. I'm talking about something else.
	AI_Output(self,other, " DIA_Harad_Arbeit_12_06 " );	// Sooner or later, the orcs will come and encircle the city. And then only men capable of defending the city will be taken into account.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Harad_Arbeit_12_07 " );	// And I don't want my apprentice to dishonor my name by running out of town with women and useless bums instead of holding the line with other men.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling, " If I can convince Harad I'm good for anything, he'll accept me as an apprentice. " );
};


instance DIA_Harad_Good-for-nothing (C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Taugenichts_Condition;
	information = DIA_Harad_Good-for-nothing_Info;
	permanent = FALSE;
	description = " I'm not worthless! " ;
};

func int DIA_Harad_Good-for-nothing_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Harad_Good-for-nothing_Info()
{
	AI_Output(other,self, " DIA_Harad_Taugenichts_15_00 " );	// I'm not worthless!
	AI_Output(self,other, " DIA_Harad_Taugenichts_12_01 " );	// These are big words! Can you confirm them with the same high-profile cases?
	AI_Output(other,self, " DIA_Harad_Taugenichts_15_02 " );	// What are you implying?
	AI_Output(self,other, " DIA_Harad_Taugenichts_12_03 " );	// Bring me an orc weapon.
	AI_Output(self,other, " DIA_Harad_Taugenichts_12_04 " );	// Orcs have been seen near the city recently. I think you won't have to look for them for too long.
	AI_Output(self,other, " DIA_Harad_Taugenichts_12_05 " );	// If you manage to fail one of them, I'll take you on as an apprentice.
	AI_Output(self,other, " DIA_Harad_Taugenichts_12_06 " );	// Unless, of course, the other masters agree.
	MIS_Harad_Orc = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrk,LOG_Running);
	B_LogEntry(TOPIC_HaradOrk, " An orc was seen near the city. Blacksmith Harad wants me to kill him. An orc's weapon will be proof enough. " );
};


instance DIA_Harad_OrcRunning(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcRunning_Condition;
	information = DIA_Harad_OrcRunning_Info;
	permanent = FALSE;
	description = " Let's talk about those orcs some more. " ;
};


func int DIA_Harad_OrcRunning_Condition()
{
	if((MIS_Harad_Orc == LOG_Running) && (Harad_HakonMission == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcRunning_Info()
{
	AI_Output(other,self, " DIA_Harad_OrcRunning_15_00 " );	// Let's talk about these orcs some more.
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//Что?
	Info_ClearChoices(DIA_Harad_OrcRunning);
	Info_AddChoice(DIA_Harad_OrcRunning, " You can consider your orc dead! " ,DIA_Harad_OrcRunning_Done);
	Info_AddChoice(DIA_Harad_OrcRunning, " An Orc is a very tough opponent. " ,DIA_Harad_OrcRunning_TooHard);
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output(other,self, " DIA_Harad_OrcRunning_TooHard_15_00 " );	// But the orc is a very serious opponent.
	AI_Output(self,other, " DIA_Harad_OrcRunning_TooHard_12_01 " );	// Hmm - judging by the way you look, you might be right. You don't have enough meat on your bones. But this can be improved.
	AI_Output(self,other, " DIA_Harad_OrcRunning_TooHard_12_02 " );	// Tom, however, you must prove to me that you have the guts to fight if need be.
	AI_Output(other,self, " DIA_Harad_OrcRunning_TooHard_15_03 " );	// Is there a slightly smaller opponent for me?
	AI_Output(self,other, " DIA_Harad_OrcRunning_TooHard_12_04 " );	// Hmm - (thoughtfully) Hakon, the arms dealer in the marketplace, told me he was attacked by bandits a few days ago.
	AI_Output(self,other, " DIA_Harad_OrcRunning_TooHard_12_05 " );	// Those bastards are rumored to have made their lair somewhere outside the east gate.
	AI_Output(self,other, " DIA_Harad_OrcRunning_TooHard_12_06 " );	// Those cowardly jackals shouldn't be that strong. Kill those bastards! Everyone!
	AI_Output(self,other, " DIA_Harad_OrcRunning_TooHard_12_07 " );	// Then I will understand that you will not disgrace our city.
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);

	if(MIS_HakonBandits != LOG_Running)
	{
		B_LogEntry(TOPIC_Lehrling, " Harad told me that bandits had robbed Hakon's trader just outside of town. If I can kill them, that will convince him I'm good for something. I should talk to Hakon. Maybe he knows where they're hiding these bandits. " );
	}
	else
	{
		B_LogEntry(TOPIC_Lehrling, " Harad told me that bandits had robbed Hakon's trader just outside of town. If I can kill them, that will convince him I'm good for something. " );
	};
	Info_ClearChoices(DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output(other,self, " DIA_Harad_OrcRunning_Done_15_00 " );	// You can consider your orc dead!
	AI_Output(self,other, " DIA_Harad_OrcRunning_Done_12_01 " );	// Good! Then don't waste words. Let your deeds speak for themselves.
	Info_ClearChoices(DIA_Harad_OrcRunning);
};


instance DIA_Harad_OrcSuccess(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcSuccess_Condition;
	information = DIA_Harad_OrcSuccess_Info;
	permanent = FALSE;
	description = " I brought you the orc weapons you wanted. " ;
};


func int DIA_Harad_OrcSuccess_Condition()
{
	if(MIS_Harad_Orc == LOG_Running)
	{
		if((Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_01) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_02) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_03) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_04) > 0) || (Npc_HasItems(other,itmw_addon_keule_1h_03) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_OrcSuccess_Info()
{
	AI_Output(other,self, " DIA_Harad_OrcSuccess_15_00 " );	// I brought you the orc weapons you wanted.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Покажи!

	if(Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_01,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_02,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_03,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_04,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_04,1);
	}
	else if(Npc_HasItems(other,itmw_addon_keule_1h_03) > 0)
	{
		B_GiveInvItems(other,self,itmw_addon_keule_1h_03,1);
		Npc_RemoveInvItems(self,itmw_addon_keule_1h_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_01) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_01,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_02) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_02,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_03) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_03,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_04) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_04,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_04,1);
	};

	if(Harad_HakonMission == TRUE)
	{
		AI_Output(self,other, " DIA_Harad_OrcSuccess_12_02 " );	// You STILL did it?! You are a real man!
	};
	AI_Output(self,other, " DIA_Harad_OrcSuccess_12_03 " );	// I haven't held such a weapon in my hands for a long time - since I was a soldier during the Orc War.
	AI_Output(self,other, " DIA_Harad_OrcSuccess_12_04 " );	// Yeah, those were tough times, I'll tell you.

	if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other, " DIA_Harad_OrcSuccess_12_05 " );	// I knew you'd make a good student. Great job!
	}
	else if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other, " DIA_Harad_OrcSuccess_12_06 " );	// I didn't think you could do it. I am amazed!
		B_LogEntry(TOPIC_Lehrling, " Harad agrees to take me on as an apprentice if I get the consent of the other masters. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_OrcSuccess_12_07 " );	// It's a pity that you chose another craft.
		AI_Output(self,other, " DIA_Harad_OrcSuccess_12_08 " );	// You would be very useful to me.
	};

	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP(XP_Harad_Orc);
};

instance DIA_Harad_OrcWar (C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcWar_Condition;
	information = DIA_Harad_OrcWar_Info;
	permanent = FALSE;
	description = " You said you fought the orcs. " ;
};

func int DIA_Harad_OrcWar_Condition()
{
	if(MIS_Harad_Orc == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcWar_Info()
{
	AI_Output(other,self, " DIA_Harad_OrcWar_01_00 " );	// You said you fought the orcs.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_01 " );	// It was a long time ago... (thoughtfully) I was still just a boy then, just like you.
	AI_Output(other,self, " DIA_Harad_OrcWar_01_02 " );	// Can you tell us a little about your exploits?
	AI_Output(self,other, " DIA_Harad_OrcWar_01_03 " );	// (seriously) Do you want to listen? Well, that's good.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_04 " );	// ...(coughing) I served in the royal garrison of Faring and guarded the mountain pass leading from Nordmar to Myrtana.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_05 " );	// Orc attacks were pretty common for us.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_06 " );	// This is understandable. After all, the pass itself was an extremely important strategic point for them.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_07 " );	// Since he opened the passage not only to Myrtana itself, but also to the capital of the kingdom - Vengard!
	AI_Output(self,other, " DIA_Harad_OrcWar_01_08 " );	// That's why the orcs made constant attempts to knock us out of that fortress.
	AI_Output(other,self, " DIA_Harad_OrcWar_01_09 " );	// But apparently, they didn't do it very well.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_10 " );	// Yes, you're right... (chuckling) It basically boiled down to small skirmishes on the outskirts of the pass.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_11 " );	// This went on for a very long time... (thoughtfully) Until the decisive moment arrived!
	AI_Output(other,self, " DIA_Harad_OrcWar_01_12 " );	// What do you mean?
	AI_Output(self,other, " DIA_Harad_OrcWar_01_13 " );	// I'm talking about the battle known throughout the world as the Battle of Snow Mountain.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_14 " );	// I happened to take part in it, and it was there that I became a real man!
	AI_Output(other,self, " DIA_Harad_OrcWar_01_15 " );	// Tell me how it was.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_16 " );	// It's been hell, boy... (seriously) Orcs are well prepared for the attack!
	AI_Output(self,other, " DIA_Harad_OrcWar_01_17 " );	// There are at least two thousand orcs against us.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_18 " );	// Moreover, the main backbone of their army was made up of elite black orcs, which is extremely rare.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_19 " );	// So, at first they muzzled us with huge boulders from their catapults for two days. And at the dawn of the third, they went on the assault!
	AI_Output(self,other, " DIA_Harad_OrcWar_01_20 " );	// I will not describe to you all the horrors of that battle, but we survived then only thanks to our courage and bravery.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_21 " );	// Hmmm... (coughing) Well, and a small detachment of paladins who came to our aid from Gotha.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_22 " );	// With their help, by the evening we were able to push the orcs back over the pass, to Nordmar.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_23 " );	// This is how the great battle ended!
	AI_Output(self,other, " DIA_Harad_OrcWar_01_24 " );	// Since then, I have only my sword with which I fought that day.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_25 " );	// I kept it as a reminder of what the courage and bravery of people are worth!
	AI_Output(other,self, " DIA_Harad_OrcWar_01_26 " );	// What kind of sword is this?
	AI_Output(self,other, " DIA_Harad_OrcWar_01_27 " );	// I gave him a name - 'Orc Slayer'! And by Innos, it lives up to its name.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_28 " );	// I personally managed to finish off more than a dozen orcs with this sword at that time.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_29 " );	// It's still stained with dried orc blood.
	AI_Output(other,self, " DIA_Harad_OrcWar_01_30 " );	// Yes, impressive! Are you selling this sword by any chance?
	AI_Output(other,self, " DIA_Harad_OrcWar_01_31 " );	// I could do with a legendary weapon like this.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_32 " );	// No! I won't sell it to you. Don't even dream!
	AI_Output(self,other, " DIA_Harad_OrcWar_01_33 " );	// And if you really want to get it, then first bring me the Orc Warrior Amulet.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_34 " );	// Then I'll know for sure that my weapon went to a courageous and brave man!
	AI_Output(other,self, " DIA_Harad_OrcWar_01_35 " );	// What is this amulet?
	AI_Output(self,other, " DIA_Harad_OrcWar_01_36 " );	// It is usually worn by elite orc warriors. This is their kind of distinction from the rest of the fighters.
	AI_Output(self,other, " DIA_Harad_OrcWar_01_37 " );	// Get it for me! And then you will receive your reward.
	AI_Output(other,self, " DIA_Harad_OrcWar_01_38 " );	// Okay, I'll try.
	MIS_HaradOrcWar = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrcWar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrcWar,LOG_Running);
	B_LogEntry(TOPIC_HaradOrcWar, " Harad told me about the legendary battle with the orcs that took place on the snowy pass between Nordmar and Myrtana. He took part in it and killed many orcs then. In memory of that battle, he still keeps the sword with which he fought that day. He called him 'Orc Slayer!' He will give me that sword if I bring him the Orc Warrior Amulet that elite Orcs usually carry. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrcElite_Roam_Harad,"NW_FOREST_PATH_12");
};

instance DIA_Harad_OrcWar_Done(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcWar_Done_Condition;
	information = DIA_Harad_OrcWar_Done_Info;
	permanent = FALSE;
	description = " I brought you an elite orc amulet. " ;
};

func int DIA_Harad_OrcWar_Done_Condition()
{
	if((MIS_HaradOrcWar == LOG_Running) && (Npc_HasItems(other,ItMi_BlackOrcTalisman) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcWar_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Harad_OrcWar_Done_01_00 " );	// I brought you an elite orc amulet.
	AI_Output(self,other, " DIA_Harad_OrcWar_Done_01_01 " );	// Really?! I won't believe it until I see it with my own eyes.
	AI_Output(other,self, " DIA_Harad_OrcWar_Done_01_02 " );	// Here, look at it.
	B_GiveInvItems(other,self,ItMi_BlackOrcTalisman,1);
	Npc_RemoveInvItems(self,ItMi_BlackOrcTalisman,1);
	AI_Output(self,other, " DIA_Harad_OrcWar_Done_01_03 " );	// (contemplating) Yeah man, looks like you were right.
	AI_Output(self,other, " DIA_Harad_OrcWar_Done_01_04 " );	// Although so many years have passed, I recognize this little thing!
	AI_Output(other,self, " DIA_Harad_OrcWar_Done_01_05 " );	// Well, you see? I wouldn't lie to you.
	AI_Output(self,other, " DIA_Harad_OrcWar_Done_01_06 " );	// Okay, okay... (respectfully) Sorry old man! Got a little hot.
	AI_Output(self,other, " DIA_Harad_OrcWar_Done_01_07 " );	// It's just that few people can handle an elite orc these days. But you did it!
	AI_Output(self,other, " DIA_Harad_OrcWar_Done_01_08 " );	// And therefore, here - hold my sword! Now he is yours.
	AI_Output(other,self, " DIA_Harad_OrcWar_Done_01_09 " );	// Thank you.
	B_GiveInvItems(self,other,ITMW_1H_SWORD_ORCSLAYER_01,1);
	MIS_HaradOrcWar = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_HaradOrcWar,LOG_SUCCESS);
	B_LogEntry(TOPIC_HaradOrcWar, " I brought the Orc warrior amulet to Harad, and he gave me his sword as promised. " );
};

var int Harad_StartGuild;

instance DIA_Harad_LEHRLING (C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_LEHRLING_Condition;
	information = DIA_Harad_LEHRLING_Info;
	permanent = TRUE;
	description = " When can I become your student? " ;
};


func int DIA_Harad_LEHRLING_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Harad_Work ) && ( Player_IsApprentice ==  APP_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Harad_LEHRLING_Info()
{
	var int vote;
	vote = 0 ;
	AI_Output(other,self, " DIA_Harad_LEHRLING_15_00 " );	// When can I become your student?

	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		if(MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_01 " );	// We could use a man here who could kill an orc.
			if(MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_02 " );	// Also, Hakon told me how you solved the problem with the bandits. You are a real man!
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_03 " );	// You didn't kill the orc, but Hakon told me how you solved the problem with the bandits. This is good!
		};
		AI_Output(self,other, " DIA_Harad_LEHRLING_12_04 " );	// As for my opinion, you can start working right now.
		vote = vote +  1 ;
		AI_Output(self,other, " DIA_Harad_LEHRLING_12_05 " );	// And other masters...
		if (Thorben.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_06 " );	// Torben gave you his blessing.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_07 " );	// Good old Torben wants you to be blessed by the gods. I think it's a good idea.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_08 " );	// Torben says he never saw you.
		};
		if (Bosper.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_09 " );	// Bosper tried to talk me out of taking you on as an apprentice. He wants you to become HIS disciple.
			if ((MIS_Bosper_Bogen ==  LOG_SUCCESS ) || (MIS_Bosper_WolfFurs ==  LOG_SUCCESS ))
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_10 " );	// I had a brief but intense conversation with him on this matter.
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_11 " );	// In the end, he agreed.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_12 " );	// He asked me to give you the opportunity to at least try your hand at his craft.
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_13 " );	// Try it - you can decide later. Unless, of course, you want his voice.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_14 " );	// Bosper doesn't know who you are yet
		};
		if (Constantino.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_15 " );	// As always, Constantino doesn't care. He said that from his point of view, you can become my student at any moment.
				vote = vote +  1 ;
			}
			else
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_16 " );	// Constantino says you're accused of a crime in the city - is that true?
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_17 " );	// If so, then you need to fix this problem ASAP!
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_18 " );	// Constantino has never heard of you.
		};
		if (Matteo.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_19 " );	// Matteo says you gave him back his gold. I think you are a noble young man.
				vote = vote +  1 ;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_20 " );	// Matteo says you owe him something. I don't know what your business is, but you have to settle this issue.
			}
			else
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_21 " );	// Matteo says he never talked to you about this.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_22 " );	// Matteo says he never saw you in his shop.
		};
		if (vote >=  4 )
		{
			if (vote ==  5 )
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_23 " );	// This means that you have received the approval of all the masters!
			}
			else
			{
				AI_Output(self,other, " DIA_Harad_LEHRLING_12_24 " );	// This means that you have received the approval of the four masters. This is enough to be accepted as a student.
			};
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_25 " );	// Are you ready to become my apprentice?
			Info_ClearChoices(DIA_Harad_LEHRLING);
			Info_AddChoice(DIA_Harad_LEHRLING, " Okay - I'll think about it. " ,DIA_Harad_LEHRLING_Later);
			Info_AddChoice(DIA_Harad_LEHRLING, " Я готов! " ,DIA_Harad_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_26 " );	// You need to get approval from at least four masters. Otherwise, you won't be able to become a disciple in the lower part of the city.
			AI_Output(self,other, " DIA_Harad_LEHRLING_12_27 " );	// That's why you should talk to all the masters who aren't sure about you yet.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_LEHRLING_12_28 " );	// Not before you prove to me you're good for anything.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	var int temp1;
	temp1 = 0 ;
	AI_Output(other,self, " DIA_Harad_LEHRLING_OK_15_00 " );	// I'm ready!
	AI_Output(self,other, " DIA_Harad_LEHRLING_OK_12_01 " );	// Great! I will teach you how to make good swords.

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self, " DIA_Harad_LEHRLING_OK_15_02 " );	// I already know how to do it!
		AI_Output(self,other, " DIA_Harad_LEHRLING_OK_12_03 " );	// Well. All the better!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other, " DIA_Harad_LEHRLING_OK_12_04 " );	// Also, it's time to get a little stronger. You're wasting right before my eyes.
		AI_Output(self,other, " DIA_Harad_LEHRLING_OK_12_04A " );	// Well, since you are now my student, the first lesson is free for you.
		AI_Output(other,self, " DIA_Harad_LEHRLING_OK_15_00A " );	// Yes, that wouldn't hurt me.
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		B_RaiseAttribute_Bonus(other,ATR_STRENGTH,10);
		AI_Output(self,other, " DIA_Harad_LEHRLING_OK_12_04B " );	// Of course! That's better... (laughs) I suppose I've gained some strength.
	};
	AI_Output(self,other, " DIA_Harad_LEHRLING_OK_12_04C " );	// Yes, and one more thing - here, take these clothes. I don't want my student walking around town in rags!
	B_GiveInvItems(self,other,itar_smith_nov,1);
	AI_Output(self,other, " DIA_Harad_LEHRLING_OK_12_04D " );	// And your tool is a blacksmith's hammer. Are you going to forge with a chopper?
	B_GiveInvItems(self,other,ItMw_1H_Mace_L_04,1);
	AI_Output(self,other, " DIA_Harad_LEHRLING_OK_12_04E " );	// Well, some steel blanks. For the first time, this is enough for you.
	Player_IsApprentice = APP_Hard;
	Npc_ExchangeRoutine(Lothar,"START");
	CreateInvItems(VLK_407_Hakon,itmiswordblade_1,2);
	CreateInvItems(hero,ItMiSwordraw,5);
	Harad_StartGuild = other.guild;
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus, " Blacksmith Harad has taken me on as an apprentice. Now I can enter the upper city. " );
	B_LogEntry(Topic_Bonus, " Harad buys forged weapons from me at a good price. " );
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_GivePlayerXP(XP_apprentice);
	B_LogEntry(TOPIC_CityTeacher, " Harad can teach me blacksmithing. He can also help me get stronger. " );
	Info_ClearChoices(DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output(other,self, " DIA_Harad_LEHRLING_Later_15_00 " );	// Okay - I'll think about it.
	if ( ! Npc_IsDead(Brian))
	{
		AI_Output(self,other, " DIA_Harad_LEHRLING_Later_12_01 " );	// As you know. Brian will still work here for a while.
	};
	Info_ClearChoices(DIA_Harad_LEHRLING);
};


instance DIA_Harad_approval (C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Approval_Condition;
	information = DIA_Harad_approval_info;
	permanent = TRUE;
	description = " Can I become another master's apprentice? " ;
};

func int DIA_Harad_Approval_Condition()
{
	if ((Player_IsApprentice ==  APP_NONE ) && Npc_KnowsInfo(other,DIA_Harad_Work) && (DIA_Harad_Setting_Permanent ==  FALSE ))
	{
		return TRUE;
	};
};


var int DIA_Harad_Approval_Permanent;

func void DIA_Harad_Approval_Info()
{
	AI_Output(other,self, " DIA_Harad_Zustimmung_15_00 " );	// Can I become a student of another master?

	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		AI_Output(self,other, " DIA_Harad_Zustimmung_12_01 " );	// You are a good person.

		if(MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Harad_Zustimmung_12_02 " );	// Hakon told me how you dealt with the bandits.
		};

		AI_Output(self,other, " DIA_Harad_Zustimmung_12_03 " );	// I'll give you my approval.

		if (DIA_Harad_Approval_Permanent ==  FALSE )
		{
			B_GivePlayerXP(XP_Consent);
			DIA_Harad_Approval_Permanent = TRUE ;
			B_LogEntry(TOPIC_Lehrling, " Harad will give me his approval if I want to become another master's apprentice. " );
		};

		if ( ! Npc_IsDead(Brian))
		{
			AI_Output(self,other, " DIA_Harad_Zustimmung_12_04 " );	// Brian will be working here for a while. And I am sure that sooner or later there will be a strong guy who can replace him.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_Zustimmung_12_05 " );	// Other masters may agree to this. But I will give my approval only after you prove that you are at least good for something!
	};
};


var int Harad_MILKommenter;
var int Harad_PALKommenter;
var int Harad_INNOSKommentar;
var int Harad_KDWKommentar;
var int Harad_SEKKommentar;
var int Harad_KDMKommentar;

instance DIA_Harad_AlsLehrling(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Harad_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Harad) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Harad_AlsLehrling_Info()
{
	if ((other.guild ==  GIL_MIL ) && (Harad_StartGuild !=  GIL_MIL ) && (Harad_MILComment ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_00 " );	// Do you serve in the militia now? I'm proud of you!
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_01 " );	// As long as you're in the military, naturally I can't expect you to do your apprentice duties as well.
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_02 " );	// But if you need anything, you can come to me whenever you want.
		Harad_MILKommenter = TRUE ;
	}
	else if((other.guild == GIL_PAL) && (Harad_StartGuild != GIL_PAL) && (Harad_PALKommentar == FALSE))
	{
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_03 " );	// You managed to become a paladin!
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_04 " );	// I'm glad I once took you on as a student. Even though you didn't spend much time at the anvil.
		Harad_PALKommenter = TRUE ;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Harad_StartGuild != GIL_NOV) && (Harad_StartGuild != GIL_KDF) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_05 " );	// So you took the vows in the monastery. I'd rather you stay in the city. We need strong people.
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_06 " );	// But if you decide to follow the path of Innos, then so be it.
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_07 " );	// If you need anything from me, I'm always happy to help.
		Harad_INNOSKommenter = TRUE ;
	}
	else if((other.guild == GIL_KDW) && (Harad_KDWKommentar == FALSE))
	{
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_10 " );	// Oh, yes, you are wearing a cassock like on Vatras! Just don't take the hammer in your hands and don't approach the anvil like that, otherwise I'll die laughing.
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_11 " );	// Okay. This is your choice. My student's choice!
		Harad_KDWComment = TRUE ;
	}
	else if((Harad_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_12 " );	// So did you succumb to this swamp dope after all? Yes, strong in body are not always strong in spirit.

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other, " DIA_Harad_AlsLehrling_12_13 " );	// But you're in armor and with a sword. It makes me happy. It somehow continues to connect you with blacksmithing.
		};

		Harad_SEKKommenter = TRUE ;
	}
	else  if ((Harad_KDMComment ==  FALSE ) && ((other.guild ==  GIL_KDM ) || (other.guild ==  GIL_NDM )))
	{
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_14 " );	// As a veteran of the orc war, it pains me to know that you have sided with their master and that the sword you will next forge will be directed against the servants of Innos.
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_15 " );	// However, life is one and you need to live it the way you want. I won't lament in vain.
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_16 " );	// And I won't regret teaching you blacksmithing either. What was, was. What will be, will be.
		Harad_KDMKommentar = TRUE ;
	}
	else  if ((Harad_Lehrling_Day <= (Wld_GetDay() -  4 )) && (Harad_MILKommentar ==  FALSE ) && (Harad_PALKommentar ==  FALSE ) && (Harad_INNOSKommentar ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Harad_AlsLehrling_12_08 " );	// Haven't seen you here in a while. Where have you been all this time, hmm?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Опять ты!
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

instance DIA_Harad_Romantic(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Romantic_Condition;
	information = DIA_Harad_Romantic_Info;
	permanent = FALSE;
	description = " There's something else I wanted to ask... " ;
};

func int DIA_Harad_Romantic_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Romantic_Info()
{
	AI_Output(other,self, " DIA_Harad_Romantic_01_00 " );	// One more thing I wanted to ask...
	AI_Output(self,other,"DIA_Harad_Romantic_01_01");	//Да-да?
	AI_Output(other,self, " DIA_Harad_Romantic_01_02 " );	// You work all day long, work hard.
	AI_Output(self,other,"DIA_Harad_Romantic_01_03");	//Ну-ну...
	AI_Output(other,self, " DIA_Harad_Romantic_01_04 " );	// Is there any romance in the blacksmith profession?
	AI_Output(self,other, " DIA_Harad_Romantic_01_05 " );	// Romance?! (thoughtfully) Heh, well, you took me by surprise. Romance...
	AI_Output(other,self, " DIA_Harad_Romantic_01_06 " );	// So no?
	AI_Output(self,other, " DIA_Harad_Romantic_01_07 " );	// Well, there are no azure shores and buxom mermaids, of course. Eternally red mug from the forge, calluses from the hammer and ringing in the ears - that's all romance.
	AI_Output(self,other, " DIA_Harad_Romantic_01_08 " );	// But blacksmiths are strong guys, and girls love strong ones.
	AI_Output(other,self, " DIA_Harad_Romantic_01_09 " );	// I'm not asking about carnal pleasures, I'm talking about...
	AI_Output(self,other, " DIA_Harad_Romantic_01_10 " );	// There is no other. Everything is concrete, like our craft itself. No snot!
	AI_Output(other,self,"DIA_Harad_Romantic_01_11");	//Ясно.
	AI_Output(self,other, " DIA_Harad_Romantic_01_12 " );	// Oh yes! Blacksmiths still have a motto! Didn't I tell you?
	AI_Output(other,self,"DIA_Harad_Romantic_01_13");	//Нет.
	AI_Output(self,other, " DIA_Harad_Romantic_01_14 " );	// If you don't forge, you won't get a lot of money and honor!
	AI_Output(other,self,"DIA_Harad_Romantic_01_15");	//Забавно.
	AI_Output(self,other, " DIA_Harad_Romantic_01_16 " );	// It seems to reflect hopelessness, but it seems to give hope.
	AI_Output(self,other, " DIA_Harad_Romantic_01_17 " );	// Okay! I need to work.
	AI_Output(other,self, " DIA_Harad_Romantic_01_18 " );	// And it's time for me to go.
	AI_StopProcessInfos(self);
};

instance DIA_Harad_Weapons (C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Waffen_Condition;
	information = DIA_Harad_Weapons_Info;
	permanent = FALSE;
	description = " Do you sell weapons? " ;
};


func int DIA_Harad_Waffen_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
};

func void DIA_Harad_Weapons_Info()
{
	AI_Output(other,self, " DIA_Harad_Waffen_15_00 " );	// Do you sell weapons?
	AI_Output(self,other, " DIA_Harad_Waffen_12_01 " );	// Forget it. Everything I do goes to paladins or militia.
	AI_Output(self,other, " DIA_Harad_Add_12_00 " );	// I have an order for a hundred swords from Lord Hagen! He wants to arm the city guards.
};


instance DIA_Harad_Tasks (C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Hard_Aufgaben_Condition;
	information = DIA_Harad_Tasks_Info;
	permanent = FALSE;
	description = " What should the student do? " ;
};


func int DIA_Harad_Aufbagen_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Tasks_Info()
{
	AI_Output(other,self, " DIA_Harad_Aufgaben_15_00 " );	// What should the student do?
	AI_Output(self,other, " DIA_Harad_Aufgaben_12_01 " );	// Three things! Try to guess...
	AI_Output(other,self, " DIA_Harad_Aufgaben_15_02 " );	// Forge, forge and forge?
	AI_Output(self,other, " DIA_Harad_Aufgaben_12_03 " );	// You're not as stupid as you seem. I pay for every sword! If you don't work, you don't get paid. It's simple.
	AI_Output(self,other, " DIA_Harad_Aufgaben_12_05 " );	// In addition, I will teach you everything you need to know to make ordinary swords.
	AI_Output(self,other, " DIA_Harad_Aufgaben_12_06 " );	// Making magic swords is a job for an experienced blacksmith. You still have a long way to go.
	AI_Output(self,other, " DIA_Harad_Aufgaben_12_07 " );	// If you need a place to sleep, you can lie down somewhere in my house. All clear?
};

var int HaradBuyMiscWeap;

instance DIA_Harad_MiscWeap(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_MiscWeap_Condition;
	information = DIA_Harad_MiscWeap_Info;
	permanent = FALSE;
	description = " Aside from self-forged weapons, what else are you interested in? " ;
};

func int DIA_Harad_MiscWeap_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Harad_Tasks))
	{
		return TRUE;
	};
};

func void DIA_Harad_MiscWeap_Info()
{
	AI_Output(other,self, " DIA_Harad_MiscWeap_01_00 " );	// What else besides self-forged weapons are you interested in?
	AI_Output(self,other, " DIA_Harad_MiscWeap_01_01 " );	// If you have old rusty blades, bring them to me.
	AI_Output(other,self, " DIA_Harad_MiscWeap_01_02 " );	// Why do you need them?
	AI_Output(self,other, " DIA_Harad_MiscWeap_01_03 " );	// It is unlikely that anyone will buy this weapon. However, it can be smelted.
	AI_Output(self,other, " DIA_Harad_MiscWeap_01_04 " );	// After all, steel is always valuable. Especially given the current state of affairs.
	B_LogEntry(TOPIC_CityTrader, " Harad buys rusty weapons. " );
	HaradBuyMiscWeap = TRUE;
};


instance DIA_Harad_HaradBuyMiscWeap(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_HaradBuyMiscWeap_Condition;
	information = DIA_Harad_HaradBuyMiscWeap_Info;
	permanent = TRUE;
	description = " I brought you a rusty weapon. " ;
};

func int DIA_Harad_HaradBuyMiscWeap_Condition()
{
	if((HaradBuyMiscWeap == TRUE) && ((Npc_HasItems(other,ItMw_1h_MISC_Sword) >= 1) || (Npc_HasItems(other,ITMW_1H_MISC_GSWORD) >= 1) || (Npc_HasItems(other,ItMw_1h_Misc_Axe) >= 1) || (Npc_HasItems(other,ItMw_2H_Sword_M_01) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Harad_HaradBuyMiscWeap_Info()
{
	var C_Item EquipWeap;
	var int misc_01;
	var int misc_02;
	var int misc_03;
	var int misc_04;
	var int misc_all;
	var int price_all;

	price_all = 2;
	
	AI_Output(other,self, " DIA_Harad_HaradBuyMiscWeap_01_00 " );	// I brought you a rusty weapon.
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_01");	//Хорошо!
	AI_Output(self,other, " DIA_Harad_HaradBuyMiscWeap_01_02 " );	// Considering it costs next to nothing, I'll give you exactly two gold pieces for each blade.
	AI_Output(self,other, " DIA_Harad_HaradBuyMiscWeap_01_03 " );	// Let's see what you got here...

	misc_01 = Npc_HasItems(other,ItMw_1h_MISC_Sword);
	misc_02 = Npc_HasItems(other,ITMW_1H_MISC_GSWORD);
	misc_03 = Npc_HasItems(other,ItMw_1h_Misc_Axe);
	misc_04 = Npc_HasItems(other,ItMw_2H_Sword_M_01);
	misc_all = misc_01 + misc_02 + misc_03 + misc_04;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMw_1h_MISC_Sword,Npc_HasItems(hero,ItMw_1h_MISC_Sword));
	Npc_RemoveInvItems(hero,ITMW_1H_MISC_GSWORD,Npc_HasItems(hero,ITMW_1H_MISC_GSWORD));
	Npc_RemoveInvItems(hero,ItMw_1h_Misc_Axe,Npc_HasItems(hero,ItMw_1h_Misc_Axe));
	Npc_RemoveInvItems(hero,ItMw_2H_Sword_M_01,Npc_HasItems(hero,ItMw_2H_Sword_M_01));

	AI_PlayAni(self,"T_YES");
	AI_Output(self,other, " DIA_Harad_HaradBuyMiscWeap_01_04 " );	// Well, not bad.
	AI_Output(self,other, " DIA_Harad_HaradBuyMiscWeap_01_05 " );	// Then I'll take it all for myself! And you - keep your gold.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all * price_all);
	AI_Output(self,other, " DIA_Harad_HaradBuyMiscWeap_01_06 " );	// If there's anything else, bring it to me.
};

instance DIA_Harad_SellBlades(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_SellBlades_Condition;
	information = DIA_Harad_SellBlades_Info;
	permanent = TRUE;
	description = " I want to sell the weapons I forged! " ;
};

func int DIA_Harad_SellBlades_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_SellBlades_Info()
{
	var C_Item EquipWeap;
	var int number_common;
	var int count_sword1;
	var int count_swords4;
	var int number_ruby_blades;
	var int number_elbastardo;
	var int total;
	var string concatText;
	var int lohn;
	var int del_common;
	var int del_sword1;
	var int del_sword4;
	var int del_rubinklinge;
	var int del_elbastardo;

	AI_Output(other,self, " DIA_Harad_SellBlades_15_00 " );	// I want to sell the weapons I forged!
	EquipWeap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,ItMw_1H_Common_01);

	if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE)
	{
		if (number_common >  1 )
		{
			Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		};
		number_common -=  1 ;
	};

	number_sword1 = Npc_HasItems(other,ItMw_Sword1);

	if (Hlp_IsItem(EquipWeap,ItMw_Schwert1) ==  TRUE )
	{
		if (number_sword1 >  1 )
		{
			Npc_RemoveInvItems(other,ItMw_Sword1,number_sword1);
		};
		number_swords1 = number_swords1 -  1 ;
	};

	number_sword4 = Npc_HasItems(other,ItMw_Sword4);

	if (Hlp_IsItem(EquipWeap,ItMw_Schwert4) ==  TRUE )
	{
		if (number_swords4 >  1 )
		{
			Npc_RemoveInvItems(other,ItMw_Sword4,number_sword4);
		};
		number_swords4 = number_swords4 -  1 ;
	};

	number_ruby_blades = Npc_HasItems(other,ItMw_Ruby_Blade);

	if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE)
	{
		if (number_rubyblades >  1 )
		{
			Npc_RemoveInvItems(other,ItMw_ruby_blade,number_ruby_blades);
		};
		number_ruby_blades = number_ruby_blades -  1 ;
	};

	number_elbastardo = Npc_HasItems(other,ItMw_ElBastardo);

	if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE)
	{
		if (number_elbastardo >  1 )
		{
			Npc_RemoveInvItems(other,ItMw_ElBastardo,number_elbastardo);
		};
		number_elbastardo = number_elbastardo -  1 ;
	};

	total = number_common + number_sword1 + number_sword4 + number_ruby_blades + number_elbastardo;

	if (total ==  0 )
	{
		if((Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE))
		{
			AI_Output(self,other, " DIA_Harad_SellBlades_12_01 " );	// You only own what you have on your belt. Look after him better.
		}
		else
		{
			AI_Output(self,other, " DIA_Harad_SellBlades_12_04 " );	// So do it! I only accept plain swords.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_SellBlades_12_02 " );	// Okay - come here.
		if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		};
		if (Hlp_IsItem(EquipWeap,ItMw_Schwert1) !=  TRUE )
		{
			Npc_RemoveInvItems(other,ItMw_Sword1,number_sword1);
		};
		if (Hlp_IsItem(EquipWeap,ItMw_Schwert4) !=  TRUE )
		{
			Npc_RemoveInvItems(other,ItMw_Sword4,number_sword4);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_ruby_blade,number_ruby_blades);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_ElBastardo,number_elbastardo);
		};
		concatText = b_formgivestring(other,gesamt);
		AI_Print(concatText);
		AI_Output(self,other, " DIA_Harad_SellBlades_12_03 " );	// Great! Keep what you've earned.
		reward = (number_common *  45 ) + (number_sword1 *  60 ) + (number_sword4 *  75 ) + (number_rubyblades *  90 ) + (number_elbastardo *  135 );
		B_GiveInvItems(self,other,ItMi_Gold,lohn);
	};
};

func void B_Harad_TeachSmith()
{
	AI_Output(self,other, " DIA_Harad_TeachCommon_12_01 " );	// It's pretty easy, man! You take a piece of raw steel and hold it over the fire until it is hot.
	AI_Output(self,other, " DIA_Harad_TeachCommon_12_02 " );	// Then you shape the blade on the anvil.
};

func void B_HaradSmithChoices()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
	Info_AddChoice(DIA_Harad_TeachSmith,Dialog_Back,DIA_Harad_TeachSmith_BACK);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_04)),DIA_Harad_TeachSmith_Harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_03)),DIA_Harad_TeachSmith_Harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_02)),DIA_Harad_TeachSmith_Harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_01)),DIA_Harad_TeachSmith_Harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Harad_TeachSmith_Common);
	};
};


instance DIA_Harad_TeachSmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 50;
	condition = DIA_Harad_TeachSmith_Condition;
	information = DIA_Harad_TeachSmith_Info;
	permanent = TRUE;
	description = " Teach me how to forge good swords. " ;
};

func int DIA_Harad_TeachSmith_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_TeachSmith_Info()
{
	if (Wld_IsTime( 7 , 0 , 22 , 0 ))
	{
		AI_Output(other,self, " DIA_Harad_TeachCommon_15_00 " );	// Teach me how to forge good swords.
		B_HaradSmithChoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_ArmorTeach_01_02 " );	// I've already finished working at the forge for today...
		AI_Output(self,other, " DIA_Bennet_ArmorTeach_01_03 " );	// Come tomorrow morning, then we'll talk about it.
	};
};

func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
};

func void DIA_Harad_TeachSmith_Common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		B_Hard_TeachSmith();
		AI_Output(self,other, " DIA_Harad_TeachCommon_12_03 " );	// Your first swords won't be art, but the rest can be learned later.
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad01()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_01))
	{
		B_Hard_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad02()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_02))
	{
		B_Hard_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad03()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_03))
	{
		B_Hard_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad04()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_04))
	{
		B_Hard_TeachSmith();
	};
	B_HaradSmithChoices();
};


var int Harad_Merke_STR;

instance DIA_Harad_TeachSTR(C_Info)
{
	npc = VLK_412_Harad;
	nr = 100;
	condition = DIA_Harad_TeachSTR_Condition;
	information = DIA_Harad_TeachSTR_Info;
	permanent = 1;
	description = " I want to get stronger! " ;
};


func int DIA_Harad_TeachSTR_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_TeachSTR_Info()
{
	AI_Output(other,self, " DIA_Harad_TeachSTR_15_00 " );	// I want to get stronger!
	Harad_Merke_STR = other.attribute[ ATR_STRENGTH ];
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if(Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other, " DIA_Harad_TeachSTR_BACK_12_01 " );	// You've already put on some muscle.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other, " DIA_Harad_TeachSTR_BACK_12_02 " );	// Come back if you want to learn more.
	};
	Info_ClearChoices(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};


instance DIA_Harad_ImmerNoch (C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_ImmerNoch_Condition;
	information = DIA_Harad_ImmerNoch_Info;
	permanent = FALSE;
	description = " Are you still working for paladins? " ;
};


func int DIA_Harad_ImmerNoch_Condition()
{
	if (Chapter >=  2 )
	{
		return TRUE;
	};
};

func void DIA_Harad_ImmerNoch_Info()
{
	AI_Output(other,self, " DIA_Harad_Add_15_01 " );	// Do you still work for paladins?
	AI_Output(self,other, " DIA_Harad_Add_12_02 " );	// I've completed Lord Hagen's order.
	AI_Output(self,other, " DIA_Harad_Add_12_03 " );	// Now I'm making a share of his swords from magic ore - but this time for a fee.
	AI_Output(self,other, " DIA_Harad_Add_12_04 " );	// But now I also have time to make weapons for the merchants in the marketplace.
	AI_Output(self,other, " DIA_Harad_Add_12_05 " );	// So if you're looking for a good sword, go to them.
};


instance DIA_Harad_AboutErzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_AboutErzklingen_Condition;
	information = DIA_Harad_AboutErzklingen_Info;
	permanent = FALSE;
	description = " Tell me about magic ore swords! " ;
};


func int DIA_Harad_AboutErzklingen_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Harad_ImmerNoch ))
	{
		return TRUE;
	};
};

func void DIA_Harad_AboutErzklingen_Info()
{
	AI_Output(other, self, " DIA_Harad_Add_15_06 " );	// Tell me about magic ore swords!
	AI_Output(self,other, " DIA_Harad_Waffen_12_02 " );	// Creating a magic sword is a very complex and expensive process, but the result is a very handy and almost blunt sword.
	AI_Output(self,other, " DIA_Harad_Waffen_12_03 " );	// This is a very good sword, but all its virtues are revealed only in the hands of a paladin.
	AI_Output(self,other, " DIA_Harad_Waffen_12_04 " );	// The paladin's sword is consecrated by Innos himself. As a result, it becomes an enchanted weapon that deals massive damage to the enemy!
};

var int OreBladeBoughtOut;

instance DIA_Harad_Erzklingen (C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Erzklingen_Condition;
	information = DIA_Harad_Erzklingen_Info;
	permanent = TRUE;
	description = " I want to buy a magic ore sword. " ;
};

func int DIA_Harad_Erzklingen_Condition()
{
	if ((OreBladeBought ==  FALSE ) && (OreBladeBoughtOut ==  FALSE ) && Npc_KnowsInfo(other,DIA_Harad_AboutExplosion))
	{
		return TRUE;
	};
};

var int OreBladeBought;

func void DIA_Harad_Erzklingen_Info()
{
	AI_Output(other,self, " DIA_Harad_Erzklingen_15_00 " );	// I want to buy a magic ore sword.

	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other, " DIA_Harad_Erzklingen_12_01 " );	// I only serve magical swords to paladins! And only one per hand.

		if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_NONE))
		{
			OreBladeBoughtOut = TRUE;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_Erzklingen_12_02 " );	// You paladins may consider yourself lucky to be allowed to wield such excellent swords.
		AI_Output(self,other, " DIA_Harad_Erzklingen_12_03 " );	// According to Lord Hagen's decree, I can only sell you one magical weapon.
		AI_Output(self,other, " DIA_Harad_Erzklingen_12_04 " );	// So what can I offer you?
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen, " Two-Handed Ore Sword (Price: 2000 coins) " ,DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen, " One-Handed Ore Sword (Price: 2000 coins) " ,DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void B_Harad_NotEnoughGold()
{
	AI_Output(self,other, " B_Harad_NotEnoughGold_12_00 " );	// You don't have enough gold.
};

func void B_Harad_HaveFunWithYourSword()
{
	AI_Output(self,other, " B_Harad_HaveGunWithYourSword_12_00 " );	// Take care of your new weapon! It costs a fortune.
	OreBladeBought = TRUE;
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void DIA_Harad_Erzklingen_2h()
{
	AI_Output(other,self, " DIA_Harad_Erzklingen_2h_15_00 " );	// I'll take the two-handed sword!

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		CreateInvItems(self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_2H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen, " Two-Handed Ore Sword (Price: 2000 coins) " ,DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen, " One-Handed Ore Sword (Price: 2000 coins) " ,DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_1h()
{
	AI_Output(other,self, " DIA_Harad_Erzklingen_1h_15_00 " );	// I'll take a one-handed sword!

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		CreateInvItems(self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen, " Two-Handed Ore Sword (Price: 2000 coins) " ,DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen, " One-Handed Ore Sword (Price: 2000 coins) " ,DIA_Harad_Erzklingen_1h);
	};
};


instance DIA_Harad_RepairNecklace(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_RepairNecklace_Condition;
	information = DIA_Harad_RepairNecklace_Info;
	permanent = FALSE;
	description = " Can you repair jewelry? " ;
};


func int DIA_Harad_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_RepairNecklace_Info()
{
	AI_Output(other,self, " DIA_Harad_RepairNecklace_15_00 " );	// Can you fix jewels?
	AI_Output(self,other, " DIA_Harad_RepairNecklace_12_01 " );	// I'm a gunsmith, not a jeweler. Perhaps you will not find anyone here in the city who could help you.
	AI_Output(self,other, " DIA_Harad_RepairNecklace_12_02 " );	// Now few people have money, and no one has been able to get rich here for a long time.
	AI_Output(self,other, " DIA_Harad_RepairNecklace_12_03 " );	// Most are glad at least that they have enough for bread.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Harad_Goldsmith (C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_Goldsmith_Condition;
	information = DIA_Harad_Goldsmith_Info;
	permanent = FALSE;
	description = " Where can I find a jeweler? " ;
};


func int DIA_Harad_Goldsmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Harad_Goldsmith_Info()
{
	AI_Output(other,self, " DIA_Harad_Goldsmith_15_00 " );	// Where can I find a jeweler?
	AI_Output(self,other, " DIA_Harad_Goldsmith_12_01 " );	// I heard that the mercenaries at Onar's farm have a good blacksmith.
	AI_Output(self,other, " DIA_Harad_Goldsmith_12_02 " );	// Maybe you should ask around there.
};


instance DIA_Harad_PICKPOCKET(C_Info)
{
	npc = VLK_412_Harad;
	nr = 900;
	condition = DIA_Harad_PICKPOCKET_Condition;
	information = DIA_Harad_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Harad_PICKPOCKET_Condition()
{
	return  C_Robbery ( 14 , 35 );
};

func void DIA_Harad_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
	Info_AddChoice(DIA_Harad_PICKPOCKET,Dialog_Back,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Harad_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};


instance DIA_HARAD_ARMORCANTEACH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_armorcanteach_condition;
	information = dia_harad_armorcanteach_info;
	permanent = TRUE;
	description = " Are you good at forging armor? " ;
};


func int dia_harad_armorcanteach_condition()
{
	if((HARAD_TEACHARMOR == FALSE) && (other.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_harad_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Harad_ArmorCanTeach_01_00 " );	// Do you know how to forge armor?
	AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_01 " );	// I'm not that good at this, baby - I'm doing it! True, only for paladins and only by order of Lord Hagen.
	AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_03A " );	// But I didn't get any orders about you from him. Are you even listening to me?!
	AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_04 " );	// But since you still belong to their order - I could show you how you can improve your paladin armor using magic ore.
	AI_Output(other,self, " DIA_Harad_ArmorCanTeach_01_05 " );	// Magic ore?
	AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_06 " );	// Yes, man. With its help, the paladin's armor acquires truly colossal strength and reliability, incomparable with any other armor!
	AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_07 " );	// The paladin's ore armor is the best thing I've ever seen in my life!
	AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_08 " );	// But in order to make such armor, you must first be able to forge. And not just to forge, but to forge well!
	AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_09 " );	// Since the technology for manufacturing such armor is quite complicated and beyond the reach of a simple amateur.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Harad_ArmorCanTeach_01_10 " );	// I'm good at forging!
		AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_11 " );	// I didn't doubt it. And I think you'll probably be fine with that.
		AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_12 " );	// However, I must warn you right away that the creation of such armor is very, very expensive and not everyone can afford.
		AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_14 " );	// When you're ready, just tell me and we'll start your training.
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_15 " );	// And apparently, you are an amateur!
		AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_16 " );	// So learn how to forge well first. Learn, and I will reveal to you the secret of creating armor that only the elite are worthy of.
		AI_Output(self,other, " DIA_Harad_ArmorCanTeach_01_17 " );	// However, I must warn you right away that the creation of such armor is very, very expensive and not everyone can afford it!
	};

	HARAD_TEACHAMOR = TRUE ;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ARMORTEACHER , " Harad can teach me how to upgrade paladin armor. " );
};

func void b_harad_teacharmor_1()
{
	AI_Output(self,other, " DIA_Harad_TeachArmor_1_01_01 " );	// Okay, look and listen very carefully. You miss something, some little thing, and that's it - you have to start all over again ...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Harad_TeachArmor_1_01_02 " );	// ...So. First, make sure you have all the materials at hand...
		AI_Output(self,other, " DIA_Harad_TeachArmor_1_01_03 " );	// ...you take a piece of magical ore, a red-hot steel billet, and work these two metals on an anvil until a homogeneous substance is obtained...
		AI_Output(self,other, " DIA_Harad_TeachArmor_1_01_04 " );	// ...then you add the necessary ingredients to the resulting alloy - one by one in the required proportions and sequence. The main thing is not to confuse the latter ...
		AI_Output(self,other, " DIA_Harad_TeachArmor_1_01_05 " );	// ...After that, the alloy must be shaped into a plate and the resulting element must be forged with the base of the armor using steel rivets.
		AI_Output(self,other, " DIA_Harad_TeachArmor_1_01_06 " );	// ...Like this... see what I can do? (shows) The plate sits firmly on the carrier of the armor, practically merging with it.
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Harad_TeachArmor_1_01_07 " );	// ...That's it. Now you can try it yourself.
		HARADTELLSMARDUK_P1 = TRUE;
	};
};

func void b_harad_teacharmor_2()
{
	AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_01 " );	// By truly mastering this knowledge, you will be able to make the finest armor that human hands can create. Listen carefully and remember...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_02 " );	// ...you take a hot steel billet and break it into several component parts. In this case, you must try to ensure that the parts are almost the same.
		AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_03 " );	// ...then you take a piece of magic ore and process each part of the steel until a homogeneous alloy is obtained, while mixing the required components into it in a certain sequence...
		AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_04 " );	// ...then you carefully forge one part into the frame of the existing armor, carefully forging the places of convergence...
		AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_05 " );	// ...and the second, initially giving it the shape of a plate, you forge with the first part using steel rivets...
		AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_06 " );	// ...Like this... see what I get? (shows) This will increase the strength of the hull several times!
		AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_07 " );	// ...a little more effort and...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_08 " );	// ...done! That's the whole secret. You now know enough to forge this heavy paladin ore armor.
		AI_Output(self,other, " DIA_Harad_TeachArmor_2_01_09 " );	// I have nothing more to teach you. I hope the knowledge you have gained will help you in your accomplishments.
		HARADTELLSMARDUK_P2 = TRUE;
	};
};

func void b_haradarmorchoices()
{
	Info_ClearChoices(dia_harad_armorteach);
	Info_AddChoice(dia_harad_armorteach,Dialog_Back,dia_harad_armorteach_back);

	if(PLAYER_TALENT_SMITH[15] == FALSE)
	{
		Info_AddChoice(dia_harad_armorteach,B_BuildLearnStringEx( " Доспехи паладина (Цена: 3500 монет " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_PAL_M_V1 )),dia_harad_armorteach_itar_pal_m_v1);
	};
	if((PLAYER_TALENT_SMITH[16] == FALSE) && (SHOW_ITAR_PAL_H == TRUE))
	{
		Info_AddChoice(dia_harad_armorteach,B_BuildLearnStringEx( " Paladin heavy armor (Cost: 5000 coins " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_PAL_H_V1 )),dia_harad_armorteach_itar_pal_h_v1);
	};
};


instance DIA_HARAD_ARMORTEACH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_armorteach_condition;
	information = dia_harad_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};


func int dia_harad_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (HARAD_TEACHARMOR == TRUE) && (other.guild == GIL_PAL))
	{
		if((PLAYER_TALENT_SMITH[16] == FALSE) || (PLAYER_TALENT_SMITH[15] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_armorteach_info()
{
	AI_Output(other,self, " DIA_Harad_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.

	if (Wld_IsTime( 7 , 0 , 22 , 0 ))
	{
		AI_Output(self,other, " DIA_Harad_ArmorTeach_01_01 " );	// Well, let's get started then...
		b_haradarmorchoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_ArmorTeach_01_02 " );	// But now it's night already! Or are you thinking of forging by touch? (laughs)
		AI_Output(self,other, " DIA_Harad_ArmorTeach_01_03 " );	// Come in the morning, then we'll start your training.
	};
};

func void dia_harad_armorteach_back()
{
	Info_ClearChoices(dia_harad_armorteach);
};

func void dia_harad_armorteach_itar_pal_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_PAL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3500);
			b_harad_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_TeachArmor_01_00 " );	// But you don't have enough gold! And how were you going to pay?
	};
	b_haradarmorchoices();
};

func void dia_harad_armorteach_itar_pal_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_PAL_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_harad_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Harad_TeachArmor_01_00 " );	// But you don't have enough gold! And how were you going to pay?
	};
	b_haradarmorchoices();
};


instances DIA_HARAD_TELLSMARDUK (C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_tellsmarduk_condition;
	information = dia_harad_tellsmarduk_info;
	permanent = FALSE;
	description = " Is it possible to further improve the paladin's ore armor? " ;
};


func int dia_harad_tellsmarduk_condition()
{
	if((HARADTELLSMARDUK_P1 == TRUE) || (HARADTELLSMARDUK_P2 == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_tellsmarduk_info()
{
	AI_Output(other,self, " DIA_Harad_TellsMarduk_01_00 " );	// Is it possible to improve the paladin's ore armor?
	AI_Output(self,other, " DIA_Harad_TellsMarduk_01_01 " );	// I definitely can't do that! And as far as I know, no one can...
	AI_Output(self,other, " DIA_Harad_TellsMarduk_01_02 " );	// But I heard that in the monastery, the Firebenders have the knowledge that can give this armor an almost divine essence.
	AI_Output(self,other, " DIA_Harad_TellsMarduk_01_03 " );	// True, these are just rumors - but who knows, who knows...
	Log_CreateTopic(TOPIC_MAGICINNOSARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MAGICINNOSARMOR,LOG_Running);
	B_LogEntry( TOPIC_MAGICINNOSARMOR , " Harad told me that Firebenders have the knowledge to give paladin ore armor a divine essence. Although he noted that it was just a rumor. " );
};


instance DIA_HARAD_SARAHELPSTHREE (C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = dia_harad_sarahelpsthree_condition;
	information = dia_harad_sarahelpsthree_info;
	permanent = TRUE;
	description = " I want to pay off Sarah's debt. " ;
};


func int dia_harad_sarahelpsthree_condition()
{
	if (( MIS_SARAHELPSTHREE  == LOG_Running ) && ( SARADOBTPAYED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_harad_sarahelpsthree_info()
{
	AI_Output(other,self, " DIA_Harad_SaraHelpsThree_01_00 " );	// I want to pay off Sarah's debt.
	if(HAKONTOSARADOBT == FALSE)
	{
		AI_Output(self,other, " DIA_Harad_SaraHelpsThree_01_01 " );	// WHAT?! You? (surprised) Sarah's debt?
		AI_Output(other,self, " DIA_Harad_SaraHelpsThree_01_02 " );	// After all, she owes you money for the last batch of weapons. Or have you already forgotten about it?
		AI_Output(self,other, " DIA_Harad_SaraHelpsThree_01_03 " );	// (angrily) I didn't forget anything! It just comes as a surprise to me that it was you who decided to pay this debt for her.
		HAKONTOSARADOBT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_06");	//Хорошо!
	};
	AI_Output(self,other, " DIA_Harad_SaraHelpsThree_01_07 " );	// As far as I remember, she owes me two thousand gold coins.
	AI_Output(self,other, " DIA_Harad_SaraHelpsThree_01_08 " );	// Do you have them?
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GivePlayerXP(300);
		Npc_RemoveInvItems(other,ItMi_Gold,2000);
		AI_Output(other,self, " DIA_Harad_SaraHelpsThree_01_09 " );	// Here, take this.
		AI_Output(self,other, " DIA_Harad_SaraHelpsThree_01_10 " );	// Incredible! Thank you man for helping me redeem my debt.
		AI_Output(self,other, " DIA_Harad_SaraHelpsThree_01_16 " );	// Here, take this sword from me as a thank you - it's one of the best I have.
		B_GiveInvItems(self,other,ItMw_Schwert4, 1 );
		SARADOBTPAYED = TRUE;
		B_LogEntry( TOPIC_SARAHELPSTHREE , " I paid Harad Sarah's debt. " );
	}
	else
	{
		AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_22");	//Нет.
		AI_Output(self,other, " DIA_Harad_SaraHelpsThree_01_23 " );	// Good. Then come back later when you have them... (laughs) Joker.
	};
};


instance DIA_HARAD_ABOUTSWBL(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = dia_harad_aboutswbl_condition;
	information = dia_harad_aboutswbl_info;
	permanent = FALSE;
	description = " Where do you get steel billets? " ;
};

func int dia_harad_aboutswbl_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (ABOUTSWBL == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_aboutswbl_info()
{
	AI_Output(other,self, " DIA_Harad_aboutswbl_01_00 " );	// Where do you get steel blanks?
	AI_Output(self,other, " DIA_Harad_aboutswbl_01_01 " );	// Now it's hard to find them. In the Valley of Mines, it is getting harder and harder to mine ore and smelt blanks.
	AI_Output(self,other, " DIA_Harad_aboutswbl_01_02 " );	// You can look for them from merchants, or you can smelt them yourself from ore.
	AI_Output(self,other, " DIA_Harad_aboutswbl_01_03 " );	// True, you will have to mine the ore first, and then find someone who understands smelting.
	AI_Output(self,other, " DIA_Harad_aboutswbl_01_04 " );	// You can try to look for teachers among the former prisoners from the valley - there are a lot of them in Khorinis now, after the fall of the Barrier.
	ABOUTSWBL = TRUE;
	Log_CreateTopic(TOPIC_STEELDRAW,LOG_NOTE);
	Log_SetTopicStatus(TOPIC_STEELDRAW,LOG_Running);
	B_LogEntry( TOPIC_STEELDRAW , " Harad told me that you can find steel ingots from merchants or try to smelt it yourself. However, I will have to mine the ore first and find someone among the former prisoners who will teach me how to smelt it. And I already forgot how to mine the ore. " );
};

instance DIA_Harad_PrioratBlade(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_PrioratBlade_condition;
	information = DIA_Harad_PrioratBlade_info;
	permanent = FALSE;
	description = " You're an experienced blacksmith, aren't you? " ;
};

func int DIA_Harad_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Harad_PrioratBlade_01_01 " );	// You're an experienced blacksmith, aren't you?
	AI_Output(self,other, " DIA_Harad_PrioratBlade_01_02 " );	// (seriously) Well, it depends on which side you look at.
	AI_Output(other,self, " DIA_Harad_PrioratBlade_01_03 " );	// Then take a look at this blade. I believe you may be familiar with this weapon.
	AI_Output(self,other, " DIA_Harad_PrioratBlade_01_04 " );	// Okay, let's see.
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_05");	//Вот оно.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other, " DIA_Harad_PrioratBlade_01_06 " );	// (seriously) Well, here I can tell you one thing - this weapon is definitely not made in Khorinis!
	AI_Output(self,other, " DIA_Harad_PrioratBlade_01_07 " );	// And it was forged not by a simple blacksmith, but by a real master gunsmith.
	AI_Output(self,other, " DIA_Harad_PrioratBlade_01_08 " );	// And, as far as I know, there were no such masters on the island!
	AI_Output(self,other, " DIA_Harad_PrioratBlade_01_09 " );	// I can't say more.
	AI_Output(other,self, " DIA_Harad_PrioratBlade_01_10 " );	// Okay. It's enough what you said.
	B_LogEntry(TOPIC_PrioratStart, " Harad could only say that this blade was forged by a very experienced weaponsmith. But he does not know such on the island. " );
};

instance DIA_Harad_DoCrossBow(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_DoCrossBow_condition;
	information = DIA_Harad_DoCrossBow_info;
	permanent = FALSE;
	description = " Can you make crossbows? " ;
};

func int DIA_Harad_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Harad_DoCrossBow_01_01 " );	// Can you make crossbows?
	AI_Output(self,other, " DIA_Harad_DoCrossBow_01_02 " );	// (surprised) Crossbows? You've come to the wrong place, buddy.
	AI_Output(self,other, " DIA_Harad_DoCrossBow_01_03 " );	// You need a good carpenter or joiner!
	AI_Output(self,other, " DIA_Harad_DoCrossBow_01_04 " );	// Only he, perhaps, can help you in this matter.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap, " Only a carpenter or joiner can teach me how to make crossbows. And where can I find one? " );
};

instance DIA_Harad_HauntedLH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_HauntedLH_condition;
	information = DIA_Harad_HauntedLH_info;
	permanent = FALSE;
	description = " Does the name Stefan mean anything to you? " ;
};

func int DIA_Harad_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE) && (KnowStefan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_HauntedLH_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Harad_HauntedLH_01_01 " );	// Does the name Stefan mean anything to you?
	AI_Output(self,other, " DIA_Harad_HauntedLH_01_02 " );	// I don't know a person with that name.
	B_LogEntry(TOPIC_HauntedLighthouse, " Blacksmith Harad has no idea who Stefan is. " );
};
