
instance DIA_Rega_EXIT (C_Info)
{
	npc = BAU_933_Rega;
	No. = 999 ;
	condition = DIA_Rega_EXIT_Condition;
	information = DIA_Rega_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rega_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rega_EXIT_Info ()
{
	AI_StopProcessInfos(self);
};

instance DIA_Rega_HALLO (C_Info)
{
	npc = BAU_933_Rega;
	No. = 3 ;
	condition = DIA_Rega_HALLO_Condition;
	information = DIA_Rega_HALLO_Info;
	description = "Как дела?";
};

func int DIA_Rega_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rega_HELLO_Info()
{
	AI_Output(other,self,"DIA_Rega_HALLO_15_00");	//How are you?

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output (self, other, " DIA_Rega_HALLO_17_01 " );	// You're from the city, right?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output (self, other, " DIA_Rega_HALLO_17_02 " );	// You're one of Onar's mercenaries, aren't you?
	}
	else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//You are a wizard, yes?
	}
	else
	{
		AI_Output (self, other, " DIA_Rega_HALLO_17_04 " );	// You're not from here, are you?
	};

	AI_Output (self, other, " DIA_Rega_HALLO_17_05 " );	// If I were you, I would get out of here quickly.
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//Why?
	AI_Output (self, other, " DIA_Rega_HALLO_17_07 " );	// This place has never been paradise, but at least we lived in peace and tranquility while working for Sekoba.
	AI_Output (self, other, " DIA_Rega_HALLO_17_08 " );	// But lately, living here has become a living hell.

	if(Kapitel < 3)
	{
		AI_Output (self, other, " DIA_Rega_HALLO_17_09 " );	// Bandits are everywhere, predators of the field are destroying our crops, and Onar is completely brutal!
	};
};

instance DIA_Rega_ONAR (C_Info)
{
	npc = BAU_933_Rega;
	No. = 4 ;
	condition = DIA_Rega_ONAR_Condition;
	information = DIA_Rega_ONAR_Info;
	description = " Are you afraid of Onar? " ;
};

func int DIA_Rega_ONAR_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Rega_ONAR_Info()
{
	AI_Output (other, self, " DIA_Rega_ONAR_15_00 " );	// Are you afraid of Onar?
	AI_Output (self, other, " DIA_Rega_ONAR_17_01 " );	// Of course. If he doesn't like someone, he sends his mercenaries over and the person dissapears forever.
	AI_Output (self, other, " DIA_Rega_ONAR_17_02 " );	// So we just shut our mouths.
};

instance DIA_Rega_SLD(C_Info)
{
	npc = BAU_933_Rega;
	No. = 5 ;
	condition = DIA_Rega_SLD_Condition;
	information = DIA_Rega_SLD_Info;
	description = " Aren't mercenaries supposed to take out raptors in the field? " ;
};

func int DIA_Rega_SLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Rega_SLD_Info()
{
	AI_Output (other, self, " DIA_Rega_SLD_15_00 " );	// Shouldn't the mercenaries take out the field predators?
	AI_Output (self, other, " DIA_Rega_SLD_17_01 " );	// I don't know what they are being paid for, but its certainly not for helping ordinary people.
	AI_Output (self, other, " DIA_Rega_SLD_17_02 " );	// As for problems with field predators, the small farmers who rent land from him, have to solve it themselves.
};

instance DIA_Rega_BANDITEN (C_Info)
{
	npc = BAU_933_Rega;
	No. = 6 ;
	condition = DIA_Rega_BANDITEN_Condition;
	information = DIA_Rega_BANDITEN_Info;
	description = " How do you protect yourself from bandits? " ;
};

func int DIA_Rega_BANDITEN_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rega_BANDITEN_Info ()
{
	AI_Output (other, self, " DIA_Rega_BANDITEN_15_00 " );	// How do you protect yourself from bandits?
	AI_Output (self, other, " DIA_Rega_BANDITEN_17_01 " );	// We don't even try! We simply flee before them. What choice do we have?
};

instance DIA_Rega_BRONKO (C_Info)
{
	npc = BAU_933_Rega;
	No. = 7 ;
	condition = DIA_Rega_BRONKO_Condition;
	information = DIA_Rega_BRONKO_Info;
	description = " (ask about Bronco) " ;
};

func int DIA_Rega_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bronko_HALLO) && (MIS_Sekob_Bronko_eingeschuechtert == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Rega_BRONKO_Info()
{
	AI_Output (other, self, " DIA_Rega_BRONKO_15_00 " );	// Who is that nasty piece of work over there?
	AI_Output (self, other, " DIA_Rega_BRONKO_17_01 " );	// I don't need any trouble. Ask someone else.
	AI_StopProcessInfos(self);
};


instance DIA_Rega_PERMKAP1 (C_Info)
{
	npc = BAU_933_Rega;
	No. = 7 ;
	condition = DIA_Rega_PERMKAP1_Condition;
	information = DIA_Rega_PERMKAP1_Info;
	permanent = TRUE;
	description = "Cheer up!";
};

func int DIA_Rega_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rega_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//Cheer up!

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output (self, other, " DIA_Rega_PERMKAP1_17_01 " );	// Easy for you to say! You live in the city.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output (self, other, " DIA_Rega_PERMKAP1_17_02 " );	// If you mercenaries didn't give us so many problems, life here would be so bearable.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output (self, other, " DIA_Rega_PERMKAP1_17_03 " );	// There are fewer and fewer mages around. I hope you are not the last of them. We need you - now more than ever.
	}
	else
	{
		AI_Output (self, other, " DIA_Rega_PERMKAP1_17_04 " );	// It's not easy working for that murderer Secob.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rega_PICKPOCKET (C_Info)
{
	npc = BAU_933_Rega;
	NO = 900 ;
	condition = DIA_Rega_PICKPOCKET_Condition;
	information = DIA_Rega_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rega_PICKPOCKET_Condition()
{
	return  C_Beklauen ( 25 , 40 );
};

func void DIA_Rega_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
	Info_AddChoice(DIA_Rega_PICKPOCKET,Dialog_Back,DIA_Rega_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rega_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Rega_PICKPOCKET_DoIt);
};

func void DIA_Rega_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
};

func void DIA_Rega_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
};
