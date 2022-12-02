

instance DIA_Addon_Greg_NW_EXIT(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 999;
	condition = DIA_Addon_Greg_NW_EXIT_Condition;
	information = DIA_Addon_Greg_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToGregNW = TRUE;
};

instance DIA_Addon_Greg_NW_PICKPOCKET(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 900;
	condition = DIA_Addon_Greg_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Greg_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 111 , 666 );
};

func void DIA_Addon_Greg_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Greg_NW_PICKPOCKET);
};

func void DIA_Addon_Greg_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_NW_PICKPOCKET);
};

instance DIA_Addon_Greg_NW_Hallo(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Hallo_Condition;
	information = DIA_Addon_Greg_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_Hallo_Condition()
{
	if(GregLocation == Greg_Farm1)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_Hallo_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_01_00 " );	// Pst! Hey, you! Come here.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//В чем дело?
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_01_02 " );	// Are you going to the city? Do you have business there?
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_01_03 " );	// Look, you look like a smart guy. I'm sure you'll go far in life.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_01_04 " );	// You're not stupid, I can see it in your eyes.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_01_05 " );	// You probably want to earn a handful of gold coins, don't you?
	PlayerTalkedToGregNW = TRUE;
	SC_MeetsGregTime = 1;
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, " I must go. " ,DIA_Addon_Greg_NW_Hallo_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, " Enough talking! Say whatever you want. " ,DIA_Addon_Greg_NW_Hallo_schleim);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, " You don't seem to have any money. " ,DIA_Addon_Greg_NW_Hallo_vorsicht);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, " Are you hiding from someone? " ,DIA_Addon_Greg_NW_Hallo_hide);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, " Why not? " ,DIA_Addon_Greg_NW_Hallo_ja);
};

func void DIA_Addon_Greg_NW_Hallo_weg()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Hallo_weg_15_00 " );	// I have to go.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_weg_01_01 " );	// So you refuse to help me, right? Okay, I'll remember that. We'll meet Again!
	AI_StopProcessInfos(self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Hallo_ja_15_00 " );	// Why not?
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_ja_01_01 " );	// You must forgive the ignorant old sailor! I am a stranger in your area and do not know the local laws.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_ja_01_02 " );	// Therefore, I had to experience the hard way how the guards meet ordinary travelers in this city.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_ja_01_03 " );	// And now I need to get into the city, and I don't know how to do it.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_ja_01_04 " );	// I have an extremely important business in the city. My client will not tolerate a delay even for a day!
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_ja_01_05 " );	// You'll help me get past the guards, won't you?
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW, " An odd man with an eyepatch wants me to help him get into town. I have to find a way for him to get past the guards. " );
	MIS_Addon_Greg_BringMeToTheCity = LOG_Running;
};

func void DIA_Addon_Greg_NW_Hello_caution()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Hallo_vorsicht_15_00 " );	// You don't seem to have any money.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_vorsicht_01_01 " );	// Well, of course, I don't move like you in the upper circles of society.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_vorsicht_01_02 " );	// But you wouldn't mind increasing your fortune by the small amount I could give you, would you?
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_vorsicht_01_03 " );	// Well, what do you say? Can I count on you?
};

func void DIA_Addon_Greg_NW_Hello_slime()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Hallo_schleim_15_00 " );	// Enough talk! Say what you want.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_schleim_01_01 " );	// See, this is exactly what I mean.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_schleim_01_02 " );	// Pretty words alone won't get you anywhere.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_schleim_01_03 " );	// I knew I was dealing with a real business man.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_schleim_01_04 " );	// Surely this business man wouldn't turn down a small reward?
};

func void DIA_Addon_Greg_NW_Hallo_hide()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Hallo_hide_15_00 " );	// Are you hiding from someone?
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_hide_01_01 " );	// No, of course not! What an absurdity! I just like to stand among the trees so the wind doesn't blow in my face.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Hallo_hide_01_02 " );	// But let's talk about you. Are you taking a job?
};


instance DIA_Addon_Greg_NW_City Guards (C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Stadtwacht_Condition;
	information = DIA_Addon_Greg_NW_City Guards_Info;
	permanent = TRUE;
	description = " About the city guards... " ;
};


func int DIA_Addon_Greg_NW_City Guards_Condition()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
	return  FALSE ;
};


var int DIA_Addon_Greg_NW_City Guards_ChoiceClose_geld;
var int DIA_Addon_Greg_NW_City Guards_ChoiceClose_Schein;
var int DIA_Addon_Greg_NW_City Guards_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_City Guards_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Stadtwachen_15_00 " );	// About city guards...
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_01_01 " );	// Yes? Do you have an idea?
	Info_ClearChoices(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, " I have to think again. " ,DIA_Addon_Greg_NW_Stadtwachen_nochnicht);
	if (DIA_Addon_Greg_NW_Stadtwacht_ChoiceClose_geld ==  FALSE )
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, " Have you thought about bribery? " ,DIA_Addon_Greg_NW_Stadtwachen_geld);
	};
	if ((DIA_Addon_Greg_NW_Stadtwacht_ChoiceClose_Schein ==  FALSE ) && Npc_HasItems(other,ItWr_Passierschein))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, " I have a city pass. " ,DIA_Addon_Greg_NW_Stadtwachen_Schein);
	};
	if((MIS_Addon_Lester_PickForConstantino != 0) && (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, " You can get into town by saying you're a herbalist. " ,DIA_Addon_Greg_NW_Stadtwachen_constantino);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) || Npc_HasItems(other,ITAR_Bau_M))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, " They'll let you through if you're wearing peasant clothes. " ,DIA_Addon_Greg_NW_Stadtwachen_klamotten);
	};
};

func void DIA_Addon_Greg_NW_City Guards_Clothes()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00 " );	// They'll let you through if you're wearing peasant clothes.
	if(Npc_HasItems(other,ITAR_Bau_L))
	{
		B_GiveInvItems(other,self,ITAR_Bau_L,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITAR_Bau_M,1);
	};
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01 " );	// This is exactly what I need! I knew I could rely on you, mate.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02 " );	// If I dress like a local village dork, no one will pay attention to me.
	if(Npc_HasItems(self,ITAR_Bau_L))
	{
		AI_EquipArmor(self,ITAR_Bau_L);
	}
	else
	{
		AI_EquipArmor(self,ITAR_Bau_M);
	};
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03 " );	// Great! Here is your reward.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	B_GivePlayerXP(XP_Greg_NW_GiveBauArmor);
	AI_Output(other,self, " DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04 " );	// What?! Pathetic fifty gold pieces? You must be joking.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05 " );	// Gold is not the most important thing in the world, my friend. Take for now what I offer you.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06 " );	// I have a premonition that we will meet again soon.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07 " );	// And who knows, maybe I'll be able to repay you a favor for a favor. Take care!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	B_LogEntry(TOPIC_Addon_Greg_NW, " I gave him the clothes of a peasant. He can walk into town in them. " );
	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};

func void DIA_Addon_Greg_NW_City Guards_not_yet()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00 " );	// I have to think some more.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01 " );	// Good. But hurry, I don't have much time.
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Greg_NW_Stadtwacht_Schein()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00 " );	// I have a city pass.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01 " );	// (sarcastically) Yeah. Are you saying that I should pass myself off as a citizen?
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02 " );	// Look at me boy! Not even the worst idiot would believe it.
	DIA_Addon_Greg_NW_Stadtwacht_ChoiceClose_Schein = TRUE ;
};

func void DIA_Addon_Greg_NW_Stadtwacht_constantino()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00 " );	// You can get into town by saying you're a herb gatherer.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01 " );	// What? Do I look like a man who picks flowers in the forests?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};

func void DIA_Addon_Greg_NW_City Guards_Money()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_Stadtwachen_geld_15_00 " );	// Have you thought about bribery?
	AI_Output(self,other, " DIA_Addon_Greg_NW_Stadtwachen_geld_01_01 " );	// If I could bribe the guards, I'd be in town by now.
	DIA_Addon_Greg_NW_Stadtwacht_ChoiceClose_geld = TRUE ;
};


instance DIA_Addon_Greg_NW_PERM(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_PERM_Condition;
	information = DIA_Addon_Greg_NW_PERM_Info;
	permanent = TRUE;
	description = " One more thing... " ;
};


func int DIA_Addon_Greg_NW_PERM_Condition()
{
	if(((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//Еще кое-что...
	AI_Output(self,other, " DIA_Addon_Greg_NW_PERM_01_01 " );	// Listen, son. I have urgent business.
	AI_Output(self,other, " DIA_Addon_Greg_NW_PERM_01_02 " );	// We'll talk later. Clear?
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_MeetGregSecondTime(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information = DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_MeetGregSecondTime_01_00 " );	// Just look!
	if(MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_MeetGregSecondTime_01_01 " );	// Farmer boy.
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_MeetGregSecondTime_01_02 " );	// The boy who so rudely refused to help me. So we meet again...
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_Running)
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_MeetGregSecondTime_01_03 " );	// (angrily) I thought you wanted to help me! And you just ran away.
		AI_Output(self,other, " DIA_Addon_Greg_NW_MeetGregSecondTime_01_04 " );	// You thought I'd be stuck there, right?
		AI_Output(self,other, " DIA_Addon_Greg_NW_MeetGregSecondTime_01_05 " );	// Well, this proves once again that no one can help you but yourself. But this time, you won't just walk away from me.
	};
	AI_Output(self,other, " DIA_Addon_Greg_NW_MeetGregSecondTime_01_06 " );	// You're just in time.
	SC_SawGregInTaverne = TRUE;
};


instance DIA_Addon_Greg_NW_wer(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_wer_Condition;
	information = DIA_Addon_Greg_NW_wer_Info;
	description = " Who are you anyway? " ;
};


func int DIA_Addon_Greg_NW_wer_Condition()
{
	if(GregLocation >= Greg_Taverne)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_wer_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_wer_15_00 " );	// Who are you anyway?
	AI_Output(self,other, " DIA_Addon_Greg_NW_wer_01_01 " );	// It's none of your business.
	AI_Output(self,other, " DIA_Addon_Greg_NW_wer_01_02 " );	// If I wanted to introduce myself to you, I probably would have done it already, right?
};


instance DIA_Addon_Greg_NW_was(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_was_Condition;
	information = DIA_Addon_Greg_NW_was_Info;
	description = " So what do you want from me? " ;
};


func int DIA_Addon_Greg_NW_was_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void B_Greg_Search_Dexter()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_Search_Dexter_01_00 " );	// I need to find one person. It is not in the city, and no one knows where to look for it either.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Search_Dexter_01_01 " );	// He is skinny, his hair is black, and he wears red colored armor.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Search_Dexter_01_02 " );	// As far as I know, he was a prisoner in a colony. And his name seems to start with the letter 'D'.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW, " The man with the eyepatch is looking for someone whose name starts with 'D'. " );
	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_15_00 " );	// What do you want from me?
	if(MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_was_15_01 " );	// Are you still in trouble with the city guards?
		AI_Output(self,other, " DIA_Addon_Greg_NW_was_01_02 " );	// (threateningly) YOU'RE about to get in trouble, jerk.
	};
	B_Greg_Search_Dexter();
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was, " Are you talking about Diego? " ,DIA_Addon_Greg_NW_was_Diego);
	if((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was, " Do you need Dexter? " ,DIA_Addon_Greg_NW_was_Dexter);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_was, " Don't know anyone who fits this description. " ,DIA_Addon_Greg_NW_was_no);
};

func void DIA_Addon_Greg_NW_was_GregUnsicher()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_GregUnsicher_01_00 " );	// Maybe so. I don't remember his name...
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_GregUnsicher_01_01 " );	// I need to see it to know.
};

func void DIA_Addon_Greg_NW_was_UnNun()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_UnNun_15_00 " );	// Anything else?
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_UnNun_01_01 " );	// Yes, mister talker. There is something else.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_UnNun_01_02 " );	// I need a weapon. I need provisions. Gold won't hurt me either.
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was, " I can't help you. " ,DIA_Addon_Greg_NW_was_NoHelp);
	Info_AddChoice(DIA_Addon_Greg_NW_was, " Provisions? You're in the tavern! " ,DIA_Addon_Greg_NW_was_Orlan);
	Info_AddChoice(DIA_Addon_Greg_NW_was, " Weapons? Weapons can be bought from mercenaries. " ,DIA_Addon_Greg_NW_was_SLD);
	Info_AddChoice(DIA_Addon_Greg_NW_was, " Here's ten gold for you. " ,DIA_Addon_Greg_NW_was_HierGold);
	Info_AddChoice(DIA_Addon_Greg_NW_was, " Couldn't you buy weapons in the city? " ,DIA_Addon_Greg_NW_was_Waffenhaendler);
	Info_AddChoice(DIA_Addon_Greg_NW_was, " Gold? We all need gold. " ,DIA_Addon_Greg_NW_was_Gold);
};

func void DIA_Addon_Greg_NW_was_NoHelp()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_NoHelp_15_00 " );	// I can't help you.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_NoHelp_01_01 " );	// (angrily) No, you don't WANT to help me.
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_was_NoHelp_01_02 " );	// The second time you refuse to comply with my request.
		AI_Output(self,other, " DIA_Addon_Greg_NW_was_NoHelp_01_03 " );	// My advice to you: try to make sure that I don't see you again.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_was_NoHelp_01_04 " );	// I'll remember this, rest assured.
	};
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};

func void DIA_Addon_Greg_NW_was_Gold()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_Gold_15_00 " );	// Gold? We all need gold.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_Gold_01_01 " );	// Possibly. But what would you do if you had it? I'm sure you would take him to the taverns and brothels.
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_Gold_15_02 " );	// And of course you have better ideas...
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_Gold_01_03 " );	// Yes, you would crawl under a stone for fear if you found out who I am.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_Gold_01_04 " );	// So stop talking or I'll cut off your restless tongue.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_Waffenhaendler_15_00 " );	// Couldn't you buy weapons in the city?
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_Waffenhaendler_01_01 " );	// Are you kidding? City merchants sell one junk!
};

func void DIA_Addon_Greg_NW_was_HierGold()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_HierGold_15_00 " );	// Here's ten gold pieces for you.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_HierGold_01_01 " );	// (laughs) You can keep your miserable savings. I have a better idea.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_HierGold_01_02 " );	// There's a cave not far from here. This is one of those places where I once buried my treasures.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_HierGold_01_03 " );	// The cave is too dangerous for me. I want you to help me.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW, " I offered gold to the man with the eyepatch, but he refused. I must go with him to his cave. " );
	MIS_Addon_Greg_RakeCave = LOG_Running;
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_SLD_15_00 " );	// Weapon? Weapons can be bought from mercenaries.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_SLD_01_01 " );	// Interesting. I have already heard that fat man Onar hired guys for protection.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_SLD_01_02 " );	// Not bad for a land rat.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_SLD_01_03 " );	// Yes, that's a good idea. I think I'll really pay them a visit.
};

func void DIA_Addon_Greg_NW_was_Orlan()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_Orlan_15_00 " );	// Provision? You are in a tavern!
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_Orlan_01_01 " );	// The fool innkeeper won't give you a crumb until you pay him.
};

func void DIA_Addon_Greg_NW_was_no()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_no_15_00 " );	// I don't know anyone who fits this description.
	AI_Output(self,other, " DIA_Addon_Greg_NW_was_no_01_01 " );	// I knew it.
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Diego()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_Diego_15_00 " );	// Are you talking about Diego?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Dexter()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_was_Dexter_15_00 " );	// Do you need Dexter?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};


instance DIA_Addon_Greg_NW_RakeCaveLos(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveLos_Info;
	description = " Let's go to your cave. " ;
};


func int DIA_Addon_Greg_NW_RakeCaveLos_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_RakeCaveLos_15_00 " );	// Let's go to your cave.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCaveLos_01_01 " );	// Follow me.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void B_Greg_GoNow()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCaveThere_01_03 " );	// Well, what are you waiting for? Go inside and get your things.
};


instance DIA_Addon_Greg_NW_RakeCaveThere(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCaveThere_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCaveThere_01_00 " );	// Well, buddy, here's the cave.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCaveThere_01_01 " );	// Here's a pickaxe.
	B_GiveInvItems(self,other,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCaveThere_01_02 " );	// I buried my stuff somewhere inside. The place is marked with a cross.
	B_Greg_GoNow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//А как же ты?
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCaveThere_01_05 " );	// Someone has to protect the rear. Now, go inside!
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW, " This guy wants me to get his things out of the cave. He buried them and marked the place with a cross. He gave me a pick to work with. " );
	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay();
};


instance DIA_Addon_Greg_NW_RakeCavePlundered(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information = DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition()
{
	if(((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay() - 2)) || (RAKEPLACE[1] == TRUE)) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_01_00 " );	// What were you doing there for so long? Did you find what I asked you?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered, " Yes, I dug up a purse of gold. " ,DIA_Addon_Greg_NW_RakeCavePlundered_gold);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Нет.",DIA_Addon_Greg_NW_RakeCavePlundered_No);
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_No()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//Нет.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01 " );	// Trying my patience, son?
		AI_Output(other,self, " DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02 " );	// Uh... there was nothing there.
	};
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03 " );	// A thousand devils! I knew it! I got ahead of myself again.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04 " );	// Okay. I have to go. See you.
	AI_StopProcessInfos(self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};


var int B_Greg_RakePlaceBriefing_OneTime;

func void B_Greg_RakePlaceBriefing()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakePlaceBriefing_01_00 " );	// So, let's see... There is a small island on the lake with two waterfalls.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakePlaceBriefing_01_01 " );	// There are two more places in the upper pastures where I buried treasure.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakePlaceBriefing_01_02 " );	// One is behind the farm located there, and the second is near the entrance to the passage, by the waterfall.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakePlaceBriefing_01_03 " );	// A staircase leads from the upper pastures to the fields of Onar.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakePlaceBriefing_01_04 " );	// There's another cache in the valley she descends into.
	if(B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Greg_NW, " The man told me that there are several places where he buried his things: 1) On a small island in a lake with two waterfalls. 2) In the upper pasture behind the farm. 3) At the waterfalls near the gate of the passage. 4) In the valley below the stairs leading from the upper pastures to the landowner's fields. I must find all his buried things. He will be waiting for me at the crossroads in the fields. " );
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_gold()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00 " );	// Yes, I dug up a purse of gold.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01 " );	// (greedily) Give it here.
	if(Npc_HasItems(other,ItSe_GoldPocket25) || (Npc_HasItems(other,ItMi_Gold) >= 25))
	{
		if(B_GiveInvItems(other,self,ItSe_GoldPocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Держи.
		}
		else if(B_GiveInvItems(other,self,ItMi_Gold,25))
		{
			AI_Output(other,self, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03 " );	// I opened it, there were 25 gold pieces inside. Here they are.
		};
		AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04 " );	// Very good.
		AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05 " );	// From you, it turns out, there may be at least some sense.
		AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06 " );	// Okay, listen carefully. There are several other places where I have buried my things. And I want you to bring them to me.
		B_Greg_RakePlaceBriefing();
		Greg_SuchWeiter = TRUE;
		AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07 " );	// I'll be waiting for you at the crossroads in the fields of Onar. Don't let me down - you'll regret it.
		AI_StopProcessInfos(self);
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_GivePlayerXP(XP_Addon_RakeCavePlundered);
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08 " );	// I don't have anything anymore.
		AI_Output(self,other, " DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09 " );	// Shit! Should I force you to hand over my things by force?
		AI_StopProcessInfos(self);
		MIS_Addon_Greg_RakeCave = LOG_FAILED;
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Addon_Greg_NW_LakeCave(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 100;
	condition = DIA_Addon_Greg_NW_LakeCave_Condition;
	information = DIA_Addon_Greg_NW_LakeCave_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_LakeCave_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000) && (Greg_SuchWeiter == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_LakeCave_Info()
{
	B_Greg_GoNow();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_WhereTreasures(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 10;
	condition = DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information = DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent = TRUE;
	description = " Say again, where did you bury your stuff? " ;
};

func int DIA_Addon_Greg_NW_WhereTreasures_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_WhereTreasures_15_00 " );	// Repeat, where did you bury your things?
	B_Greg_RakePlaceBriefing();
};


instance DIA_Addon_Greg_NW_AllTreasures(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 10;
	condition = DIA_Addon_Greg_NW_AllTreasures_Condition;
	information = DIA_Addon_Greg_NW_AllTreasures_Info;
	permanent = FALSE;
	description = " Are these all your treasures? " ;
};

func int DIA_Addon_Greg_NW_AllTreasures_Condition()
{
	if(Greg_SuchWeiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_AllTreasures_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_AllTreasures_01_00 " );	// Are these all your treasures?
	AI_Output(self,other, " DIA_Addon_Greg_NW_AllTreasures_01_01 " );	// Of course not! I managed to hide a lot for a rainy day.
	AI_Output(self,other, " DIA_Addon_Greg_NW_AllTreasures_01_02 " );	// But trust me, it's better not to approach those caches at all.
	AI_Output(other,self, " DIA_Addon_Greg_NW_AllTreasures_01_03 " );	// Why else?
	AI_Output(self,other, " DIA_Addon_Greg_NW_AllTreasures_01_04 " );	// Heh... (grimly) Because death itself guards them, mate!
	AI_Output(other,self, " DIA_Addon_Greg_NW_AllTreasures_01_05 " );	// Ah, well, that certainly explains a lot.
};

instance DIA_Addon_Greg_NW_PermTaverne(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 99;
	condition = DIA_Addon_Greg_NW_PermTaverne_Condition;
	information = DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent = TRUE;
	description = " One more thing... " ;
};

func int DIA_Addon_Greg_NW_PermTaverne_Condition()
{
	if(((GregLocation == Greg_Bigcross) && (Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) == FALSE) && (((Npc_GetDistToWP(self,"BIGCROSS") < 1000) == FALSE) || (MIS_Addon_Greg_RakeCave == LOG_SUCCESS))) || ((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WasWillstDu)))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_PermTaverne_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//Еще кое-что...
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_PermTaverne_01_01 " );	// First bring me all my things. Then we'll talk.
	}
	else if(MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_PermTaverne_01_02 " );	// Of course, I'm grateful that you helped me. But that doesn't make us friends. Do you understand what I mean?
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_PermTaverne_01_03 " );	// We've been talking for too long.
	};
};


instance DIA_Addon_Greg_NW_Bigcross(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Bigcross_Condition;
	information = DIA_Addon_Greg_NW_Bigcross_Info;
	description = " How are you? " ;
};


func int DIA_Addon_Greg_NW_Bigcross_Condition()
{
	if((GregLocation == Greg_Bigcross) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_Bigcross_Info()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED) || (MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_Bigcross_01_00 " );	// It's our Mr. Unreliability!
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//Как дела?
	AI_Output(self,other, " DIA_Addon_Greg_NW_Bigcross_01_02 " );	// So-so. The mercenaries were of little use.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Bigcross_01_03 " );	// I expected them to be brave guys.
	AI_Output(self,other, " DIA_Addon_Greg_NW_Bigcross_01_04 " );	// But in reality it turned out that they were just talkative braggarts.
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_Bigcross_01_05 " );	// Well, did you find my things?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self, " DIA_Addon_Greg_NW_Bigcross_15_06 " );	// No, not yet.
			AI_Output(self,other, " DIA_Addon_Greg_NW_Bigcross_01_07 " );	// So hurry up! It's not that difficult.
		};
	};
};


instance DIA_Addon_Greg_NW_WhatWantFromSLD(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information = DIA_Addon_Greg_NW_WhatWantFromSLD_Info;
	description = " What did you need from the mercenaries? " ;
};


func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_WhatWantFromSLD_15_00 " );	// What did you want from the mercenaries?
	if(SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter();
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Greg_NW_WhatWantFromSLD_01_01 " );	// I already told you. I'm looking for a man in red armor.
		AI_Output(self,other, " DIA_Addon_Greg_NW_WhatWantFromSLD_01_02 " );	// But those cretins didn't even know who I was talking about.
	};
};


instance DIA_Addon_Greg_NW_DexterFound(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_DexterFound_Condition;
	information = DIA_Addon_Greg_NW_DexterFound_Info;
	description = " I think you need a man named Dexter. " ;
};

func int DIA_Addon_Greg_NW_DexterFound_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross) && ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE)))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_DexterFound_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_DexterFound_15_00 " );	// I think you need a man named Dexter.
	AI_Output(self,other, " DIA_Addon_Greg_NW_DexterFound_01_01 " );	// Damn, how do I know his name?!
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound, " I was just guessing. " ,DIA_Addon_Greg_NW_DexterFound_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound, " I can help you find it. " ,DIA_Addon_Greg_NW_DexterFound_together);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound, " I think I can help you find it. " ,DIA_Addon_Greg_NW_DexterFound_wo);
};

func void DIA_Addon_Greg_NW_DexterFound_weg()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_DexterFound_weg_15_00 " );	// I was just guessing.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_DexterFound_wo_15_00 " );	// I think I can help you find it.
	AI_Output(self,other, " DIA_Addon_Greg_NW_DexterFound_wo_01_01 " );	// Really? And where is he now?
	AI_Output(other,self, " DIA_Addon_Greg_NW_DexterFound_wo_15_02 " );	// Not far from here.
	AI_Output(other,self, " DIA_Addon_Greg_NW_DexterFound_wo_15_03 " );	// Looks like he became the leader of a gang of bandits.
	AI_Output(self,other, " DIA_Addon_Greg_NW_DexterFound_wo_01_04 " );	// Ha! Yes, it looks like he is.
	AI_Output(self,other, " DIA_Addon_Greg_NW_DexterFound_wo_01_05 " );	// I knew that coward was hiding around here somewhere.
	AI_Output(self,other, " DIA_Addon_Greg_NW_DexterFound_wo_01_06 " );	// Now all I have to do is search all the hideouts and hideouts in the area.
	AI_Output(self,other, " DIA_Addon_Greg_NW_DexterFound_wo_01_07 " );	// I'll find this bastard, and I don't need your help.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_DexterFound_together_15_00 " );	// I can help you find it.
	AI_Output(self,other, " DIA_Addon_Greg_NW_DexterFound_together_01_01 " );	// No, I'll go alone. I have a personal score with him.
};

instance DIA_Addon_Greg_NW_CaughtDexter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter_Info;
	important = TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_IsDead(Dexter) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_CaughtDexter_01_00 " );	// (loudly) So where is that pig?
	AI_Output(other,self, " DIA_Addon_Greg_NW_CaughtDexter_15_01 " );	// Who, leader? Right here.
	AI_Output(self,other, " DIA_Addon_Greg_NW_CaughtDexter_01_02 " );	// Then get out of my way!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DexterHouseRun");
};

instance DIA_Addon_Greg_NW_WodennNu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WodennNu_Condition;
	information = DIA_Addon_Greg_NW_Info_Info;
	important = TRUE;
};

func int DIA_Addon_Greg_NW_WodennNu_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_IsDead(Dexter) == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WodennNu_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_WodennNu_01_00 " );	// And where did he go?
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//Был здесь.
	AI_Output(self,other, " DIA_Addon_Greg_NW_WodennNu_01_02 " );	// Well, go and find him!
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_NW_CaughtDexter2(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important = TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_DexterFound) && (DexterIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info()
{
	AI_Output(self,other, " DIA_Addon_Greg_NW_CaughtDexter2_01_00 " );	// Yeah. So Dexter got his?
	AI_Output(other,self, " DIA_Addon_Greg_NW_CaughtDexter2_15_01 " );	// Looks like he's dead.
	AI_Output(self,other, " DIA_Addon_Greg_NW_CaughtDexter2_01_02 " );	// I can't say that I feel sorry for him. Check what he had with him.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Addon_Greg_NW_RavensLetter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RavensLetter_Condition;
	information = DIA_Addon_Greg_NW_RavensLetter_Info;
	description = " I only found this letter. " ;
};

func int DIA_Addon_Greg_NW_RavensLetter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_CaughtDexter2) && Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon) && (DexterIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_RavensLetter_15_00 " );	// I only found this letter.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Покажи.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Greg_NW_RavensLetter_01_02 " );	// Damn it! This won't help me at all.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RavensLetter_01_03 " );	// You shouldn't have killed him just like that.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RavensLetter_01_04 " );	// Tell me, do you happen to know how to get behind the mountain range in the northeast of Khorinis?

	if ((Nefarius_NW.aivar[AIV_TalkedToPlayer] ==  TRUE ) && (Saturas_NW.aivar[AIV_TalkedToPlayer] ==  TRUE ))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_RavensLetter_15_05 " );	// Possibly through a portal that the waterbenders discovered.
		AI_Output(self,other, " DIA_Addon_Greg_NW_RavensLetter_01_06 " );	// What is this nonsense?
		AI_Output(self,other, " DIA_Addon_Greg_NW_RavensLetter_01_07 " );	// Waterbenders... Do you have any better ideas?
	};

	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//Нет.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RavensLetter_01_09 " );	// (sighs) So I'm stuck here.
	AI_Output(self,other, " DIA_Addon_Greg_NW_RavensLetter_01_10 " );	// Dexter was my last hope.
};


instance DIA_Addon_Greg_NW_WasWillstDu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information = DIA_Addon_Greg_NW_WasWillstDu_Info;
	description = " What did you want from Dexter? " ;
};

func int DIA_Addon_Greg_NW_WasWillstDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_RavensLetter))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_WasWillstDu_15_00 " );	// What did you want from Dexter?
	AI_Output(self,other, " DIA_Addon_Greg_NW_WasWillstDu_01_01 " );	// I came here from the northeast mountains. And I want to go back there.
	AI_Output(self,other, " DIA_Addon_Greg_NW_WasWillstDu_01_02 " );	// I was hoping the bastard would tell me how to get there without a ship.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu, " What's beyond those mountains? " ,DIA_Addon_Greg_NW_WasWillstDu_da);

	if (Skip_NW.aivar[AIV_TalkedToPlayer] ==  TRUE )
	{
		Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu, " I met a pirate named Skip near town. " ,DIA_Addon_Greg_NW_WasWillstDu_Skip);
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_WasWillstDu_da_15_00 " );	// And what is behind these mountains?
	AI_Output(self,other, " DIA_Addon_Greg_NW_WasWillstDu_da_01_01 " );	// Uh, you shouldn't even try to get in there.
	AI_Output(self,other, " DIA_Addon_Greg_NW_WasWillstDu_da_01_02 " );	// The lands are harsh there. A man like you won't last long there.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00 " );	// Not far from the city, I met a pirate named Skip.
	AI_Output(self,other, " DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01 " );	// Ah, that idiot. I've been waiting for him for three days, why didn't he show up sooner?
	AI_Output(self,other, " DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02 " );	// Nothing, I'll show him what's what.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Addon_Greg_NW_FoundTreasure(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information = DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent = TRUE;
	description = " I found all the buried things. " ;
};

func int DIA_Addon_Greg_NW_FoundTreasure_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_15_00 " );	// I found all the buried things.
	AI_Output(self,other, " DIA_Addon_Greg_NW_FoundTreasure_01_01 " );	// Then you should have about a hundred gold pieces, a golden cup, a silver dish, and an amulet! Give them here.
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure, " I don't have them with me. " ,DIA_Addon_Greg_NW_FoundTreasure_not);

	if ((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >=  100 )) && Npc_HasItems(other,ItMi_CupGold) && Npc_HasItems(other,ItMi_SilverChalice) && Npc_HasItems(other,ItMi_Point_01))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure, " Here are your things. " ,DIA_Addon_Greg_NW_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_ja()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_00 " );	// Here are your things.

	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_01 " );	// Wallet.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_02 " );	// One hundred gold.
	};
	if(B_GiveInvItems(other,self,ItMi_CupGold,1))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_03 " );	// Golden bowl.
	};
	if(B_GiveInvItems(other,self,ItMi_SilverChalice,1))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_04 " );	// Silver bowl.
	};
	if(B_GiveInvItems(other,self,ItAm_Prot_Point_01,1))
	{
		AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_ja_15_05 " );	// And an amulet.
	};
	AI_Output(self,other, " DIA_Addon_Greg_NW_FoundTreasure_ja_01_06 " );	// Very good! I see you were smart enough not to take my stuff.
	AI_Output(self,other, " DIA_Addon_Greg_NW_FoundTreasure_ja_01_07 " );	// Here's your share.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not()
{
	AI_Output(other,self, " DIA_Addon_Greg_NW_FoundTreasure_not_15_00 " );	// I don't have them with me.
	AI_Output(self,other, " DIA_Addon_Greg_NW_FoundTreasure_not_01_01 " );	// Then hurry up and bring them to me before I get angry.
	AI_StopProcessInfos(self);
};
