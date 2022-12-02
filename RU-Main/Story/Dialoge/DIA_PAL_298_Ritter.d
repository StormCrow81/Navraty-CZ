

instance DIA_PAL_298_EXIT(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 999;
	condition = DIA_PAL_298_EXIT_Condition;
	information = DIA_PAL_298_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_298_Pass(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 2;
	condition = DIA_PAL_298_Pass_Condition;
	information = DIA_PAL_298_Pass_Info;
	permanent = FALSE;
	description = " Where does this road lead to? " ;
};


func int DIA_PAL_298_Pass_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Pass_Info()
{
	AI_Output(other,self, " DIA_PAL_298_Pass_15_00 " );	// Where does this road lead?
	AI_Output(self,other, " DIA_PAL_298_Pass_09_01 " );	// Behind this gate lies a passage to the Valley of Mines.
	AI_Output(self,other, " DIA_PAL_298_Pass_09_02 " );	// We're on this side, orcs on the other.
	AI_Output(self,other, " DIA_PAL_298_Pass_09_03 " );	// You'd better turn back - you won't be able to get through there.
};


instance DIA_PAL_298_TRESPASS(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 2;
	condition = DIA_PAL_298_TRESPASS_Condition;
	information = DIA_PAL_298_TRESPASS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_PAL_298_TRESPASS_Condition()
{
	if(MIS_OLDWORLD == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_PAL_298_TRESPASS_Info()
{
	AI_Output(self,other, " DIA_PAL_298_TRESPASS_09_00 " );	// Are you sure you want to go there? I'm afraid you won't get far - there are orcs.
	AI_Output(other,self, " DIA_PAL_298_TRESPASS_15_01 " );	// If there is a way to the Valley of Mines, I will find it.
	AI_Output(self,other, " DIA_PAL_298_TRESPASS_09_02 " );	// Okay, then go. Go with Innos.
};


instance DIA_PAL_298_Perm1(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 3;
	condition = DIA_PAL_298_Perm1_Condition;
	information = DIA_PAL_298_Perm1_Info;
	permanent = TRUE;
	description = " What if I do go, at my own peril and risk? " ;
};


func int DIA_PAL_298_Perm1_Condition()
{
	if ((Capital ==  1 ) && Npc_KnowsInfo(other,DIA_PAL_298_Pass))
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Perm1_Info()
{
	AI_Output(other,self, " DIA_PAL_298_Perm1_15_00 " );	// What if I do go, at my own risk?
	AI_Output(self,other, " DIA_PAL_298_Perm1_09_01 " );	// Then you will die. That's why we're here. So that you don't have such idiotic ideas.
};


instance DIA_PAL_298_Perm2(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 3;
	condition = DIA_PAL_298_Perm2_Condition;
	information = DIA_PAL_298_Perm2_Info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int DIA_PAL_298_Perm2_Condition()
{
	if (Chapter >=  2 )
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Perm2_Info()
{
	AI_Output(other,self, " DIA_PAL_298_Perm2_15_00 " );	// How are things?
	AI_Output(self,other, " DIA_PAL_298_Perm2_09_01 " );	// Everything is calm! We have the situation under control.
};

