

instance DIA_NIGEL_EXIT(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 999;
	condition = dia_nigel_exit_condition;
	information = dia_nigel_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nigel_exit_condition()
{
	return TRUE;
};

func void dia_nigel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NIGEL_PICKPOCKET(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 900;
	condition = dia_nigel_pickpocket_condition;
	information = dia_nigel_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_nigel_pickpocket_condition()
{
	return  C_Robbery ( 30 , 28 );
};

func void dia_nigel_pickpocket_info()
{
	Info_ClearChoices(dia_nigel_pickpocket);
	Info_AddChoice(dia_nigel_pickpocket,Dialog_Back,dia_nigel_pickpocket_back);
	Info_AddChoice(dia_nigel_pickpocket,DIALOG_PICKPOCKET,dia_nigel_pickpocket_doit);
};

func void dia_nigel_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_nigel_pickpocket);
};

func void dia_nigel_pickpocket_back()
{
	Info_ClearChoices(dia_nigel_pickpocket);
};


instance DIA_NIGEL_HALLO(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_hallo_condition;
	information = dia_nigel_hallo_info;
	permanent = FALSE;
	description = " They say you owe a lot of money. " ;
};


func int dia_nigel_hallo_condition()
{
	if (( MY_KILLTARGET4  == LOG_Running) && (Npc_KnowsInfo(hero,dia_nigel_meetfirst) ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_nigel_hallo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other, self, " DIA_Nigel_Hallo_01_00 " );	// They say that you owe a lot of money to a merchant and don't want to pay it back.
	AI_Output(self,other, " DIA_Nigel_Hallo_01_01 " );	// (nervously) You never know what they say? And who are you anyway?
	AI_Output(other,self, " DIA_Nigel_Hallo_01_02 " );	// I'm the one sent to make you pay your bills. Or did you think it was easy to get away?
	AI_Output(self,other, " DIA_Nigel_Hallo_01_03 " );	// And where did you get the idea that I owe something to someone at all? I don't understand what you're talking about.
	AI_Output(other,self, " DIA_Nigel_Hallo_01_04 " );	// Your name is Nigel, isn't it?
	AI_Output(self,other, " DIA_Nigel_Hallo_01_05 " );	// Well, yes, that's me.
	AI_Output(other,self, " DIA_Nigel_Hallo_01_06 " );	// So, I was not mistaken - you are exactly who I need. So stop playing dumb!
	AI_Output(other, self, " DIA_Nigel_Hallo_01_07 " );	// Pay me, or you'll get in more trouble than you can imagine.
	AI_Output(self,other, " DIA_Nigel_Hallo_01_08 " );	// (laughs) And how are you going to give me all this trouble?
	AI_Output(other,self, " DIA_Nigel_Hallo_01_09 " );	// I'll give you advice: better give me this money in a good way. Unless, of course, you want to die.
	AI_Output(self,other, " DIA_Nigel_Hallo_01_12 " );	// Are you threatening me?! Do you think I'm afraid of you?
	AI_Output(other,self, " DIA_Nigel_Hallo_01_15 " );	// Well, that's easy to check. Are you ready to take the risk?
	AI_Output(self,other, " DIA_Nigel_Hallo_01_16 " );	// Ummmm...
	AI_Output(other,self, " DIA_Nigel_Hallo_01_17 " );	// Fear has a smell, did you know that?
	AI_Output(self,other, " DIA_Nigel_Hallo_01_18 " );	// Think and say what you want! You still won't get this money!
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo, " Giving you one last chance, Nigel. " ,dia_nigel_hallo_nokill);
	Info_AddChoice(dia_nigel_hallo, " Then I'll have to kill you after all! " ,dia_nigel_hallo_kill);
};

func void dia_nigel_hallo_kill()
{
	AI_Output(other,self, " DIA_Nigel_Hallo_Kill_01_00 " );	// Then I'll have to kill you after all!
	AI_Output(self,other, " DIA_Nigel_Hallo_Kill_01_01 " );	// You... you can't do this!... (in panic) I... it's not my fault!
	AI_Output(other,self, " DIA_Nigel_Hallo_Kill_01_02 " );	// That's what they all say.	
	AI_Output(self,other, " DIA_Nigel_Hallo_Kill_01_03 " );	// Damn... damn... damn!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

func void dia_nigel_hallo_nokill()
{
	AI_Output(other,self, " DIA_Nigel_Hallo_NoKill_01_00 " );	// I'm giving you one last chance, Nigel.
	AI_Output(other,self, " DIA_Nigel_Hallo_NoKill_01_01 " );	// Give me the money! And I will leave you alone.
	AI_Output(other,self, " DIA_Nigel_Hallo_NoKill_01_03 " );	// You'll have to give it back anyway. I won't leave here without it.
	AI_Output(self,other, " DIA_Nigel_Hallo_Kill_01_03 " );	// Damn... damn... damn!
	AI_Output(self,other, " DIA_Nigel_Hallo_NoKill_01_08 " );	// But I don't have it...
	AI_Output(other,self, " DIA_Nigel_Hallo_NoKill_01_09 " );	// Why not?!
	AI_Output(self,other, " DIA_Nigel_Hallo_NoKill_01_11 " );	// (hysterically) I got robbed! I don't have this money.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_12");	//Hmmm...
	AI_Output(self,other, " DIA_Nigel_Hallo_NoKill_01_13 " );	// I was going to use them to buy goods from Onar's farm and sell them profitably in the city...
	AI_Output(self,other, " DIA_Nigel_Hallo_NoKill_01_14 " );	// But on the way between the tavern and the city, bandits attacked me. They took everything, including the money.
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo, " I don't trust you. " ,dia_nigel_hallo_notrust);
	Info_AddChoice(dia_nigel_hallo, " Where exactly did the bandits attack you? " ,dia_nigel_hallo_trust);
};

func void dia_nigel_hallo_notrust()
{
	AI_Output(other,self, " DIA_Nigel_Hallo_NoTrust_01_00 " );	// I don't believe you.
	AI_Output(self,other, " DIA_Nigel_Hallo_NoTrust_01_01 " );	// But I'm telling the truth!
	AI_Output(other,self, " DIA_Nigel_Hallo_NoTrust_01_02 " );	// Look, I'm only interested in money, and you don't have any.
	AI_Output(other,self, " DIA_Nigel_Hallo_NoTrust_01_03 " );	// Being robbed is your personal problem. So you still have to pay.	
	AI_Output(self,other, " DIA_Nigel_Hallo_Kill_01_01 " );	// You... you can't do that! (panicked) I... it's not my fault!
	AI_Output(other,self, " DIA_Nigel_Hallo_Kill_01_02 " );	// That's what they all say.	
	AI_Output(self,other, " DIA_Nigel_Hallo_Kill_01_03 " );	// Damn... damn... damn!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

func void dia_nigel_hallo_trust()
{
	AI_Output(other,self, " DIA_Nigel_Hallo_Trust_01_00 " );	// Where exactly did the bandits attack you?
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_01 " );	// Not far from the city, in a clearing that stretches along the city walls.
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_02 " );	// I... couldn't even imagine that I could be attacked in this place.
	AI_Output(other,self, " DIA_Nigel_Hallo_Trust_01_04 " );	// Okay! I hope you're not lying, otherwise I'll come back and cut off your lying tongue.
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_03 " );	// It's all true, I swear!
	AI_Output(other,self, " DIA_Nigel_Hallo_Trust_01_05 " );	// How many bandits attacked you?
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_06 " );	// At least three! I do not remember exactly. I was just so scared that... (stutters)
	AI_Output(other,self, " DIA_Nigel_Hallo_Trust_01_07 " );	// You don't have to continue, I understand what you mean.
	AI_Output(other,self, " DIA_Nigel_Hallo_Trust_01_08 " );	// Well, you'll probably have to visit these bandits and get your gold back.
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_09 " );	// I really hope so! If you manage to get the gold back, return it to the merchant.
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_10 " );	// It has already given me so many problems and headaches that there is nowhere else to go.
	AI_Output(other,self, " DIA_Nigel_Hallo_Trust_01_11 " );	// Do you have a better suggestion?
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_12 " );	// Well... (cautiously) I certainly can't count on you returning it to me...
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_13 " );	// But if you could do it... (hopefully)
	AI_Output(self,other, " DIA_Nigel_Hallo_Trust_01_15 " );	// ...I could pull off the little business I had in mind.
	; _ _ _ _ _ _
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo, " I'm not interested. " ,dia_nigel_hallo_nodeal);
	Info_AddChoice(dia_nigel_hallo, " What do I care about this dealer? " ,dia_nigel_hallo_deal);
	GRABTARGET4 = TRUE;
};

func void dia_nigel_hallo_nodeal()
{
	AI_Output(other,self, " DIA_Nigel_Hallo_NoDeal_01_00 " );	// I'm not interested.
	AI_Output(self,other, " DIA_Nigel_Hallo_NoDeal_01_01 " );	// As you say, it's up to you. But if you do change your mind, you know where to find me.
	AI_Output(other,self, " DIA_Nigel_Hallo_NoDeal_01_02 " );	// I don't think I'll change my mind. But trust me, I won't forget about you. Especially if you lied to me about the bandits.
	AI_Output(self,other, " DIA_Nigel_Hallo_NoDeal_01_03 " );	// (nervously) Why would I lie?
	AI_Output(self,other, " DIA_Nigel_Hallo_NoDeal_01_06 " );	// Hope you get that gold back.
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};

func void dia_nigel_hallo_deal()
{
	AI_Output(other,self, " DIA_Nigel_Hallo_Deal_01_00 " );	// And what do I care about this little business?
	AI_Output(self,other, " DIA_Nigel_Hallo_Deal_01_01 " );	// I could give you back a lot more gold than I should.
	AI_Output(self,other, " DIA_Nigel_Hallo_Deal_01_03 " );	// You're probably aware of the city's recent problems with Onar and other peasants.
	AI_Output(self,other, " DIA_Nigel_Hallo_Deal_01_04 " );	// Because of all this, food supplies to the city have been drastically reduced, and merchants are willing to shell out a lot more gold for an extra shipment of food.
	AI_Output(self,other, " DIA_Nigel_Hallo_Deal_01_05 " );	// And, as you know, you can warm up your hands well on this. Naturally, if you know how to trade.
	AI_Output(self,other, " DIA_Nigel_Hallo_Deal_01_06 " );	// As you can see, all this is fraught with great risk. The area is just teeming with robbers!
	AI_Output(other,self, " DIA_Nigel_Hallo_Deal_01_07 " );	// Hmmm... And what will be my share in this case?
	AI_Output(self,other, " DIA_Nigel_Hallo_Deal_01_08 " );	// About a hundred gold, I think. Of course, given the money that I owe.
	AI_Output(self,other, " DIA_Nigel_Hallo_Deal_01_09 " );	// It's good money... What do you say?
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo, " Agreed. " ,dia_nigel_hallo_dealyes);
	Info_AddChoice(dia_nigel_hallo, " Too little! " ,dia_nigel_hallo_dealbad);
};

func void dia_nigel_hello_dealbad()
{
	AI_Output(other,self, " DIA_Nigel_Hallo_DealBad_01_00 " );	// Not enough! I won't waste time on loose change.
	AI_Output(self,other, " DIA_Nigel_Hallo_NoDeal_01_01 " );	// As you say, it's up to you. But if you do change your mind, you know where to find me.
	AI_Output(other,self, " DIA_Nigel_Hallo_NoDeal_01_02 " );	// I don't think I'll change my mind. But trust me, I won't forget about you. Especially if you lied to me about the bandits.
	AI_Output(self,other, " DIA_Nigel_Hallo_NoDeal_01_03 " );	// (nervously) Why would I lie?
	AI_Output(self,other, " DIA_Nigel_Hallo_NoDeal_01_06 " );	// Hope you get that gold back.
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};

func void dia_nigel_hello_dealyes()
{
	AI_Output(other,self, " DIA_Nigel_Hallo_DealYes_01_00 " );	// Good. Consider that we have an accord.
	AI_Output(self,other, " DIA_Nigel_Hallo_DealYes_01_01 " );	// That's nice! And no one will be left behind.
	AI_Output(self,other, " DIA_Nigel_Hallo_DealYes_01_02 " );	// Now you just have to deal with these bandits.
	AI_Output(self,other, " DIA_Nigel_Hallo_DealYes_01_03 " );	// They must have my wallet with the money they took from me. It contains all the money that I borrowed from the merchant.
	AI_Output(self,other, " DIA_Nigel_Hallo_DealYes_01_04 " );	// Just bring it to me and I'll take care of the rest. I'll be waiting for you here. I'm just begging you, hurry up!
	AI_Output(other,self, " DIA_Nigel_Hallo_DealYes_01_05 " );	// I'll try to fix this problem as soon as possible.
	MIS_NIGELMATTER = LOG_Running;
	Log_CreateTopic(TOPIC_NIGELMATTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_Running);
	B_LogEntry( TOPIC_NIGELMATTER , " Nigel made me an offer: if I return the money to him, he wants to put it into circulation, and part of the profit that he will get from this will be mine. I decided to agree. And let Asmal wait with his debt. The bandits are camped close to the city walls. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};


instance DIA_NIGEL_MONEYBACK(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_moneyback_condition;
	information = dia_nigel_moneyback_info;
	permanent = FALSE;
	description = " Hold your wallet. " ;
};

func int dia_nigel_moneyback_condition()
{
	if ((Npc_HasItems(other,know_nigelpocket) >=  1 ) && ( MY_NIGELMATTERS  == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_nigel_moneyback_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Nigel_MoneyBack_01_00 " );	// Hold your wallet.
	B_GiveInvItems(other,self,itse_nigelpocket,1);
	Npc_RemoveInvItems(self,itse_nigelpocket,Npc_HasItems(self,itse_nigelpocket));
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_01 " );	// Wow! It really is the gold. How did you manage that?
	AI_Output(other,self, " DIA_Nigel_MoneyBack_01_02 " );	// You better not know.
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_03 " );	// Okay, you don't have to tell. The main thing is that you were able to return this money to me, and now we can safely get down to business again.
	AI_Output(other,self, " DIA_Nigel_MoneyBack_01_04 " );	// What about our deal?
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_05 " );	// As agreed!
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_07 " );	// Don't worry, I can keep my word. Indeed, for a business person, this is a fundamental guarantee of success ... (laughs)
	AI_Output(other,self, " DIA_Nigel_MoneyBack_01_08 " );	// And when will I get my promised gold?
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_09 " );	// Patience, my friend, patience! Things don't go that fast.
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_10 " );	// Trading is not as easy as some people think!
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_11 " );	// Hmm...(calculates) I think it will take me three days at the most. So you'll have to wait a little.
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_12 " );	// Well, then you can come and calmly take your share from our business.
	AI_Output(other,self, " DIA_Nigel_MoneyBack_01_15 " );	// And where to look for you in three days?
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_16 " );	// You can find me at Onar's farm, I'll be there most of the time.
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_20 " );	// Be calm! You will receive everything that is due to you.
	AI_Output(other,self, " DIA_Nigel_MoneyBack_01_21 " );	// See you later.
	AI_Output(self,other, " DIA_Nigel_MoneyBack_01_22 " );	// All the best.
	AI_StopProcessInfos(self);
	B_LogEntry( TOPIC_NIGELMATTER , " I returned Nigel's wallet. Now I must meet him in three days at Onar's farm to collect my share. " );
	NIGELMATTERDAY = Wld_GetDay();
	Npc_ExchangeRoutine(vlk_6110_nigel,"OnarFarm");
};


instance DIA_NIGEL_MONEYNOW(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_moneynow_condition;
	information = dia_nigel_moneynow_info;
	permanent = TRUE;
	description = " How is my share? " ;
};


func int dia_nigel_moneynow_condition()
{
	if((MIS_NIGELMATTER == LOG_Running) && Npc_KnowsInfo(hero,dia_nigel_moneyback))
	{
		return TRUE;
	};
};

func void dia_nigel_moneynow_info()
{
	where int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Nigel_MoneyNow_01_00 " );	// What about my share?
	if(NIGELMATTERDAY <= (daynow - 3))
	{
		AI_Output(self,other, " DIA_Nigel_MoneyNow_01_01 " );	// Yes, of course, as agreed.
		AI_Output(self,other, " DIA_Nigel_MoneyNow_01_02 " );	// Here, take this wallet that you gave me back...
		B_GiveInvItems(self,other,itse_nigelpocket,1);
		AI_Output(self,other, " DIA_Nigel_MoneyNow_01_0A " );	// ...and a hundred gold pieces to go with it!
		B_GiveInvItems(self,other,ItMi_Gold,100);
		AI_Output(self,other, " DIA_Nigel_MoneyNow_01_03 " );	// Well, what do you say now? Happy you agreed to my proposal?
		AI_Output(other,self, " DIA_Nigel_MoneyNow_01_04 " );	// Yes, it seems that was smart of me. Your business really turned out to be quite profitable.
		AI_Output(self,other, " DIA_Nigel_MoneyNow_01_05 " );	// Still! I'll tell you more...
		AI_Output(self,other, " DIA_Nigel_MoneyNow_01_06 " );	// Trading is extremely lucrative if you know how to approach it.

		if (( TRADEGUILD MEMBER  ==  FALSE ) && ( MY_TRADEGUILD  !=  LOG_FAILED ) && ( NIGELTELLABOUTGUILD  ==  FALSE ) && ( EROLTELLABOUTGUILD  ==  FALSE ))
		{
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_09 " );	// That's right. Have you ever considered becoming a merchant yourself?
			AI_Output(other,self, " DIA_Nigel_MoneyNow_01_10 " );	// Never thought about it, I had better things to do.
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_11 " );	// I think you have a talent for this business.
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_13 " );	// I think you should try.
			AI_Output(other,self, " DIA_Nigel_MoneyNow_01_15 " );	// And where do you suggest I start?
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_16 " );	// Hmmm...(thoughtfully) It's hard to say right away, though...(thinking)... But here's the thing!
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_19 " );	// I'll write you a letter of recommendation for a friend of mine. He will accept you!
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_21 " );	// This friend of mine is a very influential person in the city, and besides, he is the master of the merchants guild, which is located in Khorinis.
			AI_Output(other,self, " DIA_Nigel_MoneyNow_01_22 " );	// Merchant guilds? Never heard of such a thing.
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_23 " );	// Of course you haven't! Everyone who is in it, tries not to talk too much about it. Especially in these turbulent times.
			AI_Output(other,self, " DIA_Nigel_MoneyNow_01_25 " );	// And what will I tell him?
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_26 " );	// You don't need to say anything special. I will say everything for you in this letter.
			AI_Output(other,self, " DIA_Nigel_MoneyNow_01_28 " );	// Will he accept me into the merchants guild?
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_29 " );	// I'm sure he will. He also recognises talent.
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_30 " );	// What better way to learn this craft than in a guild? After all, no one will teach you just like that.
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_33 " );	// Of course, you are free to decide what to do, but...
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_34 " );	// ...I'll give you advice: don't miss this chance!
			B_UseFakeScroll();
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_35 " );	// Here, take the letter and take it to Mr. Luthero.
			B_GiveInvItems(self,other,itwr_nigelletter,1);
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_36");	//Luthero?
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_37 " );	// Yes, him. You probably already know him and know where he lives.
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_38 " );	// So it won't be too hard for you to find it.
			AI_Output(other,self, " DIA_Nigel_MoneyNow_01_39 " );	// Well, thanks then!
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_40 " );	// No way! After all, I wanted to thank you for saving my reputation and my gold.
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_41 " );	// I think this letter will be enough to return this favor to you.
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_42 " );	// Otherwise, I can't stand it when I owe something to someone or for something, if you understand what I mean.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_46");	//Bye.
			AI_Output(other,self, " DIA_Nigel_MoneyNow_01_45 " );	// See you again!
			NIGELTELLABOUTGUILD = TRUE;
			B_LogEntry( TOPIC_NIGELMATTER , " Nigel was right - his business turned out to be very profitable. He returned my purse with two thousand coins, in addition to attaching another hundred gold to it. " );
			Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_SUCCESS);
			MIS_NIGELMATTER = LOG_SUCCESS;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Nigel_MoneyNow_01_07 " );	// Trust me, it's true!
			B_LogEntry( TOPIC_NIGELMATTER , " Nigel was right - his business turned out to be very profitable. He returned my purse with two thousand coins, in addition to attaching another hundred gold to it. " );
			Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_SUCCESS);
			MIS_NIGELMATTER = LOG_SUCCESS;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Nigel_MoneyNow_01_47 " );	// How impatient you are! Has it been three days already?
		AI_Output(self,other, " DIA_Nigel_MoneyNow_01_54 " );	// So don't distract me and do something really useful. Good?
		AI_StopProcessInfos(self);
	};
};

instance DIA_NIGEL_MONEY_NEW(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_money_new_condition;
	information = dia_nigel_money_new_info;
	permanent = FALSE;
	description = " You know, I saved your life! " ;
};

func int dia_nigel_money_new_condition()
{
	if((RhetorikSkillValue[1] >= 30) && (MIS_NIGELMATTER == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_nigel_money_new_info()
{
	AI_Output(other,self, " DIA_Nigel_MoneyNew_01_01 " );	// You know, I saved your life.
	AI_Output(other,self, " DIA_Nigel_MoneyNew_01_02 " );	// And it seems to me that you just laughed at me with this hundred gold.
	AI_Output(self,other, " DIA_Nigel_MoneyNew_01_03 " );	// No, what are you... (nervously) I'm sorry, I'm really grateful to you!
	AI_Output(self,other, " DIA_Nigel_MoneyNew_01_04 " );	// It's just always hard for a merchant to part with gold.
	AI_Output(other,self, " DIA_Nigel_MoneyNew_01_05 " );	// I guess you just need to do this now.
	AI_Output(self,other, " DIA_Nigel_MoneyNew_01_06 " );	// Yes, of course... Here, take it! This, I hope, is enough for you now.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Nigel_MoneyNew_01_07");	//Quite.
};

instance DIA_NIGEL_MEETFIRST(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 1;
	condition = dia_nigel_meetfirst_condition;
	information = dia_nigel_meetfirst_info;
	permanent = FALSE;
	description = " Hi, who are you? " ;
};

func int dia_nigel_meetfirst_condition()
{
	return TRUE;
};

func void dia_nigel_meetfirst_info()
{
	AI_Output(other,self, " DIA_Nigel_MeetFirst_01_00 " );	// Hello, who are you?
	AI_Output(self,other, " DIA_Nigel_MeetFirst_01_01 " );	// My name is Nigel. I am a merchant.
};


instance DIA_NIGEL_SELLWHAT(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 1;
	condition = dia_nigel_sellwhat_condition;
	information = dia_nigel_sellwhat_info;
	permanent = TRUE;
	description = " Do you sell anything? " ;
};


func int dia_nigel_sellwhat_condition()
{
	if (( KNOWS_NIGEL  ==  FALSE ) && (Npc_KnowsInfo(hero, dia_nigel_meets_first) || ( MASTERTRADEGUILD  ==  TRUE )))
	{
		return TRUE;
	};
};

func void dia_nigel_sellwhat_info()
{
	if((MIS_NIGELMATTER == LOG_SUCCESS) || (MASTERTRADEGUILD == TRUE))
	{
		AI_Output(other,self, " DIA_Nigel_SellWhat_01_00 " );	// Do you sell anything?
		AI_Output(self,other, " DIA_Nigel_SellWhat_01_01 " );	// Oh yes! Now I can sell you whatever you want.

		if(KNOWS_NIGEL == FALSE)
		{
			Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
			B_LogEntry(Topic_OutTrader, " Nigel the Trader will now be able to sell his goods to me. " );
			KNOWS_NIGEL = TRUE;
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Nigel_SellWhat_01_02 " );	// Do you sell anything?
		AI_Output(self,other, " DIA_Nigel_SellWhat_01_03 " );	// I'm not selling anything right now. You see, things are not going well for me.
		AI_Output(self,other, " DIA_Nigel_SellWhat_01_04 " );	// So I'm sorry - I can't help.
	};
};

instance DIA_NIGEL_TRADE (C_Info) .
{
	npc = vlk_6110_nigel;
	nr = 800;
	condition = dia_nigel_trade_condition;
	information = dia_nigel_trade_info;
	permanent = TRUE;
	description = " Show me what you've got. " ;
	trade = TRUE;
};

func int dia_nigel_trade_condition()
{
	if (( KNOWS_NIGEL  ==  TRUE ) && Wld_IsTime ( 10 , 0 , 20 , 0 ))
	{
		return TRUE;
	};
};

func void dia_nigel_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Nigel_TRADE_01_00 " );	// Show me what you've got.
	AI_Output(self,other, " DIA_Nigel_TRADE_01_01 " );	// For you - the best!
	B_GiveTradeInv(self);
};
