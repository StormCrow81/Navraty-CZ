

instance DIA_Addon_Lares_Patch(C_Info)
{
	npc = VLK_449_Lares;
	nr = 99;
	condition = DIA_Addon_Lares_Patch_Condition;
	information = DIA_Addon_Lares_Patch_Info;
	description = "(Вернуть орнамент)";
};


func int DIA_Addon_Lares_Patch_Condition()
{
	if(Npc_HasItems(self,ItMi_Ornament_Addon_Vatras) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Patch_Info()
{
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
};


instance DIA_Lares_Kap1_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap1_EXIT_Condition;
	information = DIA_Lares_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_HaltsMaul(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_HaltsMaul_Condition;
	information = DIA_Addon_Lares_HaltsMaul_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Lares_HaltsMaul_Condition()
{
	if((Lares_HaltsMaul == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_HaltsMaul_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_HaltsMaul_09_01");	//Увидимся позже, в гавани.
	AI_StopProcessInfos(self);
};


instance DIA_Lares_PICKPOCKET(C_Info)
{
	npc = VLK_449_Lares;
	nr = 900;
	condition = DIA_Lares_PICKPOCKET_Condition;
	information = DIA_Lares_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lares_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_Lares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
	Info_AddChoice(DIA_Lares_PICKPOCKET,Dialog_Back,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lares_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};

func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};


instance DIA_Lares_HELLO (C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Lares_HALLO_Condition;
	information = DIA_Lares_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_HALLO_Condition()
{
	if((RangerMeetingRunning == 0) && (KAPITELORCATC == FALSE) && (Npc_CanSeeNpc(self,hero) == TRUE))
	{
		return TRUE;
	};
};

func void DAY_Lares_HALLO_Info()
{
	AI_Output(self,other, " DIA_Lares_HALLO_09_00 " );	// I must be crazy! What are you doing here?

	if ((Mil_310_already allowed in ==  FALSE ) && (Mil_333_already allowed in ==  FALSE ) && (SkipMeet ==  TRUE ))
	{
		B_GivePlayerXP(500);
		ComeThrowSea = TRUE;
		AI_Output(self,other, " DIA_Lares_HALLO_09_01 " );	// Have you come here?!
		AI_Output(self,other, " DIA_Lares_HALLO_09_02 " );	// This is the only way to bypass the guards at the city gates!
		B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,1);
	}
	else  if ((Mil_310_already allowed in ==  FALSE ) && (Mil_333_already allowed in ==  FALSE ) && (SkipMeet ==  FALSE ))
	{
		B_GivePlayerXP(300);
	}
	else
	{
		B_GivePlayerXP(100);
	};
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO, " Have we met before? " ,DIA_Lares_HALLO_NO);
	Info_AddChoice(DIA_Lares_HALLO, " Hey Lares, you old rascal! " ,DIA_Lares_HALLO_YES);
};

func void DAY_Lares_HALLO_NO()
{
	AI_Output(other,self, " DIA_Lares_HALLO_NO_15_00 " );	// Have we met before?
	AI_Output(self,other, " DIA_Lares_HALLO_NO_09_01 " );	// Boy, don't you remember me? We were together in the New Camp.
	AI_Output(self,other, " DIA_Lares_HALLO_NO_09_02 " );	// Not to mention the mine... Hey, we had a lot of fun there. Do you remember Lee?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO, " Of course I remember Lee! " ,DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO, " Ли?.. " ,DIA_Lares_HALLO_NOIDEA);
};

func void DAY_Lares_HALLO_YES()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Lares_HALLO_YES_15_00 " );	// Hey Lares, you old rascal! How did you get here?
	AI_Output(self,other, " DIA_Lares_HALLO_YES_09_01 " );	// I was able to get out of Mining Valley with Lee and the other guys.
	AI_Output(self,other, " DIA_Lares_HALLO_YES_09_02 " );	// You remember Lee, don't you?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO, " Of course I remember Lee! " ,DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO, " Ли?.. " ,DIA_Lares_HALLO_NOIDEA);
};

func void B_Lares_AboutLee()
{
	AI_Output(self,other, " B_Lares_AboutLee_09_00 " );	// I got out of the colony with him. Right after the Barrier was destroyed.
	AI_Output(self,other, " B_Lares_AboutLee_09_01 " );	// He and his guys are at Onar's farm now.
	AI_Output(self,other, " B_Lares_AboutLee_09_02 " );	// He made a deal with this farmer. Lee and the guys protect the farm, and Onar feeds them for it.
};

func void DAY_Lares_HALLO_LEE()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Lares_HALLO_LEE_15_00 " );	// Of course I remember Lee!
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};

func void DAY_Lares_HALLO_NOIDEA()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Ли?..
	AI_Output(self,other, " DIA_Lares_HALLO_NOIDEA_09_01 " );	// You seem to have been through a lot! Li was a mercenary leader in the New Camp.
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};


instance DIA_Addon_Lares_Vatras (C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_Vatras_Condition;
	information = DIA_Addon_Lares_Vatras_Info;
	description = " Vatras sent me! " ;
};

func int DIA_Addon_Lares_Vatras_Condition()
{
	if(Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Vatras_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_Vatras_15_00 " );	// Vatras sent me! He said that if I need help, I can turn to you.
	AI_Output(self,other, " DIA_Addon_Lares_Vatras_09_01 " );	// So, you've already seen Vatras... (surprised) You must have impressed him!
	AI_Output(self,other, " DIA_Addon_Lares_Vatras_09_02 " );	// Otherwise, he wouldn't tell you my name. Especially now that people are disappearing everywhere.
	AI_Output(self,other, " DIA_Addon_Lares_Vatras_09_03 " );	// So what do you need?
	Lares_RangerHelp = TRUE;
	if(GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine(BAU_974_Bauer,"GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine(Greg_NW,"Taverne");
	};
};


instance DIA_Addon_Lares_WhatAreYouGuys(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information = DIA_Addon_Lares_WhatAreYouGuys_Info;
	description = " What's your business with Vatras? " ;
};


func int DIA_Addon_Lares_WhatAreYouGuys_Condition()
{
	if((Lares_RangerHelp == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WhatAreYouGuys_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_WhatAreYouGuys_15_00 " );	// What's your business with Vatras?
	AI_Output(self,other, " DIA_Addon_Lares_WhatAreYouGuys_09_01 " );	// I made a small agreement with the waterbenders. Understand?
	AI_Output(other,self, " DIA_Addon_Lares_WhatAreYouGuys_15_02 " );	// What's the convention?
	AI_Output(self,other, " DIA_Addon_Lares_WhatAreYouGuys_09_03 " );	// We work for them, and they make sure we don't get in trouble because of our past in the colony.
	AI_Output(other,self, " DIA_Addon_Lares_WhatAreYouGuys_15_04 " );	// Are you talking about the 'Ring of Water'?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//Ты слышал о нем?
	AI_Output(other,self, " DIA_Addon_Lares_WhatAreYouGuys_15_06 " );	// Yes, Vatras told me.
	AI_Output(self,other, " DIA_Addon_Lares_WhatAreYouGuys_09_07 " );	// Well, you answered your own question.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater, " Lares belongs to the 'Ring of Water'. " );
};


instance DIA_Addon_Lares_Ranger(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Ranger_Condition;
	information = DIA_Addon_Lares_Ranger_Info;
	description = " Tell me about the 'Ring of Water'. " ;
};


func int DIA_Addon_Lares_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_WhatAreYouGuys) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ranger_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_Ranger_15_00 " );	// Tell me about the 'Ring of Water'.
	AI_Output(self,other, " DIA_Addon_Lares_Ranger_09_01 " );	// 'Ring' is to Water Mages what paladins are to Fire Mages.
	AI_Output(self,other, " DIA_Addon_Lares_Ranger_09_02 " );	// But unlike paladins, we operate in secret.
	AI_Output(self,other, " DIA_Addon_Lares_Ranger_09_03 " );	// The Ring is a powerful weapon in battles against the forces of evil that threaten Khorinis.
	AI_Output(self,other, " DIA_Addon_Lares_Ranger_09_04 " );	// But the power of the Ring is based on the fact that the names of its members are kept secret.
	AI_Output(self,other, " DIA_Addon_Lares_Ranger_09_05 " );	// So keep quiet about it!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Конечно.
	B_LogEntry(TOPIC_Addon_RingOfWater, " Members of the Ring Society are to water mages what paladins are to fire mages. But the brotherhood operates in secret. Its members do not give themselves away, and no one knows its true power. " );
};


instance DIA_Addon_Lares_WannaBeRanger(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_WannaBeRanger_Condition;
	information = DIA_Addon_Lares_WannaBeRanger_Info;
	description = " I want to join the Water Ring... " ;
};


func int DIA_Addon_Lares_WannaBeRanger_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Lares_Ranger ) && ( SC_IsRanger ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WannaBeRanger_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_WannaBeRanger_15_00 " );	// I want to join the Water Ring...
	AI_Output(self,other, " DIA_Addon_Lares_WannaBeRanger_09_01 " );	// I don't mind. But the decision as to whether you can join our ranks must be made by magicians.
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Понимаю.",DIA_Addon_Lares_WannaBeRanger_BACK);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger, " What does it mean to be a member of your society? " ,DIA_Addon_Lares_WannaBeRanger_HowIsIt);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger, " What did you do to impress waterbenders? " ,DIA_Addon_Lares_WannaBeRanger_AboutYou);
};

func void DIA_Addon_Lares_WannaBeRanger_BACK()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//Понимаю.
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
};

func void DIA_Addon_Lares_WannaBeRanger_AboutYou()
{
	AI_Output(other,self, " DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00 " );	// What did you do to impress the waterbenders?
	AI_Output(self,other, " DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01 " );	// I've been protecting them all the time we've lived beyond the Barrier.
	AI_Output(self,other, " DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02 " );	// (smiles) And they have many reasons to be grateful to me.
};

func void DIA_Addon_Lares_WannaBeRanger_HowIsIt()
{
	AI_Output(other,self, " DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00 " );	// What does it mean to be a member of your society?
	AI_Output(self,other, " DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01 " );	// We're not like other Khorinis communities you can join.
	AI_Output(self,other, " DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02 " );	// When you become one of us, we don't give you assignments you're not ready to complete.
	AI_Output(self,other, " DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03 " );	// The only thing required of you from the start is silence.
	AI_Output(self,other, " DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04 " );	// We operate in secret and don't want outsiders to know about our actions.
	AI_Output(self,other, " DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05 " );	// We'll be watching you. Everything else you will learn with time.
};

func void B_Lares_Secret Meeting()
{
	AI_Output(self,other, " DIA_Addon_Lares_RingBack_09_07 " );	// A meeting of society members will soon take place in Orlan's tavern.
	AI_Output(self,other, " DIA_Addon_Lares_RingBack_09_08 " );	// Come there and you'll get your gear.
};


instance DIA_Addon_Lares_RingBack(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_RingBack_Condition;
	information = DIA_Addon_Lares_RingBack_Info;
	description = " I have become a member of the Ring of Water Society. " ;
};

func int DIA_Addon_Lares_RingBack_Condition()
{
	if((SC_IsRanger == TRUE) && (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS) && ((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B") < 1000) || (Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") < 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_RingBack_15_00 " );	// I became a member of the Water Ring Society.

	if((Lares_GotRingBack == FALSE) && (SC_GotLaresRing == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Lares_RingBack_09_01 " );	// Great. Can I get my ring back?

		if(B_GiveInvItems(other,self,ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output(other,self, " DIA_Addon_Lares_RingBack_15_02 " );	// Of course, here it is.
			AI_Output(self,other, " DIA_Addon_Lares_RingBack_09_03 " );	// I hope you found it useful. I'm glad you became one of us.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP(XP_Ambient);
		}
		else
		{
			AI_Output(other,self, " DIA_Addon_Lares_RingBack_15_04 " );	// Hmm... I don't have it with me.
			AI_Output(self,other, " DIA_Addon_Lares_RingBack_09_05 " );	// Try to get him back as soon as possible! I need it.
		};
	};
	AI_Output(self,other, " DIA_Addon_Lares_RingBack_09_06 " );	// Perhaps you want to get the gear as soon as possible? Listen to me carefully.
	B_Lares_Secret Meeting();
	B_LogEntry(TOPIC_Addon_RingOfWater, " Lares invited me to a secret meeting of the Ring of Water at Orlan's tavern. " );
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
};

instance DIA_Addon_Lares_RingBack2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_RingBack2_Condition;
	information = DIA_Addon_Lares_RingBack2_Info;
	description = " Here is your ring. " ;
};

func int DIA_Addon_Lares_RingBack2_Condition()
{
	if((SC_IsRanger == TRUE) && (Npc_HasItems(other,ItRi_Ranger_Lares_Addon) >= 1) && (Lares_GotRingBack == FALSE) && (SC_GotLaresRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack2_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Addon_Lares_RingBack2_15_00 " );	// Here's your aquamarine ring.
	B_GiveInvItems(other,self,ItRi_Ranger_Lares_Addon,1);
	AI_Output(self,other, " DIA_Addon_Lares_RingBack2_09_01 " );	// Great! I was afraid you lost it.
	Lares_GotRingBack = TRUE;
};

instance DIA_Addon_Lares_Geduld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_Geduld_Condition;
	information = DIA_Addon_Lares_Geduld_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Lares_Geduld_Condition()
{
	if((RangerMeetingRunning == LOG_Running) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") > 200) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Geduld_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_Geduld_09_01 " );	// You'll have to wait a bit. Not everyone has arrived yet.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_GetRangerArmor (C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_GetRangerArmor_Condition;
	information = DIA_Addon_Lares_GetRangerArmor_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_GetRangerArmor_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") < 200) && (RangerMeetingRunning == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GetRangerArmor_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_00 " );	// So, my young friend, we are gathered here to celebrate your entry into the society of the Ring of Water.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_01 " );	// The people who are here right now will be watching over you.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_02 " );	// Of course, not all members of society are here, so be careful.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_03 " );	// We will be aware of your actions for the benefit of the Ring, as well as of all transgressions.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_04 " );	// Now accept this armor from the brotherhood.
	CreateInvItem(hero,ITAR_RANGER_Addon);
	AI_EquipArmor(hero,ITAR_RANGER_Addon);
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_05 " );	// Wear them with pride, but never wear them in the city or any other populated place.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_06 " );	// Remember, our names must remain secret. No one should know that we are members of society.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_07 " );	// Talking about the 'Ring of Water' is forbidden. This is our main rule. Remember it!
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_09_08 " );	// Any questions?
	JOINWATERRING = TRUE;
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor, " I have to go . " ,DIA_Addon_Lares_GetRangerArmor_end);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor, " How can you help me? " ,DIA_Addon_Lares_GetRangerArmor_Learn);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor, " What about weapons? " ,DIA_Addon_Lares_GetRangerArmor_weapons);
};

func void DIA_Addon_Lares_GetRangerArmor_weapons()
{
	AI_Output(other,self, " DIA_Addon_Lares_GetRangerArmor_weapons_15_00 " );	// What about weapons?
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_weapons_09_01 " );	// The traditional weapon of the members of the Fellowship of the Ring is the battlestaff, however, anyone can use the weapon they like.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_weapons_09_02 " );	// Here's one of our staffs. I haven't been able to master it yet, but you might find it useful.
	CreateInvItems(self,ItMw_RangerStaff_Addon,1);
	B_GiveInvItems(self,other,ItMw_RangerStaff_Addon,1);
	AI_Output(other,self, " DIA_Addon_Lares_GetRangerArmor_weapons_09_03 " );	// What about better armor?
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_weapons_09_04 " );	// That chain mail I gave you will protect you well enough. But if you need better armor...
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_weapons_09_05 " );	// In the port part of Khorinis, you can find another member of our society. His name is Karl.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_weapons_09_06 " );	// He's a blacksmith. Maybe you've met him before. Talk to him about it. Perhaps he can help you in this matter.
	RANGERCARL = TRUE;
};

func void DIA_Addon_Lares_GetRangerArmor_end()
{
	B_MakeRangerReadyToLeaveMeetingALL();
	AI_Output(other,self, " DIA_Addon_Lares_GetRangerArmor_end_15_00 " );	// I have to go.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_end_09_01 " );	// Great, we won't keep you.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_end_09_02 " );	// Go to Vatras and ask him to give you your first task.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_end_09_03 " );	// Brothers! It's time to get back to our work.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_end_09_04 " );	// The bandit attacks are still going on. We must eliminate this threat.
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_end_09_05 " );	// May Adanos keep the balance of our world.
	Lares_TakeFirstMissionFromVatras = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,Dialog_End,DIA_Addon_Lares_GetRangerArmor_next);
};

func void DIA_Addon_Lares_GetRangerArmor_next()
{
	B_LogEntry(TOPIC_Addon_RingOfWater, " At a secret meeting in Orlan's tavern, I was given my chain mail. Now I must go to Watras to give me my first task as a member of the 'Ring'. " );
	AI_StopProcessInfos(self);
	B_RangerMeetingParking();
};

func void DIA_Addon_Lares_GetRangerArmor_Learn()
{
	AI_Output(other,self, " DIA_Addon_Lares_GetRangerArmor_Learn_15_00 " );	// How can you help me?
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_Learn_09_01 " );	// I can make you more dexterous.
	if (Npc_IsDead(Sld_805_Cord) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_Learn_09_02 " );	// If you need to improve your melee skills, talk to Kord. He is a blademaster.
	};
	if (Npc_IsDead(BAU_961_Gaan) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_Learn_09_03 " );	// Gahan will teach you how to butcher animals properly.
	};
	if (Npc_IsDead(Mil_350_Addon_Martin) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_Learn_09_04 " );	// Martin has a lot to tell you about paladins.
	};
	if ( Npc_IsDead ( BAU_4300_Addon_Cavalorn ) ==  FALSE ) ;
	{
		AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_Learn_09_05 " );	// Cavalorn can teach you to sneak, one-handed, and archery.
	};
	if (Npc_IsDead(BAU_970_Orlan) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_Learn_09_06 " );	// Orlan will always have a warm room and a soft bed for you.
	};
	AI_Output(self,other, " DIA_Addon_Lares_GetRangerArmor_Learn_09_07 " );	// And when it comes to magic, you can rely on Vatras.
};


instance DIA_Addon_Lares_Teleportstation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Teleportstation_Condition;
	information = DIA_Addon_Lares_Teleportstation_Info;
	description = " Have you ever used a teleporter? " ;
};


func int DIA_Addon_Lares_Teleportstation_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SCUsed_TELEPORTER == TRUE) && (MIS_Lares_BringRangerToMe != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Teleportstation_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_Teleportstation_15_00 " );	// Have you ever used teleporters?
	AI_Output(self,other, " DIA_Addon_Lares_Teleportstation_09_01 " );	// No, but I've heard of them. Water magicians themselves are not yet sure of their reliability.
	AI_Output(other,self, " DIA_Addon_Lares_Teleportstation_15_02 " );	// I've already been through the teleporter.
	AI_Output(self,other, " DIA_Addon_Lares_Teleportstation_09_03 " );	// Of course! You're not afraid of anything at all, are you?
	AI_Output(self,other, " DIA_Addon_Lares_Teleportstation_09_04 " );	// Well, if you're not afraid to use them, ask the innkeeper Orlan to let you into his cave.
	AI_Output(self,other, " DIA_Addon_Lares_Teleportstation_09_05 " );	// One of the waterbender teleporters is hidden in it. The cave is located near his tavern.
	AI_Output(self,other, " DIA_Addon_Lares_Teleportstation_09_06 " );	// Exit through the eastern city gate and follow the road straight ahead. You won't miss.
	B_LogEntry(TOPIC_Addon_TeleportsNW, " Lares told me that there is a teleporter hidden near Orlan's tavern. " );
	Orlan_Hint_Lares = TRUE;
};


instance DIA_Addon_Lares_Ornament(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_Ornament_Condition;
	information = DIA_Addon_Lares_Ornament_Info;
	description = " Vatras asked me to give you this ornament. " ;
};


func int DIA_Addon_Lares_Ornament_Condition()
{
	if(Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && Npc_KnowsInfo(other,DIA_Addon_Lares_Vatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ornament_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_Ornament_15_00 " );	// Vatras asked me to give you this ornament. He said he should be taken back.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other, " DIA_Addon_Lares_Ornament_09_01 " );	// (sighs) Of course! As always, I get the job. I knew it.
	AI_Output(self,other, " DIA_Addon_Lares_Ornament_09_02 " );	// Now I have to trudge across half the island to give this thing to the waterbenders.
};


instance DIA_Addon_Lares_OrnamentBringJob(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_OrnamentBringJob_Condition;
	information = DIA_Addon_Lares_OrnamentBringJob_Info;
	description = " I can deliver the ornament! " ;
};


func int DIA_Addon_Lares_OrnamentBringJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ornament) && (MIS_Addon_Lares_Ornament2Saturas == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_OrnamentBringJob_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_OrnamentBringJob_15_00 " );	// I can take the ornament!
	AI_Output(self,other, " DIA_Addon_Lares_OrnamentBringJob_09_01 " );	// Hmmm...(thoughtfully) No, I'd rather take care of it myself. However, you can come with me.
	AI_Output(self,other, " DIA_Addon_Lares_OrnamentBringJob_09_02 " );	// But now I can't leave. I have to watch the harbor.
	B_LogEntry(TOPIC_Addon_KDW, " I gave Lares the Vatras Ornament. He wants to take it to the waterbenders and wants me to accompany him. " );
	MIS_Addon_Lares_Ornament2Saturas = LOG_Running;
};


instance DIA_Addon_Lares_YourMission(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_YourMission_Condition;
	information = DIA_Addon_Lares_YourMission_Info;
	permanent = TRUE;
	description = " What exactly do you do in the port? " ;
};


func int DIA_Addon_Lares_YourMission_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ornament) && (MIS_Lares_BringRangerToMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_YourMission_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_YourMission_15_00 " );	// What exactly are you doing at the port?

	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_01 " );	// I can't tell you.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_02 " );	// Vatras will kill me...
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_03 " );	// I do what we all do. I'm doing the task given to me by the waterbenders.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_04 " );	// Some of the missing people were fishermen. They disappeared along with their boats.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_05 " );	// That's why I'm here watching the harbor. If anything else happens, I'll notice it.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_06 " );	// But you can help me.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_07 " );	// I'll give you my aquamarine ring. It shows that its owner belongs to the Ring of Water.
		CreateInvItems(self,ItRi_Ranger_Lares_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Lares_Addon,1);
		SC_GotLaresRing = TRUE;
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_08 " );	// If you wear my ring, it will be clear to the members of the brotherhood that you are acting on my behalf.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_09 " );	// Find someone to relieve me so I can deliver the ornament.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_10 " );	// One of ours is constantly on duty at the market. But I don't know whose shift it is.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_11 " );	// You'd better talk to everyone standing there. When our man sees the aquamarine ring, he will open himself to you.
		AI_Output(self,other, " DIA_Addon_Lares_YourMission_09_12 " );	// Tell him I need someone to relieve me at the port.
		B_LogEntry(TOPIC_Addon_RingOfWater, " Lares gave me an aquamarine ring, the secret sign of the Ring of Water. If I wear it, the other members of the Ring of Water will be able to open up to me. " );
		Log_CreateTopic(TOPIC_Addon_BringRangerToLares,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_BringRangerToLares, " Lares wants to leave the harbor. I should walk around the market wearing an aquamarine ring and try to find someone to take Lares' place. " );
		MIS_Lares_BringRangerToMe = LOG_Running;
	};
};


instance DIA_Addon_Lares_BaltramAbloese(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_BaltramAbloese_Condition;
	information = DIA_Addon_Lares_BaltramAbloese_Info;
	description = " I spoke with Baltram. " ;
};


func int DIA_Addon_Lares_BaltramAbloese_Condition()
{
	if((MIS_Lares_BringRangerToMe == LOG_Running) && (Baltram_Exchange4Lares == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Addon_Lares_BaltramAbloese_15_00 " );	// I spoke with Baltram. He will find you a replacement.
	AI_Output(self,other, " DIA_Addon_Lares_BaltramAbloese_09_01 " );	// Very good! In that case, we can go.

	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Lares_BaltramAbloese_09_02 " );	// You can keep my ring for now.
		if(Npc_KnowsInfo(other,DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output(self,other, " DIA_Addon_Lares_BaltramAbloese_09_03 " );	// (smiles) I think it will still help you.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Lares_BaltramAbloese_09_04 " );	// (smiles) Who knows, you might decide to become one of us...
		};
	};
	Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares,LOG_SUCCESS);
	B_LogEntry(TOPIC_Addon_BringRangerToLares, " I have informed Lares that I have found a replacement for him. He is now free to leave his post. " );
	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	Lares_CanBringScToPlaces = TRUE;
};


var int Lares_PeopleMissing_PERM;

instance DIA_Addon_Lares_PeopleMissing(C_Info)
{
	npc = VLK_449_Lares;
	nr = 3;
	condition = DIA_Addon_Lares_PeopleMissing_Condition;
	information = DIA_Addon_Lares_PeopleMissing_Info;
	permanent = TRUE;
	description = " About missing people... " ;
};


func int DIA_Addon_Lares_PeopleMissing_Condition()
{
	if((Lares_RangerHelp == TRUE) && (Lares_PeopleMissing_PERM == FALSE) && ((SC_IsRanger == FALSE) || (MissingPeopleReturnedHome == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PeopleMissing_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_PeopleMissing_15_00 " );	// About missing people...
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice(DIA_Addon_Lares_PeopleMissing,Dialog_Back,DIA_Addon_Lares_PeopleMissing_BACK);

	if(MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing, " I managed to save some of the kidnapped people. " ,DIA_Addon_Lares_PeopleMissing_SAVED);
	}
	else if((MIS_Lares_BringRangerToMe != 0) && (SCKnowsMissingPeopleAreInAddonWorld == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing, " I know what happened to missing people! " ,DIA_Addon_Lares_PeopleMissing_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing, " Shouldn't the militia be doing this? " ,DIA_Addon_Lares_PeopleMissing_MIL);
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing, " Tell me what you know. " ,DIA_Addon_Lares_PeopleMissing_TellMe);
	};
};

func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output(other,self, " DIA_Addon_Lares_PeopleMissing_TellMe_15_00 " );	// Tell me what you know.
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_TellMe_09_01 " );	// William, one of the city's fishermen, was the first to go missing. One fine day, he simply did not return from swimming.
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_TellMe_09_02 " );	// At first we thought that he and his boat were just eaten by sea monsters.
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_TellMe_09_03 " );	// But after a while, other people began to disappear, both townspeople and residents of the suburbs.
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_TellMe_09_04 " );	// No one has been found yet. It looks like we just have to wait until someone stumbles upon some clue.

	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
		SC_HearedAboutMissingPeople = TRUE;
	};
};

func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output(other,self, " DIA_Addon_Lares_PeopleMissing_MIL_15_00 " );	// Shouldn't the militia be doing this?
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_MIL_09_01 " );	// In my opinion, the militia is pretty useless here.
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_MIL_09_02 " );	// People disappeared without any trace. No, the militia cannot cope here.
};

func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output(other,self, " DIA_Addon_Lares_PeopleMissing_Success_15_00 " );	// I know what happened to the missing people!
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_Success_09_01 " );	// (surprised) Really?
	AI_Output(other,self, " DIA_Addon_Lares_PeopleMissing_Success_15_02 " );	// They were kidnapped by the former ore baron Raven.
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_Success_09_03 " );	// Are you sure? In that case, we must release them.
	AI_Output(other,self, " DIA_Addon_Lares_PeopleMissing_Success_15_04 " );	// I'm working on it.
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_Success_09_05 " );	// Very good. And don't forget, if you need my help...
	AI_Output(other,self, " DIA_Addon_Lares_PeopleMissing_Success_15_06 " );	// ...then I know where to find you. All clear.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_SAVED()
{
	AI_Output(other,self, " DIA_Addon_Lares_PeopleMissing_SAVED_15_00 " );	// I managed to save some of the kidnapped people.
	AI_Output(self,other, " DIA_Addon_Lares_PeopleMissing_SAVED_09_01 " );	// I knew you could handle it. Now I can finally do my own thing.
	B_GivePlayerXP(XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};


var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gild_OneTime_money;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;

instance DIA_Addon_Lares_RangerHelp(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_RangerHelp_Condition;
	information = DIA_Addon_Lares_RangerHelp_Info;
	permanent = TRUE;
	description = " I need your help. " ;
};


func int DIA_Addon_Lares_RangerHelp_Condition()
{
	if(((Lares_RangerHelp == TRUE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)) || Npc_IsInState(Moe,ZS_Attack))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RangerHelp_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_RangerHelp_15_00 " );	// I need your help.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_09_01 " );	// What exactly do you need?
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice(DIA_Addon_Lares_RangerHelp,Dialog_Back,DIA_Addon_Lares_RangerHelp_nix);
	if ((DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe ==  FALSE ) && (Lares_RangerHelp ==  TRUE ))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp, " I need a better weapon. " ,DIA_Addon_Lares_RangerHelp_waffe);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp, " How about better armor? " ,DIA_Addon_Lares_RangerHelp_ruestung);
	};
	if ((DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld ==  FALSE ) && (Lares_RangerHelp ==  TRUE ))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp, " I need money. " ,DIA_Addon_Lares_RangerHelp_geld);
	};
};

func void DIA_Addon_Lares_RangerHelp_ruestung()
{
	AI_Output(other,self, " DIA_Addon_Lares_RangerHelp_ruestung_15_00 " );	// How about better armor?
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_ruestung_09_01 " );	// Armor is sold by Matteo. But he will skin you three times for her.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_ruestung_09_02 " );	// But you can get the armor for free, as long as you don't mind breaking the law a bit...
	AI_Output(other,self, " DIA_Addon_Lares_RangerHelp_ruestung_15_03 " );	// What do you mean?
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_ruestung_09_04 " );	// There is a small open warehouse near Matteo's house. But all the goods there were confiscated by the militia.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_ruestung_09_05 " );	// Go to the market and buy a sleep spell from Zuris. It will allow you to put the guard to sleep.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_ruestung_09_06 " );	// I'm sure that among Matteo's things you will find a worthy armor for yourself...
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_waffe()
{
	AI_Output(other,self, " DIA_Addon_Lares_RangerHelp_waffe_15_00 " );	// I need a better weapon.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_waffe_09_01 " );	// I'm afraid I can't help you here. Why don't you go to the market?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE ;
};

func void DIA_Addon_Lares_RangerHelp_geld()
{
	AI_Output(other,self, " DIA_Addon_Lares_RangerHelp_geld_15_00 " );	// I need money.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_geld_09_01 " );	// And who doesn't need them? I'm sorry, but I overdid it myself. However, the usurer Lemar owes me something.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_geld_09_02 " );	// Go to him and borrow as much as you need. I'll take care of the rest. Lemar's house is located on the border of the port and the lower quarter of the city.
	DIA_Addon_Lares_RangerHelp_gild_OneTime_money = TRUE ;
	RangerHelp_LehmarKohle = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};

func void DIA_Addon_Lares_RangerHelp_nix()
{
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};


instance DIA_Lares_Paladine(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = DIA_Lares_Paladine_Condition;
	information = DIA_Lares_Paladine_Info;
	permanent = FALSE;
	description = " I need to talk to the paladins no matter what! " ;
};


func int DIA_Lares_Paladine_Condition()
{
	if ((other.guild ==  GIL_NONE ) && (RangerHelp_gildeMIL ==  FALSE ) && (RangerHelp_gildeSLD ==  FALSE ) && (RangerHelp_gildeKDF ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lares_Paladine_Info()
{
	AI_Output(other,self, " DIA_Lares_Paladine_15_00 " );	// I need to talk to the paladins no matter what!
	AI_Output(self,other, " DIA_Lares_Paladine_09_01 " );	// What do you need from THEM?
	AI_Output(other,self, " DIA_Lares_Paladine_15_02 " );	// They have an amulet, the Eye of Innos. I have to get it.
	AI_Output(self,other, " DIA_Lares_Paladine_09_03 " );	// And you think they'll give it to you? You'll never get to the upper quarter of the city.
	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_Vatras))
	{
		AI_Output(other,self, " DIA_Lares_Paladine_15_04 " );	// I'll think of something.
		AI_Output(self,other, " DIA_Lares_Paladine_09_05 " );	// Of course, if you can earn the respect of the townspeople or become an errand boy in the militia...
	};
};


instance DIA_Lares_WhyPalHere(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = DIA_Lares_WhyPalHere_Condition;
	information = DIA_Lares_WhyPalHere_Info;
	permanent = FALSE;
	description = " Do you know why the paladins came here? " ;
};


func int DIA_Lares_WhyPalHere_Condition()
{
	if(other.guild == GIL_NONE)
	{
		if (Npc_KnowsInfo(other,DIA_Lares_Paladine) || (RangerHelp_gildeMIL ==  TRUE ) || (RangerHelp_gildeSLD ==  TRUE ) || (RangerHelp_gildeKDF ==  TRUE ))
		{
			return TRUE;
		};
	};
};

func void DIA_Lares_WhyPalHere_Info()
{
	AI_Output(other,self, " DIA_Lares_WhyPalHere_15_00 " );	// Do you know why the paladins came here?
	AI_Output(self,other, " DIA_Lares_WhyPalHere_09_01 " );	// No one knows for sure... Most people think it's because of the orcs, but I think it's something else.
	AI_Output(self,other, " DIA_Lares_WhyPalHere_09_02 " );	// Most likely it has something to do with the old colony.
};


instance DIA_Addon_Lares_Gilde (C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Gilde_Condition;
	information = DIA_Addon_Lares_Gilde_Info;
	permanent = TRUE;
	description = " Can you help me join one of the communities? " ;
};


func int DIA_Addon_Lares_Gilde_Condition()
{
	if ((Lares_RangerHelp ==  TRUE ) && (other.guild ==  GIL_NONE ) && (RangerHelp_gildeMIL ==  FALSE ) && (RangerHelp_gildeSLD ==  FALSE ) && (RangerHelp_gildeKDF ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Gilde_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_Gilde_15_00 " );	// Vatras said you could help me join one of the communities.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_09_01 " );	// (laughs) What, tired of being a second-class person?
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_09_02 " );	// Okay, I understand everything.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_09_03 " );	// If you want to join Lee, I can use my influence among the mercenaries.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_09_04 " );	// I'm sure we can also find a quick way to assign you to a monastery.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_09_05 " );	// But the easiest way, of course, is for you to join the militia.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_09_06 " );	// So which do you prefer?
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
	Info_AddChoice(DIA_Addon_Lares_Gilde, " I'll think about it... " ,DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice(DIA_Addon_Lares_Gilde, " Fire Mages. " ,DIA_Addon_Lares_Gilde_KDF);
	Info_AddChoice(DIA_Addon_Lares_Gilde, " Наемников. " ,DIA_Addon_Lares_Gilde_SLD);
	Info_AddChoice(DIA_Addon_Lares_Gilde, " Ополчение. " ,DIA_Addon_Lares_Gilde_MIL);
};

func void DIA_Addon_Lares_Gilde_BACK()
{
	AI_Output(other,self, " DIA_Addon_Lares_Gilde_BACK_15_00 " );	// I need to think...
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_SLD()
{
	AI_Output(other,self, " DIA_Addon_Lares_Gilde_SLD_15_00 " );	// Mercenaries.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_SLD_09_01 " );	// I'm sure Lee will accept you.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_SLD_Add_09_01 " );	// But first you'll have to pass the test.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_SLD_09_02 " );	// Go to Onar's farm and talk to Kord.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_SLD_Add_09_02 " );	// He will help you.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_SLD_09_03 " );	// Tell him you're 'under my wing'. He will understand you.
	RangerHelp_gildeSLD = TRUE ;
	Log_CreateTopic(TOPIC_Addon_RangerHelpSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD, " Lares said that the mercenary Kord could make my life among the mercenaries easier. " );
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_MIL()
{
	AI_Output(other,self, " DIA_Addon_Lares_Gilde_MIL_15_00 " );	// Militia.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_MIL_09_01 " );	// (cheerfully) I take it you'll like it. Enforce the laws while cleaning out the wallets of the townspeople.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_MIL_09_02 " );	// The paladins have set up a warehouse for their supplies in the harbor. Their quartermaster is a good friend of mine.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_MIL_09_03 " );	// I think he can help you. His name is Martin.
	Log_CreateTopic(TOPIC_Addon_RangerHelpMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpMIL, " Lares says that Quartermaster Martin can help me quickly join the militia. Martin can usually be found in the harbor, where he supplies paladins. " );
	RangerHelp_gildeMIL = TRUE ;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_KDF()
{
	AI_Output(other,self, " DIA_Addon_Lares_Gilde_KDF_15_00 " );	// Mages of fire.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_KDF_09_01 " );	// (laughs) I'm sure Vatras didn't foresee your choice. Otherwise he would not have sent you to me.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_KDF_09_02 " );	// The path to novices requires money.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_KDF_09_03 " );	// If you don't pay, they won't let you into the monastery.
	AI_Output(self,other, " DIA_Addon_Lares_Gilde_KDF_09_04 " );	// The only one who can help you here is Vatras himself. So talk to him.
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF, " Lares said that Vatras knows an easy way to get into the monastery. " );
	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};


var int Lares_WorkForLee;
var int Lares_WayToOnar;

instance DIA_Lares_AboutSld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_AboutSld_Condition;
	information = DIA_Lares_AboutSld_Info;
	permanent = TRUE;
	description = " Tell me about Lee and the mercenaries. " ;
};


func int DIA_Lares_AboutSld_Condition()
{
	if (( other . guild ==  GIL_NONE ) && ( Lares_WayToHonor ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lares_AboutSld_Info()
{
	AI_Output(other,self, " DIA_ADDON_Lares_AboutSld_15_00 " );	// Tell me about Lee and the mercenaries.
	AI_Output(self,other, " DIA_ADDON_Lares_AboutSld_09_01 " );	// What do you want to know?
	Info_ClearChoices(DIA_Lares_AboutSld);
	Info_AddChoice(DIA_Lares_AboutSld,Dialog_Back,DIA_Lares_AboutSld_BACK);
	Info_AddChoice(DIA_Lares_AboutSld, " Why aren't YOU with Lee and the mercenaries? " ,DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice(DIA_Lares_AboutSld, " Tell me more about mercenaries. " ,DIA_Lares_AboutSld_Sld);
	Info_AddChoice(DIA_Lares_AboutSld, " How can I find Onar's farm? " ,DIA_Lares_AboutSld_WayToOnar);
};

func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices(DIA_Lares_AboutSld);
};

func void DIA_Lares_AboutSld_Sld()
{
	AI_Output(other,self, " DIA_Lares_AboutSld_15_00 " );	// Tell me more about the mercenaries.
	AI_Output(self,other, " DIA_Lares_AboutSld_09_01 " );	// Well, if you're as strong as you were in the valley, then you shouldn't have a problem with them.
	AI_Output(self,other, " DIA_Lares_AboutSld_09_02 " );	// Most of them are real thugs, and if you can't fight them off, you won't get very far.
	AI_Output(self,other, " DIA_Lares_AboutSld_09_03 " );	// (laughs) If you show weakness, you won't have a chance to join them...
};

func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output(other,self, " DIA_Lares_WhyInCity_15_00 " );	// Why aren't YOU with Lee and the mercenaries?
	AI_Output(self,other, " DIA_Lares_WhyInCity_09_01 " );	// I'm with them! I'm just not on the farm right now.
	AI_Output(self,other, " DIA_Lares_WhyInCity_09_02 " );	// You could say I'm their outpost in the city. We don't want the ship to leave without us.
	Lares_WorkForLee = TRUE;
	Info_AddChoice(DIA_Lares_AboutSld, " What ship are you talking about? " ,DIA_Lares_AboutSld_Schiff);
};

func void DIA_Lares_AboutSld_Schiff()
{
	AI_Output(other,self, " DIA_Lares_Schiff_15_00 " );	// What ship are you talking about?
	AI_Output(self,other, " DIA_Lares_Schiff_09_01 " );	// He stands in the harbor of the port, behind the cliffs. Lee and some of his people really want to get out of here.
	AI_Output(self,other, " DIA_Lares_Schiff_09_02 " );	// But this may take a while...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Почему?
	AI_Output(self,other, " DIA_Lares_Schiff_09_04 " );	// You'd better ask Lee if you meet him... He has a plan.
};

func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output(other,self, " DIA_Lares_WegZumHof_15_00 " );	// How can I find Onar's farm?
	AI_Output(self,other, " DIA_Addon_Lares_WegZumHof_09_00 " );	// This is pretty simple. You exit the city through the east gate and then follow the road to the east.

	if(RealMode[2] == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Lares_WegZumHof_09_01 " );	// If you want, I can accompany you.
		Lares_WayToOnar = TRUE;
	};
};

instance DIA_Lares_GuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 14;
	condition = DIA_Lares_GuildOfThieves_Condition;
	information = DIA_Lares_GuildOfThieves_Info;
	permanent = FALSE;
	description = " Do you know anything about the city's thieves' guild? " ;
};


func int DIA_Lares_GuildOfThieves_Condition()
{
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_GuildOfThieves_Info()
{
	AI_Output(other,self, " DIA_Lares_GuildOfThieves_15_00 " );	// Do you know anything about the city's thieves' guild?
	AI_Output(self,other, " DIA_Lares_GuildOfThieves_09_01 " );	// Well, you ask questions...
	AI_Output(self,other, " DIA_Lares_GuildOfThieves_09_02 " );	// Of course, there's a thieves' guild here. Just like in any big city.
	AI_Output(self,other, " DIA_Lares_GuildOfThieves_09_03 " );	// And every more or less worthy thief probably has something to do with them.
};


instance DIA_Lares_WhereGuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 15;
	condition = DIA_Lares_WhereGuildOfThieves_Condition;
	information = DIA_Lares_WhereGuildOfThieves_Info;
	permanent = FALSE;
	description = " Do you know where I can find the Thieves Guild? " ;
};


func int DIA_Lares_WhereGuildOfThieves_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lares_GuildOfThieves ) && ( DG_found ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lares_WhereGuildOfThieves_Info()
{
	AI_Output(other,self, " DIA_Lares_WhereGuildOfThieves_15_00 " );	// Do you know where I can find the Thieves Guild?
	AI_Output(self,other, " DIA_Lares_WhereGuildOfThieves_09_01 " );	// (laughs) Don't be offended, but even if I knew, I wouldn't say.
	AI_Output(self,other, " DIA_Lares_WhereGuildOfThieves_09_02 " );	// These people usually react VERY harshly to such things.
	AI_Output(self,other, " DIA_Lares_WhereGuildOfThieves_09_03 " );	// If you're going to contact them, you need to be careful.
};


instance DIA_Lares_GotKey(C_Info)
{
	npc = VLK_449_Lares;
	nr = 16;
	condition = DIA_Lares_GotKey_Condition;
	information = DIA_Lares_GotKey_Info;
	permanent = FALSE;
	description = " I found this key here. It's all eaten away by sea water... " ;
};


func int DIA_Lares_GotKey_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_WhereGuildOfThieves) && Npc_HasItems(other,ItKe_ZhiefGuildKey_MIS) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_GotKey_Info()
{
	AI_Output(other,self, " DIA_Lares_GotKey_15_00 " );	// I found this key here. It's all eaten up by sea water...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//И?
	AI_Output(other,self, " DIA_Lares_GotKey_15_02 " );	// I think he will lead me to the lair of the thieves' guild...
	AI_Output(self,other, " DIA_Lares_GotKey_09_03 " );	// Well, it could be a sewer key.
};


instance DIA_Lares_Sewerage (C_Info)
{
	npc = VLK_449_Lares;
	nr = 17;
	condition = DIA_Lares_Kanalisation_Condition;
	information = DIA_Lares_Sewerage_Info;
	permanent = FALSE;
	description = " Where can I find the sewers? " ;
};


func int DIA_Lares_Sewerage_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lares_GotKey ) && ( DG_found ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lares_Sewerage_Info()
{
	AI_Output(other,self, " DIA_Lares_Kanalisation_15_00 " );	// Where can I find sewers?
	AI_Output(self,other, " DIA_Lares_Kanalisation_09_01 " );	// As far as I know... sewers usually go out to the ocean.
};


instance DIA_Lares_OtherGuild(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_OtherGuild_Condition;
	information = DIA_Lares_OtherGuild_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_OtherGuild_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_NONE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_OtherGuild_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other, " DIA_Lares_OtherGuild_09_00 " );	// Now you're in the militia!
			AI_Output(self,other, " DIA_Lares_OtherGuild_09_01 " );	// (laughs) You can die of laughter - a former convict in the militia...
		}
		else
		{
			AI_Output(self,other, " DIA_Lares_OtherGuild_09_02 " );	// So now you're one of the king's paladins!
		};
		AI_Output(self,other, " DIA_Lares_OtherGuild_09_03 " );	// (slyly) Only you could pull this off...
		if(Lares_WorkForLee == TRUE)
		{
			AI_Output(self,other, " DIA_Lares_OtherGuild_09_04 " );	// (worried) You're not going to tell anyone that I work for Lee, are you?
			AI_Output(other,self, " DIA_Lares_OtherGuild_15_05 " );	// You know me...
		};
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other, " DIA_Lares_OtherGuild_09_06 " );	// I don't understand this. Have you gone to a monastery? How did it happen?
		AI_Output(other,self, " DIA_Lares_OtherGuild_15_07 " );	// So it happened.
		AI_Output(self,other, " DIA_Lares_OtherGuild_09_08 " );	// I can imagine.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Addon_Lares_OtherGuild_09_00 " );	// I heard you've been hired by Lee's mercenaries.
		AI_Output(self,other, " DIA_Lares_OtherGuild_09_10 " );	// Congratulations!
	}
	else if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Addon_Lares_OtherGuild_09_11 " );	// You have embarked on the path of the Waterbenders. Well, I absolutely welcome this choice!
		AI_Output(self,other, " DIA_Lares_OtherGuild_09_12 " );	// Congratulations.
	}
	else if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Addon_Lares_OtherGuild_09_12 " );	// (with apprehension) Have you embarked on the path of dark magicians?
		AI_Output(self,other, " DIA_Lares_OtherGuild_09_13 " );	// Sometimes I don't understand what's going on in your mind when you do things like that.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Addon_Lares_OtherGuild_09_13 " );	// You again followed the path of the Brotherhood! Is this faith so strong in you?
		AI_Output(self,other, " DIA_Lares_OtherGuild_09_14 " );	// What is your choice, and it's not for me to condemn it.
	};
};

instance DIA_Addon_Lares_Forest(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Addon_Lares_Forest_Condition;
	information = DIA_Addon_Lares_Forest_Info;
	description = " Can you guide me through the eastern forest? " ;
};

func int DIA_Addon_Lares_Forest_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && (RealMode[2] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_RangerHelp_Forest_15_00 " );	// Can you guide me through the eastern forest?
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_Forest_09_01 " );	// Of course. But what do you need there?
	AI_Output(other,self, " DIA_Addon_Lares_RangerHelp_Forest_15_02 " );	// Nefarious tasked me with finding the missing ornaments.
	AI_Output(other,self, " DIA_Addon_Lares_RangerHelp_Forest_15_03 " );	// One of the places he pointed out is in this forest.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_Forest_09_04 " );	// I understand. While it would be too dangerous for you to go there alone.
	AI_Output(self,other, " DIA_Addon_Lares_RangerHelp_Forest_09_05 " );	// Good. When you're ready to go, tell me.
	RangerHelp_OrnamentForest = TRUE;
};

instance DIA_Lares_GoNow (C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_GoNow_Condition;
	information = DIA_Lares_GoNow_Info;
	permanent = TRUE;
	description = " Okay, let's go. " ;
};

func int DIA_Lares_GoNow_Condition()
{
	if((LaresGuideForest == TRUE) && (LaresGuideMage == TRUE) && (LaresGuideOnar == TRUE))
	{
		return  FALSE ;
	};
	if(((Lares_WayToOnar == TRUE) || (MIS_Addon_Lares_Ornament2Saturas == LOG_Running) || (RangerHelp_OrnamentForest == TRUE)) && ((LaresGuide_ZumPortal == 0) || (LaresGuide_ZumPortal == 8)) && ((LaresGuide_ZuOnar == FALSE) || (LaresGuide_ZuOnar == LOG_SUCCESS)) && ((LaresGuide_OrnamentForest == 0) || (LaresGuide_OrnamentForest ==  3 )) && (Capital <  3 ))
	{
		return TRUE;
	};
};

func void DIA_Lares_GoNow_Info()
{
	AI_Output(other,self, " DIA_Lares_GoNow_15_00 " );	// Okay, let's go.

	if(Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Lares_GoNow_09_03 " );	// I can't leave here until we know more about the missing people or until someone relieves me.
	}
	else if(MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running)
	{
		B_Lares_Secret Meeting();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_04");	//Куда?
		Info_ClearChoices(DIA_Lares_GoNow);
		Info_AddChoice(DIA_Lares_GoNow,Dialog_Back,DIA_Lares_GoNow_warte);

		if((Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS))
		{
			Info_AddChoice(DIA_Lares_GoNow, " On the other hand. " ,DIA_Lares_GoNow_Onar);
		};
		if ((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && (Lares_Arrived ==  FALSE ))
		{
			Info_AddChoice(DIA_Lares_GoNow, " Let's bring back the Vatras ornament. " ,DIA_Lares_GoNow_Maya);
		};
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
		{
			Info_AddChoice(DIA_Lares_GoNow, " To the forest in the east. " ,DIA_Lares_GoNow_Forest);
		};
	};
};

func void DIA_Lares_GoNow_Maya()
{
	AI_Output(other,self, " DIA_Addon_Lares_GoNow_Maya_15_00 " );	// Let's bring back the Vatras ornament.
	AI_Output(self,other, " DIA_Lares_GoNow_09_01 " );	// Let's go... Follow me.
	LaresGuide_ZumPortal = TRUE;
	Lares_Guide = Wld_GetDay();
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");

	if ( Npc_KnowsInfo ( other , DIA_Moe_Hallo ) ==  FALSE )
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};

func void DIA_Lares_GoNow_Honor()
{
	AI_Output(other,self, " DIA_Addon_Lares_GoNow_Onar_15_00 " );	// To Onar's farm.
	AI_Output(self,other, " DIA_Lares_GoNow_09_01 " );	// Let's go... Follow me.
	LaresGuide_ZuOnar = TRUE;
	Lares_Guide = Wld_GetDay();
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");

	if ( Npc_KnowsInfo ( other , DIA_Moe_Hallo ) ==  FALSE )
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};

func void DIA_Lares_GoNow_Forest()
{
	AI_Output(other,self, " DIA_Addon_Lares_GoNow_Forest_15_00 " );	// To the forest in the east.
	AI_Output(self,other, " DIA_Lares_GoNow_09_01 " );	// Let's go... Follow me.
	LaresGuide_OrnamentForest = TRUE;
	Lares_Guide = Wld_GetDay();
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD1");

	if ( Npc_KnowsInfo ( other , DIA_Moe_Hallo ) ==  FALSE )
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};

func void DIA_Lares_GoNow_warte()
{
	Info_ClearChoices(DIA_Lares_GoNow);
};

instance DIA_Lares_GUIDE (C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_GUIDE_Condition;
	information = DIA_Lares_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_GUIDE_Condition()
{
	if((LaresGuide_ZuOnar == TRUE) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05"))
	{
		return TRUE;
	};
};

func void DIA_Lares_GUIDE_Info()
{
	if ( Lares_Guide > ( Wld_GetDay ( ) --  2 ))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//Пришли.
	}
	else
	{
		AI_Output(self,other, " DIA_Lares_GUIDE_09_01 " );	// There you are. And I already began to think that you were bitten by wolves.
	};

	AI_Output(self,other, " DIA_Lares_GUIDE_09_02 " );	// Well, you can walk the rest of the way on your own. And I need to get back to the city...
	AI_Output(self,other, " DIA_Lares_GUIDE_09_03 " );	// Just go down this road. But remember - manage to stand up for yourself, do not break the law and everything will be in order.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	LaresGuide_ZuOnar = LOG_SUCCESS;
	LaresGuideOnar = TRUE;
};


instance DIA_Addon_Lares_ArrivedPortalInter1(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInter1_Info;
	important = TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInter1_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11") && (LaresGuide_ZumPortal == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_09_00 " );	// Now that we've left town and can't be overheard, I want to tell you something.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_09_01 " );	// The ornament you gave me should be taken to Saturas. You remember Saturas, don't you?
	LaresGuide_ZumPortal = 2;
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1, " Finally. " ,DIA_Addon_Lares_ArrivedPortalInter1_ja);
	Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1, " Saturas? Who is this? " ,DIA_Addon_Lares_ArrivedPortalInter1_wer);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2()
{
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00 " );	// We guys from the former New Camp have kept good relations with the waterbenders.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01 " );	// Even Lee is willing to protect waterbenders from any danger, if only he can.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02 " );	// In order to keep in touch with the magicians, I am in the city almost constantly, working with Vatras.
	B_MakeRangerReadyForMeeting(self);
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03 " );	// And such armor is given out by waterbenders to each of us. Members of the Ring of Water society wore such armor before the war with the orcs.

	if(Cavalorn_RangerHint == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04 " );	// And how does Cavalorn feel about all this? As far as I know, in the New Camp he did nothing of the sort.
		AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05 " );	// You're right. But our community is growing, and even I don't know how many members it has now.
	};

	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06 " );	// But we need to go. When we move away from the city, we can talk more.
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer()
{
	AI_Output(other,self, " DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00 " );	// Saturas? Who is that?
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01 " );	// He was in charge of the waterbenders at the New Camp in the Valley of Mines before the Barrier was destroyed.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02 " );	// Lee and I formed an alliance with the waterbenders back then.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00 " );	// Of course! He was the top waterbender at the New Camp.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2();
};

instance DIA_Addon_Lares_ArrivedPortalInterWeiter(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	important = TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02") && (LaresGuide_ZumPortal == 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00 " );	// What's wrong? Why are you delaying?
	LaresGuide_ZumPortal = 3;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14") && (LaresGuide_ZumPortal == 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00 " );	// Don't distract me.
	LaresGuide_ZumPortal = 4;
};


instance DIA_Addon_Lares_ArrivedPortalInter2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInter2_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInter2_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58") && (LaresGuide_ZumPortal == 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter2_09_00 " );	// Waterbenders are fully immersed in their work. They've been digging up some ruins to the northeast for weeks now. No one knows what they are trying to find there.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter2_09_01 " );	// It all started with earthquakes, like the worst days of the Barrier.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter2_09_02 " );	// Terrible stone creatures emerged from the ground, killing anyone who came closer than thirty meters to them.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter2_09_03 " );	// The waterbenders took matters into their own hands and destroyed the monsters. And now they are excavating, trying to find an explanation for these strange events.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInter2_09_04 " );	// But you'll see for yourself soon.
	LaresGuide_ZumPortal = 5;
	B_LogEntry(TOPIC_Addon_KDW, " Lares told me about the waterbenders' excavations. The waterbenders are investigating unusual events that have been happening lately - strange earthquakes and mysterious stone creatures appearing from the ground. " );
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter3(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) && (LaresGuide_ZumPortal == 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00 " );	// Are you moving on?
	LaresGuide_ZumPortal = 6;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter4(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02") && (LaresGuide_ZumPortal == 6))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00 " );	// Very good. It can be dangerous here.
	LaresGuide_ZumPortal = 7;
};


instance DIA_Addon_Lares_ArrivedPortal(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortal_Condition;
	information = DIA_Addon_Lares_ArrivedPortal_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortal_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41") && (LaresGuide_ZumPortal == 7))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortal_Info()
{
	B_MakeRangerReadyToLeaveMeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_00");	//Мы на месте.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortal_09_01 " );	// Take the ornament. The waterbenders must be down there somewhere. Take the ornament to them
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortal_09_02 " );	// If you encounter any wild beasts below that you can't handle, run to Saturas.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortal_09_03 " );	// He'll deal with them. Well, I need to get back.
	AI_Output(self,other, " DIA_Addon_Lares_ArrivedPortal_09_04 " );	// Yes, and one more thing. Do not wander around with this ornament. Go to Saturas immediately.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//До встречи.
	B_LogEntry(TOPIC_Addon_KDW, " Lares gave me this ornament. He wants me to give it to the waterbender Saturas. " );
	LaresGuide_ZumPortal = 8;
	Lares_arrived = TRUE ;
	LaresGuideMage = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Addon_Lares_Albern (C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_Albern_Condition;
	information = DIA_Addon_Lares_Albern_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_Albern_Condition()
{
	if((Lares_Angekommen == TRUE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RUINS_41") > 1000) && (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Albern_Info()
{
	AI_Output(self,other, " DIA_Addon_Lares_Albern_09_00 " );	// (strictly) Stop playing around! Take the ornament to Saturas immediately!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_GOFORESTPRE (C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_GOFORESTPRE_Condition;
	information = DIA_Addon_Lares_GOFORESTPRE_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_GOFORESTPRE_Condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") && (LaresGuide_OrnamentForest == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GOFORESTPRE_ja()
{
	B_MakeRangerReadyForMeeting(self);
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_ja_15_00");	//Да.
	AI_Output(self,other, " DIA_Addon_Lares_GOFORESTPRE_ja_09_01 " );	// Great, my friend. In that case, follow me. It might not be safe here.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2;
};

func void DIA_Addon_Lares_GOFORESTPRE_no()
{
	AI_Output(other,self, " DIA_Addon_Lares_GOFORESTPRE_nein_15_00 " );	// No, you can go.
	AI_Output(self,other, " DIA_Addon_Lares_GOFORESTPRE_nein_09_01 " );	// As I understand it, the problem was solved by itself? Okay, see you later.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LaresGuide_OrnamentForest = 3;
};

func void DIA_Addon_Lares_GOFORESTPRE_Info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Lares_GOFORESTPRE_09_00 " );	// Do you still want to go to the forest with me?
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Lares_GOFORESTPRE_09_01 " );	// Have you already thought about going to the forest? Do you really want to go there?
	};
	Info_ClearChoices(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE, " No, you can go. " ,DIA_Addon_Lares_GOFORESTPRE_nein);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE, " Да. " ,DIA_Addon_Lares_GOFORESTPRE_ja);
};

instance DIA_Addon_Lares_GOFOREST (C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_GOFOREST_Condition;
	information = DIA_Addon_Lares_GOFOREST_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Lares_GOFOREST_Condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_FOREST_PATH_62") && (LaresGuide_OrnamentForest == 2) && Npc_IsDead(Stoneguardian_Ornament))
	{
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
		if(ORNAMENT_SWITCHED_FOREST == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		B_MakeRangerReadyToLeaveMeeting(self);
		AI_Output(self,other, " DIA_Addon_Lares_GOFOREST_09_00 " );	// Well, here it is. Then you will go by yourself. And I'm heading back.
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(self,"START");
		LaresGuide_OrnamentForest = 3;
		LaresGuideForest = TRUE;
		Wld_InsertNpc(orc_8519_warrior,"NW_FOREST_PATH_38");
		Wld_InsertNpc(orc_8520_warrior,"NW_TROLLAREA_RITUALFOREST_09");
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Lares_GOFOREST_09_01 " );	// Hurry up! I don't want to stay here any longer than necessary.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Lares_PortalInterWEITER (C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_PortalInterWEITER_Condition;
	information = DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent = TRUE;
	description = " Moving on. " ;
};

func int DIA_Addon_Lares_PortalInterWEITER_Condition()
{
	if((LaresGuide_ZumPortal != 0) && (LaresGuide_ZumPortal != 8))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_PortalInterWEITER_15_02 " );	// Moving on.
	AI_Output(self,other, " DIA_Addon_Lares_PortalInterWEITER_09_04 " );	// Stay close to me.
	AI_StopProcessInfos(self);

	if(LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL2");
	}
	else if(LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL3");
	}
	else if(LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL4");
	}
	else if(LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL5");
	}
	else if(LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL6");
	}
	else if(LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPELEND");
	};
};

instance DIA_Lares_DEX (C_Info)
{
	npc = VLK_449_Lares;
	nr = 20;
	condition = DIA_Lares_DEX_Condition;
	information = DIA_Lares_DEX_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};

func int DIA_Lares_DEX_Condition()
{
	return TRUE;
};

func void DIA_Lares_DEX_Info()
{
	AI_Output(other,self, " DIA_Lares_DEX_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_Lares_DEX_Add_09_01 " );	// Of course. I can help you become stronger and more agile.
	Lares_TeachDEX = TRUE ;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Lares can help me improve my dexterity and strength. " );
};


var int Lares_BrandDEX;
var int Lares_MarkeSTR;

instance DIA_Lares_TEACH(C_Info)
{
	npc = VLK_449_Lares;
	nr = 20;
	condition = DIA_Lares_TEACH_Condition;
	information = DIA_Lares_TEACH_Info;
	permanent = TRUE;
	description = " Train me. " ;
};


func int DIA_Lares_TEACH_Condition()
{
	if (Lares_TeachDEX ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Lares_TEACH_Info()
{
	AI_Output(other,self, " DIA_Addon_Lares_Teach_15_00 " );	// Train me.
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Lares_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACH_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output(self,other, " DIA_Lares_TEACH_BACK_09_00 " );	// You've already become more dexterous.
	};
	if(other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output(self,other, " DIA_Addon_Lares_TEACH_BACK_Add_09_00 " );	// (appreciatively) Very good. You have become stronger.
	};
	Info_ClearChoices(DIA_Lares_TEACH);
};

func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACHSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACHSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};


instance DIA_Lares_Kap2_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap2_EXIT_Condition;
	information = DIA_Lares_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap3_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap3_EXIT_Condition;
	information = DIA_Lares_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_AnyNews (C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_AnyNews_Condition;
	information = DIA_Lares_AnyNews_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_Lares_AnyNews_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Lares_AnyNews_Info()
{
	AI_Output(other,self, " DIA_Lares_AnyNews_15_00 " );	// Any news?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Lares_AnyNews_09_01 " );	// The main news is about you. Bennett has been released and is returning to the farm.
		AI_Output(self,other, " DIA_Lares_AnyNews_09_02 " );	// Go to him, I think he wants to thank you personally.
	}
	else
	{
		AI_Output(self,other, " DIA_Lares_AnyNews_09_03 " );	// You can say that. The paladins have arrested Bennet, our blacksmith.
		if(MIS_RescueBennet == LOG_Running)
		{
			AI_Output(other,self, " DIA_Lares_AnyNews_15_04 " );	// I heard. This is a dirty business.
			AI_Output(self,other, " DIA_Lares_AnyNews_09_05 " );	// Well, you understand everything yourself.
		}
		else
		{
			AI_Output(other,self, " DIA_Lares_AnyNews_15_06 " );	// How did this happen?
			AI_Output(self,other, " DIA_Lares_AnyNews_09_07 " );	// Bennet is in town shopping. But he was not destined to return.
			AI_Output(self,other, " DIA_Lares_AnyNews_09_08 " );	// If you want to know more, ask Hodges, he was in town with Bennett.
			MIS_RescueBennet = LOG_Running;
		};
	};
};


instance DIA_Lares_NewsAboutBennet(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Lares_NewsAboutBennet_Condition;
	information = DIA_Lares_NewsAboutBennet_Info;
	permanent = FALSE;
	description = " Any news on Bennett? " ;
};


func int DIA_Lares_NewsAboutBennet_Condition()
{
	if(MIS_RescueBennet == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_NewsAboutBennet_Info()
{
	AI_Output(other,self, " DIA_Lares_NewsAboutBennet_15_00 " );	// Any news on Bennett?
	AI_Output(self,other, " DIA_Lares_NewsAboutBennet_09_01 " );	// He was taken to the barracks and thrown behind bars there.
	AI_Output(other,self, " DIA_Lares_NewsAboutBennet_15_02 " );	// How do we get him out of there?
	AI_Output(self,other, " DIA_Lares_NewsAboutBennet_09_03 " );	// I don't have any ideas yet. I can't get into his cell and talk to him.
	AI_Output(self,other, " DIA_Lares_NewsAboutBennet_09_04 " );	// All I can do is keep my ears up, maybe I can learn something.
};


instance DIA_Lares_Kap4_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap4_EXIT_Condition;
	information = DIA_Lares_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap4_PERM(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Lares_Kap4_PERM_Condition;
	information = DIA_Lares_Kap4_PERM_Info;
	permanent = TRUE;
	description = " Why don't you hunt dragons? " ;
};


func int DIA_Lares_Kap4_PERM_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_PERM_Info()
{
	AI_Output(other,self, " DIA_Lares_Kap4_PERM_15_00 " );	// Why don't you hunt dragons?
	AI_Output(self,other, " DIA_Lares_Kap4_PERM_09_01 " );	// This is not for me. Let others do it.
	AI_Output(self,other, " DIA_Lares_Kap4_PERM_09_02 " );	// No, thanks. Clean sea air is all I need right now.
};


instance DIA_Lares_Kap5_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap5_EXIT_Condition;
	information = DIA_Lares_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap5_EXIT_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_KnowWhereEnemy(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_KnowWhereEnemy_Condition;
	information = DIA_Lares_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " Do you want to leave this island? " ;
};


func int DIA_Lares_KnowWhereEnemy_Condition()
{
	if ((MY_SCKnowsWayToIrdorath ==  TRUE ) && (Lares_IsOnBoard ==  FALSE ) && ( CAPTAINNORTHWAY  ==  FALSE ) && (SCGotCaptain ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Lares_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_Lares_KnowWhereEnemy_15_00 " );	// You don't want to leave this island?
	AI_Output(self,other, " DIA_Lares_KnowWhereEnemy_09_01 " );	// This is my biggest wish. What did you think?
	AI_Output(other,self, " DIA_Lares_KnowWhereEnemy_15_02 " );	// I've found out where the dragon lord is hiding. He's on an island not far from here.
	AI_Output(other,self, " DIA_Lares_KnowWhereEnemy_15_03 " );	// I'm going to get rid of him once and for all.
	AI_Output(self,other, " DIA_Lares_KnowWhereEnemy_09_04 " );	// Sounds tempting. If you need me, you can count on me.
	AI_Output(self,other, " DIA_Lares_KnowWhereEnemy_09_05 " );	// Don't you need an agility or one-handed teacher on your journey?
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_Lares_KnowWhereEnemy_15_06 " );	// The ship is already full, but I'll get back to you if anything changes.
	}
	else
	{
		Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"Ты не нужен мне.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy, " I knew I could rely on you. " ,DIA_Lares_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lares_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_Lares_KnowWhereEnemy_Yes_15_00 " );	// I knew I could rely on you.
	AI_Output(other,self, " DIA_Lares_KnowWhereEnemy_Yes_15_01 " );	// Meet me at the ship.
	AI_Output(self,other, " DIA_Lares_KnowWhereEnemy_Yes_09_02 " );	// You're a man of action - I like that. See you later.
	Lares_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	CreateInvItems(self,itar_sld_M,1);
	AI_EquipArmor(self,itar_sld_M);
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};

func void DIA_Lares_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_Lares_KnowWhereEnemy_No_15_00 " );	// I appreciate your offer, but I have to turn you down.
	AI_Output(self,other, " DIA_Lares_KnowWhereEnemy_No_09_01 " );	// You must understand what you want. If you want to return to this question, you know where to find me.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};


instance DIA_Lares_LeaveMyShip(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_LeaveMyShip_Condition;
	information = DIA_Lares_LeaveMyShip_Info;
	permanent = TRUE;
	description = " It's better if you don't swim with me. " ;
};


func int DIA_Lares_LeaveMyShip_Condition()
{
	if((Lares_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_Lares_LeaveMyShip_15_00 " );	// It's better if you don't swim with me.
	AI_Output(self,other, " DIA_Lares_LeaveMyShip_09_01 " );	// As you know, but in the future, think about what you promise and to whom.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lares_StillNeedYou(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_StillNeedYou_Condition;
	information = DIA_Lares_StillNeedYou_Info;
	permanent = TRUE;
	description = " Are you still interested in a place on the ship? " ;
};


func int DIA_Lares_StillNeedYou_Condition()
{
	if(((Lares_IsOnBoard == LOG_OBSOLETE) || (Lares_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_Lares_StillNeedYou_15_00 " );	// Are you still interested in a place on the ship?
	if(Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other, " DIA_Lares_StillNeedYou_09_01 " );	// I usually don't let people treat me like this, but since you're one of us, I'll forgive you this time.
		AI_Output(self,other, " DIA_Lares_StillNeedYou_09_02 " );	// Meet me on the ship.
		Lares_IsOnBoard = LOG_SUCCESS;
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
		AI_Output(self,other, " DIA_Lares_StillNeedYou_09_03 " );	// No offense, but I think you were right.
		AI_Output(self,other, " DIA_Lares_StillNeedYou_09_04 " );	// I better stay here.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_LARES_NW_KAPITELORCATTACK(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_addon_lares_nw_kapitelorcattack_condition;
	information = dia_addon_lares_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " How do you like this whole situation? " ;
};


func int dia_addon_lares_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (LARESBACKNW == TRUE) && (LEEBATTLETHROUGTH == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_01_00 " );	// How do you like this whole situation?
	AI_Output(self,other, " DIA_Addon_Lares_NW_KapitelOrcAttack_01_01 " );	// I don't have much to say about this... (sadly) And what can be said at all when everything is clear anyway?
	AI_Output(self,other, " DIA_Addon_Lares_NW_KapitelOrcAttack_01_02 " );	// I think even the fool could understand that soon the orcs would come here as well. It was just a matter of time!
	AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_01_03 " );	// And will we do it?
	if(LEEBACKNW == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Lares_NW_KapitelOrcAttack_01_04 " );	// I think you'd better ask Lee about this. As he decides, so be it.
		AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_01_05 " );	// Okay, I'll talk.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Lares_NW_KapitelOrcAttack_01_06 " );	// I don't know. First, you need to think a little... how you can slip out of this trap.
		AI_Output(self,other, " DIA_Addon_Lares_NW_KapitelOrcAttack_01_07 " );	// And if I can't come up with anything, then, apparently, I'll have to break out of here with a fight. There is no other way out!
		Info_ClearChoices(dia_addon_lares_nw_kapitelorcattack);

		if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
		{
			Info_AddChoice(dia_addon_lares_nw_kapitelorcattack, " I have a rune to teleport to Onar's farm with me. " ,dia_addon_lares_nw_kapitelorcattack_farm);
		};
		Info_AddChoice(dia_addon_lares_nw_kapitelorcattack, " Okay, I won't talk you out of it. " ,dia_addon_lares_nw_kapitelorcattack_nogiverune);
	};
};

func void dia_addon_lares_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_01 " );	// Wait! I have a rune to teleport to Onar's farm with me.
	AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_02 " );	// You can use it.
	AI_Output(self,other, " DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_03 " );	// Rune?! Hmmm... (thoughtfully) Well, I don't even know, I have to think - is it worth it?
	AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_05 " );	// Your idea of ​​fighting your way through a city filled to the brim with orcs is pure madness.
	AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_06 " );	// These creatures will make mincemeat out of you! And you know it as well as I do.
	AI_Output(self,other, " DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_09 " );	// Okay, give it here.
	AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_10 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other, " DIA_Addon_Lares_NW_KapitelOrcAttack_Farm_01_11 " );	// Eh! I hope after it I won’t be sick again for a week, like after a bottle of old schnapps.
	LARESNOBATTLETHROUGTH = TRUE;
	B_LogEntry( TOPIC_HELPCREW , " I gave Lares the teleportation rune to Onar's farm. Now I'm calm about his fate. " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_addon_lares_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Lares_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// Okay, I won't dissuade you.
	B_LogEntry( TOPIC_HELPCREW , " Lares will fight his way out of the captured city. Maybe he'll get lucky and get away with it. " );
	LARESBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_FUCKOFF (C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = dia_vlk_449_lares_fuckoff_condition;
	information = dia_vlk_449_lares_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_449_lares_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (LARESCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_VLK_449_LARES_YOURFREE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_yourfree_condition;
	information = dia_vlk_449_lares_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_449_lares_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (LARESCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_yourfree_info()
{
	AI_Output(self,other, " DIA_VLK_449_Lares_YourFree_01_08 " );	// What else do you need?
	AI_Output(other,self, " DIA_VLK_449_Lares_YourFree_01_00 " );	// I just want to say that you are free.
	AI_Output(self,other, " DIA_VLK_449_Lares_YourFree_01_01 " );	// Hmmm... (surprised) Have you killed all the orcs in the city?
	AI_Output(other,self, " DIA_VLK_449_Lares_YourFree_01_02 " );	// Yes, that's right.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other, " DIA_VLK_449_Lares_YourFree_01_03 " );	// Well, great mate! And then we thought that we all came to an end.
		AI_Output(self,other, " DIA_VLK_449_Lares_YourFree_01_04 " );	// Just open the bars first so we can get out of here.
	}
	else
	{
		AI_Output(self,other, " DIA_VLK_449_Lares_YourFree_01_05 " );	// Well, great mate! And then I thought I was finished.
		AI_Output(self,other, " DIA_VLK_449_Lares_YourFree_01_06 " );	// Just open the grate first so I can get out of here.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_OPENGATENOW(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_opengatenow_condition;
	information = dia_vlk_449_lares_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_449_lares_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (LARESCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (LARESISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_opengatenow_info()
{
	AI_Output(self,other, " DIA_VLK_449_Lares_OpenGateNow_01_00 " );	// Will you finally let me out of here?! (uncomprehending) Or do I have to wait forever for this?
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_GOONORKSHUNT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_goonorkshunt_condition;
	information = dia_vlk_449_lares_goonorkshunt_info;
	permanent = FALSE;
	description = " Would you like to walk around? " ;
};


func int dia_vlk_449_lares_goonorkshunt_condition()
{
	if (( HAGENGIVEHELP  ==  TRUE ) && ( LARESCAPTURED  ==  FALSE ) && ( ALLGREATVICTORY  ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( LARESTOBIGLAND  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_VLK_449_Lares_GoOnOrksHunt_01_00 " );	// Would you like to take a walk around?
	AI_Output(self,other, " DIA_VLK_449_Lares_GoOnOrksHunt_01_01 " );	// Hmmm... (slyly) And you, apparently, have something in mind?
	AI_Output(other,self, " DIA_VLK_449_Lares_GoOnOrksHunt_01_02 " );	// I just want to finish off a couple of orcs.
	AI_Output(self,other, " DIA_VLK_449_Lares_GoOnOrksHunt_01_03 " );	// Okay, buddy. Then I'm with you.
	LARESJOINMEHUNT = TRUE;
};


instance DIA_VLK_449_LARES_FOLLOWME (C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_followme_condition;
	information = dia_vlk_449_lares_followme_info;
	permanent = TRUE;
	description = " Follow me! " ;
};


func int dia_vlk_449_lares_followme_condition()
{
	if (( LARESJOINMEHUNT  ==  TRUE ) && ( self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( LARESTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_followme_info()
{
	AI_Output(other,self, " DIA_VLK_449_Lares_FollowMe_01_00 " );	// Follow me!
	AI_Output(self,other,"DIA_VLK_449_Lares_FollowMe_01_01");	//Конечно.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_STOPHERE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_stophere_condition;
	information = dia_vlk_449_lares_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_vlk_449_lares_stophere_condition()
{
	if (( LARESJOINMEHUNT  ==  TRUE ) && ( self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( LARESTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_stophere_info()
{
	AI_Output(other,self,"DIA_VLK_449_Lares_StopHere_01_00");	//Жди тут!
	AI_Output(self,other, " DIA_VLK_449_Lares_StopHere_01_01 " );	// Okay, buddy. You know where to find me!
	Npc_ExchangeRoutine(self,"OrcAtcNW");
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_449_LARES_TRAVELONBIGLAND(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = dia_vlk_449_lares_travelonbigland_condition;
	information = dia_vlk_449_lares_travelonbigland_info;
	permanent = FALSE;
	description = " How do you like the idea of ​​walking to the mainland? " ;
};


func int dia_vlk_449_lares_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_449_lares_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_VLK_449_Lares_TravelOnBigLand_01_00 " );	// How do you like the idea of ​​getting to the mainland?
	AI_Output(self,other, " DIA_VLK_449_Lares_TravelOnBigLand_01_01 " );	// I like her. I'll find something to do there!
	AI_Output(other,self, " DIA_VLK_449_Lares_TravelOnBigLand_01_02 " );	// Okay! Then we'll be leaving soon.
	AI_Output(self,other, " DIA_VLK_449_Lares_TravelOnBigLand_01_03 " );	// Okay, I'll hurry.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	LARESTOBIGLAND = TRUE;
	B_LogEntry( TOPIC_SALETOBIGLAND , " Lares will also sail with me. People like him will always find something to do on the mainland! " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

