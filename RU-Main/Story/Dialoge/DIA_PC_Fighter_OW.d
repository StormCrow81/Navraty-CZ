

instance DIA_GornOW_EXIT(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 999;
	condition = DIA_GornOW_EXIT_Condition;
	information = DIA_GornOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornOW_Hello(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 2;
	condition = DIA_GornOW_Hello_Condition;
	information = DIA_GornOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_GornOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_GornOW_Hello_Info()
{
	was C_Npc The spleen;
	Milten = Hlp_GetNpc(PC_Mage_OW);
	AI_Output(other,self, " DIA_GornOW_Hello_15_00 " );	// Stop messing around here - you're free!
	AI_Output(self,other, " DIA_GornOW_Hello_12_01 " );	// Yeah! It was high time to get me out of here.
	AI_Output(self,other, " DIA_GornOW_Hello_12_02 " );	// But I didn't expect it to be you, though. I'm damn glad to see you.
	AI_Output(other,self, " DIA_GornOW_Hello_15_03 " );	// Garond says you're eating too much and he can't afford to feed you anymore.
	AI_Output(self,other, " DIA_GornOW_Hello_12_04 " );	// Since you mentioned it, I wouldn't mind a couple of beers. But you have to get out of here. I'm already tired of this camera.
	AI_Output(other,self, " DIA_GornOW_Hello_15_05 " );	// Okay, see you at Milten's.
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//Конечно.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	B_StartOtherRoutine(Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP(XP_RescueGorn);
};


instance DIA_GornOW_MetMilten(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 2;
	condition = DIA_GornOW_MetMilten_Condition;
	information = DIA_GornOW_MetMilten_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_GornOW_MetMilten_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_MetMilten_Info()
{
	AI_Output(self,other, " DIA_GornOW_MetMilten_12_00 " );	// Look, I'm getting pretty bored here. I think we need to get out of this valley.
	AI_Output(self,other, " DIA_GornOW_MetMilten_12_01 " );	// How did you get through the passage?
	AI_Output(other,self, " DIA_GornOW_MetMilten_15_02 " );	// There's a path through the abandoned mine.
	AI_Output(self,other, " DIA_GornOW_MetMilten_12_03 " );	// Good. I'll wait for the right moment and get out of here.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self, " DIA_GornOW_MetMilten_15_04 " );	// Where are you going?
		AI_Output(self,other, " DIA_GornOW_MetMilten_12_05 " );	// I heard Lee is still alive. I want to join him again.
	}
	else
	{
		AI_Output(other,self, " DIA_GornOW_MetMilten_15_06 " );	// Then go to Onar's farm. Lee and his guys are there now. He always wants guys like you.
		AI_Output(self,other, " DIA_GornOW_MetMilten_12_07 " );	// I'll do that. I'll go and see how they are.
	};
};


instance DIA_GornOW_SeeYou(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 900;
	condition = DIA_GornOW_SeeYou_Condition;
	information = DIA_GornOW_Seeyou_Info;
	permanent = TRUE;
	description = " See you later. " ;
};


func int DIA_GornOW_SeeYou_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_GornOW_WithMilten ) && ( Capital ==  2 )) .
	{
		return TRUE;
	};
};

func void DIA_GornOW_Seeyou_Info()
{
	AI_Output(other,self, " DIA_GornOW_SeeYou_15_00 " );	// See you later.
	AI_Output(self,other, " DIA_GornOW_SeeYou_12_01 " );	// That's right.
	AI_StopProcessInfos(self);
};

