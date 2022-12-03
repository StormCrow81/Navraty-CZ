

instance DIA_Sylvio_EXIT(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 999;
	condition = DIA_Sylvio_EXIT_Condition;
	information = DIA_Sylvio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sylvio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Hello (C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 1;
	condition = DIA_Sylvio_Hallo_Condition;
	information = DIA_Sylvio_Hello_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Sylvio_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_Hello_Info()
{
	AI_Output(other,self, " DIA_Sylvio_Hallo_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Sylvio_Hallo_09_01 " );	// Did I give you permission to contact me?
	Sylvio_angequatscht = Sylvio_angequatscht +  1 ;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Thekla (C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 2;
	condition = DIA_Sylvio_Thekla_Condition;
	information = DIA_Sylvio_Thekla_Info;
	permanent = FALSE;
	description = " Thekla says she has a problem with you. " ;
};


func int DIA_Sylvio_Thekla_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Problem))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Thekla_Info()
{
	AI_Output(other,self, " DIA_Sylvio_Thekla_15_00 " );	// Thecla says she has a problem with you.
	AI_Output(self,other, " DIA_Sylvio_Thekla_09_01 " );	// Yes? And what's the problem with this nice lady? Why didn't she come herself?
	AI_Output(other,self, " DIA_Sylvio_Thekla_15_02 " );	// You know damn well...
	AI_Output(self,other, " DIA_Sylvio_Thekla_09_03 " );	// Why don't you discuss this matter with my friend Bulko?
	Sylvio_angequatscht = Sylvio_angequatscht +  1 ;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Gossip(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 3;
	condition = DIA_Sylvio_Gossip_Condition;
	information = DIA_Sylvio_Gossip_Info;
	permanent = FALSE;
	description = " Many people talk about you... " ;
};


func int DIA_Sylvio_Gossip_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_Gossip_Info()
{
	AI_Output(other,self, " DIA_Sylvio_Gossip_15_00 " );	// A lot of people talk about you...
	AI_Output(self,other, " DIA_Sylvio_Gossip_09_01 " );	// These many talk too much.
	Sylvio_angequatscht = Sylvio_angequatscht +  1 ;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_AboutLee(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 4;
	condition = DIA_Sylvio_AboutLee_Condition;
	information = DIA_Sylvio_AboutLee_Info;
	permanent = FALSE;
	description = " What do you think of Lee? " ;
};


func int DIA_Sylvio_AboutLee_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_AboutLee_Info()
{
	AI_Output(other,self, " DIA_Sylvio_AboutLee_15_00 " );	// What do you think of Lee?
	AI_Output(self,other, " DIA_Sylvio_AboutLee_09_01 " );	// Oh, he's a good fighter. I wouldn't get into a fight with him.
	AI_Output(self,other, " DIA_Sylvio_AboutLee_09_02 " );	// Unless, of course, it could have been avoided.
	Sylvio_angequatscht = Sylvio_angequatscht +  1 ;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_MenDefeated (C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 5;
	condition = DIA_Sylvio_MenDefeated_Condition;
	information = DIA_Sylvio_MenDefeated_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sylvio_MenDefeated_Condition()
{
	var int victories;
	victories = 0;
	if(Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if(Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if(Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if(Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if ( Bullco . aivar [ AIV_DefeatedByPlayer ] ==  TRUE )
	{
		victories = victories + 1;
	};
	if((MIS_Jarvis_SldKO != FALSE) && (victories >= 2))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_MenDefeated_Info()
{
	AI_Output(self,other, " DIA_Sylvio_MenDefeated_09_00 " );	// I think you have a grudge against my guys!
	AI_Output(self,other, " DIA_Sylvio_MenDefeated_09_01 " );	// As far as I know, you're one of Lee's protégés.
	AI_Output(self,other, " DIA_Sylvio_MenDefeated_09_02 " );	// I'm warning you! Soon a lot will change here, and then we will return to this conversation!
	Sylvio_MenDefeated = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Asshole(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 2;
	condition = DIA_Sylvio_Asshole_Condition;
	information = DIA_Sylvio_Asshole_Info;
	permanent = FALSE;
	description = " Hey crap... " ;
};


func int DIA_Sylvio_Asshole_Condition()
{
	if (Sylvio_angequatscht >=  1 )
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Asshole_Info()
{
	AI_Output(other,self, " DIA_Sylvio_Asshole_15_00 " );	// Hey shit...
	AI_Output(self,other, " DIA_Sylvio_Asshole_09_01 " );	// Do you really think I'm going to challenge you to a duel?
	AI_Output(self,other, " DIA_Sylvio_Asshole_09_02 " );	// Get back where you crawled out from.
	Sylvio_angequatscht = Sylvio_angequatscht +  1 ;
	AI_StopProcessInfos(self);
};


instance DIA_SylvioSLD_PICKPOCKET(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 900;
	condition = DIA_SylvioSLD_PICKPOCKET_Condition;
	information = DIA_SylvioSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_SylvioSLD_PICKPOCKET_Condition()
{
	return  C_Robbery ( 80 , 210 );
};

func void DIA_SylvioSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
	Info_AddChoice(DIA_SylvioSLD_PICKPOCKET,Dialog_Back,DIA_SylvioSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_SylvioSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_SylvioSLD_PICKPOCKET_DoIt);
};

func void DIA_SylvioSLD_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
};

func void DIA_SylvioSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
};

