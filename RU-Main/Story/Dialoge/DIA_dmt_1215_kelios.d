

instance DMT_1215_KELIOS_EXIT(C_Info)
{
	npc = dmt_1215_paths;
	nr = 999;
	condition = dmt_1215_kelios_exit_condition;
	information = dmt_1215_kelios_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1215_kelios_exit_condition()
{
	return TRUE;
};

func void dmt_1215_kelios_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1215_KELIOS_HELLO(C_Info)
{
	npc = dmt_1215_paths;
	condition = dmt_1215_kelios_hello_condition;
	information = dmt_1215_kelios_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1215_kelios_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (TEGON_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1215_kelios_hello_info()
{
	AI_Output(self,other, " DMT_1215_Kelios_Hello_00 " );	// So, as I see it, you managed to pass all the tests of the Guardians of Darkness.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_03 " );	// However, do not think that the rest of the tests will be a cakewalk for you.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_05 " );	// Remember this and don't let the euphoria of success cloud your mind and dull your senses.
	AI_Output(other,self, " DMT_1215_Kelios_Hello_06 " );	// Of course, I understand that.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_07 " );	// (imperiously) Good. Then it's your turn to pass the tests of the Keepers of Fire.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_08 " );	// And I - Kelios, the first Guardian of this element - give you my test!
	Info_ClearChoices(dmt_1215_kelios_hello);
	Info_AddChoice(dmt_1215_kelios_hello, " Yes master. " ,dmt_1215_kelios_hello_test);
};

func void dmt_1215_kelios_hello_test()
{
	AI_Output(other,self, " DMT_1215_Kelios_Hello_09 " );	// Yes, master.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1215_Kelios_Hello_10 " );	// Listen carefully. As you already understood, my element is fire!
	AI_Output(self,other, " DMT_1215_Kelios_Hello_11 " );	// This is what gives warmth to the hearth and at the same moment incinerates everything around it in the blink of an eye!
	AI_Output(self,other, " DMT_1215_Kelios_Hello_12 " );	// He is the mediator between the visible and the invisible, between form and magical energy.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_13 " );	// In order to understand all this yourself, you will first have to know its essence.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_14 " );	// And the Purification by Fire ritual will help you with this!
	AI_Output(other,self, " DMT_1215_Kelios_Hello_15 " );	// Purification by Fire?
	AI_Output(self,other, " DMT_1215_Kelios_Hello_16 " );	// Yes, you heard right. Only in this way will you be able to absorb the great wisdom of this element.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_17 " );	// And only then will you be able to pass my test. Pass it - and you will gain my consent!
	AI_Output(other,self, " DMT_1215_Kelios_Hello_18 " );	// I'll try, what should I do?
	AI_Output(self,other, " DMT_1215_Kelios_Hello_19 " );	// It's very simple. Head north to the old ruins of the ancients.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_20 " );	// There you will find a magic stone of teleportation, which will take you to the place of your test.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_21 " );	// Everything else, I think you will understand yourself.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_22 " );	// After you've completed the cleansing ritual, return to me. I'll be waiting for you.
	AI_Output(other,self, " DMT_1215_Kelios_Hello_23 " );	// Good. I understand, master.
	AI_Output(self,other, " DMT_1215_Kelios_Hello_24 " );	// Then go, and may the Fire keep you!
	AI_StopProcessInfos(self);
	MIS_KELIOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_KELIOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KELIOSTEST,LOG_Running);
	B_LogEntry( TOPIC_KELIOSTEST , " The first Keeper of Fire - Kelios - gave me another test. I must pass the ritual Purification by Fire. In the northern part of the island, in the old ruins of the ancients, there is a teleportation stone that opens the way to the place of the ritual. After its completion, Keeper Kelios awaits me. Only so I will get his consent to join the adherents of the Guardians of the Elements. " );
};


instance DMT_1215_KELIOS_TEST(C_Info)
{
	npc = dmt_1215_paths;
	nr = 1;
	condition = dmt_1215_kelios_test_condition;
	information = dmt_1215_kelios_test_info;
	permanent = FALSE;
	description = " I've completed the Purification by Fire ritual! " ;
};


func int dmt_1215_kelios_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1215_kelios_test_info()
{
	B_GivePlayerXP(150);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_Output(other,self, " DMT_1215_Kelios_Test_00 " );	// I've successfully completed the Purification by Fire ritual!
	AI_Output(self,other, " DMT_1215_Kelios_Test_01 " );	// (imperiously) I already know about it. The Holy Fire has cleansed your soul and endowed your mind with wisdom.
	AI_Output(self,other, " DMT_1215_Kelios_Test_02 " );	// Now this element will be more favorable to you. I think that you yourself felt it.
	AI_Output(other,self, " DMT_1215_Kelios_Test_03 " );	// Yes, it is.
	AI_Output(self,other, " DMT_1215_Kelios_Test_04 " );	// No doubt. As for your test, I recognize it as passed by you.
	AI_Output(self,other, " DMT_1215_Kelios_Test_05 " );	// And in connection with this, by the authority given to me by the Fire, I give you my consent to be accepted as an adherent of the Circle of Guardians.
	AI_Output(self,other, " DMT_1215_Kelios_Test_06 " );	// Your abilities have surprised me, and it seems to me that your presence in our ranks will not be long in coming!
	AI_Output(self,other, " DMT_1215_Kelios_Test_07 " );	// Now go, chosen one. Look for the next one of us.
	AI_Output(self,other, " DMT_1215_Kelios_Test_08 " );	// And may the sacred Fire guide your path!
	other.protection[PROT_FIRE] += 5;
	REALPROTFIRE += 5;
	AI_Print(PRINT_LEARNPROTHOT);
	MIS_KELIOSTEST = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_KELIOSTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_KELIOSTEST , " I have completed the Purification by Fire ritual and thus passed the test of Guardian Kelios. " );
	Log_AddEntry( TOPIC_GUARDIANSTEST , " Guardian Kelios has given me his consent to become an Adept of their Circle. " );
	SEVERAL_AGREE = TRUE ;
	Info_ClearChoices(dmt_1215_kelios_test);
	Info_AddChoice(dmt_1215_kelios_test, " (end call) " ,dmt_1215_kelios_test_end);
};

func void dmt_1215_kelios_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

