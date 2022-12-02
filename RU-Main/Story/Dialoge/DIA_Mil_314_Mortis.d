

instance DIA_Death_EXIT (C_Info)
{
	npc = Mil_314_Mortis;
	nr = 999;
	condition = DIA_Mortis_EXIT_Condition;
	information = DIA_Death_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DAY_Death_EXIT_Condition()
{
	return TRUE;
};

func void DAY_Death_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Mortis_Hello (C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Hallo_Condition;
	information = DIA_Mortis_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DAY_Death_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) == FALSE) && (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Hallo_Info()
{
	AI_Output(self,other, " DIA_Mortis_Hallo_13_00 " );	// What do you need? Peck is not here. And without it, you won't get anything. Come back later.
};


instance DIA_Mortis_Weapon (C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Waffe_Condition;
	information = DIA_Mortis_Weapon_Info;
	permanent = FALSE;
	description = " Where's Pek? " ;
};


func int DAY_Death_Waffe_Condition()
{
	if ((MY_Other_Peck == LOG_Running) && ((Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) ==  FALSE ) && (Chapter <  3 ))) ;
	{
		return TRUE;
	};
};

func void DIA_Mortis_Waffe_Info()
{
	AI_Output(other,self, " DIA_Mortis_Waffe_15_00 " );	// Where's Peck?
	AI_Output(self,other, " DIA_Mortis_Waffe_13_01 " );	// Have you just joined our ranks? Well then, welcome.
	AI_Output(self,other, " DIA_Mortis_Waffe_13_02 " );	// Peck left for the city a long time ago. I'm willing to bet he's courting Vanya in the Red Lantern.
};


instance DIA_Mortis_Paket (C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Paket_Condition;
	information = DIA_Mortis_Paket_Info;
	permanent = FALSE;
	description = " Do you know anything about a bale of weed? " ;
};


func int DIA_Mortis_Paket_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Package_Info()
{
	AI_Output(other,self, " DIA_Mortis_Paket_15_00 " );	// Do you know anything about a bale of weed?
	AI_Output(self,other, " DIA_Mortis_Paket_13_01 " );	// Hmm... the last time I was in the port tavern, I heard Cardiff talking about this with some guy.
	AI_Output(other,self, " DIA_Mortis_Paket_15_02 " );	// Who is this guy?
	AI_Output(self,other, " DIA_Mortis_Paket_13_03 " );	// I have no idea. But he said he found a great place to store the herb - and then they neighed like drunken orcs for a long time.
	B_LogEntry(TOPIC_Warehouse, " Mortis overheard the Cardiff innkeeper and someone else talking about a bale at the harbor tavern. They were discussing where best to store it. " );
};


instance DIA_Mortis_Redlight(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Redlight_Condition;
	info = DIA_Mortis_Redlight_Info;
	permanent = FALSE;
	description = " Do you know the harbor area well? " ;
};


func int DAY_Death_Redlight_Condition()
{
	if (MIS_Andre_REDLIGHT == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Redlight_Info()
{
	AI_Output(other,self, " DIA_Mortis_Redlight_15_00 " );	// Do you know the harbor area well? I want to find someone who sells swamp grass.
	AI_Output(self,other, " DIA_Mortis_Redlight_13_01 " );	// Well... The people there aren't particularly talkative, and they certainly won't say anything to the city guard.
	AI_Output(self,other, " DIA_Mortis_Redlight_13_02 " );	// If you want to find out anything out there, you'd better... no, you MUST take off your armor.
	AI_Output(other,self, " DIA_Mortis_Redlight_15_03 " );	// OK, what's next?
	AI_Output(self,other, " DIA_Mortis_Redlight_13_04 " );	// A tavern and a brothel are probably the best places to look. If you manage to learn anything at all, you will learn it there.
	B_LogEntry(TOPIC_Redlight, " Mortis thinks that if I want to buy marsh grass in the waterfront, I'd better take off all my armor. The best thing to do is try my luck at a tavern or a brothel. " );
};


instance DIA_Mortis_CanTeach(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = DIA_Mortis_CanTeach_Condition;
	information = DIA_Mortis_CanTeach_Info;
	permanent = TRUE;
	description = " I want to get stronger. " ;
};


func int DIA_Mortis_CanTeach_Condition()
{
	if(Mortis_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Mortis_CanTeach_15_00 " );	// I want to get stronger.

	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Mortis_CanTeach_13_01 " );	// Got it! If you have enough experience, I can train you.
		Mortis_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher, " Mortis the city guard can help me increase my strength. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Mortis_CanTeach_13_02 " );	// Of course you do! But until you become one of us or a paladin, I will not help you.
	};
};

instance DIA_Mortis_Trade(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 80;
	condition = DIA_Mortis_Trade_Condition;
	information = DIA_Mortis_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " What can you offer? " ;
};

func int DAY_Death_Trade_Condition()
{
	if(Wld_IsTime(7,0,23,59) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Addon_Martin_Trade_15_00 " );	// What can you suggest?

	if((MilBelt_01 == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_MIL)))
	{
		CreateInvItems(self,ItBE_Addon_MIL_01,1);
		MilBelt_01 = TRUE;
	};
	if((MilBelt_02 == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_MIL)))
	{
		CreateInvItems(self,ItBE_Addon_MIL_02,1);
		MilBelt_02 = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
};

instance DIA_Mortis_Teach(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 100;
	condition = DIA_Mortis_Teach_Condition;
	information = DIA_Mortis_Teach_Info;
	permanent = TRUE;
	description = " I want to get stronger. " ;
};

func int DIA_Mortis_Teach_Condition()
{
	if(Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Teach_Info()
{
	AI_Output(other,self, " DIA_Mortis_Teach_15_00 " );	// I want to get stronger.
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output(self,other, " DIA_Mortis_Teach_13_00 " );	// You're strong enough as it is. If you aspire to more, find yourself another teacher.
	};
	Info_ClearChoices(DIA_Mortis_Teach);
};

func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};


instance DIA_Mortis_PICKPOCKET(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 900;
	condition = DIA_Mortis_PICKPOCKET_Condition;
	information = DIA_Mortis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mortis_PICKPOCKET_Condition()
{
	return  C_Robbery ( 38 , 60 );
};

func void DIA_Mortis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,Dialog_Back,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};


instance DIA_MORTIS_ARMORCANTEACH(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = dia_mortis_armorcanteach_condition;
	information = dia_mortis_armorcanteach_info;
	permanent = TRUE;
	description = " How about some better armor? " ;
};

func int dia_mortis_armorcanteach_condition()
{
	if((MORTIS_TEACHARMOR == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_mortis_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Mortis_ArmorCanTeach_01_00 " );	// How about better armor?
	AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_01 " );	// What kind of armor?
	AI_Output(other,self, " DIA_Mortis_ArmorCanTeach_01_02 " );	// You're a blacksmith, and you probably know how to forge armor. Is not it?
	AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_03 " );	// So what?
	AI_Output(other,self, " DIA_Mortis_ArmorCanTeach_01_04 " );	// Well, I thought that maybe you could sell or forge for me a better armor than what I'm wearing right now.
	AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_05 " );	// Hmm...(laughs) Yes, I make armor for militia soldiers. But even though you're one of us, I can't sell you anything.
	AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_06 " );	// Lord Andre will screw my head off if he finds out about this. No man, forget it!
	AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_07 " );	// But... if you really need it, I could show you how to upgrade some armor.
	AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_08 " );	// True, for this you must at least understand a little about forging.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Mortis_ArmorCanTeach_01_09 " );	// Yes, I know a little about this stuff.
		AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_10 " );	// I see, I see... (laughs) Good! But just keep in mind, my lessons are not free. So if you don't have gold, don't even think about bothering me!
		AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_11 " );	// Anyway, just tell me when you're ready. And we will begin your training.
	}
	else
	{
		AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_12 " );	// And I see that you don't even know how to handle a blacksmith's hammer properly.
		AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_13 " );	// Go learn to forge first. And then we'll talk about your armor.
		AI_Output(self,other, " DIA_Mortis_ArmorCanTeach_01_14 " );	// And keep in mind, my lessons are not free. So if you don't have gold, don't even think about bothering me!
	};
	MORTIS_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ARMORTEACHER , " Mortis can teach me how to upgrade city militia armor. " );
};

func void b_mortis_teacharmor_1()
{
	AI_Output(self,other, " DIA_Mortis_TeachArmor_1_01_01 " );	// Okay, look carefully how it's done. Get the materials you need and...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_KASERN_ARMORY_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Mortis_TeachArmor_1_01_02 " );	// ...on the anvil, you add them in the desired sequence to the heated steel billet...
		AI_Output(self,other, " DIA_Mortis_TeachArmor_1_01_03 " );	// ...after which you give it the necessary shape and fasten it with the existing armor...
		AI_Output(self,other, " DIA_Mortis_TeachArmor_1_01_04 " );	// ...this is how I do it now...(shows)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_05");	//...вот и все!
		AI_Output(self,other, " DIA_Mortis_TeachArmor_1_01_06 " );	// Now you can try it yourself.
	};
};

func void b_mortis_teacharmor_2()
{
	AI_Output(self,other, " DIA_Mortis_TeachArmor_2_01_01 " );	// Great. Remember carefully everything that I will show you now. First of all, you need to have on hand all the materials for forging...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_KASERN_ARMORY_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Mortis_TeachArmor_2_01_02 " );	// ...you take a hot steel billet and break it into several component parts...
		AI_Output(self,other, " DIA_Mortis_TeachArmor_2_01_03 " );	// ...in a certain sequence, mixing each part with the next material...
		AI_Output(self,other, " DIA_Mortis_TeachArmor_2_01_04 " );	// ...then you forge them into the frame of the existing armor, especially carefully forging the exit points. So, you see ... (shows)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Mortis_TeachArmor_2_01_05 " );	// ...and all that business!
		AI_Output(self,other, " DIA_Mortis_TeachArmor_2_01_06 " );	// Nothing complicated, trust me. The main thing is to remember the correct sequence of actions.
	};
};

func void b_mortisarmorchoices()
{
	Info_ClearChoices(dia_mortis_armorteach);
	Info_AddChoice(dia_mortis_armorteach,Dialog_Back,dia_mortis_armorteach_back);

	if(PLAYER_TALENT_SMITH[13] == FALSE)
	{
		Info_AddChoice(dia_mortis_armorteach, " Militia Armor (Training Cost: 500 coins) " ,dia_mortis_armorteach_itar_mil_l_v1);
	};
	if((PLAYER_TALENT_SMITH[14] == FALSE) && (SHOW_ITAR_MIL_M == TRUE))
	{
		Info_AddChoice(dia_mortis_armorteach, " Heavy Militia Armor (Training Cost: 1000 coins) " ,dia_mortis_armorteach_itar_mil_m_v1);
	};
};

instance DIA_MORTIS_ARMORTEACH(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = dia_mortis_armorteach_condition;
	information = dia_mortis_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};

func int dia_mortis_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (MORTIS_TEACHARMOR == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		if((PLAYER_TALENT_SMITH[14] == FALSE) || (PLAYER_TALENT_SMITH[13] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_mortis_armorteach_info()
{
	AI_Output(other,self, " DIA_Mortis_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.

	if (Wld_IsTime( 7 , 10 , 20 , 59 ))
	{
		AI_Output(self,other, " DIA_Mortis_ArmorTeach_01_01 " );	// Good. What do you want to know?
		b_mortisarmorchoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Mortis_ArmorTeach_01_02 " );	// Guy, but now it's night in the yard! And besides, I have already finished work for today.
		AI_Output(self,other, " DIA_Mortis_ArmorTeach_01_03 " );	// And then, where do you think I will explain and show all this to you ... (laughs)
		AI_Output(self,other, " DIA_Mortis_ArmorTeach_01_04 " );	// Come back in the morning when I'm at the forge. Then we'll talk about it.
	};
};

func void dia_mortis_armorteach_back()
{
	Info_ClearChoices(dia_mortis_armorteach);
};

func void dia_mortis_armorteach_itar_mil_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_mortis_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Mortis_TeachArmor_01_00 " );	// But you don't have enough gold! Didn't I tell you about this?
	};
	b_mortisarmorchoices();
};

func void dia_mortis_armorteach_itar_mil_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			b_mortis_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Mortis_TeachArmor_01_00 " );	// But you don't have enough gold! Didn't I tell you about this?
	};
	b_mortisarmorchoices();
};
