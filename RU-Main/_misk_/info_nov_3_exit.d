

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
	description = " How can I join this Camp? " ;
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
	AI_Output(other,self, " Info_Nov_3_EinerVonEuchWerden_15_00 " );	// How can I join this Camp?
	AI_Output(self,other, " Info_Nov_3_EinerVonEuchWerden_03_01 " );	// It's very simple.
	AI_Output(self,other, " Info_Nov_3_EinerVonEuchWerden_03_02 " );	// Talk to the Guru's - they will guide you on the right path.
};


instance INFO_NOV_3_IMPORTANT PEOPLE (C_Info)
{
	nr = 3;
	condition = info_nov_3_important people_condition;
	information = info_nov_3_important people_info;
	permanent = 1;
	description = " Who's in charge here? " ;
};


func int info_nov_3_important_persons_condition()
{
	return TRUE;
};

func void info_nov_3_important_persons_info()
{
	AI_Output(other,self, " Info_Nov_3_WichtigePersonen_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " Info_Nov_3_WichtigePersonen_03_01 " );	// The idol Oran is the eldest among the Guru's! He brought us to this glorious place.
	AI_Output(self,other, " Info_Nov_3_WichtigePersonen_03_02 " );	// All this was created by his will.
};


instance INFO_NOV_3_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_3_daslager_condition;
	information = info_nov_3_daslager_info;
	permanent = 1;
	description = " What should I pay attention to here? " ;
};


func int info_nov_3_daslager_condition()
{
	return TRUE;
};

func void info_nov_3_daslager_info()
{
	AI_Output(other,self, " Info_Nov_3_DasLager_15_00 " );	// Tell me something about this place.
	AI_Output(self,other, " Info_Nov_3_DasLager_03_01 " );	// There is a man called Tallas here. He gives free swamp weed to all followers of the sect.
	AI_Output(self,other, " Info_Nov_3_DasLager_03_02 " );	// You'll find him on the platform above the forge.
};


instance INFO_NOV_3_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_3_dielage_condition;
	information = info_nov_3_dielage_info;
	permanent = 1;
	description = " How are you? " ;
};


func int info_nov_3_dielage_condition()
{
	return TRUE;
};

func void info_nov_3_dielage_info()
{
	AI_Output(other,self, " Info_Nov_3_DieLage_15_00 " );	// How are you?
	AI_Output(self,other, " Info_Nov_3_DieLage_03_01 " );	// I'm in heaven, mate!
};


instance INFO_NOV_3_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_3_sekteheilen_condition;
	information = info_nov_3_sekteheilen_info;
	permanent = TRUE;
	description = " Drink a drink! It helps with a headache. " ;
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
	AI_Output(other,self, " Info_Nov_3_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE ;
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Wait(self,0);
	AI_Output(self,other, " Info_Nov_3_SekteHeilen_01_01 " );	// My head - it doesn't hurt anymore!!!
	AI_Output(self,other, " Info_Nov_3_SekteHeilen_01_02 " );	// Thank you so much!
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

