
instance DIA_Addon_Snaf_EXIT(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 999;
	condition = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Snaf_PICKPOCKET(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 900;
	condition = DIA_Addon_Snaf_PICKPOCKET_Condition;
	information = DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	return  C_Robbery ( 49 , 56 );
};

func void DIA_Addon_Snaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET,Dialog_Back,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};

func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};


instance DIA_Addon_Snaf_Hi(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 1;
	condition = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Snaf_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Snaf_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_Snaf_Hi_01_00 " );	// Would you like to eat or chat?
};

instance DIA_Addon_Snaf_Cook(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 2;
	condition = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent = FALSE;
	description = " What's on the menu, sir? " ;
};

func int DIA_Addon_Snaf_Cook_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_Cook_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Cook_15_00 " );	// What's on your menu?
	AI_Output(self,other, " DIA_Addon_Snaf_Cook_01_01 " );	// Would recommend trying our new dish, smart guy. It's called 'Flame sliced meat in Melted Teeth' Sauce.
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Info_AddChoice(DIA_Addon_Snaf_Cook, " Flame Sliced? " ,DIA_Addon_Snaf_Cook_FEUER);
	Info_AddChoice(DIA_Addon_Snaf_Cook, " What kind of sauce is 'Melted Teeth'? " ,DIA_Addon_Snaf_Cook_HAMMER);
};

func void DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Cook_FEUER_15_00 " );	// flame sliced?
	AI_Output(self,other, " DIA_Addon_Snaf_Cook_FEUER_01_01 " );	// A crispy, lightly fried meat with marinated fire grass roots.
	AI_Output(self,other, " DIA_Addon_Snaf_Cook_FEUER_01_02 " );	// But don't worry. All ingredients are already in stock.
};

func void DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Cook_HAMMER_15_00 " );	// And what kind of sauce is that? - 'Melted teeth'?
	AI_Output(self,other, " DIA_Addon_Snaf_Cook_HAMMER_01_01 " );	// Sauce made from a liquor so strong it melts teeth. Got the recipe from a kid named Lou.
	AI_Output(self,other, " DIA_Addon_Snaf_Cook_HAMMER_01_02 " );	// You get the right ingredients, make vodka on alchemy tools, and I make the sauce for you. Well?
	Info_AddChoice(DIA_Addon_Snaf_Cook, " I don't have time for this. " ,DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice(DIA_Addon_Snaf_Cook, " Actually, why not? " ,DIA_Addon_Snaf_Cook_YES);
};

func void DIA_Addon_Snaf_Cook_NO()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Cook_HAMMER_NO_15_00 " );	// Everything is fine, of course, but I'm not up to it.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Up to you.
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
};

func void DIA_Addon_Snaf_Cook_YES()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Cook_HAMMER_YES_15_00 " );	// Actually, why not?
	AI_Output(self,other, " DIA_Addon_Snaf_Cook_HAMMER_YES_01_01 " );	// Great. Here is the list.
	B_GiveInvItems(self,other,ITWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_Running;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Log_CreateTopic(Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_Running);
	B_LogEntry(Topic_Addon_Hammer, " Snaf needs a sauce ingredient. He gave me a Hammer drink recipe that I can make at the alchemy table. " );
};

var int Snaf_Tip_Kosten;

instance DIA_Addon_Snaf_Booze(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent = FALSE;
	description = " Here's your moonshine, buddy. " ;
};

func int DIA_Addon_Snaf_Booze_Condition()
{
	if((Npc_HasItems(other,ItFo_Addon_LousHammer) >= 1) && (MIS_SnafHammer == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Snaf_Booze_Info()
{
	B_GivePlayerXP(XP_Addon_Loushammer);
	AI_Output(other,self, " DIA_Addon_Snaf_Booze_15_00 " );	// Here's your moonshine, buddy.
	B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
	AI_Output(self,other, " DIA_Addon_Snaf_Booze_01_01 " );	// Fine, let me make the sauce.
	AI_Output(self,other, " DIA_Addon_Snaf_Booze_01_02 " );	// Here, it's done! You can try right now. There will be hair on your teeth afrter this, no doubt!
	AI_Output(self,other, " DIA_Addon_Snaf_Booze_01_03 " );	// And if you need my help - Its free from now on!
	Snaf_Tip_Cost = 0 ;
	B_GiveInvItems(self,other,ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_SUCCESS);
	B_LogEntry(Topic_Addon_Hammer, " I brought moonshine to Snafu. " );
};

instance DIA_Addon_Snaf_Attentat(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 4;
	condition = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent = FALSE;
	description = " What do you know about the attack? " ;
};


func int DIA_Addon_Snaf_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Attentat_15_00 " );	// What do you know about the attack?
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_01_01 " );	// Are you talking about the attack on Esteban?
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_01_02 " );	// Well, a tavern owner hears everything, but can not prove that everything he heard is true.
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
	Info_AddChoice(DIA_Addon_Snaf_Attentat, " Tell me who I can contact with this. " ,DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice(DIA_Addon_Snaf_Attentat, " What would you do if you were me? " ,DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice(DIA_Addon_Snaf_Attentat, " So, do you still know something? " ,DIA_Addon_Snaf_Attentat_Something);
};

func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Attentat_Something_15_00 " );	// So, do you know something?
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_Something_01_01 " );	// Well, I didn't say that.
};

func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Attentat_GoWhere_15_00 " );	// Tell me at least who I can contact with this.
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_GoWhere_01_01 " );	// What do you care, friend? Drop it.
};

func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Attentat_YouBeingMe_15_00 " );	// What would you do if you were me?
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_YouBeingMe_01_01 " );	// I'd wonder what I know about the man behind the attack.
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_YouBeingMe_01_02 " );	// First, it's most likely a rogue, which means he's here in the camp.
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_YouBeingMe_01_03 " );	// Second, he's probably watching you.
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_YouBeingMe_01_04 " );	// And third, as long as he thinks you're on Esteban's side, there's no way he'll reveal himself to you.
	AI_Output(self,other, " DIA_Addon_Snaf_Attentat_YouBeingMe_01_05 " );	// It's time to ask the real question: what are your chances of finding this person?
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
};


instance DIA_Addon_Snaf_Abrechnung (C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 5;
	condition = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent = TRUE;
	description = " So what are they? " ;
};


func int DIA_Addon_Snaf_Abrechnung_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Snaf_Attempt) && (MY_Judas == LOG_Running) && (Who_is_Snafing ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Abrechnung_15_00 " );	// Well, what are they?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmmm...
	if((Senyan_Erpressung == LOG_Running) && !Npc_IsDead(Senyan))
	{
		AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_02 " );	// Not high, I would say. Some have already noticed that you have regular business with Senyang.
		AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_03 " );	// You need to urgently fix that and cut ties, otherwise you will not see the person behind the attack.
		if (Snaf_Tip_Senyan ==  FALSE )
		{
			B_LogEntry(Topic_Addon_Senyan, " I should cut ties with Senyan. Attacking him directly would be stupid, so I should talk to him first. " );
			Snaf_Tip_Senyan = TRUE;
		};
	}
	 else if ( Npc_IsDead (Senyan))
	{
		AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_04 " );	// You nailed one of Esteban's guys. I guess the one you're looking for will trust you more when you meet him.
		AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_05 " );	// But it's unlikely to open up that easily. You need to know more.
	}
	else
	{
		if (Finn_Petzt ==  TRUE )
		{
			AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_06 " );	// Finn has been visibly flustered since you talked to him.
			AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_07 " );	// And everyone here knows that he gets along well with Esteban.
			AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_08 " );	// It means you said something to him that he obviously didn't want to hear.
			AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_09 " );	// This is sure to please whoever you're looking for.
			AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_10 " );	// Though it's entirely possible that he'll rush to Esteban with this information.
		};
		if(Finn_TellAll == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_11 " );	// They say you told Finn you were working for Esteban.
			AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_12 " );	// I don't know what you're up to, but now the person you're looking for will probably be more careful now.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Snaf_Abrechnung_01_13 " );	// Well, although we can hardly talk about it with certainty.
		};
	};
	if (Snaf_Rechnung ==  FALSE )
	{
		if (Snaf_Once ==  FALSE )
		{
			AI_Output(other,self, " DIA_Addon_Snaf_Abschied_15_14 " );	// Thank you.
			AI_Output(self,other, " DIA_Addon_Snaf_Abschied_01_15 " );	// You didn't hear anything from me, okay?!
			Snaf_Once = TRUE ;
		}
		else
		{
			AI_Output(other,self, " DIA_Addon_Snaf_Abschied_15_16 " );	// Of course.
			AI_Output(self,other, " DIA_Addon_Snaf_Abschied_01_17 " );	// That's it.
		};
	};
};


instance DIA_Addon_Snaf_HIGH (C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HIGH_Info;
	permanent = FALSE;
	description = " I'm from Huno. " ;
};


func int DIA_Addon_Snaf_HOCH_Condition()
{
	if(Huno_zuSnaf == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Snaf_HIGH_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_HOCH_15_00 " );	// I'm from Huno.
	AI_Output(self,other, " DIA_Addon_Snaf_HOCH_01_01 " );	// I see you found the one you were looking for.
	AI_Output(self,other, " DIA_Addon_Snaf_HOCH_01_02 " );	// Go upstairs, they are waiting for you there.
	AI_StopProcessInfos(self);
	AI_Teleport(Fisk,"BL_INN_UP_06");
	B_StartOtherRoutine(Fisk,"MEETING");
	B_GivePlayerXP(XP_Addon_Client);
};


var int cost_once;

instance DIA_Addon_Snaf_People(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent = TRUE;
	description = " What do the locals think of Esteban? " ;
};


func int DIA_Addon_Snaf_People_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Snaf_Attempt ) &&  ! Npc_IsDead ( Stephen ) ) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Snaf_People_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_People_15_00 " );	// What do the locals think of Esteban?
	AI_Output(self,other, " DIA_Addon_Snaf_People_01_01 " );	// You should be more precise in your questioning...
	if ((Cost_Once ==  FALSE ) && (MIS_SnafHammer !=  LOG_SUCCESS ))
	{
		AI_Output(self,other, " DIA_Addon_Snaf_People_01_02 " );	// Information costs money, mate...
		AI_Output(other,self, " DIA_Addon_Snaf_People_15_03 " );	// Well, how much?
		AI_Output(self,other, " DIA_Addon_Snaf_People_01_04 " );	// Ten is fine.
		Snaf_Tip_Cost = 10 ;
		cost_once = TRUE ;
	};
	Info_ClearChoices(DIA_Addon_Snaf_People);
	Info_AddChoice(DIA_Addon_Snaf_People,Dialog_Back,DIA_Addon_Snaf_People_BACK);
	Info_AddChoice(DIA_Addon_Snaf_People,"Paul.",DIA_Addon_Snaf_People_Paul);
	Info_AddChoice(DIA_Addon_Snaf_People,"Huno.",DIA_Addon_Snaf_People_Huno);
	Info_AddChoice(DIA_Addon_Snaf_People,"Fisk.",DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice(DIA_Addon_Snaf_People, "Emilio. " ,DIA_Addon_Snaf_People_Emilio);
	if ( ! Npc_IsDead(Senyan))
	{
		Info_AddChoice(DIA_Addon_Snaf_People,"Senyang.",DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice(DIA_Addon_Snaf_People,"Lennar.",DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice(DIA_Addon_Snaf_People,"Finn.",DIA_Addon_Snaf_People_Finn);
};

func void B_Addon_Snaf_NotEnough()
{
	AI_Output(self,other, " DIA_Addon_Snaf_NotEnough_01_00 " );	// You don't have enough gold, boy!
};

func void DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_People);
};

func void DIA_Addon_Snaf_People_Paul()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Paul_15_00");	//What about Paul?

	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other, " DIA_Addon_Snaf_People_Paul_01_01 " );	// I don't think he's crazy about Esteban. Due to the fact that he works for Huno, he will never get into the mine.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Huno()
{
	AI_Output(other,self, " DIA_Addon_Snaf_People_Huno_15_00 " );	// What does Huno think of Esteban?
	AI_Output(self,other, " DIA_Addon_Snaf_People_Huno_01_01 " );	// Ah, Huno! I know almost nothing about him.
	AI_Output(self,other, " DIA_Addon_Snaf_People_Huno_01_02 " );	// (grins) Of course, I won't charge you for that info.
};

func void DIA_Addon_Snaf_People_Fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//What about Fisk?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other, " DIA_Addon_Snaf_People_Fisk_01_01 " );	// Fisk is Fisk. From pays a share to Esteban and resells the good that he mainly receives from the pirates.
		AI_Output(self,other, " DIA_Addon_Snaf_People_Fisk_01_02 " );	// I don't think he has any kind feelings towards Esteban.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Emilio()
{
	AI_Output(other,self, " DIA_Addon_Snaf_People_Emilio_15_00 " );	// How does Emilio feel about Esteban?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other, " DIA_Addon_Snaf_People_Emilio_01_01 " );	// Well, he's unlikely to ever light a candle for his soul, that's for sure.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Senyan()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Senyan_15_00");	//What about senyan?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other, " DIA_Addon_Snaf_People_Senyan_01_01 " );	// Senyan is one of Esteban's guys. Been working for him for quite some time.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Lennar()
{
	AI_Output(other,self, " DIA_Addon_Snaf_People_Lennar_15_00 " );	// What do you think of Esteban Lennar?
	AI_Output(self,other, " DIA_Addon_Snaf_People_Lennar_01_01 " );	// As far as I can tell, he has no opinion of Esteban.
};

func void DIA_Addon_Snaf_People_Finn()
{
	AI_Output(other,self, " DIA_Addon_Snaf_People_Finn_15_00 " );	// What about Finn?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other, " DIA_Addon_Snaf_People_Finn_01_01 " );	// Excellent miner. He smells gold with his nose.
		AI_Output(self,other, " DIA_Addon_Snaf_People_Finn_01_02 " );	// Esteban appreciates him highly for this. So they get along great with each other.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};


instance DIA_Addon_Snaf_Himself(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 7;
	condition = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent = FALSE;
	description = " And you? What do you think of Esteban? " ;
};


func int DIA_Addon_Snaf_Himself_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Snaf_Attempt ) &&  ! Npc_IsDead ( Stephen ) ) .
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Himself_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_Himself_15_00 " );	// And you? What do you think of Esteban?
	AI_Output(self,other, " DIA_Addon_Snaf_Himself_01_01 " );	// I think we shouldn't talk about him, otherwise you never know...
};


instance DIA_Addon_Snaf_PERM(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 8;
	condition = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent = TRUE;
	description = " How does it work? " ;
};


func int DIA_Addon_Snaf_PERM_Condition()
{
	if ( Npc_IsDead ( Stephen ) && ( SNAF_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_PERM_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_PERM_15_00 " );	// How's it going?
	if (chapter <=  3 )
	{
		AI_Output(self,other, " DIA_Addon_Snaf_PERM_01_01 " );	// Better than ever! Esteban's death is a holiday for me.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Snaf_PERM_01_02 " );	// After Esteban's death, it's easier to breathe here.
		AI_Output(self,other, " DIA_Addon_Snaf_PERM_01_03 " );	// The guys have more gold, and trade with the pirates is slowly recovering.
	};
};

instance DIA_ADDON_SNAF_ORCINVASION(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	condition = dia_addon_snaf_orcinvasion_condition;
	information = dia_addon_snaf_orcinvasion_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_addon_snaf_orcinvasion_condition()
{
	if((SNAF_TP == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_orcinvasion_info()
{
	AI_Output(self,other, " DIA_Addon_Snaf_OrcInvasion_01_00 " );	// Oh, please don't bother me, mate! I don't have time to talk right now.
	AI_StopProcessInfos(self);
	SNAF_TP = TRUE;
};

var int SnafTeachCook;

instance DIA_Addon_Snaf_TeachCook(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 2;
	condition = DIA_Addon_Snaf_TeachCook_Condition;
	information = DIA_Addon_Snaf_TeachCook_Info;
	permanent = FALSE;
	description = " Do you make your own stews? " ;
};

func int DIA_Addon_Snaf_TeachCook_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Snaf_Cook) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_TeachCook_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_TeachCook_01_00 " );	// Do you make your own soup?
	AI_Output(self,other, " DIA_Addon_Snaf_TeachCook_01_01 " );	// Of course. I wish I could trust someone to cook it!
	AI_Output(other,self, " DIA_Addon_Snaf_TeachCook_01_02 " );	// Maybe you can teach me too?
	AI_Output(self,other, " DIA_Addon_Snaf_TeachCook_01_03 " );	// Cooking something? Hmmm... why not.
	AI_Output(self,other, " DIA_Addon_Snaf_TeachCook_01_04 " );	// But don't even think it's free.
	SnafTeachCook = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry( TOPIC_COOK , " Snaf can teach me how to make chowder. " );
};

instance DIA_Addon_Snaf_TeachCookDone(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_TeachCookDone_Condition;
	information = DIA_Addon_Snaf_TeachCookDone_Info;
	permanent = TRUE;
	description = " Teach me how to cook chowder. " ;
};

func int DIA_Addon_Snaf_TeachCookDone_Condition()
{
	if((SnafTeachCook == TRUE) && ((Snaf_Meal_01 == FALSE) || (Snaf_Meal_02 == FALSE) || (Snaf_Meal_03 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_TeachCookDone_Info()
{
	AI_Output(other,self, " DIA_Addon_Snaf_TeachCookDone_01_00 " );	// Teach me how to cook stews.
	AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_01_01 " );	// Good. Where do we start?
	Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
	Info_AddChoice(DIA_Addon_Snaf_TeachCookDone,Dialog_Back,DIA_Addon_Snaf_TeachCookDone_back);

	if(Snaf_Meal_01 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_TeachCookDone, " Black Mushroom Chowder (Price: 500 coins) " ,DIA_Addon_Snaf_TeachCookDone_BlackMeal);
	};
	if(Snaf_Meal_02 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_TeachCookDone, " Seasoned Mushroom Chowder (Price: 750 coins) " ,DIA_Addon_Snaf_TeachCookDone_HotMeal);
	};
	if(Snaf_Meal_03 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_TeachCookDone, " Meat stew (Price: 250 coins) " ,DIA_Addon_Snaf_TeachCookDone_MeatMeal);
	};
};

func void DIA_Addon_Snaf_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
};

func void DIA_Addon_Snaf_TeachCookDone_BlackMeal()
{
	AI_Output(other,self, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_00 " );	// Black mushroom soup.

	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_01 " );	// There is nothing easier. To start, you will need about fifty dark mushrooms.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_02 " );	// Put them in a vat of water and boil until the water turns black.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_03 " );	// Then add a leaf of fire grass. This will take the bitterness out of the soup itself!
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_04");	//I see.
		AI_Print( " Learned the recipe for cooking food - 'Black Mushroom Stew' " );
		B_LogEntry( TOPIC_COOK , " Now I can cook black mushroom stew. For this I need fifty dark mushrooms and a leaf of fire grass. " );
		Snd_Play("LevelUP");
		Snaf_Meal_01 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_05 " );	// Are you taking me for a fool?
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_06 " );	// I won't teach you anything until I see the gold.
		Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
	};
};

func void DIA_Addon_Snaf_TeachCookDone_HotMeal()
{
	AI_Output(other,self, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_00 " );	// Materaya mushroom soup.

	if(Npc_HasItems(hero,ItMi_Gold) >= 750)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,750);
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_01 " );	// To make the stew rich, the main thing is not to spare mushrooms for it.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_02 " );	// Put fifty pieces in a cauldron, add fireroot for a spicy kick, and slowly boil it all in the cauldron.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_03 " );	// In less than half an hour, the stew will be ready.
		AI_Print( " Learned the recipe for cooking food - 'Mushroom Chowder' " );
		B_LogEntry( TOPIC_COOK , " Now I can cook seasoned mushroom stew. For this I will need fifty meat mushrooms and a fire root. " );
		Snd_Play("LevelUP");
		Snaf_Meal_02 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_04 " );	// Are you taking me for a fool?
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_HotMeal_01_05 " );	// I won't teach you anything until I see the gold.
		Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
	};
};


func void DIA_Addon_Snaf_TeachCookDone_MeatMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_00");	//Meat stew.

	if(Npc_HasItems(hero,ItMi_Gold) >= 250)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,250);
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_01 " );	// This is my own recipe! Nothing fancy.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_02 " );	// Just a couple of meat mushrooms and meatbug meat.
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_03 " );	// You throw everything into the cauldron, boil it - and you get the most delicious dish I have ever tasted.
		AI_Print( " Recipe for 'Meat Stew' has been learned " );
		B_LogEntry( TOPIC_COOK , " Now I know how to cook meat stew. For this I need a couple of dark mushrooms and beetle meat. " );
		Snd_Play("LevelUP");
		Snaf_Meal_03 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_04 " );	// Are you taking me for a fool?
		AI_Output(self,other, " DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_05 " );	// I won't teach you anything until I see the gold.
		Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
	};
};

// ----------------------------------bones------------- --------------------

instance DIA_BDT_1098_Addon_Snaf_Game(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_BDT_1098_Addon_Snaf_Game_condition;
	information = DIA_BDT_1098_Addon_Snaf_Game_info;
	description = " Do you want to play some dice? " ;
};

func int DIA_BDT_1098_Addon_Snaf_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Hi))
	{
		return TRUE;
	};
};

func void DIA_BDT_1098_Addon_Snaf_Game_info()
{
 	AI_Output(other,self, " DIA_BDT_1098_Addon_Snaf_Game_01_00 " ); // Would you like to play some dice?
 	AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_Game_01_01 " ); // With you? Hmmm... You don't seem like a skilled player.
 	AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_Game_01_02 " ); // But why not. I never refuse free money!
	SnafPlayResult = 100;
	Menu_WriteInt("AST","SysTimer05",0);
};

instance DIA_BDT_1098_Addon_Snaf_GamePlay(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 900;
	condition = DIA_BDT_1098_Addon_Snaf_GamePlay_condition;
	information = DIA_BDT_1098_Addon_Snaf_GamePlay_info;
	permanent = TRUE;
	description = " Let's play dice! " ;
};

func int DIA_BDT_1098_Addon_Snaf_GamePlay_condition()
{
	if ((Npc_KnowsInfo(other,DIA_BDT_1098_Addon_Snaf_Game) ==  TRUE ) && (Mount_Up ==  FALSE ) && (FlyCarpetIsOn ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_BDT_1098_Addon_Snaf_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer05");

	if(CheckLastGame >= SnafPlayResult)
	{
		CheckLastSum = CheckLastGame - SnafPlayResult;
	};

	AI_Output(other,self, " DIA_BDT_1098_Addon_Snaf_GamePlay_01_00 " );	// Let's play dice!

	if(SnafPlayResult >= CheckLastGame)
	{
		if((SnafPlayResult > 0) && (SnafDayFlag == FALSE))
		{
			AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_GamePlay_01_01 " );	// Come on, show me what you're capable of.
			PlayPocker(1,self);
		}
		else
		{
			if(SnafDayFlag == FALSE)
			{
				AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_GamePlay_01_02 " );	// No, mate! Good things come in small packages.  
				SnapDayPlay = Wld_GetDay();
				SnafDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GamePlay_01_03");	//Not now!
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_GamePlay_01_04 " );	// The last time you owed me a decent amount for a game.
		AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_GamePlay_01_05 " );	// So we'll have to give it away first.
		Info_ClearChoices(DIA_BDT_1098_Addon_Snaf_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_BDT_1098_Addon_Snaf_GamePlay,"Here is your money.",DIA_BDT_1098_Addon_Snaf_GamePlay_Here);
		};

		Info_AddChoice(DIA_BDT_1098_Addon_Snaf_GamePlay, " I don't have that much money. " ,DIA_BDT_1098_Addon_Snaf_GamePlay_No);
	};
};

func void DIA_BDT_1098_Addon_Snaf_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	SnafPlayResult = CheckLastGame;
	AI_Output(other,self, " DIA_BDT_1098_Addon_Snaf_GamePlay_Here_01_01 " );	// Here's your money.
	AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_GamePlay_Here_01_02 " );	// That's great! Now you can play.
	PlayPocker(1,self);
};

func void DIA_BDT_1098_Addon_Snaf_GamePlay_No()
{
	AI_Output(other,self, " DIA_BDT_1098_Addon_Snaf_GamePlay_No_01_01 " );	// I don't have that much money.
	AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_GamePlay_No_01_02 " );	// Then I can't help you.
	Info_ClearChoices(DIA_BDT_1098_Addon_Snaf_GamePlay);
};

instance DIA_BDT_1098_Addon_Snaf_GameEnd(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_BDT_1098_Addon_Snaf_GameEnd_condition;
	information = DIA_BDT_1098_Addon_Snaf_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_BDT_1098_Addon_Snaf_GameEnd_condition()
{
	if((MustTellResult_Snaf == TRUE) && ((SnafLost == TRUE) || (SnafWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_BDT_1098_Addon_Snaf_GameEnd_info()
{
	if(SnafLost == TRUE)
	{
		AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_GameEnd_00 " );	// Incredible! You beat me! Not expected...
		SnafLost = FALSE ;
	}
	else if(SnafWon == TRUE)
	{
		AI_Output(self,other, " DIA_BDT_1098_Addon_Snaf_GameEnd_01 " );	// I'd rather have your gold. You don't mind, do you?
		SnafWon = TRUE;
	};

	MustTellResult_Snaf = FALSE;
};
