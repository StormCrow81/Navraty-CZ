

instance DIA_Addon_Farim_EXIT(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 999;
	condition = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Farim_PICKPOCKET(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 900;
	condition = DIA_Addon_Farim_PICKPOCKET_Condition;
	information = DIA_Addon_Farim_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Farim_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 11 );
};

func void DIA_Addon_Farim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,Dialog_Back,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};

func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};


instance DIA_Addon_Farim_Hallo (C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Hallo_Condition;
	information = DIA_Addon_Farim_Hallo_Info;
	description = " Are you a fisherman? " ;
};


func int DIA_Addon_Farim_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Ты рыбак?
	AI_Output(self,other, " DIA_Addon_Farim_Hallo_11_01 " );	// I wonder how you guessed?
	AI_Output(self,other, " DIA_Addon_Farim_Hallo_11_02 " );	// Could you leave me alone?

	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Addon_Farim_Landstreicher_Add_11_02 " );	// Don't take it personally, but the militia has been giving me a hard time lately.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Farim_Landstreicher_Add_11_03 " );	// Don't take it personally. It's just that I've been having trouble with the militia lately.
	};
};


instance DIA_Addon_Farim_MilizProbs(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MilizProbs_Condition;
	information = DIA_Addon_Farim_MilizProbs_Info;
	description = " Trouble with the militia? " ;
};

func int DIA_Addon_Farim_MilizProbs_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Request_Hello ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Farim_MilizProbs_Info()
{
	AI_Output(other,self, " DIA_Addon_Farim_MilizProbs_15_00 " );	// Trouble with the militia?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_11_01 " );	// Those bastards come to me and take whatever they want.
	};
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_11_02 " );	// They took all my catch last week. They said he was going to a good cause.
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_11_03 " );	// Of course, I understand that after the farmers stopped trading with the city, everyone gets out as best they can.
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_11_04 " );	// Sometimes they don't have enough food. No wonder they take my fish.
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_11_05 " );	// But if they continue to do this, I myself will have nothing to eat.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs, " Give me all your fish. " ,DIA_Addon_Farim_MilizProbs_klauen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs, " Maybe I can help. " ,DIA_Addon_Farim_MilizProbs_helfen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs, " Did you tell the paladins about this? " ,DIA_Addon_Farim_MilizProbs_paladine);
};

func void DIA_Addon_Farim_MilizProbs_paladine()
{
	AI_Output(other,self, " DIA_Addon_Farim_MilizProbs_paladine_15_00 " );	// Did you tell the paladins about this?
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_paladine_11_01 " );	// Are you kidding? Do you really think they'd be interested that some poor man was having trouble with the militia?
};


var int Farim_PissedOff;

func void DIA_Addon_Farim_MilizProbs_klauen()
{
	AI_Output(other,self, " DIA_Addon_Farim_MilizProbs_klauen_15_00 " );	// Give me all your fish.
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_klauen_11_01 " );	// (angrily) I knew it! You're just another bastard.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_klauen_11_02 " );	// I'm afraid you're too late. Your friends have already been here and they took everything.
	};
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_klauen_11_04 " );	// I think you'd better leave.
	Farim_PissedOff = TRUE;
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
};

func void DIA_Addon_Farim_MilizProbs_helfen()
{
	AI_Output(other,self, " DIA_Addon_Farim_MilizProbs_helfen_15_00 " );	// Maybe I can help you.
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_helfen_11_02 " );	// I don't know... I guess we need someone with influence over the militia or paladins.
	AI_Output(self,other, " DIA_Addon_Farim_MilizProbs_helfen_11_03 " );	// Although it's unlikely that paladins will buy fish from me.
	AI_Output(other,self, " DIA_Addon_Farim_MilizProbs_helfen_15_04 " );	// I'll see what I can do.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Log_CreateTopic(TOPIC_Addon_FarimsFish,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_Running);
	B_LogEntry(TOPIC_Addon_FarimsFish, " Fisherman Farim is having trouble with the militia. They're taking so many fish from him that he doesn't have enough to live on. To help him, I need to talk to someone with influence among the paladins. " );
	MIS_Addon_Farim_PaladinFisch = LOG_Running;
};


instance DIA_Addon_Farim_MartinHelps(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MartinHelps_Condition;
	information = DIA_Addon_Farim_MartinHelps_Info;
	description = " I know how to solve your militia problems. " ;
};


func int DIA_Addon_Farim_MartinHelps_Condition()
{
	if ((MY_Addon_Farm_PaladinFisch == LOG_Running) && (Martin_KnowsFarm ==  TRUE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Farim_MartinHelps_Info()
{
	B_GivePlayerXP(XP_Addon_Farim_PaladinFisch);
	AI_Output(other,self, " DIA_Addon_Farim_MartinHelps_15_00 " );	// I know how to solve your militia problems.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//И как же?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self, " DIA_Addon_Farim_MartinHelps_15_02 " );	// I'm too infrequent here to keep an eye on your fish.
		AI_Output(other,self, " DIA_Addon_Farim_MartinHelps_15_03 " );	// But I know someone who can help you.
	};
	AI_Output(other,self, " DIA_Addon_Farim_MartinHelps_15_04 " );	// Martin, quartermaster of the paladins, wants to hear your story about the militia and the fish.
	AI_Output(self,other, " DIA_Addon_Farim_MartinHelps_11_05 " );	// Do you think he can get the militia people to leave me alone?
	AI_Output(other,self, " DIA_Addon_Farim_MartinHelps_15_06 " );	// He said so.
	AI_Output(self,other, " DIA_Addon_Farim_MartinHelps_11_07 " );	// Great! Thank you! I have nothing to pay you... But wait...
	AI_Output(self,other, " DIA_Addon_Farim_MartinHelps_11_08 " );	// I found this strange stone on one of the islands off the coast of Khorinis.
	AI_Output(self,other, " DIA_Addon_Farim_MartinHelps_11_09 " );	// I don't think it's very valuable, but someone like you will surely find a use for it.
	AI_Output(self,other, " DIA_Addon_Farim_MartinHelps_11_10 " );	// In addition, if you want, I can sell you some fish and everything else that the sea gives me.
	B_GiveInvItems(self,other,ItMi_Aquamarine,1);
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_SUCCESS);
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Farim will now be able to sell me fish and other seafood. " );
};

instance DIA_Addon_Farm_Trade ( C_Info );
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Trade_Condition;
	information = DIA_Addon_Farim_Trade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};

func int DIA_Addon_Farim_Trade_Condition()
{
	if ((MIS_Addon_Paladin_Fisch ==  LOG_SUCCESS ) && Wld_IsTime( 7 , 0 , 22 , 0 ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Lutero_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};

instance DIA_Addon_Farim_Landstreicher (C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Landstreicher_Condition;
	information = DIA_Addon_Farim_Landstreicher_Info;
	description = " Do you know anything about missing people? " ;
};

func int DIA_Addon_Farim_Tramper_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Farim_Tramper_Info()
{
	AI_Output(other,self, " DIA_Addon_Farim_Landstreicher_15_01 " );	// Do you know anything about missing people?
	AI_Output(self,other, " DIA_Addon_Farim_Landstreicher_11_02 " );	// My friend William met with some suspicious types. And what did it lead him to?
	AI_Output(self,other, " DIA_Addon_Farim_Landstreicher_11_03 " );	// One day he just didn't show up for work. I didn't see him again.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


instance DIA_Addon_Farim_William(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_William_Condition;
	information = DIA_Addon_Farim_William_Info;
	description = " Is your friend William missing? " ;
};


func int DIA_Addon_Farim_William_Condition()
{
	if (( SCKnowsFriendAsWilliamsFriend ==  TRUE ) && Npc_KnowsInfo(other,DIA_Addon_Friend_Hello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Farim_William_Info()
{
	AI_Output(other,self, " DIA_Addon_Farim_William_15_00 " );	// Is your friend William missing?
	AI_Output(self,other, " DIA_Addon_Farim_William_11_01 " );	// That's right. He was a fisherman, but in my opinion he was too conceited.
	AI_Output(self,other, " DIA_Addon_Farim_William_11_02 " );	// He should have stayed away from this gang.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_ClearChoices(DIA_Addon_Farim_William);
	Info_AddChoice(DIA_Addon_Farim_William, " But who were these people? " ,DIA_Addon_Farim_William_typen);
	Info_AddChoice(DIA_Addon_Farim_William, " I think he'll show up again. " ,DIA_Addon_Farim_William_auftauchen);
	Info_AddChoice(DIA_Addon_Farim_William, " What did he do? " ,DIA_Addon_Farim_William_WasGemacht);
	Info_AddChoice(DIA_Addon_Farim_William, " When did you last see William? " ,DIA_Addon_Farim_William_WannWeg);
};

func void DIA_Addon_Farim_William_WhatMade()
{
	AI_Output(other,self, " DIA_Addon_Farim_William_WasGemacht_15_00 " );	// What did he do?
	AI_Output(self,other, " DIA_Addon_Farim_William_WasGemacht_11_01 " );	// He had some dark dealings with these crooks.
	AI_Output(self,other, " DIA_Addon_Farim_William_WasGemacht_11_02 " );	// I think he was selling them contraband.
};

func void DIA_Addon_Farim_William_typen()
{
	AI_Output(other,self, " DIA_Addon_Farim_William_typen_15_00 " );	// But what kind of people were they?
	AI_Output(self,other, " DIA_Addon_Farim_William_typen_11_01 " );	// I don't know who they are or what they needed in Khorinis.
	AI_Output(self,other, " DIA_Addon_Farim_William_typen_11_02 " );	// I can only tell you where they met William.
	AI_Output(self,other, " DIA_Addon_Farim_William_typen_11_03 " );	// I saw him once when I was fishing in the bay.
	Info_AddChoice(DIA_Addon_Farim_William, " Where exactly is this place? " ,DIA_Addon_Farim_William_Wo);
};

func void DIA_Addon_Farim_William_Wo()
{
	AI_Output(other,self, " DIA_Addon_Farim_William_Wo_15_00 " );	// Where exactly is this place?
	AI_Output(self,other, " DIA_Addon_Farim_William_Wo_11_01 " );	// There's a small cove to the north of here.
	AI_Output(self,other, " DIA_Addon_Farim_William_Wo_11_02 " );	// You can sail there yourself or by boat.
	AI_Output(self,other, " DIA_Addon_Farim_William_Wo_11_03 " );	// There is a small fishing camp on the shore of this bay. That's where I saw them.
	self.flags = 0;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " Fisherman Farim complained to me that his friend William was missing. Farim told me that William met some thugs on the beach north of the harbor. " );
	Info_AddChoice(DIA_Addon_Farim_William, " I heard everything I wanted to know. " ,DIA_Addon_Farim_William_Tschau);
};

func void DIA_Addon_Farim_William_WannWeg()
{
	AI_Output(other,self, " DIA_Addon_Farim_William_WannWeg_15_00 " );	// When did you last see William?
	AI_Output(self,other, " DIA_Addon_Farim_William_WannWeg_11_01 " );	// A few days ago.
	Info_AddChoice(DIA_Addon_Farim_William, " Maybe he just went out to sea to fish? " ,DIA_Addon_Farim_William_Fischen);
};

func void DIA_Addon_Farim_William_Fischen()
{
	AI_Output(other,self, " DIA_Addon_Farim_William_Fischen_15_00 " );	// Maybe he just went out to sea to fish?
	AI_Output(self,other, " DIA_Addon_Farim_William_Fischen_11_01 " );	// Doesn't look like it. His boat is anchored in the harbor.
};

func void DIA_Addon_Farim_William_appear()
{
	AI_Output(other,self, " DIA_Addon_Farim_William_auftauchen_15_00 " );	// I think it will still appear.
	AI_Output(self,other, " DIA_Addon_Farim_William_auftauchen_11_01 " );	// Hardly. He was gone for too long.
	AI_Output(self,other, " DIA_Addon_Farim_William_auftauchen_11_02 " );	// I'm afraid his body will wash ashore in waves after a while.
};

func void DIA_Addon_Farim_William_Tschau()
{
	AI_Output(other,self, " DIA_Addon_Farim_William_Tschau_15_00 " );	// I've heard everything I wanted to know.
	AI_Output(self,other, " DIA_Addon_Farim_William_Tschau_11_01 " );	// You don't have to worry. I don't think you will find it.
	Info_ClearChoices(DIA_Addon_Farim_William);
};


instance DIA_Addon_Farim_Perm(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 99;
	condition = DIA_Addon_Farim_Perm_Condition;
	information = DIA_Addon_Farim_Perm_Info;
	permanent = TRUE;
	description = " How does it bite? " ;
};

func int DIA_Addon_Farim_Perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Farm_Hello ) && ( FARIMRECRUITEDT  ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Как клюет?

	if(Farim_PissedOff == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Farim_Perm_11_01 " );	// Stop pretending to be interested.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Farim_Perm_11_02 " );	// Used to be better. Surviving is difficult now, but dying is easier than ever.
	};
};


instance DIA_Addon_Farim_WilliamReport(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_Addon_Farim_WilliamReport_Condition;
	information = DIA_Addon_Farim_WilliamReport_Info;
	important = TRUE;
};


func int DIA_Addon_Farim_WilliamReport_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Farim_William ))
	{
		if (( Npc_HasItems ( other , ITWr_Addon_William_01 ) >  0 ) || ( Saturation_AboutWilliam ==  TRUE )) ;
		{
			return TRUE;
		};
	};
	return  FALSE ;
};

func void DIA_Addon_Farim_WilliamReport_Info()
{
	AI_Output(self,other, " DIA_Addon_Farim_Add_11_01 " );	// Ah, it's you again!
	AI_Output(self,other, " DIA_Addon_Farim_Add_11_02 " );	// Any news about William?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Он мертв.
	AI_Output(self,other, " DIA_Addon_Farim_Add_11_03 " );	// (sighs) That's what I thought.
	AI_Output(self,other, " DIA_Addon_Farim_Add_11_04 " );	// Well, thanks for telling me.
	AI_Output(self,other, " DIA_Addon_Farim_Add_11_05 " );	// I'll go to the tavern and drink his share of our last catch. He would like me to do this...
};

instances of DIA_Addon_Farim_Uha (C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Uha_condition;
	information = DIA_Addon_Farim_Uha_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Addon_Farim_Uha_condition()
{
	if(MIS_Addon_Farim_PaladinFisch == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Uha_info()
{
	AI_Output(self,other, " DIA_Addon_Farim_Uha_01_01 " );	// Wait a minute...
	AI_Output(other,self, " DIA_Addon_Farim_Uha_01_02 " );	// What else is this?
	AI_Output(self,other, " DIA_Addon_Farim_Uha_01_03 " );	// Do you happen to have some time to listen to the old man?
	Info_ClearChoices(DIA_Addon_Farim_Uha);
	Info_AddChoice(DIA_Addon_Farim_Uha, " Мне некогда. " ,DIA_Addon_Farim_Uha_no);
	Info_AddChoice(DIA_Addon_Farim_Uha, " Да, конечно. " ,DIA_Addon_Farim_Uha_yes);
};

func void DIA_Addon_Farim_Uha_no()
{
	AI_Output(other,self, " DIA_Addon_Farim_Uha_no_01_00 " );	// I don't have time.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_no_01_01 " );	// Well, sorry to bother you again...
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Farim_Uha_yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Farim_Uha_yes_01_01 " );	// Yes, of course.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_02 " );	// You see, it's such a thing... (coughing) I was sick, in general, a little.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_03 " );	// Day after day, this fuss by the water with nets, fish ...
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_04 " );	// Here, apparently, it blew me in a draft. And you need to work to somehow make ends meet.
	AI_Output(other,self, " DIA_Addon_Farim_Uha_yes_01_05 " );	// How can I help?
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_06 " );	// I remember, in my youth, I ate a wonderful fish soup - not a simple one, but a combined one!
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_07 " );	// There, in addition to fish, there was old cheese, mushrooms and herbs. And this dish was seasoned with red pepper.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_08 " );	// Eat an ear - and you immediately get all the way to the bone! You feel like a hero, and you don’t want to eat for a long time.
	AI_Output(other,self, " DIA_Addon_Farim_Uha_yes_01_09 " );	// So what's the problem? Take and prepare this your combined fish soup.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_10 " );	// Yes, I would love to... if I knew how!
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_12 " );	// In general, I can’t cook this charm myself, but I want to improve my strength.
	AI_Output(other,self, " DIA_Addon_Farim_Uha_yes_01_13 " );	// Okay, old man, I'll help in any way I can.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_14 " );	// Then here, take at least the fish. I hope that you will help, and I will not remain in debt.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_yes_01_15 " );	// Believe me, I have something to thank - recently, after a storm, the sea brought a lot of good things.
	B_GiveInvItems(self,other,ItFo_Fish,5);
	MIS_FARIM_QUEST = LOG_Running;
	Log_CreateTopic(TOPIC_ADDON_FARIMFISH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FARIMFISH,LOG_Running);
	B_LogEntry( TOPIC_ADDON_FARIMFISH , " Fisherman Farim asked me to cook a special fish soup for him called 'team'. " );
	Info_ClearChoices(DIA_Addon_Farim_Uha);
};


instance DIA_Addon_Create_Done (C_Info) .
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Uha_Done_condition;
	information = DIA_Addon_Farim_Uha_Done_info;
	permanent = FALSE;
	description = " I brought your prefabricated ear. " ;
};

func int DIA_Addon_Farim_Uha_Done_condition()
{
	if ((Npc_HasItems(hero,itfo_schildkroetesoup_sborka) >=  1 ) && ( MIS_FARIM_QUEST  == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Uha_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Farim_Uha_Done_01_01 " );	// I brought your prefabricated fish soup.
	B_GiveInvItems(other,self,itfo_schildkroetesoup_sborka,1);
	AI_Output(self,other, " DIA_Addon_Farim_Uha_Done_01_02 " );	// Oh, thanks mate...(coughing) That's exactly what I need right now!
	AI_Output(self,other, " DIA_Addon_Farim_Uha_Done_01_03 " );	// Forgive me for tearing it out of my hands, I just can't wait to try it again.
	B_UseItem(self,itfo_schildkroetesoup_sborka);
	AI_Output(self,other, " DIA_Addon_Farim_Uha_Done_01_04 " );	// Mmm, how tasty... Well, you can choose the reward yourself.
	KNOWS_UHA = TRUE;
	MIS_FARIM_QUEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ADDON_FARIMFISH,LOG_SUCCESS);
	B_LogEntry( TOPIC_ADDON_FARIMFISH , " I brought Farim's fish soup. He was very grateful and rewarded me well for my efforts. " );
	Info_ClearChoices(DIA_Addon_Farim_Uha_Done);
	Info_AddChoice(DIA_Addon_Farim_Uha_Done, " Give me a black pearl. " ,DIA_Addon_Farim_Uha_Done_Gemchug);
	Info_AddChoice(DIA_Addon_Farim_Uha_Done, " Give me scallops and shrimp. " ,DIA_Addon_Farim_Uha_Done_Grebni);
};

func void DIA_Addon_Farim_Uha_Done_Gemchug()
{
	AI_Output(other,self, " DIA_Addon_Farim_Uha_Done_Gemchug_01_01 " );	// Give me the black pearl.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_Done_Gemchug_01_02 " );	// Here, take this.
	B_GiveInvItems(self,other,ItMi_DarkPearl,1);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Add_Read_Done()
{
	AI_Output(other,self, " DIA_Addon_Farim_Uha_Done_Grebni_01_01 " );	// Give me those scallops and shrimp you found after the storm.
	AI_Output(self,other, " DIA_Addon_Farim_Uha_Done_Grebni_01_02 " );	// Here, take this.
	B_GiveInvItems(self,other,ItMi_Addon_Shell_01,10);
	B_GiveInvItems(self,other,ItMi_Addon_Shell_02,5);
	AI_StopProcessInfos(self);
};

instance DIA_FARIM_RECRDTSUGG (C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 8;
	condition = dia_farim_recrdtsugg_condition;
	information = dia_farim_recrdtsugg_info;
	permanent = FALSE;
	description = " How is the fish? Biting? " ;
};

func int dia_farim_recrdtsugg_condition()
{
	if ((MY_Addon_Paladin_Fisch ==  LOG_SUCCESS ) && ( HURRAYICANHIRE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_farim_recrdtsugg_info()
{
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_15_00 " );	// How's the fish? Biting?
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_01 " );	// Oh, don't ask. Do not put salt on my wound.
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_15_02 " );	// What, really bad catch?
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_03 " );	// Eh, the catch is just now not bad. Season, you know.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_04 " );	// Yes, as for evil, no one wants to buy my fish.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_15_05");	//Почему?
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_06 " );	// Haven't you heard? There was a scandal throughout the city.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_07 " );	// Some rich woman from the upper quarter read all sorts of exotic recipes, well, she decided to show off her knowledge in front of her friends.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_08 " );	// She bought some fish from me and made these ... like them ...
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_09 " );	// Oh, never mind! The main thing is that all her dishes were from raw fish. Imagine raw!
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_10 " );	// Well, after all, it is clear to any sane person that fish needs to be either fried, or boiled, or stewed.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_11 " );	// How can you think of eating it raw? What a mess...
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_12 " );	// However, I digress.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_13 " );	// So, this especially gifted young lady bought some fish, made these very susy, I suppose, also incorrectly, called the guests and arranged a dinner party.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_14 " );	// Naturally, after dinner, everyone got very sick.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_15 " );	// And who is to blame that the lady has no brains?
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_16 " );	// Well, of course, fisherman Farim!
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_17 " );	// In general, she rang the whole city about the fact that I had low-quality fish.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_18 " );	// I even went to Lord Andre and complained to the governor.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_19 " );	// Fortunately, Lord Andre turned out to be a smart man and did not listen to her.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_20 " );	// You bet: the whole city has been eating my fish for years, no complaints, and suddenly some stupid su... seproducer yelled 'He has poor quality fish!'. That's shala... Shalanda!
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_21 " );	// However, most of the townspeople listened to this idiot.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_22 " );	// Someone even began to accuse me that I add some kind of gemeo to the fish, and that because of this gemeo their gills will then grow.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_23 " );	// In a word, now I'm sitting with fish, but without clients and gold.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_99_24 " );	// Did you want something?
	Info_ClearChoices(dia_farim_recrdtsugg);
	Info_AddChoice(dia_farim_recrdtsugg, " No, just asking. " ,dia_farim_recrdtsugg_no);
	Info_AddChoice(dia_farim_recrdtsugg, " I'll buy your fish. " ,dia_farim_recrdtsugg_yes);
};

func void dia_farim_recrdtsugg_no()
{
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_No_15_00 " );	// Nothing, just wondering.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_No_99_01 " );	// Ahh... and I already thought... okay then, come on!
	AI_StopProcessInfos(self);
};

func void dia_farim_recrdtsugg_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_Yes_15_00 " );	// I'll buy your fish.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_Yes_99_01 " );	// Oh, no problem. How much would you like? One, two? If you buy five at once, I'll give you a discount!
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_Yes_15_02 " );	// You misunderstood me. I will buy ALL your fish.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_Yes_99_03 " );	// Uh... all the fish? But you can't eat it alone! She's sporting!
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_Yes_15_04 " );	// And I'm not alone. There are a lot of us. I need a permanent food supplier for my camp.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_Yes_99_05 " );	// Do you have a camp? Where?
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_Yes_15_06 " );	// Near Onar's farm.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_Yes_99_06 " );	// Not bad! I'll be only too happy to help you.
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_Yes_15_07 " );	// You can give the fish to my manager. By the way, how many fish can you provide for the camp per day and how much do you want for it?
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_Yes_99_07 " );	// It depends on the catch. But I can provide a dozen fish a day stably. And the price is standard - five coins per fish.
	AI_Output(other,self, " DIA_FARIM_RecrDTSugg_Yes_15_08 " );	// Agreed.
	AI_Output(self,other, " DIA_FARIM_RecrDTSugg_Yes_99_08 " );	// Well then, see you at the camp.
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	FARIMRECRUITEDDT = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Farim will provide my camp with fish. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_FARIM_INTOWER (C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 22;
	condition = dia_farim_intower_condition;
	information = dia_farim_intower_info;
	permanent = TRUE;
	description = " How does it bite? " ;
};

func int dia_farim_intower_condition()
{
	if (( FARIMRECRUITEDDT  ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_farim_intower_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Как клюет?
	AI_Output(self,other, " DIA_Farim_InTower_01_01 " );	// Great! And most importantly, I again have someone to sell the catch to.
};

instance DIA_FARIM_INTOWER_ORCKAP (C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 22;
	condition = dia_farim_intower_orckap_condition;
	information = dia_farim_intower_orckap_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};

func int dia_farim_intower_orckap_condition()
{
	if (( FARIMRECRUITEDDT  ==  TRUE ) && ( CAPITELORCATC  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_farim_intower_orckap_info()
{
	AI_Output(other,self, " DIA_Farim_InTower_OrcKap_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Farim_InTower_OrcKap_01_01 " );	// Oh boy. If I didn't agree to your offer, I'd be dead by now. Thank you!
};
