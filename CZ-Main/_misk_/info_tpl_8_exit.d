

instance INFO_TPL_8_EXIT(C_Info)
{
	nr = 999;
	condition = info_tpl_8_exit_condition;
	information = info_tpl_8_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_tpl_8_exit_condition()
{
	return TRUE;
};

func void info_tpl_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_8_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_tpl_8_einervoneuchwerden_condition;
	information = info_tpl_8_einervoneuchwerden_info;
	permanent = 1;
	description = " Are you looking for good people? " ;
};


func int info_tpl_8_einervoneuchwerden_condition()
{
	if((other.guild != GIL_TPL) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_8_einervoneuchwerden_info()
{
	AI_Output(other,self, " Info_Tpl_8_EinerVonEuchWerden_15_00 " );	// Are you finding good people?
	AI_Output(self,other, " Info_Tpl_8_EinerVonEuchWerden_08_01 " );	// Of course, good people are always needed. But you still have to work on yourself a lot. Only the best can make it to the Templars.
	AI_Output(self,other, " Info_Tpl_8_EinerVonEuchWerden_08_02 " );	// This is the highest honor for followers of the Brotherhood.
};


instance INFO_TPL_8_IMPORTANT PEOPLE (C_Info)
{
	nr = 3;
	condition = info_tpl_8_important people_condition;
	information = info_tpl_8_important people_info;
	permanent = 1;
	description = " Who's in charge here? " ;
};


func int info_tpl_8_important_persons_condition()
{
	return TRUE;
};

func void info_tpl_8_important_persons_info()
{
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//Who leads you?
	AI_Output(self,other, " Info_Tpl_8_WichtigePersonen_08_01 " );	// We serve the Guru. This is our sacred duty.
	AI_Output(other,self, " Info_Tpl_8_WichtigePersonen_15_02 " );	// And who are these Gurus?
	AI_Output(self,other, " Info_Tpl_8_WichtigePersonen_08_03 " );	// The Supreme Guru is Baal Orun. The other Gurus answer to him, as does Gor Na Kosh, the leader of the Templars.
};


instance INFO_TPL_8_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_tpl_8_daslager_condition;
	information = info_tpl_8_daslager_info;
	permanent = 1;
	description = " What will you tell me about the camp? " ;
};


func int info_tpl_8_daslager_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_8_daslager_info()
{
	AI_Output(other,self, " Info_Tpl_8_DasLager_15_00 " );	// What will you tell me about the camp?
	AI_Output(self,other, " Info_Tpl_8_DasLager_08_01 " );	// You're new here, so for now you can go wherever you like. Fighting in the camp is prohibited.
	AI_Output(self,other, " Info_Tpl_8_DasLager_08_02 " );	// Try not to break these rules. Also, don't disturb us during our meditation.
};


instance INFO_TPL_8_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_tpl_8_dielage_condition;
	information = info_tpl_8_dielage_info;
	permanent = 1;
	description = "Jak se vede?";
};


func int info_tpl_8_dielage_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return  1 ;
	};
};

func void info_tpl_8_dielage_info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//How are you?
	AI_Output(self,other, " Info_Tpl_8_DieLage_08_01 " );	// I warn you: I will not tolerate disrespect here. You are talking to one of the templars.
};

func void b_assignambientinfos_tpl_8(var C_Npc slf)
{
	info_tpl_8_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_wichigepeople.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_daslager.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_dielage.npc = Hlp_GetInstanceID(slf);
};

