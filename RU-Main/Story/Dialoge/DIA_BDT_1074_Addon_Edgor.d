
var int Edgor_Exiteinmal;

instance DIA_Addon_Edgor_EXIT(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 999;
	condition = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Edgor_EXIT_Info()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Edgor_MIS2 ) && ( Edgor_ExitInfrequently ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Addon_Edgor_EXIT_06_00 " );	// Nice to meet you...
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Edgor_PICKPOCKET(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 900;
	condition = DIA_Addon_Edgor_PICKPOCKET_Condition;
	information = DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 7 );
};

func void DIA_Addon_Edgor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Edgor_PICKPOCKET,Dialog_Back,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Edgor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Robbery();
	B_Say(self,self,"$AWAKE");
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
};

func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
};


instance DIA_Addon_Edgor_Hi(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 2;
	condition = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Addon_Edgor_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Edgor_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Hi_15_00");	//Как дела?
	AI_Output(self,other, " DIA_Addon_Edgor_Hi_06_01 " );	// Do you want to know how I'm doing? I'll tell you how I'm doing.
	AI_Output(self,other, " DIA_Addon_Edgor_Hi_06_02 " );	// First, some pirates brought me here in a storm. I vomited all over their dish.
	AI_Output(self,other, " DIA_Addon_Edgor_Hi_06_03 " );	// Then Raven locked up the mine because some idiots wanted the gold too much.
	AI_Output(self,other, " DIA_Addon_Edgor_Hi_06_04 " );	// And then Franco became the commander of the hunters and kills anyone who is against him.
	AI_Output(self,other, " DIA_Addon_Edgor_Hi_06_05 " );	// I would say that things are going badly.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_Edgor_Franco(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 2;
	condition = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent = FALSE;
	description = " How did Franco become a senior? " ;
};


func int DIA_Addon_Edgor_Franco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Edgor_Franco_Info()
{
	AI_Output(other,self, " DIA_Addon_Edgor_Franco_15_00 " );	// How did Franco become the elder?
	AI_Output(self,other, " DIA_Addon_Edgor_Franco_06_01 " );	// Very simple. Killed Fletcher, who was the commander before him.
	AI_Output(self,other, " DIA_Addon_Edgor_Franco_06_02 " );	// Fletcher was his boyfriend. And Franco just drove us.
};


instance DIA_Addon_Edgor_MIS2(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent = FALSE;
	description = " Franco sent me about this stone tablet... " ;
};


func int DIA_Addon_Edgor_MIS2_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Edgor_Hi ) && ( MIS_HelpEdgor == LOG_Running ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output(other,self, " DIA_Addon_Edgor_MIS2_15_00 " );	// Franco sent me about this stone tablet. Did you find her?
	AI_Output(self,other, " DIA_Addon_Edgor_MIS2_06_01 " );	// Buddy, I didn't even try to look for her. All I know is that it must be somewhere in that old building in the swamp.
	AI_Output(self,other, " DIA_Addon_Edgor_MIS2_06_02 " );	// And my inner voice says to me: 'Edgor, stay away from the old buildings standing in the swamp'.
	AI_Output(self,other, " DIA_Addon_Edgor_MIS2_06_03 " );	// I'm not going to risk my skin for that gouging Franco!
	B_LogEntry(Topic_Addon_Stoneplate, " Edgor isn't going to look for the stone tablet. He says it's in some old building in the swamps. " );
};


instance DIA_Addon_Edgor_Weg(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent = FALSE;
	description = " Where is this old building? " ;
};


func int DIA_Addon_Edgor_Weg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_MIS2))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Edgor_Weg_Info()
{
	AI_Output(other,self, " DIA_Addon_Edgor_Weg_15_00 " );	// Where is this old building?
	AI_Output(self,other, " DIA_Addon_Edgor_Weg_06_01 " );	// Go around that big rock to the left. After a while you will see another large stone.
	AI_Output(self,other, " DIA_Addon_Edgor_Weg_06_02 " );	// It must be bypassed to the left... or to the right, I don't remember anymore - it was too long ago.
	AI_Output(self,other, " DIA_Addon_Edgor_Weg_06_03 " );	// But the ruins should be on a slight rise. And they are completely overgrown with plants.
	AI_Output(self,other, " DIA_Addon_Edgor_Weg_06_04 " );	// Maybe you'll get lucky and not find them...
};


instance DIA_Addon_Edgor_Found(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent = FALSE;
	description = " I found a stone tablet! " ;
};


func int DIA_Addon_Edgor_Found_Condition()
{
	if ((Npc_HasItems(other,ItMy_Addon_Stone_04) >=  1 ) &&  ! Npc_IsDead(Franco) && (MY_HelpEdgor == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Edgor_Found_Info()
{
	AI_Output(other,self, " DIA_Addon_Edgor_Found_15_00 " );	// (joyfully) I found the stone tablet!
	AI_Output(self,other, " DIA_Addon_Edgor_Found_06_01 " );	// (bored) Really? You are a brave guy.
	AI_Output(self,other, " DIA_Addon_Edgor_Found_06_02 " );	// (bored) Then you've probably earned yourself a camp pass. (yawns)
};


instance DIA_Addon_Edgor_Teach(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 9;
	condition = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int DIA_Addon_Edgor_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Edgor_Teach_Info()
{
	AI_Output(other,self, " DIA_Addon_Edgor_Teach_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_Edgor_Teach_06_01 " );	// I know a lot about blood hornets. I hate those nasty creatures even more than I hate Franco!
	AI_Output(self,other, " DIA_Addon_Edgor_Teach_06_02 " );	// But I know how to tear off their stingers and wings, from their dead carcasses. (with a hint of madness) Yes! Get away from them...
	AI_Output(self,other, " DIA_Addon_Edgor_Teach_06_03 " );	// Also, I know how to extract the secret from torn stings.
	AI_Output(self,other, " DIA_Addon_Edgor_Teach_06_04 " );	// If you want, I can teach you all this stuff.
	AI_Output(self,other, " DIA_Addon_Edgor_Teach_06_05 " );	// Of course, I won't do anything for free...
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher, " Edgor knows a lot about blood hornets and their trophies. " );
	Edgor_Teach = TRUE;
};

func void B_Edgor_NotEnoughGold()
{
	AI_Output(self,other, " DIA_Addon_Edgor_NotEnoughGold_06_00 " );	// I need gold. I'm only interested in coins, not nuggets.
};


instance DIA_Addon_Edgor_TrainStart(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 9;
	condition = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent = TRUE;
	description = " About the blood flies... " ;
};


func int DIA_Addon_Edgor_Start_Condition()
{
	if((Edgor_Teach == TRUE) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (Knows_Bloodfly == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Start_Info()
{
	AI_Output(other,self, " DIA_Addon_Edgor_TrainStart_SEKRET_15_00 " );	// About the blood flies...
	AI_Output(self,other, " DIA_Addon_Edgor_TrainStart_SEKRET_06_01 " );	// What would you like to know?
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
	Info_AddChoice(DIA_Addon_Edgor_TrainStart,Dialog_Back,DIA_Addon_Edgor_TrainStart_BACK);

	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart, " How to remove the sting? (Training points: 1, Cost: 150 coins) " ,DIA_Addon_Edgor_TrainStart_Sting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart, " How to separate the wings? (Training points: 1, Cost: 300 coins) " ,DIA_Addon_Edgor_TrainStart_Wing);
	};
	if(Knows_Bloodfly == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart, " How to get the secret from the sting? (Training points: 1, Cost: 500 coins) " ,DIA_Addon_Edgor_TrainStart_GIFT);
	};
};

func void DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_Sting()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,150))
	{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
		{
			AI_Output(other,self, " DIA_Addon_Edgor_TrainStart_Sting_15_00 " );	// How to tear off the sting from the fly?
			AI_Output(self,other, " DIA_Addon_Edgor_TrainStart_Sting_06_01 " );	// Turn the dead creature over on its belly and cut it crosswise. Grab the innards and cut the tissue along the entire back.
			AI_Output(self,other, " DIA_Addon_Edgor_TrainStart_Sting_06_02 " );	// After that, you can yank the stinger out with a quick movement.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_Wing()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
		{
			AI_Output(other,self, " DIA_Addon_Edgor_TrainStart_Wing_15_00 " );	// And how to separate the wings?
			AI_Output(self,other, " DIA_Addon_Edgor_TrainStart_Wing_06_01 " );	// Grab them with one hand. Another just cut them off on the outside of the skin.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_GIFT()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		if(other.lp >= 1)
		{
			AI_Output(other,self, " DIA_Addon_Edgor_TrainStart_GIFT_15_00 " );	// How to extract the secret from the sting of a bloodfly?
			AI_Output(self,other, " DIA_Addon_Edgor_TrainStart_GIFT_06_01 " );	// Cut the top layer of the sting lengthwise - then the healing secret will flow out.
			AI_Output(self,other, " DIA_Addon_Edgor_TrainStart_GIFT_06_02 " );	// This is a perfectly safe way to suck it out of the sting or use it for a healing potion.
			other.lp = other.lp - 1;
			RankPoints = RankPoints + 1;
			Knows_Bloodfly = TRUE;
			AI_Print( " Learned the skill of cutting prey - 'Extracting the secret from the sting' " );
		}
		else
		{
			AI_Print(PRINT_NotEnoughLP);
			B_Say(self,other,"$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};
