

instance DIA_Larius_EXIT (C_Info)
{
	npc = VLK_400_Larius;
	nr = 999;
	condition = DIA_Larius_EXIT_Condition;
	information = DIA_Larius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Larius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Larius_Hello (C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = DIA_Larius_Hello_Condition;
	information = DIA_Larius_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Larius_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Larius_Hello_Info()
{
	AI_Output(self,other, " DIA_Larius_Hello_01_00 " );	// What are you doing here? If you need anything, make an appointment.
};


instance DIA_Larius_WhoAreYou(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_WhoAreYou_Condition;
	information = DIA_Larius_WhoAreYou_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

func void DIA_Larius_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Larius_WhoAreYou_01_01 " );	// I am Larius, head of the city of Khorinis.
	AI_Output(self,other, " DIA_Larius_WhoAreYou_01_02 " );	// Even if I don't seem like one to you at the moment, I'm the most powerful person in this city.
	AI_Output(other,self, " DIA_Larius_WhoAreYou_15_03 " );	// So you run everything here?
	AI_Output(self,other, " DIA_Larius_WhoAreYou_01_04 " );	// I... well... my hands are tied at the moment.
	AI_Output(self,other, " DIA_Larius_WhoAreYou_01_05 " );	// This Lord Hagen is in command here, at least while he's in town.
};


instance DIA_Larius_Disturb (C_Info)
{
	npc = VLK_400_Larius;
	nr = 3;
	condition = DIA_Larius_Disturb_Condition;
	information = DIA_Larius_Disturb_Info;
	permanent = TRUE;
	description = " I didn't mean to interrupt. " ;
};


func int DIA_Larius_Disturb_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Larius_WhoAreYou ) & & Wld_IsTime ( 14 , 0 , 12 , 0 ))
	{
		return TRUE;
	};
};

func void DIA_Larius_Disturb_Info()
{
	AI_Output(other,self, " DIA_Larius_Disturb_15_00 " );	// I didn't mean to interfere.
	AI_Output(self,other, " DIA_Larius_Disturb_01_01 " );	// But, nevertheless, prevented! Get out!
};


instance DIA_Larius_DieLage (C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_DieLage_Condition;
	information = DIA_Larius_DieLage_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Larius_DieLage_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void DIA_Larius_DieLage_Info()
{
	AI_Output(other,self, " DIA_Larius_DieLage_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Larius_DieLage_01_01 " );	// What do you care? While the paladins are here, Lord Hagen takes care of all matters relating to the life of the city.
};


instance DIA_Larius_Richterueberfall (C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_Richterueberfall_Condition;
	information = DIA_Larius_Richterueberfall_Info;
	description = " The judge hired bandits to kill you. " ;
};


func int DIA_Larius_Richterueberfall_Condition()
{
	if (( SCKnowsRichterComproBrief ==  TRUE ) && Npc_KnowsInfo(hero, DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void DIA_Larius_Richterueberfall_Info()
{
	AI_Output(other,self, " DIA_Larius_Richterueberfall_15_00 " );	// The judge hired bandits to kill you. I can prove it.
	AI_Output(self,other, " DIA_Larius_Richterueberfall_01_01 " );	// Don't talk nonsense, or do you want me to shackle you?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Larius_Richterueberfall_01_02 " );	// Even if you are a warrior of Innos...
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Larius_Richterueberfall_01_03 " );	// Even if you're a dedicated mage...
	};
	AI_Output(self,other, " DIA_Larius_Richterueberfall_01_04 " );	// My word still counts in this city. Don't you dare even try to tarnish the bright name of our judge!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Larius_PICKPOCKET (C_Info)
{
	npc = VLK_400_Larius;
	nr = 900;
	condition = DIA_Larius_PICKPOCKET_Condition;
	information = DIA_Larius_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Larius_PICKPOCKET_Condition()
{
	return  C_Robbery ( 35 , 120 );
};

func void DIA_Larius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
	Info_AddChoice(DIA_Larius_PICKPOCKET,Dialog_Back,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Larius_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};


instance DIA_LARIUS_DROGENPACKET(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_drogenpacket_condition;
	information = dia_larius_drogenpacket_info;
	permanent = TRUE;
	important = FALSE;
	description = " I have something for you. " ;
};


func int dia_larius_drogenpacket_condition()
{
	if (( MIS_ORUNPACKET  == LOG_Running) && (Npc_HasItems(other,itmi_drugenpocket) >=  1 ) && ( LARIUSTALKPACKET  ==  FALSE ) && Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou));
	{
		return TRUE;
	};
};

func void dia_larius_drogenpacket_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Larius_DrogenPacket_01_00 " );	// I have something for you.
	AI_Output(self,other, " DIA_Larius_DrogenPacket_01_01 " );	// What else?
	AI_Output(other,self, " DIA_Larius_DrogenPacket_01_02 " );	// Idol Oran asked me to give you this package.
	AI_Output(self,other, " DIA_Larius_DrogenPacket_01_03 " );	// Hmm... (looks appraisingly)

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE))
	{
		MeasureLarius = TRUE ;
		AI_Output(self,other, " DIA_Larius_DrogenPacket_01_04 " );	// (looks intently) Oran, you say?
		AI_Output(self,other, " DIA_Larius_DrogenPacket_01_05 " );	// Okay, give it here.
		B_GiveInvItems(other,self,itmi_drogenpocket,1);
		Npc_RemoveInvItems(self,itmi_drogenpocket,1);
		AI_Output(self,other, " DIA_Larius_DrogenPacket_01_06 " );	// Phew! Finally, I've been waiting for her. Excellent!
		AI_Output(self,other, " DIA_Larius_DrogenPacket_01_07 " );	// Here, give this to him this bag. And don't you dare open it, got it? And keep quiet about everything you saw!
		B_GiveInvItems(self,other,itmi_lariusgoldpocket, 1 );
		B_LogEntry( TOPIC_ORUNPACKET , " I met with Governor Larius. He became very nervous when I mentioned the package from the Idol of Oran, but accepted it anyway. In turn, he gave me a bag that I need to deliver safely back to the Idol. " );

		if(TALKLARIUSABOUTTALIASAN == TRUE)
		{
			Npc_ExchangeRoutine(self,"Always");
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Larius_DrogenPacket_01_10 " );	// What other Idol? What else Oran? What's the other package?
		AI_Output(self,other, " DIA_Larius_DrogenPacket_01_11 " );	// Who are you anyway?!
		AI_Output(other,self, " DIA_Larius_DrogenPacket_01_12 " );	// Well, how about. You seem to agree with him.
		AI_Output(self,other, " DIA_Larius_DrogenPacket_01_13 " );	// I don't know any Oran! You must be wrong, man.
		AI_Output(self,other, " DIA_Larius_DrogenPacket_01_14 " );	// So get off me! Understood?!
		B_LogEntry( TOPIC_ORUNPACKET , " I met with Governor Larius. He got very nervous when I mentioned the package from the Idol of Oran and said that he had no idea what I was talking about. Larius refused to accept the package at all. Maybe I did something wrong? " );
		AI_StopProcessInfos(self);
		LARIUSTALKPACKET = TRUE ;
		LARIUSCANCELPACKET = 0 ;
	};
};


instance DIA_LARIUS_DROGENPACKETAGAIN(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_drogenpacketagain_condition;
	information = dia_larius_drogenpacketagain_info;
	permanent = TRUE;
	important = FALSE;
	description = " About that package... " ;
};


func int dia_larius_drogenpacketagain_condition()
{
	if (( MY_ORUNPACKET  == LOG_Running) && (Npc_HasItems(other,itmi_drogenpocket) >=  1 ) && ( LARIUSTALCPACKET  ==  TRUE ) && ( LARIUSCANCELPACKET  <  2 )) ;
	{
		return TRUE;
	};
};

func void dia_larius_drogenpacketagain_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Larius_DrogenPacketAgain_01_00 " );	// Regarding that package...
	AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_01 " );	// (angrily) What?!

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE))
	{
		MeasureLarius = TRUE ;
		AI_Output(other,self, " DIA_Larius_DrogenPacketAgain_01_02 " );	// I couldn't mix anything up. The IDOL ORAN gives it to you!
		AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_03 " );	// Hmm... (looks appraisingly)
		AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_04 " );	// (looks intently) Oran, you say?
		AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_05 " );	// Okay, give it here.
		B_GiveInvItems(other,self,itmi_drogenpocket,1);
		Npc_RemoveInvItems(self,itmi_drogenpocket,1);
		AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_06 " );	// Phew! Finally, I've been waiting for her. Excellent!
		AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_07 " );	// Here, give this to him this bag. And don't you dare open it, got it? And keep quiet about everything you saw!
		B_GiveInvItems(self,other,itmi_lariusgoldpocket, 1 );
		B_LogEntry( TOPIC_ORUNPACKET , " Larius nevertheless agreed to take the package. In turn, he gave me the bag, which I need to deliver safely and safely back to the Idol. " );
		if(TALKLARIUSABOUTTALIASAN == TRUE)
		{
			Npc_ExchangeRoutine(self,"Always");
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		LARIUSCANCELPACKET = LARIUSCANCELPACKET  +  1 ;
		if ( LARIUSCANCELPACKET  !=  2 )
		{
			AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_10 " );	// Listen, boy!
			AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_11 " );	// If you dare to offer me this package again, you will spend the rest of your days behind bars!
			AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_12 " );	// Understood?!!!
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Larius_DrogenPacketAgain_01_13 " );	// I think I warned you! Now blame yourself - you stupid bastard!
			AI_Standup(self);
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_14");	//Стража!!!
			MIS_ORUNPACKET = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_ORUNPACKET);

			if(TALKLARIUSABOUTTALIASAN == TRUE)
			{
				Npc_ExchangeRoutine(self,"Always");
			};

			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_NONE,1);
		};
	};
};


instance DIA_LARIUS_LETTERFROMTALIASAN (C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_letterfromtaliasan_condition;
	information = dia_larius_letterfromtaliasan_info;
	permanent = FALSE;
	description = " I have business with you. " ;
};


func int dia_larius_letterfromtaliasan_condition()
{
	if (( MIS_TALIASANHELP  == LOG_Running) && (Npc_HasItems(other,itwr_taliasanrecommendedletters) >=  1 ) && ( TALIASANHELP_STEP1  ==  TRUE ) && Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou));
	{
		return TRUE;
	};
};

func void dia_larius_letterfromtaliasan_info()
{
	AI_Output(other,self, " DIA_Larius_LetterFromTaliasan_01_00 " );	// I have business with you.
	AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_01 " );	// What's the deal?
	AI_Output(other,self, " DIA_Larius_LetterFromTaliasan_01_02 " );	// One person would really like to return your favor to him.
	AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_04 " );	// (surprised) Yes? And who is this person?
	AI_Output(other,self, " DIA_Larius_LetterFromTaliasan_01_05 " );	// His name is Gallahad.
	AI_Output(other,self, " DIA_Larius_LetterFromTaliasan_01_06 " );	// He asked me to tell you that he deeply regrets what happened and asks you to show your indulgence to him.
	AI_Output(other,self, " DIA_Larius_LetterFromTaliasan_01_07 " );	// In addition, I have a bunch of letters of recommendation from influential people in this city...
	AI_Output(other,self, " DIA_Larius_LetterFromTaliasan_01_08 " );	// ...in which they speak very highly of Gallahad.

	if (Wld_IsTime( 12 , 0 , 14 , 0 ))
	{
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_09 " );	// (surprised) So Gallahad sent you?
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_10 " );	// How brave of him to take this step.
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_11 " );	// You say that you have letters of recommendation from influential people in Khorinis?
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_13 " );	// Come on, let me take a look at these letters...
		AI_Output(other, self, " DIA_Larius_LetterFromTaliasan_01_14 " );	// Here they are.
		B_GiveInvItems(other,self,itwr_taliasanrecomendedletters,1);
		Npc_RemoveInvItems(self,itwr_taliasanrecomendedletters,1);
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_15 " );	// (thinking) M-yes - impressive!
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_16 " );	// I see a lot of people I know have very good things to say about him.
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_17 " );	// And they are all respectable people.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_21 " );	// Well done!
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_22 " );	// You can tell Gallahad that I forgive him for the incident that happened between us then.
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_24 " );	// Eh... I always appreciated him as a good worker!
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_25 " );	// Therefore, I think it will be right if Gallahad returns to my service again.
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_26 " );	// Tell him he's been reinstated as city mage.
		TALKLARIUSABOUTTALIASAN = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		; _ _ _ _ _ _
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_32 " );	// (besides himself) WHAT?! Gallahad?
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_33 " );	// (angrily) What does this old fool think he is?!
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_35 " );	// This is out of the question!
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_36 " );	// And get your filthy papers away from me - I don't need this garbage!
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_40 " );	// Now get out of my sight before I call the guards!
		AI_Output(self,other, " DIA_Larius_LetterFromTaliasan_01_41 " );	// (breaking into a scream) Get out!
		LARIUSPISSOFF = TRUE ;
		TALKLARIUSABOUTTALIASAN = TRUE;
		B_LogEntry( TOPIC_TALIASANHELP , " Larius didn't even listen to me when I started talking about Gallahad. I think I did something wrong. I think I should talk to Gallahad. " );
		AI_StopProcessInfos(self);
	};
};


