
instance DIA_Addon_Tom_EXIT(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 999;
	condition = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Tom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Tom_PICKPOCKET(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 900;
	condition = DIA_Addon_Tom_PICKPOCKET_Condition;
	information = DIA_Addon_Tom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Tom_PICKPOCKET_Condition()
{
	return  C_Robbery ( 40 , 52 );
};

func void DIA_Addon_Tom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET,Dialog_Back,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};

func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};


instance DIA_Addon_Tom_HI(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 1;
	condition = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent = FALSE;
	description = " Why are you hanging around here? " ;
};


func int DIA_Addon_Tom_HI_Condition()
{
	if(TOM_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_HI_Info()
{
	AI_Output(other,self, " DIA_Addon_Tom_HI_15_00 " );	// Why are you stuck here?
	AI_Output(self,other, " DIA_Addon_Tom_HI_11_01 " );	// I'm in trouble. For now, I'd better not show up at the camp.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//What's wrong?
	AI_Output(self,other, " DIA_Addon_Tom_HI_11_03 " );	// I had a good relationship with the pirates, you know?
	AI_Output(self,other, " DIA_Addon_Tom_HI_11_04 " );	// I always met the guys near the camp and traded with them.
	AI_Output(self,other, " DIA_Addon_Tom_HI_11_05 " );	// I bought half of the camp! 'Tom bring me this, Tom bring me that'.
	AI_Output(self,other, " DIA_Addon_Tom_HI_11_06 " );	// And then that bastard Esteban intervened.
};


instances of DIA_Addon_Tom_Juan (C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 2;
	condition = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent = FALSE;
	description = " What happened? " ;
};


func int DIA_Addon_Tom_Juan_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Tom_HI ) && ( TOM_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Tom_Juan_Info()
{
	AI_Output(other,self, " DIA_Addon_Tom_Juan_15_00 " );	// What happened?
	AI_Output(self,other, " DIA_Addon_Tom_Juan_11_01 " );	// Esteban sent one of his guys - Juan. This bastard ambushed us.
	AI_Output(self,other, " DIA_Addon_Tom_Juan_11_02 " );	// I was just about to make a deal with the pirates when he popped out of the darkness and knocked me down with two punches!
	AI_Output(self,other, " DIA_Addon_Tom_Juan_11_03 " );	// That guy is so fast! But not fast enough. I managed to get away from him.
	SC_Knows_JuanMurderedAngus = TRUE;
	B_LogEntry(TOPIC_Addon_KillJuan, " Hank and Angus were waylaid and killed by Juan. " );
};


instance DIA_Addon_Tom_Esteban(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 3;
	condition = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent = FALSE;
	description = " And you've been sitting here since then? " ;
};


func int DIA_Addon_Tom_Esteban_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Tom_Juan ) && ( TOM_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Tom_Esteban_Info()
{
	AI_Output(other,self, " DIA_Addon_Tom_Esteban_15_00 " );	// And since then you've been sitting here?
	AI_Output(self,other, " DIA_Addon_Tom_Esteban_11_01 " );	// First I went to the camp and told Fisk, Huno and the others that they might forget their orders.
	AI_Output(self,other, " DIA_Addon_Tom_Esteban_11_02 " );	// And that Esteban is to blame.
	AI_Output(self,other, " DIA_Addon_Tom_Esteban_11_03 " );	// But if Esteban finds out that it was me who told everyone that HE was to blame, I can say goodbye.
	AI_Output(self,other, " DIA_Addon_Tom_Esteban_11_04 " );	// That's why I can't go back to the camp.
	Tom_Tells = TRUE;
};


instance DIA_Addon_Tom_Dead(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 4;
	condition = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent = FALSE;
	description = " Esteban is dead. " ;
};


func int DIA_Addon_Tom_Dead_Condition()
{
	if ( Npc_IsDead ( Stephen ) && Npc_KnowsInfo ( other , DIA_Addon_Tom_Stephen ) & & ( TOM_TP  ==  FALSE )) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Tom_Dead_Info()
{
	AI_Output(other,self, " DIA_Addon_Tom_Dead_15_00 " );	// Esteban is dead.
	AI_Output(self,other, " DIA_Addon_Tom_Dead_11_01 " );	// What? My friend, I love you!
	AI_Output(self,other, " DIA_Addon_Tom_Dead_11_02 " );	// Was it you?
	AI_Output(other,self, " DIA_Addon_Tom_Dead_15_03 " );	// Maybe, maybe not...
	AI_Output(self,other, " DIA_Addon_Tom_Dead_11_04 " );	// Thank you for telling me. Now I can go back to camp...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_Addon_Tom_PERM(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 5;
	condition = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent = TRUE;
	description = " What else? " ;
};


func int DIA_Addon_Tom_PERM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Tom_Stephen ) && ( TOM_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//What else?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other, " DIA_Addon_Tom_PERM_11_01 " );	// Now I can safely drink Lucia's brew.
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Tom_Dead))
	{
		AI_Output(self,other, " DIA_Addon_Tom_PERM_11_02 " );	// Now I can finally show myself in the camp!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Tom_PERM_11_03 " );	// Otherwise, I'd be sitting here and counting stones...
	};
};


instance DIA_ADDON_TOM_ORCINVASION(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 5;
	condition = dia_addon_tom_orcinvasion_condition;
	information = dia_addon_tom_orcinvasion_info;
	permanent = TRUE;
	description = " I heard you helped the guys... " ;
};


func int dia_addon_tom_orcinvasion_condition()
{
	if (( TOM_TP  ==  TRUE ) &&  ! Npc_KnowsInfo(other,dia_addon_tom_orconversion))
	{
		return TRUE;
	};
};

func void dia_addon_tom_orcinvasion_info()
{
	AI_Output(other,self, " DIA_Addon_Tom_OrcInvasion_01_01 " );	// I heard you helped the guys get out of the camp?
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_02 " );	// Well, yes. Although I don't see anything heroic in it.
	AI_Output(other,self, " DIA_Addon_Tom_OrcInvasion_01_03 " );	// How did you find out about this move?
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_04 " );	// A long time ago. And I stumbled across it quite by accident.
	AI_Output(other,self, " DIA_Addon_Tom_OrcInvasion_01_05 " );	// Got it. Thorus said the orcs took you by surprise?
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_06 " );	// Yes, everything happened so fast... Those orcs fell on us like snow.
	AI_Output(other,self, " DIA_Addon_Tom_OrcInvasion_01_07 " );	// Maybe they just came from the hidden passage?
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_08 " );	// No, I don't think so. They attacked from the swamps.
	AI_Output(other,self, " DIA_Addon_Tom_OrcInvasion_01_09 " );	// And what happened next?
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_10 " );	// The camp is in such a mess! The only one who kept a cool head in this situation was Thorus.
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_11 " );	// He and his guys took up defensive positions at the entrance to the upper plateau of the camp. But there were too many orcs, and they were soon pushed back to the temple.
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_12 " );	// It quickly became clear that we could not hold the camp.
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_13 " );	// Therefore, whoever could - followed me to the passage, while Thorus with the remnants of his guard covered our retreat.
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_14 " );	// As it turned out later, only he managed to escape. All the rest died.
	AI_Output(other,self, " DIA_Addon_Tom_OrcInvasion_01_15 " );	// Terrible.
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_16 " );	// It's good, of course, that we got out of that mess alive. Although I have no idea what we should do now...
	AI_Output(self,other, " DIA_Addon_Tom_OrcInvasion_01_17 " );	// Our camp is the only home we had. We are bandits, people outside the law - where should we go now? And what will happen to us?
	AI_Output(other,self, " DIA_Addon_Tom_OrcInvasion_01_18 " );	// Don't worry. I think Thorus will come up with something.
};

