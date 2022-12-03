

instance DIA_SEK_8041_NOVIZE_NOFOREVER (C_Info)
{
	npc = sec_8041_novice;
	nr = 5;
	condition = dia_sek_8041_novice_noforever_condition;
	information = dia_sek_8041_novize_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sek_8041_novize_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sek_8041_novize_noforever_info()
{
	if (Wld_IsTime( 8 , 0 , 21 , 0 ))
	{
		AI_Output(self,other, " DIA_SEK_8041_Novize_NoForever_01_00 " );	// Don't distract me from work!
		AI_Output(self,other, " DIA_SEK_8041_Novize_NoForever_01_01 " );	// If you need something, talk to Balam. He's in charge here.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_SEK_8041_Novize_NoForever_01_02 " );	// Back off! Don't let me rest...
		AI_StopProcessInfos(self);
	};
};

