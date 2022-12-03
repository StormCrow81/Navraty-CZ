

instance DIA_SEK_8043_NOVIZE_NOFOREVER (C_Info)
{
	npc = sec_8043_novice;
	nr = 5;
	condition = dia_sek_8043_novice_noforever_condition;
	information = dia_sek_8043_novize_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sek_8043_novize_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sek_8043_novize_noforever_info()
{
	if (Wld_IsTime( 8 , 0 , 21 , 0 ))
	{
		AI_Output(self,other, " DIA_SEK_8043_Novize_NoForever_01_00 " );	// Don't distract me from work!
		AI_Output(self,other, " DIA_SEK_8043_Novize_NoForever_01_01 " );	// If you need something, talk to Shret. He is our main.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_SEK_8043_Novize_NoForever_01_02 " );	// Leave me alone!
		AI_StopProcessInfos(self);
	};
};

