

instance DMT_12180_GADER_EXIT(C_Info)
{
	npc = dmt_12180_streets;
	nr = 999;
	condition = dmt_12180_gader_exit_condition;
	information = dmt_12180_gader_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12180_gader_exit_condition()
{
	return TRUE;
};

func void dmt_12180_gader_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12180_GADER_HELLO (C_Info)
{
	npc = dmt_12180_streets;
	condition = dmt_12180_gader_hello_condition;
	information = dmt_12180_gader_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12180_gader_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12180_gader_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other, " DMT_12180_Gader_Hello_01 " );	// You should contact Guardian Dagoth, adept!
			AI_Output(self,other, " DMT_12180_Gader_Hello_02 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12180_Gader_Hello_03 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12180_Gader_Hello_04 " );	// Now go!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other, " DMT_12180_Gader_Hello_05 " );	// You should contact Guardian Stonnos, adept!
			AI_Output(self,other, " DMT_12180_Gader_Hello_06 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12180_Gader_Hello_07 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12180_Gader_Hello_04 " );	// Now go!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other, " DMT_12180_Gader_Hello_09 " );	// You should contact Guardian Vakon, adept!
			AI_Output(self,other, " DMT_12180_Gader_Hello_10 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12180_Gader_Hello_11 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12180_Gader_Hello_04 " );	// Now go!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other, " DMT_12180_Gader_Hello_13 " );	// You should contact Guardian Kelios, adept!
			AI_Output(self,other, " DMT_12180_Gader_Hello_14 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12180_Gader_Hello_15 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12180_Gader_Hello_04 " );	// Now go!
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other, " DMT_12180_Gader_Hello_17 " );	// You already know what you should do.
		AI_Output(self,other, " DMT_12180_Gader_Hello_04 " );	// Now go!
		AI_StopProcessInfos(self);
	};
};

