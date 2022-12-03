

instance DIA_Wirt_EXIT(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 999;
	condition = DIA_Wirt_EXIT_Condition;
	information = DIA_Wirt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wirt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wirt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wirt_PICKPOCKET(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 900;
	condition = DIA_Wirt_PICKPOCKET_Condition;
	information = DIA_Wirt_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wirt_PICKPOCKET_Condition()
{
	return  C_Robbery ( 60 , 65 );
};

func void DIA_Wirt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
	Info_AddChoice(DIA_Wirt_PICKPOCKET,Dialog_Back,DIA_Wirt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wirt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wirt_PICKPOCKET_DoIt);
};

func void DIA_Wirt_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};

func void DIA_Wirt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};


instance DIA_Wirt_Hello (C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 2;
	condition = DIA_Wirt_Hallo_Condition;
	information = DIA_Wirt_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wirt_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CoragonGuestBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Host_Hello_Info()
{
	AI_Output(self,other, " DIA_Wirt_Hallo_14_00 " );	// Hey, come closer! Have a sip of cold beer.
	AI_Output(self,other, " DIA_Wirt_Hallo_14_01 " );	// Lord Andre put out a couple of kegs.
};

instance DIA_WIRT_GIVEBEER(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 2;
	condition = dia_wirt_givebeer_condition;
	information = dia_wirt_givebeer_info;
	permanent = TRUE;
	description = " Give me some beer. " ;
};

func int dia_wirt_givebeer_condition()
{
 	if(CoragonGuestBack == FALSE)
	{
		return TRUE;
	};
};

func void dia_wirt_givebeer_info()
{
	be int randy;
	AI_Output(other,self, " DIA_Wirt_GiveBeer_01_00 " );	// Give me some beer.
	if(WIRT_DAY != Wld_GetDay())
	{
		AI_Output(self,other, " DIA_Wirt_GiveBeer_01_01 " );	// Of course! Here you are.
		B_GiveInvItems(self,other,ItFo_Beer,1);
		randy = Hlp_Random( 3 );
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_Wirt_Hallo_14_02 " );	// After a job well done, there's nothing better than a cold beer.
		}
		else if(randy == 1)
		{
			AI_Output(self,other, " DIA_Wirt_Hallo_14_03 " );	// The paladins have already put everything in order. So, take another sip and enjoy it in peace!
		}
		else if(randy == 2)
		{
			AI_Output(self,other, " DIA_Wirt_Hallo_14_04 " );	// We can talk a lot about Khorinis, but our 'Dark Paladin' is the best beer in all of Myrtana!
		};
		WIRT_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Wirt_GiveBeer_01_02 " );	// Hey, but you already got your portion today.
		AI_Output(self,other, " DIA_Wirt_GiveBeer_01_03 " );	// If you're destroying my supply so quickly, there won't be enough for everyone.
		AI_Output(self,other, " DIA_Wirt_GiveBeer_01_04 " );	// Better come tomorrow and you'll get another mug!
	};
};

instance DIA_Wirt_FixBeer_Done(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 3;
	condition = DIA_Wirt_FixBeer_Done_Condition;
	information = DIA_Wirt_FixBeer_Done_Info;
	permanent = FALSE;
	description = " Are you in the militia now? " ;
};

func int DIA_Wirt_FixBeer_Done_Condition()
{
	if(CoragonGuestBack == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wirt_FixBeer_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Wirt_FixBeer_Done_01_00 " );	// Now you serve in the militia?
	AI_Output(self,other, " DIA_Wirt_FixBeer_Done_01_01 " );	// I still can't believe it myself. They just came and took me away!
	AI_Output(self,other, " DIA_Wirt_FixBeer_Done_01_02 " );	// They said they needed strong men like me to protect the city.
	AI_Output(self,other, " DIA_Wirt_FixBeer_Done_01_03 " );	// And I can't even hold a sword in my hands!
	AI_Output(other,self, " DIA_Wirt_FixBeer_Done_01_04 " );	// Well, you know, times are tough right now.
	AI_Output(other,self, " DIA_Wirt_FixBeer_Done_01_05 " );	// The militia needs all the help! And by the way, you look pretty good.
	AI_Output(other,self, " DIA_Wirt_FixBeer_Done_01_06 " );	// I think that every robber, seeing you from afar, will immediately run away to hell!
	AI_Output(self,other, " DIA_Wirt_FixBeer_Done_01_07 " );	// (bewildered) Umm... Do you think so?
	AI_Output(other,self, " DIA_Wirt_FixBeer_Done_01_08 " );	// Yes, I'm just sure of it - you yourself, then take a look at yourself!
	AI_Output(other,self, " DIA_Wirt_FixBeer_Done_01_09 " );	// A real dashing brawler! Even I'm a little afraid of you.
	AI_Output(self,other, " DIA_Wirt_FixBeer_Done_01_10 " );	// Hmmm... uh... Well, yes, you're probably right. Otherwise, why would they drag me here.
	AI_Output(self,other, " DIA_Wirt_FixBeer_Done_01_11 " );	// (thoughtfully) Then... Stop talking then! I seem to be on the job.
	AI_Output(other,self, " DIA_Wirt_FixBeer_Done_01_12 " );	// Of course, of course! Keep watch... soldier.
	AI_StopProcessInfos(self);
};

instance DIA_Wirt_FixBeer_Perm(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 3;
	condition = DIA_Wirt_FixBeer_Perm_Condition;
	information = DIA_Wirt_FixBeer_Perm_Info;
	permanent = TRUE;
	description = " How is the service? " ;
};

func int DIA_Wirt_FixBeer_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wirt_FixBeer_Done))
	{
		return TRUE;
	};
};

func void DIA_Wirt_FixBeer_Perm_Info()
{
	AI_Output(other,self,"DIA_Wirt_FixBeer_Perm_01_00");	//Как служба?
	AI_Output(self,other,"DIA_Wirt_FixBeer_Perm_01_01");	//Не мешай!
	AI_StopProcessInfos(self);
};
