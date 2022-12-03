

instance DIA_Borka_EXIT(C_Info)
{
	npc = VLK_434_Borka;
	nr = 999;
	condition = DIA_Borka_EXIT_Condition;
	information = DIA_Borka_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Borka_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Borka_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Borka_PICKPOCKET(C_Info)
{
	npc = VLK_434_Borka;
	nr = 900;
	condition = DIA_Borka_PICKPOCKET_Condition;
	information = DIA_Borka_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Borka_PICKPOCKET_Condition()
{
	return  C_Robbery ( 80 , 120 );
};

func void DIA_Borka_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
	Info_AddChoice(DIA_Borka_PICKPOCKET,Dialog_Back,DIA_Borka_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Borka_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Borka_PICKPOCKET_DoIt);
};

func void DIA_Borka_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
};

func void DIA_Borka_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
};


instance DIA_Borka_PISSOFF (C_Info)
{
	npc = VLK_434_Borka;
	condition = DIA_Borka_PISSOFF_Condition;
	information = DIA_Borka_PISSOFF_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Borka_PISSOFF_Condition()
{
	if((Knows_Borka_Dealer != TRUE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Wld_IsTime(17,0,9,0) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Borka_PISSOFF_Info()
{
	AI_Output(self,other, " DIA_Borka_PISSOFF_11_00 " );	// Hey you! Where are you going? No matter what your plans are, they can wait.
	AI_Output(self,other, " DIA_Borka_PISSOFF_11_01 " );	// You are standing in front of the entrance to the pearl of Khorinis - RED LANTERN. This is the most luxurious brothel in all of Myrtana, damn me!
	AI_Output(self,other, " DIA_Borka_PISSOFF_11_02 " );	// Sailors from the farthest corners of the world come here to spend some unforgettable nights at the Red Lantern.
	AI_Output(self,other, " DIA_Borka_PISSOFF_11_03 " );	// And now you have a chance - no, an honor - to spend the night with Nadia, the most passionate flower of the gods!
	AI_Output(self,other, " DIA_Borka_PISSOFF_11_04 " );	// Come in, and you will experience pleasure that others cannot even dream of!
};


instance DIA_Borka_TROUBLE(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = DIA_Borka_TROUBLE_Condition;
	information = DIA_Borka_TROUBLE_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Borka_TROUBLE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Andre_REDLIGHT != LOG_SUCCESS) && (Wld_IsTime(17,0,9,0) == TRUE) && (Npc_IsDead(Nadja) == FALSE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Borka_TROUBLE_Info()
{
	AI_Output(self,other, " DIA_Borka_TROUBLE_11_00 " );	// Why are you standing here and hesitating? Come inside and meet our loving Nadia.
	AI_Output(self,other, " DIA_Borka_TROUBLE_11_01 " );	// This passionate creation of the night will give your life a new meaning!
};


instance DIA_BORKA_HELLO(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_hello_condition;
	information = dia_borka_hello_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_borka_hello_condition()
{
	return TRUE;
};

func void dia_borka_hello_info()
{
	AI_Output(other,self,"DIA_Borka_Hello_01_00");	//Кто ты?
	AI_Output(self,other, " DIA_Borka_Hello_01_01 " );	// I'm Borka, I work as a barker in this brothel. Any questions?
	AI_Output(other,self, " DIA_Borka_Hello_01_02 " );	// I don't think so.
	AI_Output(self,other, " DIA_Borka_Hello_01_03 " );	// Then get in or get out - I don't have time for idle talk.
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_WHATNEW(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_whatnew_condition;
	information = dia_borka_whatnew_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_borka_whatnew_condition()
{
	if(Npc_KnowsInfo(hero,dia_borka_hello))
	{
		return TRUE;
	};
};

func void dia_borka_whatnew_info()
{
	AI_Output(other,self, " DIA_Borka_WhatNew_01_00 " );	// How's life?
	AI_Output(self,other, " DIA_Borka_WhatNew_01_01 " );	// (annoyed) Get off me...
	AI_StopProcessInfos(self);
};


instance DIA_Borka_Smoke(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = DIA_Borka_Smoke_Condition;
	information = DIA_Borka_Smoke_Info;
	permanent = TRUE;
	description = " Do you know where you can buy weed? " ;
};


func int DIA_Borka_Smoke_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_Smoke_Info()
{
	AI_Output(other,self, " DIA_Borka_Smoke_15_00 " );	// Do you know where you can buy weed?
	AI_Output(self,other, " DIA_Borka_Smoke_11_01 " );	// No, get lost!
	AI_StopProcessInfos(self);
};


instance DIA_Borka_BUYHERB(C_Info)
{
	npc = VLK_434_Borka;
	nr = 2;
	condition = DIA_Borka_BUYHERB_Condition;
	information = DIA_Borka_BUYHERB_Info;
	permanent = TRUE;
	description = " I heard you sell weed. " ;
};


func int DIA_Borka_BUYHERB_Condition()
{
	if((Knows_Borka_Dealer == TRUE) && (MIS_Andre_REDLIGHT == LOG_Running) && (Borka_Deal == FALSE) && (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_BUYHERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Borka_BUYHERB_15_00 " );	// I heard you sell weed.

	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other, " DIA_Borka_BUYHERB_11_01 " );	// Sorry, mister guard. It must be some kind of mistake! I don't know anything about any weed.
	}
	else
	{
		AI_Output(self,other, " DIA_Borka_BUYHERB_11_02 " );	// Who said that?
		Info_ClearChoices(DIA_Borka_BUYHERB);
		Info_AddChoice(DIA_Borka_BUYHERB, " I don't think it matters. " ,DIA_Borka_BUYHERB_Egal);
		Info_AddChoice(DIA_Borka_BUYHERB, " Nadja said. " ,DIA_Borka_BUYHERB_Nadja);
	};
};

func void DIA_Borka_BUYHERB_Egal()
{
	AI_Output(other,self, " DIA_Borka_BUYHERB_Egal_15_00 " );	// I don't think it matters.
	AI_Output(self,other, " DIA_Borka_BUYHERB_Egal_11_01 " );	// I just want to know who sent you to make sure you can be trusted.
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Info_AddChoice(DIA_Borka_BUYHERB, " Nadja said. " ,DIA_Borka_BUYHERB_Nadja);
	Info_AddChoice(DIA_Borka_BUYHERB, " So, shall we agree or not? " ,DIA_Borka_BUYHERB_Deal);
};

func void DIA_Borka_BUYHERB_Nadja()
{
	AI_Output(other,self, " DIA_Borka_BUYHERB_NADJA_15_00 " );	// Nadia said.
	AI_Output(self,other, " DIA_Borka_BUYHERB_NADJA_11_01 " );	// Well, this bird won't sing like that. You know, you shouldn't believe everything that girl says.
	Nadja_Victim = TRUE ;
	Undercover_Failed = TRUE;
	Info_ClearChoices(DIA_Borka_BUYHERB);
};

func void DIA_Borka_BUYHERB_Deal()
{
	AI_Output(other,self, " DIA_Borka_BUYHERB_Deal_15_00 " );	// So we will agree or not?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Borka_BUYHERB_Deal_11_01 " );	// Okay... let's agree. You give me fifty gold coins and you get your weed. No trading!
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Borka_Deal = TRUE;
};


instance DIA_Borka_SECOND_CHANCE(C_Info)
{
	npc = VLK_434_Borka;
	nr = 2;
	condition = DIA_Borka_SECOND_CHANCE_Condition;
	information = DIA_Borka_SECOND_CHANCE_Info;
	permanent = TRUE;
	description = " Deal! Here's your gold. " ;
};

func int DIA_Borka_SECOND_CHANCE_Condition()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if ((Borka_Deal ==  TRUE ) && (Npc_HasItems(other,ItMi_Gold) >=  50 ) && (Hlp_IsItem(heroArmor,ITAR_Mil_L) ==  FALSE ) && (Hlp_IsItem(heroArmor, ITAR_TOWNGUARD ) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Borka_SECOND_CHANCE_Info()
{
	AI_Output(other,self, " DIA_Borka_SECOND_CHANCE_15_00 " );	// Agreed! Here is your gold.
	B_GiveInvItems(hero,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_01");	//Хорошо...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Borka_SECOND_CHANCE_11_02 " );	// ... here, have a fresh, resinous joint.
	B_GiveInvItems(self,hero,ItMi_Joint,1);
	Borka_Deal = 2 ;
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_FUCKOFF(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_fuckoff_condition;
	information = dia_borka_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_borka_fuckoff_condition()
{
	if((MIS_Andre_REDLIGHT == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_borka_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

