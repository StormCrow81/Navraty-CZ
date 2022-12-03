

instance DIA_Jarvis_EXIT(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 999;
	condition = DIA_Jarvis_EXIT_Condition;
	information = DIA_Jarvis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jarvis_Hello(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 1;
	condition = DIA_Jarvis_Hello_Condition;
	information = DIA_Jarvis_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jarvis_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Hello_Info()
{
	AI_Output(self,other, " DIA_Jarvis_Hello_04_00 " );	// Hey! Do I know you from somewhere?
	AI_Output(other, self, " DIA_Jarvis_Hello_15_01 " );	// Maybe. I was also in the colony.
	AI_Output(self,other, " DIA_Jarvis_Hello_04_02 " );	// Exactly... what do you need?
};


instance DIA_Jarvis_DieLage(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_DieLage_Condition;
	information = DIA_Jarvis_DieLage_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_DieLage_Info()
{
	AI_Output(other,self, " DIA_Jarvis_DieLage_15_00 " );	// How's the situation?
	AI_Output(self,other, " DIA_Jarvis_DieLage_04_01 " );	// Big problems are brewing. Mercenaries split into two factions.
	AI_Output(self,other, " DIA_Jarvis_DieLage_04_02 " );	// Silvio and his men doubt that Lee chose the right path.
};


instance DIA_Jarvis_TwoFronts(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 3;
	condition = DIA_Jarvis_TwoFronts_Condition;
	information = DIA_Jarvis_TwoFronts_Info;
	permanent = FALSE;
	description = " How did it happen that two factions appeared? " ;
};


func int DIA_Jarvis_TwoFronts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_TwoFronts_Info()
{
	AI_Output(other,self, " DIA_Jarvis_TwoFronts_15_00 " );	// And how did it happen that two factions appeared?
	AI_Output(self,other, " DIA_Jarvis_TwoFronts_04_01 " );	// Most of us came from the colony with Lee.
	AI_Output(self,other, " DIA_Jarvis_TwoFronts_04_02 " );	// But some mercenaries joined us later.
	AI_Output(self,other, " DIA_Jarvis_TwoFronts_04_03 " );	// They're not from the colony, they were south and fought the orcs.
	AI_Output(self,other, " DIA_Jarvis_TwoFronts_04_04 " );	// They somehow heard that Lee needed people. Their leader was Silvio.
	AI_Output(self,other, " DIA_Jarvis_TwoFronts_04_05 " );	// He agreed that Lee would be in charge, but now he's trying to set up mercenaries against Lee and his plan.
	AI_Output(self,other, " DIA_Jarvis_TwoFronts_04_06 " );	// Most of Lee's people don't take this problem seriously. But I know guys like Silvio well.
	AI_Output(self,other, " DIA_Jarvis_TwoFronts_04_07 " );	// He is able to go to extremes to realize his ideas.
};


instance DIA_Jarvis_ReadPlan (C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 4;
	condition = DIA_Jarvis_LeesPlan_Condition;
	information = DIA_Jarvis_LeesPlan_Info;
	permanent = FALSE;
	description = " Do you know what Lee is going to do? " ;
};


func int DIA_Jarvis_LeesPlan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_ReadingPlan_Info()
{
	AI_Output(other,self, " DIA_Jarvis_LeesPlan_15_00 " );	// Do you know what Lee is going to do?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other, " DIA_Jarvis_LeesPlan_04_01 " );	// Lee wants us to wait and starve the paladins in the city.
	};
	AI_Output(self,other, " DIA_Jarvis_LeesPlan_04_02 " );	// He plans to get us all off this island. Innos witness, I don't mind getting out of here.
	AI_Output(self,other, " DIA_Jarvis_LeesPlan_04_03 " );	// I don't know how Lee is going to pull this off, but I trust him. He has always been a good leader.
};


instance DIA_Jarvis_SylviosPlan(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 5;
	condition = DIA_Jarvis_SylviosPlan_Condition;
	information = DIA_Jarvis_SylviosPlan_Info;
	permanent = FALSE;
	description = " Do you know what Silvio is planning? " ;
};


func int DIA_Jarvis_SylviosPlan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosPlan_Info()
{
	AI_Output(other,self, " DIA_Jarvis_SylviosPlan_15_00 " );	// Do you know what Silvio is planning?
	AI_Output(self,other, " DIA_Jarvis_SylviosPlan_04_01 " );	// Silvio found out that some of the paladins went to the former colony.
	AI_Output(self,other, " DIA_Jarvis_SylviosPlan_04_02 " );	// He says the remaining paladins won't dare attack us here and wants to take advantage of this situation.
	AI_Output(self,other, " DIA_Jarvis_SylviosPlan_04_03 " );	// Plunder small farms, ambush militia patrols near the city, disembowel travelers, and so on.
	AI_Output(self,other, " DIA_Jarvis_SylviosPlan_04_04 " );	// But Lee thinks it's the worst thing you can think of in this situation.
};


instance DIA_Jarvis_WannaJoin(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 6;
	condition = DIA_Jarvis_WannaJoin_Condition;
	information = DIA_Jarvis_WannaJoin_Info;
	permanent = FALSE;
	description = " I want to become a mercenary! " ;
};


func int DIA_Jarvis_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Jarvis_WannaJoin_15_00 " );	// I want to become a mercenary!
	AI_Output(self,other, " DIA_Jarvis_WannaJoin_04_01 " );	// I'm not sure if this is a good idea...
	AI_Output(other,self, " DIA_Jarvis_WannaJoin_15_02 " );	// What's the problem?
	AI_Output(self,other, " DIA_Jarvis_WannaJoin_04_03 " );	// Well, I have to vote either for you or against.
	AI_Output(self,other, " DIA_Jarvis_WannaJoin_04_04 " );	// Given the situation, I'll only vote for you if I'm sure you're on Lee's side!
};


instances DIA_Jarvis_MissionKO (C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_MissionKO_Condition;
	information = DIA_Jarvis_MissionKO_Info;
	permanent = FALSE;
	description = " And what should I do? " ;
};


func int DIA_Jarvis_MissionKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_WannaJoin) && Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_MissionKO_Info()
{
	AI_Output(other,self, " DIA_Jarvis_MissionKO_15_00 " );	// And what should I do?
	AI_Output(self,other, " DIA_Jarvis_MissionKO_04_01 " );	// It's simple. Bang some of Silvio's guys! This way both sides will immediately understand who you are with.
	AI_Output(self,other, " DIA_Jarvis_MissionKO_04_02 " );	// And if you stick to the dueling rules, you might even win the respect of the others.
	MIS_Jarvis_SldKO = LOG_Running;
	self.aivar[AIV_IGNORE_Murder] = TRUE ;
	Log_CreateTopic(TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JarvisSLDKo,LOG_Running);
	B_LogEntry(TOPIC_JarvisSLDKo, " Jarvis wants me to knock out a couple of Silvio's guys so he'll vote for me. " );
};


instance DIA_Jarvis_DuellRules (C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_DuellRegeln_Condition;
	information = DIA_Jarvis_DuelRules_Info;
	permanent = FALSE;
	description = " What are the dueling rules? " ;
};


func int DIA_Jarvis_DuellRegeln_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_DuelRules_Info()
{
	AI_Output(other,self, " DIA_Jarvis_DuellRegeln_15_00 " );	// What are the dueling rules?
	AI_Output(self,other, " DIA_Jarvis_DuellRegeln_04_01 " );	// Talk to Torlof, he'll explain everything if you're interested.
	AI_Output(self,other, " DIA_Jarvis_DuellRegeln_04_02 " );	// I want there to be no misunderstanding between us: I don't care if you stick to these rules or not. If only you can get these guys in the mud!
	B_LogEntry(TOPIC_JarvisSLDKo, " And I don't even have to follow those stupid duel rules... " );
};


instance DIA_Jarvis_SylviosMen(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_SylviosMen_Condition;
	information = DIA_Jarvis_SylviosMen_Info;
	permanent = FALSE;
	description = " Which of the mercenaries are Silvio's men? " ;
};


func int DIA_Jarvis_SylviosMen_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosMen_Info()
{
	AI_Output(other,self, " DIA_Jarvis_SylviosMen_15_00 " );	// Which of the mercenaries are Silvio's people?
	AI_Output(self,other, " DIA_Jarvis_SylviosMen_04_01 " );	// There are six of them. First of all, Silvio himself and his right hand Bulko.
	AI_Output(self,other, " DIA_Jarvis_SylviosMen_04_02 " );	// There is also Rod, Sentenza, Fester and Raul.
	AI_Output(self,other, " DIA_Jarvis_SylviosMen_04_03 " );	// The rest are either neutral or on Lee's side.
	B_LogEntry(TOPIC_JarvisSLDKo, " Silvio's people are Silvio himself, his right-hand man Bulko, Rod, Sentenza, Fester and Raul. " );
};


instance DIA_Jarvis_HowMany(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_HowMany_Condition;
	information = DIA_Jarvis_HowMany_Info;
	permanent = FALSE;
	description = " And how many of Silvio's men should I defeat? " ;
};


func int DIA_Jarvis_HowMany_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowMany_Info()
{
	AI_Output(other,self, " DIA_Jarvis_HowMany_15_00 " );	// And how many of Silvio's men do I have to defeat?
	AI_Output(self,other, " DIA_Jarvis_HowMany_04_01 " );	// If you knock out three of them, you'll prove which side you're on.
	AI_Output(self,other, " DIA_Jarvis_HowMany_04_02 " );	// Whom you choose is your business.
	AI_Output(self,other, " DIA_Jarvis_HowMany_04_03 " );	// I'll give you one hint: Don't try to be courageous. Do not oppose Silvio himself - he will make a cutlet out of you.
	B_LogEntry(TOPIC_JarvisSLDKo, " It's enough if I knock out three of Silvio's men. However, Silvio himself is best left alone for the time being. " );
};


instance DIA_Jarvis_HowManyLeft(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_HowManyLeft_Condition;
	information = DIA_Jarvis_HowManyLeft_Info;
	permanent = TRUE;
	description = " How many of Silvio's men do I need to put down? " ;
};

func int DIA_Jarvis_HowManyLeft_Condition()
{
	if((MIS_Jarvis_SldKO == LOG_Running) && Npc_KnowsInfo(other,DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowManyLeft_Info()
{
	var int victories;

	AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_00 " );	// How many of Silvio's men do I still need to put down?
	victories = 0;

	if ((Bullco.aivar[AIV_DefeatedByPlayer] ==  TRUE ) || (Bullco.aivar[AIV_KilledByPlayer] ==  TRUE ))
	{
		AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_01 " );	// I thrashed Bulko.
		AI_Output(self,other, " DIA_Jarvis_HowManyLeft_04_02 " );	// I heard. Not bad!
		victories = victories + 1;
	};
	if ((Rod.aivar[AIV_DefeatedByPlayer] ==  TRUE ) || (Rod.aivar[AIV_KilledByPlayer] ==  TRUE ))
	{
		AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_03 " );	// Rod now walks around badly shabby.
		victories = victories + 1;
	};
	if ((Sentenza.aivar[AIV_DefeatedByPlayer] ==  TRUE ) || (Sentenza.aivar[AIV_KilledByPlayer] ==  TRUE ))
	{
		if(Npc_KnowsInfo(other,DIA_Sentenza_Hello))
		{
			AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_04 " );	// Sentenza tried to shake the gold out of me - not a good idea.
		}
		else
		{
			AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_05 " );	// I knocked out Sentenza.
		};

		victories = victories + 1;
	};
	if ((Fester.aivar[AIV_DefeatedByPlayer] ==  TRUE ) || (Fester.aivar[AIV_KilledByPlayer] ==  TRUE ))
	{
		AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_07 " );	// Fester got what he deserved.
		victories = victories + 1;
	};
	if((Raoul.aivar[AIV_DefeatedByPlayer] == TRUE) || (Raoul.aivar[AIV_KilledByPlayer] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_08 " );	// As for Raul...
		}
		else
		{
			AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_09 " );	// I went to talk to Raul...
		};

		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//И?
		AI_Output(other,self, " DIA_Jarvis_HowManyLeft_15_11 " );	// It turned out that he badly needed a thrashing.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other, " DIA_Jarvis_HowManyLeft_04_12 " );	// You haven't knocked out any of Silvio's men yet.
		}
		else
		{
			AI_Output(self,other, " DIA_Jarvis_HowManyLeft_04_13 " );	// Okay, keep up the good work.
		};

		AI_Output(self,other, " DIA_Jarvis_HowManyLeft_04_14 " );	// I want you to knock out at least three of them.
	}
	else
	{
		AI_Output(self,other, " DIA_Jarvis_HowManyLeft_04_15 " );	// That's enough, quite enough.

		if(victories == 6)
		{
			AI_Output(self,other, " DIA_Jarvis_HowManyLeft_04_16 " );	// You cleaned their faces, yes?
		};

		AI_Output(self,other, " DIA_Jarvis_HowManyLeft_04_17 " );	// I'm amazed - if Lee asks my opinion, I'll vote for you without hesitation.
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_Murder] = FALSE ;
		B_GivePlayerXP(XP_Ambient * victories);
		B_LogEntry(TOPIC_SLDRespekt, " Jarvis will vote for me if I decide to join the mercenaries. " );
	};
};

instance DIA_Jarvis_ShieldTeach(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_ShieldTeach_Condition;
	information = DIA_Jarvis_ShieldTeach_Info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};

func int DIA_Jarvis_ShieldTeach_Condition()
{
	if((JarvisShieldTeach == FALSE) && ((MIS_Jarvis_SldKO == LOG_SUCCESS) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_ShieldTeach_Info()
{
	AI_Output(other,self, " DIA_Jarvis_ShieldTeach_01_00 " );	// Can you teach me something?

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Jarvis_ShieldTeach_01_01 " );	// Since you're one of us now, I can show you how to use a shield in combat.
		AI_Output(self,other, " DIA_Jarvis_ShieldTeach_01_02 " );	// This is a rather difficult task, as it may seem at first glance.
		AI_Output(self,other, " DIA_Jarvis_ShieldTeach_01_03 " );	// But when you understand a little what's what, you will understand - it's really worth it!
		AI_Output(other,self, " DIA_Jarvis_ShieldTeach_01_04 " );	// Sounds tempting. When do we start?
		AI_Output(self,other, " DIA_Jarvis_ShieldTeach_01_05 " );	// (chuckling) Not so fast, mate! First you have to pay me.
		AI_Output(self,other, " DIA_Jarvis_ShieldTeach_01_06 " );	// Just like that, out of the goodness of my heart, I won't teach you anything.
		AI_Output(self,other, " DIA_Jarvis_ShieldTeach_01_07 " );	// And you should also have at least a little experience so that my lessons do not become completely useless for you.
		AI_Output(other,self, " DIA_Jarvis_ShieldTeach_01_08 " );	// I understand everything. You can't continue.
		AI_Output(self,other, " DIA_Jarvis_ShieldTeach_01_09 " );	// Then just tell me when you're ready and we'll start training.
		JarvisShieldTeach = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher, " Jarvis can show me how to handle the shield. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Jarvis_ShieldTeach_01_10 " );	// No! As long as you're not one of us, I won't do this.
	};
};

instance DIA_Jarvis_Shield_Teach(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_Shield_Teach_Condition;
	information = DIA_Jarvis_Shield_Teach_Info;
	permanent = TRUE;
	description = " Teach me how to use a shield. (Training Points: 10, Cost: 1000 coins) " ;
};

func int DIA_Jarvis_Shield_Teach_Condition()
{
	if((JarvisShieldTeach == TRUE) && (hero.attribute[ATR_REGENERATEMANA] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Shield_Teach_Info()
{
	AI_Output(other,self, " DIA_Jarvis_Shield_Teach_15_00 " );	// Teach me how to use a shield.

	if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		B_GiveInvItems(other,self,ItMi_Gold,1000);
		Npc_RemoveInvItems(self,ItMi_Gold,1000);
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_01 " );	// Good! Listen carefully.
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_02 " );	// A shield is something that in difficult times can cover your ass from a fatal blow.
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_03 " );	// Not everyone knows how to handle a shield! But this knowledge is worth it.
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_04 " );	// Most importantly, try to keep your shield at eye level. Not lower and not higher.
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_05 " );	// This will simultaneously help you see your opponent and securely cover your body from a blow.
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_06 " );	// Sword strikes should be quick and short. Opened, struck and again covered himself with a shield!
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_07 " );	// The enemy will have to pretty rack their brains on how to pass your defense.
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_08 " );	// And sooner or later he will make a mistake, which you will have to use.
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_09 " );	// If you do it right, you will definitely become a master shield bearer someday!
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_10 " );	// One more thing... Take this wooden shield as a small gift.
		B_GiveInvItems(self,other,ItAr_Shield_01,1);
		AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_11 " );	// Suitable for the first workouts. Now you can go practice.
		AI_Print( " Shield combat trained! " );
		Snd_Play("LevelUP");
		hero.attribute[ATR_REGENERATEMANA] = TRUE;
		Npc_SetTalentSkill(hero,NPC_TALENT_RHETORIKA,1);
		Npc_SetTalentValue(hero,NPC_TALENT_RHETORIKA,hero.attribute[ATR_REGENERATEMANA]);
	}
	else
	{
		if(hero.lp < 10)
		{
			AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_16 " );	// You don't have enough experience, mate! I'm sorry.
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 1000)
		{
			AI_Output(self,other, " DIA_Jarvis_Shield_Teach_01_17 " );	// You don't have enough gold, mate! I'm sorry.
		};
	};
};

instance DIA_Jarvis_Shield_Teach_More(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_Shield_Teach_More_Condition;
	information = DIA_Jarvis_Shield_Teach_More_Info;
	permanent = TRUE;
	description = " Show me how to fight with a shield. " ;
};

func int DIA_Jarvis_Shield_Teach_More_Condition()
{
	if((JarvisShieldTeach == TRUE) && (hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] <= 100))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Shield_Teach_More_Info()
{
	AI_Output(other,self, " DIA_Jarvis_Shield_Teach_More_15_00 " );	// Show me how to fight with a shield.
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

func void DIA_Jarvis_Shield_Teach_More_Back()
{
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
};

func void DIA_Jarvis_Shield_Teach_More_1()
{
	B_TeachShield(self,other,1,100);
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

func void DIA_Jarvis_Shield_Teach_More_5()
{
	B_TeachShield(self,other,5,100);
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_PERM_Condition;
	information = DIA_Jarvis_PERM_Info;
	permanent = TRUE;
	description = " Any news? " ;
};

func int DIA_Jarvis_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_PERM_Info()
{
	AI_Output(other,self, " DIA_Jarvis_PERM_15_00 " );	// Any news?

	if (chapter <=  3 )
	{
		if(Jarvis_GuildComment == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other, " DIA_Jarvis_PERM_04_01 " );	// Now you're one of us. This is good.
			}
			else
			{
				AI_Output(self,other, " DIA_Jarvis_PERM_04_02 " );	// You made the wrong choice, you could be one of us.
			};
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jarvis_PERM_04_03 " );	// Lately, Silvio's people have been walking around a bit depressed.
		};
	};
	if (Chapter >=  4 )
	{
		if (Jarvis_SylvioComment ==  FALSE )
		{
			AI_Output(self,other, " DIA_Jarvis_PERM_04_04 " );	// Silvio is finally out! After he heard about the dragons, he and his boys went to the colony.
			AI_Output(self,other, " DIA_Jarvis_PERM_04_05 " );	// He probably thinks it will be better there.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jarvis_PERM_04_06 " );	// No, as long as everything is calm. I'm very interested in how it all ends.
		};
	};
};


instance DIA_Jarvis_PICKPOCKET(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 900;
	condition = DIA_Jarvis_PICKPOCKET_Condition;
	information = DIA_Jarvis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jarvis_PICKPOCKET_Condition()
{
	return  C_Robbery ( 41 , 55 );
};

func void DIA_Jarvis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice(DIA_Jarvis_PICKPOCKET,Dialog_Back,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jarvis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
};

func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
};
