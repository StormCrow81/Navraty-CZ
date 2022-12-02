

instance DIA_Igaranz_Cap1_EXIT (C_Info) .
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap1_EXIT_Condition;
	information = DIA_Igaraz_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_Hello (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Hello_Condition;
	information = DIA_Igaraz_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Igaraz_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Hello_Info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other, " DIA_Igaranz_Hello_13_00 " );	// What can I do for you brother?
	}
	else
	{
		AI_Output(self,other, " DIA_Igaranz_Hello_13_01 " );	// What can I do for you?
	};
};


instance DIA_Igaraz_Wurst (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Wurst_Condition;
	information = DIA_Igaraz_Sausage_Info;
	permanent = FALSE;
	description = " I'm in charge of sausage distribution. " ;
};


func int DIA_Igaraz_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Igaraz_Wurst_15_00 " );	// I'm handing out sausage.
	AI_Output(self,other, " DIA_Igaraz_Wurst_13_01 " );	// You work for Gorax, don't you? Okay, then give this sausage here.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Igaranz_NotWork(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 3;
	condition = DIA_Igaraz_NotWork_Condition;
	information = DIA_Igaraz_NotWork_Info;
	permanent = FALSE;
	description = " Why aren't you working? " ;
};


func int DIA_Igaraz_NotWork_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_NotWork_Info()
{
	AI_Output(other,self, " DIA_Igaranz_NotWork_15_00 " );	// Why aren't you working?
	AI_Output(self,other, " DIA_Igaranz_NotWork_13_01 " );	// I am allowed to study the teachings of Innos. I understand his wisdom.
	AI_Output(self,other, " DIA_Igaranz_NotWork_13_02 " );	// One day he will choose me - and then I will pass the test of magic and enter the Circle of Fire.
};


instance DIA_Igaranz_Choosen(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent = TRUE;
	description = " Who are the Chosen Ones? " ;
};


func int DIA_Igaraz_Choosen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Choosen_Info()
{
	AI_Output(other,self, " DIA_Igaranz_Choosen_15_00 " );	// Who are the Chosen Ones?
	AI_Output(self,other, " DIA_Igaranz_Choosen_13_01 " );	// These are the novices whom Innos ordered to pass the test of magic.
	AI_Output(self,other, " DIA_Igaranz_Choosen_13_02 " );	// Whoever passes it is accepted into the ranks of the Fire Mages.
	Info_ClearChoices(DIA_Igaranz_Choosen);
	Info_AddChoice(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice(DIA_Igaranz_Choosen, " What is a Magic Trial? " ,DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice(DIA_Igaranz_Choosen, " How can I become the Chosen One? " ,DIA_Igaranz_Choosen_HowChoosen);
};

func void DIA_Igaranz_Choosen_back()
{
	Info_ClearChoices(DIA_Igaranz_Choosen);
};

func void DIA_Igaranz_Choosen_TestOfMagic()
{
	AI_Output(other,self, " DIA_Igaranz_Choosen_TestOfMagic_15_00 " );	// What is Trial by Magic?
	AI_Output(self,other, " DIA_Igaranz_Choosen_TestOfMagic_13_01 " );	// This is the test that the High Council puts on all chosen novices.
	AI_Output(self,other, " DIA_Igaranz_Choosen_TestOfMagic_13_02 " );	// This is a quest that tests the acolyte's faith and intelligence.
	AI_Output(self,other, " DIA_Igaranz_Choosen_TestOfMagic_13_03 " );	// All chosen acolytes take part in it - but only one of them can successfully complete it.
};

func void DIA_Igaranz_Choosen_HowChoosen()
{
	AI_Output(other,self, " DIA_Igaranz_Choosen_HowChoosen_15_00 " );	// How can I become the Chosen One?
	AI_Output(self,other, " DIA_Igaranz_Choosen_HowChoosen_13_01 " );	// You can't influence this. Innos personally chooses his novices, and the Supreme Council announces his will.
};


instance DIA_Igaranz_StudyInnos(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent = FALSE;
	description = " How can I start studying the scriptures? " ;
};


func int DIA_Igaraz_StudyInnos_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Igaranz_NotWork ) && ( Npc_ GetDistToWP ( self , " NW_MONASTERY_GRASS_01 " ) <=  500 ) && ( Language_Expression ==  FALSE ) && ( other . guild ==  GIL_NOV )) ;
	{
		return TRUE;
	};
};

func void DIA_Igaraz_StudyInnos_Info()
{
	AI_Output(other,self, " DIA_Igaranz_StudyInnos_15_00 " );	// How can I start studying the scriptures?
	AI_Output(self,other, " DIA_Igaranz_StudyInnos_13_01 " );	// You must access the library.
	AI_Output(self,other, " DIA_Igaranz_StudyInnos_13_02 " );	// However, Master Parlan will only give you the key when you complete all of his tasks.
};


instances DIA_Igaraz_IMTHEMAN (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_IMTHEMAN_Condition;
	information = DIA_Igaraz_IMTHEMAN_Info;
	important = TRUE;
};


func int DIA_Igaraz_IMTHEMAN_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_IMTHEMAN_Info()
{
	AI_Output(self,other, " DIA_Igaraz_IMTHEMAN_13_00 " );	// It's done!...(proudly) Innos chose me to take part in the trial by magic.
};


instance DIA_Igaraz_METOO(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 19;
	condition = DIA_Igaraz_METOO_Condition;
	information = DIA_Igaraz_METOO_Info;
	permanent = FALSE;
	description = " Me too! " ;
};


var int DIA_Igaraz_METOO_NOPERM;

func int DIA_Igaraz_METOO_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_METOO_Info()
{
	AI_Output(other,self, " DIA_Igaraz_METOO_15_00 " );	// Me too! I demanded the Trial by Fire.
	AI_Output(self,other, " DIA_Igaraz_METOO_13_01 " );	// WHAT did you request? You're either Innos' pet or you're crazy.
	AI_Output(other,self, " DIA_Igaraz_METOO_15_02 " );	// I've done a lot of crazy things already, and maybe this one too...
	AI_Output(self,other, " DIA_Igaraz_METOO_13_03 " );	// Innos supports me - and I will pass this test!
	Info_ClearChoices(DIA_Igaraz_METOO);
	Info_AddChoice(DIA_Igaraz_METOO,Dialog_Back,DIA_Igaraz_METOO_BACK);
	Info_AddChoice(DIA_Igaraz_METOO, " Maybe we should work together... " ,DIA_Igaraz_METOO_HELP);
	Info_AddChoice(DIA_Igaraz_METOO, " Have you found anything yet? " ,DIA_Igaraz_METOO_TELL);
	Info_AddChoice(DIA_Igaraz_METOO, " Have you seen Agon or Ulf? " ,DIA_Igaraz_METOO_AGON);
};

func void DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices(DIA_Igaraz_METOO);
};

func void DIA_Igaraz_METOO_TELL()
{
	AI_Output(other,self, " DIA_Igaraz_METOO_TELL_15_00 " );	// And how, haven't found anything yet?
	AI_Output(self,other, " DIA_Igaraz_METOO_TELL_13_01 " );	// Since you don't stand a chance anyway, I guess I'll tell you:
	AI_Output(self,other, " DIA_Igaraz_METOO_TELL_13_02 " );	// Don't even try to look near the farms - you won't find anything there.
};

func void DIA_Igaraz_METOO_HELP()
{
	AI_Output(other,self, " DIA_Igaraz_METOO_HELP_15_00 " );	// Maybe we should work together...
	AI_Output(self,other, " DIA_Igaraz_METOO_HELP_13_01 " );	// Forget it. I will complete this task alone. You will only be a burden to me.
};

func void DIA_Igaraz_METOO_AGON()
{
	AI_Output(other,self, " DIA_Igaraz_METOO_AGON_15_00 " );	// Have you seen Agon or Ulf?
	AI_Output(self,other, " DIA_Igaraz_METOO_AGON_13_01 " );	// We split up at the tavern. I went to the farms, and these two went together - but where, I don't know.
};


instance DIA_Igaraz_ADD(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 23;
	condition = DIA_Igaraz_ADD_Condition;
	information = DIA_Igaraz_ADD_Info;
	permanent = FALSE;
	description = " Do you know anything about 'living rock'? " ;
};


func int DIA_Igaraz_ADD_Condition()
{
	if (( Npc_GetDistToWP ( self , " NW_TAVERNE_TROLLAREA_05 " ) <=  3500 ) && ( MY_GOLEM  == LOG_Running ) && ( Npc_IsDead ( Magic_Golem ) ==  FALSE ) && ( Npc_KnowsInfo ( other , DIA_Igaraz_Stein ) ==  FALSE ) && ( Npc_KnowsInfo ( other , DIA_Igaraz_Stein ) == FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_ADD_Info()
{
	AI_Output(other,self, " DIA_Igaraz_Add_15_00 " );	// Do you know anything about 'living rock'?
	AI_Output(self,other, " DIA_Igaraz_Add_13_01 " );	// No!...(giggles) Serpentes gave you a mission?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Да, а что?
	AI_Output(self,other, " DIA_Igaraz_Add_13_03 " );	// I think I can guess what he meant...
	AI_Output(self,other, " DIA_Igaraz_Add_13_04 " );	// You won't be the first to fail this test...
	AI_Output(other,self, " DIA_Igaraz_Add_15_05 " );	// Where can I find this living rock?
	AI_Output(self,other, " DIA_Igaraz_Add_13_06 " );	// Just follow this path. After a while you will see the river.
	AI_Output(self,other, " DIA_Igaraz_Add_13_07 " );	// Keep following the path up into the mountains. She must be in there somewhere.
	AI_Output(self,other, " DIA_Igaraz_Add_13_08 " );	// If you get to the bridge, you've gone too far.
	AI_Output(self,other, " DIA_Igaraz_Add_13_09 " );	// Though I doubt you'll get far at all.
	AI_Output(self,other, " DIA_Igaraz_Add_13_10 " );	// That's all I can tell you... (sarcastically) This should still be your TEST!
};

instances of DIA_Igaraz_Pruefunction (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 22;
	condition = DIA_Igaraz_Pruefung_Condition;
	information = DIA_Igaraz_Test_Info;
	description = " Find out something new? " ;
};

func int DIA_Igaraz_Pruefung_Condition()
{
	if (( other . guild ==  GIL_NOV ) && ( MageFireChestOpen ==  FALSE ) && ( Npc_KnowsInfo ( other , DIA_Igaraz_METOO ) ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Pruefunction_Info()
{
	AI_Output(other,self, " DIA_Igaraz_Pruefung_15_00 " );	// Learned something new?
	AI_Output(self,other, " DIA_Igaraz_Pruefung_13_01 " );	// Not yet, but I'm still looking.
	AI_StopProcessInfos(self);

	if(Igaraz_Wait == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};


instances of DIA_Igaraz_Stein (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 1;
	condition = DIA_Igaraz_Stein_Condition;
	information = DIA_Igaraz_Stein_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Igaraz_Stein_Condition()
{
	if ((other.guild ==  GIL_NOV ) && (Chapter ==  1 ) && (MageFireChestOpen ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Stein_Info()
{
	AI_Output(self,other, " DIA_Igaraz_Seufz_13_00 " );	// Hey, wait! We need to talk.
	AI_Output(other,self, " DIA_Igaraz_Seufz_15_01 " );	// I don't think so.
	AI_Output(self,other, " DIA_Igaraz_Seufz_13_02 " );	// I've been waiting for this test for years. Innos supports me and I MUST pass it.

	if (Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		AI_Output(other,self, " DIA_Igaraz_Seufz_15_03 " );	// Somewhere I already heard it.
	}
	else
	{
		AI_Output(other,self, " DIA_Igaraz_Seufz_15_04 " );	// You're not the first to say this.
	};

	AI_Output(self,other, " DIA_Igaraz_Seufz_13_05 " );	// Stop talking. I need what you found. And it's time for you to die!
	AI_TurnToNPC(self,other);
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self, " DIA_Igaraz_OneMoreChance_01_01 " );	// Hey, chill, buddy! Don't do stupid things!
	AI_Output(self,other, " DIA_Igaraz_OneMoreChance_01_02 " );	// I have no choice... (maddened) I must pass this test!
	AI_Output(other,self, " DIA_Igaraz_OneMoreChance_01_03 " );	// Listen, killing me will only incur the wrath of Innos. Or do you think that your 'feats' will go unpunished?
	AI_Output(self,other, " DIA_Igaraz_OneMoreChance_01_05 " );	// But I... somehow I didn't think about it.
	AI_Output(other,self, " DIA_Igaraz_OneMoreChance_01_06 " );	// Understand: Innos himself chooses the one who is worthy to become his chosen one! And it's not for you to decide...
	AI_Output(other,self, " DIA_Igaraz_OneMoreChance_01_07 " );	// Put down your weapon and head back to the monastery.
	AI_Output(self,other, " DIA_Igaraz_OneMoreChance_01_08 " );	// Yes, you're right... (bewildered) I myself can't understand what came over me.
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_Igaraz_OneMoreChance_01_09 " );	// So what should I do now?
	AI_Output(other,self, " DIA_Igaraz_OneMoreChance_01_10 " );	// Spend as much time as you can in prayer! Only in this way can you earn the favor of Innos.
	AI_Output(other,self, " DIA_Igaraz_OneMoreChance_01_11 " );	// And if I become a Fire Mage, I'll try to help you.
	AI_Output(self,other, " DIA_Igaraz_OneMoreChance_01_12 " );	// (hopefully) Oh, can you really help me? Okay...(uncertainly) I'm going back to the monastery. See you...
	MIS_Igaraz_OneMoreChance = LOG_Running;
	Log_CreateTopic(TOPIC_IGARANZ_NEW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_Running);
	B_LogEntry( TOPIC_IGARANZ_NEW , " Acolyte Igaraz wanted to kill me by claiming victory in the trial by fire. I brought him to his senses by promising to plead for him before the council of mages later. " );
	AI_StopProcessInfos(self);
};

instance DIA_Igaranz_TalkAboutBabo ( C_Info ) ;
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_TalkAboutBabo_Condition;
	information = DIA_Igaraz_TalkAboutBabo_Info;
	permanent = FALSE;
	description = " We need to talk about Babo. " ;
};

func int DIA_Igaraz_TalkAboutBabo_Condition()
{
	if(MIS_BabosDocs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output(other,self, " DIA_Igaranz_TalkAboutBabo_15_00 " );	// We need to talk about Babo.
	AI_Output(self,other, " DIA_Igaranz_TalkAboutBabo_13_01 " );	// Yes, what's the matter?
};


instance DIA_Igaranz_BabosBelongings(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent = FALSE;
	description = " You have something that belongs to Babo. " ;
};

func int DIA_Igaraz_BabosBelongings_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Guaranteed_TalkAboutBabo ) )
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output(other,self, " DIA_Igaranz_BabosBelongings_15_00 " );	// You have something that belongs to Babo.
	AI_Output(self,other, " DIA_Igaranz_BabosBelongings_13_01 " );	// And what could it be?
	AI_Output(other,self, " DIA_Igaranz_BabosBelongings_15_02 " );	// Several slips of paper. Babo would like to have them back.
	AI_Output(self,other, " DIA_Igaranz_BabosBelongings_13_03 " );	// Yes? Wow! I can imagine. Sorry, I'd rather keep them. There seems to be a conflict of interest here.
};

instance DIA_Igaranz_WhereDocs (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_WhereDocs_Condition;
	information = DIA_Igaraz_WhereDocs_Info;
	permanent = FALSE;
	description = " Where are these papers? " ;
};


func int DIA_Igaraz_WhereDocs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_WhereDocs_Info()
{
	AI_Output(other,self, " DIA_Igaranz_WhereDocs_15_00 " );	// Where are these papers?
	AI_Output(self,other, " DIA_Igaranz_WhereDocs_13_01 " );	// Well, of course I don't keep them around. I'm afraid I can't help.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Где они?
	AI_Output(self,other, " DIA_Igaranz_WhereDocs_13_03 " );	// I locked them in a chest. And you will never get the key to it.
};


instance DIA_Igaranz_BabosJob(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent = FALSE;
	description = " What should Babo do for you? " ;
};


func int DIA_Igaraz_BabosJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosJob_Info()
{
	AI_Output(other,self, " DIA_Igaranz_BabosJob_15_00 " );	// What should Babo do for you?
	AI_Output(self,other, " DIA_Igaranz_BabosJob_13_01 " );	// If I knew what this slug would pee in his pants over a few bushes of swamp grass, I would have long ago ensured that someone else took his place in the monastery garden.
	AI_Output(other,self, " DIA_Igaranz_BabosJob_15_02 " );	// Should he grow swamp grass?
	AI_Output(self,other, " DIA_Igaranz_BabosJob_13_03 " );	// Of course. Since it is no longer available due to the Barrier, the price of weed in the city has tripled.
	AI_Output(self,other, " DIA_Igaranz_BabosJob_13_04 " );	// We could make good money on this. But Babo refuses to cooperate.
};

var int IgaranzLowPrice;

instance DIA_Igaranz_Price(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent = FALSE;
	description = " How much do you want for these papers? " ;
};

func int DIA_Igaraz_Price_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Price_Info()
{
	AI_Output(other,self, " DIA_Igaranz_Price_15_00 " );	// How much do you want for these papers?
	AI_Output(self,other, " DIA_Igaranz_Price_13_01 " );	// Generally speaking, they are practically priceless. It is very rare to find something like this.
	AI_Output(self,other, " DIA_Igaranz_Price_13_02 " );	// But I have no desire to risk my future for a few gold pieces.
	AI_Output(self,other, " DIA_Igaranz_Price_13_03 " );	// Three hundred coins, and you can do whatever you want with these papers.

	if(RhetorikSkillValue[1] >= 35)
	{
		AI_Output(other,self, " DIA_Igaranz_Price_13_04 " );	// It's too high a price for simple pieces of paper, don't you think?!
		AI_Output(self,other, " DIA_Igaranz_Price_13_05 " );	// Well, okay... (thoughtfully) I'll cut the price down to two hundred! But this is my last suggestion.
		IgaranzLowPrice = TRUE;
	};
};

instance DIA_Igaranz_BuyIt (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BuyIt_Condition;
	information = DIA_Igaraz_BuyIt_Info;
	permanent = FALSE;
	description = " I want to buy these securities. " ;
};

func int DIA_Igaraz_BuyIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_Price) && (MIS_BabosDocs != LOG_SUCCESS))
	{
		if((IgaranzLowPrice == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 200))
		{
			return TRUE;
		}
		else if(Npc_HasItems(other,ItMi_Gold) >= 300)
		{
			return TRUE;
		};
	};
};

func void DIA_Igaraz_BuyIt_Info()
{
	AI_Output(other,self, " DIA_Igaranz_BuyIt_15_00 " );	// I want to buy these securities.
	AI_Output(self,other, " DIA_Igaranz_BuyIt_13_01 " );	// Look, I can't leave right now. I will give you the key to my chest. There is nothing else in it anyway.

	if(IgaranzLowPrice == TRUE)
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(other,self,ItMi_Gold,200);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,300);
	};
	
	B_GiveInvItems(self,other,ItKe_IgarazChest_Mis,1);
};


instance DIA_Igaranz_Perm (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Perm_Condition;
	information = DIA_Igaraz_Perm_Info;
	permanent = FALSE;
	description = " Do you have anything interesting for me? " ;
};


func int DIA_Igaraz_Perm_Condition()
{
	if ((Chapter >=  3 ) && (other.guild !=  GIL_KDF ) && (MY_BabosDocs != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Perm_Info()
{
	AI_Output(other,self, " DIA_Igaranz_Perm_15_00 " );	// Do you have anything interesting for me?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Хмм... нет.
	AI_StopProcessInfos(self);
};


var int is_igaranz_condition;

instance DIA_Igaranz_OneMoreChance_News(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaranz_OneMoreChance_News_condition;
	information = DIA_Igaranz_OneMoreChance_News_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Igaranz_OneMoreChance_News_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Igaraz_OneMoreChance == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Igaranz_OneMoreChance_News_info()
{
	AI_Output(self,other, " DIA_Igaranz_OneMoreChance_News_01_01 " );	// My respect! I see that you have already become a firebender.
	AI_Output(other,self, " DIA_Igaranz_OneMoreChance_News_01_02 " );	// Yes, as you can see. And you wanted to ask about your fate as a novice?
	AI_Output(self,other, " DIA_Igaranz_OneMoreChance_News_01_03 " );	// Yes, dear magician... (timidly) You are right.
	Info_ClearChoices(DIA_Igaranz_OneMoreChance_News);
	Info_AddChoice(DIA_Igaranz_OneMoreChance_News, " Nothing to please yet. " ,DIA_Igaranz_OneMoreChance_News_yes);
	Info_AddChoice(DIA_Igaranz_OneMoreChance_News, " I changed my mind about helping you. " ,DIA_Igaranz_OneMoreChance_News_no);
};

func void DIA_Igaranz_OneMoreChance_News_yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Igaranz_OneMoreChance_News_yes_01_01 " );	// I can't please anything yet.
	AI_Output(other,self, " DIA_Igaranz_OneMoreChance_News_yes_01_02 " );	// In the meantime, spend more time praying, practicing magic...
	AI_Output(other,self, " DIA_Igaranz_OneMoreChance_News_yes_01_03 " );	// In general, work on yourself - and everything will be fine.
	AI_Output(self,other, " DIA_Igaranz_OneMoreChance_News_yes_01_04 " );	// Okay, master, I got it.
	B_LogEntry( TOPIC_IGARANZ_NEW , " Igaraz asked about his fate as an acolyte. Let him wait for the time being... " );
	Info_ClearChoices(DIA_Igaranz_OneMoreChance_News);
};

func void DIA_Igaranz_OneMoreChance_News_no()
{
	AI_Output(other,self, " DIA_Igaranz_OneMoreChance_News_no_01_01 " );	// I changed my mind about helping you.
	AI_Output(other,self, " DIA_Igaranz_OneMoreChance_News_no_01_02 " );	// Do you really think that I will ask for someone who recently wanted to take my life?
	AI_Output(self,other, " DIA_Igaranz_OneMoreChance_News_no_01_03 " );	// YOU! YOU ARE A DIRTY BEAST! You will pay for this, I swear by Innos!
	AI_Output(other,self, " DIA_Igaranz_OneMoreChance_News_no_01_04 " );	// Don't you dare raise your hand against a Firebender, acolyte!
	AI_Output(self,other, " DIA_Igaranz_OneMoreChance_News_no_01_05 " );	// Don't you dare raise your hand?! (furious) I'll kill you!
	MIS_Igaraz_OneMoreChance = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_IGARANZ_NEW);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


var int igoranz_task;

instance DIA_Igaraz_New_OfferHelp (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_New_OfferHelp_condition;
	information = DIA_Igaraz_New_OfferHelp_info;
	permanent = FALSE;
	description = " I've spoken to the Firebenders about you. " ;
};


func int DIA_Igaraz_New_OfferHelp_condition()
{
	if ((hero.guild ==  GIL_KDF ) && (Chapter >=  2 ) && (MIS_Igaraz_OneMoreChance == LOG_Running) && ( IS_TALAMON_IGORANZCONDITION  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Igaraz_New_OfferHelp_info()
{
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_01_01 " );	// I've spoken to the Firebenders about you.
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_01_02 " );	// Talamon ordered you to find and kill the demon. And as proof, you will have to bring his heart.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_01_03 " );	// Oh, almighty Innos! (panicked) Is Master Talamon really sending me to fight such a terrible monster?!
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_01_04 " );	// This is your only chance, Igaraz.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_01_05 " );	// But I'll never kill this terrible spawn of Beliar! I don't even know where to look for them, those demons!
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_01_06 " );	// Please - help me! I'm ready to do anything for you!
	Info_ClearChoices(DIA_Igaraz_New_OfferHelp);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp, " Sorry, but I can't help you. " ,DIA_Igaraz_New_OfferHelp_peace);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp, " I want a lot of gold for my help! " ,DIA_Igaraz_New_OfferHelp_gold);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp, " I'm only interested in magic items or recipes. " ,DIA_Igaraz_New_OfferHelp_magic);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp, " Deal with it yourself. " ,DIA_Igaraz_New_OfferHelp_no);
};

func void DIA_Igaraz_New_OfferHelp_peace()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_peace_01_01 " );	// Sorry, but I can't help you.
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_peace_01_02 " );	// You will have to do everything yourself and, thereby, prove that you are worthy of becoming a true servant of Innos.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_peace_01_03 " );	// Yes, master...(humbly) Although it will probably take me forever, and the encounter with the demon could be the last moment of my life.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_peace_01_04 " );	// But I'll try to cope and not miss my chance!
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry( TOPIC_IGARANZ_NEW , " I refused to help Igaratsu with his trial. Let him prove himself worthy of becoming a Firebender. " );
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_gold_01_01 " );	// I want a lot of gold for my help!
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_gold_01_02 " );	// Demon hunting isn't easy, and I'll need a lot of gold to properly equip myself for the fight.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_gold_01_03 " );	// Good. Then I, perhaps, will go over my debtors. Fortunately, almost every mouse in the monastery owes me, and even Master Gorax himself.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_gold_01_04 " );	// I think I can collect three or four thousand. I hope this amount of gold is a reward justifying your risk?
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_gold_01_05 " );	// Quite. I'll try to get the heart of a demon for you.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_gold_01_06 " );	// I'll wait... and shake the gold from the townsfolk who owe me, of course.
	IgaranceMakeHappyGold = TRUE ;
	B_LogEntry( TOPIC_IGARANZ_NEW , " I promised Igaratsu to help with the challenge and get him the heart of a demon. For this, he is ready to pay a tidy sum! Well, great, because money doesn't smell... " );
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_magic()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_magic_01_01 " );	// I'm only interested in magic items or rare alchemy recipes.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_magic_01_02 " );	// While you're on such a dangerous mission, I'll find something special for you.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_magic_01_03 " );	// The walls of this monastery hold many secrets, and I will certainly find something here! At the very least, searching in a sacred place would certainly not require me to slay a demon.
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_magic_01_04 " );	// I hope it's really worthwhile and not a cheap spell scroll.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_magic_01_05 " );	// Be sure - you won't be disappointed!
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_magic_01_06 " );	// Okay, agreed. I'll get the heart of a demon for you.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_magic_01_07 " );	// I'll wait... and search, of course.
	IgaranzMakeHappyMagic = TRUE;
	B_LogEntry( TOPIC_IGARANZ_NEW , " I promised Igaratsu to help with the challenge and get him a demon heart. As a reward, Igaratsu promised to get me some rare magic item or recipe. " );
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_no()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_no_01_01 " );	// Deal with it yourself.
	AI_Output(other,self, " DIA_Igaraz_New_OfferHelp_no_01_02 " );	// In the end, I kept my word - now get out yourself.
	AI_Output(self,other, " DIA_Igaraz_New_OfferHelp_no_01_03 " );	// Oh, Innos, what should I do?! I will never pass this test!
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry( TOPIC_IGARANZ_NEW , " I refused to help Igaratsu with his trial. " );
	AI_StopProcessInfos(self);
};


instance DIA_Igaraz_New_MakeMage (C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_New_MakeMage_condition;
	information = DIA_Igaraz_New_MakeMage_info;
	permanent = FALSE;
	description = " From now on, you can consider yourself a Firebender! " ;
};

func int DIA_Igaraz_New_MakeMage_condition()
{
	if ((MY_Igaraz_OneMoreChance == LOG_Running) && (IgarazMakeHappyOk ==  TRUE ) && Npc_HasItems(hero,itar_kdf_m_new))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_New_MakeMage_info()
{
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_01_01 " );	// From now on, you can consider yourself a Firebender!
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_01_02 " );	// Here, take this robe as proof of your merit.
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_01_03 " );	// You can get all other details from Parlan.
	Snd_Play("LEVELUP");
	B_GiveInvItems(other,self,itar_kdf_m_new,1);
	AI_EquipArmor(NOV_601_Igaraz,itar_kdf_m_new);
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_01_04 " );	// Oh, gracious Innos... (joyfully) Finally! How long have I been waiting for this moment!

	if (IgaranceMakeHappyGold ==  TRUE )
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Igaraz_New_MakeMage_01_05 " );	// Celebrate later! How about our deal?
		AI_Output(self,other, " DIA_Igaraz_New_MakeMage_01_06 " );	// Of course! Here, take this gold. I squeezed everything out of debtors.
		B_GiveInvItems(self,other,ItMi_Gold,5000);
		AI_Output(other,self, " DIA_Igaraz_New_MakeMage_01_07 " );	// Hmmm... not bad.
		MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
		B_LogEntry( TOPIC_IGARANZ_NEW , " I helped Igaratsu and he gave me five thousand gold pieces. Great! I was expecting a much lower fee. " );
	}
	else if(IgaranzMakeHappyMagic == TRUE)
	{
		AI_Output(other,self, " DIA_Igaraz_New_MakeMage_01_05 " );	// Celebrate later! How about our deal?
		AI_Output(self,other, " DIA_Igaraz_New_MakeMage_01_08 " );	// Of course! I have found a lot and can even give you a choice: a magic rune, a scroll with a recipe, or a magic elixir.
		AI_Output(self,other, " DIA_Igaraz_New_MakeMage_01_09 " );	// What do you prefer?
		Info_ClearChoices(DIA_Igaraz_New_MakeMage);
		Info_AddChoice(DIA_Igaraz_New_MakeMage, " I'll take a magic rune. " ,DIA_Igaraz_New_MakeMage_Rune);
		Info_AddChoice(DIA_Igaraz_New_MakeMage, " I'll take the alchemy recipe. " ,DIA_Igaraz_New_MakeMage_Rezept);
		Info_AddChoice(DIA_Igaraz_New_MakeMage, " I'll take the magic elixir. " ,DIA_Igaraz_New_MakeMage_UnknownBook);
	}
	else
	{
		AI_Output(self,other, " DIA_Igaraz_New_MakeMage_01_10 " );	// Yes, and more. I have some items for sale.
		AI_Output(self,other, " DIA_Igaraz_New_MakeMage_01_11 " );	// Take a look sometime if you're interested.
		AI_Output(other,self, " DIA_Igaraz_New_MakeMage_01_12 " );	// If I don't forget.
		MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
		B_LogEntry( TOPIC_IGARANZ_NEW , " I helped Igaratsu. For that he can sell me his goods. " );
		IG_TRADE_COND = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Trade");
	};
};

func void DIA_Igaraz_New_MakeMage_Rune()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_Rune_01_01 " );	// I'll take the magic rune.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_Rune_01_02 " );	// Good! Here is your rune.
	B_GiveInvItems(self,other,ItRu_Sleep,1);
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_Rune_01_03 " );	// Well, the reward was really worth helping you.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_Rune_01_04 " );	// I'm glad I could please you!
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_Rune_01_05 " );	// Yes, and more. I have some items for sale.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_Rune_01_06 " );	// Take a look sometime if you're interested.
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_Rune_01_07 " );	// If I don't forget.
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry( TOPIC_IGARANZ_NEW , " I helped Igaratsu and he rewarded me with a magic rune. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

func void DIA_Igaraz_New_MakeMage_Rezept()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_Rezept_01_01 " );	// I'll take the alchemy recipe.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_Rezept_01_02 " );	// Good! Here, take this scroll.
	B_GiveInvItems(self,other,ITWR_MAGICDEFENCE_02,1);
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_Rezept_01_03 " );	// Well, the reward was really worth helping you.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_Rezept_01_04 " );	// I'm glad I could please you!
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_Rezept_01_05 " );	// Yes, and more. I have some items for sale.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_Rezept_01_06 " );	// Take a look sometime if you're interested.
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_Rezept_01_07 " );	// If I don't forget.
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry( TOPIC_IGARANZ_NEW , " I helped Igaratsu and he rewarded me with an alchemy recipe. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

func void DIA_Igaraz_New_MakeMage_UnknownBook()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_UnknownBook_01_01 " );	// I'll take the magic elixir.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_UnknownBook_01_02 " );	// Good! Here, hold it.
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_UnknownBook_01_03 " );	// Well, not bad.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_UnknownBook_01_04 " );	// Good luck! Yes, and more. I have some items for sale.
	AI_Output(self,other, " DIA_Igaraz_New_MakeMage_UnknownBook_01_05 " );	// Take a look sometime if you're interested.
	AI_Output(other,self, " DIA_Igaraz_New_MakeMage_UnknownBook_01_06 " );	// If I don't forget.
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry( TOPIC_IGARANZ_NEW , " I helped Igaratsu and he rewarded me with a magic elixir. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

instance DIA_IGARAZ_TRADE(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 1;
	condition = dia_igaraz_trade_condition;
	information = dia_igaraz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show your products. " ;
};

func int dia_igaraz_trade_condition()
{
	if(IG_TRADE_COND == TRUE)
	{
		return TRUE;
	};
};

func void dia_igaraz_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Igaraz_TRADE_01_01 " );	// Display your products.

	if(Npc_HasItems(self,ItKe_IgarazChest_Mis) > 0)
	{
		Npc_RemoveInvItems(self,ItKe_IgarazChest_Mis,Npc_HasItems(self,ItKe_IgarazChest_Mis));
	};

	B_GiveTradeInv(self);
};
