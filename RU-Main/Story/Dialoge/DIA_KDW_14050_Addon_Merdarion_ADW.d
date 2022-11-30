

instance DIA_Addon_Merdarion_ADW_EXIT(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 999;
	condition = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_ADWHello(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADWHello_Condition;
	information = DIA_Addon_Merdarion_ADWHello_Info;
	description = " How are you? " ;
};


func int DIA_Addon_Merdarion_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_Back_15_00 " );	// I've heard enough.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
};

func void DIA_Addon_Merdarion_ADWHello_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_06_01 " );	// Listen... (listening) Curious, huh?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Хммм...
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_06_03 " );	// These teleport stones don't seem to be working, but you can still hear them humming.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_06_04 " );	// Although they are inactive, there is still some energy left in them.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, " Where do these teleporters get their energy? " ,DIA_Addon_Merdarion_ADWHello_reaktor);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, " How do you think they can be activated? " ,DIA_Addon_Merdarion_ADWHello_was);
};

func void DIA_Addon_Merdarion_ADWHello_was()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_was_15_00 " );	// How do you think they can be activated?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_was_06_01 " );	// I have one idea. I just need to make sure my suspicion is correct.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_was_06_02 " );	// I had a feeling a few days ago that I had already seen a similar thing.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_was_06_03 " );	// I believe we need to transfer an impressive amount of magical energy to them in order to make them work again.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, " Where have you seen such teleport stones before? " ,DIA_Addon_Merdarion_ADWHello_wo);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, " What can give enough magical energy?.. " ,DIA_Addon_Merdarion_ADWHello_focus);
};

func void DIA_Addon_Merdarion_ADWHello_focus()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_focus_15_00 " );	// What can give enough magical energy...?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_focus_06_01 " );	// Only one idea comes to my mind. Magic focus.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_focus_06_02 " );	// I'm referring to one of the five focus stones that were used to create the magical Barrier in the Valley of Mines.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_focus_06_03 " );	// As far as I know, you returned them to us some time ago.
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_focus_15_04 " );	// Yes, I remember.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, " You said you needed to make sure your suspicion was correct. " ,DIA_Addon_Merdarion_ADWHello_focusProof);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, " And where are the focus stones now? " ,DIA_Addon_Merdarion_ADWHello_focusWo);
};

func void DIA_Addon_Merdarion_ADWHello_focusWo()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_focusWo_15_00 " );	// And where are the focus stones now?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_focusWo_06_01 " );	// They were entrusted to me. I must keep them until they find another use.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_focusWo_06_02 " );	// Looks like it's about time.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, " I've heard enough. " ,DIA_Addon_Merdarion_ADWHello_Back);
};

func void DIA_Addon_Merdarion_ADWHello_focusProof()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_focusProof_15_00 " );	// You said you needed to make sure your suspicion was correct.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_focusProof_06_01 " );	// Magic focus can be associated with these gems.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_focusProof_06_02 " );	// But I don't know where.
};

func void DIA_Addon_Merdarion_ADWHello_wo()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_wo_15_00 " );	// Where have you seen such teleportation stones before?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_wo_06_01 " );	// You were also in a penal colony. Have you never noticed them?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_wo_06_02 " );	// I'm pretty sure they can still be found there.
};

func void DIA_Addon_Merdarion_ADWHello_reaktor()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADWHello_reaktor_15_00 " );	// What are these stones doing?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_reaktor_06_01 " );	// Architects were a very developed nation.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_reaktor_06_02 " );	// They used magic properties we've never seen before.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_reaktor_06_03 " );	// A network of teleport stones has been built to allow Builders to move quickly from one city to another.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADWHello_reaktor_06_04 " );	// THIS stone is obviously the center stone.
};

instance DIA_Addon_Merdarion_ADW_Portal(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_Portal_Condition;
	information = DIA_Addon_Merdarion_ADW_Portal_Info;
	description = " Is there anything else interesting here? " ;
};


func int DIA_Addon_Merdarion_ADW_Portal_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Merdarion_ADWHello ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_Portal_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_Portal_01_00 " );	// Is there anything else interesting here?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_Portal_01_01 " );	// In the deserted canyon to the north of this valley, there is a small stone building, apparently left by the Builders.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_Portal_01_02 " );	// It looks like a temple, but in my opinion, these are the remains of some kind of magical portal.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_Portal_01_03 " );	// So if you happen to find out, let me know.
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_Portal_01_04 " );	// Okay, I'll keep that in mind.
	MIS_MerdarionPortal = LOG_Running;
	Log_CreateTopic(TOPIC_MerdarionPortal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MerdarionPortal,LOG_Running);
	B_LogEntry(TOPIC_MerdarionPortal, " According to Merdarion, there are ruins of some ancient structure in the canyon. He thinks it is a magical portal. Merdarion asked me to let him know if I can find anything about it. " );
};

instance DIA_Addon_Merdarion_ADW_PortalDone (C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PortalDone_Condition;
	information = DIA_Addon_Merdarion_ADW_PortalDone_Info;
	description = " You were right about the portal. " ;
};

func int DIA_Addon_Merdarion_ADW_PortalDone_Condition()
{
	if ((MIS_MerdarionPortal == LOG_Running) && ( AV_ENTER  ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PortalDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PortalDone_01_00 " );	// You were right about the portal.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_PortalDone_01_01 " );	// Even so... (with interest) And where does it lead?
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PortalDone_01_02 " );	// Apparently, this place was once called the Plateau of the Ancients.
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PortalDone_01_03 " );	// In the records of the Builders it is said that it is the sacred fiefdom of Adanos himself.
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PortalDone_01_04 " );	// It was there that he first stepped into the world of people and addressed them.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_PortalDone_01_05 " );	// Oh gods! (surprised) I can't believe it! It's... It just doesn't fit in my head.
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PortalDone_01_06 " );	// Then go and have a look at it yourself.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_PortalDone_01_07 " );	// I, of course, would like this, but for some reason I am tormented by some bad premonitions.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_PortalDone_01_08 " );	// If the Builders hid this place, then perhaps our intervention could lead to extremely unpredictable consequences.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_PortalDone_01_09 " );	// Therefore, let this knowledge remain hidden from the rest. This will be better for everyone!
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PortalDone_01_10 " );	// Okay, whatever you say.
	MIS_MerdarionPortal = LOG_Success;
	Log_SetTopicStatus(TOPIC_MerdarionPortal,LOG_Success);
	B_LogEntry(TOPIC_MerdarionPortal, " I told Merdarion about the portal on the plateau of the Ancients. He was impressed by what he heard. However, the Waterbenders are unlikely to attempt to pass through it. In their opinion, some secrets of the Ancients should remain secret. " );
};

instance DIA_Addon_Merdarion_GebenFokus (C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FokusGeben_Condition;
	information = DIA_Addon_Merdarion_FokusGeben_Info;
	description = " Give me the focus stone. " ;
};

func int DIA_Addon_Merdarion_FokusGeben_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Merdarion_ADWHello ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_FocusGive_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_FokusGeben_15_00 " );	// Give me the focus stone. I'll try to get the teleporters to work.
	AI_Output(self,other, " DIA_Addon_Merdarion_FokusGeben_06_01 " );	// Good. But be careful, do you hear me?
	AI_Output(self,other, " DIA_Addon_Merdarion_FokusGeben_06_02 " );	// Saturas will take my head off if we lose them.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
	) ; _ _ _
};


instance DIA_Addon_Merdarion_FirstFocus(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FirstFocus_Condition;
	information = DIA_Addon_Merdarion_FirstFocus_Info;
	description = " I have activated one of the teleport stones. " ;
};

func int DIA_Addon_Merdarion_FirstFocus_Condition()
{
	if(TriggeredTeleporterADW != 0)
	{
		return TRUE;
	};
	return  FALSE ;
};


var int Merdarion_GotFocusCount;

func void DIA_Addon_Merdarion_FirstFocus_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_FirstFocus_15_00 " );	// I've activated one of the teleport stones.
	AI_Output(self,other, " DIA_Addon_Merdarion_FirstFocus_06_01 " );	// Yes, I see. So I was right.
	AI_Output(self,other, " DIA_Addon_Merdarion_FirstFocus_06_02 " );	// I've talked to others about this.
	AI_Output(self,other, " DIA_Addon_Merdarion_FirstFocus_06_03 " );	// We want you to try to activate all the other teleport stones.
	AI_Output(self,other, " DIA_Addon_Merdarion_FirstFocus_06_04 " );	// If we can quickly move from one part of the city to another, it will help us a lot in research.
	AI_Output(self,other, " DIA_Addon_Merdarion_FirstFocus_06_05 " );	// Here's another focus stone.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Merdarion_GotFocusCount = 1 ;
	AI_Output(self,other, " DIA_Addon_Merdarion_FirstFocus_06_06 " );	// Activate them all if you can.
	AI_Output(other,self, " DIA_Addon_Merdarion_FirstFocus_15_07 " );	// I'll try.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	B_LogEntry(TOPIC_Addon_TeleportsADW, " Merdarion gave me another Focus Stone. I should try to activate all the Teleports. Merdarion will supply me with new stones as the Teleports turn on. " );
};


instance DIA_Addon_Merdarion_ActivateTeleports(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information = DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent = TRUE;
	description = " I've activated another teleport stone. " ;
};


func int DIA_Addon_Merdarion_ActivateTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_FirstFocus) && (TriggeredTeleporterADW > Merdarion_GotFocusCount) && (Merdarion_GotFocusCount < 6))
	{
		return TRUE;
	};
	return  FALSE ;
};


var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ActivateTeleports_15_00 " );	// I've activated another teleport stone.
	if(SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output(other,self, " DIA_Addon_Merdarion_ActivateTeleports_15_01 " );	// Give me the next focus stone.
		AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_02 " );	// Sure, please.
		CreateInvItems(self,ItMi_Focus,1);
		B_GiveInvItems(self,other,ItMi_Focus,1);
	};
	if(DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_03 " );	// Was it difficult?
		AI_Output(other,self, " DIA_Addon_Merdarion_ActivateTeleports_15_04 " );	// How to see. I wouldn't mind helping.
		AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_05 " );	// I can give you some gold, will that help?
		AI_Output(other,self, " DIA_Addon_Merdarion_ActivateTeleports_15_06 " );	// Obviously it won't hurt.
		AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_07 " );	// Let's see...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	if(SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_08 " );	// You did a great job. I can only congratulate you.
		AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_09 " );	// Now they all work. Impressive sight, right?
	};
	AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_10 " );	// Here are some gold coins.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Merdarion_GotFocusCount = Merdarion_GotFocusCount +  1 ;
	if ((Merdarion_GotFocusCount >=  1 ) && (Saturas_SCBroughtAllToken ==  FALSE ) && (Ghost_SCKnowsHow2GetInAdanosTemple ==  FALSE ) && (MY_Saturas_LookingForHousesOfRulers ==  0 )) ;
	{
		AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_11 " );	// Oh, and before I forget, Saturas wanted to talk to you.
		AI_Output(self,other, " DIA_Addon_Merdarion_ActivateTeleports_06_12 " );	// You must find him as soon as possible.
	};
};


instance DIA_Addon_Merdarion_ADW_PreTeachMana (C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information = DIA_Addon_Merdarion_ADW_PreTeachMana_Info;
	description = " Can you enhance my magic abilities? " ;
};


func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Merdarion_ADWHello ) && ( hero . guild ==  GIL_KDW ) && Npc_KnowsInfo ( other , DIA_Addon_Saturas_ADW_PreTeachCircle ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PreTeachMana_15_00 " );	// Can you enhance my magical abilities?
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_PreTeachMana_06_01 " );	// I can increase your magical energy.
	Merdarion_Addon_TeachMana = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher, " Merdarion can increase my magical energy. " );
};


instance DIA_Addon_Merdarion_ADW_TEACH_MANA (C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 99;
	condition = DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information = DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent = TRUE;
	description = " I want to increase my magical abilities. " ;
};


var int Merdarion_ADW_Empty;

func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition()
{
	if((Merdarion_ADW_Empty == FALSE) && (Merdarion_Addon_TeachMana == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00 " );	// I want to increase my magical energy.
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other, " DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00 " );	// What you're asking is beyond my ability.
		AI_Output(self,other, " DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01 " );	// You already know everything I could teach you.
		Merdarion_ADW_Empty = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};


instance DIA_ADDON_MERDARION_ADW_PRAYFORGOMEZ (C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 1;
	condition = dia_addon_merdarion_adw_prayforgomez_condition;
	information = dia_addon_merdarion_adw_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_merdarion_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Merdarion_ADW_PrayForGomez_01_03 " );	// I think he can help you.
	AI_Output(other,self, " DIA_Addon_Merdarion_ADW_PrayForGomez_01_04 " );	// Thanks for the tip.
	SENTTOSATURASGOMEZ = TRUE ;
};


instance DIA_ADDON_MERDARION_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 1;
	condition = dia_addon_merdarion_adw_duringritual_condition;
	information = dia_addon_merdarion_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_merdarion_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

var int MerdarionDoUnitors;

instance DIA_Addon_Merdarion_AncientAltar(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_AncientAltar_Condition;
	information = DIA_Addon_Merdarion_AncientAltar_Info;
	permanent = FALSE;
	description = " I'm talking about units. " ;
};

func int DIA_Addon_Merdarion_AncientAltar_Condition()
{
	if(AltarToMerdarion == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_AncientAltar_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_AncientAltar_01_00 " );	// I'm talking about units. I need a few more.
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_01 " );	// Sorry, I can't help you.

	if(SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_02 " );	// All the units I had were already used to activate the magical portals.
		AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_03 " );	// I just don't have any others. By the way, why do you suddenly need them so much?
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_04 " );	// Those units that Saturas gave me, I will part only in case of emergency.
		AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_05 " );	// And you didn't even explain why you suddenly needed them.
	};

	AI_Output(other,self, " DIA_Addon_Merdarion_AncientAltar_01_06 " );	// Saturas said they could restore magic to the ancient altars.
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_07 " );	// (thoughtfully) In that case, you definitely won't need them.
	AI_Output(other,self, " DIA_Addon_Merdarion_AncientAltar_01_08 " );	// Why else?
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_09 " );	// Because these units are completely unsuitable for such purposes.
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_10 " );	// Most likely, some special crystals are needed here, which themselves store magical energy.
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_11 " );	// But I haven't seen them here yet.
	AI_Output(other,self, " DIA_Addon_Merdarion_AncientAltar_01_12 " );	// And if I find these crystals for you, can you make focus stones out of them?
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_13 " );	// (thoughtfully) Why not. They will only need to give the correct shape and secure in the frame.
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_14 " );	// For the unstable structure of the crystal can easily destroy itself.
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_15 " );	// So, if you happen to see such instances, bring them to me.
	AI_Output(self,other, " DIA_Addon_Merdarion_AncientAltar_01_16 " );	// And I'll help you with your problem.
	AI_Output(other,self, " DIA_Addon_Merdarion_AncientAltar_01_17 " );	// Okay, I got it.
	MerdarionDoUnitors = TRUE;
};

instance DIA_Addon_Merdarion_MakeUnitor(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_MakeUnitor_Condition;
	information = DIA_Addon_Merdarion_MakeUnitor_Info;
	permanent = FALSE;
	description = " I have a piece of magic crystal for you. " ;
};

func int DIA_Addon_Merdarion_MakeUnitor_Condition()
{
	if((MerdarionDoUnitors == TRUE) && (Npc_HasItems(hero,ItMi_UnSharp_MagicCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_MakeUnitor_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Merdarion_MakeUnitor_01_00 " );	// I have a piece of the magic crystal for you.
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_01_01 " );	// True? Show it to me.
	AI_Output(other,self, " DIA_Addon_Merdarion_MakeUnitor_01_02 " );	// Here it is.
	B_GiveInvItems(other,self,ItMi_UnSharp_MagicCrystal,1);
	Npc_RemoveInvItems(self,ItMi_UnSharp_MagicCrystal,1);
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_01_03 " );	// Looks like you're right.
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_01_04 " );	// And it will make a very suitable focusing stone for your purposes. Where did you find him?
	AI_Output(other,self, " DIA_Addon_Merdarion_MakeUnitor_01_05 " );	// You better not know.
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_01_06 " );	// Well, if so... Wait a minute. It does not take a lot of time.
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_01_07 " );	// Here, your magic unit is ready. You can use it.
	B_GiveInvItems(self,other,ItMi_MagicCrystal,1);
	AI_Output(other,self, " DIA_Addon_Merdarion_MakeUnitor_01_08 " );	// Thank you. What if I need more units?
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_01_09 " );	// It's very simple, my friend. Most importantly, bring me the crystals.
};

instance DIA_Addon_Merdarion_MakeUnitor_Done(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_MakeUnitor_Done_Condition;
	information = DIA_Addon_Merdarion_MakeUnitor_Done_Info;
	permanent = TRUE;
	description = " Make me some more units. " ;
};

func int DIA_Addon_Merdarion_MakeUnitor_Done_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Merdarion_MakeUnitor) && (Npc_HasItems(hero,ItMi_UnSharp_MagicCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_MakeUnitor_Done_Info()
{
	var int number_common;

	AI_Output(other,self, " DIA_Addon_Merdarion_MakeUnitor_Done_01_00 " );	// Make me some more units.
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_Done_01_01 " );	// Do you have crystals?
	AI_Output(other,self, " DIA_Addon_Merdarion_MakeUnitor_Done_01_02 " );	// Of course, here they are.
	b_giveinvitemsmanythings(other,self);
	anzahl_common = Npc_HasItems(other,ItMi_UnSharp_MagicCrystal);
	Npc_RemoveInvItems(other,ItMi_UnSharp_MagicCrystal,anzahl_common);
	CreateInvItems(other,ItMi_MagicCrystal,anzahl_common);
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_Done_01_03 " );	// Good. Wait a minute.
	B_UseFakeUnitor();
	AI_Output(self,other, " DIA_Addon_Merdarion_MakeUnitor_Done_01_04 " );	// Everything, ready. You can take your focus stones.
	b_giveinvitemsmanythings(self,other);
};
