

instance DIA_SNAF_NW_EXIT(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 999;
	condition = dia_snaf_nw_exit_condition;
	information = dia_snaf_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_snaf_nw_exit_condition()
{
	return TRUE;
};

func void dia_snaf_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SNAF_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 900;
	condition = dia_snaf_nw_pickpocket_condition;
	information = dia_snaf_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_snaf_nw_pickpocket_condition()
{
	return  C_Robbery ( 75 , 150 );
};

func void dia_snaf_nw_pickpocket_info()
{
	Info_ClearChoices(dia_snaf_nw_pickpocket);
	Info_AddChoice(dia_snaf_nw_pickpocket,Dialog_Back,dia_snaf_nw_pickpocket_back);
	Info_AddChoice(dia_snaf_nw_pickpocket,DIALOG_PICKPOCKET,dia_snaf_nw_pickpocket_doit);
};

func void dia_snaf_nw_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_snaf_nw_pickpocket);
};

func void dia_snaf_nw_pickpocket_back()
{
	Info_ClearChoices(dia_snaf_nw_pickpocket);
};


instance DIA_SNAF_NW_HI (C_Info) .
{
	npc = vlk_6023_snaf;
	nr = 1;
	condition = dia_snaf_nw_hi_condition;
	information = dia_snaf_nw_hi_info;
	important = TRUE;
};


func int dia_snaf_nw_hi_condition()
{
	return TRUE;
};

func void dia_snaf_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_00 " );	// Well, well. Who do we have here?
	AI_Output(other,self, " DIA_Snaf_NW_Hi_01_01 " );	// Snaf, is that you?
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_02 " );	// In the flesh! Surprised?
	AI_Output(other,self, " DIA_Snaf_NW_Hi_01_03 " );	// Actually, I didn't expect to meet you here.
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_04 " );	// Well it's good to see you.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Snaf_NW_Hi_01_05 " );	// A Fire Mage! Well, who would have thought?
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Snaf_NW_Hi_01_06 " );	// A Paladin of the King! Who would have thought?
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Snaf_NW_Hi_01_07 " );	// A Mercenary! Well, seems like you all right.
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Snaf_NW_Hi_01_0A " );	// A Water Mage! Well, who would have thought...
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Snaf_NW_Hi_01_0B " );	// Um... a Necromancer eh? Hehe how... nice...
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Snaf_NW_Hi_01_0C " );	// A Swamp cultist? Ok I guess.
	};
	AI_Output(other,self, " DIA_Snaf_NW_Hi_01_08 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_09 " );	// What, don't you see? I work here. (laughs)
	AI_Output(other,self, " DIA_Snaf_NW_Hi_01_10 " );	// Cardiff took you in?
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_11 " );	// I shared one of my best recipes with him - that was enough to get this job.
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_12 " );	// And I'm not complaining. Just my profile. Yes, and Cardiff has less trouble.
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_13 " );	// Looks like he doesn't really regret taking me in.
	AI_Output(other,self, " DIA_Snaf_NW_Hi_01_14 " );	// Yes, you're doing well.
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_15 " );	// Of course. Okay, man - I still have a lot to do, and I don't have much time for idle chatter. Even with an old friend!
	AI_Output(other,self, " DIA_Snaf_NW_Hi_01_16 " );	// Okay, I'll see you later.
	AI_Output(self,other, " DIA_Snaf_NW_Hi_01_17 " );	// See you.
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_18");	// Bye!
};

instance DIA_Snaf_NW_Booze(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 3;
	condition = DIA_Snaf_NW_Booze_Condition;
	information = DIA_Snaf_NW_Booze_Info;
	permanent = FALSE;
	description = " Here's your moonshine, buddy. " ;
};

func int DIA_Snaf_NW_Booze_Condition()
{
	if((Npc_HasItems(other,ItFo_Addon_LousHammer) >= 1) && (MIS_SnafHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Snaf_NW_Booze_Info()
{
	B_GivePlayerXP(XP_Addon_Loushammer);
	AI_Output(other,self, " DIA_Addon_Snaf_Booze_15_00 " );	// Here's your moonshine, buddy.
	B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
	AI_Output(self,other, " DIA_Addon_Snaf_Booze_01_01 " );	// Fine, let me make the sauce.
	AI_Output(self,other, " DIA_Addon_Snaf_Booze_01_02 " );	// Here, it's done! You can try right now. There will be more strength in the little hands, no doubt!
	B_GiveInvItems(self,other,ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_SUCCESS);
	B_LogEntry(Topic_Addon_Hammer, " I brought moonshine to Snafu. " );
};

instance DIA_SNAF_NW_CITY(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 2;
	condition = dia_snaf_nw_city_condition;
	information = dia_snaf_nw_city_info;
	permanent = TRUE;
	description = " Anything new? " ;
};

func int dia_snaf_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_snaf_nw_hi))
	{
		return TRUE;
	};
};

func void dia_snaf_nw_city_info()
{
	AI_Output(other,self, " DIA_Snaf_NW_City_01_00 " );	// Anything new?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Snaf_NW_City_01_01 " );	// No, nothing like that. Well, apart from the fact that bandits are now accepted as Firebenders... (laughs)
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Snaf_NW_City_01_02 " );	// No, nothing like that. Well, apart from the fact that bandits are now being taken as paladins... (laughs)
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Snaf_NW_City_01_03 " );	// No, nothing like that. Well, apart from the fact that bandits are now being hired as mercenaries... (laughs)
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Snaf_NW_City_01_04 " );	// No, nothing like that. Well, apart from the fact that bandits are now accepted as Waterbenders... (laughs)
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Snaf_NW_City_01_05 " );	// No, nothing like that. Well, apart from the fact that bandits are now accepted as dark magicians ... (laughs)
	}
	else
	{
		AI_Output(self,other, " DIA_Snaf_NW_City_01_06 " );	// No, nothing that might interest you.
	};
};

instance DIA_Addon_Snaf_NW_TeachCookDone(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_NW_TeachCookDone_Condition;
	information = DIA_Addon_Snaf_NW_TeachCookDone_Info;
	permanent = TRUE;
	description = " Teach me how to cook chowder. " ;
};

func int DIA_Addon_Snaf_NW_TeachCookDone_Condition()
{
	if((SnafTeachCook == TRUE) && ((Snaf_Meal_01 == FALSE) || (Snaf_Meal_02 == FALSE) || (Snaf_Meal_03 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_TeachCookDone_01_00 " );	// Teach me how to cook stews.
	AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_01_01 " );	// Good! Where do we start?
	Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,Dialog_Back,DIA_Addon_Snaf_NW_TeachCookDone_back);

	if(Snaf_Meal_01 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone, " Black Mushroom Chowder (Price: 500 coins) " ,DIA_Addon_Snaf_NW_TeachCookDone_BlackMeal);
	};
	if(Snaf_Meal_02 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone, " Seasoned Mushroom Chowder (Price: 750 coins) " ,DIA_Addon_Snaf_NW_TeachCookDone_HotMeal);
	};
	if(Snaf_Meal_03 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone, " Cost (price: 250 minutes) " ,DIA_Addon_Snaf_NW_TeachCookDone_MeatMeal);
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
};

func void DIA_Addon_Snaf_NW_TeachCookDone_BlackMeal()
{
	AI_Output(other,self, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_00 " );	// Black mushroom soup.

	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_01 " );	// There is nothing easier. To start, you will need about fifty dark mushrooms.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_02 " );	// Put them in a vat of water and boil until the water turns black.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_03 " );	// Then add a leaf of fire grass. This will take the bitterness out of the soup itself!
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_04");	//Вот и все.
		AI_Print( " Learned the recipe for cooking food - 'Black Mushroom Stew' " );
		B_LogEntry( TOPIC_COOK , " Now I can cook black mushroom stew. For this I need fifty dark mushrooms and a leaf of fire grass. " );
		Snd_Play("LevelUP");
		Snaf_Meal_01 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_05 " );	// Are you taking me for a fool?
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_06 " );	// I won't teach you anything until I see the gold.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_HotMeal()
{
	AI_Output(other,self, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_00 " );	// Materaya mushroom soup.

	if(Npc_HasItems(hero,ItMi_Gold) >= 750)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,750);
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_01 " );	// To make the stew rich, the main thing is not to spare mushrooms for it.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_02 " );	// Put fifty pieces in a cauldron, add fireroot for a spicy kick, and slowly boil it all in the cauldron.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_03 " );	// In less than half an hour, the stew will be ready.
		AI_Print( " Learned the recipe for cooking food - 'Mushroom Chowder' " );
		B_LogEntry( TOPIC_COOK , " Now I can cook seasoned mushroom stew. For this I will need fifty meat mushrooms and a fire root. " );
		Snd_Play("LevelUP");
		Snaf_Meal_02 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_04 " );	// Are you taking me for a fool?
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_05 " );	// I won't teach you anything until I see the gold.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};


func void DIA_Addon_Snaf_NW_TeachCookDone_MeatMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_00");	//Мясное рагу.

	if(Npc_HasItems(hero,ItMi_Gold) >= 250)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,250);
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_01 " );	// This is my own recipe. (proudly) Nothing more!
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_02 " );	// Just a couple of meat mushrooms and beetle meat.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_03 " );	// You throw everything into the cauldron, boil it - and you get the most delicious dish I have ever tasted.
		AI_Print( " Recipe for 'Meat Stew' has been learned " );
		B_LogEntry( TOPIC_COOK , " Now I know how to cook meat stew. For this I need a couple of dark mushrooms and beetle meat. " );
		Snd_Play("LevelUP");
		Snaf_Meal_03 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_04 " );	// Are you taking me for a fool?
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_05 " );	// I won't teach you anything until I see the gold.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};
