

instance DIA_VLK_6134_VALERAN_EXIT(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 999;
	condition = dia_vlk_6134_valeran_exit_condition;
	information = dia_vlk_6134_valeran_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6134_valeran_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6134_valeran_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_VLK_6134_VALERAN_HALLO (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hallo_condition;
	information = dia_vlk_6134_valeran_hallo_info;
	permanent = FALSE;
	description = " Hi. Who are you? " ;
};


func int dia_vlk_6134_valeran_hallo_condition()
{
	if ((Fernando_ImKnast ==  FALSE ) &&  ! Npc_KnowsInfo(hero,dia_vlk_6134_valeran_helloafter))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hallo_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hallo_01_00 " );	// Hello. Who are you?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hallo_01_01 " );	// Greetings, stranger. My name is Valeran.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hallo_01_02 " );	// What are you doing?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hallo_01_03 " );	// I work as a manager for the merchant Fernando. I help him run his business.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hallo_01_04 " );	// This is a very difficult and responsible job, which is why Fernando hired me.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hallo_01_05 " );	// And how do you like your work?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hallo_01_06 " );	// I have nothing to complain about - they pay good money here, if that's what you mean.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hallo_01_07 " );	// And Fernando himself treats me well.
};


instances DIA_VLK_6134_VALERAN_HALLOAFTER (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_halloafter_condition;
	information = dia_vlk_6134_valeran_halloafter_info;
	permanent = FALSE;
	description = " Hi. Who are you? " ;
};


func int dia_vlk_6134_valeran_halloafter_condition()
{
	if ((Fernando_ImKnast ==  TRUE ) &&  ! Npc_KnowsInfo(hero, dia_vlk_6134_worth_hello))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_halloafter_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hallo_01_00 " );	// Hello. Who are you?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hallo_01_01 " );	// Greetings, stranger. My name is Valeran.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_HalloAfter_01_02 " );	// Your face looks familiar to me. Have I met you anywhere before?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_HalloAfter_01_03 " );	// Well, maybe we met in the upper quarter of Khorinis?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_HalloAfter_01_04 " );	// I worked there as a manager for a merchant named Fernando.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_HalloAfter_01_05 " );	// Yes, I know Fernando. He seems to have been in some legal trouble lately.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_HalloAfter_01_06 " );	// Yes, he was recently arrested by the city militia for selling weapons to bandits.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_HalloAfter_01_07 " );	// I never would have thought that he would do such a thing. That surprised me greatly.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_HalloAfter_01_08 " );	// What happened to you?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_HalloAfter_01_09 " );	// As for me, because of all this, I was left without a job.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_HalloAfter_01_10 " );	// Now I'm sitting here and waiting... for what, I'm not sure.
	CanHireValeran = TRUE;
};


instances DIA_VLK_6134_VALERAN_CANTRADENO (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_cantradeno_condition;
	information = dia_vlk_6134_valeran_cantradeno_info;
	permanent = FALSE;
	description = " Do you sell anything? " ;
};


func int dia_vlk_6134_valeran_cantradeno_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_vlk_6134_valeran_halloafter ) && ( Fernando_ImKnast ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_cantradeno_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_CanTradeNo_01_00 " );	// Do you sell anything?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_CanTradeNo_01_01 " );	// No, not anymore.
	VALERANCANTRADE = TRUE;
};


instances DIA_VLK_6134_VALERAN_CANTRADE (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_cantrade_condition;
	information = dia_vlk_6134_valeran_cantrade_info;
	permanent = FALSE;
	description = " Do you sell anything? " ;
};


func int dia_vlk_6134_valeran_cantrade_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_vlk_6134_valeran_hello ) && ( Fernando_ImKnast ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_cantrade_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_CanTrade_01_00 " );	// Do you sell anything?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_CanTrade_01_01 " );	// You can buy everything you need from me and at a good price!
	VALERANCANTRADE = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Valeran sells various goods in the upper quarter of the city. " );
};


instances DIA_VLK_6134_VALERAN_WAREZ (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 700;
	condition = dia_vlk_6134_valeran_warez_condition;
	information = dia_vlk_6134_valeran_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me what you've got. " ;
};


func int dia_vlk_6134_valeran_warez_condition()
{
	if(((VALERANHIRED == TRUE) && (VALERANCANTRADE == TRUE)) || ((Fernando_ImKnast == FALSE) && (VALERANCANTRADE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_warez_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_VLK_6134_Valeran_Warez_01_00 " );	// Show me what you've got.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Warez_01_01 " );	// Choose.
	B_GiveTradeInv(self);
};


instance DIA_VLK_6134_VALERAN_WHATYOUDO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_whatyoudo_condition;
	information = dia_vlk_6134_valeran_whatyoudo_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int dia_vlk_6134_valeran_whatyoudo_condition()
{
	if ((Fernando_ImKnast ==  TRUE ) && Npc_KnowsInfo(hero, dia_vlk_6134_worth_hello))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_whatyoudo_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_WhatYouDo_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_WhatYouDo_01_01 " );	// Why, can't you see? Waiting for someone to give me a job.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_WhatYouDo_01_02 " );	// Now that Fernando has been arrested, I'm left with nothing to do.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_WhatYouDo_01_04 " );	// Why didn't you try to get a job in the city?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_WhatYouDo_01_05 " );	// Who will hire me? Those dirty deeds of Fernando's have also affected my reputation.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_WhatYouDo_01_07 " );	// And in our business, that is very important.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_WhatYouDo_01_08 " );	// Got it. And how is the progress?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_WhatYouDo_01_09 " );	// As you can see, there's not much to brag about.
	CanHireValeran = TRUE;
};


instances DIA_VLK_6134_VALERAN_PERM (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_perm_condition;
	information = dia_vlk_6134_valeran_perm_info;
	permanent = TRUE;
	description = " Anything to please? " ;
};


func int dia_vlk_6134_valeran_perm_condition()
{
	if (( FINDTHREEPERSONS  ==  FALSE ) && ( VALERANCRUITEDDT  ==  FALSE ) && (Fernando_ImKnast ==  TRUE ) && (Npc_KnowsInfo(hero,dia_vlk_6134_valeran_whatyoudo ) ||
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_perm_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Perm_01_00 " );	// Anything happening now?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Perm_01_01 " );	// I'm afraid there's nothing going on - I'm still doing nothing. I sit here with my thumb up my ass all day.
};


instance DIA_VLK_6134_VALERAN_HIRE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hire_condition;
	information = dia_vlk_6134_valeran_hire_info;
	permanent = FALSE;
	description = " I found you a job. " ;
};


func int dia_vlk_6134_valeran_hire_condition()
{
	if (( MY_TRADEHELPER  == LOG_Running) && (Fernando_ImKnast ==  TRUE ) && (Npc_KnowsInfo(hero,dia_vlk_6134_valeran_whatyoudo ) ||
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hire_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hire_01_00 " );	// I got you a job.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_01 " );	// (with interest) Really? And what is it?
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hire_01_03 " );	// One large merchant from the upper quarter of the city is looking for a man to take the place of his assistant.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hire_01_04 " );	// And the job is to run his errands and help him run his business.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_05 " );	// Who is this merchant?
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hire_01_06 " );	// His name is Luthero. Are you familiar with this name?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_07 " );	// Luthero? Of course... (laughs) Who doesn't know him.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_08 " );	// But wait... he had an assistant.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_09 " );	// His name was Benchel, if I'm not mistaken.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hire_01_10 " );	// You're right. But he doesn't work for Luthero anymore.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_16 " );	// Luthero once offered to work for him, but I refused. Moron!
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_17 " );	// True, who could then assume that Fernando was not clean on hand.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_19 " );	// And now you come here and offer me to work for Luthero!
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Hire_01_20 " );	// So do you agree?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_21 " );	// Of course I agree! Or do you think I have a choice?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Hire_01_22 " );	// Plus, I know Luthero well - he's an honest trader and it's an honor to work for him.
	B_LogEntry( TOPIC_TRADEHELPER , " I talked to Waleran, Fernando's former manager, and he agreed to work for Luthero. It looks like I can't find a better person to be an assistant. " );
	VALERANAGREE = TRUE;
};


instance DIA_VLK_6134_VALERAN_HIREOK(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hireok_condition;
	information = dia_vlk_6134_valeran_hireok_info;
	permanent = FALSE;
	description = " Let's go Lutero. " ;
};


func int dia_vlk_6134_valeran_hireok_condition()
{
	if (( VALERANAGREE  ==  TRUE ) && ( MY_TRADEHELPER  == LOG_Running) && ( FINDPERSONONONE  ==  FALSE ) && ( FINDTHREEPERSONS  ==  FALSE ) && ( FINDTHREEPERSONS  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hireok_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_HireOk_01_00 " );	// We go to Luthero.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_HireOk_01_01 " );	// I think you are the person he needs.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_HireOk_01_02 " );	// As you say. Went.
	B_LogEntry( TOPIC_TRADEHELPER , " I chose Valeran. I think Luthero should like him. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	FINDPERSONTHREE = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6134_VALERAN_THANKS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_thanks_condition;
	information = dia_vlk_6134_valeran_thanks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6134_valeran_thanks_condition()
{
	if(VALERANHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_thanks_info()
{
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Thanks_01_00 " );	// Thanks for helping me!
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Thanks_01_01 " );	// I'm back in business, and it's only thanks to you. Now I am in your debt!
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Thanks_01_02 " );	// It wasn't that hard.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Thanks_01_05 " );	// I want to thank you. Here, take this thing.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Thanks_01_06 " );	// You're unlikely to find it at other vendors. That's great rarity.
	B_GiveInvItems(self,other,itwr_kampfkunst, 1 );
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Thanks_01_07 " );	// And for sure it will be useful to you.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Thanks_01_10 " );	// By the way, now I can sell you various goods again.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Thanks_01_11 " );	// If you need anything, feel free to contact me.
	AI_Output(other,self, " DIA_VLK_6134_Valeran_Thanks_01_12 " );	// Okay, I'll keep that in mind.
	AI_Output(self,other, " DIA_VLK_6134_Valeran_Thanks_01_13 " );	// See you then. Bye!
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6134_VALERAN_NEWLIFE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_newlife_condition;
	information = dia_vlk_6134_valeran_newlife_info;
	permanent = TRUE;
	description = " How do you like your new job? " ;
};


func int dia_vlk_6134_valeran_newlife_condition()
{
	if(VALERANHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_newlife_info()
{
	AI_Output(other,self, " DIA_VLK_6134_Valeran_NewLife_01_00 " );	// How do you like your new job?
	AI_Output(self,other, " DIA_VLK_6134_Valeran_NewLife_01_01 " );	// Everything is just great! Thanks for asking.
};


instances DIA_VLK_6134_VALERAN_PICKPOCKET (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 900;
	condition = dia_vlk_6134_valeran_pickpocket_condition;
	information = dia_vlk_6134_valeran_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6134_valeran_pickpocket_condition()
{
	return  C_Robbery ( 100 , 150 );
};

func void dia_vlk_6134_valeran_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
	Info_AddChoice(dia_vlk_6134_valeran_pickpocket,Dialog_Back,dia_vlk_6134_valeran_pickpocket_back);
	Info_AddChoice(dia_vlk_6134_valeran_pickpocket, DIALOG_PICKPOCKET ,dia_vlk_6134_valeran_pickpocket_doit);
};

func void dia_vlk_6134_valeran_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
};

func void dia_vlk_6134_valeran_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
};

instance DIA_VLK_6134_VALERAN_RECRFAIL(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_recrfail_condition;
	information = dia_vlk_6134_valeran_recrfail_info;
	permanent = FALSE;
	description = " How are you? " ;
};

func int dia_vlk_6134_valeran_recrfail_condition()
{
	if((VALERANHIRED == TRUE) && (EROLRECRUITEDDT == FALSE) && (MIS_PPL_FOR_TOWER == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_recrfail_info()
{
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrFail_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrFail_01_01 " );	// Just great! I am very grateful to you for finding me a job.
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrFail_15_02 " );	// Then I'm afraid it would be silly to ask you if you want to change it.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrFail_01_03 " );	// Change? Oh no. Not now that I'm back in business.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrFail_01_04 " );	// Luthero pays well, it's interesting to work for him, and if I change employers just like that, they will quickly lose respect for me.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrFail_01_05 " );	// So whatever offer you come to me with, I'm sorry, but I'll have to turn it down.
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrFail_15_06 " );	// Good. In that case, good luck to you.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrFail_01_07 " );	// Thank you! For everything you've done for me.
};

//--------------------CEO----------------------------------------------

instance DIA_VLK_6134_VALERAN_RECRDT (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_recrdt_condition;
	information = dia_vlk_6134_valeran_recrdt_info;
	permanent = FALSE;
	description = " How are you with your work? " ;
};

func int dia_vlk_6134_valeran_recrdt_condition()
{
	if ((CanHireValied ==  TRUE ) && (PasswordSet ==  TRUE ) && ( VALIDED  ==  FALSE ) && ( EROLRECRUITEDT  ==  FALSE ) && ( MY_PPL_FOR_TOWER  == LOG_Running ) && ((Npc_KnowsInfo(hero,dia_vlk_6134_valued TRhello) =  . = | (Npc_KnowsInfo(hero, DIA_VLK_6134_VALERAN_HALLOAFTER ) ==  TRUE ))) |
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_recrdt_info()
{
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_01_00 " );	// How are you doing with work? Still not found?
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_01_01 " );	// No. It seems that no one needs my services. I'm already thinking of becoming a peasant on some farm.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_01_02 " );	// And why did I just spend a few years studying trading and finance?
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_01_03 " );	// I was the best! But the labor market is overcrowded, and now: for a week I have been sitting without a job, and only a couple of coins remained in my pocket.
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_01_04 " );	// What would you say if I offered you a job?
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_01_05 " );	// (Lively) Work? Where? Are you kidding?
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_01_06 " );	// Nothing. I need a manager for my new home to take care of the house in my absence.
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_01_07 " );	// This is the old tower next to Onar's farm where I want to set up a small camp. Housing and food at my expense.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_01_08 " );	// Oh, Innos, I must be dreaming! Believe me, you will not find a person anywhere who knows how to deal with money matters better than me!
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_01_09 " );	// I agree. When should I start?
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_01_10 " );	// You can leave right now. And yes, what payment are you interested in?
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_01_11 " );	// (Thoughtfully) Fernando paid me eighty gold a day, but for you I'm ready to work for fifty!
	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt, " Fifty gold pieces? Sounds reasonable. You're accepted. " ,dia_vlk_6134_valeran_recrdt_yes);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(dia_vlk_6134_valeran_recrdt, " I'm afraid that's too much. " ,dia_vlk_6134_valeran_recrdt_no);
	};
};

func void dia_vlk_6134_valeran_recrdt_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_yes_15_00 " );	// You're accepted. See you at the tower. If you are asked for a password at the entrance, it will be 'Dragon Treasures'.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_yes_01_01 " );	// Trust me, you won't regret your decision!
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Valeran agreed to work as my steward. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	VALERANRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_vlk_6134_valeran_recrdt_no()
{
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_no_15_00 " );	// I'm afraid that's too much.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_no_01_01 " );	// (Desperate) Wait! And thirty-five gold pieces? I'm ready to work for thirty-five!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt, " Okay, you're accepted. " ,dia_vlk_6134_valeran_recrdt_no_yes);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt, " Too much. I'm afraid I can't afford your services. " ,dia_vlk_6134_valeran_recrdt_no_no);
};

func void dia_vlk_6134_valeran_recrdt_no_yes()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_no_yes_15_00 " );	// Okay, you're accepted. See you at the tower. If you are asked for a password at the entrance, it will be 'Dragon Treasures'.
	AI_Output(self,other, " DIA_VLK_6134_VALERAN_RecrDT_no_yes_01_01 " );	// Thank you. I'll be on my way immediately!
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Valeran agreed to work as my steward. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	VALERANRECRUITEDDT = TRUE;
	VALERANBONUS = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_vlk_6134_valeran_recrdt_no_no()
{
	AI_Output(other,self, " DIA_VLK_6134_VALERAN_RecrDT_no_no_15_00 " );	// Too many. I'm afraid I can't afford your services.
	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
};

instance DIA_VALERAN_FIRSTCEO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_condition;
	information = dia_valeran_firstceo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_valeran_firstceo_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_info()
{
	AI_Output(self,other, " DIA_Valeran_FirstCEO_10_00 " );	// Nice tower you have!
	AI_Output(self,other, " DIA_Valeran_FirstCEO_10_01 " );	// It's messy here, but this place has great potential.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_10_02 " );	// You mentioned that you want to set up some kind of camp here. Am I remembering correctly?
	AI_Output(other,self, " DIA_Valeran_FirstCEO_15_03 " );	// Yes. Lord Hagen wants me to put things in order in this area, it was on these terms that the tower was transferred to me.
	AI_Output(other,self, " DIA_Valeran_FirstCEO_15_04 " );	// Under the same conditions, I agreed with Onar so that he would not interfere with my living here.
	AI_Output(other,self, " DIA_Valeran_FirstCEO_15_05 " );	// But since I can't support and defend this tower alone, I'll need people. With the first two you, I think, have already met.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_10_06 " );	// I like your plans. It will be interesting to work on revitalizing this place.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_10_07 " );	// So, in this case, first of all, you need to leave me some money, from which I could make the necessary payments.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_08");	//Сколько?
	AI_Output(self,other, " DIA_Valeran_FirstCEO_10_09 " );	// I think five thousand gold will be enough.
	CEONEEDSFIRSTMONEY = TRUE;
};


instance DIA_VALERAN_FIRSTCEO_MONEYLATE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_moneylate_condition;
	information = dia_valeran_firstceo_moneylate_info;
	permanent = FALSE;
	description = " Here are five thousand gold coins. " ;
};


func int dia_valeran_firstceo_moneylate_condition()
{
	if((CEONEEDSFIRSTMONEY == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_moneylate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Valeran_FirstCEO_MoneyLate_15_00 " );	// Here are five thousand gold coins.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other, " DIA_Valeran_FirstCEO_MoneyLate_10_01 " );	// Great! Then we temporarily sorted out the money, and I can immediately start doing business.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_MoneyLate_10_02 " );	// However, besides that, I and the rest of the people need something to eat.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_MoneyLate_10_03 " );	// I think you should leave us at least fifty pieces of grilled meat, twenty-five fish, and ten loaves of bread to begin with.
	CEONEEDSFIRSTFOOD = TRUE;
	DT_BUDGET = 5000;
	DT_BUDGETACTIVE = TRUE;
	EVERYDAYDTMONEY = Wld_GetDay();
	CEONEEDSFIRSTMONEY = FALSE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " The people I live in need a starting supply of food, to be exact, fifty pieces of roasted meat, twenty-five fish and ten loaves of bread. " );
};

instance DIA_VALERAN_FIRSTCEO_FOODLATE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_foodlate_condition;
	information = dia_valeran_firstceo_foodlate_info;
	permanent = FALSE;
	description = " Here's all the food you need. " ;
};

func int dia_valeran_firstceo_foodlate_condition()
{
	if((CEONEEDSFIRSTFOOD == TRUE) && (Npc_HasItems(other,ItFo_Bread) >= 10) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Fish) >= 25) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_foodlate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Valeran_FirstCEO_FoodLate_15_00 " );	// Here's all the food you need.
	B_GiveInvItems(other,self,ItFoMutton,50);
	Npc_RemoveInvItems(self,ItFoMutton,50);
	B_GiveInvItems(other,self,ItFo_Fish,25);
	Npc_RemoveInvItems(self,ItFo_Fish,25);
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_01 " );	// Excellent! Now I have enough money and food supplies to enable me to run the household without difficulty.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_02 " );	// But this is only enough for a while. You don't want to be ruined by the contents of this tower, do you?
	AI_Output(other,self, " DIA_Valeran_FirstCEO_FoodLate_15_03 " );	// Of course not. What do I need to do to avoid this?
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_04 " );	// Find people who will agree to work for you.  	
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_05 " );	// For example, find hunters who will provide meat for our supplies.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_06 " );	// There's also a mine nearby, maybe there's still some ore left in it. It wouldn't hurt to check it out.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_07 " );	// In a word, think. You travel more than I do and it's easier for you to find people willing to join you.
	AI_Output(other,self, " DIA_Valeran_FirstCEO_FoodLate_15_08 " );	// Okay... I think I have a few people in mind.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_09 " );	// Good luck with your search. And yes, remember that the organization of the supply of food and money is on you, and that most people eat three meals a day.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_10 " );	// I can't do this, because it requires a long excommunication from the tower, and then I will no longer be able to fulfill my direct duties - to keep housekeeping and order here.
	AI_Output(self,other, " DIA_Valeran_FirstCEO_FoodLate_10_11 " );	// You can't let the tower run out of money or food.
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Now that I have a manager, I can think about expanding and finding people willing to work for me. However, I must remember that they will need to pay money and provide three meals a day. " );
	DT_FOODSTOCK = 120;
	DT_FOODSTOCKACTIVE = TRUE;
	EVERYDAYDTFOOD = Wld_GetDay();
	CEONEEDSFIRSTFOOD = FALSE;
	HURRAYICANHIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireCook(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireCook_condition;
	information = DIA_VALERAN_CanHireCook_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireCook_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanHireCook == TRUE) && (EddaIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireCook_info()
{
	AI_Output(self,other, " DIA_VALERAN_CanHireCook_10_00 " );	// The first food deliveries have begun in the camp. This is good news!
	AI_Output(self,other, " DIA_VALERAN_CanHireCook_10_01 " );	// However, the question arises regarding its storage. After all, without proper care, part of the food will simply go bad.
	AI_Output(other,self, " DIA_VALERAN_CanHireCook_10_02 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_VALERAN_CanHireCook_10_03 " );	// In my opinion, the camp would benefit from a good cook who could take this problem into her own hands.
	AI_Output(self,other, " DIA_VALERAN_CanHireCook_10_04 " );	// Think about it! It is very important.
	AI_Output(other,self, " DIA_VALERAN_CanHireCook_10_05 " );	// Okay, I'll think of something.
	EddaNeed = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " The camp needs a chef to handle food storage issues. I wonder who I should talk to? " );
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireSmith(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireSmith_condition;
	information = DIA_VALERAN_CanHireSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireSmith_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanHireSmith == TRUE) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireSmith_info()
{
	AI_Output(self,other, " DIA_VALERAN_CanHireSmith_10_00 " );	// Mining has begun in the camp.
	AI_Output(self,other, " DIA_VALERAN_CanHireSmith_10_01 " );	// It's time to think about getting a good blacksmith. Moreover, as you can see, we have the forge itself.
	AI_Output(other,self, " DIA_VALERAN_CanHireSmith_10_02 " );	// And where can I find it for you? There are not so many good blacksmiths on this island.
	AI_Output(self,other, " DIA_VALERAN_CanHireSmith_10_03 " );	// Agree. But if you want your camp to really grow and get stronger, then you have to find it.
	AI_Output(self,other, " DIA_VALERAN_CanHireSmith_10_04 " );	// Only a blacksmith can repair weapons, patch up armor, make something for sale from the ore we mine.
	AI_Output(self,other, " DIA_VALERAN_CanHireSmith_10_05 " );	// So you'd better flex your brain and think about who could take this place.
	AI_Output(other,self, " DIA_VALERAN_CanHireSmith_10_06 " );	// Okay, I'll think of something.
	CarlNeed = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , "The camp needs a blacksmith. Without it, it can't really progress. " );
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireHealer(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireHealer_condition;
	information = DIA_VALERAN_CanHireHealer_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireHealer_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE) && ((WOLFRECRUITEDDT == TRUE) || (ALRIKRECRUITEDDT == TRUE) || (GAYVERNRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireHealer_info()
{
	AI_Output(self,other, " DIA_VALERAN_CanHireHealer_10_00 " );	// In recent days, guards have increased in the camp.
	AI_Output(self,other, " DIA_VALERAN_CanHireHealer_10_01 " );	// That's a good thing, as we've recently been attacked by several ravenous creatures.
	AI_Output(self,other, " DIA_VALERAN_CanHireHealer_10_02 " );	// One of the guards took a fair amount of damage in that fight, but fortunately for him, the wound was not too serious.
	AI_Output(self,other, " DIA_VALERAN_CanHireHealer_10_03 " );	// However, if this continues, we will soon lose all the people here.
	AI_Output(other,self, " DIA_VALERAN_CanHireHealer_10_04 " );	// What are you implying?
	AI_Output(self,other, " DIA_VALERAN_CanHireHealer_10_05 " );	// We need a healer, and best of all, an alchemist who can brew healing elixirs for such cases.
	AI_Output(other,self, " DIA_VALERAN_CanHireHealer_10_06 " );	// And where can I find it for you?
	AI_Output(self,other, " DIA_VALERAN_CanHireHealer_10_07 " );	// I understand that this is not an easy task. But the fate of the people living in the camp depends on her decision.
	AI_Output(self,other, " DIA_VALERAN_CanHireHealer_10_08 " );	// So you'll have to do something about it.
	AI_Output(other,self, " DIA_VALERAN_CanHireHealer_10_09 " );	// Okay, I'll look for a healer for us.
	SagittaNeed = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , "The camp needs a healer. Without this, the people won't last long. " );
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanProduceSmith (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanProduceSmith_condition;
	information = DIA_VALERAN_CanProduceSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanProduceSmith_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DAY_VALERAN_CanProduceSmith_info()
{
	AI_Output(self,other, " DIA_VALERAN_CanProduceSmith_10_00 " );	// Carl started working at the forge. I'm glad you were able to get him to join us.
	AI_Output(self,other, " DIA_VALERAN_CanProduceSmith_10_01 " );	// But now it's worth thinking about the main thing.
	AI_Output(other,self, " DIA_VALERAN_CanProduceSmith_10_02 " );	// What do you mean?
	AI_Output(self,other, " DIA_VALERAN_CanProduceSmith_10_03 " );	// The forge must generate income, otherwise it will be of little use.
	AI_Output(other,self, " DIA_VALERAN_CanProduceSmith_10_04 " );	// Good. What will be the proposals?
	AI_Output(self,other, " DIA_VALERAN_CanProduceSmith_10_05 " );	// We could use our ore reserves to further process it into steel billets.
	AI_Output(self,other, " DIA_VALERAN_CanProduceSmith_10_06 " );	// It's a pretty hot commodity these days, and selling it will allow us to cut down on the camp's cash costs significantly.
	AI_Output(other,self, " DIA_VALERAN_CanProduceSmith_10_07 " );	// Sounds good.
	AI_Output(self,other, " DIA_VALERAN_CanProduceSmith_10_08 " );	// I like it too! So think about it.
	CanSellOre = TRUE;
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Valeran suggested using the ore stock to make steel billets that could later be sold. This would provide the camp with additional income. " );
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanProduceWeapon (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanProduceWeapon_condition;
	information = DIA_VALERAN_CanProduceWeapon_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanProduceWeapon_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (WOLFRECRUITEDDT == TRUE) && (ALRIKRECRUITEDDT == TRUE) && (GAYVERNRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanProduceWeapon_info()
{
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_01 " );	// There have been more people in the camp lately. I think we should better arm our guards.
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_02 " );	// Moreover, times are now turbulent, predatory creatures roam around.
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_03 " );	// Some of our guys even saw a real orc nearby!
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_04 " );	// If we don't take care of our safety, this place will become easy prey for bandits or for the same orcs.
	AI_Output(other,self, " DIA_VALERAN_CanProduceWeapon_10_05 " );	// What can we do?
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_06 " );	// Carl will provide us with weapons. Of course, he is not a master blacksmith, but he can forge a solid sword.
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_07 " );	// But our fighters need better armor. Those that are now on them will not save even from the bite of an ordinary blood hornet.
	AI_Output(other,self, " DIA_VALERAN_CanProduceWeapon_10_08 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_13 " );	// Naturally, it would be better if we could produce our own armor. But for this we need drawings and diagrams for their manufacture.
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_14 " );	// I'm sure you've been to different places, and you've probably come across something similar before.
	AI_Output(self,other, " DIA_VALERAN_CanProduceWeapon_10_15 " );	// If anything, bring them to me. And I'll make sure our boys don't walk around in rags anymore.
	CanGiveArmor = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CrawlerArmor(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CrawlerArmor_condition;
	information = DIA_VALERAN_CrawlerArmor_info;
	permanent = FALSE;
	description = " I brought the armor blueprints. " ;
};

func int DIA_VALERAN_CrawlerArmor_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanGiveArmor == TRUE) && (GiveNewArmorDocs == FALSE) && (Npc_HasItems(other,ItWr_ArmorDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CrawlerArmor_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_VALERAN_CrawlerArmor_15_00 " );	// I brought the blueprints for the armor.
	B_GiveInvItems(other,self,ItWr_ArmorDocs,1);
	Npc_RemoveInvItems(self,ItWr_ArmorDocs,1);
	AI_Output(self,other, " DIA_VALERAN_CrawlerArmor_15_01 " );	// Okay, give them here. I'll give them to Carl to deal with them.
	AI_Output(self,other, " DIA_VALERAN_CrawlerArmor_15_02 " );	// If it's really possible to make armor from them, then in a couple of days all our guys will already be flaunting them.
	AI_Output(other,self, " DIA_VALERAN_CrawlerArmor_15_03 " );	// I really hope so.
	GiveNewArmorDocs = Wld_GetDay();
	CanGiveArmorDocs = TRUE;
};

instance DIA_VALERAN_ArmorDone (C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_ArmorDone_condition;
	information = DIA_VALERAN_ArmorDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_ArmorDone_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanGiveOtherArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_ArmorDone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_VALERAN_ArmorDone_15_00 " );	// Carl finished making the armor, and I immediately gave it to our guys.
	AI_Output(self,other, " DIA_VALERAN_ArmorDone_15_01 " );	// Now you don't have to worry about their equipment. And the armor itself looks very strong.
	AI_Output(self,other, " DIA_VALERAN_ArmorDone_15_02 " );	// Here, take this. I left this copy especially for you. They might come in handy for you too.
	B_GiveInvItems(self,other,ItAr_OldSteelArmor,1);
	AI_Output(other,self, " DIA_VALERAN_ArmorDone_15_03 " );	// Thank you.
};

instance DIA_VALERAN_BUSINESSACTION(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 21;
	condition = dia_valeran_businessaction_condition;
	information = dia_valeran_businessaction_info;
	permanent = TRUE;
	description = " I would like to do something... " ;
};

func int dia_valeran_businessaction_condition()
{
	if((HURRAYICANHIRE == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_businessaction_info()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_15_00 " );	// I'd like to do something.
	AI_Output(self,other, " DIA_Valeran_BusinessAction_10_01 " );	// What exactly?	
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction, " Take money from camp treasury. " ,dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction, " Add money to camp coffers. " ,dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction, " Sell food stocks from camp storage. " ,dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction, " Leave food supplies in the camp storage. " ,dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction, " Collect magic ore from camp warehouse. " ,DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction, " Take iron ore from camp storage. " ,DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction, " Start production of steel billets. " ,DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction, " Stop production of steel billets. " ,DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_oretake()
{
	AI_Output(other,self, " dia_valeran_businessaction_oretake_15_00 " );	// I'd like to pick up the magic ore from the warehouse in the camp.

	if(DT_BUDGET_ORE == FALSE)
	{
		AI_Output(self,other, " dia_valeran_businessaction_oretake_10_01 " );	// Unfortunately, we don't have extra ore reserves right now.
	}
	else
	{
		AI_Output(self,other, " dia_valeran_businessaction_oretake_10_02 " );	// Good. Here's all the magic ore we've got!
		B_GiveInvItems(self,other,ItMi_Nugget,DT_BUDGET_ORE);
		DT_BUDGET_ORE = 0;
	};

	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction, " Take money from camp treasury. " ,dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction, " Add money to camp coffers. " ,dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction, " Sell food stocks from camp storage. " ,dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction, " Leave food supplies in the camp storage. " ,dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction, " Collect magic ore from camp warehouse. " ,DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction, " Take iron ore from camp storage. " ,DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction, " Start production of steel billets. " ,DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction, " Stop production of steel billets. " ,DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_irontake()
{
	AI_Output(other,self, " dia_valeran_businessaction_irontake_15_00 " );	// I'd like to pick up the iron ore from the warehouse in the camp.

	if(DT_BUDGET_IRON == FALSE)
	{
		AI_Output(self,other, " dia_valeran_businessaction_irontake_10_01 " );	// Unfortunately, we don't have extra ore reserves right now.
	}
	else
	{
		AI_Output(self,other, " dia_valeran_businessaction_irontake_10_02 " );	// Good. Here's all the iron ore we've got!
		B_GiveInvItems(self,other,ItMi_SNugget,DT_BUDGET_IRON);
		DT_BUDGET_IRON = 0;
	};

	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction, " Take money from camp treasury. " ,dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction, " Add money to camp coffers. " ,dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction, " Sell food stocks from camp storage. " ,dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction, " Leave food supplies in the camp storage. " ,dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction, " Collect magic ore from camp warehouse. " ,DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction, " Take iron ore from camp storage. " ,DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction, " Start production of steel billets. " ,DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction, " Stop production of steel billets. " ,DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_produce_on()
{
	DoSellOre = TRUE;
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction, " Take money from camp treasury. " ,dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction, " Add money to camp coffers. " ,dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction, " Sell food stocks from camp storage. " ,dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction, " Leave food supplies in the camp storage. " ,dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction, " Collect magic ore from camp warehouse. " ,DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction, " Take iron ore from camp storage. " ,DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction, " Start production of steel billets. " ,DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction, " Stop production of steel billets. " ,DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_produce_off()
{
	DoSellOre = FALSE;
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction, " Take money from camp treasury. " ,dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction, " Add money to camp coffers. " ,dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction, " Sell food stocks from camp storage. " ,dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction, " Leave food supplies in the camp storage. " ,dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction, " Collect magic ore from camp warehouse. " ,DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction, " Take iron ore from camp storage. " ,DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction, " Start production of steel billets. " ,DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction, " Stop production of steel billets. " ,DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_back()
{
	Info_ClearChoices(dia_valeran_businessaction);
};

func void dia_valeran_businessaction_budgetgive()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_BudgetGive_15_00 " );	// I'd like to contribute money to the camp coffers.
	AI_Output(self,other, " DIA_Valeran_BusinessAction_BudgetGive_10_01 " );	// What amount are we talking about?
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Five hundred gold coins. " ,dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifteen thousand gold coins. " ,dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two and a half thousand gold coins. " ,dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_small()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_BudgetGive_Small_15_00 " );	// Five hundred gold coins.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET + 500;
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Five hundred gold coins. " ,dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifteen thousand gold coins. " ,dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two and a half thousand gold coins. " ,dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_medium()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_BudgetGive_Medium_15_00 " );	// One and a half thousand gold coins.
	B_GiveInvItems(other,self,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET + 1500;
	Npc_RemoveInvItems(self,ItMi_Gold,1500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Five hundred gold coins. " ,dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifteen thousand gold coins. " ,dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two and a half thousand gold coins. " ,dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_huge()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_BudgetGive_Huge_15_00 " );	// Two and a half thousand gold coins.
	B_GiveInvItems(other,self,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET + 2500;
	Npc_RemoveInvItems(self,ItMi_Gold,2500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Five hundred gold coins. " ,dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifteen thousand gold coins. " ,dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two and a half thousand gold coins. " ,dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_BudgetTake_15_00 " );	// I'd like to take money from the camp coffers.

	if(DT_BUDGET <= 5000)
	{
		AI_Output(self,other, " DIA_Valeran_BusinessAction_BudgetTake_10_01 " );	// Unfortunately, I can't give you the money right now, as I only have the minimum funds necessary to keep the camp running smoothly.
		Info_ClearChoices(dia_valeran_businessaction);
	}
	else
	{
		AI_Output(self,other, " DIA_Valeran_BusinessAction_BudgetTake_10_02 " );	// How many exactly?
		Info_ClearChoices(dia_valeran_businessaction);

		if(DT_BUDGET > 5000)
		{
			Info_AddChoice(dia_valeran_businessaction, " Five hundred gold coins. " ,dia_valeran_businessaction_budgettake_small);
		};
		if(DT_BUDGET >= 6000)
		{
			Info_AddChoice(dia_valeran_businessaction, " Fifteen thousand gold coins. " ,dia_valeran_businessaction_budgettake_medium);
		};
		if(DT_BUDGET >= 7000)
		{
			Info_AddChoice(dia_valeran_businessaction, " Two and a half thousand gold coins. " ,dia_valeran_businessaction_budgettake_huge);
		};

		Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	};
};

func void dia_valeran_businessaction_budgettake_small()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_BudgetTake_Small_15_00 " );	// Five hundred gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET - 500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Five hundred gold coins. " ,dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifteen thousand gold coins. " ,dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two and a half thousand gold coins. " ,dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake_medium()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_BudgetTake_Medium_15_00 " );	// One and a half thousand gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET - 1500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Five hundred gold coins. " ,dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifteen thousand gold coins. " ,dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two and a half thousand gold coins. " ,dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self, " DIA_Valeran_BusinessAction_BudgetTake_Huge_15_00 " );	// Two and a half thousand gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET - 2500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Five hundred gold coins. " ,dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifteen thousand gold coins. " ,dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two and a half thousand gold coins. " ,dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodGive_15_00 " );	// I'd like to leave food supplies in the warehouse at the camp.
	AI_Output(self,other, " DIA_Valeran_BusinessAction_FoodGive_10_01 " );	// How much supplies are we talking about?
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of grilled meat. " ,dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of raw meat. " ,dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two dozen fresh fish. " ,dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction, " Ten loaves of bread. " ,dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_hmf()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodGive_MF_15_00 " );	// Twenty pieces of fried meat.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of grilled meat. " ,dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of raw meat. " ,dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two dozen fresh fish. " ,dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction, " Ten loaves of bread. " ,dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_mf()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodGive_MF_15_00 " );	// Twenty pieces of raw meat.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of grilled meat. " ,dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of raw meat. " ,dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two dozen fresh fish. " ,dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction, " Ten loaves of bread. " ,dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_fb()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodGive_FB_15_00 " );	// Two dozen fresh fish.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of grilled meat. " ,dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of raw meat. " ,dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two dozen fresh fish. " ,dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction, " Ten loaves of bread. " ,dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_bsc()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodGive_BSC_15_00 " );	// Ten loaves of bread.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of grilled meat. " ,dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty pieces of raw meat. " ,dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction, " Two dozen fresh fish. " ,dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction, " Ten loaves of bread. " ,dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell()
{
	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodSell_15_00 " );	// I'd like to sell food from the warehouse in the camp.

	if(DT_FOODSTOCK < 130)
	{
		AI_Output(self,other, " DIA_Valeran_BusinessAction_FoodSell_10_01 " );	// Unfortunately, this is not possible, because the stocks in the warehouse are minimal for the normal existence of the camp in the near future.
		Info_ClearChoices(dia_valeran_businessaction);
	}
	else
	{
		AI_Output(self,other, " DIA_Valeran_BusinessAction_FoodSell_10_02 " );	// This can be arranged. How much specific food do you want to sell?
		Info_ClearChoices(dia_valeran_businessaction);

		if(DT_FOODSTOCK >= 130)
		{
			Info_AddChoice(dia_valeran_businessaction, " Ten units of food (Treasury income: 50 gold coins) " ,dia_valeran_businessaction_foodsell_small);
		};
		if(DT_FOODSTOCK >= 145)
		{
			Info_AddChoice(dia_valeran_businessaction, " Twenty-five units of food (Treasury income: 125 gold coins) " ,dia_valeran_businessaction_foodsell_medium);
		};
		if(DT_FOODSTOCK >= 170)
		{
			Info_AddChoice(dia_valeran_businessaction, " Fifty food (Treasury income: 250 gold coins) " ,dia_valeran_businessaction_foodsell_huge);
		};

		Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	};
};

func void dia_valeran_businessaction_foodsell_small()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodSell_Small_15_00 " );	// Ten units of food.
	DT_BUDGET = DT_BUDGET + 50;
	DT_FOODSTOCK = DT_FOODSTOCK - 10;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction, " Ten units of food (Treasury income: 50 gold coins) " ,dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty-five units of food (Treasury income: 125 gold coins) " ,dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifty food (Treasury income: 250 gold coins) " ,dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell_medium()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodSell_Medium_15_00 " );	// Twenty-five units of food.
	DT_BUDGET = DT_BUDGET + 125;
	DT_FOODSTOCK = DT_FOODSTOCK - 25;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction, " Ten units of food (Treasury income: 50 gold coins) " ,dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty-five units of food (Treasury income: 125 gold coins) " ,dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifty food (Treasury income: 250 gold coins) " ,dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self, " DIA_Valeran_BusinessAction_FoodSell_Huge_15_00 " );	// Fifty units of food.
	DT_BUDGET = DT_BUDGET + 250;
	DT_FOODSTOCK = DT_FOODSTOCK - 50;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction, " Ten units of food (Treasury income: 50 gold coins) " ,dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction, " Twenty-five units of food (Treasury income: 125 gold coins) " ,dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction, " Fifty food (Treasury income: 250 gold coins) " ,dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

instance DIA_VALERAN_MONEYCRISIS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 1;
	condition = dia_valeran_moneycrisis_condition;
	information = dia_valeran_moneycrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_valeran_moneycrisis_condition()
{
	if((DTMONEYCRISIS == TRUE) && (DTFOODCRISIS == FALSE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_moneycrisis_info()
{
	var string concatText1;

	DTMONEYDEBT = 5000 - DT_BUDGET;
	AI_Output(self,other, " DIA_Valeran_MoneyCrisis_07_00 " );	// Finally! There is no money in the camp, I have nothing to pay people's salaries!
	AI_Output(self,other, " DIA_Valeran_MoneyCrisis_07_01 " );	// I barely managed to talk them out of starting to go home.
	AI_Output(self,other, " DIA_Valeran_MoneyCrisis_07_02 " );	// We urgently need money!
	AI_Output(other,self,"DIA_Valeran_MoneyCrisis_15_03");	//Сколько?
	concatText1 = ConcatStrings("Необходимо ",IntToString(DTMONEYDEBT));
	concatText1 = ConcatStrings(concatText1, " gold coins " );
	AI_Print(concatText1);
	Info_ClearChoices(dia_valeran_moneycrisis);

	if(Npc_HasItems(other,ItMi_Gold) >= DTMONEYDEBT)
	{
		Info_AddChoice(dia_valeran_moneycrisis, " Here's the money. " ,dia_valeran_moneycrisis_yes);
	};

	Info_AddChoice(dia_valeran_moneycrisis, " I don't have that kind of money right now. " ,dia_valeran_moneycrisis_no);
};

func void dia_valeran_moneycrisis_yes()
{
	AI_Output(other,self, " DIA_Valeran_MoneyCrisis_Yes_15_00 " );	// Here's the money.
	AI_Output(self,other, " DIA_Valeran_MoneyCrisis_Yes_07_01 " );	// Great! I will immediately arrange for the payment of debts.
	B_GiveInvItems(other,self,ItMi_Gold,DTMONEYDEBT);
	DT_BUDGET = DT_BUDGET + DTMONEYDEBT;
	Npc_RemoveInvItems(self,ItMi_Gold,DTMONEYDEBT);
	DTMONEYCRISIS = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_valeran_moneycrisis_no()
{
	AI_Output(other,self, " DIA_Valeran_MoneyCrisis_No_15_00 " );	// I don't have that kind of money right now.
	AI_Output(self,other, " DIA_Valeran_MoneyCrisis_No_07_01 " );	// Then find them! You can't be so irresponsible.
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_FOODCRISIS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 1;
	condition = dia_valeran_foodcrisis_condition;
	information = dia_valeran_foodcrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_valeran_foodcrisis_condition()
{
	if((DTFOODCRISIS == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_foodcrisis_info()
{
	AI_Output(self,other, " DIA_Valeran_FoodCrisis_07_00 " );	// Finally! The camp ran out of food, we have nothing to eat!
	AI_Output(self,other, " DIA_Valeran_FoodCrisis_07_01 " );	// I have temporarily agreed with Onar on supplies, but he has an important contract on his nose, and he will stop them as soon as he concludes it.
	AI_Output(self,other, " DIA_Valeran_FoodCrisis_07_02 " );	// We urgently need food. First of all, meat, fish, bread...
	Info_ClearChoices(dia_valeran_foodcrisis);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis, " Here are twenty pieces of grilled meat. " ,dia_valeran_foodcrisis_m);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis, " Here are twenty pieces of raw meat. " ,dia_valeran_foodcrisis_rm);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis, " Here are two dozen fresh fish. " ,dia_valeran_foodcrisis_f);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_foodcrisis, " Here are ten loaves of bread. " ,dia_valeran_foodcrisis_b);
	};

	Info_AddChoice(dia_valeran_foodcrisis, " I don't have enough food with me. " ,dia_valeran_foodcrisis_no);
};

func void dia_valeran_foodcrisis_m()
{
	AI_Output(other,self, " DIA_Valeran_FoodCrisis_M_15_00 " );	// Here are twenty pieces of fried meat.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other, " DIA_Valeran_FoodCrisis_M_07_01 " );	// Great! This is enough for now.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0 ;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other, " DIA_Valeran_FoodCrisis_M_07_02 " );	// More! We need more food.

		if(Npc_HasItems(other,ItFoMutton) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis, " Here are twenty pieces of grilled meat. " ,dia_valeran_foodcrisis_m);
		};
	};
};

func void dia_valeran_foodcrisis_rm()
{
	AI_Output(other,self, " DIA_Valeran_FoodCrisis_RM_15_00 " );	// Here are twenty pieces of raw meat.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other, " DIA_Valeran_FoodCrisis_RM_07_01 " );	// Great! This is enough for now.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0 ;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other, " DIA_Valeran_FoodCrisis_RM_M_07_02 " );	// More! We need more food.

		if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis, " Here are twenty pieces of raw meat. " ,dia_valeran_foodcrisis_rm);
		};
	};
};

func void dia_valeran_foodcrisis_f()
{
	AI_Output(other,self, " DIA_Valeran_FoodCrisis_F_15_00 " );	// Here are two dozen fresh fish.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other, " DIA_Valeran_FoodCrisis_F_07_01 " );	// Great! This is enough for now.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0 ;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other, " DIA_Valeran_FoodCrisis_F_07_02 " );	// More! We need more food.

		if(Npc_HasItems(other,ItFo_Fish) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis, " Here are two dozen fresh fish. " ,dia_valeran_foodcrisis_f);
		};
	};
};

func void dia_valeran_foodcrisis_b()
{
	AI_Output(other,self, " DIA_Valeran_FoodCrisis_B_15_00 " );	// Here are ten loaves of bread.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other, " DIA_Valeran_FoodCrisis_B_07_01 " );	// Great! This is enough for now.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0 ;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other, " DIA_Valeran_FoodCrisis_B_07_02 " );	// More! We need more food.

		if(Npc_HasItems(other,ItFo_Bread) >= 10)
		{
			Info_AddChoice(dia_valeran_foodcrisis, " Here are ten loaves of bread. " ,dia_valeran_foodcrisis_b);
		};
	};
};

func void dia_valeran_foodcrisis_no()
{
	AI_Output(other,self, " DIA_Valeran_FoodCrisis_No_15_00 " );	// I don't have enough food with me. I myself live from hand to mouth.
	AI_Output(self,other, " DIA_Valeran_FoodCrisis_No_07_01 " );	// Oh, Innos! You can't be so irresponsible. We need food!
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_IGETTHEFOUTOFHERE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 15;
	condition = dia_valeran_igetthefoutofhere_condition;
	information = dia_valeran_igetthefoutofhere_info;
	permanent = FALSE;
	description = " I'm going to sail to the mainland. " ;
};

func int dia_valeran_igetthefoutofhere_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_igetthefoutofhere_info()
{
	AI_Output(other,self, " DIA_Valeran_IGetTheFOutOfHere_15_00 " );	// I'm going to sail to the mainland. Can you watch the tower?
	AI_Output(self,other, " DIA_Valeran_IGetTheFOutOfHere_10_01 " );	// This is unexpected news... are you sailing away forever, or do you intend to return after some time?
	AI_Output(other,self, " DIA_Valeran_IGetTheFOutOfHere_15_02 " );	// I'm afraid not, I won't be returning to Khorinis. If you're willing to keep running the tower, I'll leave it to you.
	AI_Output(self,other, " DIA_Valeran_IGetTheFOutOfHere_10_03 " );	// Uh... well, whatever you say. Thanks to your efforts, we are well settled here, so I think we can continue to support this camp.
	AI_Output(self,other, " DIA_Valeran_IGetTheFOutOfHere_10_04 " );	// Now that your tower and Onar's farm have become the main center of resistance to the orcs, we can strengthen relations with the rest of the camps and continue to fight these creatures together.
	AI_Output(self,other, " DIA_Valeran_IGetTheFOutOfHere_10_05 " );	// So I think you can sail away without worrying about the welfare of the camp.
	AI_Output(self,other, " DIA_Valeran_IGetTheFOutOfHere_10_06 " );	// You've already done all you can for us, and now it's our turn to put in the effort. Happy sailing!
	AI_Output(other,self,"DIA_Valeran_IGetTheFOutOfHere_15_07");	//Спасибо!
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_INTOWER(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 22;
	condition = dia_valeran_intower_condition;
	information = dia_valeran_intower_info;
	permanent = TRUE;
	description = " How are things in the tower? " ;
};

func int dia_valeran_intower_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (DTMONEYCRISIS == FALSE) && (DTFOODCRISIS == FALSE) && (CEONEEDSFIRSTMONEY == FALSE) && (CEONEEDSFIRSTFOOD == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_valeran_intower_info()
{
	AI_Output(other,self, " DIA_Valeran_InTower_15_00 " );	// How are things in the tower?
	AI_Output(self,other, " DIA_Valeran_InTower_07_01 " );	// Great! As long as we have enough food and money, you have nothing to worry about.
};
