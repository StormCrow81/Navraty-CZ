

instance INFO_NOV_2_EXIT(C_Info)
{
	nr = 999;
	condition = info_nov_2_exit_condition;
	information = info_nov_2_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_nov_2_exit_condition()
{
	return TRUE;
};

func void info_nov_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_2_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_2_einervoneuchwerden_condition;
	information = info_nov_2_oneofyouwillbe_info;
	permanent = 1;
	description = " I want to join you. " ;
};


func int info_nov_2_einervoneuchwerden_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_2_einervoneuchwerden_info()
{
	AI_Output(other,self, " Info_Nov_2_EinerVonEuchWerden_15_00 " );	// I want to join you.
	AI_Output(self,other, " Info_Nov_2_EinerVonEuchWerden_02_01 " );	// Have you decided to serve the Brotherhood? The path to good luck and prosperity is open before you!
	AI_Output(self,other, " Info_Nov_2_EinerVonEuchWerden_02_02 " );	// Talk to Idol Oran. He will decide what is best for you.
};


instance INFO_NOV_2_IMPORTANT PEOPLE (C_Info)
{
	nr = 3;
	condition = info_nov_2_important people_condition;
	information = info_nov_2_important persons_info;
	permanent = 1;
	description = " Who is leading you? " ;
};


func int info_nov_2_important_persons_condition()
{
	return TRUE;
};

func void info_nov_2_important_persons_info()
{
	AI_Output(other,self, " Info_Nov_2_WichtigePersonen_15_00 " );	// Who is leading you?
	AI_Output(self,other, " Info_Nov_2_WichtigePersonen_02_01 " );	// Our mentors are Gurus. They are very powerful and wise people!
	AI_Output(self,other, " Info_Nov_2_WichtigePersonen_02_02 " );	// They guide us on the path of truth and grant us divine enlightenment.
};


instance INFO_NOV_2_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_2_daslager_condition;
	information = info_nov_2_daslager_info;
	permanent = 1;
	description = " Tell me about this place. " ;
};


func int info_nov_2_daslager_condition()
{
	return TRUE;
};

func void info_nov_2_daslager_info()
{
	AI_Output(other,self, " Info_Nov_2_DasLager_15_00 " );	// Tell me about this place.
	AI_Output(self,other, " Info_Nov_2_DasLager_02_01 " );	// This is a place of faith, brother. Everything that we have, we are ready to share with everyone who believes in the teachings of the Idols.
	AI_Output(self,other, " Info_Nov_2_DasLager_02_02 " );	// Talk to one of the Gurus, enrich your soul.
};


instance INFO_NOV_2_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_2_dielage_condition;
	information = info_nov_2_dielage_info;
	permanent = 1;
	description = " How are you? " ;
};


func int info_nov_2_dielage_condition()
{
	return TRUE;
};

func void info_nov_2_dielage_info()
{
	AI_Output(other,self, " Info_Nov_2_DieLage_15_00 " );	// How are you?
	AI_Output(self,other, " Info_Nov_2_DieLage_02_01 " );	// I don't have much time. There are always things to do.
};


instance INFO_NOV_2_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_2_sekteheilen_condition;
	information = info_nov_2_sekteheilen_info;
	permanent = TRUE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int info_nov_2_sekteheilen_condition()
{
	if ((self.aivar[AIV_MM_SleepEnd] ==  FALSE ) && (Npc_HasItems(other,ItPo_HealObsession_MY) >  0 ) && ( MY_SECTION_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero,his_health_heal_obsession));
	{
		return TRUE;
	};
};

func void info_nov_2_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " Info_Nov_2_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE ;
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Wait(self,0);
	AI_Output(self,other, " Info_Nov_2_SekteHeilen_01_01 " );	// My head - it doesn't hurt anymore!!!
	AI_Output(self,other, " Info_Nov_2_SekteHeilen_01_02 " );	// Thank you so much!
};

func void b_assignambientinfos_sek_2(var C_Npc slf)
{
	info_nov_2_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_2_oneofyouwillbe.npc = Hlp_GetInstanceID(slf);
	info_nov_2_important persons.npc = Hlp_GetInstanceID(slf);
	info_nov_2_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_2_dielage.npc = Hlp_GetInstanceID(slf);
	info_nov_2_sekteheilen.npc = Hlp_GetInstanceID(slf);
};

