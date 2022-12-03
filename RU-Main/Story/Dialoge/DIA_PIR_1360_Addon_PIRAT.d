

instance DIA_Addon_HammerPirate_EXIT(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_HammerPirate_EXIT_Condition;
	information = DIA_Addon_HammerPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_HammerPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Hello(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_HammerPirate_Hello_Condition;
	information = DIA_Addon_HammerPirate_Hello_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_Hello_Info()
{
	AI_Output(other,self, " DIA_Addon_HammerPirate_Hello_15_00 " );	// Is everything okay?
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		if(C_TowerBanditsDead() == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_HammerPirate_Hello_07_01 " );	// Of course. We dealt with these bastards.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_HammerPirate_Hello_07_02 " );	// Let's finish them off!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_HammerPirate_Hello_07_03 " );	// No! This is not for me.
	};
};


instance DIA_Addon_HammerPirate_Hire (C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_HammerPirate_Hire_Condition;
	information = DIA_Addon_HammerPirate_Hire_Info;
	permanent = FALSE;
	description = " You must help me. " ;
};


func int DIA_Addon_HammerPirate_Hire_Condition()
{
	if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_HammerPirate_Hire_Info()
{
	AI_Output(self,other, " DIA_Addon_HammerPirate_Anheuern_07_00 " );	// Don't tell me you want me to come with you and help you deal with the bandits!
	AI_Output(other,self,"DIA_Addon_PIR_6_JoinHenry_15_08");	//Точно.
	if ( ! Npc_IsDead(SawPirate))
	{
		AI_Output(self,other, " DIA_Addon_HammerPirate_Anheuern_07_01 " );	// Why don't you take the guy who cuts wood?
	};
	AI_Output(self,other, " DIA_Addon_HammerPirate_Anheuern_07_02 " );	// This is not a job for me...
};


instance DIA_Addon_HammerPirate_ComeOn(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_HammerPirate_ComeOn_Condition;
	information = DIA_Addon_HammerPirate_ComeOn_Info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int DIA_Addon_HammerPirate_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBERS ] ==  FALSE ) && (MIS_Henry_FreeBDTTower == LOG_Running) && (C_TowerBanditsDead() ==  FALSE ) && Npc_KnowsInfo(other,DIA_Addon_HammerPirate_Anheuern));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_HammerPirate_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_HammerPirate_ComeOn_15_00 " );	// Come with me.
	if (SawPirate.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		AI_Output(self,other, " DIA_Addon_HammerPirate_ComeOn_07_01 " );	// One of us should stay here...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other, " DIA_Addon_HammerPirate_ComeOn_07_02 " );	// Let's get closer to the camp first.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_03");	//Есть!..
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};


instance DIA_Addon_HammerPirate_GoHome(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_HammerPirate_GoHome_Condition;
	information = DIA_Addon_HammerPirate_GoHome_Info;
	permanent = TRUE;
	description = " I don't need you anymore. " ;
};


func int DIA_Addon_HammerPirate_GoHome_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_HammerPirate_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_HammerPirate_GoHome_15_00 " );	// I don't need you anymore.
	AI_Output(self,other, " DIA_Addon_HammerPirate_GoHome_07_01 " );	// How do you say...
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_HammerPirate_TooFar(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_HammerPirate_TooFar_Condition;
	information = DIA_Addon_HammerPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_HammerPirate_TooFar_Info()
{
	AI_Output(self,other, " DIA_Addon_HammerPirate_TooFar_07_01 " );	// If you go further, then I will not help you...
	AI_Output(self,other, " DIA_Addon_HammerPirate_GoHome_07_02 " );	// I think I'll go back.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Success(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_HammerPirate_Success_Condition;
	information = DIA_Addon_HammerPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_Success_Condition()
{
	if((C_TowerBanditsDead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_HammerPirate_Success_Info()
{
	AI_Output(self,other, " DIA_Addon_HammerPirate_Success_07_01 " );	// You know what? I was just thinking... well, maybe you're not such a bad guy after all.
	AI_Output(self,other, " DIA_Addon_HammerPirate_Success_07_02 " );	// Okay, I'm going back to camp. See you!
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

