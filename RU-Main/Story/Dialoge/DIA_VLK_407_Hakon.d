

instance DIA_Hakon_EXIT(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 999;
	condition = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Lock (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Sperre_Condition;
	information = DIA_Hakon_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hakon_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Sperre_Info()
{
	AI_Output(self,other, " DIA_Hakon_Sperre_12_00 " );	// Get lost, convict! Kantar told me what a dirty bastard you are!
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Hallo (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Hallo_Condition;
	information = DIA_Hakon_Hello_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Hakon_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Hallo_Info()
{
	AI_Output(self,other, " DIA_Hakon_Add_12_00 " );	// I am Hakon, arms dealer.
	AI_Output(self,other, " DIA_Hakon_Add_12_01 " );	// Everyone should carry a gun these days. Especially when you go outside the city walls.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Hakon trades weapons in the marketplace. " );
};


instance DIA_Counter_Trade (C_Info) .
{
	npc = VLK_407_Hakon;
	nr = 99;
	condition = DIA_Hakon_Trade_Condition;
	info = DIA_Hakon_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Hakon_Trade_Condition()
{
	if (Wld_IsTime( 6 , 0 , 20 , 0 ))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Hakon_Trade_15_00 " );	// Show me your products.

	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Hakon_Trade_12_01 " );	// I am honored that a representative of our holy church is interested in my goods.
	}
	else  if (hero.guild ==  GIL_KDW )
	{
		AI_Output(self,other, " DIA_Hakon_Trade_12_02 " );	// I'm always happy to offer my best merchandise to the venerable Water Mage.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Hakon_Trade_12_03 " );	// In my assortment there will certainly be a weapon befitting a warrior of Innos!
	}
	else  if (hero.guild ==  GIL_MIL )
	{
		AI_Output(self,other, " DIA_Hakon_Trade_12_04 " );	// The city's defender needs a good sword!
	}
	else  if (hero.guild ==  GIL_GUR )
	{
		AI_Output(self,other, " DIA_Hakon_Trade_12_05 " );	// You must be in the wrong shop, enlightened one. However, choose.
	}
	else if(hero.guild == GIL_TPL)
	{
		AI_Output(self,other, " DIA_Hakon_Trade_12_06 " );	// So, among you stoned... er... members of the Brotherhood are also real warriors? I have a real weapon!
	}
	else  if (hero.guild ==  GIL_KDM )
	{
		AI_Output(self,other, " DIA_Hakon_Trade_12_07 " );	// Why do you need a weapon, necromancer?! You have cursed beliar magic!
	};

	B_GiveTradeInv(self);
};

instance DIA_Addon_Hakon_MissingPeople(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Addon_Hakon_MissingPeople_Condition;
	information = DIA_Addon_Hakon_MissingPeople_Info;
	description = " What do you know about disappearances? " ;
};


func int DIA_Addon_Hakon_MissingPeople_Condition()
{
	if(SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Hakon_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Hakon_MissingPeople_15_00 " );	// What do you know about disappearances?
	AI_Output(self,other, " DIA_Addon_Hakon_MissingPeople_12_01 " );	// I see a lot of people passing through the east gate.
	AI_Output(self,other, " DIA_Addon_Hakon_MissingPeople_12_02 " );	// Some of the people who come to town I have never seen before, and some of those who leave never come back.
	AI_Output(self,other, " DIA_Addon_Hakon_MissingPeople_12_03 " );	// But something really strange happened recently.
	AI_Output(self,other, " DIA_Addon_Hakon_MissingPeople_12_04 " );	// A man came to town... I think his name was Joe. He talked about how he was going to be rich soon.
	AI_Output(self,other, " DIA_Addon_Hakon_MissingPeople_12_05 " );	// He claimed to have found a way to get into one of the city's towers, where militia weapons are kept.
	AI_Output(self,other, " DIA_Addon_Hakon_MissingPeople_12_06 " );	// I haven't seen him since. Even though I used to see him every day.
	AI_Output(self,other, " DIA_Addon_Hakon_MissingPeople_12_07 " );	// I told the militia about this.
	AI_Output(self,other, " DIA_Addon_Hakon_MissingPeople_12_08 " );	// But Lord Andre said he didn't understand what I was talking about. He didn't even know who the guy was.
	Log_CreateTopic(TOPIC_Addon_Joe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe,LOG_Running);
	B_LogEntry(TOPIC_Addon_Joe, " Hakon, a merchant from Khorinis, says that a man named Joe has disappeared without a trace. Hakon claims that Joe knows how to get into one of the city's towers where the militia stores weapons. " );
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_OutOfTown(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_OutOfTown_Condition;
	information = DIA_Hakon_OutOfTown_Info;
	permanent = FALSE;
	description = " Tell me more about the area around the city. " ;
};


func int DIA_Hakon_OutOfTown_Condition()
{
	return TRUE;
};

func void DIA_Hakon_OutOfTown_Info()
{
	AI_Output(other,self, " DIA_Hakon_Add_15_02 " );	// Tell me more about the area around the city.
	AI_Output(self,other, " DIA_Hakon_Add_12_03 " );	// Now it's very dangerous there
	AI_Output(self,other, " DIA_Hakon_Add_12_04 " );	// Because of the bandits, on the one hand, and because of the invasion of wild animals on the other.
	AI_Output(self,other, " DIA_Hakon_Add_12_05 " );	// Even the beasts seem to have nothing to eat in these troubled times.
	AI_Output(self,other, " DIA_Hakon_Add_12_06 " );	// They began to approach quite close to the city, which was not the case before.
};


instance DIA_Hakon_Paladine(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Paladine_Condition;
	information = DIA_Hakon_Paladine_Info;
	permanent = FALSE;
	description = " Do you know anything about paladins? " ;
};


func int DIA_Hakon_Paladine_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Paladine_Info()
{
	AI_Output(other,self, " DIA_Hakon_Add_15_07 " );	// Do you know anything about paladins?
	AI_Output(self,other, " DIA_Hakon_Add_12_08 " );	// Yes! They ruined me!
	AI_Output(self,other, " DIA_Hakon_Add_12_09 " );	// Now all you can buy in this city is a short sword, and that's at best.
	AI_Output(self,other, " DIA_Hakon_Add_12_10 " );	// They took everything longer than a foot and a half.
	AI_Output(self,other, " DIA_Hakon_Add_12_11 " );	// (sarcastically) And in return, now I can stay in a hotel for free - ha!
};


instance DIA_Hakon_WoWaffen (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_WoWaffen_Condition;
	information = DIA_Hakon_WoWaffen_Info;
	permanent = FALSE;
	description = " Where do you get your weapons? " ;
};


func int DIA_Hakon_WoWaffen_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Hakon_Paladine ))
	{
		return TRUE;
	};
};

func void DIA_Hakon_WoWaffen_Info()
{
	AI_Output(other,self, " DIA_Hakon_Add_15_12 " );	// Where do you get weapons?
	if ( Npc_KnowsInfo ( other , DIA_Hakon_HaradBandits ))
	{
		AI_Output(self,other, " DIA_Hakon_Add_12_13 " );	// Nowhere! Harad used to be my supplier.
	}
	else
	{
		AI_Output(self,other, " DIA_Hakon_Add_12_14 " );	// Blacksmith Harad used to be my supplier.
	};
	AI_Output(self,other, " DIA_Hakon_Add_12_15 " );	// And now everything he does is taken by the paladins.
	AI_Output(self,other, " DIA_Hakon_Add_12_16 " );	// He works like crazy for these guys day and night without any pay! He thinks it's his duty.
	AI_Output(self,other, " DIA_Hakon_Add_12_17 " );	// All I can offer you now is leftovers.
};


instance DIA_Hakon_HaradBandits(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_HaradBandits_Condition;
	information = DIA_Hakon_HaradBandits_Info;
	permanent = FALSE;
	description = " Harad told me about the bandit attack. " ;
};


func int DIA_Hakon_HaradBandits_Condition()
{
	if(Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hakon_HaradBandits_Info()
{
	AI_Output(other,self, " DIA_Hakon_Add_15_18 " );	// Harad told me about the bandit attack.
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Ох? И?
	AI_Output(other,self, " DIA_Hakon_Add_15_20 " );	// He'll vote for me when I become an apprentice if I destroy these bandits.
	AI_Output(self,other, " DIA_Hakon_Add_12_21 " );	// Good old Harad!...(laughs) Maybe he wants to say 'sorry' to me that he can't make weapons for me right now.
};


instance DIA_Confidential_Band (C_Info) .
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Banditen_Condition;
	information = DIA_Hakon_Banditen_Info;
	permanent = FALSE;
	description = " What do you know about these bandits? " ;
};


func int DIA_Hakon_Banditen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hakon_HaradBandits) || Npc_KnowsInfo(hero, DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Banditen_Info()
{
	AI_Output(other,self, " DIA_Hakon_Banditen_15_00 " );	// What do you know about these bandits?
	AI_Output(self,other, " DIA_Hakon_Banditen_12_01 " );	// What do I know about them? They robbed me on my way to town!
	AI_Output(self,other, " DIA_Hakon_Banditen_12_02 " );	// And not only me. They've been robbing here for a long time.
	AI_Output(self,other, " DIA_Hakon_Banditen_12_03 " );	// The militia tried to hunt them down, but failed.
	MIS_HakonBandits = LOG_Running;
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HakonBanditen,LOG_Running);
	B_LogEntry(TOPIC_HakonBanditen, " Hakon, an arms dealer, was robbed by bandits near the city. " );
};


instance DIA_Hakon_Wieviel (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Wieviel_Condition;
	information = DIA_Hakon_Wieviel_Info;
	permanent = FALSE;
	description = " I'll deal with it. " ;
};


func int DIA_Hakon_Wieviel_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wieviel_Info()
{
	AI_Output(other,self, " DIA_Hakon_Banditen_Ehre_15_00 " );	// I'll deal with this.
	AI_Output(self,other, " DIA_Hakon_Banditen_Kohle_12_01 " );	// What?...(surprised) Do you want to deal with the bandits? By oneself?! Are you a good fighter?
	AI_Output(other,self, " DIA_Hakon_Banditen_Kohle_15_00 " );	// How much are you willing to pay for this?
	if ( Npc_KnowsInfo ( other , DIA_Hakon_HaradBandits ))
	{
		AI_Output(self,other, " DIA_Hakon_Add_12_25 " );	// You want to be in good standing with Harad, don't you?
		AI_Output(self,other, " DIA_Hakon_Add_12_26 " );	// I don't think I should pay you for this.
	}
	else
	{
		AI_Output(self,other, " DIA_Hakon_Banditen_Ehre_12_01 " );	// But this is a dangerous business.
		AI_Output(self,other, " DIA_Hakon_Banditen_Kohle_12_02 " );	// Okay, I need this too. I will pay you a hundred gold if you destroy these bandits.
		MIS_HakonBanditsPay = TRUE;
	};
	Info_ClearChoices(DIA_Hakon_Banditen);
};


instance DIA_Hacon_Miliz (C_Info) .
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_Miliz_Condition;
	information = DIA_Hakon_Miliz_Info;
	permanent = FALSE;
	description = " Do you know who in the militia was looking for them? " ;
};


func int DIA_Hack_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Miliz_Info()
{
	AI_Output(other,self, " DIA_Hakon_Miliz_15_00 " );	// Do you know who in the militia was looking for them?
	AI_Output(self,other, " DIA_Hakon_Miliz_12_01 " );	// A guy named Pablo. He and a few other guys went looking for these bandits. But they didn't find them.
	AI_Output(other,self, " DIA_Hakon_Miliz_15_02 " );	// Do you know where I can find Pablo?
	AI_Output(self,other, " DIA_Hakon_Miliz_12_03 " );	// He's patrolling the city! You will find him either at the market place or in the lower part of the city.
	B_LogEntry(TOPIC_HakonBanditen, " Pablo, the city guard, has been fruitlessly searching for bandits. " );
};


instance DIA_Confirmation (C_Info) .
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Wo_Condition;
	information = DIA_Hakon_Wo_Info;
	permanent = FALSE;
	description = " Where did they attack you? " ;
};


func int DIA_Current_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wo_Info()
{
	AI_Output(other,self, " DIA_Hakon_Wo_15_00 " );	// Where did they attack you?
	AI_Output(self,other, " DIA_Hakon_Wo_12_01 " );	// Near the Akila farm. You will leave these city gates and go along the road to the right.
	AI_Output(self,other, " DIA_Hakon_Wo_12_02 " );	// Soon you will see a stone staircase. Those bastards came from there. I bet they have a lair somewhere in the woods.
};


instance DIA_Hakon_Success(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Success_Condition;
	information = DIA_Hakon_Success_Info;
	permanent = FALSE;
	description = " I've dealt with the bandits. " ;
};


func int DIA_Hakon_Success_Condition()
{
	if((MIS_HakonBandits == LOG_Running) && (Npc_IsDead(BDT_10621_Bandit_L) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Success_Info()
{
	AI_Output(other,self, " DIA_Hakon_Success_15_00 " );	// I dealt with the bandits.
	AI_Output(self,other, " DIA_Hakon_Add_12_27 " );	// True? Can anyone confirm this. Do you have proof?
	AI_Output(other,self, " DIA_Hakon_Add_15_28 " );	// (sighs) Should I go back and cut off their heads?
	AI_Output(self,other, " DIA_Hakon_Add_12_29 " );	// (hurriedly) No - I don't think it's necessary. I believe you.
	AI_Output(self,other, " DIA_Hakon_Success_12_01 " );	// You have done a very great service to all the merchants in the city.
	if ( Npc_KnowsInfo ( other , DIA_Hakon_HaradBandits ))
	{
		AI_Output(self,other, " DIA_Hakon_Add_12_30 " );	// Harad will be pleased - I hope.
	};
	if(MIS_HakonBanditsPay == TRUE)
	{
		AI_Output(self,other, " DIA_Hakon_Success_12_02 " );	// Here's the money, as I promised.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Hakon_Bandits);
};


instance DIA_Hakon_Minenanteil (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Minenanteil_Condition;
	information = DIA_Hakon_MinenTeil_Info;
	permanent = FALSE;
	description = " Where did you get these shares, what are you selling here? " ;
};


func int DIA_Hakon_Minenanteil_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (MY_Serpent_MineBefore_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Minenanteil_Info()
{
	AI_Output(other,self, " DIA_Hakon_Minenanteil_15_00 " );	// Where did you get these shares, what are you selling here?
	AI_Output(self,other, " DIA_Hakon_Minenanteil_12_01 " );	// Sorry, but I can't tell you that. It's too dangerous for me.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_PICKPOCKET(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 900;
	condition = DIA_Hakon_PICKPOCKET_Condition;
	info = DIA_Hakon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hakon_PICKPOCKET_Condition()
{
	return  C_Robbery ( 45 , 65 );
};

func void DIA_Hakon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,Dialog_Back,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};

func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};


instance DIA_Hakon_Chapter2 (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Kapitel2_Condition;
	information = DIA_Hakon_Chapter2_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hakon_Chapter2_Condition()
{
	if ((Chapter >=  2 ) && (Canthar_Sperre ==  FALSE ) && (self.aivar[AIV_TalkedToPlayer] ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Kapitel2_Info()
{
	AI_Output(self,other, " DIA_Hakon_Add_12_22 " );	// Ah, you're here again!
	AI_Output(self,other, " DIA_Hakon_Add_12_23 " );	// Harad finally got through with that damn paladin order.
	AI_Output(self,other, " DIA_Hakon_Add_12_24 " );	// This means I can suggest a new weapon. Are you not interested?
};


instance DIA_HAKON_HANNAISPRISION (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = dia_hakon_hannaisprision_condition;
	information = dia_hakon_hannaisprision_info;
	permanent = FALSE;
	description = " I heard you were robbed. " ;
};


func int dia_hakon_hannaisprision_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONHAKON == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_hannaisprision_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Hakon_HannaIsPrision_01_00 " );	// I heard you were robbed.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_01 " );	// Yes, it's true... (puzzled)
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_02 " );	// Although, to be honest, the whole story seems a little strange to me.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_04 " );	// I've known Hannah for years.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_05 " );	// And I can give a hand to cut off that she is an honest person.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_06 " );	// It didn't make any sense for her to steal these things - after all, that junk wasn't even worth a penny.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_07 " );	// The hotel itself brought Hanna quite good money, and risking all this for a couple of coins is simply ridiculous.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_09 " );	// Well, besides that, that witness...
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_11 " );	// ...he says he saw Hannah going through my trunk on the second floor.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_12 " );	// But as far as I know, Hannah just couldn't stand him and wouldn't have let him in at all at the door of her hotel.
	AI_Output(other,self, " DIA_Hakon_HannaIsPrision_01_13 " );	// And what is the reason for such a good relationship?
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_14 " );	// I don't know this. She didn't tell me about it.
	AI_Output(other,self, " DIA_Hakon_HannaIsPrision_01_15 " );	// Got it. What else is strange about this story?
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_18 " );	// Those things that were stolen from me - there was one ring. In itself, it is a trinket, but quite expensive.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_19 " );	// Among the things found, it was not.
	AI_Output(other,self, " DIA_Hakon_HannaIsPrision_01_22 " );	// Interesting. Okay, thanks for the info.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrision_01_23 " );	// Always happy to help.
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " I spoke to Hakon the trader about the Hanna affair. He seems to find the story a little strange himself. He also noted that Hanna just couldn't stand this Gasper. Maybe Abigail knows something about this "After all, she is her sister. Another interesting point in this case is that among the stolen items found on Hannah, one trinket was missing - an expensive ring. Perhaps the one who robbed Hakon decided to keep him. I think , this fact will help me in finding the real thief. " );
	KNOWSHANNAINPRISIONABIGEIL = TRUE;
};


instance DIA_HAKON_HANNAISPRISIONRING (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = dia_hakon_hannaisprisionring_condition;
	information = dia_hakon_hannaisprisionring_info;
	permanent = FALSE;
	description = " Is this your ring? " ;
};


func int dia_hakon_hannaisprisionring_condition()
{
	if (Npc_HasItems(hero,itri_hakonmissring) >=  1 )
	{
		return TRUE;
	};
};

func void dia_hakon_hannaisprisionring_info()
{
	AI_Output(other,self, " DIA_Hakon_HannaIsPrisionRing_01_00 " );	// Is this your ring?
	AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_01 " );	// Yes! This is the same ring that was stolen from me.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_02 " );	// (surprised) But where did you get it from?
	AI_Output(other,self, " DIA_Gorax_Find_Papers_Ok_01_15 " );	// It's a long story...
	AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_04 " );	// Mmm, okay!

	if(HANNAISFREE == FALSE)
	{
		AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_06 " );	// I think that this ring will also come in handy for you.
		AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_07 " );	// So you can keep it for now.
		AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_08 " );	// However, I would gladly return this little thing to myself later.
		HAKONRINGAFTER = TRUE;
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_11 " );	// If you don't mind, I'd love to have it back.
		AI_Output(other,self, " DIA_Hakon_HannaIsPrisionRing_01_12 " );	// No problem. Here, hold it.
		B_GiveInvItems(other,self,itri_hakonmissring,1);
		Npc_RemoveInvItems(self,itri_hakonmissring,1);
		AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_13 " );	// Thank you, buddy.
		AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRing_01_14 " );	// Take this gold as compensation for your troubles. It will be fair!
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
};


instance DIA_HAKON_HANNAISPRISIONRINGAFTER (C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = dia_hakon_hannaisprisionringafter_condition;
	information = dia_hakon_hannaisprisionringafter_info;
	permanent = FALSE;
	description = " Take your ring. " ;
};


func int dia_hakon_hannaisprisionringafter_condition()
{
	if((Npc_HasItems(hero,itri_hakonmissring) >= 1) && (HAKONRINGAFTER == TRUE) && (HANNAISFREE == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_hannaisprisionringafter_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Hakon_HannaIsPrisionRingAfter_01_01 " );	// Take your ring.
	B_GiveInvItems(other,self,itri_hakonmissring,1);
	Npc_RemoveInvItems(self,itri_hakonmissring,1);
	AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRingAfter_01_02 " );	// Thank you, buddy.
	AI_Output(self,other, " DIA_Hakon_HannaIsPrisionRingAfter_01_03 " );	// Take this gold as compensation for your troubles. It will be fair!
	B_GiveInvItems(self,other,ItMi_Gold,100);
};

instance DIA_Hakon_HauntedLH(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_HauntedLH_condition;
	information = DIA_Hakon_HauntedLH_info;
	permanent = FALSE;
	description = " Do you know the name Stefan? " ;
};

func int DIA_Hakon_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE) && (KnowStefan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_HauntedLH_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Hakon_HauntedLH_01_01 " );	// Do you know the name - Stefan?
	AI_Output(self,other, " DIA_Hakon_HauntedLH_01_02 " );	// No, this is the first time I hear about it.
	B_LogEntry(TOPIC_HauntedLighthouse, " Trader Hakon knows nothing about a man named Stefan. " );
};
