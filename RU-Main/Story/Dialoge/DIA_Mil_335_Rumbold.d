

instance DIA_Rumbold_EXIT(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 999;
	condition = DIA_Rumbold_EXIT_Condition;
	information = DIA_Rumbold_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rumbold_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rumbold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rumbold_PrePerm(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_PrePerm_Condition;
	information = DIA_Rumbold_PrePerm_Info;
	permanent = TRUE;
	description = " What are you doing here? " ;
};


func int DIA_Rumbold_PrePerm_Condition()
{
	if ( ! Npc_KnowsInfo(other,DIA_Bengar_MILIZATIONCLASS))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_PrePerm_Info()
{
	AI_Output(other,self, " DIA_Rumbold_PrePerm_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Rumbold_PrePerm_10_01 " );	// Get lost! Understood?
	AI_StopProcessInfos(self);
};


instance DIA_Rumbold_Hallo(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_Hallo_Condition;
	information = DIA_Rumbold_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Rumbold_Hallo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_MILIZATION_CLASS ) )
	{
		return TRUE;
	};
};

func void DIA_Rumbold_Hallo_Info()
{
	AI_Output(self,other, " DIA_Rumbold_Hallo_10_00 " );	// Look at him! Another clown! What are you doing here, huh?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Rumbold_Hallo_10_01 " );	// Who the hell are you?
	}
	else
	{
		AI_Output(self,other, " DIA_Rumbold_Hallo_10_02 " );	// Another one of those dirty mercenaries!
	};
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hello, " Я никто. " ,DIA_Rumbold_HELLO_tuck);
	Info_AddChoice(DIA_Rumbold_Hallo, " I want you to disappear from here. " ,DIA_Rumbold_HALLO_verschwindet);
	Info_AddChoice(DIA_Rumbold_Hallo, " I'm your worst nightmare. " ,DIA_Rumbold_HALLO_Attack);
};

func void DIA_Rumbold_HALLO_Attack()
{
	AI_Output(other,self, " DIA_Rumbold_HALLO_Attack_15_00 " );	// I'm your worst nightmare.
	AI_Output(self,other, " DIA_Rumbold_HALLO_Attack_10_01 " );	// Consider yourself dead!
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hello,Dialog_End,DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HELLO_disappears()
{
	AI_Output(other,self, " DIA_Rumbold_HALLO_verschwindet_15_00 " );	// I want you to disappear from here.
	AI_Output(self,other, " DIA_Rumbold_HALLO_verschwindet_10_01 " );	// Well, well. So you want us to disappear?
	AI_Output(self,other, " DIA_Rumbold_HALLO_verschwindet_10_02 " );	// (threateningly) What happens if we don't, hey?
	Info_ClearChoices(DIA_Rumbold_Hallo);

	if(RhetorikSkillValue[1] >= 20)
	{
		Info_AddChoice(DIA_Rumbold_Hallo, " What if I pay you to get out of here? " ,DIA_Rumbold_HALLO_geld);
	};

	Info_AddChoice(DIA_Rumbold_Hallo, " In that case, you can never disturb these farmers again. " ,DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output(other,self, " DIA_Rumbold_HALLO_AufsMaul_15_00 " );	// In that case, you'll never be able to disturb those farmers again.
	AI_Output(self,other, " DIA_Rumbold_HALLO_AufsMaul_10_01 " );	// You bit off more than you can chew, idiot!
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hello,Dialog_End,DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HELLO_money()
{
	AI_Output(other,self, " DIA_Rumbold_HALLO_geld_15_00 " );	// What if I pay you to get out of here?
	AI_Output(self,other, " DIA_Rumbold_HALLO_geld_10_01 " );	// Do you want to pay for Bengar? This is another matter.
	AI_Output(self,other, " DIA_Rumbold_HALLO_geld_10_02 " );	// Let me think. Considering everything he owes us, that would be sixty-five gold pieces.
	AI_Output(self,other, " DIA_Rumbold_HALLO_geld_10_03 " );	// Either pay or get out of the way.
	AI_Output(self,other, " DIA_Rumbold_HALLO_geld_10_04 " );	// Oh. What are you, treasurer of Bengar?
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo, " Are you crazy? This is too much. " ,DIA_Rumbold_HALLO_Geld_TooMuch);

	if(Npc_HasItems(other,ItMi_Gold) >= 65)
	{
		Info_AddChoice(DIA_Rumbold_Hallo, " Here's the money. Now get lost. " ,DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HELLO_money_ok()
{
	AI_Output(other,self, " DIA_Rumbold_HALLO_geld_ok_15_00 " );	// Here's the money. Now get lost.
	B_GiveInvItems(other,self,ItMi_Gold,65);
	AI_Output(self,other, " DIA_Rumbold_HALLO_geld_ok_10_01 " );	// I don't care who pays for Bengar. Good luck. (under his breath) Cretin!
	AI_StopProcessInfos(self);
	Rumbold_Paid = TRUE ;
	Npc_ExchangeRoutine(self,"Start");

	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"Start");
		AI_ContinueRoutine(Rick);
	};
	if(Hlp_IsValidNpc(Bengar) && !Npc_IsDead(Bengar))
	{
		Npc_ExchangeRoutine(Bengar,"Start");
		AI_ContinueRoutine(Bengar);
	};
};

func void DIA_Rumbold_HALLO_Geld_TooMuch()
{
	AI_Output(other,self, " DIA_Rumbold_HALLO_geld_TooMuch_15_00 " );	// Are you crazy? It's too much.
	AI_Output(self,other, " DIA_Rumbold_HALLO_geld_TooMuch_10_01 " );	// Then get out of the way!
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HELLO_pulltail()
{
	AI_Output(other,self, " DIA_Rumbold_HALLO_schwanzeinziehen_15_00 " );	// I'm nobody.
	AI_Output(self,other, " DIA_Rumbold_HALLO_schwanzeinziehen_10_01 " );	// Then get out of my way!
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_FightNow(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_FightNow_Condition;
	information = DIA_Rumbold_FightNow_Info;
	permanent = TRUE;
	description = " Leave this farmer alone! " ;
};


func int DIA_Rumbold_FightNow_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rumbold_Hello ) && ( Rumbold_Personalized ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_FightNow_Info()
{
	AI_Output(other,self, " DIA_Rumbold_FightNow_15_00 " );	// Leave this farmer alone!
	AI_Output(self,other, " DIA_Rumbold_FightNow_10_01 " );	// Are you deaf, son?
	Info_ClearChoices(DIA_Rumbold_FightNow);
	Info_AddChoice(DIA_Rumbold_FightNow,Dialog_Ende,DIA_Rumbold_FightNow_ENDAttack);
};

func void DIA_Rumbold_FightNow_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_StillThere(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_StillThere_Condition;
	information = DIA_Rumbold_StillThere_Info;
	permanent = TRUE;
	description = " Are you still here?! " ;
};


func int DIA_Rumbold_StillThere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rumbold_Hallo) && (Rumbold_Bezahlt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_StillThere_Info()
{
	AI_Output(other,self, " DIA_Rumbold_StillThere_15_00 " );	// Are you still here?!
	AI_Output(self,other, " DIA_Rumbold_StillThere_10_01 " );	// Now you will dance with me!
	Info_ClearChoices(DIA_Rumbold_StillThere);
	Info_AddChoice(DIA_Rumbold_StillThere,Dialog_Ende,DIA_Rumbold_StillThere_ENDAttack);
};

func void DIA_Rumbold_StillThere_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_PICKPOCKET(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 900;
	condition = DIA_Rumbold_PICKPOCKET_Condition;
	information = DIA_Rumbold_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rumbold_PICKPOCKET_Condition()
{
	return  C_Robbery ( 24 , 45 );
};

func void DIA_Rumbold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET,Dialog_Back,DIA_Rumbold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rumbold_PICKPOCKET_DoIt);
};

func void DIA_Rumbold_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

func void DIA_Rumbold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

