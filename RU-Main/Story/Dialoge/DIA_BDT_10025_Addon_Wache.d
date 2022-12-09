
instance DIA_Addon_BDT_10025_Wache_EXIT(C_Info)
{
	npc = BDT_10025_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10025_Wache_EXIT_Condition;
	information = DIA_Addon_10025_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10025_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10025_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10025_Wache_Hi(C_Info)
{
	npc = BDT_10025_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10025_Wache_Hi_Condition;
	information = DIA_Addon_10025_Wache_Hi_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_10025_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10025_Wache_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10025_Wache_Hi_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_BDT_10025_Wache_Hi_07_01 " );	// I cook for the miners and guards.
	if (slave_escape ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_BDT_10025_Wache_Hi_07_02 " );	// The slaves get next to nothing. Some stagnant water and old bread, nothing more.
		AI_Output(self,other, " DIA_Addon_BDT_10025_Wache_Hi_07_03 " );	// Rats don't deserve the good stuff anyway.
	};
};
