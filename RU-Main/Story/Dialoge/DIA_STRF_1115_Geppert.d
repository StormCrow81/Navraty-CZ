

instance DIA_Geppert_EXIT (C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 999;
	condition = DIA_Geppert_EXIT_Condition;
	information = DIA_Geppert_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Geppert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Geppert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Geppert_HELLO (C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 4;
	condition = DIA_Geppert_HALLO_Condition;
	information = DIA_Geppert_HALLO_Info;
	important = TRUE;
};


func int DIA_Geppert_HALLO_Condition()
{
	return TRUE;
};


var int Kervo_GotStuff;

func void DIA_Geppert_HALLO_Info()
{
	if ((Npc_IsDead(Kervo) ==  FALSE ) && (Kervo_GotStuff ==  FALSE ))
	{
		if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_GUR ))
		{
			CreateInvItems(Kervo,ItMi_RuneBlank,1);
		}
		else
		{
			CreateInvItems(Kervo,ItMi_Nugget,1);
		};
		Kervo_GotStuff = TRUE;
	};
	AI_Output(self,other, " DIA_Geppert_HALLO_10_00 " );	// Stop! Who goes?
	AI_Output(self,other, " DIA_Geppert_HALLO_10_01 " );	// You didn't come to send me back to the mine? Not?
	AI_Output(self,other, " DIA_Geppert_HALLO_10_02 " );	// I must disappoint you. I won't go back for anything.
	Info_ClearChoices(DIA_Geppert_HELLO);
	Info_AddChoice(DIA_Geppert_HALLO, " What are you doing here? " ,DIA_Geppert_HALLO_Wasmachtihr);
	Info_AddChoice(DIA_Geppert_HALLO, " You're an escaped convict, right? " ,DIA_Geppert_HALLO_Flucht);
};

func void DIA_Geppert_HELLO_Escape()
{
	AI_Output(other,self, " DIA_Geppert_HALLO_Flucht_15_00 " );	// You're an escaped convict, right?
	AI_Output(self,other, " DIA_Geppert_HALLO_Flucht_10_01 " );	// How insightful you are. Why else do you think I crawled into this dirty hole?
	Info_ClearChoices(DIA_Geppert_HELLO);
};

func void DIA_Geppert_HALLO_Whatdoyou()
{
	AI_Output(other,self, " DIA_Geppert_HALLO_Wasmachtihr_15_00 " );	// What are you doing here?
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Geppert_HALLO_Wasmachtihr_10_01 " );	// What kind of idiotic question is this? I am hiding here from your soldiers.
		AI_Output(self,other, " DIA_Geppert_HALLO_Wasmachtihr_10_02 " );	// Stop beating around the bush. Either kill me or get out.
	}
	else
	{
		AI_Output(self,other, " DIA_Geppert_HALLO_Wasmachtihr_10_03 " );	// Stupid question. Hiding! What else? Those militia pigs have spies everywhere.
	};
	AI_Output(self,other, " DIA_Geppert_HALLO_Wasmachtihr_10_04 " );	// I'm not going back to the mine. And point.
	Info_ClearChoices(DIA_Geppert_HELLO);
};


instance DIA_Geppert_BRATEN (C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 5;
	condition = DIA_Geppert_BRATEN_Condition;
	information = DIA_Geppert_BRATEN_Info;
	permanent = TRUE;
	description = " Your roast smells so delicious. " ;
};


func int DIA_Geppert_BRATEN_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Geppert_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Geppert_BRATEN_Info()
{
	AI_Output(other,self, " DIA_Geppert_BRATEN_15_00 " );	// Your roast smells so delicious.
	AI_Output(self,other, " DIA_Geppert_BRATEN_10_01 " );	// Don't touch!
	AI_StopProcessInfos(self);
};


instance DIA_Geppert_PICKPOCKET (C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 900;
	condition = DIA_Geppert_PICKPOCKET_Condition;
	information = DIA_Geppert_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Geppert_PICKPOCKET_Condition()
{
	return  C_Robbery ( 56 , 5 );
};

func void DIA_Geppert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
	Info_AddChoice(DIA_Geppert_PICKPOCKET,Dialog_Back,DIA_Geppert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Geppert_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Geppert_PICKPOCKET_DoIt);
};

func void DIA_Geppert_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
};

func void DIA_Geppert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
};

