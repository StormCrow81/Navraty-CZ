

instance DIA_Nagur_EXIT (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 999;
	condition = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_PICKPOCKET (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 900;
	condition = DIA_Nagur_PICKPOCKET_Condition;
	information = DIA_Nagur_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Nagur_PICKPOCKET_Condition();
{
	return  C_Robbery ( 75 , 150 );
};

func void DIA_Nagur_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
	Info_AddChoice(DIA_Nagur_PICKPOCKET,Dialog_Back,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
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

func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
};


instance DIA_Nagur_Hello (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 2;
	condition = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Hello_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Nagur_Hallo_08_00 " );	// Hey, I don't have time to chat with you. If you need information, speak to Cardiff.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Nagur_Hallo_08_01 " );	// Look, leave me alone, okay?
		AI_StopProcessInfos(self);
	};
};


var int NagurHack;

func void B_Nagur_Dispatch()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if ((Hlp_IsItem(heroArmor,ITAR_Mil_L) ==  FALSE ) && (Hlp_IsItem(heroArmor, ITAR_TOWNGUARD ) ==  FALSE ) && (Hlp_IsItem(heroArmor,ItAr_MIL_M) ==  FALSE ) && (Hlp_IsItem(heroArmor,ItAr_MIL_M) ==  FALSE ) && (Hlp_IsItem(heroArmor,ItAr_PAl_H) ==  FALSE ) && (Hlp_IsItem(heroArmor,ItAr_NOV_L) ==  FALSE ) && (Hlp_IsItem(heroArmor,ItAr_KDF_L) ==  FALSE ) &&(Hlp_IsItem(heroArmor,ItAr_KDF_H) ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Nagur_Add_08_02 " );	// You think I don't recognize you if you're wearing different clothes?!
	};
	AI_Output(self,other, " DIA_Nagur_Add_08_03 " );	// Don't stick your nose where it doesn't belong!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Проваливай!
	MIS_Nagur_Bote = LOG_SUCCESS ;
	NagurHack = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Job (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 3;
	condition = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent = FALSE;
	description = " Cardiff says you might have a job for me. " ;
};


func int DIA_Nagur_Job_Condition()
{
	if (DIA_Kardif_Diebeswerk_permanent ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Nagur_Job_Info()
{
	AI_Output(other,self, " DIA_Nagur_Job_15_00 " );	// Cardif says you might have a job for me.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Nagur_Add_08_00 " );	// There are NO jobs for people from the monastery here in the harbor! (laughs)
		B_Nagur_Dispatch();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Nagur_Add_08_01 " );	// There are NO jobs for the royal soldiers here in the harbor.
		B_Nagur_Dispatch();
	}
	else
	{
		AI_Output(self,other, " DIA_Nagur_Job_08_01 " );	// (assessing) Well, well... You're looking for a special job. OK. But we'll play by my rules, okay?
		AI_Output(other,self, " DIA_Nagur_Job_15_02 " );	// What does this mean?
		AI_Output(self,other, " DIA_Nagur_Job_08_03 " );	// This means that you will do what I say, and you will receive a third of the profit.
		AI_Output(self,other, " DIA_Nagur_Job_08_04 " );	// If this doesn't suit you, then I don't have a job for you.
		Info_ClearChoices( DIA_Nagur_Job);
		Info_AddChoice(DIA_Nagur_Job, " We are partners! Therefore, fifty-fifty. " ,DIA_Nagur_Job_Halbe);
		Info_AddChoice(DIA_Nagur_Job, " Good! You're in charge here. " ,DIA_Nagur_Job_Klar);
	};
};

func void DIA_Nagur_Job_Ready()
{
	AI_Output(other,self, " DIA_Nagur_Job_Klar_15_00 " );	// Good! You are in charge here.
	AI_Output(self,other, " DIA_Nagur_Job_Klar_08_01 " );	// Great. Then let me know when you're ready to earn a bunch of gold.
	Nagur_Deal = 80 ;
	Info_ClearChoices( DIA_Nagur_Job);
};

func void DIA_Nagur_Job_Half()
{
	AI_Output(other,self, " DIA_Nagur_Job_Halbe_15_00 " );	// We are partners! So fifty-fifty.
	AI_Output(self,other, " DIA_Nagur_Job_Halbe_08_01 " );	// Okay, that makes sense. Of course, we will share what we earn fairly.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	Nagur_Deal = 120 ;
	Info_ClearChoices( DIA_Nagur_Job);
};


instance DIA_Nagur_Order (C_Info)
{
	npc = VLK_493_Nagur;
	nr = 4;
	condition = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Subscription_Info;
	permanent = FALSE;
	description = " Agreed. So what's your plan? " ;
};


func int DIA_Nagur_Auftrag_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Nagur_Job ) && ( MIS_Nagur_Bote !=  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Order_Info()
{
	AI_Output(other,self, " DIA_Nagur_Auftrag_15_00 " );	// Agreed. So what's your plan?
	AI_Output(self,other, " DIA_Nagur_Auftrag_08_01 " );	// You know trader Baltram, don't you? If not, it's time to talk to him.
	AI_Output(self,other, " DIA_Nagur_Auftrag_08_02 " );	// This Baltram has a messenger who delivers goods to him from Akila's farm.
	AI_Output(self,other, " DIA_Nagur_Auftrag_08_03 " );	// Or rather, he HAD a messenger until I slit his throat. And now Baltram will have to look for a new errand boy. And they will be you.
	AI_Output(self,other, " DIA_Nagur_Auftrag_08_04 " );	// You should go to Baltram's job and take the package from Akil.
	AI_Output(self,other, " DIA_Nagur_Auftrag_08_05 " );	// Then you bring it to me and I'll sell it to an interested buyer. He will give you a good price for it.
	AI_Output(self,other, " DIA_Nagur_Auftrag_08_06 " );	// And don't try to sell these items yourself. Did you understand everything?
	Info_ClearChoices(DIA_Nagur_Subtraction);
	Info_AddChoice(DIA_Nagur_Auftrag, " Okay, agreed. " ,DIA_Nagur_Auftrag_Okay);
	Info_AddChoice(DIA_Nagur_Auftrag, " Is there any spelling? " ,DIA_Nagur_Autrag_Baltram);
	Info_AddChoice(DIA_Nagur_Auftrag, " When should I speak to Baltram? " ,DIA_Nagur_Auftrag_Wann);
	Info_AddChoice(DIA_Nagur_Outtrag, " Where are you? " ,DIA_Nagur_Outtrag_Akil);
	Info_AddChoice(DIA_Nagur_Auftrag, " What is the expected gain? " ,DIA_Nagur_Auftrag_Gewinn);
};

func void DIA_Nagur_Order_Akil()
{
	AI_Output(other,self, " DIA_Nagur_Auftrag_Akil_15_00 " );	// Where is Akila's farm?
	AI_Output(self,other, " DIA_Nagur_Auftrag_Akil_08_01 " );	// You will leave the city through the eastern gate, which is located on the market square.
	AI_Output(self,other, " DIA_Nagur_Auftrag_Akil_08_02 " );	// If you follow the road to the right, you will soon see a ladder carved into the rock.
	AI_Output(self,other, " DIA_Nagur_Auftrag_Akil_08_03 " );	// Climb up it and you'll be at the Akila farm.
};

func void DIA_Nagur_order_profit()
{
	AI_Output(other,self, " DIA_Nagur_Auftrag_Gewinn_15_00 " );	// What is the expected gain?
	AI_Output(self,other, " DIA_Nagur_Auftrag_Gewinn_08_01 " );	// Can't say for sure! But, I think, not less than four hundred coins.
};

func void DIA_Nagur_Order_Baltram()
{
	AI_Output(other,self, " DIA_Nagur_Auftrag_Baltram_15_00 " );	// Where can I find Baltram?
	AI_Output(self,other, " DIA_Nagur_Auftrag_Baltram_08_01 " );	// His stall is in the market square.
};

func void DIA_Nagur_Order_When()
{
	AI_Output(other,self, " DIA_Nagur_Auftrag_Wann_15_00 " );	// When should I talk to Baltram?
	AI_Output(self,other, " DIA_Nagur_Auftrag_Wann_08_01 " );	// You can do it right now. He should already understand that his messenger will never appear again.
};

func void DIA_Nagur_Order_Okay()
{
	AI_Output(other,self, " DIA_Nagur_Auftrag_Okay_15_00 " );	// Okay, agreed.
	AI_Output(self,other, " DIA_Nagur_Auftrag_Okay_08_01 " );	// Great! Then get down to business. But if you try to deceive me, you will meet the same fate as this messenger! Do not forget about it!
	MIS_Nagur_Bote = LOG_Running;
	Log_CreateTopic(TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Nagur,LOG_Running);
	B_LogEntry(TOPIC_Nagur, " I have to get Baltram to take me as an errand boy. Then I have to collect the package from Farmer Akil and bring it to Nagur. " );
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Success (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 5;
	condition = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent = FALSE;
	description = " I brought a package. " ;
};


func int DIA_Nagur_Success_Condition()
{
	if ((MY_Nagur_Bote == LOG_Running) && (Npc_HasItems(other,ItMy_BaltramPacket) >=  1 ) && (Nagur_Exported ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Nagur_Success_Info()
{
	AI_Output(other,self, " DIA_Nagur_Success_15_00 " );	// I brought the package.
	AI_Output(self,other, " DIA_Nagur_Success_08_01 " );	// Great! Now I need to sell it. Come tomorrow or today, closer to the night ...
	B_LogEntry(TOPIC_Nagur, " Nagur received the package. He'll pay me tomorrow or later tonight! " );
	AI_StopProcessInfos(self);
	if(B_GiveInvItems(other,self,ItMi_BaltramPaket,1))
	{
		Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();
};


instance DIA_Nagur_Deal (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 6;
	condition = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent = TRUE;
	description = " Have you already sold the goods? " ;
};

var int DAY_Nagur_Deal_permanent;

func int DIA_Nagur_Deal_Condition()
{
	if ((DIA_Nagur_Deal_permanent ==  FALSE ) && (MY_Nagur_Box == LOG_Running) && (Nagur_Delivered ==  FALSE ) && Npc_KnowsInfo(other,DIA_Nagur_Success));
	{
		return TRUE;
	};
};

func void DIA_Nagur_Deal_Info()
{
	AI_Output(other,self, " DIA_Nagur_Deal_15_00 " );	// Have you already sold the goods?

	if(B_GetDayPlus() > NagurDay)
	{
		AI_Output(self,other, " DIA_Nagur_Deal_08_01 " );	// Yes, but for a smaller amount than expected. I only received three hundred coins.
		AI_Output(self,other, " DIA_Nagur_Deal_08_02 " );	// Part of this amount went to my hosts...
		AI_Output(self,other, " DIA_Nagur_Deal_08_03 " );	// And Cardiff got his usual percentage - plus gold for finding you.
		AI_Output(self,other, " DIA_Nagur_Deal_08_04 " );	// There are two hundred and forty gold coins left. We will share them as agreed. Here is your share.
		AI_Output(self,other, " DIA_Nagur_Deal_08_05 " );	// You did a good job. I reported this to my hosts.
		AI_Output(self,other, " DIA_Nagur_Deal_08_06 " );	// I don't know what will come of this.
		B_GiveInvItems(self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS ;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP(XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE ;
		Thieves Guild_Okay = Thieves Guild_Okay +  1 ;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Nagur_Deal_08_07 " );	// Not yet. This takes time. I don't want to cheap out.
	};
};


instance DIA_Nagur_client (C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Client_Info;
	permanent = FALSE;
	description = " Who are your masters? " ;
};


func int DIA_Nagur_Auftraggeber_Condition()
{
	if ( MIS_Received_Box ==  LOG_SUCCESS )
	{
		return TRUE;
	};
};

func void DIA_Nagur_Client_Info()
{
	AI_Output(other,self, " DIA_Nagur_Auftraggeber_15_00 " );	// Who are your masters?
	AI_Output(self,other, " DIA_Nagur_Auftraggeber_08_01 " );	// Do you really think that I'll just take it and tell you?
};


instance DIA_Nagur_Phase (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Phase_Condition;
	information = DIA_Nagur_Phase_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Phase_Condition();
{
	if ( Npc_KnowsInfo ( other , DIA_Nagur_Extracter ) && Npc_IsInState ( self , ZS_Talk ) && ( Knows_SecretSign ==  FALSE ) && ( NagurHack ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Nagur_Fazit_Info()
{
	AI_Output(self,other, " DIA_Nagur_Fazit_08_00 " );	// The case went well, but I'm not talking about my masters. So you can relax.
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Knast (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Close_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Crapped_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( Npc_GetDistToWP ( self , " NW_CITY_HABOR_KASERN_NAGUR " ) <=  1000 ) && ( Nagur_Export ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Nagur_Knast_Info()
{
	AI_Output(self,other, " DIA_Nagur_Knast_08_00 " );	// You betrayed me! That was a big mistake - now get out!
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Sign (C_Info) .
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent = FALSE;
	description = " (Show thief alert) " ;
};


func int DIA_Nagur_Sign_Condition();
{
	if ((MIS_Nagur_Bote ==  LOG_SUCCESS ) && (Knows_SecretSign ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other, " DIA_Nagur_Sign_08_00 " );	// So you did it! Now you know who my masters are.
	AI_Output(self,other, " DIA_Nagur_Sign_08_01 " );	// Don't forget what Cassia tells you - we don't care who you are. You are one of us and that's all that matters.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	AI_StopProcessInfos(self);
};
