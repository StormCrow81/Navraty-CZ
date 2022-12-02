

instance DIA_Gerold_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_EXIT_Condition;
	information = DIA_Gerold_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_EXIT_Condition()
{
	if (chapter <  4 )
	{
		return TRUE;
	};
};

func void DIA_Gerold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_Hello (C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Hallo_Condition;
	information = DIA_Gerold_Hello_Info;
	permanent = FALSE;
	description = " What are you guarding? " ;
};


func int DIA_Gerold_Hallo_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Gerold_Hello_Info()
{
	AI_Output(other,self, " DIA_Gerold_Hallo_15_00 " );	// What are you guarding?
	AI_Output(self,other, " DIA_Gerold_Hallo_12_01 " );	// Prisoners.
	AI_Output(other,self, " DIA_Gerold_Hallo_15_02 " );	// Who's there?
	AI_Output(self,other, " DIA_Gerold_Hallo_12_03 " );	// Several convicts and a mercenary Gorn. Serious guy - strong as a bull.
	AI_Output(self,other, " DIA_Gerold_Hallo_12_04 " );	// Four people barely pushed him there.
};


instances of DIA_Gerold_Jail (C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Jail_Condition;
	information = DIA_Gerold_Jail_Info;
	permanent = FALSE;
	description = " Will you let me into the dungeon? " ;
};


func int DIA_Gerold_Jail_Condition()
{
	if ((Capital ==  2 ) && Npc_KnowsInfo(other, DIA_Gerold_Hello) && (Garond_Kerkerauf ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Jail_Info()
{
	AI_Output(other,self, " DIA_Gerold_Jail_15_00 " );	// Will you let me into the dungeon?
	AI_Output(self,other, " DIA_Gerold_Jail_12_01 " );	// No. NO ONE can enter the dungeon. This applies to EVERYONE. You, Milten and everyone else.
	AI_Output(self,other, " DIA_Gerold_Jail_12_02 " );	// This is not a tavern where you can go in and out as you please. Remember this.
	KnowsAboutGorn = TRUE;
};


instance DIA_Gerold_Ausnahme (C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Exception_Condition;
	information = DIA_Gerold_Exception_Info;
	permanent = FALSE;
	description = " Could you make an exception for me? " ;
};


func int DIA_Gerold_Exception_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gerold_Jail ) && ( Capital ==  2 ) && ( Garond_Kerkerauf ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Ausnahme_Info()
{
	AI_Output(other,self, " DIA_Gerold_Ausnahme_15_00 " );	// Could you make an exception for me?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//Нет.
};


instance DIA_Gerold_Gold(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Gold_Condition;
	information = DIA_Gerold_Gold_Info;
	permanent = FALSE;
	description = " What if I pay in gold? " ;
};


func int DIA_Gerold_Gold_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gerold_Ausnahme ) && ( Capital ==  2 ) && ( Garond_Kerkerauf ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Gold_Info()
{
	AI_Output(other,self, " DIA_Gerold_Gold_15_00 " );	// What if I pay in gold?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//Хммм...(задумчиво)
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//Нет!
};


instance DIA_Gerold_Deal(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Deal_Condition;
	information = DIA_Gerold_Deal_Info;
	permanent = FALSE;
	description = " I have a note for one of the prisoners. " ;
};


func int DIA_Gerold_Deal_Condition()
{
	if ((MIS_RescueGorn == LOG_Running) && (Npc_HasItems(other,ItWr_LetterForGorn_MIS) >=  1 ) && (Chapter ==  2 ) && (Garond_Kerkerauf ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Gerold_Deal_Info()
{
	AI_Output(other,self, " DIA_Gerold_Deal_15_00 " );	// I have a note for one of the prisoners. Can you pass it on?
	AI_Output(self,other, " DIA_Gerold_Deal_12_01 " );	// Hmmm...(thoughtfully) In principle, I see no obstacles to this. Who is this note for?
	AI_Output(other,self, " DIA_Gerold_Deal_15_02 " );	// For Gorn.
	AI_Output(self,other, " DIA_Gerold_Deal_12_03 " );	// This is a very important prisoner. I don't think Garond will agree. But if it's so important to you, we can always agree.
	AI_Output(other,self, " DIA_Gerold_Deal_15_04 " );	// What do you want for this?
	AI_Output(self,other, " DIA_Gerold_Deal_12_05 " );	// Our rations have become very scarce lately. I want normal food.
	AI_Output(self,other, " DIA_Gerold_Deal_12_06 " );	// Bring me sausages and a loaf of fresh bread - and some sweet honey.
	AI_Output(self,other, " DIA_Gerold_Deal_12_07 " );	// A bottle of wine to wash it all down. Yes, that should be enough. I believe you can get it all. So come back when you find the groceries.
	B_LogEntry(TOPIC_RescueGorn, " If I bring Herold sausage, bread, wine and honey, he will give the note to the Gorn. " );
};


instance DIA_Gerold_Stuff(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Stuff_Condition;
	information = DIA_Gerold_Stuff_Info;
	permanent = TRUE;
	description = " I brought you something. " ;
};


var int DIA_Gerold_Stuff_permanent;

func int DIA_Gerold_Stuff_Condition()
{
	if ((Npc_HasItems(other,ItWr_LetterForGorn_MIS) >=  1 ) && Npc_KnowsInfo(other,DIA_Gerold_Deal) && (Capital ==  2 ) && (DIA_Gerold_Stuff_permanent ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Gerold_Stuff_Info()
{
	AI_Output(other,self, " DIA_Gerold_Stuff_15_00 " );	// I brought you something. Here's the food, just like you asked.

	if((Npc_HasItems(other,ItFo_Honey) >= 1) && (Npc_HasItems(other,ItFo_Bread) >= 1) && (Npc_HasItems(other,ItFo_Wine) >= 1) && (Npc_HasItems(other,ItFo_Sausage) >= 1))
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Honey,1);
		Npc_RemoveInvItems(other,ItFo_Bread,1);
		Npc_RemoveInvItems(other,ItFo_Wine,1);
		Npc_RemoveInvItems(other,ItFo_Sausage,1);
		AI_Output(self,other, " DIA_Gerold_Stuff_12_01 " );	// Okay, let me see. Do you have a note with you?
		AI_Output(other,self, " DIA_Gerold_Stuff_15_02 " );	// Yes, here. Don't forget, it's for Gorn.
		AI_Output(self,other, " DIA_Gerold_Stuff_12_03 " );	// Come in tomorrow, he'll have it by now.
		B_GiveInvItems(other,self,ItWr_LetterForGorn_MIS,1);
		DayContactGorn = Wld_GetDay();
		DIA_Gerold_Stuff_permanent = TRUE;
		B_LogEntry(TOPIC_RescueGorn, " Herald got what he wanted and will deliver the note. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Gerold_Stuff_12_04 " );	// Come in when you have what I asked for.
	};
};


instance DIA_Gerold_Answer (C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Answer_Condition;
	information = DIA_Gerold_Answer_Info;
	permanent = TRUE;
	description = " Gorn received a note? " ;
};


var int DIA_Gerold_Answer_permanent;

func int DIA_Gerold_Answer_Condition()
{
	if ((DIA_Gerold_Stuff_permanent ==  TRUE ) && (Chapter ==  2 ) && (DIA_Gerold_Antwort_permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Answer_Info()
{
	AI_Output(other,self, " DIA_Gerold_Antwort_15_00 " );	// Gorn got the note?
	if(DayContactGorn < Wld_GetDay())
	{
		AI_Output(self,other, " DIA_Gerold_Antwort_12_01 " );	// Yes, and I have to give you his words:
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//И?
		AI_Output(self,other, " DIA_Gerold_Antwort_12_03 " );	// This is at the south gate.
		AI_Output(other,self, " DIA_Gerold_Antwort_15_04 " );	// Did he say anything else?
		AI_Output(self,other, " DIA_Gerold_Antwort_12_05 " );	// No. I have no idea what that means. Do you know?
		AI_Output(other,self, " DIA_Gerold_Antwort_15_06 " );	// Possibly. But you shouldn't strain your brains too much about it.
		AI_Output(self,other, " DIA_Gerold_Antwort_12_07 " );	// Yes, you might be right.
		GornsTreasure = TRUE;
		DIA_Gerold_Answer_permanent = TRUE ;
		B_LogEntry(TOPIC_RescueGorn, " The bugle says his gold is at the south gate. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Gerold_GornsAnswer_12_08 " );	// Not yet. Come in later.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_SetGornFree(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_SetGornFree_Condition;
	information = DIA_Gerold_SetGornFree_Info;
	permanent = FALSE;
	description = " Release Upper. " ;
};


func int DIA_Gerold_SetGornFree_Condition()
{
	if ((Garond_Kerkerauf ==  TRUE ) && (Chapter ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_Gerold_SetGornFree_Info()
{
	AI_Output(other,self, " DIA_Gerold_SetGornFree_15_00 " );	// Free Gorn. This is an order from Commander Garond.
	AI_Output(self,other, " DIA_Gerold_SetGornFree_12_01 " );	// I've already been told about this. Here is the key, you can enter there.
	CreateInvItems(self,ItKe_PrisonKey_MIS,1);
	B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	B_LogEntry(TOPIC_RescueGorn, " The Herald gave me the key to the prison. " );
};


instance DIA_Gerold_Perm(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 900;
	condition = DIA_Gerold_Perm_Condition;
	information = DIA_Gerold_Perm_Info;
	permanent = TRUE;
	description = " Do you ever sleep? " ;
};


func int DIA_Gerold_Perm_Condition()
{
	if ((Capital <  4 ) && Npc_KnowsInfo(other,DIA_Gerold_Gold)) .
	{
		return TRUE;
	};
};

func void DIA_Gerold_Perm_Info()
{
	AI_Output(other,self, " DIA_Gerold_Perm_15_00 " );	// Do you ever sleep?
	AI_Output(self,other, " DIA_Gerold_Perm_12_01 " );	// No. Innos himself gives me the strength to never sleep on duty.
};


instance DIA_Gerold_KAP4_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_KAP4_EXIT_Condition;
	information = DIA_Gerold_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grolold_KAP4_ALLESRUHIG (C_Info)
{
	npc = PAL_261_Gerold;
	nr = 30;
	condition = DIA_Rolled_KAP4_ALLESRUHIG_Condition;
	information = DIA_Rolled_KAP4_ALLESRUHIG_Info;
	description = " Is everything quiet? " ;
};


func int DIA_Rolled_KAP4_ALLESRUHIG_Condition()
{
	if (Chapter >=  4 )
	{
		return TRUE;
	};
};

func void DIA_Rolled_KAP4_ALLESRUHIG_Info()
{
	AI_Output(other,self, " DIA_Gerold_KAP4_ALLESRUHIG_15_00 " );	// Is everything quiet?
	AI_Output(self,other, " DIA_Rolled_KAP4_ALLESRUHIG_12_01 " );	// Тихо, да.
	AI_Output(other,self, " DIA_Gerold_KAP4_ALLESRUHIG_15_02 " );	// Но?
	AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_12_03 " );	// My belly button is already stuck to my spine. Garond cut our rations again.
	AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_12_04 " );	// If I don't find decent food somewhere, I'll go and bite off a piece of Garond's fat ass.
	Info_ClearChoices(DIA_Rolled_KAP4_ALLESRUHIG);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG, " These are not my problems. " ,DIA_Gerold_KAP4_ALLESRUHIG_Nein);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG, " Maybe I can treat you. " ,DIA_Gerold_KAP4_ALLESRUHIG_geben);
};

func void DIA_Gerold_KAP4_ALLESQUIHIG_giving()
{
	AI_Output(other,self, " DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00 " );	// Maybe I can treat you.
	AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01 " );	// Are you crazy? Just not here! If anyone sees this, I'll make a bunch of new friends right away, if you know what I mean.
	if (Wld_IsTime( 23 , 10 , 8 , 0 ) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02 " );	// You will find me at the temple when everyone is in bed.
	}
	else
	{
		AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03 " );	// Hurry, let's go to the temple before the others crawl out of their holes. I can't wait until tomorrow.
	};
	AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04 " );	// I think there is no one in the temple at this time. I will wait for you there.
	AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05 " );	// But make sure it's not a stale crust of bread or some raw piece of meat, you understand?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GeroldGiveFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood,LOG_Running);
	B_LogEntry(TOPIC_GeroldGiveFood, " Garond has cut his rations again. I'd better get Gerold something to eat before he does something stupid out of hunger. I should meet him at the wizards' house when everyone is asleep. " );
	MIS_GeroldGiveFood = LOG_Running;
};

func void DIA_Gerold_KAP4_ALLESQUIT_No()
{
	AI_Output(other,self, " DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00 " );	// These are not my problems.
	AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01 " );	// It's easy for you to talk. Garond will certainly not cut your rations.
	AI_Output(self,other, " DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02 " );	// Even though he won't admit it, he's terrified and sees you as his only salvation.
	AI_StopProcessInfos(self);
};


var int Gerold_FoodCounter;

instance DIA_Gerold_FOOD(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 31;
	condition = DIA_Gerold_FOOD_Condition;
	information = DIA_Gerold_FOOD_Info;
	important = TRUE;
};


func int DIA_Gerold_FOOD_Condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Gerold_MoreFood()
{
	Info_ClearChoices(DIA_Gerold_FOOD);
	if(Gerold_FoodCounter > 8)
	{
		AI_Output(self,other, " DIA_Gerold_MoreFood_12_00 " );	// That's enough. It's enough! Now I won't be hungry for a while.
		AI_Output(self,other, " DIA_Gerold_MoreFood_12_01 " );	// Here's my gold. I can't buy anything with it here anyway, but you might find it useful.
		AI_Output(self,other, " DIA_Gerold_MoreFood_12_02 " );	// And now I'd better go before anyone sees us.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP(XP_GeroldGiveFood);
		CreateInvItems(self,ItMi_Gold,250);
		B_GiveInvItems(self,other,ItMi_Gold,250);
	}
	else
	{
		if(Gerold_FoodCounter == 0)
		{
			Info_AddChoice(DIA_Gerold_FOOD, " I don't have anything right now. " ,DIA_Gerold_FOOD_nichts);
		}
		else
		{
			Info_AddChoice(DIA_Gerold_FOOD, " That's all I have. " ,DIA_Gerold_FOOD_kaese_nichtmehr);
			if(Gerold_FoodCounter < 5)
			{
				AI_Output(self,other, " DIA_Gerold_MoreFood_12_03 " );	// Of course. Come here. Do you have any more?
			}
			else
			{
				AI_Output(self,other, " DIA_Gerold_MoreFood_12_04 " );	// Yes. More more!
			};
		};
		if(Npc_HasItems(other,ItFo_FishSoup) || Npc_HasItems(other,ItFo_Stew))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(Дать суп)",DIA_Gerold_FOOD_Suppe);
		};
		if(Npc_HasItems(other,ItFoMutton))
		{
			Info_AddChoice(DIA_Gerold_FOOD, " (Give Meat) " ,DIA_Gerold_FOOD_fleisch);
		};
		if(Npc_HasItems(other,ItFo_Bacon))
		{
			Info_AddChoice(DIA_Gerold_FOOD, " (Give ham) " ,DIA_Gerold_FOOD_schinken);
		};
		if(Npc_HasItems(other,ItFo_Cheese))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"Дать сыр)",DIA_Gerold_FOOD_kaese);
		};
		if(Npc_HasItems(other,ItFo_Sausage))
		{
			Info_AddChoice(DIA_Gerold_FOOD, " Give Sausage) " ,DIA_Gerold_FOOD_Wurst);
		};
		Gerold_FoodCounter = Gerold_FoodCounter +  1 ;
	};
};

func void DIA_Gerold_FOOD_Info()
{
	AI_Output(self,other, " DIA_Gerold_FOOD_12_00 " );	// There you are. And How? Do you have anything to eat?
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_nothing()
{
	AI_Output(other,self, " DIA_Gerold_FOOD_nichts_15_00 " );	// Now I have nothing.
	AI_Output(self,other, " DIA_Gerold_FOOD_nichts_12_01 " );	// First promise with three boxes, and then you want to deceive me?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Gerold_FOOD_kaese_nomore()
{
	var int XP_GeroldGiveFoodLow;
	var int divider;
	AI_Output(other,self, " DIA_Gerold_FOOD_kaese_nichtmehr_15_00 " );	// This is all I have.
	AI_Output(self,other, " DIA_Gerold_FOOD_kaese_nichtmehr_12_01 " );	// And do you think I'll believe it? Okay, it's still better than nothing. Here, take some gold for this.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(self,other, " DIA_Gerold_FOOD_kaese_nichtmehr_12_02 " );	// Good. Now I need to get back to my post.
	AI_StopProcessInfos(self);
	if(Gerold_FoodCounter < 4)
	{
		divider = 3 ;
	}
	else
	{
		divider = 2 ;
	};
	XP_GeroldGiveFoodLow = XP_GeroldGiveFood / divider;
	Npc_ExchangeRoutine(self,"Start");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	B_GivePlayerXP(XP_GeroldGiveFoodLow);
};

func void DIA_Gerold_FOOD_kaese()
{
	AI_Output(other,self, " DIA_Gerold_FOOD_kaese_15_00 " );	// How about a juicy piece of cheese?
	B_GiveInvItems(other,self,ItFo_Cheese,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Sausage()
{
	AI_Output(other,self, " DIA_Gerold_FOOD_Wurst_15_00 " );	// Piece of sausage?
	B_GiveInvItems(other,self,ItFo_Sausage,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_ham()
{
	AI_Output(other,self, " DIA_Gerold_FOOD_schinken_15_00 " );	// I can give you this ham.
	B_GiveInvItems(other,self,ItFo_Bacon,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_fleisch()
{
	AI_Output(other,self, " DIA_Gerold_FOOD_fleisch_15_00 " );	// Piece of meat?
	B_GiveInvItems(other,self,ItFoMutton,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Suppe()
{
	AI_Output(other,self, " DIA_Gerold_FOOD_Suppe_15_00 " );	// Good soup never hurt anyone, don't you think?
	if(B_GiveInvItems(other,self,ItFo_FishSoup,1))
	{
	}
	else
	{
		B_GiveInvItems(other,self,ItFo_Stew,1);
	};
	DIA_Gerold_MoreFood();
};


instance DIA_Gerold_PERM4(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 41;
	condition = DIA_Gerold_PERM4_Condition;
	information = DIA_Gerold_PERM4_Info;
	permanent = TRUE;
	description = " Still hungry? " ;
};


func int DIA_Gerold_PERM4_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Grold_KAP4_ALLESRUHIG))
	{
		return TRUE;
	};
};

func void DIA_Gerold_PERM4_Info()
{
	AI_Output(other,self, " DIA_Gerold_PERM4_15_00 " );	// Still hungry?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other, " DIA_Gerold_PERM4_12_01 " );	// If the orcs attack us again, even a full stomach won't help me.
	}
	else if(MIS_GeroldGiveFood == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Gerold_PERM4_12_02 " );	// You must be joking. Doesn't fit me anymore. Thanks again.
	}
	else if(MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
		AI_Output(self,other, " DIA_Gerold_PERM4_12_03 " );	// Yes. But still, thanks for the help.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Gerold_PERM4_12_04 " );	// It's all right, Master.
	}
	else
	{
		AI_Output(self,other, " DIA_Gerold_PERM4_12_05 " );	// Get lost!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_KAP5_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_KAP5_EXIT_Condition;
	information = DIA_Gerold_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_KAP6_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_KAP6_EXIT_Condition;
	information = DIA_Gerold_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_PICKPOCKET(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 900;
	condition = DIA_Gerold_PICKPOCKET_Condition;
	information = DIA_Gerold_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gerold_PICKPOCKET_Condition()
{
	return  C_Robbery ( 71 , 170 );
};

func void DIA_Gerold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
	Info_AddChoice(DIA_Gerold_PICKPOCKET,Dialog_Back,DIA_Gerold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gerold_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gerold_PICKPOCKET_DoIt);
};

func void DIA_Gerold_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
};

func void DIA_Gerold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
};

