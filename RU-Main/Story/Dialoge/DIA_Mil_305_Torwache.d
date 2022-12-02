

instance DIA_Mil_305_Torwache_EXIT(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 999;
	condition = DIA_Mil_305_Torwache_EXIT_Condition;
	information = DIA_Mil_305_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_305_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_305_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_305_Checkpoint = "NW_CITY_UPTOWN_PATH_02";

instance DIA_Mil_305_Torwache_FirstWarn(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_FirstWarn_Condition;
	information = DIA_Mil_305_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_305_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return  FALSE ;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (Mil_305_schonmalreingelassen == TRUE))
	{
		self.aivar[ AIV_PASSGATE ] = FALSE ;
	}
	else  if (Mil_305_schonmalreinlett ==  TRUE )
	{
		HIGHCITYGATEACCESSGRANTED = TRUE;
		self.aivar[ AIV_PASSGATE ] = TRUE ;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_00");	//СТОЙ!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_Mil_305_Torwache_FirstWarn_03_01 " );	// You are suspected of murder in the city! Until the charges are dropped, I can't let you into the upper quarter.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_Mil_305_Torwache_FirstWarn_03_02 " );	// As long as you're accused of stealing, you can't enter the upper quarter of the city!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Mil_305_Torwache_FirstWarn_03_03 " );	// I can't let a troublemaker like you into the uptown.
		};
		AI_Output(self,other, " DIA_Mil_305_Torwache_FirstWarn_03_04 " );	// Go to Lord Andre and fix this problem!
	}
	else
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_FirstWarn_03_05 " );	// Only citizens of the city and employees of the royal troops can enter the upper quarter of the city!
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_305_Torwache_SecondWarn(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_SecondWarn_Condition;
	information = DIA_Mil_305_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_Mil_305_Torwache_SecondWarn_03_00 " );	// I'm warning you for the last time. One more step and you will be acquainted with my sword.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_Attack(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_Attack_Condition;
	information = DIA_Mil_305_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_Output(self,other, " DIA_Mil_305_Torwache_Attack_03_00 " );	// You asked for it...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_305_Torwache_MESSAGE(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_MESSAGE_Condition;
	information = DIA_Mil_305_Torwache_MESSAGE_Info;
	permanent = FALSE;
	description = " I have an important message for Lord Hagen. " ;
};


func int DIA_Mil_305_Torwache_MESSAGE_Condition()
{
	if((Player_KnowsLordHagen == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_MESSAGE_Info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_MESSAGE_15_00 " );	// I have an important message for Lord Hagen.
	AI_Output(self,other, " DIA_Mil_305_Torwache_MESSAGE_03_01 " );	// Half the town wants to talk to Lord Hagen about an important matter.
	AI_Output(self,other, " DIA_Mil_305_Torwache_MESSAGE_03_02 " );	// If I let every petitioner through, he'll only have to deal with the townspeople's petty problems.
};


instance DIA_Mil_305_Torwache_Ausnahme (C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_Ausnahme_Condition;
	information = DIA_Mil_305_Gorwache_Ausnahme_Info;
	permanent = TRUE;
	description = " Maybe make an exception for me? " ;
};


func int DIA_Mil_305_Gorwache_Ausnahme_Condition()
{
	if (Mil_305_schonmalreinlett ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Gateguard_Exception_Info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_Ausnahme_15_00 " );	// Maybe make an exception for me?
	AI_Output(self,other, " DIA_Mil_305_Torwache_Ausnahme_03_01 " );	// What?! Rules are rules! The rules apply to everyone without exception!
	AI_Output(self,other, " DIA_Mil_305_Torwache_Ausnahme_03_02 " );	// If I let you break these rules, it won't be fair to those who follow them.
};


instance DIA_Mil_305_Torwache_PassAsCitizen (C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information = DIA_Mil_305_Torwache_PassAsCitizen_Info;
	permanent = TRUE;
	description = " I am a respected citizen of Khorinis! Let me pass! " ;
};


func int DIA_Mil_305_Torwache_PassAsCitizen_Condition()
{
	if ((Mil_305_schonmalreinlett ==  FALSE ) && (chapter <=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsCitizen_Info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsCitizen_15_00 " );	// I am a respected citizen of Khorinis! Let me pass!
	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsCitizen_03_01 " );	// I don't know what made the masters of Khorinis accept you as an apprentice, and I don't want to know!
		AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsCitizen_03_02 " );	// You can enter. But behave yourself, if you don't want to run into serious trouble.
		HIGHCITYGATEACCESSGRANTED = TRUE;
		self.aivar[ AIV_PASSGATE ] = TRUE ;
		Mil_305_always let in = TRUE ;
		AI_StopProcessInfos(self);
	}
	else if((MIS_Matteo_Gold == LOG_SUCCESS) || (MIS_Thorben_GetBlessings == LOG_SUCCESS) || (MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS) || (MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsCitizen_03_03 " );	// You may have managed to negotiate with some masters in the lower part of the city, but if you were a citizen, I would know about it!
		AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsCitizen_03_04 " );	// Don't try to trick me! I'm warning you!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsCitizen_03_05 " );	// You're not worth the dirt under my nails! Get out of my sight!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Mil_305_Torwache_PassAsMil (C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsMil_Condition;
	information = DIA_Mil_305_Torwache_PassAsMil_Info;
	permanent = TRUE;
	description = " I'm in the militia - let me through! " ;
};


func int DIA_Mil_305_Torwache_PassAsMil_Condition()
{
	if((other.guild == GIL_MIL) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMil_Info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsMil_15_00 " );	// I'm in the militia - let me pass!
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsMil_03_01 " );	// So Andre accepted you? Maybe you're not such a bad guy as you seem.
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsMil_03_02 " );	// Now you're one of the city's defenders! So try to be polite and friendly with the townspeople.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_305_always let in = TRUE ;
	AI_StopProcessInfos(self);
};

instance DIA_Mil_305_Torwache_PassAsMage(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsMage_Condition;
	information = DIA_Mil_305_Torwache_PassAsMage_Info;
	permanent = TRUE;
	description = " Do you dare stand in the way of Innos' representative? " ;
};

func int DIA_Mil_305_Torwache_PassAsMage_Condition()
{
	if((Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && ((other.guild == GIL_KDF) || (other.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMage_Info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsMage_15_00 " );	// You dare to stand in the way of Innos' representative?
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsMage_03_01 " );	// Uh... no! Of course not! For the elite of Innos, the entrance is open.
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsMage_15_02 " );	// Pray that Innos forgives you for this blasphemy!
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsMage_03_03 " );	// Yes, oh chosen one!
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_305_always let in = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PassAsSld(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsSld_Condition;
	information = DIA_Mil_305_Torwache_PassAsSld_Info;
	permanent = TRUE;
	description = " I have an important message for Lord Hagen! " ;
};


func int DIA_Mil_305_Torwache_PassAsSld_Condition()
{
	if((other.guild == GIL_SLD) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsSld_Info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsSld_15_00 " );	// I have an important message for Lord Hagen!
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsSld_03_01 " );	// You're one of those mercenary scumbags! What do you want from Lord Hagen?
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsSld_15_02 " );	// I've come with an offer of peace.
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsSld_03_03 " );	// Ah! So, finally, the voice of reason has reached you scoundrels? Then go to Lord Hagen. But try to be nice and polite, or I'll give you a hard time!
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_305_always let in = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASKDW(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passaskdw_condition;
	information = dia_mil_305_torwache_passaskdw_info;
	permanent = TRUE;
	description = " I'm a water mage! " ;
};


func int dia_mil_305_torwache_passaskdw_condition()
{
	if((other.guild == GIL_KDW) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passaskdw_info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsKdw_15_00 " );	// I'm a waterbender!
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsKdw_03_01 " );	// We are always glad to servants of Adanos! You can pass.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_305_always let in = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASNDW (C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasndw_condition;
	information = dia_mil_305_torwache_passasndw_info;
	permanent = TRUE;
	description = " I am a Water Mage Adept. " ;
};


func int dia_mil_305_torwache_passasndw_condition()
{
	if((other.guild == GIL_NDW) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (Npc_HasItems(other,itwr_watermageletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasndw_info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsNDW_15_00 " );	// I am an adept of the Water Mages. I have a message for the head of the paladins.
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsNDW_12_01 " );	// Okay, come on in.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_305_always let in = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASSEK (C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passassek_condition;
	information = dia_mil_305_torwache_passassek_info;
	permanent = TRUE;
	description = " I have an appointment... " ;
};


func int dia_mil_305_torwache_passassek_condition()
{
	if(((other.guild == GIL_GUR) || (other.guild == GIL_TPL)) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (LARIUSAWAITS == TRUE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passassek_info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsSek_15_00 " );	// I have an appointment with Larius. You should have been warned.
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsSek_03_01 " );	// Oh yeah! Of course. You can enter. But try not to create problems here.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_305_always let in = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASKDM(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passaskdm_condition;
	information = dia_mil_305_torwache_passaskdm_info;
	permanent = TRUE;
	description = " Do you dare to detain a dark mage?! " ;
};


func int dia_mil_305_torwache_passaskdm_condition()
{
	if((other.guild == GIL_KDM) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passaskdm_info()
{
	AI_Output(other,self, " DIA_Mil_305_Torwache_PassAsKdm_15_00 " );	// You dare to detain a dark mage?!
	AI_Output(self,other, " DIA_Mil_305_Torwache_PassAsKdm_03_01 " );	// Mmmm...(through gritted teeth)...okay, necromancer, you can enter. But I will keep an eye on you.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Mil_305_always let in = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PERM(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_PERM_Condition;
	information = DIA_Mil_305_Torwache_PERM_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Mil_305_Torwache_PERM_Condition()
{
	if((Mil_305_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PERM_15_00");	//Как дела?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PERM_03_01 " );	// All is well, friend!
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PERM_03_02 " );	// We're just doing our job. Thank you for drawing your attention to me, oh chosen one!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PERM_03_03 " );	// I may have to let you through, but I don't want to talk to you.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PERM_03_04 " );	// What do you want, swamp?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PERM_03_05 " );	// What do you want, necromancer?
	}
	else
	{
		AI_Output(self,other, " DIA_Mil_305_Torwache_PERM_03_06 " );	// Don't bother me!
	};
	AI_StopProcessInfos(self);
};

