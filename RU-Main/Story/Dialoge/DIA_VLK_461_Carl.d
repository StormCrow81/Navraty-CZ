

instance DIA_Carl_EXIT(C_Info)
{
	npc = VLK_461_Carl;
	nr = 999;
	condition = DIA_Carl_EXIT_Condition;
	information = DIA_Carl_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Carl_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Carl_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

func void B_CarlSayHallo()
{
	AI_Output(self,other, " DIA_Carl_Hallo_05_00 " );	// Looks like there are a few thieves in the city who steal from wealthy citizens.
	AI_Output(self,other, " DIA_Carl_Hallo_05_01 " );	// The City Watch recently turned the waterfront upside down, but they didn't find anything.
};


instance DIA_Carl_PICKPOCKET(C_Info)
{
	npc = VLK_461_Carl;
	nr = 900;
	condition = DIA_Carl_PICKPOCKET_Condition;
	information = DIA_Carl_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Carl_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 40 );
};

func void DIA_Carl_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
	Info_AddChoice(DIA_Carl_PICKPOCKET,Dialog_Back,DIA_Carl_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Carl_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Carl_PICKPOCKET_DoIt);
};

func void DIA_Carl_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};

func void DIA_Carl_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};


instance DIA_Carl_Hallo(C_Info)
{
	npc = VLK_461_Carl;
	nr = 2;
	condition = DIA_Carl_Hallo_Condition;
	information = DIA_Carl_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Carl_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Carl_Hallo_Info()
{
	AI_Output(self,other, " DIA_Carl_Hallo_05_02 " );	// What brings you to this poor area? What are you looking for here?
	Info_ClearChoices(DIA_Carl_Hallo);
	Info_AddChoice(DIA_Carl_Hallo, " I'm lost. " ,DIA_Carl_Hallo_verlaufen);
	Info_AddChoice(DIA_Carl_Hallo, " I'm just wandering around looking around. " ,DIA_Carl_Hallo_umsehen);
};

func void DIA_Carl_Hello_lost()
{
	AI_Output(other,self, " DIA_Carl_Hallo_verlaufen_15_00 " );	// I'm lost.
	AI_Output(self,other, " DIA_Carl_Hallo_verlaufen_05_01 " );	// Then make sure you don't get robbed.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

func void DIA_Carl_Hello_look around()
{
	AI_Output(other,self, " DIA_Carl_Hallo_umsehen_15_00 " );	// I'm just wandering around, looking around.
	AI_Output(self,other, " DIA_Carl_Hallo_umsehen_05_01 " );	// Yeah. Look, gape and lose your wallet.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

instance DIA_Carl_HelpPath(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_HelpPath_Condition;
	information = DIA_Carl_HelpPath_Info;
	permanent = FALSE;
	description = " Can I help you? " ;
};

func int DIA_Carl_HelpPath_Condition()
{
	if (( CanTeachTownMaster ==  FALSE ) && ( MY_PathFromDown == LOG_Running ) && ( PaulQuestsUp ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Carl_HelpPath_Info()
{
	AI_Output(other,self, " DIA_Carl_HelpPath_01_00 " );	// Can I be of service to you?
	AI_Output(self,other, " DIA_Carl_HelpPath_01_01 " );	// (surprised) What makes you think I need your help at all?
	AI_Output(other,self, " DIA_Carl_HelpPath_01_02 " );	// I want to become an apprentice and I need to make a good impression on the locals.
	AI_Output(self,other, " DIA_Carl_HelpPath_01_03 " );	// (grinning) Now I understand everything. Unfortunately, I already have a helper!
	AI_Output(self,other, " DIA_Carl_HelpPath_01_04 " );	// But you can impress me if you help me get some materials to work with in my forge.
	AI_Output(other,self,"DIA_Carl_HelpPath_01_05");	//Что именно? 
	AI_Output(self,other, " DIA_Carl_HelpPath_01_06 " );	// I need coal. At least five pieces!
	AI_Output(self,other, " DIA_Carl_HelpPath_01_07 " );	// Take it out - and consider that my approval is already in your pocket.
	AI_Output(other,self, " DIA_Carl_HelpPath_01_08 " );	// Where can I find it?
	AI_Output(self,other, " DIA_Carl_HelpPath_01_09 " );	// Coal can be found in burnt buildings, bought from merchants, or found in mines.
	AI_Output(other, self, " DIA_Carl_HelpPath_01_10 " );	// Good. I'll try to get everything you asked for.
	MIS_CarlCoal = LOG_Running;
	Log_CreateTopic(TOPIC_CarlCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CarlCoal,LOG_Running);
	B_LogEntry(TOPIC_CarlCoal, " Blacksmith Carl asked me to get five lumps of coal for him. Then he will put in a good word for me. " );
};

instance DIA_Carl_HelpPath_Done(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_HelpPath_Done_Condition;
	information = DIA_Carl_HelpPath_Done_Info;
	permanent = FALSE;
	description = " I brought coal. " ;
};

func int DIA_Carl_HelpPath_Done_Condition()
{
	if((MIS_CarlCoal == LOG_Running) && (Npc_HasItems(other,ItMi_Coal) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Carl_HelpPath_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Carl_HelpPath_Done_01_00 " );	// I brought coal.
	AI_Output(self,other, " DIA_Carl_HelpPath_Done_01_01 " );	// Great. (pretty) Give it here. My supplies are almost low.
	AI_Output(other,self, " DIA_Carl_HelpPath_Done_01_02 " );	// Of course, here it is. What about your approval?
	B_GiveInvItems(other,self,ItMi_Coal,5);
	Npc_RemoveInvItems(self,ItMi_Coal,5);
	AI_Output(self,other, " DIA_Carl_HelpPath_Done_01_03 " );	// Don't worry... (smiling) As we agreed!
	AI_Output(self,other, " DIA_Carl_HelpPath_Done_01_04 " );	// If suddenly someone asks me about you, they will only know the best.
	MIS_CarlCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_CarlCoal,LOG_Success);
	B_LogEntry(TOPIC_CarlCoal, " I've brought coal to Blacksmith Carl. Now he'll put in a good word for me in the Craftsmen's quarter. " );
};

instance DIA_Carl_Diebe (C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Diebe_Condition;
	information = DIA_Carl_Diebe_Info;
	permanent = FALSE;
	description = " What do you know about thieves? " ;
};

func int DIA_Carl_Diebe_Condition()
{
	return TRUE;
};

func void DIA_Carl_Diebe_Info()
{
	AI_Output(other,self, " DIA_Carl_Diebe_15_00 " );	// What do you know about thieves?
	AI_Output(self,other, " DIA_Carl_Diebe_05_01 " );	// Nothing. But all the townspeople are frightened and become distrustful - especially towards strangers.
	AI_Output(self,other, " DIA_Carl_Diebe_05_02 " );	// Be careful not to be caught in someone else's house. We don't like this.
	AI_Output(self,other, " DIA_Carl_Diebe_05_03 " );	// Yes, you have to protect yourself from thieves. A good club is the best.
};


instance DIA_Carl_Lernen (C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Lernen_Condition;
	information = DIA_Carl_Lernen_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int DIA_Carl_Lernen_Condition()
{
	return TRUE;
};

func void DIA_Carl_Lernen_Info()
{
	AI_Output(other,self, " DIA_Carl_Lernen_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Carl_Lernen_05_01 " );	// Ah, here I forge horseshoes, nails, and repair metal objects.
	AI_Output(self,other, " DIA_Carl_Lernen_05_02 " );	// But you don't get much experience in blacksmithing in the port, so that there is something to teach.
	AI_Output(self,other, " DIA_Carl_Lernen_05_02A " );	// Although, of course, to forge a simple ordinary sword - I could do it myself and I would teach you how to do it.
	AI_Output(self,other, " DIA_Carl_Lernen_05_03 " );	// And if you really want to learn how to forge real weapons, go to Harad. Yes... he forges luxurious blades!
	AI_Output(self,other, " DIA_Carl_Lernen_05_04 " );	// But if you just want to exercise your muscles a little, I can help you with that too.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	CARL_TEACHSMITH = TRUE;
	B_LogEntry(TOPIC_CityTeacher, " Karl, the blacksmith in the waterfront, can help me get stronger and teach me how to forge. " );
};


instance DIA_Carl_Wieviel (C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Wieviel_Condition;
	information = DIA_Carl_How much_Info;
	permanent = FALSE;
	description = " How much do you charge for tuition? " ;
};

func int DIA_Carl_Wieviel_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Carl_Lernen ))
	{
		return TRUE;
	};
};

func void DIA_Carl_How much_Info()
{
	AI_Output(other,self, " DIA_Carl_Wieviel_15_00 " );	// How much do you charge for tuition?

	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		B_GivePlayerXP(50);
		AI_Output(self,other, " DIA_Carl_Wieviel_05_01 " );	// I heard what you did for Edda. I will train you for free.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Carl_Wieviel_05_02 " );	// Fifty gold coins and I'll help you get stronger.
	};
};

instance DIA_Carl_pay (C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_bezahlen_Condition;
	information = DIA_Carl_bezahlen_Info;
	permanent = TRUE;
	description = " I want to work out with you. (Price: 50 coins) " ;
};

func int DIA_Carl_bezahlen_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Carl_Wieviel ) && ( Carl_TeachSTR ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Carl_bezahlen_Info()
{
	AI_Output(other,self, " DIA_Carl_bezahlen_15_00 " );	// I want to practice with you.

	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		AI_Output(self,other, " DIA_Carl_bezahlen_05_01 " );	// I heard what you did for Edda. I will train you for free.
		Carl_TeachSTR = TRUE;
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Carl_bezahlen_05_02 " );	// Okay, we can start as soon as you're ready.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Carl_bezahlen_05_03 " );	// Bring the money, then we'll start training.
	};
};

instance DIA_Carl_Teach(C_Info)
{
	npc = VLK_461_Carl;
	nr = 7;
	condition = DIA_Carl_Teach_Condition;
	information = DIA_Carl_Teach_Info;
	permanent = TRUE;
	description = " I want to get stronger. " ;
};

func int DIA_Carl_Teach_Condition()
{
	if(Carl_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Carl_Teach_Info()
{
	AI_Output(other,self, " DIA_Carl_Teach_15_00 " );	// I want to get stronger.
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_Back()
{
	Info_ClearChoices(DIA_Carl_Teach);
};

func void DIA_Carl_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void b_carl_teachsmith()
{
	AI_Output(self,other, " DIA_Carl_TeachCommon_12_01 " );	// It's easy, man. Get a piece of clean steel and keep it on fire until it starts to melt.
	AI_Output(self,other, " DIA_Carl_TeachCommon_12_02 " );	// Then forge a blade on the anvil.
};

func void b_carlsmithchoices()
{
	Info_ClearChoices(dia_carl_teachsmith);
	Info_AddChoice(dia_carl_teachsmith,Dialog_Back,dia_carl_teachsmith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(dia_carl_teachsmith,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),dia_carl_teachsmith_common);
	};
};


instance DIA_CARL_TEACHSMITH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 50;
	condition = dia_carl_teachsmith_condition;
	information = dia_carl_teachsmith_info;
	permanent = TRUE;
	description = " Teach me how to forge weapons. " ;
};


func int dia_carl_teachsmith_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (CARL_TEACHSMITH == TRUE))
	{
		return TRUE;
	};
};

func void dia_carl_teachsmith_info()
{
	AI_Output(other,self, " DIA_Carl_TeachCommon_15_00 " );	// Teach me how to forge.
	b_carlsmithchoices();
};

func void dia_carl_teachsmith_back()
{
	Info_ClearChoices(dia_carl_teachsmith);
};

func void dia_carl_teachsmith_common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		b_carl_teachsmith();
		AI_Output(self,other, " DIA_Carl_TeachCommon_12_03 " );	// Your first swords won't be art, but the rest can be learned later.
	};
	b_carlsmithchoices();
};


instance DIA_CARL_ARMORCANTEACH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 5;
	condition = dia_carl_armorcanteach_condition;
	information = dia_carl_armorcanteach_info;
	permanent = TRUE;
	description = " Are you also a member of the 'Ring of Water'? " ;
};


func int dia_carl_armorcanteach_condition()
{
	if((CARL_TEACHARMOR == FALSE) && (RANGERCARL == TRUE))
	{
		return TRUE;
	};
};

func void dia_carl_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Carl_ArmorCanTeach_01_00 " );	// Do you also belong to the Water Ring?
	AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_01 " );	// Which Water Ring? What are you talking about, boy?
	AI_Output(other,self, " DIA_Carl_ArmorCanTeach_01_02 " );	// Come on, don't pretend you don't understand what I'm talking about. Lares told me everything about you.
	AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_03 " );	// Ah, well, if he said so, then it is so... (laughs sarcastically)
	AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_04 " );	// And what else did he say about me?
	AI_Output(other,self, " DIA_Carl_ArmorCanTeach_01_05 " );	// Lares said you could get me better armor than this.
	AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_06 " );	// Ah! Now I am sure that in front of me is a brother in the Ring. So that's what Lares said...
	AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_07 " );	// I think he got a little carried away with his words. I have no other armor for you. But...
	AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_08 " );	// ...I could show you how to upgrade that armor you just showed me.
	AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_09 " );	// True, for this you must have at least a little knowledge of blacksmithing.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Carl_ArmorCanTeach_01_10 " );	// I know a little about blacksmithing...
		AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_11 " );	// This is good.
		AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_12 " );	// Then tell me when you're ready, and I'll teach you everything I know.
	}
	else
	{
		AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_13 " );	// And apparently, you don't even know what it is.
		AI_Output(self,other, " DIA_Carl_ArmorCanTeach_01_14 " );	// So learn to forge first. And when you learn, I will gladly teach you everything that I myself know.
	};

	CARL_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ARMORTEACHER , " Karl can teach me how to upgrade the Water Ring armor. " );
};

func void b_carl_teacharmor_1()
{
	AI_Output(self,other, " DIA_Carl_TeachArmor_1_01_01 " );	// Good. Watch carefully how it's done. All you need is a few iron ingots...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);

		if(CARLRECRUITEDDT == FALSE)
		{
			AI_GotoWP(self,"NW_CITY_POOR_SMITH_01");
		}
		else
		{
			AI_GotoWP(self,"NW_CASTLEMINE_TOWER_REP_HUT_SMITH");
		};

		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Carl_TeachArmor_1_01_02 " );	// ...the hardest part is making the elements of the chain mail mesh...
		AI_Output(self,other, " DIA_Carl_TeachArmor_1_01_03 " );	// ...divide the red-hot workpiece into ten equal parts, then beat off the soot, and with the slow movement of each part...
		AI_Output(self,other, " DIA_Carl_TeachArmor_1_01_04 " );	// ...you give the ring an even shape and forge its fastening...
		AI_Output(self,other, " DIA_Carl_TeachArmor_1_01_05 " );	// ...that's how I do it now... (demonstrates) ...you fasten the rings and attach the chain mail mesh to the armor.
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_06");	//...вот и все!
		AI_Output(self,other, " DIA_Carl_TeachArmor_1_01_07 " );	// Try it yourself now. I don't think you should have much of a problem with this.
	};
};

func void b_carlarmorchoices()
{
	Info_ClearChoices(dia_carl_armorteach);
	Info_AddChoice(dia_carl_armorteach,Dialog_Back,dia_carl_armorteach_back);

	if(PLAYER_TALENT_SMITH[32] == FALSE)
	{
		Info_AddChoice(dia_carl_armorteach, " Upgrade 'Water Ring Mail' (Cost: 500 coins) " ,dia_carl_armorteach_itar_ranger_addon_v1);
	};
};


instance DIA_CARL_ARMORTEACH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 5;
	condition = dia_carl_armorteach_condition;
	information = dia_carl_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};

func int dia_carl_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (CARL_TEACHARMOR == TRUE) && (RANGERCARL == TRUE))
	{
		if(PLAYER_TALENT_SMITH[32] == FALSE)
		{
			return TRUE;
		};
	};
};

func void dia_carl_armorteach_info()
{
	AI_Output(other,self, " DIA_Carl_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.

	if (Wld_IsTime( 6 , 10 , 20 , 0 ))
	{
		AI_Output(self,other, " DIA_Carl_ArmorTeach_01_01 " );	// Always ready to help you, brother in the Ring...
		b_carlarmorchoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Carl_ArmorTeach_01_02 " );	// And how do you think I can teach you this now? Or do you see an anvil with a furnace here? (laughs)
		AI_Output(self,other, " DIA_Carl_ArmorTeach_01_03 " );	// Come back tomorrow morning. Then we'll talk.
	};
};

func void dia_carl_armorteach_back()
{
	Info_ClearChoices(dia_carl_armorteach);
};

func void dia_carl_armorteach_itar_ranger_addon_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_RANGER_ADDON_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_carl_teacharmor_1();
		};

		b_carlarmorchoices();
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Carl_bezahlen_05_03 " );	// Bring the money, then we'll start training.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Carl_PrioratBlade(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_PrioratBlade_condition;
	information = DIA_Carl_PrioratBlade_info;
	permanent = FALSE;
	description = " I need your help. " ;
};


func int DIA_Carl_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Carl_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Carl_PrioratBlade_01_01 " );	// I need your help.
	AI_Output(self,other, " DIA_Carl_PrioratBlade_01_02 " );	// What's the matter?
	AI_Output(other,self, " DIA_Carl_PrioratBlade_01_03 " );	// I have a very unusual blade with me.
	AI_Output(other,self, " DIA_Carl_PrioratBlade_01_04 " );	// And I need to know where it came from and who made it.
	AI_Output(self,other, " DIA_Carl_PrioratBlade_01_05 " );	// (with interest) Okay. Show it to me.
	AI_Output(other,self, " DIA_Carl_PrioratBlade_01_06 " );	// Here, take this.
	CreateInvItems(other,ItMw_1H_AssBlade_View,1);
	B_GiveInvItems(other,self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other, " DIA_Carl_PrioratBlade_01_07 " );	// (puzzled) I've never held a weapon like this before.
	AI_Output(self,other, " DIA_Carl_PrioratBlade_01_08 " );	// Take it back. I'm afraid I can't help you.
	B_LogEntry(TOPIC_PrioratStart, " Blacksmith Carl couldn't say anything about the mysterious blade. " );
};

instance DIA_Carl_FatherNews(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_FatherNews_Condition;
	information = DIA_Carl_FatherNews_Info;
	permanent = FALSE;
	description = " I have a message for you from Morgan. " ;
};

func int DIA_Carl_FatherNews_Condition()
{
	if(MIS_FatherNews == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Carl_FatherNews_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Carl_FatherNews_01_00 " );	// I have word for you from Morgan.
	AI_Output(self,other, " DIA_Carl_FatherNews_01_01 " );	// (stupefied) From whom?
	AI_Output(other,self, " DIA_Carl_FatherNews_01_02 " );	// From Morgan, your son!
	AI_PlayAni(self,"T_STAND_2_SIT");
	AI_Output(self,other, " DIA_Carl_FatherNews_01_03 " );	// O Innos! (dazed) Have you heard my prayers?
	AI_PlayAni(self,"T_SIT_2_STAND");
	AI_Output(self,other, " DIA_Carl_FatherNews_01_04 " );	// What's wrong with him? Tell me everything!
	AI_Output(other,self, " DIA_Carl_FatherNews_01_05 " );	// He's still alive, but he's being held captive by the orcs.
	AI_Output(self,other, " DIA_Carl_FatherNews_01_06 " );	// Damn... (annoyed) Not to say that this is too good news.
	AI_Output(self,other, " DIA_Carl_FatherNews_01_07 " );	// But at least I still have some hope of seeing him again.
	AI_Output(self,other, " DIA_Carl_FatherNews_01_08 " );	// Now I will pray every day for Innos to help me with this.
	AI_Output(self,other, " DIA_Carl_FatherNews_01_09 " );	// Thank you from the bottom of my heart! Made the old man happy...
	AI_Output(other,self, " DIA_Carl_FatherNews_01_10 " );	// No reason.
	RT_Respect = RT_Respect + 1;
	MIS_FatherNews = LOG_Success;
	Log_SetTopicStatus(TOPIC_FatherNews,LOG_Success);
	B_LogEntry(TOPIC_FatherNews, " I gave word to Morgan's father. The old man was overjoyed to hear that his son was still alive. " );
};

instance DIA_Carl_DoCrossBow(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_DoCrossBow_condition;
	information = DIA_Carl_DoCrossBow_info;
	permanent = FALSE;
	description = " Can you make crossbows? " ;
};

func int DIA_Carl_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Carl_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Carl_DoCrossBow_01_01 " );	// Can you make crossbows?
	AI_Output(self,other, " DIA_Carl_DoCrossBow_01_02 " );	// Crossbows? (surprised) Are you - no, of course.
	AI_Output(self,other, " DIA_Carl_DoCrossBow_01_03 " );	// You need a good carpenter or joiner.
	AI_Output(self,other, " DIA_Carl_DoCrossBow_01_04 " );	// He may be able to help you with this.
	AI_Output(other,self,"DIA_Carl_DoCrossBow_01_05");	//Понял.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap, " Only a carpenter or joiner can teach me how to make crossbows. And where can I find one? " );
};

instance DIA_Carl_MySmith(C_Info)
{
	npc = VLK_461_Carl;
	nr = 6;
	condition = DIA_Carl_MySmith_condition;
	information = DIA_Carl_MySmith_info;
	permanent = FALSE;
	description = " I need a blacksmith. " ;
};

func int DIA_Carl_MySmith_condition()
{
	if((HURRAYICANHIRE == TRUE) && (MIS_CarlCoal == LOG_Success) && (CarlNeed == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Carl_MySmith_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Carl_MySmith_01_00 " );	// I need a blacksmith.
	AI_Output(self,other, " DIA_Carl_MySmith_01_01 " );	// Who do you think I am?
	AI_Output(other,self, " DIA_Carl_MySmith_01_02 " );	// You don't understand. I need a blacksmith in my camp!
	AI_Output(self,other, " DIA_Carl_MySmith_01_03 " );	// Do you have a camp?!
	AI_Output(other,self, " DIA_Carl_MySmith_01_04 " );	// Yes, not far from Onar's farm, in the old tower.
	AI_Output(self,other, " DIA_Carl_MySmith_01_05 " );	// Hmmm... Not bad for someone who's only recently been running around looking for work.
	AI_Output(self,other, " DIA_Carl_MySmith_01_06 " );	// The offer is certainly tempting. But what will it give me?
	AI_Output(other,self, " DIA_Carl_MySmith_01_07 " );	// Well, judge for yourself. What are your prospects here? You have little work, money too.
	AI_Output(other,self, " DIA_Carl_MySmith_01_08 " );	// And given the fact that a blacksmith like Harad works in the city, there's no chance for you to rise at all.
	AI_Output(other,self, " DIA_Carl_MySmith_01_09 " );	// I offer you shelter, food and a stable income.
	AI_Output(self,other, " DIA_Carl_MySmith_01_10 " );	// You're right here. Of course, I don’t bathe in gold, but so far I have had enough to live on.
	AI_Output(self,other, " DIA_Carl_MySmith_01_11 " );	// Okay, it won't get any worse after all. If suddenly something does not like it, I will return back to the city.
	AI_Output(self,other, " DIA_Carl_MySmith_01_12 " );	// And how much are you willing to pay me for my work?
	AI_Output(other,self, " DIA_Carl_MySmith_01_13 " );	// Let's say eighty gold coins a day. I'm sure you didn't earn half that amount here.
	AI_Output(self,other, " DIA_Carl_MySmith_01_14 " );	// What a generous offer of you! Okay, consider that you have a blacksmith in your camp. Just give me time to get myself together.
	AI_Output(other,self, " DIA_Carl_MySmith_01_15 " );	// See you at the camp then. Oh, and by the way - the password to enter there is the phrase 'Dragon Treasures'.
	AI_Output(self,other, " DIA_Carl_MySmith_01_16 " );	// Okay, I'll remember. See you!
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Carl will now work at my forge. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	CARLRECRUITEDDT = TRUE;
	CarlDayHire = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Carl_InTower(C_Info)
{
	npc = VLK_461_Carl;
	nr = 22;
	condition = DIA_Carl_InTower_condition;
	information = DIA_Carl_InTower_info;
	permanent = TRUE;
	description = " How does it work? " ;
};

func int DIA_Carl_InTower_condition()
{
	if((CARLRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Carl_InTower_info()
{
	AI_Output(other, self, " DIA_Carl_InTower_15_00 " );	// How does it work?
	AI_Output(self,other, " DIA_Carl_InTower_01_01 " );	// Great! Nothing to complain about.
};

instance DIA_Carl_SharpKnife(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_SharpKnife_Condition;
	information = DIA_Carl_SharpKnife_Info;
	permanent = TRUE;
	description = " I need you to sharpen this knife. " ;
};

func int DIA_Carl_SharpKnife_Condition()
{
	if ((MY_Hilda_SharpKnife == LOG_Running) && Wld_IsTime( 6 , 10 , 19 , 55 ) && (HildaSharpKnife ==  FALSE ) && (Npc_HasItems(other,ItMy_HildaKnife) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Carl_SharpKnife_Info()
{
	AI_Output(other,self, " DIA_Carl_SharpKnife_15_00 " );	// I need you to sharpen this knife.
	AI_Output(self,other, " DIA_Carl_SharpKnife_04_01 " );	// Of course. But it will cost you five gold.
	Info_ClearChoices(DIA_Carl_SharpKnife);

	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		Info_AddChoice(DIA_Carl_SharpKnife, " You're right. " ,DIA_Carl_SharpKnife_Ok);
	};

	Info_AddChoice(DIA_Carl_SharpKnife, " I don't have that kind of money. " ,DIA_Carl_SharpKnife_No);

};

func void DIA_Carl_SharpKnife_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Carl_SharpKnife_Ok_15_00 " );	// Here's the gold.
	B_GiveInvItems(other,self,ItMi_Gold,5);
	Npc_RemoveInvItems(self,ItMi_Gold,5);
	AI_Output(self,other, " DIA_Carl_SharpKnife_Ok_04_01 " );	// Good! Wait a minute...
	AI_Output(self,other, " DIA_Carl_SharpKnife_Ok_04_02 " );	// ...well, that's it. Now this knife is sharper than a razor!
	HildaSharpKnife = TRUE;
	B_LogEntry(TOPIC_Hilda_SharpKnife, " Blacksmith Carl sharpened Hilda's knife for me. " );
	Info_ClearChoices(DIA_Carl_SharpKnife);
};

func void DIA_Carl_SharpKnife_No()
{
	AI_Output(other,self, " DIA_Carl_SharpKnife_No_15_00 " );	// I don't have that kind of money.
	AI_Output(self,other, " DIA_Carl_SharpKnife_No_04_01 " );	// Sorry, can't help then.
	Info_ClearChoices(DIA_Carl_SharpKnife);
};
