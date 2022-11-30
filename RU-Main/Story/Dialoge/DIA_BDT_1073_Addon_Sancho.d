
instance DIA_Addon_Sancho_EXIT(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 999;
	condition = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Sancho_PICKPOCKET(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 900;
	condition = DIA_Addon_Sancho_PICKPOCKET_Condition;
	information = DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	return  C_Robbery ( 50 , 40 );
};

func void DIA_Addon_Sancho_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET,Dialog_Back,DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};

func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};


instance DIA_Addon_Sancho_HI (C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Sancho_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_HI_Info()
{
	AI_Output(self,other, " DIA_Addon_Sancho_HI_06_00 " );	// Damn, another newbie. (laughs) Also for gold, right?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//За золотом?
	AI_Output(self,other, " DIA_Addon_Sancho_HI_06_02 " );	// (laughs) Don't try to fool me!
	AI_Output(self,other, " DIA_Addon_Sancho_HI_06_03 " );	// Everyone who comes here wants to get into the mine.
	AI_Output(self,other, " DIA_Addon_Sancho_HI_06_04 " );	// But don't think it will be easy!
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		B_LogEntry_Quiet(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry_Quiet(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_Sancho_Lager(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent = FALSE;
	description = " How do I get to the camp? " ;
};


func int DIA_Addon_Sancho_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_Lager_Info()
{
	AI_Output(other,self, " DIA_Addon_Sancho_Lager_15_00 " );	// How do I get to the camp?
	AI_Output(self,other, " DIA_Addon_Sancho_Lager_06_01 " );	// Just walk on the deck!
	if ( ! Npc_IsDead(Franco))
	{
		AI_Output(self,other, " DIA_Addon_Sancho_Lager_06_02 " );	// But if you want to get into the mine, you'll have to deal with Franco.
		AI_Output(self,other, " DIA_Addon_Sancho_Lager_06_03 " );	// He thinks all newbies should do some outside work first!
	};
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco, " All beginners must work in the swamp before gaining access to the mine. " );
};


instance DIA_Addon_Sancho_Mine(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 3;
	condition = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent = FALSE;
	description = " Tell me about the mine... " ;
};


func int DIA_Addon_Sancho_Mine_Condition()
{
	if ( ! Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Sancho_Mine_Info()
{
	AI_Output(other,self, " DIA_Addon_Sancho_Mine_15_00 " );	// Tell me about the mine...
	AI_Output(self,other, " DIA_Addon_Sancho_Mine_06_01 " );	// I'll give you a piece of advice: if you want to get there, Franco must like you. He's in charge here.
	AI_Output(self,other, " DIA_Addon_Sancho_Mine_06_02 " );	// He decides who goes there next.
	AI_Output(self,other, " DIA_Addon_Sancho_Mine_06_03 " );	// And he'll only let you in there if you don't loaf around here.
	AI_Output(self,other, " DIA_Addon_Sancho_Mine_06_04 " );	// So go to him and ask him for some work!
	B_LogEntry(Topic_Addon_Franco, " Franco decides who goes to the camp. He also distributes tasks. " );
};


instance DIA_Addon_Sancho_Franco (C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 4;
	condition = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent = FALSE;
	description = " Where can I find Franco? " ;
};


func int DIA_Addon_Sancho_Franco_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Sancho_Mine ) &&  ! Npc_IsDead ( Franco ) )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Sancho_Franco_Info()
{
	AI_Output(other,self, " DIA_Addon_Sancho_Franco_15_00 " );	// Where can I find Franco?
	AI_Output(self,other, " DIA_Addon_Sancho_Franco_06_01 " );	// Usually he sticks out in the courtyard in front of the camp.
	AI_Output(self,other, " DIA_Addon_Sancho_Franco_06_02 " );	// Be on good terms with him and you'll get a better job than I do!
	B_LogEntry(Topic_Addon_Franco, " Franco can be found in front of the camp. " );
};


instance DIA_Addon_Sancho_Spitzel (C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 5;
	condition = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent = FALSE;
	description = " Are you supposed to sit here all the time? " ;
};


func int DIA_Addon_Sancho_Spitzel_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Sancho_Franco ) || Npc_IsDead ( Franco ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Sancho_Spitzel_Info()
{
	AI_Output(other,self, " DIA_Addon_Sancho_Spitzel_15_00 " );	// Do you have to sit here all the time?
	AI_Output(self,other, " DIA_Addon_Sancho_Spitzel_06_01 " );	// I have to meet all the newcomers to make sure we don't have spies sneaking in.
	AI_Output(self,other, " DIA_Addon_Sancho_Spitzel_06_02 " );	// But you can forget about it. I want to say that we are here at the end of the world - in the middle of a swamp.
	AI_Output(self,other, " DIA_Addon_Sancho_Spitzel_06_03 " );	// No one can find us, and no one will find us. Because who needs to send spies here?
};


instance DIA_Addon_Sancho_Perm(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 99;
	condition = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_Addon_Sancho_Perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Sancho_Spitzel ))
	{
		return TRUE;
	};
	return  FALSE ;
};


var int Comment_Franco;
var int Comment_Esteban;

func void DIA_Addon_Sancho_Perm_Info()
{
	AI_Output(other,self, " DIA_Addon_Sancho_Perm_15_00 " );	// What's the news?
	if ( Npc_IsDead ( Frank ) && ( Frank_Comment ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Addon_Sancho_Perm_06_01 " );	// I heard you killed Franco. Good job...
		if ( ! Npc_IsDead(Carlos))
		{
			AI_Output(self,other, " DIA_Addon_Sancho_Perm_06_02 " );	// ...but now this Carlos sat on our necks. He's bad jokes...
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Sancho_Perm_06_03 " );	// Are you done with Carlos too? Buddy, you really are a dangerous killer, aren't you? Leave me alone.
		};
		Comment_Franco = TRUE;
	}
	else  if ( Npc_IsDead ( Stephen ) && ( Comment_Stephen ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Addon_Sancho_Perm_06_04 " );	// They say you killed Esteban. Dude, you're obviously up to something, right?
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Sancho_Perm_06_05 " );	// Yes, nothing new.
	};
};
