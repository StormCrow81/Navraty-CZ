

instance DIA_Bullco_EXIT(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 999;
	condition = DIA_Bullco_EXIT_Condition;
	information = DIA_Bullco_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bullco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bullco_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bullco_Hallo (C_Info)
{
	npc = Sld_807_Bullco;
	nr = 1;
	condition = DIA_Bullco_Hallo_Condition;
	information = DIA_Bullco_Hallo_Info;
	permanent = TRUE;
	description = " We two need to chat... " ;
};


func int DIA_Bullco_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bullco_Hallo_Info()
{
	AI_Output(other,self, " DIA_Bullco_HALLO_15_00 " );	// We two need to chat...
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other, " DIA_Bullco_HALLO_06_01 " );	// Look, you won! Now leave me alone.
	}
	else
	{
		AI_Output(self,other, " DIA_Bullco_HALLO_06_02 " );	// I don't want to know anything about this.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Bullco_Quatscher (C_Info)
{
	npc = Sld_807_Bullco;
	nr = 2;
	condition = DIA_Bullco_Quatscher_Condition;
	information = DIA_Bullco_Quatscher_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_Quatscher_Condition()
{
	if (( self . aivar [ AIV_DefeatedByPlayer ] ==  FALSE ) && ( Sylvio_angequatscht >=  2 ))
	{
		return TRUE;
	};
};

func void DIA_Bullco_Quatscher_Info()
{
	AI_Output(self,other, " DIA_Bullco_Quatscher_06_00 " );	// Silvio doesn't like talkers. You could understand it already.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
	B_Attack(self,other,AR_NONE,1);
};


var int Bullco_Leave_Day;
var int Bullco_scharf;

instance DIA_Bullco_PleaseLeave(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 3;
	condition = DIA_Bullco_PleaseLeave_Condition;
	information = DIA_Bullco_PleaseLeave_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_PleaseLeave_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] ==  FALSE )
	{
		if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) || (Sylvio_MenDefeated == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bullco_PleaseLeave_Info()
{
	AI_Output(self,other, " DIA_Bullco_PleaseLeave_06_00 " );	// We need to talk. You and me
	AI_Output(other,self, " DIA_Bullco_PleaseLeave_15_01 " );	// What do you need?
	AI_Output(self,other, " DIA_Bullco_PleaseLeave_06_02 " );	// I think it's better for everyone if your face doesn't hang around this farm anymore.
	AI_Output(self,other, " DIA_Bullco_PleaseLeave_06_03 " );	// So that you won't be here tomorrow morning. Did we understand each other?
	Bullco_Leave_Day = B_GetDayPlus();
	Bullco_scharf = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
};


var int Bullco_HitCounter;

instances of DIA_Bullco_DailyCheck (C_Info)
{
	npc = Sld_807_Bullco;
	nr = 4;
	condition = DIA_Bullco_DailyCheck_Condition;
	information = DIA_Bullco_DailyCheck_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_DailyCheck_Condition()
{
	if (( self . aivar [ AIV_DefeatedByPlayer ] ==  FALSE ) && ( Bullco_scharf ==  TRUE ) && ( Wld_GetDay () > Bullco_Leave_Day ))
	{
		return TRUE;
	};
};

func void DIA_Bullco_DailyCheck_Info()
{
	if(Bullco_HitCounter == 0)
	{
		AI_Output(self,other, " DIA_Bullco_DailyCheck_06_00 " );	// You're still here...
		AI_Output(self,other, " DIA_Bullco_DailyCheck_06_01 " );	// I thought we agreed that I would let you go in peace.
		AI_Output(self,other, " DIA_Bullco_DailyCheck_06_02 " );	// You should have listened to my words.
	}
	else
	{
		AI_Output(self,other, " DIA_Bullco_DailyCheck_06_03 " );	// I can't believe my eyes! This freak is still here!
	};
	Bullco_HitCounter = Bullco_HitCounter + 1;
	Bullco_Leave_Day = B_GetDayPlus();
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Bullco_WontLeave(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 5;
	condition = DIA_Bullco_WontLeave_Condition;
	information = DIA_Bullco_WontLeave_Info;
	permanent = FALSE;
	description = " I'm NOT going to leave here! " ;
};


func int DIA_Bullco_WontLeave_Condition()
{
	if(Bullco_scharf == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bullco_WontLeave_Info()
{
	AI_Output(other,self, " DIA_Bullco_WontLeave_15_00 " );	// I'm NOT going to leave here!
	if (self.aivar[AIV_DefeatedByPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Bullco_WontLeave_06_01 " );	// (sighs) Looks like we'll have to discuss this issue again.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Bullco_WontLeave_06_02 " );	// (grouchily) Yes, yes, go tell this to someone who is interested.
		Bullco_sharp = FALSE ;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bullco_PepesSchafe (C_Info)
{
	npc = Sld_807_Bullco;
	nr = 6;
	condition = DIA_Bullco_PepesSchafe_Condition;
	information = DIA_Bullco_PepesSchafe_Info;
	permanent = FALSE;
	description = " Does the name Pepe mean anything to you? " ;
};


func int DIA_Bullco_PepesSchafe_Condition()
{
	if ((MY_Pepe_KillWolves ==  LOG_SUCCESS ) && (Bullco_scharf ==  TRUE ) && (Onar_WegenPepe ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Bullco_PepesSchafe_Info()
{
	AI_Output(other,self, " DIA_Bullco_PepesSchafe_15_00 " );	// Does the name Pepe mean anything to you?
	AI_Output(self,other, " DIA_Bullco_PepesSchafe_06_01 " );	// I have absolutely no idea what you're talking about, but I don't like your tone!
	AI_Output(other,self, " DIA_Bullco_PepesSchafe_15_02 " );	// You were supposed to guard the sheep.
	AI_Output(self,other, " DIA_Bullco_PepesSchafe_06_03 " );	// What do I care about sheep?
	AI_Output(other,self, " DIA_Bullco_PepesSchafe_15_04 " );	// They're Li's business.
	AI_Output(self,other, " DIA_Bullco_PepesSchafe_06_05 " );	// What are you implying?
	AI_Output(other,self, " DIA_Bullco_PepesSchafe_15_06 " );	// If you keep getting on my nerves, I'll make sure you have to pay for the sheep.
	AI_Output(other,self, " DIA_Bullco_PepesSchafe_15_07 " );	// So if you care about your salary, leave me alone!
	AI_Output(self,other, " DIA_Bullco_PepesSchafe_06_08 " );	// (furious) You, you...
	AI_Output(other,self, " DIA_Bullco_PepesSchafe_15_09 " );	// (calmly) Yes?
	AI_Output(self,other, " DIA_Bullco_PepesSchafe_06_10 " );	// (under his breath) You nasty sly bastard...
	Bullco_sharp = FALSE ;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_BullcoSLD_PICKPOCKET(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 900;
	condition = DIA_BullcoSLD_PICKPOCKET_Condition;
	information = DIA_BullcoSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_BullcoSLD_PICKPOCKET_Condition()
{
	return  C_Robbery ( 56 , 35 );
};

func void DIA_BullcoSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
	Info_AddChoice(DIA_BullcoSLD_PICKPOCKET,Dialog_Back,DIA_BullcoSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BullcoSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_BullcoSLD_PICKPOCKET_DoIt);
};

func void DIA_BullcoSLD_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
};

func void DIA_BullcoSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
};

