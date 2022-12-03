


instance DIA_KREOL_EXIT(C_Info)
{
	npc = none_102_kreol;
	nr = 999;
	condition = dia_kreol_exit_condition;
	information = dia_kreol_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_kreol_exit_condition()
{
	return TRUE;
};

func void dia_kreol_exit_info()
{
	if(MIS_FINDKREOL == LOG_Running)
	{
		B_GivePlayerXP(100);
		Log_SetTopicStatus(TOPIC_FINDKREOL,LOG_SUCCESS);
		MIS_FINDKREOL = LOG_SUCCESS;
	};

	AI_StopProcessInfos(self);
};

func void dia_kreol_hello_ext()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_67");	//Это мы еще посмотрим, кто из нас умрет!
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_54");	//Из тебя получится отличный маг-скелет!
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_55");	//Из тебя получится отличный скелет-воин!
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello, " (end call) " ,dia_kreol_hello_end_trans);
};

func void dia_kreol_noforever_ext()
{
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Kreol_DemonLanguage_14_54 " );	// You'll make a great Skeleton Mage!
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_DemonLanguage_14_55 " );	// You'll make a great skeleton warrior!
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello, " (end call) " ,dia_kreol_hello_end_trans);
};

func void dia_kreol_demonlanguage_ext()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_14_53 " );	// It will hurt you now!
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Kreol_DemonLanguage_14_54 " );	// You'll make a great Skeleton Mage!
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_DemonLanguage_14_55 " );	// You'll make a great skeleton warrior!
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello, " (end call) " ,dia_kreol_hello_end_trans);
};

func void dia_kreol_hello_end_trans()
{
	AI_StopProcessInfos(self);
};

instance DIA_KREOL_HELLO(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_hello_condition;
	information = dia_kreol_hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_kreol_hello_condition()
{
	return TRUE;
};

func void dia_kreol_hello_info()
{
	Npc_ExchangeRoutine(self,"KreolRoutine");
	AI_Output(self,other, " DIA_Kreol_Hello_14_00 " );	// WHO DARE TO DISTRACT ME FROM MY RESEARCH?
	AI_Output(self,other, " DIA_Kreol_Hello_14_03 " );	// How did you get here?!
	AI_Output(other,self, " DIA_Kreol_Hello_14_04 " );	// I won't say it was easy. This place was infested with undead!
	AI_Output(self,other, " DIA_Kreol_Hello_14_05 " );	// Those were my servants, and I am very surprised that you are still alive.
	AI_Output(other,self, " DIA_Kreol_Hello_14_06 " );	// Are you a necromancer?
	AI_Output(self,other, " DIA_Kreol_Hello_14_08 " );	// (annoyed) Yes! What do you want from me?

	if(MIS_FINDKREOL == LOG_Running)
	{
		B_GivePlayerXP(100);
		Log_SetTopicStatus(TOPIC_FINDKREOL,LOG_SUCCESS);
		B_LogEntry( TOPIC_FINDKREOL , " I did find Creole after all. He seems to be well settled in the old Tower of Mists. I had to work hard to get an appointment with him. Creole seems to appreciate his peace and solitude very much. " );
		MIS_FINDKREOL = LOG_SUCCESS;
	};

	Wld_InsertNpc(Demon,"OW_FOGDUNGEON_36_MOVEMENT2");

	if(XARDASTELLABOUTKREOL == TRUE)
	{
		Info_AddChoice(dia_kreol_hello, " I don't think we met by chance. " ,dia_kreol_hello_prophecy);
	};
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE))
	{
		Info_AddChoice(dia_kreol_hello, " I need your help, necromancer. " ,dia_kreol_hello_mora);
	};
	if(other.guild == GIL_KDM)
	{
		Info_AddChoice(dia_kreol_hello, " I'm looking for a dark magic teacher, master. " ,dia_kreol_hello_teach);
	};

	Info_AddChoice(dia_kreol_hello, " I came to kill you! " ,dia_kreol_hello_kill);
	Info_AddChoice(dia_kreol_hello, " This is of little concern to you. " ,dia_kreol_hello_fuckoff);

	if(RhetorikSkillValue[1] >= 40)
	{
		Info_AddChoice(dia_kreol_hello, " I didn't mean to disturb your privacy. " ,dia_kreol_hello_sorry);
	};

	Info_AddChoice(dia_kreol_hello, " I ended up here by accident. " ,dia_kreol_hello_dontknow);
};

func void dia_kreol_hello_mora()
{
	AI_Output(other,self, " DIA_Kreol_Hello_Mora_01_00 " );	// I need your help.
	AI_Output(self,other, " DIA_Kreol_Hello_Mora_01_02 " );	// Give me at least one reason why I should help you...
	AI_Output(self,other, " DIA_Kreol_Hello_Mora_01_03 " );	// ...instead of smearing you against the wall, you impudent worm!
	AI_Output(other,self,"DIA_Kreol_Hello_Mora_01_04");	//С'эньяк!
	AI_Output(self,other, " DIA_Kreol_Hello_Mora_01_06 " );	// (thinking) Well, really, this reason could lead you to me.
	AI_Output(self,other, " DIA_Kreol_Hello_Mora_01_07 " );	// Good! Ask your questions.
	Info_ClearChoices(dia_kreol_hello);
};

func void dia_kreol_hello_teach()
{
	AI_Output(other,self, " DIA_Kreol_Hello_Teach_01_00 " );	// I'm looking for a dark magic teacher, master.
	AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_01 " );	// Ha ha ha! (laughs)
	AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_02 " );	// And why do you think that I will teach you?
	AI_Output(other,self, " DIA_Kreol_Hello_Teach_01_03 " );	// As you can see, I am also a necromancer, but I have not yet grasped the full essence of dark magic.
	if (Chapter >=  5 )
	{
		AI_Output(other,self, " DIA_Kreol_Hello_Teach_01_04 " );	// In addition, my former teacher disappeared without a trace, and I...
		AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_05 " );	// (interrupting) Who was your teacher before?
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_06 " );	// (interrupting) Who was your teacher before?
	};
	AI_Output(other,self, " DIA_Kreol_Hello_Teach_01_08 " );	// Xardas!
	AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_09 " );	// Xardas...
	AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_10 " );	// Well, if Xardas taught you, it already means something.
	AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_11 " );	// He doesn't take just anyone as a student!
	AI_Output(other,self, " DIA_Kreol_Hello_Teach_01_13 " );	// So will you be my mentor?
	AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_23 " );	// Good! I will accept you as a student, and you will be trained by me in the art of dark magic.
	AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_26 " );	// I hope I don't regret my decision.
	AI_Output(self,other, " DIA_Kreol_Hello_Teach_01_27 " );	// Now go do something useful!
	Info_ClearChoices(dia_kreol_hello);
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ADDON_DMTTEACHER , " Creole will teach me how to create necromancer runes, help me learn magic circles and increase my magic power. " );
	KREOL_MYTEACHER = TRUE;
};

func void dia_kreol_hello_prophecy()
{
	AI_Output(other,self, " DIA_Kreol_Hello_14_52 " );	// Our meeting is not accidental.
	AI_Output(self,other, " DIA_Kreol_Hello_14_55 " );	// Who told you about me?!
	AI_Output(other,self, " DIA_Kreol_Hello_14_56 " );	// Xardas!
	AI_Output(self,other, " DIA_Kreol_Hello_14_57 " );	// Xardas? I remembered him. He's a former firebender!

	if(other.guild == GIL_KDM)
	{
		AI_Output(other,self, " DIA_Kreol_Hello_14_61 " );	// Xardas is my mentor. As you noticed, I also belong to the circle of dark magicians.
		AI_Output(self,other, " DIA_Kreol_Hello_14_63 " );	// So you're also a necromancer... (thoughtfully) You've chosen a difficult path, although you probably don't even realize how difficult it is.	
	};

	AI_Output(self,other, " DIA_Kreol_Hello_14_65 " );	// But enough! Enough empty talk. If you are meeting with me, then consider that you have found her and I am in front of you!
	AI_Output(self,other, " DIA_Kreol_Hello_14_66 " );	// Tell me what you want from me?
	Info_ClearChoices(dia_kreol_hello);
};

func void dia_kreol_hello_kill()
{
	AI_Output(other,self, " DIA_Kreol_Hello_14_10 " );	// I've come to kill you!

	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(other.guild == GIL_PAL)
		{
			AI_Output(other,self, " DIA_Kreol_Hello_14_11 " );	// As servants of Innos, it is my holy duty to exterminate the creatures of Darkness like you!
			AI_Output(self,other, " DIA_Kreol_Hello_14_14 " );	// You dared to challenge ME - one of the chosen ones of Beliar, and this will be your last mistake!
			AI_Output(self,other, " DIA_Kreol_Hello_14_15 " );	// Die, miserable worm!
		}
		else
		{
			AI_Output(other,self, " DIA_Kreol_Hello_14_16 " );	// As servants of Innos, it is my holy duty to exterminate the creatures of Darkness like you!
			AI_Output(self,other, " DIA_Kreol_Hello_14_19 " );	// You dared to challenge ME - one of the chosen ones of Beliar, and this will be your last mistake!
			AI_Output(self,other, " DIA_Kreol_Hello_14_20 " );	// Innos won't help you! Die, wretched worm!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_Hello_14_22 " );	// You dared to challenge ME - one of the chosen ones of Beliar, and this will be your last mistake!
		AI_Output(self,other, " DIA_Kreol_Hello_14_23 " );	// Now you will die, and your body will serve me until the end of time in the form of a soulless undead!
		AI_Output(self,other, " DIA_Kreol_Hello_14_24 " );	// Die, miserable worm!
	};
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello, " We'll see which of us dies. " ,dia_kreol_hello_ext);
};

func void dia_kreol_hello_fuckoff()
{
	AI_Output(other,self, " DIA_Kreol_Hello_14_25 " );	// This doesn't concern you!
	AI_Output(self,other, " DIA_Kreol_Hello_14_26 " );	// (viciously) Looks like you still don't know who you're dealing with!
	AI_Output(self,other, " DIA_Kreol_Hello_14_30 " );	// Now I'll explain it to you. Die, wretched worm!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello, " We'll see which of us dies. " ,dia_kreol_hello_ext);
};

func void dia_kreol_hello_dontknow()
{
	AI_Output(other,self, " DIA_Kreol_Hello_14_31 " );	// I ended up here by accident.
	AI_Output(self,other, " DIA_Kreol_Hello_14_33 " );	// I really appreciate my peace and solitude. And I hate it when uninvited guests invade my domain!
	AI_Output(self,other, " DIA_Kreol_Hello_14_34 " );	// Now I'll explain it to you. Die, wretched worm!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello, " We'll see which of us dies. " ,dia_kreol_hello_ext);
};

func void dia_kreol_hello_sorry()
{
	AI_Output(other,self, " DIA_Kreol_Hello_14_40 " );	// I had no idea there was anyone besides the undead.
	AI_Output(self,other, " DIA_Kreol_Hello_14_43 " );	// No one dares to disturb my peace and invade here without an invitation!
	AI_Output(self,other, " DIA_Kreol_Hello_14_45 " );	// But I'll give you a chance to get out of here and keep you alive.
	AI_Output(self,other, " DIA_Kreol_Hello_14_50 " );	// So you'd better get out of my sight before I change my mind!
	AI_Output(self,other, " DIA_Kreol_Hello_14_51 " );	// And remember: the next time we meet, I will kill you! Go away!
	KREOL_WARN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_KREOL_NOFOREVER(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_noforever_condition;
	information = dia_kreol_noforever_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_kreol_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KREOL_WARN == TRUE))
	{
		return TRUE;
	};
};

func void dia_kreol_noforever_info()
{
	if((XARDASTELLABOUTKREOL == TRUE) && (KREOL_KILL == FALSE))
	{
		if(other.guild == GIL_KDM)
		{
			AI_Output(self,other, " DIA_Kreol_NoForever_01_00 " );	// Well, well. As I see it, you have become a necromancer! And who initiated you into the circle of dark magicians?
			AI_Output(other,self,"DIA_Kreol_NoForever_01_01");	//Ксардас!
		}
		else
		{
			AI_Output(self,other, " DIA_Kreol_NoForever_01_02 " );	// You're testing my patience! I think I told you to get out of here!
			AI_Output(other,self, " DIA_Kreol_NoForever_01_03 " );	// Xardas sent me.
		};

		AI_Output(self,other, " DIA_Kreol_NoForever_01_04 " );	// Xardas? I remembered him. He's a former firebender!

		if(other.guild == GIL_KDM)
		{
			AI_Output(self,other, " DIA_Kreol_NoForever_01_08 " );	// So you're also a necromancer... (thoughtfully) You've chosen a difficult path, although you probably don't even realize how difficult it is.
		};
		AI_Output(self,other, " DIA_Kreol_NoForever_01_10 " );	// But enough about that! Tell me what do you want from me now?
	}
	else if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE) && (XARDASTELLABOUTKREOL == FALSE) && (KREOL_KILL == FALSE))
	{
		AI_Output(self,other, " DIA_Kreol_NoForever_01_13 " );	// You're testing my patience! I think I told you to get out of here!
		AI_Output(other,self, " DIA_Kreol_NoForever_01_14 " );	// I need your help.
		AI_Output(self,other, " DIA_Kreol_NoForever_01_16 " );	// Give me at least one reason why I should help you...
		AI_Output(self,other, " DIA_Kreol_NoForever_01_17 " );	// ...instead of smashing you against the wall, you pathetic worm!
		AI_Output(other,self,"DIA_Kreol_NoForever_01_18");	//С'эньяк!
		AI_Output(self,other, " DIA_Kreol_NoForever_01_20 " );	// (thinking) Well, really, this reason could lead you to me.
		AI_Output(self,other, " DIA_Kreol_NoForever_01_21 " );	// Good! Ask your questions.
		Info_ClearChoices(dia_kreol_noforever);
	}
	else  if ((other.guild ==  GIL_KDM ) && ( XARDASTELLABOUTKREOL  ==  FALSE ) && ( KREOL_KILL  ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Kreol_NoForever_01_22 " );	// Well, well. As I see it, you have become a necromancer! And who initiated you into the circle of dark magicians?
		AI_Output(other,self,"DIA_Kreol_NoForever_01_22a");	//Ксардас!
		AI_Output(self,other,"DIA_Kreol_NoForever_01_23");	//Ксардас...
		AI_Output(self,other, " DIA_Kreol_NoForever_01_25 " );	// He doesn't take just anyone as a student!
		AI_Output(other,self, " DIA_Kreol_NoForever_01_26 " );	// As you can see, I am also a necromancer, but I have not yet grasped the full essence of dark magic.
		AI_Output(other,self, " DIA_Kreol_NoForever_01_29 " );	// Will you be my mentor?
		AI_Output(self,other, " DIA_Kreol_NoForever_01_36 " );	// Good! I will accept you as a student, and you will be trained by me in the art of dark magic.
		AI_Output(self,other, " DIA_Kreol_NoForever_01_40 " );	// I hope I don't regret my decision.
		AI_Output(self,other, " DIA_Kreol_NoForever_01_41 " );	// Now go do something useful!
		Info_ClearChoices(dia_kreol_noforever);
		Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
		B_LogEntry( TOPIC_ADDON_DMTTEACHER , " Creole will teach me how to create necromancer runes, help me learn magic circles and increase my magic power. " );
		KREOL_MYTEACHER = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_NoForever_01_11 " );	// You're testing my patience! I think I told you to get out of here!
		AI_Output(self,other, " DIA_Kreol_NoForever_01_12 " );	// You shouldn't have followed my advice. Now you will die!!!
		Info_ClearChoices(dia_kreol_noforever);
		Info_AddChoice(dia_kreol_noforever,"Эй, постой!",dia_kreol_noforever_ext);
	};
};


instance DIA_CREOL_DEMONLANGUAGE (C_Info) .
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguage_condition;
	information = dia_creole_demon_language_info;
	important = FALSE;
	permanent = FALSE;
	description = " What do you know about Lang's demon language? " ;
};

func int dia_kreol_demonlanguage_condition()
{
	if(XARDASTELLABOUTKREOL == TRUE)
	{
		return TRUE;
	};
};

func void dia_creole_demonlanguage_info()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_00 " );	// What do you know about Lang's demon language?
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_01 " );	// Oh, that's a rare gift! Not many people have this knowledge, but those who are initiated into this secret can reach unprecedented heights in the knowledge of dark magic.
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_03 " );	// Most of the dark tomes and manuscripts are written in this language.
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_04 " );	// They contain the wisdom given to us by Beliar. But only the elect are worthy of honor to comprehend this wisdom!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_05 " );	// But tell me, why are you interested in this?
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_06 " );	// I'd like to learn this ancient language. Can you help me with this?
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_08 " );	// Give me at least one reason why I should pass this knowledge on to you?
	Info_AddChoice(dia_kreol_demonlanguage, " If you don't, I'll kill you! " ,dia_kreol_demonlanguage_kill);
	Info_AddChoice(dia_kreol_demonlanguage, " Xardas said you could help me with this. " ,dia_kreol_demonlanguage_xardas);
	Info_AddChoice(dia_kreol_demonlanguage, " Without this, I won't be able to pass the Guardians' test! " ,dia_kreol_demonlanguage_guardian);
	Info_AddChoice(dia_kreol_demonlanguage, " I really need this. " ,dia_kreol_demonlanguage_need);
	Info_AddChoice(dia_kreol_demonlanguage, " I want to see your power. " ,dia_kreol_demonlanguage_knowledge);
};

func void dia_kreol_demonlanguage_kill()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_09 " );	// Because if you don't, I'll kill you!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_10 " );	// How bold and reckless! I even like it!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_11 " );	// But your insolence cannot go unpunished!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_12 " );	// Get ready to experience pain like you've never experienced before, brave one!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_creole_demonlanguage);
	Info_AddChoice(dia_kreol_demonlanguage, " It will hurt you now. " ,dia_kreol_demonlanguage_ext);
};

func void dia_creole_demon_language_xardas()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_13 " );	// Xardas said you'd help me with this.
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_14 " );	// Xardas?! Since when did Xardas start giving me orders?
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_15 " );	// Let him teach you!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_17 " );	// Now get out of my sight and don't you dare come back here!
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_creole_demonlanguage_guardian()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_1A " );	// Without this, I won't be able to pass the Guardian test!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_18 " );	// Keepers?
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_19 " );	// I won't help someone who chooses the path of the Guardian of the Elements!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_20 " );	// You can forget about it. He told me you will not get even a grain of this knowledge!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_21 " );	// Now get out of my sight and don't you dare come back here!
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kreol_demonlanguage_need()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_22 " );	// This is for my friend Mad. I met him in prison...
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_23 " );	// What the hell are you talking about?
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_27 " );	// Get lost! And don't you dare come here again!
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kreol_demonlanguage_knowledge()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_28 " );	// I want to make sure of your power.
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_29 " );	// Was Xardas right when he said that only a very powerful mage like you could help me acquire this knowledge?
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_32 " );	// Poor worm, how dare you doubt my power?!
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_34 " );	// (proudly) I was chosen by Beliar himself! The power of the God of Darkness flows through my veins!
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_35 " );	// These are just words - nothing more.
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_36 " );	// WHAT?! Do you still doubt it? Fool!
	if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_44 " );	// Though what else can you expect from this Xardas' apprentice? (laughs)
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_45 " );	// A little more - and you would be convinced of this - at the cost of your own life!
	};
	AI_Output(other,self, " DIA_Kreol_DemonLanguage_01_46 " );	// So will you teach me the language of demons?
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_47 " );	// (thinks) Hmmm...
	AI_Output(self,other, " DIA_Kreol_DemonLanguage_01_48 " );	// Okay, I'll reveal this sacred secret to you! But don't think that I'm doing this because you doubt my power.
	KREOL_TACHDEMONLANG = TRUE ;
	Info_ClearChoices(dia_creole_demonlanguage);
};


instance DIA_CREOL_DEMONLANGUAGETELL ( C_Info );
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguagetell_condition;
	information = dia_creole_demonlanguagetell_info;
	important = FALSE;
	permanent = FALSE;
	description = " Tell me about Lang's Demon language. " ;
};


func int dia_creole_demonlanguagetell_condition()
{
	if ( KREOL_TACHDEMONLANG  ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_creole_demonlanguagetell_info()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguageTell_01_00 " );	// Tell me about Lang's demon language.
	AI_Output(self,other, " DIA_Kreol_DemonLanguageTell_01_03 " );	// Its value lies in the fact that the most intimate secrets, dating back to the time of the creation of this world, are written in this language.
	AI_Output(self,other, " DIA_Kreol_DemonLanguageTell_01_04 " );	// Each of these texts is a real treasure if you understand its meaning.
	AI_Output(self,other, " DIA_Kreol_DemonLanguageTell_01_05 " );	// Also, this is the language of the Dark God! All creatures created by Beliar and subject to him are able to understand this language.
	AI_Output(other,self, " DIA_Kreol_DemonLanguageTell_01_07 " );	// What is Lang?
	AI_Output(self,other, " DIA_Kreol_DemonLanguageTell_01_08 " );	// Lang is the realm of demons. It is part of Mordrag, the home of the Dark God.
	AI_Output(self,other, " DIA_Kreol_DemonLanguageTell_01_09 " );	// Many of Lang's demons also serve the Dark God. But there are those over whom Beliar has no power.
	AI_Output(self,other, " DIA_Kreol_DemonLanguageTell_01_10 " );	// Like the legion of Eligor, the demon lord Lang!
};


instance DIA_CREOL_DEMONLANGUAGETEACH ( C_Info ) ;
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguageteach_condition;
	information = dia_creole_demon_languageteach_info;
	important = FALSE;
	permanent = TRUE;
	description = " Teach me the language of demons. (Learning points: 10, Cost: 2000 coins) " ;
};


func int dia_kreol_demonlanguageteach_condition()
{
	if (( CREOL_TEACHDEMONLANGUAGE   ==   TRUE ) && ( KNOWDEMENTORLANGUAGE   ==   FALSE ))
	{
		return TRUE;
	};
};

func void dia_creole_demonlanguageteach_info()
{
	AI_Output(other,self, " DIA_Kreol_DemonLanguageTeach_01_00 " );	// Teach me the language of demons.

	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_4))
	{
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other, " DIA_Kreol_DemonLanguageTeach_01_01 " );	// Know the strength and power of this knowledge!
		AI_Output(self,other, " DIA_Kreol_DemonLanguageTeach_01_02 " );	// Draw in it the wisdom bestowed upon us by Beliar - the lord of the crimson Darkness! Take possession of the treasure that is available only to the elite.
		AI_Output(self,other, " DIA_Kreol_DemonLanguageTeach_01_03 " );	// So be it!
		KNOWDEMENTORLANGUAGE = TRUE;
	};
};

instance DIA_KREOL_PERM(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_perm_condition;
	information = dia_kreol_perm_info;
	permanent = TRUE;
	description = " How are things on the magical front? " ;
};

func int dia_kreol_perm_condition()
{
	if((KREOLGURD == 0) && (KREOL_KILL == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_perm_info()
{
	AI_Output(other,self, " DIA_Kreol_PERM_15_00 " );	// How are things on the magical front?
	AI_Output(self,other, " DIA_Kreol_PERM_04_01 " );	// none of your business!
};

var int KreolBuyWeap;

instance DIA_KREOL_XARDASMISS(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_xardasmiss_condition;
	information = dia_kreol_xardasmiss_info;
	important = FALSE;
	permanent = FALSE;
	description = " Xardas is gone! " ;
};

func int dia_kreol_xardasmiss_condition()
{
	if (( hero . guild ==   GIL_KDM ) && ( XARDAS_MISS   ==   TRUE ))
	{
		return TRUE;
	};
};

func void dia_kreol_xardasmiss_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Kreol_XardasMiss_01_00 " );	// Xardas is gone!
	AI_Output(self,other, " DIA_Kreol_XardasMiss_01_01 " );	// What?! What else is this sly one up to?
	AI_Output(other,self, " DIA_Kreol_XardasMiss_01_02 " );	// I thought you knew the reason.
	AI_Output(self,other, " DIA_Kreol_XardasMiss_01_03 " );	// How do I know this?
	AI_Output(self,other, " DIA_Kreol_XardasMiss_01_04 " );	// But his disappearance is very, very strange...
	KreolBuyWeap = TRUE;

	if(KREOL_MYTEACHER == FALSE)
	{
		AI_Output(other,self, " DIA_Kreol_XardasMiss_01_05 " );	// Now I have lost the opportunity to continue my training in dark magic.
		AI_Output(self,other, " DIA_Kreol_XardasMiss_01_06 " );	// So what?
		AI_Output(other,self, " DIA_Kreol_XardasMiss_01_07 " );	// I haven't figured out the whole point of dark magic yet. Will you be my mentor?
		AI_Output(self,other, " DIA_Kreol_XardasMiss_01_08 " );	// Hmm... Good! I will accept you as my student and you will learn from me the art of dark magic.
		AI_Output(self,other, " DIA_Kreol_XardasMiss_01_20 " );	// I hope I don't regret my decision.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_08 " );	// And one more thing. Since you are now my student, accept this ring.
		B_GiveInvItems(self,other,ITRI_KREOLPLACE,1);
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_09 " );	// It will allow you to get to this tower faster than you can imagine.
		AI_Output(self,other, " DIA_Kreol_XardasMiss_01_21 " );	// Now go and do something useful!
		Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
		B_LogEntry( TOPIC_ADDON_DMTTEACHER , " Creole will teach me how to create necromancer runes, help me learn magic circles and increase my magic power. " );
		KREOL_MYTEACHER = TRUE;
	};
};

instance DIA_KREOL_TRADE(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_trade_condition;
	information = dia_kreol_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = " Show me your magical scrolls. " ;
};

func int dia_kreol_trade_condition()
{
	if(KREOL_MYTEACHER == TRUE)
	{
		return TRUE;
	};
	if((CHOOSEDARK == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_kreol_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Kreol_Trade_01_01 " );	// Show me your magical scrolls.

	if((Kapitel == 5) && (KREOLGIVEFIVECHAPTERSPELLS == FALSE))
	{
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ1,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ2,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ3,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ4,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ5,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ6,1);
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItSc_SumGobSkel,5);
		CreateInvItems(self,ItSc_SumSkel,2);
		CreateInvItems(self,ItSc_SumDemon,3);
		CreateInvItems(self,ItSc_ArmyOfDarkness,3);
		CreateInvItems(self,itsc_deathbolt,5);
		CreateInvItems(self,ItSc_ManaForLife,3);
		CreateInvItems(self,itsc_sumzombie,2);
		CreateInvItems(self,itsc_swarm,2);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,itsc_deathball,1);
		CreateInvItems(self,ItSc_MassDeath,1);
		CreateInvItems(self,itsc_skull,1);
		CreateInvItems(self,ItBE_Addon_KDF_03,1);
		KREOLGIVEFIVECHAPTERSPELLS = TRUE;
	};
	if((Kapitel == 6) && (KREOLGIVESIXCHAPTERSPELLS == FALSE))
	{
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItSc_SumGobSkel,5);
		CreateInvItems(self,ItSc_SumSkel,2);
		CreateInvItems(self,ItSc_SumDemon,5);
		CreateInvItems(self,ItSc_ArmyOfDarkness,3);
		CreateInvItems(self,itsc_deathbolt,5);
		CreateInvItems(self,ItSc_ManaForLife,3);
		CreateInvItems(self,itsc_sumzombie,2);
		CreateInvItems(self,itsc_swarm,2);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,itsc_deathball,1);
		CreateInvItems(self,ItSc_MassDeath,1);
		CreateInvItems(self,itsc_skull,1);
		KREOLGIVESIXCHAPTERSPELLS = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_KREOL_RUNEN (C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_runen_condition;
	information = dia_kreol_runen_info;
	permanent = TRUE;
	description = " Teach me how to make runes. " ;
};


func int dia_kreol_runen_condition()
{
	if((KREOL_MYTEACHER == TRUE) || ((CHOOSEDARK == TRUE) && (Kapitel >= 5)))
	{
		return TRUE;
	};
};

func void dia_kreol_runen_info()
{
	AI_Output(other,self, " DIA_Parlan_TEACH_15_00 " );	// Train me!
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_DEMONOLOG) == 1) && (PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE))
	{
		Info_AddChoice(dia_kreol_runen, " Demonologist Rune " , dia_kreol_runen_dem);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_kreol_runen, " 6 Circle of Magic " ,dia_kreol_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_kreol_runen, " 5 Circle of Magic " ,dia_kreol_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_kreol_runen, " 4 Circle of Magic " ,dia_kreol_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_kreol_runen, " 3 Circle of Magic " ,dia_kreol_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_kreol_runen, " 2 Circle of Magic " ,dia_kreol_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_kreol_runen, " 1 Circle of Magic " ,dia_kreol_runen_1);
	};
};

func void dia_kreol_runen_back()
{
	Info_ClearChoices(dia_kreol_runen);
};

func void dia_kreol_runen_dem()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),dia_kreol_runen_circle_4_spl_summondemon);
	};
};

func void dia_kreol_runen_1()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathbolt] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Deathbolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathbolt)),dia_kreol_runen_circle_1_spl_deathbolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),dia_kreol_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Rage] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Rage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Rage)),dia_kreol_runen_circle_1_spl_Rage);
	};
};

func void dia_kreol_runen_2()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ManaForLife] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_ManaForLife,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ManaForLife)),dia_kreol_runen_circle_2_spl_suckenergy);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonZombie] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonZombie,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonZombie)),dia_kreol_runen_circle_2_spl_summonzombie);
	};
	if(PLAYER_TALENT_RUNES[SPL_Lacerate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Lacerate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Lacerate)),dia_kreol_runen_circle_2_spl_Lacerate);
	};
};

func void dia_kreol_runen_3()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Swarm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Swarm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Swarm)),dia_kreol_runen_circle_3_spl_swarm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),dia_kreol_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Energyball] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_BeliarsRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Energyball)),dia_kreol_runen_circle_3_spl_energyball);
	};
};

func void dia_kreol_runen_4()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathball] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Deathball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathball)),dia_kreol_runen_circle_4_spl_deathball);
	};
};

func void dia_kreol_runen_5()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),dia_kreol_runen_circle_5_spl_armyofdarkness);
	};
};

func void dia_kreol_runen_6()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),dia_kreol_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Skull] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Skull,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Skull)),dia_kreol_runen_circle_6_spl_skull);
	};
};

func void dia_kreol_runen_circle_1_spl_Rage()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Rage);
};

func void dia_kreol_runen_circle_2_spl_Lacerate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Lacerate);
};

func void dia_kreol_runen_circle_1_spl_deathbolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathbolt);
};

func void dia_kreol_runen_circle_1_spl_summongoblinskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void dia_kreol_runen_circle_2_spl_suckenergy()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ManaForLife);
};

func void dia_kreol_runen_circle_2_spl_summonzombie()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonZombie);
};

func void dia_kreol_runen_circle_3_spl_swarm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Swarm);
};

func void dia_kreol_runen_circle_3_spl_summonskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void dia_kreol_runen_circle_3_spl_energyball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Energyball);
};

func void dia_kreol_runen_circle_4_spl_summondemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void dia_kreol_runen_circle_4_spl_deathball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathball);
};

func void dia_kreol_runen_circle_5_spl_armyofdarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void dia_kreol_runen_circle_6_spl_massdeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void dia_kreol_runen_circle_6_spl_skull()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Skull);
};


instance DIA_KREOL_TEACH_MANA(C_Info)
{
	npc = none_102_kreol;
	nr = 10;
	condition = dia_kreol_teach_mana_condition;
	information = dia_kreol_teach_mana_info;
	permanent = TRUE;
	description = " I want to increase my magical energy. " ;
};

func int dia_kreol_teach_mana_condition()
{
	if((KREOL_MYTEACHER == TRUE) && ((other.attribute[ATR_MANA_MAX] < T_MEGA) || (VATRAS_TEACHREGENMANA == FALSE)))
	{
		return TRUE;
	};
};

func void dia_kreol_teach_mana_info()
{
	AI_Output(other,self, " DIA_Kreol_TEACH_MANA_15_00 " );	// I want to increase my magical energy.
	AI_Output(self,other, " DIA_Kreol_TEACH_MANA_15_01 " );	// I can help you with this. How you use it is up to you.
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if ((Chapter >=   2 ) && (hero.guild ==   GIL_KDM ) && ( BACK_TEACHREGENMANA   ==   FALSE ))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA, " Mana Regen (Training Points: 10, Cost: 15000 coins) " ,DIA_Kreol_TEACH_MANA_Regen);
	};
};

func void dia_kreol_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other, " DIA_Kreol_TEACH_MANA_05_00 " );	// I can't help you with this anymore.
		AI_Output(self,other, " DIA_Kreol_TEACH_MANA_05_01 " );	// You're at your limits!
	};

	Info_ClearChoices(dia_kreol_teach_mana);
};

func void DIA_Kreol_TEACH_MANA_Regen()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_05 " );	// Teach me mana regeneration.

	cost = 10 ;
	money = 15000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Training: Mana Regeneration " );
		VATRAS_TEACHREGENMANA = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);
};

func void dia_kreol_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if ((Chapter >=   2 ) && (hero.guild ==   GIL_KDM ) && ( BACK_TEACHREGENMANA   ==   FALSE ))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA, " Mana Regen (Training Points: 10, Cost: 15000 coins) " ,DIA_Kreol_TEACH_MANA_Regen);
	};
};

func void dia_kreol_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if ((Chapter >=   2 ) && (hero.guild ==   GIL_KDM ) && ( BACK_TEACHREGENMANA   ==   FALSE ))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA, " Mana Regen (Training Points: 10, Cost: 15000 coins) " ,DIA_Kreol_TEACH_MANA_Regen);
	};
};


var int day_kreol_circle_noperm;

instance DIA_KREOL_CIRCLE(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_circle_condition;
	information = dia_kreol_circle_info;
	permanent = TRUE;
	description = " I want to learn the essence of magic. " ;
};


func int dia_kreol_circle_condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) <=   6 ) && ( CREOL_MYTEACHER   ==   TRUE ) && ( DIA_CREOL_CIRCLE_NOPERM   ==   FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_kreol_circle_info()
{
	AI_Output(other, self, " DIA_Kreol_CIRCLE_15_00 " );	// I want to understand the essence of magic.
	Info_ClearChoices(DIA_Kreol_CIRCLE);
	Info_AddChoice(DIA_Kreol_CIRCLE,Dialog_Back,DIA_Kreol_CIRCLE_Back);

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 1) && (Kapitel >= 1))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE, " 1 Circle of Magic (Training Points: 20) " ,DIA_Kreol_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE, " 2 Circle of Magic (Training Points: 30) " ,DIA_Kreol_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE, " 3 Circle of Magic (Training Points: 40) " ,DIA_Kreol_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE, " 4 Circle of Magic (Training Points: 60) " ,DIA_Kreol_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE, " 5 Circle of Magic (Training Points: 80) " ,DIA_Kreol_CIRCLE_5);
	}
	else  if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==  5 ) && (Chapter >=  5 ) && (MY_DarkOrder == LOG_Success) && (MY_JarCurse == LOG_Success) && ( MY_URNAZULRAGE  ==  LOG_SUCCESS )) ;
	{
		Info_AddChoice(DIA_Kreol_CIRCLE, " 6 Circle of Magic (Training Points: 100) " ,DIA_Kreol_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_31 " );	// It's not time yet. Come back later.
	};
};

func void DIA_Kreol_CIRCLE_Back()
{
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_0A " );	// Are you ready to enter the First Circle of Magic?
		AI_Output(other,self, " DIA_Kreol_CIRCLE_15_01 " );	// I'm ready to enter the First Circle.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_01 " );	// By joining the First Circle, you will learn how to use magical runes.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_02 " );	// Each rune contains the structure of a special magic spell.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_03 " );	// By using your own magical power, you can release the rune's magic.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_04 " );	// But unlike scrolls, which are essentially magic formulas, rune magic maintains the structure of the spell at all times.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_05 " );	// Each rune contains a magical power that you can take away at any time.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_06 " );	// Using a rune, like using a scroll, costs magical energy.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_07 " );	// With each new Circle you will learn more and more about runes.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_08 " );	// Use their power to know yourself.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_0B " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_Kreol_CIRCLE_15_02 " );	// I'm ready to enter the Second Circle.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_09 " );	// You've already learned to understand runes. It's time to deepen your knowledge.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_10 " );	// As you enter the Second Circle, you will learn the basics of powerful combat spells.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_11 " );	// But in order to know the true secrets of magic, you have a lot to learn.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_12 " );	// You already know that you can use any rune countless times, but only until you use up all the magic power.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_13 " );	// But before you do anything, think about whether it makes sense. You have the power to sow death and destruction with ease.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_14 " );	// The task of dark magicians is precisely this, but only those who practice a rational approach bring real benefit to Beliar. The true power of runes lies in the proper calculation of their use.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_15 " );	// Learn to assess the situation and distribute your forces.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_0C " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_Kreol_CIRCLE_15_03 " );	// What knowledge comes with the Third Circle?
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_16 " );	// The Third Circle is one of the most important stages in the life of every magician. Once you reach it, you will complete your search.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_17 " );	// You have already crossed a significant stage on the path of magic. You have learned how to use runes.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_18 " );	// This knowledge provides in the one who owns it, prudence, prudence and determination. Remember this. It will also serve as the basis for the next step.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_19 " );	// Possessing an understanding of the essence of runic magic and the methods of its application, you can destroy enemies with its help, or you can keep this secret knowledge in the bins of your mind. Leave them at rest.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_20 " );	// But you have to make a choice. Having made it in favor of using this magic, which is far from accessible to everyone, cast aside all doubts and, for the glory of Beliar, plunge opponents into oblivion.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_21 " );	// Find your way, and then you will know the power of decision.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_0D " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_Kreol_CIRCLE_15_04 " );	// I am ready to enter the Fourth Circle.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_22 " );	// You have completed the first three Circles. The time has come for you to comprehend the secrets of magic, the mastery of which thirsty for great power, adamant and inflexible, true magicians dream of mastering. Stubborn and devoted to the Dark God.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_23 " );	// The basis of rune magic is stone. A magical stone obtained from magical ore mined in mines.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_24 " );	// In the temples, she is endowed with magical formulas, and there the runes are turned into tools of our power.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_25 " );	// You now have the knowledge of all the temples of this world.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_27 " );	// Learn magic, and you will discover the secret of the power it bestows on us.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_28 " );	// And one more thing. Entering the fourth circle of magic, you are honored to wear the garb of the highest dark magicians.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_29 " );	// Few have been able to do this. Now you are one of the chosen ones of the God of Darkness!
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_30 " );	// Here, take this robe in recognition of your status.
		CreateInvItems(other,itar_dmt_h,1);
		AI_EquipArmor(other,itar_dmt_h);
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_0E " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_Kreol_CIRCLE_15_05 " );	// I am ready to enter the Fifth Circle.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_32 " );	// If you use your power without knowing how it works, you risk your life.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_33 " );	// So mark my words. You will understand their importance with time.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_34 " );	// Everywhere in nature we are surrounded by forces whose action is beyond our perception.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_35 " );	// The spirits of nature and the elements are a small part of that, whose invisible presence we can only guess.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_36 " );	// What is perceived as your own action may just be a game of spirits.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_37 " );	// The magician is the one who can penetrate the world of the mysterious, who can understand that even the invisible world has its own laws.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_38 " );	// This description of the magical picture of the world is like a law carved in stone by a higher power.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_39 " );	// Remember it well.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_40 " );	// I lift you up to the Sixth Circle of Magic.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_41 " );	// Note that only the most powerful of magicians can enter the Sixth Circle. It is for those whose life is a sign.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_42 " );	// Your sign is crimson Darkness!
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_43 " );	// The Sixth Circle will allow you to use the magic of any rune.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_44 " );	// Remember not to capture power, but be its source.
		AI_Output(self,other, " DIA_Kreol_CIRCLE_14_45 " );	// Be wise and prudent in your deeds. May Beliar, the Dark God and Lord of Darkness, give you strength!
		DIA_KREOL_CIRCLE_NOPERM = TRUE ;
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

instance DIA_KREOL_FINDDARKSOUL(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_finddarksoul_condition;
	information = dia_kreol_finddarksoul_info;
	permanent = FALSE;
	description = " Do the words of Mora Ulartu mean anything to you? " ;
};


func int dia_kreol_finddarksoul_condition()
{
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_finddarksoul_info()
{
	AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_00 " );	// Do Mora Ulartu's words mean anything to you?
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_01 " );	// How did you know about this?
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_03 " );	// I don't know much, but I'll try to briefly explain its essence to you.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_05 " );	// Mora Ulartu is a very ancient powerful spell. It is sometimes also called the Dungeon of Souls.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_06 " );	// It came from those time immemorial, when humanity was just beginning its journey in this world.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_07 " );	// It is not known exactly how this spell got into our world, but, apparently, Beliar himself had a hand in this!
	AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_09 " );	// Tell me, how can I get Mora Ulartu?
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_10 " );	// WHAT? Why do you need it?
	AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_14 " );	// I need this spell to capture the soul of one demon.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_22 " );	// The problem is that Mora Ulartu isn't just an ordinary spell.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_23 " );	// It's a gift! Beliar's gift to those who, in his opinion, are worthy of owning this secret knowledge. Only the Dark God himself can grant it to you!
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_24 " );	// And I don't think he'll consider you worthy!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_25 " );	// And besides, you're a fire mage, servant of Innos!
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_26 " );	// I'm afraid you don't stand a chance!
		CHANCEGETDARKSOUL = 1;
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_27 " );	// Plus, you're a paladin of Innos!
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_28 " );	// I'm afraid your chances are negligible!
		CHANCEGETDARKSOUL = 5;
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_29 " );	// And besides, you're a water mage, servant of Adanos!
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_30 " );	// Though there isn't much enmity between him and Beliar, I don't think it's worth counting too much!
		CHANCEGETDARKSOUL = 25;
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_31 " );	// Although the fact that you are a dark magician is definitely a plus in this case.
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_32 " );	// But I don't think you should count on it too much anyway!
		CHANCEGETDARKSOUL = 50;
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_33 " );	// Although, on the other hand, you did not make a vow to other gods.
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_34 " );	// Maybe this could be to your advantage in this case.
		CHANCEGETDARKSOUL = 75;
	};
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_35 " );	// Worth a try anyway. Unless, of course, you're still interested.
	AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_39 " );	// And what do I need to do in order for Beliar to grant me Mora Ulartu?
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_42 " );	// First you need to have something that will interest the Dark God. There is one more thing that might interest him.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_46 " );	// There is one very powerful artifact - the Triramar Amulet.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_47 " );	// I don't know exactly who created it. But I guess it was Beliar himself!
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_48 " );	// How else to explain that from the time of its creation until the last moment, the artifact was in one of the temples dedicated to the Dark God.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_51 " );	// However, half a century ago, the paladins of Innos destroyed this temple.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_52 " );	// They didn't ignore the artifact itself. Unable to destroy it, they safely hid it from prying eyes.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_53 " );	// And the power of Innos helped them resist the wrath of Beliar, who wanted to return him to himself.
	AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_54 " );	// What's so special about it?
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_55 " );	// One of the four essences of the Dark God is hidden in it.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_56 " );	// For those who served Beliar, this artifact was the source of their power...
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_57 " );	// ...and for the Dark God, he was an integral part of himself!
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_60 " );	// Remember: Beliar is cunning and cunning!
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_61 " );	// Of course, he will be glad to have this artifact back. But it may turn out that this is where his gratitude ends.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_63 " );	// Besides, if the paladins find out about this, you yourself will understand what it threatens you with.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_64 " );	// But what to do in this case is up to you.
	AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_65 " );	// Where do paladins store this artifact?
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_66 " );	// I guess they hid it somewhere here on the island.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_68 " );	// Most likely, this place is securely hidden from prying eyes, and it is almost impossible to get there.
	if(Npc_KnowsInfo(other,dia_pal_199_ritter_firstwarn) || Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_69 " );	// Maybe they keep it in the royal fort Azgan?
		AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_70 " );	// Never heard of this!
	};
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_72 " );	// It is unlikely that any of the paladins will talk to you about this.
	AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_74 " );	// What should I do if I do find a way to get this amulet?
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_75 " );	// It's very simple! Say a prayer to Beliar and place the amulet at the foot of his altar.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_76 " );	// Well, after that, ask him to grant you Mora Ulartu.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_77 " );	// Maybe you'll get lucky and get what you were looking for.
	AI_Output(other,self, " DIA_Kreol_FindDarkSoul_01_78 " );	// Okay, I'll do that.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_79 " );	// And one more thing...
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_80 " );	// Keep me updated. Let me know if you know anything about the amulet.
	AI_Output(self,other, " DIA_Kreol_FindDarkSoul_01_83 " );	// Now everything - you can go.
	KREOLLINE = TRUE;
	TELLABOUTDS = TRUE;
	TELLMORAKREOL = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Kreole told me about Mora Ulartu's ancient spell - the Dungeon of Souls. Apparently, this spell can only be bestowed by Beliar himself and my chances of it are not very high. However, Creole gave me an idea of ​​how it is possible to get the favor of the Dark God To do this, I need to get a certain Triramar Amulet - a powerful artifact in which Beliar invested part of his divine power and which was captured by the paladins during the destruction of one of the temples of the Dark God. Creole does not know exactly where the paladins hide this ancient artifact. ");
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " If I still manage to get the artifact Creole spoke of, I should offer a prayer to the Dark God, place the amulet on his altar and ask Beliar to grant him the spell I need for courtesy. True, Creole warned that it is possible I will fail in this matter - so I should not flatter myself too much. " );
};


instance DIA_KREOL_FINDETLU (C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_findetlu_condition;
	information = dia_kreol_findetlu_info;
	permanent = FALSE;
	description = " I found out where the paladins hide the Triramar amulet. " ;
};


func int dia_kreol_findetlu_condition()
{
	if((ETLUBEGINS == TRUE) && Npc_KnowsInfo(other,dia_kreol_finddarksoul) && (BEONETLU == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_findetlu_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Kreol_FindEtlu_01_00 " );	// I found out where the paladins hide the Triramar amulet.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_01 " );	// And where is it?
	AI_Output(other,self, " DIA_Kreol_FindEtlu_01_02 " );	// On the island of Etlu.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_03 " );	// Etlu? Yes, they hid it well.
	AI_Output(other,self, " DIA_Kreol_FindEtlu_01_04 " );	// And I also learned how to get there.
	AI_Output(other,self, " DIA_Kreol_FindEtlu_01_05 " );	// Here on the island there is a magical portal that leads straight to this island.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_06 " );	// Portal? I wonder where he came from?
	AI_Output(other,self, " DIA_Kreol_FindEtlu_01_07 " );	// It was built by the paladins.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_09 " );	// Then all you have to do is find this portal.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_11 " );	// Yes, and one more thing. I think I should immediately warn you about this.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_13 " );	// I'm pretty sure the paladins on the island won't welcome your visit.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_14 " );	// Apparently, this is a restricted area...
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_15 " );	// ...and anyone who shows up there uninvited has only one thing to look forward to.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_17 " );	// I think you know what!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Kreol_FindEtlu_01_18 " );	// Even though you're a paladin!
		AI_Output(self,other, " DIA_Kreol_FindEtlu_01_19 " );	// There, on the island, your status won't save you anymore!
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Kreol_FindEtlu_01_20 " );	// Even though you're a Firebender!
		AI_Output(self,other, " DIA_Kreol_FindEtlu_01_21 " );	// There, on the island, your status won't save you anymore!
	}
	else   if (hero.guild ==   GIL_KDW )
	{
		AI_Output(self,other, " DIA_Kreol_FindEtlu_01_22 " );	// Even though you're a Waterbender!
		AI_Output(self,other, " DIA_Kreol_FindEtlu_01_23 " );	// There, on the island, your status won't save you anymore!
	};
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_24 " );	// Therefore, before you go there, be well prepared. A tough fight awaits you!
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_25 " );	// Paladins will fight to the death protecting this artifact!
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_26 " );	// You can be sure of that.
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_27 " );	// And remember well - don't you dare wear this amulet!
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_28 " );	// He will kill you!
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_29 " );	// You just don't have the strength to resist his might!
	AI_Output(self,other, " DIA_Kreol_FindEtlu_01_31 " );	// Now go.
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Creole told me that I shouldn't expect a hospitable welcome on the island. I guess I'll have to cut my way with a sword. He also warned me not to wear the Triramar Amulet if I had it. Otherwise If so, I'll just die. " );
};


instance DIA_KREOL_ASKABOUTPEACEWAY(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_askaboutpeaceway_condition;
	information = dia_kreol_askaboutpeaceway_info;
	permanent = FALSE;
	description = " One more question. " ;
};


func int dia_kreol_askaboutpeaceway_condition()
{
	if (Npc_KnowsInfo(other,dia_kreol_found) && ( MEHASTRIRAVAR   ==   FALSE ) && ( ASKABOUTPEACEWAY   ==   FALSE ) && (other.guild !=   GIL_PAL ) && (other.guild !=   GIL_KDF )) ;
	{
		return TRUE;
	};
};

func void dia_kreol_askaboutpeaceway_info()
{
	AI_Output(other,self, " DIA_Kreol_AskAboutPeaceWay_01_00 " );	// One more question.
	AI_Output(other,self, " DIA_Kreol_AskAboutPeaceWay_01_03 " );	// Is there really no way to get this amulet from paladins without fighting them?
	AI_Output(self,other, " DIA_Kreol_AskAboutPeaceWay_01_04 " );	// Hmmm...(thoughtfully) Like I said, I don't know. And the paladins themselves are unlikely to give it to you just like that.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Kreol_AskAboutPeaceWay_01_05 " );	// Perhaps, if I were you, I would try to ask for help from the owner of the amulet - Beliar!
		if(other.guild == GIL_PAL)
		{
			AI_Output(self,other, " DIA_Kreol_AskAboutPeaceWay_01_06 " );	// But you are the paladin of Innos! So he won't be able to help you.
		}
		else
		{
			AI_Output(self,other, " DIA_Kreol_AskAboutPeaceWay_01_07 " );	// But you're a fire mage! So he won't be able to help you.
		};
		AI_Output(other,self, " DIA_Kreol_AskAboutPeaceWay_01_08 " );	// Okay, I'll come up with something myself.
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_AskAboutPeaceWay_01_09 " );	// However, if I were you, I would try to ask the owner of the amulet for help.
		AI_Output(other,self, " DIA_Kreol_AskAboutPeaceWay_01_10 " );	// You mean Beliar?
		AI_Output(self,other, " DIA_Kreol_AskAboutPeaceWay_01_11 " );	// Exactly him. Turn to him with a prayer, and perhaps you will have a chance.
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I asked Creole if there was another way to take the amulet from the paladins without causing a massacre. And he advised me to turn to Beliar himself! I hope he hears my pleas. " );
	};
	ASKABOUTPEACEWAY = TRUE;
};


instance DIA_KREOL_FINDAMULET(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_findamulet_condition;
	information = dia_kreol_findamulet_info;
	permanent = FALSE;
	description = " I got the Triramar amulet! " ;
};


func int dia_kreol_findamulet_condition()
{
	if ((Npc_HasItems(other,itmi_triramar) >=   1 ) && Npc_KnowsInfo(other,dia_creole_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_kreol_findamulet_info()
{
	B_GivePlayerXP(250);

	if(Npc_HasItems(other,ITKE_SI_SIGN) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_SI_SIGN,1);
	};
	if(Npc_HasItems(other,ITKE_HAGEN_SECRETKEY) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_HAGEN_SECRETKEY,1);
	};

	AI_Output(other,self, " DIA_Kreol_FindAmulet_01_00 " );	// I got the Triramar amulet!
	AI_Output(self,other, " DIA_Kreol_FindAmulet_01_01 " );	// (surprised) WHAT?! Did you manage to do it anyway?
	AI_Output(self,other, " DIA_Kreol_FindAmulet_01_03 " );	// Yes, you know how to surprise! Although it already ceases to be a revelation for me.
	AI_Output(self,other, " DIA_Kreol_FindAmulet_01_07 " );	// Maybe you made a mistake - maybe not. Okay, stop talking in vain!
	AI_Output(self,other, " DIA_Kreol_FindAmulet_01_08 " );	// Now, in order to get Mora Ulartu, you have only one thing left to do - perform the ceremony of offering a gift to Beliar.
	AI_Output(self,other, " DIA_Kreol_FindAmulet_01_09 " );	// Go to the nearest altar of the Dark God, lay his amulet at the base and ask to grant you the Prison of Souls - Beliar himself will take care of the rest!
	AI_Output(self,other, " DIA_Kreol_FindAmulet_01_10 " );	// You can find one of these altars in the back room of my tower.
	AI_Output(self,other, " DIA_Kreol_FindAmulet_01_11 " );	// And remember what I told you: The dark god is cunning and cunning!
	AI_Output(self,other, " DIA_Kreol_FindAmulet_01_12 " );	// Don't think that if you give him the amulet, you will definitely get your reward!
	AI_Output(other,self, " DIA_Kreol_FindAmulet_01_13 " );	// I hope all my efforts are not in vain.
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I showed the Creole amulet - it surprised him a lot! Now I should go to any Beliar altar, place the amulet at its base and ask the Dark God to accept this amulet and bestow Mora Ulartu on me. " );
	AI_StopProcessInfos(self);
};


instance DIA_KREOL_GETSUPERBELIARWEAPON(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_getsuperbeliarweapon_condition;
	information = dia_kreol_getsuperbeliarweapon_info;
	permanent = FALSE;
	description = " The dark god gave me Mora Ulartu! " ;
};


func int dia_kreol_getsuperbeliarweapon_condition()
{
	if (( Npc_HasItems( hero , self_moral ) >=   1 ) && Npc_KnowsInfo ( other , dia_creole_finddarksoul ))
	{
		return TRUE;
	};
};

func void dia_kreol_getsuperbeliarweapon_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Kreol_GetSuperBeliarWeapon_01_00 " );	// The dark god gave me Mora Ulartu!
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_01 " );	// WHAT?! Have you succeeded?
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_02 " );	// You surprise me more and more!
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_07 " );	// You now hold a powerful artifact that grants you the Soul Catcher ability!
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_08");	//Ловца Душ?
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_09 " );	// That's what they call those who are able to use this truly divine gift!
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_10 " );	// And I'll tell you honestly: not many people have this knowledge!
	AI_Output(other,self, " DIA_Kreol_GetSuperBeliarWeapon_01_11 " );	// And who exactly?
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_12 " );	// Mostly demons and similar beings who have inherited this ability at birth, or have been granted this knowledge. True, not all, but only the most powerful of them!
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_13 " );	// For people, this knowledge is practically inaccessible, although, as it turned out, there are exceptions.
	AI_Output(other,self, " DIA_Kreol_GetSuperBeliarWeapon_01_14 " );	// But why do we need souls?
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_15 " );	// (laughs) You still don't realize what you own now.
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_16 " );	// The soul is the most valuable thing that a living being has! This is the source of our magical power, or more simply - the mana that we use to create magic.
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_17 " );	// In addition, the soul of a living being has a number of other unusual properties. But I don't know much about them.
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_19 " );	// This is the key to unlimited power!
	AI_Output(other,self, " DIA_Kreol_GetSuperBeliarWeapon_01_20 " );	// Explain how to use all this knowledge?
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_21 " );	// It's not that hard. You have Mora Ulartu - this is quite enough to prevent the soul from slipping away after the death of its owner.
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_22 " );	// However, you can't use her power.
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_24 " );	// People do not know how to treat them in the same way as demons do, for example - to devour them, thereby increasing their strength and power.
	AI_Output(other,self, " DIA_Kreol_GetSuperBeliarWeapon_01_25 " );	// Then what should I do with them?
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_26 " );	// Perhaps the Dark God will be able to accept the souls you captured as a gift.
	AI_Output(self,other, " DIA_Kreol_GetSuperBeliarWeapon_01_27 " );	// And you can ask him for something valuable in return.
	AI_Output(other,self, " DIA_Kreol_GetSuperBeliarWeapon_01_29 " );	// Okay, I'm clear.
	KNOWSHOWDEALSOULS = TRUE;
	Log_CreateTopic(TOPIC_SUPERBELIARWEAPON_UPG,LOG_NOTE);
	B_LogEntry( TOPIC_SUPERBELIARWEAPON_UPG , " The Mora Ulartu rune I received gave me the Soul Catcher ability, with which I can captivate and capture the souls of any creature. In turn, I can present the collected souls as a gift to the Dark God, naturally not forgetting to beg from him something useful for yourself! " );
};


instance DIA_KREOL_GETSUPERSOUL(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_getsupersoul_condition;
	information = dia_kreol_getsupersoul_info;
	permanent = FALSE;
	description = " I have the soul of the archdemon S'anyak! " ;
};


func int dia_kreol_getsupersoul_condition()
{
	if ((Npc_HasItems(hero,itmi_stonesoul_senyak) >=   1 ) && ( TELLCANSUPERBELIERWEAPON   ==   FALSE ) && ( KNOWSHOWDEALSOULS   ==   TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_kreol_getsupersoul_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Kreol_GetSuperSoul_01_00 " );	// I have the soul of the archdemon S'enyak!
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_01 " );	// S'anyaka?! (maliciously) You didn't waste your time!
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_02 " );	// Well, in your hands is truly a real treasure! But you, as I see it, do not know at all what to do with it.
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_05 " );	// An archdemon's soul is unlike any other. Her magic power is huge, and you just can't cope with it.
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_06 " );	// But with a powerful magical artifact, you might be able to do it.
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_07 " );	// By investing a magical soul core into this item, you can increase its power!
	AI_Output(other,self, " DIA_Kreol_GetSuperSoul_01_08 " );	// And what should this item be?
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_09 " );	// (thinking) Well, for starters, it must have the magical essence of creation, because only the structure of such artifacts allows you to conclude in them the magical power of the soul.
	AI_Output(other,self, " DIA_Kreol_GetSuperSoul_01_10 " );	// What about Beliar's Claw?
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_11 " );	// CLAW?! I think he would be perfect for this.
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_12 " );	// Beliar's Dark magic was its creator!
	AI_Output(other,self, " DIA_Kreol_GetSuperSoul_01_14 " );	// How do I then transfer the soul of the archdemon to this artifact?
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_15 " );	// Any magical altar of the Dark God will do.
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_16 " );	// Its aura will allow you to perform a soul transfer ritual. Nothing more is required of you.
	AI_Output(self,other, " DIA_Kreol_GetSuperSoul_01_17 " );	// Except for the favor of Beliar himself!
	TELLCANSUPERBELIARWEAPON = TRUE;
	B_LogEntry( TOPIC_SUPERBELIARWEAPON_UPG , " In order to use the power of the soul of the archdemon S'enyak that I captured, I need an artifact that can absorb its power. The only item that can be used for such purposes is the Claw of Beliar! To perform the ritual of transferring the soul to this artifact, a magic altar will do Dark God. In addition, Beliar himself must approve my actions, otherwise nothing! " );
};


instance DIA_KREOL_NDM_TACHDEMONOLOG (C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_ndm_teachdemolog_condition;
	information = dia_kreol_ndm_teachdemenolog_info;
	permanent = TRUE;
	description = " Teach me the art of demonology. " ;
};


func int dia_kreol_ndm_teachdemenolog_condition()
{
	if ((hero.guild ==   GIL_KDM ) && ( CREOL_MYTEACHER   ==   TRUE ) && ( XARDASTELLABOUTDEMONOLOG   ==   TRUE ) && (( XARDASTEACHCASTDEMON_SIMPLE   ==   FALSE ) || ( XARDASTEACHCASTDEMON_LORD   ==   FALSE )))
	{
		return TRUE;
	};
};

func void dia_kreol_ndm_teachdemolog_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_TeachDemonolog_01_00 " );	// Teach me the art of demonology.
	AI_Output(self,other, " DIA_Kreol_NDM_TeachDemonolog_01_00 " );	// If you think you're ready for this, I'll teach you everything I know myself.
	Info_ClearChoices(dia_kreol_ndm_teachdemolog);
	Info_AddChoice(dia_kreol_ndm_teachdemolog,Dialog_Back,dia_kreol_ndm_teachdemolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Изучить демонологию.",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog( " Learn high demonology. " ,B_GetLearnCostTalent(other, NPC_TALENT_DEMONOLOG , 1 )),dia_kreol_ndm_teachdemonolog_high);
	};
};

func void dia_kreol_ndm_teachdemolog_back()
{
	if(XARDASTEACHCASTDEMON_LORD == TRUE)
	{
		AI_Output(self,other, " DIA_Kreol_NDM_TeachDemonolog_BACK_01_00 " );	// Now it's up to you to summon the highest demons themselves.
		AI_Output(self,other, " DIA_Kreol_NDM_TeachDemonolog_BACK_01_01 " );	// But be careful! Remember: to subdue these creatures is incredibly difficult!
		AI_Output(self,other, " DIA_Kreol_NDM_TeachDemonolog_BACK_01_02 " );	// A mistake in this case is tantamount to certain death.
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemolog);
};

func void dia_kreol_ndm_teachdemolog_simple()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		XARDASTEACHCASTDEMON_SIMPLE = TRUE;
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemolog);
	Info_AddChoice(dia_kreol_ndm_teachdemolog,Dialog_Back,dia_kreol_ndm_teachdemolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Изучить демонологию.",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog( " Learn high demonology. " ,B_GetLearnCostTalent(other, NPC_TALENT_DEMONOLOG , 1 )),dia_kreol_ndm_teachdemonolog_high);
	};
};

func void dia_kreol_ndm_teachdemanolog_high()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		AI_Output(self,other, " DIA_Kreol_NDM_TeachDemonolog_High_01_00 " );	// Know the power given to you, and you will gain true power!
		XARDASTEACHCASTDEMON_LORD = TRUE;
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemolog);
	Info_AddChoice(dia_kreol_ndm_teachdemolog,Dialog_Back,dia_kreol_ndm_teachdemolog_back);
};


instance DIA_KREOL_TEACHSACTANOME(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_teachsactanome_condition;
	information = dia_kreol_teachsactanome_info;
	permanent = TRUE;
	description = " Teach me the art of Sakta Nomen! (Exp: 50, Cost: 50,000 coins) " ;
};


func int dia_kreol_teachsactanome_condition()
{
	if ((hero.guild ==   GIL_KDM ) && ( XARDAS_TEACHSACTANOME   ==   TRUE ) && ( XARDAS_KNOWSSACTANOME   ==   FALSE ))
	{
		return TRUE;
	};
};

func void dia_kreol_teachsactanome_info()
{
	AI_Output(other,self, " DIA_Kreol_TeachSactaNome_01_00 " );	// Teach me the art of Sakta Nomen!
	AI_Output(self,other, " DIA_Kreol_TeachSactaNome_01_01 " );	// Are you really sure about this?
	Info_ClearChoices(dia_kreol_teachsactanome);
	Info_AddChoice(dia_kreol_teachsactanome, " Not yet. " ,dia_kreol_teachsactanome_no);
	Info_AddChoice(dia_kreol_teachsactanome,"Да, уверен.",dia_kreol_teachsactanome_yes);
};

func void dia_kreol_teachsactanome_no()
{
	AI_Output(other,self, " DIA_Kreol_TeachSactaNome_No_01_00 " );	// Not yet.
	AI_Output(self,other, " DIA_Kreol_TeachSactaNome_No_01_01 " );	// Okay, whatever you say.
	Info_ClearChoices(dia_kreol_teachsactanome);
};

func void dia_kreol_teachsactanome_yes()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50000) && (other.lp >= 50))
	{
		AI_Print(PRINT_SACTANOME);
		Snd_Play("MFX_FEAR_CAST");
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_Output(self,other, " DIA_Kreol_TeachSactaNome_Yes_01_01 " );	// Then know the true power of dark magic, and may your sacrifice not be in vain.
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other, " DIA_Kreol_TeachSactaNome_Yes_01_02 " );	// SAKTA SHADAR NOMEN TAR MADAR SATAG!
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other, " DIA_Kreol_TeachSactaNome_Yes_01_03 " );	// Use the knowledge you have gained wisely, and may the crimson Darkness guide your path!
		other.lp = other.lp - 50;
		RankPoints = RankPoints + 50;
		Npc_RemoveInvItems(other,ItMi_Gold,50000);
		XARDAS_KNOWSSACTANOME = TRUE;
		B_LogEntry( TOPIC_ADDON_DMTTEACHER , " I have learned the art of Sakta Nomen - 'Blood Sacrifice'. " );

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};

		Info_ClearChoices(dia_kreol_teachsactanome);
	}
	else if(other.lp < 50)
	{
		AI_Output(self,other, " DIA_Kreol_TeachSactaNome_01_04 " );	// You are not yet ready to master this knowledge.
		AI_Output(self,other, " DIA_Kreol_TeachSactaNome_01_05 " );	// You don't have much experience yet! Let's talk about it later.
		Info_ClearChoices(dia_kreol_teachsactanome);
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_TeachSactaNome_01_07 " );	// You don't have enough gold!
		AI_Output(self,other, " DIA_Kreol_TeachSactaNome_01_08 " );	// Let's talk about it when you have it.
		Info_ClearChoices(dia_kreol_teachsactanome);
	};
};

instance DIA_KREOL_Kill_Pals(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Pals_condition;
	information = DIA_KREOL_Kill_Pals_info;
	permanent = FALSE;
	description = " Can I do something for the Dark God? " ;
};

func int DIA_KREOL_Kill_Pals_condition()
{
	if ((hero.guild ==   GIL_KDM ) && ( CAPITELORCATC   ==   FALSE ))
	{
		return TRUE;
	};
};

func void DIA_KREOL_Kill_Pals_info()
{
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_01_01 " );	// Can I do something for the Dark God?
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_01_02 " );	// (arrogantly) You can ask him yourself. But I really could use some help!
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_01_03 " );	// What are we talking about?
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_01_04 " );	// The fact is that I decided to perform one dark magic ritual here.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_01_05 " );	// But, unfortunately, I found that I lacked certain material for this.
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_01_06 " );	// Which one exactly?
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_01_07 " );	// Nothing special. Just fresh human flesh!
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_01_08 " );	// And you call it 'just'?!
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_01_09 " );	// For me, these pathetic people are just material for experiments and research.  
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_01_10 " );	// I'm not interested in their worthless lives!
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_01_11 " );	// So will you help me solve this problem or not?
	Info_ClearChoices(DIA_KREOL_Kill_Pals);
	Info_AddChoice(DIA_KREOL_Kill_Pals, " No, that's not for me. " ,DIA_KREOL_Kill_Pals_no);
	Info_AddChoice(DIA_KREOL_Kill_Pals, " Yes, of course. " ,DIA_KREOL_Kill_Pals_yes);
};

func void DIA_KREOL_Kill_Pals_no()
{
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_no_01_01 " );	// No, that's not for me.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_no_01_02 " );	// I thought you'd turn out to be a weakling... (with contempt) I don't understand how you could become a dark magician at all!
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_no_01_03 " );	// Your place is most likely among these sissies who worship their fiery false god.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_no_01_04 " );	// So get out of my sight!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);

};

func void DIA_KREOL_Kill_Pals_yes()
{
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_yes_01_01 " );	// Yes, of course.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_02 " );	// Well. Your zeal is commendable.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_03 " );	// Then listen! There are two small human camps nearby.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_04 " );	// One is above the cliff of the sea, and the second is below, in the crevice.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_05 " );	// I've already tried sending my servants to them. But to no avail!
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_yes_01_06 " );	// What's the reason?
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_07 " );	// The fact is that the camp located above is protected by some very strong magic!
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_08 " );	// Its nature is not entirely clear to me, and so far I can't do anything about it.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_09 " );	// But the camp below seems more defenseless to me.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_10 " );	// However, the problem is that there are paladins among them!
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_11 " );	// And these warriors of Innos deal with the undead very easily.
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_yes_01_12 " );	// And what do you want from me?
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_13 " );	// I want you to use your dark mage skills and destroy all those bastards!
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_14 " );	// And when the paladins fall, my servants will do the rest.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_15 " );	// But you can kill everyone yourself. The nuances are of little interest to me.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_yes_01_16 " );	// The main thing is that this will give me the opportunity to continue my preparations for my magic ritual.
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_yes_01_17 " );	// Okay, I'll take care of the paladins.
	MIS_KILL_PALS = LOG_Running;
	Log_CreateTopic(TOPIC_KILL_PALS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILL_PALS,LOG_Running);
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
};

instance DIA_KREOL_Kill_Pals_Done(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Pals_Done_condition;
	information = DIA_KREOL_Kill_Pals_Done_info;
	permanent = FALSE;
	description = " Paladins are dead. " ;
};

func int DIA_KREOL_Kill_Pals_Done_condition()
{
	if ((hero.guild ==   GIL_KDM ) && ( CAPITELORCATC   ==   FALSE ) && ( MY_KILL_PALS   == LOG_Running ) && ( ALBERTISDEAD   ==   TRUE )) ;
	{
		return TRUE;
	};
};


func void DIA_KREOL_Kill_Pals_Done_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_Done_01_01 " );	// Paladins are dead.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_Done_01_02 " );	// Great! I will immediately send my servants to harvest this harvest of death.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_Done_01_03 " );	// And you will be richly rewarded for your efforts.
	AI_Output(other,self, " DIA_KREOL_Kill_Pals_Done_01_04 " );	// Really generous, I hope.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_Done_01_05 " );	// You can be sure. Here, take these magic potions.
	AI_Output(self,other, " DIA_KREOL_Kill_Pals_Done_01_06 " );	// I'm sure you know what to do with them.
	B_GiveInvItems(self,other,ITPO_DEMON_POTION,1);
	MIS_KILL_PALS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILL_PALS,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILL_PALS , " Creole was satisfied with my work. " );
};


instance DIA_KREOL_Kill_Done_Rings(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Done_Rings_condition;
	information = DIA_KREOL_Kill_Done_Rings_info;
	permanent = FALSE;
	description = " I have paladin rings. " ;
};

func int DIA_KREOL_Kill_Done_Rings_condition()
{
	if((hero.guild == GIL_KDM) && (Npc_HasItems(hero,itri_quest_pal_ring) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KREOL_Kill_Done_Rings_info()
{
	var int RingSum;
	var int RingSumXP;
	var int RingSumGold;

	AI_Output(other,self, " DIA_KREOL_Kill_Done_Rings_01_01 " );	// I have paladin rings. Are you interested in them?
	AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_03 " );	// (infuriated) Get this nasty thing away from me immediately! Are you out of your mind to suggest this to me?!
	AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_04 " );	// But wait. Are you saying they belonged to paladins?
	AI_Output(other,self, " DIA_KREOL_Kill_Done_Rings_01_05 " );	// Yes, that's right.
	AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_06 " );	// Maybe they will really come in handy for me.
	AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_07 " );	// I can turn them into artifacts of darkness that can bend their master to my will.
	AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_08 " );	// (ominously) And I'll have my own army. An army of converted paladins!
	AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_09 " );	// So get them here immediately!
	AI_Output(other,self, " DIA_KREOL_Kill_Done_Rings_01_10 " );	// Here, take this.

	RingSum = Npc_HasItems(hero,itri_quest_pal_ring);
	B_GiveInvItems(other,self,itri_quest_pal_ring,RingSum);
	Npc_RemoveInvItems(self,itri_quest_pal_ring,Npc_HasItems(self,itri_quest_pal_ring));

	if(RingSum == 1)
	{
		RingSumXP = RingSum *   100 ;
		RingSumGold = RingSum *   100 ;
		AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_11 " );	// How? One ring? Are you kidding me?!
		AI_Output(other,self, " DIA_KREOL_Kill_Done_Rings_01_12 " );	// Sorry, but I don't have any more.
		AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_13 " );	// Here, take your reward and get the hell out of here!
	}
	else if(RingSum <= 3)
	{
		RingSumXP = RingSum *   150 ;
		RingSumGold = RingSum *   150 ;
		AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_14 " );	// Hmmm. You don't have that many.
		AI_Output(other,self, " DIA_KREOL_Kill_Done_Rings_01_15 " );	// Sorry, but I don't have any more.
		AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_16 " );	// Okay, here's your reward. Even though you don't deserve it!
	}
	else if(RingSum > 3)
	{
		RingSumXP = RingSum *   200 ;
		RingSumGold = RingSum *   200 ;
		AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_17 " );	// Great! This amount is enough for me.
		AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_18 " );	// Here's your reward. You honestly deserve it!
	};

	B_GivePlayerXP(RingSumXP);
	B_GiveInvItems(self,other,ItMi_Gold,RingSumGold);
	AI_StopProcessInfos(self);

	if(RingSum <= 1)
	{
		Npc_SetRefuseTalk(self,30);
	};
};

instance DIA_Kreol_MonasterySecret(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_MonasterySecret_condition;
	information = DIA_Kreol_MonasterySecret_info;
	permanent = FALSE;
	description = " I have one scroll. " ;
};

func int DIA_Kreol_MonasterySecret_condition()
{
	if((MonasterySecretLeadOW == TRUE) && (MIS_MonasterySecret == LOG_Running) && (Npc_HasItems(hero,ITWr_MonasterySecretLeadOW) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MonasterySecret_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_01_01 " );	// I have one scroll.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_02 " );	// (disparagingly) And why should I care?
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_01_03 " );	// Because it mentions your name.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_04 " );	// True? Okay, let me take a look at it.
	B_GiveInvItems(other,self,ITWr_MonasterySecretLeadOW,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_05 " );	// Hmmm...(thoughtfully) Where did you get it from?
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_01_06 " );	// I found it in the tower of Amon Shen.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_07 " );	// In the old tower of the necromancer Nergal?!
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_01_08 " );	// Well, apparently, yes. Exactly there.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_09 " );	// So this madman dreamed of getting this artifact for the rest of his days!
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_01_10 " );	// Are you talking about an item that can control a living dragon?
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_11 " );	// About him!
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_01_12 " );	// And what do you know about him?
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_13 " );	// (sarcastically) Not much. One thing I know for sure: it looks like a magic wand, at the base of which is the dragon's fiery eye.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_14 " );	// The magician who created this artifact broke the wand into four equal parts before his death and hid them on this island!
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_01_15 " );	// But how do you know all this?
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_16 " );	// I have one of the pieces of this wand! But you'll never get it, don't even dream about it.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_17 " );	// Besides, without the other three parts, it's just a pile of scrap metal, no more.
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_01_18 " );	// And if I bring you the rest of the pieces, what then?
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_01_19 " );	// Then let's continue this conversation! It's clear?
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_20");	//Вполне.
	MonasterySecret_Kreol = TRUE;
	B_LogEntry(TOPIC_MonasterySecret, " Creole told me about an artifact that I was interested in. It turns out that it looks like a magical wand at the base of which a real dragon's eye is inserted! However, the magician who created this item, before his death, divided the wand into four equal parts and hid them somewhere on the island. One part is located near Creole itself, but the others, apparently, I have to find myself. Unless, of course, I want to hear the continuation of this story. " );
};

instance DIA_Kreol_MonasterySecret_Done(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_MonasterySecret_Done_condition;
	information = DIA_Kreol_MonasterySecret_Done_info;
	permanent = FALSE;
	description = " I've brought back all the missing pieces of the wand. " ;
};

func int DIA_Kreol_MonasterySecret_Done_condition()
{
	if ((Kapitel <   6 ) && (MonasterySecret_Kreol ==   TRUE ) && (MIS_MonasterySecret == LOG_Running) && (Npc_HasItems(hero,ItMi_DragonStaffPiece_01) > =   1 ) && (Npc_HasItems(hero,ItMi_DragonStaff_04) > =   1 ) 1 )) 
	{
		return TRUE;
	};
};

func void DIA_Kreol_MonasterySecret_Done_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_Two_01_01 " );	// I've brought back all the missing pieces of the wand.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_02 " );	// (arrogantly) I won't believe it until I see it with my own eyes!
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_Two_01_03 " );	// Here, look.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_01,1);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_03,1);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_04,1);
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_04 " );	// Yes, it looks like they really are! I would never have thought that someone would be able to do this.
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_Two_01_05 " );	// You promised to tell me more about this artifact.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_06 " );	// (imperiously) Of course. I will keep my word!
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_07 " );	// You already know that with this wand you can summon a real dragon to this world.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_08 " );	// In terms of its strength, it will certainly yield to those ancient creatures that lived here in the Valley of Mines.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_09 " );	// However, this does not mean that it will be absolutely useless for its owner!
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_10 " );	// But in order to give the wand its full power, one more thing is needed.
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_Two_01_11 " );	// What else do you need?
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_12 " );	// Dragon eye! These pieces of iron are useless unless imbued with the power of the true eye of this ancient being.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_13 " );	// It is with his help that the master controls the summoned creature. Otherwise, it simply will not obey his will.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_14 " );	// Unfortunately, you killed all the dragons in this Valley.
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_15 " );	// So you can keep this garbage for yourself!
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItMi_DragonStaffPiece_01,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_02,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_03,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_04,1);
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_Two_01_16 " );	// Can't do anything?
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_17 " );	// (grouchily) Do you see whole flocks of ancient creatures around you?!
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_Two_01_18 " );	// But if I do meet a dragon, how can I recreate this artifact?
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_19 " );	// You're stubborn as a donkey! But if you really think you'll get another chance to meet one of them...
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_20 " );	// ...then you just need to forge all the parts of the wand together and insert the eye into its base!
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_21 " );	// The power of the wand will animate the eye, and then the wand itself can be used.
	AI_Output(other,self, " DIA_Kreol_MonasterySecret_Two_01_22 " );	// Everything is clear with the eye. What about bones?
	AI_Output(self,other, " DIA_Kreol_MonasterySecret_Two_01_23 " );	// You will need four dragon skulls to make the fasteners. No more, no less!
	MIS_MonasterySecret = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MonasterySecret,LOG_SUCCESS);
	B_LogEntry(TOPIC_MonasterySecret, " I'll need a few more items to make the wand - four dragon skulls and a dragon's eye! " );
};

var int EligorNoSword;
var int EligorNoBow;
var int EligorNoStaff;
var int CanTellSleeperAgain;

instance DIA_Kreol_Sleeper(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_condition;
	information = DIA_Kreol_Sleeper_info;
	permanent = FALSE;
	description = " What do you know about the Sleeper? " ;
};

func int DIA_Kreol_Sleeper_condition()
{
	if((SleeperOldIsDead == FALSE) && (NeedDemonolog == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_Kreol_Sleeper_01_01 " );	// What do you know about the Sleeper?
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_02 " );	// (thoughtfully) He is the oldest of the demons from the time when this world was just born.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_03 " );	// It was his presence in this part of the island that made me appear here.
	AI_Output(other,self, " DIA_Kreol_Sleeper_01_04 " );	// Why do you even need it?
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_05 " );	// I wanted to more thoroughly explore the demonic aura of this creature, its magical properties.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_06 " );	// But, unfortunately, one local oaf somehow managed to exorcise this demon from the human world.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_07 " );	// And many years of my research went to waste!
	AI_Output(other, self, " DIA_Kreol_Sleeper_01_08 " );	// You're wrong! The sleeper has returned.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_09 " );	// (in disbelief) What? How do you know this?
	AI_Output(other,self, " DIA_Kreol_Sleeper_01_10 " );	// Because I'm the idiot who banished him back then.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_11 " );	// You?! (gazing intently) Although, yes, you could have done it!
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_12 " );	// If you managed to destroy the Avatar of Beliar himself, then you could succeed with the Sleeper.
	AI_Output(other,self, " DIA_Kreol_Sleeper_01_13 " );	// How can I defeat him this time?
	AI_Output(other,self, " DIA_Kreol_Sleeper_01_14 " );	// Maybe the great dark magician and the chosen one of Beliar himself will tell me how to do this?
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_15 " );	// Hmmm...(enough) And what's stopping you from doing it again?
	AI_Output(other,self, " DIA_Kreol_Sleeper_01_16 " );	// His magic! She drives me crazy.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_17 " );	// Of course! This is not surprising!
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_18 " );	// After all, you're just a mere mortal! And he is the oldest of the demons...
	AI_Output(other,self, " DIA_Kreol_Sleeper_01_19 " );	// So will you give me advice or not?
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_20 " );	// Okay. We will do so! Let's make a deal.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_21 " );	// I'll tell you how to counter his mental attacks, and you in turn will bring me his heart!
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_22 " );	// This is enough for my research. Well, agreed?
	AI_Output(other,self, " DIA_Kreol_Sleeper_01_23 " );	// I don't have a choice. So I agree.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_24 " );	// Good. Then listen to me carefully.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_25 " );	// You need an artifact that can protect your mind from demonic influence.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_26 " );	// It's called the Crown of Demons! It was created by Beliar himself and presented as a gift to the most powerful demon of this world.
	AI_Output(other, self, " DIA_Kreol_Sleeper_01_27 " );	// I wonder who it is?
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_28 " );	// Eligor, the lord of Lang - the abode of demons... (respectfully) But he won't give it to you just like that!
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_29 " );	// After all, this is the same as the crown on the head of the king.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_30 " );	// And I'm even afraid to imagine what he might demand from you in return.
	AI_Output(self,other, " DIA_Kreol_Sleeper_01_31 " );	// Hmmm...( peering intently) What do you even have to offer?
	Info_ClearChoices(DIA_Kreol_Sleeper);
	Info_AddChoice(DIA_Kreol_Sleeper, " Unfortunately, nothing equals. " ,DIA_Kreol_Sleeper_No);

	if ((Npc_HasItems(hero, ITMI_HELMSLEEPER ) >=   1 ) || (Npc_HasItems(hero, ITMI_HELMSLEEPER_MIS ) >=   1 ))
	{
		Info_AddChoice(DIA_Kreol_Sleeper, " Here's the Sleeper mask! " ,DIA_Kreol_Sleeper_Mask);
	};
	if(hero.guild != GIL_KDW)
	{
		if(Npc_HasItems(hero,G3_ARMOR_HELMET_CRONE) >= 1)
		{
			Info_AddChoice(DIA_Kreol_Sleeper, " I have a Crown of Ice! " ,DIA_Kreol_Sleeper_Adanos);
		};
	};
	if((EligorNoSword == FALSE) && (Npc_HasItems(hero,ITMW_2H_DRAGONMASTER) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper, " (offer Dragonlord Sword) " ,DIA_Kreol_Sleeper_Sword);
	};
	if((EligorNoBow == FALSE) && (Npc_HasItems(hero,ITRW_G3_DEMON_BOW_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper, " (offer Bow Color of Death) " ,DIA_Kreol_Sleeper_Bow);
	};
	if ((EligorNoStaff ==   FALSE ) && (Npc_HasItems(hero, ITMW_2H_KMR_DAEMONSTAFF_01 ) >=   1 ))
	{
		Info_AddChoice(DIA_Kreol_Sleeper, " (offer Staff Soul Suppressor) " ,DIA_Kreol_Sleeper_Staff);
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		if ((Npc_HasItems(hero,ItMi_InnosEye_MIS) >=   1 ) || (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >=   1 ))
		{
			Info_AddChoice(DIA_Kreol_Sleeper, " (suggest Eye of Innos) " ,DIA_Kreol_Sleeper_Innos);
		};
	};
};

func void DIA_Kreol_Sleeper_No()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_No_01_01 " );	// Unfortunately, nothing worthwhile.
	AI_Output(self,other, " DIA_Kreol_Sleeper_No_01_02 " );	// Then we have nothing to discuss.
	CanTellSleeperAgain = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Mask()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Mask_01_01 " );	// I have a Sleeper mask!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_02 " );	// Yes, it's pretty valuable stuff!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_03 " );	// And she could well interest Eligor.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_04 " );	// I think we'll do this... (thoughtfully) You'll give it to me now.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_05 " );	// And I, in turn, will prepare everything necessary for the demon summoning ritual.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_06");	//Согласен?
	AI_Output(other,self, " DIA_Kreol_Sleeper_Mask_01_07 " );	// Okay, hold her.

	if(Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1)
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER_MIS,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER_MIS,1);
	};

	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_08 " );	// Great! Try to visit me in a couple of days.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_09 " );	// This is enough time for me to settle the matter with Eligor himself.
	AI_Output(other,self, " DIA_Kreol_Sleeper_Mask_01_10 " );	// Good! But don't try to fool me.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_11 " );	// (arrogantly) Don't worry. A deal is a deal!
	B_LogEntry( TOPIC_SLEEPERBACK , " I gave the Sleeper Mask to Creole in hopes of obtaining a powerful artifact called the 'Crown of Demons'! It's the only way I can resist the Sleeper's magic. Its current owner is Eligor, the most powerful demon in this world. In a couple of days, I'll be standing again drop by Creole for the latest instructions... " );
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 1;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Adanos()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Adanos_01_01 " );	// I have the Crown of Ice!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_02 " );	// The oldest artifact created by Adanos himself?
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_03 " );	// Yes, that might well interest Eligor.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_04 " );	// I think we'll do this... (thoughtfully) You'll give it to me now.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_05 " );	// And I, in turn, will prepare everything necessary for the demon summoning ritual.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_06");	//Согласен?
	AI_Output(other,self, " DIA_Kreol_Sleeper_Adanos_01_07 " );	// Okay, hold the crown.
	B_GiveInvItems(other,self,G3_ARMOR_HELMET_CRONE,1);
	Npc_RemoveInvItems(self,G3_ARMOR_HELMET_CRONE,1);
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_08 " );	// Great! Then try to visit me in a couple of days.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_09 " );	// This is enough time for me to settle the matter with Eligor himself.
	AI_Output(other,self, " DIA_Kreol_Sleeper_Adanos_01_10 " );	// Good! But don't try to fool me.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_11 " );	// (arrogantly) Don't worry. A deal is a deal!
	B_LogEntry( TOPIC_SLEEPERBACK , " I gave Creole the 'Crown of Ice' in hopes of obtaining a powerful artifact called the 'Crown of Demons'! It's the only way I can resist the Sleeper's magic. Its current owner is Eligor, the most powerful demon in this world. I'll be back in a couple of days it is worth visiting Creole again to get the latest instructions... " );
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 2;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Sword()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Sword_01_01 " );	// I have the Dragonlord sword!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Sword_01_02 " );	// Hmmm... (thoughtfully) Nice weapon! But it is unlikely that it will interest Eligor.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Sword_01_03 " );	// Try suggesting something else.
	EligorNoSword = TRUE;
};

func void DIA_Kreol_Sleeper_Bow()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Bow_01_01 " );	// I have a Bow Color of Death!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Bow_01_02 " );	// No, that's not it.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Bow_01_03 " );	// Need something really valuable to impress Eligor!
	EligorNoBow = TRUE;
};

func void DIA_Kreol_Sleeper_Staff()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Staff_01_01 " );	// I have a Soul Extinguisher staff!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Staff_01_02 " );	// (contemptuously) Why would a demon lord need him?
	AI_Output(self,other, " DIA_Kreol_Sleeper_Staff_01_03 " );	// You'd better think twice before offering him any rubbish.
	EligorNoStaff = TRUE;
};

func void DIA_Kreol_Sleeper_Innos()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Innos_01_01 " );	// I have the Eye of Innos!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_02 " );	// Hmmm... (thoughtfully) The oldest paladin artifact?
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_03 " );	// Yes, that might well interest Eligor.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_04 " );	// I think we'll do this... (thoughtfully) You'll give it to me now.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_05 " );	// And I, in turn, will prepare everything necessary for the demon summoning ritual.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_06 " );	// Agree?
	AI_Output(other,self, " DIA_Kreol_Sleeper_Innos_01_07 " );	// Okay, hold the amulet.

	if (Npc_HasItems(hero,ItMi_InnosEye_MIS) >=   1 )
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_MIS,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_Discharged_Mis,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
	};

	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_08 " );	// Great! Try to visit me in a couple of days.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_09 " );	// This is enough time for me to settle the matter with Eligor himself.
	AI_Output(other,self, " DIA_Kreol_Sleeper_Innos_01_10 " );	// Good! But don't try to fool me.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_11 " );	// (arrogantly) Don't worry. A deal is a deal!
	B_LogEntry( TOPIC_SLEEPERBACK , " I gave Creole the 'Eye of Innos' in hopes of obtaining a powerful artifact called the 'Crown of Demons'! Only with its help will I be able to resist the Sleeper's magic. Its current owner is Eligor, the most powerful demon of this world. In a couple of days I it is worth visiting Creole again to get the latest instructions... " );
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 3;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_Again(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_Again_condition;
	information = DIA_Kreol_Sleeper_Again_info;
	permanent = TRUE;
	description = " Regarding our last conversation... " ;
};

func int DIA_Kreol_Sleeper_Again_condition()
{
	if((SleeperOldIsDead == FALSE) && (CanTellSleeperAgain == TRUE) && (HasSleeperDefence == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_Again_info()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Again_01_01 " );	// Regarding our last conversation...
	AI_Output(self,other, " DIA_Kreol_Sleeper_Again_01_02 " );	// What? Did you bring me something interesting?
	Info_ClearChoices(DIA_Kreol_Sleeper_Again);
	Info_AddChoice(DIA_Kreol_Sleeper_Again, " Unfortunately, nothing worthwhile. " ,DIA_Kreol_Sleeper_Again_No);

	if ((Npc_HasItems(hero, ITMI_HELMSLEEPER ) >=   1 ) || (Npc_HasItems(hero, ITMI_HELMSLEEPER_MIS ) >=   1 ))
	{
		Info_AddChoice(DIA_Kreol_Sleeper, " Here's the Sleeper mask! " ,DIA_Kreol_Sleeper_Mask);
	};
	if(hero.guild != GIL_KDW)
	{
		if(Npc_HasItems(hero,G3_ARMOR_HELMET_CRONE) >= 1)
		{
			Info_AddChoice(DIA_Kreol_Sleeper_Again, " I have a Crown of Ice! " ,DIA_Kreol_Sleeper_Again_Adanos);
		};
	};
	if((EligorNoSword == FALSE) && (Npc_HasItems(hero,ITMW_2H_DRAGONMASTER) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again, " (offer Dragon Master sword) " ,DIA_Kreol_Sleeper_Again_Sword);
	};
	if((EligorNoBow == FALSE) && (Npc_HasItems(hero,ITRW_G3_DEMON_BOW_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again, " (offer Bow Color of Death) " ,DIA_Kreol_Sleeper_Again_Bow);
	};
	if ((EligorNoStaff ==   FALSE ) && (Npc_HasItems(hero, ITMW_2H_KMR_DAEMONSTAFF_01 ) >=   1 ))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again, " (offer to hand over Soul Extinguisher staff) " ,DIA_Kreol_Sleeper_Again_Staff);
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		if ((Npc_HasItems(hero,ItMi_InnosEye_MIS) >=   1 ) || (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >=   1 ))
		{
			Info_AddChoice(DIA_Kreol_Sleeper_Again, " (offer Eye of Innos) " ,DIA_Kreol_Sleeper_Again_Innos);
		};
	};
};

func void DIA_Kreol_Sleeper_Again_No()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_No_01_01 " );	// Unfortunately, nothing worthwhile.
	AI_Output(self,other, " DIA_Kreol_Sleeper_No_01_02 " );	// Then we have nothing to discuss. And stop wasting my time!
	CanTellSleeperAgain = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Mask()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Mask_01_01 " );	// I have a Sleeper mask.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_02 " );	// Yes, it's pretty valuable stuff.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_03 " );	// And she could well interest Eligor.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_04 " );	// I think we'll do this... (thoughtfully) You'll give it to me now.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_05 " );	// And I, in turn, will prepare everything necessary for the demon summoning ritual.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_06");	//Согласен?
	AI_Output(other,self, " DIA_Kreol_Sleeper_Mask_01_07 " );	// Okay, hold her.

	if(Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1)
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER_MIS,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER_MIS,1);
	};

	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_08 " );	// Great! Then try to visit me in a couple of days.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_09 " );	// This is enough time for me to settle the matter with Eligor himself.
	AI_Output(other,self, " DIA_Kreol_Sleeper_Mask_01_10 " );	// Good! But don't try to fool me.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Mask_01_11 " );	// (arrogantly) Don't worry. A deal is a deal!
	B_LogEntry( TOPIC_SLEEPERBACK , " I gave the Sleeper Mask to Creole in hopes of obtaining a powerful artifact called the 'Crown of Demons'! It's the only way I can resist the Sleeper's magic. Its current owner is Eligor, the most powerful demon in this world. In a couple of days, I'll be standing again drop by Creole for the latest instructions... " );
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 1;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Adanos()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Adanos_01_01 " );	// I have the Crown of Ice!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_02 " );	// Hmmm... (thoughtfully) The oldest artifact created by Adanos himself?
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_03 " );	// Yes, that might well interest Eligor.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_04 " );	// I think we'll do this... (thoughtfully) You'll give it to me now.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_05 " );	// And I, in turn, will prepare everything necessary for the demon summoning ritual.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_06");	//Согласен?
	AI_Output(other,self, " DIA_Kreol_Sleeper_Adanos_01_07 " );	// Okay, hold the crown.
	B_GiveInvItems(other,self,G3_ARMOR_HELMET_CRONE,1);
	Npc_RemoveInvItems(self,G3_ARMOR_HELMET_CRONE,1);
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_08 " );	// Great! Then try to visit me in a couple of days.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_09 " );	// This is enough time for me to settle the matter with Eligor himself.
	AI_Output(other,self, " DIA_Kreol_Sleeper_Adanos_01_10 " );	// Good! But don't try to fool me.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Adanos_01_11 " );	// (arrogantly) Don't worry. A deal is a deal!
	B_LogEntry( TOPIC_SLEEPERBACK , " I gave Creole the 'Crown of Ice' in hopes of obtaining a powerful artifact called the 'Crown of Demons'! It's the only way I can resist the Sleeper's magic. Its current owner is Eligor, the most powerful demon in this world. I'll be back in a couple of days it is worth visiting Creole again to get the latest instructions... " );
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 2;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Sword()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Sword_01_01 " );	// I have the Dragonlord sword!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Sword_01_02 " );	// Hmmm... (thoughtfully) Nice weapon! But it is unlikely to interest Eligor.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Sword_01_03 " );	// Try suggesting something else.
	EligorNoSword = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Bow()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Bow_01_01 " );	// I have a Bow Color of Death!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Bow_01_02 " );	// No, that's not it.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Bow_01_03 " );	// Need something really valuable to impress Eligor!
	EligorNoBow = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Staff()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Staff_01_01 " );	// I have a Soul Extinguisher staff!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Staff_01_02 " );	// (contemptuously) And why is he a demon lord, huh?
	AI_Output(self,other, " DIA_Kreol_Sleeper_Staff_01_03 " );	// You'd better think twice before offering him any rubbish.
	EligorNoStaff = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Innos()
{
	AI_Output(other,self, " DIA_Kreol_Sleeper_Innos_01_01 " );	// I have the Eye of Innos!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_02 " );	// Hmmm... (thoughtfully) The oldest paladin artifact?
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_03 " );	// Yes, that might well interest Eligor.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_04 " );	// I think we'll do this... (thoughtfully) You'll give it to me now.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_05 " );	// And I, in turn, will prepare everything necessary for the demon summoning ritual.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_06 " );	// Agree?
	AI_Output(other,self, " DIA_Kreol_Sleeper_Innos_01_07 " );	// Okay, hold the amulet.

	if (Npc_HasItems(hero,ItMi_InnosEye_MIS) >=   1 )
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_MIS,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_Discharged_Mis,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
	};

	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_08 " );	// Great! Then try to visit me in a couple of days.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_09 " );	// This is enough time for me to settle the matter with Eligor himself.
	AI_Output(other,self, " DIA_Kreol_Sleeper_Innos_01_10 " );	// Good! But don't try to fool me.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Innos_01_11 " );	// (arrogantly) Don't worry. A deal is a deal!
	B_LogEntry( TOPIC_SLEEPERBACK , " I gave the Eye of Innos to Creole in hopes of obtaining a powerful artifact called the 'Crown of Demons'! It's the only way I can resist the Sleeper's magic. Its current owner is Eligor, the most powerful demon in this world. In a couple of days, I'll be standing again drop by Creole for the latest instructions... " );
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 3;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_MaskTrade(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_MaskTrade_condition;
	information = DIA_Kreol_Sleeper_MaskTrade_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Kreol_Sleeper_MaskTrade_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((SleeperOldIsDead == FALSE) && (Npc_IsInState(self,ZS_Talk) == TRUE) && (DemonCrownRitualDay != FALSE) && (DemonCrownRitualDay < (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_MaskTrade_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Kreol_Sleeper_MaskTrade_01_01 " );	// Are you here already? Hmmm...(carelessly) Good! I have almost everything ready.
	AI_Output(other,self, " DIA_Kreol_Sleeper_MaskTrade_01_02 " );	// Is this about our deal?
	AI_Output(self,other, " DIA_Kreol_Sleeper_MaskTrade_01_03 " );	// Of course...(imperiously) Here, take this rune! With its help, you will be able to summon Eligor himself into this world.
	B_GiveInvItems(self,other,ItRu_EligorSummon, 1 );
	AI_Output(self,other, " DIA_Kreol_Sleeper_MaskTrade_01_04 " );	// But don't think you can do it wherever you want.
	AI_Output(self,other, " DIA_Kreol_Sleeper_MaskTrade_01_05 " );	// Go to the old tower of Xardas in the Valley of Mines.
	AI_Output(self,other, " DIA_Kreol_Sleeper_MaskTrade_01_06 " );	// Use the magical pentagram there for the summoning ritual.
	AI_Output(self,other, " DIA_Kreol_Sleeper_MaskTrade_01_07 " );	// You will learn about the rest from Eligor himself!
	AI_Output(other,self, " DIA_Kreol_Sleeper_MaskTrade_01_08 " );	// But you said that...
	AI_Output(self,other, " DIA_Kreol_Sleeper_MaskTrade_01_09 " );	// No more stupid questions! Go, and don't forget to bring me the Sleeper's heart when you kill him.
	ReadyToSumEligor = TRUE;
	B_LogEntry( TOPIC_SLEEPERBACK , "The Creole gave me a rune to summon Eligor to this world. The place of the ritual is a magical pentagram in the old tower of Xardas. " );
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_Dead(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_Dead_condition;
	information = DIA_Kreol_Sleeper_Dead_info;
	permanent = FALSE;
	description = " I killed the Sleeper! " ;
};

func int DIA_Kreol_Sleeper_Dead_condition()
{
	if(SleeperOldIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_Dead_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Kreol_Sleeper_Dead_01_01 " );	// I killed the Sleeper!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Dead_01_02 " );	// Good. I hope you have his dark soul crystal with you?
	AI_Output(other,self, " DIA_Kreol_Sleeper_Dead_01_03 " );	// It doesn't matter! I wouldn't give it to you anyway.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Dead_01_04 " );	// Stupid! Well, then you chose your own fate.
	AI_Output(self,other, " DIA_Kreol_Sleeper_Dead_01_05 " );	// Instead of his heart, I'll take yours!
	Info_ClearChoices(DIA_Kreol_Sleeper_Dead);
	Info_AddChoice(DIA_Kreol_Sleeper_Dead, " You don't have to try so hard! " ,DIA_Kreol_Sleeper_Dead_Ext);
};

func void DIA_Kreol_Sleeper_Dead_Ext()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Snd_Play("MFX_FEAR_CAST");
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(other,self, " DIA_Kreol_Sleeper_Dead_Ext_01_01 " );	// Don't try so hard! Nobody will help you.
	AI_Output(other,self, " DIA_Kreol_Sleeper_Dead_Ext_01_02 " );	// Today you will die, for this is the will of Innos himself!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Dead_Ext_01_03 " );	// (chuckles) So he sent you. Yes, now I feel his power in you!
	AI_Output(self,other, " DIA_Kreol_Sleeper_Dead_Ext_01_04 " );	// But that won't help you! I alone can easily crush you, miserable worm.
	CanKillKreol = TRUE;
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Info_ClearChoices(DIA_Kreol_Sleeper_Dead);
	Info_AddChoice(DIA_Kreol_Sleeper_Dead, " (end call) " ,DIA_Kreol_Sleeper_Dead_End);
};

func void DIA_Kreol_Sleeper_Dead_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Kreol_Hromanin(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Hromanin_condition;
	information = DIA_Kreol_Hromanin_info;
	permanent = FALSE;
	description = " What do you know about Chromanin? " ;
};

func int DIA_Kreol_Hromanin_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_SendToKriol == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Hromanin_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_01 " );	// What do you know about Chromanin?
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_02 " );	// Your questions never cease to amaze me. However, I will still answer this question for you.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_03 " );	// The word 'chromanin' in the language of the ancients means the essence of any living being. More specifically, his soul.
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_04 " );	// And if they call, say, some specific object?
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_05 " );	// It doesn't matter what Chromanin looks like! They can be any item.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_06 " );	// The main thing is that this artifact has one very valuable property.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_07");	//Какое?
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_08 " );	// Chromanin enslaves the souls of all those who dare to possess it.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_09 " );	// Not immediately, of course, gradually... (ominously) Day after day, he drives his owner crazy!
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_10 " );	// And the time comes when he is ready to give everything, just to get rid of this curse.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_11 " );	// Then the true owner of the artifact appears and takes the madman's soul!
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_12 " );	// And who is its owner?
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_13 " );	// Each Chromanin has his own! I can't tell you exactly what he looks like.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_14 " );	// I still love my own soul.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_15 " );	// By the way, why are you interested in this?
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_16 " );	// Khorinis has been overrun by the undead! The Fire Mages believe that it is Chromanin who is to blame.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_17 " );	// Fools! What fools they are! Can't see past their nose.
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_18 " );	// And you, apparently, know what was the reason for this?
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_19 " );	// Naturally! Still I wouldn't know. Just don't think that I will reveal this secret to you.
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_20 " );	// But every secret has its price. What is yours?
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_21 " );	// And you know how to bargain, I see. But in this case, it will not be affordable for you!
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_22 " );	// First, name it, and then draw conclusions.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_23 " );	// Well... (ominously) If you insist.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_24 " );	// You and I started this conversation with a question about Chromanin. This, perhaps, will be my price!
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_25 " );	// Do you want me to get it for you?
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_26 " );	// (imperiously) Yes, that's exactly what I want.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_27 " );	// I've learned that one of these artifacts exists on this island.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_28 " );	// Bring it to me! Don't you dare give it to me without getting rid of its keeper!
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_29 " );	// I have not completely lost my mind yet to say goodbye to my soul.
	AI_Output(other,self, " DIA_Kreol_Hromanin_01_30 " );	// And you don't feel sorry for mine.
	AI_Output(self,other, " DIA_Kreol_Hromanin_01_31 " );	// Well, you asked for the price yourself. Or does it not suit you?
	Info_ClearChoices(DIA_Kreol_Hromanin);
	Info_AddChoice(DIA_Kreol_Hromanin, " No, this is too much for me. " ,DIA_Kreol_Hromanin_No);
	Info_AddChoice(DIA_Kreol_Hromanin, " Good! Consider that we have agreed. " ,DIA_Kreol_Hromanin_Yes);
};

func void DIA_Kreol_Hromanin_No()
{
	AI_Output(other,self, " DIA_Kreol_Hromanin_No_01_01 " );	// No, this is too much for me.
	AI_Output(self,other, " DIA_Kreol_Hromanin_No_01_02 " );	// That's what I thought. Then we have nothing more to talk about.
	MIS_DarkOrden = LOG_Failed;
	B_LogEntry_Failed(TOPIC_DarkOrden);
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Hromanin_Yes()
{
	AI_Output(other,self, " DIA_Kreol_Hromanin_Yes_01_01 " );	// Good! Consider that we have agreed.
	AI_Output(self,other, " DIA_Kreol_Hromanin_Yes_01_02 " );	// Great! Then don't waste your time! Go and bring me this artifact.
	AI_Output(self,other, " DIA_Kreol_Hromanin_Yes_01_03 " );	// Yes, and one more thing...
	AI_Output(self,other, " DIA_Kreol_Hromanin_Yes_01_04 " );	// Before you die, leave me some news about where to look for your lifeless body later.
	AI_Output(self,other, " DIA_Kreol_Hromanin_Yes_01_05 " );	// I think you'll make a great skeleton servant! Moderately executive and moderately stupid.
	AI_Output(other,self, " DIA_Kreol_Hromanin_Yes_01_06 " );	// Don't even think about it!
	AI_Output(self,other, " DIA_Kreol_Hromanin_Yes_01_07 " );	// (chuckles)
	KreolOpenHromaninSaga = TRUE;
	B_LogEntry(TOPIC_DarkOrden, " I've agreed to a deal with Creole, and now I'll have to find this Chromanin for him. Then he'll tell you why Khorinis has been overrun by the undead. " );
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_HromaninDone (C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_HromaninDone_condition;
	information = DIA_Kreol_HromaninDone_info;
	permanent = FALSE;
	description = " I brought you Chromanin. " ;
};

func int DIA_Kreol_HromaninDone_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (Npc_HasItems(hero,ITWR_HROMANIN) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kreol_HromaninDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Kreol_HromaninDone_01_01 " );	// I brought you Chromanin.
	AI_Output(self,other, " DIA_Kreol_HromaninDone_01_02 " );	// Let me see it!
	AI_Output(other,self, " DIA_Kreol_HromaninDone_01_03 " );	// Here, take this.
	B_GiveInvItems(other,self,ITWR_HROMANIN,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Kreol_HromaninDone_01_04 " );	// Hmmm...(assessing) So it's just an ordinary book!
	AI_Output(self,other, " DIA_Kreol_HromaninDone_01_05 " );	// And judging by how I feel looking into her, her keeper is already dead.
	AI_Output(other,self, " DIA_Kreol_HromaninDone_01_06 " );	// Yes, I killed him.
	AI_Output(self,other, " DIA_Kreol_HromaninDone_01_07 " );	// Frankly, I'm a little surprised that you managed to stay alive.
	AI_Output(self,other, " DIA_Kreol_HromaninDone_01_08 " );	// Although it could be just a coincidence.
	AI_Output(self,other, " DIA_Kreol_HromaninDone_01_09 " );	// Either way, you deserve your reward.
	DO_KreolTell = TRUE;
	B_LogEntry(TOPIC_DarkOrden, " I brought Chromanin to Creole. " );
};

instance DIA_Kreol_TellDarkOrden (C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_TellDarkOrden_condition;
	information = DIA_Kreol_TellDarkOrden_info;
	permanent = FALSE;
	description = " It's time to answer my question. " ;
};

func int DIA_Kreol_TellDarkOrden_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_KreolTell == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_TellDarkOrden_info()
{
	AI_Output(other,self, " DIA_Kreol_TellDarkOrden_01_01 " );	// It's time to answer my question.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_02 " );	// (carelessly) As you say. It's all the paladins' fault! Will this answer suit you?
	AI_Output(other,self, " DIA_Kreol_TellDarkOrden_01_03 " );	// Paladins?!
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_04 " );	// Yes, they are. Does this surprise you a lot?
	AI_Output(other,self, " DIA_Kreol_TellDarkOrden_01_05 " );	// More like. Can you explain what you mean?
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_06 " );	// (laughs) Without me, you will never understand the essence of what is happening. Is not it?
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_07 " );	// But so be it, I will take pity on you and slightly open the veil of this mystery.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_08 " );	// Listen carefully! I won't repeat myself twice.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_09 " );	// As you probably know, Innos' order of paladins has been around for thousands of years.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_10 " );	// And during all this time, they do nothing but fulfill their god's every whim!
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_11 " );	// However, some of them were so fanatical and devoted to their god that sometimes they did not even distinguish good from evil.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_12 " );	// They did terrible things in the name of Innos! And there was no end to it...
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_13 " );	// Looking at them and at everything happening around, Innos could no longer endure these atrocities.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_14 " );	// Therefore, he stripped these paladins of his divine power and left them alone with their faith alone.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_15 " );	// Many of those paladins were buried on this island. With glory and honors, as befits the warriors of the order.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_16 " );	// However, when they died, they resurfaced as powerful undead.
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_17 " );	// And now they are the commanders of the countless army of the dead, who lead their legions to the glory of Beliar!
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_18 " );	// Do you understand now?
	AI_Output(other,self, " DIA_Kreol_TellDarkOrden_01_19 " );	// So these dead paladins are the reason the undead attacked Khorinis?
	AI_Output(self,other, " DIA_Kreol_TellDarkOrden_01_20 " );	// That's right! And these attacks will not stop until someone puts the souls of these damned warriors to rest.
	DO_KnowAboutDO = TRUE;
	B_LogEntry(TOPIC_DarkOrden, " Creole told me a story about paladins who, during their lifetime, were so fanatically devoted to Innos that sometimes they did simply horrific things on his behalf. Innos could not allow this and deprived them of his power and protection. Many of these paladins were buried it is on this island. But after their death, they rose in the form of powerful undead and now lead the legions of the dead into battle for the glory of Beliar! Until their souls are laid to rest, the attacks of the undead on Khorinis will not stop. " );
};

instance DIA_Kreol_MAXROBE(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_MAXROBE_condition;
	information = DIA_Kreol_MAXROBE_info;
	permanent = FALSE;
	description = " How about a better robe? " ;
};

func int DIA_Kreol_MAXROBE_condition()
{
	if ((hero.guild ==   GIL_KDM ) && (Chapter >=   5 ) && (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==   6 ) && (LastRobeKDM ==   FALSE ) && (MAXROBE_Permanent ==   FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Kreol_MAXROBE_info()
{
	AI_Output(other,self, " DIA_Kreol_MAXROBE_01_00 " );	// How about a better robe?
	AI_Output(self,other, " DIA_Kreol_MAXROBE_01_01 " );	// Since you are proficient in all six circles of magic, you are worthy to wear the Robe of the Archmage of Darkness!
	AI_Output(self,other, " DIA_Kreol_MAXROBE_01_02 " );	// However, you will have to pay for it!
	AI_Output(other,self,"DIA_Kreol_MAXROBE_01_03");	//Понимаю.
	LastRobeKDM = TRUE;
};

instance DIA_Kreol_MAXROBE_Buy(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_MAXROBE_Buy_condition;
	information = DIA_Kreol_MAXROBE_Buy_info;
	permanent = TRUE;
	description = " Sell me the Robe of the Archmage of Darkness. (Price: 30,000 coins) " ;
};

func int DIA_Kreol_MAXROBE_Buy_condition()
{
	if (( hero . guild ==   GIL_KDM ) && ( LastRobeKDM ==   TRUE ) && ( MAXROBE_Permanent ==   FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MAXROBE_Buy_info()
{
	AI_Output(other,self, " DIA_Kreol_MAXROBE_Buy_01_00 " );	// Sell me the robe of the Archmage of Darkness!

	if(Npc_HasItems(hero,ItMi_Gold) >= 30000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,30000);
		Npc_RemoveInvItems(self,ItMi_Gold,30000);
		AI_Output(self,other, " DIA_Kreol_MAXROBE_Buy_01 " );	// Good! Hold her.
		AI_Output(self,other, " DIA_Kreol_MAXROBE_Buy_02 " );	// It's a great honor to wear such an attire. Remember this!
		CreateInvItems(self,itar_kdm_sh,1);
		B_GiveInvItems(self,other,itar_kdm_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Kreol_MAXROBE_Buy_01_03 " );	// You don't have enough gold!
	};
};

instance DIA_Kreol_Nergal(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_Nergal_condition;
	information = DIA_Kreol_Nergal_info;
	permanent = FALSE;
	description = " Do you happen to know how to get into Nergal's tower? " ;
};

func int DIA_Kreol_Nergal_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALTIMER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Nergal_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Kreol_Nergal_01_00 " );	// Do you happen to know how to get to Nergal's tower?
	AI_Output(self,other, " DIA_Kreol_Nergal_01_01 " );	// (arrogantly) Of course I do. Through the door! It's just that it's locked.
	AI_Output(other,self, " DIA_Kreol_Nergal_01_02 " );	// Where can I get the key?
	AI_Output(self,other, " DIA_Kreol_Nergal_01_03 " );	// I have the key to that door.
	AI_Output(self,other, " DIA_Kreol_Nergal_01_04 " );	// If you want, I can give it to you. Only there you will find nothing but death.
	AI_Output(other, self, " DIA_Kreol_Nergal_01_05 " );	// Just give it to me. Good?
	AI_Output(self,other, " DIA_Kreol_Nergal_01_06 " );	// (contemptuously) Well, if you can't wait to die - take it!
	B_GiveInvItems(self,other,itke_darktower_01,1);
	KreolGiveKey = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_DarkMageBuySwords(C_Info)
{
	npc = none_102_kreol;
	nr = 3;
	condition = DIA_Kreol_DarkMageBuySwords_condition;
	information = DIA_Kreol_DarkMageBuySwords_info;
	permanent = FALSE;
	description = " Could you be interested in this weapon? " ;
};

func int DIA_Kreol_DarkMageBuySwords_condition()
{
	if((Npc_HasItems(hero,ITMW_FAKESWORD_01) >= 1) && (DarkMageBuySwords == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_DarkMageBuySwords_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Kreol_DarkMageBuySwords_01_00 " );	// Would you be interested in this weapon?
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwords_01_01 " );	// (with interest) Let me take a look at it.
	AI_Output(other,self, " DIA_Kreol_DarkMageBuySwords_01_02 " );	// Here, take this.
	B_GiveInvItems(other,self,ITMW_FAKESWORD_01,1);
	Npc_RemoveInvItems(self,ITMW_FAKESWORD_01,1);
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwords_01_03 " );	// Well, well... (looking) Yes, this is an interesting little thing!
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwords_01_04 " );	// I sense a slight presence of Beliar's dark magic in her.
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwords_01_05 " );	// You did the right thing bringing it to me! In the wrong hands, these things can be deadly.
	AI_Output(other,self, " DIA_Kreol_DarkMageBuySwords_01_06 " );	// Okay. So, what is next?
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwords_01_07 " );	// It's very simple! I will keep this blade for further study of its properties.
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwords_01_08 " );	// And if you happen to find something else like that, bring it to me!
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwords_01_09 " );	// And don't worry about your reward! I will thank you very much for this.
	B_LogEntry(Topic_OutTrader, "The Creole will buy from me all the Masyaf ritual weapons that I bring him. " );
	KreolBuyMasiafSwrods = TRUE;
};

instance DIA_Kreol_DarkMageBuySwordsDone(C_Info)
{
	npc = none_102_kreol;
	nr = 3;
	condition = DIA_Kreol_DarkMageBuySwordsDone_condition;
	information = DIA_Kreol_DarkMageBuySwordsDone_info;
	permanent = TRUE;
	description = " I brought you more ritual weapons. " ;
};

func int DIA_Kreol_DarkMageBuySwordsDone_condition()
{
	if((Npc_HasItems(hero,ITMW_FAKESWORD_01) >= 1) && (KreolBuyMasiafSwrods == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_DarkMageBuySwordsDone_info()
{
	var int SummSword;

	SummSword = FALSE;
	SummSword = Npc_HasItems(hero,ITMW_FAKESWORD_01);

	AI_Output(other,self, " DIA_Kreol_DarkMageBuySwordsDone_01_00 " );	// I brought you more ritual weapons.
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwordsDone_01_01 " );	// Great! Give it here.
	B_GiveInvItems(other,self,ITMW_FAKESWORD_01,Npc_HasItems(other,ITMW_FAKESWORD_01));
	Npc_RemoveInvItems(self,ITMW_FAKESWORD_01,Npc_HasItems(self,ITMW_FAKESWORD_01));
	AI_Output(other,self, " DIA_Kreol_DarkMageBuySwordsDone_01_03 " );	// What about the promised reward?
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwordsDone_01_04 " );	// Don't worry... Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,SummSword * 500);
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwordsDone_01_05 " );	// It will be the most suitable reward for you.
	AI_Output(self,other, " DIA_Kreol_DarkMageBuySwordsDone_01_06 " );	// And now you can go. I don't have time for chatting.
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_BuyWeapons(C_Info)
{
	npc = none_102_kreol;
	nr = 600;
	condition = DIA_Kreol_BuyWeapons_condition;
	information = DIA_Kreol_BuyWeapons_info;
	permanent = TRUE;
	description = " I have a cursed weapon for you. " ;
};

func int DIA_Kreol_BuyWeapons_condition()
{
	if (( Npc_KnowsInfo( hero , DIA_Xardas_Mechi ) ==   TRUE ) && ( CreoleBuyWeap ==   TRUE ))
	{
		if((Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0) || (Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0) || (Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0) || (Npc_HasItems(hero,ItMw_PlagueStaff) > 0) || (Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0) || (Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0) || (Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0) || (Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0) || (Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0) || (Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0) || (Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PreElite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0) || (Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0) || (Npc_HasItems(hero,ItRw_Undead) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_Elite) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Kreol_BuyWeapons_info()
{
	var int countexp;
	var int goldplus;
	var int goldplus_all;

	goldplus = FALSE ;
	goldplus_all = FALSE;

	AI_Output(other,self, " DIA_Xardas_BuyWeapons_01_00 " );	// I have a cursed weapon for you.

	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Left);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Left,Npc_HasItems(hero,ItMw_1H_ChelDrak_Left));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Right);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Right,Npc_HasItems(hero,ItMw_1H_ChelDrak_Right));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_2H_ShadowBlade_Xert);
		Npc_RemoveInvItems(hero,ItMw_2H_ShadowBlade_Xert,Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elair);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elair,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Ober);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Ober,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_PlagueStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_PlagueStaff);
		Npc_RemoveInvItems(hero,ItMw_PlagueStaff,Npc_HasItems(hero,ItMw_PlagueStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_SoulKeeperStaff);
		Npc_RemoveInvItems(hero,ItMw_SoulKeeperStaff,Npc_HasItems(hero,ItMw_SoulKeeperStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DoomSpeer_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DoomSpeer_Elite,Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMAXE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMAXE,Npc_HasItems(hero,ITMW_2H_DOOMAXE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_HAOSHAND);
		Npc_RemoveInvItems(hero,ITMW_2H_HAOSHAND,Npc_HasItems(hero,ITMW_2H_HAOSHAND));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_RAVENELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_RAVENELITE,Npc_HasItems(hero,ITMW_2H_RAVENELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DRACONSWORD_DEAD);
		Npc_RemoveInvItems(hero,ITMW_2H_DRACONSWORD_DEAD,Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_Doom_OldPiratensaebel);
		Npc_RemoveInvItems(hero,ItMw_Doom_OldPiratensaebel,Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST,Npc_HasItems(hero,ITMW_SHADOWPRIEST));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elite);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elite,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD,Npc_HasItems(hero,ITMW_2H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_PREELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_PREELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_ELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_ELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD,Npc_HasItems(hero,ITMW_1H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_GHOSTSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_GHOSTSWORD,Npc_HasItems(hero,ITMW_1H_GHOSTSWORD));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSPEER);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSPEER,Npc_HasItems(hero,ITMW_1H_DOOMSPEER));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD_Elite,Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItRw_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Undead);
		Npc_RemoveInvItems(hero,ItRw_Undead,Npc_HasItems(hero,ItRw_Undead));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Crossbow_Undead);
		Npc_RemoveInvItems(hero,ItRw_Crossbow_Undead,Npc_HasItems(hero,ItRw_Crossbow_Undead));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_01_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_01_Damn,Npc_HasItems(hero,ItAr_Shield_01_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_02_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_02_Damn,Npc_HasItems(hero,ItAr_Shield_02_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_03_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_03_Damn,Npc_HasItems(hero,ItAr_Shield_03_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};

	AI_Output(self,other, " DIA_KREOL_Kill_Done_Rings_01_13 " );	// Here, take your reward and get the hell out of here!
	B_GiveInvItems(self,other,ItMi_Gold,goldplus_all);
};
