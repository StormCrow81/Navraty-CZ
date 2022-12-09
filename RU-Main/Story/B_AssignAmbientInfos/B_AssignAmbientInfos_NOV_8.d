

instance DIA_NOV_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_8_EXIT_Condition;
	information = DIA_NOV_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_Fegen (C_Info)
{
	nr = 2;
	condition = DIA_NOV_8_Fegen_Condition;
	information = DIA_NOV_8_Fegen_Info;
	permanent = TRUE;
	description = " I need help sweeping the novices' cells. " ;
};


func int DIA_NOV_8_Fegen_Condition()
{
	if ((Chapter ==  1 ) && (MIS_MonasteryWorks == LOG_Running) && (NOV_Helper <  4 ))
	{
		return TRUE;
	};
	return  FALSE ;
};


var int Feger3_Permanent;

func void DIA_NOV_8_Fegen_Info()
{
	AI_Output(other,self, " DIA_NOV_8_Fegen_15_00 " );	// I need help sweeping the novices' cells.
	if(Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self))
	{
		if(Feger3_Permanent == FALSE)
		{
			AI_Output(self,other, " DIA_NOV_8_Fegen_08_01 " );	// Oh boy. You just got here and you're already making others do their jobs?
			AI_Output(self,other, " DIA_NOV_8_Fegen_08_02 " );	// Don't be upset, I had the same problems when I came here. Therefore, I will help you. It would be funny if we didn't do it.
			NOV_Helpers = NOV_Helpers +  1 ;
			Feger3_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			B_LogEntry(Topic_ParlanFegen, " I found a novice willing to help me sweep rooms. " );
		}
		else
		{
			AI_Output(self,other, " DIA_NOV_8_Fegen_08_03 " );	// Brother, I understand your condition. And I already told you that I would help you. This is exactly what I do.
		};
	};
	if(Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other, " DIA_NOV_8_Fegen_08_04 " );	// Hey, I wouldn't mind, but I'm really busy.
	};
};


instance DIA_NOV_8_Wurst (C_Info)
{
	nr = 3;
	condition = DIA_NOV_8_Wurst_Condition;
	information = DIA_NOV_8_Sausage_Info;
	permanent = TRUE;
	description = " How about some delicious lamb sausage? " ;
};


func int DIA_NOV_8_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_NOV_8_Wurst_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_NOV_8_Wurst_15_00 " );	// How about a delicious lamb sausage?
	AI_Output(self,other, " DIA_NOV_8_Wurst_08_01 " );	// Do not hope, I will not refuse. Thanks - this is exactly what I needed.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_NOV_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_8_JOIN_Condition;
	information = DIA_NOV_8_JOIN_Info;
	permanent = TRUE;
	description = " How can I become a mage? " ;
};


func int DIA_NOV_8_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_NOV_8_JOIN_Info()
{
	AI_Output(other,self, " DIA_NOV_8_JOIN_15_00 " );	// How do I become a mage?
	AI_Output(self,other, " DIA_NOV_8_JOIN_08_01 " );	// You will become the Chosen One of Innos only when the higher firebenders allow it.
	AI_Output(self,other, " DIA_NOV_8_JOIN_08_02 " );	// Acolytes are forbidden from learning runic magic, and old scriptures can only be read with the permission of mages.
};


instance DIA_NOV_8_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_8_PEOPLE_Condition;
	information = DIA_NOV_8_PEOPLE_Info;
	permanent = TRUE;
	description = " Who runs the monastery? " ;
};


func int DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_NOV_8_PEOPLE_15_00 " );	// Who runs the monastery?
	AI_Output(self,other, " DIA_NOV_8_PEOPLE_08_01 " );	// Supreme Council. It consists of the three most powerful mages of our order. During the day they are in the church.
	AI_Output(self,other, " DIA_NOV_8_PEOPLE_08_02 " );	// Chosen of Innos - all mages. Innos gave them this gift so that they could carry out his will on earth.
};


instance DIA_NOV_8_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_8_LOCATION_Condition;
	information = DIA_NOV_8_LOCATION_Info;
	permanent = TRUE;
	description = " Tell me about this monastery. " ;
};


func int DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_LOCATION_Info()
{
	AI_Output(other,self, " DIA_NOV_8_LOCATION_15_00 " );	// Tell me about this monastery.
	AI_Output(self,other, " DIA_NOV_8_LOCATION_08_01 " );	// It's very ancient. Its history goes back to the time of Rhobar the First.
	AI_Output(self,other, " DIA_NOV_8_LOCATION_08_02 " );	// There are catacombs under this monastery. They extend far into the mountains.
};


instance DIA_NOV_8_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_8_STANDARD_Condition;
	information = DIA_NOV_8_STANDARD_Info;
	permanent = TRUE;
	description = " Anything new? " ;
};


func int DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_STANDARD_Info()
{
	AI_Output(other,self, " DIA_NOV_8_STANDARD_15_00 " );	// Anything new?
	if (chapter ==  1 )
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other, " DIA_NOV_8_STANDARD_08_01 " );	// You can say that. For more than a hundred years, no acolyte has entered the Circle of Fire so quickly.
			AI_Output(self,other, " DIA_NOV_8_STANDARD_08_02 " );	// I hope that someday I too will be honored with this honor. I am willing to work hard for this.
		}
		else
		{
			AI_Output(self,other, " DIA_NOV_8_STANDARD_08_03 " );	// Paladins have only recently arrived on Khorinis. One of them is here in the monastery and spends time in prayer.
		};
	};
	if ((chapter ==  2 ) || (chapter ==  3 ))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other, " DIA_NOV_3_STANDARD_08_04 " );	// I still can't believe it. One of us betrayed the monastery and stole the Eye of Innos.
			AI_Output(self,other, " DIA_NOV_3_STANDARD_08_05 " );	// The well-being of the brotherhood depends on our work, but we are still too weak. That's why Beliar managed to win over one of us to his side.
		}
		else  if (MIS_NoviceChase ==  LOG_SUCCESS )
		{
			AI_Output(self,other, " DIA_NOV_3_STANDARD_08_06 " );	// Thank Innos, we were able to wrest the Eye from the clutches of the enemy.
			AI_Output(self,other, " DIA_NOV_3_STANDARD_08_07 " );	// Your courage can serve as an example to many desperate souls and help them survive in these dark times.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_NOV_8_STANDARD_08_08 " );	// I've heard about dragons and the army of Evil. May Innos be with us!
		}
		else
		{
			AI_Output(self,other, " DIA_NOV_8_STANDARD_08_09 " );	// The High Council is very concerned about the situation our paladins are in. For a long time there has been no news from the Valley of Mines.
		};
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_NOV_8_STANDARD_08_10 " );	// No. And I thank our Lord for this. With the Eye of Innos, we can destroy the dragons!
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_NOV_8_STANDARD_08_11 " );	// Yes. We have defeated the dragons! Innos showed us that we should never lose hope.
		AI_Output(self,other, " DIA_NOV_8_STANDARD_08_12 " );	// Still, there are too many shadows and we need to light a lot of fires to drive them away.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_NOV_8_STANDARD_08_13 " );	// If it weren't for the Firebenders and the high walls of our monastery, the cities would have befallen us!
		AI_Output(self,other, " DIA_NOV_8_STANDARD_08_14 " );	// But who knows how much longer we can hold out.
	};
};

func void B_AssignAmbientInfos_NOV_8(var C_Npc slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc = Hlp_GetInstanceID(slf);
};

