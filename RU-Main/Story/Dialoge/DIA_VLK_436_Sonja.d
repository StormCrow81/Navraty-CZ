

instance DIA_Sonja_EXIT(C_Info)
{
	npc = VLK_436_Sonja;
	nr = 999;
	condition = DIA_Sonja_EXIT_Condition;
	information = DIA_Sonja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sonja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sonja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sonja_PICKPOCKET(C_Info)
{
	npc = VLK_436_Sonja;
	nr = 900;
	condition = DIA_Sonja_PICKPOCKET_Condition;
	information = DIA_Sonja_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sonja_PICKPOCKET_Condition()
{
	return  C_Robbery ( 58 , 70 );
};

func void DIA_Sonja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
	Info_AddChoice(DIA_Sonja_PICKPOCKET,Dialog_Back,DIA_Sonja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sonja_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sonja_PICKPOCKET_DoIt);
};

func void DIA_Sonja_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
};

func void DIA_Sonja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
};

instance DIA_Sonja_STANDARD(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_STANDARD_Condition;
	information = DIA_Sonja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Sonja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Andre_REDLIGHT != LOG_Running) && (SonyaGoWithMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_STANDARD_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Sonja_STANDARD_16_00 " );	// If you want some fun, talk to Bromor.
	}
	else if((other.guild == GIL_DJG) && (Sonja_Says == FALSE))
	{
		AI_Output(self,other, " DIA_Sonja_STANDARD_16_01 " );	// Guys like you have one problem - you're more interested in orcs than we are.
		Sonja_Says = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Sonja_STANDARD_16_02 " );	// If you want to talk, go find yourself a woman and marry her.
	};

	AI_StopProcessInfos(self);
};

instances of DIA_Sonja_GoToSkip (C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_GoToSkip_Condition;
	information = DIA_Sonja_GoToSkip_Info;
	permanent = FALSE;
	description = " Come with me. " ;
};

func int DIA_Sonja_GoToSkip_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaGoWithMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_GoToSkip_Info()
{
	AI_Output(other,self, " DIA_Sonja_GoToSkip_01_01 " );	// Come with me.
	AI_Output(self,other, " DIA_Sonja_GoToSkip_01_02 " );	// Good! As you say...
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowPlayer");
};

instance DIA_Sonja_ArriveSkip(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_ArriveSkip_Condition;
	information = DIA_Sonja_ArriveSkip_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sonja_ArriveSkip_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SkipGetWoman == TRUE) && (SonyaJobDone == FALSE) && (Npc_GetDistToWP(self,"NW_CITY_PIRATESCAMP_04") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Sonja_ArriveSkip_Info()
{
	AI_Output(self,other, " DIA_Sonja_ArriveSkip_01_01 " );	// Is this my client?!
	AI_Output(other,self, " DIA_Sonja_ArriveSkip_01_02 " );	// Well, yes, as you can see.
	AI_Output(self,other, " DIA_Sonja_ArriveSkip_01_03 " );	// Hmmm...(surprised) But he's a pirate!
	AI_Output(other,self, " DIA_Sonja_ArriveSkip_01_04 " );	// Have you never served pirates?
	AI_Output(self,other, " DIA_Sonja_ArriveSkip_01_05 " );	// Well, why... (smiling) I had to, of course.
	AI_Output(other,self, " DIA_Sonja_ArriveSkip_01_06 " );	// Better get busy then! And then he has a red face. See how he got screwed up?
	AI_Output(other,self, " DIA_Sonja_ArriveSkip_01_07 " );	// We need to heal the person! Help to relax, so to speak, blow off steam.
	AI_Output(self,other, " DIA_Sonja_ArriveSkip_01_08 " );	// Don't worry! I will do my best.
	AI_Output(self,other, " DIA_Sonja_ArriveSkip_01_09 " );	// Just don't forget to pick me up later. Good?
	AI_Output(other,self, " DIA_Sonja_ArriveSkip_01_10 " );	// Of course.
	AI_Output(self,other, " DIA_Sonja_ArriveSkip_01_11 " );	// Well, then I went. (to Skip)...hey handsome!
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	SonyaJob = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DanceSkip");
};

instance DIA_Sonja_DoBlowJob(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_DoBlowJob_Condition;
	information = DIA_Sonja_DoBlowJob_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Sonja_DoBlowJob_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_WomanForSkip == LOG_Running) && (SonyaJob == TRUE) && (SonyaJobDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_DoBlowJob_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_Sonja_DoBlowJobDone(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_DoBlowJobDone_Condition;
	information = DIA_Sonja_DoBlowJobDone_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Sonja_DoBlowJobDone_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaJobDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_DoBlowJobDone_Info()
{
	AI_Output(self,other, " DIA_Sonja_DoBlowJobDone_01_01 " );	// I think it's time for me to head back to Bromor.
	AI_Output(self,other, " DIA_Sonja_DoBlowJobDone_01_02 " );	// Will you take me to him?
	AI_Output(other,self, " DIA_Sonja_DoBlowJobDone_01_03 " );	// Good! Let's go to.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowPlayerBack");
};


instance DIA_Sonja_ArriveBromor(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_ArriveBromor_Condition;
	information = DIA_Sonja_ArriveBromor_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sonja_ArriveBromor_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaJobDone == TRUE) && (Npc_GetDistToWP(self,"NW_PUFF_DANCE") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Sonja_ArriveBromor_Info()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	AI_Output(self,other, " DIA_Sonja_ArriveBromor_01_01 " );	// Good! We are in place.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;

	if(SonyaGoWithMeDay >= (daynow - 3))
	{
		SonyaBackOk = TRUE;
	}
	else
	{
		SonyaBackOkNot = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};
