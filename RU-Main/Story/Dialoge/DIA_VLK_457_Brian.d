

var int brsharpsword;

instance DIA_Brian_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_PICKPOCKET(C_Info)
{
	npc = VLK_457_Brian;
	nr = 900;
	condition = DIA_Brian_PICKPOCKET_Condition;
	information = DIA_Brian_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Brian_PICKPOCKET_Condition()
{
	return  C_Robbery ( 55 , 100 );
};

func void DIA_Brian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
	Info_AddChoice(DIA_Brian_PICKPOCKET,Dialog_Back,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

var int FirstTalkBrian;

instance DIA_Brian_NoTalkAtAll(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_NoTalkAtAll_Condition;
	information = DIA_Brian_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Brian_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brian_NoTalkAtAll_Info()
{
	if(FirstTalkBrian == FALSE)
	{
		AI_Output(self,other, " DIA_Brian_NoTalkAtAll_12_00 " );	// You have nothing to do here. Out!
		FirstTalkBrian = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Brian_NoTalkAtAll_12_01 " );	// Deaf or what? Go away.
		AI_StopProcessInfos(self);
	};
};

instances DIA_Brian_HALLO (C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_HALLO_Condition;
	information = DIA_Brian_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Brian_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info()
{
	AI_Output(self,other, " DIA_Brian_HALLO_04_00 " );	// You're new to town, right? I'm Brian! Master Harad's apprentice.
};


instance DIA_Brian_AboutLehrling(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_AboutLehrling_Condition;
	information = DIA_Brian_AboutLehrling_Info;
	permanent = FALSE;
	description = " What's it like being a blacksmith's apprentice? " ;
};

func int DIA_Brian_AboutLehrling_Condition()
{
	return TRUE;
};

func void DIA_Brian_AboutLehrling_Info()
{
	AI_Output(other,self, " DIA_Brian_AboutLehrling_15_00 " );	// How does it feel to be a blacksmith's apprentice?
	AI_Output(self,other, " DIA_Brian_AboutLehrling_04_01 " );	// Why are you asking? Do you want to be my successor?
	AI_Output(other,self, " DIA_Brian_AboutLehrling_15_02 " );	// Maybe.
	AI_Output(self,other, " DIA_Brian_AboutLehrling_04_03 " );	// Why not... I'm almost done with my training and I'm going to leave town soon.
	AI_Output(self,other, " DIA_Brian_AboutLehrling_04_04 " );	// But not because of Harad. He is a good master, I learned a lot from him.
};


instance DIA_Brian_WhyLeave(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_WhyLeave_Condition;
	information = DIA_Brian_WhyLeave_Info;
	permanent = FALSE;
	description = " Why do you want to leave the city? " ;
};


func int DIA_Brian_WhyLeave_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info()
{
	AI_Output(other,self, " DIA_Brian_WhyLeave_15_00 " );	// Why do you want to leave the city?
	AI_Output(self,other, " DIA_Brian_WhyLeave_04_00 " );	// Because people here get on my nerves! And especially other masters.
	AI_Output(self,other, " DIA_Brian_WhyLeave_04_01 " );	// I haven't forgotten what it cost to become Harad's apprentice.
	AI_Output(self,other, " DIA_Brian_WhyLeave_04_02 " );	// Each of these pranksters was ready to insert his hairpin.
	AI_Output(self,other, " DIA_Brian_WhyLeave_04_03 " );	// I want to decide for myself who I can and who I can't take as an apprentice.
};


instance DIA_Brian_OtherMasters(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_OtherMasters_Condition;
	information = DIA_Brian_OtherMasters_Info;
	permanent = FALSE;
	description = " Who are the other masters here? " ;
};


func int DIA_Brian_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_WhyLeave) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info()
{
	AI_Output(other,self, " DIA_Brian_Add_15_00 " );	// And who are the other masters here?
	AI_Output(self,other, " DIA_Brian_Add_04_01 " );	// Well, this is the carpenter Torben, the master archer Bosper, the alchemist Constantino and Matteo.
	AI_Output(self,other, " DIA_Brian_Add_04_02 " );	// He sells armor, but he's a merchant first and foremost.
	AI_Output(self,other, " DIA_Brian_Add_04_03 " );	// Each master has his own house on this street.
	AI_Output(self,other, " DIA_Brian_Add_04_04 " );	// And Constantino's shop is located in the underground passage leading to the temple.
};


instance DIA_Brian_AboutHarad (C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_AboutHarad_Condition;
	information = DIA_Brian_AboutHarad_Info;
	permanent = FALSE;
	description = " Tell me about Master Harad. " ;
};


func int DIA_Brian_AboutHarad_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info()
{
	AI_Output(other,self, " DIA_Brian_AboutHarad_15_00 " );	// Tell me about Master Harada.
	AI_Output(self,other, " DIA_Brian_AboutHarad_04_01 " );	// He's not in the best mood right now.
	AI_Output(self,other, " DIA_Brian_AboutHarad_04_02 " );	// The paladins came a few days ago and ordered him to forge swords for them.
	AI_Output(self,other, " DIA_Brian_AboutHarad_04_03 " );	// They even banned him from selling swords to anyone else.
	AI_Output(self,other, " DIA_Brian_AboutHarad_04_04 " );	// Now he's like a slave, working day and night to finish his job as quickly as possible.
	AI_Output(other,self, " DIA_Brian_NEEDWEAPONS_15_00 " );	// Can I buy weapons from you?
	AI_Output(self,other, " DIA_Brian_NEEDWEAPONS_04_01 " );	// No. I'm just an assistant.
	AI_Output(self,other, " DIA_Brian_NEEDWEAPONS_04_02 " );	// Weapons made at this forge are taken by the militia. They take it to the towers where it is kept.
	AI_Output(self,other, " DIA_Brian_NEEDWEAPONS_04_03 " );	// But for everything else about blacksmithing, I can help.
};


instance DIA_Brian_NEEDWEAPONS(C_Info)
{
	npc = VLK_457_Brian;
	nr = 5;
	condition = DIA_Brian_NEEDWEAPONS_Condition;
	information = DIA_Brian_NEEDWEAPONS_Info;
	permanent = TRUE;
	description = " Teach me how to sharpen a weapon. (Training Points: 1, Cost: 250 coins) " ;
};

func int DIA_Brian_NEEDWEAPONS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutHarad) && (KNOWHOWSHARPWEAPON == FALSE) && Wld_IsTime(7,5,20,35) && ((MIS_Jack_NewLighthouseOfficer != LOG_SUCCESS) || (MIS_Jack_NewLighthouseOfficer != LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEEDWEAPONS_Info()
{
	AI_Output(other,self, " DIA_Brian_WASKAUFEN_03_89 " );	// Teach me how to sharpen weapons.

	if((other.lp >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 250))
	{
		KNOWHOWSHARPWEAPON = TRUE;
		other.lp = other.lp - 1;
		RankPoints = RankPoints + 1;
		Npc_RemoveInvItems(other,ItMi_Gold,250);
		AI_Output(self,other, " DIA_Brian_NEEDWEAPONS_04_10 " );	// Okay, watch carefully how this is done. All you need is a rusty weapon and a blank sword.

		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSSHARP"))
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_CITY_SMITH_SHARP");
			AI_AlignToWP(self);
			AI_UseMob(self,"BSSHARP",5);
			AI_Output(self,other, " DIA_Brian_WASKAUFEN_04_12 " );	// You take a rusty sword, press it on top with a blade blank...
			AI_Output(self,other, " DIA_Brian_WASKAUFEN_04_13 " );	// ...and smoothly move the grindstone left and right...
			AI_Output(self,other, " DIA_Brian_WASKAUFEN_04_14 " );	// ...the blank of the blade is needed for a more uniform pressing of the sword to the stone...
			AI_Output(self,other, " DIA_Brian_WASKAUFEN_04_15 " );	// ...and to keep the sword from overheating and bending while sharpening.
			AI_UseMob(self,"BSSHARP",-1);
			B_TurnToNpc(self,other);
		};

		AI_Print(PRINT_LearnSharp);
		Snd_Play("LevelUP");
	}
	else if(other.lp < 1)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 250)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Brian_WASKAUFEN_03_90 " );	// You don't have enough gold for this! Come back later.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Brian_GiveSharpStone(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_GiveSharpStone_Condition;
	information = DIA_Brian_GiveSharpStone_Info;
	permanent = FALSE;
	description = " Can you only sharpen weapons at the forge? " ;
};

func int DIA_Brian_GiveSharpStone_Condition()
{
	if(KNOWHOWSHARPWEAPON == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Brian_GiveSharpStone_Info()
{
	AI_Output(other,self, " DIA_Brian_GiveSharpStone_01_00 " );	// Can you only sharpen weapons at the forge?
	AI_Output(self,other, " DIA_Brian_GiveSharpStone_01_01 " );	// Naturally. Unless, of course, you have a whetstone with you.
	AI_Output(other,self, " DIA_Brian_GiveSharpStone_01_02 " );	// Do you have it?
	AI_Output(self,other, " DIA_Brian_GiveSharpStone_01_03 " );	// Was until some nasty thief stole it from me.
	AI_Output(self,other, " DIA_Brian_GiveSharpStone_01_04 " );	// As soon as I turned away - and here... And why did someone need a simple piece of stone?
	MIS_BrianSharpStone = LOG_Running;
	Log_CreateTopic(TOPIC_BrianSharpStone,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrianSharpStone,LOG_Running);
	B_LogEntry(TOPIC_BrianSharpStone, " Someone stole Brian's whetstone. Looks like the guy would like to return it. " );
};

instance DIA_Brian_GiveSharpStoneDone(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_GiveSharpStoneDone_Condition;
	information = DIA_Brian_GiveSharpStoneDone_Info;
	permanent = FALSE;
	description = " I found your donkey. " ;
};

func int DIA_Brian_GiveSharpStoneDone_Condition()
{
	if((MIS_BrianSharpStone == LOG_Running) && (Npc_HasItems(hero,ItMi_ZharpStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brian_GiveSharpStoneDone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Brian_GiveSharpStoneDone_01_00 " );	// I found your donkey.
	AI_Output(self,other, " DIA_Brian_GiveSharpStoneDone_01_01 " );	// True? (surprised) I did not hope that he would still be found.
	AI_Output(self,other, " DIA_Brian_GiveSharpStoneDone_01_02 " );	// You know what? You can leave it to yourself. I don't need it anymore, but you might need it.
	AI_Output(other,self, " DIA_Brian_GiveSharpStoneDone_01_03 " );	// As you say.
	MIS_BrianSharpStone = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrianSharpStone,LOG_Success);
	B_LogEntry(TOPIC_BrianSharpStone, " I told Brian that I found his whetstone. He would love to hear it and give it to me. " );
};

var int Brian_Trade_once;

instance DIA_Brian_WASKAUFEN (C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_WASKAUFEN_Condition;
	information = DIA_Brian_WASKAUFEN_Info;
	permanent = TRUE;
	description = " What can I buy from you? " ;
	trade = TRUE;
};

func int DIA_Brian_WASKAUFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutHarad) && Wld_IsTime(7,5,20,35) && ((MIS_Jack_NewLighthouseOfficer != LOG_SUCCESS) || (MIS_Jack_NewLighthouseOfficer != LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info()
{
	where int daynow;
	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Brian_WASKAUFEN_15_00 " );	// What can I buy from you?

	if (Npc_IsDead(Harad))
	{
		AI_Output(self,other, " DIA_Brian_WASKAUFEN_04_01 " );	// If I still have a couple of spare steel bars, you can take them. I'm afraid that's all.

		if(MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output(self,other, " DIA_Brian_WASKAUFEN_04_02 " );	// Since Harad is no longer here, the militia has been keeping an eye on me.
			AI_Output(self,other, " DIA_Brian_WASKAUFEN_04_03 " );	// I'm not allowed to continue working at the forge. They are afraid that I will sell everything and dump.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Brian_WASKAUFEN_04_01 " );	// If I still have a couple of spare steel bars, you can take them. I'm afraid that's all.
	};

	if (Brian_Trade_once ==  FALSE )
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, " Brian, Harad's apprentice, sells steel billets. " );
		Brian_Trade_einmal = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};


instance DIA_Brian_KAP3_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP3_EXIT_Condition;
	information = DIA_Brian_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_RepairNecklace(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_RepairNecklace_Condition;
	information = DIA_Brian_RepairNecklace_Info;
	permanent = FALSE;
	description = " Can you repair jewelry? " ;
};


func int DIA_Brian_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brian_RepairNecklace_Info()
{
	AI_Output(other,self, " DIA_Brian_RepairNecklace_15_00 " );	// Can you repair jewelry?
	AI_Output(self,other, " DIA_Brian_RepairNecklace_04_01 " );	// I'm just a helper, I'm glad when they let me make at least a dagger.
	if (Npc_IsDead(Harad) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Brian_RepairNecklace_04_02 " );	// Jewelry? You'd better go to the master.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Brian_KAP4_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP4_EXIT_Condition;
	information = DIA_Brian_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_KAP5_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP5_EXIT_Condition;
	information = DIA_Brian_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_NEWLIGHTHOUSEOFFICER(C_Info)
{
	npc = VLK_457_Brian;
	nr = 51;
	condition = DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information = DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;
	description = " I heard you were interested in Old Jack's lighthouse. " ;
};


func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition()
{
	if((Kapitel == 5) && (MIS_Jack_NewLighthouseOfficer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info()
{
	AI_Output(other,self, " DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00 " );	// I heard you were interested in old Jack's lighthouse.
	AI_Output(other,self, " DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01 " );	// Jack is going to sea. But he has no one to leave the beacon on.
	AI_Output(self,other, " DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02 " );	// But Jack must understand that in his absence, I will turn the lighthouse into a forge.
	AI_Output(other,self, " DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03 " );	// Is this a problem?!
	AI_Output(self,other, " DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04 " );	// Not for me! I still can't get Harad's forge. I've already put that thought out of my head.
	AI_Output(self,other, " DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05 " );	// Agree! We'll meet at Jack's.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
	EquipItem(self,ItMw_1h_Vlk_Axe);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_Brian_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_LIGHTHOUSEFREE_Condition;
	information = DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent = TRUE;
	description = " And what do you say? " ;
};


func int DIA_Brian_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self, " DIA_Brian_LIGHTHOUSEFREE_15_00 " );	// And what do you say?
	AI_Output(self,other, " DIA_Brian_LIGHTHOUSEFREE_04_01 " );	// God, what a mess. Jack won't recognize this place when I get everything right here.
};

instance DIA_Brian_SharpKnife(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_SharpKnife_Condition;
	information = DIA_Brian_SharpKnife_Info;
	permanent = TRUE;
	description = " I need you to sharpen this knife. " ;
};

func int DIA_Brian_SharpKnife_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Brian_AboutLehrling ) && ( Npc_ GetDistToWP ( self , " NW_CITY_SMITH_SHARP " ) < =  500 ) && ( MIS_Hilda_SharpKnife == LOG_Running ) && ( MIS_Hilda_SharpKnife ==  FALSE ) && ( Npc_Has_1Items (other, Kni 
	{
		return TRUE;
	};
};

func void DIA_Brian_SharpKnife_Info()
{
	AI_Output(other,self, " DIA_Brian_SharpKnife_15_00 " );	// I need you to sharpen this knife.
	AI_Output(self,other, " DIA_Brian_SharpKnife_04_01 " );	// Of course. But it will cost you ten gold.
	Info_ClearChoices(DIA_Brian_SharpKnife);

	if(Npc_HasItems(other,ItMi_Gold) >= 10)
	{
		Info_AddChoice(DIA_Brian_SharpKnife, " Вот золото. " ,DIA_Brian_SharpKnife_Ok);
	};

	Info_AddChoice(DIA_Brian_SharpKnife, " I don't have that kind of money. " ,DIA_Brian_SharpKnife_No);

};

func void DIA_Brian_SharpKnife_Ok()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Brian_SharpKnife_Ok_15_00 " );	// Here's the gold.
	B_GiveInvItems(other,self,ItMi_Gold,10);
	Npc_RemoveInvItems(self,ItMi_Gold,10);
	AI_Output(self,other, " DIA_Brian_SharpKnife_Ok_04_01 " );	// Good! Wait a minute...
	AI_Output(self,other, " DIA_Brian_SharpKnife_Ok_04_02 " );	// ...well, that's it. Now this knife is sharper than a razor!
	HildaSharpKnife = TRUE;
	B_LogEntry(TOPIC_Hilda_SharpKnife, " Blacksmith's apprentice Brian sharpened Hilda's knife for me. " );
	Info_ClearChoices(DIA_Brian_SharpKnife);
};

func void DIA_Brian_SharpKnife_No()
{
	AI_Output(other,self, " DIA_Brian_SharpKnife_No_15_00 " );	// I don't have that kind of money.
	AI_Output(self,other, " DIA_Brian_SharpKnife_No_04_01 " );	// Sorry, can't help then.
	Info_ClearChoices(DIA_Brian_SharpKnife);
};
