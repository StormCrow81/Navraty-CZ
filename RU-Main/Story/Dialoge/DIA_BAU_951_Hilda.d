
instance DIA_Hilda_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_EXIT_Condition;
	information = DIA_Hilda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Hilda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Hilda_Hello (C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_Hallo_Condition;
	information = DIA_Hilda_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hilda_Hallo_Condition()
{
	if ((MY_Lobart_Room !=  LOG_SUCCESS ) && (Chapter <  3 ))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Hilda_Hallo_17_00 " );	// Hey, were you summoned here? Get out of my house immediately. I don't do charity.
	}
	else
	{
		AI_Output(self,other, " DIA_Hilda_Hallo_17_01 " );	// Yes, what else?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_WasZuEssen (C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_WasZuEssen_Condition;
	information = DIA_Hilda_WasZuEssen_Info;
	permanent = TRUE;
	description = " Can you give me something to eat? " ;
};


func int DIA_Hilda_WasZuEssen_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Hilda_Hallo) || (MIS_Lobart_Rueben ==  LOG_SUCCESS )) && (Chapter <  3 ))
	{
		return TRUE;
	};
};

func void DIA_Hilda_WasZuEssen_Info()
{
	var int Rueben_TagNull;
	if(hero.guild == GIL_NONE)
	{
		AI_Output(other,self, " DIA_Hilda_WasZuEssen_15_00 " );	// Can you give me something to eat?
		if(MIS_Lobart_Rueben == LOG_SUCCESS)
		{
			if(!Npc_KnowsInfo(other,DIA_Hilda_PfanneTooLate))
			{
				if(Hilda_Stew_Day != Wld_GetDay())
				{
					B_GiveInvItems(self,other,ItFo_Stew,1);
					AI_Output(self,other, " DIA_Hilda_WasZuEssen_17_01 " );	// Here, take this. You're a good guy.
					Hilda_Stew_Day = Wld_GetDay();
				}
				else  if ((Wld_GetDay() ==  0 ) && (Rueben_TagNull ==  FALSE ))
				{
					AI_Output(self,other, " DIA_Hilda_WasZuEssen_17_02 " );	// You can come back for more tomorrow.
					B_GiveInvItems(self,other,ItFo_Stew,1);
					Hilda_Stew_Day = Wld_GetDay();
					Rueben_TagNull = TRUE;
					Log_CreateTopic(Topic_Bonus,LOG_NOTE);
					B_LogEntry(Topic_Bonus, " I can get a plate of turnip stew from Hilda every day. " );
				}
				else
				{
					AI_Output(self,other, " DIA_Hilda_WasZuEssen_17_03 " );	// You already got your portion for today! Come in later.
				};
			}
			else
			{
				AI_Output(self,other, " DIA_Hilda_WasZuEssen_17_04 " );	// We don't feed slackers here. Get out!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Hilda_WasZuEssen_17_05 " );	// I only feed those who work here!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Hilda_WasZuEssen_17_06 " );	// I'm sure you have enough money to buy your own food in the city.
	};
};


instance DIA_Hilda_BringBeet (C_Info)
{
	npc = BAU_951_Hilda;
	nr = 1;
	condition = DIA_Hilda_BringBeet_Condition;
	information = DIA_Hilda_BringBeet_Info;
	permanent = FALSE;
	description = " I brought you a turnip... " ;
};


func int DIA_Hilda_BringBeet_Condition()
{
	if ((MIS_Lobart_RoomToHilda == LOG_Running) && (Npc_HasItems(other,ItPl_Beet) >=  1 ) && (Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Hilda_BringBeet_Info()
{
	AI_Output(other,self, " DIA_Hilda_BringBeet_15_00 " );	// I brought you a turnip...

	if(Npc_HasItems(other,ItPl_Beet) >= 20)
	{
		B_GiveInvItems(other,self,ItPl_Beet,Npc_HasItems(other,ItPl_Beet));
		AI_Output(self,other, " DIA_Hilda_BringBeet_17_01 " );	// Great!...(laughs) Now I can feed everyone!
		AI_Output(self,other, " DIA_Hilda_BringBeet_17_02 " );	// Since you're here anyway... I saw a traveling merchant pass by a few minutes ago.
		AI_Output(self,other, " DIA_Hilda_BringBeet_17_03 " );	// He may have stopped somewhere on his way to town. Go to him. Maybe he'll have a frying pan for me.
		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other, " DIA_Hilda_BringBeet_17_04 " );	// What?! That's all?
		}
		else
		{
			AI_Output(self,other, " DIA_Hilda_BringBeet_17_05 " );	// This is not enough.
		};
		AI_Output(self,other, " DIA_Hilda_BringBeet_17_06 " );	// Go to the field and collect more. My people are hungry!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hilda_Shopping (C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_Shopping_Condition;
	information = DIA_Hilda_Shopping_Info;
	permanent = FALSE;
	description = " Give me some gold and I'll go to this merchant for you. " ;
};


func int DIA_Hilda_Shopping_Condition()
{
	if ((MY_Lobart_RoomToHilda ==  LOG_SUCCESS ) && (Chapter <  3 ))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Shopping_Info()
{
	AI_Output(other,self, " DIA_Hilda_Einkaufen_15_00 " );	// Give me gold and I'll go to this merchant for you...

	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Hilda_Einkaufen_17_01 " );	// Can you be trusted? Just try spending that money on booze and see what happens!
	};

	B_GiveInvItems(self,other,ItMi_Gold,5);
	MIS_Hilda_PafanneKaufen = LOG_Running;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();
	Log_CreateTopic(TOPIC_Hilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda,LOG_Running);
	B_LogEntry(TOPIC_Hilda, " Hilda, farmer Lobart's wife, wants me to buy a frying pan for her from the traveling merchant. " );
};


instance DIA_Hilda_PfanneGeholt (C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_PfanneGeholt_Condition;
	information = DIA_Hilda_PanGeholt_Info;
	permanent = FALSE;
	description = " Here's your frying pan. " ;
};


func int DIA_Hilda_PfanneGeholt_Condition()
{
	if ((MIS_Hilda_PfanneKaufen == LOG_Running) && (Npc_HasItems(other,ItMy_Pan) >  0 ) && (Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneGeholt_Info()
{
	AI_Output(other,self, " DIA_Hilda_PfanneGeholt_15_00 " );	// Here's your frying pan.
	B_GiveInvItems(other,self,ItMi_Pan,1);
	AI_Output(self,other, " DIA_Hilda_PfanneGeholt_17_01 " );	// Great. Let's see if its a good one...
	MIS_Hilda_PafanneKaufen = LOG_SUCCESS ;
	B_GivePlayerXP(XP_HildaHolPfanne);
};


instance DIA_Hilda_PfanneTooLate(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 1;
	condition = DIA_Hilda_PfanneTooLate_Condition;
	information = DIA_Hilda_PfanneTooLate_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hilda_PfanneTooLate_Condition()
{
	if ((MIS_Hilda_PfanneKaufen == LOG_Running) && (MIS_Hilda_PfanneKaufen_Day <= (Wld_GetDay() -  1 )) && (Chapter <  3 ))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneTooLate_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Hilda_PfanneTooLate_17_00 " );	// You have the nerve to show up here? What have you done with my money, you bum?!
	}
	else
	{
		AI_Output(self,other, " DIA_Hilda_PfanneTooLate_17_01 " );	// Where have you been all this time? And where is my money that I gave you for the frying pan?
	};
	if(Npc_HasItems(other,ItMi_Pan) > 0)
	{
		AI_Output(other,self, " DIA_Hilda_PfanneTooLate_15_02 " );	// Sorry, I'm a little late. Here's your frying pan!
		B_GiveInvItems(other,self,ItMi_Pan,1);
		AI_Output(self,other, " DIA_Hilda_PfanneTooLate_17_03 " );	// Ah-h, give it here! Well, aren't you impudent - just incredible!
		MIS_Hilda_PafanneKaufen = LOG_SUCCESS ;
		B_GivePlayerXP(XP_HildaHolPfanne / 2);
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 20)
		{
			AI_Output(self,other, " DIA_Hilda_PfanneTooLate_17_04 " );	// Ah! You still have them! Give them back, now.
			B_GiveInvItems(other,self,ItMi_Gold,20);
			AI_Output(self,other, " DIA_Hilda_PfanneTooLate_17_05 " );	// Well, you're impudent - just incredible!
		}
		else
		{
			AI_Output(self,other, " DIA_Hilda_PfanneTooLate_17_06 " );	// You don't have any money?! I gave you 20 gold!
			AI_Output(self,other, " DIA_Hilda_PfanneTooLate_17_07 " );	// Get out of my sight, you dirty thief!
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};
		MIS_Hilda_PafanneKaufen = LOG_FAILED ;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hilda_KAP3_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP3_EXIT_Condition;
	information = DIA_Hilda_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KRANK (C_Info)
{
	npc = BAU_951_Hilda;
	nr = 30;
	condition = DIA_Hilda_KRANK_Condition;
	information = DIA_Hilda_KRANK_Info;
	permanent = TRUE;
	description = " How are you feeling? " ;
};


func int DIA_Hilda_KRANK_Condition()
{
	if ((Chapter >=  3 ) && ((hero.guild ==  GIL_MIL ) || (hero.guild ==  GIL_PAL ) || (hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW )) && ( MIS_HealHilda !=  LOG_SUCCESS ))
	{
		return TRUE;
	};
};


var int DIA_Hilda_KRANK_OnTime;

func void DIA_Hilda_KRANK_Info()
{
	AI_Output(other,self, " DIA_Hilda_KRANK_15_00 " );	// How do you feel?
	AI_Output(self,other, " DIA_Hilda_KRANK_17_01 " );	// Horrible. I have that terrible fever again.
	AI_Output(self,other, " DIA_Hilda_KRANK_17_02 " );	// I should go to the town healer, but I'm too weak.
	if (DIA_Hilda_KRANK_OnTime ==  FALSE )
	{
		Info_ClearChoices(DIA_Hilda_KRANK);
		Info_AddChoice(DIA_Hilda_KRANK, " Get well . I have to go. " ,DIA_Hilda_KRANK_besserung);
		Info_AddChoice(DIA_Hilda_KRANK, " Can I help you with something? " ,DIA_Hilda_KRANK_helfen);
		DIA_Hilda_KRANK_OnTime = TRUE ;
	};
	MIS_HealHilda = LOG_Running;
};

func void DIA_Hilda_SICK_improvement()
{
	AI_Output(other,self, " DIA_Hilda_KRANK_besserung_15_00 " );	// Get well soon. I need to go.
	AI_Output(self,other, " DIA_Hilda_KRANK_besserung_17_01 " );	// I just hope I get better soon.
	AI_StopProcessInfos(self);
};

func void DIA_Hilda_KRANK_helfen()
{
	AI_Output(other,self, " DIA_Hilda_KRANK_helfen_15_00 " );	// Is there anything I can do to help?
	AI_Output(self,other, " DIA_Hilda_KRANK_helfen_17_01 " );	// It would be great if you could go to Vatras and bring me some medicine.
	AI_Output(self,other, " DIA_Hilda_KRANK_helfen_17_02 " );	// He knows what I need! I can't get there on my own.
	Log_CreateTopic(TOPIC_HealHilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda,LOG_Running);
	B_LogEntry(TOPIC_HealHilda, " Lobart's wife Hilda is sick, but Vatras has a medicine that may cure her. " );
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_HEILUNGBRINGEN (C_Info)
{
	npc = BAU_951_Hilda;
	nr = 31;
	condition = DIA_Hilda_HEILUNGBRINGEN_Condition;
	information = DIA_Hilda_HEILUNGBRINGEN_Info;
	description = " I brought you some medicine. " ;
};


func int DIA_Hilda_HEILUNGBRINGEN_Condition()
{
	if(Npc_HasItems(other,ItPo_HealHilda_MIS))
	{
		return TRUE;
	};
};

func void DIA_Hilda_HEILUNGBRINGEN_Info()
{
	AI_Output(other,self, " DIA_Hilda_HEILUNGBRINGEN_15_00 " );	// I brought you medicine.
	B_GiveInvItems(other,self,ItPo_HealHilda_MIS,1);
	AI_Output(self,other, " DIA_Hilda_HEILUNGBRINGEN_17_01 " );	// Oh! If only there were more people like you. Thank you so much!
	B_UseItem(self,ItPo_HealHilda_MIS);
	AI_Output(self,other, " DIA_Hilda_HEILUNGBRINGEN_17_02 " );	// Hopefully these few coins will be enough.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_HealHilda = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealHilda);
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_DISTURB(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 32;
	condition = DIA_Hilda_DISTURB_Condition;
	information = DIA_Hilda_DISTURB_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Hilda_DISTURB_Condition()
{
	if((MIS_HealHilda == LOG_SUCCESS) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Kapitel > 3)))
	{
		return TRUE;
	};
};

func void DIA_Hilda_DISTURB_Info()
{
	if(MIS_HealHilda == LOG_SUCCESS)
	{
		AI_Output(other, self, " DIA_Hilda_DISTURB_15_00 " );	// How are you?
		AI_Output(self,other, " DIA_Hilda_DISTURB_17_01 " );	// Already better, thank you.
	}
	else
	{
		AI_Output(self,other, " DIA_Hilda_DISTURB_17_02 " );	// Not much better...
	};
};


instance DIA_Hilda_KAP4_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP4_EXIT_Condition;
	information = DIA_Hilda_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KAP5_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP5_EXIT_Condition;
	information = DIA_Hilda_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KAP6_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP6_EXIT_Condition;
	information = DIA_Hilda_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_PICKPOCKET(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 900;
	condition = DIA_Hilda_PICKPOCKET_Condition;
	information = DIA_Hilda_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hilda_PICKPOCKET_Condition()
{
	return  C_Robbery ( 26 , 35 );
};

func void DIA_Hilda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
	Info_AddChoice(DIA_Hilda_PICKPOCKET,Dialog_Back,DIA_Hilda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hilda_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hilda_PICKPOCKET_DoIt);
};

func void DIA_Hilda_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

func void DIA_Hilda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

instance DIA_Hilda_SharpKnife(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 31;
	condition = DIA_Hilda_SharpKnife_Condition;
	information = DIA_Hilda_SharpKnife_Info;
	description = " Do you have another job for me? " ;
};

func int DIA_Hilda_SharpKnife_Condition()
{
	if (MIS_Hilda_PafanneKaufen ==  LOG_SUCCESS )
	{
		return TRUE;
	};
};

func void DIA_Hilda_SharpKnife_Info()
{
	AI_Output(other,self, " DIA_Hilda_SharpKnife_15_00 " );	// Do you have another job for me?
	AI_Output(self,other, " DIA_Hilda_SharpKnife_17_01 " );	// Yes, I think there's something... My kitchen knife is quite dull.
	AI_Output(self,other, " DIA_Hilda_SharpKnife_17_02 " );	// I need someone to go to the town blacksmith and sharpen it.
	AI_Output(other,self, " DIA_Hilda_SharpKnife_17_03 " );	// I could help you. I'm heading to the city soon anyway.
	AI_Output(self,other, " DIA_Hilda_SharpKnife_17_04 " );	// Good. Here, take it and the money for the job. But don't you dare spend the gold! Understood?
	B_GiveInvItems(self,other,ItMi_Gold,10);
	B_GiveInvItems(self,other,ItMi_HildaKnife,1);
	AI_Output(other,self,"DIA_Hilda_SharpKnife_17_05");	//Of course.
	MIS_Hilda_SharpKnife = LOG_Running;
	Log_CreateTopic(TOPIC_Hilda_SharpKnife,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda_SharpKnife,LOG_Running);
	B_LogEntry(TOPIC_Hilda_SharpKnife, " Hilda needs someone to go to the town blacksmith and sharpen her kitchen knife. " );
};

instance DIA_Hilda_SharpKnife_Done(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 31;
	condition = DIA_Hilda_SharpKnife_Done_Condition;
	information = DIA_Hilda_SharpKnife_Done_Info;
	description = " Here is your knife. " ;
};

func int DIA_Hilda_SharpKnife_Done_Condition()
{
	if((MIS_Hilda_SharpKnife == LOG_Running) && (HildaSharpKnife == TRUE) && (Npc_HasItems(other,ItMi_HildaKnife) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hilda_SharpKnife_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Hilda_SharpKnife_Done_15_00 " );	// Here's your knife.
	AI_Output(self,other, " DIA_Hilda_SharpKnife_Done_17_01 " );	// Finally! Give it here.
	B_GiveInvItems(other,self,ItMi_HildaKnife,1);
	AI_Output(self,other, " DIA_Hilda_SharpKnife_Done_17_02 " );	// Hmmm... Perfectly sharpened! Thank you.
	AI_Output(self,other, " DIA_Hilda_SharpKnife_Done_17_03 " );	// Here, take this soup for your efforts. I just made it!
	B_GiveInvItems(self,other,ItFo_HildaStew,1);
	AI_Output(other,self,"DIA_Hilda_SharpKnife_17_05");	//Thank you.
	MIS_Hilda_SharpKnife = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Hilda_SharpKnife,LOG_SUCCESS);
	B_LogEntry(TOPIC_Hilda_SharpKnife, " I brought Hilda her knife. She was happy. " );
};
