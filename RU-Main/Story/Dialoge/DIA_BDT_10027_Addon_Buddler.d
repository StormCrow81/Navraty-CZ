
instance DIA_Addon_BDT_10027_Buddler_EXIT(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10027_Buddler_EXIT_Condition;
	information = DIA_Addon_10027_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10027_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10027_Buddler_Hi(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10027_Buddler_Hi_Condition;
	information = DIA_Addon_10027_Buddler_Hi_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_10027_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10027_Buddler_Hi_15_00");	//How are you?
	if (slave_escape ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_BDT_10027_Buddler_Hi_11_01 " );	// I've been working for these ore barons for a very long time! It's good that others are working now too.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BDT_10027_Buddler_Hi_11_02 " );	// Damn! Now we have to dig all by ourselves again?!
	};
};
