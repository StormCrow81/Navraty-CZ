

instance DIA_GORNATOT_EXIT(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 999;
	condition = dia_gornatot_exit_condition;
	information = dia_gornatot_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornatot_exit_condition()
{
	return TRUE;
};

func void dia_gornatot_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_gornatot_PICKPOCKET(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 900;
	condition = dia_gornatot_PICKPOCKET_Condition;
	information = dia_gornatot_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_gornatot_PICKPOCKET_Condition()
{
	return  C_Robbery ( 15 , 35 );
};

func void dia_gornatot_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
	Info_AddChoice(dia_gornatot_PICKPOCKET,Dialog_Back,dia_gornatot_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornatot_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornatot_PICKPOCKET_DoIt);
};

func void dia_gornatot_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
};

func void dia_gornatot_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
};


instance DIA_GORNATOT_WHOYOU(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_whoyou_condition;
	information = dia_gornatot_whoyou_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_gornatot_whoyou_condition()
{
	if(PSI_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornatot_whoyou_info()
{
	AI_Output(other,self,"DIA_GorNaTot_WhoYou_01_00");	//Кто ты?
	AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_01 " );	// I am Gor Na Tof.
	AI_Output(other,self, " DIA_GorNaTot_WhoYou_01_02 " );	// What are you doing here?
	if((other.guild == GIL_NONE) || (other.guild == GIL_GUR) || (other.guild == GIL_TPL) || (other.guild == GIL_SEK))
	{
		AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_03 " );	// I'm in charge of training the Guardians of the Brotherhood.
		AI_Output(other,self, " DIA_GorNaTot_WhoYou_01_04 " );	// How is this learning going?
		AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_05 " );	// Not bad! But we still need people very badly.
		AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_06 " );	// Idol Parvez hangs around the city all day long, trying to find people worthy to accept our faith.
		AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_07 " );	// But most of the people he brings to camp are pretty much incapable of anything.
		AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_08 " );	// They don't even know how to properly hold a sword in their hands, not to mention the rest.
		AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_09 " );	// Although, of course, we are glad to new novices - for with each new follower our faith grows stronger!
	}
	else
	{
		AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_10 " );	// (annoyed) I'm currently answering your idiotic questions.
		AI_Output(self,other, " DIA_GorNaTot_WhoYou_01_11 " );	// So it's better if you leave me alone! It's clear?
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNATOT_MITMACHEN (C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 2;
	condition = dia_gornatot_mitmachen_condition;
	information = dia_gornatot_mitmachen_info;
	permanent = TRUE;
	description = " I want to join you! " ;
};


func int dia_gornatot_join_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornatot_whoyou) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_gornatot_join_info()
{
	AI_Output(other,self, " DIA_GorNaTot_Mitmachen_01_00 " );	// I want to join you!
	AI_Output(self,other, " DIA_GorNaTot_Mitmachen_01_01 " );	// Do you want to become a guardian? Yes, you do not have the audacity. You don't think we accept anyone who asks, do you?
	AI_Output(self,other, " DIA_GorNaTot_Mitmachen_01_02 " );	// Live in the Camp, and we'll see.
};


instance DIA_GORNATOT_REJECTING (C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 2;
	condition = dia_gornatot_repellent_condition;
	information = dia_gornatot_repellent_info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};


func int dia_gornatot_repellent_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornatot_whoyou) && (GORNATOTTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_repellent_info()
{
	AI_Output(other,self, " DIA_GorNaTot_Abweisend_01_00 " );	// Can you teach me something?
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_01 " );	// I only teach those who belong to the sacred circle of the Guardians of the Brotherhood!
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_02 " );	// Guru training is done by Idols - contact them.
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_03 " );	// I only teach those who belong to the sacred circle of the Guardians of the Brotherhood!
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_04 " );	// If you want to become one, talk to Gor Na Kosh. He will help you get on that path.
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_06 " );	// Since you are one of us, I will gladly teach you what I know.
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_07 " );	// I'll help you master Guardians' battle magic spells and increase your magic power to use these spells.
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_08 " );	// Of course, our magic is not comparable in strength and power to the sacred magic of the Guru...
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_09 " );	// ...however, despite this, she is still a good help in combat.
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_10 " );	// Plus, you don't need knowledge of magic circles to master it.
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_11 " );	// Tell me when you'd like to start your training, and we'll get started right away.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry( TOPIC_ADDON_TPLTEACHER , " Gor Na Toph will show me how to use the Guardians' battle magic and be able to increase my magic energy. " );
		GORNATOTTEACH = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_12 " );	// My lessons only apply to Guardians!
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_13 " );	// And you have the audacity to ask about this, even though you yourself do not even belong to our Brotherhood!
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_14 " );	// As long as you're not one of us, you don't even have to dream about it.
	}
	else
	{
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_15 " );	// My lessons don't apply to infidels!
		AI_Output(self,other, " DIA_GorNaTot_Abweisend_01_16 " );	// Get out!
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNATOT_TEACH_MANA(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 10;
	condition = dia_gornatot_teach_mana_condition;
	information = dia_gornatot_teach_mana_info;
	permanent = TRUE;
	description = " I want to increase my magical energy. " ;
};


func int dia_gornatot_teach_mana_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (other.attribute[ATR_MANA_MAX] < T_MED))
	{
		return TRUE;
	};
};

func void dia_gornatot_teach_mana_info()
{
	AI_Output(other,self, " DIA_GorNaTot_TEACH_MANA_15_00 " );	// I want to increase my magical energy.
	AI_Output(self,other, " DIA_GorNaTot_TEACH_MANA_15_01 " );	// The strength of the mind is as important as the strength and dexterity of a warrior's body.
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};

func void dia_gornatot_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other, " DIA_GorNaTot_TEACH_MANA_05_00 " );	// I can't help you with this anymore.
		AI_Output(self,other, " DIA_GorNaTot_TEACH_MANA_05_01 " );	// You're at your limits!
	};
	Info_ClearChoices(dia_gornatot_teach_mana);
};

func void dia_gornatot_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};

func void dia_gornatot_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};


instance DIA_GORNATOT_TEACHTPLRUNES(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 100;
	condition = dia_gornatot_teachtplrunes_condition;
	information = dia_gornatot_teachtplrunes_info;
	permanent = TRUE;
	description = " I want to master the combat magic of the Guardians. " ;
};


func int dia_gornatot_reachtplrunes_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (FIRSTTALKTPLMAGIC == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_teachtplrunes_info()
{
	AI_Output(other,self, " DIA_GorNaTot_TEACHTplRunes_01_00 " );	// I want to master the combat magic of the Guardians.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_01 " );	// Before we start training, let me tell you something.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_02 " );	// The principles of using Guardians' combat magic are similar to those that underlie any other magic.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_03 " );	// To use it, we use magic runes, which contain formulas with spells. But there are also differences...
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_05 " );	// The first thing you probably already know is that Guardian magic doesn't require you to wield magic circles.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_06 " );	// In addition, there are several ways to use it, or, as we call them, - Paths.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_07 " );	// Depending on which path you choose at the very beginning of your training, that direction of magic you can use in the future.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_09 " );	// Now I have to ask you the only question that you will have to answer me now.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_10 " );	// Think well before answering - you can't change your choice later.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_01_11 " );	// So: which path do you choose for yourself - the Path of the Healer or the Path of the Warrior?
	Info_ClearChoices(dia_gornatot_teachtplrunes);
	Info_AddChoice(dia_gornatot_teachtplrunes, " I choose the Path of the Healer. " ,dia_gornatot_teachtplrunes_heal);
	Info_AddChoice(dia_gornatot_teachtplrunes, " I choose the Path of the Warrior. " ,dia_gornatot_teachtplrunes_combat);
};

func void dia_gornatot_reachtplrunes_heal()
{
	AI_Output(other,self, " DIA_GorNaTot_TEACHTplRunes_Heal_01_00 " );	// I choose the Path of the Healer.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_Heal_01_01 " );	// Okay, you've made your choice, and with that, I give you the first rune of this path.
	B_GiveInvItems(self,other,itru_tplheal_00,1);
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_Heal_01_02 " );	// She will allow you to heal your wounds received in battles for the glory of the Brotherhood!
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_Heal_01_03 " );	// Be wise and prudent in its use. And don't forget what I told you.
	PSIWAYHEAL = TRUE;
	FIRSTTALKTPLMAGIC = TRUE;
	Info_ClearChoices(dia_gornatot_teachtplrunes);
};

func void dia_gornatot_reachtplrunes_combat()
{
	AI_Output(other,self, " DIA_GorNaTot_TEACHTplRunes_Combat_01_00 " );	// I choose the Path of the Warrior.
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_Combat_01_01 " );	// Okay, you've made your choice, and with that, I give you the first rune of this path.
	B_GiveInvItems(self,other,itru_tplstrike_00,1);
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_Combat_01_02 " );	// She will help you defeat your enemies!
	AI_Output(self,other, " DIA_GorNaTot_TEACHTplRunes_Combat_01_03 " );	// Be wise and prudent in its use. And don't forget what I told you.
	PSIWAYCOMBAT = TRUE;
	FIRSTTALKTPLMAGIC = TRUE;
	Info_ClearChoices(dia_gornatot_teachtplrunes);
};


instance DIA_GORNATOT_TEACHTPLNEXTRUNES(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 100;
	condition = dia_gornatot_teachtplnextrunes_condition;
	information = dia_gornatot_teachtplnextrunes_info;
	permanent = TRUE;
	description = " I want to continue my Guardian magic training. " ;
};

func int dia_gornatot_reachtplnextrunes_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (PSIWAYRUNECOMPLETE == FALSE) && ((PSIWAYHEAL == TRUE) || (PSIWAYCOMBAT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gornatot_teachtplnextrunes_info()
{
	var string concatText;

	AI_Output(other,self, " DIA_GorNaTot_TEACHTplNextRunes_01_00 " );	// I want to continue my Guardian magic training.
	if(PSIWAYHEAL == TRUE)
	{
		if (( PSIWAYHEALRUNE_01  ==  FALSE ) && (Capital >=  2 )) .
		{
			if(other.lp < 10)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(10));
				concatText = ConcatStrings(concatText, " learning points! " );
				AI_Print(concatText);
				AI_Print(PRINT_NotEnoughLearnPoints);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_01 " );	// I think you're ready to take the next step on your chosen path.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_02 " );	// And as a sign of my recognition of this right - accept this rune from me.
				other.lp = other.lp - 10;
				RankPoints = RankPoints + 10;
				B_GiveInvItems(self,other,itru_tplheal_01,1);
				PSIWAYHEALRUNE_01 = TRUE;
			};
		}
		else  if (( PSIWAYHEALRUNE_01  ==  TRUE ) && ( PSIWAYHEALRUNE_02  ==  FALSE ) && (Chapter >=  3 ))
		{
			if(other.lp < 15)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(15));
				concatText = ConcatStrings(concatText, " learning points! " );
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_03 " );	// I think you're ready to take the next step on your chosen path.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_04 " );	// And as a sign of my recognition of this right - accept this rune from me.
				other.lp = other.lp - 15;
				RankPoints = RankPoints + 15;
				B_GiveInvItems(self,other,itru_tplheal_02,1);
				PSIWAYHEALRUNE_02 = TRUE;
			};
		}
		else if((PSIWAYHEALRUNE_01 == TRUE) && (PSIWAYHEALRUNE_02 == TRUE) && (PSIWAYHEALRUNE_03 == FALSE) && (Kapitel >= 5))
		{
			if(other.lp < 20)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(20));
				concatText = ConcatStrings(concatText, " learning points! " );
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_05 " );	// I think you're ready to take the next step on your chosen path.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_06 " );	// And as a sign of my recognition of this right - accept this rune from me.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_07 " );	// This is the last spell of the Path of the Healer - I have nothing more to teach you.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_08 " );	// I hope you appreciate the knowledge you have gained!
				other.lp = other.lp - 20;
				RankPoints = RankPoints + 20;
				B_GiveInvItems(self,other,itru_tplheal_03,1);
				PSIWAYHEALRUNE_03 = TRUE;
				PSIWAYRUNECOMPLETE = TRUE;
			};
		}
		else
		{
			AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_09 " );	// You're not ready to receive the next Path of the Healer spell yet.
		};
	};
	if(PSIWAYCOMBAT == TRUE)
	{
		if (( PSIWAYCOMBATRUNE_01  ==  FALSE ) && (Capital >=  2 ))
		{
			if(other.lp < 10)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(10));
				concatText = ConcatStrings(concatText, " learning points! " );
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_10 " );	// I think you're ready to take the next step on your chosen path.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_11 " );	// And as a sign of my recognition of this right - accept this rune from me.
				other.lp = other.lp - 10;
				RankPoints = RankPoints + 10;
				B_GiveInvItems(self,other,itru_tplstrike_01,1);
				PSIWAYCOMBATRUNE_01 = TRUE;
			};
		}
		else  if (( PSIWAYCOMBATRUNE_01  ==  TRUE ) && ( PSIWAYCOMBATRUNE_02  ==  FALSE ) && (Capital >=  3 ))
		{
			if(other.lp < 15)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(15));
				concatText = ConcatStrings(concatText, " learning points! " );
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_12 " );	// I think you're ready to take the next step on your chosen path.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_13 " );	// And as a sign of my recognition of this right - accept this rune from me.
				other.lp = other.lp - 15;
				RankPoints = RankPoints + 15;
				B_GiveInvItems(self,other,itru_tplstrike_02,1);
				PSIWAYCOMBATRUNE_02 = TRUE;
			};
		}
		else  if (( PSIWAYCOMBATRUNE_01  ==  TRUE ) && ( PSIWAYCOMBATRUNE_02  ==  TRUE ) && ( PSIWAYCOMBATRUNE_03  ==  FALSE ) && (Capital >=  5 ))
		{
			if(other.lp < 20)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(20));
				concatText = ConcatStrings(concatText, " learning points! " );
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_14 " );	// I think you're ready to take the next step on your chosen path.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_15 " );	// And as a sign of my recognition of this right - accept this rune from me.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_16 " );	// This is the last spell of the Way of the Warrior - I have nothing more to teach you.
				AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_17 " );	// I hope you appreciate the knowledge you have gained!
				other.lp = other.lp - 20;
				RankPoints = RankPoints + 20;
				B_GiveInvItems(self,other,itru_tplstrike_03,1);
				PSIWAYCOMBATRUNE_03 = TRUE;
				PSIWAYRUNECOMPLETE = TRUE;
			};
		}
		else
		{
			AI_Output(self,other, " DIA_GorNaTot_TEACHTplNextRunes_01_18 " );	// You're not ready to receive the next Warrior Path spell yet.
		};
	};
};


instance DIA_GORNATOT_NamibSendTempler(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_NamibSendTempler_condition;
	information = dia_gornatot_NamibSendTempler_info;
	permanent = FALSE;
	description = " I came from the Namib Idol. " ;
};

func int dia_gornatot_NamibSendTempler_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibSendTempler == TRUE) && (AssInvationBegin == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_NamibSendTempler_info()
{
	AI_Output(other,self, " DIA_GorNaTot_NamibSendTempler_01_00 " );	// I came from the Namib Idol.
	AI_Output(self,other, " DIA_GorNaTot_NamibSendTempler_01_01 " );	// (calmly) What does our spirit guide want?
	AI_Output(other,self, " DIA_GorNaTot_NamibSendTempler_01_02 " );	// He wants you to send some guards to the bog harvester camps. They need to be secured as soon as possible.
	AI_Output(self,other, " DIA_GorNaTot_NamibSendTempler_01_03 " );	// (surprised) Why? Is there any threat to them?
	AI_Output(other,self, " DIA_GorNaTot_NamibSendTempler_01_04 " );	// Do you doubt Namib Idol's decision?
	AI_Output(self,other, " DIA_GorNaTot_NamibSendTempler_01_05 " );	// No, of course not. I just wondered - why did the Namib Idol need this?
	AI_Output(other,self, " DIA_GorNaTot_NamibSendTempler_01_06 " );	// You can ask him himself.
	AI_Output(self,other, " DIA_GorNaTot_NamibSendTempler_01_07 " );	// Okay, let's not waste time! I will immediately arrange for the dispatch of several guards to the collectors. You can pass it on to him.
	GorNaTotSendTemplers = TRUE;
	B_LogEntry(TOPIC_PrioratStart, " Gor Guard Trainer Na Tof was surprised by Namib's request, but promised to send some of his warriors to the gathering camps soon. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(TPL_8100_TEMPLER,"NW_PSICAMP_GUARDCAMP_00_01");
	Wld_InsertNpc(TPL_8101_TEMPLER,"NW_PSICAMP_GUARDCAMP_01_01");
	Wld_InsertNpc(TPL_8102_TEMPLER,"NW_PSICAMP_GUARDCAMP_02_01");
	Wld_InsertNpc(TPL_8103_TEMPLER,"NW_PSICAMP_GUARDCAMP_03_01");
	Wld_InsertNpc(TPL_8104_TEMPLER,"NW_PSICAMP_GUARDCAMP_04_01");
};

instance DIA_GORNATOT_LetsTrain(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_LetsTrain_condition;
	information = dia_gornatot_LetsTrain_info;
	permanent = FALSE;
	description = " What can you say about Tyrax? " ;
};

func int dia_gornatot_LetsTrain_condition()
{
	if(MIS_TrainInCamp == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gornatot_LetsTrain_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_GorNaTot_LetsTrain_01_00 " );	// What can you say about your apprentice Tyrax?
	AI_Output(self,other, " DIA_GorNaTot_LetsTrain_01_01 " );	// Thirax? I believe he is one of the finest warriors I have ever trained.
	AI_Output(self,other, " DIA_GorNaTot_LetsTrain_01_02 " );	// But, in my opinion, sometimes he lacks self-confidence, which leads to a loss of his concentration in battle.
	AI_Output(self,other, " DIA_GorNaTot_LetsTrain_01_03 " );	// He needs to learn to fully focus on the battle and not worry about what others think of him. Why are you asking?
	AI_Output(other,self, " DIA_GorNaTot_LetsTrain_01_04 " );	// Tyrax is currently at the Swamp Gatherer Camp with the other Guardians.
	AI_Output(self,other, " DIA_GorNaTot_LetsTrain_01_05 " );	// I know this because I sent it there myself.
	AI_Output(other,self, " DIA_GorNaTot_LetsTrain_01_06 " );	// So. It seems to me that they would do well to practice swordsmanship there.
	AI_Output(other,self, " DIA_GorNaTot_LetsTrain_01_07 " );	// This will be much more useful than spending all your free time standing at your post. But they need a mentor to train them.
	AI_Output(self,other, " DIA_GorNaTot_LetsTrain_01_08 " );	// Good idea. And I take it you want Tyrax to take care of it?
	AI_Output(other,self, " DIA_GorNaTot_LetsTrain_01_09 " );	// That's what I wanted to ask you. Tirax needs your consent to begin training.
	AI_Output(self,other, " DIA_GorNaTot_LetsTrain_01_10 " );	// Well, I don't mind at all. He is quite ready for this.
	GorNaTotAgreeTiraks = TRUE ;
	B_LogEntry(TOPIC_TrainInCamp, " Guardian Trainer Gor Na Tof has given his consent for Tirax to train guards at the Gatherer Camp. " );
};
