
instance DIA_Addon_Miguel_EXIT(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 999;
	condition = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIGUEL_NO_TALK(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 1;
	condition = dia_addon_miguel_no_talk_condition;
	information = dia_addon_miguel_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_miguel_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Miguel_PICKPOCKET(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 900;
	condition = DIA_Addon_Miguel_PICKPOCKET_Condition;
	information = DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	return  C_Robbery ( 40 , 48 );
};

func void DIA_Addon_Miguel_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,Dialog_Back,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};

func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};


instance DIA_Addon_Miguel_Hi (C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 1;
	condition = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Miguel_Hi_Condition()
{
	if(MIGUEL_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Miguel_Hi_15_00 " );	// What are you doing here?
	if (Wld_IsTime( 6 , 0 , 22 , 0 ))
	{
		AI_Output(other,self, " DIA_Addon_Miguel_Hi_15_01 " );	// Looking for something?
		AI_Output(self,other, " DIA_Addon_Miguel_Hi_11_02 " );	// Plants. I am looking for plants.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Miguel_Hi_11_03 " );	// I usually look for plants.
	};
	AI_Output(self,other, " DIA_Addon_Miguel_Hi_11_04 " );	// Most of them can be used.
	AI_Output(self,other, " DIA_Addon_Miguel_Hi_11_05 " );	// Many plants have medicinal properties, and swamp grass makes excellent shoals.
	AI_Output(self,other, " DIA_Addon_Miguel_Hi_11_06 " );	// Before I got behind the Barrier, I worked as an alchemist.
};


instance DIA_Addon_Miguel_Story(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 2;
	condition = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent = FALSE;
	description = " Why are you behind the Barrier? " ;
};


func int DIA_Addon_Miguel_Story_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Michael_Hi ) && ( MIGUEL_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Miguel_Story_Info()
{
	AI_Output(other,self, " DIA_Addon_Miguel_Story_15_00 " );	// And why did you end up behind the Barrier?
	AI_Output(self,other, " DIA_Addon_Miguel_Story_11_01 " );	// I've been working on mind-affecting potions a lot.
	AI_Output(self,other, " DIA_Addon_Miguel_Story_11_02 " );	// One evening my boss Ignaz drank the result of my 'experiment' instead of his wine.
	AI_Output(self,other, " DIA_Addon_Miguel_Story_11_03 " );	// This made him... uh... unpredictable for a while, and he's been a little out of sorts ever since.
	AI_Output(self,other, " DIA_Addon_Miguel_Story_11_04 " );	// (fakely) For this, the magicians threw me over the Barrier. 'Research on forbidden knowledge,' is what they called it.
};


instance DIA_Addon_Miguel_Lager(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 3;
	condition = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent = FALSE;
	description = " Tell me about the camp. " ;
};


func int DIA_Addon_Miguel_Lager_Condition()
{
	if(MIGUEL_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Lager_Info()
{
	AI_Output(other,self, " DIA_Addon_Miguel_Lager_15_00 " );	// Tell me about the camp.
	AI_Output(self,other, " DIA_Addon_Miguel_Lager_11_01 " );	// I don't know much. I myself have never been there.
	AI_Output(self,other, " DIA_Addon_Miguel_Lager_11_02 " );	// Only Crow's people have been there since the beginning. Everyone else, those who came later like me, have to wait until they need new people.
};


instance DIA_Addon_Miguel_WhereFrom(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent = FALSE;
	description = " Where are you from? " ;
};


func int DIA_Addon_Miguel_WhereFrom_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi) || Npc_KnowsInfo(other,DIA_Addon_Miguel_Storage)) && ( MIGUEL_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output(other,self, " DIA_Addon_Miguel_WhereFrom_15_00 " );	// Where did you come from?
	AI_Output(self,other, " DIA_Addon_Miguel_WhereFrom_11_01 " );	// Well, from the same place as you, I think. With pirates. Through the sea.
	AI_Output(self,other, " DIA_Addon_Miguel_WhereFrom_11_02 " );	// We're on an island. There is no other connection to the mainland.
	AI_Output(other,self, " DIA_Addon_Miguel_WhereFrom_15_03 " );	// (thoughtfully) Right.
};


instance DIA_Addon_Miguel_Requested (C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_Requested_Condition;
	information = DIA_Addon_Miguel_Requested_Info;
	permanent = FALSE;
	description = " When do they need new people? " ;
};


func int DIA_Addon_Miguel_Requested_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Miguel_Storage ) && ( MIGUEL_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output(other,self, " DIA_Addon_Miguel_Angefordert_15_00 " );	// When do they need new people?
	AI_Output(self,other, " DIA_Addon_Miguel_Angefordert_11_01 " );	// Well, when they lose someone.
	AI_Output(self,other, " DIA_Addon_Miguel_Angefordert_11_02 " );	// If a miner eats a crawler, the lost worker is replaced with one of us.
	AI_Output(self,other, " DIA_Addon_Miguel_Angefordert_11_03 " );	// Sometimes they kill each other themselves. But lately it's been easier.
	AI_Output(self,other, " DIA_Addon_Miguel_Angefordert_11_04 " );	// Raven has somehow established control over the mine so that everyone can't get in at once.
	AI_Output(self,other, " DIA_Addon_Miguel_Angefordert_11_05 " );	// But I don't know what exactly he did. I have never been inside.
};


instance DIA_Addon_Miguel_Fortuno (C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 6;
	condition = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent = FALSE;
	description = " Fortuno is not all right in the head! " ;
};


func int DIA_Addon_Miguel_Fortuno_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Fortune_FREE_Addon ) && ( MIGUEL_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output(other,self, " DIA_Addon_Miguel_Fortuno_15_00 " );	// Fortuno is not all right in the head! He could drink the potion and regain his memory.
	AI_Output(self,other, " DIA_Addon_Miguel_Fortuno_11_01 " );	// Fortuno? It's the Crow's servant, right?
	AI_Output(other,self, " DIA_Addon_Miguel_Fortuno_15_02 " );	// He was. Now he's just a jerk. And this is Raven's fault.
	AI_Output(self,other, " DIA_Addon_Miguel_Fortuno_11_03 " );	// Crow? Hmm, so far I've thought better of him. Mm, okay. But here in the swamp, I can't brew the potion.
	AI_Output(other,self, " DIA_Addon_Miguel_Fortuno_15_04 " );	// I can brew a potion. There is an alchemist's table in the camp. I only need a prescription.
	AI_Output(self,other, " DIA_Addon_Miguel_Fortuno_11_05 " );	// Be careful with this recipe. This potion can be dangerous.
	B_GiveInvItems(self,other,ITWr_Addon_MCELIXIER_01,1);
	AI_Output(self,other, " DIA_Addon_Miguel_Fortuno_11_06 " );	// If you brew it the wrong way, or use the wrong ingredient, it can be deadly.
	AI_Output(other,self, " DIA_Addon_Miguel_Fortuno_15_07 " );	// I'll be careful.
	B_LogEntry(Topic_Addon_Fortuno, " Miguel gave me the recipe for a potion that will restore Fortuno's memory. But I must be sure of all the ingredients, otherwise I will end up with a deadly poison. " );
};


instance DIA_Addon_Miguel_BRAU (C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int DIA_Addon_Miguel_BRAU_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Miguel_Story ) && ( MIGUEL_TP  ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output(other,self, " DIA_Addon_Miguel_BRAU_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_Miguel_BRAU_11_01 " );	// I don't have time. I need to earn gold. And while I can't get to the camp, I live by selling plants.
	AI_Output(self,other, " DIA_Addon_Miguel_BRAU_11_02 " );	// But if you need potions, I still have a few.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, " I can buy drinks and plants from Miguel. " );
};


instance DIA_ADDON_MIGUEL_DRAGONS(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = dia_addon_miguel_dragons_condition;
	information = dia_addon_miguel_dragons_info;
	description = " How are you? " ;
};


func int dia_addon_miguel_dragons_condition()
{
	if ((Chapter ==  3 ) && (MY_AllDragonsDead ==  FALSE ) && ( MIGUEL_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_dragons_info()
{
	AI_Output(other,self, " DIA_Addon_Miguel_Dragons_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_Miguel_Dragons_10_01 " );	// Everything is quiet here. And you haven't been seen for a long time.
	AI_Output(other,self, " DIA_Addon_Miguel_Dragons_15_02 " );	// Yes, all things, things - in general, you understand.
	AI_Output(self,other, " DIA_Addon_Miguel_Dragons_10_07 " );	// Got it. By the way, I recently found one rare plant here. Perhaps it will interest you.
	CreateInvItems(self,ItPl_Perm_Herb,1);
};


instance DIA_Addon_Miguel_trade(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 888;
	condition = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Let's get down to business! " ;
};


func int DIA_Addon_Miguel_trade_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Addon_Miguel_BRAU) && ( MIGUEL_TP  ==  FALSE )) || (Capital ==  4 ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Miguel_trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};
