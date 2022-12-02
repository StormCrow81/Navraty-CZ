
const int Bonus_TagNor = 10;
const int Bonus_TagNor_HP = 100;

instance DIA_Orc_8570_TagNor_EXIT(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_exit_condition;
	information = DIA_Orc_8570_TagNor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_8570_TagNor_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8570_TagNor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_NorthTag_PreHello (C_Info) .
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_PreHello_condition;
	information = DIA_Orc_8570_NorthTag_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8570_TagNor_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_PreHello_info()
{
	AI_Output(self,other, " DIA_Orc_8570_TagNor_PreHello_01_01 " );	// MORA CAR TUK...(unhappy) GRAK DUR KAN?
	AI_Output(other,self, " DIA_Orc_8570_TagNor_PreHello_01_02 " );	// What did you say?!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_PreHello_01_03 " );	// BESH MORA! HAD KUD GARDEN...
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_PreHelloOk(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_PreHelloOk_condition;
	information = DIA_Orc_8570_TagNor_PreHelloOk_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8570_TagNor_PreHelloOk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_PreHelloOk_info()
{
	AI_Output(self,other, " DIA_Orc_8570_TagNor_PreHelloOk_01_01 " );	// What do you want, morra?
};

instance DIA_Orc_8570_TagNor_Hello(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Hello_condition;
	information = DIA_Orc_8570_TagNor_Hello_info;
	important = FALSE;
	permanent = FALSE;
	description = " I heard that you are the best hunter among orcs. " ;
};

func int DIA_Orc_8570_TagNor_Hello_condition()
{
	if((TagNorTell == TRUE) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Hello_info()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Hello_Info_18_01 " );	// I heard that you are the best hunter among the orcs.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Hello_Info_18_02 " );	// Arghhh...(disparagingly) And what kind of a person to be does that matter?!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Hello_Info_18_03 " );	// Just thought you could teach me your trade.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Hello_Info_18_04 " );	// No! Tag-Nor will not teach a person anything.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Hello_Info_18_05 " );	// Why else?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Hello_Info_18_06 " );	// Because Tag-Nor doesn't know or respect him!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Hello_Info_18_07 " );	// First, he must show what he is capable of, and maybe then Tag-Nor will teach people how to become a great hunter.
	MIS_TagNorRespect = LOG_Running;
	Log_CreateTopic(TOPIC_TagNorRespect,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_Running);
	B_LogEntry(TOPIC_TagNorRespect, " I met Tag-Nor. According to the orcs, he is the best hunter of the clan and I think I should learn from him. However, first I have to prove to Tag-Nor that I'm worth something by bringing him some some rare and special trophy. " );
};

instance DIA_Orc_8570_North_Tag (C_Info) .
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Muritan_condition;
	information = DIA_Orc_8570_North_Tag_info;
	permanent = FALSE;
	description = " I have something for you. " ;
};

func int DIA_Orc_8570_TagNor_Muritan_condition()
{
	if ((MIS_TagNorRespect == LOG_Running) && ((Npc_HasItems(hero,ItAt_BuritanTooth) >=  1 ) || (Npc_HasItems(hero,ItAt_TrollBlackFur) >=  1 ) || (Npc_HasItems(hero,ItAt_CurratIshi) >=  1 )))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Muritan_info()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Muritan_Info_18_01 " );	// I have something here for you.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Info_18_02 " );	// And what exactly does a person bring to Tag-Nor?
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Muritan_Info_18_03 " );	// One very rare hunting trophy. Here, look at him.
	Info_ClearChoices(DIA_Orc_8570_North_Tag);

	if(Npc_HasItems(other,ItAt_BuritanTooth) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan, " (Give Muritan Fang) " ,DIA_Orc_8570_TagNor_Muritan_Claw);
	};
	if(Npc_HasItems(other,ItAt_TrollBlackFur) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan, " (Give Black Troll Skin) " ,DIA_Orc_8570_TagNor_Muritan_Fur);
	};
	if(Npc_HasItems(other,ItAt_CurratIshi) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan, " (from South-English) " ,DIA_Orc_8570_TagNor_Muritan_Ishi);
	};
};

func void DIA_Orc_8570_North_Tag_Muritan_Claw()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ItAt_BuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_BuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if ((Npc_HasItems(other,ItAt_PW_MuritanTooth) ==  FALSE ) && (Npc_HasItems(other,ItAt_BuritanTooth) ==  FALSE ))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Claw_01_01 " );	// Arghhh...(surprised) That must be Muritan's poison tooth! Where man take it?!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Muritan_Claw_01_02 " );	// I was able to track down one of these creatures and kill it.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Claw_01_03 " );	// A person to be a very skilled hunter, just to be able to kill him. Tag Nor be impressed!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Muritan_Claw_01_04 " );	// I see you were impressed by my gift. Now will you teach me how to hunt?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Claw_01_06 " );	// All right, Tag-Nor will be trained by a human.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Claw_01_07 " );	// Although I think if a man kill Muritan, he doesn't really need it.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 10 " );
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect, " I brought Tag-Nor a rare hunting trophy, Muritan's Poison Fang. This greatly impressed the old orc hunter, and he agreed to teach me his trade. " );
	Info_ClearChoices(DIA_Orc_8570_North_Tag);
};

func void DIA_Orc_8570_TagNor_Muritan_Fur()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	Npc_RemoveInvItems(self,ItAt_TrollBlackFur,1);
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Fur_01_01 " );	// Arghhh...(approvingly) Be the skin of a big black troll!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Fur_01_02 " );	// Tag-Nor see that the man be a very skilled hunter.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Muritan_Fur_01_03 " );	// Now will you teach me how to hunt?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Fur_01_04 " );	// All right, Tag-Nor will be trained by a human.
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 5 " );
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect, " I brought Tag-Nor a rare hunting trophy - the skin of a black troll, and he agreed to teach me his trade. " );
	Info_ClearChoices(DIA_Orc_8570_North_Tag);
};

func void DIA_Orc_8570_North_Tag_She()
{
	B_GivePlayerXP(1500);
	B_GiveInvItems(other,self,ItAt_CurratIshi,1);
	Npc_RemoveInvItems(self,ItAt_CurratIshi,1);

	if(Trophy_IshiCurrat == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItOut_IshiCurrat,Npc_HasItems(other,ItOut_IshiCurrat));
		Trophy_IshiCurrat = FALSE;
	};

	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Ishi_01_01 " );	// Hmmm... Tag-Nor will never see this! He be greatly surprised.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Ishi_01_02 " );	// He thinks that a person would be a very skilled hunter if he could get such a thing.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Muritan_Ishi_01_03 " );	// So now you're going to teach me how to hunt?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Ishi_01_04 " );	// All right, Tag-Nor will be trained by a human!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Muritan_Ishi_01_05 " );	// But to think that since a person could bring such a trophy to Tag-Nor, he no longer needs it.
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 15 " );
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect, " I brought Tag-Nor a rare trophy - Ishi-Kurrat's dorsal spike. This greatly impressed the old orc hunter, and he agreed to teach me his trade. " );
	Info_ClearChoices(DIA_Orc_8570_North_Tag);
};

instance DIA_Orc_8570_TagNor_Bow(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Bow_condition;
	information = DIA_Orc_8570_TagNor_Bow_info;
	important = FALSE;
	permanent = FALSE;
	description = " Why don't you orcs use bows? " ;
};

func int DIA_Orc_8570_TagNor_Bow_condition()
{
	if(TagNorTeach == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Bow_info()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Bow_Info_18_01 " );	// Why don't you orcs use bows?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Bow_Info_18_02 " );	// The bow is the weapon of the people. Brothers do not know how to fight out of it!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_Bow_Info_18_03 " );	// What about crossbows?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Bow_Info_18_04 " );	// People also come up with them, but we can learn how to use them in battle.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_Bow_Info_18_05 " );	// If a person has a little experience, Tag-Nor can show him how to shoot even better with a crossbow.
	TagNorTeachCrossBow = TRUE;
};

instance DIA_Orc_8570_TagNor_FindCrBow(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBow_condition;
	information = DIA_Orc_8570_TagNor_FindCrBow_info;
	permanent = FALSE;
	description = " Where can I get a good hunting crossbow? " ;
};

func int DIA_Orc_8570_TagNor_FindCrBow_condition()
{
	if(TagNorTeachCrossBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBow_info()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_01 " );	// Where can I get a good hunting crossbow?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_02 " );	// (thoughtfully) Usually for a simple hunter to approach any of the crossbows.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_03 " );	// The power of a simple crossbow is enough to kill any beast sooner or later.

	if((KELIOSFIRETEST == FALSE) && (SBMODE == TRUE))
	{
		AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_04 " );	// But if a person wants to have a weapon worthy only of a great hunter, then...
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_05");	//То что?
		AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_06 " );	// ...then perhaps Tag-Nor can help him. But it can be very difficult!
		AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_07 " );	// I'm not afraid of difficulties! Tell me where I can find such a weapon.
		AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_08 " );	// Well, well... But then you first bring me some things.
		AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_09 " );	// Well, of course, where without it! Okay, tell me - what exactly do you need?
		AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_10 " );	// First, Thag-Nor will need magic ore! A lot of ore magic...
		AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_11 " );	// How much ore do you need?
		AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_12 " );	// A hundred pieces of ore should be enough for him.
		AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_13 " );	// But that's a whole mountain of ore!
		AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_14 " );	// Can Tag-Nor say that it is easy for him to be?
		AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Info_18_15 " );	// If he finds this too hard for him, then we can end this conversation.
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBow);
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBow, " Yes, this is not for me. " ,DIA_Orc_8570_TagNor_FindCrBow_Back);
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBow, " Okay, I'll try to get you this ore. " ,DIA_Orc_8570_TagNor_FindCrBow_Forward);
	};
};

func void DIA_Orc_8570_TagNor_FindCrBow_Back()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Back_01_01 " );	// Yes, this is not for me.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Back_01_02 " );	// As you say, man.
	AI_StopProcessInfos(self);
};


func void DIA_Orc_8570_TagNor_FindCrBow_Forward()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_01 " );	// Okay, I'll try to get this ore for you.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_02 " );	// Good... And yet, if a person suddenly finds black ore, then he can also bring it to Tag-Nor!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_03 " );	// He will definitely find a use for her.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_04 " );	// I'll keep that in mind. What else do you need?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_05 " );	// The second thing you'll need to get for Tag-Nor is a block of wood... beech wood!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_06 " );	// Hear that such trees grow in the south of the island. Man better look there!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_07 " );	// I hope that's all?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_08 " );	// No. Black cave troll horn! You must bring it to Tag-Nor!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_09 " );	// Yeah, this is getting interesting...
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_10 " );	// Why does the person look like that? Is he scared?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_11 " );	// Thag Nor thinks it's not hard for a hunter like you.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_12 " );	// I would like your confidence. Well, what's next on the list?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_13 " );	// Then I'll need... huge black cougar tendons! Tag-Nor hear that they inhabit the mountains to the southwest of the island.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_14 " );	// But be careful not to tear them when you gut the beast. Otherwise they become useless!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_15 " );	// I'll try to be more careful.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_16 " );	// And the last, most important thing you'll need to find for me is a rare symbol that once belonged to a great orc hunter!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_17 " );	// And where can I find this rare symbol?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_18 " );	// Tag-Nor hear, one such hero is buried in the old orc graveyard.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBow_Forward_01_22 " );	// Well, the work ahead is not easy. I won't waste time!
	MIS_TagNorGrHunWeap = LOG_Running;
	Log_CreateTopic(TOPIC_TagNorGrHunWeap,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TagNorGrHunWeap,LOG_Running);
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Tag-Nor said that he could help me get a weapon worthy of great hunters. However, after he told me what it would take, I almost regretted getting involved in all this. So, I you need to bring Tag-Nor one hundred pieces of magical ore, a solid block of beech wood, the horn of a black cave troll, the tendons of a giant black cougar and, finally, a symbol that once belonged to a great orc hunter. . According to him, one of these heroes should be buried there.");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_BlackOre(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_BlackOre_condition;
	information = DIA_Orc_8570_TagNor_BlackOre_info;
	important = FALSE;
	permanent = FALSE;
	description = " What's the difference between regular magic ore and black ore? " ;
};

func int DIA_Orc_8570_TagNor_BlackOre_condition()
{
	if(MIS_TagNorGrHunWeap == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_BlackOre_info()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_BlackOre_01_01 " );	// What's the difference between regular magic ore and black ore?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_BlackOre_01_02 " );	// Tag-Nor man cannot answer this question.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_BlackOre_01_03 " );	// But he knows for sure that black ore has more magic than regular ore.
};

instance DIA_Orc_8570_TagNor_TeachHunting(C_Info)
{
	npc = Orc_8570_TagNor;
	nr = 5;
	condition = DIA_Orc_8570_TagNor_TeachHunting_Condition;
	information = DIA_Orc_8570_TagNor_TeachHunting_Info;
	permanent = TRUE;
	description = " I want to learn how to carve loot. " ;
};

func int DIA_Orc_8570_TagNor_TeachHunting_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orc_8570_Nor_Tag_Hello ) && ( NorTeach tag ==  TRUE ) && ( NorTeachAll tag ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachHunting_Info()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_TeachHunting_01_00 " );	// I want to learn how to butcher prey.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_TeachHunting_01_01 " );	// What does the person want to know?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE))
	{
		Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
		Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,Dialog_Back,DIA_Orc_8570_TagNor_TeachHunting_Back);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Ломать когти.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Orc_8570_TagNor_TeachHunting_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Сдирать шкуру.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Orc_8570_TagNor_TeachHunting_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Вырывать клыки.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Orc_8570_TagNor_TeachHunting_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc( " Cut fire tongue. " ,B_GetLearnCostTalentOrc(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_FireTongue)),DIA_Orc_8570_TagNor_TeachHunting_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Отламывать рог драконьего снеппера.",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Orc_8570_TagNor_TeachHunting_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8570_TagNor_TeachHunting_01_04 " );	// I have nothing more to teach man.
		TagNorTeachAll = TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachHunting_Back()
{
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Claws))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Fur))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Teeth))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_FireTongue))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_DrgSnapperHorn))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};


instance DIA_Orc_8570_TagNor_TeachCrossBow(C_Info)
{
	npc = Orc_8570_TagNor;
	nr = 6;
	condition = DIA_Orc_8570_TagNor_TeachCrossBow_Condition;
	information = DIA_Orc_8570_TagNor_TeachCrossBow_Info;
	permanent = TRUE;
	description = " Teach me how to shoot a crossbow. " ;
};

func int DIA_Orc_8570_TagNor_TeachCrossBow_Condition()
{
	if(TagNorTeachCrossBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_Info()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_TeachCrossBow_15_00 " );	// Teach me how to shoot a crossbow.
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};


func void DIA_Orc_8570_TagNor_TeachCrossBow_Back()
{
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1()
{
	if(B_TeachFightTalentPercentOrc(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
	};
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5()
{
	if(B_TeachFightTalentPercentOrc(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
	};
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};

instance DIA_Orc_8570_TagNor_FindCrBowIng(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBowIng_condition;
	information = DIA_Orc_8570_TagNor_FindCrBowIng_info;
	permanent = TRUE;
	description = " About the things you needed. " ;
};

func int DIA_Orc_8570_TagNor_FindCrBowIng_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (AllIngCrBow_All == FALSE) && ((AllIngCrBow_Ore == FALSE) || (AllIngCrBow_Tree == FALSE) || (AllIngCrBow_Horn == FALSE) || (AllIngCrBow_Puma == FALSE) || (AllIngCrBow_Sign == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_info()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_01 " );	// About those things you needed.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowIng_01_02 " );	// Do people have something to show Tag-Nor?

	Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
	Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,Dialog_Back,DIA_Orc_8570_TagNor_FindCrBowIng_Back);

	if ((Npc_HasItems(other,ItMy_Nugget) >=  100 ) && (AllIngCrBow_Ore ==  FALSE ))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng, " Give Magic Ore " ,DIA_Orc_8570_TagNor_FindCrBowIng_Ore);
	};

	if ((Npc_HasItems(other,ItMi_BukTree) >=  1 ) && (AllIngCrBow_Tree ==  FALSE ))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng, " Give Beech Bar " ,DIA_Orc_8570_TagNor_FindCrBowIng_Tree);
	};

	if((Npc_HasItems(other,ItAt_BlackTrollHorn) >= 1) && (AllIngCrBow_Horn == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng, " Give Black Troll Horn " ,DIA_Orc_8570_TagNor_FindCrBowIng_Horn);
	};

	if((Npc_HasItems(other,ItAt_PumaMuscle) >= 1) && (AllIngCrBow_Puma == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng, " Give Puma Tendons " ,DIA_Orc_8570_TagNor_FindCrBowIng_Puma);
	};

	if((Npc_HasItems(other,ItMi_HuntSign) >= 1) && (AllIngCrBow_Sign == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng, " Give hunter symbol " ,DIA_Orc_8570_TagNor_FindCrBowIng_Sign);
	};

	if((Npc_HasItems(other,ItMi_Zeitspalt_Addon) >= 1) && (AllIngCrBow_BlackOre == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng, " Give Black Magic Ore " ,DIA_Orc_8570_TagNor_FindCrBowIng_BlackOre);
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Ore()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_03 " );	// There are a hundred pieces of magic ore, just like you asked.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowIng_01_04 " );	// Hmmm... be good! You can give it to Thag-Nor.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_05");	//Держи.
	B_GiveInvItems(other,self,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
	AllIngCrBow_Ore = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Tag-Nor all the things he asked for. Let's see what happens next... " );
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Tag-Nor one hundred pieces of magic ore. " );
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Tree()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_06 " );	// I have a solid block of tropical beech.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowIng_01_07 " );	// Then give it to Tag-Nor!
	B_GiveInvItems(other,self,ItMi_BukTree,1);
	Npc_RemoveInvItems(self,ItMi_BukTree,Npc_HasItems(self,ItMi_BukTree));
	AllIngCrBow_Tree = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Tag-Nor all the things he asked for. Let's see what happens next... " );
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Tag-Nor a solid block of tropical beech. " );
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Horn()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_09 " );	// Here is the horn of the cave black troll.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowIng_01_10 " );	// Great, man! Now give it to Tag-Nor.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_11");	//Конечно.
	B_GiveInvItems(other,self,ItAt_BlackTrollHorn,1);
	Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,Npc_HasItems(self,ItAt_BlackTrollHorn));
	AllIngCrBow_Horn = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Tag-Nor all the things he asked for. Let's see what happens next... " );
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought the horn of the cave black troll to Tag-Nor. " );
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Puma()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_12 " );	// Here are the tendons of the black cougar, as you requested.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowIng_01_13 " );	// If so, then Tag-Nor will gladly take them from humans.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_14");	//Вот они.
	B_GiveInvItems(other,self,ItAt_PumaMuscle,1);
	Npc_RemoveInvItems(self,ItAt_PumaMuscle,Npc_HasItems(self,ItAt_PumaMuscle));
	AllIngCrBow_Puma = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Tag-Nor all the things he asked for! Now let's see what happens next... " );
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Black Cougar tendons to Tag-Nor. " );
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Sign()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_15 " );	// I have the glyph of the great orc hunter.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowIng_01_16 " );	// So did you manage to get it? Tag-Nor be greatly surprised! Hurry show it to me!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_17");	//Вот.
	B_GiveInvItems(other,self,ItMi_HuntSign,1);
	Npc_RemoveInvItems(self,ItMi_HuntSign,Npc_HasItems(self,ItMi_HuntSign));
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowIng_01_18 " );	// Yes, it's him! Man do everything right... Tag-Nor be very pleased!
	AllIngCrBow_Sign = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Tag-Nor all the things he asked for. Let's see what happens next... " );
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap, " I brought Tag-Nor the symbol of the great orc hunter. " );
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_BlackOre()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_19 " );	// I have black ore.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowIng_01_20 " );	// Be very good! But for now, leave her, she's still going to come in handy man.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_21 " );	// As you say.
	AllIngCrBow_BlackOre = TRUE;
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Back()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowIng_01_22 " );	// Nothing yet.
	Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
};

instance DIA_Orc_8570_TagNor_FindCrBowSmithTeacher(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_condition;
	information = DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_info;
	important = FALSE;
	permanent = FALSE;
	description = " Now you have everything. " ;
};

func int DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (AllIngCrBow_All == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_01 " );	// Now you have everything. What's next?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_02 " );	// The man did a good job... Got everything that Tag-Nor asked for.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_03 " );	// But in order for his labors not to be in vain, he must find someone who can teach people how to make his weapons.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_04 " );	// Are you saying that I will have to make this crossbow myself?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_05 " );	// Be that way. Or does a person think that Tag-Nor can do it for him?
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_06 " );	// Well, I thought...
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_07 " );	// Tag-Nor to be a simple hunter and he doesn't know how to make weapons!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_08 " );	// Man look for someone who will show man how you can make it.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_09 " );	// Who could it be?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_10 " );	// A person to ask this from people like him. Perhaps those who know how to forge weapons.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_11 " );	// That is, the blacksmiths. Well, I understand you.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_12 " );	// Good. When a person will be able to make weapons, he will again come to Tag-Nor.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_13 " );	// Then he will tell you what to do next.
	B_LogEntry(TOPIC_TagNorGrHunWeap, " Tag-Nor wants me to find someone to teach me how to make crossbows. Guess I should ask the blacksmiths about it. " );
	FindSmithTeacherCrBow = TRUE;
};

instance DIA_Orc_8570_TagNor_BeginMakeNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_BeginMakeNimrod_condition;
	information = DIA_Orc_8570_TagNor_BeginMakeNimrod_info;
	important = FALSE;
	permanent = FALSE;
	description = " I can do rests for crossbows. " ;
};

func int DIA_Orc_8570_TagNor_BeginMakeNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (PlayerTeachCrBowMade == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_BeginMakeNimrod_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_BeginMakeNimrod_01_01 " );	// I can do rests for crossbows.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_BeginMakeNimrod_01_02 " );	// If so, then the human should be ready to create a great orc hunter weapon!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_BeginMakeNimrod_01_03 " );	// What do I need for this?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_BeginMakeNimrod_01_04 " );	// Here, he take these ancient orc writings. In them, a person will find everything he needs.
	B_GiveInvItems(self,other,ItWr_DragNimrod,1);
	AI_Output(self,other, " DIA_Orc_8570_TagNor_BeginMakeNimrod_01_05 " );	// Tag-Nor also return to the person everything that he used to bring to him.
	CreateInvItems(other,ItMi_Nugget,100);
	CreateInvItems(other,ItMi_BukTree,1);
	CreateInvItems(other,ItAt_BlackTrollHorn,1);
	CreateInvItems(other,ItMi_HuntSign,1);
	CreateInvItems(other,ItAt_PumaMuscle,1);
	AI_Output(self,other, " DIA_Orc_8570_TagNor_BeginMakeNimrod_01_06 " );	// Now a man to step and return to Tag-Nor, when already make a great weapon!
	B_LogEntry(TOPIC_TagNorGrHunWeap, " Tag-Nor gave me an ancient Orc script that describes the creation of a great Orc weapon. Now all I have to do is craft it. " );
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_GetNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_GetNimrod_condition;
	information = DIA_Orc_8570_TagNor_GetNimrod_info;
	permanent = FALSE;
	description = " I've made the crossbow of great hunters! " ;
};

func int DIA_Orc_8570_TagNor_GetNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && ((Npc_HasItems(hero,ITRW_GREATARBALET_ORC_01) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_02) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_03) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_04) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_05) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_GetNimrod_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GetNimrod_01_01 " );	// I created the crossbow of the great orc hunters!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_02 " );	// HROK NAKAR!!! (admiringly) Has man managed to do it? Create a great weapon...
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_03 " );	// ...a weapon worthy only of great warriors.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GetNimrod_01_04 " );	// As you can see, Tag-Nor! I would not deceive you.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_05 " );	// Well, if so... Then a person can consider himself a great warrior. And he rightfully deserves to wear it!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GetNimrod_01_06 " );	// Actually, this is what I was going to do.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_07 " );	// Tag-Nor should not be surprised that a man would want to keep this crossbow for himself. With such a weapon, he will be almost invincible!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_08 " );	// However, Tag-Nor still wants to ask a person about one thing.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_09");	//О какой?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_10 " );	// (smartly) Does he want to give this great weapon to Thag-Nor?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_11");	//Что?!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_12 " );	// Tag-Nor always dream of having a weapon like Drag Nimrod! With such a crossbow, Tag-Nor could earn even more respect from his brothers.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_13 " );	// And in return, a person could ask Tag-Nor for absolutely everything he wants!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GetNimrod_01_14 " );	// A very unexpected offer! I need to think carefully about this.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_15 " );	// Tag-Nor don't rush people. Let him think as much as he wants. And Tag-Nor will be waiting for his answer.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GetNimrod_01_16 " );	// Agreed. But for now, I'll keep this crossbow for myself. You do not mind, do you?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GetNimrod_01_17 " );	// Of course, wear it! After all, he is rightfully yours.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 10 " );
	};

	MIS_TagNorGrHunWeap = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorGrHunWeap,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorGrHunWeap, " I informed Tag-Nor that I had succeeded in making the Drag Nimrod, the crossbow of the great orc hunters. He appreciated my efforts and offered to give him this weapon for an appropriate reward. I should consider his proposal. " );} ;

instance DIA_Orc_8570_TagNor_GiveNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_GiveNimrod_condition;
	information = DIA_Orc_8570_TagNor_GiveNimrod_info;
	permanent = FALSE;
	description = " Do you still need that crossbow? " ;
};

func int DIA_Orc_8570_TagNor_GiveNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_SUCCESS) && ((Npc_HasItems(hero,ITRW_GREATARBALET_ORC_01) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_02) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_03) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_04) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_05) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_GiveNimrod_info()
{
	B_GivePlayerXP(3000);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_01_01 " );	// Do you still need that crossbow?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_01_02 " );	// Drag-Nimrod?! (briskly) Tag-Nor is already talking to people about wanting to own it. But why does he ask?
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_01_03 " );	// I still decided to give it to you.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_01_04 " );	// Man speak seriously? Does he really want to give him Drag Nimrod?
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_01_05 " );	// Yes, but I'd like to know what I'll get in return.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_01_06 " );	// Tag-Nor expect these words! Therefore, he wants to offer people only what no one else can give him.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_07");	//И что же?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_01_08 " );	// The true skill of a hunter is to always remain inconspicuous when sneaking up on your prey.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_01_09 " );	// Tag-Nor can show a person how to become invisible for a while!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_10");	//Ты шутишь?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_01_11 " );	// Tag-Nor isn't joking at all. (seriously) He will share this secret with a man if he gives him Drag-Nimrod!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_01_12 " );	// But if he's not interested, he can learn how to increase his strength, agility, or vitality! Tag-Nor could teach him that too.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_01_14 " );	// Well, so what man to choose?
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 5 " );
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_GiveNimrod);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod, " Show me how to become invisible. " ,DIA_Orc_8570_TagNor_GiveNimrod_Hide);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod, " Show me how to get stronger. " ,DIA_Orc_8570_TagNor_GiveNimrod_Str);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod, " Show me how to get smarter. " ,DIA_Orc_8570_TagNor_GiveNimrod_Dex);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod, " Show me how to be more tenacious. " ,DIA_Orc_8570_TagNor_GiveNimrod_Hlth);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Hide()
{
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_01 " );	// Show me how to become invisible.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_02 " );	// You choose the most valuable reward! Now man listen carefully.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_03 " );	// Take this magical elixir first.
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_04 " );	// After drinking it, you become a ghost, and not a single living soul can see you!
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_05 " );	// And how long can I remain invisible?
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_06 " );	// Tag-Nor is unknown. But it lasts until you let yourself be discovered.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_07 " );	// But beware of creatures spawned by strong magic! Some of them can feel the presence of a person nearby!
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_08 " );	// And then their magic will break the effects of the elixir spell.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_09 " );	// All right, Tag-Nor. I got it. Hold your crossbow, as we agreed.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_10 " );	// HROTAK NAK!!!...(happily) Tag-Nor now has the greatest orc hunter's weapon at last! He is very much to thank the man for this.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_11 " );	// Well, yes, of course.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Str()
{
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,Bonus_TagNor);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Str_01_01 " );	// Show me how to get stronger.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Str_01_02 " );	// As you say, man. Now listen to me carefully.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_03");	//...(рассказывает)...
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Str_01_04 " );	// Now you become much stronger than before.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Str_01_05 " );	// And here is your crossbow, Tag-Nor. As we agreed.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Str_01_06 " );	// HROTAK NAK!!! (joyfully) Tag-Nor's greatest weapon of hunters is now at last! He is very much to thank the man for this.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Str_01_07 " );	// Well, yes, of course.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Dex()
{
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,Bonus_TagNor);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_01 " );	// Show me how to get more agile.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_02 " );	// As you say, man. Now listen to me carefully.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_03");	//...(рассказывает)...
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_04 " );	// That's it! Now you become much more dexterous than before.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_05 " );	// And here is your crossbow, Tag-Nor. As we agreed.


	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_06 " );	// HROTAK NAK!!! (joyfully) Tag-Nor's greatest weapon of hunters is now at last! He is very much to thank the man for this.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_07 " );	// Well, yes, of course.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Hlth()
{
	B_RaiseAttribute(other,ATR_HITPOINTS_MAX,Bonus_TagNor_HP);
	Npc_ChangeAttribute(other,ATR_HITPOINTS,Bonus_TagNor_HP);
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_01 " );	// Show me how to be more durable.
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_02 " );	// As you say, man. Now listen to me carefully.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_03");	//...(рассказывает)...
	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_04 " );	// That's it! Now you can take a lot more hits than before.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_05 " );	// And here is your crossbow, Tag-Nor. As we agreed.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other, " DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_06 " );	// HROTAK NAK!!! (joyfully) Tag-Nor's greatest weapon of hunters is now at last! He is very much to thank the man for this.
	AI_Output(other,self, " DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_07 " );	// Well, yes, of course.
	AI_StopProcessInfos(self);
};

// -------------------------------------- orc trader-------- -----------------------

var int OrcTradeDone_01;
var int OrcTradeDone_02;
var int OrcTradeDone_03;
var int OrcTradeDone_04;
var int OrcTradeDone_05;

instance DIA_Orc_8549_TradeOrc_EXIT(C_Info)
{
	npc = Orc_8549_TradeOrc;
	condition = DIA_Orc_8549_TradeOrc_exit_condition;
	information = DIA_Orc_8549_TradeOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8549_TradeOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8549_TradeOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8549_TradeOrc_Trade(C_Info)
{
	npc = Orc_8549_TradeOrc;
	condition = DIA_Orc_8549_TradeOrc_Trade_condition;
	information = DIA_Orc_8549_TradeOrc_Trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show your products. " ;
};

func int DIA_Orc_8549_TradeOrc_Trade_condition()
{
	return TRUE;
};

func void DIA_Orc_8549_TradeOrc_Trade_info()
{
	AI_Output(other,self, " DIA_Camper01_TRADE_15_00 " );	// Display your products.

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_PreHello_01_03 " );	// DABAR KARAD GOR TAK NIR VAK.
		AI_StopProcessInfos(self);
	}
	else
	{
		if ( ( OrcTradeDone_05 ==  FALSE ) && ( ORCRESPECT  >=  90 ) && ( other . guild !=  GIL_KDF ) && ( other . guild !=  GIL_KDM ) && ( other . guild !=  GIL_KDW ) && ( other . guild !=  GIL_GUR ) && (other.guild !=  GIL_NOV ) && (other.guild !=  GIL_NDW ) && (other.guild ! =  GIL_NDM ) && (other.guild != GIL_NDM ) &&& (other.guild != GIL_DMT))
		{
			CreateInvItems(self,ItRu_ShadowMount,1);
			CreateInvItems(self,ItMw_Halleberde_Orc,1);
			OrcTradeDone_05 = TRUE;
		};
		if((OrcTradeDone_04 == FALSE) && (ORCRESPECT >= 70) && (ORCRESPECT < 90))
		{
			CreateInvItems(self,ITMI_QUICKSILVER,2);
			CreateInvItems(self,ItPl_Strength_Herb_01,1);
			CreateInvItems(self,ItMi_Sulfur,4);
			CreateInvItems(self,ITPO_XORCPOTION,1);
			CreateInvItems(self,ItAt_TrollFur,1);
			OrcTradeDone_04 = TRUE;
		};
		if((OrcTradeDone_03 == FALSE) && (ORCRESPECT >= 50) && (ORCRESPECT < 70))
		{
			CreateInvItems(self,ITRW_CROSSBOW_ORC,1);
			CreateInvItems(self,ItPl_Health_Herb_03,2);
			CreateInvItems(self,ItPl_Mushroom_01,5);
			CreateInvItems(self,ItMw_2H_OrcAxe_02,3);
			CreateInvItems(self,ITFO_ADDON_ORCRUM,1);
			CreateInvItems(self,ItAt_ShadowFur,2);
			OrcTradeDone_03 = TRUE;
		};
		if((OrcTradeDone_02 == FALSE) && (ORCRESPECT >= 30) && (ORCRESPECT < 50))
		{
			CreateInvItems(self,ITRW_CROSSBOW_ORC_LIGHT,1);
			CreateInvItems(self,ItMw_2H_OrcAxe_01,5);
			CreateInvItems(self,ITMI_NUGGET,2);
			CreateInvItems(self,ItMi_Coal,10);
			CreateInvItems(self,ItMi_Pitch,3);
			CreateInvItems(self,ItAt_ShadowHorn,2);
			OrcTradeDone_02 = TRUE;
		};
		if((OrcTradeDone_01 == FALSE) && (ORCRESPECT >= 10) && (ORCRESPECT < 30))
		{
			CreateInvItems(self,ItAt_WargFur,3);
			CreateInvItems(self,ItRw_Bolt,50);
			CreateInvItems(self,ItLsTorch,5);
			CreateInvItems(self, ITMI_SNUGGET , 15 );
			CreateInvItems(self,ItPl_Blueplant,3);
			CreateInvItems(self,ItFoMuttonRaw,10);
			OrcTradeDone_01 = TRUE;
		};
	};
};
