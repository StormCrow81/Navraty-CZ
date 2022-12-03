

instance DIA_PAL_9168_NATAN_EXIT(C_Info)
{
	npc = pal_9168_natan;
	nr = 999;
	condition = dia_pal_9168_natan_exit_condition;
	information = dia_pal_9168_natan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9168_natan_exit_condition()
{
	return TRUE;
};

func void dia_pal_9168_natan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9168_NATAN_PICKPOCKET(C_Info)
{
	npc = pal_9168_natan;
	nr = 900;
	condition = dia_pal_9168_natan_pickpocket_condition;
	information = dia_pal_9168_natan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9168_natan_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_pal_9168_natan_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
	Info_AddChoice(dia_pal_9168_natan_pickpocket,Dialog_Back,dia_pal_9168_natan_pickpocket_back);
	Info_AddChoice(dia_pal_9168_natan_pickpocket, DIALOG_PICKPOCKET , dia_pal_9168_natan_pickpocket_doit);
};

func void dia_pal_9168_natan_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
};

func void dia_pal_9168_natan_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
};


instance DIA_PAL_9168_NATAN_RESCUEGAROND (C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_rescuegarond_condition;
	information = dia_pal_9168_natan_rescuegarond_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9168_natan_rescuegarond_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (ALLAWAYFROMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_rescuegarond_info()
{
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_01_01 " );	// STOP! Not one step further!
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_01_03 " );	// Ahead - the positions of the orcs!
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_01_04 " );	// And if suicide is not in your plans, then the most appropriate maneuver for you is a U-turn followed by retreat.
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_01_05 " );	// Besides, I don't know you... Who are you and what are you doing here?!
	MEETNATAN = TRUE;
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
	if((MIS_RESCUEGAROND == LOG_Running) || (MIS_RESCUEGAROND == LOG_SUCCESS))
	{
		Info_AddChoice(dia_pal_9168_natan_rescuegarond, " I am here on behalf of Lord Hagen. " ,dia_pal_9168_natan_rescuegarond_hagen);
	}
	else
	{
		Info_AddChoice(dia_pal_9168_natan_rescuegarond, " I'm sorry! " ,dia_pal_9168_natan_rescuegarond_cantsee);
	};
};

func void dia_pal_9168_natan_rescuegarond_cantsee()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_01 " );	// And guess what!
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_02 " );	// Bravura self-confidence and belligerence betray our paladin brother in you.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_03 " );	// Your cockiness is beyond the legal limit for a militia talking to a paladin. But now is not about that.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_04 " );	// Proud, benevolent look with a touch of reproach. Fire mage!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_05 " );	// For a fire mage, not sleek enough, for a paladin - frail, but in the eyes of knowledge and, like those named earlier, nobility. Water mage!
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_06 " );	// The paladin has a gut feeling for Beliar's henchman.
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_07 " );	// Good equipment, many battles behind, in the eyes - lack of commitment to the gods, greed. Loyalty is in direct proportion to the amount offered. Mercenary!
	}
	else if((other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_08 " );	// The clothes are saturated with the stench of the swamp, the face is blissful and meaningless. Sectarian.
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_09 " );	// Casual look, stench. You are just a tramp. Well, that's not the point.
	};
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_10 " );	// This is understandable. I'm interested in another question - what are you doing here? Haven't you heard that this whole valley is just teeming with orcs?
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_12 " );	// In general, only a madman could come here just like that!
	AI_Output(other,self, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_13 " );	// Many people told me this before. But as you can see, I'm still alive.
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_14 " );	// Eh, okay... I won't argue with you! This is your own business.
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_15 " );	// After all, one more person, whoever it is, can't hurt us here.
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_CantSee_01_16 " );	// After all, there is practically no one left from the people - all the rest were killed by the orcs.
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
};

func void dia_pal_9168_natan_rescuegarond_hagen()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_RescueGarond_Hagen_01_01 " );	// I'm here on behalf of Lord Hagen.
	AI_Output(other,self, " DIA_Pal_9168_Natan_RescueGarond_Hagen_01_02 " );	// I need to find out what the situation is at the moment in the Valley of Mines.
	AI_Output(other,self, " DIA_Pal_9168_Natan_RescueGarond_Hagen_01_03 " );	// But most importantly, he wants to know what happened to his people!
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_Hagen_01_04 " );	// So Lord Hagen himself sent you? Well, then we seem to be on the same team, mate.
	AI_Output(self,other, " DIA_Pal_9168_Natan_RescueGarond_Hagen_01_05 " );	// I'm here on his orders too!
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
};


instance DIA_PAL_9168_NATAN_WHOYOU(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_whoyou_condition;
	information = dia_pal_9168_natan_whoyou_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_pal_9168_natan_whoyou_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_whoyou_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_01");	//Кто ты?
	AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_02 " );	// My name is Nathan. And as you probably already understood, I am the paladin of the king and a faithful servant of Innos!
	if(Npc_KnowsInfo(other,dia_pal_2000_hagen_rescuegarondothers))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self, " DIA_Pal_9168_Natan_WhoYou_01_03 " );	// Oh yeah! I think Lord Hagen has already told me about you.
		AI_Output(other,self, " DIA_Pal_9168_Natan_WhoYou_01_04 " );	// You're one of the guys who volunteered to go on this expedition with him.
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_10 " );	// It's all because of the Strike paladin.
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_13 " );	// A few years ago, on one of my hikes in the snowy Nordmar, this guy saved my life!
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_14 " );	// After which I made a sacred vow to Innos that I would definitely return this debt of honor to him.
		AI_Output(other,self, " DIA_Pal_9168_Natan_WhoYou_01_15 " );	// So he saved your life. And how did it happen?
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_16 " );	// It was like this: our forward detachment, sent to reconnaissance in one of the gorges, was ambushed by orcs... (remembers) These creatures surrounded us from all sides!
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_21 " );	// When the fight broke out, Strike with his crossbow cut orcs right and left until his supply of iron bolts ran out.
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_22 " );	// After that happened, he changed the trigger to the hilt of the sword and charged into the thick of the enemies, unleashing the full fury of his attack on them...(admiringly)
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_25 " );	// As a result, our detachment got out of the encirclement, although it suffered significant losses.
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_26 " );	// Then we began to retreat towards the location of our main forces...
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_27 " );	// ...but suddenly one of the bolts fired by the orcs in pursuit hit me right in the leg. I fell like a wreck!
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_28 " );	// Udar saw this and rushed to my rescue, despite the fact that these creatures were already on our heels.
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_29 " );	// He carried me, wounded, from the battlefield, did not leave me to be torn to pieces by these bloodthirsty monkeys!
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_30 " );	// I am immensely grateful to him for what he has done.
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_31 " );	// That's the reason why I actually volunteered for this expedition when I found out that Udar was also taking part in it.
		AI_Output(self,other, " DIA_Pal_9168_Natan_WhoYou_01_32 " );	// Perhaps this is where I'll get a chance to repay him.
		AI_Output(other,self, " DIA_Pal_9168_Natan_WhoYou_01_33 " );	// M-yes... well, the story. I didn't know he was capable of that.
		if ( ! Npc_IsDead(PAL_268_Udar))
		{
			MIS_NATANDOLG = LOG_Running;
			Log_CreateTopic(TOPIC_NATANDOLG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_NATANDOLG,LOG_Running);
			; _ _ _ _ _ _
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Pal_9168_Natan_WhoYou_01_36 " );	// Well, yes, I already understood that.
	};
};


instances DIA_PAL_9168_NATAN_ZAMOK (C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_zamok_condition;
	information = dia_pal_9168_natan_zamok_info;
	permanent = FALSE;
	description = " Why aren't you in the fortress? " ;
};


func int dia_pal_9168_natan_zamok_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (CASTLEISDOWN == FALSE) && (KNOWABOUTGAROND == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_zamok_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_01_01 " );	// Why aren't you in the fortress?
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_01_02 " );	// Because it's crowded with orcs.
	AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_01_03 " );	// So the castle fell after all?
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_01_04 " );	// Yes, unfortunately it is... A few days ago, the orcs attacked again, and this time we couldn't hold them back.
	AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_01_05 " );	// And what about Garond and his men?
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_01_06 " );	// I don't know for sure, but most likely they all died. It is foolish to rely on the fact that the greenskins spared anyone!
	AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_01_07 " );	// I think we should find out.
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_01_08 " );	// Seriously? And how? Maybe ask the orcs themselves?!
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_01_09 " );	// They'll cut me to pieces before I even get to the fortress!
	CASTLEISDOWN = TRUE;
	NATATELLZAMOK = TRUE ;
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		B_LogEntry( TOPIC_RESCUEGAROND , " The castle in the Valley of Mines has fallen! The orcs managed to take it by storm. I don't think Lord Hagen will be very happy about this news. Nothing is known about the fate of the castle's defenders themselves. " );
	};
	Info_ClearChoices(dia_pal_9168_natan_zamok);
	Info_AddChoice(dia_pal_9168_natan_zamok, " Then I'll do it! " ,dia_pal_9168_natan_zamok_ulumulu);
	Info_AddChoice(dia_pal_9168_natan_zamok, " Then we should try to take the fortress back from them! " ,dia_pal_9168_natan_zamok_noway);
};

func void dia_pal_9168_natan_zamok_ulumulu()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_UluMulu_01_01 " );	// Then I'll do it!
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_UluMulu_01_04 " );	// Hmm. OK! Your life is less dear to me than my own. Take action!
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_UluMulu_01_05 " );	// True, I don't think that any sense will come out of this venture.
	MIS_NEWSSURVIVERS = LOG_Running;
	Log_CreateTopic(TOPIC_NEWSSURVIVERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_Running);
	B_LogEntry( TOPIC_NEWSSURVIVERS , " Not far from the passage leading out of the Valley of Mines, I met a small group of paladins. They are led by a man named Nathan. He told me that the orcs recently stormed the castle again and this time they succeeded - the fortress fell! " );
	Log_AddEntry( TOPIC_NEWSSURVIVERS , " Nathan believes that all the defenders of the castle are dead, but I decided to visit the fortress to find out about the fate of Garond and his people. " );
	AI_StopProcessInfos(self);
};

func void dia_pal_9168_natan_zamok_noway()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_NoWay_01_01 " );	// We should try to take the fortress back from them!
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_02 " );	// To be honest, we've already thought about it ourselves.
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_03 " );	// However, we are too few to fight against an entire army of orcs.
	AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_NoWay_01_06 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_07 " );	// Hmmm... (thoughtfully) I heard that there is still a small band of dragon hunters left in the valley.
	AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_08 " );	// Now, if we teamed up with them, then success would be more guaranteed.
	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(DRGHUNTER01ISDEAD == TRUE)
		{
			AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_NoWay_01_17 " );	// It's unlikely that something good will come out of this.
			AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_NoWay_01_18 " );	// Their leader is dead! And without him, they're just a bunch of incompetent weaklings.
			AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_19 " );	// How do you know this?
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Gods);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		}
		else
		{
			AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_NoWay_01_09 " );	// I'm afraid they're all dead already.
			AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_10 " );	// How do you know this?
		};
		AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_NoWay_01_11 " );	// Trust me, it is. So you have to fight without them.
		AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_12 " );	// Yes, very sorry. We can only hope for ourselves.
		AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_13 " );	// We're ready to attack. Let me know when you're ready.
		AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_NoWay_01_14 " );	// Good.
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry( TOPIC_STURMCASTLE , " Not far from the passage leading out of the Valley of Mines, I met a small group of paladins. They are led by a man named Nathan. He told me that the orcs recently stormed the castle again and this time they succeeded - the fortress fell! Nathan believes that all the defenders of the castle died, but it is not yet possible to be sure of this. " );
		Log_AddEntry( TOPIC_STURMCASTLE , " I think the best way to find out is to try to recapture the fortress. Nathan, of course, agreed with my proposal, but complained that we had too few people for this venture. He already wanted to recruit the remaining hunters in the valley on the dragons, but, having learned that they were all dead, he agreed to launch an attack on his own. " );
		Info_ClearChoices(dia_pal_9168_natan_zamok);
	}
	else
	{
		AI_Output(other,self, " DIA_Pal_9168_Natan_Zamok_NoWay_01_15 " );	// Okay, I'll try to find them. Unless, of course, the orcs did it before me!
		AI_Output(self,other, " DIA_Pal_9168_Natan_Zamok_NoWay_01_16 " );	// Good! We will be waiting at the same place.
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry( TOPIC_STURMCASTLE , " Not far from the passage leading out of the Valley of Mines, I met a small group of paladins. They are led by a man named Nathan. He told me that the orcs recently stormed the castle again and this time they succeeded - the fortress fell! Nathan believes that all the defenders of the castle died, but it is not yet possible to be sure of this. " );
		Log_AddEntry( TOPIC_STURMCASTLE , " I think the best way to find out is to try to recapture the fortress. Nathan, of course, agreed with my proposal, but complained that we did not have enough people for this venture. He wants to team up with the dragon hunters. I must find their squad and convince them to join us. " );
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9168_NATAN_NEWSSURVIVERS (C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurvivers_condition;
	information = dia_pal_9168_natan_newssurvivers_info;
	permanent = FALSE;
	description = " I was in the fortress. " ;
};


func int dia_pal_9168_natan_newssurvivers_condition()
{
	if((KNOWABOUTGAROND == TRUE) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOK == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newssurvivers_info()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_NewsSurvivers_01_01 " );	// I was in the fortress.
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_02 " );	// (tense) Really? And what did you find out?
	AI_Output(other,self, " DIA_Pal_9168_Natan_NewsSurvivers_01_03 " );	// Garond and some of the paladins are alive! Orcs took them prisoner.
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_07 " );	// We need to free Garond and his men as soon as possible. We don't have a minute to waste!
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_08 " );	// We don't know what orc mercy is connected to or how long it will last.
	if (( MIS_RECORDED  == LOG_Running ) && ( RECORDED  ==  TRUE ))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self, " DIA_Pal_9168_Natan_NewsSurvivers_01_10 " );	// By the way, among the paladins captured by the orcs was your friend Udar! He, too, was captured by them.
		AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_11 " );	// Strike at the fortress?! Crap! He is there on the verge of death, and I am here!
		AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_12 " );	// Damned orcs! If he dies, I won't rest until I've killed them all!
		AI_Output(other,self, " DIA_Pal_9168_Natan_NewsSurvivers_01_13 " );	// I think this is your chance to do him your due.
		AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_14 " );	// You're right. I'll get him out of there as soon as I can.
		AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_15 " );	// Thanks for letting me know what's going on inside. Now nothing will stop me on the way to the castle!
		B_LogEntry( TOPIC_NATANDOLG , " Upon learning that Paladin Strike was also being held captive by the orcs, Nathan was furious. It seems that even an entire army could not stop him now! " );
	}
	else
	{
		B_GivePlayerXP(100);
	};
	KNOWSITUATIONCASTLE = TRUE;
};


instance DIA_PAL_9168_NATHAN_ZAMOKKNOWN ( C_Info ) ;
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_zamokknown_condition;
	information = dia_pal_9168_natan_zamokknown_info;
	permanent = FALSE;
	description = " How are things? " ;
};


func int dia_pal_9168_natan_zamokknown_condition()
{
	if (( MIS_OR с GREATWAR  == LOG_Running ) && ( CASTLEISFREE  ==  FALSE ) && ( PALADINCASTELFREE  ==  FALSE ) && ( CASTLEISDOWN  ==  TRUE ) && ( NATATELLZAMOK  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_zamokknown_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_01_01 " );	// How are things?
	AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_01_02 " );	// A few days ago, the orcs again stormed the castle, and this time their assault was crowned with success.
	if(KNOWABOUTGAROND == TRUE)
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_01_04 " );	// (tensely) What? You were there?! And what did you find out?
		AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_01_05 " );	// Garond and some of the paladins are alive! Orcs took them prisoner.
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_01_09 " );	// We need to free Garond and his men as soon as possible. We don't have a minute to waste!
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_01_10 " );	// We don't know how long these bloodthirsty creatures' mercy will last.
		KNOWSITUATIONCASTLE = TRUE;
		if(Npc_KnowsInfo(other,dia_orc_8566_urhan_paladincost))
		{
			if(BOGNARREFUSETALK == TRUE)
			{
				Info_ClearChoices(dia_pal_9168_previously_known);
				Info_AddChoice(dia_pal_9168_natan_zamokknown, " We should try to take the fortress back from them! " ,dia_pal_9168_natan_zamokknown_noway);
			}
			else
			{
				AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_01_11 " );	// Agree! We must hurry.
			};
		}
		else
		{
			Info_ClearChoices(dia_pal_9168_previously_known);
			Info_AddChoice(dia_pal_9168_natan_zamokknown, " Agreed! We need to hurry. " ,dia_pal_9168_natan_zamokknown_ulumulu);
			Info_AddChoice(dia_pal_9168_natan_zamokknown, " We should try to take the fortress back from them! " ,dia_pal_9168_natan_zamokknown_noway);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_01_12 " );	// (tensely) What? You were there?! Has anyone survived?
		AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_01_13 " );	// Don't know yet. But I think we should find out.
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_01_14 " );	// Really? Hmmm. And how do you think I should do it?
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_01_15 " );	// They'll cut me to pieces before I even get to the fortress!
		NATATELLZAMOKTWO = TRUE ;
		Info_ClearChoices(dia_pal_9168_previously_known);
		Info_AddChoice(dia_pal_9168_natan_zamokknown, " Then I'll do it!. " ,dia_pal_9168_natan_zamokknown_ulumulu);
		Info_AddChoice(dia_pal_9168_natan_zamokknown, " We should try to take the fortress back from them! " ,dia_pal_9168_natan_zamokknown_noway);
	};
};

func void dia_pal_9168_natan_zamokknown_ulumulu()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_01 " );	// Then I'll do it!
	AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_04 " );	// Hmmm...(surprised) Okay! If you decide so, then act.
	AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_05 " );	// True, I don't think that any sense will come out of this venture.
	MIS_NEWSSURVIVERS = LOG_Running;
	Log_CreateTopic(TOPIC_NEWSSURVIVERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_Running);
	B_LogEntry( TOPIC_NEWSSURVIVERS , " Not far from the passage leading out of the Valley of Mines, I met a small group of paladins. They are led by a man named Nathan. He told me that the orcs recently stormed the castle again and this time they succeeded - the fortress fell! " );
	Log_AddEntry( TOPIC_NEWSSURVIVERS , " Nathan believes that all the defenders of the castle are dead, but I decided to visit the fortress to find out about the fate of Garond and his people. " );
	AI_StopProcessInfos(self);
};

func void dia_pal_9168_natan_zamokknown_noway()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_01 " );	// We should try to take the fortress back from them!
	AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_02 " );	// To be honest, we've already thought about it ourselves.
	AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_03 " );	// However, we are too few to fight against an entire army of orcs.
	AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_06 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_07 " );	// Hmmm... (thoughtfully) I heard that there is still a small band of dragon hunters left in the valley.
	AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_08 " );	// I think that if they joined us, then we would have a much better chance of driving the orcs out of the fortress!
	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_09 " );	// I'm afraid they're all dead already.
			AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_10 " );	// How do you know this?
		}
		else
		{
			AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_11 " );	// It's unlikely that something good will come out of this.
			AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_12 " );	// Their leader is dead. And without him, they're just a bunch of incompetent weaklings. So the orcs must have already gotten to them!
			AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_13 " );	// How do you know this?
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Gods);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_14 " );	// Trust me, it is. So you have to fight without them!
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_15 " );	// Yes, it's a pity... (frustrated) We can only hope for ourselves.
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_16 " );	// I think we can start our attack then. Let me know when you're ready!
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_17");	//Хорошо.
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry( TOPIC_STURMCASTLE , " Not far from the passage leading out of the Valley of Mines, I met a small group of paladins. They are led by a man named Nathan. He told me that the orcs recently stormed the castle again and this time they succeeded - the fortress fell! Nathan believes that all the defenders of the castle died, but it is not yet possible to be sure of this. " );
		Log_AddEntry( TOPIC_STURMCASTLE , " I think the best way to find out is to try to recapture the fortress. Nathan, of course, agreed with my proposal, but complained that we had too few people for this venture. He already wanted to recruit the remaining hunters in the valley on the dragons, but, having learned that they were all dead, he agreed to launch an attack on his own. " );
		Info_ClearChoices(dia_pal_9168_previously_known);
	}
	else
	{
		AI_Output(other,self, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_18 " );	// Okay, I'll try to find them. Unless, of course, the orcs did it before me.
		AI_Output(self,other, " DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_19 " );	// Good! We will be waiting at the same place.
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry( TOPIC_STURMCASTLE , " Not far from the passage leading out of the Valley of Mines, I met a small group of paladins. They are led by a man named Nathan. He told me that the orcs recently stormed the castle again and this time they succeeded - the fortress fell! Nathan believes that all the defenders of the castle died, but it is not yet possible to be sure of this. " );
		Log_AddEntry( TOPIC_STURMCASTLE , " I think the best way to find out is to try to recapture the fortress. Nathan, of course, agreed with my proposal, but complained that we did not have enough people for this venture. He wants to team up with the dragon hunters. I must find their squad and convince them to join us. " );
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9168_NATAN_NEWSURVIVORSTWO (C_Info) .
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurviverstwo_condition;
	information = dia_pal_9168_next_newsurviverstwo_info;
	permanent = FALSE;
	description = " I was in the fortress. " ;
};


func int dia_pal_9168_natan_newssurviverstwo_condition()
{
	if((KNOWABOUTGAROND == TRUE) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOKTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newsurviverstwo_info();
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pal_9168_Natan_NewsSurvivers_01_01 " );	// I was in the fortress.
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_02 " );	// (tense) Really? And what did you find out?
	AI_Output(other,self, " DIA_Pal_9168_Natan_NewsSurvivers_01_03 " );	// Garond and some of the paladins are alive! Orcs took them prisoner.
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_07 " );	// We need to free Garond and his men as soon as possible. We don't have a minute to waste!
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurvivers_01_08 " );	// We don't know what orc mercy is connected to or how long it will last.
	KNOWSITUATIONCASTLE = TRUE;
};


instance DIA_PAL_9168_NATAN_NEWSSURVIVERSUDAR (C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurviversudar_condition;
	information = dia_pal_9168_natan_newssurviversudar_info;
	permanent = FALSE;
	description = " I have some news for you. " ;
};


func int dia_pal_9168_natan_newssurviversudar_condition()
{
	if (( MIS_NATANDOLG  == LOG_Running ) && ( UDARKNOWSNATAN  ==  TRUE ) && ( PALADINCASTELFREE  ==  FALSE ) && ( CASTLEISFREE  ==  FALSE ) && Npc_KnowsInfo(hero,dia_pal_9168_natan_zamokknown))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newssurviversudar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pal_9168_Natan_NewsSurviversUdar_01_03 " );	// Among the paladins captured by the orcs was your friend Punch! He, too, was captured by them.
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurviversUdar_01_04 " );	// Strike at the fortress?! Crap! So they got to him.
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurviversUdar_01_05 " );	// (terribly) Damned orcs! I just won't leave it like that.
	AI_Output(other,self, " DIA_Pal_9168_Natan_NewsSurviversUdar_01_06 " );	// I think this is your chance to do him your due.
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurviversUdar_01_07 " );	// And I'll do it as soon as possible.
	AI_Output(self,other, " DIA_Pal_9168_Natan_NewsSurviversUdar_01_08 " );	// Thanks for letting me know. Now nothing will stop me on the way to the castle!
	B_LogEntry( TOPIC_NATANDOLG , " Upon learning that Paladin Strike was also being held captive by the orcs, Nathan was furious. It seems that even an entire army could not stop him now! " );
};


instances DIA_PAL_9168_NATAN_HOWAROUND (C_Info)
{
	npc = pal_9168_natan;
	nr = 2;
	condition = dia_pal_9168_natan_condition;
	information = dia_pal_9168_previous_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_pal_9168_natan_condition()
{
	if (( MIS_OR с GREATWAR  == LOG_Running) && (Npc_KnowsInfo(hero,dia_pal_9168_natan_zamok ) ||
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_info()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_01_00 " );	// How's the situation?
	if(MIS_STURMCASTLE == LOG_Running)
	{
		if(CASTLEISFREE == TRUE)
		{
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_01 " );	// We did it! The fortress is now in our hands again!
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_02 " );	// But do not rejoice too violently - this triumph is not final. Exhale early. Orcs are also principled, and they, too, are losing their friends in this war. The capture of the castle is their goal again.
			AI_StopProcessInfos(self);
		}
		else
		{
			if(KNOWSITUATIONCASTLE == TRUE)
			{
				AI_Output(self,other, " DIA_Pal_9168_Natan_01_04 " );	// We need to get Garond and his men out of the clutches of the orcs somehow! We can't leave them here to their fate.
				AI_StopProcessInfos(self);
			};
			if(PALADINREADYATTACK == FALSE)
			{
				AI_Output(self,other, " DIA_Pal_9168_Natan_01_06 " );	// So far so quiet...(seriously) But for me, it's the calm before the storm!
				AI_Output(self,other, " DIA_Pal_9168_Natan_01_07 " );	// The hour is not even when the orcs come here and then we all will not be well.
				AI_Output(self,other, " DIA_Pal_9168_Natan_01_08 " );	// So you need to find this unit as soon as possible. We have no time to waste!
				AI_Output(other,self, " DIA_Pal_9168_Natan_01_09 " );	// Good! Already going.
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(self,other, " DIA_Pal_9168_Natan_01_10 " );	// We need to attack the fortress quickly before the orcs get suspicious... (seriously) What are you waiting for?!
				AI_StopProcessInfos(self);
			};
		};
	}
	else if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		if(KNOWSITUATIONCASTLE == FALSE)
		{
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_12 " );	// So far everything is quiet... (seriously) But for me, this is the calm before the storm!
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_13 " );	// The hour is not even when the orcs come here and then we all will not be well.
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_14 " );	// So you need to get to the fortress as soon as possible and find out what's going on there.
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_15 " );	// We don't have a minute to waste!
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_17 " );	// We need to get Garond and his men out of the clutches of the orcs somehow! We can't leave them here to their fate.
			AI_StopProcessInfos(self);
		};
	}
	else if(PALADINCASTELFREE == TRUE)
	{
		if(MIS_STURMCASTLE == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_19 " );	// Could be better. One thing pleases - Garond and his people are now with us!
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_20 " );	// And now we're leaving before the orcs come to their senses.
		}
		else if(MIS_NEWSSURVIVERS == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_22 " );	// Could be better. One thing pleases - Garond and his people are now with us!
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_23 " );	// Now let's go before the orcs come to their senses!
		}
		else
		{
			AI_Output(self,other, " DIA_Pal_9168_Natan_01_25 " );	// Could be better...
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9168_Natan_01_26 " );	// Could be better...
	};
};


instance DIA_PAL_9168_NATAN_CANREADYATTACK (C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_canreadyattack_condition;
	information = dia_pal_9168_natan_canreadyattack_info;
	permanent = FALSE;
	description = " About dragon hunters... " ;
};


func int dia_pal_9168_natan_canreadyattack_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (PALADINREADYATTACK == FALSE) && ((DGJREFUSEPALADIN == TRUE) || (DGJJOINPALADIN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_canreadyattack_info()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_01 " );	// About dragon hunters...
	AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_02 " );	// Yes? Do you have any news regarding this rally... of our new allies?
	AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_03 " );	// Yes! I found their squad and invited them to join you.
	AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_04 " );	// And what did they say?
	if(DGJJOINPALADIN == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_05 " );	// They agree! They will fight with us.
		AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_06 " );	// I'm really happy about this. In the battle with the orcs, we will need any help!
		AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_07 " );	// I think we can start our attack now. Let me know when you're ready!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_08");	//Хорошо.
		B_LogEntry( TOPIC_STURMCASTLE , " Nathan was delighted to hear that the dragon hunters agreed to take part in the assault on the fortress. Now we can begin our attack. " );
		PALADINREADYATTACK = TRUE;
		b_readydgjattack();
	}
	else if(DGJREFUSEPALADIN == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_09 " );	// I don't think they will be of much use.
		AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_10 " );	// Why do you think so?
		AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_11 " );	// These underpants were stuffed in the pants as soon as they knew what exactly you were up to.
		AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_12 " );	// So we'll have to fight without them!
		AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_13 " );	// Yes, it's a pity... (frustrated) We can only hope for ourselves.
		AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_14 " );	// I think we can start our attack now. Let me know when you're ready!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_15");	//Хорошо.
		B_LogEntry( TOPIC_STURMCASTLE , " Nathan was a little upset by the news that the dragon hunters refused to take part in the assault on the fortress. Now we will have to rely only on our own forces. " );
		PALADINREADYATTACK = TRUE;
	}
	else if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_16 " );	// I'm afraid they're all dead already.
			AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_17 " );	// How do you know this?
		}
		else
		{
			AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_18 " );	// Nothing! Their leader is dead, and without him they're just a bunch of incompetent weaklings. So the orcs must have already gotten to them!
			AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_19 " );	// How do you know this?
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Gods);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self, " DIA_Pal_9168_Natan_CanReadyAttack_01_20 " );	// Trust me, it is. So you have to fight without them!
		AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_21 " );	// Yes, it's a pity... (frustrated) We can only hope for ourselves.
		AI_Output(self,other, " DIA_Pal_9168_Natan_CanReadyAttack_01_22 " );	// I think we can start our attack now. Let me know when you're ready!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_23");	//Хорошо.
		B_LogEntry( TOPIC_STURMCASTLE , " Nathan was a little upset by the news that the dragon hunters will not take part in the assault on the fortress. Now we will have to rely only on our own strength. " );
		PALADINREADYATTACK = TRUE;
	};
};


instance DIA_PAL_9168_NATAN_SURVIVERSFAILED(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_surviversfailed_condition;
	information = dia_pal_9168_natan_surviversfailed_info;
	permanent = FALSE;
	description = " We just have to storm the castle! " ;
};


func int dia_pal_9168_natan_surviversfailed_condition()
{
	if (( MIS_NEWSSURVIVERS  == LOG_Running) && ( MIS_STURMCASTLE  ==  FALSE ) && ( BOGNARREFUSETALK  ==  TRUE ) && ( CASTLEISFREE  ==  FALSE ) && ( PALADINCASTELFREE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_surviversfailed_info()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_SurviversFailed_01_01 " );	// We just have to storm the castle!
	AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_02 " );	// To be honest, we've already thought about it ourselves.
	AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_03 " );	// However, we are too few to fight against an entire army of orcs.
	AI_Output(other,self, " DIA_Pal_9168_Natan_SurviversFailed_01_06 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_07 " );	// Hmmm. I heard that there is still a small band of dragon hunters left in the valley.
	AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_08 " );	// I think that if they could join us, then we would have a much better chance of knocking the orcs out of the fortress!

	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self, " DIA_Pal_9168_Natan_SurviversFailed_01_09 " );	// I'm afraid they're all dead already.
			AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_10 " );	// How do you know this?
		}
		else
		{
			AI_Output(other,self, " DIA_Pal_9168_Natan_SurviversFailed_01_17 " );	// I don't think they will be of much use.
			AI_Output(other,self, " DIA_Pal_9168_Natan_SurviversFailed_01_18 " );	// Their leader is dead! And without him, they're just a bunch of incompetent weaklings. So the orcs must have already gotten to them!
			AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_19 " );	// How do you know this?
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Gods);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);

			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self, " DIA_Pal_9168_Natan_SurviversFailed_01_11 " );	// Trust me, it is. So you have to fight without them!
		AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_12 " );	// Yeah, sorry... (frustrated) Okay! We can only hope for ourselves.
		AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_13 " );	// I think we can start our attack then. Let me know when you're ready!
		AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_14");	//Хорошо.
		MIS_NEWSSURVIVERS = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_OBSOLETE);
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry( TOPIC_STURMCASTLE , " All we can do is try to retake the fortress. Nathan, of course, agreed with my proposal, but complained that we had too few people for this venture. He already wanted to recruit the remaining hunters in the valley for dragons, but, having learned that they were all dead, he agreed to launch an attack on his own. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Pal_9168_Natan_SurviversFailed_01_15 " );	// Okay, I'll try to find them. Unless, of course, the orcs did it before me.
		AI_Output(self,other, " DIA_Pal_9168_Natan_SurviversFailed_01_16 " );	// Good! We will be waiting at the same place.
		MIS_NEWSSURVIVERS = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_OBSOLETE);
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry( TOPIC_STURMCASTLE , " All we can do is try to recapture the fortress. Nathan, of course, agreed with my proposal, but complained that we had too few people for this venture. He wants to team up with the dragon hunters. I should find their squad and convince them to join us. " );
		AI_StopProcessInfos(self);
	};
};


instances DIA_PAL_9168_NATAN_READYATTACK (C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_readyattack_condition;
	information = dia_pal_9168_natan_readyattack_info;
	permanent = TRUE;
	description = " Let's attack! " ;
};

func int dia_pal_9168_natan_readyattack_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (PALADINREADYATTACK == TRUE) && (PALADINATTACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_readyattack_info()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_ReadyAttack_01_01 " );	// Let's start the attack!
	AI_Output(self,other, " DIA_Pal_9168_Natan_ReadyAttack_01_02 " );	// (seriously) Good. Are you ready?
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
	Info_AddChoice(dia_pal_9168_natan_readyattack, " No! Wait a minute. " ,dia_pal_9168_natan_readyattack_wait);
	Info_AddChoice(dia_pal_9168_natan_readyattack, " Я готов. " ,dia_pal_9168_natan_readyattack_attack);
};

func void dia_pal_9168_natan_readyattack_wait()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_ReadyAttack_Wait_01_01 " );	// No! Wait a minute.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Wait_01_02");	//Поторопись!
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
};

func void dia_pal_9168_natan_readyattack_attack()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_01");	//Я готов.
	AI_Output(self,other, " DIA_Pal_9168_Natan_ReadyAttack_Attack_01_02 " );	// Great! Then we move out immediately.
	AI_Output(self,other, " DIA_Pal_9168_Natan_ReadyAttack_Attack_01_03 " );	// By the way, I think it would be right if you lead the attack. Because I myself, to be honest, am not very strong in such matters.
	AI_Output(self,other, " DIA_Pal_9168_Natan_ReadyAttack_Attack_01_04 " );	// So we all rely on you completely. Do not let me down!
	AI_Output(self,other, " DIA_Pal_9168_Natan_ReadyAttack_Attack_01_05 " );	// (belligerently) Forward, for Innos!
	PALADINATTACK = TRUE;
	B_LogEntry( TOPIC_STURMCASTLE , "The assault on the fortress has begun!... " );
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
	Info_AddChoice(dia_pal_9168_natan_readyattack, " Хорошо, веред! " ,dia_pal_9168_natan_readyattack_go);
};

func void dia_pal_9168_natan_readyattack_go()
{
	AI_Output(other,self, " DIA_Pal_9168_Natan_ReadyAttack_Go_01_01 " );	// Okay, let's go!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	b_paladinattackcastle();
};
