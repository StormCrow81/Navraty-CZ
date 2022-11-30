
var int spendeday;
var int DaronBlessMe;
var int Dar_Bonus_1;
var int Dar_Bonus_2;
var int Dar_Bonus_3;
var int Dar_Bonus_4;

func void B_DaronSegen()
{
	var string concatText;
	var int DarBonMan;

	Daron_Segen = TRUE;
	DoBonMan = SBMODE  *  2 ;

	if ((Give_Spend >=  250 ) && (Give_Bonus_1 ==  FALSE ))
	{
		B_RaiseAttribute_Bonus(other, ATR_MANA_MAX ,DarBonMana);
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		But_Bonus_1 = TRUE ;
	}
	else if((Daron_Spende >= 500) && (Dar_Bonus_1 == TRUE) && (Dar_Bonus_2 == FALSE))
	{
		B_GivePlayerXP(XP_Ambient);
		But_Bonus_2 = TRUE ;
	}
	else if((Daron_Spende >= 750) && (Dar_Bonus_2 == TRUE) && (Dar_Bonus_3 == FALSE))
	{
		other.lp = other.lp + SBMODE;
		concatText = ConcatStrings(PRINT_LearnLP,IntToString(SBMODE));
		AI_Print(concatText);
		But_Bonus_3 = TRUE ;
	}
	else if((Daron_Spende >= 1000) && (Dar_Bonus_3 == TRUE) && (Dar_Bonus_4 == FALSE))
	{
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		other.attribute[ATR_HITPOINTS_MAX] = other.attribute[ATR_HITPOINTS_MAX] + (SBMODE * 5);
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(SBMODE * 5));
		AI_Print(concatText);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT + 10;
		But_Bonus_4 = TRUE ;
	}
	else
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
		};
	};
};

instance DIA_Daron_EXIT(C_Info)
{
	npc = KDF_511_Daron;
	nr = 999;
	condition = DIA_Daron_EXIT_Condition;
	information = DIA_Daron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Daron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Daron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Daron_Hello (C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Hallo_Condition;
	information = DIA_Daron_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Daron_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Hallo_Info()
{
	AI_Output(self,other, " DIA_Daron_Hallo_10_00 " );	// What can I do for you? Are you looking for peace of mind?
	AI_Output(self,other, " DIA_Daron_Hallo_10_01 " );	// Do you want to pray to our lord Innos, or maybe you want to donate gold to his church?
};


instance DIA_Daron_Paladine(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Paladine_Condition;
	information = DIA_Daron_Paladine_Info;
	permanent = FALSE;
	description = " I need to talk to the paladins. " ;
};


func int DIA_Daron_Paladine_Condition()
{
	if ((other.guild !=  GIL_KDF ) && (Chapter <  2 )) .
	{
		return TRUE;
	};
};

func void DIA_Daron_Paladine_Info()
{
	AI_Output(other,self, " DIA_Daron_Paladine_15_00 " );	// I need to talk to the paladins. Can you help me with this?
	AI_Output(self,other, " DIA_Daron_Paladine_10_01 " );	// Well, for this you must have access to the upper quarter of the city. However, only citizens and city guards are allowed to enter there.
	AI_Output(self,other, " DIA_Daron_Paladine_10_02 " );	// And, of course, us Fire Mages.
	AI_Output(other,self, " DIA_Daron_Paladine_15_03 " );	// How can I become a Fire Mage?
	AI_Output(self,other, " DIA_Daron_Paladine_10_04 " );	// You must join our order as an acolyte. And after some time, perhaps you will be accepted into the ranks of magicians.
	AI_Output(self,other, " DIA_Daron_Paladine_10_05 " );	// However, this path is long, full of hard work and tedious learning.
};


instance DIA_Daron_AboutSegen(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_AboutSegen_Condition;
	information = DIA_Daron_AboutSegen_Info;
	permanent = FALSE;
	description = " I've come to receive your blessing! " ;
};


func int DIA_Daron_AboutSegen_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_AboutSegen_Info()
{
	AI_Output(other,self, " DIA_Daron_AboutSegen_15_00 " );	// I've come to receive your blessing!
	AI_Output(self,other, " DIA_Daron_AboutSegen_10_01 " );	// That's good - then you'll probably want to donate gold to the holy church of Innos, right?
	AI_Output(other,self, " DIA_Daron_AboutSegen_15_02 " );	// Actually, I wanted to get your blessing so that I could become an apprentice to one of the masters in the lower part of the city...

	if(Daron_Segen == TRUE)
	{
		AI_Output(self,other, " DIA_Daron_AboutSegen_10_03 " );	// But I already gave you my blessing, my son.
		AI_Output(self,other, " DIA_Daron_AboutSegen_10_04 " );	// Go with Innos, my son!
	}
	else
	{
		AI_Output(self,other, " DIA_Daron_AboutSegen_10_05 " );	// But, my son! Without a modest donation to the church, I do not consider it possible for me to bless you.
		AI_Output(self,other, " DIA_Daron_AboutSegen_10_06 " );	// How else can I be sure of your good intentions towards the holy church of Innos?
	};
};


instance DIA_Daron_Spenden (C_Info)
{
	npc = KDF_511_Daron;
	nr = 3;
	condition = DIA_Daron_Spenden_Condition;
	information = DIA_Daron_Spenden_Info;
	permanent = FALSE;
	description = " And what kind of donation is usually considered sufficient? " ;
};


func int DIA_Daron_Spenden_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Daron_Spenden_Info()
{
	AI_Output(other,self, " DIA_Daron_Spenden_15_00 " );	// And what kind of donation is usually considered sufficient?
	AI_Output(self,other, " DIA_Daron_Spenden_10_01 " );	// Well, it depends on what you have. Let's see what you have.
	AI_Output(self,other, " DIA_Daron_Spenden_10_02 " );	// (looks into a wallet full of money) Mmm hmm...

	if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		AI_Output(self,other, " DIA_Daron_Spenden_10_03 " );	// Hmm, you're poor, aren't you? Keep what little you have.

		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben, "The fire mage Daron didn't bless me. I think that means I should donate some gold to him. Without it, he won't bless me. " );
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) < 50)
		{
			AI_Output(self,other, " DIA_Daron_Spenden_10_04 " );	// Well, you're not rich, but you're not poor either. Ten gold for Innos - we live a modest life.
			B_GiveInvItems(other,self,ItMi_Gold,10);
			Npc_RemoveInvItems(self,ItMi_Gold,10);
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 100)
		{
			AI_Output(self,other, " DIA_Daron_Spenden_10_05 " );	// You have over fifty gold coins. Donate twenty-five coins to Innos and receive my blessing.
			B_GiveInvItems(other,self,ItMi_Gold,25);
			Npc_RemoveInvItems(self,ItMi_Gold,25);
		}
		else
		{
			AI_Output(self,other, " DIA_Daron_Spenden_10_06 " );	// You have more than a hundred gold coins - the Lord says: 'Share if you can'.
			AI_Output(self,other, " DIA_Daron_Spenden_10_07 " );	// The Church will accept your generous offering.
			B_GiveInvItems(other,self,ItMi_Gold,50);
			Npc_RemoveInvItems(self,ItMi_Gold,50);
		};
		AI_Output(self,other, " DIA_Daron_Spenden_10_08 " );	// I bless you on behalf of Innos. He brings light and justice to this world.
		Daron_Segen = TRUE;
		B_GivePlayerXP(XP_InnosSegen);

		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben, "The fire mage Daron has blessed me. " );
		};
	};
};


instance DIA_Daron_Where (C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Where_Condition;
	information = DIA_Daron_Where_Info;
	permanent = FALSE;
	description = " Where are you from? " ;
};


func int DIA_Daron_Where_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Where_Info()
{
	AI_Output(other,self, " DIA_Daron_Woher_15_00 " );	// Where did you come from?
	AI_Output(self,other, " DIA_Daron_Woher_10_01 " );	// I came from the monastery of magicians, located in the mountains.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Daron_Woher_10_02 " );	// We accept all who are pure in heart and feel the desire to serve our almighty lord Innos.
	};
};


instance DIA_Daron_Innos(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Innos_Condition;
	information = DIA_Daron_Innos_Info;
	permanent = FALSE;
	description = " Tell me about Innos. " ;
};


func int DIA_Daron_Innos_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Daron_Woher ) && ( other . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Daron_Innos_Info()
{
	AI_Output(other,self, " DIA_Daron_Innos_15_00 " );	// Tell me about Innos.
	AI_Output(self,other, " DIA_Daron_Innos_10_01 " );	// Innos, our almighty lord, is our light and fire.
	AI_Output(self,other, " DIA_Daron_Innos_10_02 " );	// He chose people as the conductors of his will on earth. He gives them magic and laws.
	AI_Output(self,other, " DIA_Daron_Innos_10_03 " );	// We speak and act on his behalf. We administer justice according to his will and preach his word.
};


instance DIA_Daron_Kloster(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Kloster_Condition;
	information = DIA_Daron_Kloster_Info;
	permanent = FALSE;
	description = " Tell me more about the monastery. " ;
};


func int DIA_Daron_Kloster_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Daron_Woher ) || ( Npc_Knows Info ( other , DIA_Daron_Paladine ) && ( other . guild ==  GIL_NONE )))
	{
		return TRUE;
	};
};

func void DIA_Daron_Kloster_Info()
{
	AI_Output(other,self, " DIA_Daron_Kloster_15_00 " );	// Tell me more about the monastery.
	AI_Output(self,other, " DIA_Daron_Kloster_10_01 " );	// We teach our students all forms of magic. But the power of the Fire Mages is not limited to magic.
	AI_Output(self,other, " DIA_Daron_Kloster_10_02 " );	// We are also well versed in the art of alchemy and runemaking.
	AI_Output(self,other, " DIA_Daron_Kloster_10_03 " );	// We also make excellent wine.
};


instance DIA_Daron_Stadt (C_Info)
{
	npc = KDF_511_Daron;
	nr = 99;
	condition = DIA_Daron_Stadt_Condition;
	information = DIA_Daron_Stadt_Info;
	permanent = FALSE;
	description = " What are you doing in the city? " ;
};


func int DIA_Daron_Stadt_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Daron_Woher ) )
	{
		return TRUE;
	};
};

func void DIA_Daron_Stadt_Info()
{
	AI_Output(other,self, " DIA_Daron_Stadt_15_00 " );	// What are you doing in the city?
	AI_Output(self,other, " DIA_Daron_Stadt_10_01 " );	// I enlighten the paladins and support the townspeople with my advice and words of encouragement.
	AI_Output(self,other, " DIA_Daron_Stadt_10_02 " );	// In these difficult times, it is our duty to be among the people and help the poor.
};


instance DIA_Addon_Daron_GuildHelp(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Addon_Daron_GuildHelp_Condition;
	information = DIA_Addon_Daron_GuildHelp_Info;
	description = " I heard you lost a valuable figurine. " ;
};


func int DIA_Addon_Daron_GuildHelp_Condition()
{
	if((MIS_Addon_Vatras_Go2Daron == LOG_Running) && Npc_KnowsInfo(other,DIA_Daron_Stadt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_GuildHelp_Info()
{
	AI_Output(other,self, " DIA_Addon_Daron_GuildHelp_15_00 " );	// I heard you lost a valuable figurine.
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_10_01 " );	// Really? Only the water mage Vatras knew about this.
	AI_Output(other,self, " DIA_Addon_Daron_GuildHelp_15_02 " );	// What's the problem?
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_10_03 " );	// A precious figurine was sent to the monastery from the continent. But it never reached us.
	AI_Output(other,self, " DIA_Addon_Daron_GuildHelp_15_04 " );	// Was the ship robbed?
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_10_05 " );	// No. He arrived safe and sound in Khorinis. I met him and took the figurine.
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_10_06 " );	// But when I was returning to the monastery, the goblins attacked me and took it from me.
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_10_07 " );	// (angrily) And don't look at me like that. Wizards, for your information, are people too.
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_Running;
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, " So the goblins have it now? " ,DIA_Addon_Daron_GuildHelp_gobbos);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, " Where exactly did you lose the figurine? " ,DIA_Addon_Daron_GuildHelp_wo);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, " Did you try to return the figurine? " ,DIA_Addon_Daron_GuildHelp_wiederholen);
};

func void DIA_Addon_Daron_GuildHelp_wiederholen()
{
	AI_Output(other,self, " DIA_Addon_Daron_GuildHelp_wiederholen_15_00 " );	// Did you try to return the figurine?
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_wiederholen_10_01 " );	// Of course I tried! I looked for her everywhere. But alas, to no avail.
};

func void DIA_Addon_Daron_GuildHelp_gobbos()
{
	AI_Output(other,self, " DIA_Addon_Daron_GuildHelp_gobbos_15_00 " );	// So the goblins have it now?
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_gobbos_10_01 " );	// When she was in their hands, they disappeared into the bushes.
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_gobbos_10_02 " );	// I didn't see them again. They must be living in a cave somewhere.
};

func void DIA_Addon_Daron_GuildHelp_wo()
{
	AI_Output(other,self, " DIA_Addon_Daron_GuildHelp_wo_15_00 " );	// Where exactly did you lose the figurine?
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_wo_10_01 " );	// On the way to the monastery, not far from Orlan's tavern.
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, " I've heard enough. I'll find the figurine. " ,DIA_Addon_Daron_GuildHelp_auftrag);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, " Orlan's Tavern? Where is it? " ,DIA_Addon_Daron_GuildHelp_woTaverne);
};

func void DIA_Addon_Daron_GuildHelp_woTaverne()
{
	AI_Output(other,self, " DIA_Addon_Daron_GuildHelp_woTaverne_15_00 " );	// Orlan's tavern? Where is she?
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_woTaverne_10_01 " );	// If you leave the city through this gate and go straight along the road, you will reach a detached house.
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_woTaverne_10_02 " );	// This is Orlan's tavern, the 'Dead Harpy'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag()
{
	AI_Output(other,self, " DIA_Addon_Daron_GuildHelp_auftrag_15_00 " );	// I've heard enough. I will find the statue.
	AI_Output(self,other, " DIA_Addon_Daron_GuildHelp_auftrag_10_01 " );	// May Innos guide you, and may he protect you from the dangers that lie in wait for you outside the gates of the city.
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF, " Daron has been robbed by vile goblins. He has lost a valuable figurine he was supposed to deliver to the monastery. These goblins seem to be hiding in a cave near the Dead Harpy tavern. " );
};


instance DIA_Addon_Daron_FoundStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Addon_Daron_FoundStatue_Condition;
	information = DIA_Addon_Daron_FoundStatue_Info;
	description = " I found the figurine. " ;
};

func int DIA_Addon_Daron_FoundStatue_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (DIA_Gorax_GOLD_perm == FALSE) && (MIS_Addon_Daron_GetStatue == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_FoundStatue_Info()
{
	AI_Output(other,self, " DIA_Addon_Daron_FoundStatue_15_00 " );	// I found the figurine.
	AI_Output(self,other, " DIA_Addon_Daron_FoundStatue_10_01 " );	// Praise to Innos!
	AI_Output(other,self, " DIA_Addon_Daron_FoundStatue_15_02 " );	// What are you going to do with it?
	AI_Output(self,other, " DIA_Addon_Daron_FoundStatue_10_03 " );	// Me? Nothing. So far, it has only brought me misfortune.
	AI_Output(self,other, " DIA_Addon_Daron_FoundStatue_10_04 " );	// YOU will take her to the monastery, son.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Addon_Daron_FoundStatue_10_05 " );	// Of course, you won't be allowed inside unless you agree to devote the rest of your life to serving the monastery.
		AI_Output(self,other, " DIA_Addon_Daron_FoundStatue_10_06 " );	// But I'm sure you won't refuse. After all, you can do a favor for ME, right?
	};
	AI_Output(self,other, " DIA_Addon_Daron_FoundStatue_10_07 " );	// Go, son! May Innos be with you.
};

instance DIA_Addon_Daron_ReturnedStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_ReturnedStatue_Condition;
	information = DIA_Addon_Daron_ReturnedStatue_Info;
	description = " I took your figurine to the monastery. " ;
};

func int DIA_Addon_Daron_ReturnedStatue_Condition()
{
	if((DIA_Gorax_GOLD_perm == TRUE) && (MIS_Addon_Daron_GetStatue == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_ReturnedStatue_Info()
{
	AI_Output(other,self, " DIA_Addon_Daron_ReturnedStatue_15_00 " );	// I took your figurine to the monastery. You can be calm.
	AI_Output(self,other, " DIA_Addon_Daron_ReturnedStatue_10_01 " );	// That's great news! May Innos keep you.
	AI_Output(self,other, " DIA_Addon_Daron_ReturnedStatue_10_02 " );	// Take this as a token of my gratitude.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	TOPIC_End_RangerHelpKDF = TRUE;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Daron_arm(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = DIA_Daron_arm_Condition;
	information = DIA_Daron_arm_Info;
	permanent = FALSE;
	description = " I'm just poor! " ;
};

func int DIA_Daron_arm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Daron_Stadt ) && ( Npc_HasItems ( other , It'sMy_Gold ) <  10 ) && ( other . guild ==  GIL_NONE )) ;
	{
		return TRUE;
	};
};

func void DIA_Daron_arm_Info()
{
	AI_Output(other,self, " DIA_Daron_arm_15_00 " );	// I'm just poor!
	AI_Output(self,other, " DIA_Daron_arm_10_01 " );	// Yes, you are reduced to poverty. This is not surprising in these difficult times. Take this gold, I hope it helps you.
	AI_Output(self,other, " DIA_Daron_arm_10_02 " );	// But you must find yourself a job, and then you will not lack gold. And you can donate this gold to the church of Innos, remembering how she helped you.
	B_GiveInvItems(self,other,ItMi_Gold,20);

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};
};


instance DIA_DARON_CANTHAR(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = dia_daron_canthar_condition;
	information = dia_daron_canthar_info;
	permanent = TRUE;
	description = " This is not fair! " ;
};

func int dia_daron_canthar_condition()
{
	if((Canthar_Sperre == TRUE) && (KnowCantarFree == TRUE))
	{
		return TRUE;
	};
};

func void dia_daron_canthar_info()
{
	if(other.guild == GIL_KDF)
	{
		AI_Output(other, self, " DIA_Daron_Canthar_15_00 " );	// This is not fair, brother!
	}
	else
	{
		AI_Output(other,self, " DIA_Daron_Canthar_15_01 " );	// There is injustice here, father!
	};
	if (Canthar_Ausgeliefer ==  TRUE )
	{
		AI_Output(other,self, " DIA_Daron_Canthar_15_02 " );	// Merchant Kantar, taking advantage of the venality of the guards, went free and denigrates my name!
	}
	else
	{
		AI_Output(other,self, " DIA_Daron_Canthar_15_03 " );	// Merchant Kantar denigrates my name!
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Daron_Canthar_10_04 " );	// How dare he?
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Daron_Canthar_10_05 " );	// How dare he slander a paladin?!
	}
	else if(Daron_Spende >= 750)
	{
		AI_Output(self,other, " DIA_Daron_Canthar_10_06 " );	// How dare he slander such a faithful admirer of Innos?!
	}
	else
	{
		AI_Output(self,other, " DIA_Daron_Canthar_10_07 " );	// Unfortunately, I don't know you well enough to judge who's right here.
		return;
	};
	AI_Output(self,other, " DIA_Daron_Canthar_10_08 " );	// I will speak to Lord Andre about this immediately.
	Canthar_Lock = FALSE ;
};

var int DIA_Daron_Spend_permanent;

instance DIA_Daron_Spende(C_Info)
{
	npc = KDF_511_Daron;
	nr = 990;
	condition = DIA_Daron_Spende_Condition;
	information = DIA_Daron_Spende_Info;
	permanent = TRUE;
	description = " I want to make a donation... " ;
};

func int DIA_Daron_Spende_Condition()
{
	if ((DIA_Daron_Spending_Permanent ==  FALSE ) && Npc_KnowsInfo(other,DIA_Daron_Spending) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW ) && (hero.guild !=  GIL_KDM )) ;
	{
		return TRUE;
	};
};

func void DIA_Daron_Spende_Info()
{
	AI_Output(other,self, " DIA_Daron_Spende_15_00 " );	// I want to donate...
	Info_ClearChoices(DIA_Daron_Spende);

	if (But_Bonus_4 ==  FALSE )
	{
		Info_AddChoice(DIA_Daron_Spende, " But I don't have enough gold. " ,DIA_Daron_Spende_BACK);
		Info_AddChoice(DIA_Daron_Spende, " There are fifty gold coins here. " ,DIA_Daron_Spende_50);
		Info_AddChoice(DIA_Daron_Spende, " Here's one hundred gold coins. " ,DIA_Daron_Spende_100);
		Info_AddChoice(DIA_Daron_Spende, " There are two hundred gold coins here. " ,DIA_Daron_Spende_200);
	}
	else
	{
		AI_Output(self,other, " DIA_Daron_Spende_10_01 " );	// You have already donated over a thousand gold coins to me.
		AI_Output(self,other, " DIA_Daron_Spende_10_02 " );	// The blessing of Innos will always be with you!
		DIA_Daron_Spend_permanent = TRUE ;
	};
};

func void DIA_Daron_Spende_BACK()
{
	AI_Output(other,self, " DIA_Daron_Spende_BACK_15_00 " );	// But I don't have enough gold...
	AI_Output(self,other, " DIA_Daron_Spende_BACK_10_01 " );	// It doesn't matter, my son. You can donate later.
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_50()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Daron_Spende_50_10_00 " );	// I bless you on behalf of Innos. He brings light and justice to this world.
		Npc_RemoveInvItems(self,ItMi_Gold,50);
		if ( SPENDDAY  != Wld_GetDay())
		{
			daron_donation = daron_donation +  50 ;
			B_DaronSegen();
			Daron_Segen = TRUE;
			SPENDAY = Wld_GetDay();
		};
		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben, "The fire mage Daron has blessed me. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Daron_Spende_50_10_01 " );	// You can donate a few times a little if you don't have enough gold right now.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_100()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other, " DIA_Daron_Spende_100_10_00 " );	// Innos, you are the light that illuminates the path of the righteous.
		AI_Output(self,other, " DIA_Daron_Spende_100_10_01 " );	// I bless this person on your behalf. May your light shine upon him forever.
		Npc_RemoveInvItems(self,ItMi_Gold,100);
		daron_donation = daron_donation +  100 ;
		B_DaronSegen();
		Daron_Segen = TRUE;

		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben, "The fire mage Daron has blessed me. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Daron_Spende_100_10_02 " );	// Innos says - if you want to pray, open your soul. And if you want to donate, bring your gift.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_200()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other, " DIA_Daron_Spende_200_10_00 " );	// Innos, bless this man. May your light shine upon him forever.
		AI_Output(self,other, " DIA_Daron_Spende_200_10_01 " );	// Give him the strength to live a righteous life.
		Npc_RemoveInvItems(self,ItMi_Gold,200);
		daron_donation = daron_donation +  200 ;
		B_DaronSegen();
		Daron_Segen = TRUE;

		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben, "The fire mage Daron has blessed me. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Daron_Spende_200_10_02 " );	// If you want to donate that much gold, you must at least have it.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

instance DIA_DARON_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = dia_daron_runemagicnotwork_condition;
	information = dia_daron_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_daron_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_daron_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Daron_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Daron_RuneMagicNotWork_01_01 " );	// That's just the point, no! And I can't understand why I can't use them.
	AI_Output(other,self, " DIA_Daron_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_Daron_RuneMagicNotWork_01_03 " );	// Apparently, it affected us all. Other Fire Mages also fail.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_DARON_RING_TEST(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_RING_TEST_condition;
	information = DIA_DARON_RING_TEST_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DARON_RING_TEST_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_DARON_RING_TEST_info()
{
	AI_Output(self,other, " DIA_DARON_RING_TEST_01_01 " );	// Wait! I have an interesting offer for you.
	AI_Output(other,self, " DIA_DARON_RING_TEST_01_02 " );	// And what is it?
	AI_Output(self,other, " DIA_DARON_RING_TEST_01_03 " );	// The fact is that recently I found one magic ring.
	AI_Output(self,other, " DIA_DARON_RING_TEST_01_04 " );	// I was about to try it on, but then I noticed rather strange symbols on its cut.
	AI_Output(self,other, " DIA_DARON_RING_TEST_01_05 " );	// And now I'm kind of confused. I don't even know what to do.
	AI_Output(other,self, " DIA_DARON_RING_TEST_01_06 " );	// What's bothering you?
	AI_Output(self,other, " DIA_DARON_RING_TEST_01_07 " );	// You see, I'm pretty cautious about magic, the meaning of which I can not fully understand.
	AI_Output(self,other, " DIA_DARON_RING_TEST_01_08 " );	// And I need someone to use this ring for me.
	AI_Output(self,other, " DIA_DARON_RING_TEST_01_09 " );	// So I thought...
	AI_Output(other,self, " DIA_DARON_RING_TEST_01_10 " );	// ...that I might be the one to do it.
	AI_Output(self,other, " DIA_DARON_RING_TEST_01_11 " );	// You're absolutely right! Naturally, I will not remain in debt and thank you for your help.
	AI_Output(other,self, " DIA_DARON_RING_TEST_01_12 " );	// Okay, I'll think about your suggestion.
	DARON_RING = TRUE;
};


instance DIA_DARON_RING_TEST_Take(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_RING_TEST_Take_condition;
	information = DIA_DARON_RING_TEST_Take_info;
	permanent = FALSE;
	description = " Okay, give me that ring here. " ;
};

func int DIA_DARON_RING_TEST_Take_condition()
{
	if(DARON_RING == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DARON_RING_TEST_Take_info()
{
	AI_Output(other,self, " DIA_DARON_RING_TEST_Take_01_01 " );	// Okay, give this ring here.
	AI_Output(self,other, " DIA_DARON_RING_TEST_Take_01_02 " );	// Are you sure about this?
	AI_Output(other,self, " DIA_DARON_RING_TEST_Take_01_03 " );	// Otherwise, I wouldn't ask you for it.
	AI_Output(self,other, " DIA_DARON_RING_TEST_Take_01_04 " );	// As you say. Here you are.
	B_GiveInvItems(self,other,ItRi_UnknownRing,1);
	Log_CreateTopic(TOPIC_DARON_RING_TEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DARON_RING_TEST,LOG_Running);
	MIS_DARON_RING_TEST = LOG_Running;
	B_LogEntry( TOPIC_DARON_RING_TEST , " Daron offered to test a strange looking ring for me. I agreed to do so. " );
};


instance DIA_DARON_RING_TEST_Done(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_RING_TEST_Done_condition;
	information = DIA_DARON_RING_TEST_Done_info;
	permanent = FALSE;
	description = " I used your ring. " ;
};

func int DIA_DARON_RING_TEST_Done_condition()
{
	if((MIS_DARON_RING_TEST == LOG_Running) && (DaronRingTest == TRUE) && (Npc_HasItems(hero,ItRi_UnknownRing) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DARON_RING_TEST_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_DARON_RING_TEST_Done_01_01 " );	// I used your ring.
	AI_Output(self,other, " DIA_DARON_RING_TEST_Done_01_02 " );	// And what happened?
	AI_Output(other,self, " DIA_DARON_RING_TEST_Done_01_03 " );	// Nothing special. It took me straight to the Circle of the Sun.
	AI_Output(self,other, " DIA_DARON_RING_TEST_Done_01_04 " );	// So it's just a teleportation ring, then? To be honest, I expected more.
	AI_Output(self,other, " DIA_DARON_RING_TEST_Done_01_05 " );	// Anyway, thanks for helping me figure this out.
	AI_Output(other,self, " DIA_DARON_RING_TEST_Done_01_06 " );	// What should I do with the ring?
	AI_Output(self,other, " DIA_DARON_RING_TEST_Done_01_07 " );	// You can keep it for yourself. I don't need it.
	Npc_RemoveInvItems(hero,ItRi_UnknownRing,Npc_HasItems(hero,ItRi_UnknownRing));
	CreateInvItems(hero,ItRi_Teleport_Ring,1);
	AI_Output(self,other, " DIA_DARON_RING_TEST_Done_01_08 " );	// Grab a few health drinks as a thank you too.
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	B_LogEntry( TOPIC_DARON_RING_TEST , " I informed Daron of what happened when I put the ring on. Disappointed with his performance, he let me keep it. " );
	Log_CreateTopic(TOPIC_DARON_RING_TEST,LOG_SUCCESS);
	MIS_DARON_RING_TEST = LOG_SUCCESS;
};


instance DIA_DARON_GoldForGorax(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_GoldForGorax_condition;
	information = DIA_DARON_GoldForGorax_info;
	permanent = FALSE;
	description = " Is there anything I can do for you? " ;
};

func int DIA_DARON_GoldForGorax_condition()
{
	if((Daron_Spende > 500) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_DARON_GoldForGorax_info()
{
	AI_Output(other,self, " DIA_DARON_GoldForGorax_01_00 " );	// Is there anything I can do for you?
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_01 " );	// Your desire to help the servants of Innos is commendable, my son, and I will gladly trust you.
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_02 " );	// For by your deeds you have already proved that you are worthy of it.
	AI_Output(other,self, " DIA_DARON_GoldForGorax_01_03 " );	// Glad to hear it.
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_04 " );	// So, I need to deliver the collected donations to the monastery.
	AI_Output(other,self, " DIA_DARON_GoldForGorax_01_05 " );	// Do you want me to accompany you?
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_06 " );	// Unfortunately, I can't leave town right now.
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_07 " );	// So I'll just give you a donation bag and you'll take it to the monastery.
	B_GiveInvItems(self,other,itmi_daron_suma,1);
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_08 " );	// Give it to Master Gorax there. In addition to winemaking, he keeps track of the funds in our treasury.
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_09 " );	// Do you understand?
	AI_Output(other,self,"DIA_DARON_GoldForGorax_01_10");	//Конечно.
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_11 " );	// Good. I hope you deliver the gold safe and sound.
	AI_Output(self,other, " DIA_DARON_GoldForGorax_01_12 " );	// (seriously) And don't try to pocket the gold for yourself and run away. By this you will incur the wrath of Innos!
	Log_CreateTopic(TOPIC_DARON_GIVEGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DARON_GIVEGOLD,LOG_Running);
	MIS_DARON_GIVEGOLD = LOG_Running;
	B_LogEntry( TOPIC_DARON_GIVEGOLD , " Daron has instructed me to deliver a donation bag to Master Gorax's monastery. " );
	Wld_InsertNpc(bdt_darongivegold_mis_1,"NW_FOREST_CONNECT_MONASTERY");
	Wld_InsertNpc(bdt_darongivegold_mis_2,"NW_PATH_TO_MONASTERY_03");
	Wld_InsertNpc(bdt_darongivegold_mis_3,"NW_PATH_TO_MONASTERY_05");
	Wld_InsertNpc(bdt_darongivegold_mis_4,"NW_PATH_TO_MONASTERY_03");
	Wld_InsertNpc(bdt_darongivegold_mis_5,"NW_PATH_TO_MONASTERY_02");
};


instance DIA_DARON_GoldForGoraxOk(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_GoldForGoraxOk_condition;
	information = DIA_DARON_GoldForGoraxOk_info;
	permanent = FALSE;
	description = " I gave the donation bag to Master Gorax. " ;
};

func int DIA_DARON_GoldForGoraxOk_condition()
{
	if(MIS_DARON_GIVEGOLD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_DARON_GoldForGoraxOk_info()
{
	AI_Output(other,self, " DIA_DARON_GoldForGoraxOk_01_01 " );	// I handed over the donation bag to Master Gorax.
	AI_Output(self,other, " DIA_DARON_GoldForGoraxOk_01_02 " );	// Yes, I already know about it. Good job!
	AI_Output(self,other, " DIA_DARON_GoldForGoraxOk_01_03 " );	// But, most importantly, you did not succumb to the lure of gold. This cannot but inspire respect!
	AI_Output(self,other, " DIA_DARON_GoldForGoraxOk_01_04 " );	// And lest you think me ungrateful, here, take this scroll as your reward.
	AI_Output(self,other, " DIA_DARON_GoldForGoraxOk_01_05 " );	// I'm sure you'll find a worthy use for it.
	AI_Output(other,self, " DIA_DARON_GoldForGoraxOk_01_06 " );	// Thank you.

	if (Npc_IsDead(bdt_darongivegold_mis_1) && Npc_IsDead(bdt_darongivegold_mis_2) && Npc_IsDead(bdt_darongivegold_mis_3) && Npc_IsDead(bdt_darongivegold_mis_4) && Npc_IsDead(bdt_darongivegold_mis_5))
	{
		B_GiveInvItems(self,other,ItSc_Firerain,1);
	}
	else
	{
		B_GiveInvItems(self,other,ItSc_HarmUndead,1);
	};
};

instance DIA_DARON_PICKPOCKET(C_Info)
{
	npc = KDF_511_Daron;
	nr = 900;
	condition = DIA_DARON_pickpocket_condition;
	information = DIA_DARON_pickpocket_info;
	permanent = TRUE;
	description = " (Try to steal his rune) " ;
};

func int DIA_DARON_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MIS_RagnarRune == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_DARON_pickpocket_info()
{
	Info_ClearChoices(DIA_DARON_pickpocket);
	Info_AddChoice(DIA_DARON_pickpocket,Dialog_Back,DIA_DARON_pickpocket_back);
	Info_AddChoice(DIA_DARON_pickpocket,DIALOG_PICKPOCKET,DIA_DARON_pickpocket_doit);
};

func void DIA_DARON_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		B_GiveInvItems(self,other,ItRu_FireBolt,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_DARON_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_DARON_pickpocket_back()
{
	Info_ClearChoices(DIA_DARON_pickpocket);
};
Footer
