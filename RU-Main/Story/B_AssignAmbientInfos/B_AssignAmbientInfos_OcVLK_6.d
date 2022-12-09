

instance DIA_OCVLK_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCVLK_6_EXIT_Condition;
	information = DIA_OCVLK_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCVLK_6_PEOPLE_Condition;
	information = DIA_OCVLK_6_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_OCVLK_6_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_OCVLK_6_PEOPLE_06_01 " );	// Garond commands the entire fort - or rather, what's left of it.
	AI_Output(self,other, " DIA_OCVLK_6_PEOPLE_06_02 " );	// But he does almost nothing himself. Well, unless one of his people gets into trouble.
	if (Npc_IsDead(Engor) ==  FALSE )
	{
		AI_Output(self,other, " DIA_OCVLK_6_PEOPLE_06_03 " );	// If you need equipment, talk to Angor. You will find him in the house across from Garond's house.
	};
};


instance DIA_OCVLK_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCVLK_6_LOCATION_Condition;
	information = DIA_OCVLK_6_LOCATION_Info;
	permanent = TRUE;
	description = " What can you tell me about the situation in the Valley of Mines? " ;
};


func int DIA_OCVLK_6_LOCATION_Condition()
{
	if ((Chapter <=  4 ) && (MIS_KilledDragons <  4 ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_OCVLK_6_LOCATION_Info()
{
	AI_Output(other,self, " DIA_OCVLK_6_LOCATION_15_00 " );	// What can you tell me about the situation in the Valley of Mines?
	AI_Output(self,other, " DIA_OCVLK_6_LOCATION_06_01 " );	// I'm worried about the orcs' defensive wall. I don't even want to know what the orcs are hiding behind it.
	AI_Output(self,other, " DIA_OCVLK_6_LOCATION_06_02 " );	// At first there were few of them - they were building this wall. And then, one night, they brought in the siege engines.
	AI_Output(self,other, " DIA_OCVLK_6_LOCATION_06_03 " );	// We were lucky, and we were able to repel this attack.
	AI_Output(self,other, " DIA_OCVLK_6_LOCATION_06_04 " );	// Behind the wall lies the sea. If more ork ships arrive, we won't stand a chance.
};


instance DIA_OCVLK_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCVLK_6_STANDARD_Condition;
	information = DIA_OCVLK_6_STANDARD_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_STANDARD_Info()
{
	AI_Output(other,self, " DIA_OCVLK_6_STANDARD_15_00 " );	// How are you?
	if (chapter <=  3 )
	{
		AI_Output(self,other, " DIA_OCVLK_6_STANDARD_06_01 " );	// They said: 'Join the army and you won't have any worries'. And that's how it all turned out.
		AI_Output(self,other, " DIA_OCVLK_6_STANDARD_06_02 " );	// Now, under pain of death, it is forbidden to even approach food supplies. Garond seems to be afraid that we will pack our bags and get out of here. (bitter smile)
		AI_Output(self,other, " DIA_OCVLK_6_STANDARD_06_03 " );	// We're all going to starve here if those damn dragons don't kill us first!
	};
	if (chapter ==  4 )
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other, " DIA_OCVLK_6_STANDARD_06_04 " );	// Dragon hunters. Do not make me laugh! They won't change anything.
		}
		else
		{
			AI_Output(self,other, " DIA_OCVLK_6_STANDARD_06_05 " );	// They say that all the dragons have been killed! Now we have a chance!
		};
	};
	if (chapter ==  5 )
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other, " DIA_OCVLK_6_STANDARD_06_06 " );	// All because of this cursed ore. We'd better throw out everything we've been tinkering with here. Maybe then the orcs will leave us alone.
		}
		else
		{
			AI_Output(self,other, " DIA_OCVLK_6_STANDARD_06_07 " );	// Those stupid crates they piled in front of the entrance won't be able to stop the orcs!
		};
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_OCVLK_6_STANDARD_06_08 " );	// Are you still asking?! Boy, look around and you'll understand!
	};
};

func void B_AssignAmbientInfos_OCVLK_6(var C_Npc slf)
{
	dia_ocvlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

