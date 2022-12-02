

instance DIA_XBS_1_EXIT(C_Info)
{
	nr = 999;
	condition = dia_xbs_1_exit_condition;
	information = dia_xbs_1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xbs_1_exit_condition()
{
	return TRUE;
};

func void dia_xbs_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XBS_1_ABOUT(C_Info)
{
	nr = 1;
	condition = dia_xbs_1_about_condition;
	information = dia_xbs_1_about_info;
	permanent = TRUE;
	description = " What are you even doing here? " ;
};


func int dia_xbs_1_about_condition()
{
	return TRUE;
};

func void dia_xbs_1_about_info()
{
	AI_Output(other,self, " DIA_XBS_1_ABOUT_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_XBS_1_ABOUT_01_01 " );	// We live, hunt, discuss the past and listen to the voices of the future.
	b_heroknowforestbase();
};


instance DIA_XBS_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = dia_xbs_1_people_condition;
	information = dia_xbs_1_people_info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int dia_xbs_1_people_condition()
{
	return TRUE;
};

func void dia_xbs_1_people_info()
{
	AI_Output(other,self, " DIA_XBS_1_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_XBS_1_PEOPLE_01_01 " );	// We're here to learn from Netback.
	AI_Output(self,other, " DIA_XBS_1_PEOPLE_01_02 " );	// But he doesn't take care of camp life.
	AI_Output(self,other, " DIA_XBS_1_PEOPLE_01_03 " );	// The house manager is now Gor Na Bar.
	AI_Output(self,other, " DIA_XBS_1_PEOPLE_01_04 " );	// Otherwise, we are all equal - no ranks and privileges.
	b_heroknowforestbase();
};


instance DIA_XBS_1_LOCATION(C_Info)
{
	nr = 2;
	condition = dia_xbs_1_location_condition;
	information = dia_xbs_1_location_info;
	permanent = TRUE;
	description = " What's in the camp? " ;
};


func int dia_xbs_1_location_condition()
{
	return TRUE;
};

func void dia_xbs_1_location_info()
{
	AI_Output(other,self, " DIA_XBS_1_LOCATION_15_00 " );	// What is interesting in the camp?
	AI_Output(self,other, " DIA_XBS_1_LOCATION_01_01 " );	// Nothing! It's not a city or even a castle.
	AI_Output(self,other, " DIA_XBS_1_LOCATION_01_02 " );	// Several tents and several novices.
	AI_Output(self,other, " DIA_XBS_1_LOCATION_01_03 " );	// However, a detachment of paladins of Innos settled down in the cave. Go to them - they probably have a more interesting life.
	b_heroknowforestbase();
};


instance DIA_XBS_1_STANDARD(C_Info)
{
	nr = 4;
	condition = dia_xbs_1_standard_condition;
	information = dia_xbs_1_standard_info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int dia_xbs_1_standard_condition()
{
	return TRUE;
};

func void dia_xbs_1_standard_info()
{
	AI_Output(other,self, " DIA_XBS_1_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_XBS_1_STANDARD_01_01 " );	// No one has been seen from the Swamp Camp for several weeks - except for those who have gathered here, of course.
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_XBS_1_STANDARD_01_02 " );	// The wind sometimes carries screams from behind the fence even here. I wouldn't want to be in a castle right now!
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_XBS_1_STANDARD_01_03 " );	// Some kind of sadness attacked all the guys. It seems that we have lost something or someone forever.
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_XBS_1_STANDARD_01_04 " );	// A new group of orcs has recently arrived here. I think the defenders of the castle will soon have a very tight time!
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_XBS_1_STANDARD_01_05 " );	// Rumor has it that it was you who exterminated all the dragons. How did you do it, boy?!
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_XBS_1_STANDARD_01_06 " );	// They say the orcs stormed the castle after all! I'm afraid they'll get to us soon.
	};
	b_heroknowforestbase();
};

func void b_assignambientinfos_xbs(var C_Npc slf)
{
	dia_xbs_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_about.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_people.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_location.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_standard.npc = Hlp_GetInstanceID(slf);
};

