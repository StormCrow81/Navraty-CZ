

instance DIA_Wolf_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_EXIT_Condition;
	information = DIA_Wolf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Wolf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hello (C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_Hallo_Condition;
	information = DIA_Wolf_Hello_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Wolf_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hello_Info()
{
	AI_Output(other,self, " DIA_Wolf_Hallo_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Wolf_Hallo_08_01 " );	// Hey! I know you! You are from the colony.
	AI_Output(self,other, " DIA_Wolf_Hallo_08_02 " );	// What do you need here?
};

instance DIA_Wolf_AboutSylvio(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_AboutSylvio_Condition;
	information = DIA_Wolf_AboutSylvio_Info;
	permanent = FALSE;
	description = " What do you think of Silvio? " ;
};

func int DIA_Wolf_AboutSylvio_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Wolf_Hello ) && ( Chapter <  2 ) && ( Sylvio_angequatscht >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutSylvio_Info()
{
	AI_Output(other,self, " DIA_Wolf_AboutSylvio_01_00 " );	// What do you think of Silvio?
	AI_Output(self,other, " DIA_Wolf_AboutSylvio_01_01 " );	// Amazing person! Well... outstanding! Well, some ... some unthinkable! Well... the most beautiful...
	AI_Output(other,self, " DIA_Wolf_AboutSylvio_01_02 " );	// Uh... what?!
	AI_Output(self,other, " DIA_Wolf_AboutSylvio_01_03 " );	// You already know that I, who came here with Lee, think about him.
	AI_Output(other,self, " DIA_Wolf_AboutSylvio_01_04 " );	// I just wanted to...
	AI_Output(self,other, " DIA_Wolf_AboutSylvio_01_05 " );	// Listen, buddy! Better shove all these questions of yours away and get down to business.
};

instance DIA_Wolf_WannaJoin(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Condition;
	information = DIA_Wolf_WannaJoin_Info;
	permanent = FALSE;
	description = " I want to join you. " ;
};

func int DIA_Wolf_WannaJoin_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Wolf_Hallo ) && ( Capital <  2 )) .
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Wolf_WannaJoin_15_00 " );	// I want to join you.
	AI_Output(self,other, " DIA_Wolf_WannaJoin_New_08_01 " );	// Hmmm...(thoughtfully) Would you like to be one of us? Commendable!
	AI_Output(self,other, " DIA_Wolf_WannaJoin_New_08_02 " );	// But first you need to show everyone what you can do.
	AI_Output(other,self, " DIA_Wolf_WannaJoin_New_08_03 " );	// What about you?
	AI_Output(self,other, " DIA_Wolf_WannaJoin_New_08_04 " );	// If you want to impress me, hit all three targets on the shooting range!
	AI_Output(self,other, " DIA_Wolf_WannaJoin_New_08_05 " );	// Do this and consider my consent in your pocket.
	MIS_AppleTest = LOG_Running;
	Log_CreateTopic(TOPIC_AppleTest,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AppleTest,LOG_Running);
	B_LogEntry(TOPIC_AppleTest, " Wolf will give me his consent if I hit all three targets on the shooting range. " );
	B_StartOtherRoutine(Sld_805_Cord,"WaitShoot");
};

instance DIA_Wolf_WannaJoin_Done(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Done_Condition;
	information = DIA_Wolf_WannaJoin_Done_Info;
	permanent = FALSE;
	description = " I did what you asked. " ;
};

func int DIA_Wolf_WannaJoin_Done_Condition()
{
	if((MIS_AppleTest == LOG_Running) && (AIMALLISDONE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Wolf_WannaJoin_Done_15_00 " );	// I did what you asked. Now will you vote for me?
	AI_Output(self,other, " DIA_Wolf_WannaJoin_Done_08_01 " );	// Why not... (enough) We need people like you!
	AI_Output(self,other, " DIA_Wolf_WannaJoin_08_02 " );	// But don't count on getting the consent of others so easily.
	AI_Output(self,other, " DIA_Wolf_WannaJoin_08_03 " );	// We've been getting all sorts of rabble lately. And even many old mercenaries may not remember you.
	AI_Output(self,other, " DIA_Wolf_WannaJoin_08_04 " );	// I barely recognized you myself, you look terribly haggard.
	AI_Output(other,self, " DIA_Wolf_WannaJoin_15_05 " );	// When the Barrier fell, I miraculously managed to stay alive.
	AI_Output(self,other, " DIA_Wolf_WannaJoin_08_06 " );	// But it looks like you got lucky anyway.
	MIS_AppleTest = LOG_Success;
	Log_SetTopicStatus(TOPIC_AppleTest,LOG_Success);
	B_LogEntry(TOPIC_AppleTest, " Wolf will vote for me. " );
	B_LogEntry_Quiet(TOPIC_SLDRespekt, " Wolf doesn't mind me joining the mercenaries. " );
	B_StartOtherRoutine(Sld_805_Cord,"Start");
};

instance DIA_Wolf_WannaBuy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 6;
	condition = DIA_Wolf_WannaBuy_Condition;
	information = DIA_Wolf_WannaBuy_Info;
	permanent = FALSE;
	description = " Can you sell anything? " ;
};


func int DIA_Wolf_WannaBuy_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Wolf_Hallo ) && ( CAPTAINNORTHWEST  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaBuy_Info()
{
	AI_Output(other,self, " DIA_Wolf_WannaBuy_15_00 " );	// Can you sell something?
	AI_Output(self,other, " DIA_Wolf_WannaBuy_08_01 " );	// Oh, don't ask.
	AI_Output(self,other, " DIA_Wolf_WannaBuy_08_02 " );	// Bennet, one of the new guys, is now in charge of weapons and armor.
	AI_Output(self,other, " DIA_Wolf_WannaBuy_08_03 " );	// In the colony, I was in charge of Lee's entire arsenal, and then a good blacksmith came and - pfft - I was left without a job.
	AI_Output(self,other, " DIA_Wolf_WannaBuy_08_04 " );	// I really need a new job, even if it's guarding local farms.
	AI_Output(self,other, " DIA_Wolf_WannaBuy_08_05 " );	// I don't care, as long as I don't be a jerk here.
};


instance DIA_Wolf_WannaLearn (C_Info)
{
	npc = SLD_811_Wolf;
	nr = 7;
	condition = DIA_Wolf_WannaLearn_Condition;
	information = DIA_Wolf_WannaLearn_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int DIA_Wolf_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaLearn_Info()
{
	AI_Output(other,self, " DIA_Wolf_WannaLearn_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Wolf_WannaLearn_08_01 " );	// I can teach you how to use a bow if you like. Anyway, I have nothing to do now.
	Wolf_TeachBow = TRUE;
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher, " Wolf can teach me how to use a bow. " );
};


var int Wolf_Brand_Bow;

instance DIA_Wolf_TEACH(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 8;
	condition = DIA_Wolf_TEACH_Condition;
	information = DIA_Wolf_TEACH_Info;
	permanent = TRUE;
	description = " I want to learn archery. " ;
};


func int DIA_Wolf_TEACH_Condition()
{
	if((Wolf_TeachBow == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TEACH_Info()
{
	AI_Output(other,self, " DIA_Wolf_TEACH_15_00 " );	// I want to learn archery.
	AI_Output(self,other, " DIA_Wolf_TEACH_08_01 " );	// What to teach you?
	Wolf_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Back()
{
	if(Wolf_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other, " DIA_Wolf_Teach_BACK_08_00 " );	// Like this. Your accuracy has increased significantly.
	};
	Info_ClearChoices(DIA_Wolf_TEACH);
};

func void DIA_Wolf_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};


instance DIA_Wolf_PERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 9;
	condition = DIA_Wolf_PERM_Condition;
	information = DIA_Wolf_PERM_Info;
	permanent = TRUE;
	description = " Well, how? Haven't found a job yet? " ;
};


func int DIA_Wolf_PERM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Wolf_WannaBuy ) && ( MIS_BengarsHelpingSLD ==  0 ) && ( Wolf_IsOnBoard !=  LOG_FAILED ) && ( CAPTAINORDERDIAWAY  ==  FALSE ) && ( WOLFRECRUITEDDT  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Wolf_PERM_Info()
{
	AI_Output(other,self, " DIA_Wolf_PERM_15_00 " );	// Well, how? Haven't found a job yet?
	AI_Output(self,other, " DIA_Wolf_PERM_08_01 " );	// Not yet. Let me know if any work comes up for me.
};


instance DIA_Wolf_Stadt (C_Info)
{
	npc = SLD_811_Wolf;
	nr = 10;
	condition = DIA_Wolf_Stadt_Condition;
	information = DIA_Wolf_Stadt_Info;
	permanent = FALSE;
	description = " Have you tried to find a job in the city? " ;
};


func int DIA_Wolf_Stadt_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Wolf_WannaBuy ) && ( MIS_BengarsHelpingSLD ==  0 ) && ( Wolf_IsOnBoard !=  LOG_FAILED ) && ( CAPTAINORDERDIAWAY  ==  FALSE ) && ( WOLFRECRUITEDDT  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Wolf_Stadt_Info()
{
	AI_Output(other,self, " DIA_Wolf_Stadt_15_00 " );	// Have you tried to find a job in the city?
	AI_Output(self,other, " DIA_Wolf_Stadt_08_01 " );	// In the city? (laughs) You can't drag me there by force.
	AI_Output(self,other, " DIA_Wolf_Stadt_08_02 " );	// Or do you think I'll work as a militia soldier? I can't even imagine myself in that stupid uniform.
	AI_Output(self,other, " DIA_Wolf_Stadt_08_03 " );	// And their obsession with obedience. No, forget about it - although there is nothing to do here on the farm, at least I can do what I want.
};


var int MIS_Wolf_BringCrawlerPlates;
var int Wolf_MakeArmor;
var int Player_GotCrawlerArmor;

instance DIA_Wolf_AboutCrawler(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = DIA_Wolf_AboutCrawler_Condition;
	information = DIA_Wolf_AboutCrawler_Info;
	permanent = FALSE;
	description = " I heard you can make armor out of crawler shells? " ;
};


func int DIA_Wolf_AboutCrawler_Condition()
{
	if(Wolf_ProduceCrawlerArmor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutCrawler_Info()
{
	AI_Output(other,self, " DIA_Wolf_AboutCrawler_15_00 " );	// I heard you can make armor out of crawler shells?
	AI_Output(self,other, " DIA_Wolf_AboutCrawler_08_01 " );	// This is true. And from whom did you hear about it?

	if(HOKURN_ARMOR == TRUE)
	{
		AI_Output(other,self, " DIA_Wolf_AboutCrawler_15_01A " );	// Barem from the hunter's camp told me about it.
	}
	else
	{
		AI_Output(other,self, " DIA_Wolf_AboutCrawler_15_02 " );	// The hunter Gestat told me.
	};

	AI_Output(other,self, " DIA_Wolf_AboutCrawler_15_03 " );	// Can you make this armor for me?
	AI_Output(self,other, " DIA_Wolf_AboutCrawler_08_04 " );	// Of course! Bring me ten crawler shells and I'll make you armor.
	AI_Output(other,self, " DIA_Wolf_AboutCrawler_15_05 " );	// How much do you want for them?
	AI_Output(self,other, " DIA_Wolf_AboutCrawler_08_06 " );	// Forget it - I'll make them for free. In memory of old times.
	MIS_Wolf_BringCrawlerPlates = LOG_Running;
	Log_CreateTopic(TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_Running);
	B_LogEntry(TOPIC_Wolf_BringCrawlerPlates, " Wolf can make me armor out of ten Crawler Shells. " );
};


instance DIA_Wolf_TeachCrawlerPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_TeachCrawlerPlates_Condition;
	information = DIA_Wolf_TeachCrawlerPlates_Info;
	permanent = TRUE;
	description = " Teach me how to remove shells from crawlers. " ;
};

func int DIA_Wolf_TeachCrawlerPlates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TeachCrawlerPlates_Info()
{
	AI_Output(other,self, " DIA_Wolf_TeachCrawlerPlates_15_00 " );	// Teach me how to remove shells from crawlers.
	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
	Info_AddChoice(DIA_Wolf_TeachCrawlerPlates,Dialog_Back,DIA_Wolf_TeachCrawlerPlates_Back);
	Info_AddChoice(DIA_Wolf_TeachCrawlerPlates,b_buildlearnstringforsmithhunt( " Removing Crawler Shells " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_CrawlerPlate)),DIA_Wolf_TeachCrawlerPlates_Chest);
};

func void DIA_Wolf_TeachCrawlerPlates_Back()
{
	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
};

func void DIA_Wolf_TeachCrawlerPlates_Chest()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other, " DIA_Wolf_TeachCrawlerPlates_08_01 " );	// It's simple. The upper part of the shell is connected to the body only at the edges. Just take it and cut it off with a sharp knife.
		AI_Output(self,other, " DIA_Wolf_TeachCrawlerPlates_08_02 " );	// Got it?
		AI_Output(other,self, " DIA_Wolf_TeachCrawlerPlates_15_03 " );	// Seems simple.
		AI_Output(self,other, " DIA_Wolf_TeachCrawlerPlates_08_04 " );	// Well, that's what I said.
	};

	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
};

instance DIA_Wolf_BringPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_BringPlates_Condition;
	information = DIA_Wolf_BringPlates_Info;
	permanent = TRUE;
	description = " I've brought armor slider shells. " ;
};

func int DIA_Wolf_BringPlates_Condition()
{
	if((MIS_Wolf_BringCrawlerPlates == LOG_Running) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Wolf_BringPlates_Info()
{
	AI_Output(other,self, " DIA_Wolf_BringPlates_15_00 " );	// I've brought armor crawler shells.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	AI_Output(self,other, " DIA_Wolf_BringPlates_08_01 " );	// Okay - give them here.
	MIS_Wolf_BringCrawlerPlates = LOG_SUCCESS;
};

var int Wolf_Armor_Day;

instance DIA_Wolf_ArmorReady(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_ArmorReady_Condition;
	information = DIA_Wolf_ArmorReady_Info;
	permanent = TRUE;
	description = " How's my armor? " ;
};

func int DIA_Wolf_ArmorReady_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (Player_GotCrawlerArmor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_ArmorReady_Info()
{
	AI_Output(other,self, " DIA_Wolf_ArmorReady_15_00 " );	// How's my armor?

	if(Npc_HasItems(self,ItAt_CrawlerPlate) >= 10)
	{
		if(Wolf_MakeArmor == FALSE)
		{
			Wolf_Armor_Day = Wld_GetDay() +  1 ;
			Wolf_MakeArmor = TRUE;
		};
		if((Wolf_MakeArmor == TRUE) && (Wolf_Armor_Day > Wld_GetDay()))
		{
			AI_Output(self,other, " DIA_Wolf_ArmorReady_08_01 " );	// They will be ready soon. Come tomorrow.
		}
		else
		{
			CreateInvItems(self,ITAR_DJG_Crawler,1);
			Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
			AI_Output(self,other, " DIA_Wolf_ArmorReady_08_02 " );	// I finished them - here you go!
			B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
			AI_Output(self,other, " DIA_Wolf_ArmorReady_08_03 " );	// It turned out well, I think.
			AI_Output(other,self, " DIA_Wolf_ArmorReady_15_04 " );	// Thank you!
			AI_Output(self,other, " DIA_Wolf_ArmorReady_08_05 " );	// Come on.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Wolf_ArmorReady_08_06 " );	// You're a joker. First I need the shells of the crawlers...
		Wolf_MakeArmor = FALSE;
		MIS_Wolf_BringCrawlerPlates = LOG_Running;
	};
};

instance DIA_Wolf_KAP3_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP3_EXIT_Condition;
	information = DIA_Wolf_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Wolf_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instances DIA_Wolf_BENGAR (C_Info)
{
	npc = SLD_811_Wolf;
	nr = 31;
	condition = DIA_Wolf_BENGAR_Condition;
	information = DIA_Wolf_BENGAR_Info;
	permanent = TRUE;
	description = " Looks like I found a job for you at Bengar's farm. " ;
};

func int DIA_Wolf_BENGAR_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Wolf_Hello) && (MY_BengarsHelpingSLD == LOG_Running) && (Chapter >=  3 ) && (Wolf_IsOnBoard !=  LOG_SUCCESS ) && ( CAPTAINNORTHERDIAWAY  ==  FALSE ) && (ConcertLoaBonus ==  TRUE )) ;
	{
		return TRUE;
	};
};


var int DIA_Wolf_BENGAR_oneTime;
var int Wolf_BENGAR_money;

func void DIA_Wolf_BENGAR_Info()
{
	if(WOLFRECRUITEDDT == FALSE)
	{
		AI_Output(other,self, " DIA_Wolf_BENGAR_15_00 " );	// Looks like I found a job for you at Bengar's farm.

		if ( DIA_Wolf_BENGAR_oneTime ==  FALSE )
		{
			AI_Output(self,other, " DIA_Wolf_BENGAR_08_01 " );	// Spread.
			AI_Output(other,self, " DIA_Wolf_BENGAR_15_02 " );	// The passage to the Valley of the Mines starts right behind Bengar's farm. He is annoyed by the beasts seeping through the Passage.
			AI_Output(other,self, " DIA_Wolf_BENGAR_15_03 " );	// We need someone to protect Bengar's farm.
			AI_Output(self,other, " DIA_Wolf_BENGAR_08_04 " );	// Well, at least something. At least I'll be far from this farm, and I won't look like an idiot at the local forge.
			DIA_Wolf_BENGAR_oneTime = TRUE;
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (RhetorikSkillValue[1] >= 25))
		{
			if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other, " DIA_Wolf_BENGAR_08_05 " );	// I agree! And since you're one of us, I won't charge much for this job. Give me three hundred gold and I'll go there at once.
				wolf_BENGAR_money = 300 ;
			}
			else if(RhetorikSkillValue[1] >= 25)
			{
				AI_Output(self,other, " DIA_Wolf_BENGAR_New_08_05 " );	// I agree! I've always liked you, boy. So just give me three hundred gold and I'll go there right away.
				wolf_BENGAR_money = 300 ;
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Wolf_BENGAR_08_06 " );	// Good! It will cost eight hundred gold.
			AI_Output(other,self, " DIA_Wolf_BENGAR_15_07 " );	// Not weak price.
			AI_Output(self,other, " DIA_Wolf_BENGAR_08_08 " );	// Yes! For one of us, I would do it practically for free. But for you...
			Wolf_BENGAR_money = 800 ;
		};

		Info_ClearChoices(DIA_Wolf_BENGAR);
		Info_AddChoice(DIA_Wolf_BENGAR, " I'll think about it. " ,DIA_Wolf_BENGAR_nochnicht);
		Info_AddChoice(DIA_Wolf_BENGAR, " Here's your gold. " ,DIA_Wolf_BENGAR_geld);
	}
	else
	{
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_Output(other,self, " DIA_Wolf_BENGAR_15_00 " );	// Looks like I found a job for you at Bengar's farm.
		AI_Output(self,other, " DIA_Wolf_BENGAR_08_01 " );	// Spread.
		AI_Output(other,self, " DIA_Wolf_BENGAR_15_02 " );	// The passage to the Valley of the Mines starts right behind Bengar's farm. He is annoyed by the beasts seeping through the Passage.
		AI_Output(other,self, " DIA_Wolf_BENGAR_15_03 " );	// We need someone to protect Bengar's farm.
		AI_Output(self,other, " DIA_Wolf_BENGAR_geld_08_01 " );	// Good! I'm going there. Let's see what the animals are.
		AI_Output(self,other, " DIA_Wolf_BENGAR_geld_08_02 " );	// See you later.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		AI_StopProcessInfos(self);
	};
};

func void DIA_Wolf_BENGAR_money()
{
	AI_Output(other,self, " DIA_Wolf_BENGAR_geld_15_00 " );	// Here's your gold.

	if(B_GiveInvItems(other,self,ItMi_Gold,Wolf_BENGAR_geld))
	{
		AI_Output(self,other, " DIA_Wolf_BENGAR_geld_08_01 " );	// Good! I'm going there. Let's see what the animals are.
		AI_Output(self,other, " DIA_Wolf_BENGAR_geld_08_02 " );	// See you later.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		B_StartOtherRoutine(SLD_815_Soeldner,"BengarsFarm");
		B_StartOtherRoutine(SLD_817_Soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other, " DIA_Wolf_BENGAR_geld_08_03 " );	// If you had money, I'd be there already.
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_not yet()
{
	AI_Output(other,self, " DIA_Wolf_BENGAR_nochnicht_15_00 " );	// I'll think about it.
	AI_Output(self,other, " DIA_Wolf_BENGAR_nochnicht_08_01 " );	// Okay, don't fool me.
	Info_ClearChoices(DIA_Wolf_BENGAR);
};


instance DIA_Wolf_PERMKAP3(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 80;
	condition = DIA_Wolf_PERMKAP3_Condition;
	information = DIA_Wolf_PERMKAP3_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Wolf_PERMKAP3_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_PERMKAP3_onetime;

func void DIA_Wolf_PERMKAP3_Info()
{
	AI_Output(other,self, " DIA_Wolf_PERMKAP3_15_00 " );	// Is everything okay?
	if ( Npc_IsDead ( Bengar ) && ( DIA_Wolf_PERMKAP3_onetime ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Wolf_PERMKAP3_08_01 " );	// My employer is dead! May he rest in peace. By the way, I always wanted to have my own farm.
		if(MIS_ORсGREATWAR == LOG_Running)
		{
			AI_Output(self,other, " DIA_Wolf_PERMKAP3_08_03 " );	// Although while the orcs are here, it is better to think about your own skin. And then you will be the same!
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Wolf_PERMKAP3_08_02 " );	// Of course! Everything is quiet.
		if(MIS_ORсGREATWAR == LOG_Running)
		{
			AI_Output(self,other, " DIA_Wolf_PERMKAP3_08_04 " );	// If you do not take into account the fact that there are orcs around!
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP4_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP4_EXIT_Condition;
	information = DIA_Wolf_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP5_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP5_EXIT_Condition;
	information = DIA_Wolf_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int wolf_SaidNo;

instance DIA_Wolf_SHIP(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_SHIP_Condition;
	information = DIA_Wolf_SHIP_Info;
	description = " Would you like to go on a boat trip with me? " ;
};


func int DIA_Wolf_SHIP_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath ==  TRUE ) && Npc_KnowsInfo(other,DIA_Wolf_Hallo) && ( CAPTAINNorthWayToIrdorath  ==  FALSE ) && (SCGotCaptain ==  TRUE ) && ( WOLFRECRUITEDDT  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIP_Info()
{
	AI_Output(other,self, " DIA_Wolf_SHIP_15_00 " );	// Wouldn't you like to go on a boat trip with me?
	if((MIS_BengarsHelpingSLD == LOG_SUCCESS) && !Npc_IsDead(Bengar))
	{
		AI_Output(self,other, " DIA_Wolf_SHIP_08_01 " );	// No. Now I don't want to. I found myself a job. Maybe next time.
		wolf_SaidNo = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Wolf_SHIP_08_02 " );	// Yes, of course. We need to get out of here. You won't regret it. I'll help you protect the ship. Where are we heading?
		MIS_BengarsHelpingSLD = LOG_OBSOLETE;
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew, " Wolf is fed up with this island and is willing to do anything to get out of here. He's a good fighter. " );
	};
};


instance DIA_Wolf_KnowWhereEnemy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_KnowWhereEnemy_Condition;
	information = DIA_Wolf_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " I'm heading to an island not far from here. " ;
};


func int DIA_Wolf_KnowWhereEnemy_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Wolf_SHIP ) && ( wolf_SaidNo ==  FALSE ) && ( MIS_SCKnowsWayToIrdorath ==  TRUE ) && ( Wolf_IsOnBoard ==  FALSE ) && ( NORTH CAPTAIN DIAWAY  ==  FALSE ) && ( WOLFRECRUITEDDT  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Wolf_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_Wolf_KnowWhereEnemy_15_00 " );	// I'm heading to an island not far from here.
	AI_Output(self,other, " DIA_Wolf_KnowWhereEnemy_08_01 " );	// And what are we waiting for then? While we're at sea, I can teach you archery and crossbow.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_Wolf_KnowWhereEnemy_15_02 " );	// I remembered that I already have enough people.
		AI_Output(self,other, " DIA_Wolf_KnowWhereEnemy_08_03 " );	// (angrily) So that's how you do it. First you call me with you, and then you give me a turn from the gate, right?
		AI_Output(self,other, " DIA_Wolf_KnowWhereEnemy_08_04 " );	// Go ahead. So that your trough sinks.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy, " I'll think about it some more. " ,DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy, " Welcome aboard! " ,DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

func void DIA_Wolf_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_Wolf_KnowWhereEnemy_Yes_15_00 " );	// Welcome aboard!
	AI_Output(other,self, " DIA_Wolf_KnowWhereEnemy_Yes_15_01 " );	// Come to the harbor. We're leaving soon.
	AI_Output(self,other, " DIA_Wolf_KnowWhereEnemy_Yes_08_02 " );	// You can assume that I'm already there.
	B_GivePlayerXP(XP_Crewmember_Success);
	Wolf_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

func void DIA_Wolf_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_Wolf_KnowWhereEnemy_No_15_00 " );	// I'll think about it some more.
	AI_Output(self,other, " DIA_Wolf_KnowWhereEnemy_No_08_01 " );	// I think you're just a talker. I don't believe a single word you say. Get out.
	Wolf_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
};


instance DIA_Wolf_LeaveMyShip(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 55;
	condition = DIA_Wolf_LeaveMyShip_Condition;
	information = DIA_Wolf_LeaveMyShip_Info;
	permanent = TRUE;
	description = " I've decided I don't need you. " ;
};


func int DIA_Wolf_LeaveMyShip_Condition()
{
	if((Wolf_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_Wolf_LeaveMyShip_15_00 " );	// I decided that I don't need you.
	AI_Output(self,other, " DIA_Wolf_LeaveMyShip_08_01 " );	// First you give me hope, and then you give me a turn from the gate. You will still regret it!
	Wolf_IsOnBoard = LOG_FAILED;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Wolf_SHIPOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 56;
	condition = DIA_Wolf_SHIPOFF_Condition;
	information = DIA_Wolf_SHIPOFF_Info;
	permanent = TRUE;
	description = " Listen. " ;
};


func int DIA_Wolf_SHIPOFF_Condition()
{
	if((Wolf_IsOnBoard == LOG_FAILED) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIPOFF_Info()
{
	AI_Output(other,self, " DIA_Wolf_SHIPOFF_15_00 " );	// Listen.
	AI_Output(self,other, " DIA_Wolf_SHIPOFF_08_01 " );	// Get lost, you bastard.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Wolf_KAP6_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP6_EXIT_Condition;
	information = DIA_Wolf_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_PICKPOCKET(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 900;
	condition = DIA_Wolf_PICKPOCKET_Condition;
	information = DIA_Wolf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wolf_PICKPOCKET_Condition()
{
	return  C_Robbery ( 32 , 35 );
};

func void DIA_Wolf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,Dialog_Back,DIA_Wolf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wolf_PICKPOCKET_DoIt);
};

func void DIA_Wolf_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

func void DIA_Wolf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};


instances DIA_WOLF_BONUSMINECRAWLERPLATES (C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = dia_wolf_bonusminecrawlerplates_condition;
	information = dia_wolf_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = " I have one question. " ;
};


func int dia_wolf_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_AboutCrawler) && (BONUSMINECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Wolf_BonusMineCrawlerPlates_01_00 " );	// I have one question.
	AI_Output(self,other, " DIA_Wolf_BonusMineCrawlerPlates_01_01 " );	// So ask him - don't delay!
	AI_Output(other,self, " DIA_Wolf_BonusMineCrawlerPlates_01_02 " );	// They say that if the hunter himself got the shells of the crawlers, then the armor made from them has some special properties. This is true?
	AI_Output(self,other, " DIA_Wolf_BonusMineCrawlerPlates_01_03 " );	// No, boy - it's all fairy tales! (laughs) Old tales of old hunters.
	AI_Output(self,other, " DIA_Wolf_BonusMineCrawlerPlates_01_04 " );	// If I were you, I wouldn't believe too much in all of this.
};


instance DIA_WOLF_ABOUTCRAWLERAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_aboutcrawleragain_condition;
	information = dia_wolf_aboutcrawleragain_info;
	permanent = FALSE;
	description = " I need another Crawler Shell Armor. " ;
};


func int dia_wolf_aboutcrawleragain_condition()
{
	if((Player_GotCrawlerArmor == TRUE) && (GIVECRAWLERARMOR == FALSE) && ((MIS_BAREMCRAWLERARMOR == LOG_Running) || (MIS_BAREMCRAWLERARMOR == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_wolf_aboutcrawleragain_info()
{
	AI_Output(other,self, " DIA_Wolf_AboutCrawlerAgain_01_00 " );	// I need another armor made of crawler shells.
	AI_Output(self,other, " DIA_Wolf_AboutCrawlerAgain_01_01 " );	// Where do you get so many, boy?!...(surprised) Okay, no problem! But you know the rules - first I need the plates of these creatures.
	AI_Output(self,other, " DIA_Wolf_AboutCrawlerAgain_01_02 " );	// After that, I'll make you another instance.
};


instance DIA_WOLF_BRINGPLATESAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = dia_wolf_bringplatesagain_condition;
	information = dia_wolf_bringplatesagain_info;
	permanent = FALSE;
	description = " I have armor crawler shells. " ;
};


func int dia_wolf_bringplatesagain_condition()
{
	if(Npc_KnowsInfo(hero,dia_wolf_aboutcrawleragain) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10) && (GIVECRAWLERPLATE == FALSE) && (GIVECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_bringplatesagain_info()
{
	AI_Output(other,self, " DIA_Wolf_BringPlates_15_00 " );	// I've brought armor crawler shells.
	AI_Output(self,other, " DIA_Wolf_BringPlates_08_01 " );	// Okay - come here.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	GIVECRAWLERPLATE = TRUE;
	WOLF_ARMOR_DAY_AGAIN = Wld_GetDay();
};


instance DIA_WOLF_ARMORREADYAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_armorreadyagain_condition;
	information = dia_wolf_armorreadyagain_info;
	permanent = TRUE;
	description = " How's my armor? " ;
};

func int dia_wolf_armorreadyagain_condition()
{
	if((GIVECRAWLERPLATE == TRUE) && (GIVECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_armorreadyagain_info()
{
	var int currentday;
	currentday = Wld_GetDay();
	AI_Output(other,self, " DIA_Wolf_ArmorReady_15_00 " );	// How's my armor?
	if(WOLF_ARMOR_DAY_AGAIN <= (currentday - 1))
	{
		Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
		AI_Output(self,other, " DIA_Wolf_ArmorReady_08_02 " );	// They are ready - here!
		B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
		AI_Output(self,other, " DIA_Wolf_ArmorReady_08_03 " );	// Turned out pretty good, I think...
		AI_Output(other,self, " DIA_Wolf_ArmorReady_15_04 " );	// Thank you!
		AI_Output(self,other, " DIA_Wolf_ArmorReady_08_05 " );	// Come on.
		GIVECRAWLERARMOR = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Wolf_ArmorReady_08_01 " );	// I'll finish them tomorrow. Then come.
	};
};


instance DIA_WOLF_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_kapitelorcattack_condition;
	information = dia_wolf_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " What are you going to do? " ;
};


func int dia_wolf_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (WOLFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_Wolf_NW_KapitelOrcAttack_01_00 " );	// What are you going to do?
	AI_Output(self,other, " DIA_Wolf_NW_KapitelOrcAttack_01_01 " );	// I want to get out of here, and as soon as possible!
	AI_Output(self,other, " DIA_Wolf_NW_KapitelOrcAttack_01_02 " );	// But here's how to do it?
	Info_ClearChoices(dia_wolf_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_wolf_nw_kapitelorcattack, " Offer teleport rune to Onar's farm. " ,dia_wolf_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_wolf_nw_kapitelorcattack, " That's understandable. " ,dia_wolf_nw_kapitelorcattack_nogiverune);
};

func void dia_wolf_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Wolf_NW_KapitelOrcAttack_Farm_01_01 " );	// Wait! I have a rune to teleport to Onar's farm with me.
	AI_Output(other,self, " DIA_Wolf_NW_KapitelOrcAttack_Farm_01_02 " );	// You can use it.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_03");	//Руна?!
	AI_Output(self,other, " DIA_Wolf_NW_KapitelOrcAttack_Farm_01_05 " );	// Okay, give it here.
	AI_Output(other,self, " DIA_Wolf_NW_KapitelOrcAttack_Farm_01_06 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other, " DIA_Wolf_NW_KapitelOrcAttack_Farm_01_07 " );	// Eh! I hope after it I won’t be sick again for a week, like after an old schnapps.
	AI_Output(self,other, " DIA_Wolf_NW_KapitelOrcAttack_Farm_01_11 " );	// Okay, I'll meet you at the farm.
	AI_Output(other,self, " DIA_Wolf_NW_KapitelOrcAttack_Farm_01_12 " );	// Of course.
	WOLFNOBATTLETHROUGTH = TRUE;
	B_LogEntry( TOPIC_HELPCREW , " I gave Wolf the rune of teleportation to Onar's farm. Now I'm calm about his fate! " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_wolf_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// Got it.
	AI_Output(self,other, " DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_02 " );	// (sigh) Although I heard that most of the guys were going to fight their way through the city.
	AI_Output(self,other, " DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_04 " );	// This may be the only chance for me to get out of here alive!
	B_LogEntry( TOPIC_HELPCREW , " Wolf will fight his way out of the captured city. I think his chances are great. " );
	WOLFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_811_WOLF_FUCKOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = dia_sld_811_wolf_fuckoff_condition;
	information = dia_sld_811_wolf_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_811_wolf_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (MIS_HUNTERSARMOR != LOG_Running) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_811_WOLF_YOURFREE(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_sld_811_wolf_yourfree_condition;
	information = dia_sld_811_wolf_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_811_wolf_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_yourfree_info()
{
	AI_Output(self,other, " DIA_SLD_811_Wolf_YourFree_01_08 " );	// What else do you need?
	AI_Output(other,self, " DIA_SLD_811_Wolf_YourFree_01_00 " );	// You are free!
	AI_Output(self,other, " DIA_SLD_811_Wolf_YourFree_01_01 " );	// Hmmm... (surprised) Have you killed all the orcs in the city?!
	AI_Output(other,self, " DIA_SLD_811_Wolf_YourFree_01_02 " );	// Yes, that's right.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other, " DIA_SLD_811_Wolf_YourFree_01_03 " );	// Well, great mate! And then we thought that we all came to an end.
		AI_Output(self,other, " DIA_SLD_811_Wolf_YourFree_01_04 " );	// Just open the bars first so we can get out of here.
	}
	else
	{
		AI_Output(self,other, " DIA_SLD_811_Wolf_YourFree_01_05 " );	// Well, great mate! And then I thought I was finished.
		AI_Output(self,other, " DIA_SLD_811_Wolf_YourFree_01_06 " );	// Just open the grate first so I can get out of here.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_811_WOLF_OPENGATENOW(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_sld_811_wolf_opengatenow_condition;
	information = dia_sld_811_wolf_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_811_wolf_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (WOLFISFREE == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_opengatenow_info()
{
	AI_Output(self,other, " DIA_SLD_811_Wolf_OpenGateNow_01_00 " );	// Come on, buddy... (pleadingly) Let me out of here!
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_NW_WOLFNOTCAPTURED(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfnotcaptured_condition;
	information = dia_wolf_nw_wolfnotcaptured_info;
	permanent = FALSE;
	description = " I have something to do with you. " ;
};


func int dia_wolf_nw_wolfnotcaptured_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFCAPTURED == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfnotcaptured_info()
{
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_01_00 " );	// I have one thing for you.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_01_01 " );	// Case?! Hmmm... (with interest) And what is it?
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_01_02 " );	// I need some more creeper shell armor.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_01_03 " );	// Okay, bring me their plates and I'll make you another one.
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_01_04 " );	// But I need more - at least ten pieces.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_01_05 " );	// (surprised) Ten?! But where are you so many?
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_01_06 " );	// Too long to explain. So will you make them for me?
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_01_07 " );	// Hmm...(thoughtfully) If you get all the necessary materials for this. But it will take me a huge amount of time to fulfill your order.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_01_09 " );	// I'm guessing at least a month, that's for sure.
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_01_10 " );	// This is too long! I need faster.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_01_11 " );	// Sorry, but I can't help you!
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_01_12 " );	// Maybe then you can teach me how to make them?
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_01_13 " );	// Teach you?! Hmmm... (thoughtfully) This secret is very expensive!
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_01_14 " );	// How much?
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_01_15 " );	// I think five thousand gold coins should be enough for me.
	B_LogEntry( TOPIC_HUNTERSARMOR , " Mercenary Wolf said that it would take him at least a month to make such a large amount of armor. Too long - and I asked him to teach me how to make this armor myself. Wolf agreed, but estimated this secret at five thousand gold. " ) ;
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
	Info_AddChoice(dia_wolf_nw_wolfnotcaptured, " I don't have that kind of money with me yet. " ,dia_wolf_nw_wolfnotcaptured_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_wolf_nw_wolfnotcaptured, " Agreed! Keep your gold. " ,dia_wolf_nw_wolfnotcaptured_heremoney);
	};
};

func void dia_wolf_nw_wolfnotcaptured_nomoney()
{
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_00 " );	// I don't have enough gold.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_01 " );	// Then come back when you have them.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_02");	//Хорошо.
	WOLFNOTTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
};

func void dia_wolf_nw_wolfnotcaptured_heremoney()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_00 " );	// Here, take this
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_01 " );	// Okay... (smiling) Then here, take this key.
	B_GiveInvItems(self,other,itke_wolfarmor, 1 );
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_02 " );	// It's from my old chest, where the exact pattern drawings for making this armor should be kept.
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_04 " );	// And where is the chest itself?
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_05 " );	// And the chest remained in the Valley of Mines! On the very spot where my hut once stood.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_06 " );	// I hope nothing happened to him.
	; _ _ _ _ _ _
	WOLFTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
};


instance DIA_WOLF_NW_WOLFNOTCAPTUREDPERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfnotcapturedperm_condition;
	information = dia_wolf_nw_wolfnotcapturedperm_info;
	permanent = TRUE;
	description = " Sell me the secret of your armor. " ;
};


func int dia_wolf_nw_wolfnotcapturedperm_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFNOTTEACHMEARMOR == TRUE) && (WOLFTEACHMEARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfnotcapturedperm_info()
{
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCapturedPerm_01_00 " );	// Sell me the secret of your armor.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCapturedPerm_01_01 " );	// Like I said, it costs five thousand gold coins. Do you have them?
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
	Info_AddChoice(dia_wolf_nw_wolfnotcapturedperm, " I don't have that kind of money with me yet. " ,dia_wolf_nw_wolfnotcapturedperm_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_wolf_nw_wolfnotcapturedperm, " Agreed! Keep your gold. " ,dia_wolf_nw_wolfnotcapturedperm_heremoney);
	};
};

func void dia_wolf_nw_wolfnotcapturedperm_nomoney()
{
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_00 " );	// I don't have enough gold.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_01 " );	// Then come back when you have them.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_02");	//Хорошо.
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
};

func void dia_wolf_nw_wolfnotcapturedperm_heremoney()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_00 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_01 " );	// Well, that's good... (smiling) Then here, take this key.
	B_GiveInvItems(self,other,itke_wolfarmor, 1 );
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_02 " );	// It's from my old chest, where the exact pattern drawings for making this armor should be kept.
	AI_Output(other,self, " DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_04 " );	// And where is the chest itself?
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_05 " );	// And the chest remained in the Valley of Mines! On the very spot where my hut once stood.
	AI_Output(self,other, " DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_06 " );	// I hope nothing happened to him.
	; _ _ _ _ _ _
	WOLFTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
};


instance DIA_WOLF_NW_WOLFCAPTURED(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfcaptured_condition;
	information = dia_wolf_nw_wolfcaptured_info;
	permanent = FALSE;
	description = " How did you get here? " ;
};


func int dia_wolf_nw_wolfcaptured_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFCAPTURED == TRUE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfcaptured_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Wolf_NW_WolfCaptured_01_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_01 " );	// The orcs took me prisoner when the guys and I broke out of the city.
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_02 " );	// The only thing I still don't understand is why didn't they kill me right away?
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_04 " );	// Well, why are you here?
	AI_Output(other,self, " DIA_Wolf_NW_WolfCaptured_01_05 " );	// I have one thing for you.
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_06 " );	// Case?! Hmmm... (with interest) And what is it?
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_07 " );	// And what is it?
	AI_Output(other,self, " DIA_Wolf_NW_WolfCaptured_01_08 " );	// I need some more creeper shell armor.
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_09 " );	// And how do you think I can make them for you?!
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_10 " );	// I don't think the orcs will let me out.
	AI_Output(other,self, " DIA_Wolf_NW_WolfCaptured_01_11 " );	// Maybe then you can teach me how to make them?
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_15 " );	// Here, take this key.
	B_GiveInvItems(self,other,itke_wolfarmor, 1 );
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_16 " );	// It's from my old chest, where the exact pattern drawings for making this armor should be kept.
	AI_Output(other,self, " DIA_Wolf_NW_WolfCaptured_01_17 " );	// And where is the chest itself?
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_18 " );	// And the chest remained in the Valley of Mines! On the very spot where my hut once stood.
	AI_Output(self,other, " DIA_Wolf_NW_WolfCaptured_01_19 " );	// I hope nothing happened to him.
	WOLFMEETINPRISON = TRUE;
	WOLFTEACHMEARMOR = TRUE;
	B_LogEntry( TOPIC_HUNTERSARMOR , " I found Wolf. The orcs captured him and kept him in the city prison. After our conversation on the topic of armor, he gave me the key to the chest, where the drawings of the patterns of the armor I needed were located. The chest itself is located in the Valley of Mines, in the same place where his hut used to be. " );
};

var int CanDoCrawlwerPlateDay;
var int Player_GotCrawlerShield;

instance DIA_Wolf_CaracustPlate(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_CaracustPlate_Condition;
	information = DIA_Wolf_CaracustPlate_Info;
	permanent = FALSE;
	description = " I have one unusual slider plate here. " ;
};

func int DIA_Wolf_CaracustPlate_Condition()
{
	if((CanDoCrawlwerPlate == TRUE) && (Npc_HasItems(other,ItAt_ZaracustPlate) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wolf_CaracustPlate_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Wolf_CaracustPlate_01_00 " );	// I have one unusual slider plate here.
	AI_Output(self,other, " DIA_Wolf_CaracustPlate_01_01 " );	// (chuckling) And why do you think it is unusual?
	AI_Output(other,self, " DIA_Wolf_CaracustPlate_01_02 " );	// Yes, take a look yourself.
	B_GiveInvItems(other,self,ItAt_ZaracustPlate,1);
	Npc_RemoveInvItems(self,ItAt_ZaracustPlate,1);

	if(Trophy_CaracustPlate == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_CaracustPlate,Npc_HasItems(other,ItUt_CaracustPlate));
		Trophy_CaracustPlate = FALSE;
	};

	AI_Output(self,other, " DIA_Wolf_CaracustPlate_01_03 " );	// Innos righteous! (stunned) How big is she!
	AI_Output(other,self, " DIA_Wolf_CaracustPlate_01_04 " );	// Well, did I surprise you?
	AI_Output(self,other, " DIA_Wolf_CaracustPlate_01_05 " );	// That's an understatement, mate! I have never seen such plates before.
	AI_Output(self,other, " DIA_Wolf_CaracustPlate_01_06 " );	// I'm even at a loss as to what size the creature that wore it was.
	AI_Output(other,self, " DIA_Wolf_CaracustPlate_01_07 " );	// Trust me, you're better off not knowing.
	AI_Output(other,self, " DIA_Wolf_CaracustPlate_01_08 " );	// But I wanted to ask you something else. Can you make something useful out of it?
	AI_Output(self,other, " DIA_Wolf_CaracustPlate_01_09 " );	// Hmmm. (thoughtfully) It's too big for armor, but it might make a pretty decent shield out of it.
	AI_Output(other,self, " DIA_Wolf_CaracustPlate_01_11 " );	// Sounds good. Can you handle it yourself?
	AI_Output(self,other, " DIA_Wolf_CaracustPlate_01_12 " );	// Of course. But you will have to tinker with in order to process the plate itself properly.
	AI_Output(other,self, " DIA_Wolf_CaracustPlate_01_13 " );	// And how long will it take you to make a shield out of it?
	AI_Output(self,other, " DIA_Wolf_CaracustPlate_01_14 " );	// If not distracted by anything, then this can take a couple of days at most.
	AI_Output(other,self, " DIA_Wolf_CaracustPlate_01_15 " );	// Okay, I'll check back later then.
	CanDoCrawlwerPlateDay = Wld_GetDay();
};

instance DIA_Wolf_CaracustPlate_Ready(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_CaracustPlate_Ready_Condition;
	information = DIA_Wolf_CaracustPlate_Ready_Info;
	permanent = TRUE;
	description = " How's my shield doing? " ;
};

func int DIA_Wolf_CaracustPlate_Ready_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_CaracustPlate) && (Player_GotCrawlerShield == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_CaracustPlate_Ready_Info()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	AI_Output(other,self, " DIA_Wolf_CaracustPlate_Ready_01_00 " );	// How's my shield doing?

	if(CanDoCrawlwerPlateDay >= (DayNow - 2))
	{
		AI_Output(self,other, " DIA_Wolf_CaracustPlate_Ready_01_01 " );	// Not ready yet! So better not distract me if you want to get it soon.
	}
	else
	{
		AI_Output(self,other, " DIA_Wolf_CaracustPlate_Ready_01_02 " );	// Yes, it's ready! Here you are.
		B_GiveInvItems(self,other,ItAr_Shield_Caracust,1);
		AI_Output(self,other, " DIA_Wolf_CaracustPlate_Ready_01_03 " );	// In my opinion - it turned out well ... (considering) But the best thing, of course, is to test it in battle!
		AI_Output(other,self, " DIA_Wolf_CaracustPlate_Ready_01_04 " );	// Well, thank you. Do I owe you anything for your work?
		AI_Output(self,other, " DIA_Wolf_CaracustPlate_Ready_01_05 " );	// No - I won't charge you for this.
		AI_Output(self,other, " DIA_Wolf_CaracustPlate_Ready_01_06 " );	// Enough that I had a good time making it for you.
		Player_GotCrawlerShield = TRUE;
	};
};

instance DIA_WOLF_NW_RECRDT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 23;
	condition = dia_wolf_nw_recrdt_condition;
	information = dia_wolf_nw_recrdt_info;
	permanent = FALSE;
	description = " I remember you were looking for a job. " ;
};

func int dia_wolf_nw_recrdt_condition()
{
	if (( HURRAYICANHIRE ==  TRUE  ) && Npc_KnowsInfo ( other, DIA_Wolf_WannaBuy ) && ( MIS_BengarsHelpingSLD ! =  LOG_SUCCESS ) &&  ! 
	{
		return TRUE;
	};
};

func void dia_wolf_nw_recrdt_info()
{
	AI_Output(other,self, " DIA_WOLF_NW_RecrDT_15_00 " );	// I remember you were looking for a job.
	AI_Output(other,self, " DIA_WOLF_NW_RecrDT_15_01 " );	// Would an employer like me suit you?
	AI_Output(self,other, " DIA_WOLF_NW_RecrDT_01_02 " );	// Everyone pays the same gold, it's just a matter of the amount, so it doesn't matter to me who I work for. But at least I know you. Does this have anything to do with you moving in next door to us?
	AI_Output(other,self, " DIA_WOLF_NW_RecrDT_15_03 " );	// Directly. I need guards for the tower while I'm away. Well, what do you say?
	AI_Output(self,other, " DIA_WOLF_NW_RecrDT_01_04 " );	// Good. I agree. But I need payment in advance for a couple of months.
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_01_05");	//Сколько?
	AI_Output(self,other, " DIA_WOLF_NW_RecrDT_15_06 " );	// Two thousand gold coins!
};

instance DIA_WOLF_NW_RECRDTFINALLY(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 23;
	condition = dia_wolf_nw_recrdtfinally_condition;
	information = dia_wolf_nw_recrdtfinally_info;
	permanent = FALSE;
	description = " Here's your money! " ;
};

func int dia_wolf_nw_recrdtfinally_condition()
{
	if (( HURRAYICANHIRE  ==  TRUE ) && Npc_KnowsInfo ( other, dia_wolf_nw_recrdt ) && ( MY_BengarsHelpingSLD ! =  LOG_SUCCESS ) &&  ! 
	{
		return TRUE;
	};
};

func void dia_wolf_nw_recrdtfinally_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_WOLF_NW_RecrDTFinally_15_00 " );	// Here's your money! Now get up and go to work!
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_WOLF_NW_RecrDTFinally_01_01 " );	// Oh, turned on the boss! I like! Yes, yes, boss, I'm already running!
	AI_Output(self,other, " DIA_WOLF_NW_RecrDTFinally_01_02 " );	// Oh, and by the way... do you mind if I bring a few more fighters to guard your camp?
	AI_Output(other,self, " DIA_WOLF_NW_RecrDTFinally_01_03 " );	// Of course not. Extra security never hurts. If only she won't cost me like a few other Wolfs, and if she will help you in your work, and not in drinking.
	AI_Output(other,self, " DIA_WOLF_NW_RecrDTFinally_01_04 " );	// Oh yeah, the password to enter the camp is 'Dragon Hoard'. Don't forget her!
	AI_Output(self,other, " DIA_WOLF_NW_RecrDTFinally_01_05 " );	// Oh, you won't forget such an original password if you wish. See you at camp!
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " I hired Wolf to guard the tower. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	WOLFRECRUITEDDT = TRUE;
	WolfDayHire = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
	Wld_InsertNpc(SLD_8111_Soeldner,"NW_CASTLEMINE_TOWER_NAVIGATION");
	Wld_InsertNpc(SLD_8112_Soeldner,"NW_CASTLEMINE_TOWER_NAVIGATION2");
};

instance DIA_Wolf_Bonus(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_Bonus_Condition;
	information = DIA_Wolf_Bonus_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Wolf_Bonus_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,10,7,54) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Bonus_Info()
{
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_BOW,1);
	AI_Output(self,other, " ORG_855_Wolf_TRAIN_Info_09_02 " );	// Shooting accuracy depends on your dexterity. The higher the dexterity, the more accurately the arrows fly to the target.
	AI_Output(self,other, " ORG_855_Wolf_TRAIN_Info_09_03 " );	// Well, your skill determines the distance from which you can hit the target. To become a good archer, you must develop both.
	AI_StopProcessInfos(self);
};
