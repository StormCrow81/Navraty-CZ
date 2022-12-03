

instance DMT_1219_NARUS_EXIT (C_Info)
{
	npc = dmt_1219_narus;
	nr = 999;
	condition = dmt_1219_narus_exit_condition;
	information = dmt_1219_narus_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1219_narus_exit_condition()
{
	return TRUE;
};

func void dmt_1219_narus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1219_NARUS_HELLO(C_Info)
{
	npc = dmt_1219_narus;
	condition = dmt_1219_narus_hello_condition;
	information = dmt_1219_narus_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1219_narus_hello_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running) && ( STREETS_AGREE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dmt_1219_narus_hello_info()
{
	AI_Output(self,other, " DMT_1219_Narus_Hello_00 " );	// (smartly) So, here you are.
	AI_Output(self,other, " DMT_1219_Narus_Hello_01 " );	// Honestly, I'm a little surprised by our meeting. I didn't think you could get this far!
	AI_Output(self,other, " DMT_1219_Narus_Hello_02 " );	// But, apparently, some divine power keeps you from danger and helps you overcome this difficult path.
	AI_Output(self,other, " DMT_1219_Narus_Hello_03 " );	// Well, that's a good sign.
	AI_Output(other,self,"DMT_1219_Narus_Hello_04");	//Кто ты?
	AI_Output(self,other, " DMT_1219_Narus_Hello_05 " );	// (powerfully) I am Narus. The second guardian of the sacred waters of Adana and the sixth guardian of the sacred gates!
	AI_Output(self,other, " DMT_1219_Narus_Hello_06 " );	// And I'm here to challenge you for your next test.
	AI_Output(self,other, " DMT_1219_Narus_Hello_07 " );	// Of course, looking at the path you have already traveled, it may seem that my assignment will not be difficult for you.
	AI_Output(self,other, " DMT_1219_Narus_Hello_08 " );	// You have already proven to many people what you are really capable of, and, I think, you yourself are now full of confidence that you have almost reached your main goal.
	AI_Output(self,other, " DMT_1219_Narus_Hello_09 " );	// Now it's time to pass my test. Are you ready?
	Info_ClearChoices(dmt_1219_narus_hello);
	Info_AddChoice(dmt_1219_narus_hello, " Yes, I'm ready . " ,dmt_1219_narus_hello_test);
};

func void dmt_1219_narus_hello_test()
{
	AI_Output(other,self, " DMT_1219_Narus_Hello_10 " );	// Yes, I'm ready.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1219_Narus_Hello_11 " );	// Then listen to me carefully.
	AI_Output(self,other, " DMT_1219_Narus_Hello_12 " );	// As I stood here, waiting for you to arrive soon, I thought deeply about the passage of time and how it slips away from us like sand through our fingers.
	AI_Output(self,other, " DMT_1219_Narus_Hello_13 " );	// In my thoughts, I apparently did not notice at all how I accidentally dropped my sapphire ring down.
	AI_Output(self,other, " DMT_1219_Narus_Hello_14 " );	// I think it fell into that deep pool below us...
	AI_Output(self,other, " DMT_1219_Narus_Hello_15 " );	// This thing is very dear to me and I want it back!
	AI_Output(self,other, " DMT_1219_Narus_Hello_16 " );	// So don't be surprised if this test is likely to sound like a simple request to you.
	AI_Output(self,other, " DMT_1219_Narus_Hello_17 " );	// And it's simple: find my lost ring and bring it back to me.
	AI_Output(other,self, " DMT_1219_Narus_Hello_18 " );	// Good. I will find your ring, master.
	AI_Output(self,other, " DMT_1219_Narus_Hello_19 " );	// Then I'll wait for you with him. Go!
	AI_StopProcessInfos(self);
	MIS_NARUSTEST = LOG_Running;
	Wld_InsertItem(itri_narus, " FP_ITEM_NARUSRING " );
	Log_CreateTopic(TOPIC_NARUSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NARUSTEST,LOG_Running);
	; _ _ _ _ _ _
};


instance DMT_1219_NARUS_TEST(C_Info)
{
	npc = dmt_1219_narus;
	nr = 1;
	condition = dmt_1219_narus_test_condition;
	information = dmt_1219_narus_test_info;
	permanent = FALSE;
	description = " I found your ring. " ;
};


func int dmt_1219_narus_test_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running ) && ( MY_NARUTEST  == LOG_Running ) && ( Npc_HasItems ( other , itri_narus ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dmt_1219_narus_test_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DMT_1219_Narus_Test_00 " );	// I found your ring.
	AI_Output(self,other, " DMT_1219_Narus_Test_01 " );	// Good. If so, show me!
	AI_Output(other,self, " DMT_1219_Narus_Test_02 " );	// Here, look.
	AI_Output(self,other, " DMT_1219_Narus_Test_03 " );	// Hmmm. Yes, it seems that there can be no doubts here - this is really it!
	AI_Output(other,self, " DMT_1219_Narus_Test_04 " );	// Then I return this ring to you, master.
	AI_Output(self,other, " DMT_1219_Narus_Test_05 " );	// Wait! Don't rush to give it to me. It seems to me that it would be better if this thing stays with you for a while.
	AI_Output(self,other, " DMT_1219_Narus_Test_06 " );	// (smartly) I'm sure it will come in handy for you and yourself more than once. You can be sure of it!
	AI_Output(self,other, " DMT_1219_Narus_Test_07 " );	// I'm guessing this isn't the first item you've received from the Guardians?
	AI_Output(other,self, " DMT_1219_Narus_Test_08 " );	// Yes, you're right. Guardian Dagoth also gave me one ring.
	AI_Output(other,self, " DMT_1219_Narus_Test_09 " );	// True, he never explained to me why it was needed.
	AI_Output(self,other, " DMT_1219_Narus_Test_10 " );	// Everything in its turn, hero of the times... (insinuatingly) You still have time to know the true meaning of these rings.
	AI_Output(self,other, " DMT_1219_Narus_Test_11 " );	// But this will only happen when the time is right.
	AI_Output(other,self, " DMT_1219_Narus_Test_12 " );	// I got it, master.
	AI_Output(self,other, " DMT_1219_Narus_Test_13 " );	// (powerfully) Good. Now back to your test.
	AI_Output(self,other, " DMT_1219_Narus_Test_14 " );	// As I expected, you managed to fulfill all the conditions I set in order to successfully pass it.
	AI_Output(self,other, " DMT_1219_Narus_Test_15 " );	// And you did it!
	MIS_NARUSTEST = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_NARUSTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_NARUSTEST , " Keeper Narus was pleased that I managed to find his ring. As a reward, he gave it to me and recognized that he passed his test. " );
	Info_ClearChoices(dmt_1219_narus_test);
	Info_AddChoice(dmt_1219_narus_test, " So now I can count on your consent? " ,dmt_1219_narus_test_pass);
};

func void dmt_1219_narus_test_pass()
{
	AI_Output(other,self, " DMT_1219_Narus_Test_16 " );	// So now I can count on your consent?
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	B_LogEntry( TOPIC_GUARDIANSTEST , " I was able to secure the consent of Guardian Narusa. " );
	NARUS_AGREE = TRUE ;
	AI_Output(self,other, " DMT_1219_Narus_Test_17 " );	// (imperiously) Of course, so! And by the power given to me by the sacred waters of Adan, I give it to you!
	AI_Output(self,other, " DMT_1219_Narus_Test_18 " );	// Let this help you take one more step on the path that you have chosen for yourself.
	AI_Output(self,other, " DMT_1219_Narus_Test_19 " );	// Now go. Look for the last Guardian of Water - Wakon.
	AI_Output(self,other, " DMT_1219_Narus_Test_20 " );	// He will give you your final test, after which you can meet with the head of our Circle.
	AI_Output(self,other,"DMT_1219_Narus_Test_21");	//Прощай!
	Info_ClearChoices(dmt_1219_narus_test);
	Info_AddChoice(dmt_1219_narus_test, " (end conversation) " ,dmt_1219_narus_test_end);
};

func void dmt_1219_narus_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

