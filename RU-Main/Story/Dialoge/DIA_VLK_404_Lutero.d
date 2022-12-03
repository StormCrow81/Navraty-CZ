

instance DIA_Lutero_EXIT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 999;
	condition = DIA_Lutero_EXIT_Condition;
	information = DIA_Lutero_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if ((Luther_Krallen == LOG_Running) && (MY_Fajeth_Kill_Snapper ==  LOG_SUCCESS ) && (Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) ==  FALSE )) ;
	{
		Lutero_claws = LOG_OBSOLETE ;
	};
};


instances DIA_Lutero_Hello (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Hallo_Condition;
	information = DIA_Lutero_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_Hallo_Condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hello_Info()
{
	AI_Output(self,other, " DIA_Lutero_Hallo_13_00 " );	// My name is Luthero. I trade almost everything.
	AI_Output(other,self, " DIA_Lutero_Hallo_15_01 " );	// What products do you offer?
	AI_Output(self,other, " DIA_Lutero_Hallo_13_02 " );	// Well, mostly rare and unusual things. I am ready to satisfy even the most bizarre whims of my clients.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Luthero trades uncommon and rare items in the top quarter. " );
};


instance DIA_Luther_GetLost (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_GetLost_Condition;
	information = DIA_Lutheran_GetLost_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_GetLost_Condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW)) && Npc_IsInState(self,ZS_Talk) && (MEMBERTRADEGUILD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Luther_GetLost_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Lutero_GetLost_13_00 " );	// Get out of here! What, you have nothing to do? Then find yourself a job - only somewhere else!
	}
	else
	{
		AI_Output(self,other, " DIA_Lutero_GetLost_13_01 " );	// What do you want, novice? Shouldn't you be in a monastery?
	};
};


instance DIA_Lutero_Snapper(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Snapper_Condition;
	information = DIA_Lutero_Snapper_Info;
	permanent = FALSE;
	description = " Are you looking for something specific? " ;
};


func int DIA_Lutero_Snapper_Condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV) && (other.guild != GIL_NDM) && (other.guild != GIL_NDW) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other,self, " DIA_Lutero_Snapper_15_00 " );	// Are you looking for something specific?
	AI_Output(self,other, " DIA_Lutero_Snapper_13_01 " );	// Yes, I need snapper claws for one of my clients.
	AI_Output(self,other, " DIA_Lutero_Snapper_13_02 " );	// But not just ordinary claws. It must be something special - the claws of a very large beast that killed a lot of people, for example.
	AI_Output(other,self, " DIA_Lutero_Snapper_15_03 " );	// Where can I find snappers?
	AI_Output(self,other, " DIA_Lutero_Snapper_13_04 " );	// They are ubiquitous on this island, but most of them live in the Vale of Mines.
	AI_Output(other,self, " DIA_Lutero_Snapper_15_05 " );	// What do I get out of this?
	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Lutero_Hello_13_06 " );	// I can give you a runestone.
	}
	else
	{
		AI_Output(self,other, " DIA_Lutero_Hello_13_07 " );	// I can give you an invulnerability ring.
	};
	AI_Output(other,self, " DIA_Lutero_Hello_15_08 " );	// I'll see what I can do.
	Log_CreateTopic(TOPIC_Lutero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lutero,LOG_Running);
	B_LogEntry(TOPIC_Lutero, " Trader Luthero is looking for the claws of an unusually strong snapper. " );
	Lutero_claws = LOG_Running;
};


instance DIA_Lutero_claw (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Kralle_Condition;
	information = DIA_Lutero_Kralle_Info;
	permanent = FALSE;
	description = " I have some special snapper claws for you. " ;
};


func int DIA_Lutero_Kralle_Condition()
{
	if (( Npc_HasItems ( other , ItAt_ClawLeader ) >=  1 ) && Npc_KnowsInfo ( other , DIA_Lutero_Snapper ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Lutero_claw_Info()
{
	AI_Output(other,self, " DIA_Lutero_Kralle_15_00 " );	// I have special snapper claws for you.
	Lutero_claws = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_Lutero,LOG_SUCCESS);
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other, " DIA_Lutero_Kralle_13_01 " );	// My client will be happy to hear this.
	B_GiveInvItems(other,self,ItAt_ClawLeader,1);
	Npc_RemoveInvItems(self,ItAt_ClawLeader,1);
	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Lutero_Hello_13_02 " );	// I don't have this runestone with me. But I know where to find it.
		AI_Output(self,other, " DIA_Lutero_Hello_13_03 " );	// On the way from the city to the tavern, you will go under the bridge.
		AI_Output(self,other, " DIA_Lutero_Hello_13_04 " );	// There, in the cave, my friend hid a runestone in a chest. Here is the key.
		B_GiveInvItems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Lutero_Hello_13_05 " );	// Here's the ring, just like I promised you.
		B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	};
};


instance DIA_Lutero_Trade(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Trade_Condition;
	information = DIA_Lutero_Trade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};


func int DIA_Lutero_Trade_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Luther_Hello) ==  TRUE ) && Wld_IsTime( 8 , 0 , 23 , 59 ))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Lutero_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};


instances DIA_Lutero_PICKPOCKET (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 900;
	condition = DIA_Lutero_PICKPOCKET_Condition;
	information = DIA_Lutero_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lutero_PICKPOCKET_Condition()
{
	return  C_Robbery ( 58 , 65 );
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,Dialog_Back,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};


instance DIA_LUTERO_TALIASANLETTER (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_taliasanletter_condition;
	information = dia_lutero_taliasanletter_info;
	permanent = FALSE;
	description = " Do you have any work for me to do? " ;
};


func int dia_lutero_taliasanletter_condition()
{
	if(MIS_TALIASANHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lutero_taliasanletter_info()
{
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_00 " );	// Do you have any work for me?
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_01 " );	// Are you looking for a job?
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_02 " );	// Hmmm. Perhaps I could use the services of a man like you. Although there is a problem...
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_03 " );	// And what's your problem?
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_04 " );	// The problem is that my business is not going well right now, and I can't pay you for your work in gold.
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_05 " );	// I'm not interested in gold.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_06 " );	// (surprised) Yes? Then what do you want as payment?
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_09 " );	// I need you to write one letter. It must be addressed to Larius, head of Khorinis.
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_10 " );	// It is necessary that in it you admire the magical abilities of Gallahad and in general that he is a good person...
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_13 " );	// Hmmm. Of course, it doesn't cost me anything to write such a letter...
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_14 " );	// Good! But before I do that, you'll do one job for me.
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_15 " );	// What is it?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_16 " );	// Well, you see... This is a very specific case.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_17");	//И?
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_18 " );	// As I told you, I'm not very good with money right now... (stammered) hmm...
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_19 " );	// ...In general, in order to somehow improve my affairs, I recently had to borrow a small amount of money from one person.
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_20 " );	// Who?
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_21 " );	// At Lemar, the usurer. And, of course, as you understand, I will soon have to pay this debt to him.
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_22 " );	// And you want me to pay for you?
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_23 " );	// No, you don't need to do this.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_24 " );	// I have a better idea. Taking money from him, I wrote an IOU to Lemar.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_25 " );	// And I would very much like this piece of paper to simply disappear from him ... (excitedly) ... or for him to lose it, for example.
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_01_26 " );	// If I understand you correctly, you want me to steal this receipt of yours from him?
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_27 " );	// Hush, hush! Not so loud.

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_28 " );	// Well, you could say that... something along those lines.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_29 " );	// The main thing is that Lemar cannot prove that I owe him something.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_30 " );	// Let's do this. If you bring me this receipt, then I will write a letter of recommendation for Gallahad.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_01_31 " );	// Are you satisfied with these conditions?
	Info_ClearChoices(dia_lutero_taliasanletter);
	Info_AddChoice(dia_lutero_taliasanletter, " Sorry, but I can't do that. " ,dia_lutero_taliasanletter_no);
	Info_AddChoice(dia_lutero_taliasanletter,"Да, вполне.",dia_lutero_taliasanletter_ok);
};

func void dia_lutero_taliasanletter_no()
{
	AI_Output(other,self, " DIA_Lutero_TaliasanLetter_No_01_00 " );	// Sorry, but I can't do that.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_No_01_01 " );	// Well, that's too bad.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_No_01_02 " );	// Oh, and one more thing: I hope our conversation stays between us.
	if(MEMBERTRADEGUILD == FALSE)
	{
		AI_Output(self,other, " DIA_Lutero_TaliasanLetter_No_01_03 " );	// (annoyed) Otherwise, I'll make sure you talk less with your tongue.
		AI_Output(self,other, " DIA_Lutero_TaliasanLetter_No_01_04 " );	// Now get out! I don't have any more work for you.
	};
	AI_StopProcessInfos(self);
};

func void dia_lutero_taliasanletter_ok()
{
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_Ok_01_00");	//Да, вполне.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_Ok_01_01 " );	// That's great! Come back to me when you have my receipt.
	AI_Output(self,other, " DIA_Lutero_TaliasanLetter_Ok_01_02 " );	// In the meantime, I'll write a letter that interests... you so much.
	AI_StopProcessInfos(self);
	MIS_LUTEROHELP = LOG_Running;
	Log_CreateTopic(TOPIC_LUTEROHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_Running);
	B_LogEntry( TOPIC_LUTEROHELP , " In order to get a letter of recommendation for Gallahad from merchant Luthero, I have to get him an IOU he wrote to moneylender Lemar. " );
};


instance DIA_LUTHER_BRINGLETTER (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_bringletter_condition;
	information = dia_lutero_bringletter_info;
	permanent = FALSE;
	description = " I have your receipt. " ;
};


func int dia_lutero_bringletter_condition()
{
	if (( MY_TALIASANHELP  == LOG_Running ) && ( MY_LUTEROHELP  == LOG_Running ) && ( Npc_HasItems ( other , itwr_luteroloan ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dia_lutero_bringletter_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lutero_BringLetter_01_00 " );	// I have your receipt.
	AI_Output(self,other, " DIA_Lutero_BringLetter_01_01 " );	// (excitedly) Show it to me.
	B_GiveInvItems(other,self,itwr_luteroloan,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Lutero_BringLetter_01_02 " );	// (overjoyed) YES! That's her! You did it!
	Npc_RemoveInvItems(self,itwr_luteroloan,1);
	AI_Output(self,other, " DIA_Lutero_BringLetter_01_03 " );	// You made me a happy person!
	AI_Output(other,self, " DIA_Lutero_BringLetter_01_04 " );	// I'm happy for you. What about our deal? Where is my letter?
	AI_Output(self,other, " DIA_Lutero_BringLetter_01_05 " );	// Of course, of course. Don't worry, I already wrote it.
	AI_Output(self,other, " DIA_Lutero_BringLetter_01_06 " );	// Here it is. I think you'll like it.
	B_GiveInvItems(self,other,itwr_luteroletter,1);
	AI_Output(other,self, " DIA_Lutero_BringLetter_01_07 " );	// Great. The main thing is that it should be liked not by me, but by Gallahad...
	AI_Output(self,other, " DIA_Lutero_BringLetter_01_08 " );	// I have no doubt that he will be pleased with it.
	AI_Output(self,other, " DIA_Lutero_BringLetter_01_09 " );	// Well, now excuse me - I have other things to do.
	Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_SUCCESS);
	B_LogEntry( TOPIC_LUTEROHELP , " I brought Luther his IOU. In return, he gave me a letter of recommendation for Gallahad. " );
	MIS_LUTEROHELP = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_LUTERO_NIGELLETTER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_nigelletter_condition;
	information = dia_lutero_nigelletter_info;
	permanent = FALSE;
	description = " I have a letter for you. " ;
};


func int dia_lutero_nigelletter_condition()
{
	if((Npc_HasItems(other,itwr_nigelletter) >= 1) || (Npc_HasItems(other,itwr_erolletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_nigelletter_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Lutero_NigelLetter_01_00 " );	// I have a letter for you.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_01_01 " );	// What is the letter?
	if(Npc_HasItems(other,itwr_nigelletter) >= 1)
	{
		AI_Output(other,self, " DIA_Lutero_NigelLetter_01_02 " );	// From merchant Nigel. You seem to know him.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_03 " );	// (surprised) From old Nigel?
		AI_Output(other,self, " DIA_Lutero_NigelLetter_01_04 " );	// Here, take this.
		B_GiveInvItems(other,self,itwr_nigelletter,1);
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_05 " );	// (thoughtfully) Very interesting.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_06 " );	// In this letter, he speaks very well of your person and vouches for you as a reliable person.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_07 " );	// And one more thing... (very surprised) Asks me to help you join our merchants guild!
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_08 " );	// Hmmm, yes. It's very brave of him to make such a request to me.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_09 " );	// I wonder what did YOU do for him that made him plead for you?
		AI_Output(other,self, " DIA_Lutero_NigelLetter_01_10 " );	// Like he said himself, I saved his reputation.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_11 " );	// Now I more or less understand the reason for his kindness... (laughs)
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_12 " );	// For us merchants, reputation is one of the most important things.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_14 " );	// If you have a bad reputation, no one will ever do business with you.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_15 " );	// Oh, oh well. So Nigel vouches for you and asks me to accept you into our guild... (thoughtfully)
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_16 " );	// Well, I don't see any reason why I should refuse Nigel.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_17 " );	// But the decision is up to you anyway.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_18 " );	// What do you say? Do you want to try your hand at trading?
	}
	else
	{
		AI_Output(other,self, " DIA_Lutero_NigelLetter_01_19 " );	// From Merchant Erol. You seem to know him.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_20 " );	// (surprised) From old Erol? Show me this letter.
		AI_Output(other,self, " DIA_Lutero_NigelLetter_01_21 " );	// Here, take this.
		B_GiveInvItems(other,self,itwr_erolletter,1);
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_22 " );	// (thoughtfully) Very interesting.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_23 " );	// In this letter, he speaks very well of your person and vouches for you as a reliable person.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_24 " );	// And one more thing... (very surprised) Asks me to help you join our merchants guild!
		Npc_RemoveInvItems(self,itwr_erolletter,1);
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_25 " );	// Hmmm, yes. It's very brave of him to make such a request to me.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_26 " );	// I wonder what you did for him that made him flirt for you?
		AI_Output(other,self, " DIA_Lutero_NigelLetter_01_27 " );	// Like he said himself, I saved his reputation.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_28 " );	// Now I more or less understand the reason for his kindness... (laughs)
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_29 " );	// For us merchants, reputation is one of the most important things.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_31 " );	// If you have a bad reputation, no one will ever do business with you.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_32 " );	// Oh, oh well. So Erol vouches for you and asks me to accept you into our guild... (thoughtfully)
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_33 " );	// Well, I don't see any reason why I should refuse him.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_34 " );	// But the decision is up to you anyway.
		AI_Output(self,other, " DIA_Lutero_NigelLetter_01_35 " );	// What do you say? Do you want to try your hand at trading?
	};
	Info_ClearChoices(dia_lutero_nigelletter);
	Info_AddChoice(dia_lutero_nigelletter, " I don't think I would be interested. " ,dia_lutero_nigelletter_no);
	Info_AddChoice(dia_lutero_nigelletter, " Why not. " ,dia_lutero_nigelletter_yes);
};

func void dia_lutero_nigelletter_no()
{
	AI_Output(other,self, " DIA_Lutero_NigelLetter_No_01_00 " );	// I don't think I'll be interested.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_No_01_01 " );	// (disappointed) Hmmm. Well, it's up to you, of course.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_No_01_02 " );	// Though I think you're making a big mistake by refusing this feature.
	Info_ClearChoices(dia_lutero_nigelletter);
};

func void dia_lutero_nigelletter_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Lutero_NigelLetter_Yes_01_00 " );	// Why not.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_01 " );	// Good. Then, welcome to the merchants guild!
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_02 " );	// Now you're one of us, congratulations!
	AI_Output(other,self, " DIA_Lutero_NigelLetter_Yes_01_03 " );	// Thank you. And now what?
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_04 " );	// Now let's talk about your duties in the guild.
	AI_Output(other,self, " DIA_Lutero_NigelLetter_Yes_01_05 " );	// What will be my responsibilities?
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_07 " );	// Understand, being in our guild is not just about being one of us. This status also imposes some responsibility on you.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_09 " );	// True, nothing supernatural is required of you.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_10 " );	// Just occasionally, from time to time, I will give you some instructions.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_11 " );	// And just now I have one for you.
	AI_Output(other,self, " DIA_Lutero_NigelLetter_Yes_01_12 " );	// And what should be done?
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_13 " );	// You need to take a new order to Bengar's farm and pick up the last batch of goods from him.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_14 " );	// Here, take this letter. Everything is written here.
	B_GiveInvItems(self,other,itwr_bengarorderletter,1);
	AI_Output(other,self, " DIA_Lutero_NigelLetter_Yes_01_15 " );	// Does Bengar know about this?
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_16 " );	// Yes, he is in the know and will be waiting for you.
	AI_Output(other,self, " DIA_Lutero_NigelLetter_Yes_01_17 " );	// What should I do with him when I take the goods from him? Bring it to you?
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_18 " );	// No. I do not do that.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_19 " );	// Take it to trader Jora. He will take care of everything else.
	AI_Output(other,self, " DIA_Lutero_NigelLetter_Yes_01_20 " );	// Jore? Merchant?
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_21 " );	// Yes. You will find him in the market square at the east gate.
	AI_Output(self,other, " DIA_Lutero_NigelLetter_Yes_01_24 " );	// When you complete this task, return to me. We will have something to discuss with you.
	Info_ClearChoices(dia_lutero_nigelletter);
	MEMBERTRADEGUILD = TRUE;
	MIS_TRADEGUILD = LOG_Running;
	Log_CreateTopic(TOPIC_TRADEGUILD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_Running);
	B_LogEntry( TOPIC_TRADEGUILD , " Trader Luthero has accepted me into the guild. " );
	MIS_BENGARORDER = LOG_Running;
	Log_CreateTopic(TOPIC_BENGARORDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARORDER,LOG_Running);
	Log_AddEntry( TOPIC_BENGARORDER , " Luthero has given me an assignment: I must take a letter with a new food order to Farmer Bengar and at the same time take the last batch of goods from him. After that, it will need to be delivered to Jora, a merchant in the market place. " );
};


instance DIA_LUTERO_BENGARPACKETOPEN (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_bengarpacketopen_condition;
	information = dia_lutero_bengarpacketopen_info;
	permanent = FALSE;
	description = " I have a problem here. " ;
};


func int dia_lutero_bengarpacketopen_condition()
{
	if(BENGARPACKETOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_lutero_bengarpacketopen_info()
{
	AI_Output(other,self, " DIA_Lutero_BengarPacketOpen_01_00 " );	// I have a problem here.
	AI_Output(self,other, " DIA_Lutero_BengarPacketOpen_01_01 " );	// What happened?
	AI_Output(other,self, " DIA_Lutero_BengarPacketOpen_01_02 " );	// Well... I couldn't deliver the goods to Trader Jora.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_03");	//Но почему?
	AI_Output(other,self, " DIA_Lutero_BengarPacketOpen_01_04 " );	// I lost Bengar's package.
	AI_Output(self,other, " DIA_Lutero_BengarPacketOpen_01_05 " );	// How did you manage to do this? (angrily) Damn!
	AI_Output(other,self, " DIA_Lutero_BengarPacketOpen_01_06 " );	// So it happened.
	AI_Output(self,other, " DIA_Lutero_BengarPacketOpen_01_07 " );	// You shouldn't have been assigned this task. (angrily) You let me down, and disappointed me even more!
	AI_Output(other,self, " DIA_Lutero_BengarPacketOpen_01_08 " );	// I'm sorry...
	AI_Output(self,other, " DIA_Lutero_BengarPacketOpen_01_09 " );	// I don't need your apologies! And in general, now you can forget about everything that I promised you!
	AI_Output(other,self, " DIA_Lutero_BengarPacketOpen_01_10 " );	// So how?! Are you saying I'm no longer in the guild?
	AI_Output(self,other, " DIA_Lutero_BengarPacketOpen_01_11 " );	// Yes. People like you have no place among us! Leave!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_12");	//Но я...
	AI_Output(self,other, " DIA_Lutero_BengarPacketOpen_01_13 " );	// (interrupting) Get out! And don't you dare contact me!
	AI_StopProcessInfos(self);
	MIS_TRADEGUILD = LOG_FAILED;
	LUTEROPISSOFF = TRUE;
	MEMBERTRADEGUILD = FALSE;
	B_LogEntry_Failed(TOPIC_TRADEGUILD);
};


instance DIA_LUTERO_FUCKOFF(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_fuckoff_condition;
	information = dia_lutero_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lutero_fuckoff_condition()
{
	if((LUTEROPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lutero_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_LUTHER_HELP (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_jorahelp_condition;
	information = dia_lutheran_jorahelp_info;
	permanent = FALSE;
	description = " Do you have any more errands for me? " ;
};


func int dia_lutero_jorahelp_condition()
{
	if((MIS_CHURCHDEAL == LOG_SUCCESS) || (MIS_CHURCHDEAL == LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_luther_jorahelp_info()
{
	AI_Output(other,self, " DIA_Lutero_JoraHelp_01_00 " );	// Do you have any more errands for me?
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_01 " );	// Jora is having trouble with the trader Zuris.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_02 " );	// He's not in our guild, but that doesn't mean his opinion can't be ignored.
	AI_Output(other,self, " DIA_Lutero_JoraHelp_01_03 " );	// I know Zuris. Apparently, he is quite an influential merchant in this city. What exactly was the problem?
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_04 " );	// You see, the place where Jora trades belongs to Zuris. He just rents it to Jora for a certain monthly fee.
	AI_Output(other,self, " DIA_Lutero_JoraHelp_01_05 " );	// And what's wrong with that?
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_06 " );	// Zuris recently turned down Jora's lease renewal, saying he had a better offer from another merchant.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_07 " );	// This place is profitable enough, and losing it is not in our interests.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_08 " );	// Therefore, I ask you to look into this issue and try to resolve it as soon as possible.
	AI_Output(other,self, " DIA_Lutero_JoraHelp_01_09 " );	// Why me?
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_10 " );	// Because Zuris doesn't know you're in our guild yet. Otherwise he wouldn't even listen to you.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_11 " );	// He hasn't been on very good terms with us lately. And that's putting it mildly.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_12");	//Почему?
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_13 " );	// The reason was some of my disagreements with Zuris, after which he seems to have a grudge against us.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_14 " );	// So I really don't want Zuris to think that the guild is extremely interested in solving this problem.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_15 " );	// Because, having learned about this, he can play on our needs and, of course, not in our favor.
	AI_Output(other,self, " DIA_Lutero_JoraHelp_01_16 " );	// Good. But how should I do it?
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_17 " );	// Well... (thoughtfully) I don't even know what to advise you.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_18 " );	// Try just talking to him first. Perhaps you will be able to find some strings that you can later pull.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_19 " );	// (sarcastically) You know what I mean?
	AI_Output(other,self, " DIA_Lutero_JoraHelp_01_20 " );	// Hmmm... And you think this will help?
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_21 " );	// Possibly. At the very least, it will give us an idea of ​​how to proceed in this situation.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_22 " );	// You can also try to interest him in something.
	AI_Output(other,self, " DIA_Lutero_JoraHelp_01_25 " );	// Okay. I'll try to come up with something.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_26 " );	// That's it! And I ask you, if you manage to find out something on this case, be sure to let me know. Be sure to keep me posted.
	AI_Output(self,other, " DIA_Lutero_JoraHelp_01_28 " );	// I hope everything works out for you.
	MIS_JORAHELP = LOG_Running;
	Log_CreateTopic(TOPIC_JORAHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORAHELP,LOG_Running);
	B_LogEntry(TOPIC_JORAHELP,"Luthero gave me another assignment - now I will have to help Jora keep his place in the marketplace. Zuris, the potion merchant, did not want to extend the lease for Jora, explaining that he found a more profitable way to use it. Luthero "Like the rest of the merchants guild, this turn of affairs is of course not satisfactory. Therefore, I need to somehow solve this problem. First, I should talk to Zuris himself on this issue. Luthero warned me that it is extremely important not to put Zuris in notoriety that I am acting on behalf of the guild.");
};


instance DIA_LUTERO_JORAHELPDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_jorahelpdo_condition;
	information = dia_lutheran_jorahelpdo_info;
	permanent = TRUE;
	description = " Regarding Jora's rent... " ;
};


func int dia_lutero_jorahelpdo_condition()
{
	if(MIS_JORAHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lutero_jorahelpdo_info()
{
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_00 " );	// About renting Jora's seat...
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_01 " );	// Yes? Do you have any news?
	if((ZURISPISSOFF == TRUE) || (ZURISFUCKOFF == TRUE))
	{
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_02 " );	// I'm afraid I have bad news.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_03 " );	// WHAT?! What exactly?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_04 " );	// I failed to convince Zuris to change his mind about the place in the square.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_05 " );	// (besides himself) But why?!
		if(ZURISPISSOFF == TRUE)
		{
			AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_08 " );	// I don't know myself, but now Zuris won't even listen to me if I decide to discuss this topic with him again.
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_09 " );	// Damn! How could this happen?!
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_10 " );	// Apparently, you blurted out something awkward, if Zuris reacted in this way.
		}
		else
		{
			AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_11 " );	// I accidentally let him know that I work for you.
			AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_12 " );	// After that, he didn't even listen to me!
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_13 " );	// Damn it! I warned you to keep your mouth shut about me.
			AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_14 " );	// He somehow guessed everything himself.
		};
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_15 " );	// Eh. Okay, now what to talk about it. What's done is done - you can't turn it back ... (with annoyance)
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_16 " );	// Now Jora will have to look for a new job, and the guild has lost a profitable job because of you.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_17 " );	// I'm sorry.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_18 " );	// (laughs) He is, you see, very sorry! (angrily) You have to think with your head before you open your mouth!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_19 " );	// I shouldn't have sent you to Zuris... (with annoyance) Although we didn't really have a choice.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_20 " );	// Okay, let's forget about it. There are more important things to do.
		MIS_JORAHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_JORAHELP);

		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};
	}
	else if((ZURISTRADEPLACEYES == TRUE) && (ZURISTRADEPLACEMEOK == FALSE) && (ZURISTRADEPLACEYESINFO == FALSE))
	{
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_21 " );	// Yes, but I don't know if you'll like them.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_22 " );	// (excitedly) What's the matter?!
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_23 " );	// Zuris was not very accommodating in this matter.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_24 " );	// I accidentally let him know that I work for you.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_25 " );	// Damn it! I warned you to keep your mouth shut about me.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_26 " );	// He somehow guessed everything himself.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_29 " );	// And the only thing that came to my mind at that moment was to offer him to sell me Jora's place.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_30 " );	// Sell? (surprised) As far as I know, Zuris would never make such a deal.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_31 " );	// Oddly enough, he agreed.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_32 " );	// However, at the same time, he set rather tough conditions - for this place he wants to receive no less than ten thousand gold!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_33 " );	// WHAT?! (almost choked) TEN THOUSAND?! Yes, he's crazy!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_34 " );	// (nervously) And what, you agreed to these terms?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_35 " );	// And what I had to do - I had no choice.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_36 " );	// Crazy! Yes, this is a fortune - even I do not have that kind of money!
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_37 " );	// In any case, there is no other option. So if we want to keep Jora's place, we'll have to fork out.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_38 " );	// M-yes... (recovering) Just no words - great news! It's better to just not imagine.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_39 " );	// I don't get it, can't the guilds afford this deal?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_40 " );	// The guild is unable to pay him that amount.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_45 " );	// Plus, even with all the perks and perks of Jora's place, it's not worth the money.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_46 " );	// At best, her max price is half of what you agreed to...(angrily)
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_47 " );	// And what do we do now?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_49 " );	// The maximum that the guild can allocate for this deal is two and a half thousand gold.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_51 " );	// And the rest, my friend, you have to pay for yourself!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_52 " );	// In the end, it's you who are the genius of negotiations and conclusion of such lucrative deals... (sarcastically)
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_55 " );	// No one pulled you by the tongue - he made the decision himself, and you yourself answer for it.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_57 " );	// And, of course, I really hope that you still manage to resolve this issue.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_58 " );	// Because if you fail us again and the deal doesn't go through, then...
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_60 " );	// ...then Zuris will trumpet it throughout the city.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_62 " );	// And this will tarnish our reputation as honest traders who keep their word in the eyes of the people!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_63 " );	// People will stop trusting us - including me! And for a trader, as you understand, the reputation and trust of people is everything!!!
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_64 " );	// And you think Zuris would do that?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_65 " );	// Knowing Zuris and his attitude towards us - I think so. So try not to mess things up this time - by the way, your place in the guild also depends on this.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_66 " );	// So it's in your best interest to solve this problem too!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_67 " );	// And now enough empty talk - do not waste time and start looking for money. How you get them - I'm not interested!
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_68 " );	// What about the promised money from the guild?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_69 " );	// First, get your share, and then we'll talk about the guild's share in this matter.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_70 " );	// Good. I will try to do my best.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_71 " );	// (sarcastically) I hope so.
		ZURISTRADEPLACEYESINFO = TRUE;
		; _ _ _ _ _ _
	}
	else if((ZURISTRADEPLACEYESCHIP == TRUE) && (ZURISTRADEPLACEMEOK == FALSE) && (ZURISTRADEPLACEYESCHIPINFO == FALSE))
	{
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_72 " );	// Yes, but I don't know if you'll like them.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_73 " );	// (excitedly) What's the matter?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_74 " );	// Zuris was not very accommodating in this matter.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_75 " );	// And the only thing that came to my mind at that moment was to offer him to sell me Jora's place.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_76 " );	// Sell? (surprised) Hmmm, interesting idea. Tell me, did Zuris understand that you are a member of our guild?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_77 " );	// Doesn't seem to.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_78 " );	// This is very good! Then, if you think about it... (thoughtfully) Because Zuris doesn't know that you work for me.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_79 " );	// So, without any suspicion on his part, you could be quite interested in this alignment of affairs with Jora's place.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_80 " );	// And most importantly - your proposal looks quite natural.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_83 " );	// And what did Zuris say about this?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_84 " );	// At first he hesitated a little, but then he nevertheless set his own conditions for this transaction.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_85 " );	// And what are they?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_86 " );	// He wants five thousand gold coins for Jora's place.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_87 " );	// Five thousand?! Hmmm... The amount, of course, is considerable, but in this case, I think, one should not count on less.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_88 " );	// And now what?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_89 " );	// Now... (thinking) Now you need to get the money - that's all.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_90 " );	// For its part, the guild is ready to allocate two and a half thousand gold for this cause.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_91 " );	// This is exactly half of what Zuris wants.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_92 " );	// What about the rest?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_93 " );	// And you will have to get the rest of the money somehow yourself.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_104 " );	// Hmmm... Well, okay. What about the promised money from the guild?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_105 " );	// First, get your share, and then we'll talk about the guild's share in this matter.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_106 " );	// Good. I will try to do my best.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_107 " );	// (sarcastically) I hope so.
		ZURISTRADEPLACEYESCHIPINFO = TRUE;
		B_LogEntry( TOPIC_JORAHELP , " Luthero was quite pleased that I was able to negotiate with Zuris to buy Jora's place - and on quite favorable terms for the guild. He said that the guild was ready to allocate two and a half thousand gold for this business. I need the rest of the money get it yourself. " );
	}
	else if((ZURISISDEAD == TRUE) && (Npc_HasItems(other,itwr_zurisdocs) >= 1))
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_108 " );	// Yes, but I don't know if you'll like them.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_109 " );	// (excitedly) What's the matter?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_110 " );	// I failed to convince Zuris to change his mind about Jora.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_111 " );	// So I took some action and fixed this problem in a different way.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_112 " );	// That is? What you're suggesting?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_113 " );	// I just killed him.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_117 " );	// Oh, Innos! Are you crazy?!
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_118 " );	// What should I do? I had no choice.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_119 " );	// (voice trembling) Was it really necessary?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_121 " );	// In his pocket, I found these documents. I think you'll be interested in seeing them.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_122 " );	// (voice trembling) What other documents?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_123 " );	// Here, see for yourself.
		B_GiveInvItems(other,self,itwr_zurisdocs,1);
		Npc_RemoveInvItems(self,itwr_zurisdocs,1);
		B_UseFakeScroll();
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_125 " );	// Well, what do you say?
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_130 " );	// Hmmm...(thoughtfully) That doesn't justify killing you though!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_131 " );	// You must understand that we are merchants, not a bunch of killers!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_132 " );	// Your actions cast a shadow over our entire guild!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_133 " );	// Not to mention the fact that all of us are not shown in the best light.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_134 " );	// I was just trying to solve this problem. That's all.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_135 " );	// But not at the same cost!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_137 " );	// Bear in mind for the future that it's no longer worth solving our problems with this kind of action.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_138 " );	// Otherwise, you may think that you are no longer a member of the guild!
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_139 " );	// This won't happen again.
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry( TOPIC_JORAHELP , " Luthero was extremely indignant that I killed Zuris. However, he cooled off a little when I showed him the documents on the ownership of the trading place on the square, where Jora still trades now. And, in the end, he agreed, that the problem is solved - and the rest is no longer important. However, Luthero warned me that in the future such actions could entail my expulsion from the guild. " );
	}
	else if((ZURISGIVEMETASKOK == FALSE) && (ZURISGIVEMETASK == TRUE) && (ZURISGIVEMETASKINFO == FALSE))
	{
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_143 " );	// Zuris told me about your old conflict with him.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_144 " );	// He seems to think you owe him something.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_145 " );	// (surprised) Must? What are you talking about?!
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_146 " );	// It was then about the potion known as Eligor's Flame.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_147 " );	// According to Zuris, you had a contract to get him this elixir.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_148 " );	// Ah...(thoughtfully) I think I'm beginning to understand what you're talking about.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_149 " );	// But then you violated the terms of this agreement, outplaying them in your favor.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_150 " );	// And I think this is the reason why the guild is having such problems now.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_151 " );	// Hmmm... (thoughtfully) And I see, you did a great job of getting Zuris to talk, if he decided to mention it...
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_152 " );	// Although things were a little different back then.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_153 " );	// And how exactly?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_154 " );	// Trust me, I would never change the terms of this deal.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_155 " );	// For me, the concept of the honor of a merchant is not the last words in this life!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_156 " );	// But I was forced to do this by some circumstances and, apparently, of which Zuris is not even aware of it.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_157 " );	// Tell me more about this.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_158 " );	// The fact is that I was just robbed then.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_159 " );	// Zuris seems to have mentioned this in our conversation.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_160 " );	// But he said that this happened after you broke your contract - by raising the price of this potion several times!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_161 " );	// He's wrong - it was just the opposite!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_163 " );	// Having robbed me, those thieves took with them the elixir that I promised Zuris.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_165 " );	// And I had nothing to sell.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_167 " );	// I asked the city guards to help me track down these thieves.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_168 " );	// But, unfortunately, their search was unsuccessful.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_169 " );	// So I had no choice but to try and find a way to get this elixir back.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_170 " );	// Did you succeed?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_171 " );	// Partially yes. I was able to figure out who might be behind this robbery.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_172 " );	// In the end, through my trusted people, I got on the trail of these thieves and offered them to buy this elixir from them.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_173 " );	// But they, apparently, realizing how valuable this elixir is to me, assigned such an amount for it that I simply was not able to pay for it.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_174 " );	// In the end, I had no choice but to go to Zuris and offer him these conditions for returning the elixir.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_175 " );	// I tried to explain to him then that there is no other way to solve this problem.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_176 " );	// And how did it all end?
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_177 " );	// Zuris was beside himself with the fact that the deal fell through.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_178 " );	// And he didn't want to listen to me - he just put me out the door.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_179 " );	// And since then, as you can see, we have not been on very good terms with him.
		Info_ClearChoices(dia_lutero_jorahelpdo);
		Info_AddChoice(dia_lutero_jorahelpdo, " I think you should try talking to Zuris again... " ,dia_lutero_jorahelpdo_yes);
		Info_AddChoice(dia_lutero_jorahelpdo, " I think it's Zuris' fault. " ,dia_lutero_jorahelpdo_no);
	}
	else if((ZURISGIVEMETASKOK == TRUE) && (ZURISGIVEMETASK == TRUE))
	{
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_180 " );	// Of course.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_181 " );	// Then tell me - don't delay.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_182 " );	// I got Zuris the elixir he asked for.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_183 " );	// So did you succeed? (surprised) Unbelievable!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_185 " );	// Yes, boy - you never cease to amaze me!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_187 " );	// What about Jora's place?
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_188 " );	// Zuris will extend his lease and even slightly lower the price for the service he provides.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_189 " );	// Great job! I knew you could handle this problem!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_192 " );	// Please accept my thanks from me and the entire guild.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_193 " );	// And, of course, this small amount of gold, which is due for your success.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		if(ZURISGIVEMETASKOKBONUS == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_194 " );	// Thank you. Can I ask you one more question?
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_195 " );	// Of course, ask.
			AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_196 " );	// Zuris told me that after our conversation with you, you came to him.
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_197 " );	// Well, yes... (sarcastically) I decided to take your advice and pay him a visit.
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_199 " );	// Although at first I doubted that Zuris would listen to me.
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_200 " );	// But everything went very well.
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_203 " );	// Now we're going to start a little business together that promises a pretty good income.
			AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_208 " );	// Here, take this ring as my thanks.
			B_GiveInvItems(self,other,ItRi_Prot_Total_02,1);
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_210");	//Спасибо.
		}
		else
		{
			B_GivePlayerXP(300);
			AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_212 " );	// Thank you very much.
		};
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry( TOPIC_JORAHELP , " Luthero was delighted to hear that I was able to get the elixir for Zuris and thus fix the problem with Jora. " );
		TRADEGUILDREP = TRADEGUILDREP + 1;
	}
	else if((ZURISTRADEPLACEMEOK == TRUE) && (Npc_HasItems(other,itwr_zurisdocs) >= 1))
	{
		if(ZURISTRADEPLACEYES == TRUE)
		{
			B_GivePlayerXP(250);
		}
		else if(ZURISTRADEPLACEYESCHIP == TRUE)
		{
			B_GivePlayerXP(150);
		};
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_214");	//Да, есть.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_215 " );	// Then tell me - don't delay.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_216 " );	// I gave Zuris the amount we agreed on.
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_217 " );	// And he gave me these documents to prove the ownership of Jora's trading place.
		B_GiveInvItems(other,self,itwr_zurisdocs,1);
		Npc_RemoveInvItems(self,itwr_zurisdocs,1);
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_222 " );	// Not bad at all!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_223 " );	// Apparently, it remains only to enter the name of the new owner in these documents - and the issue can be considered closed.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_224 " );	// Although, of course, I expected to do this without such a large investment ...
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_225 " );	// I don't think it would have happened any other way.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_226 " );	// Oh well, enough of that!
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_227 " );	// The main thing is that now Jora's place belongs to the guild and there is no more reason to worry.
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry( TOPIC_JORAHELP , " I have given Luthero the guild's right to take Jora's place. This matter is now closed. " );
		TRADEGUILDREP = TRADEGUILDREP + 1;
	}
	else
	{
		AI_Output(other,self, " DIA_Lutero_JoraHelpDo_01_229 " );	// No, nothing new yet.
		AI_Output(self,other, " DIA_Lutero_JoraHelpDo_01_230 " );	// Sorry. When you find out something, let me know.
	};
};

func void dia_lutero_jorahelpdo_yes()
{
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_Yes_01_00 " );	// I think you should try talking to Zuris about this again...
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_Yes_01_01 " );	// (surprised) What am I going to tell him?
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_Yes_01_02 " );	// Just tell him the truth! Perhaps this will help you build a good relationship.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_Yes_01_03 " );	// Hmmm...(thoughtfully) Of course, I've already thought about it.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_Yes_01_07 " );	// And you think this will solve Jora's rent problem?
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_Yes_01_09 " );	// I have already agreed with Zuris about solving this problem.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_Yes_01_10 " );	// True? Hmmm, not bad. And on what terms?
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_Yes_01_11 " );	// If I get him that elixir, he'll reconsider his decision about Jora.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_Yes_01_16 " );	// Hmmm... So Zuris still wants to get Eligor's Flame.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_Yes_01_17 " );	// He knows what he's asking.
	LUTEROAGREEMEETZURIS = TRUE;
	Info_ClearChoices(dia_lutero_jorahelpdo);
	Info_AddChoice(dia_lutero_jorahelpdo, " I was just about to ask you about this. " ,dia_lutero_jorahelpdo_eleksirinfo);
};

func void dia_lutero_jorahelpdo_no()
{
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_No_01_00 " );	// It seems to me that Zuris is to blame.
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_No_01_01 " );	// If he knew how to listen to people, I think everything would be fine now.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_No_01_02 " );	// Well, yes, you're probably right.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_No_01_03 " );	// Hmmm...(thoughtfully) Although I've been thinking about trying to talk to him again lately.
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_No_01_05 " );	// I have already agreed with Zuris about solving this problem.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_No_01_06 " );	// True? Hmmm, not bad. And on what terms?
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_No_01_08 " );	// If I get him that elixir, he'll reconsider his decision about Jora.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_No_01_09 " );	// Hmmm... So Zuris still wants to get Eligor's Flame.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_No_01_10 " );	// He knows what he's asking.
	Info_ClearChoices(dia_lutero_jorahelpdo);
	Info_AddChoice(dia_lutero_jorahelpdo, " I was just about to ask you about the elixir. " ,dia_lutero_jorahelpdo_eleksirinfo);
};

func void dia_luthero_jorahelpdo_electrinfo()
{
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_00 " );	// I was just about to ask you about the elixir.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_03 " );	// I told you I was robbed!
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_04 " );	// But you've probably made some other attempts to get this potion back, haven't you?
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_05 " );	// As for the elixir, after I refused the conditions that those bandits put forward to me...
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_06 " );	// ...his trail has sunk into obscurity along with them.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_07 " );	// However, there is one point in this matter that might help you.
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_08 " );	// Which one?
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_09 " );	// I've heard rumors that the city guards caught a guy back then who was stealing here in the city.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_10 " );	// Looks like he knew something about my house being robbed. The truth is to find out what exactly - I really did not have time.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_12 " );	// After a couple of days, he was sent behind the barrier to the Valley of Mines.
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_14 " );	// What was that guy's name?
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_15 " );	// Either Grimes or Grim - I don't remember exactly.
	AI_Output(other,self, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_16 " );	// I see... (the name seems familiar)
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_18 " );	// I don't think you'll be able to find it - although you can certainly try.
	AI_Output(self,other, " DIA_Lutero_JoraHelpDo_EleksirInfo_01_24 " );	// In any case, good luck to you.
	B_LogEntry( TOPIC_JORAHELP , " Luthero had little to say about the fate of the elixir stolen from him, but remembered a small detail that might help me find it. A man named either Grimes or Grim knew some interesting details about this theft. However, his sent to the Valley of Mines for theft a very long time ago, and nothing is known about his fate. In any case, this is the only thread leading to the lost Eligor's Flame elixir. " );
	ZURISGIVEMETASKINFO = TRUE;
};


instance DIA_LUTHER_JOURNAL_HELPGIVEGOLD (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_jorahelpgivegold_condition;
	information = dia_lutero_jorahelpgivegold_info;
	permanent = TRUE;
	description = " About the guild money... " ;
};


func int dia_lutero_jorahelpgivegold_condition()
{
	if((MIS_JORAHELP == LOG_Running) && (ZURISTRADEPLACEMEOK == FALSE) && (LUTEROJORAHELPGIVEGOLD == FALSE) && ((ZURISTRADEPLACEYESINFO == TRUE) || (ZURISTRADEPLACEYESCHIPINFO == TRUE)))
	{
		return TRUE;
	};
};

func void dia_luther_jorahelpgivegold_info()
{
	AI_Output(other,self, " DIA_Lutero_JoraHelpGiveGold_01_00 " );	// About guild money...
	AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_01 " );	// (surprised) What money?
	AI_Output(other,self, " DIA_Lutero_JoraHelpGiveGold_01_02 " );	// Money for a deal with Zuris!
	AI_Output(other,self, " DIA_Lutero_JoraHelpGiveGold_01_03 " );	// I think you said that the guild is willing to share a portion of the amount that Zuris demanded for Jora's place.
	AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_04 " );	// Ah! You're talking about this ... (thoughtfully) I told you that first get your part, and then we'll talk.
	AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_05 " );	// Do you have this money?
	if((ZURISTRADEPLACEYESINFO == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 7500))
	{
		AI_Output(other,self, " DIA_Lutero_JoraHelpGiveGold_01_09 " );	// Here, look - there are exactly seven and a half thousand.
		AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_12 " );	// Hmmm... (thoughtfully) Good. You persuaded me.
		AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_13 " );	// Hold this wallet. There are exactly two and a half thousand gold coins.
		B_GiveInvItems(self,other,itse_lutterobigpocket,1);
		AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_16 " );	// And I hope you can solve this problem.
		LUTEROJORAHELPGIVEGOLD = TRUE ;
	}
	else if((ZURISTRADEPLACEYESCHIPINFO == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2500))
	{
		AI_Output(other,self, " DIA_Lutero_JoraHelpGiveGold_01_20 " );	// Here, look - there are exactly two and a half thousand.
		AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_23 " );	// Hmmm... (thoughtfully) Good. You persuaded me.
		AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_24 " );	// Hold this wallet. There is exactly the same amount as you have in your hands! ... (reluctantly holding out)
		B_GiveInvItems(self,other,itse_lutterobigpocket,1);
		AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_27 " );	// And I hope you can solve this problem.
		LUTEROJORAHELPGIVEGOLD = TRUE ;
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_28");	//Пока нет.
		AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_29 " );	// (annoyed) Then why are you wasting my time?
		AI_Output(self,other, " DIA_Lutero_JoraHelpGiveGold_01_32 " );	// Come when you have them, then we'll talk.
	};
};


instance DIA_LUTERO_CHURCHDEAL(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_churchdeal_condition;
	information = dia_lutero_churchdeal_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_churchdeal_condition()
{
	if((MEMBERTRADEGUILD == TRUE) && (JORATAKEPACK == TRUE))
	{
		return TRUE;
	};
};

func void dia_lutero_churchdeal_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_00 " );	// It's good that you came! I was waiting for you.
	AI_Output(other,self, " DIA_Lutero_ChurchDeal_01_01 " );	// I gave the package to Jora.
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_02 " );	// Yes, I know. I think that I knowingly entrusted you with this assignment.
	TRADEGUILDREP = TRADEGUILDREP + 1;
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_04 " );	// And I have one more task for you.
	AI_Output(other,self, " DIA_Lutero_ChurchDeal_01_10 " );	// What should be done?
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_11 " );	// All you have to do is pick up a shipment of wine from the monastery from Master Gorax and deliver it to me. I'll take care of the rest myself.
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_12 " );	// True, there may be some complications in this case.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_13");	//Какие?
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_14 " );	// I don't have a clear agreement with Gorax about the cost of this batch of wine.
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_15 " );	// So you'll have to negotiate with him yourself.
	AI_Output(other,self, " DIA_Lutero_ChurchDeal_01_16 " );	// Does that mean I'll have to bargain with him?
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_17 " );	// It's up to you. You can accept his terms or you can try to beat better terms out of him.
	AI_Output(other,self, " DIA_Lutero_ChurchDeal_01_18 " );	// And what will I get from this deal?
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_19 " );	// Your reward will depend on how cheaply you can buy this wine from him.
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_20 " );	// I'll give you five hundred gold coins. This should be enough.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_21 " );	// However, you yourself understand that it is much more profitable for the guild if not all this money ends up in his pocket.
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_23 " );	// Now, don't waste any time and go to Gorax's monastery.
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_24 " );	// And I, in turn, am waiting for you with a batch of wine and a report on the perfect deal.
	MIS_CHURCHDEAL = LOG_Running;
	Log_CreateTopic(TOPIC_CHURCHDEAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_Running);
	B_LogEntry( TOPIC_CHURCHDEAL , " I need to go to the monastery to Master Gorax and deliver a small shipment of monastery wine from him. Luthero warned me that the price of this wine was not negotiated, so I have to negotiate with Gorax on the purchase price myself. Luthero concludes this deal gave me five hundred gold coins. My reward will depend on how profitable I can make a deal. " );
};


instance DIA_LUTERO_CHURCHDEALDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_churchdealdo_condition;
	information = dia_lutero_churchdealdo_info;
	permanent = FALSE;
	description = " About the deal with Gorax... " ;
};


func int dia_lutero_churchdealdo_condition()
{
	if((MIS_CHURCHDEAL == LOG_Running) && ((GORAXSNOTRADEMEWINE == TRUE) || (GORAXSTRADEMEWINE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_churchdealdo_info()
{
	var int bonuswineindex;
	AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_00 " );	// Regarding the deal with Gorax...
	AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_01 " );	// Do you have something to tell me?

	if(GORAXSNOTRADEMEWINE == TRUE)
	{
		AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_02 " );	// Unfortunately, I could not agree on the purchase of wine.
		AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_03 " );	// (besides himself) How?!
		if(GORAXSNOTENOUGHTGOLD == TRUE)
		{
			AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_04 " );	// I didn't have enough money for this deal!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_05 " );	// That is?! (surprised) How did you negotiate for the amount you don't have?!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_06 " );	// (besides himself) Are you an idiot?!	
		}
		else
		{
			AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_09 " );	// The conditions under which I agreed to buy this wine from him did not suit him.
			AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_10 " );	// And the prices he offered were simply absurd.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_11 " );	// You know, I'm not very inclined to believe what you say... (angrily)
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_12 " );	// I know Gorax well! He would never offer conditions that would call into question his reputation as an honest trader.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_13 " );	// Apparently, you yourself went too far, that Gorax simply had no choice but to refuse you.
		};
		AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_15 " );	// And now we'll have to pay him twice the regular price if we want to get this batch of wine after all.
		AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_16 " );	// Otherwise, he just won't listen to us. And all thanks to you! ... (breaking into a cry)
		AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_17 " );	// And what's worse, he could easily sell this wine to someone else!
		if(MIS_JORAHELP == LOG_FAILED)
		{
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_20 " );	// (disappointed) I was counting on you! Apparently, in vain I did it!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_24 " );	// You're completely unsuited for this kind of work!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_25 " );	// You're only causing our guild a loss with your actions!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_26 " );	// Therefore, it would be more correct if we refuse your help in the future!
			AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_27 " );	// What does this mean?
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_28 " );	// That means you're no longer a member of our guild!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_29 " );	// (angrily) People like you don't belong among us!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_31 " );	// Get lost! We have nothing more to discuss.
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			MIS_TRADEGUILD = LOG_FAILED;
			LUTEROPISSOFF = TRUE;
			MEMBERTRADEGUILD = FALSE;
			B_LogEntry_Failed(TOPIC_TRADEGUILD);
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_33 " );	// Apparently it's my own fault - I overestimated your capabilities too much.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_34 " );	// Should've left this job to someone else!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_35 " );	// And you, apparently, are not yet ready for such serious matters.
			AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_36 " );	// You're probably right.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_37 " );	// Okay! Let's forget about it. I will personally go to the monastery and speak with Gorax.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_39 " );	// And as for you, try not to make such mistakes again!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_40 " );	// Otherwise, our cooperation will soon come to an end.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_43 " );	// Wait, the money I gave you for this deal is still with you. Where are they?
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			if(Npc_HasItems(other,ItMi_Gold) >= 500)
			{
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_44");	//Они у меня.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_45 " );	// Then what are you waiting for - give them back! Or were you thinking about keeping them?
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_46 " );	// Here, take this.
				B_GiveInvItems(other,self,ItMi_Gold,500);
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_47 " );	// Well, at least I didn't lose money, and that makes me happy.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_48 " );	// Okay, now let's talk about something else.
				if(TRADEGUILDREP > 0)
				{
					TRADEGUILDREP = TRADEGUILDREP - 1;
				};
			}
			else
			{
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_49 " );	// I don't have them.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_50 " );	// What? (indignantly) And how is this to be understood?!
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_52 " );	// You think you can just get away with it like that?
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_56 " );	// You can no longer consider yourself a member of our guild!
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_57 " );	// People like you don't belong among us!
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_60");	//Но я...
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_61 " );	// (interrupting) Get out! We have nothing more to discuss!
				MIS_TRADEGUILD = LOG_FAILED;
				LUTEROPISSOFF = TRUE;
				MEMBERTRADEGUILD = FALSE;
				B_LogEntry_Failed(TOPIC_TRADEGUILD);
				AI_StopProcessInfos(self);
			};
		};
	};
	if(GORAXSTRADEMEWINE == TRUE)
	{
		AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_63 " );	// I agreed with Gorax on the price of a shipment of wine.
		AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_64 " );	// Great! (joyfully) That's very good news!
		AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_65 " );	// And where is the wine itself?
		AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_66 " );	// You should have at least twenty-five bottles by my calculations.

		if(Npc_HasItems(other,ItFo_Wine) >= 25)
		{
			AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_67 " );	// Here they are! Every single bottle is safe and sound.
			B_GiveInvItems(other,self,ItFo_Wine,25);
			Npc_RemoveInvItems(self,ItFo_Wine,25);
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_68 " );	// (joyfully) Great!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_69 " );	// My intuition did not fail me - I knew that you could be trusted with this matter.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_70 " );	// Now let's discuss the details of this deal.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_71 " );	// For what price did Gorax agree to sell you this wine?
			TRADEGUILDREP = TRADEGUILDREP + 1;
			MIS_CHURCHDEAL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_SUCCESS);
			B_LogEntry( TOPIC_TRADEGUILD , " I delivered the monastery wine to Luthero. " );

			if(GORAXCURRENTPRICE > 500)
			{
				B_GivePlayerXP(100);
				TRADEGUILDREP = TRADEGUILDREP - 2;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_72 " );	// Unfortunately, I didn't have enough money you gave me.
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_75 " );	// All in all, I paid him a little over five hundred coins.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_77 " );	// You really upset me...
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_78 " );	// I thought you might be able to bring down the price of this batch of wine a little.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_79 " );	// Oh well! (waving)
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_80 " );	// The main thing is that you fulfilled my order. And the rest is not so important.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_81 " );	// In the end, we can always recoup the buyers... (snidely)
			}
			else if(GORAXCURRENTPRICE == 500)
			{
				B_GivePlayerXP(100);
				TRADEGUILDREP = TRADEGUILDREP - 2;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_84 " );	// I hit exactly five hundred coins.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_87 " );	// M-yes. You upset me a little...
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_88 " );	// I thought you'd still be able to negotiate with him on more favorable terms.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_91 " );	// In the end, we can always recoup the buyers... (snidely)
			}
			else if(GORAXCURRENTPRICE > 400)
			{
				B_GivePlayerXP(150);
				TRADEGUILDREP = TRADEGUILDREP - 1;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_94 " );	// I gave him a little over four hundred coins.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_97 " );	// (no emotion) Well, not bad.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_98 " );	// Though I thought you'd be able to negotiate with him on slightly better terms.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_100 " );	// The main thing is that you fulfilled my order. And the rest is not so important.
			}
			else if(GORAXCURRENTPRICE > 300)
			{
				B_GivePlayerXP(200);
				TRADEGUILDREP = TRADEGUILDREP - 1;
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_101 " );	// I paid Gorax a little over three hundred coins.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_102 " );	// Wow! Quite good.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_103 " );	// And I honestly did not expect such success from you.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_104 " );	// Well, congratulations! (laughs)
			}
			else if(GORAXCURRENTPRICE > 200)
			{
				B_GivePlayerXP(200);
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_105 " );	// We agreed with him on a price slightly more than two hundred coins!
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_107 " );	// Did Gorax go for it?
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_110 " );	// Well, I can only say one thing - great work!
			}
			else if(GORAXCURRENTPRICE > 100)
			{
				TRADEGUILDREP = TRADEGUILDREP + 1;
				B_GivePlayerXP(250);
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_111 " );	// A little over one hundred coins.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_114 " );	// Incredible! (laughs) I can't believe that Gorax accepted such conditions!
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_116 " );	// As I see it, you know how to get your way. Well done!
			}
			else if(GORAXCURRENTPRICE > 50)
			{
				TRADEGUILDREP = TRADEGUILDREP + 2;
				B_GivePlayerXP(300);
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_117 " );	// All this wine cost me less than a hundred coins!
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_120 " );	// M-yes!...(laughs) Poor Gorax!
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_121 " );	// It turns out that you just bred him like a little boy! Who would have thought.
				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_122 " );	// Is something wrong?
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_124 " );	// It still doesn't fit in my head - how did you do it.
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_125 " );	// Hmmm... (thoughtfully) You surprised me! Very much surprised!
			}
			else if(GORAXCURRENTPRICE <= 50)
			{
				TRADEGUILDREP = TRADEGUILDREP + 3;
				B_GivePlayerXP(500);

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rhetoric + 1 " );
				};

				AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_126 " );	// He gave me his wine for less than fifty coins!
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_127 " );	// I don't understand... Is Gorax doing charity work?
				AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_132 " );	// Apparently, the poor fellow is completely crazy if he agreed to such conditions. (to himself) May Innos forgive me for my words.
			};

			AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_134 " );	// What about my stake in this business?
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_135 " );	// (sarcastically) Your share is already in your pocket.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_136 " );	// The money that you were able to bargain with Gorax - she is the very one.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_138 " );	// And the guild got the opportunity to buy wine from him at a lower price.
		}
		else
		{
			AI_Output(other,self, " DIA_Lutero_ChurchDealDo_01_144 " );	// I don't have them.
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_145 " );	// What? (indignantly) And how is this to be understood?!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_150 " );	// You think you can just get away with it like that?
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_154 " );	// You can no longer consider yourself a member of our guild!
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_155 " );	// (angrily) People like you don't belong among us!
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_158");	//Но я...
			AI_Output(self,other, " DIA_Lutero_ChurchDealDo_01_159 " );	// (interrupting) Get out! We have nothing more to discuss!
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			MIS_TRADEGUILD = LOG_FAILED;
			LUTEROPISSOFF = TRUE;
			MEMBERTRADEGUILD = FALSE;
			B_LogEntry_Failed(TOPIC_TRADEGUILD);
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_LUTERO_RARETHINGS(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethings_condition;
	information = dia_lutero_rarethings_info;
	permanent = FALSE;
	description = " Next task? " ;
};


func int dia_lutero_rarethings_condition()
{
	if(((MIS_ONARBUSINESS == LOG_SUCCESS) || (MIS_ONARBUSINESS == LOG_FAILED)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethings_info()
{
	AI_Output(other,self, " DIA_Lutero_RareThings_01_00 " );	// Another task?
	AI_Output(self,other, " DIA_Lutero_RareThings_01_02 " );	// Yes, I really need your help with one simple matter.
	AI_Output(self,other, " DIA_Lutero_RareThings_01_04 " );	// One of my regular customers made me an order for some very rare items.
	AI_Output(self,other, " DIA_Lutero_RareThings_01_05 " );	// To be precise - specifically for three things. And I want you to be the one to look for them directly.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_06");	//Почему я?
	AI_Output(self,other, " DIA_Lutero_RareThings_01_07 " );	// Yes, because you are a person who never sits in the same place anywhere! (laughs)
	AI_Output(self,other, " DIA_Lutero_RareThings_01_10 " );	// To search for these things, just such a person is needed.
	AI_Output(self,other, " DIA_Lutero_RareThings_01_11 " );	// Since it won't be easy to find them. Trust me.
	AI_Output(other,self, " DIA_Lutero_RareThings_01_12 " );	// What are you looking for?
	AI_Output(self,other, " DIA_Lutero_RareThings_01_13 " );	// We are talking about three precious statuettes with the image of Innos, made of black Nordmar marble!
	AI_Output(self,other, " DIA_Lutero_RareThings_01_16 " );	// I can say that in itself this material is highly valued, since it is incredibly difficult to get it.
	AI_Output(self,other, " DIA_Lutero_RareThings_01_17 " );	// And if you give it a beautiful and elegant shape, for example, in the form of the same figurines, then all this already pulls on a fortune!
	AI_Output(other,self, " DIA_Lutero_RareThings_01_18 " );	// And your buyer is ready to pay a lot of money for these figurines?
	AI_Output(self,other, " DIA_Lutero_RareThings_01_19 " );	// I would say just huge! Therefore, this order is very important to us.
	AI_Output(other,self, " DIA_Lutero_RareThings_01_20 " );	// I understand. Where should I start my search?
	AI_Output(self,other, " DIA_Lutero_RareThings_01_22 " );	// As far as I know, a few years ago, these figurines were sent to Minenthal, as payment to the barons for a large shipment of magic ore.
	AI_Output(self,other, " DIA_Lutero_RareThings_01_24 " );	// Apparently, one of the barons was a true connoisseur of art, if he decided to demand them from King Rhobar. (laughs)
	AI_Output(self,other, " DIA_Lutero_RareThings_01_29 " );	// But back then, magic ore was much more important to the king than some expensive trinkets.
	AI_Output(self,other, " DIA_Lutero_RareThings_01_30 " );	// It was only with her help that his paladins could somehow hold back the hordes of orcs.
	AI_Output(self,other, " DIA_Lutero_RareThings_01_31 " );	// Therefore, the king agreed to these terms without hesitation... (hesitantly) Well, I think so.
	AI_Output(other,self, " DIA_Lutero_RareThings_01_32 " );	// And you think these figurines are still in the colony?
	AI_Output(self,other, " DIA_Lutero_RareThings_01_33 " );	// Most likely. At least since the fall of the barrier, no one really heard anything about them.
	AI_Output(self,other, " DIA_Lutero_RareThings_01_35 " );	// And remember - I'm only interested in all three figurines!
	AI_Output(self,other, " DIA_Lutero_RareThings_01_37 " );	// So come back to me only when you have all of them in your hands.
	AI_Output(other,self, " DIA_Lutero_RareThings_01_40 " );	// I'll try my best.
	MIS_RARETHINGS = LOG_Running;
	Log_CreateTopic(TOPIC_RARETHINGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RARETHINGS,LOG_Running);
	B_LogEntry( TOPIC_RARETHINGS , " One of Luthero's regular customers ordered three precious statuettes of Innos, made of black marble. Luthero wants me to find them and bring them to him. It is known that these statuettes were once sent to the ore barons in payment of a debt for the rich a cargo of magic ore. They are probably still somewhere in the Valley of Mines. I think it’s worth starting the search from the castle premises. " );
};


instance DIA_LUTHER_RARETHINGSDO (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethingsdo_condition;
	information = dia_lutero_rarethingsdo_info;
	permanent = FALSE;
	description = " I've brought figurines from Nordmar. " ;
};


func int dia_lutero_rarethingsdo_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (Npc_HasItems(hero,itmi_innosmramorstatue) >= 3) && (MIS_RESCUEGOMEZ == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethingsdo_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Lutero_RareThingsDo_01_00 " );	// I brought the Nordmar figurines. Just like you asked!
	AI_Output(self,other, " DIA_Lutero_RareThingsDo_01_01 " );	// All three?! Show me... (incredulously)
	B_GiveInvItems(other,self,itmi_innosmramorstatue,3);
	Npc_RemoveInvItems(self,itmi_innosmramorstatue,3);
	AI_Output(self,other, " DIA_Lutero_RareThingsDo_01_03 " );	// Incredible! (besides herself) You did it!
	AI_Output(other,self, " DIA_Lutero_RareThingsDo_01_04 " );	// Yes, I managed to do it.
	AI_Output(self,other, " DIA_Lutero_RareThingsDo_01_07 " );	// You helped me a lot!
	AI_Output(self,other, " DIA_Lutero_RareThingsDo_01_10 " );	// Here, take this little gift from me. I think you should like it.
	B_GiveInvItems(self,other,itpo_megapotionskill,1);
	AI_Output(other,self, " DIA_Lutero_RareThingsDo_01_11 " );	// What is this elixir?
	AI_Output(self,other, " DIA_Lutero_RareThingsDo_01_12 " );	// Drink and find out. At least I can assure you for sure that you won't die from it... (laughs)
	AI_Output(self,other, " DIA_Lutero_RareThingsDo_01_13 " );	// And a thousand gold coins to boot. I don't think you can resist this either.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	TRADEGUILDREP = TRADEGUILDREP + 1;
	MIS_RARETHINGS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RARETHINGS,LOG_SUCCESS);
	B_LogEntry( TOPIC_RARETHINGS , " Luthero was very pleased with my work and thanked me generously. " );
};


instance DIA_LUTERO_RARETHINGSFAIL (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethingsfail_condition;
	information = dia_lutero_rarethingsfail_info;
	permanent = FALSE;
	description = " I couldn't find these figurines. " ;
};


func int dia_lutero_rarethingsfail_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (MIS_RESCUEGOMEZ == LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethingsfail_info()
{
	AI_Output(other,self, " DIA_Lutero_RareThingsFail_01_00 " );	// I couldn't find these figurines.
	AI_Output(self,other, " DIA_Lutero_RareThingsFail_01_01 " );	// Are you sure about this?
	AI_Output(other,self, " DIA_Lutero_RareThingsFail_01_02 " );	// Now no one will find them at all.
	AI_Output(self,other, " DIA_Lutero_RareThingsFail_01_03 " );	// Very sorry. (sadly) And I was counting on this deal...
	if(TRADEGUILDREP > 0)
	{
		TRADEGUILDREP = TRADEGUILDREP - 1;
	};
	MIS_RARETHINGS = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RARETHINGS);
};


instances DIA_LUTERO_MISSBRENDI (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_missbrendi_condition;
	information = dia_lutero_missbrandy_info;
	permanent = FALSE;
	description = " Got another job to do? " ;
};


func int dia_lutero_missbrendi_condition()
{
	if(((MIS_RARETHINGS == LOG_SUCCESS) || (MIS_RARETHINGS == LOG_FAILED)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_missbrendi_info()
{
	AI_Output(other,self, " DIA_Lutero_MissBrendi_01_00 " );	// Any more work?
	AI_Output(self,other, " DIA_Lutero_MissBrendi_01_01 " );	// There's always work to do! (laughs) But now I'm more worried about a slightly different question.
	AI_Output(self,other, " DIA_Lutero_MissBrendi_01_03 " );	// I recently sent one of my messengers, a guy named Benchel, to the 'Dead Harpy' tavern.
	AI_Output(self,other, " DIA_Lutero_MissBrendi_01_04 " );	// He was supposed to pick up a batch of black brandy there, which Orlan, the owner of this tavern, prepared for me.
	AI_Output(other,self, " DIA_Lutero_MissBrendi_01_07 " );	// And what's wrong with that?
	AI_Output(self,other, " DIA_Lutero_MissBrendi_01_08 " );	// Problem is, there hasn't been any word from Benchel yet.
	AI_Output(self,other, " DIA_Lutero_MissBrendi_01_09 " );	// I still don't know where he is or where my brandy is.
	AI_Output(self,other, " DIA_Lutero_MissBrendi_01_14 " );	// I'm starting to worry - has something bad happened to Benchel?
	AI_Output(other,self, " DIA_Lutero_MissBrendi_01_16 " );	// Can I help you with this?
	AI_Output(self,other, " DIA_Lutero_MissBrendi_01_17 " );	// Of course you can. We need to find Benchel as soon as possible and find out what happened.
	AI_Output(self,other, " DIA_Lutero_MissBrendi_01_18 " );	// And, of course, deliver five bottles of this black brandy to me no later than tomorrow noon.
	BLACKBRENDITIMER = Wld_GetDay();
	MIS_BLACKBRENDI = LOG_Running;
	Log_CreateTopic(TOPIC_BLACKBRENDI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BLACKBRENDI,LOG_Running);
	B_LogEntry( TOPIC_BLACKBRENDI , " A messenger named Benchel was supposed to deliver to Luthero five bottles of expensive black brandy that Orlan prepared for him. But Benchel has gone missing somewhere, and Luthero is very worried about this - a buyer should come for him soon. Luthero asked me to find out what happened to Benchel and try to get him five bottles of this brandy no later than tomorrow afternoon. " );
	Wld_InsertNpc(vlk_6130_benchel,"NW_BENCHELBANDITS_01");
	Wld_InsertNpc(bdt_9000_bandit,"NW_BENCHELBANDITS_02");
	Wld_InsertNpc(bdt_9001_bandit,"NW_BENCHELBANDITS_03");
	Wld_InsertNpc(bdt_9002_bandit,"NW_BENCHELBANDITS_04");
	Wld_InsertNpc(bdt_9003_bandit,"NW_BENCHELBANDITS_05");
	Wld_InsertNpc(bdt_9004_bandit,"NW_BENCHELBANDITS_06");
};


instance DIA_LUTERO_MISSBRENDIDO (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_missbrendido_condition;
	information = dia_lutero_missbrendido_info;
	permanent = TRUE;
	description = " I'm talking about Benchel... " ;
};


func int dia_lutero_missbrendido_condition()
{
	if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == TRUE))
	{
		return TRUE;
	};
};

func void luther_day_missbrendido_info()
{
	where int daynow;
	var int paynow;
	var int solnow;
	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_00 " );	// I'm talking about Benchel...
	AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_01 " );	// Yes? (animated) Any news?
	if (Npc_HasItems(hero,itmi_blackbrendi) >=  5 )
	{
		paynow = paynow + 1;
		AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_02 " );	// For starters, here's your brandy.
		B_GiveInvItems(other,self,itmi_blackbrendi,5);
		Npc_RemoveInvItems(self,itmi_blackbrendi,5);
		AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_03 " );	// Five bottles, just like you asked.
		MIS_BLACKBRENDI = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BLACKBRENDI,LOG_SUCCESS);
		if((BLACKBRENDITIMER >= daynow) || ((BLACKBRENDITIMER == (daynow - 1)) && Wld_IsTime(0,1,12,0)))
		{
			paynow = paynow + 1;
			TRADEGUILDREP = TRADEGUILDREP + 1;
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_04 " );	// Great - just in time. The buyer will be here any minute.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_05 " );	// This is going to be the best deal ever. You've done well.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_06 " );	// Thank you. Now, as far as Benchel is concerned...
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_07 " );	// By the way, where is he?
			B_LogEntry( TOPIC_BLACKBRENDI , " I brought Luthero black brandy at the appointed time, which made Luther very happy. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_08 " );	// Well, that's not bad at all, of course. True, unfortunately, you were late with its delivery ... (sadly)
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_09 " );	// I already had a buyer and, as you understand, I was in a very awkward position.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_11 " );	// And I'll have to give him a decent discount, otherwise this deal will not happen.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_13 " );	// You're in no hurry...(thoughtfully) Anything else?
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_14 " );	// Now, about Benchel...
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_15 " );	// By the way, where is he?
			B_LogEntry( TOPIC_BLACKBRENDI , " I brought Luthero black brandy, albeit belatedly, which Luthero was a little upset about. " );
		};
		if(BENCHELISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_16");	//Он мертв.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_19 " );	// Khhh... Hmmm, you brought some really bad news.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_20 " );	// Benchel was not just my messenger - he was my assistant.
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_22 " );	// I'm sorry.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_24 " );	// Now it's hard for me to even imagine how I will manage without his help.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_25 " );	// Oh, okay! Now there's nothing to be done - you'll have to look for someone else.
			paynow = paynow + 1;
			Log_AddEntry( TOPIC_BLACKBRENDI , " I also informed him of the death of his messenger, Benchel. Now Luthero will have to look for a new assistant. " );
		}
		else
		{
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_27 " );	// The guy is now drugging himself with beer at a nearby tavern.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_28 " );	// WHAT?! So this bastard has been chilling out all this time instead of doing his job?!
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_29 " );	// Well, just now let him try to come to me - I'll teach him the mind of the mind! (angrily)
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_30 " );	// Wait, it's not his fault!
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_32 " );	// He did everything you said, but...
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_33 " );	// ...when he was already returning to you with your brandy - not far from the city he was attacked by bandits.
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_34 " );	// And he miraculously escaped death!
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_35 " );	// Hmmm, really? (thoughtfully) Well, then that changes things a bit.
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_41 " );	// That's it. So there is nothing wrong with the guy relaxing a little and calming down.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_42 " );	// I agree... I was wrong about him.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_43 " );	// Let him rest for a couple of days, and after that he will start working again.
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_44 " );	// I'm afraid he won't come back.
			AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_46 " );	// After everything that happened, Benchel decided to give up his job as a messenger.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_48 " );	// Hmm, I didn't expect this at all. His decision made me very sad.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_50 " );	// There are a lot of people, but Benchel was not just my messenger - he was my assistant.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_51 " );	// Yes, and besides, he was well versed in trading.
			AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_58 " );	// Oh, okay! Now there's nothing to be done - you'll have to look for someone else.
			Log_AddEntry( TOPIC_BLACKBRENDI , " I also informed him of Benchel's decision to leave this job. Now Luthero will have to look for a new assistant. " );
			paynow = paynow + 2;
		};
		solnow = 150 * paynow;
		B_GivePlayerXP(solnow);
	}
	else
	{
		AI_Output(other,self, " DIA_Lutero_MissBrendiDo_01_59 " );	// Not yet.
		AI_Output(self,other, " DIA_Lutero_MissBrendiDo_01_60 " );	// Too bad...(sadly) Let me know if anything comes up.
	};
};


instance DIA_LUTERO_TRADEHELPER (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_tradehelper_condition;
	information = dia_lutero_tradehelper_info;
	permanent = FALSE;
	description = " You look quite puzzled. " ;
};


func int dia_lutero_tradehelper_condition()
{
	if((MIS_BLACKBRENDI == LOG_SUCCESS) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_tradehelper_info()
{
	AI_Output(other,self, " DIA_Lutero_TradeHelper_01_00 " );	// You look quite puzzled.
	AI_Output(self,other, " DIA_Lutero_TradeHelper_01_01 " );	// Yes? (thoughtfully) Hmmm. Although you may be right.
	AI_Output(self,other, " DIA_Lutero_TradeHelper_01_03 " );	// Eh... Now that Benchel refused to work for me - I just can't handle this amount of work alone!
	AI_Output(self,other, " DIA_Lutero_TradeHelper_01_07 " );	// And where can I look for such a person who at least a little understood our business.
	AI_Output(other,self, " DIA_Lutero_TradeHelper_01_09 " );	// Can I help you?
	AI_Output(self,other, " DIA_Lutero_TradeHelper_01_10 " );	// You? Hmmm... (thoughtfully) Well, yes, you could very well help me in this matter.
	AI_Output(self,other, " DIA_Lutero_TradeHelper_01_11 " );	// Try to find a replacement for Benchel. And let it be a worthy replacement.
	MIS_TRADEHELPER = LOG_Running;
	Log_CreateTopic(TOPIC_TRADEHELPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_Running);
	B_LogEntry( TOPIC_TRADEHELPER , " Luthero is looking for someone to help him trade. I must find a suitable candidate for Luthero. " );
};

var int LuteroDealNow;

instance DIA_LUTERO_TRADEHELPERDONE (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_tradehelperdone_condition;
	information = dia_lutero_tradehelperdone_info;
	permanent = FALSE;
	description = " I found someone for you. " ;
};

func int dia_lutero_tradehelperdone_condition()
{
	if((MIS_TRADEHELPER == LOG_Running) && ((FINDPERSONONE == TRUE) || (FINDPERSONTWO == TRUE) || (FINDPERSONTHREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_tradehelperdone_info()
{
	var C_Npc helperlutero;
	AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_00 " );	// I found a person for you.
	AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_01 " );	// Yes? (with interest) And who is he?

	if(FINDPERSONONE == TRUE)
	{
		B_GivePlayerXP(50);
		GAYVERNNOTHIRED = TRUE;

		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};

		MIS_TRADEHELPER = LOG_FAILED ;
		B_LogEntry_Failed(TOPIC_TRADEHELPER);
		helperlutero = Hlp_GetNpc(vlk_6132_gayvern);
		helperlutero.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_02 " );	// He's right in front of you. Meet his name Gavern.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_03 " );	// Hmmm... (looks closely) Well, okay. And what can he do?
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_04 " );	// What should he be able to do?
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_05 " );	// Well, for starters, he should at least be able to write and read.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_06 " );	// Or how do you think he's going to keep a purchasing ledger or payrolls?
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_07 " );	// No, he can't do that. But this guy is very strong.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_09 " );	// If I need ordinary movers or bouncers, I'll hire them in the port area.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_11 " );	// And I need a person who knows at least a little about trading!
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_15 " );	// This man is absolutely unsuited for the job I would like him to do.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_16 " );	// Like him, the best place in the port is to work as a laborer, and not handle trading papers or dispose of a warehouse.
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_17 " );	// So it doesn't suit you?
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_18 " );	// No! Excuse me, but what you offer me does not suit me.
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_19 " );	// Maybe I should look for someone else for you?
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_20 " );	// Don't. So you better forget about my request.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_21 " );	// I'll take care of this myself and try to find myself a new assistant.

		if (( SARAISDEAD  ==  TRUE ) || (( SARAFLEE  ==  FALSE ) && (Sarah_Ausgeliefert ==  FALSE )))
		{
			AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_57 " );	// Will there be more errands for me?
			AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_58 " );	// (thoughtfully) In the near future - hardly. So you can do other things.
			AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_59 " );	// Okay, whatever you say.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6132_gayvern, " BackToDrink " );
		}
		else
		{
			if (( NEXTQUESTSARAHTOGUILD  ==  FALSE ) && (Chapter >=  4 ) && (( MY_TRADING_HELPERS  ==  LOG_SUCCESS ) || ( MY_TRADING_HELPERS  ==  LOG_FAILURE )))
			{
				if (( SARAISDEAD  ==  FALSE ) && (( SARAFLEE  ==  TRUE ) || (Sarah_Ausgeliefert ==  TRUE )))
				{
					LuteroDealNow = TRUE;
					AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_22 " );	// And now let's discuss one more important matter.
					Info_ClearChoices(dia_lutero_tradehelperdone);
					Info_AddChoice(dia_lutero_tradehelperdone, " Okay, let's talk about it. " ,dia_lutero_tradehelperdone_gayvernaway);
				}
				else
				{
					AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_57 " );	// Will there be more errands for me?
					AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_58 " );	// (thoughtfully) In the near future - hardly. You can do other things.
					AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_59 " );	// Okay, whatever you say.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6132_gayvern, " BackToDrink " );
				};
			}
			else
			{
				AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_57 " );	// Will there be more errands for me?
				AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_58 " );	// (thoughtfully) In the near future - hardly. So you can do other things.
				AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_59 " );	// Okay, whatever you say.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6132_gayvern, " BackToDrink " );
			};
		};
	}
	else if(FINDPERSONTWO == TRUE)
	{
		B_GivePlayerXP(250);
		MAXIHIRED = TRUE;
		TRADEGUILDREP = TRADEGUILDREP + 1;
		MIS_TRADEHELPER = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_SUCCESS);
		B_LogEntry( TOPIC_TRADEHELPER , " Luthero agreed to take on the man I brought to him as his assistant, even though he didn't make much of an impression on him. " );
		helperlutero = Hlp_GetNpc(vlk_6133_maxi);
		helperlutero.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_23 " );	// There he is right in front of you. Meet him, his name is Maxi.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_24 " );	// Hmmm... (looks closely) Well, okay. And what can he do?
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_25 " );	// Well, for starters, he should at least be able to write and read.
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_26 " );	// Apparently, he knows a little. The guy used to work for one merchant - he was a messenger and carried out some small orders.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_27 " );	// Hmmm...(thoughtfully) Well, that's a good start.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_28 " );	// Although, of course, I was counting on you to find me a person more knowledgeable in trading.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_29 " );	// But in the end, everything can be learned, and the main thing is that at least he does not look like a completely impenetrable dumbass.
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_30 " );	// So it suits you?
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_31 " );	// Hmmm... (thoughtfully) Okay, I'm taking him to work with me. And I hope I don't regret my decision.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_34 " );	// Here, take this money as a reward for doing me a favor.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_35 " );	// I think this should be enough to make up for your trouble.
		B_GiveInvItems(self,other,ItMi_Gold,500);

		if (( SARAISDEAD  ==  TRUE ) || (( SARAFLEE  ==  FALSE ) && (Sarah_Ausgeliefert ==  FALSE )))
		{
			AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_60 " );	// Thank you! Will there be more errands for me?
			AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_61 " );	// Hmmm... (thoughtfully) In the near future, hardly! So you can do other things.
			AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_62 " );	// Okay, whatever you say.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
		}
		else
		{
			if (( NEXTQUESTSARAHTOGUILD  ==  FALSE ) && (Chapter >=  4 ) && (( MY_TRADING_HELPERS  ==  LOG_SUCCESS ) || ( MY_TRADING_HELPERS  ==  LOG_FAILURE )))
			{
				if (( SARAISDEAD  ==  FALSE ) && (( SARAFLEE  ==  TRUE ) || (Sarah_Ausgeliefert ==  TRUE )))
				{
					LuteroDealNow = TRUE;
					AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_37 " );	// And now let's discuss one more important matter. It can't wait!
					Info_ClearChoices(dia_lutero_tradehelperdone);
					Info_AddChoice(dia_lutero_tradehelperdone, " Okay, let's talk about it. " ,dia_lutero_tradehelperdone_maxiaway);
				}
				else
				{
					AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_60 " );	// Thank you. Will there be more errands for me?
					AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_61 " );	// (thoughtfully) In the near future - hardly. So you can do other things.
					AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_62 " );	// Okay, whatever you say.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
				};
			}
			else
			{
				AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_60 " );	// Thank you. Will there be more errands for me?
				AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_61 " );	// (thoughtfully) In the near future - hardly. You can do other things.
				AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_62 " );	// Okay, whatever you say.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
			};
		};
	}
	else if(FINDPERSONTHREE == TRUE)
	{
		B_GivePlayerXP(500);
		VALERANHIRED = TRUE;
		TRADEGUILDREP = TRADEGUILDREP + 2;
		MIS_TRADEHELPER = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_SUCCESS);
		B_LogEntry( TOPIC_TRADEHELPER , " Luthero was very pleased with my proposal to be his assistant. " );
		helperlutero = Hlp_GetNpc(vlk_6134_valeran);
		helperlutero.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_38 " );	// There he is right in front of you. Meet him, his name is Valeran.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_39 " );	// Waleran? Hmmm... (thoughtfully) Wait!
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_40 " );	// Isn't this the Valeran who used to work for Fernando the trader?
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_41 " );	// The same one. Now that Fernando is behind bars, he is looking for a new job.
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_42 " );	// So I thought you might be interested in his services.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_43 " );	// You did the right thing by bringing him to me.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_44 " );	// I know Valeran - he is very smart and knows our business very well.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_45 " );	// And I always dreamed of having such a helper!
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_46 " );	// I even offered him to go to work for me, but then he refused - he considered that it would not be too nice of him.
		AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_49 " );	// So it suits you?
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_50 " );	// Absolutely! (happily) You did the best you could.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_51 " );	// And I won't be indebted to you.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_52 " );	// Here, take this money as a reward for doing me a favor.
		AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_53 " );	// I think this should be enough to make up for your trouble.
		B_GiveInvItems(self,other,ItMi_Gold,1000);

		if (( SARAISDEAD  ==  TRUE ) || (( SARAFLEE  ==  FALSE ) && (Sarah_Ausgeliefert ==  FALSE )))
		{
			AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_63 " );	// Thank you! Will there be more errands for me?
			AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_64 " );	// Hmmm... (thoughtfully) Not in the near future. So you can do other things.
			AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_65 " );	// Okay, whatever you say.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
		}
		else
		{
			if (( NEXTQUESTSARAHTOGUILD  ==  FALSE ) && (Chapter >=  4 ) && (( MY_TRADING_HELPERS  ==  LOG_SUCCESS ) || ( MY_TRADING_HELPERS  ==  LOG_FAILURE )))
			{
				if (( SARAISDEAD  ==  FALSE ) && (( SARAFLEE  ==  TRUE ) || (Sarah_Ausgeliefert ==  TRUE )))
				{
					LuteroDealNow = TRUE;
					AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_56 " );	// And just in time, because I need to discuss with you one very important business that requires a lot of attention.
					Info_ClearChoices(dia_lutero_tradehelperdone);
					Info_AddChoice(dia_lutero_tradehelperdone, " Хорошо, как скажешь. " , dia_lutero_tradehelperdone_valeranaway);
				}
				else
				{
					AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_63 " );	// Thank you. Will there be more errands for me?
					AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_64 " );	// (thoughtfully) In the near future - hardly. So you can do other things.
					AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_65 " );	// Okay, whatever you say.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
				};
			}
			else
			{
				AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_63 " );	// Thank you. Will there be more errands for me?
				AI_Output(self,other, " DIA_Lutero_TradeHelperDone_01_64 " );	// (thoughtfully) In the near future - hardly. So you can do other things.
				AI_Output(other,self, " DIA_Lutero_TradeHelperDone_01_65 " );	// Okay, whatever you say.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
			};
		};
	};
};

func void dia_lutero_tradehelperdone_gayvernaway()
{
	AI_Output(other,self, " DIA_Lutero_TradeHelperDone_GayvernAway_01_01 " );	// Okay, let's discuss.
	B_StartOtherRoutine(vlk_6132_gayvern, " BackToDrink " );
};

func void dia_lutero_tradehelperdone_maxiaway()
{
	AI_Output(other,self, " DIA_Lutero_TradeHelperDone_MaxiAway_01_01 " );	// Okay, let's discuss.
	B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
};

func void dia_lutero_tradehelperdone_valeranaway()
{
	AI_Output(other,self, " DIA_Lutero_TradeHelperDone_ValeranAway_01_01 " );	// Okay, whatever you say.
	B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
};

instances DIA_LUTERO_SARAHTOGUILD (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguild_condition;
	information = dia_lutero_sarahtoguild_info;
	permanent = FALSE;
	description = " What's up? " ;
};

func int dia_lutero_sarahtoguild_condition()
{
	if (( NEXTQUESTSARAHTOGUILD  ==  FALSE ) && (Chapter >=  4 ) && (( MY_TRADING_HELPERS  ==  LOG_SUCCESS ) || ( MY_TRADING_HELPERS  ==  LOG_FAILURE )))
	{
		if (( SARAISDEAD  ==  FALSE ) && (( SARAFLEE  ==  TRUE ) || (Sarah_Ausgeliefert ==  TRUE )))
		{
			if(LuteroDealNow == TRUE) 
			{
				return TRUE;
			};
		};
	};
};

func void luther_day_sarahtoguild_info()
{
	AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_00 " );	// What's up?
	AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_01 " );	// The matter is very sensitive and requires extreme accuracy.
	AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_02 " );	// I would even say - special tact.
	AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_03 " );	// What happened?
	AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_04 " );	// Tell me, did you meet a merchant named Sarah in the market place?
	AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_05 " );	// Yes, I know her.
	AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_06 " );	// Good. Then you should know that she recently got into a very unpleasant affair.

	if (Sarah_Ausgeliefer ==  TRUE )
	{
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_07 " );	// And by the way, some evil tongues say that it's your fault... (sarcastically)
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_08 " );	// What happened to her?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_09 " );	// She is accused of selling weapons to Onar's people. Although I have a hard time believing it.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_10 " );	// I know Sara well and don't think she's capable of that.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_13 " );	// Now the militia keeps her behind bars - you must admit, not the best place for a young girl.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_14 " );	// So, I want to help her. And not just to help, but to try to fundamentally correct the whole situation in which she found herself.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_15 " );	// What exactly do you want to do for her?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_16 " );	// First you need to restore her honest name - otherwise, without this, you can immediately put an end to the career of a merchant.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_17 " );	// And then, I want to offer her a job in our guild.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_18 " );	// Sarah has an undoubted talent in the field of trade, and I want it to benefit not only her ... (snidely)
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_19 " );	// Yes, I see you, you won't miss yours!
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_20 " );	// You understood me correctly... (laughs) However, this does not mean that I act solely for selfish purposes.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_21 " );	// I really want to help her, but I don't forget about my own benefit.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_23 " );	// I think you're the right person to do all this.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_24 " );	// Почему я?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_25 " );	// Because if I act, it will draw too much attention to my person.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_28 " );	// Good. Where do I begin?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_29 " );	// First of all, you need to get Sarah out of prison.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_33 " );	// As far as I know, it is possible to pay a fine for any prisoner and thereby remove some charges from him.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_34 " );	// And the larger this amount, the easier it is to negotiate with Lord Andre.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_37 " );	// So - as you yourself understand, Sarah is not a rich girl and she does not have such a lot of money. And freedom is very expensive!
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_38 " );	// We can afford such expenses.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_39 " );	// Us - is it for you and me?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_40 " );	// Yes, you, as a guild member, should also be interested in this matter.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_42 " );	// Here, take these five hundred coins. This is my contribution to this event. The rest is up to you.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_43 " );	// I don't think Lord Andre would put too much fine on the head of a common merchant.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_47 " );	// After Sarah gets out of prison - try talking to her.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_48 " );	// Try to convince her that working in our guild is the best thing she can find in this city after everything that happened.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_52 " );	// I'll be waiting for news from you.
		SARAHELPYOUANDFREE = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry( TOPIC_SARAHTOGUILD , " Luthero wants to help a girl, Sarah, a merchant. She recently had an unpleasant experience and was sent to prison. By the way, it was my fault! Now I have to go to Lord Andre and pay a fine for her release, and then try to persuade Saru to join the Merchant's Guild, as Luthero thinks she's a good fit for his business. " );
	}
	else if(SARAFLEE == TRUE)
	{
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_55 " );	// What happened to her?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_56 " );	// I heard a merchant named Kantar threatened her with death if she didn't give him her place in the marketplace.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_57 " );	// The poor girl is just terrified, and now she's just afraid to go there to trade.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_58 " );	// I know this Kantar - he's still that scoundrel!
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_59 " );	// But he has very powerful patrons in this city. Sarah doesn't.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_60 " );	// That's why he allowed himself too much.

		if(Npc_IsDead(Canthar) == TRUE)
		{
			AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_61 " );	// No more. Recently, someone killed him.
			AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_62 " );	// Yes? Well, serve him right.
			AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_63 " );	// However, this does not change the essence of the matter. There are still a lot of scumbags in the city who do not want to play fair.
		};

		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_65 " );	// Anyway, I want to help Sarah.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_66 " );	// How?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_67 " );	// I want to offer her a job in our guild and thus protection from all sorts of encroachments of various kinds of scoundrels like Kantar.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_69 " );	// Sarah has an undoubted talent in the field of trade, and I want it to benefit not only her ... (snidely)
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_70 " );	// Yes, I see you won't miss yours.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_72 " );	// I really want to help her, but I don't forget about my own benefit.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_80 " );	// Find Sarah and try to talk to her.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_81 " );	// Try to convince her that working in our guild is the best thing she can find in this city after everything that happened.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_85 " );	// I'll be waiting for news from you.
		SARAHELPYOU = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry( TOPIC_SARAHTOGUILD , " Luthero wants to help a girl, trader Sarah. Recently, an unpleasant story happened to her - merchant Kantar threatened her with death if she did not give him her trading place in the market square. Luthero wants to take Sarah's business under his wing to help she will avoid similar situations in the future.To do this, I need to find Sarah and persuade her to join the merchants guild, since Luthero believes that she is a good help for his business. " );
	};
};

instance DAY_LUTERO_SARAHTOGUILD_EX (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguild_EX_condition;
	information = dia_lutero_sarahtoguild_EX_info;
	permanent = FALSE;
	description = " Do you have any more errands for me? " ;
};

func int dia_lutero_sarahtoguild_EX_condition()
{
	if (( NEXTQUESTSARAHTOGUILD  ==  FALSE ) && (Chapter >=  4 ) && (( MY_TRADING_HELPERS  ==  LOG_SUCCESS ) || ( MY_TRADING_HELPERS  ==  LOG_FAILURE )))
	{
		if (( SARAISDEAD  ==  FALSE ) && (( SARAFLEE  ==  TRUE ) || (Sarah_Ausgeliefert ==  TRUE )))
		{
			if(LuteroDealNow == FALSE) 
			{
				return TRUE;
			};
		};
	};
};

func void luther_day_sarahtoguild_EX_info()
{
	AI_Output(other,self, " DIA_Lutero_JoraHelp_01_00 " );	// Do you have any more errands for me?
	AI_Output(self,other, " DIA_Lutero_ChurchDeal_01_00 " );	// It's good that you came! I was waiting for you.
	AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_01 " );	// The matter is very sensitive and requires extreme accuracy.
	AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_02 " );	// I would even say - special tact.
	AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_03 " );	// What happened?
	AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_04 " );	// Tell me, did you meet a merchant named Sarah in the market place?
	AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_05 " );	// Yes, I know her.
	AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_06 " );	// Good. Then you should know that she recently got into a very unpleasant affair.

	if (Sarah_Ausgeliefer ==  TRUE )
	{
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_07 " );	// And by the way, some evil tongues say that it's your fault... (sarcastically)
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_08 " );	// What happened to her?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_09 " );	// She is accused of selling weapons to Onar's people. Although I have a hard time believing it.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_10 " );	// I know Sara well and don't think she's capable of that.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_13 " );	// Now the militia keeps her behind bars - you must admit, not the best place for a young girl.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_14 " );	// So, I want to help her. And not just to help, but to try to fundamentally correct the whole situation in which she found herself.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_15 " );	// What exactly do you want to do for her?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_16 " );	// First, you need to restore her honest name - otherwise, without this, you can immediately put an end to the merchant's career.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_17 " );	// And then, I want to offer her a job in our guild.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_18 " );	// Sarah has an undoubted talent in the field of trade, and I want it to benefit not only her ... (snidely)
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_19 " );	// Yes, I see you, you won't miss yours!
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_20 " );	// You understood me correctly... (laughs) However, this does not mean that I act solely for selfish purposes.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_21 " );	// I really want to help her, but I don't forget about my own benefit.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_23 " );	// I think you're the right person to do all this.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_24 " );	// Почему я?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_25 " );	// Because if I act, it will draw too much attention to my person.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_28 " );	// Good. Where do I begin?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_29 " );	// First of all, you need to get Sarah out of prison.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_33 " );	// As far as I know, it is possible to pay a fine for any prisoner and thereby remove some charges from him.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_34 " );	// And the larger this amount, the easier it is to negotiate with Lord Andre.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_37 " );	// So - as you yourself understand, Sarah is not a rich girl and she does not have such a lot of money. And freedom is very expensive!
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_38 " );	// We can afford such expenses.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_39 " );	// Us - is it for you and me?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_40 " );	// Yes, you, as a guild member, should also be interested in this matter.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_42 " );	// Here, take these five hundred coins. This is my contribution to this event. The rest is up to you.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_43 " );	// I don't think Lord Andre would put too much fine on the head of a common merchant.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_47 " );	// After Sarah gets out of prison - try talking to her.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_48 " );	// Try to convince her that working in our guild is the best thing she can find in this city after everything that happened.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_52 " );	// I'll be waiting for news from you.
		SARAHELPYOUANDFREE = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry( TOPIC_SARAHTOGUILD , " Luthero wants to help a girl, Sarah, a merchant. She recently had an unpleasant experience and was sent to prison. By the way, it was my fault! Now I have to go to Lord Andre and pay a fine for her release, and then try to persuade Saru to join the Merchant's Guild, as Luthero thinks she's a good fit for his business. " );
	}
	else if(SARAFLEE == TRUE)
	{
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_55 " );	// What happened to her?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_56 " );	// I heard a merchant named Kantar threatened her with death if she didn't give him her place in the marketplace.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_57 " );	// The poor girl is just terrified, and now she's just afraid to go there to trade.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_58 " );	// I know this Kantar - he's still that scoundrel!
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_59 " );	// But he has very powerful patrons in this city. Sarah doesn't.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_60 " );	// That's why he allowed himself too much.

		if(Npc_IsDead(Canthar) == TRUE)
		{
			AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_61 " );	// No more. Recently, someone killed him.
			AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_62 " );	// Yes? Well, serve him right.
			AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_63 " );	// However, this does not change the essence of the matter. There are still a lot of scumbags in the city who do not want to play fair.
		};

		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_65 " );	// Anyway, I want to help Sarah.
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_66 " );	// How?
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_67 " );	// I want to offer her a job in our guild and thus protection from all sorts of encroachments of various kinds of scoundrels like Kantar.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_69 " );	// Sarah has an undoubted talent in the field of trade, and I want it to benefit not only her ... (snidely)
		AI_Output(other,self, " DIA_Lutero_SarahToGuild_01_70 " );	// Yes, I see you won't miss yours.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_72 " );	// I really want to help her, but I don't forget about my own benefit.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_80 " );	// Find Sarah and try to talk to her.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_81 " );	// Try to convince her that working in our guild is the best thing she can find in this city after everything that happened.
		AI_Output(self,other, " DIA_Lutero_SarahToGuild_01_85 " );	// I'll be waiting for news from you.
		SARAHELPYOU = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry( TOPIC_SARAHTOGUILD , " Luthero wants to help a girl, trader Sarah. Recently, an unpleasant story happened to her - merchant Kantar threatened her with death if she did not give him her trading place in the market square. Luthero wants to take Sarah's business under his wing to help she will avoid similar situations in the future.To do this, I need to find Sarah and persuade her to join the merchants guild, since Luthero believes that she is a good help for his business. " );
	};
};

instances DIA_LUTERO_SARAHTOGUILDDONE (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguilddone_condition;
	information = dia_lutero_sarahtoguilddone_info;
	permanent = FALSE;
	description = " I talked to Sarah. " ;
};

func int dia_lutero_sarahtoguilddone_condition()
{
	if (( MIS_SARAHTOGUILD  == LOG_Running) && (( SARAPISSOFF  ==  TRUE ) || ( SARAREFUSEHELPS  ==  TRUE ) || ( SARAAGREE  ==  TRUE )))
	{
		return TRUE;
	};
};

func void dia_lutero_sarahtoguilddone_info()
{
	AI_Output(other,self, " DIA_Lutero_SarahToGuildDone_01_00 " );	// I talked to Sarah.
	AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_01 " );	// Yes? And what did she say?

	if((SARAPISSOFF == TRUE) || (SARAREFUSEHELPS == TRUE))
	{
		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};
		NEXTQUESTSARAHTOGUILD = TRUE;
		MIS_SARAHTOGUILD = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_SARAHTOGUILD);
		AI_Output(other,self, " DIA_Lutero_SarahToGuildDone_01_02 " );	// Nothing. She was just beside herself when I tried to contact her.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_03 " );	// Hmmm... I wonder why Sarah reacted so harshly to you?
		AI_Output(other,self, " DIA_Lutero_SarahToGuildDone_01_04 " );	// She thinks I'm the one to blame for what happened to her.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_05 " );	// (maliciously) Now it's clear.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_06 " );	// And you know, some feeling tells me that this is exactly what happened.
		AI_Output(other,self, " DIA_Lutero_SarahToGuildDone_01_07 " );	// Well, to be honest, she's a bit right.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_08 " );	// That's why it's no wonder she didn't talk to you.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_09 " );	// I told you that in this matter you will need to show special tact!
		AI_Output(other,self, " DIA_Lutero_SarahToGuildDone_01_11 " );	// I did my best.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_12 " );	// Oh, okay. At least we helped her a little and restored some justice in this case.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_14 " );	// And maybe in time, when Sarah calms down a bit and forgets old grievances - I'll try to talk to her myself.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_15 " );	// As for you, try not to fill your head with this anymore. There are more important things to do!
		AI_Output(other,self, " DIA_Lutero_SarahToGuildDone_01_16 " );	// Okay, whatever you say.

		if(TRADEGUILDREP >= 9)
		{
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_25 " );	// Here, take this money and, in addition to it, this little thing.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_26 " );	// I think it will be enough to pay for all your troubles associated with this case.
			B_GiveInvItems(self,other,itri_pilligrimring,1);
			AI_Output(other,self, " DIA_Lutero_SarahToGuildDone_01_27 " );	// Thank you!
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_28 " );	// No need to thank you - you rightfully deserve this honor!
			TRADEGUILDISOVERMASTER = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_30 " );	// Here, take this money.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_31 " );	// I think they will be enough to pay for all your troubles associated with this case.
			TRADEGUILDISOVER = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
		};
	}
	else if(SARAAGREE == TRUE)
	{
		B_GivePlayerXP(500);
		TRADEGUILDREP = TRADEGUILDREP + 1;
		NEXTQUESTSARAHTOGUILD = TRUE;
		SARAHELPYOUDONE = TRUE;
		MIS_SARAHTOGUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_SUCCESS);
		Npc_ExchangeRoutine(VLK_470_Sarah,"Trade");
		B_LogEntry( TOPIC_SARAHTOGUILD , " Luthero was very pleased that I was able to negotiate with Sarah. " );
		AI_Output(other,self, " DIA_Lutero_SarahToGuildDone_01_17 " );	// She agrees with your proposal.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_18 " );	// Great! That's exactly what I expected to hear from you.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_19 " );	// Now you don't have to worry about this anymore - I'll take care of the rest myself.
		AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_20 " );	// As for you, take this little gift from me as compensation for your troubles.

		if(TRADEGUILDREP >= 9)
		{
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_25 " );	// Here, take this money and, in addition to it, this little thing.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_26 " );	// I think it's enough to pay for all your troubles with this case.
			B_GiveInvItems(self,other,itri_pilligrimring,1);
			TRADEGUILDISOVERMASTER = TRUE;
			if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_GUR ))
			{
				AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_34 " );	// For a respected mage, I have a special reward.
				B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			}
			else
			{
				AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_35 " );	// For a brave warrior, I have a special reward.
				B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_30 " );	// Here, take this money.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other, " DIA_Lutero_SarahToGuildDone_01_31 " );	// I think this should be enough to make up for your trouble.
			TRADEGUILDISOVER = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
		};
	};
};


instance DIA_LUTERO_PALADINFOOD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_paladinfood_condition;
	information = dia_lutero_paladinfood_info;
	permanent = FALSE;
	description = " What's your business with me? " ;
};


func int dia_lutero_paladinfood_condition()
{
	if((MIS_JORAHELP == LOG_FAILED) || (MIS_JORAHELP == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lutero_paladinfood_info()
{
	AI_Output(other,self, " DIA_Lutero_PaladinFood_01_00 " );	// What business do you have with me?
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_02 " );	// The paladins want to make an agreement with our guild to supply them with food and drink.
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_03 " );	// This is a very good offer and we shouldn't pass it up.
	AI_Output(other,self, " DIA_Lutero_PaladinFood_01_04 " );	// What about the city and nearby farms?
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_05 " );	// They won't be able to handle their needs. And after Onar refused to trade with the city, the situation already looks quite deplorable.
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_06 " );	// And besides, there are few who want to give away their entire harvest for nothing. Even if it's the king's paladins... (laughs)
	AI_Output(other,self, " DIA_Lutero_PaladinFood_01_07 " );	// Got it. What do you want from me?
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_08 " );	// I already have some verbal agreement with Lord Hagen on this matter.
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_09 " );	// However, we still do not know the exact volumes of these deliveries.
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_11 " );	// Therefore, go to Lord Hagen and thoroughly discuss this topic with him.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Lutero_PaladinFood_01_12 " );	// Of course, the fact that you're one of Onar's mercenaries might get in the way a bit.
		AI_Output(self,other, " DIA_Lutero_PaladinFood_01_13 " );	// But I think Lord Hagen will still listen to you if you're a little more polite to him.
	};
	AI_Output(other,self, " DIA_Lutero_PaladinFood_01_16 " );	// What exactly should Lord Hagen tell me?
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_17 " );	// I need you to tell me exactly how much food the paladins need.
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_18 " );	// And better in writing.
	AI_Output(self,other, " DIA_Lutero_PaladinFood_01_26 " );	// Now go to the paladins and try not to mess things up.
	MIS_PALADINFOOD = LOG_Running;
	Log_CreateTopic(TOPIC_PALADINFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PALADINFOOD,LOG_Running);
	B_LogEntry( TOPIC_PALADINFOOD , " Luthero referred me to Lord Hagen to discuss the amount of paladin food the guild is going to provide. " );
};


instance DIA_LUTERO_PALADINFOODDONE(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_paladinfooddone_condition;
	information = dia_lutero_paladinfooddone_info;
	permanent = FALSE;
	description = " I talked to Hagen. " ;
};


func int dia_lutero_paladinfooddone_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && (Npc_HasItems(hero,itwr_hagencontent) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_paladinfooddone_info()
{
	B_GivePlayerXP(300);
	TRADEGUILDREP = TRADEGUILDREP + 1;
	MIS_PALADINFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PALADINFOOD,LOG_SUCCESS);
	Log_AddEntry( TOPIC_PALADINFOOD , " I delivered Luthero's list. " );
	AI_Output(other,self, " DIA_Lutero_PaladinFoodDone_01_00 " );	// I talked to Hagen.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_01 " );	// And what did he say?
	AI_Output(other,self, " DIA_Lutero_PaladinFoodDone_01_02 " );	// He gave me this list - it's all paladins need.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_03 " );	// Okay, let me take a look at it.
	B_GiveInvItems(other,self,itwr_hagencontent,1);
	B_UseFakeScroll();
	Npc_RemoveInvItems(self,itwr_hagencontent,1);
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_05 " );	// Hmmm. I think Lord Hagen is asking too much.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_07 " );	// Our guild just doesn't have such huge food supplies!
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_08 " );	// The most we can provide is half of what he needs...(confused)
	AI_Output(other,self, " DIA_Lutero_PaladinFoodDone_01_09 " );	// Then I think we should report this to Hagen himself.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_10 " );	// No, don't. If we do that, then I'm afraid this deal won't go through at all!
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_12 " );	// Need to come up with something else.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_15 " );	// Only one person can have such a large supply of food.
	AI_Output(other,self, " DIA_Lutero_PaladinFoodDone_01_16 " );	// Do you mean Onar?
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_17 " );	// Yes, that's it.
	AI_Output(other,self, " DIA_Lutero_PaladinFoodDone_01_18 " );	// But he will never sell food to the paladins or the city.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_20 " );	// Yes, it really is. However, Onar is still a business man and, besides, he really loves the sound of gold.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_21 " );	// I think we should try to negotiate with him.
	AI_Output(other,self, " DIA_Lutero_PaladinFoodDone_01_22 " );	// What if someone finds out about this?
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_23 " );	// Of course, the risk is, of course, great. But the benefit of this deal justifies it.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_25 " );	// And I entrust this matter to you.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_31 " );	// So go to his farm and try to talk him into selling us some of the food.
	AI_Output(other,self, " DIA_Lutero_PaladinFoodDone_01_32 " );	// I'll try to do it.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_34 " );	// If you still manage to negotiate with him, then do not hesitate - my gratitude to you will know no bounds.
	AI_Output(self,other, " DIA_Lutero_PaladinFoodDone_01_36 " );	// Now go and don't waste your time.
	MIS_ONARBUSINESS = LOG_Running;
	Log_CreateTopic(TOPIC_ONARBUSINESS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ONARBUSINESS,LOG_Running);
	B_LogEntry( TOPIC_ONARBUSINESS , " The volumes of provisions that Lord Hagen requested for his paladins turned out to be simply impossible - Luthero will not be able to supply all the necessary food in full. However, he also does not want to lose a good deal. Therefore, he decided to try to negotiate the supply of part food with the rebellious landowner Onar. More precisely, he sent me to negotiate with Onar, since Luthero himself is too prominent a figure for such matters. What will come of this venture is now even hard to imagine. " );
};


instance DIA_LUTERO_ONARBUSINESS(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_onarbusiness_condition;
	information = dia_lutero_onarbusiness_info;
	permanent = TRUE;
	description = " About that idea of ​​yours... " ;
};


func int dia_lutero_onarbusiness_condition()
{
	if((MIS_ONARBUSINESS == LOG_Running) && ((ONARAGREED == TRUE) || (ONARNOTAGREED == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_onarbusiness_info()
{
	AI_Output(other,self, " DIA_Lutero_OnarBusiness_01_00 " );	// About that idea of ​​yours...
	AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_01 " );	// What? Any news?
	if(ONARAGREED == TRUE)
	{
		B_GivePlayerXP(300);
		TRADEGUILDREP = TRADEGUILDREP + 1;
		MIS_ONARBUSINESS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_ONARBUSINESS,LOG_SUCCESS);
		B_LogEntry( TOPIC_ONARBUSINESS , " Luthero was incredibly happy that I was able to arrange food supplies for the guild with Onar. " );
		AI_Output(other,self, " DIA_Lutero_OnarBusiness_01_02 " );	// I agreed with Onar.
		AI_Output(other,self, " DIA_Lutero_OnarBusiness_01_03 " );	// He agreed to provide the guild with some of the missing supplies.
		AI_Output(other,self, " DIA_Lutero_OnarBusiness_01_04 " );	// Although he noted that it will cost you a lot!
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_05 " );	// Great! (admiringly) I didn't think you'd actually be able to talk that old hog into it.
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_11 " );	// Here! Take this award. You totally deserve it.
		B_GiveInvItems(self,other,itwr_elementarearcanei,1);
	}
	else if(ONARNOTAGREED == TRUE)
	{
		B_GivePlayerXP(250);
		MIS_ONARBUSINESS = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_ONARBUSINESS);
		AI_Output(other,self, " DIA_Lutero_OnarBusiness_01_23 " );	// Unfortunately, I could not agree with Onar.
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_24 " );	// I thought so...(frustrated) What did he say?
		AI_Output(other,self, " DIA_Lutero_OnarBusiness_01_25 " );	// That fat boar didn't even listen to me, he just kicked me out the door.
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_26 " );	// It looks a lot like him!
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_27 " );	// Okay, let's forget about it - after all, there was little hope for this option.
		AI_Output(other,self, " DIA_Lutero_OnarBusiness_01_28 " );	// And now what?
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_29 " );	// Now we'll have to somehow find this missing piece of paladin supplies ourselves.
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_34 " );	// As for you, despite the fact that you could not fulfill this order of mine...
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_35 " );	// ...I don't want to let you go empty-handed.
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_43 " );	// Here, take this money.
		B_GiveInvItems(self,other,ItMi_Gold,300);
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_44 " );	// I think this should be enough to make up for your trouble.
	}
	else
	{
		AI_Output(other,self, " DIA_Lutero_OnarBusiness_01_47 " );	// Not yet.
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_48 " );	// Then why are you wasting my time?
		AI_Output(self,other, " DIA_Lutero_OnarBusiness_01_49 " );	// Go and talk to Onar!
		AI_StopProcessInfos(self);
	};
};

instance DIA_LUTERO_MASTERRING(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 1;
	condition = dia_lutero_masterring_condition;
	information = dia_lutero_masterring_info;
	permanent = FALSE;
	description = " What is this ring you gave me? " ;
};

func int dia_lutero_masterring_condition()
{
	if((TRADEGUILDISOVERMASTER == TRUE) && (Npc_HasItems(hero,itri_pilligrimring) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_masterring_info()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 1000;
	AI_NoticePrint( 3000 , 4098 , NAME_ADDON_TRADEBONUS );
	TRADEBONUS = TRUE ;
	AI_Output(other,self, " DIA_Lutero_MasterRing_01_00 " );	// What is this ring you gave me?
	AI_Output(self,other, " DIA_Lutero_MasterRing_01_01 " );	// I knew you'd be interested in this...(laughs) Let me explain something to you.
	AI_Output(self,other, " DIA_Lutero_MasterRing_01_02 " );	// This ring is the trade guild master's mark. This is a great honor, and few deserve it.
	AI_Output(other,self, " DIA_Lutero_MasterRing_01_03 " );	// Merchant guild masters?
	AI_Output(other,self, " DIA_Lutero_MasterRing_01_04 " );	// But I thought it was you.
	AI_Output(self,other, " DIA_Lutero_MasterRing_01_05 " );	// It's true...(laughs) However, that doesn't mean that I'm the only one who can hold this title.
	AI_Output(self,other, " DIA_Lutero_MasterRing_01_08 " );	// Note that by wearing this ring, you will not only acquire the status of a master, it will also give you certain privileges!
	AI_Output(other,self, " DIA_Lutero_MasterRing_01_09 " );	// What are the privileges?
	AI_Output(self,other, " DIA_Lutero_MasterRing_01_10 " );	// Those merchants who are members of our guild, seeing this ring...
	AI_Output(self,other, " DIA_Lutero_MasterRing_01_11 " );	// ...will gladly sell you the best product they have.
	AI_Output(self,other, " DIA_Lutero_MasterRing_01_12 " );	// Just talk to any of them and you'll see the difference...(laughs)
	AI_Output(self,other, " DIA_Lutero_MasterRing_01_13 " );	// Just don't forget to put on your guild master's ring before this - otherwise they just won't understand who is standing in front of them.
	AI_Output(other,self, " DIA_Lutero_MasterRing_01_14 " );	// Okay, I'll remember that. Thank you.
	NAME_TRADEMASTERRING = " This ring is the mark of Trader's Guild Master Khorinis... " ;
	Npc_RemoveInvItems(other,itri_pilligrimring,1);
	CreateInvItems(other,itri_pilligrimring,1);
	MIS_TRADEGUILD = LOG_SUCCESS;
	TRADEMASTERBEGAN = TRUE;
	Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
	B_LogEntry( TOPIC_TRADEGUILD , " I am now the Master of the Khorinis Traders Guild! " );
};

instance DIA_LUTHER_TRADEGUILD (C_Info)
{
	npc = VLK_404_Lutero;
	nr = 2;
	condition = dia_lutero_endtradeguild_condition;
	information = dia_lutheran_endtradeguild_info;
	permanent = TRUE;
	description = " Do you have any more errands for me? " ;
};

func int dia_lutero_endtradeguild_condition()
{
	if((MIS_TRADEGUILD != LOG_SUCCESS) && ((TRADEGUILDISOVERMASTER == TRUE) || (TRADEGUILDISOVER == TRUE)))
	{
		return TRUE;
	};
};

func void dia_luther_endtradeguild_info()
{
	AI_Output(other,self, " DIA_Lutero_EndTradeGuild_01_00 " );	// Do you have any more errands for me?

	if(TRADEGUILDISOVERMASTER == TRUE)
	{
		AI_Output(self,other, " DIA_Lutero_EndTradeGuild_01_01 " );	// No, I don't have any more work for you yet.
		AI_Output(self,other, " DIA_Lutero_EndTradeGuild_01_02 " );	// Right now I'm too busy with the paladin business to be distracted by anything else.
		AI_Output(other,self, " DIA_Lutero_EndTradeGuild_01_03 " );	// Okay, whatever you say.

		if(TRADEMASTERBEGAN == TRUE)
		{
			AI_Output(self,other, " DIA_Lutero_EndTradeGuild_01_04 " );	// And besides: you've already done a great job and deserve some rest...(laughs)
		};
	}
	else if(TRADEGUILDISOVER == TRUE)
	{
		AI_Output(self,other, " DIA_Lutero_EndTradeGuild_01_08 " );	// No, I don't have any more work for you yet.
		AI_Output(self,other, " DIA_Lutero_EndTradeGuild_01_09 " );	// Right now I'm too busy with the paladin business to be distracted by anything else.
		AI_Output(other,self, " DIA_Lutero_EndTradeGuild_01_10 " );	// Okay, whatever you say.

		if(MIS_TRADEGUILD == LOG_Running)
		{
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			B_LogEntry( TOPIC_TRADEGUILD , " Luthero has no more errands for me. I think we can forget about this for a while. " );
		};
	};
};


instance DIA_LUTERO_WHOISTRADEGUILD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_whoistradeguild_condition;
	information = dia_lutero_whoistradeguild_info;
	permanent = TRUE;
	description = " Who is in the Merchant's Guild? " ;
};

func int dia_lutero_whoistradeguild_condition()
{
	if((MEMBERTRADEGUILD == TRUE) && (KNOWS_GUILDTRADERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_lutero_whoistradeguild_info()
{
	AI_Output(other,self, " DIA_Lutero_WhoIsTradeGuild_01_00 " );	// Who is in the merchants guild?
	if(TRADEMASTERBEGAN == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Lutero_WhoIsTradeGuild_01_01 " );	// Since you are now also the master of our guild, I can tell you about it.
		if(MIS_SARAHTOGUILD == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Lutero_WhoIsTradeGuild_01_02 " );	// You already know some of them - these are Jora and Sarah... (snidely)
			if(KNOWS_GUILDTRADERS == FALSE)
			{
				Log_CreateTopic(TOPIC_GUILDTRADERS,LOG_NOTE);
				B_LogEntry( TOPIC_GUILTRADERS , " Luthero gave me the names of the guild traders. They are Matteo, Salandril, Jora, Erol, Nigel and Sarah. " );
				KNOWS_GUILDTRADERS = TRUE;
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Lutero_WhoIsTradeGuild_01_03 " );	// One you're already familiar with is Jor's trader.
			if(KNOWS_GUILDTRADERS == FALSE)
			{
				Log_CreateTopic(TOPIC_GUILDTRADERS,LOG_NOTE);
				B_LogEntry( TOPIC_GUILDTRADERS , " Luthero gave me the names of the guild traders. They are Matteo, Salandril, Jora, Erol and Nigel. " );
				KNOWS_GUILDTRADERS = TRUE;
			};
		};
		AI_Output(self,other, " DIA_Lutero_WhoIsTradeGuild_01_04 " );	// In addition, there are others in our guild - Matteo, Salandril, Erol and Nigel.
		AI_Output(self,other, " DIA_Lutero_WhoIsTradeGuild_01_05 " );	// All of them, as I said, will be happy to offer you the best goods they have.
		AI_Output(self,other, " DIA_Lutero_WhoIsTradeGuild_01_06 " );	// Just don't forget to wear the ring.
	}
	else
	{
		AI_Output(self,other, " DIA_Lutero_WhoIsTradeGuild_01_08 " );	// It's too early for you to know about it.
		AI_Output(self,other, " DIA_Lutero_WhoIsTradeGuild_01_09 " );	// Before asking such questions, we first need to become someone in our guild.
	};
};
