

instance DIA_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BDT_13_EXIT_Condition;
	information = DIA_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_13_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_BDT_13_STANDARD_Condition;
	information = DIA_BDT_13_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_13_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void B_disappear_voice13()
{
	AI_Output(self,other, " DIA_BDT_13_STANDARD_13_01 " );	// Get lost!
};

func void DIA_BDT_13_STANDARD_Info()
{
	be int randy;

	if(CurrentLevel == PRIORATWORLD_ZEN)
	{
		randy = Hlp_Random( 4 );

		if(PlayerIsAssNow == FALSE)
		{
			PlayerIsPrioratFakeTemp = TRUE;
			AI_Output(self,other, " DIA_ASS_2_STANDARD_01_04 " );	// Hey! You are not one of our people...
			AI_Output(self,other, " DIA_ASS_2_STANDARD_01_05 " );	// Alarm, enemy!
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_KILL,1);
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other, " DIA_ASS_2_STANDARD_01_00 " );	// Better go! Otherwise, both will be in trouble...
			};	
			if(randy == 1)
			{
				AI_Output(self,other, " DIA_ASS_2_STANDARD_01_01 " );	// Don't disturb me!
			};
			if(randy == 2)
			{
				AI_Output(self,other, " DIA_ASS_2_STANDARD_01_02 " );	// Get out of here!
			};
			if(randy == 3)
			{
				AI_Output(self,other,"DIA_ASS_2_STANDARD_01_03");	//Не сейчас!
			};
		
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		randy = Hlp_Random( 3 );

		if(randy == 0)
		{
			AI_Output(self,other, " DIA_BDT_13_STANDARD_13_00 " );	// What are you staring at like an idiot?!
		};
		if(randy == 1)
		{
			B_Disappear_Voice13();
		};
		if(randy == 2)
		{
			AI_Output(self,other, " DIA_BDT_13_STANDARD_13_02 " );	// Leave me alone, idiot.
		};
		
		AI_StopProcessInfos(self);
	};
};

func void B_AssignAmbientInfos_BDT_13(var C_Npc slf)
{
	if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_185_Adept)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_184_Adept)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_183_Adept)))
	{
		dia_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
		dia_bdt_13_standard.npc = Hlp_GetInstanceID(slf);
	};
};
