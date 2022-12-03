

instance DIA_Vatras_DI_EXIT (C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 999;
	condition = DIA_Vatras_DI_EXIT_Condition;
	information = DIA_Vatras_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances of DIA_Vatras_DI_HEAL (C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_HEAL_Condition;
	information = DIA_Vatras_DI_HEAL_Info;
	permanent = TRUE;
	description = " Heal me. " ;
};


func int DIA_Vatras_DI_HEAL_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_HEAL_Info()
{
	AI_Output(other,self, " DIA_Vatras_DI_HEAL_15_00 " );	// Heal me.

	if(DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE)
	{
		if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
		{
			AI_Output(self,other, " DIA_Vatras_DI_HEAL_05_01 " );	// Adanos, bless him! He will be the one to restore the balance of the world.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
		}
		else
		{
			AI_Output(self,other, " DIA_Vatras_DI_HEAL_05_02 " );	// Your body is intact!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_00 " );	// Get out of my sight, killer! Don't expect any more help from me.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Vatras_DI_TRADE (C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 12;
	condition = DIA_Vatras_DI_TRADE_Condition;
	information = DIA_Vatras_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Can you sell me something? " ;
};

func int DIA_Vatras_DI_TRADE_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Vatras_DI_TRADE_15_00 " );	// Can you sell me something to sell?

	if(DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE)
	{
		AI_Output(self,other, " DIA_Vatras_DI_TRADE_05_01 " );	// What do you need?
		B_GiveTradeInv(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_00 " );	// Get out of my sight, killer! Don't expect any more help from me.
		AI_StopProcessInfos(self);
	};	
};


DIA_Vatras_DI_OBSESSION (C_Info) instances
{
	npc = VLK_439_Vatras_DI;
	nr = 35;
	condition = DIA_Vatras_DI_OBSESSION_Condition;
	information = DIA_Vatras_DI_OBSESSION_Info;
	permanent = TRUE;
	description = " Help me. I'm obsessed! " ;
};


func int DIA_Vatras_DI_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Vatras_DI_OBSESSION_Info_OneTime;

func void DIA_Vatras_DI_OBSESSION_Info()
{
	AI_Output(other,self, " DIA_Vatras_DI_OBSESSION_15_00 " );	// Help me. I'm obsessed!

	if(DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE)
	{
		if(Got_HealObsession_Day <= (Wld_GetDay() - 2))
		{
			if(DIA_Vatras_DI_OBSESSION_Info_OneTime <= 1)
			{
				CreateInvItems(self,ItPo_HealObsession_MIS,1);
				DIA_Vatras_DI_OBSESSION_Info_OneTime = DIA_Vatras_DI_OBSESSION_Info_OneTime +  1 ;
			};
			if(Npc_HasItems(self,ItPo_HealObsession_MIS))
			{
				AI_Output(self,other, " DIA_Vatras_DI_OBSESSION_05_01 " );	// Take this Potion of Liberation. Pyrokar gave me some of these healing elixirs at my request.
				AI_Output(self,other, " DIA_Vatras_DI_OBSESSION_05_02 " );	// However, remember that my ability to rid you of your nightmares is limited.
				B_GiveInvItems(self,other,ItPo_HealObsession_MIS,1);
				Got_HealObsession_Day = Wld_GetDay();
			}
			else
			{
				AI_Output(self,other, " DIA_Vatras_DI_OBSESSION_05_03 " );	// The Pyrocar's supplies are depleted. I'm very sorry, my friend. I can't help you anymore.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Vatras_DI_OBSESSION_05_04 " );	// I won't take the risk of giving you another bottle in such a short time. Come back later, my friend.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_00 " );	// Get out of my sight, killer! Don't expect any more help from me.
		AI_StopProcessInfos(self);
	};
};


DIA_Vatras_DI_RAT (C_Info) instances
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_RAT_Condition;
	information = DIA_Vatras_DI_RAT_Info;
	description = " What advice can you give me? " ;
};

func int DIA_Vatras_DI_RAT_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (SC_IsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_RAT_Info()
{
	AI_Output(other,self, " DIA_Vatras_DI_RAT_15_00 " );	// What advice can you give me?
	AI_Output(self,other, " DIA_Vatras_DI_RAT_05_01 " );	// Stay away from the dark wanderers! Remember that their black gaze can cause you serious damage here, far from the monastery.
	if (Npc_HasItems(other,ItAm_Prot_BlackEye_Mis))
	{
		AI_Output(other,self, " DIA_Vatras_DI_RAT_15_02 " );	// Don't worry, I have an amulet to protect against their gaze.
	};
	AI_Output(self,other, " DIA_Vatras_DI_RAT_05_03 " );	// If something happens to you, come to me. I'll see what i can do.
};


instance DIA_Vatras_DI_PEDROTOT (C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 3;
	condition = DIA_Vatras_DI_PEDROTOT_Condition;
	information = DIA_Vatras_DI_PEDROTOT_Info;
	description = " I found the traitor Pedro. " ;
};

func int DIA_Vatras_DI_PEDROTOT_Condition()
{
	if((MIS_Gorax_KillPedro == LOG_SUCCESS) || (PEDROWITHUS == TRUE))
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_PEDROTOT_VatrasSucked;

func void DIA_Vatras_DI_PEDROTOT_Info()
{
	AI_Output(other,self, " DIA_Vatras_DI_PEDROTOT_15_00 " );	// I found the traitor Pedro.
	B_GivePlayerXP(XP_Ambient);

	if ((MIS_Gorax_KillPedro ==  LOG_SUCCESS ) && Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self, " DIA_Vatras_DI_PEDROTOT_15_01 " );	// He's dead.
		AI_Output(self,other, " DIA_Vatras_DI_PEDROTOT_05_02 " );	// I'm extremely disappointed. I didn't expect this from you.
		AI_Output(other,self, " DIA_Vatras_DI_PEDROTOT_15_03 " );	// What do you mean?
		AI_Output(self,other, " DIA_Vatras_DI_PEDROTOT_05_04 " );	// I know about your disgusting deal with Serpentes. I am deeply shocked that I was so wrong about you.
		DIA_Vatras_DI_PEDROTOT_VatrasSucked = TRUE ;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_DI_PEDROTOT_05_05 " );	// Then bring him here to the ship. We will hand him over to the Khorinis authorities.

		if (Npc_IsDead(Pedro_DI))
		{
			AI_Output(other,self, " DIA_Vatras_DI_PEDROTOT_15_06 " );	// It's a little late for this! He is dead.
			AI_Output(self,other, " DIA_Vatras_DI_PEDROTOT_05_07 " );	// Oh... (surprised) What a pity! I will pray for his poor soul.
		}
		else
		{
			if(MIS_Gorax_KillPedro == LOG_Running)
			{
				AI_Output(other,self, " DIA_Vatras_DI_PEDROTOT_05_08 " );	// I already did that. But now I have one small problem.
				AI_Output(self,other, " DIA_Vatras_DI_PEDROTOT_05_09 " );	// Problem? If you mean the task that Serpentes gave you, then you can calm down, there is no problem with that.
				AI_Output(other,self, " DIA_Vatras_DI_PEDROTOT_05_10 " );	// How?! You know?
				AI_Output(self,other, " DIA_Vatras_DI_PEDROTOT_05_11 " );	// Yes, I know about your agreement with him. And I'll tell you honestly - you did the right thing not to kill Pedro.
				AI_Output(other,self, " DIA_Vatras_DI_PEDROTOT_05_12 " );	// But how will the Firebenders react to this?
				AI_Output(self,other, " DIA_Vatras_DI_PEDROTOT_05_13 " );	// This is not your problem anymore. Don't worry - I'll talk to Serpentes myself and sort out this misunderstanding.
				AI_Output(other,self, " DIA_Vatras_DI_PEDROTOT_05_14 " );	// Okay, whatever you say.

				if((PEDROWITHUS == TRUE) && (MIS_Gorax_KillPedro == LOG_Running))
				{
					B_GivePlayerXP(500);
					MIS_Gorax_KillPedro = LOG_SUCCESS;
					Log_SetTopicStatus(Topic_Gorax_KillPedro,LOG_SUCCESS);
					B_LogEntry(Topic_Gorax_KillPedro, " Vatras told me that I did the right thing by keeping Pedro alive. Turns out he knew about my deal with Serpentes and was waiting for me to do it. " );

					if(MIS_TraitorPedro == LOG_Running)
					{
						MIS_TraitorPedro = LOG_SUCCESS;
						Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
					};
				};
			};
		};
	};
};

instance DIA_Vatras_DI_Talent (C_Info)
{
	npc = VLK_439_Vatras_DI;
	condition = DIA_Vatras_DI_Talente_Condition;
	information = DIA_Vatras_DI_Talente_Info;
	permanent = TRUE;
	description = " Teach me what you know yourself. " ;
};

func int DIA_Vatras_DI_Talente_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_Talent_Info()
{
	AI_Output(other,self, " DIA_Vatras_DI_Talente_15_00 " );	// Teach me your abilities.

	if(DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE)
	{
		AI_Output(self,other, " DIA_Vatras_DI_Talente_05_01 " );	// I'll do my best.
		Info_ClearChoices(DIA_Vatras_DI_Talente);
		Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);

		if ((hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_GUR ))
		{
			Info_AddChoice(DIA_Vatras_DI_Talente, " Learn Magic Circles " ,DIA_Vatras_DI_Talente_CIRCLES);
		};

		Info_AddChoice(DIA_Vatras_DI_Talente, " Learn Alchemy " ,DIA_Vatras_DI_Talente_ALCHIMIE);
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_00 " );	// Get out of my sight, killer! Don't expect any more help from me.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Vatras_DI_Talente_CIRCLES()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(Day_Back_Talent,B_BuildLearnString( " 1 Month " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 1 )),Day_Back_Talent_Circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(Day_Back_Talent,B_BuildLearnString( " 2 Months " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 2 )),Day_Back_Talent_Circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(Day_Back_Talent,B_BuildLearnString( " 3 Months " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 3 )),Day_Back_Talent_Circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(Day_Back_Talent,B_BuildLearnString( " 4 Months " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 4 )),Day_Back_Talent_Circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(Day_Back_Talent,B_BuildLearnString( " 5 Months " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 5 )),Day_Back_Talent_Circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(Day_Back_Talent,B_BuildLearnString( " 6 Months " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 6 )),Day_Back_Talent_Circle_6);
	};
};

func void DIA_Vatras_DI_Talente_ALCHEMIE()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Healing Essence " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_01)),DIA_Vatras_DI_Talente_POTION_Health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Healing Extract " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_02)),DIA_Vatras_DI_Talente_POTION_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(DIA_Talent_Strings,b_buildlearnstringforalchemy( " вЂ‹вЂ‹вЂ‹вЂ‹вЂ‹вЂ‹вЂ‹вЂ‹ , B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_03)),DIA_Talent_String_POTION_03_);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Ессенция маны " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_01)),DIA_Vatras_DI_Talente_POTION_Mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Екстракт маны " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_02)),DIA_Vatras_DI_Talente_POTION_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Эликсир маны " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_03)),DIA_Vatras_DI_Talente_POTION_Mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Boost Drink " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Speed)),DIA_Vatras_DI_Talente_POTION_Speed);
	}
	else if(PLAYER_TALENT_ALCHEMY[15] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Double Speed ​​Drink " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY , POTION_SPEED_02 )),dia_vatras_di_talente_potion_speed_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Elixir of Power " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_STR)),DIA_Vatras_DI_Talente_POTION_Perm_STR);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Elixir of Agility " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_DEX)),DIA_Vatras_DI_Talente_POTION_Perm_DEX);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy( " Эликсир духа " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_Mana)),DIA_Vatras_DI_Talente_POTION_Perm_Mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Vatras_DI_Talente_POTION_Perm_Health);
	};
};

func void DIA_Vatras_DI_Talente_Circle_1()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,1);
};

func void DIA_Vatras_DI_Talente_Circle_2()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,2);
};

func void DIA_Vatras_DI_Talente_Circle_3()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,3);
};

func void DIA_Vatras_DI_Talente_Circle_4()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,4);
};

func void DIA_Vatras_DI_Talente_Circle_5()
{
	AI_Output(self,other, " DIA_Vatras_DI_Talente_Circle_5_05_00 " );	// Now you're a mage of the fifth circle! Use the spells you've learned for good.
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,5);
};

func void DIA_Vatras_DI_Talente_Circle_6()
{
	AI_Output(self,other, " DIA_Vatras_DI_Talente_Circle_6_05_00 " );	// Now reached the highest peaks in magic.
	AI_Output(self,other, " DIA_Vatras_DI_Talente_Circle_6_05_01 " );	// Let your hand be guided by reason, and your human weaknesses will be under deep control. They cannot obscure your vision.
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,6);
};

func void DIA_Vatras_DI_Talente_POTION_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Vatras_DI_Talente_POTION_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Vatras_DI_Talente_POTION_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void DIA_Vatras_DI_Talent_POTION_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Vatras_DI_Talent_POTION_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Vatras_DI_Talent_POTION_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Vatras_DI_Talent_POTION_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void dia_vatras_di_talente_potion_speed_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_SPEED_02);
};

func void DIA_Vatras_DI_Talent_POTION_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void DIA_Vatras_DI_Talent_POTION_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};

func void DIA_Vatras_DI_Talent_POTION_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void DIA_Vatras_DI_Talent_BACK()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
};

instances of DIA_Vatras_DI_DementorObsessionBook (C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_DementorObsessionBook_Condition;
	information = DIA_Vatras_DI_DementorObsessionBook_Info;
	permanent = TRUE;
	description = " I have an Almanac of the Possessed. " ;
};

func int DIA_Vatras_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_DementorObsessionBook_OneTime;

func void DIA_Vatras_DI_DementorObsessionBook_Info()
{
	AI_Output(other,self, " DIA_Vatras_DI_DementorObsessionBook_15_00 " );	// I have an almanac of the possessed.
	if(DIA_Vatras_DI_DementorObsessionBook_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Vatras_DI_DementorObsessionBook_05_01 " );	// I think it's best if I take him to Pirokar's monastery! If, of course, we manage to get out of here.
		DIA_Vatras_DI_DementorObsessionBook_OneTime = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_DI_DementorObsessionBook_05_02 " );	// Do you have more? Bring me whatever you find.
	};

	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	Npc_RemoveInvItems(self,ITWR_DementorObsessionBook_MIS,Npc_HasItems(self,ITWR_DementorObsessionBook_MIS));
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Vatras_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_UndeadDragonDead_Condition;
	information = DIA_Vatras_DI_UndeadDragonDead_Info;
	permanent = FALSE;
	description = " I did it! " ;
};

func int DIA_Vatras_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

var int DIA_Vatras_DI_UndeadDragonDead_OneTime;

func void DIA_Vatras_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Vatras_DI_UndeadDragonDead_15_00 " );	// I did it!

	if(DIA_Vatras_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Vatras_DI_UndeadDragonDead_05_01 " );	// I know, I feel it.
		AI_Output(self,other, " DIA_Vatras_DI_UndeadDragonDead_05_02 " );	// You've dealt a blow to Beliar that he won't recover from soon.

		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self, " DIA_Vatras_DI_UndeadDragonDead_15_03 " );	// Can I calm down now, or do you mages have another skeleton in the closet that needs to be banished from this world?
		}
		else
		{
			AI_Output(self,other, " DIA_Vatras_DI_UndeadDragonDead_05_04 " );	// Remember that this was just an episode in the eternal battle between Good and Evil.
		};

		AI_Output(self,other, " DIA_Vatras_DI_UndeadDragonDead_05_05 " );	// Evil always finds a way to get into this world. This war will never end.

		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other, " DIA_Vatras_DI_UndeadDragonDead_05_06 " );	// As a warrior of Good, you must understand this.
		};

		AI_Output(self,other, " DIA_Vatras_Add_05_15 " );	// Only one Adanos stands between the warring gods and maintains a delicate balance!
		AI_Output(other,self, " DIA_Vatras_Add_15_16 " );	// It would be better if he helped me.
		AI_Output(self,other, " DIA_Vatras_Add_05_17 " );	// He did just that - rest assured.
		DIA_Vatras_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output(self,other, " DIA_Vatras_DI_UndeadDragonDead_05_09 " );	// Tell the captain to raise anchor as fast as possible! Short-term peace can be a sham.
};
