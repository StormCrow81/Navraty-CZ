
instance DIA_Serpentes_Kap1_EXIT (C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 999;
	condition = DIA_Serpentes_Kap1_EXIT_Condition;
	information = DIA_Serpentes_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Serpentes_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Serpentes_NoEnter_PissOff (C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 1;
	condition = DIA_Serpentes_NoEnter_PissOff_Condition;
	information = DIA_Serpentes_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Serpentes_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};


instance DIA_Serpentes_NOTALK(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOTALK_Condition;
	information = DIA_Serpentes_NOTALK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Serpentes_NOTALK_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOTALK_Info()
{
	AI_Output(self,other, " DIA_Serpentes_NOTALK_10_00 " );	// You dare to speak to me, acolyte? Get back to your work.
	Info_ClearChoices(DIA_Serpentes_NOTALK);
	Info_AddChoice(DIA_Serpentes_NOTALK, " I don't have to go . " ,DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice(DIA_Serpentes_NOTALK, " I have one more question... " ,DIA_Serpentes_NOTALK_QUESTION);
};

func void DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output(other,self, " DIA_Serpentes_NOTALK_QUESTION_15_00 " );	// I have one more question...
	AI_Output(self,other, " DIA_Serpentes_NOTALK_QUESTION_10_01 " );	// (furious) You don't seem to understand. I decide when to talk to you and when not. What did you imagine about yourself?
	AI_Output(self,other, " DIA_Serpentes_NOTALK_QUESTION_10_02 " );	// Now get back to work!
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_GOAWAY (C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_GOAWAY_Condition;
	information = DIA_Serpentes_GOAWAY_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_GOAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Serpentes_NOTALK) && Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOAWAY_Info()
{
	AI_Output(self,other, " DIA_Serpentes_GOAWAY_10_00 " );	// Your presence here speaks not only of your lack of respect, but also of your stupidity, novice!
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_YOURSTORY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 24;
	condition = DIA_Serpentes_YOURSTORY_Condition;
	information = DIA_Serpentes_YOURSTORY_Info;
	permanent = FALSE;
	description = " I heard you passed the Trial by Fire. " ;
};


func int DIA_Serpentes_YOURSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulthar_TEST) && (other.guild ==  GIL_NOV ) && (Npc_KnowsInfo(hero, DIA_Pyrokar_MAGICAN) ==  FALSE ) && ( MY_GOLEM  !=  LOG_SUCCESS )) ;
	{
		return TRUE;
	};
};

func void DIA_Serpentes_YOURSTORY_Info()
{
	AI_Output(other,self, " DIA_Serpentes_YOURSTORY_15_00 " );	// I heard you passed the Trial by Fire.
	AI_Output(self,other, " DIA_Serpentes_YOURSTORY_10_01 " );	// With all my modesty, I will tell you about it. All others who attempted this test are dead.
	AI_Output(self,other, " DIA_Serpentes_YOURSTORY_10_02 " );	// You shouldn't try this test. Your spirit is weak. Better serve in the monastery, and perhaps in a few years you will be chosen.
	AI_Output(other,self, " DIA_Serpentes_YOURSTORY_15_03 " );	// I want to pass this test.
	AI_Output(self,other, " DIA_Serpentes_YOURSTORY_10_04 " );	// If this is the will of Innos, then you will pass. But if not, then you will die.
};



instance DIA_Serpentes_TEST(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_TEST_Condition;
	information = DIA_Serpentes_TEST_Info;
	permanent = FALSE;
	description = " I'm ready to take your test, master. " ;
};


func int DIA_Serpentes_TEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_TEST_Info()
{
	AI_Output(other,self, " DIA_Serpentes_TEST_15_00 " );	// I'm ready to pass your test, master.
	AI_Output(self,other, " DIA_Serpentes_TEST_10_01 " );	// So, you want to be subjected to this test. Only the most courageous novices demand it. But courage isn't all you need.
	AI_Output(self,other, " DIA_Serpentes_TEST_10_02 " );	// Are you smart enough to pass this test? Do you have the strength to meet all the dangers that await you?
	AI_Output(self,other, " DIA_Serpentes_TEST_10_03 " );	// If not, you will pay for this with your life.
	AI_Output(self,other, " DIA_Serpentes_TEST_10_04 " );	// Now listen: In the Place of Stones, find the one who was never born - find the one who was once summoned.
	AI_Output(self,other, " DIA_Serpentes_TEST_10_05 " );	// Defeat the one who cannot be defeated - measure your strength with a living rock, fight with an immortal stone - and destroy it.
	Wld_InsertNpc(MagicGolem,"FP_MAGICGOLEM");
	Magic_Golem = Hlp_GetNpc(MagicGolem);
	MIS_GOLEM = LOG_Running;
	Log_CreateTopic(TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Golem,LOG_Running);
	B_LogEntry(TOPIC_Golem, " Serpentes has given me a test. He wants me to 'find him who once was summoned', a living rock, and defeat him. " );
};

instance DIA_Serpentes_NOIDEA (C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOIDEA_Condition;
	information = DIA_Serpentes_NOIDEA_Info;
	permanent = FALSE;
	description = " What kind of creature is this supposed to be? " ;
};

func int DIA_Serpentes_NOIDEA_Condition()
{
	if((MIS_GOLEM == LOG_Running) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Snakes_NOIDEA_Info()
{
	AI_Output(other,self, " DIA_Serpentes_NOIDEA_15_00 " );	// Living rock?! What kind of creature should it be?
	AI_Output(self,other, " DIA_Serpentes_NOIDEA_10_01 " );	// I told you everything... (with a sneer) Or does this test seem too difficult for you?
	AI_Output(self,other, " DIA_Serpentes_NOIDEA_10_02 " );	// Now you'll know what it means to pass the Trial by Fire - I won't answer your questions anymore.
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_NOHELP(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOHELP_Condition;
	information = DIA_Serpentes_NOHELP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_NOHELP_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Serpents_NOIDEA) && (Npc_IsDead(Magic_Golem) ==  FALSE ) && ( MY_GOLEM  == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild ==  GIL_NOV ) && ((Npc_Knows_Info(other,DIA_TEST) ==  FALSE ) || Npc_KnowsInfo(other,DIA_Serpents_YOURSTORY)))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOHELP_Info()
{
	AI_Output(self,other, " DIA_Serpentes_NOHELP_10_00 " );	// (with contempt) Go and do your task, novice!
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_SUCCESS(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 3;
	condition = DIA_Serpentes_SUCCESS_Condition;
	information = DIA_Serpentes_SUCCESS_Info;
	permanent = FALSE;
	description = " I defeated the golem. " ;
};


func int DIA_Serpentes_SUCCESS_Condition()
{
	if ( Npc_IsDead ( MagicGolem ) && ( MY_GOLEM  == LOG_Running ) & & ( hero . guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_SUCCESS_Info()
{
	var C_Npc Garwig;
	Garwig = Hlp_GetNpc(Nov_608_Garwig);
	AI_Output(other,self, " DIA_Serpentes_SUCCESS_15_00 " );	// I defeated the golem.
	AI_Output(self,other, " DIA_Serpentes_SUCCESS_10_01 " );	// What? Did you really do it? But without the Hammer of Innos, you would never have been able to destroy this golem.
	if (Npc_IsDead(Garwig))
	{
		AI_Output(self,other, " DIA_Serpentes_SUCCESS_10_02 " );	// (triumphantly) But you betrayed yourself! You killed Garvig!
		AI_Output(self,other, " DIA_Serpentes_SUCCESS_10_03 " );	// YOU WILL BE PUNISHED FOR KILLING INNOS' SERVANT!!!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_HumanMurderedHuman,0);
	}
	else
	{
		AI_Output(self,other, " DIA_Serpentes_SUCCESS_10_04 " );	// (regretfully) However, I must admit that you completed the task I gave you.
	};
	if(Npc_HasItems(other,Holy_Hammer_MIS) >= 1)
	{
		AI_Output(self,other, " DIA_Serpentes_SUCCESS_10_05 " );	// And it's better if I take this hammer.
		Npc_RemoveInvItems(other,Holy_Hammer_MIS,1);
		Wld_InsertItem(Holy_Hammer_MIS,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP(XP_GOLEM);
};


instance DIA_Serpentes_PERM(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 99;
	condition = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent = TRUE;
	description = " Is there anything else you want to tell me? " ;
};


func int DIA_Serpentes_PERM_Condition()
{
	if ((Chapter >=  3 ) || Npc_KnowsInfo(other,DIA_Serpents_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_PERM_Info()
{
	AI_Output(other,self, " DIA_Serpentes_PERM_15_00 " );	// Is there anything else you want to tell me?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Serpentes_PERM_10_01 " );	// No. Not yet, brother.
	}
	else
	{
		AI_Output(self,other, " DIA_Serpentes_PERM_10_02 " );	// Free. You know what you need to do.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_MinenTeile (C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 30;
	condition = DIA_Serpentes_MinenAnteile_Condition;
	information = DIA_Serpentes_MinenTeile_Info;
	important = TRUE;
};


func int DIA_Serpentes_MinenAnteile_Condition()
{
	if ((Peter_Traitor ==  TRUE ) && ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_SLD ) || (hero.guild ==  GIL_DJG )) && (Chapter >=  3 ) && (DarkPathStart = =  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_MinenAnteile_Info()
{
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_10_00 " );	// Not so fast. I have one more task for you.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Serpentes_MinenAnteile_15_01 " );	// (sighs) What else?
		AI_Output(self,other, " DIA_Serpentes_MinenAnteile_10_02 " );	// Now that you belong to the Brotherhood of Fire, you must also fulfill the duties that come with your position.
		AI_Output(self,other, " DIA_Serpentes_MinenAnteile_10_03 " );	// The Church is not only concerned with matters of magic - it is also, as you know, the final authority in the matter of the administration of justice.
		AI_Output(self,other, " DIA_Serpentes_MinenAnteile_10_04 " );	// The last case we've had to deal with opens up a bottomless chasm that needs to be dealt with once and for all.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, " I already have a lot of tasks. Find someone else. " ,DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, " What did you think? " ,DIA_Serpentes_MinenAnteile_was);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, " Isn't this the work of the militia? " ,DIA_Serpentes_MinenAnteile_miliz);
	}
	else
	{
		AI_Output(self,other, " DIA_Serpentes_MinenAnteile_10_05 " );	// A mercenary like you could help us a lot in this matter.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, " I already have a lot of tasks. Find someone else. " ,DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, " Who should I kill? " ,DIA_Serpentes_MinenAnteile_KillSLD);
	};
};

func void DIA_Serpentes_MinenTeile_miliz()
{
	AI_Output(other,self, " DIA_Serpentes_MinenAnteile_miliz_15_00 " );	// Isn't this the work of the militia?
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_miliz_10_01 " );	// The militia is only responsible for the city. This case could have far-reaching consequences.
};

func void DIA_Serpentes_MinenTeile_no()
{
	AI_Output(other,self, " DIA_Serpentes_MinenAnteile_nein_15_00 " );	// I already have a lot of tasks. Find someone else.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_nein_10_02 " );	// I'm reprimanding you. I hope this doesn't happen again - otherwise you'll end up badly.
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_MinenTeile_was()
{
	AI_Output(other,self, " DIA_Serpentes_MinenAnteile_was_15_00 " );	// Well, what else is there?
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_10_01 " );	// Someone in town is selling counterfeit shares in the mines of the former penal colony.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_10_02 " );	// These papers are completely useless and have little value. But still, they can sow unrest and discontent among people that we cannot afford in the current situation.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_10_03 " );	// This scammer supposedly has connections with all the most powerful merchants in the city and countryside, and has already managed to sell his counterfeit shares to some of them.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_10_04 " );	// Find this crook and bring him here. In such difficult times, we will not tolerate crooks and robbers.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_10_05 " );	// This case should become indicative, so that others would be discouraged.
	Info_AddChoice(DIA_Serpentes_MinenAnteile, " I'll try to clarify this question. " ,DIA_Serpentes_MinenAnteile_was_ja);
};

func void DIA_Serpentes_MinenTeile_was_ja()
{
	AI_Output(other,self, " DIA_Serpentes_MinenAnteile_was_ja_15_00 " );	// I'll try to clarify this issue.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_ja_10_01 " );	// One more thing. When you talk to these traders, it is important that they do not understand that you are looking for these stocks.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_ja_10_02 " );	// I think they'll want to sell them, but they'll probably refuse to do business with you if they realize you're acting on behalf of the Church, you know?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Да.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_ja_10_04 " );	// Then get to work. I wish you success brother.
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	MIS_Serpentes_MinenAnteil_KDF = LOG_Running;
	if (Npc_IsDead(Salandril) ==  FALSE )
	{
		CreateInvItems(Salandril,ItWr_MinenAnteil_Mis,2);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	};
	if (Npc_IsDead(VLK_416_Matteo) ==  FALSE )
	{
		CreateInvItems(VLK_416_Matteo,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if (Npc_IsDead(VLK_413_Bosper) ==  FALSE )
	{
		CreateInvItems(VLK_413_Bosper,ItWr_MinenAnteil_Mis, 1 );
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if (Npc_IsDead(VLK_409_Zuris) ==  FALSE )
	{
		CreateInvItems(VLK_409_Zuris,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if (Npc_IsDead(BAU_911_Elena) ==  FALSE )
	{
		CreateInvItems(BAU_911_Elena,ItWr_MinenAnteil_Mis,2);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	};
	if (Npc_IsDead(BAU_970_Orlan) ==  FALSE )
	{
		CreateInvItems(BAU_970_Orlan,ItWr_MinenAnteil_Mis, 1 );
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if (Npc_IsDead(VLK_407_Hakon) ==  FALSE )
	{
		CreateInvItems(VLK_407_Hakon,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if (Npc_IsDead(BAU_936_Rosi) ==  FALSE )
	{
		CreateInvItems(BAU_936_Rosi,ItWr_MinenAnteil_Mis, 1 );
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if ((Npc_IsDead(VLK_468_Canthar) ==  FALSE ) && ( CANTHAR_AUSGELIEFERT2  ==  FALSE ))
	{
		CreateInvItems(VLK_468_Canthar,ItWr_MinenAnteil_Mis,3);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	};
	SalandrilDistributedMinenShare = SalandrilMinenShare_MAINCounter;
	Log_CreateTopic(TOPIC_MinenAnteile,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteile, " Someone is selling fake shares of the mine and getting rich in such an illegal way. I have to find out who is selling these shares to traders. Serpentes wants to get all these fake documents. " );
};

func void DIA_Serpentes_MinenAnteile_KillSLD()
{
	AI_Output(other,self, " DIA_Serpentes_MinenAnteile_Kill_15_00 " );	// Who should I kill?
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_Kill_10_01 " );	// Oh, Innos. Nobody, of course. This business requires finesse, you rude dork.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_Kill_10_02 " );	// Salandril, an alchemist from the upper quarter, is guilty of a serious crime and should be punished for it.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_Kill_10_03 " );	// However, he refuses to come to the monastery for judgment. Bring him here.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_Kill_10_04 " );	// How you do it, I don't care. But of course you will be rewarded.
	Info_AddChoice(DIA_Serpentes_MinenAnteile, " Isn't this the work of the militia? " ,DIA_Serpentes_MinenAnteile_miliz);
	Info_AddChoice(DIA_Serpentes_MinenAnteile, " No problem. I'll do it. " ,DIA_Serpentes_MinenAnteile_was_jaSLD);
};


var int MIS_Serpentes_BringSalandril_SLD;

func void DIA_Serpentes_MinenTeile_was_jaSLD()
{
	AI_Output(other,self, " DIA_Serpentes_MinenAnteile_was_jaSLD_15_00 " );	// No problem. I will do it.
	AI_Output(self,other, " DIA_Serpentes_MinenAnteile_was_jaSLD_10_01 " );	// Good. We expect to hear from you in a few days.
	MIS_Serpentes_BringSalandril_SLD = LOG_Running;
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	Log_CreateTopic(TOPIC_MinenAnteile,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteile, " I have to deliver Salandril, an alchemist from upper Khorinis, to the monastery for judgment. I don't really care what he did there as long as I'm well paid for it. " );
};


instance DIA_Serpentes_Bring mine shares (C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 2;
	condition = DIA_Serpentes_MinenAnteileBringen_Condition;
	information = DIA_Serpentes_MinenTeileBringen_Info;
	permanent = TRUE;
	description = " About fake stocks... " ;
};


func int DIA_Serpentes_MinenAnteileBringen_Condition()
{
	if ((MY_Serpent_MineBefore_KDF == LOG_Running) && Npc_HasItems(other,ItWr_MineBefore_My) && (hero.guild ==  GIL_KDF ))
	{
		return TRUE;
	};
};


var int SerpentesMinenAnteilCounter;

func void DIA_Serpentes_MinenAnteileBringen_Info()
{
	var int SerpentesMinenAnteilCount;
	var int XP_BringSerpentesMineShare;
	var int SerpentesMineShareOffer;
	var int SerpentesMinesShareMoney;
	var string MineAnteilText;
	var string MinenAnteilLeft;
	SerpentesMinenTeilCount = Npc_HasItems(other,ItWr_MinenTeil_Mis);
	SerpentesMineShareOffer = 200 ;
	if(SerpentesMinenAnteilCount == 1)
	{
		AI_Output(other,self, " DIA_Serpentes_MinenAnteileBringen_15_00 " );	// I was able to find shares in the mines.
		B_GivePlayerXP(XP_BringSerpentesMinenAnteil);
		B_GiveInvItems(other,self,ItWr_MinenAnteil_Mis,1);
		SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
	}
	else
	{
		AI_Output(other,self, " DIA_Serpentes_MinenAnteileBringen_15_01 " );	// I was able to find some mine stocks.
		B_GiveInvItems(other,self,ItWr_MinenAnteil_Mis,SerpentesMinenAnteilCount);
		XP_BringSerpentesMinenTeil = SerpentesMinenTeilCount * XP_BringSerpentesMinenTeil;
		SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount;
		B_GivePlayerXP(XP_BringSerpentesMinenAnteils);
	};
	SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;
	MinenAnteilLeft = IntToString(SalandrilMinenAnteil_MAINCounter);
	MinenAnteilText = ConcatStrings(MinenAnteilLeft,PRINT_NumberLeft);
	AI_Print(MinenAnteilText);

	if (SerpentesMineShareCounter < SalandrilDistributedMineShare)
	{
		AI_Output(self,other, " DIA_Serpentes_MinenAnteileBringen_10_02 " );	// Very good. You must retire all shares. This is poison for our people. Bring them all to me.
		AI_Output(self,other, " DIA_Serpentes_MinenAnteileBringen_10_03 " );	// Here. This will offset your expenses.
	}
	else  if (SerpentesMineShareCounter == SalandrilDistributedMineShare)
	{
		AI_Output(other,self, " DIA_Serpentes_MinenAnteileBringen_15_04 " );	// These are all shares, I think.
		AI_Output(self,other, " DIA_Serpentes_MinenAnteileBringen_10_05 " );	// Great. You deserve an award.
		AI_Output(self,other, " DIA_Serpentes_MinenAnteileBringen_10_06 " );	// Take this protective amulet. He will guide you on the path that is yet to come.
		CreateInvItems(self,ItAm_Prot_Mage_01,1);
		B_GiveInvItems(self,other,ItAm_Prot_Mage_01,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Serpentes_MinenAnteileBringen_10_07 " );	// This is really the last action, right?
	};
	SerpentesMineShareMoney = SerpentesMineShareCount * SerpentesMineShareOffer;
	CreateInvItems(self,ItMi_Gold,SerpentesMinenShareMoney);
	B_GiveInvItems(self,other,ItMi_Gold,SerpentesMinenShareMoney);
};


instance DIA_Serpentes_GOTSalandril(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 32;
	condition = DIA_Serpentes_GOTSalandril_Condition;
	information = DIA_Serpentes_GOTSalandril_Info;
	description = " I know who issued these shares. " ;
};


func int DIA_Serpentes_GOTSalandril_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOTSalandril_Info()
{
	AI_Output(other,self, " DIA_Serpentes_GOTSalandril_15_00 " );	// I know who issued these shares. This is Salandril, an alchemist from the upper quarter of the city.
	AI_Output(self,other, " DIA_Serpentes_GOTSalandril_10_01 " );	// Then bring him here. We have something to discuss with him.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Serpentes_SalandrilHERE (C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilHERE_Condition;
	information = DIA_Serpentes_SalandrilHERE_Info;
	description = " Salandril is here in the monastery. " ;
};


func int DIA_Serpentes_SalandrilHERE_Condition()
{
	if(Npc_GetDistToWP(Salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else  if ( Npc_KnowsInfo ( other , DIA_Serpents_GOTSalandril ) && ( hero . guild ==  GIL_KDF ))
		{
			return TRUE;
		}
		else
		{
			return  FALSE ;
		};
	};
	return  FALSE ;
};

func void DIA_Serpentes_SalandrilHERE_Info()
{
	AI_Output(other,self, " DIA_Serpentes_SalandrilHERE_15_00 " );	// Salandril is here in the monastery.
	AI_Output(self,other, " DIA_Serpentes_SalandrilHERE_10_01 " );	// Great. We'll deal with him later.

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Serpentes_SalandrilHERE_10_02 " );	// Here's your reward. And don't tell anyone about it, okay?
		CreateInvItems(self,ItMi_Gold,400);
		B_GiveInvItems(self,other,ItMi_Gold,400);
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_SalandrilInKloster);
};


instance DIA_Serpentes_SalandrilDEAD (C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilDEAD_Condition;
	information = DIA_Serpentes_SalandrilDEAD_Info;
	description = " Salandril is dead. " ;
};


func int DIA_Serpentes_SalandrilDEAD_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Serpent_GOTSalandril) || (((hero.guild ==  GIL_SLD ) || (hero.guild ==  GIL_DJG )) && (MY_Serpent_BringSalandril_SLD == LOG_Running))) && Npc_IsDead(Salandril));
	{
		return TRUE;
	};
};

func void DIA_Serpentes_SalandrilDEAD_Info()
{
	AI_Output(other,self, " DIA_Serpentes_SalandrilDEAD_15_00 " );	// Salandril is dead.
	AI_Output(self,other, " DIA_Serpentes_SalandrilDEAD_10_01 " );	// Well, that means his deeds did not go unpunished. May Innos have pity on his poor soul.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Serpentes_PICKPOCKET(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 900;
	condition = DIA_Serpentes_PICKPOCKET_Condition;
	information = DIA_Serpentes_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Serpentes_PICKPOCKET_Condition()
{
	return  C_Robbery ( 86 , 380 );
};

func void DIA_Serpentes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice(DIA_Serpentes_PICKPOCKET,Dialog_Back,DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Serpentes_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Snakes_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 70)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,50);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
};


instance DIA_SERPENTES_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 1;
	condition = dia_serpentes_runemagicnotwork_condition;
	information = dia_serpentes_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_serpentes_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_serpentes_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Serpentes_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Serpentes_RuneMagicNotWork_01_01 " );	// Just yesterday, I would have spit in the face of anyone who said I couldn't do magic today. But the runes really stopped listening to me!
	AI_Output(other,self, " DIA_Serpentes_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_Serpentes_RuneMagicNotWork_01_03 " );	// Are you saying that I'm one of the best magicians - the only one who has been subjected to this? If I can't do anything, others certainly can't!
	AI_Output(other,self, " DIA_Serpentes_RuneMagicNotWork_01_04 " );	// Got it.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};

