

instance DIA_Regis_EXIT(C_Info)
{
	npc = VLK_425_Regis;
	nr = 999;
	condition = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Regis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Regis_PICKPOCKET(C_Info)
{
	npc = VLK_425_Regis;
	nr = 900;
	condition = DIA_Regis_PICKPOCKET_Condition;
	information = DIA_Regis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Regis_PICKPOCKET_Condition()
{
	return  C_Robbery ( 40 , 35 );
};

func void DIA_Regis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
	Info_AddChoice(DIA_Regis_PICKPOCKET,Dialog_Back,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Regis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
};

func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
};


instance DIA_Regis_Hello (C_Info)
{
	npc = VLK_425_Regis;
	nr = 1;
	condition = DIA_Regis_Hallo_Condition;
	information = DIA_Regis_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Regis_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Regis_Hallo_Info()
{
	AI_Output(self,other, " DIA_Regis_Hallo_13_00 " );	// Hey, you're new to this city, right?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Да, а ты?
	AI_Output(self,other, " DIA_Regis_Hallo_13_02 " );	// I sailed from the mainland and now I'm hanging out here doing nothing. I'm almost out of money, so it looks like I have no choice but to join the militia.
	AI_Output(self,other, " DIA_Regis_Hallo_13_03 " );	// But I don't want to do that. I don't want to be killed by orcs when I fight for the king.
};


DIA_Regis_MILIZ (C_Info) instances
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_MILIZ_Condition;
	information = DIA_Regis_MILIZ_Info;
	permanent = FALSE;
	description = " What can you tell us about the militia? " ;
};


func int DIA_Regis_MILIZ_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_Hallo))
	{
		return TRUE;
	};
};

func void DAY_Regis_MILIZ_Info()
{
	AI_Output(other,self, " DIA_Regis_MILIZ_15_00 " );	// What can you tell us about the militia?
	AI_Output(self,other, " DIA_Regis_Add_13_01 " );	// They are now commanded by one of the paladins. A certain Lord Andre.
	AI_Output(self,other, " DIA_Regis_Add_13_02 " );	// He's trying to mobilize half the city in case the orcs attack.
	AI_Output(self,other, " DIA_Regis_Add_13_03 " );	// But to join the militia, you must be a citizen of this city.
	AI_Output(self,other, " DIA_Regis_Add_13_04 " );	// As far as I know, if you are not a citizen of the city, you will still be trained, but not officially enrolled.
};


DIA_Regis_ANDRE (C_Info) instances
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_ANDRE_Condition;
	information = DIA_Regis_ANDRE_Info;
	permanent = FALSE;
	description = " What else can you say about Lord Andre? " ;
};


func int DIA_Regis_ANDRE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_MILIZ))
	{
		return TRUE;
	};
};

func void DIA_Regis_ANDRE_Info()
{
	AI_Output(other,self, " DIA_Regis_ANDRE_15_00 " );	// What else can you say about Lord Andre?
	AI_Output(self,other, " DIA_Regis_Add_13_05 " );	// He also took the position of a judge.
	AI_Output(self,other, " DIA_Regis_Add_13_06 " );	// If you broke the law in the city, you will have to answer to him.
	AI_Output(self,other, " DIA_Regis_Add_13_07 " );	// I got into a fight with a citizen once.
	AI_Output(self,other, " DIA_Regis_Add_13_08 " );	// He ran to complain to Lord Andre.
	AI_Output(self,other, " DIA_Regis_Add_13_09 " );	// And this trifle cost me fifty gold coins.
	AI_Output(self,other, " DIA_Regis_Add_13_10 " );	// It's good that this happened at night, otherwise there would have been other witnesses.
	AI_Output(self,other, " DIA_Regis_Add_13_11 " );	// The more people complain about you, the higher the penalty.
};


instances of DIA_Regis_Valentino (C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_Valentino_Condition;
	information = DIA_Regis_Valentino_Info;
	permanent = FALSE;
	description = " Who did you fight? " ;
};


func int DIA_Regis_Valentino_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Regis_OTHER ))
	{
		return TRUE;
	};
};

func void DIA_Regis_Valentino_Info()
{
	AI_Output(other,self, " DIA_Regis_Add_15_12 " );	// Who did you fight?
	AI_Output(self,other, " DIA_Regis_Add_13_13 " );	// With a guy named Valentino. He often hangs out in a tavern near the temple.
	AI_Output(self,other, " DIA_Regis_Add_13_14 " );	// Usually I'm pretty peaceful. But THIS freak just pissed me off...
};


instance DIA_Regis_ValDefeat (C_Info) .
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_ValDefeat_Condition;
	information = DIA_Regis_ValDefeat_Info;
	permanent = FALSE;
	description = " I met this Valentino... " ;
};


func int DIA_Regis_ValDefeat_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Regis_Valentino ) && ( Valentino . aivar [ AIV_DefeatedByPlayer ] ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Regis_ValDefeat_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Regis_Add_15_15 " );	// I met this Valentino...
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//И?
	AI_Output(other,self, " DIA_Regis_Add_15_17 " );	// I gave him a good thrashing...
	AI_Output(self,other, " DIA_Regis_Add_13_18 " );	// (laughs) He deserved it...

	if(!Npc_IsDead(Valentino))
	{
		AI_Output(self,other, " DIA_Regis_Add_13_19 " );	// Here - I found this ring in his pocket when our skirmish was over.
		B_GiveInvItems(self,other,ItRi_ValentinosRing,1);
		Regis_Ring = TRUE;
		AI_Output(self,other, " DIA_Regis_Add_13_20 " );	// (grins) You can pass it to the next one who cuffs him...
	};
};


var int Regis_Bogendieb;

instance DIA_Regis_PERM(C_Info)
{
	npc = VLK_425_Regis;
	nr = 200;
	condition = DIA_Regis_PERM_Condition;
	information = DIA_Regis_PERM_Info;
	permanent = TRUE;
	description = " Have you heard anything interesting? " ;
};


func int DIA_Regis_PERM_Condition()
{
	return TRUE;
};

func void DIA_Regis_PERM_Info()
{
	AI_Output(other,self, " DIA_Regis_PERM_15_00 " );	// Heard anything interesting?

	if ((Regis_Bogendieb ==  FALSE ) && (MIS_Bosper_Bogen !=  LOG_SUCCESS ))
	{
		AI_Output(self,other, " DIA_Regis_PERM_13_01 " );	// You can say that.
		AI_Output(self,other, " DIA_Regis_PERM_13_02 " );	// They say Bosper, the master archer, was robbed. And in the most brazen way!
		AI_Output(self,other, " DIA_Regis_PERM_13_03 " );	// A thief broke into his shop in broad daylight and grabbed a bow.
		AI_Output(self,other, " DIA_Regis_PERM_13_04 " );	// Bosper ran after him, yelling 'Stop the thief!' But the thief was very agile.
		MIS_Bosper_Bogen = LOG_Running;
		Regis_Bogendieb = TRUE;
	}
	else  if ((MIS_Bosper_Bogen ==  LOG_SUCCESS ) && (Regis_Bogendieb !=  2 ))
	{
		AI_Output(self,other, " DIA_Regis_PERM_13_05 " );	// And then some honest man found this bow and gave it back to Bosper.
		AI_Output(self,other, " DIA_Regis_PERM_13_06 " );	// It's weird - no one usually cares about others these days, but this guy went to his place and got the bow back.
		Regis_Bogendieb = 2 ;
	}
	else  if (chapter !=  3 )
	{
		AI_Output(self,other, " DIA_Regis_PERM_13_07 " );	// So far everything is quiet. But I think that when the orcs come, we will notice...
	}
	else if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Regis_PERM_13_08 " );	// This mercenary turned out to be innocent, and they had to let him go.
		AI_Output(self,other, " DIA_Regis_PERM_13_09 " );	// Lord Hagen must be beside himself with rage.
	}
	else
	{
		AI_Output(self,other, " DIA_Regis_PERM_13_10 " );	// The whole city is talking about it. Do you remember Lothar, the paladin?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//Может быть.
		AI_Output(self,other, " DIA_Regis_PERM_13_12 " );	// So, he's dead. Killed right on the street. Mercenaries are suspected of this, of course.
	};
};


instance DIA_Regis_Crew(C_Info)
{
	npc = VLK_425_Regis;
	nr = 51;
	condition = DIA_Regis_Crew_Condition;
	information = DIA_Regis_Crew_Info;
	permanent = FALSE;
	description = " I'm trying to put together a crew for a boat trip. " ;
};


func int DIA_Regis_Crew_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Regis_Crew_Info()
{
	AI_Output(other,self, " DIA_Regis_Crew_15_00 " );	// I'm trying to put together a crew for a sea trip.
	AI_Output(self,other, " DIA_Regis_Crew_13_01 " );	// Can't help. You'd better ask around at the port. Well, or maybe in a tavern.
	AI_Output(self,other, " DIA_Regis_Crew_13_02 " );	// If there are still sailors here, you'll most likely find them there.
};


instance DIA_REGIS_PAYBACK(C_Info)
{
	npc = VLK_425_Regis;
	nr = 51;
	condition = dia_regis_payback_condition;
	information = dia_regis_payback_info;
	permanent = FALSE;
	description = " Hello from Valentino! " ;
};


func int dia_regis_payback_condition()
{
	if(MIS_VALENTINOHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_regis_payback_info()
{
	AI_Output(other,self, " DIA_Regis_PayBack_01_00 " );	// Greetings from Valentino!
	AI_Output(self,other, " DIA_Regis_PayBack_01_01 " );	// (surprised) What?
	AI_Output(self,other, " DIA_Regis_PayBack_01_02 " );	// What does this idiot want from me?
	AI_Output(other,self, " DIA_Regis_PayBack_01_04 " );	// Just so I can punch you a couple of times - just for fun, so to speak.
	AI_Output(self,other, " DIA_Regis_PayBack_01_05 " );	// Did he send you to get even with me?
	AI_Output(self,other, " DIA_Regis_PayBack_01_07 " );	// Ha! And you think you can do it just like that? (laughs)
	self.guild = GIL_NONE;
	Npc_SetTrueGuild(self,GIL_NONE);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instances DIA_REGIS_PAYBACKOK (C_Info)
{
	npc = VLK_425_Regis;
	nr = 1;
	condition = dia_regis_paybackok_condition;
	information = dia_regis_paybackok_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_regis_paybackok_condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] !=  FIGHT_NONE ) && Npc_KnowsInfo(other,dia_regis_payback) && ( REGISPISSOFF  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_regis_paybackok_info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_00 " );	// Well, are you satisfied?
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_01 " );	// You think if you beat me, you became cool?!
		AI_Output(other,self, " DIA_Regis_PayBackOk_01_02 " );	// Hey buddy, slow down! Otherwise I'll have to teach you good manners again.
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_03 " );	// Come on, laugh at me!
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_04 " );	// Just keep in mind that if next time you decide to lay a finger on me, you'll have to deal with Lord Andre!
		self.guild = GIL_VLK;
		REGISPISSOFF = TRUE;
		Npc_SetTrueGuild(self,GIL_VLK);
		self.aivar[AIV_ToughGuy] = FALSE ;

		if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE))
		{
			B_GivePlayerXP(250);
			REGISFIGHTOK = TRUE;
			B_LogEntry( TOPIC_VALENTINOHELP , " I beat Regis! " );
		};

		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		self.guild = GIL_VLK;
		Npc_SetTrueGuild(self,GIL_VLK);
		self.aivar[AIV_ToughGuy] = FALSE ;
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_07 " );	// Well, did you have enough?
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_08 " );	// And just try to poke your nose at me again!
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_09 " );	// And now - get out!
		REGISPISSOFF = TRUE;

		if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE))
		{
			REGISFIGHTNOTOK = TRUE;
			B_LogEntry( TOPIC_VALENTINOHELP , " Regis beat me. " );
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_10 " );	// What, baby - so scared that he put it in his pants ahead of time? (laughs)
		AI_Output(self,other, " DIA_Regis_PayBackOk_01_11 " );	// But we haven't finished our conversation yet...
		AI_StopProcessInfos(self);
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
		B_Attack(self,other,AR_NONE,0);
	};
};
