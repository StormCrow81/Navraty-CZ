

instance DIA_GornNW_nach_DJG_KAP5_EXIT (C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 999;
	condition = DIA_GornNW_nach_DJG_KAP5_EXIT_Condition;
	information = DIA_GornNW_nach_DJG_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_nach_DJG_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_nach_DJG_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_nach_DJG_AllDragonsDead(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 59;
	condition = DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information = DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent = TRUE;
	description = " Are you calm? " ;
};


func int DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if((Gorn_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_GornNW_nach_DJG_AllDragonsDead_15_00 " );	// Are you calm?
	AI_Output(self,other, " DIA_GornNW_nach_DJG_AllDragonsDead_12_01 " );	// Of course, why not? Dragons are dead, aren't they?
	AI_Output(other,self, " DIA_GornNW_nach_DJG_AllDragonsDead_15_02 " );	// Things are a bit more complicated.
	AI_Output(self,other, " DIA_GornNW_nach_DJG_AllDragonsDead_12_03 " );	// (laughs) Okay. Everything as usual. Let me know if you need my axe.
};


instance DIA_GornNW_nach_DJG_KnowWhereEnemy(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information = DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " I need you and your axe. " ;
};


func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition()
{
	if ((MY_SCKnowsWayToIrdorath ==  TRUE ) && (Gorn_IsOnBoard ==  FALSE ) && ( CAPTAINNORTHWAY  ==  FALSE ) && (SCGotCaptain ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00 " );	// I need you and your axe.
	AI_Output(self,other, " DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01 " );	// Good. I am not surprised. What can I do for you?
	AI_Output(other,self, " DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02 " );	// Will you sail with me to another island? Someone needs to kick their ass.
	AI_Output(self,other, " DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03 " );	// (laughs) Of course. Always ready. Just tell me what to do.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew, " Gorn was ready for anything when I told him about the island. If I need his axe, I can take it with me. " );
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04 " );	// My crew is almost complete now, but I think you could find a place on board too.
		AI_Output(self,other, " DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05 " );	// If you have to kick someone out of your team for me, choose the weakest one.
		AI_Output(self,other, " DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06 " );	// In our harsh time, you can not scatter people who can firmly hold a weapon in their hands.
	}
	else
	{
		Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy, " I'll let you know when the time is right. " ,DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy, " Welcome aboard. Meet you at the harbor. " ,DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00 " );	// Welcome aboard. Meet me at the harbor.
	AI_Output(self,other, " DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01 " );	// Ship? Ha! I can say one thing. You are never bored. See you soon.
	B_GivePlayerXP(XP_Crewmember_Success);
	Gorn_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00 " );	// I'll let you know when the time is right.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//Хорошо.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};


instance DIA_GornNW_nach_DJG_LeaveMyShip(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information = DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	permanent = TRUE;
	description = " Maybe you should stay here. " ;
};


func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition()
{
	if((Gorn_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_GornNW_nach_DJG_LeaveMyShip_15_00 " );	// Perhaps you'd better stay here.
	AI_Output(self,other, " DIA_GornNW_nach_DJG_LeaveMyShip_12_01 " );	// Do you want me to let you go alone? Mmm. It's not easy for me to do this, but this is your war. Find me if you think you still need me.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornNW_nach_DJG_StillNeedYou(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information = DIA_GornNW_nach_DJG_StillNeedYou_Info;
	permanent = TRUE;
	description = " Come back. I need YOU. " ;
};


func int DIA_GornNW_nach_DJG_StillNeedYou_Condition()
{
	if((Gorn_IsOnBoard == LOG_OBSOLETE) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_GornNW_nach_DJG_StillNeedYou_15_00 " );	// Come back. I need you!
	AI_Output(self,other, " DIA_GornNW_nach_DJG_StillNeedYou_12_01 " );	// Well. And I already thought that you want to leave me here alone while you deal with all this. See you later.
	Gorn_IsOnBoard = LOG_SUCCESS;
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


instance DIA_Fighter_nach_DJG_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 900;
	condition = DIA_Fighter_nach_DJG_PICKPOCKET_Condition;
	information = DIA_Fighter_nach_DJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fighter_nach_DJG_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 25 );
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,Dialog_Back,DIA_Fighter_nach_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_nach_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};


instance DIA_FIGHTER_NACH_DJG_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_kapitelorcattack_condition;
	information = dia_fighter_nach_djg_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " Remaining to fight? " ;
};


func int dia_fighter_nach_djg_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (FIGHTERBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_00 " );	// Staying to fight?
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_01 " );	// Of course! What, did you doubt it?
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_04 " );	// Without this, my ax will soon simply rust.
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_05 " );	// Eh, my hands are itchy right now! Just let me get to these creatures - then I'll show them who they contacted.
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_10 " );	// Your confidence is quite inspiring. See you later then!
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_11 " );	// Of course, mate.
	B_LogEntry( TOPIC_HELPCREW , " As I expected, Gorn stays with those who will break out of the city with a fight. I'm sure that he will manage to get out of this mess alive. " );
	FIGHTERBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_ESCAPE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_escape_condition;
	information = dia_fighter_nach_djg_nw_escape_info;
	permanent = FALSE;
	description = " It's good to see you alive and well! " ;
};


func int dia_fighter_nach_djg_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Gorn_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_Escape_01_01 " );	// Good to see you!
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_Escape_01_02 " );	// In truth, I love you too!
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_Escape_01_03 " );	// So you managed to break through the city?
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_Escape_01_04 " );	// As you can see, I succeeded! However, not everyone is so lucky.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_Escape_01_05 " );	// Many of us were taken prisoner by orcs... (sadly) What now they will do with them, only Innos knows!
			B_LogEntry( TOPIC_HELPCREW , " On Onar's farm, I met Gorn, alive and well. That's good news! " );
			Log_AddEntry( TOPIC_HELPCREW , " But there were some bad ones too! He told me that a lot of the guys were captured by the orcs during the break through the city. I hope they are still alive! " );
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_Escape_01_06 " );	// Many of us have been taken prisoner by the orcs. There are those who died fighting them!
			B_LogEntry( TOPIC_HELPCREW , " On Onar's farm, I met Gorn, alive and well. That's good news! " );
			Log_AddEntry( TOPIC_HELPCREW , " Sure, there were bad ones too! He told me that many guys were captured by the orcs during the breakthrough through the city. There are those who died. " );
		};
		AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_Escape_01_07 " );	// Yes, that's not good news.
		AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_Escape_01_08 " );	// There's nothing you can do about it.
		AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_Escape_01_09 " );	// I understand.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_Escape_01_10 " );	// As you can see! And, as far as I know, everyone who was then on the ship succeeded.
		AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_Escape_01_11 " );	// Yes, that's just great news!
		AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_Escape_01_12 " );	// I agree with you. Even now I don’t know whom to thank for such a miraculous salvation!
		B_LogEntry( TOPIC_HELPCREW , " At Onar's farm, I met Gorn again - alive and well. That's good news! As well as the fact that all the other guys also managed to get out of the city. " );
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_FIGHTER_NACH_DJG_NW_SOONBATTLE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_soonbattle_condition;
	information = dia_fighter_nach_djg_nw_soonbattle_info;
	permanent = FALSE;
	description = " Orcs won't leave this farm alone! " ;
};


func int dia_fighter_nach_djg_nw_soonbattle_condition()
{
	if((MIS_HELPCREW == LOG_SUCCESS) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_soonbattle_info()
{
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_SoonBattle_01_00 " );	// Orcs won't leave this farm alone! We'll probably have to fight them soon.
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_SoonBattle_01_01 " );	// I really hope so! Otherwise, my ax was already waiting for the moment when it could finish off a couple of them again.
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_SoonBattle_01_02 " );	// You're incorrigible! But I like your attitude.
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_SoonBattle_01_03 " );	// (laughs) You know me, mate!
};


instance DIA_FIGHTER_NACH_DJG_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_soonbattlenow_condition;
	information = dia_fighter_nach_djg_nw_soonbattlenow_info;
	permanent = FALSE;
	description = " How are you feeling before the fight? " ;
};


func int dia_fighter_nach_djg_nw_soonbattlenow_condition()
{
	if((STOPBIGBATTLE == FALSE) && (MOVEFORCESCOMPLETE_01 == TRUE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_soonbattlenow_info()
{
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_SoonBattleNow_01_00 " );	// How are you feeling before the fight?
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_SoonBattleNow_01_01 " );	// Don't worry, I'm ready! The main thing is that the orcs do not change their minds about attacking us.
};


instance DIA_FIGHTER_NACH_DJG_NW_BATTLEWIN(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_battlewin_condition;
	information = dia_fighter_nach_djg_nw_battlewin_info;
	permanent = FALSE;
	description = " We won! " ;
};


func int dia_fighter_nach_djg_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_BattleWin_01_00 " );	// We won!
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_BattleWin_01_01 " );	// Yeah buddy... It was a glorious battle! I haven't practiced my ax like this in a long time.
	if ( FREEDOM  ==  FALSE )
	{
		AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_BattleWin_01_02 " );	// But it's too early to rejoice. As far as I know, orcs still control the city!
		AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_BattleWin_01_03 " );	// I think we can handle this now.
		AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_BattleWin_01_04 " );	// Of course... (laughs) So, if anything, my ax is always at your service.
	};
};


instance DIA_FIGHTER_NACH_DJG_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_goonorkshunt_condition;
	information = dia_fighter_nach_djg_nw_goonorkshunt_info;
	permanent = FALSE;
	description = " Would you like to hunt orcs with me? " ;
};


func int dia_fighter_nach_djg_nw_goonorkshunt_condition()
{
	if (( HAGENGIVEHELP  ==  TRUE ) && ( ALLGREATVICTORY  ==  FALSE ) && ( GORNTOBIGLAND  ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && Npc_KnowsInfo(hero,dia_fighter_nach_djg_nw_battlewin));
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_00 " );	// Would you like to hunt orcs with me?
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_01 " );	// And you still ask? Of course I want!
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_02 " );	// My ax always cries for these creatures.
	GORNJOINMEHUNT = TRUE;
};


instance DIA_FIGHTER_NACH_DJG_NW_FOLLOWME(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_followme_condition;
	information = dia_fighter_nach_djg_nw_followme_info;
	permanent = TRUE;
	description = " Follow me! " ;
};


func int dia_fighter_nach_djg_nw_followme_condition()
{
	if (( GORNJOINMEHUNT  ==  TRUE ) && (self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( GORNTOBIGLAND  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_followme_info()
{
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_FollowMe_01_00 " );	// Follow me!
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_FollowMe_01_01 " );	// Go ahead, mate.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_STOPHERE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_stophere_condition;
	information = dia_fighter_nach_djg_nw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_fighter_nach_djg_nw_stophere_condition()
{
	if (( GORNJOINMEHUNT  ==  TRUE ) && ( self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && ( ALLDISMISSFROMHUNT  ==  FALSE ) && ( GORNTOBIGLAND  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_StopHere_01_00");	//Жди тут!
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_StopHere_01_01 " );	// Hey, but we've only just begun! I didn't even have time to warm up!
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_StopHere_01_03 " );	// Eh! Okay, whatever you say.
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_allgreatvictory_condition;
	information = dia_fighter_nach_djg_nw_allgreatvictory_info;
	permanent = FALSE;
	description = " I guess you'll get bored again soon. " ;
};


func int dia_fighter_nach_djg_nw_allgreatvictory_condition()
{
	if((ALLGREATVICTORY == TRUE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_00 " );	// I guess you'll get bored again soon.
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_01 " );	// Why else?
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_02 " );	// It's just that there aren't any orcs left in this part of the island!
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_03 " );	// Well, that's okay. Surely the Valley of Mines is still full of them.
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_06 " );	// So we'll have to look into it sometime!
};


instance DIA_FIGHTER_NACH_DJG_NW_WHATDONOW(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_whatdonow_condition;
	information = dia_fighter_nach_djg_nw_whatdonow_info;
	permanent = FALSE;
	description = " What are your next plans? " ;
};


func int dia_fighter_nach_djg_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_whatdonow_info()
{
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_WhatDoNow_01_00 " );	// What are your future plans?
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_WhatDoNow_01_01 " );	// I think I'll stay with Lee for now. I don't care where else to go, mate.
};


instance DIA_FIGHTER_NACH_DJG_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_travelonbigland_condition;
	information = dia_fighter_nach_djg_nw_travelonbigland_info;
	permanent = FALSE;
	description = " I'm sailing to the mainland. Are you with me? " ;
};


func int dia_fighter_nach_djg_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_00 " );	// I'm sailing to the mainland. Are you with me?
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_01 " );	// Of course... (smiling) You still ask!
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_02 " );	// True, they say that there are now full of orcs.
	AI_Output(self,other, " DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_03 " );	// That's what I need, mate! And then I just go crazy with boredom!
	AI_Output(other,self, " DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_04 " );	// Then we'll meet on the ship.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	GORNTOBIGLAND = TRUE;
	B_LogEntry( TOPIC_SALETOBIGLAND , " As I expected, the Gorn is sailing with me. " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

