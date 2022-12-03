

instance DMT_1213_MORIUS_EXIT(C_Info)
{
	npc = dmt_1213_morius;
	nr = 999;
	condition = dmt_1213_morius_exit_condition;
	information = dmt_1213_morius_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1213_morius_exit_condition()
{
	return TRUE;
};

func void dmt_1213_morius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1213_MORIUS_HELLO(C_Info)
{
	npc = dmt_1213_morius;
	condition = dmt_1213_morius_hello_condition;
	information = dmt_1213_morius_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1213_morius_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (DAGOT_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1213_morius_hello_info()
{
	AI_Output(self,other, " DMT_1213_Morius_Hello_00 " );	// So, you're here.
	AI_Output(self,other, " DMT_1213_Morius_Hello_01 " );	// Dagoth told me a lot about you.
	AI_Output(self,other, " DMT_1213_Morius_Hello_02 " );	// And about your victory over Lucian, though not without the help of one of the Asgardians.
	AI_Output(self,other, " DMT_1213_Morius_Hello_03 " );	// Truly, you are the favorite of the gods!
	AI_Output(other,self, " DMT_1213_Morius_Hello_04 " );	// So you... Guardian? So I found you. And it already seemed to me that I would spend the rest of my life in this search.
	AI_Output(self,other, " DMT_1213_Morius_Hello_05 " );	// You couldn't help but find me.
	AI_Output(self,other, " DMT_1213_Morius_Hello_06 " );	// Ok, okay. Dagoth likes things to be by the rules, so I'm going to ask a stupid question. What do you want from me?
	AI_Output(other,self, " DMT_1213_Morius_Hello_07 " );	// I've come to ask you for your consent to initiate me into the Circle of Guardians, master.
	AI_Output(self,other, " DMT_1213_Morius_Hello_08 " );	// About the elements, how unexpected! But you know that first you must fulfill one of my conditions?
	AI_Output(other,self, " DMT_1213_Morius_Hello_09 " );	// Yes, master. I must pass your test.
	AI_Output(self,other, " DMT_1213_Morius_Hello_10 " );	// Okay, let's not waste time then. Are you ready to take my test?
	B_RemoveNpc(dmt_1212_dagot);
	Info_ClearChoices(dmt_1213_morius_hello);
	Info_AddChoice(dmt_1213_morius_hello, " Yes master. I'm ready. " ,dmt_1213_morius_hello_test);
};

func void dmt_1213_morius_hello_test()
{
	AI_Output(other,self, " DMT_1213_Morius_Hello_11 " );	// Yes, master. I'm ready.
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1213_Morius_Hello_12 " );	// Great. So, I - Morius, the second guardian of the god Beliar and the eighth Guardian of the sacred Halls of Wakhan - give you your second test ...
	AI_Output(self,other, " DMT_1213_Morius_Hello_13 " );	// Listen carefully.
	AI_Output(self,other, " DMT_1213_Morius_Hello_14 " );	// The fact that Lucian is dead is, of course, a good thing. But your actions with Dagoth provoked the wrath of the God of Darkness.
	AI_Output(self,other, " DMT_1213_Morius_Hello_15 " );	// This demon was a soul harvester for the Dark God. He devoured the souls of his victims for his master.
	AI_Output(self,other, " DMT_1213_Morius_Hello_16 " );	// We - the Guardians - cannot allow this and, of course, we know how to tame the fury of the Dark God.
	AI_Output(self,other, " DMT_1213_Morius_Hello_17 " );	// In general, your second task is to return these souls to Beliar and turn his anger into mercy.
	AI_Output(other,self, " DMT_1213_Morius_Hello_18 " );	// And what is this offering? I hope I don't have to sacrifice a human?!
	AI_Output(self,other, " DMT_1213_Morius_Hello_19 " );	// No. When you killed the demon, you took his heart. It itself is no different from the heart of an ordinary demon.
	AI_Output(self,other, " DMT_1213_Morius_Hello_20 " );	// Except one. This heart contains the souls of those who fell victim to this demon. Lucian devoured not only the flesh, but also the souls of the slain.
	AI_Output(self,other, " DMT_1213_Morius_Hello_21 " );	// That's why Beliar was so angry when Lucian was cast down. He needs those souls.
	AI_Output(other,self, " DMT_1213_Morius_Hello_22 " );	// And how can we return them to him?
	AI_Output(self,other, " DMT_1213_Morius_Hello_23 " );	// Everything is quite simple. Souls can be extracted from the heart of a demon, and in the monastery, the Fire Mages have a book that indicates a way how this can be implemented.
	AI_Output(self,other, " DMT_1213_Morius_Hello_24 " );	// Find this book and do everything according to the instructions. And then go to the nearest altar of the Dark God and serve him a prayer service, bringing a gift of what is said in the book.
	AI_Output(self,other, " DMT_1213_Morius_Hello_26 " );	// Here, take the heart. Take care of him!
	B_GiveInvItems(self,other,itat_luzianheart,1);
	AI_Output(self,other, " DMT_1213_Morius_Hello_27 " );	// Yes, and more. Don't forget the ring Dagoth gave you. And remember that Beliar is cunning and cruel even to those who serve him.
	AI_Output(self,other, " DMT_1213_Morius_Hello_28 " );	// Do everything that I told you - and you will get my consent. Go.
	AI_StopProcessInfos(self);
	MIS_MORIUSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_MORIUSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MORIUSTEST,LOG_Running);
	B_LogEntry( TOPIC_MORIUSTEST , " Guardian Morius - the second Guardian of the god Beliar and the eighth Guardian of the sacred Halls of Wakhan - instructed me to sacrifice the souls of creatures killed by Lucian to the Dark God. His heart holds the collected souls, and a book is kept in the monastery with a description of how to extract souls from the heart of a demon. If I do everything that Morius said, I will pass his test. " );
	MORIUS_AGREE = FALSE ;
	SOUL_PRAY = FALSE;
	READ_SOULRIVER = FALSE;
	SOULRIVER = FALSE;
	DEATH_MEET = TRUE ;
	PARLAN_SOULRIVER = FALSE ;
	SOUL_PRAY_BLESSED = FALSE;
	Wld_InsertItem(itwr_soulriver,"FP_NW_ITEM_LIBRARY_IRDORATHBOOK");
};


instance DMT_1213_MORIUS_TEST(C_Info)
{
	npc = dmt_1213_morius;
	nr = 1;
	condition = dmt_1213_morius_test_condition;
	information = dmt_1213_morius_test_info;
	permanent = FALSE;
	description = " I did what you asked. " ;
};


func int dmt_1213_morius_test_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running) && ( MY_MORIUSTEST  == LOG_Running) && ( SOUL_PRAY  ==  TRUE ) && ( SOUL_PRAY_AFTER_END  ==  TRUE ) && ( MORIUS_AGREE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dmt_1213_morius_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DMT_1213_Morius_Test_00 " );	// I did what you asked - paid tribute to the Dark God!
	AI_Output(self,other, " DMT_1213_Morius_Test_01 " );	// (powerfully) Yes... I felt it as soon as Beliar accepted your gift.
	AI_Output(self,other, " DMT_1213_Morius_Test_02 " );	// The dark god got what he wanted, and now everything fell into place.
	MIS_MORIUSTEST = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_MORIUSTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_MORIUSTEST , " I performed an offering ritual to the Dark God and thus passed my second Guardian test. " );
	Info_ClearChoices(dmt_1213_morius_test);
	Info_AddChoice(dmt_1213_morius_test, " Now will you give me your consent, master? " ,dmt_1213_morius_test_pass);
};

func void dmt_1213_morius_test_pass()
{
	AI_Output(other,self, " DMT_1213_Morius_Test_03 " );	// Now will you give me your consent, master?
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1213_Morius_Test_04 " );	// Yes, of course. You did everything right, and therefore I give it to you.
	if(SAFEYOURING == TRUE)
	{
		AI_Output(self,other, " DMT_1213_Morius_Test_05 " );	// Besides, I know that Beliar has attempted on your soul as well. Only the power of the ring saved you from his curse!
		AI_Output(self,other, " DMT_1213_Morius_Test_06 " );	// And you, as I see, showed wisdom, not forgetting my advice.
		AI_Output(self,other, " DMT_1213_Morius_Test_07 " );	// Now look for the next one of us. And may the force of the elements be with you!
		AI_Output(self,other, " DMT_1213_Morius_Test_08 " );	// Goodbye!
		B_LogEntry( TOPIC_GUARDIANSTEST , " I have received the consent of Guardian Morius. Now I must look for the next Guardian. " );
		DEATH_AGREE = TRUE ;
		Info_ClearChoices(dmt_1213_morius_test);
		Info_AddChoice(dmt_1213_morius_test, " (end call) " ,dmt_1213_morius_test_end);
	}
	else
	{
		AI_Output(self,other, " DMT_1213_Morius_Test_09 " );	// Besides, I know that Beliar has attempted on your soul as well. And, as I see it, he partially succeeded ... (disappointed)
		AI_Output(self,other, " DMT_1213_Morius_Test_10 " );	// That ring you received from the first of the Guardians could have saved you from his curse. But now it's too late!
		AI_Output(self,other, " DMT_1213_Morius_Test_11 " );	// You made your own choice. And you have to live with it for the rest of the time!
		AI_Output(other,self, " DMT_1213_Morius_Test_12 " );	// So I can't take it off?
		AI_Output(self,other, " DMT_1213_Morius_Test_13 " );	// I don't think so... (thoughtfully) Perhaps the mages of Innos will help you with this.
		AI_Output(self,other, " DMT_1213_Morius_Test_14 " );	// Now go. Look for the next one of us. And may the force of the elements be with you!
		AI_Output(self,other, " DMT_1213_Morius_Test_15 " );	// Goodbye!
		B_LogEntry( TOPIC_GUARDIANSTEST , " I have received the consent of Guardian Morius. Now I must look for the next Guardian. " );
		Log_AddEntry( TOPIC_BELIARCURSE , " Keeper Morius advised me to contact the Fire Mages. Perhaps they can help me get rid of Beliar's curse. " );
		DEATH_AGREE = TRUE ;
		Info_ClearChoices(dmt_1213_morius_test);
		Info_AddChoice(dmt_1213_morius_test, " (end call) " ,dmt_1213_morius_test_end);
	};
};

func void dmt_1213_morius_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

