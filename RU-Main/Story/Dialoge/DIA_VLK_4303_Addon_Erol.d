

instance DIA_Addon_Erol_EXIT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 999;
	condition = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_EROL_NO_TALK(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_addon_erol_no_talk_condition;
	information = dia_addon_erol_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_erol_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk) && (EROLRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Erol_PICKPOCKET(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 900;
	condition = DIA_Addon_Erol_PICKPOCKET_Condition;
	information = DIA_Addon_Erol_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Erol_PICKPOCKET_Condition()
{
	return  C_Robbery ( 43 , 42 );
};

func void DIA_Addon_Erol_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,Dialog_Back,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};

func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};


instance DIA_Addon_Erol_Hallo (C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Hallo_Condition;
	information = DIA_Addon_Erol_Hallo_Info;
	description = " What's wrong? " ;
};


func int DIA_Addon_Erol_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info()
{
	AI_Output(other,self, " DIA_Addon_Erol_Hallo_15_00 " );	// What's wrong?
	AI_Output(self,other, " DIA_Addon_Erol_Hallo_10_01 " );	// What's the matter?! (furious) Just look at this mess under the bridge!
	AI_Output(self,other, " DIA_Addon_Erol_Hallo_10_02 " );	// I've never seen anything like this in my entire life! These creatures need to be killed every single one.
};


instance DIA_Addon_Erol_what(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_what_Condition;
	information = DIA_Addon_Erol_what_Info;
	description = " What happened? " ;
};


func int DIA_Addon_Erol_what_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Erol_what_Info()
{
	AI_Output(other,self, " DIA_Addon_Erol_what_15_00 " );	// What happened?
	AI_Output(self,other, " DIA_Addon_Erol_what_10_01 " );	// I was calmly driving along the road with my assistants, and suddenly these bastards jumped out of an ambush and killed all my people.
	AI_Output(self,other, " DIA_Addon_Erol_what_10_02 " );	// Good thing I haven't forgotten my signature right hook yet, otherwise I'd be dead too.
	Log_CreateTopic(TOPIC_Addon_Erol,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol,LOG_Running);
	B_LogEntry(TOPIC_Addon_Erol, " Merchant Erol was attacked by bandits. They took all his goods. Erol wants me to return the stolen stone tablets. The bandits are on the bridge near the Dead Harpy tavern. " );
	MIS_Addon_Erol_BanditStuff = LOG_Running;
	Info_ClearChoices(DIA_Addon_Erol_what);
	Info_AddChoice(DIA_Addon_Erol_what, " So your stuff is under the bridge? " ,DIA_Addon_Erol_what_dein);
	Info_AddChoice(DIA_Addon_Erol_what, " What kind of people attacked you? " ,DIA_Addon_Erol_what_wer);
};

func void DIA_Addon_Erol_what_back()
{
	Info_ClearChoices(DIA_Addon_Erol_what);
};

func void DIA_Addon_Erol_what_dein()
{
	AI_Output(other,self, " DIA_Addon_Erol_what_dein_15_00 " );	// So it's your stuff under the bridge?
	AI_Output(self,other, " DIA_Addon_Erol_what_dein_10_01 " );	// Yes. Trolley, goods, everything else.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self, " DIA_Addon_Erol_what_dein_Add_15_00 " );	// I took something from there...
		AI_Output(self,other, " DIA_Addon_Erol_what_dein_Add_10_01 " );	// You can keep these things for yourself, they are of no value.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Erol_what_dein_Add_10_02 " );	// Although all this is of little value.
	};
	AI_Output(self,other, " DIA_Addon_Erol_what_dein_10_02 " );	// But the bandits stole something really valuable from me. Three stone tablets.
	Info_AddChoice(DIA_Addon_Erol_what,Dialog_Back,DIA_Addon_Erol_what_back);
	Info_AddChoice(DIA_Addon_Erol_what, " Stone Tablets? " ,DIA_Addon_Erol_what_Was);
};

func void DIA_Addon_Erol_what_Was()
{
	AI_Output(other,self, " DIA_Addon_Erol_what_Was_15_00 " );	// Stone tablets?
	AI_Output(self,other, " DIA_Addon_Erol_what_Was_10_01 " );	// Yes. The city waterbender wanted to buy them from me. I promised him that I would get them.
	AI_Output(self,other, " DIA_Addon_Erol_what_Was_10_02 " );	// I must return them at all costs, or my reputation will suffer.
	Info_AddChoice(DIA_Addon_Erol_what, " Where do you get these tablets? " ,DIA_Addon_Erol_what_woher);
	Info_AddChoice(DIA_Addon_Erol_what, " Why do waterbenders need signs? " ,DIA_Addon_Erol_what_KDW);
};

func void DIA_Addon_Erol_what_KDW()
{
	AI_Output(other,self, " DIA_Addon_Erol_what_KDW_15_00 " );	// Why do waterbenders need signs?
	AI_Output(self,other, " DIA_Addon_Erol_what_KDW_10_01 " );	// He said that he was studying them, and asked to bring as many as possible.
};

func void DIA_Addon_Erol_what_woher()
{
	AI_Output(other,self, " DIA_Addon_Erol_what_woher_15_00 " );	// Where do you get these signs?
	AI_Output(self,other, " DIA_Addon_Erol_what_woher_10_01 " );	// I find them in ancient buildings, like mausoleums. And sometimes they can be found in caves.
	AI_Output(self,other, " DIA_Addon_Erol_what_woher_10_02 " );	// I've already sold a whole bunch of tablets to the waterbender.
	AI_Output(self,other, " DIA_Addon_Erol_what_woher_10_03 " );	// However, they are quite rare here. Most often I find them in the northeast of Khorinis.
	Info_AddChoice(DIA_Addon_Erol_what, " Why don't you just look for new signs? " ,DIA_Addon_Erol_what_neue);
};

func void DIA_Addon_Erol_what_neue()
{
	AI_Output(other,self, " DIA_Addon_Erol_what_neue_15_00 " );	// Why don't you just look for new signs?
	AI_Output(self,other, " DIA_Addon_Erol_what_neue_10_01 " );	// During a fight with bandits, I sprained my ankle.
	AI_Output(self,other, " DIA_Addon_Erol_what_neue_10_02 " );	// I won't get far with a lame leg.
};

func void DIA_Addon_Erol_what_wer()
{
	AI_Output(other,self, " DIA_Addon_Erol_what_wer_15_00 " );	// What kind of people attacked you?
	AI_Output(self,other, " DIA_Addon_Erol_what_wer_10_01 " );	// Bandits, who else? They settled on the bridge.
	AI_Output(self,other, " DIA_Addon_Erol_what_wer_10_02 " );	// Rob everyone who tries to get through.
	AI_Output(self,other, " DIA_Addon_Erol_what_wer_10_03 " );	// I knew they had an ambush there, so I decided to drive under the bridge.
	AI_Output(self,other, " DIA_Addon_Erol_what_wer_10_04 " );	// But it looks like they found my cart too tempting.
	AI_Output(self,other, " DIA_Addon_Erol_what_wer_10_05 " );	// Those bastards just jumped off the bridge right at us.
	AI_Output(self,other, " DIA_Addon_Erol_what_wer_10_06 " );	// I should have tried to pass unnoticed at night...
};


instance DIA_Addon_Erol_FernandosWeapons(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_FernandosWeapons_Condition;
	information = DIA_Addon_Erol_FernandosWeapons_Info;
	description = " Do you know anything about supplying weapons to bandits? " ;
};


func int DIA_Addon_Erol_FernandosWeapons_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Erol_what ) && ( MY_Vatras_FindTheBanditTrader == LOG_Running ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Erol_FernandosWeapons_Info()
{
	AI_Output(other,self, " DIA_Addon_Erol_FernandosWeapons_15_00 " );	// Do you know anything about supplying weapons to bandits?
	AI_Output(self,other, " DIA_Addon_Erol_FernandosWeapons_10_01 " );	// Weapon deliveries? Yes, I know something. Some swine from the city sold them so many weapons that they barely took them away.
	AI_Output(self,other, " DIA_Addon_Erol_FernandosWeapons_10_02 " );	// Part of it is stored on the bridge by the bandits who attacked me.
	AI_Output(self,other, " DIA_Addon_Erol_FernandosWeapons_10_03 " );	// Part of it was taken somewhere towards the Bengara farm in the upper pastures.
	AI_Output(self,other, " DIA_Addon_Erol_FernandosWeapons_10_04 " );	// Perhaps the bandits wanted to smuggle weapons across the passage.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,Dialog_Back,DIA_Addon_Erol_FernandosWeapons_back);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons, " Where are these upper pastures? " ,DIA_Addon_Erol_FernandosWeapons_bengar);
};

func void DIA_Addon_Erol_FernandosWeapons_bengar()
{
	AI_Output(other,self, " DIA_Addon_Erol_FernandosWeapons_bengar_15_00 " );	// Where are these upper pastures?
	AI_Output(self,other, " DIA_Addon_Erol_FernandosWeapons_bengar_10_01 " );	// In the central part of Khorinis is the 'Dead Harpy', Orlan's tavern.
	AI_Output(self,other, " DIA_Addon_Erol_FernandosWeapons_bengar_10_02 " );	// A road leads south from it. It passes through the upper pastures to the passage to the Valley of the Mines.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back()
{
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};


instance DIA_Addon_Erol_Stoneplates(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Stoneplates_Condition;
	information = DIA_Addon_Erol_Stoneplates_Info;
	permanent = TRUE;
	description = " About those stone tablets... " ;
};


func int DIA_Addon_Erol_Stoneplates_Condition()
{
	if(MIS_Addon_Erol_BanditStuff == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};


var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = 10;

func void DIA_Addon_Erol_Stoneplates_Info()
{
	var int StoneplatesCount;
	var int XP_Addon_BringStoneplates;
	var int StoneplatesGeld;

	AI_Output(other,self, " DIA_Addon_Erol_Stoneplates_15_00 " );	// About those stone tablets...

	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		StoneplatesCount = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);

		if(StoneplatesCount == 1)
		{
			AI_Output(other,self, " DIA_Addon_Erol_Stoneplates_15_01 " );	// I have one of these.
			B_GivePlayerXP(XP_Addon_BringStoneplate);
			B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,1);
			Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
			StoneplatesCounter = StoneplatesCounter + 1;
		}
		else
		{
			AI_Output(other,self, " DIA_Addon_Erol_Stoneplates_15_02 " );	// I have a few.

			if((StoneplatesCount + StoneplatesCounter) >= 3)
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,3 - StoneplatesCounter);
				Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
				XP_Addon_BringStoneplates = (3 - StoneplatesCounter) * XP_Addon_BringStoneplate;
				StoneplatesCounter = 3;
			}
			else
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,StoneplatesCount);
				Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
				XP_Addon_BringStoneplates = StoneplatesCount * XP_Addon_BringStoneplate;
				StoneplatesCounter = StoneplatesCounter + StoneplatesCount;
			};

			B_GivePlayerXP(XP_Addon_BringStoneplates);
		};
		AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_03 " );	// Thank you.

		if(StoneplatesCounter == 1)
		{
			AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_04 " );	// Now I'm only missing two.
		}
		else if(StoneplatesCounter == 2)
		{
			AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_05 " );	// Now I'm missing only one.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_06 " );	// That's enough. The waterbender will get what I promised, and I can finally return home.
			MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};

		AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_07 " );	// Of course I'll pay you.
		StoneplatesGeld = Addon_ErolsStoneplatesOffer * Npc_HasItems(self,ItWr_StonePlateCommon_Addon);
		CreateInvItems(self,ItMi_Gold,StoneplatesGeld);
		B_GiveInvItems(self,other,ItMi_Gold,StoneplatesGeld);
		Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));

		if(MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_08 " );	// I'm going home! If you want, you can come with me.
			AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_09 " );	// When we get to my house, I can sell you some things.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(C_ScHasMagicStonePlate() == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Erol_Stoneplates_15_10 " );	// Will this sign work?
		AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_11 " );	// No. She has magical powers.
		AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_12 " );	// A waterbender doesn't buy these signs.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Erol_Stoneplates_15_13 " );	// How many labels do you need?
		AI_Output(self,other, " DIA_Addon_Erol_Stoneplates_10_14 " );	// To save my reputation, I need to give three tablets to the waterbender.
	};
};


instance DIA_Addon_Erol_Buerger(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Buerger_Condition;
	information = DIA_Addon_Erol_Buerger_Info;
	description = " Do you live in the city? " ;
};


func int DIA_Addon_Erol_Buerger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Buerger_Info()
{
	AI_Output(other,self, " DIA_Addon_Erol_Buerger_15_00 " );	// Do you live in the city?
	AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_01 " );	// I haven't been there in years, mate. There is nothing to keep me among these stupid and greedy pigs living in the upper quarter.
	AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_02 " );	// I used to be a pretty influential citizen in my day, but that was a long time ago.

	if (( TRADEGUILD MEMBER  ==  FALSE ) && ( MY_TRADEGUILD  !=  LOG_FAILED ) && ( NIGELTELLABOUTGUILD  ==  FALSE ) && ( EROLTELLABOUTGUILD  ==  FALSE ))
	{
		AI_Output(other,self, " DIA_Addon_Erol_Buerger_10_03 " );	// You were still trading then?!
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_04 " );	// Not just engaged, but was one of the largest merchants in the city!
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_05 " );	// And besides that, I also headed the trade guild of Khorinis.
		AI_Output(other,self, " DIA_Addon_Erol_Buerger_10_06 " );	// Trade Guild?!
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_07 " );	// What, did you fall from the moon?!...(surprised)
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_09 " );	// Hmmm... (surprised) Very strange!
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_10 " );	// To be honest, I haven't met people yet who haven't heard of this!
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_11 " );	// Although it's possible, the guild is trying to keep its status low these days.
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_12 " );	// This is understandable - the times are turbulent now. The district is simply teeming with all sorts of bandits and other scum!
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_13 " );	// Yes, and you can see for yourself - trading has become a very dangerous business.
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_14 " );	// But earlier, the merchant guild of Khorinis was one of the most influential guilds in all of Myrtana!
		AI_Output(self,other, " DIA_Addon_Erol_Buerger_10_15 " );	// To be a member of it was a special honor and not many were honored with it.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_16");	//Э-эх!...(печально)
		EROLTELLABOUTGUILD = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADEGUILD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_tradeguild_condition;
	information = dia_addon_erol_tradeguild_info;
	permanent = FALSE;
	description = " I want to join the trade guild too. " ;
};


func int dia_addon_erol_tradeguild_condition()
{
	if (( EROLTELLABOUTGUILD  ==  TRUE ) && ( MEMBERTRADEGUILD  ==  FALSE ) && ( MY_TRADEGUILD  !=  LOG_FAILED ) && ( NIGELTELLABOUTGUILD  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_addon_erol_tradeguild_info()
{
	AI_Output(other,self, " DIA_Addon_Erol_TradeGuild_01_00 " );	// I want to join the trade guild too. Can you help me with this?
	AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_02 " );	// Hmmm... (thoughtfully) I actually retired a long time ago.
	AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_03 " );	// Although, despite this, I still have some connections in the guild.
	AI_Output(other,self, " DIA_Addon_Erol_TradeGuild_01_04 " );	// So it won't be hard for you to help me?
	AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_05 " );	// Well, okay...

	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Erol_Teach_10_01 " );	// But you will do me one favor.
		AI_Output(self,other, " DIA_Addon_Erol_Teach_10_02 " );	// Help me save my reputation! Bring me the stone tablets for the waterbender.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_06 " );	// Then I'll help you join the merchant's guild.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_07 " );	// Especially since you've done me an invaluable service by returning my tablets.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_08 " );	// And the debt, as you know, is red in payment!
		AI_Output(other,self, " DIA_Addon_Erol_TradeGuild_01_09 " );	// What should I do?
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_10 " );	// Nothing for you...(laughs) I'll take care of everything myself.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_11 " );	// I'll write you a letter of recommendation for a friend of mine.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_13 " );	// He is a very influential person in the city, and besides, he is the current master of the merchants guild.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_14 " );	// It's just that he won't listen to you, but with my letter it's another matter!
		AI_Output(other,self, " DIA_Addon_Erol_TradeGuild_01_15 " );	// And what will I tell him?
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_16 " );	// You don't need to say anything special. He himself will read everything in this letter.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_17 " );	// And believe me, I'll write in such a way that he will have no reason not to accept you into the guild.
		AI_Output(other,self, " DIA_Addon_Erol_TradeGuild_01_20 " );	// Okay. Then write your letter.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_21 " );	// Here, take it and take it to Mr. Luthero.
		B_GiveInvItems(self,other,itwr_erolletter,1);
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_22");	//Лютеро?
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuild_01_23 " );	// Yes, you probably already know him, and it will not be difficult for you to find him.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_25");	//Хорошо.
		EROLGIVERECOMENDATION = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADEGUILDHOW(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_tradeguildhow_condition;
	information = dia_addon_erol_tradeguildhow_info;
	permanent = TRUE;
	description = " Regarding the trade guild... " ;
};


func int dia_addon_erol_tradeguildhow_condition()
{
	if (Npc_KnowsInfo(hero,dia_addon_erol_tradeguild) && ( EROLTELLABOUTGUILD  ==  TRUE ) && ( EROLGIVERECOMMENDATION  ==  FALSE ) && ( TRADEGUILD MEMBER  ==  FALSE ) && ( MY_TRADEGUILD  !=  LOG_FAILED ) && ( NIGELTELLABOUTGUILD  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_erol_tradeguildhow_info()
{
	AI_Output(other,self, " DIA_Addon_Erol_TradeGuildHow_01_00 " );	// About the merchant guild...
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_01 " );	// I told you - first give me back my planks!
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_02 " );	// And then we'll talk about your request.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_03 " );	// Good. You helped me and I will help you.
		AI_Output(other,self, " DIA_Addon_Erol_TradeGuildHow_01_04 " );	// What should I do?
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_05 " );	// Nothing for you...(laughs) I'll take care of everything myself.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_06 " );	// I'll write you a letter of recommendation for a friend of mine.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_08 " );	// He is a very influential person in the city, and besides, he is the current master of the merchants guild.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_09 " );	// It's just that he won't listen to you, but with my letter it's another matter.
		AI_Output(other,self, " DIA_Addon_Erol_TradeGuildHow_01_10 " );	// And what will I tell him?
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_11 " );	// You don't need to say anything special. He himself will read everything in this letter.
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_12 " );	// And believe me, I'll write in such a way that he will have no reason not to accept you into the guild.
		AI_Output(other,self, " DIA_Addon_Erol_TradeGuildHow_01_15 " );	// Okay. Then write your letter.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_16 " );	// Here, take it and take it to Mr. Luthero.
		B_GiveInvItems(self,other,itwr_erolletter,1);
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_17");	//Лютеро?
		AI_Output(self,other, " DIA_Addon_Erol_TradeGuildHow_01_18 " );	// Yes, you probably already know him, and it will not be difficult for you to find him.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_20");	//Хорошо.
		EROLGIVERECOMENDATION = TRUE;
	};
};


instance DIA_Addon_Erol_PreTeach (C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_PreTeach_Condition;
	information = DIA_Addon_Erol_PreTeach_Info;
	description = " Were you able to fight off the bandits? " ;
};


func int DIA_Addon_Erol_PreTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Erol_PreTeach_Info()
{
	AI_Output(other,self, " DIA_Addon_Erol_PreTeach_15_00 " );	// Were you able to fight off the bandits?
	AI_Output(self,other, " DIA_Addon_Erol_PreTeach_10_01 " );	// Yes. But they are still sitting on the bridge.
	AI_Output(other,self, " DIA_Addon_Erol_PreTeach_15_02 " );	// Can you teach me how to kick like that?
	AI_Output(self,other, " DIA_Addon_Erol_PreTeach_10_03 " );	// Of course.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,LogText_Addon_Erol_Teach);
};


instance DIA_Addon_Erol_PreTrade (C_Info) .
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_PreTrade_Condition;
	information = DIA_Addon_Erol_PreTrade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Addon_Erol_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000) && (ErolRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTrade_Info()
{
	AI_Output(other,self, " DIA_Elena_TRADE_15_00 " );	// Show me your products.
	AI_Output(self,other, " DIA_Addon_Erol_PreTrade_10_00 " );	// I can't sell you anything. All my things were left under the bridge.
	AI_Output(self,other, " DIA_Addon_Erol_PreTrade_10_01 " );	// You can only buy something from me when I get home.

	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Erol_PreTrade_10_02 " );	// But I can't go back until I get the mage tablets.
	};
};


instance DIA_Addon_Erol_SLD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_SLD_Condition;
	information = DIA_Addon_Erol_SLD_Info;
	description = " Is this your home? " ;
};


func int DIA_Addon_Erol_SLD_Condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int Erol_IsAtHome;

func void DIA_Addon_Erol_SLD_Info()
{
	AI_Output(other,self, " DIA_Addon_Erol_SLD_15_00 " );	// (surprised) Is this your house?
	AI_Output(self,other, " DIA_Addon_Erol_SLD_10_01 " );	// Yes. And what? Is there anything wrong?
	AI_Output(other,self, " DIA_Addon_Erol_SLD_15_02 " );	// Do you have problems with mercenaries?
	AI_Output(self,other, " DIA_Addon_Erol_SLD_10_03 " );	// As long as I keep my nose out of their business, they don't touch me.
	AI_Output(self,other, " DIA_Addon_Erol_SLD_10_04 " );	// Plus, they're good buyers. And I pay them to guard my house while I'm away.
	B_GivePlayerXP(XP_Ambient);

	if (Erol_IsAtHome ==  FALSE )
	{
		Npc_ExchangeRoutine(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};

var int ErolGiveFood;

instance DIA_Addon_Erol_Trade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_Trade_Condition;
	information = DIA_Addon_Erol_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " Show me your products. " ;
};

func int DIA_Addon_Erol_Trade_Condition()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && Wld_IsTime(8,0,22,0) && ((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000) || (ErolRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

var int DIA_Addon_Erol_Trade_OneTime;

func void DIA_Addon_Erol_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_2");
	AI_Output(self,other, " DIA_Addon_Erol_Trade_10_00 " );	// However, I have no choice.

	if (( MIS_STOLENMATERIAL  == LOG_Running ) && ( ErolGiveMat ==  FALSE ))
	{
		CreateInvItems(self,itmi_novmaterial,1);
		ErolGiveMat = TRUE;
	};
	if (Erol_IsAtHome ==  FALSE )
	{
		Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
		B_LogEntry(Topic_OutTrader,LogText_Addon_ErolTrade);
		Npc_ExchangeRoutine(self,"Home");
		Erol_IsAtHome = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Erol_Teach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 99;
	condition = DIA_Addon_Erol_Teach_Condition;
	information = DIA_Addon_Erol_Teach_Info;
	permanent = TRUE;
	description = " Show me how to hit harder. " ;
};


func int DIA_Addon_Erol_Teach_Condition()
{
	if(Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Teach_Info()
{
	AI_Output(other,self, " DIA_Addon_Erol_Teach_15_00 " );	// Show me how to hit harder.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Erol_Teach_10_01 " );	// Okay, but you're doing me one favor.
		AI_Output(self,other, " DIA_Addon_Erol_Teach_10_02 " );	// Help me save my reputation and get my tablets back.
		AI_Output(self,other, " DIA_Addon_Erol_Teach_10_03 " );	// Then I'll show you how to increase your strength in combat.
	}
	else  if (Erol_Bonus ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Erol_Teach_Add_10_00 " );	// Good. Watch attentively. There is one simple trick.
		AI_Output(self,other, " DIA_Addon_Erol_Teach_Add_10_01 " );	// When you strike, don't use the strength of your hand, but the strength of your whole body.
		AI_Output(self,other, " DIA_Addon_Erol_Teach_Add_10_02 " );	// At the same time, you must rotate your hip, bring your shoulder forward and straighten your arm.
		AI_Output(self,other, " DIA_Addon_Erol_Teach_Add_10_03 " );	// (laughs) If you hit it right, you'll understand!
		B_RaiseAttribute_Bonus(other,ATR_STRENGTH,1);
		Erol_Bonus = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Erol_Teach_Add_10_04 " );	// If you want to achieve more, you must train hard...
		Info_ClearChoices(DIA_Addon_Erol_Teach);
		Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
		Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
	};
};

func void DIA_Addon_Erol_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_Erol_Teach);
};

func void DIA_Addon_Erol_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

func void DIA_Addon_Erol_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

instance DIA_ADDON_EROL_LURKER(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 10;
	condition = dia_addon_erol_lurker_condition;
	information = dia_addon_erol_lurker_info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int dia_addon_erol_lurker_condition()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};

func void dia_addon_erol_lurker_info()
{
	AI_Output(other,self, " DIA_VLK_4303_Addon_Erol_Lurker_01_00 " );	// How are you?

	if((Kapitel >= 1) && (MIS_RABOGLAV == FALSE) && (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_01 " );	// (evil) Shit! Look at my house - I barely put it in order.
		AI_Output(other,self, " DIA_VLK_4303_Addon_Erol_Lurker_01_02 " );	// What was wrong with him?
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_03 " );	// Can you imagine, some vile creature pogrom in it! Broke all the furniture!
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_04 " );	// She even split the chest in half and ate all of its contents.
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_05 " );	// And he's the work of Torben!
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_06 " );	// All the walls, the entire floor covered with mud and mud! Rotten fish carried in general from everything! The stench stood that even now it hurts the eyes!
		AI_Output(other,self, " DIA_VLK_4303_Addon_Erol_Lurker_01_07 " );	// And why do you need these two hulks with axes that rub next to your hut?
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_08 " );	// They say they didn't see anyone... damn fools!
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_09 " );	// And then they dare to beg for money from me. Goblin tail them in ... and not gold!
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_10 " );	// I bet you drank schnapps as usual and fell asleep, damn hogs!
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_11 " );	// By the way, it still seems to me that this creature is hanging around somewhere nearby.
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_12 " );	// I would have slapped her myself, but after that story with the bandits, something really hurt my leg.
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_13 " );	// Can you help? Finish off this bastard, and I won't stand up for the price!
		AI_Output(other,self, " DIA_VLK_4303_Addon_Erol_Lurker_01_14 " );	// Okay! If she suddenly catches my eye, so be it - I will kill her for you.
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_15 " );	// Good! Just be sure to bring her claws, they must be of the rarest strength. It looks like they were mainly used by this viper here!
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_16 " );	// It was supposed to be like this... Chest and cut in half! (laughter) Nightmare!
		Wld_InsertNpc(lurker_uniq,"NW_LAKE_GREG_TREASURE_01");
		MIS_RABOGLAV = LOG_Running;
		Log_CreateTopic(TOPIC_RABOGLAV,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RABOGLAV,LOG_Running);
		B_LogEntry( TOPIC_RABOGLAV , " Erol told me about the attack on his house. He thinks it was something that stinks of rotten fish. I agreed to deal with this thing, just remember to cut the trophy off it. " );
	}
	else  if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_17 " );	// These guys in black cassocks give me goosebumps.
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_18 " );	// They walk around here all the time, sniffing out something... (nervously) I don't like all this!
	}
	else
	{
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_19 " );	// So far so good.
		AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_Lurker_01_20 " );	// If something happens, I'll let you know.
	};
};

instances DIA_VLK_4303_ADDON_EROL_RABOGLAV (C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_vlk_4303_addon_erol_raboglav_condition;
	information = dia_vlk_4303_addon_erol_raboglav_info;
	permanent = FALSE;
	description = " That creature of yours is finished! " ;
};

func int dia_vlk_4303_addon_erol_raboglav_condition()
{
	if (( MIS_RABOGLAV  == LOG_Running) && Npc_IsDead(lurker_unique) && (Npc_HasItems(other, ITAT_LEADERLURKER ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_vlk_4303_addon_erol_raboglav_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_VLK_4303_Addon_Erol_RABOGLAV_01_00 " );	// That creature is finished! It turned out to be a huge snag.
	AI_Output(other,self, " DIA_VLK_4303_Addon_Erol_RABOGLAV_01_01 " );	// And here are his claws. In general, everything as you asked.
	B_GiveInvItems(other,self,ITAT_LEADERLURKER,1);
	Npc_RemoveInvItems(self,ITAT_LEADERLURKER,1);

	if(Trophy_LURKERLEADER == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_LURKERLEADER,Npc_HasItems(other,ItUt_LURKERLEADER));
		Trophy_LURKERLEADER = FALSE;
	};

	AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_RABOGLAV_01_02 " );	// Wow! You can take your head off with one blow!
	AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_RABOGLAV_01_03 " );	// Probably had to mess with her... with him?
	AI_Output(other,self, " DIA_VLK_4303_Addon_Erol_RABOGLAV_01_04 " );	// Yes, it took a little effort. But, I hope I didn't overthink it.
	AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_RABOGLAV_01_05 " );	// Of course not. Here, as I promised, keep your reward.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other, " DIA_VLK_4303_Addon_Erol_RABOGLAV_01_06 " );	// Not mountains of gold, but enough, I think. You know, times are hard right now!
	AI_Output(other,self, " DIA_VLK_4303_Addon_Erol_RABOGLAV_01_07 " );	// Enough is enough. Well, come on!
	MIS_RABOGLAV = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RABOGLAV,LOG_SUCCESS);
	B_LogEntry( TOPIC_RABOGLAV , " Erol was very surprised when he saw the size of the claws of the shnyg that annoyed him. " );
};


//--------------------CEO----------------------------------------------

instance DIA_ADDON_EROL_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_recrdt_condition;
	information = dia_addon_erol_recrdt_info;
	permanent = FALSE;
	description = " How is trading? " ;
};

func int dia_addon_erol_recrdt_condition()
{
	if((MIS_PPL_FOR_TOWER == LOG_Running) && (PasswordSet == TRUE) && (Erol_IsAtHome == TRUE) && (VALERANRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_recrdt_info()
{
	AI_Output(other,self, " DIA_Addon_Erol_RecrDT_15_00 " );	// How is trading?
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_01 " );	// Hello. But not very.
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_02 " );	// I'm old enough to walk back and forth with carts full of goods. Yes, the roads are now more dangerous.
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_03 " );	// Here are bandits, there are monsters, now these creepy personalities in dark cloaks are staggering back and forth.
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_04 " );	// I would like to retire, but then I will die of boredom.
	AI_Output(other,self, " DIA_Addon_Erol_RecrDT_15_05 " );	// Wouldn't you like to change the scope of your activity a little?
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_06 " );	// What do you mean?
	AI_Output(other,self, " DIA_Addon_Erol_RecrDT_15_07 " );	// That maybe I have a job for you.
	AI_Output(other,self, " DIA_Addon_Erol_RecrDT_15_08 " );	// It so happens that I now own a tower next to Onar's farm, in which I am going to organize a small camp. And I am in dire need of an experienced and dexterous manager.
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_09 " );	// Offering this place to me? Hmmm, interesting proposal, but you won't give an answer right off the bat.
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_10 " );	// You see, I'm more of a merchant. I'm good at stuffing junk goods and counting money, but I don't have much experience in managing people.
	AI_Output(other,self, " DIA_Addon_Erol_RecrDT_15_11 " );	// I'll deal with people myself.
	AI_Output(other,self, " DIA_Addon_Erol_RecrDT_15_12 " );	// You, if you agree, will just have to deal with money and housekeeping: keep track of payments, stocks, property. Contact with suppliers and persuade them to cooperate on favorable terms for us.
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_13 " );	// This pleases. What about housing? Do I understand correctly that I will have to leave my house and move in with you?
	AI_Output(other,self, " DIA_Addon_Erol_RecrDT_15_14 " );	// That's right. You will have to live with me. The food is on me too.
	AI_Output(self,other, " DIA_Addon_Erol_RecrDT_10_15 " );	// Moving is a very big decision... I definitely need to think about it. Come tomorrow and I'll give you the answer!
	EROLDECISIONDAY = Wld_GetDay();
};

instance DIA_ADDON_EROL_AGREES_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_agrees_recrdt_condition;
	information = dia_addon_erol_agrees_recrdt_info;
	permanent = FALSE;
	description = " What about my offer? " ;
};

func int dia_addon_erol_agrees_recrdt_condition()
{
	if ( Npc_KnowsInfo ( hero , his_addon_erol_recrdt ) && ( EROLD_DECISIONDATE  < Wld_GetDay ()) && ( RECRUITEDVALUE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_erol_agrees_recrdt_info()
{
	AI_Output(other,self, " DIA_Addon_Erol_Agrees_RecrDT_15_00 " );	// What about my suggestion?
	AI_Output(self,other, " DIA_Addon_Erol_Agrees_RecrDT_10_01 " );	// (Surprised) What other suggestion?
	AI_Output(self,other, " DIA_Addon_Erol_Agrees_RecrDT_10_02 " );	// I'm kidding, I'm kidding. In general, I thought about it and realized that for me this is now the best option.
	AI_Output(self,other, " DIA_Addon_Erol_Agrees_RecrDT_10_03 " );	// Also, I'm never averse to trying new things.
	AI_Output(self,other, " DIA_Addon_Erol_Agrees_RecrDT_10_04 " );	// In other words, I agree!
	AI_Output(other,self, " DIA_Addon_Erol_Agrees_RecrDT_15_05 " );	// Shine! In that case, pack your things and stomp to the tower, I'll be waiting for you there. And yes, I almost forgot: how much do you want for your services?
	AI_Output(self,other, " DIA_Addon_Erol_Agrees_RecrDT_10_06 " );	// Well, given that housing and food are on you, forty gold a day will be enough.
	AI_Output(self,other, " DIA_Addon_Erol_Agrees_RecrDT_10_07 " );	// I already have savings, I don’t want to go to tavern drinking because of my age, and there’s nothing else to spend money on here.
	Info_ClearChoices(dia_addon_erol_agrees_recrdt);
	Info_AddChoice(dia_addon_erol_agrees_recrdt, " Great. See you in the tower then. " ,dia_addon_erol_agrees_recrdt_yes);
	Info_AddChoice(dia_addon_erol_agrees_recrdt, " Forty gold pieces? Now I need to think... " ,dia_addon_erol_agrees_recrdt_no);
};

func void dia_addon_erol_agrees_recrdt_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Erol_Agrees_RecrDT_yes_15_00 " );	// Great. See you at the tower then. If you are asked for a password at the entrance, then it is 'Dragon Treasures'.
	AI_Output(self,other, " DIA_Addon_Erol_Agrees_RecrDT_yes_10_01 " );	// It's good that this is just a password, not an entry fee. See you!
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Erol agreed to be my manager. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	EROLRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_addon_erol_agrees_recrdt_no()
{
	AI_Output(other,self, " DIA_Addon_Erol_Agrees_RecrDT_no_15_00 " );	// Forty gold pieces? I'm sorry, I need to think...
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_EROL_ATLAST_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_atlast_recrdt_condition;
	information = dia_addon_erol_atlast_recrdt_info;
	permanent = FALSE;
	description = " You're accepted! " ;
};

func int dia_addon_erol_atlast_recrdt_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_addon_erol_agrees_recrdt ) && ( RECRUITEDVALUE  ==  FALSE ) && ( EROLRECRUITED  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_erol_atlast_recrdt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Addon_Erol_Atlast_RecrDT_15_00 " );	// You're accepted! If you are asked for a password at the entrance, then it is 'Dragon Treasures'.
	AI_Output(self,other, " DIA_Addon_Erol_Atlast_RecrDT_10_01 " );	// It's not too smart to make a password what every second idler who imagines himself an adventurer and does not want to work dreams about and chats about incessantly. But none of my business - see you!
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Erol agreed to be my manager. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	EROLRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

instance DIA_EROL_FIRSTCEO(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_condition;
	information = dia_erol_firstceo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_erol_firstceo_condition()
{
	if((EROLRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 5000))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_info()
{
	AI_Output(self,other, " DIA_Erol_FirstCEO_10_00 " );	// No, - of course, I expected that not everything would be in order here, but so...
	AI_Output(self,other, " DIA_Erol_FirstCEO_10_01 " );	// Blood, dust, debris, furniture all cracked. Well, okay, let's deal with this. Now to business.
	AI_Output(self,other, " DIA_Erol_FirstCEO_10_02 " );	// You mentioned that you want to set up some kind of camp here. Am I remembering correctly?
	AI_Output(other,self, " DIA_Erol_FirstCEO_15_03 " );	// Yes. Lord Hagen wants me to put things in order in this area, it was on these terms that the tower was transferred to me.
	AI_Output(other,self, " DIA_Erol_FirstCEO_15_04 " );	// On the same terms, I agreed with Onar so that he would not interfere with my living here.
	AI_Output(other,self, " DIA_Erol_FirstCEO_15_05 " );	// But since I can't support and defend this tower alone, I'll need people. With the first two you, I think, have already met.
	AI_Output(self,other, " DIA_Erol_FirstCEO_10_06 " );	// I like your plans. Perhaps it will even be interesting to return this place to a civilized look.
	AI_Output(self,other, " DIA_Erol_FirstCEO_10_07 " );	// Well, first of all, you need to leave me some money, from which I could make the necessary payments.
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_08");	//Сколько?
	AI_Output(self,other, " DIA_Erol_FirstCEO_10_09 " );	// Five thousand gold, no less.
	CEONEEDSFIRSTMONEY = TRUE;
};

instance DIA_EROL_FIRSTCEO_MONEYLATE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_moneylate_condition;
	information = dia_erol_firstceo_moneylate_info;
	permanent = FALSE;
	description = " Here's five thousand gold pieces. " ;
};

func int dia_erol_firstceo_moneylate_condition()
{
	if((CEONEEDSFIRSTMONEY == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_moneylate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Erol_FirstCEO_MoneyLate_15_00 " );	// Here's five thousand gold pieces.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other, " DIA_Erol_FirstCEO_MoneyLate_10_01 " );	// Great! So, we have sorted out the money for the moment, and I can immediately start doing business.
	AI_Output(self,other, " DIA_Erol_FirstCEO_MoneyLate_10_02 " );	// However, besides that, I and the rest of the people need something to eat.
	AI_Output(self,other, " DIA_Erol_FirstCEO_MoneyLate_10_03 " );	// I think you should leave us at least fifty pieces of roasted meat, twenty-five fish, and ten loaves of bread to begin with.
	DT_BUDGET = 5000;
	DT_BUDGETACTIVE = TRUE;
	EVERYDAYDTMONEY = Wld_GetDay();
	CEONEEDSFIRSTMONEY = FALSE;
	CEONEEDSFIRSTFOOD = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " The people living here need a starting supply of food, fifty pieces of roasted meat, twenty-five fish and ten loaves of bread to be exact. " );
};

instance DIA_EROL_FIRSTCEO_FOODLATE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_foodlate_condition;
	information = dia_erol_firstceo_foodlate_info;
	permanent = FALSE;
	description = " Here's all the food you need. " ;
};

func int dia_erol_firstceo_foodlate_condition()
{
	if((CEONEEDSFIRSTFOOD == TRUE) && (Npc_HasItems(other,ItFo_Bread) >= 10) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Fish) >= 25) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_foodlate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Erol_FirstCEO_FoodLate_15_00 " );	// Here's all the food you need.
	B_GiveInvItems(other,self,ItFoMutton,50);
	Npc_RemoveInvItems(self,ItFoMutton,50);
	B_GiveInvItems(other,self,ItFo_Fish,25);
	Npc_RemoveInvItems(self,ItFo_Fish,25);
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_01 " );	// Great! Now I have enough money and food supplies to enable me to run the household without difficulty.
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_02 " );	// But this is only enough for a while. You don't want to be ruined by the contents of this tower, do you?
	AI_Output(other,self, " DIA_Erol_FirstCEO_FoodLate_15_03 " );	// Of course not. What do I need to do to avoid this?
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_04 " );	// Find people who will agree to work for you.  	
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_05 " );	// For example, find hunters who will provide meat for our supplies.
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_06 " );	// There's also a mine nearby, maybe there's still some ore left in it. You should check it out.
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_07 " );	// In a word, think. You travel more than I do, and it's easier for you to find people willing to join you.
	AI_Output(other,self, " DIA_Erol_FirstCEO_FoodLate_15_08 " );	// Okay... I think I have a few people in mind.
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_09 " );	// Good luck with your search. And yes, remember that the organization of the food and money supply is on you, and that most people eat 3 times a day.
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_10 " );	// I can't do this, because it requires a long excommunication from the tower, and then I will no longer be able to fulfill my direct duties - to keep housekeeping and order here.
	AI_Output(self,other, " DIA_Erol_FirstCEO_FoodLate_10_11 " );	// You can't let the tower run out of money or food.
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Now that I have a manager, I can think about expanding and finding people willing to work for me. However, I must remember that they will need to pay money and provide three meals a day. " );
	DT_FOODSTOCK = 120;
	DT_FOODSTOCKACTIVE = TRUE;
	EVERYDAYDTFOOD = Wld_GetDay();
	CEONEEDSFIRSTFOOD = FALSE;
	HURRAYICANHIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireCook(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireCook_condition;
	information = DIA_Erol_CanHireCook_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireCook_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanHireCook == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireCook_info()
{
	AI_Output(self,other, " DIA_Erol_CanHireCook_10_00 " );	// The first food deliveries have begun in the camp. This is good news!
	AI_Output(self,other, " DIA_Erol_CanHireCook_10_01 " );	// However, the question arises regarding its storage. After all, without proper care, part of the food will simply go bad.
	AI_Output(other,self, " DIA_Erol_CanHireCook_10_02 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_Erol_CanHireCook_10_03 " );	// In my opinion, the camp would benefit from a good cook who could take this problem into her own hands.
	AI_Output(self,other, " DIA_Erol_CanHireCook_10_04 " );	// Think about it! It is very important.
	AI_Output(other,self, " DIA_Erol_CanHireCook_10_05 " );	// Okay, I'll think of something.
	EddaNeed = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " The camp needs a chef to handle food storage issues. I wonder who I should talk to? " );
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireSmith(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireSmith_condition;
	information = DIA_Erol_CanHireSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireSmith_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanHireSmith == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireSmith_info()
{
	AI_Output(self,other, " DIA_Erol_CanHireSmith_10_00 " );	// Mining has begun in the camp.
	AI_Output(self,other, " DIA_Erol_CanHireSmith_10_01 " );	// It's time to think about getting a good blacksmith. Moreover, as you can see, we have the forge itself.
	AI_Output(other,self, " DIA_Erol_CanHireSmith_10_02 " );	// And where can I find it for you? There are not so many good blacksmiths on this island.
	AI_Output(self,other, " DIA_Erol_CanHireSmith_10_03 " );	// Agree. But if you want your camp to really grow and get stronger, then you have to find it.
	AI_Output(self,other, " DIA_Erol_CanHireSmith_10_04 " );	// Only a blacksmith can repair weapons, patch up armor, perhaps make something for sale from the ore we mine.
	AI_Output(self,other, " DIA_Erol_CanHireSmith_10_05 " );	// So you'd better flex your brain and think about who could take this place.
	AI_Output(other,self, " DIA_Erol_CanHireSmith_10_06 " );	// Okay, I'll think of something.
	CarlNeed = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , "The camp needs a blacksmith. Without it, it can't really progress. " );
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireHealer(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireHealer_condition;
	information = DIA_Erol_CanHireHealer_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireHealer_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE) && ((WOLFRECRUITEDDT == TRUE) || (ALRIKRECRUITEDDT == TRUE) || (GAYVERNRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireHealer_info()
{
	AI_Output(self,other, " DIA_Erol_CanHireHealer_10_00 " );	// In recent days, guards have increased in the camp.
	AI_Output(self,other, " DIA_Erol_CanHireHealer_10_01 " );	// That's a good thing, as we've recently been attacked by several ravenous creatures.
	AI_Output(self,other, " DIA_Erol_CanHireHealer_10_02 " );	// One of the guards took a fair amount of damage in that fight, but fortunately for him, the wound was not too serious.
	AI_Output(self,other, " DIA_Erol_CanHireHealer_10_03 " );	// However, if this continues, we will soon lose all the people here.
	AI_Output(other,self, " DIA_Erol_CanHireHealer_10_04 " );	// What are you implying?
	AI_Output(self,other, " DIA_Erol_CanHireHealer_10_05 " );	// We need a healer. And best of all - an alchemist who can brew healing elixirs for such cases.
	AI_Output(other,self, " DIA_Erol_CanHireHealer_10_06 " );	// Hmmm... This is even more difficult than the blacksmith.
	AI_Output(self,other, " DIA_Erol_CanHireHealer_10_07 " );	// I understand that this is not an easy task. But the fate of the people living in the camp depends on her decision.
	AI_Output(self,other, " DIA_Erol_CanHireHealer_10_08 " );	// So you'll have to do something about it.
	AI_Output(other,self, " DIA_Erol_CanHireHealer_10_09 " );	// Okay, I'll look for a healer for us.
	SagittaNeed = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , "The camp needs a healer. Without this, the people won't last long. " );
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanProduceSmith (C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanProduceSmith_condition;
	information = DIA_Erol_CanProduceSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanProduceSmith_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanProduceSmith_info()
{
	AI_Output(self,other, " DIA_Erol_CanProduceSmith_10_00 " );	// Carl started working at the forge. I'm glad you were able to get him to join us.
	AI_Output(self,other, " DIA_Erol_CanProduceSmith_10_01 " );	// But now it's worth thinking about the main thing.
	AI_Output(other,self, " DIA_Erol_CanProduceSmith_10_02 " );	// What do you mean?
	AI_Output(self,other, " DIA_Erol_CanProduceSmith_10_03 " );	// The forge must generate income, otherwise it will be of little use.
	AI_Output(other,self, " DIA_Erol_CanProduceSmith_10_04 " );	// Good. What will be the proposals?
	AI_Output(self,other, " DIA_Erol_CanProduceSmith_10_05 " );	// We could use our ore reserves to further process it into steel billets.
	AI_Output(self,other, " DIA_Erol_CanProduceSmith_10_06 " );	// It's a pretty hot commodity these days, and selling it will allow us to cut down on the camp's cash costs significantly.
	AI_Output(other,self, " DIA_Erol_CanProduceSmith_10_07 " );	// Sounds good.
	AI_Output(self,other, " DIA_Erol_CanProduceSmith_10_08 " );	// I like it too. So think about it.
	CanSellOre = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Erol suggested using the ore stock to make steel billets that could later be sold. This would provide the camp with additional income. " );
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanProduceWeapon(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanProduceWeapon_condition;
	information = DIA_Erol_CanProduceWeapon_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanProduceWeapon_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (WOLFRECRUITEDDT == TRUE) && (ALRIKRECRUITEDDT == TRUE) && (GAYVERNRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanProduceWeapon_info()
{
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_01 " );	// There have been more people in the camp lately. I think we should better arm our guards.
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_02 " );	// Moreover, times are now turbulent, various predatory creatures roam around.
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_03 " );	// Someone even saw a real live orc not far from here!
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_04 " );	// If we don't take care of our safety, this place will become easy prey for bandits or for the same orcs.
	AI_Output(other,self, " DIA_Erol_CanProduceWeapon_10_05 " );	// What can we do?
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_06 " );	// Carl will provide us with weapons. He, of course, is not a master blacksmith, but he will be able to forge a solid sword.
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_07 " );	// But our fighters need better armor. Those that are now on them will not save even from the bite of an ordinary blood hornet.
	AI_Output(other,self, " DIA_Erol_CanProduceWeapon_10_08 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_13 " );	// Naturally, it would be better if we could produce our own armor. But for this we need drawings and diagrams for their manufacture.
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_14 " );	// I'm sure you've been to different places, and you've probably come across something similar before.
	AI_Output(self,other, " DIA_Erol_CanProduceWeapon_10_15 " );	// If anything, bring them to me. And I'll make sure our boys don't walk around in rags anymore.
	CanGiveArmor = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_EROL_CrawlerArmor(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_EROL_CrawlerArmor_condition;
	information = DIA_EROL_CrawlerArmor_info;
	permanent = FALSE;
	description = " I brought the armor blueprints. " ;
};

func int DIA_EROL_CrawlerArmor_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanGiveArmor == TRUE) && (GiveNewArmorDocs == FALSE) && (Npc_HasItems(other,ItWr_ArmorDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_EROL_CrawlerArmor_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_EROL_CrawlerArmor_15_00 " );	// I brought the blueprints for the armor.
	B_GiveInvItems(other,self,ItWr_ArmorDocs,1);
	Npc_RemoveInvItems(self,ItWr_ArmorDocs,1);
	AI_Output(self,other, " DIA_EROL_CrawlerArmor_15_01 " );	// Good! Give them here. I'll give these blueprints to Carl to sort them out.
	AI_Output(self,other, " DIA_EROL_CrawlerArmor_15_02 " );	// If it's really possible to make armor from them, then in a couple of days all our guys will already be flaunting them.
	AI_Output(other,self, " DIA_EROL_CrawlerArmor_15_03 " );	// I really hope so.
	GiveNewArmorDocs = Wld_GetDay();
	CanGiveArmorDocs = TRUE;
};

instances of DIA_EROL_ArmorDone (C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_EROL_ArmorDone_condition;
	information = DIA_EROL_ArmorDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_EROL_ArmorDone_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanGiveOtherArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_EROL_ArmorDone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_EROL_ArmorDone_15_00 " );	// Carl finished making the armor, and I immediately gave it to our guys.
	AI_Output(self,other, " DIA_EROL_ArmorDone_15_01 " );	// Now you don't have to worry about their equipment. And the armor itself looks very strong.
	AI_Output(self,other, " DIA_EROL_ArmorDone_15_02 " );	// Here, take it! I left this copy especially for you. They will come in handy for you too.
	B_GiveInvItems(self,other,ItAr_OldSteelArmor,1);
	AI_Output(other,self, " DIA_EROL_ArmorDone_15_03 " );	// Thank you.
};

instance DIA_Erol_BUSINESSACTION(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 21;
	condition = dia_Erol_businessaction_condition;
	information = dia_Erol_businessaction_info;
	permanent = TRUE;
	description = " I would like to do something... " ;
};

func int dia_Erol_businessaction_condition()
{
	if((HURRAYICANHIRE == TRUE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_businessaction_info()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_15_00 " );	// I'd like to do something.
	AI_Output(self,other, " DIA_Erol_BusinessAction_10_01 " );	// What exactly?	
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction, " Take money from camp treasury. " ,dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction, " Add money to camp coffers. " ,dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction, " Sell food stocks from camp storage. " ,dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction, " Leave food supplies in the camp storage. " ,dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction, " Collect magic ore from camp warehouse. " ,DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction, " Pick up iron ore from camp storage. " ,DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction, " Start production of steel blanks. " ,DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction, " Stop production of steel billets. " ,DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_oretake()
{
	AI_Output(other,self, " dia_Erol_businessaction_oretake_15_00 " );	// I'd like to pick up the magic ore from the warehouse in the camp.

	if(DT_BUDGET_ORE == FALSE)
	{
		AI_Output(self,other, " dia_Erol_businessaction_oretake_10_01 " );	// Unfortunately, we don't have extra ore reserves right now.
	}
	else
	{
		AI_Output(self,other, " dia_Erol_businessaction_oretake_10_02 " );	// Good. Here's all the magic ore we've got!
		B_GiveInvItems(self,other,ItMi_Nugget,DT_BUDGET_ORE);
		DT_BUDGET_ORE = 0;
	};

	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction, " Take money from camp treasury. " ,dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction, " Add money to camp coffers. " ,dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction, " Sell food stocks from camp storage. " ,dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction, " Leave food supplies in the camp storage. " ,dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction, " Collect magic ore from camp warehouse. " ,DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction, " Pick up iron ore from camp storage. " ,DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction, " Start production of steel blanks. " ,DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction, " Stop production of steel billets. " ,DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_irontake()
{
	AI_Output(other,self, " dia_Erol_businessaction_irontake_15_00 " );	// I'd like to pick up the iron ore from the warehouse in the camp.

	if(DT_BUDGET_IRON == FALSE)
	{
		AI_Output(self,other, " dia_Erol_businessaction_irontake_10_01 " );	// Unfortunately, we don't have extra ore reserves right now.
	}
	else
	{
		AI_Output(self,other, " dia_Erol_businessaction_irontake_10_02 " );	// Good. Here's all the iron ore we've got!
		B_GiveInvItems(self,other,ItMi_SNugget,DT_BUDGET_IRON);
		DT_BUDGET_IRON = 0;
	};

	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction, " Take money from camp treasury. " ,dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction, " Add money to camp coffers. " ,dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction, " Sell food stocks from camp storage. " ,dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction, " Leave food supplies in the camp storage. " ,dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction, " Collect magic ore from camp warehouse. " ,DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction, " Pick up iron ore from camp storage. " ,DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction, " Start production of steel blanks. " ,DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction, " Stop production of steel billets. " ,DIA_Erol_businessaction_produce_off);
		};
	};
};


func void dia_Erol_businessaction_produce_on()
{
	DoSellOre = TRUE;
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction, " Take money from camp treasury. " ,dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction, " Add money to camp coffers. " ,dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction, " Sell food stocks from camp storage. " ,dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction, " Leave food supplies in the camp storage. " ,dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction, " Collect magic ore from camp warehouse. " ,DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction, " Pick up iron ore from camp storage. " ,DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction, " Start production of steel blanks. " ,DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction, " Stop production of steel billets. " ,DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_produce_off()
{
	DoSellOre = FALSE;
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction, " Take money from camp treasury. " ,dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction, " Add money to camp coffers. " ,dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction, " Sell food stocks from camp storage. " ,dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction, " Leave food supplies in the camp storage. " ,dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction, " Collect magic ore from camp warehouse. " ,DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction, " Pick up iron ore from camp storage. " ,DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction, " Start production of steel blanks. " ,DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction, " Stop production of steel billets. " ,DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_back()
{
	Info_ClearChoices(dia_Erol_businessaction);
};

func void dia_Erol_businessaction_budgetgive()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_BudgetGive_15_00 " );	// I'd like to contribute money to the camp coffers.
	AI_Output(self,other, " DIA_Erol_BusinessAction_BudgetGive_10_01 " );	// What amount are we talking about?
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Five hundred gold coins. " ,dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifteen thousand gold coins. " ,dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two and a half thousand gold coins. " ,dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_small()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_BudgetGive_Small_15_00 " );	// Five hundred gold coins.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET + 500;
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Five hundred gold coins. " ,dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifteen thousand gold coins. " ,dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two and a half thousand gold coins. " ,dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_medium()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_BudgetGive_Medium_15_00 " );	// One and a half thousand gold coins.
	B_GiveInvItems(other,self,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET + 1500;
	Npc_RemoveInvItems(self,ItMi_Gold,1500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Five hundred gold coins. " ,dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifteen thousand gold coins. " ,dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two and a half thousand gold coins. " ,dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_huge()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_BudgetGive_Huge_15_00 " );	// Two and a half thousand gold coins.
	B_GiveInvItems(other,self,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET + 2500;
	Npc_RemoveInvItems(self,ItMi_Gold,2500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Five hundred gold coins. " ,dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifteen thousand gold coins. " ,dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two and a half thousand gold coins. " ,dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_BudgetTake_15_00 " );	// I'd like to take money from the camp coffers.

	if(DT_BUDGET <= 5000)
	{
		AI_Output(self,other, " DIA_Erol_BusinessAction_BudgetTake_10_01 " );	// Unfortunately, I can't give you the money right now, as I only have the minimum funds necessary to keep the camp running smoothly.
		Info_ClearChoices(dia_Erol_businessaction);
	}
	else
	{
		AI_Output(self,other, " DIA_Erol_BusinessAction_BudgetTake_10_02 " );	// How many specifically?
		Info_ClearChoices(dia_Erol_businessaction);

		if(DT_BUDGET > 5000)
		{
			Info_AddChoice(dia_Erol_businessaction, " Five hundred gold coins. " ,dia_Erol_businessaction_budgettake_small);
		};
		if(DT_BUDGET >= 6000)
		{
			Info_AddChoice(dia_Erol_businessaction, " Fifteen thousand gold coins. " ,dia_Erol_businessaction_budgettake_medium);
		};
		if(DT_BUDGET >= 7000)
		{
			Info_AddChoice(dia_Erol_businessaction, " Two and a half thousand gold coins. " ,dia_Erol_businessaction_budgettake_huge);
		};

		Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	};
};

func void dia_Erol_businessaction_budgettake_small()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_BudgetTake_Small_15_00 " );	// Five hundred gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET - 500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Five hundred gold coins. " ,dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifteen thousand gold coins. " ,dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two and a half thousand gold coins. " ,dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake_medium()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_BudgetTake_Medium_15_00 " );	// One and a half thousand gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET - 1500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Five hundred gold coins. " ,dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifteen thousand gold coins. " ,dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two and a half thousand gold coins. " ,dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self, " DIA_Erol_BusinessAction_BudgetTake_Huge_15_00 " );	// Two and a half thousand gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET - 2500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Five hundred gold coins. " ,dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifteen thousand gold coins. " ,dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two and a half thousand gold coins. " ,dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodGive_15_00 " );	// I'd like to leave food supplies in the warehouse at the camp.
	AI_Output(self,other, " DIA_Erol_BusinessAction_FoodGive_10_01 " );	// How much supplies are we talking about?
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of grilled meat. " ,dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of raw meat. " ,dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two dozen fresh fish. " ,dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction, " Ten loaves of bread. " ,dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_hmf()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodGive_MF_15_00 " );	// Twenty pieces of fried meat.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of grilled meat. " ,dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of raw meat. " ,dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two dozen fresh fish. " ,dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction, " Ten loaves of bread. " ,dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_mf()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodGive_MF_15_00 " );	// Twenty pieces of raw meat.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of grilled meat. " ,dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of raw meat. " ,dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two dozen fresh fish. " ,dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction, " Ten loaves of bread. " ,dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_fb()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodGive_FB_15_00 " );	// Two dozen fresh fish.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of grilled meat. " ,dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of raw meat. " ,dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two dozen fresh fish. " ,dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction, " Ten loaves of bread. " ,dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_bsc()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodGive_BSC_15_00 " );	// Ten loaves of bread.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of grilled meat. " ,dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty pieces of raw meat. " ,dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction, " Two dozen fresh fish. " ,dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction, " Ten loaves of bread. " ,dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell()
{
	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodSell_15_00 " );	// I'd like to sell food from the warehouse in the camp.

	if(DT_FOODSTOCK < 130)
	{
		AI_Output(self,other, " DIA_Erol_BusinessAction_FoodSell_10_01 " );	// Unfortunately, this is not possible, because the stocks in the warehouse are minimal for the normal existence of the camp in the near future.
		Info_ClearChoices(dia_Erol_businessaction);
	}
	else
	{
		AI_Output(self,other, " DIA_Erol_BusinessAction_FoodSell_10_02 " );	// This can be arranged. How much specific food do you want to sell?
		Info_ClearChoices(dia_Erol_businessaction);

		if(DT_FOODSTOCK >= 130)
		{
			Info_AddChoice(dia_Erol_businessaction, " Ten units of food (Treasury income: 50 gold coins) " ,dia_Erol_businessaction_foodsell_small);
		};
		if(DT_FOODSTOCK >= 145)
		{
			Info_AddChoice(dia_Erol_businessaction, " Twenty-five units of food (Treasury income: 125 gold coins) " ,dia_Erol_businessaction_foodsell_medium);
		};
		if(DT_FOODSTOCK >= 170)
		{
			Info_AddChoice(dia_Erol_businessaction, " Fifty units of food (Treasury income: 250 gold coins) " ,dia_Erol_businessaction_foodsell_huge);
		};

		Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	};
};

func void dia_Erol_businessaction_foodsell_small()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodSell_Small_15_00 " );	// Ten units of food.
	DT_BUDGET = DT_BUDGET + 50;
	DT_FOODSTOCK = DT_FOODSTOCK - 10;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction, " Ten units of food (Treasury income: 50 gold coins) " ,dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty-five units of food (Treasury income: 125 gold coins) " ,dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifty units of food (Treasury income: 250 gold coins) " ,dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell_medium()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodSell_Medium_15_00 " );	// Twenty-five units of food.
	DT_BUDGET = DT_BUDGET + 125;
	DT_FOODSTOCK = DT_FOODSTOCK - 25;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction, " Ten units of food (Treasury income: 50 gold coins) " ,dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty-five units of food (Treasury income: 125 gold coins) " ,dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifty units of food (Treasury income: 250 gold coins) " ,dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self, " DIA_Erol_BusinessAction_FoodSell_Huge_15_00 " );	// Fifty units of food.
	DT_BUDGET = DT_BUDGET + 250;
	DT_FOODSTOCK = DT_FOODSTOCK - 50;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction, " Ten units of food (Treasury income: 50 gold coins) " ,dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction, " Twenty-five units of food (Treasury income: 125 gold coins) " ,dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction, " Fifty units of food (Treasury income: 250 gold coins) " ,dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

instance DIA_Erol_MONEYCRISIS(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_Erol_moneycrisis_condition;
	information = dia_Erol_moneycrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Erol_moneycrisis_condition()
{
	if((DTMONEYCRISIS == TRUE) && (DTFOODCRISIS == FALSE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_moneycrisis_info()
{
	var string concatText1;

	DTMONEYDEBT = 5000 - DT_BUDGET;
	AI_Output(self,other, " DIA_Erol_MoneyCrisis_07_00 " );	// Finally! There is no money in the camp, I have nothing to pay people's salaries!
	AI_Output(self,other, " DIA_Erol_MoneyCrisis_07_01 " );	// I barely managed to talk them out of starting to go home.
	AI_Output(self,other, " DIA_Erol_MoneyCrisis_07_02 " );	// We urgently need money!
	AI_Output(other,self,"DIA_Erol_MoneyCrisis_15_03");	//Сколько?
	concatText1 = ConcatStrings("Необходимо ",IntToString(DTMONEYDEBT));
	concatText1 = ConcatStrings(concatText1, " gold coins " );
	AI_Print(concatText1);
	Info_ClearChoices(dia_Erol_moneycrisis);

	if(Npc_HasItems(other,ItMi_Gold) >= DTMONEYDEBT)
	{
		Info_AddChoice(dia_Erol_moneycrisis, " Here's the money. " ,dia_Erol_moneycrisis_yes);
	};

	Info_AddChoice(dia_Erol_moneycrisis, " I don't have that kind of money right now. " ,dia_Erol_moneycrisis_no);
};

func void dia_Erol_moneycrisis_yes()
{
	AI_Output(other,self, " DIA_Erol_MoneyCrisis_Yes_15_00 " );	// Here's the money.
	AI_Output(self,other, " DIA_Erol_MoneyCrisis_Yes_07_01 " );	// Great! I will immediately arrange for the payment of debts.
	B_GiveInvItems(other,self,ItMi_Gold,DTMONEYDEBT);
	DT_BUDGET = DT_BUDGET + DTMONEYDEBT;
	Npc_RemoveInvItems(self,ItMi_Gold,DTMONEYDEBT);
	DTMONEYCRISIS = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_Erol_moneycrisis_no()
{
	AI_Output(other,self, " DIA_Erol_MoneyCrisis_No_15_00 " );	// I don't have that kind of money right now.
	AI_Output(self,other, " DIA_Erol_MoneyCrisis_No_07_01 " );	// Then find them! You can't be so irresponsible!
	AI_StopProcessInfos(self);
};

instance DIA_Erol_FOODCRISIS(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_Erol_foodcrisis_condition;
	information = dia_Erol_foodcrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Erol_foodcrisis_condition()
{
	if((DTFOODCRISIS == TRUE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_foodcrisis_info()
{
	AI_Output(self,other, " DIA_Erol_FoodCrisis_07_00 " );	// Finally! The camp ran out of food, we have nothing to eat!
	AI_Output(self,other, " DIA_Erol_FoodCrisis_07_01 " );	// I have temporarily agreed with Onar on supplies, but he has an important contract on his nose, and he will stop them as soon as he concludes it.
	AI_Output(self,other, " DIA_Erol_FoodCrisis_07_02 " );	// We urgently need food! First of all, meat, fish, bread...
	Info_ClearChoices(dia_Erol_foodcrisis);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis, " Here are twenty pieces of grilled meat. " ,dia_Erol_foodcrisis_m);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis, " Here are twenty pieces of raw meat. " ,dia_Erol_foodcrisis_rm);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis, " Here are two dozen fresh fish. " ,dia_Erol_foodcrisis_f);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_foodcrisis, " Here are ten loaves of bread. " ,dia_Erol_foodcrisis_b);
	};

	Info_AddChoice(dia_Erol_foodcrisis, " I don't have enough food with me. " ,dia_Erol_foodcrisis_no);
};

func void dia_Erol_foodcrisis_m()
{
	AI_Output(other,self, " DIA_Erol_FoodCrisis_M_15_00 " );	// Here are twenty pieces of fried meat.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other, " DIA_Erol_FoodCrisis_M_07_01 " );	// Great! This is enough for now.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0 ;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other, " DIA_Erol_FoodCrisis_M_07_02 " );	// More! We need more food.

		if(Npc_HasItems(other,ItFoMutton) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis, " Here are twenty pieces of grilled meat. " ,dia_Erol_foodcrisis_m);
		};
	};
};

func void dia_Erol_foodcrisis_rm()
{
	AI_Output(other,self, " DIA_Erol_FoodCrisis_RM_15_00 " );	// Here are twenty pieces of raw meat.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other, " DIA_Erol_FoodCrisis_RM_07_01 " );	// Great! This is enough for now.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0 ;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other, " DIA_Erol_FoodCrisis_RM_M_07_02 " );	// More! We need more food.

		if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis, " Here are twenty pieces of raw meat. " ,dia_Erol_foodcrisis_rm);
		};
	};
};

func void dia_Erol_foodcrisis_f()
{
	AI_Output(other,self, " DIA_Erol_FoodCrisis_F_15_00 " );	// Here are two dozen fresh fish.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other, " DIA_Erol_FoodCrisis_F_07_01 " );	// Great! This is enough for now.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0 ;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other, " DIA_Erol_FoodCrisis_F_07_02 " );	// More! We need more food.

		if(Npc_HasItems(other,ItFo_Fish) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis, " Here are two dozen fresh fish. " ,dia_Erol_foodcrisis_f);
		};
	};
};

func void dia_Erol_foodcrisis_b()
{
	AI_Output(other,self, " DIA_Erol_FoodCrisis_B_15_00 " );	// Here are ten loaves of bread.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other, " DIA_Erol_FoodCrisis_B_07_01 " );	// Great! This is enough for now.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0 ;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other, " DIA_Erol_FoodCrisis_B_07_02 " );	// More! We need more food.

		if(Npc_HasItems(other,ItFo_Bread) >= 10)
		{
			Info_AddChoice(dia_Erol_foodcrisis, " Here are ten loaves of bread. " ,dia_Erol_foodcrisis_b);
		};
	};
};

func void dia_Erol_foodcrisis_no()
{
	AI_Output(other,self, " DIA_Erol_FoodCrisis_No_15_00 " );	// I don't have enough food with me. I myself live from hand to mouth.
	AI_Output(self,other, " DIA_Erol_FoodCrisis_No_07_01 " );	// Oh, Innos! You can't be so irresponsible! We need food!
	AI_StopProcessInfos(self);
};

instance DIA_EROL_IGETTHEFOUTOFHERE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 15;
	condition = dia_erol_igetthefoutofhere_condition;
	information = dia_erol_igetthefoutofhere_info;
	permanent = FALSE;
	description = " I'm going to sail to the mainland. " ;
};


func int dia_erol_igetthefoutofhere_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_igetthefoutofhere_info()
{
	AI_Output(other,self, " DIA_Erol_IGetTheFOutOfHere_15_00 " );	// I'm going to sail to the mainland. Can you watch the tower?
	AI_Output(self,other, " DIA_Erol_IGetTheFOutOfHere_10_01 " );	// This is unexpected news... are you sailing away forever, or do you intend to return after some time?
	AI_Output(other,self, " DIA_Erol_IGetTheFOutOfHere_15_02 " );	// I'm afraid not, I won't be returning to Khorinis. If you're willing to keep running the tower, I'll leave it to you.
	AI_Output(self,other, " DIA_Erol_IGetTheFOutOfHere_10_03 " );	// Uh... well, whatever you say. Thanks to your efforts, we are well settled here, so I think we can continue to support this camp.
	AI_Output(self,other, " DIA_Erol_IGetTheFOutOfHere_10_04 " );	// Now that your tower and Onar's farm have become the main center of resistance to the orcs, we can strengthen relations with the rest of the camps and continue to fight these creatures together.
	AI_Output(self,other, " DIA_Erol_IGetTheFOutOfHere_10_05 " );	// So I think you can sail away without worrying about the welfare of the camp.
	AI_Output(self,other, " DIA_Erol_IGetTheFOutOfHere_10_06 " );	// You've already done all you can for us, and now it's our turn to put in the effort. Have a good trip!
	AI_Output(other,self, " DIA_Erol_IGetTheFOutOfHere_15_07 " );	// Thank you!
	AI_StopProcessInfos(self);
};

instance DIA_EROL_INTOWER(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 22;
	condition = dia_erol_intower_condition;
	information = dia_erol_intower_info;
	permanent = TRUE;
	description = " How are things in the tower? " ;
};

func int dia_erol_intower_condition()
{
	if((EROLRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (DTMONEYCRISIS == FALSE) && (DTFOODCRISIS == FALSE) && (CEONEEDSFIRSTMONEY == FALSE) && (CEONEEDSFIRSTFOOD == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 12000))
	{
		return TRUE;
	};
};

func void dia_erol_intower_info()
{
	AI_Output(other,self, " DIA_Erol_InTower_15_00 " );	// How are things going with the economy?
	AI_Output(self,other, " DIA_Erol_InTower_07_01 " );	// Everything is fine. You have nothing to worry about.
};

DIA_EROL_INTOWER_ORCKAP (C_Info) instances
{
	npc = VLK_4303_Addon_Erol;
	nr = 22;
	condition = dia_erol_intower_orckap_condition;
	information = dia_erol_intower_orckap_info;
	permanent = TRUE;
	description = " How are things at camp? " ;
};

func int dia_erol_intower_orckap_condition()
{
	if (( EROLRECRUITEDDT  ==  TRUE ) && ( CAPITELORCATC  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_erol_intower_orckap_info()
{
	AI_Output(other,self, " DIA_Erol_InTower_OrcKap_15_00 " );	// How are things at the camp?
	AI_Output(self,other, " DIA_Erol_InTower_OrcKap_07_01 " );	// We have plenty of money and food, but the orcs are bothering...
};
