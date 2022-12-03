

instance DIA_PAL_205_Torwache_EXIT(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 999;
	condition = DIA_PAL_205_Torwache_EXIT_Condition;
	information = DIA_PAL_205_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_205_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_205_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string PAL_205_Checkpoint = "NW_CITY_CITYHALL_IN";

var int PAL_205_always let in;

instance DIA_PAL_205_Torwache_FirstWarn(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 1;
	condition = DIA_PAL_205_Torwache_FirstWarn_Condition;
	information = DIA_PAL_205_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,PAL_205_Checkpoint) <= 550)
	{
		Npc_SetRefuseTalk(self,5);
		return  FALSE ;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (PAL_205_schonmalreingelassen == TRUE))
	{
		self.aivar[ AIV_PASSGATE ] = FALSE ;
	}
	else  if (PAL_205_schonmalreinlett ==  TRUE )
	{
		self.aivar[ AIV_PASSGATE ] = TRUE ;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//СТОЙ!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_PAL_205_Torwache_FirstWarn_12_01 " );	// I'll be violating my most sacred duty if I let an assassin in here.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_PAL_205_Torwache_FirstWarn_12_02 " );	// You are accused of stealing. Until proven otherwise, you cannot enter here!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_PAL_205_Torwache_FirstWarn_12_03 " );	// They say you took part in the fight. I won't miss you.
		};
		AI_Output(self,other, " DIA_PAL_205_Torwache_FirstWarn_12_04 " );	// Go to Lord Andre and settle this matter!
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_205_Torwache_FirstWarn_12_05 " );	// Only people in the king's service can enter the town hall.
		PALGUARD = TRUE;
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_PAL_205_Torwache_SecondWarn(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_SecondWarn_Condition;
	information = DIA_PAL_205_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_PAL_205_Torwache_SecondWarn_12_00 " );	// If you take another step forward, I swear by Innos, I will use my weapon!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_Attack(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_Attack_Condition;
	information = DIA_PAL_205_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_205_Torwache_Hagen (C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_Hagen_Condition;
	information = DIA_PAL_205_Torwache_Hagen_Info;
	permanent = TRUE;
	description = " I need to speak to Lord Hagen! " ;
};


func int DIA_PAL_205_Torwache_Hagen_Condition()
{
	if (PAL_205_schonmalreinlett ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Hagen_Info()
{
	AI_Output(other,self, " DIA_PAL_205_Torwache_Hagen_15_00 " );	// I need to speak to Lord Hagen!
	AI_Output(self,other, " DIA_PAL_205_Torwache_Hagen_12_01 " );	// Do you know how often I hear that? I won't let you in And if you still try to enter, I will have to kill you.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsMil(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsMil_Condition;
	information = DIA_PAL_205_Torwache_PassAsMil_Info;
	permanent = TRUE;
	description = " I'm in the militia. " ;
};


func int DIA_PAL_205_Torwache_PassAsMil_Condition()
{
	if((other.guild == GIL_MIL) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMil_Info()
{
	AI_Output(other,self, " DIA_PAL_205_Torwache_PassAsMil_15_00 " );	// I'm in the militia.
	AI_Output(self,other, " DIA_PAL_205_Torwache_PassAsMil_12_01 " );	// Okay, you can come in.
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	PAL_205_schonmalreinlett = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsMage(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsMage_Condition;
	information = DIA_PAL_205_Torwache_PassAsMage_Info;
	permanent = TRUE;
	description = " I am a fire mage. " ;
};


func int DIA_PAL_205_Torwache_PassAsMage_Condition()
{
	if((other.guild == GIL_KDF) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMage_Info()
{
	AI_Output(other,self, " DIA_PAL_205_Torwache_PassAsMage_15_00 " );	// I am a fire mage.
	AI_Output(self,other, " DIA_PAL_205_Torwache_PassAsMage_12_01 " );	// Yes, of course! Please forgive me, O Chosen One. I'm just doing my duty.
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	PAL_205_schonmalreinlett = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsSld(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsSld_Condition;
	information = DIA_PAL_205_Torwache_PassAsSld_Info;
	permanent = TRUE;
	description = " Let me pass - I bring a message from the mercenaries. " ;
};


func int DIA_PAL_205_Torwache_PassAsSld_Condition()
{
	if((other.guild == GIL_SLD) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsSld_Info()
{
	AI_Output(other,self, " DIA_PAL_205_Torwache_PassAsSld_15_00 " );	// Let me pass - I carry a message from the mercenaries.
	AI_Output(self,other, " DIA_PAL_205_Torwache_PassAsSld_12_01 " );	// Okay, but I warn you: if there are any problems, you won't even have time to regret it!
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	PAL_205_schonmalreinlett = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASKDW(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passaskdw_condition;
	information = dia_pal_205_torwache_passaskdw_info;
	permanent = TRUE;
	description = " I am the messenger of the Water Mages. " ;
};


func int dia_pal_205_torwache_passaskdw_condition()
{
	if(((other.guild == GIL_NDW) || (other.guild == GIL_KDW)) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (Npc_HasItems(other,itwr_watermageletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passaskdw_info()
{
	AI_Output(other,self, " DIA_PAL_205_Torwache_PassAsKDW_15_00 " );	// I am the messenger of the Waterbenders. I have an urgent assignment for Lord Hagen.
	AI_Output(self,other, " DIA_PAL_205_Torwache_PassAsKDW_12_01 " );	// Okay, come on, novice. But just try not to cause problems!
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	PAL_205_schonmalreinlett = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASKDM(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passaskdm_condition;
	information = dia_pal_205_torwache_passaskdm_info;
	permanent = TRUE;
	description = " You wouldn't detain a servant of the God of Darkness, would you? " ;
};


func int dia_pal_205_torwache_passaskdm_condition()
{
	if((other.guild == GIL_KDM) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passaskdm_info()
{
	AI_Output(other,self, " DIA_PAL_205_Torwache_PassAsKDM_15_00 " );	// You won't detain a servant of the God of Darkness, will you?
	AI_Output(self,other, " DIA_PAL_205_Torwache_PassAsKDM_12_01 " );	// (incredulously) Come on, necromancer. But I warn you, if you make trouble here, you won't even have time to repent.
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	PAL_205_schonmalreinlett = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASSEK (C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passassek_condition;
	information = dia_pal_205_torwache_passassek_info;
	permanent = TRUE;
	description = " I have an appointment with the mayor. " ;
};

func int dia_pal_205_torwache_passassek_condition()
{
	if(((other.guild == GIL_GUR) || (other.guild == GIL_TPL)) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (LARIUSAWAITS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passassek_info()
{
	AI_Output(other,self, " DIA_PAL_205_Torwache_PassAsSEK_15_00 " );	// I have an appointment with Mayor Larius. You should have been warned.
	AI_Output(self,other, " DIA_PAL_205_Torwache_PassAsSEK_12_01 " );	// Yes, I was told about it. But if you really are who you say you are, you must know the password. After all, you know him?
	AI_Output(other,self, " DIA_PAL_205_Torwache_PassAsSEK_15_01 " );	// UBERION! So, will you let me in?
	AI_Output(self,other, " DIA_PAL_205_Torwache_PassAsSEK_12_02 " );	// Okay, come on in. But I warn you: if you make trouble here, you won't even have time to repent!
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	PAL_205_schonmalreinlett = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PERM(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_PERM_Condition;
	information = DIA_PAL_205_Torwache_PERM_Info;
	permanent = TRUE;
	description = " What is my duty? " ;
};

func int DIA_PAL_205_Torwache_PERM_Condition()
{
	if((PAL_205_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PERM_Info()
{
	AI_Output(other,self, " DIA_PAL_205_Torwache_PERM_15_00 " );	// And what is my responsibility?

	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other, " DIA_PAL_205_Torwache_PERM_12_01 " );	// We've got it all.
	}
	else if((other.guild == GIL_KDF) && (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_PAL_205_Torwache_PERM_12_02 " );	// My assignment fills me, chosen one.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_PAL_205_Torwache_PERM_12_03 " );	// Come in and keep quiet.
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_205_Torwache_PERM_12_04 " );	// What do you want?
	};

	AI_StopProcessInfos(self);
};

