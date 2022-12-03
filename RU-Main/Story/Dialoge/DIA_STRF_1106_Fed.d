

instance DIA_Fed_EXIT(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 999;
	condition = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fed_HALLO(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 2;
	condition = DIA_Fed_HALLO_Condition;
	information = DIA_Fed_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fed_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Fed_HALLO_Info()
{
	AI_Output(self,other, " DIA_Fed_HALLO_08_00 " );	// What do you want from me? I'm not going anywhere!
	AI_Output(other,self, " DIA_Fed_HALLO_15_01 " );	// Calm down - no one wants you to go anywhere.
	AI_Output(self,other, " DIA_Fed_HALLO_08_02 " );	// Glory to Innos. You know, in the last few days, several people have left the camp - and none of them have returned.
	AI_Output(self,other, " DIA_Fed_HALLO_08_03 " );	// Snappers ate them all. But they can't get me. I'll stay here until all this is over.
};


instance DIA_Fed_Snapper(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 3;
	condition = DIA_Fed_Snapper_Condition;
	information = DIA_Fed_Snapper_Info;
	permanent = FALSE;
	description = " What do you know about snappers? " ;
};


func int DIA_Fed_Snapper_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fed_Snapper_Info()
{
	AI_Output(other,self, " DIA_Fed_Snapper_15_00 " );	// What do you know about snappers?
	AI_Output(self,other, " DIA_Fed_Snapper_08_01 " );	// Bilgot watched them at night. Some of them graze by the lake next to the old tower.
	AI_Output(self,other, " DIA_Fed_Snapper_08_02 " );	// And the others are right above us - at the top of this cliff. They're just waiting for us to run out of energy.
	AI_Output(self,other, " DIA_Fed_Snapper_08_03 " );	// They locked us in here. And soon they will attack our camp - then they will feast ...
	AI_Output(other,self,"DIA_Fed_Snapper_15_04");	//Понятно.
};


instance DIA_Fed_Perm(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 5;
	condition = DIA_Fed_Perm_Condition;
	information = DIA_Fed_Perm_Info;
	permanent = TRUE;
	description = " Are you all right? " ;
};


func int DIA_Fed_Perm_Condition()
{
	return TRUE;
};

func void DIA_Fed_Perm_Info()
{
	AI_Output(other,self, " DIA_Fed_Perm_15_00 " );	// Are you all right?
	if(MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Fed_Perm_08_01 " );	// There are snappers! Can you smell them?.. I can smell...
	}
	else
	{
		AI_Output(self,other, " DIA_Fed_Perm_08_02 " );	// The Snappers seem to have retreated. But that doesn't mean anything. They will return - or wolves, or lizards, or orcs.
		AI_Output(self,other, " DIA_Fed_Perm_08_03 " );	// And sooner or later they will devour us...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Fed_PICKPOCKET(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 900;
	condition = DIA_Fed_PICKPOCKET_Condition;
	information = DIA_Fed_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fed_PICKPOCKET_Condition()
{
	return  C_Robbery ( 32 , 8 );
};

func void DIA_Fed_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
	Info_AddChoice(DIA_Fed_PICKPOCKET,Dialog_Back,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fed_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
};

func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
};

