
instance DIA_SEK_8042_NOVIZE_NOFOREVER (C_Info)
{
	npc = sec_8042_novice;
	nr = 5;
	condition = dia_sek_8042_noize_noforever_condition;
	information = dia_sek_8042_novize_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sek_8042_novize_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sek_8042_novize_noforever_info()
{
	if (Wld_IsTime( 8 , 0 , 21 , 0 ))
	{
		AI_Output(self,other, " DIA_SEK_8042_Novize_NoForever_01_00 " );	// Don't interfere with my work!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_SEK_8042_Novize_NoForever_01_01 " );	// Back off! Don't let me rest...
		AI_StopProcessInfos(self);
	};
};
