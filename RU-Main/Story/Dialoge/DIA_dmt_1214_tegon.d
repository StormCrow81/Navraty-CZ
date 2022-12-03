

instance DMT_1214_TEGON_EXIT(C_Info)
{
	npc = dmt_1214_tegon;
	nr = 999;
	condition = dmt_1214_tegon_exit_condition;
	information = dmt_1214_tegon_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1214_tegon_exit_condition()
{
	return TRUE;
};

func void dmt_1214_tegon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1214_TEGON_HELLO(C_Info)
{
	npc = dmt_1214_tegon;
	condition = dmt_1214_tegon_hello_condition;
	information = dmt_1214_tegon_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1214_tegon_hello_condition()
{
	if (( MY_GUARDIANTEST  == LOG_Running ) && ( MORIUS_AGREE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dmt_1214_tegon_hello_info()
{
	AI_Output(self,other, " DMT_1214_Tegon_Hello_00 " );	// I see you passed the test of Morius. You are making great progress on the path you have chosen!
	AI_Output(self,other, " DMT_1214_Tegon_Hello_01 " );	// I wouldn't be surprised if you soon achieve something that would take others forever.
	AI_Output(other,self, " DMT_1214_Tegon_Hello_02 " );	// Are you a Guardian too?
	AI_Output(self,other, " DMT_1214_Tegon_Hello_03 " );	// I think you already guessed who I am. And there are no extra questions.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_04 " );	// Better let's get straight to the point. So what brings you to me?
	AI_Output(other,self, " DMT_1214_Tegon_Hello_05 " );	// I've come to ask you for your consent to initiate me into the Circle of Guardians, master.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_06 " );	// Then you probably know that before you get it, you must complete my task.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_08 " );	// Are you ready to accept my challenge?
	Info_ClearChoices(dmt_1214_tegon_hello);
	Info_AddChoice(dmt_1214_tegon_hello,"Да, я готов.",dmt_1214_tegon_hello_test);
};

func void dmt_1214_tegon_hello_test()
{
	AI_Output(other,self, " DMT_1214_Tegon_Hello_09 " );	// Yes, I'm ready.
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1214_Tegon_Hello_10 " );	// Good. I - Tegon, the third guardian of the god Beliar and the ninth Guardian of the sacred Halls of Wakhan - I give you your next test ...
	AI_Output(self,other, " DMT_1214_Tegon_Hello_11 " );	// Listen carefully and remember.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_12 " );	// This time you won't have to fight anyone or risk your life. But that doesn't mean my assignment will be a cakewalk for you.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_13 " );	// You've probably already been to the library of Xardas, which is located on the top floor of his tower. If not, then you should go there.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_14 " );	// There you will find some ancient manuscripts containing the wisdom of our path and many other useful information.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_15 " );	// For an ordinary person, these records are of no interest, since he cannot even read them.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_16 " );	// These tomes are written in the ancient language of Lang's demons, and I can tell you that only a select few of the many know this language and are able to read these books.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_17 " );	// You will also need to comprehend the knowledge of this language and carefully study these tomes of antiquity.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_18 " );	// After you've done all this, come back to me. I'll tell you what needs to be done next.
	AI_Output(other,self, " DMT_1214_Tegon_Hello_19 " );	// But master, who will teach me this language?
	AI_Output(self,other, " DMT_1214_Tegon_Hello_20 " );	// Talk to Xardas about this. I think he can help you with this issue.
	AI_Output(self,other, " DMT_1214_Tegon_Hello_21 " );	// Now go. Do everything I told you, and then come back to me.
	AI_StopProcessInfos(self);
	MIS_TEGONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_TEGONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TEGONTEST,LOG_Running);
	B_LogEntry( TOPIC_TEGONTEST , " Keeper Tegon - the third guardian of Beliar and the ninth Keeper of the sacred Halls of Wakhan - has assigned me to learn the ancient language of demons. After I have read the tomes on the top floor of the tower of Xardas, I should return to Tegon for further instructions. " );
};


instance DMT_1214_TEGON_TEST(C_Info)
{
	npc = dmt_1214_tegon;
	nr = 1;
	condition = dmt_1214_tegon_test_condition;
	information = dmt_1214_tegon_test_info;
	permanent = FALSE;
	description = " I did everything you wanted. " ;
};


func int dmt_1214_tegon_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_TEGONTEST == LOG_Running) && (KNOWDEMENTORLANGUAGE == TRUE) && (READDEMENTORBOOK_01 == TRUE) && (READDEMENTORBOOK_02 == TRUE) && (READDEMENTORBOOK_03 == TRUE) && (READDEMENTORBOOK_04 == TRUE) && (READDEMENTORBOOK_05 == TRUE) && (READDEMENTORBOOK_06 == TRUE) && (READDEMENTORBOOK_07 == TRUE) && (TEGON_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dmt_1214_tegon_test_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DMT_1214_Tegon_Test_00 " );	// I did everything you wanted.
	AI_Output(self,other, " DMT_1214_Tegon_Test_01 " );	// (imperiously) I already know about it - you might as well not even talk about it.
	AI_Output(self,other, " DMT_1214_Tegon_Test_02 " );	// You're making progress, and you've already proven your worth!
	AI_Output(self,other, " DMT_1214_Tegon_Test_03 " );	// Now the most important part of your test, the success of which will depend on how carefully you memorized everything that was described in those books.
	AI_Output(self,other, " DMT_1214_Tegon_Test_04 " );	// I don't think this should be a big problem for you.
	AI_Output(self,other, " DMT_1214_Tegon_Test_05 " );	// I will ask you questions that you will have to answer correctly.
	AI_Output(self,other, " DMT_1214_Tegon_Test_06 " );	// If all your answers are correct, I will give you my consent to become an adept.
	AI_Output(self,other, " DMT_1214_Tegon_Test_09 " );	// Tell me when you're ready to answer my questions.
	B_LogEntry( TOPIC_TEGONTEST , " Now I must apply what I learned to pass Tegon's test. The Guardian will ask me questions that I must answer. " );
	TEGON_TEST = TRUE;
};


instance DIA_TEGON_TEST_FRAGEN (C_Info)
{
	npc = dmt_1214_tegon;
	nr = 5;
	condition = dia_tegon_test_fragen_condition;
	information = dia_tegon_test_fragen_info;
	permanent = TRUE;
	description = " I'm ready to answer your questions. " ;
};


func int dia_tegon_test_fragen_condition()
{
	if((MIS_TEGONTEST == LOG_Running) && (TEGON_TEST == TRUE) && (TEGON_AGREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_tegon_test_fragen_failed()
{
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_Failed_01_00 " );	// You answered my questions incorrectly.
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_Failed_01_01 " );	// Until you answer all the questions correctly, I will not give you my consent.
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_Failed_01_02 " );	// Go and study the tomes again! And when you're ready to answer, come back.
	Info_ClearChoices(dia_tegon_test_fragen);
	AI_StopProcessInfos(self);
};

func void dia_tegon_test_fragen_testok()
{
	B_GivePlayerXP(200);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_TestOk_01_00 " );	// You answered all my questions correctly...
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_TestOk_01_01 " );	// ...and proved that you can choose wisely from what is offered to you.
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_TestOk_01_02 " );	// I believe you are worthy to wear the robes of an adept of our Circle.
	AI_Output(other,self, " DIA_Tegon_Test_Fragen_TestOk_01_04 " );	// Does this mean you've given your consent, master?
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_TestOk_01_05 " );	// Yes, I give my consent to accept you into the Sacred Circle of Adepts of the Circle of Guardians.
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_TestOk_01_06 " );	// Now it's time for you to seek a meeting with the next of us. Go, and let the Elements keep your path!
	MIS_TEGONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TEGONTEST,LOG_SUCCESS);
	Log_AddEntry( TOPIC_TEGONTEST , " I answered all of Tegon's questions correctly and passed his test. " );
	Log_AddEntry( TOPIC_GUARDIANSTEST , " Guardian Tegon has given his consent for me to be elevated to the position of adept of their sacred Circle. " );
	TEGON_AGREE = TRUE;
	Info_ClearChoices(dia_tegon_test_fragen);
	Info_AddChoice(dia_tegon_test_fragen, " (end conversation) " ,dia_tegon_test_fragen_end);
};

func void dia_tegon_test_fragen_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

func void b_tegon_fragen_choices()
{
	if(TEGON_TESTEND == TRUE)
	{
		if ( TEGON_RICHTIGEANSWERTEN  <  8 )
		{
			dia_tegon_test_fragen_failed();
		}
		else
		{
			dia_tegon_test_questions_testok();
		};
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		Log_AddEntry( TOPIC_TEGON_QUESTIONS , " Question eight: 'What was the real reason you chose this path?' " );
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_04 " );	// Good! Now the last question... the hardest of all.
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_05 " );	// It sounds very simple, but think carefully before answering it.
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_06 " );	// What was the real reason you chose this path?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen, " Such will the gods. " ,dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen, " This is my decision. " ,dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen, " I was chosen by Fate! " ,dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen, " The Might of the Guardians bought me. " ,dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen, " It's just a coincidence. " ,dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen, " I don't know the answer. " ,dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		Log_AddEntry( TOPIC_TEGON_QUESTIONS , " Question 7: 'Who desired unlimited power and initiated divine opposition?' " );
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_07 " );	// Who desired unlimited power and laid the foundation for divine opposition?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Иннос.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Аданос.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Белиар.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Хаос.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Стоннос.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen, " I don't know the answer. " ,dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		Log_AddEntry( TOPIC_TEGON_QUESTIONS , " Question six: 'Who is the biggest threat to destroy this world?' " );
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_08 " );	// Who is the biggest threat to destroy this world?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Хаос.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Драконы.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Белиар.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Иннос.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Орки.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen, " I don't know the answer. " ,dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		Log_AddEntry( TOPIC_TEGON_QUESTIONS , " Question five: 'What do the Keepers value above all and what is true treasure?' " );
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_09 " );	// What do Guardians value above all and what is true treasure?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Сила.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_question, " Знания. " ,dia_tegon_test_question_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Мудрость.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Золото.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Власть.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen, " I don't know the answer. " ,dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		Log_AddEntry( TOPIC_TEGON_QUESTIONS , " Question four: 'What is contrary to the teachings of the Guardians?' " );
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_10 " );	// What is unnatural to the teachings of the Guardians?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Чувства.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Добродетель.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Зло.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Слабость.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen, " All this together. " ,dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen, " I don't know the answer. " ,dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		Log_AddEntry( TOPIC_TEGON_QUESTIONS , " Question three: 'What is the true purpose of the Guardian's path and what does this path reveal to the existing world?' " );
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_11 " );	// What is the true purpose of the path of the Guardian, and what does this path reveal to the existing world?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Добродетель.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen, " Равенство. " ,dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Зло.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Баланс.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Хаос.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen, " I don't know the answer. " ,dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		Log_AddEntry( TOPIC_TEGON_QUESTIONS , " Question two: 'Who are the Divine Guardians?' " );
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_12 " );	// Who are the Divine Guardians?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Боги.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Стихии.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Паладины.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Хранители.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen, " Elemental elements. " ,dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen, " I don't know the answer. " ,dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 0)
	{
		Log_AddEntry( TOPIC_TEGON_QUESTIONS , " Question one: 'Who are the Creators?' " );
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_13 " );	// Who are the Creators?
		Info_AddChoice(dia_tegon_test_fragen,"Хранители.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Боги.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Стихии.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Люди.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Хаос.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen, " I don't know the answer. " ,dia_tegon_test_fragen_answer_6);
	};
};

func void dia_tegon_test_fragen_info()
{
	TEGON_NEXTQUESTION = 0;
	TEGON_CORRECTANSWERS = 0 ;
	TEGON_TESTEND = FALSE ;
	AI_Output(other,self, " DIA_Tegon_Test_Fragen_01_00 " );	// I'm ready to answer your questions.
	if (dia_tegon_test_fragen_info_onetime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_01 " );	// Then let's not waste time and start your test!
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_02 " );	// Listen carefully and try to answer correctly...
		B_LogEntry( TOPIC_TEGONTEST , " --- Tegon Keeper Questions --- " );
		dia_tegon_test_fragen_info_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Tegon_Test_Fragen_01_03 " );	// Ok, listen carefully and try to answer correctly...
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_1()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_1_01_00 " );	// Keepers.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_01");	//Боги.
		TEGON_CORRECTANSWERS = TEGON_CORRECTANSWERS  +  1 ;
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_1_01_02 " );	// Virtue.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_03");	//Чувства.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_04");	//Сила.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_05");	//Хаос.
		TEGON_CORRECTANSWERS = TEGON_CORRECTANSWERS  +  1 ;
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_06");	//Иннос.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_1_01_07 " );	// Such is the will of the gods.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE ;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_2()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_00");	//Боги.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_01");	//Стихии.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_2_01_02 " );	// Equality.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_2_01_03 " );	// Virtue.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_04");	//Знания.
		TEGON_CORRECTANSWERS = TEGON_CORRECTANSWERS  +  1 ;
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_05");	//Драконы.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_06");	//Аданос.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_2_01_07 " );	// This is my decision.
		TEGON_CORRECTANSWERS = TEGON_CORRECTANSWERS  +  1 ;
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE ;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_3()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_00");	//Стихии.
		TEGON_CORRECTANSWERS = TEGON_CORRECTANSWERS  +  1 ;
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_3_01_01 " );	// Paladins.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_02");	//Зло.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_03");	//Зло.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_04");	//Мудрость.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_05");	//Белиар.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_06");	//Белиар.
		TEGON_CORRECTANSWERS = TEGON_CORRECTANSWERS  +  1 ;
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_3_01_07 " );	// I was chosen by Fate!
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE ;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_4()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_00");	//Люди.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_4_01_01 " );	// Keepers.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_02");	//Баланс.
		TEGON_CORRECTANSWERS = TEGON_CORRECTANSWERS  +  1 ;
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_03");	//Слабость.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_04");	//Золото.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_05");	//Иннос.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_06");	//Хаос.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_4_01_07 " );	// The power of the Guardians has bought me.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE ;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_5()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_00");	//Хаос.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_5_01_01 " );	// Elements of elements.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_02");	//Хаос.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_5_01_03 " );	// All this together.
		TEGON_CORRECTANSWERS = TEGON_CORRECTANSWERS  +  1 ;
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_04");	//Власть.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_05");	//Орки.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_06");	//Стоннос.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_5_01_07 " );	// This is just an accident.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE ;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_6()
{
	AI_Output(other,self, " DIA_Tegon_Test_Fragen_Answer_6_01_00 " );	// I don't know the answer.
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_Answer_6_01_01 " );	// Then don't waste my time.
	AI_Output(self,other, " DIA_Tegon_Test_Fragen_Answer_6_01_02 " );	// Go and study the tomes again! And when you're ready to answer, come back.
	AI_StopProcessInfos(self);
};

