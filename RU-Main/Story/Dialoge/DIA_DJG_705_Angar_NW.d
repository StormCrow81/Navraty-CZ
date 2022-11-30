
instance DIA_Angar_NW_KAP5_EXIT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 999;
	condition = DIA_Angar_NW_KAP5_EXIT_Condition;
	information = DIA_Angar_NW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_NW_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_NW_AllDragonsDead(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 59;
	condition = DIA_Angar_NW_AllDragonsDead_Condition;
	information = DIA_Angar_NW_AllDragonsDead_Info;
	description = " How are you? " ;
};


func int DIA_Angar_NW_AllDragonsDead_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_Angar_NW_AllDragonsDead_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Angar_NW_AllDragonsDead_04_01 " );	// Good. But I still have headaches, although they have lessened since I left the Valley of Mines.
	if(Angar_IsOnBoard != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Angar_NW_AllDragonsDead_04_02 " );	// I'll stay here. You will know where to find me if you need me.
	};
};


instance DIA_Angar_NW_KnowWhereEnemy(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_KnowWhereEnemy_Condition;
	information = DIA_Angar_NW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " I'm about to leave Khorinis. Do you want to join me? " ;
};


func int DIA_Angar_NW_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath ==  TRUE ) && (Angar_IsOnBoard ==  FALSE ) && Npc_KnowsInfo(other,DIA_Angar_NW_AllDragonsDead) && ( CAPTAINNORTHWay  ==  FALSE ) && (SCGotCaptain ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_Angar_NW_KnowWhereEnemy_15_00 " );	// I'm going to leave Khorinis. Do you want to join me?
	AI_Output(self,other, " DIA_Angar_NW_KnowWhereEnemy_04_01 " );	// The farther I'm from the Valley of Mines, the better. When do we leave?
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew, " The hangar is happy with every mile that lies between it and the mine valley. He agreed to accompany me " );
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_Angar_NW_KnowWhereEnemy_15_02 " );	// I have enough men to run the ship now. Perhaps I will contact you later.
		AI_Output(self,other, " DIA_Angar_NW_KnowWhereEnemy_04_03 " );	// Good. You know where to find me.
	}
	else
	{
		Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy, " I'll let you know when the time is right. " ,DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy, " Go to the harbor. I'll meet you there. " ,DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_Angar_NW_KnowWhereEnemy_Yes_15_00 " );	// Come to the harbor. I'll come by later.
	AI_Output(self,other, " DIA_Angar_NW_KnowWhereEnemy_Yes_04_01 " );	// I'm already on the road.
	Angar_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};

func void DIA_Angar_NW_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_Angar_NW_KnowWhereEnemy_No_15_00 " );	// I'll let you know when the time is right.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//Хорошо.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};


instance DIA_Angar_NW_LeaveMyShip(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_LeaveMyShip_Condition;
	information = DIA_Angar_NW_LeaveMyShip_Info;
	permanent = TRUE;
	description = " Stay here and heal your headache. " ;
};


func int DIA_Angar_NW_LeaveMyShip_Condition()
{
	if((Angar_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_Angar_NW_LeaveMyShip_15_00 " );	// Stay here and heal your headache.
	AI_Output(self,other, " DIA_Angar_NW_LeaveMyShip_04_01 " );	// Good. I'll go back. Maybe it'll even be better.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Angar_NW_StillNeedYou(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_StillNeedYou_Condition;
	information = DIA_Angar_NW_StillNeedYou_Info;
	permanent = TRUE;
	description = " Come back on board. " ;
};


func int DIA_Angar_NW_StillNeedYou_Condition()
{
	if(((Angar_IsOnBoard == LOG_OBSOLETE) || (Angar_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_Angar_NW_StillNeedYou_15_00 " );	// Get back on board!
	AI_Output(self,other, " DIA_Angar_NW_StillNeedYou_04_01 " );	// You're even worse than me. A little certainty wouldn't hurt at all. See you later!
	Angar_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Angar_NW_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 900;
	condition = DIA_Angar_NW_PICKPOCKET_Condition;
	information = DIA_Angar_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Angar_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 47 , 34 );
};

func void DIA_Angar_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,Dialog_Back,DIA_Angar_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_NW_PICKPOCKET_DoIt);
};

func void DIA_Angar_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};

func void DIA_Angar_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};


instance DIA_Angar_NW_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 7;
	condition = DIA_Angar_NW_FOUNDAMULETT_Condition;
	information = DIA_Angar_NW_FOUNDAMULETT_Info;
	description = " I found your amulet. " ;
};


func int DIA_Angar_NW_FOUNDAMULETT_Condition()
{
	if (Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIER) && (DJG_AngarGotAmulett ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_FOUNDAMULETT_Info()
{
	B_AngarsAmuletSend();
};


instance DIA_ANGAR_NW_KAPITELORCATTACK (C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_kapitelorcattack_condition;
	information = dia_angar_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " Did you hear what happened?! " ;
};


func int dia_angar_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (ANGARBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_Angar_NW_KapitelOrcAttack_01_00 " );	// Did you hear what happened? Orcs have taken over the city!
	AI_Output(self,other, " DIA_Angar_NW_KapitelOrcAttack_01_01 " );	// Yes, bad business! How can we get out of this trap now?
	AI_Output(other,self, " DIA_Angar_NW_KapitelOrcAttack_01_02 " );	// Do you have any ideas?
	AI_Output(self,other, " DIA_Angar_NW_KapitelOrcAttack_01_03 " );	// I don't know. But, apparently, we can only break through the battle through Khorinis.
	AI_Output(self,other, " DIA_Angar_NW_KapitelOrcAttack_01_04 " );	// Though I'm pretty sure it's certain death.
	Info_ClearChoices(dia_angar_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportPsicamp) >= 1)
	{
		Info_AddChoice(dia_angar_nw_kapitelorcattack, " (offer teleport rune to Brotherhood camp) " ,dia_angar_nw_kapitelorcattack_psicamp);
	};
	Info_AddChoice(dia_angar_nw_kapitelorcattack, " I think it is. " ,dia_angar_nw_kapitelorcattack_nogiverune);
};

func void dia_angar_nw_kapitelorcattack_psicamp()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_01 " );	// Given how many orcs there might be, I think you're right.
	AI_Output(other,self, " DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_02 " );	// True, I have a rune of teleportation to the Brotherhood camp with me. You could use it.
	AI_Output(self,other, " DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_03 " );	// Do you have a teleportation rune?
	AI_Output(self,other, " DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_05 " );	// Well, thanks, of course. But to tell you the truth, I'd rather fight.
	AI_Output(other,self, " DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_06 " );	// I don't doubt your courage, Angar! But I think you yourself perfectly understand that there are practically no chances to break through the city.
	B_GiveInvItems(other,self,ItMi_TeleportPsicamp,1);
	Npc_RemoveInvItems(self,ItMi_TeleportPsicamp,1);
	AI_Output(self,other, " DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_08 " );	// (sighing) Okay. I will do so.
	ANGARNOBATTLETHROUGTH = TRUE;
	; _ _ _ _ _ _
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_angar_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_00 " );	// I think it is.
	AI_Output(other,self, " DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// Considering how many orcs there might be, I think you're right. There is practically no chance to break through the city.
	AI_Output(self,other, " DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_02 " );	// We'll try. In any case, there is nothing left for us.
	AI_Output(other,self, " DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_03 " );	// Okay, then good luck to you, Ungar! Hope to see you again.
	AI_Output(self,other, " DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_04 " );	// Me too, mate.
	; _ _ _ _ _ _
	ANGARBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_DJG_705_ANGAR_NW_FUCKOFF(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 2;
	condition = dia_djg_705_angar_nw_fuckoff_condition;
	information = dia_djg_705_angar_nw_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_DJG_705_ANGAR_NW_YOURFREE(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_djg_705_angar_nw_yourfree_condition;
	information = dia_djg_705_angar_nw_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_yourfree_info()
{
	AI_Output(self,other, " DIA_DJG_705_Angar_NW_YourFree_01_08 " );	// What are you doing here, mate?
	AI_Output(other,self, " DIA_DJG_705_Angar_NW_YourFree_01_00 " );	// You are free!
	AI_Output(self,other, " DIA_DJG_705_Angar_NW_YourFree_01_01 " );	// (surprised) Have you killed all the orcs in the city?!
	AI_Output(other,self, " DIA_DJG_705_Angar_NW_YourFree_01_02 " );	// Yes, that's right.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other, " DIA_DJG_705_Angar_NW_YourFree_01_03 " );	// Incredible! We were sure that we were all finished.
		AI_Output(self,other, " DIA_DJG_705_Angar_NW_YourFree_01_04 " );	// Open the bars so we can get out of here.
	}
	else
	{
		AI_Output(self,other, " DIA_DJG_705_Angar_NW_YourFree_01_05 " );	// Incredible! I was sure that I was finished.
		AI_Output(self,other, " DIA_DJG_705_Angar_NW_YourFree_01_06 " );	// Open the grate so I can get out of here.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instances DIA_DJG_705_ANGAR_NW_OPENGATENOW (C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_djg_705_angar_nw_opengatenow_condition;
	information = dia_djg_705_angar_nw_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (ANGARISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_opengatenow_info()
{
	AI_Output(self,other, " DIA_DJG_705_Angar_NW_OpenGateNow_01_00 " );	// Well, what are you waiting for? Let me out!
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_PSICAMPHOME(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_psicamphome_condition;
	information = dia_angar_nw_psicamphome_info;
	permanent = FALSE;
	description = " Home again. " ;
};


func int dia_angar_nw_psicamphome_condition()
{
	if((REPLACEPLACESCREW == TRUE) && (ANGARCAPTURED == FALSE) && ((ANGARNOBATTLETHROUGTH == TRUE) || (ANGARBATTLETHROUGTH == TRUE)))
	{
		return TRUE;
	};
};

func void dia_angar_nw_psicamphome_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Angar_NW_PsiCampHome_01_00 " );	// Now you're home again.
	AI_Output(self,other, " DIA_Angar_NW_PsiCampHome_01_01 " );	// Yes. Almost like the good old days!
	AI_Output(other,self, " DIA_Angar_NW_PsiCampHome_01_02 " );	// So you will lead the Circle of Guardians again?
	AI_Output(self,other, " DIA_Angar_NW_PsiCampHome_01_03 " );	// (seriously) No, not now. I need to rest a little and come to my senses after everything that happened.
	AI_Output(self,other, " DIA_Angar_NW_PsiCampHome_01_04 " );	// Moreover, Gor Na Kosh copes with this duty quite well.
	AI_Output(other,self, " DIA_Angar_NW_PsiCampHome_01_06 " );	// Got it.
};


instance DIA_ANGAR_NW_GOONORKSHUNT (C_Info);
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_goonorkshunt_condition;
	information = dia_angar_nw_goonorkshunt_info;
	permanent = FALSE;
	description = " I need your help with the orcs. " ;
};


func int dia_angar_nw_goonorkshunt_condition()
{
	if (( HAGENGIVEHELP  ==  TRUE ) && ( ANGARCAPTURED  ==  FALSE ) && ( ALLGREATVICTORY  ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( ANGARTOBIGLAND  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_angar_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Angar_NW_GoOnOrksHunt_01_00 " );	// I need your help with the orcs.
	AI_Output(self,other, " DIA_Angar_NW_GoOnOrksHunt_01_01 " );	// (seriously) In that case, I'll be happy to help you with this.
	AI_Output(self,other, " DIA_Angar_NW_GoOnOrksHunt_01_02 " );	// After all, it's better than hanging around the farm all day.
	AI_Output(self,other, " DIA_Angar_NW_GoOnOrksHunt_01_03 " );	// Just tell me when you're ready.
	AI_Output(other,self,"DIA_Angar_NW_GoOnOrksHunt_01_04");	//Хорошо.
	ANGARJOINMEHUNT = TRUE;
};


instance DIA_ANGAR_NW_FOLLOWME ( C_Info );
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_followme_condition;
	information = dia_angar_nw_followme_info;
	permanent = TRUE;
	description = " Follow me! " ;
};


func int dia_angar_nw_follow_me_condition()
{
	if (( ANGARJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( ANGARTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_angar_nw_followme_info()
{
	AI_Output(other,self, " DIA_Angar_NW_FollowMe_01_00 " );	// Follow me!
	AI_Output(self,other, " DIA_Angar_NW_FollowMe_01_01 " );	// Okay, drive on.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_STOPHERE(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_stophere_condition;
	information = dia_angar_nw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_angar_nw_stophere_condition()
{
	if (( ANGARJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( ANGARTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_angar_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Angar_NW_StopHere_01_00");	//Жди тут!
	AI_Output(self,other, " DIA_Angar_NW_StopHere_01_01 " );	// As you say! Then I return to the farm again.
	Npc_ExchangeRoutine(self,"CampOn");
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_ALLGREATVICTORY ( C_Info ) ;
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_allgreatvictory_condition;
	information = dia_angar_nw_allgreatvictory_info;
	permanent = FALSE;
	description = " Khorinis has been completely freed! " ;
};


func int dia_angar_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_angar_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Angar_NW_AllGreatVictory_01_00 " );	// Khorinis is completely released!
	AI_Output(self,other, " DIA_Angar_NW_AllGreatVictory_01_01 " );	// And I'm very happy about it. Now we can all get some rest.
	AI_Output(self,other, " DIA_Angar_NW_AllGreatVictory_01_02 " );	// I think it won't hurt you either. The last few days have not been easy.
};


instance DIA_ANGAR_NW_WHATDONOW(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_whatdonow_condition;
	information = dia_angar_nw_whatdonow_info;
	permanent = FALSE;
	description = " What are you going to do now? " ;
};


func int dia_angar_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_whatdonow_info()
{
	AI_Output(other,self, " DIA_Angar_NW_WhatDoNow_01_00 " );	// What are you going to do now?
	AI_Output(self,other, " DIA_Angar_NW_WhatDoNow_01_01 " );	// I don't know. I haven't thought about it yet.
	AI_Output(self,other, " DIA_Angar_NW_WhatDoNow_01_02 " );	// I think I'll live in our camp for a while. And then I'll decide what to do next.
	AI_Output(other,self,"DIA_Angar_NW_WhatDoNow_01_03");	//Понятно.
};


instance DIA_ANGAR_NW_TRAVELONBIGLAND(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_travelonbigland_condition;
	information = dia_angar_nw_travelonbigland_info;
	permanent = FALSE;
	description = " I'm leaving for the mainland. " ;
};


func int dia_angar_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_angar_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Angar_NW_TravelOnBigLand_01_00 " );	// I'm sailing to the mainland.
	AI_Output(other,self, " DIA_Angar_NW_TravelOnBigLand_01_01 " );	// Would you like to go with me?
	AI_Output(self,other, " DIA_Angar_NW_TravelOnBigLand_01_02 " );	// Hmmm. Why not.
	AI_Output(self,other, " DIA_Angar_NW_TravelOnBigLand_01_03 " );	// Anyway, nothing keeps me on this island anymore.
	AI_Output(self,other, " DIA_Angar_NW_TravelOnBigLand_01_04 " );	// And there I might find what I've been looking for all my life.
	AI_Output(other,self, " DIA_Angar_NW_TravelOnBigLand_01_05 " );	// Then come to the harbor. The ship is already waiting.
	AI_Output(self,other, " DIA_Angar_NW_TravelOnBigLand_01_06 " );	// Good. I will come.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	ANGARTOBIGLAND = TRUE;
	B_LogEntry( TOPIC_SALETOBIGLAND , " Kor Ungar will sail with me to the mainland. He thinks he will find a new meaning for his life there. " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

