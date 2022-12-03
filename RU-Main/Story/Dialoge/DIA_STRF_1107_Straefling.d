

instance DIA_STRF_1107_EXIT(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 999;
	condition = DIA_STRF_1107_EXIT_Condition;
	information = DIA_STRF_1107_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_1107_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_FINGER_Condition;
	information = DIA_STRF_1107_FINGER_Info;
	important = TRUE;
};


func int DIA_STRF_1107_FINGER_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_FINGER_Info()
{
	AI_Output(self,other, " DIA_STRF_1107_FINGER_01_00 " );	// Hands off my pots! No one is allowed to touch my pots, okay?!
	AI_Output(self,other, " DIA_STRF_1107_FINGER_01_01 " );	// I'm in charge of the food, which means no one else gets in my business! I hope I'm being clear!
};

instance DIA_STRF_1107_COOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOK_Condition;
	information = DIA_STRF_1107_COOK_Info;
	description = " Who appointed you as a chef? " ;
};

func int DIA_STRF_1107_COOK_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOK_Info()
{
	AI_Output(other,self, " DIA_STRF_1107_COOK_15_00 " );	// Who made you cook?
	AI_Output(self,other, " DIA_STRF_1107_COOK_01_01 " );	// Commander Garond. Before I became a prisoner, I was a cook at the Furious Boar.
	AI_Output(other, self, " DIA_STRF_1107_COOK_15_02 " );	// Why did you become a prisoner?
	AI_Output(self,other, " DIA_STRF_1107_COOK_01_03 " );	// Well, once there was a misunderstanding between one visitor and me...
};

var int ClifTeachCook;

instance DIA_STRF_1107_WHATCOOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_WHATCOOK_Condition;
	information = DIA_STRF_1107_WHATCOOK_Info;
	description = " What are you cooking now? " ;
};

func int DIA_STRF_1107_WHATCOOK_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_1107_COOK) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_WHATCOOK_Info()
{
	AI_Output(other,self, " DIA_STRF_1107_WHATCOOK_01_00 " );	// What are you cooking now?
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_01 " );	// Whatever they bring, I cook. You don't have to choose.
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_02 " );	// But if it comes to that, I'm the best at compotes.
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_03 " );	// (proudly) In them I'm almost a god, forgive me Innos.
	AI_Output(other,self, " DIA_STRF_1107_WHATCOOK_01_04 " );	// Maybe then you can teach me how to cook them?
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_05 " );	// You? (doubtful) Are you good at cooking?
	AI_Output(other,self,"DIA_STRF_1107_WHATCOOK_01_06");	//Ну, немного.
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_07 " );	// Okay though. There is almost nothing to do here anyway.
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_08 " );	// So be it, I'll teach you. But just don't think it's a gift.
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_09 " );	// For each recipe, I will charge you... at least fifty pieces of magic ore.
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_10 " );	// I don't need gold here, but ore is a completely different matter. Here she is a running commodity!
	AI_Output(self,other, " DIA_STRF_1107_WHATCOOK_01_11 " );	// If you know what I mean.
	ClifTeachCook = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry( TOPIC_COOK , " Cliff can teach me how to make compotes. But only for a small fee of magic ore! " );
};

instance DIA_STRF_1107_TeachCookDone(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 6;
	condition = DIA_STRF_1107_TeachCookDone_Condition;
	information = DIA_STRF_1107_TeachCookDone_Info;
	permanent = TRUE;
	description = " Teach me how to cook compotes. " ;
};

func int DIA_STRF_1107_TeachCookDone_Condition()
{
	if ((ClifTeachCook ==  TRUE ) && ((Rezept_Compote_01 ==  FALSE ) || (Rezept_Compote_02 ==  FALSE )))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_TeachCookDone_Info()
{
	AI_Output(other,self, " DIA_STRF_1107_TeachCookDone_01_00 " );	// Teach me how to cook compotes.
	AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_01_01 " );	// Good! Which one?
	Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	Info_AddChoice(DIA_STRF_1107_TeachCookDone,Dialog_Back,DIA_STRF_1107_TeachCookDone_back);

	if (Recipe_Compote_01 ==  FALSE )
	{
		Info_AddChoice(DIA_STRF_1107_TeachCookDone, " Wild Berry Compote (Price: 50 Ore) " ,DIA_STRF_1107_TeachCookDone_compote1);
	};
	if (Recipe_Compote_02 ==  FALSE )
	{
		Info_AddChoice(DIA_STRF_1107_TeachCookDone, " Wildberry Compote (Price: 100 Ore) " ,DIA_STRF_1107_TeachCookDone_compote2);
	};
};

func void DIA_STRF_1107_TeachCookDone_back()
{
	Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
};

func void DIA_STRF_1107_TeachCookDone_compote1()
{
	AI_Output(other,self, " DIA_Edda_TeachCookDone_compote1_01_00 " );	// Compote from wild berries.

	if(Npc_HasItems(hero,ItMi_Nugget) >= 50)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_01_01 " );	// The main thing is to know exactly how many berries you need for one serving.
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_01_02 " );	// You can't cook a normal compote without this. Otherwise, it will be too liquid or even similar to jam.
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_01_03 " );	// Take twenty berries and throw them into the cauldron. Stir them evenly, and then add the healing herb.
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_01_04 " );	// And as soon as scale appears - drain. That's all.
		AI_Print( " Recipe for cooking - 'Wild Berry Compote' studied " );
		B_LogEntry( TOPIC_COOK , " Now I can make wild berry compote. For this I need twenty wild berries and a medicinal herb. " );
		Snd_Play("LevelUP");
		Recipe_Compote_01 = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_01_05 " );	// А где рода?
		Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	};
};

func void DIA_STRF_1107_TeachCookDone_compote2()
{
	AI_Output(other,self, " DIA_STRF_1107_TeachCookDone_compote2_01_00 " );	// Wild berry compote.

	if(Npc_HasItems(hero,ItMi_Nugget) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_02_01 " );	// This won't be easy. The whole secret is not to overcook the berries.
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_02_02 " );	// Otherwise, you will cook a sour brew, and not a delicious compote.
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_02_03 " );	// Take thirty berries and grind them with medicinal herbs. Then pour it all into the cauldron.
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_02_04 " );	// Boil it only at a certain temperature. And as soon as the compote boils, remove it from the fire.
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_02_05 " );	// If you do it right, you'll get an excellent drink!
		AI_Print( " Recipe for cooking food - 'Wild Berry Compote' " );
		B_LogEntry( TOPIC_COOK , " Now I can make wild berry compote. For this I need thirty wild berries and a medicinal plant. " );
		Snd_Play("LevelUP");
		Recipe_Compote_02 = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_1107_TeachCookDone_compote1_02_06 " );	// А где рода?
		Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	};
};

var int ClifCookMe;
var int FirstKliffCookOne;

instance DIA_STRF_1107_COOKME(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKME_Condition;
	information = DIA_STRF_1107_COOKME_Info;
	permanent = FALSE;
	description = " Can you make me these compotes yourself? " ;
};

func int DIA_STRF_1107_COOKME_Condition()
{
	if(ClifTeachCook == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKME_Info()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKME_01_01 " );	// Can you make me these compotes yourself?
	AI_Output(self,other, " DIA_STRF_1107_COOKME_01_02 " );	// Of course. If you bring all the necessary ingredients for this.
	AI_Output(self,other, " DIA_STRF_1107_COOKME_01_03 " );	// But you still have to pay for it with magic ore.
	AI_Output(self,other, " DIA_STRF_1107_COOKME_01_04 " );	// I'm just not going to waste my time on this.
	ClifCookMe = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry( TOPIC_COOK , " Cliff can make compotes for me if I bring him the right ingredients. He takes 5 pieces of magic ore for each serving of compote. " );
};

instance DIA_STRF_1107_COOKMEDONE(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMEDONE_Condition;
	information = DIA_STRF_1107_COOKMEDONE_Info;
	permanent = TRUE;
	description = " Make me compote. " ;
};

func int DIA_STRF_1107_COOKMEDONE_Condition()
{
	if((ClifCookMe == TRUE) && (DayCliffCookFor == FALSE) && (DayCliffCookPortionFor == FALSE) && (DayCliffCook == FALSE) && (DayCliffCookPortion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMEDONE_Info()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_01_01 " );	// Prepare me compote.
	AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_01_02 " );	// Which one?
	Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
	Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);
	Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " Wild Berry Compote " ,DIA_STRF_1107_COOKMEDONE_Planeberry);
	Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " Wildberry Compote (30 Wild Berries, Medicinal Plant) " ,DIA_STRF_1107_COOKMEDONE_Forestberry);
};

func void DIA_STRF_1107_COOKMEDONE_back()
{
	Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_01 " );	// Compote from wild berries.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_02 " );	// Good. Let's see if you have all the necessary ingredients.
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_03 " );	// So... (appreciatively) Yes, you seem to have something.
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_04 " );	// Well, how many servings would you like to cook?
		Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
		Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);

		if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
		{
			Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " 1 serving (20 wild berries, medicinal root, 5 ore) " ,DIA_STRF_1107_COOKMEDONE_Planeberry_V1);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 100) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
		{
			Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " 5 servings (100 wild berries, 5 medicinal roots, 25 ore) " ,DIA_STRF_1107_COOKMEDONE_Planeberry_V5);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 200) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
		{
			Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " 10 servings (200 wild berries, 10 medicinal roots, 50 ore) " ,DIA_STRF_1107_COOKMEDONE_Planeberry_V10);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 400) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
		{
			Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " 20 servings (400 wild berries, 20 medicinal roots, 100 ore) " ,DIA_STRF_1107_COOKMEDONE_Planeberry_V20);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_05 " );	// But you don't have enough ingredients for this!
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_06 " );	// Gather everything you need first, and then come.
		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V1()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_01 " );	// Make me one serving.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_02 " );	// Good. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,20);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 1;
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_03 " );	// Your compote will be ready by tomorrow.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_04 " );	// Only tomorrow?! I thought you'd cook it right now.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_05 " );	// Well, yes... (chuckling) Now I'll drop all my business and take care of your compote!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_06 " );	// Actually, I have another job to do here.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_07 " );	// So stop getting on my nerves and just come back tomorrow.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 5)
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_08 " );	// Where is the ore? No, that won't do, buddy.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_09 " );	// Find me some ore first, then come back.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_05 " );	// But you don't have enough ingredients for this!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_06 " );	// Gather everything you need first, and then come.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V5()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_01 " );	// Make five servings for me.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 100) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_02 " );	// Good. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,100);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,5);
		Npc_RemoveInvItems(hero,ItMi_Nugget,25);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 5;
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_03 " );	// Your compote will be ready by tomorrow.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_04 " );	// Only tomorrow?! I thought you'd cook it right now.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_05 " );	// Well, yes... (chuckling) Now I'll drop all my business and take care of your compote!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_06 " );	// Actually, I have another job to do here.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_07 " );	// So stop getting on my nerves and just come back tomorrow.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 25)
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_08 " );	// Where is the ore? No, that won't do, buddy.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_09 " );	// Find me some ore first, then come back.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_05 " );	// But you don't have enough ingredients for this!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_06 " );	// Gather everything you need first, and then come.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V10()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_01 " );	// Cook me ten servings.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 200) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_02 " );	// Good. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,200);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,10);
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 10;
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_03 " );	// Your compote will be ready by tomorrow.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_04 " );	// Only tomorrow?! I thought you'd cook it right now.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_05 " );	// Well, yes... (chuckling) Now I'll drop all my business and take care of your compote!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_06 " );	// And it will take me longer to cook ten servings.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_07 " );	// So stop getting on my nerves and just come back tomorrow.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 50)
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_08 " );	// Where is the ore? No, that won't do, buddy.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_09 " );	// Find me some ore first, then come back.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_05 " );	// But you don't have enough ingredients for this!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_06 " );	// Gather everything you need first, and then come.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V20()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_01 " );	// Cook me twenty servings.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 400) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_02 " );	// (surprised) How much? Oh, okay. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,400);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,20);
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 20;
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_03 " );	// I'll try to get it done by tomorrow.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_04 " );	// Do your best, mate.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_05 " );	// Well, yes... (chuckling) Now I'll drop all my business and take care of your compote!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_06 " );	// (laughs) And let Garond eat undercooked stew!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_07 " );	// Guy, don't get on my nerves, and just be patient until tomorrow.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 100)
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_08 " );	// Where is the ore? No, that won't do, buddy.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_09 " );	// Find me some ore first, then come back.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_05 " );	// But you don't have enough ingredients for this!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_06 " );	// Gather everything you need first, and then come.
		};

		AI_StopProcessInfos(self);
	};
};

instance DIA_STRF_1107_COOKMETAKE_Planeberry(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMETAKE_Planeberry_Condition;
	information = DIA_STRF_1107_COOKMETAKE_Planeberry_Info;
	permanent = TRUE;
	description = " How is my compote? " ;
};

func int DIA_STRF_1107_COOKMETAKE_Planeberry_Condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((ClifCookMe == TRUE) && (DayCliffCook < daynow) && (DayCliffCookPortion >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMETAKE_Planeberry_Info()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMETAKE_Planeberry_01_01 " );	// How is my compote doing?
	AI_Output(self,other, " DIA_STRF_1107_COOKMETAKE_Planeberry_01_02 " );	// It's ready. Here you are.
	B_GiveInvItems(self,other,itfo_compote_01,DayCliffCookPortion);
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Planeberry_01_03");	//Спасибо.
	DayCliffCookPortion = FALSE;
	DayCliffCook = FALSE;
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_01 " );	// Wild berry compote.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_02 " );	// Good. Let's see if you have all the necessary ingredients.	
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_03 " );	// So... (appreciatively) Yes, you seem to have something.
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_04 " );	// Well, how many servings would you like to cook?
		Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
		Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);

		if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
		{
			Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " 1 serving (20 wild berries, medicinal plant, 5 ore) " ,DIA_STRF_1107_COOKMEDONE_Forestberry_V1);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 150) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
		{
			Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " 5 servings (100 wild berries, 5 medicinal plants, 25 ore) " ,DIA_STRF_1107_COOKMEDONE_Forestberry_V5);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 300) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
		{
			Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " 10 servings (200 wild berries, 10 medicinal plants, 50 ore) " ,DIA_STRF_1107_COOKMEDONE_Forestberry_V10);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 600) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
		{
			Info_AddChoice( DIA_STRF_1107_COOKMEDONE , " 20 servings (400 wild berries, 20 medicinal plants, 100 ore) " ,DIA_STRF_1107_COOKMEDONE_Forestberry_V20);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_05 " );	// But you don't have enough ingredients for this!
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Planeberry_01_06 " );	// Gather everything you need first, and then come.
		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V1()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_01 " );	// Make me one serving.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_02 " );	// Good. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,30);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 1;
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_03 " );	// Your compote will be ready by tomorrow.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_04 " );	// Only tomorrow?! I thought you'd cook it right now.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_05 " );	// Well, yes... (chuckling) Now I'll drop all my business and take care of your compote!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_06 " );	// Actually, I have another job to do here.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_07 " );	// So stop getting on my nerves and just come back tomorrow.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 5)
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_08 " );	// Where is the ore? No, that won't do, buddy.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_09 " );	// Find me some ore first, then come back.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_05 " );	// But you don't have enough ingredients for this!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_06 " );	// Gather everything you need first, and then come.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V5()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_01 " );	// Make five servings for me.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 150) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_02 " );	// Good. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,150);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,5);
		Npc_RemoveInvItems(hero,ItMi_Nugget,25);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 5;
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_03 " );	// Your compote will be ready by tomorrow.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_04 " );	// Only tomorrow?! I thought you'd cook it right now.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_05 " );	// Well, yes... (chuckling) Now I'll drop all my business and take care of your compote!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_06 " );	// Actually, I have another job to do here.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_07 " );	// So stop getting on my nerves and just come back tomorrow.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 25)
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_08 " );	// Where is the ore? No, that won't do, buddy.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_09 " );	// Find me some ore first, then come back.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_05 " );	// But you don't have enough ingredients for this!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_06 " );	// Gather everything you need first, and then come.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V10()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_01 " );	// Cook me ten servings.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 300) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_02 " );	// Good. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,300);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,10);
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 10;
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_03 " );	// Your compote will be ready by tomorrow.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_04 " );	// Only tomorrow?! I thought you'd cook it right now.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_05 " );	// Well, yes... (chuckling) Now I'll drop all my business and take care of your compote!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_06 " );	// And it will take me longer to cook ten servings.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_07 " );	// So stop getting on my nerves and just come back tomorrow.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 50)
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_08 " );	// Where is the ore? No, that won't do, buddy.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_09 " );	// Find me some ore first, then come back.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_05 " );	// But you don't have enough ingredients for this!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_06 " );	// Gather everything you need first, and then come.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V20()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_01 " );	// Cook me twenty servings.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 600) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
	{
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_02 " );	// (surprised) How much? Oh, okay. Let's all come here.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,600);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,20);
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 20;
		AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_03 " );	// I'll try to get it done by tomorrow.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self, " DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_04 " );	// Do your best, mate.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_05 " );	// Well, yes... (chuckling) Right now I'll drop all my business and take care of your compote!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_06 " );	// (laughs)... And let Garond eat undercooked stew.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_07 " );	// Guy, don't get on my nerves, and just be patient until tomorrow.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 100)
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_08 " );	// Where is the ore? No, that won't do, buddy.
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_09 " );	// Find me some ore first, then come back.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_05 " );	// But you don't have enough ingredients for this!
			AI_Output(self,other, " DIA_STRF_1107_COOKMEDONE_Forestberry_01_06 " );	// Gather everything you need first, and then come.
		};

		AI_StopProcessInfos(self);
	};
};

instance DIA_STRF_1107_COOKMETAKE_Forestberry(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMETAKE_Forestberry_Condition;
	information = DIA_STRF_1107_COOKMETAKE_Forestberry_Info;
	permanent = TRUE;
	description = " How is my compote? " ;
};

func int DIA_STRF_1107_COOKMETAKE_Forestberry_Condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((ClifCookMe == TRUE) && (DayCliffCookFor < daynow) && (DayCliffCookPortionFor >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMETAKE_Forestberry_Info()
{
	AI_Output(other,self, " DIA_STRF_1107_COOKMETAKE_Forestberry_01_01 " );	// How is my compote doing?
	AI_Output(self,other, " DIA_STRF_1107_COOKMETAKE_Forestberry_01_02 " );	// It's ready. Here you are.
	B_GiveInvItems(self,other,itfo_compote_00,DayCliffCookPortionFor);
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Forestberry_01_03");	//Спасибо.
	DayCliffCookPortionFor = FALSE;
	DayCliffCookFor = FALSE;
};

instance DIA_STRF_1107_PERM(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 900;
	condition = DIA_STRF_1107_PERM_Condition;
	information = DIA_STRF_1107_PERM_Info;
	permanent = TRUE;
	description = " Anything new? " ;
};

func int DIA_STRF_1107_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_PERM_Info()
{
	where int daynow;
	AI_Output(other,self, " DIA_STRF_1107_PERM_15_00 " );	// Anything new?
	if(MIS_OCCOOKFLEE == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_STRF_1107_PERM_01_21 " );	// Ask the guys. I'm just relaxing here. I sleep and eat.
		AI_Output(self,other, " DIA_STRF_1107_PERM_01_22 " );	// Well, sometimes I go hunting.
		AI_StopProcessInfos(self);
	}
	else if(COOK1107_GOBASE == TRUE)
	{
		AI_Output(self,other, " DIA_STRF_1107_PERM_01_25 " );	// News will come when we get there. Do not be distracted.
		AI_StopProcessInfos(self);
	}
	else if(COOK1107_DAY <= 0)
	{
		AI_Output(self,other, " DIA_STRF_1107_PERM_01_01 " );	// Ask paladins. I'm just a prisoner cook.
		if(COOK1107_DAY == 0)
		{
			AI_Output(other, self, " DIA_STRF_1107_PERM_15_01 " );	// Don't look at me like a wolf, I know this castle better than you. Guess why?
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_02 " );	// Come on, you don't look like an ex-con.
			AI_Output(other, self, " DIA_STRF_1107_PERM_15_02 " );	// As you know. But if you need help, please reach out.
			COOK1107_DAY = Wld_GetDay() +  7 ;
		};
	}
	else
	{
		daynow = Wld_GetDay();
		if(COOK1107_DAY == (daynow + 1))
		{
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_04 " );	// Chowder. She is new every day.
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_26 " );	// Come tomorrow - there will be news for you.
			AI_StopProcessInfos(self);
		}
		else if(((COOK1107_DAY - 3) <= daynow) && (COOK1107_DAY > daynow))
		{
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_23 " );	// How impatient you are. It hasn't even been a week yet.
			AI_StopProcessInfos(self);
		}
		else if(COOK1107_DAY > daynow)
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_05");	//Пока нет.
		}
		else if(COOK1107_DAY == (daynow + 7))
		{
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_27 " );	// Our news travels slowly. Come back in a week.
		}
		else
		{
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_07 " );	// Guys say you can be trusted...
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_08 " );	// Look, I need to get out of here!
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_09 " );	// I'm not going to Khorinis, I need some quiet place to sit out all these storms.
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_10 " );	// You won't be left behind. Maybe you have already seen the chest on the top platform of the high tower?
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_11 " );	// The lock is good there - you can't open it without a key. It contains five or six pieces of ore.
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_12 " );	// If you help, I'll tell you where the key is hidden.
			AI_Output(self,other, " DIA_STRF_1107_PERM_01_14 " );	// Well, are you in?
			COOK1107_DAY = -1;
			Info_ClearChoices(dia_strf_1107_perm);
			Info_AddChoice(dia_strf_1107_perm, " And how to do it? " ,dia_strf_1107_perm_ok);
			Info_AddChoice(dia_strf_1107_perm, " Are you out of your mind? Look for another suicide. " ,dia_strf_1107_perm_no);
		};
	};
};

func void dia_strf_1107_perm_no()
{
	AI_Output(other,self, " DIA_STRF_1107_PERM_15_05 " );	// Are you out of your mind?
	AI_Output(other,self, " DIA_STRF_1107_PERM_15_06 " );	// You want me to take you through a castle full of paladins?
	AI_Output(other,self, " DIA_STRF_1107_PERM_15_07 " );	// And then through the hordes of orcs?
	AI_Output(self,other, " DIA_STRF_1107_PERM_01_15 " );	// I misunderstood you...
	Info_ClearChoices(dia_strf_1107_perm);
	AI_StopProcessInfos(self);
};

func void dia_strf_1107_perm_ok()
{
	AI_Output(other,self, " DIA_STRF_1107_PERM_15_08 " );	// You want me to take you through a castle full of paladins?
	AI_Output(other,self, " DIA_STRF_1107_PERM_15_09 " );	// And then through the hordes of orcs?
	AI_Output(other,self, " DIA_STRF_1107_PERM_15_10 " );	// Couldn't you find another crazy one? Did you really need me?
	MIS_OCCOOKFLEE = LOG_Running;
	Log_CreateTopic(TOPIC_OCCOOKFLEE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OCCOOKFLEE,LOG_Running);
	B_LogEntry( TOPIC_OCCOOKFLEE , " Cook Cliff in Mine Valley Castle wants to get away. " );
	B_LogEntry( TOPIC_OCCOOKFLEE , " He promises to tell me where the key to the chest with some ore is. " );
	AI_Output(self,other, " DIA_STRF_1107_PERM_01_16 " );	// You volunteered.
	AI_Output(self,other, " DIA_STRF_1107_PERM_01_17 " );	// Now listen. I need clothes that won't arouse the suspicion of the paladins in the castle.
	AI_Output(self,other, " DIA_STRF_1107_PERM_01_18 " );	// And some weapons.
	B_LogEntry( TOPIC_OCCOOKFLEE , " Cliff says he needs clothes that don't stand out in the castle and some weapons. " );
	AI_Output(self,other, " DIA_STRF_1107_PERM_01_20 " );	// And most importantly, do you have a quiet place in mind here, in the Valley of Mines?
	B_LogEntry( TOPIC_OCCOOKFLEE , " But first I need to find a quiet place in Mining Valley. " );
	Info_ClearChoices(dia_strf_1107_perm);
};


instance DIA_STRF_1107_FLEEINFO(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 2;
	condition = dia_strf_1107_fleeinfo_condition;
	information = dia_strf_1107_fleeinfo_info;
	permanent = FALSE;
	description = " I think I found a quiet place for you. " ;
};

func int dia_strf_1107_fleeinfo_condition()
{
	if((MIS_OCCOOKFLEE == LOG_Running) && (HEROKNOWFORESTBASE == TRUE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_fleeinfo_info()
{
	AI_Output(other,self, " DIA_STRF_1107_FleeInfo_15_00 " );	// Looks like I found a quiet place for you.
	AI_Output(self,other, " DIA_STRF_1107_FleeInfo_01_01 " );	// And where is it?
	AI_Output(other,self, " DIA_STRF_1107_FleeInfo_15_01 " );	// Behind the orc fence, a large forest has now grown.
	AI_Output(other,self, " DIA_STRF_1107_FleeInfo_15_02 " );	// This was facilitated by the magic of some god, with whom one guy from the former Swamp Camp communicates.
	AI_Output(other,self, " DIA_STRF_1107_FleeInfo_15_03 " );	// There is a camp in this forest, which is quite calm.
	AI_Output(other,self, " DIA_STRF_1107_FleeInfo_15_04 " );	// Not a single orc now dares to go there.
	AI_Output(self,other, " DIA_STRF_1107_FleeInfo_01_02 " );	// Are you asking me to live with these psychos?
	AI_Output(self,other, " DIA_STRF_1107_FleeInfo_15_05 " );	// They're not right in the head there.
	AI_Output(other,self, " DIA_STRF_1107_FleeInfo_15_07 " );	// If you don't like it, look for it yourself.
	AI_Output(self,other, " DIA_STRF_1107_FleeInfo_01_03 " );	// All right, all right - it will go for the first time.
	AI_Output(self,other, " DIA_STRF_1107_FleeInfo_01_04 " );	// Now I need clothes and a sword - but this is right before the escape.
	AI_Output(self,other, " DIA_STRF_1107_FleeInfo_01_05 " );	// Now I have nowhere to hide them.
	B_LogEntry( TOPIC_OCCOOKFLEE , " Cliff has agreed to go to Forest Camp. " );
};


instance DIA_STRF_1107_FLEENOW(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 4;
	condition = dia_strf_1107_fleenow_condition;
	information = dia_strf_1107_fleenow_info;
	permanent = TRUE;
	description = " Are you ready? " ;
};

func int dia_strf_1107_fleenow_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_strf_1107_fleeinfo ) && ( COOK1107_GOBASE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_strf_1107_fleenow_info()
{
	if (Wld_IsTime( 23 , 0 , 4 , 0 ))
	{
		AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_02 " );	// What about clothes?
		AI_Output(other,self, " DIA_STRF_1107_FleeNow_15_01 " );	// Now let's see what I have that doesn't arouse suspicion...
		Info_ClearChoices(dia_strf_1107_fleenow);
		Info_AddChoice(dia_strf_1107_fleenow,Dialog_Back,dia_strf_1107_fleenow_back);

		if(Npc_HasItems(other,itar_djg_l) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Light Dragonslayer Armor " ,dia_strf_1107_fleenow_djg_l);
		};
		if(Npc_HasItems(other,itar_djg_l_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Light Forged Dragonslayer Armor " ,dia_strf_1107_fleenow_djg_l_v1);
		};
		if(Npc_HasItems(other,itar_djg_m) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Dragonslayer Armor " ,dia_strf_1107_fleenow_djg_m);
		};
		if(Npc_HasItems(other,itar_djg_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Forged Dragonslayer Armor " ,dia_strf_1107_fleenow_djg_m_v1);
		};
		if(Npc_HasItems(other,itar_djg_h) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Heavy Dragonslayer Armor " ,dia_strf_1107_fleenow_djg_h);
		};
		if(Npc_HasItems(other,itar_djg_h_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Heavy Forged Dragonslayer Armor " ,dia_strf_1107_fleenow_djg_h_v1);
		};
		if(Npc_HasItems(other,ITAR_Mil_L) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give militia armor " ,dia_strf_1107_fleenow_mil_l);
		};
		if(Npc_HasItems(other,itar_mil_l_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give wrought iron armor to militia " ,dia_strf_1107_fleenow_mil_l_v1);
		};
		if(Npc_HasItems(other,ItAr_MIL_M) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Militia Heavy Armor " ,dia_strf_1107_fleenow_mil_m);
		};
		if(Npc_HasItems(other,itar_mil_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Militia Heavy Forged Armor " ,dia_strf_1107_fleenow_mil_m_v1);
		};
		if(Npc_HasItems(other,ItAr_PAL_M) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Paladin Armor " ,dia_strf_1107_fleenow_pal_m);
		};
		if(Npc_HasItems(other,itar_pal_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Paladin Ore Armor " ,dia_strf_1107_fleenow_pal_m_v1);
		};
		if(Npc_HasItems(other,ItAr_PAl_H) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Paladin Heavy Armor " ,dia_strf_1107_fleenow_pal_h);
		};
		if(Npc_HasItems(other,ITAR_DJG_Crawler) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Crawler Shell Armor " ,dia_strf_1107_fleenow_pal_h_v1);
		};
		if(Npc_HasItems(other,ITAR_Leather_L) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow, " Give Leather Armor " ,dia_strf_1107_fleenow_pal_h_v2);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_01 " );	// Right in the middle of the day? How are you with your head?! Come at night.
		AI_StopProcessInfos(self);
	};
};

func void dia_strf_1107_fleenow_back()
{
	AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_05 " );	// Damn! So what is this preparation?
	AI_StopProcessInfos(self);
};

func void dia_strf_1107_fleenow_tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_03 " );	// Just right!
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_04 " );	// And what about our weapons?
	Info_ClearChoices(dia_strf_1107_fleenow);

	if (Npc_HasItems(other,ItMw_Schwert) >  0 )
	{
		Info_AddChoice(dia_strf_1107_fleenow, " Обчный меч " ,dia_strf_1107_fleenow_ItMw_Schwert);
	};
	if(Npc_HasItems(other,ItMw_1h_Sld_Sword_New) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow, " Губый меч " ,dia_strf_1107_fleenow_ItMw_1h_Sld_Sword_New);
	};
	if (Npc_HasItems(other,ItMw_Schwert2) >  0 )
	{
		Info_AddChoice(dia_strf_1107_fleenow, " Box " ,dia_strf_1107_fleenow_ItMw_Schwert2);
	};
	if(Npc_HasItems(other,ItMw_1H_Common_01) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow, " Manufacturer's Choice " ,dia_strf_1107_fleenow_ItMw_1H_Common_01);
	};
	if(Npc_HasItems(other,ItMw_ShortSword1) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow, " Militia Short Sword " ,dia_strf_1107_fleenow_itmw_2h_orcsword_01);
	};
	if(Npc_HasItems(other,ItMw_1h_Mil_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow, " dia_strf_1107_fleenow " ,dia_strf_1107_fleenow_itmw_2h_orcsword_02);
	};
	if (Npc_HasItems(other,ItMw_Schwert) >  0 )
	{
		Info_AddChoice(dia_strf_1107_fleenow, " Грбтй меч " ,dia_strf_1107_fleenow_itmw_2h_orcaxe_04);
	};
	if(Npc_HasItems(other,ItMw_1h_Pal_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow, " вЂ‹вЂ‹вЂ‹вЂ‹вЂ‹ " ,dia_strf_1107_fleenow_itmw_2h_orcaxe_03);
	};
	if(Npc_HasItems(other,ItMw_2h_Pal_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow, " Knight's Twohander " ,dia_strf_1107_fleenow_itmw_2h_orcaxe_02);
	};
	if(Npc_HasItems(other,ItMw_Zweihaender1) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow, " вЂ‹вЂ‹вЂ‹вЂ‹вЂ‹ " ,dia_strf_1107_fleenow_itmw_2h_orcaxe_01);
	};

	Info_AddChoice(dia_strf_1107_fleenow, " I didn't find anything suitable. " ,dia_strf_1107_fleenow_nosword);
};

func void dia_strf_1107_fleenow_axegiven()
{
	B_GivePlayerXP(50);
	AI_EquipBestMeleeWeapon(self);
	Info_ClearChoices(dia_strf_1107_fleenow);
	AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_08 " );	// Great!
	AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_09 " );	// Now you can go!
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	COOK1107_GOBASE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoForestBase");
};

func void dia_strf_1107_fleenow_djg_lcr()
{
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_djg_l()
{
	B_GiveInvItems(other,self,itar_djg_l,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_djg_l_v1()
{
	B_GiveInvItems(other,self,itar_djg_l_v1,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_djg_m()
{
	B_GiveInvItems(other,self,itar_djg_m,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_djg_m_v1()
{
	B_GiveInvItems(other,self,itar_djg_m_v1,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_djg_h()
{
	B_GiveInvItems(other,self,itar_djg_h,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_djg_h_v1()
{
	B_GiveInvItems(other,self,itar_djg_h_v1,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_mil_l()
{
	B_GiveInvItems(other,self,ITAR_Mil_L,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_mil_m()
{
	B_GiveInvItems(other,self,ItAr_MIL_M,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_mil_l_v1()
{
	B_GiveInvItems(other,self,itar_mil_l_v1,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_mil_m_v1()
{
	B_GiveInvItems(other,self,itar_mil_m_v1,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_pal_m()
{
	B_GiveInvItems(other,self,ItAr_PAL_M,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_pal_h()
{
	B_GiveInvItems(other,self,ItAr_PAl_H,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_pal_m_v1()
{
	B_GiveInvItems(other,self,itar_pal_m_v1,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_pal_h_v1()
{
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_pal_h_v2()
{
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	dia_strf_1107_fleenow_fact();
};

func void dia_strf_1107_fleenow_itmw_2h_orcsword_01();
{
	B_GiveInvItems(other,self,ItMw_ShortSword1,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcsword_02();
{
	B_GiveInvItems(other,self,ItMw_1h_Mil_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_04();
{
	B_GiveInvItems(other,self,ItMw_Schwert, 1 );
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_03();
{
	B_GiveInvItems(other,self,ItMw_1h_Pal_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_02();
{
	B_GiveInvItems(other,self,ItMw_2h_Pal_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_01();
{
	B_GiveInvItems(other,self,ItMw_Zweihaender1,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_Schwert()
{
	B_GiveInvItems(other,self,ItMw_Schwert, 1 );
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_1h_Sld_Sword_New()
{
	B_GiveInvItems(other,self,ItMw_1h_Sld_Sword_New,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_Schwert2()
{
	B_GiveInvItems(other,self,ItMw_Schwert2, 1 );
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_1H_Common_01()
{
	B_GiveInvItems(other,self,ItMw_1H_Common_01,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_nosword()
{
	AI_Output(other,self, " DIA_STRF_1107_FleeNow_15_02 " );	// I didn't find anything suitable.
	AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_06 " );	// You didn't get any orc weapons?
	AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_07 " );	// I'm beginning to doubt we'll get there.
	AI_Output(self,other, " DIA_STRF_1107_FleeNow_01_10 " );	// Well, it's too late to argue! Go here.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	COOK1107_GOBASE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoForestBase");
};

instance DIA_STRF_1107_ARRIVEDBASE(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = dia_strf_1107_arrivedbase_condition;
	information = dia_strf_1107_arrivedbase_info;
	important = TRUE;
};

func int dia_strf_1107_arrivedbase_condition()
{
	if((Npc_GetDistToWP(self,"WP_COAST_FOREST_58") <= 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_arrivedbase_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_00 " );	// Is this the right place? Hmmm... (looking around) I already like it here!
	AI_Output(other,self, " DIA_STRF_1107_ArrivedBase_01_01 " );	// I'm happy for you. What about my promised reward?
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_02 " );	// Of course. (smiling) Listen to me carefully, buddy.
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_03 " );	// When I was in the cell, I met a guy from the New Camp.
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_04 " );	// The poor fellow was caught by the paladins when he was trying to get out of the Valley of Mines.
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_05 " );	// So, that guy claimed that there was a chest in the castle, filled to the brim with ore.
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_06 " );	// But, most importantly, he knows where the key to this chest is!
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_07 " );	// Then, of course, I didn't believe him... (sighing) But you know what Beliar isn't joking about...
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_08 " );	// Unfortunately, that guy died! But before he died, he gave me the key to his possessions in the New Camp.
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_09 " );	// And he said that there I would find something that would make me fabulously rich.
	B_GiveInvItems(self,other,itke_nc_cookchest,1);
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_10 " );	// Here, take it. I'm definitely not going there, but you can try.
	AI_Output(self,other, " DIA_STRF_1107_ArrivedBase_01_11 " );	// That's all. Well, how interesting?
	AI_Output(other,self, " DIA_STRF_1107_ArrivedBase_01_12 " );	// Okay, let's see if your friend is lying.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	MIS_OCCOOKFLEE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OCCOOKFLEE,LOG_SUCCESS);
	B_LogEntry( TOPIC_OCCOOKFLEE , " I took Cliff to Forest Camp, and he gave me the key to the chest at New Camp, as promised. According to him, it will open the way to fabulous riches. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STAYINCAMP");
};

var int CliffTellCassia;

instance DIA_STRF_1107_CASSIA(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 4;
	condition = dia_strf_1107_cassia_condition;
	information = dia_strf_1107_cassia_info;
	permanent = TRUE;
	description = " Do you happen to know... " ;
};

func int dia_strf_1107_cassia_condition()
{
	if ((( MIS_CASSIAGOLDCUP  == LOG_Running) && (CliffTellCassia ==  FALSE ) && (Npc_HasItems(other, ITKE_TWOSTORE ) ==  0 ) && (( MIS_OCCOOKFLEE  ==  LOG_SUCCESS ) || ( MIS_OCCOOKFLEE  == LOG_Running)) ) || MIS_RARETHINGS  == LOG_Running) && (Npc_KnowsInfo(hero, dia_gomez_hello) ==  FALSE )))
	{
		return TRUE;
	};
};

func void dia_strf_1107_cassia_info()
{
	Info_ClearChoices(dia_strf_1107_cassia);
	Info_AddChoice(dia_strf_1107_cassia,Dialog_Back,dia_strf_1107_cassia_back);

	if (( MIS_RARETHINGS  == LOG_Running ) && ( Npc_KnowsInfo ( hero , dia_gomez_hello ) ==  FALSE ))
	{
		Info_AddChoice(dia_strf_1107_cassia, " About the black marble statuettes of Innos? " ,dia_strf_1107_cassia_rarethings);
	};
	if((MIS_CASSIAGOLDCUP != LOG_SUCCESS) && (MIS_CASSIAGOLDCUP == LOG_Running) && (Npc_HasItems(other,ITKE_TWOSTORE) == 0) && ((MIS_OCCOOKFLEE == LOG_SUCCESS) || (MIS_OCCOOKFLEE == LOG_Running)))
	{
		Info_AddChoice(dia_strf_1107_cassia, " Are you a cassia goldcup? " ,dia_strf_1107_cassia_goldcup);
	};
};

func void dia_strf_1107_cassia_goldcup()
{
	AI_Output(other,self, " DIA_STRF_1107_Cassia_15_00 " );	// Do you happen to know where the Ore Baron's cup might be?
	AI_Output(self,other, " DIA_STRF_1107_Cassia_01_01 " );	// Ha, now I really believe that you are a former convict from the colony. I heard about this thing.
	AI_Output(self,other, " DIA_STRF_1107_Cassia_01_02 " );	// It's most likely in a warehouse somewhere. Only Angore lost the key to it.
	AI_Output(self,other, " DIA_STRF_1107_Cassia_01_03 " );	// But even if you find it, there is a second room inside, the key to which the paladins have - either Orik or Parsival.
	AI_Output(self,other, " DIA_STRF_1107_Cassia_01_04 " );	// You'll have a hard time here - you have to be a very smart guy to steal something from them.

	if(MILTENSAYABOUTOCKEY == FALSE)
	{
		B_LogEntry( TOPIC_CASSIAGOLDCUP , " The Cup of the Ore Baron can be located in the inner chamber of the paladin warehouse, the key to which is held by Orik or Parsival. Engor has lost the key to the warehouse itself. " );
	}
	else
	{
		B_LogEntry( TOPIC_CASSIAGOLDCUP , " The Ore Baron's Chalice can be found in the interior of a paladin warehouse, the key to which is held by Orik or Parsival. " );
	};

	CliffTellCassia = TRUE;
};

func void dia_strf_1107_cassia_rarethings()
{
	AI_Output(other,self, " DIA_STRF_1107_Cassia_15_01 " );	// You don't know anything about the black marble figurines of Innos?
	AI_Output(self,other, " DIA_STRF_1107_Cassia_01_05 " );	// Once upon a time, Gomez had some black figurines that he was very proud of.
	AI_Output(self,other, " DIA_STRF_1107_Cassia_01_06 " );	// Most likely, they were left somewhere in the castle. Look in the paladin rooms or Gomez's old quarters.
	AI_Output(self,other, " DIA_STRF_1107_Cassia_01_07 " );	// Well, look for the keys to the rooms in the pockets of the paladins or the rooms of the castle.
	B_LogEntry( TOPIC_RARETHINGS , " The statuettes Luthero needs are still in some room in the castle and under lock and key. We'll have to look for the keys. " );
};

func void dia_strf_1107_cassia_back()
{
	Info_ClearChoices(dia_strf_1107_cassia);
	AI_StopProcessInfos(self);
};

instance DIA_STRF_1107_Straefling_Ship(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = DIA_STRF_1107_Straefling_Ship_condition;
	information = DIA_STRF_1107_Straefling_Ship_info;
	permanent = FALSE;
	description = " Do you want to get off this island? " ;
};

func int DIA_STRF_1107_Straefling_Ship_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (MIS_OCCOOKFLEE == LOG_SUCCESS) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_Straefling_Ship_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_00 " );	// Do you want to get off this island?
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Ship_01_01 " );	// Still... (smirking) Of course I do! And then he is already like a bone in my throat.
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_02 " );	// Then you have a chance to do it.
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Ship_01_03 " );	// Are you kidding, I don't get it? (incredulously)
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_04 " );	// What a joke! I need a cook for the ship.
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_05 " );	// More precisely, not to me, but to one mercenary named Silvio.
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Ship_01_06 " );	// Well, you are... You know how delicious I cook!
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_07 " );	// Yes, you calm down! There are no candidates other than you. Just say are you in?
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Ship_01_09 " );	// Are you still asking? (joyfully) Of course I'm in!
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Ship_01_10 " );	// The only thing that confuses me is does this guy have a ship?
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_11 " );	// Of course! He's not far from here.
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Ship_01_12 " );	// (surprised) Strange! I've only seen an orc drakar here.
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_13 " );	// So this is it!
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Ship_01_14 " );	// What?! Did he recapture it from the orcs?
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_15 " );	// Well, he or I. Who cares? Most importantly, now he is ours.
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Ship_01_16 " );	// So you'd better go there and wait for Silvio.
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Ship_01_17 " );	// Okay, I'll do that. I'll just take a break first.
	ClifAgree = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_STRF_1107_Straefling_Drakar_Perm (C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = DIA_STRF_1107_Straefling_Drakar_Perm_condition;
	info = DIA_STRF_1107_Straefling_Drakar_Perm_info;
	permanent = TRUE;
	description = " What are we cooking? " ;
};

func int DIA_STRF_1107_Straefling_Drakar_Perm_condition()
{
	if((MoveDracarBoard == TRUE) && (CliffOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_Straefling_Drakar_Perm_info()
{
	AI_Output(other,self, " DIA_STRF_1107_Straefling_Drakar_Perm_01_00 " );	// Что готовим?
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Drakar_Perm_01_01 " );	// Anything that comes to hand.
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Drakar_Perm_01_02 " );	// You know, now you don't have to choose.
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Drakar_Perm_01_03 " );	// But the pantries of the orcs here are rich! All holds are full of corned beef.
	AI_Output(self,other, " DIA_STRF_1107_Straefling_Drakar_Perm_01_04 " );	// So we definitely won't die of hunger.
};
