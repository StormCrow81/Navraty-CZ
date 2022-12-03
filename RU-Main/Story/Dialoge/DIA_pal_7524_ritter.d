

instance DIA_PAL_7524_EXIT(C_Info)
{
	npc = pal_7524_ritter;
	nr = 999;
	condition = dia_pal_7524_exit_condition;
	information = dia_pal_7524_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7524_exit_condition()
{
	return TRUE;
};

func void dia_pal_7524_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7524_PASS(C_Info)
{
	npc = pal_7524_ritter;
	nr = 2;
	condition = dia_pal_7524_pass_condition;
	information = dia_pal_7524_pass_info;
	permanent = FALSE;
	description = " What's in here? " ;
};


func int dia_pal_7524_pass_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_7524_pass_info()
{
	AI_Output(other,self, " DIA_PAL_7524_Pass_01_00 " );	// What's in here?
	AI_Output(self,other, " DIA_PAL_7524_Pass_01_01 " );	// There is a paladin camp here.
	AI_Output(self,other, " DIA_PAL_7524_Pass_01_02 " );	// After the skirmish with the orcs, we had to retreat here and take up defenses.
	AI_Output(self,other, " DIA_PAL_7524_Pass_01_03 " );	// But shortly after that, this forest grew here, and the orcs retreated.
};


instance DIA_PAL_7524_TRESPASS(C_Info)
{
	npc = pal_7524_ritter;
	nr = 2;
	condition = dia_pal_7524_trespass_condition;
	information = dia_pal_7524_trespass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7524_trespass_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_7524_trespass_info()
{
	AI_Output(self,other, " DIA_PAL_7524_TRESPASS_01_00 " );	// STOP! In the name of Innos, answer - WHO ARE YOU?!
	AI_Output(other,self, " DIA_PAL_7524_TRESPASS_01_01 " );	// Don't worry! I have come from the castle.
	AI_Output(self,other, " DIA_PAL_7524_TRESPASS_01_02 " );	// Yes? (doubtfully) All right, come on in.
	AI_Output(self,other, " DIA_PAL_7524_TRESPASS_01_03 " );	// Just don't create problems here - we already have enough of them.
};


instance DIA_PAL_7524_PERM2(C_Info)
{
	npc = pal_7524_ritter;
	nr = 3;
	condition = dia_pal_7524_perm2_condition;
	information = dia_pal_7524_perm2_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_pal_7524_perm2_condition()
{
	return TRUE;
};

func void dia_pal_7524_perm2_info()
{
	AI_Output(other,self, " DIA_PAL_7524_Perm2_01_00 " );	// How are things?
	AI_Output(self,other, " DIA_PAL_7524_Perm2_01_01 " );	// So far so good.
	AI_StopProcessInfos(self);
};

