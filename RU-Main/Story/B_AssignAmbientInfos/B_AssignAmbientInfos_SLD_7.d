

instance DIA_SLD_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_SLD_7_EXIT_Condition;
	information = DIA_SLD_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_SLD_7_JOIN_Condition;
	information = DIA_SLD_7_JOIN_Info;
	permanent = TRUE;
	description = " I want to join you! " ;
};


func int DIA_SLD_7_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_SLD_7_JOIN_Info()
{
	AI_Output(other,self, " DIA_SLD_7_JOIN_15_00 " );	// I want to join you!
	if(MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_SLD_7_JOIN_07_01 " );	// I heard you joined the militia. We need more men like you!
	}
	else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_SLD_7_JOIN_07_02 " );	// I don't think collecting rent from farmers is that hard, but if Onar is willing to pay for it, I don't mind.
	}
	else
	{
		AI_Output(self,other, " DIA_SLD_7_JOIN_07_03 " );	// You? First pass Torlof's test, and then we'll see!
	};
};


instance DIA_SLD_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_SLD_7_PEOPLE_Condition;
	information = DIA_SLD_7_PEOPLE_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};


func int DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_PEOPLE_Info()
{
	AI_Output(other, self, " DIA_SLD_7_PEOPLE_15_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_SLD_7_PEOPLE_07_01 " );	// We're under the command of Lee. Torlof is his right hand. Most of the guys obey him since the days of the colony.
	AI_Output(self,other, " DIA_SLD_7_PEOPLE_07_02 " );	// And then there's Silvio. He came down from the mountains with his people quite recently.
	AI_Output(self,other, " DIA_SLD_7_PEOPLE_07_03 " );	// His people make up a very small part of the mercenaries, but the problems coming from them are through the roof. Those guys live by their own laws.
	AI_Output(self,other, " DIA_SLD_7_PEOPLE_07_04 " );	// And that Silvio is a son of a bitch, so be careful if you cross paths with him.
};


instance DIA_SLD_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_SLD_7_LOCATION_Condition;
	information = DIA_SLD_7_LOCATION_Info;
	permanent = TRUE;
	description = " Tell me about this farm. " ;
};


func int DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_LOCATION_Info()
{
	AI_Output(other,self, " DIA_SLD_7_LOCATION_15_00 " );	// Tell me about this farm.
	AI_Output(self,other, " DIA_SLD_7_LOCATION_07_01 " );	// Onar hired us to guard his property.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other, " DIA_SLD_7_LOCATION_07_02 " );	// So don't even think about stealing anything or beating up a farmer. You'll be in big trouble, got it?
	};
};


instance DIA_SLD_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_SLD_7_STANDARD_Condition;
	information = DIA_SLD_7_STANDARD_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_STANDARD_Info()
{
	AI_Output(other,self, " DIA_SLD_7_STANDARD_15_00 " );	// What's new?
	if (chapter <=  2 )
	{
		if (EnterOW_Chapter2 ==  FALSE )
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other, " DIA_SLD_7_STANDARD_07_01 " );	// The farm has been quiet since you joined us - the militia doesn't show up here anymore.
			}
			else
			{
				AI_Output(self,other, " DIA_SLD_7_STANDARD_07_02 " );	// Nothing happening here. Better ask in the city. I think they are suffering from food shortages. Haha!
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_03 " );	// Dragons in the Valley of Mines! I would not want to be in the paladin's greaves right now.
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_04 " );	// I think the king will give Lord Hagen a good kick in the ass when he comes back empty-handed because of the dragons.
		}
		else
		{
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_05 " );	// Can't you paladins handle dragons? Or is that a job for real men?
		};
	};
	if (chapter ==  3 )
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other, " DIA_SLD_7_STANDARD_07_06 " );	// The problem with Bennet was solved thanks to you. Silvio is furious. He would have preferred to take the city by storm and blow everything to pieces.
				AI_Output(self,other, " DIA_SLD_7_STANDARD_07_07 " );	// He keeps blaming Lee for being indecisive, and Bennet was giving him such a great opportunity...
			}
			else
			{
				AI_Output(self,other, " DIA_SLD_7_STANDARD_07_08 " );	// I don't know why you helped Bennet, but trust me, you saved the city.
			};
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_09 " );	// I really don't like this situation with Bennett. Perhaps we should still listen to Silvio and take the city by storm.
		}
		else
		{
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_10 " );	// What are you going to do with Bennett? On second thought,I don’t even want to know. You will soon realise what this will lead to.
		};
	};
	if (chapter ==  4 )
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_11 " );	// I thought you went to the Valley with Silvio.
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_12 " );	// None of us will mind if Silvio stays in the valley forever!
		}
		else
		{
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_13 " );	// It's a courageous act to come here alone.
			AI_Output(self,other, " DIA_SLD_7_STANDARD_07_14 " );	// But I don't care unless you start collecting taxes here.
		};
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_SLD_7_STANDARD_07_15 " );	// I can't take this anymore. Sheep, "wise" men and trees. I wish I could just disappear.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_SLD_7_STANDARD_07_16 " );	// Soon the orcs will go on the offensive, and the end will come for us all!
	};
};

func void B_AssignAmbientInfos_SLD_7(var C_Npc slf)
{
	dia_sld_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_standard.npc = Hlp_GetInstanceID(slf);
};

