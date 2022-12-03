

instance DIA_Addon_RoastPirate_EXIT(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 999;
	condition = DIA_Addon_RoastPirate_EXIT_Condition;
	information = DIA_Addon_RoastPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_RoastPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int PIR_1364_Grog;

instance DIA_Addon_RoastPirate_GimmeGrog(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 1;
	condition = DIA_Addon_RoastPirate_GimmeGrog_Condition;
	information = DIA_Addon_RoastPirate_GimmeGrog_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_RoastPirate_GimmeGrog_Condition()
{
	if((Npc_IsInState(self,ZS_Talk) == TRUE) && (Npc_WasInState(self,ZS_Roast_Scavenger) == TRUE) && (PIR_1364_Grog == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_RoastPirate_GimmeGrog_Info()
{
	AI_Output(self,other, " DIA_Addon_PIR_6_GimmeGrog_06_00 " );	// The heat of the campfire makes me thirsty.
	AI_Output(self,other, " DIA_Addon_PIR_6_GimmeGrog_06_01 " );	// Do you have a grog for me?
	Log_CreateTopic(TOPIC_Addon_RoastGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RoastGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_RoastGrog, " Pirate by the fire needs some grog. " );
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog, " I don't have anything. " ,DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);
	if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog,"Вот, глотни.",DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};
};

func void DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00");	//Нет.
	AI_Output(self,other, " DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00 " );	// Damn! I'm dying of thirst...
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output(other,self, " DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00 " );	// Here, take a sip.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	AI_Output(self,other, " DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01 " );	// Thanks mate!
	B_UseItem(self,ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry(TOPIC_Addon_RoastGrog, " Grog kept the pirate from dying of thirst. " );
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_RoastPirate_ShallowWater (C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 2;
	condition = DIA_Addon_RoastPirate_ShallowWater_Condition;
	information = DIA_Addon_RoastPirate_ShallowWater_Info;
	description = " How are you? " ;
};


func int DIA_Addon_RoastPirate_ShallowWater_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_ShallowWater_Info()
{
	AI_Output(other,self, " DIA_Addon_PIR_6_SeichtesWasser_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_PIR_6_SeichtesWasser_06_01 " );	// I have to serve all this gluttonous crowd.
	AI_Output(self,other, " DIA_Addon_PIR_6_SeichtesWasser_06_02 " );	// And that's why I have to stand here all day, dying from the heat.
	AI_Output(self,other, " DIA_Addon_PIR_6_SeichtesWasser_06_03 " );	// I'd rather wander along the shore in search of prey.
	AI_Output(self,other, " DIA_Addon_PIR_6_SeichtesWasser_06_04 " );	// A merchant ship was wrecked off the reefs that week.
	AI_Output(self,other, " DIA_Addon_PIR_6_SeichtesWasser_06_05 " );	// And now the good from him takes out to the beach.
	AI_Output(self,other, " DIA_Addon_PIR_6_SeichtesWasser_06_06 " );	// I really hope that someone will replace me soon.
};


instance DIA_Addon_RoastPirate_Francis(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 3;
	condition = DIA_Addon_RoastPirate_Francis_Condition;
	information = DIA_Addon_RoastPirate_Francis_Info;
	permanent = FALSE;
	description = " What can you tell me about Francis? " ;
};


func int DIA_Addon_RoastPirate_Francis_Condition()
{
	if (Francis_shit out ==  FALSE )
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	return  FALSE ;
};

func void DIA_Addon_RoastPirate_Francis_Info()
{
	AI_Output(other,self, " DIA_Addon_PIR_6_FRANCIS_15_00 " );	// What can you tell me about Francis?
	AI_Output(self,other, " DIA_Addon_PIR_6_Francis_06_01 " );	// About Francis? He acts like he's our captain. But never mind, Greg will be back...
	AI_Output(self,other, " DIA_Addon_PIR_6_Francis_06_02 " );	// Francis will immediately retreat to his dark corner.
	AI_Output(self,other, " DIA_Addon_PIR_6_Francis_06_04 " );	// This worm deceives everyone. I'm sure he even steals from himself.
	AI_Output(self,other, " DIA_Addon_PIR_6_Francis_06_05 " );	// But I didn't tell you that. And until you have proof, don't accuse him.
};


instance DIA_Addon_RoastPirate_PERM(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 99;
	condition = DIA_Addon_RoastPirate_PERM_Condition;
	information = DIA_Addon_RoastPirate_PERM_Info;
	permanent = TRUE;
	description = " Anything else? " ;
};


func int DIA_Addon_RoastPirate_PERM_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_RoastPirate_ShallowWater))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_RoastPirate_PERM_Info()
{
	be int randy;
	AI_Output(other,self, " DIA_Addon_Matt_Job_15_00 " );	// Anything else?
	randy = Hlp_Random( 3 );
	if(GregIsBack == TRUE)
	{
		if ((randy ==  0 ) &&  ! Npc_IsDead(Francis))
		{
			AI_Output(self,other, " DIA_Addon_PIR_6_Chef_06_02 " );	// If I were Greg, I'd send Francis to the swamp.
		}
		else if(randy == 1)
		{
			AI_Output(self,other, " DIA_Addon_PIR_6_Chef_06_03 " );	// After Greg returns, the bandits will think twice before attacking us.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_PIR_6_Chef_06_01 " );	// We've got more work to do since Greg's return, but at least we're getting paid well for it.
		};
	}
	else  if ((randy ==  0 ) &&  ! Npc_IsDead(Francis))
	{
		AI_Output(self,other, " DIA_Addon_PIR_6_Chef_06_06 " );	// Francis is a complete loser. Ever since he took command, everything has been going downhill.
	}
	else if(randy == 1)
	{
		AI_Output(self,other, " DIA_Addon_PIR_6_Chef_06_05 " );	// Let those bandits attack. They don't even understand what happened to them.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_PIR_6_Chef_06_04 " );	// Hope Greg comes back soon. I missed the open sea.
	};
};


instance DIA_Addon_RoastPirate_Hire (C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 11;
	condition = DIA_Addon_RoastPirate_Hire_Condition;
	information = DIA_Addon_RoastPirate_Hire_Info;
	permanent = FALSE;
	description = " You must help me. " ;
};


func int DIA_Addon_RoastPirate_Hire_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_RoastPirate_Hire_Info()
{
	AI_Output(other,self, " DIA_Addon_Matt_FollowMe_15_01 " );	// You have to help me.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_03");	//Приказ Грэга.
	B_Say(self,other,"$ABS_GOOD");
};


instance DIA_Addon_RoastPirate_ComeOn(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 12;
	condition = DIA_Addon_RoastPirate_ComeOn_Condition;
	information = DIA_Addon_RoastPirate_ComeOn_Info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int DIA_Addon_RoastPirate_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && (MY_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_RoastPirate_Anheuern));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_RoastPirate_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_RoastPirate_ComeOn_15_00 " );	// Come with me.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};


instance DIA_Addon_RoastPirate_GoHome(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 13;
	condition = DIA_Addon_RoastPirate_GoHome_Condition;
	information = DIA_Addon_RoastPirate_GoHome_Info;
	permanent = TRUE;
	description = " I don't need you anymore. " ;
};


func int DIA_Addon_RoastPirate_GoHome_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_RoastPirate_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_RoastPirate_GoHome_15_00 " );	// I don't need you anymore.
	B_Say(self,other,"$ABS_GOOD");
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_RoastPirate_TooFar(C_Info)
{
	npc = PIR_1364_Addon_Pirat;
	nr = 14;
	condition = DIA_Addon_RoastPirate_TooFar_Condition;
	information = DIA_Addon_RoastPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_RoastPirate_TooFar_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && (C_GregsPiratesTooFar() ==  TRUE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_RoastPirate_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

