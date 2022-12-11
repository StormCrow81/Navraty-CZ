

instance DIA_VLK_17_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_17_EXIT_Condition;
	information = DIA_VLK_17_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_17_JOIN_Condition;
	information = DIA_VLK_17_JOIN_Info;
	permanent = TRUE;
	description = " What do you need to become a citizen of this city? " ;
};


func int DIA_VLK_17_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_VLK_17_JOIN_Info()
{
	AI_Output(other, self, " DIA_VLK_17_JOIN_15_00 " );	// What do you need to become a citizen of this city?
	AI_Output(self,other, " DIA_VLK_17_JOIN_17_01 " );	// The craftsmen from the lower part of the city have a very big influence here in Khorinis. You should talk to one of them.
};


instance DIA_VLK_17_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_17_PEOPLE_Condition;
	information = DIA_VLK_17_PEOPLE_Info;
	permanent = TRUE;
	description = " Who has the most influence in this city? " ;
};


func int DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_VLK_17_PEOPLE_15_00 " );	// And who has the most influence in this city?
	AI_Output(self,other, " DIA_VLK_17_PEOPLE_17_01 " );	// Since the paladins came to the city, they have taken all power into their own hands.
	AI_Output(self,other, " DIA_VLK_17_PEOPLE_17_02 " );	// Lord Andre represents the law. You will find him in the barracks.
	AI_Output(self,other, " DIA_VLK_17_PEOPLE_17_03 " );	// But you should only go to him if you've broken the law or want to join the militia.
};


instance DIA_VLK_17_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_17_LOCATION_Condition;
	information = DIA_VLK_17_LOCATION_Info;
	permanent = TRUE;
	description = " Are there interesting places in Khorinis? " ;
};


func int DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_LOCATION_Info()
{
	AI_Output(other,self, " DIA_VLK_17_LOCATION_15_00 " );	// Are there interesting places in Khorinis?
	AI_Output(self,other, " DIA_VLK_17_LOCATION_17_01 " );	// (laughs) You should probably ask the men about it. If you're looking for entertainment, try your luck at the port.
	AI_Output(self,other, " DIA_VLK_17_LOCATION_17_02 " );	// But if you want to buy something, go to the market square at the east gate, or to the lower part of the city.
};


instance DIA_VLK_17_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_17_STANDARD_Condition;
	information = DIA_VLK_17_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_STANDARD_Info()
{
	AI_Output(other,self, " DIA_VLK_17_STANDARD_15_00 " );	// What's new?
	if ((chapter ==  1 ) || (chapter ==  2 ))
	{
		AI_Output(self,other, " DIA_VLK_17_STANDARD_17_01 " );	// I wonder why the paladins came here? They have occupied the city hall, the barracks and the harbor, but so far they have done absolutely nothing.
		AI_Output(self,other, " DIA_VLK_17_STANDARD_17_02 " );	// If they'd come here to protect us from orcs or bandits, they'd have dealt with them a long time ago. They must have some other reason...
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_VLK_17_STANDARD_17_03 " );	// I just realized what the paladins are doing here. It's all because of the ore. It would be better if they defended the city instead.
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_VLK_17_STANDARD_17_04 " );	// I hope these rumors about dragons turn out to be true. Then Lord Hagen will have to do something. He can't just leave us to be eaten by dragons.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_VLK_17_STANDARD_17_05 " );	// Now that the dragons are dead, the paladins will quickly deal with the remaining threats.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_VLK_17_STANDARD_17_06 " );	// Thhe Orcish massacre of the city - I still dream about it! Oh gods, are we all going to die?!
	};
};

func void B_AssignAmbientInfos_VLK_17(var C_Npc slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

