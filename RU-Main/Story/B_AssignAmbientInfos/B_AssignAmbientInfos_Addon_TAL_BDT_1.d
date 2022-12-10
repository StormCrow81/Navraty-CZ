

instance DIA_Addon_TAL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_1_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_1_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_1_Hi_Condition;
	information = DIA_Addon_TAL_BDT_1_Hi_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//How are you?
	AI_Output(self,other, " DIA_Addon_TAL_BDT_1_Hi_01_01 " );	// I wait until they need someone new and it's my turn.
	if ( ! Npc_IsDead(Franco))
	{
		AI_Output(self,other, " DIA_Addon_TAL_BDT_1_Hi_01_02 " );	// Of all the people outside, only Franco could enter here.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_TAL_BDT_1_Hi_01_03 " );	// And now Franco is dead, and maybe I'll have a chance.
	};
};


instance DIA_Addon_TAL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_1_Lager_Condition;
	information = DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent = TRUE;
	description = " Can you tell me something about the camp. " ;
};


func int DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Lager_Info()
{
	AI_Output(other,self, " DIA_Addon_TAL_BDT_1_Lager_15_00 " );	// Can you tell me something about the camp?
	AI_Output(self,other, " DIA_Addon_TAL_BDT_1_Lager_01_01 " );	// Watch who you mess with! If you start fighting for no reason, they will all turn on you!
	AI_Output(self,other, " DIA_Addon_TAL_BDT_1_Lager_01_02 " );	// Most of them care too much about their gold, and some keep a close eye on others.
};


instance DIA_Addon_TAL_BDT_1_Raven(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_1_Raven_Condition;
	information = DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent = TRUE;
	description = " What do you know about Raven? " ;
};


func int DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Raven_Info()
{
	AI_Output(other,self, " DIA_Addon_TAL_BDT_1_Raven_15_00 " );	// What do you know about Raven?
	AI_Output(self,other, " DIA_Addon_TAL_BDT_1_Raven_01_01 " );	// He was the first to be here with his guys.
	AI_Output(self,other, " DIA_Addon_TAL_BDT_1_Raven_01_02 " );	// He's the camp commander. I advise you not to mess with him.
	AI_Output(self,other, " DIA_Addon_TAL_BDT_1_Raven_01_03 " );	// Once they needed five new fighters because he took his anger out on his own people.
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_NUMBER_BDT_1_Hi.npc = Help_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Raven.npc = Hlp_GetInstanceID(slf);
};

