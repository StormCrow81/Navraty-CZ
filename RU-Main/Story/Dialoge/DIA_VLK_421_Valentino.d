

instance DIA_Valentino_EXIT(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 999;
	condition = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Valentino_HALLO (C_Info)
{
	npc = VLK_421_Valentino;
	nr = 1;
	condition = DIA_Valentino_HALLO_Condition;
	information = DIA_Valentino_HALLO_Info;
	permanent = FALSE;
	description = " So what do we have here? " ;
};


func int DIA_Valentino_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info()
{
	AI_Output(other,self, " DIA_Valentino_HALLO_15_00 " );	// Well, what kind of person are you?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Valentino_HALLO_03_01 " );	// My name is Valentino. I'm trying not to pollute this day, given to me by Innos, with my work.
		AI_Output(other,self, " DIA_Valentino_HALLO_15_02 " );	// Hold your tongue.
		AI_Output(self,other, " DIA_Valentino_HALLO_03_03 " );	// Oh, I'm sorry, I didn't mean to offend our Lord. Once again, please forgive me.
	}
	else
	{
		AI_Output(self,other, " DIA_Valentino_HALLO_03_04 " );	// Are you unfamiliar with good manners? It's disgusting!
		AI_Output(self,other, " DIA_Valentino_HALLO_03_05 " );	// This dirty rabble is everywhere. Don't you have a job that you should be doing?
		AI_Output(self,other, " DIA_Valentino_HALLO_03_06 " );	// But I guess no one would miss a slacker like you, right?
		AI_Output(self,other, " DIA_Valentino_HALLO_03_07 " );	// Well, if you had as much gold as me, you wouldn't be working either. But you'll never be that rich.
		AI_Output(other,self, " DIA_Valentino_HALLO_15_08 " );	// You're so funny.
	};
};


instance DIA_Valentino_WhoAgain(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 2;
	condition = DIA_Valentino_WhoAgain_Condition;
	information = DIA_Valentino_WhoAgain_Info;
	permanent = FALSE;
	description = " I asked you who you are! " ;
};


func int DIA_Valentino_WhoAgain_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_VALENTINO_HALLO ) && ( other . guild !=  GIL_KDF ) && ( other . guild !=  GIL_PAL ) && ( other . guild !=  GIL_KDW ) && ( other . guild !=  GIL_KDM ) && ( VALENTINOCANJOINPSI  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info()
{
	AI_Output(other,self, " DIA_Valentino_Add_15_01 " );	// I asked you who you are!
	AI_Output(self,other, " DIA_Valentino_HALLO_wasmachstdu_03_01 " );	// I'm Valentino the Magnificent. Bon vivant and favorite of women.
	AI_Output(self,other, " DIA_Valentino_HALLO_wasmachstdu_03_02 " );	// Poor worries, rich in wisdom and gold, women rush at me.
	AI_Output(self,other, " DIA_Valentino_HALLO_wasmachstdu_03_03 " );	// If you have problems, keep them to yourself. I do not need them.
};


instances DIA_Valentino_Manieren (C_Info)
{
	npc = VLK_421_Valentino;
	nr = 3;
	condition = DIA_Valentino_Manieren_Condition;
	information = DIA_Valentino_Manieren_Info;
	permanent = FALSE;
	description = " Looks like I'm going to have to teach you some manners! " ;
};


func int DIA_Valentino_Manieren_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_VALENTINO_HALLO ) && ( other . guild !=  GIL_PAL ) && ( other . guild !=  GIL_KDF ) && ( other . guild !=  GIL_KDW ) && ( other . guild !=  GIL_KDM ) && ( VALENTINOCANJOINPSI  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Valentino_Maniers_Info()
{
	AI_Output(other,self, " DIA_Valentino_Add_15_02 " );	// Looks like I'll have to teach you good manners!
	AI_Output(self,other, " DIA_Valentino_HALLO_klappe_03_01 " );	// I don't care! Thrash me all you want. And when I get up tomorrow morning, I'll be handsome again.
	AI_Output(self,other, " DIA_Valentino_HALLO_klappe_03_02 " );	// But you will have to live with this crime for the rest of your days.
};


var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;

instance DIA_Valentino_WASNUETZLICHES(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 4;
	condition = DIA_Valentino_WASNUETZLICHES_Condition;
	information = DIA_Valentino_WASNUETZLICHES_Info;
	permanent = TRUE;
	description = " Is there anything else you can tell me? " ;
};


func int DIA_Valentino_WASNUETZLICHES_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_VALENTINO_HELLO ) &&  
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info()
{
	AI_Output(other,self, " DIA_Valentino_Add_15_03 " );	// (calmly) Is there anything else you can tell me?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
	}
	else  if ((Valentino_Lo_Perm ==  FALSE ) && (other.guild !=  GIL_PAL ) && (other.guild !=  GIL_KDF ))
	{
		AI_Output(self,other, " DIA_Valentino_WASNUETZLICHES_03_01 " );	// Get popular, never promise anything to anyone, take what you can, and be careful not to get into a fight with the militia.
		AI_Output(self,other, " DIA_Valentino_WASNUETZLICHES_03_02 " );	// Or with a jealous husband, of course. It's the worst, trust me.
		Valentino_Lo_Perm = TRUE;
	}
	else if((Valentino_Hi_Perm == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other, " DIA_Valentino_WASNUETZLICHES_03_03 " );	// Nothing is impossible for a person in your position. You just have to know when to act.
		AI_Output(self,other, " DIA_Valentino_WASNUETZLICHES_03_04 " );	// So don't waste your time and get going.
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Valentino_WASNUETZLICHES_03_05 " );	// I've told you everything you need to know. The rest is up to you.
	};
};


instance DIA_Valentino_PICKPOCKET(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = DIA_Valentino_PICKPOCKET_Condition;
	information = DIA_Valentino_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};


func int DIA_Valentino_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Valentino) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Valentino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
	Info_AddChoice(DIA_Valentino_PICKPOCKET,Dialog_Back,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Valentino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_Valentino,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Valentino_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
};


instance DIA_VALENTINO_JOINSEKTA (C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_joinsekta_condition;
	information = dia_valentino_joinsekta_info;
	permanent = FALSE;
	description = " You're not well liked in the city. " ;
};


func int dia_valentino_joinsekta_condition()
{
	if (( MY_NOVICECANJOIN  == LOG_Running ) && ( other . guild ==  GIL_SEK ) && Npc_KnowsInfo ( other , DIA_VALENTINO_HELLO ) && ( VALENTINOSHIT  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_valentino_joinsekta_info()
{
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_00 " );	// You're not well liked in the city, I noticed.
	AI_Output(self,other, " DIA_Valentino_JoinSekta_01_01 " );	// (angrily) What do you care?
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_02 " );	// Don't get excited. I have one idea how to help you.
	AI_Output(self,other, " DIA_Valentino_JoinSekta_01_04 " );	// (puffily) I don't need anyone's help! I can take care of myself!
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_05 " );	// You want to earn people's respect.
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_07 " );	// But all you could do was get a couple of slaps from Regis.
	AI_Output(self,other, " DIA_Valentino_JoinSekta_01_09 " );	// I... (unsure) I... I'm trying, but... yes, you're probably right...
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_10 " );	// I know what will help you gain self-confidence.
	AI_Output(self,other, " DIA_Valentino_JoinSekta_01_11 " );	// Yes?! What are you talking about?
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_12 " );	// Have you heard of the Swamp Brotherhood?
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_15 " );	// Gurus of the Brotherhood are very wise people who have realized the true faith in long years of self-knowledge.
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_16 " );	// I think this is exactly what you need.
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_17 " );	// Brotherhood will help you find yourself and put you on the true path.
	AI_Output(self,other, " DIA_Valentino_JoinSekta_01_18 " );	// (hopefully) Do you really think so?
	AI_Output(self,other, " DIA_Valentino_JoinSekta_01_26 " );	// Hmmm...(thinks) Alright, let's go!
	AI_Output(other,self, " DIA_Valentino_JoinSekta_01_27 " );	// Great! Follow me and don't fall behind.
	B_LogEntry( TOPIC_NOVICECANJOIN , " I talked to Valentino. He was easily persuaded to come with me to Parvez's Idol. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	VALENTINOCANJOINPSI = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VALENTINO_THANKSJOINSEKTA(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_thanksjoinsekta_condition;
	information = dia_valentino_thanksjoinsekta_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_valentino_thanksjoinsekta_condition()
{
	if((MIS_NOVICECANJOIN == LOG_SUCCESS) && (VALENTINOPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_valentino_thanksjoinsekta_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Valentino_ThanksJoinSekta_01_00 " );	// Thanks for helping me. I don't even know how to repay you for your help.
	VALENTINOPSI = TRUE;
	self.guild = GIL_SEK;
	Npc_SetTrueGuild(self,GIL_SEK);
	B_DeletePetzCrime(self);
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE ;
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;

	if(MIS_VALENTINOHELP == LOG_Running)
	{
		MIS_VALENTINOHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_VALENTINOHELP);
	};

	AI_StopProcessInfos(self);
};


instance DIA_VALENTINO_TALIASANLETTER(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_taliasanletter_condition;
	information = dia_valentino_taliasanletter_info;
	permanent = FALSE;
	description = " Do you have a job for me? " ;
};


func int dia_valentino_taliasanletter_condition()
{
	if (( MIS_TALIASANHELP  == LOG_Running) &&  ! Npc_KnowsInfo(other, DIA_TALIASAN_SENDTOLARIUS ) && Npc_KnowsInfo(other, DIA_VALENTINO_HALLO) && ( VALENTINOPSI  ==  FALSE ) && ((hero.guild !=  GIL_KDF ) || (hero.guild ) =  GIL_PAL || (hero.guild !=  GIL_KDW ) || (hero.guild !=  GIL_KDM )))
	{
		return TRUE;
	};
};

func void dia_valentino_taliasanletter_info()
{
	AI_Output(other,self, " DIA_Valentino_TaliasanLetter_01_00 " );	// Do you have a job for me?
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_06 " );	// Hmmm. You don't come across as a tough guy!
	AI_Output(other,self, " DIA_Valentino_TaliasanLetter_01_07 " );	// Have you ever been told that looks can be deceiving?
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_08 " );	// Yes? Well then...
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_10 " );	// There was a guy named Regis who was very rude to me just now.
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_12 " );	// If you're that cool, here's a challenge for you: hit that oaf from me a couple of times!
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_14 " );	// I would do it myself, but I don't feel like getting my hands dirty.
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_18 " );	// Oh, yes. You probably want to ask how much I will pay you for this?
	AI_Output(other,self, " DIA_Valentino_TaliasanLetter_01_21 " );	// I'm not interested in gold.
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_22 " );	// (surprised) Yes? That's it! So are you still proud of us? Refusing gold?
	AI_Output(other,self, " DIA_Valentino_TaliasanLetter_01_23 " );	// No. The point is different.
	AI_Output(other,self, " DIA_Valentino_TaliasanLetter_01_25 " );	// I need the help of the powerful people of this city to solve a small problem.
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_30 " );	// Hmmm. OK. And what help do you need?
	AI_Output(other,self, " DIA_Valentino_TaliasanLetter_01_31 " );	// You've heard of a man named Gallahad, haven't you?
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_32 " );	// Gallahad? Of course! Who hasn't heard of him?
	AI_Output(other,self, " DIA_Valentino_TaliasanLetter_01_33 " );	// So - it is he who needs your help.
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_34 " );	// Ah! So you're Gallahad's errand boy! (laughs) Now everything is clear.
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_35 " );	// And what does Gallahad need from me?
	AI_Output(other,self, " DIA_Valentino_TaliasanLetter_01_36 " );	// He needs you to write a letter of recommendation for him to praise him in front of Larius.
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_37 " );	// In front of the governor? But why did he need it?
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_41 " );	// But first, slap Regis in the neck!
	AI_Output(self,other, " DIA_Valentino_TaliasanLetter_01_44 " );	// Just be aware: Regis needs to know that I'm the one paying him back this, so to speak, debt! He-ha!
	MIS_VALENTINOHELP = LOG_Running;
	Log_CreateTopic(TOPIC_VALENTINOHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_Running);
	B_LogEntry( TOPIC_VALENTINOHELP , " Valentino will write a letter of recommendation for Gallahad if I thrash Regis, whom he recently had a fight with. " );
	AI_StopProcessInfos(self);
};

instance DIA_VALENTINO_PAYBACK(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = dia_valentino_payback_condition;
	information = dia_valentino_payback_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_valentino_payback_condition()
{
	if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE) && ((REGISFIGHTOK == TRUE) || (REGISFIGHTNOTOK == TRUE)))
	{
		return TRUE;
	};
};

func void dia_valentino_payback_info()
{
	if(REGISFIGHTOK == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other, " DIA_Valentino_PayBack_01_00 " );	// Hey! I heard you hit that Regis well!
		AI_Output(self,other, " DIA_Valentino_PayBack_01_04 " );	// I hope he remembers the lesson you taught him for a long time.

		if(MIS_TALIASANHELP == LOG_Running)
		{
			AI_Output(other,self, " DIA_Valentino_PayBack_01_05 " );	// Did you write a letter for Gallahad?
			AI_Output(self,other, " DIA_Valentino_PayBack_01_08 " );	// Here, take this. As agreed.
			AI_Output(self,other, " DIA_Valentino_PayBack_01_09 " );	// This is the best advice he can get from me.
			B_GiveInvItems(self,other,itwr_valentinoletter,1);
		};
		
		AI_Output(self,other, " DIA_Valentino_PayBack_01_14 " );	// And you, if anything, contact me.
		AI_Output(self,other, " DIA_Valentino_PayBack_01_15 " );	// Maybe I'll have some more work for you in the future.
		MIS_VALENTINOHELP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VALENTINOHELP,LOG_SUCCESS);
		B_LogEntry( TOPIC_VALENTINOHELP , " Valentino was pleased that I nailed Regis and wrote a letter of recommendation for Gallahad. " );
		AI_StopProcessInfos(self);
	};
	if(REGISFIGHTNOTOK == TRUE)
	{
		AI_Output(self,other, " DIA_Valentino_PayBack_01_18 " );	// Hey! I heard that Regis hit you hard.
		AI_Output(self,other, " DIA_Valentino_PayBack_01_19 " );	// I thought you were just an ordinary braggart like everyone else.
		AI_Output(self,other, " DIA_Valentino_PayBack_01_20 " );	// And good for nothing, miserable ragamuffin... (with a sneer)

		if(MIS_TALIASANHELP == LOG_Running)
		{
			AI_Output(other,self, " DIA_Valentino_PayBack_01_24 " );	// Did you write a letter for Gallahad?
			AI_Output(self,other, " DIA_Valentino_PayBack_01_25 " );	// WHAT? (laughs) And you still dare to demand it, insolent?
			AI_Output(self,other, " DIA_Valentino_PayBack_01_26 " );	// Or have you forgotten our agreement?
			AI_Output(self,other, " DIA_Valentino_PayBack_01_27 " );	// Get lost! Idiots like you get nothing from me.
		};

		MIS_VALENTINOHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_VALENTINOHELP);
		AI_StopProcessInfos(self);
	};
};
