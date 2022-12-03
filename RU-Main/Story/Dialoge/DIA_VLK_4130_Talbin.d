

instance DIA_Talbin_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Talbin_Runs;

instance DIA_Talbin_HELLO (C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 5;
	condition = DIA_Talbin_HALLO_Condition;
	information = DIA_Talbin_HELLO_Info;
	important = TRUE;
};


func int DIA_Talbin_HALLO_Condition()
{
	if (chapter <=  3 )
	{
		return TRUE;
	};
};

func void DIA_Talbin_HELLO_Info()
{
	AI_Output(self,other, " DIA_Talbin_HALLO_07_00 " );	// Stop! Not one step further!
	AI_Output(other,self, " DIA_Talbin_HALLO_15_01 " );	// Oh! No problem!
	AI_Output(self,other, " DIA_Talbin_HALLO_07_02 " );	// Eh! Another little lamb, huh? At first I thought you were one of those bastards that hang around here all the time.
	AI_Output(self,other, " DIA_Talbin_HALLO_07_03 " );	// But now I see you're not one of them. You look too defenseless!
};


instance DIA_Talbin_WASMACHTIHR (C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 6;
	condition = DIA_Talbin_WASMACHTIHR_Condition;
	information = DIA_Talbin_WASMACHTIHR_Info;
	description = " You look like a hunter who doesn't know what to do with his free time. " ;
};


func int DIA_Talbin_WASMACHTIHR_Condition()
{
	if (Talbin_Runs ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASMACHTIHR_Info()
{
	AI_Output(other,self, " DIA_Talbin_WASMACHTIHR_15_00 " );	// And you look like a hunter who doesn't know what to do with his free time.
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_07_01 " );	// Haha! Yes you guessed. But what else can I do - I can't go back through the Passage!
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_07_02 " );	// So I'm staying here and doing what I do best.
	if (Npc_IsDead(Engrom) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_07_03 " );	// I'm sorry, however, my friend Ingrom.
	};
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_07_04 " );	// Sit closer to my fire. Warm up a little.
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,Dialog_Back,DIA_Talbin_WASMACHTIHR_back);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR, " But I think you're comfortable here. " ,DIA_Talbin_WASMACHTIHR_gut);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR, " Are you a former convict from the Barrier? " ,DIA_Talbin_WASMACHTIHR_strf);
};

func void DIA_Talbin_WASMACHTIHR_back()
{
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf()
{
	AI_Output(other,self, " DIA_Talbin_WASMACHTIHR_strf_15_00 " );	// Are you a former convict from the Barrier?
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_strf_07_01 " );	// No, no! Why do you think so? I just wanted to make some money here.
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_strf_07_02 " );	// Someone told me this is the best hunting ground on the island.
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_strf_07_03 " );	// Paradise grounds, if you know what I mean.
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_strf_07_04 " );	// But the only thing to earn here after those damn orcs show up is an ax hit if you go too far!
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_strf_07_05 " );	// And I let those idiots fool me.
	AI_Output(other,self, " DIA_Talbin_WASMACHTIHR_strf_15_06 " );	// I know those pranksters!
};

func void DIA_Talbin_WASMACHTIHR_gut()
{
	AI_Output(other,self, " DIA_Talbin_WASMACHTIHR_gut_15_00 " );	// But I think you're comfortable here.
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_gut_07_01 " );	// Oh yes! I don't think I have anything to complain about. Despite those damn orcs, the area around the river is the least dangerous.
	AI_Output(self,other, " DIA_Talbin_WASMACHTIHR_gut_07_02 " );	// They don't seem to dare approach the water. Mmm. Though it might just be a coincidence.
};


instance DIA_Talbin_SORRYFORENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 7;
	condition = DIA_Talbin_SORRYFORENGROM_Condition;
	information = DIA_Talbin_SORRYFORENGROM_Info;
	description = " Why do you feel sorry for Angrom? " ;
};


func int DIA_Talbin_SORRYFORENGROM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Talbin_WASMACHTIHR ) && ( Npc_IsDead ( Engrom ) ==  FALSE ) && ( Talbin_FollowsThroughPass ==  0 ) && ( Capital <=  3 ) && ( Talbin_Runs ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Talbin_SORRYFORENGROM_Info()
{
	AI_Output(other,self, " DIA_Talbin_SORRYFORENGROM_15_00 " );	// Why do you feel sorry for Angrom?
	AI_Output(self,other, " DIA_Talbin_SORRYFORENGROM_07_01 " );	// Because he just followed me without asking questions.
	AI_Output(self,other, " DIA_Talbin_SORRYFORENGROM_07_02 " );	// And here we are in this mess. Greed never leads to good.
};


instances of DIA_Talbin_WASJAGDIHR (C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 8;
	condition = DIA_Talbin_WASJAGDIHR_Condition;
	information = DIA_Talbin_WASJAGDIHR_Info;
	description = " Who are you hunting by the river? " ;
};


func int DIA_Talbin_WASJAGDIHR_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Talbin_WASMACHTIRE ) && ( Talbin_FollowsThroughPass ==  0 ) && ( Talbin_Runs ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASJAGDIHR_Info()
{
	AI_Output(other,self, " DIA_Talbin_WASJAGDIHR_15_00 " );	// And who are you hunting by the river?
	AI_Output(self,other, " DIA_Talbin_WASJAGDIHR_07_01 " );	// What a question! Just walk along the river and you will understand who I am hunting. On shnygov, of course!
	AI_Output(self,other, " DIA_Talbin_WASJAGDIHR_07_02 " );	// These creatures are not easy to kill, but their meat is delicious.
	AI_Output(self,other, " DIA_Talbin_WASJAGDIHR_07_03 " );	// Sometimes I also run into scavengers. I'm not picky, and I don't turn my nose up at them either!
};


instance DIA_Talbin_ENGROMANGRY(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 9;
	condition = DIA_Talbin_ENGROMANGRY_Condition;
	information = DIA_Talbin_ENGROMANGRY_Info;
	description = " I think your buddy is kinda stressed out! " ;
};


func int DIA_Talbin_ENGROMANGRY_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Engrom_WhatAboutLeaving ) && Npc_KnowsInfo ( other , DIA_Talbin_SORRYFORENGROM ) && ( Npc_IsDead ( Engrom ) ==  FALSE ) && ( Talbin_FollowsThroughPass ==  0 ) && ( Capital <=  3 ) && ( Talbin_Run )  ) ;
	{
		return TRUE;
	};
};

func void DIA_Talbin_ENGROMANGRY_Info()
{
	AI_Output(other,self, " DIA_Talbin_ENGROMANGRY_15_00 " );	// I think your friend is kind of stressed out!
	AI_Output(self,other, " DIA_Talbin_ENGROMANGRY_07_01 " );	// Drop it. Don't provoke him or he will kill me. There is nothing I can do to help him now.
	AI_Output(self,other, " DIA_Talbin_ENGROMANGRY_07_02 " );	// But I'll think of something!
};


instance DIA_Talbin_AskTeacher(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 10;
	condition = DIA_Talbin_AskTeacher_Condition;
	information = DIA_Talbin_AskTeacher_Info;
	description = " Can you teach me how to hunt? " ;
};


func int DIA_Talbin_AskTeacher_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Talbin_WASJAGDIHR ) && ( Talbin_FollowsThroughPass ==  0 ) && ( Talbin_Runs ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other,self, " DIA_Talbin_AskTeacher_15_00 " );	// Can you teach me how to hunt?
	AI_Output(self,other, " DIA_Talbin_AskTeacher_07_01 " );	// I understand! This attracted you too. Good. But not free!
	AI_Output(other,self, " DIA_Talbin_AskTeacher_15_02 " );	// What do you want for this?
	AI_Output(self,other, " DIA_Talbin_AskTeacher_07_03 " );	// Don't you have anything to eat besides schnyg meat? Maybe a piece of cheese? Yes, a piece of cheese. I would give my life for this piece...
	AI_Output(other,self, " DIA_Talbin_AskTeacher_15_04 " );	// I'll see what I can do.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher, " Talbin can teach me how to get animal trophies. " );
};


instance DIA_Talbin_PayTeacher(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 11;
	condition = DIA_Talbin_PayTeacher_Condition;
	information = DIA_Talbin_PayTeacher_Info;
	permanent = TRUE;
	description = " Here's your cheese. Will you teach me now? " ;
};


var int DIA_Talbin_PayTeacher_noPerm;

func int DIA_Talbin_PayTeacher_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Talbin_AskTeacher ) && ( DIA_Talbin_PayTeacher_noPerm ==  FALSE ) && ( Talbin_FollowsThroughPass ==  0 ) && ( Talbin_Runs ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Talbin_PayTeacher_Info()
{
	if(B_GiveInvItems(other,self,ItFo_Cheese,1))
	{
		AI_Output(other,self, " DIA_Talbin_PayTeacher_15_00 " );	// Here's your cheese. Will you teach me now?
		AI_Output(self,other, " DIA_Talbin_PayTeacher_07_01 " );	// Do you really have cheese? Oh, I haven't eaten anything like this in a long time. Thank you. Uh, what about... Oh, yes, of course!
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Talbin_PayTeacher_15_02 " );	// I don't have any cheese now!
		AI_Output(self,other, " DIA_Talbin_PayTeacher_07_03 " );	// This would be too good to be true. Okay, tell me when you get it!
	};
};

var int TalbinTeachAll;

instance DIA_Talbin_TEACHHUNTING(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 12;
	condition = DIA_Talbin_TEACHHUNTING_Condition;
	information = DIA_Talbin_TEACHHUNTING_Info;
	permanent = TRUE;
	description = " What can you teach me? " ;
};


func int DIA_Talbin_TEACHHUNTING_Condition()
{
	if((Talbin_TeachAnimalTrophy == TRUE) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE) && (TalbinTeachAll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_TEACHHUNTING_Info()
{
	AI_Output(other, self, " DIA_Talbin_TEACHHUNTING_15_00 " );	// What can you teach me?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE))
	{
		AI_Output(self,other, " DIA_Talbin_TEACHHUNTING_07_01 " );	// What do you want to know?
		Info_AddChoice(DIA_Talbin_TEACHHUNTING,Dialog_Back,DIA_Talbin_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,b_buildlearnstringforsmithhunt("Ломать когти",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Talbin_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,b_buildlearnstringforsmithhunt("Сдирать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Talbin_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отламывать рог мракориса",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Talbin_TEACHHUNTING_ShadowHorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать сердце",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Talbin_TEACHHUNTING_Heart);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Talbin_TEACHHUNTING_07_02 " );	// I will disappoint you. You already know everything I can teach. But anyway, thanks for the cheese!
		TalbinTeachAll = TRUE;
	};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other, " DIA_Talbin_TEACHHUNTING_Claws_07_00 " );	// Cutting off claws is easy. You take the claw by the base and press it to the ground.
		AI_Output(self,other, " DIA_Talbin_TEACHHUNTING_Claws_07_01 " );	// Then you take a knife and carefully cut off the claw.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other, " DIA_Talbin_TEACHHUNTING_Fur_07_00 " );	// The easiest way to remove the skin from the shnyg is to make an incision along the entire abdomen...
		AI_Output(self,other, " DIA_Talbin_TEACHHUNTING_Fur_07_01 " );	// ...then you pull on the hind legs and pull the hide from back to front.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other, " DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00 " );	// Aurora horns are very hard and are used to make statues and tools.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other, " DIA_Talbin_TEACHHUNTING_Heart_07_00 " );	// Hearts of magical creatures are very rare and very hard to obtain. Be careful when you try to do this, especially with golems.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};


instance DIA_Talbin_KAP3_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP3_EXIT_Condition;
	information = DIA_Talbin_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP4_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP4_EXIT_Condition;
	information = DIA_Talbin_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP4_WASNEUES(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 13;
	condition = DIA_Talbin_KAP4_WASNEUES_Condition;
	information = DIA_Talbin_KAP4_WASNEUES_Info;
	description = " Has anyone passed through here? " ;
};


func int DIA_Talbin_KAP4_WASNEUES_Condition()
{
	if (( Capital >=  4 ) && ( Talbin_FollowsThroughPass ==  0 ) && ( Talbin_Runs ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASNEUES_Info()
{
	AI_Output(other,self, " DIA_Talbin_KAP4_WASNEUES_15_00 " );	// Has anyone passed through here?
	AI_Output(self,other, " DIA_Talbin_KAP4_WASNEUES_07_01 " );	// Like. There were some really funny guys here recently! They walked around in overdressed armor, and they had a very important and pompous look.
};


instance DIA_Talbin_KAP4_WASWOLLTENDJG (C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 14;
	condition = DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information = DIA_Talbin_KAP4_WASWOLLTENDJG_Info;
	description = " What did these 'funny guys' need here? " ;
};


func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Talbin_CHAPTER_WASNEUES ) && ( Chapter >=  4 ) && ( Talbin_FollowsThroughPass ==  0 ) && ( Talbin_Runs ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info()
{
	AI_Output(other,self, " DIA_Talbin_KAP4_WASWOLLTENDJG_15_00 " );	// What did these 'funny guys' want here?
	AI_Output(self,other, " DIA_Talbin_KAP4_WASWOLLTENDJG_07_01 " );	// They asked me about provisions and equipment. I can barely make ends meet!
	AI_Output(self,other, " DIA_Talbin_KAP4_WASWOLLTENDJG_07_02 " );	// They chatted something about going to kill the dragon. God only knows where they came from, but they didn't inspire much confidence in me!
	if (chapter ==  4 )
	{
		B_LogEntry(TOPIC_Dragonhunter, " Several dragon hunters have stopped at Talbin's hunting grounds. " );
	};
};


instance DIA_Talbin_WOENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 15;
	condition = DIA_Talbin_WOENGROM_Condition;
	information = DIA_Talbin_WOENGROM_Info;
	description = " Are you alone now? " ;
};


func int DIA_Talbin_WOENGROM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Talbin_WASMACHTIHR ) && ( Capital >=  4 ) && ( Talbin_FollowsThroughPass ==  0 ) && ( EngromIsGone ==  TRUE ) && ( Talbin_Runs ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOENGROM_Info()
{
	AI_Output(other,self, " DIA_Talbin_WOENGROM_15_00 " );	// Are you alone now?
	AI_Output(self,other, " DIA_Talbin_WOENGROM_07_01 " );	// Yes. My friend Ingrom is gone. Yesterday he said that he had a vision - someone spoke to him very kindly.
	AI_Output(self,other, " DIA_Talbin_WOENGROM_07_02 " );	// I didn't hear anything. I thought to myself that he just got to the point...
	AI_Output(self,other, " DIA_Talbin_WOENGROM_07_03 " );	// ...and then it suddenly disappeared. I have no idea where he went.
	AI_Output(self,other, " DIA_Talbin_WOENGROM_07_04 " );	// If you see Angrom anywhere, tell him he still owes me the skin of the sniff.
	if(Npc_KnowsInfo(other,DIA_Engrom_WhatAboutLeaving))
	{
		AI_Output(other,self, " DIA_Talbin_WOENGROM_15_05 " );	// But I had the impression that he wasn't going to leave here while the orcs were still in the valley.
		AI_Output(self,other, " DIA_Talbin_WOENGROM_07_06 " );	// I told you: his head went crazy.
	};
	MIS_Tabin_LookForEngrom = LOG_Running;
};


instance DIA_Talbin_FOUNDENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 16;
	condition = DIA_Talbin_FOUNDENGROM_Condition;
	information = DIA_Talbin_FOUNDENGROM_Info;
	description = " I found your buddy Angrom. " ;
};


func int DIA_Talbin_FOUNDENGROM_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Talbin_WOENGROM) && ((Npc_ObsessedByDMT_Engrom ==  TRUE ) || Npc_HasItems(other,ItAt_TalbinsLurkersSkin)) && (Capital >=  4 ) && (Talbin_FollowsThroughPass ==  0 ) && (Talbin_Runs == )  ) .
	{
		return TRUE;
	};
};

func void DIA_Talbin_FOUNDENGROM_Info()
{
	AI_Output(other,self, " DIA_Talbin_FOUNDENGROM_15_00 " );	// I found your friend Angrom.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Да? Где он?
	if(Npc_IsDead(Engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//Он мертв.
	}
	else
	{
		AI_Output(other,self, " DIA_Talbin_FOUNDENGROM_15_03 " );	// I don't think you'll ever see him.
	};
	if(B_GiveInvItems(other,self,ItAt_TalbinsLurkerSkin,1))
	{
		AI_Output(other,self, " DIA_Talbin_FOUNDENGROM_15_04 " );	// Here! I found this shnyga skin with him.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Talbin_FOUNDENGROM_15_05 " );	// The dark wanderers have possessed him.
		AI_Output(self,other, " DIA_Talbin_FOUNDENGROM_07_06 " );	// Dark wanderers? Who are they?
		AI_Output(other,self, " DIA_Talbin_FOUNDENGROM_15_07 " );	// Minions of Beliar! They are the ones who command the orcs.
	};
	AI_Output(self,other, " DIA_Talbin_FOUNDENGROM_07_08 " );	// Oh, Innos. I need to get out of here, even if I find my death in the process. Now or never!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_Talbin_Runs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs,LOG_Running);
	B_LogEntry(TOPIC_Talbin_Runs, " Talbin, a hunter from the Valley of Mines, was running through the pass as if he were being chased by a swarm of blood flies. I think he's headed for Khorinis. " );
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(Snapper,"START");
	Talbin_Runs = TRUE;
};


instance DIA_Talbin_WOHIN (C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 17;
	condition = DIA_Talbin_WOHIN_Condition;
	information = DIA_Talbin_WOHIN_Info;
	permanent = TRUE;
	description = " Where are you going? " ;
};

func int DIA_Talbin_WHERE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Talbin_FOUNDENGROM ) && ( Talbin_FollowsThroughPass ==  0 ))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WHIN_Info()
{
	AI_Output(other,self, " DIA_Talbin_WOHIN_15_00 " );	// Where are you going?

	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other, " DIA_Talbin_WOHIN_07_01 " );	// Lead me through the passage. Please!
		Info_ClearChoices(DIA_Talbin_WHIN);
		Info_AddChoice(DIA_Talbin_WOHIN, " I don't have time for you. " ,DIA_Talbin_WOHIN_);
		Info_AddChoice(DIA_Talbin_WOHIN, " Just go ahead. " ,DIA_Talbin_WOHIN_durch);
		Info_AddChoice(DIA_Talbin_WOHIN, " Хорошо. " ,DIA_Talbin_WOHIN_ok);
	}
	else
	{
		AI_Output(self,other, " DIA_Talbin_WOHIN_07_02 " );	// I have to get out of here!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Talbin_WHIN_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//Хорошо.
	AI_Output(self,other, " DIA_Talbin_WOHIN_ok_07_01 " );	// Thank you! I'll just follow you.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	Talbin_FollowsThroughPass = LOG_Running;
};

func void DIA_Talbin_WHIN_through()
{
	AI_Output(other,self, " DIA_Talbin_WOHIN_durch_15_00 " );	// Just go ahead.
	AI_Output(self,other, " DIA_Talbin_WOHIN_durch_07_01 " );	// It's so dark in there! I would never go there alone.
};

func void DIA_Talbin_WHIN_()
{
	AI_Output(other,self, " DIA_Talbin_WOHIN_schwein_15_00 " );	// I don't have time for you.
	AI_Output(self,other, " DIA_Talbin_WOHIN_schwein_07_01 " );	// Are you leaving me here to die?! You will burn in hell for this!
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_DISCOVER (C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 15;
	condition = DIA_Talbin_DISCOVER_Condition;
	information = DIA_Talbin_DISCOVER_Info;
	permanent = TRUE;
	description = "Эй.";
};


func int DIA_Talbin_DISAPPEAR_Condition()
{
	if(Talbin_FollowsThroughPass == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_DISAPPEAR_Info()
{
	AI_Output(other,self, " DIA_Talbin_DISCOVER_15_00 " );	// Эй.
	AI_Output(self,other, " DIA_Talbin_VERSCHWINDE_07_01 " );	// Get lost. I can manage without you, shit!
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP5_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP5_EXIT_Condition;
	information = DIA_Talbin_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP6_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP6_EXIT_Condition;
	information = DIA_Talbin_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_PICKPOCKET(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 900;
	condition = DIA_Talbin_PICKPOCKET_Condition;
	information = DIA_Talbin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Talbin_PICKPOCKET_Condition()
{
	return  C_Robbery ( 40 , 25 );
};

func void DIA_Talbin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
	Info_AddChoice(DIA_Talbin_PICKPOCKET,Dialog_Back,DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talbin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

instance DIA_Talbin_LostPaladins(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 10;
	condition = DIA_Talbin_LostPaladins_Condition;
	information = DIA_Talbin_LostPaladins_Info;
	description = " Didn't a squad of paladins pass by here by any chance? " ;
};

func int DIA_Talbin_LostPaladins_Condition()
{
	if(MIS_LostPaladins == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Talbin_LostPaladins_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Talbin_LostPaladins_01_00 " );	// Didn't a squad of paladins pass by here by any chance?
	AI_Output(self,other, " DIA_Talbin_LostPaladins_01_01 " );	// It was the case. But this can hardly be called a detachment!
	AI_Output(other,self, " DIA_Talbin_LostPaladins_01_02 " );	// What do you mean?
	AI_Output(self,other, " DIA_Talbin_LostPaladins_01_03 " );	// I only saw one paladin! There, on the other side of the river. And it looks like he was badly hurt.
	AI_Output(other,self, " DIA_Talbin_LostPaladins_01_04 " );	// Where did he go?
	AI_Output(self,other, " DIA_Talbin_LostPaladins_01_05 " );	// He went along the river towards the castle. But in my opinion it was a bad idea!
	AI_Output(other,self,"DIA_Talbin_LostPaladins_01_06");	//Почему?
	AI_Output(self,other, " DIA_Talbin_LostPaladins_01_07 " );	// It's just full of orcs there! They must have already caught him.
	AI_Output(other,self,"DIA_Talbin_LostPaladins_01_08");	//Ясно.
	HintVenzelOrcs_01 = TRUE;
	B_LogEntry(TOPIC_LostPaladins, " Hunter Talbin saw a wounded paladin on the other side of the river. Perhaps it was someone from Wenzel's detachment. That paladin was heading along the river towards the castle, but according to Talbin, most likely, he was already captured by the orcs. " );
};
