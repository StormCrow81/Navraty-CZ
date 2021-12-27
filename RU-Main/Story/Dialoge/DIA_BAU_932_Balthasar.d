
instance DIA_Balthasar_EXIT (C_Info)
{
	npc = BAU_932_Balthasar;
	No. = 999 ;
	condition = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Balthasar_HALLO (C_Info)
{
	npc = BAU_932_Balthasar;
	No. = 3 ;
	condition = DIA_Balthasar_HALLO_Condition;
	information = DIA_Balthasar_HALLO_Info;
	description = "Как дела?";
};


func int DIA_Balthasar_HELLO_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_HELLO_Info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//How are you?
	AI_Output (self, other, " DIA_Balthasar_HALLO_05_01 " );	// Ah, the new face on the farm. Has that old curmudgeon finally gifted me an apprentice?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Ummm... no.
	AI_Output (self, other, " DIA_Balthasar_HALLO_05_03 " );	// Oh. I see. But I'm not as young as I used to be, you know? And I've been waiting for a replacement for so many years.
	AI_Output (self, other, " DIA_Balthasar_HALLO_05_04 " );	// You're not here because of the angry neighbors are you?
};


instance DIA_Balthasar_WASMACHSTDU (C_Info)
{
	npc = BAU_932_Balthasar;
	No. = 4 ;
	condition = DIA_Balthasar_WASMACHSTDU_Condition;
	information = DIA_Balthasar_WASMACHSTDU_Info;
	description = " What are you doing here? " ;
};


func int DIA_Balthasar_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WASMACHSTDU_Info()
{
	AI_Output (other, self, " DIA_Balthasar_WASMACHSTDU_15_00 " );	// What are you doing here?
	AI_Output (self, other, " DIA_Balthasar_WASMACHSTDU_05_01 " );	// Oh, I watch over the sheep. I've been doing this all my life.
	AI_Output (self, other, " DIA_Balthasar_WASMACHSTDU_05_02 " );	// These animals are intelligent and very obedient. If you treat them well, they will follow you wherever you go.
};


instance DIA_Addon_Balthasar_Rangerbandits (C_Info)
{
	npc = BAU_932_Balthasar;
	No. = 5 ;
	condition = DIA_Addon_Balthasar_Rangerbandits_Condition;
	information = DIA_Addon_Balthasar_Rangerbandits_Info;
	description = " Have you seen the bandits passing by here? " ;
};


func int DIA_Addon_Balthasar_Rangerbandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO) && ((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (SC_KnowsLuciaCaughtByBandits == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info()
{
	AI_Output (other, self, " DIA_Addon_Balthasar_Rangerbandits_15_00 " );	// Have you seen the bandits passing by here?
	AI_Output (self, other, " DIA_Addon_Balthasar_Rangerbandits_05_01 " );	// I saw them. They crossed the edge of the field at Secoba's farm and into the forest to the north.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		AI_Output (self, other, " DIA_Addon_Balthasar_Rangerbandits_05_02 " );	// They had a huge amount of weapons with them. They looked as if they were going to war against the orcs.
	};
	if(SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output (self, other, " DIA_Addon_Balthasar_Rangerbandits_05_03 " );	// And if my eyes did not deceive me, they also took a young woman into the forest.
		AI_Output (self, other, " DIA_Addon_Balthasar_Rangerbandits_05_04 " );	// I hope they didn't hurt her.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output (self, other, " DIA_Addon_Balthasar_Rangerbandits_05_05 " );	// Thank the gods they didn't come to our farm.
};


instance DIA_Balthasar_AERGERMITNACHBARN(C_Info)
{
	npc = BAU_932_Balthasar;
	No. = 5 ;
	condition = DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information = DIA_Balthasar_AERGERMITNACHBARN_Info;
	description = " What are the problems with the neighbors? " ;
};


func int DIA_Balthasar_AERGERMITNACHBARN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info()
{
	AI_Output (other, self, " DIA_Balthasar_AERGERMITNACHBARN_15_00 " );	// What's the problem with the neighbors?
	AI_Output (self, other, " DIA_Balthasar_AERGERMITNACHBARN_05_01 " );	// The grass in this part of the larger field is stunted and withered. Therefore, I often graze sheep on the verdant pastures of the other farms.
	AI_Output (self, other, " DIA_Balthasar_AERGERMITNACHBARN_05_02 " );	// Onar doesn't mind, but Bengar, a high-minded noble wannabe, screams like a harpy every time he sees my sheep there.
	AI_Output (self, other, " DIA_Balthasar_AERGERMITNACHBARN_05_03 " );	// He says Sekob has to pay if he wants to graze the sheep in his pastures.
	AI_Output (self, other, " DIA_Balthasar_AERGERMITNACHBARN_05_04 " );	// But Secob would rather strangle himself than give him a penny, so I don't go to the plateau anymore.
};


instance DIA_Balthasar_WOBENGAR (C_Info)
{
	npc = BAU_932_Balthasar;
	No. = 10 ;
	condition = DIA_Balthasar_WOBENGAR_Condition;
	information = DIA_Balthasar_WOBENGAR_Info;
	description = " How can I get to these alpine pastures and Bengar Farm? " ;
};


func int DIA_Balthasar_WOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WOBENGAR_Info()
{
	AI_Output (other, self, " DIA_Balthasar_WOBENGAR_15_00 " );	// How can I get to these high mountain pastures and Bengar farm?
	AI_Output (self, other, " DIA_Balthasar_WOBENGAR_05_01 " );	// Follow this road until the intersection.
	AI_Output (self, other, " DIA_Balthasar_WOBENGAR_05_02 " );	// If you turn right there, you will see a large rock. Behind it, on the right, there are alpine pastures and the Pass.
};


instance DIA_Balthasar_TALKTOBENGAR (C_Info)
{
	npc = BAU_932_Balthasar;
	No. = 6 ;
	condition = DIA_Balthasar_TALKTOBENGAR_Condition;
	information = DIA_Balthasar_TALKTOBENGAR_Info;
	description = " Maybe I should talk to Bengar. " ;
};


func int DIA_Balthasar_TALKTOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_TALKTOBENGAR_Info()
{
	AI_Output (other, self, " DIA_Balthasar_TALKTOBENGAR_15_00 " );	// Maybe I should talk to Bengar.
	AI_Output (self, other, " DIA_Balthasar_TALKTOBENGAR_05_01 " );	// Will you do it for me? But whatever you tell him, keep in mind, I don't want any problems, okay?
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//We'll see.
	Log_CreateTopic(TOPIC_BalthasarsSchafe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe,LOG_Running);
	B_LogEntry (TOPIC_BalthasarsSchafe, " Farmer Bengar forbade the shepherd Balthasar's sheep from grazing in his highland pastures. " );
	MIS_Balthasar_BengarsWeide = LOG_Running;
};


instance DIA_Balthasar_BENGARUEBERREDET (C_Info)
{
	npc = BAU_932_Balthasar;
	No. = 8 ;
	condition = DIA_Balthasar_BENGARUEBERREDET_Condition;
	information = DIA_Balthasar_BENGARUEBERREDET_Info;
	description = " You can take your sheep to the Bengar pastures again. " ;
};


func int DIA_Balthasar_BENGARUEBERREDET_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_TALKTOBENGAR) && (MIS_Balthasar_BengarsWeide == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info()
{
	AI_Output (other, self, " DIA_Balthasar_BENGARUEBERREDET_15_00 " );	// You can lead your sheep to the Bengar pastures again. I spoke to him.
	AI_Output (self, other, " DIA_Balthasar_BENGARUEBERREDET_05_01 " );	// Thank you. I'll go there right now.
	AI_Output (self, other, " DIA_Balthasar_BENGARUEBERREDET_05_02 " );	// Here, take these sheep skins as a token of my gratitude.
	B_GiveInvItems(self,other,ItAt_SheepFur,10);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	B_GivePlayerXP(XP_Balthasar_BengarsWeide);
	Wld_InsertNpc(Sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BalthasarSheep1 = Hlp_GetNpc(Balthasar_Sheep1);
	if(Hlp_IsValidNpc(BalthasarSheep1) && !Npc_IsDead(BalthasarSheep1))
	{
		AI_StartState(BalthasarSheep1,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
	BalthasarSheep2 = Hlp_GetNpc(Balthasar_Sheep2);
	if(Hlp_IsValidNpc(BalthasarSheep2) && !Npc_IsDead(BalthasarSheep2))
	{
		AI_StartState(BalthasarSheep2,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
	BalthasarSheep3 = Hlp_GetNpc(Balthasar_Sheep3);
	if(Hlp_IsValidNpc(BalthasarSheep3) && !Npc_IsDead(BalthasarSheep3))
	{
		AI_StartState(BalthasarSheep3,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
	BALTHASARGOBENGAR = TRUE;
};

instance DIA_Balthasar_PERMKAP1 (C_Info)
{
	npc = BAU_932_Balthasar;
	NO = 70 ;
	condition = DIA_Balthasar_PERMKAP1_Condition;
	information = DIA_Balthasar_PERMKAP1_Info;
	permanent = TRUE;
	description = " Are you okay? " ;
};

func int DIA_Balthasar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_PERMKAP1_Info()
{
	AI_Output (other, self, " DIA_Balthasar_PERMKAP1_15_00 " );	// Is everything okay?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,Balthasar_Sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Balthasar_Sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Balthasar_Sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output (self, hero, " DIA_Balthasar_PERMKAP1_05_01 " );	// I have nothing to complain about. Thanks for asking.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, hero, " DIA_Balthasar_PERMKAP1_05_02 " );	// These are hard times. I've lost my sheep!
		if(Npc_IsDead(Sekob) == FALSE)
		{
			AI_Output (self, hero, " DIA_Balthasar_PERMKAP1_05_03 " );	// I think it's best to go to Sekob and confess.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_Balthasar_PICKPOCKET (C_Info)
{
	npc = BAU_932_Balthasar;
	NO = 900 ;
	condition = DIA_Balthasar_PICKPOCKET_Condition;
	information = DIA_Balthasar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Balthasar_PICKPOCKET_Condition()
{
	return  C_Beklauen ( 10 , 10 );
};

func void DIA_Balthasar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice (DIA_Balthasar_PICKPOCKET, Dialog_Back, DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Balthasar_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};

func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};
