

instance DIA_VLK_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_1_EXIT_Condition;
	information = DIA_VLK_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_1_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_1_JOIN_Condition;
	information = DIA_VLK_1_JOIN_Info;
	permanent = TRUE;
	description = " How can I become a citizen of this city? " ;
};


func int DIA_VLK_1_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_VLK_1_JOIN_Info()
{
	AI_Output(other, self, " DIA_VLK_1_JOIN_15_00 " );	// How do I become a citizen of this city?
	AI_Output(self,other, " DIA_VLK_1_JOIN_01_01 " );	// Get yourself a decent job! All who have an occupation in Khorinis are considered citizens of the city.
};


instance DIA_VLK_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_1_PEOPLE_Condition;
	information = DIA_VLK_1_PEOPLE_Info;
	permanent = TRUE;
	description = " Who are the most influential citizens here? " ;
};


func int DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_VLK_1_PEOPLE_15_00 " );	// And who are the most influential citizens here?
	AI_Output(self,other, " DIA_VLK_1_PEOPLE_01_01 " );	// Until recently, they were the head of the city and the judge. But then the paladins came and seized all power in the city.
	AI_Output(self,other, " DIA_VLK_1_PEOPLE_01_02 " );	// They are led by Lord Hagen! He is now the new head, no more and no less.
	AI_Output(self,other, " DIA_VLK_1_PEOPLE_01_03 " );	// Lord Andre is his right hand. He leads the city guard and also acts as a judge.
	AI_Output(self,other, " DIA_VLK_1_PEOPLE_01_04 " );	// If an accusation is made against someone, that person must be brought before Lord Andre.
};


instance DIA_VLK_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_1_LOCATION_Condition;
	information = DIA_VLK_1_LOCATION_Info;
	permanent = TRUE;
	description = " What's interesting in the city? " ;
};


func int DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_LOCATION_Info()
{
	AI_Output(other,self, " DIA_VLK_1_LOCATION_15_00 " );	// What is interesting in the city?
	AI_Output(self,other, " DIA_VLK_1_LOCATION_01_01 " );	// Here you can buy almost anything you can imagine. Either at the merchant in the market, or in the lower part of the city.
	AI_Output(self,other, " DIA_VLK_1_LOCATION_01_02 " );	// But almost everything worth buying is expensive.
	AI_Output(self,other, " DIA_VLK_1_LOCATION_01_03 " );	// If you don't have enough money, then perhaps the loan shark Lemar can help you. His house is located at the very beginning of the port quarter, if you go from the bottom of the city.
};


instance DIA_VLK_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_1_STANDARD_Condition;
	information = DIA_VLK_1_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_STANDARD_Info()
{
	AI_Output(other,self, " DIA_VLK_1_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_VLK_1_STANDARD_01_01 " );	// Since the Barrier collapsed, open trade with a large landowner has suddenly ceased. Who knows what he's up to. All this smells bad.
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_VLK_1_STANDARD_01_02 " );	// Onar has gone too far. He is still not supplying food to the city. If the militia doesn't intervene, the other farmers will soon do whatever they want to as well.
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_VLK_1_STANDARD_01_03 " );	// I heard the bandits teamed up with mages. Terrible black magicians in black robes. I could swear I saw one of them in town last night.
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_VLK_1_STANDARD_01_04 " );	// I heard that some of Onar's mercenaries went to hunt dragons. Well, at least they did something useful for once!
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_VLK_1_STANDARD_01_05 " );	// The dragons are said to have been destroyed! Lord Hagen gathers his people to expel the last creatures from the Valley of Mines.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_VLK_1_STANDARD_01_06 " );	// Except that Khorinis was occupied by orcs - nothing much!
	};
};

func void B_AssignAmbientInfos_VLK_1(var C_Npc slf)
{
	dia_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

