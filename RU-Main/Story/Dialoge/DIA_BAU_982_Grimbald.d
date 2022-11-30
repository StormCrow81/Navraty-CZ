
instance DIA_Grimbald_EXIT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 999;
	condition = DIA_Grimbald_EXIT_Condition;
	information = DIA_Grimbald_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimbald_HELLO (C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_HALLO_Condition;
	information = DIA_Grimbald_HELLO_Info;
	description = " Are you waiting for something? " ;
};

func int DIA_Grimbald_HALLO_Condition()
{
	return TRUE;
};


var int Grimbald_PissOff;
var int GrimbaldTellBT;

func void DIA_Grimbald_HALLO_Info()
{
	AI_Output(other,self, " DIA_Grimbald_HALLO_15_00 " );	// Are you waiting for something?

	if ((Npc_IsDead(Grimbald_Snapper1) ==  FALSE ) && (Npc_IsDead(Grimbald_Snapper2) ==  FALSE ) && (Npc_IsDead(Grimbald_Snapper3) ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Grimbald_HALLO_07_02 " );	// No more. You've already arrived.
		Info_ClearChoices(DIA_Grimbald_HALLO);
		Info_AddChoice(DIA_Grimbald_HALLO, " I have things to do. " ,DIA_Grimbald_HALLO_nein);
		Info_AddChoice(DIA_Grimbald_HALLO, " What are you up to? " ,DIA_Grimbald_HALLO_Was);
		Info_AddChoice(DIA_Grimbald_HALLO, " Why me? " ,DIA_Grimbald_HALLO_ich);
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_HALLO_07_01 " );	// I'm hunting! I think it's obvious.
	};
};

func void DIA_Grimbald_HELLO_me()
{
	AI_Output(other,self, " DIA_Grimbald_HALLO_ich_15_00 " );	// Why me?!
	AI_Output(self,other, " DIA_Grimbald_HALLO_ich_07_01 " );	// Looks like you're a strong person. I would not refuse your help.
	AI_Output(self,other, " DIA_Grimbald_HALLO_ich_07_02 " );	// All the other hunters have gone to the camp - so only you can help me.
};

func void DIA_Grimbald_HELLO_What()
{
	AI_Output(other,self, " DIA_Grimbald_HALLO_Was_15_00 " );	// What are you thinking?
	AI_Output(self,other, " DIA_Grimbald_HALLO_Was_07_01 " );	// I want to hunt snappers over there, but I'm afraid I can't handle them on my own.
	Info_AddChoice(DIA_Grimbald_HALLO, " You can't count on me. " ,DIA_Grimbald_HALLO_Was_neinnein);
	Info_AddChoice(DIA_Grimbald_HALLO, " Okay, I'll help you! But you'll go ahead. " ,DIA_Grimbald_HALLO_Was_ja);
};

func void DIA_Grimbald_HELLO_What_nono()
{
	AI_Output(other,self, " DIA_Grimbald_HALLO_Was_neinnein_15_00 " );	// You can't count on me.
	AI_Output(self,other, " DIA_Grimbald_HALLO_Was_neinnein_07_01 " );	// Then get lost, coward!
	Grimbald_PissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Grimbald_HELLO_What_yes()
{
	AI_Output(other,self, " DIA_Grimbald_HALLO_Was_ja_15_00 " );	// Okay, I'll help you! But you will go ahead.
	AI_Output(self,other, " DIA_Grimbald_HALLO_Was_ja_07_01 " );	// Of course! Just don't get too close to the black troll. He'll tear you to pieces, you understand?
	AI_Output(self,other, " DIA_Grimbald_HALLO_Was_ja_07_02 " );	// And I won't forgive you if you decide to run away.
	GrimbaldTellBT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Jagd");
};

func void DIA_Grimbald_HELLO_no()
{
	AI_Output(other,self, " DIA_Grimbald_HALLO_nein_15_00 " );	// I have things to do.
	AI_Output(self,other, " DIA_Grimbald_HALLO_nein_07_01 " );	// Don't talk nonsense! What is so important that can wait for you in this wilderness?
};

instance DIA_Grimbald_TrollTell(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_TrollTell_Condition;
	information = DIA_Grimbald_TrollTell_Info;
	permanent = FALSE;
	description = " What do you know about the black troll? " ;
};


func int DIA_Grimbald_TrollTell_Condition()
{
	if((Npc_IsDead(troll_black_ext) == FALSE) && (GrimbaldTellBT == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_TrollTell_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Grimbald_TrollTell_01_00 " );	// What do you know about the black troll?
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_01 " );	// This beast has been here for a very long time. He took a fancy to that cave, and since then it has become his permanent lair.
	AI_Output(other,self, " DIA_Grimbald_TrollTell_01_02 " );	// Does he always sit in it?
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_03 " );	// I don't know, mate. Usually trolls live high in the mountains, and only occasionally descend into the valley.
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_04 " );	// But this one seems to like it here. Therefore, he is unlikely to leave here.
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_05 " );	// Really, if I were you, I wouldn't check it out, mate.
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_06 " );	// The black troll is capable of tearing a living person into many small pieces!
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_07 " );	// And even very strong armor will hardly save you from its huge paws.
	AI_Output(other,self, " DIA_Grimbald_TrollTell_01_08 " );	// Really no one was able to kill this monster?
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_09 " );	// Many have already tried to do this, but they all died.
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_10 " );	// A couple of hunters were the last to try to challenge him.
	AI_Output(self,other, " DIA_Grimbald_TrollTell_01_11 " );	// It seems their bodies are still in the cave...
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_12");	//Ясно.
};

instance DIA_Grimbald_Trolltot(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Trolltot_Condition;
	information = DIA_Grimbald_Trolltot_Info;
	important = TRUE;
};


func int DIA_Grimbald_Trolltot_Condition()
{
	if(Npc_IsDead(troll_black_ext))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Trolltot_Info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Grimbald_Trolltot_07_00 " );	// The black troll is dead! Great job. I didn't believe it was possible to kill him at all. I will never forget this.
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(self,other, " DIA_Grimbald_Trolltot_07_01 " );	// The guys and I - Falk and the rest of the hunters, argued who would be the first of us to bang him.
		AI_Output(self,other, " DIA_Grimbald_Trolltot_07_02 " );	// But certainly none of us thought it would be you!
		AI_Output(self,other, " DIA_Grimbald_Trolltot_07_03 " );	// Falk will be surprised.
	};
};


instance DIA_Grimbald_hunt (C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Jagd_Condition;
	information = DIA_Grimbald_Hunting_Info;
	permanent = TRUE;
	description = " Can you teach me how to hunt? " ;
};

func int DIA_Grimbald_Jagd_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Grimbald_HELLO ) && ( Grimbald_TeachAnimalTrophy ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Hunting_Info()
{
	AI_Output(other,self, " DIA_Grimbald_Jagd_15_00 " );	// Can you teach me how to hunt?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == TRUE))
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_07_02 " );	// You already know everything I could teach you.
		GrimbaldTeachFinish = TRUE;
	}
	else
	{
		if(HEROISHUNTER == TRUE)
		{
			if((Grimbald_PissOff == FALSE) && (Npc_IsDead(Grimbald_Snapper1) == TRUE) && (Npc_IsDead(Grimbald_Snapper2) == TRUE) && (Npc_IsDead(Grimbald_Snapper3) == TRUE))
			{
				AI_Output(self,other, " DIA_Grimbald_Jagd_07_01 " );	// Mmm. Good. You haven't helped me much, but don't be too strict.
				Grimbald_TeachAnimalTrophy = TRUE;
				Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
				Log_AddEntry( TOPIC_HUNTERTEACHERS , " Grimbald can teach me how to butcher animals. " );
			}
			else
			{
				AI_Output(self,other, " DIA_Grimbald_Jagd_07_02 " );	// Of course. But not for free.
				B_Say_Gold(self,other,200);
				Info_ClearChoices(DIA_Grimbald_Jagd);
				Info_AddChoice(DIA_Grimbald_Jagd, " Okay, I'll think about it. " ,DIA_Grimbald_Jagd_zuviel);
				Info_AddChoice(DIA_Grimbald_Jagd, " Agreed, here's your money. " ,DIA_Grimbald_Jagd_ja);
			};
		}
		else if(Npc_KnowsInfo(other,DIA_Grimbald_Trolltot))
		{
			AI_Output(self,other, " DIA_Grimbald_Jagd_07_03 " );	// (thoughtfully) All right! You killed the black troll and I'm honored to teach you.
			Grimbald_TeachAnimalTrophy = TRUE;
			Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
			Log_AddEntry( TOPIC_HUNTERTEACHERS , " Grimbald can teach me how to butcher animals. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Grimbald_Jagd_07_04 " );	// (casually) Become a hunter first, boy. Then we'll talk.
			AI_StopProcessInfos(self);
		};
	};
};

func void DIA_Grimbald_hunt_yes()
{
	AI_Output(other,self, " DIA_Grimbald_Jagd_ja_15_00 " );	// Okay, here's the money.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other, " DIA_Grimbald_Jagd_ja_07_01 " );	// Great! Tell me when you want to learn something.
		Grimbald_TeachAnimalTrophy = TRUE;
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		Log_AddEntry( TOPIC_HUNTERTEACHERS , " Grimbald can teach me how to butcher animals. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_Jagd_ja_07_02 " );	// Bring me the money and I'm ready to train you.
	};
	Info_ClearChoices(DIA_Grimbald_Jagd);
};

func void DIA_Grimbald_Hunting_too much()
{
	AI_Output(other,self, " DIA_Grimbald_Jagd_zuviel_15_00 " );	// I'll think about it.
	AI_Output(self,other, " DIA_Grimbald_Jagd_zuviel_07_01 " );	// As you wish.
	Info_ClearChoices(DIA_Grimbald_Jagd);
};


instance DIA_Grimbald_TEACHHUNTING(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 12;
	condition = DIA_Grimbald_TEACHHUNTING_Condition;
	information = DIA_Grimbald_TEACHHUNTING_Info;
	permanent = TRUE;
	description = " Teach me how to hunt. " ;
};


func int DIA_Grimbald_TEACHHUNTING_Condition()
{
	if((Grimbald_TeachAnimalTrophy == TRUE) && (GrimbaldTeachFinish == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Grimbald_TEACHHUNTING_OneTime;

func void DIA_Grimbald_TEACHHUNTING_Info()
{
	AI_Output(other,self, " DIA_Grimbald_TEACHHUNTING_15_00 " );	// Teach me how to hunt.

	if(DIA_Grimbald_TEACHHUNTING_OneTime == FALSE)
	{
		Npc_ExchangeRoutine(self,"JagdOver");
		DIA_Grimbald_TEACHHUNTING_OneTime = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_07_01 " );	// What exactly do you want to know?
		Info_AddChoice(DIA_Grimbald_TEACHHUNTING,Dialog_Back,DIA_Grimbald_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt( " Carve bloodhornet stinger. " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_BFSting)),DIA_Grimbald_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt( " Cut off bloodhornet wings. " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_BFWing)),DIA_Grimbald_TEACHHUNTING_BFWing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Ломать когти.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Grimbald_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление мандибул.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grimbald_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt( " Removing crawler shells. " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_CrawlerPlate)),DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отламывать рог драконьего снеппера.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_07_02 " );	// You already know everything I could teach you.
		GrimbaldTeachFinish = TRUE;
	};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn_03_01 " );	// You stick the knife deep into the beast's forehead and, like a lever, carefully pull the thing out.
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn_03_02 " );	// If it doesn't come off the skull, then you need to use the second knife on the other side.
		CreateInvItems(Gas_Snapper,ItAt_DrgSnapperHorn, 1 );
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_BFSting_07_00 " );	// Cutting out the sting of a bloodfly is quite simple. You need to find its base and stick the knife in there with force.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_BFWing_07_00 " );	// Bloodfly wings can be torn out or cut with a sharp knife.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_Claws_07_00 " );	// There are several ways to cut claws. For some animals, a strong accurate blow with a knife is necessary, while for others they need to be cut very carefully.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_Mandibles_07_00 " );	// Creepers and field predators have strong mandibles that can be separated from the head with a strong, precise blow.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other, " DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00 " );	// The shells of the sliders are not easy to remove, but it can still be done with a sharp, durable object.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};


instance DIA_Grimbald_NovChase(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_NovChase_Condition;
	information = DIA_Grimbald_NovChase_Info;
	description = " Have you seen a novice here? " ;
};


func int DIA_Grimbald_NovChase_Condition()
{
	if(MIS_NovizenChase == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Grimbald_NovChase_Info()
{
	AI_Output(other,self, " DIA_Grimbald_NovChase_15_00 " );	// Have you seen a novice here?
	AI_Output(self,other, " DIA_Grimbald_NovChase_07_01 " );	// A lot of strange people passed through here today, including those two clowns at the stone archway.
	AI_Output(self,other, " DIA_Grimbald_NovChase_07_02 " );	// And recently, an acolyte of the Firebenders was talking to them about something.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grimbald_PICKPOCKET(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 900;
	condition = DIA_Grimbald_PICKPOCKET_Condition;
	information = DIA_Grimbald_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grimbald_PICKPOCKET_Condition()
{
	return  C_Robbery ( 85 , 250 );
};

func void DIA_Grimbald_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,Dialog_Back,DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};


instance DIA_GRIMBALD_RESPECT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_respect_condition;
	information = dia_grimbald_respect_info;
	permanent = FALSE;
	description = " I need your support. " ;
};


func int dia_grimbald_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( GRIMBALD_RESPECT  ==  FALSE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_grimbald_respect_info()
{
	AI_Output(other,self, " DIA_Grimbald_Respect_01_00 " );	// I need your support.
	AI_Output(self,other, " DIA_Grimbald_Respect_01_01 " );	// (surprised) What are you up to, boy?
	AI_Output(other,self, " DIA_Grimbald_Respect_01_02 " );	// I want to challenge Falk for the title of best hunter.
	AI_Output(other,self, " DIA_Grimbald_Respect_01_03 " );	// Will you vote for me?

	if(Npc_IsDead(troll_black_ext))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Grimbald_Respect_01_04 " );	// Why not. After all, it was you who killed the black troll, not Falk.
		AI_Output(self,other, " DIA_Grimbald_Respect_01_05 " );	// So you can count on my vote.
		AI_Output(other,self, " DIA_Grimbald_Respect_01_06 " );	// Thank you.
		GRIMBALD_RESPECT = TRUE;
		B_LogEntry( TOPIC_HUNTERSWORK , " Grimbald will cast his vote for me in an argument with Falk. " );
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_Respect_01_07 " );	// Why not. But first you have to prove to me that you are worth it.
		AI_Output(other,self, " DIA_Grimbald_Respect_01_08 " );	// And what should I do?
		AI_Output(self,other, " DIA_Grimbald_Respect_01_09 " );	// Kill that black troll! If you can do this, then I will cast my vote for you.
		AI_Output(other,self,"DIA_Grimbald_Respect_01_10");	//Хорошо.
	};
};

instance DIA_GRIMBALD_RESPECTDONE(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_respectdone_condition;
	information = dia_grimbald_respectdone_info;
	permanent = FALSE;
	description = " The black troll is dead! " ;
};

func int dia_grimbald_respectdone_condition()
{
	if ( Npc_KnowsInfo ( other , dia_grimbald_respect ) && ( CANHUNTERCHALLANGE  ==  TRUE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ) && ( GRIMBALD_RESPECT  ==  FALSE ) && Npc_IsDead (troll_black_ext ));
	{
		return TRUE;
	};
};

func void dia_grimbald_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Grimbald_RespectDone_01_00 " );	// The black troll is dead! Now can I count on your support?
	AI_Output(self,other, " DIA_Grimbald_RespectDone_01_01 " );	// Of course, as agreed!
	GRIMBALD_RESPECT = TRUE;
	B_LogEntry( TOPIC_HUNTERSWORK , " Grimbald will cast his vote for me in an argument with Falk. " );
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};

instance DIA_GRIMBALD_Furs(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_condition;
	information = dia_grimbald_Furs_info;
	permanent = FALSE;
	description = " I need sheepskins. " ;
};

func int dia_grimbald_Furs_condition()
{
	if(MIS_TiraksFur == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_info()
{
	AI_Output(other,self, " DIA_Grimbald_Furs_01_00 " );	// I need sheepskins.
	AI_Output(self,other, " DIA_Grimbald_Furs_01_01 " );	// Good. So what?
	AI_Output(other,self, " DIA_Grimbald_Furs_01_02 " );	// Do you have them?
	AI_Output(self,other, " DIA_Grimbald_Furs_01_03 " );	// (uncomprehending) Where do they come from?
	AI_Output(other,self, " DIA_Grimbald_Furs_01_04 " );	// But you're a hunter. Is not it so?
	AI_Output(self,other, " DIA_Grimbald_Furs_01_05 " );	// That's right, mate. I'm a hunter, not a farmer! Or do you see a flock of sheep next to me?
	AI_Output(other,self, " DIA_Grimbald_Furs_01_06 " );	// Well, I was hoping you had a couple or two lying around somewhere.
	AI_Output(self,other, " DIA_Grimbald_Furs_01_07 " );	// No, man. You yourself already realized that you turned to the wrong address.
	AI_Output(self,other, " DIA_Grimbald_Furs_01_08 " );	// The only hides I have are those of the predatory beasts I hunt here.
	AI_Output(self,other, " DIA_Grimbald_Furs_01_09 " );	// So if you want, I can offer them.
	AI_Output(other,self, " DIA_Grimbald_Furs_01_10 " );	// Are they good enough to keep you warm at night?
	AI_Output(self,other, " DIA_Grimbald_Furs_01_12 " );	// More than enough! The only reason people buy sheepskins is because they are pretty cheap.
	AI_Output(self,other, " DIA_Grimbald_Furs_01_13 " );	// And those who have real money prefer the more expensive skins of obscurantists, wargs, and even trolls.
	AI_Output(other,self,"DIA_Grimbald_Furs_01_14");	//Даже так?
	AI_Output(self,other, " DIA_Grimbald_Furs_01_15 " );	// I won't lie. True, now I have with me only the skins of obscurantists.
	AI_Output(self,other, " DIA_Grimbald_Furs_01_16 " );	// Therefore, I can only offer you them.
	AI_Output(other,self, " DIA_Grimbald_Furs_01_17 " );	// Okay. And how much are your skins worth?

	if(HEROISHUNTER == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Grimbald_Furs_01_18 " );	// Well, since you're one of us, I'll give them to you for free.
		AI_Output(self,other, " DIA_Grimbald_Furs_01_19 " );	// Here, take this. I hope you find them useful.
		B_GiveInvItems(self,other,ItAt_ShadowFur,2);
		AI_Output(other,self, " DIA_Grimbald_Furs_01_20 " );	// Great skins! Thank you.
		AI_Output(self,other, " DIA_Grimbald_Furs_01_21 " );	// No reason...
		GrimbaldTellSellFur = TRUE;
		; _ _ _ _
	}
	else if(Npc_IsDead(troll_black_ext) == TRUE)
	{
		B_GivePlayerXP(50);
		AI_Output(self,other, " DIA_Grimbald_Furs_01_22 " );	// Well...(thoughtfully) Since you were the one who killed the black troll, I'll give them to you for free.
		AI_Output(self,other, " DIA_Grimbald_Furs_01_23 " );	// But only one. Here you are.
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		AI_Output(other,self, " DIA_Grimbald_Furs_01_24 " );	// Excellent hide. How much is the second one?
		AI_Output(self,other, " DIA_Grimbald_Furs_01_25 " );	// Two hundred gold pieces for you. And trust me, it's a fair price.
		GrimbaldSellFur = TRUE;
		B_LogEntry(TOPIC_TiraksFur, " Grimbald didn't have sheepskins. However, he gave me a mrakoris skin, saying it would keep the cold as warm as sheepskin. If I want another one, I'll have to pay two hundred gold pieces for it. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_01_27 " );	// Two hundred gold each for you. And trust me, it's a fair price.
		B_LogEntry(TOPIC_TiraksFur, " Grimbald didn't have sheepskins. However, he offered me to buy mrakoris skins from him, saying that they would warm you from the cold as well as sheepskins. But I would have to pay two hundred gold pieces for each of them. " ) ;
		GrimbaldSellFurAll = TRUE;
	};
};

instance DIA_GRIMBALD_Furs_Tell(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_Tell_condition;
	information = dia_grimbald_Furs_Tell_info;
	permanent = FALSE;
	description = " Can you sell me more skins? " ;
};

func int dia_grimbald_Furs_Tell_condition()
{
	if(GrimbaldTellSellFur == TRUE)
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_Tell_info()
{
	AI_Output(other,self, " DIA_Grimbald_Furs_Tell_01_00 " );	// Can you sell me more skins?
	AI_Output(self,other, " DIA_Grimbald_Furs_Tell_01_01 " );	// Of course. But this time you'll have to pay for them.
	GrimbaldSellFur = TRUE;
};

instance DIA_GRIMBALD_Furs_Trade(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_Trade_condition;
	information = dia_grimbald_Furs_Trade_info;
	permanent = TRUE;
	description = " I want to buy skins from you. " ;
};

func int dia_grimbald_Furs_Trade_condition()
{
	if((GrimbaldSellFur == TRUE) || (GrimbaldSellFurAll == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_Trade_info()
{
	AI_Output(other,self, " DIA_Grimbald_Furs_Trade_01_00 " );	// I want to buy skins from you.

	if (ChapterGrimbaldSell == Chapter)
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_01_01 " );	// I don't have any skins to sell yet. Come back later.
	}
	else
	{
		if(MIS_TiraksFur == LOG_Running)
		{
			AI_Output(self,other, " DIA_Grimbald_Furs_Trade_01_03 " );	// As I said, the skin of the mrakoris will cost you two hundred gold pieces.
			AI_Output(self,other, " DIA_Grimbald_Furs_Trade_01_04 " );	// Do you have that kind of money?
			Info_ClearChoices(DIA_Grimbald_Furs_Trade);
			Info_AddChoice(DIA_Grimbald_Furs_Trade, " Not yet. " ,DIA_Grimbald_Furs_Trade_no);
			Info_AddChoice(DIA_Grimbald_Furs_Trade, " Here's your money. " ,DIA_Grimbald_Furs_Trade_geld);
		}
		else
		{
			AI_Output(self,other, " DIA_Grimbald_Furs_Trade_01_05 " );	// Good. What skin would you like to buy?
			Info_ClearChoices(DIA_Grimbald_Furs_Trade);
			Info_AddChoice(DIA_Grimbald_Furs_Trade, " I changed my mind. " ,DIA_Grimbald_Furs_Trade_NoSale);
			Info_AddChoice(DIA_Grimbald_Furs_Trade, " Warg Hide (Price: 100 coins) " ,DIA_Grimbald_Furs_Trade_Warg);
			Info_AddChoice(DIA_Grimbald_Furs_Trade, " Mrakoris Hide (Price: 200 coins) " ,DIA_Grimbald_Furs_Trade_Shadow);
			Info_AddChoice(DIA_Grimbald_Furs_Trade, " Troll Skin (Price: 500 coins) " ,DIA_Grimbald_Furs_Trade_troll);
		};
	};
};

func void DIA_Grimbald_Furs_Trade_geld()
{
	AI_Output(other,self, " DIA_Grimbald_Furs_Trade_geld_15_00 " );	// Here's your money.

	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_geld_17_01 " );	// Very good! Here is your skin.
		CreateInvItems(self,ItAt_ShadowFur,1);
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,200);
		AI_Output(other,self, " DIA_Grimbald_Furs_Trade_geld_17_02 " );	// Thank you.
		ChapterGrimbaldSell = Chapter;
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_geld_17_03 " );	// Until you have the required amount, I won't even talk about it.
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};


func void DIA_Grimbald_Furs_Trade_Warg()
{
	AI_Output(other,self, " DIA_Grimbald_Furs_Trade_Warg_15_00 " );	// I want to buy a warg hide.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_Warg_17_01 " );	// Okay, skin is yours. Take away!
		CreateInvItems(self,ItAt_WargFur,1);
		B_GiveInvItems(self,other,ItAt_WargFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,100);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Warg_17_02");	//Спасибо.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			ChapterGrimbaldSell = Chapter;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_Warg_17_03 " );	// But you don't have enough gold.
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_Warg_17_04 " );	// So don't try to fool me!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_Shadow()
{
	AI_Output(other,self, " DIA_Grimbald_Furs_Trade_Shadow_15_00 " );	// I want to buy a mrakoris hide.

	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_Shadow_17_01 " );	// Okay, skin is yours. Take away!
		CreateInvItems(self,ItAt_ShadowFur,1);
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,200);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Shadow_17_02");	//Спасибо.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			ChapterGrimbaldSell = Chapter;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_Shadow_17_03 " );	// But you don't have enough gold.
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_Shadow_17_04 " );	// So don't try to fool me!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_troll()
{
	AI_Output(other,self, " DIA_Grimbald_Furs_Trade_troll_15_00 " );	// I want to buy a troll skin.

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_troll_17_01 " );	// Okay, skin is yours. Take away!
		CreateInvItems(self,ItAt_TrollFur,1);
		B_GiveInvItems(self,other,ItAt_TrollFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_troll_17_02");	//Спасибо.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			ChapterGrimbaldSell = Chapter;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_troll_17_03 " );	// But you don't have enough gold.
		AI_Output(self,other, " DIA_Grimbald_Furs_Trade_troll_17_04 " );	// So don't try to fool me!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_NoSale()
{
	AI_Output(other,self, " DIA_Grimbald_Furs_Trade_NoSale_15_00 " );	// I changed my mind.
	AI_Output(self,other, " DIA_Grimbald_Furs_Trade_NoSale_17_01 " );	// Okay, as you know.
	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};


func void DIA_Grimbald_Furs_Trade_no()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_no_15_00");	//Пока нет.
	AI_Output(self,other, " DIA_Grimbald_Furs_Trade_no_17_01 " );	// Then we have nothing to talk about.
	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};
