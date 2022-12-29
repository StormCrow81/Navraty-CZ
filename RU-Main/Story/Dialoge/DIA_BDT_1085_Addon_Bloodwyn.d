
instance DIA_Addon_Bloodwyn_EXIT(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 999;
	condition = DIA_Addon_Bloodwyn_EXIT_Condition;
	information = DIA_Addon_Bloodwyn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bloodwyn_PICKPOCKET(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 900;
	condition = DIA_Addon_Bloodwyn_PICKPOCKET_Condition;
	information = DIA_Addon_Bloodwyn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Bloodwyn_PICKPOCKET_Condition()
{
	return  C_Robbery ( 90 , 250 );
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET,Dialog_Back,DIA_Addon_Bloodwyn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bloodwyn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};


instance DIA_Addon_Bloodwyn_Dead(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Dead_Condition;
	information = DIA_Addon_Bloodwyn_Dead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Dead_Condition()
{
	if(Npc_GetDistToWP(self,"BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bloodwyn_Dead_Info()
{
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Dead_04_00 " );	// Hey, how did you get here?
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Dead_15_01 " );	// with my feet?
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Dead_04_02 " );	// Funny... I HATE jokes.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Choices_1()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, " I thought I killed you. " ,DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, " Everything comes to an end. " ,DIA_Addon_Bloodwyn_Wait_BAD1);
};

func void Bloodwyn_Choices_2()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, " Who do you think destroyed the Barrier? " ,DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, " You and many others too... " ,DIA_Addon_Bloodwyn_Wait_BAD2);
};

func void Bloodwyn_Choices_3()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, " Apparently he didn't have time to figure it out... " ,DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, " Yes, that was his biggest mistake... " ,DIA_Addon_Bloodwyn_Wait_BAD3);
};


instance DIA_Addon_Bloodwyn_Wait(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Wait_Condition;
	information = DIA_Addon_Bloodwyn_Wait_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Wait_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Minecrawler_Killed >= 9))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bloodwyn_Wait_Info()
{
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Wait_04_00 " );	// Did you kill the crawlers? Excellent. Now piss off.
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_15_01 " );	// Wait a minute...
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Wait_04_02 " );	// Are you still here?
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_15_03 " );	// I need information.
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Я ищу Ворона.",DIA_Addon_Bloodwyn_Wait_Raven);
};

func void DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_15_00 " );	// I'm looking for Raven.
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Wait_Raven_04_01 " );	// Why do you think Raven would want to talk to you... wait... YOU?
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Wait_Raven_04_02 " );	// You're the guy we've been looking for all this time. What are you doing here?! You're supposed to be dead!
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_15_03 " );	// Everyone knows that.
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Wait_Raven_04_04 " );	// I'll just have to kill you myself!
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_15_05 " );	// I'm not interested in you, I'm looking for Raven.
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Wait_Raven_04_06 " );	// I'll kill you, I haven't lost a fight yet!
	Bloodwyn_Choices_1();
};

func void DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00 " );	// Stop talking then. Fight.
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01 " );	// It's too late anyway! The raven is already opening the temple! Ha ha ha! Die, motherfucker!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Lach()
{
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Lach_04_00 " );	// HA-HA-HA - Now you die for real!
};

func void Bloodwyn_Wut()
{
	AI_Output(self,other, " DIA_Addon_Bloodwyn_Wut_04_00 " );	// A-AH! You pitiful bastard!
	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - 5;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
};

func void Bloodwyn_Next_1()
{
	AI_Output(self,other, " DIA_Addon_Bloodwyn_SayChoice_2_04_00 " );	// And I survived the fall of the Barrier without getting a scratch!
};

func void Bloodwyn_Next_2()
{
	AI_Output(self,other, " DIA_Addon_Bloodwyn_SayChoice_3_04_00 " );	// You can't beat me, I'm Raven's most trusted lieutenant!
};

func void DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00 " );	// I thought I killed you.
	Bloodwyn_Wut();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00 " );	// Everything ends eventually.
	Bloodwyn_Lach();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00 " );	// Who do you think destroyed the Barrier?
	Bloodwyn_Wut();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00 " );	// You and many others too...
	Bloodwyn_Lach();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD3()
{
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00 " );	// Apparently he didn't have time to figure it out...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

func void DIA_Addon_Bloodwyn_Wait_BAD3()
{
	AI_Output(other,self, " DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00 " );	// Yes, that was his biggest mistake...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

