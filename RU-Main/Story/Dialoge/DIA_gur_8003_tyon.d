

instance DIA_BAALTYON_EXIT(C_Info)
{
	npc = gur_8003_tyon;
	nr = 999;
	condition = dia_baaltyon_exit_condition;
	information = dia_baaltyon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baaltyon_exit_condition()
{
	return TRUE;
};

func void dia_baaltyon_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baaltyon_PICKPOCKET(C_Info)
{
	npc = gur_8003_tyon;
	nr = 900;
	condition = dia_baaltyon_PICKPOCKET_Condition;
	information = dia_baaltyon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baaltyon_PICKPOCKET_Condition()
{
	return  C_Robbery ( 49 , 35 );
};

func void dia_baaltyon_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
	Info_AddChoice(dia_baaltyon_PICKPOCKET, Dialog_Back, dia_baaltyon_PICKPOCKET_BACK);
	Info_AddChoice(dia_baaltyon_PICKPOCKET, DIALOG_PICKPOCKET ,dia_baaltyon_PICKPOCKET_DoIt);
};

func void dia_baaltyon_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
};

func void dia_baaltyon_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
};


instance DIA_BAALTYON_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_notalk_sleeper_condition;
	information = dia_baaltyon_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = " May the Sleeper be with you! " ;
};


func int dia_baaltyon_notalk_sleeper_condition()
{
	if((IDOLTYON_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_notalk_sleeper_info()
{
	AI_Output(other,self, " DIA_BaalTyon_NoTalk_Sleeper_01_00 " );	// May the Sleeper be with you!
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};

instance DIA_BAALTYON_NOTALK_IMP(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_notalk_imp_condition;
	information = dia_baaltyon_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = " Is everything all right, buddy? " ;
};

func int dia_baaltyon_notalk_imp_condition()
{
	if((IDOLTYON_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_notalk_imp_info()
{
	AI_Output(other,self, " DIA_BaalTyon_NoTalk_Imp_01_00 " );	// Are you all right, mate?
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALTYON_ABOUTRECEPT ( C_Info ) ;
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_aboutrecept_condition;
	information = dia_baaltyon_aboutrecept_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_baaltyon_aboutrecept_condition()
{
	if (( IDOLTYON_YES  ==  FALSE ) && ( PSI_TALK  ==  TRUE ) && ( CANBEGURU  ==  TRUE ) && ( other.guild ==  GIL_SEK ))
	{
		return TRUE;
	};
};

func void dia_baaltyon_aboutrecept_info()
{
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_00 " );	// Are you the newcomer who wants to join our Brotherhood?
	AI_Output(other,self, " DIA_BaalTyon_AboutRecept_01_01 " );	// Why are you talking to me?
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_02 " );	// Because I'm ready to give you my consent. But first you will have to do me one favor.
	AI_Output(other,self, " DIA_BaalTyon_AboutRecept_01_03 " );	// What can I do for you, sir?
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_04 " );	// As you may have noticed, I'm into alchemy and the preparation of magical elixirs.
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_05 " );	// And I'm interested in recipes for potions I've never heard of before.
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_06 " );	// I heard that an alchemist who lives in these parts has a recipe for an interesting potion.
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_07 " );	// Apparently, this elixir is able to influence the human mind in some way.
	AI_Output(other,self, " DIA_BaalTyon_AboutRecept_01_09 " );	// Do you want me to get it for you?
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_10 " );	// Yes! If you prove your usefulness to me, then you can be sure that you will get my vote.
	AI_Output(other,self, " DIA_BaalTyon_AboutRecept_01_11 " );	// Do you know which alchemist might have this recipe?
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_12 " );	// If I had known, I wouldn't have asked you for help.
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_13 " );	// You'll have to figure this out for yourself.
	AI_Output(self,other, " DIA_BaalTyon_AboutRecept_01_14 " );	// Come back when you have this recipe. And then we will talk about your entry into our Brotherhood.
	IDOLTYON_YES = TRUE;
	Log_CreateTopic(TOPIC_RECEPTFORTYON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RECEPTFORTYON,LOG_Running);
	B_LogEntry( TOPIC_RECEPTFORTYON , " Idol of Tion is interested in an unusual elixir. According to him, one of the alchemists on the island must have a recipe for it. " );
	MIS_RECEPTFORTYON = LOG_Running;
};


instance DIA_BAALTYON_GOTRECEPT(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_gotrecept_condition;
	information = dia_baaltyon_gotrecept_info;
	permanent = FALSE;
	important = FALSE;
	description = " I brought the recipe. " ;
};


func int dia_baaltyon_gotrecept_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (Npc_HasItems(other,itwr_tyonrecept) >= 1))
	{
		return TRUE;
	};
};

func void dia_baaltyon_gotrecept_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_BaalTyon_GotRecept_01_00 " );	// I brought the recipe you asked for.
	AI_Output(self,other, " DIA_BaalTyon_GotRecept_01_01 " );	// (impatiently) Let me see!
	if(B_GiveInvItems(other,self,itwr_tyonrecept,1))
	{
		Npc_RemoveInvItems(self,itwr_tyonrecept,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_BaalTyon_GotRecept_01_02 " );	// Yes, this is it. What a strange composition of ingredients ... (looks at)
	AI_Output(other,self, " DIA_BaalTyon_GotRecept_01_03 " );	// Sir, can I now get your consent to my joining the Brotherhood?
	AI_Output(self,other, " DIA_BaalTyon_GotRecept_01_04 " );	// (not listening) To weld it, I need very rare things...
	AI_Output(self,other, " DIA_BaalTyon_GotRecept_01_05 " );	// I'm afraid I don't even have half of what's listed here.
	AI_Output(self,other, " DIA_BaalTyon_GotRecept_01_06 " );	// I have to ask you for one more favor.
	AI_Output(other,self, " DIA_BaalTyon_GotRecept_01_07 " );	// (sighs) Okay, what should I do for you this time?
	AI_Output(self,other, " DIA_BaalTyon_GotRecept_01_08 " );	// I'll give you a list of the components I don't have.
	AI_Output(self,other, " DIA_BaalTyon_GotRecept_01_09 " );	// Get all these ingredients and bring them to me.
	AI_Output(self,other, " DIA_BaalTyon_GotRecept_01_10 " );	// Here is the list. Everything I need is written here.
	B_GiveInvItems(self,other,itwr_tyonlist,1);
	B_LogEntry( TOPIC_RECEPTFORTYON , " Idol Tion has given me another errand. Now I must get him some of the ingredients for the elixir described in the recipe. " );
};


instance DIA_BAALTYON_GIVEMEPOITION (C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_givemeposition_condition;
	information = dia_baaltyon_givemepoition_info;
	permanent = FALSE;
	important = FALSE;
	description = " What is this elixir for? " ;
};


func int dia_baaltyon_givemepoition_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && Npc_KnowsInfo(other,dia_baaltyon_gotrecept))
	{
		return TRUE;
	};
};

func void dia_baaltyon_givemeposition_info()
{
	AI_Output(other,self, " DIA_BaalTyon_GiveMeRecept_01_00 " );	// What is this elixir for?
	AI_Output(self,other, " DIA_BaalTyon_GiveMeRecept_01_01 " );	// Judging by the recipe and the composition of its ingredients, I can conclude that it is able to increase magical power many times over!
	AI_Output(self,other, " DIA_BaalTyon_GiveMeRecept_01_02 " );	// I can't say exactly how much and what consequences may occur when using it.
	AI_Output(other,self, " DIA_BaalTyon_GiveMeRecept_01_03 " );	// Can you brew this potion for me too?
	AI_Output(self,other, " DIA_BaalTyon_GiveMeRecept_01_04 " );	// Possibly. After all, I will need to test the effect of this elixir on someone.
	AI_Output(self,other, " DIA_BaalTyon_GiveMeRecept_01_05 " );	// Of course, this would be a big risk. The action of the potion can be unpredictable!
};


instance DIA_BAALTYON_GIVEINGRIDIENTS(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_giveingridients_condition;
	information = dia_baaltyon_giveingridients_info;
	permanent = FALSE;
	important = FALSE;
	description = " I've brought the ingredients for your potion. " ;
};


func int dia_baaltyon_giveingridients_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && Npc_KnowsInfo(other,dia_baaltyon_gotrecept) && (Npc_HasItems(other,itat_crawlerqueen) >= 1) && (Npc_HasItems(other,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(other,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1))
	{
		return TRUE;
	};
};

func void dia_baaltyon_giveingridients_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalTyon_GiveIngridients_01_00 " );	// I've brought the ingredients for your potion.
	AI_Output(self,other, " DIA_BaalTyon_GiveIngridients_01_01 " );	// Show them to me.
	B_GiveInvItems(other,self,itat_crawlerqueen,1);
	AI_Output(self,other, " DIA_BaalTyon_GiveIngridients_01_0A " );	// Well, well. Creeper egg - right...
	B_GiveInvItems(other,self,ItAt_StoneGolemHeart,1);
	AI_Output(self,other, " DIA_BaalTyon_GiveIngridients_01_0B " );	// ...the heart of the stone golem - here it is...
	B_GiveInvItems(other,self,ItAt_WaranFiretongue,1);
	AI_Output(self,other, " DIA_BaalTyon_GiveIngridients_01_0C " );	// ...the language of the fire lizard is...
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	AI_Output(self,other, " DIA_BaalTyon_GiveIngridients_01_0D " );	// ...and royal sorrel.
	AI_Output(self,other, " DIA_BaalTyon_GiveIngridients_01_02 " );	// This seems to be everything I asked you to bring. Excellent!
	AI_Output(other,self, " DIA_BaalTyon_GiveIngridients_01_03 " );	// I hope I can count on your approval now, master?
	AI_Output(self,other, " DIA_BaalTyon_GiveIngridients_01_04 " );	// Yes, you did a good job for the benefit of the Brotherhood! I think you certainly deserve to be one of us!
	AI_Output(self,other, " DIA_BaalTyon_GiveIngridients_01_05 " );	// Go to Idol Oran and tell him about it.
	; _ _ _ _ _ _
	MIS_RECEPTFORTYON = LOG_SUCCESS;
	TYONAGREED = TRUE;
};

instance DIA_BaalTyon_Mandibuls(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = DIA_BaalTyon_Mandibuls_condition;
	information = DIA_BaalTyon_Mandibuls_info;
	permanent = FALSE;
	description = " Are there any more errands for me? " ;
};


func int DIA_BaalTyon_Mandibuls_condition()
{
	if(MIS_RECEPTFORTYON == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_BaalTyon_Mandibuls_info()
{
	AI_Output(other,self, " DIA_BaalTyon_Mandibuls_01_00 " );	// Will there be more errands for me?
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_01_01 " );	// Yes... It's good that you asked.
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_01_02 " );	// You probably remember that at one time our Brotherhood constantly needed the mandibles of crawlers, which the guards mined in the Old Mine.
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_01_03 " );	// The secret that was in these glands, we usually used to increase the strength of the spirit of our acolytes and strengthen their consciousness.
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_01_04 " );	// But now we are deprived of this opportunity, and I need to try to find an alternative to them.
	AI_Output(other,self, " DIA_BaalTyon_Mandibuls_01_05 " );	// Couldn't you find crawlers' lairs here?
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_01_06 " );	// There are too few of them in Khorinis to conduct really serious experiments.
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_01_07 " );	// But I heard that other monsters live here, from which you can get the ingredients I need.
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_01_08 " );	// The locals seem to call them field predators. Kill some of these creatures and bring me their glands.
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_01_09 " );	// I think five pieces will be enough for the first time.
	MIS_TyonMandibuls = LOG_Running;
	Log_CreateTopic(TOPIC_TyonMandibuls,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TyonMandibuls,LOG_Running);
	B_LogEntry(TOPIC_TyonMandibuls, " Idol Tion asked me to get him five field predator mandibles. I'm sure it won't be too hard for me. " );
};

instance DIA_BaalTyon_Mandibuls_Done(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = DIA_BaalTyon_Mandibuls_Done_condition;
	information = DIA_BaalTyon_Mandibuls_Done_info;
	permanent = FALSE;
	description = " I brought the mandibles. " ;
};

func int DIA_BaalTyon_Mandibuls_Done_condition()
{
	if((MIS_TyonMandibuls == LOG_Running) && (Npc_HasItems(other,ItAt_BugMandibles) >= 5))
	{
		return TRUE;
	};
};

func void DIA_BaalTyon_Mandibuls_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_BaalTyon_Mandibuls_Done_01_00 " );	// I brought the mandibles of the field predators.
	B_GiveInvItems(other,self,ItAt_BugMandibles,5);
	Npc_RemoveInvItems(self,ItAt_BugMandibles,5);
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_Done_01_01 " );	// Well, they look perfectly fine, and the glands themselves are almost intact.
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_Done_01_02 " );	// In any case, I'll need some time to carefully examine their properties.
	AI_Output(self,other, " DIA_BaalTyon_Mandibuls_Done_01_03 " );	// You did a good job! Take a few bog stalks.
	B_GiveInvItems(self,other,ItPl_SwampHerb,5);
	MIS_TyonMandibuls = LOG_Success;
	Log_SetTopicStatus(TOPIC_TyonMandibuls,LOG_Success);
	B_LogEntry(TOPIC_TyonMandibuls, " I brought the mandibles of the field predators to Idol Tyon. " );
};

instances DIA_BAALTYON_TESTPOTIONME (C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_testpotionme_condition;
	information = dia_baaltyon_testpotionme_info;
	permanent = TRUE;
	important = FALSE;
	description = " About your elixir... " ;
};


func int dia_baaltyon_testpotionme_condition()
{
	if (( MIS_RECEPTFORTYON  ==  LOG_SUCCESS ) && ( TYONAGREED  ==  TRUE ) && Npc_KnowsInfo(other,dia_vaultyon_givemepoition) && ( TYONGIVEPOTION  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_baaltyon_testpotionme_info()
{
	where int daynow;
	daynow = Wld_GetDay();

	if(BAALTYON_STEW_DAY_ONCE == FALSE)
	{
		BAALTYON_STEW_DAY = Wld_GetDay();
		BAALTYON_STEW_DAY_ONCE = TRUE;
		AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_01_00 " );	// About your elixir...
		AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_01_01 " );	// Yes, what do you want to ask?
		AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_01_02 " );	// Can you test the effect of the elixir on me?
		AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_01_04 " );	// Okay, but I haven't started making it yet.
		AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_01_05 " );	// When will the potion be ready?
		AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_01_06 " );	// Come back tomorrow afternoon. I think I'll make it by this time.
	}
	else if(BAALTYON_STEW_DAY < daynow)
	{
		if((BAALTYON_STEW_DAY > 0) && (Wld_IsTime(12,0,23,59) || (BAALTYON_STEW_DAY < (daynow - 1))))
		{
			AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_01_07 " );	// About your elixir. Is your drink ready?
			AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_01_08 " );	// Yes, it's ready. I'll tell you - an extremely complex potion!
			AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_01_09 " );	// So now I can test it?
			AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_01_10 " );	// Are you itching to do this? (laughs)
			AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_01_11 " );	// Are you sure you really want to try it?
			Info_ClearChoices(dia_baaltyon_testpotionme);
			Info_AddChoice(dia_baaltyon_testpotionme, " Я передумал. " ,dia_baaltyon_testpotionme_no);
			Info_AddChoice(dia_baaltyon_testpotionme, " Yes, I want to try it. " ,dia_baaltyon_testpotionme_yes);
		};
	}
	else
	{
		AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_01_12 " );	// About your elixir...
		AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_01_13 " );	// I told you clearly - tomorrow afternoon!
	};
};

func void dia_baaltyon_testpotionme_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_Yes_01_00 " );	// Yes, I want to try it.
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_Yes_01_01 " );	// Good. Here, drink it!
	B_UseItem(other,itpo_tyonpotion);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_02");	//Ого!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_Yes_01_0A " );	// Wow!
	AI_PlayAni(other,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_Yes_01_03 " );	// Well, what do you say?
	AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_Yes_01_04 " );	// I feel rather strange.
	AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_Yes_01_05 " );	// A little dizzy, mind a little cloudy.
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_Yes_01_06 " );	// Do you feel a huge surge of magical energy?
	AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_Yes_01_07 " );	// I think my magic power has increased.
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_Yes_01_08 " );	// Great! This is exactly what I wanted to hear. Truly amazing action!
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_Yes_01_09 " );	// And we can say that our experiment was a success!
	AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_Yes_01_10 " );	// Could you share the secret of this potion with me?
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_Yes_01_11 " );	// No. Such secrets are not scattered and not shared with just anyone.
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_Yes_01_12 " );	// I think one serving is enough for you. In addition, you simply do not have enough experience to weld it.
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_Yes_01_13 " );	// So forget it! Now go, I need to think about the results of the experiment.
	TYONGIVEPOTION = TRUE;
	Info_ClearChoices(dia_baaltyon_testpotionme);
	AI_StopProcessInfos(self);
};

func void dia_baaltyon_testpotionme_no()
{
	AI_Output(other,self, " DIA_BaalTyon_TestPotionMe_No_01_00 " );	// I changed my mind.
	AI_Output(self,other, " DIA_BaalTyon_TestPotionMe_No_01_01 " );	// It's up to you. Then I'll test it on someone else.
	TYONGIVEPOTION = TRUE;
	Info_ClearChoices(dia_baaltyon_testpotionme);
};


instance DIA_BAALTYON_ABOUTEXPERIMENTS(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_aboutexperiments_condition;
	information = dia_baaltyon_aboutexperiments_info;
	permanent = FALSE;
	description = " What experiments are you doing? " ;
};


func int dia_baaltyon_aboutexperiments_condition()
{
	if (( IDOLTYON_YES  ==  TRUE ) && Npc_KnowsInfo ( other , dia_baaltyon_aboutrecept ) && ( ( other . guild ==  GIL_NONE ) || ( other . guild ==  GIL_SEK ) || ( other . guild ==  GIL_TPL ) || ( other . guild ==  GIL_GUR )))
	{
		return TRUE;
	};
};

func void dia_baaltyon_aboutexperiments_info()
{
	AI_Output(other,self, " DIA_BaalTyon_AboutExperiments_01_00 " );	// What experiments are you doing here?
	AI_Output(self,other, " DIA_BaalTyon_AboutExperiments_01_01 " );	// My research is at a level beyond your understanding. Don't waste my time!
};


instance DIA_BAALTYON_CANTEACH(C_Info)
{
	npc = gur_8003_tyon;
	nr = 10;
	condition = dia_baaltyon_canteach_condition;
	information = dia_baaltyon_canteach_info;
	permanent = FALSE;
	description = " Can you teach me alchemy? " ;
};

func int dia_baaltyon_canteach_condition()
{
	if((other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baaltyon_canteach_info()
{
	AI_Output(other,self, " DIA_BaalTyon_CanTeach_01_00 " );	// Can you teach me alchemy?

	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_01 " );	// Do you want to learn the secrets of making potions?
		AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_02 " );	// For one of our brothers, I would have no doubt revealed the secrets of making magical elixirs.
		AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_03 " );	// But for this you need to have some experience.

		if(other.guild == GIL_SEK)
		{
			AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_04 " );	// In addition, learning the secrets of some complex potions, in addition to experience, will require you to have a higher status in the Brotherhood.
			AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_05 " );	// Only the chosen ones are worthy to master this knowledge!
			AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_06 " );	// To the chosen one in the Circle of Guardians, they will add strength and dexterity, and to the sacred chosen Guru - wisdom and strength of life.
		}
		else
		{
			AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_07 " );	// Since your status in the Brotherhood is high enough, I could teach you how to make more complex elixirs.
			AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_08 " );	// To the chosen one in the Circle of Guardians, they will add strength and dexterity, and to the sacred chosen Guru - wisdom and strength of life.
		};
		AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_09 " );	// But in any case, the choice is yours.
	}
	else
	{
		AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_10 " );	// You're not one of the brothers, so you can forget about it.
		AI_Output(self,other, " DIA_BaalTyon_CanTeach_01_11 " );	// I won't teach you.
	};
};


instance DIA_BAALTYON_TEACH(C_Info)
{
	npc = gur_8003_tyon;
	nr = 10;
	condition = dia_baaltyon_teach_condition;
	information = dia_baaltyon_teach_info;
	permanent = TRUE;
	description = " Teach me how to brew potions. " ;
};


func int dia_baaltyon_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_baaltyon_canteach) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_teach_info()
{
	AI_Output(other,self, " DIA_BaalTyon_TEACH_15_00 " );	// Teach me how to brew potions.
	AI_Output(self,other, " DIA_BaalTyon_TEACH_01_01 " );	// What do you want to know?
	Info_ClearChoices(dia_baaltyon_teach);
	Info_AddChoice(dia_baaltyon_teach,Dialog_Back,dia_baaltyon_teach_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(the_building_teach,b_buildlearnstringforalchemy( " Material craft. " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_01)),the_building_teach_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(the_bailment_teach,b_buildlearnstringforalchemy( " Material CostTalent. " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_02)),the_building_teach_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(his_building_teach,b_buildlearnstringforalchemy( " Magic spell. " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_03)),his_building_teach_health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (other.guild == GIL_GUR))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эликсир жизни.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_baaltyon_teach_perm_health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эссенция маны.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),dia_baaltyon_teach_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Экстракт маны.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),dia_baaltyon_teach_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эликсир маны.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),dia_baaltyon_teach_mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (other.guild == GIL_GUR))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эликсир духа.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),dia_baaltyon_teach_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) && (other.guild == GIL_TPL))
	{
		Info_AddChoice(dia_wall_teach,b_buildlearnstringforalchemy( " ЭлсирвЂс. " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_STR)),dia_wall_teach_permstr);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE) && (other.guild == GIL_TPL))
	{
		Info_AddChoice(dia_building_teach,b_buildlearnstringforalchemy( " Learn CostTalent. " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_DEX)),build_buildlearn_teach_permdex);
	};
};

func void dia_baaltyon_teach_back()
{
	Info_ClearChoices(dia_baaltyon_teach);
};

func void dia_baaltyon_teach_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_baaltyon_teach_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_baaltyon_teach_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_baaltyon_teach_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_baaltyon_teach_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_baaltyon_teach_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_baaltyon_teach_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_baaltyon_teach_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void dia_baaltyon_teach_permstr()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void dia_baaltyon_teach_permdex()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};


instances DIA_BAALTYON_CANTRADE (C_Info)
{
	npc = gur_8003_tyon;
	nr = 99;
	condition = dia_baaltyon_cantrade_condition;
	information = dia_baaltyon_cantrade_info;
	permanent = FALSE;
	description = " Idol Oran said you were selling magic scrolls. " ;
};


func int dia_baaltyon_cantrade_condition()
{
	if((BAALTYON_CANTRADE == TRUE) && (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baaltyon_cantrade_info()
{
	AI_Output(other,self, " DIA_BaalTyon_CanTrade_01_01 " );	// Idol Oran said you were selling magic scrolls.
	AI_Output(self,other, " DIA_BaalTyon_CanTrade_01_02 " );	// Yes, I sell scrolls of Sleeper magic spells. But only for Guru.
	AI_Output(other,self, " DIA_BaalTyon_CanTrade_01_03 " );	// As you can see, I also belong to the Circle of the Chosen. Could you sell me some of them?
	AI_Output(self,other, " DIA_BaalTyon_CanTrade_01_04 " );	// Of course. True, I don't have many of them.
	AI_Output(self,other, " DIA_BaalTyon_CanTrade_01_05 " );	// So try to use these scrolls wisely.
};

var int SixCircle;

instance DIA_BAALTYON_TRADE(C_Info)
{
	npc = gur_8003_tyon;
	nr = 99;
	condition = dia_baaltyon_trade_condition;
	information = dia_baaltyon_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = " Show me your magical scrolls. " ;
};


func int dia_baaltyon_trade_condition()
{
	if (( BAALTYON_CANTRADE  ==  TRUE ) && (other.guild ==  GIL_GUR ) && Npc_KnowsInfo(other,dia_baaltyon_cantrade) && Wld_IsTime( 9 , 0 , 20 , 0 )) ;
	{
		return TRUE;
	};
};

func void dia_baaltyon_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_BaalTyon_Trade_01_01 " );	// Show me your magical scrolls.

	if((GurBelt_01 == FALSE) && (hero.guild == GIL_GUR))
	{
		CreateInvItems(self,ItBE_Addon_GUR_01,1);
		GurBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);

	if((PLAYER_TALENT_RUNES[SPL_GuruWrath] == TRUE) && (SixCircle == FALSE))
	{	
		CreateInvItems(self,itwr_GuruWrath,1);
		SixCircle = TRUE;
	};
};


instance DIA_BAALTYON_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_runemagicnotwork_condition;
	information = dia_baaltyon_runemagicnotwork_info;
	permanent = FALSE;
	description = " How is your magic doing? " ;
};


func int dia_baaltyon_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baaltyon_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalTyon_RuneMagicNotWork_01_00 " );	// How's your magic doing?
	AI_Output(self,other, " DIA_BaalTyon_RuneMagicNotWork_01_01 " );	// Our magic runes have weakened and are no longer able to cast spells!
	AI_Output(self,other, " DIA_BaalTyon_RuneMagicNotWork_01_02 " );	// We are all extremely surprised by this circumstance, but there is nothing we can do.
	AI_Output(self,other, " DIA_BaalTyon_RuneMagicNotWork_01_03 " );	// This is all pretty weird.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , "The Gurus of the Brotherhood have also lost their power over rune magic. " );
	GURUMAGERUNESNOT = TRUE;
};

instance DIA_BAALTYON_LOKIPOTION(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LOKIPOTION_condition;
	information = dia_baaltyon_LOKIPOTION_info;
	important = FALSE;
	description = " I need a special drink. " ;
};

func int dia_baaltyon_LOKIPOTION_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (LokiNeedMemory == TRUE))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LOKIPOTION_info()
{
	AI_Output(other,self, " DIA_BaalTyon_LOKIPOTION_01_00 " );	// I need a special drink.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_01 " );	// What exactly are you talking about?
	AI_Output(other,self, " DIA_BaalTyon_LOKIPOTION_01_02 " );	// About a drink that can revive a person's memories. Do you have one?
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_03 " );	// Hmmm... Unfortunately not.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_04 " );	// But if you brought me all the necessary ingredients, I could cook it for you.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_05 " );	// And why did you suddenly need it?
	AI_Output(other,self, " DIA_BaalTyon_LOKIPOTION_01_06 " );	// This is not for me, but for one novice.
	AI_Output(other,self, " DIA_BaalTyon_LOKIPOTION_01_07 " );	// Just need to refresh his memory on one very important thing.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_08 " );	// I understand. Okay, then listen and remember what I need.
	AI_Output(other,self, " DIA_BaalTyon_LOKIPOTION_01_09 " );	// I'm all ears.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_10 " );	// So, first I need marsh grass. Three stems should be enough.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_11 " );	// Then I'll need one spirit elixir, royal sorrel, two medicinal plants, five creeper mandibles, aquamarine...
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_12 " );	// ...and finally, the last ingredient on my list is the cactus flower!
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_13 " );	// I'm sure you won't have any trouble getting all of this. Well, maybe except for the last component.
	AI_Output(other,self, " DIA_BaalTyon_LOKIPOTION_01_14 " );	// Just about him, I wanted to ask - where can I find him?
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_15 " );	// Good question. The problem is that this plant grows only in conditions of high temperatures and dry climates.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_16 " );	// I heard that in the desert Varant this plant is not so rare.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_17 " );	// But, of course, getting there now is not possible.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_18 " );	// Therefore, where to look for it on this island - I can't tell you.
	AI_Output(self,other, " DIA_BaalTyon_LOKIPOTION_01_19 " );	// Try asking other alchemists about it. Maybe someone can help you find it.
	SeekCactus = TRUE;
	B_LogEntry(TOPIC_PrioratStart, " Idol Tion knows how to make a drink that can restore a person's memory. However, he needs the appropriate ingredients, namely: three bog stalks, spirit elixir, royal sorrel, two healing plants, five creeper mandibles, aquamarine and a cactus flower. Obtain the latter is rather problematic, since it grows only in dry climates, for example, in the desert Varant. It remains for me to ask around the local alchemists. " );
};

instance DIA_BAALTYON_LokiPotion_Ready(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LokiPotion_Ready_condition;
	information = dia_baaltyon_LokiPotion_Ready_info;
	important = FALSE;
	description = " I have all the ingredients. " ;
};

func int dia_baaltyon_LokiPotion_Ready_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (Npc_HasItems(other,ItPl_CactusFlower) >= 1) && (Npc_HasItems(other,ItPl_SwampHerb) >= 3) && (Npc_HasItems(other,ItPo_Perm_Mana) >= 1) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1) && (Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItAt_CrawlerMandibles) >= 5) && ( Npc_HasItems ( other , ItMy_Aquamarine ) >=  1 ))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LokiPotion_Ready_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_BaalTyon_LokiPotion_Ready_01_00 " );	// I have all the ingredients.
	AI_Output(self,other, " DIA_BaalTyon_LokiPotion_Ready_01_01 " );	// Good. Give them to me and I'll start preparing the drink.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_CactusFlower,1);
	Npc_RemoveInvItems(other,ItPl_SwampHerb,3);
	Npc_RemoveInvItems(other,ItPo_Perm_Mana,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,2);
	Npc_RemoveInvItems(other,ItAt_CrawlerMandibles,5);
	Npc_RemoveInvItems(other,ItMi_Aquamarine,1);
	AI_Output(other,self, " DIA_BaalTyon_LokiPotion_Ready_01_02 " );	// How long will it take?
	AI_Output(self,other, " DIA_BaalTyon_LokiPotion_Ready_01_03 " );	// At least a couple of days, because the recipe is incredibly complex.
	TyonPotionResearchDayEnd = Wld_GetDay();
	B_LogEntry(TOPIC_PrioratStart, " I brought all the necessary ingredients to Idol Tion, and the Guru proceeded to create a drink of memories. The preparation process will take at least one day. " );
};

instance DIA_BAALTYON_LokiPotion_Done(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LokiPotion_Done_condition;
	information = dia_baaltyon_LokiPotion_Done_info;
	important = FALSE;
	description = " How's my drink doing? " ;
};

func int dia_baaltyon_LokiPotion_Done_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (TyonPotionResearchDayEnd > 0) && (TyonPotionResearchDayEnd <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LokiPotion_Done_info()
{
	AI_Output(other,self, " DIA_BaalTyon_LokiPotion_Done_01_00 " );	// How's my drink doing?
	AI_Output(self,other, " DIA_BaalTyon_LokiPotion_Done_01_01 " );	// It's ready. Here, you can take it.
	B_GiveInvItems(self,other,ItPo_Memories,1);
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Done_01_02");	//Спасибо.
	B_LogEntry(TOPIC_PrioratStart, " The drink of memories is ready. It remains to give it to the acolyte so that he remembers the information I need. " );
};
