

func void B_LastWarningVatras()
{
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_ADD_05_00 " );	// Scoundrel, what have you done?
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_ADD_05_01 " );	// The Order of the Water has warned you many times about the danger of being caught in the net of evil.
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_ADD_05_02 " );	// However, I have learned that you have gone astray from the path of all-preserving balance.
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_ADD_05_03 " );	// You killed and robbed everyone and everything. You are guilty of many crimes.
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_ADD_05_04 " );	// Many innocent people died at YOUR hand.
	AI_Output(self,other, " DIA_Addon_Vatras_LastWarning_ADD_05_05 " );	// Now you are an ally of the forces of darkness.
};

func void B_VatrasPissedOff()
{
	AI_Output(self,other, " DIA_Addon_Vatras_PissedOffPerm_Add_05_00 " );	// From now on, you can't count on our help.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_01");	//Убирайся!

	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		Crewmember_Count = Crewmember_Count - 1;
	};

	Vatras_IsOnBoard = LOG_FAILED;
	self.flags = 0;
	VatrasPissedOffForever = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRAY");
};

