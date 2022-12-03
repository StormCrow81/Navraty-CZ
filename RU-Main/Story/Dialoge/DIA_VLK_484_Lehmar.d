
var int LehmarLostBookDay;

instance DIA_Lehmar_EXIT(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 999;
	condition = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_SORRY (C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 2;
	condition = DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information = DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Lehmar_SORRY_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_SORRY_Info()
{
	AI_Output(other,self, " DIA_Lehmar_ENTSCHULDIGUNG_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Lehmar_ENTSCHULDIGUNG_09_01 " );	// How much do you want?
	AI_Output(other,self, " DIA_Lehmar_ENTSCHULDIGUNG_15_02 " );	// What does 'how much' mean?
	AI_Output(self,other, " DIA_Lehmar_ENTSCHULDIGUNG_09_03 " );	// I'm a moneylender and you came to me! What more could you need from me? Money, of course.
};

instance DIA_Lehmar_LemarTheft(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_LemarTheft_Condition;
	information = DIA_Lehmar_LemarTheft_Info;
	permanent = FALSE;
	description = " Still, I doubt that you're giving money for nothing. " ;
};

func int DIA_Lehmar_LemarTheft_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Lehmar_Encountered) ==  TRUE ) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_LemarTheft_Info()
{
	AI_Output(other,self, " DIA_Lehmar_LemarTheft_01_00 " );	// Still, I doubt that you always give money for nothing.
	AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_01 " );	// No, not always... (grins) Most of the time, I'll also pledge something of value!
	AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_02 " );	// Just in case someone still can't repay their debt.
	AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_03 " );	// If I didn't do this, I'd be broke already. But some things are well worth my expenses.
	AI_Output(other,self, " DIA_Lehmar_LemarTheft_01_04 " );	// What do you do with them afterwards? Selling?
	AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_05 " );	// I sell some, I keep some for myself.
	AI_Output(other,self, " DIA_Lehmar_LemarTheft_01_06 " );	// Maybe then you'll let me take a look at what you have for sale?
	AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_07 " );	// I don't know. You don't come across as a rich person.
	AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_08 " );	// And all these things are quite expensive!
	AI_Output(other,self, " DIA_Lehmar_LemarTheft_01_09 " );	// I have money.
	AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_10 " );	// Prove! For example, how much do you have with you right now?
	AI_Output(other,self, " DIA_Lehmar_LemarTheft_01_11 " );	// Here, look.

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_12 " );	// I'm impressed! You've got over a thousand gold pieces here.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_13 " );	// Looks like you really are rich! Although you can't say that.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_14 " );	// Okay, I'll show you some of my goods.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_15 " );	// I'm sure you'll be interested in them.
		B_LogEntry(Topic_LemarTheft, " I got Lemar to agree to sell me the pawned items. " );
		LehmarTrade = TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_16 " );	// Hmmm. (smiling) Yes, not bad! At first glance, you have more than five hundred coins here.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_17 " );	// Yes, you have money! But I do not think that they would be enough to buy my things.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_18 " );	// So sorry.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_19 " );	// (chuckling) So what? You've got a little over a hundred coins here.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_20 " );	// My things cost many times more. So we have nothing more to discuss for now.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_21 " );	// Hmmm. (disparagingly) I can see from here that you are poor.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_01_22 " );	// Better get yourself a job! And forget about my things. (yawning) They're not for the likes of you.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	};
};

instance DIA_Lehmar_Trade(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 5;
	condition = DIA_Lehmar_Trade_Condition;
	information = DIA_Lehmar_Trade_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};

func int DIA_Lehmar_Trade_Condition()
{
	if(LehmarTrade == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Lutero_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};

instance DIA_Lehmar_LemarTheft_Again(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_LemarTheft_Again_Condition;
	information = DIA_Lehmar_LemarTheft_Again_Info;
	permanent = TRUE;
	description = " Now I have enough money to buy your things. " ;
};

func int DIA_Lehmar_LemarTheft_Again_Condition()
{
	if((LehmarNoTrade == TRUE) && (LehmarTrade == FALSE) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_LemarTheft_Again_Info()
{
	AI_Output(other,self, " DIA_Lehmar_LemarTheft_Again_01_00 " );	// Now I have enough money to buy your things.
	AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_01 " );	// Yes? (with interest) Come on, show off.
	AI_Output(other,self, " DIA_Lehmar_LemarTheft_Again_01_02 " );	// Here, look.

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_03 " );	// (surprised) I'm impressed! You've got over a thousand gold pieces here.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_04 " );	// Looks like you really are rich! Although you can't say that.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_05 " );	// (businesslike) Okay, I'll show you some of my wares.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_06 " );	// I'm sure you'll be very interested in them!
		B_LogEntry(Topic_LemarTheft, " I got Lemar to agree to sell me the pawned items. " );
		LehmarTrade = TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_07 " );	// Hmmm. (smiling) Yes, not bad! At first glance, you have more than five hundred coins here.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_08 " );	// Yes, you have money. But I do not think that they would be enough to buy my things.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_09 " );	// So sorry.
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_10 " );	// (chuckling) So what? You've got a little over a hundred coins here.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_11 " );	// Sorry, but my things cost many times more! So we have nothing more to discuss for now.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_12 " );	// Hmmm. (disparagingly) I can see from here that you are still poor.
		AI_Output(self,other, " DIA_Lehmar_LemarTheft_Again_01_13 " );	// So forget about my things. (yawning) They're not for you.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Lehmar_Relic(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Relic_Condition;
	information = DIA_Lehmar_Relic_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lehmar_Relic_Condition()
{
	if((Npc_HasItems(hero,ItMi_ParlanRelic_MIS) >= 1) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Relic_Info()
{
	AI_Output(self,other, " DIA_Lehmar_Relic_01_00 " );	// I knew you'd be interested in this thing!
	AI_Output(self,other, " DIA_Lehmar_Relic_01_01 " );	// One of the Firebenders pawned it for me.
	AI_Output(self,other, " DIA_Lehmar_Relic_01_02 " );	// Unfortunately, for me it turned out to be absolutely useless.
	AI_Output(self,other, " DIA_Lehmar_Relic_01_03 " );	// So I'm glad I finally got rid of her... (pretty) Good deal!
	AI_StopProcessInfos(self);
};

instance DIA_Lehmar_GELDLEIHEN (C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_GELDLEIHEN_Condition;
	information = DIA_Lehmar_GELDLEIHEN_Info;
	permanent = TRUE;
	description = " Lend me some money! " ;
};

var int DIA_Lehmar_GELDLEIHEN_noPerm;

func int DIA_Lehmar_GELDLEIHEN_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) && (DIA_Lehmar_GELDLEIHEN_noPerm ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info()
{
	AI_Output(other,self, " DIA_Lehmar_GELDLEIHEN_15_00 " );	// Lend me some money!
	AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_09_01 " );	// Of course! How much do you want? I take twenty percent!
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN, " I'll think about it. " ,DIA_Lehmar_GELDLEIHEN_back);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN, " A thousand gold pieces. " ,DIA_Lehmar_GELDLEIHEN_1000);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN, " Two hundred gold. " ,DIA_Lehmar_GELDLEIHEN_200);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN, " Fifty gold. " ,DIA_Lehmar_GELDLEIHEN_50);
};

func void DIA_Lehmar_GELDLEIHEN_back()
{
	AI_Output(other,self, " DIA_Lehmar_GELDLEIHEN_back_15_00 " );	// I'll think about it.
	AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_back_09_01 " );	// Think faster! Don't waste my time!
	AI_StopProcessInfos(self);
};

func void DIA_Lehmar_GELDLEIHEN_50()
{
	AI_Output(other,self, " DIA_Lehmar_GELDLEIHEN_50_15_00 " );	// Fifty gold.
	AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_50_09_01 " );	// Small thing, huh? I want you to return them tomorrow, okay?
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE ;
	Lehmar_MoneyGeleihen_Day = Wld_GetDay();
	Lehmar_MoneyBorrowed = 50 ;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_200()
{
	AI_Output(other,self, " DIA_Lehmar_GELDLEIHEN_200_15_00 " );	// Two hundred gold.
	AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_200_09_01 " );	// This is a large amount of money. I want to see you tomorrow, and the money too, okay?
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE ;
	Lehmar_MoneyGeleihen_Day = Wld_GetDay();
	Lehmar_MoneyBorrowed = 200 ;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_1000()
{
	AI_Output(other,self, " DIA_Lehmar_GELDLEIHEN_1000_15_00 " );	// A thousand gold pieces.

	if(RhetorikSkillValue[1] >= 10)
	{
		AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_1000_09_03 " );	// (surprised) A thousand gold?! You know, it's a very large amount.
		AI_Output(other,self, " DIA_Lehmar_GELDLEIHEN_1000_09_04 " );	// You probably just don't have that kind of money.
		AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_1000_09_05 " );	// I have the money, but I'm taking a big risk lending you so much gold.
		AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_1000_09_06 " );	// Okay. (thoughtfully) I'll give you a thousand coins.
		AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_1000_09_07 " );	// But tomorrow you will return them to me! And with interest. All clear?
		AI_Output(other,self, " DIA_Lehmar_GELDLEIHEN_1000_09_08 " );	// Agreed.
		AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_1000_09_09 " );	// Look! Don't fool me

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		CreateInvItems(self,ItMi_Gold,1000);
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		DIA_Lehmar_GELDLEIHEN_noPerm = TRUE ;
		Lehmar_MoneyGeleihen_Day = Wld_GetDay();
		Lehmar_MoneyBorrowed = 1000 ;
		Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	}
	else
	{
		AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_1000_09_01 " );	// Are you all right in the head?
		AI_Output(self,other, " DIA_Lehmar_GELDLEIHEN_1000_09_02 " );	// I'll give you a hundred. And don't forget to give them back to me tomorrow!
		CreateInvItems(self,ItMi_Gold,100);
		B_GiveInvItems(self,other,ItMi_Gold,100);
		DIA_Lehmar_GELDLEIHEN_noPerm = TRUE ;
		Lehmar_MoneyGeleihen_Day = Wld_GetDay();
		Lehmar_MoneyBorrowed = 100 ;
		Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	};
};


instance DIA_Lehmar_WARUMGELD (C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_WARUMGELD_Condition;
	information = DIA_Lehmar_WARUMGELD_Info;
	permanent = FALSE;
	description = " Do you always give away money so easily? " ;
};

func int DIA_Lehmar_WARUMGELD_Condition()
{
	if (Lehmar_MoneyLoaned !=  0 )
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info()
{
	AI_Output(other,self, " DIA_Lehmar_WARUMGELD_15_00 " );	// Do you always hand out money so easily?
	AI_Output(self,other, " DIA_Lehmar_WARUMGELD_09_01 " );	// Don't worry. Will you come back. Or I will find you and kill you. Everything is simple.
	AI_Output(self,other, " DIA_Lehmar_WARUMGELD_09_02 " );	// You have such a memorable appearance that it won't be hard for me to find you.
	AI_Output(self,other, " DIA_Lehmar_WARUMGELD_09_03 " );	// So don't even think about fooling me.
};

var int Lehmar_over;

instance DIA_Lehmar_GELDEINTREIBEN (C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 5;
	condition = DIA_Lehmar_GELDEINTREIBEN_Condition;
	information = DIA_Lehmar_GELDEINTRIIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_GELDEINTRIIBEN_Condition()
{
	if ((Lehmar_MoneyGeleihen_Day <= (Wld_GetDay() -  2 )) && (Lehmar_MoneyGeleihen !=  0 ) && (RangerHelp_LehmarKohle ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTRIIBEN_Info()
{
	AI_Output(self,other, " DIA_Lehmar_GELDEINTREIBEN_09_00 " );	// You didn't repay the debt, you bastard! Give me back my money! And since I had to remind you of this, the percentage goes up.
	AI_Output(self,other, " DIA_Lehmar_GELDEINTREIBEN_09_01 " );	// Now it will cost you thirty percent instead of the usual twenty.
	Info_ClearChoices(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN, " Я верну свой долг. " ,DIA_Lehmar_GELDEINTREIBEN_kreditenzahlen);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN, " I won't give you anything! " ,DIA_Lehmar_GELDEINTREIBEN_kannstmich);
};

func void DIA_Lehmar_MONEY-INTRIBE_canstme()
{
	AI_Output(other,self, " DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00 " );	// I won't give you anything!
	AI_Output(self,other, " DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01 " );	// Oh, no, give it!
	Lehmar_over = TRUE ;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Lehmar_GELDEINTRIIBEN_kreditenzahlen()
{
	AI_Output(other,self, " DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00 " );	// I will repay my debt.

	if (Lehmar_MoneyLoaned ==  50 )
	{
		Lehmar_MoneyGeleihen_WithInterest = 65 ;
	};
	if (Lehmar_MoneyLoaned ==  200 )
	{
		Lehmar_MoneyGeleihen_WithInterest = 260 ;
	};
	if (Lehmar_MoneyLoaned ==  100 )
	{
		Lehmar_MoneyGeleihen_WithInterest = 130 ;
	};
	if (Lehmar_MoneyLoaned ==  1000 )
	{
		Lehmar_MoneyGeleihen_WithInterest = 1300 ;
	};
	IntToFloat(Lehmar_MoneyBorrowed_WithInterest);

	if (Npc_HasItems(other,ItMi_Gold) >= Lehmar_Geleihen_MitInterest)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeleihen_MitZinsen);
		AI_Output(self,other, " DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01 " );	// You're in luck! Now get out!
		Lehmar_MoneyBorrowed = 0 ;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02 " );	// You don't have that much money with you! OK. Looks like I'll have to teach you a lesson.
		AI_Output(self,other, " DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03 " );	// Nothing personal - I just need to maintain my reputation.
		Lehmar_over = TRUE ;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Lehmar_GELDZURUECK(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 6;
	condition = DIA_Lehmar_GELDZURUECK_Condition;
	information = DIA_Lehmar_GELDZURUECK_Info;
	permanent = TRUE;
	description = " Here's your money! " ;
};


func int DIA_Lehmar_GELDZURUECK_Condition()
{
	if ( ! Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) && (Lehmar_GeldGeleihen !=  0 ))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info()
{
	AI_Output(other,self, " DIA_Lehmar_GELDZURUECK_15_00 " );	// Here's your money!

	if ((RangerHelp_LehmarKohle ==  TRUE ) && (Lehmar_MoneyGeleihen_Day <= (Wld_GetDay() -  2 )))
	{
		AI_Output(self,other, " DIA_Addon_Lehmar_GELDZURUECK_09_00 " );	// Leave them! Lares has already taken care of everything.
		AI_Output(self,other, " DIA_Addon_Lehmar_GELDZURUECK_09_01 " );	// Sounds like you and this scammer are buddies, huh? Okay, it's none of my business. Good luck!
		Lehmar_MoneyBorrowed = 0 ;
		AI_StopProcessInfos(self);
	}
	else
	{
		if (Lehmar_MoneyLoaned ==  50 )
		{
			Lehmar_MoneyGeleihen_WithInterest = 60 ;
		};
		if (Lehmar_MoneyLoaned ==  200 )
		{
			Lehmar_MoneyGeleihen_WithInterest = 240 ;
		};
		if (Lehmar_MoneyLoaned ==  100 )
		{
			Lehmar_MoneyGeleihen_WithInterest = 120 ;
		};
		if (Lehmar_MoneyLoaned ==  1000 )
		{
			Lehmar_MoneyGeleihen_WithInterest = 1200 ;
		};
		IntToFloat(Lehmar_MoneyBorrowed_WithInterest);

		if (Npc_HasItems(other,ItMi_Gold) >= Lehmar_Geleihen_MitInterest)
		{
			B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeleihen_MitZinsen);
			AI_Output(self,other, " DIA_Lehmar_GELDZURUECK_09_01 " );	// Great! Nice to do business with you.
			Lehmar_MoneyBorrowed = 0 ;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Lehmar_GELDZURUECK_09_02 " );	// Not enough here! Come back when you have the full amount. You still have time. Remember, 20 percent!
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Lehmar_NOCHMALGELD (C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 8;
	condition = DIA_Lehmar_NOCHMALGELD_Condition;
	information = DIA_Lehmar_NOCHMALGELD_Info;
	permanent = TRUE;
	description = " Can I borrow money from you? " ;
};

func int DIA_Lehmar_NOCHMALGELD_Condition()
{
	if ((Lehmar_MoneyLoaned ==  0 ) && (Lehmar_MoneyLoaned_WithInterest !=  0 ))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_NOCHMALGELD_Info()
{
	AI_Output(other,self, " DIA_Lehmar_NOCHMALGELD_15_00 " );	// Can I borrow money from you?

	if (Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTRIIBEN) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg))
	{
		AI_Output(self,other, " DIA_Lehmar_NOCHMALGELD_09_01 " );	// Do you think I'm an idiot? Get out!
	}
	else
	{
		AI_Output(self,other, " DIA_Lehmar_NOCHMALGELD_09_02 " );	// You can't do it anymore! I incurred big expenses and now I have every coin in my account.
		AI_Output(self,other, " DIA_Lehmar_NOCHMALGELD_09_03 " );	// Check back in a few days!
	};
};

instance DIA_Lehmar_PICKPOCKET(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 900;
	condition = DIA_Lehmar_PICKPOCKET_Condition;
	information = DIA_Lehmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his debt book) " ;
};

func int DIA_Lehmar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,Dialog_Back,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if(other.attribute[ATR_DEXTERITY] >= 15)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};

		B_GiveInvItems(self,other,ItWr_debt book, 1 );
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		LehmarLostBookDay = Wld_GetDay();
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
};


instance DIA_Lehmar_BuchWeg (C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_BuchWeg_Condition;
	information = DIA_Lehmar_BuchWeg_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_BuchWeg_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] ==  FALSE ) && (LehmarLostBookDay >  0 ) && (LehmarLostBookDay < Wld_GetDay()) && (self.aivar[AIV_PlayerHasPickedMyPocket] ==  ​​TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lehmar_BuchWeg_Info()
{
	AI_Output(self,other, " DIA_Lehmar_Add_09_00 " );	// Some vile thief stole my ledger!
	AI_Output(self,other, " DIA_Lehmar_Add_09_01 " );	// You don't happen to have anything to do with this, do you?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//Я? Нет.
	AI_Output(self,other, " DIA_Lehmar_Add_09_03 " );	// Yes, yes, okay. Get out of here!
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_verhauen (C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_verhauen_Condition;
	information = DIA_Lehmar_verhauen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lehmar_verhauen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		if ((self.aivar[AIV_DefeatedByPlayer] ==  TRUE ) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg) || (Lehmar_over ==  TRUE ))
		{
			return TRUE;
		};
	};
};

func void DIA_Lehmar_verhauen_Info()
{
	B_Say(self,other,"$NOTNOW");
};

var int ShramCanFight;

instance DIA_LEHMAR_KILLNOW(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = dia_lehmar_killnow_condition;
	information = dia_lehmar_killnow_info;
	description = " Hello from Asmal! " ;
};

func int dia_lehmar_killnow_condition()
{
	if(MIS_KILLTARGET2 == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lehmar_killnow_info()
{
	var C_Npc guardian;

	guardian = Hlp_GetNpc(vlk_6120_lemarguard);
	AI_Output(other,self, " DIA_Lehmar_KillNow_01_00 " );	// Hello from Asmal!
	AI_Output(self,other, " DIA_Lehmar_KillNow_01_03 " );	// What? (confused) So what do you mean, you work for that bastard?
	AI_Output(self,other, " DIA_Lehmar_KillNow_01_05 " );	// Ha! That would not have thought!
	AI_Output(self,other, " DIA_Lehmar_KillNow_01_06 " );	// It turns out that he sent you to me!
	AI_Output(self,other, " DIA_Lehmar_KillNow_01_07 " );	// But I'm afraid it won't help him much. Snots like you, I have nothing to fear.

	if((ShramIsDead == FALSE) && (Npc_GetDistToNpc(self,guardian) <= 600))
	{
		AI_Output(self,other, " DIA_Lehmar_KillNow_01_15 " );	// My bodyguard will chop you into mincemeat!
		AI_Standup(self);
		AI_GotoNpc(self,guardian);
		AI_TurnToNPC(self,guardian);
		AI_Output(self,other, " DIA_Lehmar_KillNow_01_16 " );	// Hey you! Don't stand like an idol!
		AI_Output(self,other, " DIA_Lehmar_KillNow_01_17 " );	// You know what to do! Deal with him, but live!
		AI_TurnToNPC(self,other);
		ShramCanFight = TRUE;
	};

	AI_Output(self,other, " DIA_Lehmar_KillNow_01_18 " );	// You shouldn't have agreed to this case, boy! It's clearly too tough for you... (grins)
	Info_ClearChoices(dia_lehmar_killnow);
	Info_AddChoice(dia_lehmar_killnow, " ...(we'll see about that!) " ,dia_lehmar_killnow_figth);
};

func void dia_lehmar_killnow_figth()
{	
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);

	if(ShramCanFight == TRUE)
	{
		B_Attack(vlk_6120_lemarguard,other,AR_ReactToWeapon,0);
	};
};

instance DIA_Lehmar_Job(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Job_Condition;
	information = DIA_Lehmar_Job_Info;
	permanent = FALSE;
	description = " Do you have any job for me? " ;
};

func int DIA_Lehmar_Job_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Lehmar_ENTAUSCHIGUNG) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Job_Info()
{
	AI_Output(other,self, " DIA_Lehmar_Job_01_00 " );	// Do you have any job for me?
	AI_Output(self,other, " DIA_Lehmar_Job_01_01 " );	// Do you want to work for me? (thoughtfully) Hmmm... Well, okay.
	AI_Output(self,other, " DIA_Lehmar_Job_01_02 " );	// I just had a problem with one person.
	AI_Output(other,self, " DIA_Lehmar_Job_01_03 " );	// What did he do?
	AI_Output(self,other, " DIA_Lehmar_Job_01_04 " );	// He borrowed a large amount of gold from me!
	AI_Output(self,other, " DIA_Lehmar_Job_01_05 " );	// As he told me himself, he had the opportunity to get rich quickly by selling a swamp in the port district.
	AI_Output(self,other, " DIA_Lehmar_Job_01_06 " );	// And he promised to return twice as much gold as I lent him. But he never showed up!
	AI_Output(self,other, " DIA_Lehmar_Job_01_07 " );	// So. (seriously) Find him and give me my money back!
	AI_Output(self,other, " DIA_Lehmar_Job_01_08 " );	// If he doesn't have any money, then just kill him.
	AI_Output(self,other, " DIA_Lehmar_Job_01_09 " );	// But just do it quietly! I don't want to have anything to do with someone who sells swamp grass.
	AI_Output(self,other, " DIA_Lehmar_Job_01_10 " );	// After all, according to the laws of the city, they can be put in jail for this.
	AI_Output(other,self, " DIA_Lehmar_Job_01_11 " );	// Okay. Where can I find it?
	AI_Output(self,other, " DIA_Lehmar_Job_01_12 " );	// (grinning) If I knew that, the problem would have been solved long ago.
	AI_Output(self,other, " DIA_Lehmar_Job_01_13 " );	// I hope the hint is clear?
	AI_Output(other,self,"DIA_Lehmar_Job_01_14");	//Вполне.
	MIS_LehmarDebt = LOG_Running;
	Log_CreateTopic(TOPIC_LehmarDebt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LehmarDebt,LOG_Running);
	B_LogEntry(TOPIC_LehmarDebt, " A man borrowed a decent amount of money from Lehmar, claiming he knew a way to get rich quick by trading a swamp. But never repaid the debt. Lehmar wants me to find him and beat the money out of him, or just kill him as a warning to others. " );
};

instance DIA_Lehmar_Job_Done(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Job_Done_Condition;
	information = DIA_Lehmar_Job_Done_Info;
	permanent = TRUE;
	description = " I think I found your debtor. " ;
};

func int DIA_Lehmar_Job_Done_Condition()
{
	if((MIS_LehmarDebt == LOG_Running) && (Npc_IsDead(Mil_328_Miliz) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Job_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Lehmar_Job_Done_01_00 " );	// I think I found your debtor.
	AI_Output(self,other, " DIA_Lehmar_Job_Done_01_01 " );	// Good. (calmly) Where's my money?
	AI_Output(other,self, " DIA_Lehmar_Job_Done_01_02 " );	// He didn't have them with him. But he had a huge bag of a swamp with him!
	AI_Output(self,other, " DIA_Lehmar_Job_Done_01_03 " );	// And what did you do?
	AI_Output(other,self, " DIA_Lehmar_Job_Done_01_04 " );	// I killed him. Just like you asked!
	AI_Output(self,other, " DIA_Lehmar_Job_Done_01_05 " );	// Good. (satisfied) You've done my job.
	AI_Output(self,other, " DIA_Lehmar_Job_Done_01_06 " );	// You can keep the grass as a reward!
	AI_Output(self,other, " DIA_Lehmar_Job_Done_01_07 " );	// Now get out! I have more important things to do.
	MIS_LehmarDebt = LOG_Success;
	Log_SetTopicStatus(TOPIC_LehmarDebt,LOG_Success);
	B_LogEntry(TOPIC_LehmarDebt, " Lehmar was pleased that I got rid of his debtor. " );
	AI_StopProcessInfos(self);
};
