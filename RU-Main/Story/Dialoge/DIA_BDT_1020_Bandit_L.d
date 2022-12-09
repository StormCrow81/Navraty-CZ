
instance DIA_BDT_1020_Wegelagerer_EXIT (C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 999;
	condition = DIA_Wegelagerer_EXIT_Condition;
	information = DIA_Wegelagerer_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wegelagerer_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1020_Wegelagerer_Checkpoint = "NW_TROLLAREA_PATH_46";

instance DIA_BDT_1020_Wegelagerer_FirstWarn (C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 1;
	condition = DIA_BDT_1020_Wegelagerer_FirstWarn_Condition;
	information = DIA_BDT_1020_Wegelagerer_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_FirstWarn_Condition()
{
	if((other.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Info()
{
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_06_00 " );	// Hey you, stop!
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_FirstWarn_15_01 " );	// What do you need?
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_06_02 " );	// If you don't want to get punched in the face, you'd better hand over your coins, and fast!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " How much do you want? " ,DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " You're joking, right? " ,DIA_BDT_1020_Wegelagerer_FirstWarn_Joke);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Get out of my way! " ,DIA_BDT_1020_Wegelagerer_PissOff);
	if ( MIS_SCHNITZELJAGD  == LOG_Running)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Have you seen the novice? " ,DIA_BDT_1020_Wegelagerer_AGON);
	};
};

func void DIA_BDT_1020_Wegelagerer_AGON()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_AGON_15_00 " );	// Tell me, have you seen the novice?
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_AGON_06_01 " );	// Uh... what? Hmmm... Maybe?
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_AGON_06_02 " );	// Give me twenty gold and maybe I'll remember!
	Wegelagerer_Surprise = TRUE;
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Here. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " I'm sorry, but I don't have any money. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Let's see how you disappear. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00 " );	// How much do you want?
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01 " );	// (grinning) Twenty gold and we can be friends.
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Here. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " I'm sorry, but I don't have any money. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Let's see how you disappear. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Joke()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00");	//You're joking, right?
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01 " );	// Do I look like a buffoon?
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02 " );	// If I don't see twenty gold before you step forward...
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03 " );	// You start to bleed. So give me the fucking money.
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Here. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " I'm sorry, but I don't have any money. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Let's see how you disappear. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_PissOff()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_PissOff_15_00 " );	// Get out of my way!
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_PissOff_06_01 " );	// Oh, what big words from such a little man.
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_PissOff_06_02 " );	// It's time to cut you up.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00 " );	// Okay, here's the money.
	if(Wegelagerer_Surprise == FALSE)
	{
		AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01 " );	// I tell you, twenty gold pieces isn't that much to pay for your life. You can pass.
	};
	if(Wegelagerer_Surprise == TRUE)
	{
		AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02 " );	// Okay, the acolyte walked through here about an hour ago.
		AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03 " );	// I think he was in a hurry, looking around all the time... Now get out.
	};
	B_GiveInvItems(other,self,ItMi_Gold,20);
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00 " );	// Sorry, I don't have any money.
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01 " );	// Yeah, these are really hard times.
	if(Npc_HasEquippedMeleeWeapon(other))
	{
		AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02 " );	// Then let's do this - give me your weapon. And I'll give you a pass this time.
		Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Forget it. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, " Here's my weapon. " ,DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon);
	}
	else
	{
		AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03 " );	// Then come back when you have money. No money - no bridge.
		self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
		AI_StopProcessInfos(self);
	};
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Never()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00 " );	// Get out of my way!
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01 " );	// Do you really want to do this?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00 " );	// Forget it.
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01 " );	// That's what I thought.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00 " );	// Here, take my weapon.
	AI_DrawWeapon(other);
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01 " );	// Move away from this weapon. Well wait!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_BDT_1020_Wegelagerer_SecondWarn(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 2;
	condition = DIA_BDT_1020_Wegelagerer_SecondWarn_Condition;
	information = DIA_BDT_1020_Wegelagerer_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_SecondWarn_Condition()
{
	if ((self.aivar[AIV_GuardPass_Status] == GP_FirstWarnGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Help_StrengthCmp(Npc_GetNearestWP(self),self.wp) ==  TRUE ) && (Npc_GetDistToWP(other,BDT_1020_Points_CheckWake); < ( other . aivar [ AIV_LastDistToWP ] -  50 ))) .
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_SecondWarn_06_00 " );	// Do you really want to tempt fate? 
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_SecondWarn);
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_SecondWarn, " Here's your money. " ,DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_SecondWarn, " You won't get anything from me. " ,DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney);
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00 " );	// Here's your money.
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01 " );	// A smart man!
	B_GiveInvItems(other,self,ItMi_Gold,20);
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney()
{
	AI_Output(other,self, " DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00 " );	// I won't give you a penny.
	AI_Output(self,other, " DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01 " );	// Then I'll just have to take them, won't I?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_BDT_1020_Wegelagerer_Attack(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1020_Wegelagerer_Attack_Condition;
	information = DIA_BDT_1020_Wegelagerer_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_Attack_Condition()
{
	if ((self.aivar[AIV_GuardPass_Status] == GP_SecondWarnGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Help_StrengthCmp(Npc_GetNearestWP(self),self.wp) ==  TRUE ) && (Npc_GetDistToWP(other,BDT_1020_Points_CheckWake); < ( other . aivar [ AIV_LastDistToWP ] -  50 ))) .
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
