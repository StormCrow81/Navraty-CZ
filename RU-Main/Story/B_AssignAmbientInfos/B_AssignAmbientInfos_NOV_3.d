

instance DIA_NOV_3_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_3_EXIT_Condition;
	information = DIA_NOV_3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_3_Fegen (C_Info)
{
	nr = 2;
	condition = DIA_NOV_3_Fegen_Condition;
	information = DIA_NOV_3_Fegen_Info;
	permanent = TRUE;
	description = " I need help sweeping the novices' cells. " ;
};


var int Feger1_Permanent;
var int Feger2_Permanent;

func int DIA_NOV_3_Fegen_Condition()
{
	if ((Chapter ==  1 ) && (MIS_MonasteryWorks == LOG_Running) && (NOV_Helper <  4 ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_NOV_3_Fegen_Info()
{
	AI_Output(other,self, " DIA_NOV_3_Fegen_15_00 " );	// I need help sweeping the novices' cells.
	if(Hlp_GetInstanceID(Feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_Helfer < 1) && (Feger1_Permanent == FALSE))
		{
			AI_Output(self,other, " DIA_NOV_3_Fegen_03_01 " );	// Nobody wants to help you, right? Okay, I'll help you, but you just have to find someone else to match me.
			B_LogEntry(Topic_ParlanFegen, " The acolyte who sweeps the cellar will help me if I can find another acolyte to help sweep the rooms. " );
		}
		else  if ((NOV_Helfer >=  1 ) && (Feger1_Permanent ==  FALSE ))
		{
			AI_Output(self,other, " DIA_NOV_3_Fegen_03_02 " );	// Am I the only one willing to help you?
			AI_Output(other,self, " DIA_NOV_3_Fegen_15_03 " );	// No, I already found a helper.
			AI_Output(self,other, " DIA_NOV_3_Fegen_03_04 " );	// Then, get down to business!
			NOV_Helpers = NOV_Helpers +  1 ;
			Feger1_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			B_LogEntry(Topic_ParlanFegen, " The cellar acolyte will help me sweep the rooms. " );
		}
		else if(Feger1_Permanent == TRUE)
		{
			AI_Output(self,other, " DIA_NOV_3_Fegen_03_05 " );	// Listen, brother, I'm already helping you. Enough chatter.
		};
	};
	if(Hlp_GetInstanceID(Feger2) == Hlp_GetInstanceID(self))
	{
		if(Feger2_Permanent == FALSE)
		{
			AI_Output(self,other, " DIA_NOV_3_Fegen_03_08 " );	// Sure, I'll help. We, the novices, must support each other. Today you are for me, tomorrow I am for you.
			AI_Output(self,other, " DIA_NOV_3_Fegen_03_09 " );	// I only ask for fifty gold coins, I need to pay them to Parlan.
			B_LogEntry(Topic_ParlanFegen, " The novice at the church will help me if I give him fifty gold pieces. " );
			Info_ClearChoices(DIA_NOV_3_Fegen);
			Info_AddChoice(DIA_NOV_3_Fegen, " Maybe later... " ,DIA_NOV_3_Fegen_Nein);
			if(Npc_HasItems(other,ItMi_Gold) >= 50)
			{
				Info_AddChoice(DIA_NOV_3_Fegen, " Ok, I'll pay. " ,DIA_NOV_3_Fegen_Ja);
			};
		}
		else
		{
			AI_Output(self,other, " DIA_NOV_3_Fegen_03_06 " );	// I already agreed. You helped me, I will help you.
		};
	};
	if((Hlp_GetInstanceID(Feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(Feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other, " DIA_NOV_3_Fegen_03_07 " );	// Forget it - I don't have free time. Look for someone else.
	};
};

func void DIA_NOV_3_Fegen_Nein()
{
	AI_Output(other,self, " DIA_NOV_3_Fegen_Nein_15_00 " );	// Maybe later, I can't afford that kind of expense right now.
	Info_ClearChoices(DIA_NOV_3_Fegen);
};

func void DIA_NOV_3_Fegen_Ja()
{
	AI_Output(other,self, " DIA_NOV_3_Fegen_Ja_15_00 " );	// Okay, I'll pay.
	AI_Output(self,other, " DIA_NOV_3_Fegen_Ja_03_01 " );	// Okay, then I'm ready to start.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	NOV_Helpers = NOV_Helpers +  1 ;
	B_GivePlayerXP(XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices(DIA_NOV_3_Fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	B_LogEntry(Topic_ParlanFegen, " The novice at the church will help me sweep the rooms. " );
};


instance DIA_NOV_3_Sausage (C_Info)
{
	nr = 3;
	condition = DIA_NOV_3_Wurst_Condition;
	information = DIA_NOV_3_Sausage_Info;
	permanent = TRUE;
	description = " Would you like some sausage? " ;
};


func int DIA_NOV_3_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_NOV_3_Wurst_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_NOV_3_Wurst_15_00 " );	// Would you like some sausage?
	AI_Output(self,other, " DIA_NOV_3_Wurst_03_01 " );	// Of course, give it here. Who would refuse such a sausage.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_NOV_3_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_3_JOIN_Condition;
	information = DIA_NOV_3_JOIN_Info;
	permanent = TRUE;
	description = " I want to be a mage! " ;
};


func int DIA_NOV_3_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_NOV_3_JOIN_Info()
{
	AI_Output(other,self, " DIA_NOV_3_JOIN_15_00 " );	// I want to become a mage!
	AI_Output(self,other, " DIA_NOV_3_JOIN_03_01 " );	// This is what all acolytes want. But only a few of them become the Chosen Ones and get a chance to be accepted into the Circle of Fire.
	AI_Output(self,other, " DIA_NOV_3_JOIN_03_02 " );	// Becoming a Circle of Fire mage is the highest honor and must be earned.
	AI_Output(self,other, " DIA_NOV_3_JOIN_03_03 " );	// You must work hard, and then perhaps you will have a chance.
};


instance DIA_NOV_3_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_3_PEOPLE_Condition;
	information = DIA_NOV_3_PEOPLE_Info;
	permanent = TRUE;
	description = " Who is the leader of this monastery? " ;
};


func int DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_NOV_3_PEOPLE_15_00 " );	// Who heads this monastery?
	AI_Output(self,other, " DIA_NOV_3_PEOPLE_03_01 " );	// We acolytes serve the mages of the Circle of Fire. They, in turn, are led by the Supreme Council, consisting of the three most influential mages.
	AI_Output(self,other, " DIA_NOV_3_PEOPLE_03_02 " );	// But Parlan is responsible for all the affairs of the novices. He can always be found in the yard, he watches the work of novices.
};


instance DIA_NOV_3_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_3_LOCATION_Condition;
	information = DIA_NOV_3_LOCATION_Info;
	permanent = TRUE;
	description = " What can you tell me about this monastery? " ;
};


func int DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_LOCATION_Info()
{
	AI_Output(other,self, " DIA_NOV_3_LOCATION_15_00 " );	// What can you tell me about this monastery?
	AI_Output(self,other, " DIA_NOV_3_LOCATION_03_01 " );	// We earn our daily bread with our own labor. We raise sheep and make wine.
	AI_Output(self,other, " DIA_NOV_3_LOCATION_03_02 " );	// There is a library here, but only mages and selected acolytes are allowed to enter.
	AI_Output(self,other, " DIA_NOV_3_LOCATION_03_03 " );	// We, the rest of the acolytes, make sure that the mages of the Circle of Fire do not need anything.
};


instance DIA_NOV_3_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_3_STANDARD_Condition;
	information = DIA_NOV_3_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_STANDARD_Info()
{
	AI_Output(other,self, " DIA_NOV_3_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_01 " );	// And you still ask! Yes, all the novices only talk about you.
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_02 " );	// It's very rare for a green rookie like you to be elected to the Circle of Fire.
		}
		else
		{
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_03 " );	// Elections will be held again soon. One of the acolytes will soon be accepted into the Circle of Fire.
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_04 " );	// He'll start doing tests soon.
		};
	};
	if ((chapter ==  2 ) || (chapter ==  3 ))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_05 " );	// Our Order has been touched by Beliar's dirty paw! Evil must be very strong if it could find allies here.
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_06 " );	// Pedro lived in this monastery for many years. I think he spent too much time behind the walls of the monastery. This weakened his faith and made him vulnerable to Beliar's temptations.
		}
		else  if (MIS_NoviceChase ==  LOG_SUCCESS )
		{
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_07 " );	// You came just in time. Innos himself could not have chosen a better moment for your appearance.
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_08 " );	// You will enter the annals of our monastery as the savior of the Eye.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_09 " );	// The news from the Valley of Mines is very disturbing. I think Innos is deliberately putting us to the test.
		}
		else
		{
			AI_Output(self,other, " DIA_NOV_3_STANDARD_03_10 " );	// It is said that there is no news from the paladins who went to the Valley of Mines. The High Council knows best what needs to be done.
		};
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_NOV_3_STANDARD_03_11 " );	// They say that we must destroy the dragons with the help of our Lord. The wrath of Innos will incinerate the creatures of Beliar.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_NOV_3_STANDARD_03_12 " );	// Praise to Innos, there is no new crisis. We must continue to follow the path of our master, because only with his help can we resist evil.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_NOV_3_STANDARD_03_13 " );	// Don't you know yourself?! Orcs, orcs, orcs - that's the only news lately. And there are more of them every day!
	};
};

func void B_AssignAmbientInfos_NOV_3(var C_Npc slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Sausage.npc = Hlp_GetInstanceID(slf);
};

