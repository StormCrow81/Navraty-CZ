

instance INFO_NOV_5_EXIT(C_Info)
{
	nr = 999;
	condition = info_nov_5_exit_condition;
	information = info_nov_5_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_nov_5_exit_condition()
{
	return TRUE;
};

func void info_nov_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_5_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_5_einervoneuchwerden_condition;
	information = info_nov_5_oneofyouwillbe_info;
	permanent = 1;
	description = " How can I join this Camp? " ;
};


func int info_nov_5_einervoneuchwerden_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_5_einervoneuchwerden_info()
{
	AI_Output(other, self, " Info_Nov_5_EinerVonEuchWerden_15_00 " );	// How can I join this Camp?
	AI_Output(self,other, " Info_Nov_5_EinerVonEuchWerden_05_01 " );	// There is nothing easier. Talk to the junior Gurus, they will help you.
	AI_Output(self,other, " Info_Nov_5_EinerVonEuchWerden_05_02 " );	// You'll like it here, you'll see.
};


instance INFO_NOV_5_IMPORTANT PEOPLE (C_Info)
{
	nr = 3;
	condition = info_nov_5_important people_condition;
	information = info_nov_5_important people_info;
	permanent = 1;
	description = " Who's in charge here? " ;
};


func int info_nov_5_important_persons_condition()
{
	return TRUE;
};

func void info_nov_5_important_persons_info()
{
	AI_Output(other,self, " Info_Nov_5_WichtigePersonen_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " Info_Nov_5_WichtigePersonen_05_01 " );	// Here everything is under the control of the Guru. But if you don't draw attention to yourself, they won't touch you.
};


instance INFO_NOV_5_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_5_daslager_condition;
	information = info_nov_5_daslager_info;
	permanent = 1;
	description = " Tell me about this Camp. " ;
};


func int info_nov_5_daslager_condition()
{
	return TRUE;
};

func void info_nov_5_daslager_info()
{
	AI_Output(other,self, " Info_Nov_5_DasLager_15_00 " );	// Tell me about this Camp.
	AI_Output(self,other, " Info_Nov_5_DasLager_05_01 " );	// This is the best place to set up our new camp.
	AI_Output(self,other, " Info_Nov_5_DasLager_05_02 " );	// Even if you're not one of us, you'll still get food and a bogweed here. All you need is to talk to Tallas.
	AI_Output(other,self, " Info_Nov_5_DasLager_15_03 " );	// Where can I find it?
	AI_Output(self,other, " Info_Nov_5_DasLager_05_04 " );	// He's on the platform above the forge.
};


instance INFO_NOV_5_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_5_dielage_condition;
	information = info_nov_5_dielage_info;
	permanent = 1;
	description = " How are you? " ;
};


func int info_nov_5_dielage_condition()
{
	return TRUE;
};

func void info_nov_5_dielage_info()
{
	AI_Output(other,self, " Info_Nov_5_DieLage_15_00 " );	// How are you?
	AI_Output(self,other, " Info_Nov_5_DieLage_05_01 " );	// Nothing to complain about. Tell me are you new?
	AI_Output(other, self, " Info_Nov_5_DieLage_15_02 " );	// I just arrived.
};


instance INFO_NOV_5_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_5_sekteheilen_condition;
	information = info_nov_5_sekteheilen_info;
	permanent = TRUE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int info_nov_5_sekteheilen_condition()
{
	if ((self.aivar[AIV_MM_SleepEnd] ==  FALSE ) && (Npc_HasItems(other,ItPo_HealObsession_MY) >  0 ) && ( MY_SECTION_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero,his_health_heal_obsession));
	{
		return TRUE;
	};
};

func void info_nov_5_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " Info_Nov_5_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE ;
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Wait(self,0);
	AI_Output(self,other, " Info_Nov_5_SekteHeilen_01_01 " );	// My head - it doesn't hurt anymore!!!
	AI_Output(self,other, " Info_Nov_5_SekteHeilen_01_02 " );	// Thank you so much!
};

func void b_assignambientinfos_sek_5(var C_Npc slf)
{
	info_nov_5_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_5_oneofyouwillbe.npc = Hlp_GetInstanceID(slf);
	info_nov_5_important persons.npc = Hlp_GetInstanceID(slf);
	info_nov_5_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_5_dielage.npc = Hlp_GetInstanceID(slf);
	info_nov_5_sekteheilen.npc = Hlp_GetInstanceID(slf);
};

