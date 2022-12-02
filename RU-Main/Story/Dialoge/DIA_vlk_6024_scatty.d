

instance DIA_SCATTY_NW_EXIT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 999;
	condition = dia_scatty_nw_exit_condition;
	information = dia_scatty_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_scatty_nw_exit_condition()
{
	return TRUE;
};

func void dia_scatty_nw_exit_info()
{
	AI_StopProcessInfos(self);

	if((MIS_OLDGUARDGOWAR == LOG_SUCCESS) && (ALLGUARDIANSKILLED == FALSE))
	{
		if(SCATTYINSAFE == TRUE)
		{
			Npc_ExchangeRoutine(self,"FarmRest");
			b_removefromparty(vlk_6024_scatty);
		}
		else
		{
			Npc_ExchangeRoutine(self,"KillHim");
			b_removefromparty(vlk_6024_scatty);
		};
	};
};


instance DIA_SCATTY_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 900;
	condition = dia_scatty_nw_pickpocket_condition;
	information = dia_scatty_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_scatty_nw_pickpocket_condition()
{
	return  C_Robbery ( 110 , 250 );
};

func void dia_scatty_nw_pickpocket_info()
{
	Info_ClearChoices(dia_scatty_nw_pickpocket);
	Info_AddChoice(dia_scatty_nw_pickpocket,Dialog_Back,dia_scatty_nw_pickpocket_back);
	Info_AddChoice(dia_scatty_nw_pickpocket,DIALOG_PICKPOCKET,dia_scatty_nw_pickpocket_doit);
};

func void dia_scatty_nw_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_scatty_nw_pickpocket);
};

func void dia_scatty_nw_pickpocket_back()
{
	Info_ClearChoices(dia_scatty_nw_pickpocket);
};


instance DIA_SCATTY_NW_HI(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_hi_condition;
	information = dia_scatty_nw_hi_info;
	important = TRUE;
};


func int dia_scatty_nw_hi_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_scatty_nw_hi_info()
{
	B_GivePlayerXP(500);

	if((SCATTYCHEST == TRUE) && (SCATTYCHESTDONE == FALSE))
	{
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_17 " );	// Hey man! Your face looks familiar to me.
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_18 " );	// Well, sure! You are the guy who...
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_19");	//...ГДЕ МОЕ ЗОЛОТО?!
		AI_Output(other,self, " DIA_Scatty_NW_Hi_01_20 " );	// What gold? What are you talking about?
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_21 " );	// Are you taking me for an idiot? Where is the gold, I ask?!
		AI_Output(other,self, " DIA_Scatty_NW_Hi_01_22 " );	// I don't understand what you're talking about.
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_23 " );	// Oh, you don't understand... You'll understand now!
		SCATTYCHESTDONE = TRUE;
		SCATTY_SUCKED = TRUE;
		B_LogEntry_Failed(TOPIC_SCATTYCHEST);
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_00 " );	// Hey man! Your face looks familiar to me.
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_01 " );	// Well, sure! You are the guy who...
		AI_Output(other,self, " DIA_Scatty_NW_Hi_01_02 " );	// Good to see you, Scutty. How did you get here?
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_03 " );	// How, how. Same as you. It's not worth it at all. You understand why.
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_04 " );	// I didn't expect such agility from you.
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other, " DIA_Scatty_NW_Hi_01_05 " );	// Just look - a fire mage! Yes, you didn't waste your time.
		}
		else if(other.guild == GIL_PAL)
		{
			AI_Output(self,other, " DIA_Scatty_NW_Hi_01_06 " );	// Just look - the king's paladin! Yes, you didn't waste your time.
		}
		else if(other.guild == GIL_DJG)
		{
			AI_Output(self,other, " DIA_Scatty_NW_Hi_01_07 " );	// Just look - a mercenary! Yes, you didn't waste your time.
		}
		else if(other.guild == GIL_KDW)
		{
			AI_Output(self,other, " DIA_Scatty_NW_Hi_01_0A " );	// Just look - a water mage! Yes, you didn't waste your time.
		}
		else if(other.guild == GIL_KDM)
		{
			AI_Output(self,other, " DIA_Scatty_NW_Hi_01_0B " );	// Just look - a necromancer! Yes, you didn't waste your time.
		}
		else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(self,other, " DIA_Scatty_NW_Hi_01_0C " );	// Just look - a sectarian! Yes, you didn't waste your time.
		};
		AI_Output(other,self, " DIA_Scatty_NW_Hi_01_08 " );	// What are you doing here?
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_09 " );	// What, what. I work, of course! I'm training with Wulfgar these new recruits that you see in front of you.
		AI_Output(other,self, " DIA_Scatty_NW_Hi_01_10 " );	// Wulfgar took you to train new recruits?
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_11 " );	// Well, yes, I showed him a couple of my signature moves. In general, I impressed him!
		AI_Output(other,self, " DIA_Scatty_NW_Hi_01_12 " );	// Yes, teacher, as I remember, you are not bad at all. Your lessons there... you know where... were not in vain for me.
		AI_Output(self,other, " DIA_Scatty_NW_Hi_01_13 " );	// I'm glad you haven't forgotten those times. It was a good time!
	};
};


instance DIA_SCATTY_NW_CITY(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 2;
	condition = dia_scatty_nw_city_condition;
	information = dia_scatty_nw_city_info;
	permanent = TRUE;
	description = " How is recruit training going? " ;
};


func int dia_scatty_nw_city_condition()
{
	if ( Npc_KnowsInfo ( other , dia_scatty_nw_hi ) && ( SCATTY_SUCKED  ==  FALSE ) && ( CAPITALORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_scatty_nw_city_info()
{
	AI_Output(other,self, " DIA_Scatty_NW_City_01_00 " );	// How is recruit training going?
	AI_Output(self,other, " DIA_Scatty_NW_City_01_01 " );	// So-so! Most of them are of no use.
	AI_Output(self,other, " DIA_Scatty_NW_City_01_05 " );	// (decidedly) Nothing. We will make real soldiers out of them!
	if ((Npc_IsDead(Mil_330_Miliz) ==  FALSE ) && Wld_IsTime( 8 , 0 , 20 , 20 ))
	{
		AI_Standup(self);
		B_TurnToNpc(self,Mil_330_Militia);
		AI_Output(self,other, " DIA_Scatty_NW_City_01_02 " );	// (calling) Hey man, this is not good at all!
		AI_Output(self,other, " DIA_Scatty_NW_City_01_03 " );	// Grasp the handle with one hand. Blade up, and don't keep it still.
		AI_Output(self,other, " DIA_Scatty_NW_City_01_04 " );	// The weapon should become an extension of your hand, fit into your movements. This will help speed up the attack!
		B_TurnToNpc(self,other);
	};
};


instance DIA_SCATTY_ANGREE (C_Info)
{
	npc = vlk_6024_scatty;
	condition = dia_scatty_agree_condition;
	information = dia_scatty_angree_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_scatty_angree_condition()
{
	if((SCATTY_SUCKED == TRUE) && (MIS_OLDGUARDGOWAR == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_scatty_angree_info()
{
	AI_Output(self,other, " DIA_Scatty_Angree_01_00 " );	// Get out, you little liar!
	AI_StopProcessInfos(self);
	SCATTY_SUCKED = TRUE;
};

instance DIA_SCATTY_NW_ESCAPEFROMTOWN(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_escapefromtown_condition;
	information = dia_scatty_nw_escapefromtown_info;
	permanent = FALSE;
	description = " How are you? " ;
};

func int dia_scatty_nw_escapefromtown_condition()
{
	if ( KAPITELORCATC  ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_scatty_nw_escapefromtown_info()
{
	AI_Output(other,self, " DIA_Scatty_NW_EscapeFromTown_01_00 " );	// How are you?
	AI_Output(self,other, " DIA_Scatty_NW_EscapeFromTown_01_01 " );	// (sullenly) It could have been better. Although the mere fact that I am still alive is already pleasing.
	AI_Output(self,other, " DIA_Scatty_NW_EscapeFromTown_01_03 " );	// If only you could see what was going on in the city then!
	AI_Output(self,other, " DIA_Scatty_NW_EscapeFromTown_01_05 " );	// And now it's not better! There are only orcs around, and there is no hope that this will all end soon.
	SCATTYHERE = TRUE;
};

instance DIA_SCATTY_NW_WHATNEXT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_whatnext_condition;
	information = dia_scatty_nw_whatnext_info;
	permanent = TRUE;
	description = " Will you stay here for now? " ;
};

func int dia_scatty_nw_whatnext_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_scatty_nw_escapefromtown ) && ( MIS_OLDGUARDGOWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_whatnext_info()
{
	AI_Output(other,self, " DIA_Scatty_NW_WhatNext_01_00 " );	// Will you stay here?
	AI_Output(self,other, " DIA_Scatty_NW_WhatNext_01_01 " );	// I guess so. At least the orcs haven't gotten here yet.
};

instance DIA_SCATTY_NW_OLDGUARDGOWAR(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_oldguardgowar_condition;
	information = dia_scatty_nw_oldguardgowar_info;
	permanent = FALSE;
	description = "Пошли!";
};

func int dia_scatty_nw_oldguardgowar_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (SCATTYHERE == TRUE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_oldguardgowar_info()
{
	AI_Output(other,self, " DIA_Scatty_NW_OldGuardGoWar_01_00 " );	// Let's go! Gotta get out of here.
	AI_Output(self,other, " DIA_Scatty_NW_OldGuardGoWar_01_01 " );	// (decidedly) It would be like that for a long time! I'm tired of sitting in one place.
	AI_Output(self,other, " DIA_Scatty_NW_OldGuardGoWar_01_02 " );	// Well, what are you waiting for - go ahead!
	SCATTYJOINME = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_SCATTY_NW_OLDGUARDGOWAR_DONE(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_condition;
	information = DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_info;
	permanent = FALSE;
	description = " We have arrived. " ;
};

func int DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_condition()
{
	if((SCATTYJOINME == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_01_00");	//Мы пришли.
	AI_Output(self,other, " DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_01_01 " );	// Thanks mate. I already like it here!
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	SCATTYINSAFE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
};

instance DIA_SCATTY_NW_WHEREPEASANT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_wherepeasant_condition;
	information = dia_scatty_nw_wherepeasant_info;
	permanent = FALSE;
	description = " Where are all the peasants from the yard? " ;
};


func int dia_scatty_nw_wherepeasant_condition()
{
	if (( SCATTYHERE  ==  TRUE ) && ( KNOWWHEREAKIL  ==  FALSE ) && ( MY_OLDGUARDGOWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_wherepeasant_info()
{
	AI_Output(other,self, " DIA_Scatty_NW_WherePeasant_01_00 " );	// And where are all the peasants from the yard?
	AI_Output(self,other, " DIA_Scatty_NW_WherePeasant_01_01 " );	// I have no idea. They fled, probably, who where.
	AI_Output(self,other, " DIA_Scatty_NW_WherePeasant_01_02 " );	// It's too dangerous to stay here now. This farm is too conspicuous a place to be ignored by the orcs.
	AI_Output(other,self,"DIA_Scatty_NW_WherePeasant_01_03");	//Ясно.
	KNOWWHEREAKIL = TRUE;
};
