
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if((Bdt13_Friend == TRUE) && !Npc_IsDead(Ambusher_1014) && !Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other, " DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00 " );	// If I were you, I wouldn't go into that cave - my buddies who live there will skin you alive.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BDT_1013_BANDIT_WHERE(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1013_BANDIT_WHERE_Condition;
	information = DIA_BDT_1013_BANDIT_WHERE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_BDT_1013_BANDIT_WHERE_Condition()
{
	if ( CAVALORNGOBANDITS  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_WHERE_Info()
{
	self.guild = GIL_BDT;
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_01_00 " );	// Hey! Where did you come from, huh?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where, " I went down the mountain " ,dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where, " I came from Xardas. " ,dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00 " );	// I came down from the mountains.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01 " );	// Exactly! You came down from the mountains. And that's bad for you.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Очень плохо!
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03 " );	// A whole bunch of bad guys are looking for you.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04 " );	// There is a person with whom you just need to talk. Come after me!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Maybe later... " ,dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Who is looking for me? " ,dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Okay! You go first! " ,dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00 " );	// I come from Xardas.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01 " );	// Is that the old mage? He calls himself Xardas. Brago this will be interesting!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_YES_15_00 " );	// Good! You go first!
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_YES_01_01 " );	// Just follow me, the cave is over there.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_WHO_15_00 " );	// Who is looking for me?
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_WHO_01_01 " );	// Half of Khorinis is after you, and you want to tell me you don't know anything about it?
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_WHO_01_02 " );	// Ah! Understand! You don't want to tell me about it, hmm? Okay, that's your business.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_WHO_01_03 " );	// So are you coming or not?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Возможно, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Who should I talk to? " ,dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Okay! You go first! " ,dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00 " );	// Who should I talk to?
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01 " );	// With our leader. His name is Brago. He will explain everything to you better than I can.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02 " );	// Well, what are you - are we going?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Возможно, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where, " How do I know it's not a trap? " ,dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Okay! Go ahead! " ,dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00 " );	// How do I know this isn't a trap?
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01 " );	// You know, I'm already tired of you. If you don't need my help, you can just go to the city and have them put you in jail!
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02 " );	// Either you're coming with me now, or forget what I told you!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Возможно, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Someone already tried to trick me... " ,dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Okay! Go ahead! " ,dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00 " );	// Take it easy, mate! Someone already tried to trick me...
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01 " );	// Ooh?... (interested)
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02 " );	// This guy suggested that we find the amulet together and share the income.
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03 " );	// And when we reached our goal, he and his friends attacked me.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04 " );	// Looks like you just got involved with bad people - and where was it?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where, " It's not that important. " ,dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where, " I was a prisoner in a mining colony. " ,dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00 " );	// I was a prisoner in a mining colony.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01 " );	// (shocked) Did you come from behind the Barrier? Boy, we were there together then.
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02 " );	// I don't know you...
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03 " );	// I was a miner at the Old Camp. I almost never got out of there.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04 " );	// (conspiratorially) But what's more important now is that you're in big trouble!
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05 " );	// Someone put a big sum on your head. And handed out a few drawings with your face!
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06 " );	// If I were you, I'd be very, very careful. There are people among us who are ready to kill their own mother for money.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07 " );	// But I think that we, ex-prisoners from the colony, should stick together!
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08 " );	// Then I should say thank you very much...
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09 " );	// Trivia. Just try to stay alive.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	Bdt13_Friend = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00 " );	// It's not that important.
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01 " );	// As you know. So, are you coming or not?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Возможно, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where, " Okay! Go ahead! " ,dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self, " DIA_BDT_1013_BANDIT_WHERE_LATER_15_00 " );	// Maybe later...
	AI_Output(self,other, " DIA_BDT_1013_BANDIT_WHERE_LATER_01_01 " );	// It won't be later, mate!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_AMBUSH_Condition;
	information = DIA_1013_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1013_BANDIT_AMBUSH_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (Bdt13_Friend == FALSE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_AMBUSH_Info()
{
	if (Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other, " DIA_1013_BANDIT_AMBUSH_01_00 " );	// You shouldn't have followed me.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_SuddenEnemyInferno,0);
	}
	else
	{
		AI_Output(self,other, " DIA_1013_BANDIT_AMBUSH_01_01 " );	// Hey guys, look who we have here...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_SuddenEnemyInferno,0);
	};
};


instance DIA_1013_BANDIT_NAME(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_NAME_Condition;
	information = DIA_1013_BANDIT_NAME_Info;
	permanent = FALSE;
	description = " Who put a price on my head? " ;
};


func int DIA_1013_BANDIT_NAME_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_NAME_Info()
{
	AI_Output(other,self, " DIA_1013_BANDIT_NAME_15_00 " );	// Who put a price on my head?
	AI_Output(self,other, " DIA_1013_BANDIT_NAME_01_01 " );	// I don't know, only one of us saw it.
	AI_Output(other,self, " DIA_1013_BANDIT_NAME_15_02 " );	// And who is this?
	AI_Output(self,other, " DIA_1013_BANDIT_NAME_01_03 " );	// Hey, listen - I really can't tell you this. Who knows how things will turn out...
	Log_CreateTopic(Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus(Topic_Bandits,LOG_Running);
	B_LogEntry(Topic_Bandits, " Several bandits are looking for me. They have a wanted ad. What does that mean? " );
	MIS_profiles = LOG_Running;
};


instance DIA_1013_BANDIT_DEXTER(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_DEXTER_Condition;
	information = DIA_1013_BANDIT_DEXTER_Info;
	permanent = TRUE;
	description = " Ten gold coins for a name! " ;
};


func int DIA_1013_BANDIT_DEXTER_Condition()
{
	if ((Bdt13_Friend ==  TRUE ) && (Bdt13_Dexter_reported ==  FALSE ) && Npc_KnowsInfo(other,dia_1013_bandit_name));
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_DEXTER_Info()
{
	AI_Output(other,self, " DIA_1013_BANDIT_DEXTER_15_00 " );	// Ten gold coins for the name of whoever put the price on my head!
	AI_Output(self,other, " DIA_1013_BANDIT_DEXTER_01_01 " );	// Oh, I really can't tell...
	AI_Output(other,self, " DIA_1013_BANDIT_DEXTER_15_02 " );	// Lay it out, quick!
	AI_Output(self,other, " DIA_1013_BANDIT_DEXTER_01_03 " );	// (takes a deep breath) Oh man! Good. His name is Dexter. There is a steep rock near the big farm.
	AI_Output(self,other, " DIA_1013_BANDIT_DEXTER_01_04 " );	// It has a watchtower and some mines. He made his lair somewhere there.
	B_LogEntry(Topic_Bandits, " The bandit leader's name is Dexter. He's hiding in a mine near Onar's estate. " );

	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(other,self, " DIA_1013_BANDIT_DEXTER_15_05 " );	// See, it wasn't that hard. Here is your gold.
	}
	else
	{
		AI_Output(other,self, " DIA_1013_BANDIT_DEXTER_15_06 " );	// Um ​​- I just realized I don't even have ten coins left.
		AI_Output(self,other, " DIA_1013_BANDIT_DEXTER_01_07 " );	// What?! I... Oh - forget it - it's my own fault. Shouldn't have told you by name until I saw the gold...
	};

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	AI_Output(self,other, " DIA_1013_BANDIT_DEXTER_01_08 " );	// Just don't tell anyone that I named him to you.
	Bdt13_Dexter_betrayed = TRUE ;
};


instance DIA_1013_BANDIT_PIC(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 2;
	condition = DIA_1013_BANDIT_PIC_Condition;
	information = DIA_1013_BANDIT_PIC_Info;
	permanent = FALSE;
	description = " Can I borrow this picture? " ;
};


func int DIA_1013_BANDIT_PIC_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PIC_Info()
{
	AI_Output(other, self, " DIA_1013_BANDIT_PIC_15_00 " );	// Can I take this picture?
	AI_Output(self,other, " DIA_1013_BANDIT_PIC_01_01 " );	// Of course...(grins) It's YOUR mug on it!
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
};


instance DIA_1013_BANDIT_FromMaleth(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromMaleth_Condition;
	info = DIA_1013_BANDIT_FromMaleth_Info;
	permanent = FALSE;
	description = " I was sent by one of the farmers near the town... " ;
};

func int DIA_1013_BANDIT_FromMaleth_Condition()
{
	if((Bdt13_Friend == TRUE) && (self.guild != GIL_SLD) && ((MIS_Maleth_Bandits == LOG_Running) || (MIS_Maleth_Bandits == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromMaleth_Info()
{
	var C_Npc b14;
	var C_Npc b15;

	AI_Output(other,self, " DIA_1013_BANDIT_FromMaleth_15_00 " );	// I was sent by one of the farmers near the city...
	AI_Output(self,other, " DIA_1013_BANDIT_FromMaleth_01_01 " );	// What? Do the farmers know about this hideout?
	AI_Output(other,self, " DIA_1013_BANDIT_FromMaleth_15_02 " );	// They noticed the missing sheep.
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if (Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other, " DIA_1013_BANDIT_FromMaleth_01_03 " );	// Damn! Well, then I should look elsewhere. If they find this lair empty, maybe they'll stop looking for me.
	}
	else
	{
		AI_Output(other,self, " DIA_1013_BANDIT_FromMaleth_15_04 " );	// He wants you all to be dead...
		AI_Output(self,other, " DIA_1013_BANDIT_FromMaleth_01_05 " );	// Wait - you wouldn't do this to me, would you, I helped you?
		AI_Output(self,other, " DIA_1013_BANDIT_FromMaleth_01_06 " );	// Go in there and kill the others if you're so bloodthirsty - and I'm outta here!
	};
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};

instance DIA_1013_BANDIT_FromCavalorn(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromCavalorn_Condition;
	information = DIA_1013_BANDIT_FromCavalorn_Info;
	permanent = FALSE;
	description = " Looks like you're in trouble soon! " ;
};

func int DIA_1013_BANDIT_FromCavalorn_Condition()
{
	if((Bdt13_Friend == TRUE) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromCavalorn_Info()
{
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_FromCavalorn_15_00 " );	// Looks like you'll be in trouble soon!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//Что такое?
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_FromCavalorn_15_02 " );	// This is where a guy named Cavalorn is heading.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_FromCavalorn_01_03 " );	// Damn! Is he still alive? I'm outta here...
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_gossip_wilderness;

instance DIA_1013_BANDIT_PERM(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 4;
	condition = DIA_1013_BANDIT_PERM_Condition;
	information = DIA_1013_BANDIT_PERM_Info;
	permanent = TRUE;
	description = " Is there anything else I might be interested in? " ;
};

func int DIA_1013_BANDIT_PERM_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PERM_Info()
{
	AI_Output(other,self, " DIA_1013_BANDIT_PERM_15_00 " );	// Is there anything else I might be interested in?
	if (bdt13_Gossip_Wilderness ==  FALSE )
	{
		AI_Output(self,other, " DIA_1013_BANDIT_PERM_01_01 " );	// Do you mean this area? If you want to stay alive, you better stay on the road.
		AI_Output(self,other, " DIA_1013_BANDIT_PERM_01_02 " );	// The further you go into the wilderness, the more dangerous it is to be there.
		bdt13_Gossip_Wilderness = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_1013_BANDIT_PERM_01_03 " );	// I told you all I could.
	};
};

instance DIA_1013_BANDIT_LeeFarm (C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_LeeFarm_Condition;
	information = DIA_1013_BANDIT_LeeFarm_Info;
	permanent = FALSE;
	description = " If I were you, I'd go to Onar's farm. " ;
};

func int DIA_1013_BANDIT_LeeFarm_Condition()
{
	if((Bdt_1013_Away == TRUE) && (LeeMeet == TRUE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_LeeFarm_Info()
{
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_01_00 " );	// If I were you, I'd rather go to Onar's farm.
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_01_01 " );	// Lee's mercenaries are full of those who used to sit behind the Barrier. You will almost feel at home there.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_01_03 " );	// I've already thought about this myself. But there is a small problem.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_01_04 " );	// As soon as they see me in this armor, they will definitely take me for a bandit.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_01_05 " );	// And to go on such a long journey completely naked is pure madness.
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_01_06 " );	// Then you need to find others.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_01_07 " );	// Easy to say. Good armor is hard to find here.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_01_08 " );	// And I will not wear any rags.
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_01_09 " );	// Okay, I'll try to get you some decent armor.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_01_10 " );	// Thanks mate. Believe me, I will not remain in debt.
	MIS_JessArmor = LOG_Running;
	Log_CreateTopic(TOPIC_JessArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Running);
	B_LogEntry(TOPIC_JessArmor, " I promised Jess I'd get him some decent armor so he could go to Onar's farm. " );
};

instance DIA_1013_BANDIT_LeeFarm_Done(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_LeeFarm_Done_Condition;
	information = DIA_1013_BANDIT_LeeFarm_Done_Info;
	permanent = FALSE;
	description = " I have some new armor for you. " ;
};

func int DIA_1013_BANDIT_LeeFarm_Done_Condition()
{
	if((MIS_JessArmor == LOG_Running) && ((Npc_HasItems(hero,ItAr_Sld_L) >= 1) || (Npc_HasItems(hero,itar_sld_M) >= 1) || (Npc_HasItems(hero,ItAr_Sld_H) >= 1) || (Npc_HasItems(hero,ITAR_ADVENTURE_HERO) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_LeeFarm_Done_Info()
{
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_00 " );	// I have some new armor for you.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_01 " );	// Let me take a look at them. Are they right for me?
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_02 " );	// See for yourself.

	Info_ClearChoices(DIA_1013_BANDIT_LeeFarm_Done);

	if(Npc_HasItems(hero,ITAR_ADVENTURE_HERO) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done, " (Give Adventurer Armor) " ,DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01);
	};
	if(Npc_HasItems(hero,ItAr_Sld_L) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done, " (Give Mercenary Light Armor) " ,DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02);
	};
	if(Npc_HasItems(hero,itar_sld_M) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done, " (Give Mercenary Medium Armor) " ,DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03);
	};
	if(Npc_HasItems(hero,ItAr_Sld_H) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done, " (Give Mercenary Heavy Armor) " ,DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04);
	};
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ITAR_ADVENTURE_HERO,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_03 " );	// Yes, mate! Just right.
	AI_EquipArmor(self,ITAR_ADVENTURE_HERO);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_04 " );	// Well, now you can go to the mercenaries.
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_05 " );	// Can you find your own way?
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_06 " );	// Of course. Thanks for the help!
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_07 " );	// Here, take this ring.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_08 " );	// I took it with me from the chest of one of the guards in the Old Camp when I was out of there.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_09 " );	// I think you'll need it. See you.
	MIS_JessArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor, " I brought Jess armor. Now he can go to the farm with Lee's mercenaries. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ItAr_Sld_L,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_03 " );	// Yes, mate! Just right.
	AI_EquipArmor(self,ItAr_Sld_L);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_04 " );	// Well, now you can go to the mercenaries.
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_05 " );	// Can you find your own way?
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_06 " );	// Of course. Thanks for the help!
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_07 " );	// Here, take this ring.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_08 " );	// I took it with me from the chest of one of the guards in the Old Camp when I was out of there.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_09 " );	// I think you'll need it. See you.
	MIS_JessArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor, " I brought Jess armor. Now he can go to the farm with Lee's mercenaries. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03()
{
	B_GivePlayerXP(750);
	B_GiveInvItems(other,self,itar_sld_M,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_03 " );	// Yes, mate! Just right.
	AI_EquipArmor(self,itar_sld_M);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_04 " );	// Well, now you can go to the mercenaries.
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_05 " );	// Can you find your own way?
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_06 " );	// Of course. Thanks for the help!
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_07 " );	// Here, take this ring.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_08 " );	// I took it with me from the chest of one of the guards in the Old Camp when I was out of there.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_09 " );	// I think you'll need it. See you.
	MIS_JessArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor, " I brought Jess armor. Now he can go to the farm with Lee's mercenaries. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAr_Sld_H,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_03 " );	// Yes, mate! Just right.
	AI_EquipArmor(self,ItAr_Sld_H);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_04 " );	// Well, now you can go to the mercenaries.
	AI_Output(other,self, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_05 " );	// Can you find your own way?
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_06 " );	// Of course. Thanks for the help!
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_07 " );	// Here, take this ring.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_08 " );	// I took it with me from the chest of one of the guards in the Old Camp when I was out of there.
	AI_Output(self,other, " DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_09 " );	// I think you'll need it. See you.
	MIS_JessArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor, " I brought Jess armor. Now he can go to the farm with Lee's mercenaries. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};
