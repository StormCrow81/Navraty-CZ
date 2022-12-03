

instance DIA_ADDON_GREG_BF_EXIT(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 999;
	condition = dia_addon_greg_bf_exit_condition;
	information = dia_addon_greg_bf_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_greg_bf_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_BF_PICKPOCKET(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 900;
	condition = dia_addon_greg_bf_pickpocket_condition;
	information = dia_addon_greg_bf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_greg_bf_pickpocket_condition()
{
	return  C_Robbery ( 111 , 666 );
};

func void dia_addon_greg_bf_pickpocket_info()
{
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
	Info_AddChoice(dia_addon_greg_bf_pickpocket,Dialog_Back,dia_addon_greg_bf_pickpocket_back);
	Info_AddChoice(dia_addon_greg_bf_pickpocket,DIALOG_PICKPOCKET,dia_addon_greg_bf_pickpocket_doit);
};

func void dia_addon_greg_bf_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
};

func void dia_addon_greg_bf_pickpocket_back()
{
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
};


instance DIA_ADDON_GREG_BF_ARMOR(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_armor_condition;
	information = dia_addon_greg_bf_armor_info;
	permanent = FALSE;
	description = " Well, isn't the armor too tight? " ;
};


func int dia_addon_greg_bf_armor_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_armor_info()
{
	AI_Output(other,self, " DIA_Addon_Greg_BF_Armor_01_00 " );	// Well, the armor doesn't hurt?
	AI_Output(self,other, " DIA_Addon_Greg_BF_Armor_01_01 " );	// And you'll make a joke, joker... (maliciously) No, they're just right for me!
	AI_Output(self,other, " DIA_Addon_Greg_BF_Armor_01_02 " );	// By the way, I want to thank you for convincing me to accept the paladins' offer back then.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Armor_01_03 " );	// Now we have something to fill our belly, and in our pockets there are ringing coins!
	AI_Output(self,other, " DIA_Addon_Greg_BF_Armor_01_04 " );	// Although, of course... now we'll all have to fight the orcs soon.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Armor_01_05 " );	// But I think we'll get through this somehow.
};


instance DIA_ADDON_GREG_BF_HOW(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_how_condition;
	information = dia_addon_greg_bf_how_info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int dia_addon_greg_bf_how_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_how_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BF_How_01_00");	//Как дела?
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ADDON_GREG_BF_CAPITAN(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_capitan_condition;
	information = dia_addon_greg_bf_capitan_info;
	permanent = FALSE;
	description = " So you're the captain now? " ;
};


func int dia_addon_greg_bf_capitan_condition()
{
	if((GREGISCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_bf_capitan_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Greg_BF_Capitan_01_00 " );	// So you're the captain of the royal galley now?
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_01 " );	// (important) Yes, Lord Hagen appointed me to this position.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_02 " );	// True, he had no choice in this matter. After all, as you remember, he promised us his ship.
	AI_Output(other,self, " DIA_Addon_Greg_BF_Capitan_01_03 " );	// And, apparently, he kept his promise.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_04 " );	// Well, yes, as you can see... (grouchily) Although, to tell the truth, this is not quite what I really expected.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_05 " );	// Why are you even asking?
	AI_Output(other,self, " DIA_Addon_Greg_BF_Capitan_01_06 " );	// I need to sail to the mainland immediately. Command of the Paladin Master!
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_07 " );	// (relieved) Finally! Otherwise, I thought I would have to hang around on this farm forever.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_08 " );	// And when do we weigh anchor?
	AI_Output(other,self, " DIA_Addon_Greg_BF_Capitan_01_09 " );	// Right now.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_10 " );	// Good. Then I go to the harbor to prepare the ship for sailing.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_11 " );	// Yes, and don't forget. I'll need a few more people to somehow manage this vessel.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_12 " );	// I guess five or six people would be enough!
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_13");	//Ладно.
	AI_Output(self,other, " DIA_Addon_Greg_BF_Capitan_01_14 " );	// Great! Then we'll meet on the ship.
	B_LogEntry( TOPIC_SALETOBIGLAND , " Greg is now my captain. However, I'll need a few more people to sail. According to Greg, five or six people will be enough. " );
	WHOTRAVELONBIGLAND = TRUE;
	b_piratemoveonboard();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_BF_TRAVELONBIGLAND(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 1;
	condition = dia_addon_greg_bf_travelonbigland_condition;
	information = dia_addon_greg_bf_travelonbigland_info;
	permanent = TRUE;
	description = " Is my ship ready? " ;
};


func int dia_addon_greg_bf_travelonbigland_condition()
{
	if((GREGISCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE) && (WHOTRAVELONBIGLAND == TRUE) && (COUNTTRAVELONBIGLAND > 0) && (ALLSAYGOODBUY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_bf_travelonbigland_info()
{
	AI_Output(other,self, " DIA_Addon_Greg_BF_TravelOnBigLand_01_00 " );	// Is my ship ready?

	if(COUNTTRAVELONBIGLAND >= 5)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other, " DIA_Addon_Greg_BF_TravelOnBigLand_01_01 " );	// Of course. All is ready.
		AI_Output(other,self, " DIA_Addon_Greg_BF_TravelOnBigLand_01_02 " );	// Well, if so, then we can sail.
		AI_Output(self,other, " DIA_Addon_Greg_BF_TravelOnBigLand_01_03 " );	// Are you sure about this?
		AI_Output(other,self, " DIA_Addon_Greg_BF_TravelOnBigLand_01_04 " );	// Yes. Time does not wait.
		AI_Output(self,other, " DIA_Addon_Greg_BF_TravelOnBigLand_01_05 " );	// Good. As you wish.
		AI_TurnToNPC(self,DiegoNW);
		AI_Output(self,other, " DIA_Addon_Greg_BF_TravelOnBigLand_01_06 " );	// ...(shouting) Hey, all you land rats! Well, in places!
		AI_Output(self,other, " DIA_Addon_Greg_BF_TravelOnBigLand_01_07 " );	// ...(shouting) Raise the anchor, give up the mooring lines, set the sails!
		AI_Output(self,other, " DIA_Addon_Greg_BF_TravelOnBigLand_01_08 " );	// ...(shouting) Secure knots and winch! Keep your nose to the wind!
		ALLSAYGOODBUY = TRUE;
		MIS_SALETOBIGLAND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_SUCCESS);
		B_LogEntry( TOPIC_SALETOBIGLAND , " We are leaving Khorinis and going to the mainland! No one knows what we are waiting for there... " );
		Info_ClearChoices(dia_addon_greg_bf_travelonbigland);
		Info_AddChoice(dia_addon_greg_bf_travelonbigland,Dialog_Ende,dia_addon_greg_bf_travelonbigland_ok);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_BF_TravelOnBigLand_01_09 " );	// Of course... Everything is ready.
	};
};

func void dia_addon_greg_bf_travelonbigland_ok()
{
	//AI_StopProcessInfos(self);
	b_end_avi();
};

