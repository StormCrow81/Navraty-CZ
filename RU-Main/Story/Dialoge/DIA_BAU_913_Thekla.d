instance DIA_Thekla_EXIT(C_Info)
{
	npc = BAU_913_Thekla;
	No. = 999 ;
	condition = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thekla_EXIT_Info ()
{
	AI_StopProcessInfos(self);
};


instance DIA_Thekla_HALLO (C_Info)
{
	npc = BAU_913_Thekla;
	no. = 1 ;
	condition = DIA_Thekla_HALLO_Condition;
	information = DIA_Thekla_HALLO_Info;
	permanent = FALSE ;
	important = TRUE;
};


func int DIA_Thekla_HELLO_Condition()
{
	return TRUE;
};

func void DIA_Thekla_HELLO_Info()
{
	AI_Output (self, other, " DIA_Thekla_HALLO_17_00 " );	// What are you doing here in my kitchen?
};

instance DIA_Thekla_Lecker (C_Info)
{
	npc = BAU_913_Thekla;
	no. = 2 ;
	condition = DIA_Thekla_Lecker_Condition;
	information = DIA_Thekla_Lecker_Info;
	permanent = FALSE ;
	description = " How delicious you smell here! " ;
};

func int DIA_Thekla_Lecker_Condition ()
{
	return TRUE;
};

func void DIA_Thekla_Lecker_Info ()
{
	AI_Output (other, self, " DIA_Thekla_Lecker_15_00 " );	// It smells fantastic in here!
	AI_Output (self, other, " DIA_Thekla_Lecker_17_01 " );	// Don't suck up to me! I know your type! There are so many of you wandering around!
	AI_Output (self, other, " DIA_Thekla_Lecker_17_02 " );	// First you try to kiss my behind, and then when I need something from you, you dissapear!
};

instance DIA_Thekla_Baker (C_Info)
{
	npc = BAU_913_Thekla;
	No. = 3 ;
	condition = DIA_Thekla_Baker_Condition;
	information = DIA_Thekla_Baker_Info;
	permanent = FALSE ;
	description = " Is this your oven? " ;
};

func int DIA_Thekla_Baker_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Thekla_Lecker) == TRUE) && (BakerSee == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Baker_Info ()
{
	AI_Output (other, self, " DIA_Thekla_Baker_01_00 " );	// Is this your oven?
	AI_Output(self,other,"DIA_Thekla_Baker_01_01");	//Who else?
	AI_Output (other, self, " DIA_Thekla_Baker_01_02 " );	// And what do you cook in it?
	AI_Output (self, other, " DIA_Thekla_Baker_01_03 " );	// I usually bake bread and cakes. But you can also fry meat in it, if necessary.
	AI_Output (other, self, " DIA_Thekla_Baker_01_04 " );	// Can I use it?
	AI_Output (self, other, " DIA_Thekla_Baker_01_05 " );	// You can. But only if I'm sure you won't ruin it.
	AI_Output (other, self, " DIA_Thekla_Baker_01_06 " );	// And how can I convince you of this?
	AI_Output (self, other, " DIA_Thekla_Baker_01_07 " );	// Well, for example ... (thoughtfully) Tell me, can you bake pies?
	AI_Output (other, self, " DIA_Thekla_Baker_01_08 " );	// Unfortunately not.
	AI_Output (self, other, " DIA_Thekla_Baker_01_09 " );	// Here ... (smiling) When you learn, then I'll let you use it.
};

instance DIA_Thekla_BakerDo (C_Info)
{
	npc = BAU_913_Thekla;
	No. = 3 ;
	condition = DIA_Thekla_BakerDo_Condition;
	information = DIA_Thekla_BakerDo_Info;
	permanent = FALSE ;
	description = " Can you teach me how to bake pies? " ;
};

func int DIA_Thekla_BakerDo_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Baker) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_BakerDo_Info ()
{
	AI_Output (other, self, " DIA_Thekla_BakerDo_01_00 " );	// Can you teach me how to bake pies?
	AI_Output (self, other, " DIA_Thekla_BakerDo_01_01 " );	// Of course. But not for nothing. You will also need some culinary experience.
	TheklaTeachMe = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry ( TOPIC_COOK , " Tekla can teach me how to bake pies. " );
};

instance DIA_Thekla_TeachCookDone(C_Info)
{
	npc = BAU_913_Thekla;
	No. = 6 ;
	condition = DIA_Thekla_TeachCookDone_Condition;
	information = DIA_Thekla_TeachCookDone_Info;
	permanent = TRUE;
	description = " Teach me to bake pies. " ;
};

func int DIA_Thekla_TeachCookDone_Condition()
{
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		if((TheklaTeachMe == TRUE) && ((Thekla_Cake_01 == FALSE) || (Thekla_Cake_02 == FALSE) || (Thekla_Cake_03 == FALSE) || (Thekla_Cake_04 == FALSE) || (Thekla_Cake_05 == FALSE)))
		{
			return TRUE;
		};
	}
	else
	{
		if((TheklaTeachMe == TRUE) && ((Thekla_Cake_01 == FALSE) || (Thekla_Cake_02 == FALSE) || (Thekla_Cake_03 == FALSE) || (Thekla_Cake_04 == FALSE)))
		{
			return TRUE;
		};
	};
};

func void DIA_Thekla_TeachCookDone_Info()
{
	AI_Output (other, self, " DIA_Thekla_TeachCookDone_01_00 " );	// Teach me to bake pies.
	AI_Output (self, other, " DIA_Thekla_TeachCookDone_01_01 " );	// So ... (wiping his hands) What do you want to bake?
	Info_ClearChoices(DIA_Thekla_TeachCookDone);
	Info_AddChoice(DIA_Thekla_TeachCookDone,Dialog_Back,DIA_Thekla_TeachCookDone_back);

	if(Thekla_Cake_01 == FALSE)
	{
		Info_AddChoice (DIA_Thekla_TeachCookDone, " Apple Pie (Learning Points: 1, Price: 250 Coins) " , DIA_Thekla_TeachCookDone_Apple);
	};
	if((Thekla_Cake_01 == TRUE) && (Thekla_Cake_02 == FALSE))
	{
		Info_AddChoice (DIA_Thekla_TeachCookDone, " Meat Pie (Learning Points: 3, Price: 500 Coins) " , DIA_Thekla_TeachCookDone_Meat);
	};
	if((Thekla_Cake_01 == TRUE) && (Thekla_Cake_03 == FALSE))
	{
		Info_AddChoice (DIA_Thekla_TeachCookDone, " Mushroom Pie (Learning Points: 3, Cost: 750 Coins) " , DIA_Thekla_TeachCookDone_Mushroom);
	};
	if((Thekla_Cake_01 == TRUE) && (Thekla_Cake_04 == FALSE))
	{
		Info_AddChoice (DIA_Thekla_TeachCookDone, " Fish Pie (Learning Points: 3, Price: 1000 Coins) " , DIA_Thekla_TeachCookDone_Fish);
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		if((Thekla_Cake_01 == TRUE) && (Thekla_Cake_03 == TRUE) && (Thekla_Cake_05 == FALSE))
		{
			Info_AddChoice (DIA_Thekla_TeachCookDone, " Honey Pie (Learning Points: 5, Price: 1500 coins) " , DIA_Thekla_TeachCookDone_Honey);
		};
	};
};

func void DIA_Thekla_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Thekla_TeachCookDone);
};

func void DIA_Thekla_TeachCookDone_Apple()
{
	AI_Output (other, self, " DIA_Thekla_TeachCookDone_Apple_01_00 " );	// Teach me to bake an apple pie.

	if((Npc_HasItems(hero,ItMi_Gold) >= 250) && (hero.lp >= 1))
	{
		hero.lp = hero.lp - 1;
		Npc_RemoveInvItems(hero,ItMi_Gold,250);
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Apple_01_01 " );	// You will need twenty-five apples, five slices of bread, a piece of cheese, a seraphis, and a bottle of clean water.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Apple_01_02 " );	// You make puree from apples, knead it with bread, add grated cheese and season with seraphis.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Apple_01_03 " );	// You put everything in the oven, and in a few minutes the pie is ready!
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Apple_01_04");	//Thank you.
		AI_Print ( " Learned recipe for cooking - 'Apple Pie' " );
		B_LogEntry ( TOPIC_COOK , " Now I can make an apple pie. For this I need: twenty-five apples, five slices of bread, a piece of cheese, a seraphis and a bottle of clean water. " );
		Snd_Play("LevelUP");
		Thekla_Cake_01 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 250)
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Apple_01_05 " );	// Sorry, but I won't do this for free.
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Apple_01_06 " );	// Bring the gold first.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Apple_01_07 " );	// Sorry, but you don't have enough experience for this.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

func void DIA_Thekla_TeachCookDone_Meat()
{
	AI_Output (other, self, " DIA_Thekla_TeachCookDone_Meat_01_00 " );	// Teach me to bake a meat pie.

	if((Npc_HasItems(hero,ItMi_Gold) >= 500) && (hero.lp >= 3))
	{
		hero.lp = hero.lp - 3;
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Meat_01_01 " );	// You will need twenty-five pieces of raw meat, five pieces of bread, two bottles of milk, a bottle of schnapps, and two pieces of cheese.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Meat_01_02 " );	// You make minced milk from the meat, knead it with bread and add some schnapps for flavor.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Meat_01_03 " );	// Then you put everything in the oven, and in a few minutes the pie is ready.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Meat_01_04");	//Thank you.
		AI_Print ( " Meal recipe studied - 'Meat Pie' " );
		B_LogEntry ( TOPIC_COOK , " Now I can make a meat pie. For this I need: twenty-five pieces of raw meat, five pieces of bread, two bottles of milk, a bottle of schnapps and two pieces of cheese. " );
		Snd_Play("LevelUP");
		Thekla_Cake_02 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 500)
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Meat_01_05 " );	// Sorry, but I won't do this for free.
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Meat_01_06 " );	// Bring the gold first.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Meat_01_07 " );	// Sorry, but you don't have enough experience for this.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

func void DIA_Thekla_TeachCookDone_Mushroom()
{
	AI_Output (other, self, " DIA_Thekla_TeachCookDone_Mushroom_01_00 " );	// Teach me to bake a mushroom pie.

	if((Npc_HasItems(hero,ItMi_Gold) >= 750) && (hero.lp >= 3))
	{
		hero.lp = hero.lp - 3;
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Mushroom_01_01 " );	// You will need twenty-five meat mushrooms, five slices of bread, three slices of cheese, and a bottle of wine.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Mushroom_01_02 " );	// You make a mushroom paste, knead it with bread, roll it in cheese and add a little wine to disguise the harsh mushroom taste.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Mushroom_01_03 " );	// Then you put everything in the oven, and in a few minutes the pie is ready.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Mushroom_01_04");	//Thank you.
		AI_Print ( " Learned recipe for cooking - 'Mushroom Pie' " );
		B_LogEntry ( TOPIC_COOK , " Now I can make a mushroom pie. For this I need: twenty-five meat mushrooms, five slices of bread, three slices of cheese and a bottle of wine. " );
		Snd_Play("LevelUP");
		Thekla_Cake_03 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 750)
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Mushroom_01_05 " );	// Sorry, but I won't do this for free.
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Mushroom_01_06 " );	// Bring the gold first.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Mushroom_01_07 " );	// Sorry, but you don't have enough experience for this.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

func void DIA_Thekla_TeachCookDone_Fish()
{
	AI_Output (other, self, " DIA_Thekla_TeachCookDone_Fish_01_00 " );	// Teach me to bake a fish pie.

	if((Npc_HasItems(hero,ItMi_Gold) >= 1000) && (hero.lp >= 3))
	{
		hero.lp = hero.lp - 3;
		Npc_RemoveInvItems(hero,ItMi_Gold,1000);
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Fish_01_01 " );	 // You will need two dozen fish, five slices of bread, two seraphises and a bottle of schnapps.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Fish_01_02 " );	 // You make slices of fish, add pounded seraphis there, knead it with bread and season with schnapps.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Fish_01_03 " );	// Then you put everything in the oven, and in a few minutes the pie is ready.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Fish_01_04");	//Thank you.
		AI_Print ( " Learned recipe for cooking food - 'Fish Pie' " );
		B_LogEntry ( TOPIC_COOK , " Now I can make a fish pie. For this I need: two dozen fish, five slices of bread, two seraphises and a bottle of schnapps. " );
		Snd_Play("LevelUP");
		Thekla_Cake_04 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 1000)
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Fish_01_05 " );	// Sorry, but I won't do this for free.
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Fish_01_06 " );	// Bring the gold first.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Fish_01_07 " );	// Sorry, but you don't have enough experience for this.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

func void DIA_Thekla_TeachCookDone_Honey()
{
	AI_Output (other, self, " DIA_Thekla_TeachCookDone_Honey_01_00 " );	// Teach me to bake a honey cake.

	if((Npc_HasItems(hero,ItMi_Gold) >= 1500) && (hero.lp >= 5))
	{
		hero.lp = hero.lp - 5;
		Npc_RemoveInvItems(hero,ItMi_Gold,1500);
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Honey_01_01 " );	// You will need five pots of honey, five slices of bread, three slices of cheese, grapes, milk and a bottle of wine.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Honey_01_02 " );	// Knead milk bread with honey and cheese, add grapes and season with wine.
		AI_Output (self, other, " DIA_Thekla_TeachCookDone_Honey_01_03 " );	// Then you put everything in the oven, and in a few minutes the pie is ready.
		AI_Output(other,self,"DIA_Thekla_TeachCookDone_Honey_01_04");	//Thank you.
		AI_Print ( " Learned recipe for cooking - 'Honey Pie' " );
		B_LogEntry ( TOPIC_COOK , " Now I can make a honey cake. For this I need: five pots of honey, five slices of bread, three slices of cheese, grapes, milk and a bottle of wine. " );
		Snd_Play("LevelUP");
		Thekla_Cake_05 = TRUE;
		Thekla_Areed = TRUE;
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) < 1500)
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Honey_01_05 " );	// Sorry, but I won't do this for free.
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Honey_01_06 " );	// Bring the gold first.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		}
		else
		{
			AI_Output (self, other, " DIA_Thekla_TeachCookDone_Honey_01_07 " );	// Sorry, but you don't have enough experience for this.
			Info_ClearChoices(DIA_Thekla_TeachCookDone);
		};
	};
};

var int Thekla_GaveStew;

instance DIA_Thekla_Hunger (C_Info)
{
	npc = BAU_913_Thekla;
	No. = 3 ;
	condition = DIA_Thekla_Hunger_Condition;
	information = DIA_Thekla_Hunger_Info;
	permanent = FALSE ;
	description = " I'm hungry! " ;
};


func int DIA_Thekla_Hunger_Condition ()
{
	if(Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info ()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//I'm hungry!
	if(other.guild == GIL_NONE)
	{
		AI_Output (self, other, " DIA_Thekla_Hunger_17_01 " );	// I don't feed vagrants. I only feed those who work.
		AI_Output (self, other, " DIA_Thekla_Hunger_17_02 " );	// (contemptuously) And this rabble of mercenaries, of course.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Here's your food.
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output (self, other, " DIA_Thekla_Hunger_17_04 " );	// We don't serve the militia here.
	}
	else if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output (self, other, " DIA_Thekla_Hunger_17_05 " );	// How can I refuse a request to Innos's representative?
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output (self, other, " DIA_Thekla_Hunger_17_06 " );	// How can I refuse a request to Adanos' representative?
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_07");	//Here...(with trembling hands)
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output (self, other, " DIA_Thekla_Hunger_17_01 " );	// I don't feed vagrants. I only feed those who work.
	};
};


instance DIA_Thekla_Arbeit (C_Info)
{
	npc = BAU_913_Thekla;
	No. = 4 ;
	condition = DIA_Thekla_Arbeit_Condition;
	information = DIA_Thekla_Arbeit_Info;
	permanent = FALSE ;
	description = " I am looking for a job. " ;
};


func int DIA_Thekla_Arbeit_Condition ()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info ()
{
	AI_Output (other, self, " DIA_Thekla_Arbeit_15_00 " );	// I'm looking for a job ...
	AI_Output (self, other, " DIA_Thekla_Arbeit_17_01 " );	// Do you want to work here on the farm?
	AI_Output (self, other, " DIA_Thekla_Arbeit_17_02 " );	// Only Onar can give you a job. This farm is his, like the whole valley.
};


instance DIA_Thekla_WannaJoin(C_Info)
{
	npc = BAU_913_Thekla;
	No. = 5 ;
	condition = DIA_Thekla_WannaJoin_Condition;
	information = DIA_Thekla_WannaJoin_Info;
	permanent = FALSE ;
	description = " Actually, I was planning to join the mercenaries ... " ;
};


func int DIA_Thekla_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info()
{
	AI_Output (other, self, " DIA_Thekla_WannaJoin_15_00 " );	// Actually, I was planning to join the mercenaries ...
	AI_Output (self, other, " DIA_Thekla_WannaJoin_17_01 " );	// So you are also a criminal from the colony?
	AI_Output (self, other, " DIA_Thekla_WannaJoin_17_02 " );	// I could have guessed! Leave me alone! There is already enough of your kind around here!
};


instance DIA_Thekla_Schlafen (C_Info)
{
	npc = BAU_913_Thekla;
	No. = 6 ;
	condition = DIA_Thekla_Schlafen_Condition;
	information = DIA_Thekla_Schlafen_Info;
	permanent = FALSE ;
	description = " Where can I sleep here? " ;
};


func int DIA_Thekla_Schlafen_Condition ()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info ()
{
	AI_Output (other, self, " DIA_Thekla_Schlafen_15_00 " );	// Where can I sleep here?
	AI_Output (self, other, " DIA_Thekla_Schlafen_17_01 " );	// Don't even think about sleeping in my kitchen. Find yourself a place in the barn.
};


instance DIA_Thekla_Problem(C_Info)
{
	npc = BAU_913_Thekla;
	No. = 7 ;
	condition = DIA_Thekla_Problem_Condition;
	information = DIA_Thekla_Problem_Info;
	permanent = FALSE ;
	description = " Why don't you like mercenaries? " ;
};


func int DIA_Thekla_Problem_Condition()
{
	if((Kapitel <= 3) && Npc_KnowsInfo(other,DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info()
{
	AI_Output (other, self, " DIA_Thekla_Problem_15_00 " );	// Why don't you like mercenaries?
	AI_Output (self, other, " DIA_Thekla_Problem_17_01 " );	// Ah, these cretins get on my nerves! Especially Silvio and his fat buddy Bulko.
	AI_Output (self, other, " DIA_Thekla_Problem_17_02 " );	// Those two sit over there in the corner all day long and complicate my life.
	AI_Output (self, other, " DIA_Thekla_Problem_17_03 " );	// The soup is too hot for them, the meat is too tough, and so on ...
	if(other.guild == GIL_NONE)
	{
		AI_Output (other, self, " DIA_Thekla_Problem_15_04 " );	// Why don't you do anything about it?
		AI_Output (self, other, " DIA_Thekla_Problem_17_05 " );	// What can I do, Mr. Meat-pie-for-brains? Hit them with my rolling pin? They'll kill me!
	};
};


instance DIA_Thekla_Manieren (C_Info)
{
	npc = BAU_913_Thekla;
	No. = 7 ;
	condition = DIA_Thekla_Manieren_Condition;
	information = DIA_Thekla_Manieren_Info;
	permanent = FALSE ;
	description = " Do you want me to teach those two some manners? " ;
};


func int DIA_Thekla_Manieren_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Problem) && (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info()
{
	AI_Output (other, self, " DIA_Thekla_Manieren_15_00 " );	// Do you want me to teach those two some manners?
	AI_Output (self, other, " DIA_Thekla_Manieren_17_01 " );	// You better not mess with them. As far as I know, Silvio has magic armor. He cannot be defeated.
	AI_Output (other, self, " DIA_Thekla_Manieren_15_02 " );	// What about Bulko?
	AI_Output (self, other, " DIA_Thekla_Manieren_17_03 " );	// This guy is strong as a bull. He easily deals with everyone who tries to oppose him or Silvio.
};


instance DIA_Thekla_AfterFight(C_Info)
{
	npc = BAU_913_Thekla;
	No. = 7 ;
	condition = DIA_Thekla_AfterFight_Condition;
	information = DIA_Thekla_AfterFight_Info;
	permanent = FALSE ;
	important = TRUE;
};


func int DIA_Thekla_AfterFight_Condition()
{
	if((Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || ((Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (Kapitel <= 3)))
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info()
{
	if(Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, " DIA_Thekla_AfterFight_17_00 " );	// You really were able to beat the shit out of Bulko.
		AI_Output (self, other, " DIA_Thekla_AfterFight_17_01 " );	// You must be very tired from thrashing that fat pig.
	}
	else
	{
		AI_Output (self, other, " DIA_Thekla_AfterFight_17_02 " );	// Well, had enough?
		AI_Output (self, other, " DIA_Thekla_AfterFight_17_03 " );	// I warned you! Now do you understand what I mean?
		AI_Output (other, self, " DIA_Thekla_AfterFight_15_04 " );	// I'm glad I gave you a show.
		AI_Output (self, other, " DIA_Thekla_AfterFight_17_05 " );	// Don't sulk. You are far from the first one to be beaten by this bastard.
	};
	AI_Output (self, other, " DIA_Thekla_AfterFight_17_06 " );	// Here, eat a little. It will help you feel better.
	B_GiveInvItems(self,other,ItFo_XPStew,1);
	Thekla_GaveStew = TRUE;
};


instance DIA_Thekla_SagittaPackage (C_Info)
{
	npc = BAU_913_Thekla;
	No. = 4 ;
	condition = DIA_Thekla_SagittaPaket_Condition;
	information = DIA_Thekla_SagittaPackage_Info;
	permanent = TRUE;
	description = " Here is a package from Sagitta. " ;
};


func int DIA_Thekla_SagittaPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_TheklasPaket) && (MIS_Thekla_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info()
{
	B_GiveInvItems(other,self,ItMi_TheklasPaket,1);
	Npc_RemoveInvItems(self,ItMi_TheklasPaket,1);
	AI_Output (other, self, " DIA_Thekla_SagittaPaket_15_00 " );	// Here is the package from Sagitta.
	AI_Output (self, other, " DIA_Thekla_SagittaPaket_17_01 " );	// Thanks a lot! You at least mean something to us, unlike these other layabouts.
	MIS_Thekla_Paket = LOG_SUCCESS ;
	B_GivePlayerXP(XP_TheklasPaket);
};


var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;

instance DIA_Thekla_PERM(C_Info)
{
	npc = BAU_913_Thekla;
	NO = 900 ;
	condition = DIA_Thekla_PERM_Condition;
	information = DIA_Thekla_PERM_Info;
	permanent = TRUE;
	description = " Can you give me some stew yet? " ;
};


func int DIA_Thekla_PERM_Condition()
{
	if(Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output (other, self, " DIA_Thekla_PERM_15_00 " );	// Won't you give me some stew yet?

	if (MIS_Thekla_Paket ==  FALSE )
	{
		AI_Output (self, other, " DIA_Thekla_PERM_17_01 " );	// It's all gone.
		AI_Output (other, self, " DIA_Thekla_PERM_15_02 " );	// Not even a small bowl left?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//Nope.
		AI_Output (other, self, " DIA_Thekla_PERM_15_04 " );	// Can I lick the pot, then?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Stop!
		AI_Output (self, other, " DIA_Thekla_PERM_17_06 " );	// If you like my stew so much, you have to do something to get it.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//What?
		AI_Output (self, other, " DIA_Thekla_PERM_17_08 " );	// Go to Sagitta, the healer who lives behind Secoba's farm, and bring me a bag of herbs from her.
		AI_Output (self, other, " DIA_Thekla_PERM_17_09 " );	// If you bring me the herbs, I will make some stew for you.
		MIS_Thekla_Paket = LOG_Running;
		Log_CreateTopic(TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_TheklaEintopf,LOG_Running);
		B_LogEntry (TOPIC_TheklaEintopf, " If I bring Tekla some herbs from the healer Sagitta, she will cook another stew for me. Sagitta lives behind Sekoba's farm. " );
	}
	else  if (MIS_Thekla_Paket ==  LOG_SUCCESS )
	{
		if(Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 ==  FALSE )
			{
				AI_Output (self, other, " DIA_Thekla_PERM_17_10 " );	// Good. I feel sorry for you. Here you are. I can't watch you starving to death in front of my eyes.
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap1 = TRUE ;
			}
			else
			{
				AI_Output (self, other, " DIA_Thekla_PERM_17_11 " );	// Hey hey hey! Don't be so greedy! I'll let you know if I have more work for you.
				AI_Output (self, other, " DIA_Thekla_PERM_17_12 " );	// AND THEN you'll get more of this stew, okay?
			};
		};
		if ((Chapter ==  3 ) || (Chapter ==  4 ))
		{
			if((Thekla_MehrEintopfKap3 == FALSE) && (MIS_RescueBennet == LOG_SUCCESS))
			{
				AI_Output (self, other, " DIA_Thekla_PERM_17_13 " );	// I heard you helped Bennett get out of jail. Great job, boy.
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap3 = TRUE ;
			}
			else if(MIS_RescueBennet != LOG_SUCCESS)
			{
				AI_Output (self, other, " DIA_Thekla_PERM_17_14 " );	// Those militia bastards threw Bennett behind bars.
				AI_Output (self, other, " DIA_Thekla_PERM_17_15 " );	// Do me a favor, get him out of there, okay? In the meantime, I’ll cook a delicious stew for you.
			}
			else
			{
				AI_Output (self, other, " DIA_Thekla_PERM_17_16 " );	// I have nothing left. Come back later.
			};
		};
		if(Kapitel >= 5)
		{
			if (Thekla_MehrEintopfKap5 ==  FALSE )
			{
				AI_Output (self, other, " DIA_Thekla_PERM_17_17 " );	// Are you always so hungry? What have you been doing all this time?
				AI_Output (other, self, " DIA_Thekla_PERM_15_18 " );	// I killed several dragons.
				AI_Output (self, other, " DIA_Thekla_PERM_17_19 " );	// Oh! I suppose that WOULD make you work up an appetite...
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap5 = TRUE ;
			}
			else
			{
				AI_Output (self, other, " DIA_Thekla_PERM_17_20 " );	// The soup's all gone.
			};
		};
	}
	else
	{
		AI_Output (self, other, " DIA_Thekla_PERM_17_21 " );	// No herbs, no stew - okay?
	};
};


instance DIA_Thekla_PICKPOCKET(C_Info)
{
	npc = BAU_913_Thekla;
	NO = 900 ;
	condition = DIA_Thekla_PICKPOCKET_Condition;
	information = DIA_Thekla_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Thekla_PICKPOCKET_Condition()
{
	return  C_Beklauen ( 53 , 60 );
};

func void DIA_Thekla_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
	Info_AddChoice (DIA_Thekla_PICKPOCKET, Dialog_Back, DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
};

func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
};
