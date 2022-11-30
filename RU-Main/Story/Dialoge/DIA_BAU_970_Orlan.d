
instance DIA_Orlan_EXIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 999;
	condition = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Orlan_Wein (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Wein_Condition;
	information = DIA_Orlan_Wein_Info;
	permanent = FALSE;
	description = " I brought wine from the monastery. " ;
};


func int DIA_Orlan_Wein_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Wein_Info()
{
	AI_Output(other,self, " DIA_Orlan_Wein_15_00 " );	// I brought wine from the monastery.
	AI_Output(self,other, " DIA_Orlan_Wein_05_01 " );	// Excellent. This is exactly what I need.
	AI_Output(self,other, " DIA_Orlan_Wein_05_02 " );	// I've already negotiated a price with Master Gorax. I will give you one hundred gold coins right now.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein, " Okay, give me that gold. " ,DIA_Orlan_Wein_JA);
	Info_AddChoice(DIA_Orlan_Wein, " Are you trying to fool me? " ,DIA_Orlan_Wein_NEIN);
};

func void DIA_Orlan_Wine_JA()
{
	AI_Output(other,self, " DIA_Orlan_Wein_JA_15_00 " );	// Okay, give me that gold.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	AI_Output(self,other, " DIA_Orlan_Wein_JA_05_01 " );	// Hold. It's a pleasure to do business with you.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_NO()
{
	AI_Output(other,self, " DIA_Orlan_Wein_NEIN_15_00 " );	// Are you trying to fool me? It costs two hundred and forty coins.
	AI_Output(self,other, " DIA_Orlan_Wein_NEIN_05_01 " );	// So Gorax warned you, didn't he? Okay, maybe we can come to an agreement. Look, let's do this - I'll give you 100 coins for this wine.
	AI_Output(self,other, " DIA_Orlan_Wein_NEIN_05_02 " );	// You will tell Gorax that I deceived you, and I will give you FOUR scrolls of spells in addition.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein, " Hey, give me two hundred and forty coins here. " ,DIA_Orlan_Wein_Nie);
	Info_AddChoice(DIA_Orlan_Wein, " Hmm, sounds tempting. Give me those scrolls. " ,DIA_Orlan_Wein_Okay);
	Info_AddChoice(DIA_Orlan_Wein, " What are those scrolls? " ,DIA_Orlan_Wein_Was);
};

func void DIA_Orlan_Wine_Never()
{
	AI_Output(other,self, " DIA_Orlan_Wein_Nie_15_00 " );	// Hey, give me two hundred and forty coins here.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	AI_Output(self,other, " DIA_Orlan_Wein_Nie_05_01 " );	// You don't want to do business with me, do you? (sighs) All right, here's your gold.
	B_GiveInvItems(self,other,ItMi_Gold,240);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wine_Okay()
{
	B_GiveInvItemsManyThings(self,other);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self, " DIA_Orlan_Wein_Okay_15_00 " );	// Hmm, sounds tempting. Give me those scrolls.
	AI_Output(self,other, " DIA_Orlan_Wein_Okay_05_01 " );	// Here are your scrolls and gold.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	CreateInvItems(hero,ItSc_Light,2);
	CreateInvItems(hero,ItSc_LightHeal,1);
	CreateInvItems(hero,ItSc_SumGobSkel,1);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wine_Was()
{
	AI_Output(other,self, " DIA_Orlan_Wein_Was_15_00 " );	// What are these scrolls?
	AI_Output(self,other, " DIA_Orlan_Wein_Was_05_01 " );	// I have no idea - I don't understand anything about this. I got them from a guest who... uh... forgot them here, yes!
};


instance DIA_Orlan_WERBISTDU(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Orlan_WERBISTDU_Condition;
	information = DIA_Orlan_WERBISTDU_Info;
	description = " Who are you? " ;
};


func int DIA_Orlan_WERBISTDU_Condition()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Ты кто?
	AI_Output(self,other, " DIA_Orlan_WERBISTDU_05_01 " );	// I am Orlan, owner of this modest tavern.
	AI_Output(self,other, " DIA_Orlan_WERBISTDU_05_02 " );	// Are you looking for something, outlander? Maybe a decent sword or good armor?
	AI_Output(self,other, " DIA_Orlan_WERBISTDU_05_03 " );	// A sip of wine, or maybe you need information?
	AI_Output(self,other, " DIA_Orlan_WERBISTDU_05_04 " );	// I can give you all this and more if you have specie.
};


instance DIA_Addon_Orlan_Greg(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_Greg_Condition;
	information = DIA_Addon_Orlan_Greg_Info;
	description = " Do you know the man with the eye patch? " ;
};


func int DIA_Addon_Orlan_Greg_Condition()
{
	if ((SC_SawGregInTavern ==  TRUE ) && (Chapter <=  3 ) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU));
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Greg_Info()
{
	AI_Output(other,self, " DIA_Addon_Orlan_Greg_15_00 " );	// Do you know the man with the eyepatch?
	AI_Output(self,other, " DIA_Addon_Orlan_Greg_05_01 " );	// I've seen it here before. Bad type.
	AI_Output(self,other, " DIA_Addon_Orlan_Greg_05_02 " );	// Some time ago he rented my upper room. He had a huge chest with him.
	AI_Output(self,other, " DIA_Addon_Orlan_Greg_05_03 " );	// He needed to be constantly reminded that it was time to pay for the room. And he didn't pay any attention to it.
	AI_Output(self,other, " DIA_Addon_Orlan_Greg_05_04 " );	// And one day he just disappeared with his box. I don't like such people.
};


instance DIA_Addon_Orlan_Ranger(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Ranger_Condition;
	information = DIA_Addon_Orlan_Ranger_Info;
	description = " Am I paranoid, or are you really staring at my ring all the time? " ;
};


func int DIA_Addon_Orlan_Ranger_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orlan_WERBISTDU ) && ( SCIsWearingRangerRing ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Ranger_Info()
{
	AI_Output(other,self, " DIA_Addon_Orlan_Ranger_15_00 " );	// Am I being paranoid, or are you really staring at my ring all the time?
	AI_Output(self,other, " DIA_Addon_Orlan_Ranger_05_01 " );	// I'm not quite sure how to understand this...
	Orlan_KnowsSCAsRanger = TRUE;
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	Info_AddChoice(DIA_Addon_Orlan_Ranger, " I became a member of the Water Ring! " ,DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice(DIA_Addon_Orlan_Ranger, " This is an aquamarine. Have you ever seen one like this? " ,DIA_Addon_Orlan_Ranger_Aqua);
};

func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output(other,self, " DIA_Addon_Orlan_Ranger_Aqua_15_00 " );	// This is aquamarine. Ever seen one like this?
	AI_Output(self,other, " DIA_Addon_Orlan_Ranger_Aqua_05_01 " );	// Saw. Welcome to headquarters, brother in the Ring.
	if ( Npc_KnowsInfo ( other , DIA_Addon_Orlan_NoMeeting ))
	{
		AI_Output(self,other, " DIA_Addon_Orlan_Ranger_Aqua_05_02 " );	// Although, of course, you don't look particularly gifted...
	};
	AI_Output(self,other, " DIA_Addon_Orlan_Ranger_Aqua_05_03 " );	// What can I do for you?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Orlan_Ranger_Idiot()
{
	AI_Output(other,self, " DIA_Addon_Orlan_Ranger_Lares_15_00 " );	// I became a member of the Water Ring!
	AI_Output(self,other, " DIA_Addon_Orlan_Ranger_Lares_05_01 " );	// Really? I can't believe such an idiot was accepted into society.
	AI_Output(self,other, " DIA_Addon_Orlan_Ranger_Lares_05_02 " );	// So what do you need?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
};


instances of DIA_Addon_Orlan_Teleportstein (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Teleportstein_Condition;
	information = DIA_Addon_Orlan_Teleportstein_Info;
	description = " Have you ever used teleporters? " ;
};


func int DIA_Addon_Orlan_Teleportstein_Condition()
{
	if((Orlan_KnowsSCAsRanger == TRUE) && (SCUsed_TELEPORTER == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Teleportstein_Info()
{
	AI_Output(other,self, " DIA_Addon_Orlan_Teleportstein_15_00 " );	// Have you ever used teleporters?
	AI_Output(self,other, " DIA_Addon_Orlan_Teleportstein_05_01 " );	// Are you crazy? Until the waterbenders convince me it's safe, I won't go near them.
	AI_Output(self,other, " DIA_Addon_Orlan_Teleportstein_05_02 " );	// I was asked to hide one of the teleporters. I don't want to have anything to do with these things anymore.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein, " Can I see this teleporter? " ,DIA_Addon_Orlan_Teleportstein_sehen);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein, " Where is the teleport? " ,DIA_Addon_Orlan_Teleportstein_wo);
};

func void DIA_Addon_Orlan_See_Teleportstein()
{
	AI_Output(other,self, " DIA_Addon_Orlan_Teleportstein_sehen_15_00 " );	// Can I see this teleporter?
	AI_Output(self,other, " DIA_Addon_Orlan_Teleportstein_sehen_05_01 " );	// Watch if you want. Here's the key - I've locked the entrance.
	CreateInvItems(self,itke_orlan_teleportstation,1);
	B_GiveInvItems(self,other,itke_orlan_teleportstation,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW, " Orlan locked the teleport stone in a cave southwest of his tavern. " );
};

func void DIA_Addon_Orlan_Teleportstein_wo()
{
	AI_Output(other,self, " DIA_Addon_Orlan_Teleportstein_wo_15_00 " );	// Where is the teleport?
	AI_Output(self,other, " DIA_Addon_Orlan_Teleportstein_wo_05_01 " );	// Not far from my tavern, in the south, there is a cave. In it, the water magicians found him.
};


instance DIA_Addon_Orlan_NoMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_NoMeeting_Condition;
	information = DIA_Addon_Orlan_NoMeeting_Info;
	description = " I want to join the Water Ring! " ;
};


func int DIA_Addon_Orlan_NoMeeting_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orlan_WERBISTDU ) &&  ! Npc_KnowsInfo ( other , DIA_Addon_Orlan_Ranger ) && ( SCIsWearingRangerRing ==  FALSE ) && ( MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running ));
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_NoMeeting_Info()
{
	AI_Output(other,self, " DIA_Addon_Orlan_NoMeeting_15_00 " );	// I want to join the Water Ring!
	AI_Output(self,other, " DIA_Addon_Orlan_NoMeeting_05_01 " );	// There are no rings here. Get you a drink?
};


instance DIA_Addon_Orlan_WhenRangerMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information = DIA_Addon_Orlan_WhenRangerMeeting_Info;
	description = " I was told that there will be a meeting of members of this society in your tavern. " ;
};


func int DIA_Addon_Orlan_WhenRangerMeeting_Condition()
{
	if (( MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running ) && Npc_KnowsInfo ( other , DIA_Addon_Orlan_Ranger ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info()
{
	B_Addon_Orlan_RangersReadyForComing();
	AI_Output(other,self, " DIA_Addon_Orlan_WhenRangerMeeting_15_00 " );	// I was told that there will be a meeting of members of this society in your tavern.
	AI_Output(self,other, " DIA_Addon_Orlan_WhenRangerMeeting_05_01 " );	// Right! She's about to start.
	AI_Output(self,other, " DIA_Addon_Orlan_WhenRangerMeeting_05_02 " );	// The rest are delayed for some reason.
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting, " The others should show up soon. " ,DIA_Addon_Orlan_WhenRangerMeeting_theyCome);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting, " Meeting today? " ,DIA_Addon_Orlan_WhenRangerMeeting_Today);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Today()
{
	B_MakeRangerReadyForMeetingALL();
	AI_Output(other,self, " DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00 " );	// Will the meeting be today?
	AI_Output(self,other, " DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01 " );	// Yes, as far as I remember.
	AI_Output(self,other, " DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02 " );	// I hope we don't start too late.
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting, " (member) " ,DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome()
{
	B_MakeRangerReadyForMeetingALL();
	AI_Output(other,self, " DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00 " );	// The rest should show up soon.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//Посмотрим...
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,Dialog_End,DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Los()
{
	AI_StopProcessInfos(self);
	B_Addon_Orlan_ComingRanger();
};


instance DIA_Orlan_RUESTUNG(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Orlan_RUESTUNG_Condition;
	information = DIA_Orlan_RUESTUNG_Info;
	permanent = TRUE;
	description = " What armor can you suggest? " ;
};


var int DAY_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orlan_WERBISTDU ) && ( DIA_Orlan_RUESTUNG_noPerm ==  FALSE ) && ( hero . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Orlan_RUESTUNG_Info()
{
	AI_Output(other,self, " DIA_Orlan_RUESTUNG_15_00 " );	// What kind of armor can you suggest?
	AI_Output(self,other, " DIA_Orlan_RUESTUNG_05_01 " );	// I have a very nice copy, I'm sure you'll be interested.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
	Info_AddChoice(DIA_Orlan_RUESTUNG,Dialog_Back,DIA_Orlan_RUESTUNG_BACK);
	Info_AddChoice(DIA_Orlan_RUESTUNG, " Peasant Clothes (Price: 250 coins) " ,DIA_Orlan_RUESTUNG_Buy);
};

func void DIA_Orlan_RUESTUNG_Buy()
{
	AI_Output(other,self, " DIA_Orlan_RUESTUNG_Buy_15_00 " );	// I want to buy leather armor.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other, " DIA_Orlan_RUESTUNG_Buy_05_01 " );	// Good decision.
		CreateInvItems(self,ITAR_Bau_M,1);
		B_GiveInvItems(self,other,ITAR_Bau_L,1);
		DIA_Orlan_RUESTUNG_noPerm = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Orlan_RUESTUNG_Buy_05_02 " );	// Sorry. Come in when you have money.
	};
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK()
{
	AI_Output(other,self, " DIA_Orlan_RUESTUNG_BACK_15_00 " );	// I'll think about it.
	AI_Output(self,other, " DIA_Orlan_RUESTUNG_BACK_05_01 " );	// As you wish. Just don't think too long.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};


instance DIA_Orlan_TRADE(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 70;
	condition = DIA_Orlan_TRADE_Condition;
	information = DIA_Orlan_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Orlan_TRADE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orlan_WERBISTDU ))
	{
		return TRUE;
	};
};

func void DIA_Orlan_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Orlan_TRADE_15_00 " );	// Show me your products.

	if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE) || (SCIsWearingRangerRing == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Orlan_TRADE_05_00 " );	// Of course, brother in the Ring.
		Orlan_KnowsSCAsRanger = TRUE;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Orlan_TRADE_05_01 " );	// Of course. It is a great honor for me to serve such an important guest.
	}
	else  if ((hero.guild ==  GIL_SLD ) || (hero.guild ==  GIL_DJG ) || (hero.guild ==  GIL_MIL ) || (hero.guild ==  GIL_KDM ))
	{
		AI_Output(self,other, " DIA_Orlan_TRADE_05_02 " );	// Of course, sir.
	}
	else
	{
		AI_Output(self,other, " DIA_Orlan_TRADE_05_03 " );	// If you can pay.
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));
};


instance DIA_Orlan_HotelRoom (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 6;
	condition = DIA_Orlan_HotelRoom_Condition;
	information = DIA_Orlan_HotelRoom_Info;
	permanent = TRUE;
	description = " How much do you charge for a room? " ;
};


var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;

func int DIA_Orlan_HotelRoom_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orlan_WERBISTDU ) && ( Orlan_SCGotHotelZimmer ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orlan_HotelRoom_Info()
{
	AI_Output(other,self, " DIA_Orlan_HotelZimmer_15_00 " );	// How much do you charge for a room?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		if((SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
		{
			AI_Output(self,other, " DIA_Addon_Orlan_HotelZimmer_05_00 " );	// Brothers in the Ring live with me for free.
			Orlan_RangerHelpZimmer = TRUE;
			Orlan_KnowsSCAsRanger = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other, " DIA_Orlan_HotelZimmer_05_01 " );	// I always have a spare room for the king's knight. Completely free, of course.
		}
		else
		{
			AI_Output(self,other, " DIA_Orlan_HotelZimmer_05_02 " );	// I would never dare to take money for my services from a representative of Innos on earth.
		};
		AI_Output(self,other, " DIA_Orlan_HotelZimmer_05_03 " );	// Here is the key to the upper rooms. Choose which one you like more.
		CreateInvItems(self,itke_orlan_hotelzimmer, 1 );
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer, 1 );
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Orlan_HotelZimmer_05_04 " );	// You pay fifty gold coins a week and the room is yours.
		Info_ClearChoices(DIA_Orlan_HotelRoom);
		Info_AddChoice(DIA_Orlan_HotelZimmer, " Damn, how expensive! " ,DIA_Orlan_HotelZimmer_nein);
		Info_AddChoice(DIA_Orlan_HotelZimmer, " Okay. Here's gold. " ,DIA_Orlan_HotelZimmer_ja);
	};
};

func void DIA_Orlan_HotelRoom_yes()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self, " DIA_Orlan_HotelZimmer_ja_15_00 " );	// Good. Here is gold.
		AI_Output(self,other, " DIA_Orlan_HotelZimmer_ja_05_01 " );	// And here is the key. The rooms are up the stairs. But don't mess it up and don't forget to pay your rent on time, okay?
		CreateInvItems(self,itke_orlan_hotelzimmer, 1 );
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer, 1 );
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Orlan_SCGotHotelZimmer = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Orlan_HotelZimmer_ja_05_02 " );	// You don't have fifty! First money, then pleasure.
	};
	Info_ClearChoices(DIA_Orlan_HotelRoom);
};

func void DIA_Orlan_HotelRoom_no()
{
	AI_Output(other,self, " DIA_Orlan_HotelZimmer_nein_15_00 " );	// Damn, how expensive!
	AI_Output(self,other, " DIA_Orlan_HotelZimmer_nein_05_01 " );	// Then try looking elsewhere for the night, my friend.
	Info_ClearChoices(DIA_Orlan_HotelRoom);
};


var int Orlan_AttackDue to Rent;

instance DIA_Orlan_MieteFaellig (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 10;
	condition = DIA_Orlan_MieteFaellig_Condition;
	information = DIA_Orlan_MieteFaellig_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Orlan_MieteFaellig_NoMore;

func int DIA_Orlan_MieteFaellig_Condition()
{
	if((SC_IsRanger == TRUE) || (Orlan_RangerHelpZimmer == TRUE))
	{
		return  FALSE ;
	};
	if ((Orlan_AngriffWegenMiete ==  TRUE ) && (DIA_Orlan_MieteDue_NoMore ==  FALSE ))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return  FALSE ;
		};
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AttackBecause of Rent = FALSE ;
			return  FALSE ;
		};
	};
	if ((Orlan_SCGotHotelZimmer ==  TRUE ) && (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay() -  7 )) && (DIA_Orlan_MieteFailure_NoMore ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Orlan_MieteFaellig_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Orlan_MieteFaellig_05_00 " );	// (insincerely) I am very glad to have such a guest. Stay here as long as you wish. It's an honour for me.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Orlan_MieteFaellig_05_01 " );	// When will I finally receive my rent?
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
		Info_AddChoice(DIA_Orlan_MieteFaellig, " Forget it. I won't pay you anymore. " ,DIA_Orlan_MieteFaellig_nein);
		Info_AddChoice(DIA_Orlan_MieteFaellig, " Here are your fifty gold coins. " ,DIA_Orlan_MieteFaellig_ja);
	};
};


var int DIA_Orlan_MieteFaellig_OneTime;

func void DIA_Orlan_MieteFaellig_ja()
{
	AI_Output(other,self, " DIA_Orlan_MieteFaellig_ja_15_00 " );	// Here are your fifty gold coins.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Orlan_MieteFaellig_ja_05_01 " );	// Just in time.
		if (DIA_Orlan_Miete_OneTime ==  FALSE )
		{
			AI_Output(self,other, " DIA_Orlan_MieteFaellig_ja_05_02 " );	// Where have you been all day?
			AI_Output(other,self, " DIA_Orlan_MieteFaellig_ja_15_03 " );	// You better not know.
			AI_Output(self,other, " DIA_Orlan_MieteFaellig_ja_05_04 " );	// Mmmm. Well, yes. It's basically none of my business.
			DIA_Orlan_MieteFaellig_OneTime = TRUE ;
		};
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
	}
	else
	{
		AI_Output(self,other, " DIA_Orlan_MieteFaellig_ja_05_05 " );	// Are you trying to fool me? Even you don't have the money to pay for the food. I will teach you, oh you...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Orlan_MieteDue_no()
{
	AI_Output(other,self, " DIA_Orlan_MieteFaellig_nein_15_00 " );	// Forget it. I won't pay you anymore.
	AI_Output(self,other, " DIA_Orlan_MieteFaellig_nein_05_01 " );	// Then I'll have to teach you a lesson. Contemptible bastard!
	Orlan_AttackBecause of Rent = TRUE ;
	Info_ClearChoices(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Orlan_WETTKAMPFLAEUFT (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 7;
	condition = DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information = DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important = TRUE;
};


func int DIA_Orlan_WETTKAMPFLAEUFT_Condition()
{
	if ((DIA_Randolph_ICHGEBEDIRGELD_noPerm ==  TRUE ) && (MIS_Rukhar_Competition_Day <= (Wld_GetDay() -  2 )))
	{
		return TRUE;
	};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info()
{
	B_GivePlayerXP(XP_Rukhar_CompetitionOver);
	AI_Output(self,other, " DIA_Orlan_WETTTKAMPFLAEUFT_05_00 " );	// There you are, finally. I was waiting for you.
	AI_Output(other,self, " DIA_Orlan_WETTKAMPFLAEUFT_15_01 " );	// What happened?
	AI_Output(self,other, " DIA_Orlan_WETTTKAMPFLAEUFT_05_02 " );	// The 'out-drinking' contest is finally over.
	AI_Output(other,self, " DIA_Orlan_WETTTKAMPFLAEUFT_15_03 " );	// Who won?

	if((Mob_HasItems("CHEST_RUKHAR",ItFo_Booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",ItFo_Water) == TRUE))
	{
		AI_Output(self,other, " DIA_Orlan_WETTTKAMPFLAEUFT_05_04 " );	// Randolph this time. Ruhar is out of luck these days.
	}
	else
	{
		AI_Output(self,other, " DIA_Orlan_WETTTKAMPFLAEUFT_05_05 " );	// As always, Ruhar got Randolph drunk. This was to be expected.
		Rukhar_Won_Competition = TRUE ;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other, " DIA_Orlan_WETTTKAMPFLAEUFT_05_06 " );	// I hope this was the last time. I don't want this to happen in my house. Get it on your nose.
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(Randolph,"Start");

	if (Hlp_IsValidNpc(Rukhar))
	{
		if (Rukhar_Won_Competition ==  TRUE )
		{
			B_StartOtherRoutine(Rukhar, " CompetitionRukharWon " );
		}
		else
		{
			B_StartOtherRoutine(Rukhar, " CompetitionRukharLost " );
		};
	};

	MIS_Rukhar_Competition = LOG_SUCCESS ;
};


instance DIA_Orlan_EINGEBROCKT (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 8;
	condition = DIA_Orlan_EINGEBROCKT_Condition;
	information = DIA_Orlan_EINGEBROCKT_Info;
	important = TRUE;
};


func int DIA_Orlan_EINGEBROCKT_Condition()
{
	if ((DIA_Randolph_ICHGEBEDIRGELD_noPerm ==  TRUE ) && (MIS_Rukhar_Competition == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Orlan_EINGEBROCKT_Info()
{
	AI_Output(self,other, " DIA_Orlan_EINGEBROCKT_05_00 " );	// Yeah, you gave me problems. Now I need to be careful with Ruhar.
	AI_Output(other,self, " DIA_Orlan_EINGEBROCKT_15_01 " );	// Why?
	AI_Output(self,other, " DIA_Orlan_EINGEBROCKT_05_02 " );	// While he's having his contest here, it's best that no outsider know about him. It's bad for business, you know?
};


instance DIA_Orlan_Perm(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 99;
	condition = DIA_Orlan_Perm_Condition;
	information = DIA_Orlan_Perm_Info;
	permanent = TRUE;
	description = " How are you at the tavern? " ;
};


func int DIA_Orlan_Perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orlan_WERBISTDU ))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Perm_Info()
{
	AI_Output(other,self, " DIA_Orlan_Perm_15_00 " );	// How are things at the tavern?
	if (chapter <=  2 )
	{
		AI_Output(self,other, " DIA_Orlan_Perm_05_01 " );	// Used to be better.
		AI_Output(self,other, " DIA_Orlan_Perm_05_02 " );	// People today are not as willing to open their wallets as they used to be.
	}
	else  if (chapter >=  3 )
	{
		AI_Output(self,other, " DIA_Orlan_Perm_05_03 " );	// I hope these black mages leave soon, otherwise I'm afraid I'll have to close the tavern.
		AI_Output(self,other, " DIA_Orlan_Perm_05_04 " );	// Almost no one dares to look here anymore.
	};
};


instances of DIA_Orlan_Minenanteil (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Minenanteil_Condition;
	information = DIA_Orlan_MinenTeil_Info;
	description = " Do you sell stocks? " ;
};


func int DIA_Orlan_Minenanteil_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (MIS_Serpents_MineBefore_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU));
	{
		return TRUE;
	};
};

func void DIA_Orlan_Minenanteil_Info()
{
	AI_Output(other,self, " DIA_Orlan_Minenanteil_15_00 " );	// Do you sell shares?
	AI_Output(self,other, " DIA_Orlan_Minenanteil_05_01 " );	// Of course. You can buy too if the price suits you.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_PICKPOCKET(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 900;
	condition = DIA_Orlan_PICKPOCKET_Condition;
	information = DIA_Orlan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Orlan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 89 , 260 );
};

func void DIA_Orlan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,Dialog_Back,DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

instance DIA_ORLAN_MEETKILL(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_meetkill_condition;
	information = dia_orlan_meetkill_info;
	permanent = FALSE;
	description = " I have an appointment with someone here. " ;
};

func int dia_orlan_meetkill_condition()
{
	if((APEARKILLER == TRUE) && (MEETCHIEFKILLERSLAIT == FALSE) && (MEETCHIEFKILLERS == FALSE) && (MIS_GERBRANDTHELP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_meetkill_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Orlan_MeetKill_01_00 " );	// I have an appointment with a certain person here.
	AI_Output(self,other, " DIA_Orlan_MeetKill_01_02 " );	// Oh yeah. There was a guy who told me something about it. Weird guy, I'll tell you.
	AI_Output(self,other, " DIA_Orlan_MeetKill_01_03 " );	// Looks like he went up to the top floor - look in the back room.
};

instance DIA_ORLAN_MEETKILLLAIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_meetkilllait_condition;
	information = dia_orlan_meetkilllait_info;
	permanent = FALSE;
	description = " I have an appointment with someone here. " ;
};

func int dia_orlan_meetkilllait_condition()
{
	if((MEETCHIEFKILLERSLAIT == TRUE) && (MIS_GERBRANDTHELP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_meetkilllait_info()
{
	AI_Output(other,self, " DIA_Orlan_MeetKillLait_01_00 " );	// I have an appointment with a certain person here.
	AI_Output(self,other, " DIA_Orlan_MeetKillLait_01_02 " );	// Oh yeah. There was a guy who said something to me about it. Weird guy, I'll tell you.
	AI_Output(self,other, " DIA_Orlan_MeetKillLait_01_03 " );	// But it looks like he's already gone.
};

instance DIA_ORLAN_MISSBRENDI(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = dia_orlan_missbrendi_condition;
	information = dia_orlan_missbrendi_info;
	permanent = FALSE;
	description = " Have you seen a man named Benchel here? " ;
};

func int dia_orlan_missbrendi_condition()
{
	if((BENCHELSEE == FALSE) && (MIS_BLACKBRENDI == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orlan_missbrendi_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Orlan_MissBrendi_Info_01_00 " );	// Have you seen a man named Benchel around here?
	AI_Output(self,other, " DIA_Orlan_MissBrendi_Info_01_03 " );	// Already gone - just a few minutes ago.
	AI_Output(self,other, " DIA_Orlan_MissBrendi_Info_01_04 " );	// Stayed here for a couple of days, stuffing my belly with cheap beer, and then he took a batch of black brandy from me and went into town.
	AI_Output(self,other, " DIA_Orlan_MissBrendi_Info_01_05 " );	// So if you hurry, you can still catch up with him. I don't think he got very far.
	B_LogEntry( TOPIC_BLACKBRENDI , " Orlan said that I missed Benchel quite a bit. A few minutes ago he left the tavern, and, according to him, went to the city, of course, not forgetting to take a batch of black brandy with him. " );
};

instance DIA_Orlan_Werewolf(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Werewolf_Condition;
	information = DIA_Orlan_Werewolf_Info;
	permanent = FALSE;
	description = " You don't know anything about the beast attack? " ;
};

func int DIA_Orlan_Werewolf_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Akil_Werewolf) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orlan_Werewolf_01_00 " );	// Have you heard anything about the beast attack?
	AI_Output(self,other, " DIA_Orlan_Werewolf_01_01 " );	// (nervously) What attack?
	AI_Output(other,self, " DIA_Orlan_Werewolf_01_02 " );	// Some creature recently killed a man near your tavern. Under the bridge.
	AI_Output(self,other, " DIA_Orlan_Werewolf_01_03 " );	// Oh, about that... (sighing) No, personally, I don't know anything.
	AI_Output(other,self, " DIA_Orlan_Werewolf_01_04 " );	// And what, even no rumors about this?
	AI_Output(self,other, " DIA_Orlan_Werewolf_01_05 " );	// Hmmm... Someone seems to have mentioned seeing a large mrakoris near Sekob's farm.
	AI_Output(self,other, " DIA_Orlan_Werewolf_01_06 " );	// But you never know what is wandering in the forests. There, the whole forest is teeming with monsters.
	B_LogEntry(TOPIC_WolfAndMan, " Orlan doesn't know anything about the attack of the beast. But, according to rumors, they saw a large mrakoris not far from Sekob's farm. " );
};


// ----------------------------bones------------------- ----------

instances DIA_BAU_970_Orlan_Game (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_BAU_970_Orlan_Game_condition;
	information = DIA_BAU_970_Orlan_Game_info;
	description = " I heard you play dice. " ;
};

func int DIA_BAU_970_Orlan_Game_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orlan_WERBISTDU ) && ( GameOtherPlayers ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_Game_info()
{
	AI_Output(other,self, " DIA_BAU_970_Orlan_Game_01_00 " );	// I heard you play dice.
	AI_Output(self,other, " DIA_BAU_970_Orlan_Game_01_01 " );	// Well, if you've heard it, then it's true.
	AI_Output(other,self, " DIA_BAU_970_Orlan_Game_01_02 " );	// Then maybe we can play?
	AI_Output(self,other, " DIA_BAU_970_Orlan_Game_01_03 " );	// Why not. Tell me when you're ready and we'll get started right away.
	OrlanPlayResult = 150;
	Menu_WriteInt("AST","SysTimer03",0);
};

instances DIA_BAU_970_Orlan_GamePlay (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 900;
	condition = DIA_BAU_970_Orlan_GamePlay_condition;
	information = DIA_BAU_970_Orlan_GamePlay_info;
	permanent = TRUE;
	description = " Let's play dice! " ;
};

func int DIA_BAU_970_Orlan_GamePlay_condition()
{
	if (( Npc_KnowsInfo ( other , DIA_BAU_970_Orlan_Game ) ==  TRUE ) && ( Mount_Up ==  FALSE ) && ( FlyCarpetIsOn ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer03");

	if(CheckLastGame >= OrlanPlayResult)
	{
		CheckLastSum = CheckLastGame - OrlanPlayResult;
	};

	AI_Output(other,self, " DIA_BAU_970_Orlan_GamePlay_01_00 " );	// Let's play dice!

	if(OrlanPlayResult >= CheckLastGame)
	{
		if((OrlanPlayResult > 0) && (OrlanDayFlag == FALSE))
		{
			AI_Output(self,other, " DIA_BAU_970_Orlan_GamePlay_01_01 " );	// Good! Have you already said goodbye to your gold?
			PlayPocker(1,self);
		}
		else
		{
			if(OrlanDayFlag == FALSE)
			{
				AI_Output(self,other, " DIA_BAU_970_Orlan_GamePlay_01_02 " );	// I don't think so! You already skinned me today like an old linden.
				OrlanDayPlay = Wld_GetDay();
				OrlanDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other, " DIA_BAU_970_Orlan_GamePlay_01_03 " );	// Don't even ask.
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_BAU_970_Orlan_GamePlay_01_04 " );	// Where's the gold you owe me for the last game?
		AI_Output(self,other, " DIA_BAU_970_Orlan_GamePlay_01_05 " );	// Until I see him, there will be no game.
		Info_ClearChoices(DIA_BAU_970_Orlan_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_BAU_970_Orlan_GamePlay, " Here's your money. " ,DIA_BAU_970_Orlan_GamePlay_Here);
		};

		Info_AddChoice(DIA_BAU_970_Orlan_GamePlay, " I don't have that much money. " ,DIA_BAU_970_Orlan_GamePlay_No);
	};
};

func void DIA_BAU_970_Orlan_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	OrlanPlayResult = CheckLastGame;
	AI_Output(other,self, " DIA_BAU_970_Orlan_GamePlay_Here_01_01 " );	// Here's your money.
	AI_Output(self,other, " DIA_BAU_970_Orlan_GamePlay_Here_01_02 " );	// You can when you want. Now let's get started!
	PlayPocker(1,self);
};

func void DIA_BAU_970_Orlan_GamePlay_No()
{
	AI_Output(other,self, " DIA_BAU_970_Orlan_GamePlay_No_01_01 " );	// I don't have that much money.
	AI_Output(self,other, " DIA_BAU_970_Orlan_GamePlay_No_01_02 " );	// And what do you want from me then?
	Info_ClearChoices(DIA_BAU_970_Orlan_GamePlay);
};

instances DIA_BAU_970_Orlan_GameEnd (C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_BAU_970_Orlan_GameEnd_condition;
	information = DIA_BAU_970_Orlan_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_BAU_970_Orlan_GameEnd_condition()
{
	if((MustTellResult_Orlan == TRUE) && ((OrlanLost == TRUE) || (OrlanWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_BAU_970_Orlan_GameEnd_info()
{
	if(OrlanLost == TRUE)
	{
		AI_Output(self,other, " DIA_BAU_970_Orlan_GameEnd_00 " );	// I never would have thought you were such a good player.
		OrlanLost = FALSE ;
	}
	else if(OrlanWon == TRUE)
	{
		AI_Output(self,other, " DIA_BAU_970_Orlan_GameEnd_01 " );	// Now your gold is in good hands. Be sure!
		OrlanWon = FALSE ;
	};

	MustTellResult_Orlan = FALSE ;
};
