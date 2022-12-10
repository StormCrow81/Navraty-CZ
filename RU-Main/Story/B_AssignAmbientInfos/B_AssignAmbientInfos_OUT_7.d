

instance DIA_OUT_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OUT_7_EXIT_Condition;
	information = DIA_OUT_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OUT_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_7_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OUT_7_STANDARD_Condition;
	information = DIA_OUT_7_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OUT_7_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_OUT_7_STANDARD_Info()
{
	be int randy;
	randy = Hlp_Random( 3 );
	if(randy == 0)
	{
		AI_Output(self,other, " DIA_OUT_7_STANDARD_07_00 " );	// Living here has become much more dangerous lately. The numerous field predators make things difficult as it is.
	};
	if(randy == 1)
	{
		AI_Output(self,other, " DIA_OUT_7_STANDARD_07_01 " );	// We must give a share to the city. If we don't, we will have problems with the paladins.
	};
	if(randy == 2)
	{
		AI_Output(self,other, " DIA_OUT_7_STANDARD_07_02 " );	// Onar's rebellion will have serious consequences. I'd rather not be part of it.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OUT_7(var C_Npc slf)
{
	dia_out_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_7_standard.npc = Hlp_GetInstanceID(slf);
};

