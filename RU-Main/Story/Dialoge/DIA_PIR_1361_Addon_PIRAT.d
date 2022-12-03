

instance DIA_Addon_SawPirate_EXIT(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_SawPirate_EXIT_Condition;
	information = DIA_Addon_SawPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_SawPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_SawPirate_Hello(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_SawPirate_Hello_Condition;
	information = DIA_Addon_SawPirate_Hello_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_SawPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_Hello_Info()
{
	AI_Output(other,self, " DIA_Addon_SawPirate_Hello_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_SawPirate_Hello_09_01 " );	// Don't bother me.
};


instance DIA_Addon_SawPirate_Hire (C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_SawPirate_Hire_Condition;
	information = DIA_Addon_SawPirate_Hire_Info;
	permanent = FALSE;
	description = " Are you one of Henry's men? " ;
};


func int DIA_Addon_SawPirate_Hire_Condition()
{
	if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_SawPirate_Hire_Info()
{
	AI_Output(other,self, " DIA_Addon_Bones_JoinHenry_15_00 " );	// Are you one of Henry's men?
	AI_Output(self,other, " DIA_Addon_SawPirate_Anheuern_09_01 " );	// No. I just love cutting trees.
	AI_Output(self,other, " DIA_Addon_SawPirate_Anheuern_09_02 " );	// What is it? Did Henry give you a task?
	AI_Output(other,self, " DIA_Addon_Bones_JoinHenry_15_04 " );	// Yes. I have to kill some bandits.
	AI_Output(self,other, " DIA_Addon_SawPirate_Anheuern_09_03 " );	// No. No-no! Do not look at me so! I don't want to go there.
	AI_Output(self,other, " DIA_Addon_SawPirate_Anheuern_09_04 " );	// I need to saw, can you hear me?
};


var int SawPirate_ComeOn_Once;

instance DIA_Addon_SawPirate_ComeOn(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_SawPirate_ComeOn_Condition;
	information = DIA_Addon_SawPirate_ComeOn_Info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int DIA_Addon_SawPirate_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && (MIS_Henry_FreeBDTTower == LOG_Running) && (C_TowerBanditsDead() ==  FALSE ) && Npc_KnowsInfo(other,DIA_Addon_SawPirate_Anheuern));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_SawPirate_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_SawPirate_ComeOn_15_00 " );	// Come with me.
	if (HammerPirate.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		AI_Output(self,other, " DIA_Addon_SawPirate_ComeOn_09_01 " );	// Why do you need me? You already have people...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other, " DIA_Addon_SawPirate_ComeOn_09_04 " );	// Let's get closer to the camp first.
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(HammerPirate) && (SawPirate_ComeOn_Once == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_SawPirate_ComeOn_09_02 " );	// (grunts) He could call someone else...
		SawPirate_ComeOn_Once = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_03");	//Есть!..
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};


instance DIA_Addon_SawPirate_GoHome(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_SawPirate_GoHome_Condition;
	information = DIA_Addon_SawPirate_GoHome_Info;
	permanent = TRUE;
	description = " I don't need you anymore. " ;
};


func int DIA_Addon_SawPirate_GoHome_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_SawPirate_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_SawPirate_GoHome_15_00 " );	// I don't need you anymore.
	AI_Output(self,other, " DIA_Addon_SawPirate_GoHome_09_01 " );	// In that case, I'll get back to my work.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_SawPirate_TooFar(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_SawPirate_TooFar_Condition;
	information = DIA_Addon_SawPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_SawPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_SawPirate_TooFar_Info()
{
	AI_Output(self,other, " DIA_Addon_SawPirate_TooFar_09_01 " );	// We're too far from the camp.
	AI_Output(self,other, " DIA_Addon_SawPirate_GoHome_09_02 " );	// I don't like this. I'm coming back.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_SawPirate_Success(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_SawPirate_Success_Condition;
	information = DIA_Addon_SawPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_SawPirate_Success_Condition()
{
	if((C_TowerBanditsDead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_SawPirate_Success_Info()
{
	AI_Output(self,other, " DIA_Addon_SawPirate_Success_09_01 " );	// You know what? On reflection, I decided that you are just a bastard!
	AI_Output(self,other, " DIA_Addon_SawPirate_Success_09_02 " );	// I'm going back to camp and I hope I never see you again!
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

