

instance DIA_Kardif_EXIT(C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 999;
	condition = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kardif_EXIT_Condition()
{
  	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_EXIT_Info()
{
	Kardif_OneQuestion = FALSE;
	AI_StopProcessInfos(self);
};

instances DIA_Kardif_PICKPOCKET (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 900;
	condition = DIA_Kardif_PICKPOCKET_Condition;
	information = DIA_Kardif_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Kardif_PICKPOCKET_Condition()
{
	return  C_Robbery ( 55 , 85 );
};

func void DIA_Kardif_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
	Info_AddChoice(DIA_Kardif_PICKPOCKET,Dialog_Back,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kardif_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

var int CardiffInf;

instances of DIA_Kardif_Hi (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = DIA_Kardif_Hi_Condition;
	information = DIA_Kardif_Hi_Info;
	permanent = FALSE;
	description = " How are you? " ;
};

func int DIA_Kardif_Hi_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hi_Info()
{
	AI_Output(other,self, " DIA_Kardif_Hi_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Kardif_Hi_14_01 " );	// If you want something to drink, order it.

	if (KardifInf ==  FALSE )
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, " Cardiff trades drinks at the harbor tavern. " );
		KardifInf = TRUE;
	};
};


instance DIA_Kardif_Hallo (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = DIA_Kardif_Hallo_Condition;
	information = DIA_Kardif_Hallo_Info;
	permanent = FALSE;
	description = " I bet you hear a lot here... " ;
};


func int DIA_Kardif_Hallo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Cardiff_Hi ) && ( Cardiff_Deal ==  0 ))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hallo_Info()
{
	AI_Output(other,self, " DIA_Kardif_Hallo_15_00 " );	// I'm willing to bet you hear a lot here...
	AI_Output(self,other, " DIA_Kardif_Hallo_14_01 " );	// What do you care?
	AI_Output(other,self, " DIA_Kardif_Hallo_15_02 " );	// My ears are always open for news.
	AI_Output(self,other, " DIA_Kardif_Hallo_14_03 " );	// Is your wallet open too?
	AI_Output(self,other, " DIA_Kardif_Hallo_14_04 " );	// Each piece of information I give you will be worth ten gold coins.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Cardiff, owner of a tavern in the harbor, trades information. " );
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo, " I'm not willing to pay more than five coins for information. " ,DIA_Kardif_Hallo_Angebot);
	Info_AddChoice(DIA_Kardif_Hallo, " Forget it - I'll find the info I need elsewhere. " ,DIA_Kardif_Hallo_Hart);
	Info_AddChoice(DIA_Kardif_Hallo, " Okay, agreed. " ,DIA_Kardif_Hallo_Zehn);
};

func void DIA_Kardif_Hello_Ten()
{
	AI_Output(other,self, " DIA_Kardif_Hallo_Zehn_15_00 " );	// Okay, agreed.
	AI_Output(self,other, " DIA_Kardif_Hallo_Zehn_14_01 " );	// You got a good deal (chuckles). I am always at your service.
	Kardif_Deal = 10;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hello_Offer()
{
	AI_Output(other,self, " DIA_Kardif_Hallo_Angebot_15_00 " );	// I'm not willing to pay more than five coins for information.
	AI_Output(self,other, " DIA_Kardif_Hallo_Angebot_14_01 " );	// What, five gold coins? Do you want to ruin me? Let's meet at seven!
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo, " No, that won't do. Let's have six! " ,DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice(DIA_Kardif_Hallo, " Agreed, seven gold coins is a good price. " ,DIA_Kardif_Hallo_Sieben);
};

func void DIA_Kardif_Hallo_Hart()
{
	AI_Output(other,self, " DIA_Kardif_Hallo_Hart_15_00 " );	// Forget it - I'll find the information I need elsewhere.
	AI_Output(self,other, " DIA_Kardif_Hallo_Hart_14_01 " );	// Okay, okay... I'll agree to seven as well.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo, " Agreed, seven gold coins is a good price. " ,DIA_Kardif_Hallo_Sieben);
	Info_AddChoice(DIA_Kardif_Hallo, " No, I don't really need your information that much. " ,DIA_Kardif_Hallo_Ablehnen);
};

func void DIA_Kardif_Hello_Seven()
{
	AI_Output(other,self, " DIA_Kardif_Hallo_Sieben_15_00 " );	// Agreed, seven gold coins is a good price.
	AI_Output(self,other, " DIA_Kardif_Hallo_Sieben_14_01 " );	// A wise decision... (chuckles) Well, if you need to know something, contact me.
	Kardif_Deal = 7;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hello_Reject()
{
	AI_Output(other,self, " DIA_Kardif_Hallo_Ablehnen_15_00 " );	// No, I don't need your information that much.
	AI_Output(self,other, " DIA_Kardif_Hallo_Ablehnen_14_01 " );	// Hey, wait... (sighs) - ok, 5 gold coins. But this is my last price!
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo, " Why couldn't you just say so right away? " ,DIA_Kardif_Hallo_Fuenf);
};

func void DIA_Kardif_Hallo_Fuenf()
{
	AI_Output(other,self, " DIA_Kardif_Hallo_Fuenf_15_00 " );	// And why couldn't it be said about it right away?
	AI_Output(self,other, " DIA_Kardif_Hallo_Fuenf_14_01 " );	// Oh, I'm just not in the best shape right now. But be that as it may, a deal is a deal.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	Kardif_Deal = 5;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output(other,self, " DIA_Kardif_Hallo_KeinDeal_15_00 " );	// No, that won't work. Let's get six!
	AI_Output(self,other, " DIA_Kardif_Hallo_KeinDeal_14_01 " );	// You're a notorious scoundrel, I'll tell you. Well, if you insist so, the information will cost you six gold pieces.
	Kardif_Deal = 6;
	Info_ClearChoices(DIA_Kardif_Hallo);
};


instance DIA_Kardif_TRADE(C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = DIA_Kardif_TRADE_Condition;
	information = DIA_Kardif_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Give me something to drink. " ;
};

func int DIA_Kardif_TRADE_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info()
{
	where int daynow;

	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Kardif_TRADE_15_00 " );	// Give me something to drink.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));

	if(KardifGiveLockPick < daynow)
	{
		CreateInvItems(self,ItKE_lockpick,5);
		KardifGiveLockPick = Wld_GetDay();
	};
};


instances DIA_Kardif_TradeInfo (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = DIA_Kardif_TradeInfo_Condition;
	information = DIA_Kardif_TradeInfo_Info;
	permanent = TRUE;
	description = " I need information. " ;
};


func int DIA_Kardif_TradeInfo_Condition()
{
	if((Kardif_OneQuestion == FALSE) && (Kardif_Deal > 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_TradeInfo_Info()
{
	AI_Output(other,self, " DIA_Kardif_TradeInfo_15_00 " );	// I need information.
	Kardif_OneQuestion = TRUE;
};

func void B_SayKardifZuwenigGold()
{
	AI_Output(self,other, " B_SayKardifZuwenigGold_14_00 " );	// Come back when you have enough gold.
};


instances DIA_Kardif_Buerger (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Kardif_Buerger_Condition;
	information = DIA_Kardif_Buerger_Info;
	permanent = TRUE;
	description = " Who are the most influential people in this city? " ;
};


var int DIA_Kardif_Buerger_permanent;

func int DIA_Kardif_Buerger_Condition()
{
	if((DIA_Kardif_Buerger_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Buerger_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Kardif_Buerger_15_00 " );	// Who are considered influential people in this city?
		AI_Output(self,other, " DIA_Kardif_Buerger_14_01 " );	// You won't find any of them here at the port. The only influential person here is Lemar.
		AI_Output(self,other, " DIA_Kardif_Buerger_14_02 " );	// This pawnbroker is not very popular, but he has gold, and other powerful citizens owe him money.
		AI_Output(self,other, " DIA_Kardif_Buerger_14_03 " );	// Merchants and craftsmen are also very powerful people - and even too much, if you want my opinion.
		DIA_Kardif_Buerger_permanent = TRUE ;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instances DIA_Kardif_Lehmar (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Kardif_Lehmar_Condition;
	information = DIA_Kardif_Lehmar_Info;
	permanent = TRUE;
	description = " Who owes Lemar? " ;
};


var int DIA_Kardif_Lehmar_permanent;

func int DIA_Kardif_Lehmar_Condition()
{
	if((DIA_Kardif_Lehmar_permanent == FALSE) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Buerger_permanent == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lehmar_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Kardif_Add_15_00 " );	// Who owes Lemar?
		AI_Output(self,other, " DIA_Kardif_Add_14_01 " );	// (laughs) If you want to know that, you should look into his ledger.
		AI_Output(self,other, " DIA_Kardif_Add_14_02 " );	// Only it will be very difficult to do it invisibly.
		AI_Output(self,other, " DIA_Kardif_Add_14_03 " );	// As far as I know, he always carries it with him...
		DIA_Kardif_Lehmar_permanent = TRUE ;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Arbeit (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Kardif_Arbeit_Condition;
	information = DIA_Kardif_Arbeit_Info;
	permanent = TRUE;
	description = " Where can I find a job? " ;
};


var int DIA_Kardif_Arbeit_permanent;

func int DIA_Kardif_Work_Condition()
{
	if ((DIA_Kardif_Arbeit_permanent ==  FALSE ) && (Kardif_OneQuestion ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Arbeit_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Kardif_Arbeit_15_00 " );	// Where can I find a job?
		AI_Output(self,other, " DIA_Kardif_Arbeit_14_01 " );	// You're unlikely to find a job here at the port. You need to contact the masters in the lower part of the city.
		AI_Output(self,other, " DIA_Kardif_Arbeit_14_02 " );	// But if you have a decent sword, you can challenge Alric to a duel. You will find him behind the warehouse, he fights for gold.
		DIA_Kardif_Arbeit_permanent = TRUE ;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Addon_Kardif_MissingPeople(C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Addon_Kardif_MissingPeople_Condition;
	information = DIA_Addon_Kardif_MissingPeople_Info;
	permanent = TRUE;
	description = " What do you know about the missing townspeople? " ;
};


var int DIA_Addon_Kardif_MissingPeople_permanent;

func int DIA_Addon_Kardif_MissingPeople_Condition()
{
	if((DIA_Addon_Kardif_MissingPeople_permanent == FALSE) && (Kardif_OneQuestion == TRUE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Kardif_MissingPeople_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Addon_Kardif_MissingPeople_15_00 " );	// What do you know about the missing townspeople?
		AI_Output(self,other, " DIA_Addon_Kardif_MissingPeople_14_01 " );	// All I know is that a few people have disappeared in recent days.
		AI_Output(self,other, " DIA_Addon_Kardif_MissingPeople_14_02 " );	// They say that most of the missing people are here in the port. I think you should ask the locals.
		AI_Output(self,other, " DIA_Addon_Kardif_MissingPeople_14_03 " );	// In the lower part of the city, people also disappeared.
		AI_Output(self,other, " DIA_Addon_Kardif_MissingPeople_14_04 " );	// If you want to know more, talk to Koragon.
		AI_Output(self,other, " DIA_Addon_Kardif_MissingPeople_14_05 " );	// He's got a beer bar down town, and I think he's got this kind of news out of his ear.
		AI_Output(self,other, " DIA_Addon_Kardif_MissingPeople_14_06 " );	// Halvor, the fishmonger from the pier shop, might know something too - a lot of people come to see him.
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople, " Cardiff says I should talk about missing people with Coragon, the owner of the inn in the lower part of the city, and Halvor, who sells fish in the harbor. " );
		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Lernen (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Kardif_Lernen_Condition;
	information = DIA_Kardif_Lernen_Info;
	permanent = TRUE;
	description = " Who can I learn from here? " ;
};


var int DIA_Kardif_Lernen_permanent;

func int DIA_Kardif_Lernen_Condition()
{
	if ((DIA_Kardif_Lernen_permanent ==  FALSE ) && (Kardif_OneQuestion ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lernen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Kardif_Lernen_15_00 " );	// And who can you learn something from here?
		AI_Output(self,other, " DIA_Kardif_Lernen_14_01 " );	// There are a few knowledgeable people here in the waterfront.
		AI_Output(self,other, " DIA_Kardif_Lernen_14_02 " );	// Karl, the blacksmith, is a tough guy. I bet he can help you get stronger.
		AI_Output(self,other, " DIA_Kardif_Lernen_14_03 " );	// Alric is skilled in martial arts. And Lares is a swindler the world has never seen. He also sometimes comes to the port.
		AI_Output(self,other, " DIA_Kardif_Lernen_14_04 " );	// And if you're out of your mind enough to go to old Ignaz - he knows a lot about alchemy...hey alchi...(stammers) somehow, potions.
		AI_Output(other,self, " DIA_Kardif_Lernen_15_05 " );	// And where can I find all these people?
		AI_Output(self,other, " DIA_Kardif_Lernen_14_06 " );	// (groans) God, the king will have time to win the war against the orcs before I explain all this to you.
		AI_Output(self,other, " DIA_Kardif_Lernen_14_07 " );	// Just look around the waterfront, you're sure to find them. And if you want to better navigate here, go to Ibrahim and buy a map from him.
		AI_Output(self,other, " DIA_Kardif_Lernen_14_08 " );	// It's quite easy to find. He lives in the next house to the right of my inn. (mumbles) I should have charged twice as much for this information.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher, " Carl, blacksmith in the waterfront, can make me stronger. " );
		B_LogEntry_Quiet(TOPIC_CityTeacher, " Lares can help me improve my agility. " );
		B_LogEntry_Quiet(TOPIC_CityTeacher, " Alric can teach me one-handed weapons. He's hanging around behind the warehouse! " );
		B_LogEntry_Quiet(TOPIC_CityTeacher, " Ignatz can show me potion recipes. " );
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry_Quiet(TOPIC_CityTrader, " Ibrahim draws and sells cards. " );
		DIA_Kardif_Lernen_permanent = TRUE ;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instances DIA_Kardif_Diebeswerk (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Kardif_Diebeswerk_Condition;
	information = DIA_Kardif_Diebeswerk_Info;
	permanent = TRUE;
	description = " Is there any 'special' work here? " ;
};


var int DIA_Kardif_Diebeswerk_permanent;

func int DIA_Kardif_Diebeswerk_Condition()
{
	if((DIA_Kardif_Diebeswerk_permanent == FALSE) && (DIA_Kardif_Arbeit_permanent == TRUE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Kardif_Diebeswerk_15_00 " );	// Is there some kind of 'special' job here, I'd like to make some quick money?
		AI_Output(self,other, " DIA_Kardif_Diebeswerk_14_01 " );	// Something special you say? Hmm...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other, " DIA_Kardif_Diebeswerk_14_02 " );	// ...try talking to Nagur. Perhaps he can help you.
		DIA_Kardif_Diebeswerk_permanent = TRUE ;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Diebeswerk2 (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Kardif_Diebeswerk2_Condition;
	information = DIA_Kardif_Diebeswerk2_Info;
	permanent = TRUE;
	description = " Is there anything 'special' for me? " ;
};


var int DIA_Kardif_Diebeswerk2_permanent;

func int DIA_Kardif_Diebeswerk2_Condition()
{
	if ((DIA_Cardif_Diebeswerk2_permanent ==  FALSE ) && (DIA_Cardif_Diebeswerk_permanent ==  TRUE ) && (DIA_Cardif_Permanent_Work ==  TRUE ) && (Cardiff_OneQuestion ==  TRUE ) && (other.guild !=  GIL_KDF ) && (other.guild ! =  & (GIL_other. ) && .guild !=  GIL_MIL ) && ( other . guild !=  GIL_PAL ))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk2_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Kardif_Diebeswerk2_15_00 " );	// Is there anything 'special' for me?
		AI_Output(self,other, " DIA_Kardif_Diebeswerk2_14_01 " );	// Yes, there is something - but it will only interest you if you shine with versatile talents.
		AI_Output(other,self, " DIA_Kardif_Diebeswerk2_15_02 " );	// Spread out what you have there?
		AI_Output(self,other, " DIA_Kardif_Diebeswerk2_14_03 " );	// Well, Daron the Fire Mage is visiting Zuris, the potion vendor at the market.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//И?
		AI_Output(self,other, " DIA_Kardif_Diebeswerk2_14_05 " );	// He has a new chest made especially for him by Torben the carpenter.
		AI_Output(self,other, " DIA_Kardif_Diebeswerk2_14_06 " );	// This Daron is said to carry untold treasures with him. But you haven't heard from me, okay?
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instances DIA_Kardif_Zurueck (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 999;
	condition = DIA_Kardif_Zurueck_Condition;
	information = DIA_Kardif_Back_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int DIA_Kardif_Zurueck_Condition()
{
	if(Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zurueck_Info()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices(DIA_Kardif_Zurueck);
};


instance DIA_Kardif_DOPE(C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Kardif_DOPE_Condition;
	information = DIA_Kardif_DOPE_Info;
	permanent = TRUE;
	description = " Where can I buy weed here? " ;
};


var int DIA_Kardif_DOPE_perm;

func int DIA_Kardif_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_DOPE_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DOPE_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Kardif_DOPE_15_01 " );	// Where can I buy weed here?
	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other, " DIA_Kardif_DOPE_14_00 " );	// Not here - I don't deal with that sort of thing.
	}
	else
	{
		AI_Output(self,other, " DIA_Kardif_DOPE_14_02 " );	// Not here.
		AI_Output(other,self, " DIA_Kardif_DOPE_15_03 " );	// Okay, then where?
		AI_Output(self,other, " DIA_Kardif_DOPE_14_04 " );	// I'd talk to Meldor if I were you - he smokes here all day long.
		DIA_Kardif_DOPE_perm = TRUE;
	};
};


instance DIA_Kardif_Paket (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 3;
	condition = DIA_Kardif_Paket_Condition;
	information = DIA_Kardif_Paket_Info;
	permanent = TRUE;
	description = " Have you heard of a bale of swamp grass? " ;
};


var int DIA_Kardif_Packet_perm;

func int DIA_Kardif_Paket_Condition()
{
	if ((MY_Other_WAREHOUSE == LOG_Running) && (Cardiff_OneQuery ==  TRUE ) && (DIA_Cardiff_Packet_perm ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Cardif_Paket_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Kardif_Paket_15_00 " );	// Have you heard of a bale of swamp grass?
		AI_Output(self,other, " DIA_Kardif_Paket_14_01 " );	// The one who owns this bale is a rich man. And perhaps quite relaxed too!
		AI_Output(other,self, " DIA_Kardif_Paket_15_02 " );	// Don't try to fool me. You know something. Come on, post it!
		AI_Output(self,other, " DIA_Kardif_Paket_14_03 " );	// Okay, okay - this guy came into my inn recently. He is a mercenary.
		AI_Output(self,other, " DIA_Kardif_Paket_14_04 " );	// He said he sold a bale of swamp grass at the harbor, but of course it was stoned to the trash. That's all what I know.
		DIA_Kardif_Paket_perm = TRUE ;
		B_LogEntry(TOPIC_Warehouse, " Cardiff was talking to a mercenary. This guy has a bale of swamp grass that he wanted to sell. " );
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_SENDATTILA (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = DIA_Kardif_SENDATTILA_Condition;
	information = DIA_Kardif_SENDATTILA_Info;
	important = TRUE;
};


func int DIA_Kardif_SENDATTILA_Condition()
{
	if((MIS_ThiefGuild_sucked == TRUE) || ((Diebesgilde_Okay >= 3) && Npc_IsInState(self,ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SENDATTILA_Info()
{
	AI_Output(self,other, " DIA_Kardif_SENDATTILA_14_00 " );	// Hey you, come here. I have something for you.
	AI_Output(self,other, " DIA_Kardif_SENDATTILA_14_01 " );	// One guy really wants to talk to you.
	AI_Output(self,other, " DIA_Kardif_SENDATTILA_14_02 " );	// Since he didn't find you here, he asked me to give you a note.
	AI_Output(self,other, " DIA_Kardif_SENDATTILA_14_03 " );	// He wants to meet you. Behind Halvor's fish shop.
	AI_Output(self,other, " DIA_Kardif_SENDATTILA_14_04 " );	// This information is free - but this is an exception! The price for everything else remains the same.
	AI_Output(other,self, " DIA_Kardif_SENDATTILA_15_05 " );	// What did this guy look like?
	AI_Output(self,other, " DIA_Kardif_SENDATTILA_14_06 " );	// I could tell you - but you'll have to pay for it, my friend. (chuckles)

	if(Kardif_Deal == 0)
	{
		AI_Output(self,other, " DIA_Kardif_Hallo_14_04 " );	// Each piece of information I give you will be worth ten gold coins.
		Kardif_Deal = 10;
	};

	Wld_InsertNpc(VLK_494_Attila,"NW_CITY_ENTRANCE_01");
};


instances of DIA_Kardif_Kerl (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = DIA_Kardif_Kerl_Condition;
	information = DIA_Kardif_Kerl_Info;
	permanent = TRUE;
	description = " What did this guy look like? " ;
};


var int DIA_Kardif_Kerl_permanent;

func int DIA_Kardif_Kerl_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Cardif_SENDATTILA ) && ( Attila . aivar [ AIV_TalkedToPlayer ] ==  FALSE ) && ( Cardiff_OneQuestion ==  TRUE ) && ( DIA_Cardif_Kerl_permanent ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self, " DIA_Kardif_Kerl_15_00 " );	// What did this guy look like?
		AI_Output(self,other, " DIA_Kardif_Kerl_14_01 " );	// Well, he's pretty tall, dark skinned, and strong - but he doesn't wear a uniform. He's kind of... sinister.
		AI_Output(other,self, " DIA_Kardif_Kerl_15_02 " );	// And his face?
		AI_Output(self,other, " DIA_Kardif_Kerl_14_03 " );	// His face? When he looked at me, I was glad that he had not come for me.
		AI_Output(self,other, " DIA_Kardif_Kerl_14_04 " );	// There was something frightening in his eyes - well, anyway, I think you should go see him. It should be interesting.
		AI_Output(other,self, " DIA_Kardif_Kerl_15_05 " );	// Yes... the question is for whom...
		DIA_Kardif_Kerl_permanent = TRUE ;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_DEFEATEDATTILA(C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = DIA_Kardif_DEFEATEDATTILA_Condition;
	information = DIA_Kardif_DEFEATEDATTILA_Info;
	permanent = FALSE;
	description = " That bastard tried to kill me! " ;
};


func int DIA_Kardif_DEFEATEDATTILA_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Attila_Hallo ) && ( Cardiff_OneQuestion ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info()
{
	AI_Output(other,self, " DIA_Kardif_DEFEATEDATTILA_15_00 " );	// That bastard tried to kill me!
	AI_Output(self,other, " DIA_Kardif_DEFEATEDATTILA_14_01 " );	// Hey, how was I to know? I just passed on the information.
	AI_Output(self,other, " DIA_Kardif_DEFEATEDATTILA_14_02 " );	// If someone decides to annoy you, I think they had good reasons.
	B_GivePlayerXP(XP_Kardif_Blame4Attila);
	B_KillNpc(Attila);
	Npc_RemoveInvItem(Attila,ItMi_OldCoin);
};


instance DIA_Cardif_characters (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = DIA_Cardif_Character_Condition;
	information = DIA_Cardif_Character_Info;
	permanent = FALSE;
	description = " (Show thief alert) " ;
};


func int DIA_Cardif_Character_Condition()
{
	if((Knows_SecretSign == TRUE) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cardif_Character_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other, " DIA_Kardif_Zeichen_14_00 " );	// Ah, you're dealing with a gang. Good. In that case, I have something for you.
	AI_Output(self,other, " DIA_Kardif_Zeichen_14_01 " );	// If you need lockpicks, give me a hint. I saved a few just in case. Just ask me to pour you a drink.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	CreateInvItems(self,ItKE_lockpick,20);
};


instances DIA_Kardif_Crew (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 51;
	condition = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent = FALSE;
	description = " I still need sailors. " ;
};


func int DIA_Kardif_Crew_Condition()
{
	if (( MIS_SCKnowsWayToIrdorath ==  TRUE ) && ( Cardiff_OneQuestion ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Crew_Info()
{
	AI_Output(other,self, " DIA_Kardif_Crew_15_00 " );	// I still need sailors.
	AI_Output(self,other, " DIA_Kardif_Crew_14_01 " );	// These are bad times, mate. You will not find sailors in all Khorinis. Most of them have long since left the city.
	AI_Output(self,other, " DIA_Kardif_Crew_14_02 " );	// But with a good captain it won't be hard to recruit a few smart guys and make a good team out of them pretty quickly.
	AI_Output(other,self, " DIA_Kardif_Crew_15_03 " );	// Where can I find the captain?
	AI_Output(self,other, " DIA_Kardif_Crew_14_04 " );	// You're addressing the wrong address. I am a simple innkeeper.
	if (Npc_IsDead(Jack) ==  FALSE )
	{
		if(SCGotCaptain == FALSE)
		{
			Log_CreateTopic(Topic_Captain,LOG_MISSION);
			Log_SetTopicStatus(Topic_Captain,LOG_Running);
			B_LogEntry(Topic_Captain, " Cardiff sent me to old Jack. Maybe he can help me " );
		};
		AI_Output(self,other, " DIA_Kardif_Crew_14_05 " );	// Go talk to Old Jack. He's been hanging around this port for as long as I can remember. When it comes to maritime affairs, this is the man you need.
	};
};


instances DIA_KARDIF_PERMJOB (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 4;
	condition = dia_kardif_permjob_condition;
	information = dia_kardif_permjob_info;
	permanent = FALSE;
	description = " Got a job? " ;
};


func int dia_kardif_permjob_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Cardif_Hi ) && ( Npc_IsDead ( VLK_432_Moe ) ==  FALSE ) && ( Cardif_OneQuestion ==  FALSE )) .
	{
		return TRUE;
	};
};

func void dia_kardif_permjob_info()
{
	AI_Output(other,self, " DIA_Kardif_PermJob_01_00 " );	// Have a job?
	AI_Output(self,other, " DIA_Kardif_PermJob_01_05 " );	// I need someone to fill the bouncer position in my tavern right now.
	AI_Output(self,other, " DIA_Kardif_PermJob_01_06 " );	// Of course, I understand that the work is quite dusty, but for this I pay pretty good money!
	AI_Output(self,other, " DIA_Kardif_PermJob_01_09 " );	// Gavern is definitely the right guy, but there are times when he could use some help.
	AI_Output(self,other, " DIA_Kardif_PermJob_01_10 " );	// Although, judging by your appearance, you can hardly be called a tough guy.
	AI_Output(other,self, " DIA_Kardif_PermJob_01_12 " );	// What do I need to do to convince you otherwise?
	AI_Output(self,other, " DIA_Kardif_PermJob_01_13 " );	// Hmmm. Good question. Well, at least...
	AI_Output(self,other, " DIA_Kardif_PermJob_01_14 " );	// Tell me, have you seen the guy standing at the entrance to my tavern?
	AI_Output(other,self, " DIA_Kardif_PermJob_01_15 " );	// Yes, I saw it. I think his name is Mo.
	AI_Output(self,other, " DIA_Kardif_PermJob_01_18 " );	// This kingpin demands a fee from everyone who tries to enter here.
	AI_Output(self,other, " DIA_Kardif_PermJob_01_19 " );	// And this is not good for the reputation of my institution.
	AI_Output(self,other, " DIA_Kardif_PermJob_01_20 " );	// So I thought that if you can teach this asshole a lesson by kicking his ass, then I will hire you without question.
	MIS_MOEBORED = LOG_Running;
	Log_CreateTopic(TOPIC_MOEBORED,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MOEBORED,LOG_Running);
	if(MOEISBEATEN == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self, " DIA_Kardif_PermJob_01_22 " );	// I already dealt with this guy! He wasn't all that strong.
		AI_Output(self,other, " DIA_Kardif_PermJob_01_25 " );	// (laughs) Well, if that's the case, then just go and tell him that if I see him next to my tavern again, he'll get even more!
		B_LogEntry( TOPIC_MOEBORED , " If I want to get a job at Cardiff, I need to teach a guy named Moe a lesson. This guy hangs out at the entrance to the tavern all day and constantly extorts money from patrons. However, I had already kicked him in the past when he tried to throw this number directly with me. I think this time it's worth just talking to him and trying to convince him to stop extortion. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Kardif_PermJob_01_30 " );	// Okay, I'll try to fix this problem for you.
		AI_Output(self,other, " DIA_Kardif_PermJob_01_31 " );	// And also tell him that if I see him next to my tavern again, he will get even more!
		AI_Output(self,other, " DIA_Kardif_PermJob_01_32 " );	// If, of course, you manage to do it at all... (laughs) Which I highly doubt!
		B_LogEntry( TOPIC_MOEBORED , " If I want to get a job at Cardiff, I need to teach a guy named Moe a lesson. This guy hangs out at the entrance to the tavern all day and constantly extorts money from customers. " );
	};
	AI_StopProcessInfos(self);
};


instances DIA_KARDIF_PERMJOBDONE (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 1;
	condition = dia_kardif_permjobdone_condition;
	information = dia_kardif_permjobdone_info;
	permanent = FALSE;
	description = " About that Moe guy... " ;
};


func int dia_kardif_permjobdone_condition()
{
	if((MIS_MOEBORED == LOG_Running) && (Kardif_OneQuestion == FALSE) && ((MOEBEATME == TRUE) || (MOEISAWAYFROMTAVERNE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_kardif_permjobdone_info()
{
	AI_Output(other,self, " DIA_Kardif_PermJobDone_01_00 " );	// About that guy, Mo...

	if ( MOEISAWAYFROMTAVERNE  ==  TRUE )
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_01 " );	// Yes?! Any news?
		AI_Output(other,self, " DIA_Kardif_PermJobDone_01_02 " );	// I just spoke to him... and he promised he wouldn't bother you or your clients again.
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_03 " );	// Well, that's great news, mate!
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_07 " );	// I think I could use the services of a guy like you.
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_10 " );	// But first, let's discuss the terms of your work.
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_12 " );	// I think ten gold pieces a day should be fine.
		AI_Output(other,self,"DIA_Kardif_PermJobDone_01_15");	//Неплохо.
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_16 " );	// That's great!
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_18 " );	// Come see me at the tavern - I might have some small errands for you.
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_19 " );	// Yes, and now - take your share for today.
		B_GiveInvItems(self,other,ItMi_Gold,10);
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_20 " );	// You honestly earned it by dealing with this Moe.
		CARDIFPAYDAY = Wld_GetDay();
		MIS_MOEBORED = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MOEBORED,LOG_SUCCESS);
		B_LogEntry( TOPIC_MOEBORED , " Cardiff took me to work with him. Every day I will receive ten gold coins from him. " );
		AI_StopProcessInfos(self);
	}
	else if(MOEBEATME == TRUE)
	{
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_24 " );	// Yes, yes... (disappointed) I heard that you got a lot from him.
		AI_Output(self,other, " DIA_Kardif_PermJobDone_01_25 " );	// I'm sorry, but you don't suit me.
		MIS_MOEBORED = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_MOEBORED);
	};
};

instance DIA_CARDIF_PERMJOBPAY (C_Info) .
{
	npc = VLK_431_Cardiff;
	nr = 100;
	condition = dia_kardif_permjobpay_condition;
	information = dia_cardif_permjobpay_info;
	permanent = TRUE;
	description = " How about my payment? " ;
};

func int dia_kardif_permjobpay_condition()
{
	if((MIS_MOEBORED == LOG_SUCCESS) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_permjobpay_info()
{
	where int daynow;
	var int link;
	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Kardif_PermJobPay_01_00 " );	// How about my payment?

	if(KARDIFPAYDAY < daynow)
	{
		AI_Output(self,other, " DIA_Kardif_PermJobPay_01_01 " );	// Of course, mate! Here, take your share.
		link = 10  * (daynow -  KARDIFPAYDAY );
		B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		CARDIFPAYDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Kardif_PermJobPay_01_03 " );	// (surprised) But you already got your share today!
	};
};


instance DIA_KARDIF_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 2;
	condition = dia_kardif_aboutkillignaz_condition;
	information = dia_kardif_aboutkillignaz_info;
	permanent = FALSE;
	description = " Do you know anything about the murder of the alchemist Ignaz? " ;
};


func int dia_kardif_aboutkillignaz_condition()
{
	if (( MIS_KILLIGNAZ  == LOG_Running ) && ( Cardiff_OneQuestion ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_kardif_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Kardif_AboutKillIgnaz_01_00 " );	// Do you know anything about the murder of the alchemist Ignaz?
	AI_Output(self,other, " DIA_Kardif_AboutKillIgnaz_01_01 " );	// Hmmm...(thoughtfully) Not much, I'm afraid.
	AI_Output(self,other, " DIA_Kardif_AboutKillIgnaz_01_03 " );	// I know as much as everyone else.
	B_LogEntry( TOPIC_KILLIGNAZ , " Cardiff hasn't heard anything out of the ordinary about this case either. " );
	ASKKILLTHIRD = TRUE;
};

var int CardiffBuyMeat;
var int CardiffBuyMeatDay;

instance DIA_KARDIF_BUYMEAT(C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 15;
	condition = dia_kardif_buymeat_condition;
	information = dia_kardif_buymeat_info;
	permanent = FALSE;
	description = " How about some errands? " ;
};

func int dia_kardif_buymeat_condition()
{
	if((MIS_MOEBORED == LOG_SUCCESS) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_buymeat_info()
{
	AI_Output(other,self, " DIA_Kardif_BuyMeat_01_00 " );	// How about some errands?
	AI_Output(self,other, " DIA_Kardif_BuyMeat_01_01 " );	// Well, if you want to earn some more money, you can go hunting and get me some raw meat.
	AI_Output(self,other, " DIA_Kardif_BuyMeat_01_02 " );	// There have been too many visitors to my tavern lately. That's not enough for everyone.
	AI_Output(other,self, " DIA_Kardif_BuyMeat_01_03 " );	// And how much do you need?
	AI_Output(self,other, " DIA_Kardif_BuyMeat_01_04 " );	// (thoughtfully) About twenty grand every day.
	AI_Output(self,other, " DIA_Kardif_BuyMeat_01_05 " );	// But no more! Otherwise, I will have nowhere to store it, and in the end it will simply deteriorate.
	AI_Output(other,self, " DIA_Kardif_BuyMeat_01_06 " );	// Good. What about my payment?
	AI_Output(self,other, " DIA_Kardif_BuyMeat_01_07 " );	// For one such batch of meat, I'm willing to pay you about a hundred coins. Sorry, I can't do it anymore.
	AI_Output(self,other, " DIA_Kardif_BuyMeat_01_08 " );	// That's almost twice as much as any vendor in the marketplace will give you.
	AI_Output(self,other, " DIA_Kardif_BuyMeat_01_09 " );	// But don't you dare bring me roast meat! Otherwise, you'll just ruin it...
	AI_Output(other,self, " DIA_Kardif_BuyMeat_01_10 " );	// Okay. I'll think about your proposal.
	KardifBuyMeat = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Cardiff is willing to buy twenty cuts of raw meat from me every day for a hundred gold coins. " );
};

instance DIA_Kardif_SellMeat (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 16;
	condition = DIA_Kardif_SellMeat_condition;
	information = DIA_Kardif_SellMeat_info;
	permanent = TRUE;
	description = " About your meat... " ;
};

func int DIA_Kardif_SellMeat_condition ()
{
	if((KardifBuyMeat == TRUE) && (Npc_HasItems(other,ItFoMuttonRaw) >= 20) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SellMeat_info ()
{
	AI_Output(other,self, " DIA_Kardif_SellMeat_01_00 " );	// About your meat...

	if (CardiffBuyMeatDay < Wld_GetDay())
	{
		AI_Output(self,other, " DIA_Kardif_SellMeat_01_01 " );	// Yes? Did you bring it?
		AI_Output(other,self, " DIA_KARDIF_SellMeat_01_02 " );	// Of course. Here's what you asked for - twenty pieces of fresh meat.
		B_GiveInvItems(other,self,ItFoMuttonRaw,20);
		Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
		AI_Output(self,other, " DIA_KARDIF_SellMeat_01_03 " );	// Great. That's enough for me for today.
		AI_Output(self,other, " DIA_KARDIF_SellMeat_01_04 " );	// Here, take your gold. And don't forget: I'm expecting another shipment from you tomorrow.
		B_GiveInvItems(self,other,ItMi_Gold,100);
		AI_Output(other,self, " DIA_KARDIF_SellMeat_01_05 " );	// Of course.
		CardiffBuyMeatDay = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Kardif_SellMeat_01_06 " );	// That's enough for me for today! Come tomorrow.
		AI_StopProcessInfos(self);
	};
};

// ------------------------------------------------ Game-- ----------------------------------------

instance DIA_VLK_431_Kardif_Game (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 3;
	condition = DIA_VLK_431_Kardif_Game_condition;
	information = DIA_VLK_431_Kardif_Game_info;
	description = " What else is there to do here? " ;
};

func int DIA_VLK_431_Kardif_Game_condition()
{
	if ((Npc_KnowsInfo(other,DIA_Cardif_Hi) ==  TRUE ) && (Cardif_OneQuestion ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_Game_info()
{
	AI_Output(other,self, " DIA_VLK_431_Kardif_Game_01_00 " );	// What else is there to do?
	AI_Output(self,other, " DIA_VLK_431_Kardif_Game_01_01 " );	// You mean, other than cuddle with a bottle of schnapps all day?
	AI_Output(other,self, " DIA_VLK_431_Kardif_Game_01_02 " );	// Well, something like that.
	AI_Output(self,other, " DIA_VLK_431_Kardif_Game_01_03 " );	// This is a tavern for you, buddy, not a brothel! People come here just to get their throats wet.
	AI_Output(self,other, " DIA_VLK_431_Kardif_Game_01_04 " );	// However...(pauses) For some of my special clients, I might offer some more dice games with me.
	AI_Output(self,other, " DIA_VLK_431_Kardif_Game_01_05 " );	// This is a lot more fun than just drowning in a bottle. And spending time playing is much more fun.
	AI_Output(other,self, " DIA_VLK_431_Kardif_Game_01_06 " );	// Can I play with you?
	AI_Output(self,other, " DIA_VLK_431_Kardif_Game_01_07 " );	// You? Hmmm... (assessing) You can. But only on condition that you have gold in your pockets.
	AI_Output(self,other, " DIA_VLK_431_Kardif_Game_01_08 " );	// The stakes in this game are high, so the contingent must be appropriate.
	AI_Output(self,other, " DIA_VLK_431_Kardif_Game_01_09 " );	// So, if you're ready to part with a hundred other gold pieces without regret, just say so and we'll start the game right away.
	AI_Output(self,other, " DIA_VLK_431_Kardif_Game_01_10 " );	// Otherwise, I can't help you anymore. Will you drink something?
	KardifPlayResult = 200;
	Menu_WriteInt("AST","SysTimer01",0);
	Log_CreateTopic(TOPIC_GameList,LOG_NOTE);
	B_LogEntry(TOPIC_GameList, " As it turns out, Cardiff is one of the few people who plays dice for money. Maybe I should try to beat him. " );
};

instance DIA_VLK_431_Kardif_WhatOth(C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 3;
	condition = DIA_VLK_431_Kardif_WhatOth_condition;
	information = DIA_VLK_431_Kardif_WhatOth_info;
	description = " Do you know anyone else to play with? " ;
};

func int DIA_VLK_431_Kardif_WhatOth_condition()
{
	if((Npc_KnowsInfo(other,DIA_VLK_431_Kardif_Game) == TRUE) && (Kardif_OneQuestion == FALSE) && (KnowOtherPlayers == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_WhatOth_info()
{
	AI_Output(other,self, " DIA_VLK_431_Kardif_WhatOth_01_00 " );	// Know anyone else to play with?
	AI_Output(self,other, " DIA_VLK_431_Kardif_WhatOth_01_01 " );	// Hmmm... (thoughtfully) There aren't many of them.
	AI_Output(self,other, " DIA_VLK_431_Kardif_WhatOth_01_02 " );	// One of them is Salandril, an alchemist from the upper quarter of the city. Although he is obsessed with his elixirs, he is even more passionate.
	AI_Output(self,other, " DIA_VLK_431_Kardif_WhatOth_01_03 " );	// In addition to him, Orlan - the owner of the 'Dead Harpy' tavern - often plays dice. And, I must say, pretty good!
	AI_Output(self,other, " DIA_VLK_431_Kardif_WhatOth_01_04 " );	// You should see how he rips off his clients to the last penny at the gaming table. Even I am afraid to play with him.
	AI_Output(self,other, " DIA_VLK_431_Kardif_WhatOth_01_05 " );	// Well, the last of them is Raul, a mercenary at Onar's farm. This one is a real scam!
	AI_Output(self,other, " DIA_VLK_431_Kardif_WhatOth_01_06 " );	// I wouldn't advise you to contact him. Otherwise, you risk being left without pants.
	AI_Output(self,other, " DIA_VLK_431_Kardif_WhatOth_01_07 " );	// Well, that's all I know.
	GameOtherPlayers = TRUE;
	B_LogEntry(TOPIC_GameList, " There are other players I can play dice with: Salandril, the alchemist from the upper quarter, Orlan, the owner of the Dead Harpy tavern, and the mercenary Raul. " );
};

instance DIA_VLK_431_Kardif_GamePlay (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 900;
	condition = DIA_VLK_431_Kardif_GamePlay_condition;
	information = DIA_VLK_431_Kardif_GamePlay_info;
	permanent = TRUE;
	description = " Let's play dice! " ;
};

func int DIA_VLK_431_Kardif_GamePlay_condition()
{
	if ((Npc_KnowsInfo(other,DIA_VLK_431_Cardiff_Game) ==  TRUE ) && (Cardiff_OneQuestion ==  FALSE ) && (Mount_Up ==  FALSE ) && (FlyCarpetIsOn ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer01");

	if(CheckLastGame >= KardifPlayResult)
	{
		CheckLastSum = CheckLastGame - KardifPlayResult;
	};

	AI_Output(other,self, " DIA_VLK_431_Kardif_GamePlay_01_00 " );	// Let's play dice!

	if(KardifPlayResult >= CheckLastGame)
	{
		if((KardifPlayResult > 0) && (KardifDayFlag == FALSE))
		{
			AI_Output(self,other, " DIA_VLK_431_Kardif_GamePlay_01_01 " );	// Come on, let's play...
			PlayPocker(1,self);
		}
		else
		{
			if (CardiffDayFlag ==  FALSE )
			{
				AI_Output(self,other, " DIA_VLK_431_Kardif_GamePlay_01_02 " );	// Enough games for today! I've already lost too much to you.
				CardiffDayPlay = Wld_GetDay();
				CardiffDayFlag = TRUE ;
			}
			else
			{
				AI_Output(self,other, " DIA_VLK_431_Kardif_GamePlay_01_03 " );	// Sorry, buddy, but I'm not up to games yet.
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_VLK_431_Kardif_GamePlay_01_04 " );	// Last time you lost me a decent amount. Or do you think I forgot about it?
		AI_Output(self,other, " DIA_VLK_431_Kardif_GamePlay_01_05 " );	// So, until you give it to me, there will be no game!
		Info_ClearChoices(DIA_VLK_431_Kardif_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_VLK_431_Kardif_GamePlay, " Here's your money. " ,DIA_VLK_431_Kardif_GamePlay_Here);
		};

		Info_AddChoice(DIA_VLK_431_Kardif_GamePlay, " I don't have that much money. " ,DIA_VLK_431_Kardif_GamePlay_No);
	};
};

func void DIA_VLK_431_Kardif_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	KardifPlayResult = CheckLastGame;
	AI_Output(other,self, " DIA_VLK_431_Kardif_GamePlay_Here_01_01 " );	// Here's your money.
	AI_Output(self,other, " DIA_VLK_431_Kardif_GamePlay_Here_01_02 " );	// Good. Now you can play...
	PlayPocker(1,self);
};

func void DIA_VLK_431_Kardif_GamePlay_No()
{
	AI_Output(other,self, " DIA_VLK_431_Kardif_GamePlay_No_01_01 " );	// I don't have that much money.
	AI_Output(self,other, " DIA_VLK_431_Kardif_GamePlay_No_01_02 " );	// Then find them! You understand, the debt is red in payment ...
	Info_ClearChoices(DIA_VLK_431_Kardif_GamePlay);
};

instance DIA_VLK_431_Kardif_GameEnd (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 3;
	condition = DIA_VLK_431_Kardif_GameEnd_condition;
	info = DIA_VLK_431_Kardif_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_431_Kardif_GameEnd_condition()
{
	if ((MustTellResult_Cardif ==  TRUE ) && ((CardifLost ==  TRUE ) || (CardifWon ==  TRUE )))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_GameEnd_info()
{
	if ( CardifLost ==  TRUE )
	{
		AI_Output(self,other, " DIA_VLK_431_Kardif_GameEnd_00 " );	// Damn! Apparently today is just not my day...
		CardiffLost = FALSE ;
	}
	else if(KardifWon == TRUE)
	{
		AI_Output(self,other, " DIA_VLK_431_Kardif_GameEnd_01 " );	// Looks like luck is on my side, mate! But you can try your luck again if you want.
		CardifWon = FALSE ;
	};

	MustTellResult_Kardif = FALSE ;
};

instances DIA_Kardif_DiscoverLH (C_Info)
{
	npc = VLK_431_Cardiff;
	nr = 5;
	condition = DIA_Kardif_DiscoverLH_Condition;
	information = DIA_Kardif_DiscoverLH_Info;
	description = " I need your advice. " ;
};

func int DIA_Kardif_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (Kardif_OneQuestion == TRUE) && (CanGoLH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DiscoverLH_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Kardif_DiscoverLH_01_00 " );	// I need your advice.
	AI_Output(self,other, " DIA_Kardif_DiscoverLH_01_01 " );	// Always happy to help. Especially since you've already paid for it.
	AI_Output(other,self, " DIA_Kardif_DiscoverLH_01_02 " );	// You don't happen to know who here in the port could tell you something about... pirates.
	AI_Output(self,other, " DIA_Kardif_DiscoverLH_01_03 " );	// About pirates?! Wow, man, well, you ask a question. Hmmm... (thoughtfully) I'm afraid no one. But you can talk to Jack.
	AI_Output(self,other, " DIA_Kardif_DiscoverLH_01_04 " );	// He is an old sailor, he has seen a lot, and he probably had to deal with pirates.
	AI_Output(other,self, " DIA_Kardif_DiscoverLH_01_05 " );	// Thank you.
	KnowStoryDLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse, " Cardiff said that if anyone could tell me about the pirates, it would be Lighthouse Keeper Jack. " );
};
