

instance DIA_Udar_EXIT (C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_EXIT_Condition;
	information = DIA_Udar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_EXIT_Condition()
{
	if (chapter <  4 )
	{
		return TRUE;
	};
};

func void DAY_Udar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Hello (C_Info)
{
	npc = PAL_268_Udar;
	nr = 2;
	condition = DIA_Udar_Hello_Condition;
	information = DIA_Udar_Hello_Info;
	important = TRUE;
};


func int DIA_Udar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DAY_Udar_Hello_Info()
{
	AI_Output(self,other, " DIA_Udar_Hello_09_00 " );	// You were very lucky when you made your way here. I almost shot you.
	AI_Output(other,self, " DIA_Udar_Hello_15_01 " );	// Then maybe I should be glad you have such a sharp eye.
	AI_Output(self,other, " DIA_Udar_Hello_09_02 " );	// Don't ramble. Talk to Sengrat if you need anything.
	AI_StopProcessInfos(self);
};


instances DIA_Udar_YouAreBest (C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_YouAreBest_Condition;
	information = DIA_Udar_YouAreBest_Info;
	permanent = FALSE;
	description = " I heard you are the BEST crossbowman! " ;
};


func int DIA_Udar_YouAreBest_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Keroloth_Udar ) && ( CAPITALORCATC  ==  FALSE ))
	{
		return  1 ;
	};
};

func void DIA_Udar_YouAreBest_Info()
{
	AI_Output(other,self, " DIA_Udar_YouAreBest_15_00 " );	// I heard you're the BEST crossbowman around!
	AI_Output(self,other, " DIA_Udar_YouAreBest_09_01 " );	// Well, if they say so, it might be true. What do you need?
};


DIA_Udar_TeachMe (C_Info) instances
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_TeachMe_Condition;
	information = DIA_Udar_TeachME_Info;
	permanent = FALSE;
	description = " Teach me how to shoot a crossbow. " ;
};


func int DIA_Udar_TeachMe_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Udar_YouAreBest ) && ( Udar_TeachPlayer !=  TRUE ) && ( CAPITELORCATC  ==  FALSE )) .
	{
		return  1 ;
	};
};

func void DIA_Udar_TeachME_Info()
{
	AI_Output(other,self, " DIA_Udar_Teacher_15_00 " );	// Teach me how to shoot a crossbow.
	AI_Output(self,other, " DIA_Udar_Teacher_09_01 " );	// Get out! There are enough targets running around the castle that you can practice on.
};


instances of DIA_Udar_ImGood (C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_ImGood_Condition;
	information = DIA_Udar_ImGood_Info;
	permanent = FALSE;
	description = " The greatest crossbowman is me. " ;
};


func int DIA_Udar_ImGood_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Udar_YouAreBest ) && ( CAPITALORCATC  ==  FALSE ))
	{
		return  1 ;
	};
};

func void DAY_Udar_ImGood_Info()
{
	AI_Output(other,self, " DIA_Udar_ImGood_15_00 " );	// The greatest crossbowman is me.
	AI_Output(self,other, " DIA_Udar_ImGood_09_01 " );	// (laughs) Yes, you're right!
	AI_Output(self,other, " DIA_Udar_ImGood_09_02 " );	// Well, if you want to learn, I can help.
	Udar_TeachPlayer = TRUE;
	B_LogEntry(TOPIC_Teacher_OC, " Hitting can teach me the art of crossbow shooting. " );
};


DIA_Udar_Teach (C_Info) instances
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_Teach_Condition;
	information = DIA_Udar_Teach_Info;
	permanent = TRUE;
	description = " I want to learn from you. " ;
};


func int DIA_Udar_Teach_Condition()
{
	if ((Udar_TeachPlayer ==  TRUE ) && ( KAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Udar_Teach_Info()
{
	AI_Output(other,self, " DIA_Udar_Teach_15_00 " );	// I want to learn from you.
	AI_Output(self,other, " DIA_Udar_Teach_09_01 " );	// Okay, learn!
	Info_ClearChoices(DIA_Udar_Teach);
	Info_AddChoice(DIA_Udar_Teach,Dialog_Back,DIA_Udar_Teach_Back);
	Info_AddChoice(DIA_Udar_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Udar_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};

func void DIA_Udar_Teach_Back()
{
	Info_ClearChoices(DIA_Udar_Teach);
};

func void B_Udar_TeachNoMore1()
{
	AI_Output(self,other, " B_Udar_TeachNoMore1_09_00 " );	// You already know the basics - we don't have time for more.
};

func void B_Udar_TeachNoMore2()
{
	AI_Output(self,other, " B_Udar_TeachNoMore2_09_00 " );	// To improve your skill with this weapon, you'd better look for a more suitable teacher.
};

func void DIA_Udar_Teach_CROSSBOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
};

func void DIA_Udar_Teach_CROSSBOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};


instances of DIA_Udar_Perm (C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Perm_Condition;
	information = DIA_Udar_Perm_Info;
	permanent = FALSE;
	description = " How are things at the castle? " ;
};


func int DIA_Udar_Perm_Condition()
{
	if (chapter <=  3 )
	{
		return TRUE;
	};
};

func void DAY_Udar_Perm_Info()
{
	AI_Output(other,self, " DIA_Udar_Perm_15_00 " );	// How are things at the castle?
	AI_Output(self,other, " DIA_Udar_Perm_09_01 " );	// Some of our guys dedicate themselves to training, but basically we're all just waiting for something to happen.
	AI_Output(self,other, " DIA_Udar_Perm_09_02 " );	// This uncertainty is exhausting. That's the strategy of those damn orcs. They will wait until our patience runs out.
};


instances of DIA_Udar_Ring (C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Ring_Condition;
	information = DIA_Udar_Ring_Info;
	permanent = FALSE;
	description = " Here, I brought you a Tengron ring. " ;
};


func int DIA_Udar_Ring_Condition()
{
	if ((Npc_HasItems(other,ItRi_Tengron) >=  1 ) && ( CAPITALORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Udar_Ring_Info()
{
	AI_Output(other,self, " DIA_Udar_Ring_15_00 " );	// Here, I brought you Tengron's ring. It will protect you. Tengron says that someday he will return and take this ring back.
	AI_Output(self,other, " DIA_Udar_Ring_09_01 " );	// What? Do you know what this ring is? He received this award for his courage in battle.
	AI_Output(self,other, " DIA_Udar_Ring_09_02 " );	// Are you saying he wants to take it back? If such is the will of Innos, so be it. If that is the will of Innos...
	B_GiveInvItems(other,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP(XP_TengronRing);
};


instance DIA_Udar_KAP4_EXIT (C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP4_EXIT_Condition;
	information = DIA_Udar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Udar_Kap4WiederDa (C_Info)
{
	npc = PAL_268_Udar;
	nr = 40;
	condition = DIA_Udar_Kap4WiederDa_Condition;
	information = DIA_Udar_Kap4WiederDa_Info;
	important = TRUE;
};


func int DIA_Cap4Return_Condition()
{
	if ((CAPITAL >=  4 ) && ( CAPITALORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Udar_Kap4WiederDa_Info()
{
	AI_Output(self,other, " DIA_Udar_Kap4WiederDa_09_00 " );	// It's good that you came. It's a living hell here.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self, " DIA_Udar_Kap4WiederDa_15_01 " );	// What happened?
		AI_Output(self,other, " DIA_Udar_Kap4WiederDa_09_02 " );	// Dragon hunters hang around the castle and brag about how they can solve the dragon problem.
		AI_Output(self,other, " DIA_Udar_Kap4WiederDa_09_03 " );	// But I'll tell you - judging by the way they look, they can't even kill an old sick snapper.
	};
	AI_Output(self,other, " DIA_Udar_Kap4WiederDa_09_04 " );	// Many of us are already desperate and no longer believe that we will be able to get out of here alive.
};


instances of DIA_Udar_Segrath (C_Info)
{
	npc = PAL_268_Udar;
	nr = 41;
	condition = DIA_Udar_Sengrath_Condition;
	information = DIA_Udar_Sengrath_Info;
	description = " I think you two were standing watch here? " ;
};


func int DIA_Udar_Sengrath_Condition()
{
	if ((Capital >=  4 ) && Npc_KnowsInfo(other,DIA_Space_Cap4RepeatDay) && (Missing_Capital ==  TRUE ) && ( CAPITALORCATC  ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DAY_Udar_Sengrath_Info()
{
	AI_Output(other,self, " DIA_Udar_Sengrath_15_00 " );	// I think you two were standing watch here?
	AI_Output(self,other, " DIA_Udar_Sengrath_09_01 " );	// Not now. Sengrat stood at the edge of the wall and fell asleep.
	AI_Output(self,other, " DIA_Udar_Sengrath_09_02 " );	// He dropped his crossbow and it fell down.
	AI_Output(self,other, " DIA_Udar_Sengrath_09_03 " );	// We saw how one of the orcs grabbed it and disappeared into the darkness.
	AI_Output(self,other, " DIA_Udar_Sengrath_09_04 " );	// Sengrat woke up and ran into the night towards the orc stockade. Nobody has seen him since.
	AI_Output(self,other, " DIA_Udar_Sengrath_09_05 " );	// May Innos be with us!
	Log_CreateTopic(TOPIC_Sengrath_Missing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing,LOG_Running);
	; _ _ _ _
};


instances DIA_Udar_SENGRATHGEFUNDEN (C_Info)
{
	npc = PAL_268_Udar;
	nr = 42;
	condition = DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information = DIA_Udar_SENGRATHGEFUNDEN_Info;
	description = " I found Sengrat. " ;
};


func int DIA_Create_Fund_Condition() .
{
	if ((Capital >=  4 ) && Npc_KnowsInfo(other,DIA_Udar_Sengrath) && Npc_HasItems(other,ItRw_SengrathsArmbrust_MIS) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Create_Funds_Info()
{
	AI_Output(other,self, " DIA_Udar_SENGRATHGEFUNDEN_15_00 " );	// I found Sengrat.
	AI_Output(self,other, " DIA_Udar_SENGRATHGEFUNDEN_09_01 " );	// Yes? And where is he?
	AI_Output(other,self, " DIA_Udar_SENGRATHGEFUNDEN_15_02 " );	// He's dead. Here is his crossbow. He was with him.
	AI_Output(self,other, " DIA_Udar_SENGRATHGEFUNDEN_09_03 " );	// He must have been able to get his crossbow back, but the orcs still finished him off.
	AI_Output(self,other, " DIA_Udar_SENGRATHGEFUNDEN_09_04 " );	// Damn fool. I knew it would. We will all die here.
	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP(XP_SengrathFound);
};


instances of DIA_Udar_BADFEELING (C_Info)
{
	npc = PAL_268_Udar;
	nr = 50;
	condition = DIA_Udar_BADFEELING_Condition;
	information = DIA_Udar_BADFEELING_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Udar_BADFEELING_Condition()
{
	if ((Npc_RefuseTalk(self) ==  FALSE ) && Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Create_SENGRATHGEFUND) && (Capital >=  4 ) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Udar_BADFEELING_Info()
{
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other, " DIA_Udar_BADFEELING_09_00 " );	// One more such unprepared attack and we're done.
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other, " DIA_Udar_BADFEELING_09_01 " );	// Orcs are very nervous. Something really scared them. I'm feeling it.
	}
	else
	{
		AI_Output(self,other, " DIA_Udar_BADFEELING_09_02 " );	// I really don't like all this.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_Udar_KAP5_EXIT (C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP5_EXIT_Condition;
	information = DIA_Udar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_KAP6_EXIT (C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP6_EXIT_Condition;
	information = DIA_Udar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Udar_PICKPOCKET (C_Info)
{
	npc = PAL_268_Udar;
	nr = 900;
	condition = DIA_Udar_PICKPOCKET_Condition;
	information = DIA_Udar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Udar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 15 );
};

func void DIA_Udar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
	Info_AddChoice(DIA_Udar_PICKPOCKET,Dialog_Back,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Udar_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};


instance DIA_UDAR_CAPTURED(C_Info)
{
	npc = PAL_268_Udar;
	nr = 2;
	condition = dia_udar_captured_condition;
	information = dia_udar_captured_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_udar_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_udar_captured_info()
{
	if (( MIS_NOTICE  == LOG_Running ) && ( UPDATE  ==  FALSE ))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Udar_Captured_01_01 " );	// How? (surprised) Are you here? I didn't think the orcs would let you in here.
		AI_Output(other,self, " DIA_Udar_Captured_01_04 " );	// Have you thought about getting out of here yet?
		AI_Output(self,other, " DIA_Udar_Captured_01_05 " );	// Eh...(doomed) If we had even one chance to do it, we would have done it a long time ago.
		AI_Output(other,self, " DIA_Udar_Captured_01_06 " );	// I guess you'll have this opportunity soon.
		AI_Output(other,self, " DIA_Udar_Captured_01_08 " );	// In the meantime, tell me - do you know the paladin Nathan?
		AI_Output(self,other, " DIA_Udar_Captured_01_09 " );	// Nathan? Yes, I know, of course.
		AI_Output(other,self, " DIA_Udar_Captured_01_10 " );	// He said you once saved his life. This is true?
		AI_Output(self,other, " DIA_Udar_Captured_01_11 " );	// Yes! And after everything that happened, the poor guy for some reason drummed into his head that he must certainly repay me in the same way.
		AI_Output(self,other, " DIA_Udar_Captured_01_12 " );	// Although I told him more than once that in my place he would have done exactly the same.
		AI_Output(self,other, " DIA_Udar_Captured_01_13 " );	// But he didn't want to listen to me! He even went with me on this expedition in order to have a chance here to return his debt of honor to me.
		AI_Output(self,other, " DIA_Udar_Captured_01_15 " );	// Do you know him too?
		AI_Output(other,self, " DIA_Udar_Captured_01_16 " );	// Yes, paladin Nathan is now also in the Valley of Mines.
		AI_Output(self,other, " DIA_Udar_Captured_01_17 " );	// True? (sadly) I hope he doesn't do something stupid.
		B_LogEntry( TOPIC_NATANDOLG , " I asked Udar about the paladin Nathan, and he confirmed that he had actually saved the guy's life. However, Udar was extremely saddened that Nathan was now in the Mine Valley. According to him, Nathan is too impulsive, and The blow is afraid that the guy’s desire to pay his debt of honor at all costs may end badly for him. " );
		UDARKNOWSNATAN = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};

