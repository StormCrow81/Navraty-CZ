
instance DIA_Addon_Senyan_EXIT(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 999;
	condition = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent = TRUE;
	description = " See you later. " ;
};


func int DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Senyan_EXIT_Info()
{
	if (Senyan_Blackmail == LOG_Running)
	{
		AI_Output(self,other, " DIA_Addon_Senyan_EXIT_12_00 " );	// You know what you need to do...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Senyan_PICKPOCKET(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 900;
	condition = DIA_Addon_Senyan_PICKPOCKET_Condition;
	information = DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 45 , 88 );
};

func void DIA_Addon_Senyan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET,Dialog_Back,DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void B_Senyan_Attack()
{
	AI_Output(self,other, " DIA_Addon_Senyan_Attack_12_00 " );	// (scoffing) Then why do I still need you, parasite?
	AI_Output(self,other, " DIA_Addon_Senyan_Attack_12_01 " );	// (calling) Hey guys, look who we have here!
	Senyan_Called = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Senyan_Blackmail()
{
	AI_Output(other,self, " DIA_Addon_Senyan_Erpressung_15_00 " );	// How much do you want?
	AI_Output(self,other, " DIA_Addon_Senyan_Erpressung_12_01 " );	// (playing offense) Oh no, please don't. I don't want to extort money from you. I didn't even dream about it.
	AI_Output(other,self, " DIA_Addon_Senyan_Erpressung_15_02 " );	// Then what do you need?
	AI_Output(self,other, " DIA_Addon_Senyan_Erpressung_12_03 " );	// Recently, someone wanted to remove Esteban. But he ran into bodyguards.
	AI_Output(self,other, " DIA_Addon_Senyan_Erpressung_12_04 " );	// Go to Esteban and talk to him. Then come back.
	AI_StopProcessInfos(self);
	Log_CreateTopic(Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Senyan,LOG_Running);
	B_LogEntry(Topic_Addon_Senyan, " Senyan recognizes me. He knows who I am. He wants to use me for his own purposes. But first I need to talk to Esteban. " );
};


instance DIA_Addon_BDT_1084_Senyan_Hi(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_Hi_Condition()
{
	return TRUE;
};


var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;

func void DIA_Addon_Senyan_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_12_00 " );	// Ah! Who do we have here?
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_12_01 " );	// Come on, come on. Where are you. I have good news and bad news for you.
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, " Good first. " ,DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, " Tell me the bad news first. " ,DIA_Addon_BDT_1084_Senyan_Hi_bad);
};

func void DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if ( New_Msg ==  FALSE )
	{
		AI_Output(other,self, " DIA_Addon_BDT_1084_Senyan_Hi_good_15_00 " );	// Good ones first.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_BDT_1084_Senyan_Hi_good_15_01 " );	// What's the good news?
	};
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_good_12_02 " );	// Well, I don't know how you did it, but you've made yourself some powerful enemies.
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_good_12_03 " );	// You can consider yourself lucky that no one but me recognized you.
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_good_12_04 " );	// And I'm an understanding and friendly person.
	Senyan_Good = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Bad == TRUE)
	{
		B_Senyan_Blackmail();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, " What about the bad news? " ,DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};

func void DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if ( New_Msg ==  FALSE )
	{
		AI_Output(other,self, " DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00 " );	// Tell me the bad news first.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01 " );	// What about bad news?
	};
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02 " );	// Raven is looking for you. And his security. Actually, all the bandits are looking for you...
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03 " );	// And if they find you, they'll kill you.
	AI_Output(other,self, " DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04 " );	// Many have already tried.
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05 " );	// So you fight as well as you plot. Coming to camp in armor like that, it's...
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06 " );	// ...it's like coming to the wolves as a sheep. Your life hangs in the balance, son of risk.
	Senyan_Bad = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Good == TRUE)
	{
		B_Senyan_Blackmail();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, " What's the good news? " ,DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};


instance DIA_Addon_Senyan_unterwegs (C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 99;
	condition = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent = TRUE;
	description = " About Esteban... " ;
};


func int DIA_Addon_Senyan_unterwegs_Condition()
{
	if ((MIS_Judas != LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Sign_Hi))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output(other,self, " DIA_Addon_Senyan_unterwegs_15_00 " );	// About Esteban...
	AI_Output(self,other, " DIA_Addon_Senyan_unterwegs_12_01 " );	// Have you talked to him yet?
	AI_Output(other,self, " DIA_Addon_Senyan_unterwegs_15_02 " );	// Not yet.
	AI_Output(self,other, " DIA_Addon_Senyan_unterwegs_12_03 " );	// Then you should do it quickly.
};


instance DIA_Addon_Senyan_Attentat(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 2;
	condition = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent = FALSE;
	description = " I talked to Esteban. " ;
};


func int DIA_Addon_Senyan_Attentat_Condition()
{
	if ((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output(other,self, " DIA_Addon_Senyan_Attentat_15_00 " );	// I talked to Esteban.
	AI_Output(self,other, " DIA_Addon_Senyan_Attentat_12_01 " );	// And he told you about the attack?
	AI_Output(other,self, " DIA_Addon_Senyan_Attentat_15_02 " );	// He told me to find the one who sent the assassin. Do you know anything about it?
	AI_Output(self,other, " DIA_Addon_Senyan_Attentat_12_03 " );	// No more than you. I'm looking for him too. And here the most interesting begins.
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//Да?
	AI_Output(self,other, " DIA_Addon_Senyan_Attentat_12_05 " );	// I want you to complete your task. For you to find the traitor.
	AI_Output(self,other, " DIA_Addon_Senyan_Attentat_12_06 " );	// (coldly) And when you find him, you will kill him for me.
	AI_Output(self,other, " DIA_Addon_Senyan_Attentat_12_07 " );	// And I'll take the reward.
	AI_Output(self,other, " DIA_Addon_Senyan_Attentat_12_08 " );	// I have a wanted poster for you - don't forget it. Do your job and do it well. You understand what could happen otherwise.
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	Info_AddChoice(DIA_Addon_Senyan_Attentat, " It's not like I have a choice... " ,DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice(DIA_Addon_Senyan_Attentat, " Forget it! " ,DIA_Addon_Senyan_Attentat_NO);
};

func void DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output(other,self, " DIA_Addon_Senyan_Attentat_NO_15_00 " );	// Forget it!
	B_Senyan_Attack();
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
};

func void DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output(other,self, " DIA_Addon_Senyan_Attentat_JA_15_00 " );	// Not that I have a choice...
	AI_Output(self,other, " DIA_Addon_Senyan_Attentat_JA_12_01 " );	// I knew we could come to an agreement.
	AI_Output(self,other, " DIA_Addon_Senyan_Attentat_JA_12_02 " );	// (slyly) When you've done your job - and done it well - and figured out who's to blame, we'll kill the dumbass together. Now go!
	Senyan_Blackmail = LOG_Running;
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	B_LogEntry(Topic_Addon_Senyan, " Senyan wants me to find the culprit and kill him. After that, I'll get my reward. " );
};


instance DIA_Addon_Senyan_ChangePlan(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent = FALSE;
	description = " I changed my mind. We don't work together anymore! " ;
};


func int DIA_Addon_Senyan_ChangePlan_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (Snaf_Tip_Senyan == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_ChangePlan_Info()
{
	AI_Output(other,self, " DIA_Addon_Senyan_ChangePlan_15_00 " );	// I changed my mind. We don't work together anymore!
	B_Senyan_Attack();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_1084_Senyan_Found(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent = FALSE;
	description = " I found the traitor. It's Fisk. " ;
};


func int DIA_Addon_Senyan_Found_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (MIS_Judas == LOG_SUCCESS))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Senyan_Found_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_1084_Senyan_Found_15_00 " );	// I found the traitor. This is Fisk.
	B_Senyan_Attack();
};


instance DIA_Addon_BDT_1084_Senyan_derbe (C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_derbe_Condition()
{
	if ((Senyan_Erpressung == LOG_Running) && (MIS_Judas ==  LOG_SUCCESS ) && (Npc_IsDead(Fisk) || Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Senyan_derbe_Info()
{
	AI_Output(self,other, " DIA_Addon_BDT_1084_Senyan_derbe_12_00 " );	// (furious) You didn't honor our agreement.
	B_Senyan_Attack();
};
