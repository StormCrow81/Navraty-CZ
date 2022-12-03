

instance DIA_Addon_Matt_EXIT(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 999;
	condition = DIA_Addon_Matt_EXIT_Condition;
	information = DIA_Addon_Matt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Matt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Matt_PICKPOCKET(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 900;
	condition = DIA_Addon_Matt_PICKPOCKET_Condition;
	information = DIA_Addon_Matt_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Matt_PICKPOCKET_Condition()
{
	return C_Beklauen(55,91);
};

func void DIA_Addon_Matt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Matt_PICKPOCKET,Dialog_Back,DIA_Addon_Matt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Matt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Matt_PICKPOCKET_DoIt);
};

func void DIA_Addon_Matt_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
};

func void DIA_Addon_Matt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
};


instance DIA_Addon_Matt_Hello(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 1;
	condition = DIA_Addon_Matt_Hello_Condition;
	information = DIA_Addon_Matt_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Matt_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Matt_Hello_Info()
{
	AI_Output(self,other, " DIA_Addon_Matt_Hello_10_01 " );	// A newbie? Wonderful. We need every person right now.
};


instance DIA_Addon_Matt_PERM(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 2;
	condition = DIA_Addon_Matt_PERM_Condition;
	information = DIA_Addon_Matt_PERM_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Alright_15_01");	//Как дела?
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other, " DIA_Addon_Matt_Alright_10_02 " );	// What part of the phrase 'HEALING POTION' don't you understand?
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Matt_Alright_10_01 " );	// It's all right, captain!
		};
	}
	else if((GregIsBack == TRUE) && !Npc_IsDead(Greg))
	{
		AI_Output(self,other, " DIA_Addon_Matt_Job_10_01 " );	// Are you kidding? We no longer have a ship.
		AI_Output(self,other, " DIA_Addon_Matt_Job_10_02 " );	// All we have to do is wait for Greg to decide what to do next.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Matt_Job_10_03 " );	// All is quiet in the camp now. So I'm going to take some rest.
		AI_Output(self,other, " DIA_Addon_Matt_Job_10_04 " );	// If I were you, by the way, I would do the same.
		AI_Output(self,other, " DIA_Addon_Matt_Job_10_05 " );	// The bandits are here, so the situation may change faster than we thought.
	};
};


instance DIA_Addon_Matt_Bandits(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 3;
	condition = DIA_Addon_Matt_Bandits_Condition;
	information = DIA_Addon_Matt_Bandits_Info;
	description = " What do you know about these bandits? " ;
};


func int DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_Bandits_Info()
{
	AI_Output(other,self, " DIA_Addon_Matt_Bandits_15_03 " );	// What do you know about bandits?
	AI_Output(self,other, " DIA_Addon_Matt_Bandits_10_01 " );	// You mean, besides the fact that they are deadly and outnumber us many times over?
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_02");	//Да.
	AI_Output(self,other, " DIA_Addon_Matt_Bandits_10_02 " );	// They're full of gold.
	AI_Output(self,other, " DIA_Addon_Matt_Bandits_10_03 " );	// Well, at least they HAVE plenty of gold. They never paid us for the last batch of goods.
	AI_Output(self,other, " DIA_Addon_Matt_Bandits_10_04 " );	// But I doubt they did it for lack of funds.
	AI_Output(self,other, " DIA_Addon_Matt_Bandits_10_05 " );	// I think they're just too arrogant.
};


instance DIA_Addon_Matt_Francis(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 4;
	condition = DIA_Addon_Matt_Francis_Condition;
	information = DIA_Addon_Matt_Francis_Info;
	description = " What do you know about Francis? " ;
};


func int DIA_Addon_Matt_Francis_Condition()
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

func void DIA_Addon_Matt_Francis_Info()
{
	AI_Output(other,self, " DIA_Addon_Brandon_Matt_15_00 " );	// What do you know about Francis?
	AI_Output(self,other, " DIA_Addon_Matt_Francis_10_01 " );	// Besides being lazy and failing to do his job?
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_02");	//Да.
	AI_Output(self,other, " DIA_Addon_Matt_Francis_10_03 " );	// Need to think! Hmmm... (thoughtfully) No, nothing else comes to mind.
};


instance DIA_Addon_Matt_Hire (C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 11;
	condition = DIA_Addon_Matt_Hire_Condition;
	information = DIA_Addon_Matt_Hire_Info;
	permanent = FALSE;
	description = " Come with me. " ;
};


func int DIA_Addon_Matt_Hire_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Matt_Hire_Info()
{
	AI_Output(other,self, " DIA_Addon_Matt_FollowMe_15_00 " );	// Come with me.
	AI_Output(self,other, " DIA_Addon_Matt_FollowMe_10_01 " );	// I can't go anywhere right now. I rest.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_02");	//Приказ Грэга.
	AI_Output(self,other, " DIA_Addon_Matt_FollowMe_10_03 " );	// I understand, I understand. This, of course, changes everything. Already going.
	AI_Output(self,other, " DIA_Addon_Matt_FollowMe_10_04 " );	// Where are we going?
	Info_ClearChoices(DIA_Addon_Matt_Hire);
	Info_AddChoice(DIA_Addon_Matt_Anheuern, " Shut up and follow me. " ,DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice(DIA_Addon_Matt_Anheuern, " We must clear the canyon of animals. " ,DIA_Addon_Matt_Anheuern_ClearCanyon);
};

func void DIA_Addon_Matt_Hire_ShutUp()
{
	AI_Output(other,self, " DIA_Addon_Matt_FollowMe_ShutUp_15_00 " );	// Shut up and follow me.
	AI_Output(self,other, " DIA_Addon_Matt_FollowMe_ShutUp_10_01 " );	// (sarcastically) Yes, Captain!
	Info_ClearChoices(DIA_Addon_Matt_Hire);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
};

func void DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output(other,self, " DIA_Addon_Matt_FollowMe_ClearCanyon_15_00 " );	// We must clear the canyon of the beasts.
	AI_Output(self,other, " DIA_Addon_Matt_FollowMe_ClearCanyon_10_01 " );	// You're crazy. There are plenty of them! And these razor teeth are not to be trifled with.
	AI_Output(other,self, " DIA_Addon_Matt_FollowMe_ClearCanyon_15_02 " );	// I know. So, are you coming?
	AI_Output(self,other, " DIA_Addon_Matt_FollowMe_ClearCanyon_10_03 " );	// (sighs) I hope you have enough bottles of healing potion. We will need them.
	Info_ClearChoices(DIA_Addon_Matt_Hire);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
};


instance DIA_Addon_Matt_ComeOn(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 12;
	condition = DIA_Addon_Matt_ComeOn_Condition;
	information = DIA_Addon_Matt_ComeOn_Info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int DIA_Addon_Matt_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Matt_Anheuern));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Matt_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_Matt_ComeOn_15_00 " );	// Come with me.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Matt_ComeOn_10_01 " );	// Yes, captain!
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};


instance DIA_Addon_Matt_GoHome(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 13;
	condition = DIA_Addon_Matt_GoHome_Condition;
	information = DIA_Addon_Matt_GoHome_Info;
	permanent = TRUE;
	description = " I don't need you anymore. " ;
};


func int DIA_Addon_Matt_GoHome_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Matt_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_Matt_DontNeedYou_15_00 " );	// I don't need you anymore.
	AI_Output(self,other, " DIA_Addon_Matt_GoHome_10_01 " );	// (mumbles under his breath) I could use a glass of grog!
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Matt_TooFar(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 14;
	condition = DIA_Addon_Matt_TooFar_Condition;
	information = DIA_Addon_Matt_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Matt_TooFar_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && (C_GregsPiratesTooFar() ==  TRUE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Matt_TooFar_Info()
{
	AI_Output(self,other, " DIA_Addon_Matt_TooFar_10_01 " );	// You'll have to go on alone, (sarcastically) captain.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other, " DIA_Addon_Matt_TooFar_10_03 " );	// The guys and I are going back to the camp!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Matt_TooFar_10_02 " );	// I'm going back to camp!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Matt_Healing(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 15;
	condition = DIA_Addon_Matt_Healing_Condition;
	information = DIA_Addon_Matt_Healing_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Matt_Healing_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100)))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Matt_Healing_Info()
{
	AI_Output(self,other, " DIA_Addon_Matt_Healing_10_01 " );	// Hey Captain, I could use a healing potion!
};

