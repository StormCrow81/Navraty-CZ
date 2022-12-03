

instance DIA_Addon_Bones_EXIT(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 999;
	condition = DIA_Addon_Bones_EXIT_Condition;
	information = DIA_Addon_Bones_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bones_PICKPOCKET(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 900;
	condition = DIA_Addon_Bones_PICKPOCKET_Condition;
	information = DIA_Addon_Bones_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Bones_PICKPOCKET_Condition()
{
	return  C_Robbery ( 75 , 104 );
};

func void DIA_Addon_Bones_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bones_PICKPOCKET,Dialog_Back,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bones_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
};

func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
};

func void B_Addon_Bones_KeineZeit()
{
	AI_Output(self,other, " DIA_Addon_Bones_Train_01_01 " );	// Sorry, I don't have much time right now.
	AI_Output(self,other, " DIA_Addon_Bones_Train_01_02 " );	// I need to train.
};


instance DIA_Addon_Bones_Hire (C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 1;
	condition = DIA_Addon_Bones_Hire_Condition;
	information = DIA_Addon_Bones_Hire_Info;
	description = "The canyon is waiting for us. " ;
};


func int DIA_Addon_Bones_Hire_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bones_Hire_Info()
{
	AI_Output(other,self, " DIA_Addon_Bones_Anheuern_15_01 " );	// The canyon is waiting for us.
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Hello(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Hello_Condition;
	information = DIA_Addon_Bones_Hello_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Hello_15_00");	//Как дела?
	AI_Output(self,other, " DIA_Addon_Bones_Hello_01_01 " );	// It's a sin to complain. A little boring, but it doesn't have to work.
	AI_Output(self,other, " DIA_Addon_Bones_Work_01_01 " );	// I'm getting ready for the new assignment that Greg gave me.
	AI_Output(other,self, " DIA_Addon_Bones_Work_15_02 " );	// What is this job?
	AI_Output(self,other, " DIA_Addon_Bones_Work_01_03 " );	// I can't tell you.
	AI_Output(self,other, " DIA_Addon_Bones_Work_01_04 " );	// No offense mate, but I worked hard to get this quest and I don't want to lose it again.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bones_Train(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Train_Condition;
	information = DIA_Addon_Bones_Train_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int DIA_Addon_Bones_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bones_Train_Info()
{
	AI_Output(other,self, " DIA_Addon_Bones_Train_15_00 " );	// Can you teach me something?
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Teacher(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Teacher_Condition;
	information = DIA_Addon_Bones_Teacher_Info;
	permanent = FALSE;
	description = " Who here can teach me something? " ;
};


func int DIA_Addon_Bones_Teacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bones_Teacher_Info()
{
	AI_Output(other,self, " DIA_Addon_Bones_Teacher_15_00 " );	// Who here can teach me something?
	AI_Output(self,other, " DIA_Addon_Bones_Teacher_01_04 " );	// Henry and Morgan are in command of our battle groups.
	AI_Output(self,other, " DIA_Addon_Bones_Teacher_01_05 " );	// They can teach you how to fight better.
	AI_Output(self,other, " DIA_Addon_Bones_Teacher_01_07 " );	// Henry's men use two-handed weapons.
	AI_Output(self,other, " DIA_Addon_Bones_Teacher_01_08 " );	// Morgan prefers faster one-handed blades.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//А еще?
	AI_Output(self,other, " DIA_Addon_Bones_Teacher_01_10 " );	// You know, to be honest, I wasn't interested in anything else.
	AI_Output(self,other, " DIA_Addon_Bones_Teacher_01_11 " );	// But I think Alligator Jack or Samuel will have something to share with you.
	Knows_HenrysEntertrupp = TRUE ;
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
};


instance DIA_Addon_Bones_Francis(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 3;
	condition = DIA_Addon_Bones_Francis_Condition;
	information = DIA_Addon_Bones_Francis_Info;
	permanent = FALSE;
	description = " What do you think of Francis? " ;
};


func int DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_shit out ==  FALSE )
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	return  FALSE ;
};

func void DIA_Addon_Bones_Francis_Info()
{
	AI_Output(other,self, " DIA_Addon_Bones_Francis_15_00 " );	// What do you think about Francis?
	AI_Output(self,other, " DIA_Addon_Bones_Francis_01_03 " );	// Look around. Only Henry and his men are working.
	AI_Output(self,other, " DIA_Addon_Bones_Francis_01_04 " );	// Morgan either sleeps or drinks moonshine all day long.
	AI_Output(self,other, " DIA_Addon_Bones_Francis_01_05 " );	// This doesn't happen with Greg. If you mess around, you get in the neck. That's all.
};


instance DIA_Addon_Bones_WantArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_WantArmor_Condition;
	information = DIA_Addon_Bones_WantArmor_Info;
	permanent = TRUE;
	description = " Give me the bandit armor. " ;
};


func int DIA_Addon_Bones_WantArmor_Condition()
{
	if((Greg_GaveArmorToBones == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bones_WantArmor_Info()
{
	AI_Output(other,self, " DIA_Addon_Bones_WantArmor_15_00 " );	// Give me the bandit armor.
	AI_Output(self,other, " DIA_Addon_Bones_WantArmor_01_01 " );	// I'm not crazy yet. Greg will blow my head off.
	AI_Output(self,other, " DIA_Addon_Bones_WantArmor_01_02 " );	// He told me that without his orders, I must not give them to anyone.

	if(GregIsBack == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Bones_WantArmor_01_03 " );	// No, I can't give them to you. Especially when Greg isn't here.
	};
	B_LogEntry(TOPIC_Addon_BDTRuestung, " Bones won't give me the armor until I get Greg's permission. " );
};


instance DIA_Addon_Bones_GiveArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_GiveArmor_Condition;
	information = DIA_Addon_Bones_GiveArmor_Info;
	permanent = FALSE;
	description = " You must give me the bandit armor. Greg's order. " ;
};


func int DIA_Addon_Bones_GiveArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Bones_GiveArmor_Info()
{
	AI_Output(other,self, " DIA_Addon_Bones_GiveArmor_15_00 " );	// You must give me the bandit armor. Greg's order.
	AI_Output(self,other, " DIA_Addon_Bones_GiveArmor_01_01 " );	// Greg's order? Phew, I thought I really had to go on this mission.
	AI_Output(self,other, " DIA_Addon_Bones_GiveArmor_01_02 " );	// Scouting in a bandit camp is suicidal.
	AI_Output(self,other, " DIA_Addon_Bones_GiveArmor_01_03 " );	// I'd rather Greg give me some boring work...
	AI_Output(other,self, " DIA_Addon_Bones_GiveArmor_15_04 " );	// (annoyed) Armor.
	AI_Output(self,other, " DIA_Addon_Bones_GiveArmor_01_05 " );	// Yes, of course, here they are.
	B_GiveInvItems(self,other,ItAr_BDT_M,1);
	AI_Output(self,other, " DIA_Addon_Bones_GiveArmor_01_06 " );	// Be careful. These bandits are not to be trifled with.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	PlayerGetBDTArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung,LOG_SUCCESS);
	B_LogEntry(TOPIC_Addon_BDTRuestung, " Greg's order has taken effect. I have armor! " );
	B_GivePlayerXP(XP_Bones_GetBDTArmor);
};
