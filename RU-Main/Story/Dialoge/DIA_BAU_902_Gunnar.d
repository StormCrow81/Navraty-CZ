instance DIA_Gunnar_EXIT(C_Info)
{
	npc = BAU_902_Gunnar;
	No. = 999 ;
	condition = DIA_Gunnar_EXIT_Condition;
	information = DIA_Gunnar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Gunnar_HalloGesagt;

instance DIA_Gunnar_Hallo (C_Info)
{
	npc = BAU_902_Gunnar;
	no. = 1 ;
	condition = DIA_Gunnar_Hallo_Condition;
	information = DIA_Gunnar_Hallo_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Gunnar_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Gunnar_Hallo_Info ()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//How are you?
	if(other.guild == GIL_NONE)
	{
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_01 " );	// Ever since Onar announced that he was recruiting mercenaries, this place has been swarming with bandits.
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_02 " );	// All the rabble that previously did not have the courage to leave the forest are now coming here.
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_03 " );	// They're worse than rats leaving a sinking ship...
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_04 " );	// So you're a mercenary too now, hmm?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_05 " );	// May Innos be with you!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_06 " );	// People from the city are not welcome here.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_07 " );	// Are you one of these insane cultists? Watch yourself around here.
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_08 " );	// Adanos is with you, I can tell!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output (self, other, " DIA_Gunnar_Hallo_10_09 " );	// A Necromancer, here? Please don't curse us!
	};
	Gunnar_HalloGesagt = TRUE;
};


instance DIA_Gunnar_Everywhere(C_Info)
{
	npc = BAU_902_Gunnar;
	no. = 2 ;
	condition = DIA_Gunnar_Everywhere_Condition;
	information = DIA_Gunnar_Everywhere_Info;
	permanent = TRUE;
	description = " Do mercenaries come from everywhere? " ;
};


func int DIA_Gunnar_Everywhere_Condition()
{
	if(Gunnar_HalloGesagt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Everywhere_Info()
{
	AI_Output (other, self, " DIA_Gunnar_Everywhere_15_00 " );	// Where are all these mercs coming from?
	AI_Output (self, other, " DIA_Gunnar_Everywhere_10_01 " );	// Most of them came from the colony.
	AI_Output (self, other, " DIA_Gunnar_Everywhere_10_02 " );	// Another group of mercenaries came from the south, where they probably hunted orcs.
	AI_Output (self, other, " DIA_Gunnar_Everywhere_10_03 " );	// And I swear that some of the bandits from the mountains came here to get free food too!
};


instance DIA_Gunnar_South(C_Info)
{
	npc = BAU_902_Gunnar;
	No. = 3 ;
	condition = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent = TRUE;
	description = " What do you know about the mercenaries from the south? " ;
};


func int DIA_Gunnar_South_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_South_Info()
{
	AI_Output (other, self, " DIA_Gunnar_South_15_00 " );	// What do you know about the mercenaries from the south?
	AI_Output (self, other, " DIA_Gunnar_South_10_01 " );	// A little bit. As far as I know, they hunted orcs there.
	AI_Output (self, other, " DIA_Gunnar_South_10_02 " );	// Their boss is Silvio. Bulko, Sentenza, Raul and a few other guys work for him ...
};


instance DIA_Gunnar_Colony(C_Info)
{
	npc = BAU_902_Gunnar;
	No. = 4 ;
	condition = DIA_Gunnar_Colony_Condition;
	information = DIA_Gunnar_Colony_Info;
	permanent = TRUE;
	description = " Who came from the colony? " ;
};


func int DIA_Gunnar_Colony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Colony_Info()
{
	AI_Output (other, self, " DIA_Gunnar_Colony_15_00 " );	// Who came from the colony?
	AI_Output (self, other, " DIA_Gunnar_Colony_10_01 " );	// Lee and his people. Thorlof, Kord, Jarvis, Wolf and a few others.
};


instance DIA_Gunnar_Bandits(C_Info)
{
	npc = BAU_902_Gunnar;
	No. = 5 ;
	condition = DIA_Gunnar_Bandits_Condition;
	information = DIA_Gunnar_Bandits_Info;
	permanent = TRUE;
	description = " Who are these bandits you are talking about? " ;
};


func int DIA_Gunnar_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Bandits_Info()
{
	AI_Output (other, self, " DIA_Gunnar_Bandits_15_00 " );	// And who are these bandits you are talking about?
	AI_Output (self, other, " DIA_Gunnar_Bandits_10_01 " );	// Oh, it's me just like that. To be honest, I'm not entirely sure about that.
	AI_Output (self, other, " DIA_Gunnar_Bandits_10_02 " );	// This valley is dotted with caves and abandoned mines. Some of the bandits are hiding there.
	AI_Output (self, other, " DIA_Gunnar_Bandits_10_03 " );	// They are also convicts from the colony, like most of the mercenaries here.
	AI_Output (self, other, " DIA_Gunnar_Bandits_10_04 " );	// Many of these men are ruthless, cold blooded killers. Keep your distance if you can help it.
};


instance DIA_Gunnar_PICKPOCKET(C_Info)
{
	npc = BAU_902_Gunnar;
	NO = 900 ;
	condition = DIA_Gunnar_PICKPOCKET_Condition;
	information = DIA_Gunnar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gunnar_PICKPOCKET_Condition()
{
	return  C_Beklauen ( 45 , 70 );
};

func void DIA_Gunnar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
	Info_AddChoice (DIA_Gunnar_PICKPOCKET, Dialog_Back, DIA_Gunnar_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Gunnar_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Gunnar_PICKPOCKET_DoIt);
};

func void DIA_Gunnar_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};

func void DIA_Gunnar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};
