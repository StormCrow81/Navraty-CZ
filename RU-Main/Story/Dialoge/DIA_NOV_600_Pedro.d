

instance DIA_Pedro_EXIT(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 999;
	condition = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pedro_WELCOME(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 1;
	condition = DIA_Pedro_WELCOME_Condition;
	information = DIA_Pedro_WELCOME_Info;
	important = TRUE;
};


func int DIA_Pedro_WELCOME_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Pedro_WELCOME_Info()
{
	AI_Output(self,other, " DIA_Pedro_WELCOME_09_00 " );	// Welcome to the monastery of Innos, outlander.
	AI_Output(self,other, " DIA_Pedro_WELCOME_09_01 " );	// I am brother Pedro, humble servant of Innos and guardian of the gates of this sacred monastery.
	AI_Output(self,other, " DIA_Pedro_WELCOME_09_02 " );	// What do you want?
};


instance DIA_Pedro_Wurst (C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Wurst_Condition;
	information = DIA_Pedro_Sausage_Info;
	permanent = FALSE;
	description = " Here, have a sausage, brother! " ;
};


func int DIA_Pedro_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Pedro_Wurst_15_00 " );	// Here, take the sausage, brother!
	AI_Output(self,other, " DIA_Pedro_Wurst_09_01 " );	// I'm glad you thought of me. Usually they forget about me.
	AI_Output(self,other, " DIA_Pedro_Wurst_09_02 " );	// Can you give me another sausage?
	AI_Output(other,self, " DIA_Pedro_Wurst_15_03 " );	// Forget it, then there won't be enough for everyone.
	AI_Output(self,other, " DIA_Pedro_Wurst_09_04 " );	// Hey, just one sausage - no one will even notice. And you'll get something for it - I know a place where fire nettles grow.
	AI_Output(self,other, " DIA_Pedro_Wurst_09_05 " );	// If you take it to Neoras, he will surely give you the key to the library. What do you say?
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	Info_ClearChoices(DIA_Pedro_Wurst);

	if((Npc_HasItems(hero,ItFo_Sausage) == TRUE) && (RhetorikSkillValue[1] >= 30))
	{
		Info_AddChoice(DIA_Pedro_Wurst, " Take this sausage, it's just as good as the monastery sausage! " ,dia_pedro_wurst_new);
	};
	if(Npc_HasItems(hero,ItFo_Schafswurst) == TRUE)
	{
		Info_AddChoice(DIA_Pedro_Wurst, " Okay, have another sausage. " ,DIA_Pedro_Wurst_JA);
	};

	Info_AddChoice(DIA_Pedro_Wurst, " No, forget it. " ,DIA_Pedro_Wurst_NEIN);
};

func void DIA_Pedro_Sausage_JA()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pedro_Wurst_JA_15_00 " );	// Okay, have another sausage.
	AI_Output(self,other, " DIA_Pedro_Wurst_JA_09_01 " );	// Great! Fire nettle grows to the left and right on the other side of the bridge.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Info_ClearChoices(DIA_Pedro_Wurst);
	INNOSPRAYCOUNT = INNOSPRAYCOUNT - 3;
};

func void DIA_Pedro_Sausage_NO()
{
	AI_Output(other,self, " DIA_Pedro_Wurst_NEIN_15_00 " );	// No, forget about it.
	AI_Output(self,other, " DIA_Pedro_Wurst_NEIN_09_01 " );	// You want to curry favor with Gorax, don't you? Eh, the new novices are all the same...
	Info_ClearChoices(DIA_Pedro_Wurst);
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
};

func void dia_pedro_wurst_new()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pedro_Wurst_NEIN_61_01 " );	// Take this sausage, it's no worse than the monastic one!
	B_GiveInvItems(hero,self,ItFo_Sausage,1);
	AI_Output(self,other, " DIA_Pedro_Wurst_NEIN_61_02 " );	// Thank you brother!
	AI_UseItem(self,ItFo_Sausage);
	AI_Output(self,other, " DIA_Pedro_Wurst_JA_09_01 " );	// Great! Fire nettle grows to the left and right on the other side of the bridge.
	Info_ClearChoices(DIA_Pedro_Wurst);
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 2;
};

instance DIA_Pedro_EINLASS (C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_EINLASS_Condition;
	information = DIA_Pedro_EINLASS_Info;
	permanent = FALSE;
	description = " I want to enter the monastery. " ;
};

func int DIA_Pedro_EINLASS_Condition()
{
	if (Npc_KnowsInfo(hero,DAY_Peter_WELCOME) && ( CAPTAINNORTHERDIAWAY  ==  FALSE ) && (hero.guild !=  GIL_NOV ) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_PAL )) ;
	{
		return TRUE;
	};
};

func void DIA_Pedro_EINLASS_Info()
{
	AI_Output(other,self, " DIA_Pedro_EINLASS_15_00 " );	// I want to enter the monastery.
	AI_Output(self,other, " DIA_Pedro_EINLASS_09_01 " );	// Access to the monastery is open only to the servants of Innos.
	AI_Output(self,other, " DIA_Pedro_EINLASS_09_02 " );	// If you want to pray to Innos, go to one of the roadside altars. You will find peace in prayers there.
};

instances of DIA_Pedro_TEMPEL (C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_TEMPEL_Condition;
	information = DIA_Pedro_TEMPEL_Info;
	permanent = FALSE;
	description = " What do I need to do to be accepted into the monastery? " ;
};

func int DIA_Pedro_TEMPEL_Condition()
{
	if ((hero.guild !=  GIL_NOV ) && ( CAPTAINNorthDayAway  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DAY_Peter_TEMPEL_Info()
{
	AI_Output(other,self, " DIA_Pedro_TEMPEL_15_00 " );	// What do I need to do to be accepted into the monastery?

	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other, " DIA_Pedro_TEMPEL_09_01 " );	// Admission to the monastery is impossible for you - you have already chosen your path.
	}
	else
	{
		AI_Output(self,other, " DIA_Pedro_TEMPEL_09_02 " );	// If you want to be accepted into the Brotherhood of Innos, you must know and follow the rules of the monastery.
		AI_Output(self,other, " DIA_ADDON_Pedro_TEMPEL_09_03 " );	// Also, each newcomer must bring a gift to Innos.
		AI_Output(self,other, " DIA_ADDON_Pedro_TEMPEL_09_04 " );	// A sheep and one thousand gold coins!
		AI_Output(other,self, " DIA_Pedro_TEMPEL_15_04 " );	// That's a whole lot of gold!
		AI_Output(self,other, " DIA_Pedro_TEMPEL_09_05 " );	// This is a sign that you are starting a new life as a servant of Innos. When you are accepted, all your previous sins will be forgiven.
		AI_Output(self,other, " DIA_Pedro_TEMPEL_09_06 " );	// And think carefully - then you will not be able to abandon your decision to become a servant of Innos.
		SC_KnowsKlosterTribut = TRUE;
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster, " To become an acolyte of the Innos monastery, I need a sheep and a thousand gold pieces. " );
	};
};


instance DIA_Addon_Pedro_Statuette(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Condition;
	information = DIA_Addon_Pedro_Statuette_Info;
	permanent = FALSE;
	description = " I have this figurine... " ;
};


func int DIA_Addon_Pedro_Statuette_Condition()
{
	if (Npc_HasItems(other,ItMy_LostInnosStatue_Daron) && (MY_Addon_Daron_GetStatue == LOG_Running) && Npc_KnowsInfo(other,DIA_Pedro_Rules) && (Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Info()
{
	AI_Output(other,self, " DIA_Addon_Pedro_Statuette_15_00 " );	// I have this figurine. I think she disappeared from the convent.
	AI_Output(other,self, " DIA_Addon_Pedro_Statuette_15_01 " );	// Can I login now?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Addon_Pedro_Statuette_09_02 " );	// Well, I guess under such exceptional circumstances, you can become a novice for free.
		Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
		B_LogEntry(TOPIC_Addon_RangerHelpKDF, " Acolyte Pedro let me into the monastery because I was carrying a missing figurine. I have to give it to someone in the monastery. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Pedro_Statuette_09_03 " );	// I'm afraid even this jewel won't open your way inside.
		AI_Output(self,other, " DIA_Addon_Pedro_Statuette_09_04 " );	// You have already chosen your path. The monastery is closed to you.
	};
};


instance DIA_Addon_Pedro_Statuette_Hand over (C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Handover_Condition;
	information = DIA_Addon_Pedro_Statuette_Handover_Info;
	permanent = FALSE;
	description = " Can I give the figurine to you? " ;
};


func int DIA_Addon_Pedro_Statuette_Give_Condition()
{
	if (Npc_HasItems(other,ItMy_LostInnosStatue_Daron) && Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette) && (hero.guild !=  GIL_NONE ) && (hero.guild !=  GIL_NOV ) && (hero.guild ! =  GIL_KDF ) && ( CAPTAINNORDERDIAWAY  ) = FALSE 
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Give_Info()
{
	AI_Output(other,self, " DIA_Addon_Pedro_Statuette_Abgeben_15_00 " );	// Can I give the figurine to you?
	AI_Output(self,other, " DIA_Addon_Pedro_Statuette_Abgeben_09_01 " );	// Of course. I'll take care of her. Thank you for your generosity.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Pedro_Rules(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Rules_Condition;
	information = DIA_Pedro_Rules_Info;
	permanent = FALSE;
	description = " What are the rules you live by? " ;
};


func int DIA_Pedro_Rules_Condition()
{
	if ( Npc_KnowsInfo ( other , DAY_PETER_TEMPEL ) && ( CAPTAINNORTHWEST  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Rules_Info()
{
	AI_Output(other,self, " DIA_Pedro_Rules_15_00 " );	// What are the rules you live by?
	AI_Output(self,other, " DIA_Pedro_Rules_09_01 " );	// Innos is the god of truth and law. Therefore, we NEVER lie or commit crimes.
	AI_Output(self,other, " DIA_Pedro_Rules_09_02 " );	// If you sin against a brother in our community or steal our property, you will have to pay a fine.
	AI_Output(self,other, " DIA_Pedro_Rules_09_03 " );	// Innos is also the god of government and fire.
	AI_Output(self,other, " DIA_Pedro_Rules_09_04 " );	// As an acolyte, you must show OBEY and RESPECT to all Fire Mages.
	AI_Output(other,self, " DIA_Pedro_Rules_15_05 " );	// Got it.
	AI_Output(self,other, " DIA_Pedro_Rules_09_06 " );	// In addition, the novice MUST do work in the monastery for the benefit of the community.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Pedro_Rules_09_07 " );	// If you are ready to follow these rules, and you have an offering to Innos, we are ready to accept you into the monastery as a novice.
	};
};


instance DIA_Pedro_RECORDING (C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_RECORDING_Condition;
	information = DIA_Pedro_RECORDING_Info;
	permanent = TRUE;
	description = " I want to become a novice. " ;
};


var int DIA_PETER_AUFNAHME_NOPERM;

func int DIA_Pedro_RECORDING_Condition()
{
	if (Npc_KnowsInfo(hero,DAY_Peter_Rules) && (DAY_Peter_AUFNAHME_NOPERM ==  FALSE ) && ( CAPTAINORDERDIAWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void B_DIA_Pedro_RECORDING_Choice()
{
	Info_ClearChoices(DIA_Pedro_RECORDING);
	Info_AddChoice(DIA_Pedro_AUFNAHME, " I'll think about it some more. " ,DIA_Pedro_AUFNAHME_NO);
	Info_AddChoice(DIA_Pedro_AUFNAHME, " Yes, I want to devote my life to serving Innos. " ,DIA_Pedro_AUFNAHME_YES);
};

func void DIA_Pedro_RECORDING_Info()
{
	AI_Output(other,self, " DIA_Pedro_AUFNAHME_15_00 " );	// I want to become a novice.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other, " DIA_Pedro_AUFNAHME_09_01 " );	// You have already chosen your path. The path of magic is closed to you.
		DIA_Peter_AUFNAHME_NOPERM = TRUE ;
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		AI_Output(self,other, " DIA_Addon_Pedro_AUFNAHME_09_02 " );	// Is your decision final? There will be no turning back for you.
		B_DIA_Pedro_RECORDING_Choice();
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,ItMi_Gold) >= Summe_Kloster) && Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero, " DIA_Pedro_AUFNAHME_09_03 " );	// I see you brought the required offering. If you really desire it, you can become a novice.
		AI_Output(self,hero, " DIA_Pedro_AUFNAHME_09_04 " );	// However, if you make this decision, there will be no going back - think carefully if this is your path!
		B_DIA_Pedro_RECORDING_Choice();
	}
	else
	{
		AI_Output(self,other, " DIA_Pedro_AUFNAHME_09_02 " );	// You didn't bring the required offering.
	};
};

func void DIA_Pedro_RECORDING_YES()
{
	AI_Output(other,self, " DIA_Pedro_AUFNAHME_YES_15_00 " );	// Yes, I want to devote my life to serving Innos.
	AI_Output(self,other, " DIA_Pedro_AUFNAHME_YES_09_01 " );	// Then welcome, brother. I give you this key to the monastery gates.
	AI_Output(self,other, " DIA_Pedro_AUFNAHME_YES_09_02 " );	// As a sign of your voluntary acceptance of this decision, you yourself must open this gate and enter inside.
	AI_Output(self,other, " DIA_Pedro_AUFNAHME_YES_09_04 " );	// When you enter the monastery, approach Parlan. From now on, he will be responsible for you.
	AI_Output(other,self, " DIA_Pedro_AUFNAHME_YES_15_05 " );	// Are my sins forgiven now?
	AI_Output(self,other, " DIA_Pedro_AUFNAHME_YES_09_06 " );	// Not yet! Speak to Master Parlan. He will bless you and cleanse you from your sins.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	hero.guild = GIL_NOV;
	CheckHeroGuild[0] = TRUE;
	DIA_Peter_AUFNAHME_NOPERM = TRUE ;
	NOV_recording = TRUE ;
	CanEnterKloster = TRUE;
	B_GivePlayerXP(XP_RecordNovize);

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		Pedro_NOV_Recording_LostInnosStatue_Daron = TRUE ;
		Liesel_Giveaway = LOG_OBSOLETE;
	};
	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void DIA_Pedro_RECORDING_NO()
{
	AI_Output(other,self, " DIA_Pedro_AUFNAHME_NO_15_00 " );	// I'll think about it some more.
	AI_Output(self,other, " DIA_Pedro_AUFNAHME_NO_09_01 " );	// Come back when you're ready.
	Info_ClearChoices(DIA_Pedro_RECORDING);
};


instances of DIA_Pedro_Monastery (C_Info)
{
	npc = NOV_600_Pedro;
	nr = 90;
	condition = DIA_Pedro_Monastery_Condition;
	information = DIA_Pedro_Monastery_Info;
	permanent = TRUE;
	description = " Tell me about life in the monastery. " ;
};


func int DIA_Pedro_Monastery_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Pedro_Monastery_Info()
{
	AI_Output(other,self, " DIA_Pedro_Monastery_15_00 " );	// Tell me about life in the monastery.
	AI_Output(self,other, " DIA_Pedro_Monastery_09_01 " );	// We live in a monastery to serve Innos. We novices do various jobs and study the scriptures when we have the opportunity.
	AI_Output(self,other, " DIA_Pedro_Monastery_09_02 " );	// Mages watch over us and also learn the art of magic.
};

instance DIA_Pedro_PICKPOCKET(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 900;
	condition = DIA_Pedro_PICKPOCKET_Condition;
	information = DIA_Pedro_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Pedro_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pedro_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,Dialog_Back,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		CreateInvItems(self,ItKe_Innos_MIS,1);
		B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		Info_ClearChoices(DIA_Pedro_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		B_Attack(self,other,AR_Theft,1);
		self.vars[0] = TRUE;
	};
};

func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};


instance DIA_PEDRO_PASSCLUSTER (C_Info)
{
	npc = NOV_600_Pedro;
	condition = dia_pedro_passkloster_condition;
	information = dia_pedro_passkloster_info;
	permanent = FALSE;
	description = " I need Master Gorax. " ;
};


func int dia_pedro_passkloster_condition()
{
	if (( MIS_CHURCHDEAL  == LOG_Running ) && ( CAPTAINNORTHERDIAWAY  ==  FALSE ) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_NOV ) &&  ! Npc_KnowsInfo(hero,dia_gorax_trademewine));
	{
		return TRUE;
	};
};

func void dia_pedro_passcloset_info()
{
	if(!Npc_HasItems(other,ItKe_Innos_MIS))
	{
		AI_Output(other,self, " DIA_Pedro_PassKloster_01_00 " );	// I need Master Gorax.
		AI_Output(self,other,"DIA_Pedro_PassKloster_01_01");	//Зачем?
		AI_Output(other,self, " DIA_Pedro_PassKloster_01_02 " );	// I need to take some wine from him for a merchant. Will you let me into the monastery?
		AI_Output(self,other, " DIA_Pedro_PassKloster_01_03 " );	// Good! Here, take the key to the gate.
		B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);
		CanEnterKloster = TRUE;
		AI_Output(self,other, " DIA_Pedro_PassKloster_01_04 " );	// You will find Master Gorax in the cell to the right of the entrance.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Pedro_PassKloster_01_06 " );	// I need Master Gorax.	
		AI_Output(self,other,"DIA_Pedro_PassKloster_01_07");	//Зачем?
		AI_Output(other,self, " DIA_Pedro_PassKloster_01_08 " );	// I need to buy wine from him. Could you help me?
		AI_Output(self,other, " DIA_Pedro_PassKloster_01_10 " );	// I can give you advice: be polite with him and watch his mood - he is very quick-tempered.
		AI_Output(self,other, " DIA_Pedro_PassKloster_01_11 " );	// You'll find him in the cell to the right of the entrance.
		CanEnterKloster = TRUE;
		AI_StopProcessInfos(self);
	};
};
