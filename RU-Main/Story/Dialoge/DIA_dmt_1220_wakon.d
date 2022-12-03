

instance DMT_1220_WAKON_EXIT(C_Info)
{
	npc = dmt_1220_song;
	nr = 999;
	condition = dmt_1220_wakon_exit_condition;
	information = dmt_1220_wakon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1220_wakon_exit_condition()
{
	return TRUE;
};

func void dmt_1220_wakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1220_WAKON_HELLO(C_Info)
{
	npc = dmt_1220_song;
	condition = dmt_1220_wakon_hello_condition;
	information = dmt_1220_wakon_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1220_wakon_hello_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running ) && ( NARUS_AGREE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dmt_1220_wakon_hello_info()
{
	AI_Output(self,other, " DMT_1220_Wakon_Hello_00 " );	// So...(powerfully) We finally meet!
	AI_Output(self,other, " DMT_1220_Wakon_Hello_01 " );	// I hope I don't have to explain to you who I am?
	AI_Output(other,self, " DMT_1220_Wakon_Hello_02 " );	// I think you're one of the Guardians. I'm right?
	AI_Output(self,other, " DMT_1220_Wakon_Hello_03 " );	// That's right, in front of you is Vakon - the third guardian of Water and the Keeper of the sacred gates of Vakhan.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_04 " );	// I'm sure you already know why I'm here. It's time for you to take your final test!
	AI_Output(self,other, " DMT_1220_Wakon_Hello_05 " );	// And only after passing it, you will earn my favor and consent to accept you as an adherent of our Circle.
	AI_Output(other,self, " DMT_1220_Wakon_Hello_06 " );	// I know it, master. And I'm sure I can handle it.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_07 " );	// Your confidence is sometimes amazing. Okay...(seriously) This time you'll have to show your best!
	AI_Output(self,other, " DMT_1220_Wakon_Hello_08 " );	// (powerfully) Let's not waste time. Are you ready to take my test?
	Info_ClearChoices(dmt_1220_wakon_hello);
	Info_AddChoice(dmt_1220_wakon_hello, " Yes master! I'm ready. " ,dmt_1220_wakon_hello_test);
};

func void dmt_1220_wakon_hello_test()
{
	AI_Output(other,self, " DMT_1220_Wakon_Hello_09 " );	// Yes, master! I'm ready.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1220_Wakon_Hello_10 " );	// Then listen to me carefully, human... (imperiously)
	AI_Output(self,other, " DMT_1220_Wakon_Hello_11 " );	// Your path lies to a place called Hades, or - as people call it - the Valley of Mines.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_12 " );	// I think you yourself understand what I'm talking about.
	AI_Output(other,self, " DMT_1220_Wakon_Hello_13 " );	// Yes, master, I am well acquainted with this place.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_14 " );	// Good. There you will have to find one of the five spirits of the sacred waters of Adan and free him.
	AI_Output(other,self, " DMT_1220_Wakon_Hello_15 " );	// Release the Water Spirit?
	AI_Output(self,other, " DMT_1220_Wakon_Hello_16 " );	// I understand your great surprise at such an assignment, for you hardly ever met such creatures and have no idea who they are.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_17 " );	// However, despite this, you still have to do it - if you want to pass my test, of course.
	AI_Output(other,self, " DMT_1220_Wakon_Hello_18 " );	// And who are these Spirits of Water?
	AI_Output(self,other, " DMT_1220_Wakon_Hello_19 " );	// Spirits of Water are children of their element! Ancient beings, in which we - Guardians - partly draw our vitality.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_20 " );	// In addition, they are also the source of our wisdom and magical power.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_22 " );	// That's why many centuries ago one of these spirits was captivated by the shamans of an orc tribe, who believed that with its help they would gain unlimited power.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_23 " );	// True, they did not succeed.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_24 " );	// Therefore, the orcs left the Spirit of Water in their captivity in the hope that someday they will be able to comprehend the secrets of its power.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_27 " );	// Not being able to draw magic from his native element, the Water Spirit began to gradually lose its vitality and fade before our eyes.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_28 " );	// So, most likely, over the many centuries spent in captivity, this creature has already completely lost its former power, which once seemed limitless.
	AI_Output(other,self, " DMT_1220_Wakon_Hello_29 " );	// But why didn't the Guardians free the Water Spirit themselves?
	AI_Output(self,other, " DMT_1220_Wakon_Hello_30 " );	// You should have learned a long time ago that we never interfere with the course of events and time.
	AI_Output(self,other, " DMT_1220_Wakon_Hello_31 " );	// Our interference could upset the already fragile balance of this world, and the consequences of all this would be simply terrifying!
	AI_Output(self,other, " DMT_1220_Wakon_Hello_32 " );	// That is why the execution of our divine will is entrusted to mere mortals like you - and there can be no other way!
	AI_Output(self,other, " DMT_1220_Wakon_Hello_34 " );	// Go to Hades and free the prisoner from his dungeon... (powerfully) I'll be waiting for you here.
	AI_StopProcessInfos(self);
	MIS_WAKONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_WAKONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAKONTEST,LOG_Running);
	B_LogEntry( TOPIC_WAKONTEST , " Guardian Vakon ordered me to go to the Valley of Mines to find and free the oldest creature - the Spirit of Water. Once the Spirit was captured by the shamans of an orc tribe. Why didn't he lose the ring, like the previous Guardian? " );

	if(URSHAKISDEAD == FALSE)
	{
		Log_AddEntry( TOPIC_WAKONTEST , " It looks like I'll have to deal with the orcs again. Maybe Ur-Shak can tell me where to start looking. " );
	};
};


instance DMT_1220_WAKON_TEST(C_Info)
{
	npc = dmt_1220_song;
	nr = 1;
	condition = dmt_1220_wakon_test_condition;
	information = dmt_1220_wakon_test_info;
	important = FALSE;
	permanent = TRUE;
	description = " The Water Spirit is free! " ;
};


func int dmt_1220_wakon_test_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running) && ( MY_CONTEST  == LOG_Running) && ( FREEWATERSOUL  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dmt_1220_wakon_test_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DMT_1220_Wakon_Test_00 " );	// The Water Spirit is free!
	AI_Output(self,other, " DMT_1220_Wakon_Test_01 " );	// Well, that's very good news. Although, to tell the truth, I already know them.
	AI_Output(other,self, " DMT_1220_Wakon_Test_02 " );	// How did you feel it?!
	AI_Output(self,other, " DMT_1220_Wakon_Test_03 " );	// (seriously) It's simple, man. Don't forget that we, the Keepers of the Water, are closely related to these ancient beings.
	AI_Output(self,other, " DMT_1220_Wakon_Test_04 " );	// Any, even the slightest magical disturbance caused by these creatures - in turn, greatly affects each of us.
	AI_Output(self,other, " DMT_1220_Wakon_Test_06 " );	// But now it's not so important. Another thing is important - you fulfilled my order and thus passed your last test!
	AI_Output(self,other, " DMT_1220_Wakon_Test_07 " );	// I think you can guess what that means. Is not it?
	MIS_WAKONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WAKONTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_WAKONTEST , " I passed the Wakon Keeper test. " );
	Info_ClearChoices(dmt_1220_wakon_test);
	Info_AddChoice(dmt_1220_wakon_test, " Yes, I think I can guess. " ,dmt_1220_wakon_test_pass);
};

func void dmt_1220_wakon_test_pass()
{
	AI_Output(other,self, " DMT_1220_Wakon_Test_08 " );	// Yes, I think I guess.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	B_LogEntry( TOPIC_GUARDIANSTEST , " I received the consent of the last of the Guardians - Wakon. Now I need to appear before the head of their Divine Circle. Apparently, I can find him in a place that represents the element that gave birth to him. As far as I remember, this element is not anything but the Sacred Stone. " );
	WAKON_AGREE = TRUE;
	AI_Output(self,other, " DMT_1220_Wakon_Test_09 " );	// Then, by the power given to me by Adanos and the Holy Water, I - Vakon, the third guardian of the Water and the first Keeper of the sacred gates of Vakhan - give you my consent to initiate you into the rank of an adept of our Circle.
	AI_Output(self,other, " DMT_1220_Wakon_Test_10 " );	// From now on, my decision is inscribed in the great Book of Fates, and no one can change it!
	AI_Output(other,self, " DMT_1220_Wakon_Test_11 " );	// Will I serve the Guardians now?
	AI_Output(self,other, " DMT_1220_Wakon_Test_12 " );	// Yes, you rightfully deserve this honor!
	AI_Output(self,other, " DMT_1220_Wakon_Test_13 " );	// Now you have only one thing left - to appear before the one who united us all with his power.
	AI_Output(self,other, " DMT_1220_Wakon_Test_15 " );	// (imperiously) Guardian Stonnos! He is the most powerful of the Guardians of the Elements and in addition is the head of our Divine Order.
	AI_Output(other,self, " DMT_1220_Wakon_Test_17 " );	// But where can I find it?
	AI_Output(self,other, " DMT_1220_Wakon_Test_18 " );	// Look for it where the divine wisdom of the element that gave birth to it appears... (insinuatingly) And thus embodies its very essence!
	AI_Output(self,other, " DMT_1220_Wakon_Test_20 " );	// Now everything. Goodbye. And may the wisdom of Water keep you!
	Info_ClearChoices(dmt_1220_wakon_test);
	Info_AddChoice(dmt_1220_wakon_test, " (end call) " ,dmt_1220_wakon_test_end);
};

func void dmt_1220_wakon_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

