
instance DIA_Angar_EXIT (C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 999;
	condition = DIA_Angar_DI_EXIT_Condition;
	information = DIA_Angar_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_HELLO (C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 10;
	condition = DIA_Angar_DI_HALLO_Condition;
	information = DIA_Angar_DI_HALLO_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Angar_DI_HELLO_Condition()
{
	return TRUE;
};

func void DIA_Angar_DI_HALLO_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_HALLO_15_00");	//Как ты?

	if(UndeadDragonIsDead == FALSE)
	{
		AI_Output(self,other, " DIA_Angar_DI_HALLO_04_01 " );	// The headaches have become unbearable.
		AI_Output(self,other, " DIA_Angar_DI_HALLO_04_02 " );	// Damn! This must end sometime.
	}
	else
	{
		AI_Output(self,other, " DIA_Angar_DI_HALLO_04_03 " );	// Don't worry about me. We need to get out of here.
	};
};

instance DIA_Angar_ORKS (C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_ORKS_Condition;
	information = DIA_Angar_DI_ORKS_Info;
	important = TRUE;
};


func int DIA_Angar_ORKS_Condition()
{
	if((ORkSturmDI == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_THE_ORKS_Info()
{
	AI_Output(self,other, " DIA_Angar_DI_ORKS_04_00 " );	// You better hurry up, damn it. The next ork attack could cost us our lives.
	AI_Output(other,self, " DIA_Angar_DI_ORKS_15_01 " );	// I do what I can.
	AI_Output(self,other, " DIA_Angar_DI_ORKS_04_02 " );	// This is not enough.
	Info_ClearChoices(DIA_Angar_DI_ORKS);
	Info_AddChoice(DIA_Angar_DI_ORKS, " Relax. " ,DIA_Angar_DI_ORKS_no);
	Info_AddChoice(DIA_Angar_DI_ORKS, " So help me... " ,DIA_Angar_DI_ORKS_follow);
};

func void DIA_Angar_THE_ORKS_follow()
{
	AI_Output(other,self, " DIA_Angar_DI_ORKS_follow_15_00 " );	// So help me and stop whining.
	AI_Output(self,other, " DIA_Angar_DI_ORKS_follow_04_01 " );	// Good. But you go first. Forward!
	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"FollowDI");
	Angar_DI_Party = LOG_Running;
};

func void DIA_Angar_THE_ORKS_no()
{
	AI_Output(other,self, " DIA_Angar_DI_ORKS_no_15_00 " );	// Relax.
	AI_Output(self,other, " DIA_Angar_DI_ORKS_no_04_01 " );	// It's easy for you to talk. And I'm about to lose my mind here.
	AI_StopProcessInfos(self);
};


instance DIA_Angar_FOLLOW (C_Info) .
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOW_Condition;
	information = DIA_Angar_DI_FOLLOW_Info;
	permanent = TRUE;
	description = " Stay where you are. " ;
};


func int DIA_Specific_FOLLOWING_Condition()
{
	if(Angar_DI_Party == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Angar_FOLLOWING_Info()
{
	AI_Output(other,self, " DIA_Angar_DI_FOLLOW_15_00 " );	// Stay where you are.
	if(Npc_GetDistToWP(self,"SKELETTE") < 4000)
	{
		AI_Output(other, self, " DIA_Angar_DI_FOLLOW_15_01 " );	// I'll take care of the rest.
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_02");	//Удачи.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		Angar_DI_Party = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_03");	//Конечно.
		AI_StopProcessInfos(self);
		if(Npc_GetDistToWP(self,"SHIP") < 10000)
		{
			Npc_ExchangeRoutine(self,"Start");
		}
		 else if ( Npc_IsDead (FireDragonIsland))
		{
			Npc_ExchangeRoutine(self,"FireDragonIsland");
		}
		 else if ( Npc_IsDead (OrkElite_AntiPaladinOrkOberst_DI))
		{
			Npc_ExchangeRoutine(self,"ORKOBERST_DI");
		}
		 else if ( Npc_IsDead (Troll_DI))
		{
			Npc_ExchangeRoutine(self,"Troll_DI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	Angar_DI_Party = LOG_OBSOLETE;
};


instance DIA_Angar_IN_FOLLOWGAIN (C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOWAGAIN_Condition;
	information = DIA_Angar_DI_FOLLOWAGAIN_Info;
	permanent = TRUE;
	description = " Follow me. " ;
};


func int DIA_Angar_DI_FOLLOWGAIN_Condition()
{
	if(Angar_DI_Party == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWAGAIN_Info()
{
	AI_Output(other,self, " DIA_Angar_DI_FOLLOWAGAIN_15_00 " );	// Follow me.
	AI_Output(self,other, " DIA_Angar_DI_FOLLOWAGAIN_04_01 " );	// You go first.
	Angar_DI_Party = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowDI");
};


instance DIA_Angar_FOLLOWSTOP (C_Info) .
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOWSTOP_Condition;
	information = DIA_Angar_DI_FOLLOWSTOP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Specific_FOLLOWSTOP_Condition()
{
	if((Angar_DI_Party == LOG_Running) && (((Npc_GetDistToWP(self,"DI_DRACONIANAREA_FIREDRAGON") < 3000) && (Npc_IsDead(FireDragonIsland) == FALSE)) || (Npc_GetDistToWP(self,"SKELETTE") < 3000)))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWSTOP_Info()
{
	AI_Output(self,other, " DIA_Angar_DI_FOLLOWSTOP_04_00 " );	// Ahhh! This headache is driving me crazy!
};


instances DIA_Angar_DI_UNDEADDRGDEAD (C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 2;
	condition = DIA_Angar_DI_UNDEADDRGDEAD_Condition;
	information = DIA_Angar_DI_UNDEADDRGDEAD_Info;
	description = " It's over. " ;
};


func int DIA_Angar_DI_UNDEADDRGDEAD_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(other,self, " DIA_Angar_DI_UNDEADDRGDEAD_15_00 " );	// It's over.
	AI_Output(self,other, " DIA_Angar_DI_UNDEADDRGDEAD_04_01 " );	// Can we finally get out of here?
	AI_Output(other,self, " DIA_Angar_DI_UNDEADDRGDEAD_15_02 " );	// Yes. Devil committed.
	AI_Output(self,other, " DIA_Angar_DI_UNDEADDRGDEAD_04_03 " );	// Then let's not waste time. Go to the captain and tell him to raise anchor.
	if(SC_KnowsMadPsi == TRUE)
	{
		AI_Output(other,self, " DIA_Angar_DI_UNDEADDRGDEAD_15_04 " );	// I hope no other members of your sect are left alive.
		AI_Output(self,other, " DIA_Angar_DI_UNDEADDRGDEAD_04_05 " );	// Anything is possible. The dark magicians were very powerful. They even almost enslaved me. Who knows?
	};
	AI_Output(other,self, " DIA_Angar_DI_UNDEADDRGDEAD_15_06 " );	// What will you do next?
	AI_Output(self,other, " DIA_Angar_DI_UNDEADDRGDEAD_04_07 " );	// Maybe I'll settle somewhere and become a farmer. I'm tired of fighting.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instances DIA_Angar_DI_PICKPOCKET (C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 900;
	condition = DIA_Angar_DI_PICKPOCKET_Condition;
	information = DIA_Angar_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Angar_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 47 , 45 );
};

func void DIA_Angar_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
	Info_AddChoice(DIA_Angar_DI_PICKPOCKET,Dialog_Back,DIA_Angar_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Angar_DI_PICKPOCKET_DoIt);
};

func void DIA_Angar_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
};

func void DIA_Angar_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
};


instances DIA_Angar_DI_FOUNDAMULETT (C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 7;
	condition = DIA_Angar_DI_FOUNDAMULETT_Condition;
	information = DIA_Angar_DI_FOUNDAMULETT_Info;
	description = " I found your amulet. " ;
};

func int DIA_Angar_DI_FOUNDAMULETT_Condition()
{
	if (Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIER) && (DJG_AngarGotAmulett ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOUNDAMULETT_Info()
{
	B_AngarsAmuletSend();
};
