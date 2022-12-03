

instance DIA_Edda_EXIT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 999;
	condition = DIA_Edda_EXIT_Condition;
	information = DIA_Edda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Edda_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Edda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EDDA_NO_TALK(C_Info)
{
	npc = VLK_471_Edda;
	nr = 1;
	condition = dia_edda_no_talk_condition;
	information = dia_edda_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_edda_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_edda_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Edda_Hello (C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_Edda_Hallo_Condition;
	information = DIA_Edda_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Edda_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Edda_Hallo_Info()
{
	AI_Output(other,self, " DIA_Edda_Hallo_15_00 " );	// What are you cooking?
	AI_Output(self,other, " DIA_Edda_Hallo_17_01 " );	// Wow! It may not be particularly tasty, but at least it's a hot meal.
	AI_Output(self,other, " DIA_Edda_Hallo_17_02 " );	// I can pour you a plate if you want.
};


instance DIA_Edda_Stadt (C_Info)
{
	npc = VLK_471_Edda;
	nr = 5;
	condition = DIA_Edda_Stadt_Condition;
	information = DIA_Edda_Stadt_Info;
	permanent = FALSE;
	description = " What can you tell me about the city? " ;
};


func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other,self, " DIA_Edda_Stadt_15_00 " );	// What can you tell me about the city?
	AI_Output(self,other, " DIA_Edda_Stadt_17_01 " );	// Most citizens fear thieves. Therefore, it is better not to enter other people's houses.
	AI_Output(self,other, " DIA_Edda_Stadt_17_02 " );	// But if you're looking for a place to stay for the night, you can sleep in my hut. There is another bed there.
	AI_Output(other, self, " DIA_Edda_Stadt_15_03 " );	// Aren't you afraid of thieves?
	AI_Output(self,other, " DIA_Edda_Stadt_17_04 " );	// The only valuable thing I had is already gone.
	AI_Output(self,other, " DIA_Edda_Stadt_17_05 " );	// Someone stole my statuette of Innos!
	Edda_bed = TRUE ;
	MIS_EddaStatue = LOG_Running;
	Log_CreateTopic(TOPIC_EddaStatue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EddaStatue,LOG_Running);
	B_LogEntry(TOPIC_EddaStatue, " Some thief stole Innos' statue from Edda. We should help the poor thing get it back. " );
	Wld_AssignRoomToGuild("hafen08",GIL_NONE);
	Npc_ExchangeRoutine(VLK_471_Edda,"friend");
};

instance DIA_Edda_Kochen (C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Cooking_Condition;
	information = DIA_Edda_Cooking_Info;
	permanent = FALSE;
	description = " Can you make some soup for me? " ;
};

func int DIA_Edda_Cooking_Condition()
{
	return TRUE;
};

func void DIA_Edda_Cooking_Info()
{
	AI_Output(other,self, " DIA_Edda_Kochen_15_00 " );	// Can you make soup for me?
	AI_Output(self,other, " DIA_Edda_Kochen_17_01 " );	// I cook for everyone. For you too, if you want. All I need is for you to bring me a fish.
};

var int EddaTeachCook;

instance DIA_Edda_TeachCook(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_TeachCook_Condition;
	information = DIA_Edda_TeachCook_Info;
	permanent = FALSE;
	description = " How about you teach me how to make soup? " ;
};

func int DIA_Edda_TeachCook_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Edda_Cooking))
	{
		return TRUE;
	};
};

func void DIA_Edda_TeachCook_Info()
{
	AI_Output(other,self, " DIA_Edda_TeachCook_01_00 " );	// How about teaching me how to make soup?
	AI_Output(self,other, " DIA_Edda_TeachCook_01_01 " );	// Hmmm... (appreciatively) This is going to be more difficult! But for a couple of gold coins, I'm ready to help you.
	EddaTeachCook = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry( TOPIC_COOK , " Edda can teach me how to cook soups. " );
};

instance DIA_Edda_TeachCookDone(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_TeachCookDone_Condition;
	information = DIA_Edda_TeachCookDone_Info;
	permanent = TRUE;
	description = " Teach me how to cook soups. " ;
};

func int DIA_Edda_TeachCookDone_Condition()
{
	if((EddaTeachCook == TRUE) && ((Edda_Soup_01 == FALSE) || (Edda_Soup_02 == FALSE) || (Edda_Soup_03 == FALSE) || (Edda_Soup_04 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Edda_TeachCookDone_Info()
{
	AI_Output(other,self, " DIA_Edda_TeachCookDone_01_00 " );	// Teach me how to cook soups.
	AI_Output(self,other, " DIA_Edda_TeachCookDone_01_01 " );	// Good! What do you want to cook?
	Info_ClearChoices(DIA_Edda_TeachCookDone);
	Info_AddChoice(DIA_Edda_TeachCookDone,Dialog_Back,DIA_Edda_TeachCookDone_back);

	if(Edda_Soup_00 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone, " Turnip Soup (Price: 25 coins) " ,DIA_Edda_TeachCookDone_Beet);
	};
	if(Edda_Soup_01 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone, " Fish soup (Price: 50 coins) " ,DIA_Edda_TeachCookDone_fish);
	};
	if(Edda_Soup_02 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone, " Dimensions (size: 200 minutes) " ,DIA_Edda_TeachCookDone_shildkroetesoup);
	};
	if(Edda_Soup_03 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone, " Mushroom Soup (Price: 100 coins) " ,DIA_Edda_TeachCookDone_pilzsuppe);
	};
	if(Edda_Soup_04 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone, " Pages (size: 150 minutes) " ,DIA_Edda_TeachCookDone_Meet);
	};
};

func void DIA_Edda_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Edda_TeachCookDone);
};

func void DIA_Edda_TeachCookDone_Beet()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 25)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,25);
		AI_Output(self,other, " DIA_Edda_TeachCookDone_fish_01_02 " );	// Boil it for ten minutes - and your soup is ready!
		AI_Print( " Recipe for 'Turnip Soup' learned " );
		B_LogEntry( TOPIC_COOK , " Now I can cook turnip soup. For this I need turnips and a pot of water. " );
		Snd_Play("LevelUP");
		Edda_Soup_00 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Edda_TeachCookDone_fish_01_04 " );	// Sorry. But I won't do it for free.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_fish_01_05 " );	// Bring the gold first.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_fish()
{
	AI_Output(other,self, " DIA_Edda_TeachCookDone_fish_01_00 " );	// Fish soup.

	if(Npc_HasItems(hero,ItMi_Gold) >= 50)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,50);
		AI_Output(self,other, " DIA_Edda_TeachCookDone_fish_01_01 " );	// This is easy. (chuckles) You take a fish, clean it from scales and throw it into a cauldron of water.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_fish_01_02 " );	// Boil it for ten minutes - and your soup is ready!
		AI_Print( " Recipe for 'Fish Soup' has been learned " );
		B_LogEntry( TOPIC_COOK , " Now I can cook fish soup. For this I need fish and a pot of water. " );
		Snd_Play("LevelUP");
		Edda_Soup_01 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Edda_TeachCookDone_fish_01_04 " );	// Sorry. But I won't do it for free.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_fish_01_05 " );	// Bring the gold first.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_Meet()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 150)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,150);
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_01 " );	// Good choice! If cooked correctly, it will turn out very tasty!
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_03 " );	// I think one piece should be enough. You throw it into the cauldron and boil it over low heat.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_04 " );	// Before the blink of an eye, your soup will be ready. Remember?
		AI_Output(other,self, " DIA_Edda_TeachCookDone_shildkroetesoup_01_05 " );	// Of course.
		AI_Print( " Recipe for cooking 'Meat Soup' studied " );
		B_LogEntry( TOPIC_COOK , " Now I can cook meat soup. For this I need a piece of meat and a pot of water. " );
		Snd_Play("LevelUP");
		Edda_Soup_04 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_06 " );	// Sorry. But I won't do it for free.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_07 " );	// Bring the gold first.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_shildkroetesoup()
{
	AI_Output(other,self, " DIA_Edda_TeachCookDone_shildkroetesoup_01_00 " );	// Turtle soup.

	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,200);
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_01 " );	// Good choice! If cooked correctly, it will turn out very tasty!
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_02 " );	// But first you'll have to find turtle meat.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_03 " );	// I think one piece should be enough. You throw it into the cauldron and boil it over low heat.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_04 " );	// Before the blink of an eye, your soup will be ready. Remember?
		AI_Output(other,self, " DIA_Edda_TeachCookDone_shildkroetesoup_01_05 " );	// Of course.
		AI_Print( " Learned the recipe for cooking - 'Turtle Soup' " );
		B_LogEntry( TOPIC_COOK , " Now I can cook turtle soup. For this I need a piece of turtle meat and a cauldron of water. " );
		Snd_Play("LevelUP");
		Edda_Soup_02 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_06 " );	// Sorry. But I won't do it for free.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_shildkroetesoup_01_07 " );	// Bring the gold first.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};


func void DIA_Edda_TeachCookDone_pilzsuppe()
{
	AI_Output(other,self, " DIA_Edda_TeachCookDone_pilzsuppe_01_00 " );	// Mushroom soup.

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,100);
		AI_Output(self,other, " DIA_Edda_TeachCookDone_pilzsuppe_01_01 " );	// Everything is simple here. You only need one meat mushroom!
		AI_Output(self,other, " DIA_Edda_TeachCookDone_pilzsuppe_01_03 " );	// You throw it into the cauldron, boil it, and in just a couple of minutes your soup will be ready.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_pilzsuppe_01_04 " );	// That's all.
		AI_Print( " Recipe for 'Mushroom Soup' has been learned " );
		B_LogEntry( TOPIC_COOK , " Now I can cook mushroom soup. For this I need one meat mushroom. " );
		Snd_Play("LevelUP");
		Edda_Soup_03 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Edda_TeachCookDone_pilzsuppe_01_05 " );	// Sorry. But I won't do it for free.
		AI_Output(self,other, " DIA_Edda_TeachCookDone_pilzsuppe_01_06 " );	// Bring the gold first.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

instance DIA_Edda_Kochen_Compot (C_Info)
{
	npc = VLK_471_Edda;
	nr = 1;
	condition = DIA_Edda_Kochen_Compot_Condition;
	information = DIA_Edda_Kochen_Compot_Info;
	permanent = FALSE;
	description = " Do you cook anything besides soups? " ;
};

func int DIA_Edda_Kochen_Compot_Condition()
{
	if(EddaTeachCook == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Edda_Kochen_Compot_Info()
{
	AI_Output(other,self, " DIA_Edda_Kochen_Compot_01_00 " );	// Do you cook anything besides soups?
	AI_Output(self,other, " DIA_Edda_Kochen_Compot_01_01 " );	// What exactly are you interested in?
	AI_Output(other,self, " DIA_Edda_Kochen_Compot_01_02 " );	// Well, for example, compotes or some cuts.
	AI_Output(self,other, " DIA_Edda_Kochen_Compot_01_03 " );	// No, I can't do that! So you better look for someone else.
	AI_Output(other,self,"DIA_Edda_Kochen_Compot_01_04");	//Ясно.
};

instance DIA_Edda_Suppe (C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Suppe_Condition;
	information = DIA_Edda_Soup_Info;
	permanent = TRUE;
	description = " Can you make some soup for me? " ;
};

func int DIA_Edda_Suppe_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Edda_Cooking))
	{
		return TRUE;
	};
};

func void dia_edda_suppe_back()
{
	Info_ClearChoices(DIA_Edda_Suppe);
};

func void DIA_Edda_Suppe_Info()
{
	AI_Output(other,self, " DIA_Edda_Suppe_15_00 " );	// Can you make soup for me?

 	if (Wld_IsTime( 8 , 0 , 13 , 0 ) || Wld_IsTime( 15 , 0 , 20 , 0 ) )
	{
		if ( Wld_GetDay ( ) ==  0 )
		{
			AI_Output(self,other, " DIA_Edda_Suppe_17_02 " );	// From tomorrow you can come and get soup every day.
		}
		else  if (Edda_Day != Wld_GetDay())
		{
			Info_ClearChoices(DIA_Edda_Suppe);
			Info_AddChoice(DIA_Edda_Soup,Dialog_Back,dia_edda_suppe_back);
			Info_AddChoice(DIA_Edda_Suppe, " Fish Soup (Requires: 2 Fish) " ,DIA_Edda_Suppe_Fish);

			if(MIS_EddaStatue == LOG_Success)
			{
				Info_AddChoice(DIA_Edda_Suppe, " Turtle Soup (Requires: 2 Turtle Meat) " ,DIA_Edda_Suppe_Turtle);
				Info_AddChoice(DIA_Edda_Suppe, " Mushroom Soup (Requires: 2 meat mushrooms) " ,DIA_Edda_Suppe_Mushroom);
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Edda_Suppe_17_03 " );	// No, not today! Come tomorrow.
		};
	}
 	else  if (Wld_IsTime( 13 , 0 , 15 , 0 ))
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_11 " );	// It's already night in the yard! Come tomorrow.
	};	
};

func void DIA_Edda_Suppe_Fish()
{
	if(B_GiveInvItems(other,self,ItFo_Fish,2))
	{
		AI_Output(self,other, " DIA_Edda_Suppe_17_01 " );	// Nothing could be easier! Here, have a plate.
		B_GiveInvItems(self,other,ItFo_FishSoup,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Edda_Suppe_17_04 " );	// Bring me a fish and I'll cook you a tasty stew.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Edda_Suppe_Turtle()
{
	if(B_GiveInvItems(other,self,itfoschildkroeteraw,2))
	{
		AI_Output(self,other, " DIA_Edda_Suppe_Turtle_17_01 " );	// Nothing could be easier! Here, have a plate.
		B_GiveInvItems(self,other,itfo_schildkroetesoup,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Edda_Suppe_Turtle_17_04 " );	// Bring me two pieces of turtle meat and I'll make you a tasty stew.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Edda_Suppe_Mushroom()
{
	if(B_GiveInvItems(other,self,ItPl_Mushroom_02,2))
	{
		AI_Output(self,other, " DIA_Edda_Suppe_Mushroom_17_01 " );	// Nothing could be easier! Here, have a plate.
		B_GiveInvItems(self,other,itfo_pilzsuppe,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Edda_Suppe_Mushroom_17_04 " );	// Bring me two meat mushrooms and I'll make you a delicious stew.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

instance DIA_Edda_Statue (C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Statue_Condition;
	information = DIA_Edda_Statue_Info;
	permanent = FALSE;
	description = " Look, I brought a statue of Innos for you. " ;
};

func int DIA_Edda_Statue_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Existing_Statue ) && ( Npc_HasItems ( other , It_My_InnosStatue ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Edda_Statue_Info()
{
	B_GivePlayerXP(XP_Edda_Statue);
	AI_Output(other,self, " DIA_Edda_Statue_15_00 " );	// Look, I brought a statue of Innos for you.
	AI_Output(self,other, " DIA_Edda_Statue_17_01 " );	// Oh - thank you so much. May the light of Innos not leave you...
	AI_Output(other,self, " DIA_Edda_Statue_15_02 " );	// No thanks.
	B_GiveInvItems(other,self,ItMi_InnosStatue,1);
	MIS_EddaStatue = LOG_Success;
	Log_SetTopicStatus(TOPIC_EddaStatue,LOG_Success);
	B_LogEntry(TOPIC_EddaStatue, " I brought a statue of Innos to Edda. " );
};

instance DIA_EDDA_UHA_SBORNAY (C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_EDDA_UHA_SBORNAY_condition;
	information = DIA_EDDA_UHA_SBORNAY_info;
	permanent = FALSE;
	description = " Can you weld a prefabricated fish soup? " ;
};

func int DIA_EDDA_UHA_SBORNAY_condition()
{
	if ( Npc_KnowsInfo ( other , DAY_ALREADY_Hello ) && ( MY_FARIM_QUEST  >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_EDDA_UHA_SBORNAY_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_EDDA_UHA_SBORNAY_01_00 " );	// Can you weld a prefabricated fish soup?
	AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_01_01 " );	// Of course. But she has a rather complex structure.
	AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_01_02 " );	// If you get all the ingredients I need, you'll have a prefabricated fish soup.
	AI_Output(other,self, " DIA_EDDA_UHA_SBORNAY_01_03 " );	// What exactly do you need?
	AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_01_04 " );	// Hmmm... (thoughtfully) Remember! First I need fish - I think a dozen is enough.
	AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_01_05 " );	// Next, you'll need cheese, five seraphis plants, red peppers, and, most importantly, rum!
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_06");	//Ром?!
	AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_01_07 " );	// Yes, only him! And no schnapps, unless, of course, you want to get an ear, and not some kind of slop.
	AI_Output(other,self, " DIA_EDDA_UHA_SBORNAY_01_08 " );	// Okay, I got it.
	EddaCanMakeUhaSborka = TRUE;
	; _ _ _ _ _ _
};


instance DIA_EDDA_UHA_SBORNAY_Done (C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_EDDA_UHA_SBORNAY_Done_condition;
	information = DIA_EDDA_UHA_SBORNAY_Done_info;
	permanent = TRUE;
	description = " I brought everything you asked for. " ;
};

func int DIA_EDDA_UHA_SBORNAY_Done_condition()
{
	if((EddaCanMakeUhaSborka == TRUE) && (EddaCookFarim == FALSE) && (Npc_HasItems(other,ItFo_Addon_Pfeffer_01) >= 1) && (Npc_HasItems(other,ItFo_Fish) >= 10) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItPl_Blueplant) >= 5) && (Npc_HasItems(other,ItFo_Addon_Rum) >= 1))
	{
		return TRUE;
	};
};

func void DIA_EDDA_UHA_SBORNAY_Done_info()
{
	AI_Output(other,self, " DIA_EDDA_UHA_SBORNAY_Done_01_00 " );	// I brought everything you asked for.
	AI_Output(other,self, " DIA_EDDA_UHA_SBORNAY_Done_01_01 " );	// Now you're going to cook a prefabricated fish soup for me?

 	if (Wld_IsTime( 8 , 0 , 13 , 0 ) || Wld_IsTime( 15 , 0 , 20 , 0 ) )
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_02 " );	// Of course, as promised. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Addon_Pfeffer_01,1);
		Npc_RemoveInvItems(other,ItFo_Fish,10);
		Npc_RemoveInvItems(other,ItFo_Cheese,1);
		Npc_RemoveInvItems(other,ItPl_Blueplant,5);
		Npc_RemoveInvItems(other,ItFo_Addon_Rum,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_03 " );	// Great! And the rum is here, my dear.
		B_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_04 " );	// Well, that's it... (enough) Now you'll definitely get a real combined ear!
		AI_Output(other,self, " DIA_EDDA_UHA_SBORNAY_Done_01_05 " );	// Hey! You drank the whole bottle of rum!
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_06 " );	// And you thought that I would warm him in my hands?
		AI_Output(other,self, " DIA_EDDA_UHA_SBORNAY_Done_01_07 " );	// But what about the ear? You said you needed it to cook it!
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_08 " );	// Well, yes, that's right! And now I just used it for its intended purpose.
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_09 " );	// And by the way, while you were talking here, your ear was already cooked.
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_10 " );	// Here, hold her! I hope, you like it.
		B_GiveInvItems(self,other,itfo_schildkroetesoup_sborka,1);
		B_LogEntry( TOPIC_ADDON_FARIMFISH , " Edda cooked a fish soup for me. " );
		EddaCookFarim = TRUE;
	}
 	else  if (Wld_IsTime( 13 , 0 , 15 , 0 ))
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_EDDA_UHA_SBORNAY_Done_01_11 " );	// It's already night in the yard! Come tomorrow.
		AI_StopProcessInfos(self);
	};
};

instance DIA_EDDA_ASKFORDT (C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = dia_edda_askfordt_condition;
	information = dia_edda_askfordt_info;
	permanent = FALSE;
	description = " Would you like to work for me? " ;
};

func int dia_edda_askfordt_condition()
{
	if((HURRAYICANHIRE == TRUE) && (MIS_EddaStatue == LOG_Success) && (EddaNeed == TRUE))
	{
		return TRUE;
	};
};

func void dia_edda_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Edda_AskforDT_15_00 " );	// Would you like to work for me?
	AI_Output(self,other, " DIA_Edda_AskforDT_17_01 " );	// What do you mean?!
	AI_Output(other,self, " DIA_Edda_AskforDT_17_02 " );	// I need someone who knows how to cook. There are a lot of hungry guys in my camp, and there is no one to cook food for them.
	AI_Output(other,self, " DIA_Edda_AskforDT_17_03 " );	// So I thought maybe you could help me with this.
	AI_Output(self,other, " DIA_Edda_AskforDT_17_04 " );	// Are you suggesting that I become a cook in your camp? Hmmm...
	AI_Output(self,other, " DIA_Edda_AskforDT_17_05 " );	// Although, why not. Eventually, life in this part of town became almost unbearable. And I would gladly trade it for something else.
	AI_Output(other,self, " DIA_Edda_AskforDT_17_06 " );	// So you agree?
	AI_Output(self,other, " DIA_Edda_AskforDT_17_07 " );	// It turns out that it is.
	AI_Output(self,other, " DIA_Edda_AskforDT_17_08 " );	// But I immediately warn you that if one of your guys gets into me with their nonsense, then I'm not responsible for myself!
	AI_Output(other,self, " DIA_Edda_AskforDT_17_09 " );	// Don't worry about this. I have everything under control.
	AI_Output(self,other, " DIA_Edda_AskforDT_17_10 " );	// I really hope so! So, where do you say your camp is?
	AI_Output(other,self, " DIA_Edda_AskforDT_17_11 " );	// Not far from Onar's farm, in the old tower. It's hard to miss her!
	AI_Output(self,other, " DIA_Edda_AskforDT_17_12 " );	// Okay, then I guess I'll go pack my things.
	AI_Output(other,self, " DIA_Edda_AskforDT_17_13 " );	// Wait! Let's at least start by discussing your salary.
	AI_Output(self,other, " DIA_Edda_AskforDT_17_14 " );	// I don't need anything but a roof over my head and the opportunity to do what I love most in the world.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_15");	//Это чем?
	AI_Output(self,other, " DIA_Edda_AskforDT_17_16 " );	// Like what?! Prepare, of course.
	AI_Output(other,self, " DIA_Edda_AskforDT_17_17 " );	// Umm... Then at least let me walk you to the camp? The road there is quite dangerous.
	AI_Output(self,other, " DIA_Edda_AskforDT_17_18 " );	// Don't worry about me. I can manage myself.
	AI_Output(other,self, " DIA_Edda_AskforDT_17_19 " );	// Well, if so... Then I'll see you at the camp. The password to enter there is the phrase "Dragon Treasures". Remember?
	AI_Output(self,other, " DIA_Edda_AskforDT_17_20 " );	// Of course. See you!
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Edda will now run the kitchen at my camp. The guys will love her tasty and rich stews! " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	EDDARECRUITEDDT = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_EDDA_INTOWER(C_Info)
{
	npc = VLK_471_Edda;
	nr = 22;
	condition = dia_edda_intower_condition;
	information = dia_edda_intower_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};

func int dia_edda_intower_condition()
{
	if (( EDDARECRUITEDDT  ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ) && ( Npc_GetDistToWP ( self , " NW_CASTLEMINE_TOWER_01 " ) <  5000 )) ;
	{
		return TRUE;
	};
};

func void dia_edda_intower_info()
{
	AI_Output(other,self, " DIA_Edda_InTower_OrcKap_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Edda_InTower_OrcKap_01_01 " );	// As you can see! I have nothing to complain about.
};

instance DIA_EDDA_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_471_Edda;
	nr = 22;
	condition = dia_edda_intower_orckap_condition;
	information = dia_edda_intower_orckap_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int dia_edda_intower_orckap_condition()
{
	if((EDDARECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_edda_intower_orckap_info()
{
	AI_Output(other,self, " DIA_Edda_InTower_OrcKap_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Edda_InTower_OrcKap_01_01 " );	// Yes, and only thanks to you! If it wasn't for you, I wouldn't be alive...
};
