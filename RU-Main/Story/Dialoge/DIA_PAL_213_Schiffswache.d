

instance DIA_Pal_213_Schiffswache_EXIT(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 999;
	condition = DIA_Pal_213_Schiffswache_EXIT_Condition;
	information = DIA_Pal_213_Schiffswache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pal_213_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Pal_213_Checkpoint = "SHIP_DECK_09";

instance DIA_Pal_213_Schiffswache_FirstWarn(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 1;
	condition = DIA_Pal_213_Schiffswache_FirstWarn_Condition;
	information = DIA_Pal_213_Schiffswache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_FirstWarn_Condition()
{
	if ((MIS_ShipIsFree ==  FALSE ) && (self.aivar[AIV_GuardPassage_Status] ==  GP_NONE ) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) ==  TRUE ) );
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_FirstWarn_Info()
{
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_FirstWarn_01_00 " );	// Stop! Where are you going?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//Я хотел...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Pal_213_Schiffswache_FirstWarn_01_02 " );	// Sorry. But you can't come here.
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_213_Schiffswache_FirstWarn_01_03 " );	// Nothing to see here. Go your way.
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Pal_213_Schiffswache_SecondWarn(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 2;
	condition = DIA_Pal_213_Schiffswache_SecondWarn_Condition;
	information = DIA_Pal_213_Schiffswache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_SecondWarn_Condition()
{
	if ((MIS_ShipIsFree ==  FALSE ) && (self.aivar[AIV_GuardPassage_Status] == GP_FirstWarningGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) ==  TRUE ) && ; ( Npc_GetDistToWP ( other , Pal_213_Checkpoint ) < ( other . aivar [ AIV_LastDistToWP ] --  50 ))) .
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_SecondWarn_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Pal_213_Schiffswache_SecondWarn_01_00 " );	// Not one step further. There are no exceptions for anyone.
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_213_Schiffswache_SecondWarn_01_01 " );	// You don't want to FORCE me to hit you, do you?
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Pal_213_Schiffswache_Attack(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 3;
	condition = DIA_Pal_213_Schiffswache_Attack_Condition;
	information = DIA_Pal_213_Schiffswache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_Attack_Condition()
{
	if ((MIS_ShipIsFree ==  FALSE ) && (self.aivar[AIV_GuardPassage_Status] == GP_SecondWarnGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) ==  TRUE ) && ; ( Npc_GetDistToWP ( other , Pal_213_Checkpoint ) < ( other . aivar [ AIV_LastDistToWP ] -  50 ))) ;
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Pal_213_Schiffswache_GoOnBoard(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 5;
	condition = DIA_Pal_213_Schiffswache_GoOnBoard_Condition;
	information = DIA_Pal_213_Schiffswache_GoOnBoard_Info;
	permanent = FALSE;
	description = " I want to get on board the ship. " ;
};


func int DIA_Pal_213_Schiffswache_GoOnBoard_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_GoOnBoard_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_GoOnBoard_15_00 " );	// I want to get on board the ship.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_GoOnBoard_01_01 " );	// No one is allowed on the ship! I have an order!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_GoOnBoard_01_02 " );	// I must kill anyone who enters the ship without permission.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_GoOnBoard_01_03 " );	// In the name of Innos, I will protect this ship even at the cost of my life.
};


instance DIA_Pal_213_Schiffswache_IAmKDF(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF_Info;
	permanent = FALSE;
	description = " Do you doubt the Fire Mage's intentions? " ;
};


func int DIA_Pal_213_Schiffswache_IAmKDF_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDF_15_00 " );	// Do you doubt the Fire Mage's intentions?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF_01_01 " );	// No, of course not... (hesitantly) Forgive me Innos!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF_01_02 " );	// Mages of Fire - guardians of the wisdom of Innos!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF_01_03 " );	// He who doubts them doubts Innos and deserves no mercy.
};


instance DIA_Pal_213_Schiffswache_IAmKDF2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF2_Info;
	permanent = FALSE;
	description = " What happens if I go on board? " ;
};


func int DIA_Pal_213_Schiffswache_IAmKDF2_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF2_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDF2_15_00 " );	// What happens if I get on board?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF2_01_01 " );	// I have to kill... (nervously) I mean, stop you.
};


instance DIA_Pal_213_Schiffswache_IAmKDF3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF3_Info;
	permanent = FALSE;
	description = " Do you dare to attack the Fire Mage? " ;
};


func int DIA_Pal_213_Schiffswache_IAmKDF3_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF2))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF3_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDF3_15_00 " );	// Do you dare to attack a Fire Mage?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF3_01_01 " );	// I will never raise my hand against a mage.
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDF3_15_02 " );	// So what are you going to do if I come on board?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF3_01_03 " );	// Nothing, sir... (timidly)
};


instance DIA_Pal_213_Schiffswache_IAmKDF4(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF4_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF4_Info;
	permanent = FALSE;
	description = " Then I'll come aboard now. " ;
};


func int DIA_Pal_213_Schiffswache_IAmKDF4_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF3))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF4_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDF4_15_00 " );	// Then I'll go aboard now.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF4_01_01 " );	// You mustn't do this, Lord Hagen's orders were quite specific.
};


instance DIA_Pal_213_Schiffswache_IAmKDF5 (C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF5_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF5_Info;
	permanent = FALSE;
	description = " Do Lord Hagen's orders apply to me too? " ;
};


func int DIA_Pal_213_Schiffswache_IAmKDF5_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF4))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF5_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDF5_15_00 " );	// Do Lord Hagen's orders apply to me too?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF5_01_01 " );	// I don't know.
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDF5_15_02 " );	// Think for yourself - would Lord Hagen dare to suspect a magician of theft?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF5_01_03 " );	// I don't believe it.
};


instance DIA_Pal_213_Schiffswache_IAmKDF6(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF6_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF6_Info;
	permanent = FALSE;
	description = " Then let me board the ship! " ;
};


func int DIA_Pal_213_Schiffswache_IAmKDF6_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF5))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF6_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDF6_15_00 " );	// Then let me board the ship!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDF6_01_01 " );	// Good! You can go to the ship.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw_condition;
	information = dia_pal_213_schiffswache_iamkdw_info;
	permanent = FALSE;
	description = " Will you raise your sword against the Water Mage? " ;
};


func int dia_pal_213_schiffswache_iamkdw_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw_info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDW_15_00 " );	// Will you raise your sword against the Water Mage?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDW_01_01 " );	// No, of course not! (nervously) Adanos forgive me!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDW_01_02 " );	// Killing a servant of Water is a terrible crime... (nervously) Whoever did this deserves only death!
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw2_condition;
	information = dia_pal_213_schiffswache_iamkdw2_info;
	permanent = FALSE;
	description = " What happens if I go on board? " ;
};


func int dia_pal_213_schiffswache_iamkdw2_condition()
{
	if ((hero.guild ==  GIL_KDW ) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw2_info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDW2_15_00 " );	// What happens if I get on board?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDW2_01_01 " );	// I'll kill you... (nervously) I mean stop you.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw3_condition;
	information = dia_pal_213_schiffswache_iamkdw3_info;
	permanent = FALSE;
	description = " And if I ascend, will you take this sin upon yourself? " ;
};


func int dia_pal_213_schiffswache_iamkdw3_condition()
{
	if ((hero.guild ==  GIL_KDW ) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw3_info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDW3_15_00 " );	// And if I ascend, will you take this sin upon yourself?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDW3_01_01 " );	// I would never raise a hand against a mage.
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDW3_15_02 " );	// Well, so what will you do if I come on board?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDW3_01_03 " );	// (quietly) Nothing.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW4(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw4_condition;
	information = dia_pal_213_schiffswache_iamkdw4_info;
	permanent = FALSE;
	description = " Then I'll come on board. " ;
};


func int dia_pal_213_schiffswache_iamkdw4_condition()
{
	if ((hero.guild ==  GIL_KDW ) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw3))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw4_info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDW4_15_00 " );	// Then I'll get on board.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDW4_01_01 " );	// Okay...(doomed) But please, don't tell anyone about this!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDM(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdm_condition;
	information = dia_pal_213_schiffswache_iamkdm_info;
	permanent = FALSE;
	description = " Paladin, do you know who I serve? " ;
};


func int dia_pal_213_schiffswache_iamkdm_condition()
{
	if((hero.guild == GIL_KDM) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdm_info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_15_00 " );	// Paladin, do you know who I serve?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDM_01_01 " );	// Yes, I guess. You are a necromancer, am I right? Beliar's henchman! (with contempt)
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_02 " );	// And what do you think he will do if you dare to raise your sword against his servant?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDM_01_03 " );	// What, try to kill me? (laughs)
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDM_01_04 " );	// I'm not afraid of him, necromancer! I am ready to lay down my life for the glory of Innos for his great purpose!
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_05 " );	// Are you ready to bring your soul to his glory?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_06");	//Что?!
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_07 " );	// I'm asking if you're willing to sacrifice your soul for this cause?
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_08 " );	// You, fool, thought that my god would decide to take your life from you. Trust me, he doesn't need it!
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_09 " );	// Do you know what he'll do? He will curse you, paladin!
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_10 " );	// And you, after your death, will become his servant. And your soul will never rest!
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_11 " );	// Or have you never heard of converted paladins? Why do you think they all began to serve Beliar after their death?
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_12 " );	// Yes, because the one who encroaches on the life of a servant of the Dark God, without a good reason - by his will, he himself will become the same!
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_13 " );	// And even your pathetic god can't help you!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDM_01_14 " );	// No...(nervously) Not that!
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_15 " );	// Then just let me on the ship, and we'll consider the incident over.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmKDM_01_16 " );	// (through gritted teeth) Okay, you can get through.
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmKDM_01_17 " );	// Thank you, you're very kind.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_Pal_213_Schiffswache_IAmPAL(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL_Info;
	permanent = FALSE;
	description = " You don't trust me, knight? " ;
};


func int DIA_Pal_213_Schiffswache_IAmPAL_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmPAL_15_00 " );	// You don't trust me, knight?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmPAL_01_01 " );	// No way, I'm just following orders.
};


instance DIA_Pal_213_Schiffswache_IAmPAL2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL2_Info;
	permanent = FALSE;
	description = " Then you should know which of us is higher in rank. " ;
};


func int DIA_Pal_213_Schiffswache_IAmPAL2_Condition()
{
	if (( hero . guild ==  GIL_PAL ) && Npc_KnowsInfo ( other , DIA_Pal_213_Schiffswache_IAmPAL ) )
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL2_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmPAL2_15_00 " );	// Then you should know which of us is higher in rank.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmPAL2_01_01 " );	// That's right!
};


instance DIA_Pal_213_Schiffswache_IAmPAL3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL3_Info;
	permanent = FALSE;
	description = " I order you to let me on this ship. " ;
};


func int DIA_Pal_213_Schiffswache_IAmPAL3_Condition()
{
	if (( hero . guild ==  GIL_PAL ) && Npc_KnowsInfo ( other , DIA_Pal_213_Schiffswache_IAmPAL2 ))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL3_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmPAL3_15_00 " );	// And I order you to let me on this ship.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmPAL3_01_01 " );	// Yes, sir, you can board the ship.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_Pal_213_Schiffswache_IAmDJG (C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG_Info;
	permanent = FALSE;
	description = " Can't this question be solved somehow? " ;
};


func int DIA_Pal_213_Schiffswache_IAmDJG_Condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmDJG_15_00 " );	// Can't this question be solved somehow?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmDJG_01_01 " );	// I don't understand.
};


instance DIA_Pal_213_Schiffswache_IAmDJG2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG2_Info;
	permanent = FALSE;
	description = " I can give you money. " ;
};


func int DIA_Pal_213_Schiffswache_IAmDJG2_Condition()
{
	if (( hero . guild ==  GIL_DJG ) && Npc_KnowsInfo ( other , DIA_Pal_213_Schiffswache_IAmDJG ) && ( MIS_ShipIsFree ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG2_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmDJG2_15_00 " );	// I can give you money. Because you will look the other way.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmDJG2_01_01 " );	// I can't be bribed, and if you don't disappear now, I'll take it as an insult.
};


instance DIA_Pal_213_Schiffswache_IAmDJG3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG3_Info;
	permanent = FALSE;
	description = " I have written permission. " ;
};

func int DIA_Pal_213_Schiffswache_IAmDJG3_Condition()
{
	if(hero.guild == GIL_DJG)
	{
		if ( Npc_KnowsInfo ( other , DIA_Pal_213_Schiffswache_IAmDJG ) && ( Npc_HasItems ( other , ITWr_ForgedShipLetter_MIS ) >=  1 )) ;
		{
			return TRUE;
		};
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		if(Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard) && (Npc_HasItems(other,ITWr_ForgedShipLetter_MIS) >= 1))
		{
			return TRUE;
		};
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG3_Info()
{
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_IAmDJG3_15_00 " );	// I have written permission. I am authorized to board this ship.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmDJG3_01_01 " );	// Let me take a look.
	B_GiveInvItems(other,self,ITWr_ForgedShipLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_IAmDJG3_01_02 " );	// That's right, you can pass.
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};

instance DIA_Pal_213_Schiffswache_Rats(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_Rats_Condition;
	information = DIA_Pal_213_Schiffswache_Rats_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Pal_213_Schiffswache_Rats_Condition()
{
	if ((MIS_ShipIsFree ==  TRUE ) && ((Npc_IsDead(Ship_Rat_01) ==  FALSE ) || (Npc_IsDead(Ship_Rat_02) ==  FALSE ) || (Npc_IsDead(Ship_Rat_03) ==  FALSE ) || ( Npc_IsDead(Ship_Rat_04) == FALSE )  FALSE ) || (Npc_IsDead(Ship_Rat_05) ==  FALSE ) || (Npc_IsDead(Ship_Rat_06) ==  FALSE )))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Rats_Info()
{
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_00 " );	// Wait! Since you have already entered the ship, I will have one request for you.
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_Rats_01_01 " );	// What else is this?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_02 " );	// Those damn rats are driving me crazy.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_03");	//Крысы?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_04 " );	// Yes, rats. (annoyed) Ordinary ship rats!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_05 " );	// Every night, these little parasites crawl in the ship's hold, making a terrible noise and fuss.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_06 " );	// My partner and I are on duty here, and this is not an easy task at all.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_07 " );	// Especially when you're constantly on the edge of every rustle.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_08 " );	// And these rats, damn them, prevent us from concentrating!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_09 " );	// Kindly take care of them.
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_Rats_01_10 " );	// Why don't you do it yourself?
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_11 " );	// I already told you that I'm on duty. And I have no right to leave it!
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_01_12 " );	// Another thing is you. (seriously) What do you say?
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_Rats_01_13 " );	// Okay, I'll look into the hold.
	MIS_SchiffswacheRats = LOG_Running;
	Log_CreateTopic(TOPIC_SchiffswacheRats,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SchiffswacheRats,LOG_Running);
	B_LogEntry(TOPIC_SchiffswacheRats, " The ship's guard complained that the rats inside the hold make too much noise every night. He asked me to deal with them. " );
};

instance DIA_Pal_213_Schiffswache_Rats_Done(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_Rats_Done_Condition;
	information = DIA_Pal_213_Schiffswache_Rats_Done_Info;
	permanent = FALSE;
	description = " The rats are gone. " ;
};

func int DIA_Pal_213_Schiffswache_Rats_Done_Condition()
{
	if((MIS_SchiffswacheRats == LOG_Running) && (Npc_IsDead(Ship_Rat_01) == TRUE) && (Npc_IsDead(Ship_Rat_02) == TRUE) && (Npc_IsDead(Ship_Rat_03) == TRUE) && (Npc_IsDead(Ship_Rat_04) == TRUE) && (Npc_IsDead(Ship_Rat_05) == TRUE) && (Npc_IsDead(Ship_Rat_06) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Rats_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_Rats_Done_01_00 " );	// The rats are done.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_Done_01_01 " );	// I hope you killed them all?
	AI_Output(other,self, " DIA_Pal_213_Schiffswache_Rats_Done_01_02 " );	// Every single one.
	AI_Output(self,other, " DIA_Pal_213_Schiffswache_Rats_Done_01_03 " );	// Good. (sighing) Finally, the night will be quiet. Thank you!
	MIS_SchiffswacheRats = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SchiffswacheRats,LOG_SUCCESS);
};
