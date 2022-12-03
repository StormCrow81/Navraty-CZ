

instance DIA_CAINE_EXIT(C_Info)
{
	npc = sek_8008_caine;
	nr = 999;
	condition = dia_caine_exit_condition;
	information = dia_caine_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_caine_exit_condition()
{
	return TRUE;
};

func void dia_caine_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_caine_PICKPOCKET(C_Info)
{
	npc = sek_8008_caine;
	nr = 900;
	condition = dia_caine_PICKPOCKET_Condition;
	information = dia_caine_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_caine_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 43 );
};

func void dia_caine_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_caine_PICKPOCKET);
	Info_AddChoice(dia_caine_PICKPOCKET,Dialog_Back,dia_caine_PICKPOCKET_BACK);
	Info_AddChoice(dia_caine_PICKPOCKET,DIALOG_PICKPOCKET,dia_caine_PICKPOCKET_DoIt);
};

func void dia_caine_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_caine_PICKPOCKET);
};

func void dia_caine_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_caine_PICKPOCKET);
};

instance DIA_CAINE_WHATYOUDO(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_whatyoudo_condition;
	information = dia_caine_whatyoudo_info;
	permanent = FALSE;
	important = FALSE;
	description = " What are you doing? " ;
};


func int dia_caine_whatyoudo_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_SEK)) && (MIS_PLANTSFORBAALCADAR != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_caine_whatyoudo_info()
{
	AI_Output(other,self, " DIA_Caine_WhatYouDo_01_00 " );	// What are you doing?
	AI_Output(self,other, " DIA_Caine_WhatYouDo_01_01 " );	// We collect the swamp. After our brothers finish processing, it can be smoked.
};


instance DIA_CAINE_CAINSENTTOCADAR(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_cainsenttocadar_condition;
	information = dia_caine_cainsenttocadar_info;
	permanent = FALSE;
	important = FALSE;
	description = " I would like to join your Camp. Could you help me? " ;
};


func int dia_caine_cainsenttocadar_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_SEK)) && (PSI_TALK == TRUE) && Npc_KnowsInfo(hero,dia_caine_whatyoudo))
	{
		return TRUE;
	};
};

func void dia_caine_cainsenttocadar_info()
{
	AI_Output(other,self, " DIA_Caine_CainSentToCadar_01_00 " );	// I would like to join your camp. Could you help me?
	AI_Output(self,other, " DIA_Caine_CainSentToCadar_01_01 " );	// Do you want to join us? Good!
	AI_Output(self,other, " DIA_Caine_CainSentToCadar_01_02 " );	// You must have noticed that none of the Guru wants to talk to you.
	AI_Output(self,other, " DIA_Caine_CainSentToCadar_01_03 " );	// To get your way, you need to impress them!
	AI_Output(other,self, " DIA_Caine_CainSentToCadar_01_04 " );	// How to impress Guru?
	AI_Output(self,other, " DIA_Caine_CainSentToCadar_01_05 " );	// Just try to be helpful.
	AI_Output(other,self, " DIA_Caine_CainSentToCadar_01_06 " );	// Thanks for the advice.
};


instance DIA_CAINE_SENTPLANTSTOCADAR(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_sentplantstocadar_condition;
	information = dia_caine_sentplantstocadar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_caine_sentplantstocadar_condition()
{
	if ((other.guild ==  GIL_SEK ) && ( PSI_TALK  ==  TRUE ) && Npc_KnowsInfo(hero, his_chain_is_not_in_cadar ) && Wld_IsTime( 8 , 0 , 21 , 0 )) ;
	{
		return TRUE;
	};
};

func void dia_caine_sentplantstocadar_info()
{
	AI_Output(self,other, " DIA_Caine_SentPlantsToCadar_01_00 " );	// Wait a minute... Yes, I think I can help you.
	AI_Output(self,other, " DIA_Caine_SentPlantsToCadar_01_01 " );	// Do me a favor.
	AI_Output(other,self, " DIA_Caine_SentPlantsToCadar_01_02 " );	// What should I do?
	AI_Output(self,other, " DIA_Caine_SentPlantsToCadar_01_03 " );	// Kindly take this collection of bogweed to Idol Kadar. He must have been waiting for it.
	AI_Output(other,self, " DIA_Caine_SentPlantsToCadar_01_04 " );	// Why don't you do it yourself?
	AI_Output(self,other, " DIA_Caine_SentPlantsToCadar_01_05 " );	// I told you... In order to impress the Guru, you must try to be helpful. Understand?
	AI_Output(self,other, " DIA_Caine_SentPlantsToCadar_01_06 " );	// Consider me giving you a chance to prove yourself to the Guru.
	AI_Output(other,self, " DIA_Caine_SentPlantsToCadar_01_07 " );	// Okay, I'll give him this swamp.
	AI_Output(self,other, " DIA_Caine_SentPlantsToCadar_01_08 " );	// Great! Just don't mess with it.
	B_GiveInvItems(self,other,ItPl_SwampHerb,50);
	Log_CreateTopic(TOPIC_CAINSENTTOCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAINSENTTOCADAR,LOG_Running);
	B_LogEntry( TOPIC_CAINSENTTOCADAR , " Cain asked me to take another collection of bogweed to Idol Kadar. That way I can be of service to the Brotherhood. " );
	MIS_CAINSENTTOCADAR = LOG_Running;
};


instance DIA_CAINE_SENTPLANTSTOCADAROK(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_sentplantstocadarok_condition;
	information = dia_caine_sentplantstocadarok_info;
	permanent = FALSE;
	important = FALSE;
	description = " I've taken your swamp. " ;
};


func int dia_caine_sentplantstocadarok_condition()
{
	if((other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (MIS_CAINSENTTOCADAR == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_caine_sentplantstocadarok_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Caine_SentPlantsToCadarOk_01_00 " );	// I took your swamp.
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadarOk_01_01");	//И?
	AI_Output(other,self, " DIA_Caine_SentPlantsToCadarOk_01_02 " );	// Idol Kadar spoke to me and gave me one task.
	AI_Output(self,other, " DIA_Caine_SentPlantsToCadarOk_01_03 " );	// You see! Keep up the good work, and soon you will surely become one of us.
};


instance DIA_CAINE_HOWWORK(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_howwork_condition;
	information = dia_caine_howwork_info;
	permanent = TRUE;
	important = FALSE;
	description = " How is harvesting? " ;
};


func int dia_caine_howwork_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_SUCCESS) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_caine_howwork_info()
{
	AI_Output(other,self, " DIA_Caine_HowWork_01_00 " );	// How is the harvest?
	AI_Output(self,other, " DIA_Caine_HowWork_01_01 " );	// Yes, yes, laugh, laugh. I'm sure the Gurus entrust you with a better job.
	AI_Output(self,other, " DIA_Caine_HowWork_01_02 " );	// At least I don't have to hump myself.
};

instance DIA_CAINE_SEKTEHEILEN (C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_sekteheilen_condition;
	information = dia_caine_sekteheilen_info;
	permanent = FALSE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int dia_caine_sekteheilen_condition()
{
	if ((Npc_HasItems(other,ItPo_Heal_Obsession_MY) >  0 ) && ( MY_SECTS_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero, dia_heal_sectarian_obsession));
	{
		return TRUE;
	};
};

func void dia_caine_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Caine_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Output(self,other, " DIA_Caine_SekteHeilen_01_01 " );	// I already feel better!
	AI_Output(self,other, " DIA_Caine_SekteHeilen_01_02 " );	// Thank you!
};
