

instance DIA_Gestath_EXIT(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 999;
	condition = DIA_Gestath_EXIT_Condition;
	information = DIA_Gestath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gestath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_EXIT_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);

	if(Hlp_IsItem(heroArmor,ITAR_DJG_Crawler) == TRUE)
	{
		AI_Output(self,other, " DIA_Gestath_EXIT_09_00 " );	// (dryly) Good armor!
	};
	AI_StopProcessInfos(self);
};

var int GestatCanBecameHunt;

instance DIA_Gestath_HALLO(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_HALLO_Condition;
	information = DIA_Gestath_HALLO_Info;
	description = " How are you? " ;
};


func int DIA_Gestath_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info()
{
	AI_Output(other,self, " DIA_Gestath_HALLO_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Gestath_HALLO_09_01 " );	// (dryly) It's a courageous act to come here. Aren't you lost, are you?
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices(DIA_Gestath_HALLO);
	Info_AddChoice(DIA_Gestath_HALLO, " What's interesting here? " ,DIA_Gestath_HALLO_waszusehen);
	Info_AddChoice(DIA_Gestath_HALLO, " What are you doing here? " ,DIA_Gestath_HALLO_was);
};

func void DIA_Gestath_HALLO_plate()
{
	AI_Output(other,self, " DIA_Gestath_HALLO_plate_15_00 " );	// You have good armor.
	AI_Output(self,other, " DIA_Gestath_HALLO_plate_09_01 " );	// Yes. These are not easy to find. They are from the shells of crawlers. A guy named Wolf made them for me.
	AI_Output(self,other, " DIA_Gestath_HALLO_plate_09_02 " );	// I was a convict here in the colony. I gave him a couple of crawler shells, and a couple of days later the armor was ready. This guy is a master.
	Wolf_ProduceCrawlerArmor = TRUE;
	Info_AddChoice(DIA_Gestath_HALLO,Dialog_Back,DIA_Gestath_HALLO_Back);
	Info_AddChoice(DIA_Gestath_HALLO, " Where is Wolf now? " ,DIA_Gestath_HALLO_plate_woWolf);
};

func void DIA_Gestath_HALLO_plate_woWolf()
{
	AI_Output(other,self, " DIA_Gestath_HALLO_plate_woWolf_15_00 " );	// Where is Wolf now?
	AI_Output(self,other, " DIA_Gestath_HALLO_plate_woWolf_09_01 " );	// I haven't seen him in a long time. He used to be a mercenary here in the colony.
	AI_Output(self,other, " DIA_Gestath_HALLO_plate_woWolf_09_02 " );	// I think he's still with his guys.
};

func void DIA_Gestath_HALLO_was()
{
	AI_Output(other,self, " DIA_Gestath_HALLO_was_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Gestath_HALLO_was_09_01 " );	// Making money.
	AI_Output(other,self, " DIA_Gestath_HALLO_was_15_02 " );	// Here, where there is nothing?
	AI_Output(self,other, " DIA_Gestath_HALLO_was_09_03 " );	// I'm a hunter! I specialize in complex cases.
	AI_Output(self,other, " DIA_Gestath_HALLO_was_09_04 " );	// Fire lizards, crawlers, dragon snappers... Others don't hunt such beasts. It brings in good money.
	GestatCanBecameHunt = TRUE;
	Info_AddChoice(DIA_Gestath_HALLO, " Your armor is good. " ,DIA_Gestath_HALLO_plate);
};

func void DIA_Gestath_HELLO_whattosee()
{
	AI_Output(other,self, " DIA_Gestath_HALLO_waszusehen_15_00 " );	// What's interesting here?
	AI_Output(self,other, " DIA_Gestath_HALLO_waszusehen_09_01 " );	// Tons of fire lizards, orcs, and I don't know what else. I didn't go upstairs.
	AI_Output(self,other, " DIA_Gestath_HALLO_waszusehen_09_02 " );	// And I would not advise you. The creatures that live there are not particularly friendly.
};

func void DIA_Gestath_HALLO_Back()
{
	Info_ClearChoices(DIA_Gestath_HALLO);
};

instance DIA_Gestath_Drachen (C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_Drachen_Condition;
	information = DIA_Gestath_Drachen_Info;
	permanent = TRUE;
	description = " Can you disembowel dragons? " ;
};

var int Gestath_DragonTrophy;

func int DIA_Gestath_Drachen_Condition()
{
	if((Gestath_DragonTrophy == FALSE) && (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_Drachen_Info()
{
	AI_Output(other,self, " DIA_Gestath_Drachen_15_00 " );	// Can you gut dragons?
	AI_Output(self,other, " DIA_Gestath_Drachen_09_02 " );	// Of course. Why not?
	Gestath_DragonTrophy = TRUE;
};

instance DIA_Gestath_TEACHHUNTING(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 12;
	condition = DIA_Gestath_TEACHHUNTING_Condition;
	information = DIA_Gestath_TEACHHUNTING_Info;
	permanent = TRUE;
	description = " Teach me how to gut animals. " ;
};

func int DIA_Gestath_TEACHHUNTING_Condition()
{
	if((Gestath_TeachAnimalTrophy == TRUE) && (GestatFinishTeach == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Gestath_TEACHHUNTING_OneTime;

func void DIA_Gestath_TEACHHUNTING_Info()
{
	AI_Output(other,self, " DIA_Gestath_TEACHHUNTING_15_00 " );	// Teach me how to gut animals.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		if(DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_09_01 " );	// Why not? I have some free time.
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_09_02 " );	// What do you want to know?
		};
		Info_AddChoice(DIA_Gestath_TEACHHUNTING,Dialog_Back,DIA_Gestath_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать огненный язык",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Gestath_TEACHHUNTING_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление панцирей ползунов",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Gestath_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление мандибул",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Gestath_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отламывать рог драконьего снеппера",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
		};
		if(Gestath_DragonTrophy == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Снять чешую дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Gestath_TEACHHUNTING_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Слить кровь дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Gestath_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_09_03 " );	// Right now, I don't even know what else I can teach you.
		GestatFinishTeach = TRUE;
	};
};

func void DIA_Gestath_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_FireTongue_09_00 " );	// The tongue of the fire lizard must be cut out with one precise movement of the knife, while holding it with the other hand.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00 " );	// To remove the shell from the slider, you need a good strong knife.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_Mandibles_09_00 " );	// Mandibles sit deep in the skulls of field predators and crawlers. It takes some effort to pull them out.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00 " );	// It's best to separate the dragon snapper's horn from the skull with a thick knife.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_DragonScale_09_00 " );	// Dragon scales are very hard to remove. But when you already think that nothing will work out for you, once - and it nevertheless separates.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_DragonBlood_09_00 " );	// It is best to take blood from the belly. Find a weak spot and plunge a sharp knife into it.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};


instance DIA_Gestath_PICKPOCKET(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 900;
	condition = DIA_Gestath_PICKPOCKET_Condition;
	information = DIA_Gestath_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gestath_PICKPOCKET_Condition()
{
	return  C_Robbery ( 81 , 350 );
};

func void DIA_Gestath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,Dialog_Back,DIA_Gestath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gestath_PICKPOCKET_DoIt);
};

func void DIA_Gestath_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

func void DIA_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

instance DIA_GESTATH_BONUSMINECRAWLERPLATES(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = dia_gestath_bonusminecrawlerplates_condition;
	information = dia_gestath_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = " I have one question. " ;
};

func int dia_gestath_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,dia_hun_744_barem_crawlerarmor) && (BONUSMINECRAWLERARMOR == FALSE) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Gestath_BonusMineCrawlerPlates_01_95 " );	// I have one question.
	AI_Output(other,self, " DIA_Gestath_BonusMineCrawlerPlates_01_02 " );	// They say that if the hunter himself obtained the shells of crawlers, then the armor made from them is much better and stronger than usual?
	AI_Output(self,other, " DIA_Gestath_BonusMineCrawlerPlates_01_03 " );	// Yes, it's true! Armor becomes stronger and lighter.
	AI_Output(self,other, " DIA_Gestath_BonusMineCrawlerPlates_01_04 " );	// I don't know exactly why...(thoughtfully) But the main thing is to believe in it!
	BONUSMINECRAWLERARMOR = TRUE;
};

instance DIA_GESTATH_HUNTCAMP(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = dia_gestath_HUNTCAMP_condition;
	information = dia_gestath_HUNTCAMP_info;
	permanent = FALSE;
	description = " This is getting pretty dangerous. " ;
};

func int dia_gestath_HUNTCAMP_condition()
{
	if((MIS_NewHunters == LOG_Running) && (GestatCanBecameHunt == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_HUNTCAMP_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_01 " );	// This is getting pretty dangerous. Don't you find?
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_02 " );	// (dryly) So what?
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_03 " );	// Aren't you afraid of being caught by orcs?
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_04 " );	// Orcs? Hmmm... (thoughtfully) I somehow didn't think about that.
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_05 " );	// Interesting! The whole Valley is just teeming with them, but it doesn’t scare you at all?
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_06 " );	// Well, how to say. (calmly) I can handle one, of course, but these creatures are rarely seen alone.
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_07 " );	// You know, to be honest, I've already thought about going back to Khorinis.
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_08 " );	// Just what to do with empty pockets?
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_09 " );	// I'm sure this won't be a problem for someone like you.
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_10 " );	// What do you mean?
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_11 " );	// There is a hunter's camp in Khorinis. You could join them.
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_12 " );	// And then you will no longer have to puzzle over how to make money.
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_13 " );	// Did they suddenly need new people?
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_14 " );	// I'm sure there's definitely a place for you there.
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_15 " );	// Falk would gladly welcome an experienced hunter like you into his camp.
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_16 " );	// Well, if so... Then it's worth a try.
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_17 " );	// After all, I have nothing to lose.
	AI_Output(other,self, " DIA_Gestath_HUNTCAMP_01_18 " );	// Then I'll see you at the camp, on the other side of the pass.
	AI_Output(self,other, " DIA_Gestath_HUNTCAMP_01_19 " );	// Of course! Good luck...
	GestatBecameHunt = TRUE;
	B_LogEntry(TOPIC_NewHunters, " Hunter Gestat will join the hunter camp. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

instance DIA_GESTATH_HARPIE(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 1;
	condition = dia_gestath_harpy_condition;
	information = dia_gestath_harpie_info;
	permanent = FALSE;
	description = " Why are you standing right here? " ;
};

func int dia_gestath_harpie_condition()
{
	if ((Capital >=  3 ) && ( MIS_RUKVAIA  ==  FALSE ) && Npc_KnowsInfo(hero,DIA_Gestah_HELLO))
	{
		return TRUE;
	};
};

func void dia_gestath_harpie_info()
{
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_01 " );	// Why are you standing here?
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_02 " );	// If the orcs are smart enough to climb the cliff, they'll make a chop out of you.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_03 " );	// Yes, I know, I know. Yesterday I already saw how at least fifty of these creatures passed towards the fortress.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_04 " );	// I barely had time to put out the fire! I thought they would notice.
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_05 " );	// Then why are you still here?
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_06 " );	// I have one unfinished business left - I'm hunting for Rukvaya!
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_07 " );	// What else is this?
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_08 " );	// Rukwaia is the harpy queen here! It is much larger and stronger than usual.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_09 " );	// Rumor has it that this creature can easily tear even the obscurant with its claws!
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_10 " );	// Orcs are running around you, and you're talking about a harpy?
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_11 " );	// Yes, this is certainly dangerous. But one merchant offered me such a sum for the heart of this creature that I simply could not refuse.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_12");	//Сколько?
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_13 " );	// Sorry, but I can't tell you that.
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_14 " );	// Well, then I wish you good luck!
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_15 " );	// Wait. (hesitatingly) I recently saw Rukvaiya rip apart two elite black orcs.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_16 " );	// Creepy sight, you know! So from someone's help, I, perhaps, will not refuse.
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_17 " );	// What will I get if I help you?
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_18 " );	// First, bring me the heart of this creature! Then we'll talk about the reward.
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_19 " );	// Probably some miserable hundred gold coins. I'm right?
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_20 " );	// Boy, I'm not trying to fool you... (seriously) Bring me the heart of this beast and believe me, you won't regret it!
	CreateInvItem(other,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_21 " );	// Okay! Consider me in business. I'll go see your beauty.
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Harpie_01_22 " );	// By the way, where is her lair?
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_23 " );	// As far as I know, it's in the old fortress to the west of here.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Harpie_01_24 " );	// Just be careful! In addition to her, other monsters live there.
	Wld_InsertNpc(harpie_uniq,"FP_ROAM_DRACONIAN_184");
	MIS_RUKVAIA = LOG_Running;
	Log_CreateTopic(TOPIC_RUKVAIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_Running);
	B_LogEntry( TOPIC_RUKVAIA , " Gestat, a hunter of dangerous creatures, told me that he hunts Rukvaya! This is a rare species of harpy. I undertook to help him, and I need to rip out the heart of this creature and bring it to Gestat. It must be somewhere in the area of ​​the old fort. " );
};

instances DIA_VLK_4148_GESTATH_RUKVAIA (C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 1;
	condition = dia_vlk_4148_gestath_rukvaia_condition;
	information = dia_vlk_4148_gestath_rukvaia_info;
	permanent = FALSE;
	description = " I killed your harpy! " ;
};

func int dia_vlk_4148_gestath_rukvaia_condition()
{
	if (( MIS_RUKVAIA  == LOG_Running) && Npc_IsDead(harpie_uniq) && (Npc_HasItems(other, ITAT_GARPIISERDCE ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_vlk_4148_gestath_rukvaia_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Rukvaia_01_01 " );	// I killed your harpy!
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_01_02 " );	// (impatiently) And her heart, do you have it?
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Rukvaia_01_03 " );	// Yes. But not so fast, mate. First, let's talk about my reward.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_01_04 " );	// Yeah, you're a good guy... Okay, what reward do you prefer?
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_01_05 " );	// I can offer you fifteen hundred coins, a magic potion, or a pretty good weapon.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " I need money! " ,dia_vlk_4148_gestath_rukvaia_money);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " I'll take a magic potion. " ,dia_vlk_4148_gestath_rukvaia_zelia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " Give me your weapon. " ,dia_vlk_4148_gestath_rukvaia_weapons);
};

func void dia_vlk_4148_gestath_rukvaia_money()
{
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Rukvaia_Money_01_00 " );	// I need money.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_Money_01_01 " );	// Good. (Busily) Here, take it!
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_Money_01_02 " );	// Fifteen hundred gold pieces is quite a lot, but it was a big risk, wasn't it?
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_Money_01_03 " );	// Now give me your heart.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " Of course! Here, take it. " ,dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " I guess I'll keep it for myself. " ,dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_zelia()
{
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Rukvaia_zelia_01_00 " );	// I'll take the magic potion.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_zelia_01_01 " );	// Good. (Busily) Here, take it!
	B_GiveInvItems(self,other,itpo_perm_def,1);
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_Money_01_03 " );	// Now give me your heart.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " Of course! Here, take it. " ,dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " I guess I'll keep it for myself. " ,dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_weapons()
{
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Rukvaia_weapons_01_00 " );	// Give me your weapon.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_weapons_01_01 " );	// Good. (Busily) Here, take it! My old two-handed axe.
	B_GiveInvItems(self,other,ITMW_2H_AXE_GESTATH,1);
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_weapons_01_02 " );	// It's forged with the weight of the weapon as light as possible, but deals massive damage!
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_weapons_01_03 " );	// You have no idea how many orc skulls I smashed through them! (chuckles)
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_weapons_01_04 " );	// Well, now give me your heart.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " Of course! Here, take it. " ,dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia, " I guess I'll keep it for myself. " ,dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_serdceyes()
{
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Rukvaia_Serdceyes_01_00 " );	// Of course! Here, take it.
	B_GiveInvItems(other,self,ITAT_GARPIISERDCE,1);
	Npc_RemoveInvItems(self,ITAT_GARPIISERDCE,1);

	if(Trophy_SERDCEGARPII == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_SERDCEGARPII,Npc_HasItems(other,ItUt_SERDCEGARPII));
		Trophy_SERDCEGARPII = FALSE ;
	};

	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_Serdceyes_01_01 " );	// Great...(pretty) Nice to deal with you, mate!
	AI_StopProcessInfos(self);
	MIS_RUKVAIA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_SUCCESS);
	B_LogEntry( TOPIC_RUKVAIA , " I gave my heart to Gestat. " );
};

func void dia_vlk_4148_gestath_rukvaia_serdceno()
{
	AI_Output(other,self, " DIA_VLK_4148_Gestath_Rukvaia_Serdceno_01_00 " );	// I guess I'll keep it for myself.
	AI_Output(self,other, " DIA_VLK_4148_Gestath_Rukvaia_Serdceno_01_01 " );	// (angrily) You decided to fool me?! Hold on, I don't forgive that.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar[AIV_ATTACKREASON] = AR_KILL;
	MIS_RUKVAIA = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RUKVAIA);
};

instance DIA_GESTATH_LostPaladins ( C_Info ) ;
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = DIA_GESTATH_LostPaladins_Condition;
	information = DIA_GESTATH_LostPaladins_Info;
	permanent = FALSE;
	description = " Have you seen a band of paladins here by any chance? " ;
};

func int DIA_GESTATH_LostPaladins_Condition()
{
	if ((MY_LostPaladins == LOG_Running) && ( CHAPTER  <  4 ) && ( AlbertGroup ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_GESTATH_LostPaladins_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_GESTATH_LostPaladins_01_00 " );	// Have you seen a group of paladins here by any chance?
	AI_Output(self,other, " DIA_GESTATH_LostPaladins_01_01 " );	// Yes, a small detachment actually passed through here a couple of days ago.
	AI_Output(other,self, " DIA_GESTATH_LostPaladins_01_02 " );	// And where did they go?
	AI_Output(self,other, " DIA_GESTATH_LostPaladins_01_03 " );	// Across the bridge, towards the large orc palisade.
	AI_Output(other,self, " DIA_GESTATH_LostPaladins_01_04 " );	// Thank you.
	B_LogEntry(TOPIC_LostPaladins, " Hunter Gestat saw a small band of paladins cross the bridge and head towards the large orc palisade. " );
};

// -------------------------------------------- Gestat v Khorinise- ------------------------------------------------------ ---------------------

instance DIA_Gestath_NW_EXIT(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 999;
	condition = DIA_Gestath_NW_EXIT_Condition;
	information = DIA_Gestath_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gestath_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gestath_NW_PICKPOCKET(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 900;
	condition = DIA_Gestath_NW_PICKPOCKET_Condition;
	information = DIA_Gestath_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Gestath_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 81 , 350 );
};

func void DIA_Gestath_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_NW_PICKPOCKET,Dialog_Back,DIA_Gestath_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gestath_NW_PICKPOCKET_DoIt);
};

func void DIA_Gestath_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
};

func void DIA_Gestath_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
};

instance DIA_Gestath_NW_BONUSMINECRAWLERPLATES(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 2;
	condition = dia_Gestath_NW_bonusminecrawlerplates_condition;
	information = dia_Gestath_NW_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = " I have one question. " ;
};

func int dia_Gestath_NW_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,dia_hun_744_barem_crawlerarmor) && (BONUSMINECRAWLERARMOR == FALSE) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void dia_Gestath_NW_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Gestath_NW_BonusMineCrawlerPlates_01_95 " );	// I have one question.
	AI_Output(other,self, " DIA_Gestath_NW_BonusMineCrawlerPlates_01_02 " );	// They say that if the hunter himself obtained the shells of crawlers, then the armor made from them is much better and stronger than usual?
	AI_Output(self,other, " DIA_Gestath_NW_BonusMineCrawlerPlates_01_03 " );	// Yes, it's true! Armor becomes stronger and lighter.
	AI_Output(self,other, " DIA_Gestath_NW_BonusMineCrawlerPlates_01_04 " );	// I don't know exactly why... (thoughtfully) But, most importantly, you have to believe in it!
	BONUSMINECRAWLERARMOR = TRUE;
};

instance DIA_Gestath_NW_Drachen (C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 3;
	condition = DIA_Gestath_NW_Drachen_Condition;
	information = DIA_Gestath_NW_Drachen_Info;
	permanent = TRUE;
	description = " Can you disembowel dragons? " ;
};

func int DIA_Gestath_NW_Drachen_Condition()
{
	if((Gestath_DragonTrophy == FALSE) && (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_NW_Drachen_Info()
{
	AI_Output(other,self, " DIA_Gestath_Drachen_15_00 " );	// Can you gut dragons?
	AI_Output(self,other, " DIA_Gestath_Drachen_09_02 " );	// Of course. Why not?
	Gestath_DragonTrophy = TRUE;
};

instance DIA_Gestath_NW_TEACHHUNTING(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 12;
	condition = DIA_Gestath_NW_TEACHHUNTING_Condition;
	information = DIA_Gestath_NW_TEACHHUNTING_Info;
	permanent = TRUE;
	description = " Teach me how to gut animals. " ;
};

func int DIA_Gestath_NW_TEACHHUNTING_Condition()
{
	if((Gestath_TeachAnimalTrophy == TRUE) && (GestatFinishTeach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_NW_TEACHHUNTING_Info()
{
	AI_Output(other,self, " DIA_Gestath_TEACHHUNTING_15_00 " );	// Teach me how to gut animals.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		if(DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_09_01 " );	// Why not? I have some free time.
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_09_02 " );	// What do you want to know?
		};

		Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,Dialog_Back,DIA_Gestath_NW_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать огненный язык",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Gestath_NW_TEACHHUNTING_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление панцирей ползунов",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Gestath_NW_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление мандибул",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Gestath_NW_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отламывать рог драконьего снеппера",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gestath_NW_TEACHHUNTING_DrgSnapperHorn);
		};
		if(Gestath_DragonTrophy == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Снять чешую дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Gestath_NW_TEACHHUNTING_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Слить кровь дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Gestath_NW_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_09_03 " );	// Right now, I don't even know what else I can teach you.
		GestatFinishTeach = TRUE;
	};
};

func void DIA_Gestath_NW_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_FireTongue_09_00 " );	// The tongue of the fire lizard must be cut out with one precise movement of the knife, while holding it with the other hand.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00 " );	// To remove the shell from the slider, you need a good strong knife.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_Mandibles_09_00 " );	// Mandibles sit deep in the skulls of field predators and crawlers. It takes some effort to pull them out.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00 " );	// It's best to separate the dragon snapper's horn from the skull with a thick knife.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_DragonScale_09_00 " );	// Dragon scales are very hard to remove. But when you already think that nothing will work out for you, once - and it nevertheless separates.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other, " DIA_Gestath_TEACHHUNTING_DragonBlood_09_00 " );	// It is best to take blood from the belly. Find a weak spot and plunge a sharp knife into it.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

instances DIA_VLK_4149_GESTATH_RUKVAIA (C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 1;
	condition = DIA_VLK_4149_GESTATH_RUKVAIA_condition;
	information = DIA_VLK_4149_GESTATH_RUKVAIA_info;
	permanent = FALSE;
	description = " I killed your harpy! " ;
};

func int DIA_VLK_4149_GESTATH_RUKVAIA_condition()
{
	if (( MIS_RUKVAIA  == LOG_Running) && Npc_IsDead(harpie_uniq) && (Npc_HasItems(other, ITAT_GARPIISERDCE ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_VLK_4149_GESTATH_RUKVAIA_01_01 " );	// I killed your harpy!
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_01_02 " );	// (impatiently) And her heart, do you have it?
	AI_Output(other,self, " DIA_VLK_4149_GESTATH_RUKVAIA_01_03 " );	// Yes! But not so fast, mate. First, let's talk about my reward!
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_01_04 " );	// Yeah, you're a good guy... Okay, what reward do you prefer?
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_01_05 " );	// I can offer you fifteen hundred coins, a magic potion, or a pretty good weapon.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " I need money! " ,DIA_VLK_4149_GESTATH_RUKVAIA_money);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " I'll take a magic potion. " ,DIA_VLK_4149_GESTATH_RUKVAIA_zelia);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " Give me your weapon. " ,DIA_VLK_4149_GESTATH_RUKVAIA_weapons);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_money()
{
	AI_Output(other,self, " DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_00 " );	// I need money!
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_01 " );	// Good. (Busily) Here, take it!
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_02 " );	// Fifteen hundred gold pieces is quite a lot, but it was a big risk, wasn't it?
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_03 " );	// Now give me your heart.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " Of course! Here, take it. " ,DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " I guess I'll keep it for myself. " ,DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_zelia()
{
	AI_Output(other,self, " DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_00 " );	// I'll take the magic potion.
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_01 " );	// Good. (Busily) Here, take it!
	B_GiveInvItems(self,other,itpo_perm_def,1);
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_02 " );	// Now give me your heart.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " Of course! Here, take it. " ,DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " I guess I'll keep it for myself. " ,DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_weapons()
{
	AI_Output(other,self, " DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_00 " );	// Give me your weapon.
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_01 " );	// Good. (Busily) Here, take it! My old two-handed axe.
	B_GiveInvItems(self,other,ITMW_2H_AXE_GESTATH,1);
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_02 " );	// It's forged with the weight of the weapon as light as possible, but deals massive damage!
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_03 " );	// You have no idea how many orc skulls I smashed through them! (chuckles)
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_04 " );	// Well, now give me your heart.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " Of course! Here, take it. " ,DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice( DIA_VLK_4149_GESTATH_RUKVAIA , " I guess I'll keep it for myself. " ,DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes()
{
	AI_Output(other,self, " DIA_VLK_4149_GESTATH_RUKVAIA_Serdceyes_01_00 " );	// Of course! Here, take it.
	B_GiveInvItems(other,self,ITAT_GARPIISERDCE,1);
	Npc_RemoveInvItems(self,ITAT_GARPIISERDCE,1);

	if(Trophy_SERDCEGARPII == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_SERDCEGARPII,Npc_HasItems(other,ItUt_SERDCEGARPII));
		Trophy_SERDCEGARPII = FALSE ;
	};

	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_Serdceyes_01_01 " );	// Great...(pretty) Nice to deal with you, mate!
	AI_StopProcessInfos(self);
	MIS_RUKVAIA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_SUCCESS);
	B_LogEntry( TOPIC_RUKVAIA , " I gave my heart to Gestat. " );
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_serdceno()
{
	AI_Output(other,self, " DIA_VLK_4149_GESTATH_RUKVAIA_Serdceno_01_00 " );	// I guess I'll keep it for myself.
	AI_Output(self,other, " DIA_VLK_4149_GESTATH_RUKVAIA_Serdceno_01_01 " );	// (angrily) You decided to fool me?! Hold on, I don't forgive that.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar[AIV_ATTACKREASON] = AR_KILL;
	MIS_RUKVAIA = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RUKVAIA);
};
