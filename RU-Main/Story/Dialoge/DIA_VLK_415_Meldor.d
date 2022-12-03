

instance DIA_Meldor_EXIT (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 999;
	condition = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Meldor_Hello (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 2;
	condition = DIA_Meldor_Hello_Condition;
	information = DIA_Meldor_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Meldor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info()
{
	AI_Output(self,other, " DIA_Meldor_Hallo_07_00 " );	// What do you need?
	AI_Output(other,self, " DIA_Meldor_Hallo_15_01 " );	// I'm just admiring the surroundings...
	AI_Output(self,other, " DIA_Meldor_Hallo_07_02 " );	// Where exactly are you going?
};


instance DIA_Meldor_Interesting (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 2;
	condition = DIA_Meldor_Interesting_Condition;
	information = DIA_Meldor_Interesting_Info;
	permanent = FALSE;
	description = " What's interesting here? " ;
};


func int DIA_Meldor_Interesting_Condition()
{
	return TRUE;
};

func void DIA_Meldor_Interesting_Info()
{
	AI_Output(other,self, " DIA_Meldor_Interessantes_15_00 " );	// What's interesting here?
	AI_Output(self,other, " DIA_Meldor_Interessantes_07_01 " );	// There is a brothel and a tavern here. The name of the owner of the tavern is Cardiff. If you need information, I advise you to talk to him.
	AI_Output(self,other, " DIA_Meldor_Interessantes_07_02 " );	// You don't need money, by the way?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Cardiff, owner of a harbor tavern, trades information. " );
};


instance DIA_Meldor_Lehmar (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 3;
	condition = DIA_Meldor_Lehmar_Condition;
	information = DIA_Meldor_Lehmar_Info;
	permanent = FALSE;
	description = " Do you give them? " ;
};


func int DIA_Meldor_Lehmar_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info()
{
	AI_Output(other,self, " DIA_Meldor_Lehmar_15_00 " );	// Do you give them?
	AI_Output(self,other, " DIA_Meldor_Lehmar_07_01 " );	// (bored) No. But right across the street is the home of Lemar, the pawnbroker.
	AI_Output(self,other, " DIA_Meldor_Lehmar_07_02 " );	// I'm sure he can lend you some gold.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Meldor_Workest (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 4;
	condition = DIA_Meldor_Working_Condition;
	information = DIA_Meldor_Workest_Info;
	permanent = FALSE;
	description = " Do you work for Lemar? " ;
};


func int DIA_Meldor_Working_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Working_Info()
{
	AI_Output(other,self, " DIA_Meldor_Arbeitest_15_00 " );	// Do you work for Lemar?
	AI_Output(self,other, " DIA_Meldor_Arbeitest_07_01 " );	// Smart boy.
};


instance DIA_Meldor_InsOV (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 5;
	condition = DIA_Meldor_InsOV_Condition;
	information = DIA_Meldor_InsOV_Info;
	permanent = FALSE;
	description = " Actually, I was heading to the upper quarter... " ;
};


func int DIA_Meldor_InsOV_Condition()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info()
{
	AI_Output(other,self, " DIA_Meldor_InsOV_15_00 " );	// Actually, I was heading to the upper quarter...
	AI_Output(self,other, " DIA_Meldor_InsOV_07_01 " );	// (sarcastically) Yes, of course. And I was going to board a ship and pay a visit to the king.
	AI_Output(self,other, " DIA_Meldor_InsOV_07_02 " );	// People like you and me have been denied access to the upper quarter since the paladins arrived in town.
};


instance DIA_Meldor_Citizen (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 6;
	condition = DIA_Meldor_Citizen_Condition;
	information = DIA_Meldor_Citizen_Info;
	permanent = FALSE;
	description = " Are you a citizen of this city? " ;
};


func int DIA_Meldor_Citizen_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info()
{
	AI_Output(other,self, " DIA_Meldor_Citizen_15_00 " );	// Are you a citizen of this city?
	AI_Output(self,other, " DIA_Meldor_Citizen_07_01 " );	// If you mean do I live here, then yes. But they won't let me into the upper quarter anyway.
	AI_Output(self,other, " DIA_Meldor_Citizen_07_02 " );	// Only the cream of society can get in there, or, well, merchants and artisans from the lower part of the city.
	AI_Output(self,other, " DIA_Meldor_Citizen_07_03 " );	// Residents of the port district do not have much weight in Khorinis. Even militia patrols almost never look here.
};


instances of DIA_Meldor_Smoke (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 5;
	condition = DIA_Meldor_Smoke_Condition;
	information = DIA_Meldor_Smoke_Info;
	permanent = FALSE;
	description = " Do you know where I can buy weed? " ;
};


func int DIA_Meldor_Smoke_Condition()
{
	if (MIS_Andre_REDLIGHT == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Smoke_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Meldor_Smoke_15_00 " );	// Do you know where I can buy weed?

	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other, " DIA_Meldor_Smoke_07_01 " );	// (appreciatively)...No, I have no idea.
	}
	else
	{
		AI_Output(self,other, " DIA_Meldor_Smoke_07_02 " );	// If I were you, I'd try my luck at the Red Lantern.
	};
};


var int Report_DGNews;

instance DIA_Meldor_PERM (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 7;
	condition = DIA_Meldor_PERM_Condition;
	information = DIA_Meldor_PERM_Info;
	permanent = TRUE;
	description = " Has anything interesting happened lately? " ;
};


func int DIA_Meldor_PERM_Condition()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info()
{
	AI_Output(other,self, " DIA_Meldor_PERM_15_00 " );	// Has anything interesting happened lately?
	if (chapter <=  1 )
	{
		AI_Output(self,other, " DIA_Meldor_PERM_07_01 " );	// Recently, the city guard turned the waterfront news upside down.
		AI_Output(self,other, " DIA_Meldor_PERM_07_02 " );	// They were looking for stolen goods. Recently divorced painfully many thieves. Especially in wealthy neighborhoods.
		AI_Output(self,other, " DIA_Meldor_PERM_07_03 " );	// They tried to blame everything on the poor in the waterfront.
	}
	else  if ((Andre_Diebesgilde_aufgeraeumt ==  TRUE ) && (Meldor_DGNews ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Meldor_PERM_07_04 " );	// I heard a gang of thieves was caught in the sewers. All thieves were killed.
		Report_DGNews = TRUE ;
	}
	else  if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_Meldor_PERM_07_05 " );	// Dragons are said to have appeared in the Valley of Mines. I wonder when the paladins will leave here to fight the dragons.
	}
	else  if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_Meldor_PERM_07_06 " );	// Presumably all dragons are dead. Someone swept them with an iron broom.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//Нет.
	};
};

instance DIA_Meldor_VonLehmar (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 1;
	condition = DIA_Meldor_VonLehmar_Condition;
	information = DIA_Meldor_VonLehmar_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Meldor_VonLehmar_Condition()
{
	if ((Lehmar_GeldGeleihen_Day <= (Wld_GetDay() -  2 )) && (Lehmar_GeldGeleihen !=  0 ) && (RangerHelp_LehmarKohle ==  FALSE ) && (Lehmar.aivar[AIV_DefeatedByPlayer] ==  FALSE ) && (LehmarIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Meldor_VonLehmar_Info()
{
	AI_Output(self,other, " DIA_Meldor_VonLehmar_07_00 " );	// Hey, wait...
	AI_Output(self,other, " DIA_Meldor_VonLehmar_07_01 " );	// I have a message for you from Lemar...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instances of DIA_Meldor_PICKPOCKET (C_Info)
{
	npc = VLK_415_Meldor;
	nr = 900;
	condition = DIA_Meldor_PICKPOCKET_Condition;
	information = DIA_Meldor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Meldor_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 55 );
};

func void DIA_Meldor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
	Info_AddChoice(DIA_Meldor_PICKPOCKET,Dialog_Back,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

