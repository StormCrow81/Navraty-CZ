

instance DIA_BALAM_EXIT(C_Info)
{
	npc = sek_8046_balam;
	nr = 999;
	condition = dia_balam_exit_condition;
	information = dia_balam_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_balam_exit_condition()
{
	return TRUE;
};

func void dia_balam_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALAM_NOFOREVER(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_noforever_condition;
	information = dia_balam_noforever_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_balam_noforever_condition()
{
	return TRUE;
};

func void dia_balam_noforever_info()
{
	AI_Output(other,self,"DIA_Balam_NoForever_01_00");	//Кто вы?
	AI_Output(self,other, " DIA_Balam_NoForever_01_01 " );	// (proudly) We are the bog collectors!
	AI_Output(self,other, " DIA_Balam_NoForever_01_02 " );	// The Brotherhood needs a lot of bogging. And our task is to collect it as much as possible.
};


instances DIA_BALAM_PSIINFO (C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_psiinfo_condition;
	information = dia_balam_psiinfo_info;
	permanent = FALSE;
	description = " Brotherhood? Which Brotherhood? " ;
};


func int dia_balam_psiinfo_condition()
{
	if ( ! Npc_KnowsInfo(hero,dia_tpl_8014_templer_first) && !  Npc_KnowsInfo (hero, dia_hanis_psiinfo ) &&  !
	{
		return TRUE;
	};
};

func void dia_balam_psiinfo_info()
{
	AI_Output(other,self, " DIA_Balam_PsiInfo_01_00 " );	// Brotherhood? Which Brotherhood?
	AI_Output(self,other, " DIA_Balam_PsiInfo_01_01 " );	// To the Brotherhood of the Sleeper! Although now it can be called simply - the Brotherhood.
	AI_Output(other,self, " DIA_Balam_PsiInfo_01_02 " );	// But I thought that after the fall of the barrier, the Brotherhood of the Sleeper ceased to exist!
	AI_Output(self,other, " DIA_Balam_PsiInfo_01_03 " );	// It's not! Of course, most of our brothers died, and many went crazy from the corrupting influence of demonic forces.
	AI_Output(self,other, " DIA_Balam_PsiInfo_01_04 " );	// But there were those who still survived. It was they who became the leaders of our new camp.
	AI_Output(other,self, " DIA_Balam_PsiInfo_01_05 " );	// Where is your camp?
	AI_Output(self,other, " DIA_Balam_PsiInfo_01_06 " );	// Head towards the passage to the Valley of Mines. Before reaching the passage itself, you will find a small farm.
	AI_Output(self,other, " DIA_Balam_PsiInfo_01_07 " );	// Not far from it is our new abode.
};


instance DIA_BALAM_HELLO (C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_hello_condition;
	information = dia_balam_hello_info;
	permanent = FALSE;
	description = " Why don't you help others? " ;
};


func int dia_balam_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_hello_info()
{
	AI_Output(other,self, " DIA_Balam_Hello_01_00 " );	// Why don't you help the others?
	AI_Output(self,other, " DIA_Balam_Hello_01_01 " );	// And who do you think is going to make sure that some creature doesn't sneak up on the harvesters and devour them, huh?
	AI_Output(self,other, " DIA_Balam_Hello_01_02 " );	// This area is just teeming with all sorts of beasts. Here you need to look at both!
	AI_Output(other,self, " DIA_Balam_Hello_01_03 " );	// I didn't even think about that.
	AI_Output(self,other,"DIA_Balam_Hello_01_04");	//Вот-вот.
};


instance DIA_BALAM_HELLOTWO(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_hellotwo_condition;
	information = dia_balam_hellotwo_info;
	permanent = TRUE;
	description = " How's the bog harvest going? " ;
};


func int dia_balam_hellotwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_hellotwo_info()
{
	AI_Output(other,self, " DIA_Balam_HelloTwo_01_00 " );	// How's the bog harvest progressing?
	AI_Output(self,other, " DIA_Balam_HelloTwo_01_01 " );	// If you don't pester our pickers, he'll move even faster!
};

instance DIA_BALAM_GIVEPLANT(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_giveplant_condition;
	information = dia_balam_giveplant_info;
	permanent = TRUE;
	description = " Idol Kadar sent me. " ;
};


func int dia_balam_giveplant_condition()
{
	if (( MIS_PLANTFORBAALFRAME  == LOG_Running) && ( SECONDGROUPSEK  ==  FALSE ) && (other.guild ==  GIL_SEK ) && Npc_KnowsInfo(hero,dia_balam_noforever));
	{
		return TRUE;
	};
};

func void dia_balam_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Balam_GivePlant_01_00 " );	// Idol Kadar sent me.
	AI_Output(self,other, " DIA_Balam_GivePlant_01_01 " );	// And why did he do it?
	AI_Output(other,self, " DIA_Balam_GivePlant_01_02 " );	// He wants me to deliver the bog you collected to him.
	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other, " DIA_Balam_GivePlant_01_03 " );	// Good. Here, take it. Here is everything we have.
		B_GiveInvItems(self,other,ItPl_SwampHerb,50);
		AI_Output(self,other, " DIA_Balam_GivePlant_01_04 " );	// Be careful with him! We spent at least a month collecting it.
		SECONGROUPSEK = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Balam_GivePlant_01_05 " );	// You don't look like the kind of person Idol Kadar could send.
		AI_Output(self,other, " DIA_Balam_GivePlant_01_06 " );	// I wouldn't trust you with a stalk of this herb!
	};
};

// -----------------PRIORITY--------------------


instance dia_balam_PrioratStart (C_Info)
{
	npc = sek_8046_balam;
	nr = 1;
	condition = dia_balam_PrioratStart_condition;
	information = dia_balam_PrioratStart_info;
	permanent = FALSE;
	description = "The Namib Idol sent me. " ;
};


func int dia_balam_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_balam_PrioratStart_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " dia_balam_PrioratStart_01_00 " );	// The Namib Idol sent me.
	AI_Output(self,other, " dia_balam_PrioratStart_01_01 " );	// Oh! (respectfully) So one of our spirit guides sent you. And what does he need?
	AI_Output(other,self, " dia_balam_PrioratStart_01_02 " );	// He just wants to make sure you're okay.
	AI_Output(self,other, " dia_balam_PrioratStart_01_03 " );	// We're fine. You can pass it on to him.
	AI_Output(other,self, " dia_balam_PrioratStart_01_04 " );	// Well, he's also very interested in what you know about the disappearance of several acolytes from the Brotherhood camp.
	AI_Output(self,other, " dia_balam_PrioratStart_01_05 " );	// (puzzled) How do we know about this? We learn all the news only when we return to the camp with another batch of swamp grass.
	AI_Output(self,other, " dia_balam_PrioratStart_01_06 " );	// And about the missing novices, I generally hear for the first time.
	AI_Output(other,self, " dia_balam_PrioratStart_01_07 " );	// Well, maybe you've seen them?
	AI_Output(self,other, " dia_balam_PrioratStart_01_08 " );	// If that were the case, the Namib Idol would be the first to know about it.
	AI_Output(self,other, " dia_balam_PrioratStart_01_09 " );	// So I have nothing more to say.
	AI_Output(other,self, " dia_balam_PrioratStart_01_10 " );	// Okay, I understand you.
	PsiCamp_01_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart, " All is quiet in the gathering camp under Balam's control. They know nothing about the missing acolytes. " );
};

instances DIA_BALAM_NamibSendTempler (C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_NamibSendTempler_condition;
	information = dia_balam_NamibSendTempler_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_balam_NamibSendTempler_condition()
{
	if((NamibSendTempler == TRUE) && (CountDownAssInvasion == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_balam_NamibSendTempler_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Balam_NamibSendTempler_01_01 " );	// You again? What did you complain about this time?
	AI_Output(other,self, " DIA_Balam_NamibSendTempler_01_02 " );	// I'm here at the request of the Namib Idol. Your gathering camp may be under attack!
	AI_Output(self,other, " DIA_Balam_NamibSendTempler_01_03 " );	// (alarmed) Attack? So that's why the Guru sent several Guardians to us.
	AI_Output(other,self, " DIA_Balam_NamibSendTempler_01_04 " );	// That's right.
	AI_Output(self,other, " DIA_Balam_NamibSendTempler_01_05 " );	// Okay. I hope that with them we will be much calmer here.
	AI_Output(other,self, " DIA_Balam_NamibSendTempler_01_06 " );	// You can be sure of that.
	CountDownAssInvasion = TRUE;
	CountDownAssInvasionDay = Wld_GetDay();
	CountDownAssInvasionRandomDay = Hlp_Random(2);
};


instances DIA_BALAM_JobInCamp (C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_JobInCamp_condition;
	information = dia_balam_JobInCamp_info;
	permanent = FALSE;
	description = " Is there any job for me here? " ;
};

func int dia_balam_JobInCamp_condition()
{
	if(CountDownAssInvasion == TRUE)
	{
		return TRUE;
	};
};

func void dia_balam_JobInCamp_info()
{
	AI_Output(other,self, " DIA_Balam_JobInCamp_01_01 " );	// Is there any work for me here?
	AI_Output(self,other, " DIA_Balam_JobInCamp_01_02 " );	// Hmmm... (thoughtfully) If you want, you can help our guys with the collection of the bogweed.
	AI_Output(self,other, " DIA_Balam_JobInCamp_01_03 " );	// Truth be told, we really could use some extra hands.
	AI_Output(other,self, " DIA_Balam_JobInCamp_01_04 " );	// Good. And where can I look for it?
	AI_Output(self,other, " DIA_Balam_JobInCamp_01_05 " );	// Here, near the camp. Or you can look for him by the lake. Basically, bring whatever you can find. But not less than ten stems.
	AI_Output(self,other, " DIA_Balam_JobInCamp_01_06 " );	// Just be careful! In the local thickets, quite dangerous creatures are sometimes found.
	Log_CreateTopic(TOPIC_JobInCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JobInCamp,LOG_Running);
	B_LogEntry(TOPIC_JobInCamp, " Balam asked me to help his pickers collect swamp grass. There is nothing to do in the camp, so I decided to walk around and find at least ten bog grass stalks. " );
	MIS_JobInCamp = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_01");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_02");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_03");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_04");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_05");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_06");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_07");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_08");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_09");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_10");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_11");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_12");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_13");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_14");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_15");
};

instance DIA_BALAM_JobInCamp_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_JobInCamp_Done_condition;
	information = dia_balam_JobInCamp_Done_info;
	permanent = FALSE;
	description = " I have some swamp grass for you. " ;
};

func int dia_balam_JobInCamp_Done_condition()
{
	if((MIS_JobInCamp == LOG_Running) && (Npc_HasItems(other,ItPl_SwampHerb) >= 10))
	{
		return TRUE;
	};
};

func void dia_balam_JobInCamp_Done_info()
{
	var int swamp_herbz;
	var int swamp_xp;
	var int swamp_xp_big;

	AI_Output(other,self, " DIA_Balam_JobInCamp_Done_01_01 " );	// I have some swamp grass for you.
	AI_Output(self,other, " DIA_Balam_JobInCamp_Done_01_02 " );	// Great, man! Give her here.

	swamp_xp_big = FALSE;	
	swamp_herbz = Npc_HasItems(hero,ItPl_SwampHerb);
	B_GiveInvItems(other,self,ItPl_SwampHerb,swamp_herbz);
	Npc_RemoveInvItems(self,ItPl_SwampHerb,swamp_herbz);
	swamp_xp_big = swamp_herbz * 50;
	B_GivePlayerXP(swamp_xp_big);

	if(swamp_herbz >= 10)
	{
		AI_Output(other,self, " DIA_Balam_JobInCamp_Done_01_03 " );	// Here, take this. I collected everything I could find.
		AI_Output(self,other, " DIA_Balam_JobInCamp_Done_01_04 " );	// Good. I think this amount is quite enough for the next party to the camp.
		AI_Output(self,other, " DIA_Balam_JobInCamp_Done_01_05 " );	// You did a great job! Here, take this drink as a reward for your labors.
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
		AI_Output(other,self, " DIA_Balam_JobInCamp_Done_01_06 " );	// With pleasure.
	}
	else
	{
		B_GivePlayerXP(swamp_xp_big);
		AI_Output(other,self, " DIA_Balam_JobInCamp_Done_01_07 " );	// This is all I have.
		AI_Output(self,other, " DIA_Balam_JobInCamp_Done_01_08 " );	// Yes, not bad. Although, to be honest, I expected a little more.
		AI_Output(other,self, " DIA_Balam_JobInCamp_Done_01_09 " );	// Isn't that enough for you?
		AI_Output(self,other, " DIA_Balam_JobInCamp_Done_01_10 " );	// You see, the last collection sent to the camp was not too big.
		AI_Output(self,other, " DIA_Balam_JobInCamp_Done_01_11 " );	// Oh well. How much is there.
	};

	MIS_JobInCamp = LOG_SUCCESS;
	Log_CreateTopic(TOPIC_JobInCamp,LOG_SUCCESS);
	B_LogEntry(TOPIC_JobInCamp, " I've collected enough swamp grass for Balam to be sent to the Brotherhood's next camp. " );
};


instances of DIA_BALAM_StrangeCave (C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_condition;
	information = dia_balam_StrangeCave_info;
	permanent = FALSE;
	description = " Is there another job for me? " ;
};

func int dia_balam_StrangeCave_condition()
{
	if(MIS_JobInCamp == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_info()
{
	AI_Output(other,self, " DIA_Balam_StrangeCave_01_01 " );	// Is there another job for me?
	AI_Output(self,other, " DIA_Balam_StrangeCave_01_02 " );	// Hmmm...(thoughtfully) Well, if you have nothing else to do...
	AI_Output(self,other, " DIA_Balam_StrangeCave_01_03 " );	// ...then you can visit the cave, which is located not far from our camp.
	AI_Output(self,other, " DIA_Balam_StrangeCave_01_05 " );	// Recently, strange sounds have been coming from there at night!
	AI_Output(self,other, " DIA_Balam_StrangeCave_01_06 " );	// The guys and I have been there several times during the day, but we did not find anyone but a couple of meat bugs.
	AI_Output(self,other, " DIA_Balam_StrangeCave_01_07 " );	// Maybe you'll get lucky and be able to figure out what the hell is going on.
	AI_Output(other,self, " DIA_Balam_StrangeCave_01_08 " );	// Okay, I'll try.
	AI_Output(self,other, " DIA_Balam_StrangeCave_01_09 " );	// That would be nice, mate. It would be nice!
	Log_CreateTopic(TOPIC_StrangeCave,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_StrangeCave,LOG_Running);
	B_LogEntry(TOPIC_StrangeCave, " Balam asked me to find out what strange noises are coming from the cave at night. Swamp collectors found only meat bugs there. Apparently, we need to sneak in without making too much noise. " );
	MIS_StrangeCave = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertItem(ITSC_TRFMEATBUG,"FP_ITEM_NW_TROLLAREA_TRFMEATBUG");
};


instance DIA_BALAM_StrangeCave_News(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_News_condition;
	information = dia_balam_StrangeCave_News_info;
	permanent = FALSE;
	description = " What else can you say about that cave? " ;
};

func int dia_balam_StrangeCave_News_condition()
{
	if((MIS_StrangeCave == LOG_Running) && (StrangeCaveMageIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_News_info()
{
	AI_Output(other,self, " DIA_Balam_StrangeCave_News_01_01 " );	// What else can you tell me about that cave?
	AI_Output(self,other, " DIA_Balam_StrangeCave_News_01_02 " );	// Well, there's something else... (seriously) Maybe this will help you somehow.
	AI_Output(other,self, " DIA_Balam_StrangeCave_News_01_03 " );	// Well, lay it out, don't delay.
	AI_Output(self,other, " DIA_Balam_StrangeCave_News_01_04 " );	// In general, when we entered that cave, one of the collectors noticed that someone's shadow flickered on the wall and then instantly disappeared.
	AI_Output(self,other, " DIA_Balam_StrangeCave_News_01_05 " );	// I think that perhaps we scared someone away with our presence!
	AI_Output(self,other, " DIA_Balam_StrangeCave_News_01_06 " );	// Well, then you already know. There was no one else there besides stinky meat bugs.
	AI_Output(other,self, " DIA_Balam_StrangeCave_News_01_07 " );	// Nothing else?
	AI_Output(self,other, " DIA_Balam_StrangeCave_News_01_08 " );	// Nothing to be interesting.
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_09");	//Ладно.
	B_LogEntry(TOPIC_StrangeCave, " Balam said that one of his harvesters had a glimpse of a shadow in the cave. However, there was nothing inside except meat bugs. " );
};


instance DIA_BALAM_StrangeCave_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_Done_condition;
	information = dia_balam_StrangeCave_Done_info;
	permanent = FALSE;
	description = " I figured out what was in the cave. " ;
};

func int dia_balam_StrangeCave_Done_condition()
{
	if((MIS_StrangeCave == LOG_Running) && (StrangeCaveMageIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Balam_StrangeCave_Done_01_01 " );	// I figured out what was in the cave.
	AI_Output(self,other, " DIA_Balam_StrangeCave_Done_01_02 " );	// And who made these sounds at night?
	AI_Output(other,self, " DIA_Balam_StrangeCave_Done_01_03 " );	// Ordinary evil spirits. But rest easy, now she won't bother you anymore.
	AI_Output(self,other, " DIA_Balam_StrangeCave_Done_01_04 " );	// Hope you're right.
	AI_Output(self,other, " DIA_Balam_StrangeCave_Done_01_05 " );	// Okay, here, take it for your work. You rightfully deserve this award!
	B_GiveInvItems(self,other,ItMi_Joint,10);
	B_LogEntry(TOPIC_StrangeCave, " I told Balam that the problem in the cave is over. " );
	Log_CreateTopic(TOPIC_StrangeCave,LOG_SUCCESS);
	MIS_StrangeCave = LOG_SUCCESS;
};

instance DIA_BALAM_Proviant(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_Proviant_condition;
	information = dia_balam_Proviant_info;
	permanent = FALSE;
	description = " How are things? " ;
};

func int dia_balam_Proviant_condition()
{
	if(MIS_StrangeCave == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_balam_Proviant_info()
{
	AI_Output(other,self, " DIA_Balam_Proviant_01_01 " );	// How are things going?
	AI_Output(self,other, " DIA_Balam_Proviant_01_02 " );	// So far everything seems to be unchanged.
	AI_Output(self,other, " DIA_Balam_Proviant_01_03 " );	// However, we will soon need to replenish our food supplies. Those that remain are almost gone.
	AI_Output(other,self, " DIA_Balam_Proviant_01_04 " );	// And do you have any ideas about this?
	AI_Output(self,other, " DIA_Balam_Proviant_01_05 " );	// Hmmm... (thoughtfully) There's usually a whole flock of mountain scavengers grazing near the camp during the day.
	AI_Output(self,other, " DIA_Balam_Proviant_01_06 " );	// I guess it would be nice to shoot a couple of them.
	AI_Output(self,other, " DIA_Balam_Proviant_01_07 " );	// This meat would be enough for us for a couple of weeks for sure!
	AI_Output(other,self, " DIA_Balam_Proviant_01_08 " );	// And who do you want to send to hunt?
	AI_Output(self,other, " DIA_Balam_Proviant_01_09 " );	// At first, I wanted to ask Tyrax about this. But lately he has been kind of irritable, which is unlikely to listen to me.
	AI_Output(self,other, " DIA_Balam_Proviant_01_10 " );	// That's why I want to offer this job to you. How do you not mind?
	AI_Output(other,self, " DIA_Balam_Proviant_01_11 " );	// Why not. It's much better than dying of boredom all day long.
	AI_Output(self,other, " DIA_Balam_Proviant_01_12 " );	// Okay, then I can count on you.
	AI_Output(other,self, " DIA_Balam_Proviant_01_13 " );	// And where exactly do mountain scavengers graze?
	AI_Output(self,other, " DIA_Balam_Proviant_01_14 " );	// If you walk straight from our tent, you'll just run into that place.
	AI_Output(self,other, " DIA_Balam_Proviant_01_15 " );	// But be careful! These birds, although seemingly defenseless, can peck you to death.
	AI_Output(other,self, " DIA_Balam_Proviant_01_16 " );	// Don't worry, it's not the first time I've hunted them.
	AI_Output(self,other, " DIA_Balam_Proviant_01_17 " );	// Well, if so, then I look forward to your return. And hopefully not empty handed.
	AI_Output(self,other, " DIA_Balam_Proviant_01_18 " );	// Bring as much meat as you can carry.
	Log_CreateTopic(TOPIC_BalamProviant,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalamProviant,LOG_Running);
	B_LogEntry(TOPIC_BalamProviant, " Balam needs to replenish his supplies. He asked me to hunt mountain scavengers near the camp. " );
	MIS_BalamProviant = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_01");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_02");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_03");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_04");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_05");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_06");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_07");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_08");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_09");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_10");
};

instance DIA_BALAM_Proviant_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_Proviant_Done_condition;
	information = dia_balam_Proviant_Done_info;
	permanent = FALSE;
	description = " I brought you mountain scavenger meat. " ;
};

func int dia_balam_Proviant_Done_condition()
{
	if((MIS_BalamProviant == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw_Mount) >= 1))
	{
		return TRUE;
	};
};

func void dia_balam_Proviant_Done_info()
{
	var int Raw_Mount;
	var int Xp_Raw_Mount;

	AI_Output(other,self, " DIA_Balam_Proviant_Done_01_01 " );	// I brought you mountain scavenger meat.
	AI_Output(self,other, " DIA_Balam_Proviant_Done_01_02 " );	// Great! And how much did you manage to get?
	AI_Output(other,self, " DIA_Balam_Proviant_Done_01_03 " );	// Here, take a look for yourself.

	Raw_Mount = Npc_HasItems(other,ItFoMuttonRaw_Mount);
	Xp_Raw_Mount = Raw_Mount * 10;

	B_GivePlayerXP(Xp_Raw_Mount);
	B_GiveInvItems(other,self,ItFoMuttonRaw_Mount,Raw_Mount);
	Npc_RemoveInvItems(self,ItFoMuttonRaw_Mount,Raw_Mount);

	if(Raw_Mount >= 10)
	{
		AI_Output(self,other, " DIA_Balam_Proviant_Done_01_04 " );	// Yes, there is exactly as much meat as needed. I see you've had a good hunt!
		AI_Output(self,other, " DIA_Balam_Proviant_Done_01_05 " );	// Then here, take this drink and some gold for your troubles.
		AI_Output(self,other, " DIA_Balam_Proviant_Done_01_06 " );	// Unfortunately, that's the most I can thank you for right now.
		AI_Output(other,self, " DIA_Balam_Proviant_Done_01_07 " );	// This is enough for me. It's also nice when your work is appreciated in this way.
		AI_Output(self,other, " DIA_Balam_Proviant_Done_01_08 " );	// (smiling) No doubt.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItMi_Gold,150);
		CreateInvItems(other,ITPO_FALLDEFENCE,1);
	}
	else if(Raw_Mount >= 4)
	{
		AI_Output(self,other, " DIA_Balam_Proviant_Done_01_09 " );	// Not bad. Although, to be honest, I expected a little more meat from you.
		AI_Output(self,other, " DIA_Balam_Proviant_Done_01_10 " );	// Oh well. I think this is enough for now. Here, take this gold for your troubles.
		B_GiveInvItems(self,other,ItMi_Gold,75);
	}
	else
	{
		AI_Output(self,other, " DIA_Balam_Proviant_Done_01_12 " );	// Hmmm... Apparently you're not a very good hunter for bringing me so little meat.
		AI_Output(self,other, " DIA_Balam_Proviant_Done_01_13 " );	// Though I'm grateful for your help anyway.
	};

	B_LogEntry(TOPIC_BalamProviant, " I brought mountain carrion meat to Balam. The bog harvesters won't go hungry. " );
	Log_CreateTopic(TOPIC_BalamProviant,LOG_SUCCESS);
	MIS_BalamProviant = LOG_SUCCESS;
};

instance DIA_BALAM_AssassinsAttack (C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_AssasinsAttack_condition;
	information = dia_balam_AssassinsAttack_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};

func int dia_balam_AssasinsAttack_condition()
{
	if((MIS_TiraksFur == LOG_SUCCESS) && (AssasinsAttackCamp == FALSE))
	{
		return TRUE;
	};
};

func void dia_balam_AssassinsAttack_info()
{
	AI_Output(other,self, " DIA_Balam_AssasinsAttack_01_01 " );	// Is everything okay?

	if (Wld_IsTime( 20 , 59 , 7 , 59 ))
	{
		AI_Output(self,other, " DIA_Balam_AssasinsAttack_01_02 " );	// You can't imagine better... (relaxedly) The last days in the camp were extremely calm.
		AI_Output(self,other, " DIA_Balam_AssasinsAttack_01_03 " );	// And it's all thanks to you and those guards that Gor Na Tof sent.
		AI_Output(self,other, " DIA_Balam_AssasinsAttack_01_04 " );	// I don't think we're in danger here...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other, " DIA_Balam_AssasinsAttack_01_05 " );	// Hmmm...(alarmed) Did you hear that?
		Info_ClearChoices(DIA_Balam_AssasinsAttack);
		Info_AddChoice(DIA_Balam_AssasinsAttack, " What exactly? " ,dia_balam_AssasinsAttack_Done);
	}
	else
	{
		AI_Output(self,other, " DIA_Balam_AssasinsAttack_01_08 " );	// As you can see. But we'd better talk about it later. In the evening.
		AI_Output(self,other, " DIA_Balam_AssasinsAttack_01_09 " );	// Now I have to look after the faucets.
		AI_StopProcessInfos(self);
	};
};

func void dia_balam_AssasinsAttack_Done()
{
	AI_Output(other,self, " DIA_Balam_AssasinsAttack_01_06 " );	// What exactly?
	AI_Output(self,other, " DIA_Balam_AssasinsAttack_01_07 " );	// Watch out from behind!
	AssasinsAttackCamp = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_121_Adept,"NW_FOREST_ASS_START_01");
	Wld_InsertNpc(Ass_122_Adept,"NW_FOREST_ASS_START_02");
	Wld_InsertNpc(Ass_123_Adept,"NW_FOREST_ASS_START_03");
	Wld_InsertNpc(Ass_124_Adept,"NW_FOREST_ASS_START_04");
};
