
instance DIA_Addon_Lennar_EXIT(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 999;
	condition = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Lennar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lennar_PICKPOCKET(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 900;
	condition = DIA_Addon_Lennar_PICKPOCKET_Condition;
	information = DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 65 , 100 );
};

func void DIA_Addon_Lennar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,Dialog_Back,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};

func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};


instance DIA_Addon_Lennar_Hi(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 1;
	condition = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent = FALSE;
	description = " Hello " ;
};


func int DIA_Addon_Lennar_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//Hi.
	AI_Output(self,other, " DIA_Addon_Lennar_Hi_01_01 " );	// Hello. My name is Lennar. Welcome to the miner's camp.
	AI_Output(other,self, " DIA_Addon_Lennar_Hi_15_02 " );	// Miners? I thought it was a bandit camp...
	AI_Output(self,other, " DIA_Addon_Lennar_Hi_01_03 " );	// True, but the bandits are only here to mine the ore. (shrugs) So...
};


instance DIA_Addon_Lennar_Attentat(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 2;
	condition = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent = FALSE;
	description = " About the assassination attempt on Esteban... " ;
};


func int DIA_Addon_Lennar_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lennar_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//I'm listening?
	AI_Output(other,self, " DIA_Addon_Lennar_ATTENTAT_15_01 " );	// Do you have any idea who's behind this?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//Of course!
	AI_Output(self,other, " DIA_Addon_Lennar_ATTENTAT_01_03 " );	// I'm pretty sure it's Emilio's fault!
	AI_Output(self,other, " DIA_Addon_Lennar_ATTENTAT_01_04 " );	// He always rushed into the mine, as if possessed, and dug to the point of exhaustion.
	AI_Output(self,other, " DIA_Addon_Lennar_ATTENTAT_01_05 " );	// But since the attack, all he's been doing is sitting on the bench.
	AI_Output(self,other, " DIA_Addon_Lennar_ATTENTAT_01_06 " );	// It's obvious! To get into the mine, he must get a red tablet from Esteban.
	AI_Output(self,other, " DIA_Addon_Lennar_ATTENTAT_01_07 " );	// I guess he just can't look him in the eyes again.
	B_LogEntry(Topic_Addon_Esteban, " Lennar suspects Emilio because he doesn't go to Esteban anymore. " );
};


instance DIA_Addon_Lennar_Inspector (C_Info) .
{
	npc = BDT_1096_Addon_Lennar;
	nr = 3;
	condition = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent = FALSE;
	description = " But what would Emilio gain from Esteban's death? " ;
};


func int DIA_Addon_Lennar_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output(other,self, " DIA_Addon_Lennar_Inspektor_15_00 " );	// But what would Emilio gain from Esteban's death?
	AI_Output(self,other, " DIA_Addon_Lennar_Inspektor_01_01 " );	// How should I know? Maybe he has a friend who wants to take Esteban's place.
	AI_Output(self,other, " DIA_Addon_Lennar_Inspektor_01_02 " );	// Yes, that sounds pretty logical...
};


instance DIA_Addon_Lennar_Mine(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 4;
	condition = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Lennar_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lennar_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other, " DIA_Addon_Lennar_Mine_01_00 " );	// Do you really have a red tile for me?
	AI_Output(self,other, " DIA_Addon_Lennar_Mine_01_01 " );	// Great. Now I will process all this rock into pieces - I know exactly where to go!
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Lennar_Hacker(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 9;
	condition = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_Lennar_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//How are things?
	AI_Output(self,other, " DIA_Addon_BDT_10004_Lennar_Hacker_01_01 " );	// Everything is calm.
};

