

instance DIA_FISK_NW_EXIT(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 999;
	condition = dia_fisk_nw_exit_condition;
	information = dia_fisk_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_fisk_nw_exit_condition()
{
	return TRUE;
};

func void dia_fisk_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FISK_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 900;
	condition = dia_fisk_nw_pickpocket_condition;
	information = dia_fisk_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_fisk_nw_pickpocket_condition()
{
	return C_Beklauen(120,500);
};

func void dia_fisk_nw_pickpocket_info()
{
	Info_ClearChoices(dia_fisk_nw_pickpocket);
	Info_AddChoice(dia_fisk_nw_pickpocket,Dialog_Back,dia_fisk_nw_pickpocket_back);
	Info_AddChoice(dia_fisk_nw_pickpocket,DIALOG_PICKPOCKET,dia_fisk_nw_pickpocket_doit);
};

func void dia_fisk_nw_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_fisk_nw_pickpocket);
};

func void dia_fisk_nw_pickpocket_back()
{
	Info_ClearChoices(dia_fisk_nw_pickpocket);
};


instance DIA_FISK_NW_HI ( C_Info );
{
	npc = vlk_6021_fisk;
	nr = 1;
	condition = dia_fisk_nw_hi_condition;
	information = dia_fisk_nw_hi_info;
	permanent = FALSE;
	description = " I can't believe my eyes! " ;
};


func int dia_fish_nw_hi_condition()
{
	return TRUE;
};

func void dia_fish_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Fisk_NW_Hi_01_00 " );	// I can't believe my eyes! Fisk, how did you end up here?
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_01 " );	// I could ask you the same.
	AI_Output(other,self, " DIA_Fisk_NW_Hi_01_03 " );	// How did you manage to get past the guard?!
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_04 " );	// You see: business people can always come to an agreement. I made them an offer they couldn't refuse...(laughs)
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_05 " );	// And I'm a businessman.

	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Fisk_NW_Hi_01_06 " );	// To be honest, this is the first time I've seen a bandit who managed to ingratiate himself with Firebenders, much less become one!
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Fisk_NW_Hi_01_07 " );	// Looks like the paladins have completely lost their minds if they started to take crooks like you into their service!
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Fisk_NW_Hi_01_08 " );	// Already managed to become a mercenary. Not bad for an ex-con!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Fisk_NW_Hi_01_0A " );	// To be honest, this is the first time I've see a bandit who was able to ingratiate himself with the Water Mages, much less become one!
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Fisk_NW_Hi_01_0B " );	// A bandit turned Necromancer... seems oddly fitting I suppose.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Fisk_NW_Hi_01_0C " );	// Already signed up for the sectarians have you?
	};

	AI_Output(other,self, " DIA_Fisk_NW_Hi_01_09 " );	// All in all, I'm not exactly who I say I am. It's just... There in the swamps, to me...
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_10 " );	// Okay, don't make excuses. In the end, in the camp, you helped me a lot. Hand washes hand - remember?
	AI_Output(other,self, " DIA_Fisk_NW_Hi_01_11 " );	// Yeah. I see you're doing well here too!
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_12 " );	// During the time that I spent in the camp, I managed to save up a good amount of capital. It was just enough to open my own small business here.
	AI_Output(other,self, " DIA_Fisk_NW_Hi_01_13 " );	// Did the rest of the merchants mind?
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_14 " );	// I talked to them. No one seemed to object. But again, it cost me dearly. I hope it pays off.
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_15 " );	// Why should they worry? This place stands on the outskirts of the market square. Therefore, I have fewer clients than they do.
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_16 " );	// Have to work a little harder than everyone else.
	AI_Output(other,self, " DIA_Fisk_NW_Hi_01_17 " );	// Can you sell me something?
	AI_Output(self,other, " DIA_Fisk_NW_Hi_01_18 " );	// Of course.
};

instance DIA_FISK_NW_TRADE (C_Info);
{
	npc = vlk_6021_fisk;
	nr = 775;
	condition = dia_fisk_nw_trade_condition;
	info = dia_fisk_nw_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Let's get down to business! " ;
};

func int dia_fisk_nw_trade_condition()
{
	if ( Npc_KnowsInfo ( other , dia_fish_nw_hi ) && Wld_IsTime ( 5 , 10 , 21 , 30 )) ;
	{
		return TRUE;
	};
};

func void dia_fisk_nw_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};


