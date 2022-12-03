

instance DIA_Sarah_EXIT(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 999;
	condition = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_PICKPOCKET(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 900;
	condition = DIA_Sarah_PICKPOCKET_Condition;
	information = DIA_Sarah_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sarah_PICKPOCKET_Condition()
{
	return  C_Robbery ( 57 , 60 );
};

func void DIA_Sarah_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,Dialog_Back,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};

func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};


instance DIA_Sarah_Greet(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 1;
	condition = DIA_Sarah_Greet_Condition;
	information = DIA_Sarah_Greet_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_Greet_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Greet_Info()
{
	AI_Output(self,other, " DIA_Sarah_Add_16_07 " );	// Ah! You again!
};


instances DIA_Sarah_HALLO (C_Info)
{
	npc = VLK_470_Sarah;
	condition = DIA_Sarah_HALLO_Condition;
	information = DIA_Sarah_HALLO_Info;
	permanent = FALSE;
	description = " How is trading? " ;
};


func int DIA_Sarah_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sarah_HALLO_Info()
{
	AI_Output(other,self, " DIA_Sarah_HALLO_15_00 " );	// How is trading?
	AI_Output(self,other, " DIA_Sarah_HALLO_16_01 " );	// When the paladins came, at first I thought it was good for business.
	AI_Output(self,other, " DIA_Sarah_HALLO_16_02 " );	// But now Harad makes weapons for them. And neither I nor Hakon have yet received a single coin from them.
	AI_Output(self,other, " DIA_Sarah_HALLO_16_03 " );	// And to make matters worse, the farmers no longer supply us with food, and the prices of everything have skyrocketed.
	AI_Output(self,other, " DIA_Sarah_Add_16_00 " );	// One small consolation - the paladins pay for my hotel room.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Sarah trades weapons in the marketplace. " );
};


instance DIA_Sarah_Bauern (C_Info)
{
	npc = VLK_470_Sarah;
	nr = 2;
	condition = DIA_Sarah_Bauern_Condition;
	information = DIA_Sarah_Bauern_Info;
	permanent = FALSE;
	description = " What's the problem with farmers? " ;
};


func int DIA_Sarah_Bauern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Bauern_Info()
{
	AI_Output(other,self, " DIA_Sarah_Bauern_15_00 " );	// What's the problem with farmers?
	AI_Output(self,other, " DIA_Sarah_Bauern_16_01 " );	// They refuse to supply us with food.
	AI_Output(self,other, " DIA_Sarah_Bauern_16_02 " );	// Now that ships no longer call at our port, the city is completely dependent on the products produced by our farmers.
	AI_Output(self,other, " DIA_Sarah_Bauern_16_03 " );	// And Onar, the biggest farmer, hired mercenaries to protect his farm from city guards. Before that, they took everything clean from him.
	AI_Output(self,other, " DIA_Sarah_Add_16_01 " );	// But the mercenaries aren't just guarding Onar's farm.
	AI_Output(self,other, " DIA_Sarah_Add_16_02 " );	// They've even reached the small farms near the city, and they're bullying their owners.
	AI_Output(self,other, " DIA_Sarah_Add_16_03 " );	// I saw them when I went to the Akila farm. I wouldn't want to be in his place now.
};


DIA_Sarah_AkilsHof (C_Info) instance
{
	npc = VLK_470_Sarah;
	nr = 3;
	condition = DIA_Sarah_AkilsHof_Condition;
	information = DIA_Sarah_AkilsHof_Info;
	permanent = FALSE;
	description = " Where can I find Akila Farm? " ;
};


func int DIA_Sarah_AkilsHof_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Sarah_Bauern))
	{
		return TRUE;
	};
};

func void DIA_Sarah_AkilsHof_Info()
{
	AI_Output(other,self, " DIA_Sarah_AkilsHof_15_00 " );	// Where can I find the Akila farm?
	AI_Output(self,other, " DIA_Sarah_Add_16_04 " );	// If you exit the east gate and follow the road to the right, you will soon see a stone staircase.
	AI_Output(self,other, " DIA_Sarah_Add_16_05 " );	// It leads straight to Akila's farm.
	AI_Output(self,other, " DIA_Sarah_Add_16_06 " );	// But I wouldn't go there now! Those mercenaries are probably still out there.
};


instance DIA_Sarah_Trade(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_Trade_Condition;
	information = DIA_Sarah_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " Show me your products. " ;
};

func int DIA_Sarah_Trade_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Sarah_HALLO ) && Wld_IsTime ( 5 , 15 , 20 , 15 ) && ( Sarah_Died ==  FALSE ) && ( SARAFLEE  ==  FALSE ) && ( SARAISDEAD  ==  FALSE ))
	{
		return TRUE;
	};
	if (( SARAHELPYOUDONE  ==  TRUE ) && Wld_IsTime( 5 , 15 , 20 , 15 ))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Sarah_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
	Sarah_WeaponsSeen = TRUE ;
};


instance DIA_Sarah_IMKNAST(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_IMKNAST_Condition;
	information = DIA_Sarah_IMKNAST_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_IMKNAST_Condition()
{
	if((Sarah_Ausgeliefert == TRUE) && Npc_IsInState(self,ZS_Talk) && (SARAISFREE == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_IMKNAST_Info()
{
	AI_Output(self,other, " DIA_Sarah_IMKNAST_16_00 " );	// You?! You dare to appear here! Of course, I cannot prove this, but I am ready to swear that this is your doing!
	AI_Output(self,other, " DIA_Sarah_IMKNAST_16_01 " );	// It's your fault that I'm here. You and that accursed Kantar - may Innos punish you!
	Npc_RemoveInvItems(self,ItWr_Canthars_KomproBrief_MIS,Npc_HasItems(self,ItWr_Canthars_KomproBrief_MIS));
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_Success(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = DIA_Sarah_Success_Condition;
	information = DIA_Sarah_Success_Info;
	permanent = FALSE;
	description = " Kantar tried to set you up! " ;
};


func int DIA_Sarah_Success_Condition()
{
	if ((Canthar_Ausgeliefer ==  TRUE ) && (Canthar_WeederRaus ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Success_Info()
{
	AI_Output(other,self, " DIA_Sarah_Success_15_00 " );	// Kantar tried to set you up and get your stall. But I turned him in to the city guard.
	AI_Output(self,other, " DIA_Sarah_Success_16_01 " );	// You've made yourself a very dangerous enemy. I've known this bastard for a long time. And he always wanted to get my counter.
	AI_Output(self,other, " DIA_Sarah_Success_16_02 " );	// Take this weapon as a token of my gratitude!
	B_GivePlayerXP(XP_CantharImKnast);
	B_GiveInvItems(self,other,ItMw_Piratensaebel,1);
	SARAKNOWSABOUTCANTHAR = TRUE;
};


instance DIA_SARAH_FLEE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_flee_condition;
	information = dia_sarah_flee_info;
	permanent = FALSE;
	description = " Are you okay? " ;
};

func int dia_sarah_flee_condition()
{
	if(SARAFLEE == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_flee_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Sarah_Flee_15_00 " );	// Are you okay?
	AI_Output(self,other, " DIA_Sarah_Flee_16_01 " );	// Good thing you warned me last time. Otherwise I wouldn't live!
	AI_Output(self,other, " DIA_Sarah_Flee_16_02 " );	// Kantar got out of prison, and I could barely fly away. Now I'm fed up with the city.
	AI_Output(self,other, " DIA_Sarah_Flee_16_03 " );	// I just don't know what to do - there's no trading at all.
	AI_Output(self,other, " DIA_Sarah_Flee_16_04 " );	// But anyway, thanks for your help.
};

instance DIA_SARAH_RETURN(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_return_condition;
	information = dia_sarah_return_info;
	permanent = FALSE;
	description = " You can return to the market. " ;
};

func int dia_sarah_return_condition()
{
	if (( SARAFLEE  ==  TRUE ) && ( SARAAGREE  ==  FALSE ) && ( Npc_IsDead( Canthar ) ==  TRUE ) && ( SARAHELPYOU  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_sarah_return_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Sarah_Return_01_00 " );	// You can return to the market.
	AI_Output(self,other, " DIA_Sarah_Return_01_01 " );	// But... but Kantar is there! If he sees me, I don't know what he will do to me!
	AI_Output(other, self, " DIA_Sarah_Return_01_02 " );	// Don't worry about Kantar - he had an accident.
	AI_Output(other,self, " DIA_Sarah_Return_01_03 " );	// Now your place is free again!
	AI_Output(self,other, " DIA_Sarah_Return_01_04 " );	// True? Well, serve this bastard - he deserved it, bastard!
	AI_Output(self,other, " DIA_Sarah_Return_01_05 " );	// However, I'd rather stay here - that place in the market gives me goosebumps.
	AI_Output(self,other, " DIA_Sarah_Return_01_07 " );	// But anyway, thanks for making me feel a little better...
};


instance DIA_SARAH_AFTERIMKNAST(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = dia_sarah_afterimknast_condition;
	information = dia_sarah_afterimknast_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sarah_afterimknast_condition()
{
	if((SARAHELPYOUANDFREE == TRUE) && (SARAISFREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sarah_afterimknast_info()
{
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_01_00 " );	// Ah! Is that you, bastard?
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_01_01 " );	// It's your fault that they put me in jail! (angrily) You and your damn Kantar!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_01_02 " );	// Now all the people because of you think that I'm a dirty criminal!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_01_04 " );	// I don't want to talk to you, you bastard!
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_01_05 " );	// Wait, at least listen to me!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_01_06 " );	// Give me one reason why I should do this.
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_01_07 " );	// For starters, at least that I got you out of jail.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_01_08 " );	// WHAT?! Did you do it?
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_01_09 " );	// Yes, it was I who paid the fine to Lord Andre for you.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_01_12 " );	// You put me in prison first - and then pulled me out?
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_01_14 " );	// What does all this mean?
	Npc_RemoveInvItems(self,ItWr_Canthars_KomproBrief_MIS,Npc_HasItems(self,ItWr_Canthars_KomproBrief_MIS));
	Info_ClearChoices(dia_sarah_afterimknast);
	Info_AddChoice(dia_sarah_afterimknast, " I have nothing to tell you. " ,dia_sarah_afterimknast_unknown);
	Info_AddChoice(dia_sarah_afterimknast, " I'm sorry about that incident. " ,dia_sarah_afterimknast_sorry);
	Info_AddChoice(dia_sarah_afterimknast, " I had no choice then. " ,dia_sarah_afterimknast_nochoice);
};

func void dia_sarah_afterimknast_unknown()
{
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_Unknown_01_00 " );	// I have nothing to tell you.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_Unknown_01_01 " );	// (contemptuously) I knew it!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_Unknown_01_03 " );	// Get out of my sight, you scoundrel!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_Unknown_01_04 " );	// I don't want to listen to you anymore!
	B_LogEntry( TOPIC_SARAHTOGUILD , " I tried to talk to Sarah, but she wouldn't even listen to me. Maybe I should go back to Luthero and talk to him about this. " );
	SARAPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sarah_afterimknast_sorry()
{
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_Sorry_01_00 " );	// I apologize for that incident.
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_Sorry_01_02 " );	// Believe me, I am very sorry that this happened and I apologize to you.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_Sorry_01_03 " );	// Hmmm...(incredulous) I'm surprised you had the courage to admit it.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_Sorry_01_05 " );	// This time I'll believe you and accept your apology.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_Sorry_01_06 " );	// But no more than that.
	B_LogEntry( TOPIC_SARAHTOGUILD , " I tried to talk to Sarah and get back on good terms with her. I think that worked out a little. However, I think it's worth holding off on Luthero's proposal for a while until Sarah finally comes to her senses. After everything that happened, she doesn't trust me too much yet. Maybe I should try something else to gain her trust in the meantime. " );
	SARAPROOFBEFRIEND = TRUE;
	SARAHELPYOU = TRUE;
	Info_ClearChoices(dia_sarah_afterimknast);
};

func void dia_sarah_afterimknast_nochoice()
{
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_NoChoice_01_00 " );	// See, I didn't have a choice back then. Kantar blackmailed me!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_NoChoice_01_02 " );	// And that's why you thought it best to set me up? (angrily) Well, you're a scoundrel!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_NoChoice_01_03 " );	// You know what I'll tell you - you are a man who has neither honor nor dignity!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_NoChoice_01_04 " );	// I'm still surprised you had the guts to pay the fine for me.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_NoChoice_01_05 " );	// And it seems to me that even this you did for a reason. Apparently you need something from me.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_06");	//Я права?
	Info_ClearChoices(dia_sarah_afterimknast);
	Info_AddChoice(dia_sarah_afterimknast, " No. I just decided to correct my mistake. " ,dia_sarah_afterimknast_no);
	Info_AddChoice(dia_sarah_afterimknast, " Well , yes. I have something for you. " ,dia_sarah_afterimknast_yes);
};

func void dia_sarah_afterimknast_yes()
{
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_Yes_01_00 " );	// In general, yes. I have business for you...
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_Yes_01_02 " );	// I don't deal with scoundrels like you!
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_Yes_01_03 " );	// So you better get out of my sight!
	B_LogEntry( TOPIC_SARAHTOGUILD , " I tried to talk to Sarah, but she wouldn't even listen to me. Maybe I should go back to Luthero and talk to him about this. " );
	SARAPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sarah_afterimknast_no()
{
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_No_01_00 " );	// No. I just decided to correct my mistake.
	AI_Output(other,self, " DIA_Sarah_AfterImKnast_No_01_01 " );	// Believe me, I'm sorry that this happened and I apologize to you.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_No_01_03 " );	// This time I will believe you and accept them.
	AI_Output(self,other, " DIA_Sarah_AfterImKnast_No_01_04 " );	// But no more than that.
	B_LogEntry( TOPIC_SARAHTOGUILD , " I tried to talk to Sarah and get back on good terms with her. I think that worked out a little. However, I think it's worth holding off on Luthero's proposal for a while until Sarah finally comes to her senses. After everything that happened, she doesn't trust me too much yet. Maybe I should try something else to gain her trust in the meantime. " );
	SARAPROOFBEFRIEND = TRUE;
	SARAHELPYOU = TRUE;
	Info_ClearChoices(dia_sarah_afterimknast);
};


instance DIA_SARAH_FUCKOFF(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 10;
	condition = dia_sarah_fuckoff_condition;
	information = dia_sarah_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_fuckoff_condition()
{
	if((SARAPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sarah_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SARAH_SARAHELPSONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsone_condition;
	information = dia_sarah_sarahelpsone_info;
	permanent = FALSE;
	description = " You don't look good. " ;
};


func int dia_sarah_sarahelpsone_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARAREFUSEHELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsone_info()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsOne_01_00 " );	// You don't look well.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOne_01_01 " );	// I haven't eaten anything all day and I'm very hungry.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOne_01_03 " );	// But I don't have the money to pay for the food.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOne_01_05 " );	// So, until I find myself a new job, I'll have to starve a little.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	Info_AddChoice(dia_sarah_sarahelpsone, " Got it . " ,dia_sarah_sarahelpsone_no);
	Info_AddChoice(dia_sarah_sarahelpsone, " I'll get you some food. " ,dia_sarah_sarahelpsone_yes);
};

func void dia_sarah_sarahelpsone_no()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsOne_No_01_00 " );	// I don't have time for this.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	B_LogEntry( TOPIC_SARAHTOGUILD , " I think Sarah won't want to talk to me about the Luthero proposal now. " );
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpsone_yes()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsOne_Yes_01_01 " );	// I'll bring you food.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOne_Yes_01_02 " );	// (smiles) Thank you.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOne_Yes_01_03 " );	// I think two pieces of cooked meat and a bottle of milk will be enough to satisfy my hunger a little.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	MIS_SARAHELPSONE = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSONE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSONE,LOG_Running);
	B_LogEntry( TOPIC_SARAHELPSONE , " Sarah is very hungry and I decided to bring her food. She asked for two pieces of grilled meat and a bottle of milk. " );
};


instance DIA_SARAH_SARAHELPSONEDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsonedone_condition;
	information = dia_sarah_sarahelpsonedone_info;
	permanent = FALSE;
	description = " I brought you something to eat. " ;
};


func int dia_sarah_sarahelpsonedone_condition()
{
	if((MIS_SARAHELPSONE == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (Npc_HasItems(hero,ItFoMutton) >= 2) && (Npc_HasItems(hero,ItFo_Milk) >= 1))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsonedone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Sarah_SaraHelpsOneDone_01_00 " );	// I brought you food. Here, take it.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOneDone_01_01 " );	// Thank you.
	Npc_RemoveInvItems(other,ItFoMutton,2);
	Npc_RemoveInvItems(other,ItFo_Milk,1);
	CreateInvItems(self,ItFoMutton,2);
	CreateInvItems(self,ItFo_Milk,1);
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOneDone_01_02 " );	// This food will last me for a while.
	B_UseItem(self,ItFoMutton);
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOneDone_01_03 " );	// Mmmm... How delicious!
	B_UseItem(self,ItFo_Milk);
	AI_Output(self,other, " DIA_Sarah_SaraHelpsOneDone_01_04 " );	// After the slop they fed me in prison - this food seems to be the food of the gods!
	MIS_SARAHELPSONE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSONE,LOG_SUCCESS);
	B_LogEntry( TOPIC_SARAHELPSONE , " I brought Sarah some food. " );
	SARAHELPSONEDONE = TRUE;
	if (( MY_SARAHTOGUILD  == LOG_Running ) && ( SARAHELPSONEDONE  ==  TRUE ) && ( SARAHELPSTWODONE  ==  TRUE ) && ( SARAHELPSTHREEDONE  ==  TRUE ) && ( SARABEFRIEND  ==  FALSE )) ;
	{
		AI_Output(self,other, " DIA_Sarah_SaraHelpsOneDone_01_06 " );	// And you know, after everything you've done for me, I think you can be trusted.
		AI_Output(self,other, " DIA_Sarah_SaraHelpsOneDone_01_07 " );	// A scoundrel like that Kantar would never do that. And you helped me in a difficult situation!
		AI_Output(self,other, " DIA_Sarah_SaraHelpsOneDone_01_08 " );	// You're a good person!
		SARABEFRIEND = TRUE;
		Log_AddEntry( TOPIC_SARAHTOGUILD , " Sarah seems to trust me now and thinks I'm a good person. I think it's time to talk to her about Luthero's proposal. " );
	};
};


instance DIA_SARAH_SARAHELPSTWO(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpstwo_condition;
	information = dia_sarah_sarahelpstwo_info;
	permanent = FALSE;
	description = " Is something bothering you? " ;
};


func int dia_sarah_sarahelpstwo_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARAREFUSEHELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpstwo_info()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsTwo_01_00 " );	// Is something bothering you?
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwo_01_03 " );	// I had one little thing with me - a precious family ring that my parents gave me as a keepsake.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwo_01_04 " );	// But when I was in prison, one of the guards took it from me!
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwo_01_05 " );	// Trash! I still remember with what a greedy face he ripped it off my finger!
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwo_01_13 " );	// Now he is unlikely to give me this ring.
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	Info_AddChoice(dia_sarah_sarahelpstwo, " I don't have time for this. " ,dia_sarah_sarahelpstwo_no);
	Info_AddChoice(dia_sarah_sarahelpstwo, " I'll help you get this ring back. " ,dia_sarah_sarahelpstwo_yes);
};

func void dia_sarah_sarahelpstwo_no()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsOne_No_01_00 " );	// I don't have time for this.
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	B_LogEntry( TOPIC_SARAHTOGUILD , " I think Sarah won't want to talk to me about the Luthero proposal now. " );
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpstwo_yes()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsTwo_Yes_01_00 " );	// I'll help you get this ring back.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwo_Yes_01_01 " );	// True? That would be so kind of you!
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwo_Yes_01_02 " );	// It seems that the guard who took my ring from me was called Boltan.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwo_Yes_01_03 " );	// Just be careful with him - he's still that bastard!
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	MIS_SARAHELPSTWO = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSTWO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSTWO,LOG_Running);
	B_LogEntry( TOPIC_SARAHELPSTWO , " Sarah is very upset. A guard named Dumpty took her family ring from her. Sarah loves this little thing and would like it back. " );
};


instance DIA_SARAH_SARAHELPSTWODONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpstwodone_condition;
	information = dia_sarah_sarahelpstwodone_info;
	permanent = FALSE;
	description = " I brought your ring. " ;
};


func int dia_sarah_sarahelpstwodone_condition()
{
	if((MIS_SARAHELPSTWO == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (Npc_HasItems(hero,itri_sarafamilyring) >= 1))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpstwodone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Sarah_SaraHelpsTwoDone_01_00 " );	// I brought your ring.
	B_GiveInvItems(other,self,itri_sarafamilyring,1);
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwoDone_01_03 " );	// Oh, Innos! How grateful I am to you!
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwoDone_01_04 " );	// However, I don't even have anything to thank you with...
	AI_Output(self,other, " DIA_Sarah_SaraHelpsTwoDone_01_06 " );	// But thank you anyway!
	MIS_SARAHELPSTWO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSTWO,LOG_SUCCESS);
	B_LogEntry( TOPIC_SARAHELPSTWO , " I brought Sarah her family ring. " );
	SARAHELPSTWODONE = TRUE;
	if (( MY_SARAHTOGUILD  == LOG_Running ) && ( SARAHELPSONEDONE  ==  TRUE ) && ( SARAHELPSTWODONE  ==  TRUE ) && ( SARAHELPSTHREEDONE  ==  TRUE ) && ( SARABEFRIEND  ==  FALSE )) ;
	{
		AI_Output(self,other, " DIA_Sarah_SaraHelpsTwoDone_01_07 " );	// And you know, after everything you've done for me, I think you can be trusted.
		AI_Output(self,other, " DIA_Sarah_SaraHelpsTwoDone_01_08 " );	// A scoundrel like that Kantar would never do that. And you helped me in a difficult situation!
		AI_Output(self,other, " DIA_Sarah_SaraHelpsTwoDone_01_09 " );	// You're a good person!
		SARABEFRIEND = TRUE;
		Log_AddEntry( TOPIC_SARAHTOGUILD , " Sarah seems to trust me now and thinks I'm a good person. I think it's time to talk to her about Luthero's proposal. " );
	};
};


instance DIA_SARAH_SARAHELPSTHREE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsthree_condition;
	information = dia_sarah_sarahelpsthree_info;
	permanent = FALSE;
	description = " Is there anything else I can help you with? " ;
};


func int dia_sarah_sarahelpsthree_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAREFUSEHELPS == FALSE) && (SARAPROOFBEFRIEND == TRUE) && ((SARAHELPSTWODONE == TRUE) || (SARAHELPSONEDONE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsthree_info()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsThree_01_00 " );	// Is there anything else I can help you with?
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_01_05 " );	// You see, I owe some money to Blacksmith Harad for the last batch of weapons.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_01_06 " );	// Then I just didn't have time to pay him off. And now I don’t even have a penny for my soul!
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_01_08 " );	// Of course, Harad is a good person and understands the difficulties of other people, but that doesn't make it any easier for me.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_01_09 " );	// I'm used to doing my business honestly and always paying my debts.
	AI_Output(other,self, " DIA_Sarah_SaraHelpsThree_01_10 " );	// I understand you. And what should be done?
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_01_11 " );	// Therefore, if you could pay Harad that missing amount for me - I would be very grateful to you for it!
	AI_Output(other,self, " DIA_Sarah_SaraHelpsThree_01_12 " );	// How much more do you owe Harad?
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_01_13 " );	// The amount is quite big - two thousand gold coins.
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	Info_AddChoice(dia_sarah_sarahelpsthree, " Sorry, but I can't afford it. " ,dia_sarah_sarahelpsthree_no);
	Info_AddChoice(dia_sarah_sarahelpsthree, " I'll deal with this. " ,dia_sarah_sarahelpsthree_yes);
};

func void dia_sarah_sarahelpsthree_no()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsThree_No_01_00 " );	// Sorry, but I can't afford it.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_No_01_01 " );	// I understand...
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	B_LogEntry( TOPIC_SARAHTOGUILD , " I think Sarah won't want to talk to me about the Luthero proposal now. " );
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpsthree_yes()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpsThree_Yes_01_00 " );	// I'll deal with this.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_Yes_01_01 " );	// (surprised) Are you really going to do this?
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_Yes_01_03 " );	// Bless you Innos!
	AI_Output(other,self, " DIA_Sarah_SaraHelpsThree_Yes_01_05 " );	// In the end, this was all my fault - so I'll deal with it.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThree_Yes_01_06 " );	// Okay, whatever you say. However, I still appreciate your help!
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	MIS_SARAHELPSTHREE = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSTHREE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSTHREE,LOG_Running);
	B_LogEntry( TOPIC_SARAHELPSTHREE , " Sarah owes Blacksmith Harad money. I volunteered to solve this problem... a two thousand gold piece problem. " );
};


instance DIA_SARAH_SARAHELPSTHREEDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsthreedone_condition;
	information = dia_sarah_sarahelpsthreedone_info;
	permanent = FALSE;
	description = " I paid your debt to Harad. " ;
};


func int dia_sarah_sarahelpsthreedone_condition()
{
	if((MIS_SARAHELPSTHREE == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARADOBTPAYED == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsthreedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Sarah_SaraHelpsThreeDone_01_00 " );	// I have repaid your debt to Harad.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThreeDone_01_01 " );	// Thank you! Now I can look him in the eye without shame.
	AI_Output(self,other, " DIA_Sarah_SaraHelpsThreeDone_01_02 " );	// Thank you!
	MIS_SARAHELPSTHREE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSTHREE,LOG_SUCCESS);
	B_LogEntry( TOPIC_SARAHELPSTHREE , " Sarah thanked me for giving Harad her debt. " );
	SARAHELPSTHREEDONE = TRUE;
	if (( MY_SARAHTOGUILD  == LOG_Running ) && ( SARAHELPSONEDONE  ==  TRUE ) && ( SARAHELPSTWODONE  ==  TRUE ) && ( SARAHELPSTHREEDONE  ==  TRUE ) && ( SARABEFRIEND  ==  FALSE )) ;
	{
		AI_Output(self,other, " DIA_Sarah_SaraHelpsThreeDone_01_04 " );	// And you know, after everything you've done for me, I think you can be trusted.
		AI_Output(self,other, " DIA_Sarah_SaraHelpsThreeDone_01_05 " );	// A scoundrel like that Kantar would never do that. And you helped me in a difficult situation!
		AI_Output(self,other, " DIA_Sarah_SaraHelpsThreeDone_01_06 " );	// You're a good person!
		SARABEFRIEND = TRUE;
		Log_AddEntry( TOPIC_SARAHTOGUILD , " Sarah seems to trust me now and thinks I'm a good person. I think it's time to talk to her about Luthero's proposal. " );
	};
};


instance DIA_SARAH_SARAHTOGUILD(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahtoguild_condition;
	information = dia_sarah_sarahtoguild_info;
	permanent = TRUE;
	description = " I have something to do with you. " ;
};


func int dia_sarah_sarahtoguild_condition()
{
	if (( MIS_SARAHTOGUILD  == LOG_Running ) && ( SARAHELPYOU  ==  TRUE ) && ( SARAAGREE  ==  FALSE ) && ( SARAREFUSEHELPS  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahtoguild_info()
{
	AI_Output(other,self, " DIA_Sarah_SarahToGuild_01_00 " );	// I have business with you.
	if(SARAPROOFBEFRIEND == TRUE)
	{
		if(SARABEFRIEND == TRUE)
		{
			B_GivePlayerXP(250);
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_01 " );	// And what is it?
			AI_Output(other,self, " DIA_Sarah_SarahToGuild_01_02 " );	// Do you know a merchant named Luthero?
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_03 " );	// Of course! (smiles) Who does not know him - he is one of the largest merchants of Khorinis.
			AI_Output(other,self, " DIA_Sarah_SarahToGuild_01_04 " );	// He offers you a job, namely to join the guild of merchants.
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_13 " );	// True? I agree!
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_14 " );	// Many merchants dream about this. It will really bring me back to life.
			AI_Output(other,self, " DIA_Sarah_SarahToGuild_01_15 " );	// Great. I'll pass on your words to Luthero.
			SARAAGREE = TRUE;
			B_LogEntry( TOPIC_SARAHTOGUILD , " Sarah agreed to Luthero's proposal. Now we need to go back to tell him the news. " );
			AI_StopProcessInfos(self);
		}
		else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSONEDONE == FALSE) && (SARAHELPSONEDONE == FALSE))
		{
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_28 " );	// Sorry, but I don't talk business with people I don't trust.
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_31 " );	// So you're wasting your time - I won't discuss any business with you until I start trusting you completely.
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_35 " );	// I'm sorry, but I don't quite trust you yet to discuss any business with you.
			AI_Output(other,self, " DIA_Sarah_SarahToGuild_01_36 " );	// Haven't I already proved to you that I can be trusted?
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_37 " );	// (incredulously) Well, only partly...
			if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == FALSE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_38 " );	// Of course, I thank you for bringing me some food.
			}
			else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_39 " );	// Of course, it was very nice of you to return my ring to me...
			}
			else if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_40 " );	// Of course, I thank you for bringing me some food.
				AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_41 " );	// Giving me back my ring was also very nice of you...
			}
			else if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == FALSE) && (SARAHELPSTHREEDONE == TRUE))
			{
				AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_42 " );	// Of course, I thank you for bringing me some food.
				AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_43 " );	// And the fact that you paid Harad's debt for me also certainly speaks in your favor.
			}
			else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE))
			{
				AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_44 " );	// Giving me back my ring was very nice of you...
				AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_45 " );	// And the fact that you paid Harad's debt for me also certainly speaks in your favor.
			};
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_46 " );	// However, this is not enough to start trusting you completely.
			AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_47 " );	// Don't get me wrong - I'm just afraid that you will drag me into some dirty business again.
		};
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_50 " );	// What is it?
		AI_Output(other,self, " DIA_Sarah_SarahToGuild_01_51 " );	// Do you know a merchant named Luthero?
		AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_52 " );	// Of course! (smiles) Who does not know him - he is one of the largest merchants of Khorinis.
		AI_Output(other,self, " DIA_Sarah_SarahToGuild_01_53 " );	// He offers you a job, namely to join the guild of merchants.
		AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_54 " );	// True? I agree!
		AI_Output(self,other, " DIA_Sarah_SarahToGuild_01_58 " );	// Many merchants dream about this. It will really bring me back to life.
		AI_Output(other,self, " DIA_Sarah_SarahToGuild_01_60 " );	// Great. I'll pass on your words to Luthero.
		SARAAGREE = TRUE;
		B_LogEntry( TOPIC_SARAHTOGUILD , " Sarah agreed to Luthero's proposal. Now we need to go back to tell him the news. " );
		AI_StopProcessInfos(self);
	};
};


instance DIA_SARAH_SARAHELPYOUDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpyoudone_condition;
	information = dia_sarah_sarahelpyoudone_info;
	permanent = TRUE;
	description = " How do you like the new place? " ;
};

func int dia_sarah_sarahelpyoudone_condition()
{
	if(SARAHELPYOUDONE == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpyoudone_info()
{
	AI_Output(other,self, " DIA_Sarah_SaraHelpYouDone_01_00 " );	// How do you like the new place?
	AI_Output(self,other, " DIA_Sarah_SaraHelpYouDone_01_01 " );	// Thank you for everything you've done for me!
};
