

instance DIA_BAALPARVEZ_EXIT(C_Info)
{
	npc = gur_8004_parvez;
	nr = 999;
	condition = dia_baalparvez_exit_condition;
	information = dia_baalparvez_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baalparvez_exit_condition()
{
	return TRUE;
};

func void dia_baalparvez_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baalparvez_PICKPOCKET(C_Info)
{
	npc = gur_8004_parvez;
	nr = 900;
	condition = dia_baalparvez_PICKPOCKET_Condition;
	information = dia_baalparvez_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baalparvez_PICKPOCKET_Condition()
{
	return  C_Robbery ( 49 , 35 );
};

func void dia_baalparvez_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
	Info_AddChoice(dia_baalparvez_PICKPOCKET,Dialog_Back,dia_baalparvez_PICKPOCKET_BACK);
	Info_AddChoice(dia_baalparvez_PICKPOCKET, DIALOG_PICKPOCKET ,dia_baalparvez_PICKPOCKET_DoIt);
};

func void dia_baalparvez_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
};

func void dia_baalparvez_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
};


instance DIA_BAALPARVEZ_NOTALK_SLEEPER (C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_notalk_sleeper_condition;
	info = dia_baalparvez_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = " May the Sleeper be with you! " ;
};


func int dia_baalparvez_notalk_sleeper_condition()
{
	if((IDOLPARVEZ_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalparvez_notalk_sleeper_info()
{
	AI_Output(other,self, " DIA_BaalParvez_NoTalk_Sleeper_01_00 " );	// May the Sleeper be with you!
	AI_Output(self,other,"DIA_BaalParvez_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_NOTALK_IMP(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_notalk_imp_condition;
	information = dia_baalparvez_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = " Is everything all right, buddy? " ;
};


func int dia_baalparvez_notalk_imp_condition()
{
	if((IDOLPARVEZ_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalparvez_notalk_imp_info()
{
	AI_Output(other,self, " DIA_BaalParvez_NoTalk_Imp_01_00 " );	// Are you all right, mate?
	AI_Output(self,other,"DIA_BaalParvez_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_SPECIALJOINT(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_specialjoint_condition;
	information = dia_baalparvez_specialjoint_info;
	permanent = TRUE;
	important = FALSE;
	description = " (offer cooked 'Sleep Call') " ;
};

func int dia_baalparvez_specialjoint_condition()
{
	if (( IDOLPARVEZ_YES  ==  FALSE ) && ( CANBEGURU  ==  TRUE ) && (other.guild ==  GIL_SEK ) && (Npc_HasItems(other,itmi_specialjoint) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_baalparvez_specialjoint_info()
{
	AI_Output(other,self, " DIA_BaalParvez_SpecialJoint_01_00 " );	// Here, my lord, accept this modest gift from your faithful disciple.
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,itmi_specialjoint,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,itmi_specialjoint);
	AI_Output(self,other,"DIA_BaalParvez_SpecialJoint_01_01");	//Мммм...
	IDOLPARVEZ_YES = TRUE;
	Npc_SetRefuseTalk(self,5);
	hero.aivar[ AIV_INVINCIBLE ] = FALSE ;
};


instance DIA_BAALPARVEZ_SPECIALJOINTOK(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_specialjointok_condition;
	information = dia_baalparvez_specialjointok_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalparvez_specialjointok_condition()
{
	if((IDOLPARVEZ_YES == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_baalparvez_specialjointok_info()
{
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_00 " );	// In the name of the Sleeper! I had a vision!
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_01 " );	// It was incredible! I saw that we met a new brother who was unlike all those who had come before him.
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_02 " );	// He was doing something for us... He had a sword in his hand, and he was descending a wide staircase. This is where the vision ended.
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_03 " );	// He looked a lot like YOU. Who are you? What do you need?
	AI_Output(other,self, " DIA_BaalParvez_SpecialJointOk_01_04 " );	// I would like to join the Brotherhood and ask for your consent, sir.
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_05 " );	// Hmm...(looks intently) Who sent you to me?
	AI_Output(other,self, " DIA_BaalParvez_SpecialJointOk_01_06 " );	// Idol Oran sent me. He said that I should get your approval for that.
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_07 " );	// Well, if Idol Oran sent you, it's quite possible.
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_08 " );	// Do me one favor. Prove your loyalty, and then I will give my consent for you to become one of us.
	AI_Output(other,self, " DIA_BaalParvez_SpecialJointOk_01_09 " );	// How can I prove my loyalty?
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_10 " );	// Most of all, we need new souls who have comprehended the truth and entered the Circle of Brotherhood.
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_11 " );	// If you convince one of the infidels to join our Camp, you will prove your desire to serve the Brotherhood.
	AI_Output(other,self, " DIA_BaalParvez_SpecialJointOk_01_12 " );	// Where can I find such a person?
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_13 " );	// There are many people in the city who are tired of fear and lies. Their souls yearn for enlightenment and support.
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_14 " );	// I think you should look for it here. Elsewhere you will hardly succeed. Real barbarians live there.
	AI_Output(self,other, " DIA_BaalParvez_SpecialJointOk_01_15 " );	// Return to me when your search is over.
	Log_CreateTopic(TOPIC_NOVICECANJOIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NOVICECANJOIN,LOG_Running);
	B_LogEntry( TOPIC_NOVICECANJOIN , " Idol Parvez has asked me to bring a new acolyte to him. This is a good chance to earn his favor. " );
	MIS_NOVICECANJOIN = LOG_Running;
};


instance DIA_BAALPARVEZ_VALENTINOJOIN(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_valentinojoin_condition;
	information = dia_baalparvez_valentinojoin_info;
	permanent = FALSE;
	important = FALSE;
	description = " This person seeks your favor, sir! " ;
};


func int dia_baalparvez_valentinojoin_condition()
{
	var C_Npc Valentino;
	Valentino = Hlp_GetNpc(VLK_421_Valentino);
	if((MIS_NOVICECANJOIN == LOG_Running) && (other.guild == GIL_SEK) && (Npc_GetDistToNpc(self,Valentino) < 500))
	{
		return TRUE;
	};
};

func void dia_baalparvez_valentinojoin_info()
{
	var C_Npc Valentino;
	Valentino = Hlp_GetNpc(VLK_421_Valentino);
	Valentino.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_GotoNpc(Valentino,self);
	AI_TurnToNPC(Valentino,self);
	AI_Output(other,self, " DIA_BaalParvez_ValentinoJoin_01_00 " );	// This man seeks your favor, master!
	AI_Output(self,other, " DIA_BaalParvez_ValentinoJoin_01_01 " );	// Who did you bring to me? Is he worthy?
	AI_Output(other,self, " DIA_BaalParvez_ValentinoJoin_01_02 " );	// He needs a spiritual mentor.
	AI_Output(self,other, " DIA_BaalParvez_ValentinoJoin_01_03 " );	// Very good. From now on, he will be one of my students.
	AI_TurnToNPC(self,Valentino);
	AI_TurnToNPC(Valentino,self);
	AI_Output(self,other, " DIA_BaalParvez_ValentinoJoin_01_04 " );	// You will come to me every day and listen to what I have to say to you. Your soul can still be saved.
	AI_TurnToNPC(self,other);
	Npc_ExchangeRoutine(VLK_421_Valentino,"JoinPsiCamp");
	Npc_ExchangeRoutine(gur_8004_parvez,"JoinPsiCamp");
	MIS_NOVICECANJOIN = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NOVICECANJOIN,LOG_SUCCESS);
	B_LogEntry( TOPIC_NOVICECANJOIN , " Valentino is now a student of Idol Parvez. I have completed Guru's order. " );
	B_GivePlayerXP(250);
};


instance DIA_BAALPARVEZ_AGREED (C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_agreed_condition;
	information = dia_baalparvez_agreed_info;
	permanent = FALSE;
	important = FALSE;
	description = " Sir! I want to become one of the Gurus. " ;
};


func int dia_baalparvez_agreed_condition()
{
	if((MIS_NOVICECANJOIN == LOG_SUCCESS) && (PARVEZAGREED == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalparvez_agreed_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalParvez_Agreed_01_00 " );	// Mister! I want to become one of the Gurus.
	AI_Output(self,other, " DIA_BaalParvez_Agreed_01_01 " );	// Good. You have proven yourself worthy of this honor!
	AI_Output(self,other, " DIA_BaalParvez_Agreed_01_02 " );	// Go to Idol Oran.
	AI_Output(self,other, " DIA_BaalParvez_Agreed_01_03 " );	// Now leave me. I have a lot to discuss with my new student.
	AI_TurnToNPC(self,VLK_421_Valentino);
	AI_Output(self,other, " DIA_BaalParvez_Agreed_01_04 " );	// Follow me, my student.
	B_LogEntry( TOPIC_PSICAMPJOIN , " Idol Parvez agrees to my acceptance into the Guru Circle. " );
	PARVEZAGREED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_runemagicnotwork_condition;
	information = dia_baalparvez_runemagicnotwork_info;
	permanent = FALSE;
	description = " How is your magic doing? " ;
};


func int dia_baalparvez_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalparvez_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalParvez_RuneMagicNotWork_01_00 " );	// How's your magic doing?
	AI_Output(self,other, " DIA_BaalParvez_RuneMagicNotWork_01_01 " );	// Our magic runes have weakened and are no longer able to cast spells!
	AI_Output(self,other, " DIA_BaalParvez_RuneMagicNotWork_01_02 " );	// We are all extremely surprised by this circumstance, but there is nothing we can do.
	AI_Output(self,other, " DIA_BaalParvez_RuneMagicNotWork_01_03 " );	// This is all pretty weird.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , "The Gurus of the Brotherhood have also lost their power over rune magic! " );
	GURUMAGERUNESNOT = TRUE;
};

instance DIA_BaalParvez_PrioratStart(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = DIA_BaalParvez_PrioratStart_condition;
	information = DIA_BaalParvez_PrioratStart_info;
	permanent = FALSE;
	description = "The Namib Idol sent me. " ;
};

func int DIA_BaalParvez_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_BaalParvez_PrioratStart_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_BaalParvez_PrioratStart_01_00 " );	// The Namib Idol sent me.
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_01");	//(вздох)
	AI_Output(other,self, " DIA_BaalParvez_PrioratStart_01_02 " );	// The case concerns the missing acolytes of the Brotherhood. You don't know anything about it?
	AI_Output(self,other, " DIA_BaalParvez_PrioratStart_01_03 " );	// Well, if you know what's going on, then the Namib really trusts you.
	AI_Output(self,other, " DIA_BaalParvez_PrioratStart_01_04 " );	// In answer to your question, all I can tell you is that there aren't any in the city.
	AI_Output(other,self, " DIA_BaalParvez_PrioratStart_01_05 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_BaalParvez_PrioratStart_01_06 " );	// Absolutely! They would never have passed the city guards unnoticed. I would have known about it for sure.
	AI_Output(self,other, " DIA_BaalParvez_PrioratStart_01_07 " );	// However, if you don't believe me, you can look for them yourself.
	AI_Output(other,self, " DIA_BaalParvez_PrioratStart_01_08 " );	// Okay, I'll pass on your words to the Namib Idol. Goodbye!
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_09");	//(вздох)
	PsiCamp_04_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart, " According to Idol Parvez, missing novices did not appear in the city. " );
};
