
instance DIA_Ulthar_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ulthar_NoEnter_PissOff (C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 1;
	condition = DIA_Ulthar_NoEnter_PissOff_Condition;
	information = DIA_Ulthar_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Ulthar_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Ulthar_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Ulthar_GREET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_GREET_Condition;
	information = DIA_Ulthar_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulthar_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_GREET_Info()
{
	AI_Output(self,other, " DIA_Ulthar_GREET_05_00 " );	// Listen, the new acolyte must appear before the High Council. May Innos be with you, my son.
	AI_Output(other,self, " DIA_Ulthar_GREET_15_01 " );	// And what are the tasks of the High Council?
	AI_Output(self,other, " DIA_Ulthar_GREET_05_02 " );	// It is our duty to proclaim the will of Innos. According to his will, we name selected acolytes who must pass the Trial of Magic.
	AI_Output(self,other, " DIA_Ulthar_GREET_05_03 " );	// Although we lead a secluded life, we follow the events in the world, since the church of Innos represents the highest law on earth.
	AI_Output(other,self, " DIA_Ulthar_GREET_15_04 " );	// Ah, so you wonder what's going on in the world...
	AI_Output(other,self, " DIA_Ulthar_GREET_15_05 " );	// What do you think of these dragons that are devastating the Valley of Mines with their army that is growing day by day?
	AI_Output(self,other, " DIA_Ulthar_GREET_05_06 " );	// I understand that your heart is burning with anger, but we must first weigh your words before we take any steps.
	AI_Output(self,other, " DIA_Ulthar_GREET_05_07 " );	// If we allow ourselves to get carried away and act hastily, we won't achieve anything. Therefore, carry out your tasks, while we discuss what can be done.
};


instance DIA_Ulthar_MAGETEST (C_Info) .
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_MAGETEST_Condition;
	information = DIA_Ulthar_MAGETEST_Info;
	description = " Tell me about the Trial of Magic. " ;
};


func int DIA_Ulthar_MAGETEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_GREET))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_MAGETEST_Info()
{
	AI_Output(other,self, " DIA_Ulthar_MAGETEST_15_00 " );	// Tell me about the Trial of Magic.
	AI_Output(self,other, " DIA_Ulthar_MAGETEST_05_01 " );	// This is a chance for a chosen acolyte to join the Mages Guild. But only one can pass this test.
	AI_Output(self,other, " DIA_Ulthar_MAGETEST_05_02 " );	// And Innos alone chooses novices for him.
};


instance DIA_Ulthar_WHEN(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 3;
	condition = DIA_Ulthar_WHEN_Condition;
	information = DIA_Ulthar_WHEN_Info;
	permanent = TRUE;
	description = " When will this test be over? " ;
};


func int DIA_Ulthar_WHEN_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Ulthar_MAGETEST ) && ( KNOWS_FIRE_CONTEST  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_WHEN_Info()
{
	AI_Output(other,self, " DIA_Ulthar_WHEN_15_00 " );	// When will this test take place?
	AI_Output(self,other, " DIA_Ulthar_WHEN_05_01 " );	// As soon as we hear the will of Innos, we will inform our chosen acolytes and conduct a test.
};


instance DIA_Ulthar_TEST(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 10;
	condition = DIA_Ulthar_TEST_Condition;
	information = DIA_Ulthar_TEST_Info;
	permanent = FALSE;
	description = " I'm ready to take your test, master. " ;
};


func int DIA_Ulthar_TEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_TEST_Info()
{
	AI_Output(other,self, " DIA_Ulthar_TEST_15_00 " );	// I'm ready to pass your test, master.
	AI_Output(self,other, " DIA_Ulthar_TEST_05_01 " );	// I'm not surprised you know this old law.
	AI_Output(self,other, " DIA_Ulthar_TEST_05_02 " );	// But I suspect you don't realize the risk you're putting yourself at. Remember that an impatient spirit will not endure the Trial by Fire.
	AI_Output(self,other, " DIA_Ulthar_TEST_05_03 " );	// It's been a long time since anyone has been subjected to this test. And only one person managed to pass it and stay alive.
	AI_Output(self,other, " DIA_Ulthar_TEST_05_04 " );	// Then he was a young and ambitious acolyte, and now he is a longtime and permanent member of the High Council - I'm talking about Serpentes.
	AI_Output(other,self, " DIA_Ulthar_TEST_15_05 " );	// He won't be the only one to pass this test for long.
	AI_Output(self,other, " DIA_Ulthar_TEST_05_06 " );	// Then I won't try your patience anymore. Here is my test for you:
	AI_Output(self,other, " DIA_Ulthar_TEST_05_07 " );	// Create a 'fire arrow' rune. That's all - so help you Innos.
	MIS_RUNE = LOG_Running;
	Log_CreateTopic(TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rune,LOG_Running);
	B_LogEntry(TOPIC_Rune, " Ultar has given me a challenge. I must create a Firebolt rune. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_RUNNING(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 10;
	condition = DIA_Ulthar_RUNNING_Condition;
	information = DIA_Ulthar_RUNNING_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Ulthar_RUNNING_Condition()
{
	if((MIS_RUNE == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(other,ItRu_FireBolt) == 0))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_RUNNING_Info()
{
	AI_Output(self,other, " DIA_Ulthar_RUNNING_05_00 " );	// You know your task. Take care of her.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SUCCESS(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_SUCCESS_Condition;
	information = DIA_Ulthar_SUCCESS_Info;
	permanent = FALSE;
	description = " I created a rune! " ;
};


func int DIA_Ulthar_SUCCESS_Condition()
{
	if((MIS_RUNE == LOG_Running) && (Npc_HasItems(hero,ItRu_FireBolt) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SUCCESS_Info()
{
	AI_Output(other,self, " DIA_Ulthar_SUCCESS_15_00 " );	// I created a rune!
	AI_Output(self,other, " DIA_Ulthar_SUCCESS_05_01 " );	// Excellent, novice. Keep it - your first rune.
	AI_Output(self,other, " DIA_Ulthar_SUCCESS_05_02 " );	// When you reach the first Circle of Fire, you can use it.
	AI_Output(self,other, " DIA_Ulthar_SUCCESS_05_03 " );	// You passed this test to my full satisfaction.
	if((MIS_GOLEM == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE))
	{
		AI_Output(self,other, " DIA_Ulthar_SUCCESS_05_04 " );	// But the dangerous test that Serpentes has prepared is still waiting for you!
	};
	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP(XP_RUNE);
};


instance DIA_Ulthar_KAP3_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP3_EXIT_Condition;
	information = DIA_Ulthar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances of DIA_Ulthar_PermAbKap3 (C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 99;
	condition = DIA_Ulthar_PermAbKap3_Condition;
	information = DIA_Ulthar_PermAbKap3_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_Ulthar_PermAbKap3_Condition()
{
	if ((Capital >=  3 ) || Npc_KnowsInfo(other,DIA_Ulthar_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_PermAbKap3_Info()
{
	AI_Output(other,self, " DIA_Ulthar_PermAbKap3_15_00 " );	// Any news?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Ulthar_PermAbKap3_05_01 " );	// Not yet. Go and do your work. You still have a lot to do.
	}
	else
	{
		AI_Output(self,other, " DIA_Ulthar_PermAbKap3_05_02 " );	// No. Nothing you don't already know, brother.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SHINEPOISONED (C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information = DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important = TRUE;
};


func int DIA_Ulthar_SCHREINEVERGIFTET_Condition()
{
	if ((Peter_Traitor ==  TRUE ) && (DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SHINEPOISONED_Info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_00 " );	// One more thing. Some roadside altars dedicated to Innos were defiled by the enemy. They have lost their magical properties.
		AI_Output(other,self, " DIA_Ulthar_SCHREINEVERGIFTET_15_01 " );	// I understand, now what?
		AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_02 " );	// You must clear these altars before the situation worsens.
		CreateInvItems(self,ItMi_UltharsHolyWater_Mis,1);
		B_GiveInvItems(self,other,ItMi_UltharsHolyWater_Mis,1);
		AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_03 " );	// Take this holy water and sprinkle it on the base of the altar.
		AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_04 " );	// With the holy words of cleansing, the altar will return to its former strength.
		if(Npc_HasItems(other,itwr_map_shrine_mis_1) == FALSE)
		{
			if(Npc_HasItems(Gorax,itwr_map_shrine_mis_1) && (Npc_IsDead(Gorax) == FALSE))
			{
				AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_05 " );	// Gorax can sell you a map with our altars marked on it.
			}
			else
			{
				AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_06 " );	// Here is the map. The altars built by us are marked on it.
				CreateInvItems(self,itwr_map_shrine_mis_1,1);
				B_GiveInvItems(self,other,itwr_map_shrine_mis_1,1);
			};
		};
		AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_07 " );	// Now go and do your errands.
		MIS_Ulthar_HeileSchreine_PAL = LOG_Running;
		Log_CreateTopic(TOPIC_Ulthar_HeileSchreine_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL,LOG_Running);
		B_LogEntry(TOPIC_Ulthar_HeileSchreine_PAL, " Ulthar has given me a mission to purify all altars defiled by the enemy with holy water. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_08 " );	// One more thing. Stay away from roadside altars. We heard that some of them were desecrated.
		AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_09 " );	// Nobody knows how they operate now.
		AI_Output(self,other, " DIA_Ulthar_SCHREINEVERGIFTET_05_10 " );	// You don't have to worry about this problem. The paladins will take care of her.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Ulthar_ShrinesHealed (C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SchreineHealed_Condition;
	information = DIA_Ulthar_SchrineHealed_Info;
	description = " I have cleared all the altars. " ;
};


func int DIA_Ulthar_ShrinesHealed_Condition()
{
	if(MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_ShrinesHealed_Info()
{
	B_GivePlayerXP(XP_Ulthar_SchreineGereinigt);
	AI_Output(other,self, " DIA_Ulthar_SchreineGeheilt_15_00 " );	// I cleared all the altars.
	AI_Output(self,other, " DIA_Ulthar_SchreineGeheilt_05_01 " );	// Excellent, my son. I'm proud of you. Let the attention of Innos not leave you.
	AI_Output(self,other, " DIA_Ulthar_SchreineGeheilt_05_02 " );	// Take this Amulet of Strength, it can be useful to you in your battles with the enemy.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM))
	{
		CreateInvItems(self,ItAm_Hp_Mana_01,1);
		B_GiveInvItems(self,other,ItAm_Hp_Mana_01,1);
	}
	else
	{
		CreateInvItems(self,ItAm_Dex_Strg_01, 1 );
		B_GiveInvItems(self,other,ItAm_Dex_Strg_01,1);
	};

	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP4_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP4_EXIT_Condition;
	information = DIA_Ulthar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SchreineGeheiltNoPAL (C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information = DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important = TRUE;
};


func int DIA_Ulthar_ShrineHealedNoPAL_Condition()
{
	if ((MIS_Ulthar_HeileSchreine_PAL ==  FALSE ) && (Chapter >=  5 ) && (DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_ShrinesHealedNoPAL_Info()
{
	AI_Output(self,other, " DIA_Ulthar_SchreineGeheiltNoPAL_05_00 " );	// Good news. Roadside altars cleared. The power of Innos helped the paladins remove this problem.
	AI_Output(self,other, " DIA_Ulthar_SchreineGeheiltNoPAL_05_01 " );	// You can again bring gifts to Innos without any reservations or restrictions.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP5_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP5_EXIT_Condition;
	information = DIA_Ulthar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP6_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP6_EXIT_Condition;
	information = DIA_Ulthar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_PICKPOCKET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 900;
	condition = DIA_Ulthar_PICKPOCKET_Condition;
	information = DIA_Ulthar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ulthar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 74 , 320 );
};

func void DIA_Ulthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET,Dialog_Back,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};

func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};


instance DIA_ULTHAR_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 1;
	condition = dia_ulthar_runemagicnotwork_condition;
	information = dia_ulthar_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_ulthar_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulthar_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Ulthar_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Ulthar_RuneMagicNotWork_01_01 " );	// No. They do not work! And the reason for this is not clear to me.
	AI_Output(other,self, " DIA_Ulthar_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_Ulthar_RuneMagicNotWork_01_03 " );	// Others, I'm sure, will tell you the same thing. It is unlikely that such an out of the ordinary problem has bypassed one of us.
	AI_Output(other,self, " DIA_Ulthar_RuneMagicNotWork_01_04 " );	// Got it.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};

