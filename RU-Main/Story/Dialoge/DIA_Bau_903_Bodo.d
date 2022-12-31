
instance DIA_Bodo_EXIT(C_Info)
{
	npc = Smell_903_Bodo;
	nr = 999;
	condition = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Bodo_Hallo (C_Info)
{
	npc = Smell_903_Bodo;
	nr = 1;
	condition = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hello_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Hello_Info()
{
	AI_Output(other,self, " DIA_Bodo_Hallo_15_00 " );	// How are you?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Bodo_Hallo_12_01 " );	// The militia has drunk enough of our blood. Now that the mercenaries are on our side, they won't even dare to show themselves here.
		AI_Output(self,other, " DIA_Bodo_Hallo_12_02 " );	// The king probably thinks he can afford everything. But we won't take it anymore!
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Bodo_Hallo_12_03 " );	// Good. If you see the militia, give them a good beating.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Bodo_Hallo_12_04 " );	// Good. May Innos be with you.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Bodo_Hallo_12_05 " );	// The King's people are out of place here.
		AI_Output(self,other, " DIA_Bodo_Hallo_12_06 " );	// Many will still talk to you, but you are unlikely to earn their favor.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Bodo_Hallo_12_07 " );	// Since when did guys like you get interested in other people's problems? You only have a swamp on your mind!
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Bodo_Hallo_12_08 " );	// All is well. Adanos be with you!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Bodo_Hallo_12_09 " );	// (stuttering) All is well. Just great! I'll go, okay?
	};
};


instance DIA_Bodo_Bauernaufstand (C_Info)
{
	npc = Smell_903_Bodo;
	nr = 2;
	condition = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent = FALSE;
	description = " The town is talking about the farmers' uprising! " ;
};


func int DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output(other,self, " DIA_Bodo_Bauernaufstand_15_00 " );	// There's talk of a farmers' rebellion in town!
	AI_Output(self,other, " DIA_Bodo_Bauernaufstand_12_01 " );	// Nonsense. We don't do anything like that. We only protect what we have earned with hard work.
	AI_Output(self,other, " DIA_Bodo_Bauernaufstand_12_02 " );	// It is truly true that wars are won on the backs of peasants. But Onar is no longer going to just stand by and watch the king drink our blood.
};


instances of DIA_Bodo_Bett (C_Info)
{
	npc = Smell_903_Bodo;
	nr = 3;
	condition = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent = FALSE;
	description = " Can I rest here somewhere? " ;
};


func int DIA_Bodo_Bett_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bed_Info()
{
	AI_Output(other,self, " DIA_Bodo_Bett_15_00 " );	// Can I rest here somewhere?
	AI_Output(self,other, " DIA_Bodo_Bett_12_01 " );	// If you're looking for a place to sleep, go to the barn. But just do not lie down on the bed of a mercenary by mistake.
	AI_Output(self,other, " DIA_Bodo_Bett_12_02 " );	// Onar makes sure they don't touch us farmers, but that doesn't apply to strangers who don't work on the farm. Mercenaries can do whatever they want with them.
};


instances of DIA_Bodo_Cipher (C_Info)
{
	npc = Smell_903_Bodo;
	nr = 4;
	condition = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent = FALSE;
	description = " Cypher told me that someone stole a bale of swamp grass from him. " ;
};


func int DIA_Bodo_Cipher_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) || (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bodo_Cipher_Info()
{
	AI_Output(other,self, " DIA_Bodo_Cipher_15_00 " );	// Cypher told me that someone stole a bale of swamp grass from him.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//И?
	AI_Output(other,self, " DIA_Bodo_Cipher_15_02 " );	// He thinks you did it.
	AI_Output(self,other, " DIA_Bodo_Cipher_12_03 " );	// Oh, THIS is why that guy is staring at me like that all the time.
	AI_Output(self,other, " DIA_Bodo_Cipher_12_04 " );	// I've been trying to be as friendly as possible with him lately, because it looks like he's got murder on his mind.
	AI_Output(self,other, " DIA_Bodo_Cipher_12_05 " );	// I try to smile at him, and in response, he looks as if he wants to kill me.
};


instances of DIA_Bodo_WeedOrElse (C_Info)
{
	npc = Smell_903_Bodo;
	nr = 5;
	condition = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent = FALSE;
	description = " Give me this herb or. " ;
};


func int DIA_Bodo_WeedOrElse_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedOrElse_Info()
{
	AI_Output(other,self, " DIA_Bodo_WeedOrElse_15_00 " );	// Give me the herbs.
	AI_Output(self,other, " DIA_Bodo_WeedOrElse_12_01 " );	// Look, all I have is one shoal of swamp grass. Take it and leave me alone.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Bodo_WeedOrElse_12_02 " );	// You know how Onar's mercenaries protect us, don't you?
		AI_Output(self,other, " DIA_Bodo_WeedOrElse_12_03 " );	// So don't even try to do something stupid!
	};
};


instance DIA_Bodo_WeedPERM(C_Info)
{
	npc = Smell_903_Bodo;
	nr = 6;
	condition = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent = TRUE;
	description = " I don't believe a word you say. Give me that herb! " ;
};


func int DIA_Bodo_WeedPERM_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedPERM_Info()
{
	AI_Output(other,self, " DIA_Bodo_WeedPERM_15_00 " );	// I don't believe a single word you say. Give me that weed!
	AI_Output(self,other, " DIA_Bodo_WeedPERM_12_01 " );	// I don't have it. Honestly.
};


instances DIA_Bodo_PICKPOCKET (C_Info)
{
	npc = Smell_903_Bodo;
	nr = 900;
	condition = DIA_Bodo_PICKPOCKET_Condition;
	information = DIA_Bodo_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bodo_PICKPOCKET_Condition()
{
	return  C_Robbery ( 30 , 60 );
};

func void DIA_Bodo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,Dialog_Back,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

