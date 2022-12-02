

instance DIA_NASH_EXIT(C_Info)
{
	npc = vlk_6010_nash;
	nr = 999;
	condition = dia_nash_exit_condition;
	information = dia_nash_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nash_exit_condition()
{
	return TRUE;
};

func void dia_nash_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NASH_HELLO(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_condition;
	information = dia_nash_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " Hey man, how are you? " ;
};


func int dia_nash_hello_condition()
{
	if(MEETNASH == FALSE)
	{
		return TRUE;
	};
};

func void dia_nash_hello_info()
{
	AI_Output(other,self, " DIA_Nash_Hello_01_01 " );	// Hey man, how are you?
	AI_Output(self,other, " DIA_Nash_Hello_01_02 " );	// Fine, mate. Are you the newbie who recently showed up at camp?
	AI_Output(other,self, " DIA_Nash_Hello_01_03 " );	// Yes, it's me. So what?
	AI_Output(self,other, " DIA_Nash_Hello_01_04 " );	// If you want to know my opinion, then I think you're just crazy! You've definitely gone crazy!
	AI_Output(self,other, " DIA_Nash_Hello_01_05 " );	// Do you have any idea where you've ended up? If I were you, I would have left this place a long time ago.
	AI_Output(other,self, " DIA_Nash_Hello_01_06 " );	// But you're not in my place...
	AI_Output(self,other, " DIA_Nash_Hello_01_07 " );	// Come on, don't be offended. It's just that I couldn't even think that someone would dare to come here like that, and even of their own free will.
	AI_Output(self,other, " DIA_Nash_Hello_01_08 " );	// You must be a very brave guy...
	AI_Output(other,self,"DIA_Nash_Hello_01_09");	//А ты нет?
	AI_Output(self,other, " DIA_Nash_Hello_01_10 " );	// Me? No, buddy. It's better for me to sit here in the cave. Away from any troubles there!
	AI_Output(other,self, " DIA_Nash_Hello_01_11 " );	// And you're stuck in this cave all day?
	AI_Output(self,other, " DIA_Nash_Hello_01_12 " );	// Yes. And I can't say that I don't like it.
	AI_Output(other,self, " DIA_Nash_Hello_01_13 " );	// What are you doing here anyway?
	AI_Output(self,other, " DIA_Nash_Hello_01_14 " );	// I help Hasan guard the warehouse when he's resting. Anyway, I'm not a good hunter.
	AI_Output(self,other, " DIA_Nash_Hello_01_15 " );	// Not like Bagrus, for example, or Gunmar! These guys know their stuff.
	AI_Output(self,other, " DIA_Nash_Hello_01_16 " );	// Well, besides, someone has to make sure that the guys don't starve to death when they come back from the hunt.
	AI_Output(other,self, " DIA_Nash_Hello_01_17 " );	// Are you a chef?
	AI_Output(self,other, " DIA_Nash_Hello_01_18 " );	// Well, sort of. I am especially good at meat soup with the addition of dried root vegetables. Just lick your fingers!
	AI_Output(self,other, " DIA_Nash_Hello_01_19 " );	// I bet that hardly anyone can even cook something like my soup.
	AI_Output(self,other, " DIA_Nash_Hello_01_20 " );	// Would you like to try?
	Info_ClearChoices(dia_nash_hello);
	Info_AddChoice(dia_nash_hello, " With pleasure. " ,dia_nash_hello_yes);
	Info_AddChoice(dia_nash_hello, " No thanks. " ,dia_nash_hello_no);
};

func void dia_nash_hello_yes()
{
	AI_Output(other,self, " DIA_Nash_Hello_01_21 " );	// With pleasure...
	AI_Output(self,other,"DIA_Nash_Hello_01_22");	//Держи.
	CreateInvItems(other,itfo_nashsoup,1);
	B_UseItem(other,itfo_nashsoup);
	AI_Output(self,other, " DIA_Nash_Hello_01_23 " );	// Well, how?
	Info_ClearChoices(dia_nash_hello);
	Info_AddChoice(dia_nash_hello, " Noble soup! " ,dia_nash_hello_ok);
	Info_AddChoice(dia_nash_hello, " Not really. " ,dia_nash_hello_not);
};

func void dia_nash_hello_no()
{
	AI_Output(other,self, " DIA_Nash_Hello_01_24 " );	// No thanks.
	AI_Output(self,other, " DIA_Nash_Hello_01_25 " );	// Well, it's up to you, of course. Even though you refused...
	MEETNASH = TRUE;
};

func void dia_nash_hello_ok()
{
	AI_Output(other,self, " DIA_Nash_Hello_01_26 " );	// Noble soup!
	AI_Output(self,other, " DIA_Nash_Hello_01_27 " );	// I knew you'd like it. No one has turned up their nose yet!
	AI_Output(other,self, " DIA_Nash_Hello_01_28 " );	// True, your soup tastes kind of weird.
	AI_Output(self,other, " DIA_Nash_Hello_01_29 " );	// For the first time, yes, there are a few. But then you get used to it and you already look - but you can’t drag you off the plate and by the ears! (laughs)
	AI_Output(other,self, " DIA_Nash_Hello_01_30 " );	// Whose meat was in the soup?
	AI_Output(self,other, " DIA_Nash_Hello_01_31 " );	// To be honest, you're better off not knowing...
	AI_StopProcessInfos(self);
	NASH_STEW_DAY = World_GetDay();
	MEETNASH = TRUE;
	NASHREADYTEACH = TRUE;
};

func void dia_nash_hello_not()
{
	AI_Output(other,self, " DIA_Nash_Hello_01_33 " );	// Yes, somehow not very.
	AI_Output(self,other, " DIA_Nash_Hello_01_34 " );	// Strange. For the guys in the camp, he just goes with a bang. They also ask for supplements!
	AI_Output(other,self, " DIA_Nash_Hello_01_35 " );	// Well, then I'll be the first to not ask her.
	AI_Output(self,other, " DIA_Nash_Hello_01_36 " );	// Too bad you didn't like it. But as they say, the taste and color ...
	AI_StopProcessInfos(self);
	MEETNASH = TRUE;
};


instance DIA_NASH_HELLO_VALLEY(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_valley_condition;
	information = dia_nash_hello_valley_info;
	permanent = TRUE;
	important = FALSE;
	description = " Can you tell me something about the valley? " ;
};


func int dia_nash_hello_valley_condition()
{
	if((MEETNASH == TRUE) && (ASKNASHVALLEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_nash_hello_valley_info()
{
	AI_Output(other,self, " DIA_Nash_Hello_Valley_01_01 " );	// Can you tell me something about the valley?
	AI_Output(self,other, " DIA_Nash_Hello_Valley_01_02 " );	// Probably not, mate. You better talk to Elvais or the other guys about it.
	AI_Output(self,other, " DIA_Nash_Hello_Valley_01_03 " );	// They know the area better than I do.
	AI_Output(other,self, " DIA_Nash_Hello_Valley_01_04 " );	// Well, maybe they told you something?
	AI_Output(self,other, " DIA_Nash_Hello_Valley_01_05 " );	// Hmm...let me think...
	if(NASHREADYTEACH == TRUE)
	{
		AI_Output(self,other, " DIA_Nash_Hello_Valley_01_06 " );	// I remember, Carrock, one of the hunters once told me how he stumbled upon some strange underground ... either a crypt, or a temple ...
		AI_Output(self,other, " DIA_Nash_Hello_Valley_01_07 " );	// I don't remember anymore... He said it was somewhere to the east of our camp... it was so long ago.
		AI_Output(other,self, " DIA_Nash_Hello_Valley_01_08 " );	// And where is Carrock himself now?
		AI_Output(self,other, " DIA_Nash_Hello_Valley_01_09 " );	// Unfortunately, one day he went hunting and never came back.
		AI_Output(self,other, " DIA_Nash_Hello_Valley_01_10 " );	// He kept saying that he wanted to try to get into that underground temple again.
		AI_Output(self,other, " DIA_Nash_Hello_Valley_01_11 " );	// Maybe that's where he found his destiny...
		B_LogEntry( TOPIC_URNAZULRAGE , " In the camp, I met a guy named Nash. He said that one hunter from the camp named Carrock, at one time found the entrance to an underground temple, somewhere in the east of the valley. Unfortunately, I did not I can ask about it, because no one has seen him since. Apparently, he died trying to get into the temple itself. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Nash_Hello_Valley_01_12 " );	// No... I don't remember anything like that... Sorry, man.
		AI_Output(other,self, " DIA_Nash_Hello_Valley_01_13 " );	// Well, there is no trial.
	};
	ASKNASHVALLEY = TRUE;
};


instance DIA_NASH_HELLO_SOUPAGAIN(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_soupagain_condition;
	information = dia_nash_hello_soupagain_info;
	permanent = TRUE;
	important = FALSE;
	description = " Give me more of your soup. " ;
};


func int dia_nash_hello_soupagain_condition()
{
	if((MEETNASH == TRUE) && (NASHREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_nash_hello_soupagain_info()
{
	AI_Output(other,self, " DIA_Nash_Hello_SoupAgain_01_01 " );	// Give me some more of your soup.
	if ( NASH_STEW_DAY  != Wld_GetDay())
	{
		B_GiveInvItems(self,other,itfo_nashsoup,1);
		AI_Output(self,other, " DIA_Nash_Hello_SoupAgain_01_02 " );	// Here, take this...
		NASH_STEW_DAY = World_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Nash_Hello_SoupAgain_01_03 " );	// You already got your portion today! Come tomorrow.
	};
};

instance DIA_Nash_Shield(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = DIA_Nash_Shield_condition;
	information = DIA_Nash_Shield_info;
	permanent = FALSE;
	description = " I see you're wearing a shield. " ;
};

func int DIA_Nash_Shield_condition()
{
	if((MEETNASH == TRUE) && (hero.attribute[ATR_REGENERATEMANA] >= 1))
	{
		return TRUE;
	};
};

func void DIA_Nash_Shield_info()
{
	AI_Output(other,self, " DIA_Nash_Shield_01_01 " );	// I see you're wearing a shield.
	AI_Output(self,other, " DIA_Nash_Shield_01_02 " );	// Does that surprise you? In a place like this, a strong shield can save your life!
	AI_Output(self,other, " DIA_Nash_Shield_01_04 " );	// If, of course, you know how to handle it.
	AI_Output(other,self, " DIA_Nash_Shield_01_05 " );	// Can you train me to fight him?
	AI_Output(self,other, " DIA_Nash_Shield_01_06 " );	// Of course I can! But for this you must at least understand a little about this matter.
	AI_Output(self,other, " DIA_Nash_Shield_01_07 " );	// For a green beginner, my lessons will be absolutely useless.
	AI_Output(self,other, " DIA_Nash_Shield_01_08 " );	// Plus, you'll have to pay for them.
	AI_Output(self,other, " DIA_Nash_Shield_01_09 " );	// But not gold, as you might think! For us, his ringing here means little.
	AI_Output(other,self, " DIA_Nash_Shield_01_10 " );	// What do you want?
	AI_Output(self,other, " DIA_Nash_Shield_01_11 " );	// Food, of course! We have a lot of problems with her.
	AI_Output(self,other, " DIA_Nash_Shield_01_12 " );	// Therefore, in order for me to train you, you will bring me fifty pieces of fresh meat.
	AI_Output(other,self, " DIA_Nash_Shield_01_13 " );	// Okay, I'll think about your suggestion.
	MIS_MeetNashShield = LOG_Running;
	Log_CreateTopic(TOPIC_MeetNashShield,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MeetNashShield,LOG_Running);
	B_LogEntry(TOPIC_MeetNashShield, " Nash can teach me how to use the shield. However, for this he asked me to bring him fifty pieces of meat. " );
};

instance DIA_Nash_ShieldDone(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = DIA_Nash_ShieldDone_condition;
	information = DIA_Nash_ShieldDone_info;
	permanent = FALSE;
	description = " Here's your meat. " ;
};

func int DIA_Nash_ShieldDone_condition()
{
	if((MIS_MeetNashShield == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 50))
	{
		return TRUE;
	};
};

func void DIA_Nash_ShieldDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Nash_ShieldDone_01_01 " );	// Here's your meat.
	B_GiveInvItems(other,self,ItFoMuttonRaw,50);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,50);
	AI_Output(other,self, " DIA_Nash_ShieldDone_01_02 " );	// Now will you teach me your tricks?
	AI_Output(self,other, " DIA_Nash_ShieldDone_01_03 " );	// (pretty) Of course. The main thing is that you have enough experience for my lessons.
	AI_Output(self,other, " DIA_Nash_ShieldDone_01_04 " );	// Just tell me when you're ready to start training.
	MIS_MeetNashShield = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MeetNashShield,LOG_SUCCESS);
	B_LogEntry(TOPIC_MeetNashShield, " I brought Nash fifty pieces of meat. Now he'll show me his shield techniques. " );
};

instance DIA_Nash_Shield_Teach(C_Info)
{
	npc = vlk_6010_nash;
	nr = 7;
	condition = DIA_Nash_Shield_Teach_Condition;
	information = DIA_Nash_Shield_Teach_Info;
	permanent = TRUE;
	description = " Teach me how to use a shield better. " ;
};

func int DIA_Nash_Shield_Teach_Condition()
{
	if((MIS_MeetNashShield == LOG_SUCCESS) && ((hero.attribute[ATR_REGENERATEMANA] <= 100) || (SkillBlockShield == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Nash_Shield_Teach_Info()
{
	AI_Output(other,self, " DIA_Nash_Shield_Teach_15_00 " );	// Teach me how to use a shield better.
	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_Back()
{
	Info_ClearChoices(DIA_Nash_Shield_Teach);
};

func void DIA_Nash_Shield_Teach_Block()
{
	AI_Output(other,self, " DIA_Nash_Shield_Teach_Block_01_00 " );	// Teach me how to block magic damage with a shield.

	if(hero.lp >= 10)
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		AI_Output(self,other, " DIA_Nash_Shield_Teach_Block_01_01 " );	// It all depends on your skill and the strength of the shield itself.
		AI_Output(self,other, " DIA_Nash_Shield_Teach_Block_01_02 " );	// You won't be able to block all magic damage, but you can weaken it.
		AI_Output(self,other, " DIA_Nash_Shield_Teach_Block_01_03 " );	// If your shield is able to withstand a magical attack, it will absorb some of the damage.
		AI_Output(self,other, " DIA_Nash_Shield_Teach_Block_01_04 " );	// Well, if not...
		AI_Output(self,other, " DIA_Nash_Shield_Teach_Block_01_05 " );	// That's why try to get a decent shield first! The rest will follow by itself.
		AI_Print( " Shield combat trained! " );
		Snd_Play("LevelUP");
		SkillBlockShield = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Nash_Shield_Teach_Block_01_06 " );	// You don't have enough experience!
	};

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_1()
{
	B_TeachShieldNoMoney(self,other,1,100);

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_5()
{
	B_TeachShieldNoMoney(self,other,5,100);

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};
