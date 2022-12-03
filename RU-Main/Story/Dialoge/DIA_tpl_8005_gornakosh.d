
var int CheckTadeNaKosh;

func void B_GorNaKoshEquipWeapon(var C_Npc slf)
{
	var C_Item EquipWeapon;

	EquipWeapon = Npc_GetEquippedMeleeWeapon(slf);

	if(CheckTadeNaKosh == TRUE)
	{
		if (Hlp_IsItem(EquipWeapon, ITMW_ZWEIHAENDER_GORNAKOSH ) ==  FALSE )
		{
			AI_UnequipWeapons(slf);

			if(Npc_HasItems(slf,ITMW_ZWEIHAENDER_GORNAKOSH) < 1)
			{
				CreateInvItem(slf,ITMW_ZWEIHAENDER_GORNAKOSH);
			};

			Npc_EquipItem(slf, ITMW_ZWEIHANDER_GORNAKOSH );
		};

		CheckTadeNaKosh = FALSE ;
	};
};

instance DIA_GORNAKOSH_EXIT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 999;
	condition = dia_gornakosh_exit_condition;
	information = dia_gornakosh_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornakosh_exit_condition()
{
	return TRUE;
};

func void dia_gornakosh_exit_info()
{
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};

instance dia_gornakosh_PICKPOCKET(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 900;
	condition = dia_gornakosh_PICKPOCKET_Condition;
	information = dia_gornakosh_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_gornakosh_PICKPOCKET_Condition()
{
	return  C_Robbery ( 15 , 35 );
};

func void dia_gornakosh_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
	Info_AddChoice(dia_gornakosh_PICKPOCKET,Dialog_Back,dia_gornakosh_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornakosh_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornakosh_PICKPOCKET_DoIt);
};

func void dia_gornakosh_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
};

func void dia_gornakosh_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
};


instance DIA_GORNAKOSH_WHOYOU(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_whoyou_condition;
	information = dia_gornakosh_whoyou_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_gornakosh_whoyou_condition()
{
	if ((Capital <  5 ) && ( PSI_TALK  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_gornakosh_whoyou_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_WhoYou_01_00");	//Кто ты?
	AI_Output(self,other, " DIA_GorNaKosh_WhoYou_01_01 " );	// My name is Gor Na Kosh, High Guardian of the Brotherhood! (proudly) Do you have another question?
	AI_Output(other,self, " DIA_GorNaKosh_WhoYou_01_02 " );	// How can I get the same armor as you?
	AI_Output(self,other, " DIA_GorNaKosh_WhoYou_01_03 " );	// Ha! To begin with, you will have to become one of us, and perhaps after that you will be honored to wear the armor of the Guardians.
	AI_Output(self,other, " DIA_GorNaKosh_WhoYou_01_04 " );	// And I'll tell you straight, boy - you won't get it just with idle chatter!
	AI_Output(other,self, " DIA_GorNaKosh_WhoYou_01_05 " );	// What's it like being a Guardian?
	AI_Output(self,other, " DIA_GorNaKosh_WhoYou_01_06 " );	// This is both a great honor and a huge responsibility!
	AI_Output(self,other, " DIA_GorNaKosh_WhoYou_01_07 " );	// We fight in the name of our Brotherhood - and we are ready to give our lives for our ideas, if necessary.
	AI_Output(self,other, " DIA_GorNaKosh_WhoYou_01_08 " );	// Only experienced and strong-willed warriors can embark on this path.
};


instance DIA_GORNAKOSH_WHAT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_what_condition;
	information = dia_gornakosh_what_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int dia_gornakosh_what_condition()
{
	if ((Capital <  5 ) && ( PSI_TALK  ==  TRUE ) && Npc_KnowsInfo(other,dia_gornakosh_whoyou));
	{
		return TRUE;
	};
};

func void dia_gornakosh_what_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_What_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_GorNaKosh_What_01_01 " );	// (proudly) I train the Guardians of the Brotherhood!
	AI_Output(self,other, " DIA_GorNaKosh_What_01_02 " );	// In the absence of our mentor, Kor Angara, I now fulfill this duty in the Brotherhood.
	AI_Output(self,other, " DIA_GorNaKosh_What_01_03 " );	// But the hope does not leave me that someday our teacher will return to us again.
};


instance DIA_GORNAKOSH_ANGAR (C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_angar_condition;
	information = dia_gornakosh_angar_info;
	permanent = FALSE;
	description = " (tell about Kor Angara) " ;
};


func int dia_cold_condition()
{
	if (( PSI_TALK  ==  TRUE ) && ( GORNAKOSHKNOWSANGAR  ==  FALSE ) && Npc_KnowsInfo(other,dia_gornakosh_what) && Npc_KnowsInfo(other,DIA_AngarDJG_HELLO))
	{
		return TRUE;
	};
};

func void dia_gornakosh_angar_info()
{
	if ( ANGARISDEAD  ==  FALSE )
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_GorNaKosh_Angar_01_01 " );	// Kor Angar is alive!
		AI_Output(self,other, " DIA_GorNaKosh_Angar_01_02 " );	// How do you know this?! (uncomprehending) But...
		AI_Output(other,self, " DIA_GorNaKosh_Angar_01_03 " );	// I met him in the Valley of Mines. He is OK.
		AI_Output(self,other, " DIA_GorNaKosh_Angar_01_04 " );	// (joyfully) Oh, this is truly wonderful news, which will rejoice all the Brothers without exception!
		GORNAKOSHKNOWSANGAR = TRUE;
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(other,self, " DIA_GorNaKosh_Angar_01_05 " );	// I'm afraid I have bad news. Kor Angar is dead.
		AI_Output(self,other, " DIA_GorNaKosh_Angar_01_06 " );	// WHAT?! (angrily) How do you know that?
		AI_Output(other,self, " DIA_GorNaKosh_Angar_01_07 " );	// He found his destiny in the Valley of Mines. I'm really sorry.
		AI_Output(self,other, " DIA_GorNaKosh_Angar_01_08 " );	// Oh, no. How could this happen? Not! It can't be!
		AI_Output(self,other, " DIA_GorNaKosh_Angar_01_10 " );	// (sadly) This is a great loss for the entire Brotherhood. We will all mourn the death of our leader and teacher.
		GORNAKOSHKNOWSANGAR = TRUE;
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
};


instance DIA_GORNAKOSH_CANBETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_canbetpl_condition;
	information = dia_gornakosh_canbetpl_info;
	permanent = FALSE;
	description = " Would you like me to join the Brotherhood Guard? " ;
};


func int dia_gornakosh_canbetpl_condition()
{
	if ((Capital <  5 ) && ( PSI_TALK  ==  TRUE ) && Npc_KnowsInfo(other,dia_gornakosh_whoyou));
	{
		return TRUE;
	};
};

func void dia_gornakosh_canbetpl_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_CanBeTPL_01_00 " );	// Could you accept me into the Guards of the Brotherhood?

	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_01 " );	// First you must become one of the brothers.
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_02 " );	// Talk to the Idol Auran - he will help you with this.
		CANBETPL = TRUE;

		if(MIS_CanDoTempler == FALSE)
		{
			MIS_CanDoTempler = LOG_Running;
			Log_CreateTopic(TOPIC_CanDoTempler,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Running);
			B_LogEntry(TOPIC_CanDoTempler, " In order to join the Guardians, you must impress Gor Na Kosh and other mentors of the Brotherhood. " );
		};
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_03 " );	// I see you have become one of our Brothers. This is good.
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_04 " );	// You made the right choice.
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_05 " );	// But you also need to understand that being a Guardian is not just empty words.
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_06 " );	// Only the worthiest of the worthiest can enter our Circle. This is a great honor and, of course, it must be earned.
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_07 " );	// Therefore, before asking me to initiate you into the circle of the Guardians, you will have to prove that you are in fact one of them.
		CANBETPL = TRUE;

		if(MIS_CanDoTempler == FALSE)
		{
			MIS_CanDoTempler = LOG_Running;
			Log_CreateTopic(TOPIC_CanDoTempler,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Running);
			B_LogEntry(TOPIC_CanDoTempler, " In order to join the Guardians, you must impress Gor Na Kosh and other mentors of the Brotherhood. " );
		};
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_08 " );	// You have already chosen the sacred path of the Guru! And at the same time he sealed his own destiny.
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_09 " );	// So go boldly on it and do not doubt your choice.
	}
	else
	{
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_10 " );	// Only one who belongs to our Brotherhood can be given this honor!
		AI_Output(self,other, " DIA_GorNaKosh_CanBeTPL_01_11 " );	// So don't waste my time, infidel!
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
};


instance DIA_GORNAKOSH_TEST(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_test_condition;
	information = dia_gornakosh_test_info;
	permanent = FALSE;
	description = " How can I prove to you that I am worthy of becoming a Guardian? " ;
};


func int dia_gornakosh_test_condition()
{
	if((CANBETPL == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_gornakosh_test_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_Test_01_00 " );	// How can I prove to you that I am worthy to become a Guardian?
	AI_Output(self,other, " DIA_GorNaKosh_Test_01_01 " );	// Apparently you want me to check you out?
	AI_Output(other,self, " DIA_GorNaKosh_Test_01_02 " );	// Yes, test me!
	AI_Output(self,other, " DIA_GorNaKosh_Test_01_04 " );	// I may have one errand just right for you.
	AI_Output(self,other, " DIA_GorNaKosh_Test_01_08 " );	// It became known to me for certain that somewhere in this part of the island one powerful artifact is hidden - the Hammer of Tarakot, the weapon of the great warrior of antiquity.
	AI_Output(self,other, " DIA_GorNaKosh_Test_01_09 " );	// It is still unknown where exactly this hammer is hidden, but if the Brotherhood took possession of this treasure, it would only benefit from it!
	AI_Output(self,other, " DIA_GorNaKosh_Test_01_10 " );	// If you really want to impress me, bring me this hammer.
	AI_Output(self,other, " DIA_GorNaKosh_Test_01_11 " );	// True, I also heard that this artifact is very well guarded. Therefore, the search does not promise to be easy.
	AI_Output(other,self, " DIA_GorNaKosh_Test_01_17 " );	// I'll try to get this hammer for you.
	AI_Output(self,other, " DIA_GorNaKosh_Test_01_20 " );	// Then come back to me when you've completed my task.
	MIS_TARACOTHAMMER = LOG_Running;
	Log_CreateTopic(TOPIC_TARACOTHAMMER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TARACOTHAMMER,LOG_Running);
	B_LogEntry( TOPIC_TARACOTHAMMER , " In order to impress Gor Na Kosh and have a chance to become a Guardian, I must bring him some powerful artifact - the Hammer of Tarakot. According to the high guard, the hammer is hidden somewhere in these parts. However, Gor Na Kosh warned me that the treasure was well guarded, so don't count on an easy walk. " );
};


instances DIA_GORNAKOSH_TESTOK (C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_testok_condition;
	information = dia_gornakosh_testok_info;
	permanent = FALSE;
	description = " I brought the Hammer! " ;
};

func int dia_gornakosh_testok_condition()
{
	if (( MIS_TARACOTHAMMER  == LOG_Running) && (Npc_HasItems(other,itmi_taracothammer) >=  1 ))
	{
		return TRUE;
	};
};

func void dia_gornakosh_testok_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_GorNaKosh_TestOk_01_00 " );	// I brought the Hammer!
	B_GiveInvItems(other,self,itmi_taracothammer, 1 );
	Npc_RemoveInvItems(self,itmi_taracothammer,Npc_HasItems(self,itmi_taracothammer));
	AI_Output(self,other, " DIA_GorNaKosh_TestOk_01_02 " );	// Incredible! It's... it's really Tarakot's Hammer!
	AI_Output(self,other, " DIA_GorNaKosh_TestOk_01_03 " );	// Great job! To be honest, I didn't expect you to be up to the task.
	AI_Output(self,other, " DIA_GorNaKosh_TestOk_01_06 " );	// Well, it looks like you passed my test and proved that you have remarkable courage and fortitude. All this is worthy of great respect!
	AI_Output(self,other, " DIA_GorNaKosh_TestOk_01_07 " );	// In addition, you also rendered an invaluable service to the entire Brotherhood, which also cannot but cause due attention to you.
	AI_Output(self,other, " DIA_GorNaKosh_TestOk_01_08 " );	// If your deeds continue to be just as fruitful, then soon you will be able to think about joining the ranks of the Guardians.
	AI_Output(self,other, " DIA_GorNaKosh_TestOk_01_09 " );	// We could use people like you!
	AI_Output(self,other, " DIA_GorNaKosh_TestOk_01_10 " );	// On my part, as a token of gratitude from the entire Brotherhood and from me personally, accept this modest gift.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	GORNAKOSHTEST = TRUE;
	MIS_TARACOTHAMMER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TARACOTHAMMER,LOG_SUCCESS);
	B_LogEntry( TOPIC_TARACOTHAMMER , " I passed Gor Na Kosh's challenge. " );
};


instance DIA_GORNAKOSH_READYBETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_readybetpl_condition;
	information = dia_gornakosh_readybetpl_info;
	permanent = TRUE;
	description = " I want to join the Guardians. " ;
};


func int dia_gornakosh_readybetpl_condition()
{
	if((CANBETPL == TRUE) && (hero.guild == GIL_SEK) && (READYBETPL == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornakosh_readybetpl_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_ReadyBeTPL_01_00 " );	// I want to join the Guardians.
	AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_01 " );	// I have already told you that your desire alone will not be enough to join the sacred circle of Guardians.
	AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_02 " );	// You must prove yourself worthy of this honor!
	AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_03 " );	// And the best evidence is your actions and deeds for the good of our Brotherhood.

	if((CADARAGREED == TRUE) || (CANJOINPSI == TRUE) || (PARVEZAGREED == TRUE) || (GORNAKOSHTEST == TRUE))
	{
		AI_Output(other,self, " DIA_GorNaKosh_ReadyBeTPL_01_04 " );	// Aren't they enough?
		AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_05 " );	// And what did you do?

		if(GORNAKOSHTEST == TRUE)
		{
			AI_Output(other,self, " DIA_GorNaKosh_ReadyBeTPL_01_06 " );	// I passed your test!
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_07 " );	// Hmmm... Yes, you really passed it.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_08 " );	// By this you proved that you are a good fighter and you can be entrusted with the implementation of serious tasks.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_09");	//Что еще?
		};
		if(CADARAGREED == TRUE)
		{
			AI_Output(other,self, " DIA_GorNaKosh_ReadyBeTPL_01_10 " );	// Idol Kadar believes that my faith in the Brotherhood cannot be questioned.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_13");	//Что еще?
		};
		if(PARVEZAGREED == TRUE)
		{
			AI_Output(other,self, " DIA_GorNaKosh_ReadyBeTPL_01_14 " );	// Idol Parvez agrees to my acceptance...
		};
		if(CANJOINPSI == TRUE)
		{
			AI_Output(other,self, " DIA_GorNaKosh_ReadyBeTPL_01_19 " );	// Idol Auran trusts me.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_21 " );	// I see - Gurus trust you! This tells me a lot...
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_22");	//Что еще?
		};
		if((CADARAGREED == TRUE) && (CANJOINPSI == TRUE) && (PARVEZAGREED == TRUE) && (GORNAKOSHTEST == TRUE))
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_23");	//Это все!
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_24 " );	// Hmmm... Good! You have proven that you can do a lot.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_25 " );	// And, of course, I can only say one thing about you - we need such people!
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_26 " );	// However, you must understand that once you become a Guardian, you can't simply refuse this choice.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_27 " );	// If you want to dedicate yourself to the divine path of the Guru, then you should talk about this topic with Idol Oran.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_28 " );	// If you nevertheless firmly decided to embark on the path of the Guardian, then I am ready to accept you into our sacred Circle without hesitation.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_29 " );	// Either way, the choice is yours...
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_30 " );	// ...but you must be fully aware of it - and only then make your final decision.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_31 " );	// Think carefully about what I told you.
			READYBETPL = TRUE;

			if(MIS_CanDoTempler == LOG_Running)
			{
				B_LogEntry(TOPIC_CanDoTempler, " Gor Na Kosh is ready to accept me into the Brotherhood Guard Circle. " );
			};
		}
		else
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_33");	//Это все.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_34 " );	// Hmmm... (thinking) Sorry, but that's not enough.
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_35 " );	// Your deeds before the Brotherhood are great, but they are not enough for me to accept you into the sacred circle of Guardians!
			AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_37 " );	// Keep up the good work and you'll soon be honored to try on the Guardian's armor!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_GorNaKosh_ReadyBeTPL_01_38 " );	// So we'll talk about your introduction later, when there are good reasons.
	};
};

var int TplNeedTwoH;
var int TplNeedStr;

instance DIA_GORNAKOSH_BETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_betpl_condition;
	information = dia_gornakosh_betpl_info;
	permanent = TRUE;
	description = " Accept me to the sacred circle of the Guardians. " ;
};


func int dia_gornakosh_betpl_condition()
{
	if((READYBETPL == TRUE) && (hero.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_gornakosh_betpl_info()
{
	if((other.HitChance[NPC_TALENT_2H] >= 30) && (other.attribute[ATR_STRENGTH] >= 50))
	{
		Snd_Play("GUILD_INV");
		hero.guild = GIL_TPL;
		CheckHeroGuild[0] = TRUE;
		AI_Output(other,self, " DIA_GorNaKosh_BeTPL_01_00 " );	// Receive me into the sacred circle of the Guardians.
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_01 " );	// So be it!
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_02 " );	// I initiate you into the Guardians of the Brotherhood - from now on you are one of us!
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_03 " );	// Here, take this armor.
		CreateInvItems(self,itar_tpl_lst,1);
		B_GiveInvItems(self,other,itar_tpl_lst,1);
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_04 " );	// Wear it with pride. Only a few have received such an honor!
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_05 " );	// Also accept this sword from me - the symbol of our sacred Circle.
		CreateInvItems(self,itmw_zweihaender6,1);
		B_GiveInvItems(self,other,itmw_zweihaender6,1);
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_06 " );	// He will help you defeat your enemies!
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_07 " );	// And don't forget that being a Guardian isn't just about wearing their armor...
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_08 " );	// ...it means dedicating yourself entirely to the service of the Brotherhood and its goals!
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_09 " );	// We find uses for both physical and spiritual strength. Only those whose body and spirit are a single whole can be considered true Guardians.
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_11 " );	// And remember: a calm spirit and a trained body will help you stand against any enemy.
		MIS_CanDoTempler = LOG_Success;
		Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Success);
		B_LogEntry(TOPIC_CanDoTempler, " Gor Na Kosh accepted me into the Guard. " );
	}
	else if(other.attribute[ATR_STRENGTH] < 50)
	{
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_12 " );	// Your strength is not enough to lift a two-hander and put on armor.

		if((MIS_CanDoTempler == LOG_Running) && (TplNeedStr == FALSE))
		{
			B_LogEntry(TOPIC_CanDoTempler, " Gor Na Kosh thinks I'm too weak to join the Guardians yet. (Required strength: 50 or more) " );
			TplNeedStr = TRUE;
		};
	}
	else if(other.HitChance[NPC_TALENT_2H] < 30)
	{
		AI_Output(self,other, " DIA_GorNaKosh_BeTPL_01_13 " );	// Your two-handed weapon skills are insufficient.

		if((MIS_CanDoTempler == LOG_Running) && (TplNeedTwoH == FALSE))
		{
			B_LogEntry(TOPIC_CanDoTempler, " Gor Na Kosh doesn't think I'm good enough with two-handed weapons to become a Guardian yet. (Two-handed skill required: 30 or more) " );
			TplNeedTwoH = TRUE;
		};
	};
};

var int GorNaKosh_Trade_OneTime;
var int TPLSword2;
var int TPLSword3;
var int TPLSword4;

instance DIA_GorNaKosh_TRADE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 700;
	condition = DIA_GorNaKosh_TRADE_Condition;
	information = DIA_GorNaKosh_TRADE_Info;
	permanent = TRUE;
	description = " What other weapon can you offer me? " ;
	trade = TRUE;
};

func int DIA_GorNaKosh_TRADE_Condition()
{
	if((hero.guild == GIL_TPL) && Wld_IsTime(8,0,21,30))
	{
		return TRUE;
	};
};

func void DIA_GorNaKosh_TRADE_Info()
{
	AI_Output(other,self, " DIA_GorNaKosh_TRADE_15_00 " );	// What other weapon can you offer me?

	if((GorNaKosh_Trade_OneTime == FALSE) && (hero.guild == GIL_TPL))
	{
		AI_Output(self,other, " DIA_GorNaKosh_TRADE_11_01 " );	// Since you're one of us now, I can sell you the finest weapons the Guardians can carry.
		AI_Output(self,other, " DIA_GorNaKosh_TRADE_11_02 " );	// But, of course, you have to pay for it.
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,1);
		GorNaKosh_Trade_OneTime = TRUE;
	};
	if ((Chapter >=  2 ) && (TPLSword2 ==  FALSE ))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,1);
		TPLSword2 = TRUE;
	};
	if ((Capital >=  3 ) && (TPLSword3 ==  FALSE ))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,1);
		TPLSword3 = TRUE;
	};
	if ((Chapter >=  4 ) && (TPLSword4 ==  FALSE ))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,1);
		TPLSword4 = TRUE;
	};
	if((TplBelt_01 == FALSE) && (hero.guild == GIL_TPL))
	{
		CreateInvItems(self,ItBE_Addon_TPL_01,1);
		TplBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
	AI_UnequipWeapons(self);

	if(Npc_HasItems(self,ITMW_ZWEIHAENDER_GORNAKOSH) >= 1)
	{
		Npc_RemoveInvItems(self,ITMW_ZWEIHAENDER_GORNAKOSH,Npc_HasItems(self,ITMW_ZWEIHAENDER_GORNAKOSH));
	};

	CheckTadeNaKosh = TRUE;
};

instance DIA_GORNAKOSH_REJECTING (C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_repellent_condition;
	information = dia_gornakosh_repellent_info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};

func int dia_gornakosh_forbidding_condition()
{
	if((other.guild != GIL_SEK) && (other.guild != GIL_GUR) && (other.guild != GIL_TPL) && Npc_KnowsInfo(other,dia_gornakosh_what))
	{
		return TRUE;
	};
};

func void dia_gornakosh_repellent_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_Abweisend_01_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_GorNaKosh_Abweisend_01_01 " );	// Get out of my sight, infidel!
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};


instance DIA_GORNAKOSH_ABWEISENDTWO (C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_repellenttwo_condition;
	information = dia_gornakosh_repellenttwo_info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};


func int dia_gornakosh_forbiddingtwo_condition()
{
	if(Npc_KnowsInfo(other,dia_gornakosh_what) && (GORNAKOSHTEACH == FALSE) && ((other.guild == GIL_SEK) || (other.guild == GIL_GUR) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_gornakosh_repellenttwo_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_AbweisendTwo_01_00 " );	// Can you teach me something?
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other, " DIA_GorNaKosh_AbweisendTwo_01_01 " );	// I only teach Guardians, acolyte.
		AI_Output(self,other, " DIA_GorNaKosh_AbweisendTwo_01_02 " );	// So don't waste my time.
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other, " DIA_GorNaKosh_AbweisendTwo_01_03 " );	// I only train Guardians, lord.
		AI_Output(self,other, " DIA_GorNaKosh_AbweisendTwo_01_04 " );	// The Guru is trained by the Idols of the Brotherhood.
	}
	else
	{
		AI_Output(self,other, " DIA_GorNaKosh_AbweisendTwo_01_05 " );	// Since you are part of the sacred circle of the Guardians of the Brotherhood, I am ready to train you.
		AI_Output(self,other, " DIA_GorNaKosh_AbweisendTwo_01_06 " );	// I can teach you how to fight with one-handed and two-handed weapons, as well as help you increase your strength and agility.
		AI_Output(self,other, " DIA_GorNaKosh_AbweisendTwo_01_07 " );	// In addition, Gor Na Tof can teach you how to use Guardian War Runes, and Gor Na Vid will show you how to handle ranged weapons - if you prefer ranged combat to melee.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry( TOPIC_ADDON_TPLTEACHER , " Gor Na Kosh will teach me how to use one-handed and two-handed weapons, as well as help me increase my strength and agility skills. " );
		GORNAKOSHTEACH = TRUE;
	};
};


instance DIA_GORNAKOSH_TEACH(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 10;
	condition = dia_gornakosh_teach_condition;
	information = dia_gornakosh_teach_info;
	permanent = TRUE;
	description = " I need a workout. " ;
};

func int dia_gornakosh_teach_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_teach_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_Teach_15_00 " );	// I need a workout.
	AI_Output(self,other, " DIA_GorNaKosh_Teach_04_01 " );	// What exactly do you want to train?
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
	{
		AI_Output(self,other, " DIA_GorNaKosh_Teach_1H_1_04_00 " );	// Your defenses aren't good enough yet, but someday you'll be a true master.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
	{
		AI_Output(self,other, " DIA_GorNaKosh_Teach_1H_5_04_00 " );	// Your wrist is still very stiff. You must keep your weapons free.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other, " DIA_GorNaKosh_Teach_2H_1_04_00 " );	// Always think about throwing from the hip, not from the wrist.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other, " DIA_GorNaKosh_Teach_2H_5_04_00 " );	// The strongest hit is useless if it goes into the void. So use your power wisely.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_back()
{
	Info_ClearChoices(dia_gornakosh_teach);
};


var int gornakosh_merke_str;
var int gornakosh_brand_dex;

instance DIA_GORNAKOSH_TEACHATT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 150;
	condition = dia_gornakosh_teachatt_condition;
	information = dia_gornakosh_teachatt_info;
	permanent = TRUE;
	description = " I want to increase my skills. " ;
};

func int dia_gornakosh_teachatt_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_teachatt_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_TeachATT_15_00 " );	// I want to increase my skills.
	GORNAKOSH_MERKE_STR = other.attribute[ATR_STRENGTH];
	GORNAKOSH_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_back()
{
	if((GORNAKOSH_MERKE_STR < other.attribute[ATR_STRENGTH]) || (GORNAKOSH_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other, " DIA_GorNaKosh_TeachATT_Back_01_00 " );	// Good! Now you can use your abilities with great success!
	};

	Info_ClearChoices(dia_gornakosh_teachatt);
};

func void DIA_GorNaKosh_TeachATT_RegenStam()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_03 " );	// Teach me faster stamina recovery.

	cost = 15 ;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Tutorial: Accelerated Stamina Regeneration " );
		VATRAS_TEACHREGENSTAM = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);
};

func void dia_gornakosh_teachatt_str_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_str_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_TPL ))
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT, " Stamina Regeneration (Teach Points: 15, Cost: 5000 coins) " ,DIA_GorNaKosh_TeachATT_RegenStam);
	};
};


instance DIA_GORNAKOSH_ADVANTAGE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 5;
	condition = dia_gornakosh_advantage_condition;
	information = dia_gornakosh_advantage_info;
	permanent = FALSE;
	description = " What are the benefits of a two-handed weapon? " ;
};


func int dia_gornakosh_advantage_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_advantage_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_Advantage_15_00 " );	// What are the advantages of two-handed weapons?
	AI_Output(self,other, " DIA_GorNaKosh_Advantage_04_01 " );	// It's very simple. With a one-handed sword, you're faster. In battle, this can play a decisive role.
	AI_Output(self,other, " DIA_GorNaKosh_Advantage_04_02 " );	// With a two-handed sword, it's the other way around. You have to be careful, but you can do more damage than with a one-handed sword.
};


instances DIA_GORNAKOSH_HOWTOBEGIN (C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 6;
	condition = dia_gornakosh_howtobegin_condition;
	information = dia_gornakosh_howtobegin_info;
	permanent = FALSE;
	description = " Where should I start? With one-handed or two-handed weapons? " ;
};


func int dia_gornakosh_howtobegin_condition()
{
	if(Npc_KnowsInfo(other,dia_gornakosh_advantage))
	{
		return TRUE;
	};
};

func void dia_gornakosh_howtobegin_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_HowToBegin_15_00 " );	// Where should I start? With one-handed or two-handed weapons?
	AI_Output(self,other, " DIA_GorNaKosh_HowToBegin_04_01 " );	// You can start however you like.
	AI_Output(self,other, " DIA_GorNaKosh_HowToBegin_04_02 " );	// If you learn to wield only one type of weapon, it's okay, the rest will follow.
	AI_Output(self,other, " DIA_GorNaKosh_HowToBegin_04_03 " );	// If, for example, you are good with a one-handed sword, but bad with a two-handed one...
	AI_Output(self,other, " DIA_GorNaKosh_HowToBegin_04_04 " );	// ... all the lunges you master with a one-handed sword will also improve your ability to fight with a two-handed sword.
	AI_Output(self,other, " DIA_GorNaKosh_HowToBegin_04_05 " );	// If you learn to wield both weapons, the training will be extremely tough.
	AI_Output(self,other, " DIA_GorNaKosh_HowToBegin_04_06 " );	// Just start, then you will understand what I was talking about.
};

var int BuyTemplerHeavy;
var int BuyTemplerMed;
var int BuyTemplerLight;

instance TPL_8005_GORNAKOSH_ARMOR(C_Info)
{
	npc = tpl_8005_gornakosh;
	condition = tpl_8005_gornakosh_armor_condition;
	information = tpl_8005_gornakosh_armor_info;
	permanent = TRUE;
	description = " I need better armor. " ;
};


func int tpl_8005_gornakosh_armor_condition()
{
	if((hero.guild == GIL_TPL) && (TAKETPLBESTARMOR == FALSE))
	{
		return TRUE;
	};
};

func void tpl_8005_gornakosh_armor_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " TPL_8005_GorNaKosh_ARMOR_01_00 " );	// I want better armor.
	AI_Output(self,other, " TPL_8005_GorNaKosh_ARMOR_01_01 " );	// I have good armor, but you'll have to make a generous donation to the Brotherhood.
	Info_ClearChoices(tpl_8005_gornakosh_armor);
	Info_AddChoice(tpl_8005_gornakosh_armor,Dialog_Back,tpl_8005_gornakosh_armor_back);

	if(BuyTemplerHeavy == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor, " Heavy Guardian Armor (Price: 14000 coins) " ,tpl_8005_gornakosh_armor_h);
	};
	if(BuyTemplerMed == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor, " Guardian Armor (Price: 9500 coins) " ,tpl_8005_gornakosh_armor_m);
	};
	if(BuyTemplerLight == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor, " Guardian Light Armor (Price: 1500 coins) " ,tpl_8005_gornakosh_armor_l);
	};
};

func void tpl_8005_gornakosh_armor_m()
{
	AI_Output(hero,self, " TPL_8005_GorNaKosh_ARMOR_M_01_00 " );	// I need Guardian medium armor.

	if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_M)
	{
		AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_M_01_02 " );	// As soon as you have the opportunity to make a donation to the needs of the Brotherhood, you will receive new armor.
	}
	else  if ((Capital >=  2 ) && ( FORTUNOBACK  ==  TRUE ) && ( MY_CORRECTION  ==  LOG_SUCCESS ))
	{
		AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_M_01_03 " );	// Now that you can make a donation, you will receive new armor.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_M);
		CreateInvItems(hero,itar_tpl_m,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_M);
		BuyTemplerMed = TRUE;
	}
	else
	{
		AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_M_01_01 " );	// You don't have enough experience for this yet. Prove yourself a worthy Guardian and you will earn the right to wear the finest armor.
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_h()
{
	AI_Output(hero,self, " TPL_8005_GorNaKosh_ARMOR_H_01_00 " );	// I need heavy Guardian armor.

	if (chapter <  4 )
	{
		AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_H_01_01 " );	// You don't have enough experience for this yet. Prove yourself a worthy member of our Brotherhood, and you will earn the right to wear such perfect armor.
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_S)
	{
		AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_H_01_02 " );	// As soon as you have the opportunity to make a donation to the needs of the Brotherhood, you will receive new armor.
	}
	else
	{
		AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_H_01_03 " );	// You will now wear this armor as a token of the highest honor bestowed upon you by the Brotherhood.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_S);
		CreateInvItems(hero,itar_tpl_s,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_S);
		TAKETPLBESTARMOR = TRUE;
		BuyTemplerHeavy = TRUE;
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_l()
{
	AI_Output(hero,self, " TPL_8005_GorNaKosh_ARMOR_L_01_00 " );	// I need Guardian Light Armor.

	if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_L)
	{
		AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_L_01_02 " );	// As soon as you have the opportunity to make a donation to the needs of the Brotherhood, you will receive new armor.
	}
	else
	{
		AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_L_01_03 " );	// You will now wear this armor as a token of the highest honor bestowed upon you by the Brotherhood.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_L);
		CreateInvItems(hero,itar_tpl_l,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_L);
		BuyTemplerLight = TRUE;
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_back()
{
	AI_Output(hero,self, " TPL_8005_GorNaKosh_ARMOR_BACK_01_01 " );	// I changed my mind.
	AI_Output(self,hero, " TPL_8005_GorNaKosh_ARMOR_BACK_01_02 " );	// As you wish. You know where to find me.
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};


instance DIA_GORNAKOSH_GATHERARMY(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmy_condition;
	information = dia_gornakosh_gatherarmy_info;
	permanent = FALSE;
	description = "The Idol of Oran sent me. " ;
};


func int dia_gornakosh_gatherarmy_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_balorun_gatherarmy ))
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmy_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_GatherArmy_01_00 " );	// Idol Oran sent me.
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_01 " );	// And what does the supreme Guru want from me?
	AI_Output(other,self, " DIA_GorNaKosh_GatherArmy_01_02 " );	// He told you to tell you that the Brotherhood is ready to take on the orcs! You will fight alongside the paladins!
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_06 " );	// Well, great! (decidedly) I've been saying for a long time that you can't just sit back and wait for the orcs to show up here on their own.
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_09 " );	// But you see... (he hesitated) There still remains one more small problem.
	AI_Output(other,self, " DIA_GorNaKosh_GatherArmy_01_10 " );	// What's the problem?
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_13 " );	// Many of our acolytes will also want to join us. This is what worries me!
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_15 " );	// Going into battle with an entire army of orcs will be tantamount to certain death for them. They don't even have proper armor!
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_16 " );	// I don't think an acolyte's loincloth will reliably protect either of them from orc axes.
	AI_Output(other,self, " DIA_GorNaKosh_GatherArmy_01_17 " );	// Then give them Guardian Armor!
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_18 " );	// Our supplies are extremely limited since we left the camp in the swamps in the Valley of Mines.
	AI_Output(other,self, " DIA_GorNaKosh_GatherArmy_01_22 " );	// What do you suggest?
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_23 " );	// As far as I know orcs - these creatures are quite slow in combat.
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_24 " );	// So if we give my people a speed advantage, maybe they'll have a chance to hold their own against them.
	AI_Output(other,self, " DIA_GorNaKosh_GatherArmy_01_25 " );	// And what will help us with this?
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_26 " );	// The only thing I can think of is a haste potion or something! Only it can cause such an effect for a long time.
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmy_01_28 " );	// I guess 50 servings of this drink will be enough for everyone.
	MIS_GORNAKOSHSPEEDPOTION = LOG_Running;
	Log_CreateTopic(TOPIC_GORNAKOSHSPEEDPOTION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORNAKOSHSPEEDPOTION,LOG_Running);
	B_LogEntry( TOPIC_GORNAKOSHSPEEDPOTION , " In order for Gor Na Kosh and the Brotherhood to support the paladins in battle - I need to get him fifty drinks of haste or something like that. He believes that if his people gain an advantage in combat speed over the orcs, then they will have a chance to survive. This is his condition. We'll have to get him these drinks. " );
};


instance DIA_GORNAKOSH_GATHERARMYDONE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmydone_condition;
	information = dia_gornakosh_gatherarmydone_info;
	permanent = FALSE;
	description = " I got potions for your people. " ;
};

func int dia_gornakosh_gatherarmydone_condition()
{
	if((MIS_GORNAKOSHSPEEDPOTION == LOG_Running) && ((Npc_HasItems(other,ITPO_SPEED_03) >= 50) || (Npc_HasItems(other,ItPo_Speed) >= 50) || (Npc_HasItems(other,itpo_speed_02) >= 50) || (Npc_HasItems(other,ItFo_Addon_SchnellerHering) >= 50)))
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmydone_info()
{
	AI_Output(other,self, " DIA_GorNaKosh_GatherArmyDone_01_01 " );	// I've got some haste potions for your people.

	if(Npc_HasItems(other,ItFo_Addon_SchnellerHering) >= 50)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ItFo_Addon_SchnellerHering,50);
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_04 " );	// Hmmm... (suspiciously) And what is this?
		AI_Output(other,self, " DIA_GorNaKosh_GatherArmyDone_01_05 " );	// This drink is called 'Quick Herring'! It is much better than regular elixirs.
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_08 " );	// Hmm...(with caution) Okay. I hope you know what you're talking about.
		if (Npc_HasItems(self,ItFo_Addon_SchnellerHering) ==  0 )
		{
			CreateInvItem(self,ItFo_Addon_SchnellerHering);
		};
		AI_UseItem(self,ItFo_Addon_SchnellerHering);
		AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_09");	//Ааархх...
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_10 " );	// Damn... (grimacing) What a strong drink! I even got my ears stuffed up.
		AI_Output(other,self, " DIA_GorNaKosh_GatherArmyDone_01_11 " );	// Do you feel anything else besides this?
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_12 " );	// I think so... (surprised) Now I suddenly have the feeling that now I can overtake the dragon itself.
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_13 " );	// Where did you get this drink?
		AI_Output(other,self, " DIA_GorNaKosh_GatherArmyDone_01_14 " );	// Pirates. They really know a lot about good moonshine.
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_15 " );	// Well, okay... (decidedly) I think this will be enough for my people. At the same time, and clean their brains!
		; _ _ _ _ _ _
	}
	else if(Npc_HasItems(other,itpo_speed_02) >= 50)
	{
		B_GivePlayerXP(400);
		B_GiveInvItems(other,self,itpo_speed_02,50);
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_18 " );	// Double boost drink? Excellent! It's even better than I imagined.
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_21 " );	// Now my people will have an advantage over the orcs in combat. Thanks for your help.
		B_LogEntry( TOPIC_GORNAKOSHSPEEDPOTION , " I got fifty double elixirs of haste for Gorna Kosh. " );
	}
	else if(Npc_HasItems(other,ITPO_SPEED_03) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ITPO_SPEED_03,50);
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_24 " );	// Good! This is exactly what is needed.
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_25 " );	// Now my people will have an advantage over the orcs in combat. Thanks for your help.
		B_LogEntry( TOPIC_GORNAKOSHSPEEDPOTION , " I got fifty elixirs of haste for Gorna Kosh. " );
	}
	else if(Npc_HasItems(other,ItPo_Speed) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItPo_Speed,50);
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_24 " );	// Good! This is exactly what is needed.
		AI_Output(self,other, " DIA_GorNaKosh_GatherArmyDone_01_25 " );	// Now my people will have an advantage over the orcs in combat. Thanks for your help.
		B_LogEntry( TOPIC_GORNAKOSHSPEEDPOTION , " I got fifty elixirs of haste for Gorna Kosh. " );
	};
	MIS_GORNAKOSHSPEEDPOTION = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GORNAKOSHSPEEDPOTION,LOG_SUCCESS);
};

instance DIA_GORNAKOSH_GATHERARMYGO(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmygo_condition;
	information = dia_gornakosh_gatherarmygo_info;
	permanent = FALSE;
	description = " Are you ready to support paladins now? " ;
};

func int dia_gornakosh_gatherarmygo_condition()
{
	if(MIS_GORNAKOSHSPEEDPOTION == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmygo_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_GorNaKosh_GatherArmyGo_01_01 " );	// Are you ready to support the paladins now?
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmyGo_01_02 " );	// Yes, you can go and deliver my answer to Lord Hagen himself.
	AI_Output(self,other, " DIA_GorNaKosh_GatherArmyGo_01_03 " );	// And at the same time ask him where he plans to fight the orcs!
	TPL_JOINHAGEN = TRUE;
	B_LogEntry( TOPIC_OR with GREATWAR , " Gor Na Kosh and his warriors will join the paladin army. I need to inform Lord Hagen about this and find out where he plans to fight the orcs. " );
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};
