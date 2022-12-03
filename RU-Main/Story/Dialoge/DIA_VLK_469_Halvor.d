
var int HalvorInPrision;

instance DIA_Halvor_EXIT(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 999;
	condition = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Halvor_PICKPOCKET(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 900;
	condition = DIA_Halvor_PICKPOCKET_Condition;
	info = DIA_Halvor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Halvor_PICKPOCKET_Condition()
{
	return  C_Robbery ( 78 , 150 );
};

func void DIA_Halvor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,Dialog_Back,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Halvor_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};

func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};


instance DIA_Halvor_Hello (C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hallo_Condition;
	information = DIA_Halvor_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Halvor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hello_Info()
{
	AI_Output(self,other, " DIA_Halvor_Hallo_06_00 " );	// Hey, do you need fish? I have a very good fish - from the very depths of the sea!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Halvor trades fish in the harbor. " );
};


instance DIA_Halvor_TRADE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_TRADE_Condition;
	info = DIA_Halvor_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your fish. " ;
};

func int DIA_Halvor_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Halvor_Hello) && Wld_IsTime( 5 , 0 , 20 , 0 ) && (Halvor_Delivered ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Halvor_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Halvor_TRADE_15_00 " );	// Show me your fish.
	B_GiveTradeInv(self);
};


instance DIA_Halvor_Night(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Night_Condition;
	information = DIA_Halvor_Night_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Halvor_Night_Condition()
{
	if (Wld_IsTime( 20 , 0 , 0 , 0 ) && Npc_IsInState(self,ZS_Talk) && (Halvor_Delivered ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Night_Info()
{
	AI_Output(self,other, " DIA_Halvor_Night_06_00 " );	// Hey, if you want to buy fish, come see me tomorrow. Good?
};

instance DIA_Addon_Halvor_Job(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_Addon_Halvor_Job_Condition;
	information = DIA_Addon_Halvor_Job_Info;
	description = " Do you have a job for me? " ;
};

func int DIA_Addon_Halvor_Job_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Halvor_Hallo) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_Job_Info()
{
	AI_Output(other,self, " DIA_Addon_Halvor_Job_01_00 " );	// Do you have a job for me?
	AI_Output(self,other, " DIA_Addon_Halvor_Job_01_01 " );	// Yes, I think there is. I just needed oysters right now.
	AI_Output(self,other, " DIA_Addon_Halvor_Job_01_02 " );	// This delicacy is readily consumed by people.
	AI_Output(self,other, " DIA_Addon_Halvor_Job_01_03 " );	// So if you want to help, go to the beach and get ten of them.
	AI_Output(self,other, " DIA_Addon_Halvor_Job_01_04 " );	// Only I don't promise a lot of gold for them. But I won't be in debt.
	AI_Output(other,self, " DIA_Addon_Halvor_Job_01_05 " );	// Agreed.
	MIS_HalvorShells = LOG_Running;
	Log_CreateTopic(TOPIC_HalvorShells,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HalvorShells,LOG_Running);
	B_LogEntry(TOPIC_HalvorShells, " Halvor needs oysters. He asked me to go to the beach and collect about ten of them. " );
};

instance DIA_Addon_Halvor_Job_Done(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_Addon_Halvor_Job_Done_Condition;
	information = DIA_Addon_Halvor_Job_Done_Info;
	description = " Here are your oysters. " ;
};

func int DIA_Addon_Halvor_Job_Done_Condition()
{
	if((MIS_HalvorShells == LOG_Running) && (Npc_HasItems(other,ItFo_Addon_Shellflesh) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_Job_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Addon_Halvor_Job_Done_01_00 " );	// Here are your oysters.
	B_GiveInvItems(other,self,ItFo_Addon_Shellflesh,10);
	Npc_RemoveInvItems(self,ItFo_Addon_Shellflesh,10);
	AI_Output(self,other, " DIA_Addon_Halvor_Job_Done_01_01 " );	// Good. For each of them, I will give you five gold pieces.
	AI_Output(self,other, " DIA_Addon_Halvor_Job_Done_01_02 " );	// Total fifty coins. I hope you're happy
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(other,self,"DIA_Addon_Halvor_Job_Done_01_03");	//Вполне.
	MIS_HalvorShells = LOG_Success;
	Log_SetTopicStatus(TOPIC_HalvorShells,LOG_Success);
	B_LogEntry(TOPIC_HalvorShells, " I brought Halvor oysters. For them he gave me fifty gold pieces. " );
};

instance DIA_Addon_Halvor_MissingPeople(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 5;
	condition = DIA_Addon_Halvor_MissingPeople_Condition;
	information = DIA_Addon_Halvor_MissingPeople_Info;
	description = " Do you know anything about missing people? " ;
};

func int DIA_Addon_Halvor_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Halvor_MissingPeople_15_00 " );	// Do you know anything about missing people?
	AI_Output(self,other, " DIA_Addon_Halvor_MissingPeople_06_01 " );	// Missing people? It's a port, mate. Such events are not unusual here.
	AI_Output(self,other, " DIA_Addon_Halvor_MissingPeople_06_02 " );	// The sea is cruel. It often takes human lives.
	AI_Output(self,other, " DIA_Addon_Halvor_MissingPeople_06_03 " );	// In major ports like Khorinis, captains of large ships recruit sailors to replenish their crew.
	AI_Output(self,other, " DIA_Addon_Halvor_MissingPeople_06_04 " );	// And if they don't find volunteers, people can be dragged onto the ship against their will. And so they disappear.
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,Dialog_Back,DIA_Addon_Halvor_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople, " But what ship could it be? " ,DIA_Addon_Halvor_MissingPeople_schiff);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople, " Do you know anyone who is missing? " ,DIA_Addon_Halvor_MissingPeople_wer);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople, " Have you got anyone missing? " ,DIA_Addon_Halvor_MissingPeople_you);
};

func void DIA_Addon_Halvor_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
};

func void DIA_Addon_Halvor_MissingPeople_wer()
{
	AI_Output(other,self, " DIA_Addon_Halvor_MissingPeople_wer_15_00 " );	// Do you know anyone who has gone missing?
	AI_Output(self,other, " DIA_Addon_Halvor_MissingPeople_wer_06_01 " );	// No. Try asking the shipbuilders.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " The only thing Fishmonger Halvor could tell me was to contact the shipbuilders. " );
};

func void DIA_Addon_Halvor_MissingPeople_schiff()
{
	AI_Output(other,self, " DIA_Addon_Halvor_MissingPeople_schiff_15_00 " );	// But what kind of ship could it be?
	AI_Output(self,other, " DIA_Addon_Halvor_MissingPeople_schiff_06_01 " );	// Good question. You are right, ships have not entered Khorinis lately.
};

func void DIA_Addon_Halvor_MissingPeople_you()
{
	AI_Output(other,self, " DIA_Addon_Halvor_MissingPeople_you_15_00 " );	// Have you lost anyone?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//У меня? Нет.
};


instance DIA_Halvor_MESSAGE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_MESSAGE_Condition;
	information = DIA_Halvor_MESSAGE_Info;
	permanent = FALSE;
	description = " I think this piece of paper is about you... " ;
	trade = FALSE ;
};


func int DIA_Halvor_MESSAGE_Condition()
{
	if(Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Halvor_MESSAGE_Info()
{
	AI_Output(other,self, " DIA_Halvor_MESSAGE_15_00 " );	// I think this piece of paper has something to do with you...
	AI_Output(self,other, " DIA_Halvor_MESSAGE_06_01 " );	// What?.. Let me see.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Halvor_MESSAGE_06_02 " );	// (sweating) Uh... Okay, let's talk calmly about this - uh... listen. I resold the goods I received from the bandits.
	AI_Output(self,other, " DIA_Halvor_MESSAGE_06_03 " );	// (hurriedly) But there's no need to tell the militia about this, right? I'm sure we can come to an understanding, can't we?
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE, " Well, try to propose to me. " ,DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice(DIA_Halvor_MESSAGE, " Looks like you're going to jail. " ,DIA_Halvor_MESSAGE_PRISON);
};

func void DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output(other,self, " DIA_Halvor_MESSAGE_OFFER_15_00 " );	// Well, try to propose to me.
	AI_Output(self,other, " DIA_Halvor_MESSAGE_OFFER_06_01 " );	// Good. Listen to me. I can sell you more than just fish.
	AI_Output(self,other, " DIA_Halvor_MESSAGE_OFFER_06_03 " );	// If you give me this piece of paper, uh... and forget about it, you and I could make great trading partners.
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE, " Okay, agreed. " ,DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice(DIA_Halvor_MESSAGE, " Looks like you're going to jail. " ,DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice(DIA_Halvor_MESSAGE, " Yeah?! And what are these goods? " ,DIA_Halvor_MESSAGE_DEAL);
};

func void DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output(other,self, " DIA_Halvor_MESSAGE_PRISON_15_00 " );	// Looks like you're going to jail.
	AI_Output(self,other, " DIA_Halvor_MESSAGE_PRISON_06_01 " );	// No, wait, you can't do that! After all, I ... I ... you understand ... I'm a small fish.
	AI_Output(other,self, " DIA_Halvor_MESSAGE_PRISON_15_02 " );	// You should have thought about this earlier. And now I'm going to report you to Lord Andre.
	AI_Output(self,other, " DIA_Halvor_MESSAGE_PRISON_06_03 " );	// You'll regret this.
	Betrayal_Halvor = TRUE ;
	HalvorInPrision = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output(other,self, " DIA_Halvor_MESSAGE_DEAL_15_00 " );	// Huh?! And what are these goods?
	AI_Output(self,other, " DIA_Halvor_MESSAGE_DEAL_06_01 " );	// Well, I could offer you... a special fish, you know? Not a simple fish that is only good for food.
	AI_Output(other,self, " DIA_Halvor_MESSAGE_DEAL_15_02 " );	// Do you mean something like a fish containing your secret message?
	AI_Output(self,other, " DIA_Halvor_MESSAGE_DEAL_06_03 " );	// You understand everything correctly. I have several of these... fish.
};

func void DIA_Halvor_MESSAGE_Okay()
{
	AI_Output(other,self, " DIA_Halvor_MESSAGE_Okay_15_00 " );	// Okay, agreed. I think we'll keep it all under wraps.
	AI_Output(self,other, " DIA_Halvor_MESSAGE_Okay_06_01 " );	// Thank you. Come by when you're around again. I will prepare some very interesting things for you.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_GiveInvItems(other,self,ItWr_HalvorMessage,1);
	Npc_RemoveInvItems(self,ItWr_HalvorMessage,1);
	Half_Deal = TRUE ;
	Thieves Guild_Okay = Thieves Guild_Okay +  1 ;
	CreateInvItems(self,ItSe_ErzFisch,1);
	CreateInvItems(self,ItSe_GoldFisch, 1 );
	CreateInvItems(self,ItSe_Ringfisch, 1 );
	CreateInvItems(self,ItSe_LockpickFisch, 1 );
	Info_ClearChoices(DIA_Halvor_MESSAGE);
};


instance DIA_Halvor_character (C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Character_Condition;
	information = DIA_Halvor_Character_Info;
	permanent = FALSE;
	description = " (Show thief sign) " ;
};

func int DIA_Halvor_Character_Condition()
{
	if((Knows_SecretSign == TRUE) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Character_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other, " DIA_Halvor_Zeichen_06_00 " );	// I understand! You didn't just come to buy fish.
	AI_Output(self,other, " DIA_Halvor_Zeichen_06_01 " );	// I'm ready to make you an offer... (quietly) If you have silver or gold items and jewelry, I'll take them at a good price.
	CreateInvItems(self,ItKE_lockpick,20);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	Log_CreateTopic(Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde, " Halvor will buy silver or gold items and jewelry at a very good price. " );
};


instance DIA_HALVOR_ZEICHEN_MURDER (C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = dia_halvor_zeichen_murder_condition;
	information = dia_halvor_sign_murder_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_halvor_character_murder_condition()
{
	if ((Knows_SecretSign ==  TRUE ) && (Betrayal_Halvor ==  FALSE ) && ( KILLTARGET3  ==  TRUE ) && ( KILLTARGET1  ==  TRUE ) && ( KILLTARGET2  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_halvor_sign_murder_info()
{
	AI_Output(self,other, " DIA_Halvor_Zeichen_Murder_06_00 " );	// Since you showed up, some important people in this city have been killed.
	AI_Output(self,other, " DIA_Halvor_Zeichen_Murder_06_01 " );	// These murders made life very difficult for honest thieves.
	AI_Output(self,other, " DIA_Halvor_Zeichen_Murder_06_02 " );	// And I suspect you of involvement in these murders.
	AI_Output(self,other, " DIA_Halvor_Zeichen_Murder_06_03 " );	// I refuse to buy things from you! Thieves don't do business with murderers.
	Betrayal_Halvor = TRUE ;
	B_LogEntry(Topic_Diebesgilde, " Halvor suspects my involvement in the killing of civilians and refused to do business with me. " );
};


instance DIA_Halvor_Hehlerei (C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Helvor_Info;
	permanent = TRUE;
	description = " (...sell gold and silver items) " ;
};

func int DIA_Halvor_Hehlerei_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Halvor_Sign) && (Betrayal_Halvor ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hehlerei_Info()
{
	Half_Score = 0 ;

	if ( Halvor_Day != Wld_GetDay ())
	{
		if((Npc_HasItems(other,ItMi_SilverPlate) >= 1) || (Npc_HasItems(other,ItMi_SilverCup) >= 1) || (Npc_HasItems(other,ItMi_SilverRing) >= 1) || (Npc_HasItems(other,ItMi_RingGold) >= 1) || (Npc_HasItems(other,ItMi_SilverChalice) >= 1) || (Npc_HasItems(other,ItMi_SilverCandleHolder) >= 1) || (Npc_HasItems(other,ItMi_SilverNecklace) >= 1) || (Npc_HasItems(other,ItMi_HolderGoldCandle) >=  1 ) || (Npc_HasItems(other,ItMi_NecklaceGold) >=  1 ) || (Npc_HasItems(other,ItMi_PlateGold) >=  1 ) || (Npc_HasItems(other,ItMi_CupGold) >=  1 ) || (Npc_HasItems(other,ItMi_ChaliceGold) >=  1 ) || (Npc_HasItems(other, ITMI_CHEST_EMPTYGOLD ) >=  1 ))
		{
			Halvor_Score = (Npc_HasItems(other,ItMi_SilverPlate) * (Value_SilverPlate / 2)) + (Npc_HasItems(other,ItMi_SilverCup) * (Value_SilverCup / 2)) + (Npc_HasItems(other,ItMi_SilverRing) * (Value_SilverRing / 2)) + (Npc_HasItems(other,ItMi_RingGold) * (Value_GoldRing / 2)) + (Npc_HasItems(other,ItMi_SilverChalice) * (Value_SilverChalice / 2)) + (Npc_HasItems(other,ItMi_SilverCandleHolder) * (Value_SilverCandleHolder / 2)) + (Npc_HasItems(other,ItMi_SilverNecklace) * (Value_SilverNecklace / 2)) + (Npc_HasItems(other,ItMi_HolderGoldCandle) * (Value_GoldCandleHolder / 2)) + (Npc_HasItems(other,ItMi_NecklaceGold) * (Value_GoldNecklace / 2)) + (Npc_HasItems(other,ItMi_PlateGold) * (Value_GoldPlate / 2)) + (Npc_HasItems(other,ItMi_CupGold) * (Value_GoldCup / 2 )) + (Npc_HasItems(other,ItMi_ChaliceGold) * (Value_GoldChalice /  2 ));
			AI_Output(self,other, " DIA_Halvor_Zeichen_06_05 " );	// For your things, I'll give you...
			B_Say_Gold(self,other,Halvor_Score);
			concatText = " Halvor offers you " ;
			concatText = ConcatStrings(concatText,IntToString(Halvor_Score));
			concatText = ConcatStrings(concatText," монет...");
			AI_Print(concatText);
			Info_ClearChoices(DIA_Halvor_Hehlerei);
			Info_AddChoice(DIA_Halvor_Hehlerei, " Ok, I sell. " ,DIA_Halvor_Hehlerei_Annehmen);
			Info_AddChoice(DIA_Halvor_Hehlerei, " I'll think about it. " ,DIA_Halvor_Hehlerei_Ablehnen);
		}
		else
		{
			AI_Output(self,other, " DIA_Halvor_Zeichen_06_02 " );	// Come in when you have gold or silver plates or bowls.
			Info_ClearChoices(DIA_Halvor_Hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other, " DIA_Halvor_Zeichen_06_03 " );	// You can give me your silver tomorrow! Today is too early.
	}
	else
	{
		AI_Output(self,other, " DIA_Halvor_Zeichen_06_04 " );	// Sorry, but I'm not ready to do business today. Come by tomorrow, okay?
	};
};

func void DIA_Halvor_Received_Accept()
{
	var int amount;
	var string concatText;
	amount = Npc_HasItems(other,ItMi_SilverPlate) + Npc_HasItems(other,ItMi_SilverCup) + Npc_HasItems(other,ItMi_RingGold) + Npc_HasItems(other,ItMi_SilverRing) + Npc_HasItems(other,ItMi_SilverChalice) + Npc_HasItems(other,ItMi_SilverCandleHolder) + Npc_HasItems(other,ItMi_SilverNecklace) + Npc_HasItems(other,ItMi_HolderGoldCandle) + Npc_HasItems(other,ItMi_NecklaceGold) + Npc_HasItems(other,ItMi_PlateGold) + Npc_HasItems(other,ItMi_CupGold) + Npc_HasItems(other,ItMi_ChaliceGold) + Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD);
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_SilverCup,Npc_HasItems(other,ItMi_SilverCup));
	Npc_RemoveInvItems(other,ItMi_SilverPlate,Npc_HasItems(other,ItMi_SilverPlate));
	Npc_RemoveInvItems(other,ItMi_SilverRing,Npc_HasItems(other,ItMi_SilverRing));
	Npc_RemoveInvItems(other,ItMi_RingGold,Npc_HasItems(other,ItMi_RingGold));
	Npc_RemoveInvItems(other,ItMi_SilverChalice,Npc_HasItems(other,ItMi_SilverChalice));
	Npc_RemoveInvItems(other,ItMi_SilverCandleHolder,Npc_HasItems(other,ItMi_SilverCandleHolder));
	Npc_RemoveInvItems(other,ItMi_SilverNecklace,Npc_HasItems(other,ItMi_SilverNecklace));
	Npc_RemoveInvItems(other,ItMi_HolderGoldCandle,Npc_HasItems(other,ItMi_HolderGoldCandle));
	Npc_RemoveInvItems(other,ItMi_NecklaceGold,Npc_HasItems(other,ItMi_NecklaceGold));
	Npc_RemoveInvItems(other,ItMi_PlateGold,Npc_HasItems(other,ItMi_PlateGold));
	Npc_RemoveInvItems(other,ItMi_CupGold,Npc_HasItems(other,ItMi_CupGold));
	Npc_RemoveInvItems(other,ItMi_ChaliceGold,Npc_HasItems(other,ItMi_ChaliceGold));
	B_GiveInvItems(self,other,ItMi_Gold,Halvor_Score);
	AI_Output(other,self, " DIA_Halvor_Zeichen_Annehmen_15_00 " );	// Good. Sales!
	AI_Output(self,other, " DIA_Halvor_Zeichen_Annehmen_06_01 " );	// We made some good deals today. You'd better not come to see me until tomorrow, it might arouse suspicion, you know?
	Halvor_Day = Wld_GetDay();
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

func void DIA_Halvor_Receive_Reject()
{
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

instance DIA_Halvor_Crew(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 51;
	condition = DIA_Halvor_Crew_Condition;
	information = DIA_Halvor_Crew_Info;
	permanent = FALSE;
	description = " I'm typing a command. " ;
};

func int DIA_Halvor_Crew_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath ==  TRUE ) && (Half_Delivery ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Crew_Info()
{
	AI_Output(other,self, " DIA_Halvor_Crew_15_00 " );	// I'm typing the command.
	AI_Output(self,other, " DIA_Halvor_Crew_06_01 " );	// And how do you plan to sail away from here?
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew, " It's my business. " ,DIA_Halvor_Crew_MyThing);
	Info_AddChoice(DIA_Halvor_Crew, " There's a suitable ship here. " ,DIA_Halvor_Crew_StealShip);
};

func void DIA_Halvor_Crew_MyThing()
{
	AI_Output(other,self, " DIA_Halvor_Crew_MyThing_15_00 " );	// This is my business.
	AI_Output(self,other, " DIA_Halvor_Crew_MyThing_06_01 " );	// As you know. It's really none of my business.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew, " Want to sail with me? " ,DIA_Halvor_Crew_JoinMe);
	Info_AddChoice(DIA_Halvor_Crew, " Can you help me? " ,DIA_Halvor_Crew_HelpMe);
};

func void DIA_Halvor_Crew_StealShip()
{
	AI_Output(other,self, " DIA_Halvor_Crew_StealShip_15_00 " );	// There's a suitable ship here.
	AI_Output(self,other, " DIA_Halvor_Crew_StealShip_06_01 " );	// Yes, exactly. Are you serious? The paladins will make a patty out of you if they get to you.
	AI_Output(self,other, " DIA_Halvor_Crew_StealShip_06_02 " );	// Do as you please, but I'm not going to risk my skin.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew, " Want to sail with me? " ,DIA_Halvor_Crew_JoinMe);
	if (Npc_IsDead(Jack) ==  FALSE )
	{
		Info_AddChoice(DIA_Halvor_Crew, " Can you help me? " ,DIA_Halvor_Crew_HelpMe);
	};
};

func void DIA_Halvor_Crew_JoinMe()
{
	AI_Output(other,self, " DIA_Halvor_Crew_JoinMe_15_00 " );	// Do you want to sail with me?
	AI_Output(self,other, " DIA_Halvor_Crew_JoinMe_06_01 " );	// No, thanks. I have a lot of work to do here too. Besides, to be honest, I don't want to face a galley full of orcs.
	AI_Output(self,other, " DIA_Halvor_Crew_JoinMe_06_02 " );	// But I still wish you good luck.
};

func void DIA_Halvor_Crew_HelpMe()
{
	AI_Output(other,self, " DIA_Halvor_Crew_HelpMe_15_00 " );	// Can you help me?
	AI_Output(self,other, " DIA_Halvor_Crew_HelpMe_06_01 " );	// I'm not very good at this. You'd better talk to Jack, he must be hanging around here in the harbour. He knows best what you need for this journey.
};

func void DIA_Halvor_Crew_BACK()
{
	Info_ClearChoices(DIA_Halvor_Crew);
};

instance DIA_HALVOR_NEKRO_FEAR (C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = dia_halvor_nekro_fear_condition;
	information = dia_halvor_nekro_fear_info;
	permanent = TRUE;
	description = " You know, I was thinking of making a skeleton out of you. " ;
};

func int dia_halvor_nekro_fear_condition()
{
	if ((Betrayal_Halvor ==  TRUE ) && (hero.guild ==  GIL_KDM ) && (HalvorInPrison ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_halvor_nekro_fear_info()
{
	Betrayal_Halvor = FALSE ;
	AI_Output(other,self, " DIA_Halvor_NEKRO_FEAR_00_01 " );	// You know, I was thinking about making a skeleton out of you.
	AI_Output(other,self, " DIA_Halvor_NEKRO_FEAR_00_02 " );	// I just need a smart, bony helper.
	AI_Output(self,other, " DIA_Halvor_NEKRO_FEAR_00_03 " );	// Are you out of your mind?!...(in panic) YOU CAN'T DO THIS TO ME! I WILL CALL THE GUARD!
	AI_Output(other,self, " DIA_Halvor_NEKRO_FEAR_00_04 " );	// And when you become a vile undead, the paladins will come and turn you into dust.
	AI_Output(other,self, " DIA_Halvor_NEKRO_FEAR_00_05 " );	// Well, that's at best!
	AI_Output(other,self, " DIA_Halvor_NEKRO_FEAR_00_06 " );	// True, there is another option. You keep buying stolen gold and silver from me, but I don't touch you.
	AI_Output(other,self, " DIA_Halvor_NEKRO_FEAR_00_07 " );	// How dare you, Halvor?
	AI_Output(self,other, " DIA_Halvor_NEKRO_FEAR_00_08 " );	// Uh...(hesitating) Yes, of course! Consider that we have agreed.
	AI_Output(other,self, " DIA_Halvor_NEKRO_FEAR_00_09 " );	// That's nice.
	B_LogEntry(Topic_Diebesgilde, " Halvor was mortally scared of me and agreed to continue our nice cooperation. Still, it's convenient to be a necromancer and demon caster... " );
};

instance DIA_HALVOR_Betrayal_Down(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_HALVOR_Betrayal_Down_condition;
	information = DIA_HALVOR_Betrayal_Down_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_HALVOR_Betrayal_Down_condition()
{
	if (( BEKILLMASTER  ==  TRUE ) && (HalvorInPrision ==  FALSE ) && (Betrayal_Halvor ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_HALVOR_Betrayal_Down_info()
{
	AI_Output(self,other, " DIA_HALVOR_Betrayal_Down_00_01 " );	// Hey bud... (calling)
	AI_Output(self,other, " DIA_HALVOR_Betrayal_Down_00_02 " );	// There are rumors that you sent Asmal himself to the next world!
	AI_Output(self,other, " DIA_HALVOR_Betrayal_Down_00_03 " );	// Good job, I tell you! Now many here were finally able to breathe freely.
	AI_Output(self,other, " DIA_HALVOR_Betrayal_Down_00_04 " );	// Therefore, I've decided to resume our trade relations.
	AI_Output(self,other, " DIA_HALVOR_Betrayal_Down_00_05 " );	// Well, if you know what I mean.
	AI_Output(other,self,"DIA_HALVOR_Betrayal_Down_00_06");	//Понимаю.
	AI_Output(self,other, " DIA_HALVOR_Betrayal_Down_00_07 " );	// That's great ... (smiling) So, if anything, contact me!
	AI_Output(other,self,"DIA_HALVOR_Betrayal_Down_00_08");	//Конечно.
	Betrayal_Halvor = FALSE ;
	B_LogEntry(Topic_Diebesgilde, " Halvor was glad to know that I killed Asmal! Now he wants to resume our trade relations with him. " );
};

instance DIA_Halvor_HauntedLH(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 3;
	condition = DIA_Halvor_HauntedLH_condition;
	information = DIA_Halvor_HauntedLH_info;
	permanent = FALSE;
	description = " Do you know a man named Stefan? " ;
};

func int DIA_Halvor_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE) && (KnowStefan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_HauntedLH_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Halvor_HauntedLH_01_01 " );	// Do you know a man named Stefan?
	AI_Output(self,other, " DIA_Halvor_HauntedLH_01_02 " );	// Never heard of him, mate.
	B_LogEntry(TOPIC_HauntedLighthouse, " Halvor hasn't heard of a man named Stefan. " );
};
