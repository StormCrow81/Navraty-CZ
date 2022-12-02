

instance DIA_MIGUEL_NW_EXIT(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 999;
	condition = dia_miguel_nw_exit_condition;
	information = dia_miguel_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_miguel_nw_exit_condition()
{
	return TRUE;
};

func void dia_miguel_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIGUEL_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 900;
	condition = dia_miguel_nw_pickpocket_condition;
	information = dia_miguel_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_miguel_nw_pickpocket_condition()
{
	return  C_Robbery ( 40 , 48 );
};

func void dia_miguel_nw_pickpocket_info()
{
	Info_ClearChoices(dia_miguel_nw_pickpocket);
	Info_AddChoice(dia_miguel_nw_pickpocket,Dialog_Back,dia_miguel_nw_pickpocket_back);
	Info_AddChoice(dia_miguel_nw_pickpocket,DIALOG_PICKPOCKET,dia_miguel_nw_pickpocket_doit);
};

func void dia_miguel_nw_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_miguel_nw_pickpocket);
};

func void dia_miguel_nw_pickpocket_back()
{
	Info_ClearChoices(dia_miguel_nw_pickpocket);
};


instance DIA_MIGUEL_NW_HI (C_Info)
{
	npc = vlk_6026_miguel;
	nr = 1;
	condition = dia_miguel_nw_hi_condition;
	information = day_miguel_nw_hi_info;
	permanent = FALSE;
	description = " WHAT ARE YOU DOING HERE? " ;
};


func int michael_day_nw_hi_condition()
{
	return TRUE;
};

func void dia_miguel_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Miguel_NW_Hi_01_00 " );	// What are YOU doing here?
	AI_Output(self,other, " DIA_Miguel_NW_Hi_01_01 " );	// I want to ask you the same thing. Then he is a bandit in a swamp ...

	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Miguel_NW_Hi_01_02 " );	// ... then the venerable Magician of Innos, before whom everyone bows.
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Miguel_NW_Hi_01_03 " );	// ... then the paladin of the King, striding through the city as if in his own home.
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Miguel_NW_Hi_01_04 " );	// ... then a mercenary.
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Miguel_NW_Hi_01_0A " );	// ... then the venerable Magician of Adanos, before whom everyone bows.
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Miguel_NW_Hi_01_0B " );	// ...then a demon caster!...(cautiously)
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Miguel_NW_Hi_01_0C " );	// ... that's a swamp!
	};
	AI_Output(other,self, " DIA_Miguel_NW_Hi_01_05 " );	// I had some business in the swamps.
	AI_Output(other,self, " DIA_Miguel_NW_Hi_01_06 " );	// How did you end up here? How did the security let you in?
	AI_Output(self,other, " DIA_Miguel_NW_Hi_01_07 " );	// It's simple, man. I agreed with the pirates and calmly sailed to the city, taking a couple of bales of herbs that I had collected in the swamp.

	if(KILLHAPPENSMADE == FALSE)
	{
		AI_Output(self,other, " DIA_Miguel_NW_Hi_01_08 " );	// Now selling them here to Ignaz and Constantino. They stood up for me. The law is the law, and they need to take the goods somewhere.
		AI_Output(other,self, " DIA_Miguel_NW_Hi_01_09 " );	// Got it. So you're the only one selling your weed to them?
		AI_Output(self,other, " DIA_Miguel_NW_Hi_01_10 " );	// I can do it for you as well... (laughs)
	};
};

instance DIA_MIGUEL_NW_CITY(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 2;
	condition = dia_miguel_nw_city_condition;
	information = dia_miguel_nw_city_info;
	permanent = TRUE;
	description = " How do you like the city? " ;
};


func int dia_miguel_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_miguel_nw_hi))
	{
		return TRUE;
	};
};

func void dia_miguel_nw_city_info()
{
	AI_Output(other,self, " DIA_Miguel_NW_City_15_00 " );	// Well, how do you like the city? Have you lived here before?
	AI_Output(self,other, " DIA_Miguel_NW_City_11_01 " );	// Yes, but now Khorinis is not the same anymore.
	AI_Output(self,other, " DIA_Miguel_NW_City_11_02 " );	// Can you imagine a noisy harbor, sailors from all over the world?
	AI_Output(self,other, " DIA_Miguel_NW_City_11_03 " );	// Merchants, goods, glitter of gold. Ore smuggling worked wonders here.
	AI_Output(self,other, " DIA_Miguel_NW_City_11_04 " );	// Eeeh... what kind of life was spinning here.
};


instance DIA_MIGUEL_NW_TRADE (C_Info);
{
	npc = vlk_6026_miguel;
	nr = 775;
	condition = dia_miguel_nw_trade_condition;
	information = dia_miguel_nw_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Let's get down to business! " ;
};


func int dia_miguel_nw_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_miguel_nw_hi))
	{
		return TRUE;
	};
};

func void dia_miguel_nw_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};
