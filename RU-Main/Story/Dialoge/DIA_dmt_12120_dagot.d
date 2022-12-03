

instance DMT_12120_DAGOT_EXIT(C_Info)
{
	npc = dmt_12120_dagot;
	nr = 999;
	condition = dmt_12120_dagot_exit_condition;
	information = dmt_12120_dagot_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12120_dagot_exit_condition()
{
	return TRUE;
};

func void dmt_12120_dagot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12120_DAGOT_HELLO(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_hello_condition;
	information = dmt_12120_dagot_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12120_dagot_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (TELLWELCOMEDONE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;

		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other, " DMT_12120_Dagot_Hello_01 " );	// (smartly) So, here you are. Welcome to our abode, hero!
			AI_Output(self,other, " DMT_12120_Dagot_Hello_02 " );	// From now on, I will be your mentor.
			AI_Output(self,other, " DMT_12120_Dagot_Hello_03 " );	// The rest of the Guardians will also keep a close eye on your fate. But no more!
			AI_Output(self,other, " DMT_12120_Dagot_Hello_04 " );	// From now on, only Darkness is your destiny, and now you serve only Darkness. Remember it!
			AI_Output(other,self, " DMT_12120_Dagot_Hello_05 " );	// Yes, master! I got it.
			AI_Output(self,other, " DMT_12120_Dagot_Hello_06 " );	// (smartly) Good.
			TELLWELCOMEDONE = TRUE;
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other, " DMT_12120_Dagot_Hello_07 " );	// You should contact Guardian Stonnos, adept!
			AI_Output(self,other, " DMT_12120_Dagot_Hello_08 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12120_Dagot_Hello_09 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12120_Dagot_Hello_10 " );	// Now go!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other, " DMT_12120_Dagot_Hello_11 " );	// You should contact Guardian Vakon, adept!
			AI_Output(self,other, " DMT_12120_Dagot_Hello_08 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12120_Dagot_Hello_09 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12120_Dagot_Hello_10 " );	// Now go!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other, " DMT_12120_Dagot_Hello_15 " );	// You should contact Guardian Kelios, adept!
			AI_Output(self,other, " DMT_12120_Dagot_Hello_08 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12120_Dagot_Hello_09 " );	// I can't help you anymore.
			AI_Output(self,other, " DMT_12120_Dagot_Hello_10 " );	// Now go!
			AI_StopProcessInfos(self);
		};
	}
	else if(CHOOSEDARK == TRUE)
	{
		AI_Output(self,other, " DMT_12120_Dagot_Hello_19 " );	// (smartly) So, here you are. Welcome to our abode, hero!
		AI_Output(self,other, " DMT_12120_Dagot_Hello_20 " );	// From now on, I will be your mentor.
		AI_Output(self,other, " DMT_12120_Dagot_Hello_21 " );	// The rest of the Guardians will also keep a close eye on your fate. But no more!
		AI_Output(self,other, " DMT_12120_Dagot_Hello_22 " );	// From now on, only Darkness is your destiny, and now you serve only Darkness. Remember it!
		AI_Output(other,self, " DMT_12120_Dagot_Hello_23 " );	// Yes, master! I got it.
		TELLWELCOMEDONE = TRUE;
	}
	else
	{
		AI_Output(self,other, " DMT_12120_Dagot_Hello_24 " );	// You already know what you should do.
		AI_Output(self,other, " DMT_12120_Dagot_Hello_10 " );	// Now go!
		AI_StopProcessInfos(self);
	};
};


instance DMT_12120_DAGOT_WHATTEACH(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_whatteach_condition;
	information = dmt_12120_dagot_whatteach_info;
	permanent = TRUE;
	description = " What can I learn from you? " ;
};


func int dmt_12120_dagot_whatteach_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == FALSE) && (GUARDIANTEACHMEWAR == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_whatteach_info()
{
	AI_Output(other,self, " DMT_12120_Dagot_WhatTeach_00 " );	// Can you teach me magic?

	if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_GUR ))
	{
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_01 " );	// Since you are now my apprentice, I can teach you the magic bestowed upon me by my creator.
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_03 " );	// We call it Dark magic. This knowledge is sacred, and few possessed it.
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_04 " );	// Only the elect were allowed to know them, and if you wish, you will soon become one of their number too!
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_06 " );	// In addition, knowledge of magic circles is also a necessary condition for their knowledge. But I can teach you that too, if you wish!
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_24 " );	// And one more thing... Since you are now an adept of our circle, accept this acolyte's magic robe from me.
		CreateInvItems(self,itar_haradrimmage,1);
		B_GiveInvItems(self,other,itar_haradrimmage,1);
		GUARDIANTEACHMEMAGIC = TRUE;
		B_LogEntry( TOPIC_GUARDIANS , " Guardian Dagoth will be able to teach me Dark magic. If I decide to start my training, I should just talk to him about it. " );
		AI_StopProcessInfos(self);
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_SLD) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_10 " );	// Since you are a warrior, I can hardly teach you the magic bestowed upon me by my creator.
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_11 " );	// However, you can talk to Tarinax, master of the Asgardians, the elemental warriors.
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_12 " );	// I think it will help you in your studies.
		AI_Output(other,self, " DMT_12120_Dagot_WhatTeach_13 " );	// Okay, I'll do that.
		GUARDIANTEACHMEWAR = TRUE;
		B_LogEntry( TOPIC_GUARDIANS , " To begin my training, I should speak to Tarinax, master of the Asgardians, the elemental warriors. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_14 " );	// Nothing yet. You are not yet ready to know all the wisdom given to the Guardians!
		AI_Output(self,other, " DMT_12120_Dagot_WhatTeach_15 " );	// You're still too weak! Come back when you're ready and I'll tell you our secrets.
	};
};


instance DMT_12120_DAGOT_HELLOBACK(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_helloback_condition;
	information = dmt_12120_dagot_helloback_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12120_dagot_helloback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TELLWELCOMEDONE == TRUE) && (CHOOSENATUREISDONE == TRUE) && (GUARDIANTEACHMEWAR == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_helloback_info()
{
	AI_Output(self,other, " DMT_12120_Dagot_HelloBack_01 " );	// You already know what you should do.
	AI_Output(self,other, " DMT_12120_Dagot_Hello_10 " );	// Now go!
	AI_StopProcessInfos(self);
};


instance DMT_12120_DAGOT_EXPLAINCIRCLES(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_explaincircles_condition;
	information = dmt_12120_dagot_explaincircles_info;
	permanent = FALSE;
	description = " Explain to me what is the meaning of Magic Circles? " ;
};


func int dmt_12120_dagot_explaincircles_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_explaincircles_info()
{
	AI_Output(other,self, " DMT_12120_Dagot_EXPLAINCIRCLES_Info_15_01 " );	// Explain to me what the meaning of magic circles is?
	AI_Output(self,other, " DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_02 " );	// Good. Circles symbolize your understanding of magic.
	AI_Output(self,other, " DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_03 " );	// They indicate the level of your knowledge and skills, the ability to learn new spells.
	AI_Output(self,other, " DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_04 " );	// You must complete each Circle before you can enter the next one.
	AI_Output(self,other, " DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_05 " );	// It will take long hours of study and a lot more experience to reach the higher Circles.
	AI_Output(self,other, " DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_06 " );	// Your efforts will be rewarded with powerful new spells every time. But in any case, magic Circles mean much more.
	AI_Output(self,other, " DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_07 " );	// In order to understand their power, you must know yourself.
	EXPLAINCIRCLEMEAN = TRUE;
};

var int day_dmt_12120_dagot_circle_noperm;

instance DIA_DMT_12120_DAGOT_CIRCLE(C_Info)
{
	npc = dmt_12120_dagot;
	nr = 99;
	condition = dia_dmt_12120_dagot_circle_condition;
	information = dia_dmt_12120_dagot_circle_info;
	permanent = TRUE;
	description = " I want to learn the essence of magic. " ;
};

func int dia_dmt_12120_dagot_circle_condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE ) <=  6 ) && ( CHOOSEDARK  ==  TRUE ) && ( TELLWELCOMEDONE  ==  TRUE ) && ( GUARDIANTEACHMEMAGIC  ==  TRUE ) && ( DIA_DMT_12120_DAGOT_CIRCLE_NOPERM  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_circle_info()
{
	AI_Output(other,self, " DIA_DMT_12120_Dagot_CIRCLE_15_00 " );	// I want to understand the essence of magic.
	Info_ClearChoices(DIA_DMT_12120_DAGOT_CIRCLE);
	Info_AddChoice(DIA_DMT_12120_DAGOT_CIRCLE,Dialog_Back,DIA_DMT_12120_DAGOT_CIRCLE_Back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice( DIA_DMT_12120_DAGOT_CIRCLE , " 1 Circle of Magic (Training Points: 20) " , DIA_DMT_12120_DAGOT_CIRCLE_1 );
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice( DIA_DMT_12120_DAGOT_CIRCLE , " 2 Circle of Magic (Training Points: 30) " , DIA_DMT_12120_DAGOT_CIRCLE_2 );
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice( DIA_DMT_12120_DAGOT_CIRCLE , " 3 Circle of Magic (Training Points: 40) " , DIA_DMT_12120_DAGOT_CIRCLE_3 );
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice( DIA_DMT_12120_DAGOT_CIRCLE , " 4 Circle of Magic (Training Points: 60) " , DIA_DMT_12120_DAGOT_CIRCLE_4 );
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice( DIA_DMT_12120_DAGOT_CIRCLE , " 5 Circle of Magic (Training Points: 80) " , DIA_DMT_12120_DAGOT_CIRCLE_5 );
	}
	else  if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE ) ==  5 ) && (Chapter >=  5 ) && (MY_DarkOrder == LOG_Success) && (MY_JarCurse == LOG_Success) && ( MY_URNAZULRAGE  ==  LOG_SUCCESS )) ;
	{
		Info_AddChoice( DIA_DMT_12120_DAGOT_CIRCLE , " 6 Circle of Magic (Training Points: 100) " , DIA_DMT_12120_DAGOT_CIRCLE_6 );
	}
	else
	{
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_42 " );	// You're not ready for this yet! Come back later.
	};
};

func void DIA_DMT_12120_Dagot_CIRCLE_Back()
{
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12120_Dagot_CIRCLE_15_01 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_01 " );	// By joining the First Circle, you will learn how to use magical runes.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_02 " );	// Each rune contains the structure of a special magic spell.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_03 " );	// By using your own magical power, you can release the rune's magic.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_04 " );	// But unlike scrolls, which are essentially magic formulas, rune magic maintains the structure of the spell at all times.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_05 " );	// Each rune contains a magical power that you can take away at any time.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_06 " );	// Just like with the scroll, the moment you use a rune, your own magic power is consumed.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_07 " );	// With each new Circle you will learn more and more about runes.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_08 " );	// Use their power to know yourself.
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12120_Dagot_CIRCLE_15_02 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_09 " );	// You've already learned to understand runes. It's time to deepen your knowledge.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_10 " );	// As you enter the Second Circle, you will learn the basics of powerful combat spells.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_11 " );	// But in order to know the true secrets of magic, you have a lot to learn.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_12 " );	// You already know that you can use any rune countless times, but only until you use up your own magic power.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_13 " );	// But before you do anything, think about whether it makes sense. You have the power to sow death and destruction with ease.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_14 " );	// But a true magician uses it only when necessary.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_15 " );	// Learn to assess the situation, and you will know the true power of the runes.
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12120_Dagot_CIRCLE_15_03 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_16 " );	// The Third Circle is one of the most important stages in the life of every magician. When you reach it, you complete your search.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_17 " );	// You have already crossed a significant stage on the path of magic. You have learned how to use runes.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_18 " );	// This knowledge will serve as the basis for the next step. Use runes carefully.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_19 " );	// You can use them or not. But you must make a choice.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_20 " );	// Once you've made your choice, use your power without hesitation.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_21 " );	// Find your way, and then you will know the power of decision.
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12120_Dagot_CIRCLE_15_04 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_22 " );	// You have completed the first three Circles. It's time for you to learn the secrets of magic.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_23 " );	// The basis of rune magic is stone. A magical stone mined from magical ore.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_24 " );	// This is the same ore that is mined in the mines. In the temples, she is endowed with magical formulas, and there the runes turn into tools of our power.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_25 " );	// You now have all the knowledge that the temples have accumulated.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_27 " );	// Learn magic and you will discover the secret of power.
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12120_Dagot_CIRCLE_15_05 " );	// Yes, master. I'm ready.
		AI_Output(other,self, " DIA_DMT_12120_Dagot_CIRCLE_15_5A " );	// So be it. I will reveal to you the true meaning of the Fifth Circle.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_31 " );	// Know your limits, and you will know your true power.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_32 " );	// The spells you can learn can be truly devastating.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_33 " );	// So know the measure of your strength and beware of megalomania.
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_34 " );	// I will lift you up to the Sixth Circle of Magic.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_35 " );	// Note that only the most powerful of magicians can enter the Sixth Circle. It is for those whose life is a sign.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_38 " );	// As you already know, your sign is Darkness!
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_39 " );	// The Sixth Circle will allow you to use the magic of any rune.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_40 " );	// And don't forget: don't capture power, but be its source.
		AI_Output(self,other, " DIA_DMT_12120_Dagot_CIRCLE_14_41 " );	// Be wise and prudent in your deeds!
		DIA_DMT_12120_DAGOT_CIRCLE_NOPERM = TRUE ;
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

instance DIA_DMT_12120_DAGOT_TEACH_MANA(C_Info)
{
	npc = dmt_12120_dagot;
	nr = 10;
	condition = dia_dmt_12120_dagot_teach_mana_condition;
	information = dia_dmt_12120_dagot_teach_mana_info;
	permanent = TRUE;
	description = " I want to increase my magical energy. " ;
};


func int dia_dmt_12120_dagot_teach_mana_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (hero.attribute[ATR_MANA_MAX] < T_MEGA))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_teach_mana_info()
{
	AI_Output(other,self, " DIA_DMT_12120_Dagot_TEACH_MANA_15_00 " );	// I want to increase my magical energy.
	Info_ClearChoices(dia_dmt_12120_dagot_teach_mana);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,Dialog_Back,dia_dmt_12120_dagot_teach_mana_back);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12120_dagot_teach_mana_1);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12120_dagot_teach_mana_5);
};

func void dia_dmt_12120_dagot_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other, " DIA_DMT_12120_Dagot_TEACH_MANA_05_00 " );	// You're at your limits!
	};
	Info_ClearChoices(dia_dmt_12120_dagot_teach_mana);
};

func void dia_dmt_12120_dagot_teach_mana_1()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_dmt_12120_dagot_teach_mana);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,Dialog_Back,dia_dmt_12120_dagot_teach_mana_back);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12120_dagot_teach_mana_1);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12120_dagot_teach_mana_5);
};

func void dia_dmt_12120_dagot_teach_mana_5()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_dmt_12120_dagot_teach_mana);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,Dialog_Back,dia_dmt_12120_dagot_teach_mana_back);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12120_dagot_teach_mana_1);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12120_dagot_teach_mana_5);
};


instance DIA_DMT_12120_DAGOT_RUNEN (C_Info)
{
	npc = dmt_12120_dagot;
	nr = 99;
	condition = dia_dmt_12120_dagot_runen_condition;
	information = dia_dmt_12120_dagot_runen_info;
	permanent = TRUE;
	description = " Teach me how to create runes of darkness. " ;
};


func int dia_dmt_12120_dagot_runen_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_runen_info()
{
	AI_Output(other,self, " DIA_DMT_12120_Dagot_Runen_15_00 " );	// Teach me how to create runes of darkness.
	AI_Output(self,other, " DIA_DMT_12120_Dagot_Runen_15_01 " );	// Good! What exactly would you like to know?
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen, " 6 Circle of Magic " ,dia_dmt_12120_dagot_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen, " 5 Circle of Magic " ,dia_dmt_12120_dagot_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen, " 4 Circle of Magic " ,dia_dmt_12120_dagot_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen, " 3 Circle of Magic " ,dia_dmt_12120_dagot_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen, " 2 Circle of Magic " ,dia_dmt_12120_dagot_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen, " 1 Circle of Magic " ,dia_dmt_12120_dagot_runen_1);
	};
};

func void dia_dmt_12120_dagot_runen_back()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
};

func void dia_dmt_12120_dagot_runen_dem()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);
	if((PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE) && (XARDASTEACHCASTDEMON == TRUE))
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),dia_dmt_12120_dagot_runen_circle_4_spl_summondemon);
	};
};

func void dia_dmt_12120_dagot_runen_1()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathbolt] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Deathbolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathbolt)),dia_dmt_12120_dagot_runen_circle_1_spl_deathbolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),dia_dmt_12120_dagot_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Rage] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Rage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Rage)),dia_dmt_12120_dagot_runen_circle_1_spl_Rage);
	};
};

func void dia_dmt_12120_dagot_runen_2()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ManaForLife] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_ManaForLife,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ManaForLife)),dia_dmt_12120_dagot_runen_circle_2_spl_suckenergy);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonZombie] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_SummonZombie,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonZombie)),dia_dmt_12120_dagot_runen_circle_2_spl_summonzombie);
	};
	if(PLAYER_TALENT_RUNES[SPL_Lacerate] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Lacerate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Lacerate)),dia_dmt_12120_dagot_runen_circle_2_spl_Lacerate);
	};
};

func void dia_dmt_12120_dagot_runen_3()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Swarm] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Swarm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Swarm)),dia_dmt_12120_dagot_runen_circle_3_spl_swarm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),dia_dmt_12120_dagot_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Energyball] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_BeliarsRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Energyball)),dia_dmt_12120_dagot_runen_circle_4_spl_energyball);
	};
};

func void dia_dmt_12120_dagot_runen_4()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathball] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Deathball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathball)),dia_dmt_12120_dagot_runen_circle_5_spl_deathball);
	};
};

func void dia_dmt_12120_dagot_runen_5()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),dia_dmt_12120_dagot_runen_circle_5_spl_armyofdarkness);
	};
};

func void dia_dmt_12120_dagot_runen_6()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),dia_dmt_12120_dagot_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Skull] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Skull,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Skull)),dia_dmt_12120_dagot_runen_circle_6_spl_skull);
	};
};


func void dia_dmt_12120_dagot_runen_circle_1_spl_Rage()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Rage);
};

func void dia_dmt_12120_dagot_runen_circle_2_spl_Lacerate()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Lacerate);
};

func void dia_dmt_12120_dagot_runen_circle_1_spl_deathbolt()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Deathbolt);
};

func void dia_dmt_12120_dagot_runen_circle_1_spl_summongoblinskeleton()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SummonGoblinSkeleton);
};

func void dia_dmt_12120_dagot_runen_circle_2_spl_suckenergy()
{
	b_teachplayertalentrunesguardians(self,other,SPL_ManaForLife);
};

func void dia_dmt_12120_dagot_runen_circle_2_spl_summonzombie()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SummonZombie);
};

func void dia_dmt_12120_dagot_runen_circle_3_spl_swarm()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Swarm);
};

func void dia_dmt_12120_dagot_runen_circle_3_spl_summonskeleton()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SummonSkeleton);
};

func void dia_dmt_12120_dagot_runen_circle_4_spl_energyball()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Energyball);
};

func void dia_dmt_12120_dagot_runen_circle_4_spl_summondemon()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SummonDemon);
};

func void dia_dmt_12120_dagot_runen_circle_5_spl_deathball()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Deathball);
};

func void dia_dmt_12120_dagot_runen_circle_5_spl_armyofdarkness()
{
	b_teachplayertalentrunesguardians(self,other,SPL_ArmyOfDarkness);
};

func void dia_dmt_12120_dagot_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunesguardians(self,other,SPL_MassDeath);
};

func void dia_dmt_12120_dagot_runen_circle_6_spl_skull()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Skull);
};


instance DIA_DMT_12120_DAGOT_GIVEARMORGUARDIANS(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dia_dmt_12120_dagot_givearmorguardians_condition;
	information = dia_dmt_12120_dagot_givearmorguardians_info;
	permanent = FALSE;
	description = " I will go to the Halls of Irdorath! " ;
};


func int dia_dmt_12120_dagot_givearmorguardians_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_givearmorguardians_info()
{
	AI_Output(other,self, " DIA_DMT_12120_Dagot_GiveArmorGuardians_01_01 " );	// I will go to the Halls of Irdorath. Can I count on your help?
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveArmorGuardians_01_02 " );	// Keepers never interfere in the course of divine strife. You know.
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveArmorGuardians_01_03 " );	// But we cannot look at your fate indifferently either. After all, you are almost one of us!
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveArmorGuardians_01_04 " );	// Therefore, accept this humble gift from me as our goodwill.
	B_GiveInvItems(self,other,ItPo_GuardiansElixir,1);
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveArmorGuardians_01_06 " );	// This is a little of what we can offer you. The rest depends only on you!
	AI_Output(other,self, " DIA_DMT_12120_Dagot_GiveArmorGuardians_01_07 " );	// Thank you master.
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveArmorGuardians_01_08 " );	// Now go, chosen of the Elements! You still have a lot to do for the good of this world.
	AI_StopProcessInfos(self);
};


instance DIA_DMT_12120_DAGOT_GIVEELIGORRUNE(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dia_dmt_12120_dagot_giveeligorrune_condition;
	information = dia_dmt_12120_dagot_giveeligorrune_info;
	permanent = FALSE;
	description = " I can learn all this from other mages. " ;
};


func int dia_dmt_12120_dagot_giveeligorrune_condition()
{
	if((CHOOSEDARK == TRUE) && (DemonologSkill[0] == 6) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_giveeligorrune_info()
{
	AI_Output(other,self, " DIA_DMT_12120_Dagot_GiveEligorRune_01_01 " );	// I can learn all this from other magicians.
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveEligorRune_01_02 " );	// (seriously) And what do you need?
	AI_Output(other,self, " DIA_DMT_12120_Dagot_GiveEligorRune_01_03 " );	// Is this really all the secret knowledge that the Guardians are ready to tell me? I think you keep other secrets as well.
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveEligorRune_01_06 " );	// The first thing you need to understand is that each of the elements is the creator of some different creatures inhabiting the limits of this world.
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveEligorRune_01_07 " );	// These creatures completely and completely obey the will of their creators and sometimes even serve them. We, the Guardians, are also subject to this power!
	AI_Output(other,self, " DIA_DMT_12120_Dagot_GiveEligorRune_01_08 " );	// Can I own it?
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveEligorRune_01_09 " );	// Here, take this rune! She holds magic that hardly anyone else but us knows about.
	CreateInvItems(self,itru_eligordemons, 1 );
	B_GiveInvItems(self,other,itru_eligordemons, 1 );
	AI_Output(other,self, " DIA_DMT_12120_Dagot_GiveEligorRune_01_10 " );	// What is this rune?
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveEligorRune_01_11 " );	// With its help, you will be able to summon into this world creatures who are undividedly devoted to us and know no equal in their strength.
	AI_Output(other,self, " DIA_DMT_12120_Dagot_GiveEligorRune_01_12 " );	// Who are these beings?
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveEligorRune_01_13 " );	// Demons! The demons of the Burning Legion of Eligor, Lord of Lang!
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveEligorRune_01_14 " );	// These creatures have served us faithfully for millennia. Now they will serve you!
	AI_Output(self,other, " DIA_DMT_12120_Dagot_GiveEligorRune_01_15 " );	// However, remember that all power comes to an end if it is not used wisely. This is not a warning, just advice.
	AI_StopProcessInfos(self);
};


instance DMT_12120_DAGOT_TASKS(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_tasks_condition;
	information = dmt_12120_dagot_tasks_info;
	permanent = FALSE;
	description = " Do you have any more errands for me? " ;
};


func int dmt_12120_dagot_tasks_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_tasks_info()
{
	AI_Output(other,self, " DMT_12120_Dagot_Tasks_01_01 " );	// Do you have any other errands for me?
	AI_Output(self,other, " DMT_12120_Dagot_Tasks_01_02 " );	// Not yet. Everything you could, you've already done!
	AI_Output(self,other, " DMT_12120_Dagot_Tasks_01_03 " );	// You're not ready for other things yet.
	AI_Output(self,other, " DMT_12120_Dagot_Tasks_01_04 " );	// However, if we suddenly need your help again, do not hesitate - we will call you ourselves.
};

