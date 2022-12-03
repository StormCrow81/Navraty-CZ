

instance DMT_1218_GADER_EXIT(C_Info)
{
	npc = dmt_1218_streets;
	nr = 999;
	condition = dmt_1218_gader_exit_condition;
	information = dmt_1218_gader_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1218_gader_exit_condition()
{
	return TRUE;
};

func void dmt_1218_gader_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1218_GADER_HELLO (C_Info)
{
	npc = dmt_1218_streets;
	condition = dmt_1218_gader_hello_condition;
	information = dmt_1218_gader_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1218_gader_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (FARION_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1218_gader_hello_info()
{
	AI_Output(self,other, " DMT_1218_Gader_Hello_00 " );	// (imperiously) Greetings, wanderer.
	AI_Output(self,other, " DMT_1218_Gader_Hello_01 " );	// I probably shouldn't explain to you who I am. I think you understand this very well.
	AI_Output(other,self, " DMT_1218_Gader_Hello_02 " );	// Are you a Guardian?
	AI_Output(self,other, " DMT_1218_Gader_Hello_03 " );	// Yes. I am the Guardian of Gader, the first Guardian of Water and the sixth Guardian of the sacred Halls of Wakhan.
	AI_Output(self,other, " DMT_1218_Gader_Hello_04 " );	// And since we met, it means that you have already overcome most of your difficult path.
	AI_Output(self,other, " DMT_1218_Gader_Hello_05 " );	// Now it's time to go through the rest of it to complete the initiation into the adepts of our circle!
	AI_Output(self,other, " DMT_1218_Gader_Hello_06 " );	// Are you ready?
	Info_ClearChoices(dmt_1218_gader_hello);
	Info_AddChoice(dmt_1218_gader_hello, " Yes master, I'm ready. " ,dmt_1218_gader_hello_test);
};

func void dmt_1218_gader_hello_test()
{
	AI_Output(other,self, " DMT_1218_Gader_Hello_07 " );	// Yes master, I'm ready.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1218_Gader_Hello_08 " );	// Good! Then let's start.
	AI_Output(self,other, " DMT_1218_Gader_Hello_09 " );	// My trial will not contain any ulterior motive or mortal threat to your life.
	AI_Output(self,other, " DMT_1218_Gader_Hello_10 " );	// And, most likely, it will not seem too difficult for you compared to the assignments of other Guardians.
	AI_Output(self,other, " DMT_1218_Gader_Hello_11 " );	// All you have to do is make a small pilgrimage to the Valley of the Ancients in the northeastern lands of this island.
	AI_Output(self,other, " DMT_1218_Gader_Hello_12 " );	// People call this place Yarkendar. I think you have already been there several times, and I want to ask you to do it again.
	AI_Output(self,other, " DMT_1218_Gader_Hello_13 " );	// You will need to take a few magical artifacts to this valley, which I will now give you.
	AI_Output(self,other, " DMT_1218_Gader_Hello_14 " );	// Here, take them.
	CreateInvItems(self,itmi_gaderstone,5);
	B_GiveInvItems(self,other,itmi_gaderstone,5);
	AI_Output(other,self, " DMT_1218_Gader_Hello_15 " );	// Isn't that dangerous?
	AI_Output(self,other, " DMT_1218_Gader_Hello_16 " );	// (powerfully) No! The magic of these items is not capable of causing the slightest harm to anyone.
	AI_Output(self,other, " DMT_1218_Gader_Hello_17 " );	// But she will help restore this sacred place to its former glory and its lost power!
	AI_Output(other,self, " DMT_1218_Gader_Hello_18 " );	// Good. But how exactly am I supposed to dispose of these artifacts, master?
	AI_Output(self,other, " DMT_1218_Gader_Hello_19 " );	// It's very simple.
	AI_Output(self,other, " DMT_1218_Gader_Hello_20 " );	// As you probably know, there are several dilapidated temples in Yarkendar. In fact, there are only five of them.
	AI_Output(self,other, " DMT_1218_Gader_Hello_21 " );	// Once upon a time, the ancients themselves erected them to conduct their magical rituals there.
	AI_Output(self,other, " DMT_1218_Gader_Hello_22 " );	// It would seem that in appearance these stone ruins are not of particular interest.
	AI_Output(self,other, " DMT_1218_Gader_Hello_23 " );	// (smartly) Unless, of course, you know one thing.
	AI_Output(other,self, " DMT_1218_Gader_Hello_24 " );	// Which one exactly?
	AI_Output(self,other, " DMT_1218_Gader_Hello_25 " );	// Places of bookmarks for these buildings were not chosen randomly.
	AI_Output(other,self,"DMT_1218_Gader_Hello_26");	//То есть?
	AI_Output(self,other, " DMT_1218_Gader_Hello_27 " );	// Each of these places has an invisible energy aura that can amplify the influence of any magical substance hundreds of times!
	AI_Output(self,other, " DMT_1218_Gader_Hello_28 " );	// This also applies to the magic of the items you received.
	AI_Output(self,other, " DMT_1218_Gader_Hello_31 " );	// All you have to do is simply place one of the artifacts you have on the altar of each of these temples.
	AI_Output(other,self, " DMT_1218_Gader_Hello_35 " );	// Okay, I got it, master.
	AI_Output(self,other, " DMT_1218_Gader_Hello_36 " );	// Then go. And may the Water give you strength in your affairs.
	AI_StopProcessInfos(self);
	MIS_GADERTEST = LOG_Running;
	Log_CreateTopic(TOPIC_GADERTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GADERTEST,LOG_Running);
	B_LogEntry( TOPIC_GADERTEST , " Water Keeper Gader has asked me to make a pilgrimage to Yarkendar to lay five artifacts on the altars of the ruined Builder temples, which he has given me. The magic of these items will help restore the temples to their former grandeur and lost power. " );
};

instance DMT_1218_GADER_TEST (C_Info)
{
	npc = dmt_1218_streets;
	nr = 1;
	condition = dmt_1218_gader_test_condition;
	information = dmt_1218_gader_test_info;
	permanent = FALSE;
	description = " I've done what you asked me to do, master. " ;
};


func int dmt_1218_gader_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1218_gader_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DMT_1218_Gader_Test_00 " );	// I've done what you asked, master.
	AI_Output(self,other, " DMT_1218_Gader_Test_01 " );	// (powerfully) And thus passed my test.
	AI_Output(self,other, " DMT_1218_Gader_Test_02 " );	// Your progress makes me think that you can easily pass through any trial and reach your ultimate goal!
	AI_Output(self,other, " DMT_1218_Gader_Test_03 " );	// Although I didn't expect anything else.
	MIS_GADERTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GADERTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_GADERTEST , " I completed Gader's errand and passed his test. " );
	Info_ClearChoices(dmt_1218_gader_test);
	Info_AddChoice(dmt_1218_gader_test, " Can I get your consent then? " ,dmt_1218_gader_test_pass);
};

func void dmt_1218_gader_test_pass()
{
	AI_Output(other,self, " DMT_1218_Gader_Test_04 " );	// Then can I get your consent, master?
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1218_Gader_Test_05 " );	// Sure! And I give it to you with great pleasure.
	AI_Output(self,other, " DMT_1218_Gader_Test_06 " );	// Now look for Narus, the second Water Guardian.
	AI_Output(self,other, " DMT_1218_Gader_Test_07 " );	// He'll give you your next test.
	AI_Output(self,other, " DMT_1218_Gader_Test_08 " );	// Goodbye!
	B_LogEntry( TOPIC_GUARDIANSTEST , " Guardian Gader has given me his consent to be initiated into the Circle. " );
	GADER_AGREE = TRUE ;
	Info_ClearChoices(dmt_1218_gader_test);
	Info_AddChoice(dmt_1218_gader_test, " (end call) " ,dmt_1218_gader_test_end);
};

func void dmt_1218_gader_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

