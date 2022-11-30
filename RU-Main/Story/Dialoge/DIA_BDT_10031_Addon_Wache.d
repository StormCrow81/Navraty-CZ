
instance DIA_Addon_BDT_10031_Wache_EXIT(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10031_Wache_EXIT_Condition;
	information = DIA_Addon_10031_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10031_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10031_Wache_Scatty(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10031_Wache_Scatty_Condition;
	information = DIA_Addon_10031_Wache_Scatty_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10031_Wache_Scatty_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Scatty_Info()
{
	AI_Output(self,other, " DIA_Addon_BDT_10031_Wache_Scatty_06_00 " );	// Hey, do you want to go to work? Then don't forget to stock up on Scutty.
	AI_Output(other,self, " DIA_Addon_BDT_10031_Wache_Scatty_15_01 " );	// What do I need?
	AI_Output(self,other, " DIA_Addon_BDT_10031_Wache_Scatty_06_02 " );	// Well, at least a pickaxe. A little food doesn't hurt either.
	AI_StopProcessInfos(self);
};


var int Wache_Joker;

instance DIA_Addon_BDT_10031_Wache_Hi(C_Info)
{
	npc = BDT_10031_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10031_Wache_Hi_Condition;
	information = DIA_Addon_10031_Wache_Hi_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Addon_10031_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10031_Wache_Hi_15_00 " );	// Is everything okay?
	if ((slave_escape ==  TRUE ) && (guard_joker ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Addon_BDT_10031_Wache_Hi_06_01 " );	// Oh mate. The slaves seemed to be in a great hurry.
		AI_Output(self,other, " DIA_Addon_BDT_10031_Wache_Hi_06_02 " );	// When they heard they were free, they ran like rabbits!
		Wache_Joker = TRUE;
	};
	AI_Output(self,other, " DIA_Addon_BDT_10031_Wache_Hi_06_03 " );	// Yes. So do not create problems for anyone, and everything will be fine with you.
};
