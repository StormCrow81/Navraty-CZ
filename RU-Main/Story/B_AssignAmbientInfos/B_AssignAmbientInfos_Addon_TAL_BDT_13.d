

instance DIA_Addon_TAL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_13_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_13_Hi_Condition;
	information = DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//How are you?
	AI_Output(self,other, " DIA_Addon_TAL_BDT_13_Hi_13_01 " );	// Either the monsters will eat you... or the monsters will eat you...
	AI_Output(self,other, " DIA_Addon_TAL_BDT_13_Hi_13_02 " );	// This swamp will become our grave...
};


instance DIA_Addon_TAL_BDT_13_Tal(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_13_Tal_Condition;
	information = DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent = TRUE;
	description = " What do you know about this valley? " ;
};


func int DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Tal_Info()
{
	AI_Output(other,self, " DIA_Addon_TAL_BDT_13_Tal_15_00 " );	// What do you know about this valley?
	AI_Output(self,other, " DIA_Addon_TAL_BDT_13_Tal_13_01 " );	// There are many things left from ancient times. Raven told us to collect them all.
	AI_Output(self,other, " DIA_Addon_TAL_BDT_13_Tal_13_02 " );	// I don't know why he needs them, but no sane person would risk their own lives for a few old stones...
};


instance DIA_Addon_TAL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_13_News_Condition;
	information = DIA_Addon_TAL_BDT_13_News_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_News_Info()
{
	AI_Output(other,self, " DIA_Addon_TAL_BDT_13_News_15_00 " );	// Any news?
	AI_Output(self,other, " DIA_Addon_TAL_BDT_13_News_13_01 " );	// We really finished off those pirates.
	AI_Output(self,other, " DIA_Addon_TAL_BDT_13_News_13_02 " );	// They brought us captives, but they never received any coins either. No wonder they got angry.
	if (BDT_13_once ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_TAL_BDT_13_News_13_03 " );	// But what can they do? Attack the camp? HAHA.
		BDT_13_once = TRUE ;
	};
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_NUMBER_BDT_13_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_NUMBER_BDT_13_NUMBER.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
};

