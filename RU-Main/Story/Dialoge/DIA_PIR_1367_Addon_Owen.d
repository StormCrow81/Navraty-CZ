

instance DIA_Addon_Owen_EXIT(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 999;
	condition = DIA_Addon_Owen_EXIT_Condition;
	information = DIA_Addon_Owen_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Owen_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Owen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Owen_PICKPOCKET(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 900;
	condition = DIA_Addon_Owen_PICKPOCKET_Condition;
	information = DIA_Addon_Owen_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Owen_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 30 );
};

func void DIA_Addon_Owen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET,Dialog_Back,DIA_Addon_Owen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Owen_PICKPOCKET_DoIt);
};

func void DIA_Addon_Owen_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};

func void DIA_Addon_Owen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};


instance DIA_Addon_Owen_Hello(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 1;
	condition = DIA_Addon_Owen_Hello_Condition;
	information = DIA_Addon_Owen_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Owen_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Owen_Hello_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//Как дела?
	AI_Output(self,other, " DIA_Addon_Owen_Hello_13_01 " );	// Who are you? One of the bandits?
	AI_Output(other,self, " DIA_Addon_Owen_Hello_15_02 " );	// What does it look like?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_PIR_M_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_L_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_H_Addon) == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Owen_Hello_13_03 " );	// You're dressed the same as we are, but I don't know you.
	}
	else if((Hlp_IsItem(itm,ItAr_BDT_M) == TRUE) || (Hlp_IsItem(itm,ItAr_BDT_H) == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Owen_Hello_13_04 " );	// Honestly, yes.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Owen_Hello_13_05 " );	// No. Judging by your clothes, you're from afar.
	};
};


instance DIA_Addon_Owen_WasMachen (C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 2;
	condition = DIA_Addon_Owen_WasMachen_Condition;
	information = DIA_Addon_Owen_WasMachen_Info;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Owen_WasMachen_Condition()
{
	if(Malcom_Accident == FALSE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Owen_WasMachen_Info()
{
	AI_Output(other,self, " DIA_Addon_Owen_WasMachen_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Owen_WasMachen_13_01 " );	// Chopping trees for our camp.
	AI_Output(self,other, " DIA_Addon_Owen_WasMachen_13_02 " );	// I work like hell here, bending my back, and they are lying in the sun in the camp.
};


instance DIA_Addon_Owen_Perm(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 99;
	condition = DIA_Addon_Owen_Perm_Condition;
	information = DIA_Addon_Owen_Perm_Info;
	permanent = TRUE;
	description = "И?";
};


func int DIA_Addon_Owen_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_WasMachen) || Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Owen_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//И?
	AI_Output(self,other, " DIA_Addon_Owen_Perm_13_01 " );	// If I'd known it would be like this, I wouldn't have become a pirate for anything.
};


instance DIA_Addon_Owen_Henry(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 3;
	condition = DIA_Addon_Owen_Henry_Condition;
	information = DIA_Addon_Owen_Henry_Info;
	permanent = TRUE;
	description = " Henry needs wood. " ;
};


func int DIA_Addon_Owen_Henry_Condition()
{
	if((MIS_Henry_HolOwen == LOG_Running) && (Owen_ComesToHenry == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Owen_Henry_Info()
{
	AI_Output(other,self, " DIA_Addon_Owen_Henry_15_00 " );	// Henry needs a tree.
	if(MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Owen_Henry_13_01 " );	// First I have to find out what happened to my friend Malcolm.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Owen_Henry_13_02 " );	// Relax. He will get his tree sooner or later.
		AI_Output(self,other, " DIA_Addon_Owen_Henry_13_03 " );	// Tell him so.
		B_LogEntry(TOPIC_Addon_HolOwen, " I should tell Henry that Owen will deliver the tree. " );
		AI_StopProcessInfos(self);
		Owen_ComesToHenry = TRUE;
	};
};


instance DIA_Addon_Owen_MalcomStunt(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 1;
	condition = DIA_Addon_Owen_MalcomStunt_Condition;
	information = DIA_Addon_Owen_MalcomStunt_Info;
	description = " How are you? " ;
};


func int DIA_Addon_Owen_MalcomStunt_Condition()
{
	if(Malcom_Accident == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Owen_MalcomStunt_Info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomStunt_15_00");	//Как дела?
	AI_Output(self,other, " DIA_Addon_Owen_MalcomStunt_13_01 " );	// My buddy Malcolm is missing.
	AI_Output(self,other, " DIA_Addon_Owen_MalcomStunt_13_02 " );	// We've been attacked by one of those thugs.
	AI_Output(self,other, " DIA_Addon_Owen_MalcomStunt_13_03 " );	// We ran into this cave.
	AI_Output(self,other, " DIA_Addon_Owen_MalcomStunt_13_04 " );	// But the shnyg followed us.
	AI_Output(self,other, " DIA_Addon_Owen_MalcomStunt_13_05 " );	// Malkom started to fight him, and then they both fell into that pit.
	AI_Output(self,other, " DIA_Addon_Owen_MalcomStunt_13_06 " );	// Looks like there's water at the bottom.
	AI_Output(self,other, " DIA_Addon_Owen_MalcomStunt_13_07 " );	// I heard Malcolm fighting the shnyg downstairs. And then everything went quiet.
	AI_Output(self,other, " DIA_Addon_Owen_MalcomStunt_13_08 " );	// I don't know if Malcolm is still alive.
	Log_CreateTopic(TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MalcomsStunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_MalcomsStunt, " Owen wants to know what happened to his friend Malcoms, who fell into a deep hole after having a grub. " );
	Log_AddEntry(TOPIC_Addon_MalcomsStunt, " Owen told me that there was water at the bottom of the pit, and Malcom fell into it at first and was alive. But after a while the noise in the pit subsided. " );
	MIS_Owen_FindMalcom = LOG_Running;
};


instance DIA_Addon_Owen_down (C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 2;
	condition = DIA_Addon_Owen_down_Condition;
	information = DIA_Addon_Owen_down_Info;
	description = " How can I get down to the bottom of the pit? " ;
};

func int DIA_Addon_Owen_down_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt) && (MIS_Owen_FindMalcom == LOG_Running) && (Npc_HasItems(Malcom,ItWr_TwoHStonePlate3_Addon) > 0))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Owen_down_Info()
{
	AI_Output(other,self, " DIA_Addon_Owen_runter_15_00 " );	// How can I get down to the bottom of the pit?
	AI_Output(self,other, " DIA_Addon_Owen_runter_13_01 " );	// I have no idea. Go down the walls or jump off, I guess.
};


instance DIA_Addon_Owen_MalcomDead(C_Info)
{
	npc = PIR_1367_Addon_Owen;
	nr = 3;
	condition = DIA_Addon_Owen_MalcomDead_Condition;
	information = DIA_Addon_Owen_MalcomDead_Info;
	description = " Your buddy Malcom is dead. " ;
};

func int DIA_Addon_Owen_MalcomDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Owen_MalcomStunt) && (MIS_Owen_FindMalcom == LOG_Running) && (Npc_HasItems(Malcom,ItWr_TwoHStonePlate3_Addon) == 0))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Owen_MalcomDead_Info()
{
	AI_Output(other,self, " DIA_Addon_Owen_MalcomDead_15_00 " );	// Your buddy Malcom is dead.
	AI_Output(self,other, " DIA_Addon_Owen_MalcomDead_13_01 " );	// I knew it. Poor fellow. I had to help him.
	if(SC_MadeStunt == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Owen_MalcomDead_13_02 " );	// And you are brave.
		AI_Output(self,other, " DIA_Addon_Owen_MalcomDead_13_03 " );	// There's no way I could go down that hole.
	};
	B_LogEntry(TOPIC_Addon_MalcomsStunt, " I told Owen about Malcom's death. He took the news quite calmly. " );
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Owen_MalcomDead);
};

