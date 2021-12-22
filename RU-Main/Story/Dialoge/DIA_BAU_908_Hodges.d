var int hosharpsword;

instance DIA_Hodges_Kap1_EXIT (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999 ;
	condition = DIA_Hodges_Kap1_EXIT_Condition;
	information = DIA_Hodges_Kap1_EXIT_Info;
	permanent = TRUE ;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap1_EXIT_Condition ()
{
	if (Kapitel <=  1 )
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_Kap1_EXIT_Info ()
{
	AI_StopProcessInfos (self);
};


instance DIA_Hodges_HALLO (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 1 ;
	condition = DIA_Hodges_HALLO_Condition;
	information = DIA_Hodges_HALLO_Info;
	permanent = FALSE ;
	important = TRUE ;
};


func int DIA_Hodges_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk) && (self.aivar [AIV_TalkedToPlayer] ==  FALSE ) && ((Kapitel ! =  3 ) || (MIS_RescueBennet ==  LOG_SUCCESS )))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_HALLO_Info ()
{
	AI_Output (other, self, " DIA_Hodges_HALLO_15_00 " );	// Hi I'm new here.
	AI_Output (self, other, " DIA_Hodges_HALLO_03_01 " );	// Don't get me wrong, but I'm not in the mood to talk right now - I'm completely exhausted.
	AI_Output (other, self, " DIA_Hodges_HALLO_15_02 " );	// You're awfully busy, huh?
	AI_Output (self, other, " DIA_Hodges_HALLO_03_03 " );	// You have no idea. Bennett makes so many weapons that I barely have time to polish them.
};


instance DIA_Hodges_TellAboutFarm (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2 ;
	condition = DIA_Hodges_TellAboutFarm_Condition;
	information = DIA_Hodges_TellAboutFarm_Info;
	permanent = FALSE ;
	description = " What can you tell me about this farm? " ;
};


func int DIA_Hodges_TellAboutFarm_Condition ()
{
	if ((Kapitel ! =  3 ) || (MIS_RescueBennet ==  LOG_SUCCESS ))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_TellAboutFarm_Info ()
{
	AI_Output (other, self, " DIA_Hodges_TellAboutFarm_15_00 " );	// What can you tell me about this farm?
	AI_Output (self, other, " DIA_Hodges_TellAboutFarm_03_01 " );	// This is Onar's farm.
	AI_Output (self, other, " DIA_Hodges_TellAboutFarm_03_02 " );	// This large building is his home. He freed one wing for the mercenaries.
	AI_Output (self, other, " DIA_Hodges_TellAboutFarm_03_03 " );	// And we, the farmers, had to move to the barn.
	AI_Output (self, other, " DIA_Hodges_TellAboutFarm_03_04 " );	// (hastily) But I don't mind at all, it's good that there are people who can protect the farm.
	if (Npc_GetDistToWP (self, " NW_BIGFARM_SMITH_SHARP " ) <  500 )
	{
		AI_Output (self, other, " DIA_Hodges_TellAboutFarm_03_05 " );	// This building is a kitchen.
	}
	else
	{
		AI_Output (self, other, " DIA_Hodges_TellAboutFarm_03_06 " );	// There is a smithy in front of the kitchen.
	};
	AI_Output (self, other, " DIA_Hodges_TellAboutFarm_03_07 " );	// You might get lucky and Tekla will cook you something.
};


instance DIA_Hodges_AboutSld (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2 ;
	condition = DIA_Hodges_AboutSld_Condition;
	information = DIA_Hodges_AboutSld_Info;
	permanent = FALSE ;
	description = " What about mercenaries? " ;
};


func int DIA_Hodges_AboutSld_Condition ()
{
	if ((hero.guild ! =  GIL_SLD ) && (hero.guild ! =  GIL_DJG ) && ((Kapitel ! =  3 ) || (MIS_RescueBennet ==  LOG_SUCCESS )))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_AboutSld_Info ()
{
	AI_Output (other, self, " DIA_Hodges_AboutSld_15_00 " );	// What about the mercenaries?
	AI_Output (self, other, " DIA_Hodges_AboutSld_03_01 " );	// Onar hired them to keep the militia out.
	AI_Output (self, other, " DIA_Hodges_AboutSld_03_02 " );	// But they also guard the farm, our sheep and the farmers themselves.
	AI_Output (self, other, " DIA_Hodges_AboutSld_03_03 " );	// So don't even think about stealing anything or rummaging in someone else's chest.
	AI_Output (self, other, " DIA_Hodges_AboutSld_03_04 " );	// They're just waiting for the chance to kick some ass.
};


instance DIA_Hodges_TRADE (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2 ;
	condition = DIA_Hodges_TRADE_Condition;
	information = DIA_Hodges_TRADE_Info;
	permanent = TRUE ;
	description = " Can I buy a weapon from you? " ;
	trade = TRUE ;
};


func int DIA_Hodges_TRADE_Condition ()
{
	if (Wld_IsTime ( 7 , 0 , 19 , 0 ))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_TRADE_Info ()
{
	if (C_BodyStateContains (self, BS_SIT ))
	{
		AI_Standup (self);
		AI_TurnToNPC (self, other);
	};

	AI_Output (other, self, " DIA_Hodges_TRADE_15_00 " );	// Can I buy a weapon from you?
	AI_Output (self, other, " DIA_Hodges_TRADE_03_01 " );	// I don't have much. We take almost all swords and axes to Onar's house.
	Npc_RemoveInvItems (self, itmiswordblade_1, Npc_HasItems (self, itmiswordblade_1));
};


instance DIA_Hodges_Kap2_EXIT (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999 ;
	condition = DIA_Hodges_Kap2_EXIT_Condition;
	information = DIA_Hodges_Kap2_EXIT_Info;
	permanent = TRUE ;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap2_EXIT_Condition ()
{
	if (Kapitel ==  2 )
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info ()
{
	AI_StopProcessInfos (self);
};


instance DIA_Hodges_Kap3_EXIT (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999 ;
	condition = DIA_Hodges_Kap3_EXIT_Condition;
	information = DIA_Hodges_Kap3_EXIT_Info;
	permanent = TRUE ;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap3_EXIT_Condition ()
{
	if (Kapitel ==  3 )
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info ()
{
	AI_StopProcessInfos (self);
};


instance DIA_Hodges_DontWork (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 31 ;
	condition = DIA_Hodges_DontWork_Condition;
	information = DIA_Hodges_DontWork_Info;
	permanent = FALSE ;
	description = " Why aren't you working? " ;
};


func int DIA_Hodges_DontWork_Condition ()
{
	if ((Kapitel ==  3 ) && (MIS_RescueBennet ! =  LOG_SUCCESS ) && (DarkPathStart ==  FALSE ))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_DontWork_Info ()
{
	AI_Output (other, self, " DIA_Hodges_DontWork_15_00 " );	// Why aren't you working?
	AI_Output (self, other, " DIA_Hodges_DontWork_03_01 " );	// You haven't heard yet? Bennett was arrested by the paladins.
	MIS_RescueBennet = LOG_Running;
	Log_CreateTopic (TOPIC_RescueBennet, LOG_MISSION );
	Log_SetTopicStatus (TOPIC_RescueBennet, LOG_Running);
	B_LogEntry (TOPIC_RescueBennet, " Blacksmith Bennett arrested by paladins in town. " );
};


instance DIA_Hodges_BennetAndSLD (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 33 ;
	condition = DIA_Hodges_BennetAndSLD_Condition;
	information = DIA_Hodges_BennetAndSLD_Info;
	permanent = FALSE ;
	description = " How did the mercenaries on the farm react? " ;
};


func int DIA_Hodges_BennetAndSLD_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Hodges_DontWork) && (MIS_RescueBennet ! =  LOG_SUCCESS ))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_BennetAndSLD_Info ()
{
	AI_Output (other, self, " DIA_Hodges_BennetAndSLD_15_00 " );	// How did the mercenaries on the farm react?
	AI_Output (self, other, " DIA_Hodges_BennetAndSLD_03_01 " );	// Naturally, I don't know what they are planning, but a lot of them are furious.
	AI_Output (other, self, " DIA_Hodges_BennetAndSLD_15_02 " );	// That's understandable.
	AI_Output (self, other, " DIA_Hodges_BennetAndSLD_03_03 " );	// If they had the power to decide, they would attack the city today to free Bennett.
	AI_Output (self, other, " DIA_Hodges_BennetAndSLD_03_04 " );	// Talk to Lee, maybe you can help with something.
};

instance DIA_Hodges_WhatHappened (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 3 ;
	condition = DIA_Hodges_WhatHappened_Condition;
	information = DIA_Hodges_WhatHappened_Info;
	permanent = TRUE ;
	description = " Teach me to sharpen my weapon. (Training Points: 1, Cost: 250 gold) " ;
};

func int DIA_Hodges_WhatHappened_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Hodges_HALLO) && ( KNOWHOWSHARPWEAPON  ==  FALSE ) && Wld_IsTime ( 7 , 0 , 19 , 0 ))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_WhatHappened_Info ()
{
	if ((other.lp > =  1 ) && (Npc_HasItems (other, ItMi_Gold) > =  250 ))
	{
		KNOWHOWSHARPWEAPON = TRUE ;
		other.lp = other.lp -  1 ;
		RankPoints = RankPoints +  1 ;
		Npc_RemoveInvItems (other, ItMi_Gold, 250 );
		AI_Output (self, other, " DIA_Hodges_WhatHappened_03_05 " );	// Ok, watch carefully how this is done. All you need is either a rusty or self-forged weapon.

		if ( ! C_BodyStateContains (self, BS_MOBINTERACT_INTERRUPT ) && Wld_IsMobAvailable (self, " BSSHARP " ))
		{
			AI_SetWalkMode (self, NPC_WALK );
			AI_GotoWP (self, " NW_BIGFARM_SMITH_SHARP " );
			AI_AlignToWP (self);
			AI_UseMob (self, " BSSHARP " , 5 );
			AI_Output (self, other, " DIA_Hodges_WhatHappened_03_07 " );	// You take a sword, press it down with a blank blade ...
			AI_Output (self, other, " DIA_Hodges_WhatHappened_03_08 " );	// ... and smoothly drive along the whetstone to the left and right ...
			AI_Output (self, other, " DIA_Hodges_WhatHappened_03_09 " );	// ... the blank of the blade is needed for a more even pressing of the sword to the stone ...
			AI_Output (self, other, " DIA_Hodges_WhatHappened_03_10 " );	// ... so that the sword does not overheat and does not bend when sharpening.
			AI_UseMob (self, " BSSHARP " , - 1 );
			B_TurnToNpc (self, other);
		};

		AI_Print (PRINT_LearnSharp);
		Snd_Play ( " LevelUP " );
	}
	else  if (other.lp <  1 )
	{
		AI_Print (PRINT_NotEnoughLearnPoints);
		B_Say (self, other, " $ NOLEARNNOPOINTS " );
		AI_StopProcessInfos (self);
	}
	else  if (Npc_HasItems (other, ItMi_Gold) <  250 )
	{
		AI_Print (Print_NotEnoughGold);
		AI_Output (self, other, " DIA_Hodges_WhatHappened_03_90 " );	// You don't have enough gold to train! Come back later.
		AI_StopProcessInfos (self);
	};
};

instance DIA_Hodges_Kap4_EXIT (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999 ;
	condition = DIA_Hodges_Kap4_EXIT_Condition;
	information = DIA_Hodges_Kap4_EXIT_Info;
	permanent = TRUE ;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap4_EXIT_Condition ()
{
	if (Kapitel ==  4 )
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info ()
{
	AI_StopProcessInfos (self);
};


instance DIA_Hodges_Kap5_EXIT (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999 ;
	condition = DIA_Hodges_Kap5_EXIT_Condition;
	information = DIA_Hodges_Kap5_EXIT_Info;
	permanent = TRUE ;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap5_EXIT_Condition ()
{
	if (Kapitel > =  5 )
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info ()
{
	AI_StopProcessInfos (self);
};


instance DIA_Hodges_PICKPOCKET (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 900 ;
	condition = DIA_Hodges_PICKPOCKET_Condition;
	information = DIA_Hodges_PICKPOCKET_Info;
	permanent = TRUE ;
	description = PICKPOCKET_COMM ;
};


func int DIA_Hodges_PICKPOCKET_Condition ()
{
	return  C_Beklauen ( 15 , 10 );
};

func void DIA_Hodges_PICKPOCKET_Info ()
{
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
	Info_AddChoice (DIA_Hodges_PICKPOCKET, Dialog_Back, DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Hodges_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};

func void DIA_Hodges_PICKPOCKET_BACK ()
{
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};


instance DIA_Hodges_DarkWeb (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 32 ;
	condition = DIA_Hodges_DarkWeb_Condition;
	information = DIA_Hodges_DarkWeb_Info;
	permanent = FALSE ;
	description = " Bennett said you went to town with him when he was arrested. " ;
};

func int DIA_Hodges_DarkWeb_Condition ()
{
	if ((MIS_DarkWeb == LOG_Running) && (HodjesTalk ==  TRUE ))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_DarkWeb_Info ()
{
	AI_Output (other, self, " DIA_Hodges_DarkWeb_01_00 " );	// Bennett said you went to town with him when he was arrested.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_01_01 " );	// Yes it is. Bennett ran out of steel billets and we decided to buy some of them from Hakon the trader.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_01_02 " );	// Hakon's? But what about the prohibition of paladins to trade with the farm?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_01_03 " );	// He and Bennett are old acquaintances! So, sometimes Hakon still sells him the necessary material for the forge.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_01_04 " );	// Why are you actually asking about this?
	AI_Output (other, self, " DIA_Hodges_DarkWeb_01_05 " );	// I'm asking questions. Where were you when he was arrested?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_01_06 " );	// Me? Ummm ... Drank schnapps in Coragon's tavern. Sang some songs...
	AI_Output (other, self, " DIA_Hodges_DarkWeb_01_07 " );	// How did you manage to escape the militia?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_01_08 " );	// When I heard that Bennett had been arrested for killing a paladin, I went straight to the farm.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_01_09 " );	// The guards at the gate didn't stop me. Apparently it was enough for them that they grabbed Bennett.
	B_LogEntry (TOPIC_DarkWeb, " According to Hodges, he was drinking schnapps in Coragon's tavern when Bennett was arrested. Upon learning of this, Hodges went to the farm, the city guards did not detain him, believing that the real killer of the paladin Lothar had already been caught. But I have a feeling that Hodges is hiding something. I must try to somehow put pressure on him so that he speaks... " );
};

instance DIA_Hodges_DarkWeb_Done (C_Info)
{
	npc = BAU_908_Hodges;
	nr = 32 ;
	condition = DIA_Hodges_DarkWeb_Done_Condition;
	information = DIA_Hodges_DarkWeb_Done_Info;
	permanent = TRUE ;
	description = " You're lying! " ;
};

func int DIA_Hodges_DarkWeb_Done_Condition ()
{
	if ((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo (other, DIA_Hodges_DarkWeb) ==  TRUE ) && (HodjesBookGive ==  FALSE ))
	{
		return  TRUE ;
	};
};

func void DIA_Hodges_DarkWeb_Done_Info ()
{
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_01_00 " );	// You're lying!
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_01_01 " );	// What?!
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_01_02 " );	// Lord Hagen told me that they were chasing a man who came to town with Bennett.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_01_03 " );	// But he managed to escape from them. I'm pretty sure that person was you!
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_01_04 " );	// What nonsense! It could have been anyone ... I have nothing to do with it.
	Info_ClearChoices (DIA_Hodges_DarkWeb_Done);
	Info_AddChoice (DIA_Hodges_DarkWeb_Done, " We'll get back to this conversation. " , DIA_Hodges_DarkWeb_Done_BACK);

	if (RhetorikSkillValue [ 1 ] > =  50 )
	{
		Info_AddChoice (DIA_Hodges_DarkWeb_Done, " Hey, this is very important. " , DIA_Hodges_DarkWeb_Done_DoIt);
	};
};

func void DIA_Hodges_DarkWeb_Done_BACK ()
{
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_BACK_01_00 " );	// We'll come back to this conversation later.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_BACK_01_01 " );	// Like hell we will!
	AI_StopProcessInfos (self);
};

func void DIA_Hodges_DarkWeb_Done_DoIt ()
{
	B_GivePlayerXP ( 500 );
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_00 " );	// Look, this is very important.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_01 " );	// Lord Hagen is furious! He is looking for Lothar's killer and sooner or later he will get to you.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_02 " );	// And then no one will help you. Neither Li nor his mercenaries.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_03 " );	// So, either you tell me how it really was, or I'll tell Lord Hagen that it was you who killed his paladin.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_04 " );	// What?! You're bluffing!
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_05 " );	// I'll do it, you'll see.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_06 " );	// Damn it! Okay, Beliar is with you. I'll tell you everything I know.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_07 " );	// But promise not to tell anyone about this.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_08 " );	// I'm not promising shit. Start talking.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_09 " );	// I did drink that evening in Caragon's and after a few hours of fun I felt like taking a piss.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_10 " );	// Then I went to the southern gate of the city, found a secluded bush and was just about to relieve myself a little, when suddenly ...
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_11 " );	// What?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_12 " );	// ... not far from me I saw a paladin and some other strange type in a dark robe. He looked like a magician.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_13 " );	// They stood next to each other and seemed to be talking about something.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_14 " );	// Then the second one took out a scroll and began to read it, uttering words completely unfamiliar to me.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_15 " );	// Yet, the still made my skin crawl!
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_16 " );	// What were the words?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_17 " );	// Oh ... I don't remember anymore, but it seems he was casting some kind of magic spell.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_18 " );	// What about the paladin?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_19 " );	// At first he stood rooted to the spot. I was even a little surprised at his calm reaction to what was happening.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_20 " );	// And then, with a look of incredible effort, he abruptly knocked that scroll out of the wizard's hands.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_21 " );	// But apparently it was too late. The wizard threw his hands up and the paladin's entire body burst into flames!
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_22 " );	// He fell to the ground and stopped moving.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_23 " );	// What about the Mage?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_24 " );	// He seemed to dissolve. One moment he was there, the next, POOF, gone.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_25 " );	// What did you do?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_26 " );	// Pissed myself out of fear! As I calmed down, I went up to the paladin lying on the ground. He was one crispy critter.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_27 " );	// I picked up the scroll that the killer had dropped and wanted to check it out. 
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_28 " );	// But at that moment the city guards came running! They tried to grab me, but I gave them the slip.
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_29 " );	// That's all. Then I drank for three days at Tekla's tavern. I could'nt calm down ...
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_30 " );	// That's quite a story!
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_31 " );	// You did the right thing to tell me everything. You're lucky you didn't try to read that scroll.
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_32 " );	// It could have easily killed you if it had any lingering energies attached to it. By the way, do you still have it?
	AI_Output (self, other, " DIA_Hodges_DarkWeb_Done_DoIt_01_33 " );	// Yeah, I held on to it. Please take it. It terrifies me. But I was too afraid to throw it away.
	B_GiveInvItems (self, other, ItMi_DarkScroll, 1 );
	AI_Output (other, self, " DIA_Hodges_DarkWeb_Done_DoIt_01_34 " );	// Thank you.
	HodjesBookGive = TRUE ;
	B_LogEntry (TOPIC_DarkWeb, " I was able to persuade Hodges to tell me the whole truth. Apparently, Lothar was killed by a strange mage in dark robes using a flame spell. That is why there were no signs of a struggle on the ground. Lothar was immobilised at first but the mage underestimated the will of the paladin, who was able to break the arcane bonds and knock the spell scroll out of the attacker's hands. But it was already too late. Now I need to think about what to do with this scroll ... " );
	AI_StopProcessInfos (self);
};
