

instance DIA_Addon_Malcom_EXIT(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 999;
	condition = DIA_Addon_Malcom_EXIT_Condition;
	information = DIA_Addon_Malcom_EXIT_Info;
	permanent = TRUE;
	description = " I have to go. " ;
};


func int DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_EXIT_Info()
{
	AI_Output(other,self, " DIA_Addon_Malcom_perm_15_00 " );	// I have to go.
	if(MalcomBotschaft == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Malcom_perm_04_01 " );	// Don't get caught by predators. It's pretty dangerous here.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Malcom_Add_04_03 " );	// Hey! When you get to our camp, give Henry something for me.
		AI_Output(self,other, " DIA_Addon_Malcom_Lager_04_04 " );	// Tell him the trees here are damn hard.
		AI_Output(self,other, " DIA_Addon_Malcom_Lager_04_05 " );	// He'll have to wait.
		MalcomBotschaft = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Malcom_PICKPOCKET(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 900;
	condition = DIA_Addon_Malcom_PICKPOCKET_Condition;
	information = DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 30 );
};

func void DIA_Addon_Malcom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET,Dialog_Back,DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};

func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};


instance DIA_Addon_Malcom_Hello(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 1;
	condition = DIA_Addon_Malcom_Hello_Condition;
	information = DIA_Addon_Malcom_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Malcom_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info()
{
	AI_Output(self,other, " DIA_Addon_Malcom_Hello_04_01 " );	// You're not from here, right?
	AI_Output(self,other, " DIA_Addon_Malcom_Hello_04_02 " );	// Looks like you've come a long way.
};


instance DIA_Addon_Malcom_WasMachen (C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 2;
	condition = DIA_Addon_Malcom_WasMachen_Condition;
	information = DIA_Addon_Malcom_WasMachen_Info;
	description = " Are you busy? " ;
};


func int DIA_Addon_Malcom_WasMachen_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_WasMachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//Ты занят?
	AI_Output(self,other, " DIA_Addon_Malcom_WasMachen_04_01 " );	// And don't ask... Henry wants me to cut down all those trees.
	if(Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//Генри?
		AI_Output(self,other, " DIA_Addon_Malcom_Add_04_00 " );	// He commands our group.
	};
	AI_Output(self,other, " DIA_Addon_Malcom_WasMachen_04_04 " );	// Constantly stands at the gates of the camp and rants.
	AI_Output(self,other, " DIA_Addon_Malcom_WasMachen_04_05 " );	// Says that one must selflessly work for the good of society and all that.
	AI_Output(self,other, " DIA_Addon_Malcom_WasMachen_04_06 " );	// But he doesn't lift a finger himself.
};


instance DIA_Addon_Malcom_Entertrupp(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 5;
	condition = DIA_Addon_Malcom_Entertrupp_Condition;
	information = DIA_Addon_Malcom_Entertrupp_Info;
	description = " Is Henry your commander? " ;
};


func int DIA_Addon_Malcom_Entertrupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Malcom_Entertrupp_Info()
{
	AI_Output(other,self, " DIA_Addon_Malcom_Entertrupp_15_00 " );	// Henry is your commander?
	AI_Output(self,other, " DIA_Addon_Malcom_WasMachen_04_03 " );	// Yes, the commander of our combat squad.
	AI_Output(self,other, " DIA_Addon_Malcom_Add_04_01 " );	// And our captain's name is Greg.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Malcom_Add_04_02 " );	// But he's not here now.
	};
};


instance DIA_Addon_Malcom_Lager(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 3;
	condition = DIA_Addon_Malcom_Lager_Condition;
	information = DIA_Addon_Malcom_Lager_Info;
	description = " Where is your camp? " ;
};


func int DIA_Addon_Malcom_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Malcom_Lager_Info()
{
	AI_Output(other,self, " DIA_Addon_Malcom_Lager_15_00 " );	// Where is your camp?
	AI_Output(self,other, " DIA_Addon_Malcom_Lager_04_01 " );	// Keep following this road to the west.
	AI_Output(self,other, " DIA_Addon_Malcom_Lager_04_02 " );	// Pretty soon you'll see Henry.
};

