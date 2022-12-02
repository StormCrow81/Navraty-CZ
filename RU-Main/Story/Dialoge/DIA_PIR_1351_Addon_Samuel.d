

instance DIA_Addon_Samuel_EXIT(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 999;
	condition = DIA_Addon_Samuel_EXIT_Condition;
	information = DIA_Addon_Samuel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAMUEL_NO_TALK(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = dia_samuel_no_talk_condition;
	information = dia_samuel_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_samuel_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_samuel_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Samuel_Hello(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = DIA_Addon_Samuel_Hello_Condition;
	information = DIA_Addon_Samuel_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Samuel_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Samuel_Hello_Info()
{
	AI_Output(self,other, " DIA_Addon_Samuel_Hello_14_00 " );	// Ah, newbie!
	AI_Output(self,other, " DIA_Addon_Samuel_Hello_14_01 " );	// So, what do you want? Roma or something stronger?
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Samuel_Francis(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_Francis_Condition;
	information = DIA_Addon_Samuel_Francis_Info;
	description = " I want to talk to you about Francis. " ;
};


func int DIA_Addon_Samuel_Francis_Condition()
{
	if (Francis_shit out ==  FALSE )
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	return  FALSE ;
};

func void DIA_Addon_Samuel_Francis_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Francis_15_00 " );	// I want to talk to you about Francis.
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_01 " );	// Don't mention that pathetic parody of the captain in front of me!
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_02 " );	// He sits on his fat ass all day with an air of importance.
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_03 " );	// None of us can figure out what the hell the captain was thinking when he left HIM in charge!
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_04 " );	// What do you want from this idiot?
};


instance DIA_Addon_Samuel_Versteck (C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_Addon_Samuel_Versteck_Condition;
	information = DIA_Addon_Samuel_Versteck_Info;
	description = " I have to get to Greg's cabin. " ;
};


func int DIA_Addon_Samuel_Versteck_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Samuel_Francis ) && ( Francis_selection ==  FALSE ) && ( GregIsBack ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Samuel_Versteck_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Francis_15_02 " );	// I have to get into Greg's cabin.
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_05 " );	// Really? Why, I wonder?
	AI_Output(other,self, " DIA_Addon_Samuel_Francis_15_01 " );	// I need bandit armor.
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_06 " );	// Ha ha ha... (laughs) There's no way Francis will let you into the cabin so you can rummage through Greg's stuff.
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_07 " );	// If only...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Что?
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_08 " );	// ...Unless you have something that Francis really needs.
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_09 " );	// I know Francis hid something in an abandoned mine in the canyon.
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_10 " );	// Once we stood guard together, and he, as always, fell asleep. I heard him mutter about it in his sleep.
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_11 " );	// I don't know what he buried there, but it's possible that it's so important to him that he'll let you into the hut for this item...
	AI_Output(self,other, " DIA_Addon_Samuel_Francis_14_12 " );	// (joyfully) When the captain comes back and sees that some of his stuff is missing, he'll skin Francis!
	B_LogEntry(TOPIC_Addon_BDTRuestung, " Moonshiner Samuel mentioned Francis' stash in one of the caves in the canyon. Maybe I'll find something there to help me get into the hut. " );
};


var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SleepHammer;

instance DIA_Addon_Samuel_Recipe(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 4;
	condition = DIA_Addon_Samuel_Recipe_Condition;
	information = DIA_Addon_Samuel_Recipe_Info;
	permanent = TRUE;
	description = " I have a recipe for you! " ;
};


func int DIA_Addon_Samuel_Recipe_Condition()
{
	if (( ( Samuel_Knows_LousHammer ==  FALSE ) && ( Npc_HasItems ( other , ITWr_Addon_Lou_Rezept ) >  0 ) ) ||  
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Recipe_15_00 " );	// I have a recipe for you!
	AI_Output(self,other, " DIA_Addon_Samuel_Recipe_14_01 " );	// Great, show me. What is this recipe?
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);

	if (( Samuel_Knows_LousHammer ==  FALSE ) && ( Npc_HasItems ( other , ITWr_Addon_Lou_Rezept ) >  0 )) .
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Молот Лу",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if ((Samuel_Knows_SchlafHammer ==  FALSE ) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) >  0 ))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe, " Lou's Double Hammer " ,DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};

func void DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
};

func void DIA_Addon_Samuel_Recipe_LousHammer()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Recipe_LousHammer_15_00 " );	// This is from Snaf.
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Lou_Rezept,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Samuel_Recipe_LousHammer_14_04 " );	// But that's terrible! I must try immediately...
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};

func void DIA_Addon_Samuel_Recipe_LousDoubleHammer()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00 " );	// Be careful. This is dangerous stuff!
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept2,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Lou_Rezept2,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04 " );	// You're scaring me. But I'll try anyway.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE ;
};


var int Samuel_Grog_Varianz;

instance DIA_Addon_Samuel_Grog(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 5;
	condition = DIA_Addon_Samuel_Grog_Condition;
	information = DIA_Addon_Samuel_Grog_Info;
	permanent = TRUE;
	description = " I'm here for my grog! (Price: 10 coins) " ;
};


func int DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Grog_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Grog_15_00 " );	// I came for my grog.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		if (Samuel_Grog_Variance ==  0 )
		{
			AI_Output(self,other, " DIA_Addon_Samuel_Grog_14_01 " );	// Yes, you can't lift a finger without a grog. Here, take it.
			Samuel_Grog_Variance = 1 ;
		}
		else  if (Samuel_Grog_Variance ==  1 )
		{
			AI_Output(self,other, " DIA_Addon_Samuel_Grog_14_02 " );	// I hope you can drink it. I've run out of fresh water. But a little sea water never hurt anyone, right?
			Samuel_Grog_Variance = 2 ;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Samuel_Grog_14_03 " );	// You can get as much grog as you want!
		};
		B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Samuel_Grog_14_04 " );	// I sell grog cheap, but not for free! Get some gold, mate.
	};
};


var int Samuel_Rum_Varianz;

instance DIA_Addon_Samuel_Rum(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 6;
	condition = DIA_Addon_Samuel_Rum_Condition;
	information = DIA_Addon_Samuel_Rum_Info;
	permanent = TRUE;
	description = " Give me rum! (Price: 30 coins) " ;
};


func int DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Rum_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Rum_15_00 " );	// Give me rum!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		if (Samuel_Rum_Variance ==  0 )
		{
			AI_Output(self,other, " DIA_Addon_Samuel_Rum_14_01 " );	// Ah, rum for a sailor is like mother's milk! Here, take it!
			Samuel_Rum_Variance = 1 ;
		}
		else  if (Samuel_Rum_Variance ==  1 )
		{
			AI_Output(self,other, " DIA_Addon_Samuel_Rum_14_02 " );	// Rum may have a slight fishy taste. I only have barrels of herring left. But rum is still rum. Your health!
			Samuel_Rum_Variance = 2 ;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Samuel_Rum_14_03 " );	// Here, take it.
		};
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Samuel_Rum_14_04 " );	// You don't have enough gold, mate! How about a grog?
	};
};


var int Samuel_Stronger_Variance;
var int Samuel_DoubleHammer_Variance;

instance DIA_Addon_Samuel_Stronger(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 7;
	condition = DIA_Addon_Samuel_Stronger_Condition;
	information = DIA_Addon_Samuel_Stronger_Info;
	permanent = TRUE;
	description = " I want something stronger! " ;
};


func int DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Stronger_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Stronger_15_00 " );	// I want something stronger!

	if (Samuel_Stronger_Variance ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_14_01 " );	// Ah, I see a kindred spirit! I myself like to experiment.
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_14_02 " );	// A good drink should be clean, strong, and tear through the throat like liquid fire.
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_14_03 " );	// This doesn't happen often. But I talk too much and you want a drink.
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_14_04 " );	// Here. My own recipe. You'll like it. I call this drink 'Quick Herring'.
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
		B_UseItem(other,ItFo_Addon_SchnellerHering);
		AI_Output(other,self, " DIA_Addon_Samuel_Stronger_15_05 " );	// Impressive!
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_14_06 " );	// (laughs) That's right!
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_14_07 " );	// Have you seen any drink recipes? If you meet, be sure to tell me.
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_14_08 " );	// Want more?
		Samuel_Stronger_Variance = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_14_09 " );	// What do you want to cook?
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, " Lou's Double Hammer (Price: 60 coins) " ,DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, " Lou Hammer (Price: 30 coins) " ,DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger, " Quick Herring (Price: 60 coins) " ,DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void B_Addon_Samuel_NoGold()
{
	AI_Output(self,other, " DIA_Addon_Samuel_NoGold_14_00 " );	// No gold - no booze!
};

func void DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
};

func void DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Stronger_SchnellerHering_15_00 " );	// Give me 'Swift Herring'.
	if(B_GiveInvItems(other,self,ItMi_Gold,60))
	{
		AI_Output(self,other, " DIa_Addon_Samuel_Stronger_SchnellerHering_14_01 " );	// Evil drink. But effective!
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, " Lou's Double Hammer (Price: 60 coins) " ,DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, " Lou Hammer (Price: 30 coins) " ,DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger, " Quick Herring (Price: 60 coins) " ,DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Stronger_LousHammer_15_00 " );	// I want 'Lu's Hammer'!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other, " DIA_Addon_Samuel_Stronger_LousHammer_14_01 " );	// Great drink! Enjoy!
		B_GiveInvItems(self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, " Lou's Double Hammer (Price: 60 coins) " ,DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, " Lou Hammer (Price: 30 coins) " ,DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger, " Quick Herring (Price: 60 coins) " ,DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output(other,self, " DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00 " );	// (calmly) Make me a double hammer.
	if(B_GiveInvItems(other,self,ItMi_Gold,60))
	{
		if (Samuel_DoppelHammer_Variance ==  0 )
		{
			AI_Output(self,other, " DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01 " );	// Don't be stupid, son. I really hope you're not taking this for yourself.
		}
		else
		{
			AI_Output(self,other, " DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02 " );	// Yes! Nothing so strengthens the spirit!
		};
		B_GiveInvItems(self,other,ItFo_Addon_SchlafHammer, 1 );
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, " Lou's Double Hammer (Price: 60 coins) " ,DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, " Lou Hammer (Price: 30 coins) " ,DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger, " Quick Herring (Price: 60 coins) " ,DIA_Addon_Samuel_Stronger_SchnellerHering);
};


instance DIA_Addon_Samuel_Trade(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 8;
	condition = DIA_Addon_Samuel_Trade_Condition;
	information = DIA_Addon_Samuel_Trade_Info;
	permanent = TRUE;
	description = " What else do you have? " ;
	trade = TRUE;
};


func int DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Addon_Samuel_Trade_15_00 " );	// What else do you have?
	AI_Output(self,other, " DIA_Addon_Samuel_Trade_14_01 " );	// I can sell you everything a pirate needs to live.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFo_Addon_Grog,Npc_HasItems(self,ItFo_Addon_Grog));
	CreateInvItems(self,ItFo_Addon_Grog,15);
};


instance DIA_Addon_Samuel_News(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 99;
	condition = DIA_Addon_Samuel_News_Condition;
	information = DIA_Addon_Samuel_News_Info;
	permanent = TRUE;
	description = " What's new in camp? " ;
};


func int DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_News_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_News_15_00 " );	// What's new in the camp?
	if (Npc_IsDead(Francis) || (Francis_isDead ==  TRUE ))
	{
		AI_Output(self,other, " DIA_Addon_Samuel_News_14_01 " );	// Francis got what he deserved! I can't even describe how happy this makes me.
		AI_Output(self,other, " DIA_Addon_Samuel_News_14_02 " );	// And you're a normal guy. Let's have a drink - I treat!
		if(GregIsBack == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_Samuel_News_14_03 " );	// And Greg is finally back. He lost his ship, but at least he restored order to the camp.
		};
	}
	else
	{
		if ( ! Npc_IsDead(Morgan))
		{
			AI_Output(self,other, " DIA_Addon_Samuel_News_14_04 " );	// Nothing interesting has happened since Greg left. Morgan and most of the guys drink all day long.
		};
		if(!Npc_IsDead(Henry))
		{
			AI_Output(self,other, " DIA_Addon_Samuel_News_14_05 " );	// Only Henry does business. He and his people are building a palisade.
		};
		AI_Output(self,other, " DIA_Addon_Samuel_News_14_06 " );	// Time for the captain to come back and give Francis a good kick in the ass!
	};
};

var int RecipeCost;
var int SamuelTradeTod;
var int SamuelTradeTodDone;

instance DIA_Addon_Samuel_RiordanRezept(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_RiordanRezept_Condition;
	information = DIA_Addon_Samuel_RiordanRezept_Info;
	description = " Can you teach me how to make a boost drink? " ;
};

func int DIA_Addon_Samuel_RiordanRezept_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (Samuel_Stronger_Varianz == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_RiordanRezept_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_01_00 " );	// Can you teach me how to make a boost drink?
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_01_01 " );	// I usually keep my recipe secret.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_01_02 " );	// But I wonder why you suddenly need it?
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
	Info_AddChoice(DIA_Addon_Samuel_RiordanRezept, " One of the Waterbenders is interested in him. " ,DIA_Addon_Samuel_RiordanRezept_Riordan);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Addon_Samuel_RiordanRezept, " I want to sell it in Khorinis. " ,DIA_Addon_Samuel_RiordanRezept_Trade);
	};

	Info_AddChoice(DIA_Addon_Samuel_RiordanRezept, " Just curious. " ,DIA_Addon_Samuel_RiordanRezept_Just);
};

func void DIA_Addon_Samuel_RiordanRezept_Riordan()
{
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_00 " );	// One of the Waterbenders is interested in him.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_01 " );	// What are you doing? What a news!
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_02 " );	// But why would magicians be interested in such a thing as ordinary moonshine?
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_03 " );	// Your swill has a very interesting effect. So there is nothing surprising in this.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_04 " );	// That's right, you noticed ... (snidely) Okay! I'll show you how to make my potion.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_05 " );	// But you'll have to pay! And don't think I'll sell it cheap.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_06");	//Сколько?
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_07 " );	// I heard mages have a lot of gold! So no less than a thousand gold pieces.
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_08 " );	// You're crazy! It doesn't cost that much.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Riordan_01_09 " );	// It's up to you. Take it or not! I gave you a price - period.
	RecipeCost = 1000 ;
	SamuelTradeTod = TRUE;
	B_LogEntry(TOPIC_SpeedPotion, " Samuel will sell me his recipe for a thousand gold. " );
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

func void DIA_Addon_Samuel_RiordanRezept_Trade()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Trade_01_00 " );	// I just want to arrange its sale in Khorinis.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Trade_01_01 " );	// Do you want to get rich? Understand.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Trade_01_02 " );	// Okay! I will open it to you, but only on one condition.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Trade_01_03 " );	// Half of the money you get for it is mine! Deal?
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Trade_01_04 " );	// Well, it looks like I don't have a choice. Deal!
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Trade_01_05 " );	// Here, take this. Just be careful not to deceive me, or I'll skin you.
	B_GiveInvItems(self,other,ITWr_Addon_Piratentod,1);
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Trade_01_06 " );	// I got it. I just need some time. You know, it's not fast.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Trade_01_07 " );	// Of course.
	B_LogEntry(TOPIC_SpeedPotion, " I have the recipe. Time to get back to Riordian. " );
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

func void DIA_Addon_Samuel_RiordanRezept_Just()
{
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Just_01_00 " );	// Just got curious.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Just_01_01 " );	// Interesting? (sarcastically) Then my answer is no.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Just_01_02 " );	// He is too dear to me to tell everyone I meet about him.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Just_01_03 " );	// So you'd better look elsewhere for interesting things.
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Just_01_04 " );	// I could pay for it!
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Just_01_05 " );	// (thoughtfully) Good. But it will cost you at least two thousand gold coins.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Just_01_06 " );	// And in your case, bargaining with me doesn't make any sense.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Just_01_07");	//Да уж.
	RecipeCost = 2000 ;
	SamuelTradeTod = TRUE;
	B_LogEntry(TOPIC_SpeedPotion, " Samuel will sell me his recipe for two thousand gold. " );
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

instance DIA_Addon_Samuel_RiordanRezept_Buy(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_RiordanRezept_Buy_Condition;
	information = DIA_Addon_Samuel_RiordanRezept_Buy_Info;
	permanent = TRUE;
	description = " Sell me a recipe. " ;
};

func int DIA_Addon_Samuel_RiordanRezept_Buy_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (SamuelTradeTod == TRUE) && (SamuelTradeTodDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_RiordanRezept_Buy_Info()
{
	AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Buy_01_00 " );	// Sell me the recipe.
	AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Buy_01_01 " );	// (carelessly) Where's the gold?

	if(Npc_HasItems(hero,ItMi_Gold) >= RezeptCost)
	{
		AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Buy_01_02 " );	// Here, take this.
		B_GiveInvItems(other,self,ItMi_Gold,RezeptCost);
		AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Buy_01_03 " );	// Good. Your recipe, as agreed.
		B_GiveInvItems(self,other,ITWr_Addon_Piratentod,1);
		SamuelTradeTodDone = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Samuel_RiordanRezept_Buy_01_04 " );	// I don't have that amount yet.
		AI_Output(self,other, " DIA_Addon_Samuel_RiordanRezept_Buy_01_05 " );	// Then come back when you find her.
	};
};

// --------------------------------bones--------------- ----------------------

instance DIA_PIR_1351_Addon_Samuel_Game(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_PIR_1351_Addon_Samuel_Game_condition;
	information = DIA_PIR_1351_Addon_Samuel_Game_info;
	description = " Are any of you playing dice around here? " ;
};

func int DIA_PIR_1351_Addon_Samuel_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Hello))
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_Game_info()
{
 	AI_Output(other,self, " DIA_PIR_1351_Addon_Samuel_Game_01_00 " ); // Are any of you playing dice around here?
 	AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_Game_01_01 " ); // Well, let's say I'm playing. What about you? Do you want to play?
 	AI_Output(other,self, " DIA_PIR_1351_Addon_Samuel_Game_01_02 " ); // Wouldn't mind.
 	AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_Game_01_03 " ); // Good! Then money for a barrel - and forward.
	SamuelPlayResult = 350;
	Menu_WriteInt("AST","SysTimer06",0);
};

instance DIA_PIR_1351_Addon_Samuel_GamePlay(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 900;
	condition = DIA_PIR_1351_Addon_Samuel_GamePlay_condition;
	information = DIA_PIR_1351_Addon_Samuel_GamePlay_info;
	permanent = TRUE;
	description = " Let's play dice! " ;
};

func int DIA_PIR_1351_Addon_Samuel_GamePlay_condition()
{
	if ((Npc_KnowsInfo(other,DIA_PIR_1351_Samuel_Game_Addon) ==  TRUE ) && (Mount_Up ==  FALSE ) && (FlyCarpetIsOn ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer06");

	if(CheckLastGame >= SamuelPlayResult)
	{
		CheckLastSum = CheckLastGame - SamuelPlayResult;
	};

	AI_Output(other,self, " DIA_PIR_1351_Addon_Samuel_GamePlay_01_00 " );	// Let's play dice!

	if(SamuelPlayResult >= CheckLastGame)
	{
		if((SamuelPlayResult > 0) && (SamuelDayFlag == FALSE))
		{
			AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GamePlay_01_01 " );	// Well, let's see what you're worth!
			PlayPocker(1,self);
		}
		else
		{
			if(SamuelDayFlag == FALSE)
			{
				AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GamePlay_01_02 " );	// No! You've already won enough.
				SamuelDayPlay = Wld_GetDay();
				SamuelDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GamePlay_01_03 " );	// Not today, mate.
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GamePlay_01_04 " );	// You haven't given me the money for the last game yet.
		AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GamePlay_01_05 " );	// So pay your debt first! And then we'll play.
		Info_ClearChoices(DIA_PIR_1351_Addon_Samuel_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_PIR_1351_Addon_Samuel_GamePlay, " Here's your money. " ,DIA_PIR_1351_Addon_Samuel_GamePlay_Here);
		};

		Info_AddChoice(DIA_PIR_1351_Addon_Samuel_GamePlay, " I don't have that much money. " ,DIA_PIR_1351_Addon_Samuel_GamePlay_No);
	};
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	SamuelPlayResult = CheckLastGame;
	AI_Output(other,self, " DIA_PIR_1351_Addon_Samuel_GamePlay_Here_01_01 " );	// Here's your money.
	AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GamePlay_Here_01_02 " );	// Another thing! Then maybe we'll start.
	PlayPocker(1,self);
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_No()
{
	AI_Output(other,self, " DIA_PIR_1351_Addon_Samuel_GamePlay_No_01_01 " );	// I don't have that much money.
	AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GamePlay_No_01_02 " );	// Well, what have I got to do with it?
	Info_ClearChoices(DIA_PIR_1351_Addon_Samuel_GamePlay);
};

instance DIA_PIR_1351_Addon_Samuel_GameEnd(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_PIR_1351_Addon_Samuel_GameEnd_condition;
	information = DIA_PIR_1351_Addon_Samuel_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_PIR_1351_Addon_Samuel_GameEnd_condition()
{
	if((MustTellResult_Samuel == TRUE) && ((SamuelLost == TRUE) || (SamuelWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_GameEnd_info()
{
	if(SamuelLost == TRUE)
	{
		AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GameEnd_00 " );	// Anchor in my stern! How could you beat me?!
		SamuelLost = FALSE ;
	}
	else if(SamuelWon == TRUE)
	{
		AI_Output(self,other, " DIA_PIR_1351_Addon_Samuel_GameEnd_01 " );	// Come back when you have extra gold.
		SamuelWon = FALSE;
	};

	MustTellResult_Samuel = FALSE;
};
