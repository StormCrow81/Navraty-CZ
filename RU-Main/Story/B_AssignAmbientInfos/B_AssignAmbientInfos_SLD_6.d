

instance DIA_SLD_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_SLD_6_EXIT_Condition;
	information = DIA_SLD_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_SLD_6_JOIN_Condition;
	information = DIA_SLD_6_JOIN_Info;
	permanent = TRUE;
	description = " I want to join you! " ;
};


func int DIA_SLD_6_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_SLD_6_JOIN_Info()
{
	AI_Output(other,self, " DIA_SLD_6_JOIN_15_00 " );	// I want to join you!
	if(MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_SLD_6_JOIN_06_01 " );	// I heard about this case with the militia. Torlof says you passed the test. You will get my vote.
	}
	else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_SLD_6_JOIN_06_02 " );	// Picking off farmers is one thing, but taking on the militia is another. If Onar finds a place for you, I won't mind.
	}
	else
	{
		AI_Output(self,other, " DIA_SLD_6_JOIN_06_03 " );	// Talk to Torlof. He will show you... (laughs)
	};
};


instance DIA_SLD_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_SLD_6_PEOPLE_Condition;
	information = DIA_SLD_6_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_SLD_6_PEOPLE_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_SLD_6_PEOPLE_Info()
{
	AI_Output(other,self, " DIA_SLD_6_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_SLD_6_PEOPLE_06_01 " );	// This farm belongs to Onar, if that's what you mean. But Lee is in charge.
	AI_Output(self,other, " DIA_SLD_6_PEOPLE_06_02 " );	// He was a general in the royal army. But he is no longer on friendly terms with the king though, hehehehe!
	AI_Output(self,other, " DIA_SLD_6_PEOPLE_06_03 " );	// Remember his name. If you have any problems here, he is probably the only one who can solve them. Everyone else will just skin you.
};


instance DIA_SLD_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_SLD_6_LOCATION_Condition;
	information = DIA_SLD_6_LOCATION_Info;
	permanent = TRUE;
	description = " Are you guarding the farmers? " ;
};


func int DIA_SLD_6_LOCATION_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_SLD_6_LOCATION_Info()
{
	AI_Output(other,self, " DIA_SLD_6_LOCATION_15_00 " );	// Are you guarding the farmers?
	AI_Output(self,other, " DIA_SLD_6_LOCATION_06_01 " );	// We guard not only Onar's farm, but this entire valley.
	AI_Output(self,other, " DIA_SLD_6_LOCATION_06_02 " );	// Onar wants us to crack down hard on any riots. So try to behave yourself.
};


instance DIA_SLD_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_SLD_6_STANDARD_Condition;
	information = DIA_SLD_6_STANDARD_Info;
	permanent = TRUE;
	description = " What's wrong? " ;
};


func int DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_SLD_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_SLD_6_STANDARD_15_00");	//What's the matter?
	if (chapter <=  2 )
	{
		if (EnterOW_Chapter2 ==  FALSE )
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other, " DIA_SLD_6_STANDARD_06_01 " );	// You're one of us now, boy!
			}
			else
			{
				AI_Output(self,other, " DIA_SLD_6_STANDARD_06_02 " );	// What do you need?
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_03 " );	// When I heard about dragons, I didn't even believe it at first.
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_04 " );	// A dragon is the real threat. The kind of horror that ruins men or makes legends of them.
		}
		else
		{
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_05 " );	// How's your lord Hagen, hasn't he pissed his pants from his fear of dragons yet?
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_06 " );	// Looks like he's going to have to get his noble ass off the chair now and crawl out of town.
		};
	};
	if (chapter ==  3 )
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_07 " );	// Lord Hagen may consider himself lucky. A few more days - and we would have broken into the city and freed Bennet ourselves.
		}
		else
		{
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_08 " );	// If Bennett is not released from prison, we will go there and free him personally.
		};
	};
	if (chapter ==  4 )
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_09 " );	// Why are you all hanging around here? Didn't you go to the valley with the others?
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_10 " );	// So that you all stay there.
		}
		else
		{
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_11 " );	// You must go to the Valley of Mines. I heard the poor unfortunate fools need help out there.
		};
	};
	if (chapter ==  5 )
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_12 " );	// When you showed up here, I immediately knew that you would turn everything upside down.
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_13 " );	// But dragons? That is something else entirely isn't it?
		}
		else
		{
			AI_Output(self,other, " DIA_SLD_6_STANDARD_06_14 " );	// I'm amazed. You are not on our side, but defeating the dragons is a tremendous feat, worthy of song...
		};
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_SLD_6_STANDARD_06_15 " );	// Look around and you will understand everything!
	};
};

func void B_AssignAmbientInfos_SLD_6(var C_Npc slf)
{
	dia_sld_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_standard.npc = Hlp_GetInstanceID(slf);
};

