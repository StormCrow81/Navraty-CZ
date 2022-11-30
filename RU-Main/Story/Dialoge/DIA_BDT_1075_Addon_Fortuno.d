
instance DIA_Addon_Fortuno_EXIT(C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 999;
	condition = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FORTUNO_NO_TALK ( C_Info );
{
	npc = BDT_1075_Addon_Fortune;
	nr = 1;
	condition = dia_fortuno_no_talk_condition;
	information = dia_fortuno_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_fortuno_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_fortune_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fortuno_PICKPOCKET(C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 900;
	condition = DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information = DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 25 );
};

func void DIA_Addon_Fortuno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fortune_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET,Dialog_Back,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fortune_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Addon_Fortune_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Fortune_PICKPOCKET);
};

func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortune_PICKPOCKET);
};


instance DIA_Addon_Fortuno_Hi (C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 2;
	condition = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Fortuno_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Fortuno_Geheilt_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Once ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Fortuno_Hi_13_00 " );	// (anxious) A dark cloud has covered the house... HE is approaching...
		AI_Output(self,other, " DIA_Addon_Fortuno_Hi_13_01 " );	// With the blood... that is needed to call him... HE who sees me... he sees me... Oh no, go away, go away...
		AI_Output(other,self, " DIA_Addon_Fortuno_Hi_15_02 " );	// Are you all right?
		Fortune_Einmal = TRUE ;
		Log_CreateTopic(Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_Running);
		B_LogEntry(Topic_Addon_Fortuno, " Fortuno is crazy. He needs a 'green acolyte'. " );
	};
	AI_Output(self,other, " DIA_Addon_Fortuno_Hi_13_03 " );	// Green... green acolyte... I can't find...
	Info_ClearChoices(DIA_Addon_Fortune_Hi);
	Info_AddChoice(DIA_Addon_Fortuno_Hi, " Я еще вернусь. " ,DIA_Addon_Fortuno_Hi_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_Hi, " How can I help you? " ,DIA_Addon_Fortuno_Hi_HILFE);
	if(Npc_HasItems(other,ItMi_Joint) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi, " Here, take this swamp grass. " ,DIA_Addon_Fortuno_Hi_JOINT);
	};
	if(Npc_HasItems(other,ItMi_Addon_Joint_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi, " Here, take this 'Green Acolyte'. " ,DIA_Addon_Fortuno_Hi_GREEN);
	};
};

func void DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortune_Hi);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_Hi_HILFE_15_00 " );	// Can I help you?
	AI_Output(self,other, " DIA_Addon_Fortuno_Hi_HILFE_13_01 " );	// Green... green acolyte will help the acolyte...
};

func void DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_Hi_JOINT_15_00 " );	// Here, take this swamp grass.
	if(B_GiveInvItems(other,self,ItMi_Joint,1))
	{
		AI_UseItem(self,ItMi_Joint);
	};
	AI_Output(self,other, " DIA_Addon_Fortuno_Hi_JOINT_13_01 " );	// Not green, not strong, not green, not strong...
};

func void DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_Hi_GREEN_15_00 " );	// Here, take this 'Green Acolyte'.
	if(B_GiveInvItems(other,self,ItMi_Addon_Joint_01,1))
	{
		AI_UseItem(self,ItMi_Addon_Joint_01);
	};
	AI_Output(self,other, " DIA_Addon_Fortuno_Hi_GREEN_13_01 " );	// (recovering) A-A-A-X...
	AI_Output(self,other, " DIA_Addon_Fortuno_Hi_GREEN_13_02 " );	// My head... who... I... Fortuno... What happened?
	Info_ClearChoices(DIA_Addon_Fortune_Hi);
	Fortuno_Healed_01 = TRUE ;
	B_GivePlayerXP(XP_Addon_Fortuno_01);
	B_LogEntry(Topic_Addon_Fortuno, " 'Green Acolyte' helped Fortuno recover. " );
};


instance DIA_Addon_Fortuno_wer(C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 2;
	condition = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent = FALSE;
	description = " Yes, tell me what happened to you. " ;
};


func int DIA_Addon_Fortuno_wer_Condition()
{
	if (Fortuno_Healed_01 ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_wer_Info()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_wer_15_00 " );	// Yes, tell me what happened to you.
	AI_Output(self,other, " DIA_Addon_Fortuno_wer_13_01 " );	// I once belonged to the Brotherhood of the Sleeper. Everything was fine then!
	AI_Output(self,other, " DIA_Addon_Fortuno_wer_13_02 " );	// Yes, we are all convicted criminals, but for us, novices, life was carefree...
	AI_Output(other,self, " DIA_Addon_Fortuno_wer_15_03 " );	// Hey, I was also a prisoner in the Valley of Mines. Tell me something new.
	AI_Output(self,other, " DIA_Addon_Fortuno_wer_13_04 " );	// I... I don't remember anything. Darkness covers my memory...
	AI_Output(other,self, " DIA_Addon_Fortuno_wer_15_05 " );	// Come on, focus. What happened? When did you come to your senses?
	AI_Output(self,other, " DIA_Addon_Fortuno_wer_13_06 " );	// Raven... I only remember Raven and... and dark halls.
	AI_Output(other,self, " DIA_Addon_Fortuno_wer_15_07 " );	// What did Raven do? What did he do to you?
	AI_Output(self,other, " DIA_Addon_Fortuno_wer_13_08 " );	// (sighs) I'm sorry. It feels like my mind is itself imprisoned. I don't understand it myself...
};


instance DIA_Addon_Fortuno_FREE(C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 5;
	condition = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent = FALSE;
	description = " There must be a way to get your memory back. " ;
};


func int DIA_Addon_Fortuno_FREE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Fortune_Addon ) )
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_FREE_15_00 " );	// There must be a way to get your memory back.
	AI_Output(self,other, " DIA_Addon_Fortuno_FREE_13_01 " );	// Yes... yes, it's probably possible.
	AI_Output(self,other, " DIA_Addon_Fortuno_FREE_13_02 " );	// Gurus know various ways to change the spirit and will.

	if(hero.guild != GIL_GUR)
	{
		AI_Output(other,self, " DIA_Addon_Fortuno_FREE_15_03 " );	// Do YOU ​​remember anything about this?
		AI_Output(self,other, " DIA_Addon_Fortuno_FREE_13_04 " );	// No, I'm afraid this knowledge disappeared with the guru...
	};

	AI_Output(other,self, " DIA_Addon_Fortuno_FREE_15_05 " );	// Damn! Okay, if there's a way to free your mind, I'll find it.
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	B_LogEntry(Topic_Addon_Fortuno, " Fortuno's mind is clear, but he still doesn't remember anything. " );
};


instance DIA_Addon_Fortuno_Herb(C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 99;
	condition = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent = FALSE;
	description = " Do you need more marsh grass? " ;
};


func int DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Healed_01 ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_Herb_15_00 " );	// Do you need more swamp grass?
	AI_Output(self,other, " DIA_Addon_Fortuno_Herb_13_01 " );	// Yeah, sure. I will buy all the grass you bring me.
	AI_Output(self,other, " DIA_Addon_Fortuno_Herb_13_02 " );	// I'll even pay more for it than Fisk.
};

func void B_Fortuno_InfoManager()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
	Info_AddChoice(DIA_Addon_Fortuno_Trade,Dialog_Back,DIA_Addon_Fortuno_Trade_BACK);
	if(Npc_HasItems(other,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Trade, " (Give All Swamp Grass) " ,DIA_Addon_Fortuno_Trade_all);
		if(Npc_HasItems(other,ItPl_SwampHerb) >= 10)
		{
			Info_AddChoice(DIA_Addon_Fortuno_Trade, " (отдать 10) " , dia_addon_fortuno_trade_10);
		};
		Info_AddChoice(DIA_Addon_Fortuno_Trade, " (отдать 1) " ,DIA_Addon_Fortuno_Trade_1);
	};
};


instance DIA_Addon_Fortuno_Trade(C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 100;
	condition = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent = TRUE;
	description = " I've got marsh grass for you... " ;
};


func int DIA_Addon_Fortuno_Trade_Condition()
{
	if (( Npc_HasItems ( other , ItPl_SwampHerb ) >=  1 ) && Npc_KnowsInfo ( other , DIA_Addon_Fortuno_Herb )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_Trade_15_00 " );	// I have marsh grass for you...
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
};

func void DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,ItPl_SwampHerb);
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,amount))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,amount * Value_SwampHerb);
	B_GivePlayerXP(amount * 10);
	B_Fortuno_InfoManager();
};

func void dia_addon_fortuno_trade_10()
{
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,10))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,Value_SwampHerb * 10);
	B_GivePlayerXP(100);
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_1()
{
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,1))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,Npc_HasItems(self,ItPl_SwampHerb));
	};
	B_GiveInvItems(self,other,ItMi_Gold,Value_SwampHerb);
	B_GivePlayerXP(10);
	B_Fortuno_InfoManager();
};


instance DIA_Addon_Fortuno_Trank(C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 3;
	condition = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent = FALSE;
	description = " I have a potion to help you remember. " ;
};


func int DIA_Addon_Fortuno_Trank_Condition()
{
	if ((Fortune_Geheilt_01 ==  TRUE ) && Npc_KnowsInfo(other, DIA_Fortune_Addon_FREE) && (( Npc_HasItems (other, ItPo_Addon_Geist_01 ) > =  1 ) || 
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_Trank_15_00 " );	// I have a potion to help you remember.
	AI_Output(self,other, " DIA_Addon_Fortuno_Trank_13_01 " );	// I believe you.
	if(Npc_HasItems(other,ItPo_Addon_Geist_02) >= 1)
	{
		if(B_GiveInvItems(other,self,ItPo_Addon_Geist_02,1))
		{
			AI_UseItem ( self , ItPo_Addon_Geist_02 ) ;
		};
		B_GivePlayerXP(XP_Addon_Fortuno_02);
	}
	else if(B_GiveInvItems(other,self,ItPo_Addon_Geist_01,1))
	{
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_OBSOLETE);
		AI_StopProcessInfos(self);
		AI_UseItem ( self , ItPo_Addon_Geist_01 );
	};
};


instance DIA_Addon_Fortuno_more (C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 2;
	condition = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent = FALSE;
	description = "И?..";
};


func int DIA_Addon_Fortuno_more_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Fortune_Trank ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_more_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//И?..
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_01 " );	// Ah! I... I remember again! Now I understand... Oh, Adanos, what have I done?
	AI_Output(other,self, " DIA_Addon_Fortuno_more_15_02 " );	// Yes, what have you done? And most importantly - what did Raven do?
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_03 " );	// I helped him... make a contract. WITH HIM. He needed various potions... I brewed them for him.
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_04 " );	// He tried to open the portal and get into the temple.
	AI_Output(other,self, " DIA_Addon_Fortuno_more_15_05 " );	// Why? What does he want in the temple?
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_06 " );	// A powerful artifact... It is buried along with the one who created it. A great warrior who fell before HIS might...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//А потом?
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_08 " );	// We couldn't open the portal...
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_09 " );	// But Raven was SURE he could do it if he dug up the priest's tomb.
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_10 " );	// That's why he brought the slaves here. Those he can force to unearth the ancient powers that lie here.
	AI_Output(other,self, " DIA_Addon_Fortuno_more_15_11 " );	// Priest's tomb?
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_12 " );	// The resting place of the priest Adanos. She is in the mine.
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_13 " );	// I also remember the stone tablets. He believed that they would show him the way.
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_14 " );	// And when he managed to decipher what is written on them, he no longer needed me.
	AI_Output(self,other, " DIA_Addon_Fortuno_more_13_15 " );	// He cast an oblivion spell on me! And you freed me.
	SC_KnowsFortunoInfos = TRUE;
	B_LogEntry(TOPIC_Addon_RavenKDW, " Raven needs a powerful artifact from the temple of Adanos. " );
	Log_AddEntry(TOPIC_Addon_RavenKDW, " For some reason, Raven needed the tomb of an ancient religion priest, which he unearthed in a mine. " );
	Log_AddEntry(TOPIC_Addon_RavenKDW, " Raven thinks he needs stone tablets to carry out his plans. " );
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Addon_Fortuno_03);
};


instance DIA_Addon_Fortuno_Attentat (C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 9;
	condition = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fortuno_Attentat_Condition()
{
	if ((MRS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Fortune_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other, " DIA_Addon_Fortuno_Attentat_13_00 " );	// Attack? I'm sorry, I've... been away... for a while. I don't know anything about it.
};


instance DIA_ADDON_FORTUNO_CANBACK(C_Info)
{
	npc = BDT_1075_Addon_Fortune;
	nr = 9;
	condition = dia_addon_fortuno_canback_condition;
	information = dia_addon_fortuno_canback_info;
	permanent = FALSE;
	description = " You can always return to the Brotherhood. " ;
};


func int dia_addon_fortuno_canback_condition()
{
	if((SC_KnowsFortunoInfos == TRUE) && ((other.guild == GIL_GUR) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_canback_info()
{
	AI_Output(other,self, " DIA_Addon_Fortuno_CanBack_01_00 " );	// You can always return to the Brotherhood.
	AI_Output(self,other, " DIA_Addon_Fortuno_CanBack_01_01 " );	// (confused) The Brotherhood?
	AI_Output(other,self, " DIA_Addon_Fortuno_CanBack_01_02 " );	// Yes. In Khorinis, not far from the passage to the Valley of Mines, there is a new Brotherhood camp.
	AI_Output(other,self, " DIA_Addon_Fortuno_CanBack_01_03 " );	// They are led by Idol Oran. There are many of those who used to live in the swamps. I think that's where you belong.
	AI_Output(self,other, " DIA_Addon_Fortuno_CanBack_01_04 " );	// Does the Brotherhood of the Sleeper still exist?
	AI_Output(other,self, " DIA_Addon_Fortuno_CanBack_01_05 " );	// The Brotherhood no longer worship the Sleeper. They have a new path.
	AI_Output(self,other, " DIA_Addon_Fortuno_CanBack_01_07 " );	// I don't even know. Of course, I would really like to go back there, but... How do I get there?
	AI_Output(other,self, " DIA_Addon_Fortuno_CanBack_01_13 " );	// Not far from here, in the center of the island, there is a portal that leads back to Khorinis. You can use it to get out of here.
	AI_Output(self,other, " DIA_Addon_Fortuno_CanBack_01_14 " );	// Then... Then maybe I'll do it. I'm coming home!
	AI_Output(self,other, " DIA_Addon_Fortuno_CanBack_01_16 " );	// Thank you for everything.
	FORTUNOBACK = TRUE;
	AI_StopProcessInfos(self);
};
