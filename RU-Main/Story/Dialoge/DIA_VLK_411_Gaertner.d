

instance DIA_Gaertner_EXIT(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 999;
	condition = DIA_Gaertner_EXIT_Condition;
	information = DIA_Gaertner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gaertner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gaertner_PICKPOCKET(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 900;
	condition = DIA_Gaertner_PICKPOCKET_Condition;
	information = DIA_Gaertner_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gaertner_PICKPOCKET_Condition()
{
	return  C_Robbery ( 40 , 50 );
};

func void DIA_Gaertner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,Dialog_Back,DIA_Gaertner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gaertner_PICKPOCKET_DoIt);
};

func void DIA_Gaertner_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};

func void DIA_Gaertner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};


instance DIA_Gaertner_Job(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Job_Condition;
	information = DIA_Gaertner_Job_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_Job_Info()
{
	AI_Output(other,self, " DIA_Gaertner_Job_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Gaertner_Job_09_01 " );	// What do you think? I am a gardener and take care of this garden.
	AI_Output(other,self, " DIA_Gaertner_Job_15_02 " );	// Do you seem to be quite satisfied with life?
	AI_Output(self,other, " DIA_Gaertner_Job_09_03 " );	// Yes! And I would like it to stay that way.
	AI_Output(self,other, " DIA_Gaertner_Job_09_04 " );	// Once upon a time they even wanted to send me to the colony for killing one guy.
	AI_Output(self,other, " DIA_Gaertner_Job_09_05 " );	// But Larius, the head of the city, needed a gardener, and they left me here.
	AI_Output(self,other, " DIA_Gaertner_Job_09_06 " );	// Over time, this garden became my home! And I'm quite happy with it.
};

instance DIA_Gaertner_Escape(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Escape_Condition;
	information = DIA_Gaertner_Escape_Info;
	permanent = FALSE;
	description = " Have you tried to escape from here? " ;
};

func int DIA_Gaertner_Escape_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Escape_Info()
{
	AI_Output(other,self, " DIA_Gaertner_Escape_01_00 " );	// Have you tried to escape from here?
	AI_Output(self,other, " DIA_Gaertner_Escape_01_01 " );	// I thought about that too at first! But then he decided to abandon this idea.
	AI_Output(self,other, " DIA_Gaertner_Escape_01_02 " );	// First of all, all the guards know me personally, and I won't even be able to go beyond the upper quarter.
	AI_Output(self,other, " DIA_Gaertner_Escape_01_03 " );	// Secondly, given all these rumors about orcs, I prefer to stay close to the paladins.
	AI_Output(self,other, " DIA_Gaertner_Escape_01_04 " );	// And thirdly, I have nowhere to run!
	AI_Output(self,other, " DIA_Gaertner_Escape_01_05 " );	// Therefore, whatever one may say, I'll be better off here than with a pick in my hands in the paladin mines.
	AI_Output(other,self, " DIA_Gaertner_Escape_01_06 " );	// I understand you perfectly.
};

instance DIA_Gaertner_Plants(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Plants_Condition;
	information = DIA_Gaertner_Plants_Info;
	permanent = FALSE;
	description = " Do you grow any herbs? " ;
};

func int DIA_Gaertner_Plants_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Plants_Info()
{
	AI_Output(other,self, " DIA_Gaertner_Plants_15_00 " );	// Do you grow any herbs?
	AI_Output(self,other, " DIA_Gaertner_Plants_09_01 " );	// Yes, a little. I grow fire grass and fire nettles. I also tried to plant marsh grass, but it did not take root here.
	AI_Output(self,other, " DIA_Gaertner_Plants_09_02 " );	// I just harvested the grown! So if you want to buy something...
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, "The gardener can sell me some plants. " );
};

instance DIA_Gaertner_Trade(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Trade_Condition;
	information = DIA_Gaertner_Trade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};


func int DIA_Gaertner_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Plants))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Gaertner_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};


instance DIA_Gaertner_Krautabak (C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Krautabak_Condition;
	information = DIA_Gaertner_Krautabak_Info;
	permanent = FALSE;
	description = " I have herbal tobacco. " ;
};


func int DIA_Gaertner_Krautabak_Condition()
{
	if ((Npc_HasItems(other,ItMi_SumpfTabak) >=  1 ) && Wld_IsTime( 6 , 45 , 21 , 45 ))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Krautabak_Info()
{
	AI_Output(other,self, " DIA_Gaertner_Krautabak_15_00 " );	// I have herbal tobacco. Do you want to stretch?
	AI_Output(self,other, " DIA_Gaertner_Krautabak_09_01 " );	// I don't even know... Oh, okay, let's go. I smoke a little.
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	Npc_RemoveInvItems(self,ItMi_SumpfTabak,1);
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other, " DIA_Gaertner_Krautabak_09_02 " );	// Hha... kha-kha...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Gaertner_Krautabak_09_03 " );	// Vigorous thing! Something made me want to smoke it.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Gaertner_Sign(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_Sign_Condition;
	information = DIA_Gaertner_Sign_Info;
	permanent = FALSE;
	description = " (Show thief alert) " ;
};

func int DIA_Gaertner_Sign_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other, " DIA_Gaertner_Sign_09_00 " );	// Now you're one of us and I can give you some information.
	AI_Output(self,other, " DIA_Gaertner_Sign_09_01 " );	// Some houses here have secret panels that are opened by hidden switches.
	AI_Output(self,other, " DIA_Gaertner_Sign_09_02 " );	// People keep their most valuable things there.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
};

instance DIA_Gaertner_HelpThings(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_HelpThings_condition;
	information = DIA_Gaertner_HelpThings_info;
	permanent = FALSE;
	description = " Is there anything I can help you with? " ;
};

func int DIA_Gaertner_HelpThings_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gaertner_Sign) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaertner_HelpThings_info()
{
	AI_Output(other,self, " DIA_Gaertner_HelpThings_01_00 " );	// Is there anything I can help you with?
	AI_Output(self,other, " DIA_Gaertner_HelpThings_01_01 " );	// Of course, brother. As you can see, all I do all day long is hang around here.
	AI_Output(self,other, " DIA_Gaertner_HelpThings_01_02 " );	// The guards don't even let me out of the town hall fence.
	AI_Output(self,other, " DIA_Gaertner_HelpThings_01_03 " );	// Therefore, my life is devoid of even the simplest pleasures.
	AI_Output(self,other, " DIA_Gaertner_HelpThings_01_04 " );	// However, if you could only bring me a few bottles of gin and some bogweed...
	AI_Output(other,self, " DIA_Gaertner_HelpThings_01_05 " );	// I understand. How much do you need?
	AI_Output(self,other, " DIA_Gaertner_HelpThings_01_06 " );	// (thoughtfully) I think three bottles and five stems will be enough. I don't have anywhere else to hide.
	AI_Output(other,self, " DIA_Gaertner_HelpThings_01_07 " );	// Okay, I'll get them for you.
	MIS_GaertnerHive = LOG_Running;
	Log_CreateTopic(TOPIC_GaertnerHive,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GaertnerHive,LOG_Running);
	B_LogEntry(TOPIC_GaertnerHive, " The gardener asked for three bottles of gin and five joints of bogweed. " );
};

instance DIA_Gaertner_HelpThings_Done(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_HelpThings_Done_condition;
	information = DIA_Gaertner_HelpThings_Done_info;
	permanent = FALSE;
	description = " I brought what you asked for. " ;
};

func int DIA_Gaertner_HelpThings_Done_condition()
{
	if((MIS_GaertnerHive == LOG_Running) && (Npc_HasItems(other,ItFo_Booze) >= 3) && (Npc_HasItems(other,ItMi_Joint) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_HelpThings_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Gaertner_HelpThings_Done_01_00 " );	// I brought what you asked for.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItFo_Booze,3);
	Npc_RemoveInvItems(hero,ItMi_Joint,5);
	AI_Output(self,other, " DIA_Gaertner_HelpThings_Done_01_01 " );	// (pretty) Finally. Well, now I'm in your debt, mate.
	AI_Output(self,other, " DIA_Gaertner_HelpThings_Done_01_02 " );	// How can I thank you...
	AI_Output(self,other, " DIA_Gaertner_HelpThings_Done_01_03 " );	// Listen... one day, while cutting the grass near the entrance to the town hall, I found this key.
	AI_Output(self,other, " DIA_Gaertner_HelpThings_Done_01_04 " );	// Looks like it was dropped by one of the paladins.
	AI_Output(self,other, " DIA_Gaertner_HelpThings_Done_01_05 " );	// To be honest, I don't know which chest it opens.
	AI_Output(self,other, " DIA_Gaertner_HelpThings_Done_01_06 " );	// But for sure there will be something to profit from.
	B_GiveInvItems(self,other,ItKe_PaladinTruhe,1);
	MIS_GaertnerHive = LOG_Success;
	Log_SetTopicStatus(TOPIC_GaertnerHive,LOG_Success);
	B_LogEntry(TOPIC_GaertnerHive, " I brought a gin and a bogweed to the gardener. For that, he gave me some strange key. Apparently, from the chest... " );
};

instance DIA_GAERTNER_ENTERHALL(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = dia_gaertner_enterhall_condition;
	information = dia_gaertner_enterhall_info;
	permanent = FALSE;
	description = " Do you know how to get to the town hall? " ;
};

func int dia_gaertner_enterhall_condition()
{
	if (( MY_ORUNPACKET  == LOG_Running ) && Npc_KnowsInfo ( hero , DIA_Gaertner_Sign ) && ( MeetLarius ==  FALSE )) .
	{
		return TRUE;
	};
};

func void dia_gaertner_enterhall_info()
{
	AI_Output(other,self, " DIA_Gaertner_EnterHall_01_00 " );	// Do you happen to know how to get to the town hall?
	AI_Output(self,other, " DIA_Gaertner_EnterHall_01_01 " );	// Why do you need to go there?
	AI_Output(other,self, " DIA_Gaertner_EnterHall_01_02 " );	// I need to urgently meet with Larius, the mayor of Khorinis. I have a little thing for him.
	AI_Output(self,other, " DIA_Gaertner_EnterHall_01_03 " );	// Ha! Forget it man. The paladins won't let you in anyway.
	AI_Output(self,other, " DIA_Gaertner_EnterHall_01_04 " );	// Unless, of course, you are in the service of the king.
	AI_Output(other,self, " DIA_Gaertner_EnterHall_01_05 " );	// Well, is there any other way to meet him?
	AI_Output(self,other, " DIA_Gaertner_EnterHall_01_06 " );	// Well, there is one way, of course. More precisely, this is not even a way, I would say.
	AI_Output(self,other, " DIA_Gaertner_EnterHall_01_07 " );	// Recently, I began to notice that Larius sometimes began to leave his residence.
	AI_Output(self,other, " DIA_Gaertner_EnterHall_01_08 " );	// Goes out, so to speak, to take a walk and get some fresh air. Are you savvy?
	AI_Output(other,self, " DIA_Gaertner_EnterHall_01_09 " );	// Approximately when does he do this?
	AI_Output(self,other, " DIA_Gaertner_EnterHall_01_10 " );	// I can't say exactly, but I think it's around noon.
	AI_Output(other,self, " DIA_Gaertner_EnterHall_01_11 " );	// Thanks, I got it.
	AI_Output(self,other, " DIA_Gaertner_EnterHall_01_12 " );	// No reason. (laughs)
	B_LogEntry( TOPIC_ORUNPACKET , "The gardener told me that Larius sometimes goes out for some fresh air. Usually around noon. " );
};
