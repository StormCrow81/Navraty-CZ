

instance DIA_Rupert_EXIT(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 999;
	condition = DIA_Rupert_EXIT_Condition;
	information = DIA_Rupert_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rupert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Rupert_PICKPOCKET(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 998;
	condition = DIA_Rupert_PICKPOCKET_Condition;
	information = DIA_Rupert_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rupert_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_Rupert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
	Info_AddChoice(DIA_Rupert_PICKPOCKET,Dialog_Back,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rupert_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

instance DIA_RUPERT_NO_TALK(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = dia_rupert_no_talk_condition;
	information = dia_rupert_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_rupert_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_rupert_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};

instance DIA_Rupert_Hello(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_Hello_Condition;
	information = DIA_Rupert_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Rupert_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Hello_Info()
{
	AI_Output(self,other, " DIA_Rupert_Hello_03_00 " );	// Hello, outlander!
	AI_Output(self,other, " DIA_Rupert_Hello_03_01 " );	// You must be hungry and thirsty. Maybe you are interested in my products?
};


instance DIA_Rupert_ZuPal(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_ZuPal_Condition;
	information = DIA_Rupert_ZuPal_Info;
	permanent = FALSE;
	description = " I've come to meet the paladins. " ;
};


func int DIA_Rupert_ZuPal_Condition()
{
	if (chapter <  2 )
	{
		return TRUE;
	};
};

func void DIA_Rupert_ZuPal_Info()
{
	AI_Output(other,self, " DIA_Rupert_ZuPal_15_00 " );	// Frankly speaking, I came to meet with the paladins.
	AI_Output(self,other, " DIA_Rupert_ZuPal_03_01 " );	// You don't stand a chance of that! Since the paladins have settled in the upper quarter, it has become very difficult to get there.
};


instance DIA_Rupert_HelpMeIntoOV(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_HelpMeIntoOV_Condition;
	information = DIA_Rupert_HelpMeIntoOV_Info;
	permanent = FALSE;
	description = " Can you help me get to the upper quarter? " ;
};

func int DIA_Rupert_HelpMeIntoOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_ZuPal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_HelpMeIntoOV_Info()
{
	AI_Output(other,self, " DIA_Rupert_HelpMeIntoOV_15_00 " );	// Can you help me get to the upper quarter?
	AI_Output(self,other, " DIA_Rupert_HelpMeIntoOV_03_01 " );	// Me? No, my word means little!
	AI_Output(self,other, " DIA_Rupert_HelpMeIntoOV_03_02 " );	// Only a few people in the lower part of the city are powerful enough to get the guards to let you through.
	AI_Output(self,other, " DIA_Rupert_HelpMeIntoOV_03_03 " );	// Matteo, my boss, is one of them. Perhaps you should talk to him.

	if((CanTeachTownMaster == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other, " DIA_Rupert_HelpMeIntoOV_03_10 " );	// However, judging by your appearance, he is unlikely to even talk to you.
		AI_Output(other,self, " DIA_Rupert_HelpMeIntoOV_03_11 " );	// And what should I do?
		AI_Output(self,other, " DIA_Rupert_HelpMeIntoOV_03_12 " );	// You need to win his trust somehow.
		AI_Output(self,other, " DIA_Rupert_HelpMeIntoOV_03_13 " );	// Talk to Militia Pablo. I think he can help you somehow.
		RupertSendPablo = TRUE;
		Log_CreateTopic(TOPIC_OV,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OV,LOG_Running);
		B_LogEntry( TOPIC_OV , " To get to the upper quarter, I need the help of influential citizens from the lower part of the city. " );
		B_LogEntry_Quiet( TOPIC_OV , " Merchant Matteo is one of the powerful citizens of the lower part of the city. " );
		; _ _ _ _ _ _
	}
	else
	{
		Log_CreateTopic(TOPIC_OV,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OV,LOG_Running);
		B_LogEntry( TOPIC_OV , " To get to the upper quarter, I need the help of influential citizens from the lower part of the city. " );
		B_LogEntry_Quiet( TOPIC_OV , " Merchant Matteo is one of the powerful citizens of the lower part of the city. " );
	};
};


instance DIA_Rupert_WoMatteo(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_WoMatteo_Condition;
	information = DIA_Rupert_WoMatteo_Info;
	permanent = FALSE;
	description = " Where can I find Matteo? " ;
};

func int DIA_Rupert_WoMatteo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rupert_HelpMeIntoOV ) && ( hero . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WoMatteo_Info()
{
	AI_Output(other,self, " DIA_Rupert_WoMatteo_15_00 " );	// Where can I find Matteo?
	AI_Output(self,other, " DIA_Rupert_WoMatteo_03_01 " );	// You're standing right in front of his shop. Just come inside! He is almost always there.

	if(Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, " Matteo's shop is located at the south gate of the city. He sells equipment, weapons and other goods. " );
		Knows_Matteo = TRUE;
	};
};

instance DIA_Rupert_WerEinfluss(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 2;
	condition = DIA_Rupert_WerEinfluss_Condition;
	information = DIA_Rupert_WerInfluence_Info;
	permanent = FALSE;
	description = " What about other influential citizens? " ;
};


func int DIA_Rupert_WerEinfluss_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rupert_HelpMeIntoOV ) && ( hero . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WerEinfluss_Info()
{
	AI_Output(other,self, " DIA_Rupert_WerEinfluss_15_00 " );	// What about other influential citizens?
	AI_Output(self,other, " DIA_Rupert_WerEinfluss_03_01 " );	// Merchants and craftsmen, here on the main street, are the most influential figures in the city.
	AI_Output(self,other, " DIA_Rupert_WerEinfluss_03_02 " );	// You should try to become a student of one of them, like me.
	AI_Output(self,other, " DIA_Rupert_WerEinfluss_03_03 " );	// Ever since I've been working for Matteo, people in the city treat me with respect!

	if((CanTeachTownMaster == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other, " DIA_Rupert_WerEinfluss_03_10 " );	// However, none of them will talk to you until you win their trust.
		B_LogEntry( TOPIC_OV , " I should try to become an apprentice to one of the masters! But that will only be possible when I win their trust. " );
	}
	else
	{
		B_LogEntry( TOPIC_OV , " I should try to become a student of one of the masters. " );
	};
};

instance DIA_Rupert_Work(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 3;
	condition = DIA_Rupert_Work_Condition;
	information = DIA_Rupert_Work_Info;
	permanent = FALSE;
	description = " I need money and I'm looking for a job. " ;
};


func int DIA_Rupert_Work_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Rupert_Work_Info()
{
	AI_Output(other,self, " DIA_Rupert_Work_15_00 " );	// I need money and I'm looking for a job.
	AI_Output(self,other, " DIA_Rupert_Work_03_01 " );	// I heard that Bosper has problems with suppliers. His shop is over there.
	AI_Output(self,other, " DIA_Rupert_Work_03_02 " );	// They say he pays pretty well.
};


instance DIA_Rupert_YourOffer(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_YourOffer_Condition;
	information = DIA_Rupert_YourOffer_Info;
	permanent = FALSE;
	description = " What can you offer me? " ;
};

func int DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};

func void DIA_Rupert_YourOffer_Info()
{
	AI_Output(other,self, " DIA_Rupert_YourOffer_15_00 " );	// What can you offer me?
	AI_Output(self,other, " DIA_Rupert_YourOffer_03_01 " );	// Right now, I don't have much to eat.

	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other, " DIA_Rupert_YourOffer_03_02 " );	// That damn Onar isn't supplying food anymore, and what we get from the small farms isn't enough to meet the city's needs.
	};
};


instance DIA_Rupert_Trade(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 900;
	condition = DIA_Rupert_Trade_Condition;
	information = DIA_Rupert_Trade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};


func int DIA_Rupert_Trade_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Rupert_YourOffer) == TRUE) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Rupert_Trade_15_00 " );	// Show me your products.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Rupert_Trade_03_01 " );	// I apologize for the poor selection! A man in your position must be accustomed to the best.
	};
};


instance DIA_Rupert_Bauernaufstand (C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_Bauernaufstand_Condition;
	information = DIA_Rupert_Bauernaufstand_Info;
	permanent = FALSE;
	description = " Tell me about the peasant uprising. " ;
};


func int DIA_Rupert_Bauernaufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_YourOffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Bauernaufstand_Info()
{
	AI_Output(other,self, " DIA_Rupert_Bauernaufstand_15_00 " );	// Tell me about the peasant uprising.
	AI_Output(self,other, " DIA_Rupert_Bauernaufstand_03_01 " );	// It's pretty easy! Onar, a large landowner, no longer pays taxes to the city.
	AI_Output(self,other, " DIA_Rupert_Bauernaufstand_03_02 " );	// Just imagine! We are at war with the orcs, and this fat goose takes everything for himself!
	AI_Output(self,other, " DIA_Rupert_Bauernaufstand_03_03 " );	// Usually, the city guard takes drastic measures in such cases.
	AI_Output(self,other, " DIA_Rupert_Bauernaufstand_03_04 " );	// But now the most interesting thing is that Onar is said to have hired mercenaries to keep city troops out of his farm!
	AI_Output(self,other, " DIA_Rupert_Bauernaufstand_03_05 " );	// MERCENES! This will all end in war! As if one war wasn't enough!
};


instance DIA_Rupert_Mercs(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_Mercs_Condition;
	information = DIA_Rupert_Mercs_Info;
	permanent = FALSE;
	description = " What do you know about Onar's mercenaries? " ;
};


func int DIA_Rupert_Mercs_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Rupert_BauerException) && (hero.guild !=  GIL_SLD ) && (hero.guild !=  GIL_DJG ))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Mercs_Info()
{
	AI_Output(other,self, " DIA_Rupert_Mercs_15_00 " );	// What do you know about Onar's mercenaries?
	AI_Output(self,other, " DIA_Rupert_Mercs_03_01 " );	// I heard that most of them are former convicts from the colony.
	AI_Output(self,other, " DIA_Rupert_Mercs_03_02 " );	// And their leader was rumored to be a big shot under the king - a general or something - who was convicted of treason!
	AI_Output(self,other, " DIA_Rupert_Mercs_03_03 " );	// Terrible times!
};
