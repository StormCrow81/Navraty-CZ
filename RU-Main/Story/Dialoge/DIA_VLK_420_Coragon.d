

instance DIA_Coragon_EXIT(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 999;
	condition = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Coragon_PICKPOCKET(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 900;
	condition = DIA_Coragon_PICKPOCKET_Condition;
	information = DIA_Coragon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Coragon_PICKPOCKET_Condition()
{
	return  C_Robbery ( 40 , 45 );
};

func void DIA_Coragon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,Dialog_Back,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};

func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};


instance DIA_Coragon_HALLO(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_HALLO_Condition;
	information = DIA_Coragon_HALLO_Info;
	permanent = FALSE;
	description = " Can I have a drink here? " ;
};

func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other,self, " DIA_Coragon_HALLO_15_00 " );	// Can I have a drink here?
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_00 " );	// If you have money, you can even eat here.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " I can buy food and drink from Koragon Innkeeper. " );
};


instance DIA_Coragon_Trade(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_Trade_Condition;
	information = DIA_Coragon_Trade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};


func int DIA_Coragon_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Coragon_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};

instance DIA_Coragon_WhatsUp(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_WhatsUp_Condition;
	information = DIA_Coragon_WhatsUp_Info;
	permanent = FALSE;
	description = " How are things going? " ;
};

func int DIA_Coragon_WhatsUp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_WhatsUp_Info()
{
	AI_Output(other,self, " DIA_Coragon_Gelaber_15_00 " );	// How are things going?
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_01 " );	// Oh, don't ask...(annoyed) Lord Andre's order is handing out free beer in the main square!
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_02 " );	// Almost no one comes to see me. Well, except for these rich people from the upper quarter.
	AI_Output(other,self, " DIA_Coragon_Add_15_03 " );	// What's wrong with them?
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_04 " );	// Some of these dandies get on my nerves terribly.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_05 " );	// Take Valentino, for example. I just can't stand it.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_06 " );	// But I don't have to choose clients! Now every coin is precious to me.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_07 " );	// Everything I managed to save was stolen from me along with my silver.
};

instance DIA_Coragon_FixBeer(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_FixBeer_Condition;
	information = DIA_Coragon_FixBeer_Info;
	permanent = FALSE;
	description = " Maybe I can help with the visitors? " ;
};

func int DIA_Coragon_FixBeer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Coragon_FixBeer_Info()
{
	AI_Output(other,self, " DIA_Coragon_FixBeer_01_00 " );	// Maybe I can somehow attract visitors?
	AI_Output(self,other, " DIA_Coragon_FixBeer_01_01 " );	// How? By force, will you bring them here?
	AI_Output(self,other, " DIA_Coragon_FixBeer_01_02 " );	// Wirt pours beer for free. And here you have to pay for it.
	AI_Output(self,other, " DIA_Coragon_FixBeer_01_03 " );	// They are, after all, not complete idiots to just give money away.
	AI_Output(self,other, " DIA_Coragon_FixBeer_01_04 " );	// But of course you can try. Why is Beliar not joking?
	AI_Output(self,other, " DIA_Coragon_FixBeer_01_05 " );	// If you manage to increase the number of people in my tavern, I'll personally give you three...
	AI_Output(self,other, " DIA_Coragon_FixBeer_01_06 " );	// ...(thoughtfully) No! Two barrels of beer.
	AI_Output(other,self, " DIA_Coragon_FixBeer_01_07 " );	// Agreed! Then you can start making my beer.
	AI_Output(self,other, " DIA_Coragon_FixBeer_01_08 " );	// You... (waving hand) Ahh, crazy...
	MIS_CoragonFixBeer = LOG_Running;
	Log_CreateTopic(TOPIC_CoragonFixBeer,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CoragonFixBeer,LOG_Running);
	B_LogEntry(TOPIC_CoragonFixBeer, " Coragon complains that his tavern hasn't had many customers lately. This is because Wirth treats everyone to beer for free in the town square. I volunteered to help the innkeeper fix this problem. For this, he is ready to fuck me two casks of the most excellent beer! " );
	AI_StopProcessInfos(self);
};

instance DIA_Coragon_FixBeer_Done(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_FixBeer_Done_Condition;
	information = DIA_Coragon_FixBeer_Done_Info;
	permanent = FALSE;
	description = " How are you? " ;
};

func int DIA_Coragon_FixBeer_Done_Condition()
{
	if((MIS_CoragonFixBeer == LOG_Running) && (CoragonGuestBack == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_FixBeer_Done_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Coragon_FixBeer_Done_01_00 " );	// How are you?
	AI_Output(self,other, " DIA_Coragon_FixBeer_Done_01_01 " );	// (surprised) And how did you do it?
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_02");	//Что?
	AI_Output(self,other, " DIA_Coragon_FixBeer_Done_01_03 " );	// My tavern is now crowded with customers!
	AI_Output(self,other, " DIA_Coragon_FixBeer_Done_01_04 " );	// True, I attribute this to the fact that the militia suddenly took Wirt to the service. Now there is simply no one to pour beer!
	AI_Output(self,other, " DIA_Coragon_FixBeer_Done_01_05 " );	// And why did he just surrender to them, this old bag of bones?
	AI_Output(other,self, " DIA_Coragon_FixBeer_Done_01_06 " );	// Doesn't matter. But now you do not incur losses.
	AI_Output(self,other, " DIA_Coragon_FixBeer_Done_01_07 " );	// Okay. (sighing) I admit, I lost! And, as promised, I owe two barrels of beer.
	AI_Output(other,self, " DIA_Coragon_FixBeer_Done_01_08 " );	// I don't need them. Better take them to militia Martin, to the port.
	AI_Output(other,self, " DIA_Coragon_FixBeer_Done_01_09 " );	// I think he's been waiting for them.
	AI_Output(self,other, " DIA_Coragon_FixBeer_Done_01_10 " );	// Okay, whatever you say. (maliciously) Well, you're a sly one!
	MIS_CoragonFixBeer = LOG_Success;
	Log_SetTopicStatus(TOPIC_CoragonFixBeer,LOG_Success);
	B_LogEntry(TOPIC_CoragonFixBeer, " Coragon was surprised that his tavern was now full of customers. He had to roll out two barrels of beer for me, which I asked to send to Martin at the warehouse. " );
};

instance DIA_Addon_Coragon_MissingPeople(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Addon_Coragon_MissingPeople_Condition;
	information = DIA_Addon_Coragon_MissingPeople_Info;
	description = " What do you know about missing people?. " ;
};

func int DIA_Addon_Coragon_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Coragon_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Coragon_MissingPeople_15_00 " );	// What do you know about missing people?.
	AI_Output(self,other, " DIA_Addon_Coragon_MissingPeople_09_01 " );	// I heard that many of them disappeared in the port area. Not surprising considering what's going on there.
	AI_Output(self,other, " DIA_Addon_Coragon_MissingPeople_09_02 " );	// Even the apprentice carpenter Torben from the lower part of the city is missing.
	AI_Output(self,other, " DIA_Addon_Coragon_MissingPeople_09_03 " );	// Hakon, one of the market traders, told me a very strange story.
	AI_Output(self,other, " DIA_Addon_Coragon_MissingPeople_09_04 " );	// He said that every day of this he met one guy, and then he seemed to disappear from the face of the earth. Hakon even turned to the militia.
	AI_Output(self,other, " DIA_Addon_Coragon_MissingPeople_09_05 " );	// The townspeople start to panic. I don't understand why this is happening. I think it's all nonsense.
	AI_Output(self,other, " DIA_Addon_Coragon_MissingPeople_09_06 " );	// Life in Khorinis is not easy, but it's even more dangerous outside the gates.
	AI_Output(self,other, " DIA_Addon_Coragon_MissingPeople_09_07 " );	// Those who do not stay in the city will sooner or later fall into the hands of bandits or into the teeth of wild animals. Everything is simple.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " Hakon, the merchant in the marketplace, and the carpenter Torben know something about the missing people. " );
};

instance DIA_Coragon_Bestolen (C_Info)
{
	npc = VLK_420_Coragon;
	nr = 4;
	condition = DIA_Coragon_Bestolen_Condition;
	information = DIA_Coragon_Bestolen_Info;
	permanent = FALSE;
	description = " Have you been robbed? " ;
};

func int DIA_Coragon_Bestolen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Stolen_Info()
{
	AI_Output(other,self, " DIA_Coragon_Add_15_08 " );	// Were you robbed?
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_09 " );	// Yes, some time ago. It was quite crowded that evening, and all I did was serve beer.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_10 " );	// I didn't leave the bar for long, but those bastards had enough time.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_11 " );	// I told the militia about the theft, but of course they didn't find anyone. These lazy people prefer to pump up on free beer.
	MIS_Coragon_Silber = LOG_Running;
	Log_CreateTopic(TOPIC_Coragon_Silber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Coragon_Silber,LOG_Running);
	B_LogEntry(TOPIC_Coragon_Silber, " Coragon had all his silverware stolen. I think he'd be happy to have it back. " );
};

var int Coragon_Bees;

func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_14 " );	// Here, take this as a reward.
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);

	if(Coragon_Bier < 2)
	{
		AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_21 " );	// My special beer! One barrel remained.
	}
	else
	{
		AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_22 " );	// Literally the last drops!
	};
};


instance DIA_Coragon_BringSilber(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Coragon_BringSilber_Condition;
	information = DIA_Coragon_BringSilber_Info;
	permanent = FALSE;
	description = " I brought your silver. " ;
};


func int DIA_Coragon_BringSilber_Condition()
{
	if((MIS_Coragon_Silber == LOG_Running) && (Npc_HasItems(other,ItMi_CoragonsSilber) >= 8))
	{
		return TRUE;
	};
};

func void DIA_Coragon_BringSilber_Info()
{
	AI_Output(other,self, " DIA_Coragon_Add_15_12 " );	// I brought your silver.

	if(B_GiveInvItems(other,self,ItMi_CoragonsSilber,8))
	{
		Npc_RemoveInvItems(self,ItMi_CoragonsSilber,8);
	};

	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Правда?
	B_GivePlayerXP(XP_CoragonsSilber);
	B_Coragon_Bier();
	MIS_Coragon_Silber = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Coragon_Silber,LOG_SUCCESS);
	B_LogEntry(TOPIC_Coragon_Silber, " I returned Coragon's silverware. " );
};


instance DIA_Coragon_Schuldenbuch (C_Info)
{
	npc = VLK_420_Coragon;
	nr = 6;
	condition = DIA_Coragon_Schuldenbuch_Condition;
	information = DIA_Coragon_Schuldenbuch_Info;
	permanent = FALSE;
	description = " Look what I have. " ;
};


func int DIA_Coragon_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) > 0) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Schuldenbuch_Info()
{
	AI_Output(other,self, " DIA_Coragon_Add_15_15 " );	// Look what I have.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_16 " );	// Hmmm... (surprised) But that's Lemar's ledger!
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_17 " );	// What are you going to do with it?
};


instance DIA_Coragon_GiveBook(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 7;
	condition = DIA_Coragon_GiveBook_Condition;
	information = DIA_Coragon_GiveBook_Info;
	permanent = FALSE;
	description = " Here's your book. " ;
};


func int DIA_Coragon_GiveBook_Condition()
{
	if ((Npc_HasItems(other,ItWr_Shoulderbook) >  0 ) && (Npc_KnowsInfo(hero,DIA_Coragon_Shoulderbook) ==  TRUE ) );
	{
		return TRUE;
	};
};

func void DIA_Coragon_GiveBook_Info()
{
	B_GivePlayerXP(XP_Debt Book);
	AI_Output(other,self, " DIA_Coragon_Add_15_18 " );	// Here is your book.
	B_GiveInvItems(other,self,ItWr_debt book, 1 );
	Npc_RemoveInvItems(self,ItWr_Debt Book, 1 );
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_19 " );	// Thank you! You saved me. Lemar can be a very unpleasant person.
	B_Coragon_Bier();
};

instance DIA_Coragon_ToOV(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 9;
	condition = DIA_Coragon_ToOV_Condition;
	information = DIA_Coragon_ToOV_Info;
	permanent = FALSE;
	description = " How do I get to the upper quarter? " ;
};

func int DIA_Coragon_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) && (other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_ToOV_Info()
{
	AI_Output(other,self, " DIA_Coragon_Add_15_23 " );	// How do I get to the top quarter?
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_24 " );	// You must become a citizen of the city. Find yourself a job!
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_25 " );	// It's best to work with one of the artisans from the lower part of the city. Then you become a citizen.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_26 " );	// And if that's not enough, go to the barracks and talk to Lord Andre.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_27 " );	// Perhaps he will accept you into the ranks of the militia. This will open the way for you to the upper quarter.
};


instance DIA_Coragon_Valentino(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 8;
	condition = DIA_Coragon_Valentino_Condition;
	information = DIA_Coragon_Valentino_Info;
	permanent = FALSE;
	description = " What about Valentino? " ;
};


func int DIA_Coragon_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Valentino_Info()
{
	AI_Output(other,self, " DIA_Coragon_Add_15_28 " );	// What about Valentino?
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_29 " );	// He's obscenely rich and doesn't have to work. And he tells everyone about it.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_30 " );	// Whether you want to listen to it or not.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_31 " );	// He drinks like a horse and always stays until morning. And then, staggering, goes home to the upper quarter.
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_32 " );	// This happens every day.
};


instance DIA_Coragon_News(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 1;
	condition = DIA_Coragon_News_Condition;
	information = DIA_Coragon_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Coragon_News_Condition()
{
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if(Regis_Ring == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Coragon_News_Info()
{
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_33 " );	// He couldn't pay his bill last night.
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_34 " );	// He was talking about how he was robbed and that he would pay me later. How!
	}
	else
	{
		AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_35 " );	// He's just been pissed off about how much money he has.
		AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_36 " );	// And then he puts his hand in his pocket, makes a stupid face and says that he was robbed...
	};
	AI_Output(other,self, " DIA_Coragon_Add_15_37 " );	// And? What did you do?
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_38 " );	// Me?! I gave him a good beating, what else.
	VALENTINOSHIT = TRUE;
};


instance DIA_Coragon_Ring(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = DIA_Coragon_Ring_Condition;
	information = DIA_Coragon_Ring_Info;
	permanent = FALSE;
	description = " Here, take this ring. " ;
};


func int DIA_Coragon_Ring_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Coragon_News ) && ( Npc_HasItems ( other , ItRi_ValentinosRing ) >  0 ))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Ring_Info()
{
	AI_Output(other,self, " DIA_Coragon_Add_15_39 " );	// Here, take this ring.
	B_GiveInvItems(other,self,ItRi_ValentinosRing,1);
	Npc_RemoveInvItems(self,ItRi_ValentinosRing,1);
	AI_Output(self,other, " DIA_ADDON_NEW_Coragon_Add_09_40 " );	// What? I do not understand...
	AI_Output(other,self, " DIA_Coragon_Add_15_41 " );	// It belonged to Valentino.
	AI_Output(other,self, " DIA_Coragon_Add_15_42 " );	// You can pass it on to the next person to beat it...
	B_GivePlayerXP(300);
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_TRADERING(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_tradering_condition;
	information = dia_coragon_tradering_info;
	permanent = FALSE;
	description = " Anything interesting? " ;
};


func int dia_coragon_tradering_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONCARAGON == TRUE))
	{
		return TRUE;
	};
};

func void dia_coragon_tradering_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Coragon_TradeRing_01_01 " );	// Anything interesting?
	AI_Output(self,other, " DIA_Coragon_TradeRing_01_02 " );	// (annoyed) Of course there is!
	AI_Output(self,other, " DIA_Coragon_TradeRing_01_03 " );	// Lately, everyone who is not lazy is doing nothing but paying for my drinks not with gold, but with all sorts of junk!
	AI_Output(other,self, " DIA_Coragon_TradeRing_01_04 " );	// What do you mean?
	AI_Output(self,other, " DIA_Coragon_TradeRing_01_05 " );	// Well, not long ago, a guy here tried to give me one ring instead of money.
	AI_Output(self,other, " DIA_Coragon_TradeRing_01_07 " );	// He said that apart from this ring he had nothing else.
	AI_Output(self,other, " DIA_Coragon_TradeRing_01_09 " );	// I had to take his ring - don't let this guy go just like that!
	AI_Output(self,other, " DIA_Coragon_TradeRing_01_10 " );	// True, the ring, apparently, costs decent money ... (sarcastically)
	AI_Output(other,self, " DIA_Coragon_TradeRing_01_13 " );	// Who was that guy?
	AI_Output(self,other, " DIA_Coragon_TradeRing_01_14 " );	// I think his name is Joe. He seems to be from the port district.
	CORAGONTELLJO = TRUE;
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " A guy named Joe tried to pay Coragon off with an expensive ring. Maybe this is the same ring that was stolen from Hakon. We should talk to Joe and find out where he got it from. " );
};


instance DIA_CORAGON_TRADERINGME(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_traderingme_condition;
	information = dia_coragon_traderingme_info;
	permanent = FALSE;
	description = " That ring, do you still have it? " ;
};


func int dia_coragon_traderingme_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && Npc_KnowsInfo(hero,dia_coragon_tradering))
	{
		return TRUE;
	};
};

func void dia_coragon_traderingme_info()
{
	AI_Output(other,self, " DIA_Coragon_TradeRingMe_01_01 " );	// That ring, do you still have it?
	AI_Output(self,other,"DIA_Coragon_TradeRingMe_01_02");	//Конечно.
	AI_Output(other,self, " DIA_Coragon_TradeRingMe_01_03 " );	// Then, sell it to me!
	AI_Output(self,other, " DIA_Coragon_TradeRingMe_01_04 " );	// Sell you a ring? Hmmm...(thoughtfully) No problem!
	AI_Output(other,self, " DIA_Coragon_TradeRingMe_01_06 " );	// How much do you want for it?
	AI_Output(self,other, " DIA_Coragon_TradeRingMe_01_09 " );	// One hundred gold coins.
};


instance DIA_CORAGON_TRADERINGMEDONE(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_traderingmedone_condition;
	information = dia_coragon_traderingmedone_info;
	permanent = TRUE;
	description = " Sell me a ring. " ;
};


func int dia_coragon_traderingmedone_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && Npc_KnowsInfo(hero,dia_coragon_traderingme) && (CORAGONSELLRINGDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_coragon_traderingmedone_info()
{
	AI_Output(other,self, " DIA_Coragon_TradeRingMeDone_01_00 " );	// Sell me a ring.
	AI_Output(self,other, " DIA_Coragon_TradeRingMeDone_01_01 " );	// (maliciously) Where's the money?
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		B_GivePlayerXP(100);
		Npc_RemoveInvItems(other,ItMi_Gold,100);
		AI_Output(other,self,"DIA_Coragon_TradeRingMeDone_01_02");	//Вот они.
		AI_Output(self,other, " DIA_Coragon_TradeRingMeDone_01_03 " );	// Good! Then keep the ring.
		B_GiveInvItems(self,other,itri_hakonmissring,1);
		CORAGONSELLRINGDONE = TRUE;
		B_LogEntry( TOPIC_ABIGEILHELPHANNA , " Koragon sold me the ring. It seems to have actually belonged to the merchant Hakon. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Coragon_TradeRingMeDone_01_04 " );	// I don't have them.
		AI_Output(self,other, " DIA_Coragon_TradeRingMeDone_01_05 " );	// Then come back when you have them.
	};
};


instance DIA_CORAGON_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = dia_coragon_aboutkillignaz_condition;
	information = dia_coragon_aboutkillignaz_info;
	permanent = FALSE;
	description = " Did you hear anything about the murder of the alchemist Ignaz? " ;
};


func int dia_coragon_aboutkillignaz_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_coragon_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Coragon_AboutKillIgnaz_01_00 " );	// Have you heard anything about the murder of the alchemist Ignaz?
	AI_Output(self,other, " DIA_Coragon_AboutKillIgnaz_01_01 " );	// I don't think so. I try to stay away from these kinds of topics.
	AI_Output(self,other, " DIA_Coragon_AboutKillIgnaz_01_04 " );	// I don't have time to listen to what other people are talking about.
	B_LogEntry( TOPIC_KILLIGNAZ , " Koragon, the city's tavern keeper, said he wasn't interested in such things at all. I don't think he knew anything about killing Ignaz. " );
	ASKKILLSECOND = TRUE;
};

instance DIA_Coragon_LoaParty(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_Condition;
	information = DIA_Coragon_LoaParty_Info;
	permanent = FALSE;
	description = " I need good food! " ;
};

func int DIA_Coragon_LoaParty_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_Info()
{
	AI_Output(other,self, " DIA_Coragon_LoaParty_01_01 " );	// I need good food!
	AI_Output(other,self, " DIA_Coragon_LoaParty_01_02 " );	// But not the one you feed your ordinary visitors, but really good - tasty and fresh.
	AI_Output(self,other, " DIA_Coragon_LoaParty_01_03 " );	// Ha, look what you are! He doesn't like my food. You know, good food costs decent money.
	AI_Output(other,self, " DIA_Coragon_LoaParty_01_04 " );	// Don't worry about money. Better tell me, can you get her?
	AI_Output(self,other, " DIA_Coragon_LoaParty_01_05 " );	// Hmmm... of course I can. But it will cost you at least a thousand gold coins.
	B_LogEntry(TOPIC_LoaSecret, " Koragon can get me a decent meal. But it will cost me a thousand gold pieces. " );
};

instance DIA_Coragon_LoaParty_Done(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_Done_Condition;
	information = DIA_Coragon_LoaParty_Done_Info;
	permanent = FALSE;
	description = " Here's your thousand! " ;
};

func int DIA_Coragon_LoaParty_Done_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Coragon_LoaParty) == TRUE) && (Npc_HasItems(other,ItMi_Gold) > 1000))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Coragon_LoaParty_Done_01_01 " );	// Here's your thousand!
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other, " DIA_Coragon_LoaParty_Done_01_02 " );	// Great! Come see me tomorrow. I think I will have something to please you.
	B_LogEntry(TOPIC_LoaSecret, " I gave Coragon the money. Now, I'll have to stop by for food tomorrow. " );
	CoragonDayParty = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_Coragon_LoaParty_GiveFood(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_GiveFood_Condition;
	information = DIA_Coragon_LoaParty_GiveFood_Info;
	permanent = FALSE;
	description = " How is my order doing? " ;
};

func int DIA_Coragon_LoaParty_GiveFood_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Coragon_LoaParty_Done) == TRUE) && (CoragonDayParty < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_GiveFood_Info()
{
	AI_Output(other,self, " DIA_Coragon_LoaParty_GiveFood_01_01 " );	// How is my order doing?
	AI_Output(self,other, " DIA_Coragon_LoaParty_GiveFood_01_02 " );	// Everything is ready. You can pick up!
	AI_Output(other,self, " DIA_Coragon_LoaParty_GiveFood_01_03 " );	// Is it really fresh?!
	AI_Output(self,other, " DIA_Coragon_LoaParty_GiveFood_01_04 " );	// You won't find better food in all Khorinis. Believe me!
	AI_Output(other,self, " DIA_Coragon_LoaParty_GiveFood_01_05 " );	// Okay, convinced.
	B_GiveInvItems(self,other,ItMi_LoaPartyFood,1);
	B_LogEntry(TOPIC_LoaSecret, " I got some tasty and fresh food for our picnic. " );
	LoaPartyFood = TRUE;

	if((LoaPartyWine == TRUE) && (LoaPartyFood == TRUE))
	{
		B_LogEntry(TOPIC_LoaSecret, " Now you can return to Loa and discuss with her the rest of the upcoming vacation. " );
	};

	AI_StopProcessInfos(self);
};
