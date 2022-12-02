

instance DIA_VLK_6133_MAXI_EXIT(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 999;
	condition = dia_vlk_6133_maxi_exit_condition;
	information = dia_vlk_6133_maxi_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6133_maxi_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6133_maxi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HALLO (C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hallo_condition;
	information = dia_vlk_6133_maxi_hello_info;
	permanent = FALSE;
	description = " Hi! " ;
};


func int dia_vlk_6133_maxi_hallo_condition()
{
	return TRUE;
};

func void dia_vlk_6133_maxi_hallo_info()
{
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hallo_01_00 " );	// Hello!
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hallo_01_01 " );	// Hey! What do you want from me? Do you have a job for me?
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hallo_01_02 " );	// No, I don't have it for you.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hallo_01_03 " );	// (angrily) Then why are you distracting me? Can't you see I'm busy!
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hallo_01_04 " );	// What are you doing?
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hallo_01_05 " );	// I'm standing here trying not to miss the moment when one of the merchants needs the help of a man like me.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hallo_01_06 " );	// And you start asking me about all sorts of nonsense, and thus distract!
};


instance DIA_VLK_6133_MAXI_WHATDO(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_whatdo_condition;
	information = dia_vlk_6133_maxi_whatdo_info;
	permanent = FALSE;
	description = " What are you waiting for? " ;
};


func int dia_vlk_6133_maxi_whatdo_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_whatdo_info()
{
	AI_Output(other,self, " DIA_VLK_6133_Maxi_WhatDo_01_00 " );	// I didn't understand a bit - what are you actually waiting for?
	AI_Output(self,other, " DIA_VLK_6133_Maxi_WhatDo_01_01 " );	// I'm waiting for one of the merchants to need some help.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_WhatDo_01_03 " );	// I'm ready to take on any of their dirty work. I am well versed in this matter.
	AI_Output(other,self, " DIA_VLK_6133_Maxi_WhatDo_01_04 " );	// Are you good at trading?
	AI_Output(self,other, " DIA_VLK_6133_Maxi_WhatDo_01_05 " );	// Of course! I can even read and write a little.
	AI_Output(other,self, " DIA_VLK_6133_Maxi_WhatDo_01_06 " );	// You just can't tell.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_WhatDo_01_08 " );	// Yes, I already worked for one merchant, but it's true that he recently went bankrupt, and I was left without work.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_WhatDo_01_10 " );	// Now I'm looking for a new employer.
	AI_Output(other,self, " DIA_VLK_6133_Maxi_WhatDo_01_11 " );	// Everything is clear with you. I think you'll be here for a long time.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_WhatDo_01_12 " );	// What? Get away from here! Still croaking, don't let Adanos.
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_PERM(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_perm_condition;
	information = dia_vlk_6133_maxi_perm_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_vlk_6133_maxi_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_whatdo) && (FINDPERSONTWO == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_perm_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Perm_01_00");	//Как жизнь?
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Perm_01_01 " );	// Do you care?
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Perm_01_02 " );	// Maybe I have a job for you.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Perm_01_03 " );	// Really? And what is it?
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Perm_01_04 " );	// Good question. I'll think about it...
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Perm_01_05 " );	// Get off me! What have I done to you that you keep getting on my nerves?
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HIRE(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hire_condition;
	information = dia_vlk_6133_maxi_hire_info;
	permanent = FALSE;
	description = " I have a job for you. " ;
};


func int dia_vlk_6133_maxi_hire_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_whatdo) && (MIS_TRADEHELPER == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_hire_info()
{
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hire_01_00 " );	// I have a job for you.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hire_01_01 " );	// Yes? And what can you suggest?
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hire_01_03 " );	// One large merchant from the upper quarter of the city is looking for a man to take the place of his assistant.
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hire_01_04 " );	// The job is to do all the dusty jobs for him and help him run the business.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hire_01_05 " );	// Wow! Sounds pretty good!
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hire_01_06 " );	// I thought your services might be useful to him.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hire_01_07 " );	// This is a great offer! You can consider that my consent is in your pocket.
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hire_01_08 " );	// Good. But first, tell me what can you do?
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hire_01_09 " );	// As I told you before, I used to work for a merchant, and, in general, he was pleased with my work.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hire_01_10 " );	// I can read and write a little, which means a lot in this business!
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hire_01_11 " );	// In addition, I do not shy away from the dusty work of a loader or messenger. I can do everything!
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hire_01_12 " );	// Well, not bad at all.
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Hire_01_14 " );	// I'll think about it, and, most likely, I'll contact you.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Hire_01_15 " );	// Okay, think about it, but not for long. Workers like me don't roll around on the road.
	B_LogEntry( TOPIC_TRADEHELPER , " Maxie is willing to work as Luthero's assistant. Although maybe someone else will take the job. " );
	MAXIAGREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HIREOK(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hireok_condition;
	information = dia_vlk_6133_maxi_hireok_info;
	permanent = FALSE;
	description = " Let's go to the merchant. " ;
};


func int dia_vlk_6133_maxi_hireok_condition()
{
	if (( MAXIAGREE  ==  TRUE ) && ( MY_TRADEHELPER  == LOG_Running ) && ( FINDPERSONONONE  ==  FALSE ) && ( FINDTHREEPERSONS  ==  FALSE ) && ( FINDTHREEPERSONS  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_hireok_info()
{
	AI_Output(other,self, " DIA_VLK_6133_Maxi_HireOk_01_00 " );	// We go to the merchant.
	AI_Output(other,self, " DIA_VLK_6133_Maxi_HireOk_01_01 " );	// I think you're the right person for him.
	AI_Output(self,other, " DIA_VLK_6133_Maxi_HireOk_01_02 " );	// Great! Went.
	B_LogEntry( TOPIC_TRADEHELPER , " I've decided to go with Maxi. This guy knows a little about the job he's being offered. I hope Luthero appreciates my choice. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	FINDPERSONTWO = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6133_MAXI_THANKS(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_thanks_condition;
	information = dia_vlk_6133_maxi_thanks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6133_maxi_thanks_condition()
{
	if(MAXIHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_thanks_info()
{
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Thanks_01_00 " );	// I want to thank you for helping me get this job!
	AI_Output(other,self, " DIA_VLK_6133_Maxi_Thanks_01_01 " );	// I hope you don't make me think I made a mistake in suggesting you to Luther?
	AI_Output(self,other, " DIA_VLK_6133_Maxi_Thanks_01_02 " );	// No, what are you! I will do my job as well as I can...
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_NEWLIFE(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_newlife_condition;
	information = dia_vlk_6133_maxi_newlife_info;
	permanent = TRUE;
	description = " Any complaints? " ;
};


func int dia_vlk_6133_maxi_newlife_condition()
{
	if(MAXIHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_newlife_info()
{
	AI_Output(other,self, " DIA_VLK_6133_Maxi_NewLife_01_00 " );	// Any complaints?
	AI_Output(self,other, " DIA_VLK_6133_Maxi_NewLife_01_01 " );	// No! Everyone is happy.
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_PICKPOCKET (C_Info)
{
	npc = vlk_6133_maxi;
	nr = 900;
	condition = dia_vlk_6133_maxi_pickpocket_condition;
	information = dia_vlk_6133_maxi_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6133_maxi_pickpocket_condition()
{
	return  C_Robbery ( 60 , 90 );
};

func void dia_vlk_6133_maxi_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
	Info_AddChoice(dia_vlk_6133_maxi_pickpocket,Dialog_Back,dia_vlk_6133_maxi_pickpocket_back);
	Info_AddChoice(dia_vlk_6133_maxi_pickpocket, DIALOG_PICKPOCKET ,dia_vlk_6133_maxi_pickpocket_doit);
};

func void dia_vlk_6133_maxi_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
};

func void dia_vlk_6133_maxi_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
};

