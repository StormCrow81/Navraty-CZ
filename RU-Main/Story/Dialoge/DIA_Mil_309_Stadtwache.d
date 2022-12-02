

instance DIA_Mil_309_Stadtwache_EXIT (C_Info)
{
	npc = Mil_309_City Guard;
	nr = 999;
	condition = DIA_Mil_309_Stadtwache_EXIT_Condition;
	information = DIA_Mil_309_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_309_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_309_STADTWACHE_TOARMSCITYGATE (C_Info)
{
	npc = Mil_309_City Guard;
	nr = 1;
	condition = dia_mil_309_stadtwache_toarmscitygate_condition;
	information = dia_mil_309_stadtwache_toarmscitygate_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_309_stadtwache_toarmscitygate_condition()
{
	if((TOARMSCITYGATE == TRUE) && (CITYGATEACCESSGRANTED == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_309_stadtwache_toarmscitygate_info()
{
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	TOARMSCITYGATE = FALSE;
};


instance DIA_Mil_309_Stadtwache_Hello (C_Info)
{
	npc = Mil_309_City Guard;
	nr = 2;
	condition = DIA_Mil_309_Stadtwache_Hallo_Condition;
	information = DIA_Mil_309_Stadtwache_Hallo_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_Mil_309_Stadtwache_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_Hallo_Info()
{
	AI_Output(other,self, " DIA_Mil_309_Stadtwache_Hallo_15_00 " );	// How are you?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_01 " );	// All right! But we must be careful.
	}
	else  if ((Citywatch_310.aivar[ AIV_PASSGATE ] ==  FALSE ) && (MIl_309_News <  1 )) ;
	{
		AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_02 " );	// Listen. We can't let you into the city.
		AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_03 " );	// But I'll give you advice, and it's completely free.
		AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_04 " );	// Stay away from this forest ahead - there are hordes of terrible monsters roaming there.
		MIl_309_News = 1;
	}
	else  if ((Stadwatch_310.aivar[ AIV_PASSGATE ] ==  FALSE ) && (MIl_309_News ==  1 )) ;
	{
		AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_05 " );	// Go back to where you crawled out, you bastard!
	};
	if ((Citywatch_310.aivar[ AIV_PASSGATE ] ==  TRUE ) && (MIl_309_News <  2 )) ;
	{
		AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_06 " );	// Look, you have the right to be in the city. But that doesn't mean you can do whatever you want here.
		AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_07 " );	// If you don't follow the accepted rules, you will lose your rights here!
		MIl_309_News = 2;
	}
	else  if (( Citywatch_310 .aivar[ AIV_PASSGATE ] ==  TRUE ) && (MIl_309_News ==  2 )) ;
	{
		AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_08 " );	// Come on - come on!
	};
	AI_StopProcessInfos(self);
};

