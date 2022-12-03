

instance DMT_1217_FARION_EXIT(C_Info)
{
	npc = dmt_1217_farion;
	nr = 999;
	condition = dmt_1217_farion_exit_condition;
	information = dmt_1217_farion_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1217_farion_exit_condition()
{
	return TRUE;
};

func void dmt_1217_farion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1217_FARION_HELLO(C_Info)
{
	npc = dmt_1217_farion;
	condition = dmt_1217_farion_hello_condition;
	information = dmt_1217_farion_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1217_farion_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (DEMOS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1217_farion_hello_info()
{
	AI_Output(self,other, " DMT_1217_Farion_Hello_00 " );	// (imperiously) Stop, man! Stop!
	AI_Output(other,self, " DMT_1217_Farion_Hello_01 " );	// Who are you? And why are you talking to me like that?
	AI_Output(self,other, " DMT_1217_Farion_Hello_02 " );	// In front of you is Farion - the last of the guardians of the sacred Fire and the fifth Keeper of the sacred Halls of Wakhan!
	AI_Output(other, self, " DMT_1217_Farion_Hello_03 " );	// If so, then it's time for my next test. I'm right?
	AI_Output(self,other, " DMT_1217_Farion_Hello_04 " );	// You're quick-witted, mortal... (maliciously) That's why I came into this world.
	AI_Output(self,other, " DMT_1217_Farion_Hello_05 " );	// You have a great chance to prove to me that you are worthy to become an adept of our Circle.
	AI_Output(self,other, " DMT_1217_Farion_Hello_06 " );	// Judging by the words of other Guardians whose trials you have already passed, you can achieve a lot!
	AI_Output(self,other, " DMT_1217_Farion_Hello_07 " );	// But for now, I see only a weak person in front of me, unable even to resist the shadow of evil that has already enveloped this world.
	AI_Output(other,self, " DMT_1217_Farion_Hello_08 " );	// Well, then I'll try to change your opinion of yourself as soon as possible.
	AI_Output(self,other, " DMT_1217_Farion_Hello_09 " );	// (laughs) You can only do this if you pass the test that I have prepared for you.
	AI_Output(self,other, " DMT_1217_Farion_Hello_10 " );	// And you can be sure - it will not be easy!
	AI_Output(other,self, " DMT_1217_Farion_Hello_11 " );	// I didn't expect anything else.
	AI_Output(self,other, " DMT_1217_Farion_Hello_12 " );	// If so, answer - are you ready to accept it?
	Info_ClearChoices(dmt_1217_farion_hello);
	Info_AddChoice(dmt_1217_farion_hello, " Of course. " ,dmt_1217_farion_hello_test);
};

func void dmt_1217_farion_hello_test()
{
	AI_Output(other,self, " DMT_1217_Farion_Hello_13 " );	// Of course.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1217_Farion_Hello_14 " );	// (powerfully) Hmmm. You are cheeky, man!
	AI_Output(self,other, " DMT_1217_Farion_Hello_15 " );	// Let's see if this helps you. Listen carefully ... (powerfully)
	AI_Output(other,self, " DMT_1217_Farion_Hello_16 " );	// Yes, master.
	AI_Output(self,other, " DMT_1217_Farion_Hello_17 " );	// You probably already know that the sacred element of Fire can bestow both life and death... (grimly) In this case, fire chooses death!
	AI_Output(other,self, " DMT_1217_Farion_Hello_18 " );	// What does this mean?
	AI_Output(self,other, " DMT_1217_Farion_Hello_19 " );	// This means that you will serve me as an instrument of divine conduct and lay the life of one mortal on the sacrificial altar of fate.
	AI_Output(other,self, " DMT_1217_Farion_Hello_20 " );	// So I have to kill someone?!
	AI_Output(self,other, " DMT_1217_Farion_Hello_21 " );	// Not just anyone. Namely, the person to whom I myself will point out to you.
	AI_Output(self,other, " DMT_1217_Farion_Hello_22 " );	// Besides speaking, he doesn't quite look like an ordinary person.
	AI_Output(other, self, " DMT_1217_Farion_Hello_23 " );	// And who is he?
	AI_Output(self,other, " DMT_1217_Farion_Hello_24 " );	// (arrogantly) He is the paladin of Innos and a faithful servant of his god!
	AI_Output(other,self, " DMT_1217_Farion_Hello_25 " );	// Paladin of Innos?!
	AI_Output(self,other, " DMT_1217_Farion_Hello_26 " );	// I can see that you're a little surprised by this... (snidely) However, despite this, you will have to do it anyway - if you, of course, want to pass my test.
	AI_Output(other, self, " DMT_1217_Farion_Hello_27 " );	// Yes, master. I already knew that I had no choice.
	AI_Output(self,other, " DMT_1217_Farion_Hello_28 " );	// It's good that you understand that! And so that you finally stop doubting the correctness of your future actions, I will explain to you the reason why this must be done.
	AI_Output(other,self, " DMT_1217_Farion_Hello_29 " );	// Would be nice. After all, there must be a very good reason for killing a paladin!
	AI_Output(self,other, " DMT_1217_Farion_Hello_30 " );	// (maliciously) Don't worry, there really is such a thing.
	AI_Output(other,self, " DMT_1217_Farion_Hello_31 " );	// And what is it?
	AI_Output(self,other, " DMT_1217_Farion_Hello_32 " );	// Due to certain circumstances, it became known to me that the paladin whose life is to be sacrificed will be subjected to the ritual of conversion after his death!
	AI_Output(self,other, " DMT_1217_Farion_Hello_33 " );	// Do you know what this is?
	AI_Output(other,self, " DMT_1217_Farion_Hello_34 " );	// Quite a bit.
	AI_Output(self,other, " DMT_1217_Farion_Hello_35 " );	// It's very simple. He will be destined to become the Lord of Shadows and a faithful servant of the dark god.
	AI_Output(other,self, " DMT_1217_Farion_Hello_36 " );	// Lord of Shadows? And who is it?
	AI_Output(self,other, " DMT_1217_Farion_Hello_37 " );	// The Lords of Shadows are the generals of Beliar's army. Powerful creatures, endowed with great strength and driven by a thirst to destroy all life.
	AI_Output(self,other, " DMT_1217_Farion_Hello_38 " );	// They lead their legions of the dead into battle in the name of their master, to plunge this world into a void of darkness forever.
	AI_Output(self,other, " DMT_1217_Farion_Hello_39 " );	// That's why it's so important that you pass my test and destroy this evil at its very source!
	AI_Output(other, self, " DMT_1217_Farion_Hello_40 " );	// All right, master! Now I understand everything.
	AI_Output(other, self, " DMT_1217_Farion_Hello_41 " );	// What's the name of that paladin?
	AI_Output(self,other, " DMT_1217_Farion_Hello_42 " );	// His name is Sergio. You will find him in the Fire Mage Monastery.
	AI_Output(self,other, " DMT_1217_Farion_Hello_43 " );	// There he spends all his free time in prayer, trying to somehow save his soul.
	AI_Output(self,other, " DMT_1217_Farion_Hello_44 " );	// But that won't help him... (imperiously) His fate is already set!
	AI_Output(self,other, " DMT_1217_Farion_Hello_45 " );	// So get on your way. Find this man and put his soul to rest forever.
	AI_Output(self,other, " DMT_1217_Farion_Hello_46 " );	// I'll be waiting for you here. Now go!
	MIS_FARIONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_FARIONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FARIONTEST,LOG_Running);
	B_LogEntry( TOPIC_FARIONTEST , " Keeper Farion appointed an unusual test at first glance: to kill the paladin Sergio. After death, his soul will be betrayed by the ritual of conversion, and the Innos warrior will turn into the Lord of Shadows - a powerful and faithful servant of the dark god! It is necessary to destroy the emerging evil at the very beginning. Sergio spends time praying to Innos, trying to save his soul. We need to look for him in the monastery of the Fire Mages. " );
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(PAL_299_Sergio,"AwayMonastery");
};


instance DMT_1217_FARION_TEST(C_Info)
{
	npc = dmt_1217_farion;
	nr = 1;
	condition = dmt_1217_farion_test_condition;
	information = dmt_1217_farion_test_info;
	permanent = FALSE;
	important = TRUE;
};


func int dmt_1217_farion_test_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running) && ( MY_FARIONTEST  == LOG_Running) && ( SERGIOISDEAD  ==  TRUE ) && ( SERDAHISDEAD  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dmt_1217_farion_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DMT_1217_Farion_Test_00 " );	// (imperiously) You don't have to say anything. I already know that you succeeded in fulfilling my task.
	AI_Output(self,other, " DMT_1217_Farion_Test_01 " );	// You may still feel remorse for what you did, but trust me, you did the right thing.
	AI_Output(self,other, " DMT_1217_Farion_Test_02 " );	// In addition, by doing so, you also passed my test. And this is also important!
	Info_ClearChoices(dmt_1217_farion_test);
	Info_AddChoice(dmt_1217_farion_test, " So you will now give me your consent, master? " ,dmt_1217_farion_test_pass);
};

func void dmt_1217_farion_test_pass()
{
	AI_Output(other,self, " DMT_1217_Farion_Test_03 " );	// So you will now give me your consent, master?
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1217_Farion_Test_04 " );	// So it will be. You convinced me of your abilities and rightfully deserved this honor.
	AI_Output(self,other, " DMT_1217_Farion_Test_05 " );	// Therefore, in the name of the sacred Fire, I give my consent to accept you as an adherent of the Circle of Guardians.
	AI_Output(self,other, " DMT_1217_Farion_Test_07 " );	// (imperiously) Now go... Make your way and look for the next one of us.
	AI_Output(self,other, " DMT_1217_Farion_Test_08 " );	// And let the great mystery of Fire endow your actions with its wisdom!
	MIS_FARIONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FARIONTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_FARIONTEST , " I passed the Farion Keeper test. " );
	Log_AddEntry( TOPIC_GUARDIANSTEST , " I have received from Guardian Farion his consent to accept me as an adept in the Circle of Guardians. " );
	FARION_AGREE = TRUE;
	Info_ClearChoices(dmt_1217_farion_test);
	Info_AddChoice(dmt_1217_farion_test, " (end call) " ,dmt_1217_farion_test_end);
};

func void dmt_1217_farion_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

