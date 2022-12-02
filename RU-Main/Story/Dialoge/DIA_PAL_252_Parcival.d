

var int nugget_all;
var int parcivalday;

instance DIA_Parcival_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Schurfer (C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Schurfer_Condition;
	information = DIA_Parcival_Schurfer_Info;
	permanent = FALSE;
	description = " What can you tell me about miners? " ;
};


func int DIA_Parcival_Schurfer_Condition()
{
	if (( MIS_ScoutMine == LOG_Running ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Schurfer_Info()
{
	AI_Output(other,self, " DIA_Parcival_Schurfer_15_00 " );	// What can you tell me about prospectors?
	AI_Output(self,other, " DIA_Parcival_Schurfer_13_01 " );	// I sent all three squads.
	AI_Output(self,other, " DIA_Parcival_Schurfer_13_02 " );	// They were led by Marcos, Faget and Silvestro!
	AI_Output(self,other, " DIA_Parcival_Schurfer_13_03 " );	// Marcos's group went towards the Old Mine. It is led by the old miner Grimes.
	AI_Output(self,other, " DIA_Parcival_Schurfer_13_04 " );	// The other two groups came out together.
	AI_Output(self,other, " DIA_Parcival_Schurfer_13_05 " );	// Jergan, one of our scouts, reported that they had set up camp not far from the big tower.
	) ; _ _ _
};

instance DIA_Parcival_Diego (C_Info)
{
	npc = PAL_252_Parcival;
	nr = 9;
	condition = DIA_Parcival_Diego_Condition;
	information = DIA_Parcival_Diego_Info;
	permanent = FALSE;
	description = " Which group of prospectors did Diego go with? " ;
};


func int DIA_Parcival_Diego_Condition()
{
	if (( SearchForDiego == LOG_Running ) && ( Chapter <  3 ))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Diego_Info()
{
	AI_Output(other,self, " DIA_Parcival_Diego_15_00 " );	// And what group of miners did Diego go with?
	AI_Output(self,other, " DIA_Parcival_Diego_13_01 " );	// Is this convict Diego? He's with Paladin Silvestro's group.
	B_LogEntry(TOPIC_ScoutMine, " Diego went with the prospectors led by the paladin Silvestro. " );
};


instance DIA_Parcival_Weg (C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_Weg_Condition;
	information = DIA_Parcival_Weg_Info;
	permanent = FALSE;
	description = " Do you know how to get to these mines? " ;
};


func int DIA_Parcival_Weg_Condition()
{
	if (( MIS_ScoutMine == LOG_Running ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Weg_Info()
{
	AI_Output(other,self, " DIA_Parcival_Weg_15_00 " );	// Do you know how to get to these mines?
	AI_Output(self,other, " DIA_Parcival_Weg_13_01 " );	// There is no safe path through the valley at all. But I still think it would be better to avoid the straight road.
	AI_Output(self,other, " DIA_Parcival_Weg_13_02 " );	// Stay away from orcs and forests - and may Innos watch over you.
	B_LogEntry(TOPIC_ScoutMine, " Looks like the direct route to the prospectors might not be the best choice. I'd rather avoid the woods and orc camps. " );
};


instance DIA_Parcival_DRAGON(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGON_Condition;
	information = DIA_Parcival_DRAGON_Info;
	description = " How are things? " ;
};


func int DIA_Parcival_DRAGON_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGON_Info()
{
	AI_Output(other,self, " DIA_Parcival_DRAGON_15_00 " );	// How are things?
	AI_Output(self,other, " DIA_Parcival_DRAGON_13_01 " );	// We're surrounded by orcs. Looks like they're here for the long haul.
	AI_Output(self,other, " DIA_Parcival_DRAGON_13_02 " );	// But I'm much more worried about dragon attacks. They've already destroyed the entire outer circle.
	AI_Output(self,other, " DIA_Parcival_DRAGON_13_03 " );	// Another dragon attack and we'll take heavy losses.
};


instance DIA_Parcival_DRAGONS (C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGONS_Condition;
	information = DIA_Parcival_DRAGONS_Info;
	description = " How many dragons are there? " ;
};


func int DIA_Parcival_DRAGONS_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Parcival_DRAGON ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGONS_Info()
{
	AI_Output(other,self, " DIA_Parcival_DRAGONS_15_00 " );	// How many dragons are there?
	AI_Output(self,other, " DIA_Parcival_DRAGONS_13_01 " );	// We don't know how many there are, but more than one, that's for sure.
	AI_Output(self,other, " DIA_Parcival_DRAGONS_13_02 " );	// But that's not all. The entire Valley of Mines is teeming with diabolical creatures supporting dragons.
	AI_Output(self,other, " DIA_Parcival_DRAGONS_13_03 " );	// Don't kid yourself - without outside reinforcements, our chances of getting out of here alive are slim to none.
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_BRAVE(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_BRAVE_Condition;
	information = DIA_Parcival_BRAVE_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_BRAVE_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && Npc_KnowsInfo ( hero , DIA_Parcival_DRAGONS ) && ( Chapter <  3 ) && ( Parcival_BRAVE_LaborCount <=  6 )) ;
	{
		return TRUE;
	};
};


var int Parcival_BRAVE_LaberCount;

func void DIA_Parcival_BRAVE_Info()
{
	be int randy;
	if(Parcival_BRAVE_LaberCount < 6)
	{
		randy = Hlp_Random( 3 );
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_Parcival_BRAVE_13_00 " );	// So far so good. But things can change quickly.
		};
		if(randy == 1)
		{
			AI_Output(self,other, " DIA_Parcival_BRAVE_13_01 " );	// We'll hold on as long as we can.
		};
		if(randy == 2)
		{
			AI_Output(self,other, " DIA_Parcival_BRAVE_13_02 " );	// Innos will help us. His light illuminates our hearts!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Parcival_BRAVE_13_03 " );	// Hey! Don't you have anything better to do than chat with me? Get out!
		B_GivePlayerXP(XP_Ambient);
	};
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
};


instance DIA_Parcival_KAP3_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP3_EXIT_Condition;
	information = DIA_Parcival_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_ALLESKLAR (C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_ALLESKLAR_Condition;
	information = DIA_Parcival_ALLESKLAR_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Parcival_ALLESKLAR_Condition()
{
	if ((Capital ==  3 ) && (DIA_Parcival_ALLESKLAR_NerveCounter <  3 ) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON));
	{
		return TRUE;
	};
};


var int DIA_Parcival_ALLESKLAR_NervCounter;

func void DIA_Parcival_ALLESKLAR_Info()
{
	AI_Output(other,self, " DIA_Parcival_ALLESKLAR_15_00 " );	// Is everything okay?
	if (DIA_Parcival_ALLESKLAR_NervCounter ==  0 )
	{
		AI_Output(self,other, " DIA_Parcival_ALLESKLAR_13_01 " );	// For now, yes!
	}
	else  if (DIA_Parcival_ALLESKLAR_NervCounter ==  1 )
	{
		AI_Output(self,other, " DIA_Parcival_ALLESKLAR_13_02 " );	// Yes, damn you.
	}
	else if(Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output(self,other, " DIA_Parcival_ALLESKLAR_13_03 " );	// (laughs) Now I understand what you're up to! No, mate, not this time.
	}
	else
	{
		AI_Output(self,other, " DIA_Parcival_ALLESKLAR_13_04 " );	// Don't distract me!
	};
	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter +  1 ;
};


instance DIA_Parcival_KAP4_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP4_EXIT_Condition;
	information = DIA_Parcival_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_AnyNews(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_AnyNews_Condition;
	information = DIA_Parcival_AnyNews_Info;
	description = " Did anything important happen? " ;
};


func int DIA_Parcival_AnyNews_Condition()
{
	if ((Capital >=  4 ) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && ( CAPITALORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Parcival_AnyNews_Info()
{
	AI_Output(other,self, " DIA_Parcival_AnyNews_15_00 " );	// Nothing important happened?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Parcival_AnyNews_13_01 " );	// Are you one of those scum who call themselves dragon hunters?
		AI_Output(self,other, " DIA_Parcival_AnyNews_13_02 " );	// Actually, I thought you'd be wise enough not to mess with those idiots.
	}
	else
	{
		AI_Output(self,other, " DIA_Parcival_AnyNews_13_03 " );	// I'm worried. Very much worried.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Чем?
		AI_Output(self,other, " DIA_Parcival_AnyNews_13_05 " );	// Recently, these people have appeared here. They call themselves dragon hunters.
		AI_Output(self,other, " DIA_Parcival_AnyNews_13_06 " );	// From my point of view, they are all bums and criminals.
	};
	AI_Output(self,other, " DIA_Parcival_AnyNews_13_07 " );	// If it was in my power, I would kick them all out of the castle. Let the orcs take care of them.
	Info_ClearChoices(DIA_Parcival_AnyNews);
	Info_AddChoice(DIA_Parcival_AnyNews, " But unlike Lord Hagen, they're still here. " ,DIA_Parcival_AnyNews_LordHagen);
	Info_AddChoice(DIA_Parcival_AnyNews, " You should give them a chance. " ,DIA_Parcival_AnyNews_Chance);
	Info_AddChoice(DIA_Parcival_AnyNews, " Don't you think you're exaggerating? " ,DIA_Parcival_AnyNews_Overact);
};

func void DIA_Parcival_AnyNews_LordHagen()
{
	AI_Output(other,self, " DIA_Parcival_AnyNews_LordHagen_15_00 " );	// But unlike Lord Hagen, they're still here.
	AI_Output(self,other, " DIA_Parcival_AnyNews_LordHagen_13_01 " );	// Yes, unfortunately they are all we have.
	AI_Output(self,other, " DIA_Parcival_AnyNews_LordHagen_13_02 " );	// Truly Innos puts us to a severe test.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Chance()
{
	AI_Output(other,self, " DIA_Parcival_AnyNews_Chance_15_00 " );	// You should give them a chance.
	AI_Output(self,other, " DIA_Parcival_AnyNews_Chance_13_01 " );	// And they'll get it. Unfortunately.
	AI_Output(self,other, " DIA_Parcival_AnyNews_Chance_13_02 " );	// Garond is convinced they can help us.
	AI_Output(self,other, " DIA_Parcival_AnyNews_Chance_13_03 " );	// But I won't take my eyes off them. We've had enough problems with orcs as it is. And we don't need any more trouble.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Overact()
{
	AI_Output(other,self, " DIA_Parcival_AnyNews_Overact_15_00 " );	// Don't you think you're exaggerating?
	AI_Output(self,other, " DIA_Parcival_AnyNews_Overact_13_01 " );	// Absolutely not. In our situation, we need people who are an example of heroism.
	AI_Output(self,other, " DIA_Parcival_AnyNews_Overact_13_02 " );	// Warriors who will awaken the fire of Innos in the hearts of our fighters.
	AI_Output(self,other, " DIA_Parcival_AnyNews_Overact_13_03 " );	// Instead, these crooks are corrupting the morale of my soldiers.
};


instance DIA_Parcival_Jan (C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Jan_Condition;
	information = DIA_Parcival_Jan_Info;
	permanent = FALSE;
	description = " I need to talk to you about Jan. " ;
};


func int DIA_Parcival_Jan_Condition()
{
	if ((MIS_JanBecomesSmith == LOG_Running) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && ( CAPITALORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Jan_Info()
{
	AI_Output(other,self, " DIA_Parcival_Jan_15_00 " );	// I need to talk to you about Jan.
	AI_Output(self,other, " DIA_Parcival_Jan_13_01 " );	// Jan? Who is it?
	AI_Output(other,self, " DIA_Parcival_Jan_15_02 " );	// Dragon hunter. He is a blacksmith.
	AI_Output(self,other, " DIA_Parcival_Jan_13_03 " );	// Oh, yes. I remember. What about him?
	AI_Output(other,self, " DIA_Parcival_Jan_15_04 " );	// He wants to work at the forge.
	AI_Output(self,other, " DIA_Parcival_Jan_13_05 " );	// This is not even discussed. He's not our man and I don't trust him.
};


instance DIA_Parcival_ThinkAgain(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_ThinkAgain_Condition;
	information = DIA_Parcival_ThinkAgain_Info;
	permanent = TRUE;
	description = " Could you reconsider your opinion about Ian? " ;
};


func int DIA_Parcival_ThinkAgain_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Parcival_Jan ) && ( MIS_JanBecomesSmith == LOG_Running ) && ( CAPITALORCATC  ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_Parcival_ThinkAgain_Info()
{
	AI_Output(other,self, " DIA_Parcival_ThinkAgain_15_00 " );	// Could you reconsider your opinion about Jan?
	AI_Output(self,other, " DIA_Parcival_ThinkAgain_13_01 " );	// No, my decision is final.
};


instance DIA_Parcival_TalkedGarond(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_TalkedGarond_Condition;
	information = DIA_Parcival_TalkedGarond_Info;
	description = " Garond wants Jan to work at the forge. " ;
};

func int DIA_Parcival_TalkedGarond_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Parcival_Jan ) && ( MIS_JanBecomesSmith ==  LOG_SUCCESS ) && Npc_KnowsInfo ( other , DIA_Parcival_DRAGON ) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Parcival_TalkedGarond_Info()
{
	AI_Output(other,self, " DIA_Parcival_TalkedGarond_15_00 " );	// Garond wants Jan to work at the forge.
	AI_Output(self,other, " DIA_Parcival_TalkedGarond_13_01 " );	// Mmm. If this is true, then I have nothing against it.
	AI_Output(self,other, " DIA_Parcival_TalkedGarond_13_02 " );	// Although I think it's a mistake to trust this Jan.
};


instance DIA_Parcival_PERMKAP4(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 43;
	condition = DIA_Parcival_PERMKAP4_Condition;
	information = DIA_Parcival_PERMKAP4_Info;
	permanent = TRUE;
	description = " Besides that? " ;
};


func int DIA_Parcival_PERMKAP4_Condition()
{
	if ((Capital >=  4 ) && Npc_KnowsInfo(other,DIA_Parcival_AnyNews) && ( CAPITALORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Parcival_PERMKAP4_Info()
{
	AI_Output(other,self, " DIA_Parcival_PERMKAP4_15_00 " );	// And other than that?
	AI_Output(self,other, " DIA_Parcival_PERMKAP4_13_01 " );	// Ah, leave me alone!
};


instance DIA_Parcival_KAP5_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP5_EXIT_Condition;
	information = DIA_Parcival_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_VERRAETER (C_Info)
{
	npc = PAL_252_Parcival;
	condition = DIA_Parcival_VERRAETER_Condition;
	information = DIA_Parcival_VERRAETER_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Parcival_VERRAETER_Condition()
{
	if ((Npc_RefuseTalk(self) ==  FALSE ) && (MY_OCGateOpen ==  TRUE ) && (other.guild ==  GIL_DJG ) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Parcival_VERRAETER_Info()
{
	AI_Output(self,other, " DIA_Parcival_VERRAETER_13_00 " );	// Traitor! I know for sure that it was YOU who opened the gate.
	AI_Output(self,other, " DIA_Parcival_VERRAETER_13_01 " );	// You will pay for this.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Parcival_KAP6_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP6_EXIT_Condition;
	information = DIA_Parcival_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Parcival_PICKPOCKET(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 900;
	condition = DIA_Parcival_PICKPOCKET_Condition;
	information = DIA_Parcival_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Parcival_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,Dialog_Back,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};

		B_GiveInvItems(self,other,ITKE_TWOSTORE,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};


instance DIA_PARCIVAL_CAPTURED(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = dia_parcival_captured_condition;
	information = dia_parcival_captured_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parcival_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_parcival_captured_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Kill_Arbaleters(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_Kill_Arbaleters_condition;
	information = DIA_Parcival_Kill_Arbaleters_info;
	permanent = FALSE;
	description = " Do you have any errands for me? " ;
};

func int DIA_Parcival_Kill_Arbaleters_condition()
{
	if ((Chapter >=  2 ) && (MY_ScoutMine ==  LOG_SUCCESS ) && (Npc_KnowsInfo(hero, DIA_Parcival_DRAGON) ==  TRUE )) .
	{
		return TRUE;
	};
};

func void DIA_Parcival_Kill_Arbaleters_info()
{
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_01_00 " );	// Do you have any errands for me?
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_01 " );	// (appreciatively) You made it to the castle alive. It means you are really worth something.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_02 " );	// But I want to warn you right away that this is a very difficult and dangerous business!
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_01_03 " );	// And I thought all the hard work was over.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_04 " );	// It just so happens that you can do things that many of my people can't.
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_01_05 " );	// Get to the point. What is it this time?
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_06 " );	// On a high hill on the west side of the castle is an orc lookout post.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_07 " );	// Recently, they sent a new squad of fighters there.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_08 " );	// However, we cannot allow the orcs to gain a solid foothold in positions so advantageous to them.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_09 " );	// Therefore, this unit must be destroyed.
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_01_10 " );	// What's the problem?
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_11 " );	// The difficulty is that the orcs took all the precautions.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_12 " );	// The crossbowmen in this unit are a real headache for anyone who goes there!
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_13 " );	// And I can't risk my people defending the castle.
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_01_14 " );	// I understand. So I'll take the risk.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_15 " );	// Well... No one else! You understand this very well.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_01_16 " );	// Just be careful - there can be not only shooters, but also elite fighters.
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_01_17 " );	// Okay, I'll do what I can.
	MISS_ELITE_GROUP_ORKS = LOG_Running;
	Log_CreateTopic(TOPIC_ELITE_GROUP_ORKS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ELITE_GROUP_ORKS,LOG_Running);
	B_LogEntry( TOPIC_ELITE_GROUP_ORKS , " Parzival informed me that a new, extremely powerful group of orcs had appeared at the orc observation post. Parzival would be grateful if I solved this problem. He also warned me that it was worth preparing well before the march. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrkElite_Warrior_Persival_01,"OW_PATH_019");
	Wld_InsertNpc(OrkElite_Warrior_Persival_02,"OW_PATH_015");
	Wld_InsertNpc(OrkElite_Warrior_Persival_03,"LOCATION_16_OUT");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_01,"OW_PATH_019");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_02,"OW_PATH_028");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_03,"OW_PATH_027");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_04,"OW_PATH_025");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_05,"OW_PATH_024");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_06,"OW_PATH_023");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_07,"OW_PATH_022");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_08,"OW_PATH_021");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_09,"OW_PATH_020");
	Wld_InsertNpc(OrkElite_Elder_Persival_01,"LOCATION_16_IN");
};

instance DIA_Parcival_Kill_Arbaleters_Done(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_Kill_Arbaleters_Done_condition;
	information = DIA_Parcival_Kill_Arbaleters_Done_info;
	permanent = FALSE;
	description = " Orc squad destroyed. " ;
};

func int DIA_Parcival_Kill_Arbaleters_Done_condition()
{
	if (( MISS_ELITE_GROUP_ORKS  == LOG_Running) && Npc_IsDead(OrkElite_Warrior_Persival_01) && Npc_IsDead(OrkElite_Warrior_Persival_02) && Npc_IsDead(OrkElite_Warrior_Persival_03) && Npc_IsDead(OrkElite_Arbaletchik_Persival_01) && Npc_IsDead(OrkElite_Arbaletchik_Persival_02) && Npc_IsDead(OrkElite_Arbaletchik_Persival_03) && Npc_IsDead(OrkElite_Arbaletchik_Persival_04) && Npc_IsDead(OrkElite_Arbaletchik_Persival_05) && Npc_IsDead (OrkElite_Arbaletchik_Persival_06) &&Npc_IsDead(OrkElite_Arbaletchik_Persival_07) &&Npc_IsDead(OrkElite_Arbaletchik_Persival_08) && Npc_IsDead(OrkElite_Arbaletchik_Persival_09) && Npc_IsDead(OrkElite_Elder_Persival_01))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Kill_Arbaleters_Done_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_Done_01_01 " );	// Orc squad destroyed.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_02 " );	// My watchers have already reported to me that the orcs have suffered monstrous losses in the hill area.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_03 " );	// You've done us a huge favor! This will give us a slight advantage for a while.
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_Done_01_04 " );	// What about a small reward?
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_05 " );	// Of course, you honestly deserve it!
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_06 " );	// However, I'm at a loss as to what exactly to reward you with.
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_Done_01_07 " );	// What about gold, magic elixirs, or some other valuable stuff?
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_08 " );	// Yes, I already thought about it.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_09 " );	// But our supplies in the castle are extremely scarce, and I can't keep handing them out right and left.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_10 " );	// But wait. I figured out how to thank you.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_12 " );	// Here, take this sword. I am sure that you have never seen such a weapon!
	B_GiveInvItems(self,other,ITMW_2H_KATANA,1);
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_Done_01_13 " );	// You're right. This is the first time I've seen such a weapon.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_14 " );	// It's understandable. After all, this blade is from distant Varant.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_15 " );	// I got it as a military trophy from a very skilled warrior-assassin!
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_16 " );	// I still remember that fight. And in memory of those times, until now, he kept this sword.
	AI_Output(self,other, " DIA_Parcival_Kill_Arbaleters_Done_01_17 " );	// And now it's yours.
	AI_Output(other,self, " DIA_Parcival_Kill_Arbaleters_Done_01_18 " );	// Thank you! This is indeed a valuable reward.
	MISS_ELITE_GROUP_ORKS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ELITE_GROUP_ORKS,LOG_SUCCESS);
	B_LogEntry( TOPIC_ELITE_GROUP_ORKS , " I did the job. " );
};
