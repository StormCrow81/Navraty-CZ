

instance DIA_GornNW_KAP3_EXIT(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 999;
	condition = DIA_GornNW_KAP3_EXIT_Condition;
	information = DIA_GornNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_Hallo(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 1;
	condition = DIA_GornNW_Hallo_Condition;
	information = DIA_GornNW_Hallo_Info;
	permanent = FALSE;
	description = " Are you all right? " ;
};


func int DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_GornNW_Hallo_Info()
{
	AI_Output(other,self, " DIA_GornNW_Add_15_00 " );	// Are you all right?
	if(MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_GornNW_Add_12_01 " );	// You saved me, boy.
		AI_Output(self,other, " DIA_GornNW_Add_12_02 " );	// I will never forget this.
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other, " DIA_GornNW_Add_12_03 " );	// Milten pulled me out.
		AI_Output(self,other, " DIA_GornNW_Add_12_04 " );	// I will never forget this.
	};
};


instance DIA_GornNW_WhatNext(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 1;
	condition = DIA_GornNW_WhatNext_Condition;
	information = DIA_GornNW_WhatNext_Info;
	permanent = TRUE;
	description = " What are you going to do now? " ;
};


func int DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};

func void DIA_GornNW_WhatNext_Info()
{
	AI_Output(other,self, " DIA_GornNW_Add_15_05 " );	// What are you going to do now?
	AI_Output(self,other, " DIA_GornNW_Add_12_06 " );	// First I'll fuck off.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//А потом?
	AI_Output(self,other, " DIA_GornNW_Add_12_08 " );	// Who knows! Perhaps I will return to the colony again.
	AI_Output(self,other, " DIA_GornNW_Add_12_09 " );	// Someone has to watch over the orcs, otherwise they might show up on our doorstep without any warning.
};

