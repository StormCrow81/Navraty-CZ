
instance DIA_Addon_BDT_10029_Buddler_EXIT(C_Info)
{
	npc = BDT_10029_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10029_Buddler_EXIT_Condition;
	information = DIA_Addon_10029_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10029_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10029_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10029_Buddler_Hi(C_Info)
{
	npc = BDT_10029_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10029_Buddler_Hi_Condition;
	information = DIA_Addon_10029_Buddler_Hi_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_10029_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10029_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10029_Buddler_Hi_15_00");	//How are you?
	if (slave_escape ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_BDT_10029_Buddler_Hi_06_01 " );	// As long as the slaves do all the work, I don't have to lift a finger.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BDT_10029_Buddler_Hi_06_02 " );	// I need to dig a bit to get back into the rhythm. I hate my life.
		AI_StopProcessInfos(self);
	};
};
