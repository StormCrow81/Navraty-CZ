
const int VALUE_ALFREDSHEEPFUR = 5;
const int VALUE_ALFREDKEILERFUR = 7;
const int VALUE_ALFREDWOLFFUR = 7;
const int VALUE_ALFREDLURKERSKIN = 10;
const int VALUE_ALFREDWARGFUR = 30;
const int VALUE_ALFREDSHARKSKIN = 40;
const int VALUE_ALFREDSHADOWFUR = 70;
const int VALUE_ALFREDPUMAFUR = 100;
const int VALUE_ALFREDICEPUMAFUR = 125;
const int VALUE_ALFREDTROLLFUR = 125;
const int VALUE_ALFREDTROLLBLACKFUR = 250;
const int VALUE_ALFREDTEETH = 10;
const int VALUE_ALFREDTROLLTOOTH = 150;
const int VALUE_ALFREDCLAW = 8;
const int VALUE_ALFREDLURKERCLAW = 10;
const int VALUE_ALFREDDRGHORN = 75;
const int VALUE_ALFREDSHADOWHORN = 120;
const int VALUE_ALFREDSHARKTEETH = 60;
const int VALUE_ALFREDDESERTSHARKTEETH = 100;


instance DIA_HUN_742_ALFRED_EXIT(C_Info)
{
	npc = hun_742_alfred;
	nr = 999;
	condition = dia_hun_742_alfred_exit_condition;
	information = dia_hun_742_alfred_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_742_alfred_exit_condition()
{
	return TRUE;
};

func void dia_hun_742_alfred_exit_info()
{
	AI_StopProcessInfos(self);
};


var int alfredhellofirsttime;

instance DIA_HUN_742_ALFRED_FIRSTHI(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_firsthi_condition;
	information = dia_hun_742_alfred_firsthi_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_hun_742_alfred_firsthi_condition()
{
	if (chapter <=  5 )
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_firsthi_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(other,self, " DIA_HUN_742_FirstHi_01_00 " );	// How are you?
		if(ALFREDHELLOFIRSTTIME == FALSE)
		{
			AI_Output(self,other, " DIA_HUN_742_FirstHi_01_01 " );	// Yes, everything seems to be fine. Although lately it has become a little dangerous to hunt in the northern forests.
			AI_Output(other,self, " DIA_HUN_742_FirstHi_01_02 " );	// What's dangerous there?
			AI_Output(self,other, " DIA_HUN_742_FirstHi_01_03 " );	// Dragomir says he was attacked by skeletons there. Where they came from, I have no idea.
			AI_Output(self,other, " DIA_HUN_742_FirstHi_01_04 " );	// There, except for scavengers, there was no one at all. And here...
			if(HEROISHUNTER == FALSE)
			{
				AI_Output(other,self, " DIA_HUN_742_FirstHi_01_05 " );	// Got it. And what is this place?
				AI_Output(self,other, " DIA_HUN_742_FirstHi_01_06 " );	// This place is a hunter's camp!
				AI_Output(self,other, " DIA_HUN_742_FirstHi_01_07 " );	// If you want to join us, talk to Falk. He's in charge here.
				AI_Output(self,other, " DIA_HUN_742_FirstHi_01_08 " );	// I think we could use another hunter.
			};
			ALFREDHELLOFIRSTTIME = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_HUN_742_FirstHi_01_09 " );	// Yes, everything seems fine, buddy.
		};
	}
	else
	{
		AI_Output(other,self, " DIA_HUN_742_FirstHi_01_10 " );	// Hey, how are you?
		AI_Output(self,other, " DIA_HUN_742_FirstHi_01_11 " );	// none of your business!
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_742_ALFRED_HELLO(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_hello_condition;
	information = dia_hun_742_alfred_hello_info;
	permanent = FALSE;
	description = " What are you doing? " ;
};


func int dia_hun_742_alfred_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_hello_info()
{
	AI_Output(other,self, " DIA_HUN_742_Hello_01_00 " );	// What are you doing?
	AI_Output(self,other, " DIA_HUN_742_Hello_01_01 " );	// I'm a hunter. I live by selling fangs and skins.
	AI_Output(other, self, " DIA_HUN_742_Hello_01_02 " );	// Do they pay well for this?
	AI_Output(self,other, " DIA_HUN_742_Hello_01_03 " );	// If you do everything right, you can break a good jackpot. The main thing is to learn how to cut prey.
	AI_Output(self,other, " DIA_HUN_742_Hello_01_04 " );	// I can teach you this too. If you want, of course.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry( TOPIC_HUNTERTEACHERS , " Alfred can teach me how to butcher loot. " );
};


instance DIA_HUN_742_ALFRED_NEWS(C_Info)
{
	npc = hun_742_alfred;
	nr = 2;
	condition = dia_hun_742_alfred_news_condition;
	information = dia_hun_742_alfred_news_info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int dia_hun_742_alfred_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_news_info()
{
	AI_Output(other,self, " DIA_HUN_742_News_01_00 " );	// What's new?
	if ((Capital >=  1 ) && ( MIS_INSWOLFHIDE  ==  FALSE )) .
	{
		AI_Output(self,other, " DIA_HUN_742_News_01_01 " );	// A large pack of wolves has appeared in the forest, not far from the 'Dead Harpy' tavern.
		AI_Output(self,other, " DIA_HUN_742_News_01_02 " );	// Until recently, everything seemed to be normal - she did not give the locals much trouble.
		AI_Output(self,other, " DIA_HUN_742_News_01_03 " );	// But a couple of days ago, those wolves ate a man to death.
		AI_Output(self,other, " DIA_HUN_742_News_01_04 " );	// The poor fellow, apparently, had the imprudence to go too far into the forest.
		AI_Output(other,self, " DIA_HUN_742_News_01_05 " );	// Did you tell Falk about this?
		AI_Output(self,other, " DIA_HUN_742_News_01_06 " );	// Yes, he knows. Moreover, Dragomir and I even went to that forest to kill these creatures.
		AI_Output(self,other, " DIA_HUN_742_News_01_07 " );	// But, unfortunately, we never managed to track them down.
		AI_Output(self,other, " DIA_HUN_742_News_01_08 " );	// It looks like these beasts are very cunning, and it won't be easy to catch them!
		AI_Output(other,self, " DIA_HUN_742_News_01_09 " );	// And now what?
		AI_Output(self,other, " DIA_HUN_742_News_01_10 " );	// We're going to hunt this pack again soon.
		AI_Output(self,other, " DIA_HUN_742_News_01_11 " );	// In the meantime, let's hope no one else gets hurt.
		AI_Output(other,self, " DIA_HUN_742_News_01_12 " );	// Got it.
		MIS_INSWOLFHIDE = LOG_Running;
		Log_CreateTopic(TOPIC_INSWOLFHIDE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSWOLFHIDE,LOG_Running);
		B_LogEntry( TOPIC_INSWOLFHIDE , " Alfred informed me that a pack of angry wolves had appeared near the Dead Harpy tavern. Several hunters tried to hunt down and destroy this pack, but their search was unsuccessful. " );
		Wld_InsertNpc(hunt_wolf_01,"FP_ROAM_NW_HUNTWOLF_01");
		Wld_InsertNpc(hunt_wolf_02,"FP_ROAM_NW_HUNTWOLF_02");
		Wld_InsertNpc(hunt_wolf_03,"FP_ROAM_NW_HUNTWOLF_03");
		Wld_InsertNpc(hunt_wolf_04,"FP_ROAM_NW_HUNTWOLF_04");
	}
	else  if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_HUN_742_News_01_13 " );	// There have been too many bandits in this area lately.
		AI_Output(self,other, " DIA_HUN_742_News_01_14 " );	// That's why you always run the risk of running into a couple of those bastards when you leave the camp!
	}
	else  if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_HUN_742_News_01_15 " );	// No news yet.
		AI_Output(self,other, " DIA_HUN_742_News_01_16 " );	// Although, maybe it's even for the best.
	}
	else  if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_HUN_742_News_01_17 " );	// Strange things have been going on here lately - strange people in black robes have appeared in the district.
		AI_Output(self,other, " DIA_HUN_742_News_01_18 " );	// I wonder what they want here?!
	}
	else  if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_HUN_742_News_01_19 " );	// Rumor has it that a small group of mercenaries went to the Valley of Mines. Imagine the guys want to hunt dragons!
		AI_Output(self,other, " DIA_HUN_742_News_01_20 " );	// I wonder what will come out of this venture of theirs?
	}
	else  if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_HUN_742_News_01_21 " );	// Rumor has it that someone killed all the dragons in the Valley of Mines. Can you imagine?
		AI_Output(self,other, " DIA_HUN_742_News_01_22 " );	// I couldn't even think what a human could do.
	}
	else  if (chapter ==  6 )
	{
		AI_Output(self,other, " DIA_HUN_742_News_01_23 " );	// It doesn't get worse - you won't even show your nose from the camp! All roads are blocked by orc patrols.
		AI_Output(self,other, " DIA_HUN_742_News_01_24 " );	// If things continue like this, we'll all be finished soon!
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_742_News_01_25");	//Ничего.
	};
};


instance DIA_HUN_742_ALFRED_INSWOLFHIDE (C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_inswolfhide_condition;
	information = dia_hun_742_alfred_inswolfhide_info;
	permanent = FALSE;
	description = " I've dealt with a pack of wolves. " ;
};


func int dia_hun_742_alfred_inswolfhide_condition()
{
	if (( MIS_INSWOLFHIDE  == LOG_Running) && Npc_IsDead(hunt_wolf_01) && Npc_IsDead(hunt_wolf_02) && Npc_IsDead(hunt_wolf_03) && Npc_IsDead(hunt_wolf_04))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_inswolfhide_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_742_InsWolfHide_01_00 " );	// I dealt with a pack of wolves.
	AI_Output(self,other, " DIA_HUN_742_InsWolfHide_01_01 " );	// Really? Quite good!
	AI_Output(self,other, " DIA_HUN_742_InsWolfHide_01_02 " );	// Though it was very risky of you to hunt an entire pack alone.
	AI_Output(self,other, " DIA_HUN_742_InsWolfHide_01_05 " );	// Okay. In that case, let me thank you for what you've done.
	AI_Output(self,other, " DIA_HUN_742_InsWolfHide_01_06 " );	// Here, take these three mrakoris horns as your reward.
	B_GiveInvItems(self,other,ItAt_ShadowHorn,3);
	AI_Output(other,self, " DIA_HUN_742_InsWolfHide_01_07 " );	// Thank you!
	MIS_INSWOLFHIDE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSWOLFHIDE,LOG_SUCCESS);
	B_LogEntry( TOPIC_INSWOLFHIDE , " Alfred thanked me for slaying a pack of slayer wolves and gave me three horns of the gloom as a reward. " );
};


instance DIA_HUN_742_ALFRED_RESPECT(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_respect_condition;
	information = dia_hun_742_alfred_respect_info;
	permanent = FALSE;
	description = " I want to challenge Falk! " ;
};


func int dia_hun_742_alfred_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( ALFRED_RESPECT  ==  FALSE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_respect_info()
{
	AI_Output(other,self, " DIA_HUN_742_Respect_01_00 " );	// I want to challenge Falk!
	AI_Output(self,other, " DIA_HUN_742_Respect_01_01 " );	// True? Very brave of you.
	AI_Output(self,other, " DIA_HUN_742_Respect_01_02 " );	// Falk is one of the best hunters I've ever met.
	AI_Output(self,other, " DIA_HUN_742_Respect_01_03 " );	// So I don't think you'll have much chance of beating him.
	AI_Output(other,self, " DIA_HUN_742_Respect_01_04 " );	// But I'll still try to do it.
	AI_Output(other,self, " DIA_HUN_742_Respect_01_05 " );	// However, first I need to enlist the support of most of the hunters in this camp, gaining their respect for me.
	AI_Output(self,other, " DIA_HUN_742_Respect_01_06 " );	// And, apparently, you want to ask my opinion on this matter. Right?
	AI_Output(other,self, " DIA_HUN_742_Respect_01_07 " );	// Yes. It would be nice to know what you think.
	if(MIS_INSWOLFHIDE == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_742_Respect_01_08 " );	// Hmmm... Well, as far as I'm concerned, you deserve it.
		AI_Output(self,other, " DIA_HUN_742_Respect_01_09 " );	// The fact that you single-handedly dealt with a whole pack of killer wolves already says a lot.
		AI_Output(other,self, " DIA_HUN_742_Respect_01_10 " );	// So I can count on your vote?
		AI_Output(self,other, " DIA_HUN_742_Respect_01_11 " );	// You can. Although it is unlikely that he will help you in a duel with Falk.
		AI_Output(self,other, " DIA_HUN_742_Respect_01_12 " );	// But I still want to wish you good luck.
		B_LogEntry( TOPIC_HUNTERSWORK , " Alfred thinks I'm a good hunter and worthy of his respect. He will support me if I decide to challenge Falk. " );
		ALFRED_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_742_Respect_01_15 " );	// Sorry man. But I still don't see any reason why I should cast my vote for you.
		AI_Output(self,other, " DIA_HUN_742_Respect_01_17 " );	// You haven't proven yourself in this camp yet.
		AI_Output(self,other, " DIA_HUN_742_Respect_01_18 " );	// Understand that a couple of easy assignments does not make you a good hunter, much less make others treat you with respect.
	};
};


instance DIA_HUN_742_ALFRED_RESPECTDONE(C_Info)
{
	npc = hun_742_alfred;
	nr = 4;
	condition = dia_hun_742_alfred_respectdone_condition;
	information = dia_hun_742_alfred_respectdone_info;
	permanent = TRUE;
	description = " How about your consent now? " ;
};


func int dia_hun_742_alfred_respectdone_condition()
{
	if ( Npc_KnowsInfo ( other , dia_hun_742_alfred_respect ) && ( CANHUNTERCHALLANGE  ==  TRUE ) && ( ALFRED_RESPECT  ==  FALSE ) && ( MIS_HUNTERCHALLANGE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_respectdone_info()
{
	AI_Output(other,self, " DIA_HUN_742_RespectDone_01_00 " );	// How about your consent now?
	if(MIS_INSWOLFHIDE == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_742_RespectDone_01_01 " );	// Hmmm... Well, as far as I'm concerned, you deserve it.
		AI_Output(self,other, " DIA_HUN_742_RespectDone_01_02 " );	// The fact that you single-handedly dealt with a whole pack of killer wolves already says a lot.
		AI_Output(other,self, " DIA_HUN_742_RespectDone_01_03 " );	// So I can count on your vote?
		AI_Output(self,other, " DIA_HUN_742_RespectDone_01_04 " );	// You can. Although it is unlikely that he will help you in a duel with Falk.
		AI_Output(self,other, " DIA_HUN_742_RespectDone_01_05 " );	// But I still want to wish you good luck.
		B_LogEntry( TOPIC_HUNTERSWORK , " Alfred thinks I'm a good hunter and worthy of his respect. He will support me if I decide to challenge Falk. " );
		ALFRED_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_742_RespectDone_01_08 " );	// You know my opinion, and it hasn't changed about you yet.
	};
};


instance DIA_HUN_742_ALFRED_TEACHHUNTING(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_teachhunting_condition;
	information = dia_hun_742_alfred_teachhunting_info;
	permanent = TRUE;
	description = " I want to learn how to carve loot. " ;
};


func int dia_hun_742_alfred_teachhunting_condition()
{
	if ( Npc_KnowsInfo ( other , dia_hun_742_alfred_hello ) && ( ALFREDTEACHALL  ==  FALSE )) .
	{
		return TRUE;
	};
};


var int dia_hun_742_alfred_teachhunting_onetime;

func void dia_hun_742_alfred_teachhunting_info()
{
	AI_Output(other,self, " DIA_HUN_742_TeachHunting_01_00 " );	// I want to learn how to butcher prey.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE))
	{
		if(DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == FALSE)
		{
			AI_Output(self,other, " DIA_HUN_742_TeachHunting_01_01 " );	// If you know how, then you can skin a dead creature, pick up fangs and claws. It's not easy, but such trophies are highly valued.
			AI_Output(self,other, " DIA_HUN_742_TeachHunting_01_02 " );	// Any merchant will gladly buy them from you.
			DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_HUN_742_TeachHunting_01_03 " );	// If I were you, I would try to learn everything as quickly as possible.
		};
		Info_ClearChoices(dia_hun_742_alfred_teachhunting);
		Info_AddChoice(dia_hun_742_alfred_teachhunting,Dialog_Back,dia_hun_742_alfred_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Ломать когти",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),dia_hun_742_alfred_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Сдирать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),dia_hun_742_alfred_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Вырывать клыки",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),dia_hun_742_alfred_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{
			Info_AddChoice(dia_hun_742_alfred_teachhunting,b_buildlearnstringforsmithhunt("Сдирать кожу рептилий",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin)),dia_hun_742_alfred_teachhunting_reptileskin);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_01_04 " );	// Well, I've told everything I knew.
		ALFREDTEACHALL = TRUE;
	};
};

func void dia_hun_742_alfred_teachhunting_back()
{
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(other,self, " DIA_HUN_742_TeachHunting_Claws_01_00 " );	// How are claws obtained?
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_Claws_01_01 " );	// It's actually very easy - if you know what to do and how to do it. You just need to bend the claw forward - just not back, and do not try to pull it out!
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_Claws_01_02 " );	// Of course, not all claws are used. Most often we get them from lizards.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(other,self, " DIA_HUN_742_TeachHunting_Fur_01_00 " );	// How to skin?
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_Fur_01_01 " );	// You should start from the back of the carcass, moving towards the head. The main thing is to pick it up, then everything will be easy. Fur is very expensive.
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_Fur_01_02 " );	// Clothes are made from the skin of a wolf or mrakoris. Looking closely at the fur, you will understand whether it is suitable for something or not.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(other,self, " DIA_HUN_742_TeachHunting_Teeth_01_00 " );	// How are fangs obtained?
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_Teeth_01_01 " );	// The main thing is not to break them. Place the knife approximately in the middle of the tooth, at the very base and, like a lever, pick it out.
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_Teeth_01_02 " );	// Wolves, snappers, and obscurantists have fangs.
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};

func void dia_hun_742_alfred_teachhunting_reptileskin()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
	{
		AI_Output(other,self, " DIA_HUN_742_TeachHunting_ReptileSkin_01_00 " );	// What if I want to skin a reptile?
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_ReptileSkin_01_01 " );	// Only shnygi and swamps are suitable for this purpose.
		AI_Output(self,other, " DIA_HUN_742_TeachHunting_ReptileSkin_01_02 " );	// You need to cut the skin around the edges, and then it will peel off by itself. That's all science.	
	};
	Info_ClearChoices(dia_hun_742_alfred_teachhunting);
};


instance DIA_HUN_742_ALFRED_TEACHHUNTING_PRETTYMUCH(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_teachhunting_prettymuch_condition;
	information = dia_hun_742_alfred_teachhunting_prettymuch_info;
	permanent = FALSE;
	description = " Your advice is not cheap. " ;
};


func int dia_hun_742_alfred_teachhunting_prettymuch_condition()
{
	if(DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_teachhunting_prettymuch_info()
{
	AI_Output(other,self, " DIA_HUN_742_TeachHunting_PrettyMuch_01_00 " );	// Your advice isn't cheap.
	AI_Output(self,other, " DIA_HUN_742_TeachHunting_PrettyMuch_01_01 " );	// Everything here has a price.
	AI_Output(self,other, " DIA_HUN_742_TeachHunting_PrettyMuch_01_02 " );	// The carcass of a beast that you don't know how to carve will simply rot without use.
	AI_Output(self,other, " DIA_HUN_742_TeachHunting_PrettyMuch_01_03 " );	// And you will lose the opportunity to sell his skin for a high price. It turns out that you risked in vain.
};


instance DIA_HUN_742_ALFRED_DRGSNPHORN(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_drgsnphorn_condition;
	information = dia_hun_742_alfred_drgsnphorn_info;
	permanent = FALSE;
	description = " Do you have a problem? " ;
};


func int dia_hun_742_alfred_drgsnphorn_condition()
{
	if ((Capital >=  2 ) && ( HEROISHUNTER  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_drgsnphorn_info()
{
	AI_Output(other,self, " DIA_HUN_742_DrgSnpHorn_01_00 " );	// Do you have a problem? You look a little puzzled.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_01 " );	// Yes, there is a small problem. Falk gave me an order: get the horn of the dragon snapper.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_02 " );	// Have you ever met these critters?
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_03 " );	// Very cute creatures. They'll bite your head off faster than you realize it.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_04 " );	// For a lone hunter, even one beast can be very difficult to handle.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_05 " );	// Not to mention, these creatures never hunt alone!
	AI_Output(other,self, " DIA_HUN_742_DrgSnpHorn_01_06 " );	// Are you afraid of them?
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_07 " );	// Kid, if I was afraid, I wouldn't be a hunter! It's not about that.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_09 " );	// It's just that these animals are almost impossible to meet in this part of the island.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_10 " );	// They mostly live in the Valley of Mines. And there, if you do not know, everything is teeming with orcs!
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_11 " );	// I'm not suicidal, and I don't want to end up in the cauldron of these green-skinned creatures in the form of grub.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_12 " );	// So I'm scratching my head, how can I fulfill this order?
	AI_Output(other,self, " DIA_HUN_742_DrgSnpHorn_01_13 " );	// Maybe I can help you on this dangerous hunt?
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_15 " );	// True? It will be very kind of you.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_16 " );	// If you can really bring me this horn, then I promise you - we will share the reward equally. Is it coming?
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHorn_01_18 " );	// Come back when you have this horn.
	MIS_DRGSNPHORN = LOG_Running;
	Log_CreateTopic(TOPIC_DRGSNPHORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRGSNPHORN,LOG_Running);
	B_LogEntry( TOPIC_DRGSNPHORN , " Hunter Alfred needs the horn of a dragon snapper. He also warned me that these creatures are dangerous as hell and I need to be careful with them. " );
};


instance DIA_HUN_742_ALFRED_DRGSNPHORNDONE(C_Info)
{
	npc = hun_742_alfred;
	nr = 1;
	condition = dia_hun_742_alfred_drgsnphorndone_condition;
	information = dia_hun_742_alfred_drgsnphorndone_info;
	permanent = FALSE;
	description = " I got you a dragon snapper horn. " ;
};


func int dia_hun_742_alfred_drgsnphorndone_condition()
{
	if((MIS_DRGSNPHORN == LOG_Running) && (Npc_HasItems(other,ItAt_DrgSnapperHorn) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_drgsnphorndone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_742_DrgSnpHornDone_01_00 " );	// I got you a dragon snapper horn. As you requested.
	B_GiveInvItems(other,self,ItAt_DrgSnapperHorn,1);
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHornDone_01_01 " );	// Wow! Where did you get it? Yes, man - apparently, you are cool if you could fill up such a monster!
	AI_Output(other,self, " DIA_HUN_742_DrgSnpHornDone_01_02 " );	// I had to sweat a little - this creature really turned out to be very strong!
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHornDone_01_03 " );	// Okay. Now you can relax and get your reward.
	AI_Output(self,other, " DIA_HUN_742_DrgSnpHornDone_01_04 " );	// Here, as I promised - your share!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(other,self,"DIA_HUN_742_DrgSnpHornDone_01_05");	//Спасибо!
	MIS_DRGSNPHORN = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DRGSNPHORN,LOG_SUCCESS);
	B_LogEntry( TOPIC_DRGSNPHORN , " I got Alfred a dragon snapper horn. " );
};


instance DIA_HUN_742_ALFRED_PICKPOCKET(C_Info)
{
	npc = hun_742_alfred;
	nr = 900;
	condition = dia_hun_742_alfred_pickpocket_condition;
	information = dia_hun_742_alfred_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_742_alfred_pickpocket_condition()
{
	return  C_Robbery ( 75 , 150 );
};

func void dia_hun_742_alfred_pickpocket_info()
{
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
	Info_AddChoice(dia_hun_742_alfred_pickpocket,Dialog_Back,dia_hun_742_alfred_pickpocket_back);
	Info_AddChoice(dia_hun_742_alfred_pickpocket,DIALOG_PICKPOCKET,dia_hun_742_alfred_pickpocket_doit);
};

func void dia_hun_742_alfred_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
};

func void dia_hun_742_alfred_pickpocket_back()
{
	Info_ClearChoices(dia_hun_742_alfred_pickpocket);
};


instance DIA_HUN_742_ALFRED_TROPHYEXPLAIN(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_trophyexplain_condition;
	information = dia_hun_742_alfred_trophyexplain_info;
	permanent = FALSE;
	description = " Why are hunting trophies so highly prized? " ;
};


func int dia_hun_742_alfred_trophyexplain_condition()
{
	if((DIA_HUN_742_ALFRED_TEACHHUNTING_ONETIME == TRUE) || (MIS_DRGSNPHORN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hun_742_alfred_trophyexplain_info()
{
	AI_Output(other,self, " DIA_HUN_742_TrophyExplain_01_00 " );	// Why are hunting trophies so highly valued?
	AI_Output(self,other, " DIA_HUN_742_TrophyExplain_01_01 " );	// For various reasons.
	AI_Output(self,other, " DIA_HUN_742_TrophyExplain_01_02 " );	// Mainly, of course, because they can be used as running materials to create other things.
	AI_Output(self,other, " DIA_HUN_742_TrophyExplain_01_03 " );	// Clothes, jewelry, armor and other household items - you can find a use for them in everything!
	AI_Output(self,other, " DIA_HUN_742_TrophyExplain_01_04 " );	// Well, some people just like to collect them. Although this already applies only to very rare trophies.
	AI_Output(self,other, " DIA_HUN_742_TrophyExplain_01_05 " );	// By the way, if you happen to have a couple of things lying around that you don't need, I could happily buy them from you.
	AI_Output(self,other, " DIA_HUN_742_TrophyExplain_01_06 " );	// Naturally, I don't take everything. I'm only interested in skins, fangs and claws.
	AI_Output(self,other, " DIA_HUN_742_TrophyExplain_01_07 " );	// If you don't need them, bring them here.
	AI_Output(self,other, " DIA_HUN_742_TrophyExplain_01_08 " );	// Don't worry about the price! More expensive than me, no one will buy them from you anyway.
	Log_CreateTopic(TOPIC_HUNTERTRADES,LOG_NOTE);
	B_LogEntry( TOPIC_HUNTERTRADES , " Alfred buys skins, fangs and claws from slaughtered animals. " );
	ALFREDCANBUY = TRUE;
};


instance DIA_HUN_742_ALFRED_TROPHYSELL(C_Info)
{
	npc = hun_742_alfred;
	nr = 5;
	condition = dia_hun_742_alfred_trophysell_condition;
	information = dia_hun_742_alfred_trophysell_info;
	permanent = TRUE;
	description = " I have some trophies for you. " ;
};


func int dia_hun_742_alfred_trophysell_condition()
{
	if(ALFREDCANBUY == TRUE)
	{
		if((Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkTeeth) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_ShadowHorn) > 0) || (Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_Teeth) > 0) || (Npc_HasItems(other,ItAt_TrollTooth) > 0))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItAt_Claw) > 0) || (Npc_HasItems(other,ItAt_LurkerClaw) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_hun_742_alfred_trophysell_info()
{
	AI_Output(other,self, " DIA_HUN_742_TrophySell_01_00 " );	// I have some trophies for you.
	AI_Output(self,other, " DIA_HUN_742_TrophySell_01_01 " );	// Great! Then let's look at them.
	Info_ClearChoices(dia_hun_742_alfred_trophysell);
	Info_AddChoice(dia_hun_742_alfred_trophysell,Dialog_Back,dia_hun_742_alfred_trophysell_back);
	if((Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell, " Give away all skins. " ,dia_hun_742_alfred_trophysell_fur);
	};
	if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell, " Give all reptile skins. " ,dia_hun_742_alfred_trophysell_skin);
	};
	if((Npc_HasItems(other,ItAt_ShadowHorn) > 0) || (Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell, " Give all the horns. " ,dia_hun_742_alfred_trophysell_horn);
	};
	if((Npc_HasItems(other,ItAt_Teeth) > 0) || (Npc_HasItems(other,ItAt_TrollTooth) > 0) || (Npc_HasItems(other,ItAt_DesertSharkTeeth) > 0) || (Npc_HasItems(other,ItAt_SharkTeeth) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell, " Give away all fangs and teeth. " ,dia_hun_742_alfred_trophysell_teeth);
	};
	if((Npc_HasItems(other,ItAt_Claw) > 0) || (Npc_HasItems(other,ItAt_LurkerClaw) > 0))
	{
		Info_AddChoice(dia_hun_742_alfred_trophysell, " Give all claws. " ,dia_hun_742_alfred_trophysell_claw);
	};
};

func void dia_hun_742_alfred_trophysell_back()
{
	Info_ClearChoices(dia_hun_742_alfred_trophysell);
};

func void dia_hun_742_alfred_trophysell_fur()
{
	var int counttradefur;
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_SheepFur) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_00 " );	// (surprised) Sheepskins?
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_01 " );	// Man, I thought you had something more serious for me.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_03 " );	// Okay, so be it - I'll take it!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_04 " );	// Maybe good for something.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SheepFur) * VALUE_ALFREDSHEEPFUR);
		Npc_RemoveInvItems(other,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
	};
	if(Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_05 " );	// Yeah. Several boar skins. Quite good!

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Addon_KeilerFur) *  VALUE_ALFREDKEILERFUR );
		Npc_RemoveInvItems(other,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0))
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_07 " );	// Hmmm. More wolf skins.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WolfFur) * VALUE_ALFREDWOLFFUR) + (Npc_HasItems(other,ItAt_IceWolfFur) * VALUE_ALFREDWOLFFUR);
		Npc_RemoveInvItems(other,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
		Npc_RemoveInvItems(other,ItAt_IceWolfFur,Npc_HasItems(other,ItAt_IceWolfFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0))
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_11 " );	// Warg skins! Hmmm. These are very dangerous animals!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_13 " );	// I wouldn't risk my life that much.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WargFur) * VALUE_ALFREDWARGFUR) + (Npc_HasItems(other,ItAt_OrcDogFur) * VALUE_ALFREDWARGFUR);
		Npc_RemoveInvItems(other,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
		Npc_RemoveInvItems(other,ItAt_OrcDogFur,Npc_HasItems(other,ItAt_OrcDogFur));
		counttradefur = counttradefur + 1;
	};
	if((Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,ItAt_WhitePuma) > 0))
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_15 " );	// Wow, cougar skin! Quite a rare item.
		AllCountGold = AllCountGold + (Npc_HasItems(other,itat_pumafur) * VALUE_ALFREDPUMAFUR);
		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_WhitePuma) * VALUE_ALFREDICEPUMAFUR);
		Npc_RemoveInvItems(other,itat_pumafur,Npc_HasItems(other,itat_pumafur));
		Npc_RemoveInvItems(other,ItAt_WhitePuma,Npc_HasItems(other,ItAt_WhitePuma));
		counttradefur = counttradefur + 1;
	};
	if(Npc_HasItems(other,ItAt_ShadowFur) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_17 " );	// Ha! Yes, this is the skin of the mrakoris! Who would have thought.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_20 " );	// This fur is worth a lot of money, so I'll take everything from you.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_ShadowFur) * VALUE_ALFREDSHADOWFUR);
		Npc_RemoveInvItems(other,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		counttradefur = counttradefur + 1;
	};
	if(Npc_HasItems(other,ItAt_TrollFur) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_21 " );	// Can't be! I can't believe my eyes!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_22 " );	// It's a real troll skin!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_24 " );	// Hunting them is a very dangerous activity.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_25 " );	// But even for one such trophy, you'll earn a lot of money!

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollFur) * VALUE_ALFREDTROLLFUR);
		Npc_RemoveInvItems(other,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
		counttradefur = counttradefur + 2;
	};
	if(Npc_HasItems(other,ItAt_TrollBlackFur) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_26 " );	// Incredible! You have the skin of a black troll!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_28 " );	// This is the most valuable trophy that can be obtained by hunting.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_29 " );	// Yes, boy, you never cease to amaze me!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_31 " );	// Any merchant will tear such a little thing from you with his hands.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollBlackFur) * VALUE_ALFREDTROLLBLACKFUR);
		Npc_RemoveInvItems(other,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
		counttradefur = counttradefur + 3;
	};

	AI_Output(other,self, " DIA_HUN_742_TrophySell_Fur_01_33 " );	// This is all I have.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};

	if(counttradefur > 5)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_34 " );	// Well, that's enough anyway. I have not had such a large batch of skins for a long time.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_35 " );	// But that doesn't mean I don't need them anymore, of course.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_36 " );	// So if you have something new, bring it!
	}
	else if(counttradefur > 3)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_38 " );	// Well, not bad at all!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_39 " );	// Although I expected a little more.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_40 " );	// But still, if you have any more skins, be sure to bring them!
	}
	else if(counttradefur >= 1)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_42 " );	// M-yes... This time it's quite sparse.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Fur_01_43 " );	// But maybe next time you will please me with something special, right?
	};
};

func void dia_hun_742_alfred_trophysell_skin()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,itat_LurkerSkin) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_skin_01_01 " );	// Skins of reptiles... Did you hunt frogs again in the swamp?
		AI_Output(self,other, " DIA_HUN_742_TrophySell_skin_01_02 " );	// I'll take them all from you.

		AllCountGold = AllCountGold + (Npc_HasItems(other,itat_LurkerSkin) * VALUE_ALFREDLURKERSKIN);
		Npc_RemoveInvItems(other,itat_LurkerSkin,Npc_HasItems(other,itat_LurkerSkin));

	};
	if(Npc_HasItems(other,ItAt_SharkSkin) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_skin_01_03 " );	// The skin of a swamp... Quite a rare thing in our area.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_skin_01_04 " );	// I'll take them all from you.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SharkSkin) * VALUE_ALFREDSHARKSKIN);
		Npc_RemoveInvItems(other,ItAt_SharkSkin,Npc_HasItems(other,ItAt_SharkSkin));
	};

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_horn()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_ShadowHorn) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_horn_01_01 " );	// The horn of the darkness. Very useful and valuable trophy!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_horn_01_02 " );	// I'll take them all from you.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_ShadowHorn) * VALUE_ALFREDSHADOWHORN);
		Npc_RemoveInvItems(other,ItAt_ShadowHorn,Npc_HasItems(other,ItAt_ShadowHorn));
	};
	if(Npc_HasItems(other,ItAt_DrgSnapperHorn) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_horn_01_03 " );	// Aha! Do you have a dragon snapper horn? This is a very good product!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_horn_01_04 " );	// Probably had to run before the snapper died of fatigue or old age?

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_DrgSnapperHorn) * VALUE_ALFREDDRGHORN);
		Npc_RemoveInvItems(other,ItAt_DrgSnapperHorn,Npc_HasItems(other,ItAt_DrgSnapperHorn));
	};

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_teeth()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_Teeth) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Teeth_01_01 " );	// Very good! An extra pair of fangs never hurt me.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Teeth_01_02 " );	// There will always be a buyer for them.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Teeth) * VALUE_ALFREDTEETH);
		Npc_RemoveInvItems(other,ItAt_Teeth,Npc_HasItems(other,ItAt_Teeth));
	};
	if(Npc_HasItems(other,ItAt_TrollTooth) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Teeth_01_03 " );	// Is that a troll's fang? Great, boy!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Teeth_01_04 " );	// This thing is a very valuable commodity, so give it here.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_TrollTooth) * VALUE_ALFREDTROLLTOOTH);
		Npc_RemoveInvItems(other,ItAt_TrollTooth,Npc_HasItems(other,ItAt_TrollTooth));

	};
	if((Npc_HasItems(other,ItAt_SharkTeeth) > 0) || (Npc_HasItems(other,ItAt_DesertSharkTeeth) > 0))
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Teeth_01_10 " );	// Swamp Teeth! Damn sharp stuff!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Teeth_01_11 " );	// Sometimes alchemists are willing to get rich for them.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_SharkTeeth) * VALUE_ALFREDSHARKTEETH) + (Npc_HasItems(other,ItAt_DesertSharkTeeth) * VALUE_ALFREDDESERTSHARKTEETH);
		Npc_RemoveInvItems(other,ItAt_SharkTeeth,Npc_HasItems(other,ItAt_SharkTeeth));
		Npc_RemoveInvItems(other,ItAt_DesertSharkTeeth,Npc_HasItems(other,ItAt_DesertSharkTeeth));
	};
	AI_Output(other,self, " DIA_HUN_742_TrophySell_Teeth_01_05 " );	// This is all I have.
	AI_Output(self,other, " DIA_HUN_742_TrophySell_Teeth_01_06 " );	// Good. But if anything, you know where to find me.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};

func void dia_hun_742_alfred_trophysell_claw()
{
	var int AllCountGold;

	AllCountGold = FALSE;

	if(Npc_HasItems(other,ItAt_Claw) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Claw_01_01 " );	// Several pairs of claws are fine. A very useful trophy.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Claw_01_02 " );	// I'll take them all from you.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_Claw) * VALUE_ALFREDCLAW);
		Npc_RemoveInvItems(other,ItAt_Claw,Npc_HasItems(other,ItAt_Claw));
	};
	if(Npc_HasItems(other,ItAt_LurkerClaw) > 0)
	{
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Claw_01_03 " );	// Aha! Do you have sting claws? This is a very good product!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Claw_01_04 " );	// Although most people do not see any difference between ordinary claws and claws of snugs, but trust me - there is!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Claw_01_06 " );	// The claws of these creatures are much sharper and stronger than the rest.
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Claw_01_07 " );	// So, you can use them much more versatile!
		AI_Output(self,other, " DIA_HUN_742_TrophySell_Claw_01_08 " );	// Give them here - I'll pay you much more for them than for regular ones.

		AllCountGold = AllCountGold + (Npc_HasItems(other,ItAt_LurkerClaw) * VALUE_ALFREDLURKERCLAW);
		Npc_RemoveInvItems(other,ItAt_LurkerClaw,Npc_HasItems(other,ItAt_LurkerClaw));
	};
	AI_Output(other,self, " DIA_HUN_742_TrophySell_Claw_01_09 " );	// This is all I have.
	AI_Output(self,other, " DIA_HUN_742_TrophySell_Claw_01_10 " );	// Good! Bring me more claws if you have them.

	if(AllCountGold >= 1)
	{
		B_GiveInvItems(self,other,ItMi_Gold,AllCountGold);
	};
};
