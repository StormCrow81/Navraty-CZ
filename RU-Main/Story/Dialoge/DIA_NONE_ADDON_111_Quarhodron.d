

instance DIA_Addon_Quarhodron_EXIT(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 999;
	condition = DIA_Addon_Quarhodron_EXIT_Condition;
	information = DIA_Addon_Quarhodron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Quarhodron_Hello(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Hello_Condition;
	information = DIA_Addon_Quarhodron_Hello_Info;
	important = TRUE;
	permanent = TRUE;
};

var int DIA_Addon_Quarhodron_Hello_NoPerm;

func int DIA_Addon_Quarhodron_Hello_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( DIA_Addon_Quarhodron_Hello_NoPerm ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Quarhodron_Hello_Info()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_11_00 " );	// Why are you disturbing my peace, guardian?
		AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_11_01 " );	// Say what you need?
		Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, " What's in the Temple of Adanos? " ,DIA_Addon_Quarhodron_Hello_schwert);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, " Someone broke into the temple of Adanos. " ,DIA_Addon_Quarhodron_Hello_raven);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, " Tell me how to get to the temple of Adanos. " ,DIA_Addon_Quarhodron_Hello_tempel);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, " Earthquakes shake our country. " ,DIA_Addon_Quarhodron_Hello_erdbeben);
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE ;
		Npc_RemoveInvItems(hero,ItWr_Addon_SUMMONANCIENTGHOST,1);
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_11_02 " );	// Bengla antani, Osiri?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_11_03 " );	// Bengla antani?
		AI_StopProcessInfos(self);
	};
};


var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;

func void B_Quarhodron_Hello_KommZumPunkt()
{
	if((DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3) && (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE))
	{
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, " The wisdom of the ancients is truly amazing. " ,DIA_Addon_Quarhodron_Hello_frech);
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_Hello_erdbeben_15_00 " );	// Our country is trembling from earthquakes. We have to do something, otherwise the whole island will go under water.
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_erdbeben_11_01 " );	// We can't do anything.
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_erdbeben_11_02 " );	// The wrath of Adanos fell on Yarkendar to punish those who lost their faith.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_ComeToPoint();
};

func void DIA_Addon_Quarhodron_Hello_raven()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_Hello_raven_15_00 " );	// Someone managed to break into the Temple of Adanos.
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_raven_11_01 " );	// Nonsense! I personally sealed the door. It is impossible to enter the temple.
	AI_Output(other,self, " DIA_Addon_Quarhodron_Hello_raven_15_02 " );	// Really?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_ComeToPoint();
};

func void DIA_Addon_Quarhodron_Hello_tempel()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_Hello_tempel_15_00 " );	// Tell me how to get to the Temple of Adanos.
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_tempel_11_01 " );	// The temple will remain closed forever. So the council decided.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_ComeToPoint();
};

func void DIA_Addon_Quarhodron_Hello_schwert()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_Hello_schwert_15_00 " );	// What is in the Temple of Adanos?
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_schwert_11_01 " );	// My greatest sorrow. My greatest disappointment.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_ComeToPoint();
};

func void DIA_Addon_Quarhodron_Hello_frech()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_Hello_frech_15_00 " );	// The wisdom of the ancients is truly amazing.
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_frech_11_01 " );	// A person in your position shouldn't talk like that.
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_frech_11_02 " );	// I can't shake the impression that you're not who you say you are.
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_frech_11_03 " );	// If you need my help, you must prove that you are telling me the truth.
	AI_Output(self,other, " DIA_Addon_Quarhodron_Hello_frech_11_04 " );	// Answer my questions so I can make sure I'm not giving away our secrets to a stranger.
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron, " The Quarhodron will only help me if I prove myself worthy. He asked me some tough questions. I have to answer them before he can help me. " );
	Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
};


instance DIA_Addon_Quarhodron_Fragen (C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Fragen_Condition;
	information = DIA_Addon_Quarhodron_Questions_Info;
	permanent = TRUE;
	description = " Ask! " ;
};


func int DIA_Addon_Quarhodron_Fragen_Condition()
{
	if (QuarhodronIsSatisfied ==  FALSE )
	{
		return TRUE;
	};
	return  FALSE ;
};


var int Quarhodrons_NextQuestion;
var int QuarhodronIsSatisfied;
var int Quarhodrons_CorrectAnswers;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed()
{
	AI_Output(self,other, " DIA_Addon_Quarhodron_TestFailed_11_00 " );	// Wrong answers betray your evil intentions.
	AI_Output(self,other, " DIA_Addon_Quarhodron_TestFailed_11_01 " );	// I won't help you.
	AI_StopProcessInfos(self);
};

func void B_Quarhodron_Fragen_Choices()
{
	Log_AddEntry(TOPIC_Addon_Quarhodron, " --- QUESTIONS OF QUARHODRON --- " );
	if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else  if ((Quarhodrons_NextQuestion ==  1 ) && (Quarhodrons_CorrectAnswers ==  0 ))
	{
		AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_00 " );	// I don't believe you.
		AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_01 " );	// Come back when you decide to tell me the truth.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Quarhodrons_NextQuestion == 1)
		{
			if (B_Quarhodron_Fragen_ChoicesOneTime ==  FALSE )
			{
				AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_02 " );	// (thoughtfully) Yes, the power of the guardians of the dead could have allowed you to awaken me.
				AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_03 " );	// If you're truly a guardian of the dead, you can answer all my questions.
				AI_Output(self,other, " DIA_Addon_Quarhodron_Add_11_00 " );	// Except one...
				B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
			};
			Quarhodrons_NextQuestion = 2;
		};
		if(Quarhodrons_NextQuestion == 7)
		{
			AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_04 " );	// Who closed the portal to prevent evil from entering our world?
			Log_AddEntry(TOPIC_Addon_Quarhodron, " --- Who closed the portal and protected the world from evil? --- " );
			Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
		}
		else if(Quarhodrons_NextQuestion == 6)
		{
			AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_05 " );	// Who relieves the suffering of the wounded and cares for the sick?
			Log_AddEntry(TOPIC_Addon_Quarhodron, " --- Who in Yarkendar takes care of the sick and alleviates their suffering? --- " );
			Quarhodrons_NextQuestion = 7;
		}
		else if(Quarhodrons_NextQuestion == 5)
		{
			AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_06 " );	// Who has the last word in the Council of Five?
			Log_AddEntry(TOPIC_Addon_Quarhodron, " --- Who has the final say in the Council of Five? --- " );
			Quarhodrons_NextQuestion = 6;
		}
		else if(Quarhodrons_NextQuestion == 4)
		{
			AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_07 " );	// Who brought evil into our world?
			Log_AddEntry(TOPIC_Addon_Quarhodron, " --- Who is to blame for the misfortunes that befell the inhabitants of Yarkendar? --- " );
			Quarhodrons_NextQuestion = 5;
		}
		else if(Quarhodrons_NextQuestion == 3)
		{
			AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_08 " );	// Who can give me a direct order?
			Log_AddEntry(TOPIC_Addon_Quarhodron, " --- Who can give Quarhodron a direct order? --- " );
			Quarhodrons_NextQuestion = 4;
		}
		else if(Quarhodrons_NextQuestion == 2)
		{
			AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_Choices_11_09 " );	// Who protects the people of Yarkendar from enemy attacks?
			Log_AddEntry(TOPIC_Addon_Quarhodron, " --- Who defended Yarkendar from enemies? --- " );
			Quarhodrons_NextQuestion = 3;
		};
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
		if(Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, " I can't know this. " ,DIA_Addon_Quarhodron_Fragen_NoPlan);
		}
		else
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, " Я не знаю. " ,DIA_Addon_Quarhodron_Fragen_NoPlan);
		};
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen, " Ученые. " ,DIA_Addon_Quarhodron_Fragen_gele);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen, " Guardians of the dead. " ,DIA_Addon_Quarhodron_Fragen_totenw);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen, " Жрецы. " ,DIA_Addon_Quarhodron_Fragen_prie);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen, " Воины. " ,DIA_Addon_Quarhodron_Fragen_warr);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen, " Целители. " ,DIA_Addon_Quarhodron_Fragen_heiler);
	};
};


var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Questions_Info()
{
	Quarhodrons_NextQuestion = 0;
	Quarhodrons_CorrectAnswers = 0 ;
	AI_Output(other,self, " DIA_Addon_Quarhodron_Fragen_15_00 " );	// Ask!
	if (DIA_Addon_Quarhodron_Fragen_Info_OneTime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_11_01 " );	// I am Quarhodron. Once I was the leader of the armies of Yarkendar.
		AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_11_02 " );	// You woke me up.
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_11_03 " );	// Which caste do you belong to?
	B_Quarhodron_Questions_Choices();
};

func void DIA_Addon_Quarhodron_Questions_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//Воины.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 3)
	{
		Quarhodrons_CorrectAnswers = Quarhodrons_CorrectAnswers +  1 ;
	};
	if(Quarhodrons_NextQuestion == 5)
	{
		Quarhodrons_CorrectAnswers = Quarhodrons_CorrectAnswers +  1 ;
	};
	B_Quarhodron_Questions_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_prie()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Жрецы.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 4)
	{
		Quarhodrons_CorrectAnswers = Quarhodrons_CorrectAnswers +  1 ;
	};
	B_Quarhodron_Questions_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_gele()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_Fragen_gele_15_00 " );	// Scientists.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 6)
	{
		Quarhodrons_CorrectAnswers = Quarhodrons_CorrectAnswers +  1 ;
	};
	B_Quarhodron_Questions_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_totenw()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_Fragen_totenw_15_00 " );	// Guardians of the dead.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_CorrectAnswers = Quarhodrons_CorrectAnswers +  1 ;
	};
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	B_Quarhodron_Questions_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_heiler()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_Fragen_heiler_15_00 " );	// Healers.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 7)
	{
		Quarhodrons_CorrectAnswers = Quarhodrons_CorrectAnswers +  1 ;
	};
	B_Quarhodron_Questions_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_NoPlan()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//Я не знаю.
	if ((Quarhodrons_NextQuestion == Quarhodron_AllQuestionsAsked) && (Quarhodrons_CorrectAnswers >=  6 ))
	{
		AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_NoPlan_11_01 " );	// Good. I believe you, and therefore I will help.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
	}
	else if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Quarhodron_Fragen_NoPlan_11_02 " );	// Then don't waste my time.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Quarhodron_GibMirKey(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_GibMirKey_Condition;
	information = DIA_Addon_Quarhodron_GibMirKey_Info;
	description = " (require temple key) " ;
};


func int DIA_Addon_Quarhodron_GibMirKey_Condition()
{
	if(QuarhodronIstZufrieden == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Quarhodron_GibMirKey_Info()
{
	AI_Output(other,self, " DIA_Addon_Quarhodron_GibMirKey_15_00 " );	// Listen to me! A very evil person was able to get into the temple of Adanos.
	AI_Output(other,self, " DIA_Addon_Quarhodron_GibMirKey_15_01 " );	// If you don't help me get to the temple immediately, we might be late, and then we'll all be finished.
	AI_Output(self,other, " DIA_Addon_Quarhodron_GibMirKey_11_02 " );	// This can't be. In all of Yarkendar, only High Priest Cardimon and I know how to open the gate to the temple.
	AI_Output(other,self, " DIA_Addon_Quarhodron_GibMirKey_15_03 " );	// Well, then your friend Cardimon blabbed.
	AI_Output(other,self, " DIA_Addon_Quarhodron_GibMirKey_15_04 " );	// The gate has been opened. I saw it with my own eyes.
	AI_Output(self,other, " DIA_Addon_Quarhodron_GibMirKey_11_05 " );	// I can hear from your voice that you're telling the truth. I will no longer doubt your words.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Надеюсь.
	AI_Output(self,other, " DIA_Addon_Quarhodron_GibMirKey_11_07 " );	// I will give you a stone tablet with secret words written on it. Say them before the sealed gates of the temple, and they will swing open before you.
	CreateInvItems(self,ItMi_TempelTorKey,1);
	B_GiveInvItems(self,other,ItMi_TempelTorKey,1);
	AI_Output(self,other, " DIA_Addon_Quarhodron_GibMirKey_11_08 " );	// My time is running out. Alas, I can't help you with anything else.
	AI_Output(self,other, " DIA_Addon_Quarhodron_GibMirKey_11_09 " );	// Remember, the halls of Adanos are deadly. Be careful.
	AI_Output(other,self, " DIA_Addon_Quarhodron_GibMirKey_15_10 " );	// Wait! What is in these rooms?
	AI_Output(self,other, " DIA_Addon_Quarhodron_GibMirKey_11_11 " );	// Strength is leaving me. Goodbye! Someday we'll meet again in the land of the dead.
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_Addon_Quarhodron, " Quarhodron gave me a stone tablet that will open the entrance to the Temple of Adanos for me. " );
	Log_CreateTopic(TOPIC_Addon_Kammers, LOG_MISSION );
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry_Quiet(TOPIC_Addon_Kammern, " Quarhodron said I should be careful in the 'Halls of Adanos'. I should find out what he means if I don't want to be trapped. " );
	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};

// ---------------------------------evil Quarhodron------------- --------


instance DIA_NONE_ADDON_1158_Quarhodron_EXIT(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 999;
	condition = DIA_NONE_ADDON_1158_Quarhodron_EXIT_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_ADDON_1158_Quarhodron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_ADDON_1158_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_ADDON_1158_Quarhodron_Hello(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 5;
	condition = DIA_NONE_ADDON_1158_Quarhodron_Hello_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_Hello_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_NONE_ADDON_1158_Quarhodron_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_Hello_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_Hello_01_00 " );	// It's you again... What brings you to me?
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_Hello_01_01 " );	// I need to talk to you, Quarhodron.
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_Hello_01_02 " );	// You came here for nothing, man! Only death awaits you here...
};

instance DIA_NONE_ADDON_1158_Quarhodron_Why(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 5;
	condition = DIA_NONE_ADDON_1158_Quarhodron_Why_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_Why_Info;
	permanent = FALSE;
	description = " So you are the leader of all these undead? " ;
};

func int DIA_NONE_ADDON_1158_Quarhodron_Why_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_ADDON_1158_Quarhodron_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_Why_Info()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_00 " );	// So, you are the leader of all this undead that sows death all around?
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_01 " );	// I am the great commander of the ancients... (coldly) And these are my warriors. All those who served me during my lifetime.
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_02 " );	// But I don't understand. Why do you need all this?!
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_03 " );	// All living now deserve to die! At least for defiling the lands of Adanos with the dark magic of Beliar.
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_04 " );	// They will all pay with their lives for the destruction of shrines and the desecration of ancient shrines.
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_05 " );	// It was they who brought a curse on my people that has been haunting us for centuries!
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_06 " );	// They'll all die for this! No one will escape the justice of Adanos... (coldly) And I, Quarhodron, will take care of it.
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_07 " );	// But that was a long time ago! And the one who defiled the ancient temple in Yarkendar is already dead.
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_08 " );	// The rest of the people are not to blame for anything.
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_Why_01_09 " );	// It doesn't matter... (coldly) They need to be taught a lesson. And I will do it. Nobody will stop me!
};

instance DIA_NONE_ADDON_1158_Quarhodron_GoBack(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 5;
	condition = DIA_NONE_ADDON_1158_Quarhodron_GoBack_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_GoBack_Info;
	permanent = FALSE;
	description = " But Adanos forgave your people! " ;
};

func int DIA_NONE_ADDON_1158_Quarhodron_GoBack_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_ADDON_1158_Quarhodron_Why) == TRUE) && (MIS_CurseAncient == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBack_Info()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBack_01_00 " );	// But Adanos forgave your people!
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_GoBack_01_01 " );	// Are you saying the curse no longer threatens us?
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBack_01_02 " );	// Exactly. You no longer need to fight anyone.
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_GoBack_01_03 " );	// This can't be. You lie to me man! Nobody can do that.
};

instance DIA_NONE_ADDON_1158_Quarhodron_GoBackNow(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 5;
	condition = DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Info;
	permanent = TRUE;
	description = " Send your warriors back to where they came from immediately! " ;
};

func int DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_NONE_ADDON_1158_Quarhodron_GoBack) ==  TRUE ) && (QuarterBattle ==  FALSE ) && (QuarterPeace ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Info()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_01_00 " );	// Send your warriors back to where they came from immediately!
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_01_01 " );	// (angrily) Who are you to give me orders like that? To me! Great Quarhodron!
	Info_ClearChoices(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow);
	Info_AddChoice(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow, " I'll think about it. " ,DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_NoIdea);
	Info_AddChoice(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow, " Because otherwise I'll have to kill you! " ,DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle);

	if(CrownIsUp == TRUE)
	{
		Info_AddChoice(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow, " In the name of Adanos! Retreat or die... " ,DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace);
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_NoIdea()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_NoIdea_01_00 " );	// I'll think about it.
	Info_ClearChoices(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow);
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle_01_00 " );	// Do as I say or I'll have to kill you!
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle_01_01 " );	// (laughs) Stupid! Then it's time for you to die.
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle_01_02 " );	// No one can resist the will of Adanos! Even you...
	B_LogEntry(TOPIC_JarCurse, " Combat will decide everything now. This is the only way I can send Quarhodron back to where it came from. " );	
	KvarhBattle = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.aivar[AIV_MagicUser] = FALSE ;
	B_Attack(self,other,AR_NONE,0);
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace()
{
	B_GivePlayerXP(5000);
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_00 " );	// In the name of Adanos! Retreat or die...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_01 " );	// But... That can't be! Who are you?
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_02 " );	// I'm the one Adanos made his chosen one!
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_03 " );	// And I'm speaking on his behalf now. Back off or he will punish you!
	AI_Output(other,self, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_04 " );	// And there will be no more peace for you, either in this world or anywhere else!
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_05 " );	// Good. You leave me no choice...
	AI_Output(self,other, " DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_06 " );	// If Adanos himself demands it, then I obey his will...
	KvarhPeace = TRUE;
	MIS_JarCurse = LOG_Success;
	Log_SetTopicStatus(TOPIC_JarCurse,LOG_Success);
	B_LogEntry(Topic_JarCurse, " With the help of Adanos, I was able to convince Quarhodron to stop his undead army. The valley is now safe. " );
	AI_StopProcessInfos(self);
	B_RemoveMonster(Ancient_Warrior_Q1);
	B_RemoveMonster(Ancient_Warrior_Q2);
	B_RemoveMonster(Ancient_Warrior_Q3);
	B_RemoveMonster(Ancient_Warrior_Q4);
	B_RemoveMonster(Ancient_Warrior_Q5);
	B_RemoveMonster(Ancient_Warrior_Q6);
	B_RemoveMonster(Ancient_Warrior_Q7);
	B_RemoveMonster(Ancient_Warrior_Q8);
	B_RemoveMonster(Ancient_Warrior_Q9);
	B_RemoveNpcQuarh(Ancient_Warrior_QT1);
	B_RemoveNpcQuarh(Ancient_Warrior_QT2);
	B_RemoveNpcQuarh(Ancient_Warrior_QT3);
	B_RemoveNpcQuarh(Ancient_Warrior_QT4);
	B_RemoveNpcQuarh(Ancient_Warrior_QT5);
	B_RemoveNpcQuarh(Ancient_Warrior_QT6);
	B_RemoveNpcQuarh(Ancient_Warrior_QT7);
	B_RemoveNpcQuarh(Ancient_Warrior_QT8);
	B_RemoveNpcQuarh(Ancient_Warrior_QT9);
	B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q1 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q2 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q3 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q4 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q5 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q6 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q7 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q8 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_Q1 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_Q2 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_Q3 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_Q4 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_Q5 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_Q6 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_Q7 );
	B_RemoveMonster( SKELETON_WARRIOR_AV_Q8 );
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q1);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q2);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q3);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q4);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q5);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q6);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q7);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q8);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q1);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q2);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q3);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q4);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q5);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q6);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q7);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q8);
};
