

instance DIA_THORUS_NW_EXIT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 999;
	condition = dia_thorus_nw_exit_condition;
	information = dia_thorus_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_thorus_nw_exit_condition()
{
	return TRUE;
};

func void dia_thorus_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORUS_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 900;
	condition = dia_thorus_nw_pickpocket_condition;
	information = dia_thorus_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_thorus_nw_pickpocket_condition()
{
	return C_Beklauen(100,200);
};

func void dia_thorus_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thorus_nw_pickpocket);
	Info_AddChoice(dia_thorus_nw_pickpocket,Dialog_Back,dia_thorus_nw_pickpocket_back);
	Info_AddChoice(dia_thorus_nw_pickpocket,DIALOG_PICKPOCKET,dia_thorus_nw_pickpocket_doit);
};

func void dia_thorus_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_thorus_nw_pickpocket);
};

func void dia_thorus_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thorus_nw_pickpocket);
};


instance DIA_THORUS_NW_HI(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_hi_condition;
	information = dia_thorus_nw_hi_info;
	important = TRUE;
};


func int dia_thorus_nw_hi_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_thorus_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Thorus_NW_Hi_01_00 " );	// Hey man, Don't I know you?
	AI_Output(other,self, " DIA_Thorus_NW_Hi_01_01 " );	// Thorus? That you?
	AI_Output(self,other, " DIA_Thorus_NW_Hi_01_02 " );	// Yes. We meet again! Small world...
	AI_Output(other,self, " DIA_Thorus_NW_Hi_01_03 " );	// What are you doing here?!
	AI_Output(self,other, " DIA_Thorus_NW_Hi_01_04 " );	// I should ask you what YOU are doing here. And why do you look so strange...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Thorus_NW_Hi_01_05 " );	// When did you become a Fire wizard?
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Thorus_NW_Hi_01_06 " );	// When did you become a paladin?
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Thorus_NW_Hi_01_07 " );	// When did you manage to become a mercenary?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Thorus_NW_Hi_01_0A " );	// When did you become a Water wizard?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Thorus_NW_Hi_01_0B " );	// When did you become a corpse botherer?!
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Thorus_NW_Hi_01_0C " );	// When did you manage to join the Brotherhood?
	};
	AI_Output(other,self, " DIA_Thorus_NW_Hi_01_08 " );	// How to tell you. I'm not quite the person I pretended to be there in the swamps.
	AI_Output(self,other, " DIA_Thorus_NW_Hi_01_09 " );	// Yes, it looks like you! You never know what you really are.
	AI_Output(other,self, " DIA_Thorus_NW_Hi_01_10 " );	// And I see you joined the city guard? How did you manage that?
	AI_Output(self,other, " DIA_Thorus_NW_Hi_01_11 " );	// Hey, all I know is fighting. And as it happens that's exactly what the city needs right now.
	AI_Output(self,other, " DIA_Thorus_NW_Hi_01_12 " );	// I just came to Lord Andre and expressed a desire to join the militia.
	AI_Output(self,other, " DIA_Thorus_NW_Hi_01_13 " );	// He refused, at first. Then he saw me fight.
	AI_Output(self,other, " DIA_Thorus_NW_Hi_01_17 " );	// Its boring work if I'm being honest. Better than that mosquito infested swamp tho.
	AI_Output(other,self, " DIA_Thorus_NW_Hi_01_18 " );	// Lord Andre is really lucky to have you my friend.
};


instance DIA_THORUS_NW_CITY(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 2;
	condition = dia_thorus_nw_city_condition;
	information = dia_thorus_nw_city_info;
	permanent = TRUE;
	description = " How is the fight against crime coming along? " ;
};


func int dia_thorus_nw_city_condition()
{
	if ( Npc_KnowsInfo ( other , dia_thorus_nw_hi ) && ( CAPITALORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_city_info()
{
	AI_Output(other,self, " DIA_Thorus_NW_City_01_00 " );	// How is the fight against crime coming along?
	AI_Output(self,other, " DIA_Thorus_NW_City_01_01 " );	// So far everything is quiet and calm.
};

instance DIA_THORUS_NW_ESCAPEFROMTOWN(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_escapefromtown_condition;
	information = dia_thorus_nw_escapefromtown_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_thorus_nw_escapefromtown_condition()
{
	if ( KAPITELORCATC  ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_thorus_nw_escapefromtown_info()
{
	AI_Output(self,other, " DIA_Thorus_NW_EscapeFromTown_01_00 " );	// I didn't think I'd meet you here!
	AI_Output(self,other, " DIA_Thorus_NW_EscapeFromTown_01_01 " );	// It seemed to me that you should be far from these places by now.
	AI_Output(other,self, " DIA_Thorus_NW_EscapeFromTown_01_02 " );	// I'm as surprised as you. How did you manage to get out of the city?
	AI_Output(self,other, " DIA_Thorus_NW_EscapeFromTown_01_03 " );	// Cavalorn helped me. If it wasn't for him, I'd be dead already!
	AI_Output(self,other, " DIA_Thorus_NW_EscapeFromTown_01_04 " );	// When it became clear to everyone that the city could no longer be held, he led us along a secret path leading out of the city across the coast.
	AI_Output(self,other, " DIA_Thorus_NW_EscapeFromTown_01_05 " );	// And now we're here at Akila's farm! The orcs haven't gotten here yet.

	if(MEETCAVALORNAGAIN == FALSE)
	{
		AI_Output(other,self, " DIA_Thorus_NW_EscapeFromTown_01_06 " );	// It turns out that Cavalorn also survived. Well, well, that's good news.
		AI_Output(self,other, " DIA_Thorus_NW_EscapeFromTown_01_07 " );	// You'll find him near the bridge leading towards the tavern.
		AI_Output(self,other, " DIA_Thorus_NW_EscapeFromTown_01_08 " );	// From there, he watches the orc patrols on the other side.
	};

	THORUSHERE = TRUE;
};


instance DIA_THORUS_NW_WHATNEXT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_whatnext_condition;
	information = dia_thorus_nw_whatnext_info;
	permanent = TRUE;
	description = " What are you going to do next? " ;
};

func int dia_thorus_nw_whatnext_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_thorus_nw_escapefromtown ) && ( MIS_OLDGUARDGOWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_whatnext_info()
{
	AI_Output(other,self, " DIA_Thorus_NW_WhatNext_01_00 " );	// What are you going to do next?
	AI_Output(self,other, " DIA_Thorus_NW_WhatNext_01_01 " );	// Don't know yet. But I think I'll have a good rest first.
	AI_Output(self,other, " DIA_Thorus_NW_WhatNext_01_02 " );	// The last few days were hell.
	AI_Output(other,self, " DIA_Thorus_NW_WhatNext_01_03 " );	// Understandable.
};

instance DIA_THORUS_NW_OLDGUARDGOWAR(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_oldguardgowar_condition;
	information = dia_thorus_nw_oldguardgowar_info;
	permanent = FALSE;
	description = " Let's go! I'll take you to Onar's farm. " ;
};

func int dia_thorus_nw_oldguardgowar_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (THORUSHERE == TRUE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_oldguardgowar_info()
{
	AI_Output(other,self, " DIA_Thorus_NW_OldGuardGoWar_01_00 " );	// Let's go! I'll take you to Onar's farm.
	AI_Output(self,other, " DIA_Thorus_NW_OldGuardGoWar_01_01 " );	// Okay, let's go. Hope you know what you're doing!
	THORUSJOINME = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_THORUS_NW_OLDGUARDGOWAR_DONE(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = DIA_THORUS_NW_OLDGUARDGOWAR_DONE_condition;
	information = DIA_THORUS_NW_OLDGUARDGOWAR_DONE_info;
	permanent = FALSE;
	description = " We're here! " ;
};

func int DIA_THORUS_NW_OLDGUARDGOWAR_DONE_condition()
{
	if((THORUSJOINME == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_THORUS_NW_OLDGUARDGOWAR_DONE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_THORUS_NW_OLDGUARDGOWAR_DONE_01_00");	//We're here!
	AI_Output(self,other, " DIA_THORUS_NW_OLDGUARDGOWAR_DONE_01_01 " );	// Okay...(sighing) At least there are no orcs in sight.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	THORUSINSAFE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
};

instance DIA_THORUS_NW_WHEREPEASANT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_wherepeasant_condition;
	information = dia_thorus_nw_wherepeasant_info;
	permanent = FALSE;
	description = " Where are all the peasants from the yard? " ;
};

func int dia_thorus_nw_wherepeasant_condition()
{
	if((THORUSHERE == TRUE) && (KNOWWHEREAKIL == FALSE) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_wherepeasant_info()
{
	AI_Output(other,self, " DIA_Thorus_NW_WherePeasant_01_00 " );	// Where are all the peasants?
	AI_Output(self,other, " DIA_Thorus_NW_WherePeasant_01_01 " );	// I have no idea. They fled, probably.
	AI_Output(self,other, " DIA_Thorus_NW_WherePeasant_01_02 " );	// It's too dangerous to stay here now. This farm is too prominent a place for the orcs to ignore!
	AI_Output(other,self,"DIA_Thorus_NW_WherePeasant_01_03");	//Agreed.
	KNOWWHEREAKIL = TRUE;
};

instance DIA_THORUS_NW_TRAVELONBIGLAND(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_travelonbigland_condition;
	information = dia_thorus_nw_travelonbigland_info;
	permanent = FALSE;
	description = " My ship is sailing to the mainland. " ;
};

func int dia_thorus_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_thorus_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Thorus_NW_TravelOnBigLand_01_00 " );	// My ship is sailing to the mainland.
	AI_Output(other,self, " DIA_Thorus_NW_TravelOnBigLand_01_01 " );	// There's room for you too!
	AI_Output(self,other, " DIA_Thorus_NW_TravelOnBigLand_01_02 " );	// Heh, buddy...(joyfully) Thank you for not forgetting about me!
	AI_Output(self,other, " DIA_Thorus_NW_TravelOnBigLand_01_03 " );	// I will gladly go to the mainland and try to start a new life there.
	AI_Output(self,other, " DIA_Thorus_NW_TravelOnBigLand_01_04 " );	// This place has gotten... heavy as of late.
	AI_Output(other,self, " DIA_Thorus_NW_TravelOnBigLand_01_05 " );	// Then hop aboard!
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	THORUSTOBIGLAND = TRUE;
	B_LogEntry( TOPIC_SALETOBIGLAND , " I asked Thorus to go with me. He agreed. " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};
