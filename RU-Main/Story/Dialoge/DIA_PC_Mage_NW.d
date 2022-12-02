

instance DIA_MiltenNW_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_EXIT_Condition;
	information = DIA_MiltenNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP3_EXIT_Condition;
	information = DIA_MiltenNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_Hello(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_Hello_Condition;
	information = DIA_MiltenNW_KAP3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenNW_KAP3_Hello_Condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Hello_Info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_00 " );	// I can't believe this. Have you really become a paladin?
		AI_Output(other,self, " DIA_MiltenNW_KAP3_Hello_15_01 " );	// Looks like it.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_02 " );	// If people like you become paladins, then Beliar's henchmen need to keep their eyes open.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_03 " );	// A handful of orcs is no problem for you.
		AI_Output(other,self, " DIA_MiltenNW_KAP3_Hello_15_04 " );	// Orcs aren't the only problem.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_05 " );	// I know, but it's still good to have you on our side.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//Ну да.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_07 " );	// What are you doing here in the monastery? Let me guess. You want to be initiated into the art of magic.
		AI_Output(other,self, " DIA_MiltenNW_KAP3_Hello_15_08 " );	// Possibly.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_09 " );	// I knew it - it's best for you to talk to Marduk, he's in charge of you paladins. You will find him in front of the chapel.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_10 " );	// I see that the rumors are true.
		AI_Output(other,self, " DIA_MiltenNW_KAP3_Hello_15_11 " );	// What are the rumors?
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_12 " );	// That you joined the dragon hunters.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_13 " );	// Well, you've never been a church person. However, you are fighting for our common cause, and that is all that matters.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//Это все?
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_15 " );	// I'm glad, of course, and judging by the way you look, all orcs should be afraid of you.
		AI_Output(other,self, " DIA_MiltenNW_KAP3_Hello_15_16 " );	// It's not just the orcs.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_17 " );	// I know, but they still cause problems. And you are an important bird.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Hello_03_18 " );	// You defeated the Sleeper. We may all need your help one day.
		AI_Output(other,self, " DIA_MiltenNW_KAP3_Hello_15_19 " );	// Oh, okay.
	};
};

instance DIA_MiltenNW_Pashal(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_Pashal_Condition;
	information = DIA_MiltenNW_Pashal_Info;
	permanent = FALSE;
	description = " I have one question for you. " ;
};

func int DIA_MiltenNW_Pashal_Condition()
{
	if((MIS_PashalQuest == LOG_Running) && (PashalQuestMageStep == TRUE) && (PashalQuestCaveStep == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Pashal_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Pashal_01_00 " );	// I have one question for you.
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_01 " );	// Which one?
	AI_Output(other,self, " DIA_MiltenOW_Pashal_01_02 " );	// Have you heard anything about a certain magical artifact that absorbed all the power of this world?
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_03 " );	// Hmmm... (thoughtfully) Yes! I remember something... I think Master Corristo once mentioned this.
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_04 " );	// He even planned to use this artifact to destroy the magic barrier!
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_05 " );	// But since the artifact was never found, all this remained only in words.
	AI_Output(other,self, " DIA_MiltenOW_Pashal_01_06 " );	// What exactly did you do?
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_07 " );	// As far as I know, Corristo sent one of the mages to find him.
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_08 " );	// But he never came back! No further attempts were made to find him.
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_09");	//Ясно.
	PashalQuestCaveStep = TRUE;
	PashalQuestCaveStepIns = TRUE;
	B_LogEntry(TOPIC_PashalQuest, " Milten told me that the Fire Mages tried to find this artifact and even sent one of the Mages to look for it. But they did not succeed, and that mage disappeared altogether. " );
};

instance DIA_MiltenNW_Monastery(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_Monastery_Condition;
	information = DIA_MiltenNW_Monastery_Info;
	permanent = FALSE;
	description = " How did you manage to get to the monastery so quickly? " ;
};


func int DIA_MiltenNW_Monastery_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Monastery_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_Monastery_15_00 " );	// How did you get to the monastery so quickly?
	AI_Output(self,other, " DIA_MiltenNW_Monastery_03_01 " );	// Where does this question come from? I slipped through the Passage and headed straight for the monastery.
	AI_Output(self,other, " DIA_MiltenNW_Monastery_03_02 " );	// I must admit that it was not easy to get away from all the monsters that settled this side of the valley, but it turned out to be less problems than I expected.
};


instance DIA_MiltenNW_FourFriends(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_FourFriends_Condition;
	information = DIA_MiltenNW_FourFriends_Info;
	permanent = FALSE;
	description = " Do you know where the others are? " ;
};


func int DIA_MiltenNW_FourFriends_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_FourFriends_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_FourFriends_15_00 " );	// Do you know where the others are?
	if(Npc_IsDead(PC_Fighter_NW_vor_DJG) == FALSE)
	{
		AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_01 " );	// Gorn doesn't seem to have changed a bit since his imprisonment in Garonda.
		if(MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output(other,self, " DIA_MiltenNW_FourFriends_15_02 " );	// How did he manage to get out?
			AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_03 " );	// I had to lie to Garond, so he dropped all charges.
			AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_04 " );	// But that's just between us, okay?
		};
		AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_05 " );	// In any case, he wanted to go to Lee and see what was happening on the farm.
		AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_06 " );	// After starving in the dungeon, he's probably trying to make up for his weight loss and testing out the mercenaries' pantry.
	}
	else
	{
		AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_07 " );	// Gorn is not to blame.
	};
	if(Npc_IsDead(PC_Thief_NW) == FALSE)
	{
		AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_08 " );	// Diego was mumbling something about payback. But I have no idea what he meant by that.
		AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_09 " );	// But I suspect he's in town now. You know him - he is always where you can profit.
	}
	else
	{
		AI_Output(self,other, " DIA_MiltenNW_FourFriends_03_10 " );	// Diego bought Gorn out - looks like the Barrier changed him too.
	};
};


instance DIA_MiltenNW_KAP3_Entry(C_Info)
{
	npc = PC_Mage_NW;
	nr = 32;
	condition = DIA_MiltenNW_KAP3_Entry_Condition;
	information = DIA_MiltenNW_KAP3_Entry_Info;
	permanent = TRUE;
	description = " I need to get to the monastery. It's urgent! " ;
};


func int DIA_MiltenNW_KAP3_Entry_Condition()
{
	if ((Chapter ==  3 ) && (hero.guild !=  GIL_KDF ) && (MiltenNW_GivesMonasteryKey ==  FALSE ) &&  ! Npc_HasItems(other,ItKe_Innos_MY));
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Entry_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_KAP3_Entry_15_00 " );	// I need to get to the monastery. This is urgent!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Entry_03_01 " );	// Yes, of course! Here is the key.
		CreateInvItems(self,ItKe_Innos_MIS,1);
		B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
		MiltenNW_GivesMonasteryKey = TRUE ;
		CanEnterKloster = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Entry_03_02 " );	// I can't let you into the monastery. I'll be in trouble with the High Council.
		AI_Output(self,other, " DIA_MiltenNW_KAP3_Entry_03_03 " );	// Without the permission of the archmages, I can't let anyone into the monastery.
		Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,Dialog_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry, " This is very important! " ,DIA_MiltenNW_KAP3_Entry_Important);
		if(Npc_HasItems(other,ItWr_PermissionToWearInnosEye_MIS) >= 1)
		{
			Info_AddChoice(DIA_MiltenNW_KAP3_Entry, " I have a letter from Lord Hagen. " ,DIA_MiltenNW_KAP3_Entry_Permit);
		};
	};
};

func void DIA_MiltenNW_KAP3_Entry_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Important()
{
	AI_Output(other,self, " DIA_MiltenNW_KAP3_Entry_Important_15_00 " );	// But it's important!
	AI_Output(self,other, " DIA_MiltenNW_KAP3_Entry_Important_03_01 " );	// This won't help. The pyrocar will blow my head off for this.
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Permit()
{
	AI_Output(other,self, " DIA_MiltenNW_KAP3_Entry_Permit_15_00 " );	// I have a letter from Lord Hagen.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Покажи.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_MiltenNW_KAP3_Entry_Permit_03_02 " );	// (hesitantly) Good. Here is the key to the monastery. You will find the Pyrocar in the church.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	MiltenNW_GivesMonasteryKey = TRUE ;
	CanEnterKloster = TRUE;
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};


instance DIA_MiltenNW_KAP3_NovizenChase (C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information = DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent = FALSE;
	description = " Do you know where Pedro is? " ;
};


func int DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	if ((Chapter ==  3 ) && (MY_NovizenChase == LOG_Running) && (MY_SCKnowsInnosEyeIsBroken ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_NovizenChase_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_KAP3_NovizenChase_15_00 " );	// Do you know where Pedro is?
	AI_Output(self,other, " DIA_MiltenNW_KAP3_NovizenChase_03_01 " );	// Do you think I'd be standing here if I knew where this traitor was hiding?
	AI_Output(self,other, " DIA_MiltenNW_KAP3_NovizenChase_03_02 " );	// He must pay for what he did. I hope we can get the Eye back.
	AI_Output(self,other, " DIA_MiltenNW_KAP3_NovizenChase_03_03 " );	// You must help us. Find him and bring back the Eye of Innos.
};


instance DIA_MiltenNW_KAP3_Perm(C_Info)
{
	npc = PC_Mage_NW;
	nr = 39;
	condition = DIA_MiltenNW_KAP3_Perm_Condition;
	information = DIA_MiltenNW_KAP3_Perm_Info;
	permanent = FALSE;
	description = " Do you know anything about people in black cassocks? " ;
};


func int DIA_MiltenNW_KAP3_Perm_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Perm_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_KAP3_Perm_15_00 " );	// Do you know anything about people in black cassocks?
	AI_Output(self,other, " DIA_MiltenNW_KAP3_Perm_03_01 " );	// No, but I have a bad feeling about them.
	AI_Output(self,other, " DIA_MiltenNW_KAP3_Perm_03_02 " );	// Be careful if you run into them.
};


instance DIA_MiltenNW_KAP4_EXIT (C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP4_EXIT_Condition;
	information = DIA_MiltenNW_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_BEFOREDRAGONS(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_beforedragons_condition;
	information = dia_miltennw_beforedragons_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_beforedragons_condition()
{
	if((Kapitel == 4) && (MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (MIS_AllDragonsDead == FALSE) && (Npc_HasItems(self,itke_miltenkey_nw) > 0))
	{
		return TRUE;
	};
};

func void dia_miltennw_beforedragons_info()
{
	AI_Output(self,other, " DIA_MiltenNW_BeforeDragons_03_00 " );	// Going for dragons?
	AI_Output(other,self, " DIA_MiltenNW_BeforeDragons_15_01 " );	// Something like that.
	AI_Output(self,other, " DIA_MiltenNW_BeforeDragons_03_02 " );	// Take this key from the chest in the castle chapel.
	AI_Output(self,other, " DIA_MiltenNW_BeforeDragons_03_03 " );	// I don't think I'll need it anymore. There is not much useful there, but there is nothing more to help me.
	B_GiveInvItems(self,other,itke_miltenkey_nw,1);
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP4_PERM(C_Info)
{
	npc = PC_Mage_NW;
	nr = 49;
	condition = DIA_MiltenNW_KAP4_PERM_Condition;
	information = DIA_MiltenNW_KAP4_PERM_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_MiltenNW_KAP4_PERM_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_PERM_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_KAP4_PERM_15_00 " );	// Any news?
	AI_Output(self,other, " DIA_MiltenNW_KAP4_PERM_03_01 " );	// I should be asking you this. We are all very concerned here.
	AI_Output(self,other, " DIA_MiltenNW_KAP4_PERM_03_02 " );	// The High Council tries to predict the enemy's next move.
	AI_Output(other,self, " DIA_MiltenNW_KAP4_PERM_15_03 " );	// Anything else?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_MiltenNW_KAP4_PERM_03_04 " );	// There have been more and more reports of orc attacks lately, even outside of the Valley of Mines.
		AI_Output(self,other, " DIA_MiltenNW_KAP4_PERM_03_05 " );	// I don't like this - I don't think we have much time left.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_MiltenNW_KAP4_PERM_03_06 " );	// A farmer has reported scaly creatures near his farm.
		AI_Output(self,other, " DIA_MiltenNW_KAP4_PERM_03_07 " );	// I don't know what this all means, but I think the enemy is up to something.
	}
	else if(MIS_FindTheObesessed == LOG_Running)
	{
		AI_Output(self,other, " DIA_MiltenNW_KAP4_PERM_03_08 " );	// We're getting more and more reports of possessed people. The enemy has become strong, much stronger than I expected.
	}
	else
	{
		AI_Output(self,other, " DIA_MiltenNW_KAP4_PERM_03_09 " );	// No, the situation is still very serious. All that remains for us is to believe in Innos.
	};
};


instance DIA_MiltenNW_KAP5_EXIT (C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP5_EXIT_Condition;
	information = DIA_MiltenNW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_AllDragonsDead(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_MiltenNW_AllDragonsDead_Condition;
	information = DIA_MiltenNW_AllDragonsDead_Info;
	permanent = FALSE;
	description = " I've killed all the dragons. " ;
};


func int DIA_MiltenNW_AllDragonsDead_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_AllDragonsDead_15_00 " );	// I killed all the dragons.
	AI_Output(self,other, " DIA_MiltenNW_AllDragonsDead_03_01 " );	// True? So there is still a glimmer of hope on the horizon. Now all that remains for us is to cut off the head of Evil.
	AI_Output(self,other, " DIA_MiltenNW_AllDragonsDead_03_02 " );	// If you really did this, we will definitely win this war.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Кому, мне?
	AI_Output(self,other, " DIA_MiltenNW_AllDragonsDead_03_04 " );	// To you, of course. Who else?

	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_MiltenNW_AllDragonsDead_03_05 " );	// We have to move as soon as possible, otherwise it might be too late.
	};
};

instance DIA_MiltenNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_KnowWhereEnemy_Condition;
	information = DIA_MiltenNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " I know where the enemy is hiding. " ;
};


func int DIA_MiltenNW_KnowWhereEnemy_Condition()
{
	if ((MY_SCKnowsWayToIrdorath ==  TRUE ) && (MiltenNW_IsOnBoard ==  FALSE ) && ( CAPTAINNORTHERDIAWAY  ==  FALSE ) && (SCGotCaptain ==  TRUE ))
	{
		return TRUE;
	};
};


var int SCToldMiltenHeKnowWhereEnemy;

func void DIA_MiltenNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_KnowWhereEnemy_15_00 " );	// I know where the enemy is hiding. On a small island not far from here.
	AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_03_01 " );	// This is our chance. We must go there immediately and destroy the evil once and for all.
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);

	if (Npc_IsDead(DiegoNW) ==  FALSE )
	{
		AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_03_02 " );	// Have you talked to Diego? I think he will agree to join you.
		B_LogEntry(Topic_Crew, " Diego can be helpful. He never stays long in one place. " );
	};
	if (Npc_IsDead(GornNW_nach_DJG) ==  FALSE )
	{
		AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_03_03 " );	// What about Gorn? Talk to him. I heard he came back from the Valley of Mines.
		B_LogEntry(Topic_Crew, "The Gorn can definitely come in handy. It never hurts to have such a seasoned fighter on your side. Perhaps he can train me. " );
	};
	if (Npc_IsDead(Lester) ==  FALSE )
	{
		AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_03_04 " );	// And don't forget Lester. If you don't get him out of the valley, he'll rot there.
		B_LogEntry(Topic_Crew, " If I don't take Lester with me, he'll never get out of this valley. " );
	};

	AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_03_05 " );	// I also see my role in all of this. I can boost your mana and help you create runes. When will we start?
	B_LogEntry(Topic_Crew, " If Milten travels with me, he can teach me how to make runes and increase my mana. " );

	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_MiltenNW_KnowWhereEnemy_15_06 " );	// Not so fast, I already have enough people.
		AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_03_07 " );	// You know, I'm always ready to go with you. If you change your mind, just tell me.
		AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_03_08 " );	// Good luck, may Innos not leave you without his protection.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy, " I can't find a place for you right now. " ,DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy, " Welcome aboard! " ,DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_MiltenNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_MiltenNW_KnowWhereEnemy_Yes_15_00 " );	// Welcome aboard!
	AI_Output(other,self, " DIA_MiltenNW_KnowWhereEnemy_Yes_15_01 " );	// It's best for us to meet at the port. Wait for me there.
	AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_Yes_03_02 " );	// Well, if you have everything ready, I'll be there
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	B_GivePlayerXP(XP_Crewmember_Success);
	Crewmember_Count = Crewmember_Count + 1;

	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};

	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};

func void DIA_MiltenNW_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_MiltenNW_KnowWhereEnemy_No_15_00 " );	// I can't find a place for you right now.
	AI_Output(self,other, " DIA_MiltenNW_KnowWhereEnemy_No_03_01 " );	// You know that I'm ready to go with you to the end. If you change your mind, just tell me.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};


instance DIA_MiltenNW_WhereCaptain(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_WhereCaptain_Condition;
	information = DIA_MiltenNW_WhereCaptain_Info;
	description = " Where can I find the captain? " ;
};


func int DIA_MiltenNW_WhereCaptain_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (SCToldMiltenHeKnowWhereEnemy == TRUE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_WhereCaptain_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_WhereCaptain_15_00 " );	// Where can I find the captain?
	AI_Output(self,other, " DIA_MiltenNW_WhereCaptain_03_01 " );	// Ask Jorgen. He's a sailor. He must still be in the monastery.
	AI_Output(self,other, " DIA_MiltenNW_WhereCaptain_03_02 " );	// But if he can't help, try asking around on the farms or in town, maybe there's someone who can pilot your ship.
	AI_Output(self,other, " DIA_MiltenNW_WhereCaptain_03_03 " );	// It's best to talk to Lee or ask around in Khorinis Harbor. Nothing else comes to my mind right now.
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain, " Maybe I should take Jorgen as captain with me. He should still be at the monastery. Although there are other candidates in the farms and town besides him. Maybe I should talk to Lee or ask around the harbor. " );
};


instance DIA_MiltenNW_LeaveMyShip(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_LeaveMyShip_Condition;
	information = DIA_MiltenNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = " I can't take you with me. " ;
};


func int DIA_MiltenNW_LeaveMyShip_Condition()
{
	if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_LeaveMyShip_15_00 " );	// I can't take you with me.
	AI_Output(self,other, " DIA_MiltenNW_LeaveMyShip_03_01 " );	// You know better who you need. If you change your mind, I'll wait for you at the monastery.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MiltenNW_StillNeedYou(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_StillNeedYou_Condition;
	information = DIA_MiltenNW_StillNeedYou_Info;
	permanent = TRUE;
	description = " I need you. " ;
};


func int DIA_MiltenNW_StillNeedYou_Condition()
{
	if((MiltenNW_IsOnBoard == LOG_OBSOLETE) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_StillNeedYou_15_00 " );	// I need you.
	AI_Output(self,other, " DIA_MiltenNW_StillNeedYou_03_01 " );	// I'm happy with your decision. Come on, we have no time to waste.
	AI_Output(self,other, " DIA_MiltenNW_StillNeedYou_03_02 " );	// I'm already on my way to the port. We meet there.
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;

	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};

	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_Teach(C_Info)
{
	npc = PC_Mage_NW;
	nr = 90;
	condition = DIA_MiltenNW_Teach_Condition;
	information = DIA_MiltenNW_Teach_Info;
	permanent = TRUE;
	description = " I want to learn new spells. " ;
};


func int DIA_MiltenNW_Teach_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Teach_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_Teach_15_00 " );	// I want to learn some spells.

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenNW_Teach);
		Info_AddChoice(DIA_MiltenNW_Teach,Dialog_Back,DIA_MiltenNW_Teach_BACK);

		if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,b_buildlearnstringforrunes(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenNW_Teach_Feuerball);
		};
		if((PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
		{
			Info_AddChoice(DIA_MiltenNW_Teach,b_buildlearnstringforrunes(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),DIA_MiltenNW_Teach_RapidFirebolt);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_MiltenNW_Teach_03_01 " );	// You still haven't reached the second circle of magic. I can't teach you anything.
	};
};

func void DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_Teach);
};

func void DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenNW_Teach_RapidFirebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidFirebolt);
};

instances DIA_MiltenNW_Mana (C_Info)
{
	npc = PC_Mage_NW;
	nr = 100;
	condition = DIA_MiltenNW_Mana_Condition;
	information = DIA_MiltenNW_Mana_Info;
	permanent = TRUE;
	description = " I want to increase my magical abilities. " ;
};


func int DIA_MiltenNW_Mana_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Mana_Info()
{
	AI_Output(other,self, " DIA_MiltenNW_Mana_15_00 " );	// I want to increase my magical abilities.
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MAX)
	{
		AI_Output(self,other, " DIA_MiltenNW_Mana_03_00 " );	// Your magical energy is great. Too big for me to enlarge it.
	};
	Info_ClearChoices(DIA_MiltenNW_Mana);
};

func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};


instance DIA_MILTENNW_CASSIA (C_Info)
{
	npc = PC_Mage_NW;
	nr = 40;
	condition = dia_miltennw_cassia_condition;
	information = dia_miltennw_cassia_info;
	permanent = FALSE;
	description = " Do you happen to know... " ;
};


func int dia_miltennw_cassia_condition()
{
	if((MIS_CASSIAGOLDCUP == LOG_Running) && (MILTENSAYABOUTOCKEY == FALSE) && (Npc_HasItems(other,ItKe_OC_Store) == 0) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_cassia_info()
{
	AI_Output(other,self, " DIA_MiltenNW_Cassia_15_00 " );	// Do you happen to know who has the key to the paladin warehouse in the castle?
	AI_Output(self,other, " DIA_MiltenNW_Cassia_03_01 " );	// What are you up to, robber? However, you're out of luck.
	AI_Output(self,other, " DIA_MiltenNW_Cassia_03_02 " );	// One fine day, Anghor got out of his kennel to breathe fresh air and sowed it somewhere.
	AI_Output(self,other, " DIA_MiltenNW_Cassia_03_03 " );	// I think that sooner or later Garond will order to break the door and force Angora to repair it.
	B_LogEntry( TOPIC_CASSIAGOLDCUP , " Angore lost his paladin store key while venturing out for some fresh air. " );
	MILTENSAYABOUTOCKEY = TRUE;
};


instance DIA_Mage_NW_PICKPOCKET(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_Mage_NW_PICKPOCKET_Condition;
	information = DIA_Mage_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mage_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 56 , 75 );
};

func void DIA_Mage_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,Dialog_Back,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};


instance DIA_MILTENNW_KAP6_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = dia_miltennw_kap6_exit_condition;
	information = dia_miltennw_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_miltennw_kap6_exit_condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void dia_miltennw_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_SOONBATTLE(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_soonbattle_condition;
	information = dia_miltennw_soonbattle_info;
	permanent = FALSE;
	description = " Are you aware of what happened? " ;
};


func int dia_miltennw_soonbattle_condition()
{
	if (( CAPITELORCATC  ==  TRUE ) && ( STOPBIGBATTLE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_miltennw_soonbattle_info()
{
	AI_Output(other,self, " DIA_MiltenNW_SoonBattle_01_00 " );	// Are you aware of what happened?
	AI_Output(self,other, " DIA_MiltenNW_SoonBattle_01_01 " );	// Yes. Pirokar already told me everything. And to be honest, I'm not surprised at all.
	AI_Output(self,other, " DIA_MiltenNW_SoonBattle_01_02 " );	// I knew that sooner or later the orcs would come here, and I was always ready for it.
	AI_Output(self,other, " DIA_MiltenNW_SoonBattle_01_03 " );	// But now I'm at a total loss.
	AI_Output(other,self, " DIA_MiltenNW_SoonBattle_01_04 " );	// Don't worry! We'll figure something out.
};


instance DIA_MILTENNW_SOONBATTLENOW(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_soonbattlenow_condition;
	information = dia_miltennw_soonbattlenow_info;
	permanent = FALSE;
	description = "The paladins will need your help. " ;
};


func int dia_miltennw_soonbattlenow_condition()
{
	if (( KAPITELORCATC  ==  TRUE ) && ( KDF_JOINHAGEN  ==  TRUE ) && ( STOPBIGBATTLE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_miltennw_soonbattlenow_info()
{
	AI_Output(other,self, " DIA_MiltenNW_SoonBattleNow_01_00 " );	// The paladins will need your help.
	AI_Output(self,other, " DIA_MiltenNW_SoonBattleNow_01_01 " );	// Don't worry. I know about it.
	AI_Output(self,other, " DIA_MiltenNW_SoonBattleNow_01_02 " );	// And I will do everything in my power for the benefit of their victory.
};


instance DIA_MILTENNW_BATTLEWIN(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_battlewin_condition;
	information = dia_miltennw_battlewin_info;
	permanent = FALSE;
	description = " Our enemy has been defeated! " ;
};


func int dia_miltennw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_MiltenNW_BattleWin_01_00 " );	// Our enemy has been defeated!
	AI_Output(self,other, " DIA_MiltenNW_BattleWin_01_01 " );	// And I'm extremely happy about it! Now it will be much easier for all of us.

	if(MONASTERYISFREE == FALSE)
	{
		AI_Output(self,other, " DIA_MiltenNW_BattleWin_01_02 " );	// But it's too early to talk about the final victory in this war.
		AI_Output(self,other, " DIA_MiltenNW_BattleWin_01_03 " );	// The monastery is still under siege by orcs! Which means my brothers are still in danger.
		AI_Output(other,self, " DIA_MiltenNW_BattleWin_01_04 " );	// Don't worry! I am sure that we will soon deal with this problem.
		AI_Output(self,other, " DIA_MiltenNW_BattleWin_01_05 " );	// Let's hope.
	};
};


instance DIA_MILTENNW_RUNEMAGICNOTWORK(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_runemagicnotwork_condition;
	information = dia_miltennw_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_miltennw_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_MiltenNW_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_MiltenNW_RuneMagicNotWork_01_01 " );	// I really want to say yes, but I can't. My runes have completely lost their magic.
	AI_Output(other,self, " DIA_MiltenNW_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_MiltenNW_RuneMagicNotWork_01_03 " );	// (with a bitter grin) My brothers stand in solidarity with me now more than ever.
	AI_Output(other,self, " DIA_MiltenNW_RuneMagicNotWork_01_04 " );	// Got it.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};


instance DIA_MILTENNW_GOONORKSHUNT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_goonorkshunt_condition;
	information = dia_miltennw_goonorkshunt_info;
	permanent = FALSE;
	description = " I'm going to hunt orcs. Will you come with me? " ;
};


func int dia_miltennw_goonorkshunt_condition()
{
	if (( HAGENGIVEHELP  ==  TRUE ) && ( ALLGREATVICTORY  ==  FALSE ) && ( MILTENTOBIGLAND  ==  FALSE ) && ( RUNEMAGICNOTWORK  ==  TRUE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && Npc_KnowsInfo(hero,dia_miltennw_battlewin));
	{
		return TRUE;
	};
};

func void dia_miltennw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_MiltenNW_GoOnOrksHunt_01_00 " );	// I'm going to hunt orcs. Will you come along with me?
	AI_Output(self,other, " DIA_MiltenNW_GoOnOrksHunt_01_01 " );	// Our rune magic no longer works. Without her, I would be of little use.
	AI_Output(self,other, " DIA_MiltenNW_GoOnOrksHunt_01_02 " );	// Really... I'm pretty good with a staff! So be it, I'll help you.
	MILTENJOINMEHUNT = TRUE;
};


instance DIA_MILTENNW_FOLLOWME(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_followme_condition;
	information = dia_miltennw_followme_info;
	permanent = TRUE;
	description = " Follow me! " ;
};


func int dia_miltennw_followme_condition()
{
	if (( MILTENJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( MILTENTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_miltennw_followme_info()
{
	AI_Output(other,self, " DIA_MiltenNW_FollowMe_01_00 " );	// Follow me!
	AI_Output(self,other, " DIA_MiltenNW_FollowMe_01_01 " );	// Of course.

	if(Npc_HasItems(self,ItMw_1h_Nov_Mace) < 1)
	{
		CreateInvItems(self,ItMw_1h_Nov_Mace,1);
	};

	EquipItem(self, ItMw_1h_Nov_Mace);
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_STOPHERE(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_stophere_condition;
	information = dia_miltennw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_miltennw_stophere_condition()
{
	if (( MILTENJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( MILTENTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_miltennw_stophere_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StopHere_01_00");	//Жди тут!

	if(MONASTERYISFREE == FALSE)
	{
		AI_Output(self,other, " DIA_MiltenNW_StopHere_01_01 " );	// Good! Then I'll go back to the farm for now.
		AI_Output(self,other, " DIA_MiltenNW_StopHere_01_02 " );	// If you need me, look for me there.
		Npc_ExchangeRoutine(self,"CampOn");
	}
	else
	{
		AI_Output(self,other, " DIA_MiltenNW_StopHere_01_03 " );	// Good! Then I'll go back to the monastery for now.
		AI_Output(self,other, " DIA_MiltenNW_StopHere_01_04 " );	// If you need me, look for me there.
		Npc_ExchangeRoutine(self,"OrcAtcNW");
	};

	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_allgreatvictory_condition;
	information = dia_miltennw_allgreatvictory_info;
	permanent = FALSE;
	description = " Not tired? " ;
};


func int dia_miltennw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_MiltenNW_AllGreatVictory_01_00 " );	// Not tired?
	AI_Output(self,other, " DIA_MiltenNW_AllGreatVictory_01_01 " );	// (sighing) The last few days have really worn me out.
	AI_Output(self,other, " DIA_MiltenNW_AllGreatVictory_01_02 " );	// However, it's better than constantly being afraid. We're not in danger now!
};


instance DIA_MILTENNW_WHATDONOW(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_whatdonow_condition;
	information = dia_miltennw_whatdonow_info;
	permanent = FALSE;
	description = " Will you stay at the monastery? " ;
};


func int dia_miltennw_whatdonow_condition()
{
	if (( ALLGREATVICTORY  ==  TRUE ) && ( MILTENTOBIGLAND  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_miltennw_whatdonow_info()
{
	AI_Output(other,self, " DIA_MiltenNW_WhatDoNow_01_00 " );	// Will you stay in the monastery?
	AI_Output(self,other, " DIA_MiltenNW_WhatDoNow_01_01 " );	// Most likely. Enough adventure for me!
	AI_Output(self,other, " DIA_MiltenNW_WhatDoNow_01_02 " );	// Now I'd better get down to some quieter business.
	AI_Output(other,self, " DIA_MiltenNW_WhatDoNow_01_03 " );	// And what exactly?
	AI_Output(self,other, " DIA_MiltenNW_WhatDoNow_01_04 " );	// (thoughtfully) I have long wanted to study some of the ancient manuscripts that are kept in our secret library.
};


instance DIA_MILTENNW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_travelonbigland_condition;
	information = dia_miltennw_travelonbigland_info;
	permanent = FALSE;
	description = " Will you sail with me to the mainland? " ;
};


func int dia_miltennw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_MiltenNW_TravelOnBigLand_01_00 " );	// Will you sail with me to the mainland?
	AI_Output(self,other, " DIA_MiltenNW_TravelOnBigLand_01_01 " );	// Hmmm...(confused) Your suggestion is quite unexpected.
	AI_Output(self,other, " DIA_MiltenNW_TravelOnBigLand_01_02 " );	// Although to tell you the truth, I'm sick of this island already! I think I need to change things up a bit.
	AI_Output(self,other, " DIA_MiltenNW_TravelOnBigLand_01_04 " );	// I'll swim with you!
	AI_Output(other,self, " DIA_MiltenNW_TravelOnBigLand_01_05 " );	// Then we'll meet on the ship.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	MILTENTOBIGLAND = TRUE ;
	B_LogEntry( TOPIC_SALETOBIGLAND , " Milten wants a change of scenery. He's coming to the mainland with me. " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

