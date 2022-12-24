
var int NetBekIsDruid;

instance DIA_NETBEK_EXIT(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 999;
	condition = dia_netbek_exit_condition;
	information = dia_netbek_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_netbek_exit_condition()
{
	return TRUE;
};

func void dia_netbek_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_FIRSTHALLO(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 2;
	condition = dia_netbek_firsthallo_condition;
	information = dia_netbek_firsthallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_netbek_firsthallo_condition()
{
	return TRUE;
};

func void dia_netbek_firsthallo_info()
{
	AI_Output(self,other, " DIA_Netbek_Hallo_01_00 " );	// Greetings, old friend.
	AI_Output(other,self, " DIA_Netbek_Hallo_01_01 " );	// You still remember me?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_02 " );	// Of course. Although I was mostly concerned with the trees around me back then, someone like you is hard to forget!
	AI_Output(other,self, " DIA_Netbek_Hallo_01_03 " );	// Well, that's nice. What happened here?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_04 " );	// Nothing. But if you're wondering how I was able to stay alive, then it's very simple.
	AI_Output(self,other, " DIA_Netbek_Hallo_01_05 " );	// My trees gave me protection from the Sleeper's magic - they saved me from the madness and terrible death that befell my other brothers.
	AI_Output(self,other, " DIA_Netbek_Hallo_01_06 " );	// And now they brought me to a deity that helps to gain wisdom and know the true meaning of all life.
	AI_Output(self,other, " DIA_Netbek_Hallo_01_08 " );	// She is the spirit of nature, whose power you should surely feel around you right now. 
};


instance DIA_NETBEK_HALLO2(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo_condition;
	information = dia_netbek_hallo_brothers;
	permanent = FALSE;
	description = " How do you feel about other deities? " ;
};

instance DIA_NETBEK_HALLO3 (C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo_condition;
	information = dia_netbek_hello_orcs;
	permanent = FALSE;
	description = " How does your god feel about orcs? " ;
};

instance DIA_NETBEK_HALLO4(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo4_condition;
	information = dia_netbek_hello_runes;
	permanent = TRUE;
	description = " Did your god give you the knowledge of runes? " ;
};

func int dia_netbek_hallo_condition()
{
	return TRUE;
};

var int netbek_hello4;

func int dia_netbek_hallo4_condition()
{
	if(NETBEK_HALLO4 == FALSE)
	{
		return TRUE;
	};
};

func void dia_netbek_hello_brothers()
{
	AI_Output(other,self, " DIA_Netbek_Hallo_15_05 " );	// What about the other deities?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_09 " );	// You mean Innos and the others? What should I care about selfish brothers playing their eternal games!
	AI_Output(other,self, " DIA_Netbek_Hallo_15_06 " );	// Innos brings light to this world - is that a game?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_10 " );	// You have mistaken the "light" from the shimmering of gold coins piled on his shrines.
	AI_Output(other,self, " DIA_Netbek_Hallo_15_07 " );	// And you're not tempted by the power that Beliar promises?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_11 " );	// Could he have created the forest that my Goddess created here? He knows only death.
	AI_Output(other,self, " DIA_Netbek_Hallo_15_08 " );	// What about Adanos then?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_12 " );	// Perhaps Adanos is worthy of respect, true. There is wisdom in his neutrality.
	AI_Output(self,other, " DIA_Netbek_Hallo_01_20 " );	// And his water brings life to everything that grows.
	NetBekIsDruid = TRUE;
};

func void dia_netbek_hello_orcs()
{
	AI_Output(other,self, " DIA_Netbek_Hallo_15_09 " );	// How does your goddess feel about orcs?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_13 " );	// She is the mother of all living creatures.
	AI_Output(other,self, " DIA_Netbek_Hallo_15_10 " );	// So why did the orcs leave here?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_14 " );	// I thought those animals loved my trees, but they wanted to cut them down!
	AI_Output(self,other, " DIA_Netbek_Hallo_01_15 " );	// Now they're gone, and they won't enter my forest again.
};

func void dia_netbek_hello_runes()
{
	AI_Output(other,self, " DIA_Netbek_Hallo_15_12 " );	// Since your goddess is so powerful, does that mean she can give you the knowledge of new runes?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_16 " );	// Do you see any runes here?
	AI_Output(self,other, " DIA_Netbek_Hallo_01_19 " );	// True, I sometimes use transformation stones to transform into various animals.
	AI_Output(self,other, " DIA_Netbek_Hallo_01_21 " );	// But it's rather difficult to call them "runes".
	NETBEK_HALLO4 = TRUE;
};

instance DIA_NETBEK_OrcFight(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_OrcFight_condition;
	information = dia_netbek_OrcFight_info;
	permanent = FALSE;
	description = " Is there any way you can help me fight the orcs? " ;
};

func int dia_netbek_OrcFight_condition()
{
	if(Npc_KnowsInfo(hero,DIA_NETBEK_HALLO3) == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_OrcFight_info()
{
	AI_Output(other,self, " DIA_Netbek_OrcFight_01_01 " );	// Is there any way you can help me fight the orcs?
	AI_Output(self,other, " DIA_Netbek_OrcFight_01_02 " );	// Of course. But only if you help me solve a small problem.
	AI_Output(self,other, " DIA_Netbek_OrcFight_01_03 " );	// Quite recently, a huge monster appeared in my forest - a cave troll.
	AI_Output(self,other, " DIA_Netbek_OrcFight_01_04 " );	// This creature only brings destruction to my forest, trampling plants and breaking trees. He must be stopped!
	AI_Output(other,self, " DIA_Netbek_OrcFight_01_05 " );	// Do you want me to kill him?
	AI_Output(self,other, " DIA_Netbek_OrcFight_01_06 " );	// It's up to you to decide. The main thing is that it no longer harms my trees.
	AI_Output(other,self, " DIA_Netbek_OrcFight_01_07 " );	// Okay, I'll see what I can do.
	MIS_EvilTroll = LOG_Running;
	Log_CreateTopic(TOPIC_EvilTroll,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EvilTroll,LOG_Running);
	B_LogEntry(TOPIC_EvilTroll, " Netback wants me to deal with a huge troll that recently settled in his forest. " );
	Wld_InsertNpc(TROLL_CAVE_UNIQ,"WP_COAST_FOREST_72");
};

instance DIA_NETBEK_OrcFight_Done(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_OrcFight_Done_condition;
	information = dia_netbek_OrcFight_Done_info;
	permanent = FALSE;
	description = " I've dealt with your guest. " ;
};

func int dia_netbek_OrcFight_Done_condition()
{
	if((MIS_EvilTroll == LOG_Running) && (UturIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_OrcFight_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Netbek_OrcFight_Done_01_01 " );	// I've dealt with your guest.
	AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_02 " );	// Good. Now safety will return to these woods.

	if(other.attribute[ATR_DEXTERITY] > other.attribute[ATR_STRENGTH])
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_08 " );	// Take these magical herbs as a token of my appreciation.
			B_GiveInvItems(self,other,ItPl_NetbekPlant_Magic,10);
			AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_09 " );	// They will help you in your travels.
		}
		else
		{
			AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_03 " );	// Take this bow as a token of my gratitude.
			B_GiveInvItems(self,other, ITRW_KMR_KADAT_BOW_01 , 1 );
			AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_04 " );	// It was created by nature itself! It will always strive to protect you from your enemies.
		};
	}
	else
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_08 " );	// Take these magical herbs as a token of my appreciation.
			B_GiveInvItems(self,other,ItPl_NetbekPlant_Magic,10);
			AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_09 " );	// They will help you in your travels.
		}
		else
		{
			AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_06 " );	// Take these healing herbs as a token of my appreciation.
			B_GiveInvItems(self,other,ItPl_NetbekPlant,10);
			AI_Output(self,other, " DIA_Netbek_OrcFight_Done_01_07 " );	// They will heal any wounds you received in combat!
		};
	};

	MIS_EvilTroll = LOG_Success;
	Log_SetTopicStatus(TOPIC_EvilTroll,LOG_Success);
	B_LogEntry(TOPIC_EvilTroll, " Netback was glad to hear that his forest was no longer in danger. " );
};

instance DIA_NETBEK_DRAGONS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dragons_condition;
	information = dia_netbek_dragons_info;
	permanent = FALSE;
	description = " I'm going to fight dragons. " ;
};

func int dia_netbek_dragons_condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_netbek_dragons_info()
{
	AI_Output(other,self, " DIA_Netbek_Dragons_15_00 " );	// I'm going to fight the dragons. Can your goddess help me?
	AI_Output(self,other, " DIA_Netbek_Dragons_01_00 " );	// She recognizes freedom not only for you, but also for dragons. Even though their thoughts are dark and full of destruction.
	AI_Output(self,other, " DIA_Netbek_Dragons_01_01 " );	// But since this destruction has gone too far, she will help.
	AI_Output(self,other, " DIA_Netbek_Dragons_01_02 " );	// Here, take this little gift from her - the force of nature will protect you.
	B_GiveInvItems(self,other,ITRU_SUMTREANT,1);
	AI_Output(other,self, " DIA_Netbek_Dragons_01_03 " );	// Hmmm... what is this?
	AI_Output(self,other, " DIA_Netbek_Dragons_01_04 " );	// This is the magic stone of the druids.
	AI_Output(self,other, " DIA_Netbek_Dragons_01_05 " );	// With it, you can summon the faithful servants of my Goddess to help you.
	AI_Output(self,other, " DIA_Netbek_Dragons_01_06 " );	// Their wrath has helped me defend this place from enemies more than once.
};

var int netbeksayonetimemoney;

func void netbekaboutmoney()
{
	if(NETBEKSAYONETIMEMONEY == FALSE)
	{
		AI_Output(other,self,"DIA_Netbek_AboutMoney_15_00");	//And?
		AI_Output(self,other, " DIA_Netbek_AboutMoney_01_01 " );	// Do you expect a reward from me?
		AI_Output(self,other, " DIA_Netbek_AboutMoney_01_02 " );	// Do you do everything in your life for money?
		AI_Output(self,other, " DIA_Netbek_AboutMoney_01_03 " );	// Don't expect that from me. I do not own a wallet.
		AI_Output(self,other, " DIA_Netbek_AboutMoney_01_04 " );	// You need a wallet to deposit money. You have to put your wallet in your pants. There is no longer a need for a sword to protect these pants or purse.
		AI_Output(self,other, " DIA_Netbek_AboutMoney_01_05 " );	// Where pants and a sword are stored, there is a house. Where there is a house, there are thoughts - thoughts of things and the gaining of more things.
		AI_Output(self,other, " DIA_Netbek_AboutMoney_01_06 " );	// And with these thoughts, there will be no time left for my trees, nor for conversations with my Goddess.
		AI_Output(self,other, " DIA_Netbek_AboutMoney_01_07 " );	// In short, I'm broke.
		NETBEKSAYONETIMEMONEY = TRUE;
	};
};


instance DIA_NETBEK_DRAGONSDEAD(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dragonsdead_condition;
	information = dia_netbek_dragonsdead_info;
	permanent = FALSE;
	description = " All dragons are dead! " ;
};


func int dia_netbek_dragonsdead_condition()
{
	if ((MY_AllDragonsDead ==  TRUE ) && (Chapter <  6 ))
	{
		return TRUE;
	};
};

func void dia_netbek_dragonsdead_info()
{
	B_GivePlayerXP(XP_NETBEKGREATWORK);
	AI_Output(other,self, " DIA_Netbek_DragonsDead_15_00 " );	// All dragons are dead!
	AI_Output(self,other, " DIA_Netbek_DragonsDead_01_01 " );	// Thank you. They were bad guests.
	netbekaboutmoney();
};


instance DIA_NETBEK_LASTDRAGON(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_lastdragon_condition;
	information = dia_netbek_lastdragon_info;
	permanent = FALSE;
	description = " I'm going to the Temple of Irdorath. " ;
};


func int dia_netbek_lastdragon_condition()
{
	if ((MIS_SCKnowsWayToIrdorath ==  TRUE ) && (Capital <  6 ) && (RealMode[ 2 ] ==  FALSE )) .
	{
		return TRUE;
	};
};

func void dia_netbek_lastdragon_info()
{
	AI_Output(other,self, " DIA_Netbek_LastDragon_01_00 " );	// I'm going to the temple of Irdorath to fight the dark servants of Beliar there.
	AI_Output(other,self, " DIA_Netbek_LastDragon_01_01 " );	// Can't your goddess help me with something?
	AI_Output(self,other, " DIA_Netbek_LastDragon_01_02 " );	// She already warned me about your coming here.
	AI_Output(self,other, " DIA_Netbek_LastDragon_01_03 " );	// And with her help, I made a special potion just for you.
	AI_Output(other,self, " DIA_Netbek_LastDragon_01_04 " );	// What is this potion?
	AI_Output(self,other, " DIA_Netbek_LastDragon_01_05 " );	// Like I said, this is a very unusual potion. It grants you immortality!
	AI_Output(self,other, " DIA_Netbek_LastDragon_01_06 " );	// True, only for a while and only once.
	AI_Output(self,other, " DIA_Netbek_LastDragon_01_07 " );	// Use it only when absolutely necessary. Here, take it.
	B_GiveInvItems(self,other,itpo_xmagicdef,1);
	AI_Output(other,self, " DIA_Netbek_LastDragon_01_08 " );	// Immortality...
	AI_Output(self,other, " DIA_Netbek_LastDragon_01_09 " );	// And remember, your main battle may not be what you imagine it to be.
};


instance DIA_NETBEK_DEMENTORS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dementors_condition;
	information = dia_netbek_dementors_info;
	permanent = FALSE;
	description = " I need help to defeat the dark wanderers. " ;
};


func int dia_netbek_dementors_condition()
{
	if((Kapitel < 6) && ((SC_ObsessionCounter > 0) || (SC_ObsessionTimes > 0) || (SC_IsObsessed == TRUE)))
	{
		return TRUE;
	};
};

func void dia_netbek_dementors_info()
{
	AI_Output(other,self, " DIA_Netbek_Dementors_15_00 " );	// I need help to defeat the dark wanderers. Will you help me?
	AI_Output(self,other, " DIA_Netbek_Dementors_01_00 " );	// You can handle it yourself.
	AI_Output(self,other, " DIA_Netbek_Dementors_01_01 " );	// It's hard for me to kill erstwhile brothers, even if they are dead already!

	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_NOV))
	{
		AI_Output(self,other, " DIA_Netbek_Dementors_01_02 " );	// And your Innos frees you from unnecessary thoughts.
	};
};


instance DIA_NETBEK_HEADILL(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_headill_condition;
	information = dia_netbek_headill_info;
	permanent = FALSE;
	description = " Does anyone in the camp have headaches? " ;
};


func int dia_netbek_headill_condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void dia_netbek_headill_info()
{
	AI_Output(other,self, " DIA_Netbek_HeadIll_15_00 " );	// Does anyone in the camp have headaches? Or bad dreams?
	AI_Output(self,other, " DIA_Netbek_HeadIll_01_00 " );	// I sense dark magic circling this valley.
	AI_Output(self,other, " DIA_Netbek_HeadIll_01_01 " );	// It's really dangerous to be here! Especially my former Swamp camp brethren.
	AI_Output(self,other, " DIA_Netbek_HeadIll_01_02 " );	// But my Goddess gives me the strength and ability to protect this place. Here they are completely safe.
};


instance DIA_NETBEK_HEALING(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_healing_condition;
	information = dia_netbek_healing_info;
	permanent = TRUE;
	description = " Please heal me. " ;
};


func int dia_netbek_healing_condition()
{
	if(Npc_KnowsInfo(other,dia_netbek_firsthallo))
	{
		return TRUE;
	};
};


var int netbekhealobsession;

func void dia_netbek_healing_info()
{
	AI_Output(other,self, " DIA_Netbek_Healing_15_00 " );	// Please heal me.
	if(SC_IsObsessed == TRUE)
	{
		if(SC_ObsessionTimes < 1)
		{
			AI_Output(other,self, " DIA_Netbek_Healing_15_01 " );	// And I also have some discomfort after meeting with the dark wanderers.
			AI_Output(self,other, " DIA_Netbek_Healing_01_00 " );	// They have cursed your soul...
			AI_Output(self,other, " DIA_Netbek_Healing_01_01 " );	// You must go to the mages of Innos.
			AI_Output(self,other, " DIA_Netbek_Healing_01_02 " );	// However, you asked me to cure you - and my Goddess taught me how.
			NETBEKHEALOBSESSION = TRUE;
		}
		else
		{
			AI_Output(other,self, " DIA_Netbek_Healing_15_02 " );	// I'm cursed  again.
			if(NETBEKHEALOBSESSION == FALSE)
			{
				AI_Output(self,other, " DIA_Netbek_Healing_01_03 " );	// You should go to the mages of Innos.
				AI_Output(self,other, " DIA_Netbek_Healing_01_04 " );	// But you asked me to cure you - and my Goddess taught me how.
				NETBEKHEALOBSESSION = TRUE;
			}
			else if(MIS_OCGateOpen == TRUE)
			{
				AI_Output(self,other, " DIA_Netbek_Healing_01_08 " );	// Good, even though you don't deserve it.
			}
			else
			{
				AI_Output(self,other,"DIA_Netbek_Healing_01_07");	//Thanks.
			};
		};
		AI_WaitTillEnd(self,other);
		SC_ObsessionTimes = SC_ObsessionTimes + 1;
		B_ClearSCObsession(hero);
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	}
	else if(hero.attribute[ATR_HITPOINTS] >= hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Netbek_Healing_01_05");	//You are healthy.
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		if(MIS_OCGateOpen == TRUE)
		{
			AI_Output(self,other, " DIA_Netbek_Healing_01_09 " );	// Okay, I'll help you. Even though you don't deserve it.
		}
		else
		{
			AI_Output(self,other, " DIA_Netbek_Healing_01_06 " );	// Good. I will help you.
		};
		AI_WaitTillEnd(self,other);
	};
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_Print(PRINT_FullyHealed);
	};
	AI_Output(self,other, " DIA_Netbek_Healing_01_10 " );	// Here. Now you are healthy again.
	AI_Output(other,self,"DIA_Netbek_Healing_15_03");	//Thank you.
};


instance DIA_NETBEK_WHATHAPPENED(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_whathappened_condition;
	information = dia_netbek_whathappened_info;
	permanent = FALSE;
	description = " Has anything happened lately? " ;
};


func int dia_netbek_whathappened_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_netbek_whathappened_info()
{
	AI_Output(other,self, " DIA_Netbek_WhatHappened_01_01 " );	// Has anything happened lately?
	AI_Output(self,other, " DIA_Netbek_WhatHappened_01_02 " );	// Orcs tried to attack our camp a couple of days ago, but they didn't succeed.
	AI_Output(self,other, " DIA_Netbek_WhatHappened_01_03 " );	// I'm sure they won't show up here again.
	AI_Output(self,other, " DIA_Netbek_WhatHappened_01_05 " );	// Look around, and you will understand everything yourself.
	AI_Output(other,self, " DIA_Netbek_WhatHappened_01_06 " );	// Was it your goddess that protected you?
	AI_Output(self,other, " DIA_Netbek_WhatHappened_01_07 " );	// (smiles) Of course. She will always help us.
};

instance DIA_NETBEK_GUARDIANSKNOW(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guardiansknow_condition;
	information = dia_netbek_guardiansknow_info;
	permanent = FALSE;
	description = " What does your goddess know about Guardians? " ;
};

func int dia_netbek_guardiansknow_condition()
{
	if((GATHERALLONBIGFARM == TRUE) && (MIS_ORCSECRET == LOG_Running) && (PyrokarTellAboutCreatures == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_guardiansknow_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Netbek_GuardiansKnow_01_01 " );	// What does your god know about the Guardians?
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_02 " );	// She knows everything. But it seems to me that you wanted to ask me something completely different. Is not it?
	AI_Output(other,self, " DIA_Netbek_GuardiansKnow_01_03 " );	// Yes, you're right. I really intended to ask you a very different question.
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_04 " );	// Will my goddess be able to destroy these ancient creatures you call Guardians? Am I right?
	AI_Output(other,self, " DIA_Netbek_GuardiansKnow_01_05 " );	// Apparently, nothing can be hidden from you.
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_06 " );	// Well, then I'll answer your question. Unfortunately, her power in this world is not so great as to oppose the power of the Creators themselves.
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_07 " );	// But despite this, she is quite capable of helping those who are destined by fate to challenge them.
	AI_Output(other,self, " DIA_Netbek_GuardiansKnow_01_08 " );	// And who is capable of this?
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_09 " );	// In this world, there is only one person on whose actions the fate of the gods depends - you.
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_10");	//Why am I not surprised?!
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_11 " );	// You are no mere mortal, and you should have figured that out by now. Ordinary people could not have done the things you have done.
	AI_Output(other,self, " DIA_Netbek_GuardiansKnow_01_15 " );	// What the fuck does that even mean? I'm just a man!
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_16 " );	// Haven't you figured it out yet? You serve Innos, Beliar or Adanos differently than everyone else.
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_17 " );	// You have always chosen your own path. You serve or disregard the gods as you see fit. They do not control you, quite the oppsite in fact.
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_18 " );	// But now the time has come when you are required to stand up for everything that exists in this world.
	AI_Output(self,other, " DIA_Netbek_GuardiansKnow_01_19 " );	// And only you can protect this world from the evil of the Guardians!
 	B_LogEntry( TOPIC_GUARDIANS , " I turned to Netbek for help, believing that the deity he serves is quite capable of defeating the Guardians. However, his answer somewhat surprised me. According to him, only I can defeat the Guardians, and his goddess can only help me in this. Apparently, the fate of this world and its gods really lies only on my shoulders. However, as always ... " );
};

instance DIA_NETBEK_GUARDIANSHOWHELP(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guardianshowhelp_condition;
	information = dia_netbek_guardianshowhelp_info;
	permanent = FALSE;
	description = " And how will your goddess help me? " ;
};

func int dia_netbek_guardianshowhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_netbek_guardiansknow) == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_guardianshowhelp_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Netbek_GuardiansHowHelp_01_01 " );	// And how will your goddess help me?
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_02 " );	// She will tell you how to prepare to fight these ancient creatures.
	AI_Output(other,self, " DIA_Netbek_GuardiansHowHelp_01_04 " );	// Good. What exactly do I need to do?
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_05 " );	// First, you should turn to the gods themselves. Ask them to endow you with their divine strength and power.
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_06 " );	// I'm sure any of the altars, or any sacred place marked with their sign, would do just fine.
	AI_Output(other,self, " DIA_Netbek_GuardiansHowHelp_01_07 " );	// It's not that hard. What's next?
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_08 " );	// You will need to create a special magic weapon with which you want to defeat the Guardians.
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_09 " );	// Since ordinary mortal weapons or rune magic are unlikely to harm them.
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_12 " );	// Keepers, in addition to their divine essence, are also creatures of various forms of elements.
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_13 " );	// So first you have to find some very rare artifacts that contain the true structure of each of them.
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_14 " );	// After that, you will have to somehow put all their power into the rune or blade of your choice.
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_18 " );	// After you receive the blessing of the gods, I'll tell you exactly where to look for them.
	AI_Output(other,self, " DIA_Netbek_GuardiansHowHelp_01_21 " );	// Anything else?
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_22 " );	// Well, the last thing you need is to find the way to the sacred abode of the Guardians!
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_23 " );	// This is the end of my knowledge.
	AI_Output(other,self, " DIA_Netbek_GuardiansHowHelp_01_24 " );	// No problem. I think I had a teleportation rune somewhere leading straight to their lair.
	AI_Output(self,other, " DIA_Netbek_GuardiansHowHelp_01_25 " );	// Truly? Well, if so, then you only have to fulfill the first two conditions.
	B_LogEntry( TOPIC_GUARDIANS , " Netbek told me how to prepare myself to fight the Guardians. First, I must turn to the gods to get their strength and power. After that, I will need to create a special magic weapon that can defeat the Guardians. To create it, you will need several very rare artifacts, the power of which is capable of endowing it with unprecedented power. Apparently, the artifacts themselves will be quite difficult to find, but Netbek promised to help me with this as well. " );
};

instance DIA_NETBEK_HOWGETBLESSED(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_HOWGETBLESSED_condition;
	information = DIA_NETBEK_HOWGETBLESSED_info;
	permanent = FALSE;
	description = " And you think the gods are just going to give me their power, just like that? " ;
};

func int DIA_NETBEK_HOWGETBLESSED_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Netbek_GuardiansHowHelp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_HOWGETBLESSED_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_NETBEK_HOWGETBLESSED_01_01 " );	// And you think the gods are just going to give me their power, just like that?
	AI_Output(self,other, " DIA_NETBEK_HOWGETBLESSED_01_02 " );	// Believe me, they have no other choice!
	AI_Output(self,other, " DIA_NETBEK_HOWGETBLESSED_01_03 " );	// No one but you is capable of becoming the one into whose hands they must to entrust their power.
	AI_Output(self,other, " DIA_NETBEK_HOWGETBLESSED_01_04 " );	// However, before doing this, the gods will probably want to break free from the strands of fate that ties you to them.
	AI_Output(self,other, " DIA_NETBEK_HOWGETBLESSED_01_05 " );	// The fate of this world depends on their choice, and now they have no room for error. Same as you.
	AI_Output(other,self, " DIA_NETBEK_HOWGETBLESSED_01_07 " );	// I understand this very well. But what will they need from me this time?
	AI_Output(self,other, " DIA_NETBEK_HOWGETBLESSED_01_08 " );	// I'm sure they'll tell you about it themselves.
	AI_Output(self,other, " DIA_NETBEK_HOWGETBLESSED_01_09 " );	// Just address them in prayer, and you will hear their will!
	NETBEKLEADME_STEP1 = TRUE;
	B_LogEntry( TOPIC_GUARDIANS , " Before the gods grant me their power, they will want to test me one more time. What that test may be, I will have to ask them themselves. " );
};

instance DIA_NETBEK_TITANS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_condition;
	information = DIA_NETBEK_TITANS_info;
	permanent = FALSE;
	description = " It seems that the Guardians also patronize the orcs. " ;
};

func int DIA_NETBEK_TITANS_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Netbek_GuardiansHowHelp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NETBEK_TITANS_01_01 " );	// It seems that the Guardians also patronize the orcs.
	AI_Output(other,self, " DIA_NETBEK_TITANS_01_02 " );	// Do you know anything about this?
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_03 " );	// We recently had to deal with them again.
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_04 " );	// It seemed to me that they were surrounded by some powerful protective aura.
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_05 " );	// To tell you the truth, I don't know what that was about.
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_06 " );	// My goddess helped me deal with the threat this time as well.
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_07 " );	// However, I agree with you that the orcs should have never been able to use such magic.
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_08 " );	// Perhaps there really was some ancient force intervening here.
	AI_Output(other,self, " DIA_NETBEK_TITANS_01_09 " );	// We need to find and destroy the source of this magic!
	AI_Output(other,self, " DIA_NETBEK_TITANS_01_10 " );	// Otherwise, the humans won't stand a chance against the orcs.
	AI_Output(other,self, " DIA_NETBEK_TITANS_01_11 " );	// Your goddess can't protect them all.
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_12 " );	// Yes, you're right. she is not as powerful as the rest of the deities in this world.
	AI_Output(other,self, " DIA_NETBEK_TITANS_01_13 " );	// Then at least help me find this ancient evil. If you can't do more.
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_14 " );	// I'll ask her to help. But that will take some time.
	AI_Output(other,self, " DIA_NETBEK_TITANS_01_15 " );	// Time is the one thing we don't have.
	AI_Output(self,other, " DIA_NETBEK_TITANS_01_16 " );	// Come back tomorrow. I will try to find out what caused the orcs' powerful magic.
	NetBekWaitDay = Wld_GetDay();
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_TITANS_KNOW(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_KNOW_condition;
	information = DIA_NETBEK_TITANS_KNOW_info;
	permanent = FALSE;
	description = " So what about the magic that protects the orcs? " ;
};

func int DIA_NETBEK_TITANS_KNOW_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if ((Npc_KnowsInfo(hero, DIA_NETBACK_TITANS ) ==  TRUE ) && (NetBackWaitDay !=  FALSE ) && (NetBackWaitDay < daynow))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_KNOW_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NETBEK_TITANS_KNOW_01_01 " );	// So what about the magic that protects the orcs?
	AI_Output(self,other, " DIA_NETBEK_TITANS_KNOW_01_02 " );	// It was caused by very ancient beings who only obey the will of the Guardians.
	AI_Output(self,other, " DIA_NETBEK_TITANS_KNOW_01_03 " );	// They came into this world with their consent, and it is their magic that helps the orcs in the war against humans.
	AI_Output(other,self, " DIA_NETBEK_TITANS_KNOW_01_04 " );	// What are these creatures?
	AI_Output(self,other, " DIA_NETBEK_TITANS_KNOW_01_05 " );	// They are all products of the purest magic of this world.
	AI_Output(self,other, " DIA_NETBEK_TITANS_KNOW_01_06 " );	// I am sure that the Keepers have invested in them a huge part of their strength and power.
	AI_Output(self,other, " DIA_NETBEK_TITANS_KNOW_01_07 " );	// Assuming that each of the keepers is the very embodiment of one of the elements...
	AI_Output(self,other, " DIA_NETBEK_TITANS_KNOW_01_08 " );	// ...then it is quite possible to assume that these creatures are their very essence.
	AI_Output(self,other, " DIA_NETBEK_TITANS_KNOW_01_09 " );	// More, unfortunately, I can't tell you yet.
	AI_Output(other,self, " DIA_NETBEK_TITANS_KNOW_01_10 " );	// Hmm, I see. I should probably go.
	AI_Output(other,self, " DIA_NETBEK_TITANS_KNOW_01_11 " );	// I don't want to waste any more time talking.
	AI_Output(self,other, " DIA_NETBEK_TITANS_KNOW_01_12 " );	// Wait. That's not all I wanted to talk to you about.
	B_LogEntry( TOPIC_ORCSECRET , " Netbek's god told him that the reason for everything was the ancient creatures that the Guardians themselves gave birth to. They put most of their power into them and it is their magic that allows the orcs to remain invulnerable. According to the druid, the creatures themselves are the essence of elemental magic, and the Guardians themselves created them. That's all Netback knows. " );
};

instance DIA_NETBEK_TITANS_Sleeper(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_condition;
	information = DIA_NETBEK_TITANS_Sleeper_info;
	permanent = FALSE;
	description = " Any news? " ;
};

func int DIA_NETBEK_TITANS_Sleeper_condition()
{
	if((Npc_KnowsInfo(hero,DIA_NETBEK_TITANS_KNOW) == TRUE) && (MIS_SleeperBack == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_info()
{
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_01 " );	// Any news?
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_02 " );	// The fact is that lately, I have been tormented by strange visions from my past.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_03 " );	// This is very strange, considering that the magic of this place has always protected us from all sorts of nightmares.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_04 " );	// In addition, many of the former acolytes of the Brotherhood here are suffering severe headaches again!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_05 " );	// The same as they were then, during the destruction of the magical barrier.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_06 " );	// Unfortunately, I can't explain what's going on yet, but I already have some misgivings.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_07 " );	// What are you implying?
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_08 " );	// It seems to me that the evil you once banished is seeping back into this reality.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_09 " );	// Do you mean the Sleeper?
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_10 " );	// Yes...
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_11 " );	// I hate to think about it, but every day my worries grow more and more.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_12 " );	// Then we should check the orc temple immediately! Perhaps you are right.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_13 " );	// In what sense?
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_14 " );	// The dark wizard I killed in the temple told me before he died that he had finished the demon summoning ritual.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_15 " );	// I didn't attach much meaning to his words then.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_16 " );	// But, apparently, I should have!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_17 " );	// If so, then you need to go to the temple as soon as possible.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_18 " );	// Before it's too late!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_19 " );	// The return of the Sleeper to this world is the very last thing we need!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_20 " );	// Plus, given the threat from the Guardians, the world could collapse overnight!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_21 " );	// And neither Innos nor Beliar nor Adanos would be able to prevent it.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_22 " );	// Okay, calm down. Consider me halfway to the temple.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_01_23 " );	// And if necessary, return this uninvited guest to where he came from.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_01_24 " );	// Then hurry up and go! Every minute counts.
	B_LogEntry( TOPIC_SLEEPERBACK , " It looks like my fears about the Sleeper are beginning to be confirmed. Netback is having nightmares at night, and former acolytes of the Brotherhood are getting severe headaches. I need to visit the Temple as soon as possible and sort this out. " );
	SLEEPERINSHRAM = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_TITANS_Sleeper_Find(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_Find_condition;
	information = DIA_NETBEK_TITANS_Sleeper_Find_info;
	permanent = FALSE;
	description = "The sleeper has returned to the human world! " ;
};

func int DIA_NETBEK_TITANS_Sleeper_Find_condition()
{
	if((SleeperOldIsDead == FALSE) && (NeedSleeperStone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_Find_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Find_01_01 " );	// The sleeper has returned to the human world!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_02 " );	// So, my fears were not unwarrented... We are all in great danger!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_03 " );	// That demon is capable of destroying our world even without the intervention of the Guardians.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_04 " );	// We need to do something before it's too late.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Find_01_05 " );	// There is also another problem.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Find_01_06 " );	// I'm completely helpless against the Sleeper's magic!
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Find_01_07 " );	// As soon as I get close to him, I fall into a deep sleep.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_08 " );	// The Sleeper's magic is very dangerous! He doesn't even have to cut you to pieces.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_09 " );	// He will simply drive you mad.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Find_01_10 " );	// What can I do?
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_11 " );	// You need a powerful artifact that can protect you from his mental tentacles.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Find_01_12 " );	// Do you know of any?
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_13 " );	// Unfortunately not. I am no demonologist.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Find_01_14 " );	// What about your goddess? Can't she help me?
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_15 " );	// I'm afraid not. It is unlikely that her strength will be enough to resist the magic of an ancient demon.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Find_01_16 " );	// Her gifts are the gifts of healing and life! Here she is absolutely powerless.
	NeedDemonolog = TRUE;
	B_LogEntry( TOPIC_SLEEPERBACK , " I will need a powerful artifact to counter the Sleeper's magic. But only those who are well versed in the essence of demons might know of such a thing. " );
};

instance DIA_NETBEK_TITANS_Sleeper_Dead(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_Dead_condition;
	information = DIA_NETBEK_TITANS_Sleeper_Dead_info;
	permanent = FALSE;
	description = " The sleeper is dead! " ;
};

func int DIA_NETBEK_TITANS_Sleeper_Dead_condition()
{
	if(SleeperOldIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_Dead_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Dead_01_01 " );	// The Sleeper is dead!
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Dead_01_02 " );	// I have slain the demon once more, and he will never disturb us again.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Dead_01_03 " );	// I already know. I felt it as soon as you killed him.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Dead_01_04 " );	// My nightmares have receded and no longer bother me or the other brothers.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Dead_01_05 " );	// I thank you for your help in ridding this world of such great evil again.
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Dead_01_06 " );	// Please accept this as thanks.
	Info_ClearChoices(DIA_NETBEK_TITANS_Sleeper_Dead);
	Info_AddChoice(DIA_NETBEK_TITANS_Sleeper_Dead,"И где она?",DIA_NETBEK_TITANS_Sleeper_Dead_Prize);
};

func void DIA_NETBEK_TITANS_Sleeper_Dead_Prize()
{
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,EligorPrice);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,ATR_HITPOINTS_MAX);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_01 " );	// What's going on?!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_02 " );	// My goddess has increased your life force!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_03 " );	// This will help you to face the enemies and threats of this world more confidently in the future.
	AI_Output(other,self, " DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_04 " );	// Thank you! I feel so much healthier already!
	AI_Output(self,other, " DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_05 " );	// No doubt.
	Info_ClearChoices(DIA_NETBEK_TITANS_Sleeper_Dead);
};

instance DIA_NETBEK_LEADMESTEPONEDONE(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_leadmesteponedone_condition;
	information = dia_netbek_leadmesteponedone_info;
	permanent = FALSE;
	description = "The gods gave me their power! " ;
};

func int dia_netbek_leadmesteponedone_condition()
{
	if(NETBEKLEADME_STEP1DONE == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_leadmesteponedone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_00 " );	// The gods granted me their power!
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_02 " );	// Then it's time to think about your next move.
	AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_03 " );	// Yeah, what about artifacts and magical weapons?
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_04 " );	// Guardians are too powerful to be defeated by normal blades or magic.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_05 " );	// Something special is needed here...
	AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_06 " );	// What do you mean?
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_07 " );	// All the power of the Guardians comes from the magical essences of the elements of this world - Fire, Water, Darkness and Stone!
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_08 " );	// And only a weapon that has all of these properties at once will be able to touch them.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_09 " );	// It's unlikely to be found, but it can be created. And I will help you with this.
	AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_10 " );	// Then I'm all ears.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_11 " );	// Good. To begin with, you will need artifacts that contain the purest elemental magic.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_12 " );	// They can only be contained in the very ancient and most powerful beings of this world.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_13 " );	// I remember you asking about the unusual magic that protects the orcs.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_14 " );	// So, those creatures, generated by the magic of the Guardians, may well contain the items we need.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_15 " );	// Just don't ask me where to find them. That is beyond my sight.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_16 " );	// You'll have to find them yourself. But I'm sure it won't be difficult.
	AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_17 " );	// Especially considering the fact that they've probably already gathered around them a great many lesser beings spawned by their own magic.
	AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_18 " );	// Okay, what's next?
	ELEMTITANSINS = TRUE;

	if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_KDM ))
	{
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_20 " );	// Since you're a mage, you'll probably find it easier to deal with a magic rune than a sword.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_21 " );	// However, in order to imbue it with the power of the artifacts you found, you'll need another rare item.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_23 " );	// A focusing crystal, also known as a uniter.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_24 " );	// These stones have almost all the magical properties needed to transfer artifact energy into your rune.
		AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_26 " );	// Where can I find this unit?
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_27 " );	// As far as I remember, Uberion, the supreme guru of the Brotherhood, once had a similar item.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_29 " );	// So it is possible that this stone is still in our old camp in the swamps. Try looking for it there.
		AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_30 " );	// I'm afraid your advice won't help me much since I took this crystal to the Hydromancers.
		AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_31 " );	// And they recently used it to activate portals in the forgotten part of the island, Jharkendar.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_32 " );	// I'm afraid I can't help in that case. Try asking the mages themselves.
		AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_34 " );	// Okay. I'll think of something.
		AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_35 " );	// Better tell me how to transfer the power of the artifacts through it into the rune.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_36 " );	// For this you will need to use the runic table.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_37 " );	// Place the stone in the center of the sphere and use the uniter to focus the energy of each of the elements on it at the same time.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_38 " );	// After that, the runestone will begin to glow with a bright light.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_39 " );	// And the more it absorbs the energy directed at it, the stronger this glow will become.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_40 " );	// In the end, the bright light will abruptly disappear - this will mean that the rune has completely absorbed all the power of the artifacts.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_41 " );	// After that the rest is up to you.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_43 " );	// The Guardian fight promises to be tough, but let's hope you succeed.
		B_LogEntry(TOPIC_GUARDIANS,"After I completed Netbek's first errand, he revealed to me the secret of creating some kind of magical weapon with which I would have to defeat the Guardians. And since I am a magician, it would be easier for me to manage it as a magic rune than as a sword. For all this, I will need to find several artifacts, the power of which will give this weapon unprecedented power. According to him, all these items are part of the oldest creatures generated by the elements of this world. Netback suggested that those creatures that protect the orcs with their magic may contain such artifacts. I will have to look for them myself.");
		Log_AddEntry(TOPIC_GUARDIANS,"When the artifacts are in my hands, I will need one more item - a focus unit stone. With it, I can transfer the energy of these artifacts I found into a runestone. The process of creating this magical rune is quite simple - just place it in the center of the sphere on the rune table and focus the energy of all objects on it through the uniter, after which the rune itself will completely absorb this energy and I will receive a weapon that, in its power, knows no equal in this world, not even the Guardians.");
		HOWCANMAKERUNE = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_45 " );	// Since you're a warrior, you'll probably find it easier to deal with a sword than a magic rune.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_46 " );	// Therefore, you will have to forge a special ore blade first.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_48 " );	// But regular magic ore won't work here.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_49 " );	// Only a very rare breed is suitable for crafting this sword. Namely, black ore.
		AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_50 " );	// Black ore? That's really hard to find.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_52 " );	// Each piece of this rock is a real treasure; in its magical properties, it far exceeds the usual stuff.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_53 " );	// You will need as many as five of these pieces in order to forge your sword.
		AI_Output(other,self, " DIA_Netbek_LeadMeStepOneDone_01_54 " );	// Do you know where I can get some?
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_56 " );	// Honestly, no. You will have to look for it yourself.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_58 " );	// When you have this sword in your hands, you will need to transfer the energy of the artifacts you found into it.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_60 " );	// I'm sure the Pyromancers can help you with that.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_61 " );	// They should be powerful enough to cast such a spell.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_62 " );	// Use it to transfer the power of the artifacts into your sword, and you will end up with a weapon whose power is unparalleled!
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_63 " );	// After that, the rest is up to you.
		AI_Output(self,other, " DIA_Netbek_LeadMeStepOneDone_01_64 " );	// The Guardian fight promises to be tough, but let's hope you succeed.
		B_LogEntry(TOPIC_GUARDIANS,"After I completed Netbek's first errand, he revealed to me the secret of creating some kind of magical weapon with which I would have to defeat the Guardians. And since I am a warrior, it would be easier for me to handle it like a sword, rather than like a magic rune. To do all this, I will need to find a few artifacts, the power of which will give this weapon unprecedented power. According to him, all these items are part of the oldest creatures generated by the elements of this world.Netback suggested that those creatures that protect the orcs with their magic may contain such artifacts. I will have to look for them myself.");
		Log_AddEntry(TOPIC_GUARDIANS,"Next, I need to find five pieces of black ore for a one-handed sword and ten pieces for a two-handed sword, after which I can forge a black ore sword. According to Netbek, any piece of this rock is inherently a real treasure, and finding it will be extremely difficult. When the sword itself is in my hands, I will need to find another item - a spell that can transfer all the energy of the artifacts I found into it. According to Netbek, the Firebenders will be able to help me with this. Using this spell, I will get a weapon unparalleled in its power in this world. All that remains for me is to go to the Guardians' abode and finish them.");
		HOWCANMAKEBLACKSWORD = TRUE;
	};

	NETBEKLEADME_STEP2 = TRUE;
	AI_StopProcessInfos(self);

	Wld_InsertNpc(Avatar_Water,"OW_ICEREGION_78");
	Wld_InsertNpc(Avatar_Fire,"URHAN_CHALANGE");
	Wld_InsertNpc(Avatar_Stone,"OW_ROCKDRAGON_11");

	Wld_InsertNpc(DMT_13004_STONEMAGE,"DM_RITUAL_04");
	Wld_InsertNpc(DMT_13005_STONEMAGE,"DM_RITUAL_05");
	Wld_InsertNpc(DMT_13006_STONEMAGE,"DM_RITUAL_06");
	Wld_InsertNpc(DMT_13007_FIREMAGE,"DM_RITUAL_07");
	Wld_InsertNpc(DMT_13008_FIREMAGE,"DM_RITUAL_08");
	Wld_InsertNpc(DMT_13009_FIREMAGE,"DM_RITUAL_09");
	Wld_InsertNpc(DMT_13010_WATERMAGE,"DM_RITUAL_10");
	Wld_InsertNpc(DMT_13011_WATERMAGE,"DM_RITUAL_11");
	Wld_InsertNpc(DMT_13012_WATERMAGE,"DM_RITUAL_12");

	// -------Water Avatar's retinue--------------------------------

	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_67");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_66");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_65");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_109");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_101");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_102");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_103");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_20_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_20_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_95");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_96");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_97");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_93");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_91");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_92");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_89");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_86");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_87");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_88");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_77");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_78");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_79");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_05");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_04");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_72");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_73");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_74");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_69");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_70");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_33_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_33_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_63");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_64");

	// -------Water Avatar's retinue--------------------------------


	// -------retinue of the Avatar of Fire--------------------------------

	Wld_InsertNpc(FireGolem,"CASTLE_35");
	Wld_InsertNpc(FireGolem,"CASTLE_30");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_150");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_149");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_144");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_145");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_146");
	Wld_InsertNpc(FireGolem,"CASTLE_22");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_142");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_143");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_141");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_139");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_140");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_136");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_137");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_138");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_133");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_134");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_135");
	Wld_InsertNpc(FireGolem,"CASTLE_12");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_132");
	Wld_InsertNpc(FireGolem,"CASTLE_32");
	Wld_InsertNpc(FireGolem,"CASTLE_33");
	Wld_InsertNpc(FireGolem,"CASTLE_34");

	// -------retinue of the Avatar of Fire--------------------------------


	// -------Retinue of the Avatar of the Rock--------------------------------

	Wld_InsertNpc(WindGolem,"OW_ROCKDRAGON_05");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_06");
	Wld_InsertNpc(WindGolem,"OW_ROCKDRAGON_04");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_181");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_188");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_182");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_180");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_02");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_179");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_176");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_177");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_178");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_03");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_183");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_187");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_15");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_186");
	Wld_InsertNpc(WindGolem,"FP_ROAM_DRACONIAN_184");

	// -------Retinue of the Avatar of the Rock--------------------------------
};

instance DIA_NETBEK_MAKEBLACKSWORD(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 2;
	condition = dia_netbek_makeblacksword_condition;
	information = dia_netbek_makeblacksword_info;
	permanent = FALSE;
	description = " How do I forge this black ore sword? " ;
};

func int dia_netbek_makeblacksword_condition()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_makeblacksword_info()
{
	AI_Output(other,self, " DIA_Netbek_MakeBlackSword_01_00 " );	// How do I forge this black ore sword?
	AI_Output(self,other, " DIA_Netbek_MakeBlackSword_01_01 " );	// Just like a normal ore blade.
	AI_Output(self,other, " DIA_Netbek_MakeBlackSword_01_02 " );	// However, if you don't know how to do it... Then Darion, our blacksmith, can teach you how to do it. Talk to him.
};

instance DIA_NETWORK_GUARD_FAIL (C_Info) .
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guarddefeat_condition;
	information = dia_netbek_guarddefeat_info;
	permanent = FALSE;
	description = " I destroyed the Guardians! " ;
};

func int dia_netbek_guarddefeat_condition()
{
	if(ALLGUARDIANSKILLED == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_guarddefeat_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Netbek_GuardDefeat_01_00 " );	// I destroyed the Guardians! We are no longer in danger.
	AI_Output(self,other, " DIA_Netbek_GuardDefeat_01_01 " );	// Good. Although, to tell the truth, I was sure from the very beginning that you would be able to do it.
	AI_Output(self,other, " DIA_Netbek_GuardDefeat_01_02 " );	// It's no coincidence that the gods defer to you in all these major events. You are... something else entirely.
};

instance DIA_NETBEK_CALMYOU(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_calmyou_condition;
	information = dia_netbek_calmyou_info;
	permanent = FALSE;
	description = " Your calmness is impressive. " ;
};

func int dia_netbek_calmyou_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_netback_guarddefeat ))
	{
		return TRUE;
	};
};

func void dia_netbek_calmyou_info()
{
	AI_Output(other,self, " DIA_Netbek_CalmYou_01_01 " );	// Your calmness is impressive.
	AI_Output(self,other, " DIA_Netbek_CalmYou_01_02 " );	// What do you mean by that?
	AI_Output(other,self, " DIA_Netbek_CalmYou_01_03 " );	// You act like nothing has happened in the past few days.
	AI_Output(self,other, " DIA_Netbek_CalmYou_01_05 " );	// My goddess teaches me this serenity.
	AI_Output(self,other, " DIA_Netbek_CalmYou_01_06 " );	// Her wisdom helps me to know the true meaning and understanding of various things in this world. 
	AI_Output(self,other, " DIA_Netbek_CalmYou_01_07 " );	// In addition, thanks to you, our main enemy has already been defeated. So, there is no reason for concern anymore.
	AI_Output(self,other, " DIA_Netbek_CalmYou_01_09 " );	// I'm sure you can handle the orcs too. Especially now that they have lost the help of the Guardians.
	AI_Output(other,self, " DIA_Netbek_CalmYou_01_11 " );	// I hope you're right.
};

instance DIA_NETBEK_DRUID(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_DRUID_condition;
	information = dia_netbek_DRUID_info;
	permanent = FALSE;
	description = " You're a druid, aren't you? " ;
};

func int dia_netbek_DRUID_condition()
{
	if((NetBekIsDruid == TRUE) && (XarDruid == TRUE) && (RootIsUp == FALSE))
	{
		return TRUE;
	};
};

func void dia_netbek_DRUID_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Netbek_DRUID_01_01 " );	// You're a druid, aren't you?
	AI_Output(self,other, " DIA_Netbek_DRUID_01_02 " );	// What does that word mean?
	AI_Output(other,self, " DIA_Netbek_DRUID_01_03 " );	// Well, you talk to the trees and use their magic power.
	AI_Output(other,self, " DIA_Netbek_DRUID_01_04 " );	// As far as I know, only druids can do that.
	AI_Output(self,other, " DIA_Netbek_DRUID_01_05 " );	// Well, if so, then you're right. I am a druid.
	AI_Output(other,self, " DIA_Netbek_DRUID_01_06 " );	// Then I need your help.
	AI_Output(self,other, " DIA_Netbek_DRUID_01_07 " );	// How can I help you?
	AI_Output(other,self, " DIA_Netbek_DRUID_01_08 " );	// I need to bring a tree back to life. And I'm afraid I can't do it without your help.
	AI_Output(self,other, " DIA_Netbek_DRUID_01_09 " );	// Of course, I will help you with this. Wait a minute...
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Output(self,other, " DIA_Netbek_DRUID_01_10 " );	// Here, take this root. With it, you will breathe new life into dead wood.
	B_GiveInvItems(self,other,ItPl_MagicRoot,1);
	AI_Output(other,self, " DIA_Netbek_DRUID_01_11 " );	// Is it that simple?
	AI_Output(self,other, " DIA_Netbek_DRUID_01_12 " );	// Do you want something more complicated? If so, then you better go to someone else.
	AI_Output(other,self, " DIA_Netbek_DRUID_01_13 " );	// No, simplicity suits me.
	AI_Output(self,other, " DIA_Netbek_DRUID_01_14 " );	// Then why all these questions?
	AI_Output(other,self, " DIA_Netbek_DRUID_01_15 " );	// Ah, never mind!
	B_LogEntry(TOPIC_AdanosCrone, " It turned out to be much easier. I asked Netback for help and he gave me a magical plant that can bring the great tree back to life. " );
	RootIsUp = TRUE;
};

instance DIA_NETBEK_DRUID_TEACH(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_DRUID_TEACH_condition;
	information = dia_netbek_DRUID_TEACH_info;
	permanent = FALSE;
	description = " Can you teach me how to make these stones? " ;
};

func int dia_netbek_DRUID_TEACH_condition()
{
	if((NETBEK_HALLO4 == TRUE) && ((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM) || (other.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void dia_netbek_DRUID_TEACH_info()
{
	AI_Output(other,self, " DIA_Netbek_DRUID_TEACH_01_01 " );	// Can you teach me how to make these stones?
	AI_Output(self,other, " DIA_Netbek_DRUID_TEACH_01_02 " );	// Hmmm... Certainly.
	AI_Output(self,other, " DIA_Netbek_DRUID_TEACH_01_03 " );	// However, you need some experience and knowledge of magic circles to master this knowledge.
	AI_Output(self,other, " DIA_Netbek_DRUID_TEACH_01_04 " );	// And, of course, a rune table to craft the stones.
	Netbek_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_NetbekTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_NetbekTeacher, " Netbek can teach me how to create transformation stones to transform into various animals. " );
};

instance DIA_Netbek_Runen (C_Info)
{
	npc = xbs_7507_netbek;
	nr = 99;
	condition = DIA_Netbek_Runen_Condition;
	information = DIA_Netbek_Runes_Info;
	permanent = TRUE;
	description = " Teach me how to make transformation stones. " ;
};

func int DIA_Netbek_Runes_Condition()
{
	if((Netbek_TeachRunes == TRUE) && (HeroKnownTrans_Troll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Netbek_Runes_Info()
{
	AI_Output(other,self, " DIA_Parlan_TEACH_15_00 " );	// Train me!
	Info_ClearChoices(DIA_Netbek_Runes);
	Info_AddChoice(DIA_Netbek_Runes,Dialog_Back,DIA_Netbek_Runes_BACK);

	if(HeroKnownTrans_BloodFly == FALSE)
	{
		Info_AddChoice(DIA_Netbek_Runen, " Transform into Blood Hornet (Training Points: 1) " ,DIA_Netbek_Runen_BloodFly);
	};
	if((HeroKnownTrans_FireWaran == FALSE) && (HeroKnownTrans_BloodFly == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen, " Fire Dragon Transformation (Training Points: 2) " ,DIA_Netbek_Runen_FireWaran);
	};
	if((HeroKnownTrans_Warg == FALSE) && (HeroKnownTrans_FireWaran == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen, " Transform into Warg (Training Points: 4) " ,DIA_Netbek_Runen_Warg);
	};
	if((HeroKnownTrans_ShadowBeast == FALSE) && (HeroKnownTrans_Warg == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen, " Mrakoris Transformation (Training Points: 6) " ,DIA_Netbek_Runen_ShadowBeast);
	};
	if((HeroKnownTrans_DragonSnapper == FALSE) && (HeroKnownTrans_ShadowBeast == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen, " Transform into Dragon Snapper (Training Points: 8) " ,DIA_Netbek_Runen_DragonSnapper);
	};
	//if((HeroKnownTrans_Troll == FALSE) && (HeroKnownTrans_DragonSnapper == TRUE))
	//{
	// 	Info_AddChoice(DIA_Netbek_Runen,"Troll Turn (Training Points: 10)",DIA_Netbek_Runen_Troll);
	//};
};

func void DIA_Netbek_Runes_BACK()
{
	Info_ClearChoices(DIA_Netbek_Runes);
};

func void DIA_Netbek_Runen_BloodFly()
{
	if(hero.lp < 1)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 1;
		RankPoints = RankPoints + 1;
		AI_Print( " Tutorial: Transformation Stones " );
		HeroKnownTrans_BloodFly = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher, " To craft the Blood Hornet Transformation Stone, you need: Runestone, Wings, Resin, and Aquamarine. " );

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};

	};
};

func void DIA_Netbek_Runen_FireWaran()
{
	if(hero.lp < 2)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		AI_Print( " Tutorial: Transformation Stones " );
		HeroKnownTrans_FireWaran = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher, " To craft a Fire Dragon Transformation Stone, you must have: Runestone, Fire Tongue, Brimstone, and Reptile Skin. " );

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
};

func void DIA_Netbek_Runen_Warg()
{
	if(hero.lp < 4)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		AI_Print( " Tutorial: Transformation Stones " );
		HeroKnownTrans_Warg = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher, " To craft a Warg Transformation Stone, you need a Runestone, two fangs, a Black Pearl, and a Warg Hide. " );

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
};

func void DIA_Netbek_Runen_ShadowBeast()
{
	if(hero.lp < 6)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		AI_Print( " Tutorial: Transformation Stones " );
		HeroKnownTrans_ShadowBeast = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher, " To craft the Obscurant Transformation Stone, you must have: Runestone, Coal, Antler, and Obscurant Hide. " );

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
};

func void DIA_Netbek_Runen_DragonSnapper()
{
	if(hero.lp < 8)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 8;
		RankPoints = RankPoints + 8;
		AI_Print( " Tutorial: Transformation Stones " );
		HeroKnownTrans_DragonSnapper = TRUE;
		Snd_Play("LevelUP");
		) ; _ _ _

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
};

func void DIA_Netbek_Runen_Troll()
{
	if(hero.lp < 10)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		AI_Print( " Tutorial: Transformation Stones " );
		HeroKnownTrans_Troll = TRUE;
		Snd_Play("LevelUP");
		; _ _ _ _


		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
};

instance DIA_Netbek_Trade(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 99;
	condition = DIA_Netbek_Trade_condition;
	information = DIA_Netbek_Trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = " Show me your magical scrolls. " ;
};

func int DIA_Netbek_Trade_condition()
{
	if((CHOOSESTONE == TRUE) && (other.guild != GIL_GUR))
	{
		if((other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM))
		{
			return TRUE;
		};
	};
};

func void DIA_Netbek_Trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_BaalTyon_Trade_01_01 " );	// Show me your magical scrolls.
	B_GiveTradeInv(self);
};
