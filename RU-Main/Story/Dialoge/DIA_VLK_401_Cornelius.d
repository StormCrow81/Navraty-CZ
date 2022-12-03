

instance DIA_Cornelius_Exit(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 999;
	condition = DIA_Cornelius_Exit_Condition;
	information = DIA_Cornelius_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

func void DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_SeeMurder(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_SeeMurder_Condition;
	information = DIA_Cornelius_SeeMurder_Info;
	permanent = FALSE;
	description = " You saw Lothar killed, didn't you? " ;
};


func int DIA_Cornelius_SeeMurder_Condition()
{
	if(RecueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_SeeMurder_Info()
{
	AI_Output(other,self, " DIA_Cornelius_SeeMurder_15_00 " );	// You saw how Lothar was killed, didn't you?
	AI_Output(self,other, " DIA_Cornelius_SeeMurder_13_01 " );	// (nervously) I don't have to answer questions like that.
	AI_Output(self,other, " DIA_Cornelius_SeeMurder_13_02 " );	// Lord Hagen has already interrogated me.
};


instance DIA_Cornelius_WhatYouSee(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 5;
	condition = DIA_Cornelius_WhatYouSee_Condition;
	information = DIA_Cornelius_WhatYouSee_Info;
	permanent = FALSE;
	description = " What exactly did you see? " ;
};


func int DIA_Cornelius_WhatYouSee_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_SeeMurder))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output(other,self, " DIA_Cornelius_WhatYouSee_15_00 " );	// What exactly did you see?
	AI_Output(self,other, " DIA_Cornelius_WhatYouSee_13_01 " );	// (excitedly) Look, I don't have time to chat with you.
	AI_Output(self,other, " DIA_Cornelius_WhatYouSee_13_02 " );	// (excitedly) Go away, I'm not seeing anyone right now.
	B_LogEntry(TOPIC_RescueBennet, " Cornelius refuses to talk to me. " );
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_Enough(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 6;
	condition = DIA_Cornelius_Enough_Condition;
	information = DIA_Cornelius_Enough_Info;
	permanent = FALSE;
	description = " Enough! WHAT DID YOU SEE? " ;
};


func int DIA_Cornelius_Enough_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_WhatYouSee))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Enough_Info()
{
	AI_Output(other,self, " DIA_Cornelius_Enough_15_00 " );	// Enough! WHAT YOU SEE?
	AI_Output(self,other, " DIA_Cornelius_Enough_13_01 " );	// (nervously) I... I saw a mercenary stab a paladin in the back.
	AI_Output(self,other, " DIA_Cornelius_Enough_13_02 " );	// (nervously) And then he drew his sword and plunged it into his chest.
	AI_Output(other,self, " DIA_Cornelius_Enough_15_03 " );	// Are you absolutely sure about this?
	AI_Output(self,other, " DIA_Cornelius_Enough_13_04 " );	// (scared) Yes, of course. I saw it with my own eyes.
	AI_Output(self,other, " DIA_Cornelius_Enough_13_05 " );	// (frightened) But I really don't have time right now. I need to work with documents.
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_DontBelieveYou(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_DontBelieveYou_Condition;
	information = DIA_Cornelius_DontBelieveYou_Info;
	permanent = TRUE;
	description = " I don't believe you. " ;
};


func int DIA_Cornelius_DontBelieveYou_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Cornelius_Enough ) && ( Cornelius_TellTruth !=  TRUE ) && ( MY_RescueBennet !=  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_15_00 " );	// I don't believe you.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_13_01 " );	// (with mock confidence) So what? What are you going to do?
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou, " How much do you want? " ,DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou, " You really value your life, don't you? " ,DIA_Cornelius_DontBelieveYou_WantSurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, " You could be forced to speak in a monastery. " ,DIA_Cornelius_DontBelieveYou_Monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, " I can tell the mercenaries where you live. " ,DIA_Cornelius_DontBelieveYou_KnowYourHome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, " Perjury gets a long sentence! " ,DIA_Cornelius_DontBelieveYou_Perjury);
	};
	if(hero.guild == GIL_KDM)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, " Say, do you like pain? " ,dia_cornelius_dontbelieveyou_kdm);
	};
	if(hero.guild == GIL_KDW)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, " In the name of Adanos, I will get you right! " ,dia_cornelius_dontbelieveyou_kdw);
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, " You'll have to be treated differently. " ,dia_cornelius_dontbelieveyou_sek);
	};
};

func void DIA_Cornelius_DontBelieveYou_WhatYouWant()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00 " );	// How much do you want?
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01 " );	// (arrogantly) You don't have enough gold to pay me.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//Сколько?
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03 " );	// Two thousand gold coins! Then I may reconsider my point of view.
	B_LogEntry(TOPIC_RescueBennet, " Cornelius is willing to talk to me for two thousand gold coins. " );
	Cornelius_PayForProof = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_WantSurvive()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_WantSurvive_15_00 " );	// You really value your life, don't you?
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_WantSurvive_13_01 " );	// (frightened) If you attack me, you'll be hanged.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_WantSurvive_13_02 " );	// I have very powerful friends. So do not even think to touch me even with a finger.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_WantSurvive_13_03 " );	// Now get out of here! Go, I'll call the guards!
	AI_StopProcessInfos(self);
};

func void DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_Monastery_15_00 " );	// You could be forced to speak in the monastery.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_Monastery_13_01 " );	// (white as snow) What do you mean by that?
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_Monastery_15_02 " );	// Well, we have methods to get people to tell the truth. Very painful methods.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_Monastery_13_03 " );	// No, please don't. I'll tell you everything you want to know.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_kdm()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDM_15_00 " );	// Tell me, do you like pain?
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_KDM_13_01 " );	// What do you mean by that?
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDM_15_02 " );	// Well, I had the idea to introduce you to some of my servants.
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDM_15_03 " );	// They love to torture and torment people like you! I think a couple of zombies will be enough to loosen your tongue.
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDM_15_04 " );	// Or... a demon, for example. Oh, how these cuties love to tear human flesh! You should have seen!
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_KDM_13_05 " );	// (white as snow) No, please. I'll say whatever you want.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_kdw()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDW_15_00 " );	// In the name of Adanos, I will get the truth out of you!
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDW_15_01 " );	// Even if I have to compromise some of our principles in doing so.
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDW_15_02 " );	// Whether you like it or not, I will inform Vatras of some of your atrocities.
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDW_15_03 " );	// Albeit a little fictitious. Believe me, rumors will quickly spread around the city. Your name will be a disgrace to the entire city.
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDW_15_05 " );	// People will spit in your face, and your name will be mixed with dirt!
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_KDW_15_06 " );	// (white as snow) WHAT?! You won't do it! Who will believe you?
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KDW_15_07 " );	// To me - maybe not. And Vatras is a very powerful person in the city. Are you savvy?
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_KDW_13_08 " );	// Okay, okay. I'll say whatever you want.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_sek()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_SEK_15_00 " );	// We'll have to treat you differently.
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_SEK_15_01 " );	// You know that some Gurus from our Brotherhood are very friendly with many influential people of this city.
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_SEK_15_02 " );	// And your boss too!
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_SEK_15_03 " );	// (white as snow) What are you talking about?
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_SEK_15_04 " );	// To the fact that you may soon have to look for a new job.
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_SEK_15_05 " );	// And, most likely, it may turn out that you won't find it in Khorinis!
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_SEK_15_06 " );	// So I'm thinking of putting in a few words to Larius for you - and we'll see how quickly they put you out of here on the street.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_SEK_15_07 " );	// You... you won't do this!
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_SEK_15_08 " );	// Trust me, I'll be fine if you don't tell me the whole truth about Lothar's murder now.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_SEK_13_09 " );	// Okay, okay. I'll say whatever you want.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00 " );	// I can tell the mercenaries where you live.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01 " );	// (white as chalk) What do you mean by that?
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02 " );	// I bet they're eager to meet you. They really don't like this situation.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03 " );	// You can't do this. They will kill me!
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04 " );	// Quite likely.
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05 " );	// I'll say whatever you want, just don't do it.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output(other,self, " DIA_Cornelius_DontBelieveYou_Perjury_15_00 " );	// For perjury you will be put in jail - and for a long time!
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_Perjury_13_01 " );	// Are you trying to threaten me? Is some pathetic guard threatening me, the governor's secretary?
	AI_Output(self,other, " DIA_Cornelius_DontBelieveYou_Perjury_13_02 " );	// If you don't disappear immediately, I'll see to it that you are demoted.
	Cornelius_ThreatenByMilSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_PayCornelius(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_PayCornelius_Condition;
	information = DIA_Cornelius_PayCornelius_Info;
	permanent = TRUE;
	description = " Here's gold. " ;
};


func int DIA_Cornelius_PayCornelius_Condition()
{
	if((Cornelius_PayForProof == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PayCornelius_Info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_Cornelius_PayCornelius_13_01 " );	// I'd rather not ask where you got it.
	AI_Output(self,other, " DIA_Cornelius_PayCornelius_13_02 " );	// Honestly, I don't really care.
	AI_Output(self,other, " DIA_Cornelius_PayCornelius_13_03 " );	// The main thing is that it is now mine.
	Cornelius_TellTruth = TRUE;
};

instance DIA_Cornelius_RealStory(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_RealStory_Condition;
	information = DIA_Cornelius_RealStory_Info;
	permanent = TRUE;
	description = " So what really happened? " ;
};

func int DIA_Cornelius_RealStory_Condition()
{
	if(Cornelius_TellTruth == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_RealStory_Info()
{
	AI_Output(other,self, " DIA_Cornelius_RealStory_15_00 " );	// So what really happened?
	AI_Output(self,other, " DIA_Cornelius_RealStory_13_01 " );	// I didn't see what happened. I got gold for blaming this mercenary.
	AI_Output(self,other, " DIA_Cornelius_RealStory_13_02 " );	// It's every man for himself these days. And I needed money.
	AI_Output(other,self, " DIA_Cornelius_RealStory_15_03 " );	// Who paid you?
	AI_Output(self,other, " DIA_Cornelius_RealStory_13_04 " );	// What I said is enough for you. He will kill me if I let it out.
	AI_Output(other,self, " DIA_Cornelius_RealStory_15_05 " );	// Are you ready to confirm what you said to Lord Hagen?
	AI_Output(self,other, " DIA_Cornelius_RealStory_13_06 " );	// I'm not out of my mind yet. I'm not going to stay in the city.

	if(Npc_HasItems(self,ItWr_CorneliusTagebuch_Mis) >= 1)
	{
		AI_Output(self,other, " DIA_Cornelius_RealStory_13_07 " );	// I'll give you my diary, it'll be proof enough.
		B_GiveInvItems(self,other,ItWr_CorneliusTagebuch_Mis,1);
	};
	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_LogEntry(TOPIC_RescueBennet, " Cornelius lied. He was paid to put Bennet in jail. But he won't tell me who bribed him. He's trembling with fear. " );
	CorneliusFlee = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_Cornelius_Fleeing(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 1;
	condition = DIA_Cornelius_Fleeing_Condition;
	information = DIA_Cornelius_Fleeing_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Cornelius_Fleeing_Condition()
{
	if((CorneliusFlee == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Fleeing_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_Cornelius_PICKPOCKET(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 900;
	condition = DIA_Cornelius_PICKPOCKET_Condition;
	information = DIA_Cornelius_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his book) " ;
};


func int DIA_Cornelius_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET ) >=  1 ) && (self.aivar[AIV_PlayerHasPickedMyPocket] ==  ​​FALSE ) && (Npc_HasItems(self,ItWr_My_CorneliusTagebook) >=  1 ) && (RecueBennet_KnowsCornelius ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
	Info_AddChoice(DIA_Cornelius_PICKPOCKET,Dialog_Back,DIA_Cornelius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cornelius_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cornelius_PICKPOCKET_DoIt);
};

func void DIA_Cornelius_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		B_GiveInvItems(self,other,ItWr_CorneliusTagebuch_Mis,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
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

func void DIA_Cornelius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
};

