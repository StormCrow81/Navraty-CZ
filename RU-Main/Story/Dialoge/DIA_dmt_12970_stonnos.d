

instance DMT_12970_STONNOS_EXIT(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 999;
	condition = dmt_12970_stonnos_exit_condition;
	information = dmt_12970_stonnos_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12970_stonnos_exit_condition()
{
	return TRUE;
};

func void dmt_12970_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12970_STONNOS_HELLO(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_hello_condition;
	information = dmt_12970_stonnos_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12970_stonnos_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (TELLWELCOMEDONE == FALSE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_01 " );	// You should contact Guardian Dagoth, adept!
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_02 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_03 " );	// I can't help you anymore.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_05 " );	// So, you're here. Welcome to our abode, hero!
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_06 " );	// From now on, I will be your mentor.
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_07 " );	// The rest of the Guardians will also keep a close eye on your fate. But no more.
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_08 " );	// From now on, only the Rock is your destiny, and now you serve it only. Remember it!
			AI_Output(other,self, " DMT_12970_Stonnos_Hello_09 " );	// Yes, master! I got it.
			TELLWELCOMEDONE = TRUE;
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_11 " );	// You should contact Guardian Vakon, adept!
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_02 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_03 " );	// I can't help you anymore.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_15 " );	// You should contact Guardian Kelios, adept!
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_02 " );	// He will now be your mentor.
			AI_Output(self,other, " DMT_12970_Stonnos_Hello_03 " );	// I can't help you anymore.
			AI_StopProcessInfos(self);
		};
	}
	else if(CHOOSESTONE == TRUE)
	{
		AI_Output(self,other, " DMT_12970_Stonnos_Hello_19 " );	// So, here you are... (smartly) Welcome to our abode, hero!
		AI_Output(self,other, " DMT_12970_Stonnos_Hello_20 " );	// From now on, I will be your mentor.
		AI_Output(self,other, " DMT_12970_Stonnos_Hello_21 " );	// The rest of the Guardians will also keep a close eye on your fate. But no more.
		AI_Output(self,other, " DMT_12970_Stonnos_Hello_22 " );	// From now on, only the Rock is your destiny, and now you serve it only. Remember it!
		AI_Output(other,self, " DMT_12970_Stonnos_Hello_23 " );	// Yes, master! I got it.
		TELLWELCOMEDONE = TRUE;
	}
	else
	{
		AI_Output(self,other, " DMT_12970_Stonnos_Hello_28 " );	// You already know what you should do. Go.
		AI_StopProcessInfos(self);
	};
};


instance DMT_12970_STONNOS_WHATTEACH(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_whatteach_condition;
	information = dmt_12970_stonnos_whatteach_info;
	permanent = TRUE;
	description = " What can I learn from you? " ;
};


func int dmt_12970_stonnos_whatteach_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == FALSE) && (GUARDIANTEACHMEWAR == FALSE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_whatteach_info()
{
	AI_Output(other,self, " DMT_12970_Stonnos_WhatTeach_00 " );	// Can you teach me magic?
	if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_GUR ))
	{
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_01 " );	// Since you are now my apprentice...(thoughtfully) then I can teach you the magic bestowed upon me by my creator.
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_03 " );	// This magic doesn't have a name...(seriously) it doesn't matter! The main thing is that this knowledge is sacred and few people owned it.
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_04 " );	// Only the elect were allowed to know them, and if you wish, you will soon become one of their number too!
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_06 " );	// In addition, knowledge of magic circles is also a necessary condition for their knowledge. But I can teach you that too, if you wish.
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_24 " );	// And one more thing... (ingratiatingly) Since you are now an adept of our circle, accept this acolyte's magical robe from me.
		CreateInvItems(self,itar_haradrimmage,1);
		B_GiveInvItems(self,other,itar_haradrimmage,1);
		GUARDIANTEACHMEMAGIC = TRUE;
		B_LogEntry( TOPIC_GUARDIANS , " Guardian Stonnos can teach me Guardian magic. If I decide to start my own training, I should just talk to him about it. " );
		AI_StopProcessInfos(self);
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_SLD) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_10 " );	// Well, since you're a warrior... (thoughtfully) I can't possibly teach you the magic bestowed upon me by my creator.
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_11 " );	// However, you can talk to Tarinax, master of the Asgardians, the elemental warriors.
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_12 " );	// I think it will help you in your studies.
		AI_Output(other,self, " DMT_12970_Stonnos_WhatTeach_13 " );	// Okay, I'll do that.
		GUARDIANTEACHMEWAR = TRUE;
		B_LogEntry( TOPIC_GUARDIANS , " To begin my training, I should speak to Tarinax, master of the Asgardians, the elemental warriors. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_14 " );	// Nothing yet... (seriously) You're not yet ready to learn all the wisdom given to the Guardians!
		AI_Output(self,other, " DMT_12970_Stonnos_WhatTeach_15 " );	// You're still too weak! Come back when you're ready and I'll tell you our secrets.
	};
};


instance DMT_12970_STONNOS_HELLOBACK(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_helloback_condition;
	information = dmt_12970_stonnos_helloback_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12970_stonnos_helloback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (GUARDIANTEACHMEWAR == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_helloback_info()
{
	AI_Output(self,other, " DMT_12970_Stonnos_HelloBack_01 " );	// You already know what you should do. Go.
	AI_StopProcessInfos(self);
};


instance DMT_12970_STONNOS_EXPLAINCIRCLES(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_explaincircles_condition;
	information = dmt_12970_stonnos_explaincircles_info;
	permanent = FALSE;
	description = " Explain to me what is the meaning of Magic Circles? " ;
};


func int dmt_12970_stonnos_explaincircles_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_explaincircles_info()
{
	AI_Output(other,self, " DMT_12970_Stonnos_EXPLAINCIRCLES_Info_15_01 " );	// Explain to me what the meaning of magic circles is?
	AI_Output(self,other, " DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_02 " );	// Circles represent your understanding of magic.
	AI_Output(self,other, " DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_03 " );	// They indicate the level of your knowledge and skills, the ability to learn new spells.
	AI_Output(self,other, " DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_04 " );	// Each Circle must be completed before entering the next one.
	AI_Output(self,other, " DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_05 " );	// Only the chosen ones can reach the higher Circles.
	AI_Output(self,other, " DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_06 " );	// To those who know them, spells of incredible power are revealed!
	AI_Output(self,other, " DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_07 " );	// But to understand their power, you must first know yourself.
	EXPLAINCIRCLEMEAN = TRUE;
};


var int day_dmt_12970_stonnos_circle_noperm;

instance DIA_DMT_12970_STONNOS_CIRCLE(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 99;
	condition = dia_dmt_12970_stonnos_circle_condition;
	information = dia_dmt_12970_stonnos_circle_info;
	permanent = TRUE;
	description = " I want to learn the essence of magic. " ;
};

func int dia_dmt_12970_stonnos_circle_condition()
{
	if ( (Npc_GetTalentSkill ( other , NPC_TALENT_MAGE ) < =  6 ) && ( CHOOSESTONE  ==  TRUE ) && ( ALLGUARDIANSNOLEADERISDEAD  ==  FALSE ) && ( TELLWELCOMEDONEGUARDIACHMEMAGIC  ==  TRUE ) && ( DIA_DMT_12970_RCCIPERSE  ) =  STONN_FALSE .  
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_circle_info()
{
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_CIRCLE_15_00 " );	// I want to understand the essence of magic.
	Info_ClearChoices(DIA_DMT_12970_STONNOS_CIRCLE);
	Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,Dialog_Back,DIA_DMT_12970_STONNOS_CIRCLE_Back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice( DIA_DMT_12970_STONNOS_CIRCLE , " 1 Circle of Magic (Training Points: 20) " , DIA_DMT_12970_STONNOS_CIRCLE_1 );
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice( DIA_DMT_12970_STONNOS_CIRCLE , " 2 Circle of Magic (Training Points: 30) " , DIA_DMT_12970_STONNOS_CIRCLE_2 );
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice( DIA_DMT_12970_STONNOS_CIRCLE , " 3 Circle of Magic (Training Points: 40) " , DIA_DMT_12970_STONNOS_CIRCLE_3 );
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice( DIA_DMT_12970_STONNOS_CIRCLE , " 4 Circle of Magic (Training Points: 60) " , DIA_DMT_12970_STONNOS_CIRCLE_4 );
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice( DIA_DMT_12970_STONNOS_CIRCLE , " 5 Circle of Magic (Training Points: 80) " , DIA_DMT_12970_STONNOS_CIRCLE_5 );
	}
	else  if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE ) ==  5 ) && (Chapter >=  5 ) && (MY_DarkOrder == LOG_Success) && (MY_JarCurse == LOG_Success) && ( MY_URNAZULRAGE  ==  LOG_SUCCESS )) ;
	{
		Info_AddChoice( DIA_DMT_12970_STONNOS_CIRCLE , " 6 Circle of Magic (Training Points: 100) " , DIA_DMT_12970_STONNOS_CIRCLE_6 );
	}
	else
	{
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_42 " );	// You're not ready for this yet! Come back later.
	};
};

func void DIA_DMT_12970_Stonnos_CIRCLE_Back()
{
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12970_Stonnos_CIRCLE_15_01 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_01 " );	// Good! Enter the First Circle and the secret of the simplest runes will be revealed to you!
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12970_Stonnos_CIRCLE_15_02 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_09 " );	// The Second Circle will give you access to new combat spells.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_10 " );	// But in order to know the true secrets of magic, you still have a lot to learn.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12970_Stonnos_CIRCLE_15_03 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_16 " );	// So be it. I initiate you into the Third Circle!
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_17 " );	// You have already crossed a significant stage on the path of magic.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_18 " );	// But don't forget: the higher your power and abilities, the more careful you should use runes.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12970_Stonnos_CIRCLE_15_04 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_22 " );	// It's time for you to start learning the true secrets of magic.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_23 " );	// From now on, you are subject to the Fourth Circle of Magic!
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_DMT_12970_Stonnos_CIRCLE_15_05 " );	// Yes, master. I'm ready.
		AI_Output(other,self, " DIA_DMT_12970_Stonnos_CIRCLE_15_5A " );	// So be it! I will reveal to you the true meaning of the Fifth Circle.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_31 " );	// Know your limits, and you will know your true power.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_32 " );	// The spells you can learn can be truly devastating.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_33 " );	// So know the measure of your strength and beware of megalomania.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_34 " );	// I will lift you up to the Sixth Circle of Magic.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_35 " );	// Note that only the most powerful of magicians can enter the Sixth Circle. It is for those whose life is a sign! Your sign is the Rock.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_39 " );	// The Sixth Circle will allow you to use the magic of any rune.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_40 " );	// And don't forget: don't capture power, but be its source.
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_CIRCLE_14_41 " );	// Be wise and prudent in your deeds!
		DIA_DMT_12970_STONNOS_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

instance DIA_DMT_12970_STONNOS_TEACH_MANA (C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 10;
	condition = dia_dmt_12970_stonnos_teach_mana_condition;
	information = dia_dmt_12970_stonnos_teach_mana_info;
	permanent = TRUE;
	description = " I want to increase my magical energy. " ;
};


func int dia_dmt_12970_stonnos_teach_mana_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (hero.attribute[ATR_MANA_MAX] < T_MEGA))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_teach_mana_info()
{
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_TEACH_MANA_15_00 " );	// I want to increase my magical energy.
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};

func void dia_dmt_12970_stonnos_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other, " DIA_DMT_12970_Stonnos_TEACH_MANA_05_00 " );	// You're at your limits!
	};
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
};

func void dia_dmt_12970_stonnos_teach_mana_1()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};

func void dia_dmt_12970_stonnos_teach_mana_5()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};


instance DIA_DMT_12970_STONNOS_RUNEN (C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 99;
	condition = dia_dmt_12970_stonnos_runen_condition;
	information = dia_dmt_12970_stonnos_runen_info;
	permanent = TRUE;
	description = " Teach me your magic. " ;
};


func int dia_dmt_12970_stonnos_runen_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_runen_info()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen, " 6 Circle of Magic " ,dia_dmt_12970_stonnos_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen, " 5 Circle of Magic " ,dia_dmt_12970_stonnos_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen, " 4 Circle of Magic " ,dia_dmt_12970_stonnos_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen, " 3 Circle of Magic " ,dia_dmt_12970_stonnos_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen, " 2 Circle of Magic " ,dia_dmt_12970_stonnos_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen, " 1 Circle of Magic " ,dia_dmt_12970_stonnos_runen_1);
	};
};

func void dia_dmt_12970_stonnos_runen_back()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
};

func void dia_dmt_12970_stonnos_runen_1()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),dia_dmt_12970_stonnos_runen_circle_1_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[95] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_BERZERK,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BERZERK)),dia_dmt_12970_stonnos_runen_circle_3_spl_berzerk);
	};
};

func void dia_dmt_12970_stonnos_runen_2()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_GreenTentacle] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_GreenTentacle,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GreenTentacle)),dia_dmt_12970_stonnos_runen_circle_2_spl_greententacle);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),dia_dmt_12970_stonnos_runen_circle_2_spl_windfist);
	};
};

func void dia_dmt_12970_stonnos_runen_3()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),dia_dmt_12970_stonnos_runen_circle_3_spl_fear);
	};

	if(PLAYER_TALENT_RUNES[SPL_Charm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Charm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Charm)),dia_dmt_12970_stonnos_runen_circle_1_spl_charm);
	};

	if(PLAYER_TALENT_RUNES[SPL_Extricate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Extricate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Extricate)),dia_dmt_12970_stonnos_runen_circle_3_spl_Extricate);
	};
};

func void dia_dmt_12970_stonnos_runen_4()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[100] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSWAMPGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSWAMPGOLEM)),dia_dmt_12970_stonnos_runen_circle_5_spl_summonswampgolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_Acid] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Acid,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Acid)),dia_dmt_12970_stonnos_runen_circle_5_spl_Acid);
	};
	if((PLAYER_TALENT_RUNES[SPL_Elevate] == FALSE) && (LegoSpellElevate == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Elevate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Elevate)),dia_dmt_12970_stonnos_runen_circle_4_spl_Elevate);
	};
};

func void dia_dmt_12970_stonnos_runen_5()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[96] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_SEVEREFETIDITY,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SEVEREFETIDITY)),dia_dmt_12970_stonnos_runen_circle_4_spl_severefetidity);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),dia_dmt_12970_stonnos_runen_circle_4_spl_whirlwind);
	};
};

func void dia_dmt_12970_stonnos_runen_6()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(HEROKNOWS_RECEPT_GURU == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_GuruRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GuruWrath)),dia_dmt_12970_stonnos_runen_circle_6_recept_guru);
	};
	if(PLAYER_TALENT_RUNES[SPL_Quake] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Quake,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Quake)),dia_dmt_12970_stonnos_runen_circle_6_spl_Quake);
	};
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_Extricate()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Extricate);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_Elevate()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Elevate);
};

func void dia_dmt_12970_stonnos_runen_circle_5_spl_Acid()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Acid);
};

func void dia_dmt_12970_stonnos_runen_circle_6_spl_Quake()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Quake);
};

func void dia_dmt_12970_stonnos_runen_circle_1_spl_sleep()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Sleep);
};

func void dia_dmt_12970_stonnos_runen_circle_1_spl_charm()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Charm);
};

func void dia_dmt_12970_stonnos_runen_circle_2_spl_greententacle()
{
	b_teachplayertalentrunesguardians(self,other,SPL_GreenTentacle);
};

func void dia_dmt_12970_stonnos_runen_circle_2_spl_windfist()
{
	b_teachplayertalentrunesguardians(self,other,SPL_WindFist);
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_fear()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Fear);
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_berzerk()
{
	b_teachplayertalentrunesguardians(self,other,SPL_BERZERK);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_severefetidity()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SEVEREFETIDITY);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_whirlwind()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Whirlwind);
};

func void dia_dmt_12970_stonnos_runen_circle_5_spl_summonswampgolem()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SUMMONSWAMPGOLEM);
};

func void dia_dmt_12970_stonnos_runen_circle_6_recept_guru()
{
	b_teachplayertalentrunesguardians(self,other,SPL_GuruWrath);
};

instance DIA_DMT_12970_STONNOS_GIVEARMORGUARDIANS(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_givearmorguardians_condition;
	information = dia_dmt_12970_stonnos_givearmorguardians_info;
	permanent = FALSE;
	description = " I will go to the Halls of Irdorath. " ;
};

func int dia_dmt_12970_stonnos_givearmorguardians_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_givearmorguardians_info()
{
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_01 " );	// I will go to the Halls of Irdorath. Can I count on your help?
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_02 " );	// Keepers never interfere in the course of divine strife. And you know it very well!
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_03 " );	// However, we cannot look at your fate indifferently. After all, you are almost one of us!
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_04 " );	// Therefore, accept this humble gift from me as our goodwill.
	B_GiveInvItems(self,other,ItPo_GuardiansElixir,1);
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_07 " );	// Thank you master.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_08 " );	// Now go, chosen of the Elements! You still have a lot to do for the good of this world.
	AI_StopProcessInfos(self);
};

instance DIA_DMT_12970_STONNOS_GIVEELIGORRUNE(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_giveeligorrune_condition;
	information = dia_dmt_12970_stonnos_giveeligorrune_info;
	permanent = FALSE;
	description = " I can learn all this from other mages. " ;
};

func int dia_dmt_12970_stonnos_giveeligorrune_condition()
{
	if((CHOOSESTONE == TRUE) && (DemonologSkill[0] == 6) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_giveeligorrune_info()
{
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_01 " );	// I can learn all this from other magicians.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_02 " );	// (seriously) And what do you need?
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_03 " );	// Is this really all the secret knowledge that the Guardians are ready to tell me? I think you keep other secrets as well.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_04 " );	// Of course, our secret knowledge is not limited to this. However, even you will hardly be able to understand some of them.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_05 " );	// However, something might really interest you.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_06 " );	// So. Each of the elements is the creator of some of the different creatures that inhabit the limits of this world.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_07 " );	// These creatures completely and completely obey the will of their creators and sometimes even serve them. We - the Guardians - are also subject to this power!
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_08 " );	// Can I own it?
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_09 " );	// Take this rune. She holds magic that no one but us is likely to know about.
	CreateInvItems(self,itru_eligordemons, 1 );
	B_GiveInvItems(self,other,itru_eligordemons, 1 );
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_10 " );	// What is this rune?
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_11 " );	// With its help, you will be able to summon into this world creatures who are undividedly devoted to us and know no equal in their strength.
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_12 " );	// Who are these beings?
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_13 " );	// Demons! The demons of the Burning Legion of Eligor, Lord of Lang!
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_14 " );	// These creatures have served us faithfully for millennia. Now they will serve you!
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_GiveEligorRune_01_15 " );	// However, remember that all power comes to an end if it is not used wisely. This is not a warning, just advice.
	AI_StopProcessInfos(self);
};


instance DIA_DMT_12970_STONNOS_TASKS(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_tasks_condition;
	information = dia_dmt_12970_stonnos_tasks_info;
	permanent = FALSE;
	description = " Do you have any more errands for me? " ;
};


func int dia_dmt_12970_stonnos_tasks_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_tasks_info()
{
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_Tasks_01_01 " );	// Do you have any other errands for me?
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_Tasks_01_02 " );	// I think not yet. Everything you could do - you already did!
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_Tasks_01_03 " );	// For other things, you, unfortunately, are not ready yet.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_Tasks_01_04 " );	// However, if we need your help again, don't hesitate - we will call on you ourselves.
};

instance DMT_12971_STONNOS_EXIT(C_Info)
{
	npc = dmt_12971_stonnos;
	nr = 999;
	condition = dmt_12971_stonnos_exit_condition;
	information = dmt_12971_stonnos_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dmt_12971_stonnos_exit_condition()
{
	return TRUE;
};

func void dmt_12971_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_12971_STONNOS_ENDGUARDIANS(C_Info)
{
	npc = dmt_12971_stonnos;
	condition = dia_dmt_12971_stonnos_endguardians_condition;
	information = dia_dmt_12971_stonnos_endguardians_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_dmt_12971_stonnos_endguardians_condition()
{
	if(ALLGUARDIANSNOLEADERISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_dmt_12971_stonnos_endguardians_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_00 " );	// (imperiously) STOP, MORTAL! Stop where you are!
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_01 " );	// Before you unleash all your might and power on me, there's one more thing you need to know.
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_EndGuardians_01_02 " );	// And what is this?!
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_03 " );	// You've accomplished a lot already, and I believe the gods of this world made no mistake in choosing you as their protector.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_04 " );	// However, you must understand that you still won't be able to defeat us. For we are immortal!
	AI_Output(other,self, " DIA_DMT_12970_Stonnos_EndGuardians_01_05 " );	// I almost did it! The matter is small.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_06 " );	// (laughs) Actually, things are a bit different.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_07 " );	// Of course, because of you, we will now have to leave this abode and hide in the sacred Halls of Wakhan, with which we were created.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_08 " );	// But the only thing you could achieve with this was to delay our judgment on this world a little. Therefore, do not assume that this is where it all ends!
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_09 " );	// Someday we will return here again in order to try again to embody the great plan of the Creators, and you will not be able to prevent this in any way.
	AI_Output(self,other, " DIA_DMT_12970_Stonnos_EndGuardians_01_10 " );	// So, perhaps our meeting is not the last, as you might think. I know for sure - we will meet again, the chosen one!
	B_LogEntry( TOPIC_GUARDIANS , " When victory over the Guardians was already close, the last of them - Stonnos - decided to suddenly turn to me. Judging by his words, even if I manage to defeat them now, it still won't change much. Someday The Guardians will once again decide to return to this world in order to try to bring their plan to life. And this meeting with him is far from the last. True, this will not happen now quite soon. " );
	Info_ClearChoices(dia_dmt_12971_stonnos_endguardians);
	Info_AddChoice(dia_dmt_12971_stonnos_endguardians,Dialog_Ende,dia_dmt_12971_stonnos_endguardians_ok);
};

func void dia_dmt_12971_stonnos_endguardians_ok()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};
