

instance DIA_Girion_EXIT(C_Info)
{
	npc = Pal_207_Girion;
	nr = 999;
	condition = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Girion_Hello (C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Girion_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Hallo_Info()
{
	AI_Output(self,other, " DIA_Girion_Hallo_08_00 " );	// I am Girion, master of two-handed combat and paladin of the king. Why are you bothering me?
};


instance DIA_Girion_CanTeach(C_Info)
{
	npc = Pal_207_Girion;
	nr = 5;
	condition = DIA_Girion_CanTeach_Condition;
	information = DIA_Girion_CanTeach_Info;
	permanent = TRUE;
	description = " Can you teach me? " ;
};


func int DIA_Girion_CanTeach_Condition()
{
	if(Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Girion_CanTeach_15_00 " );	// Can you teach me?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Girion_CanTeach_08_01 " );	// It's good that you want to learn the noblest of all fighting styles. As befits a true warrior of Innos.
		AI_Output(self,other, " DIA_Girion_CanTeach_08_02 " );	// I'll teach you. Contact me when you're ready.
		Girion_Teach2H = TRUE;
		B_LogEntry(TOPIC_CityTeacher, " Paladin Girion can teach me two-handed combat. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Girion_CanTeach_08_03 " );	// If you want to learn something, you'd better look for a teacher not from our order.
		AI_Output(self,other, " DIA_Girion_CanTeach_08_04 " );	// I'm a warrior, not a teacher.
	};
};


instance DIA_Girion_Teach(C_Info)
{
	npc = Pal_207_Girion;
	nr = 100;
	condition = DIA_Girion_Teach_Condition;
	information = DIA_Girion_Teach_Info;
	permanent = TRUE;
	description = " I'm ready to learn. " ;
};


var int DIA_Girion_Teach_permanent;

func int DIA_Girion_Teach_Condition()
{
	if((Girion_Teach2H == TRUE) && (DIA_Girion_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void DIA_Girion_Teach_Info()
{
	girion_merk2h = other.HitChance[NPC_TALENT_2H];
	AI_Output(other,self, " DIA_Girion_Teach_15_00 " );	// I'm ready to learn.
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other, " DIA_DIA_Girion_Teach_08_00 " );	// Generally speaking, your training is not yet complete, but there is nothing more I can teach you.
		AI_Output(self,other, " DIA_DIA_Girion_Teach_08_01 " );	// If you want to hone your craft even further, you'd better look for a real sword master.
		AI_Output(other,self, " DIA_DIA_Girion_Teach_15_02 " );	// Where can I find such a person?
		AI_Output(self,other, " DIA_DIA_Girion_Teach_08_03 " );	// Lord Hagen is a master swordsman. He will surely be able to teach you.
		DIA_Girion_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Girion_Teach);
};

func void DIA_Girion_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	if(other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if(Girion_Labercount == 0)
		{
			AI_Output(self,other, " DIA_DIA_Girion_Teach_2H_1_08_00 " );	// Fight with honor. Fight is our life, and what is life without honor?
		};
		if(Girion_Labercount == 1)
		{
			AI_Output(self,other, " DIA_DIA_Girion_Teach_2H_1_08_01 " );	// Be careful and fast in combat. Surprise your opponent.
		};
		if(Girion_Labercount == 2)
		{
			AI_Output(self,other, " DIA_DIA_Girion_Teach_2H_1_08_02 " );	// Never enter combat unprepared. It is not known how long it will last.
		};
		if(Girion_Labercount == 3)
		{
			AI_Output(self,other, " DIA_DIA_Girion_Teach_2H_1_08_03 " );	// The paladin is always ready for battle. But he never starts a fight that he cannot win.
		};
		Girion_Labercount = Girion_Labercount + 1;
		if(Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	if(other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if(Girion_Labercount == 0)
		{
			AI_Output(self,other, " DIA_DIA_Girion_Teach_2H_5_08_00 " );	// The paladin fights not only with the sword, but also with the head.
		};
		if(Girion_Labercount == 1)
		{
			AI_Output(self,other, " DIA_DIA_Girion_Teach_2H_5_08_01 " );	// You need to know when to back off.
		};
		if(Girion_Labercount == 2)
		{
			AI_Output(self,other, " DIA_DIA_Girion_Teach_2H_5_08_02 " );	// Remember, if you fight well, you control your opponent and don't give him a chance to control you.
		};
		if(Girion_Labercount == 3)
		{
			AI_Output(self,other, " DIA_DIA_Girion_Teach_2H_5_08_03 " );	// Retreat is always a loss.
		};
		Girion_Labercount = Girion_Labercount + 1;
		if(Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};


instance DIA_Girion_CATCHPLAYERSTOLENSHIP(C_Info)
{
	npc = Pal_207_Girion;
	nr = 5;
	condition = DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information = DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important = TRUE;
};


func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition()
{
	if((Kapitel >= 5) && (MIS_ShipIsFree == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info()
{
	AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00 " );	// Hey! Can you tell me what are you doing here?
	Info_ClearChoices(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP, " I don't know what you're talking about. " ,DIA_Girion_CATCHPLAYERSTOLENSHIP_no);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP, " Get out of my way or I'll have to kill you. " ,DIA_Girion_CATCHPLAYERSTOLENSHIP_weg);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP, " I need this ship. " ,DIA_Girion_CATCHPLAYERSTOLENSHIP_ship);
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no()
{
	AI_Output(other,self, " DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00 " );	// I don't know what you're talking about.
	AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01 " );	// I'm talking about what you did to the ship guards. This thing smells bad.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02 " );	// Even though you're a mage, I don't trust you.
	};
};


var int Girion_WantstoKillSC;

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg()
{
	AI_Output(other,self, " DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00 " );	// Get out of my way or I'll have to kill you.
	AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01 " );	// You may have fooled the ship's guards, but you can't easily deal with me, my little friend.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02 " );	// Even though you're one of us, that doesn't give you the right to steal the king's property. Die, damned traitor.
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09 " );	// When we're done with this, you'll return this ship back to me, okay?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship()
{
	AI_Output(other,self, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00 " );	// I need your ship. And I'll take it.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01 " );	// You can't do this. Transportation of ore...
	}
	else
	{
		AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02 " );	// How dare you?! You smelly bastard...
	};
	AI_Output(other,self, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03 " );	// There isn't enough ore in the Valley of Mines to meet the needs of the king. I was there. There is nothing to do. Hagen's mission is a pure farce.
	AI_Output(other,self, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04 " );	// The real enemy has taken root on an island not far from here. I will swim there and put an end to all this.
	AI_Output(other,self, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05 " );	// Either join me or I'll have to deal with you. Choose.
	AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06 " );	// Mmm. It looks like I have no choice.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Правильно.
	AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08 " );	// Okay, okay. I will join you, but on one condition.
	B_GirionStayOnShip();
	AI_Output(other,self, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10 " );	// I'll survive this.
	AI_Output(self,other, " DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11 " );	// Then do what you must. And I'll wait for you here.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	Crewmember_Count = Crewmember_Count + 1;
	Girion_IsOnBoard = LOG_SUCCESS;
};


instance DIA_Girion_Verrat (C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Treason_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_Verrat_Condition()
{
	if((Girion_WantstoKillSC == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Verrat_Info()
{
	AI_Output(self,other, " DIA_Girion_Verrat_08_00 " );	// Traitor!
	AI_StopProcessInfos(self);
	self.aivar[AIV_DropDeadAndKill] = TRUE ;
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Girion_OnShip(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_OnShip_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Girion_IsOnBoard == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos(self);
};


instance DIA_Girion_PICKPOCKET(C_Info)
{
	npc = Pal_207_Girion;
	nr = 900;
	condition = DIA_Girion_PICKPOCKET_Condition;
	information = DIA_Girion_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Girion_PICKPOCKET_Condition()
{
	return  C_Robbery ( 73 , 280 );
};

func void DIA_Girion_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
	Info_AddChoice(DIA_Girion_PICKPOCKET,Dialog_Back,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};

func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};


instance DIA_GIRION_NW_KAPITELORCATTACK (C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_girion_nw_kapitelorcattack_condition;
	information = dia_girion_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " You've already heard - the city is captured! " ;
};


func int dia_girion_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (GIRIONBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_girion_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Girion_NW_KapitelOrcAttack_01_00 " );	// Have you heard? The city has been taken!
	AI_Output(self,other, " DIA_Girion_NW_KapitelOrcAttack_01_01 " );	// (sadly) I heard. And I am very sorry that I was not at that moment next to my brothers.
	AI_Output(self,other, " DIA_Girion_NW_KapitelOrcAttack_01_03 " );	// They needed my help! And I let them down ... (doomed)
	AI_Output(self,other, " DIA_Girion_NW_KapitelOrcAttack_01_06 " );	// I am ready to give my life for the glory of Innos and his greatness. Especially when fighting vile creatures like those orcs!
	AI_Output(other,self, " DIA_Girion_NW_KapitelOrcAttack_01_07 " );	// I'm sure you'll still have a good chance to prove it.
	AI_Output(self,other, " DIA_Girion_NW_KapitelOrcAttack_01_11 " );	// Yes. I heard that a few guys decided to fight their way out of the city. I decided to join them!
	AI_Output(self,other, " DIA_Girion_NW_KapitelOrcAttack_01_12 " );	// This is a good opportunity to get revenge on the orcs for the death of my brothers.
	AI_Output(other,self, " DIA_Girion_NW_KapitelOrcAttack_01_16 " );	// Then good luck to you, Girion! Hope we meet again.
	B_LogEntry( TOPIC_HELPCREW , " I didn't dissuade Paladin Girion from his idea of ​​getting out of the city through the crowds of orcs. It seems that after all that has happened, he is just looking for his own death! Death is usually indifferent to such people. " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	GIRIONBATTLETHROUGTH = TRUE;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_PAL_207_GIRION_FUCKOFF(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = dia_pal_207_girion_fuckoff_condition;
	information = dia_pal_207_girion_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_207_girion_fuckoff_condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( GIRIONCAPTURED  ==  TRUE ) && ( HORINISISFREE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_207_GIRION_YOURFREE(C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_pal_207_girion_yourfree_condition;
	information = dia_pal_207_girion_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_207_girion_yourfree_condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( GIRIONCAPTURED  ==  TRUE ) && ( HORINISISFREE  ==  TRUE ) && ( CAPTUREDMANSISFREE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_yourfree_info()
{
	AI_Output(self,other, " DIA_Pal_207_Girion_YourFree_01_08 " );	// (surprised) Innos is righteous! What does all of this mean?
	AI_Output(other,self, " DIA_Pal_207_Girion_YourFree_01_00 " );	// You are free!
	AI_Output(self,other, " DIA_Pal_207_Girion_YourFree_01_01 " );	// Can't be! Have you dealt with the orcs in the city?
	AI_Output(other,self, " DIA_Pal_207_Girion_YourFree_01_02 " );	// Yes, that's right.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other, " DIA_Pal_207_Girion_YourFree_01_03 " );	// Glory to Innos! We didn't even hope to be saved.
		AI_Output(self,other, " DIA_Pal_207_Girion_YourFree_01_04 " );	// Open the bars as soon as possible, let us out!
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_207_Girion_YourFree_01_05 " );	// Glory to Innos! I didn't expect to be saved.
		AI_Output(self,other, " DIA_Pal_207_Girion_YourFree_01_06 " );	// Open the grate as soon as possible, let me out!
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instances DIA_PAL_207_GIRION_OPENGATENOW (C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_pal_207_girion_opengatenow_condition;
	information = dia_pal_207_girion_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_207_girion_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GIRIONCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (GIRIONISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_opengatenow_info()
{
	AI_Output(self,other, " DIA_Pal_207_Girion_OpenGateNow_01_00 " );	// Come on already! Open that grid!
	AI_StopProcessInfos(self);
};

