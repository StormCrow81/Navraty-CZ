
instance DIA_RodDJG_EXIT(C_Info)
{
	npc = DJG_702_Rod;
	nr = 999;
	condition = DIA_RodDJG_EXIT_Condition;
	information = DIA_RodDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_RodDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_RodDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RodDJG_HELLO (C_Info)
{
	npc = DJG_702_Rod;
	condition = DIA_RodDJG_HALLO_Condition;
	information = DIA_RodDJG_HALLO_Info;
	description = " Are you all right? " ;
};


func int DIA_RodDJG_HALLO_Condition()
{
	if(DJG_SwampParty == FALSE)
	{
		return TRUE;
	};
};

func void DIA_RodDJG_HALLO_Info()
{
	AI_Output(other,self, " DIA_RodDJG_HALLO_15_00 " );	// Are you all right?
	AI_Output(self,other, " DIA_RodDJG_HALLO_06_01 " );	// These boots will kill me! This new armor is very good, but why do the buckles on these boots have to be so tight?
	AI_Output(self,other, " DIA_RodDJG_HALLO_06_02 " );	// And if I loosen them a little, the boots start to fall off my feet.
	if ((Npc_IsDead(SwampDragon) ==  FALSE ) && (DJG_SwampParty ==  FALSE ))
	{
		Info_AddChoice(DIA_RodDJG_HALLO, " What are you waiting for? " ,DIA_RodDJG_HALLO_warten);
	};
	Info_AddChoice(DIA_RodDJG_HALLO, " Where did you get those boots? " ,DIA_RodDJG_HALLO_Woher);
};

func void DIA_RodDJG_HELLO_Where from()
{
	AI_Output(other,self, " DIA_RodDJG_HALLO_Woher_15_00 " );	// Where did you get those boots?
	AI_Output(self,other, " DIA_RodDJG_HALLO_Woher_06_01 " );	// Hardworking old Bennet made them for us dragon hunters and made us pay well.
	AI_Output(self,other, " DIA_RodDJG_HALLO_Woher_06_02 " );	// If I ever get to him, I'll make him eat them first and then beat my money back out of him.
};

func void DIA_RodDJG_HELLO_wait()
{
	AI_Output(other,self, " DIA_RodDJG_HALLO_warten_15_00 " );	// What are you waiting for?
	Info_ClearChoices(DIA_RodDJG_HALLO);
	if (Npc_IsDead(DJG_Cipher) ==  FALSE )
	{
		AI_Output(self,other, " DIA_RodDJG_HALLO_warten_06_01 " );	// When Cypher finally deigns to get his ass up. It's time for us to hit the road.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_RodDJG_HALLO_warten_06_02 " );	// I want to explore that swampy area over there.
		AI_Output(self,other, " DIA_RodDJG_HALLO_warten_06_03 " );	// Do you think we can go there together? Let's see what's over there?
		Info_AddChoice(DIA_RodDJG_HALLO, " I'll go alone. " ,DIA_RodDJG_HALLO_warten_allein);
		Info_AddChoice(DIA_RodDJG_HALLO, " What do you know about this marshland? " ,DIA_RodDJG_HALLO_warten_wasweisstdu);
		Info_AddChoice(DIA_RodDJG_HALLO, " Let's go together. " ,DIA_RodDJG_HALLO_warten_zusammen);
	};
};

func void DIA_RodDJG_HELLO_wait_together()
{
	AI_Output(other,self, " DIA_RodDJG_HALLO_warten_zusammen_15_00 " );	// Let's go together.
	AI_Output(self,other, " DIA_RodDJG_HALLO_warten_zusammen_06_01 " );	// Good. Then follow me.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"SwampWait2");
};

func void DIA_RodDJG_HELLO_wait_whatdoyouknow()
{
	AI_Output(other,self, " DIA_RodDJG_HALLO_warten_wasweisstdu_15_00 " );	// What do you know about this swampy area?
	AI_Output(self,other, " DIA_RodDJG_HALLO_warten_wasweisstdu_06_01 " );	// The stench of it rises to the skies and that there is probably a pile of gold hidden there. Is that not enough?
};

func void DIA_RodDJG_HELLO_waiting_alone()
{
	AI_Output(other,self, " DIA_RodDJG_HALLO_warten_allein_15_00 " );	// I'll go alone.
	AI_Output(self,other, " DIA_RodDJG_HALLO_warten_allein_06_01 " );	// Well, then I wish you good luck.
	AI_StopProcessInfos(self);
};


instances DIA_RodDJG_WARTEMAL (C_Info)
{
	npc = DJG_702_Rod;
	condition = DIA_RodDJG_WARTEMAL_Condition;
	information = DIA_RodDJG_WARTEMAL_Info;
	permanent = TRUE;
	description = " What's wrong with you? " ;
};


func int DIA_RodDJG_WARTEMAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_RodDJG_HALLO) || (DJG_SwampParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_RodDJG_WARTEMAL_Info()
{
	AI_Output(other,self, " DIA_RodDJG_WARTEMAL_15_00 " );	// What's wrong with you?
	if(((DJG_SwampParty == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02") < 1000)) && Npc_IsDead(DJG_Cipher))
	{
		AI_Output(self,other, " DIA_RodDJG_WARTEMAL_06_01 " );	// Listen, boy. I think this creature is a little too tough for us. I'll probably try to slip away quietly.
		DJG_SwampParty = FALSE;
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		AI_Output(self,other, " DIA_RodDJG_WARTEMAL_06_02 " );	// (cursing) These boots! These damn boots!
	};
	if (Npc_IsDead(SwampDragon))
	{
		AI_Output(other,self, " DIA_RodDJG_WARTEMAL_15_03 " );	// And what are you going to do next?
		AI_Output(self,other, " DIA_RodDJG_WARTEMAL_06_04 " );	// Well, first of all, I will buy myself new boots!
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rod_PICKPOCKET(C_Info)
{
	npc = DJG_702_Rod;
	nr = 900;
	condition = DIA_Rod_PICKPOCKET_Condition;
	information = DIA_Rod_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rod_PICKPOCKET_Condition()
{
	return  C_Robbery ( 16 , 320 );
};

func void DIA_Rod_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
	Info_AddChoice(DIA_Rod_PICKPOCKET,Dialog_Back,DIA_Rod_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rod_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rod_PICKPOCKET_DoIt);
};

func void DIA_Rod_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
};

func void DIA_Rod_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
};


instance DIA_ROD_FUCKOFF(C_Info)
{
	npc = DJG_702_Rod;
	nr = 2;
	condition = dia_rod_fuckoff_condition;
	information = dia_rod_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_rod_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_rod_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};
