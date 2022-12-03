

instance DIA_ORC_8551_LEITENENT_EXIT(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_exit_condition;
	information = dia_orc_8551_leitenent_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8551_leitenent_exit_condition()
{
	return TRUE;
};

func void dia_orc_8551_leitenent_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8551_LEITENENT_HELLO(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_hello_condition;
	information = dia_orc_8551_leitenent_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8551_leitenent_hello_condition()
{
	return TRUE;
};

func void dia_orc_8551_leitenent_hello_info()
{
	Snd_Play("ORC_AMBIENT_SHORT01");
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Info_18_01 " );	// Stop, man!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Info_18_02 " );	// Stranger know where to go? The stranger can't go any further!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_Info_18_03 " );	// And what is this place where you can't go?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Info_18_04 " );	// Hall of Leaders. Hall of Ur-Thrall - to be a great leader of the Horde, to be a great warrior.
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_Info_18_05 " );	// But I need to speak to Ur-Thrall urgently. It is very important!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Info_18_06 " );	// What should a person have to do with him?
	MEETFARROK = TRUE ;
	Info_ClearChoices(dia_orc_8551_leitenent_hello);
	Info_AddChoice(dia_orc_8551_leitenent_hello, " Я не знаю. " ,dia_orc_8551_leitenent_hello_dontknow);

	if(MIS_KILLURTRALL == LOG_Running)
	{
		Info_AddChoice(dia_orc_8551_leitenent_hello, " I have a message from Hag-Tar. " ,dia_orc_8551_leitenent_hello_hagtar);
	};
	if (( MY_ORCTEMPLE  == LOG_Running ) && ( MY_KILLURTRALL  ==  FALSE ))
	{
		Info_AddChoice(dia_orc_8551_leitenent_hello, " This concerns the Temple of the Sleeper in the Valley of Mines. " ,dia_orc_8551_leitenent_hello_hram);
	};
};

func void dia_orc_8551_leitenent_hello_hram()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_Hram_18_01 " );	// This concerns the Temple of the Sleeper in the Valley of Mines. I think you are having some problems with it.
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_Hram_18_02 " );	// Well, how? Is that a good enough reason for you to let me in?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Hram_18_20 " );	// Man talking about the great Temple of Crushak?! (thinks) Yes, that might be interesting Ur-Thrall.
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Hram_18_21 " );	// But the man still can't go any further!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_Hram_18_22 " );	// But why?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Hram_18_23 " );	// Orcs do not trust him and do not respect him so that Farrok can let him go to the great leader!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Hram_18_24 " );	// And if a person still tries to enter the chamber, the orcs will kill him. Ulu-Mulu can't help!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_Hram_18_25 " );	// Can you still let me in?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_26");	//Нет!
	MIS_HeroOrcJoin = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin, " I must earn the respect and trust of the orcs to be allowed to see Ur-Thrall. " );
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hello_hagtar()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_HagTar_18_01 " );	// I have a message from the orc Hag-Tar!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_Hram_18_02 " );	// Well, how? Is that a good enough reason for you to let me in?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_HagTar_18_03 " );	// Hmmm...(thinks) I know Hag-Tar - be a great warrior, fight with the people in the valley.
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Hram_18_04 " );	// Okay, the person can move on. But the stranger be very careful!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Hram_18_05 " );	// If Ur-Thrall is angry, the alien will die. Ulu-Mulu can't help!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE ;
	PASSPORT CHAMBER = TRUE ;
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hello_dontknow()
{
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_DontKnow_18_01 " );	// I don't know.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_DontKnow_18_02 " );	// (menacingly) Then man turn back!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_DontKnow_18_03 " );	// If you try to enter the chamber - orcs kill people. Ulu-Mulu can't help!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Hello_DontKnow_18_04 " );	// Can you still let me in?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_05");	//Нет!
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8551_LEITENENT_HELLOTWO(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_hellotwo_condition;
	information = dia_orc_8551_leitenent_hellotwo_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_orc_8551_leitenent_hellotwo_condition()
{
	if (Npc_IsInState(self,ZS_Talk) && ( MEETFARROK  ==  TRUE ) && ( PASSORKCHAMBER  ==  FALSE ) && ((MY_HeroOrcJoin ==  FALSE ) || ( MY_KILLURTRALL  == LOG_Running)))
	{
		return TRUE;
	};
};

func void dia_orc_8551_leitenent_hellotwo_info()
{
	Snd_Play("ORC_AMBIENT_SHORT01");
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_Info_18_01 " );	// Stop, man! (threateningly) What do you need to be here again?
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_Info_18_02 " );	// Let me through to Ur-Thrall!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_Hello_Info_18_06 " );	// What should a person have to do with him?
	Info_ClearChoices(dia_orc_8551_leitenent_hellotwo);
	Info_AddChoice(dia_orc_8551_leitenent_hellotwo, " Я не знаю. " ,dia_orc_8551_leitenent_hellotwo_dontknow);

	if(MIS_KILLURTRALL == LOG_Running)
	{
		Info_AddChoice(dia_orc_8551_leitenent_hellotwo, " I have a message from Hag-Tar. " ,dia_orc_8551_leitenent_hellotwo_hagtar);
	};
	if (( MY_ORCTEMPLE  == LOG_Running ) && ( MY_KILLURTRALL  ==  FALSE ))
	{
		Info_AddChoice(dia_orc_8551_leitenent_hellotwo, " This concerns the Temple of the Sleeper in the Valley of Mines. " ,dia_orc_8551_leitenent_hellotwo_hram);
	};
};

func void dia_orc_8551_leitenent_hellotwo_hram()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_01 " );	// This concerns the Temple of the Sleeper in the Valley of Mines. I think you are having some problems with it.
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_02 " );	// Well, how? Is that a good enough reason for you to let me in?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_20 " );	// Man talking about the great Temple of Crushak?! (thinks) Yes, that might be interesting Ur-Thrall.
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_21 " );	// But the man still can't go any further!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_22 " );	// But why?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_23 " );	// Orcs do not trust him and do not respect him so that Farrok can let him go to the great leader!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_24 " );	// And if a person still tries to enter the chamber, the orcs will kill him. Ulu-Mulu can't help!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_25 " );	// Can you still let me in?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_26");	//Нет!
	MIS_HeroOrcJoin = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin, " I must gain the respect and trust of the orcs to be allowed to see Ur-Thrall! " );
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hellotwo_hagtar()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_01 " );	// I have a message from the orc Hag-Tar!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_02 " );	// Well, how? Is that a good enough reason for you to let me in?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_03 " );	// Hmmm...(thinks) I know Hag-Tar - be a great warrior, fight with the people in the valley.
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_04 " );	// Okay, the person can move on. But the stranger be very careful!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_05 " );	// If Ur-Thrall is angry, the alien will die. Ulu-Mulu can't help!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE ;
	PASSPORT CHAMBER = TRUE ;
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hellotwo_dontknow()
{
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_01 " );	// I don't know yet.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_02 " );	// (menacingly) Then man turn back!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_03 " );	// If he tries to enter the hall - the orcs will kill him. Ulu-Mulu can't help!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_04 " );	// Can you still let me in?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_05");	//Нет!
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_Respect(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_Respect_condition;
	information = DIA_Orc_8551_Leitenent_Respect_info;
	permanent = TRUE;
	description = " How much respect do I have among the orcs? " ;
};

func int DIA_Orc_8551_Leitenent_Respect_condition()
{
	if ((MY_HeroOrcJoin == LOG_Running) && ( PASSWORKCHAMBER  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_Respect_Info()
{
	var string concatText;

	AI_Output(other,self, " DIA_Orc_8551_Leitenent_Respect_01_00 " );	// How strong is the respect for me among the orcs?

	if(ORCRESPECT >= 80)
	{
		B_GivePlayerXP(2000);
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_01 " );	// (respectfully) Farrok to think that a man would earn great respect among my brothers.
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin, " I have won the trust and respect of the orcs. Now Farrok must let me through to Ur-Thrall. " );
	}
	else if(ORCRESPECT >= 70)
	{
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_02 " );	// (approvingly) Farrok know that already many brothers began to respect people.
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_03 " );	// But that's still not enough for Farrok to let him in.
	}
	else if(ORCRESPECT >= 50)
	{
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_04 " );	// (thoughtfully) Man needs to do more to win the respect of my brothers.
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_05 " );	// Only then can he prove himself worthy to face Ur-Thrall!
	}
	else if(ORCRESPECT >= 25)
	{
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_07 " );	// (regretfully) Farrock's brothers don't see much yet, for which they should respect humans.
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_08 " );	// Therefore, he should show himself more!
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_10 " );	// (with disdain) Farrok consider that for the time being he will not exist at all!
		AI_Output(self,other, " DIA_Orc_8551_Leitenent_Respect_01_11 " );	// Man, it's better to go help brothers than ask...
	};

	concatText = ConcatStrings( " Your respect among orcs is " ,IntToString( ORCRESPECT ));
	concatText = ConcatStrings(concatText,"/100");
	AI_Print(concatText);
};

instance DIA_Orc_8551_Leitenent_RespectDone(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_RespectDone_condition;
	information = DIA_Orc_8551_Leitenent_RespectDone_info;
	permanent = FALSE;
	description = " Now will you let me see Ur-Thrall? " ;
};

func int DIA_Orc_8551_Leitenent_RespectDone_condition()
{
	if ((MY_HeroOrcJoin == LOG_Success) && ( PASSORKCHAMBER  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_RespectDone_Info()
{
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_RespectDone_18_01 " );	// Now will you let me see Ur-Thrall?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_04 " );	// Okay, the person can move on. But the stranger be very careful!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_05 " );	// If Ur-Thrall is angry, the alien will die. Ulu-Mulu can't help!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE ;
	PASSPORT CHAMBER = TRUE ;
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_DeadHead(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_DeadHead_condition;
	information = DIA_Orc_8551_Leitenent_DeadHead_info;
	permanent = FALSE;
	description = " Do you have a job for me to do? " ;
};

func int DIA_Orc_8551_Leitenent_DeadHead_condition()
{
	if ((MY_HeroOrcJoin == LOG_Running) && ( PASSWORKCHAMBER  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_DeadHead_Info()
{
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_DeadHead_01_01 " );	// Do you have a job for me yourself?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHead_01_02 " );	// Human want to earn Farrok's respect? (appreciatively) Well, he's giving him one task.
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHead_01_03 " );	// Let him bring him a trophy enemy of the orcs! Only in this way will Farrok be respected by a person.
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_DeadHead_01_04 " );	// And what should it be?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHead_01_05 " );	// (thoughtfully) For example, the head of a human warrior! Or his ear...
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHead_01_06 " );	// But only they have to be fresh... (ominously) Don't bring Farrok just a rotten piece of meat!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_DeadHead_01_07 " );	// Aren't you too bloodthirsty?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHead_01_08 " );	// A person may not do what Farrok asks.
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHead_01_09 " );	// Let him decide... Whether he wants to earn Farrok's respect or not!
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_DeadHead_01_10 " );	// I'll think about it.
	MIS_DeadHead = LOG_Running;
	Log_CreateTopic(TOPIC_DeadHead,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DeadHead,LOG_Running);
	B_LogEntry(TOPIC_DeadHead, " Farrok wants me to bring him an enemy trophy. Preferably the head of one of the human warriors. Hmm, this orc's requests are serious. " );
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_DeadHeadDone(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_DeadHeadDone_condition;
	information = DIA_Orc_8551_Leitenent_DeadHeadDone_info;
	permanent = FALSE;
	description = " Here's your trophy. " ;
};

func int DIA_Orc_8551_Leitenent_DeadHeadDone_condition()
{
	if((MIS_DeadHead == LOG_Running) && (Npc_HasItems(other,ItMi_DeadManHead) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_DeadHeadDone_Info()
{
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_DeadHeadDone_01_01 " );	// Here's your trophy.
	B_GiveInvItems(other,self,ItMi_DeadManHead,1);
	Npc_RemoveInvItems(self,ItMi_DeadManHead,1);
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHeadDone_01_02 " );	// Hmmm... (appreciatively) Good! Be a fresh head, the person apparently recently chopped it off.
	AI_Output(other,self, " DIA_Orc_8551_Leitenent_DeadHeadDone_01_03 " );	// Would that suit you?
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHeadDone_01_04 " );	// Yes... Farrok is now respected by humans!
	AI_Output(self,other, " DIA_Orc_8551_Leitenent_DeadHeadDone_01_05 " );	// See that he doesn't like people as much as Farrok.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 10 " );
	};

	MIS_DeadHead = LOG_Success;
	Log_SetTopicStatus(TOPIC_DeadHead,LOG_Success);
	B_LogEntry(TOPIC_DeadHead, " I brought the head of one of the deserters to Farrok. He seemed quite satisfied with that. " );
	AI_StopProcessInfos(self);
};
