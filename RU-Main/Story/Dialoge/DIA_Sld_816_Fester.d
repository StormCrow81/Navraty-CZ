

instance DIA_Fester_EXIT(C_Info)
{
	npc = Sld_816_Fester;
	nr = 999;
	condition = DIA_Fester_EXIT_Condition;
	information = DIA_Fester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fester_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fester_Hello(C_Info)
{
	npc = Sld_816_Fester;
	nr = 1;
	condition = DIA_Fester_Hello_Condition;
	information = DIA_Fester_Hello_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Fester_Hello_Condition()
{
	return TRUE;
};

func void DIA_Fester_Hello_Info()
{
	AI_Output(other,self, " DIA_Fester_Hello_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Fester_Hello_08_01 " );	// I'm getting ready for battle...
};


instance DIA_Fixed_Order (C_Info)
{
	npc = Sld_816_Fester;
	nr = 2;
	condition = DIA_Fixed_Order_Condition;
	information = DIA_Fixed_Order_Info;
	permanent = FALSE;
	description = " Why? " ;
};


func int DIA_Fixed_Order_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_Hello))
	{
		return TRUE;
	};
};

func void DIA_Fixed_Order_Info()
{
	AI_Output(other,self, " DIA_Fixed_Order_15_00 " );	// Зачем?
	AI_Output(self,other, " DIA_Fester_Auftrag_08_01 " );	// Farmers have been having more and more problems with field predators lately.
	AI_Output(self,other, " DIA_Fester_Auftrag_08_02 " );	// Some of the peasants were even eaten by these creatures.
	AI_Output(self,other, " DIA_Fester_Auftrag_08_03 " );	// And this fat Onar sees no problem here. We haven't been paid for a week now.
	AI_Output(self,other, " DIA_Fester_Auftrag_08_04 " );	// And this is my fault. Now Lee wants me to personally destroy the nest of these creatures.
	AI_Output(self,other, " DIA_Fester_Auftrag_08_05 " );	// And the rest of the mercenaries are already betting whether I can survive or not...
};


instance DIA_Fester_YouFight(C_Info)
{
	npc = Sld_816_Fester;
	nr = 3;
	condition = DIA_Fester_YouFight_Condition;
	information = DIA_Fester_YouFight_Info;
	permanent = FALSE;
	description = " Are you a good fighter? " ;
};


func int DIA_Fester_YouFight_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] ==  FIGHT_NONE ) && Npc_KnowsInfo(other, DIA_Fester_Hello) && (MY_Fester_KillBugs ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Fester_YouFight_Info()
{
	AI_Output(other,self, " DIA_Fester_YouFight_15_00 " );	// Are you a good fighter?
	AI_Output(self,other, " DIA_Fester_YouFight_08_01 " );	// I'm pretty good with a sword, and the bow is generally my forte! Why are you asking?
};


instance DIA_Fester_WoNest(C_Info)
{
	npc = Sld_816_Fester;
	nr = 4;
	condition = DIA_Fester_WoNest_Condition;
	information = DIA_Fester_WoNest_Info;
	permanent = FALSE;
	description = " Where is this nest? " ;
};


func int DIA_Fester_WoNest_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Fester_Auftrag) && (MIS_Fester_KillBugs ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Fester_WoNest_Info()
{
	AI_Output(other,self, " DIA_Fester_WoNest_15_00 " );	// Where is this nest?
	AI_Output(self,other, " DIA_Fester_WoNest_08_01 " );	// In the center of the field over there, in that big rock over there.
};


var int Fester_Choice;
const int FC_Gold = 0;
const int FC_Join = 1;

instance DIA_Fester_Together(C_Info)
{
	npc = Sld_816_Fester;
	nr = 5;
	condition = DIA_Fester_Together_Condition;
	information = DIA_Fester_Together_Info;
	permanent = FALSE;
	description = " We could attack this nest together. " ;
};


func int DIA_Fester_Together_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] ==  FIGHT_NONE ) && Npc_KnowsInfo(other,DIA_Party_Subtract))
	{
		return TRUE;
	};
};

func void DIA_Fester_Together_Info()
{
	AI_Output(other,self, " DIA_Fester_Together_15_00 " );	// We could attack this nest together.
	AI_Output(self,other, " DIA_Fester_Together_08_01 " );	// Do you want to help me? Why?
	Info_ClearChoices(DIA_Fester_Together);
	Info_AddChoice(DIA_Fester_Together, " I want to get gold for this! " ,DIA_Fester_Together_Gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Fester_Together, " I want to join you! " ,DIA_Fester_Together_Join);
	};
};

func void DIA_Fester_Together_Join()
{
	AI_Output(other,self, " DIA_Fester_Together_Join_15_00 " );	// I want to join you!
	AI_Output(self,other, " DIA_Fester_Together_Join_08_01 " );	// Oh, okay then. You want to show that you are a good fighter...
	AI_Output(self,other, " DIA_Fester_Together_Join_08_02 " );	// (slyly) Okay, let's deal with these creatures together.
	Fester_Choice = FC_Join;
	Info_ClearChoices(DIA_Fester_Together);
};

func void DIA_Fester_Together_Gold()
{
	AI_Output(other,self, " DIA_Fester_Together_Gold_15_00 " );	// I want gold for this!
	AI_Output(self,other, " DIA_Fester_Together_Gold_08_01 " );	// (laughs) Oh, you rascal! You want to take advantage of my position, huh?
	AI_Output(self,other, " DIA_Fester_Together_Gold_08_02 " );	// That is, either I will pay you, or I will go to the forefathers?
	AI_Output(self,other, " DIA_Fester_Together_Gold_08_03 " );	// Good. I can pay you fifty gold - that's all I have.
	Fester_Choice = FC_Gold;
	Info_ClearChoices(DIA_Fester_Together);
};


var int Fixed_Losgeh_Day;

instance DIA_Fester_TogetherNOW(C_Info)
{
	npc = Sld_816_Fester;
	nr = 6;
	condition = DIA_Fester_TogetherNOW_Condition;
	information = DIA_Fester_TogetherNOW_Info;
	permanent = TRUE;
	description = " Let's attack the nest! " ;
};


func int DIA_Fester_TogetherNOW_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] ==  FIGHT_NONE ) && Npc_KnowsInfo(other,DIA_Party_Together) && (MY_Party_KillBugs ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Fester_TogetherNOW_Info()
{
	AI_Output(other,self, " DIA_Fester_TogetherNOW_15_00 " );	// Let's attack the nest!
	if (Wld_IsTime( 20 , 30 , 6 , 0 ))
	{
		AI_Output(self,other, " DIA_Fester_TogetherNOW_08_01 " );	// In the dark? No, we'd better wait until dawn.
	}
	else
	{
		AI_Output(self,other, " DIA_Fester_TogetherNOW_08_02 " );	// Right now? Maybe you should get some better gear first?
		AI_Output(self,other, " DIA_Fester_TogetherNOW_08_03 " );	// You could go to the farm first.
		Info_ClearChoices(DIA_Fester_TogetherNOW);
		Info_AddChoice(DIA_Fester_TogetherNOW, " Okay, let's wait a little more... " ,DIA_Fester_TogetherNOW_Later);
		Info_AddChoice(DIA_Fester_TogetherNOW, " There is no better opportunity than now. " ,DIA_Fester_TogetherNOW_NOW);
	};
};

func void DIA_Fester_TogetherNOW_NOW()
{
	AI_Output(other,self, " DIA_Fester_TogetherNOW_Now_15_00 " );	// There will be no better opportunity than now.
	AI_Output(self,other, " DIA_Fester_TogetherNOW_Now_08_01 " );	// Okay, let's see what you can do.
	Npc_ExchangeRoutine(self,"GUIDE");
	Fixed_Starting_Day = B_GetDayPlus();
	MIS_Fester_KillBugs = LOG_Running;
	Log_CreateTopic(TOPIC_FesterRauber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FesterRauber,LOG_Running);
	B_LogEntry(TOPIC_FesterRauber, " I'm going to attack the field predator nest with Fester. " );
	Info_ClearChoices(DIA_Fester_TogetherNOW);
	AI_StopProcessInfos(self);
};

func void DIA_Fester_TogetherNOW_Later()
{
	AI_Output(other,self, " DIA_Fester_TogetherNOW_Later_15_00 " );	// Okay, let's wait a little more...
	AI_Output(self,other, " DIA_Fester_TogetherNOW_Later_08_01 " );	// You know where to find me...
	Info_ClearChoices(DIA_Fester_TogetherNOW);
};


instance DIA_Fester_InCave(C_Info)
{
	npc = Sld_816_Fester;
	nr = 7;
	condition = DIA_Fester_InCave_Condition;
	information = DIA_Fester_InCave_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fester_InCave_Condition()
{
	if((MIS_Fester_KillBugs == LOG_Running) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LastFightComment] = TRUE ;
		return TRUE;
	};
};

func void DIA_Fester_InCave_Info()
{
	if ( Wld_GetDay ( ) > Fester_Losgeh_Day )
	{
		AI_Output(self,other, " DIA_Fester_InCave_08_00 " );	// Where the hell have you been?
	}
	else
	{
		AI_Output(self,other, " DIA_Fester_InCave_08_01 " );	// So that's where they dragged the dead farmers. What an abomination.
	};
	AI_Output(self,other, " DIA_Fester_InCave_08_02 " );	// Looks like all those filthy creatures have been destroyed.
	AI_Output(self,other, " DIA_Fester_InCave_08_03 " );	// Let's go back!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Fester_WasMitAbigung (C_Info)
{
	npc = Sld_816_Fester;
	nr = 8;
	condition = DIA_Fester_WasMitAbmachung_Condition;
	information = DIA_Fester_WasMitAbigung_Info;
	permanent = FALSE;
	description = " What about our agreement? " ;
};


func int DIA_Fester_WasMitAbmachung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_InCave))
	{
		return TRUE;
	};
};

func void DIA_Fixed_WasWithAgreement_Info()
{
	AI_Output(other,self, " DIA_Fester_WasMitAbmachung_15_00 " );	// What about our agreement?
	if(Festers_Giant_Bug_Killed == 0)
	{
		AI_Output(self,other, " DIA_Fester_WasMitAbmachung_08_01 " );	// Are you kidding? You didn't do anything at all.
	}
	else if(Fester_Choice == FC_Join)
	{
		AI_Output(self,other, " DIA_Fester_WasMitAbmachung_08_02 " );	// Well, I could help you become one of us, but I won't.
		AI_Output(other,self, " DIA_Fester_WasMitAbmachung_15_03 " );	// And why?!
		AI_Output(self,other, " DIA_Fester_WasMitAbmachung_08_04 " );	// If I tell everyone that you helped me, I'll get another new task.
		AI_Output(self,other, " DIA_Fester_WasMitAbmachung_08_05 " );	// You understand that I don't want this, right?
		AI_Output(self,other, " DIA_Fester_WasMitAbmachung_08_06 " );	// Yeah, bad luck, man! You will definitely find someone who can help you.
		B_LogEntry(TOPIC_FesterRauber, " Fester tricked me! He used my help to just do his job and that's it. And of course he won't help me become a mercenary! I should teach that bastard a lesson... " );
	}
	else
	{
		AI_Output(self,other, " DIA_Fester_WasMitAbmachung_08_07 " );	// Hey - you wanted to take advantage of my position, and I took advantage of you a little.
		AI_Output(self,other, " DIA_Fester_WasMitAbmachung_08_08 " );	// But look at things differently! You've learned something new, and that's something, isn't it?
		B_LogEntry(TOPIC_FesterRauber, " Fester tricked me! He used my help to just do his job and nothing more. And of course I won't get any money from him! I should teach that bastard a lesson... " );
	};

	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int Fester_Duell_Day;
var int Fester_FightVerarscht;
var int Fester_FightSylvio;

instance DIA_Fester_PERMPruegel (C_Info)
{
	npc = Sld_816_Fester;
	nr = 9;
	condition = DIA_Fester_PERMPruegel_Condition;
	information = DIA_Fester_PERMPruegel_Info;
	permanent = TRUE;
	description = " I think you could use one more spanking. " ;
};

func int DIA_Fester_PERMPruegel_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Fester_WasAboveMe ) || Npc_Knows Info ( other , DIA_Jarvis_MissionKO ) || ( self . aivar [ AIV_LastFightAgainstPlayer ] !=  FIGHT_NONE )) ;
	{
		return TRUE;
	};
};

func void DIA_Fester_PERMPruegel_Info()
{
	be int random;
	AI_Output(other,self, " DIA_Fester_PERMPruegel_15_00 " );	// I think you could use one more spanking.
	if ( Fester_Duell_Day < Wld_GetDay ())
	{
		B_CreateAmbientInv(self);
		Fester_Duell_Day = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,DIA_Fester_WasMitAbmachung) && (Fester_FightVerarscht == FALSE) && (MIS_Fester_KillBugs == LOG_Running))
	{
		AI_Output(other,self, " DIA_Fester_PERMPruegel_15_01 " );	// I don't like being lied to.
		AI_Output(self,other, " DIA_Fester_PERMPruegel_08_02 " );	// I'm all trembling, I'm all trembling!
		Fester_FightVerarscht = TRUE ;
	}
	else if(Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		AI_Output(other,self, " DIA_Fester_PERMPruegel_15_03 " );	// You shouldn't have messed with Silvio.
		AI_Output(self,other, " DIA_Fester_PERMPruegel_08_04 " );	// You're one of Lee's sycophants, aren't you? Then you have the wrong address!
		Fester_FightSylvio = TRUE;
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other, " DIA_Fester_PERMPruegel_08_05 " );	// What the hell do you want from me?
		AI_Output(other,self, " DIA_Fester_PERMPruegel_15_06 " );	// I really want to see how you wallow in the mud!
	}
	else
	{
		AI_Output(self,other, " DIA_Fester_PERMPruegel_08_07 " );	// Not enough for you, right?
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Fester_PICKPOCKET(C_Info)
{
	npc = Sld_816_Fester;
	nr = 900;
	condition = DIA_Fester_PICKPOCKET_Condition;
	information = DIA_Fester_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fester_PICKPOCKET_Condition()
{
	return  C_Robbery ( 27 , 45 );
};

func void DIA_Fester_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
	Info_AddChoice(DIA_Fester_PICKPOCKET,Dialog_Back,DIA_Fester_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fester_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fester_PICKPOCKET_DoIt);
};

func void DIA_Fester_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

func void DIA_Fester_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

