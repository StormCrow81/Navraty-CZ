
instance DIA_Hokurn_EXIT(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 999;
	condition = DIA_Hokurn_EXIT_Condition;
	information = DIA_Hokurn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hokurn_Hello(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 4;
	condition = DIA_Hokurn_Hello_Condition;
	information = DIA_Hokurn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hokurn_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE) && (HokFirstMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Hello_Info()
{
	AI_Output(self,other, " DIA_Hokurn_Hello_01_00 " );	// Do you have anything to drink?
	AI_Output(other,self, " DIA_Hokurn_Hello_15_01 " );	// I guess water won't suit you.
	AI_Output(self,other, " DIA_Hokurn_Hello_01_02 " );	// No, damn it!!! I need something alcoholic so I can finally get rid of this damn headache.
	AI_Output(self,other, " DIA_Hokurn_Hello_01_03 " );	// When I can't get my throat wet for a long time, my skull cracks and feels like it's going to explode.
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello, " I can't help you. " ,DIA_Hokurn_Hello_No);

	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_Hello, " Here, take this. " ,DIA_Hokurn_Hello_Yes);
	};
};

func void DIA_Hokurn_Hello_No()
{
	AI_Output(other,self, " DIA_Hokurn_Hello_No_15_00 " );	// I can't help you.
	AI_Output(self,other, " DIA_Hokurn_Hello_No_01_01 " );	// Then get lost!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello, " One more thing... " ,DIA_Hokurn_Hello_ASK1);
};

func void DIA_Hokurn_Hello_ASK1()
{
	AI_Output(other,self, " DIA_Hokurn_Hello_ASK1_15_00 " );	// One more thing...
	AI_Output(self,other, " DIA_Hokurn_Hello_ASK1_01_01 " );	// (roars) Don't you understand me? GET OUT!!!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello, " This is important. " ,DIA_Hokurn_Hello_ASK2);
};

func void DIA_Hokurn_Hello_ASK2()
{
	AI_Output(other,self, " DIA_Hokurn_Hello_ASK2_15_00 " );	// This is important.
	AI_Output(self,other, " DIA_Hokurn_Hello_ASK2_01_01 " );	// (roars) You asked for it.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_Sauf()
{
	AI_Output(self,other, " B_Hokurn_Sauf_01_00 " );	// (burps) Oh, what bliss!
	AI_Output(self,other, " B_Hokurn_Sauf_01_01 " );	// Now I can think rationally again. What can I do for you?
};

func void b_hokurn_drinking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		B_UseItem(self,ItFo_Addon_Grog);
	};
	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;
};

func void b_hokurn_taking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	};
};

func void DIA_Hokurn_Hello_Yes()
{
	AI_Output(other,self, " DIA_Hokurn_Hello_Yes_15_00 " );	// I have something.
	b_hokurn_drinking();
	B_Hokurn_Sauf();
	Info_ClearChoices(DIA_Hokurn_Hello);
};


instance DIA_Hokurn_Drink(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Drink_Condition;
	information = DIA_Hokurn_Drink_Info;
	permanent = TRUE;
	description = " I brought you a drink. " ;
};


func int DIA_Hokurn_Drink_Condition()
{
	if (( KAPITELORCATC  ==  FALSE ) && (HokurnGetsDrink ==  FALSE ) && ((Npc_HasItems(other,ItFo_Beer) >=  1 ) || (Npc_HasItems(other,ItFo_Addon_Rum) >=  1 ) || (Npc_HasItems(other,ItFo_Addon_Grog) >=  1 ) || (Npc_HasItems(other,ItFo_Booze) >=  1 ) || (Npc_HasItems(other,ItFo_Wine) >=  1 )))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Drink_Info()
{
	AI_Output(other,self, " DIA_Hokurn_Drink_15_00 " );	// I brought you a drink.
	AI_Output(self,other, " DIA_Hokurn_Drink_01_01 " );	// (eagerly) Come on over here!!
	b_hokurn_drinking();
	B_Hokurn_Sauf();
};


instance DIA_Hokurn_Question(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Question_Condition;
	information = DIA_Hokurn_Question_Info;
	permanent = TRUE;
	description = " I need some information. " ;
};


func int DIA_Hokurn_Question_Condition()
{
	if ((HokurnGetsDrink ==  FALSE ) && ( KAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Question_Info()
{
	AI_Output(other,self, " DIA_Hokurn_Question_15_00 " );	// I need some information.
	AI_Output(self,other, " DIA_Hokurn_Question_01_01 " );	// (irritated) I thought you understood me. I only talk to friends.
	AI_Output(self,other, " DIA_Hokurn_Question_01_02 " );	// And friends always share drinks with me. Understood? Now get lost!
};


instance DIA_Hokurn_Learn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent = FALSE;
	description = " I'm looking for someone who could teach me something. " ;
};


func int DIA_Hokurn_Learn_Condition()
{
	if(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Learn_Info()
{
	AI_Output(other,self, " DIA_Hokurn_Learn_15_00 " );	// I'm looking for someone who could teach me something.
	AI_Output(self,other, " DIA_Hokurn_Learn_01_01 " );	// I could teach you some things. I'm the best fighter for miles around.
	AI_Output(self,other, " DIA_Hokurn_Learn_01_02 " );	// Since we're friends, I'll give you a discount. It will cost three hundred gold coins.
	Info_ClearChoices(DIA_Hokurn_Learn);
	Info_AddChoice(DIA_Hokurn_Learn, " It's too expensive. " ,DIA_Hokurn_Learn_TooExpensive);
	if(Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		Info_AddChoice(DIA_Hokurn_Learn, " OK, here's the gold. " ,DIA_Hokurn_Learn_OK);
	};
};

func void DIA_Hokurn_Learn_TooExpensive()
{
	AI_Output(other,self, " DIA_Hokurn_Learn_TooExpensive_15_00 " );	// This is too expensive for me.
	AI_Output(self,other, " DIA_Hokurn_Learn_TooExpensive_01_01 " );	// Too expensive? This is less than anyone else would ask in my place.
	AI_Output(self,other, " DIA_Hokurn_Learn_TooExpensive_01_02 " );	// Well, think for yourself.
	Info_ClearChoices(DIA_Hokurn_Learn);
};

func void DIA_Hokurn_Learn_OK()
{
	AI_Output(other,self, " DIA_Hokurn_Learn_OK_15_00 " );	// Okay, here's the money.
	B_GiveInvItems(other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Hokurn_Learn);
};


instance DIA_Hokurn_PayTeacher(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_PayTeacher_Condition;
	information = DIA_Hokurn_PayTeacher_Info;
	permanent = TRUE;
	description = " Here's your money. I want you to educate me. " ;
};


func int DIA_Hokurn_PayTeacher_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Hokurn_Learn ) && ( Npc_HasItems ( other , It_My_Gold ) >=  300 ) && ( Hokurn_TeachPlayer ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Hokurn_PayTeacher_Info()
{
	AI_Output(other,self, " DIA_Hokurn_PayTeacher_15_00 " );	// Here's your money. I want you to teach me.
	AI_Output(self,other, " DIA_Hokurn_PayTeacher_01_01 " );	// You won't regret it!
	B_GiveInvItems(other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
};


instance DIA_Hokurn_DrinkAndLearn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_DrinkAndLearn_Condition;
	information = DIA_Hokurn_DrinkAndLearn_Info;
	permanent = TRUE;
	description = " Here, have a drink. " ;
};


func int DIA_Hokurn_DrinkAndLearn_Condition()
{
	if((KAPITELORCATC == FALSE) && (HokurnGetsDrink == TRUE) && ((Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1) || (Npc_HasItems(other,ItFo_Beer) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output(other,self, " DIA_Hokurn_DrinkAndLearn_15_00 " );	// Now you have something to drink.
	b_hokurn_drinking();
	AI_Output(self,other, " DIA_Hokurn_DrinkAndLearn_01_01 " );	// I feel much better.
};


instance DIA_Hokurn_Teach(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_Teach_Condition;
	information = DIA_Hokurn_Teach_Info;
	permanent = TRUE;
	description = " Let's start learning. " ;
};


func int DIA_Hokurn_Teach_Condition()
{
	if(Hokurn_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Teach_Info()
{
	AI_Output(other,self, " DIA_Hokurn_Teach_15_00 " );	// Let's start training.
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other, " DIA_Hokurn_Teach_01_01 " );	// First get me something to drink!
	}
	else
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other, " DIA_Hokurn_Teach_01_02 " );	// And then we'll see what we can squeeze out of your rusty paladin bones, huh?
		}
		else  if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_GUR ))
		{
			AI_Output(self,other, " DIA_Hokurn_Teach_01_03 " );	// What do you understand. Even mages are no strangers to melee weapons.
		};
		Info_ClearChoices(DIA_Hokurn_Teach);
		Info_AddChoice(DIA_Hokurn_Teach,Dialog_Back,DIA_Hokurn_Teach_Back);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hokurn_Teach_2H_1);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hokurn_Teach_2H_5);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Hokurn_Teach_1H_1);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Hokurn_Teach_1H_5);
	};
};

func void DIA_Hokurn_Teach_Back()
{
	Info_ClearChoices(DIA_Hokurn_Teach);
};

func void B_Hokurn_TeachedEnough()
{
	AI_Output(self,other, " B_Hokurn_TeachedEnough_01_00 " );	// You no longer need a teacher in this martial art.
};

func void DIA_Hokurn_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hokurn_Teach_2H_1);
};

func void DIA_Hokurn_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hokurn_Teach_2H_5);
};

func void DIA_Hokurn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	if(other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Hokurn_Teach_1H_1);
};

func void DIA_Hokurn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	if(other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Hokurn_Teach_1H_5);
};


instance DIA_Hokurn_StayHere(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent = FALSE;
	description = " What are you even doing here, by the way? " ;
};


func int DIA_Hokurn_StayHere_Condition()
{
	if ((HokurnGetsDrink ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_StayHere_Info()
{
	AI_Output(other,self, " DIA_Hokurn_StayHere_15_00 " );	// By the way, what are you even doing here?
	AI_Output(self,other, " DIA_Hokurn_StayHere_01_01 " );	// To be honest, I have no idea what we are doing here and when everything will start.
	AI_Output(self,other, " DIA_Hokurn_StayHere_01_02 " );	// And as long as I have booze, I don't care at all.
};


instance DIA_Hokurn_WhereDragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent = TRUE;
	description = " Do you know where the dragons are? " ;
};


func int DIA_Hokurn_WhereDragon_Condition()
{
	if ((HokurnGetsDrink ==  TRUE ) && (HokurnTellsDragon ==  FALSE ) && Npc_KnowsInfo(other,DIA_Hokurn_StayHere) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Hokurn_WhereDragon_Info()
{
	AI_Output(other,self, " DIA_Hokurn_WhereDragon_15_00 " );	// Do you know where the dragons are?
	AI_Output(self,other, " DIA_Hokurn_WhereDragon_01_01 " );	// And what will I get for saying this to you?
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon, " Never mind, I'll look for them myself. " ,DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice(DIA_Hokurn_WhereDragon, " I could buy info from you. " ,DIA_Hokurn_WhereDragon_Gold);
	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon, " I have another bottle. " ,DIA_Hokurn_WhereDragon_Booze);
	};
};

func void DIA_Hokurn_WhereDragon_FindMyself()
{
	AI_Output(other,self, " DIA_Hokurn_WhereDragon_FindMyself_15_00 " );	// Don't worry, I'll find them myself.
	AI_Output(self,other, " DIA_Hokurn_WhereDragon_FindMyself_01_01 " );	// You'd better be careful. There are many bloody battles ahead of you.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Gold()
{
	AI_Output(other,self, " DIA_Hokurn_WhereDragon_Gold_15_00 " );	// I wouldn't mind paying you for this information.
	AI_Output(self,other, " DIA_Hokurn_WhereDragon_Gold_01_01 " );	// Pay me? Okay, I'll sell you this information for two hundred gold coins.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon, " Too many. " ,DIA_Hokurn_WhereDragon_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon, " Agree, there's money here. " ,DIA_Hokurn_WhereDragon_OK);
	};
};

func void DIA_Hokurn_WhereDragon_TooMuch()
{
	AI_Output(other,self, " DIA_Hokurn_WhereDragon_TooMuch_15_00 " );	// That's too much!
	AI_Output(self,other, " DIA_Hokurn_WhereDragon_TooMuch_01_01 " );	// Then forget about it.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_OK()
{
	AI_Output(other,self, " DIA_Hokurn_WhereDragon_OK_15_00 " );	// Agreed. Here is your money!
	B_GiveInvItems(other,self,ItMi_Gold,200);
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Booze()
{
	AI_Output(other,self, " DIA_Hokurn_WhereDragon_Booze_15_00 " );	// I still have a bottle!
	AI_Output(self,other, " DIA_Hokurn_WhereDragon_Booze_01_01 " );	// For a good drop, I'd kill all the dragons in the world.
	AI_Output(self,other, " DIA_Hokurn_WhereDragon_Booze_01_02 " );	// Noticed. Come here!
	b_hokurn_taking();
	AI_Output(self,other, " DIA_Hokurn_WhereDragon_Booze_01_03 " );	// I'll leave him for worse.
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};


instance DIA_Hokurn_Dragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Dragon_Condition;
	information = DIA_Hokurn_Dragon_Info;
	permanent = FALSE;
	description = " Okay, now tell me, where are all those dragons? " ;
};


func int DIA_Hokurn_Dragon_Condition()
{
	if ((HokurnTellsDragon ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ) && (MY_AllDragonsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Dragon_Info()
{
	AI_Output(other,self, " DIA_Hokurn_Dragon_15_00 " );	// Okay, now tell me, where are all these dragons?
	AI_Output(self,other, " DIA_Hokurn_Dragon_01_01 " );	// Well, to be honest, I can't tell you anything definitive, but I heard that there should be four dragons in total.
	AI_Output(self,other, " DIA_Hokurn_Dragon_01_02 " );	// Last night we saw a crimson glow over the highest mountain.
	AI_Output(self,other, " DIA_Hokurn_Dragon_01_03 " );	// I'll swear on my mother that if you're looking for dragons, you'll find one there.
};


instance DIA_Hokurn_AllDragonsDead(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent = TRUE;
	description = " I've killed all the dragons. " ;
};


func int DIA_Hokurn_AllDragonsDead_Condition()
{
	if ((MY_AllDragonsDead ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_Hokurn_AllDragonsDead_15_00 " );	// I killed all the dragons.
	AI_Output(self,other, " DIA_Hokurn_AllDragonsDead_01_01 " );	// Go tell stories to someone else.
};


instance DIA_Hokurn_PICKPOCKET(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 900;
	condition = DIA_Hokurn_PICKPOCKET_Condition;
	information = DIA_Hokurn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hokurn_PICKPOCKET_Condition()
{
	return  C_Robbery ( 69 , 210 );
};

func void DIA_Hokurn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET,Dialog_Back,DIA_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};

func void DIA_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};


instance DIA_HOKURN_FUCKOFF(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 2;
	condition = dia_hokurn_fuckoff_condition;
	information = dia_hokurn_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hokurn_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_hokurn_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

//----------------------------------------------------------------------------

instance DIA_Hokurn_SLD_EXIT(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 999;
	condition = DIA_Hokurn_SLD_EXIT_Condition;
	information = DIA_Hokurn_SLD_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Hokurn_SLD_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_SLD_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Hokurn_SLD_PICKPOCKET(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 900;
	condition = DIA_Hokurn_SLD_PICKPOCKET_Condition;
	information = DIA_Hokurn_SLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Hokurn_SLD_PICKPOCKET_Condition()
{
	return  C_Robbery ( 69 , 210 );
};

func void DIA_Hokurn_SLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
	Info_AddChoice(DIA_Hokurn_SLD_PICKPOCKET,Dialog_Back,DIA_Hokurn_SLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hokurn_SLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hokurn_SLD_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_SLD_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
};

func void DIA_Hokurn_SLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
};

instance DIA_Hokurn_NW_Hello(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 4;
	condition = DIA_Hokurn_NW_Hello_Condition;
	information = DIA_Hokurn_NW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hokurn_NW_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE) && (HokFirstMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_NW_Hello_Info()
{
	AI_Output(self,other, " DIA_Hokurn_Hello_01_00 " );	// Do you have anything to drink?
	AI_Output(other,self, " DIA_Hokurn_Hello_15_01 " );	// I guess water won't suit you.
	AI_Output(self,other, " DIA_Hokurn_Hello_01_02 " );	// No, damn it!!! I need something alcoholic so I can finally get rid of this damn headache.
	AI_Output(self,other, " DIA_Hokurn_Hello_01_03 " );	// When I can't get my throat wet for a long time, my skull cracks and feels like it's going to explode.
	HokFirstMeet = TRUE;
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello, " I can't help you. " ,DIA_Hokurn_NW_Hello_No);

	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_NW_Hello, " Here, take this. " ,DIA_Hokurn_NW_Hello_Yes);
	};
};

func void DIA_Hokurn_NW_Hello_No()
{
	AI_Output(other,self, " DIA_Hokurn_Hello_No_15_00 " );	// I can't help you.
	AI_Output(self,other, " DIA_Hokurn_Hello_No_01_01 " );	// Then get lost!
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello,Dialog_Ende,DIA_Hokurn_NW_Hello_END);
	Info_AddChoice(DIA_Hokurn_NW_Hello, " Please... " ,DIA_Hokurn_NW_Hello_ASK1);
};

func void DIA_Hokurn_NW_Hello_ASK1()
{
	AI_Output(other,self, " DIA_Hokurn_Hello_ASK1_15_00 " );	// One more thing...
	AI_Output(self,other, " DIA_Hokurn_Hello_ASK1_01_01 " );	// (roars)... Don't you understand me? GET OUT!!!
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello,Dialog_Ende,DIA_Hokurn_NW_Hello_END);
	Info_AddChoice(DIA_Hokurn_NW_Hello,"Это важно.",DIA_Hokurn_NW_Hello_ASK2);
};

func void DIA_Hokurn_NW_Hello_ASK2()
{
	AI_Output(other,self, " DIA_Hokurn_Hello_ASK2_15_00 " );	// This is important.
	AI_Output(self,other, " DIA_Hokurn_Hello_ASK2_01_01 " );	// (roars)... You asked for it!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_NW_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_NW_Sauf()
{
	AI_Output(self,other, " B_Hokurn_Sauf_01_00 " );	// (burps) Oh, what bliss!
	AI_Output(self,other, " B_Hokurn_Sauf_01_01 " );	// Now I can think rationally again. What can I do for you?
};

func void b_hokurn_NW_drinking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		B_UseItem(self,ItFo_Addon_Grog);
	};
	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;
};

func void b_hokurn_NW_taking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	};
};

func void DIA_Hokurn_NW_Hello_Yes()
{
	AI_Output(other,self, " DIA_Hokurn_Hello_Yes_15_00 " );	// Here, take this.
	b_hokurn_drinking();
	B_Hokurn_Sauf();
	StartPashalQuest = TRUE;
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
};


instance DIA_Hokurn_NW_Drink(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_NW_Drink_Condition;
	information = DIA_Hokurn_NW_Drink_Info;
	permanent = TRUE;
	description = " I brought you some drinks. " ;
};


func int DIA_Hokurn_NW_Drink_Condition()
{
	if (( KAPITELORCATC  ==  FALSE ) && (HokurnGetsDrink ==  FALSE ) && ((Npc_HasItems(other,ItFo_Beer) >=  1 ) || (Npc_HasItems(other,ItFo_Addon_Rum) >=  1 ) || (Npc_HasItems(other,ItFo_Addon_Grog) >=  1 ) || (Npc_HasItems(other,ItFo_Booze) >=  1 ) || (Npc_HasItems(other,ItFo_Wine) >=  1 )))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_NW_Drink_Info()
{
	AI_Output(other,self, " DIA_Hokurn_Drink_15_00 " );	// I brought you some drinks.
	AI_Output(self,other, " DIA_Hokurn_Drink_01_01 " );	// Come here!
	b_hokurn_NW_drinking();
	B_Hokurn_NW_Sauf();
	StartPashalQuest = TRUE;
};

// -----------------------easter eggs------------------------ ----------------------

instance DIA_Hokurn_NW_PashalQuest (C_Info)
{
   npc = SLD_849_Hokurn;
   nr = 5;
   condition = DIA_Hokurn_NW_PashalQuest_Condition;
   information = DIA_Hokurn_NW_PashalQuest_Info;
   permanent = FALSE;
   description = " Is there anything interesting on this farm? " ;
};

func int DIA_Hokurn_NW_PashalQuest_Condition()
{
   if (( CHAPTERORCATC  ==  FALSE ) && (Chapter <  4 ) && (StartPashalQuest ==  TRUE ))
   {
      return TRUE;
   };
};

func void DIA_Hokurn_NW_PashalQuest_Info()
{
   AI_Output(other,self, " DIA_Hokurn_NW_PashalQuest_01_00 " );   // Is there anything interesting on your farm?
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_01 " );   // Interesting? Dude, you're clearly out of your mind for asking questions like this.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_02 " );   // Look around, and you will see for yourself that there are only stupid rams and sheep around.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_03 " );   // This sad picture, alas, does not change from day to day.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_04 " );   // So look for interesting things outside of our pigsty. You won't find anything here.
   AI_Output(other,self, " DIA_Hokurn_NW_PashalQuest_01_05 " );   // Do you seem to know where to look for them?
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_06 " );   // (sarcastically) Well, how can I tell you. I don't know, but I heard something.
   AI_Output(other,self, " DIA_Hokurn_NW_PashalQuest_01_07 " );   // Heard what?
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_08 " );   // Well... (he hesitated) It's quite an old story. And I don't even know if it's true or not.
   AI_Output(other,self, " DIA_Hokurn_NW_PashalQuest_01_09 " );   // I'd love to hear from you.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_10 " );   // Eh! Well, okay, why not.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_11 " );   // After all, you bought me a drink, and I remember good things.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_12 " );   // Well, so... It was at the time when I was sitting behind the Barrier in the Valley of Mines.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_13 " );   // Once in the tavern of the New Camp, I heard a story about a certain artifact.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_14 " );   // Some eccentric from the Swamp Camp, who brought us another portion of the grass, was talking about power.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_15 " );   // He spoke about the fact that there is an item that will allow the owner to gain immense and unlimited power over the world! Can you imagine?
   AI_Output(other,self, " DIA_Hokurn_NW_PashalQuest_01_16 " );   // And you believed him?
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_17 " );   // Well, not really... The Swamp Brothers are pretty weird guys, you can expect anything from them.
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_18 " );   // Who knows, is the story pure truth or nonsense of stoned sectarians?
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_19 " );   // I can only say one thing with certainty: rumors don't just happen! You can trust me on this.
   AI_Output(other,self, " DIA_Hokurn_NW_PashalQuest_01_20 " );   // Yes, an unusual story. What was that guy's name?
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_21 " );   // I don't know his name. I only remember that he constantly smoked marsh grass. All day long!
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_22 " );   // And when he was completely stoned, he started banging his head against the wall. As if he was trying to pierce her through!
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_23 " );   // Yes, the boy was funny.
   AI_Output(other,self, " DIA_Hokurn_NW_PashalQuest_01_24 " );   // Where is he now, do you know?
   AI_Output(self,other, " DIA_Hokurn_NW_PashalQuest_01_25 " );   // I have no idea. Since then, he has not appeared in our camp again.
   AI_Output(other,self, " DIA_Hokurn_NW_PashalQuest_01_26 " );   // Okay, thanks for the story.
   MIS_PashalQuest = LOG_Running;
   Log_CreateTopic(TOPIC_PashalQuest,LOG_MISSION);
   Log_SetTopicStatus(TOPIC_PashalQuest,LOG_Running);
   B_LogEntry(TOPIC_PashalQuest, " The mercenary Hawkurn told me a strange story about some magical artifact that grants unlimited power over the whole world! He heard it in the colony from some acolyte of the Brotherhood of the Sleeper, who was selling swamp in the New Camp. Maybe I can find this person in new Brotherhood camp in Khorinis to learn more about this magical item. " );
   AI_StopProcessInfos(self);
   Wld_InsertNpc(SEK_4567_Unicorn,"NW_PSICAMP_UNICORN");
};

var int  UNICORN_FLAG_01 ;
var int  UNICORN_FLAG_02 ;
var int UNICORNTALK_YES;

instance DIA_SEK_4567_Unicorn_EXIT(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 999;
   condition = DIA_SEK_4567_Unicorn_exit_condition;
   information = DIA_SEK_4567_Unicorn_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_SEK_4567_Unicorn_exit_condition()
{
   return TRUE;
};

func void DIA_SEK_4567_Unicorn_exit_info()
{
   AI_StopProcessInfos(self);
};


instance DIA_SEK_4567_Unicorn_NOTALK_SLEEPER(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_notalk_sleeper_condition;
   information = DIA_SEK_4567_Unicorn_notalk_sleeper_info;
   permanent = FALSE;
   important = FALSE;
   description = " May the Sleeper be with you! " ;
};


func int DIA_SEK_4567_Unicorn_notalk_sleeper_condition()
{
   if(UNICORNTALK_YES == FALSE)
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_notalk_sleeper_info()
{
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_00 " );   // May the Sleeper be with you!
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_01");   //(вздох)
   UNICORN_FLAG_01 = TRUE;
   AI_StopProcessInfos(self);
};

instance DIA_SEK_4567_Unicorn_NOTALK_IMP(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_notalk_imp_condition;
   information = DIA_SEK_4567_Unicorn_notalk_imp_info;
   permanent = TRUE;
   important = FALSE;
   description = " Is everything all right, mate? " ;
};

func int DIA_SEK_4567_Unicorn_notalk_imp_condition()
{
   if(UNICORNTALK_YES == FALSE)
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_notalk_imp_info()
{
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_NoTalk_Imp_01_00 " );   // Are you all right, mate?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_01");   //(вздох)
   UNICORN_FLAG_02 = TRUE;
   AI_StopProcessInfos(self);
};

instance DIA_SEK_4567_Unicorn_HasSmoke(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_HasSmoke_condition;
   information = DIA_SEK_4567_Unicorn_HasSmoke_info;
   permanent = FALSE;
   description = " I have shoals of swamp grass lying around. " ;
};

func int DIA_SEK_4567_Unicorn_HasSmoke_condition()
{
   if((UNICORNTALK_YES == FALSE) && (UNICORN_FLAG_01 == TRUE) && (UNICORN_FLAG_02 == TRUE) && (Npc_HasItems(other,ItMi_Joint) >= 1))
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_HasSmoke_info()
{
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HasSmoke_01_00 " );   // I have shoals of swamp grass lying around. Are you interested in them?
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HasSmoke_01_01 " );   // (coughing) That's where we should have started! How many of them do you have?
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HasSmoke_01_02 " );   // Well, not really.
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HasSmoke_01_03 " );   // Okay, it doesn't matter... Give them here. And lately it has become difficult to get them here.
   B_GiveInvItems(other,self,ItMi_Joint,Npc_HasItems(other,ItMi_Joint));
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HasSmoke_01_04 " );   // Doesn't Talas give you a new portion every day?
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HasSmoke_01_05 " );   // Gives, but, unfortunately, it is not enough for me. I want to smoke all the time.
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HasSmoke_01_06 " );   // If I don't smoke bog, I get a terrible headache. At least hit the wall!
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HasSmoke_01_07 " );   // This used to help, but now it's useless... It still splits.
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HasSmoke_01_08 " );   // That's why I need a lot of marsh grass shoals! Understand?
   UNICORNTALK_YES = TRUE;
};

instance DIA_SEK_4567_Unicorn_HeyYou(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_HeyYou_condition;
   information = DIA_SEK_4567_Unicorn_HeyYou_info;
   permanent = FALSE;
   description = " Hey, you're not the right guy for an hour... " ;
};

func int DIA_SEK_4567_Unicorn_HeyYou_condition()
{
   if((MIS_PashalQuest == LOG_Running) && (UNICORNTALK_YES == TRUE))
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_HeyYou_info()
{
   B_GivePlayerXP(200);
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HeyYou_01_00 " );   // Hey, aren't you the guy who pushed the swamp in the New Camp?
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_01 " );   // Well, yes. It was business. However, I didn't stay there for long.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_02");   //Почему?
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_03 " );   // (guilty) Well, I smoked all the swamp that was handed to me for sale.
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_04 " );   // So I was quickly replaced by the Idols of Isidro and Kagan. And they sent me back to our camp.
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HeyYou_01_05 " );   // Okay, it doesn't matter. I am interested in another question.
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HeyYou_01_06 " );   // Someone remembers what you said about the strange magical artifact.
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HeyYou_01_07 " );   // Allegedly, with its help, you can control almost the whole world!
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_08 " );   // Umm...(confused) Really?! Well, maybe something like that happened ... What you can’t do after a good portion of the bog.
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HeyYou_01_09 " );   // Do you remember anything about this?
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_10 " );   // Almost nothing. I only remember that I myself accidentally heard that story.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_11");   //Где?
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_12 " );   // In the Old Camp. Once, having brought another portion of the swamp, I accidentally witnessed a conversation between two guards.
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_13 " );   // One of them was telling the other about that strange item.
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_14 " );   // Then they saw me and moved on. That, in fact, is all.
   AI_Output(other,self, " DIA_SEK_4567_Unicorn_HeyYou_01_15 " );   // Do you remember the names of those guards?
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_16 " );   // I don't know their names. I only remember that one of them had gray hair.
   AI_Output(self,other, " DIA_SEK_4567_Unicorn_HeyYou_01_17 " );   // Well, that's all I know.
   B_LogEntry(TOPIC_PashalQuest, " I found a guy who told this story in the New Camp. He didn't really tell me anything, except that he himself once overheard this story in a conversation between two guards of the Old Camp. If anyone knows about it there are more artifacts, then only they. And where should I look for these people now, I’ll never know ... " );
   PashalQuestGuardStep = TRUE;
};

instance DIA_BDT_4568_KINJARTS_EXIT(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 999;
   condition = DIA_BDT_4568_KINJARTS_exit_condition;
   information = DIA_BDT_4568_KINJARTS_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_BDT_4568_KINJARTS_exit_condition()
{
   return TRUE;
};

func void DIA_BDT_4568_KINJARTS_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_BDT_4568_KINJARTS_HELLO(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_HELLO_condition;
   information = DIA_BDT_4568_KINJARTS_HELLO_info;
   permanent = FALSE;
   description = " Hi. How are you? " ;
};

func int DIA_BDT_4568_KINJARTS_HELLO_condition()
{
   return TRUE;
};

func void DIA_BDT_4568_KINJARTS_HELLO_info()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_HELLO_01_00 " );   // Hello. How are you?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_HELLO_01_01 " );   // (grinning) Who's straying here?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_HELLO_01_02 " );   // Don't say anything though! Let me guess... More meat to be slaughtered in a gold mine, I suppose?
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_HELLO_01_03 " );   // You're wrong! I'm here for a different reason.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_HELLO_01_04 " );   // Don't try to fool me, boy!
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_HELLO_01_05 " );   // I've seen a lot of puppies like you in my life telling everyone about an important mission. Especially in the Old Camp!
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_HELLO_01_06 " );   // At first, they proved themselves to be seasoned heroes capable of moving mountains! To say the least...
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_HELLO_01_07 " );   // But they were all cured by working in the mine! A couple of years, with a pick in their hands, they knock out nonsense and bravado from young hotheads.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_HELLO_01_08 " );   // And they'll beat you out...
};

var you KinJartsTellUs;
var int KinJartsWannaOre;

instance DIA_BDT_4568_KINJARTS_Quest(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_Quest_condition;
   information = DIA_BDT_4568_KINJARTS_Quest_info;
   permanent = FALSE;
   description = " I don't remember our meeting at the Old Camp. " ;
};

func int DIA_BDT_4568_KINJARTS_Quest_condition()
{
   if(Npc_KnowsInfo(other,DIA_BDT_4568_KINJARTS_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_Quest_info()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_01_00 " );   // I don't remember our meeting at the Old Camp.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_01_01 " );   // (smirking) Are you implying that you also visited the colony?
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_01_02 " );   // That's right. But I didn't see you there.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_01_03 " );   // Well, this is not surprising. Because most of the time I spent outside the camp, escorting the cargo that arrived from behind the barrier.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_01_04 " );   // Maybe that's why our paths never crossed.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_01_05 " );   // Now, if you asked the knowledgeable guys about the old Kinzharts, then they would tell you who I am!
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_01_06 " );   // True? Maybe you can tell yourself then?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_01_07 " );   // (grinning) Well, if you really want to hear about those times, then you should know that you have to pay for everything.
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_01_08 " ); // Ore, as usual?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_01_09 " ); // And you are quick-witted! But don't worry, I won't charge you exorbitant prices like the local merchants do.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_01_10 " ); // So maybe three pieces of ore will be enough for me.
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
   Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest, " I'll think about your offer. " ,DIA_BDT_4568_KINJARTS_Quest_Back);

   if(Npc_HasItems(other,ItMi_Nugget) >= 3)
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest, " (give three pieces of magic ore) " ,DIA_BDT_4568_KINJARTS_Quest_MagicOre);
   };
   if ((Npc_HasItems(other, ITMI_SNUGGET ) >=  3 ) && (RhetoricSkillValue[ 1 ] >=  35 )) ;
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest, " (give three pieces of iron ore) " ,DIA_BDT_4568_KINJARTS_Quest_IronOre);
   };
};

func void DIA_BDT_4568_KINJARTS_Quest_Back()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_Back_01_01 " );   // I'll think about your suggestion.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_Back_01_02 " );   // Not for long! And then suddenly I change my mind.
   KinJartsWannaOre = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};

func void DIA_BDT_4568_KINJARTS_Quest_MagicOre()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_01 " );   // Here are your three pieces of ore.
   B_GiveInvItems(other,self,ItMi_Nugget,3);
   Npc_RemoveInvItems(self,ItMi_Nugget,3);
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_02 " );   // Good. Then I, perhaps, will continue the story.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_03 " );   // I ended up in the colony at a time when the convicts still saw a clear sky above their heads.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_04 " );   // It wasn't easy at first. I felt the hardship of working in the mine on my own skin.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_05 " );   // However, after the appearance of the Barrier and the takeover by Gomez, he made me one of the guards and put me in charge of the newcomers arriving at the colony.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_06 " );   // Bullitt replaced me later. And the necessary contacts with other barons allowed me to take the place of the main supplier and accompanying cargo.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_07 " );   // It was a very dangerous job, because our carts were constantly attacked by thieves from the New Camp.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_08 " );   // In one of these troubles, I even almost died.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_09 " );   // But that's all in the past. Now I'm one of Torus's bodyguards.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_10 " );   // And the new place suits me just fine!
   KinJartsTellUs = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};


func void DIA_BDT_4568_KINJARTS_Quest_IronOre()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_01 " );   // Here are your three pieces of ore.
   B_GiveInvItems(other,self,ItMi_SNugget,3);
   Npc_RemoveInvItems(self,ItMi_SNugget,3);
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_02 " );   // What are you putting me here?!
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_03 " );   // Ore. You did want her.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_04 " );   // I meant magic ore, not normal ore!
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_05 " );   // But you never mentioned it. So take what is given.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_06 " );   // Hmmm... Looks like you've got old Kinzharts wrapped around your finger. Not expected!
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_07 " );   // So now you're going to tell me about yourself and what you did in the Old Camp?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_08 " );   // (grinning) Of course. A deal is a deal! So...
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_09 " );   // I ended up in the colony at a time when the convicts still saw a clear sky above their heads.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_10 " );   // It wasn't easy at first. I felt the hardship of working in the mine on my own skin.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_11 " );   // However, after the appearance of the Barrier and the takeover by Gomez, he made me one of the guards and put me in charge of the newcomers arriving at the colony.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_12 " );   // Bullitt replaced me later. And the necessary contacts with other barons allowed me to take the place of the main supplier and accompanying cargo.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_13 " );   // It was a very dangerous job, because our carts were constantly attacked by thieves from the New Camp.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_14 " );   // In one of these troubles, I even almost died.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_15 " );   // But that's all in the past. Now I'm one of Torus's bodyguards.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_16 " );   // And the new place suits me just fine!
   KinJartsTellUs = TRUE;
   RhetoricSkillValue[ 1 ] +=  1 ;
   AI_Print( " Rhetoric + 1 " );
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};

instance DIA_BDT_4568_KINJARTS_QuestAgain(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_QuestAgain_condition;
   information = DIA_BDT_4568_KINJARTS_QuestAgain_info;
   permanent = TRUE;
   description = " I brought you ore. " ;
};

func int DIA_BDT_4568_KINJARTS_QuestAgain_condition()
{
   if (( Who WantsUs ==  TRUE ) && ( Who WantsUs ==  FALSE ))
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_info()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestAgain_01_00 " );   // I brought you ore.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestAgain_01_01 " );   // Good. Give her here!
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
   Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain, " I'll think about it. " ,DIA_BDT_4568_KINJARTS_QuestAgain_Back);

   if(Npc_HasItems(other,ItMi_Nugget) >= 3)
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain, " Give three pieces of magic ore. " ,DIA_BDT_4568_KINJARTS_QuestAgain_MagicOre);
   };
   if ((Npc_HasItems(other, ITMI_SNUGGET ) >=  3 ) && (RhetoricSkillValue[ 1 ] >=  35 )) ;
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain, " Give three pieces of iron ore. " ,DIA_BDT_4568_KINJARTS_QuestAgain_IronOre);
   };
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_Back()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestAgain_Back_01_01 " );   // I'll think about it some more.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestAgain_Back_01_02 " );   // Not for long! And then suddenly I change my mind.
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_MagicOre()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_01 " );   // Here are your three pieces of ore.
   B_GiveInvItems(other,self,ItMi_Nugget,3);
   Npc_RemoveInvItems(self,ItMi_Nugget,3);
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_02 " );   // Good. Then I, perhaps, will continue the story.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_03 " );   // I ended up in the colony at a time when the convicts still saw a clear sky above their heads.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_04 " );   // It wasn't easy at first. I felt the hardship of working in the mine on my own skin.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_05 " );   // However, after the appearance of the Barrier and the takeover by Gomez, he made me one of the guards and put me in charge of the newcomers arriving at the colony.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_06 " );   // Bullitt replaced me later. And the necessary contacts with other barons allowed me to take the place of the main supplier and accompanying cargo.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_07 " );   // It was a very dangerous job, because our carts were constantly attacked by thieves from the New Camp.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_08 " );   // In one of these troubles, I even almost died.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_09 " );   // But that's all in the past. Now I'm one of Torus's bodyguards.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_10 " );   // And the new place suits me just fine!
   KinJartsTellUs = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_IronOre()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_01 " );   // Here are your three pieces of ore.
   B_GiveInvItems(other,self,ItMi_SNugget,3);
   Npc_RemoveInvItems(self,ItMi_SNugget,3);
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_02 " );   // What are you putting me here?!
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_03 " );   // Ore. You did want her.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_04 " );   // I meant magic ore, not normal ore!
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_05 " );   // But you never mentioned it. So take what they give!
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_06 " );   // Hmm... Looks like you've got old Kinzharts wrapped around your finger. Not expected!
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_07 " );   // So now you're going to tell me about yourself and what you did in the Old Camp?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_08 " );   // (grinning) Of course. A deal is a deal! So...
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_09 " );   // I ended up in the colony at a time when the convicts still saw a clear sky above their heads.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_10 " );   // It wasn't easy at first. I felt the hardship of working in the mine on my own skin.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_12 " );   // However, after the appearance of the Barrier and the takeover by Gomez, he made me one of the guards and put me in charge of the newcomers arriving at the colony.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_13 " );   // Bullitt replaced me later. And the necessary contacts with other barons allowed me to take the place of the main supplier and accompanying cargo.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_14 " );   // It was a very dangerous job, because our carts were constantly attacked by thieves from the New Camp.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_15 " );   // In one of these troubles, I even almost died.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_16 " );   // But that's all in the past. Now I'm one of Torus's bodyguards.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Quest_IronOre_01_17 " );   // And the new place suits me just fine!
   KinJartsTellUs = TRUE;
   RhetoricSkillValue[ 1 ] +=  1 ;
   AI_Print( " Rhetoric + 1 " );
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

instance DIA_BDT_4568_KINJARTS_QuestDone(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_QuestDone_condition;
   information = DIA_BDT_4568_KINJARTS_QuestDone_info;
   permanent = FALSE;
   description = " You seem to know a lot about the Old Camp. " ;
};

func int DIA_BDT_4568_KINJARTS_QuestDone_condition()
{
   if((MIS_PashalQuest == LOG_Running) && (KinJartsTellUs == TRUE))
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_QuestDone_info()
{
   B_GivePlayerXP(200);
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_00 " );   // Looks like you know a lot about the Old Camp.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_01 " );   // More than anyone! Why do you ask?
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_02 " );   // I just have one very sensitive question.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_03 " );   // Hmmm. Then you can ask it to me if you want.
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_04 " );   // I'm looking for a guard who once started a rumor about a certain magical artifact.
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_05 " );   // Allegedly, this powerful item can even influence the fate of this world.
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_06 " );   // Very interesting. Then let me ask you a counter question - how do you know this?
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_07 " );   // One of the brothers of the swamp camp told me about this.
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_08 " );   // He somehow overheard two guards talking about this artifact.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_09 " );   // (thoughtfully) Well, yes, this is quite possible.
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_10 " );   // What do you mean by that?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_11 " );   // I want to say that it looks like you addressed this question to the address.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_12 " );   // Because the guard you're looking for is me!
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_13 " );   // Come on! Truth?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_14 " );   // Do I look like a liar? Or maybe I give the same impression?
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_15 " );   // I wouldn't say that.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_16 " );   // Then trust me, son. All this is true!
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_17 " );   // And that stoner apparently overheard my conversation with my friend Scorpio when I told him this story.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_18 " );   // Then Scorpio said that it was complete nonsense and advised me not to bother myself with this.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_19 " );   // But, apparently, not everyone thought so.
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_20 " );   // So the artifact actually exists?
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_21 " );   // Listen to me, buddy. I didn't say it existed.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_22 " );   // However, it was mentioned at one time by the Firebenders, and their words, I believe, are still worth listening to.
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_23 " );   // But all the Firebenders were killed on Gomez's orders. How to be now?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_24 " );   // I know it. But, as far as I know, some of them still managed to survive.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_25 " );   // I think this mage's name was Milten! Perhaps you should find him and talk to him about this artifact already.
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_QuestDone_01_26 " );   // I have nothing more to say to you.
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_QuestDone_01_27 " );   // I understand you.
   B_LogEntry(TOPIC_PashalQuest, " Kinzharts was one of the guards who knew about the history of the artifact. According to him, only the Firebenders who lived in the Old Camp could confirm its existence. And the only magician who escaped Gomez's massacre was Milten. " ) ;
   PashalQuestMageStep = TRUE;
};

instance DIA_BDT_4568_KINJARTS_Perm(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_Perm_condition;
   information = DIA_BDT_4568_KINJARTS_Perm_info;
   permanent = TRUE;
   description = " How are things? " ;
};

func int DIA_BDT_4568_KINJARTS_Perm_condition()
{
   if ( Npc_KnowsInfo ( other , DIA_BDT_4568_KINJARTS_QuestDone ) ==  TRUE )
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_Perm_info()
{
   AI_Output(other,self, " DIA_BDT_4568_KINJARTS_Perm_01_00 " );   // What is the situation?
   AI_Output(self,other, " DIA_BDT_4568_KINJARTS_Perm_01_01 " );   // All is quiet for now. I hope it stays that way.
};

instance DIA_KDF_4569_AlexOne_EXIT(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 999;
   condition = DIA_KDF_4569_AlexOne_exit_condition;
   information = DIA_KDF_4569_AlexOne_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_KDF_4569_AlexOne_exit_condition()
{
   return TRUE;
};

func void DIA_KDF_4569_AlexOne_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_KDF_4569_AlexOne_HELLO(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_HELLO_condition;
   information = DIA_KDF_4569_AlexOne_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_KDF_4569_AlexOne_HELLO_condition()
{
   return TRUE;
};

func void DIA_KDF_4569_AlexOne_HELLO_info()
{
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_HELLO_01_00 " );   // Hey! What are you doing here?
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_HELLO_01_01 " );   // I wanted to ask you the same question.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_HELLO_01_02 " );   // (disparagingly) My business is none of your business.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_HELLO_01_03 " );   // They're too important for me to tell anyone I meet!
};

instance DIA_KDF_4569_AlexOne_WhoYou(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhoYou_condition;
   information = DIA_KDF_4569_AlexOne_WhoYou_info;
   permanent = FALSE;
   description = " Are you a Fire Mage? " ;
};

func int DIA_KDF_4569_AlexOne_WhoYou_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDF_4569_AlexOne_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhoYou_info()
{
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_00 " );   // Are you a fire mage?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhoYou_01_01 " );   // As you can see. What surprises you?
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_02 " );   // I don't remember meeting you at the monastery of Khorinis.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhoYou_01_03 " );   // I've been accepted into the Circle of Fire here at the colony. I don't know anything about the monastery.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_04 " );   // Interesting! And who accepted you into the Circle?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhoYou_01_05 " );   // (important) Master Corristo himself! And it is on his behalf that I am here now.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_06 " );   // But Corristo and the other Firebenders are long dead! Killed on the orders of Gomez.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhoYou_01_07 " );   // What are you talking about?! How can this be? Are you crazy?
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_08 " );   // So you don't know anything?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhoYou_01_09 " );   // What should I know?!
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_10 " );   // When the Old Mine collapsed, Gomez flew into a rage and decided to attack the New Camp.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_11 " );   // The Fire Mages were against this idea, and he simply ordered them to be killed.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhoYou_01_12 " );   // Oh Innos... Is it true?
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_13 " );   // You can be sure. And now paladins have settled in the castle of the Old Camp, after which the orcs laid siege to it.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhoYou_01_14 " );   // How is this possible?! Although I haven't been to the Old Camp for several years.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhoYou_01_15 " );   // There really could change a lot! But what I heard from you breaks my heart.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhoYou_01_16 " );   // Hold on, buddy! This is not the worst thing that has happened in recent days.
};

instance DIA_KDF_4569_AlexOne_WhatBow(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhatBow_condition;
   information = DIA_KDF_4569_AlexOne_WhatBow_info;
   permanent = FALSE;
   description = " Why do you need a crossbow? " ;
};

func int DIA_KDF_4569_AlexOne_WhatBow_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDF_4569_AlexOne_WhoYou) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhatBow_info()
{
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatBow_01_00 " );   // Why do you need a crossbow?
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatBow_01_01 " );   // You're a mage. Don't you have enough magic rune powers to protect yourself?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatBow_01_02 " );   // Yes, I am a magician, but more in words than in deeds...
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatBow_01_03 " );   // Unfortunately, my training was never completed.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatBow_01_04 " );   // Therefore, my magical abilities are not as great as those of other magicians.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatBow_01_05 " );   // Another thing - a crossbow! From an early age, my father taught me how to handle it.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatBow_01_06 " );   // I treat him no worse than a skilled warrior with a sword or a magician with a staff.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatBow_01_07 " );   // So, a crossbow mage. Yes, it's funny.
};

instance DIA_KDF_4569_AlexOne_WhatDeal(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhatDeal_condition;
   information = DIA_KDF_4569_AlexOne_WhatDeal_info;
   permanent = FALSE;
   description = " So what's your business here? " ;
};

func int DIA_KDF_4569_AlexOne_WhatDeal_condition()
{
   if (( MIS_PashalQuest == LOG_Running ) && ( Npc_KnowsInfo ( other , DIA_KDF_4569_AlexOne_WhoYou ) ==  TRUE ))
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhatDeal_info()
{
   B_GivePlayerXP(300);
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_00 " );   // So what's your business here?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_01 " );   // Eh... It hardly matters now.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_02 " );   // And yet, maybe you can tell?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_03 " );   // Okay. If you're that interested.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_04 " );   // Master Corristo sent me to find some information about an ancient artifact in this valley.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_05 " );   // Isn't that the one they were going to use to break the magic barrier?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_06 " );   // (surprised) Yes, about him! And how do you know about it?
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_07 " );   // Milten told me about it.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_08 " );   // Then you should already know everything. I have nothing more to add.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_09 " );   // But did you find anything?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_10 " );   // Of course, I could not find the artifact itself.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_11 " );   // But I'm sure I've found a trail that could lead me to it.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_12 " );   // And what is this?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_13 " );   // On the other side of this pond, below us, is an abandoned crypt.
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_14 " );   // I can assume that this artifact can be located there!
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_15 " );   // Well, or at least something that will allow us to determine its exact location.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_16 " );   // What can be there?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_17 " );   // You're asking me like I've been there before.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_18 " );   // Then why don't you just go there and find out?
   AI_Output(self,other, " DIA_KDF_4569_AlexOne_WhatDeal_01_19 " );   // The entrance to the crypt is closed! And I don't know how to open it.
   AI_Output(other,self, " DIA_KDF_4569_AlexOne_WhatDeal_01_20 " );   // Got it.
   B_LogEntry(TOPIC_PashalQuest, " I met Firemage Lex near the tower of Xardas. He is the man Corristo sent to find the artifact. Lex is sure that the clue to the location of this item is hidden in an abandoned crypt nearby, but the entrance to the crypt is closed . " );
   PashalQuestPentaStep = TRUE;
};

instance DIA_VLK_4570_Avabul_EXIT(C_Info)
{
   npc = VLK_4570_Avabul;
   nr = 999;
   condition = DIA_VLK_4570_Avabul_exit_condition;
   information = DIA_VLK_4570_Avabul_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_VLK_4570_Avabul_exit_condition()
{
   return TRUE;
};

func void DIA_VLK_4570_Avabul_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_VLK_4570_Avabul_HELLO(C_Info)
{
   npc = VLK_4570_Avabul;
   nr = 1;
   condition = DIA_VLK_4570_Avabul_HELLO_condition;
   information = DIA_VLK_4570_Avabul_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_VLK_4570_Avabul_HELLO_condition()
{
	if ((MY_PashalQuest == LOG_Running) && (AvailableIsUp ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_VLK_4570_Avabul_HELLO_info()
{
   B_GivePlayerXP(1000);
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_00 " );   // Who called to me?! Who dares to disturb my sacred rest?!
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_01 " );   // That was me.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_02 " );   // (disparagingly) Of course! Another mortal who seeks power and might for himself.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_03 " );   // But trust me, you absolutely don't need them! Death suits you better, you miserable worms...
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_04 " );   // Hey, not so fast, beauty! Answer at least one of my questions.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_05 " );   // What?! And you still have the audacity to ask me about it?
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_06 " );   // Though... why not.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_07 " );   // It will give me pleasure to see your pitiful pleas to spare you your miserable life.
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_08 " );   // You're wrong! I wanted to ask something completely different.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_09 " );   // Really?! And about what?
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_10 " );   // About an artifact whose power is able to control this world.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_11 " );   // (laughs) Ah, that's it! Well, of course...
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_12 " );   // You, like that necromancer, imagined yourself to be a great and powerful magician.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_13 " );   // And you hope I'll tell you where to find it!
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_14 " );   // Something like that.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_15 " );   // Naivety itself... (laughs) Tell me, why do you need it, mortal?
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_16 " );   // Do you really think you can handle the power of this item?
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_17 " );   // Well, I don't know yet myself.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_18 " );   // Don't know what?
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_19 " );   // Why did I even give up this artifact.
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_20 " );   // It just so happens that I heard about him, and my path led me here.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_21 " );   // Hmmm. How interesting!
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_22 " );   // You know, it's hard to believe that a person who is looking for the most powerful relic of this world has absolutely no idea what he needs it for.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_23 " );   // (cryptically) But I sense you're telling me the truth, mortal.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_24 " );   // So I'll spare your life and won't turn you into an insensitive undead like I did with that upstart mage!
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_25 " );   // Thank you very much! Perhaps you can answer my question at the same time?
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_26 " );   // The artifact you're looking for is named Nivram! It was created by the creators of this world, so that it would be more convenient for them to manage it.
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_27 " );   // Are you talking about Guardians?
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_28 " );   // (with interest) Do you know about them too?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_29");   //Немного.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_30 " );   // They are the best! To prevent the possibility of this artifact being used by anyone else, they hid it securely.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_31 " );   // But where exactly, no one knows. Even the gods.
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_32 " );   // Then there's no point in continuing to look for it.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_33 " );   // Yes, you're right. For you, absolutely nothing.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_34 " );   // However, my master has been wanting this item for a long time.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_35 " );   // And he could help you find him. Naturally, in exchange for the power and power that you mortals are always so eager to acquire!
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_36 " );   // And why shouldn't Beliar look for this artifact himself, if he needs it so much?
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_37 " );   // He doesn't want to draw too much attention from the Guardians.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_38 " );   // So it's better when some things are done by mere mortals like you.
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_39 " );   // You mean dirty work.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_40 " );   // (imperiously) It doesn't matter. What matters is what you end up with at the end of this journey. And my master offers a lot!
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_41 " );   // So, do you agree?
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_42 " );   // And if I disagree, what then?
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_43 " );   // Then you're just a fool, and I'm wasting my time with you now!
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_44 " );   // Okay, okay... I see you're a serious lady. Yes, and extra power will not hurt me.
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_45 " );   // I agree!
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_46 " );   // Great! Just remember: you gave your word to Beliar himself! And just like that, you can’t refuse it now.
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_47 " );   // Let's get down to business.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_48 " );   // All right, mortal. First of all, you need to find the oldest of the ancients. Once, his name was Janus Two-faced.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_49 " );   // Maybe he remembers something about this artifact.
   AI_Output(other,self, " DIA_VLK_4570_Avabul_HELLO_01_50 " );   // And where can I find it?
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_51 " );   // As far as I know, he guards one of the Guardians' own relics.
   AI_Output(self,other, " DIA_VLK_4570_Avabul_HELLO_01_52 " );   // Now go! No more time to waste talking.
   B_LogEntry(TOPIC_PashalQuest, " Using the skull of a powerful demon, I managed to summon one of the dark priestesses of Beliar - Avabul. According to her, even Beliar himself wants to get this artifact! In the end, I agreed to help Avabul find this artifact for Beliar, in exchange for the offer them power and might. Now I need to find Janus Two-Face - the oldest of the ancients, someone who can remember something about this artifact. According to the priestess, Janus guards one of the relics of the Guardians. " );
   AI_StopProcessInfos(self);
   PaschalQuestJanusStep = TRUE ;
};

instance DIA_DMT_4571_Jan_EXIT(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 999;
   condition = DIA_DMT_4571_Jan_exit_condition;
   information = DIA_DMT_4571_Jan_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_DMT_4571_Jan_exit_condition()
{
   return TRUE;
};

func void DIA_DMT_4571_Jan_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_DMT_4571_Jan_HELLO(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_HELLO_condition;
   information = DIA_DMT_4571_Jan_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_DMT_4571_Jan_HELLO_condition()
{
	return TRUE;
};

func void DIA_DMT_4571_Jan_HELLO_info()
{
   AI_Output(self,other, " DIA_DMT_4571_Jan_HELLO_01_00 " );   // Stop, mortal! There is no further way for you!
   AI_Output(other,self, " DIA_DMT_4571_Jan_HELLO_01_01 " );   // Why is this?
   AI_Output(self,other, " DIA_DMT_4571_Jan_HELLO_01_02 " );   // Only the chosen ones are allowed to enter here. And you are not one of them!
   AI_Output(self,other, " DIA_DMT_4571_Jan_HELLO_01_03 " );   // So turn back if you value your life.
   AI_Output(other,self, " DIA_DMT_4571_Jan_HELLO_01_04 " );   // What if I don't?
   AI_Output(self,other, " DIA_DMT_4571_Jan_HELLO_01_05 " );   // Then you will die. So did the others who tried to get in here.
};

instance DIA_DMT_4571_Jan_WRATH(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_WRATH_condition;
   information = DIA_DMT_4571_Jan_WRATH_info;
   permanent = FALSE;
   description = " You think I can't handle you? " ;
};

func int DIA_DMT_4571_Jan_WRATH_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_HELLO) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_WRATH_info()
{
   AI_Output(other,self, " DIA_DMT_4571_Jan_WRATH_01_00 " );   // Think I can't handle you?
   AI_Output(self,other, " DIA_DMT_4571_Jan_WRATH_01_01 " );   // (laughs) You can try, mortal!
   AI_Output(self,other, " DIA_DMT_4571_Jan_WRATH_01_02 " );   // But you'll only waste your time and life in a pathetic attempt to defeat me.
   AI_Output(self,other, " DIA_DMT_4571_Jan_WRATH_01_03 " );   // Those who put me in charge of this path endowed me with great strength and power.
   AI_Output(self,other, " DIA_DMT_4571_Jan_WRATH_01_04 " );   // And made one of the immortal Guardians of Eternity!
   AI_Output(self,other, " DIA_DMT_4571_Jan_WRATH_01_05 " );   // However, to a pathetic worm like you, this probably means nothing.
   AI_Output(self,other, " DIA_DMT_4571_Jan_WRATH_01_06 " );   // So you better turn back!
   AI_Output(self,other, " DIA_DMT_4571_Jan_WRATH_01_07 " );   // Here you will find nothing but your own death.
};

instance DIA_DMT_4571_Jan_Pashal (C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_Pashal_condition;
   information = DIA_DMT_4571_Jan_Pashal_info;
   permanent = FALSE;
   description = " So you are Janus Two-Face? " ;
};

func int DIA_DMT_4571_Jan_Pashal_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_HELLO) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Pashal_info()
{
   B_GivePlayerXP(1500);
   AI_Output(other,self, " DIA_DMT_4571_Jan_Pashal_01_00 " );   // So you are Janus Two-faced? And I was looking for you!
   AI_Output(self,other, " DIA_DMT_4571_Jan_Pashal_01_01 " );   // You were looking for me, mortal? But why, may I ask?
   AI_Output(other,self, " DIA_DMT_4571_Jan_Pashal_01_02 " );   // A priestess of Beliar named Avabul told me about you.
   AI_Output(other,self, " DIA_DMT_4571_Jan_Pashal_01_03 " );   // According to her, you may know the fate of one of the oldest artifacts.
   AI_Output(other,self, " DIA_DMT_4571_Jan_Pashal_01_04 " );   // They call him Nivram. Have you heard anything about him?
   AI_Output(self,other, " DIA_DMT_4571_Jan_Pashal_01_05 " );   // I never would have thought that I would ever hear such a question from an ordinary person.
   AI_Output(self,other, " DIA_DMT_4571_Jan_Pashal_01_06 " );   // It turns out that you are the messenger of Beliar, since Avabul herself sent you.
   AI_Output(other,self, " DIA_DMT_4571_Jan_Pashal_01_07 " );   // Does this change anything?
   AI_Output(self,other, " DIA_DMT_4571_Jan_Pashal_01_08 " );   // No, absolutely nothing.
   AI_Output(self,other, " DIA_DMT_4571_Jan_Pashal_01_09 " );   // But if the powers that be trust you to keep such secrets, then, apparently, this is not just.
   AI_Output(other,self, " DIA_DMT_4571_Jan_Pashal_01_10 " );   // Then maybe you can tell me about this artifact?
   AI_Output(self,other, " DIA_DMT_4571_Jan_Pashal_01_11 " );   // The story will be short. For the answer to your question is behind these doors.
   AI_Output(self,other, " DIA_DMT_4571_Jan_Pashal_01_12 " );   // However, as I said, you will not enter them until I myself decide to let you in.
   B_LogEntry(TOPIC_PashalQuest, " I found Janus Two-Face. He said that the answer to my question lies behind the huge gate he guards. However, I won't be able to pass through it until Janus himself gives me permission to do so. " );
};

instance DIA_DMT_4571_Jan_Dual(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 2;
   condition = DIA_DMT_4571_Jan_Dual_condition;
   information = DIA_DMT_4571_Jan_Dual_info;
   permanent = FALSE;
   description = " Why are you called Two-Face? " ;
};

func int DIA_DMT_4571_Jan_Dual_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Dual_info()
{
	AI_Output(other,self, " DIA_DMT_4571_Jan_Dual_01_00 " );   // Why are you called Two-Face?
	AI_Output(self,other, " DIA_DMT_4571_Jan_Dual_01_01 " );   // As you may have noticed, mortal, I wear a golden mask.
	AI_Output(self,other, " DIA_DMT_4571_Jan_Dual_01_02 " );   // Throughout my life, she hid my true face from people.
	AI_Output(other,self,"DIA_DMT_4571_Jan_Dual_01_03");   //Зачем?
	AI_Output(self,other, " DIA_DMT_4571_Jan_Dual_01_04 " );   // There were reasons for that. However, that is why they called me Two-Face.
	AI_Output(self,other, " DIA_DMT_4571_Jan_Dual_01_05 " );   // True, what it hides now can hardly be called a face.
	AI_Output(self,other, " DIA_DMT_4571_Jan_Dual_01_06 " );   // But, as you can see, the habit of wearing a mask has remained to this day.
};

instance DIA_DMT_4571_Jan_His(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 2;
   condition = DIA_DMT_4571_Jan_His_condition;
   information = DIA_DMT_4571_Jan_His_info;
   permanent = FALSE;
   description = " Who were you when you were alive? " ;
};

func int DIA_DMT_4571_Jan_His_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_His_info()
{
	AI_Output(other,self, " DIA_DMT_4571_Jan_His_01_00 " );   // And who were you in life?
	AI_Output(self,other, " DIA_DMT_4571_Jan_His_01_01 " );   // I was a dragon hunter.
	AI_Output(other,self, " DIA_DMT_4571_Jan_His_01_02 " );   // Have you fought dragons?
	AI_Output(self,other, " DIA_DMT_4571_Jan_His_01_03 " );   // And more than once. In the days when I lived, dragons weren't as rare as they are now.
	AI_Output(self,other, " DIA_DMT_4571_Jan_His_01_04 " );   // In one of these battles, I died.
	AI_Output(self,other, " DIA_DMT_4571_Jan_His_01_05 " );   // True, as you can see, my stay in this world did not end there. Now I am the guardian of these gates.
	AI_Output(other,self, " DIA_DMT_4571_Jan_His_01_06 " );   // And what is hidden behind them?
	AI_Output(self,other, " DIA_DMT_4571_Jan_His_01_07 " );   // You yourself will find out about this - if, of course, you prove yourself worthy of this honor.
};

instance DIA_DMT_4571_Jan_Proof(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_Proof_condition;
   information = DIA_DMT_4571_Jan_Proof_info;
   permanent = FALSE;
   description = " What should I do to convince you? " ;
};

func int DIA_DMT_4571_Jan_Proof_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Proof_info()
{
	AI_Output(other,self, " DIA_DMT_4571_Jan_Proof_01_00 " );   // What should I do to convince you?
	AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_01 " );   // You will have to pass my test. But it won't be easy.
	AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_02 " );   // Are you really sure you're ready for it?
	AI_Output(other,self, " DIA_DMT_4571_Jan_Proof_01_03 " );   // Absolutely! Come on, tell me already - what is it?
	AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_04 " );   // Good. Since you are the messenger of Beliar, I will ask you to bring me the soul of his Chosen One!
	AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_05 " );   // The soul of the one who is his essence, his strength and his power in this world.
	AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_06 " );   // If the Dark God really wants to get this artifact, then he will have to pay dearly for it.
	AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_07 " );   // Otherwise, these doors will never open for you.

	if(UndeadDragonIsDead == FALSE)
	{
		AI_Output(other,self, " DIA_DMT_4571_Jan_Proof_01_08 " );   // Good. Where can I look for it?
		AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_09 " );   // In one of the sacred temples of Beliar himself, of course! Where else.
		AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_10 " );   // But I doubt you'll be able to get to even one of them.
		AI_Output(other,self, " DIA_DMT_4571_Jan_Proof_01_11 " );   // Well, we'll see about that later. Somehow I got here.
		AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_12 " );   // Which, to tell the truth, surprises me a lot.
		AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_13 " );   // However, you don't come across as someone capable of defeating one of the most powerful creatures in this world.
		AI_Output(self,other, " DIA_DMT_4571_Jan_Proof_01_14 " );   // And I will change my mind only when I see the soul of this creature in front of me.
	};

	B_LogEntry(TOPIC_PashalQuest, " Janus will let me through if I bring him the soul of Beliar's Chosen One! " );
};

instance DIA_DMT_4571_Jan_ProofDone(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_ProofDone_condition;
   information = DIA_DMT_4571_Jan_ProofDone_info;
   permanent = FALSE;
   description = " Here is the soul of Chosen Beliar! " ;
};

func int DIA_DMT_4571_Jan_ProofDone_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Proof) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE) && (Npc_HasItems(other,ItAt_UndeadDragonSoulStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_ProofDone_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_DMT_4571_Jan_ProofDone_01_00 " );   // Here is the soul of the Chosen Beliar!
	AI_Output(self,other, " DIA_DMT_4571_Jan_ProofDone_01_01 " );   // Truly this is it. I bow before you, O great warrior!
	AI_Output(other,self, " DIA_DMT_4571_Jan_ProofDone_01_02 " );   // Now will you let me through?
	AI_Output(self,other, " DIA_DMT_4571_Jan_ProofDone_01_03 " );   // As promised. Just place the soul you brought on the altar behind you.
	AI_Output(self,other, " DIA_DMT_4571_Jan_ProofDone_01_04 " );   // After that, the doors will open and you can go through.
	B_LogEntry(TOPIC_PashalQuest, " I brought a soul to Janus. Now you need to put it on the altar that is nearby, and after that the doors should open. " );
	PaschalQuestEgezartStep = TRUE ;
	AI_StopProcessInfos(self);
};

instance DIA_DMT_4572_Trazege_EXIT(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 999;
   condition = DIA_DMT_4572_Trazege_exit_condition;
   information = DIA_DMT_4572_Trazege_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_DMT_4572_Trazege_exit_condition()
{
   return TRUE;
};

func void DIA_DMT_4572_Trazege_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_DMT_4572_Trazege_HELLO(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_HELLO_condition;
   information = DIA_DMT_4572_Trazege_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_DMT_4572_Trazege_HELLO_condition()
{
	if(XranFregIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_HELLO_info()
{
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_00 " );   // What do you want here?! And how did you even get here?
	AI_Output(other,self, " DIA_DMT_4572_Trazege_HELLO_01_01 " );   // Through a magical portal.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_02 " );   // (grinning) I figured that out myself, smart guy.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_03 " );   // I'm interested in something else - why the hell did Janus let you in here?!
	AI_Output(other,self, " DIA_DMT_4572_Trazege_HELLO_01_04 " );   // I passed his test and thus proved that I am worthy of it.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_05 " );   // Worthy? And what did you do, hero?
	AI_Output(other,self, " DIA_DMT_4572_Trazege_HELLO_01_06 " );   // I killed the Chosen One of Beliar himself! Is this not enough?
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_07 " );   // (carelessly) To be honest, I'm not that impressed.
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_08");   //Почему?
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_09 " );   // I'm already used to the fact that his chosen ones do not live very long in this world.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_10 " );   // Be sure to find someone who, with enviable constancy, sends them back to their master in the kingdom of Darkness!
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_11 " );   // So you're not the first or the last to do this.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_12 " );   // And Beliar himself has long been looking for a new replacement. So you see - history repeats itself again!
	AI_Output(other,self, " DIA_DMT_4572_Trazege_HELLO_01_13 " );   // And who is his chosen one now?
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_14 " );   // As far as I know, Xardas is a powerful dark mage.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_15 " );   // Well. Let's see how long it lasts.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_16 " );   // But enough of the empty talk! If you wanted to earn my attention, then you did it.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_HELLO_01_17 " );   // Now answer immediately, why did you come here?
};

instance DIA_DMT_4572_Trazege_GiveMePower (C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_GiveMePower_condition;
   information = DIA_DMT_4572_Trazege_GiveMePower_info;
   permanent = FALSE;
   description = " I'm looking for one artifact. " ;
};

func int DIA_DMT_4572_Trazege_GiveMePower_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_HELLO) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_GiveMePower_info()
{
	B_GivePlayerXP(5000);
	AI_Output(other,self, " DIA_DMT_4572_Trazege_GiveMePower_01_00 " );   // I'm looking for one artifact. It is called Nivram.
	AI_Output(other,self, " DIA_DMT_4572_Trazege_GiveMePower_01_01 " );   // As far as I know, with it...
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_02 " );   // You don't have to continue. I already understood everything.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_03 " );   // You, apparently, are one of those who, with the help of it, want to get unlimited power and power in this world.
	AI_Output(other,self, " DIA_DMT_4572_Trazege_GiveMePower_01_04 " );   // Well, not really. Beliar wants to get him.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_05 " );   // (laughs) Who does this miserable god think he is!
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_06 " );   // No one - neither he nor his brother Innos - will ever receive this artifact.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_07 " );   // They are too greedy and selfish to wield his unlimited power.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_08 " );   // Perhaps I would give it to Adanos, but he is too wise to accept this gift.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_09 " );   // So if you don't mind, I'll keep it for myself.
	AI_Output(other,self, " DIA_DMT_4572_Trazege_GiveMePower_01_10 " );   // Why do you need it?
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_12 " );   // With the help of this artifact, I monitor the balance of this world, correcting the mistakes of all the same gods.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_13 " );   // I am the one thanks to whom this world still lives and breathes! And you including.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_14 " );   // Therefore, he will remain here until the time comes to destroy this world and rebuild it anew.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_GiveMePower_01_15 " );   // And believe me, it will be so!
	B_LogEntry(TOPIC_PashalQuest, " Inside the temple, I met Egezart, the guardian of the artifact I was interested in. As expected, he didn't want to give it to me. " );
};

instance DIA_DMT_4572_Trazege_NoAtAll(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_NoAtAll_condition;
   information = DIA_DMT_4572_Trazege_NoAtAll_info;
   permanent = FALSE;
   description = " What if I take it from you by force? " ;
};

func int DIA_DMT_4572_Trazege_NoAtAll_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_GiveMePower) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_NoAtAll_info()
{
	AI_Output(other,self, " DIA_DMT_4572_Trazege_NoAtAll_01_00 " );   // What if I take it from you by force?
	AI_Output(self,other, " DIA_DMT_4572_Trazege_NoAtAll_01_01 " );   // (laughs) Stupid!
	AI_Output(self,other, " DIA_DMT_4572_Trazege_NoAtAll_01_02 " );   // Do you think your weapons or magic can harm me?
	AI_Output(self,other, " DIA_DMT_4572_Trazege_NoAtAll_01_03 " );   // I just need to think, and you will die in terrible agony right here.
	AI_PlayAni(hero,"T_INSANE");
	AI_Output(self,other, " DIA_DMT_4572_Trazege_NoAtAll_01_04 " );   // Well, now you understand all the absurdity of your idea?
	AI_Output(other,self, " DIA_DMT_4572_Trazege_NoAtAll_01_05 " );   // Ok, I got it! Just don't do it again.
	B_LogEntry(TOPIC_PashalQuest, " I was going to take the artifact from Egezart by force, but I realized in time that I would never win this fight. " );
};

instance DIA_DMT_4572_Trazege_BuyGift(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_BuyGift_condition;
   information = DIA_DMT_4572_Trazege_BuyGift_info;
   permanent = FALSE;
   description = " What should I do now? " ;
};

func int DIA_DMT_4572_Trazege_BuyGift_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_NoAtAll) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_BuyGift_info()
{
	AI_Output(other,self, " DIA_DMT_4572_Trazege_BuyGift_01_00 " );   // And what should I do now?
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_01_01 " );   // You'd better leave and never come back here again!
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_01_02 " );   // The artifact you were looking for will be here forever.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_01_03 " );   // Well, or, at least, until its Creators themselves decide its future fate.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_01_04 " );   // As for you... You must have traveled a very long and dangerous path during all this time.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_01_05 " );   // All this, of course, deserves respect. Therefore, with empty hands, I will not let you go.
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_01_06 " );   // Choose your reward, mortal. And be wise in your decision.
	B_LogEntry(TOPIC_PashalQuest, " I resigned myself to the fact that I will never get this item. It will forever remain here, inside this temple. However, I did not leave there empty-handed - Egezart gave me a gift for being able to get to it. I think this is the end of this story. " );
   	Info_ClearChoices(DIA_DMT_4572_Trazege_BuyGift);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift, " Give me life and stamina! " ,DIA_DMT_4572_Trazege_BuyGift_Hp);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift, " Give me wisdom and knowledge! " ,DIA_DMT_4572_Trazege_BuyGift_Mana);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift, " Make me incredibly dexterous! " ,DIA_DMT_4572_Trazege_BuyGift_Dex);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift, " Give me great power! " ,DIA_DMT_4572_Trazege_BuyGift_Str);
};

func void DIA_DMT_4572_Trazege_BuyGift_Str()
{
	AI_Output(other,self, " DIA_DMT_4572_Trazege_BuyGift_Str_01_00 " );   // Grant me great power!
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,50);
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_Str_01_01 " );   // As you say. You made your choice! Now goodbye.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Dex()
{
	AI_Output(other,self, " DIA_DMT_4572_Trazege_BuyGift_Dex_01_00 " );   // Make me incredibly dexterous!
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,50);
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_Dex_01_01 " );   // As you say. You made your choice! Now goodbye.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Mana()
{
	AI_Output(other,self, " DIA_DMT_4572_Trazege_BuyGift_Mana_01_00 " );   // Grant me wisdom and knowledge!
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,150);
	Npc_ChangeAttribute(other,ATR_MANA,150);
	ATR_INTELLECT += 20;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_Mana_01_01 " );   // As you say. You made your choice! Now goodbye.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Hp()
{
	var int TempStaminaMax;

	AI_Output(other,self, " DIA_DMT_4572_Trazege_BuyGift_Hp_01_00 " );   // Grant me life and stamina!
	B_RaiseAttribute(other,ATR_HITPOINTS_MAX,500);
	Npc_ChangeAttribute(other,ATR_HITPOINTS,500);

	if(ATR_STAMINA_MAX[0] <= 90)
	{
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 10;
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	}
	else
	{
		TempStaminaMax = 100 - ATR_STAMINA_MAX[0];
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + TempStaminaMax;
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	};

	AI_Output(self,other, " DIA_DMT_4572_Trazege_BuyGift_Hp_01_01 " );   // As you say. You made your choice! Now goodbye.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

instance DIA_KDW_4573_Oddler_EXIT(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 999;
   condition = DIA_KDW_4573_Oddler_exit_condition;
   information = DIA_KDW_4573_Oddler_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_KDW_4573_Oddler_exit_condition()
{
   return TRUE;
};

func void DIA_KDW_4573_Oddler_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_KDW_4573_Oddler_HELLO(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_HELLO_condition;
   information = DIA_KDW_4573_Oddler_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_KDW_4573_Oddler_HELLO_condition()
{
   return TRUE;
};

func void DIA_KDW_4573_Oddler_HELLO_info()
{
   AI_Output(self,other, " DIA_KDW_4573_Oddler_HELLO_01_00 " );   // Greetings, traveler. Are you lost?
   AI_Output(other,self, " DIA_KDW_4573_Oddler_HELLO_01_01 " );   // Where did you get it from?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_HELLO_01_02 " );   // This place is too dangerous for ordinary walks.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_HELLO_01_03 " );   // No one in their right mind would dare to come here just like that.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_HELLO_01_04 " );   // Therefore, you are either lost or perhaps looking for something.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_HELLO_01_05 " );   // And it's something so important to you that you're willing to risk your life for it.
};

instance DIA_KDW_4573_Oddler_WhoYou(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_WhoYou_condition;
   information = DIA_KDW_4573_Oddler_WhoYou_info;
   permanent = FALSE;
   description = " What are you doing here? " ;
};

func int DIA_KDW_4573_Oddler_WhoYou_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_WhoYou_info()
{
  AI_Output(other,self, " DIA_KDW_4573_Oddler_WhoYou_01_00 " );   // What are you doing here?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_WhoYou_01_01 " );   // As you can see, I live. For me, there is simply no better place to be.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_WhoYou_01_02 " );   // Peace and quiet is all I need. And, most importantly, away from people.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_WhoYou_01_03 " );   // And you're not at all worried about the fact that the area may be full of orcs or other predatory creatures?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_WhoYou_01_04 " );   // Orcs are not here. Their camps are in another part of these mountains.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_WhoYou_01_05 " );   // As for everything else, I'll deal with that somehow.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_WhoYou_01_06 " );   // (smiling) I'm still a magician.
};

instance DIA_KDW_4573_Oddler_Mage(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Mage_condition;
   information = DIA_KDW_4573_Oddler_Mage_info;
   permanent = FALSE;
   description = " So you're also a magician? " ;
};

func int DIA_KDW_4573_Oddler_Mage_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_WhoYou) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Mage_info()
{
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mage_01_00 " );   // So you're also a mage?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_01 " );   // Waterbender, to be more precise.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mage_01_02 " );   // From the New Camp?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_03 " );   // (thoughtfully) Hmmm. What is New Camp?
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mage_01_04 " );   // The one in the Valley of Mines, of course.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_05 " );   // Sorry, but I've never heard of him.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mage_01_06 " );   // Then where are you from?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_07 " );   // I myself come from Silden. This is a small town in Myrtana.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mage_01_08 " );   // And how did you end up in Khorinis?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_09 " );   // Sailed here on a ship, how else.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_10");   //Зачем?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_11 " );   // I had a message for Archfiremage Corristo.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_12 " );   // He was a teacher in the monastery of Innos, which was located on this island.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_13 " );   // True, that was a long time ago. More than a dozen years have passed since then.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mage_01_14 " );   // Okay. And how did you get here?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_15 " );   // Together with the rest of the Firebenders, I took part in one of the research expeditions.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_16 " );   // We wanted to explore these mountains better and maybe find something interesting here.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_17 " );   // I ended up being captured by the orcs instead.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_18 " );   // They'd kill me if I wasn't a mage! But for some reason their high shaman became interested in my magic.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_19 " );   // That saved my life.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_20 " );   // A few years later, I managed to escape from their camp.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_21 " );   // Wandering through the mountains, I came across this place. And now I live here.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mage_01_22 " );   // That, in fact, is the whole story.
};

instance DIA_KDW_4573_Oddler_Blind(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Blind_condition;
   information = DIA_KDW_4573_Oddler_Blind_info;
   permanent = FALSE;
   description = " You are blindfolded. " ;
};

func int DIA_KDW_4573_Oddler_Blind_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Blind_info()
{
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Blind_01_00 " );   // You're blindfolded. Are you blind?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Blind_01_01 " );   // (sigh) Yes. As you see.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Blind_01_02 " );   // How did this happen?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Blind_01_03 " );   // To make it impossible for me to even think of escaping, the orcs gouged out my eyes.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Blind_01_04 " );   // At first, of course, it was unbearably hard. I couldn't even walk two meters without someone's help.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Blind_01_05 " );   // But over time, my other senses became more acute, such as hearing or smell.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Blind_01_06 " );   // All this helped me survive here. Now I do not have to be sighted to understand who is standing in front of me.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Blind_01_07 " );   // By the way, you just climbed this mountain, and I already knew that someone was coming here.
};

instance DIA_KDW_4573_Oddler_Away(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Away_condition;
   information = DIA_KDW_4573_Oddler_Away_info;
   permanent = FALSE;
   description = " Would you like to get out of here? " ;
};

func int DIA_KDW_4573_Oddler_Away_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Away_info()
{
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Getout_01_00 " );   // Would you like to get out of here?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Getout_01_01 " );   // No. I like it here! It's quiet and calm here.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Getout_01_02 " );   // In addition, crossing the mountains will be extremely dangerous.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Getout_01_03 " );   // Without proper preparation, one can easily die.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Getout_01_04 " );   // Or worse, get captured by orcs.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Getout_01_05 " );   // So these thoughts come to me less and less.
};

instance DIA_KDW_4573_Oddler_Mount(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Mount_condition;
   information = DIA_KDW_4573_Oddler_Mount_info;
   permanent = FALSE;
   description = " What's interesting in the mountains? " ;
};

func int DIA_KDW_4573_Oddler_Mount_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Mount_info()
{
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mount_01_00 " );   // What is there interesting in the mountains?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mount_01_01 " );   // Nothing special.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mount_01_02 " );   // Somewhere down there should be a small fort.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mount_01_03 " );   // It was built by the paladins who accompanied us on that ill-fated expedition.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mount_01_04 " );   // Nearby is an ancient orc shrine. There they captured me.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mount_01_05 " );   // And where is their camp itself?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mount_01_06 " );   // Far from here. At the other end of these mountains.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mount_01_07 " );   // But I do not advise you to go there, unless, of course, you want to share my fate.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mount_01_08 " );   // Got it. Nothing else?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Mount_01_09 " );   // That's all I know. I have nothing more to add.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Mount_01_10 " );   // Okay, thank you.
};

instance DIA_KDW_4573_Oddler_Work(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Work_condition;
   information = DIA_KDW_4573_Oddler_Work_info;
   permanent = FALSE;
   description = " What are you building here? " ;
};

func int DIA_KDW_4573_Oddler_Work_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Blind) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Work_info()
{
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Work_01_00 " );   // What are you building here?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Work_01_01 " );   // Are you blind too? Isn't it visible?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Work_01_02 " );   // I'm building a hut for myself.
   AI_Output(other,self, " DIA_KDW_4573_Oddler_Work_01_03 " );   // Why? Aren't you comfortable in the cave?
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Work_01_04 " );   // Of course, it is warm in it, but it does not always save from the local frosts.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Work_01_05 " );   // True, I don't have enough tools. A rusty saw is the only thing I could find here.
   AI_Output(self,other, " DIA_KDW_4573_Oddler_Work_01_06 " );   // And you can do a little with her alone.
};

instance DIA_KDW_4573_Oddler_WorkDo(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_WorkDo_condition;
   information = DIA_KDW_4573_Oddler_WorkDo_info;
   permanent = FALSE;
   description = " I can get some tools for you. " ;
};

func int DIA_KDW_4573_Oddler_WorkDo_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Blind) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_WorkDo_info()
{
	AI_Output(other,self, " DIA_KDW_4573_Oddler_WorkDo_01_00 " );   // I can get the tools for you.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_WorkDo_01_01 " );   // True? Well, then, perhaps, I will not refuse your help.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_WorkDo_01_02 " );   // I need a hammer, a new saw, and a pick to cut rocks.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_WorkDo_01_03 " );   // If you can get all this for me, I'd really appreciate it.
	AI_Output(other,self, " DIA_KDW_4573_Oddler_WorkDo_01_04 " );   // Agreed.
	MIS_OddlerlTools = LOG_Running;
	Log_CreateTopic(TOPIC_OddlerlTools,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OddlerlTools,LOG_Running);
	B_LogEntry(TOPIC_OddlerlTools, " Oddler needs new tools to build his hut. He asked for a hammer, a new saw, and a pickaxe. " );
};

instance DIA_KDW_4573_Oddler_Done(C_Info)
{
	npc = KDW_4573_Oddler;
	nr = 99;
	condition = DIA_KDW_4573_Oddler_Done_Condition;
	information = DIA_KDW_4573_Oddler_Done_Info;
	description = " Here are the new tools. " ;
};

func int DIA_KDW_4573_Oddler_Done_Condition()
{
	if ((MIS_OddlerlTools == LOG_Running) && (Npc_HasItems(other,ItMy_Hammer) >=  1 ) && (Npc_HasItems(other,ItMy_Saw) >=  1 ) && (Npc_HasItems(other,ItMw_2H_Axe_L_01) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_KDW_4573_Oddler_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_KDW_4573_Oddler_Done_01_00 " );	// Here are the new tools.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_Hammer,1);
	Npc_RemoveInvItems(hero,ItMi_Saw,1);
	Npc_RemoveInvItems(hero,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other, " DIA_KDW_4573_Oddler_Done_01_01 " );	// Thank you! Now the construction of the hut will go much faster.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_Done_01_02 " );	// Here, take this magic scroll as a token of my gratitude.
	B_GiveInvItems(self,other,ItSc_Shrink,1);
	MIS_OddlerlTools = LOG_Success;
	Log_SetTopicStatus(TOPIC_OddlerlTools,LOG_Success);
	B_LogEntry(TOPIC_OddlerlTools, " I brought Oddler the tools he needs. " );
};

instance DIA_KDW_4573_Oddler_XRANFREG(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_XRANFREG_condition;
   information = DIA_KDW_4573_Oddler_XRANFREG_info;
   permanent = FALSE;
   description = " Tell me about that expedition. " ;
};

func int DIA_KDW_4573_Oddler_XRANFREG_condition()
{
   if ((Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) ==  TRUE ) && ( MIS_XRANFREG  == LOG_Running ))
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_XRANFREG_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_KDW_4573_Oddler_XRANFREG_01_00 " );   // Tell me about that expedition.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_01 " );   // Eh. That was a long time ago!
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_02 " );   // Only Firebenders and a few paladins who volunteered as escorts took part in it.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_03 " );   // Master Corristo suggested that I go with them to help them explore this unknown part of the island.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_04 " );   // At first I thought about abandoning this dangerous undertaking.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_05 " );   // But Corristo was able to convince me of the need for my presence, and I decided to agree.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_06 " );   // Crossing the mountains was pretty easy for us.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_07 " );   // When we got here, Corristo ordered to build a small camp here, where we all settled.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_08 " );   // Later, some of the magicians went north, and the rest, including me, decided to explore the eastern part of these lands.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_09 " );   // So we stumbled upon an abandoned orc shrine.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_10 " );   // More precisely, it looked like an abandoned one, but in fact everything turned out differently.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_11 " );   // One fine day, when I was studying the ancient altars of the sanctuary, the orcs came there.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_12 " );   // Although I was accompanied by several paladins, the outcome of the battle was already a foregone conclusion.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_13 " );   // The orcs killed the paladins immediately. And when they saw that I was a magician, they decided to take me to the camp.
	AI_Output(self,other, " DIA_KDW_4573_Oddler_XRANFREG_01_14 " );   // This is where my story of participation in this expedition ends.
	B_LogEntry( TOPIC_XRANFREG , " Oddler is one of those who took part in the Fire Mage expedition. According to him, there is an ancient orc shrine to the east. I should pay a visit if the opportunity arises. " );
};

instance DIA_VLK_5570_Avabul_EXIT(C_Info)
{
   npc = VLK_5570_Avabul;
   nr = 999;
   condition = DIA_VLK_5570_Avabul_exit_condition;
   information = DIA_VLK_5570_Avabul_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_VLK_5570_Avabul_exit_condition()
{
   return TRUE;
};

func void DIA_VLK_5570_Avabul_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_VLK_5570_Avabul_HELLO(C_Info)
{
   npc = VLK_5570_Avabul;
   nr = 1;
   condition = DIA_VLK_5570_Avabul_HELLO_condition;
   information = DIA_VLK_5570_Avabul_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_VLK_5570_Avabul_HELLO_condition()
{
	if(MIS_PashalQuest == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_VLK_5570_Avabul_HELLO_info()
{
	AI_Output(self,other, " DIA_VLK_5570_Avabul_HELLO_01_00 " );   // Mortal! Have you obtained the artifact my lord is looking for?
	AI_Output(other,self, " DIA_VLK_5570_Avabul_HELLO_01_01 " );   // I'm afraid to disappoint you, but I don't have it.
	AI_Output(self,other, " DIA_VLK_5570_Avabul_HELLO_01_02 " );   // What did you say?!
	AI_Output(other,self, " DIA_VLK_5570_Avabul_HELLO_01_03 " );   // Are you deaf? I said I don't have it. His real owner did not want to part with him.
	AI_Output(self,other, " DIA_VLK_5570_Avabul_HELLO_01_04 " );   // I don't care. You should have brought it to me! It was part of our contract!
	AI_Output(other,self, " DIA_VLK_5570_Avabul_HELLO_01_05 " );   // Then you and your master will have to moderate their appetites a bit. The artifact will forever remain inside this temple, so forget about our agreement.
	AI_Output(self,other, " DIA_VLK_5570_Avabul_HELLO_01_06 " );   // How dare you?! Pitiful worm! You will die for your insolence!
	AI_Output(self,other, " DIA_VLK_5570_Avabul_HELLO_01_07 " );   // And when that happens, I'll play with your soul like a doll!
	Info_ClearChoices(DIA_VLK_5570_Avabul_HELLO);
	Info_AddChoice(DIA_VLK_5570_Avabul_HELLO,Dialog_Ende,DIA_VLK_5570_Avabul_HELLO_End);
};

func void DIA_VLK_5570_Avabul_HELLO_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	Wld_PlayEffect("SPELLFX_MASSDEATH_EXPLOSION",self,other,0,250,DAM_MAGIC,TRUE);
};
