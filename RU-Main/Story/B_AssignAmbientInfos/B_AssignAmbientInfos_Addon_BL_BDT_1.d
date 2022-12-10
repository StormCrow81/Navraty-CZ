

instance DIA_Addon_BL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_BL_BDT_1_EXIT_Condition;
	information = DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_BL_BDT_1_Chef(C_Info)
{
	nr = 2;
	condition = DIA_Addon_BL_BDT_1_Chef_Condition;
	information = DIA_Addon_BL_BDT_1_Chef_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};

func int DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_Chef_Info()
{
	AI_Output(other,self, " DIA_Addon_BL_BDT_1_Chef_15_00 " );	// Who's in charge here?
	if(RavenAway == TRUE)
	{
		if (Npc_IsDead(Thorus))
		{
			AI_Output(self,other, " DIA_Addon_BL_BDT_1_Chef_01_01 " );	// So many commanders come and go... You lose sight of them after a while...
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_BL_BDT_1_Chef_01_02 " );	// I think Thorus is in charge now...
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BL_BDT_1_Chef_01_03 " );	// Raven is now our commander. He brought us here and built a camp.
		AI_Output(self,other, " DIA_Addon_BL_BDT_1_Chef_01_04 " );	// He controls the mine, without him everyone would have killed each other for gold scraps a long time ago.
	};
};


instance DIA_Addon_BL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_1_Lager_Condition;
	information = DIA_Addon_BL_BDT_1_Lager_Info;
	permanent = FALSE;
	description = " What do you know about the camp? " ;
};


func int DIA_Addon_BL_BDT_1_Lager_Condition()
{
	if ((slave_escape ==  FALSE ) ||  ! Npc_IsDead(Raven))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BL_BDT_1_Lager_Info()
{
	AI_Output(other,self, " DIA_Addon_BL_BDT_1_Lager_15_00 " );	// What do you know about the camp?
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_Lager_01_01 " );	// After the gold mine became known, the vagrants destroyed each other for it.
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_Lager_01_02 " );	// Then Raven killed the worst of them and threw the rest out of the mine.
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_Lager_01_03 " );	// Since then no one is allowed in the top. He even brought in prisoners to work in the mine.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_BL_BDT_1_Lager2(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_1_Lager2_Condition;
	information = DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent = TRUE;
	description = " What do you know about the camp? " ;
};


func int DIA_Addon_BL_BDT_1_Lager2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BL_BDT_1_Lager))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BL_BDT_1_Lager2_Info()
{
	AI_Output(other,self, " DIA_Addon_BL_BDT_1_Lager2_15_00 " );	// What do you know about the camp?
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_Lager2_01_01 " );	// If you attack someone, they will ALL attack you.
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_Lager2_01_02 " );	// Unless you have a good reason to deal with someone, of course. Then no one will interfere.
};


instance DIA_Addon_BL_BDT_1_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_BL_BDT_1_News_Condition;
	information = DIA_Addon_BL_BDT_1_News_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_News_Info()
{
	AI_Output(other,self, " DIA_Addon_BL_BDT_1_News_15_00 " );	// What's the news?
	if(RavenAway == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_BL_BDT_1_News_01_01 " );	// They say that Raven disappeared somewhere. What are we to do now?
	};
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_News_01_02 " );	// The pirates won't want to take us to the mainland because they haven't been paid for the last few trips.
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_News_01_03 " );	// We should slaughter one or two, then the rest will fall in line.
};


instance DIA_Addon_BL_BDT_1_slaves (C_Info)
{
	nr = 5;
	condition = DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information = DIA_Addon_BL_BDT_1_Slave_Info;
	permanent = TRUE;
	description = " What do you know about prisoners? " ;
};


func int DIA_Addon_BL_BDT_1_Sklaven_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_BL_BDT_1_Store) && ((Slave_Flucht ==  FALSE ) || (RavenAway ==  FALSE )))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BL_BDT_1_Sklaven_Info()
{
	AI_Output(other,self, " DIA_Addon_BL_BDT_1_Sklaven_15_00 " );	// What do you know about the prisoners?
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_Sklaven_01_01 " );	// Raven wants to dig up something. At first it was the robbers who did it, but too many died.
	AI_Output(self,other, " DIA_Addon_BL_BDT_1_Sklaven_01_02 " );	// That's why he brought the prisoners - if they croak, it's okay.
	if (BDT_1_dig out ==  FALSE )
	{
		AI_Output(other,self, " DIA_Addon_BL_BDT_1_Sklaven_15_03 " );	// What does Raven want to dig up?
		AI_Output(self,other, " DIA_Addon_BL_BDT_1_Sklaven_01_04 " );	// No idea, but obviously it's not just about the gold.
		BDT_1_Ausbuddeln = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_1(var C_Npc slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Slave.npc = Help_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc = Hlp_GetInstanceID(slf);
};

