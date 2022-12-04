

instance INFO_NOV_3_EXIT(C_Info)
{
	nr = 999;
	condition = info_nov_3_exit_condition;
	information = info_nov_3_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_nov_3_exit_condition()
{
	return TRUE;
};

func void info_nov_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_3_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_3_einervoneuchwerden_condition;
	information = info_nov_3_oneofyouwillbe_info;
	permanent = 1;
	description = " Can I join the camp? " ;
};


func int info_nov_3_einervoneuchwerden_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_3_einervoneuchwerden_info()
{
	AI_Output(other,self, " Info_Nov_3_EinerVonEuchWerden_15_00 " );	// Can I join the camp?
	AI_Output(self,other, " Info_Nov_3_EinerVonEuchWerden_03_01 " );	// It's very simple.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02");	//Speak to one of the Gurus.
};


instance INFO_NOV_3_IMPORTANT PEOPLE (C_Info)
{
	nr = 3;
	condition = info_nov_3_important people_condition;
	information = info_nov_3_important people_info;
	permanent = 1;
	description = " Who has the main say here? " ;
};


func int info_nov_3_important_persons_condition()
{
	return TRUE;
};

func void info_nov_3_important_persons_info()
{
	AI_Output(other,self, " Info_Nov_3_WichtigePersonen_15_00 " );	// Who has the upper hand here?
	AI_Output(self,other, " Info_Nov_3_WichtigePersonen_03_01 " );	// Baal Orun, the oldest Guru! He brought us here.
	AI_Output(self,other, " Info_Nov_3_WichtigePersonen_03_02 " );	// Everything is governed by his will.
};


instance INFO_NOV_3_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_3_daslager_condition;
	information = info_nov_3_daslager_info;
	permanent = 1;
	description = " Is there anything I should be interested in? " ;
};


func int info_nov_3_daslager_condition()
{
	return TRUE;
};

func void info_nov_3_daslager_info()
{
	AI_Output(other,self, " Info_Nov_3_DasLager_15_00 " );	// Is there anything I should be interested in?
	AI_Output(self,other, " Info_Nov_3_DasLager_03_01 " );	// Sure, Talas, he gives you a ration of grass every day.
	AI_Output(self,other, " Info_Nov_3_DasLager_03_02 " );	// You'll find him on a wooden platform.
};


instance INFO_NOV_3_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_3_dielage_condition;
	information = info_nov_3_dielage_info;
	permanent = 1;
	description = " What's going on? " ;
};


func int info_nov_3_dielage_condition()
{
	return TRUE;
};

func void info_nov_3_dielage_info()
{
	AI_Output(other,self, " Info_Nov_3_DieLage_15_00 " );	// What's going on?
	AI_Output(self,other, " Info_Nov_3_DieLage_03_01 " );	// Nothing important, my friend.
};


instance INFO_NOV_3_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_3_sekteheilen_condition;
	information = info_nov_3_sekteheilen_info;
	permanent = TRUE;
	description = " Drink the potion! It will help your headache. " ;
};


func int info_nov_3_sekteheilen_condition()
{
	if ((self.aivar[AIV_MM_SleepEnd] ==  FALSE ) && (Npc_HasItems(other,ItPo_HealObsession_MY) >  0 ) && ( MY_SECTION_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero,his_health_heal_obsession));
	{
		return TRUE;
	};
};

func void info_nov_3_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " Info_Nov_3_SekteHeilen_01_00 " );	// Drink the potion! It will help your headache.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE ;
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Wait(self,0);
	AI_Output(self,other, " Info_Nov_3_SekteHeilen_01_01 " );	// My head! It doesn't hurt anymore!
	AI_Output(self,other, " Info_Nov_3_SekteHeilen_01_02 " );	// Thank you very much.
};

func void b_assignambientinfos_sek_3(var C_Npc slf)
{
	info_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_3_oneofyouwillbe.npc = Hlp_GetInstanceID(slf);
	info_nov_3_important persons.npc = Hlp_GetInstanceID(slf);
	info_nov_3_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_3_dielage.npc = Hlp_GetInstanceID(slf);
	info_nov_3_sekteheilen.npc = Hlp_GetInstanceID(slf);
};

