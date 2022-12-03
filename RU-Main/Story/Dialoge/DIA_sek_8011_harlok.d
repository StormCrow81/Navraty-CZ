

instance DIA_HARLOK_EXIT(C_Info)
{
	npc = sek_8011_harlok;
	nr = 999;
	condition = dia_harlok_exit_condition;
	information = dia_harlok_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_harlok_exit_condition()
{
	return TRUE;
};

func void dia_harlok_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_HARLOK_HALLO (C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_hallo_condition;
	information = dia_harlok_hallo_info;
	permanent = FALSE;
	description = " Hello " ;
};


func int dia_harlok_hallo_condition()
{
	return TRUE;
};

func void dia_harlok_hello_info()
{
	AI_Output(other,self, " DIA_Harlok_Hallo_01_00 " );	// Hello.
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other, " DIA_Harlok_Hallo_01_01 " );	// Greetings, brother!
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other, " DIA_Harlok_Hallo_01_02 " );	// My respect, valiant Guardian!
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other, " DIA_Harlok_Hallo_01_03 " );	// My respect, sir!
	}
	else
	{
		AI_Output(self,other, " DIA_Harlok_Hallo_01_04 " );	// May the Sleeper be with you, stranger!
	};
};


DIA_HARLOK_ORT (C_Info) instances
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_ort_condition;
	information = dia_harlok_ort_info;
	permanent = FALSE;
	description = " Tell me about this place. " ;
};


func int dia_harlok_ort_condition()
{
	if(Npc_KnowsInfo(hero,dia_harlok_hallo) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_harlok_ort_info()
{
	AI_Output(other,self, " DIA_Harlok_Ort_01_00 " );	// Tell me about this place.
	AI_Output(self,other, " DIA_Harlok_Ort_01_01 " );	// Well, Gurus are the most important here. They bring the blessings of the true path to our brethren and pass on their wisdom to the newcomers.
	AI_Output(other,self, " DIA_Harlok_Ort_01_02 " );	// And what is this path?
	AI_Output(self,other, " DIA_Harlok_Ort_01_03 " );	// He helps us free our minds and strengthen our spirits.
	AI_Output(self,other, " DIA_Harlok_Ort_01_04 " );	// But pagans like you don't get it.
};


instance DIA_HARLOK_WELCOME(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_welcome_condition;
	information = dia_harlok_welcome_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_harlok_welcome_condition()
{
	if(Npc_KnowsInfo(hero,dia_harlok_hallo))
	{
		return TRUE;
	};
};

func void dia_harlok_welcome_info()
{
	AI_Output(other,self,"DIA_Harlok_Welcome_01_00");	//Как дела?
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other, " DIA_Harlok_Welcome_01_01 " );	// It's all right, brother.
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other, " DIA_Harlok_Welcome_01_02 " );	// All is well, valiant Guardian.
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other, " DIA_Harlok_Welcome_01_03 " );	// All is well, sir.
	}
	else
	{
		AI_Output(self,other, " DIA_Harlok_Welcome_01_04 " );	// It's all right, stranger.
	};
};


instance DIA_HARLOK_WORK(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_work_condition;
	information = dia_harlok_work_info;
	permanent = FALSE;
	description = " What is your job here? " ;
};


func int dia_harlok_work_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_harlok_hallo ) && ( other . guild !=  GIL_TPL ) && ( other . guild !=  GIL_GUR ))
	{
		return TRUE;
	};
};

func void dia_harlok_work_info()
{
	AI_Output(other,self, " DIA_Harlok_Work_01_00 " );	// What is your job here?
	AI_Output(self,other, " DIA_Harlok_Work_01_01 " );	// I mostly look after newbies. I make sure they don't get into any trouble.
	AI_Output(self,other, " DIA_Harlok_Work_01_02 " );	// Our Brotherhood has its own laws and regulations, and it is very difficult for many to get used to them.
	AI_Output(self,other, " DIA_Harlok_Work_01_03 " );	// And sometimes there are little problems because of this.
	AI_Output(self,other, " DIA_Harlok_Work_01_04 " );	// The same goes for strangers like you.
	AI_Output(other,self, " DIA_Harlok_Work_01_05 " );	// And what should be done in this case?
	AI_Output(self,other, " DIA_Harlok_Work_01_06 " );	// If you're in trouble with any of the Brotherhood here, contact Idol Oran.
	AI_Output(self,other, " DIA_Harlok_Work_01_07 " );	// He'll help you sort them out.
};


instance DIA_HARLOK_HARWR (C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_harwr_condition;
	information = dia_harlok_harwr_info;
	permanent = FALSE;
	description = " I would like to join your camp. Could you help me? " ;
};


func int dia_harlok_harwr_condition()
{
	if((PSI_TALK == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_harlok_harwr_info()
{
	AI_Output(other,self, " DIA_Harlok_HarWr_01_00 " );	// I would like to join your camp. Could you help me?
	AI_Output(self,other, " DIA_Harlok_HarWr_01_01 " );	// So you want to join us? Commendable decision!
	AI_Output(self,other, " DIA_Harlok_HarWr_01_02 " );	// Of course, I could help you with this... (thinks) If you would, say, do me one small favor.
	AI_Output(self,other, " DIA_Harlok_HarWr_01_04 " );	// Tell me, have you already spoken to Talas?
	Info_ClearChoices(dia_harlok_hero);
	Info_AddChoice(dia_harlok_hero, " Нет. " ,dia_harlok_hero_nein);
	Info_AddChoice(dia_harlok_hero, " Да. " ,dia_harlok_hero_ja);
};

func void dia_harlok_harwr_ja()
{
	AI_Output(self,other, " DIA_Harlok_HarWr_Ja_07_00 " );	// Then you should have gotten your daily dose. If you give it to me, I will try to help you.
	AI_Output(other,self, " DIA_Harlok_HarWr_Ja_15_01 " );	// I'll think about it.
	HARLOK_BRINGJOINTS = LOG_Running;
	Log_CreateTopic(TOPIC_HARLOKJOINPSI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_Running);
	B_LogEntry( TOPIC_HARLOKJOINPSI , " Harlock wants my portion of the bog that I got from Talas. " );
	Info_ClearChoices(dia_harlok_hero);
};

func void dia_harlok_harwr_nein()
{
	AI_Output(self,other, " DIA_Harlok_HarWr_Nein_07_00 " );	// So go to him and get your daily dose. If you give me your swamp, I'll try to help you.
	AI_Output(other,self, " DIA_Harlok_HarWr_Nein_15_01 " );	// I'll think about it.
	HARLOK_BRINGJOINTS = LOG_Running;
	Log_CreateTopic(TOPIC_HARLOKJOINPSI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_Running);
	B_LogEntry( TOPIC_HARLOKJOINPSI , " Harlock would like my portion of bogweed that I can take from Talas. " );
	Info_ClearChoices(dia_harlok_hero);
};


instance DIA_HARLOK_JOINTSRUNNING(C_Info)
{
	npc = sek_8011_harlok;
	nr = 5;
	condition = dia_harlok_jointsrunning_condition;
	information = dia_harlok_jointsrunning_info;
	permanent = TRUE;
	description = " I have the Swamp. You can take it. " ;
};


func int dia_harlok_jointsrunning_condition()
{
	if((HARLOK_BRINGJOINTS == LOG_Running) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_harlok_jointsrunning_info()
{
	AI_Output(other,self, " DIA_Harlok_JointsRunning_15_00 " );	// I have a swamp. You can pick up.
	if(Npc_HasItems(other,ItMi_Joint) >= 3)
	{
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_01 " );	// Good! You must have noticed that none of the Guru wants to talk to you.
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_02 " );	// To get your way, you need to impress them. I'll tell you how to do it.
		AI_Output(other,self, " DIA_Harlok_JointsRunning_07_03 " );	// How to impress Guru?
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_04 " );	// The Namib Idol instructs students in the magic of the Sleeper.
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_05 " );	// If you want him to pay attention to you, use magic.
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_06 " );	// Just don't try Windfist on him! Put one of the students to sleep or do something like that.
		AI_Output(other,self, " DIA_Harlok_JointsRunning_07_07 " );	// Where can I get scrolls of Sleeper magic spells?
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_08 " );	// Idol Tion sells runes and magic scrolls. True, as long as you are not a Guru, he will not even listen to you.
		AI_Output(other,self, " DIA_Harlok_JointsRunning_07_09 " );	// And what should I do?
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_10 " );	// I think I had one scroll with a sleep spell somewhere. I could sell it to you.
		AI_Output(other,self, " DIA_Harlok_JointsRunning_07_11 " );	// And how much do you want for this magic scroll?
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_12 " );	// Well, let's say... Considering how useful it will be in your business...
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_13 " );	// ...five hundred gold will be enough.
		AI_Output(other,self, " DIA_Harlok_JointsRunning_07_14 " );	// What?! Do you want five hundred coins for this scroll?
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_15 " );	// Well, it's just my business to suggest...
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_16 " );	// But don't think I'll give it to you cheaper.
		AI_Output(self,other, " DIA_Harlok_JointsRunning_07_17 " );	// If you still decide to buy it - just tell me about it.
		AI_Output(other,self, " DIA_Harlok_JointsRunning_07_18 " );	// I'll think about it.
		B_GiveInvItems(other,self,ItMi_Joint,3);
		HARLOK_BRINGJOINTS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_SUCCESS);
		B_GivePlayerXP(50);
	}
	else
	{
		AI_Output(self,other, " DIA_Harlok_JointsRunning_NO_JOINTS_07_00 " );	// Looks like we've converged on three stems? Give me the swamp, and then I will help you!
	};
};


instance DIA_HARLOK_TRADESCROLL(C_Info)
{
	npc = sek_8011_harlok;
	nr = 5;
	condition = dia_harlok_tradescroll_condition;
	information = dia_harlok_tradescroll_info;
	permanent = TRUE;
	description = " Sell me your scroll. " ;
};


func int dia_harlok_tradescroll_condition()
{
	if((HARLOK_BRINGJOINTS == LOG_SUCCESS) && (TRADE_HARLOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_harlok_tradescroll_info()
{
	AI_Output(other,self, " DIA_Harlok_TradeScroll_07_00 " );	// Sell me your scroll.
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GiveInvItems(other,self,ItMi_Gold,500);
		AI_Output(self,other, " DIA_Harlok_TradeScroll_07_01 " );	// Good! Here, hold it.
		AI_Output(self,other, " DIA_Harlok_TradeScroll_07_02 " );	// I probably shouldn't remind you how to use it.
		B_GiveInvItems(self,other,ItSc_Sleep,1);
		TRADE_HARLOK = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Harlok_TradeScroll_07_03 " );	// But you don't have enough money!
		AI_Output(self,other, " DIA_Harlok_TradeScroll_07_04 " );	// Come when you have five hundred coins - then we'll talk.
	};
};


instances DIA_HARLOK_SEKTEHEILEN (C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_sekteheilen_condition;
	information = dia_harlok_sekteheilen_info;
	permanent = FALSE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int dia_harlok_sekteheilen_condition()
{
	if ((Npc_HasItems(other,ItPo_Heal_Obsession_MY) >  0 ) && ( MY_SECTS_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero, dia_heal_sectarian_obsession));
	{
		return TRUE;
	};
};

func void dia_harlok_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Harlok_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Output(self,other, " DIA_Harlok_SekteHeilen_01_01 " );	// The headache is gone... She's gone!
	AI_Output(self,other, " DIA_Harlok_SekteHeilen_01_02 " );	// Thank you!
};

