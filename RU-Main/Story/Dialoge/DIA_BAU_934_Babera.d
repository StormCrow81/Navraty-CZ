
instance DIA_Babera_EXIT(C_Info)
{
	npc = BAU_934_Babera;
	No. = 999 ;
	condition = DIA_Babera_EXIT_Condition;
	information = DIA_Babera_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babera_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Babera_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babera_HALLO (C_Info)
{
	npc = BAU_934_Babera;
	no. = 1 ;
	condition = DIA_Babera_HALLO_Condition;
	information = DIA_Babera_HALLO_Info;
	description = " Hello, beautiful. " ;
};


func int DIA_Babera_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Babera_HELLO_Info()
{
	AI_Output (other, self, " DIA_Babera_HALLO_15_00 " );	// Hello beautiful.
	AI_Output (self, other, " DIA_Babera_HALLO_16_01 " );	// Stop bothering me you lecher. Tell me what you want or get lost. I'm busy.
};


instance DIA_Babera_WIESIEHTSAUS(C_Info)
{
	npc = BAU_934_Babera;
	no. = 2 ;
	condition = DIA_Babera_WIESIEHTSAUS_Condition;
	information = DIA_Babera_WIESIEHTSAUS_Info;
	description = " How is the fieldwork going? " ;
};


func int DIA_Babera_WIESIEHTSAUS_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Babera_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Babera_WIESIEHTSAUS_Info ()
{
	AI_Output (other, self, " DIA_Babera_WIESIEHTSAUS_15_00 " );	// How is the fieldwork going?
	AI_Output (self, other, " DIA_Babera_WIESIEHTSAUS_16_01 " );	// Look at the size of these fields. How do you think its going?
	AI_Output (self, other, " DIA_Babera_WIESIEHTSAUS_16_02 " );	// Do you need a job by any chance?
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Babera_WIESIEHTSAUS, " Not really. I want to become a mercenary. " , DIA_Babera_WIESIEHTSAUS_Nein);
		Info_AddChoice (DIA_Babera_WIESIEHTSAUS, " Maybe. " , DIA_Babera_WIESIEHTSAUS_Perhaps);
	};
};

func void DIA_Babera_WIESIEHTSAUS_Vielleicht ()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//Мaybe.
	AI_Output (self, other, " DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01 " );	// Then you better talk to the farmer, Sekob. Maybe he has a job for you.
	AI_Output (self, other, " DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02 " );	// Or try to find a job at Onar's farm. She is at the end of this road.
	AI_Output (self, other, " DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03 " );	// For your own sake, be nice to the mercenaries. They don't like outsiders.
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};

func void DIA_Babera_WIESIEHTSAUS_Nein ()
{
	AI_Output (other, self, " DIA_Babera_WIESIEHTSAUS_Nein_15_00 " );	// Not really. I want to become a mercenary.
	AI_Output (self, other, " DIA_Babera_WIESIEHTSAUS_Nein_16_01 " );	// Then you shouldn't have come here. All the mercenaries are on Onar's farm.
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};


instance DIA_Babera_BRONKO (C_Info)
{
	npc = BAU_934_Babera;
	No. = 3 ;
	condition = DIA_Babera_BRONKO_Condition;
	information = DIA_Babera_BRONKO_Info;
	description = " (ask about Bronco) " ;
};


func int DIA_Babera_BRONKO_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Bronko_HALLO) && Npc_KnowsInfo(other,DIA_Babera_WIESIEHTSAUS))
	{
		return TRUE;
	};
};

func void DIA_Babera_BRONKO_Info ()
{
	AI_Output (other, self, " DIA_Babera_BRONKO_15_00 " );	// Tell me, the guy over there ...
	AI_Output (self, other, " DIA_Babera_BRONKO_16_01 " );	// Bronco? What about him?
	AI_Output (other, self, " DIA_Babera_BRONKO_15_02 " );	// Is he the farmer here?
	AI_Output (self, other, " DIA_Babera_BRONKO_16_03 " );	// (laughs) Did he tell you that? Our farmer is Sekob. And Bronco is just a strong moron with a big mouth.
	AI_Output (self, other, " DIA_Babera_BRONKO_16_04 " );	// Most people are afraid of him, though.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output (self, other, " DIA_Babera_BRONKO_16_05 " );	// He's not afraid of anyone. Only the mercenaries.
	}
	else
	{
		AI_Output (self, other, " DIA_Babera_BRONKO_16_06 " );	// Bronco is only afraid of the mercenaries.
	};
	Babera_BronkoKeinBauer = TRUE ;
};


instance DIA_Babera_Rosi (C_Info)
{
	npc = BAU_934_Babera;
	No. = 3 ;
	condition = DIA_Babera_Rosi_Condition;
	information = DIA_Babera_Rosi_Info;
	description = "Where is Rosie?";
};


func int DIA_Babera_Rosi_Condition ()
{
	if((MIS_bringRosiBackToSekob == LOG_Running) && (Kapitel >= 5) && (RosiFoundKap5 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babera_Rosi_Info ()
{
	AI_Output(other,self,"DIA_Babera_Rosi_15_00");	//Where is Rosie?
	AI_Output (self, other, " DIA_Babera_Rosi_16_01 " );	// She got tired of this life and went north, into the forest.
	B_LogEntry (TOPIC_RosisFlucht, " Rosie escaped Secob's farm. Babera says she headed north into the forest. " );
	B_LogEntry (TOPIC_bringRosiBackToSekob, " Rosie escaped Sekob's farm. Babera says she headed north into the forest. " );
};


instance DIA_Babera_DUSTOERST(C_Info)
{
	npc = BAU_934_Babera;
	No. = 10 ;
	condition = DIA_Babera_DUSTOERST_Condition;
	information = DIA_Babera_DUSTOERST_Info;
	permanent = TRUE;
	description = " Anything else? " ;
};


func int DIA_Babera_DUSTOERST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babera_BRONKO))
	{
		return TRUE;
	};
};

func void DIA_Babera_DUSTOERST_Info()
{
	AI_Output (other, self, " DIA_Babera_DUSTOERST_15_00 " );	// Anything else?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//I'm busy.
	AI_StopProcessInfos(self);
};


instance DIA_Babera_PICKPOCKET(C_Info)
{
	npc = BAU_934_Babera;
	NO = 900 ;
	condition = DIA_Babera_PICKPOCKET_Condition;
	information = DIA_Babera_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Babera_PICKPOCKET_Condition ()
{
	return  C_Beklauen ( 20 , 30 );
};

func void DIA_Babera_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
	Info_AddChoice(DIA_Babera_PICKPOCKET,Dialog_Back,DIA_Babera_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Babera_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Babera_PICKPOCKET_DoIt);
};

func void DIA_Babera_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
};

func void DIA_Babera_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
};
