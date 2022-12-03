

instance DIA_ADDON_INEXTREMO_CHARLOTTE_EXIT(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 999;
	condition = dia_addon_inextremo_charlotte_exit_condition;
	information = dia_addon_inextremo_charlotte_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_charlotte_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_charlotte_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_CHARLOTTE_PICKPOCKET(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 900;
	condition = dia_addon_inextremo_charlotte_pickpocket_condition;
	information = dia_addon_inextremo_charlotte_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int dia_addon_inextremo_charlotte_pickpocket_condition()
{
	return  C_Robbery ( 118 , 300 );
};

func void dia_addon_inextremo_charlotte_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_charlotte_pickpocket);
	Info_AddChoice(dia_addon_inextremo_charlotte_pickpocket,Dialog_Back,dia_addon_inextremo_charlotte_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_charlotte_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_charlotte_pickpocket_doit);
};

func void dia_addon_inextremo_charlotte_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 2;
		};
		B_GiveInvItems(self,other,ItMi_Gold,100);
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

func void dia_addon_inextremo_charlotte_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_charlotte_pickpocket);
};


instance DIA_ADDON_INEXTREMO_CHARLOTTE_HI(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_hi_condition;
	information = dia_addon_inextremo_charlotte_hi_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_inextremo_charlotte_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER5 == FALSE)
		{
			Snd_Play("LevelUp");
			hero.exp = hero.exp + 500;
			AI_NoticePrint(3000,4098,NAME_Addon_KillerBonus);
			KillerBonus = TRUE;
			AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Hi_01_00 " );	// Yes, yes. And who do we have here?
			AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Hi_01_01 " );	// Honestly, I'm glad you were able to handle Asmal. We all didn't like him very much.
			AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Hi_01_02 " );	// Well, if only Luther. Although, by and large, this guy does not care who is at the helm. (laughs)
			AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Hi_01_03 " );	// So congratulations! I think you'll make a good guild leader.
			AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Hi_01_04");	//Спасибо!
			KILLMEMBER5 = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Hi_01_05 " );	// What will please you this time?
		};
	}
	else  if (Wld_IsTime( 8 , 30 , 19 , 30 ))
	{
		if(IS_INEXTREMO_PLAYING_DONE == FALSE)
		{
			if((MIS_JESPERMUSIC == LOG_Running) && (MSINEXTREMO == FALSE))
			{
				Info_ClearChoices(dia_addon_inextremo_charlotte_hi);
				Info_AddChoice(dia_addon_inextremo_charlotte_hi, " Play something fun! (Cost: 100 coins) " ,dia_addon_inextremo_charlotte_hi_doit);
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_07");	//Отстань!
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_07");	//Отстань!
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,300);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_08");	//Отстань!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};

func void dia_addon_inextremo_charlotte_hi_back()
{
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_charlotte_hi_doit()
{
	var C_Npc MusHer;

	MusHer = Hlp_GetNpc(pir_1398_addon_inextremo_announcer);

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		B_TurnToNpc(self,MusHer);
		AI_Output(self,other, " dia_addon_inextremo_charlotte_hi_doit_01_00 " );	// (smiling) Of course. Hey guys! We've got an order... Something fun!
		B_TurnToNpc(self,hero);
		AI_Output(self,other, " dia_addon_inextremo_charlotte_hi_doit_01_01 " );	// Now everything will be...
		Npc_RemoveInvItems(other,ItMi_Gold,100);
		IS_INEXTREMO_PLAYING = TRUE;
		IS_INEXTREMO_PLAYING_DONE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " dia_addon_inextremo_charlotte_hi_doit_01_02 " );	// Where's the gold? If there is no gold, then there is no music.
		AI_StopProcessInfos(self);
	};
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_WhatNext(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_WhatNext_condition;
	information = dia_addon_inextremo_charlotte_WhatNext_info;
	permanent = FALSE;
	description = " What are we going to do next? " ;
};

func int dia_addon_inextremo_charlotte_WhatNext_condition()
{
	if((BEKILLMASTER == TRUE) && (KILLMEMBER5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_WhatNext_info()
{
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_01 " );	// What do we do next?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_02 " );	// I don't know. You are the boss here now.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_03 " );	// But if I were you, the first thing I would do is find a new secluded place for us.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_04 " );	// It's dangerous to stay here. There are a lot of wild creatures around, and we are here in full view.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_05 " );	// The hour is not even, someone will notice us - and then we will not do well.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_06 " );	// And what do you think this place should be?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_07 " );	// I don't know... Some cozy cave or house.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_08 " );	// In general, one where we would not fear for our lives.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_WhatNext_01_09 " );	// Okay, I'll try to find a warm nest for you.
	MIS_FindKillPlace = LOG_Running;
	Log_CreateTopic(TOPIC_FindKillPlace,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FindKillPlace,LOG_Running);
	B_LogEntry(TOPIC_FindKillPlace, " We need to find somewhere quiet and peaceful for the guys. It's too dangerous for them to stay here. " );
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_WhatNextTwo(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_WhatNextTwo_condition;
	information = dia_addon_inextremo_charlotte_WhatNextTwo_info;
	permanent = FALSE;
	description = " What else should I know? " ;
};

func int dia_addon_inextremo_charlotte_WhatNextTwo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_WhatNext) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_WhatNextTwo_info()
{
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_01 " );	// What else should I know?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_02 " );	// I think you should make sure the guys don't sit idle.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_03 " );	// Otherwise, from idleness, they begin to grow dull and angry.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_04 " );	// And this is not very good for our business.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_05 " );	// But I don't have time to do all that. Maybe you can help me with this?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_06 " );	// Well, if you trust me...
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_07 " );	// It's just that you seem the smartest of all of you.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_08 " );	// Then you can rely on me. I already know how to deal with these fools.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_09 " );	// Agreed. Just keep me posted on what's going on.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_10 " );	// Of course, don't worry.
	CharlotteMyAss = TRUE;
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_FindPlace(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_FindPlace_condition;
	information = dia_addon_inextremo_charlotte_FindPlace_info;
	permanent = FALSE;
	description = " I think I found the right place for you. " ;
};

func int dia_addon_inextremo_charlotte_FindPlace_condition()
{
	if((MIS_FindKillPlace == LOG_Running) && (FoundVinosKellerei == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_FindPlace_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_FindPlace_01_01 " );	// I think I found the right place for you.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_FindPlace_01_02 " );	// Which one exactly?
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_FindPlace_01_03 " );	// Not far from the circle of stones, if you go deep into the forest, there is a secluded cave.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_FindPlace_01_04 " );	// Hmmm...(thoughtfully) Yes, that would do just fine.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_FindPlace_01_05 " );	// Okay, I'll talk to the guys about her.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_FindPlace_01_06 " );	// If next time we won't be here, then we're already there.
	MIS_FindKillPlace = LOG_Success;
	KillersMoveInCave = TRUE;
	Log_SetTopicStatus(TOPIC_FindKillPlace,LOG_Success);
	B_LogEntry(TOPIC_FindKillPlace, " Charlotte liked the idea of ​​the cave. I think they'll all go there soon. " );
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Cave(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Cave_condition;
	information = dia_addon_inextremo_charlotte_Cave_info;
	permanent = FALSE;
	description = " How are things going? " ;
};

func int dia_addon_inextremo_charlotte_Cave_condition()
{
	if(MoveKillNewPlace == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Cave_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_Cave_01_01 " );	// How are things going?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Cave_01_02 " );	// All is well. It turned out to be even better here than it was before in the city.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_03");	//Правда?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Cave_01_04 " );	// I don't know what used to be in this cave, but there were large reserves of rice malt here.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Cave_01_05 " );	// And now Flail's been making schnapps out of him for days on end. And I sell it to merchants in the city.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Cave_01_06 " );	// In addition, I was able to agree with one farmer that we would look after his farm.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_Cave_01_07 " );	// In what way?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Cave_01_08 " );	// Well, you know, these are the times when all sorts of rabble and scum are around.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Cave_01_09 " );	// The city militia doesn't itch too much when things get in trouble.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Cave_01_10 " );	// And with our guys, you won't spoil too much! That's what he pays us.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_Cave_01_11 " );	// Does he pay you for protection?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Cave_01_12 " );	// (slyly) Something like that.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_Cave_01_13 " );	// Yes, you're doing well here.
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Perm(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Perm_condition;
	information = dia_addon_inextremo_charlotte_Perm_info;
	permanent = TRUE;
	description = " Is everything quiet? " ;
};

func int dia_addon_inextremo_charlotte_Perm_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_Cave) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Perm_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Perm_01_01");	//Все тихо?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Perm_01_02 " );	// Yes, you can't imagine better.
};

var int MyGuildMoney;
var int FirstKillPay;

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Navar(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Navar_condition;
	information = dia_addon_inextremo_charlotte_Navar_info;
	permanent = FALSE;
	description = " Will I get anything out of this? " ;
};

func int dia_addon_inextremo_charlotte_Navar_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_Cave) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Navar_info()
{
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_Navar_01_01 " );	// Will I get anything out of this?
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Navar_01_02 " );	// Of course. You are our boss! And it was you who found this cave for us.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Navar_01_03 " );	// You can come here once a week. Your share will be waiting for you right here.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_Navar_01_04 " );	// That's it!
	MyGuildMoney = TRUE;
};

instance dia_addon_inextremo_charlotte_PERMJOBPAY(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 51;
	condition = dia_addon_inextremo_charlotte_permjobpay_condition;
	information = dia_addon_inextremo_charlotte_permjobpay_info;
	permanent = TRUE;
	description = " How about my share? " ;
};

func int dia_addon_inextremo_charlotte_permjobpay_condition()
{
	if(MyGuildMoney == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_permjobpay_info()
{
	where int daynow;
	var int link;

	daynow = Wld_GetDay();

	AI_Output(other,self, " DIA_Сharlotte_PermJobPay_01_00 " );	// How about my share?

	if((KILLPAYDAY <= (daynow - 7)) || (FirstKillPay == FALSE))
	{
		AI_Output(self,other, " DIA_Сharlotte_PermJobPay_01_01 " );	// Of course! Here, take her.
		link = Hlp_Random( 300 ) +  200 ;
		B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		KILLPAYDAY = Wld_GetDay();
		FirstKillPay = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Сharlotte_PermJobPay_01_03 " );	// But you already got your share! Now we have to wait a bit.
		AI_Output(other,self, " DIA_Сharlotte_PermJobPay_01_04 " );	// Oh yeah, I forgot.
	};
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Siege(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Siege_condition;
	information = dia_addon_inextremo_charlotte_Siege_info;
	permanent = FALSE;
	description = " Horinis captured orc. " ;
};

func int dia_addon_inextremo_charlotte_Siege_condition()
{
	if ( KAPITELORCATC  ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Siege_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_Siege_01_01 " );	// Orcs have captured Khorinis.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Siege_01_02 " );	// We know about it. So it's better for us to stay here in this cave for now.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Siege_01_03 " );	// Orcs are unlikely to come here.
	AI_Output(other,self, " DIA_Addon_InExtremo_Charlotte_Siege_01_04 " );	// But be ready. At any moment I may need your help.
	AI_Output(self,other, " DIA_Addon_InExtremo_Charlotte_Siege_01_05 " );	// Of course.
};
