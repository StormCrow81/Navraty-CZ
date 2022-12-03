

instance DMT_1216_DEMOS_EXIT(C_Info)
{
	npc = dmt_1216_demos;
	nr = 999;
	condition = dmt_1216_demos_exit_condition;
	information = dmt_1216_demos_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1216_demos_exit_condition()
{
	return TRUE;
};

func void dmt_1216_demos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1216_DEMOS_HELLO(C_Info)
{
	npc = dmt_1216_demos;
	nr = 1;
	condition = dmt_1216_demos_hello_condition;
	information = dmt_1216_demos_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1216_demos_hello_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running ) && ( KELIOS_AGREE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dmt_1216_demos_hello_info()
{
	AI_Output(self,other, " DMT_1216_Demos_Hello_00 " );	// (smartly) Greetings, traveler. Now it's time for us to meet.
	AI_Output(other,self,"DMT_1216_Demos_Hello_01");	//Кто ты?
	AI_Output(self,other, " DMT_1216_Demos_Hello_02 " );	// My name is Demos, and I am the second guardian of my creator Innos and the Keeper of the sacred fire of Baal.
	AI_Output(self,other, " DMT_1216_Demos_Hello_03 " );	// I think you can guess why I'm here?
	AI_Output(other,self, " DMT_1216_Demos_Hello_04 " );	// Yes, master. I must pass your test and get your consent to accept me as an adherent of the Circle of Guardians.
	AI_Output(self,other, " DMT_1216_Demos_Hello_05 " );	// That's right... (powerfully) And if so, then let's not be distracted by empty chatter.
	AI_Output(self,other, " DMT_1216_Demos_Hello_06 " );	// Are you ready to accept it?
	Info_ClearChoices(dmt_1216_demos_hello);
	Info_AddChoice(dmt_1216_demos_hello,"Я готов.",dmt_1216_demos_hello_test);
};

func void dmt_1216_demos_hello_test()
{
	AI_Output(other,self,"DMT_1216_Demos_Hello_07");	//Я готов.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1216_Demos_Hello_08 " );	// Good. Listen to me carefully.
	AI_Output(self,other, " DMT_1216_Demos_Hello_09 " );	// To pass your next test, you'll have to travel to a place called Hades!
	AI_Output(other,self,"DMT_1216_Demos_Hello_10");	//Гадес?
	AI_Output(self,other, " DMT_1216_Demos_Hello_11 " );	// This name was given to him by the ancients in those times when humanity was just beginning its difficult path in this world.
	AI_Output(self,other, " DMT_1216_Demos_Hello_12 " );	// But to make it clearer to you, I'll put it simply: you - the people - once called this once beautiful place the Valley of Mines!
	AI_Output(self,other, " DMT_1216_Demos_Hello_13 " );	// I think this name is already familiar to you.
	AI_Output(other,self, " DMT_1216_Demos_Hello_14 " );	// Of course, I was a prisoner in it.
	AI_Output(self,other, " DMT_1216_Demos_Hello_15 " );	// We won't go into details for now. You should be worried about something else now.
	AI_Output(other,self,"DMT_1216_Demos_Hello_16");	//И что же?
	AI_Output(self,other, " DMT_1216_Demos_Hello_17 " );	// There, in the valley, one of the artifacts of antiquity was once hidden, possessing incredible magical power!
	AI_Output(other,self, " DMT_1216_Demos_Hello_18 " );	// What was the item?
	AI_Output(self,other, " DMT_1216_Demos_Hello_19 " );	// It has no specific name, but its essence represents the opposite of my creator.
	AI_Output(self,other, " DMT_1216_Demos_Hello_20 " );	// I think it will not be difficult for you to understand what exactly we are talking about.
	AI_Output(self,other, " DMT_1216_Demos_Hello_21 " );	// At one time, this artifact was owned by the orcs, who for millennia were the masters of these lands.
	AI_Output(self,other, " DMT_1216_Demos_Hello_22 " );	// Until, of course, you people came here!
	AI_Output(self,other, " DMT_1216_Demos_Hello_23 " );	// Fearing that this item would be lost forever, the orcs hid it in one of their sacred places.
	AI_Output(self,other, " DMT_1216_Demos_Hello_24 " );	// Where exactly, I can't say.
	AI_Output(self,other, " DMT_1216_Demos_Hello_25 " );	// But I'm sure that with your help, I'll still be able to find out.
	AI_Output(other,self, " DMT_1216_Demos_Hello_26 " );	// Do you want me to find it for you?
	AI_Output(self,other, " DMT_1216_Demos_Hello_27 " );	// Quite right. Bring me this artifact and you will have my consent!
	AI_Output(other, self, " DMT_1216_Demos_Hello_28 " );	// M-yes, the task seems to be not an easy one.
	AI_Output(self,other, " DMT_1216_Demos_Hello_32 " );	// Okay...(smoothly) Then go and let the sacred fire help you in your quest.
	AI_StopProcessInfos(self);
	MIS_DEMOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_DEMOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMOSTEST,LOG_Running);
	B_LogEntry( TOPIC_DEMOSTEST , " Demos, Guardian of the Fire Element, has given me another test. I must find an artifact hidden in the Valley of Mines. The subject of my search is essentially the opposite of the creator of the guards of Fire. Orcs - his last masters - hid the artifact in one of their sacred local " );
};

instance DMT_1216_DEMOS_TEST(C_Info)
{
	npc = dmt_1216_demos;
	nr = 1;
	condition = dmt_1216_demos_test_condition;
	information = dmt_1216_demos_test_info;
	permanent = FALSE;
	description = " I think I found the artifact you need. " ;
};


func int dmt_1216_demos_test_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running) && ( MY_DEMOTEST  == LOG_Running) && (Npc_HasItems(other,itmi_idol_02) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dmt_1216_demos_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DMT_1216_Demos_Test_00 " );	// I think I found the artifact you need.
	AI_Output(self,other, " DMT_1216_Demos_Test_01 " );	// If you're so sure about this, then just let me take a look at it.
	AI_Output(other,self, " DMT_1216_Demos_Test_02 " );	// Here he is, master.
	B_GiveInvItems(other,self,itmi_idol_02,1);
	Npc_RemoveInvItems(self,itmi_idol_02,1);
	AI_Output(self,other, " DMT_1216_Demos_Test_03 " );	// (looking closely) Yes, it really is him.
	AI_Output(self,other, " DMT_1216_Demos_Test_04 " );	// Shape of Darkness - the third essence of the dark god... (powerfully) And now, thanks to you, she is in the safe hands of the Guardians.
	AI_Output(other,self, " DMT_1216_Demos_Test_05 " );	// Third entity? What does it mean?
	AI_Output(self,other, " DMT_1216_Demos_Test_08 " );	// Hmmm...(smoothly) If you want, I can tell you about them.
	AI_Output(self,other, " DMT_1216_Demos_Test_09 " );	// After all, you have earned the right to know why you risked your life.
	AI_Output(other,self, " DMT_1216_Demos_Test_10 " );	// I just have time to listen to your story.
	AI_Output(self,other, " DMT_1216_Demos_Test_11 " );	// Good. Tell me, have you ever heard of the sacred Halls of Irdorath?
	if(ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		AI_Output(other,self, " DMT_1216_Demos_Test_12 " );	// Yes, I heard about them.
		AI_Output(self,other, " DMT_1216_Demos_Test_13 " );	// Then you should know that these halls are nothing but the halls of the Beast itself!
		AI_Output(self,other, " DMT_1216_Demos_Test_14 " );	// And, accordingly, the place of the spell of the darkest god...
	}
	else
	{
		AI_Output(other,self, " DMT_1216_Demos_Test_15 " );	// No. First time I hear about them.
		AI_Output(self,other, " DMT_1216_Demos_Test_16 " );	// (mighty) Then know that the Halls of Irdorath are none other than the halls of the Beast itself!
		AI_Output(self,other, " DMT_1216_Demos_Test_17 " );	// And, accordingly, the place of the spell of the darkest god...
	};
	AI_Output(self,other, " DMT_1216_Demos_Test_18 " );	// There are four such temples in total.
	AI_Output(self,other, " DMT_1216_Demos_Test_19 " );	// More precisely, there were four of them, until the paladins of Innos destroyed the first two.
	AI_Output(self,other, " DMT_1216_Demos_Test_20 " );	// In turn, each of these places draws its power from ancient artifacts, in which Beliar himself enclosed part of his divine power.
	AI_Output(self,other, " DMT_1216_Demos_Test_21 " );	// This power is the essence of the lord of the crimson Darkness!
	AI_Output(other,self, " DMT_1216_Demos_Test_22 " );	// Got it. So there must be four such artifacts in total?
	AI_Output(self,other, " DMT_1216_Demos_Test_23 " );	// So it is. There are only four of them. And you've already seen one of them.
	AI_Output(other,self, " DMT_1216_Demos_Test_24 " );	// Where can I find the other three?
	AI_Output(self,other, " DMT_1216_Demos_Test_25 " );	// (grins) I don't think you should be too interested in all this.
	AI_Output(other,self, " DMT_1216_Demos_Test_26 " );	// But why?
	AI_Output(self,other, " DMT_1216_Demos_Test_27 " );	// Even if you find them, you still won't be able to master the power hidden in these items.
	AI_Output(self,other, " DMT_1216_Demos_Test_28 " );	// This is beyond the power of the Guardians, not to mention mere mortals!
	AI_Output(self,other, " DMT_1216_Demos_Test_29 " );	// So you better leave your thoughts on it. You're just wasting your time.
	AI_Output(other,self, " DMT_1216_Demos_Test_30 " );	// Okay, whatever you say.
	AI_Output(self,other, " DMT_1216_Demos_Test_31 " );	// (seriously) Now let's get back to your challenge.
	AI_Output(self,other, " DMT_1216_Demos_Test_32 " );	// In my opinion, you successfully passed it and, of course, deserved my consent to accept you as an adherent of our Circle!
	KNOWABOUTIRDORAT = TRUE;
	MIS_DEMOSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DEMOSTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_DEMOSTEST , " I brought Demos the artifact he was talking about, and he passed my test. " );
	Info_ClearChoices(dmt_1216_demos_test);
	Info_AddChoice(dmt_1216_demos_test,"Да, мастер.",dmt_1216_demos_test_pass);
};

func void dmt_1216_demos_test_pass()
{
	AI_Output(other,self, " DMT_1216_Demos_Test_33 " );	// Yes, master.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1216_Demos_Test_34 " );	// And with the power given to me by the creator, I write my decision in the Book of Fates... (mightily) So be it!
	AI_Output(self,other, " DMT_1216_Demos_Test_35 " );	// Now continue on your way. Look for Guardian Farion - the third of us, guardians of the Fire. He will give you the next test.
	AI_Output(self,other,"DMT_1216_Demos_Test_36");	//Прощай!
	B_LogEntry( TOPIC_GUARDIANSTEST , " Guardian Demos has agreed to accept me as an adept. Now I need to find Guardian Farion - the last of the guardians of Fire. He will give me the next test. " );
	DEMOS_AGREE = TRUE;
	Info_ClearChoices(dmt_1216_demos_test);
	Info_AddChoice(dmt_1216_demos_test, " (end call) " ,dmt_1216_demos_test_end);
};

func void dmt_1216_demos_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

