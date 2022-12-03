

instance DIA_Jergan_EXIT(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 999;
	condition = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jergan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JERGAN_STOP(C_Info)
{
	npc = VLK_4110_Jergan;
	condition = dia_jergan_stop_condition;
	information = dia_jergan_stop_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_stop_condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") > 1000)
	{
		return TRUE;
	};
};

func void dia_jergan_stop_info()
{
	AI_Output(self,other,"DIA_Jergan_STOP_01_01");	//Эй, ты!
	AI_Output(other,self,"DIA_Jergan_STOP_01_02");	//Кто? Я?
	AI_Output(self,other, " DIA_Jergan_STOP_01_03 " );	// No, your grandmother... Who else can I turn to?
	AI_Output(self,other, " DIA_Jergan_STOP_01_04 " );	// If I were you, I wouldn't go there.
	AI_Output(other,self, " DIA_Jergan_STOP_01_05 " );	// Why not?
	AI_Output(self,other, " DIA_Jergan_STOP_01_06 " );	// It is immediately obvious that you are a beginner.
	AI_Output(self,other, " DIA_Jergan_STOP_01_07 " );	// Boy, this road leads to orc lands...
	AI_Output(self,other, " DIA_Jergan_STOP_01_08 " );	// They'll gladly make you a schnapps appetizer!
	AI_Output(other,self, " DIA_Jergan_STOP_01_09 " );	// I'll keep that in mind.
	AI_Output(self,other,"DIA_Jergan_STOP_01_10");	//Не за что!
};


instance DIA_Jergan_Hallo (C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jergan_Hello_Info()
{
	AI_Output(other,self, " DIA_Jergan_Hallo_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Jergan_Hallo_13_01 " );	// I came from the castle. I was sent to look for the missing and scout the area.
};


instance DIA_Jergan_Missing (C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Missing_Condition;
	information = DIA_Jergan_Missing_Info;
	permanent = FALSE;
	description = " Missing? " ;
};


func int DIA_Jergan_Missing_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Germany_Hello ))
	{
		return TRUE;
	};
};

func void DIA_Jergan_missing_info()
{
	AI_Output(other,self, " DIA_Jergan_Vermisste_15_00 " );	// Lost?
	AI_Output(self,other, " DIA_Jergan_Vermisste_13_01 " );	// Some fled when we were attacked by dragons. Most of them did not manage to survive - this is not surprising!
	AI_Output(self,other, " DIA_Jergan_Vermisste_13_02 " );	// But still, if anyone managed to survive, I must bring them back.
};


instances DIA_Jergan_Burg (C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent = FALSE;
	description = " Can you help me get into the castle? " ;
};


func int DIA_Jergan_Burg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Burg_Info()
{
	AI_Output(other,self, " DIA_Jergan_Burg_15_00 " );	// Can you help me get into the castle?
	AI_Output(self,other, " DIA_Jergan_Burg_13_01 " );	// Of course, but you have to do me a favor.
	AI_Output(self,other, " DIA_Jergan_Burg_13_02 " );	// If you manage to reach the castle, talk to paladin Orik. Tell him his brother died here at the Passage.
	Log_CreateTopic(Topic_OricBruder,LOG_MISSION);
	Log_SetTopicStatus(Topic_OricBruder,LOG_Running);
	B_LogEntry(Topic_OricBruder, " When I get to the castle, I should tell Oric that his brother died in the Passage. " );
};


instance DIA_Jergan_Area (C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Area_Info;
	permanent = TRUE;
	description = " What do I need to know about this area? " ;
};


func int DIA_Jergan_Area_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Germany_Hello ))
	{
		return TRUE;
	};
};


var int Jergan_Tell;

func void DIA_Jergan_Area_Info()
{
	AI_Output(other,self, " DIA_Jergan_Gegend_15_00 " );	// What do I need to know about this area?

	if(Jergan_Tell == FALSE)
	{
		AI_Output(self,other, " DIA_Jergan_Gegend_13_01 " );	// If you want to survive, run away from everything you see.
		AI_Output(self,other, " DIA_Jergan_Gegend_13_02 " );	// Those green-skinned creatures have been encircling the castle for weeks now. Besides, there are dragons hiding somewhere.
	};
	AI_Output(self,other, " DIA_Jergan_Gegend_13_03 " );	// The entire Valley of Mines is crawling with orcs. Wherever you go, you run the risk of running into them.
	Jergan_Tell = TRUE;
};


instance DIA_Jergan_Help (C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Help_Condition;
	information = DIA_Jergan_Help_Info;
	permanent = FALSE;
	description = " How do I get to the castle? " ;
};


func int DIA_Jergan_Help_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Help_Info()
{
	AI_Output(other,self, " DIA_Jergan_Hilfe_15_00 " );	// How do I get to the castle?
	AI_Output(self,other, " DIA_Jergan_Hilfe_13_01 " );	// First of all, forget about the straight road. But if you go around the castle from the other side, you might have a chance.
	AI_Output(self,other, " DIA_Jergan_Hilfe_13_02 " );	// You'd better stay off the roads and use the river. It's best if you swim downstream.
	AI_Output(self,other, " DIA_Jergan_Hilfe_13_03 " );	// Orcs set up a battering ram behind the castle. You can do this - sneak up on the orcs as close as possible, and then run as fast as you can to the battering ram.
	AI_Output(self,other, " DIA_Jergan_Hilfe_13_04 " );	// You can make it if you're fast enough.
};


instance DIA_Jergan_Mine(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Jergan_Mine_Condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Jergan_Mine_Info()
{
	AI_Output(other,self, " DIA_Jergan_Mine_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Jergan_Mine_13_01 " );	// I'm a scout. My job is to watch the enemy. But all these snappers don't make my life easier at all.
	AI_Output(self,other, " DIA_Jergan_Mine_13_02 " );	// Although, now is the time to collect trophies - if, of course, you know what you are doing.
};


instance DIA_Jergan_Claw(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent = FALSE;
	description = " Can you teach me this? " ;
};


func int DIA_Jergan_Claw_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Claw_Info()
{
	AI_Output(other,self, " DIA_Jergan_Claw_15_00 " );	// Can you teach me this?
	AI_Output(self,other, " DIA_Jergan_Claw_13_01 " );	// I can show you how to separate the claws of these creatures.
};


instance DIA_Jergan_Teach(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent = TRUE;
	description = " (Learn declawing) " ;
};


func int DIA_Jergan_Teach_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Teach_Info()
{
	AI_Output(other,self, " DIA_Jergan_Teach_15_00 " );	// Show me how to separate the claws.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other, " DIA_Jergan_Teach_13_01 " );	// Claws must be cut off with one precise and sharp blow. You can't hesitate here, otherwise you'll spoil the trophy.
		AI_Output(self,other, " DIA_Jergan_Teach_13_02 " );	// This way you can separate not only the claws of snappers, but also lizards and obscurants.
	};
};


instances DIA_Jergan_Diego (C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent = FALSE;
	description = " Do you know where Diego went? " ;
};


func int DIA_Jergan_Diego_Condition()
{
	if (( Npc_GetDistToWP ( self , " OW_NEWMINE_04 " ) <  1000 ) && ( Npc_KnowsInfo ( other , DIA_DiegoOw_Hallo ) ==  FALSE ) && Npc_KnowsInfo ( other , DIA_Parcival_Diego ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Jergan_Diego_Info()
{
	AI_Output(other,self, " DIA_Jergan_Diego_15_00 " );	// Do you know where Diego went?
	AI_Output(self,other, " DIA_Jergan_Diego_13_01 " );	// Diego? He was one of Silvestro's prospectors. But then he ran away.
	AI_Output(self,other, " DIA_Jergan_Diego_13_02 " );	// I saw him with two knights and a box, not far from here.
	AI_Output(self,other, " DIA_Jergan_Diego_13_03 " );	// See the old tower over there on the right? Go there and then towards the castle.
	AI_Output(self,other, " DIA_Jergan_Diego_13_04 " );	// The road goes through the rocks on the right. That's where they went.
};


instance DIA_Jergan_Leader(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jergan_Leader_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(NewMine_LeadSnapper) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Leader_Info()
{
	AI_Output(self,other, " DIA_Jergan_Leader_13_00 " );	// You killed the leader of the pack. And how - you took the claws of this beast?
	if(Npc_HasItems(other,ItAt_ClawLeader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Да.
		AI_Output(self,other, " DIA_Jergan_Leader_13_02 " );	// They cost a fortune. There are people who collect such things.
		AI_Output(self,other, " DIA_Jergan_Leader_13_03 " );	// If you find the right buyer, you'll get a whole bunch of gold for them.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Нет.
		AI_Output(self,other, " DIA_Jergan_Leader_13_05 " );	// It's you in vain. I'm sure they cost a fortune.
	};
};


instance DIA_Jergan_PICKPOCKET(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 900;
	condition = DIA_Jergan_PICKPOCKET_Condition;
	information = DIA_Jergan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jergan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 84 , 110 );
};

func void DIA_Jergan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,Dialog_Back,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

instance DIA_Jergan_Venzel(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Venzel_Condition;
	information = DIA_Jergan_Venzel_Info;
	permanent = FALSE;
	description = " Notice anything interesting? " ;
};

func int DIA_Jergan_Venzel_Condition()
{
	if (( MIS_LostPaladins == LOG_Running ) && ( HintVenzelOrcs_01 ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Venzel_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Jergan_Venzel_01_00 " );	// Notice anything interesting?
	AI_Output(self,other, " DIA_Jergan_Venzel_01_01 " );	// Hmm, yes, perhaps, nothing that could interest you.
	AI_Output(other,self, " DIA_Jergan_Venzel_01_02 " );	// Like, nothing at all?
	AI_Output(self,other, " DIA_Jergan_Venzel_01_03 " );	// Well, if you think about it... (scratching the back of his head) The only thing that comes to my mind is...
	AI_Output(other,self,"DIA_Jergan_Venzel_01_04");	//Что?
	AI_Output(self,other, " DIA_Jergan_Venzel_01_05 " );	// During my last reconnaissance, I saw how the orcs were leading a small group of captured people somewhere.
	AI_Output(other,self, " DIA_Jergan_Venzel_01_06 " );	// This is more interesting. Were there any paladins among them?
	AI_Output(self,other, " DIA_Jergan_Venzel_01_07 " );	// No, it wasn't. Otherwise I would have noticed!
	AI_Output(other,self, " DIA_Jergan_Venzel_01_08 " );	// And where did they go?
	AI_Output(self,other, " DIA_Jergan_Venzel_01_09 " );	// Seems to be towards a large mountain in the northeast of the valley.
	AI_Output(self,other, " DIA_Jergan_Venzel_01_10 " );	// Seems to me they have a small camp there!
	AI_Output(self,other, " DIA_Jergan_Venzel_01_11 " );	// But if I were you, I wouldn't check.
	AI_Output(other,self, " DIA_Jergan_Venzel_01_12 " );	// (ironic) Who, if not me?
	HintVenzelOrcs_02 = TRUE;
	B_LogEntry(TOPIC_LostPaladins, " Scout Yergan recently saw the orcs leading a small group of captured people. True, there were no paladins in it. According to Yergan, the orcs headed for a large mountain in the northeast of the Valley of Mines. I think it's time to tell everything Garondu... " );
};
