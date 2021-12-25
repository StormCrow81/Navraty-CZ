instance DIA_Till_EXIT(C_Info)
{
	npc = BAU_931_Till;
	No. = 999 ;
	condition = DIA_Till_EXIT_Condition;
	information = DIA_Till_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Till_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Till_HALLO (C_Info)
{
	npc = BAU_931_Till;
	No. = 3 ;
	condition = DIA_Till_HALLO_Condition;
	information = DIA_Till_HALLO_Info;
	description = "Hey.";
};


func int DIA_Till_HALLO_Condition ()
{
	if(Kapitel < 5)
	{
		return TRUE;
	};
};

func void DIA_Till_HALLO_Info ()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Hey.
	AI_Output (self, other, " DIA_Till_HALLO_03_01 " );	// I don't talk to workers. 
	B_StartOtherRoutine(Till,"Start");
	Info_ClearChoices(DIA_Till_HALLO);

	if(Kapitel < 5)
	{
		Info_AddChoice (DIA_Till_HALLO, " I'm not a worker. " , DIA_Till_HALLO_keinervoneuch);

		if(Npc_IsDead(Sekob) == FALSE)
		{
			Info_AddChoice (DIA_Till_HALLO, " Are you a commander here? " , DIA_Till_HALLO_selber);
		};
	};
};

func void DIA_Till_HALLO_selber ()
{
	AI_Output (other, self, " DIA_Till_HALLO_selber_15_00 " );	// Are you in command here?
	AI_Output (self, other, " DIA_Till_HALLO_selber_03_01 " );	// Uh ... no, I'm just Secob's son! But when the old man is no longer with us, everything you see around you will pass to me.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//Very nice!
	AI_Output (other, self, " DIA_Till_FELDARBEITER_15_00 " );	// Is this how you always treat your employees?
	AI_Output (self, other, " DIA_Till_FELDARBEITER_03_01 " );	// Of course! There's no other way. If you do not maintain discipline, no one will.
	AI_Output (other, self, " DIA_Till_HALLO_keinervoneuch_15_00 " );	// I'm not a worker.
	AI_Output (self, other, " DIA_Till_HALLO_keinervoneuch_03_01 " );	// What do you want then? 
	AI_StopProcessInfos(self);
};

func void DIA_Till_HALLO_keinervoneuch ()
{
	AI_Output (other, self, " DIA_Till_HALLO_keinervoneuch_15_00 " );	// I'm not a worker.
	AI_Output (self, other, " DIA_Till_HALLO_keinervoneuch_03_01 " );	// What do you want then? 
	AI_StopProcessInfos(self);
};

instance DIA_Till_SEKOB(C_Info)
{
	npc = BAU_931_Till;
	No. = 9 ;
	condition = DIA_Till_SEKOB_Condition;
	information = DIA_Till_SEKOB_Info;
	description = " I need to talk to your father. " ;
};

func int DIA_Till_SEKOB_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && (Npc_KnowsInfo(other,DIA_Sekob_HALLO) == FALSE) && (Kapitel < 3) && (Npc_IsDead(Sekob) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Till_SEKOB_Info ()
{
	AI_Output (other, self, " DIA_Till_SEKOB_15_00 " );	// I need to talk to your father.
	AI_Output (self, other, " DIA_Till_SEKOB_03_01 " );	// He doesn't have time for this. I am his representative. How can I help you?
	AI_Output (other, self, " DIA_Till_SEKOB_15_02 " );	// Help if you take me to your father.
	AI_Output (self, other, " DIA_Till_SEKOB_03_03 " );	// You consider yourself a tough guy and a good fighter, right?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//The best.
	AI_Output (self, other, " DIA_Till_SEKOB_03_05 " );	// Look for him yourself then.
	AI_Output (other, self, " DIA_Till_SEKOB_15_06 " );	// I suppose I will.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//Good luck.
	AI_StopProcessInfos(self);
};

instance DIA_Till_WASMACHSTDU(C_Info)
{
	npc = BAU_931_Till;
	No. = 10 ;
	condition = DIA_Till_WASMACHSTDU_Condition;
	information = DIA_Till_WASMACHSTDU_Info;
	description = " What are you doing? " ;
};

func int DIA_Till_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && (hero.guild != GIL_MIL) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WASMACHSTDU_Info()
{
	AI_Output (other, self, " DIA_Till_WASMACHSTDU_15_00 " );	// What do you do when you are not playing as the owner of this farm?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//I stand guard.
	AI_Output (self, other, " DIA_Till_WASMACHSTDU_03_02 " );	// Gods damned militia members from the city are increasingly wandering into our lands and stealing everything that isn't nailed down.
	AI_Output (self, other, " DIA_Till_WASMACHSTDU_03_03 " );	// The bastards were here just last week, they stole some sheep.
	AI_Output (self, other, " DIA_Till_WASMACHSTDU_03_04 " );	// If I got to one of them, I'd have ripped him apart.
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//Certainly!
};


instance DIA_Till_WARUMNICHTSLD(C_Info)
{
	npc = BAU_931_Till;
	No. = 11 ;
	condition = DIA_Till_WARUMNICHTSLD_Condition;
	information = DIA_Till_WARUMNICHTSLD_Info;
	description = " Don't the mercenaries help you defend against the militia? " ;
};


func int DIA_Till_WARUMNICHTSLD_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Till_WASMACHSTDU) && (hero.guild != GIL_MIL) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WARUMNICHTSLD_Info ()
{
	AI_Output (other, self, " DIA_Till_WARUMNICHTSLD_15_00 " );	// Don't the mercenaries help you defend against the militia?
	AI_Output (self, other, " DIA_Till_WARUMNICHTSLD_03_01 " );	// Yes, while the mercenaries scratch their asses, I drive thieves and goblins away.
};


instance DIA_Till_BRONKO(C_Info)
{
	npc = BAU_931_Till;
	No. = 5 ;
	condition = DIA_Till_BRONKO_Condition;
	information = DIA_Till_BRONKO_Info;
	description = " (ask about Bronco) " ;
};


func int DIA_Till_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && Npc_KnowsInfo(other,DIA_Bronko_HALLO) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKO_Info()
{
	AI_Output (other, self, " DIA_Till_BRONKO_15_00 " );	// You have a worker who demands payment from everyone passing by, claiming that he is a farmer!
	AI_Output (self, other, " DIA_Till_BRONKO_03_01 " );	// (timidly) Uh. Yes. I know. That's Bronco. He does what he wants.
	AI_Output (self, other, " DIA_Till_BRONKO_03_02 " );	// I've slapped him around about it so much I've given up now.
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//Да?
	AI_Output (self, other, " DIA_Till_BRONKO_03_04 " );	// He hates honest work.
	if(Npc_IsDead(Sekob) == FALSE)
	{
		AI_Output (self, other, " DIA_Till_BRONKO_03_05 " );	// My dad really hates that I still haven't been able to convince him to go back to work.
	};
};


instance DIA_Till_BRONKOZURARBEIT (C_Info)
{
	npc = BAU_931_Till;
	No. = 6 ;
	condition = DIA_Till_BRONKOZURARBEIT_Condition;
	information = DIA_Till_BRONKOZURARBEIT_Info;
	permanent = TRUE;
	description = " Maybe I can help you. " ;
};


var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Till_BRONKO) && (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOZURARBEIT_Info ()
{
	AI_Output (other, self, " DIA_Till_BRONKOZURARBEIT_15_00 " );	// Maybe I can help.
	AI_Output (self, other, " DIA_Till_BRONKOZURARBEIT_03_01 " );	// What do you mean? Okay, listen, if you can get Bronco to work, I'll pay you, say, ten gold coins. What do you say?
	Till_Angebot = 10 ;
	Info_ClearChoices (DIA_Till_BRONKOZURARBEIT);
	Info_AddChoice (DIA_Till_BRONKOZURARBEIT, " No problem. But I need more money. " , DIA_Till_BRONKOZURARBEIT_mehr);
	Info_AddChoice (DIA_Till_BRONKOZURARBEIT, " Ok. I'll see what I can do. " , DIA_Till_BRONKOZURARBEIT_ok);
	Info_AddChoice (DIA_Till_BRONKOZURARBEIT, " I'll think about it. " , DIA_Till_BRONKOZURARBEIT_nochnicht);
};

func void DIA_Till_BRONKOZURARBEIT_nochnicht ()
{
	AI_Output (other, self, " DIA_Till_BRONKOZURARBEIT_nochnicht_15_00 " );	// I'll think about it.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//All I ask.
	Info_ClearChoices (DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_ok ()
{
	AI_Output (other, self, " DIA_Till_BRONKOZURARBEIT_ok_15_00 " );	// Good. I'll see what i can do.
	AI_Output (self, other, " DIA_Till_BRONKOZURARBEIT_ok_03_01 " );	// Please hurry up with this.
	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE ;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_Running;
	Log_CreateTopic(TOPIC_Bronkoeingeschuechtert,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert,LOG_Running);
	B_LogEntry (TOPIC_Bronkoeingeschuechtert, " Till can't get Bronco to work. He'd like me to try. " );
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_more ()
{
	if(Till_IchMachsNurEinmal == TRUE)
	{
		AI_Output (other, self, " DIA_Till_BRONKOZURARBEIT_mehr_15_00 " );	// I want more.
	}
	else
	{
		AI_Output (other, self, " DIA_Till_BRONKOZURARBEIT_mehr_15_01 " );	// No problem. But I need more money.
		Till_IchMachsNurEinmal = TRUE;
	};
	if (Till_Angebot ==  10 )
	{
		AI_Output (self, other, " DIA_Till_BRONKOZURARBEIT_mehr_03_02 " );	// Twenty gold coins?
		Info_ClearChoices (DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice (DIA_Till_BRONKOZURBEIT, " More, I think " , DIA_Till_BRONKOZURARBEIT_more);
		Info_AddChoice (DIA_Till_BRONKOZURARBEIT, " Ok. I'll see what I can do. " , DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 20 ;
	}
	else  if (Till_Angebot ==  20 )
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//Thirty?
		Info_ClearChoices (DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice (DIA_Till_BRONKOZURBEIT, " Not enough. " , DIA_Till_BRONKOZURARBEIT_more);
		Info_AddChoice (DIA_Till_BRONKOZURARBEIT, " Ok. I'll see what I can do. " , DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 30 ;
	}
	else  if (Till_Angebot ==  30 )
	{
		AI_Output (self, other, " DIA_Till_BRONKOZURARBEIT_mehr_03_04 " );	// Maybe ... fifty?
		Info_ClearChoices (DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice (DIA_Till_BRONKOZURBEIT, " Not enough. " , DIA_Till_BRONKOZURARBEIT_more);
		Info_AddChoice (DIA_Till_BRONKOZURARBEIT, " Ok. I'll see what I can do. " , DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 50 ;
	}
	else  if (Till_Angebot ==  50 )
	{
		AI_Output (self, other, " DIA_Till_BRONKOZURARBEIT_mehr_03_05 " );	// Good. Seventy?
		Info_ClearChoices (DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice (DIA_Till_BRONKOZURBEIT, " Not enough. " , DIA_Till_BRONKOZURARBEIT_more);
		Info_AddChoice (DIA_Till_BRONKOZURARBEIT, " Ok. I'll see what I can do. " , DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 70 ;
	}
	else  if (Till_Angebot ==  70 )
	{
		AI_Output (self, other, " DIA_Till_BRONKOZURARBEIT_mehr_03_06 " );	// Okay, okay! I will give you one hundred gold coins. But that's all I have.

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print ( " Rhetoric + 1 " );
		};

		Info_ClearChoices (DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice (DIA_Till_BRONKOZURARBEIT, " Ok! I'll see what I can do. " , DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 100 ;
	};
};


instance DIA_Till_BRONKOWIEDERANARBEIT (C_Info)
{
	npc = BAU_931_Till;
	No. = 7 ;
	condition = DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information = DIA_Till_BRONKOWIEDERANARBEIT_Info;
	description = " Bronco is back to work! " ;
};


func int DIA_Till_BRONKOWIEDERANARBEIT_Condition ()
{
	if ((MIS_Sekob_Bronko_eingeschuechtert ==  LOG_SUCCESS ) && (DIA_Till_BRONKOZURARBEIT_noPerm ==  TRUE ) && (Chapter <  5 ))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info ()
{
	AI_Output (other, self, " DIA_Till_BRONKOWIEDERANARBEIT_15_00 " );	// Bronco is back to work!
	AI_Output (self, other, " DIA_Till_BRONKOWIEDERANARBEIT_03_01 " );	// Really? Excellent.
	AI_Output (other, self, " DIA_Till_BRONKOWIEDERANARBEIT_15_02 " );	// Yes! And now I want to get my money.
	IntToFloat (Till_Angebot);
	if (Till_Angebot <=  50 )
	{
		AI_Output (self, other, " DIA_Till_BRONKOWIEDERANARBEIT_03_03 " );	// Mmmm ... (hesitating) Okay! A deal is a deal, right?
		CreateInvItems(self,ItMi_Gold,Till_Angebot);
		B_GiveInvItems(self,other,ItMi_Gold,Till_Angebot);
	}
	else
	{
		AI_Output (self, other, " DIA_Till_BRONKOWIEDERANARBEIT_03_04 " );	// Sorry, I don't have that much! But I am very grateful for your help.
		Till_HatSeinGeldBehalten = TRUE ;
	};
	B_GivePlayerXP(XP_BronkoGehtAnDieArbeit);
	AI_StopProcessInfos(self);
};


instance DIA_Till_PERMKAP1(C_Info)
{
	npc = BAU_931_Till;
	NO = 99 ;
	condition = DIA_Till_PERMKAP1_Condition;
	information = DIA_Till_PERMKAP1_Info;
	permanent = TRUE;
	description = " (tease Till) " ;
};


func int DIA_Till_PERMKAP1_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) || (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Till_PERMKAP1_Info()
{
	if(Kapitel == 5)
	{
		if((MIS_bringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE))
		{
			AI_Output (other, self, " DIA_Till_PERMKAP1_15_00 " );	// A long way from home, aren't you? Daddy can't help you here.
			AI_Output (self, other, " DIA_Till_PERMKAP1_03_01 " );	// Someday I'll kick your ass.
		};

		AI_Output (other, self, " DIA_Till_PERMKAP1_15_02 " );	// Just be glad I don't kill you!
		AI_Output (self, other, " DIA_Till_PERMKAP1_03_03 " );	// Then leave me alone.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (other, self, " DIA_Till_PERMKAP1_15_04 " );	// You need to eat more vegetables little man!
		AI_Output (self, other, " DIA_Till_PERMKAP1_03_05 " );	// Someday I'll get you.
		AI_StopProcessInfos(self);
	}
	else if(Till_HatSeinGeldBehalten == TRUE)
	{
		AI_Output (other, self, " DIA_Till_PERMKAP1_15_06 " );	// Oh, you pathetic little...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Get out of here.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (other, self, " DIA_Till_PERMKAP1_15_08 " );	// When's the last time you got punched in the face?
		AI_Output (self, other, " DIA_Till_PERMKAP1_03_09 " );	// Leave me alone, you idiot!
	};
};

instance DIA_Till_PICKPOCKET(C_Info)
{
	npc = BAU_931_Till;
	NO = 900 ;
	condition = DIA_Till_PICKPOCKET_Condition;
	information = DIA_Till_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Till_PICKPOCKET_Condition()
{
	return  C_Beklauen ( 36 , 40 );
};

func void DIA_Till_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Till_PICKPOCKET);
	Info_AddChoice (DIA_Till_PICKPOCKET, Dialog_Back, DIA_Till_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Till_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Till_PICKPOCKET_DoIt);
};

func void DIA_Till_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices(DIA_Till_PICKPOCKET);
};

func void DIA_Till_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Till_PICKPOCKET);
};
