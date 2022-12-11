

instance DIA_VLK_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_6_EXIT_Condition;
	information = DIA_VLK_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_6_JOIN_Condition;
	information = DIA_VLK_6_JOIN_Info;
	permanent = TRUE;
	description = " How can I become a citizen of this city? " ;
};


func int DIA_VLK_6_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_VLK_6_JOIN_Info()
{
	AI_Output(other, self, " DIA_VLK_6_JOIN_15_00 " );	// How do I become a citizen of this city?
	AI_Output(self,other, " DIA_VLK_6_JOIN_06_01 " );	// Do you want to settle down here? Now? When everything is pointing to the end of the world?
	AI_Output(other, self, " DIA_VLK_6_JOIN_15_02 " );	// It would only be a temporary stay.
	AI_Output(self,other, " DIA_VLK_6_JOIN_06_03 " );	// Want some advice? You need to get out of here, and the farther the better. However, if you insist, you can talk to one of the influential citizens.
};


instance DIA_VLK_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_6_PEOPLE_Condition;
	information = DIA_VLK_6_PEOPLE_Info;
	permanent = TRUE;
	description = " Where can I find influential citizens of Khorinis? " ;
};


func int DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_VLK_6_PEOPLE_15_00 " );	// And where can I find influential citizens of Khorinis?
	AI_Output(self,other, " DIA_VLK_6_PEOPLE_06_01 " );	// Try going to the blacksmith or carpenter in the lower part of town. You will also find other respected masters there.
	AI_Output(self,other, " DIA_VLK_6_PEOPLE_06_02 " );	// Even paladins and city guards listen to their counsel.
};


instance DIA_VLK_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_6_LOCATION_Condition;
	information = DIA_VLK_6_LOCATION_Info;
	permanent = TRUE;
	description = " How can I learn to navigate the city? " ;
};


func int DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_LOCATION_Info()
{
	AI_Output(other,self, " DIA_VLK_6_LOCATION_15_00 " );	// How can I learn to navigate the city?
	AI_Output(self,other, " DIA_VLK_6_LOCATION_06_01 " );	// Having trouble navigating the big city eh?
	AI_Output(self,other, " DIA_VLK_6_LOCATION_06_02 " );	// There are signposts around, but maybe you better go down to the harbor and look for the cartographer's house.
	AI_Output(self,other, " DIA_VLK_6_LOCATION_06_03 " );	// It is located next to the tavern at the pier. Ibrahim will surely have a map of the city for you.
};


instance DIA_VLK_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_6_STANDARD_Condition;
	information = DIA_VLK_6_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_STANDARD_Info()
{
	AI_Output(other,self, " DIA_VLK_6_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_VLK_6_STANDARD_06_01 " );	// Ever since the Barrier collapsed, the city has been filled with bandits. But the paladins are sitting on their hands. What the hell are they doing here then?
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_VLK_6_STANDARD_06_02 " );	// Lately, the problems with the bandits have abated a bit. Looks like someone finally took them on.
	};
	if (chapter ==  3 )
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_VLK_6_STANDARD_06_03 " );	// They let that filthy mercenary who killed the paladin go free. I think it would have been better to hang him.
		}
		else
		{
			AI_Output(self,other, " DIA_VLK_6_STANDARD_06_04 " );	// It is said that one of Onar's mercenaries killed a paladin. The killer was caught and thrown behind bars. He will be hanged soon.
		};
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_VLK_6_STANDARD_06_05 " );	// I wonder if there's any truth to these dragon stories...
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_VLK_6_STANDARD_06_06 " );	// Lord Hagen is said to be gathering his people to liberate the Vale of Mines. Finally, the paladins are moving!
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_VLK_6_STANDARD_06_07 " );	// Lord Hagen retreated with his men to the fort. I reckon the paladins will go on the counteroffensive soon.
	};
};

func void B_AssignAmbientInfos_VLK_6(var C_Npc slf)
{
	dia_vlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

