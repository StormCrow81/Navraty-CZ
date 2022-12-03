
var int SkipElzaDay;
var int SkipOnWork;

instance DIA_Addon_Skip_EXIT(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 999;
	condition = DIA_Addon_Skip_EXIT_Condition;
	information = DIA_Addon_Skip_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_PICKPOCKET(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 900;
	condition = DIA_Addon_Skip_PICKPOCKET_Condition;
	information = DIA_Addon_Skip_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Skip_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 43 );
};

func void DIA_Addon_Skip_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET,Dialog_Back,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};

func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};


instance DIA_Addon_Skip_Hello(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Hello_Condition;
	information = DIA_Addon_Skip_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerTalkedToSkipNW == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_Hello_Info()
{
	AI_Output(self,other, " DIA_Addon_Skip_Hello_08_00 " );	// Well, well, who did that old Skip meet?
	AI_Output(self,other, " DIA_Addon_Skip_Hello_08_01 " );	// I know you!
	AI_Output(self,other, " DIA_Addon_Skip_Hello_08_02 " );	// Remember the bay near the city?
	AI_Output(other,self, " DIA_Addon_Skip_Hello_15_03 " );	// Skip, right?
	AI_Output(self,other, " DIA_Addon_Skip_Hello_08_04 " );	// I see I impressed you.
	AI_Output(self,other, " DIA_Addon_Skip_Hello_08_05 " );	// But I think I've seen your face somewhere else.
	AI_Output(self,other, " DIA_Addon_Skip_Hello_08_06 " );	// Of course!
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Skip_Hello_08_07 " );	// Not a complete resemblance, of course, but it's definitely you.
	AI_Output(self,other, " DIA_Addon_Skip_Hello_08_08 " );	// But don't be upset, mate. My face on the wanted poster doesn't look any better.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Addon_SkipADW_BaltramPaket(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 2;
	condition = DIA_Addon_SkipADW_BaltramPaket_Condition;
	information = DIA_Addon_SkipADW_BaltramPaket_Info;
	description = " I have a package for you from Baltram. " ;
};


func int DIA_Addon_SkipADW_BaltramPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_SkipADW_BaltramPaket_Info()
{
	AI_Output(other,self, " DIA_Addon_SkipADW_BaltramPaket_15_00 " );	// I have a package for you from Baltram.
	AI_Output(self,other, " DIA_Addon_SkipADW_BaltramPaket_08_01 " );	// Yeah, looks like this guy is really addicted to our rum.
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other, " DIA_Addon_SkipADW_BaltramPaket_08_02 " );	// Here, pass him two bottles. I drank the third while I was waiting for him.
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_Job(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 3;
	condition = DIA_Addon_Skip_Job_Condition;
	information = DIA_Addon_Skip_Job_Info;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Job_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_Job_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Skip_Job_08_01 " );	// I just got back from Khorinis and am now waiting for Greg to return.
};


instance DIA_Addon_Skip_ADW_GregGetroffen (C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 4;
	condition = DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information = DIA_Addon_Skip_ADW_GregGetroffen_Info;
	description = " I saw Greg in Khorinis. " ;
};


func int DIA_Addon_Skip_ADW_GregGetroffen_Condition()
{
	if ((PlayerTalkedToGregNW ==  TRUE ) && (GregIsBack ==  FALSE ) && Npc_KnowsInfo(other,DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_ADW_GregGetroffen_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_ADW_GregGetroffen_15_00 " );	// I saw Greg in Khorinis.
	AI_Output(self,other, " DIA_Addon_Skip_ADW_GregGetroffen_08_01 " );	// Really? Devil! Apparently, something went wrong.
	AI_Output(self,other, " DIA_Addon_Skip_ADW_GregGetroffen_08_02 " );	// He should have been back here on his ship a long time ago.
	AI_Output(self,other, " DIA_Addon_Skip_ADW_GregGetroffen_08_03 " );	// I guess I should go back to Khorinis and meet him...
	AI_Output(self,other, " DIA_Addon_Skip_ADW_GregGetroffen_08_04 " );	// No, probably not today. After all, I've just come from there.
	B_GivePlayerXP(XP_Ambient);
};

var int Skip_Transport_Variation;

instance DIA_Addon_Skip_Transport(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 99;
	condition = DIA_Addon_Skip_Transport_Condition;
	information = DIA_Addon_Skip_Transport_Info;
	permanent = TRUE;
	description = " Can you take me to Khorinis? " ;
};

func int DIA_Addon_Skip_Transport_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Skip_Job ) && ( self . aivar [ AIV_PARTYMEMBERS ] ==  FALSE )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_Transport_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_Transport_15_00 " );	// Can you take me to Khorinis?

	if(GregIsBack == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Skip_Transport_08_01 " );	// No, buddy. Now I'm not going anywhere. First I need to get myself a grog.
	}
	else if(Skip_Transport_Variation == 0)
	{
		AI_Output(self,other, " DIA_Addon_Skip_Transport_08_02 " );	// Are you crazy? We've lost the ship, mate!
		AI_Output(self,other, " DIA_Addon_Skip_Transport_08_03 " );	// I'm not going to risk our last lifeboat just because you're too lazy to drag your ass to Khorinis yourself!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Skip_Transport_08_04 " );	// Last answer: NO!
	};
};


instance DIA_Addon_Skip_Bandits(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Bandits_Condition;
	information = DIA_Addon_Skip_Bandits_Info;
	description = " What can you tell me about bandits? " ;
};


func int DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Bandits_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_Bandits_15_00 " );	// What can you tell me about bandits?
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_01 " );	// Bandits?! They are attacking us!
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_02 " );	// Why do you think we're building this fence?
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_03 " );	// We brought these bastards here ourselves.
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_04 " );	// At first we traded with them. And I'll tell you, friend, that they have so much gold that they don't know what to do with it!
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_05 " );	// They paid any price for a bottle of rum.
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_06 " );	// But the peaceful times are over. Now we have a war!
	AI_Output(other,self, " DIA_Addon_Erol_Bandits_15_06 " );	// What happened?
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_07 " );	// Those bastards didn't pay for the last shipment.
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_08 " );	// So I went to them to find out what happened to our gold.
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_09 " );	// But when I got to the swamp, those bastards attacked me!
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_10 " );	// But that's not all. They killed Angus and Hank, two of our best men.
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_11 " );	// My advice to you, kid: stay out of this swamp.
	AI_Output(self,other, " DIA_Addon_Skip_Bandits_08_12 " );	// Bandits attack anyone who looks richer than they are.
};


instance DIA_Addon_Skip_ArmorPrice(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_ArmorPrice_Condition;
	information = DIA_Addon_Skip_ArmorPrice_Info;
	description = " I need bandit armor. " ;
};


func int DIA_Addon_Skip_ArmorPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_ArmorPrice_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_ArmorPrice_15_00 " );	// I need bandit armor.
	AI_Output(self,other, " DIA_Addon_Skip_ArmorPrice_08_01 " );	// Do you want to go to the swamp? You are crazy!
	AI_Output(self,other, " DIA_Addon_Skip_ArmorPrice_08_02 " );	// Once they realize you're not one of them, you're done!
	AI_Output(other,self, " DIA_Addon_Skip_ArmorPrice_15_02 " );	// Do you know where I can find bandit armor?
	AI_Output(self,other, " DIA_Addon_Skip_ArmorPrice_08_03 " );	// (sighs) You can't just be talked out of it, right? OK then. We had a set of such armor.
	AI_Output(self,other, " DIA_Addon_Skip_ArmorPrice_08_04 " );	// He's probably still in Greg's cabin.
	AI_Output(self,other, " DIA_Addon_Skip_ArmorPrice_08_05 " );	// Maybe when Greg comes back you can buy armor from him...
	B_LogEntry(TOPIC_Addon_BDTRuestung, " Skip thinks the armor is in Greg's hut. " );
};


instance DIA_Addon_Skip_GregsHut(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_GregsHut_Condition;
	information = DIA_Addon_Skip_GregsHut_Info;
	permanent = FALSE;
	description = " Can you tell me how to get to his hut? " ;
};


func int DIA_Addon_Skip_GregsHut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_ArmorPrice) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_GregsHut_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_GregsHut_15_00 " );	// Can you tell me how to get to his hut?
	AI_Output(self,other, " DIA_Addon_Skip_GregsHut_08_01 " );	// Hey, hey, not so fast!
	AI_Output(self,other, " DIA_Addon_Skip_GregsHut_08_02 " );	// You're not going to dig into Greg's stuff, are you?
	AI_Output(self,other, " DIA_Addon_Skip_GregsHut_08_03 " );	// When Greg left, he left the key to the cabin with Francis and ordered him not to let anyone inside.
	B_LogEntry(TOPIC_Addon_BDTRuestung, " Francis has the key to the hut, but he has been ordered not to let anyone in. " );
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Skip_Francis(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Francis_Condition;
	information = DIA_Addon_Skip_Francis_Info;
	permanent = FALSE;
	description = " What do you think of Francis? " ;
};


func int DIA_Addon_Skip_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_Francis_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_Francis_15_00 " );	// What do you think about Francis?
	AI_Output(self,other, " DIA_Addon_Skip_Francis_08_01 " );	// This is our treasurer.
	AI_Output(self,other, " DIA_Addon_Skip_Francis_08_02 " );	// The captain trusts him. So he left Francis in charge.
	AI_Output(self,other, " DIA_Addon_Skip_Francis_08_03 " );	// But none of us take him seriously.
	AI_Output(self,other, " DIA_Addon_Skip_Francis_08_04 " );	// If you want to know more, talk to Samuel.
	AI_Output(self,other, " DIA_Addon_Skip_Francis_08_05 " );	// He has a lab in a small cave north of here.
	AI_Output(self,other, " DIA_Addon_Skip_Francis_08_06 " );	// There is no such person in the camp that Samuel would not know all the ins and outs ...
	B_LogEntry(TOPIC_Addon_BDTRuestung, " I should talk to Samuel. Perhaps he can help me. " );
};


instance DIA_Addon_Skip_Raven(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_Raven_Condition;
	information = DIA_Addon_Skip_Raven_Info;
	permanent = FALSE;
	description = " Have you ever seen a Raven? " ;
};


func int DIA_Addon_Skip_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_Raven_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_Raven_15_00 " );	// Have you ever seen Raven?
	AI_Output(self,other, " DIA_Addon_Skip_Raven_08_01 " );	// Yes, it happened. When Henry and I were on guard duty at the gate, we watched Raven station his men in the tower to the south.
	AI_Output(self,other, " DIA_Addon_Skip_Raven_08_02 " );	// You can throw a stone from it to our camp. (laughs) It is clear that they will spy on us.
	AI_Output(self,other, " DIA_Addon_Skip_Raven_08_03 " );	// I've also seen them deal with people who don't obey him.
	AI_Output(self,other, " DIA_Addon_Skip_Raven_08_04 " );	// With those who do not follow his orders to the last word, he has a short conversation.
	AI_Output(self,other, " DIA_Addon_Skip_Raven_08_05 " );	// Mark my words: don't mess with Raven.
};


instance DIA_Addon_Skip_AngusHank(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHank_Condition;
	information = DIA_Addon_Skip_AngusHank_Info;
	description = " Tell me about Angus and Hank. " ;
};


func int DIA_Addon_Skip_AngusHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_AngusHank_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_AngusnHank_15_00 " );	// Tell me about Angus and Hank.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_01 " );	// Angus and Hank were supposed to meet with the bandits near the camp.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_02 " );	// They had various goods with them. Everything that these creatures ordered from us.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_03 " );	// Steel, lockpicks and so on.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_04 " );	// But the guys didn't come back. Apparently, these pigs dealt with them!
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_05 " );	// Morgan and Bill went looking for it, but it didn't work.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_06 " );	// Bill is completely overwhelmed. She, Hank and Angus were friends.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_07 " );	// And he is still young, and it is not easy for him to endure the disappearance of his friends.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_08 " );	// However, life goes on. We will survive the loss of goods. (sighs) But they had grog with them...
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHank_08_09 " );	// At least twenty bottles!
	MIS_ADDON_SkipsGrog = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_SkipsGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_SkipsGrog, "The bandits didn't pay Skip's messengers for twenty bottles of grog. He wants them back! " );
	Log_AddEntry(TOPIC_Addon_SkipsGrog, " Angus and Hank were supposed to meet the bandits. They haven't been seen since. " );
	Log_AddEntry(TOPIC_Addon_SkipsGrog, " The search for Morgan and Bill was unsuccessful. " );
};


instance DIA_Addon_Skip_AngusHankDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankDead_Condition;
	information = DIA_Addon_Skip_AngusHankDead_Info;
	permanent = FALSE;
	description = " About Angus and Hank... " ;
};


func int DIA_Addon_Skip_AngusHankDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && !Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_AngusHankDead_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_AngusnHankDead_15_00 " );	// About Angus and Hank...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//Что?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Я их нашел.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Они мертвы.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHankDead_08_03 " );	// Killed... Poor fellows...
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHankDead_08_04 " );	// Well, that's to be expected.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHankDead_08_05 " );	// If you haven't already, tell Bill.
	AI_Output(self,other, " DIA_Addon_Skip_AngusnHankDead_08_06 " );	// But try to make it softer. He is still young.
};


instance DIA_Addon_Skip_AngusHankMurder(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankMurder_Condition;
	information = DIA_Addon_Skip_AngusHankMurder_Info;
	permanent = FALSE;
	description = " I know who killed Hank and Angus. " ;
};


func int DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Skip_AngusHankDead ) && ( SC_Knows_JuanMurderedAngus ==  TRUE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_AngusHankMurder_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_JuanMurder_15_00 " );	// I know who killed Hank and Angus.
	if(MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_Skip_AngusHankMurder_08_01 " );	// Good. But they are both dead. What's the difference now?
		AI_Output(self,other, " DIA_Addon_Skip_AngusHankMurder_08_02 " );	// Revenge hasn't made any pirate rich yet.
		AI_Output(self,other, " DIA_Addon_Skip_AngusHankMurder_08_03 " );	// I would like to get my grog back.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Skip_AngusHankMurder_08_04 " );	// I don't care who killed them. What's up with my grog?!
	};
};


instance DIA_Addon_Skip_Grog(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 9;
	condition = DIA_Addon_Skip_Grog_Condition;
	information = DIA_Addon_Skip_Grog_Info;
	permanent = TRUE;
	description = " About the grog... " ;
};


func int DIA_Addon_Skip_Grog_Condition()
{
	if(MIS_ADDON_SkipsGrog == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Grog_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_Grog_15_00 " );	// About the grog...
	if(Npc_HasItems(other,ItFo_Addon_Grog) >= 20)
	{
		Info_ClearChoices(DIA_Addon_Skip_Grog);
		Info_AddChoice(DIA_Addon_Skip_Grog,Dialog_Back,DIA_Addon_Skip_Grog_back);
		Info_AddChoice(DIA_Addon_Skip_Grog, " Here's twenty bottles for you. " ,DIA_Addon_Skip_Grog_geben);
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Skip_Grog_15_01 " );	// You've got twenty bottles missing, right?
		AI_Output(self,other, " DIA_Addon_Skip_Grog_08_02 " );	// Hell yes! All my stocks.
	};
};

func void DIA_Addon_Skip_Grog_back()
{
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_giving()
{
	AI_Output(other,self, " DIA_Addon_Skip_Grog_geben_15_00 " );	// Here's twenty bottles for you.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,20);
	B_LogEntry(TOPIC_Addon_SkipsGrog, " Skip got his twenty bottles of grog back and is now very happy. " );
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_SkipsGrog);
	AI_Output(self,other, " DIA_Addon_Skip_Grog_geben_08_01 " );	// What? Is it that simple?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//Ну...
	AI_Output(self,other, " DIA_Addon_Skip_Grog_geben_08_03 " );	// Okay, I'll pay for them.
	AI_Output(other,self, " DIA_Addon_Skip_Grog_geben_15_04 " );	// Maybe you have something more interesting than gold?
	AI_Output(self,other, " DIA_Addon_Skip_Grog_geben_08_05 " );	// Hmmm... (with interest) Let's see! I have this ring.
	AI_Output(self,other, " DIA_Addon_Skip_Grog_geben_08_06 " );	// I won it at dice in some dingy harbor tavern a couple of years ago.
	AI_Output(self,other, " DIA_Addon_Skip_Grog_geben_08_07 " );	// The guy who lost it said it was magical. I don't know if this is true.
	AI_Output(self,other, " DIA_Addon_Skip_Grog_geben_08_08 " );	// If you want, I'll give it to you instead of money?
	Info_ClearChoices(DIA_Addon_Skip_Grog);
	Info_AddChoice(DIA_Addon_Skip_Grog, " I'll take the money. " ,DIA_Addon_Skip_Grog_gold);
	Info_AddChoice(DIA_Addon_Skip_Grog, " Give me a ring. " ,DIA_Addon_Skip_Grog_ring);
};

func void DIA_Addon_Skip_Grog_ring()
{
	AI_Output(other,self, " DIA_Addon_Skip_Grog_ring_15_00 " );	// I'll take the ring.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Держи.
	B_GiveInvItems(self,other,ItRi_Prot_Edge_02,1);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_gold()
{
	var int GrogKohle;
	AI_Output(other,self, " DIA_Addon_Skip_Grog_gold_15_00 " );	// I'll take the money.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//Хорошо.
	GrogKohle = Value_Grog * 20;
	B_GiveInvItems(self,other,ItMi_Gold,GrogKohle);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};


instance DIA_Addon_Skip_News(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 888;
	condition = DIA_Addon_Skip_News_Condition;
	information = DIA_Addon_Skip_News_Info;
	permanent = FALSE;
	description = " Can you sell me something? " ;
};


func int DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_News_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_News_15_00 " );	// Can you sell me something?
	AI_Output(self,other, " DIA_Addon_Skip_News_08_01 " );	// If you want to trade, go to Garett. He is in charge of our reserves.
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};


instance DIA_Addon_Skip_Hire (C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 11;
	condition = DIA_Addon_Skip_Hire_Condition;
	information = DIA_Addon_Skip_Hire_Info;
	permanent = FALSE;
	description = " You must help me. " ;
};


func int DIA_Addon_Skip_Hire_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_Hire_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_Anheuern_15_00 " );	// You have to help me.
	AI_Output(self,other, " DIA_Addon_Skip_Anheuern_08_01 " );	// How?
	AI_Output(other,self, " DIA_Addon_Skip_Anheuern_15_01 " );	// The canyon is waiting for us.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other, " DIA_Addon_Skip_Anheuern_08_02 " );	// I see you took the guys with you. Correctly!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Skip_Anheuern_08_03 " );	// You'd better bring more people with you!
	};
	AI_Output(self,other, " DIA_Addon_Skip_Anheuern_08_04 " );	// It's bloody dangerous in the canyon!
};


instance DIA_Addon_Skip_ComeOn(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 12;
	condition = DIA_Addon_Skip_ComeOn_Condition;
	information = DIA_Addon_Skip_ComeOn_Info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int DIA_Addon_Skip_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Skip_Anheuern));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_ComeOn_15_00 " );	// Come with me.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Skip_ComeOn_08_02 " );	// Wait. Let's go back to the canyon first...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//Идем!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};

instance DIA_Addon_Skip_GoHome(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 13;
	condition = DIA_Addon_Skip_GoHome_Condition;
	information = DIA_Addon_Skip_GoHome_Info;
	permanent = TRUE;
	description = " I don't need you anymore. " ;
};


func int DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_GoHome_15_00 " );	// I don't need you anymore.
	AI_Output(self,other, " DIA_Addon_Skip_GoHome_08_01 " );	// Well, we had a good walk. If anything, you can find me at the camp.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Addon_Skip_TooFar(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 14;
	condition = DIA_Addon_Skip_TooFar_Condition;
	information = DIA_Addon_Skip_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skip_TooFar_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && (C_GregsPiratesTooFar() ==  TRUE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_TooFar_Info()
{
	AI_Output(self,other, " DIA_Addon_Skip_TooFar_08_01 " );	// We've gone far enough!
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other, " DIA_Addon_Skip_TooFar_08_02 " );	// If you're going further, don't count on us!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Skip_TooFar_08_03 " );	// If you're going further, don't count on us!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Meeting Point (C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Treffpunkt_Condition;
	information = DIA_Addon_Skip_Treffpunkt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Treffpunkt_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (C_AllCanyonRazorDead() == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_Treffpunkt_Info()
{
	AI_Output(self,other, " DIA_Addon_Skip_Add_08_00 " );	// If we lose each other, we'll meet here at the watering hole.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Вперед!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Orks(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Orks_Condition;
	information = DIA_Addon_Skip_Orks_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Orks_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_Orks_Info()
{
	AI_Output(self,other, " DIA_Addon_Skip_Add_08_01 " );	// Orcs! I hate these creatures!
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Skip_AllRazorsDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_AllRazorsDead_Condition;
	information = DIA_Addon_Skip_AllRazorsDead_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_AllCanyonRazorDead() == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_AllRazorsDead_Info()
{
	AI_Output(self,other, " DIA_Addon_Skip_Add_08_03 " );	// Looks like we killed all the razor teeth.
	AI_Output(self,other, " DIA_Addon_Skip_Add_08_04 " );	// If you want, we can wander around here some more.
	AI_Output(self,other, " DIA_Addon_Skip_Add_08_05 " );	// Just don't leave the canyon.
	AI_StopProcessInfos(self);
};

// ----------------Dracia branch------------------------------ ------------

instance DIA_Addon_Skip_TalkAboutElza(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_TalkAboutElza_Condition;
	information = DIA_Addon_Skip_TalkAboutElza_Info;
	permanent = FALSE;
	description = " Greg said you were trying to fix One-Eyed Elsa. " ;
};

func int DIA_Addon_Skip_TalkAboutElza_Condition()
{
	if((MIS_OldElza == LOG_Running) && (ViewElza == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_TalkAboutElza_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Skip_TalkAboutElza_01_00 " );	// Greg said you were trying to fix One-Eyed Elsa.
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_01_01 " );	// Yes, I tried. All for nothing!
	AI_Output(other,self,"DIA_Addon_Skip_TalkAboutElza_01_02");	//Почему?
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_01_03 " );	// Holes in the hull and a large hole in the bow of the ship can be repaired by ourselves.
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_01_04 " );	// But we need a good carpenter to fix the tie rod at the helm. Without this, the ship will simply be uncontrollable.
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_01_05 " );	// And there is no such thing among us, as you understand. We're pirates, damn it, not master craftsmen.
};

instance DIA_Addon_Skip_TalkAboutElza_Fix(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_TalkAboutElza_Fix_Condition;
	information = DIA_Addon_Skip_TalkAboutElza_Fix_Info;
	permanent = FALSE;
	description = " I could look for a carpenter for you. " ;
};

func int DIA_Addon_Skip_TalkAboutElza_Fix_Condition()
{
	if (( MIS_OldElza == LOG_Running ) && ( ViewElza ==  TRUE ) && ( Npc_KnowsInfo ( other , DIA_Addon_Skip_TalkAboutElza ) ==  TRUE )) .
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_TalkAboutElza_Fix_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_TalkAboutElza_Fix_01_01 " );	// I could look for a carpenter for you.
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_Fix_01_02 " );	// Hmmm... You can try. It definitely won't get worse. That's just who will agree to hobnob with pirates?
	AI_Output(other,self, " DIA_Addon_Skip_TalkAboutElza_Fix_01_03 " );	// I don't know. But it's still worth asking.
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_Fix_01_04 " );	// Okay, if you suddenly find such a master who is ready to work for us, then...
	B_GiveInvItems(self,other,ItMi_ShipShceme,1);
	AI_Output(other,self,"DIA_Addon_Skip_TalkAboutElza_Fix_01_05");	//Что это?
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_Fix_01_06 " );	// At my leisure, I sketched drawings of those steering elements that need to be replaced on the 'Elsa'.
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_Fix_01_07 " );	// If suddenly he refuses to go to our camp, which I have no doubt about, then maybe he will agree to make them for us.
	AI_Output(self,other, " DIA_Addon_Skip_TalkAboutElza_Fix_01_08 " );	// Don't worry about the price, I'll cover all your expenses related to this. Naturally, within reasonable limits.
	AI_Output(other,self, " DIA_Addon_Skip_TalkAboutElza_Fix_01_09 " );	// Okay, I'll see what I can do.
	B_LogEntry(TOPIC_OldElza, " I volunteered to look for a carpenter for the pirates who could fix the steering controls on the One-Eyed Elza. To do this, Skip gave me drawings of the actual parts that would need to be made. " );
};

instance DIA_Addon_Skip_FixShip(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_FixShip_Condition;
	information = DIA_Addon_Skip_FixShip_Info;
	permanent = FALSE;
	description = " Here are all the parts for the ship's rudder. " ;
};

func int DIA_Addon_Skip_FixShip_Condition()
{
	if ((MIS_OldElza == LOG_Running) && (Npc_HasItems(other,ItMi_SkipShipPack) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_FixShip_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_01_01 " );	// Here are all the details for the ship's rudder.
	B_GiveInvItems(other,self,ItMi_SkipShipPack,1);
	Npc_RemoveInvItems(self,ItMi_SkipShipPack,1);
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_01_02 " );	// Feeding my liver, I can't believe my eyes! They really are all here!
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_01_03 " );	// Does this mean that now it will be possible to start repairing the ship?
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_01_04 " );	// Of course! I'll take care of it immediately.
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_01_05 " );	// And how long will it take?
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_01_06 " );	// Hmm... Well, if we work hard, I think we'll manage in a couple of days.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_01_07 " );	// The main thing is that the parts you brought fit the Elsa's steering mechanism. By the way, how much did you pay for them?
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_01_08 " );	// Two thousand coins.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_01_09 " );	// Go crazy! It's a whole fortune.
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_01_10 " );	// It was not possible to bargain them cheaper.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_01_11 " );	// Eh...(sighing) Okay, after all, I did promise you to make up for all the damages.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_01_12 " );	// And fixing our ship is much more important right now.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_01_13 " );	// So, here, take this money. And a little extra for your trouble.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_01_14 " );	// Thank you.
	SkipShipRepairDay = Wld_GetDay();
	SkipShipRepair = TRUE;
	B_LogEntry(TOPIC_OldElza, " I gave Skip the rudder parts and he promised to start repairing the ship as soon as possible. " );
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Skip_FixShip_Done(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_FixShip_Done_Condition;
	information = DIA_Addon_Skip_FixShip_Done_Info;
	permanent = FALSE;
	description = " How is the repair of the ship? " ;
};

func int DIA_Addon_Skip_FixShip_Done_Condition()
{
	if (( MY_OldElza == LOG_Running ) && ( SkipReadySailDrakia ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_FixShip_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_Done_01_01 " );	// How is the repair of the ship?
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_02 " );	// Great, mate! Those parts that you got for me, like a glove, got into the Elsa's steering mechanism and now the ship is quite controllable.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_03 " );	// And I patched the holes and the hole in the bow yesterday. If you want, you can see for yourself how it turned out.
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_Done_01_04 " );	// So now you can go to sea again?
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_05 " );	// Well, not really... (grouchily) It's still quite dangerous to go far from the coast on it anyway. Any small storm will immediately sink her.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_06 " );	// But we didn't plan to do that. Greg has other thoughts on this.
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_Done_01_07 " );	// Which ones exactly?
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_08 " );	// Hmm... He probably already told you that we had a whole mountain of various goods accumulated in the camp, which we did not have time to sell before the paladins sank our ship.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_09 " );	// For the most part, all this rubbish is quite common, but in these places we naturally cannot find a buyer for it.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_10 " );	// So Greg decided to send him to Drakia along with "Elsa". And if we're lucky, then there we'll get pretty good money for it, with which it will be quite possible to buy a new ship.
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_Done_01_11 " );	// But you said that it's dangerous to go to sea on the Elsa, right?
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_12 " );	// Our old galleon is quite capable of sailing to this part of the island without any problems. The main thing is to know the right course and not go far from the coast.
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_Done_01_13 " );	// And when do you plan to go there?
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_14 " );	// Hmm... I think in a couple of days, when we load all the goods onto the Elsa. And what ... (chuckling) Do you want to join us?
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_Done_01_15 " );	// I wouldn't mind swimming there.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_16 " );	// Indeed, why not. Although you are not a sailor, but the guy is what you need. I guess Greg won't mind if you come with us.
	AI_Output(other,self, " DIA_Addon_Skip_FixShip_Done_01_17 " );	// Then I'll check back later.
	AI_Output(self,other, " DIA_Addon_Skip_FixShip_Done_01_18 " );	// Good. Just remember - we will not wait for you alone! As soon as we dive in, we will immediately sail away.
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_19");	//Само собой.
	MIS_OldElza = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OldElza,LOG_SUCCESS);
	B_LogEntry(TOPIC_OldElza, " Thanks to my help, Skip managed to repair the 'One-Eyed Elza'. True, it would be quite dangerous to go out to sea on it. " );
};

instance DIA_Addon_Skip_DrakiaAway(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_DrakiaAway_Condition;
	information = DIA_Addon_Skip_DrakiaAway_Info;
	permanent = TRUE;
	description = " So, is the ship ready to sail? " ;
};

func int DIA_Addon_Skip_DrakiaAway_Condition()
{
	if((MIS_OldElza == LOG_SUCCESS) && (SailAwayDrakia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_DrakiaAway_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_DrakiaAway_01_01 " );	// Well, is the ship ready to sail?
	AI_Output(self,other, " DIA_Addon_Skip_DrakiaAway_01_02 " );	// Not yet. Come back later.
};
