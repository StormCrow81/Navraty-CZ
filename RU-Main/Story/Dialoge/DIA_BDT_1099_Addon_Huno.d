
instance DIA_Addon_Huno_EXIT(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 999;
	condition = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Huno_PICKPOCKET(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 900;
	condition = DIA_Addon_Huno_PICKPOCKET_Condition;
	information = DIA_Addon_Huno_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Huno_PICKPOCKET_Condition()
{
	return  C_Robbery ( 85 , 102 );
};

func void DIA_Addon_Huno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Huno_PICKPOCKET,Dialog_Back,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
};

func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
};


instance DIA_Addon_Huno_Abwimmeln(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 1;
	condition = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst ==  TRUE )
	{
		return TRUE;
	};
	if ((Who_is_Snaf ==  TRUE ) &&  ! Npc_KnowsInfo(other,DIA_Addon_Fish_Meeting) && Npc_IsInState(self,ZS_Talk));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Huno_Abwimmeln_Info()
{
	if (Huno_MEGA_Angepisst ==  TRUE )
	{
		AI_Output(self,other, " DIA_Addon_Huno_Abwimmeln_06_00 " );	// What the hell do you want here? Get out!
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Huno_Abwimmeln_06_01 " );	// What are you waiting for? Well, let's go to the tavern!
	};
	AI_StopProcessInfos(self);
};


var int Knows_Escape;
var int Huno_Angepisst;

instance DIA_Addon_Huno_Hi(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 1;
	condition = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent = FALSE;
	description = " I see you ate the dog in your business. " ;
};


func int DIA_Addon_Huno_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Huno_Hi_15_00 " );	// I see you ate the dog in your business.
	AI_Output(self,other, " DIA_Addon_Huno_Hi_06_01 " );	// And not just one. Did you bring steel?
	AI_Output(other,self, " DIA_Addon_Huno_Hi_15_02 " );	// Steel? I think you have confused me with someone...
	AI_Output(self,other, " DIA_Addon_Huno_Hi_06_03 " );	// Hmm... Have we crossed paths before?
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Info_AddChoice(DIA_Addon_Huno_Hi, " Well, yes. In the Old Camp. " ,DIA_Addon_Huno_Hi_JA);
	Info_AddChoice(DIA_Addon_Huno_Hi, " I think not. No, they didn't. " ,DIA_Addon_Huno_Hi_NO);
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, " Huno sells metal items. " );
};

func void DIA_Addon_Huno_Hi_JA()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Huno_Hi_JA_15_00 " );	// Well, yes! At the Old Camp.
	AI_Output(self,other, " DIA_Addon_Huno_Hi_JA_06_01 " );	// Old Camp...yeah...you're that curious kid. I thought you were dead!
	AI_Output(other,self, " DIA_Addon_Huno_Hi_JA_15_02 " );	// Everyone thinks so. Are there any more survivors?
	AI_Output(self,other, " DIA_Addon_Huno_Hi_JA_06_03 " );	// Not much. Some followed the Raven, as did I. For many others, the Old Camp has become a mass grave.
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Knows_Flucht = TRUE ;
};

func void DIA_Addon_Huno_Hi_NO()
{
	AI_Output(other,self, " DIA_Addon_Huno_Hi_NO_15_00 " );	// I think not. No, they didn't cross.
	AI_Output(self,other, " DIA_Addon_Huno_Hi_NO_06_01 " );	// Hmm... My memory is leaky... Oh well.
	Info_ClearChoices(DIA_Addon_Huno_Hi);
};


instance DIA_Addon_Huno_Blitz(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 2;
	condition = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent = FALSE;
	description = " Tell me, how did you escape? " ;
};


func int DIA_Addon_Huno_Blitz_Condition()
{
	if ((Knows_Exit ==  TRUE ) && (Who_Expected ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Huno_Blitz_Info()
{
	AI_Output(other,self, " DIA_Addon_Huno_Blitz_15_00 " );	// Tell me, how did you escape?
	AI_Output(self,other, " DIA_Addon_Huno_Blitz_06_01 " );	// Well, as soon as the Barrier was gone, there was quite a stir.
	AI_Output(self,other, " DIA_Addon_Huno_Blitz_06_02 " );	// Someone was hiding, someone was running, and someone was robbing everything.
	AI_Output(other,self, " DIA_Addon_Huno_Blitz_15_03 " );	// What did you do?
	AI_Output(self,other, " DIA_Addon_Huno_Blitz_06_04 " );	// I was just about to leave the camp when this bright flash happened and my eyes nearly popped out in pain.
	AI_Output(self,other, " DIA_Addon_Huno_Blitz_06_05 " );	// What do you think? I got hit by that damn lightning! To this day, I still feel like I can hear that crackle.
	AI_Output(self,other, " DIA_Addon_Huno_Blitz_06_06 " );	// Later I was told that Torus had found me. He took me with him.
};


var int Huno_ArmorPerm;
var int huno_armorperm_two;

instance DIA_Addon_Huno_Armor(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent = TRUE;
	description = " I wish I had better armor. " ;
};


func int DIA_Addon_Huno_Armor_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Found_Hi) && (Found_Angepisst ==  FALSE ) && ((Found_ArmorPerm ==  FALSE ) || ( FIND_ARMORPERM_TWO  ==  FALSE ))) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Armor_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
	AI_Output(other,self, " DIA_Addon_Huno_Armor_15_00 " );	// I wish I had better armor.
	if ( Cheap_Armor ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Huno_Armor_06_01 " );	// I can suggest these. Expensive? Don't blame me, blame Esteban.
		AI_Output(self,other, " DIA_Addon_Huno_Armor_06_02 " );	// The damned jackal takes his share of every piece of armor I sell.
		BDT_Armor_H_Value = 2100;
		BDT_ARMOR_F_VALUE = 2400;
		Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
		if(Huno_ArmorPerm == FALSE)
		{
			Info_AddChoice(DIA_Addon_Huno_Armor, " Bandit Armor (Price: 2100 coins) " ,DIA_Addon_Huno_Armor_BUY);
		};
		if((MIS_Huno_Stahl == LOG_SUCCESS) && (HUNO_ARMORPERM_TWO == FALSE))
		{
			Info_AddChoice(DIA_Addon_Huno_Armor, " Heavy Bandit Armor (Price: 2400 coins) " ,dia_addon_huno_armor_buy2);
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Huno_Armor_15_03 " );	// Fisk said I could get a discount?
		AI_Output(self,other, " DIA_Addon_Huno_Armor_06_04 " );	// Fisk, you say? Hmm, well, I really owe him. Okay, you'll get a discount.
		BDT_Armor_H_Value = 1400;
		BDT_ARMOR_F_VALUE = 1700;
		Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
		if(Huno_ArmorPerm == FALSE)
		{
			Info_AddChoice(DIA_Addon_Huno_Armor, " Bandit Armor (Price: 1400 coins) " ,DIA_Addon_Huno_Armor_BUY);
		};
		if((MIS_Huno_Stahl == LOG_SUCCESS) && (HUNO_ARMORPERM_TWO == FALSE))
		{
			Info_AddChoice(DIA_Addon_Huno_Armor, " Heavy Bandit Armor (Price: 1700 coins) " ,dia_addon_huno_armor_buy2);
		};
	};
};

func void DIA_Addon_Huno_Armor_BACK()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};

func void DIA_Addon_Huno_Armor_BUY()
{
	AI_Output(other,self, " DIA_Addon_Huno_Armor_Buy_15_00 " );	// Okay, I'll take the armor.
	if(B_GiveInvItems(other,self,ItMi_Gold,BDT_Armor_H_Value))
	{
		AI_Output(self,other, " DIA_Addon_Huno_Armor_Buy_06_01 " );	// Great.
		B_GiveInvItems(self,other,ItAr_BDT_H,1);
		Huno_ArmorPerm = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Huno_Armor_Buy_06_02 " );	// No money - no chain mail.
	};
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};

func void dia_addon_huno_armor_buy2()
{
	AI_Output(other,self, " DIA_Addon_Huno_Armor_Buy_15_00 " );	// Okay, I'll take the armor.
	if(B_GiveInvItems(other,self,ItMi_Gold,BDT_ARMOR_F_VALUE))
	{
		AI_Output(self,other, " DIA_Addon_Huno_Armor_Buy_06_01 " );	// Great.
		B_GiveInvItems(self,other,itar_bdt_f,1);
		HUNO_ARMORPERM_TWO = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Huno_Armor_Buy_06_02 " );	// No money - no chain mail.
	};
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};


instance DIA_Addon_Huno_Attentat(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent = FALSE;
	description = " About the assassination attempt on Esteban... " ;
};


func int DIA_Addon_Huno_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Huno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other, " DIA_Addon_Huno_Attentat_06_00 " );	// (suspiciously) What do you want from me?
	AI_Output(other,self, " DIA_Addon_Huno_Attentat_15_01 " );	// Nothing special. Just thought you might know who was behind the attack.
	AI_Output(self,other, " DIA_Addon_Huno_Attentat_06_02 " );	// And where did you get that I should know?
	AI_Output(other,self, " DIA_Addon_Huno_Attentat_15_03 " );	// Well, let's say intuition.
	AI_Output(self,other, " DIA_Addon_Huno_Attentat_06_04 " );	// I don't know anything about this and don't want to know!
};


var int Huno_again;
var int Huno_SomeThings_PERM;
var int Huno_Counter;

func void B_Addon_Huno_Stress()
{
	AI_Output(self,other, " DIA_Addon_Huno_Stress_06_00 " );	// (sighs) Now listen to me. Get your ass out of here before I tear it up.
	Huno_Angepisst = TRUE ;
};


instance DIA_Addon_Huno_SomeThings(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent = TRUE;
	description = " I've heard a couple of rumors about you. " ;
};


func int DIA_Addon_Huno_SomeThings_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attack) && (Huno_SomeThings_PERM ==  FALSE ) && ((Finn_TellAll ==  TRUE ) || (Paul_TellAll ==  TRUE ) || (Emilio_TellAll ==  TRUE )))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Huno_SomeThings_Info()
{
	AI_Output(other,self, " DIA_Addon_Huno_SomeThings_15_00 " );	// I've heard a couple of rumors about you.
	if (Huno_again ==  FALSE )
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//Ну?
		Huno_again = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Huno_SomeThings_06_02 " );	// Again? (threateningly) I hope it's worth it?
	};
	Huno_Counter = 0;
	if(Finn_TellAll == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Huno_SomeThings_15_03 " );	// I heard you weren't there at the time of the attack!
		AI_Output(self,other, " DIA_Addon_Huno_SomeThings_06_04 " );	// (suspiciously) What else?
		Huno_Counter = Huno_Counter + 1;
	};
	if(Paul_TellAll == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Huno_SomeThings_15_05 " );	// Paul says you hate Esteban.
		AI_Output(self,other, " DIA_Addon_Huno_SomeThings_06_06 " );	// (suspiciously) Continue...
		Huno_Counter = Huno_Counter + 1;
	};
	if(Emilio_TellAll == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Huno_SomeThings_15_07 " );	// Emilio blurted out your name! You know something about the attack, but you don't want to talk!
		AI_Output(self,other, " DIA_Addon_Huno_SomeThings_06_08 " );	// (calmly) So you were talking to old man Emilio?
		if(Huno_Counter > 0)
		{
			AI_Output(other,self, " DIA_Addon_Huno_SomeThings_15_09 " );	// He's far from the only one who suspects you!
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other, " DIA_Addon_Huno_SomeThings_06_10 " );	// What else does this mean?
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices(DIA_Addon_Huno_SomeThings);
			Info_AddChoice(DIA_Addon_Huno_SomeThings, " I want to side with you, Huno! " ,DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice(DIA_Addon_Huno_SomeThings, " If you orchestrated an attack, you will pay for it! " ,DIA_Addon_Huno_SomeThings_Pro);
			B_LogEntry(Topic_Addon_Esteban, " Looks like I took Huno's ass. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Huno_SomeThings_06_11 " );	// (threateningly) Maybe I should talk to him too? I'm sure I can convince the old man.
			B_Addon_Huno_Stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Huno_SomeThings_15_12 " );	// Well, actually, that's all...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output(other,self, " DIA_Addon_Huno_SomeThings_Pro_15_00 " );	// If you orchestrated the attack, you'll pay for it!
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Pro_06_01 " );	// (annoyed) Are you really such an idiot, or are you just pretending to be? Think you can suck up to Esteban?
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Pro_06_02 " );	// Get out of here!
	Huno_MEGA_Angepisst = TRUE ;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_Contra()
{
	AI_Output(other,self, " DIA_Addon_Huno_SomeThings_Contra_15_00 " );	// I want to take your side, Huno!
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Contra_06_01 " );	// Against Esteban? Well, prove it.
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Contra_06_02 " );	// I've been waiting for a shipment of steel from pirates.
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Contra_06_03 " );	// I suspect Esteban had a hand in this. He wants to sell it to me at an exorbitant price.
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Contra_06_04 " );	// Of course, he was not alone in this. A couple of bandits in the swamp are also involved. Esteban pays them.
	AI_Output(other,self, " DIA_Addon_Huno_SomeThings_Contra_15_05 " );	// How do you know?
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Contra_06_06 " );	// What is on the mind of a sober thief, on the tongue of a drunken bandit...
	AI_Output(other,self, " DIA_Addon_Huno_SomeThings_Contra_15_07 " );	// What's the name of this drunk bandit?
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Contra_06_08 " );	// His name doesn't concern you. But what you really want is Juan. I didn't see him in the camp for quite some time.
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Contra_06_09 " );	// Look at the swamp. He's most likely there.
	MIS_Huno_Stahl = LOG_Running;
	Huno_Angepisst = FALSE ;
	Log_CreateTopic(Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Huno,LOG_Running);
	) ; _ _ _
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	Info_AddChoice(DIA_Addon_Huno_SomeThings, " Tell me who was behind the attack first! " ,DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice(DIA_Addon_Huno_SomeThings, " Okay, I'll take care of it. " ,DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{
	AI_Output(other,self, " DIA_Addon_Huno_SomeThings_Mission_15_00 " );	// Okay, I'll take care of it.
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_Mission_06_01 " );	// Good. Let's see if we can trust you.
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_TellMeNow()
{
	AI_Output(other,self, " DIA_Addon_Huno_SomeThings_TellMeNow_15_00 " );	// Tell me who was behind the attack first!
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_TellMeNow_06_01 " );	// No. You're a nice guy, sure, but I don't trust you.
	AI_Output(other,self, " DIA_Addon_Huno_SomeThings_TellMeNow_15_02 " );	// Look, either you tell me who it was, or I'll have to report to our mutual friend Esteban.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//Выбирай.
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_TellMeNow_06_04 " );	// (sighs) Okay. I'm arranging a meeting. But only the way I want it, you understand?
	AI_Output(self,other, " DIA_Addon_Huno_SomeThings_TellMeNow_06_05 " );	// Go to the tavern and talk to the owner. He will tell you what to do next.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
	B_LogEntry(Topic_Addon_Esteban, " Huno said I should talk to Snaf. " );
};


instance DIA_Addon_Huno_Package (C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent = FALSE;
	description = " Here is your steel. " ;
};


func int DIA_Addon_Huno_Paket_Condition()
{
	if((MIS_Huno_Stahl == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Steel_Paket) >= 1))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Huno_Paket_Info()
{
	AI_Output(other,self, " DIA_Addon_Huno_Paket_15_00 " );	// Here is your steel.
	Npc_RemoveInvItems(other,ItMi_Addon_Steel_Paket,1);
	CreateInvItems(self,ItMiSwordraw,15);
	AI_Output(self,other, " DIA_Addon_Huno_Paket_06_01 " );	// And Juan, was he there?
	AI_Output(other,self, " DIA_Addon_Huno_Paket_15_02 " );	// Was, how else!
	AI_Output(self,other, " DIA_Addon_Huno_Paket_06_03 " );	// I knew it. The rat - Esteban, was behind it all.
	if(Huno_zuSnaf == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Huno_Paket_06_04 " );	// And you're not bad. I must say, I did not expect.
		AI_Output(self,other, " DIA_Addon_Huno_Paket_06_05 " );	// Here, take this. Small reward.
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Huno_Paket_15_06 " );	// Now let's talk about our contract.
		AI_Output(self,other, " DIA_Addon_Huno_Paket_06_07 " );	// The person you need is waiting for you in the tavern. Talk to the owner.
		Huno_zuSnaf = TRUE;
	};
	B_LogEntry(Topic_Addon_Esteban, " Huno said I should talk to Snaf. " );
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HunoStahl);
};


instance DIA_Addon_Huno_Trade(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 888;
	condition = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Huno_Trade_Condition()
{
	if ((Huno_Angepisst ==  FALSE ) && Wld_IsTime( 6 , 0 , 23 , 0 ))
	{
		return TRUE;
	};
};

var int hnoday;

func void DIA_Addon_Huno_Trade_Info()
{
	where int daynow;
	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_3");
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
};
