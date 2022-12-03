

instance DIA_Addon_BenchPirate_EXIT(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_BenchPirate_EXIT_Condition;
	information = DIA_Addon_BenchPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BenchPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BenchPirate_Hello(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_BenchPirate_Hello_Condition;
	information = DIA_Addon_BenchPirate_Hello_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_Hello_Info()
{
	be int randy;
	AI_Output(other,self, " DIA_Addon_Pir_7_Hello_15_00 " );	// How are you?
	randy = Hlp_Random( 3 );
	if(GregIsBack == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_Addon_Pir_7_Hello_07_01 " );	// Greg is finally back. It's about time.
		}
		else if(randy == 1)
		{
			AI_Output(self,other, " DIA_Addon_Pir_7_Hello_07_02 " );	// Now Francis has to cut trees for the stockade. I hope this isn't too much of a blow to him.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Pir_7_Hello_07_03 " );	// Well, let the bandits come. As long as Greg is with us, they are not afraid of us.
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other, " DIA_Addon_Pir_7_Hello_07_04 " );	// Francis, who was left in charge, is just a pathetic clown. Nobody takes him seriously.
	}
	else if(randy == 1)
	{
		AI_Output(self,other, " DIA_Addon_Pir_7_Hello_07_05 " );	// Greg trusts Francis because he's too dumb to fool him. But to make him commander for this ...
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Pir_7_Hello_07_06 " );	// If Greg doesn't come back soon and I don't feel the deck under my feet, I'll have earth sickness!
	};
};


instance DIA_Addon_BenchPirate_Hire (C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_BenchPirate_Hire_Condition;
	information = DIA_Addon_BenchPirate_Hire_Info;
	permanent = FALSE;
	description = " You must help me. " ;
};


func int DIA_Addon_BenchPirate_Hire_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BenchPirate_Hire_Info()
{
	AI_Output(other,self, " DIA_Addon_BenchPirate_Anheuern_15_00 " );	// You have to help me.
	AI_Output(self,other, " DIA_Addon_BenchPirate_Anheuern_07_01 " );	// Greg's order?
	AI_Output(other,self, " DIA_Addon_BenchPirate_Anheuern_15_08 " );	// Exactly.
};


instance DIA_Addon_BenchPirate_ComeOn(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_BenchPirate_ComeOn_Condition;
	information = DIA_Addon_BenchPirate_ComeOn_Info;
	permanent = TRUE;
	description = "The canyon is waiting for us. " ;
};


func int DIA_Addon_BenchPirate_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && (MY_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BenchPirate_Anheuern));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BenchPirate_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_BenchPirate_ComeOn_15_01 " );	// The canyon is waiting for us.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_BenchPirate_ComeOn_07_02 " );	// That's where I'm going back...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BenchPirate_ComeOn_07_01 " );	// Yes, captain!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};


instance DIA_Addon_BenchPirate_GoHome(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_BenchPirate_GoHome_Condition;
	information = DIA_Addon_BenchPirate_GoHome_Info;
	permanent = TRUE;
	description = " I don't need you anymore. " ;
};


func int DIA_Addon_BenchPirate_GoHome_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BenchPirate_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_BenchPirate_GoHome_15_00 " );	// I don't need you anymore.
	AI_Output(self,other, " DIA_Addon_BenchPirate_GoHome_07_01 " );	// Heading back to camp, captain!
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BenchPirate_TooFar(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_BenchPirate_TooFar_Condition;
	information = DIA_Addon_BenchPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BenchPirate_TooFar_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && (C_GregsPiratesTooFar() ==  TRUE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BenchPirate_TooFar_Info()
{
	AI_Output(self,other, " DIA_Addon_BenchPirate_TooFar_07_01 " );	// We're too far from the camp.
	AI_Output(self,other, " DIA_Addon_BenchPirate_GoHome_07_02 " );	// I don't like this.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other, " DIA_Addon_Matt_TooFar_07_02 " );	// I'm going back to camp!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Matt_TooFar_07_03 " );	// The guys and I are going back to the camp!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

