
instance DIA_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 999;
	condition = DIA_Addon_Raven_EXIT_Condition;
	information = DIA_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

instance DIA_Addon_Raven_Hi(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 1;
	condition = DIA_Addon_Raven_Hi_Condition;
	information = DIA_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_Hi_Info()
{
	if(RavenDoorClosed == FALSE)
	{
		Wld_SendTrigger("EVT_ADANOS_ROOM_RAVENPRAY");
		RavenDoorClosed = TRUE;
	};

	AI_Output(self,other, " DIA_Addon_Raven_Add_10_00 " );	// Look who's here.

	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(other,ItMi_TempelTorKey) >= 1)
	{
		Npc_RemoveInvItems(other,ItMi_TempelTorKey,1);
	};

	AI_Output(self,other, " DIA_Addon_Raven_Add_10_01 " );	// The master warned me that Innos would send his servant.
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_02 " );	// But I didn't think you'd come so soon.
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_03 " );	// Well, since you were in such a hurry, (laughs) then your death will be quick.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi, " You're right, one of us will die. And it will be you! " ,DIA_Addon_Raven_Hi_DU);
	Info_AddChoice(DIA_Addon_Raven_Hi, " You sold your soul to Beliar! " ,DIA_Addon_Raven_Hi_Soul);
};

func void DIA_Addon_Raven_Hi_DU()
{
	AI_Output(other,self, " DIA_Addon_Raven_Add_15_00 " );	// You're right, one of us will die. And it will be you!
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_04 " );	// You can't handle me. I have Beliar's sword!
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_05 " );	// I will lead an army of dragons to the continent. Together we will plunge the world of people into eternal darkness!
};

func void DIA_Addon_Raven_Hi_Soul()
{
	AI_Output(other,self, " DIA_Addon_Raven_Add_15_01 " );	// You sold your soul to Beliar!
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_06 " );	// Yes, and for a good price. I will become the general of his armies.
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_07 " );	// What about you? Do you know how much YOUR soul is worth?
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi, " Enough! Let's get down to business. " ,DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi, " I just do what needs to be done. " ,DIA_Addon_Raven_Hi_only);
};

func void DIA_Addon_Raven_Hi_only()
{
	AI_Output(other,self, " DIA_Addon_Raven_Add_15_02 " );	// I'm just doing what needs to be done.
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_08 " );	// Just listen! You sent me a humble slave, Innos!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi, " Enough! Let's get down to business. " ,DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi, " Are you sure I serve Innos? " ,DIA_Addon_Raven_Hi_Sure);
};

func void DIA_Addon_Raven_Hi_Sure()
{
	AI_Output(other,self, " DIA_Addon_Raven_Add_15_03 " );	// Are you sure I serve Innos?
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_09 " );	// What? What are you talking about?
	AI_Output(other,self, " DIA_Addon_Raven_Add_15_04 " );	// You didn't think that I could be the executor of the will of Adanos?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//Чепуха!
	AI_Output(other,self, " DIA_Addon_Raven_Add_15_05 " );	// Maybe I also serve Beliar? Or just to yourself?
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_11 " );	// Well, in that case, you're not even my opponent!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi, " Enough! Let's get down to business. " ,DIA_Addon_Raven_Hi_Attack);
};

func void DIA_Addon_Raven_Hi_Attack()
{
	AI_Output(other,self, " DIA_Addon_Raven_Add_15_06 " );	// Enough! Let's get down to business.
	AI_Output(self,other, " DIA_Addon_Raven_Add_10_12 " );	// Are you in such a hurry to die?...(grins) Well, since you insist!
	AI_StopProcessInfos(self);
	RavenCanAway = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


// ---------------Equal to plateau------------------------------

instance DIA_BDT_2090_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_2090_Addon_Raven;
	nr = 999;
	condition = DIA_BDT_2090_Addon_Raven_EXIT_Condition;
	information = DIA_BDT_2090_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_BDT_2090_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_2090_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	self.aivar[AIV_EnemyOverride] = FALSE ;
};

instance DIA_BDT_2090_Addon_Raven_Hi(C_Info)
{
	npc = BDT_2090_Addon_Raven;
	nr = 1;
	condition = DIA_BDT_2090_Addon_Raven_Hi_Condition;
	information = DIA_BDT_2090_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_BDT_2090_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_BDT_2090_Addon_Raven_Hi_Info()
{
	B_GivePlayerXP(1000);
	Wld_SendTrigger("EVT_RAVENTEMPLEDOOR_MAIN_01");

	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};

	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_01_00 " );	// So. So you are the one whom Adanos chose as his chosen one!
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_01_01 " );	// Frankly, I'm a little disappointed with what I saw. Even though you were able to get here.
	AI_Output(other,self, " DIA_BDT_2090_Addon_Raven_Hi_01_03 " );	// Raven?! So you are the evil that the guard in front of the temple spoke of?
	AI_Output(other,self, " DIA_BDT_2090_Addon_Raven_Hi_01_04 " );	// Is it me or have you really changed a little since we last met?
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_01_05 " );	// I have many names, and they all mean little to me. As is my appearance.
	AI_Output(other,self, " DIA_BDT_2090_Addon_Raven_Hi_01_06 " );	// But you carry the Claw of Beliar! And its last owner was the ore baron Raven.
	AI_Output(other,self, " DIA_BDT_2090_Addon_Raven_Hi_01_07 " );	// And you look almost like him. Only a little changed in the face.
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_01_08 " );	// My master bestowed upon me the token of his power and the soul of that nonentity who dared to wear this mighty artifact.
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_01_09 " );	// You can learn the rest from him when you find yourself in the realm of the dead.
	Info_ClearChoices(DIA_BDT_2090_Addon_Raven_Hi);
	Info_AddChoice(DIA_BDT_2090_Addon_Raven_Hi, " So who are you really? " ,DIA_BDT_2090_Addon_Raven_Hi_Who);
};

func void DIA_BDT_2090_Addon_Raven_Hi_Who()
{
	AI_Output(other,self, " DIA_BDT_2090_Addon_Raven_Hi_Who_01_00 " );	// So who are you really?
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_Who_01_01 " );	// (laughs) Don't you understand that?
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_Who_01_02 " );	// Take a look at yourself - and you will understand what is the answer to your question.
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_Who_01_03 " );	// Since ancient times, the gods have been fighting each other for power in this world...
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_Who_01_04 " );	// Fight with the hands of their chosen ones. People like you or me.
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_Who_01_05 " );	// Our meeting with you will solve almost nothing in the war that has been raging for many millennia.
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_Who_01_06 " );	// But the fewer like you there are in my path, the greater the chance that my master will win the final victory in it!
	AI_Output(self,other, " DIA_BDT_2090_Addon_Raven_Hi_Who_01_07 " );	// It's time to find out who deserves to be the winner today, and who will be forgotten forever!
	Info_ClearChoices(DIA_BDT_2090_Addon_Raven_Hi);
	Info_AddChoice(DIA_BDT_2090_Addon_Raven_Hi,Dialog_Ende,DIA_BDT_2090_Addon_Raven_Hi_Exit);
};

func void DIA_BDT_2090_Addon_Raven_Hi_Exit()
{
	RavenCanKill = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Summon");
	Wld_InsertNpc(Raven_Mummy_01,"FP_ROAM_RAVENGUARD_01");
	Wld_InsertNpc(Raven_Mummy_02,"FP_ROAM_RAVENGUARD_02");
	Wld_InsertNpc(Raven_Mummy_03,"FP_ROAM_RAVENGUARD_03");
	Wld_InsertNpc(Raven_Mummy_04,"FP_ROAM_RAVENGUARD_04");
};
