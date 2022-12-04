
instance DIA_Egill_EXIT(C_Info)
{
	npc = BAU_945_Egill;
	nr = 999;
	condition = DIA_Egill_EXIT_Condition;
	information = DIA_Egill_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Egill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Egill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Egill_HALLO(C_Info)
{
	npc = BAU_945_Egill;
	nr = 3;
	condition = DIA_Egill_HALLO_Condition;
	information = DIA_Egill_HELLO_Info;
	description = " What's wrong? " ;
};


func int DIA_Egill_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Egill_HALLO_Info()
{
	AI_Output(other,self, " DIA_Egill_HALLO_15_00 " );	// What's wrong?
	AI_Output(self,other, " DIA_Egill_HALLO_08_01 " );	// For the longest time I have not seen a stranger on our land who didn't want to harm us in some way.
	AI_Output(self,other, " DIA_Egill_HALLO_08_02 " );	// I hope I'm not mistaken about you.
	AI_Output(self,other, " DIA_Egill_HALLO_08_03 " );	// I'm Egill.
	if(Hlp_IsValidNpc(Ehnim) && !C_NpcIsDown(Ehnim))
	{
		AI_Output(self,other, " DIA_Egill_HALLO_08_04 " );	// And that layabout over there is my brother Enim.
	};
};


instance DIA_Egill_FELDARBEIT (C_Info)
{
	npc = BAU_945_Egill;
	nr = 4;
	condition = DIA_Egill_FELDARBEIT_Condition;
	information = DIA_Egill_FELDARBEIT_Info;
	description = " How is the work going in the field? " ;
};


func int DIA_Egill_FELDARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Egill_FELDARBEIT_Info()
{
	AI_Output(other,self, " DIA_Egill_FELDARBEIT_15_00 " );	// How is the work going in the field?
	AI_Output(self,other, " DIA_Egill_FELDARBEIT_08_01 " );	// Great. If only those nasty field predators weren't ruining our crops...
};


instance DIA_Egill_FELDRAEUBER(C_Info)
{
	npc = BAU_945_Egill;
	nr = 5;
	condition = DIA_Egill_FELDRAEUBER_Condition;
	information = DIA_Egill_FELDRAEUBER_Info;
	description = " Why aren't you doing anything to these field predators? " ;
};


func int DIA_Egill_FELDRAEUBER_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Egill_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Egill_FELDRAEUBER_Info()
{
	AI_Output(other,self, " DIA_Egill_FELDRAEUBER_15_00 " );	// Why aren't you doing anything to these field predators?
	AI_Output(self,other, " DIA_Egill_FELDRAEUBER_08_01 " );	// Are you kidding? Since I've been working on this farm, I've killed so many that I've lost count.
	AI_Output(self,other, " DIA_Egill_FELDRAEUBER_08_02 " );	// But new ones keep taking their place.
};


instance DIA_Egill_STREIT2 (C_Info)
{
	npc = BAU_945_Egill;
	nr = 6;
	condition = DIA_Egill_STREIT2_Condition;
	information = DIA_Egill_STREIT2_Info;
	description = " Your brother said the same thing. " ;
};


func int DIA_Egill_STREIT2_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Egill_FELDRAEUBER ) && Npc_KnowsInfo ( other , DIA_Ehnim_FELDRAEUBER ) && ( Hlp_IsValidNpc ( Own ) &&  ! C_NpcIsDown ( Own ))) .
	{
		return TRUE;
	};
};

func void DIA_Egill_STREIT2_Info()
{
	AI_Output(other,self, " DIA_Egill_STREIT2_15_00 " );	// Your brother said the same thing.
	AI_Output(self,other, " DIA_Egill_STREIT2_08_01 " );	// Yeah? What else did he say?
	AI_Output(other,self, " DIA_Egill_STREIT2_15_02 " );	// That he also killed a lot of field predators.
	AI_Output(self,other, " DIA_Egill_STREIT2_08_03 " );	// What? That coward doesn't know his ass from from his sword hilt.
	AI_Output(self,other, " DIA_Egill_STREIT2_08_04 " );	// Tell him to stop bragging.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_STREIT4 (C_Info)
{
	npc = BAU_945_Egill;
	nr = 7;
	condition = DIA_Egill_STREIT4_Condition;
	information = DIA_Egill_STREIT4_Info;
	description = " Enim is a little annoyed by your words. " ;
};


func int DIA_Egill_STREIT4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_STREIT3) && (Hlp_IsValidNpc(Ehnim) && !C_NpcIsDown(Ehnim)))
	{
		return TRUE;
	};
};

func void DIA_Egill_STREIT4_Info()
{
	AI_Output(other,self, " DIA_Egill_STREIT4_15_00 " );	// Enim is a little annoyed by your words.
	AI_Output(self,other, " DIA_Egill_STREIT4_08_01 " );	// He should stop walking around like some kind of tough guy, It doesn't suit him. Tell him that.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_PERMKAP1(C_Info)
{
	npc = BAU_945_Egill;
	condition = DIA_Egill_PERMKAP1_Condition;
	information = DIA_Egill_PERMKAP1_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Egill_PERMKAP1_Condition()
{
	if (( DIA_Ehnim_STREIT5_noPerm ==  TRUE ) && Npc_IsInState ( self , ZS_Talk ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Egill_PERMKAP1_Info()
{
	AI_Output(self,other, " DIA_Egill_PERMKAP1_08_00 " );	// Haven't you done enough? I think you'd better leave.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_PICKPOCKET(C_Info)
{
	npc = BAU_945_Egill;
	nr = 900;
	condition = DIA_Egill_PICKPOCKET_Condition;
	information = DIA_Egill_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Egill_PICKPOCKET_Condition()
{
	return  C_Robbery ( 45 , 24 );
};

func void DIA_Egill_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
	Info_AddChoice(DIA_Egill_PICKPOCKET,Dialog_Back,DIA_Egill_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Egill_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Egill_PICKPOCKET_DoIt);
};

func void DIA_Egill_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
};

func void DIA_Egill_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
};
