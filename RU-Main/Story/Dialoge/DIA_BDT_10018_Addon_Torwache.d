
instance DIA_Addon_BDT_10018_Torwache_EXIT(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 999;
	condition = DIA_Addon_BDT_10018_Torwache_EXIT_Condition;
	information = DIA_Addon_BDT_10018_Torwache_EXIT_Info;
	permanent = TRUE;
	description = " We'll talk more. " ;
};

func int DIA_Addon_BDT_10018_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BDT_10018_Torwache_EXIT_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10018_Torwache_EXIT_15_00 " );	// We'll talk later.

	if (BDT_100018_Once ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_EXIT_04_01 " );	// You know what I'll tell you...
		BDT_100018_Once = TRUE ;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02");	//Back off.
	};

	AI_StopProcessInfos(self);
};


const string BDT_10018_Checkpoint = "BL_RAVEN_03";

instance DIA_Addon_BDT_10018_Torwache_FirstWarn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 1;
	condition = DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition;
	information = DIA_Addon_BDT_10018_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] ==  GP_NONE ) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BDT_10018_Torwache_FirstWarn_Info()
{
	if(BDT_100018_Tells == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00 " );	// Hey, slow down! You won't get in there, so back off!
		AI_Output(other,self, " DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01 " );	// Get out of the way - I need to talk to Raven.
		AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02 " );	// Nobody may enter here. Direct order from the Raven!
		BDT_100018_Tells = TRUE;
		Log_CreateTopic(Topic_Addon_Tempel,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Tempel,LOG_Running);
		B_LogEntry(Topic_Addon_Tempel, " The gate guard won't let me into the temple. I have to find a way to get in. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03 " );	// You again? You're starting to piss me off!
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Addon_BDT_10018_Torwache_SecondWarn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition;
	information = DIA_Addon_BDT_10018_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_GuardPass_Status] == GP_FirstWarnGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Npc_GetDistToWP(other,BDT_10018_Checkpoint) < (other.aivar[AIV_LastDistToWP] -  50 ))) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BDT_10018_Torwache_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00 " );	// The next step will be your last!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10018_Torwache_Attack(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 3;
	condition = DIA_Addon_BDT_10018_Torwache_Attack_Condition;
	information = DIA_Addon_BDT_10018_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BDT_10018_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_GuardPass_Status] == GP_SecondWarnGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Npc_GetDistToWP(other,BDT_10018_Checkpoint) < (other.aivar[AIV_LastDistToWP] -  50 ))) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BDT_10018_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00");	//For the Raven!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Addon_BDT_10018_Torwache_Hi(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_10018_Torwache_Hi_Condition;
	information = DIA_Addon_10018_Torwache_Hi_Info;
	permanent = FALSE;
	description = " This is damn important, I have to get to him. " ;
};


func int DIA_Addon_10018_Torwache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10018_Torwache_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10018_Torwache_Hi_15_00 " );	// This is damn important, I have to get to him.
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_Hi_04_01 " );	// No. It doesn't matter. Only Bloodwyn may enter.
	B_LogEntry(Topic_Addon_Tempel, " Only Bloodwyn is allowed to enter the temple. Maybe I can get in through him. " );
};


instance DIA_Addon_BDT_10018_Torwache_Bloodwyn(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 2;
	condition = DIA_Addon_10018_Torwache_Bloodwyn_Condition;
	information = DIA_Addon_10018_Torwache_Bloodwyn_Info;
	permanent = FALSE;
	description = " Bloodwyn? Isn't he dead? " ;
};


func int DIA_Addon_10018_Torwache_Bloodwyn_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_BDT_10018_Torwache_Hi ) &&  ! Npc_IsDead ( Bloodwyn ) ) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_10018_Torwache_Bloodwyn_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00 " );	// Bloodwyn? Isn't he dead?
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01 " );	// He's stronger than ever. And if he finds out that someone is causing problems, he will end you.
};


instance DIA_Addon_BDT_10018_Torwache_Bribe(C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 9;
	condition = DIA_Addon_10018_Torwache_Bribe_Condition;
	information = DIA_Addon_10018_Torwache_Bribe_Info;
	permanent = FALSE;
	description = " I'll give you a thousand gold if you let me in. " ;
};


func int DIA_Addon_10018_Torwache_Bribe_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_BDT_10018_Torwache_Hi ) &&  ! Npc_IsDead ( Bloodwyn ) ) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_10018_Torwache_Bribe_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10018_Torwache_Bribe_15_00 " );	// I'll give you a thousand gold if you let me in.
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_Bribe_04_01 " );	// You're wasting your time, mate.
};


instance DIA_Addon_BDT_10018_Towache_Drin (C_Info);
{
	npc = BDT_10018_Addon_Torwache;
	nr = 90;
	condition = DIA_Addon_10018_Torwache_Drin_Condition;
	information = DIA_Addon_10018_Torwache_Drin_Info;
	permanent = FALSE;
	description = " Bloodwyn is in there? Call him then. " ;
};


func int DIA_Addon_10018_Torwache_Drin_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_BDT_10018_Torwache_Hi ) &&  ! Npc_IsDead ( Bloodwyn ) ) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_10018_Torwache_Drin_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10018_Torwache_Drin_15_00 " );	// Is Bloodwyn in there? Then call him.
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_Drin_04_01 " );	// Ha! Do you really think that I'll do it?
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_Drin_04_02 " );	// Maybe you're an important person in the camp now, but your power ends RIGHT HERE. Understand?
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_Drin_04_03 " );	// So go work in the mine or do something else - but don't block the passage here!
	MIS_BloodwynRaus = LOG_Running;
	B_LogEntry(Topic_Addon_Tempel, " Bloodwyn is in the temple. But that doesn't do me any good. Maybe I should visit the mine. " );
};


instance DIA_Addon_BDT_10018_Torwache_kopf (C_Info)
{
	npc = BDT_10018_Addon_Torwache;
	nr = 90;
	condition = DIA_Addon_10018_Torwache_kopf_Condition;
	information = DIA_Addon_10018_Torwache_kopf_Info;
	permanent = FALSE;
	description = " (show Bladwin's head) " ;
};

func int DIA_Addon_10018_Torwache_kopf_Condition()
{
	if(Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf) >= 1)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_10018_Torwache_kopf_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10018_Torwache_kopf_15_00 " );	// Check this out. Do you still want to stop me?!
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_kopf_04_01 " );	// What is this? Is that Bloodwyn?... Is that... his...
	AI_Output(self,other, " DIA_Addon_BDT_10018_Torwache_kopf_04_02 " );	// N-no! I mean...yeah, of course, come on in.
	MIS_BloodwynRaus = LOG_SUCCESS;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	self.aivar[ 93 ] = FALSE ;
	AI_StopProcessInfos(self);
	Wld_SendTrigger("EVT_ADDON_TEMPLEINDOOR");
};
