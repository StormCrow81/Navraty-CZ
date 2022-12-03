

instance DMT_12190_NARUS_EXIT (C_Info)
{
	npc = dmt_12190_narus;
	nr = 999;
	condition = dmt_12190_narus_exit_condition;
	information = dmt_12190_narus_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12190_narus_exit_condition()
{
	return TRUE;
};

func void dmt_12190_narus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12190_NARUS_HELLO(C_Info)
{
	npc = dmt_12190_narus;
	condition = dmt_12190_narus_hello_condition;
	information = dmt_12190_narus_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12190_narus_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12190_narus_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other, " DMT_12190_Narus_Hello_01 " );	// You should contact Guardian Dagoth, adept!
			AI_Output(self,other, " DMT_12190_Narus_Hello_02 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12190_Narus_Hello_03 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12190_Narus_Hello_04 " );	// Now go!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other, " DMT_12190_Narus_Hello_05 " );	// You should contact Guardian Stonnos, adept!
			AI_Output(self,other, " DMT_12190_Narus_Hello_02 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12190_Narus_Hello_03 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12190_Narus_Hello_04 " );	// Now go!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other, " DMT_12190_Narus_Hello_09 " );	// You should contact Guardian Vakon, adept!
			AI_Output(self,other, " DMT_12190_Narus_Hello_02 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12190_Narus_Hello_03 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12190_Narus_Hello_04 " );	// Now go!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other, " DMT_12190_Narus_Hello_13 " );	// You should contact Guardian Kelios, adept!
			AI_Output(self,other, " DMT_12190_Narus_Hello_02 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12190_Narus_Hello_03 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12190_Narus_Hello_04 " );	// Now go!
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other, " DMT_12190_Narus_Hello_17 " );	// You already know what you should do.
		AI_Output(self,other, " DMT_12190_Narus_Hello_04 " );	// Now go!
		AI_StopProcessInfos(self);
	};
};

