
instance DIA_Addon_Nefarious_ADW_EXIT (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 999;
	condition = DIA_Addon_Nefarious_ADW_EXIT_Condition;
	information = DIA_Addon_Nefarious_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarious_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarious_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarious_ADWHello (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarious_ADWHello_Condition;
	information = DIA_Addon_Nefarious_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarious_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarious_ADWHello_Info()
{
	AI_Output(self,other, " DIA_Addon_Nefarius_ADWHello_05_00 " );	// I'm glad you showed up here safe and sound.
	AI_Output(other,self, " DIA_Addon_Nefarius_ADWHello_15_01 " );	// How come you got here before me?
	AI_Output(self,other, " DIA_Addon_Nefarius_ADWHello_05_02 " );	// We traveled through mysterious dimensions. Who knows which way you got...
	AI_Output(other,self, " DIA_Addon_Nefarius_ADWHello_15_03 " );	// Is it safe to use the portal?
	AI_Output(self,other, " DIA_Addon_Nefarius_ADWHello_05_04 " );	// We got here right away. Apparently the portal is working properly.
	AI_Output(self,other, " DIA_Addon_Nefarius_ADWHello_05_05 " );	// Of course! If anything goes wrong, I'll be sure to let you know.
};


instance DIA_Addon_Nefarius_News (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarious_Neues_Condition;
	information = DIA_Addon_Nefarius_News_Info;
	description = " What are you doing here? " ;
};

func int DIA_Addon_Nefarious_Neues_Condition()
{
	if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarious_News_Info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_Neues_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_05_01 " );	// I'm studying the history of the Builders and trying to figure out why they closed the portal.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_05_02 " );	// Looks like they wanted to hide the sunken city from the rest of the world.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_05_03 " );	// Something terrible happened here in the past. They were possessed by some evil force.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_05_04 " );	// If the records are to be believed, a violent civil war broke out, soon followed by the destruction of the city.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_05_05 " );	// The waters of the flood, which brought death to the Architects, fell upon the streets enveloped in flames.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_05_06 " );	// The few who survived this hell decided to hide this part of the island to prevent chaos from spreading.
	Info_ClearChoices(DIA_Addon_Nefarious_News);
	Info_AddChoice(DIA_Addon_Nefarius_Neues, " What do you think we'll find here? " ,DIA_Addon_Nefarius_Neues_find);
	Info_AddChoice(DIA_Addon_Nefarius_Neues, " And we fools reopened the portal... " ,DIA_Addon_Nefarius_Neues_auf);
	Info_AddChoice(DIA_Addon_Nefarius_Neues, " Но в чем провинились Зодчие? " ,DIA_Addon_Nefarius_Neues_was);
	Info_AddChoice(DIA_Addon_Nefarius_Neues, " Did you say there was a flood here? " ,DIA_Addon_Nefarius_Neues_flut);
};

func void DIA_Addon_Nefarious_News_find()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_Neues_find_15_00 " );	// What do you think we'll find here?
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_find_05_01 " );	// So far I have only vague guesses. You must speak to Saturas.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_find_05_02 " );	// He has some definite thoughts about this.
	Log_CreateTopic(TOPIC_Addon_Flut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut,LOG_Running);
	B_LogEntry(TOPIC_Addon_Flut, " Nefarius said I should talk to Saturas about the sunken city. " );
	NefariusADW_Talk2Saturas = TRUE;
};

func void DIA_Addon_Nefarious_News_flut()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_Neues_flut_15_00 " );	// You said there was a flood here?
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_flut_05_01 " );	// Adanos himself appeared as the Builder to stop the madness.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_flut_05_02 " );	// He razed the city to the ground.
};

func void DIA_Addon_Nefarious_Neues_was()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_Neues_was_15_00 " );	// But what did the Architects do wrong?
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_was_05_01 " );	// One of them dedicated himself to evil. It was a great commander named Quarhodron.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_was_05_02 " );	// It was he who opened the way to the city for evil.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_was_05_03 " );	// His followers went crazy and started fighting with ordinary people.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_was_05_04 " );	// The ensuing disasters caused the death of civilization.
};

func void DIA_Addon_Nefarius_Neues_auf()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_Neues_auf_15_00 " );	// And we fools reopened the portal...
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_auf_05_01 " );	// Believe me, I'm not happy about this either.
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_auf_05_02 " );	// But did we have a choice?
	AI_Output(self,other, " DIA_Addon_Nefarius_Neues_auf_05_03 " );	// If we do not stop what is happening here now, all of Khorinis will suffer the fate of this ancient city.
};

instance DIA_Addon_Nefarious_AncientRune (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_AncientRune_Condition;
	information = DIA_Addon_Nefarious_AncientRune_Info;
	description = " Are you looking for something special here? " ;
};

func int DIA_Addon_Nefarious_AncientRune_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarious_AncientRune_Info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_01_00 " );	// Are you looking for something special here?
	AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_01_01 " );	// I'm trying to figure out if the Builders used rune magic.
	AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_01_02 " );	// The fact that they were familiar with the very concept of magic, I have no doubt.
	AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_01_03 " );	// There are many temples in the valley, where you can certainly find the answer to this question.
	AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_01_04 " );	// But, unfortunately, my other research does not leave me time to search.
	AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_01_05 " );	// If I find anything, I'll be sure to let you know.
	AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_01_06 " );	// I really hope so. Such knowledge will help us to study their culture even deeper.
	MIS_AncientRune = LOG_Running;
	Log_CreateTopic(TOPIC_AncientRune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AncientRune,LOG_Running);
	B_LogEntry(TOPIC_AncientRune, " Nefarius is looking for evidence that the Builders used rune magic. He advised me to look for the answer in the temples located in this valley. " );
};

instance DIA_Addon_Nefarious_AncientRune_Done (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarious_AncientRune_Done_Condition;
	information = DIA_Addon_Nefarius_AncientRune_Done_Info;
	description = " I have something for you. " ;
};

func int DIA_Addon_Nefarious_AncientRune_Done_Condition()
{
	if((MIS_AncientRune == LOG_Running) && ((Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1) || (Npc_HasItems(hero,ItRu_SummonGuardian) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarious_AncientRune_Done_Info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_00 " );	// I have something for you.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_01");	//Хммм... Правда?
	
	if(Npc_HasItems(hero,ItRu_SummonGuardian) >= 1)
	{
		B_GivePlayerXP(300);
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_02 " );	// You seem to be looking for evidence that the Builders used rune magic.
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_03 " );	// I found one of these runes!
		B_GiveInvItems(other,self,ItRu_SummonGuardian,1);
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_04 " );	// (surprised) Incredible! Where did you find her?
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_05 " );	// In the temple of Adanos. Apparently, it was used to call the stone guards.
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_06 " );	// (looking) Hmmm. Most likely.
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_07 " );	// And it seems that its use is no different from the runes we use.
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_08 " );	// Will you keep it for yourself to study?
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_09 " );	// I'd like to do this, but I think you'll still need it yourself.
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_10 " );	// So take it back and give it back to me if you have a chance.
		B_GiveInvItems(self,other,ItRu_SummonGuardian,1);
		AI_Output(other,self, " DIA_Addon_Nefarious_AncientRune_Done_01_11 " );	// What will you say?
		MIS_AncientRune = LOG_Success;
		Log_SetTopicStatus(TOPIC_AncientRune,LOG_Success);
		B_LogEntry(TOPIC_AncientRune, " I showed Nefarious the Builders rune. He was extremely pleased with this find. " );
	}
	else if(Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_12 " );	// You seem to be looking for evidence that the Builders used rune magic.
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_13 " );	// Well, I have one of these with me.
		B_GiveInvItems(other,self,ItMi_AncientRuneStone,1);
		Npc_RemoveInvItems(self,ItMi_AncientRuneStone,1);
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_14 " );	// (surprised) Incredible! Where did you find her?
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_15 " );	// In the temple of Adanos. Apparently, it was used to call the stone guards.
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_16 " );	// Hmmm. (looking) Most likely. However, I don't feel any magic in it now.
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_17 " );	// I had to use this rune's magic for my own purposes.
		AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Done_01_18 " );	// But you can be sure she was there!
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_19 " );	// Okay. At least it's better than nothing.
		AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Done_01_20 " );	// Thank you.
		NoRuneMagic = TRUE;
		MIS_AncientRune = LOG_Success;
		Log_SetTopicStatus(TOPIC_AncientRune,LOG_Success);
		B_LogEntry(TOPIC_AncientRune, " I gave Nefarious the Builder's runestone with no magic. " );
	};
};

instance DIA_Addon_Nefarious_AncientRune_Ext (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_AncientRune_Ext_Condition;
	information = DIA_Addon_Nefarious_AncientRune_Ext_Info;
	description = " I still have the Builder Runestone. " ;
};

func int DIA_Addon_Nefarious_AncientRune_Ext_Condition()
{
	if((MIS_AncientRune == LOG_Success) && (NoRuneMagic == FALSE) && (Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarious_AncientRune_Ext_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Ext_01_00 " );	// I still have the Builders runestone.
	AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Ext_01_01 " );	// True, he is devoid of magic. Do you need it?
	AI_Output(self,other, " DIA_Addon_Nefarius_AncientRune_Ext_01_02 " );	// (thoughtfully) You can give it to me. Perhaps it will be useful for something.
	AI_Output(other,self, " DIA_Addon_Nefarius_AncientRune_Ext_01_03 " );	// Good. Here you are.
	B_GiveInvItems(other,self,ItMi_AncientRuneStone,1);
	Npc_RemoveInvItems(self,ItMi_AncientRuneStone,1);
};

instance DIA_Addon_Nefarious_PermADW (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 1;
	condition = DIA_Addon_Nefarious_PermADW_Condition;
	information = DIA_Addon_Nefarious_PermADW_Info;
	important = TRUE;
};

func int DIA_Addon_Nefarious_PermADW_Condition()
{
	if(NoEligorBuy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarious_PermADW_Info()
{
	AI_Output(self,other, " DIA_Addon_Nefarius_PermADW_05_02 " );	// I heard that you are going to visit the Valley of Mines?
	AI_Output(other, self, " DIA_Addon_Nefarious_PermADW_15_03 " );	// Yes, that's right.
	AI_Output(self,other, " DIA_Addon_Nefarius_PermADW_05_04 " );	// Do us one favor - visit the Free Mine behind the pass. There's a recipe out there somewhere that might come in handy.
	AI_Output(self,other, " DIA_Addon_Nefarius_PermADW_05_05 " );	// Here, take the key.
	CreateInvItems(self,itke_freminekdw,1);
	B_GiveInvItems(self,other,itke_freminekdw,1);
	AI_Output(other,self, " DIA_Addon_Nefarius_PermADW_15_06 " );	// Okay, I'll look it up for you.
	MIS_NEFARIUS_POTIONADW = LOG_Running;
	Log_CreateTopic(TOPIC_NEFARIUS_POTIONADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEFARIUS_POTIONADW,LOG_Running);
	B_LogEntry( TOPIC_NEFARIUS_POTIONADW , " Nefarius needs a recipe from the Free Mine behind the Pass " );
};

instances DIA_ADDON_NEFARIUS1_PERMADW (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 1;
	condition = dia_addon_nefarius1_permadw_condition;
	information = dia_addon_nefarius1_permadw_info;
	description = " I found your recipe. " ;
};

func int dia_addon_nefarius1_permadw_condition()
{
	if (( MIS_NEFARIUS_POTIONADW  == LOG_Running ) && ( Npc_HasItems ( other , itwr_receiver ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dia_addon_nefarius1_permadw_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Nefarius1_PermADW_15_00 " );	// I found your recipe. True, he was not in the Free Mine.
	AI_Output(self,other, " DIA_Addon_Nefarius1_PermADW_05_01 " );	// (pretty) It's not that important. Give it here.
	B_GiveInvItems(other,self,itwr_recipes, 1 );
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Nefarius1_PermADW_05_02 " );	// Yes, great! It's him.
	Npc_RemoveInvItems(self,itwr_recipes, 1 );
	AI_Output(other,self, " DIA_Addon_Nefarius1_PermADW_15_03 " );	// What is this recipe?
	AI_Output(self,other, " DIA_Addon_Nefarius1_PermADW_05_99 " );	// Here's how to make a very powerful potion. It is called 'Ice Cover'.
	AI_Output(other,self, " DIA_Addon_Nefarius1_PermADW_05_98 " );	// And what does it do?
	AI_Output(self,other, " DIA_Addon_Nefarius1_PermADW_05_97 " );	// It can protect you from the effects of strong magic.
	AI_Output(other,self, " DIA_Addon_Nefarius1_PermADW_15_05 " );	// Sounds good. Can I use it?
	AI_Output(self,other, " DIA_Addon_Nefarius1_PermADW_05_06 " );	// You can't cook it yourself, but in gratitude for the recipe I found, I'll help you.
	AI_Output(self,other, " DIA_Addon_Nefarius1_PermADW_05_10 " );	// Bring me two fire golem hearts, three pearls, and five bottles of grog. And then I will prepare this wonderful potion for you.
	Nefarious_PERMADW = TRUE ;
	B_LogEntry( TOPIC_NEFARIUS_POTIONADW , " Nefarius can brew Ice Cover Potion. To do this, he needs: two fire golem hearts, three pearls and five bottles of grog. " );
};

DIA_ADDON_NEFARIUS2_PERMADW (C_Info) instances
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 1;
	condition = dia_addon_nefarius2_permadw_condition;
	information = dia_addon_nefarius2_permadw_info;
	permanent = FALSE;
	description = " Mix me that potion. " ;
};

func int dia_addon_nefarius2_permadw_condition()
{
	if (( MIS_NEFARIUS_POTIONADW  == LOG_Running) && ( NEFARIUS_PERMADW  ==  TRUE ) && (Npc_HasItems(other,It's_FireGolemHeart) >=  2 ) && (Npc_HasItems(other,ItMi_Addon_WhitePearl) > =  3 ) && (Npc_Has_5Items( other )) 
	{
		return TRUE;
	};
};

func void dia_addon_nefarius2_permadw_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Addon_Nefarius2_PermADW_15_00 " );	// Prepare me a potion.
	Npc_RemoveInvItems(other,ItAt_FireGolemHeart,2);
	Npc_RemoveInvItems(other,ItMi_Addon_WhitePearl,3);
	Npc_RemoveInvItems(other,ItFo_Addon_Grog,5);
	AI_Output(self,other, " DIA_Addon_Nefarius2_PermADW_15_01 " );	// Good! Wait a minute.
	AI_Output(self,other, " DIA_Addon_Nefarius2_PermADW_15_02 " );	// Here, take this. Just use it wisely, because in your hands is truly a real treasure.
	B_GiveInvItems(self,other,itpo_waterfire,1);
	MIS_NEFARIUS_POTIONADW = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_NEFARIUS_POTIONADW,LOG_SUCCESS);
	B_LogEntry( TOPIC_NEFARIUS_POTIONADW , " Nefarious has prepared a Water Shield for me. " );
};

instance DIA_Addon_Nefarious_PreTeach (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarious_PreTeach_Condition;
	information = DIA_Addon_Nefarious_PreTeach_Info;
	description = " Can you share your knowledge of magic with me? " ;
};

func int DIA_Addon_Nefarius_PreTeach_Condition()
{
	if ((hero.guild ==  GIL_KDW ) && (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) >=  1 ) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle));
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarious_PreTeach_Info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_PreTeach_15_00 " );	// Can you share your knowledge of magic with me?
	AI_Output(self,other, " DIA_Addon_Nefarius_PreTeach_05_01 " );	// I can teach you how to make magical runes, and Kronos will sell you their formulas.
	AI_Output(self,other, " DIA_Addon_Nefarius_PreTeach_05_02 " );	// He always has his rune books with him.
	Nefarious_Addon_TeachRunes = TRUE ;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_NefariusTeach);
};

instance DIA_Addon_Nefarious_ADW_Runen (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarious_ADW_Runen_Condition;
	information = DIA_Addon_Nefarious_ADW_Runen_Info;
	permanent = TRUE;
	description = " Teach me how to make runes. " ;
};

func int DIA_Addon_Nefarious_ADW_Runen_Condition()
{
	if (Nefarious_Addon_TeachRunes ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarious_ADW_Runen_Info()
{
	AI_Output(other,self, " DIA_Parlan_TEACH_15_00 " );	// Train me!
	Info_ClearChoices(DIA_Addon_Nefarious_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_ADW_Runen,Dialog_Back,DIA_Addon_Nefarious_ADW_Runen_BACK);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, " 6 Magic Circles " , DIA_Addon_Nefarius_ADW_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, " 5 Magic Circles " , DIA_Addon_Nefarius_ADW_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, " 4 Magic Circles " , DIA_Addon_Nefarius_ADW_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, " 3 Magic Circles " , DIA_Addon_Nefarius_ADW_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, " 2 Круг магии " ,DIA_Addon_Nefarius_ADW_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, " 1 Круг магии " ,DIA_Addon_Nefarius_ADW_Runen_1);
	};
};

func void DIA_Addon_Nefarious_ADW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarious_ADW_Runen);
};

func void DIA_Addon_Nefarious_ADW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarious_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_ADW_Runen,Dialog_Back,DIA_Addon_Nefarious_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Icebolt,B_GetLearnCostTalent(other, NPC_TALENT_RUNES ,SPL_Icebolt)),dia_addon_nefarius_adw_runen_circle_1_spl_icebolt);
	};
};

func void DIA_Addon_Nefarious_ADW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarious_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_ADW_Runen,Dialog_Back,DIA_Addon_Nefarious_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE);
	};
	if(PLAYER_TALENT_RUNES[98] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSHOAL,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSHOAL)),dia_addon_nefarius_adw_runen_circle_2_spl_summonshoal);
	};
	if((PLAYER_TALENT_RUNES[SPL_RapidIcebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_RapidIcebolt,B_GetLearnCostTalent(other, NPC_TALENT_RUNES ,SPL_RapidIcebolt)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_spl_RapidIcebolt);
	};
};

func void DIA_Addon_Nefarious_ADW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarious_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_ADW_Runen,Dialog_Back,DIA_Addon_Nefarious_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceCube,B_GetLearnCostTalent(other, NPC_TALENT_RUNES ,SPL_IceCube)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall);
	};
};

func void DIA_Addon_Nefarious_ADW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarious_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_ADW_Runen,Dialog_Back,DIA_Addon_Nefarious_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[89] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes( NAME_SPL_SUMMONICEGOLEM ,B_GetLearnCostTalent(other, NPC_TALENT_RUNES , SPL_SUMMONICEGOLEM )),dia_addon_nefarius_adw_runen_circle_4_spl_summonicegolem);
	};
};

func void DIA_Addon_Nefarious_ADW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarious_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_ADW_Runen,Dialog_Back,DIA_Addon_Nefarious_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),dia_addon_nefarius_adw_runen_circle_5_spl_waterfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave);
	};
};

func void DIA_Addon_Nefarious_ADW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarious_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_ADW_Runen,Dialog_Back,DIA_Addon_Nefarious_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),dia_addon_nefarius_adw_runen_circle_6_spl_geyser);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),dia_addon_nefarius_adw_runen_circle_6_spl_thunderstorm);
	};
};

func void DIA_Addon_Nefarious_ADW_Runen_Circle_2_spl_RapidIcebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidIcebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void dia_addon_nefarious_adw_runen_circle_1_spl_icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Addon_Nefarious_ADW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_summonshoal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSHOAL);
};

func void DIA_Addon_Nefarious_ADW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall();
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Addon_Nefarious_ADW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_summonicegolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONICEGOLEM);
};

func void DIA_Addon_Nefarious_ADW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};


instance DIA_ADDON_NEFARIUS_ADW_PRAYFORGOMEZ (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 1;
	condition = dia_addon_nefarius_adw_prayforgomez_condition;
	information = dia_addon_nefarius_adw_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_nefarius_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adw_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_ADW_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Nefarius_ADW_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Nefarius_ADW_PrayForGomez_01_03 " );	// I think he can help you.
	SENTTOSATURASGOMEZ = TRUE ;
};


instance DIA_ADDON_NEFARIUS_ADW_DURINGRITUAL (C_Info)
{
	npc = KDW_14020_Addon_Nefarious_ADW;
	nr = 1;
	condition = dia_addon_nefarious_adw_duringritual_condition;
	information = dia_addon_nefarius_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_nefarious_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_nefarious_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};
