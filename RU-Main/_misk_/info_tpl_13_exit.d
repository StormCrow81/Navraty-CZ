

instance INFO_TPL_13_EXIT(C_Info)
{
	nr = 999;
	condition = info_tpl_13_exit_condition;
	information = info_tpl_13_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_tpl_13_exit_condition()
{
	return TRUE;
};

func void info_tpl_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_13_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_tpl_13_einervoneuchwerden_condition;
	information = info_tpl_13_einervoneuchwerden_info;
	permanent = 1;
	description = " I want to become a Guardian, just like you. " ;
};


func int info_tpl_13_einervoneuchwerden_condition()
{
	if((other.guild != GIL_TPL) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_13_einervoneuchwerden_info()
{
	AI_Output(other,self, " Info_Tpl_13_EinerVonEuchWerden_15_00 " );	// I want to become a Guardian, just like you.
	AI_Output(self,other, " Info_Tpl_13_EinerVonEuchWerden_13_01 " );	// Do you know what I had to give up before I could stand guard over the peace of the Brotherhood's chosen ones?
	AI_Output(self,other, " Info_Tpl_13_EinerVonEuchWerden_13_02 " );	// Don't think that you can easily get to this place and get proper honor and respect.
	AI_Output(self,other, " Info_Tpl_13_EinerVonEuchWerden_13_03 " );	// Before talking about it, you should know a little about our new teaching.
	AI_Output(self,other, " Info_Tpl_13_EinerVonEuchWerden_13_04 " );	// This will take some time and may bring you back to your senses.
};


instance INFO_TPL_13_IMPORTANT PEOPLE (C_Info)
{
	nr = 3;
	condition = info_tpl_13_important people_condition;
	information = info_tpl_13_important people_info;
	permanent = 1;
	description = " Who's in charge here? " ;
};


func int info_tpl_13_important_persons_condition()
{
	return TRUE;
};

func void info_tpl_13_important_persons_info()
{
	AI_Output(other,self, " Info_Tpl_13_WichtigePersonen_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " Info_Tpl_13_WichtigePersonen_13_01 " );	// Our Gurus and chosen Guardians. Our faith determines our destiny, and the Gurus serve as prophets to him.
};


instance INFO_TPL_13_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_tpl_13_dielage_condition;
	information = info_tpl_13_dielage_info;
	permanent = 1;
	description = " How are you? " ;
};


func int info_tpl_13_dielage_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_13_dielage_info()
{
	AI_Output(other, self, " Info_Tpl_13_DieLage_15_00 " );	// How are you?
	AI_Output(self,other, " Info_Tpl_13_DieLage_13_01 " );	// Since I became one of the chosen defenders of the faith, I feel like never before.
	AI_Output(other, self, " Info_Tpl_13_DieLage_15_02 " );	// Sounds interesting...
	AI_Output(self,other, " Info_Tpl_13_DieLage_13_03 " );	// You are not a believer. You can not understand.
};

func void b_assignambientinfos_tpl_13(var C_Npc slf)
{
	info_tpl_13_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_wichigepeople.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_dielage.npc = Hlp_GetInstanceID(slf);
};

