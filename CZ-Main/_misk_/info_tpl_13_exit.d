

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
	description = " I would like to become a templar like you. " ;
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
	AI_Output(other,self, " Info_Tpl_13_EinerVonEuchWerden_15_00 " );	// I'd like to become a templar like you.
	AI_Output(self,other, " Info_Tpl_13_EinerVonEuchWerden_13_01 " );	// Do you know how many things I had to renounce in order to be called the guardian of peace and the protector of the chosen of our Brotherhood?
	AI_Output(self,other, " Info_Tpl_13_EinerVonEuchWerden_13_02 " );	// Don't think you can just become a Templar and gain the respect and honor that comes with it.
	AI_Output(self,other, " Info_Tpl_13_EinerVonEuchWerden_13_03 " );	// First, you should thoroughly familiarize yourself with our teachings.
	AI_Output(self,other, " Info_Tpl_13_EinerVonEuchWerden_13_04 " );	// This will take some time.
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
	AI_Output(self,other, " Info_Tpl_13_WichtigePersonen_13_01 " );	// Our Gurus and Chosen Templars. Our faith shapes our destiny and Gurus serve as our prophets.
};


instance INFO_TPL_13_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_tpl_13_dielage_condition;
	information = info_tpl_13_dielage_info;
	permanent = 1;
	description = "Jak je?";
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
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Whats up?
	AI_Output(self,other, " Info_Tpl_13_DieLage_13_01 " );	// Ever since I was chosen as a Templar, I feel like never before.
	AI_Output(other,self, " Info_Tpl_13_DieLage_15_02 " );	// That sounds interesting...
	AI_Output(self,other, " Info_Tpl_13_DieLage_13_03 " );	// You are not a believer, you cannot understand this.
};

func void b_assignambientinfos_tpl_13(var C_Npc slf)
{
	info_tpl_13_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_wichigepeople.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_dielage.npc = Hlp_GetInstanceID(slf);
};

