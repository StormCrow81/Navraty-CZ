
instance DIA_Talamon_CHAP1_EXIT (C_Info) .
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP1_EXIT_Condition;
	information = DIA_Talamon_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talamon_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instances of DIA_Talamon_NoEnter_PissOff (C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_NoEnter_PissOff_Condition;
	information = DIA_Talamon_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Talamon_NoEnter_PissOff_Condition()
{
	if ((CanEnterMonastery ==  FALSE ) && (other.guild !=  GIL_MEATBUG ))
	{
		return TRUE;
	};
};

func void DIA_Talamon_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Talamon_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

const string KDF_507_Checkpoint = "NW_MONASTERY_SEALROOM_01";
var int TalamonFM;

instance DIA_KDF_507_Talamon_FirstWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_KDF_507_Talamon_FirstWarn_Condition;
	information = DIA_KDF_507_Talamon_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_KDF_507_Talamon_FirstWarn_Condition()
{
	if ((Pyrokar_LetYouPassTalamon ==  FALSE ) && (CanEnterMonastery ==  TRUE ) && (Chapter <  6 ) && (Npc_RefuseTalk(self) ==  FALSE ) && (hero.guild !=  GIL_KDF ) && (self.aivar[AIV_Guardpassage_Status] ==  GP_NONE ) && ( self . aivar [ AIV_PASSGATE ] ==  FALSE ) && ( other . guild !=  GIL_MEATBUG ))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_FirstWarn_Info()
{
	AI_TurnToNPC(hero,Garwig);
	AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_04_00 " );	// You can't go any further. Turn back!

	if(TalamonFM == FALSE)
	{
		AI_Output(other,self, " DIA_KDF_507_Talamon_FirstWarn_01_00 " );	// Admit it, master, is it hard to stand here without breaks and rest?
		AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_01_01 " );	// Complaining about the mission entrusted by Innos is not the lot of a true Firebender.
		AI_Output(other,self, " DIA_KDF_507_Talamon_FirstWarn_01_02 " );	// As assigned by Innos or by the High Council?
		AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_01_03 " );	// The will of Innos descends from the lips of the members of the High Council.
		AI_Output(other,self, " DIA_KDF_507_Talamon_FirstWarn_01_04 " );	// Yes, yes, the voice of God is the justification for everything. But I think you've been brazenly made into a scapegoat.
		AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_01_05 " );	// I'm not authorized to discuss this subject with you.
		AI_Output(other,self, " DIA_KDF_507_Talamon_FirstWarn_01_06 " );	// Your brothers sit upstairs in the church and release blessings. You - you are standing here and overgrown with cobwebs, and you are also the highest magician.
		AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_01_07 " );	// (besides himself) Damn it! But you are a little mistaken: I am not overgrown with cobwebs and wither here, but these Sidneys, who can only pretend to be smart, grow into their thrones.
		AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_04_08 " );	// I stand like an unbreakable rock, and sooner or later I will go out to look into their shameless, pleading faces, when they realize that they can do nothing without me.
		AI_Output(other,self, " DIA_KDF_507_Talamon_FirstWarn_01_09 " );	// Can't do anything? In what sense?
		AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_01_10 " );	// ...(recovering) What are you talking about, my son?
		AI_Output(other,self, " DIA_KDF_507_Talamon_FirstWarn_01_11 " );	// Well, about higher magicians who sooner or later will understand...
		AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_01_12 " );	// Are you healthy? If not, then I advise you to contact the master Neoras, an alchemist. He's on the opposite side of the dungeon.
		AI_Output(self,other, " DIA_KDF_507_Talamon_FirstWarn_01_13 " );	// This part of the passage is closed. Leave!
		TalamonFM = TRUE;
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_Second_Warn (C_Info) .
{
	npc = KDF_507_Talamon;
	nr = 2;
	condition = DIA_KDF_507_Talamon_SecondWarn_Condition;
	information = DIA_KDF_507_Second_Warn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_SecondWarn_Condition()
{
	if ((Pyrokar_LetYouPassTalamon ==  FALSE ) && (Chapter <  6 ) && (Npc_RefuseTalk(self) ==  FALSE ) && (hero.guild !=  GIL_KDF ) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar [ AIV_PASSGATE ] ==  FALSE ) && ( other . guild !=  GIL_MEATBUG ))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_SecondWarn_Info()
{
	AI_TurnToNPC(hero,Garwig);
	AI_Output(self,other, " DIA_KDF_507_Talamon_SecondWarn_04_00 " );	// Innos will turn his wrath against you if you don't turn back!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_Talamon_Attack(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 3;
	condition = DIA_KDF_507_Talamon_Attack_Condition;
	information = DIA_KDF_507_Talamon_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_Attack_Condition()
{
	if ((Pyrokar_LetYouPassTalamon ==  FALSE ) && (Chapter <  6 ) && (Npc_RefuseTalk(self) ==  FALSE ) && (hero.guild !=  GIL_KDF ) && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarningGiven) && (self.aivar [ AIV_PASSGATE ] ==  FALSE ) && ( other . guild !=  GIL_MEATBUG ))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_Attack_Info()
{
	AI_TurnToNPC(hero,Garwig);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_TurnAway(other,self);
	AI_GotoWP(other,"NW_MONASTERY_CELLAR_14");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_State_IgaranzNew ( C_Info ) .
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_IgaranzNew_condition;
	information = DIA_Talamon_IgaranzNew_info;
	permanent = FALSE;
	description = " I need your help. " ;
};

func int DIA_Talamon_IgaranzNew_condition()
{
	if ((Kapitel >=  2 ) && (MIS_Igaraz_OneMoreChance == LOG_Running) && ( IS_PYROKAR_IGORANZINFO  ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Talamon_IgaranzNew_info()
{
	AI_Output(other,self, " DIA_Talamon_IgaranzNew_01_01 " );	// I need your help.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_01_02 " );	// What's the matter, brother?
	AI_Output(other,self, " DIA_Talamon_IgaranzNew_01_03 " );	// Acolyte Igaraz is determined to become a Firebender, and I'm sure he deserves another chance.
	AI_Output(other,self, " DIA_Talamon_IgaranzNew_01_04 " );	// Pyrocar told me that it's up to you to decide.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_01_05 " );	// Hmmm...(thoughtfully) No one used this law for a very long time.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_01_06 " );	// Here you need to think. On the one hand, Igarats has already failed the test once.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_01_07 " );	// On the other hand, I have known him for a very long time, as a capable student and faithful servant of Innos.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_01_09 " );	// Okay. Let him have another chance, but this time - the last!
	AI_Output(other,self, " DIA_Talamon_IgaranzNew_01_10 " );	// I understand you. What task will you give him?
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_01_11 " );	// Not easy. Let the acolyte Igaraz bring me the heart of a demon.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_01_12 " );	// And only after passing this test, he will be able to enter the circle of Fire.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_01_13 " );	// I'll be very grateful if you convey these terms to him.
	IS_TALAMON_IGORANZCONDITION = TRUE;
	B_LogEntry( TOPIC_IGARANZ_NEW , " Talamon ordered Igaratsu to retrieve the Demon Heart. I need to pass these conditions on to him. " );
};

instance DIA_Talamon_IgaranzNew_DemonHeart (C_Info);
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_Talamon_IgaranzNew_DemonHeart_condition;
	information = DIA_GuaranteedNew_DemonHeart_info;
	permanent = FALSE;
	description = " Acolyte of Igaraz asked me to give you this heart. " ;
};


func int DIA_Talamon_IgaranzNew_DemonHeart_condition()
{
	if ((Chapter >=  2 ) && (MYGuaranteed_OneMoreChance == LOG_Running) && Npc_HasItems(hero,ItAt_DemonHeart) && ((MyGuaranteedMakeHappyGold ==  TRUE ) || (MyGuaranteedMakeHappyMagic ==  TRUE )))
	{
		return TRUE;
	};
};

func void DIA_Talamon_IgaranzNew_DemonHeart_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Talamon_IgaranzNew_DemonHeart_01_01 " );	// Acolyte Igaraz asked me to give you this heart.
	B_GiveInvItems(other,self,ItAt_DemonHeart,1);
	Npc_RemoveInvItem(self,ItAt_DemonHeart);
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_DemonHeart_01_02 " );	// (surprised) I hope you didn't help him get it?
	AI_Output(other,self, " DIA_Talamon_IgaranzNew_DemonHeart_01_03 " );	// No. I only agreed to give this heart to you.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_DemonHeart_01_04 " );	// Okay. Since he passed my test, he can wear the robe of a Firebender from now on.
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_DemonHeart_01_05 " );	// Here, give him this.
	B_GiveInvItems(self,other,itar_kdf_m_new,1);
	AI_Output(self,other, " DIA_Talamon_IgaranzNew_DemonHeart_01_06 " );	// Everything else he must ask Master Parlan.
	B_LogEntry( TOPIC_IGARANZ_NEW , " I gave Talamon the heart of a demon. Now I can tell Igaratsu the good news and finally give him the Fire Mage Robe. " );
	IgaranzMakeHappyOk = TRUE ;
};


instance DIA_Talamon_KAP5_Stop(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 50;
	condition = DIA_Talamon_KAP5_Stop_Condition;
	information = DIA_Talamon_KAP5_Stop_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Talamon_KAP5_Stop_Condition()
{
	if(Pyrokar_LetYouPassTalamon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_Stop_Info()
{
	AI_Output(self,other, " DIA_Talamon_KAP5_Stop_04_00 " );	// You can't go any further - turn back!
	AI_Output(other,self, " DIA_Talamon_KAP5_Stop_15_01 " );	// The pyrocar said I could take the book of Xardas.
	AI_Output(self,other, " DIA_Talamon_KAP5_Stop_04_02 " );	// Well, if he said it. Okay, you can come in. The book you're looking for is over there on the alchemy table.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath, " Talamon keeps the book of Xardas on the alchemy table in the basement. " );
	self.aivar[AIV_EnemyOverride] = FALSE ;
};


instance DIA_Talamon_FoundSecretDoor(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_FoundSecretDoor_Condition;
	information = DIA_Talamon_FoundSecretDoor_Info;
	permanent = FALSE;
	description = " I found a secret door. " ;
};


func int DIA_Talamon_FoundSecretDoor_Condition()
{
	if(SecretLibraryIsOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_FoundSecretDoor_Info()
{
	AI_Output(other,self, " DIA_Talamon_FoundSecretDoor_15_00 " );	// I found a secret door.
	AI_Output(self,other, " DIA_Talamon_FoundSecretDoor_04_01 " );	// (surprised) What? Where?
	AI_Output(other,self, " DIA_Talamon_FoundSecretDoor_15_02 " );	// Behind the bookshelf.
	AI_Output(self,other, " DIA_Talamon_FoundSecretDoor_04_03 " );	// What's behind the door?
	AI_Output(other,self, " DIA_Talamon_FoundSecretDoor_15_04 " );	// Looks like it's an old basement.
	AI_Output(self,other, " DIA_Talamon_FoundSecretDoor_04_05 " );	// This is important news, I must inform the Pyrocar immediately.
	AI_Output(self,other, " DIA_Talamon_FoundSecretDoor_04_06 " );	// In the meantime, you must find out what's in that basement.
	MIS_ScoutLibrary = LOG_Running;
};


instance DIA_Talamon_ScoutSecretLibrary(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_ScoutSecretLibrary_Condition;
	information = DIA_Talamon_ScoutSecretLibrary_Info;
	permanent = TRUE;
	description = " I've been to this basement. " ;
};


func int DIA_Talamon_ScoutSecretLibrary_Condition()
{
	if((MIS_ScoutLibrary == LOG_Running) && (HeroWasInLibrary == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talamon_ScoutSecretLibrary_Info()
{
	AI_Output(other,self, " DIA_Talamon_ScoutSecretLibrary_15_00 " );	// I was in this basement.
	AI_Output(self,other, " DIA_Talamon_ScoutSecretLibrary_04_01 " );	// And what did you find there?
	if (Npc_IsDead(SecretLibrarySkeleton))
	{
		AI_Output(other,self, " DIA_Talamon_ScoutSecretLibrary_15_02 " );	// There was a warrior skeleton guarding the door. I killed him.
		AI_Output(self,other, " DIA_Talamon_ScoutSecretLibrary_04_03 " );	// Great.
		AI_Output(self,other, " DIA_Talamon_ScoutSecretLibrary_04_04 " );	// We'll deal with this basement when Evil is defeated.
		MIS_ScoutLibrary = LOG_SUCCESS;
		B_GivePlayerXP(XP_ScoutSecretLibrary);
	}
	else
	{
		AI_Output(other,self, " DIA_Talamon_ScoutSecretLibrary_15_05 " );	// Down there, crowds of monsters.
		AI_Output(self,other, " DIA_Talamon_ScoutSecretLibrary_04_06 " );	// There should be something there, keep looking. And destroy these monsters without any pity.
	};
};


instance DIA_Talamon_PICKPOCKET(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 900;
	condition = DIA_Talamon_PICKPOCKET_Condition;
	information = DIA_Talamon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Talamon_PICKPOCKET_Condition()
{
	return  C_Robbery ( 87 , 140 );
};

func void DIA_Talamon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,Dialog_Back,DIA_Talamon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talamon_PICKPOCKET_DoIt);
};

func void DIA_Talamon_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,130);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Talamon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};


instance DIA_TALAMON_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = dia_talamon_runemagicnotwork_condition;
	information = dia_talamon_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_talamon_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_talamon_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Talamon_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Talamon_RuneMagicNotWork_01_01 " );	// While I stood guard in the dungeon of the monastery and rarely used them, they worked. Now, when there was an urgent need for them, they suddenly refused!
	AI_Output(other,self, " DIA_Talamon_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_Talamon_RuneMagicNotWork_01_03 " );	// This problematic issue is global and everyone faces it. Everyone has had a chance to be exhausted in this regard.
	AI_Output(other,self, " DIA_Talamon_RuneMagicNotWork_01_04 " );	// Got it.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};


var int talamon_teach_d_1;

instance DIA_TALAMON_TEACHBLROBS(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 5;
	condition = dia_talamon_teachblrobs_condition;
	information = dia_talamon_teachblrobs_info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};

func int dia_talamon_teachblrobs_condition()
{
	if((hero.guild == GIL_KDF) && (Npc_HasItems(hero,ItAr_KDF_H) >= 1))
	{
		return TRUE;
	};
};

func void dia_talamon_teachblrobs_info()
{
	TALAMON_TEACH_D_1 = TRUE;
	AI_Output(other,self, " DIA_Talamon_TeachBlRobs_01_01 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_02 " );	// If you mean magic, then no, brother.
	AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_03 " );	// I don't teach newcomers to our order. However, I can tell you about the ancient rite of consecration of the Firebender's robe.
	AI_Output(other,self, " DIA_Talamon_TeachBlRobs_01_04 " );	// Interesting...
};


instance DIA_TALAMON_TEACHBLROBS2(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 800;
	condition = dia_talamon_teachblrobs2_condition;
	information = dia_talamon_teachblrobs2_info;
	permanent = TRUE;
	description = " Teach me how to consecrate Firemage's robes. (Learning points: 5, Cost: 2000 coins) " ;
};


func int dia_talamon_teachblrobs2_condition()
{
	if ((hero.guild ==  GIL_KDF ) && ( TALAMON_TEACH_D_1  ==  TRUE ) && ( HEROKNOWS_BLESSED_ROBS  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_talamon_teachblrobs2_info()
{
	if((Npc_HasItems(hero,ItMi_Gold) >= 2000) && (hero.lp >= 5))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_05 " );	// Since ancient times, the highest magicians of Fire consecrated their robes, sprinkling them with holy water.
		AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_06 " );	// In order to perform the ceremony, you only need to find the statue of our master - Innos.
		AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_07 " );	// If Innos is kind enough to you, your robe will become stronger and better protect you.
		AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_08 " );	// Remember, you can only bless one robe once, but it's never too late to try.
		AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_09 " );	// That's all you need to know. Now go, brother, and may the sacred fire of Innos be with you!
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus, " Now I know what I need to bless my robe: thirty-five bottles of holy water. " );
		hero.lp = hero.lp - 5;
		RankPoints = RankPoints + 5;
		B_GiveInvItems(hero,self,ItMi_Gold,2000);
		Npc_RemoveInvItems(self,ItMi_Gold,2000);
		Snd_Play("LevelUP");
		HEROKNOWS_BLESSED_ROBS = 1;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) <= 2000)
	{
		AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_10 " );	// Bring me a small donation first.
		AI_StopProcessInfos(self);
	}
	else if(hero.lp < 5)
	{
		AI_Output(self,other, " DIA_Talamon_TeachBlRobs_01_11 " );	// You must gain experience first.
		AI_StopProcessInfos(self);
	};
};
Footer
