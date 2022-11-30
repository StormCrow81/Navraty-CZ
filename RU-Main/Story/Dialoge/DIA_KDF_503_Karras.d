
instance DIA_Karras_KAP1_EXIT (C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP1_EXIT_Condition()
{
	if (chapter <=  1 )
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_Hello(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = DIA_Karras_Hello_Condition;
	information = DIA_Karras_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Karras_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_NovizenChase != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Karras_Hello_Info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other, " DIA_Karras_Hello_10_00 " );	// What can I do for you, acolyte?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Karras_Hello_10_01 " );	// What can I do for you brother?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Karras_Hello_10_02 " );	// The noble warriors of Innos rarely stop here.
		AI_Output(self,other, " DIA_Karras_Hello_10_03 " );	// What can I do for you?
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_Hello_10_04 " );	// (in disbelief) What are you doing here?
	};
};


instance DIA_Karras_Mission(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Mission_Condition;
	information = DIA_Karras_Mission_Info;
	permanent = FALSE;
	description = " I came to read the scriptures. " ;
};


func int DIA_Karras_Mission_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Karras_Mission_Info()
{
	AI_Output(other,self, " DIA_Karras_Mission_15_00 " );	// I came to read the scriptures.
	AI_Output(self,other, " DIA_Karras_Mission_10_01 " );	// I understand. If you can find time to study the scriptures, please contact me.
	AI_Output(self,other, " DIA_Karras_Mission_10_02 " );	// There is one issue where I could use the help of a sensible acolyte.
};


instance DIA_Karras_Task (C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Task_Condition;
	information = DIA_Karras_Task_Info;
	permanent = FALSE;
	description = " Do you have an errand for me? " ;
};


func int DIA_Karras_Task_Condition()
{
	return TRUE;
};

func void DIA_Karras_Task_Info()
{
	AI_Output(other,self, " DIA_Karras_Aufgabe_15_00 " );	// Do you have an errand for me?
	AI_Output(self,other, " DIA_Karras_Aufgabe_10_01 " );	// Yes. This concerns the insane Ignaz. He lives in Khorinis and experiments with various potions and healing tinctures. But he also does magic spells.
	AI_Output(self,other, " DIA_Karras_Aufgabe_10_02 " );	// And this worries me a lot. I ask myself the question - is this magic pleasing to Innos?
	AI_Output(self,other, " DIA_Karras_Aufgabe_10_03 " );	// To test this, I'd like to get some of his scrolls.
	AI_Output(self,other, " DIA_Karras_Aufgabe_10_04 " );	// I want you to go to the city and buy three scrolls from him for me.
	B_GiveInvItems(self,other,ItMi_Gold,600);
	AI_Output(self,other, " DIA_Karras_Aufgabe_10_05 " );	// But not a word to anyone - understand?
	AI_Output(other,self, " DIA_Karras_Aufgabe_15_06 " );	// Of course.
	MIS_KarrasVergessen = LOG_Running;
	Log_CreateTopic(Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus(Topic_KarrasCharm,LOG_Running);
	B_LogEntry(Topic_KarrasCharm, " Master Karras has sent me to town. He wants me to bring him three spell scrolls that Ignaz makes and sells. " );
};


instance DIA_Karras_Success(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Success_Condition;
	information = DIA_Karras_Success_Info;
	permanent = FALSE;
	description = " Here are the scrolls you wanted to get. " ;
};


func int DIA_Karras_Success_Condition()
{
	if((MIS_KarrasVergessen == LOG_Running) && (Npc_HasItems(other,ItSc_Charm) >= 3))
	{
		return TRUE;
	};
};

func void DIA_Karras_Success_Info()
{
	AI_Output(other,self, " DIA_Karras_Success_15_00 " );	// Here are the scrolls you wanted.
	AI_Output(self,other, " DIA_Karras_Success_10_01 " );	// Excellent, my young friend.
	AI_Output(self,other, " DIA_Karras_Success_10_02 " );	// Now you can fully devote yourself to learning in the library.
	AI_Output(self,other, " DIA_Karras_Success_10_03 " );	// And take this scroll as your reward.
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP(XP_KarrasCharm);
	B_GiveInvItems(other,self,ItSc_Charm,3);
	B_GiveInvItems(self,other,ItSc_SumWolf,1);
};


instance DIA_Karras_JOB(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_JOB_Condition;
	information = DIA_Karras_JOB_Info;
	permanent = FALSE;
	description = " What exactly do you do? " ;
};


func int DIA_Karras_JOB_Condition()
{
	return TRUE;
};

func void DIA_Karras_JOB_Info()
{
	AI_Output(other,self, " DIA_Karras_JOB_15_00 " );	// What exactly are you doing?
	AI_Output(self,other, " DIA_Karras_JOB_10_01 " );	// I'm in charge of teaching magicians the art of spherical manifestation.
	AI_Output(other,self, " DIA_Karras_JOB_15_02 " );	// What does this mean?
	AI_Output(self,other, " DIA_Karras_JOB_10_03 " );	// Well, I train them to summon beings from other dimensions or realms.
	AI_Output(self,other, " DIA_Karras_JOB_10_04 " );	// This is usually called just a call. Although this definition does not fully reflect the essence of the art of summoning servants.
};


instance DIA_Karras_CIRCLE4(C_Info)
{
	npc = KDF_503_Karras;
	nr = 3;
	condition = DIA_Karras_CIRCLE4_Condition;
	information = DIA_Karras_CIRCLE4_Info;
	permanent = TRUE;
	description = " I want to learn the fourth Circle of Magic. (Learning points: 60) " ;
};


func int DIA_Karras_CIRCLE4_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE4_Info()
{
	AI_Output(other,self, " DIA_Karras_CIRCLE4_15_00 " );	// I want to learn the fourth Circle of Magic.
	if(MIS_ReadyforChapter4 == TRUE)
	{
		if(B_TeachMagicCircle(self,other,4))
		{
			AI_Output(self,other, " DIA_Karras_CIRCLE4_10_01 " );	// Good. To do this, you have everything you need. Enter the Fourth Circle, may the power of this new magic be with you.
			AI_Output(self,other, " DIA_Karras_CIRCLE4_10_02 " );	// You've been through a lot, and Innos will continue to light your path.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_CIRCLE4_10_03 " );	// It's far from finished.
	};
};

instance DIA_Karras_CIRCLE5(C_Info)
{
	npc = KDF_503_Karras;
	nr = 3;
	condition = DIA_Karras_CIRCLE5_Condition;
	information = DIA_Karras_CIRCLE5_Info;
	permanent = TRUE;
	description = " I want to learn the fifth Circle of Magic. (Learning points: 80) " ;
};

func int DIA_Karras_CIRCLE5_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE5_Info()
{
	AI_Output(other,self, " DIA_Karras_CIRCLE5_15_00 " );	// I want to learn the fifth Circle of Magic.

	if (Chapter >=  5 )
	{
		if(B_TeachMagicCircle(self,other,5))
		{
			AI_Output(self,other, " DIA_Karras_CIRCLE5_10_01 " );	// Enter the fifth Circle of Magic. You will become subject to powerful magic, incomparable to what you owned before.
			AI_Output(self,other, " DIA_Karras_CIRCLE5_10_02 " );	// Use this power for good, brother - the darkness is still strong, and your enemies are strong.
			AI_Output(self,other, " DIA_Karras_CIRCLE5_10_03 " );	// I can't guide you on your way to the sixth and highest Circle of Magic. The Pirocar itself will take you into it when the time is right.
			B_LogEntry(Topic_KlosterTeacher, " Master Pyrocar will initiate me into the sixth Circle of Magic. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_CIRCLE4_10_04 " );	// The time has not yet come.
	};
};


instance DIA_Karras_KAP2_EXIT (C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_KAP3_EXIT (C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_ChasePedro (C_Info)
{
	npc = KDF_503_Karras;
	nr = 31;
	condition = DIA_Karras_ChasePedro_Condition;
	information = DIA_Carras_ChasePeter_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Karras_ChasePedro_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 3) && (MIS_NovizenChase == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Karras_ChasePedro_10_00 " );	// Brother, you have no time to waste. You must find Pedro and return the Eye of Innos to the monastery.
		AI_Output(self,other, " DIA_Karras_ChasePedro_10_01 " );	// If the Eye is not returned, we are all doomed.
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_ChasePedro_10_02 " );	// What are you doing here? Shouldn't you be looking for the cunning traitor Pedro now?
		Info_ClearChoices(DIA_Karras_ChasePeter);
		Info_AddChoice(DIA_Karras_ChasePedro, " It can wait. There are more important things to do. " ,DIA_Karras_ChasePedro_Later);
		Info_AddChoice(DIA_Karras_ChasePedro, " He won't get far anyway. " ,DIA_Karras_ChasePedro_WontEscape);
	};
};

func void DIA_Karras_ChasePedro_Later()
{
	AI_Output(other,self, " DIA_Karras_ChasePedro_Later_15_00 " );	// This will wait. There are other, more important things.
	AI_Output(self,other, " DIA_Karras_ChasePedro_Later_10_01 " );	// Do you have any idea what this loss means for the monastery? The eye of Innos is a formidable weapon.
	AI_Output(self,other, " DIA_Karras_ChasePedro_Later_10_02 " );	// No one is able to predict what the enemy intends to do with this amulet, but he is up to something, and we must prevent this disaster.
	AI_Output(self,other, " DIA_Karras_ChasePedro_Later_10_03 " );	// So go on a quest immediately and find this thief!
	AI_StopProcessInfos(self);
};

func void DIA_Karras_ChasePeter_WontEscape()
{
	AI_Output(other,self, " DIA_Karras_ChasePedro_WontEscape_15_00 " );	// He won't get far anyway.
	AI_Output(self,other, " DIA_Karras_ChasePedro_WontEscape_10_01 " );	// I really hope so, for your own good. If he manages to get away because you're hanging around here, I'll personally see to it that you are brought before the tribunal.
	AI_Output(other,self, " DIA_Karras_ChasePedro_WontEscape_15_02 " );	// And what can I be accused of?
	AI_Output(self,other, " DIA_Karras_ChasePedro_WontEscape_10_03 " );	// Conspiring with the enemy. It doesn't take much imagination to imagine the punishment for such a crime.
	AI_Output(self,other, " DIA_Karras_ChasePedro_WontEscape_10_04 " );	// Now don't waste your time. Otherwise, I'm afraid the next time we meet, you'll burn at the stake.
	AI_StopProcessInfos(self);
};


instance DIA_Karras_NeedInfo(C_Info)
{
	npc = KDF_503_Karras;
	nr = 31;
	condition = DIA_Karras_NeedInfo_Condition;
	information = DIA_Karras_NeedInfo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Karras_NeedInfo_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Karras_ChasePedro) && (Capital ==  3 ) && (hero.guild !=  GIL_KDF ) && (MY_NovizenChase == LOG_Running) && Npc_IsInState(self,ZS_Talk));
	{
		return TRUE;
	};
};

func void DIA_Karras_NeedInfo_Info()
{
	AI_Output(self,other, " DIA_Karras_NeedInfo_10_00 " );	// You know what you need to do. So go!
	AI_StopProcessInfos(self);
};


instance DIA_Karras_InnosEyeRetrieved(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = DIA_Karras_InnosEyeRetrieved_Condition;
	information = DIA_Karras_InnosEyeRetrieved_Info;
	permanent = FALSE;
	description = " I brought back the Eye of Innos. " ;
};


func int DIA_Karras_InnosEyeRetrieved_Condition()
{
	if ((Chapter ==  3 ) && (MIS_NoviceChase ==  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void DIA_Karras_InnosEyeRetrieved_Info()
{
	AI_Output(other,self, " DIA_Karras_InnosEyeRetrieved_15_00 " );	// I brought back the Eye of Innos.
	AI_Output(self,other, " DIA_Karras_InnosEyeRetrieved_10_01 " );	// I'm so glad you managed to pluck the Eye from the clutches of the enemy.
	AI_Output(self,other, " DIA_Karras_InnosEyeRetrieved_10_02 " );	// But the danger still hangs over us. The enemy develops new plans and puts them into practice with extraordinary aggressiveness.
	AI_Output(other,self, " DIA_Karras_InnosEyeRetrieved_15_03 " );	// I already felt it in my own skin.
	AI_Output(self,other, " DIA_Karras_InnosEyeRetrieved_10_04 " );	// Now is not the time for jokes. The situation is serious. Very serious. Now we don't even know who can be trusted and who can't.
	AI_Output(self,other, " DIA_Karras_InnosEyeRetrieved_10_05 " );	// The enemy has already succeeded in tempting the acolyte Pedro. He can succeed in this and with many others.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Karras_KAP3_Perm (C_Info)
{
	npc = KDF_503_Karras;
	nr = 5;
	condition = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent = TRUE;
	description = " How is your research going? " ;
};


func int DIA_Karras_KAP3_Perm_Condition()
{
	if ((Capital >=  3 ) && Npc_KnowsInfo(other,DIA_Karras_JOB)) .
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_Perm_Info()
{
	AI_Output(other,self, " DIA_Karras_KAP3_Perm_15_00 " );	// How is your research progressing?
	if ((MIS_KarrasResearchDMT ==  FALSE ) && (PyrokarToldKarrasToResearchDMT ==  TRUE ) && (hero.guild ==  GIL_KDF ))
	{
		AI_Output(self,other, " DIA_Karras_KAP3_Perm_10_01 " );	// I was able to find out something about seekers.
		AI_Output(other,self, " DIA_Karras_KAP3_Perm_15_02 " );	// And what is it?
		AI_Output(self,other, " DIA_Karras_KAP3_Perm_10_03 " );	// They are of obvious demonic origin. Well, at least they are or have been under the influence of demons.
		AI_Output(self,other, " DIA_Karras_KAP3_Perm_10_04 " );	// Be careful when you meet them.
		AI_Output(other,self, " DIA_Karras_KAP3_Perm_15_05 " );	// Wow! What a fresh concept!
		AI_Output(self,other, " DIA_Karras_KAP3_Perm_10_06 " );	// I apologize, but I don't have enough material to make more detailed statements.
		AI_Output(self,other, " DIA_Karras_KAP3_Perm_10_07 " );	// But you could bring me something that belongs to them to study...
		MIS_KarrasResearchDMT = LOG_Running;
		B_LogEntry( TOPIC_DEMENTOREN , " To continue his research, Karras needs something that has been in direct contact with the dark wanderers. " );
		Info_ClearChoices(DIA_Karras_KAP3_Perm);
		Info_AddChoice(DIA_Karras_KAP3_Perm,Dialog_Back,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice(DIA_Karras_KAP3_Perm, " I'll try to do something. " ,DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice(DIA_Karras_KAP3_Perm, " Could Sleeper have anything to do with this? " ,DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice(DIA_Karras_KAP3_Perm, " What exactly do you need? " ,DIA_Karras_KAP3_Perm_Material);
	}
	else if(MIS_KarrasResearchDMT == LOG_Running)
	{
		AI_Output(self,other, " DIA_Karras_KAP3_Perm_10_08 " );	// I'm still working on interpreting the seeker data.
		AI_Output(self,other, " DIA_Karras_KAP3_Perm_10_09 " );	// As soon as I figure something out, I'll update you immediately, of course.
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_KAP3_Perm_10_10 " );	// Enemy has many skins. Which of them poses the greatest danger to the monastery is extremely difficult to determine.
	};
};

func void DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};

func void DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output(other,self, " DIA_Karras_KAP3_Perm_Sleeper_15_00 " );	// Could the Sleeper have anything to do with this?
	AI_Output(self,other, " DIA_Karras_KAP3_Perm_Sleeper_10_01 " );	// I heard about the Sleeper. But based on the information I have, I can't say anything about it.
	AI_Output(self,other, " DIA_Karras_KAP3_Perm_Sleeper_10_02 " );	// Countless demons can be related to him, and any of them can be involved.
};

func void DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output(other,self, " DIA_Karras_KAP3_Perm_Corpse_15_00 " );	// You want me to bring you a corpse, don't you?
	AI_Output(self,other, " DIA_Karras_KAP3_Perm_Corpse_10_01 " );	// No! You are crazy?! The danger posed by the presence of a demonic entity within the walls of a monastery is too great.
	AI_Output(self,other, " DIA_Karras_KAP3_Perm_Corpse_10_02 " );	// It will suffice if you find some items that are typical of these creatures.
	AI_Output(self,other, " DIA_Karras_KAP3_Perm_Corpse_10_03 " );	// The remnants of the demonic aura stuck to them should give enough information to study.
};

func void DIA_Karras_KAP3_Perm_Material()
{
	AI_Output(other,self, " DIA_Karras_KAP3_Perm_Material_15_00 " );	// What exactly do you need?
	AI_Output(self,other, " DIA_Karras_KAP3_Perm_Material_10_01 " );	// How do I know? Any item that belongs only to these creatures.
	Info_AddChoice(DIA_Karras_KAP3_Perm, " Do you want me to bring you a corpse? " ,DIA_Karras_KAP3_Perm_Corpse);
};

func void DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output(other,self, " DIA_Karras_KAP3_Perm_WillSee_15_00 " );	// I'll try to do something.
	AI_Output(self,other, " DIA_Karras_KAP3_Perm_WillSee_10_01 " );	// This would be very helpful. In the meantime, I'll do my usual research.
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};


instance DIA_Karras_HaveBook (C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent = FALSE;
	description = " I brought the Almanac of the Taken. " ;
};


func int DIA_Karras_HaveBook_Condition()
{
	if ((MIS_KarrasResearchDMT == LOG_Running) && (Npc_HasItems(hero, ITWR_DementorObsessionBook_MIS) >=  1 ) && (hero.guild ==  GIL_KDF )) ;
	{
		return TRUE;
	};
};


var int KarrasGotResearchDMTBook_Day;

func void DIA_Karras_HaveBook_Info()
{
	AI_Output(other,self, " DIA_Karras_HaveBook_15_00 " );	// I brought the Almanac of the Taken. Maybe he can help you with something.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Покажи.
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	Npc_RemoveInvItems(self,ITWR_DementorObsessionBook_MIS,1);
	AI_Output(self,other, " DIA_Karras_HaveBook_10_02 " );	// Yes, that might work. I must study this book.
	AI_Output(self,other, " DIA_Karras_HaveBook_10_03 " );	// But I'm already sure of one thing...
	AI_Output(self,other, " DIA_Karras_HaveBook_10_04 " );	// Seekers are, in my opinion, a highly perverted lifeform created by Beliar.
	AI_Output(self,other, " DIA_Karras_HaveBook_10_05 " );	// These creatures are part demonic and part human.
	AI_Output(self,other, " DIA_Karras_HaveBook_10_06 " );	// However, I can't yet tell if we're dealing with a typical spiritual possession, or a pure physical mutation.
	AI_Output(self,other, " DIA_Karras_HaveBook_10_07 " );	// Come back later. Then I can definitely say more.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry( TOPIC_DEMENTOREN , " Karras was able to use the Almanac of the Taken to continue his research. I should return to it later. " );
	KarrasGotResearchDMTBook_Day = Wld_GetDay();
	B_GivePlayerXP(XP_KarrasResearchDMT);
};


instance DIA_Karras_ResearchDMTEnd(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent = TRUE;
	description = " Find out anything new about the seekers? " ;
};


func int DIA_Karras_ResearchDMTEnd_Condition()
{
	if ((MIS_KarrasResearchDMT ==  LOG_SUCCESS ) && (hero.guild ==  GIL_KDF ) && (SC_KnowsMadPsi ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output(other,self, " DIA_Karras_ResearchDMTEnd_15_00 " );	// Learned anything new about seekers?
	if(KarrasGotResearchDMTBook_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_01 " );	// Yes. Now I know who or what these seekers really are.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//Выкладывай!
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_03 " );	// They were once human, like you or me. They made the tragic mistake of devoting themselves to the impure magic of a very strong archdemon.
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_04 " );	// Under the influence of this archdemon, as well as very strong drugs, their sole purpose of existence was to serve him, and over time, only a shadow of their former essence remained.
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_05 " );	// Today, they are nothing more than a tool of evil with no will of their own, and they will never stop preying on the followers of Innos.
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_06 " );	// We have to be careful. It seems that they are afraid of these sacred halls of Innos.
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_07 " );	// However, if their power continues to grow, I can't guarantee we'll be safe here.
		AI_Output(other,self, " DIA_Karras_ResearchDMTEnd_15_08 " );	// Thank you. It was all very instructive.
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_09 " );	// True? It seems to me that this only raises more questions. For example, who were they before, and what archdemon made them what they are now?
		AI_Output(other,self, " DIA_Karras_ResearchDMTEnd_15_10 " );	// I have a guess. It's all like the Brotherhood of the Sleeper. I know these guys.
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_11 " );	// I hope you understand what you're dealing with. Be careful brother.
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_12 " );	// Yes, of course! Here is your almanac. I don't need it anymore.
		B_GiveInvItems(self,other,ITWR_DementorObsessionBook_MIS,1);
		SC_KnowsMadPsi = TRUE;
		B_LogEntry( TOPIC_DEMENTOREN , "Karras ' research is successful. There seems to be a connection between the dark wanderers and the Brotherhood of the Sleeper. " );
		B_GivePlayerXP(XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_ResearchDMTEnd_10_13 " );	// I'm working on it. Come back later.
	};
};


instance DIA_Karras_Prot_BlackEye(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent = TRUE;
	description = " Is there a way to protect yourself from the mental attacks of the dark wanderers? " ;
};


func int DIA_Karras_Prot_BlackEye_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (Pyrokar_AskKarrasAboutDMTAmulett ==  TRUE ) && (MY_Karras_FindBlessedStone ==  FALSE ) && Npc_KnowsInfo(other,DIA_Karras_JOB));
	{
		return TRUE;
	};
};

func void DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output(other,self, " DIA_Karras_Prot_BlackEye_15_00 " );	// Is there a way to defend against the mental attacks of the dark wanderers?
	if(SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self,other, " DIA_Karras_Prot_BlackEye_10_01 " );	// Of course. An amulet made from a stone from a blessed land could have a protective effect.
		AI_Output(self,other, " DIA_Karras_Prot_BlackEye_10_02 " );	// Unfortunately, I don't have these stones left.
		AI_Output(self,other, " DIA_Karras_Prot_BlackEye_10_03 " );	// Some of the altars we have erected are made of such stones.
		AI_Output(other,self, " DIA_Karras_Prot_BlackEye_15_04 " );	// Good. I will try to get such a stone.
		AI_Output(self,other, " DIA_Karras_Prot_BlackEye_10_05 " );	// Yes, do it. But don't even think about damaging any altar, do you hear me?
		B_LogEntry( TOPIC_DEMENTOREN , " Karras can give me some protection from the dark wanderers' mental attacks. To do this, he needs a stone from the blessed land. Some altars are made from such stones. " );
		MIS_Karras_FindBlessedStone = LOG_Running;
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_Prot_BlackEye_10_06 " );	// I have no idea. I don't know enough yet to answer your question. Ask me again later.
	};
};


instance DIA_Karras_KarrasBlessedStone(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;
	description = " I brought some stones from the blessed land. " ;
};


func int DIA_Karras_KarrasBlessedStone_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && Npc_HasItems(other,It_My_Karras_BlessedStone) && (MY_Karras_FindBlessedStone == LOG_Running))
	{
		return TRUE;
	};
};


var int KarrasMakesBlessedStone_Day;

func void DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output(other,self, " DIA_Karras_KarrasBlessedStone_15_00 " );	// I brought some stones from the blessed land.
	B_GiveInvItems(other,self,ItMi_KarrasBlessedStone_Mis,1);
	AI_Output(self,other, " DIA_Karras_KarrasBlessedStone_10_01 " );	// This is good. I hope all the altars are still in place.
	AI_Output(self,other, " DIA_Karras_KarrasBlessedStone_10_02 " );	// Good. I will make for you an amulet that protects from the black gaze of dark magicians.
	AI_Output(self,other, " DIA_Karras_KarrasBlessedStone_10_03 " );	// Give me some time. This needs to be worked on.
	KarrasMakesBlessedStone_Day = Wld_GetDay();
	MIS_Karras_FindBlessedStone = LOG_SUCCESS;
	B_LogEntry( TOPIC_DEMENTOREN , " Karras will give me an amulet that will protect me from the mental attacks of the dark magicians. This should make my life much easier. " );
	B_GivePlayerXP(XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos(self);
};


instance DIA_Karras_ItAm_Prot_BlackEye_Mis (C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent = TRUE;
	description = " So what about the protective amulet you promised me? " ;
};


var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;

func int DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (MIS_Karras_FindBlessedStone ==  LOG_SUCCESS ) && (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output(other,self, " DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00 " );	// So what about the protective amulet you promised me?
	if(KarrasMakesBlessedStone_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other, " DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01 " );	// I'm done. Here, take a look. It turned out to be very elegant.
		CreateInvItems(self,ItAm_Prot_BlackEye_Mis,1);
		B_GiveInvItems(self,other,ItAm_Prot_BlackEye_Mis,1);
		AI_Output(self,other, " DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02 " );	// Wear it without taking it off, and the dark wanderers will not be able to drag you into their mental abyss.
		AI_Output(other,self, " DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03 " );	// Thank you.
		B_LogEntry( TOPIC_DEMENTOREN , " Karras has given me an amulet that will protect me from the dark gaze of the dark wanderers. " );
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE ;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04 " );	// Serenity. I am still working on it.
	};
};


instance DIA_Karras_KAP4_EXIT (C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_KAP5_EXIT (C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP5_EXIT_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_PICKPOCKET(C_Info)
{
	npc = KDF_503_Karras;
	nr = 900;
	condition = DIA_Karras_PICKPOCKET_Condition;
	information = DIA_Karras_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Karras_PICKPOCKET_Condition()
{
	return  C_Robbery ( 49 , 35 );
};

func void DIA_Karras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
	Info_AddChoice(DIA_Karras_PICKPOCKET,Dialog_Back,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Karras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};

func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};


instance DIA_CARRAS_KILLIGNAZ (C_Info) .
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = dia_karras_killignaz_condition;
	info = dia_karras_killignaz_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_carras_killignaz_condition()
{
	if (( MIS_KILLIGNAZ  == LOG_Running ) && ( READORTER  ==  TRUE ) && ( Npc_GetDistToWP ( self , " NW_CITY_SMFOREST_09 " ) <  2000 )) ;
	{
		return TRUE;
	};
};

func void dia_karras_killignaz_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_00 " );	// (smartly) Are you there, Ortego? This is good. Then let's not waste time.
	AI_Output(other,self, " DIA_Karras_KillIgnaz_01_01 " );	// Wait. I am not Ortego.
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_02 " );	// What?! That is, as? Who are you?
	AI_Output(other,self, " DIA_Karras_KillIgnaz_01_03 " );	// I'm the one who sent your friend to the next world.
	AI_Output(other,self, " DIA_Karras_KillIgnaz_01_05 " );	// I didn't think Firebenders did that sort of thing. Can you explain what's going on here?
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_06 " );	// Wait...(excitedly) It was just a necessity! We could not do otherwise.
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_08 " );	// This madman could endanger the very essence of magic and everything that comes with it.
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_09 " );	// In addition, I also heard rumors that Ignaz was doing some of his experiments on humans. And this is too much!
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_10 " );	// That's why our order made this decision, though it wasn't as easy as you might think.
	AI_Output(other,self, " DIA_Karras_KillIgnaz_01_11 " );	// Are you saying that all Firebenders are aware of this?
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_12 " );	// I won't tell you that. You already learned too much!
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_15 " );	// It's up to you! And I think it will be right if you do not tell anyone about our meeting.
	AI_Output(self,other, " DIA_Karras_KillIgnaz_01_16 " );	// I'm sure not many will believe your words.
	KARRASTELLABOUTIGNAZ = TRUE ;
	B_LogEntry( TOPIC_KILLIGNAZ , " I managed to find out who was really behind the murder of Ignatz. It was the Fire Mages! They considered his research too dangerous and objectionable to their faith, thus predetermining the fate of the poor fellow. Now I should think about what to do next, because the truth that I learned may be of no use to anyone in such a situation. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_503_Karras,"Start");
};


instance DIA_KARRAS_KILLIGNAZ_AFTER ( C_Info ) .
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = dia_karras_killignaz_after_condition;
	info = dia_karras_killignaz_after_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_killignaz_after_condition()
{
	if (( MIS_KILLIGNAZ  ==  LOG_SUCCESS ) && ( KARRASTELLABOUTIGNAZ  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_karras_killignaz_after_info()
{
	if(TELLANDRETRUTH == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Karras_KillIgnaz_After_01_00 " );	// So you decided to tell Lord Andre about our meeting after all.
		AI_Output(other,self, " DIA_Karras_KillIgnaz_After_01_01 " );	// I couldn't do otherwise.
		AI_Output(self,other, " DIA_Karras_KillIgnaz_After_01_02 " );	// Hmmm...(reproachfully) All right, it's up to you! But I don't think it was very smart of you.
		if(INNOSPRAYCOUNT >= 10)
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 10;
		}
		else
		{
			INNOSPRAYCOUNT = 0;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Karras_KillIgnaz_After_01_07 " );	// So you didn't tell Lord Andre about our meeting after all.
		AI_Output(self,other, " DIA_Karras_KillIgnaz_After_01_09 " );	// That was a wise decision of you.
		AI_Output(self,other, " DIA_Karras_KillIgnaz_After_01_10 " );	// For the real truth can sometimes bring more evil than just a little lie.
		AI_Output(self,other, " DIA_Karras_KillIgnaz_After_01_11 " );	// Here, take this small gift as a token of my gratitude. I think you deserve it.
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
		AI_Output(other,self, " DIA_Karras_KillIgnaz_After_01_12 " );	// Yes? Well, thank you. Although I did not expect.
		AI_Output(self,other, " DIA_Karras_KillIgnaz_After_01_13 " );	// The ways of Innos are inscrutable, my son... (smiling) And now go and let him keep you!
		AI_StopProcessInfos(self);
	};
};


instance DIA_KARRAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = dia_karras_runemagicnotwork_condition;
	information = dia_karras_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_karras_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Karras_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Karras_RuneMagicNotWork_01_01 " );	// That's just the point, that is not present. And I can't understand the reason why I can't use them!
	AI_Output(self,other, " DIA_Karras_RuneMagicNotWork_01_03 " );	// Apparently, it affected us all! The other Firebenders also fail to do anything.
	AI_Output(other,self, " DIA_Karras_RuneMagicNotWork_01_04 " );	// Got it.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Fire Mages have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};


instance DIA_Karras_HelpBooks (C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HelpBooks_condition;
	information = DIA_Karras_HelpBooks_info;
	permanent = FALSE;
	description = " Pyrocar sent me to you... " ;
};

func int DIA_Karras_HelpBooks_condition()
{
	if(MIS_KARRAS_BOOKS == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Karras_HelpBooks_info()
{
	AI_Output(other,self, " DIA_Karras_HelpBooks_0131_012 " );	// Pyrokar sent me to you...
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_01 " );	// I was just looking for you, novice.
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_02 " );	// I already heard that you managed to pass the Trial - and it's incredible!
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_03 " );	// And that's why you're the only one suitable for my assignment.
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_04 " );	// At the moment I'm studying the works of our ancestors - the ancient magicians of Khorinis.
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_05 " );	// They also served Innos, but many of their rites are not clear to me, and many, probably, are completely unknown.
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_06 " );	// Apparently, their magic was very different from what we are used to...
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_07 " );	// I've collected enough information already...
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_08 " );	// And I know for sure that some of the books I need are still somewhere in Khorinis.
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_09 " );	// Unfortunately, I can't tell you where to find them, but I really hope for your quick wit and knowledge of the island.
	AI_Output(self,other, " DIA_Karras_HelpBooks_01_10 " );	// You need to find five books and a scroll with explanations for them. Without it, it would be difficult to understand what was written.
	B_LogEntry( TOPIC_HELPKARRASBOOKS , " Karras told me about the ancient magicians who once lived on the island of Khorinis. I need to find five books left by these people, as well as a scroll with explanations of the books. No clues where to find these books, I, of course, if they couldn’t give it - you’ll have to act blindly and rely on your intuition. " );
};

instance DIA_Karras_HelpBooks_Ok (C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HelpBooks_Ok_condition;
	information = DIA_Karras_HelpBooks_Ok_info;
	permanent = FALSE;
	description = " I found books and a scroll. " ;
};

func int DIA_Karras_HelpBooks_Ok_condition()
{
	if((MIS_KARRAS_BOOKS == LOG_Running) && Npc_HasItems(hero,itwr_oldbook1) && Npc_HasItems(hero,itwr_oldbook2) && Npc_HasItems(hero,itwr_oldbook3) && Npc_HasItems(hero,itwr_oldbook4) && Npc_HasItems(hero,itwr_oldbook5) && Npc_HasItems(hero,itwr_oldbook6))
	{
		return TRUE;
	};
};

func void DIA_Karras_HelpBooks_Ok_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Karras_HelpBooks_Ok_01_01 " );	// I found books and a scroll.
	AI_Output(self,other, " DIA_Karras_HelpBooks_Ok_01_02 " );	// (surprised) It can't be! Show me.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,itwr_oldbook1,1);
	Npc_RemoveInvItems(other,itwr_oldbook2,1);
	Npc_RemoveInvItems(other,itwr_oldbook3,1);
	Npc_RemoveInvItems(other,itwr_oldbook4,1);
	Npc_RemoveInvItems(other,itwr_oldbook5,1);
	Npc_RemoveInvItems(other,itwr_oldbook6,1);
	AI_Output(self,other, " DIA_Karras_HelpBooks_Ok_01_03 " );	// Oh Innos, you did it! Although, for sure, you can’t even imagine how interesting and important information we will receive from these tomes.
	AI_Output(other,self, " DIA_Karras_HelpBooks_Ok_01_04 " );	// Maybe you can share your knowledge with me later?
	AI_Output(self,other, " DIA_Karras_HelpBooks_Ok_01_05 " );	// Who knows, who knows... (snidely) Go to Pirokar, he is already looking forward to your initiation into the Circle of Fire! In the meantime, accept this runestone from me, you will definitely need it.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	MIS_KARRAS_BOOKS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPKARRASBOOKS,LOG_SUCCESS);
	B_LogEntry( TOPIC_HELPKARRASBOOKS , " I finally managed to find all the ancient tomes, which I, and, most importantly, Karras, are incredibly happy about. The contents of these books will probably remain a mystery to me, at least for now... " );
};
